Shader "Custom/Shadows"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _Color ("Main Color", Color) = (1,1,1,1)
        _ShadowTex ("Shadow Texture", 2D) = "white" {}
        _ShadowCol ("Shadow Color", Color) = (1,1,1,1)
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader{
        
        Pass
        {
            Tags {"LightMode" = "ForwardBase" "Queue" = "Transparent"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase nolightmap nodirlightmap nodynlightmap novertexlight
            #include "UnityCG.cginc"
            #include "UnityLightingCommon.cginc"
        
            #include "Lighting.cginc"
            #include "AutoLight.cginc"
			
            struct appdata{
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f{
                float2 uv : TEXCOORD0;
                fixed4 diff : COLOR0;
                float4 pos : SV_POSITION;
                SHADOW_COORDS(1)
            //SHADOW COORDS
            };

            v2f vert(appdata v){
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.texcoord;

                half3 worldNormal = UnityObjectToWorldNormal(v.normal);
                half nl = max(0, dot(worldNormal, _WorldSpaceLightPos0.xyz));
                o.diff = nl * _LightColor0;
                TRANSFER_SHADOW(o);

                return o;
            }

            sampler2D _MainTex;
            float4 _Color;
            float4 _ShadowCol;

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 objectColor = tex2D(_MainTex, i.uv) * _Color;
				fixed4 shadowColor = _ShadowCol;			
                fixed shadow = SHADOW_ATTENUATION(i);
                objectColor.rgb *= i.diff;

				fixed4 finalColor = objectColor * (shadow) + shadowColor * (1 - shadow);
                
                return finalColor;
            }
            ENDCG
        }

        
        Pass
        {
            Tags {"LightMode" = "ShadowCaster"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_shadowcaster
            #include "UnityCG.cginc"

            struct appdata{
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f{
                V2F_SHADOW_CASTER;
                
            };

            v2f vert(appdata v){
                v2f o;
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
                return o;
            }

            float4 frag(v2f i) : SV_Target{
                

                SHADOW_CASTER_FRAGMENT(i)

                
            }
            ENDCG
        }
    }
}