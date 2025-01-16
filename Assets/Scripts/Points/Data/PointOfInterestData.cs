using BurrgerCity.Gameplay.Points;
using BurrgerCity.Utilities;
using UnityEngine;

namespace BurrgerCity.Gameplay.Data
{
	[CreateAssetMenu(fileName = "PointOfInterestData", menuName = "BurrgerCity/Location/PointOfInterestData")]
	public class PointOfInterestData : PointData, IPriorityModel<PointOfInterestData>
	{
		public PointOfInterestSettings Settings { get; private set; }

		PointOfInterestData IPriorityModel<PointOfInterestData>.Mode => this;

		float IPriorityModel<PointOfInterestData>.Priority => Settings.Priority;

		public void UpdateSettings(PointOfInterestSettings settings)
		{
			Settings = settings;
		}
	}
}
