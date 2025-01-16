using BurrgerCity.Gameplay.Burger;
using BurrgerCity.Gameplay.Client;
using BurrgerCity.Gameplay.Spawn;
using BurrgerCity.Utilities;
using MEC;
using ModestTree;
using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public class BurgerShopManager : IBurgerShopManager
	{
		private Transform _sphereCaster;

		//Only for gizmo
		[SerializeField]
		private float _feelRadius;


		private Queue<IClientComponent> _waitingQueue;
		private Queue<IEnumerator<float>> _cookingQueue;

		private CoroutineHandle _cookCoroutine;
		private int _burgersCount;

		event Action IBurgerShopManager.BurgersConsumed
		{
			add { _burgersConsumed += value; }
			remove { _burgersConsumed -= value; }
		}

		event Action<int> IBurgerShopManager.BurgersDecreased
		{
			add { _burgersDecreased += value; }
			remove { _burgersDecreased -= value; }
		}

		private Action _burgersConsumed;
		private Action<int> _burgersDecreased;

		public bool isBurgersPending => _cookingQueue != null && !_cookingQueue.IsEmpty();

		private BurgerShopSettings _settigs;
		private Transform _burrgerSpawnPosition;


		private IColliderSystem<IClientComponent> _colliderSystem;
		private IObjectPool<BurgerComponent> _burrgerPool;

		[Inject]
		public void ResolveReferences(IColliderSystem<IClientComponent> colliderSystem, IObjectPool<BurgerComponent> burgerPool)
		{
			_colliderSystem = colliderSystem;
			_burrgerPool = burgerPool;
		}

		public BurgerShopManager(BurgerShopSettings settigs, Transform burrgerSpawnPosition)
		{
			_settigs = settigs;
			_burrgerSpawnPosition = burrgerSpawnPosition;
			_sphereCaster = burrgerSpawnPosition;

			_waitingQueue = new Queue<IClientComponent>();
			_cookingQueue = new Queue<IEnumerator<float>>();
		}


		void IBurgerShopManager.RequestBurger(IClientComponent clinet)
		{
			if (_waitingQueue.Contains(clinet))
			{
				return;
			}
			_waitingQueue.Enqueue(clinet);
			_cookingQueue.Enqueue(Cook());
		}

		void IBurgerShopManager.CookBurger()
		{
			if (!_cookCoroutine.IsRunning)
			{
				_cookCoroutine = Timing.RunCoroutine(Cook());
				_cookingQueue.Dequeue();
			}
		}

		void IBurgerShopManager.FeedClients()
		{
			Debug.LogWarning($"Burger count {_burgersCount}");
			if (_burgersCount == 0)
			{
				return;
			}

			Collider[] hitColliders = Physics.OverlapSphere(_sphereCaster.position, _settigs.FeedRadius);
			int peopleFed = 0;

			foreach (var hitCollider in hitColliders)
			{
				if (_burgersCount <= 0 || peopleFed >= _burgersCount) break;

				if (_colliderSystem.TryGetValue(hitCollider, out var client) && client.IsHungry)
				{
					BurgerComponent burger = _burrgerPool.Get(_settigs.TypeID);

					if (burger == null)
					{
						break;
					}

					burger.transform.position = _burrgerSpawnPosition.position;

					Timing.RunCoroutine(MoveBurgerToClient(burger, client, () =>
					{
						client.Feed();
						_burrgerPool.Release(burger);
					}));

					peopleFed++;
				}
			}

			_burgersDecreased?.Invoke(peopleFed);
			_burgersCount -= peopleFed;
		}

		private IEnumerator<float> MoveBurgerToClient(BurgerComponent burger, IClientComponent client, Action onReached)
		{
			var duration = 1.0f;
			var startPosition = burger.transform.position;
			var endPosition = client.GameObject.transform.position;
			var elapsed = 0f;

			while (elapsed < duration)
			{
				endPosition = client.GameObject.transform.position;
				burger.transform.position = Vector3.Lerp(startPosition, endPosition, elapsed / duration);
				elapsed += Time.deltaTime;
				yield return Timing.WaitForOneFrame;
			}

			burger.transform.position = endPosition;
			onReached?.Invoke();
		}

		private IEnumerator<float> Cook()
		{
			yield return Timing.WaitForSeconds(_settigs.CookTime);

			_burrgerPool.Prepare(_settigs.TypeID, 1);
			_burgersCount++;
			_burgersConsumed.Invoke();
		}

		private void OnDrawGizmos()
		{
			Gizmos.color = Color.green;
			Gizmos.DrawWireSphere(_sphereCaster.position, _feelRadius);
		}
	}

	[CustomEditor(typeof(BurgerShopManager), true)]
	public class PointComponentEditor : Editor
	{
		public override void OnInspectorGUI()
		{
			DrawDefaultInspector();

			var myScript = target as IBurgerShopManager;

			if (GUILayout.Button("Feed"))
			{
				myScript.FeedClients();
			}
		}
	}
}

