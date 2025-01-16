using System.Collections.Generic;
using UnityEngine;

namespace BurrgerCity.Gameplay.Spawn
{
	public class SpawnPreset<T> : ScriptableObject where T : IBaseSpawnable
	{
		[SerializeField]
		private List<T> _components;
		public IEnumerable<T> Components => _components;
	}
}