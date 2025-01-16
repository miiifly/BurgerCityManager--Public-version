using BurrgerCity.Data;
using BurrgerCity.Gameplay.BurgerShop;
using BurrgerCity.Gameplay.Spawn;
using BurrgerCity.Utilities;
using MEC;
using System;
using System.Collections.Generic;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class ClientComponent : MonoBehaviour, IClientComponent
	{
		[SerializeField]
		private BurgerType _burgerType = BurgerType.None;

		GameObject IBaseSpawnable.GameObject => gameObject ?? null;
		int IBaseSpawnable.SpawnableTypeID => _burgerType.GetHashCode();

		private bool _isHungry;
		public bool IsHungry => _isHungry;

		event Action<IClientComponent> IClientComponent.OnFeed
		{
			add { _onFeed += value; }
			remove { _onFeed -= value; }
		}

		private Action<IClientComponent> _onFeed;

		private CoroutineHandle _hungerCoroutine;

		private IColliderSystem<IClientComponent> _clientColliderSystem;
		private IPedestrianMovement _pedestrianMovement;
		private IShopsManager _burgerShopsManager;
		private ClientSettings _settings;
		private ClientsData _data;
		private Collider _collider;

		[Inject]
		public void ResolveReferences(
			IColliderSystem<IClientComponent> clientColliderSystem,
			IPedestrianMovement pedestrianMovement,
			IShopsManager burgerShopsManager,
			ClientSettings settings,
			ClientsData data,
			Collider collider)
		{
			_clientColliderSystem = clientColliderSystem;
			_pedestrianMovement = pedestrianMovement;
			_burgerShopsManager = burgerShopsManager;
			_settings = settings;
			_data = data;
			_collider = collider;
		}

		private void OnEnable()
		{
			_clientColliderSystem.Register(_collider, this);
		}

		private void OnDisable()
		{
			_clientColliderSystem.Unregister(_collider);
			_data.ClientsHungry--;
		}

		void IClientComponent.Initialize()
		{
			_pedestrianMovement.StartMove();

			if (!_settings.IsHungryAtStart)
			{
				_hungerCoroutine = Timing.RunCoroutine(HungerTimer(_settings.HungerTime));
				_isHungry = true;
			}
			else
			{
				_pedestrianMovement.SetPriority(_burgerShopsManager.GetBurgerShopForType(this));
			}
		}

		void IClientComponent.Finalized()
		{
			Timing.KillCoroutines(_hungerCoroutine);
			_isHungry = false;
			_pedestrianMovement.StopMove();
		}

		void IClientComponent.Feed()
		{
			_onFeed?.Invoke(this);
		}

		private IEnumerator<float> HungerTimer(float time)
		{
			yield return Timing.WaitForSeconds(time);
			_isHungry = true;
			_pedestrianMovement.SetPriority(_burgerShopsManager.GetBurgerShopForType(this));
			_data.ClientsHungry++;
		}
	}
}
