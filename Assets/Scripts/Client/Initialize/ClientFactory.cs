using BurrgerCity.Data;
using BurrgerCity.Gameplay.Spawn;
using System.Linq;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Client
{
	public class ClientFactory : IClientFactory
	{
		private readonly ClientPreset _preset;
		private readonly IObjectPool<IClientComponent> _clientSpawner;
		private readonly ClientsData _clientData;

		[Inject]
		public ClientFactory(ClientPreset preset, IObjectPool<IClientComponent> clientSpawner, ClientsData clientData)
		{
			_preset = preset;
			_clientSpawner = clientSpawner;
			_clientData = clientData;
			_clientData.ClearData();
		}

		void IClientFactory.SpawnClientAtPosition(Vector3 position)
		{
			var selectedPrefab = RandomPrefabSelector();
			var component = _clientSpawner.Get(selectedPrefab.SpawnableTypeID);
			SetClientPosition(component, position, Quaternion.identity);
			SubscribeToOnFeed(component);
			component.Initialize();
		}

		void IClientFactory.DespawnClient(IClientComponent clientComponent)
		{
			clientComponent.GameObject.transform.SetPositionAndRotation(Vector3.zero, Quaternion.identity);
			_clientSpawner.Release(clientComponent);
		}

		private IClientComponent RandomPrefabSelector()
		{
			var randomIndex = Random.Range(0, _preset.Components.Count());
			var selectedPrefab = _preset.Components.ToArray()[randomIndex];
			return selectedPrefab;
		}

		private void SetClientPosition(IClientComponent clientComponent, Vector3 position, Quaternion rotation)
		{
			clientComponent.GameObject.transform.SetPositionAndRotation(position, rotation);
		}

		private void SubscribeToOnFeed(IClientComponent clientComponent)
		{
			clientComponent.OnFeed += HandleClientDespawn;
		}

		private void HandleClientDespawn(IClientComponent clientComponent)
		{
			clientComponent.Finalized();
			clientComponent.GameObject.transform.SetPositionAndRotation(Vector3.zero, Quaternion.identity);
			_clientSpawner.Release(clientComponent);
		}
	}
}
