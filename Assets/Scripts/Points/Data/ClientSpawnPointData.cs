using BurrgerCity.Gameplay.Points;
using UnityEngine;

namespace BurrgerCity.Gameplay.Data
{
	[CreateAssetMenu(fileName = "ClientSpawnPointData", menuName = "BurrgerCity/Location/ClientSpawnPointData")]
	public class ClientSpawnPointData : PointData
	{
		public ClientSpawnSettings Settings { get; private set; }

		public void UpdateSettings(ClientSpawnSettings settings)
		{
			Settings = settings;
		}
	}
}
