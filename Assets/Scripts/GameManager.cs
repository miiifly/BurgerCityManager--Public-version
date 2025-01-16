using BurrgerCity.Data;
using BurrgerCity.Gameplay.BurgerShop;
using BurrgerCity.Gameplay.Client;
using BurrgerCity.Scenne;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using Zenject;

namespace BurrgerCity.Game
{
	public class GameManager : IInitializable, ITickable
	{
		private Queue<SceneInfo> _scenesQueue;
		private List<SceneAsset> _loadScenes;
		private bool _exitProces = false;

		private IShopsManager _shopsManager;
		private IClientSpawnerManager _clientSpawner;
		private ISceneManager _sceneManager;
		private ScenesPreset _scenesPreset;
		private ClientsData _clientData;

		[Inject]
		public GameManager(ISceneManager sceneManager, IClientSpawnerManager clientSpawner, IShopsManager shopsManager, ScenesPreset scenesPreset,ClientsData clientsData)
		{
			_sceneManager = sceneManager;
			_clientSpawner = clientSpawner;
			_shopsManager = shopsManager;
			_scenesPreset = scenesPreset;
			_clientData = clientsData;
		}

		public void Tick()
		{
			if(_clientData.TooManyHungryClients && !_exitProces)
			{
				_exitProces = true;
				UnloadScene();
				Application.Quit();
			}
		}

		void IInitializable.Initialize()
		{
			_scenesQueue = new Queue<SceneInfo>(_scenesPreset.AvailableScenes);
			_loadScenes = new List<SceneAsset>();
			StartMainGameLogic();
			LoadNextScene();
		}

		private void LoadNextScene()
		{
			if (_scenesQueue.Count > 0)
			{
				var nextScene = _scenesQueue.Dequeue();
				_sceneManager.LoadSceneByRef(nextScene.SceneType, true, SceneLoadHandler);
			}
		}

		private void UnloadScene()
		{
			if (_loadScenes.Count > 0)
			{
				var nextScene = _loadScenes.First();
				_loadScenes.Remove(nextScene);
				_sceneManager.UnloadSceneByRef(nextScene, SceneUnloadHandler);
			}
			else
			{
				EndGame();
			}
		}

		private void SceneLoadHandler(SceneAsset sceneAsset)
		{
			_loadScenes.Add(sceneAsset);
			LoadNextScene();
		}
		private void SceneUnloadHandler()
		{
			UnloadScene();
		}

		private void StartMainGameLogic()
		{
			_shopsManager.StartSpawn();
			_clientSpawner.StartSpawn();
		}

		private void EndGame()
		{

		}
	}
}
