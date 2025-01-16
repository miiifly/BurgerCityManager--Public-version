using UnityEngine;

namespace BurrgerCity.Data
{
	[CreateAssetMenu(fileName = "ClientsData", menuName = "BurrgerCity/Data/ClientsData")]
	public class ClientsData : ScriptableObject
	{
		[SerializeField]
		private int _maxHunger = 50;

		public int MaxHunger => _maxHunger;
		public int ClientsHungry { get; set; } = 0;
		public bool TooManyHungryClients => ClientsHungry >= _maxHunger;

		public void ClearData()
		{
			ClientsHungry = 0;
		}
	}
}
