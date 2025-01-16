using System.Collections.Generic;

namespace BurrgerCity.Utilities
{
	public interface IRandomSelector<Tmodel, Tpriority> where Tmodel : IPriorityModel<Tpriority>
	{
		Tmodel SelectOption(List<Tmodel> items);
	}
}
