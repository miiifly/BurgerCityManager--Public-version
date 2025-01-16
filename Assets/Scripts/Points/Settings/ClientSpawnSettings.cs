using UnityEngine;

namespace BurrgerCity.Gameplay.Points
{
	[CreateAssetMenu(fileName = "ClientSpawnSettings", menuName = "BurrgerCity/Settings/ClientSpawnSettings")]
	public class ClientSpawnSettings : ScriptableObject
	{
		[SerializeField]
		private float _delay = 1f;
		[SerializeField]
		private int _maxSpawn = 100;

		public float Delay => _delay;
		public int MaxSpawn => _maxSpawn;

	}
}

