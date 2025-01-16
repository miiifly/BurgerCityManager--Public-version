using BurrgerCity.Gameplay.BurgerShop;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Spawn
{
	public class SpawnerInstaller : MonoInstaller
	{
		[SerializeField]
		private Transform _burgerShopParent;
		[SerializeField]
		private BurgerShopPreset _burgerShopPreset;

		public override void InstallBindings()
		{
			Container.BindInstance(_burgerShopPreset);

			var burgerShopSpawner = new BaseSpawner<IBurgerShopComponent>(_burgerShopParent, Container, _burgerShopPreset.Components);

			Container.Bind<ISpawner<IBurgerShopComponent>>().FromInstance(burgerShopSpawner).AsSingle().NonLazy();
		}
	}
}

