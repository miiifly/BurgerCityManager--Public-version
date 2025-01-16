using BurrgerCity.Gameplay.Data;
using BurrgerCity.Gameplay.Spawn;
using System.Linq;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.UI
{
	public class UIManager : MonoBehaviour
	{
		[SerializeField]
		private int _maxHungerCount;
		[SerializeField]
		private int _currentHugherCount;

		[Inject]
		private ShopsData _data;
		[Inject]
		private ISpawner<IBurgerShopIndicator> _indicatorSpawner;

		private void Start()
		{
			foreach (var shop in _data.Shops)
			{
				var spawnId = shop.SpawnableTypeID;
				_indicatorSpawner.Spawn(spawnId, true, indicator =>
				{
					indicator.SetPosition(shop.Position);
					shop.SetIndicator(indicator);
				});
			}
		}
	}
}
