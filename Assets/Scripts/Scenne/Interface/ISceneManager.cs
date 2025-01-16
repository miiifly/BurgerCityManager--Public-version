using System;
using UnityEditor;

namespace BurrgerCity.Scenne
{
	public interface ISceneManager
	{
		void LoadSceneByRef(SceneType sceneType, bool additive, Action<SceneAsset> callback);
		void UnloadSceneByRef(SceneAsset sceneRef, Action callback);
	}
}

