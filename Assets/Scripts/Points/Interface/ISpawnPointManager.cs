using BurrgerCity.Gameplay.Data;
using System.Collections.Generic;
using UnityEngine;

namespace BurrgerCity.Gameplay.Points
{
	public interface ISpawnPointManager<T> where T : PointData
	{
		List<T> SpawnPoints { get; }
		Vector3 GetRandomSpawnPosition();
	}
}

