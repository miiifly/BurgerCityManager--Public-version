// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Lichthund/FlagShader"
{
	Properties
	{
		_Amplitude("Amplitude", Range( 0 , 10)) = 0
		_Float0("Float 0", Float) = 2.81
		_Frequency("Frequency", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		uniform float _Frequency;
		uniform float _Float0;
		uniform float _Amplitude;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 break3_g52 = ase_vertex3Pos;
			float frequency291 = _Frequency;
			float mulTime4_g52 = _Time.y * 3.0;
			float amplitude287 = _Amplitude;
			float3 appendResult11_g52 = (float3(break3_g52.x , ( break3_g52.y + ( ( ( sin( ( ( break3_g52.x * frequency291 ) + mulTime4_g52 ) ) * v.texcoord.xy.x ) * _Float0 ) * ( amplitude287 * v.texcoord.xy.x ) ) ) , break3_g52.z));
			float3 newVertexPos56 = appendResult11_g52;
			float3 temp_output_109_0 = newVertexPos56;
			v.vertex.xyz = temp_output_109_0;
			v.vertex.w = 1;
			float3 ase_vertexNormal = v.normal.xyz;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float dotResult351 = dot( ase_worldViewDir , ase_worldNormal );
			float3 lerpResult356 = lerp( ase_vertexNormal , -ase_vertexNormal , step( dotResult351 , 0.0 ));
			v.normal = lerpResult356;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color344 = IsGammaSpace() ? float4(0.7924528,0.732771,0.6840513,1) : float4(0.5911142,0.4960827,0.4256113,1);
			o.Albedo = color344.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18909
188;277;1920;1091;1142.824;837.0929;2.179646;True;False
Node;AmplifyShaderEditor.CommentaryNode;295;-2853.043,-482.4444;Inherit;False;645.3955;379.0187;Comment;6;130;199;127;291;112;287;Inputs;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-2800,-416;Float;False;Property;_Amplitude;Amplitude;0;0;Create;True;0;0;0;False;0;False;0;0.19;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;287;-2480,-416;Float;False;amplitude;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;77;-1568,-1184;Inherit;False;959.9028;475.1613;simply apply vertex transformation;6;56;15;306;294;290;307;new vertex position;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-2688,-320;Float;False;Property;_Frequency;Frequency;3;0;Create;True;0;0;0;False;0;False;0;1.23;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;307;-1472,-880;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;290;-1456,-960;Inherit;False;287;amplitude;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;291;-2480,-320;Float;False;frequency;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;349;1186.637,173.3302;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;306;-1232,-960;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;348;1130.637,-45.66962;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;294;-1332.203,-1039.546;Inherit;False;291;frequency;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;15;-1520,-1104;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;368;-1056,-1104;Inherit;False;Waving Vertex;1;;52;872b3757863bb794c96291ceeebfb188;0;3;1;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;352;1529.637,214.3301;Inherit;False;Constant;_Float0;Float 0;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;350;1130.637,-235.6697;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;351;1370.637,22.3304;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;355;1628.637,41.33034;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;318;836.6996,-1002.23;Inherit;False;461.3383;368.4299;Fix normals for back side faces;3;315;317;316;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;297;70.38629,2.700036;Inherit;False;927.4102;507.1851;calculated new normal by derivation;8;223;107;224;108;88;93;96;97;new normal;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;354;1483.637,-226.6697;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;177;-1568,-528;Inherit;False;1562.402;582.1888;move the position in tangent X direction by the deviation amount;13;308;289;309;113;197;293;196;195;198;194;192;200;201;delta X position;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;296;-3621.198,212.0746;Inherit;False;1078.618;465.5402;object to tangent matrix without tangent sign;5;116;121;125;118;117;Object to tangent matrix;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;56;-832,-1104;Float;False;newVertexPos;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;353;1434.637,-130.6696;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;202;-1552,192;Inherit;False;1552.676;586.3004;move the position in tangent Y direction by the deviation amount;13;311;310;114;292;210;288;209;208;206;207;205;203;204;delta Y position;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;322;-26.80864,-1016.157;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;88;392.0204,112.9005;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;-1072,-224;Inherit;False;121;ObjectToTangent;1;0;OBJECT;;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;197;-736,-368;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;310;-592,528;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;305;626.4396,-1230.982;Inherit;True;Property;_Flagalbedo;Flag albedo;5;0;Create;True;0;0;0;False;0;False;-1;None;8aba6bb20faf8824d9d81946542f1ce1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;93;392.0204,288.9005;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;289;-768,-176;Inherit;False;287;amplitude;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;325;373.354,-825.0952;Inherit;False;Constant;_Float0;Float 0;4;0;Create;True;0;0;0;False;0;False;3.81;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;97;808.0211,192.9006;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;108;120.0204,368.9003;Inherit;False;56;newVertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;288;-800,560;Inherit;False;287;amplitude;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;-784,368;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;205;-1472,496;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;201;-1472,-208;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;209;-1024,368;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;200;-1472,-432;Inherit;False;199;deviation;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;317;852.6996,-794.2304;Float;False;Constant;_Backnormalvector;Back normal vector;4;0;Create;True;0;0;0;False;0;False;0,0,-1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;198;-1216,-416;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;223;120.0204,96.90045;Inherit;False;113;xDeviation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;192;-1511.005,-316.4977;Inherit;False;121;ObjectToTangent;1;0;OBJECT;;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;309;-784,-96;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CrossProductOpNode;96;584.021,192.9006;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;117;-3565.198,513.2958;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;204;-1504,400;Inherit;False;121;ObjectToTangent;1;0;OBJECT;;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.CrossProductOpNode;125;-3222.62,305.6892;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;199;-2480,-224;Float;False;deviation;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TangentVertexDataNode;118;-3574.62,369.6892;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;367;-432,-368;Inherit;False;Waving Vertex;1;;55;872b3757863bb794c96291ceeebfb188;0;3;1;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode;324;641.9579,-826.3635;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.MatrixFromVectors;116;-3046.62,337.6892;Inherit;False;FLOAT3x3;True;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.GetLocalVarNode;208;-1072,528;Inherit;False;121;ObjectToTangent;1;0;OBJECT;;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.RangedFloatNode;130;-2800,-224;Float;False;Property;_Normalpositiondeviation;Normal position deviation;4;0;Create;True;0;0;0;False;0;False;0.1;0.132;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;308;-560,-192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;327;614.163,-412.6766;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;366;-480,368;Inherit;False;Waving Vertex;1;;54;872b3757863bb794c96291ceeebfb188;0;3;1;FLOAT3;0,0,0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;19;1340.181,-671.6465;Float;False;Constant;_Smoothness;Smoothness;0;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;292;-800,480;Inherit;False;291;frequency;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;206;-1216,320;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;326;863.285,-417.0507;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;344;1423.147,-1114.769;Inherit;False;Constant;_Color0;Color 0;4;0;Create;True;0;0;0;False;0;False;0.7924528,0.732771,0.6840513,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;224;120.0204,288.9005;Inherit;False;114;yDeviation;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;203;-1456,288;Inherit;False;199;deviation;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;109;160.0528,-649.8487;Inherit;True;56;newVertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;113;-240,-368;Float;False;xDeviation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;195;-1024,-368;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;356;1640.637,-122.6697;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;107;120.3863,169.3669;Inherit;False;56;newVertexPos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;293;-768,-256;Inherit;False;291;frequency;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;114;-240,368;Float;False;yDeviation;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;316;852.6996,-954.2304;Float;False;Constant;_Frontnormalvector;Front normal vector;4;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;121;-2790.62,337.6892;Float;False;ObjectToTangent;-1;True;1;0;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3x3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;311;-800,640;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;207;-1216,448;Inherit;False;2;2;0;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwitchByFaceNode;315;1140.699,-874.2304;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;194;-1216,-288;Inherit;False;2;2;0;FLOAT3x3;0,0,0,1,1,1,1,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;404;1813.286,-779.8176;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Lichthund/FlagShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;16;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Absolute;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;287;0;112;0
WireConnection;291;0;127;0
WireConnection;306;0;290;0
WireConnection;306;1;307;1
WireConnection;368;1;15;0
WireConnection;368;12;294;0
WireConnection;368;13;306;0
WireConnection;351;0;348;0
WireConnection;351;1;349;0
WireConnection;355;0;351;0
WireConnection;355;1;352;0
WireConnection;354;0;350;0
WireConnection;56;0;368;0
WireConnection;353;0;350;0
WireConnection;88;0;223;0
WireConnection;88;1;107;0
WireConnection;197;0;195;0
WireConnection;197;1;196;0
WireConnection;310;0;288;0
WireConnection;310;1;311;1
WireConnection;93;0;224;0
WireConnection;93;1;108;0
WireConnection;97;0;96;0
WireConnection;210;0;209;0
WireConnection;210;1;208;0
WireConnection;209;0;206;0
WireConnection;209;1;207;0
WireConnection;198;0;200;0
WireConnection;96;0;93;0
WireConnection;96;1;88;0
WireConnection;125;0;117;0
WireConnection;125;1;118;0
WireConnection;199;0;130;0
WireConnection;367;1;197;0
WireConnection;367;12;293;0
WireConnection;367;13;308;0
WireConnection;324;0;322;2
WireConnection;324;1;325;0
WireConnection;116;0;125;0
WireConnection;116;1;118;0
WireConnection;116;2;117;0
WireConnection;308;0;289;0
WireConnection;308;1;309;1
WireConnection;366;1;210;0
WireConnection;366;12;292;0
WireConnection;366;13;310;0
WireConnection;206;1;203;0
WireConnection;326;0;109;0
WireConnection;326;1;327;0
WireConnection;113;0;367;0
WireConnection;195;0;198;0
WireConnection;195;1;194;0
WireConnection;356;0;354;0
WireConnection;356;1;353;0
WireConnection;356;2;355;0
WireConnection;114;0;366;0
WireConnection;121;0;116;0
WireConnection;207;0;204;0
WireConnection;207;1;205;0
WireConnection;315;0;316;0
WireConnection;315;1;317;0
WireConnection;194;0;192;0
WireConnection;194;1;201;0
WireConnection;404;0;344;0
WireConnection;404;11;109;0
WireConnection;404;12;356;0
ASEEND*/
//CHKSM=DF3B4B8B26D8217C9178A37004E76AB2AEF3AB6A