using UnityEngine;

namespace BurrgerCity
{
	public class IndicatorController : MonoBehaviour
	{
		[SerializeField]
		private RectTransform _indicatorUI;

		private float _interfaceScale = 50;
		private Transform _targetPosition;
		private Vector3 _startPointerSize;
		private Camera _mainCamera;

		private void Awake()
		{
			_targetPosition = transform;
			_startPointerSize = _indicatorUI.sizeDelta;
			_mainCamera = Camera.main;
		}

		private void LateUpdate()
		{
			var screenPos = _mainCamera.WorldToScreenPoint(_targetPosition.position);
			var adjustedPos = screenPos;

			if (IsBehind(_targetPosition.position))
			{
				adjustedPos = new Vector3(screenPos.x, 0, 0);
				if (_mainCamera.transform.position.y < _targetPosition.position.y)
				{
					adjustedPos.y = Screen.height;
				}
			}

			float offset = _indicatorUI.sizeDelta.x / 2;
			adjustedPos.x = Mathf.Clamp(adjustedPos.x, offset, Screen.width - offset);
			adjustedPos.y = Mathf.Clamp(adjustedPos.y, offset, Screen.height - offset);

			_indicatorUI.sizeDelta = new Vector2(
				_startPointerSize.x * _interfaceScale / 100,
				_startPointerSize.y * _interfaceScale / 100
			);

			_indicatorUI.position = adjustedPos;
		}

		private bool IsBehind(Vector3 point)
		{
			var cameraForward = _mainCamera.transform.forward;
			var toPoint = point - _mainCamera.transform.position;
			return Vector3.Dot(cameraForward, toPoint) < 0;
		}
	}
}
