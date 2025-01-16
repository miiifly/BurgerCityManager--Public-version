using BurrgerCity.Gameplay.Data;
using BurrgerCity.Gameplay.Points;
using MEC;
using System.Collections.Generic;
using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class ClientSpawnerManager : IClientSpawnerManager
	{
		private IClientFactory _clientFactory;
		private ISpawnPointManager<ClientSpawnPointData> _spawnPointManager;

		[Inject]
		public ClientSpawnerManager(IClientFactory clientFactory, ISpawnPointManager<ClientSpawnPointData> spawnPointManager)
		{
			_clientFactory = clientFactory;
			_spawnPointManager = spawnPointManager;
		}

		void IClientSpawnerManager.StartSpawn()
		{
			foreach (var spawnPoint in _spawnPointManager.SpawnPoints)
			{
				Timing.RunCoroutine(SpawnClientsPeriodically(spawnPoint));
			}
		}

		private IEnumerator<float> SpawnClientsPeriodically(ClientSpawnPointData point)
		{
			var count = 0;

			while (count < point.Settings.MaxSpawn)
			{
				yield return Timing.WaitForSeconds(point.Settings.Delay);

				_clientFactory.SpawnClientAtPosition(point.Position);
				count++;
			}
		}
	}
}
