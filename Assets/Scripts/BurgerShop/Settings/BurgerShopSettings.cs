using UnityEngine;

namespace BurrgerCity.Gameplay.BurgerShop
{
	[CreateAssetMenu(fileName = "BurgerShopSettings", menuName = "BurrgerCity/Settings/BurgerShopSettings")]
	public class BurgerShopSettings : ScriptableObject
	{
		[SerializeField]
		private BurgerType _burgerType = BurgerType.None;
		[SerializeField]
		private float _feedRadius = 200f;
		[SerializeField]
		private int _maxBurgers = 10;
		[SerializeField]
		private float _cookTime = 5f;

		public float FeedRadius => _feedRadius;
		public int MaxBurgers => _maxBurgers;
		public float CookTime => _cookTime;
		public int TypeID => _burgerType.GetHashCode();
	}

	public enum BurgerType
	{
		None = 0,
		Red = 1,
		Green = 2,
		Blue = 3,
		Yelow = 4
	}
}
