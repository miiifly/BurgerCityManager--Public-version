using BurrgerCity.Gameplay.Data;
using UnityEngine;

namespace BurrgerCity.Gameplay.Points
{
	public class ClientSpawnPointComponent : PointComponent<ClientSpawnPointData>
	{
		[SerializeField]
		protected ScriptableObject _settings;

		protected override void UpdateScriptableValues()
		{
			base.UpdateScriptableValues();

			if (_settings != null && _settings is ClientSpawnSettings spawnSettings)
			{
				_data.UpdateSettings(spawnSettings);
			}
		}
	}
}
