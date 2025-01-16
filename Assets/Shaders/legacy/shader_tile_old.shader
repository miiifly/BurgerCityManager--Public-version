// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/TileLegacy"
{
	Properties
	{
		[KeywordEnum(WorldSpace,Normal,ColorMask)] _Workflow("Workflow", Float) = 0
		[NoScaleOffset]_Texture1("Texture1", 2D) = "white" {}
		_texturenormaltiling("texture normal tiling", Range( 0 , 400)) = 1
		_texturewstiling("texture ws tiling", Range( 0 , 400)) = 1
		_Multiply("Multiply", Range( 0 , 1)) = 1
		_Add("Add", Range( 0 , 1)) = 0
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( 0 , 2)) = 1
		_Value("Value", Range( -1 , 1)) = 0
		[NoScaleOffset]_Texture2("Texture2", 2D) = "white" {}
		_texture2normaltiling("texture2 normal tiling", Range( 0 , 400)) = 1
		_texture2wstiling("texture 2 ws tiling", Range( 0 , 400)) = 1
		_Multiply2("Multiply2", Range( 0 , 1)) = 1
		_Add2("Add2", Range( 0 , 1)) = 0
		_Hue2("Hue2", Range( 0 , 1)) = 0
		_Saturation2("Saturation2", Range( 0 , 2)) = 1
		_Value2("Value2", Range( -1 , 1)) = 0
		[NoScaleOffset]_Mask("Mask", 2D) = "white" {}
		_masknormaltiling("mask normal tiling", Range( 0 , 20)) = 0.4597179
		_maskwstiling("mask ws tiling", Range( 0 , 400)) = 0.4597179
		_Maskopacity("Mask opacity", Range( 0 , 1)) = 1
		[NoScaleOffset]_ColorMask("ColorMask", 2D) = "white" {}
		_ColorMaskcolor1("ColorMask color1", Color) = (1,1,1,0)
		_ColorMaskcolor2("ColorMask color2", Color) = (0,0,0,0)
		_ColorMasktiling("ColorMask tiling", Range( 0 , 400)) = 1
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
		#pragma shader_feature_local _WORKFLOW_WORLDSPACE _WORKFLOW_NORMAL _WORKFLOW_COLORMASK
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
		};

		uniform float _Add2;
		uniform float _Multiply2;
		uniform sampler2D _Texture2;
		uniform float _texture2wstiling;
		uniform float _texture2normaltiling;
		uniform float _ColorMasktiling;
		uniform float _Hue2;
		uniform float _Saturation2;
		uniform float _Value2;
		uniform float _Add;
		uniform float _Multiply;
		uniform sampler2D _Texture1;
		uniform float _texturewstiling;
		uniform float _texturenormaltiling;
		uniform float _Hue;
		uniform float _Saturation;
		uniform float _Value;
		uniform sampler2D _Mask;
		uniform float _maskwstiling;
		uniform float _masknormaltiling;
		uniform float _Maskopacity;
		uniform float4 _ColorMaskcolor2;
		uniform float4 _ColorMaskcolor1;
		uniform sampler2D _ColorMask;
		uniform float _rotator;


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
			float2 temp_cast_0 = (_texture2normaltiling).xx;
			float2 uv_TexCoord150 = i.uv_texcoord * temp_cast_0;
			float2 temp_output_164_0 = ( temp_output_30_0 / _ColorMasktiling );
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch156 = ( temp_output_30_0 / _texture2wstiling );
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch156 = uv_TexCoord150;
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch156 = temp_output_164_0;
			#else
				float2 staticSwitch156 = ( temp_output_30_0 / _texture2wstiling );
			#endif
			float3 hsvTorgb184 = RGBToHSV( tex2D( _Texture2, staticSwitch156 ).rgb );
			float3 hsvTorgb182 = HSVToRGB( float3(( hsvTorgb184.x + _Hue2 ),( hsvTorgb184.y * _Saturation2 ),( hsvTorgb184.z + _Value2 )) );
			float2 temp_cast_2 = (_texturenormaltiling).xx;
			float2 uv_TexCoord153 = i.uv_texcoord * temp_cast_2;
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch157 = ( temp_output_30_0 / _texturewstiling );
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch157 = uv_TexCoord153;
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch157 = float2( 0,0 );
			#else
				float2 staticSwitch157 = ( temp_output_30_0 / _texturewstiling );
			#endif
			float3 hsvTorgb192 = RGBToHSV( tex2D( _Texture1, staticSwitch157 ).rgb );
			float3 hsvTorgb197 = HSVToRGB( float3(( hsvTorgb192.x + _Hue ),( hsvTorgb192.y * _Saturation ),( hsvTorgb192.z + _Value )) );
			float2 temp_cast_4 = (_masknormaltiling).xx;
			float2 uv_TexCoord152 = i.uv_texcoord * temp_cast_4;
			#if defined(_WORKFLOW_WORLDSPACE)
				float2 staticSwitch158 = ( temp_output_30_0 / _maskwstiling );
			#elif defined(_WORKFLOW_NORMAL)
				float2 staticSwitch158 = uv_TexCoord152;
			#elif defined(_WORKFLOW_COLORMASK)
				float2 staticSwitch158 = float2( 0,0 );
			#else
				float2 staticSwitch158 = ( temp_output_30_0 / _maskwstiling );
			#endif
			float4 lerpResult147 = lerp( float4( 0,0,0,0 ) , tex2D( _Mask, staticSwitch158 ) , _Maskopacity);
			float3 lerpResult67 = lerp( ( _Add2 + ( _Multiply2 * hsvTorgb182 ) ) , ( _Add + ( _Multiply * hsvTorgb197 ) ) , lerpResult147.rgb);
			float cos167 = cos( _rotator );
			float sin167 = sin( _rotator );
			float2 rotator167 = mul( temp_output_164_0 - float2( 0.5,0.5 ) , float2x2( cos167 , -sin167 , sin167 , cos167 )) + float2( 0.5,0.5 );
			float4 lerpResult161 = lerp( _ColorMaskcolor2 , _ColorMaskcolor1 , tex2D( _ColorMask, rotator167 ));
			#if defined(_WORKFLOW_WORLDSPACE)
				float4 staticSwitch166 = float4( lerpResult67 , 0.0 );
			#elif defined(_WORKFLOW_NORMAL)
				float4 staticSwitch166 = float4( lerpResult67 , 0.0 );
			#elif defined(_WORKFLOW_COLORMASK)
				float4 staticSwitch166 = lerpResult161;
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
525;499;1703;804;2263.026;768.09;2.053188;True;True
Node;AmplifyShaderEditor.WorldPosInputsNode;1;-2947.964,258.4295;Inherit;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;154;-2505.862,78.99744;Inherit;False;Property;_texturenormaltiling;texture normal tiling;2;0;Create;True;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;30;-2620.284,238.9222;Inherit;True;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;72;-2030.963,332.9239;Inherit;False;Property;_texturewstiling;texture ws tiling;3;0;Create;True;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-2104.526,-10.90938;Inherit;False;Property;_texture2wstiling;texture 2 ws tiling;11;0;Create;True;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-2372.677,-266.467;Inherit;False;Property;_texture2normaltiling;texture2 normal tiling;10;0;Create;True;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-2010.893,-490.5974;Inherit;False;Property;_ColorMasktiling;ColorMask tiling;25;0;Create;True;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;150;-1928.322,-285.5288;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;59;-1693.531,24.27434;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;164;-1647.864,-431.9053;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;153;-2161.96,154.3925;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;73;-1650.811,272.3268;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;157;-1387.308,268.5616;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;156;-1373.095,-76.88561;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;0;True;;KeywordEnum;3;WorldSpace;Normal;ColorMask;Create;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;141;-1087.519,-2.412356;Inherit;True;Property;_Texture2;Texture2;9;1;[NoScaleOffset];Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;142;-1098.712,265.9693;Inherit;True;Property;_Texture1;Texture1;1;1;[NoScaleOffset];Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;186;-390.1325,-84.77357;Inherit;False;Property;_Saturation2;Saturation2;15;0;Create;True;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;190;-391.8428,241.7693;Inherit;False;Property;_Hue;Hue;6;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;189;-395.197,46.21259;Inherit;False;Property;_Value2;Value2;16;0;Create;True;0;0;False;0;False;0;0.19;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;151;-1833.198,880.8647;Inherit;False;Property;_masknormaltiling;mask normal tiling;18;0;Create;True;0;0;False;0;False;0.4597179;0.4597179;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;185;-396.1717,-239.8625;Inherit;False;Property;_Hue2;Hue2;14;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;192;-648.0412,321.41;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RGBToHSVNode;184;-656.2057,-143.2979;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;193;-395.2656,372.6812;Inherit;False;Property;_Saturation;Saturation;7;0;Create;True;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;-1994.422,582.3996;Inherit;False;Property;_maskwstiling;mask ws tiling;19;0;Create;True;0;0;False;0;False;0.4597179;0.4597179;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;195;-391.8681,498.8319;Inherit;False;Property;_Value;Value;8;0;Create;True;0;0;False;0;False;0;0.19;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;183;-43.01848,-281.6923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;93;-1669.274,559.1104;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;196;-34.49048,489.6372;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;152;-1518.435,835.3942;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;191;-39.68958,230.1611;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;187;-48.89874,-98.6914;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;188;-48.69914,55.1508;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;194;-40.73439,366.0165;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;179;-1623.287,-1050.928;Inherit;False;Constant;_Vector0;Vector 0;22;0;Create;True;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;144;1150.09,292.5289;Inherit;False;Property;_Multiply;Multiply;4;0;Create;True;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-1803.831,-841.301;Inherit;False;Property;_rotator;rotator;27;0;Create;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;158;-1432.897,497.0105;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.HSVToRGBNode;182;246.957,-139.3134;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;62;1173.199,-104.8548;Inherit;False;Property;_Multiply2;Multiply2;12;0;Create;True;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;197;255.1214,325.3945;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;145;1595.746,623.3696;Inherit;False;Property;_Add;Add;5;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;61;1525.476,74.70917;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;1534.37,368.6275;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;167;-1551.618,-834.4178;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;76;1580.916,-71.33234;Inherit;False;Property;_Add2;Add2;13;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;148;1759.496,946.17;Inherit;False;Property;_Maskopacity;Mask opacity;20;0;Create;True;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;146;-1188.139,554.3858;Inherit;True;Property;_Mask;Mask;17;1;[NoScaleOffset];Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;159;-1222.135,-445.4106;Inherit;True;Property;_ColorMask;ColorMask;22;1;[NoScaleOffset];Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;162;-919.9453,-863.9979;Inherit;False;Property;_ColorMaskcolor1;ColorMask color1;23;0;Create;True;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;163;-894.8326,-658.0392;Inherit;False;Property;_ColorMaskcolor2;ColorMask color2;24;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;147;2073.167,660.4684;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;77;1879.519,58.35996;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;78;1897.532,377.7064;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;67;2496.063,409.0653;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;161;-403.8635,-605.9003;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;170;-1935.785,-1452.156;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;166;2800.67,250.0482;Inherit;False;Property;_Workflow;Workflow;0;0;Create;True;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;WorldSpace;Normal;Reference;156;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;177;-2312.129,-887.5377;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;174;-1954.785,-1574.156;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;175;-1566.785,-1394.156;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-2652.799,-910.3043;Inherit;False;Property;_Float0;Float 0;26;0;Create;True;0;0;False;0;False;1;1;0;400;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;176;-2073.786,-1329.156;Inherit;False;Constant;_Float2;Float 2;20;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;169;-2042.96,-1134.681;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;172;-1732.085,-1313.056;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;173;-1874.96,-1181.681;Inherit;False;Constant;_Float1;Float 1;20;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;168;-1315.985,-699.8062;Inherit;True;Property;_TextureSample0;Texture Sample 0;21;1;[NoScaleOffset];Create;True;0;0;False;0;False;-1;3c979135ae07859448fc207a3e7781fc;3c979135ae07859448fc207a3e7781fc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3143.185,344.3615;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lichthund/TileLegacy;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;30;0;1;0
WireConnection;150;0;149;0
WireConnection;59;0;30;0
WireConnection;59;1;60;0
WireConnection;164;0;30;0
WireConnection;164;1;165;0
WireConnection;153;0;154;0
WireConnection;73;0;30;0
WireConnection;73;1;72;0
WireConnection;157;1;73;0
WireConnection;157;0;153;0
WireConnection;156;1;59;0
WireConnection;156;0;150;0
WireConnection;156;2;164;0
WireConnection;141;1;156;0
WireConnection;142;1;157;0
WireConnection;192;0;142;0
WireConnection;184;0;141;0
WireConnection;183;0;184;1
WireConnection;183;1;185;0
WireConnection;93;0;30;0
WireConnection;93;1;89;0
WireConnection;196;0;192;3
WireConnection;196;1;195;0
WireConnection;152;0;151;0
WireConnection;191;0;192;1
WireConnection;191;1;190;0
WireConnection;187;0;184;2
WireConnection;187;1;186;0
WireConnection;188;0;184;3
WireConnection;188;1;189;0
WireConnection;194;0;192;2
WireConnection;194;1;193;0
WireConnection;158;1;93;0
WireConnection;158;0;152;0
WireConnection;182;0;183;0
WireConnection;182;1;187;0
WireConnection;182;2;188;0
WireConnection;197;0;191;0
WireConnection;197;1;194;0
WireConnection;197;2;196;0
WireConnection;61;0;62;0
WireConnection;61;1;182;0
WireConnection;69;0;144;0
WireConnection;69;1;197;0
WireConnection;167;0;164;0
WireConnection;167;1;179;0
WireConnection;167;2;171;0
WireConnection;146;1;158;0
WireConnection;159;1;167;0
WireConnection;147;1;146;0
WireConnection;147;2;148;0
WireConnection;77;0;76;0
WireConnection;77;1;61;0
WireConnection;78;0;145;0
WireConnection;78;1;69;0
WireConnection;67;0;77;0
WireConnection;67;1;78;0
WireConnection;67;2;147;0
WireConnection;161;0;163;0
WireConnection;161;1;162;0
WireConnection;161;2;159;0
WireConnection;166;1;67;0
WireConnection;166;0;67;0
WireConnection;166;2;161;0
WireConnection;177;0;30;0
WireConnection;177;1;178;0
WireConnection;175;0;170;0
WireConnection;175;1;176;0
WireConnection;172;0;176;0
WireConnection;172;1;173;0
WireConnection;168;1;167;0
WireConnection;0;0;166;0
ASEEND*/
//CHKSM=ED5101733373EE50320FDDAC0CF7C3082614D9BF