using System.Collections.Generic;
using UnityEngine;

namespace BurrgerCity.Utilities
{
	public class ColliderSystem<T> : IColliderSystem<T>
	{
		private readonly Dictionary<Collider, T> _collidersDictionary = new Dictionary<Collider, T>();

		void IColliderSystem<T>.Register(Collider collider, T client)
		{
			if (_collidersDictionary.ContainsKey(collider))
			{
				Debug.LogError($"ColliderSystem can't register {collider.name}. Key already exists.");
				return;
			}
			_collidersDictionary.Add(collider, client);
		}

		void IColliderSystem<T>.Unregister(Collider collider)
		{
			if (!_collidersDictionary.Remove(collider))
			{
				Debug.LogError($"ColliderSystem can't unregister {collider.name}. Key doesn't exist.");
			}
		}

		bool IColliderSystem<T>.TryGetValue(Collider collider, out T client)
		{
			return _collidersDictionary.TryGetValue(collider, out client);
		}
	}
}