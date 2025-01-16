using BurrgerCity.Data;
using TMPro;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.UI
{
	public class HungerCounter : MonoBehaviour
	{
		[Inject]
		private ClientsData _clientsData;

		[SerializeField]
		private TextMeshProUGUI _currentHungerText;
		[SerializeField]
		private TextMeshProUGUI _maxHungerText;

		private int _currentHunger = 0;
		private int _maxHunger = 50;

		private void Start()
		{
			_maxHungerText.text = _clientsData.MaxHunger.ToString();
		}

		private void Update()
		{
			if(_clientsData.ClientsHungry != _currentHunger)
			{
				_currentHunger = _clientsData.ClientsHungry;
				_currentHungerText.text = _clientsData.ClientsHungry.ToString();
			}
		}

	}
}
