using BurrgerCity.Gameplay.BurgerShop;
using BurrgerCity.Utilities;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Player
{
	public class BurgerShopClick : MonoBehaviour
	{
		[Inject]
		private IColliderSystem<IBurgerShopComponent> _colliderSystem;

		private void Update()
		{
			if (Input.GetMouseButtonDown(0))
			{
				Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
				RaycastHit hit;

				if (Physics.Raycast(ray, out hit))
				{
					if (_colliderSystem.TryGetValue(hit.collider, out var client))
					{
						client.FeedClients();
					}
				}
			}
		}
	}
}
