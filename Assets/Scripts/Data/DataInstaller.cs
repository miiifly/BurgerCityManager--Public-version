using BurrgerCity.Gameplay.Data;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Data
{
	public class DataInstaller : MonoInstaller
	{
		[SerializeField]
		private ClientsData _clientsData;
		[SerializeField]
		private ShopsData _shopsData;

		public override void InstallBindings()
		{
			Container.BindInstance(_clientsData).AsTransient();
			Container.BindInstance(_shopsData).AsTransient();
		}
	}
}
