using Zenject;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public class ManagerInstaller : MonoInstaller
	{
		public override void InstallBindings()
		{
			Container.BindInterfacesAndSelfTo<ShopsManager>().AsSingle().NonLazy();
		}
	}
}
