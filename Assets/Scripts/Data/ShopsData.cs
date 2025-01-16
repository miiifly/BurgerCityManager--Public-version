using BurrgerCity.Gameplay.BurgerShop;
using System.Collections.Generic;
using UnityEngine;

namespace BurrgerCity.Gameplay.Data
{
	[CreateAssetMenu(fileName = "ShopData", menuName = "BurrgerCity/Data/ShopData")]
	public class ShopsData : ScriptableObject
	{
		public IEnumerable<IBurgerShopComponent> Shops = new List<IBurgerShopComponent>();
	}
}
