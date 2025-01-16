// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/WindShader"
{
	Properties
	{
		_Color0("Color", Color) = (0.3921569,0.5294118,0.2196079,1)
		_Color1("Color 1", Color) = (1,0,0,0)
		_winddirection("wind direction", Vector) = (1,0,0,0)
		_windstr("wind str", Range( 0 , 1)) = 0.2
		_windspeed("wind speed", Range( 0 , 2)) = 1.2
		_timescale("time scale", Float) = 1
		_Float13("Float 13", Range( 0 , 10)) = 0.6479343
		[ToggleUI]_ToggleSwitch0("Toggle Switch0", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Off
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#include "TerrainEngine.cginc"
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float3 viewDir;
		};

		uniform float2 _winddirection;
		uniform float _windspeed;
		uniform float _timescale;
		uniform float _windstr;
		uniform float _ToggleSwitch0;
		uniform float4 _Color1;
		uniform float _Float13;
		uniform float4 _Color0;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float2 normalizeResult138 = normalize( _winddirection );
			float mulTime141 = _Time.y * _timescale;
			float simplePerlin2D134 = snoise( ( (ase_worldPos).xz + ( ( normalizeResult138 * _windspeed ) * mulTime141 ) ) );
			simplePerlin2D134 = simplePerlin2D134*0.5 + 0.5;
			float temp_output_146_0 = ( simplePerlin2D134 * _windstr );
			float3 worldToObj151 = mul( unity_WorldToObject, float4( ( ase_worldPos + temp_output_146_0 ), 1 ) ).xyz;
			v.vertex.xyz = worldToObj151;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldNormal = i.worldNormal;
			float dotResult204 = dot( ase_worldNormal , i.viewDir );
			float4 lerpResult207 = lerp( ( _Color1 * _Float13 ) , _Color0 , dotResult204);
			o.Albedo = (( _ToggleSwitch0 )?( _Color0 ):( lerpResult207 )).rgb;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float3 worldPos : TEXCOORD1;
				float3 worldNormal : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = worldViewDir;
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18909
630;410;1386;909;-1916.355;1333.325;1.665033;True;False
Node;AmplifyShaderEditor.Vector2Node;135;359.4336,169.8859;Inherit;False;Property;_winddirection;wind direction;26;0;Create;True;0;0;0;False;0;False;1,0;1,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.NormalizeNode;138;562.2938,196.136;Inherit;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;147;627.8883,509.7927;Inherit;False;Property;_timescale;time scale;29;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;136;494.7358,361.6756;Inherit;False;Property;_windspeed;wind speed;28;0;Create;True;0;0;0;False;0;False;1.2;0.707;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;139;743.9598,166.9797;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode;128;566.5897,-44.26771;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;141;817.973,420.4151;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;962.754,162.5928;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;150;801.2011,-41.64426;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;133;1101.588,7.888288;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;134;1295.778,-58.02507;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;137;1238.445,-254.1193;Inherit;False;Property;_windstr;wind str;27;0;Create;True;0;0;0;False;0;False;0.2;0.265;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;202;2737.583,-747.8502;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;203;2833.337,-628.3429;Inherit;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;205;2973.458,-1142.593;Inherit;False;Property;_Color1;Color 1;1;0;Create;True;0;0;0;False;0;False;1,0,0,0;0.2792441,0.4470588,0.2029647,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;210;3336.744,-608.4015;Inherit;False;Property;_Float13;Float 13;31;0;Create;True;0;0;0;False;0;False;0.6479343;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;209;3465.357,-1048.944;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;204;3086.035,-683.6003;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;143;1790.43,216.5689;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;20;2643.299,-969.8157;Inherit;False;Property;_Color0;Color;0;0;Create;False;0;0;0;False;0;False;0.3921569,0.5294118,0.2196079,1;0.3921568,0.5294118,0.2196077,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;146;1600.106,-334.8094;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;142;1860.281,-58.72298;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;207;3823.993,-930.4218;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldPosInputsNode;30;-1068.194,128.489;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;152;2541.052,2420.225;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;177;3262.578,337.4919;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;68;1216.42,852.9788;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;153;2485.052,2201.225;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;118;-2910.841,1909.82;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;181;1786.388,727.6329;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;41;-823.8392,166.6057;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;189;3030.239,-164.1616;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;58;844.5349,1432.917;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;188;2844.812,-69.90856;Inherit;False;Constant;_Vector3;Vector 3;2;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-183.7742,1415.987;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;13;176.2483,-409.7544;Inherit;False;Property;_Vector0;Vector 0;4;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RotateAboutAxisNode;71;2064.426,1373.712;Inherit;False;False;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;66;1299.224,1770.707;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-350.4166,-614.1826;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;183;2565.198,830.1922;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;38;-661.6832,557.0931;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;96;112.959,2597.665;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;158;2526.182,2058.115;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;101;688.959,2853.665;Float;False;Property;_SecondaryFactor;SecondaryFactor;18;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;92;1504.959,2725.665;Float;False;Property;_TreeOffset;Tree Offset;12;0;Create;True;0;0;0;False;0;False;0,5,0;0,0.48,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;108;-4097.09,1723.941;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;116;-3304.009,1600.53;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;179;3003.331,177.64;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;149;2041.254,-303.2393;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;65;1057.782,1781.556;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;6;-1064.033,-188.304;Inherit;False;Property;_bend;bend;5;0;Create;True;0;0;0;False;0;False;100;100;1;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;36;-956.483,394.7937;Inherit;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode;95;-63.04102,2565.665;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-335.6656,1717.844;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;174;2133.388,789.6329;Inherit;False;Constant;_Float10;Float 10;3;0;Create;True;0;0;0;False;0;False;-0.001;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;186;3042.151,68.87294;Inherit;False;Constant;_Float11;Float 11;0;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;187;3508.165,175.9153;Inherit;True;3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;180;1827.388,527.6329;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StepOpNode;182;2315.388,596.6329;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;419.0642,-514.0702;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;61;287.5349,1641.917;Inherit;False;Property;_BendRight;Bend Right;15;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SwitchByFaceNode;161;2844.383,1833.88;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;24;695.661,1022.211;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalVertexDataNode;154;2237.883,1846.167;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-600.2958,-632.9418;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;90;1200.959,2677.665;Float;False;Property;_TreeInstanceScale;_TreeInstanceScale;16;0;Fetch;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalizeNode;162;2843.309,2076.539;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;57;410.3918,1432.884;Inherit;False;Property;_Bendpower;Bend power;13;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;125;-2131.82,1909.506;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;91;1456.959,2469.665;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StepOpNode;159;2983.052,2288.225;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;185;3493.851,625.1101;Inherit;False;Property;_FrontColor;FrontColor;3;0;Create;True;0;0;0;False;0;False;0.3921569,0.5294118,0.2196079,1;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;105;944.959,2613.665;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;184;3296.889,723.1468;Inherit;False;Property;_BackFace;BackFace;6;0;Create;True;0;0;0;False;0;False;0.4528302,0.01495195,0.02961699,1;0.2827587,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;156;2884.052,2461.225;Inherit;False;Constant;_Float7;Float 7;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;15;607.6282,-532.6403;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;99;608.959,2549.665;Float;False;Property;_EdgeFlutter;EdgeFlutter;22;0;Create;True;0;0;0;False;0;False;1;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;672.959,2437.665;Float;False;Property;_BranchPhase;BranchPhase;23;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;193;1065.536,531.7443;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;17;1151.208,-832.8956;Inherit;True;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;117;-3163.947,1867.776;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;1659.751,1489.369;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;39;-10.34493,227.4635;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-990.8952,-406.9417;Inherit;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;23;657.3232,-376.2418;Inherit;False;Constant;_Int0;Int 0;2;0;Create;True;0;0;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;191;1503.186,235.3359;Inherit;True;Simple;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;20.18;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;199;2301.268,-1452.115;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;113;-3792.009,1764.53;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;56;548.3354,1288.655;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;164;3330.834,1348.467;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NoiseGeneratorNode;55;207.6902,1211.593;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;6.38;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;170;3818.834,1417.467;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-207.0483,1237.924;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-680.7742,1463.987;Inherit;False;Property;_Goffsetstrength;G offset strength;10;0;Create;True;0;0;0;False;0;False;0.25;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;75;-592.853,1889.839;Inherit;False;Property;_Float4;Float 4;21;0;Create;True;0;0;0;False;0;False;0.2;-0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;192;1152.536,317.7443;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;50;-582.7742,1547.987;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;34;-1176.483,368.7937;Inherit;False;Property;_Vector1;Vector 1;8;0;Create;True;0;0;0;False;0;False;0,1;0,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.WorldPosInputsNode;124;-2418.458,1716.276;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;198;2235.168,-1198.434;Float;False;Constant;_Float12;Float 12;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;16;765.9532,-557.5909;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;73;1895.836,1618.199;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;47;43.46606,1275.361;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;110;-4371.09,1968.941;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-474.103,372.3684;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;190;2794.075,-285.4363;Inherit;False;Tangent;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;94;1136.959,2501.665;Inherit;False;Terrain Wind Animate Vertex;-1;;2;3bc81bd4568a7094daabf2ccd6a7e125;0;3;2;FLOAT4;0,0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector3Node;69;1257.812,1079.019;Inherit;False;Constant;_Vector2;Vector 2;12;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;155;2725.052,2269.225;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;59;625.5349,1512.917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;1;-1142.285,-675.4508;Inherit;True;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;98;256.959,2661.665;Inherit;False;FLOAT;2;1;2;3;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-699.0128,1759.449;Inherit;False;Property;_BendPanSpeed;Bend Pan Speed;11;0;Create;True;0;0;0;False;0;False;3.17;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-921.4166,-307.1823;Inherit;False;Constant;_Float2;Float 2;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;165;3330.834,1158.467;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;1403.075,1520.055;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;97;272.959,2549.665;Inherit;False;FLOAT;0;1;2;3;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;131;346.3003,-96.3548;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;127;-3124.861,2193.84;Inherit;False;Property;_direction;direction;25;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;19;1029.573,-817.5305;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;768.959,2613.665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;62;1117.205,1444.776;Inherit;False;_Bend;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;76;1622.196,1877.322;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;74;2748.587,1390.477;Inherit;False;vertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-650.4832,355.7937;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;12;152.5835,-544.1824;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;171;4016.049,1113.944;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-4591.09,2013.941;Inherit;False;Property;_bendstrength;bend strength;24;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;163;3289.834,1548.467;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;1496.011,1143.9;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;18;734.8512,-893.8947;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-114.4165,-550.1824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;294.5349,1542.917;Inherit;False;Property;_BendLeft;Bend Left;14;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-451.6909,-380.8412;Inherit;False;Constant;_Float3;Float 3;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;1015.704,1625.623;Inherit;False;Property;_Bendstrength;Bend strength;17;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;194;1318.536,477.7443;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;123;-2700.46,2020.219;Inherit;True;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;35;-1255.483,537.5199;Inherit;False;Property;_Float1;Float 1;7;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-3557.199,1762.967;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;106;-4654.215,1716.512;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;132;234.6337,-86.04841;Inherit;False;FLOAT;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.NegateNode;169;3634.834,1263.468;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;166;3552.834,1374.467;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;178;2049.388,553.6329;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;211;3748.279,-590.6713;Inherit;False;Property;_ToggleSwitch0;Toggle Switch0;32;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PosVertexDataNode;144;1806.662,-458.1549;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;5;-705.5324,-303.5036;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;168;3683.834,1167.467;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;121;-2445.969,1986.416;Inherit;True;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;167;3636.834,1610.467;Inherit;False;Constant;_Float9;Float 9;3;0;Create;True;0;0;0;False;0;False;-0.001;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;25;1735.212,1077.096;Inherit;True;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;114;-3955.009,2008.53;Inherit;False;Constant;_Float6;Float 6;19;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;102;688.959,2741.665;Float;False;Property;_PrimaryFactor;PrimaryFactor;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2;-1375.565,-657.951;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;42;-486.6443,1167.61;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TransformPositionNode;151;2197.158,-16.43467;Inherit;False;World;Object;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;208;3120.448,-564.2087;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;176;2672.738,521.6169;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-4561.09,2128.94;Inherit;False;Constant;_Float8;Float 8;19;0;Create;True;0;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;201;2761.869,-1374.466;Inherit;True;Property;_matcapimage;matcap image;30;2;[Header];[NoScaleOffset];Create;True;1;matcap;0;0;False;1;ShowOnlyInWorkflow3;False;-1;b23676ff9cac20a4c9c7b9333f055f1b;d7e73dcb8c47b664a868912c42e7ec46;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;197;2077.018,-1471.561;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;200;2487.318,-1457.894;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-613.7742,1374.987;Inherit;False;Constant;_Float5;Float 5;5;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-770.9192,1282.058;Inherit;False;Property;_Bendnoisescale;Bend noise scale;9;0;Create;True;0;0;0;False;0;False;1.193944;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;43;-730.9992,1129.494;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewMatrixNode;196;1958.479,-1499.347;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.WorldNormalVector;195;1826.119,-1381.748;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;173;4096.184,1402.451;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;126;-1891.82,1910.506;Inherit;True;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-302.4833,195.7939;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;23.58351,-650.1825;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;93;1632.959,2437.665;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;107;-4431.08,1709.156;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;100;432.959,2581.665;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;1096.783,1990.846;Inherit;False;Property;_BendmaskPOW;Bend mask POW;19;0;Create;True;0;0;0;False;0;False;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;51;-144.1478,1579.233;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;206;3385.963,-530.9014;Inherit;False;Property;_Color2;Color 2;2;0;Create;True;0;0;0;False;0;False;0.7264151,0.7264151,0.7264151,0;0.7264151,0.7264151,0.7264151,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3821.416,-389.641;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lichthund/WindShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;16;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;138;0;135;0
WireConnection;139;0;138;0
WireConnection;139;1;136;0
WireConnection;141;0;147;0
WireConnection;140;0;139;0
WireConnection;140;1;141;0
WireConnection;150;0;128;0
WireConnection;133;0;150;0
WireConnection;133;1;140;0
WireConnection;134;0;133;0
WireConnection;209;0;205;0
WireConnection;209;1;210;0
WireConnection;204;0;202;0
WireConnection;204;1;203;0
WireConnection;146;0;134;0
WireConnection;146;1;137;0
WireConnection;142;0;143;0
WireConnection;142;1;146;0
WireConnection;207;0;209;0
WireConnection;207;1;20;0
WireConnection;207;2;204;0
WireConnection;177;0;179;0
WireConnection;118;0;117;0
WireConnection;118;1;127;0
WireConnection;41;0;30;0
WireConnection;189;0;190;0
WireConnection;189;1;188;0
WireConnection;58;0;56;0
WireConnection;58;3;59;0
WireConnection;58;4;61;0
WireConnection;48;0;49;0
WireConnection;48;1;50;2
WireConnection;71;0;25;0
WireConnection;71;1;78;0
WireConnection;71;3;73;0
WireConnection;66;0;67;0
WireConnection;8;0;3;0
WireConnection;8;1;9;0
WireConnection;183;2;182;0
WireConnection;96;0;95;0
WireConnection;158;0;154;0
WireConnection;108;0;107;2
WireConnection;108;1;110;0
WireConnection;116;0;115;0
WireConnection;116;1;115;0
WireConnection;149;0;146;0
WireConnection;149;1;144;0
WireConnection;36;0;34;0
WireConnection;52;0;53;0
WireConnection;52;1;75;0
WireConnection;187;0;189;0
WireConnection;187;1;186;0
WireConnection;187;2;179;0
WireConnection;187;3;177;0
WireConnection;182;0;178;0
WireConnection;182;1;174;0
WireConnection;14;0;12;0
WireConnection;14;1;13;0
WireConnection;161;0;154;0
WireConnection;161;1;158;0
WireConnection;3;0;1;2
WireConnection;3;1;5;0
WireConnection;162;0;158;0
WireConnection;125;0;124;0
WireConnection;125;1;121;0
WireConnection;91;0;94;0
WireConnection;91;1;90;0
WireConnection;159;0;155;0
WireConnection;159;1;156;0
WireConnection;105;0;103;0
WireConnection;105;1;104;0
WireConnection;105;2;102;0
WireConnection;105;3;101;0
WireConnection;15;0;14;0
WireConnection;17;0;19;0
WireConnection;117;0;116;0
WireConnection;117;1;115;0
WireConnection;78;0;63;0
WireConnection;78;1;76;2
WireConnection;39;0;33;0
WireConnection;191;0;194;0
WireConnection;199;0;197;0
WireConnection;199;1;198;0
WireConnection;113;0;108;0
WireConnection;113;1;114;0
WireConnection;56;0;55;0
WireConnection;56;1;57;0
WireConnection;55;0;47;0
WireConnection;170;0;166;0
WireConnection;170;1;167;0
WireConnection;45;0;42;0
WireConnection;45;1;44;0
WireConnection;45;2;46;0
WireConnection;16;0;15;0
WireConnection;16;1;23;0
WireConnection;16;2;15;1
WireConnection;47;0;45;0
WireConnection;47;1;48;0
WireConnection;47;2;51;0
WireConnection;110;0;111;0
WireConnection;110;1;112;0
WireConnection;40;0;37;0
WireConnection;40;1;38;0
WireConnection;94;4;105;0
WireConnection;155;0;153;0
WireConnection;155;1;152;0
WireConnection;59;0;60;0
WireConnection;1;0;2;0
WireConnection;98;0;96;0
WireConnection;63;0;62;0
WireConnection;63;1;64;0
WireConnection;63;2;66;0
WireConnection;97;0;96;0
WireConnection;131;0;132;0
WireConnection;19;0;18;0
WireConnection;19;1;16;0
WireConnection;104;0;99;0
WireConnection;104;1;100;0
WireConnection;62;0;58;0
WireConnection;74;0;71;0
WireConnection;37;0;36;0
WireConnection;37;1;35;0
WireConnection;12;0;11;0
WireConnection;12;1;10;0
WireConnection;171;0;168;0
WireConnection;171;1;169;0
WireConnection;171;2;173;0
WireConnection;70;0;68;0
WireConnection;70;1;69;0
WireConnection;10;0;8;0
WireConnection;10;1;8;0
WireConnection;194;0;192;0
WireConnection;194;1;193;0
WireConnection;123;0;118;0
WireConnection;115;0;113;0
WireConnection;115;1;113;0
WireConnection;169;0;165;0
WireConnection;166;0;164;0
WireConnection;166;1;163;0
WireConnection;178;0;180;0
WireConnection;178;1;181;0
WireConnection;211;0;207;0
WireConnection;211;1;20;0
WireConnection;5;0;7;0
WireConnection;5;1;6;0
WireConnection;168;0;165;0
WireConnection;121;0;123;0
WireConnection;121;2;123;1
WireConnection;25;0;70;0
WireConnection;42;0;43;0
WireConnection;151;0;142;0
WireConnection;176;0;178;0
WireConnection;201;1;200;0
WireConnection;197;0;196;0
WireConnection;197;1;195;0
WireConnection;200;0;199;0
WireConnection;200;1;198;0
WireConnection;173;0;166;0
WireConnection;126;0;125;0
WireConnection;33;0;41;0
WireConnection;33;1;40;0
WireConnection;11;0;10;0
WireConnection;11;1;10;0
WireConnection;93;0;91;0
WireConnection;93;1;92;0
WireConnection;107;0;106;0
WireConnection;100;0;97;0
WireConnection;100;1;98;0
WireConnection;51;0;52;0
WireConnection;0;0;211;0
WireConnection;0;11;151;0
ASEEND*/
//CHKSM=728AF9F474FE8D0BAC78AF4D5FF1F62866A9C758