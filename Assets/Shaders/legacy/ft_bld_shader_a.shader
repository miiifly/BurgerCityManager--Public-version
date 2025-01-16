// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/FT Shader Buildings"
{
	Properties
	{
		_Color_Primary("Color_Primary", Color) = (0.3098039,0.2078432,0.1764706,1)
		_Color_Secondary("Color_Secondary", Color) = (0.482353,0.172549,0.1254902,1)
		_Roof_primary("Roof_primary", Color) = (0.5647059,0.5058824,0.5019608,1)
		_Roof_Secondary("Roof_Secondary", Color) = (0.6705883,0.6313726,0.5960785,1)
		_Window("Window", Color) = (0.7764707,0.7607844,0.7568628,1)
		_Window_frame("Window_frame", Color) = (0.4627451,0.4196079,0.4117647,1)
		_Window_rail("Window_rail", Color) = (0.6235294,0.5333334,0.509804,1)
		_Window_decor("Window_decor", Color) = (0.482353,0.2745098,0.2431373,1)
		_Bottom_color_primary("Bottom_color_primary", Color) = (0.3098039,0.282353,0.2745098,1)
		_Bottom_color_secondary("Bottom_color_secondary", Color) = (0.3607843,0.2627451,0.254902,1)
		_Bottom_roofing_color_a("Bottom_roofing_color_a", Color) = (0.482353,0.3764706,0.3647059,1)
		_Bottom_roofing_color_b("Bottom_roofing_color_b", Color) = (0.6627451,0.4705883,0.4588236,1)
		_Corners("Corners", Color) = (0.2392157,0.2509804,0.3058824,1)
		_Bonus_color_b("Bonus_color_b", Color) = (0.4,0.3686275,0.345098,1)
		_Bonus_color_c("Bonus_color_c", Color) = (0.3490196,0.3921569,0.4,1)
		_Bonus_color_d("Bonus_color_d", Color) = (0.3882353,0.3529412,0.4,1)
		_Value("Value", Range( -1 , 1)) = 0
		_Saturation("Saturation", Range( 0 , 2)) = 1
		_Hue("Hue", Range( 0 , 1)) = 0
		[HideInInspector]_Texture0("Texture 0", 2D) = "white" {}
		[Toggle]_Enablepropemission1("Enable prop emission 1", Float) = 0
		[HDR]_Emmision1("Emmision1", Color) = (0,0,0,1)
		[Toggle]_Enablepropemission2("Enable prop emission 2", Float) = 0
		[HDR]_Emmision2("Emmision2", Color) = (0,0,0,1)
		[Toggle]_Enablepropemission3("Enable prop emission 3", Float) = 0
		[HDR]_Emmision3("Emmision3", Color) = (0,0,0,1)
		[Toggle]_Enablewindowemmision("Enable window emmision", Float) = 0
		[HDR]_WindowEmission("WindowEmission", Color) = (0,0,0,1)
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

		uniform float4 _Color_Primary;
		uniform sampler2D _Texture0;
		uniform float4 _Texture0_ST;
		uniform float4 _Color_Secondary;
		uniform float4 _Roof_primary;
		uniform float4 _Roof_Secondary;
		uniform float4 _Window;
		uniform float4 _Window_frame;
		uniform float4 _Window_rail;
		uniform float4 _Window_decor;
		uniform float4 _Bottom_color_primary;
		uniform float4 _Bottom_color_secondary;
		uniform float4 _Bottom_roofing_color_a;
		uniform float4 _Bottom_roofing_color_b;
		uniform float4 _Corners;
		uniform float4 _Bonus_color_b;
		uniform float4 _Bonus_color_c;
		uniform float4 _Bonus_color_d;
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
			float4 lerpResult35 = lerp( _Color_Primary , _Color_Primary , tex2D( _Texture0, uv_Texture0 ));
			float2 uv_TexCoord177 = i.uv_texcoord + float2( 1.75,0 );
			float4 lerpResult41 = lerp( lerpResult35 , _Color_Secondary , tex2D( _Texture0, uv_TexCoord177 ));
			float2 uv_TexCoord232 = i.uv_texcoord + float2( 1.5,0 );
			float4 lerpResult45 = lerp( lerpResult41 , _Roof_primary , tex2D( _Texture0, uv_TexCoord232 ));
			float2 uv_TexCoord235 = i.uv_texcoord + float2( 1.25,0 );
			float4 lerpResult132 = lerp( lerpResult45 , _Roof_Secondary , tex2D( _Texture0, uv_TexCoord235 ));
			float2 uv_TexCoord242 = i.uv_texcoord + float2( 2,0.25 );
			float4 tex2DNode243 = tex2D( _Texture0, uv_TexCoord242 );
			float4 lerpResult124 = lerp( lerpResult132 , _Window , tex2DNode243);
			float2 uv_TexCoord245 = i.uv_texcoord + float2( 1.75,0.25 );
			float4 lerpResult65 = lerp( lerpResult124 , _Window_frame , tex2D( _Texture0, uv_TexCoord245 ));
			float2 uv_TexCoord247 = i.uv_texcoord + float2( 1.5,0.25 );
			float4 lerpResult140 = lerp( lerpResult65 , _Window_rail , tex2D( _Texture0, uv_TexCoord247 ));
			float2 uv_TexCoord284 = i.uv_texcoord + float2( 1.25,0.25 );
			float4 lerpResult282 = lerp( lerpResult140 , _Window_decor , tex2D( _Texture0, uv_TexCoord284 ));
			float2 uv_TexCoord249 = i.uv_texcoord + float2( 2,0.5 );
			float4 lerpResult49 = lerp( lerpResult282 , _Bottom_color_primary , tex2D( _Texture0, uv_TexCoord249 ));
			float2 uv_TexCoord257 = i.uv_texcoord + float2( 1.75,0.5 );
			float4 lerpResult53 = lerp( lerpResult49 , _Bottom_color_secondary , tex2D( _Texture0, uv_TexCoord257 ));
			float2 uv_TexCoord259 = i.uv_texcoord + float2( 1.5,0.5 );
			float4 lerpResult57 = lerp( lerpResult53 , _Bottom_roofing_color_a , tex2D( _Texture0, uv_TexCoord259 ));
			float2 uv_TexCoord261 = i.uv_texcoord + float2( 1.25,0.5 );
			float4 lerpResult61 = lerp( lerpResult57 , _Bottom_roofing_color_b , tex2D( _Texture0, uv_TexCoord261 ));
			float2 uv_TexCoord263 = i.uv_texcoord + float2( 2,0.75 );
			float4 tex2DNode311 = tex2D( _Texture0, uv_TexCoord263 );
			float4 lerpResult271 = lerp( lerpResult61 , _Corners , tex2DNode311);
			float2 uv_TexCoord265 = i.uv_texcoord + float2( 1.75,0.75 );
			float4 tex2DNode312 = tex2D( _Texture0, uv_TexCoord265 );
			float4 lerpResult273 = lerp( lerpResult271 , _Bonus_color_b , tex2DNode312);
			float2 uv_TexCoord267 = i.uv_texcoord + float2( 1.5,0.75 );
			float4 tex2DNode313 = tex2D( _Texture0, uv_TexCoord267 );
			float4 lerpResult275 = lerp( lerpResult273 , _Bonus_color_c , tex2DNode313);
			float2 uv_TexCoord269 = i.uv_texcoord + float2( 1.25,0.75 );
			float4 tex2DNode314 = tex2D( _Texture0, uv_TexCoord269 );
			float4 lerpResult277 = lerp( lerpResult275 , _Bonus_color_d , tex2DNode314);
			float4 lerpResult323 = lerp( tex2DNode243 , tex2DNode311 , tex2DNode311);
			float4 lerpResult326 = lerp( tex2DNode312 , lerpResult323 , lerpResult323);
			float4 lerpResult328 = lerp( tex2DNode313 , lerpResult326 , lerpResult326);
			float4 lerpResult329 = lerp( tex2DNode314 , lerpResult328 , lerpResult328);
			float4 lerpResult330 = lerp( lerpResult277 , float4( 0,0,0,0 ) , lerpResult329);
			float3 hsvTorgb222 = RGBToHSV( lerpResult330.rgb );
			float3 hsvTorgb208 = HSVToRGB( float3(( hsvTorgb222.x + _Hue ),( hsvTorgb222.y * _Saturation ),( hsvTorgb222.z + _Value )) );
			float4 lerpResult327 = lerp( float4( 0,0,0,0 ) , _Window , tex2DNode243);
			float4 lerpResult333 = lerp( lerpResult327 , _Corners , tex2DNode311);
			float4 lerpResult334 = lerp( lerpResult333 , _Bonus_color_b , tex2DNode312);
			float4 lerpResult335 = lerp( lerpResult334 , _Bonus_color_c , tex2DNode313);
			float4 lerpResult336 = lerp( lerpResult335 , _Bonus_color_d , tex2DNode314);
			float4 lerpResult337 = lerp( float4( hsvTorgb208 , 0.0 ) , lerpResult336 , lerpResult329);
			o.Albedo = lerpResult337.rgb;
			float4 tex2DNode401 = tex2D( _Texture0, uv_Texture0 );
			float4 lerpResult406 = lerp( float4( 0,0,0,0 ) , _Emmision1 , tex2DNode401);
			float2 uv_TexCoord413 = i.uv_texcoord + float2( 2,0.25 );
			float4 lerpResult422 = lerp( float4( 0,0,0,0 ) , _WindowEmission , tex2D( _Texture0, uv_TexCoord413 ));
			float4 lerpResult479 = lerp( (( _Enablepropemission1 )?( lerpResult406 ):( float4( 0,0,0,0 ) )) , (( _Enablewindowemmision )?( lerpResult422 ):( float4( 0,0,0,0 ) )) , (( _Enablewindowemmision )?( lerpResult422 ):( float4( 0,0,0,0 ) )));
			float2 uv_TexCoord402 = i.uv_texcoord + float2( 1.75,0 );
			float4 tex2DNode407 = tex2D( _Texture0, uv_TexCoord402 );
			float4 lerpResult410 = lerp( float4( 0,0,0,0 ) , _Emmision2 , tex2DNode407);
			float4 lerpResult498 = lerp( lerpResult479 , (( _Enablepropemission2 )?( lerpResult410 ):( float4( 0,0,0,0 ) )) , (( _Enablepropemission2 )?( lerpResult410 ):( float4( 0,0,0,0 ) )));
			float2 uv_TexCoord404 = i.uv_texcoord + float2( 1.5,0 );
			float4 tex2DNode409 = tex2D( _Texture0, uv_TexCoord404 );
			float4 lerpResult414 = lerp( float4( 0,0,0,0 ) , _Emmision3 , tex2DNode409);
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
282.4;5.6;1384;1085.4;-1951.837;2930.064;5.020213;True;False
Node;AmplifyShaderEditor.TexturePropertyNode;304;725.3958,115.259;Inherit;True;Property;_Texture0;Texture 0;19;1;[HideInInspector];Create;True;0;0;False;0;False;9ae70525460f255438bfe68cba78ad67;9ae70525460f255438bfe68cba78ad67;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;240;-969.4407,-403.886;Inherit;True;Property;_TextureSample3;Texture Sample 3;36;1;[HideInInspector];Create;True;0;0;False;0;False;-1;9ae70525460f255438bfe68cba78ad67;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;280;-946.6578,-779.7117;Float;False;Property;_Color_Primary;Color_Primary;0;0;Create;True;0;0;False;0;False;0.3098039,0.2078432,0.1764706,1;0.3962264,0.2866811,0.2523139,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;177;-475.6637,-199.1149;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.75,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;281;-214.7218,-779.5095;Float;False;Property;_Color_Secondary;Color_Secondary;1;0;Create;True;0;0;False;0;False;0.482353,0.172549,0.1254902,1;0.3962264,0.1525565,0.1177465,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;35;-878.3479,-555.1052;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;232;-49.02237,-202.6359;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.5,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;305;-488.3535,-393.3693;Inherit;True;Property;_TextureSample1;Texture Sample 1;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;125;162.7818,-794.2881;Float;False;Property;_Roof_primary;Roof_primary;2;0;Create;True;0;0;False;0;False;0.5647059,0.5058824,0.5019608,1;0.5188678,0.2118901,0.1982467,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;235;259.5266,-214.1765;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.25,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;233;-89.52573,-416.7451;Inherit;True;Property;_TextureSample0;Texture Sample 0;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;41;-116.5211,-592.4328;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;63;455.0549,-798.6685;Float;False;Property;_Roof_Secondary;Roof_Secondary;3;0;Create;True;0;0;False;0;False;0.6705883,0.6313726,0.5960785,1;0.5566037,0.4122018,0.4410822,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;242;564.0166,-214.0325;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;234;249.4688,-429.7027;Inherit;True;Property;_TextureSample2;Texture Sample 2;24;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;45;193.4071,-599.6735;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;243;521.4781,-410.4557;Inherit;True;Property;_TextureSample4;Texture Sample 4;21;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;44;765.2347,-819.2604;Float;False;Property;_Window;Window;4;0;Create;True;0;0;False;0;False;0.7764707,0.7607844,0.7568628,1;0.6981132,0.6981132,0.6981132,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;245;849.5641,-225.9106;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.75,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;132;508.0734,-605.6628;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;244;848.9307,-439.7294;Inherit;True;Property;_TextureSample5;Texture Sample 5;20;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;247;1135.197,-225.7412;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.5,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;124;827.8672,-625.774;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;33;1087.325,-873.8165;Float;False;Property;_Window_frame;Window_frame;5;0;Create;True;0;0;False;0;False;0.4627451,0.4196079,0.4117647,1;0.462745,0.4196078,0.4117647,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;40;1352.642,-865.2487;Float;False;Property;_Window_rail;Window_rail;6;0;Create;True;0;0;False;0;False;0.6235294,0.5333334,0.509804,1;0.6235294,0.5333334,0.5098039,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;284;1447.376,-244.1987;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.25,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;65;1115.362,-650.7922;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;246;1132.745,-465.6657;Inherit;True;Property;_TextureSample6;Texture Sample 6;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;249;1745.311,-233.8882;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;140;1385.435,-661.6415;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;315;1655.906,-880.9449;Float;False;Property;_Window_decor;Window_decor;7;0;Create;True;0;0;False;0;False;0.482353,0.2745098,0.2431373,1;0.482353,0.2745098,0.2431373,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;306;1416.532,-468.2242;Inherit;True;Property;_TextureSample7;Texture Sample 7;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;139;1935.808,-921.5742;Float;False;Property;_Bottom_color_primary;Bottom_color_primary;8;0;Create;True;0;0;False;0;False;0.3098039,0.282353,0.2745098,1;0.3098039,0.282353,0.2745098,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;257;2060.422,-236.0319;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.75,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;307;1693.415,-478.8437;Inherit;True;Property;_TextureSample8;Texture Sample 8;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;282;1686.482,-698.1376;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;259;2370.194,-245.8873;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.5,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;308;1997.454,-486.8226;Inherit;True;Property;_TextureSample9;Texture Sample 9;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;56;2295.188,-918.1037;Float;False;Property;_Bottom_color_secondary;Bottom_color_secondary;9;0;Create;True;0;0;False;0;False;0.3607843,0.2627451,0.254902,1;0.3607843,0.2627451,0.254902,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;49;2001.86,-671.736;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;53;2338.32,-683.8857;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;68;2607.367,-878.7502;Float;False;Property;_Bottom_roofing_color_a;Bottom_roofing_color_a;10;0;Create;True;0;0;False;0;False;0.482353,0.3764706,0.3647059,1;0.482353,0.3764706,0.3647059,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;261;2620.583,-223.8012;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.25,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;309;2321.4,-509.0637;Inherit;True;Property;_TextureSample10;Texture Sample 10;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;57;2656.9,-686.2103;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;310;2645.524,-507.477;Inherit;True;Property;_TextureSample11;Texture Sample 11;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;270;2895.341,-880.6045;Float;False;Property;_Bottom_roofing_color_b;Bottom_roofing_color_b;11;0;Create;True;0;0;False;0;False;0.6627451,0.4705883,0.4588236,1;0.6627451,0.4705883,0.4588236,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;263;2987.682,-241.1965;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;265;3294.915,-234.4358;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.75,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;272;3202.36,-883.9761;Float;False;Property;_Corners;Corners;12;0;Create;True;0;0;False;0;False;0.2392157,0.2509804,0.3058824,1;0.2392157,0.2509804,0.3058824,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;61;2964.565,-690.1747;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;311;2927.383,-477.3294;Inherit;True;Property;_TextureSample12;Texture Sample 12;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;274;3575.329,-924.3108;Float;False;Property;_Bonus_color_b;Bonus_color_b;13;0;Create;True;0;0;False;0;False;0.4,0.3686275,0.345098,1;0.4,0.3686275,0.345098,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;271;3239.387,-685.5458;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;323;2724.405,229.6309;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;267;3633.487,-255.7467;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.5,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;312;3221.589,-494.4054;Inherit;True;Property;_TextureSample13;Texture Sample 13;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;326;3164.583,245.292;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;273;3586.162,-701.3119;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;276;3937.144,-976.0186;Float;False;Property;_Bonus_color_c;Bonus_color_c;14;0;Create;True;0;0;False;0;False;0.3490196,0.3921569,0.4,1;0.3490196,0.3921569,0.4,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;313;3584.042,-510.3222;Inherit;True;Property;_TextureSample14;Texture Sample 14;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;269;3949.083,-207.4495;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.25,0.75;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;413;1388.011,1862.399;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;2,0.25;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;314;3940.684,-480.3829;Inherit;True;Property;_TextureSample15;Texture Sample 15;29;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;328;3456.894,256.2187;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;275;3973.488,-641.2471;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;286;4312.683,-981.5098;Float;False;Property;_Bonus_color_d;Bonus_color_d;15;0;Create;True;0;0;False;0;False;0.3882353,0.3529412,0.4,1;0.3882353,0.3529412,0.4,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;327;2456.941,646.0594;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;277;4356.628,-635.3619;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;329;3893.738,186.4013;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;402;178.1248,1995.201;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.75,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;472;1672.132,1584.262;Inherit;True;Property;_TextureSample21;Texture Sample 21;24;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;401;-111.1832,1690.226;Inherit;True;Property;_TextureSample16;Texture Sample 16;36;1;[HideInInspector];Create;True;0;0;False;0;False;-1;9ae70525460f255438bfe68cba78ad67;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;403;-163.3913,1219.827;Float;False;Property;_Emmision1;Emmision1;21;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;0.3962264,0.2866811,0.2523139,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;419;1776.62,1097.956;Float;False;Property;_WindowEmission;WindowEmission;27;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;0.6981132,0.6981132,0.6981132,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;330;4801.39,-342.8572;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;405;539.3846,1189.703;Float;False;Property;_Emmision2;Emmision2;23;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;0.3962264,0.1525565,0.1177465,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;333;3139.937,634.7633;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;422;2129.327,1312.221;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;407;446.8134,1610.098;Inherit;True;Property;_TextureSample17;Texture Sample 17;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;406;200.4462,1398.405;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;404;568.0652,1891.362;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.5,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;409;845.6415,1586.722;Inherit;True;Property;_TextureSample18;Texture Sample 18;10;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;410;802.58,1443.168;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;470;3632.574,1538.076;Inherit;True;Property;_Enablewindowemmision;Enable window emmision;26;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;411;915.8938,1189.605;Float;False;Property;_Emmision3;Emmision3;25;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;0.5188678,0.2118901,0.1982467,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;478;3610.349,1772.132;Inherit;True;Property;_Enablepropemission1;Enable prop emission 1;20;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;223;5727.808,-487.1131;Float;False;Property;_Saturation;Saturation;17;0;Create;True;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;5737.545,-622.9182;Float;False;Property;_Hue;Hue;18;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;5702.692,-146.1731;Float;False;Property;_Value;Value;16;0;Create;True;0;0;False;0;False;0;0.54;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;222;5168,-512;Inherit;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;334;3578.327,554.3092;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;335;4086.438,506.3026;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;226;6014.907,-291.8135;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;491;3633.649,2018.495;Inherit;True;Property;_Enablepropemission2;Enable prop emission 2;22;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;230;6011.167,-509.284;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;479;4413.911,1542.461;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;414;1128.574,1403.794;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;219;6018.663,-640.8514;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;336;4629.65,482.6467;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.HSVToRGBNode;208;6304,-640;Inherit;True;3;0;FLOAT;0.32;False;1;FLOAT;0.53;False;2;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;497;3616.671,2255.013;Inherit;True;Property;_Enablepropemission3;Enable prop emission 3;24;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;498;4538.889,1953.201;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;415;1184.636,1573.765;Inherit;True;Property;_TextureSample19;Texture Sample 19;24;1;[HideInInspector];Create;True;0;0;False;0;False;-1;None;9ae70525460f255438bfe68cba78ad67;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;417;1443.241,1397.805;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;474;743.8241,2562.839;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;476;1519.285,2563.76;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;412;1214.054,1187.672;Float;False;Constant;_Emmision4;Emmision4;27;1;[HDR];Create;True;0;0;False;0;False;0,0,0,1;0.5566037,0.4122018,0.4410822,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;499;4510.414,2319.499;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;227;5148.467,-132.7293;Float;False;Constant;_Float4;Float 4;17;0;Create;True;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;337;6413.981,-82.98388;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;475;1114.198,2560.384;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;408;929.4431,1898.714;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;1.25,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;513;7187.485,-556.1188;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lichthund/FT Shader Buildings;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;240;0;304;0
WireConnection;35;0;280;0
WireConnection;35;1;280;0
WireConnection;35;2;240;0
WireConnection;305;0;304;0
WireConnection;305;1;177;0
WireConnection;233;0;304;0
WireConnection;233;1;232;0
WireConnection;41;0;35;0
WireConnection;41;1;281;0
WireConnection;41;2;305;0
WireConnection;234;0;304;0
WireConnection;234;1;235;0
WireConnection;45;0;41;0
WireConnection;45;1;125;0
WireConnection;45;2;233;0
WireConnection;243;0;304;0
WireConnection;243;1;242;0
WireConnection;132;0;45;0
WireConnection;132;1;63;0
WireConnection;132;2;234;0
WireConnection;244;0;304;0
WireConnection;244;1;245;0
WireConnection;124;0;132;0
WireConnection;124;1;44;0
WireConnection;124;2;243;0
WireConnection;65;0;124;0
WireConnection;65;1;33;0
WireConnection;65;2;244;0
WireConnection;246;0;304;0
WireConnection;246;1;247;0
WireConnection;140;0;65;0
WireConnection;140;1;40;0
WireConnection;140;2;246;0
WireConnection;306;0;304;0
WireConnection;306;1;284;0
WireConnection;307;0;304;0
WireConnection;307;1;249;0
WireConnection;282;0;140;0
WireConnection;282;1;315;0
WireConnection;282;2;306;0
WireConnection;308;0;304;0
WireConnection;308;1;257;0
WireConnection;49;0;282;0
WireConnection;49;1;139;0
WireConnection;49;2;307;0
WireConnection;53;0;49;0
WireConnection;53;1;56;0
WireConnection;53;2;308;0
WireConnection;309;0;304;0
WireConnection;309;1;259;0
WireConnection;57;0;53;0
WireConnection;57;1;68;0
WireConnection;57;2;309;0
WireConnection;310;0;304;0
WireConnection;310;1;261;0
WireConnection;61;0;57;0
WireConnection;61;1;270;0
WireConnection;61;2;310;0
WireConnection;311;0;304;0
WireConnection;311;1;263;0
WireConnection;271;0;61;0
WireConnection;271;1;272;0
WireConnection;271;2;311;0
WireConnection;323;0;243;0
WireConnection;323;1;311;0
WireConnection;323;2;311;0
WireConnection;312;0;304;0
WireConnection;312;1;265;0
WireConnection;326;0;312;0
WireConnection;326;1;323;0
WireConnection;326;2;323;0
WireConnection;273;0;271;0
WireConnection;273;1;274;0
WireConnection;273;2;312;0
WireConnection;313;0;304;0
WireConnection;313;1;267;0
WireConnection;314;0;304;0
WireConnection;314;1;269;0
WireConnection;328;0;313;0
WireConnection;328;1;326;0
WireConnection;328;2;326;0
WireConnection;275;0;273;0
WireConnection;275;1;276;0
WireConnection;275;2;313;0
WireConnection;327;1;44;0
WireConnection;327;2;243;0
WireConnection;277;0;275;0
WireConnection;277;1;286;0
WireConnection;277;2;314;0
WireConnection;329;0;314;0
WireConnection;329;1;328;0
WireConnection;329;2;328;0
WireConnection;472;0;304;0
WireConnection;472;1;413;0
WireConnection;401;0;304;0
WireConnection;330;0;277;0
WireConnection;330;2;329;0
WireConnection;333;0;327;0
WireConnection;333;1;272;0
WireConnection;333;2;311;0
WireConnection;422;1;419;0
WireConnection;422;2;472;0
WireConnection;407;0;304;0
WireConnection;407;1;402;0
WireConnection;406;1;403;0
WireConnection;406;2;401;0
WireConnection;409;0;304;0
WireConnection;409;1;404;0
WireConnection;410;1;405;0
WireConnection;410;2;407;0
WireConnection;470;1;422;0
WireConnection;478;1;406;0
WireConnection;222;0;330;0
WireConnection;334;0;333;0
WireConnection;334;1;274;0
WireConnection;334;2;312;0
WireConnection;335;0;334;0
WireConnection;335;1;276;0
WireConnection;335;2;313;0
WireConnection;226;0;222;3
WireConnection;226;1;225;0
WireConnection;491;1;410;0
WireConnection;230;0;222;2
WireConnection;230;1;223;0
WireConnection;479;0;478;0
WireConnection;479;1;470;0
WireConnection;479;2;470;0
WireConnection;414;1;411;0
WireConnection;414;2;409;0
WireConnection;219;0;222;1
WireConnection;219;1;220;0
WireConnection;336;0;335;0
WireConnection;336;1;286;0
WireConnection;336;2;314;0
WireConnection;208;0;219;0
WireConnection;208;1;230;0
WireConnection;208;2;226;0
WireConnection;497;1;414;0
WireConnection;498;0;479;0
WireConnection;498;1;491;0
WireConnection;498;2;491;0
WireConnection;415;0;304;0
WireConnection;415;1;408;0
WireConnection;417;1;412;0
WireConnection;417;2;415;0
WireConnection;474;0;407;0
WireConnection;474;1;401;0
WireConnection;474;2;401;0
WireConnection;476;0;415;0
WireConnection;476;1;475;0
WireConnection;476;2;475;0
WireConnection;499;0;498;0
WireConnection;499;1;497;0
WireConnection;499;2;497;0
WireConnection;337;0;208;0
WireConnection;337;1;336;0
WireConnection;337;2;329;0
WireConnection;475;0;474;0
WireConnection;475;1;409;0
WireConnection;475;2;409;0
WireConnection;513;0;337;0
WireConnection;513;2;499;0
ASEEND*/
//CHKSM=48FE146EC8687BB4907040086ADDD5ACC61FBE43