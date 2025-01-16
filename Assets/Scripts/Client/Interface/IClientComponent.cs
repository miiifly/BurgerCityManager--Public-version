using BurrgerCity.Gameplay.Spawn;
using System;

namespace BurrgerCity.Gameplay.Client
{
	public interface IClientComponent : IBaseSpawnable
	{
		event Action<IClientComponent> OnFeed;
		void Initialize();
		void Finalized();
		bool IsHungry { get; }
		void Feed();
	}
}

