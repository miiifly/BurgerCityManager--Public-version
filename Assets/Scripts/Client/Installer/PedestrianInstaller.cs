using UnityEngine;
using UnityEngine.AI;
using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class PedestrianInstaller : MonoInstaller
	{
		[SerializeField]
		private NavMeshAgent _agent;
		[SerializeField]
		private ClientSettings _settings;
		[SerializeField]
		private Collider _collider;

		public override void InstallBindings()
		{
			Container.BindInstance(_collider).AsTransient();
			Container.BindInstance(_settings).AsTransient();
			Container.BindInstance(_agent).AsTransient();
			Container.Bind<IPedestrianMovement>().To<PedestrianMovement>().AsSingle();
		}
	}
}

