// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Texture with multiply"
{
	Properties
	{
		_Float6("Float 6", Float) = 1
		_suburbs_house_wall_A("suburbs_house_wall_A", 2D) = "white" {}
		_GradientHeight("GradientHeight", Range( 0 , 20)) = 6.4
		_Color0("Color 0", Color) = (0.9056604,0.9056604,0.9056604,0)
		_1color("1color", Color) = (0,0,0,0)
		_2color("2color", Color) = (1,1,1,0)
		_Gradientpower("Gradientpower", Range( 0 , 1)) = 0.542222
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
		};

		uniform float4 _1color;
		uniform float4 _2color;
		uniform float _GradientHeight;
		uniform float _Float6;
		uniform float _Gradientpower;
		uniform sampler2D _suburbs_house_wall_A;
		uniform float4 _suburbs_house_wall_A_ST;
		uniform float4 _Color0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float clampResult19 = clamp( ( ase_worldPos.y / _GradientHeight ) , 0.0 , _Float6 );
			float4 lerpResult22 = lerp( _1color , _2color , clampResult19);
			float4 temp_cast_0 = (_Gradientpower).xxxx;
			float4 temp_cast_1 = (0.0).xxxx;
			float4 temp_cast_2 = (_Float6).xxxx;
			float4 clampResult11 = clamp( pow( lerpResult22 , temp_cast_0 ) , temp_cast_1 , temp_cast_2 );
			float2 uv_suburbs_house_wall_A = i.uv_texcoord * _suburbs_house_wall_A_ST.xy + _suburbs_house_wall_A_ST.zw;
			float4 temp_output_3_0 = ( tex2D( _suburbs_house_wall_A, uv_suburbs_house_wall_A ) * _Color0 );
			o.Albedo = ( clampResult11 * temp_output_3_0 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18703
263;406;1654;1367;2664.919;527.9565;1.84744;True;False
Node;AmplifyShaderEditor.WorldPosInputsNode;15;-2150.175,297.7723;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;14;-2197.489,82.35256;Float;False;Property;_GradientHeight;GradientHeight;2;0;Create;True;0;0;False;0;False;6.4;0;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1900.679,618.2404;Float;False;Property;_Float6;Float 6;0;0;Create;True;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;17;-1873.012,309.2998;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-1883.521,525.5903;Float;False;Constant;_Float1;Float 1;-1;0;Create;True;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;19;-1613.229,337.1175;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;21;-1636.539,856.2084;Float;False;Property;_2color;2color;5;0;Create;True;0;0;False;0;False;1,1,1,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;20;-1649.233,662.7195;Float;False;Property;_1color;1color;4;0;Create;True;0;0;False;0;False;0,0,0,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;8;-1258.396,887.6094;Inherit;False;Property;_Gradientpower;Gradientpower;7;0;Create;True;0;0;False;0;False;0.542222;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;22;-1239.709,563.3984;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-1495.343,-440.574;Inherit;True;Property;_suburbs_house_wall_A;suburbs_house_wall_A;1;0;Create;True;0;0;False;0;False;-1;ac16c95ecfe74514e8c414574ac1b5ce;ac16c95ecfe74514e8c414574ac1b5ce;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;9;-919.1324,634.6682;Inherit;True;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;4;-1435.183,-243.9612;Inherit;False;Property;_Color0;Color 0;3;0;Create;True;0;0;False;0;False;0.9056604,0.9056604,0.9056604,0;0.9056604,0.9056604,0.9056604,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;11;-864.6273,295.4432;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-998.0095,-263.8739;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;12;-472.79,346.075;Inherit;False;Property;_ToggleSwitch0;Toggle Switch0;6;0;Create;True;0;0;False;0;False;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;2;-335.3562,150.0188;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-573.9916,-38.99923;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Texture with multiply;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;7;-394.1756,755.2646;Inherit;False;918;182;Final Clamp, you can disable it or rise the max value if you want to produce values higher than 1 for HDR;0;;1,1,1,1;0;0
WireConnection;17;0;15;2
WireConnection;17;1;14;0
WireConnection;19;0;17;0
WireConnection;19;1;18;0
WireConnection;19;2;16;0
WireConnection;22;0;20;0
WireConnection;22;1;21;0
WireConnection;22;2;19;0
WireConnection;9;0;22;0
WireConnection;9;1;8;0
WireConnection;11;0;9;0
WireConnection;11;1;18;0
WireConnection;11;2;16;0
WireConnection;3;0;1;0
WireConnection;3;1;4;0
WireConnection;12;0;3;0
WireConnection;12;1;11;0
WireConnection;23;0;11;0
WireConnection;23;1;3;0
WireConnection;0;0;23;0
ASEEND*/
//CHKSM=13D531851C19EEAF23C94ED2509D981DBD2E8FF2