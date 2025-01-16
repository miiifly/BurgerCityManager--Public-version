using UnityEngine;

namespace BurrgerCity.Gameplay.Client
{
	public interface IClientFactory
	{
		void SpawnClientAtPosition(Vector3 position);
		void DespawnClient(IClientComponent clientComponent);
	}

}
