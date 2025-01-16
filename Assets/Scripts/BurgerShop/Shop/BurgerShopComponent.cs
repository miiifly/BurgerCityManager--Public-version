using BurrgerCity.Gameplay.Client;
using BurrgerCity.Gameplay.Spawn;
using BurrgerCity.Gameplay.UI;
using BurrgerCity.Utilities;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public class BurgerShopComponent : MonoBehaviour, IBurgerShopComponent
	{
		[SerializeField]
		private BurgerType _burgerType = BurgerType.None;

		[SerializeField]
		private Collider _collider;

		GameObject IBaseSpawnable.GameObject => gameObject;
		int IBaseSpawnable.SpawnableTypeID => _burgerType.GetHashCode();

		Vector3 IBurgerShopComponent.Position => transform.position;

		private IBurgerShopIndicator _burgerShopIndicator;

		private IBurgerShopManager _burgerShopManager;
		private IColliderSystem<IBurgerShopComponent> _colliderSystem;

		[Inject]
		public void ResolveReferences(IBurgerShopManager burgerShopManager, IColliderSystem<IBurgerShopComponent> colliderSystem)
		{
			_burgerShopManager = burgerShopManager;
			_colliderSystem = colliderSystem;
		}

		private void OnEnable()
		{
			_colliderSystem.Register(_collider, this);
			_burgerShopManager.BurgersConsumed += BurgerCook;
			_burgerShopManager.BurgersDecreased += BurgerFeed;
		}
		private void OnDisable()
		{
			_colliderSystem.Unregister(_collider);
			_burgerShopManager.BurgersConsumed -= BurgerCook;
			_burgerShopManager.BurgersDecreased -= BurgerFeed;
		}

		void IBurgerShopComponent.RequestClient(IClientComponent clinet)
		{
			_burgerShopManager.RequestBurger(clinet);
		}

		void IBurgerShopComponent.SetIndicator(IBurgerShopIndicator indicator)
		{
			_burgerShopIndicator = indicator;
		}

		void IBurgerShopComponent.FeedClients()
		{
			_burgerShopManager.FeedClients();
		}

		private void BurgerCook()
		{
			_burgerShopIndicator.ChangeBurgerCount();

		}
		private void BurgerFeed(int count)
		{
			_burgerShopIndicator.ChangeBurgerCount(count, true);
		}
	}
}

