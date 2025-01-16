using BurrgerCity.Scenne;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Scenne
{
	public class SceneManagerInstaller : MonoInstaller
	{
		[SerializeField]
		private ScenesPreset _preset;
		public override void InstallBindings()
		{
			Container.BindInstance(_preset).AsTransient();
			Container.Bind<ISceneManager>().To<SceneManagement>().AsSingle().WithArguments(_preset).NonLazy();
		}
	}
}
