// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/WaterShader"
{
	Properties
	{
		_ShalowColor("Shalow Color", Color) = (1,1,1,0)
		_DeepColor("Deep Color", Color) = (0,0,0,0)
		_Opacity("Opacity", Range( 0 , 100)) = 0.4941176
		_WaterDepth("Water Depth", Range( -10 , 10)) = 0
		_WaterFalloff("Water Falloff", Range( -1 , 1)) = 0
		_Speed("Speed", Range( 0 , 1)) = 1
		_Foamcolor("Foam color", Color) = (1,1,1,0)
		_FoamDepth("Foam Depth", Float) = 0
		_FoamFalloff("Foam Falloff", Float) = 0
		_Noise1Scale("Noise1Scale", Float) = 10
		_Noise1ClampMin("Noise1ClampMin", Range( 0 , 1)) = 0.36
		_Noise1ClampMax("Noise1ClampMax", Range( 0 , 1)) = 0.82
		_Noise2Scale("Noise2Scale", Float) = 10
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Off
		GrabPass{ }
		CGPROGRAM
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf Standard alpha:fade keepalpha noshadow 
		struct Input
		{
			float4 screenPos;
			float3 viewDir;
			float3 worldNormal;
			float2 uv_texcoord;
		};

		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform float4 _DeepColor;
		uniform float4 _ShalowColor;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _WaterDepth;
		uniform float _WaterFalloff;
		uniform float _Opacity;
		uniform float4 _Foamcolor;
		uniform float _Noise1Scale;
		uniform float _Noise1ClampMin;
		uniform float _Noise1ClampMax;
		uniform float _FoamDepth;
		uniform float _FoamFalloff;
		uniform float _Speed;
		uniform float _Noise2Scale;


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


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


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float2 appendResult23 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
			float4 screenColor130 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,appendResult23);
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float eyeDepth215 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float temp_output_217_0 = abs( ( eyeDepth215 - ase_screenPos.w ) );
			float4 lerpResult236 = lerp( _DeepColor , _ShalowColor , saturate( pow( ( temp_output_217_0 + _WaterDepth ) , _WaterFalloff ) ));
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float dotResult54 = dot( i.viewDir , ase_vertexNormal );
			float4 lerpResult209 = lerp( screenColor130 , lerpResult236 , pow( ( 1.0 - saturate( ( abs( dotResult54 ) - 0.0 ) ) ) , _Opacity ));
			float simplePerlin2D230 = snoise( i.uv_texcoord*_Noise1Scale );
			simplePerlin2D230 = simplePerlin2D230*0.5 + 0.5;
			float clampResult235 = clamp( simplePerlin2D230 , _Noise1ClampMin , _Noise1ClampMax );
			float temp_output_205_0 = saturate( pow( ( ( temp_output_217_0 * clampResult235 ) + _FoamDepth ) , _FoamFalloff ) );
			float2 temp_cast_0 = (_Speed).xx;
			float2 panner202 = ( _Time.x * temp_cast_0 + i.uv_texcoord);
			float simplePerlin2D229 = snoise( panner202*_Noise2Scale );
			simplePerlin2D229 = simplePerlin2D229*0.5 + 0.5;
			float4 lerpResult212 = lerp( lerpResult209 , _Foamcolor , ( 1.0 - step( temp_output_205_0 , simplePerlin2D229 ) ));
			o.Albedo = lerpResult212.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
}
/*ASEBEGIN
Version=18909
630;410;1386;909;20.17438;-3685.455;1.901619;True;False
Node;AmplifyShaderEditor.ScreenPosInputsNode;213;-272.2443,3402.316;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;231;-309.5991,3873.728;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;223;-268.697,4060.897;Inherit;False;Property;_Noise1Scale;Noise1Scale;9;0;Create;True;0;0;0;False;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;214;-255.1003,3569.977;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;215;-43.10044,3423.477;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;234;19.84074,4191.047;Inherit;False;Property;_Noise1ClampMin;Noise1ClampMin;10;0;Create;True;0;0;0;False;0;False;0.36;0.36;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;53;-519.2679,2896.344;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;233;26.21824,4303.475;Inherit;False;Property;_Noise1ClampMax;Noise1ClampMax;11;0;Create;True;0;0;0;False;0;False;0.82;0.82;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;52;-496.057,2717.002;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NoiseGeneratorNode;230;85.80634,3911.06;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;216;164.2994,3468.777;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;217;349.4963,3466.593;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;235;415.9054,3892.54;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;54;-268.2688,2766.344;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;232;710.6944,3889.476;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;190;722.1251,3531.547;Float;False;Property;_WaterDepth;Water Depth;3;0;Create;True;0;0;0;False;0;False;0;0.99;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;191;842.7589,4163.441;Float;False;Property;_FoamDepth;Foam Depth;7;0;Create;True;0;0;0;False;0;False;0;0.94;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;55;-12.26898,2767.344;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;194;1107.153,4240.38;Float;False;Property;_FoamFalloff;Foam Falloff;8;0;Create;True;0;0;0;False;0;False;0;-60;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;489.1832,4698.835;Inherit;False;Property;_Speed;Speed;5;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;192;1042.107,3983.348;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;244;598.0963,4827.051;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;193;613.7453,4547.388;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;56;161.7304,2764.344;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;195;1018.384,3601.861;Float;False;Property;_WaterFalloff;Water Falloff;4;0;Create;True;0;0;0;False;0;False;0;-3.6;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;197;1133.304,3466.195;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;202;881.0695,4600.966;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.01,0.01;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GrabScreenPosition;22;1459.191,2462.281;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;242;873.5576,4908.78;Inherit;False;Property;_Noise2Scale;Noise2Scale;12;0;Create;True;0;0;0;False;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;57;367.731,2768.344;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;201;1260.299,4033.3;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;199;1365.358,3454.292;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;198;1191.19,2880.193;Float;False;Property;_DeepColor;Deep Color;1;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0.04310164,0.2499982,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;58;543.7319,2772.344;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;204;1589.533,3354.848;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;23;1739.292,2484.057;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;60;548.7468,2926.254;Inherit;False;Property;_Opacity;Opacity;2;0;Create;True;0;0;0;False;0;False;0.4941176;0;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;205;1535.143,4095.304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;200;1177.275,3073.751;Float;False;Property;_ShalowColor;Shalow Color;0;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0.8088232,0.8088235,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;229;1118.768,4823.688;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;59;1051.749,2713.83;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;130;1933.348,2492.095;Inherit;False;Global;_GrabScreen2;Grab Screen 2;0;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;237;2173.102,3945.242;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;236;1988.475,2992.497;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;209;2286.612,2783.023;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;251;2599.358,3949.832;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;210;2531.59,3691.562;Float;False;Property;_Foamcolor;Foam color;6;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;178;2402.117,-460.6986;Inherit;False;843.903;553.8391;Screen depth difference to get intersection and fading effect with terrain and objects;5;183;182;181;180;179;;1,1,1,1;0;0
Node;AmplifyShaderEditor.AbsOpNode;183;3066.714,-316.5823;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;113;824.5797,-129.1323;Inherit;False;Property;_foamamount;foam amount;22;0;Create;True;0;0;0;False;0;False;1;281.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;99;-150.8736,1966.078;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;173;2990.26,706.7302;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;117;1097.764,26.38417;Inherit;False;Property;_foamcutoff;foam cutoff;25;0;Create;True;0;0;0;False;0;False;2;7.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;177;3310.26,882.7302;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;222;220.2437,5327.724;Inherit;False;Property;_Float7;Float 7;29;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;220;302.2888,5445.174;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;182;2881.517,-314.3983;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;219;256.9836,5094.308;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;111;1862.924,1012.638;Inherit;False;Property;_Color0;Color 0;27;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CameraDepthFade;127;-1661.588,2057.887;Inherit;False;3;2;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;123;-1919.944,1617.954;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;157;1106.588,-301.8801;Inherit;False;Property;_edgepower;edge power;26;0;Create;True;0;0;0;False;0;False;2;7.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;240;1718.289,4566.454;Inherit;False;Property;_Noise2ClampMin;Noise2ClampMin;13;0;Create;True;0;0;0;False;0;False;0.36;0.36;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;108.2069,5088.977;Inherit;False;Property;_Float6;Float 6;21;0;Create;True;0;0;0;False;0;False;1;-19.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;45;-2095.665,198.4012;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-2641.954,543.2648;Inherit;False;Property;_dist;dist;30;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;159;1368.963,-429.465;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-113.5593,2107.688;Inherit;False;Property;_21;21;19;0;Create;True;0;0;0;False;0;False;1;1;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;125;-1608.36,1701.939;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;3822.26,658.7302;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;246;1393.863,5043.767;Inherit;False;Constant;_Float9;Float 9;34;0;Create;True;0;0;0;False;0;False;-2.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;1398.297,4962.368;Inherit;False;Constant;_Float14;Float 14;34;0;Create;True;0;0;0;False;0;False;-0.51;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;241;1647.049,4694.156;Inherit;False;Property;_Noise2ClampMax;Noise2ClampMax;14;0;Create;True;0;0;0;False;0;False;0.82;0.82;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;158;1568.568,-371.2909;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;63;-2201.067,-1383.922;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;1013.09,569.1893;Inherit;False;Constant;_foamscale;foam scale;2;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;203;1170.466,4418.209;Inherit;True;Property;_Foam;Foam;23;0;Create;True;0;0;0;False;0;False;-1;b65b97caaa33d184cb4c6668e13f6966;d01457b88b1c5174ea4235d140b5fab8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;247;1392.863,5171.767;Inherit;False;Constant;_Float10;Float 10;34;0;Create;True;0;0;0;False;0;False;3.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;170;2538.318,679.0435;Inherit;False;Constant;_Float3;Float 3;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;129;-799.1992,1167.967;Inherit;False;Global;_GrabScreen1;Grab Screen 1;13;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;245;1769.349,4914.937;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;208;2408.192,4450.574;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;239;2113.862,4567.75;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;248;2345.954,4683.636;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;180;2462.117,-213.1985;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldSpaceCameraPos;124;-1988.1,1841.906;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformPositionNode;122;-2198.661,1516.934;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ScreenDepthNode;181;2674.117,-359.6986;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;108;1329.348,406.0573;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;175;3475.395,484.442;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;224;680.3574,5216.768;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-2541.399,-1360.922;Inherit;False;Property;_dfdistance;df distance;18;0;Create;True;0;0;0;False;0;False;0;0;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;66;-1842.068,-1464.922;Inherit;False;DFdist;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;134;-2493.154,319.2651;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;156;1140.699,-419.828;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;169;2718.26,434.7302;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;172;3406.26,610.7302;Inherit;False;Property;_Float5;Float 5;33;0;Create;True;0;0;0;False;0;False;2;7.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;105;621.1699,111.4969;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;97;-602.7119,1967.169;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;100;152.4407,1992.688;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;166;2569.483,429.399;Inherit;False;Property;_Float1;Float 1;31;0;Create;True;0;0;0;False;0;False;1;-19.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;131;-2790.378,115.4881;Inherit;False;Global;_GrabScreen3;Grab Screen 3;0;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;171;3022.26,994.7302;Inherit;False;Constant;_Float4;Float 4;2;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;140;-2907.4,307.0844;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;114;472.3934,106.1657;Inherit;False;Property;_tiling;tiling;20;0;Create;True;0;0;0;False;0;False;1;-19.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;176;4014.374,875.2603;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;132;-2870.127,355.5043;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;168;3246.26,482.7302;Inherit;False;Property;_Float2;Float 2;32;0;Create;True;0;0;0;False;0;False;1;281.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;126;-1263.768,1711.839;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;116;1017.221,-141.9189;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;107;981.0903,281.1893;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;137;-2181.154,400.2651;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScreenDepthNode;141;-2808.601,-20.51549;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;155;621.1309,-428.6839;Inherit;False;Property;_foamdist;foam dist;24;0;Create;True;0;0;0;False;0;False;1;281.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;115;441.2287,355.8099;Inherit;False;Property;_Float11;Float 11;28;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;109;1339.94,-114.3109;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenDepthNode;98;-360.8363,1873.011;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;212;2861.123,3678.726;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TimeNode;167;2766.26,786.7302;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;71;2334.905,1209.171;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-2349.553,203.9841;Inherit;False;Property;_DepthDistance;Depth Distance;15;0;Create;True;0;0;0;False;0;False;10;82.6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;139;-1966.095,394.282;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;112;2064.235,767.6564;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;48;213.1185,1513.858;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;47;-192.3263,1414.245;Inherit;False;Property;_ColorMain;Color Main;17;0;Create;True;0;0;0;False;0;False;0.145098,0.6430371,0.8313726,0.2;0.3168386,0.6345675,0.7547169,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;46;-313.0315,1577.736;Inherit;False;Property;_Color2nd;Color 2nd;16;0;Create;True;0;0;0;False;0;False;0.1420434,0.3089856,0.5283019,0.1568628;0.2858668,0.5286051,0.8301887,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DepthFade;154;850.2659,-425.9721;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;104;744.3019,420.3358;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;110;1859.474,505.6119;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;179;2444.973,-380.8593;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;102;341.6986,1916.446;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;62;1346.91,1155.296;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;20;3076.336,3679.261;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lichthund/WaterShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;16;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;215;0;213;0
WireConnection;230;0;231;0
WireConnection;230;1;223;0
WireConnection;216;0;215;0
WireConnection;216;1;214;4
WireConnection;217;0;216;0
WireConnection;235;0;230;0
WireConnection;235;1;234;0
WireConnection;235;2;233;0
WireConnection;54;0;52;0
WireConnection;54;1;53;0
WireConnection;232;0;217;0
WireConnection;232;1;235;0
WireConnection;55;0;54;0
WireConnection;192;0;232;0
WireConnection;192;1;191;0
WireConnection;56;0;55;0
WireConnection;197;0;217;0
WireConnection;197;1;190;0
WireConnection;202;0;193;0
WireConnection;202;2;243;0
WireConnection;202;1;244;1
WireConnection;57;0;56;0
WireConnection;201;0;192;0
WireConnection;201;1;194;0
WireConnection;199;0;197;0
WireConnection;199;1;195;0
WireConnection;58;0;57;0
WireConnection;204;0;199;0
WireConnection;23;0;22;1
WireConnection;23;1;22;2
WireConnection;205;0;201;0
WireConnection;229;0;202;0
WireConnection;229;1;242;0
WireConnection;59;0;58;0
WireConnection;59;1;60;0
WireConnection;130;0;23;0
WireConnection;237;0;205;0
WireConnection;237;1;229;0
WireConnection;236;0;198;0
WireConnection;236;1;200;0
WireConnection;236;2;204;0
WireConnection;209;0;130;0
WireConnection;209;1;236;0
WireConnection;209;2;59;0
WireConnection;251;0;237;0
WireConnection;183;0;182;0
WireConnection;99;0;98;0
WireConnection;99;1;97;4
WireConnection;173;0;169;0
WireConnection;173;2;170;0
WireConnection;173;1;167;1
WireConnection;177;0;173;0
WireConnection;177;1;171;0
WireConnection;182;0;181;0
WireConnection;182;1;180;4
WireConnection;219;0;218;0
WireConnection;45;0;44;0
WireConnection;159;0;156;0
WireConnection;125;0;123;0
WireConnection;125;1;124;0
WireConnection;174;0;175;0
WireConnection;174;1;172;0
WireConnection;158;0;159;0
WireConnection;158;1;157;0
WireConnection;63;0;64;0
WireConnection;203;1;202;0
WireConnection;245;0;229;0
WireConnection;245;1;249;0
WireConnection;245;3;246;0
WireConnection;245;4;247;0
WireConnection;208;0;205;0
WireConnection;208;1;239;0
WireConnection;239;0;245;0
WireConnection;239;1;240;0
WireConnection;239;2;241;0
WireConnection;248;0;239;0
WireConnection;181;0;179;0
WireConnection;108;0;107;0
WireConnection;108;1;106;0
WireConnection;175;0;168;0
WireConnection;224;0;219;0
WireConnection;224;2;222;0
WireConnection;224;1;220;1
WireConnection;66;0;63;0
WireConnection;134;0;131;0
WireConnection;134;1;140;0
WireConnection;156;0;154;0
WireConnection;169;0;166;0
WireConnection;105;0;114;0
WireConnection;100;0;99;0
WireConnection;100;1;101;0
WireConnection;176;0;174;0
WireConnection;176;1;177;0
WireConnection;126;1;125;0
WireConnection;116;0;113;0
WireConnection;107;0;105;0
WireConnection;107;2;115;0
WireConnection;107;1;104;1
WireConnection;137;0;134;0
WireConnection;137;1;138;0
WireConnection;109;0;116;0
WireConnection;109;1;117;0
WireConnection;212;0;209;0
WireConnection;212;1;210;0
WireConnection;212;2;251;0
WireConnection;71;0;62;0
WireConnection;71;1;111;0
WireConnection;71;2;112;0
WireConnection;139;0;137;0
WireConnection;112;0;176;0
WireConnection;112;1;111;4
WireConnection;48;0;47;0
WireConnection;48;1;46;0
WireConnection;154;0;155;0
WireConnection;110;0;109;0
WireConnection;110;1;108;0
WireConnection;102;0;100;0
WireConnection;62;1;48;0
WireConnection;20;0;212;0
ASEEND*/
//CHKSM=C761806E10B7E54C0E447035F8DC425E37AA1FEE