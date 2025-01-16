using BurrgerCity.Gameplay.BurgerShop;
using BurrgerCity.Gameplay.Client;
using Zenject;

namespace BurrgerCity.Utilities
{
	public class ColliderSystemInstaller : MonoInstaller
	{
		public override void InstallBindings()
		{
			Container.Bind<IColliderSystem<IClientComponent>>().To<ColliderSystem<IClientComponent>>().AsSingle().NonLazy();
			Container.Bind<IColliderSystem<IBurgerShopComponent>>().To<ColliderSystem<IBurgerShopComponent>>().AsSingle().NonLazy();
		}
	}
}

