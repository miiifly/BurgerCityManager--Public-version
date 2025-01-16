using BurrgerCity.Gameplay.BurgerShop;
using System;
using System.Collections.Generic;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Spawn
{
	public class BurgerShopSpawner : BaseSpawner<IBurgerShopComponent>
	{
		public BurgerShopSpawner(Transform spawnParent, DiContainer container, IEnumerable<IBurgerShopComponent> spawnebles) : base(spawnParent, container, spawnebles)
		{

		}

		protected override void SpawnInternal(IBurgerShopComponent spawnPrefab, bool setParent, Action<IBurgerShopComponent> spawnedCallback)
		{
			base.SpawnInternal(spawnPrefab, setParent, spawnedCallback);
		}
	}
}