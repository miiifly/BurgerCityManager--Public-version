using BurrgerCity.Gameplay.BurgerShop;
using BurrgerCity.Gameplay.Spawn;
using UnityEngine;

namespace BurrgerCity.Gameplay.Burger
{
	public class BurgerComponent : MonoBehaviour, IBaseSpawnable
	{
		[SerializeField]
		private BurgerType _burgerType;
		GameObject IBaseSpawnable.GameObject => gameObject;

		int IBaseSpawnable.SpawnableTypeID => _burgerType.GetHashCode();
	}
}
