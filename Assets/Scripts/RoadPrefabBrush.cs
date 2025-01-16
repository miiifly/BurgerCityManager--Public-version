using UnityEditor;
using UnityEditor.Tilemaps;
using UnityEngine;
using System.Collections.Generic;

namespace Game.Traffic.Editor
{
    [CreateAssetMenu(fileName = "RoadPrefabBrush", menuName = "Brushes/Road prefab brush")]
    [CustomGridBrush(false, true, false, "Prefab Brush")]
    public class RoadPrefabBrush : BasePrefabBrush
    {
        /// <summary>
        /// The selection of Prefab to paint from
        /// </summary>
        public GameObject m_Prefab;
        /// <summary>
        /// Use to remove all prefabs in the cell or just the one that is currently selected in m_Prefab
        /// </summary>
        public bool m_ForceDelete;
        /// <summary>
        /// Paints Prefabs into a given position within the selected layers.
        /// The PrefabBrush overrides this to provide Prefab painting functionality.
        /// </summary>
        /// <param name="grid">Grid used for layout.</param>
        /// <param name="brushTarget">Target of the paint operation. By default the currently selected GameObject.</param>
        /// <param name="position">The coordinates of the cell to paint data to.</param>
        
        protected GameObject Prefab;
        public GameObject PrefabReference {
            get 
            {
                return Prefab;
            }
        }

		private Vector3 m_Rotation = new Vector3(0,0,0);

        public override void Paint(GridLayout grid, GameObject brushTarget, Vector3Int position)
        {
            Prefab = m_Prefab;

            // Do not allow editing palettes
            if (brushTarget.layer == 31 || brushTarget == null)
            {
                return;
            }

            List<GameObject> tileObjects = GetObjectsInCell(grid, brushTarget.transform, position);
            if (tileObjects.Count == 0)
            {
                GameObject paintedGameObject = InstntiatePrefabOnGrid(grid, brushTarget, position);
                Lock(paintedGameObject);
            }
            else 
            {
                foreach (GameObject tileObject in tileObjects)
                {
                    if (m_Prefab && tileObject.name != m_Prefab.name)
                    {
                        GameObject paintedGameObject = InstntiatePrefabOnGrid(grid, brushTarget, position);
                        Lock(paintedGameObject);
                    }
                }
            }
        }

        private void Lock(GameObject paintedGameObject)
        {
            // Utility.LockObject(paintedGameObject);
            // foreach (Transform t in paintedGameObject.transform)
            // {
            //     Utility.UnlockObject(t.gameObject);
            // }
        }


        public GameObject InstntiatePrefabOnGrid(GridLayout grid, GameObject brushTarget, Vector3Int position, bool registerUndo = true, bool setParent = true)
        {
            BrushCell cell = cells[GetCellIndexWrapAround(position.x, position.y, position.z)];
            var ruleTile = (RuleTile)cell.tile;
            if (ruleTile && ruleTile.m_DefaultGameObject != null)
            {
                Prefab = ruleTile.m_DefaultGameObject;
            }

            GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(Prefab);
            if (instance != null)
            {
                if (registerUndo)
                {
                    Undo.MoveGameObjectToScene(instance, brushTarget.scene, "Paint Prefabs");
                    Undo.RegisterCreatedObjectUndo((Object)instance, "Paint Prefabs");
                }
                if (setParent)
                {
                    instance.transform.SetParent(brushTarget.transform);
                }
                instance.transform.name += "_("+position.x+";"+position.y+")";
                instance.transform.position = GetGridPositionLocalToWorld(grid, position);
                instance.transform.localEulerAngles = GetPrefabEulerAngles();
            }
            return instance;
        }

        public Vector3 GetGridPositionLocalToWorld(GridLayout gridLayout, Vector3Int position) { 
            return gridLayout.LocalToWorld(gridLayout.CellToLocalInterpolated(position + m_Anchor));
        }

        public Vector3 GetPrefabEulerAngles() {
            return m_Rotation;
        }

