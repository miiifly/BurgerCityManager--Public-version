using BurrgerCity.Gameplay.Burger;
using BurrgerCity.Gameplay.Client;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.Spawn
{
	public class ObjectPoolInstaller : MonoInstaller
	{
		[Header("Client")]
		[SerializeField]
		private Transform _clientParent;
		[SerializeField]
		private ClientPreset _clientPreset;
		[Header("Burger")]
		[SerializeField]
		private Transform _burgerParent;
		[SerializeField]
		private BurgerPreset _burgerPreset;


		public override void InstallBindings()
		{
			Container.BindInstance(_clientPreset);

			var clientSpawner = new ObjectPool<IClientComponent>(_clientPreset.Components, _clientParent, Container, _clientPreset.ClientCapacity);

			Container.Bind<IObjectPool<IClientComponent>>().FromInstance(clientSpawner).AsSingle().NonLazy();

			Container.BindInstance(_burgerPreset);

			var burgerSpawner = new ObjectPool<BurgerComponent>(_burgerPreset.Components, _burgerParent, Container, 10);

			Container.Bind<IObjectPool<BurgerComponent>>().FromInstance(burgerSpawner).AsSingle().NonLazy();
		}
	}
}

