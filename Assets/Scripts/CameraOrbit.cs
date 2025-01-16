using UnityEngine;

namespace Game.General
{
    public class CameraOrbit : MonoBehaviour
    {
        [SerializeField] private Transform pivotTransform;

        [Header("Movement:")]
        [SerializeField] private bool edgeScrollEnabled;
        [SerializeField] private float movementSpeed = 100F;
        [SerializeField] private float edgeBorderPixels = 10F;

        [Header("Zoom:")]
        [SerializeField] private KeyCode zoomKeyMouse;
        [SerializeField] private float zoomSpeed = 40f;
        [SerializeField] private float zoomAcceleration = 100f;
        [SerializeField] private float zoomDampening = 6f;
        [SerializeField] private float zoomDistanceMin = 100f;
        [SerializeField] private float zoomDistanceMax = 700f;
        
        [Header("Rotation:")]
        [SerializeField] private KeyCode rotationKeyLeft;
        [SerializeField] private KeyCode rotationKeyRight;
        [SerializeField] private float rotationSpeedMouse = 4f;
        [SerializeField] private float rotationSpeedKeyboard = 4f;
        [SerializeField] float orbitDampening = 10f;

        private Vector3 m_localRotation;

        void Awake()
        {
#if !UNITY_EDITOR
            edgeScrollEnabled = true;     
#endif
        }

        [ContextMenu("Look at pivot")]
        void LookAtPivot()
        {
            transform.forward = pivotTransform.position - transform.position;
        }

        void LateUpdate()
        {
            Vector3 zeroY = new Vector3(1, 0, 1);

            // MOVEMENT
            if (Input.GetKey(KeyCode.W) || (Input.mousePosition.y >= Screen.height - edgeBorderPixels && edgeScrollEnabled))
            {
                pivotTransform.position +=
                    Vector3.Normalize(Vector3.Scale(transform.forward, zeroY)) * movementSpeed * Time.unscaledDeltaTime;
            }

            if (Input.GetKey(KeyCode.S) || (Input.mousePosition.y <= edgeBorderPixels && edgeScrollEnabled))
            {
                pivotTransform.position -=
                    Vector3.Normalize(Vector3.Scale(transform.forward, zeroY)) * movementSpeed * Time.unscaledDeltaTime;
            }

            if (Input.GetKey(KeyCode.A) || (Input.mousePosition.x <= edgeBorderPixels && edgeScrollEnabled))
            {
                pivotTransform.position -=
                    Vector3.Normalize(Vector3.Scale(transform.right, zeroY)) * movementSpeed * Time.unscaledDeltaTime;
            }

            if (Input.GetKey(KeyCode.D) || (Input.mousePosition.x >= Screen.width - edgeBorderPixels && edgeScrollEnabled))
            {
                pivotTransform.position +=
                    Vector3.Normalize(Vector3.Scale(transform.right, zeroY)) * movementSpeed * Time.unscaledDeltaTime;
            }

            // ROTATION
            if (Input.GetKey(zoomKeyMouse) && Input.GetAxis("Mouse X") != 0)
            {
                m_localRotation.x += Input.GetAxis("Mouse X") * rotationSpeedMouse * Time.unscaledDeltaTime;
            }
            if (Input.GetKey(rotationKeyLeft))
            {
                m_localRotation.x += rotationSpeedKeyboard * Time.unscaledDeltaTime;
            }
            if (Input.GetKey(rotationKeyRight))
            {
                m_localRotation.x -= rotationSpeedKeyboard * Time.unscaledDeltaTime;
            }

            // ZOOM
            if (Input.GetAxis("Mouse ScrollWheel") != 0f)
            {
                var distance = Vector3.Distance(transform.position, pivotTransform.position);

                float cameraDistanceChange = Input.GetAxis("Mouse ScrollWheel") * zoomSpeed * (distance / zoomAcceleration);

                if (!((distance < zoomDistanceMin && cameraDistanceChange > 0)
                    || (distance > zoomDistanceMax && cameraDistanceChange < 0)))
                {
                    var cameraPosition = transform.position;
                    cameraPosition = Vector3.Lerp(
                        cameraPosition,
                        cameraPosition + transform.forward * cameraDistanceChange,
                        Time.unscaledDeltaTime * zoomDampening);
                    transform.position = cameraPosition;
                }
            }

            // ORBIT
            Quaternion qt = Quaternion.Euler(m_localRotation.y, m_localRotation.x, 0);
            pivotTransform.rotation = Quaternion.Lerp(pivotTransform.rotation, qt, Time.unscaledDeltaTime * orbitDampening);
        }
    }
}