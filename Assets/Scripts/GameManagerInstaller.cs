using Zenject;

namespace BurrgerCity.Game
{
	public class GameManagerInstaller : MonoInstaller
	{
		public override void InstallBindings()
		{
			Container.BindInterfacesAndSelfTo<GameManager>().AsSingle().NonLazy();
		}
	}
}
