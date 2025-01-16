using BurrgerCity.Gameplay.Points;
using System;
using UnityEngine;
using UnityEngine.AI;
using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class PedestrianMovement : IPedestrianMovement
	{
		private bool _isMove;
		private bool _isPriority;

		bool IPedestrianMovement.IsMove => _isMove;
		bool IPedestrianMovement.IsPriority => _isPriority;

		public event Action ReachedDestination
		{
			add { _reachDestination += value; }
			remove { _reachDestination -= value; }
		}

		private Action _reachDestination;

		private IPointOfInterestManager _pointOfInterestManager;
		private NavMeshAgent _agent;
		private ClientSettings _settings;

		[Inject]
		public void ResolveReferences(IPointOfInterestManager pointOfInterestManager, NavMeshAgent agent, ClientSettings settings)
		{
			_pointOfInterestManager = pointOfInterestManager;
			_agent = agent;
			_settings = settings;
		}

		void IPedestrianMovement.StartMove()
		{
			_agent.enabled = true;
			_isMove = true;
			SetRandomBehaviour();
		}

		void IPedestrianMovement.StopMove()
		{
			_isMove = false;
			_isPriority = false;
			_agent.ResetPath();
			_agent.enabled = false;
		}

		void IPedestrianMovement.ChangeClientBehaviour()
		{
			SetRandomBehaviour();
		}

		private void SetRandomBehaviour()
		{
			var targetPosition = _pointOfInterestManager.GetRandomPointOfInterest();
			_agent.SetDestination(targetPosition);
		}

		void IPedestrianMovement.SetPriority(Vector3 position)
		{
			_isPriority = true;
			_agent.SetDestination(position);
		}


		void IPedestrianMovement.UpdateMovement()
		{
			if (_agent.enabled && !_agent.pathPending && _agent.remainingDistance < _settings.CloseDistance)
			{
				_reachDestination.Invoke();
			}
		}

		void IPedestrianMovement.SetRandomDestination()
		{
			Vector3 randomDirection = UnityEngine.Random.insideUnitSphere * _settings.WanderRadius;
			randomDirection += _agent.transform.position;

			NavMeshHit hit;
			if (NavMesh.SamplePosition(randomDirection, out hit, _settings.WanderRadius, 1))
			{
				Vector3 finalPosition = hit.position;
				_agent.SetDestination(finalPosition);
			}
		}

	}
}

