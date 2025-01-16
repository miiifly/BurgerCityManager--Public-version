using System;

namespace BurrgerCity.Gameplay.Spawn
{
	public interface IObjectPool<T> where T : IBaseSpawnable
	{
		event Action OnSpawn;
		event Action OnDespawn;
		T Get(int typeId);
		void Release(T obj);
		void Prepare(int typeId, int count);
	}
}
