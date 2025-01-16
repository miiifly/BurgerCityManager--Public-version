using UnityEngine;

namespace BurrgerCity.Gameplay.Data
{
	public class PointData : ScriptableObject
	{
		public Vector3 Position;
		public Quaternion Rotation;

		public void UpdatePositionAndRotation(Vector3 position, Quaternion rotation)
		{
			Position = position;
			Rotation = rotation;
		}
	}
}
