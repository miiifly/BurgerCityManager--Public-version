using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class ClientSpawnerManagerInstaller : MonoInstaller
	{
		public override void InstallBindings()
		{
			Container.Bind<IClientSpawnerManager>().To<ClientSpawnerManager>().AsSingle().NonLazy();
		}
	}
}
