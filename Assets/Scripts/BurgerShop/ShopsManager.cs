using BurrgerCity.Gameplay.Client;
using BurrgerCity.Gameplay.Data;
using BurrgerCity.Gameplay.Points;
using BurrgerCity.Gameplay.Spawn;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public class ShopsManager : IShopsManager
	{
		private List<IBurgerShopComponent> _burgerShops = new List<IBurgerShopComponent>();

		IEnumerable<IBurgerShopComponent> IShopsManager.Shops => _burgerShops;


		private ISpawner<IBurgerShopComponent> _spawner;
		private ISpawnPointManager<PointData> _points;
		private BurgerShopPreset _preset;
		private ShopsData _data;

		[Inject]
		public void ResolveReferences(ISpawner<IBurgerShopComponent> spawner, ISpawnPointManager<PointData> points, BurgerShopPreset preset, ShopsData data)
		{
			_spawner = spawner;
			_points = points;
			_preset = preset;
			_data = data;
		}

		void IShopsManager.StartSpawn()
		{
			var components = _preset.Components.ToArray();
			var spawnPoints = _points.SpawnPoints;

			for (int i = 0, j = 0; i < spawnPoints.Count(); i++ , j++)
			{
				if( j > _preset.Components.Count())
				{
					j = 0;
				}
				var spawnPoint = spawnPoints[i];
				var burgerShop = components[i];

				_spawner.Spawn(burgerShop, true, burgerShop =>
				{
					burgerShop.GameObject.transform.SetPositionAndRotation(spawnPoint.Position, spawnPoint.Rotation);
					_burgerShops.Add(burgerShop);
				});
			}
			_data.Shops = _burgerShops;
		}

		Vector3 IShopsManager.GetBurgerShopForType(IClientComponent client)
		{
			foreach (var shop in _burgerShops)
			{
				if (shop.SpawnableTypeID == client.SpawnableTypeID)
				{
					shop.RequestClient(client);
					return shop.Position;
				}
			}
			return Vector3.zero;
		}
	}
}
