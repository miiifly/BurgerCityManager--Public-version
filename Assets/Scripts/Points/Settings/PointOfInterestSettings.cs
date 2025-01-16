using UnityEngine;

namespace BurrgerCity.Gameplay.Points
{
	[CreateAssetMenu(fileName = "PointOfInterestSettings", menuName = "BurrgerCity/Settings/PointOfInterestSettings")]
	public class PointOfInterestSettings : ScriptableObject
	{
		[SerializeField]
		private float _priority;

		public float Priority => _priority;
	}
}
