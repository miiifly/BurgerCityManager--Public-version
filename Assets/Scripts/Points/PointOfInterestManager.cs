using BurrgerCity.Gameplay.Data;
using BurrgerCity.Utilities;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Points
{
	public class PointOfInterestManager : IPointOfInterestManager
	{
		[Inject]
		private IRandomSelector<PointOfInterestData, PointOfInterestData> _randomSelector;

		private List<PointOfInterestData> _spawnPoints;

		public PointOfInterestManager(PointOfInterestPreset preset)
		{
			_spawnPoints = preset.Points.ToList();
		}

		public Vector3 GetRandomPointOfInterest() => _randomSelector.SelectOption(_spawnPoints).Position;
	}
}
