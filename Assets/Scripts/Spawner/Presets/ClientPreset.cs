using BurrgerCity.Gameplay.Client;
using UnityEngine;

namespace BurrgerCity.Gameplay.Spawn
{
	[CreateAssetMenu(fileName = "ClientPreset", menuName = "BurrgerCity/Presets/ClientPreset")]
	public class ClientPreset : SpawnPreset<ClientComponent>
	{
		[SerializeField]
		private int _clientCapacity;

		public int ClientCapacity => _clientCapacity;
	}
}