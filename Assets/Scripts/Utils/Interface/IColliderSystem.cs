using UnityEngine;

namespace BurrgerCity.Utilities
{
	public interface IColliderSystem<T>
	{
		void Register(Collider collider, T client);
		void Unregister(Collider collider);
		bool TryGetValue(Collider collider, out T client);
	}
}

