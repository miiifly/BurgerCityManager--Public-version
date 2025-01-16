using BurrgerCity.Gameplay.Client;
using BurrgerCity.Gameplay.Spawn;
using BurrgerCity.Gameplay.UI;
using UnityEngine;

namespace BurrgerCity.Gameplay.BurgerShop
{
	public interface IBurgerShopComponent : IBaseSpawnable
	{
		Vector3 Position { get; }

		void RequestClient(IClientComponent client);
		void SetIndicator(IBurgerShopIndicator indicator);
		void FeedClients();
	}
}
