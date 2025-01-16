using BurrgerCity.Gameplay.Data;
using BurrgerCity.Gameplay.Spawn;
using BurrgerCity.Utilities;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Points
{
	public class PointManagerInstaller : MonoInstaller
	{
		[SerializeField]
		private ClientSpawnPointsPreset _clientPreset;
		[SerializeField]
		private SpawnPointsPreset _burgerShopPreset;
		[SerializeField]
		private PointOfInterestPreset _pointOfInterestPreset;

		public override void InstallBindings()
		{
			Container.BindInstance(_clientPreset);
			Container.BindInstance(_burgerShopPreset);
			Container.BindInstance(_pointOfInterestPreset);

			Container.Bind<ISpawnPointManager<ClientSpawnPointData>>().To<SpawnPointManager<ClientSpawnPointData>>().AsSingle().WithArguments(_clientPreset).NonLazy();
			Container.Bind<ISpawnPointManager<PointData>>().To<SpawnPointManager<PointData>>().AsSingle().WithArguments(_burgerShopPreset).NonLazy();
			Container.Bind<IPointOfInterestManager>().To<PointOfInterestManager>().AsSingle().WithArguments(_pointOfInterestPreset).NonLazy();

			Container.BindInterfacesAndSelfTo<RandomSelector<PointOfInterestData, PointOfInterestData>>().AsSingle().NonLazy();
		}
	}
}

