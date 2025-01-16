using BurrgerCity.Gameplay.Client;
using System;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public interface IBurgerShopManager
	{
		event Action BurgersConsumed;
		event Action<int> BurgersDecreased;

		bool isBurgersPending { get; }
		void CookBurger();
		void RequestBurger(IClientComponent clinet);
		void FeedClients();
	}
}

