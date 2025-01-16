using BurrgerCity.Gameplay.Client;
using System.Collections.Generic;
using UnityEngine;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public interface IShopsManager
	{
		void StartSpawn();
		IEnumerable<IBurgerShopComponent> Shops { get; }
		Vector3 GetBurgerShopForType(IClientComponent client);
	}
}

