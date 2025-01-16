using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class ClientFactoryInstaller : MonoInstaller
	{
		public override void InstallBindings()
		{
			Container.Bind<IClientFactory>().To<ClientFactory>().AsSingle().NonLazy();
		}
	}
}

