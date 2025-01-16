// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/FT Gradient4x4 "
{
	Properties
	{
		[Toggle]_Color_primaryGradient("Color_primary Gradient", Float) = 1
		[HDR]_Color_primary("Color_primary", Color) = (0.3098039,0.2078432,0.1764706,1)
		[HDR]_Color_primary2("Color_primary2", Color) = (0.1607843,0.08345432,0.05098039,1)
		[Toggle]_Color_secondaryGradient("Color_secondary Gradient", Float) = 1
		[HDR]_Color_secondary("Color_secondary", Color) = (0.482353,0.172549,0.1254902,1)
		[HDR]_Color_secondary2("Color_secondary2", Color) = (0.3018868,0.1295667,0.1039516,1)
		[Toggle]_Roof_primaryGradient("Roof_primary Gradient", Float) = 1
		[HDR]_Roof_primary("Roof_primary", Color) = (0.5647059,0.5058824,0.5019608,1)
		[HDR]_Roof_primary2("Roof_primary2", Color) = (0.4056604,0.1931351,0.1779548,1)
		[Toggle]_Roof_secondaryGradient("Roof_secondary Gradient", Float) = 1
		[HDR]_Roof_secondary("Roof_secondary", Color) = (0.6705883,0.6313726,0.5960785,1)
		[HDR]_Roof_secondary2("Roof_secondary2", Color) = (0.5377358,0.3786568,0.2358935,1)
		[Toggle]_WindowGradient("Window Gradient ", Float) = 1
		[HDR]_Window("Window", Color) = (0.8867924,0.8867924,0.8867924,1)
		[HDR]_Window2("Window2", Color) = (0.2924528,0.2924528,0.2924528,1)
		[Toggle]_Window_frameGradient("Window_frame Gradient", Float) = 0
		[HDR]_Window_frame("Window_frame", Color) = (0.4627451,0.4196079,0.4117647,1)
		[HDR]_Window_frame2("Window_frame2", Color) = (0.4056604,0.2388922,0.2085707,1)
		[Toggle]_Window_railGradient("Window_rail Gradient", Float) = 0
		[HDR]_Window_rail("Window_rail", Color) = (0.6235294,0.5333334,0.509804,1)
		[HDR]_Window_rail2("Window_rail2", Color) = (0.482353,0.2392157,0.2235294,1)
		[Toggle]_Window_decorGradient("Window_decor Gradient", Float) = 0
		[HDR]_Window_decor("Window_decor", Color) = (0.482353,0.2745098,0.2431373,1)
		[HDR]_Window_decor2("Window_decor2", Color) = (0.254902,0.07843138,0.0509804,1)
		[Toggle]_Bottom_primaryGradient("Bottom_primary Gradient", Float) = 1
		[HDR]_Bottom_primary("Bottom_primary", Color) = (0.3098039,0.282353,0.2745098,1)
		[HDR]_Bottom_primary2("Bottom_primary2", Color) = (0.2924528,0.1755023,0.1420879,1)
		[Toggle]_Bottom_secondaryGradient("Bottom_secondary Gradient", Float) = 0
		[HDR]_Bottom_secondary("Bottom_secondary", Color) = (0.3607843,0.2627451,0.254902,1)
		[HDR]_Bottom_secondary2("Bottom_secondary2", Color) = (0.1603774,0.06191638,0.0537113,1)
		[Toggle]_Bottom_roofing_aGradient("Bottom_roofing_a Gradient", Float) = 0
		[HDR]_Bottom_roofing_a("Bottom_roofing_a", Color) = (0.482353,0.3764706,0.3647059,1)
		[HDR]_Bottom_roofing_a2("Bottom_roofing_a2", Color) = (0.1603774,0.05632995,0.04765932,1)
		[Toggle]_Bottom_roofing_bGradient("Bottom_roofing_b Gradient", Float) = 0
		[HDR]_Bottom_roofing_b("Bottom_roofing_b", Color) = (0.6627451,0.4705883,0.4588236,1)
		[HDR]_Bottom_roofing_b2("Bottom_roofing_b2", Color) = (0.4716981,0.2263928,0.2113741,1)
		[Toggle]_CornersGradient("Corners Gradient", Float) = 0
		[HDR]_Corners("Corners", Color) = (0.2392157,0.2509804,0.3058824,1)
		[HDR]_Corners2("Corners2", Color) = (0.06666667,0.1019608,0.2470588,1)
		[Toggle]_Bonus_color_bGradient("Bonus_color_b Gradient", Float) = 0
		[HDR]_Bonus_color_b("Bonus_color_b", Color) = (0.4,0.3686275,0.345098,1)
		[HDR]_Bonus_color_b2("Bonus_color_b2", Color) = (0.1981132,0.1313635,0.08130118,1)
		[Toggle]_Bonus_color_cGradient("Bonus_color_c Gradient", Float) = 0
		[HDR]_Bonus_color_c("Bonus_color_c", Color) = (0.3490196,0.3921569,0.4,1)
		[HDR]_Bonus_color_c2("Bonus_color_c2", Color) = (0.08650766,0.2030972,0.2264151,1)
		[Toggle]_Bonus_color_dGradient("Bonus_color_d Gradient", Float) = 0
		[HDR]_Bonus_color_d("Bonus_color_d", Color) = (0.3882353,0.3529412,0.4,1)
		[HDR]_Bonus_color_d2("Bonus_color_d2", Color) = (0.2083148,0.125712,0.2358491,1)
		[Toggle]_Enablepropemission1("Enable prop emission 1", Float) = 0
		[HDR]_Emmision1("Emmision1", Color) = (0,0,0,1)
		[Toggle]_Enablepropemission2("Enable prop emission 2", Float) = 0
		[HDR]_Emmision2("Emmision2", Color) = (0,0,0,1)
		[Toggle]_Enablepropemission3("Enable prop emission 3", Float) = 0
		[HDR]_Emmision3("Emmision3", Color) = (0,0,0,1)
		[Toggle]_Enablewindowemmision("Enable window emmision", Float) = 0
		[HDR]_WindowEmission("WindowEmission", Color) = (0,0,0,1)
		[HideInInspector]_Texture0("Texture 0", 2D) = "white" {}
		_Hue("Hue", Range( 0 , 1)) = 0
		_Value("Value", Range( -1 , 1)) = 0
		_Saturation("Saturation", Range( 0 , 2)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows nodynlightmap 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Color_primary2;
		uniform float4 _Color_primary;
		uniform float _Color_primaryGradient;
		uniform sampler2D _Texture0;
		uniform float4 _Texture0_ST;
		uniform float4 _Color_secondary2;
		uniform float4 _Color_secondary;
		uniform float _Color_secondaryGradient;
		uniform float4 _Roof_primary2;
		uniform float4 _Roof_primary;
		uniform float _Roof_primaryGradient;
		uniform float4 _Roof_secondary2;
		uniform float4 _Roof_secondary;
		uniform float _Roof_secondaryGradient;
		uniform float4 _Window2;
		uniform float4 _Window;
		uniform float _WindowGradient;
		uniform float4 _Window_frame2;
		uniform float4 _Window_frame;
		uniform float _Window_frameGradient;
		uniform float4 _Window_rail2;
		uniform float4 _Window_rail;
		uniform float _Window_railGradient;
		uniform float4 _Window_decor2;
		uniform float4 _Window_decor;
		uniform float _Window_decorGradient;
		uniform float4 _Bottom_primary2;
		uniform float4 _Bottom_primary;
		uniform float _Bottom_primaryGradient;
		uniform float4 _Bottom_secondary2;
		uniform float4 _Bottom_secondary;
		uniform float _Bottom_secondaryGradient;
		uniform float4 _Bottom_roofing_a2;
		uniform float4 _Bottom_roofing_a;
		uniform float _Bottom_roofing_aGradient;
		uniform float4 _Bottom_roofing_b2;
		uniform float4 _Bottom_roofing_b;
		uniform float _Bottom_roofing_bGradient;
		uniform float4 _Corners2;
		uniform float4 _Corners;
		uniform float _CornersGradient;
		uniform float4 _Bonus_color_b2;
		uniform float4 _Bonus_color_b;
		uniform float _Bonus_color_bGradient;
		uniform float4 _Bonus_color_c2;
		uniform float4 _Bonus_color_c;
		uniform float _Bonus_color_cGradient;
		uniform float4 _Bonus_color_d2;
		uniform float4 _Bonus_color_d;
		uniform float _Bonus_color_dGradient;
		uniform float _Hue;
		uniform float _Saturation;
		uniform float _Value;
		uniform float _Enablepropemission1;
		uniform float4 _Emmision1;
		uniform float _Enablewindowemmision;
		uniform float4 _WindowEmission;
		uniform float _Enablepropemission2;
		uniform float4 _Emmision2;
		uniform float _Enablepropemission3;
		uniform float4 _Emmision3;


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
			float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
			float4 tex2DNode240 = tex2D( _Texture0, uv_Texture0 );
			float4 temp_output_763_0 = sign( tex2DNode240 );
			float4 lerpResult625 = lerp( _Color_primary2 , _Color_primary , (( _Color_primaryGradient )?( tex2DNode240 ):( temp_output_763_0 )));
			float2 uv_TexCoord637 = i.uv_texcoord + float2( 1.75,0 );
			float4 tex2DNode305 = tex2D( _Texture0, uv_TexCoord637 );
			float4 temp_output_638_0 = sign( tex2DNode305 );
			float4 lerpResult650 = lerp( _Color_secondary2 , _Color_secondary , (( _Color_secondaryGradient )?( tex2DNode305 ):( temp_output_638_0 )));
			float4 lerpResult728 = lerp( lerpResult625 , lerpResult650 , temp_output_638_0);
			float2 uv_TexCoord657 = i.uv_texcoord + float2( 1.5,0 );
			float4 tex2DNode656 = tex2D( _Texture0, uv_TexCoord657 );
			float4 temp_output_746_0 = sign( tex2DNode656 );
			float4 lerpResult653 = lerp( _Roof_primary2 , _Roof_primary , (( _Roof_primaryGradient )?( tex2DNode656 ):( temp_output_746_0 )));
			float2 uv_TexCoord662 = i.uv_texcoord + float2( 1.25,0 );
			float4 tex2DNode661 = tex2D( _Texture0, uv_TexCoord662 );
			float4 temp_output_730_0 = sign( tex2DNode661 );
			float4 lerpResult658 = lerp( _Roof_secondary2 , _Roof_secondary , (( _Roof_secondaryGradient )?( tex2DNode661 ):( temp_output_730_0 )));
			float4 lerpResult729 = lerp( lerpResult653 , lerpResult658 , temp_output_730_0);
			float4 lerpResult747 = lerp( temp_output_746_0 , temp_output_730_0 , temp_output_730_0);
			float4 lerpResult743 = lerp( lerpResult728 , lerpResult729 , lerpResult747);
			float2 uv_TexCoord667 = i.uv_texcoord + float2( 2,0.25 );
			float4 tex2DNode666 = tex2D( _Texture0, uv_TexCoord667 );
			float4 temp_output_761_0 = sign( tex2DNode666 );
			float4 lerpResult663 = lerp( _Window2 , _Window , (( _WindowGradient )?( tex2DNode666 ):( temp_output_761_0 )));
			float2 uv_TexCoord672 = i.uv_texcoord + float2( 2.75,0.25 );
			float4 tex2DNode668 = tex2D( _Texture0, uv_TexCoord672 );
			float4 temp_output_732_0 = sign( tex2DNode668 );
			float4 lerpResult669 = lerp( _Window_frame2 , _Window_frame , (( _Window_frameGradient )?( tex2DNode668 ):( temp_output_732_0 )));
			float4 lerpResult731 = lerp( lerpResult663 , lerpResult669 , temp_output_732_0);
			float2 uv_TexCoord677 = i.uv_texcoord + float2( 2.5,0.25 );
			float4 tex2DNode676 = tex2D( _Texture0, uv_TexCoord677 );
			float4 temp_output_749_0 = sign( tex2DNode676 );
			float4 lerpResult673 = lerp( _Window_rail2 , _Window_rail , (( _Window_railGradient )?( tex2DNode676 ):( temp_output_749_0 )));
			float2 uv_TexCoord682 = i.uv_texcoord + float2( 2.25,0.25 );
			float4 tex2DNode681 = tex2D( _Texture0, uv_TexCoord682 );
			float4 temp_output_734_0 = sign( tex2DNode681 );
			float4 lerpResult678 = lerp( _Window_decor2 , _Window_decor , (( _Window_decorGradient )?( tex2DNode681 ):( temp_output_734_0 )));
			float4 lerpResult733 = lerp( lerpResult673 , lerpResult678 , temp_output_734_0);
			float4 lerpResult750 = lerp( temp_output_749_0 , temp_output_734_0 , temp_output_734_0);
			float4 lerpResult748 = lerp( lerpResult731 , lerpResult733 , lerpResult750);
			float4 lerpResult762 = lerp( temp_output_761_0 , temp_output_732_0 , temp_output_732_0);
			float4 lerpResult769 = lerp( lerpResult762 , lerpResult750 , lerpResult750);
			float4 lerpResult760 = lerp( lerpResult743 , lerpResult748 , lerpResult769);
			float2 uv_TexCoord687 = i.uv_texcoord + float2( 3,0.5 );
			float4 tex2DNode686 = tex2D( _Texture0, uv_TexCoord687 );
			float4 temp_output_765_0 = sign( tex2DNode686 );
			float4 lerpResult683 = lerp( _Bottom_primary2 , _Bottom_primary , (( _Bottom_primaryGradient )?( tex2DNode686 ):( temp_output_765_0 )));
			float2 uv_TexCoord692 = i.uv_texcoord + float2( 2.75,0.5 );
			float4 tex2DNode691 = tex2D( _Texture0, uv_TexCoord692 );
			float4 temp_output_736_0 = sign( tex2DNode691 );
			float4 lerpResult688 = lerp( _Bottom_secondary2 , _Bottom_secondary , (( _Bottom_secondaryGradient )?( tex2DNode691 ):( temp_output_736_0 )));
			float4 lerpResult735 = lerp( lerpResult683 , lerpResult688 , temp_output_736_0);
			float2 uv_TexCoord697 = i.uv_texcoord + float2( 2.5,1.5 );
			float4 tex2DNode696 = tex2D( _Texture0, uv_TexCoord697 );
			float4 temp_output_753_0 = sign( tex2DNode696 );
			float4 lerpResult693 = lerp( _Bottom_roofing_a2 , _Bottom_roofing_a , (( _Bottom_roofing_aGradient )?( tex2DNode696 ):( temp_output_753_0 )));
			float2 uv_TexCoord702 = i.uv_texcoord + float2( 2.25,0.5 );
			float4 tex2DNode701 = tex2D( _Texture0, uv_TexCoord702 );
			float4 temp_output_737_0 = sign( tex2DNode701 );
			float4 lerpResult698 = lerp( _Bottom_roofing_b2 , _Bottom_roofing_b , (( _Bottom_roofing_bGradient )?( tex2DNode701 ):( temp_output_737_0 )));
			float4 lerpResult738 = lerp( lerpResult693 , lerpResult698 , temp_output_737_0);
			float4 lerpResult755 = lerp( temp_output_737_0 , temp_output_753_0 , temp_output_753_0);
			float4 lerpResult756 = lerp( lerpResult735 , lerpResult738 , lerpResult755);
			float2 uv_TexCoord707 = i.uv_texcoord + float2( 3,0.75 );
			float4 tex2DNode706 = tex2D( _Texture0, uv_TexCoord707 );
			float4 temp_output_767_0 = sign( tex2DNode706 );
			float4 lerpResult703 = lerp( _Corners2 , _Corners , (( _CornersGradient )?( tex2DNode706 ):( temp_output_767_0 )));
			float2 uv_TexCoord712 = i.uv_texcoord + float2( 3.75,0.75 );
			float4 tex2DNode711 = tex2D( _Texture0, uv_TexCoord712 );
			float4 temp_output_739_0 = sign( tex2DNode711 );
			float4 lerpResult708 = lerp( _Bonus_color_b2 , _Bonus_color_b , (( _Bonus_color_bGradient )?( tex2DNode711 ):( temp_output_739_0 )));
			float4 lerpResult740 = lerp( lerpResult703 , lerpResult708 , temp_output_739_0);
			float2 uv_TexCoord722 = i.uv_texcoord + float2( 3.5,0.75 );
			float4 tex2DNode721 = tex2D( _Texture0, uv_TexCoord722 );
			float4 temp_output_758_0 = sign( tex2DNode721 );
			float4 lerpResult718 = lerp( _Bonus_color_c2 , _Bonus_color_c , (( _Bonus_color_cGradient )?( tex2DNode721 ):( temp_output_758_0 )));
			float2 uv_TexCoord727 = i.uv_texcoord + float2( 2.25,0.75 );
			float4 tex2DNode726 = tex2D( _Texture0, uv_TexCoord727 );
			float4 temp_output_741_0 = sign( tex2DNode726 );
			float4 lerpResult723 = lerp( _Bonus_color_d2 , _Bonus_color_d , (( _Bonus_color_dGradient )?( tex2DNode726 ):( temp_output_741_0 )));
			float4 lerpResult742 = lerp( lerpResult718 , lerpResult723 , temp_output_741_0);
			float4 lerpResult757 = lerp( temp_output_741_0 , temp_output_758_0 , temp_output_758_0);
			float4 lerpResult759 = lerp( lerpResult740 , lerpResult742 , lerpResult757);
			float4 lerpResult768 = lerp( temp_output_767_0 , temp_output_739_0 , temp_output_739_0);
			float4 lerpResult770 = lerp( lerpResult768 , lerpResult757 , lerpResult757);
			float4 lerpResult771 = lerp( lerpResult756 , lerpResult759 , lerpResult770);
			float4 lerpResult766 = lerp( temp_output_765_0 , temp_output_736_0 , temp_output_736_0);
			float4 lerpResult773 = lerp( lerpResult766 , lerpResult755 , lerpResult755);
			float4 lerpResult774 = lerp( lerpResult773 , lerpResult770 , lerpResult770);
			float4 lerpResult772 = lerp( lerpResult760 , lerpResult771 , lerpResult774);
			float3 hsvTorgb820 = RGBToHSV( lerpResult772.rgb );
			float3 hsvTorgb821 = HSVToRGB( float3(( hsvTorgb820.x + _Hue ),( hsvTorgb820.y * _Saturation ),( hsvTorgb820.z + _Value )) );
			o.Albedo = hsvTorgb821;
			float4 lerpResult406 = lerp( float4( 0,0,0,0 ) , _Emmision1 , temp_output_763_0);
			float4 lerpResult422 = lerp( float4( 0,0,0,0 ) , _WindowEmission , temp_output_761_0);
			float4 lerpResult479 = lerp( (( _Enablepropemission1 )?( lerpResult406 ):( float4( 0,0,0,0 ) )) , (( _Enablewindowemmision )?( lerpResult422 ):( float4( 0,0,0,0 ) )) , (( _Enablewindowemmision )?( lerpResult422 ):( float4( 0,0,0,0 ) )));
			float4 lerpResult410 = lerp( float4( 0,0,0,0 ) , _Emmision2 , temp_output_638_0);
			float4 lerpResult498 = lerp( lerpResult479 , (( _Enablepropemission2 )?( lerpResult410 ):( float4( 0,0,0,0 ) )) , (( _Enablepropemission2 )?( lerpResult410 ):( float4( 0,0,0,0 ) )));
			float4 lerpResult414 = lerp( float4( 0,0,0,0 ) , _Emmision3 , temp_output_746_0);
			float4 lerpResult499 = lerp( lerpResult498 , (( _Enablepropemission3 )?( lerpResult414 ):( float4( 0,0,0,0 ) )) , (( _Enablepropemission3 )?( lerpResult414 ):( float4( 0,0,0,0 ) )));
			o.Emission = lerpResult499.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18703
41;293;2044;1086;9330.736;2128.981;7.166844;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;667;-3254.47,1591.087;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;682;-3165.234,3357.048;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.25,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;672;-3194.438,2165.078;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.75,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;637;-3253.869,-173.7499;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.75,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;677;-3165.635,2759.018;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.5,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;662;-3226.563,1009.525;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.25,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;697;-3153.567,5164.978;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.5,1.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;722;-3159.429,7603.38;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;3.5,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;657;-3235.501,417.0421;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.5,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;712;-3169.351,6995.001;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;3.75,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;687;-3191.8,3957.634;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;3,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;702;-3162.054,5780.277;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.25,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;707;-3153.681,6401.062;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;3,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;727;-3153.109,8206.574;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.25,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;304;-6185.646,2850.342;Inherit;True;Property;_Texture0;Texture 0;57;1;[HideInInspector];Create;True;0;0;False;0;False;b244e25c9803b6f4d94be225bf0b2516;b244e25c9803b6f4d94be225bf0b2516;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;692;-3190.928,4576.974;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2.75,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;305;-2970.187,-219.5582;Inherit;True;Property;_TextureSample1;Texture Sample 1;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;711;-2901.233,6971.363;Inherit;True;Property;_TextureSample32;Texture Sample 32;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;661;-2940.722,952.9821;Inherit;True;Property;_TextureSample22;Texture Sample 22;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;240;-3330.575,-925.5327;Inherit;True;Property;_TextureSample3;Texture Sample 3;36;1;[HideInInspector];Create;True;0;0;False;0;False;-1;9ae70525460f255438bfe68cba78ad67;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;668;-2926.319,2141.44;Inherit;True;Property;_TextureSample24;Texture Sample 24;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;656;-2931.66,374.4996;Inherit;True;Property;_TextureSample20;Texture Sample 20;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;681;-2897.116,3333.41;Inherit;True;Property;_TextureSample26;Texture Sample 26;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;691;-2927.289,4555.575;Inherit;True;Property;_TextureSample28;Texture Sample 28;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;696;-2872.449,5121.34;Inherit;True;Property;_TextureSample29;Texture Sample 29;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;726;-2883.427,8182.937;Inherit;True;Property;_TextureSample34;Texture Sample 34;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;721;-2893.176,7579.742;Inherit;True;Property;_TextureSample33;Texture Sample 33;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;686;-2925.682,3931.638;Inherit;True;Property;_TextureSample27;Texture Sample 27;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;706;-2873.455,6375.405;Inherit;True;Property;_TextureSample31;Texture Sample 31;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;666;-2928.576,1522.279;Inherit;True;Property;_TextureSample23;Texture Sample 23;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;701;-2895.293,5756.64;Inherit;True;Property;_TextureSample30;Texture Sample 30;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;676;-2897.517,2735.38;Inherit;True;Property;_TextureSample25;Texture Sample 25;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SignOpNode;730;-2459.327,876.3976;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;737;-2366.877,5743.34;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;749;-2368,2752;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;746;-2518.326,391.8609;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;734;-2362.847,3284.081;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;763;-2807.851,-819.9212;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;761;-2533.896,1505.381;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;758;-2365.143,7589.783;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;736;-2381.876,4545.142;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;741;-2343.446,8136.656;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;765;-2433.23,3948.02;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;767;-2341.916,6367.07;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;638;-2584.188,-225.76;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;739;-2371.947,6948.925;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;732;-2486.875,2132.85;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SignOpNode;753;-2476,5169;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;665;-2907.286,1154.645;Inherit;False;Property;_Window2;Window2;15;1;[HDR];Create;True;0;0;False;0;False;0.2924528,0.2924528,0.2924528,1;0.2924528,0.2924528,0.2924528,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;805;-2641.46,792.9252;Inherit;False;Property;_Roof_secondaryGradient;Roof_secondary Gradient;10;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;690;-2874.065,4350.514;Inherit;False;Property;_Bottom_secondary;Bottom_secondary;29;1;[HDR];Create;True;0;0;False;0;False;0.3607843,0.2627451,0.254902,1;0.1260235,0.1288485,0.1698113,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;804;-2575.882,249.2606;Inherit;False;Property;_Roof_primaryGradient;Roof_primary Gradient;7;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;689;-2885.411,4179.988;Inherit;False;Property;_Bottom_secondary2;Bottom_secondary2;30;1;[HDR];Create;True;0;0;False;0;False;0.1603774,0.06191638,0.0537113,1;0.1603774,0.06191638,0.0537113,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;780;-2690.443,-1099.854;Inherit;False;Property;_Color_primaryGradient;Color_primary Gradient;1;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;807;-2595.459,1956.055;Inherit;False;Property;_Window_frameGradient;Window_frame Gradient;16;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;808;-2566.937,2557.14;Inherit;False;Property;_Window_railGradient;Window_rail Gradient;19;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;803;-2606.813,-439.7986;Inherit;False;Property;_Color_secondaryGradient;Color_secondary Gradient;4;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;806;-2582.411,1372.406;Inherit;False;Property;_WindowGradient;Window Gradient ;13;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;684;-2883.804,3554.905;Inherit;False;Property;_Bottom_primary2;Bottom_primary2;27;1;[HDR];Create;True;0;0;False;0;False;0.2924528,0.1755023,0.1420879,1;0.2924528,0.1755023,0.1420879,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;815;-2580.479,6859.432;Inherit;False;Property;_Bonus_color_bGradient;Bonus_color_b Gradient;40;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;710;-2848.009,6765.302;Inherit;False;Property;_Bonus_color_b;Bonus_color_b;41;1;[HDR];Create;True;0;0;False;0;False;0.4,0.3686275,0.345098,1;0.4,0.3686275,0.345098,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;813;-2579.61,5637.704;Inherit;False;Property;_Bottom_roofing_bGradient;Bottom_roofing_b Gradient;34;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;700;-2842.07,5555.579;Inherit;False;Property;_Bottom_roofing_b;Bottom_roofing_b;35;1;[HDR];Create;True;0;0;False;0;False;0.6627451,0.4705883,0.4588236,1;0.1828052,0.3579181,0.3679245,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;812;-2559.303,4990.534;Inherit;False;Property;_Bottom_roofing_aGradient;Bottom_roofing_a Gradient;31;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;695;-2832.225,4936.279;Inherit;False;Property;_Bottom_roofing_a;Bottom_roofing_a;32;1;[HDR];Create;True;0;0;False;0;False;0.482353,0.3764706,0.3647059,1;0.6320754,0.6241248,0.6241248,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;694;-2843.571,4764.607;Inherit;False;Property;_Bottom_roofing_a2;Bottom_roofing_a2;33;1;[HDR];Create;True;0;0;False;0;False;0.1603774,0.05632995,0.04765932,1;0.1603774,0.05632995,0.04765932,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;810;-2573.045,3778.305;Inherit;False;Property;_Bottom_primaryGradient;Bottom_primary Gradient;25;0;Create;True;0;0;False;0;False;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;699;-2853.562,5379.906;Inherit;False;Property;_Bottom_roofing_b2;Bottom_roofing_b2;36;1;[HDR];Create;True;0;0;False;0;False;0.4716981,0.2263928,0.2113741,1;0.4716981,0.2263928,0.2113741,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;809;-2597.886,3185.021;Inherit;False;Property;_Window_decorGradient;Window_decor Gradient;22;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;811;-2603.045,4457.305;Inherit;False;Property;_Bottom_secondaryGradient;Bottom_secondary Gradient;28;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;664;-2877.423,1343.834;Inherit;False;Property;_Window;Window;14;1;[HDR];Create;True;0;0;False;0;False;0.8867924,0.8867924,0.8867924,1;0.8962264,0.8962264,0.8962264,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;814;-2521.573,6282.541;Inherit;False;Property;_CornersGradient;Corners Gradient;37;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;720;-2838.087,7374.681;Inherit;False;Property;_Bonus_color_c;Bonus_color_c;44;1;[HDR];Create;True;0;0;False;0;False;0.3490196,0.3921569,0.4,1;0.2481755,0.285287,0.3113208,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;674;-2854.493,2359.793;Inherit;False;Property;_Window_rail2;Window_rail2;21;1;[HDR];Create;True;0;0;False;0;False;0.482353,0.2392157,0.2235294,1;0.482353,0.2392157,0.2235294,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;652;-2948.897,-598.9269;Inherit;False;Property;_Color_secondary2;Color_secondary2;6;1;[HDR];Create;True;0;0;False;0;False;0.3018868,0.1295667,0.1039516,1;0.3018868,0.1295667,0.1039516,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;679;-2855.238,2956.677;Inherit;False;Property;_Window_decor2;Window_decor2;24;1;[HDR];Create;True;0;0;False;0;False;0.254902,0.07843138,0.0509804,1;0.254902,0.07843138,0.0509804,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;623;-2993.063,-1417.953;Float;False;Property;_Color_primary2;Color_primary2;3;1;[HDR];Create;True;0;0;False;0;False;0.1607843,0.08345432,0.05098039,1;0.1607843,0.08345432,0.05098039,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;816;-2577.432,7448.479;Inherit;False;Property;_Bonus_color_cGradient;Bonus_color_c Gradient;43;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;680;-2843.892,3128.349;Inherit;False;Property;_Window_decor;Window_decor;23;1;[HDR];Create;True;0;0;False;0;False;0.482353,0.2745098,0.2431373,1;0.2735849,0.0993681,0.1704102,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;651;-2919.033,-409.7373;Inherit;False;Property;_Color_secondary;Color_secondary;5;1;[HDR];Create;True;0;0;False;0;False;0.482353,0.172549,0.1254902,1;0.482353,0.172549,0.1254902,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;817;-2565.044,7965.647;Inherit;False;Property;_Bonus_color_dGradient;Bonus_color_d Gradient;46;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;655;-2928.37,-8.134895;Inherit;False;Property;_Roof_primary2;Roof_primary2;9;1;[HDR];Create;True;0;0;False;0;False;0.4056604,0.1931351,0.1779548,1;0.4056604,0.1931351,0.1779548,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;654;-2898.506,181.0547;Inherit;False;Property;_Roof_primary;Roof_primary;8;1;[HDR];Create;True;0;0;False;0;False;0.5647059,0.5058824,0.5019608,1;0.3726456,0.3408153,0.3867925,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;705;-2832.339,6172.362;Inherit;False;Property;_Corners;Corners;38;1;[HDR];Create;True;0;0;False;0;False;0.2392157,0.2509804,0.3058824,1;0.3607843,0.2627451,0.254902,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;659;-2889.568,774.5372;Inherit;False;Property;_Roof_secondary;Roof_secondary;11;1;[HDR];Create;True;0;0;False;0;False;0.6705883,0.6313726,0.5960785,1;0.6705883,0.6313726,0.5960785,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;670;-2873.096,1936.379;Inherit;False;Property;_Window_frame;Window_frame;17;1;[HDR];Create;True;0;0;False;0;False;0.4627451,0.4196079,0.4117647,1;0.1886792,0.1506586,0.1253115,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;660;-2919.432,584.3476;Inherit;False;Property;_Roof_secondary2;Roof_secondary2;12;1;[HDR];Create;True;0;0;False;0;False;0.5377358,0.3786568,0.2358935,1;0.5377358,0.3786568,0.2358935,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;624;-2987.028,-1250.158;Float;False;Property;_Color_primary;Color_primary;2;1;[HDR];Create;True;0;0;False;0;False;0.3098039,0.2078432,0.1764706,1;0.3098039,0.2078432,0.1764706,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;725;-2830.203,7977.875;Inherit;False;Property;_Bonus_color_d;Bonus_color_d;47;1;[HDR];Create;True;0;0;False;0;False;0.3882353,0.3529412,0.4,1;0.3882353,0.3529412,0.4,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;671;-2884.442,1764.707;Inherit;False;Property;_Window_frame2;Window_frame2;18;1;[HDR];Create;True;0;0;False;0;False;0.4056604,0.2388922,0.2085707,1;0.4056604,0.2388922,0.2085707,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;685;-2872.458,3724.577;Inherit;False;Property;_Bottom_primary;Bottom_primary;26;1;[HDR];Create;True;0;0;False;0;False;0.3098039,0.282353,0.2745098,1;0.255696,0.2618281,0.3207547,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;724;-2841.549,7806.203;Inherit;False;Property;_Bonus_color_d2;Bonus_color_d2;48;1;[HDR];Create;True;0;0;False;0;False;0.2083148,0.125712,0.2358491,1;0.2083148,0.125712,0.2358491,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;709;-2859.355,6594.63;Inherit;False;Property;_Bonus_color_b2;Bonus_color_b2;42;1;[HDR];Create;True;0;0;False;0;False;0.1981132,0.1313635,0.08130118,1;0.1981132,0.1313635,0.08130118,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;719;-2849.433,7203.009;Inherit;False;Property;_Bonus_color_c2;Bonus_color_c2;45;1;[HDR];Create;True;0;0;False;0;False;0.08650766,0.2030972,0.2264151,1;0.08650766,0.2030972,0.2264151,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;704;-2842.685,6000.69;Inherit;False;Property;_Corners2;Corners2;39;1;[HDR];Create;True;0;0;False;0;False;0.06666667,0.1019608,0.2470588,1;0.06666667,0.1019608,0.2470588,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;675;-2843.147,2530.319;Inherit;False;Property;_Window_rail;Window_rail;20;1;[HDR];Create;True;0;0;False;0;False;0.6235294,0.5333334,0.509804,1;0.3113208,0.2305536,0.2592992,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;718;-2424.931,7261.592;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;658;-2389.092,579.8564;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;650;-2382.495,-697.4429;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;703;-2419.183,6059.273;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;723;-2327.672,7845.489;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;688;-2460.909,4237.425;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;653;-2380.868,35.44896;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;698;-2385.914,5412.489;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;678;-2349.736,3011.26;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;683;-2320.302,3592.488;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;669;-2360.466,1741.684;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;693;-2419.069,4823.19;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;663;-2348.784,1155.228;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;625;-2330.444,-1375.875;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;673;-2298.137,2375.23;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;708;-2434.853,6653.213;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;740;-2034.775,6421.53;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;742;-2015.438,7539.092;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;762;-2057.264,1976.176;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;766;-2056.828,4522.43;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;750;-2048,3152;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;728;-2018.159,-842.2883;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;738;-2052.865,5128.79;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;757;-1972.69,7939.54;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;747;-2134.854,638.1977;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;729;-2045.547,168.8977;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;733;-2074.847,2724.082;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;755;-2038.027,5478.649;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;735;-2074.593,4108.831;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;768;-1976.578,6827.272;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;731;-2066.95,1464.4;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;403;-900.7568,-939.6703;Float;False;Property;_Emmision1;Emmision1;50;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;773;-1427.002,5678.182;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;748;-1532.129,2061.043;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;743;-1594.674,-142.0747;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;419;988.0336,-1022.057;Float;False;Property;_WindowEmission;WindowEmission;56;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;756;-1434.932,4858.85;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;770;-1493.457,7606.364;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;759;-1439.13,7093.163;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;769;-1521.699,2442.897;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;405;-249.2018,-930.3102;Float;False;Property;_Emmision2;Emmision2;52;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;422;1340.74,-807.7919;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;771;-827.3844,5803.099;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;774;-829.7231,6430.521;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;406;-608.0988,-751.2776;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;760;-807.5146,940.764;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;772;101.0766,3890.092;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;478;1160.625,208.8741;Inherit;True;Property;_Enablepropemission1;Enable prop emission 1;49;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;410;-162.5568,-432.5154;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;470;1184.561,-25.1816;Inherit;True;Property;_Enablewindowemmision;Enable window emmision;55;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;411;127.3073,-930.4078;Float;False;Property;_Emmision3;Emmision3;54;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;1,1,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;491;1183.925,455.2372;Inherit;True;Property;_Enablepropemission2;Enable prop emission 2;51;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;479;1936.188,-31.79683;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;414;456.4984,-612.3461;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;827;505.4083,3333.901;Inherit;False;Property;_Saturation;Saturation;60;0;Create;True;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;820;306.5617,3437.371;Inherit;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;822;437.6403,3211.256;Inherit;False;Property;_Hue;Hue;58;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;828;524.504,3645.704;Inherit;False;Property;_Value;Value;59;0;Create;True;0;0;False;0;False;0;0.19;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;497;1166.948,691.7553;Inherit;True;Property;_Enablepropemission3;Enable prop emission 3;53;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;824;866.5039,3295.704;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;825;861.5039,3135.704;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;826;860.5039,3466.704;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;498;2089.166,389.9433;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector2Node;610;12690.09,-3534.058;Inherit;False;Constant;_Vector2;Vector 2;28;0;Create;True;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;818;-3391.45,-1261.63;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;499;2060.69,756.2417;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;609;12705.07,-3361.69;Inherit;False;Constant;_Float3;Float 3;28;0;Create;True;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;613;12949.41,-3579.022;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;417;796.3716,-791.3793;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;776;-1278.803,1143.698;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;412;425.4673,-932.3414;Float;False;Constant;_Emmision4;Emmision4;27;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;0.5566037,0.4122018,0.4410822,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.HSVToRGBNode;821;1151.479,3437.199;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;775;-1522.863,556.7075;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;612;12835.13,-3358.721;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;764;-2112.372,-445.4798;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;819;-2394.139,-989.6071;Inherit;False;Property;_EnableGradient;EnableGradient;0;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;611;12671.07,-3720.468;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;835;373.4995,2698.577;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;833;599.896,2331.625;Inherit;True;Property;_Texture1;Texture 1;61;0;Create;True;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.LerpOp;834;1132.76,2596.798;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GradientNode;829;378.7924,2586.948;Inherit;False;0;2;2;0,0,0,0.001754788;1,1,1,1;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.GradientSampleNode;830;712.4991,2595.305;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;836;193.2103,2857.651;Inherit;False;Property;_Float0;Float 0;62;0;Create;True;0;0;False;0;False;0;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GradientSampleNode;615;13191.52,-3559.337;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;513;1396.62,3889.102;Float;False;True;-1;2;CustomGradientShaderGUI;0;0;Standard;Lichthund/FT Gradient4x4 ;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;305;0;304;0
WireConnection;305;1;637;0
WireConnection;711;0;304;0
WireConnection;711;1;712;0
WireConnection;661;0;304;0
WireConnection;661;1;662;0
WireConnection;240;0;304;0
WireConnection;668;0;304;0
WireConnection;668;1;672;0
WireConnection;656;0;304;0
WireConnection;656;1;657;0
WireConnection;681;0;304;0
WireConnection;681;1;682;0
WireConnection;691;0;304;0
WireConnection;691;1;692;0
WireConnection;696;0;304;0
WireConnection;696;1;697;0
WireConnection;726;0;304;0
WireConnection;726;1;727;0
WireConnection;721;0;304;0
WireConnection;721;1;722;0
WireConnection;686;0;304;0
WireConnection;686;1;687;0
WireConnection;706;0;304;0
WireConnection;706;1;707;0
WireConnection;666;0;304;0
WireConnection;666;1;667;0
WireConnection;701;0;304;0
WireConnection;701;1;702;0
WireConnection;676;0;304;0
WireConnection;676;1;677;0
WireConnection;730;0;661;0
WireConnection;737;0;701;0
WireConnection;749;0;676;0
WireConnection;746;0;656;0
WireConnection;734;0;681;0
WireConnection;763;0;240;0
WireConnection;761;0;666;0
WireConnection;758;0;721;0
WireConnection;736;0;691;0
WireConnection;741;0;726;0
WireConnection;765;0;686;0
WireConnection;767;0;706;0
WireConnection;638;0;305;0
WireConnection;739;0;711;0
WireConnection;732;0;668;0
WireConnection;753;0;696;0
WireConnection;805;0;730;0
WireConnection;805;1;661;0
WireConnection;804;0;746;0
WireConnection;804;1;656;0
WireConnection;780;0;763;0
WireConnection;780;1;240;0
WireConnection;807;0;732;0
WireConnection;807;1;668;0
WireConnection;808;0;749;0
WireConnection;808;1;676;0
WireConnection;803;0;638;0
WireConnection;803;1;305;0
WireConnection;806;0;761;0
WireConnection;806;1;666;0
WireConnection;815;0;739;0
WireConnection;815;1;711;0
WireConnection;813;0;737;0
WireConnection;813;1;701;0
WireConnection;812;0;753;0
WireConnection;812;1;696;0
WireConnection;810;0;765;0
WireConnection;810;1;686;0
WireConnection;809;0;734;0
WireConnection;809;1;681;0
WireConnection;811;0;736;0
WireConnection;811;1;691;0
WireConnection;814;0;767;0
WireConnection;814;1;706;0
WireConnection;816;0;758;0
WireConnection;816;1;721;0
WireConnection;817;0;741;0
WireConnection;817;1;726;0
WireConnection;718;0;719;0
WireConnection;718;1;720;0
WireConnection;718;2;816;0
WireConnection;658;0;660;0
WireConnection;658;1;659;0
WireConnection;658;2;805;0
WireConnection;650;0;652;0
WireConnection;650;1;651;0
WireConnection;650;2;803;0
WireConnection;703;0;704;0
WireConnection;703;1;705;0
WireConnection;703;2;814;0
WireConnection;723;0;724;0
WireConnection;723;1;725;0
WireConnection;723;2;817;0
WireConnection;688;0;689;0
WireConnection;688;1;690;0
WireConnection;688;2;811;0
WireConnection;653;0;655;0
WireConnection;653;1;654;0
WireConnection;653;2;804;0
WireConnection;698;0;699;0
WireConnection;698;1;700;0
WireConnection;698;2;813;0
WireConnection;678;0;679;0
WireConnection;678;1;680;0
WireConnection;678;2;809;0
WireConnection;683;0;684;0
WireConnection;683;1;685;0
WireConnection;683;2;810;0
WireConnection;669;0;671;0
WireConnection;669;1;670;0
WireConnection;669;2;807;0
WireConnection;693;0;694;0
WireConnection;693;1;695;0
WireConnection;693;2;812;0
WireConnection;663;0;665;0
WireConnection;663;1;664;0
WireConnection;663;2;806;0
WireConnection;625;0;623;0
WireConnection;625;1;624;0
WireConnection;625;2;780;0
WireConnection;673;0;674;0
WireConnection;673;1;675;0
WireConnection;673;2;808;0
WireConnection;708;0;709;0
WireConnection;708;1;710;0
WireConnection;708;2;815;0
WireConnection;740;0;703;0
WireConnection;740;1;708;0
WireConnection;740;2;739;0
WireConnection;742;0;718;0
WireConnection;742;1;723;0
WireConnection;742;2;741;0
WireConnection;762;0;761;0
WireConnection;762;1;732;0
WireConnection;762;2;732;0
WireConnection;766;0;765;0
WireConnection;766;1;736;0
WireConnection;766;2;736;0
WireConnection;750;0;749;0
WireConnection;750;1;734;0
WireConnection;750;2;734;0
WireConnection;728;0;625;0
WireConnection;728;1;650;0
WireConnection;728;2;638;0
WireConnection;738;0;693;0
WireConnection;738;1;698;0
WireConnection;738;2;737;0
WireConnection;757;0;741;0
WireConnection;757;1;758;0
WireConnection;757;2;758;0
WireConnection;747;0;746;0
WireConnection;747;1;730;0
WireConnection;747;2;730;0
WireConnection;729;0;653;0
WireConnection;729;1;658;0
WireConnection;729;2;730;0
WireConnection;733;0;673;0
WireConnection;733;1;678;0
WireConnection;733;2;734;0
WireConnection;755;0;737;0
WireConnection;755;1;753;0
WireConnection;755;2;753;0
WireConnection;735;0;683;0
WireConnection;735;1;688;0
WireConnection;735;2;736;0
WireConnection;768;0;767;0
WireConnection;768;1;739;0
WireConnection;768;2;739;0
WireConnection;731;0;663;0
WireConnection;731;1;669;0
WireConnection;731;2;732;0
WireConnection;773;0;766;0
WireConnection;773;1;755;0
WireConnection;773;2;755;0
WireConnection;748;0;731;0
WireConnection;748;1;733;0
WireConnection;748;2;750;0
WireConnection;743;0;728;0
WireConnection;743;1;729;0
WireConnection;743;2;747;0
WireConnection;756;0;735;0
WireConnection;756;1;738;0
WireConnection;756;2;755;0
WireConnection;770;0;768;0
WireConnection;770;1;757;0
WireConnection;770;2;757;0
WireConnection;759;0;740;0
WireConnection;759;1;742;0
WireConnection;759;2;757;0
WireConnection;769;0;762;0
WireConnection;769;1;750;0
WireConnection;769;2;750;0
WireConnection;422;1;419;0
WireConnection;422;2;761;0
WireConnection;771;0;756;0
WireConnection;771;1;759;0
WireConnection;771;2;770;0
WireConnection;774;0;773;0
WireConnection;774;1;770;0
WireConnection;774;2;770;0
WireConnection;406;1;403;0
WireConnection;406;2;763;0
WireConnection;760;0;743;0
WireConnection;760;1;748;0
WireConnection;760;2;769;0
WireConnection;772;0;760;0
WireConnection;772;1;771;0
WireConnection;772;2;774;0
WireConnection;478;1;406;0
WireConnection;410;1;405;0
WireConnection;410;2;638;0
WireConnection;470;1;422;0
WireConnection;491;1;410;0
WireConnection;479;0;478;0
WireConnection;479;1;470;0
WireConnection;479;2;470;0
WireConnection;414;1;411;0
WireConnection;414;2;746;0
WireConnection;820;0;772;0
WireConnection;497;1;414;0
WireConnection;824;0;820;2
WireConnection;824;1;827;0
WireConnection;825;0;820;1
WireConnection;825;1;822;0
WireConnection;826;0;820;3
WireConnection;826;1;828;0
WireConnection;498;0;479;0
WireConnection;498;1;491;0
WireConnection;498;2;491;0
WireConnection;818;0;305;0
WireConnection;818;1;240;0
WireConnection;818;2;763;0
WireConnection;499;0;498;0
WireConnection;499;1;497;0
WireConnection;499;2;497;0
WireConnection;613;0;611;0
WireConnection;613;1;610;0
WireConnection;613;2;612;0
WireConnection;417;1;412;0
WireConnection;417;2;730;0
WireConnection;776;0;775;0
WireConnection;776;1;761;0
WireConnection;776;2;761;0
WireConnection;821;0;825;0
WireConnection;821;1;824;0
WireConnection;821;2;826;0
WireConnection;775;0;764;0
WireConnection;775;1;747;0
WireConnection;775;2;747;0
WireConnection;612;0;609;0
WireConnection;764;0;763;0
WireConnection;764;1;638;0
WireConnection;764;2;638;0
WireConnection;819;0;240;0
WireConnection;835;1;836;0
WireConnection;834;0;830;1
WireConnection;834;1;830;4
WireConnection;830;0;829;0
WireConnection;830;1;835;0
WireConnection;615;1;613;0
WireConnection;513;0;821;0
WireConnection;513;2;499;0
ASEEND*/
//CHKSM=4A1DD5FCEA5AF80292587433F0543CB0F17E7F1A