using BurrgerCity.Gameplay.Data;
using UnityEngine;

namespace BurrgerCity.Gameplay.Points
{
	public class PointOfInterestComponent : PointComponent<PointOfInterestData>
	{
		[SerializeField]
		protected ScriptableObject _settings;
		protected override void UpdateScriptableValues()
		{
			base.UpdateScriptableValues();

			if (_settings != null && _data != null && _settings is PointOfInterestSettings poiSettings)
			{
				_data.UpdateSettings(poiSettings);
			}
		}
	}
}
