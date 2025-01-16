// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/GradientShader"
{
	Properties
	{
		[KeywordEnum(Building,Prop,Car,Matcap)] _Workflow("Workflow", Float) = 0
		_matcap_hue("matcap_hue", Range( 0 , 1)) = 0
		[Toggle]_car_color_primaryGradient("car_color_primary Gradient", Float) = 1
		_matcap_saturation("matcap_saturation", Range( 0 , 2)) = 1
		[HDR]_car_color_primary("car_color_primary", Color) = (1,1,1,0)
		_matcap_value("matcap_value", Range( -1 , 1)) = 0
		[HDR]_car_color_primary2("car_color_primary2", Color) = (0,0,0,0)
		[Toggle]_car_color_secondaryGradient("car_color_secondary Gradient", Float) = 1
		_car_color_secondary("car_color_secondary", Color) = (1,1,1,0)
		_car_color_secondary2("car_color_secondary2", Color) = (0,0,0,0)
		[Toggle]_car_headlight_aGradient("car_headlight_a Gradient", Float) = 1
		_car_headlight_a("car_headlight_a", Color) = (1,1,1,0)
		_car_headlight_a2("car_headlight_a2", Color) = (0,0,0,0)
		[Toggle]_car_headlight_bGradient("car_headlight_b Gradient", Float) = 1
		_car_headlight_b("car_headlight_b", Color) = (1,1,1,0)
		_car_headlight_b2("car_headlight_b2", Color) = (0,0,0,0)
		[Toggle]_car_window_aGradient("car_window_a Gradient", Float) = 1
		_car_window_a("car_window_a", Color) = (1,1,1,0)
		_car_window_a2("car_window_a2", Color) = (0,0,0,0)
		[Toggle]_car_wheel_cover_aGradient("car_wheel_cover_a Gradient", Float) = 1
		_car_wheel_cover_a("car_wheel_cover_a", Color) = (1,1,1,0)
		_car_wheel_cover_a1("car_wheel_cover_a1", Color) = (0,0,0,0)
		[Toggle]_car_wheel_aGradient("car_wheel_a Gradient", Float) = 1
		_car_wheel_a("car_wheel_a", Color) = (1,1,1,0)
		_car_wheel_a2("car_wheel_a2", Color) = (0,0,0,0)
		[Toggle]_car_wheel_bGradient("car_wheel_b Gradient", Float) = 1
		_car_wheel_b("car_wheel_b", Color) = (1,1,1,0)
		_car_wheel_b2("car_wheel_b2", Color) = (0,0,0,0)
		[Toggle]_prop_color_primaryGradient("prop_color_primary Gradient", Float) = 1
		[HDR]_prop_color_primary("prop_color_primary", Color) = (1,1,1,0)
		[HDR]_prop_color_primary2("prop_color_primary2", Color) = (0,0,0,0)
		[Toggle]_prop_color_secondaryGradient("prop_color_secondary Gradient", Float) = 1
		_prop_color_secondary("prop_color_secondary", Color) = (1,1,1,0)
		_prop_color_secondary2("prop_color_secondary2", Color) = (0,0,0,0)
		[Toggle]_prop_color_bonus_aGradient("prop_color_bonus_a Gradient", Float) = 1
		_prop_color_bonus_a("prop_color_bonus_a", Color) = (1,1,1,0)
		_prop_color_bonus_a2("prop_color_bonus_a2", Color) = (0,0,0,0)
		[Toggle]_prop_color_bonus_bGradient("prop_color_bonus_b Gradient", Float) = 1
		_prop_color_bonus_b("prop_color_bonus_b", Color) = (1,1,1,0)
		_prop_color_bonus_b2("prop_color_bonus_b2", Color) = (0,0,0,0)
		[Toggle]_prop_color_bonus_cGradient("prop_color_bonus_c Gradient", Float) = 1
		_prop_color_bonus_c("prop_color_bonus_c", Color) = (1,1,1,0)
		_prop_color_bonus_c2("prop_color_bonus_c2", Color) = (0,0,0,0)
		[Toggle]_bld_color_primaryGradient("bld_color_primary Gradient", Float) = 1
		[HDR]_bld_color_primary("bld_color_primary", Color) = (1,1,1,0)
		[HDR]_bld_color_primary2("bld_color_primary2", Color) = (0,0,0,0)
		[Toggle]_bld_color_secondaryGradient("bld_color_secondary Gradient", Float) = 1
		[HDR]_bld_color_secondary("bld_color_secondary", Color) = (1,1,1,0)
		[HDR]_bld_color_secondary2("bld_color_secondary2", Color) = (0,0,0,0)
		[Toggle]_bld_roof_primaryGradient("bld_roof_primary Gradient", Float) = 1
		[HDR]_bld_roof_primary("bld_roof_primary", Color) = (1,1,1,0)
		[HDR]_bld_roof_primary2("bld_roof_primary2", Color) = (0,0,0,0)
		[Toggle]_bld_roof_secondaryGradient("bld_roof_secondary Gradient", Float) = 1
		[HDR]_bld_roof_secondary("bld_roof_secondary", Color) = (1,1,1,0)
		[HDR]_bld_roof_secondary2("bld_roof_secondary2", Color) = (0,0,0,0)
		[Toggle]_bld_windowGradient("bld_window Gradient ", Float) = 1
		[HDR]_bld_window("bld_window", Color) = (1,1,1,0)
		[HDR]_bld_window2("bld_window2", Color) = (0,0,0,0)
		[Toggle]_bld_window_frameGradient("bld_window_frame Gradient", Float) = 1
		[HDR]_bld_window_frame("bld_window_frame", Color) = (1,1,1,0)
		[HDR]_bld_window_frame2("bld_window_frame2", Color) = (0,0,0,0)
		[Toggle]_bld_window_railGradient("bld_window_rail Gradient", Float) = 1
		[HDR]_bld_window_rail("bld_window_rail", Color) = (1,1,1,0)
		[HDR]_bld_window_rail2("bld_window_rail2", Color) = (0,0,0,0)
		[Toggle]_bld_decorGradient("bld_decor Gradient", Float) = 1
		[HDR]_bld_decor("bld_decor", Color) = (1,1,1,0)
		[HDR]_bld_decor2("bld_decor2", Color) = (0,0,0,0)
		[Toggle]_bld_bottom_primaryGradient("bld_bottom_primary Gradient", Float) = 1
		[HDR]_bld_bottom_primary("bld_bottom_primary", Color) = (1,1,1,0)
		[HDR]_bld_bottom_primary2("bld_bottom_primary2", Color) = (0,0,0,0)
		[Toggle]_bld_bottom_secondary_aGradient("bld_bottom_secondary_a Gradient", Float) = 1
		[HDR]_bld_bottom_secondary_a("bld_bottom_secondary_a", Color) = (1,1,1,0)
		[HDR]_bld_bottom_secondary_a2("bld_bottom_secondary_a2", Color) = (0,0,0,0)
		[Toggle]_bld_bottom_roofing_aGradient("bld_bottom_roofing_a Gradient", Float) = 1
		[HDR]_bld_bottom_roofing_a("bld_bottom_roofing_a", Color) = (1,1,1,0)
		[HDR]_bld_bottom_roofing_a2("bld_bottom_roofing_a2", Color) = (0,0,0,0)
		[Toggle]_bld_bottom_roofing_bGradient("bld_bottom_roofing_b Gradient", Float) = 1
		[HDR]_bld_bottom_roofing_b("bld_bottom_roofing_b", Color) = (1,1,1,0)
		[HDR]_bld_bottom_roofing_b2("bld_bottom_roofing_b2", Color) = (0,0,0,0)
		[Toggle]_bld_bonus_color_aGradient("bld_bonus_color_a Gradient", Float) = 1
		[HDR]_bld_bonus_color_a("bld_bonus_color_a", Color) = (1,1,1,0)
		[HDR]_bld_bonus_color_a2("bld_bonus_color_a2", Color) = (0,0,0,0)
		[Toggle]_bld_bonus_color_bGradient("bld_bonus_color_b Gradient", Float) = 1
		[HDR]_bld_bonus_color_b("bld_bonus_color_b", Color) = (1,1,1,0)
		[HDR]_bld_bonus_color_b2("bld_bonus_color_b2", Color) = (0,0,0,0)
		[Toggle]_bld_bonus_color_cGradient("bld_bonus_color_c Gradient", Float) = 1
		[HDR]_bld_bonus_color_c("bld_bonus_color_c", Color) = (1,1,1,0)
		[HDR]_bld_bonus_color_c2("bld_bonus_color_c2", Color) = (0,0,0,0)
		[Toggle]_bld_bonus_color_dGradient("bld_bonus_color_d Gradient", Float) = 1
		[HDR]_bld_bonus_color_d("bld_bonus_color_d", Color) = (1,1,1,0)
		[HDR]_bld_bonus_color_d2("bld_bonus_color_d2", Color) = (0,0,0,0)
		[ToggleOff(_ENABLEWORLDSPACEGRADIENT__WSG_OFF)] _enableworldspacegradient__wsg("enable world space gradient__wsg", Float) = 0
		_wsg_TopColor("wsg_TopColor", Color) = (0.8416696,0.9076058,0.9245283,0)
		_wsg_BottomColor("wsg_BottomColor", Color) = (0.1698113,0.1465824,0.1465824,0)
		_wsg_GradientHeight("wsg_GradientHeight", Range( 0 , 20)) = 6.4
		_wsg_gradientPower("wsg_gradientPower", Range( 0 , 1)) = 1
		_Hue1("Hue", Range( 0 , 1)) = 0
		_Value1("Value", Range( -1 , 1)) = 0
		_Saturation1("Saturation", Range( 0 , 2)) = 1
		[ToggleOff(_ENABLEEMISSION__EMS_OFF)] _enableemission__ems("enable emission__ems", Float) = 0
		[NoScaleOffset]_matcap_a("matcap_a", 2D) = "white" {}
		[Toggle]_ems_window_color_enable("ems_window_color_enable", Float) = 0
		[HDR]_ems_window_color("ems_window_color", Color) = (1,1,1,0)
		[Toggle]_ems_prop_color_1_enable("ems_prop_color_1_enable", Float) = 0
		[HDR]_ems_prop_color_1("ems_prop_color_1", Color) = (1,1,1,0)
		[Toggle]_ems_prop_color_2_enable("ems_prop_color_2_enable", Float) = 0
		[HDR]_ems_prop_color_2("ems_prop_color_2", Color) = (1,1,1,0)
		[Toggle]_ems_prop_color_3_enable("ems_prop_color_3_enable", Float) = 0
		[HDR]_ems_prop_color_3("ems_prop_color_3", Color) = (1,1,1,0)
		[Toggle]_ems_prop_color_4_enable("ems_prop_color_4_enable", Float) = 0
		[HDR]_ems_prop_color_4("ems_prop_color_3", Color) = (1,1,1,0)
		[HideInInspector]_GridMask("GridMask", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _WORKFLOW_BUILDING _WORKFLOW_PROP _WORKFLOW_CAR _WORKFLOW_MATCAP
		#pragma shader_feature_local _ENABLEWORLDSPACEGRADIENT__WSG_OFF
		#pragma shader_feature_local _ENABLEEMISSION__EMS_OFF
		struct Input
		{
			float2 uv_texcoord;
			float3 worldNormal;
			float3 worldPos;
		};

		uniform float4 _bld_color_secondary2;
		uniform float4 _bld_color_secondary;
		uniform float _bld_color_secondaryGradient;
		uniform sampler2D _GridMask;
		uniform float4 _GridMask_ST;
		uniform float4 _bld_color_primary2;
		uniform float4 _bld_color_primary;
		uniform float _bld_color_primaryGradient;
		uniform float4 _bld_roof_primary2;
		uniform float4 _bld_roof_primary;
		uniform float _bld_roof_primaryGradient;
		uniform float4 _bld_roof_secondary2;
		uniform float4 _bld_roof_secondary;
		uniform float _bld_roof_secondaryGradient;
		uniform float4 _bld_window2;
		uniform float4 _bld_window;
		uniform float _bld_windowGradient;
		uniform float4 _bld_window_frame2;
		uniform float4 _bld_window_frame;
		uniform float _bld_window_frameGradient;
		uniform float4 _bld_window_rail2;
		uniform float4 _bld_window_rail;
		uniform float _bld_window_railGradient;
		uniform float4 _bld_decor2;
		uniform float4 _bld_decor;
		uniform float _bld_decorGradient;
		uniform float4 _bld_bottom_primary2;
		uniform float4 _bld_bottom_primary;
		uniform float _bld_bottom_primaryGradient;
		uniform float4 _bld_bottom_secondary_a2;
		uniform float4 _bld_bottom_secondary_a;
		uniform float _bld_bottom_secondary_aGradient;
		uniform float4 _bld_bottom_roofing_a2;
		uniform float4 _bld_bottom_roofing_a;
		uniform float _bld_bottom_roofing_aGradient;
		uniform float4 _bld_bottom_roofing_b2;
		uniform float4 _bld_bottom_roofing_b;
		uniform float _bld_bottom_roofing_bGradient;
		uniform float4 _bld_bonus_color_a2;
		uniform float4 _bld_bonus_color_a;
		uniform float _bld_bonus_color_aGradient;
		uniform float4 _bld_bonus_color_b2;
		uniform float4 _bld_bonus_color_b;
		uniform float _bld_bonus_color_bGradient;
		uniform float4 _bld_bonus_color_c2;
		uniform float4 _bld_bonus_color_c;
		uniform float _bld_bonus_color_cGradient;
		uniform float4 _bld_bonus_color_d2;
		uniform float4 _bld_bonus_color_d;
		uniform float _bld_bonus_color_dGradient;
		uniform float4 _prop_color_primary2;
		uniform float4 _prop_color_primary;
		uniform float _prop_color_primaryGradient;
		uniform float4 _prop_color_secondary2;
		uniform float4 _prop_color_secondary;
		uniform float _prop_color_secondaryGradient;
		uniform float4 _prop_color_bonus_a2;
		uniform float4 _prop_color_bonus_a;
		uniform float _prop_color_bonus_aGradient;
		uniform float4 _prop_color_bonus_b2;
		uniform float4 _prop_color_bonus_b;
		uniform float _prop_color_bonus_bGradient;
		uniform float4 _prop_color_bonus_c2;
		uniform float4 _prop_color_bonus_c;
		uniform float _prop_color_bonus_cGradient;
		uniform float4 _car_color_primary2;
		uniform float4 _car_color_primary;
		uniform float _car_color_primaryGradient;
		uniform float4 _car_color_secondary2;
		uniform float4 _car_color_secondary;
		uniform float _car_color_secondaryGradient;
		uniform float4 _car_headlight_a2;
		uniform float4 _car_headlight_a;
		uniform float _car_headlight_aGradient;
		uniform float4 _car_headlight_b2;
		uniform float4 _car_headlight_b;
		uniform float _car_headlight_bGradient;
		uniform float4 _car_window_a2;
		uniform float4 _car_window_a;
		uniform float _car_window_aGradient;
		uniform float4 _car_wheel_cover_a1;
		uniform float4 _car_wheel_cover_a;
		uniform float _car_wheel_cover_aGradient;
		uniform float4 _car_wheel_a2;
		uniform float4 _car_wheel_a;
		uniform float _car_wheel_aGradient;
		uniform float4 _car_wheel_b2;
		uniform float4 _car_wheel_b;
		uniform float _car_wheel_bGradient;
		uniform sampler2D _matcap_a;
		uniform float _matcap_hue;
		uniform float _matcap_saturation;
		uniform float _matcap_value;
		uniform float _Hue1;
		uniform float _Saturation1;
		uniform float _Value1;
		uniform float4 _wsg_BottomColor;
		uniform float4 _wsg_TopColor;
		uniform float _wsg_GradientHeight;
		uniform float _wsg_gradientPower;
		uniform float _ems_prop_color_3_enable;
		uniform float4 _ems_prop_color_3;
		uniform float _ems_prop_color_2_enable;
		uniform float4 _ems_prop_color_2;
		uniform float _ems_prop_color_1_enable;
		uniform float4 _ems_prop_color_1;
		uniform float _ems_window_color_enable;
		uniform float4 _ems_window_color;
		uniform float _ems_prop_color_4_enable;
		uniform float4 _ems_prop_color_4;


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
			float2 uv_GridMask = i.uv_texcoord * _GridMask_ST.xy + _GridMask_ST.zw;
			float4 GridMask1015 = tex2D( _GridMask, uv_GridMask );
			float temp_output_25_0_g539 = 0.02;
			float4 temp_cast_0 = (temp_output_25_0_g539).xxxx;
			float4 temp_output_22_0_g539 = step( GridMask1015 , temp_cast_0 );
			float temp_output_25_0_g538 = 0.01;
			float4 temp_cast_1 = (temp_output_25_0_g538).xxxx;
			float4 temp_output_22_0_g538 = step( GridMask1015 , temp_cast_1 );
			float4 temp_output_44_0_g539 = temp_output_22_0_g538;
			float4 temp_output_1271_32 = ( temp_output_22_0_g539 - temp_output_44_0_g539 );
			float4 temp_cast_2 = (temp_output_25_0_g539).xxxx;
			float2 uv_TexCoord705 = i.uv_texcoord * float2( 1,4 );
			float GridGradient985 = frac( ( uv_TexCoord705.y * 1.0 ) );
			float4 lerpResult598 = lerp( _bld_color_secondary2 , _bld_color_secondary , (( _bld_color_secondaryGradient )?( ( ( temp_output_22_0_g539 * GridGradient985 ) - temp_output_44_0_g539 ) ):( temp_output_1271_32 )));
			float4 temp_cast_3 = (temp_output_25_0_g538).xxxx;
			float4 temp_output_44_0_g538 = float4( 0,0,0,0 );
			float4 temp_output_1272_32 = ( temp_output_22_0_g538 - temp_output_44_0_g538 );
			float4 temp_cast_4 = (temp_output_25_0_g538).xxxx;
			float4 lerpResult595 = lerp( _bld_color_primary2 , _bld_color_primary , (( _bld_color_primaryGradient )?( ( ( temp_output_22_0_g538 * GridGradient985 ) - temp_output_44_0_g538 ) ):( temp_output_1272_32 )));
			float temp_output_25_0_g540 = 0.04;
			float4 temp_cast_5 = (temp_output_25_0_g540).xxxx;
			float4 temp_output_22_0_g540 = step( GridMask1015 , temp_cast_5 );
			float4 temp_cast_6 = (temp_output_25_0_g539).xxxx;
			float4 temp_output_44_0_g540 = temp_output_22_0_g539;
			float4 temp_output_1265_32 = ( temp_output_22_0_g540 - temp_output_44_0_g540 );
			float4 temp_cast_7 = (temp_output_25_0_g540).xxxx;
			float4 lerpResult601 = lerp( _bld_roof_primary2 , _bld_roof_primary , (( _bld_roof_primaryGradient )?( ( ( temp_output_22_0_g540 * GridGradient985 ) - temp_output_44_0_g540 ) ):( temp_output_1265_32 )));
			float temp_output_25_0_g541 = ( temp_output_25_0_g540 + 0.03 );
			float4 temp_cast_8 = (temp_output_25_0_g541).xxxx;
			float4 temp_output_22_0_g541 = step( GridMask1015 , temp_cast_8 );
			float4 temp_cast_9 = (temp_output_25_0_g540).xxxx;
			float4 temp_output_44_0_g541 = temp_output_22_0_g540;
			float4 temp_output_1264_32 = ( temp_output_22_0_g541 - temp_output_44_0_g541 );
			float4 temp_cast_10 = (temp_output_25_0_g541).xxxx;
			float4 lerpResult606 = lerp( _bld_roof_secondary2 , _bld_roof_secondary , (( _bld_roof_secondaryGradient )?( ( ( temp_output_22_0_g541 * GridGradient985 ) - temp_output_44_0_g541 ) ):( temp_output_1264_32 )));
			float temp_output_25_0_g542 = ( temp_output_25_0_g541 + 0.03 );
			float4 temp_cast_11 = (temp_output_25_0_g542).xxxx;
			float4 temp_output_22_0_g542 = step( GridMask1015 , temp_cast_11 );
			float4 temp_cast_12 = (temp_output_25_0_g541).xxxx;
			float4 temp_output_44_0_g542 = temp_output_22_0_g541;
			float4 temp_output_1263_32 = ( temp_output_22_0_g542 - temp_output_44_0_g542 );
			float4 temp_cast_13 = (temp_output_25_0_g542).xxxx;
			float4 lerpResult608 = lerp( _bld_window2 , _bld_window , (( _bld_windowGradient )?( ( ( temp_output_22_0_g542 * GridGradient985 ) - temp_output_44_0_g542 ) ):( temp_output_1263_32 )));
			float temp_output_25_0_g543 = 0.12;
			float4 temp_cast_14 = (temp_output_25_0_g543).xxxx;
			float4 temp_output_22_0_g543 = step( GridMask1015 , temp_cast_14 );
			float4 temp_cast_15 = (temp_output_25_0_g542).xxxx;
			float4 temp_output_44_0_g543 = temp_output_22_0_g542;
			float4 temp_output_1268_32 = ( temp_output_22_0_g543 - temp_output_44_0_g543 );
			float4 temp_cast_16 = (temp_output_25_0_g543).xxxx;
			float4 lerpResult613 = lerp( _bld_window_frame2 , _bld_window_frame , (( _bld_window_frameGradient )?( ( ( temp_output_22_0_g543 * GridGradient985 ) - temp_output_44_0_g543 ) ):( temp_output_1268_32 )));
			float temp_output_25_0_g544 = 0.2;
			float4 temp_cast_17 = (temp_output_25_0_g544).xxxx;
			float4 temp_output_22_0_g544 = step( GridMask1015 , temp_cast_17 );
			float4 temp_cast_18 = (temp_output_25_0_g543).xxxx;
			float4 temp_output_44_0_g544 = temp_output_22_0_g543;
			float4 temp_output_1245_32 = ( temp_output_22_0_g544 - temp_output_44_0_g544 );
			float4 temp_cast_19 = (temp_output_25_0_g544).xxxx;
			float4 lerpResult614 = lerp( _bld_window_rail2 , _bld_window_rail , (( _bld_window_railGradient )?( ( ( temp_output_22_0_g544 * GridGradient985 ) - temp_output_44_0_g544 ) ):( temp_output_1245_32 )));
			float temp_output_25_0_g545 = ( temp_output_25_0_g544 + 0.03 );
			float4 temp_cast_20 = (temp_output_25_0_g545).xxxx;
			float4 temp_output_22_0_g545 = step( GridMask1015 , temp_cast_20 );
			float4 temp_cast_21 = (temp_output_25_0_g544).xxxx;
			float4 temp_output_44_0_g545 = temp_output_22_0_g544;
			float4 temp_output_1270_32 = ( temp_output_22_0_g545 - temp_output_44_0_g545 );
			float4 temp_cast_22 = (temp_output_25_0_g545).xxxx;
			float4 lerpResult615 = lerp( _bld_decor2 , _bld_decor , (( _bld_decorGradient )?( ( ( temp_output_22_0_g545 * GridGradient985 ) - temp_output_44_0_g545 ) ):( temp_output_1270_32 )));
			float4 bld_add11051 = ( ( lerpResult598 * temp_output_1271_32 ) + ( lerpResult595 * temp_output_1272_32 ) + ( lerpResult601 * temp_output_1265_32 ) + ( lerpResult606 * temp_output_1264_32 ) + ( lerpResult608 * temp_output_1263_32 ) + ( lerpResult613 * temp_output_1268_32 ) + ( lerpResult614 * temp_output_1245_32 ) + ( lerpResult615 * temp_output_1270_32 ) );
			float temp_output_25_0_g546 = 0.29;
			float4 temp_cast_23 = (temp_output_25_0_g546).xxxx;
			float4 temp_output_22_0_g546 = step( GridMask1015 , temp_cast_23 );
			float4 temp_cast_24 = (temp_output_25_0_g545).xxxx;
			float4 temp_output_44_0_g546 = temp_output_22_0_g545;
			float4 temp_output_1269_32 = ( temp_output_22_0_g546 - temp_output_44_0_g546 );
			float4 temp_cast_25 = (temp_output_25_0_g546).xxxx;
			float4 lerpResult616 = lerp( _bld_bottom_primary2 , _bld_bottom_primary , (( _bld_bottom_primaryGradient )?( ( ( temp_output_22_0_g546 * GridGradient985 ) - temp_output_44_0_g546 ) ):( temp_output_1269_32 )));
			float temp_output_25_0_g547 = 0.35;
			float4 temp_cast_26 = (temp_output_25_0_g547).xxxx;
			float4 temp_output_22_0_g547 = step( GridMask1015 , temp_cast_26 );
			float4 temp_cast_27 = (temp_output_25_0_g546).xxxx;
			float4 temp_output_44_0_g547 = temp_output_22_0_g546;
			float4 temp_output_1266_32 = ( temp_output_22_0_g547 - temp_output_44_0_g547 );
			float4 temp_cast_28 = (temp_output_25_0_g547).xxxx;
			float4 lerpResult617 = lerp( _bld_bottom_secondary_a2 , _bld_bottom_secondary_a , (( _bld_bottom_secondary_aGradient )?( ( ( temp_output_22_0_g547 * GridGradient985 ) - temp_output_44_0_g547 ) ):( temp_output_1266_32 )));
			float temp_output_25_0_g557 = 0.47;
			float4 temp_cast_29 = (temp_output_25_0_g557).xxxx;
			float4 temp_output_22_0_g557 = step( GridMask1015 , temp_cast_29 );
			float4 temp_cast_30 = (temp_output_25_0_g547).xxxx;
			float4 temp_output_44_0_g557 = temp_output_22_0_g547;
			float4 temp_output_1267_32 = ( temp_output_22_0_g557 - temp_output_44_0_g557 );
			float4 temp_cast_31 = (temp_output_25_0_g557).xxxx;
			float4 lerpResult618 = lerp( _bld_bottom_roofing_a2 , _bld_bottom_roofing_a , (( _bld_bottom_roofing_aGradient )?( ( ( temp_output_22_0_g557 * GridGradient985 ) - temp_output_44_0_g557 ) ):( temp_output_1267_32 )));
			float temp_output_25_0_g561 = 0.56;
			float4 temp_cast_32 = (temp_output_25_0_g561).xxxx;
			float4 temp_output_22_0_g561 = step( GridMask1015 , temp_cast_32 );
			float4 temp_cast_33 = (temp_output_25_0_g557).xxxx;
			float4 temp_output_44_0_g561 = temp_output_22_0_g557;
			float4 temp_output_1251_32 = ( temp_output_22_0_g561 - temp_output_44_0_g561 );
			float4 temp_cast_34 = (temp_output_25_0_g561).xxxx;
			float4 lerpResult619 = lerp( _bld_bottom_roofing_b2 , _bld_bottom_roofing_b , (( _bld_bottom_roofing_bGradient )?( ( ( temp_output_22_0_g561 * GridGradient985 ) - temp_output_44_0_g561 ) ):( temp_output_1251_32 )));
			float temp_output_25_0_g564 = 0.73;
			float4 temp_cast_35 = (temp_output_25_0_g564).xxxx;
			float4 temp_output_22_0_g564 = step( GridMask1015 , temp_cast_35 );
			float4 temp_cast_36 = (temp_output_25_0_g561).xxxx;
			float4 temp_output_44_0_g564 = temp_output_22_0_g561;
			float4 temp_output_1250_32 = ( temp_output_22_0_g564 - temp_output_44_0_g564 );
			float4 temp_cast_37 = (temp_output_25_0_g564).xxxx;
			float4 lerpResult620 = lerp( _bld_bonus_color_a2 , _bld_bonus_color_a , (( _bld_bonus_color_aGradient )?( ( ( temp_output_22_0_g564 * GridGradient985 ) - temp_output_44_0_g564 ) ):( temp_output_1250_32 )));
			float temp_output_25_0_g573 = ( temp_output_25_0_g564 + 0.03 );
			float4 temp_cast_38 = (temp_output_25_0_g573).xxxx;
			float4 temp_output_22_0_g573 = step( GridMask1015 , temp_cast_38 );
			float4 temp_cast_39 = (temp_output_25_0_g564).xxxx;
			float4 temp_output_44_0_g573 = temp_output_22_0_g564;
			float4 temp_output_1246_32 = ( temp_output_22_0_g573 - temp_output_44_0_g573 );
			float4 temp_cast_40 = (temp_output_25_0_g573).xxxx;
			float4 lerpResult621 = lerp( _bld_bonus_color_b2 , _bld_bonus_color_b , (( _bld_bonus_color_bGradient )?( ( ( temp_output_22_0_g573 * GridGradient985 ) - temp_output_44_0_g573 ) ):( temp_output_1246_32 )));
			float temp_output_25_0_g576 = 0.91;
			float4 temp_cast_41 = (temp_output_25_0_g576).xxxx;
			float4 temp_output_22_0_g576 = step( GridMask1015 , temp_cast_41 );
			float4 temp_cast_42 = (temp_output_25_0_g573).xxxx;
			float4 temp_output_44_0_g576 = temp_output_22_0_g573;
			float4 temp_output_1258_32 = ( temp_output_22_0_g576 - temp_output_44_0_g576 );
			float4 temp_cast_43 = (temp_output_25_0_g576).xxxx;
			float4 lerpResult622 = lerp( _bld_bonus_color_c2 , _bld_bonus_color_c , (( _bld_bonus_color_cGradient )?( ( ( temp_output_22_0_g576 * GridGradient985 ) - temp_output_44_0_g576 ) ):( temp_output_1258_32 )));
			float temp_output_25_0_g579 = 1.03;
			float4 temp_cast_44 = (temp_output_25_0_g579).xxxx;
			float4 temp_output_22_0_g579 = step( GridMask1015 , temp_cast_44 );
			float4 temp_cast_45 = (temp_output_25_0_g576).xxxx;
			float4 temp_output_44_0_g579 = temp_output_22_0_g576;
			float4 temp_output_1256_32 = ( temp_output_22_0_g579 - temp_output_44_0_g579 );
			float4 temp_cast_46 = (temp_output_25_0_g579).xxxx;
			float4 lerpResult623 = lerp( _bld_bonus_color_d2 , _bld_bonus_color_d , (( _bld_bonus_color_dGradient )?( ( ( temp_output_22_0_g579 * GridGradient985 ) - temp_output_44_0_g579 ) ):( temp_output_1256_32 )));
			float4 bld_add21052 = ( ( lerpResult616 * temp_output_1269_32 ) + ( lerpResult617 * temp_output_1266_32 ) + ( lerpResult618 * temp_output_1267_32 ) + ( lerpResult619 * temp_output_1251_32 ) + ( lerpResult620 * temp_output_1250_32 ) + ( lerpResult621 * temp_output_1246_32 ) + ( lerpResult622 * temp_output_1258_32 ) + ( lerpResult623 * temp_output_1256_32 ) );
			float temp_output_25_0_g574 = 0.01;
			float4 temp_cast_47 = (temp_output_25_0_g574).xxxx;
			float4 temp_output_22_0_g574 = step( GridMask1015 , temp_cast_47 );
			float4 temp_output_44_0_g574 = float4( 0,0,0,0 );
			float4 temp_output_1247_32 = ( temp_output_22_0_g574 - temp_output_44_0_g574 );
			float4 temp_cast_48 = (temp_output_25_0_g574).xxxx;
			float4 lerpResult858 = lerp( _prop_color_primary2 , _prop_color_primary , (( _prop_color_primaryGradient )?( ( ( temp_output_22_0_g574 * GridGradient985 ) - temp_output_44_0_g574 ) ):( temp_output_1247_32 )));
			float temp_output_25_0_g578 = 0.02;
			float4 temp_cast_49 = (temp_output_25_0_g578).xxxx;
			float4 temp_output_22_0_g578 = step( GridMask1015 , temp_cast_49 );
			float4 temp_cast_50 = (temp_output_25_0_g574).xxxx;
			float4 temp_output_44_0_g578 = temp_output_22_0_g574;
			float4 temp_output_1259_32 = ( temp_output_22_0_g578 - temp_output_44_0_g578 );
			float4 temp_cast_51 = (temp_output_25_0_g578).xxxx;
			float4 lerpResult859 = lerp( _prop_color_secondary2 , _prop_color_secondary , (( _prop_color_secondaryGradient )?( ( ( temp_output_22_0_g578 * GridGradient985 ) - temp_output_44_0_g578 ) ):( temp_output_1259_32 )));
			float temp_output_25_0_g581 = 0.04;
			float4 temp_cast_52 = (temp_output_25_0_g581).xxxx;
			float4 temp_output_22_0_g581 = step( GridMask1015 , temp_cast_52 );
			float4 temp_cast_53 = (temp_output_25_0_g578).xxxx;
			float4 temp_output_44_0_g581 = temp_output_22_0_g578;
			float4 temp_output_1255_32 = ( temp_output_22_0_g581 - temp_output_44_0_g581 );
			float4 temp_cast_54 = (temp_output_25_0_g581).xxxx;
			float4 lerpResult864 = lerp( _prop_color_bonus_a2 , _prop_color_bonus_a , (( _prop_color_bonus_aGradient )?( ( ( temp_output_22_0_g581 * GridGradient985 ) - temp_output_44_0_g581 ) ):( temp_output_1255_32 )));
			float temp_output_25_0_g582 = ( temp_output_25_0_g581 + 0.03 );
			float4 temp_cast_55 = (temp_output_25_0_g582).xxxx;
			float4 temp_output_22_0_g582 = step( GridMask1015 , temp_cast_55 );
			float4 temp_cast_56 = (temp_output_25_0_g581).xxxx;
			float4 temp_output_44_0_g582 = temp_output_22_0_g581;
			float4 temp_output_1253_32 = ( temp_output_22_0_g582 - temp_output_44_0_g582 );
			float4 temp_cast_57 = (temp_output_25_0_g582).xxxx;
			float4 lerpResult860 = lerp( _prop_color_bonus_b2 , _prop_color_bonus_b , (( _prop_color_bonus_bGradient )?( ( ( temp_output_22_0_g582 * GridGradient985 ) - temp_output_44_0_g582 ) ):( temp_output_1253_32 )));
			float temp_output_25_0_g585 = ( temp_output_25_0_g582 + 0.03 );
			float4 temp_cast_58 = (temp_output_25_0_g585).xxxx;
			float4 temp_output_22_0_g585 = step( GridMask1015 , temp_cast_58 );
			float4 temp_cast_59 = (temp_output_25_0_g582).xxxx;
			float4 temp_output_44_0_g585 = temp_output_22_0_g582;
			float4 temp_output_1244_32 = ( temp_output_22_0_g585 - temp_output_44_0_g585 );
			float4 temp_cast_60 = (temp_output_25_0_g585).xxxx;
			float4 lerpResult861 = lerp( _prop_color_bonus_c2 , _prop_color_bonus_c , (( _prop_color_bonus_cGradient )?( ( ( temp_output_22_0_g585 * GridGradient985 ) - temp_output_44_0_g585 ) ):( temp_output_1244_32 )));
			float4 Prop1045 = ( ( lerpResult858 * temp_output_1247_32 ) + ( lerpResult859 * temp_output_1259_32 ) + ( lerpResult864 * temp_output_1255_32 ) + ( lerpResult860 * temp_output_1253_32 ) + ( lerpResult861 * temp_output_1244_32 ) );
			float temp_output_25_0_g556 = 0.01;
			float4 temp_cast_61 = (temp_output_25_0_g556).xxxx;
			float4 temp_output_22_0_g556 = step( GridMask1015 , temp_cast_61 );
			float4 temp_output_44_0_g556 = float4( 0,0,0,0 );
			float4 temp_output_1261_32 = ( temp_output_22_0_g556 - temp_output_44_0_g556 );
			float4 temp_cast_62 = (temp_output_25_0_g556).xxxx;
			float4 lerpResult956 = lerp( _car_color_primary2 , _car_color_primary , (( _car_color_primaryGradient )?( ( ( temp_output_22_0_g556 * GridGradient985 ) - temp_output_44_0_g556 ) ):( temp_output_1261_32 )));
			float temp_output_25_0_g560 = 0.02;
			float4 temp_cast_63 = (temp_output_25_0_g560).xxxx;
			float4 temp_output_22_0_g560 = step( GridMask1015 , temp_cast_63 );
			float4 temp_cast_64 = (temp_output_25_0_g556).xxxx;
			float4 temp_output_44_0_g560 = temp_output_22_0_g556;
			float4 temp_output_1252_32 = ( temp_output_22_0_g560 - temp_output_44_0_g560 );
			float4 temp_cast_65 = (temp_output_25_0_g560).xxxx;
			float4 lerpResult955 = lerp( _car_color_secondary2 , _car_color_secondary , (( _car_color_secondaryGradient )?( ( ( temp_output_22_0_g560 * GridGradient985 ) - temp_output_44_0_g560 ) ):( temp_output_1252_32 )));
			float temp_output_25_0_g563 = 0.04;
			float4 temp_cast_66 = (temp_output_25_0_g563).xxxx;
			float4 temp_output_22_0_g563 = step( GridMask1015 , temp_cast_66 );
			float4 temp_cast_67 = (temp_output_25_0_g560).xxxx;
			float4 temp_output_44_0_g563 = temp_output_22_0_g560;
			float4 temp_output_1249_32 = ( temp_output_22_0_g563 - temp_output_44_0_g563 );
			float4 temp_cast_68 = (temp_output_25_0_g563).xxxx;
			float4 lerpResult954 = lerp( _car_headlight_a2 , _car_headlight_a , (( _car_headlight_aGradient )?( ( ( temp_output_22_0_g563 * GridGradient985 ) - temp_output_44_0_g563 ) ):( temp_output_1249_32 )));
			float temp_output_25_0_g575 = ( temp_output_25_0_g563 + 0.03 );
			float4 temp_cast_69 = (temp_output_25_0_g575).xxxx;
			float4 temp_output_22_0_g575 = step( GridMask1015 , temp_cast_69 );
			float4 temp_cast_70 = (temp_output_25_0_g563).xxxx;
			float4 temp_output_44_0_g575 = temp_output_22_0_g563;
			float4 temp_output_1248_32 = ( temp_output_22_0_g575 - temp_output_44_0_g575 );
			float4 temp_cast_71 = (temp_output_25_0_g575).xxxx;
			float4 lerpResult961 = lerp( _car_headlight_b2 , _car_headlight_b , (( _car_headlight_bGradient )?( ( ( temp_output_22_0_g575 * GridGradient985 ) - temp_output_44_0_g575 ) ):( temp_output_1248_32 )));
			float temp_output_25_0_g577 = ( temp_output_25_0_g575 + 0.03 );
			float4 temp_cast_72 = (temp_output_25_0_g577).xxxx;
			float4 temp_output_22_0_g577 = step( GridMask1015 , temp_cast_72 );
			float4 temp_cast_73 = (temp_output_25_0_g575).xxxx;
			float4 temp_output_44_0_g577 = temp_output_22_0_g575;
			float4 temp_output_1260_32 = ( temp_output_22_0_g577 - temp_output_44_0_g577 );
			float4 temp_cast_74 = (temp_output_25_0_g577).xxxx;
			float4 lerpResult962 = lerp( _car_window_a2 , _car_window_a , (( _car_window_aGradient )?( ( ( temp_output_22_0_g577 * GridGradient985 ) - temp_output_44_0_g577 ) ):( temp_output_1260_32 )));
			float temp_output_25_0_g580 = 0.12;
			float4 temp_cast_75 = (temp_output_25_0_g580).xxxx;
			float4 temp_output_22_0_g580 = step( GridMask1015 , temp_cast_75 );
			float4 temp_cast_76 = (temp_output_25_0_g577).xxxx;
			float4 temp_output_44_0_g580 = temp_output_22_0_g577;
			float4 temp_output_1257_32 = ( temp_output_22_0_g580 - temp_output_44_0_g580 );
			float4 temp_cast_77 = (temp_output_25_0_g580).xxxx;
			float4 lerpResult969 = lerp( _car_wheel_cover_a1 , _car_wheel_cover_a , (( _car_wheel_cover_aGradient )?( ( ( temp_output_22_0_g580 * GridGradient985 ) - temp_output_44_0_g580 ) ):( temp_output_1257_32 )));
			float temp_output_25_0_g583 = 0.2;
			float4 temp_cast_78 = (temp_output_25_0_g583).xxxx;
			float4 temp_output_22_0_g583 = step( GridMask1015 , temp_cast_78 );
			float4 temp_cast_79 = (temp_output_25_0_g580).xxxx;
			float4 temp_output_44_0_g583 = temp_output_22_0_g580;
			float4 temp_output_1254_32 = ( temp_output_22_0_g583 - temp_output_44_0_g583 );
			float4 temp_cast_80 = (temp_output_25_0_g583).xxxx;
			float4 lerpResult975 = lerp( _car_wheel_a2 , _car_wheel_a , (( _car_wheel_aGradient )?( ( ( temp_output_22_0_g583 * GridGradient985 ) - temp_output_44_0_g583 ) ):( temp_output_1254_32 )));
			float temp_output_25_0_g584 = ( temp_output_25_0_g583 + 0.03 );
			float4 temp_cast_81 = (temp_output_25_0_g584).xxxx;
			float4 temp_output_22_0_g584 = step( GridMask1015 , temp_cast_81 );
			float4 temp_cast_82 = (temp_output_25_0_g583).xxxx;
			float4 temp_output_44_0_g584 = temp_output_22_0_g583;
			float4 temp_output_1262_32 = ( temp_output_22_0_g584 - temp_output_44_0_g584 );
			float4 temp_cast_83 = (temp_output_25_0_g584).xxxx;
			float4 lerpResult981 = lerp( _car_wheel_b2 , _car_wheel_b , (( _car_wheel_bGradient )?( ( ( temp_output_22_0_g584 * GridGradient985 ) - temp_output_44_0_g584 ) ):( temp_output_1262_32 )));
			float4 Car1047 = ( ( lerpResult956 * temp_output_1261_32 ) + ( lerpResult955 * temp_output_1252_32 ) + ( lerpResult954 * temp_output_1249_32 ) + ( lerpResult961 * temp_output_1248_32 ) + ( lerpResult962 * temp_output_1260_32 ) + ( lerpResult969 * temp_output_1257_32 ) + ( lerpResult975 * temp_output_1254_32 ) + ( lerpResult981 * temp_output_1262_32 ) );
			float3 ase_worldNormal = i.worldNormal;
			float3 hsvTorgb1299 = RGBToHSV( tex2D( _matcap_a, ( ( mul( UNITY_MATRIX_V, float4( ase_worldNormal , 0.0 ) ).xyz * 0.5 ) + 0.5 ).xy ).rgb );
			float3 hsvTorgb1305 = HSVToRGB( float3(( hsvTorgb1299.x + _matcap_hue ),( hsvTorgb1299.y * _matcap_saturation ),( hsvTorgb1299.z + _matcap_value )) );
			float3 Matcap1308 = hsvTorgb1305;
			#if defined(_WORKFLOW_BUILDING)
				float4 staticSwitch823 = ( ( bld_add11051 + bld_add21052 ) - float4( 0,0,0,0 ) );
			#elif defined(_WORKFLOW_PROP)
				float4 staticSwitch823 = Prop1045;
			#elif defined(_WORKFLOW_CAR)
				float4 staticSwitch823 = Car1047;
			#elif defined(_WORKFLOW_MATCAP)
				float4 staticSwitch823 = float4( Matcap1308 , 0.0 );
			#else
				float4 staticSwitch823 = ( ( bld_add11051 + bld_add21052 ) - float4( 0,0,0,0 ) );
			#endif
			float3 hsvTorgb8_g586 = RGBToHSV( staticSwitch823.rgb );
			float3 hsvTorgb3_g586 = HSVToRGB( float3(( hsvTorgb8_g586.x + _Hue1 ),( hsvTorgb8_g586.y * _Saturation1 ),( hsvTorgb8_g586.z + _Value1 )) );
			float3 temp_output_813_0 = hsvTorgb3_g586;
			#if defined(_WORKFLOW_BUILDING)
				float3 staticSwitch1050 = ( temp_output_813_0 + float3( 0,0,0 ) );
			#elif defined(_WORKFLOW_PROP)
				float3 staticSwitch1050 = temp_output_813_0;
			#elif defined(_WORKFLOW_CAR)
				float3 staticSwitch1050 = temp_output_813_0;
			#elif defined(_WORKFLOW_MATCAP)
				float3 staticSwitch1050 = float3( 0,0,0 );
			#else
				float3 staticSwitch1050 = ( temp_output_813_0 + float3( 0,0,0 ) );
			#endif
			float3 ase_worldPos = i.worldPos;
			float clampResult6_g587 = clamp( ( ase_worldPos.y / _wsg_GradientHeight ) , 0.0 , 1.0 );
			float4 lerpResult3_g587 = lerp( _wsg_BottomColor , _wsg_TopColor , clampResult6_g587);
			float4 temp_cast_91 = (_wsg_gradientPower).xxxx;
			float4 temp_cast_92 = (0.0).xxxx;
			float4 temp_cast_93 = (1.0).xxxx;
			float4 clampResult8_g587 = clamp( ( float4( staticSwitch1050 , 0.0 ) * pow( lerpResult3_g587 , temp_cast_91 ) ) , temp_cast_92 , temp_cast_93 );
			#ifdef _ENABLEWORLDSPACEGRADIENT__WSG_OFF
				float4 staticSwitch814 = float4( staticSwitch1050 , 0.0 );
			#else
				float4 staticSwitch814 = clampResult8_g587;
			#endif
			#if defined(_WORKFLOW_BUILDING)
				float4 staticSwitch1312 = staticSwitch814;
			#elif defined(_WORKFLOW_PROP)
				float4 staticSwitch1312 = staticSwitch814;
			#elif defined(_WORKFLOW_CAR)
				float4 staticSwitch1312 = staticSwitch814;
			#elif defined(_WORKFLOW_MATCAP)
				float4 staticSwitch1312 = staticSwitch823;
			#else
				float4 staticSwitch1312 = staticSwitch814;
			#endif
			o.Albedo = staticSwitch1312.rgb;
			#ifdef _ENABLEEMISSION__EMS_OFF
				float4 staticSwitch921 = float4( 0,0,0,0 );
			#else
				float4 staticSwitch921 = ( (( _ems_prop_color_3_enable )?( ( _ems_prop_color_3 * temp_output_1265_32 ) ):( float4( 0,0,0,0 ) )) + (( _ems_prop_color_2_enable )?( ( _ems_prop_color_2 * temp_output_1271_32 ) ):( float4( 0,0,0,0 ) )) + (( _ems_prop_color_1_enable )?( ( _ems_prop_color_1 * temp_output_1272_32 ) ):( float4( 0,0,0,0 ) )) + (( _ems_window_color_enable )?( ( _ems_window_color * temp_output_1263_32 ) ):( float4( 0,0,0,0 ) )) + (( _ems_prop_color_4_enable )?( ( _ems_prop_color_4 * temp_output_1264_32 ) ):( float4( 0,0,0,0 ) )) );
			#endif
			o.Emission = staticSwitch921.rgb;
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
				float2 customPack1 : TEXCOORD1;
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
Version=18703
312;164;1703;843;-6475.347;8613.892;4.816507;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;705;6723.005,-9526.719;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;703;6701.806,-9253.856;Inherit;True;Constant;_Float24;Float 24;20;0;Create;True;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;706;7042.37,-9294.181;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;342;6931.668,-8854.282;Inherit;True;Property;_GridMask;GridMask;118;1;[HideInInspector];Create;True;0;0;False;0;False;-1;51ab3d1e0045c41439dcd7474d2aee4b;51ab3d1e0045c41439dcd7474d2aee4b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FractNode;704;7318.934,-9301.063;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;985;7483.883,-9321.908;Inherit;True;GridGradient;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1015;7302.193,-8842.02;Inherit;False;GridMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;999;8163.679,-8423.158;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1016;8182.118,-8637.64;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;345;8223.182,-8105.717;Float;False;Constant;_Startclipvalue;Start clip value;8;0;Create;True;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1272;8423,-8442;Inherit;True;MaskingFunction;-1;;538;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1000;8231.356,-7757.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;578;8256.843,-7673.199;Float;False;Constant;_Float15;Float 15;8;0;Create;True;0;0;False;0;False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1017;8228.766,-7849.837;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1001;8230.356,-7128.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1271;8448,-7808;Inherit;True;MaskingFunction;-1;;539;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1018;8234.406,-7215.866;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;558;8235.023,-7042.315;Float;False;Constant;_Float14;Float 14;8;0;Create;True;0;0;False;0;False;0.04;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1002;8219.356,-6509.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1019;8224.623,-6611.091;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1265;8435,-7169;Inherit;True;MaskingFunction;-1;;540;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.FunctionNode;1264;8448,-6528;Inherit;True;MaskingFunction;-1;;541;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1003;8238.146,-5801.036;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1020;8238.832,-5896.097;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1021;8234.842,-5301.374;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1004;8231.813,-5207.711;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;559;8246.508,-5123.381;Float;False;Constant;_Float13;Float 13;8;0;Create;True;0;0;False;0;False;0.12;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1263;8444.964,-5870.03;Inherit;True;MaskingFunction;-1;;542;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;579;8201.24,-4471.465;Float;False;Constant;_Float16;Float 16;8;0;Create;True;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1022;8199.291,-4643.603;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1268;8448,-5248;Inherit;True;MaskingFunction;-1;;543;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1005;8193.356,-4561.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1023;8216.58,-4008.259;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1006;8218.356,-3923.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1245;8448,-4608;Inherit;True;MaskingFunction;-1;;544;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1007;8211.356,-3269.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;580;8220.661,-3180.011;Float;False;Constant;_Float17;Float 17;8;0;Create;True;0;0;False;0;False;0.29;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1024;8217.58,-3352.259;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1270;8448,-3968;Inherit;True;MaskingFunction;-1;;545;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.FunctionNode;1269;8448,-3328;Inherit;True;MaskingFunction;-1;;546;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;583;8234.863,-2566.501;Float;False;Constant;_Float18;Float 18;8;0;Create;True;0;0;False;0;False;0.35;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1008;8212.356,-2660.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1025;8215.675,-2756.157;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1009;8194.356,-1986.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1026;8204.401,-2077.233;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;925;7820.53,-18890.87;Float;False;Constant;_Float4;Float 4;8;0;Create;True;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;585;8216.396,-1901.5;Float;False;Constant;_Float19;Float 19;8;0;Create;True;0;0;False;0;False;0.47;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1044;7803.958,-19060.46;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1266;8448,-2688;Inherit;True;MaskingFunction;-1;;547;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;998;7806.864,-18972.43;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1010;8169.356,-1424.693;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1261;8014.971,-19005.82;Inherit;True;MaskingFunction;-1;;556;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;928;7830.192,-18220.35;Float;False;Constant;_Float5;Float 5;8;0;Create;True;0;0;False;0;False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1043;7817.793,-18415.72;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;997;7808.037,-18308.6;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1027;8188.995,-1528.037;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;587;8221.022,-1267.537;Float;False;Constant;_Float20;Float 20;8;0;Create;True;0;0;False;0;False;0.56;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1267;8448,-2048;Inherit;True;MaskingFunction;-1;;557;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;996;7781.402,-17657.75;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1028;8242.926,-815.6255;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;931;7799.372,-17564.46;Float;False;Constant;_Float7;Float 7;8;0;Create;True;0;0;False;0;False;0.04;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1251;8464,-1408;Inherit;True;MaskingFunction;-1;;561;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1042;7802.793,-17755.72;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1011;8227.356,-729.6934;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;589;8248.935,-647.9572;Float;False;Constant;_Float21;Float 21;8;0;Create;True;0;0;False;0;False;0.73;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1252;8014.971,-18365.81;Inherit;True;MaskingFunction;-1;;560;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;875;8281.482,-12580.55;Float;False;Constant;_Float0;Float 0;8;0;Create;True;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;990;8260.094,-12657.08;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;995;7803.431,-16961.54;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1250;8464,-768;Inherit;True;MaskingFunction;-1;;564;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1036;8265.999,-12749.87;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;8234.356,-62.69336;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1249;8014.971,-17725.82;Inherit;True;MaskingFunction;-1;;563;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1029;8236.924,-147.5732;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1041;7819.793,-17049.72;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1035;8252.999,-12078.87;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1248;8031.971,-17043.81;Inherit;True;MaskingFunction;-1;;575;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;593;8224.874,626.527;Float;False;Constant;_Float22;Float 22;8;0;Create;True;0;0;False;0;False;0.91;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;989;8260.104,-11985.21;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1247;8469.925,-12683.5;Inherit;True;MaskingFunction;-1;;574;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;994;7781.001,-16393.7;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1040;7796.793,-16477.72;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;876;8274.145,-11889.04;Float;False;Constant;_Float2;Float 2;8;0;Create;True;0;0;False;0;False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1246;8448,-128;Inherit;True;MaskingFunction;-1;;573;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1030;8222.015,455.5645;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1013;8214.356,545.3066;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;877;8305.324,-11289.15;Float;False;Constant;_Float3;Float 3;8;0;Create;True;0;0;False;0;False;0.04;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;988;8270.482,-11368.16;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1034;8282.999,-11460.87;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;594;8234.22,1271.404;Float;False;Constant;_Float23;Float 23;8;0;Create;True;0;0;False;0;False;1.03;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1259;8469.925,-12043.5;Inherit;True;MaskingFunction;-1;;578;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.WorldNormalVector;1291;9486.312,3813.915;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;993;7840.165,-15723.58;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1039;7848.502,-15814.75;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1258;8448,512;Inherit;True;MaskingFunction;-1;;576;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.ViewMatrixNode;1290;9625.499,3625.781;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1031;8216.646,1086.073;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1014;8221.356,1183.307;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;984;7863.331,-15632.77;Float;False;Constant;_Float1;Float 1;8;0;Create;True;0;0;False;0;False;0.12;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1260;8014.971,-16445.82;Inherit;True;MaskingFunction;-1;;577;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;1033;8273.366,-10801.68;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1292;9807.226,4042.942;Float;False;Constant;_Float8;Float 8;0;0;Create;True;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1255;8477.925,-11410.5;Inherit;True;MaskingFunction;-1;;581;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;992;7901.564,-14841.29;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1038;7915.731,-14936;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;987;8252.692,-10716.51;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1257;8072.875,-15739.54;Inherit;True;MaskingFunction;-1;;580;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.RangedFloatNode;983;7916.623,-14759.29;Float;False;Constant;_Float6;Float 6;8;0;Create;True;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1256;8448,1152;Inherit;True;MaskingFunction;-1;;579;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1293;9744.042,3653.567;Inherit;True;2;2;0;FLOAT4x4;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;631;8835.683,-2877.544;Inherit;False;Property;_bld_bottom_secondary_a;bld_bottom_secondary_a;71;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;634;8832,-1793.362;Inherit;False;Property;_bld_bottom_roofing_b2;bld_bottom_roofing_b2;78;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;652;8833.362,-3264;Inherit;False;Property;_bld_bottom_primaryGradient;bld_bottom_primary Gradient;67;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;648;8832,-5824;Inherit;False;Property;_bld_windowGradient;bld_window Gradient ;55;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;609;8832,-6272;Inherit;False;Property;_bld_window2;bld_window2;57;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;629;8832,-3520;Inherit;False;Property;_bld_bottom_primary;bld_bottom_primary;68;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;656;8834,-711.8764;Inherit;False;Property;_bld_bonus_color_aGradient;bld_bonus_color_a Gradient;79;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;653;8832,-2640;Inherit;False;Property;_bld_bottom_secondary_aGradient;bld_bottom_secondary_a Gradient;70;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;604;8832,-6912;Inherit;False;Property;_bld_roof_secondary2;bld_roof_secondary2;54;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;639;8831,-321;Inherit;False;Property;_bld_bonus_color_b;bld_bonus_color_b;83;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;611;8832,-5632;Inherit;False;Property;_bld_window_frame2;bld_window_frame2;60;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;647;8834.838,-6461.163;Inherit;False;Property;_bld_roof_secondaryGradient;bld_roof_secondary Gradient;52;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;635;8828,-1601;Inherit;False;Property;_bld_bottom_roofing_b;bld_bottom_roofing_b;77;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;626;8832,-4352;Inherit;False;Property;_bld_decor2;bld_decor2;66;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;624;8832,-4992;Inherit;False;Property;_bld_window_rail2;bld_window_rail2;63;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;596;8830.638,-8830.992;Inherit;False;Property;_bld_color_primary2;bld_color_primary2;45;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;597;8836,-8639;Inherit;False;Property;_bld_color_primary;bld_color_primary;44;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;603;8832,-7328;Inherit;False;Property;_bld_roof_primary;bld_roof_primary;50;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;625;8832,-4800;Inherit;False;Property;_bld_window_rail;bld_window_rail;62;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;612;8833.362,-5441.362;Inherit;False;Property;_bld_window_frame;bld_window_frame;59;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;632;8832,-2433.364;Inherit;False;Property;_bld_bottom_roofing_a2;bld_bottom_roofing_a2;75;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;599;8832,-8160;Inherit;False;Property;_bld_color_secondary2;bld_color_secondary2;48;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;636;8833.364,-1152;Inherit;False;Property;_bld_bonus_color_a2;bld_bonus_color_a2;81;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;630;8832,-3072;Inherit;False;Property;_bld_bottom_secondary_a2;bld_bottom_secondary_a2;72;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;600;8832,-7968;Inherit;False;Property;_bld_color_secondary;bld_color_secondary;47;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;649;8832,-5200;Inherit;False;Property;_bld_window_frameGradient;bld_window_frame Gradient;58;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;610;8832,-6080;Inherit;False;Property;_bld_window;bld_window;56;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;645;8839.745,-7728.512;Inherit;False;Property;_bld_color_secondaryGradient;bld_color_secondary Gradient;46;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;605;8833,-6718.903;Inherit;False;Property;_bld_roof_secondary;bld_roof_secondary;53;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;659;8832,1198.7;Inherit;False;Property;_bld_bonus_color_dGradient;bld_bonus_color_d Gradient;88;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;644;8842.405,-8384.362;Inherit;False;Property;_bld_color_primaryGradient;bld_color_primary Gradient;43;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1294;9968.295,3673.013;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;641;8832,321.3641;Inherit;False;Property;_bld_bonus_color_c;bld_bonus_color_c;86;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;602;8832,-7534.638;Inherit;False;Property;_bld_roof_primary2;bld_roof_primary2;51;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1037;7997.798,-14223.88;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1253;8469.925,-10763.5;Inherit;True;MaskingFunction;-1;;582;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.ColorNode;638;8832,-512;Inherit;False;Property;_bld_bonus_color_b2;bld_bonus_color_b2;84;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;637;8832,-960;Inherit;False;Property;_bld_bonus_color_a;bld_bonus_color_a;80;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;633;8831,-2240;Inherit;False;Property;_bld_bottom_roofing_a;bld_bottom_roofing_a;74;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;646;8844.113,-7137.287;Inherit;False;Property;_bld_roof_primaryGradient;bld_roof_primary Gradient;49;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;628;8833,-3712;Inherit;False;Property;_bld_bottom_primary2;bld_bottom_primary2;69;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;991;7978.877,-14138.84;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;651;8832,-3920;Inherit;False;Property;_bld_decorGradient;bld_decor Gradient;64;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;640;8832,127;Inherit;False;Property;_bld_bonus_color_c2;bld_bonus_color_c2;87;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;658;8832,561.7432;Inherit;False;Property;_bld_bonus_color_cGradient;bld_bonus_color_c Gradient;85;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;627;8832,-4160;Inherit;False;Property;_bld_decor;bld_decor;65;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;642;8833.362,768;Inherit;False;Property;_bld_bonus_color_d2;bld_bonus_color_d2;90;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;657;8832,-94.8764;Inherit;False;Property;_bld_bonus_color_bGradient;bld_bonus_color_b Gradient;82;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;643;8833.362,961.3621;Inherit;False;Property;_bld_bonus_color_d;bld_bonus_color_d;89;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;655;8838,-1387;Inherit;False;Property;_bld_bottom_roofing_bGradient;bld_bottom_roofing_b Gradient;76;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1254;8121.305,-14870.35;Inherit;True;MaskingFunction;-1;;583;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.GetLocalVarNode;986;8258.698,-10147.93;Inherit;False;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1032;8279.366,-10194.68;Inherit;False;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;654;8832,-2000;Inherit;False;Property;_bld_bottom_roofing_aGradient;bld_bottom_roofing_a Gradient;73;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;650;8834,-4574.527;Inherit;False;Property;_bld_window_railGradient;bld_window_rail Gradient;61;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;618;9216,-2048;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;619;9216,-1408;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;613;9213.956,-5248;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;615;9216,-3968;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;616;9216,-3328;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;623;9216,1152;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1295;10190.6,3729.09;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;601;9216,-7168;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;620;9216,-768;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;595;9175.836,-8484.418;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1262;8179.209,-14164.07;Inherit;True;MaskingFunction;-1;;584;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.LerpOp;606;9216,-6528;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;617;9216,-2688;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;614;9216,-4608;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;622;9216,512;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;608;9216,-5888;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;598;9205.699,-7817.473;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;621;9216,-128;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1244;8479.925,-10166.5;Inherit;True;MaskingFunction;-1;;585;571aab6f8c08f1c4d9bd4012d2958d88;0;5;21;COLOR;0,0,0,0;False;30;FLOAT;0;False;25;FLOAT;0;False;44;COLOR;0,0,0,0;False;42;FLOAT;0;False;4;COLOR;0;COLOR;32;COLOR;47;FLOAT;28
Node;AmplifyShaderEditor.ColorNode;951;8398.971,-17468.78;Inherit;False;Property;_car_headlight_b2;car_headlight_b2;15;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;838;8854.925,-10955.5;Inherit;False;Property;_prop_color_bonus_b;prop_color_bonus_b;38;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;689;9507.26,-7006.269;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;695;9472,-3328;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;833;8853.925,-12203.5;Inherit;False;Property;_prop_color_secondary;prop_color_secondary;32;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;683;9472,-8448;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;836;8853.925,-11563.5;Inherit;False;Property;_prop_color_bonus_a;prop_color_bonus_a;35;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;940;8398.971,-19389.82;Inherit;False;Property;_car_color_primary2;car_color_primary2;6;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0.01850022,0.03954625,0.1169707,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;692;9472,-5248;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;980;8564.245,-14356.07;Inherit;False;Property;_car_wheel_b;car_wheel_b;26;0;Create;True;0;0;False;0;False;1,1,1,0;0.3098039,0.2823529,0.2745098,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;698;9472,-1408;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;944;8435.313,-18964.4;Inherit;False;Property;_car_color_primaryGradient;car_color_primary Gradient;2;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;702;9472,1152;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;696;9480,-2687;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;978;8607.376,-14095.04;Inherit;False;Property;_car_wheel_bGradient;car_wheel_b Gradient;25;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;943;8398.971,-19197.82;Inherit;False;Property;_car_color_primary;car_color_primary;4;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;0.1301365,0.1980693,0.4735315,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;949;8400.971,-16829.81;Inherit;False;Property;_car_window_a2;car_window_a2;18;0;Create;True;0;0;False;0;False;0,0,0,0;0.3882353,0.4745098,0.5254902,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;950;8400.008,-16637.81;Inherit;False;Property;_car_window_a;car_window_a;17;0;Create;True;0;0;False;0;False;1,1,1,0;0.8000001,0.8588236,0.8980393,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;700;9472,-128;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;844;8853.925,-11771.5;Inherit;False;Property;_prop_color_bonus_a2;prop_color_bonus_a2;36;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;701;9472,512;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;967;8456.876,-16123.54;Inherit;False;Property;_car_wheel_cover_a1;car_wheel_cover_a1;21;0;Create;True;0;0;False;0;False;0,0,0,0;0.3882353,0.3882353,0.3882353,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;851;8853.925,-12395.5;Inherit;False;Property;_prop_color_secondary2;prop_color_secondary2;33;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;946;8399.971,-18093.82;Inherit;False;Property;_car_headlight_a2;car_headlight_a2;12;0;Create;True;0;0;False;0;False;0,0,0,0;0.2470588,0.1490196,0.06666665,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;900;8903.418,-11334.62;Inherit;False;Property;_prop_color_bonus_aGradient;prop_color_bonus_a Gradient;34;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;699;9472,-768;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;694;9472,-3968;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;684;9472,-7808;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;845;8853.925,-11146.46;Inherit;False;Property;_prop_color_bonus_b2;prop_color_bonus_b2;39;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;941;8398.971,-18717.81;Inherit;False;Property;_car_color_secondary2;car_color_secondary2;9;0;Create;True;0;0;False;0;False;0,0,0,0;0.2627451,0.2941176,0.3411765,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;697;9472,-2043.164;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;947;8398.971,-18525.81;Inherit;False;Property;_car_color_secondary;car_color_secondary;8;0;Create;True;0;0;False;0;False;1,1,1,0;0.5843138,0.654902,0.7607843,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;901;8883.436,-10683;Inherit;False;Property;_prop_color_bonus_bGradient;prop_color_bonus_b Gradient;37;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;972;8549.471,-14799.32;Inherit;False;Property;_car_wheel_aGradient;car_wheel_a Gradient;22;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;939;8448.139,-16355.79;Inherit;False;Property;_car_window_aGradient;car_window_a Gradient;16;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;942;8397.971,-17885.82;Inherit;False;Property;_car_headlight_a;car_headlight_a;11;0;Create;True;0;0;False;0;False;1,1,1,0;0.8509805,0.5568628,0.3137255,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;898;8912.356,-11971.94;Inherit;False;Property;_prop_color_secondaryGradient;prop_color_secondary Gradient;31;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;690;9472,-6528;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;953;8457.402,-18294.25;Inherit;False;Property;_car_color_secondaryGradient;car_color_secondary Gradient;7;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;979;8563.208,-14548.07;Inherit;False;Property;_car_wheel_b2;car_wheel_b2;27;0;Create;True;0;0;False;0;False;0,0,0,0;0.227451,0.1960784,0.1882353,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;854;8853.925,-10507.5;Inherit;False;Property;_prop_color_bonus_c2;prop_color_bonus_c2;42;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;855;8853.925,-13067.5;Inherit;False;Property;_prop_color_primary2;prop_color_primary2;30;1;[HDR];Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;968;8457.913,-15931.54;Inherit;False;Property;_car_wheel_cover_a;car_wheel_cover_a;20;0;Create;True;0;0;False;0;False;1,1,1,0;0.5098039,0.5098039,0.5098039,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;899;8882.266,-12614.08;Inherit;False;Property;_prop_color_primaryGradient;prop_color_primary Gradient;28;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;691;9472,-5888;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;952;8435.465,-17651.94;Inherit;False;Property;_car_headlight_aGradient;car_headlight_a Gradient;10;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;693;9472,-4608;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1296;10428.89,3750.662;Inherit;True;Property;_matcap_a;matcap_a;106;1;[NoScaleOffset];Create;True;0;0;False;0;False;-1;b23676ff9cac20a4c9c7b9333f055f1b;b23676ff9cac20a4c9c7b9333f055f1b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;1,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;902;8898.092,-10052.47;Inherit;False;Property;_prop_color_bonus_cGradient;prop_color_bonus_c Gradient;40;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;945;8399.971,-17277.81;Inherit;False;Property;_car_headlight_b;car_headlight_b;14;0;Create;True;0;0;False;0;False;1,1,1,0;0.8000001,0.7764707,0.7764707,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;948;8428.482,-17006.31;Inherit;False;Property;_car_headlight_bGradient;car_headlight_b Gradient;13;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;974;8506.34,-15062.34;Inherit;False;Property;_car_wheel_a;car_wheel_a;23;0;Create;True;0;0;False;0;False;1,1,1,0;0.2980392,0.2549019,0.2470588,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;839;8853.925,-12875.5;Inherit;False;Property;_prop_color_primary;prop_color_primary;29;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;973;8506.303,-15254.34;Inherit;False;Property;_car_wheel_a2;car_wheel_a2;24;0;Create;True;0;0;False;0;False;0,0,0,0;0.1372549,0.117647,0.1137255,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;966;8501.044,-15668.51;Inherit;False;Property;_car_wheel_cover_aGradient;car_wheel_cover_a Gradient;19;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;837;8854.961,-10315.5;Inherit;False;Property;_prop_color_bonus_c;prop_color_bonus_c;41;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;955;8782.971,-18365.81;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;961;8782.971,-17085.81;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;956;8781.971,-19006.82;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;859;9237.925,-12043.5;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;864;9237.925,-11403.5;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1298;10818.26,3806.909;Inherit;False;Property;_matcap_value;matcap_value;5;0;Create;True;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1300;10688.65,3364.011;Inherit;False;Property;_matcap_saturation;matcap_saturation;3;0;Create;True;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;975;8889.303,-14870.35;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;860;9237.925,-10763.5;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RGBToHSVNode;1299;10807.72,3449.669;Inherit;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;981;8947.208,-14164.07;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;969;8840.876,-15739.54;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;858;9236.925,-12684.5;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;681;9934.808,-5841.189;Inherit;True;8;8;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;962;8773.916,-16450.35;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;954;8782.971,-17725.82;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;923;10019.1,-1828.051;Inherit;True;8;8;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;861;9237.925,-10123.5;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1297;10706.73,3224.768;Inherit;False;Property;_matcap_hue;matcap_hue;1;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1302;11115.57,3557.339;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;982;9203.206,-14164.07;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1303;11098.6,3222.812;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;964;9029.87,-16456.22;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;976;9145.301,-14870.35;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1301;11124.87,3403.451;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;970;9083.874,-15741.54;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;963;9070.544,-17086.76;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;865;9493.922,-11403.5;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1051;10188.82,-5830.19;Inherit;False;bld_add1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;957;9038.969,-17725.82;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1052;10254.94,-1824.502;Inherit;False;bld_add2;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;872;9493.922,-10123.5;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;866;9493.922,-10763.5;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;958;9038.969,-19005.82;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;868;9493.922,-12683.5;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;867;9493.922,-12043.5;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;959;9038.969,-18365.81;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;960;9716.766,-17229.62;Inherit;True;8;8;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1053;10862.12,-6680.839;Inherit;False;1051;bld_add1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.HSVToRGBNode;1305;11405.71,3531.939;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;880;10171.72,-10907.3;Inherit;True;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1054;10883.11,-6573.408;Inherit;False;1052;bld_add2;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1045;10441.76,-10876.47;Inherit;False;Prop;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1047;9983.214,-17238.64;Inherit;False;Car;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;678;11155.37,-6678.079;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1308;11718.08,3604.802;Inherit;False;Matcap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1049;11835.93,-6481.475;Inherit;False;1045;Prop;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;782;11529.17,-6557.683;Inherit;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1311;11933.72,-6277.649;Inherit;False;1308;Matcap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1048;11850.93,-6388.475;Inherit;False;1047;Car;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;823;12154.37,-6560.859;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;True;1;;False;0;0;0;True;;KeywordEnum;4;Building;Prop;Car;Matcap;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;813;12524.32,-6716.487;Inherit;True;HSL;101;;586;76fe2299c261bd6498922c4782bfb93d;0;1;9;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;772;12615.48,-8280.42;Float;False;Property;_ems_prop_color_1;ems_prop_color_1;111;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;803;12798.88,-6402.235;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;771;12361.48,-8280.42;Float;False;Property;_ems_window_color;ems_window_color;108;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;773;12871.48,-8280.42;Float;False;Property;_ems_prop_color_2;ems_prop_color_2;113;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;774;13129.48,-8280.42;Float;False;Property;_ems_prop_color_3;ems_prop_color_3;115;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1342;13725.93,-8360.831;Float;False;Property;_ems_prop_color_4;ems_prop_color_3;117;1;[HDR];Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;789;13346.48,-7900.479;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;787;12807.48,-7896.419;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;786;12522.48,-7914.419;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;915;13560.9,-6727.027;Inherit;False;Property;_wsg_gradientPower;wsg_gradientPower;100;0;Create;True;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;913;13548.4,-6635.193;Float;False;Property;_wsg_TopColor;wsg_TopColor;97;0;Create;True;0;0;False;0;False;0.8416696,0.9076058,0.9245283,0;0.8416696,0.9076058,0.9245283,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1341;13942.93,-7980.89;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;914;13560.9,-6246.027;Float;False;Property;_wsg_GradientHeight;wsg_GradientHeight;99;0;Create;True;0;0;False;0;False;6.4;6.4;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;788;13063.48,-7896.419;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1050;13186.98,-6578.651;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;True;1;;False;0;0;0;True;;KeywordEnum;2;Building;Prop;Reference;823;True;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;916;13560.9,-6438.027;Float;False;Property;_wsg_BottomColor;wsg_BottomColor;98;0;Create;True;0;0;False;0;False;0.1698113,0.1465824,0.1465824,0;0.1698112,0.1465823,0.1465823,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;918;13090.92,-7665.881;Inherit;False;Property;_ems_prop_color_1_enable;ems_prop_color_1_enable;109;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;919;13408.95,-7679.06;Inherit;False;Property;_ems_prop_color_2_enable;ems_prop_color_2_enable;112;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;917;12814.12,-7614.041;Inherit;False;Property;_ems_window_color_enable;ems_window_color_enable;107;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1343;14259.4,-7819.528;Inherit;False;Property;_ems_prop_color_4_enable;ems_prop_color_4_enable;116;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;920;13662.95,-7739.117;Inherit;False;Property;_ems_prop_color_3_enable;ems_prop_color_3_enable;114;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;912;14024.03,-6728.081;Inherit;True;WorldSpaceGradient;92;;587;3b5676f57e12b5242875cbc51344d26f;0;5;24;FLOAT;0;False;25;COLOR;0,0,0,0;False;26;COLOR;0,0,0,0;False;27;FLOAT;0;False;15;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;790;13851.18,-7456.153;Inherit;True;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;814;14479.94,-6352.304;Inherit;False;Property;_enableworldspacegradient__wsg;enable world space gradient__wsg;91;0;Create;True;0;0;False;0;False;0;0;0;True;;ToggleOff;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1276;1871.521,-7987.732;Float;False;Constant;_Float9;Float 9;8;0;Create;True;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1274;1812.018,-8305.174;Inherit;True;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1286;2682.195,-7360.809;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1278;2441.965,-8205.766;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1282;1981.762,-7509.074;Inherit;True;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;1277;2209.456,-8443.795;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1279;2179.934,-7835.953;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.03;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1330;6477.815,-10095.21;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;1314;9231.649,-8237.238;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;1313;8533.82,-8819.738;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;1312;14840.47,-6162.629;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;True;1;;False;0;0;0;True;;KeywordEnum;2;Building;Prop;Reference;823;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PosVertexDataNode;1335;6942.885,-10402.33;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1283;1967.28,-6973.036;Float;False;Constant;_Float10;Float 10;8;0;Create;True;0;0;False;0;False;0.02;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1281;1963.323,-7294.592;Inherit;True;985;GridGradient;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1319;7461.178,-10242.34;Inherit;False;Constant;_Color0;Color 0;109;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;921;14097.36,-7447.805;Inherit;False;Property;_enableemission__ems;enable emission__ems;105;0;Create;True;0;0;False;0;False;0;0;0;True;;ToggleOff;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1322;6890.728,-9960.157;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1320;7447.504,-10046.37;Inherit;False;Constant;_Color1;Color 1;109;0;Create;True;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1280;2835.86,-8230.288;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;1289;2513.783,-7090.644;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1332;7916.339,-9459.583;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1325;6831.755,-10223.3;Inherit;True;Constant;_Float25;Float 25;20;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1287;2293.399,-7034.026;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewMatrixNode;1304;9704.481,3537.226;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.GetLocalVarNode;1310;14483.1,-6027.569;Inherit;False;1308;Matcap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;1339;6725.183,-10516.81;Inherit;False;Constant;_Color2;Color 2;109;0;Create;True;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;1324;6586.141,-10338.53;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;1056;7261.893,-8448.53;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1328;6506.822,-9924.417;Inherit;False;Constant;_Float26;Float 26;110;0;Create;True;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1284;2331.239,-6825.372;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.03;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1326;7433.908,-10409.63;Inherit;False;Constant;_Float12;Float 12;109;0;Create;True;0;0;False;0;False;0.18;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1318;7759.878,-9995.592;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1340;6718.454,-10700.67;Inherit;False;Constant;_Color3;Color 3;109;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1331;8046.506,-9767.526;Inherit;True;Property;_1;1;110;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1275;1830.457,-8519.655;Inherit;True;1015;GridMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1334;8169.34,-9322.583;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1336;7158.684,-10576.4;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1329;6501.822,-9814.417;Inherit;False;Constant;_Float27;Float 27;110;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1327;7082.241,-10232.72;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1333;7918.854,-9312.411;Inherit;True;Constant;_Float28;Float 28;20;0;Create;True;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;1285;2360.761,-7433.213;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;1055;7576.893,-8479.53;Inherit;True;5;0;FLOAT2;0,0;False;1;FLOAT2;0.02,0.98;False;2;FLOAT2;0.34,1.41;False;3;FLOAT2;-5.68,-3.27;False;4;FLOAT2;0.95,-11.21;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;15081.93,-6228.77;Float;False;True;-1;2;CustomGradientShaderGUI;0;0;Standard;Lichthund/GradientShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;4;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;1;False;-1;1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;706;0;705;2
WireConnection;706;1;703;0
WireConnection;704;0;706;0
WireConnection;985;0;704;0
WireConnection;1015;0;342;0
WireConnection;1272;21;1016;0
WireConnection;1272;30;999;0
WireConnection;1272;25;345;0
WireConnection;1271;21;1017;0
WireConnection;1271;30;1000;0
WireConnection;1271;25;578;0
WireConnection;1271;44;1272;47
WireConnection;1265;21;1018;0
WireConnection;1265;30;1001;0
WireConnection;1265;25;558;0
WireConnection;1265;44;1271;47
WireConnection;1264;21;1019;0
WireConnection;1264;30;1002;0
WireConnection;1264;25;1265;28
WireConnection;1264;44;1265;47
WireConnection;1263;21;1020;0
WireConnection;1263;30;1003;0
WireConnection;1263;25;1264;28
WireConnection;1263;44;1264;47
WireConnection;1268;21;1021;0
WireConnection;1268;30;1004;0
WireConnection;1268;25;559;0
WireConnection;1268;44;1263;47
WireConnection;1245;21;1022;0
WireConnection;1245;30;1005;0
WireConnection;1245;25;579;0
WireConnection;1245;44;1268;47
WireConnection;1270;21;1023;0
WireConnection;1270;30;1006;0
WireConnection;1270;25;1245;28
WireConnection;1270;44;1245;47
WireConnection;1269;21;1024;0
WireConnection;1269;30;1007;0
WireConnection;1269;25;580;0
WireConnection;1269;44;1270;47
WireConnection;1266;21;1025;0
WireConnection;1266;30;1008;0
WireConnection;1266;25;583;0
WireConnection;1266;44;1269;47
WireConnection;1261;21;1044;0
WireConnection;1261;30;998;0
WireConnection;1261;25;925;0
WireConnection;1267;21;1026;0
WireConnection;1267;30;1009;0
WireConnection;1267;25;585;0
WireConnection;1267;44;1266;47
WireConnection;1251;21;1027;0
WireConnection;1251;30;1010;0
WireConnection;1251;25;587;0
WireConnection;1251;44;1267;47
WireConnection;1252;21;1043;0
WireConnection;1252;30;997;0
WireConnection;1252;25;928;0
WireConnection;1252;44;1261;47
WireConnection;1250;21;1028;0
WireConnection;1250;30;1011;0
WireConnection;1250;25;589;0
WireConnection;1250;44;1251;47
WireConnection;1249;21;1042;0
WireConnection;1249;30;996;0
WireConnection;1249;25;931;0
WireConnection;1249;44;1252;47
WireConnection;1248;21;1041;0
WireConnection;1248;30;995;0
WireConnection;1248;25;1249;28
WireConnection;1248;44;1249;47
WireConnection;1247;21;1036;0
WireConnection;1247;30;990;0
WireConnection;1247;25;875;0
WireConnection;1246;21;1029;0
WireConnection;1246;30;1012;0
WireConnection;1246;25;1250;28
WireConnection;1246;44;1250;47
WireConnection;1259;21;1035;0
WireConnection;1259;30;989;0
WireConnection;1259;25;876;0
WireConnection;1259;44;1247;47
WireConnection;1258;21;1030;0
WireConnection;1258;30;1013;0
WireConnection;1258;25;593;0
WireConnection;1258;44;1246;47
WireConnection;1260;21;1040;0
WireConnection;1260;30;994;0
WireConnection;1260;25;1248;28
WireConnection;1260;44;1248;47
WireConnection;1255;21;1034;0
WireConnection;1255;30;988;0
WireConnection;1255;25;877;0
WireConnection;1255;44;1259;47
WireConnection;1257;21;1039;0
WireConnection;1257;30;993;0
WireConnection;1257;25;984;0
WireConnection;1257;44;1260;47
WireConnection;1256;21;1031;0
WireConnection;1256;30;1014;0
WireConnection;1256;25;594;0
WireConnection;1256;44;1258;47
WireConnection;1293;0;1290;0
WireConnection;1293;1;1291;0
WireConnection;652;0;1269;32
WireConnection;652;1;1269;0
WireConnection;648;0;1263;32
WireConnection;648;1;1263;0
WireConnection;656;0;1250;32
WireConnection;656;1;1250;0
WireConnection;653;0;1266;32
WireConnection;653;1;1266;0
WireConnection;647;0;1264;32
WireConnection;647;1;1264;0
WireConnection;649;0;1268;32
WireConnection;649;1;1268;0
WireConnection;645;0;1271;32
WireConnection;645;1;1271;0
WireConnection;659;0;1256;32
WireConnection;659;1;1256;0
WireConnection;644;0;1272;32
WireConnection;644;1;1272;0
WireConnection;1294;0;1293;0
WireConnection;1294;1;1292;0
WireConnection;1253;21;1033;0
WireConnection;1253;30;987;0
WireConnection;1253;25;1255;28
WireConnection;1253;44;1255;47
WireConnection;646;0;1265;32
WireConnection;646;1;1265;0
WireConnection;651;0;1270;32
WireConnection;651;1;1270;0
WireConnection;658;0;1258;32
WireConnection;658;1;1258;0
WireConnection;657;0;1246;32
WireConnection;657;1;1246;0
WireConnection;655;0;1251;32
WireConnection;655;1;1251;0
WireConnection;1254;21;1038;0
WireConnection;1254;30;992;0
WireConnection;1254;25;983;0
WireConnection;1254;44;1257;47
WireConnection;654;0;1267;32
WireConnection;654;1;1267;0
WireConnection;650;0;1245;32
WireConnection;650;1;1245;0
WireConnection;618;0;632;0
WireConnection;618;1;633;0
WireConnection;618;2;654;0
WireConnection;619;0;634;0
WireConnection;619;1;635;0
WireConnection;619;2;655;0
WireConnection;613;0;611;0
WireConnection;613;1;612;0
WireConnection;613;2;649;0
WireConnection;615;0;626;0
WireConnection;615;1;627;0
WireConnection;615;2;651;0
WireConnection;616;0;628;0
WireConnection;616;1;629;0
WireConnection;616;2;652;0
WireConnection;623;0;642;0
WireConnection;623;1;643;0
WireConnection;623;2;659;0
WireConnection;1295;0;1294;0
WireConnection;1295;1;1292;0
WireConnection;601;0;602;0
WireConnection;601;1;603;0
WireConnection;601;2;646;0
WireConnection;620;0;636;0
WireConnection;620;1;637;0
WireConnection;620;2;656;0
WireConnection;595;0;596;0
WireConnection;595;1;597;0
WireConnection;595;2;644;0
WireConnection;1262;21;1037;0
WireConnection;1262;30;991;0
WireConnection;1262;25;1254;28
WireConnection;1262;44;1254;47
WireConnection;606;0;604;0
WireConnection;606;1;605;0
WireConnection;606;2;647;0
WireConnection;617;0;630;0
WireConnection;617;1;631;0
WireConnection;617;2;653;0
WireConnection;614;0;624;0
WireConnection;614;1;625;0
WireConnection;614;2;650;0
WireConnection;622;0;640;0
WireConnection;622;1;641;0
WireConnection;622;2;658;0
WireConnection;608;0;609;0
WireConnection;608;1;610;0
WireConnection;608;2;648;0
WireConnection;598;0;599;0
WireConnection;598;1;600;0
WireConnection;598;2;645;0
WireConnection;621;0;638;0
WireConnection;621;1;639;0
WireConnection;621;2;657;0
WireConnection;1244;21;1032;0
WireConnection;1244;30;986;0
WireConnection;1244;25;1253;28
WireConnection;1244;44;1253;47
WireConnection;689;0;601;0
WireConnection;689;1;1265;32
WireConnection;695;0;616;0
WireConnection;695;1;1269;32
WireConnection;683;0;595;0
WireConnection;683;1;1272;32
WireConnection;692;0;613;0
WireConnection;692;1;1268;32
WireConnection;698;0;619;0
WireConnection;698;1;1251;32
WireConnection;944;0;1261;32
WireConnection;944;1;1261;0
WireConnection;702;0;623;0
WireConnection;702;1;1256;32
WireConnection;696;0;617;0
WireConnection;696;1;1266;32
WireConnection;978;0;1262;32
WireConnection;978;1;1262;0
WireConnection;700;0;621;0
WireConnection;700;1;1246;32
WireConnection;701;0;622;0
WireConnection;701;1;1258;32
WireConnection;900;0;1255;32
WireConnection;900;1;1255;0
WireConnection;699;0;620;0
WireConnection;699;1;1250;32
WireConnection;694;0;615;0
WireConnection;694;1;1270;32
WireConnection;684;0;598;0
WireConnection;684;1;1271;32
WireConnection;697;0;618;0
WireConnection;697;1;1267;32
WireConnection;901;0;1253;32
WireConnection;901;1;1253;0
WireConnection;972;0;1254;32
WireConnection;972;1;1254;0
WireConnection;939;0;1260;32
WireConnection;939;1;1260;0
WireConnection;898;0;1259;32
WireConnection;898;1;1259;0
WireConnection;690;0;606;0
WireConnection;690;1;1264;32
WireConnection;953;0;1252;32
WireConnection;953;1;1252;0
WireConnection;899;0;1247;32
WireConnection;899;1;1247;0
WireConnection;691;0;608;0
WireConnection;691;1;1263;32
WireConnection;952;0;1249;32
WireConnection;952;1;1249;0
WireConnection;693;0;614;0
WireConnection;693;1;1245;32
WireConnection;1296;1;1295;0
WireConnection;902;0;1244;32
WireConnection;902;1;1244;0
WireConnection;948;0;1248;32
WireConnection;948;1;1248;0
WireConnection;966;0;1257;32
WireConnection;966;1;1257;0
WireConnection;955;0;941;0
WireConnection;955;1;947;0
WireConnection;955;2;953;0
WireConnection;961;0;951;0
WireConnection;961;1;945;0
WireConnection;961;2;948;0
WireConnection;956;0;940;0
WireConnection;956;1;943;0
WireConnection;956;2;944;0
WireConnection;859;0;851;0
WireConnection;859;1;833;0
WireConnection;859;2;898;0
WireConnection;864;0;844;0
WireConnection;864;1;836;0
WireConnection;864;2;900;0
WireConnection;975;0;973;0
WireConnection;975;1;974;0
WireConnection;975;2;972;0
WireConnection;860;0;845;0
WireConnection;860;1;838;0
WireConnection;860;2;901;0
WireConnection;1299;0;1296;0
WireConnection;981;0;979;0
WireConnection;981;1;980;0
WireConnection;981;2;978;0
WireConnection;969;0;967;0
WireConnection;969;1;968;0
WireConnection;969;2;966;0
WireConnection;858;0;855;0
WireConnection;858;1;839;0
WireConnection;858;2;899;0
WireConnection;681;0;684;0
WireConnection;681;1;683;0
WireConnection;681;2;689;0
WireConnection;681;3;690;0
WireConnection;681;4;691;0
WireConnection;681;5;692;0
WireConnection;681;6;693;0
WireConnection;681;7;694;0
WireConnection;962;0;949;0
WireConnection;962;1;950;0
WireConnection;962;2;939;0
WireConnection;954;0;946;0
WireConnection;954;1;942;0
WireConnection;954;2;952;0
WireConnection;923;0;695;0
WireConnection;923;1;696;0
WireConnection;923;2;697;0
WireConnection;923;3;698;0
WireConnection;923;4;699;0
WireConnection;923;5;700;0
WireConnection;923;6;701;0
WireConnection;923;7;702;0
WireConnection;861;0;854;0
WireConnection;861;1;837;0
WireConnection;861;2;902;0
WireConnection;1302;0;1299;3
WireConnection;1302;1;1298;0
WireConnection;982;0;981;0
WireConnection;982;1;1262;32
WireConnection;1303;0;1299;1
WireConnection;1303;1;1297;0
WireConnection;964;0;962;0
WireConnection;964;1;1260;32
WireConnection;976;0;975;0
WireConnection;976;1;1254;32
WireConnection;1301;0;1299;2
WireConnection;1301;1;1300;0
WireConnection;970;0;969;0
WireConnection;970;1;1257;32
WireConnection;963;0;961;0
WireConnection;963;1;1248;32
WireConnection;865;0;864;0
WireConnection;865;1;1255;32
WireConnection;1051;0;681;0
WireConnection;957;0;954;0
WireConnection;957;1;1249;32
WireConnection;1052;0;923;0
WireConnection;872;0;861;0
WireConnection;872;1;1244;32
WireConnection;866;0;860;0
WireConnection;866;1;1253;32
WireConnection;958;0;956;0
WireConnection;958;1;1261;32
WireConnection;868;0;858;0
WireConnection;868;1;1247;32
WireConnection;867;0;859;0
WireConnection;867;1;1259;32
WireConnection;959;0;955;0
WireConnection;959;1;1252;32
WireConnection;960;0;958;0
WireConnection;960;1;959;0
WireConnection;960;2;957;0
WireConnection;960;3;963;0
WireConnection;960;4;964;0
WireConnection;960;5;970;0
WireConnection;960;6;976;0
WireConnection;960;7;982;0
WireConnection;1305;0;1303;0
WireConnection;1305;1;1301;0
WireConnection;1305;2;1302;0
WireConnection;880;0;868;0
WireConnection;880;1;867;0
WireConnection;880;2;865;0
WireConnection;880;3;866;0
WireConnection;880;4;872;0
WireConnection;1045;0;880;0
WireConnection;1047;0;960;0
WireConnection;678;0;1053;0
WireConnection;678;1;1054;0
WireConnection;1308;0;1305;0
WireConnection;782;0;678;0
WireConnection;823;1;782;0
WireConnection;823;0;1049;0
WireConnection;823;2;1048;0
WireConnection;823;3;1311;0
WireConnection;813;9;823;0
WireConnection;803;0;813;0
WireConnection;789;0;774;0
WireConnection;789;1;1265;32
WireConnection;787;0;772;0
WireConnection;787;1;1272;32
WireConnection;786;0;771;0
WireConnection;786;1;1263;32
WireConnection;1341;0;1342;0
WireConnection;1341;1;1264;32
WireConnection;788;0;773;0
WireConnection;788;1;1271;32
WireConnection;1050;1;803;0
WireConnection;1050;0;813;0
WireConnection;1050;2;813;0
WireConnection;918;1;787;0
WireConnection;919;1;788;0
WireConnection;917;1;786;0
WireConnection;1343;1;1341;0
WireConnection;920;1;789;0
WireConnection;912;24;915;0
WireConnection;912;25;916;0
WireConnection;912;26;913;0
WireConnection;912;27;914;0
WireConnection;912;15;1050;0
WireConnection;790;0;920;0
WireConnection;790;1;919;0
WireConnection;790;2;918;0
WireConnection;790;3;917;0
WireConnection;790;4;1343;0
WireConnection;814;1;912;0
WireConnection;814;0;1050;0
WireConnection;1286;0;1285;0
WireConnection;1286;1;1281;0
WireConnection;1278;0;1277;0
WireConnection;1278;1;1274;0
WireConnection;1277;0;1275;0
WireConnection;1277;1;1276;0
WireConnection;1279;0;1276;0
WireConnection;1314;0;599;0
WireConnection;1313;0;1272;32
WireConnection;1312;1;814;0
WireConnection;1312;0;814;0
WireConnection;1312;2;814;0
WireConnection;1312;3;823;0
WireConnection;921;1;790;0
WireConnection;1322;0;1330;2
WireConnection;1322;1;1328;0
WireConnection;1322;2;1329;0
WireConnection;1289;0;1282;0
WireConnection;1289;1;1287;0
WireConnection;1287;0;1283;0
WireConnection;1284;0;1283;0
WireConnection;1318;0;1319;0
WireConnection;1318;1;1320;0
WireConnection;1318;2;1322;0
WireConnection;1334;0;1332;2
WireConnection;1334;1;1333;0
WireConnection;1336;0;1340;0
WireConnection;1336;1;1339;0
WireConnection;1336;2;1335;2
WireConnection;1327;0;1324;2
WireConnection;1285;0;1282;0
WireConnection;1285;1;1283;0
WireConnection;1055;0;1056;0
WireConnection;0;0;1312;0
WireConnection;0;2;921;0
ASEEND*/
//CHKSM=76C3DF43CFA342916528D88B3B8747D0933519B3