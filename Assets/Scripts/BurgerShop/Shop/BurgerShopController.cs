using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public class BurgerShopController : MonoBehaviour
	{
		[Inject]
		private IBurgerShopManager _manager;

		private void Update()
		{
			if (_manager.isBurgersPending)
			{
				_manager.CookBurger();
			}
		}
	}
}
