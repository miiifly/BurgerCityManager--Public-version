using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class ClientController : MonoBehaviour
	{
		[Inject]
		private IPedestrianMovement _pedestrianMovement;

		private void Start()
		{
			_pedestrianMovement.ReachedDestination += ChangeMovement;
		}
		private void OnDisable()
		{
			_pedestrianMovement.ReachedDestination -= ChangeMovement;
		}

		private void Update()
		{
			if (!_pedestrianMovement.IsMove)
			{
				return;
			}

			_pedestrianMovement.UpdateMovement();
		}

		private void ChangeMovement()
		{
			if (!_pedestrianMovement.IsPriority)
			{
				_pedestrianMovement.ChangeClientBehaviour();
			}
			else
			{
				_pedestrianMovement.SetRandomDestination();
			}
		}
	}
}

