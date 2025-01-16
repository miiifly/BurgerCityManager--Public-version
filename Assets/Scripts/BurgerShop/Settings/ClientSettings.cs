using UnityEngine;

namespace BurrgerCity.Gameplay.Client
{
	[CreateAssetMenu(fileName = "ClientSettings", menuName = "BurrgerCity/Settings/ClientSettings")]
	public class ClientSettings : ScriptableObject
	{
		[SerializeField]
		private int _hungerTime = 20;
		[SerializeField]
		private bool _isHungryAtStart = false;

		[Header("Pedestrian")]
		[SerializeField]
		private float _wanderRadius = 50f;
		[SerializeField]
		private float _closeDistance = 0.5f;

		public int HungerTime => _hungerTime;
		public bool IsHungryAtStart => _isHungryAtStart;
		public float WanderRadius => _wanderRadius;
		public float CloseDistance => _closeDistance;
	}
}
