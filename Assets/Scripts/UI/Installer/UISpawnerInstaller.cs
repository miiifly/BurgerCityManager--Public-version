using BurrgerCity.Gameplay.Spawn;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Gameplay.UI
{
	public class UISpawnerInstaller : MonoInstaller
	{
		[SerializeField]
		private IndicatorPreset _indicatorPreset;
		[SerializeField]
		private Transform _parent;

		public override void InstallBindings()
		{
			Container.BindInstance(_indicatorPreset);

			var burgerShopSpawner = new BaseSpawner<IBurgerShopIndicator>(_parent, Container, _indicatorPreset.Components);

			Container.Bind<ISpawner<IBurgerShopIndicator>>().FromInstance(burgerShopSpawner).AsSingle().NonLazy();
		}
	}
}
