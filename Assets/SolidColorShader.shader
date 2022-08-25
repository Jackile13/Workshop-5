//UNITY_SHADER_NO_UPGRADE

Shader "Unlit/SolidColorShader"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			uniform float4 _Color;

			struct vertIn
			{
				float4 vertex : POSITION;
				float4 vertCol : COLOR; // get vertex colour
			};

			struct vertOut
			{
				float4 vertex : SV_POSITION;
				float4 vertCol : COLOR;
			};

			// Implementation of the vertex shader
			vertOut vert(vertIn v)
			{
				vertOut o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.vertCol = v.vertCol; //???
				return o;
			}
			
			// Implementation of the fragment (pixel) shader
			fixed4 frag(vertOut v) : SV_Target
			{
				//return _Color;
				return v.vertCol;
			}
			ENDCG
		}
	}
}
