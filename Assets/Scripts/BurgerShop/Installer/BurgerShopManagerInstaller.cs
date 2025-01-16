using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public class BurgerShopManagerInstaller : MonoInstaller
	{
		[SerializeField]
		private BurgerShopManager _manager;
		[SerializeField]
		private BurgerShopSettings _settigs;
		public override void InstallBindings()
		{
			Container.Bind<IBurgerShopManager>().To<BurgerShopManager>().AsSingle().WithArguments(_settigs, transform).NonLazy();
		}
	}
}

