using BurrgerCity.Gameplay.BurgerShop;
using TMPro;
using UnityEngine;

namespace BurrgerCity.Gameplay.UI
{
	public class BurgerShopIndicator : MonoBehaviour, IBurgerShopIndicator
	{
		[SerializeField]
		private BurgerType _burgerType;

		[SerializeField]
		private TextMeshProUGUI _burgersCountText;

		private int _burgerCount;

		public GameObject GameObject => gameObject;
		public int SpawnableTypeID => _burgerType.GetHashCode();

		void IBurgerShopIndicator.SetPosition(Vector3 position)
		{
			transform.position = position;
		}

		void IBurgerShopIndicator. ChangeBurgerCount(int count = 1, bool remove = false)
		{
			_burgerCount += remove ? -count : count;
			_burgersCountText.text = _burgerCount.ToString();
		}
	}
}
