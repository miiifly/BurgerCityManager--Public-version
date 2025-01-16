using System;
using UnityEngine;

namespace BurrgerCity.Gameplay.Client
{
	public interface IPedestrianMovement
	{
		event Action ReachedDestination;
		bool IsMove { get; }
		bool IsPriority { get; }
		void StartMove();
		void StopMove();
		void SetPriority(Vector3 position);
		void ChangeClientBehaviour();
		void UpdateMovement();
		void SetRandomDestination();
	}
}