        /// <summary>
        /// Erases all Prefabs in a given position within the selected layers if ForceDelete is true.
        /// Erase only selected Prefabs in a given position within the selected layers if ForceDelete is false.
        /// The PrefabBrush overrides this to provide Prefab erasing functionality.
        /// </summary>
        /// <param name="grid">Grid used for layout.</param>
        /// <param name="brushTarget">Target of the erase operation. By default the currently selected GameObject.</param>
        /// <param name="position">The coordinates of the cell to erase data from.</param>
        public override void Erase(GridLayout grid, GameObject brushTarget, Vector3Int position)
        {
            List<GameObject> tileObjects = GetObjectsInCell(grid, brushTarget.transform, position);
            if (tileObjects.Count == 0)
            {
                base.Erase(grid, brushTarget, position);
            }
            else
            {
                foreach (GameObject erased in tileObjects)
                {
                    if (erased == null)
                    {
                        return;
                    }
                    // if (m_ForceDelete || (!m_ForceDelete && erased.gameObject.name == m_Prefab.name))
                    // {
                    base.Erase(grid, brushTarget, position);
                    //}
                }
            }
        }

		public override void Rotate(RotationDirection direction, GridLayout.CellLayout layout)
		{
			m_Rotation += new Vector3(0f, 90f, 0f) * ((direction==RotationDirection.Clockwise)?1f:-1f);
			base.Rotate(direction, layout);
		}

		public override void Pick(GridLayout gridLayout, GameObject brushTarget, BoundsInt position, Vector3Int pickStart)
		{
			base.Pick(gridLayout, brushTarget, position, pickStart);
            m_Rotation = new Vector3();
        }
	}

    /// <summary>
    /// The Brush Editor for a Prefab Brush.
    /// </summary>
    [CustomEditor(typeof(RoadPrefabBrush))]
    public class PrefabBrushEditor : BasePrefabBrushEditor
    {
        private RoadPrefabBrush prefabBrush => target as RoadPrefabBrush;
        private SerializedProperty m_Prefab;
        private SerializedProperty m_ForceDelete;

        private GameObject m_PrefabInstance;

        protected override void OnEnable()
        {
            base.OnEnable();
            m_Prefab = m_SerializedObject.FindProperty(nameof(m_Prefab));
            m_ForceDelete = m_SerializedObject.FindProperty("m_ForceDelete");

            //EditorApplication.update += OnUpdate;
        }

        /// <summary>
        /// Callback for painting the inspector GUI for the PrefabBrush in the Tile Palette.
        /// The PrefabBrush Editor overrides this to have a custom inspector for this Brush.
        /// </summary>
        public override void OnPaintInspectorGUI()
        {
            base.OnPaintInspectorGUI();
            m_SerializedObject.UpdateIfRequiredOrScript();
            EditorGUILayout.PropertyField(m_Prefab, true);
            EditorGUILayout.PropertyField(m_ForceDelete, true);
            m_SerializedObject.ApplyModifiedPropertiesWithoutUndo();
        }
        public override void OnMouseEnter()
        {
            base.OnMouseEnter();
        }

        public override void OnMouseLeave()
        {
            base.OnMouseLeave();
            if (m_PrefabInstance != null)
            {
                DestroyImmediate(m_PrefabInstance);
            }
        }

        public override void PaintPreview(GridLayout gridLayout, GameObject brushTarget, Vector3Int position)
        {
            base.PaintPreview(gridLayout, brushTarget, position);

            if (m_PrefabInstance == null)
            {
                m_PrefabInstance = prefabBrush.InstntiatePrefabOnGrid(gridLayout, brushTarget, position, false, false);
            }
            if(m_PrefabInstance != null) 
            {
                m_PrefabInstance.transform.position = prefabBrush.GetGridPositionLocalToWorld(gridLayout, position);
                m_PrefabInstance.transform.localEulerAngles = prefabBrush.GetPrefabEulerAngles();
            }
        }
    }
}