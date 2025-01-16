// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/Gradient Shader 2"
{
	Properties
	{
		[KeywordEnum(Building,Prop,Foodtruck,Matcap,Car,Blocks,NPC)] _Workflow("Workflow", Float) = 0
		[HDR][ColorSection]_primaryColor("Color", Color) = (1,1,1,0)
		_primaryGradientMultiply("GradientMultiply", Range( 0 , 1)) = 0.6
		_primaryGradientPower("GradientPower", Range( 0.001 , 10)) = 1
		[Toggle4][ToggleUI]_SetGradientColor("Set GradientColor", Float) = 0
		[Group4]_primaryGradientColor("GradientColor", Color) = (0,0,0,0)
		[Toggle3][ToggleUI]_randomcolortoggle("randomcolor toggle", Float) = 0
		[Group3]_randomcolorRangeMin("randomcolor RangeMin", Range( -6 , 0)) = -1
		[Group3]_randomcolorRangeMax("randomcolor RangeMax", Range( 0 , 6)) = 1.5
		[Group3]_RandomColorHue1("RandomColor Hue", Range( 0 , 1)) = 0.1
		[Group3]_randomcolorSeed("randomcolor Seed", Range( 0 , 1)) = 0
		[HDR][ColorSection]_secondaryColor("Color", Color) = (1,1,1,0)
		_secondaryGradientMultiply("GradientMultiply", Range( 0 , 1)) = 0.6
		_secondaryGradientPower("GradientPower", Range( 0.001 , 10)) = 1
		[Toggle5][ToggleUI]_SetGradientColor2("Set GradientColor", Float) = 0
		[Group5]_secondaryGradientColor("GradientColor", Color) = (0,0,0,0)
		[ColorSection]_front1Color("Color", Color) = (1,1,1,0)
		_GradientMultiply1("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower1("GradientPower", Range( 0.001 , 10)) = 1
		[ColorSection]_front2Color("Color", Color) = (1,1,1,0)
		_GradientMultiply2("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower2("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_windowColor("Color", Color) = (1,1,1,0)
		_GradientMultiply3("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower3("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_windowborderColor("Color", Color) = (1,1,1,0)
		_GradientMultiply4("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower4("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_whiteColor("Color", Color) = (0.6,0.6,0.6,0)
		_GradientMultiply5("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower5("GradientPower", Range( 0.001 , 10)) = 1
		[ColorSection]_blackColor("Color", Color) = (0.097,0.097,0.097,0)
		_GradientMultiply6("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower6("GradientPower", Range( 0.001 , 10)) = 1
		[ColorSection]_detailColor("Color", Color) = (1,1,1,0)
		_GradientMultiply7("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower7("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_deco_aColor("Color", Color) = (1,1,1,0)
		_GradientMultiply8("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower8("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_deco_bColor("Color", Color) = (1,1,1,0)
		_GradientMultiply9("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower9("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_deco_cColor("Color", Color) = (1,1,1,0)
		_GradientMultiply10("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower10("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_bonus_aColor("Color", Color) = (1,1,1,0)
		_GradientMultiply11("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower11("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_bonus_bColor("Color", Color) = (1,1,1,0)
		_GradientMultiply12("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower12("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_bonus_cColor("Color", Color) = (1,1,1,0)
		_GradientMultiply13("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower13("GradientPower", Range( 0.001 , 10)) = 1
		[HDR][ColorSection]_bonus_dColor("Color", Color) = (1,1,1,0)
		_GradientMultiply14("GradientMultiply", Range( 0 , 1)) = 0.6
		_GradientPower14("GradientPower", Range( 0.001 , 10)) = 1
		[HideInInspector]_GridMask("GridMask", 2D) = "white" {}
		[Header(HSV)][ColorSection]_Hue1("Hue", Range( 0 , 1)) = 0
		_Saturation1("Saturation", Range( 0 , 2)) = 1
		_Value1("Value", Range( -1 , 1)) = 0
		[Toggle2][Toggle(_WORLDSPACEGRADIENTTOGGLE_ON)] _WorldSpaceGradientToggle("WorldSpaceGradient Toggle", Float) = 0
		[Group2]_TopColor("TopColor", Color) = (1,1,1,0)
		[Group2]_BottomColor("BottomColor", Color) = (0.1698113,0.1465824,0.1465824,0)
		[Group2]_Height("Height", Range( 0 , 20)) = 7
		[Group2]_Power("Power", Range( 0 , 1)) = 1
		[Toggle1][ToggleOff(_EMISSIONTOGGLE_OFF)] _Emissiontoggle("Emission toggle", Float) = 0
		[Group1]_Emission1power("Emission1 power", Range( 0 , 1)) = 0
		[Group1]_Emission2power("Emission2 power", Range( 0 , 1)) = 0
		[Group1]_Emission3power("Emission3 power", Range( 0 , 1)) = 0
		[Group1]_Emission4power("Emission4 power", Range( 0 , 1)) = 0
		[Group1]_EmissionWindowpower("EmissionWindow power", Range( 0 , 1)) = 0
		[IntRange]_Float2("Float 2", Range( 0 , 5)) = 0
		[Header(matcap)][NoScaleOffset][ShowOnlyInWorkflow3]_matcapimage("matcap image", 2D) = "white" {}
		[Header(decal)][ShowOnlyInWorkflow2]_decalColor("decal Color", Color) = (0,0,0,0)
		[Header(Foodtruck decal)][ShowOnlyInWorkflow2]_decalMask("decal Mask", 2D) = "white" {}
		[ShowOnlyInWorkflow2]_decalOffset("decal Offset", Vector) = (0,0,0,0)
		[HideInInspector]_decalMaskUV("decal MaskUV", 2D) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _WORKFLOW_BUILDING _WORKFLOW_PROP _WORKFLOW_FOODTRUCK _WORKFLOW_MATCAP _WORKFLOW_CAR _WORKFLOW_BLOCKS _WORKFLOW_NPC
		#pragma shader_feature_local _WORLDSPACEGRADIENTTOGGLE_ON
		#pragma shader_feature_local _EMISSIONTOGGLE_OFF
		struct Input
		{
			float2 uv_texcoord;
			float3 worldNormal;
			float2 uv3_texcoord3;
			float3 worldPos;
		};

		uniform float _SetGradientColor;
		uniform float4 _primaryColor;
		uniform float _primaryGradientMultiply;
		uniform float4 _primaryGradientColor;
		uniform float _randomcolortoggle;
		uniform float _RandomColorHue1;
		uniform float _randomcolorRangeMin;
		uniform float _randomcolorRangeMax;
		uniform float _randomcolorSeed;
		uniform sampler2D _GridMask;
		uniform float4 _GridMask_ST;
		uniform float _primaryGradientPower;
		uniform float _SetGradientColor2;
		uniform float4 _secondaryColor;
		uniform float _secondaryGradientMultiply;
		uniform float4 _secondaryGradientColor;
		uniform float _secondaryGradientPower;
		uniform float4 _front1Color;
		uniform float _GradientMultiply1;
		uniform float _GradientPower1;
		uniform float4 _front2Color;
		uniform float _GradientMultiply2;
		uniform float _GradientPower2;
		uniform float4 _windowColor;
		uniform float _GradientMultiply3;
		uniform float _GradientPower3;
		uniform float4 _windowborderColor;
		uniform float _GradientMultiply4;
		uniform float _GradientPower4;
		uniform float4 _whiteColor;
		uniform float _GradientMultiply5;
		uniform float _GradientPower5;
		uniform float4 _blackColor;
		uniform float _GradientMultiply6;
		uniform float _GradientPower6;
		uniform float _Float2;
		uniform float4 _detailColor;
		uniform float _GradientMultiply7;
		uniform float _GradientPower7;
		uniform float4 _deco_aColor;
		uniform float _GradientMultiply8;
		uniform float _GradientPower8;
		uniform float4 _deco_bColor;
		uniform float _GradientMultiply9;
		uniform float _GradientPower9;
		uniform float4 _deco_cColor;
		uniform float _GradientMultiply10;
		uniform float _GradientPower10;
		uniform float4 _bonus_aColor;
		uniform float _GradientMultiply11;
		uniform float _GradientPower11;
		uniform float4 _bonus_bColor;
		uniform float _GradientMultiply12;
		uniform float _GradientPower12;
		uniform float4 _bonus_cColor;
		uniform float _GradientMultiply13;
		uniform float _GradientPower13;
		uniform float4 _bonus_dColor;
		uniform float _GradientMultiply14;
		uniform float _GradientPower14;
		uniform sampler2D _matcapimage;
		uniform float _Hue1;
		uniform float _Saturation1;
		uniform float _Value1;
		uniform float4 _decalColor;
		uniform sampler2D _decalMask;
		uniform float2 _decalOffset;
		uniform sampler2D _decalMaskUV;
		uniform float4 _BottomColor;
		uniform float4 _TopColor;
		uniform float _Height;
		uniform float _Power;
		uniform float _Emission1power;
		uniform float _Emission2power;
		uniform float _Emission3power;
		uniform float _Emission4power;
		uniform float _EmissionWindowpower;


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		float3 RGBToHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
			float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
			float d = q.x - min( q.w, q.y );
			float e = 1.0e-10;
			return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 temp_output_3_0_g1610 = (( _SetGradientColor )?( _primaryGradientColor ):( ( _primaryColor * _primaryGradientMultiply ) ));
			float4 temp_output_29_0_g1587 = _primaryColor;
			float3 hsvTorgb34_g1587 = RGBToHSV( temp_output_29_0_g1587.rgb );
			float3 hsvTorgb32_g1587 = HSVToRGB( float3(( hsvTorgb34_g1587.x + _RandomColorHue1 ),hsvTorgb34_g1587.y,hsvTorgb34_g1587.z) );
			float4 transform37_g1587 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float4 break41_g1587 = transform37_g1587;
			float2 appendResult42_g1587 = (float2(break41_g1587.x , break41_g1587.z));
			float dotResult35_g1587 = dot( ( appendResult42_g1587 + _randomcolorSeed ) , float2( 12.9898,78.233 ) );
			float lerpResult44_g1587 = lerp( _randomcolorRangeMin , _randomcolorRangeMax , sin( dotResult35_g1587 ));
			float4 lerpResult31_g1587 = lerp( temp_output_29_0_g1587 , float4( hsvTorgb32_g1587 , 0.0 ) , lerpResult44_g1587);
			float4 temp_output_6_0_g1610 = (( _randomcolortoggle )?( lerpResult31_g1587 ):( _primaryColor ));
			float2 uv_GridMask = i.uv_texcoord * _GridMask_ST.xy + _GridMask_ST.zw;
			float4 GridMask2590 = tex2D( _GridMask, uv_GridMask );
			float temp_output_25_0_g1174 = 0.01;
			float4 temp_cast_2 = (temp_output_25_0_g1174).xxxx;
			float4 temp_output_22_0_g1174 = step( GridMask2590 , temp_cast_2 );
			float4 temp_output_44_0_g1174 = float4( 0,0,0,0 );
			float4 temp_output_45_0_g1174 = ( temp_output_22_0_g1174 - temp_output_44_0_g1174 );
			float4 temp_cast_3 = (temp_output_25_0_g1174).xxxx;
			float2 uv_TexCoord2585 = i.uv_texcoord * float2( 1,4 );
			float GridGradient2591 = frac( ( uv_TexCoord2585.y * 1.0 ) );
			float4 temp_cast_4 = (_primaryGradientPower).xxxx;
			float4 lerpResult4_g1610 = lerp( temp_output_3_0_g1610 , temp_output_6_0_g1610 , pow( ( temp_output_45_0_g1174 * ( ( temp_output_22_0_g1174 * GridGradient2591 ) - temp_output_44_0_g1174 ) ) , temp_cast_4 ));
			float4 temp_cast_5 = (temp_output_25_0_g1174).xxxx;
			float4 temp_output_3_0_g1605 = (( _SetGradientColor2 )?( _secondaryGradientColor ):( ( _secondaryColor * _secondaryGradientMultiply ) ));
			float4 temp_output_6_0_g1605 = _secondaryColor;
			float temp_output_25_0_g1175 = 0.02;
			float4 temp_cast_6 = (temp_output_25_0_g1175).xxxx;
			float4 temp_output_22_0_g1175 = step( GridMask2590 , temp_cast_6 );
			float4 temp_cast_7 = (temp_output_25_0_g1174).xxxx;
			float4 temp_output_44_0_g1175 = temp_output_22_0_g1174;
			float4 temp_output_45_0_g1175 = ( temp_output_22_0_g1175 - temp_output_44_0_g1175 );
			float4 temp_cast_8 = (temp_output_25_0_g1175).xxxx;
			float4 temp_cast_9 = (_secondaryGradientPower).xxxx;
			float4 lerpResult4_g1605 = lerp( temp_output_3_0_g1605 , temp_output_6_0_g1605 , pow( ( temp_output_45_0_g1175 * ( ( temp_output_22_0_g1175 * GridGradient2591 ) - temp_output_44_0_g1175 ) ) , temp_cast_9 ));
			float4 temp_cast_10 = (temp_output_25_0_g1175).xxxx;
			float4 temp_output_2838_0 = ( ( lerpResult4_g1610 * temp_output_45_0_g1174 ) + ( lerpResult4_g1605 * temp_output_45_0_g1175 ) );
			float4 temp_output_6_0_g1668 = _front1Color;
			float4 temp_cast_11 = (_GradientMultiply1).xxxx;
			float4 temp_output_3_0_g1668 = temp_cast_11;
			float temp_output_25_0_g1176 = 0.04;
			float4 temp_cast_12 = (temp_output_25_0_g1176).xxxx;
			float4 temp_output_22_0_g1176 = step( GridMask2590 , temp_cast_12 );
			float4 temp_cast_13 = (temp_output_25_0_g1175).xxxx;
			float4 temp_output_44_0_g1176 = temp_output_22_0_g1175;
			float4 temp_output_45_0_g1176 = ( temp_output_22_0_g1176 - temp_output_44_0_g1176 );
			float4 temp_cast_14 = (temp_output_25_0_g1176).xxxx;
			float4 temp_cast_15 = (_GradientPower1).xxxx;
			float4 lerpResult4_g1668 = lerp( ( temp_output_6_0_g1668 * temp_output_3_0_g1668 ) , temp_output_6_0_g1668 , pow( ( temp_output_45_0_g1176 * ( ( temp_output_22_0_g1176 * GridGradient2591 ) - temp_output_44_0_g1176 ) ) , temp_cast_15 ));
			float4 temp_cast_16 = (temp_output_25_0_g1176).xxxx;
			float4 temp_output_6_0_g1665 = _front2Color;
			float4 temp_cast_17 = (_GradientMultiply2).xxxx;
			float4 temp_output_3_0_g1665 = temp_cast_17;
			float temp_output_25_0_g1177 = ( temp_output_25_0_g1176 + 0.03 );
			float4 temp_cast_18 = (temp_output_25_0_g1177).xxxx;
			float4 temp_output_22_0_g1177 = step( GridMask2590 , temp_cast_18 );
			float4 temp_cast_19 = (temp_output_25_0_g1176).xxxx;
			float4 temp_output_44_0_g1177 = temp_output_22_0_g1176;
			float4 temp_output_45_0_g1177 = ( temp_output_22_0_g1177 - temp_output_44_0_g1177 );
			float4 temp_cast_20 = (temp_output_25_0_g1177).xxxx;
			float4 temp_cast_21 = (_GradientPower2).xxxx;
			float4 lerpResult4_g1665 = lerp( ( temp_output_6_0_g1665 * temp_output_3_0_g1665 ) , temp_output_6_0_g1665 , pow( ( temp_output_45_0_g1177 * ( ( temp_output_22_0_g1177 * GridGradient2591 ) - temp_output_44_0_g1177 ) ) , temp_cast_21 ));
			float4 temp_cast_22 = (temp_output_25_0_g1177).xxxx;
			float4 temp_output_6_0_g1666 = _windowColor;
			float4 temp_cast_23 = (_GradientMultiply3).xxxx;
			float4 temp_output_3_0_g1666 = temp_cast_23;
			float temp_output_25_0_g1178 = ( temp_output_25_0_g1177 + 0.03 );
			float4 temp_cast_24 = (temp_output_25_0_g1178).xxxx;
			float4 temp_output_22_0_g1178 = step( GridMask2590 , temp_cast_24 );
			float4 temp_cast_25 = (temp_output_25_0_g1177).xxxx;
			float4 temp_output_44_0_g1178 = temp_output_22_0_g1177;
			float4 temp_output_45_0_g1178 = ( temp_output_22_0_g1178 - temp_output_44_0_g1178 );
			float4 temp_cast_26 = (temp_output_25_0_g1178).xxxx;
			float4 temp_cast_27 = (_GradientPower3).xxxx;
			float4 lerpResult4_g1666 = lerp( ( temp_output_6_0_g1666 * temp_output_3_0_g1666 ) , temp_output_6_0_g1666 , pow( ( temp_output_45_0_g1178 * ( ( temp_output_22_0_g1178 * GridGradient2591 ) - temp_output_44_0_g1178 ) ) , temp_cast_27 ));
			float4 temp_cast_28 = (temp_output_25_0_g1178).xxxx;
			float4 temp_output_2609_32 = temp_output_45_0_g1178;
			float4 temp_output_6_0_g1669 = _windowborderColor;
			float4 temp_cast_29 = (_GradientMultiply4).xxxx;
			float4 temp_output_3_0_g1669 = temp_cast_29;
			float temp_output_25_0_g1179 = 0.12;
			float4 temp_cast_30 = (temp_output_25_0_g1179).xxxx;
			float4 temp_output_22_0_g1179 = step( GridMask2590 , temp_cast_30 );
			float4 temp_cast_31 = (temp_output_25_0_g1178).xxxx;
			float4 temp_output_44_0_g1179 = temp_output_22_0_g1178;
			float4 temp_output_45_0_g1179 = ( temp_output_22_0_g1179 - temp_output_44_0_g1179 );
			float4 temp_cast_32 = (temp_output_25_0_g1179).xxxx;
			float4 temp_cast_33 = (_GradientPower4).xxxx;
			float4 lerpResult4_g1669 = lerp( ( temp_output_6_0_g1669 * temp_output_3_0_g1669 ) , temp_output_6_0_g1669 , pow( ( temp_output_45_0_g1179 * ( ( temp_output_22_0_g1179 * GridGradient2591 ) - temp_output_44_0_g1179 ) ) , temp_cast_33 ));
			float4 temp_cast_34 = (temp_output_25_0_g1179).xxxx;
			float4 temp_output_6_0_g1671 = _whiteColor;
			float4 temp_cast_35 = (_GradientMultiply5).xxxx;
			float4 temp_output_3_0_g1671 = temp_cast_35;
			float temp_output_25_0_g1180 = 0.2;
			float4 temp_cast_36 = (temp_output_25_0_g1180).xxxx;
			float4 temp_output_22_0_g1180 = step( GridMask2590 , temp_cast_36 );
			float4 temp_cast_37 = (temp_output_25_0_g1179).xxxx;
			float4 temp_output_44_0_g1180 = temp_output_22_0_g1179;
			float4 temp_output_45_0_g1180 = ( temp_output_22_0_g1180 - temp_output_44_0_g1180 );
			float4 temp_cast_38 = (temp_output_25_0_g1180).xxxx;
			float4 temp_cast_39 = (_GradientPower5).xxxx;
			float4 lerpResult4_g1671 = lerp( ( temp_output_6_0_g1671 * temp_output_3_0_g1671 ) , temp_output_6_0_g1671 , pow( ( temp_output_45_0_g1180 * ( ( temp_output_22_0_g1180 * GridGradient2591 ) - temp_output_44_0_g1180 ) ) , temp_cast_39 ));
			float4 temp_cast_40 = (temp_output_25_0_g1180).xxxx;
			float4 temp_output_6_0_g1670 = _blackColor;
			float4 temp_cast_41 = (_GradientMultiply6).xxxx;
			float4 temp_output_3_0_g1670 = temp_cast_41;
			float temp_output_25_0_g1181 = ( temp_output_25_0_g1180 + 0.03 );
			float4 temp_cast_42 = (temp_output_25_0_g1181).xxxx;
			float4 temp_output_22_0_g1181 = step( GridMask2590 , temp_cast_42 );
			float4 temp_cast_43 = (temp_output_25_0_g1180).xxxx;
			float4 temp_output_44_0_g1181 = temp_output_22_0_g1180;
			float4 temp_output_45_0_g1181 = ( temp_output_22_0_g1181 - temp_output_44_0_g1181 );
			float4 temp_cast_44 = (temp_output_25_0_g1181).xxxx;
			float4 temp_cast_45 = (_GradientPower6).xxxx;
			float4 lerpResult4_g1670 = lerp( ( temp_output_6_0_g1670 * temp_output_3_0_g1670 ) , temp_output_6_0_g1670 , pow( ( temp_output_45_0_g1181 * ( ( temp_output_22_0_g1181 * GridGradient2591 ) - temp_output_44_0_g1181 ) ) , temp_cast_45 ));
			float4 temp_cast_46 = (temp_output_25_0_g1181).xxxx;
			float4 temp_output_2711_0 = ( temp_output_2838_0 + float4( 0,0,0,0 ) + ( lerpResult4_g1668 * temp_output_45_0_g1176 ) + ( lerpResult4_g1665 * temp_output_45_0_g1177 ) + ( lerpResult4_g1666 * temp_output_2609_32 ) + ( lerpResult4_g1669 * temp_output_45_0_g1179 ) + ( lerpResult4_g1671 * temp_output_45_0_g1180 ) + ( lerpResult4_g1670 * temp_output_45_0_g1181 ) + round( _Float2 ) );
			float4 bld_add12736 = temp_output_2711_0;
			float4 temp_output_6_0_g1673 = _detailColor;
			float4 temp_cast_47 = (_GradientMultiply7).xxxx;
			float4 temp_output_3_0_g1673 = temp_cast_47;
			float temp_output_25_0_g1182 = 0.29;
			float4 temp_cast_48 = (temp_output_25_0_g1182).xxxx;
			float4 temp_output_22_0_g1182 = step( GridMask2590 , temp_cast_48 );
			float4 temp_cast_49 = (temp_output_25_0_g1181).xxxx;
			float4 temp_output_44_0_g1182 = temp_output_22_0_g1181;
			float4 temp_output_45_0_g1182 = ( temp_output_22_0_g1182 - temp_output_44_0_g1182 );
			float4 temp_cast_50 = (temp_output_25_0_g1182).xxxx;
			float4 temp_cast_51 = (_GradientPower7).xxxx;
			float4 lerpResult4_g1673 = lerp( ( temp_output_6_0_g1673 * temp_output_3_0_g1673 ) , temp_output_6_0_g1673 , pow( ( temp_output_45_0_g1182 * ( ( temp_output_22_0_g1182 * GridGradient2591 ) - temp_output_44_0_g1182 ) ) , temp_cast_51 ));
			float4 temp_cast_52 = (temp_output_25_0_g1182).xxxx;
			float4 temp_output_2995_0 = ( lerpResult4_g1673 * temp_output_45_0_g1182 );
			float4 temp_output_6_0_g1667 = _deco_aColor;
			float4 temp_cast_53 = (_GradientMultiply8).xxxx;
			float4 temp_output_3_0_g1667 = temp_cast_53;
			float temp_output_25_0_g1183 = 0.35;
			float4 temp_cast_54 = (temp_output_25_0_g1183).xxxx;
			float4 temp_output_22_0_g1183 = step( GridMask2590 , temp_cast_54 );
			float4 temp_cast_55 = (temp_output_25_0_g1182).xxxx;
			float4 temp_output_44_0_g1183 = temp_output_22_0_g1182;
			float4 temp_output_45_0_g1183 = ( temp_output_22_0_g1183 - temp_output_44_0_g1183 );
			float4 temp_cast_56 = (temp_output_25_0_g1183).xxxx;
			float4 temp_cast_57 = (_GradientPower8).xxxx;
			float4 lerpResult4_g1667 = lerp( ( temp_output_6_0_g1667 * temp_output_3_0_g1667 ) , temp_output_6_0_g1667 , pow( ( temp_output_45_0_g1183 * ( ( temp_output_22_0_g1183 * GridGradient2591 ) - temp_output_44_0_g1183 ) ) , temp_cast_57 ));
			float4 temp_cast_58 = (temp_output_25_0_g1183).xxxx;
			float4 temp_output_6_0_g1672 = _deco_bColor;
			float4 temp_cast_59 = (_GradientMultiply9).xxxx;
			float4 temp_output_3_0_g1672 = temp_cast_59;
			float temp_output_25_0_g1184 = 0.47;
			float4 temp_cast_60 = (temp_output_25_0_g1184).xxxx;
			float4 temp_output_22_0_g1184 = step( GridMask2590 , temp_cast_60 );
			float4 temp_cast_61 = (temp_output_25_0_g1183).xxxx;
			float4 temp_output_44_0_g1184 = temp_output_22_0_g1183;
			float4 temp_output_45_0_g1184 = ( temp_output_22_0_g1184 - temp_output_44_0_g1184 );
			float4 temp_cast_62 = (temp_output_25_0_g1184).xxxx;
			float4 temp_cast_63 = (_GradientPower9).xxxx;
			float4 lerpResult4_g1672 = lerp( ( temp_output_6_0_g1672 * temp_output_3_0_g1672 ) , temp_output_6_0_g1672 , pow( ( temp_output_45_0_g1184 * ( ( temp_output_22_0_g1184 * GridGradient2591 ) - temp_output_44_0_g1184 ) ) , temp_cast_63 ));
			float4 temp_cast_64 = (temp_output_25_0_g1184).xxxx;
			float4 temp_output_6_0_g1674 = _deco_cColor;
			float4 temp_cast_65 = (_GradientMultiply10).xxxx;
			float4 temp_output_3_0_g1674 = temp_cast_65;
			float temp_output_25_0_g1185 = 0.56;
			float4 temp_cast_66 = (temp_output_25_0_g1185).xxxx;
			float4 temp_output_22_0_g1185 = step( GridMask2590 , temp_cast_66 );
			float4 temp_cast_67 = (temp_output_25_0_g1184).xxxx;
			float4 temp_output_44_0_g1185 = temp_output_22_0_g1184;
			float4 temp_output_45_0_g1185 = ( temp_output_22_0_g1185 - temp_output_44_0_g1185 );
			float4 temp_cast_68 = (temp_output_25_0_g1185).xxxx;
			float4 temp_cast_69 = (_GradientPower10).xxxx;
			float4 lerpResult4_g1674 = lerp( ( temp_output_6_0_g1674 * temp_output_3_0_g1674 ) , temp_output_6_0_g1674 , pow( ( temp_output_45_0_g1185 * ( ( temp_output_22_0_g1185 * GridGradient2591 ) - temp_output_44_0_g1185 ) ) , temp_cast_69 ));
			float4 temp_cast_70 = (temp_output_25_0_g1185).xxxx;
			float4 temp_output_6_0_g1608 = _bonus_aColor;
			float4 temp_cast_71 = (_GradientMultiply11).xxxx;
			float4 temp_output_3_0_g1608 = temp_cast_71;
			float temp_output_25_0_g1186 = 0.73;
			float4 temp_cast_72 = (temp_output_25_0_g1186).xxxx;
			float4 temp_output_22_0_g1186 = step( GridMask2590 , temp_cast_72 );
			float4 temp_cast_73 = (temp_output_25_0_g1185).xxxx;
			float4 temp_output_44_0_g1186 = temp_output_22_0_g1185;
			float4 temp_output_45_0_g1186 = ( temp_output_22_0_g1186 - temp_output_44_0_g1186 );
			float4 temp_cast_74 = (temp_output_25_0_g1186).xxxx;
			float4 temp_cast_75 = (_GradientPower11).xxxx;
			float4 lerpResult4_g1608 = lerp( ( temp_output_6_0_g1608 * temp_output_3_0_g1608 ) , temp_output_6_0_g1608 , pow( ( temp_output_45_0_g1186 * ( ( temp_output_22_0_g1186 * GridGradient2591 ) - temp_output_44_0_g1186 ) ) , temp_cast_75 ));
			float4 temp_cast_76 = (temp_output_25_0_g1186).xxxx;
			float4 temp_output_2640_32 = temp_output_45_0_g1186;
			float4 temp_output_6_0_g1606 = _bonus_bColor;
			float4 temp_cast_77 = (_GradientMultiply12).xxxx;
			float4 temp_output_3_0_g1606 = temp_cast_77;
			float temp_output_25_0_g1187 = ( temp_output_25_0_g1186 + 0.03 );
			float4 temp_cast_78 = (temp_output_25_0_g1187).xxxx;
			float4 temp_output_22_0_g1187 = step( GridMask2590 , temp_cast_78 );
			float4 temp_cast_79 = (temp_output_25_0_g1186).xxxx;
			float4 temp_output_44_0_g1187 = temp_output_22_0_g1186;
			float4 temp_output_45_0_g1187 = ( temp_output_22_0_g1187 - temp_output_44_0_g1187 );
			float4 temp_cast_80 = (temp_output_25_0_g1187).xxxx;
			float4 temp_cast_81 = (_GradientPower12).xxxx;
			float4 lerpResult4_g1606 = lerp( ( temp_output_6_0_g1606 * temp_output_3_0_g1606 ) , temp_output_6_0_g1606 , pow( ( temp_output_45_0_g1187 * ( ( temp_output_22_0_g1187 * GridGradient2591 ) - temp_output_44_0_g1187 ) ) , temp_cast_81 ));
			float4 temp_cast_82 = (temp_output_25_0_g1187).xxxx;
			float4 temp_output_2641_32 = temp_output_45_0_g1187;
			float4 temp_output_6_0_g1609 = _bonus_cColor;
			float4 temp_cast_83 = (_GradientMultiply13).xxxx;
			float4 temp_output_3_0_g1609 = temp_cast_83;
			float temp_output_25_0_g1588 = 0.91;
			float4 temp_cast_84 = (temp_output_25_0_g1588).xxxx;
			float4 temp_output_22_0_g1588 = step( GridMask2590 , temp_cast_84 );
			float4 temp_cast_85 = (temp_output_25_0_g1187).xxxx;
			float4 temp_output_44_0_g1588 = temp_output_22_0_g1187;
			float4 temp_output_45_0_g1588 = ( temp_output_22_0_g1588 - temp_output_44_0_g1588 );
			float4 temp_cast_86 = (temp_output_25_0_g1588).xxxx;
			float4 temp_cast_87 = (_GradientPower13).xxxx;
			float4 lerpResult4_g1609 = lerp( ( temp_output_6_0_g1609 * temp_output_3_0_g1609 ) , temp_output_6_0_g1609 , pow( ( temp_output_45_0_g1588 * ( ( temp_output_22_0_g1588 * GridGradient2591 ) - temp_output_44_0_g1588 ) ) , temp_cast_87 ));
			float4 temp_cast_88 = (temp_output_25_0_g1588).xxxx;
			float4 temp_output_2648_32 = temp_output_45_0_g1588;
			float4 temp_output_6_0_g1611 = _bonus_dColor;
			float4 temp_cast_89 = (_GradientMultiply14).xxxx;
			float4 temp_output_3_0_g1611 = temp_cast_89;
			float temp_output_25_0_g1589 = 1.03;
			float4 temp_cast_90 = (temp_output_25_0_g1589).xxxx;
			float4 temp_output_22_0_g1589 = step( GridMask2590 , temp_cast_90 );
			float4 temp_cast_91 = (temp_output_25_0_g1588).xxxx;
			float4 temp_output_44_0_g1589 = temp_output_22_0_g1588;
			float4 temp_output_45_0_g1589 = ( temp_output_22_0_g1589 - temp_output_44_0_g1589 );
			float4 temp_cast_92 = (temp_output_25_0_g1589).xxxx;
			float4 temp_cast_93 = (_GradientPower14).xxxx;
			float4 lerpResult4_g1611 = lerp( ( temp_output_6_0_g1611 * temp_output_3_0_g1611 ) , temp_output_6_0_g1611 , pow( ( temp_output_45_0_g1589 * ( ( temp_output_22_0_g1589 * GridGradient2591 ) - temp_output_44_0_g1589 ) ) , temp_cast_93 ));
			float4 temp_cast_94 = (temp_output_25_0_g1589).xxxx;
			float4 temp_output_2651_32 = temp_output_45_0_g1589;
			float4 temp_output_2839_0 = ( ( lerpResult4_g1608 * temp_output_2640_32 ) + ( lerpResult4_g1606 * temp_output_2641_32 ) + ( lerpResult4_g1609 * temp_output_2648_32 ) + ( lerpResult4_g1611 * temp_output_2651_32 ) );
			float4 bld_add22735 = ( temp_output_2995_0 + ( lerpResult4_g1667 * temp_output_45_0_g1183 ) + ( lerpResult4_g1672 * temp_output_45_0_g1184 ) + ( lerpResult4_g1674 * temp_output_45_0_g1185 ) + temp_output_2839_0 );
			float4 temp_output_2739_0 = ( bld_add12736 + bld_add22735 );
			float4 bonusVar2840 = temp_output_2839_0;
			float4 PrimarySecondaryVar2841 = temp_output_2838_0;
			float3 ase_worldNormal = i.worldNormal;
			float4 tex2DNode3027 = tex2D( _matcapimage, ( ( mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz * 0.5 ) + 0.5 ).xy );
			float4 Matcap3029 = tex2DNode3027;
			float4 car3060 = ( temp_output_2711_0 + temp_output_2995_0 + temp_output_2839_0 );
			#if defined(_WORKFLOW_BUILDING)
				float4 staticSwitch2845 = temp_output_2739_0;
			#elif defined(_WORKFLOW_PROP)
				float4 staticSwitch2845 = ( bonusVar2840 + PrimarySecondaryVar2841 );
			#elif defined(_WORKFLOW_FOODTRUCK)
				float4 staticSwitch2845 = temp_output_2739_0;
			#elif defined(_WORKFLOW_MATCAP)
				float4 staticSwitch2845 = Matcap3029;
			#elif defined(_WORKFLOW_CAR)
				float4 staticSwitch2845 = car3060;
			#elif defined(_WORKFLOW_BLOCKS)
				float4 staticSwitch2845 = temp_output_2739_0;
			#elif defined(_WORKFLOW_NPC)
				float4 staticSwitch2845 = temp_output_2739_0;
			#else
				float4 staticSwitch2845 = temp_output_2739_0;
			#endif
			float4 FlatMaskWindow2661 = temp_output_2609_32;
			float4 lerpResult3039 = lerp( FlatMaskWindow2661 , float4( 0,0,0,0 ) , float4( 0,0,0,0 ));
			float3 hsvTorgb8_g1675 = RGBToHSV( ( staticSwitch2845 - lerpResult3039 ).rgb );
			float3 hsvTorgb3_g1675 = HSVToRGB( float3(( hsvTorgb8_g1675.x + _Hue1 ),( hsvTorgb8_g1675.y * _Saturation1 ),( hsvTorgb8_g1675.z + _Value1 )) );
			float4 lerpResult3043 = lerp( float4( hsvTorgb3_g1675 , 0.0 ) , staticSwitch2845 , lerpResult3039);
			float2 uv3_TexCoord2800 = i.uv3_texcoord3 + _decalOffset;
			float4 lerpResult2810 = lerp( lerpResult3043 , _decalColor , ( tex2D( _decalMask, uv3_TexCoord2800 ) * tex2D( _decalMaskUV, i.uv3_texcoord3 ) ));
			#if defined(_WORKFLOW_BUILDING)
				float4 staticSwitch2803 = lerpResult3043;
			#elif defined(_WORKFLOW_PROP)
				float4 staticSwitch2803 = lerpResult3043;
			#elif defined(_WORKFLOW_FOODTRUCK)
				float4 staticSwitch2803 = lerpResult2810;
			#elif defined(_WORKFLOW_MATCAP)
				float4 staticSwitch2803 = lerpResult3043;
			#elif defined(_WORKFLOW_CAR)
				float4 staticSwitch2803 = lerpResult3043;
			#elif defined(_WORKFLOW_BLOCKS)
				float4 staticSwitch2803 = lerpResult3043;
			#elif defined(_WORKFLOW_NPC)
				float4 staticSwitch2803 = lerpResult3043;
			#else
				float4 staticSwitch2803 = lerpResult3043;
			#endif
			float3 ase_worldPos = i.worldPos;
			float clampResult6_g1681 = clamp( ( ase_worldPos.y / _Height ) , 0.0 , 1.0 );
			float4 lerpResult3_g1681 = lerp( _BottomColor , _TopColor , clampResult6_g1681);
			float4 temp_cast_100 = (_Power).xxxx;
			float4 temp_cast_101 = (0.0).xxxx;
			float4 temp_cast_102 = (1.0).xxxx;
			float4 clampResult8_g1681 = clamp( ( staticSwitch2803 * pow( lerpResult3_g1681 , temp_cast_100 ) ) , temp_cast_101 , temp_cast_102 );
			#ifdef _WORLDSPACEGRADIENTTOGGLE_ON
				float4 staticSwitch2811 = clampResult8_g1681;
			#else
				float4 staticSwitch2811 = staticSwitch2803;
			#endif
			#if defined(_WORKFLOW_BUILDING)
				float4 staticSwitch2817 = staticSwitch2811;
			#elif defined(_WORKFLOW_PROP)
				float4 staticSwitch2817 = staticSwitch2811;
			#elif defined(_WORKFLOW_FOODTRUCK)
				float4 staticSwitch2817 = staticSwitch2811;
			#elif defined(_WORKFLOW_MATCAP)
				float4 staticSwitch2817 = staticSwitch2803;
			#elif defined(_WORKFLOW_CAR)
				float4 staticSwitch2817 = staticSwitch2811;
			#elif defined(_WORKFLOW_BLOCKS)
				float4 staticSwitch2817 = staticSwitch2811;
			#elif defined(_WORKFLOW_NPC)
				float4 staticSwitch2817 = staticSwitch2803;
			#else
				float4 staticSwitch2817 = staticSwitch2811;
			#endif
			o.Albedo = staticSwitch2817.rgb;
			float4 EmissionColor12655 = _bonus_aColor;
			float4 FlatMask12657 = temp_output_2640_32;
			float4 temp_cast_104 = (_Emission1power).xxxx;
			float4 EmissionColor22659 = _bonus_bColor;
			float4 FlatMask22656 = temp_output_2641_32;
			float4 temp_cast_105 = (_Emission2power).xxxx;
			float4 EmissionColor32667 = _bonus_cColor;
			float4 FlatMask32665 = temp_output_2648_32;
			float4 temp_cast_106 = (_Emission3power).xxxx;
			float4 EmissionColor42658 = _bonus_dColor;
			float4 FlatMask42660 = temp_output_2651_32;
			float4 temp_cast_107 = (_Emission4power).xxxx;
			float4 EmissionWindow2668 = _windowColor;
			float4 temp_cast_108 = (_EmissionWindowpower).xxxx;
			#ifdef _EMISSIONTOGGLE_OFF
				float4 staticSwitch2791 = float4( 0,0,0,0 );
			#else
				float4 staticSwitch2791 = ( ( ( EmissionColor12655 * FlatMask12657 ) * temp_cast_104 ) + ( ( EmissionColor22659 * FlatMask22656 ) * temp_cast_105 ) + ( ( EmissionColor32667 * FlatMask32665 ) * temp_cast_106 ) + ( ( EmissionColor42658 * FlatMask42660 ) * temp_cast_107 ) + ( ( EmissionWindow2668 * FlatMaskWindow2661 ) * temp_cast_108 ) );
			#endif
			o.Emission = staticSwitch2791.rgb;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

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
				float4 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
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
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.customPack1.zw = customInputData.uv3_texcoord3;
				o.customPack1.zw = v.texcoord2;
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
				surfIN.uv_texcoord = IN.customPack1.xy;
				surfIN.uv3_texcoord3 = IN.customPack1.zw;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
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
506;279;1692;911;-7644.665;8088.105;1.713662;True;False
Node;AmplifyShaderEditor.RangedFloatNode;2586;8582.359,-9876.822;Inherit;True;Constant;_Float5;Float 5;20;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2585;8658.744,-10097.97;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2587;9034.883,-9878.439;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2589;8582.521,-10689.03;Inherit;True;Property;_GridMask;GridMask;59;1;[HideInInspector];Create;True;0;0;0;False;0;False;-1;51ab3d1e0045c41439dcd7474d2aee4b;51ab3d1e0045c41439dcd7474d2aee4b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FractNode;2588;9342.225,-9872.557;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2590;9115.052,-10601.5;Inherit;False;GridMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2591;9546.284,-9883.862;Inherit;True;GridGradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2734;8305.158,-8656.693;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2592;8305.355,-8574.417;Float;False;Constant;_Startclipvalue;Start clip value;8;0;Create;True;0;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2733;8312.598,-8756.175;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2596;8534.943,-8692.014;Inherit;True;MaskingFunction;-1;;1174;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;2593;8400.324,-7769.632;Float;False;Constant;_Float7;Float 7;8;0;Create;True;0;0;0;False;0;False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2594;8372.246,-7946.269;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2595;8374.838,-7854.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2597;8620.469,-7925.362;Inherit;True;MaskingFunction;-1;;1175;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;2599;8378.504,-7138.748;Float;False;Constant;_Float8;Float 8;8;0;Create;True;0;0;0;False;0;False;0.04;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2600;8373.838,-7225.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2598;8377.887,-7312.299;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2603;8362.838,-6606.125;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2602;8368.104,-6707.523;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2601;8578.48,-7265.432;Inherit;True;MaskingFunction;-1;;1176;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2606;8382.313,-5992.53;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2605;8381.627,-5897.469;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2604;8591.48,-6624.432;Inherit;True;MaskingFunction;-1;;1177;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;2608;8130.66,-5216.726;Float;False;Constant;_Float13;Float 13;8;0;Create;True;0;0;0;False;0;False;0.12;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2610;8265.637,-5414.786;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2609;8588.445,-5966.462;Inherit;True;MaskingFunction;-1;;1178;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2607;8194.688,-5324.21;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2613;8336.838,-4658.125;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2611;8342.771,-4740.036;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2614;8591.48,-5344.433;Inherit;True;MaskingFunction;-1;;1179;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;2612;8344.721,-4567.897;Float;False;Constant;_Float16;Float 16;8;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2615;8360.061,-4104.692;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2616;8591.48,-4704.433;Inherit;True;MaskingFunction;-1;;1180;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2617;8361.838,-4020.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2619;8592.838,-4029.14;Inherit;True;MaskingFunction;-1;;1181;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2620;8361.061,-3448.692;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2621;8354.838,-3366.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2618;8364.143,-3276.444;Float;False;Constant;_Float17;Float 17;8;0;Create;True;0;0;0;False;0;False;0.29;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2625;8647.44,-3380.19;Inherit;True;MaskingFunction;-1;;1182;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2623;8359.156,-2852.59;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2622;8378.344,-2662.934;Float;False;Constant;_Float18;Float 18;8;0;Create;True;0;0;0;False;0;False;0.35;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2624;8355.838,-2757.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2627;8337.838,-2083.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2626;8347.883,-2173.666;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2628;8591.48,-2784.433;Inherit;True;MaskingFunction;-1;;1183;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;2629;8359.877,-1997.933;Float;False;Constant;_Float19;Float 19;8;0;Create;True;0;0;0;False;0;False;0.47;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2630;8591.48,-2144.433;Inherit;True;MaskingFunction;-1;;1184;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2631;8332.477,-1624.47;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2633;8312.838,-1521.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2632;8364.503,-1363.97;Float;False;Constant;_Float20;Float 20;8;0;Create;True;0;0;0;False;0;False;0.56;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2634;8386.407,-912.0579;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2635;8607.48,-1504.432;Inherit;True;MaskingFunction;-1;;1185;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2636;8370.838,-826.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2637;8392.415,-744.3899;Float;False;Constant;_Float21;Float 21;8;0;Create;True;0;0;0;False;0;False;0.73;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2640;8607.48,-864.4329;Inherit;True;MaskingFunction;-1;;1186;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;2638;8377.838,-159.126;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2639;8380.405,-244.0059;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2643;8365.495,359.1321;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2677;8963.714,-7799.3;Inherit;False;Property;_secondaryGradientMultiply;GradientMultiply;13;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2662;9070.905,-9002.598;Inherit;False;Property;_randomcolorRangeMin;randomcolor RangeMin;7;0;Create;True;0;0;0;False;1;Group3;False;-1;-5.1;-6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2642;8357.838,448.8743;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2684;9179.579,-8561.146;Inherit;False;Property;_primaryGradientMultiply;GradientMultiply;2;0;Create;False;0;0;0;False;0;False;0.6;0.607;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2666;9096.99,-8760.062;Inherit;False;Property;_primaryColor;Color;1;1;[HDR];Create;False;1;Primary;0;0;False;1;ColorSection;False;1,1,1,0;0.921582,0.3864295,0.04817183,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2641;8591.48,-224.4329;Inherit;True;MaskingFunction;-1;;1187;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.ColorNode;2685;9064.199,-8022.869;Inherit;False;Property;_secondaryColor;Color;12;1;[HDR];Create;False;1;Secondary;0;0;False;1;ColorSection;False;1,1,1,0;0.1169707,0.05286065,0.05286065,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2644;8368.355,530.094;Float;False;Constant;_Float22;Float 22;8;0;Create;True;0;0;0;False;0;False;0.91;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2663;9061.258,-8843.474;Inherit;False;Property;_randomcolorSeed;randomcolor Seed;11;0;Create;True;0;2;Option1;6;Option2;2;0;False;1;Group3;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2664;9072.507,-8924.758;Inherit;False;Property;_randomcolorRangeMax;randomcolor RangeMax;8;0;Create;True;0;0;0;False;1;Group3;False;1.5;0;0;6;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3000;9268.203,-7806.07;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2864;9407.125,-8418.435;Inherit;False;Property;_primaryGradientColor;GradientColor;5;0;Create;False;0;0;0;False;1;Group4;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2648;8591.48,415.5671;Inherit;True;MaskingFunction;-1;;1588;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.ColorNode;2998;9032.718,-7683.732;Inherit;False;Property;_secondaryGradientColor;GradientColor;16;0;Create;False;0;0;0;False;1;Group5;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2645;8364.838,1086.874;Inherit;False;2591;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2647;8360.127,989.6399;Inherit;False;2590;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3001;9703.61,-8576.596;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2646;8377.701,1174.971;Float;False;Constant;_Float23;Float 23;8;0;Create;True;0;0;0;False;0;False;1.03;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3077;9435.517,-8927.434;Inherit;False;RandomColor Function;9;;1587;e7e1d62eceb36bf41b82ef21e88e3cfa;0;4;29;COLOR;0,0,0,0;False;38;FLOAT;0;False;36;FLOAT;0;False;43;FLOAT;0;False;1;COLOR;47
Node;AmplifyShaderEditor.ToggleSwitchNode;2999;9463.721,-7779.321;Inherit;False;Property;_SetGradientColor2;Set GradientColor;15;0;Create;False;0;0;0;False;1;Toggle5;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2726;8963.015,-634.9529;Inherit;False;Property;_GradientPower11;GradientPower;49;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2714;8938.738,1219.297;Inherit;False;Property;_GradientMultiply14;GradientMultiply;57;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2653;8977.126,1020.876;Inherit;False;Property;_bonus_dColor;Color;56;1;[HDR];Create;False;1;bonus_d;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ViewMatrixNode;3035;14248.22,-5911.988;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;2724;8920.787,650.9592;Inherit;False;Property;_GradientPower13;GradientPower;55;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;3034;14115.86,-5794.389;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;2651;8581.456,1087.646;Inherit;True;MaskingFunction;-1;;1589;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.ColorNode;2650;8966.828,263.8941;Inherit;False;Property;_bonus_cColor;Color;53;1;[HDR];Create;False;1;bonus_c;0;0;False;1;ColorSection;False;1,1,1,0;0.1650943,0.9920695,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2678;9310.726,-7623.628;Inherit;False;Property;_secondaryGradientPower;GradientPower;14;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;2691;9698.678,-8760.009;Inherit;False;Property;_randomcolortoggle;randomcolor toggle;6;0;Create;True;0;0;0;False;1;Toggle3;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2707;8931.091,553.0242;Inherit;False;Property;_GradientMultiply13;GradientMultiply;54;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2704;8939.212,-89.35083;Inherit;False;Property;_GradientMultiply12;GradientMultiply;51;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2727;8924.532,1313.631;Inherit;False;Property;_GradientPower14;GradientPower;58;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2676;9797.783,-8349.587;Inherit;False;Property;_primaryGradientPower;GradientPower;3;0;Create;False;0;0;0;False;0;False;1;1.18;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2725;8947.582,-722.1689;Inherit;False;Property;_GradientMultiply11;GradientMultiply;48;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2713;8960.097,-8.415771;Inherit;False;Property;_GradientPower12;GradientPower;52;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3068;9042.938,-1035.862;Inherit;False;Property;_bonus_aColor;Color;47;1;[HDR];Create;False;1;bonus_a;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3069;9001.81,-388.5579;Inherit;False;Property;_bonus_bColor;Color;50;1;[HDR];Create;False;1;bonus_b;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;2946;9869.098,-8522.876;Inherit;False;Property;_SetGradientColor;Set GradientColor;4;0;Create;True;0;0;0;False;1;Toggle4;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3079;12056.37,-7580.975;Inherit;False;Property;_Float2;Float 2;75;1;[IntRange];Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2708;9017.784,-3159.379;Inherit;False;Property;_GradientPower7;GradientPower;37;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2683;8920.975,-3925.803;Inherit;False;Property;_GradientMultiply6;GradientMultiply;33;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2689;8970.28,-4590.435;Inherit;False;Property;_GradientMultiply5;GradientMultiply;30;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2682;8972.714,-6537.497;Inherit;False;Property;_GradientMultiply2;GradientMultiply;21;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2710;8996.563,-1951.232;Inherit;False;Property;_GradientMultiply9;GradientMultiply;42;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2703;9019.143,-2632.682;Inherit;False;Property;_GradientMultiply8;GradientMultiply;39;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2985;9282.67,1077.789;Inherit;False;GradientColor Function;-1;;1611;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3064;8524.95,-6892.441;Inherit;False;Property;_front2Color;Color;20;0;Create;False;1;front2;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2723;8968.571,-1255.921;Inherit;False;Property;_GradientPower10;GradientPower;46;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2673;8943.131,-7047.857;Inherit;False;Property;_GradientPower1;GradientPower;19;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2670;8952.518,-5103.577;Inherit;False;Property;_GradientPower4;GradientPower;28;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2688;8955.042,-5223.897;Inherit;False;Property;_GradientMultiply4;GradientMultiply;27;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2674;8971.252,-6435.559;Inherit;False;Property;_GradientPower2;GradientPower;22;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2681;8956.784,-4487.378;Inherit;False;Property;_GradientPower5;GradientPower;31;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2720;8997.836,-1844.183;Inherit;False;Property;_GradientPower9;GradientPower;43;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2718;9009.63,-2260.745;Inherit;False;Property;_deco_bColor;Color;41;1;[HDR];Create;False;1;deco_b;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;2690;8973.967,-5809.3;Inherit;False;Property;_GradientPower3;GradientPower;25;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2722;8963.813,-1365.532;Inherit;False;Property;_GradientMultiply10;GradientMultiply;45;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2679;8954.237,-5906.161;Inherit;False;Property;_GradientMultiply3;GradientMultiply;24;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2984;9326.066,-155.8738;Inherit;False;GradientColor Function;-1;;1606;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;3067;8606.47,-3592.097;Inherit;False;Property;_detailColor;Color;35;0;Create;False;1;detail;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2731;9049.76,-1614.887;Inherit;False;Property;_deco_cColor;Color;44;1;[HDR];Create;False;1;deco_c;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3037;14366.76,-5884.202;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;3070;8570.264,-7478.493;Inherit;False;Property;_front1Color;Color;17;0;Create;False;1;front1;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3036;14524.91,-5611.075;Float;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2729;9009.678,-3259.068;Inherit;False;Property;_GradientMultiply7;GradientMultiply;36;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2709;9040.68,-2552.463;Inherit;False;Property;_GradientPower8;GradientPower;40;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2981;9744.321,-7938.345;Inherit;False;GradientColor Function;-1;;1605;83dc61dfe514e0843bf696f7318b314a;1,13,1;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2680;8944.409,-7150.65;Inherit;False;Property;_GradientMultiply1;GradientMultiply;18;0;Create;False;0;0;0;False;0;False;0.6;0.6;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2686;8969.632,-3816.44;Inherit;False;Property;_GradientPower6;GradientPower;34;0;Create;False;0;0;0;False;0;False;1;1;0.001;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3066;9036.461,-4256.904;Inherit;False;Property;_blackColor;Color;32;0;Create;False;1;black;0;0;False;1;ColorSection;False;0.097,0.097,0.097,0;0.097,0.097,0.097,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3065;9035.08,-4891.957;Inherit;False;Property;_whiteColor;Color;29;1;[HDR];Create;False;1;white;0;0;False;1;ColorSection;False;0.6,0.6,0.6,0;0.6,0.6,0.6,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2671;9017.942,-5553.591;Inherit;False;Property;_windowborderColor;Color;26;1;[HDR];Create;False;1;window border;0;0;False;1;ColorSection;False;1,1,1,0;0.1714412,0.1094617,0.1094617,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2649;9025.076,-6181.492;Inherit;False;Property;_windowColor;Color;23;1;[HDR];Create;False;1;window;0;0;False;1;ColorSection;False;1,1,1,0;0.5520116,0.7912982,0.8879232,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;2982;9262.082,429.3081;Inherit;False;GradientColor Function;-1;;1609;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2996;10181.02,-8679.294;Inherit;False;GradientColor Function;-1;;1610;83dc61dfe514e0843bf696f7318b314a;1,13,1;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2983;9328.844,-829.8799;Inherit;False;GradientColor Function;-1;;1608;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2721;9014.509,-2937.449;Inherit;False;Property;_deco_aColor;Color;38;1;[HDR];Create;False;1;deco_a;0;0;False;1;ColorSection;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;2838;10143.86,-7776.932;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2995;9455.041,-3512.785;Inherit;False;GradientColor Function;-1;;1673;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2839;10307.04,-1205.598;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2994;9361.71,-2069.645;Inherit;False;GradientColor Function;-1;;1672;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2989;9346.819,-1480.226;Inherit;False;GradientColor Function;-1;;1674;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2987;9362.32,-4687.582;Inherit;False;GradientColor Function;-1;;1671;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RoundOpNode;3081;12291.27,-7437.995;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2986;9368.131,-5399.575;Inherit;False;GradientColor Function;-1;;1669;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2991;9387.681,-7237.641;Inherit;False;GradientColor Function;-1;;1668;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2990;9391.121,-2783.313;Inherit;False;GradientColor Function;-1;;1667;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3025;14591.01,-5864.756;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;2992;9394.245,-5978.884;Inherit;False;GradientColor Function;-1;;1666;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2993;9387.302,-6669.267;Inherit;False;GradientColor Function;-1;;1665;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2988;9393.297,-4049.657;Inherit;False;GradientColor Function;-1;;1670;83dc61dfe514e0843bf696f7318b314a;1,13,0;5;6;COLOR;0,0,0,0;False;9;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;7;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2711;10285.99,-6530.792;Inherit;True;9;9;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2728;10201,-2348.854;Inherit;True;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3030;14777.06,-5870.535;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2841;10530.05,-7681.997;Inherit;False;PrimarySecondaryVar;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2736;10638.34,-6446.9;Inherit;False;bld_add1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;3027;15051.61,-5787.107;Inherit;True;Property;_matcapimage;matcap image;76;2;[Header];[NoScaleOffset];Create;True;1;matcap;0;0;False;1;ShowOnlyInWorkflow3;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;3059;10752.46,-5299.835;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2735;10662.26,-2374.736;Inherit;False;bld_add2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2840;10804.29,-1222.95;Inherit;False;bonusVar;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3029;15861.32,-5578.808;Inherit;False;Matcap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2844;12442.27,-7881.184;Inherit;False;2841;PrimarySecondaryVar;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2661;9009.908,-5732.478;Inherit;False;FlatMaskWindow;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;3060;11044.12,-5221.608;Inherit;False;car;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2738;12458.07,-8209.408;Inherit;False;2735;bld_add2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2843;12493.3,-7989.435;Inherit;False;2840;bonusVar;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2737;12437.08,-8318.946;Inherit;False;2736;bld_add1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2842;12885.04,-8033.751;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;3061;12958.48,-7638.122;Inherit;False;3060;car;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2739;12900.82,-8348.252;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2794;12920.88,-7773.225;Inherit;False;3029;Matcap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;3042;13686.86,-8286.111;Inherit;False;2661;FlatMaskWindow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;3039;13897.33,-8286.036;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;2845;13404.85,-7966.543;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;0;True;1;;False;0;0;0;True;;KeywordEnum;7;Building;Prop;Foodtruck;Matcap;Car;Blocks;NPC;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector2Node;2798;14454.05,-7427.818;Inherit;False;Property;_decalOffset;decal Offset;82;0;Create;True;0;0;0;False;1;ShowOnlyInWorkflow2;False;0,0;0,0.37;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;2800;14682.91,-7434.782;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;3062;14711.85,-7240.648;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3040;14160.07,-8150.729;Inherit;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;3082;14508.14,-8184.594;Inherit;True;HSL;60;;1675;76fe2299c261bd6498922c4782bfb93d;0;1;9;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2806;14961.77,-7249.839;Inherit;True;Property;_decalMaskUV;decal MaskUV;83;1;[HideInInspector];Create;True;0;0;0;False;0;False;-1;86e05654cdae3474892c7c23fe452a57;86e05654cdae3474892c7c23fe452a57;True;2;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2805;14963.22,-7462.19;Inherit;True;Property;_decalMask;decal Mask;81;1;[Header];Create;True;1;Foodtruck decal;0;0;False;1;ShowOnlyInWorkflow2;False;-1;14aa7e8c0b2f59f46a6b099502212316;14aa7e8c0b2f59f46a6b099502212316;True;2;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2807;15052.14,-7683.974;Inherit;False;Property;_decalColor;decal Color;80;1;[Header];Create;True;1;decal;0;0;False;1;ShowOnlyInWorkflow2;False;0,0,0,0;0.7075471,0.2836863,0.2836863,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3043;14815.26,-7940.871;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2809;15332.28,-7383.275;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2655;9547.134,-1114.98;Inherit;False;EmissionColor1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2668;9327.052,-6275.975;Inherit;False;EmissionWindow;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2660;9023.38,1447.722;Inherit;False;FlatMask4;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2665;8990.108,756.8533;Inherit;False;FlatMask3;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2667;9288.255,325.5291;Inherit;False;EmissionColor3;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2657;8947.8,-548.4658;Inherit;False;FlatMask1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;2810;15575.25,-7729.556;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2658;9268.089,921.0495;Inherit;False;EmissionColor4;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2656;8986.882,112.4602;Inherit;False;FlatMask2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;2659;9342.354,-473.9273;Inherit;False;EmissionColor2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2774;15595.81,-10674.19;Inherit;False;Property;_Emission2power;Emission2 power;71;0;Create;True;0;0;0;False;1;Group1;False;0;0.72;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2801;16004.54,-8519.412;Float;False;Property;_BottomColor;BottomColor;66;0;Create;True;0;0;0;False;1;Group2;False;0.1698113,0.1465824,0.1465824,0;0.0849056,0.07409213,0.07409213,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2783;15673.99,-10828.43;Inherit;False;2659;EmissionColor2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;2803;15907.51,-7977.922;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;0;True;1;;False;0;0;0;True;;KeywordEnum;2;Building;Prop;Reference;2845;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2776;15639.59,-10444.41;Inherit;False;2655;EmissionColor1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2784;15653.65,-9993.203;Inherit;False;2665;FlatMask3;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2777;15661.57,-9329.912;Inherit;False;2661;FlatMaskWindow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2772;15599.78,-10266.77;Inherit;False;Property;_Emission1power;Emission1 power;70;0;Create;True;0;0;0;False;1;Group1;False;0;0.84;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3047;16026.46,-8631.145;Inherit;False;Property;_Power;Power;68;0;Create;True;0;0;0;False;1;Group2;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2782;15670.95,-9753.306;Inherit;False;2658;EmissionColor4;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2781;15674.02,-10756.62;Inherit;False;2656;FlatMask2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2780;15700.89,-9674.031;Inherit;False;2660;FlatMask4;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2804;15973.36,-8148.829;Float;False;Property;_Height;Height;67;0;Create;True;0;0;0;False;1;Group2;False;7;7;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;2779;15660.96,-9417.937;Inherit;False;2668;EmissionWindow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2775;15555.26,-9915.462;Inherit;False;Property;_Emission3power;Emission3 power;72;0;Create;True;0;0;0;False;1;Group1;False;0;0.58;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2802;16012.68,-8337.442;Float;False;Property;_TopColor;TopColor;65;0;Create;True;0;0;0;False;1;Group2;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;2778;15624.59,-10068.88;Inherit;False;2667;EmissionColor3;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;2773;15652.95,-10358.08;Inherit;False;2657;FlatMask1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2771;15591.37,-9593.506;Inherit;False;Property;_Emission4power;Emission4 power;73;0;Create;True;0;0;0;False;1;Group1;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2770;15630.79,-9211.807;Inherit;False;Property;_EmissionWindowpower;EmissionWindow power;74;0;Create;True;0;0;0;False;1;Group1;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2789;15915.52,-10377.73;Inherit;False;EmissionMasking Function;-1;;1676;46bda95dd5b9af848881432ec0c82195;0;3;1;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2785;15918.59,-9391.092;Inherit;False;EmissionMasking Function;-1;;1677;46bda95dd5b9af848881432ec0c82195;0;3;1;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2787;15927.45,-9712.722;Inherit;False;EmissionMasking Function;-1;;1678;46bda95dd5b9af848881432ec0c82195;0;3;1;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2788;15898.15,-10770.35;Inherit;False;EmissionMasking Function;-1;;1679;46bda95dd5b9af848881432ec0c82195;0;3;1;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2786;15897.42,-10029.87;Inherit;False;EmissionMasking Function;-1;;1680;46bda95dd5b9af848881432ec0c82195;0;3;1;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;2808;16549.77,-8286.976;Inherit;True;WorldSpaceGradient;-1;;1681;3b5676f57e12b5242875cbc51344d26f;0;5;24;FLOAT;0;False;25;COLOR;0,0,0,0;False;26;COLOR;0,0,0,0;False;27;FLOAT;0;False;15;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2790;16809.83,-10030.24;Inherit;True;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;2811;16956.6,-8114.874;Inherit;False;Property;_WorldSpaceGradientToggle;WorldSpaceGradient Toggle;64;0;Create;True;0;0;0;False;1;Toggle2;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;2791;17533.9,-9915.191;Inherit;False;Property;_Emissiontoggle;Emission toggle;69;0;Create;True;0;0;0;False;1;Toggle1;False;0;0;0;True;;ToggleOff;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3031;16005.94,-6238.034;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3026;15570.72,-6276.474;Inherit;False;Property;_matcapSaturation;matcap Saturation;78;0;Create;True;0;0;0;False;1;ShowOnlyInWorkflow3;False;1;1.19;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;2817;17555.8,-8096.867;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;0;True;1;;False;0;0;0;True;;KeywordEnum;2;Building;Prop;Reference;2845;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;2814;14366.29,-7090.488;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;3080;12392.27,-7529.995;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3032;15979.67,-6418.673;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;3028;16202.77,-6145.64;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;3033;15996.64,-6084.146;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;2812;14208.6,-7105.197;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TextureCoordinatesNode;2815;13951.51,-7116.67;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3023;15587.8,-6416.717;Inherit;False;Property;_matcapHue;matcap Hue;77;0;Create;True;0;0;0;False;1;ShowOnlyInWorkflow3;False;0;0.05;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;3038;15668.94,-6132.261;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;3024;15590.43,-5848.681;Inherit;False;Property;_matcapValue;matcap Value;79;0;Create;True;1;;0;0;False;1;ShowOnlyInWorkflow3;False;0;0.08;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;18039.89,-8162.265;Float;False;True;-1;2;CustomAttributesGradientShaderGUI;0;0;Standard;Lichthund/Gradient Shader 2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;16;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;4;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;1;False;-1;1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2587;0;2585;2
WireConnection;2587;1;2586;0
WireConnection;2588;0;2587;0
WireConnection;2590;0;2589;0
WireConnection;2591;0;2588;0
WireConnection;2596;21;2733;0
WireConnection;2596;30;2734;0
WireConnection;2596;25;2592;0
WireConnection;2597;21;2594;0
WireConnection;2597;30;2595;0
WireConnection;2597;25;2593;0
WireConnection;2597;44;2596;47
WireConnection;2601;21;2598;0
WireConnection;2601;30;2600;0
WireConnection;2601;25;2599;0
WireConnection;2601;44;2597;47
WireConnection;2604;21;2602;0
WireConnection;2604;30;2603;0
WireConnection;2604;25;2601;28
WireConnection;2604;44;2601;47
WireConnection;2609;21;2606;0
WireConnection;2609;30;2605;0
WireConnection;2609;25;2604;28
WireConnection;2609;44;2604;47
WireConnection;2614;21;2610;0
WireConnection;2614;30;2607;0
WireConnection;2614;25;2608;0
WireConnection;2614;44;2609;47
WireConnection;2616;21;2611;0
WireConnection;2616;30;2613;0
WireConnection;2616;25;2612;0
WireConnection;2616;44;2614;47
WireConnection;2619;21;2615;0
WireConnection;2619;30;2617;0
WireConnection;2619;25;2616;28
WireConnection;2619;44;2616;47
WireConnection;2625;21;2620;0
WireConnection;2625;30;2621;0
WireConnection;2625;25;2618;0
WireConnection;2625;44;2619;47
WireConnection;2628;21;2623;0
WireConnection;2628;30;2624;0
WireConnection;2628;25;2622;0
WireConnection;2628;44;2625;47
WireConnection;2630;21;2626;0
WireConnection;2630;30;2627;0
WireConnection;2630;25;2629;0
WireConnection;2630;44;2628;47
WireConnection;2635;21;2631;0
WireConnection;2635;30;2633;0
WireConnection;2635;25;2632;0
WireConnection;2635;44;2630;47
WireConnection;2640;21;2634;0
WireConnection;2640;30;2636;0
WireConnection;2640;25;2637;0
WireConnection;2640;44;2635;47
WireConnection;2641;21;2639;0
WireConnection;2641;30;2638;0
WireConnection;2641;25;2640;28
WireConnection;2641;44;2640;47
WireConnection;3000;0;2685;0
WireConnection;3000;1;2677;0
WireConnection;2648;21;2643;0
WireConnection;2648;30;2642;0
WireConnection;2648;25;2644;0
WireConnection;2648;44;2641;47
WireConnection;3001;0;2666;0
WireConnection;3001;1;2684;0
WireConnection;3077;29;2666;0
WireConnection;3077;38;2662;0
WireConnection;3077;36;2664;0
WireConnection;3077;43;2663;0
WireConnection;2999;0;3000;0
WireConnection;2999;1;2998;0
WireConnection;2651;21;2647;0
WireConnection;2651;30;2645;0
WireConnection;2651;25;2646;0
WireConnection;2651;44;2648;47
WireConnection;2691;0;2666;0
WireConnection;2691;1;3077;47
WireConnection;2946;0;3001;0
WireConnection;2946;1;2864;0
WireConnection;2985;6;2653;0
WireConnection;2985;9;2651;0
WireConnection;2985;8;2651;32
WireConnection;2985;3;2714;0
WireConnection;2985;7;2727;0
WireConnection;2984;6;3069;0
WireConnection;2984;9;2641;0
WireConnection;2984;8;2641;32
WireConnection;2984;3;2704;0
WireConnection;2984;7;2713;0
WireConnection;3037;0;3035;0
WireConnection;3037;1;3034;0
WireConnection;2981;6;2685;0
WireConnection;2981;9;2597;0
WireConnection;2981;8;2597;32
WireConnection;2981;3;2999;0
WireConnection;2981;7;2678;0
WireConnection;2982;6;2650;0
WireConnection;2982;9;2648;0
WireConnection;2982;8;2648;32
WireConnection;2982;3;2707;0
WireConnection;2982;7;2724;0
WireConnection;2996;6;2691;0
WireConnection;2996;9;2596;0
WireConnection;2996;8;2596;32
WireConnection;2996;3;2946;0
WireConnection;2996;7;2676;0
WireConnection;2983;6;3068;0
WireConnection;2983;9;2640;0
WireConnection;2983;8;2640;32
WireConnection;2983;3;2725;0
WireConnection;2983;7;2726;0
WireConnection;2838;0;2996;0
WireConnection;2838;1;2981;0
WireConnection;2995;6;3067;0
WireConnection;2995;9;2625;0
WireConnection;2995;8;2625;32
WireConnection;2995;3;2729;0
WireConnection;2995;7;2708;0
WireConnection;2839;0;2983;0
WireConnection;2839;1;2984;0
WireConnection;2839;2;2982;0
WireConnection;2839;3;2985;0
WireConnection;2994;6;2718;0
WireConnection;2994;9;2630;0
WireConnection;2994;8;2630;32
WireConnection;2994;3;2710;0
WireConnection;2994;7;2720;0
WireConnection;2989;6;2731;0
WireConnection;2989;9;2635;0
WireConnection;2989;8;2635;32
WireConnection;2989;3;2722;0
WireConnection;2989;7;2723;0
WireConnection;2987;6;3065;0
WireConnection;2987;9;2616;0
WireConnection;2987;8;2616;32
WireConnection;2987;3;2689;0
WireConnection;2987;7;2681;0
WireConnection;3081;0;3079;0
WireConnection;2986;6;2671;0
WireConnection;2986;9;2614;0
WireConnection;2986;8;2614;32
WireConnection;2986;3;2688;0
WireConnection;2986;7;2670;0
WireConnection;2991;6;3070;0
WireConnection;2991;9;2601;0
WireConnection;2991;8;2601;32
WireConnection;2991;3;2680;0
WireConnection;2991;7;2673;0
WireConnection;2990;6;2721;0
WireConnection;2990;9;2628;0
WireConnection;2990;8;2628;32
WireConnection;2990;3;2703;0
WireConnection;2990;7;2709;0
WireConnection;3025;0;3037;0
WireConnection;3025;1;3036;0
WireConnection;2992;6;2649;0
WireConnection;2992;9;2609;0
WireConnection;2992;8;2609;32
WireConnection;2992;3;2679;0
WireConnection;2992;7;2690;0
WireConnection;2993;6;3064;0
WireConnection;2993;9;2604;0
WireConnection;2993;8;2604;32
WireConnection;2993;3;2682;0
WireConnection;2993;7;2674;0
WireConnection;2988;6;3066;0
WireConnection;2988;9;2619;0
WireConnection;2988;8;2619;32
WireConnection;2988;3;2683;0
WireConnection;2988;7;2686;0
WireConnection;2711;0;2838;0
WireConnection;2711;2;2991;0
WireConnection;2711;3;2993;0
WireConnection;2711;4;2992;0
WireConnection;2711;5;2986;0
WireConnection;2711;6;2987;0
WireConnection;2711;7;2988;0
WireConnection;2711;8;3081;0
WireConnection;2728;0;2995;0
WireConnection;2728;1;2990;0
WireConnection;2728;2;2994;0
WireConnection;2728;3;2989;0
WireConnection;2728;4;2839;0
WireConnection;3030;0;3025;0
WireConnection;3030;1;3036;0
WireConnection;2841;0;2838;0
WireConnection;2736;0;2711;0
WireConnection;3027;1;3030;0
WireConnection;3059;0;2711;0
WireConnection;3059;1;2995;0
WireConnection;3059;2;2839;0
WireConnection;2735;0;2728;0
WireConnection;2840;0;2839;0
WireConnection;3029;0;3027;0
WireConnection;2661;0;2609;32
WireConnection;3060;0;3059;0
WireConnection;2842;0;2843;0
WireConnection;2842;1;2844;0
WireConnection;2739;0;2737;0
WireConnection;2739;1;2738;0
WireConnection;3039;0;3042;0
WireConnection;2845;1;2739;0
WireConnection;2845;0;2842;0
WireConnection;2845;2;2739;0
WireConnection;2845;3;2794;0
WireConnection;2845;4;3061;0
WireConnection;2845;5;2739;0
WireConnection;2845;6;2739;0
WireConnection;2800;1;2798;0
WireConnection;3040;0;2845;0
WireConnection;3040;1;3039;0
WireConnection;3082;9;3040;0
WireConnection;2806;1;3062;0
WireConnection;2805;1;2800;0
WireConnection;3043;0;3082;0
WireConnection;3043;1;2845;0
WireConnection;3043;2;3039;0
WireConnection;2809;0;2805;0
WireConnection;2809;1;2806;0
WireConnection;2655;0;3068;0
WireConnection;2668;0;2649;0
WireConnection;2660;0;2651;32
WireConnection;2665;0;2648;32
WireConnection;2667;0;2650;0
WireConnection;2657;0;2640;32
WireConnection;2810;0;3043;0
WireConnection;2810;1;2807;0
WireConnection;2810;2;2809;0
WireConnection;2658;0;2653;0
WireConnection;2656;0;2641;32
WireConnection;2659;0;3069;0
WireConnection;2803;1;3043;0
WireConnection;2803;0;3043;0
WireConnection;2803;2;2810;0
WireConnection;2803;3;3043;0
WireConnection;2803;4;3043;0
WireConnection;2803;5;3043;0
WireConnection;2803;6;3043;0
WireConnection;2789;1;2776;0
WireConnection;2789;3;2773;0
WireConnection;2789;4;2772;0
WireConnection;2785;1;2779;0
WireConnection;2785;3;2777;0
WireConnection;2785;4;2770;0
WireConnection;2787;1;2782;0
WireConnection;2787;3;2780;0
WireConnection;2787;4;2771;0
WireConnection;2788;1;2783;0
WireConnection;2788;3;2781;0
WireConnection;2788;4;2774;0
WireConnection;2786;1;2778;0
WireConnection;2786;3;2784;0
WireConnection;2786;4;2775;0
WireConnection;2808;24;3047;0
WireConnection;2808;25;2801;0
WireConnection;2808;26;2802;0
WireConnection;2808;27;2804;0
WireConnection;2808;15;2803;0
WireConnection;2790;0;2789;0
WireConnection;2790;1;2788;0
WireConnection;2790;2;2786;0
WireConnection;2790;3;2787;0
WireConnection;2790;4;2785;0
WireConnection;2811;1;2803;0
WireConnection;2811;0;2808;0
WireConnection;2791;1;2790;0
WireConnection;3031;0;3038;2
WireConnection;3031;1;3026;0
WireConnection;2817;1;2811;0
WireConnection;2817;0;2811;0
WireConnection;2817;2;2811;0
WireConnection;2817;3;2803;0
WireConnection;2817;4;2811;0
WireConnection;2817;5;2811;0
WireConnection;2817;6;2803;0
WireConnection;2814;0;2812;1
WireConnection;3032;0;3038;1
WireConnection;3032;1;3023;0
WireConnection;3028;0;3032;0
WireConnection;3028;1;3031;0
WireConnection;3028;2;3033;0
WireConnection;3033;0;3038;3
WireConnection;3033;1;3024;0
WireConnection;2812;0;2815;0
WireConnection;3038;0;3027;0
WireConnection;0;0;2817;0
WireConnection;0;2;2791;0
ASEEND*/
//CHKSM=CC7627CAB7196644842FEF935CCE20C4EEBAD9EA