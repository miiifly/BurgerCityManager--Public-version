using BurrgerCity.Gameplay.Spawn;
using UnityEngine;

namespace BurrgerCity.Gameplay.UI
{
	public interface IBurgerShopIndicator : IBaseSpawnable
	{
		void SetPosition(Vector3 position);
		void ChangeBurgerCount(int count = 1, bool remove = false);
	}
}
