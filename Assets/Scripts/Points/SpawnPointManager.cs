using BurrgerCity.Gameplay.Data;
using BurrgerCity.Gameplay.Points;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace BurrgerCity.Gameplay.Spawn
{
	public class SpawnPointManager<T> : ISpawnPointManager<T> where T : PointData
	{
		private List<T> _spawnPoints;

		List<T> ISpawnPointManager<T>.SpawnPoints => _spawnPoints;

		private PointsPreset<T> _preset;

		public SpawnPointManager(PointsPreset<T> preset)
		{
			_spawnPoints = preset.Points.ToList();
		}

		Vector3 ISpawnPointManager<T>.GetRandomSpawnPosition()
		{
			if (_preset.Points.Count() == 0)
			{
				Debug.LogError("No available spawn points.");
				return Vector3.zero;
			}

			int randomIndex = Random.Range(0, _spawnPoints.Count);
			var selectedPoint = _spawnPoints[randomIndex];
			return selectedPoint.Position;
		}
	}
}

