// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/Tile"
{
	Properties
	{
		[KeywordEnum(WorldSpace,Normal,ColorMask,VertexPaint)] _Workflow("Workflow", Float) = 0
		[NoScaleOffset]_Texture_a("Texture A", 2D) = "white" {}
		_normal_texture_tiling_a("Texture A tiling", Range( 0 , 400)) = 1
		_worldspace_texture_tiling_a("Texture A tiling ws", Range( 0 , 400)) = 1
		_hue_a_1("Hue", Range( 0 , 1)) = 0
		_saturation_a_1("Saturation", Range( 0 , 2)) = 1
		_value_a_1("Value", Range( -1 , 1)) = 0
		_Multiply_a_1("Multiply", Range( 0 , 1)) = 1
		_add_a_1("Add", Range( 0 , 1)) = 0
		[NoScaleOffset]_Texture_b("Texture B", 2D) = "white" {}
		_normal_texture_tiling_b("Texture B tiling", Range( 0 , 400)) = 1
		_worldspace_texture_tiling_b("Texture B tiling ws", Range( 0 , 400)) = 0
		_hue_b_1("Hue", Range( 0 , 1)) = 0
		_saturation_b_1("Saturation", Range( 0 , 2)) = 1
		_value_b_1("Value", Range( -1 , 1)) = 0
		_Multiply_b_1("Multiply", Range( 0 , 1)) = 1
		_add_b_1("Add", Range( 0 , 1)) = 0
		[NoScaleOffset]_worldspace_mask_1("Mask", 2D) = "white" {}
		_Masktiling("Mask tiling", Range( 0 , 20)) = 0.4597179
		_worldspace_mask_tiling("Mask tiling ws", Range( 0 , 2000)) = 0.4597179
		_Maskopacity_1("Mask opacity", Range( 0 , 1)) = 1
		[NoScaleOffset]_Texture_a_2("Texture A", 2D) = "white" {}
		_worldspace_texture_tiling_a_2("Texture A tiling ws", Range( 0 , 1000)) = 0
		_hue_a_2("Hue", Range( 0 , 1)) = 0
		_saturation_a_2("Saturation", Range( 0 , 2)) = 1
		_value_a_2("Value", Range( -1 , 1)) = 0
		_Multiply_a_2("Multiply", Range( 0 , 1)) = 1
		_add_a_2("Add", Range( 0 , 1)) = 0
		[NoScaleOffset]_Texture_b_2("Texture B", 2D) = "white" {}
		_worldspace_texture_tiling_b_2("Texture B tiling ws", Range( 0 , 1000)) = 1
		_hue_b_2("Hue", Range( 0 , 1)) = 0
		_saturation_b_2("Saturation", Range( 0 , 2)) = 1
		_value_b_2("Value", Range( -1 , 1)) = 0
		_Multiply_b_2("Multiply", Range( 0 , 1)) = 1
		_add_b_2("Add", Range( 0 , 1)) = 0
		[NoScaleOffset]_worldspace_mask_2("Mask", 2D) = "white" {}
		_worldspace_mask_tiling_2("Mask tiling ws", Range( 0 , 2000)) = 0.4597179
		_Maskopacity_2("Mask opacity", Range( 0 , 1)) = 1
		[NoScaleOffset]_ColorMask("Color Mask", 2D) = "white" {}
		_ColorMaskcolor1("ColorMask color 1", Color) = (1,1,1,0)
		_ColorMaskcolor2("ColorMask color 2", Color) = (0,0,0,0)
		_colormask_tiling_a("Color mask tiling", Range( 0 , 400)) = 1
		_rotator("rotator", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma shader_feature_local _WORKFLOW_WORLDSPACE _WORKFLOW_NORMAL _WORKFLOW_COLORMASK _WORKFLOW_VERTEXPAINT
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform float _add_b_1;
		uniform float _Multiply_b_1;
		uniform sampler2D _Texture_b;
		uniform float _worldspace_texture_tiling_b;
		uniform float _normal_texture_tiling_b;
		uniform float _colormask_tiling_a;
		uniform float _hue_b_1;
		uniform float _saturation_b_1;
		uniform float _value_b_1;
		uniform float _add_a_1;
		uniform float _Multiply_a_1;
		uniform sampler2D _Texture_a;
		uniform float _worldspace_texture_tiling_a;
		uniform float _normal_texture_tiling_a;
		uniform float _hue_a_1;
		uniform float _saturation_a_1;
		uniform float _value_a_1;
		uniform sampler2D _worldspace_mask_1;
		uniform float _worldspace_mask_tiling;
		uniform float _Masktiling;
		uniform float _Maskopacity_1;
		uniform float4 _ColorMaskcolor2;
		uniform float4 _ColorMaskcolor1;
		uniform sampler2D _ColorMask;
		uniform float _rotator;
		uniform float _add_b_2;
		uniform float _Multiply_b_2;
		uniform sampler2D _Texture_b_2;
		uniform float _worldspace_texture_tiling_b_2;
		uniform float _hue_b_2;
		uniform float _saturation_b_2;
		uniform float _value_b_2;
		uniform float _add_a_2;
		uniform float _Multiply_a_2;
		uniform sampler2D _Texture_a_2;
		uniform float _worldspace_texture_tiling_a_2;
		uniform float _hue_a_2;
		uniform float _saturation_a_2;
		uniform float _value_a_2;
		uniform sampler2D _worldspace_mask_2;
		uniform float _worldspace_mask_tiling_2;
		uniform float _Maskopacity_2;


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
			float3 ase_worldPos = i.worldPos;
			float2 temp_output_30_0 = (ase_worldPos).xz;
			float2 temp_output_59_0 = ( temp_output_30_0 / _worldspace_texture_tiling_b );
			float2 temp_cast_0 = (_normal_texture_tiling_b).xx;
			float2 uv_TexCoord150 = i.uv_texcoord * temp_cast_0;
			float2 temp_output_164_0 = ( temp_output_30_0 / _colormask_tiling_a );
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch156 = temp_output_59_0;
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch156 = uv_TexCoord150;
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch156 = temp_output_164_0;
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float2 staticSwitch156 = temp_output_59_0;
			#else
				float2 staticSwitch156 = temp_output_59_0;
			#endif
			float3 hsvTorgb184 = RGBToHSV( tex2D( _Texture_b, staticSwitch156 ).rgb );
			float3 hsvTorgb182 = HSVToRGB( float3(( hsvTorgb184.x + _hue_b_1 ),( hsvTorgb184.y * _saturation_b_1 ),( hsvTorgb184.z + _value_b_1 )) );
			float2 temp_output_73_0 = ( temp_output_30_0 / _worldspace_texture_tiling_a );
			float2 temp_cast_2 = (_normal_texture_tiling_a).xx;
			float2 uv_TexCoord153 = i.uv_texcoord * temp_cast_2;
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch157 = temp_output_73_0;
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch157 = uv_TexCoord153;
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch157 = float2( 0,0 );
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float2 staticSwitch157 = temp_output_73_0;
			#else
				float2 staticSwitch157 = temp_output_73_0;
			#endif
			float3 hsvTorgb192 = RGBToHSV( tex2D( _Texture_a, staticSwitch157 ).rgb );
			float3 hsvTorgb197 = HSVToRGB( float3(( hsvTorgb192.x + _hue_a_1 ),( hsvTorgb192.y * _saturation_a_1 ),( hsvTorgb192.z + _value_a_1 )) );
			float2 temp_output_93_0 = ( temp_output_30_0 / _worldspace_mask_tiling );
			float2 temp_cast_4 = (_Masktiling).xx;
			float2 uv_TexCoord152 = i.uv_texcoord * temp_cast_4;
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch158 = temp_output_93_0;
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch158 = uv_TexCoord152;
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch158 = float2( 0,0 );
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float2 staticSwitch158 = temp_output_93_0;
			#else
				float2 staticSwitch158 = temp_output_93_0;
			#endif
			float4 lerpResult147 = lerp( float4( 0,0,0,0 ) , tex2D( _worldspace_mask_1, staticSwitch158 ) , _Maskopacity_1);
			float3 lerpResult67 = lerp( ( _add_b_1 + ( _Multiply_b_1 * hsvTorgb182 ) ) , ( _add_a_1 + ( _Multiply_a_1 * hsvTorgb197 ) ) , lerpResult147.rgb);
			float cos167 = cos( _rotator );
			float sin167 = sin( _rotator );
			float2 rotator167 = mul( temp_output_164_0 - float2( 0.5,0.5 ) , float2x2( cos167 , -sin167 , sin167 , cos167 )) + float2( 0.5,0.5 );
			float4 lerpResult161 = lerp( _ColorMaskcolor2 , _ColorMaskcolor1 , tex2D( _ColorMask, rotator167 ));
			float2 temp_output_257_0 = (ase_worldPos).xz;
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch223 = float2( 0,0 );
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch223 = float2( 0,0 );
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch223 = float2( 0,0 );
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float2 staticSwitch223 = ( temp_output_257_0 / _worldspace_texture_tiling_b_2 );
			#else
				float2 staticSwitch223 = float2( 0,0 );
			#endif
			float3 hsvTorgb208 = RGBToHSV( tex2D( _Texture_b_2, staticSwitch223 ).rgb );
			float3 hsvTorgb217 = HSVToRGB( float3(( hsvTorgb208.x + _hue_b_2 ),( hsvTorgb208.y * _saturation_b_2 ),( hsvTorgb208.z + _value_b_2 )) );
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch236 = float2( 0,0 );
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch236 = float2( 0,0 );
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch236 = float2( 0,0 );
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float2 staticSwitch236 = ( temp_output_257_0 / _worldspace_texture_tiling_a_2 );
			#else
				float2 staticSwitch236 = float2( 0,0 );
			#endif
			float3 hsvTorgb207 = RGBToHSV( tex2D( _Texture_a_2, staticSwitch236 ).rgb );
			float3 hsvTorgb216 = HSVToRGB( float3(( hsvTorgb207.x + _hue_a_2 ),( hsvTorgb207.y * _saturation_a_2 ),( hsvTorgb207.z + _value_a_2 )) );
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch228 = float2( 0,0 );
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch228 = float2( 0,0 );
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch228 = float2( 0,0 );
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float2 staticSwitch228 = ( temp_output_257_0 / _worldspace_mask_tiling_2 );
			#else
				float2 staticSwitch228 = float2( 0,0 );
			#endif
			float4 lerpResult241 = lerp( float4( 0,0,0,0 ) , tex2D( _worldspace_mask_2, staticSwitch228 ) , _Maskopacity_2);
			float3 lerpResult242 = lerp( ( _add_b_2 + ( _Multiply_b_2 * hsvTorgb217 ) ) , ( _add_a_2 + ( _Multiply_a_2 * hsvTorgb216 ) ) , lerpResult241.rgb);
			float3 lerpResult249 = lerp( lerpResult67 , lerpResult242 , i.vertexColor.r);
			#if defined(_WORKFLOW_WORLDSPACE)
				float4 staticSwitch166 = float4( lerpResult67 , 0.0 );
			#elif defined(_WORKFLOW_NORMAL)
				float4 staticSwitch166 = float4( lerpResult67 , 0.0 );
			#elif defined(_WORKFLOW_COLORMASK)
				float4 staticSwitch166 = lerpResult161;
			#elif defined(_WORKFLOW_VERTEXPAINT)
				float4 staticSwitch166 = float4( lerpResult249 , 0.0 );
			#else
				float4 staticSwitch166 = float4( lerpResult67 , 0.0 );
			#endif
			o.Albedo = staticSwitch166.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18703
694;245;1703;804;4908.264;-956.4011;3.347886;True;True
Node;AmplifyShaderEditor.WorldPosInputsNode;252;-4010.837,1972.943;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;1;-3185.039,293.7388;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;230;-2407.042,1601.482;Inherit;False;Property;_worldspace_texture_tiling_b_2;Texture B tiling ws;29;0;Create;False;0;0;False;0;False;1;400;0;1000;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;154;-2465.947,174.5544;Inherit;False;Property;_normal_texture_tiling_a;Texture A tiling;2;0;Create;False;0;0;False;0;False;1;0;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-2330.827,-12.56393;Inherit;False;Property;_worldspace_texture_tiling_b;Texture B tiling ws;11;0;Create;False;0;0;False;0;False;0;136;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-2322.858,374.3377;Inherit;False;Property;_worldspace_texture_tiling_a;Texture A tiling ws;3;0;Create;False;0;0;False;0;False;1;136;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;232;-2325.958,2193.337;Inherit;False;Property;_worldspace_texture_tiling_a_2;Texture A tiling ws;22;0;Create;False;0;0;False;0;False;0;1;0;1000;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;257;-3527.074,2009.235;Inherit;True;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-2306.857,-448.0518;Inherit;False;Property;_colormask_tiling_a;Color mask tiling;42;0;Create;False;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-2384,-175;Inherit;False;Property;_normal_texture_tiling_b;Texture B tiling;10;0;Create;False;0;0;False;0;False;1;0;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;30;-2935.081,295.6465;Inherit;True;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;73;-1869.85,306.3997;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;153;-2136.259,172.0519;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;220;-2024.082,1539.634;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;164;-1956.779,-421.5124;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;222;-1939.724,2157.527;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;150;-1952,-192;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;59;-1901.475,10.9916;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;236;-1659.786,2167.885;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;157;-1408,366.9686;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;156;-1390.999,14.99915;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;4;WorldSpace;Normal;ColorMask;VertexPaint;Create;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;223;-1768.082,1539.634;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;200;-1334.593,1582.904;Inherit;True;Property;_Texture_b_2;Texture B;28;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;e48d259032a8636438ba3607a45b5825;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;142;-1090.757,259.1684;Inherit;True;Property;_Texture_a;Texture A;1;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;522c9850202aa8e449b77ba55659bf7b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;141;-1082.839,-11.54631;Inherit;True;Property;_Texture_b;Texture B;9;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;e48d259032a8636438ba3607a45b5825;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;201;-1333.304,2281.293;Inherit;True;Property;_Texture_a_2;Texture A;21;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;522c9850202aa8e449b77ba55659bf7b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RGBToHSVNode;207;-907.7162,2138.484;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;89;-2302.738,568.9327;Inherit;False;Property;_worldspace_mask_tiling;Mask tiling ws;19;0;Create;False;0;0;False;0;False;0.4597179;182;0;2000;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;204;-631.105,1692.497;Inherit;False;Property;_saturation_b_2;Saturation;31;0;Create;False;0;0;False;0;False;1;1.328;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;184;-656.2057,-143.2979;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;193;-393.2656,370.6812;Inherit;False;Property;_saturation_a_1;Saturation;5;0;Create;False;0;0;False;0;False;1;1.09;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;189;-393.897,47.51259;Inherit;False;Property;_value_b_1;Value;14;0;Create;False;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;190;-390.8428,240.7693;Inherit;False;Property;_hue_a_1;Hue;4;0;Create;False;0;0;False;0;False;0;0.055;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;185;-395.1717,-240.8625;Inherit;False;Property;_hue_b_1;Hue;12;0;Create;False;0;0;False;0;False;0;0.06;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;186;-386.2325,-87.07357;Inherit;False;Property;_saturation_b_1;Saturation;13;0;Create;False;0;0;False;0;False;1;1.09;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-644.2224,2327.842;Inherit;False;Property;_value_a_2;Value;25;0;Create;False;0;0;False;0;False;0;0.046;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;231;-2295.416,2797.501;Inherit;False;Property;_worldspace_mask_tiling_2;Mask tiling ws;36;0;Create;False;0;0;False;0;False;0.4597179;2000;0;2000;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;203;-626.2142,1819.276;Inherit;False;Property;_value_b_2;Value;32;0;Create;False;0;0;False;0;False;0;-0.037;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;209;-637.743,2193.523;Inherit;False;Property;_saturation_a_2;Saturation;24;0;Create;False;0;0;False;0;False;1;1.218;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-646.6822,2039.734;Inherit;False;Property;_hue_a_2;Hue;23;0;Create;False;0;0;False;0;False;0;0.014;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;208;-885.4683,1641.813;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;151;-2324.573,836.5726;Inherit;False;Property;_Masktiling;Mask tiling;18;0;Create;True;0;0;False;0;False;0.4597179;15.51;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;205;-630.7227,1563.625;Inherit;False;Property;_hue_b_2;Hue;30;0;Create;False;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;192;-648.0412,321.41;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;195;-390.8681,497.8319;Inherit;False;Property;_value_a_1;Value;6;0;Create;False;0;0;False;0;False;0;-0.009;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;93;-1897.234,564.0046;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;194;-40.73439,366.0165;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;226;-1928.566,2748.348;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;183;-43.01848,-281.6923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;188;-48.69914,55.1508;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;215;-278.5697,1552.017;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;196;-34.49048,489.6372;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;213;-279.6145,1687.873;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;191;-39.68958,230.1611;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;152;-2046,820.5726;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;187;-48.89874,-98.6914;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;212;-300.4094,2183.09;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;211;-300.2097,2336.933;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;214;-273.3706,1811.494;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;210;-294.5291,2000.09;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;62;1174.199,-105.8548;Inherit;False;Property;_Multiply_b_1;Multiply;15;0;Create;False;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;182;246.957,-139.3134;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;243;490.9477,1569.216;Inherit;False;Property;_Multiply_b_2;Multiply;33;0;Create;False;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;216;-4.553582,2142.469;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;228;-1629.022,2743.915;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;246;525.7082,1983.074;Inherit;False;Property;_Multiply_a_2;Multiply;26;0;Create;False;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;158;-1453.478,701.9713;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.HSVToRGBNode;217;16.24136,1647.251;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.HSVToRGBNode;197;255.1214,325.3945;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;144;1153.634,288.9853;Inherit;False;Property;_Multiply_a_1;Multiply;7;0;Create;False;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;1261.892,2495.015;Inherit;False;Property;_Maskopacity_2;Mask opacity;37;0;Create;False;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;179;-1623.287,-1050.928;Inherit;False;Constant;_Vector0;Vector 0;22;0;Create;True;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;61;1525.476,74.70917;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;145;1595.746,625.9133;Inherit;False;Property;_add_a_1;Add;8;0;Create;False;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-1803.831,-841.301;Inherit;False;Property;_rotator;rotator;43;0;Create;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;1583.76,-74.17597;Inherit;False;Property;_add_b_1;Add;16;0;Create;False;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;229;-1270.814,2696.492;Inherit;True;Property;_worldspace_mask_2;Mask;35;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;42e261db76e56604fbbbafcc64a46949;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;245;1052.537,2031.272;Inherit;False;Property;_add_a_2;Add;27;0;Create;False;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;237;845.6822,1720.389;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;244;1059.569,1600.895;Inherit;False;Property;_add_b_2;Add;34;0;Create;False;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;238;822.2778,2173.808;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;148;1769.596,942.5916;Inherit;False;Property;_Maskopacity_1;Mask opacity;20;0;Create;False;0;0;False;0;False;1;0.88;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;146;-1058,549.5726;Inherit;True;Property;_worldspace_mask_1;Mask;17;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;25b1c9f845ae726498e46fc4154831fa;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;1534.37,368.6275;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;240;1377.811,2152.597;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;78;1897.532,377.7064;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;167;-1551.618,-834.4178;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;77;1879.519,58.35996;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;147;2073.167,660.4684;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;239;1355.328,1733.431;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;241;1599.204,2418.472;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;163;-750.0101,-1013.269;Inherit;False;Property;_ColorMaskcolor2;ColorMask color 2;41;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;67;2496.063,409.0653;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;159;-1319.891,-719.5466;Inherit;True;Property;_ColorMask;Color Mask;39;1;[NoScaleOffset];Create;False;0;0;False;0;False;-1;None;25b1c9f845ae726498e46fc4154831fa;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;248;2443.648,972.092;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;242;1932.925,1916.495;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;162;-455.5173,-1107.365;Inherit;False;Property;_ColorMaskcolor1;ColorMask color 1;40;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;249;2771.856,960.621;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;161;-334.9743,-755.8357;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;168;-1134.875,-1232.481;Inherit;True;Property;_TextureSample0;Texture Sample 0;38;2;[HideInInspector];[NoScaleOffset];Create;True;0;0;False;0;False;-1;3c979135ae07859448fc207a3e7781fc;3c979135ae07859448fc207a3e7781fc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;176;-2073.786,-1329.156;Inherit;False;Constant;_Float2;Float 2;20;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;175;-1566.785,-1394.156;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;170;-1935.785,-1452.156;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;174;-1954.785,-1574.156;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;172;-1732.085,-1313.056;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;169;-2042.96,-1134.681;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;166;2800.67,250.0482;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;3;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;173;-1874.96,-1181.681;Inherit;False;Constant;_Float1;Float 1;20;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3143.185,344.3615;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lichthund/Tile;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;257;0;252;0
WireConnection;30;0;1;0
WireConnection;73;0;30;0
WireConnection;73;1;72;0
WireConnection;153;0;154;0
WireConnection;220;0;257;0
WireConnection;220;1;230;0
WireConnection;164;0;30;0
WireConnection;164;1;165;0
WireConnection;222;0;257;0
WireConnection;222;1;232;0
WireConnection;150;0;149;0
WireConnection;59;0;30;0
WireConnection;59;1;60;0
WireConnection;236;3;222;0
WireConnection;157;1;73;0
WireConnection;157;0;153;0
WireConnection;157;3;73;0
WireConnection;156;1;59;0
WireConnection;156;0;150;0
WireConnection;156;2;164;0
WireConnection;156;3;59;0
WireConnection;223;3;220;0
WireConnection;200;1;223;0
WireConnection;142;1;157;0
WireConnection;141;1;156;0
WireConnection;201;1;236;0
WireConnection;207;0;201;0
WireConnection;184;0;141;0
WireConnection;208;0;200;0
WireConnection;192;0;142;0
WireConnection;93;0;30;0
WireConnection;93;1;89;0
WireConnection;194;0;192;2
WireConnection;194;1;193;0
WireConnection;226;0;257;0
WireConnection;226;1;231;0
WireConnection;183;0;184;1
WireConnection;183;1;185;0
WireConnection;188;0;184;3
WireConnection;188;1;189;0
WireConnection;215;0;208;1
WireConnection;215;1;205;0
WireConnection;196;0;192;3
WireConnection;196;1;195;0
WireConnection;213;0;208;2
WireConnection;213;1;204;0
WireConnection;191;0;192;1
WireConnection;191;1;190;0
WireConnection;152;0;151;0
WireConnection;187;0;184;2
WireConnection;187;1;186;0
WireConnection;212;0;207;2
WireConnection;212;1;209;0
WireConnection;211;0;207;3
WireConnection;211;1;202;0
WireConnection;214;0;208;3
WireConnection;214;1;203;0
WireConnection;210;0;207;1
WireConnection;210;1;206;0
WireConnection;182;0;183;0
WireConnection;182;1;187;0
WireConnection;182;2;188;0
WireConnection;216;0;210;0
WireConnection;216;1;212;0
WireConnection;216;2;211;0
WireConnection;228;3;226;0
WireConnection;158;1;93;0
WireConnection;158;0;152;0
WireConnection;158;3;93;0
WireConnection;217;0;215;0
WireConnection;217;1;213;0
WireConnection;217;2;214;0
WireConnection;197;0;191;0
WireConnection;197;1;194;0
WireConnection;197;2;196;0
WireConnection;61;0;62;0
WireConnection;61;1;182;0
WireConnection;229;1;228;0
WireConnection;237;0;243;0
WireConnection;237;1;217;0
WireConnection;238;0;246;0
WireConnection;238;1;216;0
WireConnection;146;1;158;0
WireConnection;69;0;144;0
WireConnection;69;1;197;0
WireConnection;240;0;245;0
WireConnection;240;1;238;0
WireConnection;78;0;145;0
WireConnection;78;1;69;0
WireConnection;167;0;164;0
WireConnection;167;1;179;0
WireConnection;167;2;171;0
WireConnection;77;0;76;0
WireConnection;77;1;61;0
WireConnection;147;1;146;0
WireConnection;147;2;148;0
WireConnection;239;0;244;0
WireConnection;239;1;237;0
WireConnection;241;1;229;0
WireConnection;241;2;247;0
WireConnection;67;0;77;0
WireConnection;67;1;78;0
WireConnection;67;2;147;0
WireConnection;159;1;167;0
WireConnection;242;0;239;0
WireConnection;242;1;240;0
WireConnection;242;2;241;0
WireConnection;249;0;67;0
WireConnection;249;1;242;0
WireConnection;249;2;248;1
WireConnection;161;0;163;0
WireConnection;161;1;162;0
WireConnection;161;2;159;0
WireConnection;168;1;167;0
WireConnection;175;0;170;0
WireConnection;175;1;176;0
WireConnection;172;0;176;0
WireConnection;172;1;173;0
WireConnection;166;1;67;0
WireConnection;166;0;67;0
WireConnection;166;2;161;0
WireConnection;166;3;249;0
WireConnection;0;0;166;0
ASEEND*/
//CHKSM=7992EF0CD26FBF99CA24E555515749DCA3538391