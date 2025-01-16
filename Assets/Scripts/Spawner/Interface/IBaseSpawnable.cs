using UnityEngine;

namespace BurrgerCity.Gameplay.Spawn
{
	public interface IBaseSpawnable
	{
		GameObject GameObject { get; }

		int SpawnableTypeID { get;  }
	}
}

