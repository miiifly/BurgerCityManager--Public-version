namespace BurrgerCity.Utilities
{
	public interface IPriorityModel<TPriority>
	{
		TPriority Mode { get; }
		float Priority { get; }
	}
}
