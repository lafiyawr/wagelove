#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_FLAG_IS_NORMAL_MAP detailNormalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 0:34
//sampler sampler detailNormalTexSmpSC 0:35
//sampler sampler emissiveTexSmpSC 0:36
//sampler sampler intensityTextureSmpSC 0:37
//sampler sampler materialParamsTexSmpSC 0:38
//sampler sampler normalTexSmpSC 0:39
//sampler sampler opacityTexSmpSC 0:40
//sampler sampler reflectionModulationTexSmpSC 0:41
//sampler sampler reflectionTexSmpSC 0:42
//sampler sampler rimColorTexSmpSC 0:43
//sampler sampler sc_EnvmapDiffuseSmpSC 0:44
//sampler sampler sc_EnvmapSpecularSmpSC 0:45
//sampler sampler sc_RayTracedAoTextureSmpSC 0:47
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:48
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:49
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:50
//sampler sampler sc_SSAOTextureSmpSC 0:51
//sampler sampler sc_ScreenTextureSmpSC 0:52
//sampler sampler sc_ShadowTextureSmpSC 0:53
//sampler sampler z_hitIdAndBarycentricSmp 0:55
//sampler sampler z_rayDirectionsSmpSC 0:56
//texture texture2D baseTex 0:4:0:34
//texture texture2D detailNormalTex 0:5:0:35
//texture texture2D emissiveTex 0:6:0:36
//texture texture2D intensityTexture 0:7:0:37
//texture texture2D materialParamsTex 0:8:0:38
//texture texture2D normalTex 0:9:0:39
//texture texture2D opacityTex 0:10:0:40
//texture texture2D reflectionModulationTex 0:11:0:41
//texture texture2D reflectionTex 0:12:0:42
//texture texture2D rimColorTex 0:13:0:43
//texture texture2D sc_EnvmapDiffuse 0:14:0:44
//texture texture2D sc_EnvmapSpecular 0:15:0:45
//texture texture2D sc_RayTracedAoTexture 0:24:0:47
//texture texture2D sc_RayTracedDiffIndTexture 0:25:0:48
//texture texture2D sc_RayTracedReflectionTexture 0:26:0:49
//texture texture2D sc_RayTracedShadowTexture 0:27:0:50
//texture texture2D sc_SSAOTexture 0:28:0:51
//texture texture2D sc_ScreenTexture 0:29:0:52
//texture texture2D sc_ShadowTexture 0:30:0:53
//texture utexture2D z_hitIdAndBarycentric 0:32:0:55
//texture texture2D z_rayDirections 0:33:0:56
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:57:6928 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapSpecularSize 1136
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float shaderComplexityValue 3604
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float _sc_framebufferFetchMarker 3700
//float2 sc_TAAJitterOffset 3704
//bool receivesRayTracedReflections 3824
//bool isProxyMode 3828
//bool receivesRayTracedShadows 3832
//bool receivesRayTracedDiffuseIndirect 3836
//bool receivesRayTracedAo 3840
//float receiver_mask 4048
//float3 OriginNormalizationScale 4064
//float3 OriginNormalizationOffset 4096
//int receiverId 4112
//int instance_id 4116
//int lray_triangles_last 4120
//bool noEarlyZ 4124
//bool has_animated_pn 4128
//int emitter_stride 4132
//int proxy_offset_position 4136
//int proxy_offset_normal 4140
//int proxy_offset_tangent 4144
//int proxy_offset_color 4148
//int proxy_offset_texture0 4152
//int proxy_offset_texture1 4156
//int proxy_offset_texture2 4160
//int proxy_offset_texture3 4164
//int proxy_format_position 4168
//int proxy_format_normal 4172
//int proxy_format_tangent 4176
//int proxy_format_color 4180
//int proxy_format_texture0 4184
//int proxy_format_texture1 4188
//int proxy_format_texture2 4192
//int proxy_format_texture3 4196
//float correctedIntensity 4256
//float3x3 intensityTextureTransform 4320
//float4 intensityTextureUvMinMax 4368
//float4 intensityTextureBorderColor 4384
//int PreviewEnabled 4548
//float alphaTestThreshold 4556
//float3 recolorRed 4560
//float4 baseColor 4576
//float3x3 baseTexTransform 4640
//float4 baseTexUvMinMax 4688
//float4 baseTexBorderColor 4704
//float2 uv2Scale 4720
//float2 uv2Offset 4728
//float2 uv3Scale 4736
//float2 uv3Offset 4744
//float3 recolorGreen 4752
//float3 recolorBlue 4768
//float3x3 opacityTexTransform 4832
//float4 opacityTexUvMinMax 4880
//float4 opacityTexBorderColor 4896
//float3x3 normalTexTransform 4960
//float4 normalTexUvMinMax 5008
//float4 normalTexBorderColor 5024
//float3x3 detailNormalTexTransform 5088
//float4 detailNormalTexUvMinMax 5136
//float4 detailNormalTexBorderColor 5152
//float3x3 emissiveTexTransform 5216
//float4 emissiveTexUvMinMax 5264
//float4 emissiveTexBorderColor 5280
//float3 emissiveColor 5296
//float emissiveIntensity 5312
//float reflectionIntensity 5316
//float3x3 reflectionTexTransform 5376
//float4 reflectionTexUvMinMax 5424
//float4 reflectionTexBorderColor 5440
//float3x3 reflectionModulationTexTransform 5504
//float4 reflectionModulationTexUvMinMax 5552
//float4 reflectionModulationTexBorderColor 5568
//float3 rimColor 5584
//float rimIntensity 5600
//float3x3 rimColorTexTransform 5664
//float4 rimColorTexUvMinMax 5712
//float4 rimColorTexBorderColor 5728
//float rimExponent 5744
//float metallic 5748
//float3x3 materialParamsTexTransform 5808
//float4 materialParamsTexUvMinMax 5856
//float4 materialParamsTexBorderColor 5872
//float roughness 5888
//float specularAoDarkening 5892
//float specularAoIntensity 5896
//float Port_Speed_N022 6008
//float Port_Speed_N063 6064
//float4 Port_Default_N369 6080
//float Port_Value2_N073 6160
//float Port_Default_N204 6216
//float Port_Input2_N072 6228
//float Port_Strength1_N200 6256
//float3 Port_Default_N113 6272
//float Port_Strength2_N200 6288
//float3 Port_Default_N132 6336
//float3 Port_Default_N103 6384
//float3 Port_Input1_N257 6432
//float Port_Input1_N264 6464
//float Port_Input1_N268 6468
//float Port_Input1_N270 6472
//float3 Port_Default_N041 6512
//float3 Port_Default_N134 6528
//float3 Port_Default_N170 6624
//float3 Port_Default_N173 6688
//float3 Port_Value1_N079 6768
//float3 Port_Input0_N325 6800
//float3 Port_Input0_N239 6832
//float3 Port_Import_N235 6848
//float3 Port_Input1_N322 6864
//float3 Port_Default_N326 6896
//float depthRef 6912
//}
//ssbo int layoutIndices 0:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 0:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 0:1:4 {
//float _Vertices 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 36 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 37 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 38 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 39 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 40 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 41 0
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 42 0
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 43 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 44 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 45 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 46 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 47 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 48 0
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 49 0
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 50 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 51 0
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 52 0
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 53 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 54 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 55 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 56 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 57 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 58 0
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 59 0
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 60 0
//spec_const bool Tweak_N11 61 0
//spec_const bool Tweak_N121 62 0
//spec_const bool Tweak_N177 63 0
//spec_const bool Tweak_N179 64 0
//spec_const bool Tweak_N216 65 0
//spec_const bool Tweak_N218 66 0
//spec_const bool Tweak_N219 67 0
//spec_const bool Tweak_N223 68 0
//spec_const bool Tweak_N308 69 0
//spec_const bool Tweak_N354 70 0
//spec_const bool Tweak_N37 71 0
//spec_const bool Tweak_N67 72 0
//spec_const bool Tweak_N74 73 0
//spec_const bool UseViewSpaceDepthVariant 74 1
//spec_const bool baseTexHasSwappedViews 75 0
//spec_const bool detailNormalTexHasSwappedViews 76 0
//spec_const bool emissiveTexHasSwappedViews 77 0
//spec_const bool intensityTextureHasSwappedViews 78 0
//spec_const bool materialParamsTexHasSwappedViews 79 0
//spec_const bool normalTexHasSwappedViews 80 0
//spec_const bool opacityTexHasSwappedViews 81 0
//spec_const bool reflectionModulationTexHasSwappedViews 82 0
//spec_const bool reflectionTexHasSwappedViews 83 0
//spec_const bool rimColorTexHasSwappedViews 84 0
//spec_const bool rimInvert 85 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 86 0
//spec_const bool sc_BlendMode_Add 87 0
//spec_const bool sc_BlendMode_AlphaTest 88 0
//spec_const bool sc_BlendMode_AlphaToCoverage 89 0
//spec_const bool sc_BlendMode_ColoredGlass 90 0
//spec_const bool sc_BlendMode_Custom 91 0
//spec_const bool sc_BlendMode_Max 92 0
//spec_const bool sc_BlendMode_Min 93 0
//spec_const bool sc_BlendMode_MultiplyOriginal 94 0
//spec_const bool sc_BlendMode_Multiply 95 0
//spec_const bool sc_BlendMode_Normal 96 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 97 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 98 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 99 0
//spec_const bool sc_BlendMode_Screen 100 0
//spec_const bool sc_DepthOnly 101 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 102 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 103 0
//spec_const bool sc_FramebufferFetch 104 0
//spec_const bool sc_HasDiffuseEnvmap 105 0
//spec_const bool sc_LightEstimation 106 0
//spec_const bool sc_MotionVectorsPass 107 0
//spec_const bool sc_OITCompositingPass 108 0
//spec_const bool sc_OITDepthBoundsPass 109 0
//spec_const bool sc_OITDepthGatherPass 110 0
//spec_const bool sc_ProjectiveShadowsCaster 111 0
//spec_const bool sc_ProjectiveShadowsReceiver 112 0
//spec_const bool sc_ProxyAlphaOne 113 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 114 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 115 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 116 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 117 0
//spec_const bool sc_RenderAlphaToColor 118 0
//spec_const bool sc_SSAOEnabled 119 0
//spec_const bool sc_ScreenTextureHasSwappedViews 120 0
//spec_const bool sc_ShaderComplexityAnalyzer 121 0
//spec_const bool sc_TAAEnabled 122 0
//spec_const bool sc_UseFramebufferFetchMarker 123 0
//spec_const bool sc_VertexBlendingUseNormals 124 0
//spec_const bool sc_VertexBlending 125 0
//spec_const bool uv2EnableAnimation 126 0
//spec_const bool uv3EnableAnimation 127 0
//spec_const int NODE_13_DROPLIST_ITEM 128 0
//spec_const int NODE_181_DROPLIST_ITEM 129 0
//spec_const int NODE_184_DROPLIST_ITEM 130 0
//spec_const int NODE_221_DROPLIST_ITEM 131 0
//spec_const int NODE_228_DROPLIST_ITEM 132 0
//spec_const int NODE_27_DROPLIST_ITEM 133 0
//spec_const int NODE_315_DROPLIST_ITEM 134 0
//spec_const int NODE_38_DROPLIST_ITEM 135 0
//spec_const int NODE_49_DROPLIST_ITEM 136 0
//spec_const int NODE_69_DROPLIST_ITEM 137 0
//spec_const int NODE_76_DROPLIST_ITEM 138 0
//spec_const int SC_DEVICE_CLASS 139 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 140 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 141 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 142 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 143 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 144 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 145 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 146 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 147 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 148 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 149 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 150 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 151 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 152 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 153 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 154 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 159 -1
//spec_const int baseTexLayout 160 0
//spec_const int detailNormalTexLayout 161 0
//spec_const int emissiveTexLayout 162 0
//spec_const int intensityTextureLayout 163 0
//spec_const int materialParamsTexLayout 164 0
//spec_const int normalTexLayout 165 0
//spec_const int opacityTexLayout 166 0
//spec_const int reflectionModulationTexLayout 167 0
//spec_const int reflectionTexLayout 168 0
//spec_const int rimColorTexLayout 169 0
//spec_const int sc_AmbientLightMode0 170 0
//spec_const int sc_AmbientLightMode1 171 0
//spec_const int sc_AmbientLightMode2 172 0
//spec_const int sc_AmbientLightMode_Constant 173 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 174 0
//spec_const int sc_AmbientLightMode_FromCamera 175 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 176 0
//spec_const int sc_AmbientLightsCount 177 0
//spec_const int sc_DepthBufferMode 178 0
//spec_const int sc_DirectionalLightsCount 179 0
//spec_const int sc_EnvLightMode 180 0
//spec_const int sc_EnvmapDiffuseLayout 181 0
//spec_const int sc_EnvmapSpecularLayout 182 0
//spec_const int sc_LightEstimationSGCount 183 0
//spec_const int sc_MaxTextureImageUnits 184 0
//spec_const int sc_PointLightsCount 185 0
//spec_const int sc_RayTracedAoTextureLayout 186 0
//spec_const int sc_RayTracedDiffIndTextureLayout 187 0
//spec_const int sc_RayTracedReflectionTextureLayout 188 0
//spec_const int sc_RayTracedShadowTextureLayout 189 0
//spec_const int sc_RenderingSpace 190 -1
//spec_const int sc_ScreenTextureLayout 191 0
//spec_const int sc_ShaderCacheConstant 192 0
//spec_const int sc_SkinBonesCount 193 0
//spec_const int sc_StereoRenderingMode 194 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 195 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_emissiveTex) ? SC_USE_CLAMP_TO_BORDER_emissiveTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(37)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex [[function_constant(38)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex) ? SC_USE_CLAMP_TO_BORDER_reflectionModulationTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex [[function_constant(39)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionTex) ? SC_USE_CLAMP_TO_BORDER_reflectionTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex [[function_constant(40)]];
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_rimColorTex) ? SC_USE_CLAMP_TO_BORDER_rimColorTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_emissiveTex [[function_constant(43)]];
constant bool SC_USE_UV_MIN_MAX_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_emissiveTex) ? SC_USE_UV_MIN_MAX_emissiveTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(44)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(45)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(46)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(47)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex [[function_constant(48)]];
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionModulationTex) ? SC_USE_UV_MIN_MAX_reflectionModulationTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionTex [[function_constant(49)]];
constant bool SC_USE_UV_MIN_MAX_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionTex) ? SC_USE_UV_MIN_MAX_reflectionTex : false;
constant bool SC_USE_UV_MIN_MAX_rimColorTex [[function_constant(50)]];
constant bool SC_USE_UV_MIN_MAX_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_rimColorTex) ? SC_USE_UV_MIN_MAX_rimColorTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(51)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(52)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_emissiveTex [[function_constant(53)]];
constant bool SC_USE_UV_TRANSFORM_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_emissiveTex) ? SC_USE_UV_TRANSFORM_emissiveTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(54)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(55)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(56)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(57)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex [[function_constant(58)]];
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionModulationTex) ? SC_USE_UV_TRANSFORM_reflectionModulationTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionTex [[function_constant(59)]];
constant bool SC_USE_UV_TRANSFORM_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionTex) ? SC_USE_UV_TRANSFORM_reflectionTex : false;
constant bool SC_USE_UV_TRANSFORM_rimColorTex [[function_constant(60)]];
constant bool SC_USE_UV_TRANSFORM_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_rimColorTex) ? SC_USE_UV_TRANSFORM_rimColorTex : false;
constant bool Tweak_N11 [[function_constant(61)]];
constant bool Tweak_N11_tmp = is_function_constant_defined(Tweak_N11) ? Tweak_N11 : false;
constant bool Tweak_N121 [[function_constant(62)]];
constant bool Tweak_N121_tmp = is_function_constant_defined(Tweak_N121) ? Tweak_N121 : false;
constant bool Tweak_N177 [[function_constant(63)]];
constant bool Tweak_N177_tmp = is_function_constant_defined(Tweak_N177) ? Tweak_N177 : false;
constant bool Tweak_N179 [[function_constant(64)]];
constant bool Tweak_N179_tmp = is_function_constant_defined(Tweak_N179) ? Tweak_N179 : false;
constant bool Tweak_N216 [[function_constant(65)]];
constant bool Tweak_N216_tmp = is_function_constant_defined(Tweak_N216) ? Tweak_N216 : false;
constant bool Tweak_N218 [[function_constant(66)]];
constant bool Tweak_N218_tmp = is_function_constant_defined(Tweak_N218) ? Tweak_N218 : false;
constant bool Tweak_N219 [[function_constant(67)]];
constant bool Tweak_N219_tmp = is_function_constant_defined(Tweak_N219) ? Tweak_N219 : false;
constant bool Tweak_N223 [[function_constant(68)]];
constant bool Tweak_N223_tmp = is_function_constant_defined(Tweak_N223) ? Tweak_N223 : false;
constant bool Tweak_N308 [[function_constant(69)]];
constant bool Tweak_N308_tmp = is_function_constant_defined(Tweak_N308) ? Tweak_N308 : false;
constant bool Tweak_N354 [[function_constant(70)]];
constant bool Tweak_N354_tmp = is_function_constant_defined(Tweak_N354) ? Tweak_N354 : false;
constant bool Tweak_N37 [[function_constant(71)]];
constant bool Tweak_N37_tmp = is_function_constant_defined(Tweak_N37) ? Tweak_N37 : false;
constant bool Tweak_N67 [[function_constant(72)]];
constant bool Tweak_N67_tmp = is_function_constant_defined(Tweak_N67) ? Tweak_N67 : false;
constant bool Tweak_N74 [[function_constant(73)]];
constant bool Tweak_N74_tmp = is_function_constant_defined(Tweak_N74) ? Tweak_N74 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(74)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(75)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(76)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool emissiveTexHasSwappedViews [[function_constant(77)]];
constant bool emissiveTexHasSwappedViews_tmp = is_function_constant_defined(emissiveTexHasSwappedViews) ? emissiveTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(78)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(79)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(80)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(81)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool reflectionModulationTexHasSwappedViews [[function_constant(82)]];
constant bool reflectionModulationTexHasSwappedViews_tmp = is_function_constant_defined(reflectionModulationTexHasSwappedViews) ? reflectionModulationTexHasSwappedViews : false;
constant bool reflectionTexHasSwappedViews [[function_constant(83)]];
constant bool reflectionTexHasSwappedViews_tmp = is_function_constant_defined(reflectionTexHasSwappedViews) ? reflectionTexHasSwappedViews : false;
constant bool rimColorTexHasSwappedViews [[function_constant(84)]];
constant bool rimColorTexHasSwappedViews_tmp = is_function_constant_defined(rimColorTexHasSwappedViews) ? rimColorTexHasSwappedViews : false;
constant bool rimInvert [[function_constant(85)]];
constant bool rimInvert_tmp = is_function_constant_defined(rimInvert) ? rimInvert : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(86)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(87)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(88)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(89)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(90)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(91)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(92)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(93)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(94)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(95)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(96)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(97)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(98)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(99)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(100)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(101)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(102)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(103)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(104)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(105)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(106)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(107)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(108)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(109)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(110)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(111)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(112)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(113)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(114)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(115)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(116)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(117)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(118)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(119)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(120)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(121)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(122)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(123)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(124)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(125)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool uv2EnableAnimation [[function_constant(126)]];
constant bool uv2EnableAnimation_tmp = is_function_constant_defined(uv2EnableAnimation) ? uv2EnableAnimation : false;
constant bool uv3EnableAnimation [[function_constant(127)]];
constant bool uv3EnableAnimation_tmp = is_function_constant_defined(uv3EnableAnimation) ? uv3EnableAnimation : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(128)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(129)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(130)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_221_DROPLIST_ITEM [[function_constant(131)]];
constant int NODE_221_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_221_DROPLIST_ITEM) ? NODE_221_DROPLIST_ITEM : 0;
constant int NODE_228_DROPLIST_ITEM [[function_constant(132)]];
constant int NODE_228_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_228_DROPLIST_ITEM) ? NODE_228_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(133)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_315_DROPLIST_ITEM [[function_constant(134)]];
constant int NODE_315_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_315_DROPLIST_ITEM) ? NODE_315_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(135)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(136)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_69_DROPLIST_ITEM [[function_constant(137)]];
constant int NODE_69_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_69_DROPLIST_ITEM) ? NODE_69_DROPLIST_ITEM : 0;
constant int NODE_76_DROPLIST_ITEM [[function_constant(138)]];
constant int NODE_76_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_76_DROPLIST_ITEM) ? NODE_76_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(139)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(140)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(141)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex [[function_constant(142)]];
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_U_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(143)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(144)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(145)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(146)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex [[function_constant(147)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex [[function_constant(148)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex [[function_constant(149)]];
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_U_rimColorTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(150)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(151)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex [[function_constant(152)]];
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_V_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(153)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(154)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(155)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(156)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex [[function_constant(157)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex [[function_constant(158)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex [[function_constant(159)]];
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_V_rimColorTex : -1;
constant int baseTexLayout [[function_constant(160)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(161)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int emissiveTexLayout [[function_constant(162)]];
constant int emissiveTexLayout_tmp = is_function_constant_defined(emissiveTexLayout) ? emissiveTexLayout : 0;
constant int intensityTextureLayout [[function_constant(163)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(164)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(165)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTexLayout [[function_constant(166)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int reflectionModulationTexLayout [[function_constant(167)]];
constant int reflectionModulationTexLayout_tmp = is_function_constant_defined(reflectionModulationTexLayout) ? reflectionModulationTexLayout : 0;
constant int reflectionTexLayout [[function_constant(168)]];
constant int reflectionTexLayout_tmp = is_function_constant_defined(reflectionTexLayout) ? reflectionTexLayout : 0;
constant int rimColorTexLayout [[function_constant(169)]];
constant int rimColorTexLayout_tmp = is_function_constant_defined(rimColorTexLayout) ? rimColorTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(170)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(171)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(172)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(173)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(174)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(175)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(176)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(177)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(178)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(179)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(180)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(181)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(182)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(183)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(184)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(185)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(186)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(187)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(188)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(189)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(190)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(191)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(192)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(193)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(194)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(195)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float metallic;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float roughness;
float specularAoDarkening;
float specularAoIntensity;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float3 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float3 Port_Default_N103;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float Port_Import_N277;
float Port_Import_N280;
float2 Port_Import_N241;
float2 Port_Import_N246;
float Port_Import_N278;
float Port_Import_N186;
float Port_Input1_N187;
float Port_Import_N078;
float3 Port_Value1_N079;
float Port_Import_N281;
float3 Port_Input0_N325;
float Port_Import_N283;
float3 Port_Input0_N239;
float3 Port_Import_N235;
float3 Port_Input1_N322;
float Port_Import_N282;
float3 Port_Default_N326;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
texture2d<uint> z_hitIdAndBarycentric [[id(32)]];
texture2d<float> z_rayDirections [[id(33)]];
sampler baseTexSmpSC [[id(34)]];
sampler detailNormalTexSmpSC [[id(35)]];
sampler emissiveTexSmpSC [[id(36)]];
sampler intensityTextureSmpSC [[id(37)]];
sampler materialParamsTexSmpSC [[id(38)]];
sampler normalTexSmpSC [[id(39)]];
sampler opacityTexSmpSC [[id(40)]];
sampler reflectionModulationTexSmpSC [[id(41)]];
sampler reflectionTexSmpSC [[id(42)]];
sampler rimColorTexSmpSC [[id(43)]];
sampler sc_EnvmapDiffuseSmpSC [[id(44)]];
sampler sc_EnvmapSpecularSmpSC [[id(45)]];
sampler sc_RayTracedAoTextureSmpSC [[id(47)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(48)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(49)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(50)]];
sampler sc_SSAOTextureSmpSC [[id(51)]];
sampler sc_ScreenTextureSmpSC [[id(52)]];
sampler sc_ShadowTextureSmpSC [[id(53)]];
sampler z_hitIdAndBarycentricSmp [[id(55)]];
sampler z_rayDirectionsSmpSC [[id(56)]];
constant userUniformsObj* UserUniforms [[id(57)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool l9_0=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set0.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set0.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set0.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set0.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set0.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set0.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set0.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=int(in.boneData.x);
int l9_62=int(in.boneData.y);
int l9_63=int(in.boneData.z);
int l9_64=int(in.boneData.w);
int l9_65=l9_61;
float4 l9_66=l9_57.position;
float3 l9_67=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_68=l9_65;
float4 l9_69=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[0];
float4 l9_70=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[1];
float4 l9_71=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[2];
float4 l9_72[3];
l9_72[0]=l9_69;
l9_72[1]=l9_70;
l9_72[2]=l9_71;
l9_67=float3(dot(l9_66,l9_72[0]),dot(l9_66,l9_72[1]),dot(l9_66,l9_72[2]));
}
else
{
l9_67=l9_66.xyz;
}
float3 l9_73=l9_67;
float3 l9_74=l9_73;
float l9_75=l9_60.x;
int l9_76=l9_62;
float4 l9_77=l9_57.position;
float3 l9_78=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_79=l9_76;
float4 l9_80=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[0];
float4 l9_81=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[1];
float4 l9_82=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[2];
float4 l9_83[3];
l9_83[0]=l9_80;
l9_83[1]=l9_81;
l9_83[2]=l9_82;
l9_78=float3(dot(l9_77,l9_83[0]),dot(l9_77,l9_83[1]),dot(l9_77,l9_83[2]));
}
else
{
l9_78=l9_77.xyz;
}
float3 l9_84=l9_78;
float3 l9_85=l9_84;
float l9_86=l9_60.y;
int l9_87=l9_63;
float4 l9_88=l9_57.position;
float3 l9_89=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_90=l9_87;
float4 l9_91=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[0];
float4 l9_92=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[1];
float4 l9_93=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[2];
float4 l9_94[3];
l9_94[0]=l9_91;
l9_94[1]=l9_92;
l9_94[2]=l9_93;
l9_89=float3(dot(l9_88,l9_94[0]),dot(l9_88,l9_94[1]),dot(l9_88,l9_94[2]));
}
else
{
l9_89=l9_88.xyz;
}
float3 l9_95=l9_89;
float3 l9_96=l9_95;
float l9_97=l9_60.z;
int l9_98=l9_64;
float4 l9_99=l9_57.position;
float3 l9_100=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_101=l9_98;
float4 l9_102=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[0];
float4 l9_103=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[1];
float4 l9_104=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[2];
float4 l9_105[3];
l9_105[0]=l9_102;
l9_105[1]=l9_103;
l9_105[2]=l9_104;
l9_100=float3(dot(l9_99,l9_105[0]),dot(l9_99,l9_105[1]),dot(l9_99,l9_105[2]));
}
else
{
l9_100=l9_99.xyz;
}
float3 l9_106=l9_100;
float3 l9_107=(((l9_74*l9_75)+(l9_85*l9_86))+(l9_96*l9_97))+(l9_106*l9_60.w);
l9_57.position=float4(l9_107.x,l9_107.y,l9_107.z,l9_57.position.w);
int l9_108=l9_61;
float3x3 l9_109=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[2].xyz));
float3x3 l9_110=l9_109;
float3x3 l9_111=l9_110;
int l9_112=l9_62;
float3x3 l9_113=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[2].xyz));
float3x3 l9_114=l9_113;
float3x3 l9_115=l9_114;
int l9_116=l9_63;
float3x3 l9_117=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[2].xyz));
float3x3 l9_118=l9_117;
float3x3 l9_119=l9_118;
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
l9_57.normal=((((l9_111*l9_57.normal)*l9_60.x)+((l9_115*l9_57.normal)*l9_60.y))+((l9_119*l9_57.normal)*l9_60.z))+((l9_123*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_111*l9_57.tangent)*l9_60.x)+((l9_115*l9_57.tangent)*l9_60.y))+((l9_119*l9_57.tangent)*l9_60.z))+((l9_123*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_124=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_124.x,l9_124.y,l9_124.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_125=normalize(param_5);
out.varTangent=float4(l9_125.x,l9_125.y,l9_125.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_126=param_2.position;
float4 l9_127=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_128=0;
}
else
{
l9_128=gl_InstanceIndex%2;
}
int l9_129=l9_128;
l9_127=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_129]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=gl_InstanceIndex%2;
}
int l9_131=l9_130;
l9_127=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_131]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=gl_InstanceIndex%2;
}
int l9_133=l9_132;
l9_127=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_133]*l9_126;
}
else
{
l9_127=l9_126;
}
}
}
float4 l9_134=l9_127;
out.varViewSpaceDepth=-l9_134.z;
}
float4 l9_135=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_135=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_137]*param_2.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_139]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_141]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_142=param_2.position;
float4 l9_143=l9_142;
if (sc_RenderingSpace_tmp==1)
{
l9_143=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_142;
}
float4 l9_144=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_143;
float2 l9_145=((l9_144.xy/float2(l9_144.w))*0.5)+float2(0.5);
out.varShadowTex=l9_145;
}
float4 l9_146=l9_135;
if (sc_DepthBufferMode_tmp==1)
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_148][2].w!=0.0)
{
float l9_149=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_146.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_146.w))*l9_149)-1.0)*l9_146.w;
}
}
float4 l9_150=l9_146;
l9_135=l9_150;
float4 l9_151=l9_135;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_152=l9_151.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_151.w);
l9_151=float4(l9_152.x,l9_152.y,l9_151.z,l9_151.w);
}
float4 l9_153=l9_151;
l9_135=l9_153;
float4 l9_154=l9_135;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_154.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_155=l9_154;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_156=dot(l9_155,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_157=l9_156;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_157;
}
}
float4 l9_158=float4(l9_154.x,-l9_154.y,(l9_154.z*0.5)+(l9_154.w*0.5),l9_154.w);
out.gl_Position=l9_158;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float metallic;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float roughness;
float specularAoDarkening;
float specularAoIntensity;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float3 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float3 Port_Default_N103;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float Port_Import_N277;
float Port_Import_N280;
float2 Port_Import_N241;
float2 Port_Import_N246;
float Port_Import_N278;
float Port_Import_N186;
float Port_Input1_N187;
float Port_Import_N078;
float3 Port_Value1_N079;
float Port_Import_N281;
float3 Port_Input0_N325;
float Port_Import_N283;
float3 Port_Input0_N239;
float3 Port_Import_N235;
float3 Port_Input1_N322;
float Port_Import_N282;
float3 Port_Default_N326;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
texture2d<uint> z_hitIdAndBarycentric [[id(32)]];
texture2d<float> z_rayDirections [[id(33)]];
sampler baseTexSmpSC [[id(34)]];
sampler detailNormalTexSmpSC [[id(35)]];
sampler emissiveTexSmpSC [[id(36)]];
sampler intensityTextureSmpSC [[id(37)]];
sampler materialParamsTexSmpSC [[id(38)]];
sampler normalTexSmpSC [[id(39)]];
sampler opacityTexSmpSC [[id(40)]];
sampler reflectionModulationTexSmpSC [[id(41)]];
sampler reflectionTexSmpSC [[id(42)]];
sampler rimColorTexSmpSC [[id(43)]];
sampler sc_EnvmapDiffuseSmpSC [[id(44)]];
sampler sc_EnvmapSpecularSmpSC [[id(45)]];
sampler sc_RayTracedAoTextureSmpSC [[id(47)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(48)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(49)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(50)]];
sampler sc_SSAOTextureSmpSC [[id(51)]];
sampler sc_ScreenTextureSmpSC [[id(52)]];
sampler sc_ShadowTextureSmpSC [[id(53)]];
sampler z_hitIdAndBarycentricSmp [[id(55)]];
sampler z_rayDirectionsSmpSC [[id(56)]];
constant userUniformsObj* UserUniforms [[id(57)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V,constant userUniformsObj& UserUniforms)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
bool l9_10=UserUniforms.isProxyMode!=0;
if (l9_10)
{
l9_9=1e-07;
}
float l9_11=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_12=param_6;
float l9_13=param_8;
float l9_14=l9_13+1.0;
l9_14=(l9_14*l9_14)*0.125;
float l9_15=(l9_12*(1.0-l9_14))+l9_14;
float l9_16=param_7;
float l9_17=param_8;
float l9_18=l9_17+1.0;
l9_18=(l9_18*l9_18)*0.125;
float l9_19=(l9_16*(1.0-l9_18))+l9_18;
float l9_20=1.0/(l9_15*l9_19);
float param_9=VdotH;
float3 param_10=F0;
float l9_21=param_9;
float3 l9_22=param_10;
float3 l9_23=float3(1.0);
float l9_24=1.0-l9_21;
float l9_25=l9_24*l9_24;
float l9_26=(l9_25*l9_25)*l9_24;
float3 l9_27=l9_22+((l9_23-l9_22)*l9_26);
float3 l9_28=l9_27;
return l9_28*(((l9_11*l9_20)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_29=param_11;
float3 l9_30=param_12;
float3 l9_31=float3(1.0);
float l9_32=1.0-l9_29;
float l9_33=l9_32*l9_32;
float l9_34=(l9_33*l9_33)*l9_32;
float3 l9_35=l9_30+((l9_31-l9_30)*l9_34);
float3 l9_36=l9_35;
return ((l9_36*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float4 sampleRayTracedReflections(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedReflections!=0;
if (!l9_0)
{
return float4(0.0);
}
else
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedReflectionTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedReflectionTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedReflectionTexture.sample(sc_RayTracedReflectionTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.039999999);
float a004=(fast::min(r.x*r.x,exp2((-9.2799997)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
}
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC,thread texture2d<float> sc_RayTracedReflectionTexture,thread sampler sc_RayTracedReflectionTextureSmpSC,thread texture2d<float> sc_RayTracedShadowTexture,thread sampler sc_RayTracedShadowTextureSmpSC,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord,thread float2& varShadowTex,thread float4& FragColor0)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30,UserUniforms)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56,UserUniforms)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_58=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
bool l9_67=UserUniforms.receivesRayTracedShadows!=0;
if (l9_67)
{
float4 l9_68=gl_FragCoord;
float2 l9_69=l9_68.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_70=l9_69;
float2 l9_71=l9_70;
int l9_72=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_73=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_73=0;
}
else
{
l9_73=varStereoViewID;
}
int l9_74=l9_73;
l9_72=1-l9_74;
}
else
{
int l9_75=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_75=0;
}
else
{
l9_75=varStereoViewID;
}
int l9_76=l9_75;
l9_72=l9_76;
}
int l9_77=l9_72;
float2 l9_78=l9_71;
int l9_79=l9_77;
float2 l9_80=l9_78;
int l9_81=l9_79;
float l9_82=0.0;
float4 l9_83=float4(0.0);
float2 l9_84=l9_80;
int l9_85=sc_RayTracedShadowTextureLayout_tmp;
int l9_86=l9_81;
float l9_87=l9_82;
float2 l9_88=l9_84;
int l9_89=l9_85;
int l9_90=l9_86;
float3 l9_91=float3(0.0);
if (l9_89==0)
{
l9_91=float3(l9_88,0.0);
}
else
{
if (l9_89==1)
{
l9_91=float3(l9_88.x,(l9_88.y*0.5)+(0.5-(float(l9_90)*0.5)),0.0);
}
else
{
l9_91=float3(l9_88,float(l9_90));
}
}
float3 l9_92=l9_91;
float3 l9_93=l9_92;
float2 l9_94=l9_93.xy;
float l9_95=l9_87;
float4 l9_96=sc_RayTracedShadowTexture.sample(sc_RayTracedShadowTextureSmpSC,l9_94,bias(l9_95));
float4 l9_97=l9_96;
l9_83=l9_97;
float4 l9_98=l9_83;
float4 l9_99=l9_98;
float4 l9_100=l9_99;
float l9_101=l9_100.x;
float3 l9_102=float3(l9_101);
float3 l9_103=l9_102;
l9_12.directDiffuse*=(float3(1.0)-l9_103);
l9_12.directSpecular*=(float3(1.0)-l9_103);
}
SurfaceProperties l9_104=param_4;
float3 l9_105=l9_104.normal;
float3 l9_106=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_107=l9_105;
float3 l9_108=l9_107;
float l9_109=UserUniforms.sc_EnvmapRotation.y;
float2 l9_110=float2(0.0);
float l9_111=l9_108.x;
float l9_112=-l9_108.z;
float l9_113=(l9_111<0.0) ? (-1.0) : 1.0;
float l9_114=l9_113*acos(fast::clamp(l9_112/length(float2(l9_111,l9_112)),-1.0,1.0));
l9_110.x=l9_114-1.5707964;
l9_110.y=acos(l9_108.y);
l9_110/=float2(6.2831855,3.1415927);
l9_110.y=1.0-l9_110.y;
l9_110.x+=(l9_109/360.0);
l9_110.x=fract((l9_110.x+floor(l9_110.x))+1.0);
float2 l9_115=l9_110;
float2 l9_116=l9_115;
float4 l9_117=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_118=l9_116;
float2 l9_119=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_120=5.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_118,l9_119,l9_120);
}
float2 l9_121=l9_116;
float l9_122=13.0;
int l9_123=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=varStereoViewID;
}
int l9_125=l9_124;
l9_123=1-l9_125;
}
else
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=varStereoViewID;
}
int l9_127=l9_126;
l9_123=l9_127;
}
int l9_128=l9_123;
float2 l9_129=l9_121;
int l9_130=l9_128;
float l9_131=l9_122;
float4 l9_132=float4(0.0);
float2 l9_133=l9_129;
int l9_134=sc_EnvmapSpecularLayout_tmp;
int l9_135=l9_130;
float l9_136=l9_131;
float2 l9_137=l9_133;
int l9_138=l9_134;
int l9_139=l9_135;
float3 l9_140=float3(0.0);
if (l9_138==0)
{
l9_140=float3(l9_137,0.0);
}
else
{
if (l9_138==1)
{
l9_140=float3(l9_137.x,(l9_137.y*0.5)+(0.5-(float(l9_139)*0.5)),0.0);
}
else
{
l9_140=float3(l9_137,float(l9_139));
}
}
float3 l9_141=l9_140;
float3 l9_142=l9_141;
float2 l9_143=l9_142.xy;
float l9_144=l9_136;
float4 l9_145=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_143,bias(l9_144));
float4 l9_146=l9_145;
l9_132=l9_146;
float4 l9_147=l9_132;
float4 l9_148=l9_147;
l9_117=l9_148;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_149=l9_116;
float2 l9_150=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_151=0.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_149,l9_150,l9_151);
bool l9_152=UserUniforms.isProxyMode!=0;
if (l9_152)
{
float2 l9_153=l9_116;
float l9_154=0.0;
int l9_155=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=l9_160;
float l9_163=l9_154;
float4 l9_164=float4(0.0);
float2 l9_165=l9_161;
int l9_166=sc_EnvmapDiffuseLayout_tmp;
int l9_167=l9_162;
float l9_168=l9_163;
float2 l9_169=l9_165;
int l9_170=l9_166;
int l9_171=l9_167;
float3 l9_172=float3(0.0);
if (l9_170==0)
{
l9_172=float3(l9_169,0.0);
}
else
{
if (l9_170==1)
{
l9_172=float3(l9_169.x,(l9_169.y*0.5)+(0.5-(float(l9_171)*0.5)),0.0);
}
else
{
l9_172=float3(l9_169,float(l9_171));
}
}
float3 l9_173=l9_172;
float3 l9_174=l9_173;
float2 l9_175=l9_174.xy;
float l9_176=l9_168;
float4 l9_177=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_175,level(l9_176));
float4 l9_178=l9_177;
l9_164=l9_178;
float4 l9_179=l9_164;
float4 l9_180=l9_179;
l9_117=l9_180;
}
else
{
float2 l9_181=l9_116;
float l9_182=-13.0;
int l9_183=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=varStereoViewID;
}
int l9_185=l9_184;
l9_183=1-l9_185;
}
else
{
int l9_186=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_186=0;
}
else
{
l9_186=varStereoViewID;
}
int l9_187=l9_186;
l9_183=l9_187;
}
int l9_188=l9_183;
float2 l9_189=l9_181;
int l9_190=l9_188;
float l9_191=l9_182;
float4 l9_192=float4(0.0);
float2 l9_193=l9_189;
int l9_194=sc_EnvmapDiffuseLayout_tmp;
int l9_195=l9_190;
float l9_196=l9_191;
float2 l9_197=l9_193;
int l9_198=l9_194;
int l9_199=l9_195;
float3 l9_200=float3(0.0);
if (l9_198==0)
{
l9_200=float3(l9_197,0.0);
}
else
{
if (l9_198==1)
{
l9_200=float3(l9_197.x,(l9_197.y*0.5)+(0.5-(float(l9_199)*0.5)),0.0);
}
else
{
l9_200=float3(l9_197,float(l9_199));
}
}
float3 l9_201=l9_200;
float3 l9_202=l9_201;
float2 l9_203=l9_202.xy;
float l9_204=l9_196;
float4 l9_205=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_203,bias(l9_204));
float4 l9_206=l9_205;
l9_192=l9_206;
float4 l9_207=l9_192;
float4 l9_208=l9_207;
l9_117=l9_208;
}
}
else
{
float2 l9_209=l9_116;
float l9_210=13.0;
int l9_211=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_212=0;
}
else
{
l9_212=varStereoViewID;
}
int l9_213=l9_212;
l9_211=1-l9_213;
}
else
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=varStereoViewID;
}
int l9_215=l9_214;
l9_211=l9_215;
}
int l9_216=l9_211;
float2 l9_217=l9_209;
int l9_218=l9_216;
float l9_219=l9_210;
float4 l9_220=float4(0.0);
float2 l9_221=l9_217;
int l9_222=sc_EnvmapSpecularLayout_tmp;
int l9_223=l9_218;
float l9_224=l9_219;
float2 l9_225=l9_221;
int l9_226=l9_222;
int l9_227=l9_223;
float3 l9_228=float3(0.0);
if (l9_226==0)
{
l9_228=float3(l9_225,0.0);
}
else
{
if (l9_226==1)
{
l9_228=float3(l9_225.x,(l9_225.y*0.5)+(0.5-(float(l9_227)*0.5)),0.0);
}
else
{
l9_228=float3(l9_225,float(l9_227));
}
}
float3 l9_229=l9_228;
float3 l9_230=l9_229;
float2 l9_231=l9_230.xy;
float l9_232=l9_224;
float4 l9_233=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_231,bias(l9_232));
float4 l9_234=l9_233;
l9_220=l9_234;
float4 l9_235=l9_220;
float4 l9_236=l9_235;
l9_117=l9_236;
}
}
float4 l9_237=l9_117;
float3 l9_238=l9_237.xyz*(1.0/l9_237.w);
float3 l9_239=l9_238*UserUniforms.sc_EnvmapExposure;
l9_106=l9_239;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_240=UserUniforms.sc_Sh[0];
float3 l9_241=UserUniforms.sc_Sh[1];
float3 l9_242=UserUniforms.sc_Sh[2];
float3 l9_243=UserUniforms.sc_Sh[3];
float3 l9_244=UserUniforms.sc_Sh[4];
float3 l9_245=UserUniforms.sc_Sh[5];
float3 l9_246=UserUniforms.sc_Sh[6];
float3 l9_247=UserUniforms.sc_Sh[7];
float3 l9_248=UserUniforms.sc_Sh[8];
float3 l9_249=-l9_105;
float l9_250=0.0;
l9_250=l9_249.x;
float l9_251=l9_249.y;
float l9_252=l9_249.z;
float l9_253=l9_250*l9_250;
float l9_254=l9_251*l9_251;
float l9_255=l9_252*l9_252;
float l9_256=l9_250*l9_251;
float l9_257=l9_251*l9_252;
float l9_258=l9_250*l9_252;
float3 l9_259=((((((l9_248*0.42904299)*(l9_253-l9_254))+((l9_246*0.74312502)*l9_255))+(l9_240*0.88622701))-(l9_246*0.24770799))+((((l9_244*l9_256)+(l9_247*l9_258))+(l9_245*l9_257))*0.85808599))+((((l9_243*l9_250)+(l9_241*l9_251))+(l9_242*l9_252))*1.0233279);
l9_106=l9_259*UserUniforms.sc_ShIntensity;
}
}
bool l9_260=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_260)
{
float4 l9_261=sampleRayTracedIndirectDiffuse(varStereoViewID,UserUniforms,sc_RayTracedDiffIndTexture,sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_106=mix(l9_106,l9_261.xyz,float3(l9_261.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_262=l9_105;
float3 l9_263=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_264;
float l9_265;
int l9_266=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_266<sc_LightEstimationSGCount_tmp)
{
l9_264.color=UserUniforms.sc_LightEstimationData.sg[l9_266].color;
l9_264.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_266].sharpness;
l9_264.axis=UserUniforms.sc_LightEstimationData.sg[l9_266].axis;
float3 l9_267=l9_262;
float l9_268=dot(l9_264.axis,l9_267);
float l9_269=l9_264.sharpness;
float l9_270=0.36000001;
float l9_271=1.0/(4.0*l9_270);
float l9_272=exp(-l9_269);
float l9_273=l9_272*l9_272;
float l9_274=1.0/l9_269;
float l9_275=(1.0+(2.0*l9_273))-l9_274;
float l9_276=((l9_272-l9_273)*l9_274)-l9_273;
float l9_277=sqrt(1.0-l9_275);
float l9_278=l9_270*l9_268;
float l9_279=l9_271*l9_277;
float l9_280=l9_278+l9_279;
float l9_281=l9_268;
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282;
if (step(abs(l9_278),l9_279)>0.5)
{
l9_265=(l9_280*l9_280)/l9_277;
}
else
{
l9_265=l9_283;
}
l9_283=l9_265;
float l9_284=(l9_275*l9_283)+l9_276;
sc_SphericalGaussianLight_t l9_285=l9_264;
float3 l9_286=(l9_285.color/float3(l9_285.sharpness))*6.2831855;
float3 l9_287=(l9_286*l9_284)/float3(3.1415927);
l9_263+=l9_287;
l9_266++;
continue;
}
else
{
break;
}
}
float3 l9_288=l9_263;
l9_106+=l9_288;
}
float3 l9_289=l9_106;
float3 l9_290=l9_289;
l9_12.indirectDiffuse=l9_290;
SurfaceProperties l9_291=param_4;
float3 l9_292=l9_13;
float3 l9_293=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_294=l9_291;
float3 l9_295=l9_292;
float3 l9_296=l9_294.normal;
float3 l9_297=reflect(-l9_295,l9_296);
float3 l9_298=l9_296;
float3 l9_299=l9_297;
float l9_300=l9_294.roughness;
l9_297=getSpecularDominantDir(l9_298,l9_299,l9_300);
float l9_301=l9_294.roughness;
float l9_302=pow(l9_301,0.66666669);
float l9_303=fast::clamp(l9_302,0.0,1.0);
float l9_304=l9_303*5.0;
float l9_305=l9_304;
float l9_306=l9_305;
float3 l9_307=l9_297;
float l9_308=l9_306;
float3 l9_309=l9_307;
float l9_310=l9_308;
float4 l9_311=float4(0.0);
float3 l9_312=l9_309;
float l9_313=UserUniforms.sc_EnvmapRotation.y;
float2 l9_314=float2(0.0);
float l9_315=l9_312.x;
float l9_316=-l9_312.z;
float l9_317=(l9_315<0.0) ? (-1.0) : 1.0;
float l9_318=l9_317*acos(fast::clamp(l9_316/length(float2(l9_315,l9_316)),-1.0,1.0));
l9_314.x=l9_318-1.5707964;
l9_314.y=acos(l9_312.y);
l9_314/=float2(6.2831855,3.1415927);
l9_314.y=1.0-l9_314.y;
l9_314.x+=(l9_313/360.0);
l9_314.x=fract((l9_314.x+floor(l9_314.x))+1.0);
float2 l9_319=l9_314;
float2 l9_320=l9_319;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_321=floor(l9_310);
float l9_322=ceil(l9_310);
float l9_323=l9_310-l9_321;
float2 l9_324=l9_320;
float2 l9_325=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_326=l9_321;
float2 l9_327=calcSeamlessPanoramicUvsForSampling(l9_324,l9_325,l9_326);
float2 l9_328=l9_327;
float l9_329=l9_321;
float2 l9_330=l9_328;
float l9_331=l9_329;
int l9_332=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_333=0;
}
else
{
l9_333=varStereoViewID;
}
int l9_334=l9_333;
l9_332=1-l9_334;
}
else
{
int l9_335=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_335=0;
}
else
{
l9_335=varStereoViewID;
}
int l9_336=l9_335;
l9_332=l9_336;
}
int l9_337=l9_332;
float2 l9_338=l9_330;
int l9_339=l9_337;
float l9_340=l9_331;
float4 l9_341=float4(0.0);
float2 l9_342=l9_338;
int l9_343=sc_EnvmapSpecularLayout_tmp;
int l9_344=l9_339;
float l9_345=l9_340;
float2 l9_346=l9_342;
int l9_347=l9_343;
int l9_348=l9_344;
float3 l9_349=float3(0.0);
if (l9_347==0)
{
l9_349=float3(l9_346,0.0);
}
else
{
if (l9_347==1)
{
l9_349=float3(l9_346.x,(l9_346.y*0.5)+(0.5-(float(l9_348)*0.5)),0.0);
}
else
{
l9_349=float3(l9_346,float(l9_348));
}
}
float3 l9_350=l9_349;
float3 l9_351=l9_350;
float2 l9_352=l9_351.xy;
float l9_353=l9_345;
float4 l9_354=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_352,level(l9_353));
float4 l9_355=l9_354;
l9_341=l9_355;
float4 l9_356=l9_341;
float4 l9_357=l9_356;
float4 l9_358=l9_357;
float4 l9_359=l9_358;
float2 l9_360=l9_320;
float2 l9_361=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_362=l9_322;
float2 l9_363=calcSeamlessPanoramicUvsForSampling(l9_360,l9_361,l9_362);
float2 l9_364=l9_363;
float l9_365=l9_322;
float2 l9_366=l9_364;
float l9_367=l9_365;
int l9_368=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_369=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_369=0;
}
else
{
l9_369=varStereoViewID;
}
int l9_370=l9_369;
l9_368=1-l9_370;
}
else
{
int l9_371=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_371=0;
}
else
{
l9_371=varStereoViewID;
}
int l9_372=l9_371;
l9_368=l9_372;
}
int l9_373=l9_368;
float2 l9_374=l9_366;
int l9_375=l9_373;
float l9_376=l9_367;
float4 l9_377=float4(0.0);
float2 l9_378=l9_374;
int l9_379=sc_EnvmapSpecularLayout_tmp;
int l9_380=l9_375;
float l9_381=l9_376;
float2 l9_382=l9_378;
int l9_383=l9_379;
int l9_384=l9_380;
float3 l9_385=float3(0.0);
if (l9_383==0)
{
l9_385=float3(l9_382,0.0);
}
else
{
if (l9_383==1)
{
l9_385=float3(l9_382.x,(l9_382.y*0.5)+(0.5-(float(l9_384)*0.5)),0.0);
}
else
{
l9_385=float3(l9_382,float(l9_384));
}
}
float3 l9_386=l9_385;
float3 l9_387=l9_386;
float2 l9_388=l9_387.xy;
float l9_389=l9_381;
float4 l9_390=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_388,level(l9_389));
float4 l9_391=l9_390;
l9_377=l9_391;
float4 l9_392=l9_377;
float4 l9_393=l9_392;
float4 l9_394=l9_393;
float4 l9_395=l9_394;
l9_311=mix(l9_359,l9_395,float4(l9_323));
}
else
{
float2 l9_396=l9_320;
float l9_397=l9_310;
float2 l9_398=l9_396;
float l9_399=l9_397;
int l9_400=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_401=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_401=0;
}
else
{
l9_401=varStereoViewID;
}
int l9_402=l9_401;
l9_400=1-l9_402;
}
else
{
int l9_403=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_403=0;
}
else
{
l9_403=varStereoViewID;
}
int l9_404=l9_403;
l9_400=l9_404;
}
int l9_405=l9_400;
float2 l9_406=l9_398;
int l9_407=l9_405;
float l9_408=l9_399;
float4 l9_409=float4(0.0);
float2 l9_410=l9_406;
int l9_411=sc_EnvmapSpecularLayout_tmp;
int l9_412=l9_407;
float l9_413=l9_408;
float2 l9_414=l9_410;
int l9_415=l9_411;
int l9_416=l9_412;
float3 l9_417=float3(0.0);
if (l9_415==0)
{
l9_417=float3(l9_414,0.0);
}
else
{
if (l9_415==1)
{
l9_417=float3(l9_414.x,(l9_414.y*0.5)+(0.5-(float(l9_416)*0.5)),0.0);
}
else
{
l9_417=float3(l9_414,float(l9_416));
}
}
float3 l9_418=l9_417;
float3 l9_419=l9_418;
float2 l9_420=l9_419.xy;
float l9_421=l9_413;
float4 l9_422=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_420,level(l9_421));
float4 l9_423=l9_422;
l9_409=l9_423;
float4 l9_424=l9_409;
float4 l9_425=l9_424;
float4 l9_426=l9_425;
l9_311=l9_426;
}
float4 l9_427=l9_311;
float3 l9_428=l9_427.xyz*(1.0/l9_427.w);
float3 l9_429=l9_428;
float3 l9_430=l9_429*UserUniforms.sc_EnvmapExposure;
l9_430+=float3(1e-06);
float3 l9_431=l9_430;
float3 l9_432=l9_431;
bool l9_433=UserUniforms.receivesRayTracedReflections!=0;
if (l9_433)
{
float4 l9_434=sampleRayTracedReflections(varStereoViewID,UserUniforms,sc_RayTracedReflectionTexture,sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_432=mix(l9_432,l9_434.xyz,float3(l9_434.w));
}
SurfaceProperties l9_435=l9_294;
float l9_436=abs(dot(l9_296,l9_295));
float3 l9_437=l9_432*envBRDFApprox(l9_435,l9_436);
l9_293+=l9_437;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_438=l9_291;
float3 l9_439=l9_292;
float l9_440=fast::clamp(l9_438.roughness*l9_438.roughness,0.0099999998,1.0);
float3 l9_441=UserUniforms.sc_LightEstimationData.ambientLight*l9_438.specColor;
sc_SphericalGaussianLight_t l9_442;
sc_SphericalGaussianLight_t l9_443;
sc_SphericalGaussianLight_t l9_444;
int l9_445=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_445<sc_LightEstimationSGCount_tmp)
{
l9_442.color=UserUniforms.sc_LightEstimationData.sg[l9_445].color;
l9_442.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_445].sharpness;
l9_442.axis=UserUniforms.sc_LightEstimationData.sg[l9_445].axis;
float3 l9_446=l9_438.normal;
float l9_447=l9_440;
float3 l9_448=l9_439;
float3 l9_449=l9_438.specColor;
float3 l9_450=l9_446;
float l9_451=l9_447;
l9_443.axis=l9_450;
float l9_452=l9_451*l9_451;
l9_443.sharpness=2.0/l9_452;
l9_443.color=float3(1.0/(3.1415927*l9_452));
sc_SphericalGaussianLight_t l9_453=l9_443;
sc_SphericalGaussianLight_t l9_454=l9_453;
sc_SphericalGaussianLight_t l9_455=l9_454;
float3 l9_456=l9_448;
l9_444.axis=reflect(-l9_456,l9_455.axis);
l9_444.color=l9_455.color;
l9_444.sharpness=l9_455.sharpness;
l9_444.sharpness/=(4.0*fast::max(dot(l9_455.axis,l9_456),9.9999997e-05));
sc_SphericalGaussianLight_t l9_457=l9_444;
sc_SphericalGaussianLight_t l9_458=l9_457;
sc_SphericalGaussianLight_t l9_459=l9_458;
sc_SphericalGaussianLight_t l9_460=l9_442;
float l9_461=length((l9_459.axis*l9_459.sharpness)+(l9_460.axis*l9_460.sharpness));
float3 l9_462=(l9_459.color*exp((l9_461-l9_459.sharpness)-l9_460.sharpness))*l9_460.color;
float l9_463=1.0-exp((-2.0)*l9_461);
float3 l9_464=((l9_462*6.2831855)*l9_463)/float3(l9_461);
float3 l9_465=l9_464;
float3 l9_466=l9_458.axis;
float l9_467=l9_447*l9_447;
float l9_468=dot(l9_446,l9_466);
float l9_469=fast::clamp(l9_468,0.0,1.0);
float l9_470=l9_469;
float l9_471=dot(l9_446,l9_448);
float l9_472=fast::clamp(l9_471,0.0,1.0);
float l9_473=l9_472;
float3 l9_474=normalize(l9_458.axis+l9_448);
float l9_475=l9_467;
float l9_476=l9_470;
float l9_477=1.0/(l9_476+sqrt(l9_475+(((1.0-l9_475)*l9_476)*l9_476)));
float l9_478=l9_467;
float l9_479=l9_473;
float l9_480=1.0/(l9_479+sqrt(l9_478+(((1.0-l9_478)*l9_479)*l9_479)));
l9_465*=(l9_477*l9_480);
float l9_481=dot(l9_466,l9_474);
float l9_482=fast::clamp(l9_481,0.0,1.0);
float l9_483=pow(1.0-l9_482,5.0);
l9_465*=(l9_449+((float3(1.0)-l9_449)*l9_483));
l9_465*=l9_470;
float3 l9_484=l9_465;
l9_441+=l9_484;
l9_445++;
continue;
}
else
{
break;
}
}
float3 l9_485=l9_441;
l9_293+=l9_485;
}
float3 l9_486=l9_293;
l9_12.indirectSpecular=l9_486;
LightingComponents l9_487=l9_12;
LightingComponents lighting=l9_487;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_488=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_489=FragColor0;
float4 l9_490=l9_489;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_490.x+=UserUniforms._sc_framebufferFetchMarker;
}
float4 l9_491=l9_490;
l9_488=l9_491;
}
else
{
float4 l9_492=gl_FragCoord;
float2 l9_493=l9_492.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_494=l9_493;
float2 l9_495=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_496=1;
int l9_497=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_497=0;
}
else
{
l9_497=varStereoViewID;
}
int l9_498=l9_497;
int l9_499=l9_498;
float3 l9_500=float3(l9_494,0.0);
int l9_501=l9_496;
int l9_502=l9_499;
if (l9_501==1)
{
l9_500.y=((2.0*l9_500.y)+float(l9_502))-1.0;
}
float2 l9_503=l9_500.xy;
l9_495=l9_503;
}
else
{
l9_495=l9_494;
}
float2 l9_504=l9_495;
float2 l9_505=l9_504;
float2 l9_506=l9_505;
int l9_507=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_508=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_508=0;
}
else
{
l9_508=varStereoViewID;
}
int l9_509=l9_508;
l9_507=1-l9_509;
}
else
{
int l9_510=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_510=0;
}
else
{
l9_510=varStereoViewID;
}
int l9_511=l9_510;
l9_507=l9_511;
}
int l9_512=l9_507;
float2 l9_513=l9_506;
int l9_514=l9_512;
float2 l9_515=l9_513;
int l9_516=l9_514;
float l9_517=0.0;
float4 l9_518=float4(0.0);
float2 l9_519=l9_515;
int l9_520=sc_ScreenTextureLayout_tmp;
int l9_521=l9_516;
float l9_522=l9_517;
float2 l9_523=l9_519;
int l9_524=l9_520;
int l9_525=l9_521;
float3 l9_526=float3(0.0);
if (l9_524==0)
{
l9_526=float3(l9_523,0.0);
}
else
{
if (l9_524==1)
{
l9_526=float3(l9_523.x,(l9_523.y*0.5)+(0.5-(float(l9_525)*0.5)),0.0);
}
else
{
l9_526=float3(l9_523,float(l9_525));
}
}
float3 l9_527=l9_526;
float3 l9_528=l9_527;
float2 l9_529=l9_528.xy;
float l9_530=l9_522;
float4 l9_531=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_529,bias(l9_530));
float4 l9_532=l9_531;
l9_518=l9_532;
float4 l9_533=l9_518;
float4 l9_534=l9_533;
float4 l9_535=l9_534;
l9_488=l9_535;
}
float4 l9_536=l9_488;
float4 l9_537=l9_536;
float3 param_5=l9_537.xyz;
float3 l9_538;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_538=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_538=param_5*param_5;
}
float3 l9_539=l9_538;
float3 framebuffer=l9_539;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_540=float3(0.0);
bool l9_541=UserUniforms.receivesRayTracedAo!=0;
if (l9_541)
{
l9_540=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*float3(1.0-sampleRayTracedAo(varStereoViewID,UserUniforms,sc_RayTracedAoTexture,sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_540=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
}
float3 l9_542=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_543=param_6.emissive;
float3 l9_544=param_7.transmitted;
if (param_8)
{
float l9_545=param_6.opacity;
l9_540*=srgbToLinear(l9_545);
}
float3 l9_546=((l9_540+l9_542)+l9_543)+l9_544;
float3 l9_547=l9_546;
float4 Output=float4(l9_547,surfaceProperties.opacity);
bool l9_548=UserUniforms.isProxyMode!=0;
if (l9_548)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float l9_549=1.8;
float l9_550=1.4;
float l9_551=0.5;
float l9_552=1.5;
float3 l9_553=(param_9*((param_9*l9_549)+float3(l9_550)))/((param_9*((param_9*l9_549)+float3(l9_551)))+float3(l9_552));
Output=float4(l9_553.x,l9_553.y,l9_553.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_554=param_10.x;
float l9_555=param_10.y;
float l9_556=param_10.z;
float3 l9_557=float3(linearToSrgb(l9_554),linearToSrgb(l9_555),linearToSrgb(l9_556));
Output=float4(l9_557.x,l9_557.y,l9_557.z,Output.w);
return Output;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
bool l9_0=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
int2 l9_2=int2(l9_1.xy);
RayHitPayload l9_3=GetHitData(l9_2,(*sc_set0.UserUniforms),sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,sc_set0.z_hitIdAndBarycentric,sc_set0.z_hitIdAndBarycentricSmp,(*sc_set0.layoutVertices),(*sc_set0.layoutVerticesPN),(*sc_set0.layoutIndices));
RayHitPayload rhp=l9_3;
bool l9_4=(*sc_set0.UserUniforms).noEarlyZ!=0;
if (l9_4)
{
if (rhp.id.x!=uint((*sc_set0.UserUniforms).instance_id))
{
return out;
}
}
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=rhp.viewDirWS;
Globals.PositionWS=rhp.positionWS;
Globals.VertexColor=rhp.color;
Globals.Surface_UVCoord0=rhp.uv0;
Globals.Surface_UVCoord1=rhp.uv1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
float4 emitterPositionCS=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_6]*float4(rhp.positionWS,1.0);
Globals.gScreenCoord=((emitterPositionCS.xy/float2(emitterPositionCS.w))*0.5)+float2(0.5);
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.SurfacePosition_WorldSpace=rhp.positionWS;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_7=gl_FragCoord;
float2 l9_8=l9_7.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_9=l9_8;
float2 l9_10=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_11=1;
int l9_12=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12=0;
}
else
{
l9_12=in.varStereoViewID;
}
int l9_13=l9_12;
int l9_14=l9_13;
float3 l9_15=float3(l9_9,0.0);
int l9_16=l9_11;
int l9_17=l9_14;
if (l9_16==1)
{
l9_15.y=((2.0*l9_15.y)+float(l9_17))-1.0;
}
float2 l9_18=l9_15.xy;
l9_10=l9_18;
}
else
{
l9_10=l9_9;
}
float2 l9_19=l9_10;
float2 l9_20=l9_19;
Globals.gScreenCoord=l9_20;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
}
float4 Result_N363=float4(0.0);
float4 param=float4(0.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
float4 param_2;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_21=float4(0.0);
l9_21=param_3.VertexColor;
float3 l9_22=float3(0.0);
float3 l9_23=float3(0.0);
float3 l9_24=float3(0.0);
ssGlobals l9_25=param_3;
float3 l9_26;
if ((int(Tweak_N37_tmp)!=0))
{
float3 l9_27=float3(0.0);
float3 l9_28=(*sc_set0.UserUniforms).recolorRed;
l9_27=l9_28;
float3 l9_29=float3(0.0);
l9_29=l9_27;
float4 l9_30=float4(0.0);
float4 l9_31=(*sc_set0.UserUniforms).baseColor;
l9_30=l9_31;
float4 l9_32=float4(0.0);
l9_32=l9_30;
float4 l9_33=float4(0.0);
float4 l9_34=float4(0.0);
float4 l9_35=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_36=l9_25;
float4 l9_37;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_38=float2(0.0);
float2 l9_39=float2(0.0);
float2 l9_40=float2(0.0);
float2 l9_41=float2(0.0);
float2 l9_42=float2(0.0);
float2 l9_43=float2(0.0);
ssGlobals l9_44=l9_36;
float2 l9_45;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_46=float2(0.0);
l9_46=l9_44.Surface_UVCoord0;
l9_39=l9_46;
l9_45=l9_39;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_47=float2(0.0);
l9_47=l9_44.Surface_UVCoord1;
l9_40=l9_47;
l9_45=l9_40;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_48=float2(0.0);
float2 l9_49=float2(0.0);
float2 l9_50=float2(0.0);
ssGlobals l9_51=l9_44;
float2 l9_52;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_53=float2(0.0);
float2 l9_54=float2(0.0);
float2 l9_55=float2(0.0);
ssGlobals l9_56=l9_51;
float2 l9_57;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_58=float2(0.0);
float2 l9_59=float2(0.0);
float2 l9_60=float2(0.0);
float2 l9_61=float2(0.0);
float2 l9_62=float2(0.0);
ssGlobals l9_63=l9_56;
float2 l9_64;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_65=float2(0.0);
l9_65=l9_63.Surface_UVCoord0;
l9_59=l9_65;
l9_64=l9_59;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_66=float2(0.0);
l9_66=l9_63.Surface_UVCoord1;
l9_60=l9_66;
l9_64=l9_60;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_67=float2(0.0);
l9_67=l9_63.gScreenCoord;
l9_61=l9_67;
l9_64=l9_61;
}
else
{
float2 l9_68=float2(0.0);
l9_68=l9_63.Surface_UVCoord0;
l9_62=l9_68;
l9_64=l9_62;
}
}
}
l9_58=l9_64;
float2 l9_69=float2(0.0);
float2 l9_70=(*sc_set0.UserUniforms).uv2Scale;
l9_69=l9_70;
float2 l9_71=float2(0.0);
l9_71=l9_69;
float2 l9_72=float2(0.0);
float2 l9_73=(*sc_set0.UserUniforms).uv2Offset;
l9_72=l9_73;
float2 l9_74=float2(0.0);
l9_74=l9_72;
float2 l9_75=float2(0.0);
l9_75=(l9_58*l9_71)+l9_74;
float2 l9_76=float2(0.0);
l9_76=l9_75+(l9_74*(l9_56.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_54=l9_76;
l9_57=l9_54;
}
else
{
float2 l9_77=float2(0.0);
float2 l9_78=float2(0.0);
float2 l9_79=float2(0.0);
float2 l9_80=float2(0.0);
float2 l9_81=float2(0.0);
ssGlobals l9_82=l9_56;
float2 l9_83;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_84=float2(0.0);
l9_84=l9_82.Surface_UVCoord0;
l9_78=l9_84;
l9_83=l9_78;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_85=float2(0.0);
l9_85=l9_82.Surface_UVCoord1;
l9_79=l9_85;
l9_83=l9_79;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_86=float2(0.0);
l9_86=l9_82.gScreenCoord;
l9_80=l9_86;
l9_83=l9_80;
}
else
{
float2 l9_87=float2(0.0);
l9_87=l9_82.Surface_UVCoord0;
l9_81=l9_87;
l9_83=l9_81;
}
}
}
l9_77=l9_83;
float2 l9_88=float2(0.0);
float2 l9_89=(*sc_set0.UserUniforms).uv2Scale;
l9_88=l9_89;
float2 l9_90=float2(0.0);
l9_90=l9_88;
float2 l9_91=float2(0.0);
float2 l9_92=(*sc_set0.UserUniforms).uv2Offset;
l9_91=l9_92;
float2 l9_93=float2(0.0);
l9_93=l9_91;
float2 l9_94=float2(0.0);
l9_94=(l9_77*l9_90)+l9_93;
l9_55=l9_94;
l9_57=l9_55;
}
l9_53=l9_57;
l9_49=l9_53;
l9_52=l9_49;
}
else
{
float2 l9_95=float2(0.0);
l9_95=l9_51.Surface_UVCoord0;
l9_50=l9_95;
l9_52=l9_50;
}
l9_48=l9_52;
float2 l9_96=float2(0.0);
l9_96=l9_48;
float2 l9_97=float2(0.0);
l9_97=l9_96;
l9_41=l9_97;
l9_45=l9_41;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_98=float2(0.0);
float2 l9_99=float2(0.0);
float2 l9_100=float2(0.0);
ssGlobals l9_101=l9_44;
float2 l9_102;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_103=float2(0.0);
float2 l9_104=float2(0.0);
float2 l9_105=float2(0.0);
ssGlobals l9_106=l9_101;
float2 l9_107;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_108=float2(0.0);
float2 l9_109=float2(0.0);
float2 l9_110=float2(0.0);
float2 l9_111=float2(0.0);
float2 l9_112=float2(0.0);
float2 l9_113=float2(0.0);
ssGlobals l9_114=l9_106;
float2 l9_115;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_116=float2(0.0);
l9_116=l9_114.Surface_UVCoord0;
l9_109=l9_116;
l9_115=l9_109;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_117=float2(0.0);
l9_117=l9_114.Surface_UVCoord1;
l9_110=l9_117;
l9_115=l9_110;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_118=float2(0.0);
l9_118=l9_114.gScreenCoord;
l9_111=l9_118;
l9_115=l9_111;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_119=float2(0.0);
float2 l9_120=float2(0.0);
float2 l9_121=float2(0.0);
ssGlobals l9_122=l9_114;
float2 l9_123;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_124=float2(0.0);
float2 l9_125=float2(0.0);
float2 l9_126=float2(0.0);
ssGlobals l9_127=l9_122;
float2 l9_128;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_129=float2(0.0);
float2 l9_130=float2(0.0);
float2 l9_131=float2(0.0);
float2 l9_132=float2(0.0);
float2 l9_133=float2(0.0);
ssGlobals l9_134=l9_127;
float2 l9_135;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_136=float2(0.0);
l9_136=l9_134.Surface_UVCoord0;
l9_130=l9_136;
l9_135=l9_130;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_137=float2(0.0);
l9_137=l9_134.Surface_UVCoord1;
l9_131=l9_137;
l9_135=l9_131;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_138=float2(0.0);
l9_138=l9_134.gScreenCoord;
l9_132=l9_138;
l9_135=l9_132;
}
else
{
float2 l9_139=float2(0.0);
l9_139=l9_134.Surface_UVCoord0;
l9_133=l9_139;
l9_135=l9_133;
}
}
}
l9_129=l9_135;
float2 l9_140=float2(0.0);
float2 l9_141=(*sc_set0.UserUniforms).uv2Scale;
l9_140=l9_141;
float2 l9_142=float2(0.0);
l9_142=l9_140;
float2 l9_143=float2(0.0);
float2 l9_144=(*sc_set0.UserUniforms).uv2Offset;
l9_143=l9_144;
float2 l9_145=float2(0.0);
l9_145=l9_143;
float2 l9_146=float2(0.0);
l9_146=(l9_129*l9_142)+l9_145;
float2 l9_147=float2(0.0);
l9_147=l9_146+(l9_145*(l9_127.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_125=l9_147;
l9_128=l9_125;
}
else
{
float2 l9_148=float2(0.0);
float2 l9_149=float2(0.0);
float2 l9_150=float2(0.0);
float2 l9_151=float2(0.0);
float2 l9_152=float2(0.0);
ssGlobals l9_153=l9_127;
float2 l9_154;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_155=float2(0.0);
l9_155=l9_153.Surface_UVCoord0;
l9_149=l9_155;
l9_154=l9_149;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_156=float2(0.0);
l9_156=l9_153.Surface_UVCoord1;
l9_150=l9_156;
l9_154=l9_150;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_157=float2(0.0);
l9_157=l9_153.gScreenCoord;
l9_151=l9_157;
l9_154=l9_151;
}
else
{
float2 l9_158=float2(0.0);
l9_158=l9_153.Surface_UVCoord0;
l9_152=l9_158;
l9_154=l9_152;
}
}
}
l9_148=l9_154;
float2 l9_159=float2(0.0);
float2 l9_160=(*sc_set0.UserUniforms).uv2Scale;
l9_159=l9_160;
float2 l9_161=float2(0.0);
l9_161=l9_159;
float2 l9_162=float2(0.0);
float2 l9_163=(*sc_set0.UserUniforms).uv2Offset;
l9_162=l9_163;
float2 l9_164=float2(0.0);
l9_164=l9_162;
float2 l9_165=float2(0.0);
l9_165=(l9_148*l9_161)+l9_164;
l9_126=l9_165;
l9_128=l9_126;
}
l9_124=l9_128;
l9_120=l9_124;
l9_123=l9_120;
}
else
{
float2 l9_166=float2(0.0);
l9_166=l9_122.Surface_UVCoord0;
l9_121=l9_166;
l9_123=l9_121;
}
l9_119=l9_123;
float2 l9_167=float2(0.0);
l9_167=l9_119;
float2 l9_168=float2(0.0);
l9_168=l9_167;
l9_112=l9_168;
l9_115=l9_112;
}
else
{
float2 l9_169=float2(0.0);
l9_169=l9_114.Surface_UVCoord0;
l9_113=l9_169;
l9_115=l9_113;
}
}
}
}
l9_108=l9_115;
float2 l9_170=float2(0.0);
float2 l9_171=(*sc_set0.UserUniforms).uv3Scale;
l9_170=l9_171;
float2 l9_172=float2(0.0);
l9_172=l9_170;
float2 l9_173=float2(0.0);
float2 l9_174=(*sc_set0.UserUniforms).uv3Offset;
l9_173=l9_174;
float2 l9_175=float2(0.0);
l9_175=l9_173;
float2 l9_176=float2(0.0);
l9_176=(l9_108*l9_172)+l9_175;
float2 l9_177=float2(0.0);
l9_177=l9_176+(l9_175*(l9_106.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_104=l9_177;
l9_107=l9_104;
}
else
{
float2 l9_178=float2(0.0);
float2 l9_179=float2(0.0);
float2 l9_180=float2(0.0);
float2 l9_181=float2(0.0);
float2 l9_182=float2(0.0);
float2 l9_183=float2(0.0);
ssGlobals l9_184=l9_106;
float2 l9_185;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_186=float2(0.0);
l9_186=l9_184.Surface_UVCoord0;
l9_179=l9_186;
l9_185=l9_179;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_187=float2(0.0);
l9_187=l9_184.Surface_UVCoord1;
l9_180=l9_187;
l9_185=l9_180;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_188=float2(0.0);
l9_188=l9_184.gScreenCoord;
l9_181=l9_188;
l9_185=l9_181;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_189=float2(0.0);
float2 l9_190=float2(0.0);
float2 l9_191=float2(0.0);
ssGlobals l9_192=l9_184;
float2 l9_193;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_194=float2(0.0);
float2 l9_195=float2(0.0);
float2 l9_196=float2(0.0);
ssGlobals l9_197=l9_192;
float2 l9_198;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_199=float2(0.0);
float2 l9_200=float2(0.0);
float2 l9_201=float2(0.0);
float2 l9_202=float2(0.0);
float2 l9_203=float2(0.0);
ssGlobals l9_204=l9_197;
float2 l9_205;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_206=float2(0.0);
l9_206=l9_204.Surface_UVCoord0;
l9_200=l9_206;
l9_205=l9_200;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_207=float2(0.0);
l9_207=l9_204.Surface_UVCoord1;
l9_201=l9_207;
l9_205=l9_201;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_208=float2(0.0);
l9_208=l9_204.gScreenCoord;
l9_202=l9_208;
l9_205=l9_202;
}
else
{
float2 l9_209=float2(0.0);
l9_209=l9_204.Surface_UVCoord0;
l9_203=l9_209;
l9_205=l9_203;
}
}
}
l9_199=l9_205;
float2 l9_210=float2(0.0);
float2 l9_211=(*sc_set0.UserUniforms).uv2Scale;
l9_210=l9_211;
float2 l9_212=float2(0.0);
l9_212=l9_210;
float2 l9_213=float2(0.0);
float2 l9_214=(*sc_set0.UserUniforms).uv2Offset;
l9_213=l9_214;
float2 l9_215=float2(0.0);
l9_215=l9_213;
float2 l9_216=float2(0.0);
l9_216=(l9_199*l9_212)+l9_215;
float2 l9_217=float2(0.0);
l9_217=l9_216+(l9_215*(l9_197.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_195=l9_217;
l9_198=l9_195;
}
else
{
float2 l9_218=float2(0.0);
float2 l9_219=float2(0.0);
float2 l9_220=float2(0.0);
float2 l9_221=float2(0.0);
float2 l9_222=float2(0.0);
ssGlobals l9_223=l9_197;
float2 l9_224;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_225=float2(0.0);
l9_225=l9_223.Surface_UVCoord0;
l9_219=l9_225;
l9_224=l9_219;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_226=float2(0.0);
l9_226=l9_223.Surface_UVCoord1;
l9_220=l9_226;
l9_224=l9_220;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_227=float2(0.0);
l9_227=l9_223.gScreenCoord;
l9_221=l9_227;
l9_224=l9_221;
}
else
{
float2 l9_228=float2(0.0);
l9_228=l9_223.Surface_UVCoord0;
l9_222=l9_228;
l9_224=l9_222;
}
}
}
l9_218=l9_224;
float2 l9_229=float2(0.0);
float2 l9_230=(*sc_set0.UserUniforms).uv2Scale;
l9_229=l9_230;
float2 l9_231=float2(0.0);
l9_231=l9_229;
float2 l9_232=float2(0.0);
float2 l9_233=(*sc_set0.UserUniforms).uv2Offset;
l9_232=l9_233;
float2 l9_234=float2(0.0);
l9_234=l9_232;
float2 l9_235=float2(0.0);
l9_235=(l9_218*l9_231)+l9_234;
l9_196=l9_235;
l9_198=l9_196;
}
l9_194=l9_198;
l9_190=l9_194;
l9_193=l9_190;
}
else
{
float2 l9_236=float2(0.0);
l9_236=l9_192.Surface_UVCoord0;
l9_191=l9_236;
l9_193=l9_191;
}
l9_189=l9_193;
float2 l9_237=float2(0.0);
l9_237=l9_189;
float2 l9_238=float2(0.0);
l9_238=l9_237;
l9_182=l9_238;
l9_185=l9_182;
}
else
{
float2 l9_239=float2(0.0);
l9_239=l9_184.Surface_UVCoord0;
l9_183=l9_239;
l9_185=l9_183;
}
}
}
}
l9_178=l9_185;
float2 l9_240=float2(0.0);
float2 l9_241=(*sc_set0.UserUniforms).uv3Scale;
l9_240=l9_241;
float2 l9_242=float2(0.0);
l9_242=l9_240;
float2 l9_243=float2(0.0);
float2 l9_244=(*sc_set0.UserUniforms).uv3Offset;
l9_243=l9_244;
float2 l9_245=float2(0.0);
l9_245=l9_243;
float2 l9_246=float2(0.0);
l9_246=(l9_178*l9_242)+l9_245;
l9_105=l9_246;
l9_107=l9_105;
}
l9_103=l9_107;
l9_99=l9_103;
l9_102=l9_99;
}
else
{
float2 l9_247=float2(0.0);
l9_247=l9_101.Surface_UVCoord0;
l9_100=l9_247;
l9_102=l9_100;
}
l9_98=l9_102;
float2 l9_248=float2(0.0);
l9_248=l9_98;
float2 l9_249=float2(0.0);
l9_249=l9_248;
l9_42=l9_249;
l9_45=l9_42;
}
else
{
float2 l9_250=float2(0.0);
l9_250=l9_44.Surface_UVCoord0;
l9_43=l9_250;
l9_45=l9_43;
}
}
}
}
l9_38=l9_45;
float4 l9_251=float4(0.0);
int l9_252=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_253=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_253=0;
}
else
{
l9_253=in.varStereoViewID;
}
int l9_254=l9_253;
l9_252=1-l9_254;
}
else
{
int l9_255=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_255=0;
}
else
{
l9_255=in.varStereoViewID;
}
int l9_256=l9_255;
l9_252=l9_256;
}
int l9_257=l9_252;
int l9_258=baseTexLayout_tmp;
int l9_259=l9_257;
float2 l9_260=l9_38;
bool l9_261=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_262=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_263=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_264=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_265=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_266=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_267=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_268=0.0;
bool l9_269=l9_266&&(!l9_264);
float l9_270=1.0;
float l9_271=l9_260.x;
int l9_272=l9_263.x;
if (l9_272==1)
{
l9_271=fract(l9_271);
}
else
{
if (l9_272==2)
{
float l9_273=fract(l9_271);
float l9_274=l9_271-l9_273;
float l9_275=step(0.25,fract(l9_274*0.5));
l9_271=mix(l9_273,1.0-l9_273,fast::clamp(l9_275,0.0,1.0));
}
}
l9_260.x=l9_271;
float l9_276=l9_260.y;
int l9_277=l9_263.y;
if (l9_277==1)
{
l9_276=fract(l9_276);
}
else
{
if (l9_277==2)
{
float l9_278=fract(l9_276);
float l9_279=l9_276-l9_278;
float l9_280=step(0.25,fract(l9_279*0.5));
l9_276=mix(l9_278,1.0-l9_278,fast::clamp(l9_280,0.0,1.0));
}
}
l9_260.y=l9_276;
if (l9_264)
{
bool l9_281=l9_266;
bool l9_282;
if (l9_281)
{
l9_282=l9_263.x==3;
}
else
{
l9_282=l9_281;
}
float l9_283=l9_260.x;
float l9_284=l9_265.x;
float l9_285=l9_265.z;
bool l9_286=l9_282;
float l9_287=l9_270;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_260.x=l9_283;
l9_270=l9_287;
bool l9_290=l9_266;
bool l9_291;
if (l9_290)
{
l9_291=l9_263.y==3;
}
else
{
l9_291=l9_290;
}
float l9_292=l9_260.y;
float l9_293=l9_265.y;
float l9_294=l9_265.w;
bool l9_295=l9_291;
float l9_296=l9_270;
float l9_297=fast::clamp(l9_292,l9_293,l9_294);
float l9_298=step(abs(l9_292-l9_297),9.9999997e-06);
l9_296*=(l9_298+((1.0-float(l9_295))*(1.0-l9_298)));
l9_292=l9_297;
l9_260.y=l9_292;
l9_270=l9_296;
}
float2 l9_299=l9_260;
bool l9_300=l9_261;
float3x3 l9_301=l9_262;
if (l9_300)
{
l9_299=float2((l9_301*float3(l9_299,1.0)).xy);
}
float2 l9_302=l9_299;
float2 l9_303=l9_302;
float2 l9_304=l9_303;
l9_260=l9_304;
float l9_305=l9_260.x;
int l9_306=l9_263.x;
bool l9_307=l9_269;
float l9_308=l9_270;
if ((l9_306==0)||(l9_306==3))
{
float l9_309=l9_305;
float l9_310=0.0;
float l9_311=1.0;
bool l9_312=l9_307;
float l9_313=l9_308;
float l9_314=fast::clamp(l9_309,l9_310,l9_311);
float l9_315=step(abs(l9_309-l9_314),9.9999997e-06);
l9_313*=(l9_315+((1.0-float(l9_312))*(1.0-l9_315)));
l9_309=l9_314;
l9_305=l9_309;
l9_308=l9_313;
}
l9_260.x=l9_305;
l9_270=l9_308;
float l9_316=l9_260.y;
int l9_317=l9_263.y;
bool l9_318=l9_269;
float l9_319=l9_270;
if ((l9_317==0)||(l9_317==3))
{
float l9_320=l9_316;
float l9_321=0.0;
float l9_322=1.0;
bool l9_323=l9_318;
float l9_324=l9_319;
float l9_325=fast::clamp(l9_320,l9_321,l9_322);
float l9_326=step(abs(l9_320-l9_325),9.9999997e-06);
l9_324*=(l9_326+((1.0-float(l9_323))*(1.0-l9_326)));
l9_320=l9_325;
l9_316=l9_320;
l9_319=l9_324;
}
l9_260.y=l9_316;
l9_270=l9_319;
float2 l9_327=l9_260;
int l9_328=l9_258;
int l9_329=l9_259;
float l9_330=l9_268;
float2 l9_331=l9_327;
int l9_332=l9_328;
int l9_333=l9_329;
float3 l9_334=float3(0.0);
if (l9_332==0)
{
l9_334=float3(l9_331,0.0);
}
else
{
if (l9_332==1)
{
l9_334=float3(l9_331.x,(l9_331.y*0.5)+(0.5-(float(l9_333)*0.5)),0.0);
}
else
{
l9_334=float3(l9_331,float(l9_333));
}
}
float3 l9_335=l9_334;
float3 l9_336=l9_335;
float2 l9_337=l9_336.xy;
float l9_338=l9_330;
float4 l9_339=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_337,bias(l9_338));
float4 l9_340=l9_339;
float4 l9_341=l9_340;
if (l9_266)
{
l9_341=mix(l9_267,l9_341,float4(l9_270));
}
float4 l9_342=l9_341;
l9_251=l9_342;
l9_34=l9_251;
l9_37=l9_34;
}
else
{
l9_37=l9_35;
}
l9_33=l9_37;
float4 l9_343=float4(0.0);
l9_343=l9_32*l9_33;
float4 l9_344=float4(0.0);
l9_344=l9_343;
float4 l9_345=float4(0.0);
l9_345=l9_344;
float l9_346=0.0;
float l9_347=0.0;
float l9_348=0.0;
float3 l9_349=l9_345.xyz;
float l9_350=l9_349.x;
float l9_351=l9_349.y;
float l9_352=l9_349.z;
l9_346=l9_350;
l9_347=l9_351;
l9_348=l9_352;
float3 l9_353=float3(0.0);
l9_353=l9_29*float3(l9_346);
float3 l9_354=float3(0.0);
float3 l9_355=(*sc_set0.UserUniforms).recolorGreen;
l9_354=l9_355;
float3 l9_356=float3(0.0);
l9_356=l9_354;
float3 l9_357=float3(0.0);
l9_357=l9_356*float3(l9_347);
float3 l9_358=float3(0.0);
float3 l9_359=(*sc_set0.UserUniforms).recolorBlue;
l9_358=l9_359;
float3 l9_360=float3(0.0);
l9_360=l9_358;
float3 l9_361=float3(0.0);
l9_361=l9_360*float3(l9_348);
float3 l9_362=float3(0.0);
l9_362=(l9_353+l9_357)+l9_361;
l9_23=l9_362;
l9_26=l9_23;
}
else
{
float4 l9_363=float4(0.0);
float4 l9_364=(*sc_set0.UserUniforms).baseColor;
l9_363=l9_364;
float4 l9_365=float4(0.0);
l9_365=l9_363;
float4 l9_366=float4(0.0);
float4 l9_367=float4(0.0);
float4 l9_368=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_369=l9_25;
float4 l9_370;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_371=float2(0.0);
float2 l9_372=float2(0.0);
float2 l9_373=float2(0.0);
float2 l9_374=float2(0.0);
float2 l9_375=float2(0.0);
float2 l9_376=float2(0.0);
ssGlobals l9_377=l9_369;
float2 l9_378;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_379=float2(0.0);
l9_379=l9_377.Surface_UVCoord0;
l9_372=l9_379;
l9_378=l9_372;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_380=float2(0.0);
l9_380=l9_377.Surface_UVCoord1;
l9_373=l9_380;
l9_378=l9_373;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_381=float2(0.0);
float2 l9_382=float2(0.0);
float2 l9_383=float2(0.0);
ssGlobals l9_384=l9_377;
float2 l9_385;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_386=float2(0.0);
float2 l9_387=float2(0.0);
float2 l9_388=float2(0.0);
ssGlobals l9_389=l9_384;
float2 l9_390;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_391=float2(0.0);
float2 l9_392=float2(0.0);
float2 l9_393=float2(0.0);
float2 l9_394=float2(0.0);
float2 l9_395=float2(0.0);
ssGlobals l9_396=l9_389;
float2 l9_397;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_398=float2(0.0);
l9_398=l9_396.Surface_UVCoord0;
l9_392=l9_398;
l9_397=l9_392;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_399=float2(0.0);
l9_399=l9_396.Surface_UVCoord1;
l9_393=l9_399;
l9_397=l9_393;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_400=float2(0.0);
l9_400=l9_396.gScreenCoord;
l9_394=l9_400;
l9_397=l9_394;
}
else
{
float2 l9_401=float2(0.0);
l9_401=l9_396.Surface_UVCoord0;
l9_395=l9_401;
l9_397=l9_395;
}
}
}
l9_391=l9_397;
float2 l9_402=float2(0.0);
float2 l9_403=(*sc_set0.UserUniforms).uv2Scale;
l9_402=l9_403;
float2 l9_404=float2(0.0);
l9_404=l9_402;
float2 l9_405=float2(0.0);
float2 l9_406=(*sc_set0.UserUniforms).uv2Offset;
l9_405=l9_406;
float2 l9_407=float2(0.0);
l9_407=l9_405;
float2 l9_408=float2(0.0);
l9_408=(l9_391*l9_404)+l9_407;
float2 l9_409=float2(0.0);
l9_409=l9_408+(l9_407*(l9_389.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_387=l9_409;
l9_390=l9_387;
}
else
{
float2 l9_410=float2(0.0);
float2 l9_411=float2(0.0);
float2 l9_412=float2(0.0);
float2 l9_413=float2(0.0);
float2 l9_414=float2(0.0);
ssGlobals l9_415=l9_389;
float2 l9_416;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_417=float2(0.0);
l9_417=l9_415.Surface_UVCoord0;
l9_411=l9_417;
l9_416=l9_411;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_418=float2(0.0);
l9_418=l9_415.Surface_UVCoord1;
l9_412=l9_418;
l9_416=l9_412;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_419=float2(0.0);
l9_419=l9_415.gScreenCoord;
l9_413=l9_419;
l9_416=l9_413;
}
else
{
float2 l9_420=float2(0.0);
l9_420=l9_415.Surface_UVCoord0;
l9_414=l9_420;
l9_416=l9_414;
}
}
}
l9_410=l9_416;
float2 l9_421=float2(0.0);
float2 l9_422=(*sc_set0.UserUniforms).uv2Scale;
l9_421=l9_422;
float2 l9_423=float2(0.0);
l9_423=l9_421;
float2 l9_424=float2(0.0);
float2 l9_425=(*sc_set0.UserUniforms).uv2Offset;
l9_424=l9_425;
float2 l9_426=float2(0.0);
l9_426=l9_424;
float2 l9_427=float2(0.0);
l9_427=(l9_410*l9_423)+l9_426;
l9_388=l9_427;
l9_390=l9_388;
}
l9_386=l9_390;
l9_382=l9_386;
l9_385=l9_382;
}
else
{
float2 l9_428=float2(0.0);
l9_428=l9_384.Surface_UVCoord0;
l9_383=l9_428;
l9_385=l9_383;
}
l9_381=l9_385;
float2 l9_429=float2(0.0);
l9_429=l9_381;
float2 l9_430=float2(0.0);
l9_430=l9_429;
l9_374=l9_430;
l9_378=l9_374;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_431=float2(0.0);
float2 l9_432=float2(0.0);
float2 l9_433=float2(0.0);
ssGlobals l9_434=l9_377;
float2 l9_435;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_436=float2(0.0);
float2 l9_437=float2(0.0);
float2 l9_438=float2(0.0);
ssGlobals l9_439=l9_434;
float2 l9_440;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_441=float2(0.0);
float2 l9_442=float2(0.0);
float2 l9_443=float2(0.0);
float2 l9_444=float2(0.0);
float2 l9_445=float2(0.0);
float2 l9_446=float2(0.0);
ssGlobals l9_447=l9_439;
float2 l9_448;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_449=float2(0.0);
l9_449=l9_447.Surface_UVCoord0;
l9_442=l9_449;
l9_448=l9_442;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_450=float2(0.0);
l9_450=l9_447.Surface_UVCoord1;
l9_443=l9_450;
l9_448=l9_443;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_451=float2(0.0);
l9_451=l9_447.gScreenCoord;
l9_444=l9_451;
l9_448=l9_444;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_452=float2(0.0);
float2 l9_453=float2(0.0);
float2 l9_454=float2(0.0);
ssGlobals l9_455=l9_447;
float2 l9_456;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_457=float2(0.0);
float2 l9_458=float2(0.0);
float2 l9_459=float2(0.0);
ssGlobals l9_460=l9_455;
float2 l9_461;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_462=float2(0.0);
float2 l9_463=float2(0.0);
float2 l9_464=float2(0.0);
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
ssGlobals l9_467=l9_460;
float2 l9_468;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_469=float2(0.0);
l9_469=l9_467.Surface_UVCoord0;
l9_463=l9_469;
l9_468=l9_463;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_470=float2(0.0);
l9_470=l9_467.Surface_UVCoord1;
l9_464=l9_470;
l9_468=l9_464;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_471=float2(0.0);
l9_471=l9_467.gScreenCoord;
l9_465=l9_471;
l9_468=l9_465;
}
else
{
float2 l9_472=float2(0.0);
l9_472=l9_467.Surface_UVCoord0;
l9_466=l9_472;
l9_468=l9_466;
}
}
}
l9_462=l9_468;
float2 l9_473=float2(0.0);
float2 l9_474=(*sc_set0.UserUniforms).uv2Scale;
l9_473=l9_474;
float2 l9_475=float2(0.0);
l9_475=l9_473;
float2 l9_476=float2(0.0);
float2 l9_477=(*sc_set0.UserUniforms).uv2Offset;
l9_476=l9_477;
float2 l9_478=float2(0.0);
l9_478=l9_476;
float2 l9_479=float2(0.0);
l9_479=(l9_462*l9_475)+l9_478;
float2 l9_480=float2(0.0);
l9_480=l9_479+(l9_478*(l9_460.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_458=l9_480;
l9_461=l9_458;
}
else
{
float2 l9_481=float2(0.0);
float2 l9_482=float2(0.0);
float2 l9_483=float2(0.0);
float2 l9_484=float2(0.0);
float2 l9_485=float2(0.0);
ssGlobals l9_486=l9_460;
float2 l9_487;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_488=float2(0.0);
l9_488=l9_486.Surface_UVCoord0;
l9_482=l9_488;
l9_487=l9_482;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_489=float2(0.0);
l9_489=l9_486.Surface_UVCoord1;
l9_483=l9_489;
l9_487=l9_483;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_490=float2(0.0);
l9_490=l9_486.gScreenCoord;
l9_484=l9_490;
l9_487=l9_484;
}
else
{
float2 l9_491=float2(0.0);
l9_491=l9_486.Surface_UVCoord0;
l9_485=l9_491;
l9_487=l9_485;
}
}
}
l9_481=l9_487;
float2 l9_492=float2(0.0);
float2 l9_493=(*sc_set0.UserUniforms).uv2Scale;
l9_492=l9_493;
float2 l9_494=float2(0.0);
l9_494=l9_492;
float2 l9_495=float2(0.0);
float2 l9_496=(*sc_set0.UserUniforms).uv2Offset;
l9_495=l9_496;
float2 l9_497=float2(0.0);
l9_497=l9_495;
float2 l9_498=float2(0.0);
l9_498=(l9_481*l9_494)+l9_497;
l9_459=l9_498;
l9_461=l9_459;
}
l9_457=l9_461;
l9_453=l9_457;
l9_456=l9_453;
}
else
{
float2 l9_499=float2(0.0);
l9_499=l9_455.Surface_UVCoord0;
l9_454=l9_499;
l9_456=l9_454;
}
l9_452=l9_456;
float2 l9_500=float2(0.0);
l9_500=l9_452;
float2 l9_501=float2(0.0);
l9_501=l9_500;
l9_445=l9_501;
l9_448=l9_445;
}
else
{
float2 l9_502=float2(0.0);
l9_502=l9_447.Surface_UVCoord0;
l9_446=l9_502;
l9_448=l9_446;
}
}
}
}
l9_441=l9_448;
float2 l9_503=float2(0.0);
float2 l9_504=(*sc_set0.UserUniforms).uv3Scale;
l9_503=l9_504;
float2 l9_505=float2(0.0);
l9_505=l9_503;
float2 l9_506=float2(0.0);
float2 l9_507=(*sc_set0.UserUniforms).uv3Offset;
l9_506=l9_507;
float2 l9_508=float2(0.0);
l9_508=l9_506;
float2 l9_509=float2(0.0);
l9_509=(l9_441*l9_505)+l9_508;
float2 l9_510=float2(0.0);
l9_510=l9_509+(l9_508*(l9_439.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_437=l9_510;
l9_440=l9_437;
}
else
{
float2 l9_511=float2(0.0);
float2 l9_512=float2(0.0);
float2 l9_513=float2(0.0);
float2 l9_514=float2(0.0);
float2 l9_515=float2(0.0);
float2 l9_516=float2(0.0);
ssGlobals l9_517=l9_439;
float2 l9_518;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_519=float2(0.0);
l9_519=l9_517.Surface_UVCoord0;
l9_512=l9_519;
l9_518=l9_512;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_520=float2(0.0);
l9_520=l9_517.Surface_UVCoord1;
l9_513=l9_520;
l9_518=l9_513;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_521=float2(0.0);
l9_521=l9_517.gScreenCoord;
l9_514=l9_521;
l9_518=l9_514;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_522=float2(0.0);
float2 l9_523=float2(0.0);
float2 l9_524=float2(0.0);
ssGlobals l9_525=l9_517;
float2 l9_526;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_527=float2(0.0);
float2 l9_528=float2(0.0);
float2 l9_529=float2(0.0);
ssGlobals l9_530=l9_525;
float2 l9_531;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_532=float2(0.0);
float2 l9_533=float2(0.0);
float2 l9_534=float2(0.0);
float2 l9_535=float2(0.0);
float2 l9_536=float2(0.0);
ssGlobals l9_537=l9_530;
float2 l9_538;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_539=float2(0.0);
l9_539=l9_537.Surface_UVCoord0;
l9_533=l9_539;
l9_538=l9_533;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_540=float2(0.0);
l9_540=l9_537.Surface_UVCoord1;
l9_534=l9_540;
l9_538=l9_534;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_541=float2(0.0);
l9_541=l9_537.gScreenCoord;
l9_535=l9_541;
l9_538=l9_535;
}
else
{
float2 l9_542=float2(0.0);
l9_542=l9_537.Surface_UVCoord0;
l9_536=l9_542;
l9_538=l9_536;
}
}
}
l9_532=l9_538;
float2 l9_543=float2(0.0);
float2 l9_544=(*sc_set0.UserUniforms).uv2Scale;
l9_543=l9_544;
float2 l9_545=float2(0.0);
l9_545=l9_543;
float2 l9_546=float2(0.0);
float2 l9_547=(*sc_set0.UserUniforms).uv2Offset;
l9_546=l9_547;
float2 l9_548=float2(0.0);
l9_548=l9_546;
float2 l9_549=float2(0.0);
l9_549=(l9_532*l9_545)+l9_548;
float2 l9_550=float2(0.0);
l9_550=l9_549+(l9_548*(l9_530.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_528=l9_550;
l9_531=l9_528;
}
else
{
float2 l9_551=float2(0.0);
float2 l9_552=float2(0.0);
float2 l9_553=float2(0.0);
float2 l9_554=float2(0.0);
float2 l9_555=float2(0.0);
ssGlobals l9_556=l9_530;
float2 l9_557;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_558=float2(0.0);
l9_558=l9_556.Surface_UVCoord0;
l9_552=l9_558;
l9_557=l9_552;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_559=float2(0.0);
l9_559=l9_556.Surface_UVCoord1;
l9_553=l9_559;
l9_557=l9_553;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_560=float2(0.0);
l9_560=l9_556.gScreenCoord;
l9_554=l9_560;
l9_557=l9_554;
}
else
{
float2 l9_561=float2(0.0);
l9_561=l9_556.Surface_UVCoord0;
l9_555=l9_561;
l9_557=l9_555;
}
}
}
l9_551=l9_557;
float2 l9_562=float2(0.0);
float2 l9_563=(*sc_set0.UserUniforms).uv2Scale;
l9_562=l9_563;
float2 l9_564=float2(0.0);
l9_564=l9_562;
float2 l9_565=float2(0.0);
float2 l9_566=(*sc_set0.UserUniforms).uv2Offset;
l9_565=l9_566;
float2 l9_567=float2(0.0);
l9_567=l9_565;
float2 l9_568=float2(0.0);
l9_568=(l9_551*l9_564)+l9_567;
l9_529=l9_568;
l9_531=l9_529;
}
l9_527=l9_531;
l9_523=l9_527;
l9_526=l9_523;
}
else
{
float2 l9_569=float2(0.0);
l9_569=l9_525.Surface_UVCoord0;
l9_524=l9_569;
l9_526=l9_524;
}
l9_522=l9_526;
float2 l9_570=float2(0.0);
l9_570=l9_522;
float2 l9_571=float2(0.0);
l9_571=l9_570;
l9_515=l9_571;
l9_518=l9_515;
}
else
{
float2 l9_572=float2(0.0);
l9_572=l9_517.Surface_UVCoord0;
l9_516=l9_572;
l9_518=l9_516;
}
}
}
}
l9_511=l9_518;
float2 l9_573=float2(0.0);
float2 l9_574=(*sc_set0.UserUniforms).uv3Scale;
l9_573=l9_574;
float2 l9_575=float2(0.0);
l9_575=l9_573;
float2 l9_576=float2(0.0);
float2 l9_577=(*sc_set0.UserUniforms).uv3Offset;
l9_576=l9_577;
float2 l9_578=float2(0.0);
l9_578=l9_576;
float2 l9_579=float2(0.0);
l9_579=(l9_511*l9_575)+l9_578;
l9_438=l9_579;
l9_440=l9_438;
}
l9_436=l9_440;
l9_432=l9_436;
l9_435=l9_432;
}
else
{
float2 l9_580=float2(0.0);
l9_580=l9_434.Surface_UVCoord0;
l9_433=l9_580;
l9_435=l9_433;
}
l9_431=l9_435;
float2 l9_581=float2(0.0);
l9_581=l9_431;
float2 l9_582=float2(0.0);
l9_582=l9_581;
l9_375=l9_582;
l9_378=l9_375;
}
else
{
float2 l9_583=float2(0.0);
l9_583=l9_377.Surface_UVCoord0;
l9_376=l9_583;
l9_378=l9_376;
}
}
}
}
l9_371=l9_378;
float4 l9_584=float4(0.0);
int l9_585=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_586=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_586=0;
}
else
{
l9_586=in.varStereoViewID;
}
int l9_587=l9_586;
l9_585=1-l9_587;
}
else
{
int l9_588=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_588=0;
}
else
{
l9_588=in.varStereoViewID;
}
int l9_589=l9_588;
l9_585=l9_589;
}
int l9_590=l9_585;
int l9_591=baseTexLayout_tmp;
int l9_592=l9_590;
float2 l9_593=l9_371;
bool l9_594=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_595=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_596=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_597=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_598=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_599=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_600=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_601=0.0;
bool l9_602=l9_599&&(!l9_597);
float l9_603=1.0;
float l9_604=l9_593.x;
int l9_605=l9_596.x;
if (l9_605==1)
{
l9_604=fract(l9_604);
}
else
{
if (l9_605==2)
{
float l9_606=fract(l9_604);
float l9_607=l9_604-l9_606;
float l9_608=step(0.25,fract(l9_607*0.5));
l9_604=mix(l9_606,1.0-l9_606,fast::clamp(l9_608,0.0,1.0));
}
}
l9_593.x=l9_604;
float l9_609=l9_593.y;
int l9_610=l9_596.y;
if (l9_610==1)
{
l9_609=fract(l9_609);
}
else
{
if (l9_610==2)
{
float l9_611=fract(l9_609);
float l9_612=l9_609-l9_611;
float l9_613=step(0.25,fract(l9_612*0.5));
l9_609=mix(l9_611,1.0-l9_611,fast::clamp(l9_613,0.0,1.0));
}
}
l9_593.y=l9_609;
if (l9_597)
{
bool l9_614=l9_599;
bool l9_615;
if (l9_614)
{
l9_615=l9_596.x==3;
}
else
{
l9_615=l9_614;
}
float l9_616=l9_593.x;
float l9_617=l9_598.x;
float l9_618=l9_598.z;
bool l9_619=l9_615;
float l9_620=l9_603;
float l9_621=fast::clamp(l9_616,l9_617,l9_618);
float l9_622=step(abs(l9_616-l9_621),9.9999997e-06);
l9_620*=(l9_622+((1.0-float(l9_619))*(1.0-l9_622)));
l9_616=l9_621;
l9_593.x=l9_616;
l9_603=l9_620;
bool l9_623=l9_599;
bool l9_624;
if (l9_623)
{
l9_624=l9_596.y==3;
}
else
{
l9_624=l9_623;
}
float l9_625=l9_593.y;
float l9_626=l9_598.y;
float l9_627=l9_598.w;
bool l9_628=l9_624;
float l9_629=l9_603;
float l9_630=fast::clamp(l9_625,l9_626,l9_627);
float l9_631=step(abs(l9_625-l9_630),9.9999997e-06);
l9_629*=(l9_631+((1.0-float(l9_628))*(1.0-l9_631)));
l9_625=l9_630;
l9_593.y=l9_625;
l9_603=l9_629;
}
float2 l9_632=l9_593;
bool l9_633=l9_594;
float3x3 l9_634=l9_595;
if (l9_633)
{
l9_632=float2((l9_634*float3(l9_632,1.0)).xy);
}
float2 l9_635=l9_632;
float2 l9_636=l9_635;
float2 l9_637=l9_636;
l9_593=l9_637;
float l9_638=l9_593.x;
int l9_639=l9_596.x;
bool l9_640=l9_602;
float l9_641=l9_603;
if ((l9_639==0)||(l9_639==3))
{
float l9_642=l9_638;
float l9_643=0.0;
float l9_644=1.0;
bool l9_645=l9_640;
float l9_646=l9_641;
float l9_647=fast::clamp(l9_642,l9_643,l9_644);
float l9_648=step(abs(l9_642-l9_647),9.9999997e-06);
l9_646*=(l9_648+((1.0-float(l9_645))*(1.0-l9_648)));
l9_642=l9_647;
l9_638=l9_642;
l9_641=l9_646;
}
l9_593.x=l9_638;
l9_603=l9_641;
float l9_649=l9_593.y;
int l9_650=l9_596.y;
bool l9_651=l9_602;
float l9_652=l9_603;
if ((l9_650==0)||(l9_650==3))
{
float l9_653=l9_649;
float l9_654=0.0;
float l9_655=1.0;
bool l9_656=l9_651;
float l9_657=l9_652;
float l9_658=fast::clamp(l9_653,l9_654,l9_655);
float l9_659=step(abs(l9_653-l9_658),9.9999997e-06);
l9_657*=(l9_659+((1.0-float(l9_656))*(1.0-l9_659)));
l9_653=l9_658;
l9_649=l9_653;
l9_652=l9_657;
}
l9_593.y=l9_649;
l9_603=l9_652;
float2 l9_660=l9_593;
int l9_661=l9_591;
int l9_662=l9_592;
float l9_663=l9_601;
float2 l9_664=l9_660;
int l9_665=l9_661;
int l9_666=l9_662;
float3 l9_667=float3(0.0);
if (l9_665==0)
{
l9_667=float3(l9_664,0.0);
}
else
{
if (l9_665==1)
{
l9_667=float3(l9_664.x,(l9_664.y*0.5)+(0.5-(float(l9_666)*0.5)),0.0);
}
else
{
l9_667=float3(l9_664,float(l9_666));
}
}
float3 l9_668=l9_667;
float3 l9_669=l9_668;
float2 l9_670=l9_669.xy;
float l9_671=l9_663;
float4 l9_672=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_670,bias(l9_671));
float4 l9_673=l9_672;
float4 l9_674=l9_673;
if (l9_599)
{
l9_674=mix(l9_600,l9_674,float4(l9_603));
}
float4 l9_675=l9_674;
l9_584=l9_675;
l9_367=l9_584;
l9_370=l9_367;
}
else
{
l9_370=l9_368;
}
l9_366=l9_370;
float4 l9_676=float4(0.0);
l9_676=l9_365*l9_366;
float4 l9_677=float4(0.0);
l9_677=l9_676;
float4 l9_678=float4(0.0);
l9_678=l9_677;
l9_24=l9_678.xyz;
l9_26=l9_24;
}
l9_22=l9_26;
float3 l9_679=float3(0.0);
l9_679=l9_22;
float3 l9_680=float3(0.0);
l9_680=l9_679;
float4 l9_681=float4(0.0);
l9_681=float4(l9_680.x,l9_680.y,l9_680.z,l9_681.w);
l9_681.w=(*sc_set0.UserUniforms).Port_Value2_N073;
float4 l9_682=float4(0.0);
l9_682=l9_21*l9_681;
param=l9_682;
param_2=param;
}
else
{
float3 l9_683=float3(0.0);
float3 l9_684=float3(0.0);
float3 l9_685=float3(0.0);
ssGlobals l9_686=param_3;
float3 l9_687;
if ((int(Tweak_N37_tmp)!=0))
{
float3 l9_688=float3(0.0);
float3 l9_689=(*sc_set0.UserUniforms).recolorRed;
l9_688=l9_689;
float3 l9_690=float3(0.0);
l9_690=l9_688;
float4 l9_691=float4(0.0);
float4 l9_692=(*sc_set0.UserUniforms).baseColor;
l9_691=l9_692;
float4 l9_693=float4(0.0);
l9_693=l9_691;
float4 l9_694=float4(0.0);
float4 l9_695=float4(0.0);
float4 l9_696=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_697=l9_686;
float4 l9_698;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_699=float2(0.0);
float2 l9_700=float2(0.0);
float2 l9_701=float2(0.0);
float2 l9_702=float2(0.0);
float2 l9_703=float2(0.0);
float2 l9_704=float2(0.0);
ssGlobals l9_705=l9_697;
float2 l9_706;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_707=float2(0.0);
l9_707=l9_705.Surface_UVCoord0;
l9_700=l9_707;
l9_706=l9_700;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_708=float2(0.0);
l9_708=l9_705.Surface_UVCoord1;
l9_701=l9_708;
l9_706=l9_701;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_709=float2(0.0);
float2 l9_710=float2(0.0);
float2 l9_711=float2(0.0);
ssGlobals l9_712=l9_705;
float2 l9_713;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_714=float2(0.0);
float2 l9_715=float2(0.0);
float2 l9_716=float2(0.0);
ssGlobals l9_717=l9_712;
float2 l9_718;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_719=float2(0.0);
float2 l9_720=float2(0.0);
float2 l9_721=float2(0.0);
float2 l9_722=float2(0.0);
float2 l9_723=float2(0.0);
ssGlobals l9_724=l9_717;
float2 l9_725;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_726=float2(0.0);
l9_726=l9_724.Surface_UVCoord0;
l9_720=l9_726;
l9_725=l9_720;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_727=float2(0.0);
l9_727=l9_724.Surface_UVCoord1;
l9_721=l9_727;
l9_725=l9_721;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_728=float2(0.0);
l9_728=l9_724.gScreenCoord;
l9_722=l9_728;
l9_725=l9_722;
}
else
{
float2 l9_729=float2(0.0);
l9_729=l9_724.Surface_UVCoord0;
l9_723=l9_729;
l9_725=l9_723;
}
}
}
l9_719=l9_725;
float2 l9_730=float2(0.0);
float2 l9_731=(*sc_set0.UserUniforms).uv2Scale;
l9_730=l9_731;
float2 l9_732=float2(0.0);
l9_732=l9_730;
float2 l9_733=float2(0.0);
float2 l9_734=(*sc_set0.UserUniforms).uv2Offset;
l9_733=l9_734;
float2 l9_735=float2(0.0);
l9_735=l9_733;
float2 l9_736=float2(0.0);
l9_736=(l9_719*l9_732)+l9_735;
float2 l9_737=float2(0.0);
l9_737=l9_736+(l9_735*(l9_717.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_715=l9_737;
l9_718=l9_715;
}
else
{
float2 l9_738=float2(0.0);
float2 l9_739=float2(0.0);
float2 l9_740=float2(0.0);
float2 l9_741=float2(0.0);
float2 l9_742=float2(0.0);
ssGlobals l9_743=l9_717;
float2 l9_744;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_745=float2(0.0);
l9_745=l9_743.Surface_UVCoord0;
l9_739=l9_745;
l9_744=l9_739;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_746=float2(0.0);
l9_746=l9_743.Surface_UVCoord1;
l9_740=l9_746;
l9_744=l9_740;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_747=float2(0.0);
l9_747=l9_743.gScreenCoord;
l9_741=l9_747;
l9_744=l9_741;
}
else
{
float2 l9_748=float2(0.0);
l9_748=l9_743.Surface_UVCoord0;
l9_742=l9_748;
l9_744=l9_742;
}
}
}
l9_738=l9_744;
float2 l9_749=float2(0.0);
float2 l9_750=(*sc_set0.UserUniforms).uv2Scale;
l9_749=l9_750;
float2 l9_751=float2(0.0);
l9_751=l9_749;
float2 l9_752=float2(0.0);
float2 l9_753=(*sc_set0.UserUniforms).uv2Offset;
l9_752=l9_753;
float2 l9_754=float2(0.0);
l9_754=l9_752;
float2 l9_755=float2(0.0);
l9_755=(l9_738*l9_751)+l9_754;
l9_716=l9_755;
l9_718=l9_716;
}
l9_714=l9_718;
l9_710=l9_714;
l9_713=l9_710;
}
else
{
float2 l9_756=float2(0.0);
l9_756=l9_712.Surface_UVCoord0;
l9_711=l9_756;
l9_713=l9_711;
}
l9_709=l9_713;
float2 l9_757=float2(0.0);
l9_757=l9_709;
float2 l9_758=float2(0.0);
l9_758=l9_757;
l9_702=l9_758;
l9_706=l9_702;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_759=float2(0.0);
float2 l9_760=float2(0.0);
float2 l9_761=float2(0.0);
ssGlobals l9_762=l9_705;
float2 l9_763;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_764=float2(0.0);
float2 l9_765=float2(0.0);
float2 l9_766=float2(0.0);
ssGlobals l9_767=l9_762;
float2 l9_768;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_769=float2(0.0);
float2 l9_770=float2(0.0);
float2 l9_771=float2(0.0);
float2 l9_772=float2(0.0);
float2 l9_773=float2(0.0);
float2 l9_774=float2(0.0);
ssGlobals l9_775=l9_767;
float2 l9_776;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_777=float2(0.0);
l9_777=l9_775.Surface_UVCoord0;
l9_770=l9_777;
l9_776=l9_770;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_778=float2(0.0);
l9_778=l9_775.Surface_UVCoord1;
l9_771=l9_778;
l9_776=l9_771;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_779=float2(0.0);
l9_779=l9_775.gScreenCoord;
l9_772=l9_779;
l9_776=l9_772;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_780=float2(0.0);
float2 l9_781=float2(0.0);
float2 l9_782=float2(0.0);
ssGlobals l9_783=l9_775;
float2 l9_784;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_785=float2(0.0);
float2 l9_786=float2(0.0);
float2 l9_787=float2(0.0);
ssGlobals l9_788=l9_783;
float2 l9_789;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_790=float2(0.0);
float2 l9_791=float2(0.0);
float2 l9_792=float2(0.0);
float2 l9_793=float2(0.0);
float2 l9_794=float2(0.0);
ssGlobals l9_795=l9_788;
float2 l9_796;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_797=float2(0.0);
l9_797=l9_795.Surface_UVCoord0;
l9_791=l9_797;
l9_796=l9_791;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_798=float2(0.0);
l9_798=l9_795.Surface_UVCoord1;
l9_792=l9_798;
l9_796=l9_792;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_799=float2(0.0);
l9_799=l9_795.gScreenCoord;
l9_793=l9_799;
l9_796=l9_793;
}
else
{
float2 l9_800=float2(0.0);
l9_800=l9_795.Surface_UVCoord0;
l9_794=l9_800;
l9_796=l9_794;
}
}
}
l9_790=l9_796;
float2 l9_801=float2(0.0);
float2 l9_802=(*sc_set0.UserUniforms).uv2Scale;
l9_801=l9_802;
float2 l9_803=float2(0.0);
l9_803=l9_801;
float2 l9_804=float2(0.0);
float2 l9_805=(*sc_set0.UserUniforms).uv2Offset;
l9_804=l9_805;
float2 l9_806=float2(0.0);
l9_806=l9_804;
float2 l9_807=float2(0.0);
l9_807=(l9_790*l9_803)+l9_806;
float2 l9_808=float2(0.0);
l9_808=l9_807+(l9_806*(l9_788.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_786=l9_808;
l9_789=l9_786;
}
else
{
float2 l9_809=float2(0.0);
float2 l9_810=float2(0.0);
float2 l9_811=float2(0.0);
float2 l9_812=float2(0.0);
float2 l9_813=float2(0.0);
ssGlobals l9_814=l9_788;
float2 l9_815;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_816=float2(0.0);
l9_816=l9_814.Surface_UVCoord0;
l9_810=l9_816;
l9_815=l9_810;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_817=float2(0.0);
l9_817=l9_814.Surface_UVCoord1;
l9_811=l9_817;
l9_815=l9_811;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_818=float2(0.0);
l9_818=l9_814.gScreenCoord;
l9_812=l9_818;
l9_815=l9_812;
}
else
{
float2 l9_819=float2(0.0);
l9_819=l9_814.Surface_UVCoord0;
l9_813=l9_819;
l9_815=l9_813;
}
}
}
l9_809=l9_815;
float2 l9_820=float2(0.0);
float2 l9_821=(*sc_set0.UserUniforms).uv2Scale;
l9_820=l9_821;
float2 l9_822=float2(0.0);
l9_822=l9_820;
float2 l9_823=float2(0.0);
float2 l9_824=(*sc_set0.UserUniforms).uv2Offset;
l9_823=l9_824;
float2 l9_825=float2(0.0);
l9_825=l9_823;
float2 l9_826=float2(0.0);
l9_826=(l9_809*l9_822)+l9_825;
l9_787=l9_826;
l9_789=l9_787;
}
l9_785=l9_789;
l9_781=l9_785;
l9_784=l9_781;
}
else
{
float2 l9_827=float2(0.0);
l9_827=l9_783.Surface_UVCoord0;
l9_782=l9_827;
l9_784=l9_782;
}
l9_780=l9_784;
float2 l9_828=float2(0.0);
l9_828=l9_780;
float2 l9_829=float2(0.0);
l9_829=l9_828;
l9_773=l9_829;
l9_776=l9_773;
}
else
{
float2 l9_830=float2(0.0);
l9_830=l9_775.Surface_UVCoord0;
l9_774=l9_830;
l9_776=l9_774;
}
}
}
}
l9_769=l9_776;
float2 l9_831=float2(0.0);
float2 l9_832=(*sc_set0.UserUniforms).uv3Scale;
l9_831=l9_832;
float2 l9_833=float2(0.0);
l9_833=l9_831;
float2 l9_834=float2(0.0);
float2 l9_835=(*sc_set0.UserUniforms).uv3Offset;
l9_834=l9_835;
float2 l9_836=float2(0.0);
l9_836=l9_834;
float2 l9_837=float2(0.0);
l9_837=(l9_769*l9_833)+l9_836;
float2 l9_838=float2(0.0);
l9_838=l9_837+(l9_836*(l9_767.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_765=l9_838;
l9_768=l9_765;
}
else
{
float2 l9_839=float2(0.0);
float2 l9_840=float2(0.0);
float2 l9_841=float2(0.0);
float2 l9_842=float2(0.0);
float2 l9_843=float2(0.0);
float2 l9_844=float2(0.0);
ssGlobals l9_845=l9_767;
float2 l9_846;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_847=float2(0.0);
l9_847=l9_845.Surface_UVCoord0;
l9_840=l9_847;
l9_846=l9_840;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_848=float2(0.0);
l9_848=l9_845.Surface_UVCoord1;
l9_841=l9_848;
l9_846=l9_841;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_849=float2(0.0);
l9_849=l9_845.gScreenCoord;
l9_842=l9_849;
l9_846=l9_842;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_850=float2(0.0);
float2 l9_851=float2(0.0);
float2 l9_852=float2(0.0);
ssGlobals l9_853=l9_845;
float2 l9_854;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_855=float2(0.0);
float2 l9_856=float2(0.0);
float2 l9_857=float2(0.0);
ssGlobals l9_858=l9_853;
float2 l9_859;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_860=float2(0.0);
float2 l9_861=float2(0.0);
float2 l9_862=float2(0.0);
float2 l9_863=float2(0.0);
float2 l9_864=float2(0.0);
ssGlobals l9_865=l9_858;
float2 l9_866;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_867=float2(0.0);
l9_867=l9_865.Surface_UVCoord0;
l9_861=l9_867;
l9_866=l9_861;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_868=float2(0.0);
l9_868=l9_865.Surface_UVCoord1;
l9_862=l9_868;
l9_866=l9_862;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_869=float2(0.0);
l9_869=l9_865.gScreenCoord;
l9_863=l9_869;
l9_866=l9_863;
}
else
{
float2 l9_870=float2(0.0);
l9_870=l9_865.Surface_UVCoord0;
l9_864=l9_870;
l9_866=l9_864;
}
}
}
l9_860=l9_866;
float2 l9_871=float2(0.0);
float2 l9_872=(*sc_set0.UserUniforms).uv2Scale;
l9_871=l9_872;
float2 l9_873=float2(0.0);
l9_873=l9_871;
float2 l9_874=float2(0.0);
float2 l9_875=(*sc_set0.UserUniforms).uv2Offset;
l9_874=l9_875;
float2 l9_876=float2(0.0);
l9_876=l9_874;
float2 l9_877=float2(0.0);
l9_877=(l9_860*l9_873)+l9_876;
float2 l9_878=float2(0.0);
l9_878=l9_877+(l9_876*(l9_858.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_856=l9_878;
l9_859=l9_856;
}
else
{
float2 l9_879=float2(0.0);
float2 l9_880=float2(0.0);
float2 l9_881=float2(0.0);
float2 l9_882=float2(0.0);
float2 l9_883=float2(0.0);
ssGlobals l9_884=l9_858;
float2 l9_885;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_886=float2(0.0);
l9_886=l9_884.Surface_UVCoord0;
l9_880=l9_886;
l9_885=l9_880;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_887=float2(0.0);
l9_887=l9_884.Surface_UVCoord1;
l9_881=l9_887;
l9_885=l9_881;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_888=float2(0.0);
l9_888=l9_884.gScreenCoord;
l9_882=l9_888;
l9_885=l9_882;
}
else
{
float2 l9_889=float2(0.0);
l9_889=l9_884.Surface_UVCoord0;
l9_883=l9_889;
l9_885=l9_883;
}
}
}
l9_879=l9_885;
float2 l9_890=float2(0.0);
float2 l9_891=(*sc_set0.UserUniforms).uv2Scale;
l9_890=l9_891;
float2 l9_892=float2(0.0);
l9_892=l9_890;
float2 l9_893=float2(0.0);
float2 l9_894=(*sc_set0.UserUniforms).uv2Offset;
l9_893=l9_894;
float2 l9_895=float2(0.0);
l9_895=l9_893;
float2 l9_896=float2(0.0);
l9_896=(l9_879*l9_892)+l9_895;
l9_857=l9_896;
l9_859=l9_857;
}
l9_855=l9_859;
l9_851=l9_855;
l9_854=l9_851;
}
else
{
float2 l9_897=float2(0.0);
l9_897=l9_853.Surface_UVCoord0;
l9_852=l9_897;
l9_854=l9_852;
}
l9_850=l9_854;
float2 l9_898=float2(0.0);
l9_898=l9_850;
float2 l9_899=float2(0.0);
l9_899=l9_898;
l9_843=l9_899;
l9_846=l9_843;
}
else
{
float2 l9_900=float2(0.0);
l9_900=l9_845.Surface_UVCoord0;
l9_844=l9_900;
l9_846=l9_844;
}
}
}
}
l9_839=l9_846;
float2 l9_901=float2(0.0);
float2 l9_902=(*sc_set0.UserUniforms).uv3Scale;
l9_901=l9_902;
float2 l9_903=float2(0.0);
l9_903=l9_901;
float2 l9_904=float2(0.0);
float2 l9_905=(*sc_set0.UserUniforms).uv3Offset;
l9_904=l9_905;
float2 l9_906=float2(0.0);
l9_906=l9_904;
float2 l9_907=float2(0.0);
l9_907=(l9_839*l9_903)+l9_906;
l9_766=l9_907;
l9_768=l9_766;
}
l9_764=l9_768;
l9_760=l9_764;
l9_763=l9_760;
}
else
{
float2 l9_908=float2(0.0);
l9_908=l9_762.Surface_UVCoord0;
l9_761=l9_908;
l9_763=l9_761;
}
l9_759=l9_763;
float2 l9_909=float2(0.0);
l9_909=l9_759;
float2 l9_910=float2(0.0);
l9_910=l9_909;
l9_703=l9_910;
l9_706=l9_703;
}
else
{
float2 l9_911=float2(0.0);
l9_911=l9_705.Surface_UVCoord0;
l9_704=l9_911;
l9_706=l9_704;
}
}
}
}
l9_699=l9_706;
float4 l9_912=float4(0.0);
int l9_913=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_914=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_914=0;
}
else
{
l9_914=in.varStereoViewID;
}
int l9_915=l9_914;
l9_913=1-l9_915;
}
else
{
int l9_916=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_916=0;
}
else
{
l9_916=in.varStereoViewID;
}
int l9_917=l9_916;
l9_913=l9_917;
}
int l9_918=l9_913;
int l9_919=baseTexLayout_tmp;
int l9_920=l9_918;
float2 l9_921=l9_699;
bool l9_922=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_923=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_924=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_925=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_926=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_927=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_928=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_929=0.0;
bool l9_930=l9_927&&(!l9_925);
float l9_931=1.0;
float l9_932=l9_921.x;
int l9_933=l9_924.x;
if (l9_933==1)
{
l9_932=fract(l9_932);
}
else
{
if (l9_933==2)
{
float l9_934=fract(l9_932);
float l9_935=l9_932-l9_934;
float l9_936=step(0.25,fract(l9_935*0.5));
l9_932=mix(l9_934,1.0-l9_934,fast::clamp(l9_936,0.0,1.0));
}
}
l9_921.x=l9_932;
float l9_937=l9_921.y;
int l9_938=l9_924.y;
if (l9_938==1)
{
l9_937=fract(l9_937);
}
else
{
if (l9_938==2)
{
float l9_939=fract(l9_937);
float l9_940=l9_937-l9_939;
float l9_941=step(0.25,fract(l9_940*0.5));
l9_937=mix(l9_939,1.0-l9_939,fast::clamp(l9_941,0.0,1.0));
}
}
l9_921.y=l9_937;
if (l9_925)
{
bool l9_942=l9_927;
bool l9_943;
if (l9_942)
{
l9_943=l9_924.x==3;
}
else
{
l9_943=l9_942;
}
float l9_944=l9_921.x;
float l9_945=l9_926.x;
float l9_946=l9_926.z;
bool l9_947=l9_943;
float l9_948=l9_931;
float l9_949=fast::clamp(l9_944,l9_945,l9_946);
float l9_950=step(abs(l9_944-l9_949),9.9999997e-06);
l9_948*=(l9_950+((1.0-float(l9_947))*(1.0-l9_950)));
l9_944=l9_949;
l9_921.x=l9_944;
l9_931=l9_948;
bool l9_951=l9_927;
bool l9_952;
if (l9_951)
{
l9_952=l9_924.y==3;
}
else
{
l9_952=l9_951;
}
float l9_953=l9_921.y;
float l9_954=l9_926.y;
float l9_955=l9_926.w;
bool l9_956=l9_952;
float l9_957=l9_931;
float l9_958=fast::clamp(l9_953,l9_954,l9_955);
float l9_959=step(abs(l9_953-l9_958),9.9999997e-06);
l9_957*=(l9_959+((1.0-float(l9_956))*(1.0-l9_959)));
l9_953=l9_958;
l9_921.y=l9_953;
l9_931=l9_957;
}
float2 l9_960=l9_921;
bool l9_961=l9_922;
float3x3 l9_962=l9_923;
if (l9_961)
{
l9_960=float2((l9_962*float3(l9_960,1.0)).xy);
}
float2 l9_963=l9_960;
float2 l9_964=l9_963;
float2 l9_965=l9_964;
l9_921=l9_965;
float l9_966=l9_921.x;
int l9_967=l9_924.x;
bool l9_968=l9_930;
float l9_969=l9_931;
if ((l9_967==0)||(l9_967==3))
{
float l9_970=l9_966;
float l9_971=0.0;
float l9_972=1.0;
bool l9_973=l9_968;
float l9_974=l9_969;
float l9_975=fast::clamp(l9_970,l9_971,l9_972);
float l9_976=step(abs(l9_970-l9_975),9.9999997e-06);
l9_974*=(l9_976+((1.0-float(l9_973))*(1.0-l9_976)));
l9_970=l9_975;
l9_966=l9_970;
l9_969=l9_974;
}
l9_921.x=l9_966;
l9_931=l9_969;
float l9_977=l9_921.y;
int l9_978=l9_924.y;
bool l9_979=l9_930;
float l9_980=l9_931;
if ((l9_978==0)||(l9_978==3))
{
float l9_981=l9_977;
float l9_982=0.0;
float l9_983=1.0;
bool l9_984=l9_979;
float l9_985=l9_980;
float l9_986=fast::clamp(l9_981,l9_982,l9_983);
float l9_987=step(abs(l9_981-l9_986),9.9999997e-06);
l9_985*=(l9_987+((1.0-float(l9_984))*(1.0-l9_987)));
l9_981=l9_986;
l9_977=l9_981;
l9_980=l9_985;
}
l9_921.y=l9_977;
l9_931=l9_980;
float2 l9_988=l9_921;
int l9_989=l9_919;
int l9_990=l9_920;
float l9_991=l9_929;
float2 l9_992=l9_988;
int l9_993=l9_989;
int l9_994=l9_990;
float3 l9_995=float3(0.0);
if (l9_993==0)
{
l9_995=float3(l9_992,0.0);
}
else
{
if (l9_993==1)
{
l9_995=float3(l9_992.x,(l9_992.y*0.5)+(0.5-(float(l9_994)*0.5)),0.0);
}
else
{
l9_995=float3(l9_992,float(l9_994));
}
}
float3 l9_996=l9_995;
float3 l9_997=l9_996;
float2 l9_998=l9_997.xy;
float l9_999=l9_991;
float4 l9_1000=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_998,bias(l9_999));
float4 l9_1001=l9_1000;
float4 l9_1002=l9_1001;
if (l9_927)
{
l9_1002=mix(l9_928,l9_1002,float4(l9_931));
}
float4 l9_1003=l9_1002;
l9_912=l9_1003;
l9_695=l9_912;
l9_698=l9_695;
}
else
{
l9_698=l9_696;
}
l9_694=l9_698;
float4 l9_1004=float4(0.0);
l9_1004=l9_693*l9_694;
float4 l9_1005=float4(0.0);
l9_1005=l9_1004;
float4 l9_1006=float4(0.0);
l9_1006=l9_1005;
float l9_1007=0.0;
float l9_1008=0.0;
float l9_1009=0.0;
float3 l9_1010=l9_1006.xyz;
float l9_1011=l9_1010.x;
float l9_1012=l9_1010.y;
float l9_1013=l9_1010.z;
l9_1007=l9_1011;
l9_1008=l9_1012;
l9_1009=l9_1013;
float3 l9_1014=float3(0.0);
l9_1014=l9_690*float3(l9_1007);
float3 l9_1015=float3(0.0);
float3 l9_1016=(*sc_set0.UserUniforms).recolorGreen;
l9_1015=l9_1016;
float3 l9_1017=float3(0.0);
l9_1017=l9_1015;
float3 l9_1018=float3(0.0);
l9_1018=l9_1017*float3(l9_1008);
float3 l9_1019=float3(0.0);
float3 l9_1020=(*sc_set0.UserUniforms).recolorBlue;
l9_1019=l9_1020;
float3 l9_1021=float3(0.0);
l9_1021=l9_1019;
float3 l9_1022=float3(0.0);
l9_1022=l9_1021*float3(l9_1009);
float3 l9_1023=float3(0.0);
l9_1023=(l9_1014+l9_1018)+l9_1022;
l9_684=l9_1023;
l9_687=l9_684;
}
else
{
float4 l9_1024=float4(0.0);
float4 l9_1025=(*sc_set0.UserUniforms).baseColor;
l9_1024=l9_1025;
float4 l9_1026=float4(0.0);
l9_1026=l9_1024;
float4 l9_1027=float4(0.0);
float4 l9_1028=float4(0.0);
float4 l9_1029=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_1030=l9_686;
float4 l9_1031;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_1032=float2(0.0);
float2 l9_1033=float2(0.0);
float2 l9_1034=float2(0.0);
float2 l9_1035=float2(0.0);
float2 l9_1036=float2(0.0);
float2 l9_1037=float2(0.0);
ssGlobals l9_1038=l9_1030;
float2 l9_1039;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1040=float2(0.0);
l9_1040=l9_1038.Surface_UVCoord0;
l9_1033=l9_1040;
l9_1039=l9_1033;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1041=float2(0.0);
l9_1041=l9_1038.Surface_UVCoord1;
l9_1034=l9_1041;
l9_1039=l9_1034;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1042=float2(0.0);
float2 l9_1043=float2(0.0);
float2 l9_1044=float2(0.0);
ssGlobals l9_1045=l9_1038;
float2 l9_1046;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1047=float2(0.0);
float2 l9_1048=float2(0.0);
float2 l9_1049=float2(0.0);
ssGlobals l9_1050=l9_1045;
float2 l9_1051;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1052=float2(0.0);
float2 l9_1053=float2(0.0);
float2 l9_1054=float2(0.0);
float2 l9_1055=float2(0.0);
float2 l9_1056=float2(0.0);
ssGlobals l9_1057=l9_1050;
float2 l9_1058;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1059=float2(0.0);
l9_1059=l9_1057.Surface_UVCoord0;
l9_1053=l9_1059;
l9_1058=l9_1053;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1060=float2(0.0);
l9_1060=l9_1057.Surface_UVCoord1;
l9_1054=l9_1060;
l9_1058=l9_1054;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1061=float2(0.0);
l9_1061=l9_1057.gScreenCoord;
l9_1055=l9_1061;
l9_1058=l9_1055;
}
else
{
float2 l9_1062=float2(0.0);
l9_1062=l9_1057.Surface_UVCoord0;
l9_1056=l9_1062;
l9_1058=l9_1056;
}
}
}
l9_1052=l9_1058;
float2 l9_1063=float2(0.0);
float2 l9_1064=(*sc_set0.UserUniforms).uv2Scale;
l9_1063=l9_1064;
float2 l9_1065=float2(0.0);
l9_1065=l9_1063;
float2 l9_1066=float2(0.0);
float2 l9_1067=(*sc_set0.UserUniforms).uv2Offset;
l9_1066=l9_1067;
float2 l9_1068=float2(0.0);
l9_1068=l9_1066;
float2 l9_1069=float2(0.0);
l9_1069=(l9_1052*l9_1065)+l9_1068;
float2 l9_1070=float2(0.0);
l9_1070=l9_1069+(l9_1068*(l9_1050.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1048=l9_1070;
l9_1051=l9_1048;
}
else
{
float2 l9_1071=float2(0.0);
float2 l9_1072=float2(0.0);
float2 l9_1073=float2(0.0);
float2 l9_1074=float2(0.0);
float2 l9_1075=float2(0.0);
ssGlobals l9_1076=l9_1050;
float2 l9_1077;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1078=float2(0.0);
l9_1078=l9_1076.Surface_UVCoord0;
l9_1072=l9_1078;
l9_1077=l9_1072;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1079=float2(0.0);
l9_1079=l9_1076.Surface_UVCoord1;
l9_1073=l9_1079;
l9_1077=l9_1073;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1080=float2(0.0);
l9_1080=l9_1076.gScreenCoord;
l9_1074=l9_1080;
l9_1077=l9_1074;
}
else
{
float2 l9_1081=float2(0.0);
l9_1081=l9_1076.Surface_UVCoord0;
l9_1075=l9_1081;
l9_1077=l9_1075;
}
}
}
l9_1071=l9_1077;
float2 l9_1082=float2(0.0);
float2 l9_1083=(*sc_set0.UserUniforms).uv2Scale;
l9_1082=l9_1083;
float2 l9_1084=float2(0.0);
l9_1084=l9_1082;
float2 l9_1085=float2(0.0);
float2 l9_1086=(*sc_set0.UserUniforms).uv2Offset;
l9_1085=l9_1086;
float2 l9_1087=float2(0.0);
l9_1087=l9_1085;
float2 l9_1088=float2(0.0);
l9_1088=(l9_1071*l9_1084)+l9_1087;
l9_1049=l9_1088;
l9_1051=l9_1049;
}
l9_1047=l9_1051;
l9_1043=l9_1047;
l9_1046=l9_1043;
}
else
{
float2 l9_1089=float2(0.0);
l9_1089=l9_1045.Surface_UVCoord0;
l9_1044=l9_1089;
l9_1046=l9_1044;
}
l9_1042=l9_1046;
float2 l9_1090=float2(0.0);
l9_1090=l9_1042;
float2 l9_1091=float2(0.0);
l9_1091=l9_1090;
l9_1035=l9_1091;
l9_1039=l9_1035;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1092=float2(0.0);
float2 l9_1093=float2(0.0);
float2 l9_1094=float2(0.0);
ssGlobals l9_1095=l9_1038;
float2 l9_1096;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_1097=float2(0.0);
float2 l9_1098=float2(0.0);
float2 l9_1099=float2(0.0);
ssGlobals l9_1100=l9_1095;
float2 l9_1101;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1102=float2(0.0);
float2 l9_1103=float2(0.0);
float2 l9_1104=float2(0.0);
float2 l9_1105=float2(0.0);
float2 l9_1106=float2(0.0);
float2 l9_1107=float2(0.0);
ssGlobals l9_1108=l9_1100;
float2 l9_1109;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1110=float2(0.0);
l9_1110=l9_1108.Surface_UVCoord0;
l9_1103=l9_1110;
l9_1109=l9_1103;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1111=float2(0.0);
l9_1111=l9_1108.Surface_UVCoord1;
l9_1104=l9_1111;
l9_1109=l9_1104;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1112=float2(0.0);
l9_1112=l9_1108.gScreenCoord;
l9_1105=l9_1112;
l9_1109=l9_1105;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1113=float2(0.0);
float2 l9_1114=float2(0.0);
float2 l9_1115=float2(0.0);
ssGlobals l9_1116=l9_1108;
float2 l9_1117;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1118=float2(0.0);
float2 l9_1119=float2(0.0);
float2 l9_1120=float2(0.0);
ssGlobals l9_1121=l9_1116;
float2 l9_1122;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1123=float2(0.0);
float2 l9_1124=float2(0.0);
float2 l9_1125=float2(0.0);
float2 l9_1126=float2(0.0);
float2 l9_1127=float2(0.0);
ssGlobals l9_1128=l9_1121;
float2 l9_1129;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1130=float2(0.0);
l9_1130=l9_1128.Surface_UVCoord0;
l9_1124=l9_1130;
l9_1129=l9_1124;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1131=float2(0.0);
l9_1131=l9_1128.Surface_UVCoord1;
l9_1125=l9_1131;
l9_1129=l9_1125;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1132=float2(0.0);
l9_1132=l9_1128.gScreenCoord;
l9_1126=l9_1132;
l9_1129=l9_1126;
}
else
{
float2 l9_1133=float2(0.0);
l9_1133=l9_1128.Surface_UVCoord0;
l9_1127=l9_1133;
l9_1129=l9_1127;
}
}
}
l9_1123=l9_1129;
float2 l9_1134=float2(0.0);
float2 l9_1135=(*sc_set0.UserUniforms).uv2Scale;
l9_1134=l9_1135;
float2 l9_1136=float2(0.0);
l9_1136=l9_1134;
float2 l9_1137=float2(0.0);
float2 l9_1138=(*sc_set0.UserUniforms).uv2Offset;
l9_1137=l9_1138;
float2 l9_1139=float2(0.0);
l9_1139=l9_1137;
float2 l9_1140=float2(0.0);
l9_1140=(l9_1123*l9_1136)+l9_1139;
float2 l9_1141=float2(0.0);
l9_1141=l9_1140+(l9_1139*(l9_1121.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1119=l9_1141;
l9_1122=l9_1119;
}
else
{
float2 l9_1142=float2(0.0);
float2 l9_1143=float2(0.0);
float2 l9_1144=float2(0.0);
float2 l9_1145=float2(0.0);
float2 l9_1146=float2(0.0);
ssGlobals l9_1147=l9_1121;
float2 l9_1148;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1149=float2(0.0);
l9_1149=l9_1147.Surface_UVCoord0;
l9_1143=l9_1149;
l9_1148=l9_1143;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1150=float2(0.0);
l9_1150=l9_1147.Surface_UVCoord1;
l9_1144=l9_1150;
l9_1148=l9_1144;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1151=float2(0.0);
l9_1151=l9_1147.gScreenCoord;
l9_1145=l9_1151;
l9_1148=l9_1145;
}
else
{
float2 l9_1152=float2(0.0);
l9_1152=l9_1147.Surface_UVCoord0;
l9_1146=l9_1152;
l9_1148=l9_1146;
}
}
}
l9_1142=l9_1148;
float2 l9_1153=float2(0.0);
float2 l9_1154=(*sc_set0.UserUniforms).uv2Scale;
l9_1153=l9_1154;
float2 l9_1155=float2(0.0);
l9_1155=l9_1153;
float2 l9_1156=float2(0.0);
float2 l9_1157=(*sc_set0.UserUniforms).uv2Offset;
l9_1156=l9_1157;
float2 l9_1158=float2(0.0);
l9_1158=l9_1156;
float2 l9_1159=float2(0.0);
l9_1159=(l9_1142*l9_1155)+l9_1158;
l9_1120=l9_1159;
l9_1122=l9_1120;
}
l9_1118=l9_1122;
l9_1114=l9_1118;
l9_1117=l9_1114;
}
else
{
float2 l9_1160=float2(0.0);
l9_1160=l9_1116.Surface_UVCoord0;
l9_1115=l9_1160;
l9_1117=l9_1115;
}
l9_1113=l9_1117;
float2 l9_1161=float2(0.0);
l9_1161=l9_1113;
float2 l9_1162=float2(0.0);
l9_1162=l9_1161;
l9_1106=l9_1162;
l9_1109=l9_1106;
}
else
{
float2 l9_1163=float2(0.0);
l9_1163=l9_1108.Surface_UVCoord0;
l9_1107=l9_1163;
l9_1109=l9_1107;
}
}
}
}
l9_1102=l9_1109;
float2 l9_1164=float2(0.0);
float2 l9_1165=(*sc_set0.UserUniforms).uv3Scale;
l9_1164=l9_1165;
float2 l9_1166=float2(0.0);
l9_1166=l9_1164;
float2 l9_1167=float2(0.0);
float2 l9_1168=(*sc_set0.UserUniforms).uv3Offset;
l9_1167=l9_1168;
float2 l9_1169=float2(0.0);
l9_1169=l9_1167;
float2 l9_1170=float2(0.0);
l9_1170=(l9_1102*l9_1166)+l9_1169;
float2 l9_1171=float2(0.0);
l9_1171=l9_1170+(l9_1169*(l9_1100.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1098=l9_1171;
l9_1101=l9_1098;
}
else
{
float2 l9_1172=float2(0.0);
float2 l9_1173=float2(0.0);
float2 l9_1174=float2(0.0);
float2 l9_1175=float2(0.0);
float2 l9_1176=float2(0.0);
float2 l9_1177=float2(0.0);
ssGlobals l9_1178=l9_1100;
float2 l9_1179;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1180=float2(0.0);
l9_1180=l9_1178.Surface_UVCoord0;
l9_1173=l9_1180;
l9_1179=l9_1173;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1181=float2(0.0);
l9_1181=l9_1178.Surface_UVCoord1;
l9_1174=l9_1181;
l9_1179=l9_1174;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1182=float2(0.0);
l9_1182=l9_1178.gScreenCoord;
l9_1175=l9_1182;
l9_1179=l9_1175;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1183=float2(0.0);
float2 l9_1184=float2(0.0);
float2 l9_1185=float2(0.0);
ssGlobals l9_1186=l9_1178;
float2 l9_1187;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1188=float2(0.0);
float2 l9_1189=float2(0.0);
float2 l9_1190=float2(0.0);
ssGlobals l9_1191=l9_1186;
float2 l9_1192;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1193=float2(0.0);
float2 l9_1194=float2(0.0);
float2 l9_1195=float2(0.0);
float2 l9_1196=float2(0.0);
float2 l9_1197=float2(0.0);
ssGlobals l9_1198=l9_1191;
float2 l9_1199;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1200=float2(0.0);
l9_1200=l9_1198.Surface_UVCoord0;
l9_1194=l9_1200;
l9_1199=l9_1194;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1201=float2(0.0);
l9_1201=l9_1198.Surface_UVCoord1;
l9_1195=l9_1201;
l9_1199=l9_1195;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1202=float2(0.0);
l9_1202=l9_1198.gScreenCoord;
l9_1196=l9_1202;
l9_1199=l9_1196;
}
else
{
float2 l9_1203=float2(0.0);
l9_1203=l9_1198.Surface_UVCoord0;
l9_1197=l9_1203;
l9_1199=l9_1197;
}
}
}
l9_1193=l9_1199;
float2 l9_1204=float2(0.0);
float2 l9_1205=(*sc_set0.UserUniforms).uv2Scale;
l9_1204=l9_1205;
float2 l9_1206=float2(0.0);
l9_1206=l9_1204;
float2 l9_1207=float2(0.0);
float2 l9_1208=(*sc_set0.UserUniforms).uv2Offset;
l9_1207=l9_1208;
float2 l9_1209=float2(0.0);
l9_1209=l9_1207;
float2 l9_1210=float2(0.0);
l9_1210=(l9_1193*l9_1206)+l9_1209;
float2 l9_1211=float2(0.0);
l9_1211=l9_1210+(l9_1209*(l9_1191.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1189=l9_1211;
l9_1192=l9_1189;
}
else
{
float2 l9_1212=float2(0.0);
float2 l9_1213=float2(0.0);
float2 l9_1214=float2(0.0);
float2 l9_1215=float2(0.0);
float2 l9_1216=float2(0.0);
ssGlobals l9_1217=l9_1191;
float2 l9_1218;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1219=float2(0.0);
l9_1219=l9_1217.Surface_UVCoord0;
l9_1213=l9_1219;
l9_1218=l9_1213;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1220=float2(0.0);
l9_1220=l9_1217.Surface_UVCoord1;
l9_1214=l9_1220;
l9_1218=l9_1214;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1221=float2(0.0);
l9_1221=l9_1217.gScreenCoord;
l9_1215=l9_1221;
l9_1218=l9_1215;
}
else
{
float2 l9_1222=float2(0.0);
l9_1222=l9_1217.Surface_UVCoord0;
l9_1216=l9_1222;
l9_1218=l9_1216;
}
}
}
l9_1212=l9_1218;
float2 l9_1223=float2(0.0);
float2 l9_1224=(*sc_set0.UserUniforms).uv2Scale;
l9_1223=l9_1224;
float2 l9_1225=float2(0.0);
l9_1225=l9_1223;
float2 l9_1226=float2(0.0);
float2 l9_1227=(*sc_set0.UserUniforms).uv2Offset;
l9_1226=l9_1227;
float2 l9_1228=float2(0.0);
l9_1228=l9_1226;
float2 l9_1229=float2(0.0);
l9_1229=(l9_1212*l9_1225)+l9_1228;
l9_1190=l9_1229;
l9_1192=l9_1190;
}
l9_1188=l9_1192;
l9_1184=l9_1188;
l9_1187=l9_1184;
}
else
{
float2 l9_1230=float2(0.0);
l9_1230=l9_1186.Surface_UVCoord0;
l9_1185=l9_1230;
l9_1187=l9_1185;
}
l9_1183=l9_1187;
float2 l9_1231=float2(0.0);
l9_1231=l9_1183;
float2 l9_1232=float2(0.0);
l9_1232=l9_1231;
l9_1176=l9_1232;
l9_1179=l9_1176;
}
else
{
float2 l9_1233=float2(0.0);
l9_1233=l9_1178.Surface_UVCoord0;
l9_1177=l9_1233;
l9_1179=l9_1177;
}
}
}
}
l9_1172=l9_1179;
float2 l9_1234=float2(0.0);
float2 l9_1235=(*sc_set0.UserUniforms).uv3Scale;
l9_1234=l9_1235;
float2 l9_1236=float2(0.0);
l9_1236=l9_1234;
float2 l9_1237=float2(0.0);
float2 l9_1238=(*sc_set0.UserUniforms).uv3Offset;
l9_1237=l9_1238;
float2 l9_1239=float2(0.0);
l9_1239=l9_1237;
float2 l9_1240=float2(0.0);
l9_1240=(l9_1172*l9_1236)+l9_1239;
l9_1099=l9_1240;
l9_1101=l9_1099;
}
l9_1097=l9_1101;
l9_1093=l9_1097;
l9_1096=l9_1093;
}
else
{
float2 l9_1241=float2(0.0);
l9_1241=l9_1095.Surface_UVCoord0;
l9_1094=l9_1241;
l9_1096=l9_1094;
}
l9_1092=l9_1096;
float2 l9_1242=float2(0.0);
l9_1242=l9_1092;
float2 l9_1243=float2(0.0);
l9_1243=l9_1242;
l9_1036=l9_1243;
l9_1039=l9_1036;
}
else
{
float2 l9_1244=float2(0.0);
l9_1244=l9_1038.Surface_UVCoord0;
l9_1037=l9_1244;
l9_1039=l9_1037;
}
}
}
}
l9_1032=l9_1039;
float4 l9_1245=float4(0.0);
int l9_1246=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1247=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1247=0;
}
else
{
l9_1247=in.varStereoViewID;
}
int l9_1248=l9_1247;
l9_1246=1-l9_1248;
}
else
{
int l9_1249=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1249=0;
}
else
{
l9_1249=in.varStereoViewID;
}
int l9_1250=l9_1249;
l9_1246=l9_1250;
}
int l9_1251=l9_1246;
int l9_1252=baseTexLayout_tmp;
int l9_1253=l9_1251;
float2 l9_1254=l9_1032;
bool l9_1255=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1256=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_1257=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1258=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1259=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_1260=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1261=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_1262=0.0;
bool l9_1263=l9_1260&&(!l9_1258);
float l9_1264=1.0;
float l9_1265=l9_1254.x;
int l9_1266=l9_1257.x;
if (l9_1266==1)
{
l9_1265=fract(l9_1265);
}
else
{
if (l9_1266==2)
{
float l9_1267=fract(l9_1265);
float l9_1268=l9_1265-l9_1267;
float l9_1269=step(0.25,fract(l9_1268*0.5));
l9_1265=mix(l9_1267,1.0-l9_1267,fast::clamp(l9_1269,0.0,1.0));
}
}
l9_1254.x=l9_1265;
float l9_1270=l9_1254.y;
int l9_1271=l9_1257.y;
if (l9_1271==1)
{
l9_1270=fract(l9_1270);
}
else
{
if (l9_1271==2)
{
float l9_1272=fract(l9_1270);
float l9_1273=l9_1270-l9_1272;
float l9_1274=step(0.25,fract(l9_1273*0.5));
l9_1270=mix(l9_1272,1.0-l9_1272,fast::clamp(l9_1274,0.0,1.0));
}
}
l9_1254.y=l9_1270;
if (l9_1258)
{
bool l9_1275=l9_1260;
bool l9_1276;
if (l9_1275)
{
l9_1276=l9_1257.x==3;
}
else
{
l9_1276=l9_1275;
}
float l9_1277=l9_1254.x;
float l9_1278=l9_1259.x;
float l9_1279=l9_1259.z;
bool l9_1280=l9_1276;
float l9_1281=l9_1264;
float l9_1282=fast::clamp(l9_1277,l9_1278,l9_1279);
float l9_1283=step(abs(l9_1277-l9_1282),9.9999997e-06);
l9_1281*=(l9_1283+((1.0-float(l9_1280))*(1.0-l9_1283)));
l9_1277=l9_1282;
l9_1254.x=l9_1277;
l9_1264=l9_1281;
bool l9_1284=l9_1260;
bool l9_1285;
if (l9_1284)
{
l9_1285=l9_1257.y==3;
}
else
{
l9_1285=l9_1284;
}
float l9_1286=l9_1254.y;
float l9_1287=l9_1259.y;
float l9_1288=l9_1259.w;
bool l9_1289=l9_1285;
float l9_1290=l9_1264;
float l9_1291=fast::clamp(l9_1286,l9_1287,l9_1288);
float l9_1292=step(abs(l9_1286-l9_1291),9.9999997e-06);
l9_1290*=(l9_1292+((1.0-float(l9_1289))*(1.0-l9_1292)));
l9_1286=l9_1291;
l9_1254.y=l9_1286;
l9_1264=l9_1290;
}
float2 l9_1293=l9_1254;
bool l9_1294=l9_1255;
float3x3 l9_1295=l9_1256;
if (l9_1294)
{
l9_1293=float2((l9_1295*float3(l9_1293,1.0)).xy);
}
float2 l9_1296=l9_1293;
float2 l9_1297=l9_1296;
float2 l9_1298=l9_1297;
l9_1254=l9_1298;
float l9_1299=l9_1254.x;
int l9_1300=l9_1257.x;
bool l9_1301=l9_1263;
float l9_1302=l9_1264;
if ((l9_1300==0)||(l9_1300==3))
{
float l9_1303=l9_1299;
float l9_1304=0.0;
float l9_1305=1.0;
bool l9_1306=l9_1301;
float l9_1307=l9_1302;
float l9_1308=fast::clamp(l9_1303,l9_1304,l9_1305);
float l9_1309=step(abs(l9_1303-l9_1308),9.9999997e-06);
l9_1307*=(l9_1309+((1.0-float(l9_1306))*(1.0-l9_1309)));
l9_1303=l9_1308;
l9_1299=l9_1303;
l9_1302=l9_1307;
}
l9_1254.x=l9_1299;
l9_1264=l9_1302;
float l9_1310=l9_1254.y;
int l9_1311=l9_1257.y;
bool l9_1312=l9_1263;
float l9_1313=l9_1264;
if ((l9_1311==0)||(l9_1311==3))
{
float l9_1314=l9_1310;
float l9_1315=0.0;
float l9_1316=1.0;
bool l9_1317=l9_1312;
float l9_1318=l9_1313;
float l9_1319=fast::clamp(l9_1314,l9_1315,l9_1316);
float l9_1320=step(abs(l9_1314-l9_1319),9.9999997e-06);
l9_1318*=(l9_1320+((1.0-float(l9_1317))*(1.0-l9_1320)));
l9_1314=l9_1319;
l9_1310=l9_1314;
l9_1313=l9_1318;
}
l9_1254.y=l9_1310;
l9_1264=l9_1313;
float2 l9_1321=l9_1254;
int l9_1322=l9_1252;
int l9_1323=l9_1253;
float l9_1324=l9_1262;
float2 l9_1325=l9_1321;
int l9_1326=l9_1322;
int l9_1327=l9_1323;
float3 l9_1328=float3(0.0);
if (l9_1326==0)
{
l9_1328=float3(l9_1325,0.0);
}
else
{
if (l9_1326==1)
{
l9_1328=float3(l9_1325.x,(l9_1325.y*0.5)+(0.5-(float(l9_1327)*0.5)),0.0);
}
else
{
l9_1328=float3(l9_1325,float(l9_1327));
}
}
float3 l9_1329=l9_1328;
float3 l9_1330=l9_1329;
float2 l9_1331=l9_1330.xy;
float l9_1332=l9_1324;
float4 l9_1333=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1331,bias(l9_1332));
float4 l9_1334=l9_1333;
float4 l9_1335=l9_1334;
if (l9_1260)
{
l9_1335=mix(l9_1261,l9_1335,float4(l9_1264));
}
float4 l9_1336=l9_1335;
l9_1245=l9_1336;
l9_1028=l9_1245;
l9_1031=l9_1028;
}
else
{
l9_1031=l9_1029;
}
l9_1027=l9_1031;
float4 l9_1337=float4(0.0);
l9_1337=l9_1026*l9_1027;
float4 l9_1338=float4(0.0);
l9_1338=l9_1337;
float4 l9_1339=float4(0.0);
l9_1339=l9_1338;
l9_685=l9_1339.xyz;
l9_687=l9_685;
}
l9_683=l9_687;
float3 l9_1340=float3(0.0);
l9_1340=l9_683;
float3 l9_1341=float3(0.0);
l9_1341=l9_1340;
float4 l9_1342=float4(0.0);
l9_1342=float4(l9_1341.x,l9_1341.y,l9_1341.z,l9_1342.w);
l9_1342.w=(*sc_set0.UserUniforms).Port_Value2_N073;
param_1=l9_1342;
param_2=param_1;
}
Result_N363=param_2;
float4 Export_N364=float4(0.0);
Export_N364=Result_N363;
float4 Output_N5=float4(0.0);
float4 param_4=(*sc_set0.UserUniforms).baseColor;
Output_N5=param_4;
float4 Value_N384=float4(0.0);
Value_N384=Output_N5;
float4 Result_N369=float4(0.0);
float4 param_5=float4(0.0);
float4 param_6=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals param_8=Globals;
float4 param_7;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_1343=float2(0.0);
float2 l9_1344=float2(0.0);
float2 l9_1345=float2(0.0);
float2 l9_1346=float2(0.0);
float2 l9_1347=float2(0.0);
float2 l9_1348=float2(0.0);
ssGlobals l9_1349=param_8;
float2 l9_1350;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1351=float2(0.0);
l9_1351=l9_1349.Surface_UVCoord0;
l9_1344=l9_1351;
l9_1350=l9_1344;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1352=float2(0.0);
l9_1352=l9_1349.Surface_UVCoord1;
l9_1345=l9_1352;
l9_1350=l9_1345;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1353=float2(0.0);
float2 l9_1354=float2(0.0);
float2 l9_1355=float2(0.0);
ssGlobals l9_1356=l9_1349;
float2 l9_1357;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1358=float2(0.0);
float2 l9_1359=float2(0.0);
float2 l9_1360=float2(0.0);
ssGlobals l9_1361=l9_1356;
float2 l9_1362;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1363=float2(0.0);
float2 l9_1364=float2(0.0);
float2 l9_1365=float2(0.0);
float2 l9_1366=float2(0.0);
float2 l9_1367=float2(0.0);
ssGlobals l9_1368=l9_1361;
float2 l9_1369;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1370=float2(0.0);
l9_1370=l9_1368.Surface_UVCoord0;
l9_1364=l9_1370;
l9_1369=l9_1364;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1371=float2(0.0);
l9_1371=l9_1368.Surface_UVCoord1;
l9_1365=l9_1371;
l9_1369=l9_1365;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1372=float2(0.0);
l9_1372=l9_1368.gScreenCoord;
l9_1366=l9_1372;
l9_1369=l9_1366;
}
else
{
float2 l9_1373=float2(0.0);
l9_1373=l9_1368.Surface_UVCoord0;
l9_1367=l9_1373;
l9_1369=l9_1367;
}
}
}
l9_1363=l9_1369;
float2 l9_1374=float2(0.0);
float2 l9_1375=(*sc_set0.UserUniforms).uv2Scale;
l9_1374=l9_1375;
float2 l9_1376=float2(0.0);
l9_1376=l9_1374;
float2 l9_1377=float2(0.0);
float2 l9_1378=(*sc_set0.UserUniforms).uv2Offset;
l9_1377=l9_1378;
float2 l9_1379=float2(0.0);
l9_1379=l9_1377;
float2 l9_1380=float2(0.0);
l9_1380=(l9_1363*l9_1376)+l9_1379;
float2 l9_1381=float2(0.0);
l9_1381=l9_1380+(l9_1379*(l9_1361.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1359=l9_1381;
l9_1362=l9_1359;
}
else
{
float2 l9_1382=float2(0.0);
float2 l9_1383=float2(0.0);
float2 l9_1384=float2(0.0);
float2 l9_1385=float2(0.0);
float2 l9_1386=float2(0.0);
ssGlobals l9_1387=l9_1361;
float2 l9_1388;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1389=float2(0.0);
l9_1389=l9_1387.Surface_UVCoord0;
l9_1383=l9_1389;
l9_1388=l9_1383;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1390=float2(0.0);
l9_1390=l9_1387.Surface_UVCoord1;
l9_1384=l9_1390;
l9_1388=l9_1384;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1391=float2(0.0);
l9_1391=l9_1387.gScreenCoord;
l9_1385=l9_1391;
l9_1388=l9_1385;
}
else
{
float2 l9_1392=float2(0.0);
l9_1392=l9_1387.Surface_UVCoord0;
l9_1386=l9_1392;
l9_1388=l9_1386;
}
}
}
l9_1382=l9_1388;
float2 l9_1393=float2(0.0);
float2 l9_1394=(*sc_set0.UserUniforms).uv2Scale;
l9_1393=l9_1394;
float2 l9_1395=float2(0.0);
l9_1395=l9_1393;
float2 l9_1396=float2(0.0);
float2 l9_1397=(*sc_set0.UserUniforms).uv2Offset;
l9_1396=l9_1397;
float2 l9_1398=float2(0.0);
l9_1398=l9_1396;
float2 l9_1399=float2(0.0);
l9_1399=(l9_1382*l9_1395)+l9_1398;
l9_1360=l9_1399;
l9_1362=l9_1360;
}
l9_1358=l9_1362;
l9_1354=l9_1358;
l9_1357=l9_1354;
}
else
{
float2 l9_1400=float2(0.0);
l9_1400=l9_1356.Surface_UVCoord0;
l9_1355=l9_1400;
l9_1357=l9_1355;
}
l9_1353=l9_1357;
float2 l9_1401=float2(0.0);
l9_1401=l9_1353;
float2 l9_1402=float2(0.0);
l9_1402=l9_1401;
l9_1346=l9_1402;
l9_1350=l9_1346;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1403=float2(0.0);
float2 l9_1404=float2(0.0);
float2 l9_1405=float2(0.0);
ssGlobals l9_1406=l9_1349;
float2 l9_1407;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_1408=float2(0.0);
float2 l9_1409=float2(0.0);
float2 l9_1410=float2(0.0);
ssGlobals l9_1411=l9_1406;
float2 l9_1412;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1413=float2(0.0);
float2 l9_1414=float2(0.0);
float2 l9_1415=float2(0.0);
float2 l9_1416=float2(0.0);
float2 l9_1417=float2(0.0);
float2 l9_1418=float2(0.0);
ssGlobals l9_1419=l9_1411;
float2 l9_1420;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1421=float2(0.0);
l9_1421=l9_1419.Surface_UVCoord0;
l9_1414=l9_1421;
l9_1420=l9_1414;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1422=float2(0.0);
l9_1422=l9_1419.Surface_UVCoord1;
l9_1415=l9_1422;
l9_1420=l9_1415;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1423=float2(0.0);
l9_1423=l9_1419.gScreenCoord;
l9_1416=l9_1423;
l9_1420=l9_1416;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1424=float2(0.0);
float2 l9_1425=float2(0.0);
float2 l9_1426=float2(0.0);
ssGlobals l9_1427=l9_1419;
float2 l9_1428;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1429=float2(0.0);
float2 l9_1430=float2(0.0);
float2 l9_1431=float2(0.0);
ssGlobals l9_1432=l9_1427;
float2 l9_1433;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1434=float2(0.0);
float2 l9_1435=float2(0.0);
float2 l9_1436=float2(0.0);
float2 l9_1437=float2(0.0);
float2 l9_1438=float2(0.0);
ssGlobals l9_1439=l9_1432;
float2 l9_1440;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1441=float2(0.0);
l9_1441=l9_1439.Surface_UVCoord0;
l9_1435=l9_1441;
l9_1440=l9_1435;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1442=float2(0.0);
l9_1442=l9_1439.Surface_UVCoord1;
l9_1436=l9_1442;
l9_1440=l9_1436;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1443=float2(0.0);
l9_1443=l9_1439.gScreenCoord;
l9_1437=l9_1443;
l9_1440=l9_1437;
}
else
{
float2 l9_1444=float2(0.0);
l9_1444=l9_1439.Surface_UVCoord0;
l9_1438=l9_1444;
l9_1440=l9_1438;
}
}
}
l9_1434=l9_1440;
float2 l9_1445=float2(0.0);
float2 l9_1446=(*sc_set0.UserUniforms).uv2Scale;
l9_1445=l9_1446;
float2 l9_1447=float2(0.0);
l9_1447=l9_1445;
float2 l9_1448=float2(0.0);
float2 l9_1449=(*sc_set0.UserUniforms).uv2Offset;
l9_1448=l9_1449;
float2 l9_1450=float2(0.0);
l9_1450=l9_1448;
float2 l9_1451=float2(0.0);
l9_1451=(l9_1434*l9_1447)+l9_1450;
float2 l9_1452=float2(0.0);
l9_1452=l9_1451+(l9_1450*(l9_1432.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1430=l9_1452;
l9_1433=l9_1430;
}
else
{
float2 l9_1453=float2(0.0);
float2 l9_1454=float2(0.0);
float2 l9_1455=float2(0.0);
float2 l9_1456=float2(0.0);
float2 l9_1457=float2(0.0);
ssGlobals l9_1458=l9_1432;
float2 l9_1459;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1460=float2(0.0);
l9_1460=l9_1458.Surface_UVCoord0;
l9_1454=l9_1460;
l9_1459=l9_1454;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1461=float2(0.0);
l9_1461=l9_1458.Surface_UVCoord1;
l9_1455=l9_1461;
l9_1459=l9_1455;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1462=float2(0.0);
l9_1462=l9_1458.gScreenCoord;
l9_1456=l9_1462;
l9_1459=l9_1456;
}
else
{
float2 l9_1463=float2(0.0);
l9_1463=l9_1458.Surface_UVCoord0;
l9_1457=l9_1463;
l9_1459=l9_1457;
}
}
}
l9_1453=l9_1459;
float2 l9_1464=float2(0.0);
float2 l9_1465=(*sc_set0.UserUniforms).uv2Scale;
l9_1464=l9_1465;
float2 l9_1466=float2(0.0);
l9_1466=l9_1464;
float2 l9_1467=float2(0.0);
float2 l9_1468=(*sc_set0.UserUniforms).uv2Offset;
l9_1467=l9_1468;
float2 l9_1469=float2(0.0);
l9_1469=l9_1467;
float2 l9_1470=float2(0.0);
l9_1470=(l9_1453*l9_1466)+l9_1469;
l9_1431=l9_1470;
l9_1433=l9_1431;
}
l9_1429=l9_1433;
l9_1425=l9_1429;
l9_1428=l9_1425;
}
else
{
float2 l9_1471=float2(0.0);
l9_1471=l9_1427.Surface_UVCoord0;
l9_1426=l9_1471;
l9_1428=l9_1426;
}
l9_1424=l9_1428;
float2 l9_1472=float2(0.0);
l9_1472=l9_1424;
float2 l9_1473=float2(0.0);
l9_1473=l9_1472;
l9_1417=l9_1473;
l9_1420=l9_1417;
}
else
{
float2 l9_1474=float2(0.0);
l9_1474=l9_1419.Surface_UVCoord0;
l9_1418=l9_1474;
l9_1420=l9_1418;
}
}
}
}
l9_1413=l9_1420;
float2 l9_1475=float2(0.0);
float2 l9_1476=(*sc_set0.UserUniforms).uv3Scale;
l9_1475=l9_1476;
float2 l9_1477=float2(0.0);
l9_1477=l9_1475;
float2 l9_1478=float2(0.0);
float2 l9_1479=(*sc_set0.UserUniforms).uv3Offset;
l9_1478=l9_1479;
float2 l9_1480=float2(0.0);
l9_1480=l9_1478;
float2 l9_1481=float2(0.0);
l9_1481=(l9_1413*l9_1477)+l9_1480;
float2 l9_1482=float2(0.0);
l9_1482=l9_1481+(l9_1480*(l9_1411.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1409=l9_1482;
l9_1412=l9_1409;
}
else
{
float2 l9_1483=float2(0.0);
float2 l9_1484=float2(0.0);
float2 l9_1485=float2(0.0);
float2 l9_1486=float2(0.0);
float2 l9_1487=float2(0.0);
float2 l9_1488=float2(0.0);
ssGlobals l9_1489=l9_1411;
float2 l9_1490;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1491=float2(0.0);
l9_1491=l9_1489.Surface_UVCoord0;
l9_1484=l9_1491;
l9_1490=l9_1484;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1492=float2(0.0);
l9_1492=l9_1489.Surface_UVCoord1;
l9_1485=l9_1492;
l9_1490=l9_1485;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1493=float2(0.0);
l9_1493=l9_1489.gScreenCoord;
l9_1486=l9_1493;
l9_1490=l9_1486;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1494=float2(0.0);
float2 l9_1495=float2(0.0);
float2 l9_1496=float2(0.0);
ssGlobals l9_1497=l9_1489;
float2 l9_1498;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1499=float2(0.0);
float2 l9_1500=float2(0.0);
float2 l9_1501=float2(0.0);
ssGlobals l9_1502=l9_1497;
float2 l9_1503;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1504=float2(0.0);
float2 l9_1505=float2(0.0);
float2 l9_1506=float2(0.0);
float2 l9_1507=float2(0.0);
float2 l9_1508=float2(0.0);
ssGlobals l9_1509=l9_1502;
float2 l9_1510;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1511=float2(0.0);
l9_1511=l9_1509.Surface_UVCoord0;
l9_1505=l9_1511;
l9_1510=l9_1505;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1512=float2(0.0);
l9_1512=l9_1509.Surface_UVCoord1;
l9_1506=l9_1512;
l9_1510=l9_1506;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1513=float2(0.0);
l9_1513=l9_1509.gScreenCoord;
l9_1507=l9_1513;
l9_1510=l9_1507;
}
else
{
float2 l9_1514=float2(0.0);
l9_1514=l9_1509.Surface_UVCoord0;
l9_1508=l9_1514;
l9_1510=l9_1508;
}
}
}
l9_1504=l9_1510;
float2 l9_1515=float2(0.0);
float2 l9_1516=(*sc_set0.UserUniforms).uv2Scale;
l9_1515=l9_1516;
float2 l9_1517=float2(0.0);
l9_1517=l9_1515;
float2 l9_1518=float2(0.0);
float2 l9_1519=(*sc_set0.UserUniforms).uv2Offset;
l9_1518=l9_1519;
float2 l9_1520=float2(0.0);
l9_1520=l9_1518;
float2 l9_1521=float2(0.0);
l9_1521=(l9_1504*l9_1517)+l9_1520;
float2 l9_1522=float2(0.0);
l9_1522=l9_1521+(l9_1520*(l9_1502.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1500=l9_1522;
l9_1503=l9_1500;
}
else
{
float2 l9_1523=float2(0.0);
float2 l9_1524=float2(0.0);
float2 l9_1525=float2(0.0);
float2 l9_1526=float2(0.0);
float2 l9_1527=float2(0.0);
ssGlobals l9_1528=l9_1502;
float2 l9_1529;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1530=float2(0.0);
l9_1530=l9_1528.Surface_UVCoord0;
l9_1524=l9_1530;
l9_1529=l9_1524;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1531=float2(0.0);
l9_1531=l9_1528.Surface_UVCoord1;
l9_1525=l9_1531;
l9_1529=l9_1525;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1532=float2(0.0);
l9_1532=l9_1528.gScreenCoord;
l9_1526=l9_1532;
l9_1529=l9_1526;
}
else
{
float2 l9_1533=float2(0.0);
l9_1533=l9_1528.Surface_UVCoord0;
l9_1527=l9_1533;
l9_1529=l9_1527;
}
}
}
l9_1523=l9_1529;
float2 l9_1534=float2(0.0);
float2 l9_1535=(*sc_set0.UserUniforms).uv2Scale;
l9_1534=l9_1535;
float2 l9_1536=float2(0.0);
l9_1536=l9_1534;
float2 l9_1537=float2(0.0);
float2 l9_1538=(*sc_set0.UserUniforms).uv2Offset;
l9_1537=l9_1538;
float2 l9_1539=float2(0.0);
l9_1539=l9_1537;
float2 l9_1540=float2(0.0);
l9_1540=(l9_1523*l9_1536)+l9_1539;
l9_1501=l9_1540;
l9_1503=l9_1501;
}
l9_1499=l9_1503;
l9_1495=l9_1499;
l9_1498=l9_1495;
}
else
{
float2 l9_1541=float2(0.0);
l9_1541=l9_1497.Surface_UVCoord0;
l9_1496=l9_1541;
l9_1498=l9_1496;
}
l9_1494=l9_1498;
float2 l9_1542=float2(0.0);
l9_1542=l9_1494;
float2 l9_1543=float2(0.0);
l9_1543=l9_1542;
l9_1487=l9_1543;
l9_1490=l9_1487;
}
else
{
float2 l9_1544=float2(0.0);
l9_1544=l9_1489.Surface_UVCoord0;
l9_1488=l9_1544;
l9_1490=l9_1488;
}
}
}
}
l9_1483=l9_1490;
float2 l9_1545=float2(0.0);
float2 l9_1546=(*sc_set0.UserUniforms).uv3Scale;
l9_1545=l9_1546;
float2 l9_1547=float2(0.0);
l9_1547=l9_1545;
float2 l9_1548=float2(0.0);
float2 l9_1549=(*sc_set0.UserUniforms).uv3Offset;
l9_1548=l9_1549;
float2 l9_1550=float2(0.0);
l9_1550=l9_1548;
float2 l9_1551=float2(0.0);
l9_1551=(l9_1483*l9_1547)+l9_1550;
l9_1410=l9_1551;
l9_1412=l9_1410;
}
l9_1408=l9_1412;
l9_1404=l9_1408;
l9_1407=l9_1404;
}
else
{
float2 l9_1552=float2(0.0);
l9_1552=l9_1406.Surface_UVCoord0;
l9_1405=l9_1552;
l9_1407=l9_1405;
}
l9_1403=l9_1407;
float2 l9_1553=float2(0.0);
l9_1553=l9_1403;
float2 l9_1554=float2(0.0);
l9_1554=l9_1553;
l9_1347=l9_1554;
l9_1350=l9_1347;
}
else
{
float2 l9_1555=float2(0.0);
l9_1555=l9_1349.Surface_UVCoord0;
l9_1348=l9_1555;
l9_1350=l9_1348;
}
}
}
}
l9_1343=l9_1350;
float4 l9_1556=float4(0.0);
int l9_1557=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1558=0;
}
else
{
l9_1558=in.varStereoViewID;
}
int l9_1559=l9_1558;
l9_1557=1-l9_1559;
}
else
{
int l9_1560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1560=0;
}
else
{
l9_1560=in.varStereoViewID;
}
int l9_1561=l9_1560;
l9_1557=l9_1561;
}
int l9_1562=l9_1557;
int l9_1563=baseTexLayout_tmp;
int l9_1564=l9_1562;
float2 l9_1565=l9_1343;
bool l9_1566=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1567=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_1568=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1569=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1570=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_1571=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1572=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_1573=0.0;
bool l9_1574=l9_1571&&(!l9_1569);
float l9_1575=1.0;
float l9_1576=l9_1565.x;
int l9_1577=l9_1568.x;
if (l9_1577==1)
{
l9_1576=fract(l9_1576);
}
else
{
if (l9_1577==2)
{
float l9_1578=fract(l9_1576);
float l9_1579=l9_1576-l9_1578;
float l9_1580=step(0.25,fract(l9_1579*0.5));
l9_1576=mix(l9_1578,1.0-l9_1578,fast::clamp(l9_1580,0.0,1.0));
}
}
l9_1565.x=l9_1576;
float l9_1581=l9_1565.y;
int l9_1582=l9_1568.y;
if (l9_1582==1)
{
l9_1581=fract(l9_1581);
}
else
{
if (l9_1582==2)
{
float l9_1583=fract(l9_1581);
float l9_1584=l9_1581-l9_1583;
float l9_1585=step(0.25,fract(l9_1584*0.5));
l9_1581=mix(l9_1583,1.0-l9_1583,fast::clamp(l9_1585,0.0,1.0));
}
}
l9_1565.y=l9_1581;
if (l9_1569)
{
bool l9_1586=l9_1571;
bool l9_1587;
if (l9_1586)
{
l9_1587=l9_1568.x==3;
}
else
{
l9_1587=l9_1586;
}
float l9_1588=l9_1565.x;
float l9_1589=l9_1570.x;
float l9_1590=l9_1570.z;
bool l9_1591=l9_1587;
float l9_1592=l9_1575;
float l9_1593=fast::clamp(l9_1588,l9_1589,l9_1590);
float l9_1594=step(abs(l9_1588-l9_1593),9.9999997e-06);
l9_1592*=(l9_1594+((1.0-float(l9_1591))*(1.0-l9_1594)));
l9_1588=l9_1593;
l9_1565.x=l9_1588;
l9_1575=l9_1592;
bool l9_1595=l9_1571;
bool l9_1596;
if (l9_1595)
{
l9_1596=l9_1568.y==3;
}
else
{
l9_1596=l9_1595;
}
float l9_1597=l9_1565.y;
float l9_1598=l9_1570.y;
float l9_1599=l9_1570.w;
bool l9_1600=l9_1596;
float l9_1601=l9_1575;
float l9_1602=fast::clamp(l9_1597,l9_1598,l9_1599);
float l9_1603=step(abs(l9_1597-l9_1602),9.9999997e-06);
l9_1601*=(l9_1603+((1.0-float(l9_1600))*(1.0-l9_1603)));
l9_1597=l9_1602;
l9_1565.y=l9_1597;
l9_1575=l9_1601;
}
float2 l9_1604=l9_1565;
bool l9_1605=l9_1566;
float3x3 l9_1606=l9_1567;
if (l9_1605)
{
l9_1604=float2((l9_1606*float3(l9_1604,1.0)).xy);
}
float2 l9_1607=l9_1604;
float2 l9_1608=l9_1607;
float2 l9_1609=l9_1608;
l9_1565=l9_1609;
float l9_1610=l9_1565.x;
int l9_1611=l9_1568.x;
bool l9_1612=l9_1574;
float l9_1613=l9_1575;
if ((l9_1611==0)||(l9_1611==3))
{
float l9_1614=l9_1610;
float l9_1615=0.0;
float l9_1616=1.0;
bool l9_1617=l9_1612;
float l9_1618=l9_1613;
float l9_1619=fast::clamp(l9_1614,l9_1615,l9_1616);
float l9_1620=step(abs(l9_1614-l9_1619),9.9999997e-06);
l9_1618*=(l9_1620+((1.0-float(l9_1617))*(1.0-l9_1620)));
l9_1614=l9_1619;
l9_1610=l9_1614;
l9_1613=l9_1618;
}
l9_1565.x=l9_1610;
l9_1575=l9_1613;
float l9_1621=l9_1565.y;
int l9_1622=l9_1568.y;
bool l9_1623=l9_1574;
float l9_1624=l9_1575;
if ((l9_1622==0)||(l9_1622==3))
{
float l9_1625=l9_1621;
float l9_1626=0.0;
float l9_1627=1.0;
bool l9_1628=l9_1623;
float l9_1629=l9_1624;
float l9_1630=fast::clamp(l9_1625,l9_1626,l9_1627);
float l9_1631=step(abs(l9_1625-l9_1630),9.9999997e-06);
l9_1629*=(l9_1631+((1.0-float(l9_1628))*(1.0-l9_1631)));
l9_1625=l9_1630;
l9_1621=l9_1625;
l9_1624=l9_1629;
}
l9_1565.y=l9_1621;
l9_1575=l9_1624;
float2 l9_1632=l9_1565;
int l9_1633=l9_1563;
int l9_1634=l9_1564;
float l9_1635=l9_1573;
float2 l9_1636=l9_1632;
int l9_1637=l9_1633;
int l9_1638=l9_1634;
float3 l9_1639=float3(0.0);
if (l9_1637==0)
{
l9_1639=float3(l9_1636,0.0);
}
else
{
if (l9_1637==1)
{
l9_1639=float3(l9_1636.x,(l9_1636.y*0.5)+(0.5-(float(l9_1638)*0.5)),0.0);
}
else
{
l9_1639=float3(l9_1636,float(l9_1638));
}
}
float3 l9_1640=l9_1639;
float3 l9_1641=l9_1640;
float2 l9_1642=l9_1641.xy;
float l9_1643=l9_1635;
float4 l9_1644=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1642,bias(l9_1643));
float4 l9_1645=l9_1644;
float4 l9_1646=l9_1645;
if (l9_1571)
{
l9_1646=mix(l9_1572,l9_1646,float4(l9_1575));
}
float4 l9_1647=l9_1646;
l9_1556=l9_1647;
param_5=l9_1556;
param_7=param_5;
}
else
{
param_7=param_6;
}
Result_N369=param_7;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_9=0.0;
float param_10=(*sc_set0.UserUniforms).Port_Default_N204;
ssGlobals param_12=Globals;
float param_11;
if ((int(Tweak_N308_tmp)!=0))
{
float2 l9_1648=float2(0.0);
float2 l9_1649=float2(0.0);
float2 l9_1650=float2(0.0);
float2 l9_1651=float2(0.0);
float2 l9_1652=float2(0.0);
float2 l9_1653=float2(0.0);
ssGlobals l9_1654=param_12;
float2 l9_1655;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_1656=float2(0.0);
l9_1656=l9_1654.Surface_UVCoord0;
l9_1649=l9_1656;
l9_1655=l9_1649;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_1657=float2(0.0);
l9_1657=l9_1654.Surface_UVCoord1;
l9_1650=l9_1657;
l9_1655=l9_1650;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_1658=float2(0.0);
float2 l9_1659=float2(0.0);
float2 l9_1660=float2(0.0);
ssGlobals l9_1661=l9_1654;
float2 l9_1662;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1663=float2(0.0);
float2 l9_1664=float2(0.0);
float2 l9_1665=float2(0.0);
ssGlobals l9_1666=l9_1661;
float2 l9_1667;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1668=float2(0.0);
float2 l9_1669=float2(0.0);
float2 l9_1670=float2(0.0);
float2 l9_1671=float2(0.0);
float2 l9_1672=float2(0.0);
ssGlobals l9_1673=l9_1666;
float2 l9_1674;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1675=float2(0.0);
l9_1675=l9_1673.Surface_UVCoord0;
l9_1669=l9_1675;
l9_1674=l9_1669;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1676=float2(0.0);
l9_1676=l9_1673.Surface_UVCoord1;
l9_1670=l9_1676;
l9_1674=l9_1670;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1677=float2(0.0);
l9_1677=l9_1673.gScreenCoord;
l9_1671=l9_1677;
l9_1674=l9_1671;
}
else
{
float2 l9_1678=float2(0.0);
l9_1678=l9_1673.Surface_UVCoord0;
l9_1672=l9_1678;
l9_1674=l9_1672;
}
}
}
l9_1668=l9_1674;
float2 l9_1679=float2(0.0);
float2 l9_1680=(*sc_set0.UserUniforms).uv2Scale;
l9_1679=l9_1680;
float2 l9_1681=float2(0.0);
l9_1681=l9_1679;
float2 l9_1682=float2(0.0);
float2 l9_1683=(*sc_set0.UserUniforms).uv2Offset;
l9_1682=l9_1683;
float2 l9_1684=float2(0.0);
l9_1684=l9_1682;
float2 l9_1685=float2(0.0);
l9_1685=(l9_1668*l9_1681)+l9_1684;
float2 l9_1686=float2(0.0);
l9_1686=l9_1685+(l9_1684*(l9_1666.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1664=l9_1686;
l9_1667=l9_1664;
}
else
{
float2 l9_1687=float2(0.0);
float2 l9_1688=float2(0.0);
float2 l9_1689=float2(0.0);
float2 l9_1690=float2(0.0);
float2 l9_1691=float2(0.0);
ssGlobals l9_1692=l9_1666;
float2 l9_1693;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1694=float2(0.0);
l9_1694=l9_1692.Surface_UVCoord0;
l9_1688=l9_1694;
l9_1693=l9_1688;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1695=float2(0.0);
l9_1695=l9_1692.Surface_UVCoord1;
l9_1689=l9_1695;
l9_1693=l9_1689;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1696=float2(0.0);
l9_1696=l9_1692.gScreenCoord;
l9_1690=l9_1696;
l9_1693=l9_1690;
}
else
{
float2 l9_1697=float2(0.0);
l9_1697=l9_1692.Surface_UVCoord0;
l9_1691=l9_1697;
l9_1693=l9_1691;
}
}
}
l9_1687=l9_1693;
float2 l9_1698=float2(0.0);
float2 l9_1699=(*sc_set0.UserUniforms).uv2Scale;
l9_1698=l9_1699;
float2 l9_1700=float2(0.0);
l9_1700=l9_1698;
float2 l9_1701=float2(0.0);
float2 l9_1702=(*sc_set0.UserUniforms).uv2Offset;
l9_1701=l9_1702;
float2 l9_1703=float2(0.0);
l9_1703=l9_1701;
float2 l9_1704=float2(0.0);
l9_1704=(l9_1687*l9_1700)+l9_1703;
l9_1665=l9_1704;
l9_1667=l9_1665;
}
l9_1663=l9_1667;
l9_1659=l9_1663;
l9_1662=l9_1659;
}
else
{
float2 l9_1705=float2(0.0);
l9_1705=l9_1661.Surface_UVCoord0;
l9_1660=l9_1705;
l9_1662=l9_1660;
}
l9_1658=l9_1662;
float2 l9_1706=float2(0.0);
l9_1706=l9_1658;
float2 l9_1707=float2(0.0);
l9_1707=l9_1706;
l9_1651=l9_1707;
l9_1655=l9_1651;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_1708=float2(0.0);
float2 l9_1709=float2(0.0);
float2 l9_1710=float2(0.0);
ssGlobals l9_1711=l9_1654;
float2 l9_1712;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_1713=float2(0.0);
float2 l9_1714=float2(0.0);
float2 l9_1715=float2(0.0);
ssGlobals l9_1716=l9_1711;
float2 l9_1717;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1718=float2(0.0);
float2 l9_1719=float2(0.0);
float2 l9_1720=float2(0.0);
float2 l9_1721=float2(0.0);
float2 l9_1722=float2(0.0);
float2 l9_1723=float2(0.0);
ssGlobals l9_1724=l9_1716;
float2 l9_1725;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1726=float2(0.0);
l9_1726=l9_1724.Surface_UVCoord0;
l9_1719=l9_1726;
l9_1725=l9_1719;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1727=float2(0.0);
l9_1727=l9_1724.Surface_UVCoord1;
l9_1720=l9_1727;
l9_1725=l9_1720;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1728=float2(0.0);
l9_1728=l9_1724.gScreenCoord;
l9_1721=l9_1728;
l9_1725=l9_1721;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1729=float2(0.0);
float2 l9_1730=float2(0.0);
float2 l9_1731=float2(0.0);
ssGlobals l9_1732=l9_1724;
float2 l9_1733;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1734=float2(0.0);
float2 l9_1735=float2(0.0);
float2 l9_1736=float2(0.0);
ssGlobals l9_1737=l9_1732;
float2 l9_1738;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1739=float2(0.0);
float2 l9_1740=float2(0.0);
float2 l9_1741=float2(0.0);
float2 l9_1742=float2(0.0);
float2 l9_1743=float2(0.0);
ssGlobals l9_1744=l9_1737;
float2 l9_1745;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1746=float2(0.0);
l9_1746=l9_1744.Surface_UVCoord0;
l9_1740=l9_1746;
l9_1745=l9_1740;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1747=float2(0.0);
l9_1747=l9_1744.Surface_UVCoord1;
l9_1741=l9_1747;
l9_1745=l9_1741;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1748=float2(0.0);
l9_1748=l9_1744.gScreenCoord;
l9_1742=l9_1748;
l9_1745=l9_1742;
}
else
{
float2 l9_1749=float2(0.0);
l9_1749=l9_1744.Surface_UVCoord0;
l9_1743=l9_1749;
l9_1745=l9_1743;
}
}
}
l9_1739=l9_1745;
float2 l9_1750=float2(0.0);
float2 l9_1751=(*sc_set0.UserUniforms).uv2Scale;
l9_1750=l9_1751;
float2 l9_1752=float2(0.0);
l9_1752=l9_1750;
float2 l9_1753=float2(0.0);
float2 l9_1754=(*sc_set0.UserUniforms).uv2Offset;
l9_1753=l9_1754;
float2 l9_1755=float2(0.0);
l9_1755=l9_1753;
float2 l9_1756=float2(0.0);
l9_1756=(l9_1739*l9_1752)+l9_1755;
float2 l9_1757=float2(0.0);
l9_1757=l9_1756+(l9_1755*(l9_1737.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1735=l9_1757;
l9_1738=l9_1735;
}
else
{
float2 l9_1758=float2(0.0);
float2 l9_1759=float2(0.0);
float2 l9_1760=float2(0.0);
float2 l9_1761=float2(0.0);
float2 l9_1762=float2(0.0);
ssGlobals l9_1763=l9_1737;
float2 l9_1764;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1765=float2(0.0);
l9_1765=l9_1763.Surface_UVCoord0;
l9_1759=l9_1765;
l9_1764=l9_1759;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1766=float2(0.0);
l9_1766=l9_1763.Surface_UVCoord1;
l9_1760=l9_1766;
l9_1764=l9_1760;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1767=float2(0.0);
l9_1767=l9_1763.gScreenCoord;
l9_1761=l9_1767;
l9_1764=l9_1761;
}
else
{
float2 l9_1768=float2(0.0);
l9_1768=l9_1763.Surface_UVCoord0;
l9_1762=l9_1768;
l9_1764=l9_1762;
}
}
}
l9_1758=l9_1764;
float2 l9_1769=float2(0.0);
float2 l9_1770=(*sc_set0.UserUniforms).uv2Scale;
l9_1769=l9_1770;
float2 l9_1771=float2(0.0);
l9_1771=l9_1769;
float2 l9_1772=float2(0.0);
float2 l9_1773=(*sc_set0.UserUniforms).uv2Offset;
l9_1772=l9_1773;
float2 l9_1774=float2(0.0);
l9_1774=l9_1772;
float2 l9_1775=float2(0.0);
l9_1775=(l9_1758*l9_1771)+l9_1774;
l9_1736=l9_1775;
l9_1738=l9_1736;
}
l9_1734=l9_1738;
l9_1730=l9_1734;
l9_1733=l9_1730;
}
else
{
float2 l9_1776=float2(0.0);
l9_1776=l9_1732.Surface_UVCoord0;
l9_1731=l9_1776;
l9_1733=l9_1731;
}
l9_1729=l9_1733;
float2 l9_1777=float2(0.0);
l9_1777=l9_1729;
float2 l9_1778=float2(0.0);
l9_1778=l9_1777;
l9_1722=l9_1778;
l9_1725=l9_1722;
}
else
{
float2 l9_1779=float2(0.0);
l9_1779=l9_1724.Surface_UVCoord0;
l9_1723=l9_1779;
l9_1725=l9_1723;
}
}
}
}
l9_1718=l9_1725;
float2 l9_1780=float2(0.0);
float2 l9_1781=(*sc_set0.UserUniforms).uv3Scale;
l9_1780=l9_1781;
float2 l9_1782=float2(0.0);
l9_1782=l9_1780;
float2 l9_1783=float2(0.0);
float2 l9_1784=(*sc_set0.UserUniforms).uv3Offset;
l9_1783=l9_1784;
float2 l9_1785=float2(0.0);
l9_1785=l9_1783;
float2 l9_1786=float2(0.0);
l9_1786=(l9_1718*l9_1782)+l9_1785;
float2 l9_1787=float2(0.0);
l9_1787=l9_1786+(l9_1785*(l9_1716.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1714=l9_1787;
l9_1717=l9_1714;
}
else
{
float2 l9_1788=float2(0.0);
float2 l9_1789=float2(0.0);
float2 l9_1790=float2(0.0);
float2 l9_1791=float2(0.0);
float2 l9_1792=float2(0.0);
float2 l9_1793=float2(0.0);
ssGlobals l9_1794=l9_1716;
float2 l9_1795;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1796=float2(0.0);
l9_1796=l9_1794.Surface_UVCoord0;
l9_1789=l9_1796;
l9_1795=l9_1789;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1797=float2(0.0);
l9_1797=l9_1794.Surface_UVCoord1;
l9_1790=l9_1797;
l9_1795=l9_1790;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1798=float2(0.0);
l9_1798=l9_1794.gScreenCoord;
l9_1791=l9_1798;
l9_1795=l9_1791;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1799=float2(0.0);
float2 l9_1800=float2(0.0);
float2 l9_1801=float2(0.0);
ssGlobals l9_1802=l9_1794;
float2 l9_1803;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1804=float2(0.0);
float2 l9_1805=float2(0.0);
float2 l9_1806=float2(0.0);
ssGlobals l9_1807=l9_1802;
float2 l9_1808;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1809=float2(0.0);
float2 l9_1810=float2(0.0);
float2 l9_1811=float2(0.0);
float2 l9_1812=float2(0.0);
float2 l9_1813=float2(0.0);
ssGlobals l9_1814=l9_1807;
float2 l9_1815;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1816=float2(0.0);
l9_1816=l9_1814.Surface_UVCoord0;
l9_1810=l9_1816;
l9_1815=l9_1810;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1817=float2(0.0);
l9_1817=l9_1814.Surface_UVCoord1;
l9_1811=l9_1817;
l9_1815=l9_1811;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1818=float2(0.0);
l9_1818=l9_1814.gScreenCoord;
l9_1812=l9_1818;
l9_1815=l9_1812;
}
else
{
float2 l9_1819=float2(0.0);
l9_1819=l9_1814.Surface_UVCoord0;
l9_1813=l9_1819;
l9_1815=l9_1813;
}
}
}
l9_1809=l9_1815;
float2 l9_1820=float2(0.0);
float2 l9_1821=(*sc_set0.UserUniforms).uv2Scale;
l9_1820=l9_1821;
float2 l9_1822=float2(0.0);
l9_1822=l9_1820;
float2 l9_1823=float2(0.0);
float2 l9_1824=(*sc_set0.UserUniforms).uv2Offset;
l9_1823=l9_1824;
float2 l9_1825=float2(0.0);
l9_1825=l9_1823;
float2 l9_1826=float2(0.0);
l9_1826=(l9_1809*l9_1822)+l9_1825;
float2 l9_1827=float2(0.0);
l9_1827=l9_1826+(l9_1825*(l9_1807.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1805=l9_1827;
l9_1808=l9_1805;
}
else
{
float2 l9_1828=float2(0.0);
float2 l9_1829=float2(0.0);
float2 l9_1830=float2(0.0);
float2 l9_1831=float2(0.0);
float2 l9_1832=float2(0.0);
ssGlobals l9_1833=l9_1807;
float2 l9_1834;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1835=float2(0.0);
l9_1835=l9_1833.Surface_UVCoord0;
l9_1829=l9_1835;
l9_1834=l9_1829;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1836=float2(0.0);
l9_1836=l9_1833.Surface_UVCoord1;
l9_1830=l9_1836;
l9_1834=l9_1830;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1837=float2(0.0);
l9_1837=l9_1833.gScreenCoord;
l9_1831=l9_1837;
l9_1834=l9_1831;
}
else
{
float2 l9_1838=float2(0.0);
l9_1838=l9_1833.Surface_UVCoord0;
l9_1832=l9_1838;
l9_1834=l9_1832;
}
}
}
l9_1828=l9_1834;
float2 l9_1839=float2(0.0);
float2 l9_1840=(*sc_set0.UserUniforms).uv2Scale;
l9_1839=l9_1840;
float2 l9_1841=float2(0.0);
l9_1841=l9_1839;
float2 l9_1842=float2(0.0);
float2 l9_1843=(*sc_set0.UserUniforms).uv2Offset;
l9_1842=l9_1843;
float2 l9_1844=float2(0.0);
l9_1844=l9_1842;
float2 l9_1845=float2(0.0);
l9_1845=(l9_1828*l9_1841)+l9_1844;
l9_1806=l9_1845;
l9_1808=l9_1806;
}
l9_1804=l9_1808;
l9_1800=l9_1804;
l9_1803=l9_1800;
}
else
{
float2 l9_1846=float2(0.0);
l9_1846=l9_1802.Surface_UVCoord0;
l9_1801=l9_1846;
l9_1803=l9_1801;
}
l9_1799=l9_1803;
float2 l9_1847=float2(0.0);
l9_1847=l9_1799;
float2 l9_1848=float2(0.0);
l9_1848=l9_1847;
l9_1792=l9_1848;
l9_1795=l9_1792;
}
else
{
float2 l9_1849=float2(0.0);
l9_1849=l9_1794.Surface_UVCoord0;
l9_1793=l9_1849;
l9_1795=l9_1793;
}
}
}
}
l9_1788=l9_1795;
float2 l9_1850=float2(0.0);
float2 l9_1851=(*sc_set0.UserUniforms).uv3Scale;
l9_1850=l9_1851;
float2 l9_1852=float2(0.0);
l9_1852=l9_1850;
float2 l9_1853=float2(0.0);
float2 l9_1854=(*sc_set0.UserUniforms).uv3Offset;
l9_1853=l9_1854;
float2 l9_1855=float2(0.0);
l9_1855=l9_1853;
float2 l9_1856=float2(0.0);
l9_1856=(l9_1788*l9_1852)+l9_1855;
l9_1715=l9_1856;
l9_1717=l9_1715;
}
l9_1713=l9_1717;
l9_1709=l9_1713;
l9_1712=l9_1709;
}
else
{
float2 l9_1857=float2(0.0);
l9_1857=l9_1711.Surface_UVCoord0;
l9_1710=l9_1857;
l9_1712=l9_1710;
}
l9_1708=l9_1712;
float2 l9_1858=float2(0.0);
l9_1858=l9_1708;
float2 l9_1859=float2(0.0);
l9_1859=l9_1858;
l9_1652=l9_1859;
l9_1655=l9_1652;
}
else
{
float2 l9_1860=float2(0.0);
l9_1860=l9_1654.Surface_UVCoord0;
l9_1653=l9_1860;
l9_1655=l9_1653;
}
}
}
}
l9_1648=l9_1655;
float4 l9_1861=float4(0.0);
int l9_1862=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_1863=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1863=0;
}
else
{
l9_1863=in.varStereoViewID;
}
int l9_1864=l9_1863;
l9_1862=1-l9_1864;
}
else
{
int l9_1865=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1865=0;
}
else
{
l9_1865=in.varStereoViewID;
}
int l9_1866=l9_1865;
l9_1862=l9_1866;
}
int l9_1867=l9_1862;
int l9_1868=opacityTexLayout_tmp;
int l9_1869=l9_1867;
float2 l9_1870=l9_1648;
bool l9_1871=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_1872=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_1873=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_1874=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_1875=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_1876=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_1877=(*sc_set0.UserUniforms).opacityTexBorderColor;
float l9_1878=0.0;
bool l9_1879=l9_1876&&(!l9_1874);
float l9_1880=1.0;
float l9_1881=l9_1870.x;
int l9_1882=l9_1873.x;
if (l9_1882==1)
{
l9_1881=fract(l9_1881);
}
else
{
if (l9_1882==2)
{
float l9_1883=fract(l9_1881);
float l9_1884=l9_1881-l9_1883;
float l9_1885=step(0.25,fract(l9_1884*0.5));
l9_1881=mix(l9_1883,1.0-l9_1883,fast::clamp(l9_1885,0.0,1.0));
}
}
l9_1870.x=l9_1881;
float l9_1886=l9_1870.y;
int l9_1887=l9_1873.y;
if (l9_1887==1)
{
l9_1886=fract(l9_1886);
}
else
{
if (l9_1887==2)
{
float l9_1888=fract(l9_1886);
float l9_1889=l9_1886-l9_1888;
float l9_1890=step(0.25,fract(l9_1889*0.5));
l9_1886=mix(l9_1888,1.0-l9_1888,fast::clamp(l9_1890,0.0,1.0));
}
}
l9_1870.y=l9_1886;
if (l9_1874)
{
bool l9_1891=l9_1876;
bool l9_1892;
if (l9_1891)
{
l9_1892=l9_1873.x==3;
}
else
{
l9_1892=l9_1891;
}
float l9_1893=l9_1870.x;
float l9_1894=l9_1875.x;
float l9_1895=l9_1875.z;
bool l9_1896=l9_1892;
float l9_1897=l9_1880;
float l9_1898=fast::clamp(l9_1893,l9_1894,l9_1895);
float l9_1899=step(abs(l9_1893-l9_1898),9.9999997e-06);
l9_1897*=(l9_1899+((1.0-float(l9_1896))*(1.0-l9_1899)));
l9_1893=l9_1898;
l9_1870.x=l9_1893;
l9_1880=l9_1897;
bool l9_1900=l9_1876;
bool l9_1901;
if (l9_1900)
{
l9_1901=l9_1873.y==3;
}
else
{
l9_1901=l9_1900;
}
float l9_1902=l9_1870.y;
float l9_1903=l9_1875.y;
float l9_1904=l9_1875.w;
bool l9_1905=l9_1901;
float l9_1906=l9_1880;
float l9_1907=fast::clamp(l9_1902,l9_1903,l9_1904);
float l9_1908=step(abs(l9_1902-l9_1907),9.9999997e-06);
l9_1906*=(l9_1908+((1.0-float(l9_1905))*(1.0-l9_1908)));
l9_1902=l9_1907;
l9_1870.y=l9_1902;
l9_1880=l9_1906;
}
float2 l9_1909=l9_1870;
bool l9_1910=l9_1871;
float3x3 l9_1911=l9_1872;
if (l9_1910)
{
l9_1909=float2((l9_1911*float3(l9_1909,1.0)).xy);
}
float2 l9_1912=l9_1909;
float2 l9_1913=l9_1912;
float2 l9_1914=l9_1913;
l9_1870=l9_1914;
float l9_1915=l9_1870.x;
int l9_1916=l9_1873.x;
bool l9_1917=l9_1879;
float l9_1918=l9_1880;
if ((l9_1916==0)||(l9_1916==3))
{
float l9_1919=l9_1915;
float l9_1920=0.0;
float l9_1921=1.0;
bool l9_1922=l9_1917;
float l9_1923=l9_1918;
float l9_1924=fast::clamp(l9_1919,l9_1920,l9_1921);
float l9_1925=step(abs(l9_1919-l9_1924),9.9999997e-06);
l9_1923*=(l9_1925+((1.0-float(l9_1922))*(1.0-l9_1925)));
l9_1919=l9_1924;
l9_1915=l9_1919;
l9_1918=l9_1923;
}
l9_1870.x=l9_1915;
l9_1880=l9_1918;
float l9_1926=l9_1870.y;
int l9_1927=l9_1873.y;
bool l9_1928=l9_1879;
float l9_1929=l9_1880;
if ((l9_1927==0)||(l9_1927==3))
{
float l9_1930=l9_1926;
float l9_1931=0.0;
float l9_1932=1.0;
bool l9_1933=l9_1928;
float l9_1934=l9_1929;
float l9_1935=fast::clamp(l9_1930,l9_1931,l9_1932);
float l9_1936=step(abs(l9_1930-l9_1935),9.9999997e-06);
l9_1934*=(l9_1936+((1.0-float(l9_1933))*(1.0-l9_1936)));
l9_1930=l9_1935;
l9_1926=l9_1930;
l9_1929=l9_1934;
}
l9_1870.y=l9_1926;
l9_1880=l9_1929;
float2 l9_1937=l9_1870;
int l9_1938=l9_1868;
int l9_1939=l9_1869;
float l9_1940=l9_1878;
float2 l9_1941=l9_1937;
int l9_1942=l9_1938;
int l9_1943=l9_1939;
float3 l9_1944=float3(0.0);
if (l9_1942==0)
{
l9_1944=float3(l9_1941,0.0);
}
else
{
if (l9_1942==1)
{
l9_1944=float3(l9_1941.x,(l9_1941.y*0.5)+(0.5-(float(l9_1943)*0.5)),0.0);
}
else
{
l9_1944=float3(l9_1941,float(l9_1943));
}
}
float3 l9_1945=l9_1944;
float3 l9_1946=l9_1945;
float2 l9_1947=l9_1946.xy;
float l9_1948=l9_1940;
float4 l9_1949=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_1947,bias(l9_1948));
float4 l9_1950=l9_1949;
float4 l9_1951=l9_1950;
if (l9_1876)
{
l9_1951=mix(l9_1877,l9_1951,float4(l9_1880));
}
float4 l9_1952=l9_1951;
l9_1861=l9_1952;
float l9_1953=0.0;
l9_1953=l9_1861.x;
param_9=l9_1953;
param_11=param_9;
}
else
{
param_11=param_10;
}
Result_N204=param_11;
float Output_N72=0.0;
float param_13=1.0;
float param_14=(*sc_set0.UserUniforms).Port_Input2_N072;
ssGlobals param_16=Globals;
float param_15;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_1954=float4(0.0);
l9_1954=param_16.VertexColor;
float l9_1955=0.0;
l9_1955=l9_1954.w;
param_13=l9_1955;
param_15=param_13;
}
else
{
param_15=param_14;
}
Output_N72=param_15;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float3 Result_N337=float3(0.0);
float3 param_17=float3(0.0);
float3 param_18=float3(0.0);
ssGlobals param_20=Globals;
float3 param_19;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_1956=float3(0.0);
l9_1956=param_20.VertexTangent_WorldSpace;
float3 l9_1957=float3(0.0);
l9_1957=param_20.VertexBinormal_WorldSpace;
float3 l9_1958=float3(0.0);
l9_1958=param_20.VertexNormal_WorldSpace;
float3x3 l9_1959=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_1959=float3x3(float3(l9_1956),float3(l9_1957),float3(l9_1958));
float2 l9_1960=float2(0.0);
float2 l9_1961=float2(0.0);
float2 l9_1962=float2(0.0);
float2 l9_1963=float2(0.0);
float2 l9_1964=float2(0.0);
float2 l9_1965=float2(0.0);
ssGlobals l9_1966=param_20;
float2 l9_1967;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_1968=float2(0.0);
l9_1968=l9_1966.Surface_UVCoord0;
l9_1961=l9_1968;
l9_1967=l9_1961;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_1969=float2(0.0);
l9_1969=l9_1966.Surface_UVCoord1;
l9_1962=l9_1969;
l9_1967=l9_1962;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_1970=float2(0.0);
float2 l9_1971=float2(0.0);
float2 l9_1972=float2(0.0);
ssGlobals l9_1973=l9_1966;
float2 l9_1974;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1975=float2(0.0);
float2 l9_1976=float2(0.0);
float2 l9_1977=float2(0.0);
ssGlobals l9_1978=l9_1973;
float2 l9_1979;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1980=float2(0.0);
float2 l9_1981=float2(0.0);
float2 l9_1982=float2(0.0);
float2 l9_1983=float2(0.0);
float2 l9_1984=float2(0.0);
ssGlobals l9_1985=l9_1978;
float2 l9_1986;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1987=float2(0.0);
l9_1987=l9_1985.Surface_UVCoord0;
l9_1981=l9_1987;
l9_1986=l9_1981;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1988=float2(0.0);
l9_1988=l9_1985.Surface_UVCoord1;
l9_1982=l9_1988;
l9_1986=l9_1982;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1989=float2(0.0);
l9_1989=l9_1985.gScreenCoord;
l9_1983=l9_1989;
l9_1986=l9_1983;
}
else
{
float2 l9_1990=float2(0.0);
l9_1990=l9_1985.Surface_UVCoord0;
l9_1984=l9_1990;
l9_1986=l9_1984;
}
}
}
l9_1980=l9_1986;
float2 l9_1991=float2(0.0);
float2 l9_1992=(*sc_set0.UserUniforms).uv2Scale;
l9_1991=l9_1992;
float2 l9_1993=float2(0.0);
l9_1993=l9_1991;
float2 l9_1994=float2(0.0);
float2 l9_1995=(*sc_set0.UserUniforms).uv2Offset;
l9_1994=l9_1995;
float2 l9_1996=float2(0.0);
l9_1996=l9_1994;
float2 l9_1997=float2(0.0);
l9_1997=(l9_1980*l9_1993)+l9_1996;
float2 l9_1998=float2(0.0);
l9_1998=l9_1997+(l9_1996*(l9_1978.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1976=l9_1998;
l9_1979=l9_1976;
}
else
{
float2 l9_1999=float2(0.0);
float2 l9_2000=float2(0.0);
float2 l9_2001=float2(0.0);
float2 l9_2002=float2(0.0);
float2 l9_2003=float2(0.0);
ssGlobals l9_2004=l9_1978;
float2 l9_2005;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2006=float2(0.0);
l9_2006=l9_2004.Surface_UVCoord0;
l9_2000=l9_2006;
l9_2005=l9_2000;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2007=float2(0.0);
l9_2007=l9_2004.Surface_UVCoord1;
l9_2001=l9_2007;
l9_2005=l9_2001;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2008=float2(0.0);
l9_2008=l9_2004.gScreenCoord;
l9_2002=l9_2008;
l9_2005=l9_2002;
}
else
{
float2 l9_2009=float2(0.0);
l9_2009=l9_2004.Surface_UVCoord0;
l9_2003=l9_2009;
l9_2005=l9_2003;
}
}
}
l9_1999=l9_2005;
float2 l9_2010=float2(0.0);
float2 l9_2011=(*sc_set0.UserUniforms).uv2Scale;
l9_2010=l9_2011;
float2 l9_2012=float2(0.0);
l9_2012=l9_2010;
float2 l9_2013=float2(0.0);
float2 l9_2014=(*sc_set0.UserUniforms).uv2Offset;
l9_2013=l9_2014;
float2 l9_2015=float2(0.0);
l9_2015=l9_2013;
float2 l9_2016=float2(0.0);
l9_2016=(l9_1999*l9_2012)+l9_2015;
l9_1977=l9_2016;
l9_1979=l9_1977;
}
l9_1975=l9_1979;
l9_1971=l9_1975;
l9_1974=l9_1971;
}
else
{
float2 l9_2017=float2(0.0);
l9_2017=l9_1973.Surface_UVCoord0;
l9_1972=l9_2017;
l9_1974=l9_1972;
}
l9_1970=l9_1974;
float2 l9_2018=float2(0.0);
l9_2018=l9_1970;
float2 l9_2019=float2(0.0);
l9_2019=l9_2018;
l9_1963=l9_2019;
l9_1967=l9_1963;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_2020=float2(0.0);
float2 l9_2021=float2(0.0);
float2 l9_2022=float2(0.0);
ssGlobals l9_2023=l9_1966;
float2 l9_2024;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_2025=float2(0.0);
float2 l9_2026=float2(0.0);
float2 l9_2027=float2(0.0);
ssGlobals l9_2028=l9_2023;
float2 l9_2029;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2030=float2(0.0);
float2 l9_2031=float2(0.0);
float2 l9_2032=float2(0.0);
float2 l9_2033=float2(0.0);
float2 l9_2034=float2(0.0);
float2 l9_2035=float2(0.0);
ssGlobals l9_2036=l9_2028;
float2 l9_2037;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2038=float2(0.0);
l9_2038=l9_2036.Surface_UVCoord0;
l9_2031=l9_2038;
l9_2037=l9_2031;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2039=float2(0.0);
l9_2039=l9_2036.Surface_UVCoord1;
l9_2032=l9_2039;
l9_2037=l9_2032;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2040=float2(0.0);
l9_2040=l9_2036.gScreenCoord;
l9_2033=l9_2040;
l9_2037=l9_2033;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2041=float2(0.0);
float2 l9_2042=float2(0.0);
float2 l9_2043=float2(0.0);
ssGlobals l9_2044=l9_2036;
float2 l9_2045;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2046=float2(0.0);
float2 l9_2047=float2(0.0);
float2 l9_2048=float2(0.0);
ssGlobals l9_2049=l9_2044;
float2 l9_2050;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2051=float2(0.0);
float2 l9_2052=float2(0.0);
float2 l9_2053=float2(0.0);
float2 l9_2054=float2(0.0);
float2 l9_2055=float2(0.0);
ssGlobals l9_2056=l9_2049;
float2 l9_2057;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2058=float2(0.0);
l9_2058=l9_2056.Surface_UVCoord0;
l9_2052=l9_2058;
l9_2057=l9_2052;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2059=float2(0.0);
l9_2059=l9_2056.Surface_UVCoord1;
l9_2053=l9_2059;
l9_2057=l9_2053;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2060=float2(0.0);
l9_2060=l9_2056.gScreenCoord;
l9_2054=l9_2060;
l9_2057=l9_2054;
}
else
{
float2 l9_2061=float2(0.0);
l9_2061=l9_2056.Surface_UVCoord0;
l9_2055=l9_2061;
l9_2057=l9_2055;
}
}
}
l9_2051=l9_2057;
float2 l9_2062=float2(0.0);
float2 l9_2063=(*sc_set0.UserUniforms).uv2Scale;
l9_2062=l9_2063;
float2 l9_2064=float2(0.0);
l9_2064=l9_2062;
float2 l9_2065=float2(0.0);
float2 l9_2066=(*sc_set0.UserUniforms).uv2Offset;
l9_2065=l9_2066;
float2 l9_2067=float2(0.0);
l9_2067=l9_2065;
float2 l9_2068=float2(0.0);
l9_2068=(l9_2051*l9_2064)+l9_2067;
float2 l9_2069=float2(0.0);
l9_2069=l9_2068+(l9_2067*(l9_2049.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2047=l9_2069;
l9_2050=l9_2047;
}
else
{
float2 l9_2070=float2(0.0);
float2 l9_2071=float2(0.0);
float2 l9_2072=float2(0.0);
float2 l9_2073=float2(0.0);
float2 l9_2074=float2(0.0);
ssGlobals l9_2075=l9_2049;
float2 l9_2076;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2077=float2(0.0);
l9_2077=l9_2075.Surface_UVCoord0;
l9_2071=l9_2077;
l9_2076=l9_2071;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2078=float2(0.0);
l9_2078=l9_2075.Surface_UVCoord1;
l9_2072=l9_2078;
l9_2076=l9_2072;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2079=float2(0.0);
l9_2079=l9_2075.gScreenCoord;
l9_2073=l9_2079;
l9_2076=l9_2073;
}
else
{
float2 l9_2080=float2(0.0);
l9_2080=l9_2075.Surface_UVCoord0;
l9_2074=l9_2080;
l9_2076=l9_2074;
}
}
}
l9_2070=l9_2076;
float2 l9_2081=float2(0.0);
float2 l9_2082=(*sc_set0.UserUniforms).uv2Scale;
l9_2081=l9_2082;
float2 l9_2083=float2(0.0);
l9_2083=l9_2081;
float2 l9_2084=float2(0.0);
float2 l9_2085=(*sc_set0.UserUniforms).uv2Offset;
l9_2084=l9_2085;
float2 l9_2086=float2(0.0);
l9_2086=l9_2084;
float2 l9_2087=float2(0.0);
l9_2087=(l9_2070*l9_2083)+l9_2086;
l9_2048=l9_2087;
l9_2050=l9_2048;
}
l9_2046=l9_2050;
l9_2042=l9_2046;
l9_2045=l9_2042;
}
else
{
float2 l9_2088=float2(0.0);
l9_2088=l9_2044.Surface_UVCoord0;
l9_2043=l9_2088;
l9_2045=l9_2043;
}
l9_2041=l9_2045;
float2 l9_2089=float2(0.0);
l9_2089=l9_2041;
float2 l9_2090=float2(0.0);
l9_2090=l9_2089;
l9_2034=l9_2090;
l9_2037=l9_2034;
}
else
{
float2 l9_2091=float2(0.0);
l9_2091=l9_2036.Surface_UVCoord0;
l9_2035=l9_2091;
l9_2037=l9_2035;
}
}
}
}
l9_2030=l9_2037;
float2 l9_2092=float2(0.0);
float2 l9_2093=(*sc_set0.UserUniforms).uv3Scale;
l9_2092=l9_2093;
float2 l9_2094=float2(0.0);
l9_2094=l9_2092;
float2 l9_2095=float2(0.0);
float2 l9_2096=(*sc_set0.UserUniforms).uv3Offset;
l9_2095=l9_2096;
float2 l9_2097=float2(0.0);
l9_2097=l9_2095;
float2 l9_2098=float2(0.0);
l9_2098=(l9_2030*l9_2094)+l9_2097;
float2 l9_2099=float2(0.0);
l9_2099=l9_2098+(l9_2097*(l9_2028.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2026=l9_2099;
l9_2029=l9_2026;
}
else
{
float2 l9_2100=float2(0.0);
float2 l9_2101=float2(0.0);
float2 l9_2102=float2(0.0);
float2 l9_2103=float2(0.0);
float2 l9_2104=float2(0.0);
float2 l9_2105=float2(0.0);
ssGlobals l9_2106=l9_2028;
float2 l9_2107;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2108=float2(0.0);
l9_2108=l9_2106.Surface_UVCoord0;
l9_2101=l9_2108;
l9_2107=l9_2101;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2109=float2(0.0);
l9_2109=l9_2106.Surface_UVCoord1;
l9_2102=l9_2109;
l9_2107=l9_2102;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2110=float2(0.0);
l9_2110=l9_2106.gScreenCoord;
l9_2103=l9_2110;
l9_2107=l9_2103;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2111=float2(0.0);
float2 l9_2112=float2(0.0);
float2 l9_2113=float2(0.0);
ssGlobals l9_2114=l9_2106;
float2 l9_2115;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2116=float2(0.0);
float2 l9_2117=float2(0.0);
float2 l9_2118=float2(0.0);
ssGlobals l9_2119=l9_2114;
float2 l9_2120;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2121=float2(0.0);
float2 l9_2122=float2(0.0);
float2 l9_2123=float2(0.0);
float2 l9_2124=float2(0.0);
float2 l9_2125=float2(0.0);
ssGlobals l9_2126=l9_2119;
float2 l9_2127;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2128=float2(0.0);
l9_2128=l9_2126.Surface_UVCoord0;
l9_2122=l9_2128;
l9_2127=l9_2122;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2129=float2(0.0);
l9_2129=l9_2126.Surface_UVCoord1;
l9_2123=l9_2129;
l9_2127=l9_2123;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2130=float2(0.0);
l9_2130=l9_2126.gScreenCoord;
l9_2124=l9_2130;
l9_2127=l9_2124;
}
else
{
float2 l9_2131=float2(0.0);
l9_2131=l9_2126.Surface_UVCoord0;
l9_2125=l9_2131;
l9_2127=l9_2125;
}
}
}
l9_2121=l9_2127;
float2 l9_2132=float2(0.0);
float2 l9_2133=(*sc_set0.UserUniforms).uv2Scale;
l9_2132=l9_2133;
float2 l9_2134=float2(0.0);
l9_2134=l9_2132;
float2 l9_2135=float2(0.0);
float2 l9_2136=(*sc_set0.UserUniforms).uv2Offset;
l9_2135=l9_2136;
float2 l9_2137=float2(0.0);
l9_2137=l9_2135;
float2 l9_2138=float2(0.0);
l9_2138=(l9_2121*l9_2134)+l9_2137;
float2 l9_2139=float2(0.0);
l9_2139=l9_2138+(l9_2137*(l9_2119.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2117=l9_2139;
l9_2120=l9_2117;
}
else
{
float2 l9_2140=float2(0.0);
float2 l9_2141=float2(0.0);
float2 l9_2142=float2(0.0);
float2 l9_2143=float2(0.0);
float2 l9_2144=float2(0.0);
ssGlobals l9_2145=l9_2119;
float2 l9_2146;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2147=float2(0.0);
l9_2147=l9_2145.Surface_UVCoord0;
l9_2141=l9_2147;
l9_2146=l9_2141;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2148=float2(0.0);
l9_2148=l9_2145.Surface_UVCoord1;
l9_2142=l9_2148;
l9_2146=l9_2142;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2149=float2(0.0);
l9_2149=l9_2145.gScreenCoord;
l9_2143=l9_2149;
l9_2146=l9_2143;
}
else
{
float2 l9_2150=float2(0.0);
l9_2150=l9_2145.Surface_UVCoord0;
l9_2144=l9_2150;
l9_2146=l9_2144;
}
}
}
l9_2140=l9_2146;
float2 l9_2151=float2(0.0);
float2 l9_2152=(*sc_set0.UserUniforms).uv2Scale;
l9_2151=l9_2152;
float2 l9_2153=float2(0.0);
l9_2153=l9_2151;
float2 l9_2154=float2(0.0);
float2 l9_2155=(*sc_set0.UserUniforms).uv2Offset;
l9_2154=l9_2155;
float2 l9_2156=float2(0.0);
l9_2156=l9_2154;
float2 l9_2157=float2(0.0);
l9_2157=(l9_2140*l9_2153)+l9_2156;
l9_2118=l9_2157;
l9_2120=l9_2118;
}
l9_2116=l9_2120;
l9_2112=l9_2116;
l9_2115=l9_2112;
}
else
{
float2 l9_2158=float2(0.0);
l9_2158=l9_2114.Surface_UVCoord0;
l9_2113=l9_2158;
l9_2115=l9_2113;
}
l9_2111=l9_2115;
float2 l9_2159=float2(0.0);
l9_2159=l9_2111;
float2 l9_2160=float2(0.0);
l9_2160=l9_2159;
l9_2104=l9_2160;
l9_2107=l9_2104;
}
else
{
float2 l9_2161=float2(0.0);
l9_2161=l9_2106.Surface_UVCoord0;
l9_2105=l9_2161;
l9_2107=l9_2105;
}
}
}
}
l9_2100=l9_2107;
float2 l9_2162=float2(0.0);
float2 l9_2163=(*sc_set0.UserUniforms).uv3Scale;
l9_2162=l9_2163;
float2 l9_2164=float2(0.0);
l9_2164=l9_2162;
float2 l9_2165=float2(0.0);
float2 l9_2166=(*sc_set0.UserUniforms).uv3Offset;
l9_2165=l9_2166;
float2 l9_2167=float2(0.0);
l9_2167=l9_2165;
float2 l9_2168=float2(0.0);
l9_2168=(l9_2100*l9_2164)+l9_2167;
l9_2027=l9_2168;
l9_2029=l9_2027;
}
l9_2025=l9_2029;
l9_2021=l9_2025;
l9_2024=l9_2021;
}
else
{
float2 l9_2169=float2(0.0);
l9_2169=l9_2023.Surface_UVCoord0;
l9_2022=l9_2169;
l9_2024=l9_2022;
}
l9_2020=l9_2024;
float2 l9_2170=float2(0.0);
l9_2170=l9_2020;
float2 l9_2171=float2(0.0);
l9_2171=l9_2170;
l9_1964=l9_2171;
l9_1967=l9_1964;
}
else
{
float2 l9_2172=float2(0.0);
l9_2172=l9_1966.Surface_UVCoord0;
l9_1965=l9_2172;
l9_1967=l9_1965;
}
}
}
}
l9_1960=l9_1967;
float4 l9_2173=float4(0.0);
float2 l9_2174=l9_1960;
int l9_2175=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_2176=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2176=0;
}
else
{
l9_2176=in.varStereoViewID;
}
int l9_2177=l9_2176;
l9_2175=1-l9_2177;
}
else
{
int l9_2178=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2178=0;
}
else
{
l9_2178=in.varStereoViewID;
}
int l9_2179=l9_2178;
l9_2175=l9_2179;
}
int l9_2180=l9_2175;
int l9_2181=normalTexLayout_tmp;
int l9_2182=l9_2180;
float2 l9_2183=l9_2174;
bool l9_2184=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_2185=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_2186=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_2187=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_2188=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_2189=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_2190=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_2191=0.0;
bool l9_2192=l9_2189&&(!l9_2187);
float l9_2193=1.0;
float l9_2194=l9_2183.x;
int l9_2195=l9_2186.x;
if (l9_2195==1)
{
l9_2194=fract(l9_2194);
}
else
{
if (l9_2195==2)
{
float l9_2196=fract(l9_2194);
float l9_2197=l9_2194-l9_2196;
float l9_2198=step(0.25,fract(l9_2197*0.5));
l9_2194=mix(l9_2196,1.0-l9_2196,fast::clamp(l9_2198,0.0,1.0));
}
}
l9_2183.x=l9_2194;
float l9_2199=l9_2183.y;
int l9_2200=l9_2186.y;
if (l9_2200==1)
{
l9_2199=fract(l9_2199);
}
else
{
if (l9_2200==2)
{
float l9_2201=fract(l9_2199);
float l9_2202=l9_2199-l9_2201;
float l9_2203=step(0.25,fract(l9_2202*0.5));
l9_2199=mix(l9_2201,1.0-l9_2201,fast::clamp(l9_2203,0.0,1.0));
}
}
l9_2183.y=l9_2199;
if (l9_2187)
{
bool l9_2204=l9_2189;
bool l9_2205;
if (l9_2204)
{
l9_2205=l9_2186.x==3;
}
else
{
l9_2205=l9_2204;
}
float l9_2206=l9_2183.x;
float l9_2207=l9_2188.x;
float l9_2208=l9_2188.z;
bool l9_2209=l9_2205;
float l9_2210=l9_2193;
float l9_2211=fast::clamp(l9_2206,l9_2207,l9_2208);
float l9_2212=step(abs(l9_2206-l9_2211),9.9999997e-06);
l9_2210*=(l9_2212+((1.0-float(l9_2209))*(1.0-l9_2212)));
l9_2206=l9_2211;
l9_2183.x=l9_2206;
l9_2193=l9_2210;
bool l9_2213=l9_2189;
bool l9_2214;
if (l9_2213)
{
l9_2214=l9_2186.y==3;
}
else
{
l9_2214=l9_2213;
}
float l9_2215=l9_2183.y;
float l9_2216=l9_2188.y;
float l9_2217=l9_2188.w;
bool l9_2218=l9_2214;
float l9_2219=l9_2193;
float l9_2220=fast::clamp(l9_2215,l9_2216,l9_2217);
float l9_2221=step(abs(l9_2215-l9_2220),9.9999997e-06);
l9_2219*=(l9_2221+((1.0-float(l9_2218))*(1.0-l9_2221)));
l9_2215=l9_2220;
l9_2183.y=l9_2215;
l9_2193=l9_2219;
}
float2 l9_2222=l9_2183;
bool l9_2223=l9_2184;
float3x3 l9_2224=l9_2185;
if (l9_2223)
{
l9_2222=float2((l9_2224*float3(l9_2222,1.0)).xy);
}
float2 l9_2225=l9_2222;
float2 l9_2226=l9_2225;
float2 l9_2227=l9_2226;
l9_2183=l9_2227;
float l9_2228=l9_2183.x;
int l9_2229=l9_2186.x;
bool l9_2230=l9_2192;
float l9_2231=l9_2193;
if ((l9_2229==0)||(l9_2229==3))
{
float l9_2232=l9_2228;
float l9_2233=0.0;
float l9_2234=1.0;
bool l9_2235=l9_2230;
float l9_2236=l9_2231;
float l9_2237=fast::clamp(l9_2232,l9_2233,l9_2234);
float l9_2238=step(abs(l9_2232-l9_2237),9.9999997e-06);
l9_2236*=(l9_2238+((1.0-float(l9_2235))*(1.0-l9_2238)));
l9_2232=l9_2237;
l9_2228=l9_2232;
l9_2231=l9_2236;
}
l9_2183.x=l9_2228;
l9_2193=l9_2231;
float l9_2239=l9_2183.y;
int l9_2240=l9_2186.y;
bool l9_2241=l9_2192;
float l9_2242=l9_2193;
if ((l9_2240==0)||(l9_2240==3))
{
float l9_2243=l9_2239;
float l9_2244=0.0;
float l9_2245=1.0;
bool l9_2246=l9_2241;
float l9_2247=l9_2242;
float l9_2248=fast::clamp(l9_2243,l9_2244,l9_2245);
float l9_2249=step(abs(l9_2243-l9_2248),9.9999997e-06);
l9_2247*=(l9_2249+((1.0-float(l9_2246))*(1.0-l9_2249)));
l9_2243=l9_2248;
l9_2239=l9_2243;
l9_2242=l9_2247;
}
l9_2183.y=l9_2239;
l9_2193=l9_2242;
float2 l9_2250=l9_2183;
int l9_2251=l9_2181;
int l9_2252=l9_2182;
float l9_2253=l9_2191;
float2 l9_2254=l9_2250;
int l9_2255=l9_2251;
int l9_2256=l9_2252;
float3 l9_2257=float3(0.0);
if (l9_2255==0)
{
l9_2257=float3(l9_2254,0.0);
}
else
{
if (l9_2255==1)
{
l9_2257=float3(l9_2254.x,(l9_2254.y*0.5)+(0.5-(float(l9_2256)*0.5)),0.0);
}
else
{
l9_2257=float3(l9_2254,float(l9_2256));
}
}
float3 l9_2258=l9_2257;
float3 l9_2259=l9_2258;
float2 l9_2260=l9_2259.xy;
float l9_2261=l9_2253;
float4 l9_2262=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_2260,bias(l9_2261));
float4 l9_2263=l9_2262;
float4 l9_2264=l9_2263;
if (l9_2189)
{
l9_2264=mix(l9_2190,l9_2264,float4(l9_2193));
}
float4 l9_2265=l9_2264;
float4 l9_2266=l9_2265;
float3 l9_2267=(l9_2266.xyz*1.9921875)-float3(1.0);
l9_2266=float4(l9_2267.x,l9_2267.y,l9_2267.z,l9_2266.w);
l9_2173=l9_2266;
float3 l9_2268=float3(0.0);
float3 l9_2269=float3(0.0);
float3 l9_2270=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_2271=param_20;
float3 l9_2272;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_2273=float2(0.0);
float2 l9_2274=float2(0.0);
float2 l9_2275=float2(0.0);
float2 l9_2276=float2(0.0);
float2 l9_2277=float2(0.0);
float2 l9_2278=float2(0.0);
ssGlobals l9_2279=l9_2271;
float2 l9_2280;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_2281=float2(0.0);
l9_2281=l9_2279.Surface_UVCoord0;
l9_2274=l9_2281;
l9_2280=l9_2274;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_2282=float2(0.0);
l9_2282=l9_2279.Surface_UVCoord1;
l9_2275=l9_2282;
l9_2280=l9_2275;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_2283=float2(0.0);
float2 l9_2284=float2(0.0);
float2 l9_2285=float2(0.0);
ssGlobals l9_2286=l9_2279;
float2 l9_2287;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2288=float2(0.0);
float2 l9_2289=float2(0.0);
float2 l9_2290=float2(0.0);
ssGlobals l9_2291=l9_2286;
float2 l9_2292;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2293=float2(0.0);
float2 l9_2294=float2(0.0);
float2 l9_2295=float2(0.0);
float2 l9_2296=float2(0.0);
float2 l9_2297=float2(0.0);
ssGlobals l9_2298=l9_2291;
float2 l9_2299;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2300=float2(0.0);
l9_2300=l9_2298.Surface_UVCoord0;
l9_2294=l9_2300;
l9_2299=l9_2294;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2301=float2(0.0);
l9_2301=l9_2298.Surface_UVCoord1;
l9_2295=l9_2301;
l9_2299=l9_2295;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2302=float2(0.0);
l9_2302=l9_2298.gScreenCoord;
l9_2296=l9_2302;
l9_2299=l9_2296;
}
else
{
float2 l9_2303=float2(0.0);
l9_2303=l9_2298.Surface_UVCoord0;
l9_2297=l9_2303;
l9_2299=l9_2297;
}
}
}
l9_2293=l9_2299;
float2 l9_2304=float2(0.0);
float2 l9_2305=(*sc_set0.UserUniforms).uv2Scale;
l9_2304=l9_2305;
float2 l9_2306=float2(0.0);
l9_2306=l9_2304;
float2 l9_2307=float2(0.0);
float2 l9_2308=(*sc_set0.UserUniforms).uv2Offset;
l9_2307=l9_2308;
float2 l9_2309=float2(0.0);
l9_2309=l9_2307;
float2 l9_2310=float2(0.0);
l9_2310=(l9_2293*l9_2306)+l9_2309;
float2 l9_2311=float2(0.0);
l9_2311=l9_2310+(l9_2309*(l9_2291.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2289=l9_2311;
l9_2292=l9_2289;
}
else
{
float2 l9_2312=float2(0.0);
float2 l9_2313=float2(0.0);
float2 l9_2314=float2(0.0);
float2 l9_2315=float2(0.0);
float2 l9_2316=float2(0.0);
ssGlobals l9_2317=l9_2291;
float2 l9_2318;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2319=float2(0.0);
l9_2319=l9_2317.Surface_UVCoord0;
l9_2313=l9_2319;
l9_2318=l9_2313;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2320=float2(0.0);
l9_2320=l9_2317.Surface_UVCoord1;
l9_2314=l9_2320;
l9_2318=l9_2314;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2321=float2(0.0);
l9_2321=l9_2317.gScreenCoord;
l9_2315=l9_2321;
l9_2318=l9_2315;
}
else
{
float2 l9_2322=float2(0.0);
l9_2322=l9_2317.Surface_UVCoord0;
l9_2316=l9_2322;
l9_2318=l9_2316;
}
}
}
l9_2312=l9_2318;
float2 l9_2323=float2(0.0);
float2 l9_2324=(*sc_set0.UserUniforms).uv2Scale;
l9_2323=l9_2324;
float2 l9_2325=float2(0.0);
l9_2325=l9_2323;
float2 l9_2326=float2(0.0);
float2 l9_2327=(*sc_set0.UserUniforms).uv2Offset;
l9_2326=l9_2327;
float2 l9_2328=float2(0.0);
l9_2328=l9_2326;
float2 l9_2329=float2(0.0);
l9_2329=(l9_2312*l9_2325)+l9_2328;
l9_2290=l9_2329;
l9_2292=l9_2290;
}
l9_2288=l9_2292;
l9_2284=l9_2288;
l9_2287=l9_2284;
}
else
{
float2 l9_2330=float2(0.0);
l9_2330=l9_2286.Surface_UVCoord0;
l9_2285=l9_2330;
l9_2287=l9_2285;
}
l9_2283=l9_2287;
float2 l9_2331=float2(0.0);
l9_2331=l9_2283;
float2 l9_2332=float2(0.0);
l9_2332=l9_2331;
l9_2276=l9_2332;
l9_2280=l9_2276;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_2333=float2(0.0);
float2 l9_2334=float2(0.0);
float2 l9_2335=float2(0.0);
ssGlobals l9_2336=l9_2279;
float2 l9_2337;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_2338=float2(0.0);
float2 l9_2339=float2(0.0);
float2 l9_2340=float2(0.0);
ssGlobals l9_2341=l9_2336;
float2 l9_2342;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2343=float2(0.0);
float2 l9_2344=float2(0.0);
float2 l9_2345=float2(0.0);
float2 l9_2346=float2(0.0);
float2 l9_2347=float2(0.0);
float2 l9_2348=float2(0.0);
ssGlobals l9_2349=l9_2341;
float2 l9_2350;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2351=float2(0.0);
l9_2351=l9_2349.Surface_UVCoord0;
l9_2344=l9_2351;
l9_2350=l9_2344;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2352=float2(0.0);
l9_2352=l9_2349.Surface_UVCoord1;
l9_2345=l9_2352;
l9_2350=l9_2345;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2353=float2(0.0);
l9_2353=l9_2349.gScreenCoord;
l9_2346=l9_2353;
l9_2350=l9_2346;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2354=float2(0.0);
float2 l9_2355=float2(0.0);
float2 l9_2356=float2(0.0);
ssGlobals l9_2357=l9_2349;
float2 l9_2358;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2359=float2(0.0);
float2 l9_2360=float2(0.0);
float2 l9_2361=float2(0.0);
ssGlobals l9_2362=l9_2357;
float2 l9_2363;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2364=float2(0.0);
float2 l9_2365=float2(0.0);
float2 l9_2366=float2(0.0);
float2 l9_2367=float2(0.0);
float2 l9_2368=float2(0.0);
ssGlobals l9_2369=l9_2362;
float2 l9_2370;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2371=float2(0.0);
l9_2371=l9_2369.Surface_UVCoord0;
l9_2365=l9_2371;
l9_2370=l9_2365;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2372=float2(0.0);
l9_2372=l9_2369.Surface_UVCoord1;
l9_2366=l9_2372;
l9_2370=l9_2366;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2373=float2(0.0);
l9_2373=l9_2369.gScreenCoord;
l9_2367=l9_2373;
l9_2370=l9_2367;
}
else
{
float2 l9_2374=float2(0.0);
l9_2374=l9_2369.Surface_UVCoord0;
l9_2368=l9_2374;
l9_2370=l9_2368;
}
}
}
l9_2364=l9_2370;
float2 l9_2375=float2(0.0);
float2 l9_2376=(*sc_set0.UserUniforms).uv2Scale;
l9_2375=l9_2376;
float2 l9_2377=float2(0.0);
l9_2377=l9_2375;
float2 l9_2378=float2(0.0);
float2 l9_2379=(*sc_set0.UserUniforms).uv2Offset;
l9_2378=l9_2379;
float2 l9_2380=float2(0.0);
l9_2380=l9_2378;
float2 l9_2381=float2(0.0);
l9_2381=(l9_2364*l9_2377)+l9_2380;
float2 l9_2382=float2(0.0);
l9_2382=l9_2381+(l9_2380*(l9_2362.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2360=l9_2382;
l9_2363=l9_2360;
}
else
{
float2 l9_2383=float2(0.0);
float2 l9_2384=float2(0.0);
float2 l9_2385=float2(0.0);
float2 l9_2386=float2(0.0);
float2 l9_2387=float2(0.0);
ssGlobals l9_2388=l9_2362;
float2 l9_2389;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2390=float2(0.0);
l9_2390=l9_2388.Surface_UVCoord0;
l9_2384=l9_2390;
l9_2389=l9_2384;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2391=float2(0.0);
l9_2391=l9_2388.Surface_UVCoord1;
l9_2385=l9_2391;
l9_2389=l9_2385;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2392=float2(0.0);
l9_2392=l9_2388.gScreenCoord;
l9_2386=l9_2392;
l9_2389=l9_2386;
}
else
{
float2 l9_2393=float2(0.0);
l9_2393=l9_2388.Surface_UVCoord0;
l9_2387=l9_2393;
l9_2389=l9_2387;
}
}
}
l9_2383=l9_2389;
float2 l9_2394=float2(0.0);
float2 l9_2395=(*sc_set0.UserUniforms).uv2Scale;
l9_2394=l9_2395;
float2 l9_2396=float2(0.0);
l9_2396=l9_2394;
float2 l9_2397=float2(0.0);
float2 l9_2398=(*sc_set0.UserUniforms).uv2Offset;
l9_2397=l9_2398;
float2 l9_2399=float2(0.0);
l9_2399=l9_2397;
float2 l9_2400=float2(0.0);
l9_2400=(l9_2383*l9_2396)+l9_2399;
l9_2361=l9_2400;
l9_2363=l9_2361;
}
l9_2359=l9_2363;
l9_2355=l9_2359;
l9_2358=l9_2355;
}
else
{
float2 l9_2401=float2(0.0);
l9_2401=l9_2357.Surface_UVCoord0;
l9_2356=l9_2401;
l9_2358=l9_2356;
}
l9_2354=l9_2358;
float2 l9_2402=float2(0.0);
l9_2402=l9_2354;
float2 l9_2403=float2(0.0);
l9_2403=l9_2402;
l9_2347=l9_2403;
l9_2350=l9_2347;
}
else
{
float2 l9_2404=float2(0.0);
l9_2404=l9_2349.Surface_UVCoord0;
l9_2348=l9_2404;
l9_2350=l9_2348;
}
}
}
}
l9_2343=l9_2350;
float2 l9_2405=float2(0.0);
float2 l9_2406=(*sc_set0.UserUniforms).uv3Scale;
l9_2405=l9_2406;
float2 l9_2407=float2(0.0);
l9_2407=l9_2405;
float2 l9_2408=float2(0.0);
float2 l9_2409=(*sc_set0.UserUniforms).uv3Offset;
l9_2408=l9_2409;
float2 l9_2410=float2(0.0);
l9_2410=l9_2408;
float2 l9_2411=float2(0.0);
l9_2411=(l9_2343*l9_2407)+l9_2410;
float2 l9_2412=float2(0.0);
l9_2412=l9_2411+(l9_2410*(l9_2341.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2339=l9_2412;
l9_2342=l9_2339;
}
else
{
float2 l9_2413=float2(0.0);
float2 l9_2414=float2(0.0);
float2 l9_2415=float2(0.0);
float2 l9_2416=float2(0.0);
float2 l9_2417=float2(0.0);
float2 l9_2418=float2(0.0);
ssGlobals l9_2419=l9_2341;
float2 l9_2420;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2421=float2(0.0);
l9_2421=l9_2419.Surface_UVCoord0;
l9_2414=l9_2421;
l9_2420=l9_2414;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2422=float2(0.0);
l9_2422=l9_2419.Surface_UVCoord1;
l9_2415=l9_2422;
l9_2420=l9_2415;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2423=float2(0.0);
l9_2423=l9_2419.gScreenCoord;
l9_2416=l9_2423;
l9_2420=l9_2416;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2424=float2(0.0);
float2 l9_2425=float2(0.0);
float2 l9_2426=float2(0.0);
ssGlobals l9_2427=l9_2419;
float2 l9_2428;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2429=float2(0.0);
float2 l9_2430=float2(0.0);
float2 l9_2431=float2(0.0);
ssGlobals l9_2432=l9_2427;
float2 l9_2433;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2434=float2(0.0);
float2 l9_2435=float2(0.0);
float2 l9_2436=float2(0.0);
float2 l9_2437=float2(0.0);
float2 l9_2438=float2(0.0);
ssGlobals l9_2439=l9_2432;
float2 l9_2440;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2441=float2(0.0);
l9_2441=l9_2439.Surface_UVCoord0;
l9_2435=l9_2441;
l9_2440=l9_2435;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2442=float2(0.0);
l9_2442=l9_2439.Surface_UVCoord1;
l9_2436=l9_2442;
l9_2440=l9_2436;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2443=float2(0.0);
l9_2443=l9_2439.gScreenCoord;
l9_2437=l9_2443;
l9_2440=l9_2437;
}
else
{
float2 l9_2444=float2(0.0);
l9_2444=l9_2439.Surface_UVCoord0;
l9_2438=l9_2444;
l9_2440=l9_2438;
}
}
}
l9_2434=l9_2440;
float2 l9_2445=float2(0.0);
float2 l9_2446=(*sc_set0.UserUniforms).uv2Scale;
l9_2445=l9_2446;
float2 l9_2447=float2(0.0);
l9_2447=l9_2445;
float2 l9_2448=float2(0.0);
float2 l9_2449=(*sc_set0.UserUniforms).uv2Offset;
l9_2448=l9_2449;
float2 l9_2450=float2(0.0);
l9_2450=l9_2448;
float2 l9_2451=float2(0.0);
l9_2451=(l9_2434*l9_2447)+l9_2450;
float2 l9_2452=float2(0.0);
l9_2452=l9_2451+(l9_2450*(l9_2432.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2430=l9_2452;
l9_2433=l9_2430;
}
else
{
float2 l9_2453=float2(0.0);
float2 l9_2454=float2(0.0);
float2 l9_2455=float2(0.0);
float2 l9_2456=float2(0.0);
float2 l9_2457=float2(0.0);
ssGlobals l9_2458=l9_2432;
float2 l9_2459;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2460=float2(0.0);
l9_2460=l9_2458.Surface_UVCoord0;
l9_2454=l9_2460;
l9_2459=l9_2454;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2461=float2(0.0);
l9_2461=l9_2458.Surface_UVCoord1;
l9_2455=l9_2461;
l9_2459=l9_2455;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2462=float2(0.0);
l9_2462=l9_2458.gScreenCoord;
l9_2456=l9_2462;
l9_2459=l9_2456;
}
else
{
float2 l9_2463=float2(0.0);
l9_2463=l9_2458.Surface_UVCoord0;
l9_2457=l9_2463;
l9_2459=l9_2457;
}
}
}
l9_2453=l9_2459;
float2 l9_2464=float2(0.0);
float2 l9_2465=(*sc_set0.UserUniforms).uv2Scale;
l9_2464=l9_2465;
float2 l9_2466=float2(0.0);
l9_2466=l9_2464;
float2 l9_2467=float2(0.0);
float2 l9_2468=(*sc_set0.UserUniforms).uv2Offset;
l9_2467=l9_2468;
float2 l9_2469=float2(0.0);
l9_2469=l9_2467;
float2 l9_2470=float2(0.0);
l9_2470=(l9_2453*l9_2466)+l9_2469;
l9_2431=l9_2470;
l9_2433=l9_2431;
}
l9_2429=l9_2433;
l9_2425=l9_2429;
l9_2428=l9_2425;
}
else
{
float2 l9_2471=float2(0.0);
l9_2471=l9_2427.Surface_UVCoord0;
l9_2426=l9_2471;
l9_2428=l9_2426;
}
l9_2424=l9_2428;
float2 l9_2472=float2(0.0);
l9_2472=l9_2424;
float2 l9_2473=float2(0.0);
l9_2473=l9_2472;
l9_2417=l9_2473;
l9_2420=l9_2417;
}
else
{
float2 l9_2474=float2(0.0);
l9_2474=l9_2419.Surface_UVCoord0;
l9_2418=l9_2474;
l9_2420=l9_2418;
}
}
}
}
l9_2413=l9_2420;
float2 l9_2475=float2(0.0);
float2 l9_2476=(*sc_set0.UserUniforms).uv3Scale;
l9_2475=l9_2476;
float2 l9_2477=float2(0.0);
l9_2477=l9_2475;
float2 l9_2478=float2(0.0);
float2 l9_2479=(*sc_set0.UserUniforms).uv3Offset;
l9_2478=l9_2479;
float2 l9_2480=float2(0.0);
l9_2480=l9_2478;
float2 l9_2481=float2(0.0);
l9_2481=(l9_2413*l9_2477)+l9_2480;
l9_2340=l9_2481;
l9_2342=l9_2340;
}
l9_2338=l9_2342;
l9_2334=l9_2338;
l9_2337=l9_2334;
}
else
{
float2 l9_2482=float2(0.0);
l9_2482=l9_2336.Surface_UVCoord0;
l9_2335=l9_2482;
l9_2337=l9_2335;
}
l9_2333=l9_2337;
float2 l9_2483=float2(0.0);
l9_2483=l9_2333;
float2 l9_2484=float2(0.0);
l9_2484=l9_2483;
l9_2277=l9_2484;
l9_2280=l9_2277;
}
else
{
float2 l9_2485=float2(0.0);
l9_2485=l9_2279.Surface_UVCoord0;
l9_2278=l9_2485;
l9_2280=l9_2278;
}
}
}
}
l9_2273=l9_2280;
float4 l9_2486=float4(0.0);
float2 l9_2487=l9_2273;
int l9_2488=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_2489=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2489=0;
}
else
{
l9_2489=in.varStereoViewID;
}
int l9_2490=l9_2489;
l9_2488=1-l9_2490;
}
else
{
int l9_2491=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2491=0;
}
else
{
l9_2491=in.varStereoViewID;
}
int l9_2492=l9_2491;
l9_2488=l9_2492;
}
int l9_2493=l9_2488;
int l9_2494=detailNormalTexLayout_tmp;
int l9_2495=l9_2493;
float2 l9_2496=l9_2487;
bool l9_2497=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_2498=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_2499=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_2500=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_2501=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_2502=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_2503=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_2504=0.0;
bool l9_2505=l9_2502&&(!l9_2500);
float l9_2506=1.0;
float l9_2507=l9_2496.x;
int l9_2508=l9_2499.x;
if (l9_2508==1)
{
l9_2507=fract(l9_2507);
}
else
{
if (l9_2508==2)
{
float l9_2509=fract(l9_2507);
float l9_2510=l9_2507-l9_2509;
float l9_2511=step(0.25,fract(l9_2510*0.5));
l9_2507=mix(l9_2509,1.0-l9_2509,fast::clamp(l9_2511,0.0,1.0));
}
}
l9_2496.x=l9_2507;
float l9_2512=l9_2496.y;
int l9_2513=l9_2499.y;
if (l9_2513==1)
{
l9_2512=fract(l9_2512);
}
else
{
if (l9_2513==2)
{
float l9_2514=fract(l9_2512);
float l9_2515=l9_2512-l9_2514;
float l9_2516=step(0.25,fract(l9_2515*0.5));
l9_2512=mix(l9_2514,1.0-l9_2514,fast::clamp(l9_2516,0.0,1.0));
}
}
l9_2496.y=l9_2512;
if (l9_2500)
{
bool l9_2517=l9_2502;
bool l9_2518;
if (l9_2517)
{
l9_2518=l9_2499.x==3;
}
else
{
l9_2518=l9_2517;
}
float l9_2519=l9_2496.x;
float l9_2520=l9_2501.x;
float l9_2521=l9_2501.z;
bool l9_2522=l9_2518;
float l9_2523=l9_2506;
float l9_2524=fast::clamp(l9_2519,l9_2520,l9_2521);
float l9_2525=step(abs(l9_2519-l9_2524),9.9999997e-06);
l9_2523*=(l9_2525+((1.0-float(l9_2522))*(1.0-l9_2525)));
l9_2519=l9_2524;
l9_2496.x=l9_2519;
l9_2506=l9_2523;
bool l9_2526=l9_2502;
bool l9_2527;
if (l9_2526)
{
l9_2527=l9_2499.y==3;
}
else
{
l9_2527=l9_2526;
}
float l9_2528=l9_2496.y;
float l9_2529=l9_2501.y;
float l9_2530=l9_2501.w;
bool l9_2531=l9_2527;
float l9_2532=l9_2506;
float l9_2533=fast::clamp(l9_2528,l9_2529,l9_2530);
float l9_2534=step(abs(l9_2528-l9_2533),9.9999997e-06);
l9_2532*=(l9_2534+((1.0-float(l9_2531))*(1.0-l9_2534)));
l9_2528=l9_2533;
l9_2496.y=l9_2528;
l9_2506=l9_2532;
}
float2 l9_2535=l9_2496;
bool l9_2536=l9_2497;
float3x3 l9_2537=l9_2498;
if (l9_2536)
{
l9_2535=float2((l9_2537*float3(l9_2535,1.0)).xy);
}
float2 l9_2538=l9_2535;
float2 l9_2539=l9_2538;
float2 l9_2540=l9_2539;
l9_2496=l9_2540;
float l9_2541=l9_2496.x;
int l9_2542=l9_2499.x;
bool l9_2543=l9_2505;
float l9_2544=l9_2506;
if ((l9_2542==0)||(l9_2542==3))
{
float l9_2545=l9_2541;
float l9_2546=0.0;
float l9_2547=1.0;
bool l9_2548=l9_2543;
float l9_2549=l9_2544;
float l9_2550=fast::clamp(l9_2545,l9_2546,l9_2547);
float l9_2551=step(abs(l9_2545-l9_2550),9.9999997e-06);
l9_2549*=(l9_2551+((1.0-float(l9_2548))*(1.0-l9_2551)));
l9_2545=l9_2550;
l9_2541=l9_2545;
l9_2544=l9_2549;
}
l9_2496.x=l9_2541;
l9_2506=l9_2544;
float l9_2552=l9_2496.y;
int l9_2553=l9_2499.y;
bool l9_2554=l9_2505;
float l9_2555=l9_2506;
if ((l9_2553==0)||(l9_2553==3))
{
float l9_2556=l9_2552;
float l9_2557=0.0;
float l9_2558=1.0;
bool l9_2559=l9_2554;
float l9_2560=l9_2555;
float l9_2561=fast::clamp(l9_2556,l9_2557,l9_2558);
float l9_2562=step(abs(l9_2556-l9_2561),9.9999997e-06);
l9_2560*=(l9_2562+((1.0-float(l9_2559))*(1.0-l9_2562)));
l9_2556=l9_2561;
l9_2552=l9_2556;
l9_2555=l9_2560;
}
l9_2496.y=l9_2552;
l9_2506=l9_2555;
float2 l9_2563=l9_2496;
int l9_2564=l9_2494;
int l9_2565=l9_2495;
float l9_2566=l9_2504;
float2 l9_2567=l9_2563;
int l9_2568=l9_2564;
int l9_2569=l9_2565;
float3 l9_2570=float3(0.0);
if (l9_2568==0)
{
l9_2570=float3(l9_2567,0.0);
}
else
{
if (l9_2568==1)
{
l9_2570=float3(l9_2567.x,(l9_2567.y*0.5)+(0.5-(float(l9_2569)*0.5)),0.0);
}
else
{
l9_2570=float3(l9_2567,float(l9_2569));
}
}
float3 l9_2571=l9_2570;
float3 l9_2572=l9_2571;
float2 l9_2573=l9_2572.xy;
float l9_2574=l9_2566;
float4 l9_2575=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_2573,bias(l9_2574));
float4 l9_2576=l9_2575;
float4 l9_2577=l9_2576;
if (l9_2502)
{
l9_2577=mix(l9_2503,l9_2577,float4(l9_2506));
}
float4 l9_2578=l9_2577;
float4 l9_2579=l9_2578;
float3 l9_2580=(l9_2579.xyz*1.9921875)-float3(1.0);
l9_2579=float4(l9_2580.x,l9_2580.y,l9_2580.z,l9_2579.w);
l9_2486=l9_2579;
l9_2269=l9_2486.xyz;
l9_2272=l9_2269;
}
else
{
l9_2272=l9_2270;
}
l9_2268=l9_2272;
float3 l9_2581=float3(0.0);
float3 l9_2582=l9_2173.xyz;
float l9_2583=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_2584=l9_2268;
float l9_2585=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_2586=l9_2582;
float l9_2587=l9_2583;
float3 l9_2588=l9_2584;
float l9_2589=l9_2585;
float3 l9_2590=mix(float3(0.0,0.0,1.0),l9_2586,float3(l9_2587))+float3(0.0,0.0,1.0);
float3 l9_2591=mix(float3(0.0,0.0,1.0),l9_2588,float3(l9_2589))*float3(-1.0,-1.0,1.0);
float3 l9_2592=normalize((l9_2590*dot(l9_2590,l9_2591))-(l9_2591*l9_2590.z));
l9_2584=l9_2592;
float3 l9_2593=l9_2584;
l9_2581=l9_2593;
float3 l9_2594=float3(0.0);
l9_2594=l9_1959*l9_2581;
float3 l9_2595=float3(0.0);
float3 l9_2596=l9_2594;
float l9_2597=dot(l9_2596,l9_2596);
float l9_2598;
if (l9_2597>0.0)
{
l9_2598=1.0/sqrt(l9_2597);
}
else
{
l9_2598=0.0;
}
float l9_2599=l9_2598;
float3 l9_2600=l9_2596*l9_2599;
l9_2595=l9_2600;
param_17=l9_2595;
param_19=param_17;
}
else
{
float3 l9_2601=float3(0.0);
l9_2601=param_20.VertexNormal_WorldSpace;
float3 l9_2602=float3(0.0);
float3 l9_2603=l9_2601;
float l9_2604=dot(l9_2603,l9_2603);
float l9_2605;
if (l9_2604>0.0)
{
l9_2605=1.0/sqrt(l9_2604);
}
else
{
l9_2605=0.0;
}
float l9_2606=l9_2605;
float3 l9_2607=l9_2603*l9_2606;
l9_2602=l9_2607;
param_18=l9_2602;
param_19=param_18;
}
Result_N337=param_19;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float3 Result_N103=float3(0.0);
float3 param_21=float3(0.0);
float3 param_22=(*sc_set0.UserUniforms).Port_Default_N103;
ssGlobals param_24=Globals;
float3 param_23;
if ((NODE_38_DROPLIST_ITEM_tmp==2)||(int(Tweak_N223_tmp)!=0))
{
float3 l9_2608=float3(0.0);
float3 l9_2609=float3(0.0);
float3 l9_2610=float3(0.0);
ssGlobals l9_2611=param_24;
float3 l9_2612;
if (NODE_38_DROPLIST_ITEM_tmp==2)
{
float4 l9_2613=float4(0.0);
l9_2613=l9_2611.VertexColor;
float3 l9_2614=float3(0.0);
float3 l9_2615=float3(0.0);
float3 l9_2616=(*sc_set0.UserUniforms).Port_Default_N132;
ssGlobals l9_2617=l9_2611;
float3 l9_2618;
if ((int(Tweak_N223_tmp)!=0))
{
float2 l9_2619=float2(0.0);
float2 l9_2620=float2(0.0);
float2 l9_2621=float2(0.0);
float2 l9_2622=float2(0.0);
float2 l9_2623=float2(0.0);
float2 l9_2624=float2(0.0);
ssGlobals l9_2625=l9_2617;
float2 l9_2626;
if (NODE_76_DROPLIST_ITEM_tmp==0)
{
float2 l9_2627=float2(0.0);
l9_2627=l9_2625.Surface_UVCoord0;
l9_2620=l9_2627;
l9_2626=l9_2620;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==1)
{
float2 l9_2628=float2(0.0);
l9_2628=l9_2625.Surface_UVCoord1;
l9_2621=l9_2628;
l9_2626=l9_2621;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==2)
{
float2 l9_2629=float2(0.0);
float2 l9_2630=float2(0.0);
float2 l9_2631=float2(0.0);
ssGlobals l9_2632=l9_2625;
float2 l9_2633;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2634=float2(0.0);
float2 l9_2635=float2(0.0);
float2 l9_2636=float2(0.0);
ssGlobals l9_2637=l9_2632;
float2 l9_2638;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2639=float2(0.0);
float2 l9_2640=float2(0.0);
float2 l9_2641=float2(0.0);
float2 l9_2642=float2(0.0);
float2 l9_2643=float2(0.0);
ssGlobals l9_2644=l9_2637;
float2 l9_2645;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2646=float2(0.0);
l9_2646=l9_2644.Surface_UVCoord0;
l9_2640=l9_2646;
l9_2645=l9_2640;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2647=float2(0.0);
l9_2647=l9_2644.Surface_UVCoord1;
l9_2641=l9_2647;
l9_2645=l9_2641;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2648=float2(0.0);
l9_2648=l9_2644.gScreenCoord;
l9_2642=l9_2648;
l9_2645=l9_2642;
}
else
{
float2 l9_2649=float2(0.0);
l9_2649=l9_2644.Surface_UVCoord0;
l9_2643=l9_2649;
l9_2645=l9_2643;
}
}
}
l9_2639=l9_2645;
float2 l9_2650=float2(0.0);
float2 l9_2651=(*sc_set0.UserUniforms).uv2Scale;
l9_2650=l9_2651;
float2 l9_2652=float2(0.0);
l9_2652=l9_2650;
float2 l9_2653=float2(0.0);
float2 l9_2654=(*sc_set0.UserUniforms).uv2Offset;
l9_2653=l9_2654;
float2 l9_2655=float2(0.0);
l9_2655=l9_2653;
float2 l9_2656=float2(0.0);
l9_2656=(l9_2639*l9_2652)+l9_2655;
float2 l9_2657=float2(0.0);
l9_2657=l9_2656+(l9_2655*(l9_2637.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2635=l9_2657;
l9_2638=l9_2635;
}
else
{
float2 l9_2658=float2(0.0);
float2 l9_2659=float2(0.0);
float2 l9_2660=float2(0.0);
float2 l9_2661=float2(0.0);
float2 l9_2662=float2(0.0);
ssGlobals l9_2663=l9_2637;
float2 l9_2664;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2665=float2(0.0);
l9_2665=l9_2663.Surface_UVCoord0;
l9_2659=l9_2665;
l9_2664=l9_2659;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2666=float2(0.0);
l9_2666=l9_2663.Surface_UVCoord1;
l9_2660=l9_2666;
l9_2664=l9_2660;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2667=float2(0.0);
l9_2667=l9_2663.gScreenCoord;
l9_2661=l9_2667;
l9_2664=l9_2661;
}
else
{
float2 l9_2668=float2(0.0);
l9_2668=l9_2663.Surface_UVCoord0;
l9_2662=l9_2668;
l9_2664=l9_2662;
}
}
}
l9_2658=l9_2664;
float2 l9_2669=float2(0.0);
float2 l9_2670=(*sc_set0.UserUniforms).uv2Scale;
l9_2669=l9_2670;
float2 l9_2671=float2(0.0);
l9_2671=l9_2669;
float2 l9_2672=float2(0.0);
float2 l9_2673=(*sc_set0.UserUniforms).uv2Offset;
l9_2672=l9_2673;
float2 l9_2674=float2(0.0);
l9_2674=l9_2672;
float2 l9_2675=float2(0.0);
l9_2675=(l9_2658*l9_2671)+l9_2674;
l9_2636=l9_2675;
l9_2638=l9_2636;
}
l9_2634=l9_2638;
l9_2630=l9_2634;
l9_2633=l9_2630;
}
else
{
float2 l9_2676=float2(0.0);
l9_2676=l9_2632.Surface_UVCoord0;
l9_2631=l9_2676;
l9_2633=l9_2631;
}
l9_2629=l9_2633;
float2 l9_2677=float2(0.0);
l9_2677=l9_2629;
float2 l9_2678=float2(0.0);
l9_2678=l9_2677;
l9_2622=l9_2678;
l9_2626=l9_2622;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==3)
{
float2 l9_2679=float2(0.0);
float2 l9_2680=float2(0.0);
float2 l9_2681=float2(0.0);
ssGlobals l9_2682=l9_2625;
float2 l9_2683;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_2684=float2(0.0);
float2 l9_2685=float2(0.0);
float2 l9_2686=float2(0.0);
ssGlobals l9_2687=l9_2682;
float2 l9_2688;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2689=float2(0.0);
float2 l9_2690=float2(0.0);
float2 l9_2691=float2(0.0);
float2 l9_2692=float2(0.0);
float2 l9_2693=float2(0.0);
float2 l9_2694=float2(0.0);
ssGlobals l9_2695=l9_2687;
float2 l9_2696;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2697=float2(0.0);
l9_2697=l9_2695.Surface_UVCoord0;
l9_2690=l9_2697;
l9_2696=l9_2690;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2698=float2(0.0);
l9_2698=l9_2695.Surface_UVCoord1;
l9_2691=l9_2698;
l9_2696=l9_2691;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2699=float2(0.0);
l9_2699=l9_2695.gScreenCoord;
l9_2692=l9_2699;
l9_2696=l9_2692;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2700=float2(0.0);
float2 l9_2701=float2(0.0);
float2 l9_2702=float2(0.0);
ssGlobals l9_2703=l9_2695;
float2 l9_2704;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2705=float2(0.0);
float2 l9_2706=float2(0.0);
float2 l9_2707=float2(0.0);
ssGlobals l9_2708=l9_2703;
float2 l9_2709;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2710=float2(0.0);
float2 l9_2711=float2(0.0);
float2 l9_2712=float2(0.0);
float2 l9_2713=float2(0.0);
float2 l9_2714=float2(0.0);
ssGlobals l9_2715=l9_2708;
float2 l9_2716;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2717=float2(0.0);
l9_2717=l9_2715.Surface_UVCoord0;
l9_2711=l9_2717;
l9_2716=l9_2711;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2718=float2(0.0);
l9_2718=l9_2715.Surface_UVCoord1;
l9_2712=l9_2718;
l9_2716=l9_2712;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2719=float2(0.0);
l9_2719=l9_2715.gScreenCoord;
l9_2713=l9_2719;
l9_2716=l9_2713;
}
else
{
float2 l9_2720=float2(0.0);
l9_2720=l9_2715.Surface_UVCoord0;
l9_2714=l9_2720;
l9_2716=l9_2714;
}
}
}
l9_2710=l9_2716;
float2 l9_2721=float2(0.0);
float2 l9_2722=(*sc_set0.UserUniforms).uv2Scale;
l9_2721=l9_2722;
float2 l9_2723=float2(0.0);
l9_2723=l9_2721;
float2 l9_2724=float2(0.0);
float2 l9_2725=(*sc_set0.UserUniforms).uv2Offset;
l9_2724=l9_2725;
float2 l9_2726=float2(0.0);
l9_2726=l9_2724;
float2 l9_2727=float2(0.0);
l9_2727=(l9_2710*l9_2723)+l9_2726;
float2 l9_2728=float2(0.0);
l9_2728=l9_2727+(l9_2726*(l9_2708.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2706=l9_2728;
l9_2709=l9_2706;
}
else
{
float2 l9_2729=float2(0.0);
float2 l9_2730=float2(0.0);
float2 l9_2731=float2(0.0);
float2 l9_2732=float2(0.0);
float2 l9_2733=float2(0.0);
ssGlobals l9_2734=l9_2708;
float2 l9_2735;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2736=float2(0.0);
l9_2736=l9_2734.Surface_UVCoord0;
l9_2730=l9_2736;
l9_2735=l9_2730;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2737=float2(0.0);
l9_2737=l9_2734.Surface_UVCoord1;
l9_2731=l9_2737;
l9_2735=l9_2731;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2738=float2(0.0);
l9_2738=l9_2734.gScreenCoord;
l9_2732=l9_2738;
l9_2735=l9_2732;
}
else
{
float2 l9_2739=float2(0.0);
l9_2739=l9_2734.Surface_UVCoord0;
l9_2733=l9_2739;
l9_2735=l9_2733;
}
}
}
l9_2729=l9_2735;
float2 l9_2740=float2(0.0);
float2 l9_2741=(*sc_set0.UserUniforms).uv2Scale;
l9_2740=l9_2741;
float2 l9_2742=float2(0.0);
l9_2742=l9_2740;
float2 l9_2743=float2(0.0);
float2 l9_2744=(*sc_set0.UserUniforms).uv2Offset;
l9_2743=l9_2744;
float2 l9_2745=float2(0.0);
l9_2745=l9_2743;
float2 l9_2746=float2(0.0);
l9_2746=(l9_2729*l9_2742)+l9_2745;
l9_2707=l9_2746;
l9_2709=l9_2707;
}
l9_2705=l9_2709;
l9_2701=l9_2705;
l9_2704=l9_2701;
}
else
{
float2 l9_2747=float2(0.0);
l9_2747=l9_2703.Surface_UVCoord0;
l9_2702=l9_2747;
l9_2704=l9_2702;
}
l9_2700=l9_2704;
float2 l9_2748=float2(0.0);
l9_2748=l9_2700;
float2 l9_2749=float2(0.0);
l9_2749=l9_2748;
l9_2693=l9_2749;
l9_2696=l9_2693;
}
else
{
float2 l9_2750=float2(0.0);
l9_2750=l9_2695.Surface_UVCoord0;
l9_2694=l9_2750;
l9_2696=l9_2694;
}
}
}
}
l9_2689=l9_2696;
float2 l9_2751=float2(0.0);
float2 l9_2752=(*sc_set0.UserUniforms).uv3Scale;
l9_2751=l9_2752;
float2 l9_2753=float2(0.0);
l9_2753=l9_2751;
float2 l9_2754=float2(0.0);
float2 l9_2755=(*sc_set0.UserUniforms).uv3Offset;
l9_2754=l9_2755;
float2 l9_2756=float2(0.0);
l9_2756=l9_2754;
float2 l9_2757=float2(0.0);
l9_2757=(l9_2689*l9_2753)+l9_2756;
float2 l9_2758=float2(0.0);
l9_2758=l9_2757+(l9_2756*(l9_2687.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2685=l9_2758;
l9_2688=l9_2685;
}
else
{
float2 l9_2759=float2(0.0);
float2 l9_2760=float2(0.0);
float2 l9_2761=float2(0.0);
float2 l9_2762=float2(0.0);
float2 l9_2763=float2(0.0);
float2 l9_2764=float2(0.0);
ssGlobals l9_2765=l9_2687;
float2 l9_2766;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2767=float2(0.0);
l9_2767=l9_2765.Surface_UVCoord0;
l9_2760=l9_2767;
l9_2766=l9_2760;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2768=float2(0.0);
l9_2768=l9_2765.Surface_UVCoord1;
l9_2761=l9_2768;
l9_2766=l9_2761;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2769=float2(0.0);
l9_2769=l9_2765.gScreenCoord;
l9_2762=l9_2769;
l9_2766=l9_2762;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2770=float2(0.0);
float2 l9_2771=float2(0.0);
float2 l9_2772=float2(0.0);
ssGlobals l9_2773=l9_2765;
float2 l9_2774;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2775=float2(0.0);
float2 l9_2776=float2(0.0);
float2 l9_2777=float2(0.0);
ssGlobals l9_2778=l9_2773;
float2 l9_2779;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2780=float2(0.0);
float2 l9_2781=float2(0.0);
float2 l9_2782=float2(0.0);
float2 l9_2783=float2(0.0);
float2 l9_2784=float2(0.0);
ssGlobals l9_2785=l9_2778;
float2 l9_2786;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2787=float2(0.0);
l9_2787=l9_2785.Surface_UVCoord0;
l9_2781=l9_2787;
l9_2786=l9_2781;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2788=float2(0.0);
l9_2788=l9_2785.Surface_UVCoord1;
l9_2782=l9_2788;
l9_2786=l9_2782;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2789=float2(0.0);
l9_2789=l9_2785.gScreenCoord;
l9_2783=l9_2789;
l9_2786=l9_2783;
}
else
{
float2 l9_2790=float2(0.0);
l9_2790=l9_2785.Surface_UVCoord0;
l9_2784=l9_2790;
l9_2786=l9_2784;
}
}
}
l9_2780=l9_2786;
float2 l9_2791=float2(0.0);
float2 l9_2792=(*sc_set0.UserUniforms).uv2Scale;
l9_2791=l9_2792;
float2 l9_2793=float2(0.0);
l9_2793=l9_2791;
float2 l9_2794=float2(0.0);
float2 l9_2795=(*sc_set0.UserUniforms).uv2Offset;
l9_2794=l9_2795;
float2 l9_2796=float2(0.0);
l9_2796=l9_2794;
float2 l9_2797=float2(0.0);
l9_2797=(l9_2780*l9_2793)+l9_2796;
float2 l9_2798=float2(0.0);
l9_2798=l9_2797+(l9_2796*(l9_2778.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2776=l9_2798;
l9_2779=l9_2776;
}
else
{
float2 l9_2799=float2(0.0);
float2 l9_2800=float2(0.0);
float2 l9_2801=float2(0.0);
float2 l9_2802=float2(0.0);
float2 l9_2803=float2(0.0);
ssGlobals l9_2804=l9_2778;
float2 l9_2805;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2806=float2(0.0);
l9_2806=l9_2804.Surface_UVCoord0;
l9_2800=l9_2806;
l9_2805=l9_2800;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2807=float2(0.0);
l9_2807=l9_2804.Surface_UVCoord1;
l9_2801=l9_2807;
l9_2805=l9_2801;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2808=float2(0.0);
l9_2808=l9_2804.gScreenCoord;
l9_2802=l9_2808;
l9_2805=l9_2802;
}
else
{
float2 l9_2809=float2(0.0);
l9_2809=l9_2804.Surface_UVCoord0;
l9_2803=l9_2809;
l9_2805=l9_2803;
}
}
}
l9_2799=l9_2805;
float2 l9_2810=float2(0.0);
float2 l9_2811=(*sc_set0.UserUniforms).uv2Scale;
l9_2810=l9_2811;
float2 l9_2812=float2(0.0);
l9_2812=l9_2810;
float2 l9_2813=float2(0.0);
float2 l9_2814=(*sc_set0.UserUniforms).uv2Offset;
l9_2813=l9_2814;
float2 l9_2815=float2(0.0);
l9_2815=l9_2813;
float2 l9_2816=float2(0.0);
l9_2816=(l9_2799*l9_2812)+l9_2815;
l9_2777=l9_2816;
l9_2779=l9_2777;
}
l9_2775=l9_2779;
l9_2771=l9_2775;
l9_2774=l9_2771;
}
else
{
float2 l9_2817=float2(0.0);
l9_2817=l9_2773.Surface_UVCoord0;
l9_2772=l9_2817;
l9_2774=l9_2772;
}
l9_2770=l9_2774;
float2 l9_2818=float2(0.0);
l9_2818=l9_2770;
float2 l9_2819=float2(0.0);
l9_2819=l9_2818;
l9_2763=l9_2819;
l9_2766=l9_2763;
}
else
{
float2 l9_2820=float2(0.0);
l9_2820=l9_2765.Surface_UVCoord0;
l9_2764=l9_2820;
l9_2766=l9_2764;
}
}
}
}
l9_2759=l9_2766;
float2 l9_2821=float2(0.0);
float2 l9_2822=(*sc_set0.UserUniforms).uv3Scale;
l9_2821=l9_2822;
float2 l9_2823=float2(0.0);
l9_2823=l9_2821;
float2 l9_2824=float2(0.0);
float2 l9_2825=(*sc_set0.UserUniforms).uv3Offset;
l9_2824=l9_2825;
float2 l9_2826=float2(0.0);
l9_2826=l9_2824;
float2 l9_2827=float2(0.0);
l9_2827=(l9_2759*l9_2823)+l9_2826;
l9_2686=l9_2827;
l9_2688=l9_2686;
}
l9_2684=l9_2688;
l9_2680=l9_2684;
l9_2683=l9_2680;
}
else
{
float2 l9_2828=float2(0.0);
l9_2828=l9_2682.Surface_UVCoord0;
l9_2681=l9_2828;
l9_2683=l9_2681;
}
l9_2679=l9_2683;
float2 l9_2829=float2(0.0);
l9_2829=l9_2679;
float2 l9_2830=float2(0.0);
l9_2830=l9_2829;
l9_2623=l9_2830;
l9_2626=l9_2623;
}
else
{
float2 l9_2831=float2(0.0);
l9_2831=l9_2625.Surface_UVCoord0;
l9_2624=l9_2831;
l9_2626=l9_2624;
}
}
}
}
l9_2619=l9_2626;
float4 l9_2832=float4(0.0);
int l9_2833=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_2834=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2834=0;
}
else
{
l9_2834=in.varStereoViewID;
}
int l9_2835=l9_2834;
l9_2833=1-l9_2835;
}
else
{
int l9_2836=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2836=0;
}
else
{
l9_2836=in.varStereoViewID;
}
int l9_2837=l9_2836;
l9_2833=l9_2837;
}
int l9_2838=l9_2833;
int l9_2839=emissiveTexLayout_tmp;
int l9_2840=l9_2838;
float2 l9_2841=l9_2619;
bool l9_2842=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_2843=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_2844=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_2845=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_2846=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_2847=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_2848=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_2849=0.0;
bool l9_2850=l9_2847&&(!l9_2845);
float l9_2851=1.0;
float l9_2852=l9_2841.x;
int l9_2853=l9_2844.x;
if (l9_2853==1)
{
l9_2852=fract(l9_2852);
}
else
{
if (l9_2853==2)
{
float l9_2854=fract(l9_2852);
float l9_2855=l9_2852-l9_2854;
float l9_2856=step(0.25,fract(l9_2855*0.5));
l9_2852=mix(l9_2854,1.0-l9_2854,fast::clamp(l9_2856,0.0,1.0));
}
}
l9_2841.x=l9_2852;
float l9_2857=l9_2841.y;
int l9_2858=l9_2844.y;
if (l9_2858==1)
{
l9_2857=fract(l9_2857);
}
else
{
if (l9_2858==2)
{
float l9_2859=fract(l9_2857);
float l9_2860=l9_2857-l9_2859;
float l9_2861=step(0.25,fract(l9_2860*0.5));
l9_2857=mix(l9_2859,1.0-l9_2859,fast::clamp(l9_2861,0.0,1.0));
}
}
l9_2841.y=l9_2857;
if (l9_2845)
{
bool l9_2862=l9_2847;
bool l9_2863;
if (l9_2862)
{
l9_2863=l9_2844.x==3;
}
else
{
l9_2863=l9_2862;
}
float l9_2864=l9_2841.x;
float l9_2865=l9_2846.x;
float l9_2866=l9_2846.z;
bool l9_2867=l9_2863;
float l9_2868=l9_2851;
float l9_2869=fast::clamp(l9_2864,l9_2865,l9_2866);
float l9_2870=step(abs(l9_2864-l9_2869),9.9999997e-06);
l9_2868*=(l9_2870+((1.0-float(l9_2867))*(1.0-l9_2870)));
l9_2864=l9_2869;
l9_2841.x=l9_2864;
l9_2851=l9_2868;
bool l9_2871=l9_2847;
bool l9_2872;
if (l9_2871)
{
l9_2872=l9_2844.y==3;
}
else
{
l9_2872=l9_2871;
}
float l9_2873=l9_2841.y;
float l9_2874=l9_2846.y;
float l9_2875=l9_2846.w;
bool l9_2876=l9_2872;
float l9_2877=l9_2851;
float l9_2878=fast::clamp(l9_2873,l9_2874,l9_2875);
float l9_2879=step(abs(l9_2873-l9_2878),9.9999997e-06);
l9_2877*=(l9_2879+((1.0-float(l9_2876))*(1.0-l9_2879)));
l9_2873=l9_2878;
l9_2841.y=l9_2873;
l9_2851=l9_2877;
}
float2 l9_2880=l9_2841;
bool l9_2881=l9_2842;
float3x3 l9_2882=l9_2843;
if (l9_2881)
{
l9_2880=float2((l9_2882*float3(l9_2880,1.0)).xy);
}
float2 l9_2883=l9_2880;
float2 l9_2884=l9_2883;
float2 l9_2885=l9_2884;
l9_2841=l9_2885;
float l9_2886=l9_2841.x;
int l9_2887=l9_2844.x;
bool l9_2888=l9_2850;
float l9_2889=l9_2851;
if ((l9_2887==0)||(l9_2887==3))
{
float l9_2890=l9_2886;
float l9_2891=0.0;
float l9_2892=1.0;
bool l9_2893=l9_2888;
float l9_2894=l9_2889;
float l9_2895=fast::clamp(l9_2890,l9_2891,l9_2892);
float l9_2896=step(abs(l9_2890-l9_2895),9.9999997e-06);
l9_2894*=(l9_2896+((1.0-float(l9_2893))*(1.0-l9_2896)));
l9_2890=l9_2895;
l9_2886=l9_2890;
l9_2889=l9_2894;
}
l9_2841.x=l9_2886;
l9_2851=l9_2889;
float l9_2897=l9_2841.y;
int l9_2898=l9_2844.y;
bool l9_2899=l9_2850;
float l9_2900=l9_2851;
if ((l9_2898==0)||(l9_2898==3))
{
float l9_2901=l9_2897;
float l9_2902=0.0;
float l9_2903=1.0;
bool l9_2904=l9_2899;
float l9_2905=l9_2900;
float l9_2906=fast::clamp(l9_2901,l9_2902,l9_2903);
float l9_2907=step(abs(l9_2901-l9_2906),9.9999997e-06);
l9_2905*=(l9_2907+((1.0-float(l9_2904))*(1.0-l9_2907)));
l9_2901=l9_2906;
l9_2897=l9_2901;
l9_2900=l9_2905;
}
l9_2841.y=l9_2897;
l9_2851=l9_2900;
float2 l9_2908=l9_2841;
int l9_2909=l9_2839;
int l9_2910=l9_2840;
float l9_2911=l9_2849;
float2 l9_2912=l9_2908;
int l9_2913=l9_2909;
int l9_2914=l9_2910;
float3 l9_2915=float3(0.0);
if (l9_2913==0)
{
l9_2915=float3(l9_2912,0.0);
}
else
{
if (l9_2913==1)
{
l9_2915=float3(l9_2912.x,(l9_2912.y*0.5)+(0.5-(float(l9_2914)*0.5)),0.0);
}
else
{
l9_2915=float3(l9_2912,float(l9_2914));
}
}
float3 l9_2916=l9_2915;
float3 l9_2917=l9_2916;
float2 l9_2918=l9_2917.xy;
float l9_2919=l9_2911;
float4 l9_2920=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_2918,bias(l9_2919));
float4 l9_2921=l9_2920;
float4 l9_2922=l9_2921;
if (l9_2847)
{
l9_2922=mix(l9_2848,l9_2922,float4(l9_2851));
}
float4 l9_2923=l9_2922;
l9_2832=l9_2923;
l9_2615=l9_2832.xyz;
l9_2618=l9_2615;
}
else
{
l9_2618=l9_2616;
}
l9_2614=l9_2618;
float3 l9_2924=float3(0.0);
l9_2924=l9_2613.xyz+l9_2614;
l9_2609=l9_2924;
l9_2612=l9_2609;
}
else
{
float3 l9_2925=float3(0.0);
float3 l9_2926=float3(0.0);
float3 l9_2927=(*sc_set0.UserUniforms).Port_Default_N132;
ssGlobals l9_2928=l9_2611;
float3 l9_2929;
if ((int(Tweak_N223_tmp)!=0))
{
float2 l9_2930=float2(0.0);
float2 l9_2931=float2(0.0);
float2 l9_2932=float2(0.0);
float2 l9_2933=float2(0.0);
float2 l9_2934=float2(0.0);
float2 l9_2935=float2(0.0);
ssGlobals l9_2936=l9_2928;
float2 l9_2937;
if (NODE_76_DROPLIST_ITEM_tmp==0)
{
float2 l9_2938=float2(0.0);
l9_2938=l9_2936.Surface_UVCoord0;
l9_2931=l9_2938;
l9_2937=l9_2931;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==1)
{
float2 l9_2939=float2(0.0);
l9_2939=l9_2936.Surface_UVCoord1;
l9_2932=l9_2939;
l9_2937=l9_2932;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==2)
{
float2 l9_2940=float2(0.0);
float2 l9_2941=float2(0.0);
float2 l9_2942=float2(0.0);
ssGlobals l9_2943=l9_2936;
float2 l9_2944;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_2945=float2(0.0);
float2 l9_2946=float2(0.0);
float2 l9_2947=float2(0.0);
ssGlobals l9_2948=l9_2943;
float2 l9_2949;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2950=float2(0.0);
float2 l9_2951=float2(0.0);
float2 l9_2952=float2(0.0);
float2 l9_2953=float2(0.0);
float2 l9_2954=float2(0.0);
ssGlobals l9_2955=l9_2948;
float2 l9_2956;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2957=float2(0.0);
l9_2957=l9_2955.Surface_UVCoord0;
l9_2951=l9_2957;
l9_2956=l9_2951;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2958=float2(0.0);
l9_2958=l9_2955.Surface_UVCoord1;
l9_2952=l9_2958;
l9_2956=l9_2952;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2959=float2(0.0);
l9_2959=l9_2955.gScreenCoord;
l9_2953=l9_2959;
l9_2956=l9_2953;
}
else
{
float2 l9_2960=float2(0.0);
l9_2960=l9_2955.Surface_UVCoord0;
l9_2954=l9_2960;
l9_2956=l9_2954;
}
}
}
l9_2950=l9_2956;
float2 l9_2961=float2(0.0);
float2 l9_2962=(*sc_set0.UserUniforms).uv2Scale;
l9_2961=l9_2962;
float2 l9_2963=float2(0.0);
l9_2963=l9_2961;
float2 l9_2964=float2(0.0);
float2 l9_2965=(*sc_set0.UserUniforms).uv2Offset;
l9_2964=l9_2965;
float2 l9_2966=float2(0.0);
l9_2966=l9_2964;
float2 l9_2967=float2(0.0);
l9_2967=(l9_2950*l9_2963)+l9_2966;
float2 l9_2968=float2(0.0);
l9_2968=l9_2967+(l9_2966*(l9_2948.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2946=l9_2968;
l9_2949=l9_2946;
}
else
{
float2 l9_2969=float2(0.0);
float2 l9_2970=float2(0.0);
float2 l9_2971=float2(0.0);
float2 l9_2972=float2(0.0);
float2 l9_2973=float2(0.0);
ssGlobals l9_2974=l9_2948;
float2 l9_2975;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2976=float2(0.0);
l9_2976=l9_2974.Surface_UVCoord0;
l9_2970=l9_2976;
l9_2975=l9_2970;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2977=float2(0.0);
l9_2977=l9_2974.Surface_UVCoord1;
l9_2971=l9_2977;
l9_2975=l9_2971;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2978=float2(0.0);
l9_2978=l9_2974.gScreenCoord;
l9_2972=l9_2978;
l9_2975=l9_2972;
}
else
{
float2 l9_2979=float2(0.0);
l9_2979=l9_2974.Surface_UVCoord0;
l9_2973=l9_2979;
l9_2975=l9_2973;
}
}
}
l9_2969=l9_2975;
float2 l9_2980=float2(0.0);
float2 l9_2981=(*sc_set0.UserUniforms).uv2Scale;
l9_2980=l9_2981;
float2 l9_2982=float2(0.0);
l9_2982=l9_2980;
float2 l9_2983=float2(0.0);
float2 l9_2984=(*sc_set0.UserUniforms).uv2Offset;
l9_2983=l9_2984;
float2 l9_2985=float2(0.0);
l9_2985=l9_2983;
float2 l9_2986=float2(0.0);
l9_2986=(l9_2969*l9_2982)+l9_2985;
l9_2947=l9_2986;
l9_2949=l9_2947;
}
l9_2945=l9_2949;
l9_2941=l9_2945;
l9_2944=l9_2941;
}
else
{
float2 l9_2987=float2(0.0);
l9_2987=l9_2943.Surface_UVCoord0;
l9_2942=l9_2987;
l9_2944=l9_2942;
}
l9_2940=l9_2944;
float2 l9_2988=float2(0.0);
l9_2988=l9_2940;
float2 l9_2989=float2(0.0);
l9_2989=l9_2988;
l9_2933=l9_2989;
l9_2937=l9_2933;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==3)
{
float2 l9_2990=float2(0.0);
float2 l9_2991=float2(0.0);
float2 l9_2992=float2(0.0);
ssGlobals l9_2993=l9_2936;
float2 l9_2994;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_2995=float2(0.0);
float2 l9_2996=float2(0.0);
float2 l9_2997=float2(0.0);
ssGlobals l9_2998=l9_2993;
float2 l9_2999;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_3000=float2(0.0);
float2 l9_3001=float2(0.0);
float2 l9_3002=float2(0.0);
float2 l9_3003=float2(0.0);
float2 l9_3004=float2(0.0);
float2 l9_3005=float2(0.0);
ssGlobals l9_3006=l9_2998;
float2 l9_3007;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3008=float2(0.0);
l9_3008=l9_3006.Surface_UVCoord0;
l9_3001=l9_3008;
l9_3007=l9_3001;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3009=float2(0.0);
l9_3009=l9_3006.Surface_UVCoord1;
l9_3002=l9_3009;
l9_3007=l9_3002;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3010=float2(0.0);
l9_3010=l9_3006.gScreenCoord;
l9_3003=l9_3010;
l9_3007=l9_3003;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3011=float2(0.0);
float2 l9_3012=float2(0.0);
float2 l9_3013=float2(0.0);
ssGlobals l9_3014=l9_3006;
float2 l9_3015;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3016=float2(0.0);
float2 l9_3017=float2(0.0);
float2 l9_3018=float2(0.0);
ssGlobals l9_3019=l9_3014;
float2 l9_3020;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3021=float2(0.0);
float2 l9_3022=float2(0.0);
float2 l9_3023=float2(0.0);
float2 l9_3024=float2(0.0);
float2 l9_3025=float2(0.0);
ssGlobals l9_3026=l9_3019;
float2 l9_3027;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3028=float2(0.0);
l9_3028=l9_3026.Surface_UVCoord0;
l9_3022=l9_3028;
l9_3027=l9_3022;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3029=float2(0.0);
l9_3029=l9_3026.Surface_UVCoord1;
l9_3023=l9_3029;
l9_3027=l9_3023;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3030=float2(0.0);
l9_3030=l9_3026.gScreenCoord;
l9_3024=l9_3030;
l9_3027=l9_3024;
}
else
{
float2 l9_3031=float2(0.0);
l9_3031=l9_3026.Surface_UVCoord0;
l9_3025=l9_3031;
l9_3027=l9_3025;
}
}
}
l9_3021=l9_3027;
float2 l9_3032=float2(0.0);
float2 l9_3033=(*sc_set0.UserUniforms).uv2Scale;
l9_3032=l9_3033;
float2 l9_3034=float2(0.0);
l9_3034=l9_3032;
float2 l9_3035=float2(0.0);
float2 l9_3036=(*sc_set0.UserUniforms).uv2Offset;
l9_3035=l9_3036;
float2 l9_3037=float2(0.0);
l9_3037=l9_3035;
float2 l9_3038=float2(0.0);
l9_3038=(l9_3021*l9_3034)+l9_3037;
float2 l9_3039=float2(0.0);
l9_3039=l9_3038+(l9_3037*(l9_3019.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3017=l9_3039;
l9_3020=l9_3017;
}
else
{
float2 l9_3040=float2(0.0);
float2 l9_3041=float2(0.0);
float2 l9_3042=float2(0.0);
float2 l9_3043=float2(0.0);
float2 l9_3044=float2(0.0);
ssGlobals l9_3045=l9_3019;
float2 l9_3046;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3047=float2(0.0);
l9_3047=l9_3045.Surface_UVCoord0;
l9_3041=l9_3047;
l9_3046=l9_3041;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3048=float2(0.0);
l9_3048=l9_3045.Surface_UVCoord1;
l9_3042=l9_3048;
l9_3046=l9_3042;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3049=float2(0.0);
l9_3049=l9_3045.gScreenCoord;
l9_3043=l9_3049;
l9_3046=l9_3043;
}
else
{
float2 l9_3050=float2(0.0);
l9_3050=l9_3045.Surface_UVCoord0;
l9_3044=l9_3050;
l9_3046=l9_3044;
}
}
}
l9_3040=l9_3046;
float2 l9_3051=float2(0.0);
float2 l9_3052=(*sc_set0.UserUniforms).uv2Scale;
l9_3051=l9_3052;
float2 l9_3053=float2(0.0);
l9_3053=l9_3051;
float2 l9_3054=float2(0.0);
float2 l9_3055=(*sc_set0.UserUniforms).uv2Offset;
l9_3054=l9_3055;
float2 l9_3056=float2(0.0);
l9_3056=l9_3054;
float2 l9_3057=float2(0.0);
l9_3057=(l9_3040*l9_3053)+l9_3056;
l9_3018=l9_3057;
l9_3020=l9_3018;
}
l9_3016=l9_3020;
l9_3012=l9_3016;
l9_3015=l9_3012;
}
else
{
float2 l9_3058=float2(0.0);
l9_3058=l9_3014.Surface_UVCoord0;
l9_3013=l9_3058;
l9_3015=l9_3013;
}
l9_3011=l9_3015;
float2 l9_3059=float2(0.0);
l9_3059=l9_3011;
float2 l9_3060=float2(0.0);
l9_3060=l9_3059;
l9_3004=l9_3060;
l9_3007=l9_3004;
}
else
{
float2 l9_3061=float2(0.0);
l9_3061=l9_3006.Surface_UVCoord0;
l9_3005=l9_3061;
l9_3007=l9_3005;
}
}
}
}
l9_3000=l9_3007;
float2 l9_3062=float2(0.0);
float2 l9_3063=(*sc_set0.UserUniforms).uv3Scale;
l9_3062=l9_3063;
float2 l9_3064=float2(0.0);
l9_3064=l9_3062;
float2 l9_3065=float2(0.0);
float2 l9_3066=(*sc_set0.UserUniforms).uv3Offset;
l9_3065=l9_3066;
float2 l9_3067=float2(0.0);
l9_3067=l9_3065;
float2 l9_3068=float2(0.0);
l9_3068=(l9_3000*l9_3064)+l9_3067;
float2 l9_3069=float2(0.0);
l9_3069=l9_3068+(l9_3067*(l9_2998.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2996=l9_3069;
l9_2999=l9_2996;
}
else
{
float2 l9_3070=float2(0.0);
float2 l9_3071=float2(0.0);
float2 l9_3072=float2(0.0);
float2 l9_3073=float2(0.0);
float2 l9_3074=float2(0.0);
float2 l9_3075=float2(0.0);
ssGlobals l9_3076=l9_2998;
float2 l9_3077;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3078=float2(0.0);
l9_3078=l9_3076.Surface_UVCoord0;
l9_3071=l9_3078;
l9_3077=l9_3071;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3079=float2(0.0);
l9_3079=l9_3076.Surface_UVCoord1;
l9_3072=l9_3079;
l9_3077=l9_3072;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3080=float2(0.0);
l9_3080=l9_3076.gScreenCoord;
l9_3073=l9_3080;
l9_3077=l9_3073;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3081=float2(0.0);
float2 l9_3082=float2(0.0);
float2 l9_3083=float2(0.0);
ssGlobals l9_3084=l9_3076;
float2 l9_3085;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3086=float2(0.0);
float2 l9_3087=float2(0.0);
float2 l9_3088=float2(0.0);
ssGlobals l9_3089=l9_3084;
float2 l9_3090;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3091=float2(0.0);
float2 l9_3092=float2(0.0);
float2 l9_3093=float2(0.0);
float2 l9_3094=float2(0.0);
float2 l9_3095=float2(0.0);
ssGlobals l9_3096=l9_3089;
float2 l9_3097;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3098=float2(0.0);
l9_3098=l9_3096.Surface_UVCoord0;
l9_3092=l9_3098;
l9_3097=l9_3092;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3099=float2(0.0);
l9_3099=l9_3096.Surface_UVCoord1;
l9_3093=l9_3099;
l9_3097=l9_3093;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3100=float2(0.0);
l9_3100=l9_3096.gScreenCoord;
l9_3094=l9_3100;
l9_3097=l9_3094;
}
else
{
float2 l9_3101=float2(0.0);
l9_3101=l9_3096.Surface_UVCoord0;
l9_3095=l9_3101;
l9_3097=l9_3095;
}
}
}
l9_3091=l9_3097;
float2 l9_3102=float2(0.0);
float2 l9_3103=(*sc_set0.UserUniforms).uv2Scale;
l9_3102=l9_3103;
float2 l9_3104=float2(0.0);
l9_3104=l9_3102;
float2 l9_3105=float2(0.0);
float2 l9_3106=(*sc_set0.UserUniforms).uv2Offset;
l9_3105=l9_3106;
float2 l9_3107=float2(0.0);
l9_3107=l9_3105;
float2 l9_3108=float2(0.0);
l9_3108=(l9_3091*l9_3104)+l9_3107;
float2 l9_3109=float2(0.0);
l9_3109=l9_3108+(l9_3107*(l9_3089.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3087=l9_3109;
l9_3090=l9_3087;
}
else
{
float2 l9_3110=float2(0.0);
float2 l9_3111=float2(0.0);
float2 l9_3112=float2(0.0);
float2 l9_3113=float2(0.0);
float2 l9_3114=float2(0.0);
ssGlobals l9_3115=l9_3089;
float2 l9_3116;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3117=float2(0.0);
l9_3117=l9_3115.Surface_UVCoord0;
l9_3111=l9_3117;
l9_3116=l9_3111;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3118=float2(0.0);
l9_3118=l9_3115.Surface_UVCoord1;
l9_3112=l9_3118;
l9_3116=l9_3112;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3119=float2(0.0);
l9_3119=l9_3115.gScreenCoord;
l9_3113=l9_3119;
l9_3116=l9_3113;
}
else
{
float2 l9_3120=float2(0.0);
l9_3120=l9_3115.Surface_UVCoord0;
l9_3114=l9_3120;
l9_3116=l9_3114;
}
}
}
l9_3110=l9_3116;
float2 l9_3121=float2(0.0);
float2 l9_3122=(*sc_set0.UserUniforms).uv2Scale;
l9_3121=l9_3122;
float2 l9_3123=float2(0.0);
l9_3123=l9_3121;
float2 l9_3124=float2(0.0);
float2 l9_3125=(*sc_set0.UserUniforms).uv2Offset;
l9_3124=l9_3125;
float2 l9_3126=float2(0.0);
l9_3126=l9_3124;
float2 l9_3127=float2(0.0);
l9_3127=(l9_3110*l9_3123)+l9_3126;
l9_3088=l9_3127;
l9_3090=l9_3088;
}
l9_3086=l9_3090;
l9_3082=l9_3086;
l9_3085=l9_3082;
}
else
{
float2 l9_3128=float2(0.0);
l9_3128=l9_3084.Surface_UVCoord0;
l9_3083=l9_3128;
l9_3085=l9_3083;
}
l9_3081=l9_3085;
float2 l9_3129=float2(0.0);
l9_3129=l9_3081;
float2 l9_3130=float2(0.0);
l9_3130=l9_3129;
l9_3074=l9_3130;
l9_3077=l9_3074;
}
else
{
float2 l9_3131=float2(0.0);
l9_3131=l9_3076.Surface_UVCoord0;
l9_3075=l9_3131;
l9_3077=l9_3075;
}
}
}
}
l9_3070=l9_3077;
float2 l9_3132=float2(0.0);
float2 l9_3133=(*sc_set0.UserUniforms).uv3Scale;
l9_3132=l9_3133;
float2 l9_3134=float2(0.0);
l9_3134=l9_3132;
float2 l9_3135=float2(0.0);
float2 l9_3136=(*sc_set0.UserUniforms).uv3Offset;
l9_3135=l9_3136;
float2 l9_3137=float2(0.0);
l9_3137=l9_3135;
float2 l9_3138=float2(0.0);
l9_3138=(l9_3070*l9_3134)+l9_3137;
l9_2997=l9_3138;
l9_2999=l9_2997;
}
l9_2995=l9_2999;
l9_2991=l9_2995;
l9_2994=l9_2991;
}
else
{
float2 l9_3139=float2(0.0);
l9_3139=l9_2993.Surface_UVCoord0;
l9_2992=l9_3139;
l9_2994=l9_2992;
}
l9_2990=l9_2994;
float2 l9_3140=float2(0.0);
l9_3140=l9_2990;
float2 l9_3141=float2(0.0);
l9_3141=l9_3140;
l9_2934=l9_3141;
l9_2937=l9_2934;
}
else
{
float2 l9_3142=float2(0.0);
l9_3142=l9_2936.Surface_UVCoord0;
l9_2935=l9_3142;
l9_2937=l9_2935;
}
}
}
}
l9_2930=l9_2937;
float4 l9_3143=float4(0.0);
int l9_3144=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_3145=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3145=0;
}
else
{
l9_3145=in.varStereoViewID;
}
int l9_3146=l9_3145;
l9_3144=1-l9_3146;
}
else
{
int l9_3147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3147=0;
}
else
{
l9_3147=in.varStereoViewID;
}
int l9_3148=l9_3147;
l9_3144=l9_3148;
}
int l9_3149=l9_3144;
int l9_3150=emissiveTexLayout_tmp;
int l9_3151=l9_3149;
float2 l9_3152=l9_2930;
bool l9_3153=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_3154=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_3155=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_3156=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_3157=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_3158=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_3159=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_3160=0.0;
bool l9_3161=l9_3158&&(!l9_3156);
float l9_3162=1.0;
float l9_3163=l9_3152.x;
int l9_3164=l9_3155.x;
if (l9_3164==1)
{
l9_3163=fract(l9_3163);
}
else
{
if (l9_3164==2)
{
float l9_3165=fract(l9_3163);
float l9_3166=l9_3163-l9_3165;
float l9_3167=step(0.25,fract(l9_3166*0.5));
l9_3163=mix(l9_3165,1.0-l9_3165,fast::clamp(l9_3167,0.0,1.0));
}
}
l9_3152.x=l9_3163;
float l9_3168=l9_3152.y;
int l9_3169=l9_3155.y;
if (l9_3169==1)
{
l9_3168=fract(l9_3168);
}
else
{
if (l9_3169==2)
{
float l9_3170=fract(l9_3168);
float l9_3171=l9_3168-l9_3170;
float l9_3172=step(0.25,fract(l9_3171*0.5));
l9_3168=mix(l9_3170,1.0-l9_3170,fast::clamp(l9_3172,0.0,1.0));
}
}
l9_3152.y=l9_3168;
if (l9_3156)
{
bool l9_3173=l9_3158;
bool l9_3174;
if (l9_3173)
{
l9_3174=l9_3155.x==3;
}
else
{
l9_3174=l9_3173;
}
float l9_3175=l9_3152.x;
float l9_3176=l9_3157.x;
float l9_3177=l9_3157.z;
bool l9_3178=l9_3174;
float l9_3179=l9_3162;
float l9_3180=fast::clamp(l9_3175,l9_3176,l9_3177);
float l9_3181=step(abs(l9_3175-l9_3180),9.9999997e-06);
l9_3179*=(l9_3181+((1.0-float(l9_3178))*(1.0-l9_3181)));
l9_3175=l9_3180;
l9_3152.x=l9_3175;
l9_3162=l9_3179;
bool l9_3182=l9_3158;
bool l9_3183;
if (l9_3182)
{
l9_3183=l9_3155.y==3;
}
else
{
l9_3183=l9_3182;
}
float l9_3184=l9_3152.y;
float l9_3185=l9_3157.y;
float l9_3186=l9_3157.w;
bool l9_3187=l9_3183;
float l9_3188=l9_3162;
float l9_3189=fast::clamp(l9_3184,l9_3185,l9_3186);
float l9_3190=step(abs(l9_3184-l9_3189),9.9999997e-06);
l9_3188*=(l9_3190+((1.0-float(l9_3187))*(1.0-l9_3190)));
l9_3184=l9_3189;
l9_3152.y=l9_3184;
l9_3162=l9_3188;
}
float2 l9_3191=l9_3152;
bool l9_3192=l9_3153;
float3x3 l9_3193=l9_3154;
if (l9_3192)
{
l9_3191=float2((l9_3193*float3(l9_3191,1.0)).xy);
}
float2 l9_3194=l9_3191;
float2 l9_3195=l9_3194;
float2 l9_3196=l9_3195;
l9_3152=l9_3196;
float l9_3197=l9_3152.x;
int l9_3198=l9_3155.x;
bool l9_3199=l9_3161;
float l9_3200=l9_3162;
if ((l9_3198==0)||(l9_3198==3))
{
float l9_3201=l9_3197;
float l9_3202=0.0;
float l9_3203=1.0;
bool l9_3204=l9_3199;
float l9_3205=l9_3200;
float l9_3206=fast::clamp(l9_3201,l9_3202,l9_3203);
float l9_3207=step(abs(l9_3201-l9_3206),9.9999997e-06);
l9_3205*=(l9_3207+((1.0-float(l9_3204))*(1.0-l9_3207)));
l9_3201=l9_3206;
l9_3197=l9_3201;
l9_3200=l9_3205;
}
l9_3152.x=l9_3197;
l9_3162=l9_3200;
float l9_3208=l9_3152.y;
int l9_3209=l9_3155.y;
bool l9_3210=l9_3161;
float l9_3211=l9_3162;
if ((l9_3209==0)||(l9_3209==3))
{
float l9_3212=l9_3208;
float l9_3213=0.0;
float l9_3214=1.0;
bool l9_3215=l9_3210;
float l9_3216=l9_3211;
float l9_3217=fast::clamp(l9_3212,l9_3213,l9_3214);
float l9_3218=step(abs(l9_3212-l9_3217),9.9999997e-06);
l9_3216*=(l9_3218+((1.0-float(l9_3215))*(1.0-l9_3218)));
l9_3212=l9_3217;
l9_3208=l9_3212;
l9_3211=l9_3216;
}
l9_3152.y=l9_3208;
l9_3162=l9_3211;
float2 l9_3219=l9_3152;
int l9_3220=l9_3150;
int l9_3221=l9_3151;
float l9_3222=l9_3160;
float2 l9_3223=l9_3219;
int l9_3224=l9_3220;
int l9_3225=l9_3221;
float3 l9_3226=float3(0.0);
if (l9_3224==0)
{
l9_3226=float3(l9_3223,0.0);
}
else
{
if (l9_3224==1)
{
l9_3226=float3(l9_3223.x,(l9_3223.y*0.5)+(0.5-(float(l9_3225)*0.5)),0.0);
}
else
{
l9_3226=float3(l9_3223,float(l9_3225));
}
}
float3 l9_3227=l9_3226;
float3 l9_3228=l9_3227;
float2 l9_3229=l9_3228.xy;
float l9_3230=l9_3222;
float4 l9_3231=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_3229,bias(l9_3230));
float4 l9_3232=l9_3231;
float4 l9_3233=l9_3232;
if (l9_3158)
{
l9_3233=mix(l9_3159,l9_3233,float4(l9_3162));
}
float4 l9_3234=l9_3233;
l9_3143=l9_3234;
l9_2926=l9_3143.xyz;
l9_2929=l9_2926;
}
else
{
l9_2929=l9_2927;
}
l9_2925=l9_2929;
l9_2610=l9_2925;
l9_2612=l9_2610;
}
l9_2608=l9_2612;
float3 l9_3235=float3(0.0);
float3 l9_3236=(*sc_set0.UserUniforms).emissiveColor;
l9_3235=l9_3236;
float3 l9_3237=float3(0.0);
l9_3237=l9_3235;
float l9_3238=0.0;
float l9_3239=(*sc_set0.UserUniforms).emissiveIntensity;
l9_3238=l9_3239;
float l9_3240=0.0;
l9_3240=l9_3238;
float3 l9_3241=float3(0.0);
l9_3241=(l9_2608*l9_3237)*float3(l9_3240);
float3 l9_3242=float3(0.0);
float3 l9_3243=l9_3241;
float3 l9_3244;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3244=float3(pow(l9_3243.x,2.2),pow(l9_3243.y,2.2),pow(l9_3243.z,2.2));
}
else
{
l9_3244=l9_3243*l9_3243;
}
float3 l9_3245=l9_3244;
l9_3242=l9_3245;
param_21=l9_3242;
param_23=param_21;
}
else
{
param_23=param_22;
}
Result_N103=param_23;
float3 Result_N134=float3(0.0);
float3 param_25=float3(0.0);
float3 param_26=(*sc_set0.UserUniforms).Port_Default_N134;
ssGlobals param_28=Globals;
float3 param_27;
if ((int(Tweak_N179_tmp)!=0))
{
float l9_3246=0.0;
float l9_3247=(*sc_set0.UserUniforms).reflectionIntensity;
l9_3246=l9_3247;
float l9_3248=0.0;
l9_3248=l9_3246;
float3 l9_3249=float3(0.0);
l9_3249=param_28.ViewDirWS;
float3 l9_3250=float3(0.0);
float3 l9_3251=float3(0.0);
float3 l9_3252=float3(0.0);
ssGlobals l9_3253=param_28;
float3 l9_3254;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_3255=float3(0.0);
l9_3255=l9_3253.VertexTangent_WorldSpace;
float3 l9_3256=float3(0.0);
l9_3256=l9_3253.VertexBinormal_WorldSpace;
float3 l9_3257=float3(0.0);
l9_3257=l9_3253.VertexNormal_WorldSpace;
float3x3 l9_3258=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_3258=float3x3(float3(l9_3255),float3(l9_3256),float3(l9_3257));
float2 l9_3259=float2(0.0);
float2 l9_3260=float2(0.0);
float2 l9_3261=float2(0.0);
float2 l9_3262=float2(0.0);
float2 l9_3263=float2(0.0);
float2 l9_3264=float2(0.0);
ssGlobals l9_3265=l9_3253;
float2 l9_3266;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_3267=float2(0.0);
l9_3267=l9_3265.Surface_UVCoord0;
l9_3260=l9_3267;
l9_3266=l9_3260;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_3268=float2(0.0);
l9_3268=l9_3265.Surface_UVCoord1;
l9_3261=l9_3268;
l9_3266=l9_3261;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_3269=float2(0.0);
float2 l9_3270=float2(0.0);
float2 l9_3271=float2(0.0);
ssGlobals l9_3272=l9_3265;
float2 l9_3273;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3274=float2(0.0);
float2 l9_3275=float2(0.0);
float2 l9_3276=float2(0.0);
ssGlobals l9_3277=l9_3272;
float2 l9_3278;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3279=float2(0.0);
float2 l9_3280=float2(0.0);
float2 l9_3281=float2(0.0);
float2 l9_3282=float2(0.0);
float2 l9_3283=float2(0.0);
ssGlobals l9_3284=l9_3277;
float2 l9_3285;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3286=float2(0.0);
l9_3286=l9_3284.Surface_UVCoord0;
l9_3280=l9_3286;
l9_3285=l9_3280;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3287=float2(0.0);
l9_3287=l9_3284.Surface_UVCoord1;
l9_3281=l9_3287;
l9_3285=l9_3281;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3288=float2(0.0);
l9_3288=l9_3284.gScreenCoord;
l9_3282=l9_3288;
l9_3285=l9_3282;
}
else
{
float2 l9_3289=float2(0.0);
l9_3289=l9_3284.Surface_UVCoord0;
l9_3283=l9_3289;
l9_3285=l9_3283;
}
}
}
l9_3279=l9_3285;
float2 l9_3290=float2(0.0);
float2 l9_3291=(*sc_set0.UserUniforms).uv2Scale;
l9_3290=l9_3291;
float2 l9_3292=float2(0.0);
l9_3292=l9_3290;
float2 l9_3293=float2(0.0);
float2 l9_3294=(*sc_set0.UserUniforms).uv2Offset;
l9_3293=l9_3294;
float2 l9_3295=float2(0.0);
l9_3295=l9_3293;
float2 l9_3296=float2(0.0);
l9_3296=(l9_3279*l9_3292)+l9_3295;
float2 l9_3297=float2(0.0);
l9_3297=l9_3296+(l9_3295*(l9_3277.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3275=l9_3297;
l9_3278=l9_3275;
}
else
{
float2 l9_3298=float2(0.0);
float2 l9_3299=float2(0.0);
float2 l9_3300=float2(0.0);
float2 l9_3301=float2(0.0);
float2 l9_3302=float2(0.0);
ssGlobals l9_3303=l9_3277;
float2 l9_3304;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3305=float2(0.0);
l9_3305=l9_3303.Surface_UVCoord0;
l9_3299=l9_3305;
l9_3304=l9_3299;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3306=float2(0.0);
l9_3306=l9_3303.Surface_UVCoord1;
l9_3300=l9_3306;
l9_3304=l9_3300;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3307=float2(0.0);
l9_3307=l9_3303.gScreenCoord;
l9_3301=l9_3307;
l9_3304=l9_3301;
}
else
{
float2 l9_3308=float2(0.0);
l9_3308=l9_3303.Surface_UVCoord0;
l9_3302=l9_3308;
l9_3304=l9_3302;
}
}
}
l9_3298=l9_3304;
float2 l9_3309=float2(0.0);
float2 l9_3310=(*sc_set0.UserUniforms).uv2Scale;
l9_3309=l9_3310;
float2 l9_3311=float2(0.0);
l9_3311=l9_3309;
float2 l9_3312=float2(0.0);
float2 l9_3313=(*sc_set0.UserUniforms).uv2Offset;
l9_3312=l9_3313;
float2 l9_3314=float2(0.0);
l9_3314=l9_3312;
float2 l9_3315=float2(0.0);
l9_3315=(l9_3298*l9_3311)+l9_3314;
l9_3276=l9_3315;
l9_3278=l9_3276;
}
l9_3274=l9_3278;
l9_3270=l9_3274;
l9_3273=l9_3270;
}
else
{
float2 l9_3316=float2(0.0);
l9_3316=l9_3272.Surface_UVCoord0;
l9_3271=l9_3316;
l9_3273=l9_3271;
}
l9_3269=l9_3273;
float2 l9_3317=float2(0.0);
l9_3317=l9_3269;
float2 l9_3318=float2(0.0);
l9_3318=l9_3317;
l9_3262=l9_3318;
l9_3266=l9_3262;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_3319=float2(0.0);
float2 l9_3320=float2(0.0);
float2 l9_3321=float2(0.0);
ssGlobals l9_3322=l9_3265;
float2 l9_3323;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_3324=float2(0.0);
float2 l9_3325=float2(0.0);
float2 l9_3326=float2(0.0);
ssGlobals l9_3327=l9_3322;
float2 l9_3328;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_3329=float2(0.0);
float2 l9_3330=float2(0.0);
float2 l9_3331=float2(0.0);
float2 l9_3332=float2(0.0);
float2 l9_3333=float2(0.0);
float2 l9_3334=float2(0.0);
ssGlobals l9_3335=l9_3327;
float2 l9_3336;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3337=float2(0.0);
l9_3337=l9_3335.Surface_UVCoord0;
l9_3330=l9_3337;
l9_3336=l9_3330;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3338=float2(0.0);
l9_3338=l9_3335.Surface_UVCoord1;
l9_3331=l9_3338;
l9_3336=l9_3331;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3339=float2(0.0);
l9_3339=l9_3335.gScreenCoord;
l9_3332=l9_3339;
l9_3336=l9_3332;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3340=float2(0.0);
float2 l9_3341=float2(0.0);
float2 l9_3342=float2(0.0);
ssGlobals l9_3343=l9_3335;
float2 l9_3344;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3345=float2(0.0);
float2 l9_3346=float2(0.0);
float2 l9_3347=float2(0.0);
ssGlobals l9_3348=l9_3343;
float2 l9_3349;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3350=float2(0.0);
float2 l9_3351=float2(0.0);
float2 l9_3352=float2(0.0);
float2 l9_3353=float2(0.0);
float2 l9_3354=float2(0.0);
ssGlobals l9_3355=l9_3348;
float2 l9_3356;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3357=float2(0.0);
l9_3357=l9_3355.Surface_UVCoord0;
l9_3351=l9_3357;
l9_3356=l9_3351;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3358=float2(0.0);
l9_3358=l9_3355.Surface_UVCoord1;
l9_3352=l9_3358;
l9_3356=l9_3352;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3359=float2(0.0);
l9_3359=l9_3355.gScreenCoord;
l9_3353=l9_3359;
l9_3356=l9_3353;
}
else
{
float2 l9_3360=float2(0.0);
l9_3360=l9_3355.Surface_UVCoord0;
l9_3354=l9_3360;
l9_3356=l9_3354;
}
}
}
l9_3350=l9_3356;
float2 l9_3361=float2(0.0);
float2 l9_3362=(*sc_set0.UserUniforms).uv2Scale;
l9_3361=l9_3362;
float2 l9_3363=float2(0.0);
l9_3363=l9_3361;
float2 l9_3364=float2(0.0);
float2 l9_3365=(*sc_set0.UserUniforms).uv2Offset;
l9_3364=l9_3365;
float2 l9_3366=float2(0.0);
l9_3366=l9_3364;
float2 l9_3367=float2(0.0);
l9_3367=(l9_3350*l9_3363)+l9_3366;
float2 l9_3368=float2(0.0);
l9_3368=l9_3367+(l9_3366*(l9_3348.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3346=l9_3368;
l9_3349=l9_3346;
}
else
{
float2 l9_3369=float2(0.0);
float2 l9_3370=float2(0.0);
float2 l9_3371=float2(0.0);
float2 l9_3372=float2(0.0);
float2 l9_3373=float2(0.0);
ssGlobals l9_3374=l9_3348;
float2 l9_3375;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3376=float2(0.0);
l9_3376=l9_3374.Surface_UVCoord0;
l9_3370=l9_3376;
l9_3375=l9_3370;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3377=float2(0.0);
l9_3377=l9_3374.Surface_UVCoord1;
l9_3371=l9_3377;
l9_3375=l9_3371;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3378=float2(0.0);
l9_3378=l9_3374.gScreenCoord;
l9_3372=l9_3378;
l9_3375=l9_3372;
}
else
{
float2 l9_3379=float2(0.0);
l9_3379=l9_3374.Surface_UVCoord0;
l9_3373=l9_3379;
l9_3375=l9_3373;
}
}
}
l9_3369=l9_3375;
float2 l9_3380=float2(0.0);
float2 l9_3381=(*sc_set0.UserUniforms).uv2Scale;
l9_3380=l9_3381;
float2 l9_3382=float2(0.0);
l9_3382=l9_3380;
float2 l9_3383=float2(0.0);
float2 l9_3384=(*sc_set0.UserUniforms).uv2Offset;
l9_3383=l9_3384;
float2 l9_3385=float2(0.0);
l9_3385=l9_3383;
float2 l9_3386=float2(0.0);
l9_3386=(l9_3369*l9_3382)+l9_3385;
l9_3347=l9_3386;
l9_3349=l9_3347;
}
l9_3345=l9_3349;
l9_3341=l9_3345;
l9_3344=l9_3341;
}
else
{
float2 l9_3387=float2(0.0);
l9_3387=l9_3343.Surface_UVCoord0;
l9_3342=l9_3387;
l9_3344=l9_3342;
}
l9_3340=l9_3344;
float2 l9_3388=float2(0.0);
l9_3388=l9_3340;
float2 l9_3389=float2(0.0);
l9_3389=l9_3388;
l9_3333=l9_3389;
l9_3336=l9_3333;
}
else
{
float2 l9_3390=float2(0.0);
l9_3390=l9_3335.Surface_UVCoord0;
l9_3334=l9_3390;
l9_3336=l9_3334;
}
}
}
}
l9_3329=l9_3336;
float2 l9_3391=float2(0.0);
float2 l9_3392=(*sc_set0.UserUniforms).uv3Scale;
l9_3391=l9_3392;
float2 l9_3393=float2(0.0);
l9_3393=l9_3391;
float2 l9_3394=float2(0.0);
float2 l9_3395=(*sc_set0.UserUniforms).uv3Offset;
l9_3394=l9_3395;
float2 l9_3396=float2(0.0);
l9_3396=l9_3394;
float2 l9_3397=float2(0.0);
l9_3397=(l9_3329*l9_3393)+l9_3396;
float2 l9_3398=float2(0.0);
l9_3398=l9_3397+(l9_3396*(l9_3327.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_3325=l9_3398;
l9_3328=l9_3325;
}
else
{
float2 l9_3399=float2(0.0);
float2 l9_3400=float2(0.0);
float2 l9_3401=float2(0.0);
float2 l9_3402=float2(0.0);
float2 l9_3403=float2(0.0);
float2 l9_3404=float2(0.0);
ssGlobals l9_3405=l9_3327;
float2 l9_3406;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3407=float2(0.0);
l9_3407=l9_3405.Surface_UVCoord0;
l9_3400=l9_3407;
l9_3406=l9_3400;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3408=float2(0.0);
l9_3408=l9_3405.Surface_UVCoord1;
l9_3401=l9_3408;
l9_3406=l9_3401;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3409=float2(0.0);
l9_3409=l9_3405.gScreenCoord;
l9_3402=l9_3409;
l9_3406=l9_3402;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3410=float2(0.0);
float2 l9_3411=float2(0.0);
float2 l9_3412=float2(0.0);
ssGlobals l9_3413=l9_3405;
float2 l9_3414;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3415=float2(0.0);
float2 l9_3416=float2(0.0);
float2 l9_3417=float2(0.0);
ssGlobals l9_3418=l9_3413;
float2 l9_3419;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3420=float2(0.0);
float2 l9_3421=float2(0.0);
float2 l9_3422=float2(0.0);
float2 l9_3423=float2(0.0);
float2 l9_3424=float2(0.0);
ssGlobals l9_3425=l9_3418;
float2 l9_3426;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3427=float2(0.0);
l9_3427=l9_3425.Surface_UVCoord0;
l9_3421=l9_3427;
l9_3426=l9_3421;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3428=float2(0.0);
l9_3428=l9_3425.Surface_UVCoord1;
l9_3422=l9_3428;
l9_3426=l9_3422;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3429=float2(0.0);
l9_3429=l9_3425.gScreenCoord;
l9_3423=l9_3429;
l9_3426=l9_3423;
}
else
{
float2 l9_3430=float2(0.0);
l9_3430=l9_3425.Surface_UVCoord0;
l9_3424=l9_3430;
l9_3426=l9_3424;
}
}
}
l9_3420=l9_3426;
float2 l9_3431=float2(0.0);
float2 l9_3432=(*sc_set0.UserUniforms).uv2Scale;
l9_3431=l9_3432;
float2 l9_3433=float2(0.0);
l9_3433=l9_3431;
float2 l9_3434=float2(0.0);
float2 l9_3435=(*sc_set0.UserUniforms).uv2Offset;
l9_3434=l9_3435;
float2 l9_3436=float2(0.0);
l9_3436=l9_3434;
float2 l9_3437=float2(0.0);
l9_3437=(l9_3420*l9_3433)+l9_3436;
float2 l9_3438=float2(0.0);
l9_3438=l9_3437+(l9_3436*(l9_3418.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3416=l9_3438;
l9_3419=l9_3416;
}
else
{
float2 l9_3439=float2(0.0);
float2 l9_3440=float2(0.0);
float2 l9_3441=float2(0.0);
float2 l9_3442=float2(0.0);
float2 l9_3443=float2(0.0);
ssGlobals l9_3444=l9_3418;
float2 l9_3445;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3446=float2(0.0);
l9_3446=l9_3444.Surface_UVCoord0;
l9_3440=l9_3446;
l9_3445=l9_3440;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3447=float2(0.0);
l9_3447=l9_3444.Surface_UVCoord1;
l9_3441=l9_3447;
l9_3445=l9_3441;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3448=float2(0.0);
l9_3448=l9_3444.gScreenCoord;
l9_3442=l9_3448;
l9_3445=l9_3442;
}
else
{
float2 l9_3449=float2(0.0);
l9_3449=l9_3444.Surface_UVCoord0;
l9_3443=l9_3449;
l9_3445=l9_3443;
}
}
}
l9_3439=l9_3445;
float2 l9_3450=float2(0.0);
float2 l9_3451=(*sc_set0.UserUniforms).uv2Scale;
l9_3450=l9_3451;
float2 l9_3452=float2(0.0);
l9_3452=l9_3450;
float2 l9_3453=float2(0.0);
float2 l9_3454=(*sc_set0.UserUniforms).uv2Offset;
l9_3453=l9_3454;
float2 l9_3455=float2(0.0);
l9_3455=l9_3453;
float2 l9_3456=float2(0.0);
l9_3456=(l9_3439*l9_3452)+l9_3455;
l9_3417=l9_3456;
l9_3419=l9_3417;
}
l9_3415=l9_3419;
l9_3411=l9_3415;
l9_3414=l9_3411;
}
else
{
float2 l9_3457=float2(0.0);
l9_3457=l9_3413.Surface_UVCoord0;
l9_3412=l9_3457;
l9_3414=l9_3412;
}
l9_3410=l9_3414;
float2 l9_3458=float2(0.0);
l9_3458=l9_3410;
float2 l9_3459=float2(0.0);
l9_3459=l9_3458;
l9_3403=l9_3459;
l9_3406=l9_3403;
}
else
{
float2 l9_3460=float2(0.0);
l9_3460=l9_3405.Surface_UVCoord0;
l9_3404=l9_3460;
l9_3406=l9_3404;
}
}
}
}
l9_3399=l9_3406;
float2 l9_3461=float2(0.0);
float2 l9_3462=(*sc_set0.UserUniforms).uv3Scale;
l9_3461=l9_3462;
float2 l9_3463=float2(0.0);
l9_3463=l9_3461;
float2 l9_3464=float2(0.0);
float2 l9_3465=(*sc_set0.UserUniforms).uv3Offset;
l9_3464=l9_3465;
float2 l9_3466=float2(0.0);
l9_3466=l9_3464;
float2 l9_3467=float2(0.0);
l9_3467=(l9_3399*l9_3463)+l9_3466;
l9_3326=l9_3467;
l9_3328=l9_3326;
}
l9_3324=l9_3328;
l9_3320=l9_3324;
l9_3323=l9_3320;
}
else
{
float2 l9_3468=float2(0.0);
l9_3468=l9_3322.Surface_UVCoord0;
l9_3321=l9_3468;
l9_3323=l9_3321;
}
l9_3319=l9_3323;
float2 l9_3469=float2(0.0);
l9_3469=l9_3319;
float2 l9_3470=float2(0.0);
l9_3470=l9_3469;
l9_3263=l9_3470;
l9_3266=l9_3263;
}
else
{
float2 l9_3471=float2(0.0);
l9_3471=l9_3265.Surface_UVCoord0;
l9_3264=l9_3471;
l9_3266=l9_3264;
}
}
}
}
l9_3259=l9_3266;
float4 l9_3472=float4(0.0);
float2 l9_3473=l9_3259;
int l9_3474=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_3475=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3475=0;
}
else
{
l9_3475=in.varStereoViewID;
}
int l9_3476=l9_3475;
l9_3474=1-l9_3476;
}
else
{
int l9_3477=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3477=0;
}
else
{
l9_3477=in.varStereoViewID;
}
int l9_3478=l9_3477;
l9_3474=l9_3478;
}
int l9_3479=l9_3474;
int l9_3480=normalTexLayout_tmp;
int l9_3481=l9_3479;
float2 l9_3482=l9_3473;
bool l9_3483=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_3484=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_3485=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_3486=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_3487=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_3488=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_3489=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_3490=0.0;
bool l9_3491=l9_3488&&(!l9_3486);
float l9_3492=1.0;
float l9_3493=l9_3482.x;
int l9_3494=l9_3485.x;
if (l9_3494==1)
{
l9_3493=fract(l9_3493);
}
else
{
if (l9_3494==2)
{
float l9_3495=fract(l9_3493);
float l9_3496=l9_3493-l9_3495;
float l9_3497=step(0.25,fract(l9_3496*0.5));
l9_3493=mix(l9_3495,1.0-l9_3495,fast::clamp(l9_3497,0.0,1.0));
}
}
l9_3482.x=l9_3493;
float l9_3498=l9_3482.y;
int l9_3499=l9_3485.y;
if (l9_3499==1)
{
l9_3498=fract(l9_3498);
}
else
{
if (l9_3499==2)
{
float l9_3500=fract(l9_3498);
float l9_3501=l9_3498-l9_3500;
float l9_3502=step(0.25,fract(l9_3501*0.5));
l9_3498=mix(l9_3500,1.0-l9_3500,fast::clamp(l9_3502,0.0,1.0));
}
}
l9_3482.y=l9_3498;
if (l9_3486)
{
bool l9_3503=l9_3488;
bool l9_3504;
if (l9_3503)
{
l9_3504=l9_3485.x==3;
}
else
{
l9_3504=l9_3503;
}
float l9_3505=l9_3482.x;
float l9_3506=l9_3487.x;
float l9_3507=l9_3487.z;
bool l9_3508=l9_3504;
float l9_3509=l9_3492;
float l9_3510=fast::clamp(l9_3505,l9_3506,l9_3507);
float l9_3511=step(abs(l9_3505-l9_3510),9.9999997e-06);
l9_3509*=(l9_3511+((1.0-float(l9_3508))*(1.0-l9_3511)));
l9_3505=l9_3510;
l9_3482.x=l9_3505;
l9_3492=l9_3509;
bool l9_3512=l9_3488;
bool l9_3513;
if (l9_3512)
{
l9_3513=l9_3485.y==3;
}
else
{
l9_3513=l9_3512;
}
float l9_3514=l9_3482.y;
float l9_3515=l9_3487.y;
float l9_3516=l9_3487.w;
bool l9_3517=l9_3513;
float l9_3518=l9_3492;
float l9_3519=fast::clamp(l9_3514,l9_3515,l9_3516);
float l9_3520=step(abs(l9_3514-l9_3519),9.9999997e-06);
l9_3518*=(l9_3520+((1.0-float(l9_3517))*(1.0-l9_3520)));
l9_3514=l9_3519;
l9_3482.y=l9_3514;
l9_3492=l9_3518;
}
float2 l9_3521=l9_3482;
bool l9_3522=l9_3483;
float3x3 l9_3523=l9_3484;
if (l9_3522)
{
l9_3521=float2((l9_3523*float3(l9_3521,1.0)).xy);
}
float2 l9_3524=l9_3521;
float2 l9_3525=l9_3524;
float2 l9_3526=l9_3525;
l9_3482=l9_3526;
float l9_3527=l9_3482.x;
int l9_3528=l9_3485.x;
bool l9_3529=l9_3491;
float l9_3530=l9_3492;
if ((l9_3528==0)||(l9_3528==3))
{
float l9_3531=l9_3527;
float l9_3532=0.0;
float l9_3533=1.0;
bool l9_3534=l9_3529;
float l9_3535=l9_3530;
float l9_3536=fast::clamp(l9_3531,l9_3532,l9_3533);
float l9_3537=step(abs(l9_3531-l9_3536),9.9999997e-06);
l9_3535*=(l9_3537+((1.0-float(l9_3534))*(1.0-l9_3537)));
l9_3531=l9_3536;
l9_3527=l9_3531;
l9_3530=l9_3535;
}
l9_3482.x=l9_3527;
l9_3492=l9_3530;
float l9_3538=l9_3482.y;
int l9_3539=l9_3485.y;
bool l9_3540=l9_3491;
float l9_3541=l9_3492;
if ((l9_3539==0)||(l9_3539==3))
{
float l9_3542=l9_3538;
float l9_3543=0.0;
float l9_3544=1.0;
bool l9_3545=l9_3540;
float l9_3546=l9_3541;
float l9_3547=fast::clamp(l9_3542,l9_3543,l9_3544);
float l9_3548=step(abs(l9_3542-l9_3547),9.9999997e-06);
l9_3546*=(l9_3548+((1.0-float(l9_3545))*(1.0-l9_3548)));
l9_3542=l9_3547;
l9_3538=l9_3542;
l9_3541=l9_3546;
}
l9_3482.y=l9_3538;
l9_3492=l9_3541;
float2 l9_3549=l9_3482;
int l9_3550=l9_3480;
int l9_3551=l9_3481;
float l9_3552=l9_3490;
float2 l9_3553=l9_3549;
int l9_3554=l9_3550;
int l9_3555=l9_3551;
float3 l9_3556=float3(0.0);
if (l9_3554==0)
{
l9_3556=float3(l9_3553,0.0);
}
else
{
if (l9_3554==1)
{
l9_3556=float3(l9_3553.x,(l9_3553.y*0.5)+(0.5-(float(l9_3555)*0.5)),0.0);
}
else
{
l9_3556=float3(l9_3553,float(l9_3555));
}
}
float3 l9_3557=l9_3556;
float3 l9_3558=l9_3557;
float2 l9_3559=l9_3558.xy;
float l9_3560=l9_3552;
float4 l9_3561=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_3559,bias(l9_3560));
float4 l9_3562=l9_3561;
float4 l9_3563=l9_3562;
if (l9_3488)
{
l9_3563=mix(l9_3489,l9_3563,float4(l9_3492));
}
float4 l9_3564=l9_3563;
float4 l9_3565=l9_3564;
float3 l9_3566=(l9_3565.xyz*1.9921875)-float3(1.0);
l9_3565=float4(l9_3566.x,l9_3566.y,l9_3566.z,l9_3565.w);
l9_3472=l9_3565;
float3 l9_3567=float3(0.0);
float3 l9_3568=float3(0.0);
float3 l9_3569=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_3570=l9_3253;
float3 l9_3571;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_3572=float2(0.0);
float2 l9_3573=float2(0.0);
float2 l9_3574=float2(0.0);
float2 l9_3575=float2(0.0);
float2 l9_3576=float2(0.0);
float2 l9_3577=float2(0.0);
ssGlobals l9_3578=l9_3570;
float2 l9_3579;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_3580=float2(0.0);
l9_3580=l9_3578.Surface_UVCoord0;
l9_3573=l9_3580;
l9_3579=l9_3573;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_3581=float2(0.0);
l9_3581=l9_3578.Surface_UVCoord1;
l9_3574=l9_3581;
l9_3579=l9_3574;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_3582=float2(0.0);
float2 l9_3583=float2(0.0);
float2 l9_3584=float2(0.0);
ssGlobals l9_3585=l9_3578;
float2 l9_3586;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3587=float2(0.0);
float2 l9_3588=float2(0.0);
float2 l9_3589=float2(0.0);
ssGlobals l9_3590=l9_3585;
float2 l9_3591;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3592=float2(0.0);
float2 l9_3593=float2(0.0);
float2 l9_3594=float2(0.0);
float2 l9_3595=float2(0.0);
float2 l9_3596=float2(0.0);
ssGlobals l9_3597=l9_3590;
float2 l9_3598;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3599=float2(0.0);
l9_3599=l9_3597.Surface_UVCoord0;
l9_3593=l9_3599;
l9_3598=l9_3593;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3600=float2(0.0);
l9_3600=l9_3597.Surface_UVCoord1;
l9_3594=l9_3600;
l9_3598=l9_3594;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3601=float2(0.0);
l9_3601=l9_3597.gScreenCoord;
l9_3595=l9_3601;
l9_3598=l9_3595;
}
else
{
float2 l9_3602=float2(0.0);
l9_3602=l9_3597.Surface_UVCoord0;
l9_3596=l9_3602;
l9_3598=l9_3596;
}
}
}
l9_3592=l9_3598;
float2 l9_3603=float2(0.0);
float2 l9_3604=(*sc_set0.UserUniforms).uv2Scale;
l9_3603=l9_3604;
float2 l9_3605=float2(0.0);
l9_3605=l9_3603;
float2 l9_3606=float2(0.0);
float2 l9_3607=(*sc_set0.UserUniforms).uv2Offset;
l9_3606=l9_3607;
float2 l9_3608=float2(0.0);
l9_3608=l9_3606;
float2 l9_3609=float2(0.0);
l9_3609=(l9_3592*l9_3605)+l9_3608;
float2 l9_3610=float2(0.0);
l9_3610=l9_3609+(l9_3608*(l9_3590.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3588=l9_3610;
l9_3591=l9_3588;
}
else
{
float2 l9_3611=float2(0.0);
float2 l9_3612=float2(0.0);
float2 l9_3613=float2(0.0);
float2 l9_3614=float2(0.0);
float2 l9_3615=float2(0.0);
ssGlobals l9_3616=l9_3590;
float2 l9_3617;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3618=float2(0.0);
l9_3618=l9_3616.Surface_UVCoord0;
l9_3612=l9_3618;
l9_3617=l9_3612;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3619=float2(0.0);
l9_3619=l9_3616.Surface_UVCoord1;
l9_3613=l9_3619;
l9_3617=l9_3613;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3620=float2(0.0);
l9_3620=l9_3616.gScreenCoord;
l9_3614=l9_3620;
l9_3617=l9_3614;
}
else
{
float2 l9_3621=float2(0.0);
l9_3621=l9_3616.Surface_UVCoord0;
l9_3615=l9_3621;
l9_3617=l9_3615;
}
}
}
l9_3611=l9_3617;
float2 l9_3622=float2(0.0);
float2 l9_3623=(*sc_set0.UserUniforms).uv2Scale;
l9_3622=l9_3623;
float2 l9_3624=float2(0.0);
l9_3624=l9_3622;
float2 l9_3625=float2(0.0);
float2 l9_3626=(*sc_set0.UserUniforms).uv2Offset;
l9_3625=l9_3626;
float2 l9_3627=float2(0.0);
l9_3627=l9_3625;
float2 l9_3628=float2(0.0);
l9_3628=(l9_3611*l9_3624)+l9_3627;
l9_3589=l9_3628;
l9_3591=l9_3589;
}
l9_3587=l9_3591;
l9_3583=l9_3587;
l9_3586=l9_3583;
}
else
{
float2 l9_3629=float2(0.0);
l9_3629=l9_3585.Surface_UVCoord0;
l9_3584=l9_3629;
l9_3586=l9_3584;
}
l9_3582=l9_3586;
float2 l9_3630=float2(0.0);
l9_3630=l9_3582;
float2 l9_3631=float2(0.0);
l9_3631=l9_3630;
l9_3575=l9_3631;
l9_3579=l9_3575;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_3632=float2(0.0);
float2 l9_3633=float2(0.0);
float2 l9_3634=float2(0.0);
ssGlobals l9_3635=l9_3578;
float2 l9_3636;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_3637=float2(0.0);
float2 l9_3638=float2(0.0);
float2 l9_3639=float2(0.0);
ssGlobals l9_3640=l9_3635;
float2 l9_3641;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_3642=float2(0.0);
float2 l9_3643=float2(0.0);
float2 l9_3644=float2(0.0);
float2 l9_3645=float2(0.0);
float2 l9_3646=float2(0.0);
float2 l9_3647=float2(0.0);
ssGlobals l9_3648=l9_3640;
float2 l9_3649;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3650=float2(0.0);
l9_3650=l9_3648.Surface_UVCoord0;
l9_3643=l9_3650;
l9_3649=l9_3643;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3651=float2(0.0);
l9_3651=l9_3648.Surface_UVCoord1;
l9_3644=l9_3651;
l9_3649=l9_3644;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3652=float2(0.0);
l9_3652=l9_3648.gScreenCoord;
l9_3645=l9_3652;
l9_3649=l9_3645;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3653=float2(0.0);
float2 l9_3654=float2(0.0);
float2 l9_3655=float2(0.0);
ssGlobals l9_3656=l9_3648;
float2 l9_3657;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3658=float2(0.0);
float2 l9_3659=float2(0.0);
float2 l9_3660=float2(0.0);
ssGlobals l9_3661=l9_3656;
float2 l9_3662;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3663=float2(0.0);
float2 l9_3664=float2(0.0);
float2 l9_3665=float2(0.0);
float2 l9_3666=float2(0.0);
float2 l9_3667=float2(0.0);
ssGlobals l9_3668=l9_3661;
float2 l9_3669;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3670=float2(0.0);
l9_3670=l9_3668.Surface_UVCoord0;
l9_3664=l9_3670;
l9_3669=l9_3664;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3671=float2(0.0);
l9_3671=l9_3668.Surface_UVCoord1;
l9_3665=l9_3671;
l9_3669=l9_3665;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3672=float2(0.0);
l9_3672=l9_3668.gScreenCoord;
l9_3666=l9_3672;
l9_3669=l9_3666;
}
else
{
float2 l9_3673=float2(0.0);
l9_3673=l9_3668.Surface_UVCoord0;
l9_3667=l9_3673;
l9_3669=l9_3667;
}
}
}
l9_3663=l9_3669;
float2 l9_3674=float2(0.0);
float2 l9_3675=(*sc_set0.UserUniforms).uv2Scale;
l9_3674=l9_3675;
float2 l9_3676=float2(0.0);
l9_3676=l9_3674;
float2 l9_3677=float2(0.0);
float2 l9_3678=(*sc_set0.UserUniforms).uv2Offset;
l9_3677=l9_3678;
float2 l9_3679=float2(0.0);
l9_3679=l9_3677;
float2 l9_3680=float2(0.0);
l9_3680=(l9_3663*l9_3676)+l9_3679;
float2 l9_3681=float2(0.0);
l9_3681=l9_3680+(l9_3679*(l9_3661.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3659=l9_3681;
l9_3662=l9_3659;
}
else
{
float2 l9_3682=float2(0.0);
float2 l9_3683=float2(0.0);
float2 l9_3684=float2(0.0);
float2 l9_3685=float2(0.0);
float2 l9_3686=float2(0.0);
ssGlobals l9_3687=l9_3661;
float2 l9_3688;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3689=float2(0.0);
l9_3689=l9_3687.Surface_UVCoord0;
l9_3683=l9_3689;
l9_3688=l9_3683;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3690=float2(0.0);
l9_3690=l9_3687.Surface_UVCoord1;
l9_3684=l9_3690;
l9_3688=l9_3684;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3691=float2(0.0);
l9_3691=l9_3687.gScreenCoord;
l9_3685=l9_3691;
l9_3688=l9_3685;
}
else
{
float2 l9_3692=float2(0.0);
l9_3692=l9_3687.Surface_UVCoord0;
l9_3686=l9_3692;
l9_3688=l9_3686;
}
}
}
l9_3682=l9_3688;
float2 l9_3693=float2(0.0);
float2 l9_3694=(*sc_set0.UserUniforms).uv2Scale;
l9_3693=l9_3694;
float2 l9_3695=float2(0.0);
l9_3695=l9_3693;
float2 l9_3696=float2(0.0);
float2 l9_3697=(*sc_set0.UserUniforms).uv2Offset;
l9_3696=l9_3697;
float2 l9_3698=float2(0.0);
l9_3698=l9_3696;
float2 l9_3699=float2(0.0);
l9_3699=(l9_3682*l9_3695)+l9_3698;
l9_3660=l9_3699;
l9_3662=l9_3660;
}
l9_3658=l9_3662;
l9_3654=l9_3658;
l9_3657=l9_3654;
}
else
{
float2 l9_3700=float2(0.0);
l9_3700=l9_3656.Surface_UVCoord0;
l9_3655=l9_3700;
l9_3657=l9_3655;
}
l9_3653=l9_3657;
float2 l9_3701=float2(0.0);
l9_3701=l9_3653;
float2 l9_3702=float2(0.0);
l9_3702=l9_3701;
l9_3646=l9_3702;
l9_3649=l9_3646;
}
else
{
float2 l9_3703=float2(0.0);
l9_3703=l9_3648.Surface_UVCoord0;
l9_3647=l9_3703;
l9_3649=l9_3647;
}
}
}
}
l9_3642=l9_3649;
float2 l9_3704=float2(0.0);
float2 l9_3705=(*sc_set0.UserUniforms).uv3Scale;
l9_3704=l9_3705;
float2 l9_3706=float2(0.0);
l9_3706=l9_3704;
float2 l9_3707=float2(0.0);
float2 l9_3708=(*sc_set0.UserUniforms).uv3Offset;
l9_3707=l9_3708;
float2 l9_3709=float2(0.0);
l9_3709=l9_3707;
float2 l9_3710=float2(0.0);
l9_3710=(l9_3642*l9_3706)+l9_3709;
float2 l9_3711=float2(0.0);
l9_3711=l9_3710+(l9_3709*(l9_3640.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_3638=l9_3711;
l9_3641=l9_3638;
}
else
{
float2 l9_3712=float2(0.0);
float2 l9_3713=float2(0.0);
float2 l9_3714=float2(0.0);
float2 l9_3715=float2(0.0);
float2 l9_3716=float2(0.0);
float2 l9_3717=float2(0.0);
ssGlobals l9_3718=l9_3640;
float2 l9_3719;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3720=float2(0.0);
l9_3720=l9_3718.Surface_UVCoord0;
l9_3713=l9_3720;
l9_3719=l9_3713;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3721=float2(0.0);
l9_3721=l9_3718.Surface_UVCoord1;
l9_3714=l9_3721;
l9_3719=l9_3714;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3722=float2(0.0);
l9_3722=l9_3718.gScreenCoord;
l9_3715=l9_3722;
l9_3719=l9_3715;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3723=float2(0.0);
float2 l9_3724=float2(0.0);
float2 l9_3725=float2(0.0);
ssGlobals l9_3726=l9_3718;
float2 l9_3727;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_3728=float2(0.0);
float2 l9_3729=float2(0.0);
float2 l9_3730=float2(0.0);
ssGlobals l9_3731=l9_3726;
float2 l9_3732;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3733=float2(0.0);
float2 l9_3734=float2(0.0);
float2 l9_3735=float2(0.0);
float2 l9_3736=float2(0.0);
float2 l9_3737=float2(0.0);
ssGlobals l9_3738=l9_3731;
float2 l9_3739;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3740=float2(0.0);
l9_3740=l9_3738.Surface_UVCoord0;
l9_3734=l9_3740;
l9_3739=l9_3734;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3741=float2(0.0);
l9_3741=l9_3738.Surface_UVCoord1;
l9_3735=l9_3741;
l9_3739=l9_3735;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3742=float2(0.0);
l9_3742=l9_3738.gScreenCoord;
l9_3736=l9_3742;
l9_3739=l9_3736;
}
else
{
float2 l9_3743=float2(0.0);
l9_3743=l9_3738.Surface_UVCoord0;
l9_3737=l9_3743;
l9_3739=l9_3737;
}
}
}
l9_3733=l9_3739;
float2 l9_3744=float2(0.0);
float2 l9_3745=(*sc_set0.UserUniforms).uv2Scale;
l9_3744=l9_3745;
float2 l9_3746=float2(0.0);
l9_3746=l9_3744;
float2 l9_3747=float2(0.0);
float2 l9_3748=(*sc_set0.UserUniforms).uv2Offset;
l9_3747=l9_3748;
float2 l9_3749=float2(0.0);
l9_3749=l9_3747;
float2 l9_3750=float2(0.0);
l9_3750=(l9_3733*l9_3746)+l9_3749;
float2 l9_3751=float2(0.0);
l9_3751=l9_3750+(l9_3749*(l9_3731.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3729=l9_3751;
l9_3732=l9_3729;
}
else
{
float2 l9_3752=float2(0.0);
float2 l9_3753=float2(0.0);
float2 l9_3754=float2(0.0);
float2 l9_3755=float2(0.0);
float2 l9_3756=float2(0.0);
ssGlobals l9_3757=l9_3731;
float2 l9_3758;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3759=float2(0.0);
l9_3759=l9_3757.Surface_UVCoord0;
l9_3753=l9_3759;
l9_3758=l9_3753;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3760=float2(0.0);
l9_3760=l9_3757.Surface_UVCoord1;
l9_3754=l9_3760;
l9_3758=l9_3754;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3761=float2(0.0);
l9_3761=l9_3757.gScreenCoord;
l9_3755=l9_3761;
l9_3758=l9_3755;
}
else
{
float2 l9_3762=float2(0.0);
l9_3762=l9_3757.Surface_UVCoord0;
l9_3756=l9_3762;
l9_3758=l9_3756;
}
}
}
l9_3752=l9_3758;
float2 l9_3763=float2(0.0);
float2 l9_3764=(*sc_set0.UserUniforms).uv2Scale;
l9_3763=l9_3764;
float2 l9_3765=float2(0.0);
l9_3765=l9_3763;
float2 l9_3766=float2(0.0);
float2 l9_3767=(*sc_set0.UserUniforms).uv2Offset;
l9_3766=l9_3767;
float2 l9_3768=float2(0.0);
l9_3768=l9_3766;
float2 l9_3769=float2(0.0);
l9_3769=(l9_3752*l9_3765)+l9_3768;
l9_3730=l9_3769;
l9_3732=l9_3730;
}
l9_3728=l9_3732;
l9_3724=l9_3728;
l9_3727=l9_3724;
}
else
{
float2 l9_3770=float2(0.0);
l9_3770=l9_3726.Surface_UVCoord0;
l9_3725=l9_3770;
l9_3727=l9_3725;
}
l9_3723=l9_3727;
float2 l9_3771=float2(0.0);
l9_3771=l9_3723;
float2 l9_3772=float2(0.0);
l9_3772=l9_3771;
l9_3716=l9_3772;
l9_3719=l9_3716;
}
else
{
float2 l9_3773=float2(0.0);
l9_3773=l9_3718.Surface_UVCoord0;
l9_3717=l9_3773;
l9_3719=l9_3717;
}
}
}
}
l9_3712=l9_3719;
float2 l9_3774=float2(0.0);
float2 l9_3775=(*sc_set0.UserUniforms).uv3Scale;
l9_3774=l9_3775;
float2 l9_3776=float2(0.0);
l9_3776=l9_3774;
float2 l9_3777=float2(0.0);
float2 l9_3778=(*sc_set0.UserUniforms).uv3Offset;
l9_3777=l9_3778;
float2 l9_3779=float2(0.0);
l9_3779=l9_3777;
float2 l9_3780=float2(0.0);
l9_3780=(l9_3712*l9_3776)+l9_3779;
l9_3639=l9_3780;
l9_3641=l9_3639;
}
l9_3637=l9_3641;
l9_3633=l9_3637;
l9_3636=l9_3633;
}
else
{
float2 l9_3781=float2(0.0);
l9_3781=l9_3635.Surface_UVCoord0;
l9_3634=l9_3781;
l9_3636=l9_3634;
}
l9_3632=l9_3636;
float2 l9_3782=float2(0.0);
l9_3782=l9_3632;
float2 l9_3783=float2(0.0);
l9_3783=l9_3782;
l9_3576=l9_3783;
l9_3579=l9_3576;
}
else
{
float2 l9_3784=float2(0.0);
l9_3784=l9_3578.Surface_UVCoord0;
l9_3577=l9_3784;
l9_3579=l9_3577;
}
}
}
}
l9_3572=l9_3579;
float4 l9_3785=float4(0.0);
float2 l9_3786=l9_3572;
int l9_3787=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_3788=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3788=0;
}
else
{
l9_3788=in.varStereoViewID;
}
int l9_3789=l9_3788;
l9_3787=1-l9_3789;
}
else
{
int l9_3790=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3790=0;
}
else
{
l9_3790=in.varStereoViewID;
}
int l9_3791=l9_3790;
l9_3787=l9_3791;
}
int l9_3792=l9_3787;
int l9_3793=detailNormalTexLayout_tmp;
int l9_3794=l9_3792;
float2 l9_3795=l9_3786;
bool l9_3796=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_3797=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_3798=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_3799=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_3800=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_3801=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_3802=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_3803=0.0;
bool l9_3804=l9_3801&&(!l9_3799);
float l9_3805=1.0;
float l9_3806=l9_3795.x;
int l9_3807=l9_3798.x;
if (l9_3807==1)
{
l9_3806=fract(l9_3806);
}
else
{
if (l9_3807==2)
{
float l9_3808=fract(l9_3806);
float l9_3809=l9_3806-l9_3808;
float l9_3810=step(0.25,fract(l9_3809*0.5));
l9_3806=mix(l9_3808,1.0-l9_3808,fast::clamp(l9_3810,0.0,1.0));
}
}
l9_3795.x=l9_3806;
float l9_3811=l9_3795.y;
int l9_3812=l9_3798.y;
if (l9_3812==1)
{
l9_3811=fract(l9_3811);
}
else
{
if (l9_3812==2)
{
float l9_3813=fract(l9_3811);
float l9_3814=l9_3811-l9_3813;
float l9_3815=step(0.25,fract(l9_3814*0.5));
l9_3811=mix(l9_3813,1.0-l9_3813,fast::clamp(l9_3815,0.0,1.0));
}
}
l9_3795.y=l9_3811;
if (l9_3799)
{
bool l9_3816=l9_3801;
bool l9_3817;
if (l9_3816)
{
l9_3817=l9_3798.x==3;
}
else
{
l9_3817=l9_3816;
}
float l9_3818=l9_3795.x;
float l9_3819=l9_3800.x;
float l9_3820=l9_3800.z;
bool l9_3821=l9_3817;
float l9_3822=l9_3805;
float l9_3823=fast::clamp(l9_3818,l9_3819,l9_3820);
float l9_3824=step(abs(l9_3818-l9_3823),9.9999997e-06);
l9_3822*=(l9_3824+((1.0-float(l9_3821))*(1.0-l9_3824)));
l9_3818=l9_3823;
l9_3795.x=l9_3818;
l9_3805=l9_3822;
bool l9_3825=l9_3801;
bool l9_3826;
if (l9_3825)
{
l9_3826=l9_3798.y==3;
}
else
{
l9_3826=l9_3825;
}
float l9_3827=l9_3795.y;
float l9_3828=l9_3800.y;
float l9_3829=l9_3800.w;
bool l9_3830=l9_3826;
float l9_3831=l9_3805;
float l9_3832=fast::clamp(l9_3827,l9_3828,l9_3829);
float l9_3833=step(abs(l9_3827-l9_3832),9.9999997e-06);
l9_3831*=(l9_3833+((1.0-float(l9_3830))*(1.0-l9_3833)));
l9_3827=l9_3832;
l9_3795.y=l9_3827;
l9_3805=l9_3831;
}
float2 l9_3834=l9_3795;
bool l9_3835=l9_3796;
float3x3 l9_3836=l9_3797;
if (l9_3835)
{
l9_3834=float2((l9_3836*float3(l9_3834,1.0)).xy);
}
float2 l9_3837=l9_3834;
float2 l9_3838=l9_3837;
float2 l9_3839=l9_3838;
l9_3795=l9_3839;
float l9_3840=l9_3795.x;
int l9_3841=l9_3798.x;
bool l9_3842=l9_3804;
float l9_3843=l9_3805;
if ((l9_3841==0)||(l9_3841==3))
{
float l9_3844=l9_3840;
float l9_3845=0.0;
float l9_3846=1.0;
bool l9_3847=l9_3842;
float l9_3848=l9_3843;
float l9_3849=fast::clamp(l9_3844,l9_3845,l9_3846);
float l9_3850=step(abs(l9_3844-l9_3849),9.9999997e-06);
l9_3848*=(l9_3850+((1.0-float(l9_3847))*(1.0-l9_3850)));
l9_3844=l9_3849;
l9_3840=l9_3844;
l9_3843=l9_3848;
}
l9_3795.x=l9_3840;
l9_3805=l9_3843;
float l9_3851=l9_3795.y;
int l9_3852=l9_3798.y;
bool l9_3853=l9_3804;
float l9_3854=l9_3805;
if ((l9_3852==0)||(l9_3852==3))
{
float l9_3855=l9_3851;
float l9_3856=0.0;
float l9_3857=1.0;
bool l9_3858=l9_3853;
float l9_3859=l9_3854;
float l9_3860=fast::clamp(l9_3855,l9_3856,l9_3857);
float l9_3861=step(abs(l9_3855-l9_3860),9.9999997e-06);
l9_3859*=(l9_3861+((1.0-float(l9_3858))*(1.0-l9_3861)));
l9_3855=l9_3860;
l9_3851=l9_3855;
l9_3854=l9_3859;
}
l9_3795.y=l9_3851;
l9_3805=l9_3854;
float2 l9_3862=l9_3795;
int l9_3863=l9_3793;
int l9_3864=l9_3794;
float l9_3865=l9_3803;
float2 l9_3866=l9_3862;
int l9_3867=l9_3863;
int l9_3868=l9_3864;
float3 l9_3869=float3(0.0);
if (l9_3867==0)
{
l9_3869=float3(l9_3866,0.0);
}
else
{
if (l9_3867==1)
{
l9_3869=float3(l9_3866.x,(l9_3866.y*0.5)+(0.5-(float(l9_3868)*0.5)),0.0);
}
else
{
l9_3869=float3(l9_3866,float(l9_3868));
}
}
float3 l9_3870=l9_3869;
float3 l9_3871=l9_3870;
float2 l9_3872=l9_3871.xy;
float l9_3873=l9_3865;
float4 l9_3874=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_3872,bias(l9_3873));
float4 l9_3875=l9_3874;
float4 l9_3876=l9_3875;
if (l9_3801)
{
l9_3876=mix(l9_3802,l9_3876,float4(l9_3805));
}
float4 l9_3877=l9_3876;
float4 l9_3878=l9_3877;
float3 l9_3879=(l9_3878.xyz*1.9921875)-float3(1.0);
l9_3878=float4(l9_3879.x,l9_3879.y,l9_3879.z,l9_3878.w);
l9_3785=l9_3878;
l9_3568=l9_3785.xyz;
l9_3571=l9_3568;
}
else
{
l9_3571=l9_3569;
}
l9_3567=l9_3571;
float3 l9_3880=float3(0.0);
float3 l9_3881=l9_3472.xyz;
float l9_3882=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_3883=l9_3567;
float l9_3884=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_3885=l9_3881;
float l9_3886=l9_3882;
float3 l9_3887=l9_3883;
float l9_3888=l9_3884;
float3 l9_3889=mix(float3(0.0,0.0,1.0),l9_3885,float3(l9_3886))+float3(0.0,0.0,1.0);
float3 l9_3890=mix(float3(0.0,0.0,1.0),l9_3887,float3(l9_3888))*float3(-1.0,-1.0,1.0);
float3 l9_3891=normalize((l9_3889*dot(l9_3889,l9_3890))-(l9_3890*l9_3889.z));
l9_3883=l9_3891;
float3 l9_3892=l9_3883;
l9_3880=l9_3892;
float3 l9_3893=float3(0.0);
l9_3893=l9_3258*l9_3880;
float3 l9_3894=float3(0.0);
float3 l9_3895=l9_3893;
float l9_3896=dot(l9_3895,l9_3895);
float l9_3897;
if (l9_3896>0.0)
{
l9_3897=1.0/sqrt(l9_3896);
}
else
{
l9_3897=0.0;
}
float l9_3898=l9_3897;
float3 l9_3899=l9_3895*l9_3898;
l9_3894=l9_3899;
l9_3251=l9_3894;
l9_3254=l9_3251;
}
else
{
float3 l9_3900=float3(0.0);
l9_3900=l9_3253.VertexNormal_WorldSpace;
float3 l9_3901=float3(0.0);
float3 l9_3902=l9_3900;
float l9_3903=dot(l9_3902,l9_3902);
float l9_3904;
if (l9_3903>0.0)
{
l9_3904=1.0/sqrt(l9_3903);
}
else
{
l9_3904=0.0;
}
float l9_3905=l9_3904;
float3 l9_3906=l9_3902*l9_3905;
l9_3901=l9_3906;
l9_3252=l9_3901;
l9_3254=l9_3252;
}
l9_3250=l9_3254;
float3 l9_3907=float3(0.0);
l9_3907=l9_3250;
float3 l9_3908=float3(0.0);
l9_3908=l9_3907;
float3 l9_3909=float3(0.0);
l9_3909=reflect(l9_3249,l9_3908);
float3 l9_3910=float3(0.0);
l9_3910=l9_3909*(*sc_set0.UserUniforms).Port_Input1_N257;
float3 l9_3911=float3(0.0);
l9_3911=l9_3910;
float2 l9_3912=float2(0.0);
l9_3912=float2(l9_3911.x,l9_3911.y);
float l9_3913=0.0;
float l9_3914=0.0;
float l9_3915=0.0;
float3 l9_3916=l9_3911;
float l9_3917=l9_3916.x;
float l9_3918=l9_3916.y;
float l9_3919=l9_3916.z;
l9_3913=l9_3917;
l9_3914=l9_3918;
l9_3915=l9_3919;
float l9_3920=0.0;
l9_3920=l9_3913*l9_3913;
float l9_3921=0.0;
l9_3921=l9_3914*l9_3914;
float l9_3922=0.0;
l9_3922=l9_3915+(*sc_set0.UserUniforms).Port_Input1_N264;
float l9_3923=0.0;
l9_3923=l9_3922*l9_3922;
float l9_3924=0.0;
l9_3924=(l9_3920+l9_3921)+l9_3923;
float l9_3925=0.0;
float l9_3926;
if (l9_3924<=0.0)
{
l9_3926=0.0;
}
else
{
l9_3926=sqrt(l9_3924);
}
l9_3925=l9_3926;
float l9_3927=0.0;
l9_3927=l9_3925*(*sc_set0.UserUniforms).Port_Input1_N268;
float2 l9_3928=float2(0.0);
l9_3928=l9_3912/float2(l9_3927);
float2 l9_3929=float2(0.0);
l9_3929=l9_3928+float2((*sc_set0.UserUniforms).Port_Input1_N270);
float2 l9_3930=float2(0.0);
l9_3930=float2(1.0)-l9_3929;
float2 l9_3931=float2(0.0);
l9_3931=l9_3930;
float4 l9_3932=float4(0.0);
int l9_3933=0;
if ((int(reflectionTexHasSwappedViews_tmp)!=0))
{
int l9_3934=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3934=0;
}
else
{
l9_3934=in.varStereoViewID;
}
int l9_3935=l9_3934;
l9_3933=1-l9_3935;
}
else
{
int l9_3936=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3936=0;
}
else
{
l9_3936=in.varStereoViewID;
}
int l9_3937=l9_3936;
l9_3933=l9_3937;
}
int l9_3938=l9_3933;
int l9_3939=reflectionTexLayout_tmp;
int l9_3940=l9_3938;
float2 l9_3941=l9_3931;
bool l9_3942=(int(SC_USE_UV_TRANSFORM_reflectionTex_tmp)!=0);
float3x3 l9_3943=(*sc_set0.UserUniforms).reflectionTexTransform;
int2 l9_3944=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp);
bool l9_3945=(int(SC_USE_UV_MIN_MAX_reflectionTex_tmp)!=0);
float4 l9_3946=(*sc_set0.UserUniforms).reflectionTexUvMinMax;
bool l9_3947=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp)!=0);
float4 l9_3948=(*sc_set0.UserUniforms).reflectionTexBorderColor;
float l9_3949=0.0;
bool l9_3950=l9_3947&&(!l9_3945);
float l9_3951=1.0;
float l9_3952=l9_3941.x;
int l9_3953=l9_3944.x;
if (l9_3953==1)
{
l9_3952=fract(l9_3952);
}
else
{
if (l9_3953==2)
{
float l9_3954=fract(l9_3952);
float l9_3955=l9_3952-l9_3954;
float l9_3956=step(0.25,fract(l9_3955*0.5));
l9_3952=mix(l9_3954,1.0-l9_3954,fast::clamp(l9_3956,0.0,1.0));
}
}
l9_3941.x=l9_3952;
float l9_3957=l9_3941.y;
int l9_3958=l9_3944.y;
if (l9_3958==1)
{
l9_3957=fract(l9_3957);
}
else
{
if (l9_3958==2)
{
float l9_3959=fract(l9_3957);
float l9_3960=l9_3957-l9_3959;
float l9_3961=step(0.25,fract(l9_3960*0.5));
l9_3957=mix(l9_3959,1.0-l9_3959,fast::clamp(l9_3961,0.0,1.0));
}
}
l9_3941.y=l9_3957;
if (l9_3945)
{
bool l9_3962=l9_3947;
bool l9_3963;
if (l9_3962)
{
l9_3963=l9_3944.x==3;
}
else
{
l9_3963=l9_3962;
}
float l9_3964=l9_3941.x;
float l9_3965=l9_3946.x;
float l9_3966=l9_3946.z;
bool l9_3967=l9_3963;
float l9_3968=l9_3951;
float l9_3969=fast::clamp(l9_3964,l9_3965,l9_3966);
float l9_3970=step(abs(l9_3964-l9_3969),9.9999997e-06);
l9_3968*=(l9_3970+((1.0-float(l9_3967))*(1.0-l9_3970)));
l9_3964=l9_3969;
l9_3941.x=l9_3964;
l9_3951=l9_3968;
bool l9_3971=l9_3947;
bool l9_3972;
if (l9_3971)
{
l9_3972=l9_3944.y==3;
}
else
{
l9_3972=l9_3971;
}
float l9_3973=l9_3941.y;
float l9_3974=l9_3946.y;
float l9_3975=l9_3946.w;
bool l9_3976=l9_3972;
float l9_3977=l9_3951;
float l9_3978=fast::clamp(l9_3973,l9_3974,l9_3975);
float l9_3979=step(abs(l9_3973-l9_3978),9.9999997e-06);
l9_3977*=(l9_3979+((1.0-float(l9_3976))*(1.0-l9_3979)));
l9_3973=l9_3978;
l9_3941.y=l9_3973;
l9_3951=l9_3977;
}
float2 l9_3980=l9_3941;
bool l9_3981=l9_3942;
float3x3 l9_3982=l9_3943;
if (l9_3981)
{
l9_3980=float2((l9_3982*float3(l9_3980,1.0)).xy);
}
float2 l9_3983=l9_3980;
float2 l9_3984=l9_3983;
float2 l9_3985=l9_3984;
l9_3941=l9_3985;
float l9_3986=l9_3941.x;
int l9_3987=l9_3944.x;
bool l9_3988=l9_3950;
float l9_3989=l9_3951;
if ((l9_3987==0)||(l9_3987==3))
{
float l9_3990=l9_3986;
float l9_3991=0.0;
float l9_3992=1.0;
bool l9_3993=l9_3988;
float l9_3994=l9_3989;
float l9_3995=fast::clamp(l9_3990,l9_3991,l9_3992);
float l9_3996=step(abs(l9_3990-l9_3995),9.9999997e-06);
l9_3994*=(l9_3996+((1.0-float(l9_3993))*(1.0-l9_3996)));
l9_3990=l9_3995;
l9_3986=l9_3990;
l9_3989=l9_3994;
}
l9_3941.x=l9_3986;
l9_3951=l9_3989;
float l9_3997=l9_3941.y;
int l9_3998=l9_3944.y;
bool l9_3999=l9_3950;
float l9_4000=l9_3951;
if ((l9_3998==0)||(l9_3998==3))
{
float l9_4001=l9_3997;
float l9_4002=0.0;
float l9_4003=1.0;
bool l9_4004=l9_3999;
float l9_4005=l9_4000;
float l9_4006=fast::clamp(l9_4001,l9_4002,l9_4003);
float l9_4007=step(abs(l9_4001-l9_4006),9.9999997e-06);
l9_4005*=(l9_4007+((1.0-float(l9_4004))*(1.0-l9_4007)));
l9_4001=l9_4006;
l9_3997=l9_4001;
l9_4000=l9_4005;
}
l9_3941.y=l9_3997;
l9_3951=l9_4000;
float2 l9_4008=l9_3941;
int l9_4009=l9_3939;
int l9_4010=l9_3940;
float l9_4011=l9_3949;
float2 l9_4012=l9_4008;
int l9_4013=l9_4009;
int l9_4014=l9_4010;
float3 l9_4015=float3(0.0);
if (l9_4013==0)
{
l9_4015=float3(l9_4012,0.0);
}
else
{
if (l9_4013==1)
{
l9_4015=float3(l9_4012.x,(l9_4012.y*0.5)+(0.5-(float(l9_4014)*0.5)),0.0);
}
else
{
l9_4015=float3(l9_4012,float(l9_4014));
}
}
float3 l9_4016=l9_4015;
float3 l9_4017=l9_4016;
float2 l9_4018=l9_4017.xy;
float l9_4019=l9_4011;
float4 l9_4020=sc_set0.reflectionTex.sample(sc_set0.reflectionTexSmpSC,l9_4018,bias(l9_4019));
float4 l9_4021=l9_4020;
float4 l9_4022=l9_4021;
if (l9_3947)
{
l9_4022=mix(l9_3948,l9_4022,float4(l9_3951));
}
float4 l9_4023=l9_4022;
l9_3932=l9_4023;
float3 l9_4024=float3(0.0);
float3 l9_4025=float3(0.0);
float3 l9_4026=(*sc_set0.UserUniforms).Port_Default_N041;
ssGlobals l9_4027=param_28;
float3 l9_4028;
if ((int(Tweak_N177_tmp)!=0))
{
float2 l9_4029=float2(0.0);
float2 l9_4030=float2(0.0);
float2 l9_4031=float2(0.0);
float2 l9_4032=float2(0.0);
float2 l9_4033=float2(0.0);
float2 l9_4034=float2(0.0);
ssGlobals l9_4035=l9_4027;
float2 l9_4036;
if (NODE_228_DROPLIST_ITEM_tmp==0)
{
float2 l9_4037=float2(0.0);
l9_4037=l9_4035.Surface_UVCoord0;
l9_4030=l9_4037;
l9_4036=l9_4030;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==1)
{
float2 l9_4038=float2(0.0);
l9_4038=l9_4035.Surface_UVCoord1;
l9_4031=l9_4038;
l9_4036=l9_4031;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==2)
{
float2 l9_4039=float2(0.0);
float2 l9_4040=float2(0.0);
float2 l9_4041=float2(0.0);
ssGlobals l9_4042=l9_4035;
float2 l9_4043;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4044=float2(0.0);
float2 l9_4045=float2(0.0);
float2 l9_4046=float2(0.0);
ssGlobals l9_4047=l9_4042;
float2 l9_4048;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4049=float2(0.0);
float2 l9_4050=float2(0.0);
float2 l9_4051=float2(0.0);
float2 l9_4052=float2(0.0);
float2 l9_4053=float2(0.0);
ssGlobals l9_4054=l9_4047;
float2 l9_4055;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4056=float2(0.0);
l9_4056=l9_4054.Surface_UVCoord0;
l9_4050=l9_4056;
l9_4055=l9_4050;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4057=float2(0.0);
l9_4057=l9_4054.Surface_UVCoord1;
l9_4051=l9_4057;
l9_4055=l9_4051;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4058=float2(0.0);
l9_4058=l9_4054.gScreenCoord;
l9_4052=l9_4058;
l9_4055=l9_4052;
}
else
{
float2 l9_4059=float2(0.0);
l9_4059=l9_4054.Surface_UVCoord0;
l9_4053=l9_4059;
l9_4055=l9_4053;
}
}
}
l9_4049=l9_4055;
float2 l9_4060=float2(0.0);
float2 l9_4061=(*sc_set0.UserUniforms).uv2Scale;
l9_4060=l9_4061;
float2 l9_4062=float2(0.0);
l9_4062=l9_4060;
float2 l9_4063=float2(0.0);
float2 l9_4064=(*sc_set0.UserUniforms).uv2Offset;
l9_4063=l9_4064;
float2 l9_4065=float2(0.0);
l9_4065=l9_4063;
float2 l9_4066=float2(0.0);
l9_4066=(l9_4049*l9_4062)+l9_4065;
float2 l9_4067=float2(0.0);
l9_4067=l9_4066+(l9_4065*(l9_4047.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4045=l9_4067;
l9_4048=l9_4045;
}
else
{
float2 l9_4068=float2(0.0);
float2 l9_4069=float2(0.0);
float2 l9_4070=float2(0.0);
float2 l9_4071=float2(0.0);
float2 l9_4072=float2(0.0);
ssGlobals l9_4073=l9_4047;
float2 l9_4074;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4075=float2(0.0);
l9_4075=l9_4073.Surface_UVCoord0;
l9_4069=l9_4075;
l9_4074=l9_4069;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4076=float2(0.0);
l9_4076=l9_4073.Surface_UVCoord1;
l9_4070=l9_4076;
l9_4074=l9_4070;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4077=float2(0.0);
l9_4077=l9_4073.gScreenCoord;
l9_4071=l9_4077;
l9_4074=l9_4071;
}
else
{
float2 l9_4078=float2(0.0);
l9_4078=l9_4073.Surface_UVCoord0;
l9_4072=l9_4078;
l9_4074=l9_4072;
}
}
}
l9_4068=l9_4074;
float2 l9_4079=float2(0.0);
float2 l9_4080=(*sc_set0.UserUniforms).uv2Scale;
l9_4079=l9_4080;
float2 l9_4081=float2(0.0);
l9_4081=l9_4079;
float2 l9_4082=float2(0.0);
float2 l9_4083=(*sc_set0.UserUniforms).uv2Offset;
l9_4082=l9_4083;
float2 l9_4084=float2(0.0);
l9_4084=l9_4082;
float2 l9_4085=float2(0.0);
l9_4085=(l9_4068*l9_4081)+l9_4084;
l9_4046=l9_4085;
l9_4048=l9_4046;
}
l9_4044=l9_4048;
l9_4040=l9_4044;
l9_4043=l9_4040;
}
else
{
float2 l9_4086=float2(0.0);
l9_4086=l9_4042.Surface_UVCoord0;
l9_4041=l9_4086;
l9_4043=l9_4041;
}
l9_4039=l9_4043;
float2 l9_4087=float2(0.0);
l9_4087=l9_4039;
float2 l9_4088=float2(0.0);
l9_4088=l9_4087;
l9_4032=l9_4088;
l9_4036=l9_4032;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==3)
{
float2 l9_4089=float2(0.0);
float2 l9_4090=float2(0.0);
float2 l9_4091=float2(0.0);
ssGlobals l9_4092=l9_4035;
float2 l9_4093;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_4094=float2(0.0);
float2 l9_4095=float2(0.0);
float2 l9_4096=float2(0.0);
ssGlobals l9_4097=l9_4092;
float2 l9_4098;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_4099=float2(0.0);
float2 l9_4100=float2(0.0);
float2 l9_4101=float2(0.0);
float2 l9_4102=float2(0.0);
float2 l9_4103=float2(0.0);
float2 l9_4104=float2(0.0);
ssGlobals l9_4105=l9_4097;
float2 l9_4106;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4107=float2(0.0);
l9_4107=l9_4105.Surface_UVCoord0;
l9_4100=l9_4107;
l9_4106=l9_4100;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4108=float2(0.0);
l9_4108=l9_4105.Surface_UVCoord1;
l9_4101=l9_4108;
l9_4106=l9_4101;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4109=float2(0.0);
l9_4109=l9_4105.gScreenCoord;
l9_4102=l9_4109;
l9_4106=l9_4102;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4110=float2(0.0);
float2 l9_4111=float2(0.0);
float2 l9_4112=float2(0.0);
ssGlobals l9_4113=l9_4105;
float2 l9_4114;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4115=float2(0.0);
float2 l9_4116=float2(0.0);
float2 l9_4117=float2(0.0);
ssGlobals l9_4118=l9_4113;
float2 l9_4119;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4120=float2(0.0);
float2 l9_4121=float2(0.0);
float2 l9_4122=float2(0.0);
float2 l9_4123=float2(0.0);
float2 l9_4124=float2(0.0);
ssGlobals l9_4125=l9_4118;
float2 l9_4126;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4127=float2(0.0);
l9_4127=l9_4125.Surface_UVCoord0;
l9_4121=l9_4127;
l9_4126=l9_4121;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4128=float2(0.0);
l9_4128=l9_4125.Surface_UVCoord1;
l9_4122=l9_4128;
l9_4126=l9_4122;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4129=float2(0.0);
l9_4129=l9_4125.gScreenCoord;
l9_4123=l9_4129;
l9_4126=l9_4123;
}
else
{
float2 l9_4130=float2(0.0);
l9_4130=l9_4125.Surface_UVCoord0;
l9_4124=l9_4130;
l9_4126=l9_4124;
}
}
}
l9_4120=l9_4126;
float2 l9_4131=float2(0.0);
float2 l9_4132=(*sc_set0.UserUniforms).uv2Scale;
l9_4131=l9_4132;
float2 l9_4133=float2(0.0);
l9_4133=l9_4131;
float2 l9_4134=float2(0.0);
float2 l9_4135=(*sc_set0.UserUniforms).uv2Offset;
l9_4134=l9_4135;
float2 l9_4136=float2(0.0);
l9_4136=l9_4134;
float2 l9_4137=float2(0.0);
l9_4137=(l9_4120*l9_4133)+l9_4136;
float2 l9_4138=float2(0.0);
l9_4138=l9_4137+(l9_4136*(l9_4118.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4116=l9_4138;
l9_4119=l9_4116;
}
else
{
float2 l9_4139=float2(0.0);
float2 l9_4140=float2(0.0);
float2 l9_4141=float2(0.0);
float2 l9_4142=float2(0.0);
float2 l9_4143=float2(0.0);
ssGlobals l9_4144=l9_4118;
float2 l9_4145;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4146=float2(0.0);
l9_4146=l9_4144.Surface_UVCoord0;
l9_4140=l9_4146;
l9_4145=l9_4140;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4147=float2(0.0);
l9_4147=l9_4144.Surface_UVCoord1;
l9_4141=l9_4147;
l9_4145=l9_4141;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4148=float2(0.0);
l9_4148=l9_4144.gScreenCoord;
l9_4142=l9_4148;
l9_4145=l9_4142;
}
else
{
float2 l9_4149=float2(0.0);
l9_4149=l9_4144.Surface_UVCoord0;
l9_4143=l9_4149;
l9_4145=l9_4143;
}
}
}
l9_4139=l9_4145;
float2 l9_4150=float2(0.0);
float2 l9_4151=(*sc_set0.UserUniforms).uv2Scale;
l9_4150=l9_4151;
float2 l9_4152=float2(0.0);
l9_4152=l9_4150;
float2 l9_4153=float2(0.0);
float2 l9_4154=(*sc_set0.UserUniforms).uv2Offset;
l9_4153=l9_4154;
float2 l9_4155=float2(0.0);
l9_4155=l9_4153;
float2 l9_4156=float2(0.0);
l9_4156=(l9_4139*l9_4152)+l9_4155;
l9_4117=l9_4156;
l9_4119=l9_4117;
}
l9_4115=l9_4119;
l9_4111=l9_4115;
l9_4114=l9_4111;
}
else
{
float2 l9_4157=float2(0.0);
l9_4157=l9_4113.Surface_UVCoord0;
l9_4112=l9_4157;
l9_4114=l9_4112;
}
l9_4110=l9_4114;
float2 l9_4158=float2(0.0);
l9_4158=l9_4110;
float2 l9_4159=float2(0.0);
l9_4159=l9_4158;
l9_4103=l9_4159;
l9_4106=l9_4103;
}
else
{
float2 l9_4160=float2(0.0);
l9_4160=l9_4105.Surface_UVCoord0;
l9_4104=l9_4160;
l9_4106=l9_4104;
}
}
}
}
l9_4099=l9_4106;
float2 l9_4161=float2(0.0);
float2 l9_4162=(*sc_set0.UserUniforms).uv3Scale;
l9_4161=l9_4162;
float2 l9_4163=float2(0.0);
l9_4163=l9_4161;
float2 l9_4164=float2(0.0);
float2 l9_4165=(*sc_set0.UserUniforms).uv3Offset;
l9_4164=l9_4165;
float2 l9_4166=float2(0.0);
l9_4166=l9_4164;
float2 l9_4167=float2(0.0);
l9_4167=(l9_4099*l9_4163)+l9_4166;
float2 l9_4168=float2(0.0);
l9_4168=l9_4167+(l9_4166*(l9_4097.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4095=l9_4168;
l9_4098=l9_4095;
}
else
{
float2 l9_4169=float2(0.0);
float2 l9_4170=float2(0.0);
float2 l9_4171=float2(0.0);
float2 l9_4172=float2(0.0);
float2 l9_4173=float2(0.0);
float2 l9_4174=float2(0.0);
ssGlobals l9_4175=l9_4097;
float2 l9_4176;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4177=float2(0.0);
l9_4177=l9_4175.Surface_UVCoord0;
l9_4170=l9_4177;
l9_4176=l9_4170;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4178=float2(0.0);
l9_4178=l9_4175.Surface_UVCoord1;
l9_4171=l9_4178;
l9_4176=l9_4171;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4179=float2(0.0);
l9_4179=l9_4175.gScreenCoord;
l9_4172=l9_4179;
l9_4176=l9_4172;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4180=float2(0.0);
float2 l9_4181=float2(0.0);
float2 l9_4182=float2(0.0);
ssGlobals l9_4183=l9_4175;
float2 l9_4184;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4185=float2(0.0);
float2 l9_4186=float2(0.0);
float2 l9_4187=float2(0.0);
ssGlobals l9_4188=l9_4183;
float2 l9_4189;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4190=float2(0.0);
float2 l9_4191=float2(0.0);
float2 l9_4192=float2(0.0);
float2 l9_4193=float2(0.0);
float2 l9_4194=float2(0.0);
ssGlobals l9_4195=l9_4188;
float2 l9_4196;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4197=float2(0.0);
l9_4197=l9_4195.Surface_UVCoord0;
l9_4191=l9_4197;
l9_4196=l9_4191;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4198=float2(0.0);
l9_4198=l9_4195.Surface_UVCoord1;
l9_4192=l9_4198;
l9_4196=l9_4192;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4199=float2(0.0);
l9_4199=l9_4195.gScreenCoord;
l9_4193=l9_4199;
l9_4196=l9_4193;
}
else
{
float2 l9_4200=float2(0.0);
l9_4200=l9_4195.Surface_UVCoord0;
l9_4194=l9_4200;
l9_4196=l9_4194;
}
}
}
l9_4190=l9_4196;
float2 l9_4201=float2(0.0);
float2 l9_4202=(*sc_set0.UserUniforms).uv2Scale;
l9_4201=l9_4202;
float2 l9_4203=float2(0.0);
l9_4203=l9_4201;
float2 l9_4204=float2(0.0);
float2 l9_4205=(*sc_set0.UserUniforms).uv2Offset;
l9_4204=l9_4205;
float2 l9_4206=float2(0.0);
l9_4206=l9_4204;
float2 l9_4207=float2(0.0);
l9_4207=(l9_4190*l9_4203)+l9_4206;
float2 l9_4208=float2(0.0);
l9_4208=l9_4207+(l9_4206*(l9_4188.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4186=l9_4208;
l9_4189=l9_4186;
}
else
{
float2 l9_4209=float2(0.0);
float2 l9_4210=float2(0.0);
float2 l9_4211=float2(0.0);
float2 l9_4212=float2(0.0);
float2 l9_4213=float2(0.0);
ssGlobals l9_4214=l9_4188;
float2 l9_4215;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4216=float2(0.0);
l9_4216=l9_4214.Surface_UVCoord0;
l9_4210=l9_4216;
l9_4215=l9_4210;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4217=float2(0.0);
l9_4217=l9_4214.Surface_UVCoord1;
l9_4211=l9_4217;
l9_4215=l9_4211;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4218=float2(0.0);
l9_4218=l9_4214.gScreenCoord;
l9_4212=l9_4218;
l9_4215=l9_4212;
}
else
{
float2 l9_4219=float2(0.0);
l9_4219=l9_4214.Surface_UVCoord0;
l9_4213=l9_4219;
l9_4215=l9_4213;
}
}
}
l9_4209=l9_4215;
float2 l9_4220=float2(0.0);
float2 l9_4221=(*sc_set0.UserUniforms).uv2Scale;
l9_4220=l9_4221;
float2 l9_4222=float2(0.0);
l9_4222=l9_4220;
float2 l9_4223=float2(0.0);
float2 l9_4224=(*sc_set0.UserUniforms).uv2Offset;
l9_4223=l9_4224;
float2 l9_4225=float2(0.0);
l9_4225=l9_4223;
float2 l9_4226=float2(0.0);
l9_4226=(l9_4209*l9_4222)+l9_4225;
l9_4187=l9_4226;
l9_4189=l9_4187;
}
l9_4185=l9_4189;
l9_4181=l9_4185;
l9_4184=l9_4181;
}
else
{
float2 l9_4227=float2(0.0);
l9_4227=l9_4183.Surface_UVCoord0;
l9_4182=l9_4227;
l9_4184=l9_4182;
}
l9_4180=l9_4184;
float2 l9_4228=float2(0.0);
l9_4228=l9_4180;
float2 l9_4229=float2(0.0);
l9_4229=l9_4228;
l9_4173=l9_4229;
l9_4176=l9_4173;
}
else
{
float2 l9_4230=float2(0.0);
l9_4230=l9_4175.Surface_UVCoord0;
l9_4174=l9_4230;
l9_4176=l9_4174;
}
}
}
}
l9_4169=l9_4176;
float2 l9_4231=float2(0.0);
float2 l9_4232=(*sc_set0.UserUniforms).uv3Scale;
l9_4231=l9_4232;
float2 l9_4233=float2(0.0);
l9_4233=l9_4231;
float2 l9_4234=float2(0.0);
float2 l9_4235=(*sc_set0.UserUniforms).uv3Offset;
l9_4234=l9_4235;
float2 l9_4236=float2(0.0);
l9_4236=l9_4234;
float2 l9_4237=float2(0.0);
l9_4237=(l9_4169*l9_4233)+l9_4236;
l9_4096=l9_4237;
l9_4098=l9_4096;
}
l9_4094=l9_4098;
l9_4090=l9_4094;
l9_4093=l9_4090;
}
else
{
float2 l9_4238=float2(0.0);
l9_4238=l9_4092.Surface_UVCoord0;
l9_4091=l9_4238;
l9_4093=l9_4091;
}
l9_4089=l9_4093;
float2 l9_4239=float2(0.0);
l9_4239=l9_4089;
float2 l9_4240=float2(0.0);
l9_4240=l9_4239;
l9_4033=l9_4240;
l9_4036=l9_4033;
}
else
{
float2 l9_4241=float2(0.0);
l9_4241=l9_4035.Surface_UVCoord0;
l9_4034=l9_4241;
l9_4036=l9_4034;
}
}
}
}
l9_4029=l9_4036;
float4 l9_4242=float4(0.0);
int l9_4243=0;
if ((int(reflectionModulationTexHasSwappedViews_tmp)!=0))
{
int l9_4244=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4244=0;
}
else
{
l9_4244=in.varStereoViewID;
}
int l9_4245=l9_4244;
l9_4243=1-l9_4245;
}
else
{
int l9_4246=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4246=0;
}
else
{
l9_4246=in.varStereoViewID;
}
int l9_4247=l9_4246;
l9_4243=l9_4247;
}
int l9_4248=l9_4243;
int l9_4249=reflectionModulationTexLayout_tmp;
int l9_4250=l9_4248;
float2 l9_4251=l9_4029;
bool l9_4252=(int(SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp)!=0);
float3x3 l9_4253=(*sc_set0.UserUniforms).reflectionModulationTexTransform;
int2 l9_4254=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp);
bool l9_4255=(int(SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp)!=0);
float4 l9_4256=(*sc_set0.UserUniforms).reflectionModulationTexUvMinMax;
bool l9_4257=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp)!=0);
float4 l9_4258=(*sc_set0.UserUniforms).reflectionModulationTexBorderColor;
float l9_4259=0.0;
bool l9_4260=l9_4257&&(!l9_4255);
float l9_4261=1.0;
float l9_4262=l9_4251.x;
int l9_4263=l9_4254.x;
if (l9_4263==1)
{
l9_4262=fract(l9_4262);
}
else
{
if (l9_4263==2)
{
float l9_4264=fract(l9_4262);
float l9_4265=l9_4262-l9_4264;
float l9_4266=step(0.25,fract(l9_4265*0.5));
l9_4262=mix(l9_4264,1.0-l9_4264,fast::clamp(l9_4266,0.0,1.0));
}
}
l9_4251.x=l9_4262;
float l9_4267=l9_4251.y;
int l9_4268=l9_4254.y;
if (l9_4268==1)
{
l9_4267=fract(l9_4267);
}
else
{
if (l9_4268==2)
{
float l9_4269=fract(l9_4267);
float l9_4270=l9_4267-l9_4269;
float l9_4271=step(0.25,fract(l9_4270*0.5));
l9_4267=mix(l9_4269,1.0-l9_4269,fast::clamp(l9_4271,0.0,1.0));
}
}
l9_4251.y=l9_4267;
if (l9_4255)
{
bool l9_4272=l9_4257;
bool l9_4273;
if (l9_4272)
{
l9_4273=l9_4254.x==3;
}
else
{
l9_4273=l9_4272;
}
float l9_4274=l9_4251.x;
float l9_4275=l9_4256.x;
float l9_4276=l9_4256.z;
bool l9_4277=l9_4273;
float l9_4278=l9_4261;
float l9_4279=fast::clamp(l9_4274,l9_4275,l9_4276);
float l9_4280=step(abs(l9_4274-l9_4279),9.9999997e-06);
l9_4278*=(l9_4280+((1.0-float(l9_4277))*(1.0-l9_4280)));
l9_4274=l9_4279;
l9_4251.x=l9_4274;
l9_4261=l9_4278;
bool l9_4281=l9_4257;
bool l9_4282;
if (l9_4281)
{
l9_4282=l9_4254.y==3;
}
else
{
l9_4282=l9_4281;
}
float l9_4283=l9_4251.y;
float l9_4284=l9_4256.y;
float l9_4285=l9_4256.w;
bool l9_4286=l9_4282;
float l9_4287=l9_4261;
float l9_4288=fast::clamp(l9_4283,l9_4284,l9_4285);
float l9_4289=step(abs(l9_4283-l9_4288),9.9999997e-06);
l9_4287*=(l9_4289+((1.0-float(l9_4286))*(1.0-l9_4289)));
l9_4283=l9_4288;
l9_4251.y=l9_4283;
l9_4261=l9_4287;
}
float2 l9_4290=l9_4251;
bool l9_4291=l9_4252;
float3x3 l9_4292=l9_4253;
if (l9_4291)
{
l9_4290=float2((l9_4292*float3(l9_4290,1.0)).xy);
}
float2 l9_4293=l9_4290;
float2 l9_4294=l9_4293;
float2 l9_4295=l9_4294;
l9_4251=l9_4295;
float l9_4296=l9_4251.x;
int l9_4297=l9_4254.x;
bool l9_4298=l9_4260;
float l9_4299=l9_4261;
if ((l9_4297==0)||(l9_4297==3))
{
float l9_4300=l9_4296;
float l9_4301=0.0;
float l9_4302=1.0;
bool l9_4303=l9_4298;
float l9_4304=l9_4299;
float l9_4305=fast::clamp(l9_4300,l9_4301,l9_4302);
float l9_4306=step(abs(l9_4300-l9_4305),9.9999997e-06);
l9_4304*=(l9_4306+((1.0-float(l9_4303))*(1.0-l9_4306)));
l9_4300=l9_4305;
l9_4296=l9_4300;
l9_4299=l9_4304;
}
l9_4251.x=l9_4296;
l9_4261=l9_4299;
float l9_4307=l9_4251.y;
int l9_4308=l9_4254.y;
bool l9_4309=l9_4260;
float l9_4310=l9_4261;
if ((l9_4308==0)||(l9_4308==3))
{
float l9_4311=l9_4307;
float l9_4312=0.0;
float l9_4313=1.0;
bool l9_4314=l9_4309;
float l9_4315=l9_4310;
float l9_4316=fast::clamp(l9_4311,l9_4312,l9_4313);
float l9_4317=step(abs(l9_4311-l9_4316),9.9999997e-06);
l9_4315*=(l9_4317+((1.0-float(l9_4314))*(1.0-l9_4317)));
l9_4311=l9_4316;
l9_4307=l9_4311;
l9_4310=l9_4315;
}
l9_4251.y=l9_4307;
l9_4261=l9_4310;
float2 l9_4318=l9_4251;
int l9_4319=l9_4249;
int l9_4320=l9_4250;
float l9_4321=l9_4259;
float2 l9_4322=l9_4318;
int l9_4323=l9_4319;
int l9_4324=l9_4320;
float3 l9_4325=float3(0.0);
if (l9_4323==0)
{
l9_4325=float3(l9_4322,0.0);
}
else
{
if (l9_4323==1)
{
l9_4325=float3(l9_4322.x,(l9_4322.y*0.5)+(0.5-(float(l9_4324)*0.5)),0.0);
}
else
{
l9_4325=float3(l9_4322,float(l9_4324));
}
}
float3 l9_4326=l9_4325;
float3 l9_4327=l9_4326;
float2 l9_4328=l9_4327.xy;
float l9_4329=l9_4321;
float4 l9_4330=sc_set0.reflectionModulationTex.sample(sc_set0.reflectionModulationTexSmpSC,l9_4328,bias(l9_4329));
float4 l9_4331=l9_4330;
float4 l9_4332=l9_4331;
if (l9_4257)
{
l9_4332=mix(l9_4258,l9_4332,float4(l9_4261));
}
float4 l9_4333=l9_4332;
l9_4242=l9_4333;
l9_4025=l9_4242.xyz;
l9_4028=l9_4025;
}
else
{
l9_4028=l9_4026;
}
l9_4024=l9_4028;
float3 l9_4334=float3(0.0);
l9_4334=l9_3932.xyz*l9_4024;
float3 l9_4335=float3(0.0);
float3 l9_4336=l9_4334;
float3 l9_4337;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4337=float3(pow(l9_4336.x,2.2),pow(l9_4336.y,2.2),pow(l9_4336.z,2.2));
}
else
{
l9_4337=l9_4336*l9_4336;
}
float3 l9_4338=l9_4337;
l9_4335=l9_4338;
float3 l9_4339=float3(0.0);
l9_4339=float3(l9_3248)*l9_4335;
param_25=l9_4339;
param_27=param_25;
}
else
{
param_27=param_26;
}
Result_N134=param_27;
float3 Export_N303=float3(0.0);
Export_N303=Result_N134;
float3 Value_N298=float3(0.0);
Value_N298=Export_N303;
float3 Result_N173=float3(0.0);
float3 param_29=float3(0.0);
float3 param_30=(*sc_set0.UserUniforms).Port_Default_N173;
ssGlobals param_32=Globals;
float3 param_31;
if ((int(Tweak_N74_tmp)!=0))
{
float3 l9_4340=float3(0.0);
float3 l9_4341=(*sc_set0.UserUniforms).rimColor;
l9_4340=l9_4341;
float3 l9_4342=float3(0.0);
l9_4342=l9_4340;
float l9_4343=0.0;
float l9_4344=(*sc_set0.UserUniforms).rimIntensity;
l9_4343=l9_4344;
float l9_4345=0.0;
l9_4345=l9_4343;
float3 l9_4346=float3(0.0);
float3 l9_4347=float3(0.0);
float3 l9_4348=(*sc_set0.UserUniforms).Port_Default_N170;
ssGlobals l9_4349=param_32;
float3 l9_4350;
if ((int(Tweak_N216_tmp)!=0))
{
float2 l9_4351=float2(0.0);
float2 l9_4352=float2(0.0);
float2 l9_4353=float2(0.0);
float2 l9_4354=float2(0.0);
float2 l9_4355=float2(0.0);
float2 l9_4356=float2(0.0);
ssGlobals l9_4357=l9_4349;
float2 l9_4358;
if (NODE_315_DROPLIST_ITEM_tmp==0)
{
float2 l9_4359=float2(0.0);
l9_4359=l9_4357.Surface_UVCoord0;
l9_4352=l9_4359;
l9_4358=l9_4352;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==1)
{
float2 l9_4360=float2(0.0);
l9_4360=l9_4357.Surface_UVCoord1;
l9_4353=l9_4360;
l9_4358=l9_4353;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==2)
{
float2 l9_4361=float2(0.0);
float2 l9_4362=float2(0.0);
float2 l9_4363=float2(0.0);
ssGlobals l9_4364=l9_4357;
float2 l9_4365;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4366=float2(0.0);
float2 l9_4367=float2(0.0);
float2 l9_4368=float2(0.0);
ssGlobals l9_4369=l9_4364;
float2 l9_4370;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4371=float2(0.0);
float2 l9_4372=float2(0.0);
float2 l9_4373=float2(0.0);
float2 l9_4374=float2(0.0);
float2 l9_4375=float2(0.0);
ssGlobals l9_4376=l9_4369;
float2 l9_4377;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4378=float2(0.0);
l9_4378=l9_4376.Surface_UVCoord0;
l9_4372=l9_4378;
l9_4377=l9_4372;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4379=float2(0.0);
l9_4379=l9_4376.Surface_UVCoord1;
l9_4373=l9_4379;
l9_4377=l9_4373;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4380=float2(0.0);
l9_4380=l9_4376.gScreenCoord;
l9_4374=l9_4380;
l9_4377=l9_4374;
}
else
{
float2 l9_4381=float2(0.0);
l9_4381=l9_4376.Surface_UVCoord0;
l9_4375=l9_4381;
l9_4377=l9_4375;
}
}
}
l9_4371=l9_4377;
float2 l9_4382=float2(0.0);
float2 l9_4383=(*sc_set0.UserUniforms).uv2Scale;
l9_4382=l9_4383;
float2 l9_4384=float2(0.0);
l9_4384=l9_4382;
float2 l9_4385=float2(0.0);
float2 l9_4386=(*sc_set0.UserUniforms).uv2Offset;
l9_4385=l9_4386;
float2 l9_4387=float2(0.0);
l9_4387=l9_4385;
float2 l9_4388=float2(0.0);
l9_4388=(l9_4371*l9_4384)+l9_4387;
float2 l9_4389=float2(0.0);
l9_4389=l9_4388+(l9_4387*(l9_4369.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4367=l9_4389;
l9_4370=l9_4367;
}
else
{
float2 l9_4390=float2(0.0);
float2 l9_4391=float2(0.0);
float2 l9_4392=float2(0.0);
float2 l9_4393=float2(0.0);
float2 l9_4394=float2(0.0);
ssGlobals l9_4395=l9_4369;
float2 l9_4396;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4397=float2(0.0);
l9_4397=l9_4395.Surface_UVCoord0;
l9_4391=l9_4397;
l9_4396=l9_4391;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4398=float2(0.0);
l9_4398=l9_4395.Surface_UVCoord1;
l9_4392=l9_4398;
l9_4396=l9_4392;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4399=float2(0.0);
l9_4399=l9_4395.gScreenCoord;
l9_4393=l9_4399;
l9_4396=l9_4393;
}
else
{
float2 l9_4400=float2(0.0);
l9_4400=l9_4395.Surface_UVCoord0;
l9_4394=l9_4400;
l9_4396=l9_4394;
}
}
}
l9_4390=l9_4396;
float2 l9_4401=float2(0.0);
float2 l9_4402=(*sc_set0.UserUniforms).uv2Scale;
l9_4401=l9_4402;
float2 l9_4403=float2(0.0);
l9_4403=l9_4401;
float2 l9_4404=float2(0.0);
float2 l9_4405=(*sc_set0.UserUniforms).uv2Offset;
l9_4404=l9_4405;
float2 l9_4406=float2(0.0);
l9_4406=l9_4404;
float2 l9_4407=float2(0.0);
l9_4407=(l9_4390*l9_4403)+l9_4406;
l9_4368=l9_4407;
l9_4370=l9_4368;
}
l9_4366=l9_4370;
l9_4362=l9_4366;
l9_4365=l9_4362;
}
else
{
float2 l9_4408=float2(0.0);
l9_4408=l9_4364.Surface_UVCoord0;
l9_4363=l9_4408;
l9_4365=l9_4363;
}
l9_4361=l9_4365;
float2 l9_4409=float2(0.0);
l9_4409=l9_4361;
float2 l9_4410=float2(0.0);
l9_4410=l9_4409;
l9_4354=l9_4410;
l9_4358=l9_4354;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==3)
{
float2 l9_4411=float2(0.0);
float2 l9_4412=float2(0.0);
float2 l9_4413=float2(0.0);
ssGlobals l9_4414=l9_4357;
float2 l9_4415;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_4416=float2(0.0);
float2 l9_4417=float2(0.0);
float2 l9_4418=float2(0.0);
ssGlobals l9_4419=l9_4414;
float2 l9_4420;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_4421=float2(0.0);
float2 l9_4422=float2(0.0);
float2 l9_4423=float2(0.0);
float2 l9_4424=float2(0.0);
float2 l9_4425=float2(0.0);
float2 l9_4426=float2(0.0);
ssGlobals l9_4427=l9_4419;
float2 l9_4428;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4429=float2(0.0);
l9_4429=l9_4427.Surface_UVCoord0;
l9_4422=l9_4429;
l9_4428=l9_4422;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4430=float2(0.0);
l9_4430=l9_4427.Surface_UVCoord1;
l9_4423=l9_4430;
l9_4428=l9_4423;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4431=float2(0.0);
l9_4431=l9_4427.gScreenCoord;
l9_4424=l9_4431;
l9_4428=l9_4424;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4432=float2(0.0);
float2 l9_4433=float2(0.0);
float2 l9_4434=float2(0.0);
ssGlobals l9_4435=l9_4427;
float2 l9_4436;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4437=float2(0.0);
float2 l9_4438=float2(0.0);
float2 l9_4439=float2(0.0);
ssGlobals l9_4440=l9_4435;
float2 l9_4441;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4442=float2(0.0);
float2 l9_4443=float2(0.0);
float2 l9_4444=float2(0.0);
float2 l9_4445=float2(0.0);
float2 l9_4446=float2(0.0);
ssGlobals l9_4447=l9_4440;
float2 l9_4448;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4449=float2(0.0);
l9_4449=l9_4447.Surface_UVCoord0;
l9_4443=l9_4449;
l9_4448=l9_4443;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4450=float2(0.0);
l9_4450=l9_4447.Surface_UVCoord1;
l9_4444=l9_4450;
l9_4448=l9_4444;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4451=float2(0.0);
l9_4451=l9_4447.gScreenCoord;
l9_4445=l9_4451;
l9_4448=l9_4445;
}
else
{
float2 l9_4452=float2(0.0);
l9_4452=l9_4447.Surface_UVCoord0;
l9_4446=l9_4452;
l9_4448=l9_4446;
}
}
}
l9_4442=l9_4448;
float2 l9_4453=float2(0.0);
float2 l9_4454=(*sc_set0.UserUniforms).uv2Scale;
l9_4453=l9_4454;
float2 l9_4455=float2(0.0);
l9_4455=l9_4453;
float2 l9_4456=float2(0.0);
float2 l9_4457=(*sc_set0.UserUniforms).uv2Offset;
l9_4456=l9_4457;
float2 l9_4458=float2(0.0);
l9_4458=l9_4456;
float2 l9_4459=float2(0.0);
l9_4459=(l9_4442*l9_4455)+l9_4458;
float2 l9_4460=float2(0.0);
l9_4460=l9_4459+(l9_4458*(l9_4440.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4438=l9_4460;
l9_4441=l9_4438;
}
else
{
float2 l9_4461=float2(0.0);
float2 l9_4462=float2(0.0);
float2 l9_4463=float2(0.0);
float2 l9_4464=float2(0.0);
float2 l9_4465=float2(0.0);
ssGlobals l9_4466=l9_4440;
float2 l9_4467;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4468=float2(0.0);
l9_4468=l9_4466.Surface_UVCoord0;
l9_4462=l9_4468;
l9_4467=l9_4462;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4469=float2(0.0);
l9_4469=l9_4466.Surface_UVCoord1;
l9_4463=l9_4469;
l9_4467=l9_4463;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4470=float2(0.0);
l9_4470=l9_4466.gScreenCoord;
l9_4464=l9_4470;
l9_4467=l9_4464;
}
else
{
float2 l9_4471=float2(0.0);
l9_4471=l9_4466.Surface_UVCoord0;
l9_4465=l9_4471;
l9_4467=l9_4465;
}
}
}
l9_4461=l9_4467;
float2 l9_4472=float2(0.0);
float2 l9_4473=(*sc_set0.UserUniforms).uv2Scale;
l9_4472=l9_4473;
float2 l9_4474=float2(0.0);
l9_4474=l9_4472;
float2 l9_4475=float2(0.0);
float2 l9_4476=(*sc_set0.UserUniforms).uv2Offset;
l9_4475=l9_4476;
float2 l9_4477=float2(0.0);
l9_4477=l9_4475;
float2 l9_4478=float2(0.0);
l9_4478=(l9_4461*l9_4474)+l9_4477;
l9_4439=l9_4478;
l9_4441=l9_4439;
}
l9_4437=l9_4441;
l9_4433=l9_4437;
l9_4436=l9_4433;
}
else
{
float2 l9_4479=float2(0.0);
l9_4479=l9_4435.Surface_UVCoord0;
l9_4434=l9_4479;
l9_4436=l9_4434;
}
l9_4432=l9_4436;
float2 l9_4480=float2(0.0);
l9_4480=l9_4432;
float2 l9_4481=float2(0.0);
l9_4481=l9_4480;
l9_4425=l9_4481;
l9_4428=l9_4425;
}
else
{
float2 l9_4482=float2(0.0);
l9_4482=l9_4427.Surface_UVCoord0;
l9_4426=l9_4482;
l9_4428=l9_4426;
}
}
}
}
l9_4421=l9_4428;
float2 l9_4483=float2(0.0);
float2 l9_4484=(*sc_set0.UserUniforms).uv3Scale;
l9_4483=l9_4484;
float2 l9_4485=float2(0.0);
l9_4485=l9_4483;
float2 l9_4486=float2(0.0);
float2 l9_4487=(*sc_set0.UserUniforms).uv3Offset;
l9_4486=l9_4487;
float2 l9_4488=float2(0.0);
l9_4488=l9_4486;
float2 l9_4489=float2(0.0);
l9_4489=(l9_4421*l9_4485)+l9_4488;
float2 l9_4490=float2(0.0);
l9_4490=l9_4489+(l9_4488*(l9_4419.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4417=l9_4490;
l9_4420=l9_4417;
}
else
{
float2 l9_4491=float2(0.0);
float2 l9_4492=float2(0.0);
float2 l9_4493=float2(0.0);
float2 l9_4494=float2(0.0);
float2 l9_4495=float2(0.0);
float2 l9_4496=float2(0.0);
ssGlobals l9_4497=l9_4419;
float2 l9_4498;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4499=float2(0.0);
l9_4499=l9_4497.Surface_UVCoord0;
l9_4492=l9_4499;
l9_4498=l9_4492;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4500=float2(0.0);
l9_4500=l9_4497.Surface_UVCoord1;
l9_4493=l9_4500;
l9_4498=l9_4493;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4501=float2(0.0);
l9_4501=l9_4497.gScreenCoord;
l9_4494=l9_4501;
l9_4498=l9_4494;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4502=float2(0.0);
float2 l9_4503=float2(0.0);
float2 l9_4504=float2(0.0);
ssGlobals l9_4505=l9_4497;
float2 l9_4506;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4507=float2(0.0);
float2 l9_4508=float2(0.0);
float2 l9_4509=float2(0.0);
ssGlobals l9_4510=l9_4505;
float2 l9_4511;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4512=float2(0.0);
float2 l9_4513=float2(0.0);
float2 l9_4514=float2(0.0);
float2 l9_4515=float2(0.0);
float2 l9_4516=float2(0.0);
ssGlobals l9_4517=l9_4510;
float2 l9_4518;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4519=float2(0.0);
l9_4519=l9_4517.Surface_UVCoord0;
l9_4513=l9_4519;
l9_4518=l9_4513;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4520=float2(0.0);
l9_4520=l9_4517.Surface_UVCoord1;
l9_4514=l9_4520;
l9_4518=l9_4514;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4521=float2(0.0);
l9_4521=l9_4517.gScreenCoord;
l9_4515=l9_4521;
l9_4518=l9_4515;
}
else
{
float2 l9_4522=float2(0.0);
l9_4522=l9_4517.Surface_UVCoord0;
l9_4516=l9_4522;
l9_4518=l9_4516;
}
}
}
l9_4512=l9_4518;
float2 l9_4523=float2(0.0);
float2 l9_4524=(*sc_set0.UserUniforms).uv2Scale;
l9_4523=l9_4524;
float2 l9_4525=float2(0.0);
l9_4525=l9_4523;
float2 l9_4526=float2(0.0);
float2 l9_4527=(*sc_set0.UserUniforms).uv2Offset;
l9_4526=l9_4527;
float2 l9_4528=float2(0.0);
l9_4528=l9_4526;
float2 l9_4529=float2(0.0);
l9_4529=(l9_4512*l9_4525)+l9_4528;
float2 l9_4530=float2(0.0);
l9_4530=l9_4529+(l9_4528*(l9_4510.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4508=l9_4530;
l9_4511=l9_4508;
}
else
{
float2 l9_4531=float2(0.0);
float2 l9_4532=float2(0.0);
float2 l9_4533=float2(0.0);
float2 l9_4534=float2(0.0);
float2 l9_4535=float2(0.0);
ssGlobals l9_4536=l9_4510;
float2 l9_4537;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4538=float2(0.0);
l9_4538=l9_4536.Surface_UVCoord0;
l9_4532=l9_4538;
l9_4537=l9_4532;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4539=float2(0.0);
l9_4539=l9_4536.Surface_UVCoord1;
l9_4533=l9_4539;
l9_4537=l9_4533;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4540=float2(0.0);
l9_4540=l9_4536.gScreenCoord;
l9_4534=l9_4540;
l9_4537=l9_4534;
}
else
{
float2 l9_4541=float2(0.0);
l9_4541=l9_4536.Surface_UVCoord0;
l9_4535=l9_4541;
l9_4537=l9_4535;
}
}
}
l9_4531=l9_4537;
float2 l9_4542=float2(0.0);
float2 l9_4543=(*sc_set0.UserUniforms).uv2Scale;
l9_4542=l9_4543;
float2 l9_4544=float2(0.0);
l9_4544=l9_4542;
float2 l9_4545=float2(0.0);
float2 l9_4546=(*sc_set0.UserUniforms).uv2Offset;
l9_4545=l9_4546;
float2 l9_4547=float2(0.0);
l9_4547=l9_4545;
float2 l9_4548=float2(0.0);
l9_4548=(l9_4531*l9_4544)+l9_4547;
l9_4509=l9_4548;
l9_4511=l9_4509;
}
l9_4507=l9_4511;
l9_4503=l9_4507;
l9_4506=l9_4503;
}
else
{
float2 l9_4549=float2(0.0);
l9_4549=l9_4505.Surface_UVCoord0;
l9_4504=l9_4549;
l9_4506=l9_4504;
}
l9_4502=l9_4506;
float2 l9_4550=float2(0.0);
l9_4550=l9_4502;
float2 l9_4551=float2(0.0);
l9_4551=l9_4550;
l9_4495=l9_4551;
l9_4498=l9_4495;
}
else
{
float2 l9_4552=float2(0.0);
l9_4552=l9_4497.Surface_UVCoord0;
l9_4496=l9_4552;
l9_4498=l9_4496;
}
}
}
}
l9_4491=l9_4498;
float2 l9_4553=float2(0.0);
float2 l9_4554=(*sc_set0.UserUniforms).uv3Scale;
l9_4553=l9_4554;
float2 l9_4555=float2(0.0);
l9_4555=l9_4553;
float2 l9_4556=float2(0.0);
float2 l9_4557=(*sc_set0.UserUniforms).uv3Offset;
l9_4556=l9_4557;
float2 l9_4558=float2(0.0);
l9_4558=l9_4556;
float2 l9_4559=float2(0.0);
l9_4559=(l9_4491*l9_4555)+l9_4558;
l9_4418=l9_4559;
l9_4420=l9_4418;
}
l9_4416=l9_4420;
l9_4412=l9_4416;
l9_4415=l9_4412;
}
else
{
float2 l9_4560=float2(0.0);
l9_4560=l9_4414.Surface_UVCoord0;
l9_4413=l9_4560;
l9_4415=l9_4413;
}
l9_4411=l9_4415;
float2 l9_4561=float2(0.0);
l9_4561=l9_4411;
float2 l9_4562=float2(0.0);
l9_4562=l9_4561;
l9_4355=l9_4562;
l9_4358=l9_4355;
}
else
{
float2 l9_4563=float2(0.0);
l9_4563=l9_4357.Surface_UVCoord0;
l9_4356=l9_4563;
l9_4358=l9_4356;
}
}
}
}
l9_4351=l9_4358;
float4 l9_4564=float4(0.0);
int l9_4565=0;
if ((int(rimColorTexHasSwappedViews_tmp)!=0))
{
int l9_4566=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4566=0;
}
else
{
l9_4566=in.varStereoViewID;
}
int l9_4567=l9_4566;
l9_4565=1-l9_4567;
}
else
{
int l9_4568=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4568=0;
}
else
{
l9_4568=in.varStereoViewID;
}
int l9_4569=l9_4568;
l9_4565=l9_4569;
}
int l9_4570=l9_4565;
int l9_4571=rimColorTexLayout_tmp;
int l9_4572=l9_4570;
float2 l9_4573=l9_4351;
bool l9_4574=(int(SC_USE_UV_TRANSFORM_rimColorTex_tmp)!=0);
float3x3 l9_4575=(*sc_set0.UserUniforms).rimColorTexTransform;
int2 l9_4576=int2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp,SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp);
bool l9_4577=(int(SC_USE_UV_MIN_MAX_rimColorTex_tmp)!=0);
float4 l9_4578=(*sc_set0.UserUniforms).rimColorTexUvMinMax;
bool l9_4579=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp)!=0);
float4 l9_4580=(*sc_set0.UserUniforms).rimColorTexBorderColor;
float l9_4581=0.0;
bool l9_4582=l9_4579&&(!l9_4577);
float l9_4583=1.0;
float l9_4584=l9_4573.x;
int l9_4585=l9_4576.x;
if (l9_4585==1)
{
l9_4584=fract(l9_4584);
}
else
{
if (l9_4585==2)
{
float l9_4586=fract(l9_4584);
float l9_4587=l9_4584-l9_4586;
float l9_4588=step(0.25,fract(l9_4587*0.5));
l9_4584=mix(l9_4586,1.0-l9_4586,fast::clamp(l9_4588,0.0,1.0));
}
}
l9_4573.x=l9_4584;
float l9_4589=l9_4573.y;
int l9_4590=l9_4576.y;
if (l9_4590==1)
{
l9_4589=fract(l9_4589);
}
else
{
if (l9_4590==2)
{
float l9_4591=fract(l9_4589);
float l9_4592=l9_4589-l9_4591;
float l9_4593=step(0.25,fract(l9_4592*0.5));
l9_4589=mix(l9_4591,1.0-l9_4591,fast::clamp(l9_4593,0.0,1.0));
}
}
l9_4573.y=l9_4589;
if (l9_4577)
{
bool l9_4594=l9_4579;
bool l9_4595;
if (l9_4594)
{
l9_4595=l9_4576.x==3;
}
else
{
l9_4595=l9_4594;
}
float l9_4596=l9_4573.x;
float l9_4597=l9_4578.x;
float l9_4598=l9_4578.z;
bool l9_4599=l9_4595;
float l9_4600=l9_4583;
float l9_4601=fast::clamp(l9_4596,l9_4597,l9_4598);
float l9_4602=step(abs(l9_4596-l9_4601),9.9999997e-06);
l9_4600*=(l9_4602+((1.0-float(l9_4599))*(1.0-l9_4602)));
l9_4596=l9_4601;
l9_4573.x=l9_4596;
l9_4583=l9_4600;
bool l9_4603=l9_4579;
bool l9_4604;
if (l9_4603)
{
l9_4604=l9_4576.y==3;
}
else
{
l9_4604=l9_4603;
}
float l9_4605=l9_4573.y;
float l9_4606=l9_4578.y;
float l9_4607=l9_4578.w;
bool l9_4608=l9_4604;
float l9_4609=l9_4583;
float l9_4610=fast::clamp(l9_4605,l9_4606,l9_4607);
float l9_4611=step(abs(l9_4605-l9_4610),9.9999997e-06);
l9_4609*=(l9_4611+((1.0-float(l9_4608))*(1.0-l9_4611)));
l9_4605=l9_4610;
l9_4573.y=l9_4605;
l9_4583=l9_4609;
}
float2 l9_4612=l9_4573;
bool l9_4613=l9_4574;
float3x3 l9_4614=l9_4575;
if (l9_4613)
{
l9_4612=float2((l9_4614*float3(l9_4612,1.0)).xy);
}
float2 l9_4615=l9_4612;
float2 l9_4616=l9_4615;
float2 l9_4617=l9_4616;
l9_4573=l9_4617;
float l9_4618=l9_4573.x;
int l9_4619=l9_4576.x;
bool l9_4620=l9_4582;
float l9_4621=l9_4583;
if ((l9_4619==0)||(l9_4619==3))
{
float l9_4622=l9_4618;
float l9_4623=0.0;
float l9_4624=1.0;
bool l9_4625=l9_4620;
float l9_4626=l9_4621;
float l9_4627=fast::clamp(l9_4622,l9_4623,l9_4624);
float l9_4628=step(abs(l9_4622-l9_4627),9.9999997e-06);
l9_4626*=(l9_4628+((1.0-float(l9_4625))*(1.0-l9_4628)));
l9_4622=l9_4627;
l9_4618=l9_4622;
l9_4621=l9_4626;
}
l9_4573.x=l9_4618;
l9_4583=l9_4621;
float l9_4629=l9_4573.y;
int l9_4630=l9_4576.y;
bool l9_4631=l9_4582;
float l9_4632=l9_4583;
if ((l9_4630==0)||(l9_4630==3))
{
float l9_4633=l9_4629;
float l9_4634=0.0;
float l9_4635=1.0;
bool l9_4636=l9_4631;
float l9_4637=l9_4632;
float l9_4638=fast::clamp(l9_4633,l9_4634,l9_4635);
float l9_4639=step(abs(l9_4633-l9_4638),9.9999997e-06);
l9_4637*=(l9_4639+((1.0-float(l9_4636))*(1.0-l9_4639)));
l9_4633=l9_4638;
l9_4629=l9_4633;
l9_4632=l9_4637;
}
l9_4573.y=l9_4629;
l9_4583=l9_4632;
float2 l9_4640=l9_4573;
int l9_4641=l9_4571;
int l9_4642=l9_4572;
float l9_4643=l9_4581;
float2 l9_4644=l9_4640;
int l9_4645=l9_4641;
int l9_4646=l9_4642;
float3 l9_4647=float3(0.0);
if (l9_4645==0)
{
l9_4647=float3(l9_4644,0.0);
}
else
{
if (l9_4645==1)
{
l9_4647=float3(l9_4644.x,(l9_4644.y*0.5)+(0.5-(float(l9_4646)*0.5)),0.0);
}
else
{
l9_4647=float3(l9_4644,float(l9_4646));
}
}
float3 l9_4648=l9_4647;
float3 l9_4649=l9_4648;
float2 l9_4650=l9_4649.xy;
float l9_4651=l9_4643;
float4 l9_4652=sc_set0.rimColorTex.sample(sc_set0.rimColorTexSmpSC,l9_4650,bias(l9_4651));
float4 l9_4653=l9_4652;
float4 l9_4654=l9_4653;
if (l9_4579)
{
l9_4654=mix(l9_4580,l9_4654,float4(l9_4583));
}
float4 l9_4655=l9_4654;
l9_4564=l9_4655;
l9_4347=l9_4564.xyz;
l9_4350=l9_4347;
}
else
{
l9_4350=l9_4348;
}
l9_4346=l9_4350;
float3 l9_4656=float3(0.0);
l9_4656=(l9_4342*float3(l9_4345))*l9_4346;
float3 l9_4657=float3(0.0);
float3 l9_4658=l9_4656;
float3 l9_4659;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4659=float3(pow(l9_4658.x,2.2),pow(l9_4658.y,2.2),pow(l9_4658.z,2.2));
}
else
{
l9_4659=l9_4658*l9_4658;
}
float3 l9_4660=l9_4659;
l9_4657=l9_4660;
float l9_4661=0.0;
float l9_4662=0.0;
float l9_4663=0.0;
ssGlobals l9_4664=param_32;
float l9_4665;
if ((int(rimInvert_tmp)!=0))
{
float3 l9_4666=float3(0.0);
float3 l9_4667=float3(0.0);
float3 l9_4668=float3(0.0);
ssGlobals l9_4669=l9_4664;
float3 l9_4670;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_4671=float3(0.0);
l9_4671=l9_4669.VertexTangent_WorldSpace;
float3 l9_4672=float3(0.0);
l9_4672=l9_4669.VertexBinormal_WorldSpace;
float3 l9_4673=float3(0.0);
l9_4673=l9_4669.VertexNormal_WorldSpace;
float3x3 l9_4674=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_4674=float3x3(float3(l9_4671),float3(l9_4672),float3(l9_4673));
float2 l9_4675=float2(0.0);
float2 l9_4676=float2(0.0);
float2 l9_4677=float2(0.0);
float2 l9_4678=float2(0.0);
float2 l9_4679=float2(0.0);
float2 l9_4680=float2(0.0);
ssGlobals l9_4681=l9_4669;
float2 l9_4682;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_4683=float2(0.0);
l9_4683=l9_4681.Surface_UVCoord0;
l9_4676=l9_4683;
l9_4682=l9_4676;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_4684=float2(0.0);
l9_4684=l9_4681.Surface_UVCoord1;
l9_4677=l9_4684;
l9_4682=l9_4677;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_4685=float2(0.0);
float2 l9_4686=float2(0.0);
float2 l9_4687=float2(0.0);
ssGlobals l9_4688=l9_4681;
float2 l9_4689;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4690=float2(0.0);
float2 l9_4691=float2(0.0);
float2 l9_4692=float2(0.0);
ssGlobals l9_4693=l9_4688;
float2 l9_4694;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4695=float2(0.0);
float2 l9_4696=float2(0.0);
float2 l9_4697=float2(0.0);
float2 l9_4698=float2(0.0);
float2 l9_4699=float2(0.0);
ssGlobals l9_4700=l9_4693;
float2 l9_4701;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4702=float2(0.0);
l9_4702=l9_4700.Surface_UVCoord0;
l9_4696=l9_4702;
l9_4701=l9_4696;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4703=float2(0.0);
l9_4703=l9_4700.Surface_UVCoord1;
l9_4697=l9_4703;
l9_4701=l9_4697;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4704=float2(0.0);
l9_4704=l9_4700.gScreenCoord;
l9_4698=l9_4704;
l9_4701=l9_4698;
}
else
{
float2 l9_4705=float2(0.0);
l9_4705=l9_4700.Surface_UVCoord0;
l9_4699=l9_4705;
l9_4701=l9_4699;
}
}
}
l9_4695=l9_4701;
float2 l9_4706=float2(0.0);
float2 l9_4707=(*sc_set0.UserUniforms).uv2Scale;
l9_4706=l9_4707;
float2 l9_4708=float2(0.0);
l9_4708=l9_4706;
float2 l9_4709=float2(0.0);
float2 l9_4710=(*sc_set0.UserUniforms).uv2Offset;
l9_4709=l9_4710;
float2 l9_4711=float2(0.0);
l9_4711=l9_4709;
float2 l9_4712=float2(0.0);
l9_4712=(l9_4695*l9_4708)+l9_4711;
float2 l9_4713=float2(0.0);
l9_4713=l9_4712+(l9_4711*(l9_4693.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4691=l9_4713;
l9_4694=l9_4691;
}
else
{
float2 l9_4714=float2(0.0);
float2 l9_4715=float2(0.0);
float2 l9_4716=float2(0.0);
float2 l9_4717=float2(0.0);
float2 l9_4718=float2(0.0);
ssGlobals l9_4719=l9_4693;
float2 l9_4720;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4721=float2(0.0);
l9_4721=l9_4719.Surface_UVCoord0;
l9_4715=l9_4721;
l9_4720=l9_4715;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4722=float2(0.0);
l9_4722=l9_4719.Surface_UVCoord1;
l9_4716=l9_4722;
l9_4720=l9_4716;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4723=float2(0.0);
l9_4723=l9_4719.gScreenCoord;
l9_4717=l9_4723;
l9_4720=l9_4717;
}
else
{
float2 l9_4724=float2(0.0);
l9_4724=l9_4719.Surface_UVCoord0;
l9_4718=l9_4724;
l9_4720=l9_4718;
}
}
}
l9_4714=l9_4720;
float2 l9_4725=float2(0.0);
float2 l9_4726=(*sc_set0.UserUniforms).uv2Scale;
l9_4725=l9_4726;
float2 l9_4727=float2(0.0);
l9_4727=l9_4725;
float2 l9_4728=float2(0.0);
float2 l9_4729=(*sc_set0.UserUniforms).uv2Offset;
l9_4728=l9_4729;
float2 l9_4730=float2(0.0);
l9_4730=l9_4728;
float2 l9_4731=float2(0.0);
l9_4731=(l9_4714*l9_4727)+l9_4730;
l9_4692=l9_4731;
l9_4694=l9_4692;
}
l9_4690=l9_4694;
l9_4686=l9_4690;
l9_4689=l9_4686;
}
else
{
float2 l9_4732=float2(0.0);
l9_4732=l9_4688.Surface_UVCoord0;
l9_4687=l9_4732;
l9_4689=l9_4687;
}
l9_4685=l9_4689;
float2 l9_4733=float2(0.0);
l9_4733=l9_4685;
float2 l9_4734=float2(0.0);
l9_4734=l9_4733;
l9_4678=l9_4734;
l9_4682=l9_4678;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_4735=float2(0.0);
float2 l9_4736=float2(0.0);
float2 l9_4737=float2(0.0);
ssGlobals l9_4738=l9_4681;
float2 l9_4739;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_4740=float2(0.0);
float2 l9_4741=float2(0.0);
float2 l9_4742=float2(0.0);
ssGlobals l9_4743=l9_4738;
float2 l9_4744;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_4745=float2(0.0);
float2 l9_4746=float2(0.0);
float2 l9_4747=float2(0.0);
float2 l9_4748=float2(0.0);
float2 l9_4749=float2(0.0);
float2 l9_4750=float2(0.0);
ssGlobals l9_4751=l9_4743;
float2 l9_4752;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4753=float2(0.0);
l9_4753=l9_4751.Surface_UVCoord0;
l9_4746=l9_4753;
l9_4752=l9_4746;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4754=float2(0.0);
l9_4754=l9_4751.Surface_UVCoord1;
l9_4747=l9_4754;
l9_4752=l9_4747;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4755=float2(0.0);
l9_4755=l9_4751.gScreenCoord;
l9_4748=l9_4755;
l9_4752=l9_4748;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4756=float2(0.0);
float2 l9_4757=float2(0.0);
float2 l9_4758=float2(0.0);
ssGlobals l9_4759=l9_4751;
float2 l9_4760;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4761=float2(0.0);
float2 l9_4762=float2(0.0);
float2 l9_4763=float2(0.0);
ssGlobals l9_4764=l9_4759;
float2 l9_4765;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4766=float2(0.0);
float2 l9_4767=float2(0.0);
float2 l9_4768=float2(0.0);
float2 l9_4769=float2(0.0);
float2 l9_4770=float2(0.0);
ssGlobals l9_4771=l9_4764;
float2 l9_4772;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4773=float2(0.0);
l9_4773=l9_4771.Surface_UVCoord0;
l9_4767=l9_4773;
l9_4772=l9_4767;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4774=float2(0.0);
l9_4774=l9_4771.Surface_UVCoord1;
l9_4768=l9_4774;
l9_4772=l9_4768;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4775=float2(0.0);
l9_4775=l9_4771.gScreenCoord;
l9_4769=l9_4775;
l9_4772=l9_4769;
}
else
{
float2 l9_4776=float2(0.0);
l9_4776=l9_4771.Surface_UVCoord0;
l9_4770=l9_4776;
l9_4772=l9_4770;
}
}
}
l9_4766=l9_4772;
float2 l9_4777=float2(0.0);
float2 l9_4778=(*sc_set0.UserUniforms).uv2Scale;
l9_4777=l9_4778;
float2 l9_4779=float2(0.0);
l9_4779=l9_4777;
float2 l9_4780=float2(0.0);
float2 l9_4781=(*sc_set0.UserUniforms).uv2Offset;
l9_4780=l9_4781;
float2 l9_4782=float2(0.0);
l9_4782=l9_4780;
float2 l9_4783=float2(0.0);
l9_4783=(l9_4766*l9_4779)+l9_4782;
float2 l9_4784=float2(0.0);
l9_4784=l9_4783+(l9_4782*(l9_4764.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4762=l9_4784;
l9_4765=l9_4762;
}
else
{
float2 l9_4785=float2(0.0);
float2 l9_4786=float2(0.0);
float2 l9_4787=float2(0.0);
float2 l9_4788=float2(0.0);
float2 l9_4789=float2(0.0);
ssGlobals l9_4790=l9_4764;
float2 l9_4791;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4792=float2(0.0);
l9_4792=l9_4790.Surface_UVCoord0;
l9_4786=l9_4792;
l9_4791=l9_4786;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4793=float2(0.0);
l9_4793=l9_4790.Surface_UVCoord1;
l9_4787=l9_4793;
l9_4791=l9_4787;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4794=float2(0.0);
l9_4794=l9_4790.gScreenCoord;
l9_4788=l9_4794;
l9_4791=l9_4788;
}
else
{
float2 l9_4795=float2(0.0);
l9_4795=l9_4790.Surface_UVCoord0;
l9_4789=l9_4795;
l9_4791=l9_4789;
}
}
}
l9_4785=l9_4791;
float2 l9_4796=float2(0.0);
float2 l9_4797=(*sc_set0.UserUniforms).uv2Scale;
l9_4796=l9_4797;
float2 l9_4798=float2(0.0);
l9_4798=l9_4796;
float2 l9_4799=float2(0.0);
float2 l9_4800=(*sc_set0.UserUniforms).uv2Offset;
l9_4799=l9_4800;
float2 l9_4801=float2(0.0);
l9_4801=l9_4799;
float2 l9_4802=float2(0.0);
l9_4802=(l9_4785*l9_4798)+l9_4801;
l9_4763=l9_4802;
l9_4765=l9_4763;
}
l9_4761=l9_4765;
l9_4757=l9_4761;
l9_4760=l9_4757;
}
else
{
float2 l9_4803=float2(0.0);
l9_4803=l9_4759.Surface_UVCoord0;
l9_4758=l9_4803;
l9_4760=l9_4758;
}
l9_4756=l9_4760;
float2 l9_4804=float2(0.0);
l9_4804=l9_4756;
float2 l9_4805=float2(0.0);
l9_4805=l9_4804;
l9_4749=l9_4805;
l9_4752=l9_4749;
}
else
{
float2 l9_4806=float2(0.0);
l9_4806=l9_4751.Surface_UVCoord0;
l9_4750=l9_4806;
l9_4752=l9_4750;
}
}
}
}
l9_4745=l9_4752;
float2 l9_4807=float2(0.0);
float2 l9_4808=(*sc_set0.UserUniforms).uv3Scale;
l9_4807=l9_4808;
float2 l9_4809=float2(0.0);
l9_4809=l9_4807;
float2 l9_4810=float2(0.0);
float2 l9_4811=(*sc_set0.UserUniforms).uv3Offset;
l9_4810=l9_4811;
float2 l9_4812=float2(0.0);
l9_4812=l9_4810;
float2 l9_4813=float2(0.0);
l9_4813=(l9_4745*l9_4809)+l9_4812;
float2 l9_4814=float2(0.0);
l9_4814=l9_4813+(l9_4812*(l9_4743.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4741=l9_4814;
l9_4744=l9_4741;
}
else
{
float2 l9_4815=float2(0.0);
float2 l9_4816=float2(0.0);
float2 l9_4817=float2(0.0);
float2 l9_4818=float2(0.0);
float2 l9_4819=float2(0.0);
float2 l9_4820=float2(0.0);
ssGlobals l9_4821=l9_4743;
float2 l9_4822;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4823=float2(0.0);
l9_4823=l9_4821.Surface_UVCoord0;
l9_4816=l9_4823;
l9_4822=l9_4816;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4824=float2(0.0);
l9_4824=l9_4821.Surface_UVCoord1;
l9_4817=l9_4824;
l9_4822=l9_4817;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4825=float2(0.0);
l9_4825=l9_4821.gScreenCoord;
l9_4818=l9_4825;
l9_4822=l9_4818;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4826=float2(0.0);
float2 l9_4827=float2(0.0);
float2 l9_4828=float2(0.0);
ssGlobals l9_4829=l9_4821;
float2 l9_4830;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_4831=float2(0.0);
float2 l9_4832=float2(0.0);
float2 l9_4833=float2(0.0);
ssGlobals l9_4834=l9_4829;
float2 l9_4835;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4836=float2(0.0);
float2 l9_4837=float2(0.0);
float2 l9_4838=float2(0.0);
float2 l9_4839=float2(0.0);
float2 l9_4840=float2(0.0);
ssGlobals l9_4841=l9_4834;
float2 l9_4842;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4843=float2(0.0);
l9_4843=l9_4841.Surface_UVCoord0;
l9_4837=l9_4843;
l9_4842=l9_4837;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4844=float2(0.0);
l9_4844=l9_4841.Surface_UVCoord1;
l9_4838=l9_4844;
l9_4842=l9_4838;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4845=float2(0.0);
l9_4845=l9_4841.gScreenCoord;
l9_4839=l9_4845;
l9_4842=l9_4839;
}
else
{
float2 l9_4846=float2(0.0);
l9_4846=l9_4841.Surface_UVCoord0;
l9_4840=l9_4846;
l9_4842=l9_4840;
}
}
}
l9_4836=l9_4842;
float2 l9_4847=float2(0.0);
float2 l9_4848=(*sc_set0.UserUniforms).uv2Scale;
l9_4847=l9_4848;
float2 l9_4849=float2(0.0);
l9_4849=l9_4847;
float2 l9_4850=float2(0.0);
float2 l9_4851=(*sc_set0.UserUniforms).uv2Offset;
l9_4850=l9_4851;
float2 l9_4852=float2(0.0);
l9_4852=l9_4850;
float2 l9_4853=float2(0.0);
l9_4853=(l9_4836*l9_4849)+l9_4852;
float2 l9_4854=float2(0.0);
l9_4854=l9_4853+(l9_4852*(l9_4834.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4832=l9_4854;
l9_4835=l9_4832;
}
else
{
float2 l9_4855=float2(0.0);
float2 l9_4856=float2(0.0);
float2 l9_4857=float2(0.0);
float2 l9_4858=float2(0.0);
float2 l9_4859=float2(0.0);
ssGlobals l9_4860=l9_4834;
float2 l9_4861;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4862=float2(0.0);
l9_4862=l9_4860.Surface_UVCoord0;
l9_4856=l9_4862;
l9_4861=l9_4856;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4863=float2(0.0);
l9_4863=l9_4860.Surface_UVCoord1;
l9_4857=l9_4863;
l9_4861=l9_4857;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4864=float2(0.0);
l9_4864=l9_4860.gScreenCoord;
l9_4858=l9_4864;
l9_4861=l9_4858;
}
else
{
float2 l9_4865=float2(0.0);
l9_4865=l9_4860.Surface_UVCoord0;
l9_4859=l9_4865;
l9_4861=l9_4859;
}
}
}
l9_4855=l9_4861;
float2 l9_4866=float2(0.0);
float2 l9_4867=(*sc_set0.UserUniforms).uv2Scale;
l9_4866=l9_4867;
float2 l9_4868=float2(0.0);
l9_4868=l9_4866;
float2 l9_4869=float2(0.0);
float2 l9_4870=(*sc_set0.UserUniforms).uv2Offset;
l9_4869=l9_4870;
float2 l9_4871=float2(0.0);
l9_4871=l9_4869;
float2 l9_4872=float2(0.0);
l9_4872=(l9_4855*l9_4868)+l9_4871;
l9_4833=l9_4872;
l9_4835=l9_4833;
}
l9_4831=l9_4835;
l9_4827=l9_4831;
l9_4830=l9_4827;
}
else
{
float2 l9_4873=float2(0.0);
l9_4873=l9_4829.Surface_UVCoord0;
l9_4828=l9_4873;
l9_4830=l9_4828;
}
l9_4826=l9_4830;
float2 l9_4874=float2(0.0);
l9_4874=l9_4826;
float2 l9_4875=float2(0.0);
l9_4875=l9_4874;
l9_4819=l9_4875;
l9_4822=l9_4819;
}
else
{
float2 l9_4876=float2(0.0);
l9_4876=l9_4821.Surface_UVCoord0;
l9_4820=l9_4876;
l9_4822=l9_4820;
}
}
}
}
l9_4815=l9_4822;
float2 l9_4877=float2(0.0);
float2 l9_4878=(*sc_set0.UserUniforms).uv3Scale;
l9_4877=l9_4878;
float2 l9_4879=float2(0.0);
l9_4879=l9_4877;
float2 l9_4880=float2(0.0);
float2 l9_4881=(*sc_set0.UserUniforms).uv3Offset;
l9_4880=l9_4881;
float2 l9_4882=float2(0.0);
l9_4882=l9_4880;
float2 l9_4883=float2(0.0);
l9_4883=(l9_4815*l9_4879)+l9_4882;
l9_4742=l9_4883;
l9_4744=l9_4742;
}
l9_4740=l9_4744;
l9_4736=l9_4740;
l9_4739=l9_4736;
}
else
{
float2 l9_4884=float2(0.0);
l9_4884=l9_4738.Surface_UVCoord0;
l9_4737=l9_4884;
l9_4739=l9_4737;
}
l9_4735=l9_4739;
float2 l9_4885=float2(0.0);
l9_4885=l9_4735;
float2 l9_4886=float2(0.0);
l9_4886=l9_4885;
l9_4679=l9_4886;
l9_4682=l9_4679;
}
else
{
float2 l9_4887=float2(0.0);
l9_4887=l9_4681.Surface_UVCoord0;
l9_4680=l9_4887;
l9_4682=l9_4680;
}
}
}
}
l9_4675=l9_4682;
float4 l9_4888=float4(0.0);
float2 l9_4889=l9_4675;
int l9_4890=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_4891=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4891=0;
}
else
{
l9_4891=in.varStereoViewID;
}
int l9_4892=l9_4891;
l9_4890=1-l9_4892;
}
else
{
int l9_4893=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4893=0;
}
else
{
l9_4893=in.varStereoViewID;
}
int l9_4894=l9_4893;
l9_4890=l9_4894;
}
int l9_4895=l9_4890;
int l9_4896=normalTexLayout_tmp;
int l9_4897=l9_4895;
float2 l9_4898=l9_4889;
bool l9_4899=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_4900=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_4901=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_4902=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_4903=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_4904=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_4905=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_4906=0.0;
bool l9_4907=l9_4904&&(!l9_4902);
float l9_4908=1.0;
float l9_4909=l9_4898.x;
int l9_4910=l9_4901.x;
if (l9_4910==1)
{
l9_4909=fract(l9_4909);
}
else
{
if (l9_4910==2)
{
float l9_4911=fract(l9_4909);
float l9_4912=l9_4909-l9_4911;
float l9_4913=step(0.25,fract(l9_4912*0.5));
l9_4909=mix(l9_4911,1.0-l9_4911,fast::clamp(l9_4913,0.0,1.0));
}
}
l9_4898.x=l9_4909;
float l9_4914=l9_4898.y;
int l9_4915=l9_4901.y;
if (l9_4915==1)
{
l9_4914=fract(l9_4914);
}
else
{
if (l9_4915==2)
{
float l9_4916=fract(l9_4914);
float l9_4917=l9_4914-l9_4916;
float l9_4918=step(0.25,fract(l9_4917*0.5));
l9_4914=mix(l9_4916,1.0-l9_4916,fast::clamp(l9_4918,0.0,1.0));
}
}
l9_4898.y=l9_4914;
if (l9_4902)
{
bool l9_4919=l9_4904;
bool l9_4920;
if (l9_4919)
{
l9_4920=l9_4901.x==3;
}
else
{
l9_4920=l9_4919;
}
float l9_4921=l9_4898.x;
float l9_4922=l9_4903.x;
float l9_4923=l9_4903.z;
bool l9_4924=l9_4920;
float l9_4925=l9_4908;
float l9_4926=fast::clamp(l9_4921,l9_4922,l9_4923);
float l9_4927=step(abs(l9_4921-l9_4926),9.9999997e-06);
l9_4925*=(l9_4927+((1.0-float(l9_4924))*(1.0-l9_4927)));
l9_4921=l9_4926;
l9_4898.x=l9_4921;
l9_4908=l9_4925;
bool l9_4928=l9_4904;
bool l9_4929;
if (l9_4928)
{
l9_4929=l9_4901.y==3;
}
else
{
l9_4929=l9_4928;
}
float l9_4930=l9_4898.y;
float l9_4931=l9_4903.y;
float l9_4932=l9_4903.w;
bool l9_4933=l9_4929;
float l9_4934=l9_4908;
float l9_4935=fast::clamp(l9_4930,l9_4931,l9_4932);
float l9_4936=step(abs(l9_4930-l9_4935),9.9999997e-06);
l9_4934*=(l9_4936+((1.0-float(l9_4933))*(1.0-l9_4936)));
l9_4930=l9_4935;
l9_4898.y=l9_4930;
l9_4908=l9_4934;
}
float2 l9_4937=l9_4898;
bool l9_4938=l9_4899;
float3x3 l9_4939=l9_4900;
if (l9_4938)
{
l9_4937=float2((l9_4939*float3(l9_4937,1.0)).xy);
}
float2 l9_4940=l9_4937;
float2 l9_4941=l9_4940;
float2 l9_4942=l9_4941;
l9_4898=l9_4942;
float l9_4943=l9_4898.x;
int l9_4944=l9_4901.x;
bool l9_4945=l9_4907;
float l9_4946=l9_4908;
if ((l9_4944==0)||(l9_4944==3))
{
float l9_4947=l9_4943;
float l9_4948=0.0;
float l9_4949=1.0;
bool l9_4950=l9_4945;
float l9_4951=l9_4946;
float l9_4952=fast::clamp(l9_4947,l9_4948,l9_4949);
float l9_4953=step(abs(l9_4947-l9_4952),9.9999997e-06);
l9_4951*=(l9_4953+((1.0-float(l9_4950))*(1.0-l9_4953)));
l9_4947=l9_4952;
l9_4943=l9_4947;
l9_4946=l9_4951;
}
l9_4898.x=l9_4943;
l9_4908=l9_4946;
float l9_4954=l9_4898.y;
int l9_4955=l9_4901.y;
bool l9_4956=l9_4907;
float l9_4957=l9_4908;
if ((l9_4955==0)||(l9_4955==3))
{
float l9_4958=l9_4954;
float l9_4959=0.0;
float l9_4960=1.0;
bool l9_4961=l9_4956;
float l9_4962=l9_4957;
float l9_4963=fast::clamp(l9_4958,l9_4959,l9_4960);
float l9_4964=step(abs(l9_4958-l9_4963),9.9999997e-06);
l9_4962*=(l9_4964+((1.0-float(l9_4961))*(1.0-l9_4964)));
l9_4958=l9_4963;
l9_4954=l9_4958;
l9_4957=l9_4962;
}
l9_4898.y=l9_4954;
l9_4908=l9_4957;
float2 l9_4965=l9_4898;
int l9_4966=l9_4896;
int l9_4967=l9_4897;
float l9_4968=l9_4906;
float2 l9_4969=l9_4965;
int l9_4970=l9_4966;
int l9_4971=l9_4967;
float3 l9_4972=float3(0.0);
if (l9_4970==0)
{
l9_4972=float3(l9_4969,0.0);
}
else
{
if (l9_4970==1)
{
l9_4972=float3(l9_4969.x,(l9_4969.y*0.5)+(0.5-(float(l9_4971)*0.5)),0.0);
}
else
{
l9_4972=float3(l9_4969,float(l9_4971));
}
}
float3 l9_4973=l9_4972;
float3 l9_4974=l9_4973;
float2 l9_4975=l9_4974.xy;
float l9_4976=l9_4968;
float4 l9_4977=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_4975,bias(l9_4976));
float4 l9_4978=l9_4977;
float4 l9_4979=l9_4978;
if (l9_4904)
{
l9_4979=mix(l9_4905,l9_4979,float4(l9_4908));
}
float4 l9_4980=l9_4979;
float4 l9_4981=l9_4980;
float3 l9_4982=(l9_4981.xyz*1.9921875)-float3(1.0);
l9_4981=float4(l9_4982.x,l9_4982.y,l9_4982.z,l9_4981.w);
l9_4888=l9_4981;
float3 l9_4983=float3(0.0);
float3 l9_4984=float3(0.0);
float3 l9_4985=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_4986=l9_4669;
float3 l9_4987;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_4988=float2(0.0);
float2 l9_4989=float2(0.0);
float2 l9_4990=float2(0.0);
float2 l9_4991=float2(0.0);
float2 l9_4992=float2(0.0);
float2 l9_4993=float2(0.0);
ssGlobals l9_4994=l9_4986;
float2 l9_4995;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_4996=float2(0.0);
l9_4996=l9_4994.Surface_UVCoord0;
l9_4989=l9_4996;
l9_4995=l9_4989;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_4997=float2(0.0);
l9_4997=l9_4994.Surface_UVCoord1;
l9_4990=l9_4997;
l9_4995=l9_4990;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_4998=float2(0.0);
float2 l9_4999=float2(0.0);
float2 l9_5000=float2(0.0);
ssGlobals l9_5001=l9_4994;
float2 l9_5002;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5003=float2(0.0);
float2 l9_5004=float2(0.0);
float2 l9_5005=float2(0.0);
ssGlobals l9_5006=l9_5001;
float2 l9_5007;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5008=float2(0.0);
float2 l9_5009=float2(0.0);
float2 l9_5010=float2(0.0);
float2 l9_5011=float2(0.0);
float2 l9_5012=float2(0.0);
ssGlobals l9_5013=l9_5006;
float2 l9_5014;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5015=float2(0.0);
l9_5015=l9_5013.Surface_UVCoord0;
l9_5009=l9_5015;
l9_5014=l9_5009;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5016=float2(0.0);
l9_5016=l9_5013.Surface_UVCoord1;
l9_5010=l9_5016;
l9_5014=l9_5010;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5017=float2(0.0);
l9_5017=l9_5013.gScreenCoord;
l9_5011=l9_5017;
l9_5014=l9_5011;
}
else
{
float2 l9_5018=float2(0.0);
l9_5018=l9_5013.Surface_UVCoord0;
l9_5012=l9_5018;
l9_5014=l9_5012;
}
}
}
l9_5008=l9_5014;
float2 l9_5019=float2(0.0);
float2 l9_5020=(*sc_set0.UserUniforms).uv2Scale;
l9_5019=l9_5020;
float2 l9_5021=float2(0.0);
l9_5021=l9_5019;
float2 l9_5022=float2(0.0);
float2 l9_5023=(*sc_set0.UserUniforms).uv2Offset;
l9_5022=l9_5023;
float2 l9_5024=float2(0.0);
l9_5024=l9_5022;
float2 l9_5025=float2(0.0);
l9_5025=(l9_5008*l9_5021)+l9_5024;
float2 l9_5026=float2(0.0);
l9_5026=l9_5025+(l9_5024*(l9_5006.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5004=l9_5026;
l9_5007=l9_5004;
}
else
{
float2 l9_5027=float2(0.0);
float2 l9_5028=float2(0.0);
float2 l9_5029=float2(0.0);
float2 l9_5030=float2(0.0);
float2 l9_5031=float2(0.0);
ssGlobals l9_5032=l9_5006;
float2 l9_5033;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5034=float2(0.0);
l9_5034=l9_5032.Surface_UVCoord0;
l9_5028=l9_5034;
l9_5033=l9_5028;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5035=float2(0.0);
l9_5035=l9_5032.Surface_UVCoord1;
l9_5029=l9_5035;
l9_5033=l9_5029;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5036=float2(0.0);
l9_5036=l9_5032.gScreenCoord;
l9_5030=l9_5036;
l9_5033=l9_5030;
}
else
{
float2 l9_5037=float2(0.0);
l9_5037=l9_5032.Surface_UVCoord0;
l9_5031=l9_5037;
l9_5033=l9_5031;
}
}
}
l9_5027=l9_5033;
float2 l9_5038=float2(0.0);
float2 l9_5039=(*sc_set0.UserUniforms).uv2Scale;
l9_5038=l9_5039;
float2 l9_5040=float2(0.0);
l9_5040=l9_5038;
float2 l9_5041=float2(0.0);
float2 l9_5042=(*sc_set0.UserUniforms).uv2Offset;
l9_5041=l9_5042;
float2 l9_5043=float2(0.0);
l9_5043=l9_5041;
float2 l9_5044=float2(0.0);
l9_5044=(l9_5027*l9_5040)+l9_5043;
l9_5005=l9_5044;
l9_5007=l9_5005;
}
l9_5003=l9_5007;
l9_4999=l9_5003;
l9_5002=l9_4999;
}
else
{
float2 l9_5045=float2(0.0);
l9_5045=l9_5001.Surface_UVCoord0;
l9_5000=l9_5045;
l9_5002=l9_5000;
}
l9_4998=l9_5002;
float2 l9_5046=float2(0.0);
l9_5046=l9_4998;
float2 l9_5047=float2(0.0);
l9_5047=l9_5046;
l9_4991=l9_5047;
l9_4995=l9_4991;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_5048=float2(0.0);
float2 l9_5049=float2(0.0);
float2 l9_5050=float2(0.0);
ssGlobals l9_5051=l9_4994;
float2 l9_5052;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_5053=float2(0.0);
float2 l9_5054=float2(0.0);
float2 l9_5055=float2(0.0);
ssGlobals l9_5056=l9_5051;
float2 l9_5057;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_5058=float2(0.0);
float2 l9_5059=float2(0.0);
float2 l9_5060=float2(0.0);
float2 l9_5061=float2(0.0);
float2 l9_5062=float2(0.0);
float2 l9_5063=float2(0.0);
ssGlobals l9_5064=l9_5056;
float2 l9_5065;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5066=float2(0.0);
l9_5066=l9_5064.Surface_UVCoord0;
l9_5059=l9_5066;
l9_5065=l9_5059;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5067=float2(0.0);
l9_5067=l9_5064.Surface_UVCoord1;
l9_5060=l9_5067;
l9_5065=l9_5060;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5068=float2(0.0);
l9_5068=l9_5064.gScreenCoord;
l9_5061=l9_5068;
l9_5065=l9_5061;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5069=float2(0.0);
float2 l9_5070=float2(0.0);
float2 l9_5071=float2(0.0);
ssGlobals l9_5072=l9_5064;
float2 l9_5073;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5074=float2(0.0);
float2 l9_5075=float2(0.0);
float2 l9_5076=float2(0.0);
ssGlobals l9_5077=l9_5072;
float2 l9_5078;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5079=float2(0.0);
float2 l9_5080=float2(0.0);
float2 l9_5081=float2(0.0);
float2 l9_5082=float2(0.0);
float2 l9_5083=float2(0.0);
ssGlobals l9_5084=l9_5077;
float2 l9_5085;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5086=float2(0.0);
l9_5086=l9_5084.Surface_UVCoord0;
l9_5080=l9_5086;
l9_5085=l9_5080;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5087=float2(0.0);
l9_5087=l9_5084.Surface_UVCoord1;
l9_5081=l9_5087;
l9_5085=l9_5081;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5088=float2(0.0);
l9_5088=l9_5084.gScreenCoord;
l9_5082=l9_5088;
l9_5085=l9_5082;
}
else
{
float2 l9_5089=float2(0.0);
l9_5089=l9_5084.Surface_UVCoord0;
l9_5083=l9_5089;
l9_5085=l9_5083;
}
}
}
l9_5079=l9_5085;
float2 l9_5090=float2(0.0);
float2 l9_5091=(*sc_set0.UserUniforms).uv2Scale;
l9_5090=l9_5091;
float2 l9_5092=float2(0.0);
l9_5092=l9_5090;
float2 l9_5093=float2(0.0);
float2 l9_5094=(*sc_set0.UserUniforms).uv2Offset;
l9_5093=l9_5094;
float2 l9_5095=float2(0.0);
l9_5095=l9_5093;
float2 l9_5096=float2(0.0);
l9_5096=(l9_5079*l9_5092)+l9_5095;
float2 l9_5097=float2(0.0);
l9_5097=l9_5096+(l9_5095*(l9_5077.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5075=l9_5097;
l9_5078=l9_5075;
}
else
{
float2 l9_5098=float2(0.0);
float2 l9_5099=float2(0.0);
float2 l9_5100=float2(0.0);
float2 l9_5101=float2(0.0);
float2 l9_5102=float2(0.0);
ssGlobals l9_5103=l9_5077;
float2 l9_5104;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5105=float2(0.0);
l9_5105=l9_5103.Surface_UVCoord0;
l9_5099=l9_5105;
l9_5104=l9_5099;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5106=float2(0.0);
l9_5106=l9_5103.Surface_UVCoord1;
l9_5100=l9_5106;
l9_5104=l9_5100;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5107=float2(0.0);
l9_5107=l9_5103.gScreenCoord;
l9_5101=l9_5107;
l9_5104=l9_5101;
}
else
{
float2 l9_5108=float2(0.0);
l9_5108=l9_5103.Surface_UVCoord0;
l9_5102=l9_5108;
l9_5104=l9_5102;
}
}
}
l9_5098=l9_5104;
float2 l9_5109=float2(0.0);
float2 l9_5110=(*sc_set0.UserUniforms).uv2Scale;
l9_5109=l9_5110;
float2 l9_5111=float2(0.0);
l9_5111=l9_5109;
float2 l9_5112=float2(0.0);
float2 l9_5113=(*sc_set0.UserUniforms).uv2Offset;
l9_5112=l9_5113;
float2 l9_5114=float2(0.0);
l9_5114=l9_5112;
float2 l9_5115=float2(0.0);
l9_5115=(l9_5098*l9_5111)+l9_5114;
l9_5076=l9_5115;
l9_5078=l9_5076;
}
l9_5074=l9_5078;
l9_5070=l9_5074;
l9_5073=l9_5070;
}
else
{
float2 l9_5116=float2(0.0);
l9_5116=l9_5072.Surface_UVCoord0;
l9_5071=l9_5116;
l9_5073=l9_5071;
}
l9_5069=l9_5073;
float2 l9_5117=float2(0.0);
l9_5117=l9_5069;
float2 l9_5118=float2(0.0);
l9_5118=l9_5117;
l9_5062=l9_5118;
l9_5065=l9_5062;
}
else
{
float2 l9_5119=float2(0.0);
l9_5119=l9_5064.Surface_UVCoord0;
l9_5063=l9_5119;
l9_5065=l9_5063;
}
}
}
}
l9_5058=l9_5065;
float2 l9_5120=float2(0.0);
float2 l9_5121=(*sc_set0.UserUniforms).uv3Scale;
l9_5120=l9_5121;
float2 l9_5122=float2(0.0);
l9_5122=l9_5120;
float2 l9_5123=float2(0.0);
float2 l9_5124=(*sc_set0.UserUniforms).uv3Offset;
l9_5123=l9_5124;
float2 l9_5125=float2(0.0);
l9_5125=l9_5123;
float2 l9_5126=float2(0.0);
l9_5126=(l9_5058*l9_5122)+l9_5125;
float2 l9_5127=float2(0.0);
l9_5127=l9_5126+(l9_5125*(l9_5056.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5054=l9_5127;
l9_5057=l9_5054;
}
else
{
float2 l9_5128=float2(0.0);
float2 l9_5129=float2(0.0);
float2 l9_5130=float2(0.0);
float2 l9_5131=float2(0.0);
float2 l9_5132=float2(0.0);
float2 l9_5133=float2(0.0);
ssGlobals l9_5134=l9_5056;
float2 l9_5135;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5136=float2(0.0);
l9_5136=l9_5134.Surface_UVCoord0;
l9_5129=l9_5136;
l9_5135=l9_5129;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5137=float2(0.0);
l9_5137=l9_5134.Surface_UVCoord1;
l9_5130=l9_5137;
l9_5135=l9_5130;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5138=float2(0.0);
l9_5138=l9_5134.gScreenCoord;
l9_5131=l9_5138;
l9_5135=l9_5131;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5139=float2(0.0);
float2 l9_5140=float2(0.0);
float2 l9_5141=float2(0.0);
ssGlobals l9_5142=l9_5134;
float2 l9_5143;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5144=float2(0.0);
float2 l9_5145=float2(0.0);
float2 l9_5146=float2(0.0);
ssGlobals l9_5147=l9_5142;
float2 l9_5148;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5149=float2(0.0);
float2 l9_5150=float2(0.0);
float2 l9_5151=float2(0.0);
float2 l9_5152=float2(0.0);
float2 l9_5153=float2(0.0);
ssGlobals l9_5154=l9_5147;
float2 l9_5155;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5156=float2(0.0);
l9_5156=l9_5154.Surface_UVCoord0;
l9_5150=l9_5156;
l9_5155=l9_5150;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5157=float2(0.0);
l9_5157=l9_5154.Surface_UVCoord1;
l9_5151=l9_5157;
l9_5155=l9_5151;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5158=float2(0.0);
l9_5158=l9_5154.gScreenCoord;
l9_5152=l9_5158;
l9_5155=l9_5152;
}
else
{
float2 l9_5159=float2(0.0);
l9_5159=l9_5154.Surface_UVCoord0;
l9_5153=l9_5159;
l9_5155=l9_5153;
}
}
}
l9_5149=l9_5155;
float2 l9_5160=float2(0.0);
float2 l9_5161=(*sc_set0.UserUniforms).uv2Scale;
l9_5160=l9_5161;
float2 l9_5162=float2(0.0);
l9_5162=l9_5160;
float2 l9_5163=float2(0.0);
float2 l9_5164=(*sc_set0.UserUniforms).uv2Offset;
l9_5163=l9_5164;
float2 l9_5165=float2(0.0);
l9_5165=l9_5163;
float2 l9_5166=float2(0.0);
l9_5166=(l9_5149*l9_5162)+l9_5165;
float2 l9_5167=float2(0.0);
l9_5167=l9_5166+(l9_5165*(l9_5147.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5145=l9_5167;
l9_5148=l9_5145;
}
else
{
float2 l9_5168=float2(0.0);
float2 l9_5169=float2(0.0);
float2 l9_5170=float2(0.0);
float2 l9_5171=float2(0.0);
float2 l9_5172=float2(0.0);
ssGlobals l9_5173=l9_5147;
float2 l9_5174;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5175=float2(0.0);
l9_5175=l9_5173.Surface_UVCoord0;
l9_5169=l9_5175;
l9_5174=l9_5169;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5176=float2(0.0);
l9_5176=l9_5173.Surface_UVCoord1;
l9_5170=l9_5176;
l9_5174=l9_5170;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5177=float2(0.0);
l9_5177=l9_5173.gScreenCoord;
l9_5171=l9_5177;
l9_5174=l9_5171;
}
else
{
float2 l9_5178=float2(0.0);
l9_5178=l9_5173.Surface_UVCoord0;
l9_5172=l9_5178;
l9_5174=l9_5172;
}
}
}
l9_5168=l9_5174;
float2 l9_5179=float2(0.0);
float2 l9_5180=(*sc_set0.UserUniforms).uv2Scale;
l9_5179=l9_5180;
float2 l9_5181=float2(0.0);
l9_5181=l9_5179;
float2 l9_5182=float2(0.0);
float2 l9_5183=(*sc_set0.UserUniforms).uv2Offset;
l9_5182=l9_5183;
float2 l9_5184=float2(0.0);
l9_5184=l9_5182;
float2 l9_5185=float2(0.0);
l9_5185=(l9_5168*l9_5181)+l9_5184;
l9_5146=l9_5185;
l9_5148=l9_5146;
}
l9_5144=l9_5148;
l9_5140=l9_5144;
l9_5143=l9_5140;
}
else
{
float2 l9_5186=float2(0.0);
l9_5186=l9_5142.Surface_UVCoord0;
l9_5141=l9_5186;
l9_5143=l9_5141;
}
l9_5139=l9_5143;
float2 l9_5187=float2(0.0);
l9_5187=l9_5139;
float2 l9_5188=float2(0.0);
l9_5188=l9_5187;
l9_5132=l9_5188;
l9_5135=l9_5132;
}
else
{
float2 l9_5189=float2(0.0);
l9_5189=l9_5134.Surface_UVCoord0;
l9_5133=l9_5189;
l9_5135=l9_5133;
}
}
}
}
l9_5128=l9_5135;
float2 l9_5190=float2(0.0);
float2 l9_5191=(*sc_set0.UserUniforms).uv3Scale;
l9_5190=l9_5191;
float2 l9_5192=float2(0.0);
l9_5192=l9_5190;
float2 l9_5193=float2(0.0);
float2 l9_5194=(*sc_set0.UserUniforms).uv3Offset;
l9_5193=l9_5194;
float2 l9_5195=float2(0.0);
l9_5195=l9_5193;
float2 l9_5196=float2(0.0);
l9_5196=(l9_5128*l9_5192)+l9_5195;
l9_5055=l9_5196;
l9_5057=l9_5055;
}
l9_5053=l9_5057;
l9_5049=l9_5053;
l9_5052=l9_5049;
}
else
{
float2 l9_5197=float2(0.0);
l9_5197=l9_5051.Surface_UVCoord0;
l9_5050=l9_5197;
l9_5052=l9_5050;
}
l9_5048=l9_5052;
float2 l9_5198=float2(0.0);
l9_5198=l9_5048;
float2 l9_5199=float2(0.0);
l9_5199=l9_5198;
l9_4992=l9_5199;
l9_4995=l9_4992;
}
else
{
float2 l9_5200=float2(0.0);
l9_5200=l9_4994.Surface_UVCoord0;
l9_4993=l9_5200;
l9_4995=l9_4993;
}
}
}
}
l9_4988=l9_4995;
float4 l9_5201=float4(0.0);
float2 l9_5202=l9_4988;
int l9_5203=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_5204=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5204=0;
}
else
{
l9_5204=in.varStereoViewID;
}
int l9_5205=l9_5204;
l9_5203=1-l9_5205;
}
else
{
int l9_5206=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5206=0;
}
else
{
l9_5206=in.varStereoViewID;
}
int l9_5207=l9_5206;
l9_5203=l9_5207;
}
int l9_5208=l9_5203;
int l9_5209=detailNormalTexLayout_tmp;
int l9_5210=l9_5208;
float2 l9_5211=l9_5202;
bool l9_5212=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_5213=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_5214=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_5215=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_5216=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_5217=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_5218=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_5219=0.0;
bool l9_5220=l9_5217&&(!l9_5215);
float l9_5221=1.0;
float l9_5222=l9_5211.x;
int l9_5223=l9_5214.x;
if (l9_5223==1)
{
l9_5222=fract(l9_5222);
}
else
{
if (l9_5223==2)
{
float l9_5224=fract(l9_5222);
float l9_5225=l9_5222-l9_5224;
float l9_5226=step(0.25,fract(l9_5225*0.5));
l9_5222=mix(l9_5224,1.0-l9_5224,fast::clamp(l9_5226,0.0,1.0));
}
}
l9_5211.x=l9_5222;
float l9_5227=l9_5211.y;
int l9_5228=l9_5214.y;
if (l9_5228==1)
{
l9_5227=fract(l9_5227);
}
else
{
if (l9_5228==2)
{
float l9_5229=fract(l9_5227);
float l9_5230=l9_5227-l9_5229;
float l9_5231=step(0.25,fract(l9_5230*0.5));
l9_5227=mix(l9_5229,1.0-l9_5229,fast::clamp(l9_5231,0.0,1.0));
}
}
l9_5211.y=l9_5227;
if (l9_5215)
{
bool l9_5232=l9_5217;
bool l9_5233;
if (l9_5232)
{
l9_5233=l9_5214.x==3;
}
else
{
l9_5233=l9_5232;
}
float l9_5234=l9_5211.x;
float l9_5235=l9_5216.x;
float l9_5236=l9_5216.z;
bool l9_5237=l9_5233;
float l9_5238=l9_5221;
float l9_5239=fast::clamp(l9_5234,l9_5235,l9_5236);
float l9_5240=step(abs(l9_5234-l9_5239),9.9999997e-06);
l9_5238*=(l9_5240+((1.0-float(l9_5237))*(1.0-l9_5240)));
l9_5234=l9_5239;
l9_5211.x=l9_5234;
l9_5221=l9_5238;
bool l9_5241=l9_5217;
bool l9_5242;
if (l9_5241)
{
l9_5242=l9_5214.y==3;
}
else
{
l9_5242=l9_5241;
}
float l9_5243=l9_5211.y;
float l9_5244=l9_5216.y;
float l9_5245=l9_5216.w;
bool l9_5246=l9_5242;
float l9_5247=l9_5221;
float l9_5248=fast::clamp(l9_5243,l9_5244,l9_5245);
float l9_5249=step(abs(l9_5243-l9_5248),9.9999997e-06);
l9_5247*=(l9_5249+((1.0-float(l9_5246))*(1.0-l9_5249)));
l9_5243=l9_5248;
l9_5211.y=l9_5243;
l9_5221=l9_5247;
}
float2 l9_5250=l9_5211;
bool l9_5251=l9_5212;
float3x3 l9_5252=l9_5213;
if (l9_5251)
{
l9_5250=float2((l9_5252*float3(l9_5250,1.0)).xy);
}
float2 l9_5253=l9_5250;
float2 l9_5254=l9_5253;
float2 l9_5255=l9_5254;
l9_5211=l9_5255;
float l9_5256=l9_5211.x;
int l9_5257=l9_5214.x;
bool l9_5258=l9_5220;
float l9_5259=l9_5221;
if ((l9_5257==0)||(l9_5257==3))
{
float l9_5260=l9_5256;
float l9_5261=0.0;
float l9_5262=1.0;
bool l9_5263=l9_5258;
float l9_5264=l9_5259;
float l9_5265=fast::clamp(l9_5260,l9_5261,l9_5262);
float l9_5266=step(abs(l9_5260-l9_5265),9.9999997e-06);
l9_5264*=(l9_5266+((1.0-float(l9_5263))*(1.0-l9_5266)));
l9_5260=l9_5265;
l9_5256=l9_5260;
l9_5259=l9_5264;
}
l9_5211.x=l9_5256;
l9_5221=l9_5259;
float l9_5267=l9_5211.y;
int l9_5268=l9_5214.y;
bool l9_5269=l9_5220;
float l9_5270=l9_5221;
if ((l9_5268==0)||(l9_5268==3))
{
float l9_5271=l9_5267;
float l9_5272=0.0;
float l9_5273=1.0;
bool l9_5274=l9_5269;
float l9_5275=l9_5270;
float l9_5276=fast::clamp(l9_5271,l9_5272,l9_5273);
float l9_5277=step(abs(l9_5271-l9_5276),9.9999997e-06);
l9_5275*=(l9_5277+((1.0-float(l9_5274))*(1.0-l9_5277)));
l9_5271=l9_5276;
l9_5267=l9_5271;
l9_5270=l9_5275;
}
l9_5211.y=l9_5267;
l9_5221=l9_5270;
float2 l9_5278=l9_5211;
int l9_5279=l9_5209;
int l9_5280=l9_5210;
float l9_5281=l9_5219;
float2 l9_5282=l9_5278;
int l9_5283=l9_5279;
int l9_5284=l9_5280;
float3 l9_5285=float3(0.0);
if (l9_5283==0)
{
l9_5285=float3(l9_5282,0.0);
}
else
{
if (l9_5283==1)
{
l9_5285=float3(l9_5282.x,(l9_5282.y*0.5)+(0.5-(float(l9_5284)*0.5)),0.0);
}
else
{
l9_5285=float3(l9_5282,float(l9_5284));
}
}
float3 l9_5286=l9_5285;
float3 l9_5287=l9_5286;
float2 l9_5288=l9_5287.xy;
float l9_5289=l9_5281;
float4 l9_5290=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_5288,bias(l9_5289));
float4 l9_5291=l9_5290;
float4 l9_5292=l9_5291;
if (l9_5217)
{
l9_5292=mix(l9_5218,l9_5292,float4(l9_5221));
}
float4 l9_5293=l9_5292;
float4 l9_5294=l9_5293;
float3 l9_5295=(l9_5294.xyz*1.9921875)-float3(1.0);
l9_5294=float4(l9_5295.x,l9_5295.y,l9_5295.z,l9_5294.w);
l9_5201=l9_5294;
l9_4984=l9_5201.xyz;
l9_4987=l9_4984;
}
else
{
l9_4987=l9_4985;
}
l9_4983=l9_4987;
float3 l9_5296=float3(0.0);
float3 l9_5297=l9_4888.xyz;
float l9_5298=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_5299=l9_4983;
float l9_5300=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_5301=l9_5297;
float l9_5302=l9_5298;
float3 l9_5303=l9_5299;
float l9_5304=l9_5300;
float3 l9_5305=mix(float3(0.0,0.0,1.0),l9_5301,float3(l9_5302))+float3(0.0,0.0,1.0);
float3 l9_5306=mix(float3(0.0,0.0,1.0),l9_5303,float3(l9_5304))*float3(-1.0,-1.0,1.0);
float3 l9_5307=normalize((l9_5305*dot(l9_5305,l9_5306))-(l9_5306*l9_5305.z));
l9_5299=l9_5307;
float3 l9_5308=l9_5299;
l9_5296=l9_5308;
float3 l9_5309=float3(0.0);
l9_5309=l9_4674*l9_5296;
float3 l9_5310=float3(0.0);
float3 l9_5311=l9_5309;
float l9_5312=dot(l9_5311,l9_5311);
float l9_5313;
if (l9_5312>0.0)
{
l9_5313=1.0/sqrt(l9_5312);
}
else
{
l9_5313=0.0;
}
float l9_5314=l9_5313;
float3 l9_5315=l9_5311*l9_5314;
l9_5310=l9_5315;
l9_4667=l9_5310;
l9_4670=l9_4667;
}
else
{
float3 l9_5316=float3(0.0);
l9_5316=l9_4669.VertexNormal_WorldSpace;
float3 l9_5317=float3(0.0);
float3 l9_5318=l9_5316;
float l9_5319=dot(l9_5318,l9_5318);
float l9_5320;
if (l9_5319>0.0)
{
l9_5320=1.0/sqrt(l9_5319);
}
else
{
l9_5320=0.0;
}
float l9_5321=l9_5320;
float3 l9_5322=l9_5318*l9_5321;
l9_5317=l9_5322;
l9_4668=l9_5317;
l9_4670=l9_4668;
}
l9_4666=l9_4670;
float3 l9_5323=float3(0.0);
l9_5323=l9_4666;
float3 l9_5324=float3(0.0);
l9_5324=l9_5323;
float3 l9_5325=float3(0.0);
l9_5325=-l9_4664.ViewDirWS;
float l9_5326=0.0;
l9_5326=dot(l9_5324,l9_5325);
float l9_5327=0.0;
l9_5327=abs(l9_5326);
l9_4662=l9_5327;
l9_4665=l9_4662;
}
else
{
float3 l9_5328=float3(0.0);
float3 l9_5329=float3(0.0);
float3 l9_5330=float3(0.0);
ssGlobals l9_5331=l9_4664;
float3 l9_5332;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_5333=float3(0.0);
l9_5333=l9_5331.VertexTangent_WorldSpace;
float3 l9_5334=float3(0.0);
l9_5334=l9_5331.VertexBinormal_WorldSpace;
float3 l9_5335=float3(0.0);
l9_5335=l9_5331.VertexNormal_WorldSpace;
float3x3 l9_5336=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_5336=float3x3(float3(l9_5333),float3(l9_5334),float3(l9_5335));
float2 l9_5337=float2(0.0);
float2 l9_5338=float2(0.0);
float2 l9_5339=float2(0.0);
float2 l9_5340=float2(0.0);
float2 l9_5341=float2(0.0);
float2 l9_5342=float2(0.0);
ssGlobals l9_5343=l9_5331;
float2 l9_5344;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_5345=float2(0.0);
l9_5345=l9_5343.Surface_UVCoord0;
l9_5338=l9_5345;
l9_5344=l9_5338;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_5346=float2(0.0);
l9_5346=l9_5343.Surface_UVCoord1;
l9_5339=l9_5346;
l9_5344=l9_5339;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_5347=float2(0.0);
float2 l9_5348=float2(0.0);
float2 l9_5349=float2(0.0);
ssGlobals l9_5350=l9_5343;
float2 l9_5351;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5352=float2(0.0);
float2 l9_5353=float2(0.0);
float2 l9_5354=float2(0.0);
ssGlobals l9_5355=l9_5350;
float2 l9_5356;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5357=float2(0.0);
float2 l9_5358=float2(0.0);
float2 l9_5359=float2(0.0);
float2 l9_5360=float2(0.0);
float2 l9_5361=float2(0.0);
ssGlobals l9_5362=l9_5355;
float2 l9_5363;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5364=float2(0.0);
l9_5364=l9_5362.Surface_UVCoord0;
l9_5358=l9_5364;
l9_5363=l9_5358;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5365=float2(0.0);
l9_5365=l9_5362.Surface_UVCoord1;
l9_5359=l9_5365;
l9_5363=l9_5359;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5366=float2(0.0);
l9_5366=l9_5362.gScreenCoord;
l9_5360=l9_5366;
l9_5363=l9_5360;
}
else
{
float2 l9_5367=float2(0.0);
l9_5367=l9_5362.Surface_UVCoord0;
l9_5361=l9_5367;
l9_5363=l9_5361;
}
}
}
l9_5357=l9_5363;
float2 l9_5368=float2(0.0);
float2 l9_5369=(*sc_set0.UserUniforms).uv2Scale;
l9_5368=l9_5369;
float2 l9_5370=float2(0.0);
l9_5370=l9_5368;
float2 l9_5371=float2(0.0);
float2 l9_5372=(*sc_set0.UserUniforms).uv2Offset;
l9_5371=l9_5372;
float2 l9_5373=float2(0.0);
l9_5373=l9_5371;
float2 l9_5374=float2(0.0);
l9_5374=(l9_5357*l9_5370)+l9_5373;
float2 l9_5375=float2(0.0);
l9_5375=l9_5374+(l9_5373*(l9_5355.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5353=l9_5375;
l9_5356=l9_5353;
}
else
{
float2 l9_5376=float2(0.0);
float2 l9_5377=float2(0.0);
float2 l9_5378=float2(0.0);
float2 l9_5379=float2(0.0);
float2 l9_5380=float2(0.0);
ssGlobals l9_5381=l9_5355;
float2 l9_5382;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5383=float2(0.0);
l9_5383=l9_5381.Surface_UVCoord0;
l9_5377=l9_5383;
l9_5382=l9_5377;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5384=float2(0.0);
l9_5384=l9_5381.Surface_UVCoord1;
l9_5378=l9_5384;
l9_5382=l9_5378;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5385=float2(0.0);
l9_5385=l9_5381.gScreenCoord;
l9_5379=l9_5385;
l9_5382=l9_5379;
}
else
{
float2 l9_5386=float2(0.0);
l9_5386=l9_5381.Surface_UVCoord0;
l9_5380=l9_5386;
l9_5382=l9_5380;
}
}
}
l9_5376=l9_5382;
float2 l9_5387=float2(0.0);
float2 l9_5388=(*sc_set0.UserUniforms).uv2Scale;
l9_5387=l9_5388;
float2 l9_5389=float2(0.0);
l9_5389=l9_5387;
float2 l9_5390=float2(0.0);
float2 l9_5391=(*sc_set0.UserUniforms).uv2Offset;
l9_5390=l9_5391;
float2 l9_5392=float2(0.0);
l9_5392=l9_5390;
float2 l9_5393=float2(0.0);
l9_5393=(l9_5376*l9_5389)+l9_5392;
l9_5354=l9_5393;
l9_5356=l9_5354;
}
l9_5352=l9_5356;
l9_5348=l9_5352;
l9_5351=l9_5348;
}
else
{
float2 l9_5394=float2(0.0);
l9_5394=l9_5350.Surface_UVCoord0;
l9_5349=l9_5394;
l9_5351=l9_5349;
}
l9_5347=l9_5351;
float2 l9_5395=float2(0.0);
l9_5395=l9_5347;
float2 l9_5396=float2(0.0);
l9_5396=l9_5395;
l9_5340=l9_5396;
l9_5344=l9_5340;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_5397=float2(0.0);
float2 l9_5398=float2(0.0);
float2 l9_5399=float2(0.0);
ssGlobals l9_5400=l9_5343;
float2 l9_5401;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_5402=float2(0.0);
float2 l9_5403=float2(0.0);
float2 l9_5404=float2(0.0);
ssGlobals l9_5405=l9_5400;
float2 l9_5406;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_5407=float2(0.0);
float2 l9_5408=float2(0.0);
float2 l9_5409=float2(0.0);
float2 l9_5410=float2(0.0);
float2 l9_5411=float2(0.0);
float2 l9_5412=float2(0.0);
ssGlobals l9_5413=l9_5405;
float2 l9_5414;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5415=float2(0.0);
l9_5415=l9_5413.Surface_UVCoord0;
l9_5408=l9_5415;
l9_5414=l9_5408;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5416=float2(0.0);
l9_5416=l9_5413.Surface_UVCoord1;
l9_5409=l9_5416;
l9_5414=l9_5409;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5417=float2(0.0);
l9_5417=l9_5413.gScreenCoord;
l9_5410=l9_5417;
l9_5414=l9_5410;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5418=float2(0.0);
float2 l9_5419=float2(0.0);
float2 l9_5420=float2(0.0);
ssGlobals l9_5421=l9_5413;
float2 l9_5422;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5423=float2(0.0);
float2 l9_5424=float2(0.0);
float2 l9_5425=float2(0.0);
ssGlobals l9_5426=l9_5421;
float2 l9_5427;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5428=float2(0.0);
float2 l9_5429=float2(0.0);
float2 l9_5430=float2(0.0);
float2 l9_5431=float2(0.0);
float2 l9_5432=float2(0.0);
ssGlobals l9_5433=l9_5426;
float2 l9_5434;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5435=float2(0.0);
l9_5435=l9_5433.Surface_UVCoord0;
l9_5429=l9_5435;
l9_5434=l9_5429;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5436=float2(0.0);
l9_5436=l9_5433.Surface_UVCoord1;
l9_5430=l9_5436;
l9_5434=l9_5430;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5437=float2(0.0);
l9_5437=l9_5433.gScreenCoord;
l9_5431=l9_5437;
l9_5434=l9_5431;
}
else
{
float2 l9_5438=float2(0.0);
l9_5438=l9_5433.Surface_UVCoord0;
l9_5432=l9_5438;
l9_5434=l9_5432;
}
}
}
l9_5428=l9_5434;
float2 l9_5439=float2(0.0);
float2 l9_5440=(*sc_set0.UserUniforms).uv2Scale;
l9_5439=l9_5440;
float2 l9_5441=float2(0.0);
l9_5441=l9_5439;
float2 l9_5442=float2(0.0);
float2 l9_5443=(*sc_set0.UserUniforms).uv2Offset;
l9_5442=l9_5443;
float2 l9_5444=float2(0.0);
l9_5444=l9_5442;
float2 l9_5445=float2(0.0);
l9_5445=(l9_5428*l9_5441)+l9_5444;
float2 l9_5446=float2(0.0);
l9_5446=l9_5445+(l9_5444*(l9_5426.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5424=l9_5446;
l9_5427=l9_5424;
}
else
{
float2 l9_5447=float2(0.0);
float2 l9_5448=float2(0.0);
float2 l9_5449=float2(0.0);
float2 l9_5450=float2(0.0);
float2 l9_5451=float2(0.0);
ssGlobals l9_5452=l9_5426;
float2 l9_5453;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5454=float2(0.0);
l9_5454=l9_5452.Surface_UVCoord0;
l9_5448=l9_5454;
l9_5453=l9_5448;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5455=float2(0.0);
l9_5455=l9_5452.Surface_UVCoord1;
l9_5449=l9_5455;
l9_5453=l9_5449;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5456=float2(0.0);
l9_5456=l9_5452.gScreenCoord;
l9_5450=l9_5456;
l9_5453=l9_5450;
}
else
{
float2 l9_5457=float2(0.0);
l9_5457=l9_5452.Surface_UVCoord0;
l9_5451=l9_5457;
l9_5453=l9_5451;
}
}
}
l9_5447=l9_5453;
float2 l9_5458=float2(0.0);
float2 l9_5459=(*sc_set0.UserUniforms).uv2Scale;
l9_5458=l9_5459;
float2 l9_5460=float2(0.0);
l9_5460=l9_5458;
float2 l9_5461=float2(0.0);
float2 l9_5462=(*sc_set0.UserUniforms).uv2Offset;
l9_5461=l9_5462;
float2 l9_5463=float2(0.0);
l9_5463=l9_5461;
float2 l9_5464=float2(0.0);
l9_5464=(l9_5447*l9_5460)+l9_5463;
l9_5425=l9_5464;
l9_5427=l9_5425;
}
l9_5423=l9_5427;
l9_5419=l9_5423;
l9_5422=l9_5419;
}
else
{
float2 l9_5465=float2(0.0);
l9_5465=l9_5421.Surface_UVCoord0;
l9_5420=l9_5465;
l9_5422=l9_5420;
}
l9_5418=l9_5422;
float2 l9_5466=float2(0.0);
l9_5466=l9_5418;
float2 l9_5467=float2(0.0);
l9_5467=l9_5466;
l9_5411=l9_5467;
l9_5414=l9_5411;
}
else
{
float2 l9_5468=float2(0.0);
l9_5468=l9_5413.Surface_UVCoord0;
l9_5412=l9_5468;
l9_5414=l9_5412;
}
}
}
}
l9_5407=l9_5414;
float2 l9_5469=float2(0.0);
float2 l9_5470=(*sc_set0.UserUniforms).uv3Scale;
l9_5469=l9_5470;
float2 l9_5471=float2(0.0);
l9_5471=l9_5469;
float2 l9_5472=float2(0.0);
float2 l9_5473=(*sc_set0.UserUniforms).uv3Offset;
l9_5472=l9_5473;
float2 l9_5474=float2(0.0);
l9_5474=l9_5472;
float2 l9_5475=float2(0.0);
l9_5475=(l9_5407*l9_5471)+l9_5474;
float2 l9_5476=float2(0.0);
l9_5476=l9_5475+(l9_5474*(l9_5405.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5403=l9_5476;
l9_5406=l9_5403;
}
else
{
float2 l9_5477=float2(0.0);
float2 l9_5478=float2(0.0);
float2 l9_5479=float2(0.0);
float2 l9_5480=float2(0.0);
float2 l9_5481=float2(0.0);
float2 l9_5482=float2(0.0);
ssGlobals l9_5483=l9_5405;
float2 l9_5484;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5485=float2(0.0);
l9_5485=l9_5483.Surface_UVCoord0;
l9_5478=l9_5485;
l9_5484=l9_5478;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5486=float2(0.0);
l9_5486=l9_5483.Surface_UVCoord1;
l9_5479=l9_5486;
l9_5484=l9_5479;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5487=float2(0.0);
l9_5487=l9_5483.gScreenCoord;
l9_5480=l9_5487;
l9_5484=l9_5480;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5488=float2(0.0);
float2 l9_5489=float2(0.0);
float2 l9_5490=float2(0.0);
ssGlobals l9_5491=l9_5483;
float2 l9_5492;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5493=float2(0.0);
float2 l9_5494=float2(0.0);
float2 l9_5495=float2(0.0);
ssGlobals l9_5496=l9_5491;
float2 l9_5497;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5498=float2(0.0);
float2 l9_5499=float2(0.0);
float2 l9_5500=float2(0.0);
float2 l9_5501=float2(0.0);
float2 l9_5502=float2(0.0);
ssGlobals l9_5503=l9_5496;
float2 l9_5504;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5505=float2(0.0);
l9_5505=l9_5503.Surface_UVCoord0;
l9_5499=l9_5505;
l9_5504=l9_5499;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5506=float2(0.0);
l9_5506=l9_5503.Surface_UVCoord1;
l9_5500=l9_5506;
l9_5504=l9_5500;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5507=float2(0.0);
l9_5507=l9_5503.gScreenCoord;
l9_5501=l9_5507;
l9_5504=l9_5501;
}
else
{
float2 l9_5508=float2(0.0);
l9_5508=l9_5503.Surface_UVCoord0;
l9_5502=l9_5508;
l9_5504=l9_5502;
}
}
}
l9_5498=l9_5504;
float2 l9_5509=float2(0.0);
float2 l9_5510=(*sc_set0.UserUniforms).uv2Scale;
l9_5509=l9_5510;
float2 l9_5511=float2(0.0);
l9_5511=l9_5509;
float2 l9_5512=float2(0.0);
float2 l9_5513=(*sc_set0.UserUniforms).uv2Offset;
l9_5512=l9_5513;
float2 l9_5514=float2(0.0);
l9_5514=l9_5512;
float2 l9_5515=float2(0.0);
l9_5515=(l9_5498*l9_5511)+l9_5514;
float2 l9_5516=float2(0.0);
l9_5516=l9_5515+(l9_5514*(l9_5496.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5494=l9_5516;
l9_5497=l9_5494;
}
else
{
float2 l9_5517=float2(0.0);
float2 l9_5518=float2(0.0);
float2 l9_5519=float2(0.0);
float2 l9_5520=float2(0.0);
float2 l9_5521=float2(0.0);
ssGlobals l9_5522=l9_5496;
float2 l9_5523;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5524=float2(0.0);
l9_5524=l9_5522.Surface_UVCoord0;
l9_5518=l9_5524;
l9_5523=l9_5518;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5525=float2(0.0);
l9_5525=l9_5522.Surface_UVCoord1;
l9_5519=l9_5525;
l9_5523=l9_5519;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5526=float2(0.0);
l9_5526=l9_5522.gScreenCoord;
l9_5520=l9_5526;
l9_5523=l9_5520;
}
else
{
float2 l9_5527=float2(0.0);
l9_5527=l9_5522.Surface_UVCoord0;
l9_5521=l9_5527;
l9_5523=l9_5521;
}
}
}
l9_5517=l9_5523;
float2 l9_5528=float2(0.0);
float2 l9_5529=(*sc_set0.UserUniforms).uv2Scale;
l9_5528=l9_5529;
float2 l9_5530=float2(0.0);
l9_5530=l9_5528;
float2 l9_5531=float2(0.0);
float2 l9_5532=(*sc_set0.UserUniforms).uv2Offset;
l9_5531=l9_5532;
float2 l9_5533=float2(0.0);
l9_5533=l9_5531;
float2 l9_5534=float2(0.0);
l9_5534=(l9_5517*l9_5530)+l9_5533;
l9_5495=l9_5534;
l9_5497=l9_5495;
}
l9_5493=l9_5497;
l9_5489=l9_5493;
l9_5492=l9_5489;
}
else
{
float2 l9_5535=float2(0.0);
l9_5535=l9_5491.Surface_UVCoord0;
l9_5490=l9_5535;
l9_5492=l9_5490;
}
l9_5488=l9_5492;
float2 l9_5536=float2(0.0);
l9_5536=l9_5488;
float2 l9_5537=float2(0.0);
l9_5537=l9_5536;
l9_5481=l9_5537;
l9_5484=l9_5481;
}
else
{
float2 l9_5538=float2(0.0);
l9_5538=l9_5483.Surface_UVCoord0;
l9_5482=l9_5538;
l9_5484=l9_5482;
}
}
}
}
l9_5477=l9_5484;
float2 l9_5539=float2(0.0);
float2 l9_5540=(*sc_set0.UserUniforms).uv3Scale;
l9_5539=l9_5540;
float2 l9_5541=float2(0.0);
l9_5541=l9_5539;
float2 l9_5542=float2(0.0);
float2 l9_5543=(*sc_set0.UserUniforms).uv3Offset;
l9_5542=l9_5543;
float2 l9_5544=float2(0.0);
l9_5544=l9_5542;
float2 l9_5545=float2(0.0);
l9_5545=(l9_5477*l9_5541)+l9_5544;
l9_5404=l9_5545;
l9_5406=l9_5404;
}
l9_5402=l9_5406;
l9_5398=l9_5402;
l9_5401=l9_5398;
}
else
{
float2 l9_5546=float2(0.0);
l9_5546=l9_5400.Surface_UVCoord0;
l9_5399=l9_5546;
l9_5401=l9_5399;
}
l9_5397=l9_5401;
float2 l9_5547=float2(0.0);
l9_5547=l9_5397;
float2 l9_5548=float2(0.0);
l9_5548=l9_5547;
l9_5341=l9_5548;
l9_5344=l9_5341;
}
else
{
float2 l9_5549=float2(0.0);
l9_5549=l9_5343.Surface_UVCoord0;
l9_5342=l9_5549;
l9_5344=l9_5342;
}
}
}
}
l9_5337=l9_5344;
float4 l9_5550=float4(0.0);
float2 l9_5551=l9_5337;
int l9_5552=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_5553=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5553=0;
}
else
{
l9_5553=in.varStereoViewID;
}
int l9_5554=l9_5553;
l9_5552=1-l9_5554;
}
else
{
int l9_5555=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5555=0;
}
else
{
l9_5555=in.varStereoViewID;
}
int l9_5556=l9_5555;
l9_5552=l9_5556;
}
int l9_5557=l9_5552;
int l9_5558=normalTexLayout_tmp;
int l9_5559=l9_5557;
float2 l9_5560=l9_5551;
bool l9_5561=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_5562=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_5563=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_5564=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_5565=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_5566=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_5567=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_5568=0.0;
bool l9_5569=l9_5566&&(!l9_5564);
float l9_5570=1.0;
float l9_5571=l9_5560.x;
int l9_5572=l9_5563.x;
if (l9_5572==1)
{
l9_5571=fract(l9_5571);
}
else
{
if (l9_5572==2)
{
float l9_5573=fract(l9_5571);
float l9_5574=l9_5571-l9_5573;
float l9_5575=step(0.25,fract(l9_5574*0.5));
l9_5571=mix(l9_5573,1.0-l9_5573,fast::clamp(l9_5575,0.0,1.0));
}
}
l9_5560.x=l9_5571;
float l9_5576=l9_5560.y;
int l9_5577=l9_5563.y;
if (l9_5577==1)
{
l9_5576=fract(l9_5576);
}
else
{
if (l9_5577==2)
{
float l9_5578=fract(l9_5576);
float l9_5579=l9_5576-l9_5578;
float l9_5580=step(0.25,fract(l9_5579*0.5));
l9_5576=mix(l9_5578,1.0-l9_5578,fast::clamp(l9_5580,0.0,1.0));
}
}
l9_5560.y=l9_5576;
if (l9_5564)
{
bool l9_5581=l9_5566;
bool l9_5582;
if (l9_5581)
{
l9_5582=l9_5563.x==3;
}
else
{
l9_5582=l9_5581;
}
float l9_5583=l9_5560.x;
float l9_5584=l9_5565.x;
float l9_5585=l9_5565.z;
bool l9_5586=l9_5582;
float l9_5587=l9_5570;
float l9_5588=fast::clamp(l9_5583,l9_5584,l9_5585);
float l9_5589=step(abs(l9_5583-l9_5588),9.9999997e-06);
l9_5587*=(l9_5589+((1.0-float(l9_5586))*(1.0-l9_5589)));
l9_5583=l9_5588;
l9_5560.x=l9_5583;
l9_5570=l9_5587;
bool l9_5590=l9_5566;
bool l9_5591;
if (l9_5590)
{
l9_5591=l9_5563.y==3;
}
else
{
l9_5591=l9_5590;
}
float l9_5592=l9_5560.y;
float l9_5593=l9_5565.y;
float l9_5594=l9_5565.w;
bool l9_5595=l9_5591;
float l9_5596=l9_5570;
float l9_5597=fast::clamp(l9_5592,l9_5593,l9_5594);
float l9_5598=step(abs(l9_5592-l9_5597),9.9999997e-06);
l9_5596*=(l9_5598+((1.0-float(l9_5595))*(1.0-l9_5598)));
l9_5592=l9_5597;
l9_5560.y=l9_5592;
l9_5570=l9_5596;
}
float2 l9_5599=l9_5560;
bool l9_5600=l9_5561;
float3x3 l9_5601=l9_5562;
if (l9_5600)
{
l9_5599=float2((l9_5601*float3(l9_5599,1.0)).xy);
}
float2 l9_5602=l9_5599;
float2 l9_5603=l9_5602;
float2 l9_5604=l9_5603;
l9_5560=l9_5604;
float l9_5605=l9_5560.x;
int l9_5606=l9_5563.x;
bool l9_5607=l9_5569;
float l9_5608=l9_5570;
if ((l9_5606==0)||(l9_5606==3))
{
float l9_5609=l9_5605;
float l9_5610=0.0;
float l9_5611=1.0;
bool l9_5612=l9_5607;
float l9_5613=l9_5608;
float l9_5614=fast::clamp(l9_5609,l9_5610,l9_5611);
float l9_5615=step(abs(l9_5609-l9_5614),9.9999997e-06);
l9_5613*=(l9_5615+((1.0-float(l9_5612))*(1.0-l9_5615)));
l9_5609=l9_5614;
l9_5605=l9_5609;
l9_5608=l9_5613;
}
l9_5560.x=l9_5605;
l9_5570=l9_5608;
float l9_5616=l9_5560.y;
int l9_5617=l9_5563.y;
bool l9_5618=l9_5569;
float l9_5619=l9_5570;
if ((l9_5617==0)||(l9_5617==3))
{
float l9_5620=l9_5616;
float l9_5621=0.0;
float l9_5622=1.0;
bool l9_5623=l9_5618;
float l9_5624=l9_5619;
float l9_5625=fast::clamp(l9_5620,l9_5621,l9_5622);
float l9_5626=step(abs(l9_5620-l9_5625),9.9999997e-06);
l9_5624*=(l9_5626+((1.0-float(l9_5623))*(1.0-l9_5626)));
l9_5620=l9_5625;
l9_5616=l9_5620;
l9_5619=l9_5624;
}
l9_5560.y=l9_5616;
l9_5570=l9_5619;
float2 l9_5627=l9_5560;
int l9_5628=l9_5558;
int l9_5629=l9_5559;
float l9_5630=l9_5568;
float2 l9_5631=l9_5627;
int l9_5632=l9_5628;
int l9_5633=l9_5629;
float3 l9_5634=float3(0.0);
if (l9_5632==0)
{
l9_5634=float3(l9_5631,0.0);
}
else
{
if (l9_5632==1)
{
l9_5634=float3(l9_5631.x,(l9_5631.y*0.5)+(0.5-(float(l9_5633)*0.5)),0.0);
}
else
{
l9_5634=float3(l9_5631,float(l9_5633));
}
}
float3 l9_5635=l9_5634;
float3 l9_5636=l9_5635;
float2 l9_5637=l9_5636.xy;
float l9_5638=l9_5630;
float4 l9_5639=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_5637,bias(l9_5638));
float4 l9_5640=l9_5639;
float4 l9_5641=l9_5640;
if (l9_5566)
{
l9_5641=mix(l9_5567,l9_5641,float4(l9_5570));
}
float4 l9_5642=l9_5641;
float4 l9_5643=l9_5642;
float3 l9_5644=(l9_5643.xyz*1.9921875)-float3(1.0);
l9_5643=float4(l9_5644.x,l9_5644.y,l9_5644.z,l9_5643.w);
l9_5550=l9_5643;
float3 l9_5645=float3(0.0);
float3 l9_5646=float3(0.0);
float3 l9_5647=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_5648=l9_5331;
float3 l9_5649;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_5650=float2(0.0);
float2 l9_5651=float2(0.0);
float2 l9_5652=float2(0.0);
float2 l9_5653=float2(0.0);
float2 l9_5654=float2(0.0);
float2 l9_5655=float2(0.0);
ssGlobals l9_5656=l9_5648;
float2 l9_5657;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_5658=float2(0.0);
l9_5658=l9_5656.Surface_UVCoord0;
l9_5651=l9_5658;
l9_5657=l9_5651;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_5659=float2(0.0);
l9_5659=l9_5656.Surface_UVCoord1;
l9_5652=l9_5659;
l9_5657=l9_5652;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_5660=float2(0.0);
float2 l9_5661=float2(0.0);
float2 l9_5662=float2(0.0);
ssGlobals l9_5663=l9_5656;
float2 l9_5664;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5665=float2(0.0);
float2 l9_5666=float2(0.0);
float2 l9_5667=float2(0.0);
ssGlobals l9_5668=l9_5663;
float2 l9_5669;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5670=float2(0.0);
float2 l9_5671=float2(0.0);
float2 l9_5672=float2(0.0);
float2 l9_5673=float2(0.0);
float2 l9_5674=float2(0.0);
ssGlobals l9_5675=l9_5668;
float2 l9_5676;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5677=float2(0.0);
l9_5677=l9_5675.Surface_UVCoord0;
l9_5671=l9_5677;
l9_5676=l9_5671;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5678=float2(0.0);
l9_5678=l9_5675.Surface_UVCoord1;
l9_5672=l9_5678;
l9_5676=l9_5672;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5679=float2(0.0);
l9_5679=l9_5675.gScreenCoord;
l9_5673=l9_5679;
l9_5676=l9_5673;
}
else
{
float2 l9_5680=float2(0.0);
l9_5680=l9_5675.Surface_UVCoord0;
l9_5674=l9_5680;
l9_5676=l9_5674;
}
}
}
l9_5670=l9_5676;
float2 l9_5681=float2(0.0);
float2 l9_5682=(*sc_set0.UserUniforms).uv2Scale;
l9_5681=l9_5682;
float2 l9_5683=float2(0.0);
l9_5683=l9_5681;
float2 l9_5684=float2(0.0);
float2 l9_5685=(*sc_set0.UserUniforms).uv2Offset;
l9_5684=l9_5685;
float2 l9_5686=float2(0.0);
l9_5686=l9_5684;
float2 l9_5687=float2(0.0);
l9_5687=(l9_5670*l9_5683)+l9_5686;
float2 l9_5688=float2(0.0);
l9_5688=l9_5687+(l9_5686*(l9_5668.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5666=l9_5688;
l9_5669=l9_5666;
}
else
{
float2 l9_5689=float2(0.0);
float2 l9_5690=float2(0.0);
float2 l9_5691=float2(0.0);
float2 l9_5692=float2(0.0);
float2 l9_5693=float2(0.0);
ssGlobals l9_5694=l9_5668;
float2 l9_5695;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5696=float2(0.0);
l9_5696=l9_5694.Surface_UVCoord0;
l9_5690=l9_5696;
l9_5695=l9_5690;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5697=float2(0.0);
l9_5697=l9_5694.Surface_UVCoord1;
l9_5691=l9_5697;
l9_5695=l9_5691;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5698=float2(0.0);
l9_5698=l9_5694.gScreenCoord;
l9_5692=l9_5698;
l9_5695=l9_5692;
}
else
{
float2 l9_5699=float2(0.0);
l9_5699=l9_5694.Surface_UVCoord0;
l9_5693=l9_5699;
l9_5695=l9_5693;
}
}
}
l9_5689=l9_5695;
float2 l9_5700=float2(0.0);
float2 l9_5701=(*sc_set0.UserUniforms).uv2Scale;
l9_5700=l9_5701;
float2 l9_5702=float2(0.0);
l9_5702=l9_5700;
float2 l9_5703=float2(0.0);
float2 l9_5704=(*sc_set0.UserUniforms).uv2Offset;
l9_5703=l9_5704;
float2 l9_5705=float2(0.0);
l9_5705=l9_5703;
float2 l9_5706=float2(0.0);
l9_5706=(l9_5689*l9_5702)+l9_5705;
l9_5667=l9_5706;
l9_5669=l9_5667;
}
l9_5665=l9_5669;
l9_5661=l9_5665;
l9_5664=l9_5661;
}
else
{
float2 l9_5707=float2(0.0);
l9_5707=l9_5663.Surface_UVCoord0;
l9_5662=l9_5707;
l9_5664=l9_5662;
}
l9_5660=l9_5664;
float2 l9_5708=float2(0.0);
l9_5708=l9_5660;
float2 l9_5709=float2(0.0);
l9_5709=l9_5708;
l9_5653=l9_5709;
l9_5657=l9_5653;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_5710=float2(0.0);
float2 l9_5711=float2(0.0);
float2 l9_5712=float2(0.0);
ssGlobals l9_5713=l9_5656;
float2 l9_5714;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_5715=float2(0.0);
float2 l9_5716=float2(0.0);
float2 l9_5717=float2(0.0);
ssGlobals l9_5718=l9_5713;
float2 l9_5719;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_5720=float2(0.0);
float2 l9_5721=float2(0.0);
float2 l9_5722=float2(0.0);
float2 l9_5723=float2(0.0);
float2 l9_5724=float2(0.0);
float2 l9_5725=float2(0.0);
ssGlobals l9_5726=l9_5718;
float2 l9_5727;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5728=float2(0.0);
l9_5728=l9_5726.Surface_UVCoord0;
l9_5721=l9_5728;
l9_5727=l9_5721;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5729=float2(0.0);
l9_5729=l9_5726.Surface_UVCoord1;
l9_5722=l9_5729;
l9_5727=l9_5722;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5730=float2(0.0);
l9_5730=l9_5726.gScreenCoord;
l9_5723=l9_5730;
l9_5727=l9_5723;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5731=float2(0.0);
float2 l9_5732=float2(0.0);
float2 l9_5733=float2(0.0);
ssGlobals l9_5734=l9_5726;
float2 l9_5735;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5736=float2(0.0);
float2 l9_5737=float2(0.0);
float2 l9_5738=float2(0.0);
ssGlobals l9_5739=l9_5734;
float2 l9_5740;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5741=float2(0.0);
float2 l9_5742=float2(0.0);
float2 l9_5743=float2(0.0);
float2 l9_5744=float2(0.0);
float2 l9_5745=float2(0.0);
ssGlobals l9_5746=l9_5739;
float2 l9_5747;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5748=float2(0.0);
l9_5748=l9_5746.Surface_UVCoord0;
l9_5742=l9_5748;
l9_5747=l9_5742;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5749=float2(0.0);
l9_5749=l9_5746.Surface_UVCoord1;
l9_5743=l9_5749;
l9_5747=l9_5743;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5750=float2(0.0);
l9_5750=l9_5746.gScreenCoord;
l9_5744=l9_5750;
l9_5747=l9_5744;
}
else
{
float2 l9_5751=float2(0.0);
l9_5751=l9_5746.Surface_UVCoord0;
l9_5745=l9_5751;
l9_5747=l9_5745;
}
}
}
l9_5741=l9_5747;
float2 l9_5752=float2(0.0);
float2 l9_5753=(*sc_set0.UserUniforms).uv2Scale;
l9_5752=l9_5753;
float2 l9_5754=float2(0.0);
l9_5754=l9_5752;
float2 l9_5755=float2(0.0);
float2 l9_5756=(*sc_set0.UserUniforms).uv2Offset;
l9_5755=l9_5756;
float2 l9_5757=float2(0.0);
l9_5757=l9_5755;
float2 l9_5758=float2(0.0);
l9_5758=(l9_5741*l9_5754)+l9_5757;
float2 l9_5759=float2(0.0);
l9_5759=l9_5758+(l9_5757*(l9_5739.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5737=l9_5759;
l9_5740=l9_5737;
}
else
{
float2 l9_5760=float2(0.0);
float2 l9_5761=float2(0.0);
float2 l9_5762=float2(0.0);
float2 l9_5763=float2(0.0);
float2 l9_5764=float2(0.0);
ssGlobals l9_5765=l9_5739;
float2 l9_5766;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5767=float2(0.0);
l9_5767=l9_5765.Surface_UVCoord0;
l9_5761=l9_5767;
l9_5766=l9_5761;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5768=float2(0.0);
l9_5768=l9_5765.Surface_UVCoord1;
l9_5762=l9_5768;
l9_5766=l9_5762;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5769=float2(0.0);
l9_5769=l9_5765.gScreenCoord;
l9_5763=l9_5769;
l9_5766=l9_5763;
}
else
{
float2 l9_5770=float2(0.0);
l9_5770=l9_5765.Surface_UVCoord0;
l9_5764=l9_5770;
l9_5766=l9_5764;
}
}
}
l9_5760=l9_5766;
float2 l9_5771=float2(0.0);
float2 l9_5772=(*sc_set0.UserUniforms).uv2Scale;
l9_5771=l9_5772;
float2 l9_5773=float2(0.0);
l9_5773=l9_5771;
float2 l9_5774=float2(0.0);
float2 l9_5775=(*sc_set0.UserUniforms).uv2Offset;
l9_5774=l9_5775;
float2 l9_5776=float2(0.0);
l9_5776=l9_5774;
float2 l9_5777=float2(0.0);
l9_5777=(l9_5760*l9_5773)+l9_5776;
l9_5738=l9_5777;
l9_5740=l9_5738;
}
l9_5736=l9_5740;
l9_5732=l9_5736;
l9_5735=l9_5732;
}
else
{
float2 l9_5778=float2(0.0);
l9_5778=l9_5734.Surface_UVCoord0;
l9_5733=l9_5778;
l9_5735=l9_5733;
}
l9_5731=l9_5735;
float2 l9_5779=float2(0.0);
l9_5779=l9_5731;
float2 l9_5780=float2(0.0);
l9_5780=l9_5779;
l9_5724=l9_5780;
l9_5727=l9_5724;
}
else
{
float2 l9_5781=float2(0.0);
l9_5781=l9_5726.Surface_UVCoord0;
l9_5725=l9_5781;
l9_5727=l9_5725;
}
}
}
}
l9_5720=l9_5727;
float2 l9_5782=float2(0.0);
float2 l9_5783=(*sc_set0.UserUniforms).uv3Scale;
l9_5782=l9_5783;
float2 l9_5784=float2(0.0);
l9_5784=l9_5782;
float2 l9_5785=float2(0.0);
float2 l9_5786=(*sc_set0.UserUniforms).uv3Offset;
l9_5785=l9_5786;
float2 l9_5787=float2(0.0);
l9_5787=l9_5785;
float2 l9_5788=float2(0.0);
l9_5788=(l9_5720*l9_5784)+l9_5787;
float2 l9_5789=float2(0.0);
l9_5789=l9_5788+(l9_5787*(l9_5718.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5716=l9_5789;
l9_5719=l9_5716;
}
else
{
float2 l9_5790=float2(0.0);
float2 l9_5791=float2(0.0);
float2 l9_5792=float2(0.0);
float2 l9_5793=float2(0.0);
float2 l9_5794=float2(0.0);
float2 l9_5795=float2(0.0);
ssGlobals l9_5796=l9_5718;
float2 l9_5797;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5798=float2(0.0);
l9_5798=l9_5796.Surface_UVCoord0;
l9_5791=l9_5798;
l9_5797=l9_5791;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5799=float2(0.0);
l9_5799=l9_5796.Surface_UVCoord1;
l9_5792=l9_5799;
l9_5797=l9_5792;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5800=float2(0.0);
l9_5800=l9_5796.gScreenCoord;
l9_5793=l9_5800;
l9_5797=l9_5793;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5801=float2(0.0);
float2 l9_5802=float2(0.0);
float2 l9_5803=float2(0.0);
ssGlobals l9_5804=l9_5796;
float2 l9_5805;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_5806=float2(0.0);
float2 l9_5807=float2(0.0);
float2 l9_5808=float2(0.0);
ssGlobals l9_5809=l9_5804;
float2 l9_5810;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5811=float2(0.0);
float2 l9_5812=float2(0.0);
float2 l9_5813=float2(0.0);
float2 l9_5814=float2(0.0);
float2 l9_5815=float2(0.0);
ssGlobals l9_5816=l9_5809;
float2 l9_5817;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5818=float2(0.0);
l9_5818=l9_5816.Surface_UVCoord0;
l9_5812=l9_5818;
l9_5817=l9_5812;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5819=float2(0.0);
l9_5819=l9_5816.Surface_UVCoord1;
l9_5813=l9_5819;
l9_5817=l9_5813;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5820=float2(0.0);
l9_5820=l9_5816.gScreenCoord;
l9_5814=l9_5820;
l9_5817=l9_5814;
}
else
{
float2 l9_5821=float2(0.0);
l9_5821=l9_5816.Surface_UVCoord0;
l9_5815=l9_5821;
l9_5817=l9_5815;
}
}
}
l9_5811=l9_5817;
float2 l9_5822=float2(0.0);
float2 l9_5823=(*sc_set0.UserUniforms).uv2Scale;
l9_5822=l9_5823;
float2 l9_5824=float2(0.0);
l9_5824=l9_5822;
float2 l9_5825=float2(0.0);
float2 l9_5826=(*sc_set0.UserUniforms).uv2Offset;
l9_5825=l9_5826;
float2 l9_5827=float2(0.0);
l9_5827=l9_5825;
float2 l9_5828=float2(0.0);
l9_5828=(l9_5811*l9_5824)+l9_5827;
float2 l9_5829=float2(0.0);
l9_5829=l9_5828+(l9_5827*(l9_5809.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5807=l9_5829;
l9_5810=l9_5807;
}
else
{
float2 l9_5830=float2(0.0);
float2 l9_5831=float2(0.0);
float2 l9_5832=float2(0.0);
float2 l9_5833=float2(0.0);
float2 l9_5834=float2(0.0);
ssGlobals l9_5835=l9_5809;
float2 l9_5836;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5837=float2(0.0);
l9_5837=l9_5835.Surface_UVCoord0;
l9_5831=l9_5837;
l9_5836=l9_5831;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5838=float2(0.0);
l9_5838=l9_5835.Surface_UVCoord1;
l9_5832=l9_5838;
l9_5836=l9_5832;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5839=float2(0.0);
l9_5839=l9_5835.gScreenCoord;
l9_5833=l9_5839;
l9_5836=l9_5833;
}
else
{
float2 l9_5840=float2(0.0);
l9_5840=l9_5835.Surface_UVCoord0;
l9_5834=l9_5840;
l9_5836=l9_5834;
}
}
}
l9_5830=l9_5836;
float2 l9_5841=float2(0.0);
float2 l9_5842=(*sc_set0.UserUniforms).uv2Scale;
l9_5841=l9_5842;
float2 l9_5843=float2(0.0);
l9_5843=l9_5841;
float2 l9_5844=float2(0.0);
float2 l9_5845=(*sc_set0.UserUniforms).uv2Offset;
l9_5844=l9_5845;
float2 l9_5846=float2(0.0);
l9_5846=l9_5844;
float2 l9_5847=float2(0.0);
l9_5847=(l9_5830*l9_5843)+l9_5846;
l9_5808=l9_5847;
l9_5810=l9_5808;
}
l9_5806=l9_5810;
l9_5802=l9_5806;
l9_5805=l9_5802;
}
else
{
float2 l9_5848=float2(0.0);
l9_5848=l9_5804.Surface_UVCoord0;
l9_5803=l9_5848;
l9_5805=l9_5803;
}
l9_5801=l9_5805;
float2 l9_5849=float2(0.0);
l9_5849=l9_5801;
float2 l9_5850=float2(0.0);
l9_5850=l9_5849;
l9_5794=l9_5850;
l9_5797=l9_5794;
}
else
{
float2 l9_5851=float2(0.0);
l9_5851=l9_5796.Surface_UVCoord0;
l9_5795=l9_5851;
l9_5797=l9_5795;
}
}
}
}
l9_5790=l9_5797;
float2 l9_5852=float2(0.0);
float2 l9_5853=(*sc_set0.UserUniforms).uv3Scale;
l9_5852=l9_5853;
float2 l9_5854=float2(0.0);
l9_5854=l9_5852;
float2 l9_5855=float2(0.0);
float2 l9_5856=(*sc_set0.UserUniforms).uv3Offset;
l9_5855=l9_5856;
float2 l9_5857=float2(0.0);
l9_5857=l9_5855;
float2 l9_5858=float2(0.0);
l9_5858=(l9_5790*l9_5854)+l9_5857;
l9_5717=l9_5858;
l9_5719=l9_5717;
}
l9_5715=l9_5719;
l9_5711=l9_5715;
l9_5714=l9_5711;
}
else
{
float2 l9_5859=float2(0.0);
l9_5859=l9_5713.Surface_UVCoord0;
l9_5712=l9_5859;
l9_5714=l9_5712;
}
l9_5710=l9_5714;
float2 l9_5860=float2(0.0);
l9_5860=l9_5710;
float2 l9_5861=float2(0.0);
l9_5861=l9_5860;
l9_5654=l9_5861;
l9_5657=l9_5654;
}
else
{
float2 l9_5862=float2(0.0);
l9_5862=l9_5656.Surface_UVCoord0;
l9_5655=l9_5862;
l9_5657=l9_5655;
}
}
}
}
l9_5650=l9_5657;
float4 l9_5863=float4(0.0);
float2 l9_5864=l9_5650;
int l9_5865=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_5866=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5866=0;
}
else
{
l9_5866=in.varStereoViewID;
}
int l9_5867=l9_5866;
l9_5865=1-l9_5867;
}
else
{
int l9_5868=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5868=0;
}
else
{
l9_5868=in.varStereoViewID;
}
int l9_5869=l9_5868;
l9_5865=l9_5869;
}
int l9_5870=l9_5865;
int l9_5871=detailNormalTexLayout_tmp;
int l9_5872=l9_5870;
float2 l9_5873=l9_5864;
bool l9_5874=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_5875=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_5876=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_5877=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_5878=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_5879=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_5880=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_5881=0.0;
bool l9_5882=l9_5879&&(!l9_5877);
float l9_5883=1.0;
float l9_5884=l9_5873.x;
int l9_5885=l9_5876.x;
if (l9_5885==1)
{
l9_5884=fract(l9_5884);
}
else
{
if (l9_5885==2)
{
float l9_5886=fract(l9_5884);
float l9_5887=l9_5884-l9_5886;
float l9_5888=step(0.25,fract(l9_5887*0.5));
l9_5884=mix(l9_5886,1.0-l9_5886,fast::clamp(l9_5888,0.0,1.0));
}
}
l9_5873.x=l9_5884;
float l9_5889=l9_5873.y;
int l9_5890=l9_5876.y;
if (l9_5890==1)
{
l9_5889=fract(l9_5889);
}
else
{
if (l9_5890==2)
{
float l9_5891=fract(l9_5889);
float l9_5892=l9_5889-l9_5891;
float l9_5893=step(0.25,fract(l9_5892*0.5));
l9_5889=mix(l9_5891,1.0-l9_5891,fast::clamp(l9_5893,0.0,1.0));
}
}
l9_5873.y=l9_5889;
if (l9_5877)
{
bool l9_5894=l9_5879;
bool l9_5895;
if (l9_5894)
{
l9_5895=l9_5876.x==3;
}
else
{
l9_5895=l9_5894;
}
float l9_5896=l9_5873.x;
float l9_5897=l9_5878.x;
float l9_5898=l9_5878.z;
bool l9_5899=l9_5895;
float l9_5900=l9_5883;
float l9_5901=fast::clamp(l9_5896,l9_5897,l9_5898);
float l9_5902=step(abs(l9_5896-l9_5901),9.9999997e-06);
l9_5900*=(l9_5902+((1.0-float(l9_5899))*(1.0-l9_5902)));
l9_5896=l9_5901;
l9_5873.x=l9_5896;
l9_5883=l9_5900;
bool l9_5903=l9_5879;
bool l9_5904;
if (l9_5903)
{
l9_5904=l9_5876.y==3;
}
else
{
l9_5904=l9_5903;
}
float l9_5905=l9_5873.y;
float l9_5906=l9_5878.y;
float l9_5907=l9_5878.w;
bool l9_5908=l9_5904;
float l9_5909=l9_5883;
float l9_5910=fast::clamp(l9_5905,l9_5906,l9_5907);
float l9_5911=step(abs(l9_5905-l9_5910),9.9999997e-06);
l9_5909*=(l9_5911+((1.0-float(l9_5908))*(1.0-l9_5911)));
l9_5905=l9_5910;
l9_5873.y=l9_5905;
l9_5883=l9_5909;
}
float2 l9_5912=l9_5873;
bool l9_5913=l9_5874;
float3x3 l9_5914=l9_5875;
if (l9_5913)
{
l9_5912=float2((l9_5914*float3(l9_5912,1.0)).xy);
}
float2 l9_5915=l9_5912;
float2 l9_5916=l9_5915;
float2 l9_5917=l9_5916;
l9_5873=l9_5917;
float l9_5918=l9_5873.x;
int l9_5919=l9_5876.x;
bool l9_5920=l9_5882;
float l9_5921=l9_5883;
if ((l9_5919==0)||(l9_5919==3))
{
float l9_5922=l9_5918;
float l9_5923=0.0;
float l9_5924=1.0;
bool l9_5925=l9_5920;
float l9_5926=l9_5921;
float l9_5927=fast::clamp(l9_5922,l9_5923,l9_5924);
float l9_5928=step(abs(l9_5922-l9_5927),9.9999997e-06);
l9_5926*=(l9_5928+((1.0-float(l9_5925))*(1.0-l9_5928)));
l9_5922=l9_5927;
l9_5918=l9_5922;
l9_5921=l9_5926;
}
l9_5873.x=l9_5918;
l9_5883=l9_5921;
float l9_5929=l9_5873.y;
int l9_5930=l9_5876.y;
bool l9_5931=l9_5882;
float l9_5932=l9_5883;
if ((l9_5930==0)||(l9_5930==3))
{
float l9_5933=l9_5929;
float l9_5934=0.0;
float l9_5935=1.0;
bool l9_5936=l9_5931;
float l9_5937=l9_5932;
float l9_5938=fast::clamp(l9_5933,l9_5934,l9_5935);
float l9_5939=step(abs(l9_5933-l9_5938),9.9999997e-06);
l9_5937*=(l9_5939+((1.0-float(l9_5936))*(1.0-l9_5939)));
l9_5933=l9_5938;
l9_5929=l9_5933;
l9_5932=l9_5937;
}
l9_5873.y=l9_5929;
l9_5883=l9_5932;
float2 l9_5940=l9_5873;
int l9_5941=l9_5871;
int l9_5942=l9_5872;
float l9_5943=l9_5881;
float2 l9_5944=l9_5940;
int l9_5945=l9_5941;
int l9_5946=l9_5942;
float3 l9_5947=float3(0.0);
if (l9_5945==0)
{
l9_5947=float3(l9_5944,0.0);
}
else
{
if (l9_5945==1)
{
l9_5947=float3(l9_5944.x,(l9_5944.y*0.5)+(0.5-(float(l9_5946)*0.5)),0.0);
}
else
{
l9_5947=float3(l9_5944,float(l9_5946));
}
}
float3 l9_5948=l9_5947;
float3 l9_5949=l9_5948;
float2 l9_5950=l9_5949.xy;
float l9_5951=l9_5943;
float4 l9_5952=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_5950,bias(l9_5951));
float4 l9_5953=l9_5952;
float4 l9_5954=l9_5953;
if (l9_5879)
{
l9_5954=mix(l9_5880,l9_5954,float4(l9_5883));
}
float4 l9_5955=l9_5954;
float4 l9_5956=l9_5955;
float3 l9_5957=(l9_5956.xyz*1.9921875)-float3(1.0);
l9_5956=float4(l9_5957.x,l9_5957.y,l9_5957.z,l9_5956.w);
l9_5863=l9_5956;
l9_5646=l9_5863.xyz;
l9_5649=l9_5646;
}
else
{
l9_5649=l9_5647;
}
l9_5645=l9_5649;
float3 l9_5958=float3(0.0);
float3 l9_5959=l9_5550.xyz;
float l9_5960=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_5961=l9_5645;
float l9_5962=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_5963=l9_5959;
float l9_5964=l9_5960;
float3 l9_5965=l9_5961;
float l9_5966=l9_5962;
float3 l9_5967=mix(float3(0.0,0.0,1.0),l9_5963,float3(l9_5964))+float3(0.0,0.0,1.0);
float3 l9_5968=mix(float3(0.0,0.0,1.0),l9_5965,float3(l9_5966))*float3(-1.0,-1.0,1.0);
float3 l9_5969=normalize((l9_5967*dot(l9_5967,l9_5968))-(l9_5968*l9_5967.z));
l9_5961=l9_5969;
float3 l9_5970=l9_5961;
l9_5958=l9_5970;
float3 l9_5971=float3(0.0);
l9_5971=l9_5336*l9_5958;
float3 l9_5972=float3(0.0);
float3 l9_5973=l9_5971;
float l9_5974=dot(l9_5973,l9_5973);
float l9_5975;
if (l9_5974>0.0)
{
l9_5975=1.0/sqrt(l9_5974);
}
else
{
l9_5975=0.0;
}
float l9_5976=l9_5975;
float3 l9_5977=l9_5973*l9_5976;
l9_5972=l9_5977;
l9_5329=l9_5972;
l9_5332=l9_5329;
}
else
{
float3 l9_5978=float3(0.0);
l9_5978=l9_5331.VertexNormal_WorldSpace;
float3 l9_5979=float3(0.0);
float3 l9_5980=l9_5978;
float l9_5981=dot(l9_5980,l9_5980);
float l9_5982;
if (l9_5981>0.0)
{
l9_5982=1.0/sqrt(l9_5981);
}
else
{
l9_5982=0.0;
}
float l9_5983=l9_5982;
float3 l9_5984=l9_5980*l9_5983;
l9_5979=l9_5984;
l9_5330=l9_5979;
l9_5332=l9_5330;
}
l9_5328=l9_5332;
float3 l9_5985=float3(0.0);
l9_5985=l9_5328;
float3 l9_5986=float3(0.0);
l9_5986=l9_5985;
float3 l9_5987=float3(0.0);
l9_5987=-l9_4664.ViewDirWS;
float l9_5988=0.0;
l9_5988=dot(l9_5986,l9_5987);
float l9_5989=0.0;
l9_5989=abs(l9_5988);
float l9_5990=0.0;
l9_5990=1.0-l9_5989;
l9_4663=l9_5990;
l9_4665=l9_4663;
}
l9_4661=l9_4665;
float l9_5991=0.0;
float l9_5992=(*sc_set0.UserUniforms).rimExponent;
l9_5991=l9_5992;
float l9_5993=0.0;
l9_5993=l9_5991;
float l9_5994=0.0;
float l9_5995;
if (l9_4661<=0.0)
{
l9_5995=0.0;
}
else
{
l9_5995=pow(l9_4661,l9_5993);
}
l9_5994=l9_5995;
float3 l9_5996=float3(0.0);
l9_5996=l9_4657*float3(l9_5994);
param_29=l9_5996;
param_31=param_29;
}
else
{
param_31=param_30;
}
Result_N173=param_31;
float3 Export_N347=float3(0.0);
Export_N347=Result_N173;
float3 Value_N306=float3(0.0);
Value_N306=Export_N347;
float3 Output_N299=float3(0.0);
Output_N299=(Result_N103+Value_N298)+Value_N306;
float3 Output_N251=float3(0.0);
float3 param_33=Output_N299;
float3 l9_5997;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_5997=float3(pow(param_33.x,0.45454544),pow(param_33.y,0.45454544),pow(param_33.z,0.45454544));
}
else
{
l9_5997=sqrt(param_33);
}
float3 l9_5998=l9_5997;
Output_N251=l9_5998;
float3 Export_N300=float3(0.0);
Export_N300=Output_N251;
float Output_N242=0.0;
float param_34=(*sc_set0.UserUniforms).metallic;
Output_N242=param_34;
float Value_N277=0.0;
Value_N277=Output_N242;
float2 Result_N176=float2(0.0);
float2 param_35=float2(0.0);
float2 param_36=float2(0.0);
float2 param_37=float2(0.0);
float2 param_38=float2(0.0);
float2 param_39=float2(0.0);
ssGlobals param_41=Globals;
float2 param_40;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_5999=float2(0.0);
l9_5999=param_41.Surface_UVCoord0;
param_35=l9_5999;
param_40=param_35;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6000=float2(0.0);
l9_6000=param_41.Surface_UVCoord1;
param_36=l9_6000;
param_40=param_36;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6001=float2(0.0);
float2 l9_6002=float2(0.0);
float2 l9_6003=float2(0.0);
ssGlobals l9_6004=param_41;
float2 l9_6005;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6006=float2(0.0);
float2 l9_6007=float2(0.0);
float2 l9_6008=float2(0.0);
ssGlobals l9_6009=l9_6004;
float2 l9_6010;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6011=float2(0.0);
float2 l9_6012=float2(0.0);
float2 l9_6013=float2(0.0);
float2 l9_6014=float2(0.0);
float2 l9_6015=float2(0.0);
ssGlobals l9_6016=l9_6009;
float2 l9_6017;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6018=float2(0.0);
l9_6018=l9_6016.Surface_UVCoord0;
l9_6012=l9_6018;
l9_6017=l9_6012;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6019=float2(0.0);
l9_6019=l9_6016.Surface_UVCoord1;
l9_6013=l9_6019;
l9_6017=l9_6013;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6020=float2(0.0);
l9_6020=l9_6016.gScreenCoord;
l9_6014=l9_6020;
l9_6017=l9_6014;
}
else
{
float2 l9_6021=float2(0.0);
l9_6021=l9_6016.Surface_UVCoord0;
l9_6015=l9_6021;
l9_6017=l9_6015;
}
}
}
l9_6011=l9_6017;
float2 l9_6022=float2(0.0);
float2 l9_6023=(*sc_set0.UserUniforms).uv2Scale;
l9_6022=l9_6023;
float2 l9_6024=float2(0.0);
l9_6024=l9_6022;
float2 l9_6025=float2(0.0);
float2 l9_6026=(*sc_set0.UserUniforms).uv2Offset;
l9_6025=l9_6026;
float2 l9_6027=float2(0.0);
l9_6027=l9_6025;
float2 l9_6028=float2(0.0);
l9_6028=(l9_6011*l9_6024)+l9_6027;
float2 l9_6029=float2(0.0);
l9_6029=l9_6028+(l9_6027*(l9_6009.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6007=l9_6029;
l9_6010=l9_6007;
}
else
{
float2 l9_6030=float2(0.0);
float2 l9_6031=float2(0.0);
float2 l9_6032=float2(0.0);
float2 l9_6033=float2(0.0);
float2 l9_6034=float2(0.0);
ssGlobals l9_6035=l9_6009;
float2 l9_6036;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6037=float2(0.0);
l9_6037=l9_6035.Surface_UVCoord0;
l9_6031=l9_6037;
l9_6036=l9_6031;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6038=float2(0.0);
l9_6038=l9_6035.Surface_UVCoord1;
l9_6032=l9_6038;
l9_6036=l9_6032;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6039=float2(0.0);
l9_6039=l9_6035.gScreenCoord;
l9_6033=l9_6039;
l9_6036=l9_6033;
}
else
{
float2 l9_6040=float2(0.0);
l9_6040=l9_6035.Surface_UVCoord0;
l9_6034=l9_6040;
l9_6036=l9_6034;
}
}
}
l9_6030=l9_6036;
float2 l9_6041=float2(0.0);
float2 l9_6042=(*sc_set0.UserUniforms).uv2Scale;
l9_6041=l9_6042;
float2 l9_6043=float2(0.0);
l9_6043=l9_6041;
float2 l9_6044=float2(0.0);
float2 l9_6045=(*sc_set0.UserUniforms).uv2Offset;
l9_6044=l9_6045;
float2 l9_6046=float2(0.0);
l9_6046=l9_6044;
float2 l9_6047=float2(0.0);
l9_6047=(l9_6030*l9_6043)+l9_6046;
l9_6008=l9_6047;
l9_6010=l9_6008;
}
l9_6006=l9_6010;
l9_6002=l9_6006;
l9_6005=l9_6002;
}
else
{
float2 l9_6048=float2(0.0);
l9_6048=l9_6004.Surface_UVCoord0;
l9_6003=l9_6048;
l9_6005=l9_6003;
}
l9_6001=l9_6005;
float2 l9_6049=float2(0.0);
l9_6049=l9_6001;
float2 l9_6050=float2(0.0);
l9_6050=l9_6049;
param_37=l9_6050;
param_40=param_37;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6051=float2(0.0);
float2 l9_6052=float2(0.0);
float2 l9_6053=float2(0.0);
ssGlobals l9_6054=param_41;
float2 l9_6055;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_6056=float2(0.0);
float2 l9_6057=float2(0.0);
float2 l9_6058=float2(0.0);
ssGlobals l9_6059=l9_6054;
float2 l9_6060;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_6061=float2(0.0);
float2 l9_6062=float2(0.0);
float2 l9_6063=float2(0.0);
float2 l9_6064=float2(0.0);
float2 l9_6065=float2(0.0);
float2 l9_6066=float2(0.0);
ssGlobals l9_6067=l9_6059;
float2 l9_6068;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6069=float2(0.0);
l9_6069=l9_6067.Surface_UVCoord0;
l9_6062=l9_6069;
l9_6068=l9_6062;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6070=float2(0.0);
l9_6070=l9_6067.Surface_UVCoord1;
l9_6063=l9_6070;
l9_6068=l9_6063;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6071=float2(0.0);
l9_6071=l9_6067.gScreenCoord;
l9_6064=l9_6071;
l9_6068=l9_6064;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6072=float2(0.0);
float2 l9_6073=float2(0.0);
float2 l9_6074=float2(0.0);
ssGlobals l9_6075=l9_6067;
float2 l9_6076;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6077=float2(0.0);
float2 l9_6078=float2(0.0);
float2 l9_6079=float2(0.0);
ssGlobals l9_6080=l9_6075;
float2 l9_6081;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6082=float2(0.0);
float2 l9_6083=float2(0.0);
float2 l9_6084=float2(0.0);
float2 l9_6085=float2(0.0);
float2 l9_6086=float2(0.0);
ssGlobals l9_6087=l9_6080;
float2 l9_6088;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6089=float2(0.0);
l9_6089=l9_6087.Surface_UVCoord0;
l9_6083=l9_6089;
l9_6088=l9_6083;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6090=float2(0.0);
l9_6090=l9_6087.Surface_UVCoord1;
l9_6084=l9_6090;
l9_6088=l9_6084;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6091=float2(0.0);
l9_6091=l9_6087.gScreenCoord;
l9_6085=l9_6091;
l9_6088=l9_6085;
}
else
{
float2 l9_6092=float2(0.0);
l9_6092=l9_6087.Surface_UVCoord0;
l9_6086=l9_6092;
l9_6088=l9_6086;
}
}
}
l9_6082=l9_6088;
float2 l9_6093=float2(0.0);
float2 l9_6094=(*sc_set0.UserUniforms).uv2Scale;
l9_6093=l9_6094;
float2 l9_6095=float2(0.0);
l9_6095=l9_6093;
float2 l9_6096=float2(0.0);
float2 l9_6097=(*sc_set0.UserUniforms).uv2Offset;
l9_6096=l9_6097;
float2 l9_6098=float2(0.0);
l9_6098=l9_6096;
float2 l9_6099=float2(0.0);
l9_6099=(l9_6082*l9_6095)+l9_6098;
float2 l9_6100=float2(0.0);
l9_6100=l9_6099+(l9_6098*(l9_6080.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6078=l9_6100;
l9_6081=l9_6078;
}
else
{
float2 l9_6101=float2(0.0);
float2 l9_6102=float2(0.0);
float2 l9_6103=float2(0.0);
float2 l9_6104=float2(0.0);
float2 l9_6105=float2(0.0);
ssGlobals l9_6106=l9_6080;
float2 l9_6107;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6108=float2(0.0);
l9_6108=l9_6106.Surface_UVCoord0;
l9_6102=l9_6108;
l9_6107=l9_6102;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6109=float2(0.0);
l9_6109=l9_6106.Surface_UVCoord1;
l9_6103=l9_6109;
l9_6107=l9_6103;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6110=float2(0.0);
l9_6110=l9_6106.gScreenCoord;
l9_6104=l9_6110;
l9_6107=l9_6104;
}
else
{
float2 l9_6111=float2(0.0);
l9_6111=l9_6106.Surface_UVCoord0;
l9_6105=l9_6111;
l9_6107=l9_6105;
}
}
}
l9_6101=l9_6107;
float2 l9_6112=float2(0.0);
float2 l9_6113=(*sc_set0.UserUniforms).uv2Scale;
l9_6112=l9_6113;
float2 l9_6114=float2(0.0);
l9_6114=l9_6112;
float2 l9_6115=float2(0.0);
float2 l9_6116=(*sc_set0.UserUniforms).uv2Offset;
l9_6115=l9_6116;
float2 l9_6117=float2(0.0);
l9_6117=l9_6115;
float2 l9_6118=float2(0.0);
l9_6118=(l9_6101*l9_6114)+l9_6117;
l9_6079=l9_6118;
l9_6081=l9_6079;
}
l9_6077=l9_6081;
l9_6073=l9_6077;
l9_6076=l9_6073;
}
else
{
float2 l9_6119=float2(0.0);
l9_6119=l9_6075.Surface_UVCoord0;
l9_6074=l9_6119;
l9_6076=l9_6074;
}
l9_6072=l9_6076;
float2 l9_6120=float2(0.0);
l9_6120=l9_6072;
float2 l9_6121=float2(0.0);
l9_6121=l9_6120;
l9_6065=l9_6121;
l9_6068=l9_6065;
}
else
{
float2 l9_6122=float2(0.0);
l9_6122=l9_6067.Surface_UVCoord0;
l9_6066=l9_6122;
l9_6068=l9_6066;
}
}
}
}
l9_6061=l9_6068;
float2 l9_6123=float2(0.0);
float2 l9_6124=(*sc_set0.UserUniforms).uv3Scale;
l9_6123=l9_6124;
float2 l9_6125=float2(0.0);
l9_6125=l9_6123;
float2 l9_6126=float2(0.0);
float2 l9_6127=(*sc_set0.UserUniforms).uv3Offset;
l9_6126=l9_6127;
float2 l9_6128=float2(0.0);
l9_6128=l9_6126;
float2 l9_6129=float2(0.0);
l9_6129=(l9_6061*l9_6125)+l9_6128;
float2 l9_6130=float2(0.0);
l9_6130=l9_6129+(l9_6128*(l9_6059.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6057=l9_6130;
l9_6060=l9_6057;
}
else
{
float2 l9_6131=float2(0.0);
float2 l9_6132=float2(0.0);
float2 l9_6133=float2(0.0);
float2 l9_6134=float2(0.0);
float2 l9_6135=float2(0.0);
float2 l9_6136=float2(0.0);
ssGlobals l9_6137=l9_6059;
float2 l9_6138;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6139=float2(0.0);
l9_6139=l9_6137.Surface_UVCoord0;
l9_6132=l9_6139;
l9_6138=l9_6132;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6140=float2(0.0);
l9_6140=l9_6137.Surface_UVCoord1;
l9_6133=l9_6140;
l9_6138=l9_6133;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6141=float2(0.0);
l9_6141=l9_6137.gScreenCoord;
l9_6134=l9_6141;
l9_6138=l9_6134;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6142=float2(0.0);
float2 l9_6143=float2(0.0);
float2 l9_6144=float2(0.0);
ssGlobals l9_6145=l9_6137;
float2 l9_6146;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6147=float2(0.0);
float2 l9_6148=float2(0.0);
float2 l9_6149=float2(0.0);
ssGlobals l9_6150=l9_6145;
float2 l9_6151;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6152=float2(0.0);
float2 l9_6153=float2(0.0);
float2 l9_6154=float2(0.0);
float2 l9_6155=float2(0.0);
float2 l9_6156=float2(0.0);
ssGlobals l9_6157=l9_6150;
float2 l9_6158;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6159=float2(0.0);
l9_6159=l9_6157.Surface_UVCoord0;
l9_6153=l9_6159;
l9_6158=l9_6153;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6160=float2(0.0);
l9_6160=l9_6157.Surface_UVCoord1;
l9_6154=l9_6160;
l9_6158=l9_6154;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6161=float2(0.0);
l9_6161=l9_6157.gScreenCoord;
l9_6155=l9_6161;
l9_6158=l9_6155;
}
else
{
float2 l9_6162=float2(0.0);
l9_6162=l9_6157.Surface_UVCoord0;
l9_6156=l9_6162;
l9_6158=l9_6156;
}
}
}
l9_6152=l9_6158;
float2 l9_6163=float2(0.0);
float2 l9_6164=(*sc_set0.UserUniforms).uv2Scale;
l9_6163=l9_6164;
float2 l9_6165=float2(0.0);
l9_6165=l9_6163;
float2 l9_6166=float2(0.0);
float2 l9_6167=(*sc_set0.UserUniforms).uv2Offset;
l9_6166=l9_6167;
float2 l9_6168=float2(0.0);
l9_6168=l9_6166;
float2 l9_6169=float2(0.0);
l9_6169=(l9_6152*l9_6165)+l9_6168;
float2 l9_6170=float2(0.0);
l9_6170=l9_6169+(l9_6168*(l9_6150.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6148=l9_6170;
l9_6151=l9_6148;
}
else
{
float2 l9_6171=float2(0.0);
float2 l9_6172=float2(0.0);
float2 l9_6173=float2(0.0);
float2 l9_6174=float2(0.0);
float2 l9_6175=float2(0.0);
ssGlobals l9_6176=l9_6150;
float2 l9_6177;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6178=float2(0.0);
l9_6178=l9_6176.Surface_UVCoord0;
l9_6172=l9_6178;
l9_6177=l9_6172;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6179=float2(0.0);
l9_6179=l9_6176.Surface_UVCoord1;
l9_6173=l9_6179;
l9_6177=l9_6173;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6180=float2(0.0);
l9_6180=l9_6176.gScreenCoord;
l9_6174=l9_6180;
l9_6177=l9_6174;
}
else
{
float2 l9_6181=float2(0.0);
l9_6181=l9_6176.Surface_UVCoord0;
l9_6175=l9_6181;
l9_6177=l9_6175;
}
}
}
l9_6171=l9_6177;
float2 l9_6182=float2(0.0);
float2 l9_6183=(*sc_set0.UserUniforms).uv2Scale;
l9_6182=l9_6183;
float2 l9_6184=float2(0.0);
l9_6184=l9_6182;
float2 l9_6185=float2(0.0);
float2 l9_6186=(*sc_set0.UserUniforms).uv2Offset;
l9_6185=l9_6186;
float2 l9_6187=float2(0.0);
l9_6187=l9_6185;
float2 l9_6188=float2(0.0);
l9_6188=(l9_6171*l9_6184)+l9_6187;
l9_6149=l9_6188;
l9_6151=l9_6149;
}
l9_6147=l9_6151;
l9_6143=l9_6147;
l9_6146=l9_6143;
}
else
{
float2 l9_6189=float2(0.0);
l9_6189=l9_6145.Surface_UVCoord0;
l9_6144=l9_6189;
l9_6146=l9_6144;
}
l9_6142=l9_6146;
float2 l9_6190=float2(0.0);
l9_6190=l9_6142;
float2 l9_6191=float2(0.0);
l9_6191=l9_6190;
l9_6135=l9_6191;
l9_6138=l9_6135;
}
else
{
float2 l9_6192=float2(0.0);
l9_6192=l9_6137.Surface_UVCoord0;
l9_6136=l9_6192;
l9_6138=l9_6136;
}
}
}
}
l9_6131=l9_6138;
float2 l9_6193=float2(0.0);
float2 l9_6194=(*sc_set0.UserUniforms).uv3Scale;
l9_6193=l9_6194;
float2 l9_6195=float2(0.0);
l9_6195=l9_6193;
float2 l9_6196=float2(0.0);
float2 l9_6197=(*sc_set0.UserUniforms).uv3Offset;
l9_6196=l9_6197;
float2 l9_6198=float2(0.0);
l9_6198=l9_6196;
float2 l9_6199=float2(0.0);
l9_6199=(l9_6131*l9_6195)+l9_6198;
l9_6058=l9_6199;
l9_6060=l9_6058;
}
l9_6056=l9_6060;
l9_6052=l9_6056;
l9_6055=l9_6052;
}
else
{
float2 l9_6200=float2(0.0);
l9_6200=l9_6054.Surface_UVCoord0;
l9_6053=l9_6200;
l9_6055=l9_6053;
}
l9_6051=l9_6055;
float2 l9_6201=float2(0.0);
l9_6201=l9_6051;
float2 l9_6202=float2(0.0);
l9_6202=l9_6201;
param_38=l9_6202;
param_40=param_38;
}
else
{
float2 l9_6203=float2(0.0);
l9_6203=param_41.Surface_UVCoord0;
param_39=l9_6203;
param_40=param_39;
}
}
}
}
Result_N176=param_40;
float4 Color_N66=float4(0.0);
int l9_6204=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_6205=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6205=0;
}
else
{
l9_6205=in.varStereoViewID;
}
int l9_6206=l9_6205;
l9_6204=1-l9_6206;
}
else
{
int l9_6207=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6207=0;
}
else
{
l9_6207=in.varStereoViewID;
}
int l9_6208=l9_6207;
l9_6204=l9_6208;
}
int l9_6209=l9_6204;
int param_42=materialParamsTexLayout_tmp;
int param_43=l9_6209;
float2 param_44=Result_N176;
bool param_45=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_46=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 param_47=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_48=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_49=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool param_50=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_51=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float param_52=0.0;
bool l9_6210=param_50&&(!param_48);
float l9_6211=1.0;
float l9_6212=param_44.x;
int l9_6213=param_47.x;
if (l9_6213==1)
{
l9_6212=fract(l9_6212);
}
else
{
if (l9_6213==2)
{
float l9_6214=fract(l9_6212);
float l9_6215=l9_6212-l9_6214;
float l9_6216=step(0.25,fract(l9_6215*0.5));
l9_6212=mix(l9_6214,1.0-l9_6214,fast::clamp(l9_6216,0.0,1.0));
}
}
param_44.x=l9_6212;
float l9_6217=param_44.y;
int l9_6218=param_47.y;
if (l9_6218==1)
{
l9_6217=fract(l9_6217);
}
else
{
if (l9_6218==2)
{
float l9_6219=fract(l9_6217);
float l9_6220=l9_6217-l9_6219;
float l9_6221=step(0.25,fract(l9_6220*0.5));
l9_6217=mix(l9_6219,1.0-l9_6219,fast::clamp(l9_6221,0.0,1.0));
}
}
param_44.y=l9_6217;
if (param_48)
{
bool l9_6222=param_50;
bool l9_6223;
if (l9_6222)
{
l9_6223=param_47.x==3;
}
else
{
l9_6223=l9_6222;
}
float l9_6224=param_44.x;
float l9_6225=param_49.x;
float l9_6226=param_49.z;
bool l9_6227=l9_6223;
float l9_6228=l9_6211;
float l9_6229=fast::clamp(l9_6224,l9_6225,l9_6226);
float l9_6230=step(abs(l9_6224-l9_6229),9.9999997e-06);
l9_6228*=(l9_6230+((1.0-float(l9_6227))*(1.0-l9_6230)));
l9_6224=l9_6229;
param_44.x=l9_6224;
l9_6211=l9_6228;
bool l9_6231=param_50;
bool l9_6232;
if (l9_6231)
{
l9_6232=param_47.y==3;
}
else
{
l9_6232=l9_6231;
}
float l9_6233=param_44.y;
float l9_6234=param_49.y;
float l9_6235=param_49.w;
bool l9_6236=l9_6232;
float l9_6237=l9_6211;
float l9_6238=fast::clamp(l9_6233,l9_6234,l9_6235);
float l9_6239=step(abs(l9_6233-l9_6238),9.9999997e-06);
l9_6237*=(l9_6239+((1.0-float(l9_6236))*(1.0-l9_6239)));
l9_6233=l9_6238;
param_44.y=l9_6233;
l9_6211=l9_6237;
}
float2 l9_6240=param_44;
bool l9_6241=param_45;
float3x3 l9_6242=param_46;
if (l9_6241)
{
l9_6240=float2((l9_6242*float3(l9_6240,1.0)).xy);
}
float2 l9_6243=l9_6240;
float2 l9_6244=l9_6243;
float2 l9_6245=l9_6244;
param_44=l9_6245;
float l9_6246=param_44.x;
int l9_6247=param_47.x;
bool l9_6248=l9_6210;
float l9_6249=l9_6211;
if ((l9_6247==0)||(l9_6247==3))
{
float l9_6250=l9_6246;
float l9_6251=0.0;
float l9_6252=1.0;
bool l9_6253=l9_6248;
float l9_6254=l9_6249;
float l9_6255=fast::clamp(l9_6250,l9_6251,l9_6252);
float l9_6256=step(abs(l9_6250-l9_6255),9.9999997e-06);
l9_6254*=(l9_6256+((1.0-float(l9_6253))*(1.0-l9_6256)));
l9_6250=l9_6255;
l9_6246=l9_6250;
l9_6249=l9_6254;
}
param_44.x=l9_6246;
l9_6211=l9_6249;
float l9_6257=param_44.y;
int l9_6258=param_47.y;
bool l9_6259=l9_6210;
float l9_6260=l9_6211;
if ((l9_6258==0)||(l9_6258==3))
{
float l9_6261=l9_6257;
float l9_6262=0.0;
float l9_6263=1.0;
bool l9_6264=l9_6259;
float l9_6265=l9_6260;
float l9_6266=fast::clamp(l9_6261,l9_6262,l9_6263);
float l9_6267=step(abs(l9_6261-l9_6266),9.9999997e-06);
l9_6265*=(l9_6267+((1.0-float(l9_6264))*(1.0-l9_6267)));
l9_6261=l9_6266;
l9_6257=l9_6261;
l9_6260=l9_6265;
}
param_44.y=l9_6257;
l9_6211=l9_6260;
float2 l9_6268=param_44;
int l9_6269=param_42;
int l9_6270=param_43;
float l9_6271=param_52;
float2 l9_6272=l9_6268;
int l9_6273=l9_6269;
int l9_6274=l9_6270;
float3 l9_6275=float3(0.0);
if (l9_6273==0)
{
l9_6275=float3(l9_6272,0.0);
}
else
{
if (l9_6273==1)
{
l9_6275=float3(l9_6272.x,(l9_6272.y*0.5)+(0.5-(float(l9_6274)*0.5)),0.0);
}
else
{
l9_6275=float3(l9_6272,float(l9_6274));
}
}
float3 l9_6276=l9_6275;
float3 l9_6277=l9_6276;
float2 l9_6278=l9_6277.xy;
float l9_6279=l9_6271;
float4 l9_6280=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_6278,bias(l9_6279));
float4 l9_6281=l9_6280;
float4 l9_6282=l9_6281;
if (param_50)
{
l9_6282=mix(param_51,l9_6282,float4(l9_6211));
}
float4 l9_6283=l9_6282;
Color_N66=l9_6283;
float Value1_N304=0.0;
float Value2_N304=0.0;
float2 param_53=Color_N66.xy;
float param_54=param_53.x;
float param_55=param_53.y;
Value1_N304=param_54;
Value2_N304=param_55;
float Output_N317=0.0;
Output_N317=Value_N277*Value1_N304;
float Export_N222=0.0;
Export_N222=Output_N317;
float Output_N243=0.0;
float param_56=(*sc_set0.UserUniforms).roughness;
Output_N243=param_56;
float Value_N278=0.0;
Value_N278=Output_N243;
float Output_N313=0.0;
Output_N313=Value_N278*Value2_N304;
float Export_N224=0.0;
Export_N224=Output_N313;
float3 Result_N188=float3(0.0);
float3 param_57=float3(0.0);
float3 param_58=float3(0.0);
ssGlobals param_60=Globals;
float3 param_59;
if (NODE_38_DROPLIST_ITEM_tmp==3)
{
float4 l9_6284=float4(0.0);
l9_6284=param_60.VertexColor;
float2 l9_6285=float2(0.0);
float2 l9_6286=float2(0.0);
float2 l9_6287=float2(0.0);
float2 l9_6288=float2(0.0);
float2 l9_6289=float2(0.0);
float2 l9_6290=float2(0.0);
ssGlobals l9_6291=param_60;
float2 l9_6292;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6293=float2(0.0);
l9_6293=l9_6291.Surface_UVCoord0;
l9_6286=l9_6293;
l9_6292=l9_6286;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6294=float2(0.0);
l9_6294=l9_6291.Surface_UVCoord1;
l9_6287=l9_6294;
l9_6292=l9_6287;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6295=float2(0.0);
float2 l9_6296=float2(0.0);
float2 l9_6297=float2(0.0);
ssGlobals l9_6298=l9_6291;
float2 l9_6299;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6300=float2(0.0);
float2 l9_6301=float2(0.0);
float2 l9_6302=float2(0.0);
ssGlobals l9_6303=l9_6298;
float2 l9_6304;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6305=float2(0.0);
float2 l9_6306=float2(0.0);
float2 l9_6307=float2(0.0);
float2 l9_6308=float2(0.0);
float2 l9_6309=float2(0.0);
ssGlobals l9_6310=l9_6303;
float2 l9_6311;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6312=float2(0.0);
l9_6312=l9_6310.Surface_UVCoord0;
l9_6306=l9_6312;
l9_6311=l9_6306;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6313=float2(0.0);
l9_6313=l9_6310.Surface_UVCoord1;
l9_6307=l9_6313;
l9_6311=l9_6307;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6314=float2(0.0);
l9_6314=l9_6310.gScreenCoord;
l9_6308=l9_6314;
l9_6311=l9_6308;
}
else
{
float2 l9_6315=float2(0.0);
l9_6315=l9_6310.Surface_UVCoord0;
l9_6309=l9_6315;
l9_6311=l9_6309;
}
}
}
l9_6305=l9_6311;
float2 l9_6316=float2(0.0);
float2 l9_6317=(*sc_set0.UserUniforms).uv2Scale;
l9_6316=l9_6317;
float2 l9_6318=float2(0.0);
l9_6318=l9_6316;
float2 l9_6319=float2(0.0);
float2 l9_6320=(*sc_set0.UserUniforms).uv2Offset;
l9_6319=l9_6320;
float2 l9_6321=float2(0.0);
l9_6321=l9_6319;
float2 l9_6322=float2(0.0);
l9_6322=(l9_6305*l9_6318)+l9_6321;
float2 l9_6323=float2(0.0);
l9_6323=l9_6322+(l9_6321*(l9_6303.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6301=l9_6323;
l9_6304=l9_6301;
}
else
{
float2 l9_6324=float2(0.0);
float2 l9_6325=float2(0.0);
float2 l9_6326=float2(0.0);
float2 l9_6327=float2(0.0);
float2 l9_6328=float2(0.0);
ssGlobals l9_6329=l9_6303;
float2 l9_6330;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6331=float2(0.0);
l9_6331=l9_6329.Surface_UVCoord0;
l9_6325=l9_6331;
l9_6330=l9_6325;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6332=float2(0.0);
l9_6332=l9_6329.Surface_UVCoord1;
l9_6326=l9_6332;
l9_6330=l9_6326;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6333=float2(0.0);
l9_6333=l9_6329.gScreenCoord;
l9_6327=l9_6333;
l9_6330=l9_6327;
}
else
{
float2 l9_6334=float2(0.0);
l9_6334=l9_6329.Surface_UVCoord0;
l9_6328=l9_6334;
l9_6330=l9_6328;
}
}
}
l9_6324=l9_6330;
float2 l9_6335=float2(0.0);
float2 l9_6336=(*sc_set0.UserUniforms).uv2Scale;
l9_6335=l9_6336;
float2 l9_6337=float2(0.0);
l9_6337=l9_6335;
float2 l9_6338=float2(0.0);
float2 l9_6339=(*sc_set0.UserUniforms).uv2Offset;
l9_6338=l9_6339;
float2 l9_6340=float2(0.0);
l9_6340=l9_6338;
float2 l9_6341=float2(0.0);
l9_6341=(l9_6324*l9_6337)+l9_6340;
l9_6302=l9_6341;
l9_6304=l9_6302;
}
l9_6300=l9_6304;
l9_6296=l9_6300;
l9_6299=l9_6296;
}
else
{
float2 l9_6342=float2(0.0);
l9_6342=l9_6298.Surface_UVCoord0;
l9_6297=l9_6342;
l9_6299=l9_6297;
}
l9_6295=l9_6299;
float2 l9_6343=float2(0.0);
l9_6343=l9_6295;
float2 l9_6344=float2(0.0);
l9_6344=l9_6343;
l9_6288=l9_6344;
l9_6292=l9_6288;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6345=float2(0.0);
float2 l9_6346=float2(0.0);
float2 l9_6347=float2(0.0);
ssGlobals l9_6348=l9_6291;
float2 l9_6349;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_6350=float2(0.0);
float2 l9_6351=float2(0.0);
float2 l9_6352=float2(0.0);
ssGlobals l9_6353=l9_6348;
float2 l9_6354;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_6355=float2(0.0);
float2 l9_6356=float2(0.0);
float2 l9_6357=float2(0.0);
float2 l9_6358=float2(0.0);
float2 l9_6359=float2(0.0);
float2 l9_6360=float2(0.0);
ssGlobals l9_6361=l9_6353;
float2 l9_6362;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6363=float2(0.0);
l9_6363=l9_6361.Surface_UVCoord0;
l9_6356=l9_6363;
l9_6362=l9_6356;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6364=float2(0.0);
l9_6364=l9_6361.Surface_UVCoord1;
l9_6357=l9_6364;
l9_6362=l9_6357;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6365=float2(0.0);
l9_6365=l9_6361.gScreenCoord;
l9_6358=l9_6365;
l9_6362=l9_6358;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6366=float2(0.0);
float2 l9_6367=float2(0.0);
float2 l9_6368=float2(0.0);
ssGlobals l9_6369=l9_6361;
float2 l9_6370;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6371=float2(0.0);
float2 l9_6372=float2(0.0);
float2 l9_6373=float2(0.0);
ssGlobals l9_6374=l9_6369;
float2 l9_6375;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6376=float2(0.0);
float2 l9_6377=float2(0.0);
float2 l9_6378=float2(0.0);
float2 l9_6379=float2(0.0);
float2 l9_6380=float2(0.0);
ssGlobals l9_6381=l9_6374;
float2 l9_6382;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6383=float2(0.0);
l9_6383=l9_6381.Surface_UVCoord0;
l9_6377=l9_6383;
l9_6382=l9_6377;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6384=float2(0.0);
l9_6384=l9_6381.Surface_UVCoord1;
l9_6378=l9_6384;
l9_6382=l9_6378;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6385=float2(0.0);
l9_6385=l9_6381.gScreenCoord;
l9_6379=l9_6385;
l9_6382=l9_6379;
}
else
{
float2 l9_6386=float2(0.0);
l9_6386=l9_6381.Surface_UVCoord0;
l9_6380=l9_6386;
l9_6382=l9_6380;
}
}
}
l9_6376=l9_6382;
float2 l9_6387=float2(0.0);
float2 l9_6388=(*sc_set0.UserUniforms).uv2Scale;
l9_6387=l9_6388;
float2 l9_6389=float2(0.0);
l9_6389=l9_6387;
float2 l9_6390=float2(0.0);
float2 l9_6391=(*sc_set0.UserUniforms).uv2Offset;
l9_6390=l9_6391;
float2 l9_6392=float2(0.0);
l9_6392=l9_6390;
float2 l9_6393=float2(0.0);
l9_6393=(l9_6376*l9_6389)+l9_6392;
float2 l9_6394=float2(0.0);
l9_6394=l9_6393+(l9_6392*(l9_6374.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6372=l9_6394;
l9_6375=l9_6372;
}
else
{
float2 l9_6395=float2(0.0);
float2 l9_6396=float2(0.0);
float2 l9_6397=float2(0.0);
float2 l9_6398=float2(0.0);
float2 l9_6399=float2(0.0);
ssGlobals l9_6400=l9_6374;
float2 l9_6401;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6402=float2(0.0);
l9_6402=l9_6400.Surface_UVCoord0;
l9_6396=l9_6402;
l9_6401=l9_6396;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6403=float2(0.0);
l9_6403=l9_6400.Surface_UVCoord1;
l9_6397=l9_6403;
l9_6401=l9_6397;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6404=float2(0.0);
l9_6404=l9_6400.gScreenCoord;
l9_6398=l9_6404;
l9_6401=l9_6398;
}
else
{
float2 l9_6405=float2(0.0);
l9_6405=l9_6400.Surface_UVCoord0;
l9_6399=l9_6405;
l9_6401=l9_6399;
}
}
}
l9_6395=l9_6401;
float2 l9_6406=float2(0.0);
float2 l9_6407=(*sc_set0.UserUniforms).uv2Scale;
l9_6406=l9_6407;
float2 l9_6408=float2(0.0);
l9_6408=l9_6406;
float2 l9_6409=float2(0.0);
float2 l9_6410=(*sc_set0.UserUniforms).uv2Offset;
l9_6409=l9_6410;
float2 l9_6411=float2(0.0);
l9_6411=l9_6409;
float2 l9_6412=float2(0.0);
l9_6412=(l9_6395*l9_6408)+l9_6411;
l9_6373=l9_6412;
l9_6375=l9_6373;
}
l9_6371=l9_6375;
l9_6367=l9_6371;
l9_6370=l9_6367;
}
else
{
float2 l9_6413=float2(0.0);
l9_6413=l9_6369.Surface_UVCoord0;
l9_6368=l9_6413;
l9_6370=l9_6368;
}
l9_6366=l9_6370;
float2 l9_6414=float2(0.0);
l9_6414=l9_6366;
float2 l9_6415=float2(0.0);
l9_6415=l9_6414;
l9_6359=l9_6415;
l9_6362=l9_6359;
}
else
{
float2 l9_6416=float2(0.0);
l9_6416=l9_6361.Surface_UVCoord0;
l9_6360=l9_6416;
l9_6362=l9_6360;
}
}
}
}
l9_6355=l9_6362;
float2 l9_6417=float2(0.0);
float2 l9_6418=(*sc_set0.UserUniforms).uv3Scale;
l9_6417=l9_6418;
float2 l9_6419=float2(0.0);
l9_6419=l9_6417;
float2 l9_6420=float2(0.0);
float2 l9_6421=(*sc_set0.UserUniforms).uv3Offset;
l9_6420=l9_6421;
float2 l9_6422=float2(0.0);
l9_6422=l9_6420;
float2 l9_6423=float2(0.0);
l9_6423=(l9_6355*l9_6419)+l9_6422;
float2 l9_6424=float2(0.0);
l9_6424=l9_6423+(l9_6422*(l9_6353.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6351=l9_6424;
l9_6354=l9_6351;
}
else
{
float2 l9_6425=float2(0.0);
float2 l9_6426=float2(0.0);
float2 l9_6427=float2(0.0);
float2 l9_6428=float2(0.0);
float2 l9_6429=float2(0.0);
float2 l9_6430=float2(0.0);
ssGlobals l9_6431=l9_6353;
float2 l9_6432;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6433=float2(0.0);
l9_6433=l9_6431.Surface_UVCoord0;
l9_6426=l9_6433;
l9_6432=l9_6426;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6434=float2(0.0);
l9_6434=l9_6431.Surface_UVCoord1;
l9_6427=l9_6434;
l9_6432=l9_6427;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6435=float2(0.0);
l9_6435=l9_6431.gScreenCoord;
l9_6428=l9_6435;
l9_6432=l9_6428;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6436=float2(0.0);
float2 l9_6437=float2(0.0);
float2 l9_6438=float2(0.0);
ssGlobals l9_6439=l9_6431;
float2 l9_6440;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6441=float2(0.0);
float2 l9_6442=float2(0.0);
float2 l9_6443=float2(0.0);
ssGlobals l9_6444=l9_6439;
float2 l9_6445;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6446=float2(0.0);
float2 l9_6447=float2(0.0);
float2 l9_6448=float2(0.0);
float2 l9_6449=float2(0.0);
float2 l9_6450=float2(0.0);
ssGlobals l9_6451=l9_6444;
float2 l9_6452;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6453=float2(0.0);
l9_6453=l9_6451.Surface_UVCoord0;
l9_6447=l9_6453;
l9_6452=l9_6447;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6454=float2(0.0);
l9_6454=l9_6451.Surface_UVCoord1;
l9_6448=l9_6454;
l9_6452=l9_6448;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6455=float2(0.0);
l9_6455=l9_6451.gScreenCoord;
l9_6449=l9_6455;
l9_6452=l9_6449;
}
else
{
float2 l9_6456=float2(0.0);
l9_6456=l9_6451.Surface_UVCoord0;
l9_6450=l9_6456;
l9_6452=l9_6450;
}
}
}
l9_6446=l9_6452;
float2 l9_6457=float2(0.0);
float2 l9_6458=(*sc_set0.UserUniforms).uv2Scale;
l9_6457=l9_6458;
float2 l9_6459=float2(0.0);
l9_6459=l9_6457;
float2 l9_6460=float2(0.0);
float2 l9_6461=(*sc_set0.UserUniforms).uv2Offset;
l9_6460=l9_6461;
float2 l9_6462=float2(0.0);
l9_6462=l9_6460;
float2 l9_6463=float2(0.0);
l9_6463=(l9_6446*l9_6459)+l9_6462;
float2 l9_6464=float2(0.0);
l9_6464=l9_6463+(l9_6462*(l9_6444.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6442=l9_6464;
l9_6445=l9_6442;
}
else
{
float2 l9_6465=float2(0.0);
float2 l9_6466=float2(0.0);
float2 l9_6467=float2(0.0);
float2 l9_6468=float2(0.0);
float2 l9_6469=float2(0.0);
ssGlobals l9_6470=l9_6444;
float2 l9_6471;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6472=float2(0.0);
l9_6472=l9_6470.Surface_UVCoord0;
l9_6466=l9_6472;
l9_6471=l9_6466;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6473=float2(0.0);
l9_6473=l9_6470.Surface_UVCoord1;
l9_6467=l9_6473;
l9_6471=l9_6467;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6474=float2(0.0);
l9_6474=l9_6470.gScreenCoord;
l9_6468=l9_6474;
l9_6471=l9_6468;
}
else
{
float2 l9_6475=float2(0.0);
l9_6475=l9_6470.Surface_UVCoord0;
l9_6469=l9_6475;
l9_6471=l9_6469;
}
}
}
l9_6465=l9_6471;
float2 l9_6476=float2(0.0);
float2 l9_6477=(*sc_set0.UserUniforms).uv2Scale;
l9_6476=l9_6477;
float2 l9_6478=float2(0.0);
l9_6478=l9_6476;
float2 l9_6479=float2(0.0);
float2 l9_6480=(*sc_set0.UserUniforms).uv2Offset;
l9_6479=l9_6480;
float2 l9_6481=float2(0.0);
l9_6481=l9_6479;
float2 l9_6482=float2(0.0);
l9_6482=(l9_6465*l9_6478)+l9_6481;
l9_6443=l9_6482;
l9_6445=l9_6443;
}
l9_6441=l9_6445;
l9_6437=l9_6441;
l9_6440=l9_6437;
}
else
{
float2 l9_6483=float2(0.0);
l9_6483=l9_6439.Surface_UVCoord0;
l9_6438=l9_6483;
l9_6440=l9_6438;
}
l9_6436=l9_6440;
float2 l9_6484=float2(0.0);
l9_6484=l9_6436;
float2 l9_6485=float2(0.0);
l9_6485=l9_6484;
l9_6429=l9_6485;
l9_6432=l9_6429;
}
else
{
float2 l9_6486=float2(0.0);
l9_6486=l9_6431.Surface_UVCoord0;
l9_6430=l9_6486;
l9_6432=l9_6430;
}
}
}
}
l9_6425=l9_6432;
float2 l9_6487=float2(0.0);
float2 l9_6488=(*sc_set0.UserUniforms).uv3Scale;
l9_6487=l9_6488;
float2 l9_6489=float2(0.0);
l9_6489=l9_6487;
float2 l9_6490=float2(0.0);
float2 l9_6491=(*sc_set0.UserUniforms).uv3Offset;
l9_6490=l9_6491;
float2 l9_6492=float2(0.0);
l9_6492=l9_6490;
float2 l9_6493=float2(0.0);
l9_6493=(l9_6425*l9_6489)+l9_6492;
l9_6352=l9_6493;
l9_6354=l9_6352;
}
l9_6350=l9_6354;
l9_6346=l9_6350;
l9_6349=l9_6346;
}
else
{
float2 l9_6494=float2(0.0);
l9_6494=l9_6348.Surface_UVCoord0;
l9_6347=l9_6494;
l9_6349=l9_6347;
}
l9_6345=l9_6349;
float2 l9_6495=float2(0.0);
l9_6495=l9_6345;
float2 l9_6496=float2(0.0);
l9_6496=l9_6495;
l9_6289=l9_6496;
l9_6292=l9_6289;
}
else
{
float2 l9_6497=float2(0.0);
l9_6497=l9_6291.Surface_UVCoord0;
l9_6290=l9_6497;
l9_6292=l9_6290;
}
}
}
}
l9_6285=l9_6292;
float4 l9_6498=float4(0.0);
int l9_6499=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_6500=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6500=0;
}
else
{
l9_6500=in.varStereoViewID;
}
int l9_6501=l9_6500;
l9_6499=1-l9_6501;
}
else
{
int l9_6502=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6502=0;
}
else
{
l9_6502=in.varStereoViewID;
}
int l9_6503=l9_6502;
l9_6499=l9_6503;
}
int l9_6504=l9_6499;
int l9_6505=materialParamsTexLayout_tmp;
int l9_6506=l9_6504;
float2 l9_6507=l9_6285;
bool l9_6508=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_6509=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_6510=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_6511=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_6512=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_6513=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_6514=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_6515=0.0;
bool l9_6516=l9_6513&&(!l9_6511);
float l9_6517=1.0;
float l9_6518=l9_6507.x;
int l9_6519=l9_6510.x;
if (l9_6519==1)
{
l9_6518=fract(l9_6518);
}
else
{
if (l9_6519==2)
{
float l9_6520=fract(l9_6518);
float l9_6521=l9_6518-l9_6520;
float l9_6522=step(0.25,fract(l9_6521*0.5));
l9_6518=mix(l9_6520,1.0-l9_6520,fast::clamp(l9_6522,0.0,1.0));
}
}
l9_6507.x=l9_6518;
float l9_6523=l9_6507.y;
int l9_6524=l9_6510.y;
if (l9_6524==1)
{
l9_6523=fract(l9_6523);
}
else
{
if (l9_6524==2)
{
float l9_6525=fract(l9_6523);
float l9_6526=l9_6523-l9_6525;
float l9_6527=step(0.25,fract(l9_6526*0.5));
l9_6523=mix(l9_6525,1.0-l9_6525,fast::clamp(l9_6527,0.0,1.0));
}
}
l9_6507.y=l9_6523;
if (l9_6511)
{
bool l9_6528=l9_6513;
bool l9_6529;
if (l9_6528)
{
l9_6529=l9_6510.x==3;
}
else
{
l9_6529=l9_6528;
}
float l9_6530=l9_6507.x;
float l9_6531=l9_6512.x;
float l9_6532=l9_6512.z;
bool l9_6533=l9_6529;
float l9_6534=l9_6517;
float l9_6535=fast::clamp(l9_6530,l9_6531,l9_6532);
float l9_6536=step(abs(l9_6530-l9_6535),9.9999997e-06);
l9_6534*=(l9_6536+((1.0-float(l9_6533))*(1.0-l9_6536)));
l9_6530=l9_6535;
l9_6507.x=l9_6530;
l9_6517=l9_6534;
bool l9_6537=l9_6513;
bool l9_6538;
if (l9_6537)
{
l9_6538=l9_6510.y==3;
}
else
{
l9_6538=l9_6537;
}
float l9_6539=l9_6507.y;
float l9_6540=l9_6512.y;
float l9_6541=l9_6512.w;
bool l9_6542=l9_6538;
float l9_6543=l9_6517;
float l9_6544=fast::clamp(l9_6539,l9_6540,l9_6541);
float l9_6545=step(abs(l9_6539-l9_6544),9.9999997e-06);
l9_6543*=(l9_6545+((1.0-float(l9_6542))*(1.0-l9_6545)));
l9_6539=l9_6544;
l9_6507.y=l9_6539;
l9_6517=l9_6543;
}
float2 l9_6546=l9_6507;
bool l9_6547=l9_6508;
float3x3 l9_6548=l9_6509;
if (l9_6547)
{
l9_6546=float2((l9_6548*float3(l9_6546,1.0)).xy);
}
float2 l9_6549=l9_6546;
float2 l9_6550=l9_6549;
float2 l9_6551=l9_6550;
l9_6507=l9_6551;
float l9_6552=l9_6507.x;
int l9_6553=l9_6510.x;
bool l9_6554=l9_6516;
float l9_6555=l9_6517;
if ((l9_6553==0)||(l9_6553==3))
{
float l9_6556=l9_6552;
float l9_6557=0.0;
float l9_6558=1.0;
bool l9_6559=l9_6554;
float l9_6560=l9_6555;
float l9_6561=fast::clamp(l9_6556,l9_6557,l9_6558);
float l9_6562=step(abs(l9_6556-l9_6561),9.9999997e-06);
l9_6560*=(l9_6562+((1.0-float(l9_6559))*(1.0-l9_6562)));
l9_6556=l9_6561;
l9_6552=l9_6556;
l9_6555=l9_6560;
}
l9_6507.x=l9_6552;
l9_6517=l9_6555;
float l9_6563=l9_6507.y;
int l9_6564=l9_6510.y;
bool l9_6565=l9_6516;
float l9_6566=l9_6517;
if ((l9_6564==0)||(l9_6564==3))
{
float l9_6567=l9_6563;
float l9_6568=0.0;
float l9_6569=1.0;
bool l9_6570=l9_6565;
float l9_6571=l9_6566;
float l9_6572=fast::clamp(l9_6567,l9_6568,l9_6569);
float l9_6573=step(abs(l9_6567-l9_6572),9.9999997e-06);
l9_6571*=(l9_6573+((1.0-float(l9_6570))*(1.0-l9_6573)));
l9_6567=l9_6572;
l9_6563=l9_6567;
l9_6566=l9_6571;
}
l9_6507.y=l9_6563;
l9_6517=l9_6566;
float2 l9_6574=l9_6507;
int l9_6575=l9_6505;
int l9_6576=l9_6506;
float l9_6577=l9_6515;
float2 l9_6578=l9_6574;
int l9_6579=l9_6575;
int l9_6580=l9_6576;
float3 l9_6581=float3(0.0);
if (l9_6579==0)
{
l9_6581=float3(l9_6578,0.0);
}
else
{
if (l9_6579==1)
{
l9_6581=float3(l9_6578.x,(l9_6578.y*0.5)+(0.5-(float(l9_6580)*0.5)),0.0);
}
else
{
l9_6581=float3(l9_6578,float(l9_6580));
}
}
float3 l9_6582=l9_6581;
float3 l9_6583=l9_6582;
float2 l9_6584=l9_6583.xy;
float l9_6585=l9_6577;
float4 l9_6586=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_6584,bias(l9_6585));
float4 l9_6587=l9_6586;
float4 l9_6588=l9_6587;
if (l9_6513)
{
l9_6588=mix(l9_6514,l9_6588,float4(l9_6517));
}
float4 l9_6589=l9_6588;
l9_6498=l9_6589;
float3 l9_6590=float3(0.0);
l9_6590=float3(l9_6498.z,l9_6498.z,l9_6498.z);
float3 l9_6591=float3(0.0);
l9_6591=l9_6284.xyz*l9_6590;
param_57=l9_6591;
param_59=param_57;
}
else
{
float2 l9_6592=float2(0.0);
float2 l9_6593=float2(0.0);
float2 l9_6594=float2(0.0);
float2 l9_6595=float2(0.0);
float2 l9_6596=float2(0.0);
float2 l9_6597=float2(0.0);
ssGlobals l9_6598=param_60;
float2 l9_6599;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6600=float2(0.0);
l9_6600=l9_6598.Surface_UVCoord0;
l9_6593=l9_6600;
l9_6599=l9_6593;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6601=float2(0.0);
l9_6601=l9_6598.Surface_UVCoord1;
l9_6594=l9_6601;
l9_6599=l9_6594;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6602=float2(0.0);
float2 l9_6603=float2(0.0);
float2 l9_6604=float2(0.0);
ssGlobals l9_6605=l9_6598;
float2 l9_6606;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6607=float2(0.0);
float2 l9_6608=float2(0.0);
float2 l9_6609=float2(0.0);
ssGlobals l9_6610=l9_6605;
float2 l9_6611;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6612=float2(0.0);
float2 l9_6613=float2(0.0);
float2 l9_6614=float2(0.0);
float2 l9_6615=float2(0.0);
float2 l9_6616=float2(0.0);
ssGlobals l9_6617=l9_6610;
float2 l9_6618;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6619=float2(0.0);
l9_6619=l9_6617.Surface_UVCoord0;
l9_6613=l9_6619;
l9_6618=l9_6613;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6620=float2(0.0);
l9_6620=l9_6617.Surface_UVCoord1;
l9_6614=l9_6620;
l9_6618=l9_6614;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6621=float2(0.0);
l9_6621=l9_6617.gScreenCoord;
l9_6615=l9_6621;
l9_6618=l9_6615;
}
else
{
float2 l9_6622=float2(0.0);
l9_6622=l9_6617.Surface_UVCoord0;
l9_6616=l9_6622;
l9_6618=l9_6616;
}
}
}
l9_6612=l9_6618;
float2 l9_6623=float2(0.0);
float2 l9_6624=(*sc_set0.UserUniforms).uv2Scale;
l9_6623=l9_6624;
float2 l9_6625=float2(0.0);
l9_6625=l9_6623;
float2 l9_6626=float2(0.0);
float2 l9_6627=(*sc_set0.UserUniforms).uv2Offset;
l9_6626=l9_6627;
float2 l9_6628=float2(0.0);
l9_6628=l9_6626;
float2 l9_6629=float2(0.0);
l9_6629=(l9_6612*l9_6625)+l9_6628;
float2 l9_6630=float2(0.0);
l9_6630=l9_6629+(l9_6628*(l9_6610.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6608=l9_6630;
l9_6611=l9_6608;
}
else
{
float2 l9_6631=float2(0.0);
float2 l9_6632=float2(0.0);
float2 l9_6633=float2(0.0);
float2 l9_6634=float2(0.0);
float2 l9_6635=float2(0.0);
ssGlobals l9_6636=l9_6610;
float2 l9_6637;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6638=float2(0.0);
l9_6638=l9_6636.Surface_UVCoord0;
l9_6632=l9_6638;
l9_6637=l9_6632;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6639=float2(0.0);
l9_6639=l9_6636.Surface_UVCoord1;
l9_6633=l9_6639;
l9_6637=l9_6633;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6640=float2(0.0);
l9_6640=l9_6636.gScreenCoord;
l9_6634=l9_6640;
l9_6637=l9_6634;
}
else
{
float2 l9_6641=float2(0.0);
l9_6641=l9_6636.Surface_UVCoord0;
l9_6635=l9_6641;
l9_6637=l9_6635;
}
}
}
l9_6631=l9_6637;
float2 l9_6642=float2(0.0);
float2 l9_6643=(*sc_set0.UserUniforms).uv2Scale;
l9_6642=l9_6643;
float2 l9_6644=float2(0.0);
l9_6644=l9_6642;
float2 l9_6645=float2(0.0);
float2 l9_6646=(*sc_set0.UserUniforms).uv2Offset;
l9_6645=l9_6646;
float2 l9_6647=float2(0.0);
l9_6647=l9_6645;
float2 l9_6648=float2(0.0);
l9_6648=(l9_6631*l9_6644)+l9_6647;
l9_6609=l9_6648;
l9_6611=l9_6609;
}
l9_6607=l9_6611;
l9_6603=l9_6607;
l9_6606=l9_6603;
}
else
{
float2 l9_6649=float2(0.0);
l9_6649=l9_6605.Surface_UVCoord0;
l9_6604=l9_6649;
l9_6606=l9_6604;
}
l9_6602=l9_6606;
float2 l9_6650=float2(0.0);
l9_6650=l9_6602;
float2 l9_6651=float2(0.0);
l9_6651=l9_6650;
l9_6595=l9_6651;
l9_6599=l9_6595;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6652=float2(0.0);
float2 l9_6653=float2(0.0);
float2 l9_6654=float2(0.0);
ssGlobals l9_6655=l9_6598;
float2 l9_6656;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_6657=float2(0.0);
float2 l9_6658=float2(0.0);
float2 l9_6659=float2(0.0);
ssGlobals l9_6660=l9_6655;
float2 l9_6661;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_6662=float2(0.0);
float2 l9_6663=float2(0.0);
float2 l9_6664=float2(0.0);
float2 l9_6665=float2(0.0);
float2 l9_6666=float2(0.0);
float2 l9_6667=float2(0.0);
ssGlobals l9_6668=l9_6660;
float2 l9_6669;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6670=float2(0.0);
l9_6670=l9_6668.Surface_UVCoord0;
l9_6663=l9_6670;
l9_6669=l9_6663;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6671=float2(0.0);
l9_6671=l9_6668.Surface_UVCoord1;
l9_6664=l9_6671;
l9_6669=l9_6664;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6672=float2(0.0);
l9_6672=l9_6668.gScreenCoord;
l9_6665=l9_6672;
l9_6669=l9_6665;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6673=float2(0.0);
float2 l9_6674=float2(0.0);
float2 l9_6675=float2(0.0);
ssGlobals l9_6676=l9_6668;
float2 l9_6677;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6678=float2(0.0);
float2 l9_6679=float2(0.0);
float2 l9_6680=float2(0.0);
ssGlobals l9_6681=l9_6676;
float2 l9_6682;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6683=float2(0.0);
float2 l9_6684=float2(0.0);
float2 l9_6685=float2(0.0);
float2 l9_6686=float2(0.0);
float2 l9_6687=float2(0.0);
ssGlobals l9_6688=l9_6681;
float2 l9_6689;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6690=float2(0.0);
l9_6690=l9_6688.Surface_UVCoord0;
l9_6684=l9_6690;
l9_6689=l9_6684;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6691=float2(0.0);
l9_6691=l9_6688.Surface_UVCoord1;
l9_6685=l9_6691;
l9_6689=l9_6685;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6692=float2(0.0);
l9_6692=l9_6688.gScreenCoord;
l9_6686=l9_6692;
l9_6689=l9_6686;
}
else
{
float2 l9_6693=float2(0.0);
l9_6693=l9_6688.Surface_UVCoord0;
l9_6687=l9_6693;
l9_6689=l9_6687;
}
}
}
l9_6683=l9_6689;
float2 l9_6694=float2(0.0);
float2 l9_6695=(*sc_set0.UserUniforms).uv2Scale;
l9_6694=l9_6695;
float2 l9_6696=float2(0.0);
l9_6696=l9_6694;
float2 l9_6697=float2(0.0);
float2 l9_6698=(*sc_set0.UserUniforms).uv2Offset;
l9_6697=l9_6698;
float2 l9_6699=float2(0.0);
l9_6699=l9_6697;
float2 l9_6700=float2(0.0);
l9_6700=(l9_6683*l9_6696)+l9_6699;
float2 l9_6701=float2(0.0);
l9_6701=l9_6700+(l9_6699*(l9_6681.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6679=l9_6701;
l9_6682=l9_6679;
}
else
{
float2 l9_6702=float2(0.0);
float2 l9_6703=float2(0.0);
float2 l9_6704=float2(0.0);
float2 l9_6705=float2(0.0);
float2 l9_6706=float2(0.0);
ssGlobals l9_6707=l9_6681;
float2 l9_6708;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6709=float2(0.0);
l9_6709=l9_6707.Surface_UVCoord0;
l9_6703=l9_6709;
l9_6708=l9_6703;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6710=float2(0.0);
l9_6710=l9_6707.Surface_UVCoord1;
l9_6704=l9_6710;
l9_6708=l9_6704;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6711=float2(0.0);
l9_6711=l9_6707.gScreenCoord;
l9_6705=l9_6711;
l9_6708=l9_6705;
}
else
{
float2 l9_6712=float2(0.0);
l9_6712=l9_6707.Surface_UVCoord0;
l9_6706=l9_6712;
l9_6708=l9_6706;
}
}
}
l9_6702=l9_6708;
float2 l9_6713=float2(0.0);
float2 l9_6714=(*sc_set0.UserUniforms).uv2Scale;
l9_6713=l9_6714;
float2 l9_6715=float2(0.0);
l9_6715=l9_6713;
float2 l9_6716=float2(0.0);
float2 l9_6717=(*sc_set0.UserUniforms).uv2Offset;
l9_6716=l9_6717;
float2 l9_6718=float2(0.0);
l9_6718=l9_6716;
float2 l9_6719=float2(0.0);
l9_6719=(l9_6702*l9_6715)+l9_6718;
l9_6680=l9_6719;
l9_6682=l9_6680;
}
l9_6678=l9_6682;
l9_6674=l9_6678;
l9_6677=l9_6674;
}
else
{
float2 l9_6720=float2(0.0);
l9_6720=l9_6676.Surface_UVCoord0;
l9_6675=l9_6720;
l9_6677=l9_6675;
}
l9_6673=l9_6677;
float2 l9_6721=float2(0.0);
l9_6721=l9_6673;
float2 l9_6722=float2(0.0);
l9_6722=l9_6721;
l9_6666=l9_6722;
l9_6669=l9_6666;
}
else
{
float2 l9_6723=float2(0.0);
l9_6723=l9_6668.Surface_UVCoord0;
l9_6667=l9_6723;
l9_6669=l9_6667;
}
}
}
}
l9_6662=l9_6669;
float2 l9_6724=float2(0.0);
float2 l9_6725=(*sc_set0.UserUniforms).uv3Scale;
l9_6724=l9_6725;
float2 l9_6726=float2(0.0);
l9_6726=l9_6724;
float2 l9_6727=float2(0.0);
float2 l9_6728=(*sc_set0.UserUniforms).uv3Offset;
l9_6727=l9_6728;
float2 l9_6729=float2(0.0);
l9_6729=l9_6727;
float2 l9_6730=float2(0.0);
l9_6730=(l9_6662*l9_6726)+l9_6729;
float2 l9_6731=float2(0.0);
l9_6731=l9_6730+(l9_6729*(l9_6660.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6658=l9_6731;
l9_6661=l9_6658;
}
else
{
float2 l9_6732=float2(0.0);
float2 l9_6733=float2(0.0);
float2 l9_6734=float2(0.0);
float2 l9_6735=float2(0.0);
float2 l9_6736=float2(0.0);
float2 l9_6737=float2(0.0);
ssGlobals l9_6738=l9_6660;
float2 l9_6739;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6740=float2(0.0);
l9_6740=l9_6738.Surface_UVCoord0;
l9_6733=l9_6740;
l9_6739=l9_6733;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6741=float2(0.0);
l9_6741=l9_6738.Surface_UVCoord1;
l9_6734=l9_6741;
l9_6739=l9_6734;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6742=float2(0.0);
l9_6742=l9_6738.gScreenCoord;
l9_6735=l9_6742;
l9_6739=l9_6735;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6743=float2(0.0);
float2 l9_6744=float2(0.0);
float2 l9_6745=float2(0.0);
ssGlobals l9_6746=l9_6738;
float2 l9_6747;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6748=float2(0.0);
float2 l9_6749=float2(0.0);
float2 l9_6750=float2(0.0);
ssGlobals l9_6751=l9_6746;
float2 l9_6752;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6753=float2(0.0);
float2 l9_6754=float2(0.0);
float2 l9_6755=float2(0.0);
float2 l9_6756=float2(0.0);
float2 l9_6757=float2(0.0);
ssGlobals l9_6758=l9_6751;
float2 l9_6759;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6760=float2(0.0);
l9_6760=l9_6758.Surface_UVCoord0;
l9_6754=l9_6760;
l9_6759=l9_6754;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6761=float2(0.0);
l9_6761=l9_6758.Surface_UVCoord1;
l9_6755=l9_6761;
l9_6759=l9_6755;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6762=float2(0.0);
l9_6762=l9_6758.gScreenCoord;
l9_6756=l9_6762;
l9_6759=l9_6756;
}
else
{
float2 l9_6763=float2(0.0);
l9_6763=l9_6758.Surface_UVCoord0;
l9_6757=l9_6763;
l9_6759=l9_6757;
}
}
}
l9_6753=l9_6759;
float2 l9_6764=float2(0.0);
float2 l9_6765=(*sc_set0.UserUniforms).uv2Scale;
l9_6764=l9_6765;
float2 l9_6766=float2(0.0);
l9_6766=l9_6764;
float2 l9_6767=float2(0.0);
float2 l9_6768=(*sc_set0.UserUniforms).uv2Offset;
l9_6767=l9_6768;
float2 l9_6769=float2(0.0);
l9_6769=l9_6767;
float2 l9_6770=float2(0.0);
l9_6770=(l9_6753*l9_6766)+l9_6769;
float2 l9_6771=float2(0.0);
l9_6771=l9_6770+(l9_6769*(l9_6751.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6749=l9_6771;
l9_6752=l9_6749;
}
else
{
float2 l9_6772=float2(0.0);
float2 l9_6773=float2(0.0);
float2 l9_6774=float2(0.0);
float2 l9_6775=float2(0.0);
float2 l9_6776=float2(0.0);
ssGlobals l9_6777=l9_6751;
float2 l9_6778;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6779=float2(0.0);
l9_6779=l9_6777.Surface_UVCoord0;
l9_6773=l9_6779;
l9_6778=l9_6773;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6780=float2(0.0);
l9_6780=l9_6777.Surface_UVCoord1;
l9_6774=l9_6780;
l9_6778=l9_6774;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6781=float2(0.0);
l9_6781=l9_6777.gScreenCoord;
l9_6775=l9_6781;
l9_6778=l9_6775;
}
else
{
float2 l9_6782=float2(0.0);
l9_6782=l9_6777.Surface_UVCoord0;
l9_6776=l9_6782;
l9_6778=l9_6776;
}
}
}
l9_6772=l9_6778;
float2 l9_6783=float2(0.0);
float2 l9_6784=(*sc_set0.UserUniforms).uv2Scale;
l9_6783=l9_6784;
float2 l9_6785=float2(0.0);
l9_6785=l9_6783;
float2 l9_6786=float2(0.0);
float2 l9_6787=(*sc_set0.UserUniforms).uv2Offset;
l9_6786=l9_6787;
float2 l9_6788=float2(0.0);
l9_6788=l9_6786;
float2 l9_6789=float2(0.0);
l9_6789=(l9_6772*l9_6785)+l9_6788;
l9_6750=l9_6789;
l9_6752=l9_6750;
}
l9_6748=l9_6752;
l9_6744=l9_6748;
l9_6747=l9_6744;
}
else
{
float2 l9_6790=float2(0.0);
l9_6790=l9_6746.Surface_UVCoord0;
l9_6745=l9_6790;
l9_6747=l9_6745;
}
l9_6743=l9_6747;
float2 l9_6791=float2(0.0);
l9_6791=l9_6743;
float2 l9_6792=float2(0.0);
l9_6792=l9_6791;
l9_6736=l9_6792;
l9_6739=l9_6736;
}
else
{
float2 l9_6793=float2(0.0);
l9_6793=l9_6738.Surface_UVCoord0;
l9_6737=l9_6793;
l9_6739=l9_6737;
}
}
}
}
l9_6732=l9_6739;
float2 l9_6794=float2(0.0);
float2 l9_6795=(*sc_set0.UserUniforms).uv3Scale;
l9_6794=l9_6795;
float2 l9_6796=float2(0.0);
l9_6796=l9_6794;
float2 l9_6797=float2(0.0);
float2 l9_6798=(*sc_set0.UserUniforms).uv3Offset;
l9_6797=l9_6798;
float2 l9_6799=float2(0.0);
l9_6799=l9_6797;
float2 l9_6800=float2(0.0);
l9_6800=(l9_6732*l9_6796)+l9_6799;
l9_6659=l9_6800;
l9_6661=l9_6659;
}
l9_6657=l9_6661;
l9_6653=l9_6657;
l9_6656=l9_6653;
}
else
{
float2 l9_6801=float2(0.0);
l9_6801=l9_6655.Surface_UVCoord0;
l9_6654=l9_6801;
l9_6656=l9_6654;
}
l9_6652=l9_6656;
float2 l9_6802=float2(0.0);
l9_6802=l9_6652;
float2 l9_6803=float2(0.0);
l9_6803=l9_6802;
l9_6596=l9_6803;
l9_6599=l9_6596;
}
else
{
float2 l9_6804=float2(0.0);
l9_6804=l9_6598.Surface_UVCoord0;
l9_6597=l9_6804;
l9_6599=l9_6597;
}
}
}
}
l9_6592=l9_6599;
float4 l9_6805=float4(0.0);
int l9_6806=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_6807=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6807=0;
}
else
{
l9_6807=in.varStereoViewID;
}
int l9_6808=l9_6807;
l9_6806=1-l9_6808;
}
else
{
int l9_6809=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6809=0;
}
else
{
l9_6809=in.varStereoViewID;
}
int l9_6810=l9_6809;
l9_6806=l9_6810;
}
int l9_6811=l9_6806;
int l9_6812=materialParamsTexLayout_tmp;
int l9_6813=l9_6811;
float2 l9_6814=l9_6592;
bool l9_6815=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_6816=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_6817=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_6818=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_6819=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_6820=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_6821=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_6822=0.0;
bool l9_6823=l9_6820&&(!l9_6818);
float l9_6824=1.0;
float l9_6825=l9_6814.x;
int l9_6826=l9_6817.x;
if (l9_6826==1)
{
l9_6825=fract(l9_6825);
}
else
{
if (l9_6826==2)
{
float l9_6827=fract(l9_6825);
float l9_6828=l9_6825-l9_6827;
float l9_6829=step(0.25,fract(l9_6828*0.5));
l9_6825=mix(l9_6827,1.0-l9_6827,fast::clamp(l9_6829,0.0,1.0));
}
}
l9_6814.x=l9_6825;
float l9_6830=l9_6814.y;
int l9_6831=l9_6817.y;
if (l9_6831==1)
{
l9_6830=fract(l9_6830);
}
else
{
if (l9_6831==2)
{
float l9_6832=fract(l9_6830);
float l9_6833=l9_6830-l9_6832;
float l9_6834=step(0.25,fract(l9_6833*0.5));
l9_6830=mix(l9_6832,1.0-l9_6832,fast::clamp(l9_6834,0.0,1.0));
}
}
l9_6814.y=l9_6830;
if (l9_6818)
{
bool l9_6835=l9_6820;
bool l9_6836;
if (l9_6835)
{
l9_6836=l9_6817.x==3;
}
else
{
l9_6836=l9_6835;
}
float l9_6837=l9_6814.x;
float l9_6838=l9_6819.x;
float l9_6839=l9_6819.z;
bool l9_6840=l9_6836;
float l9_6841=l9_6824;
float l9_6842=fast::clamp(l9_6837,l9_6838,l9_6839);
float l9_6843=step(abs(l9_6837-l9_6842),9.9999997e-06);
l9_6841*=(l9_6843+((1.0-float(l9_6840))*(1.0-l9_6843)));
l9_6837=l9_6842;
l9_6814.x=l9_6837;
l9_6824=l9_6841;
bool l9_6844=l9_6820;
bool l9_6845;
if (l9_6844)
{
l9_6845=l9_6817.y==3;
}
else
{
l9_6845=l9_6844;
}
float l9_6846=l9_6814.y;
float l9_6847=l9_6819.y;
float l9_6848=l9_6819.w;
bool l9_6849=l9_6845;
float l9_6850=l9_6824;
float l9_6851=fast::clamp(l9_6846,l9_6847,l9_6848);
float l9_6852=step(abs(l9_6846-l9_6851),9.9999997e-06);
l9_6850*=(l9_6852+((1.0-float(l9_6849))*(1.0-l9_6852)));
l9_6846=l9_6851;
l9_6814.y=l9_6846;
l9_6824=l9_6850;
}
float2 l9_6853=l9_6814;
bool l9_6854=l9_6815;
float3x3 l9_6855=l9_6816;
if (l9_6854)
{
l9_6853=float2((l9_6855*float3(l9_6853,1.0)).xy);
}
float2 l9_6856=l9_6853;
float2 l9_6857=l9_6856;
float2 l9_6858=l9_6857;
l9_6814=l9_6858;
float l9_6859=l9_6814.x;
int l9_6860=l9_6817.x;
bool l9_6861=l9_6823;
float l9_6862=l9_6824;
if ((l9_6860==0)||(l9_6860==3))
{
float l9_6863=l9_6859;
float l9_6864=0.0;
float l9_6865=1.0;
bool l9_6866=l9_6861;
float l9_6867=l9_6862;
float l9_6868=fast::clamp(l9_6863,l9_6864,l9_6865);
float l9_6869=step(abs(l9_6863-l9_6868),9.9999997e-06);
l9_6867*=(l9_6869+((1.0-float(l9_6866))*(1.0-l9_6869)));
l9_6863=l9_6868;
l9_6859=l9_6863;
l9_6862=l9_6867;
}
l9_6814.x=l9_6859;
l9_6824=l9_6862;
float l9_6870=l9_6814.y;
int l9_6871=l9_6817.y;
bool l9_6872=l9_6823;
float l9_6873=l9_6824;
if ((l9_6871==0)||(l9_6871==3))
{
float l9_6874=l9_6870;
float l9_6875=0.0;
float l9_6876=1.0;
bool l9_6877=l9_6872;
float l9_6878=l9_6873;
float l9_6879=fast::clamp(l9_6874,l9_6875,l9_6876);
float l9_6880=step(abs(l9_6874-l9_6879),9.9999997e-06);
l9_6878*=(l9_6880+((1.0-float(l9_6877))*(1.0-l9_6880)));
l9_6874=l9_6879;
l9_6870=l9_6874;
l9_6873=l9_6878;
}
l9_6814.y=l9_6870;
l9_6824=l9_6873;
float2 l9_6881=l9_6814;
int l9_6882=l9_6812;
int l9_6883=l9_6813;
float l9_6884=l9_6822;
float2 l9_6885=l9_6881;
int l9_6886=l9_6882;
int l9_6887=l9_6883;
float3 l9_6888=float3(0.0);
if (l9_6886==0)
{
l9_6888=float3(l9_6885,0.0);
}
else
{
if (l9_6886==1)
{
l9_6888=float3(l9_6885.x,(l9_6885.y*0.5)+(0.5-(float(l9_6887)*0.5)),0.0);
}
else
{
l9_6888=float3(l9_6885,float(l9_6887));
}
}
float3 l9_6889=l9_6888;
float3 l9_6890=l9_6889;
float2 l9_6891=l9_6890.xy;
float l9_6892=l9_6884;
float4 l9_6893=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_6891,bias(l9_6892));
float4 l9_6894=l9_6893;
float4 l9_6895=l9_6894;
if (l9_6820)
{
l9_6895=mix(l9_6821,l9_6895,float4(l9_6824));
}
float4 l9_6896=l9_6895;
l9_6805=l9_6896;
float3 l9_6897=float3(0.0);
l9_6897=float3(l9_6805.z,l9_6805.z,l9_6805.z);
param_58=l9_6897;
param_59=param_58;
}
Result_N188=param_59;
float3 Export_N230=float3(0.0);
Export_N230=Result_N188;
float3 Result_N79=float3(0.0);
float3 param_61=(*sc_set0.UserUniforms).Port_Value1_N079;
float3 param_62=float3(0.0);
ssGlobals param_64=Globals;
float3 param_63;
if ((int(Tweak_N179_tmp)!=0))
{
param_63=param_61;
}
else
{
float3 l9_6898=float3(0.0);
float3 l9_6899=float3(0.0);
float3 l9_6900=(*sc_set0.UserUniforms).Port_Default_N326;
ssGlobals l9_6901=param_64;
float3 l9_6902;
if ((int(Tweak_N219_tmp)!=0))
{
float l9_6903=0.0;
float l9_6904=(*sc_set0.UserUniforms).specularAoDarkening;
l9_6903=l9_6904;
float l9_6905=0.0;
l9_6905=l9_6903;
float l9_6906=0.0;
l9_6906=1.0-l9_6905;
float3 l9_6907=float3(0.0);
l9_6907=(*sc_set0.UserUniforms).Port_Import_N235;
float l9_6908=0.0;
float l9_6909=(*sc_set0.UserUniforms).metallic;
l9_6908=l9_6909;
float l9_6910=0.0;
l9_6910=l9_6908;
float2 l9_6911=float2(0.0);
float2 l9_6912=float2(0.0);
float2 l9_6913=float2(0.0);
float2 l9_6914=float2(0.0);
float2 l9_6915=float2(0.0);
float2 l9_6916=float2(0.0);
ssGlobals l9_6917=l9_6901;
float2 l9_6918;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_6919=float2(0.0);
l9_6919=l9_6917.Surface_UVCoord0;
l9_6912=l9_6919;
l9_6918=l9_6912;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_6920=float2(0.0);
l9_6920=l9_6917.Surface_UVCoord1;
l9_6913=l9_6920;
l9_6918=l9_6913;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_6921=float2(0.0);
float2 l9_6922=float2(0.0);
float2 l9_6923=float2(0.0);
ssGlobals l9_6924=l9_6917;
float2 l9_6925;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6926=float2(0.0);
float2 l9_6927=float2(0.0);
float2 l9_6928=float2(0.0);
ssGlobals l9_6929=l9_6924;
float2 l9_6930;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_6931=float2(0.0);
float2 l9_6932=float2(0.0);
float2 l9_6933=float2(0.0);
float2 l9_6934=float2(0.0);
float2 l9_6935=float2(0.0);
ssGlobals l9_6936=l9_6929;
float2 l9_6937;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6938=float2(0.0);
l9_6938=l9_6936.Surface_UVCoord0;
l9_6932=l9_6938;
l9_6937=l9_6932;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6939=float2(0.0);
l9_6939=l9_6936.Surface_UVCoord1;
l9_6933=l9_6939;
l9_6937=l9_6933;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6940=float2(0.0);
l9_6940=l9_6936.gScreenCoord;
l9_6934=l9_6940;
l9_6937=l9_6934;
}
else
{
float2 l9_6941=float2(0.0);
l9_6941=l9_6936.Surface_UVCoord0;
l9_6935=l9_6941;
l9_6937=l9_6935;
}
}
}
l9_6931=l9_6937;
float2 l9_6942=float2(0.0);
float2 l9_6943=(*sc_set0.UserUniforms).uv2Scale;
l9_6942=l9_6943;
float2 l9_6944=float2(0.0);
l9_6944=l9_6942;
float2 l9_6945=float2(0.0);
float2 l9_6946=(*sc_set0.UserUniforms).uv2Offset;
l9_6945=l9_6946;
float2 l9_6947=float2(0.0);
l9_6947=l9_6945;
float2 l9_6948=float2(0.0);
l9_6948=(l9_6931*l9_6944)+l9_6947;
float2 l9_6949=float2(0.0);
l9_6949=l9_6948+(l9_6947*(l9_6929.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6927=l9_6949;
l9_6930=l9_6927;
}
else
{
float2 l9_6950=float2(0.0);
float2 l9_6951=float2(0.0);
float2 l9_6952=float2(0.0);
float2 l9_6953=float2(0.0);
float2 l9_6954=float2(0.0);
ssGlobals l9_6955=l9_6929;
float2 l9_6956;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_6957=float2(0.0);
l9_6957=l9_6955.Surface_UVCoord0;
l9_6951=l9_6957;
l9_6956=l9_6951;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_6958=float2(0.0);
l9_6958=l9_6955.Surface_UVCoord1;
l9_6952=l9_6958;
l9_6956=l9_6952;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_6959=float2(0.0);
l9_6959=l9_6955.gScreenCoord;
l9_6953=l9_6959;
l9_6956=l9_6953;
}
else
{
float2 l9_6960=float2(0.0);
l9_6960=l9_6955.Surface_UVCoord0;
l9_6954=l9_6960;
l9_6956=l9_6954;
}
}
}
l9_6950=l9_6956;
float2 l9_6961=float2(0.0);
float2 l9_6962=(*sc_set0.UserUniforms).uv2Scale;
l9_6961=l9_6962;
float2 l9_6963=float2(0.0);
l9_6963=l9_6961;
float2 l9_6964=float2(0.0);
float2 l9_6965=(*sc_set0.UserUniforms).uv2Offset;
l9_6964=l9_6965;
float2 l9_6966=float2(0.0);
l9_6966=l9_6964;
float2 l9_6967=float2(0.0);
l9_6967=(l9_6950*l9_6963)+l9_6966;
l9_6928=l9_6967;
l9_6930=l9_6928;
}
l9_6926=l9_6930;
l9_6922=l9_6926;
l9_6925=l9_6922;
}
else
{
float2 l9_6968=float2(0.0);
l9_6968=l9_6924.Surface_UVCoord0;
l9_6923=l9_6968;
l9_6925=l9_6923;
}
l9_6921=l9_6925;
float2 l9_6969=float2(0.0);
l9_6969=l9_6921;
float2 l9_6970=float2(0.0);
l9_6970=l9_6969;
l9_6914=l9_6970;
l9_6918=l9_6914;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_6971=float2(0.0);
float2 l9_6972=float2(0.0);
float2 l9_6973=float2(0.0);
ssGlobals l9_6974=l9_6917;
float2 l9_6975;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_6976=float2(0.0);
float2 l9_6977=float2(0.0);
float2 l9_6978=float2(0.0);
ssGlobals l9_6979=l9_6974;
float2 l9_6980;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_6981=float2(0.0);
float2 l9_6982=float2(0.0);
float2 l9_6983=float2(0.0);
float2 l9_6984=float2(0.0);
float2 l9_6985=float2(0.0);
float2 l9_6986=float2(0.0);
ssGlobals l9_6987=l9_6979;
float2 l9_6988;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_6989=float2(0.0);
l9_6989=l9_6987.Surface_UVCoord0;
l9_6982=l9_6989;
l9_6988=l9_6982;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_6990=float2(0.0);
l9_6990=l9_6987.Surface_UVCoord1;
l9_6983=l9_6990;
l9_6988=l9_6983;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_6991=float2(0.0);
l9_6991=l9_6987.gScreenCoord;
l9_6984=l9_6991;
l9_6988=l9_6984;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_6992=float2(0.0);
float2 l9_6993=float2(0.0);
float2 l9_6994=float2(0.0);
ssGlobals l9_6995=l9_6987;
float2 l9_6996;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_6997=float2(0.0);
float2 l9_6998=float2(0.0);
float2 l9_6999=float2(0.0);
ssGlobals l9_7000=l9_6995;
float2 l9_7001;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7002=float2(0.0);
float2 l9_7003=float2(0.0);
float2 l9_7004=float2(0.0);
float2 l9_7005=float2(0.0);
float2 l9_7006=float2(0.0);
ssGlobals l9_7007=l9_7000;
float2 l9_7008;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7009=float2(0.0);
l9_7009=l9_7007.Surface_UVCoord0;
l9_7003=l9_7009;
l9_7008=l9_7003;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7010=float2(0.0);
l9_7010=l9_7007.Surface_UVCoord1;
l9_7004=l9_7010;
l9_7008=l9_7004;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7011=float2(0.0);
l9_7011=l9_7007.gScreenCoord;
l9_7005=l9_7011;
l9_7008=l9_7005;
}
else
{
float2 l9_7012=float2(0.0);
l9_7012=l9_7007.Surface_UVCoord0;
l9_7006=l9_7012;
l9_7008=l9_7006;
}
}
}
l9_7002=l9_7008;
float2 l9_7013=float2(0.0);
float2 l9_7014=(*sc_set0.UserUniforms).uv2Scale;
l9_7013=l9_7014;
float2 l9_7015=float2(0.0);
l9_7015=l9_7013;
float2 l9_7016=float2(0.0);
float2 l9_7017=(*sc_set0.UserUniforms).uv2Offset;
l9_7016=l9_7017;
float2 l9_7018=float2(0.0);
l9_7018=l9_7016;
float2 l9_7019=float2(0.0);
l9_7019=(l9_7002*l9_7015)+l9_7018;
float2 l9_7020=float2(0.0);
l9_7020=l9_7019+(l9_7018*(l9_7000.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_6998=l9_7020;
l9_7001=l9_6998;
}
else
{
float2 l9_7021=float2(0.0);
float2 l9_7022=float2(0.0);
float2 l9_7023=float2(0.0);
float2 l9_7024=float2(0.0);
float2 l9_7025=float2(0.0);
ssGlobals l9_7026=l9_7000;
float2 l9_7027;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7028=float2(0.0);
l9_7028=l9_7026.Surface_UVCoord0;
l9_7022=l9_7028;
l9_7027=l9_7022;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7029=float2(0.0);
l9_7029=l9_7026.Surface_UVCoord1;
l9_7023=l9_7029;
l9_7027=l9_7023;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7030=float2(0.0);
l9_7030=l9_7026.gScreenCoord;
l9_7024=l9_7030;
l9_7027=l9_7024;
}
else
{
float2 l9_7031=float2(0.0);
l9_7031=l9_7026.Surface_UVCoord0;
l9_7025=l9_7031;
l9_7027=l9_7025;
}
}
}
l9_7021=l9_7027;
float2 l9_7032=float2(0.0);
float2 l9_7033=(*sc_set0.UserUniforms).uv2Scale;
l9_7032=l9_7033;
float2 l9_7034=float2(0.0);
l9_7034=l9_7032;
float2 l9_7035=float2(0.0);
float2 l9_7036=(*sc_set0.UserUniforms).uv2Offset;
l9_7035=l9_7036;
float2 l9_7037=float2(0.0);
l9_7037=l9_7035;
float2 l9_7038=float2(0.0);
l9_7038=(l9_7021*l9_7034)+l9_7037;
l9_6999=l9_7038;
l9_7001=l9_6999;
}
l9_6997=l9_7001;
l9_6993=l9_6997;
l9_6996=l9_6993;
}
else
{
float2 l9_7039=float2(0.0);
l9_7039=l9_6995.Surface_UVCoord0;
l9_6994=l9_7039;
l9_6996=l9_6994;
}
l9_6992=l9_6996;
float2 l9_7040=float2(0.0);
l9_7040=l9_6992;
float2 l9_7041=float2(0.0);
l9_7041=l9_7040;
l9_6985=l9_7041;
l9_6988=l9_6985;
}
else
{
float2 l9_7042=float2(0.0);
l9_7042=l9_6987.Surface_UVCoord0;
l9_6986=l9_7042;
l9_6988=l9_6986;
}
}
}
}
l9_6981=l9_6988;
float2 l9_7043=float2(0.0);
float2 l9_7044=(*sc_set0.UserUniforms).uv3Scale;
l9_7043=l9_7044;
float2 l9_7045=float2(0.0);
l9_7045=l9_7043;
float2 l9_7046=float2(0.0);
float2 l9_7047=(*sc_set0.UserUniforms).uv3Offset;
l9_7046=l9_7047;
float2 l9_7048=float2(0.0);
l9_7048=l9_7046;
float2 l9_7049=float2(0.0);
l9_7049=(l9_6981*l9_7045)+l9_7048;
float2 l9_7050=float2(0.0);
l9_7050=l9_7049+(l9_7048*(l9_6979.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_6977=l9_7050;
l9_6980=l9_6977;
}
else
{
float2 l9_7051=float2(0.0);
float2 l9_7052=float2(0.0);
float2 l9_7053=float2(0.0);
float2 l9_7054=float2(0.0);
float2 l9_7055=float2(0.0);
float2 l9_7056=float2(0.0);
ssGlobals l9_7057=l9_6979;
float2 l9_7058;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7059=float2(0.0);
l9_7059=l9_7057.Surface_UVCoord0;
l9_7052=l9_7059;
l9_7058=l9_7052;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7060=float2(0.0);
l9_7060=l9_7057.Surface_UVCoord1;
l9_7053=l9_7060;
l9_7058=l9_7053;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7061=float2(0.0);
l9_7061=l9_7057.gScreenCoord;
l9_7054=l9_7061;
l9_7058=l9_7054;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7062=float2(0.0);
float2 l9_7063=float2(0.0);
float2 l9_7064=float2(0.0);
ssGlobals l9_7065=l9_7057;
float2 l9_7066;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7067=float2(0.0);
float2 l9_7068=float2(0.0);
float2 l9_7069=float2(0.0);
ssGlobals l9_7070=l9_7065;
float2 l9_7071;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7072=float2(0.0);
float2 l9_7073=float2(0.0);
float2 l9_7074=float2(0.0);
float2 l9_7075=float2(0.0);
float2 l9_7076=float2(0.0);
ssGlobals l9_7077=l9_7070;
float2 l9_7078;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7079=float2(0.0);
l9_7079=l9_7077.Surface_UVCoord0;
l9_7073=l9_7079;
l9_7078=l9_7073;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7080=float2(0.0);
l9_7080=l9_7077.Surface_UVCoord1;
l9_7074=l9_7080;
l9_7078=l9_7074;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7081=float2(0.0);
l9_7081=l9_7077.gScreenCoord;
l9_7075=l9_7081;
l9_7078=l9_7075;
}
else
{
float2 l9_7082=float2(0.0);
l9_7082=l9_7077.Surface_UVCoord0;
l9_7076=l9_7082;
l9_7078=l9_7076;
}
}
}
l9_7072=l9_7078;
float2 l9_7083=float2(0.0);
float2 l9_7084=(*sc_set0.UserUniforms).uv2Scale;
l9_7083=l9_7084;
float2 l9_7085=float2(0.0);
l9_7085=l9_7083;
float2 l9_7086=float2(0.0);
float2 l9_7087=(*sc_set0.UserUniforms).uv2Offset;
l9_7086=l9_7087;
float2 l9_7088=float2(0.0);
l9_7088=l9_7086;
float2 l9_7089=float2(0.0);
l9_7089=(l9_7072*l9_7085)+l9_7088;
float2 l9_7090=float2(0.0);
l9_7090=l9_7089+(l9_7088*(l9_7070.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7068=l9_7090;
l9_7071=l9_7068;
}
else
{
float2 l9_7091=float2(0.0);
float2 l9_7092=float2(0.0);
float2 l9_7093=float2(0.0);
float2 l9_7094=float2(0.0);
float2 l9_7095=float2(0.0);
ssGlobals l9_7096=l9_7070;
float2 l9_7097;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7098=float2(0.0);
l9_7098=l9_7096.Surface_UVCoord0;
l9_7092=l9_7098;
l9_7097=l9_7092;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7099=float2(0.0);
l9_7099=l9_7096.Surface_UVCoord1;
l9_7093=l9_7099;
l9_7097=l9_7093;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7100=float2(0.0);
l9_7100=l9_7096.gScreenCoord;
l9_7094=l9_7100;
l9_7097=l9_7094;
}
else
{
float2 l9_7101=float2(0.0);
l9_7101=l9_7096.Surface_UVCoord0;
l9_7095=l9_7101;
l9_7097=l9_7095;
}
}
}
l9_7091=l9_7097;
float2 l9_7102=float2(0.0);
float2 l9_7103=(*sc_set0.UserUniforms).uv2Scale;
l9_7102=l9_7103;
float2 l9_7104=float2(0.0);
l9_7104=l9_7102;
float2 l9_7105=float2(0.0);
float2 l9_7106=(*sc_set0.UserUniforms).uv2Offset;
l9_7105=l9_7106;
float2 l9_7107=float2(0.0);
l9_7107=l9_7105;
float2 l9_7108=float2(0.0);
l9_7108=(l9_7091*l9_7104)+l9_7107;
l9_7069=l9_7108;
l9_7071=l9_7069;
}
l9_7067=l9_7071;
l9_7063=l9_7067;
l9_7066=l9_7063;
}
else
{
float2 l9_7109=float2(0.0);
l9_7109=l9_7065.Surface_UVCoord0;
l9_7064=l9_7109;
l9_7066=l9_7064;
}
l9_7062=l9_7066;
float2 l9_7110=float2(0.0);
l9_7110=l9_7062;
float2 l9_7111=float2(0.0);
l9_7111=l9_7110;
l9_7055=l9_7111;
l9_7058=l9_7055;
}
else
{
float2 l9_7112=float2(0.0);
l9_7112=l9_7057.Surface_UVCoord0;
l9_7056=l9_7112;
l9_7058=l9_7056;
}
}
}
}
l9_7051=l9_7058;
float2 l9_7113=float2(0.0);
float2 l9_7114=(*sc_set0.UserUniforms).uv3Scale;
l9_7113=l9_7114;
float2 l9_7115=float2(0.0);
l9_7115=l9_7113;
float2 l9_7116=float2(0.0);
float2 l9_7117=(*sc_set0.UserUniforms).uv3Offset;
l9_7116=l9_7117;
float2 l9_7118=float2(0.0);
l9_7118=l9_7116;
float2 l9_7119=float2(0.0);
l9_7119=(l9_7051*l9_7115)+l9_7118;
l9_6978=l9_7119;
l9_6980=l9_6978;
}
l9_6976=l9_6980;
l9_6972=l9_6976;
l9_6975=l9_6972;
}
else
{
float2 l9_7120=float2(0.0);
l9_7120=l9_6974.Surface_UVCoord0;
l9_6973=l9_7120;
l9_6975=l9_6973;
}
l9_6971=l9_6975;
float2 l9_7121=float2(0.0);
l9_7121=l9_6971;
float2 l9_7122=float2(0.0);
l9_7122=l9_7121;
l9_6915=l9_7122;
l9_6918=l9_6915;
}
else
{
float2 l9_7123=float2(0.0);
l9_7123=l9_6917.Surface_UVCoord0;
l9_6916=l9_7123;
l9_6918=l9_6916;
}
}
}
}
l9_6911=l9_6918;
float4 l9_7124=float4(0.0);
int l9_7125=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_7126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7126=0;
}
else
{
l9_7126=in.varStereoViewID;
}
int l9_7127=l9_7126;
l9_7125=1-l9_7127;
}
else
{
int l9_7128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7128=0;
}
else
{
l9_7128=in.varStereoViewID;
}
int l9_7129=l9_7128;
l9_7125=l9_7129;
}
int l9_7130=l9_7125;
int l9_7131=materialParamsTexLayout_tmp;
int l9_7132=l9_7130;
float2 l9_7133=l9_6911;
bool l9_7134=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_7135=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_7136=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_7137=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_7138=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_7139=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_7140=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_7141=0.0;
bool l9_7142=l9_7139&&(!l9_7137);
float l9_7143=1.0;
float l9_7144=l9_7133.x;
int l9_7145=l9_7136.x;
if (l9_7145==1)
{
l9_7144=fract(l9_7144);
}
else
{
if (l9_7145==2)
{
float l9_7146=fract(l9_7144);
float l9_7147=l9_7144-l9_7146;
float l9_7148=step(0.25,fract(l9_7147*0.5));
l9_7144=mix(l9_7146,1.0-l9_7146,fast::clamp(l9_7148,0.0,1.0));
}
}
l9_7133.x=l9_7144;
float l9_7149=l9_7133.y;
int l9_7150=l9_7136.y;
if (l9_7150==1)
{
l9_7149=fract(l9_7149);
}
else
{
if (l9_7150==2)
{
float l9_7151=fract(l9_7149);
float l9_7152=l9_7149-l9_7151;
float l9_7153=step(0.25,fract(l9_7152*0.5));
l9_7149=mix(l9_7151,1.0-l9_7151,fast::clamp(l9_7153,0.0,1.0));
}
}
l9_7133.y=l9_7149;
if (l9_7137)
{
bool l9_7154=l9_7139;
bool l9_7155;
if (l9_7154)
{
l9_7155=l9_7136.x==3;
}
else
{
l9_7155=l9_7154;
}
float l9_7156=l9_7133.x;
float l9_7157=l9_7138.x;
float l9_7158=l9_7138.z;
bool l9_7159=l9_7155;
float l9_7160=l9_7143;
float l9_7161=fast::clamp(l9_7156,l9_7157,l9_7158);
float l9_7162=step(abs(l9_7156-l9_7161),9.9999997e-06);
l9_7160*=(l9_7162+((1.0-float(l9_7159))*(1.0-l9_7162)));
l9_7156=l9_7161;
l9_7133.x=l9_7156;
l9_7143=l9_7160;
bool l9_7163=l9_7139;
bool l9_7164;
if (l9_7163)
{
l9_7164=l9_7136.y==3;
}
else
{
l9_7164=l9_7163;
}
float l9_7165=l9_7133.y;
float l9_7166=l9_7138.y;
float l9_7167=l9_7138.w;
bool l9_7168=l9_7164;
float l9_7169=l9_7143;
float l9_7170=fast::clamp(l9_7165,l9_7166,l9_7167);
float l9_7171=step(abs(l9_7165-l9_7170),9.9999997e-06);
l9_7169*=(l9_7171+((1.0-float(l9_7168))*(1.0-l9_7171)));
l9_7165=l9_7170;
l9_7133.y=l9_7165;
l9_7143=l9_7169;
}
float2 l9_7172=l9_7133;
bool l9_7173=l9_7134;
float3x3 l9_7174=l9_7135;
if (l9_7173)
{
l9_7172=float2((l9_7174*float3(l9_7172,1.0)).xy);
}
float2 l9_7175=l9_7172;
float2 l9_7176=l9_7175;
float2 l9_7177=l9_7176;
l9_7133=l9_7177;
float l9_7178=l9_7133.x;
int l9_7179=l9_7136.x;
bool l9_7180=l9_7142;
float l9_7181=l9_7143;
if ((l9_7179==0)||(l9_7179==3))
{
float l9_7182=l9_7178;
float l9_7183=0.0;
float l9_7184=1.0;
bool l9_7185=l9_7180;
float l9_7186=l9_7181;
float l9_7187=fast::clamp(l9_7182,l9_7183,l9_7184);
float l9_7188=step(abs(l9_7182-l9_7187),9.9999997e-06);
l9_7186*=(l9_7188+((1.0-float(l9_7185))*(1.0-l9_7188)));
l9_7182=l9_7187;
l9_7178=l9_7182;
l9_7181=l9_7186;
}
l9_7133.x=l9_7178;
l9_7143=l9_7181;
float l9_7189=l9_7133.y;
int l9_7190=l9_7136.y;
bool l9_7191=l9_7142;
float l9_7192=l9_7143;
if ((l9_7190==0)||(l9_7190==3))
{
float l9_7193=l9_7189;
float l9_7194=0.0;
float l9_7195=1.0;
bool l9_7196=l9_7191;
float l9_7197=l9_7192;
float l9_7198=fast::clamp(l9_7193,l9_7194,l9_7195);
float l9_7199=step(abs(l9_7193-l9_7198),9.9999997e-06);
l9_7197*=(l9_7199+((1.0-float(l9_7196))*(1.0-l9_7199)));
l9_7193=l9_7198;
l9_7189=l9_7193;
l9_7192=l9_7197;
}
l9_7133.y=l9_7189;
l9_7143=l9_7192;
float2 l9_7200=l9_7133;
int l9_7201=l9_7131;
int l9_7202=l9_7132;
float l9_7203=l9_7141;
float2 l9_7204=l9_7200;
int l9_7205=l9_7201;
int l9_7206=l9_7202;
float3 l9_7207=float3(0.0);
if (l9_7205==0)
{
l9_7207=float3(l9_7204,0.0);
}
else
{
if (l9_7205==1)
{
l9_7207=float3(l9_7204.x,(l9_7204.y*0.5)+(0.5-(float(l9_7206)*0.5)),0.0);
}
else
{
l9_7207=float3(l9_7204,float(l9_7206));
}
}
float3 l9_7208=l9_7207;
float3 l9_7209=l9_7208;
float2 l9_7210=l9_7209.xy;
float l9_7211=l9_7203;
float4 l9_7212=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_7210,bias(l9_7211));
float4 l9_7213=l9_7212;
float4 l9_7214=l9_7213;
if (l9_7139)
{
l9_7214=mix(l9_7140,l9_7214,float4(l9_7143));
}
float4 l9_7215=l9_7214;
l9_7124=l9_7215;
float l9_7216=0.0;
float2 l9_7217=l9_7124.xy;
float l9_7218=l9_7217.x;
l9_7216=l9_7218;
float l9_7219=0.0;
l9_7219=l9_6910*l9_7216;
float3 l9_7220=float3(0.0);
l9_7220=l9_6907*float3(l9_7219);
float3 l9_7221=float3(0.0);
l9_7221=mix((*sc_set0.UserUniforms).Port_Input0_N239,l9_7220,float3(l9_7219));
float3 l9_7222=float3(0.0);
l9_7222=(float3(l9_6906)*l9_7221)*l9_7221;
float3 l9_7223=float3(0.0);
float3 l9_7224=float3(0.0);
float3 l9_7225=float3(0.0);
ssGlobals l9_7226=l9_6901;
float3 l9_7227;
if (NODE_38_DROPLIST_ITEM_tmp==3)
{
float4 l9_7228=float4(0.0);
l9_7228=l9_7226.VertexColor;
float2 l9_7229=float2(0.0);
float2 l9_7230=float2(0.0);
float2 l9_7231=float2(0.0);
float2 l9_7232=float2(0.0);
float2 l9_7233=float2(0.0);
float2 l9_7234=float2(0.0);
ssGlobals l9_7235=l9_7226;
float2 l9_7236;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_7237=float2(0.0);
l9_7237=l9_7235.Surface_UVCoord0;
l9_7230=l9_7237;
l9_7236=l9_7230;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_7238=float2(0.0);
l9_7238=l9_7235.Surface_UVCoord1;
l9_7231=l9_7238;
l9_7236=l9_7231;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_7239=float2(0.0);
float2 l9_7240=float2(0.0);
float2 l9_7241=float2(0.0);
ssGlobals l9_7242=l9_7235;
float2 l9_7243;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7244=float2(0.0);
float2 l9_7245=float2(0.0);
float2 l9_7246=float2(0.0);
ssGlobals l9_7247=l9_7242;
float2 l9_7248;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7249=float2(0.0);
float2 l9_7250=float2(0.0);
float2 l9_7251=float2(0.0);
float2 l9_7252=float2(0.0);
float2 l9_7253=float2(0.0);
ssGlobals l9_7254=l9_7247;
float2 l9_7255;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7256=float2(0.0);
l9_7256=l9_7254.Surface_UVCoord0;
l9_7250=l9_7256;
l9_7255=l9_7250;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7257=float2(0.0);
l9_7257=l9_7254.Surface_UVCoord1;
l9_7251=l9_7257;
l9_7255=l9_7251;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7258=float2(0.0);
l9_7258=l9_7254.gScreenCoord;
l9_7252=l9_7258;
l9_7255=l9_7252;
}
else
{
float2 l9_7259=float2(0.0);
l9_7259=l9_7254.Surface_UVCoord0;
l9_7253=l9_7259;
l9_7255=l9_7253;
}
}
}
l9_7249=l9_7255;
float2 l9_7260=float2(0.0);
float2 l9_7261=(*sc_set0.UserUniforms).uv2Scale;
l9_7260=l9_7261;
float2 l9_7262=float2(0.0);
l9_7262=l9_7260;
float2 l9_7263=float2(0.0);
float2 l9_7264=(*sc_set0.UserUniforms).uv2Offset;
l9_7263=l9_7264;
float2 l9_7265=float2(0.0);
l9_7265=l9_7263;
float2 l9_7266=float2(0.0);
l9_7266=(l9_7249*l9_7262)+l9_7265;
float2 l9_7267=float2(0.0);
l9_7267=l9_7266+(l9_7265*(l9_7247.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7245=l9_7267;
l9_7248=l9_7245;
}
else
{
float2 l9_7268=float2(0.0);
float2 l9_7269=float2(0.0);
float2 l9_7270=float2(0.0);
float2 l9_7271=float2(0.0);
float2 l9_7272=float2(0.0);
ssGlobals l9_7273=l9_7247;
float2 l9_7274;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7275=float2(0.0);
l9_7275=l9_7273.Surface_UVCoord0;
l9_7269=l9_7275;
l9_7274=l9_7269;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7276=float2(0.0);
l9_7276=l9_7273.Surface_UVCoord1;
l9_7270=l9_7276;
l9_7274=l9_7270;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7277=float2(0.0);
l9_7277=l9_7273.gScreenCoord;
l9_7271=l9_7277;
l9_7274=l9_7271;
}
else
{
float2 l9_7278=float2(0.0);
l9_7278=l9_7273.Surface_UVCoord0;
l9_7272=l9_7278;
l9_7274=l9_7272;
}
}
}
l9_7268=l9_7274;
float2 l9_7279=float2(0.0);
float2 l9_7280=(*sc_set0.UserUniforms).uv2Scale;
l9_7279=l9_7280;
float2 l9_7281=float2(0.0);
l9_7281=l9_7279;
float2 l9_7282=float2(0.0);
float2 l9_7283=(*sc_set0.UserUniforms).uv2Offset;
l9_7282=l9_7283;
float2 l9_7284=float2(0.0);
l9_7284=l9_7282;
float2 l9_7285=float2(0.0);
l9_7285=(l9_7268*l9_7281)+l9_7284;
l9_7246=l9_7285;
l9_7248=l9_7246;
}
l9_7244=l9_7248;
l9_7240=l9_7244;
l9_7243=l9_7240;
}
else
{
float2 l9_7286=float2(0.0);
l9_7286=l9_7242.Surface_UVCoord0;
l9_7241=l9_7286;
l9_7243=l9_7241;
}
l9_7239=l9_7243;
float2 l9_7287=float2(0.0);
l9_7287=l9_7239;
float2 l9_7288=float2(0.0);
l9_7288=l9_7287;
l9_7232=l9_7288;
l9_7236=l9_7232;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_7289=float2(0.0);
float2 l9_7290=float2(0.0);
float2 l9_7291=float2(0.0);
ssGlobals l9_7292=l9_7235;
float2 l9_7293;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_7294=float2(0.0);
float2 l9_7295=float2(0.0);
float2 l9_7296=float2(0.0);
ssGlobals l9_7297=l9_7292;
float2 l9_7298;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_7299=float2(0.0);
float2 l9_7300=float2(0.0);
float2 l9_7301=float2(0.0);
float2 l9_7302=float2(0.0);
float2 l9_7303=float2(0.0);
float2 l9_7304=float2(0.0);
ssGlobals l9_7305=l9_7297;
float2 l9_7306;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7307=float2(0.0);
l9_7307=l9_7305.Surface_UVCoord0;
l9_7300=l9_7307;
l9_7306=l9_7300;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7308=float2(0.0);
l9_7308=l9_7305.Surface_UVCoord1;
l9_7301=l9_7308;
l9_7306=l9_7301;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7309=float2(0.0);
l9_7309=l9_7305.gScreenCoord;
l9_7302=l9_7309;
l9_7306=l9_7302;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7310=float2(0.0);
float2 l9_7311=float2(0.0);
float2 l9_7312=float2(0.0);
ssGlobals l9_7313=l9_7305;
float2 l9_7314;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7315=float2(0.0);
float2 l9_7316=float2(0.0);
float2 l9_7317=float2(0.0);
ssGlobals l9_7318=l9_7313;
float2 l9_7319;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7320=float2(0.0);
float2 l9_7321=float2(0.0);
float2 l9_7322=float2(0.0);
float2 l9_7323=float2(0.0);
float2 l9_7324=float2(0.0);
ssGlobals l9_7325=l9_7318;
float2 l9_7326;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7327=float2(0.0);
l9_7327=l9_7325.Surface_UVCoord0;
l9_7321=l9_7327;
l9_7326=l9_7321;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7328=float2(0.0);
l9_7328=l9_7325.Surface_UVCoord1;
l9_7322=l9_7328;
l9_7326=l9_7322;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7329=float2(0.0);
l9_7329=l9_7325.gScreenCoord;
l9_7323=l9_7329;
l9_7326=l9_7323;
}
else
{
float2 l9_7330=float2(0.0);
l9_7330=l9_7325.Surface_UVCoord0;
l9_7324=l9_7330;
l9_7326=l9_7324;
}
}
}
l9_7320=l9_7326;
float2 l9_7331=float2(0.0);
float2 l9_7332=(*sc_set0.UserUniforms).uv2Scale;
l9_7331=l9_7332;
float2 l9_7333=float2(0.0);
l9_7333=l9_7331;
float2 l9_7334=float2(0.0);
float2 l9_7335=(*sc_set0.UserUniforms).uv2Offset;
l9_7334=l9_7335;
float2 l9_7336=float2(0.0);
l9_7336=l9_7334;
float2 l9_7337=float2(0.0);
l9_7337=(l9_7320*l9_7333)+l9_7336;
float2 l9_7338=float2(0.0);
l9_7338=l9_7337+(l9_7336*(l9_7318.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7316=l9_7338;
l9_7319=l9_7316;
}
else
{
float2 l9_7339=float2(0.0);
float2 l9_7340=float2(0.0);
float2 l9_7341=float2(0.0);
float2 l9_7342=float2(0.0);
float2 l9_7343=float2(0.0);
ssGlobals l9_7344=l9_7318;
float2 l9_7345;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7346=float2(0.0);
l9_7346=l9_7344.Surface_UVCoord0;
l9_7340=l9_7346;
l9_7345=l9_7340;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7347=float2(0.0);
l9_7347=l9_7344.Surface_UVCoord1;
l9_7341=l9_7347;
l9_7345=l9_7341;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7348=float2(0.0);
l9_7348=l9_7344.gScreenCoord;
l9_7342=l9_7348;
l9_7345=l9_7342;
}
else
{
float2 l9_7349=float2(0.0);
l9_7349=l9_7344.Surface_UVCoord0;
l9_7343=l9_7349;
l9_7345=l9_7343;
}
}
}
l9_7339=l9_7345;
float2 l9_7350=float2(0.0);
float2 l9_7351=(*sc_set0.UserUniforms).uv2Scale;
l9_7350=l9_7351;
float2 l9_7352=float2(0.0);
l9_7352=l9_7350;
float2 l9_7353=float2(0.0);
float2 l9_7354=(*sc_set0.UserUniforms).uv2Offset;
l9_7353=l9_7354;
float2 l9_7355=float2(0.0);
l9_7355=l9_7353;
float2 l9_7356=float2(0.0);
l9_7356=(l9_7339*l9_7352)+l9_7355;
l9_7317=l9_7356;
l9_7319=l9_7317;
}
l9_7315=l9_7319;
l9_7311=l9_7315;
l9_7314=l9_7311;
}
else
{
float2 l9_7357=float2(0.0);
l9_7357=l9_7313.Surface_UVCoord0;
l9_7312=l9_7357;
l9_7314=l9_7312;
}
l9_7310=l9_7314;
float2 l9_7358=float2(0.0);
l9_7358=l9_7310;
float2 l9_7359=float2(0.0);
l9_7359=l9_7358;
l9_7303=l9_7359;
l9_7306=l9_7303;
}
else
{
float2 l9_7360=float2(0.0);
l9_7360=l9_7305.Surface_UVCoord0;
l9_7304=l9_7360;
l9_7306=l9_7304;
}
}
}
}
l9_7299=l9_7306;
float2 l9_7361=float2(0.0);
float2 l9_7362=(*sc_set0.UserUniforms).uv3Scale;
l9_7361=l9_7362;
float2 l9_7363=float2(0.0);
l9_7363=l9_7361;
float2 l9_7364=float2(0.0);
float2 l9_7365=(*sc_set0.UserUniforms).uv3Offset;
l9_7364=l9_7365;
float2 l9_7366=float2(0.0);
l9_7366=l9_7364;
float2 l9_7367=float2(0.0);
l9_7367=(l9_7299*l9_7363)+l9_7366;
float2 l9_7368=float2(0.0);
l9_7368=l9_7367+(l9_7366*(l9_7297.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_7295=l9_7368;
l9_7298=l9_7295;
}
else
{
float2 l9_7369=float2(0.0);
float2 l9_7370=float2(0.0);
float2 l9_7371=float2(0.0);
float2 l9_7372=float2(0.0);
float2 l9_7373=float2(0.0);
float2 l9_7374=float2(0.0);
ssGlobals l9_7375=l9_7297;
float2 l9_7376;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7377=float2(0.0);
l9_7377=l9_7375.Surface_UVCoord0;
l9_7370=l9_7377;
l9_7376=l9_7370;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7378=float2(0.0);
l9_7378=l9_7375.Surface_UVCoord1;
l9_7371=l9_7378;
l9_7376=l9_7371;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7379=float2(0.0);
l9_7379=l9_7375.gScreenCoord;
l9_7372=l9_7379;
l9_7376=l9_7372;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7380=float2(0.0);
float2 l9_7381=float2(0.0);
float2 l9_7382=float2(0.0);
ssGlobals l9_7383=l9_7375;
float2 l9_7384;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7385=float2(0.0);
float2 l9_7386=float2(0.0);
float2 l9_7387=float2(0.0);
ssGlobals l9_7388=l9_7383;
float2 l9_7389;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7390=float2(0.0);
float2 l9_7391=float2(0.0);
float2 l9_7392=float2(0.0);
float2 l9_7393=float2(0.0);
float2 l9_7394=float2(0.0);
ssGlobals l9_7395=l9_7388;
float2 l9_7396;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7397=float2(0.0);
l9_7397=l9_7395.Surface_UVCoord0;
l9_7391=l9_7397;
l9_7396=l9_7391;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7398=float2(0.0);
l9_7398=l9_7395.Surface_UVCoord1;
l9_7392=l9_7398;
l9_7396=l9_7392;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7399=float2(0.0);
l9_7399=l9_7395.gScreenCoord;
l9_7393=l9_7399;
l9_7396=l9_7393;
}
else
{
float2 l9_7400=float2(0.0);
l9_7400=l9_7395.Surface_UVCoord0;
l9_7394=l9_7400;
l9_7396=l9_7394;
}
}
}
l9_7390=l9_7396;
float2 l9_7401=float2(0.0);
float2 l9_7402=(*sc_set0.UserUniforms).uv2Scale;
l9_7401=l9_7402;
float2 l9_7403=float2(0.0);
l9_7403=l9_7401;
float2 l9_7404=float2(0.0);
float2 l9_7405=(*sc_set0.UserUniforms).uv2Offset;
l9_7404=l9_7405;
float2 l9_7406=float2(0.0);
l9_7406=l9_7404;
float2 l9_7407=float2(0.0);
l9_7407=(l9_7390*l9_7403)+l9_7406;
float2 l9_7408=float2(0.0);
l9_7408=l9_7407+(l9_7406*(l9_7388.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7386=l9_7408;
l9_7389=l9_7386;
}
else
{
float2 l9_7409=float2(0.0);
float2 l9_7410=float2(0.0);
float2 l9_7411=float2(0.0);
float2 l9_7412=float2(0.0);
float2 l9_7413=float2(0.0);
ssGlobals l9_7414=l9_7388;
float2 l9_7415;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7416=float2(0.0);
l9_7416=l9_7414.Surface_UVCoord0;
l9_7410=l9_7416;
l9_7415=l9_7410;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7417=float2(0.0);
l9_7417=l9_7414.Surface_UVCoord1;
l9_7411=l9_7417;
l9_7415=l9_7411;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7418=float2(0.0);
l9_7418=l9_7414.gScreenCoord;
l9_7412=l9_7418;
l9_7415=l9_7412;
}
else
{
float2 l9_7419=float2(0.0);
l9_7419=l9_7414.Surface_UVCoord0;
l9_7413=l9_7419;
l9_7415=l9_7413;
}
}
}
l9_7409=l9_7415;
float2 l9_7420=float2(0.0);
float2 l9_7421=(*sc_set0.UserUniforms).uv2Scale;
l9_7420=l9_7421;
float2 l9_7422=float2(0.0);
l9_7422=l9_7420;
float2 l9_7423=float2(0.0);
float2 l9_7424=(*sc_set0.UserUniforms).uv2Offset;
l9_7423=l9_7424;
float2 l9_7425=float2(0.0);
l9_7425=l9_7423;
float2 l9_7426=float2(0.0);
l9_7426=(l9_7409*l9_7422)+l9_7425;
l9_7387=l9_7426;
l9_7389=l9_7387;
}
l9_7385=l9_7389;
l9_7381=l9_7385;
l9_7384=l9_7381;
}
else
{
float2 l9_7427=float2(0.0);
l9_7427=l9_7383.Surface_UVCoord0;
l9_7382=l9_7427;
l9_7384=l9_7382;
}
l9_7380=l9_7384;
float2 l9_7428=float2(0.0);
l9_7428=l9_7380;
float2 l9_7429=float2(0.0);
l9_7429=l9_7428;
l9_7373=l9_7429;
l9_7376=l9_7373;
}
else
{
float2 l9_7430=float2(0.0);
l9_7430=l9_7375.Surface_UVCoord0;
l9_7374=l9_7430;
l9_7376=l9_7374;
}
}
}
}
l9_7369=l9_7376;
float2 l9_7431=float2(0.0);
float2 l9_7432=(*sc_set0.UserUniforms).uv3Scale;
l9_7431=l9_7432;
float2 l9_7433=float2(0.0);
l9_7433=l9_7431;
float2 l9_7434=float2(0.0);
float2 l9_7435=(*sc_set0.UserUniforms).uv3Offset;
l9_7434=l9_7435;
float2 l9_7436=float2(0.0);
l9_7436=l9_7434;
float2 l9_7437=float2(0.0);
l9_7437=(l9_7369*l9_7433)+l9_7436;
l9_7296=l9_7437;
l9_7298=l9_7296;
}
l9_7294=l9_7298;
l9_7290=l9_7294;
l9_7293=l9_7290;
}
else
{
float2 l9_7438=float2(0.0);
l9_7438=l9_7292.Surface_UVCoord0;
l9_7291=l9_7438;
l9_7293=l9_7291;
}
l9_7289=l9_7293;
float2 l9_7439=float2(0.0);
l9_7439=l9_7289;
float2 l9_7440=float2(0.0);
l9_7440=l9_7439;
l9_7233=l9_7440;
l9_7236=l9_7233;
}
else
{
float2 l9_7441=float2(0.0);
l9_7441=l9_7235.Surface_UVCoord0;
l9_7234=l9_7441;
l9_7236=l9_7234;
}
}
}
}
l9_7229=l9_7236;
float4 l9_7442=float4(0.0);
int l9_7443=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_7444=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7444=0;
}
else
{
l9_7444=in.varStereoViewID;
}
int l9_7445=l9_7444;
l9_7443=1-l9_7445;
}
else
{
int l9_7446=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7446=0;
}
else
{
l9_7446=in.varStereoViewID;
}
int l9_7447=l9_7446;
l9_7443=l9_7447;
}
int l9_7448=l9_7443;
int l9_7449=materialParamsTexLayout_tmp;
int l9_7450=l9_7448;
float2 l9_7451=l9_7229;
bool l9_7452=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_7453=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_7454=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_7455=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_7456=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_7457=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_7458=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_7459=0.0;
bool l9_7460=l9_7457&&(!l9_7455);
float l9_7461=1.0;
float l9_7462=l9_7451.x;
int l9_7463=l9_7454.x;
if (l9_7463==1)
{
l9_7462=fract(l9_7462);
}
else
{
if (l9_7463==2)
{
float l9_7464=fract(l9_7462);
float l9_7465=l9_7462-l9_7464;
float l9_7466=step(0.25,fract(l9_7465*0.5));
l9_7462=mix(l9_7464,1.0-l9_7464,fast::clamp(l9_7466,0.0,1.0));
}
}
l9_7451.x=l9_7462;
float l9_7467=l9_7451.y;
int l9_7468=l9_7454.y;
if (l9_7468==1)
{
l9_7467=fract(l9_7467);
}
else
{
if (l9_7468==2)
{
float l9_7469=fract(l9_7467);
float l9_7470=l9_7467-l9_7469;
float l9_7471=step(0.25,fract(l9_7470*0.5));
l9_7467=mix(l9_7469,1.0-l9_7469,fast::clamp(l9_7471,0.0,1.0));
}
}
l9_7451.y=l9_7467;
if (l9_7455)
{
bool l9_7472=l9_7457;
bool l9_7473;
if (l9_7472)
{
l9_7473=l9_7454.x==3;
}
else
{
l9_7473=l9_7472;
}
float l9_7474=l9_7451.x;
float l9_7475=l9_7456.x;
float l9_7476=l9_7456.z;
bool l9_7477=l9_7473;
float l9_7478=l9_7461;
float l9_7479=fast::clamp(l9_7474,l9_7475,l9_7476);
float l9_7480=step(abs(l9_7474-l9_7479),9.9999997e-06);
l9_7478*=(l9_7480+((1.0-float(l9_7477))*(1.0-l9_7480)));
l9_7474=l9_7479;
l9_7451.x=l9_7474;
l9_7461=l9_7478;
bool l9_7481=l9_7457;
bool l9_7482;
if (l9_7481)
{
l9_7482=l9_7454.y==3;
}
else
{
l9_7482=l9_7481;
}
float l9_7483=l9_7451.y;
float l9_7484=l9_7456.y;
float l9_7485=l9_7456.w;
bool l9_7486=l9_7482;
float l9_7487=l9_7461;
float l9_7488=fast::clamp(l9_7483,l9_7484,l9_7485);
float l9_7489=step(abs(l9_7483-l9_7488),9.9999997e-06);
l9_7487*=(l9_7489+((1.0-float(l9_7486))*(1.0-l9_7489)));
l9_7483=l9_7488;
l9_7451.y=l9_7483;
l9_7461=l9_7487;
}
float2 l9_7490=l9_7451;
bool l9_7491=l9_7452;
float3x3 l9_7492=l9_7453;
if (l9_7491)
{
l9_7490=float2((l9_7492*float3(l9_7490,1.0)).xy);
}
float2 l9_7493=l9_7490;
float2 l9_7494=l9_7493;
float2 l9_7495=l9_7494;
l9_7451=l9_7495;
float l9_7496=l9_7451.x;
int l9_7497=l9_7454.x;
bool l9_7498=l9_7460;
float l9_7499=l9_7461;
if ((l9_7497==0)||(l9_7497==3))
{
float l9_7500=l9_7496;
float l9_7501=0.0;
float l9_7502=1.0;
bool l9_7503=l9_7498;
float l9_7504=l9_7499;
float l9_7505=fast::clamp(l9_7500,l9_7501,l9_7502);
float l9_7506=step(abs(l9_7500-l9_7505),9.9999997e-06);
l9_7504*=(l9_7506+((1.0-float(l9_7503))*(1.0-l9_7506)));
l9_7500=l9_7505;
l9_7496=l9_7500;
l9_7499=l9_7504;
}
l9_7451.x=l9_7496;
l9_7461=l9_7499;
float l9_7507=l9_7451.y;
int l9_7508=l9_7454.y;
bool l9_7509=l9_7460;
float l9_7510=l9_7461;
if ((l9_7508==0)||(l9_7508==3))
{
float l9_7511=l9_7507;
float l9_7512=0.0;
float l9_7513=1.0;
bool l9_7514=l9_7509;
float l9_7515=l9_7510;
float l9_7516=fast::clamp(l9_7511,l9_7512,l9_7513);
float l9_7517=step(abs(l9_7511-l9_7516),9.9999997e-06);
l9_7515*=(l9_7517+((1.0-float(l9_7514))*(1.0-l9_7517)));
l9_7511=l9_7516;
l9_7507=l9_7511;
l9_7510=l9_7515;
}
l9_7451.y=l9_7507;
l9_7461=l9_7510;
float2 l9_7518=l9_7451;
int l9_7519=l9_7449;
int l9_7520=l9_7450;
float l9_7521=l9_7459;
float2 l9_7522=l9_7518;
int l9_7523=l9_7519;
int l9_7524=l9_7520;
float3 l9_7525=float3(0.0);
if (l9_7523==0)
{
l9_7525=float3(l9_7522,0.0);
}
else
{
if (l9_7523==1)
{
l9_7525=float3(l9_7522.x,(l9_7522.y*0.5)+(0.5-(float(l9_7524)*0.5)),0.0);
}
else
{
l9_7525=float3(l9_7522,float(l9_7524));
}
}
float3 l9_7526=l9_7525;
float3 l9_7527=l9_7526;
float2 l9_7528=l9_7527.xy;
float l9_7529=l9_7521;
float4 l9_7530=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_7528,bias(l9_7529));
float4 l9_7531=l9_7530;
float4 l9_7532=l9_7531;
if (l9_7457)
{
l9_7532=mix(l9_7458,l9_7532,float4(l9_7461));
}
float4 l9_7533=l9_7532;
l9_7442=l9_7533;
float3 l9_7534=float3(0.0);
l9_7534=float3(l9_7442.z,l9_7442.z,l9_7442.z);
float3 l9_7535=float3(0.0);
l9_7535=l9_7228.xyz*l9_7534;
l9_7224=l9_7535;
l9_7227=l9_7224;
}
else
{
float2 l9_7536=float2(0.0);
float2 l9_7537=float2(0.0);
float2 l9_7538=float2(0.0);
float2 l9_7539=float2(0.0);
float2 l9_7540=float2(0.0);
float2 l9_7541=float2(0.0);
ssGlobals l9_7542=l9_7226;
float2 l9_7543;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_7544=float2(0.0);
l9_7544=l9_7542.Surface_UVCoord0;
l9_7537=l9_7544;
l9_7543=l9_7537;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_7545=float2(0.0);
l9_7545=l9_7542.Surface_UVCoord1;
l9_7538=l9_7545;
l9_7543=l9_7538;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_7546=float2(0.0);
float2 l9_7547=float2(0.0);
float2 l9_7548=float2(0.0);
ssGlobals l9_7549=l9_7542;
float2 l9_7550;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7551=float2(0.0);
float2 l9_7552=float2(0.0);
float2 l9_7553=float2(0.0);
ssGlobals l9_7554=l9_7549;
float2 l9_7555;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7556=float2(0.0);
float2 l9_7557=float2(0.0);
float2 l9_7558=float2(0.0);
float2 l9_7559=float2(0.0);
float2 l9_7560=float2(0.0);
ssGlobals l9_7561=l9_7554;
float2 l9_7562;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7563=float2(0.0);
l9_7563=l9_7561.Surface_UVCoord0;
l9_7557=l9_7563;
l9_7562=l9_7557;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7564=float2(0.0);
l9_7564=l9_7561.Surface_UVCoord1;
l9_7558=l9_7564;
l9_7562=l9_7558;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7565=float2(0.0);
l9_7565=l9_7561.gScreenCoord;
l9_7559=l9_7565;
l9_7562=l9_7559;
}
else
{
float2 l9_7566=float2(0.0);
l9_7566=l9_7561.Surface_UVCoord0;
l9_7560=l9_7566;
l9_7562=l9_7560;
}
}
}
l9_7556=l9_7562;
float2 l9_7567=float2(0.0);
float2 l9_7568=(*sc_set0.UserUniforms).uv2Scale;
l9_7567=l9_7568;
float2 l9_7569=float2(0.0);
l9_7569=l9_7567;
float2 l9_7570=float2(0.0);
float2 l9_7571=(*sc_set0.UserUniforms).uv2Offset;
l9_7570=l9_7571;
float2 l9_7572=float2(0.0);
l9_7572=l9_7570;
float2 l9_7573=float2(0.0);
l9_7573=(l9_7556*l9_7569)+l9_7572;
float2 l9_7574=float2(0.0);
l9_7574=l9_7573+(l9_7572*(l9_7554.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7552=l9_7574;
l9_7555=l9_7552;
}
else
{
float2 l9_7575=float2(0.0);
float2 l9_7576=float2(0.0);
float2 l9_7577=float2(0.0);
float2 l9_7578=float2(0.0);
float2 l9_7579=float2(0.0);
ssGlobals l9_7580=l9_7554;
float2 l9_7581;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7582=float2(0.0);
l9_7582=l9_7580.Surface_UVCoord0;
l9_7576=l9_7582;
l9_7581=l9_7576;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7583=float2(0.0);
l9_7583=l9_7580.Surface_UVCoord1;
l9_7577=l9_7583;
l9_7581=l9_7577;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7584=float2(0.0);
l9_7584=l9_7580.gScreenCoord;
l9_7578=l9_7584;
l9_7581=l9_7578;
}
else
{
float2 l9_7585=float2(0.0);
l9_7585=l9_7580.Surface_UVCoord0;
l9_7579=l9_7585;
l9_7581=l9_7579;
}
}
}
l9_7575=l9_7581;
float2 l9_7586=float2(0.0);
float2 l9_7587=(*sc_set0.UserUniforms).uv2Scale;
l9_7586=l9_7587;
float2 l9_7588=float2(0.0);
l9_7588=l9_7586;
float2 l9_7589=float2(0.0);
float2 l9_7590=(*sc_set0.UserUniforms).uv2Offset;
l9_7589=l9_7590;
float2 l9_7591=float2(0.0);
l9_7591=l9_7589;
float2 l9_7592=float2(0.0);
l9_7592=(l9_7575*l9_7588)+l9_7591;
l9_7553=l9_7592;
l9_7555=l9_7553;
}
l9_7551=l9_7555;
l9_7547=l9_7551;
l9_7550=l9_7547;
}
else
{
float2 l9_7593=float2(0.0);
l9_7593=l9_7549.Surface_UVCoord0;
l9_7548=l9_7593;
l9_7550=l9_7548;
}
l9_7546=l9_7550;
float2 l9_7594=float2(0.0);
l9_7594=l9_7546;
float2 l9_7595=float2(0.0);
l9_7595=l9_7594;
l9_7539=l9_7595;
l9_7543=l9_7539;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_7596=float2(0.0);
float2 l9_7597=float2(0.0);
float2 l9_7598=float2(0.0);
ssGlobals l9_7599=l9_7542;
float2 l9_7600;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_7601=float2(0.0);
float2 l9_7602=float2(0.0);
float2 l9_7603=float2(0.0);
ssGlobals l9_7604=l9_7599;
float2 l9_7605;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_7606=float2(0.0);
float2 l9_7607=float2(0.0);
float2 l9_7608=float2(0.0);
float2 l9_7609=float2(0.0);
float2 l9_7610=float2(0.0);
float2 l9_7611=float2(0.0);
ssGlobals l9_7612=l9_7604;
float2 l9_7613;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7614=float2(0.0);
l9_7614=l9_7612.Surface_UVCoord0;
l9_7607=l9_7614;
l9_7613=l9_7607;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7615=float2(0.0);
l9_7615=l9_7612.Surface_UVCoord1;
l9_7608=l9_7615;
l9_7613=l9_7608;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7616=float2(0.0);
l9_7616=l9_7612.gScreenCoord;
l9_7609=l9_7616;
l9_7613=l9_7609;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7617=float2(0.0);
float2 l9_7618=float2(0.0);
float2 l9_7619=float2(0.0);
ssGlobals l9_7620=l9_7612;
float2 l9_7621;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7622=float2(0.0);
float2 l9_7623=float2(0.0);
float2 l9_7624=float2(0.0);
ssGlobals l9_7625=l9_7620;
float2 l9_7626;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7627=float2(0.0);
float2 l9_7628=float2(0.0);
float2 l9_7629=float2(0.0);
float2 l9_7630=float2(0.0);
float2 l9_7631=float2(0.0);
ssGlobals l9_7632=l9_7625;
float2 l9_7633;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7634=float2(0.0);
l9_7634=l9_7632.Surface_UVCoord0;
l9_7628=l9_7634;
l9_7633=l9_7628;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7635=float2(0.0);
l9_7635=l9_7632.Surface_UVCoord1;
l9_7629=l9_7635;
l9_7633=l9_7629;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7636=float2(0.0);
l9_7636=l9_7632.gScreenCoord;
l9_7630=l9_7636;
l9_7633=l9_7630;
}
else
{
float2 l9_7637=float2(0.0);
l9_7637=l9_7632.Surface_UVCoord0;
l9_7631=l9_7637;
l9_7633=l9_7631;
}
}
}
l9_7627=l9_7633;
float2 l9_7638=float2(0.0);
float2 l9_7639=(*sc_set0.UserUniforms).uv2Scale;
l9_7638=l9_7639;
float2 l9_7640=float2(0.0);
l9_7640=l9_7638;
float2 l9_7641=float2(0.0);
float2 l9_7642=(*sc_set0.UserUniforms).uv2Offset;
l9_7641=l9_7642;
float2 l9_7643=float2(0.0);
l9_7643=l9_7641;
float2 l9_7644=float2(0.0);
l9_7644=(l9_7627*l9_7640)+l9_7643;
float2 l9_7645=float2(0.0);
l9_7645=l9_7644+(l9_7643*(l9_7625.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7623=l9_7645;
l9_7626=l9_7623;
}
else
{
float2 l9_7646=float2(0.0);
float2 l9_7647=float2(0.0);
float2 l9_7648=float2(0.0);
float2 l9_7649=float2(0.0);
float2 l9_7650=float2(0.0);
ssGlobals l9_7651=l9_7625;
float2 l9_7652;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7653=float2(0.0);
l9_7653=l9_7651.Surface_UVCoord0;
l9_7647=l9_7653;
l9_7652=l9_7647;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7654=float2(0.0);
l9_7654=l9_7651.Surface_UVCoord1;
l9_7648=l9_7654;
l9_7652=l9_7648;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7655=float2(0.0);
l9_7655=l9_7651.gScreenCoord;
l9_7649=l9_7655;
l9_7652=l9_7649;
}
else
{
float2 l9_7656=float2(0.0);
l9_7656=l9_7651.Surface_UVCoord0;
l9_7650=l9_7656;
l9_7652=l9_7650;
}
}
}
l9_7646=l9_7652;
float2 l9_7657=float2(0.0);
float2 l9_7658=(*sc_set0.UserUniforms).uv2Scale;
l9_7657=l9_7658;
float2 l9_7659=float2(0.0);
l9_7659=l9_7657;
float2 l9_7660=float2(0.0);
float2 l9_7661=(*sc_set0.UserUniforms).uv2Offset;
l9_7660=l9_7661;
float2 l9_7662=float2(0.0);
l9_7662=l9_7660;
float2 l9_7663=float2(0.0);
l9_7663=(l9_7646*l9_7659)+l9_7662;
l9_7624=l9_7663;
l9_7626=l9_7624;
}
l9_7622=l9_7626;
l9_7618=l9_7622;
l9_7621=l9_7618;
}
else
{
float2 l9_7664=float2(0.0);
l9_7664=l9_7620.Surface_UVCoord0;
l9_7619=l9_7664;
l9_7621=l9_7619;
}
l9_7617=l9_7621;
float2 l9_7665=float2(0.0);
l9_7665=l9_7617;
float2 l9_7666=float2(0.0);
l9_7666=l9_7665;
l9_7610=l9_7666;
l9_7613=l9_7610;
}
else
{
float2 l9_7667=float2(0.0);
l9_7667=l9_7612.Surface_UVCoord0;
l9_7611=l9_7667;
l9_7613=l9_7611;
}
}
}
}
l9_7606=l9_7613;
float2 l9_7668=float2(0.0);
float2 l9_7669=(*sc_set0.UserUniforms).uv3Scale;
l9_7668=l9_7669;
float2 l9_7670=float2(0.0);
l9_7670=l9_7668;
float2 l9_7671=float2(0.0);
float2 l9_7672=(*sc_set0.UserUniforms).uv3Offset;
l9_7671=l9_7672;
float2 l9_7673=float2(0.0);
l9_7673=l9_7671;
float2 l9_7674=float2(0.0);
l9_7674=(l9_7606*l9_7670)+l9_7673;
float2 l9_7675=float2(0.0);
l9_7675=l9_7674+(l9_7673*(l9_7604.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_7602=l9_7675;
l9_7605=l9_7602;
}
else
{
float2 l9_7676=float2(0.0);
float2 l9_7677=float2(0.0);
float2 l9_7678=float2(0.0);
float2 l9_7679=float2(0.0);
float2 l9_7680=float2(0.0);
float2 l9_7681=float2(0.0);
ssGlobals l9_7682=l9_7604;
float2 l9_7683;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_7684=float2(0.0);
l9_7684=l9_7682.Surface_UVCoord0;
l9_7677=l9_7684;
l9_7683=l9_7677;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_7685=float2(0.0);
l9_7685=l9_7682.Surface_UVCoord1;
l9_7678=l9_7685;
l9_7683=l9_7678;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_7686=float2(0.0);
l9_7686=l9_7682.gScreenCoord;
l9_7679=l9_7686;
l9_7683=l9_7679;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_7687=float2(0.0);
float2 l9_7688=float2(0.0);
float2 l9_7689=float2(0.0);
ssGlobals l9_7690=l9_7682;
float2 l9_7691;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_7692=float2(0.0);
float2 l9_7693=float2(0.0);
float2 l9_7694=float2(0.0);
ssGlobals l9_7695=l9_7690;
float2 l9_7696;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_7697=float2(0.0);
float2 l9_7698=float2(0.0);
float2 l9_7699=float2(0.0);
float2 l9_7700=float2(0.0);
float2 l9_7701=float2(0.0);
ssGlobals l9_7702=l9_7695;
float2 l9_7703;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7704=float2(0.0);
l9_7704=l9_7702.Surface_UVCoord0;
l9_7698=l9_7704;
l9_7703=l9_7698;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7705=float2(0.0);
l9_7705=l9_7702.Surface_UVCoord1;
l9_7699=l9_7705;
l9_7703=l9_7699;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7706=float2(0.0);
l9_7706=l9_7702.gScreenCoord;
l9_7700=l9_7706;
l9_7703=l9_7700;
}
else
{
float2 l9_7707=float2(0.0);
l9_7707=l9_7702.Surface_UVCoord0;
l9_7701=l9_7707;
l9_7703=l9_7701;
}
}
}
l9_7697=l9_7703;
float2 l9_7708=float2(0.0);
float2 l9_7709=(*sc_set0.UserUniforms).uv2Scale;
l9_7708=l9_7709;
float2 l9_7710=float2(0.0);
l9_7710=l9_7708;
float2 l9_7711=float2(0.0);
float2 l9_7712=(*sc_set0.UserUniforms).uv2Offset;
l9_7711=l9_7712;
float2 l9_7713=float2(0.0);
l9_7713=l9_7711;
float2 l9_7714=float2(0.0);
l9_7714=(l9_7697*l9_7710)+l9_7713;
float2 l9_7715=float2(0.0);
l9_7715=l9_7714+(l9_7713*(l9_7695.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_7693=l9_7715;
l9_7696=l9_7693;
}
else
{
float2 l9_7716=float2(0.0);
float2 l9_7717=float2(0.0);
float2 l9_7718=float2(0.0);
float2 l9_7719=float2(0.0);
float2 l9_7720=float2(0.0);
ssGlobals l9_7721=l9_7695;
float2 l9_7722;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_7723=float2(0.0);
l9_7723=l9_7721.Surface_UVCoord0;
l9_7717=l9_7723;
l9_7722=l9_7717;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_7724=float2(0.0);
l9_7724=l9_7721.Surface_UVCoord1;
l9_7718=l9_7724;
l9_7722=l9_7718;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_7725=float2(0.0);
l9_7725=l9_7721.gScreenCoord;
l9_7719=l9_7725;
l9_7722=l9_7719;
}
else
{
float2 l9_7726=float2(0.0);
l9_7726=l9_7721.Surface_UVCoord0;
l9_7720=l9_7726;
l9_7722=l9_7720;
}
}
}
l9_7716=l9_7722;
float2 l9_7727=float2(0.0);
float2 l9_7728=(*sc_set0.UserUniforms).uv2Scale;
l9_7727=l9_7728;
float2 l9_7729=float2(0.0);
l9_7729=l9_7727;
float2 l9_7730=float2(0.0);
float2 l9_7731=(*sc_set0.UserUniforms).uv2Offset;
l9_7730=l9_7731;
float2 l9_7732=float2(0.0);
l9_7732=l9_7730;
float2 l9_7733=float2(0.0);
l9_7733=(l9_7716*l9_7729)+l9_7732;
l9_7694=l9_7733;
l9_7696=l9_7694;
}
l9_7692=l9_7696;
l9_7688=l9_7692;
l9_7691=l9_7688;
}
else
{
float2 l9_7734=float2(0.0);
l9_7734=l9_7690.Surface_UVCoord0;
l9_7689=l9_7734;
l9_7691=l9_7689;
}
l9_7687=l9_7691;
float2 l9_7735=float2(0.0);
l9_7735=l9_7687;
float2 l9_7736=float2(0.0);
l9_7736=l9_7735;
l9_7680=l9_7736;
l9_7683=l9_7680;
}
else
{
float2 l9_7737=float2(0.0);
l9_7737=l9_7682.Surface_UVCoord0;
l9_7681=l9_7737;
l9_7683=l9_7681;
}
}
}
}
l9_7676=l9_7683;
float2 l9_7738=float2(0.0);
float2 l9_7739=(*sc_set0.UserUniforms).uv3Scale;
l9_7738=l9_7739;
float2 l9_7740=float2(0.0);
l9_7740=l9_7738;
float2 l9_7741=float2(0.0);
float2 l9_7742=(*sc_set0.UserUniforms).uv3Offset;
l9_7741=l9_7742;
float2 l9_7743=float2(0.0);
l9_7743=l9_7741;
float2 l9_7744=float2(0.0);
l9_7744=(l9_7676*l9_7740)+l9_7743;
l9_7603=l9_7744;
l9_7605=l9_7603;
}
l9_7601=l9_7605;
l9_7597=l9_7601;
l9_7600=l9_7597;
}
else
{
float2 l9_7745=float2(0.0);
l9_7745=l9_7599.Surface_UVCoord0;
l9_7598=l9_7745;
l9_7600=l9_7598;
}
l9_7596=l9_7600;
float2 l9_7746=float2(0.0);
l9_7746=l9_7596;
float2 l9_7747=float2(0.0);
l9_7747=l9_7746;
l9_7540=l9_7747;
l9_7543=l9_7540;
}
else
{
float2 l9_7748=float2(0.0);
l9_7748=l9_7542.Surface_UVCoord0;
l9_7541=l9_7748;
l9_7543=l9_7541;
}
}
}
}
l9_7536=l9_7543;
float4 l9_7749=float4(0.0);
int l9_7750=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_7751=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7751=0;
}
else
{
l9_7751=in.varStereoViewID;
}
int l9_7752=l9_7751;
l9_7750=1-l9_7752;
}
else
{
int l9_7753=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7753=0;
}
else
{
l9_7753=in.varStereoViewID;
}
int l9_7754=l9_7753;
l9_7750=l9_7754;
}
int l9_7755=l9_7750;
int l9_7756=materialParamsTexLayout_tmp;
int l9_7757=l9_7755;
float2 l9_7758=l9_7536;
bool l9_7759=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_7760=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_7761=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_7762=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_7763=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_7764=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_7765=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_7766=0.0;
bool l9_7767=l9_7764&&(!l9_7762);
float l9_7768=1.0;
float l9_7769=l9_7758.x;
int l9_7770=l9_7761.x;
if (l9_7770==1)
{
l9_7769=fract(l9_7769);
}
else
{
if (l9_7770==2)
{
float l9_7771=fract(l9_7769);
float l9_7772=l9_7769-l9_7771;
float l9_7773=step(0.25,fract(l9_7772*0.5));
l9_7769=mix(l9_7771,1.0-l9_7771,fast::clamp(l9_7773,0.0,1.0));
}
}
l9_7758.x=l9_7769;
float l9_7774=l9_7758.y;
int l9_7775=l9_7761.y;
if (l9_7775==1)
{
l9_7774=fract(l9_7774);
}
else
{
if (l9_7775==2)
{
float l9_7776=fract(l9_7774);
float l9_7777=l9_7774-l9_7776;
float l9_7778=step(0.25,fract(l9_7777*0.5));
l9_7774=mix(l9_7776,1.0-l9_7776,fast::clamp(l9_7778,0.0,1.0));
}
}
l9_7758.y=l9_7774;
if (l9_7762)
{
bool l9_7779=l9_7764;
bool l9_7780;
if (l9_7779)
{
l9_7780=l9_7761.x==3;
}
else
{
l9_7780=l9_7779;
}
float l9_7781=l9_7758.x;
float l9_7782=l9_7763.x;
float l9_7783=l9_7763.z;
bool l9_7784=l9_7780;
float l9_7785=l9_7768;
float l9_7786=fast::clamp(l9_7781,l9_7782,l9_7783);
float l9_7787=step(abs(l9_7781-l9_7786),9.9999997e-06);
l9_7785*=(l9_7787+((1.0-float(l9_7784))*(1.0-l9_7787)));
l9_7781=l9_7786;
l9_7758.x=l9_7781;
l9_7768=l9_7785;
bool l9_7788=l9_7764;
bool l9_7789;
if (l9_7788)
{
l9_7789=l9_7761.y==3;
}
else
{
l9_7789=l9_7788;
}
float l9_7790=l9_7758.y;
float l9_7791=l9_7763.y;
float l9_7792=l9_7763.w;
bool l9_7793=l9_7789;
float l9_7794=l9_7768;
float l9_7795=fast::clamp(l9_7790,l9_7791,l9_7792);
float l9_7796=step(abs(l9_7790-l9_7795),9.9999997e-06);
l9_7794*=(l9_7796+((1.0-float(l9_7793))*(1.0-l9_7796)));
l9_7790=l9_7795;
l9_7758.y=l9_7790;
l9_7768=l9_7794;
}
float2 l9_7797=l9_7758;
bool l9_7798=l9_7759;
float3x3 l9_7799=l9_7760;
if (l9_7798)
{
l9_7797=float2((l9_7799*float3(l9_7797,1.0)).xy);
}
float2 l9_7800=l9_7797;
float2 l9_7801=l9_7800;
float2 l9_7802=l9_7801;
l9_7758=l9_7802;
float l9_7803=l9_7758.x;
int l9_7804=l9_7761.x;
bool l9_7805=l9_7767;
float l9_7806=l9_7768;
if ((l9_7804==0)||(l9_7804==3))
{
float l9_7807=l9_7803;
float l9_7808=0.0;
float l9_7809=1.0;
bool l9_7810=l9_7805;
float l9_7811=l9_7806;
float l9_7812=fast::clamp(l9_7807,l9_7808,l9_7809);
float l9_7813=step(abs(l9_7807-l9_7812),9.9999997e-06);
l9_7811*=(l9_7813+((1.0-float(l9_7810))*(1.0-l9_7813)));
l9_7807=l9_7812;
l9_7803=l9_7807;
l9_7806=l9_7811;
}
l9_7758.x=l9_7803;
l9_7768=l9_7806;
float l9_7814=l9_7758.y;
int l9_7815=l9_7761.y;
bool l9_7816=l9_7767;
float l9_7817=l9_7768;
if ((l9_7815==0)||(l9_7815==3))
{
float l9_7818=l9_7814;
float l9_7819=0.0;
float l9_7820=1.0;
bool l9_7821=l9_7816;
float l9_7822=l9_7817;
float l9_7823=fast::clamp(l9_7818,l9_7819,l9_7820);
float l9_7824=step(abs(l9_7818-l9_7823),9.9999997e-06);
l9_7822*=(l9_7824+((1.0-float(l9_7821))*(1.0-l9_7824)));
l9_7818=l9_7823;
l9_7814=l9_7818;
l9_7817=l9_7822;
}
l9_7758.y=l9_7814;
l9_7768=l9_7817;
float2 l9_7825=l9_7758;
int l9_7826=l9_7756;
int l9_7827=l9_7757;
float l9_7828=l9_7766;
float2 l9_7829=l9_7825;
int l9_7830=l9_7826;
int l9_7831=l9_7827;
float3 l9_7832=float3(0.0);
if (l9_7830==0)
{
l9_7832=float3(l9_7829,0.0);
}
else
{
if (l9_7830==1)
{
l9_7832=float3(l9_7829.x,(l9_7829.y*0.5)+(0.5-(float(l9_7831)*0.5)),0.0);
}
else
{
l9_7832=float3(l9_7829,float(l9_7831));
}
}
float3 l9_7833=l9_7832;
float3 l9_7834=l9_7833;
float2 l9_7835=l9_7834.xy;
float l9_7836=l9_7828;
float4 l9_7837=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_7835,bias(l9_7836));
float4 l9_7838=l9_7837;
float4 l9_7839=l9_7838;
if (l9_7764)
{
l9_7839=mix(l9_7765,l9_7839,float4(l9_7768));
}
float4 l9_7840=l9_7839;
l9_7749=l9_7840;
float3 l9_7841=float3(0.0);
l9_7841=float3(l9_7749.z,l9_7749.z,l9_7749.z);
l9_7225=l9_7841;
l9_7227=l9_7225;
}
l9_7223=l9_7227;
float3 l9_7842=float3(0.0);
l9_7842=mix(l9_7222,(*sc_set0.UserUniforms).Port_Input1_N322,l9_7223);
float l9_7843=0.0;
float l9_7844=(*sc_set0.UserUniforms).specularAoIntensity;
l9_7843=l9_7844;
float l9_7845=0.0;
l9_7845=l9_7843;
float3 l9_7846=float3(0.0);
l9_7846=mix((*sc_set0.UserUniforms).Port_Input0_N325,l9_7842,float3(l9_7845));
l9_6899=l9_7846;
l9_6902=l9_6899;
}
else
{
l9_6902=l9_6900;
}
l9_6898=l9_6902;
param_62=l9_6898;
param_63=param_62;
}
Result_N79=param_63;
float3 Export_N232=float3(0.0);
Export_N232=Result_N79;
float4 Output_N36=float4(0.0);
float3 param_65=Export_N364.xyz;
float param_66=Export_N158;
float3 param_67=Export_N334;
float3 param_68=Export_N300;
float param_69=Export_N222;
float param_70=Export_N224;
float3 param_71=Export_N230;
float3 param_72=Export_N232;
ssGlobals param_74=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_74.BumpedNormal=param_67;
}
param_66=fast::clamp(param_66,0.0,1.0);
float l9_7847=param_66;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_7847<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_7848=gl_FragCoord;
float2 l9_7849=floor(mod(l9_7848.xy,float2(4.0)));
float l9_7850=(mod(dot(l9_7849,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_7847<l9_7850)
{
discard_fragment();
}
}
param_65=fast::max(param_65,float3(0.0));
float4 param_73;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_73=float4(param_65,param_66);
}
else
{
param_68=fast::max(param_68,float3(0.0));
param_69=fast::clamp(param_69,0.0,1.0);
param_70=fast::clamp(param_70,0.0,1.0);
param_71=fast::clamp(param_71,float3(0.0),float3(1.0));
param_72=fast::clamp(param_72,float3(0.0),float3(1.0));
float3 l9_7851=param_65;
float l9_7852=param_66;
float3 l9_7853=param_74.BumpedNormal;
float3 l9_7854=param_74.PositionWS;
float3 l9_7855=param_74.ViewDirWS;
float3 l9_7856=param_68;
float l9_7857=param_69;
float l9_7858=param_70;
float3 l9_7859=param_71;
float3 l9_7860=param_72;
param_73=ngsCalculateLighting(l9_7851,l9_7852,l9_7853,l9_7854,l9_7855,l9_7856,l9_7857,l9_7858,l9_7859,l9_7860,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
param_73=fast::max(param_73,float4(0.0));
Output_N36=param_73;
FinalColor=Output_N36;
bool l9_7861=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_7861)
{
float4 param_75=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_75.w=1.0;
}
float4 l9_7862=fast::max(param_75,float4(0.0));
float4 param_76=l9_7862;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_76.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_76;
return out;
}
float4 param_77=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_7863=param_77;
float4 l9_7864=l9_7863;
float l9_7865=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_7865=l9_7864.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_7865=fast::clamp(l9_7864.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_7865=fast::clamp(dot(l9_7864.xyz,float3(l9_7864.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_7865=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_7865=(1.0-dot(l9_7864.xyz,float3(0.33333001)))*l9_7864.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_7865=(1.0-fast::clamp(dot(l9_7864.xyz,float3(1.0)),0.0,1.0))*l9_7864.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_7865=fast::clamp(dot(l9_7864.xyz,float3(1.0)),0.0,1.0)*l9_7864.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_7865=fast::clamp(dot(l9_7864.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_7865=fast::clamp(dot(l9_7864.xyz,float3(1.0)),0.0,1.0)*l9_7864.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_7865=dot(l9_7864.xyz,float3(0.33333001))*l9_7864.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_7865=1.0-fast::clamp(dot(l9_7864.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_7865=fast::clamp(dot(l9_7864.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_7866=l9_7865;
float l9_7867=l9_7866;
float l9_7868=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_7867;
float3 l9_7869=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_7863.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_7870=float4(l9_7869.x,l9_7869.y,l9_7869.z,l9_7868);
param_77=l9_7870;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_77=float4(param_77.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_7871=param_77;
float4 l9_7872=float4(0.0);
float4 l9_7873=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_7874=out.FragColor0;
float4 l9_7875=l9_7874;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_7875.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_7876=l9_7875;
l9_7873=l9_7876;
}
else
{
float4 l9_7877=gl_FragCoord;
float2 l9_7878=l9_7877.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_7879=l9_7878;
float2 l9_7880=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_7881=1;
int l9_7882=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7882=0;
}
else
{
l9_7882=in.varStereoViewID;
}
int l9_7883=l9_7882;
int l9_7884=l9_7883;
float3 l9_7885=float3(l9_7879,0.0);
int l9_7886=l9_7881;
int l9_7887=l9_7884;
if (l9_7886==1)
{
l9_7885.y=((2.0*l9_7885.y)+float(l9_7887))-1.0;
}
float2 l9_7888=l9_7885.xy;
l9_7880=l9_7888;
}
else
{
l9_7880=l9_7879;
}
float2 l9_7889=l9_7880;
float2 l9_7890=l9_7889;
float2 l9_7891=l9_7890;
int l9_7892=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_7893=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7893=0;
}
else
{
l9_7893=in.varStereoViewID;
}
int l9_7894=l9_7893;
l9_7892=1-l9_7894;
}
else
{
int l9_7895=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7895=0;
}
else
{
l9_7895=in.varStereoViewID;
}
int l9_7896=l9_7895;
l9_7892=l9_7896;
}
int l9_7897=l9_7892;
float2 l9_7898=l9_7891;
int l9_7899=l9_7897;
float2 l9_7900=l9_7898;
int l9_7901=l9_7899;
float l9_7902=0.0;
float4 l9_7903=float4(0.0);
float2 l9_7904=l9_7900;
int l9_7905=sc_ScreenTextureLayout_tmp;
int l9_7906=l9_7901;
float l9_7907=l9_7902;
float2 l9_7908=l9_7904;
int l9_7909=l9_7905;
int l9_7910=l9_7906;
float3 l9_7911=float3(0.0);
if (l9_7909==0)
{
l9_7911=float3(l9_7908,0.0);
}
else
{
if (l9_7909==1)
{
l9_7911=float3(l9_7908.x,(l9_7908.y*0.5)+(0.5-(float(l9_7910)*0.5)),0.0);
}
else
{
l9_7911=float3(l9_7908,float(l9_7910));
}
}
float3 l9_7912=l9_7911;
float3 l9_7913=l9_7912;
float2 l9_7914=l9_7913.xy;
float l9_7915=l9_7907;
float4 l9_7916=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_7914,bias(l9_7915));
float4 l9_7917=l9_7916;
l9_7903=l9_7917;
float4 l9_7918=l9_7903;
float4 l9_7919=l9_7918;
float4 l9_7920=l9_7919;
l9_7873=l9_7920;
}
float4 l9_7921=l9_7873;
float4 l9_7922=l9_7921;
float3 l9_7923=l9_7922.xyz;
float3 l9_7924=l9_7923;
float3 l9_7925=l9_7871.xyz;
float3 l9_7926=definedBlend(l9_7924,l9_7925,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_7872=float4(l9_7926.x,l9_7926.y,l9_7926.z,l9_7872.w);
float3 l9_7927=mix(l9_7923,l9_7872.xyz,float3(l9_7871.w));
l9_7872=float4(l9_7927.x,l9_7927.y,l9_7927.z,l9_7872.w);
l9_7872.w=1.0;
float4 l9_7928=l9_7872;
param_77=l9_7928;
}
else
{
float4 l9_7929=param_77;
float4 l9_7930=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_7930=float4(mix(float3(1.0),l9_7929.xyz,float3(l9_7929.w)),l9_7929.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_7931=l9_7929.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_7931=fast::clamp(l9_7931,0.0,1.0);
}
l9_7930=float4(l9_7929.xyz*l9_7931,l9_7931);
}
else
{
l9_7930=l9_7929;
}
}
float4 l9_7932=l9_7930;
param_77=l9_7932;
}
}
}
float4 l9_7933=param_77;
FinalColor=l9_7933;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_7934=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_7934=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_7934=float4(0.0);
}
float4 l9_7935=l9_7934;
float4 Cost=l9_7935;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_78=in.varPos;
float4 param_79=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_78,param_79,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_80=FinalColor;
float4 l9_7936=param_80;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_7936.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_7936;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float metallic;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float roughness;
float specularAoDarkening;
float specularAoIntensity;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float3 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float3 Port_Default_N103;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float Port_Import_N277;
float Port_Import_N280;
float2 Port_Import_N241;
float2 Port_Import_N246;
float Port_Import_N278;
float Port_Import_N186;
float Port_Input1_N187;
float Port_Import_N078;
float3 Port_Value1_N079;
float Port_Import_N281;
float3 Port_Input0_N325;
float Port_Import_N283;
float3 Port_Input0_N239;
float3 Port_Import_N235;
float3 Port_Input1_N322;
float Port_Import_N282;
float3 Port_Default_N326;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> materialParamsTex [[id(8)]];
texture2d<float> normalTex [[id(9)]];
texture2d<float> opacityTex [[id(10)]];
texture2d<float> reflectionModulationTex [[id(11)]];
texture2d<float> reflectionTex [[id(12)]];
texture2d<float> rimColorTex [[id(13)]];
texture2d<float> sc_EnvmapDiffuse [[id(14)]];
texture2d<float> sc_EnvmapSpecular [[id(15)]];
texture2d<float> sc_RayTracedAoTexture [[id(24)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(25)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(26)]];
texture2d<float> sc_RayTracedShadowTexture [[id(27)]];
texture2d<float> sc_SSAOTexture [[id(28)]];
texture2d<float> sc_ScreenTexture [[id(29)]];
texture2d<float> sc_ShadowTexture [[id(30)]];
texture2d<uint> z_hitIdAndBarycentric [[id(32)]];
texture2d<float> z_rayDirections [[id(33)]];
sampler baseTexSmpSC [[id(34)]];
sampler detailNormalTexSmpSC [[id(35)]];
sampler emissiveTexSmpSC [[id(36)]];
sampler intensityTextureSmpSC [[id(37)]];
sampler materialParamsTexSmpSC [[id(38)]];
sampler normalTexSmpSC [[id(39)]];
sampler opacityTexSmpSC [[id(40)]];
sampler reflectionModulationTexSmpSC [[id(41)]];
sampler reflectionTexSmpSC [[id(42)]];
sampler rimColorTexSmpSC [[id(43)]];
sampler sc_EnvmapDiffuseSmpSC [[id(44)]];
sampler sc_EnvmapSpecularSmpSC [[id(45)]];
sampler sc_RayTracedAoTextureSmpSC [[id(47)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(48)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(49)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(50)]];
sampler sc_SSAOTextureSmpSC [[id(51)]];
sampler sc_ScreenTextureSmpSC [[id(52)]];
sampler sc_ShadowTextureSmpSC [[id(53)]];
sampler z_hitIdAndBarycentricSmp [[id(55)]];
sampler z_rayDirectionsSmpSC [[id(56)]];
constant userUniformsObj* UserUniforms [[id(57)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_0=gl_FragCoord;
float2 l9_1=l9_0.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2=l9_1;
float2 l9_3=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4=1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
int l9_7=l9_6;
float3 l9_8=float3(l9_2,0.0);
int l9_9=l9_4;
int l9_10=l9_7;
if (l9_9==1)
{
l9_8.y=((2.0*l9_8.y)+float(l9_10))-1.0;
}
float2 l9_11=l9_8.xy;
l9_3=l9_11;
}
else
{
l9_3=l9_2;
}
float2 l9_12=l9_3;
float2 l9_13=l9_12;
Globals.gScreenCoord=l9_13;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float4 Output_N5=float4(0.0);
float4 param=(*sc_set0.UserUniforms).baseColor;
Output_N5=param;
float4 Value_N384=float4(0.0);
Value_N384=Output_N5;
float4 Result_N369=float4(0.0);
float4 param_1=float4(0.0);
float4 param_2=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals param_4=Globals;
float4 param_3;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_14=float2(0.0);
float2 l9_15=float2(0.0);
float2 l9_16=float2(0.0);
float2 l9_17=float2(0.0);
float2 l9_18=float2(0.0);
float2 l9_19=float2(0.0);
ssGlobals l9_20=param_4;
float2 l9_21;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_22=float2(0.0);
l9_22=l9_20.Surface_UVCoord0;
l9_15=l9_22;
l9_21=l9_15;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_23=float2(0.0);
l9_23=l9_20.Surface_UVCoord1;
l9_16=l9_23;
l9_21=l9_16;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_24=float2(0.0);
float2 l9_25=float2(0.0);
float2 l9_26=float2(0.0);
ssGlobals l9_27=l9_20;
float2 l9_28;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_29=float2(0.0);
float2 l9_30=float2(0.0);
float2 l9_31=float2(0.0);
ssGlobals l9_32=l9_27;
float2 l9_33;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_34=float2(0.0);
float2 l9_35=float2(0.0);
float2 l9_36=float2(0.0);
float2 l9_37=float2(0.0);
float2 l9_38=float2(0.0);
ssGlobals l9_39=l9_32;
float2 l9_40;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_41=float2(0.0);
l9_41=l9_39.Surface_UVCoord0;
l9_35=l9_41;
l9_40=l9_35;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_42=float2(0.0);
l9_42=l9_39.Surface_UVCoord1;
l9_36=l9_42;
l9_40=l9_36;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_43=float2(0.0);
l9_43=l9_39.gScreenCoord;
l9_37=l9_43;
l9_40=l9_37;
}
else
{
float2 l9_44=float2(0.0);
l9_44=l9_39.Surface_UVCoord0;
l9_38=l9_44;
l9_40=l9_38;
}
}
}
l9_34=l9_40;
float2 l9_45=float2(0.0);
float2 l9_46=(*sc_set0.UserUniforms).uv2Scale;
l9_45=l9_46;
float2 l9_47=float2(0.0);
l9_47=l9_45;
float2 l9_48=float2(0.0);
float2 l9_49=(*sc_set0.UserUniforms).uv2Offset;
l9_48=l9_49;
float2 l9_50=float2(0.0);
l9_50=l9_48;
float2 l9_51=float2(0.0);
l9_51=(l9_34*l9_47)+l9_50;
float2 l9_52=float2(0.0);
l9_52=l9_51+(l9_50*(l9_32.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_30=l9_52;
l9_33=l9_30;
}
else
{
float2 l9_53=float2(0.0);
float2 l9_54=float2(0.0);
float2 l9_55=float2(0.0);
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
ssGlobals l9_58=l9_32;
float2 l9_59;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_60=float2(0.0);
l9_60=l9_58.Surface_UVCoord0;
l9_54=l9_60;
l9_59=l9_54;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_61=float2(0.0);
l9_61=l9_58.Surface_UVCoord1;
l9_55=l9_61;
l9_59=l9_55;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_62=float2(0.0);
l9_62=l9_58.gScreenCoord;
l9_56=l9_62;
l9_59=l9_56;
}
else
{
float2 l9_63=float2(0.0);
l9_63=l9_58.Surface_UVCoord0;
l9_57=l9_63;
l9_59=l9_57;
}
}
}
l9_53=l9_59;
float2 l9_64=float2(0.0);
float2 l9_65=(*sc_set0.UserUniforms).uv2Scale;
l9_64=l9_65;
float2 l9_66=float2(0.0);
l9_66=l9_64;
float2 l9_67=float2(0.0);
float2 l9_68=(*sc_set0.UserUniforms).uv2Offset;
l9_67=l9_68;
float2 l9_69=float2(0.0);
l9_69=l9_67;
float2 l9_70=float2(0.0);
l9_70=(l9_53*l9_66)+l9_69;
l9_31=l9_70;
l9_33=l9_31;
}
l9_29=l9_33;
l9_25=l9_29;
l9_28=l9_25;
}
else
{
float2 l9_71=float2(0.0);
l9_71=l9_27.Surface_UVCoord0;
l9_26=l9_71;
l9_28=l9_26;
}
l9_24=l9_28;
float2 l9_72=float2(0.0);
l9_72=l9_24;
float2 l9_73=float2(0.0);
l9_73=l9_72;
l9_17=l9_73;
l9_21=l9_17;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_74=float2(0.0);
float2 l9_75=float2(0.0);
float2 l9_76=float2(0.0);
ssGlobals l9_77=l9_20;
float2 l9_78;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_79=float2(0.0);
float2 l9_80=float2(0.0);
float2 l9_81=float2(0.0);
ssGlobals l9_82=l9_77;
float2 l9_83;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_84=float2(0.0);
float2 l9_85=float2(0.0);
float2 l9_86=float2(0.0);
float2 l9_87=float2(0.0);
float2 l9_88=float2(0.0);
float2 l9_89=float2(0.0);
ssGlobals l9_90=l9_82;
float2 l9_91;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_92=float2(0.0);
l9_92=l9_90.Surface_UVCoord0;
l9_85=l9_92;
l9_91=l9_85;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_93=float2(0.0);
l9_93=l9_90.Surface_UVCoord1;
l9_86=l9_93;
l9_91=l9_86;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_94=float2(0.0);
l9_94=l9_90.gScreenCoord;
l9_87=l9_94;
l9_91=l9_87;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_95=float2(0.0);
float2 l9_96=float2(0.0);
float2 l9_97=float2(0.0);
ssGlobals l9_98=l9_90;
float2 l9_99;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_100=float2(0.0);
float2 l9_101=float2(0.0);
float2 l9_102=float2(0.0);
ssGlobals l9_103=l9_98;
float2 l9_104;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_105=float2(0.0);
float2 l9_106=float2(0.0);
float2 l9_107=float2(0.0);
float2 l9_108=float2(0.0);
float2 l9_109=float2(0.0);
ssGlobals l9_110=l9_103;
float2 l9_111;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_112=float2(0.0);
l9_112=l9_110.Surface_UVCoord0;
l9_106=l9_112;
l9_111=l9_106;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_113=float2(0.0);
l9_113=l9_110.Surface_UVCoord1;
l9_107=l9_113;
l9_111=l9_107;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_114=float2(0.0);
l9_114=l9_110.gScreenCoord;
l9_108=l9_114;
l9_111=l9_108;
}
else
{
float2 l9_115=float2(0.0);
l9_115=l9_110.Surface_UVCoord0;
l9_109=l9_115;
l9_111=l9_109;
}
}
}
l9_105=l9_111;
float2 l9_116=float2(0.0);
float2 l9_117=(*sc_set0.UserUniforms).uv2Scale;
l9_116=l9_117;
float2 l9_118=float2(0.0);
l9_118=l9_116;
float2 l9_119=float2(0.0);
float2 l9_120=(*sc_set0.UserUniforms).uv2Offset;
l9_119=l9_120;
float2 l9_121=float2(0.0);
l9_121=l9_119;
float2 l9_122=float2(0.0);
l9_122=(l9_105*l9_118)+l9_121;
float2 l9_123=float2(0.0);
l9_123=l9_122+(l9_121*(l9_103.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_101=l9_123;
l9_104=l9_101;
}
else
{
float2 l9_124=float2(0.0);
float2 l9_125=float2(0.0);
float2 l9_126=float2(0.0);
float2 l9_127=float2(0.0);
float2 l9_128=float2(0.0);
ssGlobals l9_129=l9_103;
float2 l9_130;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_131=float2(0.0);
l9_131=l9_129.Surface_UVCoord0;
l9_125=l9_131;
l9_130=l9_125;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_132=float2(0.0);
l9_132=l9_129.Surface_UVCoord1;
l9_126=l9_132;
l9_130=l9_126;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_133=float2(0.0);
l9_133=l9_129.gScreenCoord;
l9_127=l9_133;
l9_130=l9_127;
}
else
{
float2 l9_134=float2(0.0);
l9_134=l9_129.Surface_UVCoord0;
l9_128=l9_134;
l9_130=l9_128;
}
}
}
l9_124=l9_130;
float2 l9_135=float2(0.0);
float2 l9_136=(*sc_set0.UserUniforms).uv2Scale;
l9_135=l9_136;
float2 l9_137=float2(0.0);
l9_137=l9_135;
float2 l9_138=float2(0.0);
float2 l9_139=(*sc_set0.UserUniforms).uv2Offset;
l9_138=l9_139;
float2 l9_140=float2(0.0);
l9_140=l9_138;
float2 l9_141=float2(0.0);
l9_141=(l9_124*l9_137)+l9_140;
l9_102=l9_141;
l9_104=l9_102;
}
l9_100=l9_104;
l9_96=l9_100;
l9_99=l9_96;
}
else
{
float2 l9_142=float2(0.0);
l9_142=l9_98.Surface_UVCoord0;
l9_97=l9_142;
l9_99=l9_97;
}
l9_95=l9_99;
float2 l9_143=float2(0.0);
l9_143=l9_95;
float2 l9_144=float2(0.0);
l9_144=l9_143;
l9_88=l9_144;
l9_91=l9_88;
}
else
{
float2 l9_145=float2(0.0);
l9_145=l9_90.Surface_UVCoord0;
l9_89=l9_145;
l9_91=l9_89;
}
}
}
}
l9_84=l9_91;
float2 l9_146=float2(0.0);
float2 l9_147=(*sc_set0.UserUniforms).uv3Scale;
l9_146=l9_147;
float2 l9_148=float2(0.0);
l9_148=l9_146;
float2 l9_149=float2(0.0);
float2 l9_150=(*sc_set0.UserUniforms).uv3Offset;
l9_149=l9_150;
float2 l9_151=float2(0.0);
l9_151=l9_149;
float2 l9_152=float2(0.0);
l9_152=(l9_84*l9_148)+l9_151;
float2 l9_153=float2(0.0);
l9_153=l9_152+(l9_151*(l9_82.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_80=l9_153;
l9_83=l9_80;
}
else
{
float2 l9_154=float2(0.0);
float2 l9_155=float2(0.0);
float2 l9_156=float2(0.0);
float2 l9_157=float2(0.0);
float2 l9_158=float2(0.0);
float2 l9_159=float2(0.0);
ssGlobals l9_160=l9_82;
float2 l9_161;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_162=float2(0.0);
l9_162=l9_160.Surface_UVCoord0;
l9_155=l9_162;
l9_161=l9_155;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_163=float2(0.0);
l9_163=l9_160.Surface_UVCoord1;
l9_156=l9_163;
l9_161=l9_156;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_164=float2(0.0);
l9_164=l9_160.gScreenCoord;
l9_157=l9_164;
l9_161=l9_157;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_165=float2(0.0);
float2 l9_166=float2(0.0);
float2 l9_167=float2(0.0);
ssGlobals l9_168=l9_160;
float2 l9_169;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_170=float2(0.0);
float2 l9_171=float2(0.0);
float2 l9_172=float2(0.0);
ssGlobals l9_173=l9_168;
float2 l9_174;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_175=float2(0.0);
float2 l9_176=float2(0.0);
float2 l9_177=float2(0.0);
float2 l9_178=float2(0.0);
float2 l9_179=float2(0.0);
ssGlobals l9_180=l9_173;
float2 l9_181;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_182=float2(0.0);
l9_182=l9_180.Surface_UVCoord0;
l9_176=l9_182;
l9_181=l9_176;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_183=float2(0.0);
l9_183=l9_180.Surface_UVCoord1;
l9_177=l9_183;
l9_181=l9_177;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_184=float2(0.0);
l9_184=l9_180.gScreenCoord;
l9_178=l9_184;
l9_181=l9_178;
}
else
{
float2 l9_185=float2(0.0);
l9_185=l9_180.Surface_UVCoord0;
l9_179=l9_185;
l9_181=l9_179;
}
}
}
l9_175=l9_181;
float2 l9_186=float2(0.0);
float2 l9_187=(*sc_set0.UserUniforms).uv2Scale;
l9_186=l9_187;
float2 l9_188=float2(0.0);
l9_188=l9_186;
float2 l9_189=float2(0.0);
float2 l9_190=(*sc_set0.UserUniforms).uv2Offset;
l9_189=l9_190;
float2 l9_191=float2(0.0);
l9_191=l9_189;
float2 l9_192=float2(0.0);
l9_192=(l9_175*l9_188)+l9_191;
float2 l9_193=float2(0.0);
l9_193=l9_192+(l9_191*(l9_173.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_171=l9_193;
l9_174=l9_171;
}
else
{
float2 l9_194=float2(0.0);
float2 l9_195=float2(0.0);
float2 l9_196=float2(0.0);
float2 l9_197=float2(0.0);
float2 l9_198=float2(0.0);
ssGlobals l9_199=l9_173;
float2 l9_200;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_201=float2(0.0);
l9_201=l9_199.Surface_UVCoord0;
l9_195=l9_201;
l9_200=l9_195;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_202=float2(0.0);
l9_202=l9_199.Surface_UVCoord1;
l9_196=l9_202;
l9_200=l9_196;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_203=float2(0.0);
l9_203=l9_199.gScreenCoord;
l9_197=l9_203;
l9_200=l9_197;
}
else
{
float2 l9_204=float2(0.0);
l9_204=l9_199.Surface_UVCoord0;
l9_198=l9_204;
l9_200=l9_198;
}
}
}
l9_194=l9_200;
float2 l9_205=float2(0.0);
float2 l9_206=(*sc_set0.UserUniforms).uv2Scale;
l9_205=l9_206;
float2 l9_207=float2(0.0);
l9_207=l9_205;
float2 l9_208=float2(0.0);
float2 l9_209=(*sc_set0.UserUniforms).uv2Offset;
l9_208=l9_209;
float2 l9_210=float2(0.0);
l9_210=l9_208;
float2 l9_211=float2(0.0);
l9_211=(l9_194*l9_207)+l9_210;
l9_172=l9_211;
l9_174=l9_172;
}
l9_170=l9_174;
l9_166=l9_170;
l9_169=l9_166;
}
else
{
float2 l9_212=float2(0.0);
l9_212=l9_168.Surface_UVCoord0;
l9_167=l9_212;
l9_169=l9_167;
}
l9_165=l9_169;
float2 l9_213=float2(0.0);
l9_213=l9_165;
float2 l9_214=float2(0.0);
l9_214=l9_213;
l9_158=l9_214;
l9_161=l9_158;
}
else
{
float2 l9_215=float2(0.0);
l9_215=l9_160.Surface_UVCoord0;
l9_159=l9_215;
l9_161=l9_159;
}
}
}
}
l9_154=l9_161;
float2 l9_216=float2(0.0);
float2 l9_217=(*sc_set0.UserUniforms).uv3Scale;
l9_216=l9_217;
float2 l9_218=float2(0.0);
l9_218=l9_216;
float2 l9_219=float2(0.0);
float2 l9_220=(*sc_set0.UserUniforms).uv3Offset;
l9_219=l9_220;
float2 l9_221=float2(0.0);
l9_221=l9_219;
float2 l9_222=float2(0.0);
l9_222=(l9_154*l9_218)+l9_221;
l9_81=l9_222;
l9_83=l9_81;
}
l9_79=l9_83;
l9_75=l9_79;
l9_78=l9_75;
}
else
{
float2 l9_223=float2(0.0);
l9_223=l9_77.Surface_UVCoord0;
l9_76=l9_223;
l9_78=l9_76;
}
l9_74=l9_78;
float2 l9_224=float2(0.0);
l9_224=l9_74;
float2 l9_225=float2(0.0);
l9_225=l9_224;
l9_18=l9_225;
l9_21=l9_18;
}
else
{
float2 l9_226=float2(0.0);
l9_226=l9_20.Surface_UVCoord0;
l9_19=l9_226;
l9_21=l9_19;
}
}
}
}
l9_14=l9_21;
float4 l9_227=float4(0.0);
int l9_228=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=in.varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=in.varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=baseTexLayout_tmp;
int l9_235=l9_233;
float2 l9_236=l9_14;
bool l9_237=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_238=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_241=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_243=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
l9_227=l9_318;
param_1=l9_227;
param_3=param_1;
}
else
{
param_3=param_2;
}
Result_N369=param_3;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_5=0.0;
float param_6=(*sc_set0.UserUniforms).Port_Default_N204;
ssGlobals param_8=Globals;
float param_7;
if ((int(Tweak_N308_tmp)!=0))
{
float2 l9_319=float2(0.0);
float2 l9_320=float2(0.0);
float2 l9_321=float2(0.0);
float2 l9_322=float2(0.0);
float2 l9_323=float2(0.0);
float2 l9_324=float2(0.0);
ssGlobals l9_325=param_8;
float2 l9_326;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_327=float2(0.0);
l9_327=l9_325.Surface_UVCoord0;
l9_320=l9_327;
l9_326=l9_320;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_328=float2(0.0);
l9_328=l9_325.Surface_UVCoord1;
l9_321=l9_328;
l9_326=l9_321;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_329=float2(0.0);
float2 l9_330=float2(0.0);
float2 l9_331=float2(0.0);
ssGlobals l9_332=l9_325;
float2 l9_333;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_334=float2(0.0);
float2 l9_335=float2(0.0);
float2 l9_336=float2(0.0);
ssGlobals l9_337=l9_332;
float2 l9_338;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_339=float2(0.0);
float2 l9_340=float2(0.0);
float2 l9_341=float2(0.0);
float2 l9_342=float2(0.0);
float2 l9_343=float2(0.0);
ssGlobals l9_344=l9_337;
float2 l9_345;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_346=float2(0.0);
l9_346=l9_344.Surface_UVCoord0;
l9_340=l9_346;
l9_345=l9_340;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_347=float2(0.0);
l9_347=l9_344.Surface_UVCoord1;
l9_341=l9_347;
l9_345=l9_341;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_348=float2(0.0);
l9_348=l9_344.gScreenCoord;
l9_342=l9_348;
l9_345=l9_342;
}
else
{
float2 l9_349=float2(0.0);
l9_349=l9_344.Surface_UVCoord0;
l9_343=l9_349;
l9_345=l9_343;
}
}
}
l9_339=l9_345;
float2 l9_350=float2(0.0);
float2 l9_351=(*sc_set0.UserUniforms).uv2Scale;
l9_350=l9_351;
float2 l9_352=float2(0.0);
l9_352=l9_350;
float2 l9_353=float2(0.0);
float2 l9_354=(*sc_set0.UserUniforms).uv2Offset;
l9_353=l9_354;
float2 l9_355=float2(0.0);
l9_355=l9_353;
float2 l9_356=float2(0.0);
l9_356=(l9_339*l9_352)+l9_355;
float2 l9_357=float2(0.0);
l9_357=l9_356+(l9_355*(l9_337.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_335=l9_357;
l9_338=l9_335;
}
else
{
float2 l9_358=float2(0.0);
float2 l9_359=float2(0.0);
float2 l9_360=float2(0.0);
float2 l9_361=float2(0.0);
float2 l9_362=float2(0.0);
ssGlobals l9_363=l9_337;
float2 l9_364;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_365=float2(0.0);
l9_365=l9_363.Surface_UVCoord0;
l9_359=l9_365;
l9_364=l9_359;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_366=float2(0.0);
l9_366=l9_363.Surface_UVCoord1;
l9_360=l9_366;
l9_364=l9_360;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_367=float2(0.0);
l9_367=l9_363.gScreenCoord;
l9_361=l9_367;
l9_364=l9_361;
}
else
{
float2 l9_368=float2(0.0);
l9_368=l9_363.Surface_UVCoord0;
l9_362=l9_368;
l9_364=l9_362;
}
}
}
l9_358=l9_364;
float2 l9_369=float2(0.0);
float2 l9_370=(*sc_set0.UserUniforms).uv2Scale;
l9_369=l9_370;
float2 l9_371=float2(0.0);
l9_371=l9_369;
float2 l9_372=float2(0.0);
float2 l9_373=(*sc_set0.UserUniforms).uv2Offset;
l9_372=l9_373;
float2 l9_374=float2(0.0);
l9_374=l9_372;
float2 l9_375=float2(0.0);
l9_375=(l9_358*l9_371)+l9_374;
l9_336=l9_375;
l9_338=l9_336;
}
l9_334=l9_338;
l9_330=l9_334;
l9_333=l9_330;
}
else
{
float2 l9_376=float2(0.0);
l9_376=l9_332.Surface_UVCoord0;
l9_331=l9_376;
l9_333=l9_331;
}
l9_329=l9_333;
float2 l9_377=float2(0.0);
l9_377=l9_329;
float2 l9_378=float2(0.0);
l9_378=l9_377;
l9_322=l9_378;
l9_326=l9_322;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_379=float2(0.0);
float2 l9_380=float2(0.0);
float2 l9_381=float2(0.0);
ssGlobals l9_382=l9_325;
float2 l9_383;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_384=float2(0.0);
float2 l9_385=float2(0.0);
float2 l9_386=float2(0.0);
ssGlobals l9_387=l9_382;
float2 l9_388;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_389=float2(0.0);
float2 l9_390=float2(0.0);
float2 l9_391=float2(0.0);
float2 l9_392=float2(0.0);
float2 l9_393=float2(0.0);
float2 l9_394=float2(0.0);
ssGlobals l9_395=l9_387;
float2 l9_396;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_397=float2(0.0);
l9_397=l9_395.Surface_UVCoord0;
l9_390=l9_397;
l9_396=l9_390;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_398=float2(0.0);
l9_398=l9_395.Surface_UVCoord1;
l9_391=l9_398;
l9_396=l9_391;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_399=float2(0.0);
l9_399=l9_395.gScreenCoord;
l9_392=l9_399;
l9_396=l9_392;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_400=float2(0.0);
float2 l9_401=float2(0.0);
float2 l9_402=float2(0.0);
ssGlobals l9_403=l9_395;
float2 l9_404;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_405=float2(0.0);
float2 l9_406=float2(0.0);
float2 l9_407=float2(0.0);
ssGlobals l9_408=l9_403;
float2 l9_409;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_410=float2(0.0);
float2 l9_411=float2(0.0);
float2 l9_412=float2(0.0);
float2 l9_413=float2(0.0);
float2 l9_414=float2(0.0);
ssGlobals l9_415=l9_408;
float2 l9_416;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_417=float2(0.0);
l9_417=l9_415.Surface_UVCoord0;
l9_411=l9_417;
l9_416=l9_411;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_418=float2(0.0);
l9_418=l9_415.Surface_UVCoord1;
l9_412=l9_418;
l9_416=l9_412;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_419=float2(0.0);
l9_419=l9_415.gScreenCoord;
l9_413=l9_419;
l9_416=l9_413;
}
else
{
float2 l9_420=float2(0.0);
l9_420=l9_415.Surface_UVCoord0;
l9_414=l9_420;
l9_416=l9_414;
}
}
}
l9_410=l9_416;
float2 l9_421=float2(0.0);
float2 l9_422=(*sc_set0.UserUniforms).uv2Scale;
l9_421=l9_422;
float2 l9_423=float2(0.0);
l9_423=l9_421;
float2 l9_424=float2(0.0);
float2 l9_425=(*sc_set0.UserUniforms).uv2Offset;
l9_424=l9_425;
float2 l9_426=float2(0.0);
l9_426=l9_424;
float2 l9_427=float2(0.0);
l9_427=(l9_410*l9_423)+l9_426;
float2 l9_428=float2(0.0);
l9_428=l9_427+(l9_426*(l9_408.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_406=l9_428;
l9_409=l9_406;
}
else
{
float2 l9_429=float2(0.0);
float2 l9_430=float2(0.0);
float2 l9_431=float2(0.0);
float2 l9_432=float2(0.0);
float2 l9_433=float2(0.0);
ssGlobals l9_434=l9_408;
float2 l9_435;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_436=float2(0.0);
l9_436=l9_434.Surface_UVCoord0;
l9_430=l9_436;
l9_435=l9_430;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_437=float2(0.0);
l9_437=l9_434.Surface_UVCoord1;
l9_431=l9_437;
l9_435=l9_431;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_438=float2(0.0);
l9_438=l9_434.gScreenCoord;
l9_432=l9_438;
l9_435=l9_432;
}
else
{
float2 l9_439=float2(0.0);
l9_439=l9_434.Surface_UVCoord0;
l9_433=l9_439;
l9_435=l9_433;
}
}
}
l9_429=l9_435;
float2 l9_440=float2(0.0);
float2 l9_441=(*sc_set0.UserUniforms).uv2Scale;
l9_440=l9_441;
float2 l9_442=float2(0.0);
l9_442=l9_440;
float2 l9_443=float2(0.0);
float2 l9_444=(*sc_set0.UserUniforms).uv2Offset;
l9_443=l9_444;
float2 l9_445=float2(0.0);
l9_445=l9_443;
float2 l9_446=float2(0.0);
l9_446=(l9_429*l9_442)+l9_445;
l9_407=l9_446;
l9_409=l9_407;
}
l9_405=l9_409;
l9_401=l9_405;
l9_404=l9_401;
}
else
{
float2 l9_447=float2(0.0);
l9_447=l9_403.Surface_UVCoord0;
l9_402=l9_447;
l9_404=l9_402;
}
l9_400=l9_404;
float2 l9_448=float2(0.0);
l9_448=l9_400;
float2 l9_449=float2(0.0);
l9_449=l9_448;
l9_393=l9_449;
l9_396=l9_393;
}
else
{
float2 l9_450=float2(0.0);
l9_450=l9_395.Surface_UVCoord0;
l9_394=l9_450;
l9_396=l9_394;
}
}
}
}
l9_389=l9_396;
float2 l9_451=float2(0.0);
float2 l9_452=(*sc_set0.UserUniforms).uv3Scale;
l9_451=l9_452;
float2 l9_453=float2(0.0);
l9_453=l9_451;
float2 l9_454=float2(0.0);
float2 l9_455=(*sc_set0.UserUniforms).uv3Offset;
l9_454=l9_455;
float2 l9_456=float2(0.0);
l9_456=l9_454;
float2 l9_457=float2(0.0);
l9_457=(l9_389*l9_453)+l9_456;
float2 l9_458=float2(0.0);
l9_458=l9_457+(l9_456*(l9_387.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_385=l9_458;
l9_388=l9_385;
}
else
{
float2 l9_459=float2(0.0);
float2 l9_460=float2(0.0);
float2 l9_461=float2(0.0);
float2 l9_462=float2(0.0);
float2 l9_463=float2(0.0);
float2 l9_464=float2(0.0);
ssGlobals l9_465=l9_387;
float2 l9_466;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_467=float2(0.0);
l9_467=l9_465.Surface_UVCoord0;
l9_460=l9_467;
l9_466=l9_460;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_468=float2(0.0);
l9_468=l9_465.Surface_UVCoord1;
l9_461=l9_468;
l9_466=l9_461;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_469=float2(0.0);
l9_469=l9_465.gScreenCoord;
l9_462=l9_469;
l9_466=l9_462;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_470=float2(0.0);
float2 l9_471=float2(0.0);
float2 l9_472=float2(0.0);
ssGlobals l9_473=l9_465;
float2 l9_474;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_475=float2(0.0);
float2 l9_476=float2(0.0);
float2 l9_477=float2(0.0);
ssGlobals l9_478=l9_473;
float2 l9_479;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_480=float2(0.0);
float2 l9_481=float2(0.0);
float2 l9_482=float2(0.0);
float2 l9_483=float2(0.0);
float2 l9_484=float2(0.0);
ssGlobals l9_485=l9_478;
float2 l9_486;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_487=float2(0.0);
l9_487=l9_485.Surface_UVCoord0;
l9_481=l9_487;
l9_486=l9_481;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_488=float2(0.0);
l9_488=l9_485.Surface_UVCoord1;
l9_482=l9_488;
l9_486=l9_482;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_489=float2(0.0);
l9_489=l9_485.gScreenCoord;
l9_483=l9_489;
l9_486=l9_483;
}
else
{
float2 l9_490=float2(0.0);
l9_490=l9_485.Surface_UVCoord0;
l9_484=l9_490;
l9_486=l9_484;
}
}
}
l9_480=l9_486;
float2 l9_491=float2(0.0);
float2 l9_492=(*sc_set0.UserUniforms).uv2Scale;
l9_491=l9_492;
float2 l9_493=float2(0.0);
l9_493=l9_491;
float2 l9_494=float2(0.0);
float2 l9_495=(*sc_set0.UserUniforms).uv2Offset;
l9_494=l9_495;
float2 l9_496=float2(0.0);
l9_496=l9_494;
float2 l9_497=float2(0.0);
l9_497=(l9_480*l9_493)+l9_496;
float2 l9_498=float2(0.0);
l9_498=l9_497+(l9_496*(l9_478.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_476=l9_498;
l9_479=l9_476;
}
else
{
float2 l9_499=float2(0.0);
float2 l9_500=float2(0.0);
float2 l9_501=float2(0.0);
float2 l9_502=float2(0.0);
float2 l9_503=float2(0.0);
ssGlobals l9_504=l9_478;
float2 l9_505;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_506=float2(0.0);
l9_506=l9_504.Surface_UVCoord0;
l9_500=l9_506;
l9_505=l9_500;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_507=float2(0.0);
l9_507=l9_504.Surface_UVCoord1;
l9_501=l9_507;
l9_505=l9_501;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_508=float2(0.0);
l9_508=l9_504.gScreenCoord;
l9_502=l9_508;
l9_505=l9_502;
}
else
{
float2 l9_509=float2(0.0);
l9_509=l9_504.Surface_UVCoord0;
l9_503=l9_509;
l9_505=l9_503;
}
}
}
l9_499=l9_505;
float2 l9_510=float2(0.0);
float2 l9_511=(*sc_set0.UserUniforms).uv2Scale;
l9_510=l9_511;
float2 l9_512=float2(0.0);
l9_512=l9_510;
float2 l9_513=float2(0.0);
float2 l9_514=(*sc_set0.UserUniforms).uv2Offset;
l9_513=l9_514;
float2 l9_515=float2(0.0);
l9_515=l9_513;
float2 l9_516=float2(0.0);
l9_516=(l9_499*l9_512)+l9_515;
l9_477=l9_516;
l9_479=l9_477;
}
l9_475=l9_479;
l9_471=l9_475;
l9_474=l9_471;
}
else
{
float2 l9_517=float2(0.0);
l9_517=l9_473.Surface_UVCoord0;
l9_472=l9_517;
l9_474=l9_472;
}
l9_470=l9_474;
float2 l9_518=float2(0.0);
l9_518=l9_470;
float2 l9_519=float2(0.0);
l9_519=l9_518;
l9_463=l9_519;
l9_466=l9_463;
}
else
{
float2 l9_520=float2(0.0);
l9_520=l9_465.Surface_UVCoord0;
l9_464=l9_520;
l9_466=l9_464;
}
}
}
}
l9_459=l9_466;
float2 l9_521=float2(0.0);
float2 l9_522=(*sc_set0.UserUniforms).uv3Scale;
l9_521=l9_522;
float2 l9_523=float2(0.0);
l9_523=l9_521;
float2 l9_524=float2(0.0);
float2 l9_525=(*sc_set0.UserUniforms).uv3Offset;
l9_524=l9_525;
float2 l9_526=float2(0.0);
l9_526=l9_524;
float2 l9_527=float2(0.0);
l9_527=(l9_459*l9_523)+l9_526;
l9_386=l9_527;
l9_388=l9_386;
}
l9_384=l9_388;
l9_380=l9_384;
l9_383=l9_380;
}
else
{
float2 l9_528=float2(0.0);
l9_528=l9_382.Surface_UVCoord0;
l9_381=l9_528;
l9_383=l9_381;
}
l9_379=l9_383;
float2 l9_529=float2(0.0);
l9_529=l9_379;
float2 l9_530=float2(0.0);
l9_530=l9_529;
l9_323=l9_530;
l9_326=l9_323;
}
else
{
float2 l9_531=float2(0.0);
l9_531=l9_325.Surface_UVCoord0;
l9_324=l9_531;
l9_326=l9_324;
}
}
}
}
l9_319=l9_326;
float4 l9_532=float4(0.0);
int l9_533=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_534=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_534=0;
}
else
{
l9_534=in.varStereoViewID;
}
int l9_535=l9_534;
l9_533=1-l9_535;
}
else
{
int l9_536=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_536=0;
}
else
{
l9_536=in.varStereoViewID;
}
int l9_537=l9_536;
l9_533=l9_537;
}
int l9_538=l9_533;
int l9_539=opacityTexLayout_tmp;
int l9_540=l9_538;
float2 l9_541=l9_319;
bool l9_542=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_543=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_544=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_545=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_546=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_547=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_548=(*sc_set0.UserUniforms).opacityTexBorderColor;
float l9_549=0.0;
bool l9_550=l9_547&&(!l9_545);
float l9_551=1.0;
float l9_552=l9_541.x;
int l9_553=l9_544.x;
if (l9_553==1)
{
l9_552=fract(l9_552);
}
else
{
if (l9_553==2)
{
float l9_554=fract(l9_552);
float l9_555=l9_552-l9_554;
float l9_556=step(0.25,fract(l9_555*0.5));
l9_552=mix(l9_554,1.0-l9_554,fast::clamp(l9_556,0.0,1.0));
}
}
l9_541.x=l9_552;
float l9_557=l9_541.y;
int l9_558=l9_544.y;
if (l9_558==1)
{
l9_557=fract(l9_557);
}
else
{
if (l9_558==2)
{
float l9_559=fract(l9_557);
float l9_560=l9_557-l9_559;
float l9_561=step(0.25,fract(l9_560*0.5));
l9_557=mix(l9_559,1.0-l9_559,fast::clamp(l9_561,0.0,1.0));
}
}
l9_541.y=l9_557;
if (l9_545)
{
bool l9_562=l9_547;
bool l9_563;
if (l9_562)
{
l9_563=l9_544.x==3;
}
else
{
l9_563=l9_562;
}
float l9_564=l9_541.x;
float l9_565=l9_546.x;
float l9_566=l9_546.z;
bool l9_567=l9_563;
float l9_568=l9_551;
float l9_569=fast::clamp(l9_564,l9_565,l9_566);
float l9_570=step(abs(l9_564-l9_569),9.9999997e-06);
l9_568*=(l9_570+((1.0-float(l9_567))*(1.0-l9_570)));
l9_564=l9_569;
l9_541.x=l9_564;
l9_551=l9_568;
bool l9_571=l9_547;
bool l9_572;
if (l9_571)
{
l9_572=l9_544.y==3;
}
else
{
l9_572=l9_571;
}
float l9_573=l9_541.y;
float l9_574=l9_546.y;
float l9_575=l9_546.w;
bool l9_576=l9_572;
float l9_577=l9_551;
float l9_578=fast::clamp(l9_573,l9_574,l9_575);
float l9_579=step(abs(l9_573-l9_578),9.9999997e-06);
l9_577*=(l9_579+((1.0-float(l9_576))*(1.0-l9_579)));
l9_573=l9_578;
l9_541.y=l9_573;
l9_551=l9_577;
}
float2 l9_580=l9_541;
bool l9_581=l9_542;
float3x3 l9_582=l9_543;
if (l9_581)
{
l9_580=float2((l9_582*float3(l9_580,1.0)).xy);
}
float2 l9_583=l9_580;
float2 l9_584=l9_583;
float2 l9_585=l9_584;
l9_541=l9_585;
float l9_586=l9_541.x;
int l9_587=l9_544.x;
bool l9_588=l9_550;
float l9_589=l9_551;
if ((l9_587==0)||(l9_587==3))
{
float l9_590=l9_586;
float l9_591=0.0;
float l9_592=1.0;
bool l9_593=l9_588;
float l9_594=l9_589;
float l9_595=fast::clamp(l9_590,l9_591,l9_592);
float l9_596=step(abs(l9_590-l9_595),9.9999997e-06);
l9_594*=(l9_596+((1.0-float(l9_593))*(1.0-l9_596)));
l9_590=l9_595;
l9_586=l9_590;
l9_589=l9_594;
}
l9_541.x=l9_586;
l9_551=l9_589;
float l9_597=l9_541.y;
int l9_598=l9_544.y;
bool l9_599=l9_550;
float l9_600=l9_551;
if ((l9_598==0)||(l9_598==3))
{
float l9_601=l9_597;
float l9_602=0.0;
float l9_603=1.0;
bool l9_604=l9_599;
float l9_605=l9_600;
float l9_606=fast::clamp(l9_601,l9_602,l9_603);
float l9_607=step(abs(l9_601-l9_606),9.9999997e-06);
l9_605*=(l9_607+((1.0-float(l9_604))*(1.0-l9_607)));
l9_601=l9_606;
l9_597=l9_601;
l9_600=l9_605;
}
l9_541.y=l9_597;
l9_551=l9_600;
float2 l9_608=l9_541;
int l9_609=l9_539;
int l9_610=l9_540;
float l9_611=l9_549;
float2 l9_612=l9_608;
int l9_613=l9_609;
int l9_614=l9_610;
float3 l9_615=float3(0.0);
if (l9_613==0)
{
l9_615=float3(l9_612,0.0);
}
else
{
if (l9_613==1)
{
l9_615=float3(l9_612.x,(l9_612.y*0.5)+(0.5-(float(l9_614)*0.5)),0.0);
}
else
{
l9_615=float3(l9_612,float(l9_614));
}
}
float3 l9_616=l9_615;
float3 l9_617=l9_616;
float2 l9_618=l9_617.xy;
float l9_619=l9_611;
float4 l9_620=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_618,bias(l9_619));
float4 l9_621=l9_620;
float4 l9_622=l9_621;
if (l9_547)
{
l9_622=mix(l9_548,l9_622,float4(l9_551));
}
float4 l9_623=l9_622;
l9_532=l9_623;
float l9_624=0.0;
l9_624=l9_532.x;
param_5=l9_624;
param_7=param_5;
}
else
{
param_7=param_6;
}
Result_N204=param_7;
float Output_N72=0.0;
float param_9=1.0;
float param_10=(*sc_set0.UserUniforms).Port_Input2_N072;
ssGlobals param_12=Globals;
float param_11;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_625=float4(0.0);
l9_625=param_12.VertexColor;
float l9_626=0.0;
l9_626=l9_625.w;
param_9=l9_626;
param_11=param_9;
}
else
{
param_11=param_10;
}
Output_N72=param_11;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float3 Result_N337=float3(0.0);
float3 param_13=float3(0.0);
float3 param_14=float3(0.0);
ssGlobals param_16=Globals;
float3 param_15;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_627=float3(0.0);
l9_627=param_16.VertexTangent_WorldSpace;
float3 l9_628=float3(0.0);
l9_628=param_16.VertexBinormal_WorldSpace;
float3 l9_629=float3(0.0);
l9_629=param_16.VertexNormal_WorldSpace;
float3x3 l9_630=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_630=float3x3(float3(l9_627),float3(l9_628),float3(l9_629));
float2 l9_631=float2(0.0);
float2 l9_632=float2(0.0);
float2 l9_633=float2(0.0);
float2 l9_634=float2(0.0);
float2 l9_635=float2(0.0);
float2 l9_636=float2(0.0);
ssGlobals l9_637=param_16;
float2 l9_638;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_639=float2(0.0);
l9_639=l9_637.Surface_UVCoord0;
l9_632=l9_639;
l9_638=l9_632;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_640=float2(0.0);
l9_640=l9_637.Surface_UVCoord1;
l9_633=l9_640;
l9_638=l9_633;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_641=float2(0.0);
float2 l9_642=float2(0.0);
float2 l9_643=float2(0.0);
ssGlobals l9_644=l9_637;
float2 l9_645;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_646=float2(0.0);
float2 l9_647=float2(0.0);
float2 l9_648=float2(0.0);
ssGlobals l9_649=l9_644;
float2 l9_650;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_651=float2(0.0);
float2 l9_652=float2(0.0);
float2 l9_653=float2(0.0);
float2 l9_654=float2(0.0);
float2 l9_655=float2(0.0);
ssGlobals l9_656=l9_649;
float2 l9_657;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_658=float2(0.0);
l9_658=l9_656.Surface_UVCoord0;
l9_652=l9_658;
l9_657=l9_652;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_659=float2(0.0);
l9_659=l9_656.Surface_UVCoord1;
l9_653=l9_659;
l9_657=l9_653;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_660=float2(0.0);
l9_660=l9_656.gScreenCoord;
l9_654=l9_660;
l9_657=l9_654;
}
else
{
float2 l9_661=float2(0.0);
l9_661=l9_656.Surface_UVCoord0;
l9_655=l9_661;
l9_657=l9_655;
}
}
}
l9_651=l9_657;
float2 l9_662=float2(0.0);
float2 l9_663=(*sc_set0.UserUniforms).uv2Scale;
l9_662=l9_663;
float2 l9_664=float2(0.0);
l9_664=l9_662;
float2 l9_665=float2(0.0);
float2 l9_666=(*sc_set0.UserUniforms).uv2Offset;
l9_665=l9_666;
float2 l9_667=float2(0.0);
l9_667=l9_665;
float2 l9_668=float2(0.0);
l9_668=(l9_651*l9_664)+l9_667;
float2 l9_669=float2(0.0);
l9_669=l9_668+(l9_667*(l9_649.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_647=l9_669;
l9_650=l9_647;
}
else
{
float2 l9_670=float2(0.0);
float2 l9_671=float2(0.0);
float2 l9_672=float2(0.0);
float2 l9_673=float2(0.0);
float2 l9_674=float2(0.0);
ssGlobals l9_675=l9_649;
float2 l9_676;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_677=float2(0.0);
l9_677=l9_675.Surface_UVCoord0;
l9_671=l9_677;
l9_676=l9_671;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_678=float2(0.0);
l9_678=l9_675.Surface_UVCoord1;
l9_672=l9_678;
l9_676=l9_672;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_679=float2(0.0);
l9_679=l9_675.gScreenCoord;
l9_673=l9_679;
l9_676=l9_673;
}
else
{
float2 l9_680=float2(0.0);
l9_680=l9_675.Surface_UVCoord0;
l9_674=l9_680;
l9_676=l9_674;
}
}
}
l9_670=l9_676;
float2 l9_681=float2(0.0);
float2 l9_682=(*sc_set0.UserUniforms).uv2Scale;
l9_681=l9_682;
float2 l9_683=float2(0.0);
l9_683=l9_681;
float2 l9_684=float2(0.0);
float2 l9_685=(*sc_set0.UserUniforms).uv2Offset;
l9_684=l9_685;
float2 l9_686=float2(0.0);
l9_686=l9_684;
float2 l9_687=float2(0.0);
l9_687=(l9_670*l9_683)+l9_686;
l9_648=l9_687;
l9_650=l9_648;
}
l9_646=l9_650;
l9_642=l9_646;
l9_645=l9_642;
}
else
{
float2 l9_688=float2(0.0);
l9_688=l9_644.Surface_UVCoord0;
l9_643=l9_688;
l9_645=l9_643;
}
l9_641=l9_645;
float2 l9_689=float2(0.0);
l9_689=l9_641;
float2 l9_690=float2(0.0);
l9_690=l9_689;
l9_634=l9_690;
l9_638=l9_634;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_691=float2(0.0);
float2 l9_692=float2(0.0);
float2 l9_693=float2(0.0);
ssGlobals l9_694=l9_637;
float2 l9_695;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_696=float2(0.0);
float2 l9_697=float2(0.0);
float2 l9_698=float2(0.0);
ssGlobals l9_699=l9_694;
float2 l9_700;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_701=float2(0.0);
float2 l9_702=float2(0.0);
float2 l9_703=float2(0.0);
float2 l9_704=float2(0.0);
float2 l9_705=float2(0.0);
float2 l9_706=float2(0.0);
ssGlobals l9_707=l9_699;
float2 l9_708;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_709=float2(0.0);
l9_709=l9_707.Surface_UVCoord0;
l9_702=l9_709;
l9_708=l9_702;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_710=float2(0.0);
l9_710=l9_707.Surface_UVCoord1;
l9_703=l9_710;
l9_708=l9_703;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_711=float2(0.0);
l9_711=l9_707.gScreenCoord;
l9_704=l9_711;
l9_708=l9_704;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_712=float2(0.0);
float2 l9_713=float2(0.0);
float2 l9_714=float2(0.0);
ssGlobals l9_715=l9_707;
float2 l9_716;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_717=float2(0.0);
float2 l9_718=float2(0.0);
float2 l9_719=float2(0.0);
ssGlobals l9_720=l9_715;
float2 l9_721;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_722=float2(0.0);
float2 l9_723=float2(0.0);
float2 l9_724=float2(0.0);
float2 l9_725=float2(0.0);
float2 l9_726=float2(0.0);
ssGlobals l9_727=l9_720;
float2 l9_728;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_729=float2(0.0);
l9_729=l9_727.Surface_UVCoord0;
l9_723=l9_729;
l9_728=l9_723;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_730=float2(0.0);
l9_730=l9_727.Surface_UVCoord1;
l9_724=l9_730;
l9_728=l9_724;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_731=float2(0.0);
l9_731=l9_727.gScreenCoord;
l9_725=l9_731;
l9_728=l9_725;
}
else
{
float2 l9_732=float2(0.0);
l9_732=l9_727.Surface_UVCoord0;
l9_726=l9_732;
l9_728=l9_726;
}
}
}
l9_722=l9_728;
float2 l9_733=float2(0.0);
float2 l9_734=(*sc_set0.UserUniforms).uv2Scale;
l9_733=l9_734;
float2 l9_735=float2(0.0);
l9_735=l9_733;
float2 l9_736=float2(0.0);
float2 l9_737=(*sc_set0.UserUniforms).uv2Offset;
l9_736=l9_737;
float2 l9_738=float2(0.0);
l9_738=l9_736;
float2 l9_739=float2(0.0);
l9_739=(l9_722*l9_735)+l9_738;
float2 l9_740=float2(0.0);
l9_740=l9_739+(l9_738*(l9_720.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_718=l9_740;
l9_721=l9_718;
}
else
{
float2 l9_741=float2(0.0);
float2 l9_742=float2(0.0);
float2 l9_743=float2(0.0);
float2 l9_744=float2(0.0);
float2 l9_745=float2(0.0);
ssGlobals l9_746=l9_720;
float2 l9_747;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_748=float2(0.0);
l9_748=l9_746.Surface_UVCoord0;
l9_742=l9_748;
l9_747=l9_742;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_749=float2(0.0);
l9_749=l9_746.Surface_UVCoord1;
l9_743=l9_749;
l9_747=l9_743;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_750=float2(0.0);
l9_750=l9_746.gScreenCoord;
l9_744=l9_750;
l9_747=l9_744;
}
else
{
float2 l9_751=float2(0.0);
l9_751=l9_746.Surface_UVCoord0;
l9_745=l9_751;
l9_747=l9_745;
}
}
}
l9_741=l9_747;
float2 l9_752=float2(0.0);
float2 l9_753=(*sc_set0.UserUniforms).uv2Scale;
l9_752=l9_753;
float2 l9_754=float2(0.0);
l9_754=l9_752;
float2 l9_755=float2(0.0);
float2 l9_756=(*sc_set0.UserUniforms).uv2Offset;
l9_755=l9_756;
float2 l9_757=float2(0.0);
l9_757=l9_755;
float2 l9_758=float2(0.0);
l9_758=(l9_741*l9_754)+l9_757;
l9_719=l9_758;
l9_721=l9_719;
}
l9_717=l9_721;
l9_713=l9_717;
l9_716=l9_713;
}
else
{
float2 l9_759=float2(0.0);
l9_759=l9_715.Surface_UVCoord0;
l9_714=l9_759;
l9_716=l9_714;
}
l9_712=l9_716;
float2 l9_760=float2(0.0);
l9_760=l9_712;
float2 l9_761=float2(0.0);
l9_761=l9_760;
l9_705=l9_761;
l9_708=l9_705;
}
else
{
float2 l9_762=float2(0.0);
l9_762=l9_707.Surface_UVCoord0;
l9_706=l9_762;
l9_708=l9_706;
}
}
}
}
l9_701=l9_708;
float2 l9_763=float2(0.0);
float2 l9_764=(*sc_set0.UserUniforms).uv3Scale;
l9_763=l9_764;
float2 l9_765=float2(0.0);
l9_765=l9_763;
float2 l9_766=float2(0.0);
float2 l9_767=(*sc_set0.UserUniforms).uv3Offset;
l9_766=l9_767;
float2 l9_768=float2(0.0);
l9_768=l9_766;
float2 l9_769=float2(0.0);
l9_769=(l9_701*l9_765)+l9_768;
float2 l9_770=float2(0.0);
l9_770=l9_769+(l9_768*(l9_699.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_697=l9_770;
l9_700=l9_697;
}
else
{
float2 l9_771=float2(0.0);
float2 l9_772=float2(0.0);
float2 l9_773=float2(0.0);
float2 l9_774=float2(0.0);
float2 l9_775=float2(0.0);
float2 l9_776=float2(0.0);
ssGlobals l9_777=l9_699;
float2 l9_778;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_779=float2(0.0);
l9_779=l9_777.Surface_UVCoord0;
l9_772=l9_779;
l9_778=l9_772;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_780=float2(0.0);
l9_780=l9_777.Surface_UVCoord1;
l9_773=l9_780;
l9_778=l9_773;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_781=float2(0.0);
l9_781=l9_777.gScreenCoord;
l9_774=l9_781;
l9_778=l9_774;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_782=float2(0.0);
float2 l9_783=float2(0.0);
float2 l9_784=float2(0.0);
ssGlobals l9_785=l9_777;
float2 l9_786;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_787=float2(0.0);
float2 l9_788=float2(0.0);
float2 l9_789=float2(0.0);
ssGlobals l9_790=l9_785;
float2 l9_791;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_792=float2(0.0);
float2 l9_793=float2(0.0);
float2 l9_794=float2(0.0);
float2 l9_795=float2(0.0);
float2 l9_796=float2(0.0);
ssGlobals l9_797=l9_790;
float2 l9_798;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_799=float2(0.0);
l9_799=l9_797.Surface_UVCoord0;
l9_793=l9_799;
l9_798=l9_793;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_800=float2(0.0);
l9_800=l9_797.Surface_UVCoord1;
l9_794=l9_800;
l9_798=l9_794;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_801=float2(0.0);
l9_801=l9_797.gScreenCoord;
l9_795=l9_801;
l9_798=l9_795;
}
else
{
float2 l9_802=float2(0.0);
l9_802=l9_797.Surface_UVCoord0;
l9_796=l9_802;
l9_798=l9_796;
}
}
}
l9_792=l9_798;
float2 l9_803=float2(0.0);
float2 l9_804=(*sc_set0.UserUniforms).uv2Scale;
l9_803=l9_804;
float2 l9_805=float2(0.0);
l9_805=l9_803;
float2 l9_806=float2(0.0);
float2 l9_807=(*sc_set0.UserUniforms).uv2Offset;
l9_806=l9_807;
float2 l9_808=float2(0.0);
l9_808=l9_806;
float2 l9_809=float2(0.0);
l9_809=(l9_792*l9_805)+l9_808;
float2 l9_810=float2(0.0);
l9_810=l9_809+(l9_808*(l9_790.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_788=l9_810;
l9_791=l9_788;
}
else
{
float2 l9_811=float2(0.0);
float2 l9_812=float2(0.0);
float2 l9_813=float2(0.0);
float2 l9_814=float2(0.0);
float2 l9_815=float2(0.0);
ssGlobals l9_816=l9_790;
float2 l9_817;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_818=float2(0.0);
l9_818=l9_816.Surface_UVCoord0;
l9_812=l9_818;
l9_817=l9_812;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_819=float2(0.0);
l9_819=l9_816.Surface_UVCoord1;
l9_813=l9_819;
l9_817=l9_813;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_820=float2(0.0);
l9_820=l9_816.gScreenCoord;
l9_814=l9_820;
l9_817=l9_814;
}
else
{
float2 l9_821=float2(0.0);
l9_821=l9_816.Surface_UVCoord0;
l9_815=l9_821;
l9_817=l9_815;
}
}
}
l9_811=l9_817;
float2 l9_822=float2(0.0);
float2 l9_823=(*sc_set0.UserUniforms).uv2Scale;
l9_822=l9_823;
float2 l9_824=float2(0.0);
l9_824=l9_822;
float2 l9_825=float2(0.0);
float2 l9_826=(*sc_set0.UserUniforms).uv2Offset;
l9_825=l9_826;
float2 l9_827=float2(0.0);
l9_827=l9_825;
float2 l9_828=float2(0.0);
l9_828=(l9_811*l9_824)+l9_827;
l9_789=l9_828;
l9_791=l9_789;
}
l9_787=l9_791;
l9_783=l9_787;
l9_786=l9_783;
}
else
{
float2 l9_829=float2(0.0);
l9_829=l9_785.Surface_UVCoord0;
l9_784=l9_829;
l9_786=l9_784;
}
l9_782=l9_786;
float2 l9_830=float2(0.0);
l9_830=l9_782;
float2 l9_831=float2(0.0);
l9_831=l9_830;
l9_775=l9_831;
l9_778=l9_775;
}
else
{
float2 l9_832=float2(0.0);
l9_832=l9_777.Surface_UVCoord0;
l9_776=l9_832;
l9_778=l9_776;
}
}
}
}
l9_771=l9_778;
float2 l9_833=float2(0.0);
float2 l9_834=(*sc_set0.UserUniforms).uv3Scale;
l9_833=l9_834;
float2 l9_835=float2(0.0);
l9_835=l9_833;
float2 l9_836=float2(0.0);
float2 l9_837=(*sc_set0.UserUniforms).uv3Offset;
l9_836=l9_837;
float2 l9_838=float2(0.0);
l9_838=l9_836;
float2 l9_839=float2(0.0);
l9_839=(l9_771*l9_835)+l9_838;
l9_698=l9_839;
l9_700=l9_698;
}
l9_696=l9_700;
l9_692=l9_696;
l9_695=l9_692;
}
else
{
float2 l9_840=float2(0.0);
l9_840=l9_694.Surface_UVCoord0;
l9_693=l9_840;
l9_695=l9_693;
}
l9_691=l9_695;
float2 l9_841=float2(0.0);
l9_841=l9_691;
float2 l9_842=float2(0.0);
l9_842=l9_841;
l9_635=l9_842;
l9_638=l9_635;
}
else
{
float2 l9_843=float2(0.0);
l9_843=l9_637.Surface_UVCoord0;
l9_636=l9_843;
l9_638=l9_636;
}
}
}
}
l9_631=l9_638;
float4 l9_844=float4(0.0);
float2 l9_845=l9_631;
int l9_846=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_847=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_847=0;
}
else
{
l9_847=in.varStereoViewID;
}
int l9_848=l9_847;
l9_846=1-l9_848;
}
else
{
int l9_849=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_849=0;
}
else
{
l9_849=in.varStereoViewID;
}
int l9_850=l9_849;
l9_846=l9_850;
}
int l9_851=l9_846;
int l9_852=normalTexLayout_tmp;
int l9_853=l9_851;
float2 l9_854=l9_845;
bool l9_855=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_856=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_857=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_858=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_859=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_860=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_861=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_862=0.0;
bool l9_863=l9_860&&(!l9_858);
float l9_864=1.0;
float l9_865=l9_854.x;
int l9_866=l9_857.x;
if (l9_866==1)
{
l9_865=fract(l9_865);
}
else
{
if (l9_866==2)
{
float l9_867=fract(l9_865);
float l9_868=l9_865-l9_867;
float l9_869=step(0.25,fract(l9_868*0.5));
l9_865=mix(l9_867,1.0-l9_867,fast::clamp(l9_869,0.0,1.0));
}
}
l9_854.x=l9_865;
float l9_870=l9_854.y;
int l9_871=l9_857.y;
if (l9_871==1)
{
l9_870=fract(l9_870);
}
else
{
if (l9_871==2)
{
float l9_872=fract(l9_870);
float l9_873=l9_870-l9_872;
float l9_874=step(0.25,fract(l9_873*0.5));
l9_870=mix(l9_872,1.0-l9_872,fast::clamp(l9_874,0.0,1.0));
}
}
l9_854.y=l9_870;
if (l9_858)
{
bool l9_875=l9_860;
bool l9_876;
if (l9_875)
{
l9_876=l9_857.x==3;
}
else
{
l9_876=l9_875;
}
float l9_877=l9_854.x;
float l9_878=l9_859.x;
float l9_879=l9_859.z;
bool l9_880=l9_876;
float l9_881=l9_864;
float l9_882=fast::clamp(l9_877,l9_878,l9_879);
float l9_883=step(abs(l9_877-l9_882),9.9999997e-06);
l9_881*=(l9_883+((1.0-float(l9_880))*(1.0-l9_883)));
l9_877=l9_882;
l9_854.x=l9_877;
l9_864=l9_881;
bool l9_884=l9_860;
bool l9_885;
if (l9_884)
{
l9_885=l9_857.y==3;
}
else
{
l9_885=l9_884;
}
float l9_886=l9_854.y;
float l9_887=l9_859.y;
float l9_888=l9_859.w;
bool l9_889=l9_885;
float l9_890=l9_864;
float l9_891=fast::clamp(l9_886,l9_887,l9_888);
float l9_892=step(abs(l9_886-l9_891),9.9999997e-06);
l9_890*=(l9_892+((1.0-float(l9_889))*(1.0-l9_892)));
l9_886=l9_891;
l9_854.y=l9_886;
l9_864=l9_890;
}
float2 l9_893=l9_854;
bool l9_894=l9_855;
float3x3 l9_895=l9_856;
if (l9_894)
{
l9_893=float2((l9_895*float3(l9_893,1.0)).xy);
}
float2 l9_896=l9_893;
float2 l9_897=l9_896;
float2 l9_898=l9_897;
l9_854=l9_898;
float l9_899=l9_854.x;
int l9_900=l9_857.x;
bool l9_901=l9_863;
float l9_902=l9_864;
if ((l9_900==0)||(l9_900==3))
{
float l9_903=l9_899;
float l9_904=0.0;
float l9_905=1.0;
bool l9_906=l9_901;
float l9_907=l9_902;
float l9_908=fast::clamp(l9_903,l9_904,l9_905);
float l9_909=step(abs(l9_903-l9_908),9.9999997e-06);
l9_907*=(l9_909+((1.0-float(l9_906))*(1.0-l9_909)));
l9_903=l9_908;
l9_899=l9_903;
l9_902=l9_907;
}
l9_854.x=l9_899;
l9_864=l9_902;
float l9_910=l9_854.y;
int l9_911=l9_857.y;
bool l9_912=l9_863;
float l9_913=l9_864;
if ((l9_911==0)||(l9_911==3))
{
float l9_914=l9_910;
float l9_915=0.0;
float l9_916=1.0;
bool l9_917=l9_912;
float l9_918=l9_913;
float l9_919=fast::clamp(l9_914,l9_915,l9_916);
float l9_920=step(abs(l9_914-l9_919),9.9999997e-06);
l9_918*=(l9_920+((1.0-float(l9_917))*(1.0-l9_920)));
l9_914=l9_919;
l9_910=l9_914;
l9_913=l9_918;
}
l9_854.y=l9_910;
l9_864=l9_913;
float2 l9_921=l9_854;
int l9_922=l9_852;
int l9_923=l9_853;
float l9_924=l9_862;
float2 l9_925=l9_921;
int l9_926=l9_922;
int l9_927=l9_923;
float3 l9_928=float3(0.0);
if (l9_926==0)
{
l9_928=float3(l9_925,0.0);
}
else
{
if (l9_926==1)
{
l9_928=float3(l9_925.x,(l9_925.y*0.5)+(0.5-(float(l9_927)*0.5)),0.0);
}
else
{
l9_928=float3(l9_925,float(l9_927));
}
}
float3 l9_929=l9_928;
float3 l9_930=l9_929;
float2 l9_931=l9_930.xy;
float l9_932=l9_924;
float4 l9_933=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_931,bias(l9_932));
float4 l9_934=l9_933;
float4 l9_935=l9_934;
if (l9_860)
{
l9_935=mix(l9_861,l9_935,float4(l9_864));
}
float4 l9_936=l9_935;
float4 l9_937=l9_936;
float3 l9_938=(l9_937.xyz*1.9921875)-float3(1.0);
l9_937=float4(l9_938.x,l9_938.y,l9_938.z,l9_937.w);
l9_844=l9_937;
float3 l9_939=float3(0.0);
float3 l9_940=float3(0.0);
float3 l9_941=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_942=param_16;
float3 l9_943;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_944=float2(0.0);
float2 l9_945=float2(0.0);
float2 l9_946=float2(0.0);
float2 l9_947=float2(0.0);
float2 l9_948=float2(0.0);
float2 l9_949=float2(0.0);
ssGlobals l9_950=l9_942;
float2 l9_951;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_952=float2(0.0);
l9_952=l9_950.Surface_UVCoord0;
l9_945=l9_952;
l9_951=l9_945;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_953=float2(0.0);
l9_953=l9_950.Surface_UVCoord1;
l9_946=l9_953;
l9_951=l9_946;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_954=float2(0.0);
float2 l9_955=float2(0.0);
float2 l9_956=float2(0.0);
ssGlobals l9_957=l9_950;
float2 l9_958;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_959=float2(0.0);
float2 l9_960=float2(0.0);
float2 l9_961=float2(0.0);
ssGlobals l9_962=l9_957;
float2 l9_963;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_964=float2(0.0);
float2 l9_965=float2(0.0);
float2 l9_966=float2(0.0);
float2 l9_967=float2(0.0);
float2 l9_968=float2(0.0);
ssGlobals l9_969=l9_962;
float2 l9_970;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_971=float2(0.0);
l9_971=l9_969.Surface_UVCoord0;
l9_965=l9_971;
l9_970=l9_965;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_972=float2(0.0);
l9_972=l9_969.Surface_UVCoord1;
l9_966=l9_972;
l9_970=l9_966;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_973=float2(0.0);
l9_973=l9_969.gScreenCoord;
l9_967=l9_973;
l9_970=l9_967;
}
else
{
float2 l9_974=float2(0.0);
l9_974=l9_969.Surface_UVCoord0;
l9_968=l9_974;
l9_970=l9_968;
}
}
}
l9_964=l9_970;
float2 l9_975=float2(0.0);
float2 l9_976=(*sc_set0.UserUniforms).uv2Scale;
l9_975=l9_976;
float2 l9_977=float2(0.0);
l9_977=l9_975;
float2 l9_978=float2(0.0);
float2 l9_979=(*sc_set0.UserUniforms).uv2Offset;
l9_978=l9_979;
float2 l9_980=float2(0.0);
l9_980=l9_978;
float2 l9_981=float2(0.0);
l9_981=(l9_964*l9_977)+l9_980;
float2 l9_982=float2(0.0);
l9_982=l9_981+(l9_980*(l9_962.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_960=l9_982;
l9_963=l9_960;
}
else
{
float2 l9_983=float2(0.0);
float2 l9_984=float2(0.0);
float2 l9_985=float2(0.0);
float2 l9_986=float2(0.0);
float2 l9_987=float2(0.0);
ssGlobals l9_988=l9_962;
float2 l9_989;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_990=float2(0.0);
l9_990=l9_988.Surface_UVCoord0;
l9_984=l9_990;
l9_989=l9_984;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_991=float2(0.0);
l9_991=l9_988.Surface_UVCoord1;
l9_985=l9_991;
l9_989=l9_985;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_992=float2(0.0);
l9_992=l9_988.gScreenCoord;
l9_986=l9_992;
l9_989=l9_986;
}
else
{
float2 l9_993=float2(0.0);
l9_993=l9_988.Surface_UVCoord0;
l9_987=l9_993;
l9_989=l9_987;
}
}
}
l9_983=l9_989;
float2 l9_994=float2(0.0);
float2 l9_995=(*sc_set0.UserUniforms).uv2Scale;
l9_994=l9_995;
float2 l9_996=float2(0.0);
l9_996=l9_994;
float2 l9_997=float2(0.0);
float2 l9_998=(*sc_set0.UserUniforms).uv2Offset;
l9_997=l9_998;
float2 l9_999=float2(0.0);
l9_999=l9_997;
float2 l9_1000=float2(0.0);
l9_1000=(l9_983*l9_996)+l9_999;
l9_961=l9_1000;
l9_963=l9_961;
}
l9_959=l9_963;
l9_955=l9_959;
l9_958=l9_955;
}
else
{
float2 l9_1001=float2(0.0);
l9_1001=l9_957.Surface_UVCoord0;
l9_956=l9_1001;
l9_958=l9_956;
}
l9_954=l9_958;
float2 l9_1002=float2(0.0);
l9_1002=l9_954;
float2 l9_1003=float2(0.0);
l9_1003=l9_1002;
l9_947=l9_1003;
l9_951=l9_947;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_1004=float2(0.0);
float2 l9_1005=float2(0.0);
float2 l9_1006=float2(0.0);
ssGlobals l9_1007=l9_950;
float2 l9_1008;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_1009=float2(0.0);
float2 l9_1010=float2(0.0);
float2 l9_1011=float2(0.0);
ssGlobals l9_1012=l9_1007;
float2 l9_1013;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1014=float2(0.0);
float2 l9_1015=float2(0.0);
float2 l9_1016=float2(0.0);
float2 l9_1017=float2(0.0);
float2 l9_1018=float2(0.0);
float2 l9_1019=float2(0.0);
ssGlobals l9_1020=l9_1012;
float2 l9_1021;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1022=float2(0.0);
l9_1022=l9_1020.Surface_UVCoord0;
l9_1015=l9_1022;
l9_1021=l9_1015;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1023=float2(0.0);
l9_1023=l9_1020.Surface_UVCoord1;
l9_1016=l9_1023;
l9_1021=l9_1016;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1024=float2(0.0);
l9_1024=l9_1020.gScreenCoord;
l9_1017=l9_1024;
l9_1021=l9_1017;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1025=float2(0.0);
float2 l9_1026=float2(0.0);
float2 l9_1027=float2(0.0);
ssGlobals l9_1028=l9_1020;
float2 l9_1029;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1030=float2(0.0);
float2 l9_1031=float2(0.0);
float2 l9_1032=float2(0.0);
ssGlobals l9_1033=l9_1028;
float2 l9_1034;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1035=float2(0.0);
float2 l9_1036=float2(0.0);
float2 l9_1037=float2(0.0);
float2 l9_1038=float2(0.0);
float2 l9_1039=float2(0.0);
ssGlobals l9_1040=l9_1033;
float2 l9_1041;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1042=float2(0.0);
l9_1042=l9_1040.Surface_UVCoord0;
l9_1036=l9_1042;
l9_1041=l9_1036;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1043=float2(0.0);
l9_1043=l9_1040.Surface_UVCoord1;
l9_1037=l9_1043;
l9_1041=l9_1037;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1044=float2(0.0);
l9_1044=l9_1040.gScreenCoord;
l9_1038=l9_1044;
l9_1041=l9_1038;
}
else
{
float2 l9_1045=float2(0.0);
l9_1045=l9_1040.Surface_UVCoord0;
l9_1039=l9_1045;
l9_1041=l9_1039;
}
}
}
l9_1035=l9_1041;
float2 l9_1046=float2(0.0);
float2 l9_1047=(*sc_set0.UserUniforms).uv2Scale;
l9_1046=l9_1047;
float2 l9_1048=float2(0.0);
l9_1048=l9_1046;
float2 l9_1049=float2(0.0);
float2 l9_1050=(*sc_set0.UserUniforms).uv2Offset;
l9_1049=l9_1050;
float2 l9_1051=float2(0.0);
l9_1051=l9_1049;
float2 l9_1052=float2(0.0);
l9_1052=(l9_1035*l9_1048)+l9_1051;
float2 l9_1053=float2(0.0);
l9_1053=l9_1052+(l9_1051*(l9_1033.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1031=l9_1053;
l9_1034=l9_1031;
}
else
{
float2 l9_1054=float2(0.0);
float2 l9_1055=float2(0.0);
float2 l9_1056=float2(0.0);
float2 l9_1057=float2(0.0);
float2 l9_1058=float2(0.0);
ssGlobals l9_1059=l9_1033;
float2 l9_1060;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1061=float2(0.0);
l9_1061=l9_1059.Surface_UVCoord0;
l9_1055=l9_1061;
l9_1060=l9_1055;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1062=float2(0.0);
l9_1062=l9_1059.Surface_UVCoord1;
l9_1056=l9_1062;
l9_1060=l9_1056;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1063=float2(0.0);
l9_1063=l9_1059.gScreenCoord;
l9_1057=l9_1063;
l9_1060=l9_1057;
}
else
{
float2 l9_1064=float2(0.0);
l9_1064=l9_1059.Surface_UVCoord0;
l9_1058=l9_1064;
l9_1060=l9_1058;
}
}
}
l9_1054=l9_1060;
float2 l9_1065=float2(0.0);
float2 l9_1066=(*sc_set0.UserUniforms).uv2Scale;
l9_1065=l9_1066;
float2 l9_1067=float2(0.0);
l9_1067=l9_1065;
float2 l9_1068=float2(0.0);
float2 l9_1069=(*sc_set0.UserUniforms).uv2Offset;
l9_1068=l9_1069;
float2 l9_1070=float2(0.0);
l9_1070=l9_1068;
float2 l9_1071=float2(0.0);
l9_1071=(l9_1054*l9_1067)+l9_1070;
l9_1032=l9_1071;
l9_1034=l9_1032;
}
l9_1030=l9_1034;
l9_1026=l9_1030;
l9_1029=l9_1026;
}
else
{
float2 l9_1072=float2(0.0);
l9_1072=l9_1028.Surface_UVCoord0;
l9_1027=l9_1072;
l9_1029=l9_1027;
}
l9_1025=l9_1029;
float2 l9_1073=float2(0.0);
l9_1073=l9_1025;
float2 l9_1074=float2(0.0);
l9_1074=l9_1073;
l9_1018=l9_1074;
l9_1021=l9_1018;
}
else
{
float2 l9_1075=float2(0.0);
l9_1075=l9_1020.Surface_UVCoord0;
l9_1019=l9_1075;
l9_1021=l9_1019;
}
}
}
}
l9_1014=l9_1021;
float2 l9_1076=float2(0.0);
float2 l9_1077=(*sc_set0.UserUniforms).uv3Scale;
l9_1076=l9_1077;
float2 l9_1078=float2(0.0);
l9_1078=l9_1076;
float2 l9_1079=float2(0.0);
float2 l9_1080=(*sc_set0.UserUniforms).uv3Offset;
l9_1079=l9_1080;
float2 l9_1081=float2(0.0);
l9_1081=l9_1079;
float2 l9_1082=float2(0.0);
l9_1082=(l9_1014*l9_1078)+l9_1081;
float2 l9_1083=float2(0.0);
l9_1083=l9_1082+(l9_1081*(l9_1012.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1010=l9_1083;
l9_1013=l9_1010;
}
else
{
float2 l9_1084=float2(0.0);
float2 l9_1085=float2(0.0);
float2 l9_1086=float2(0.0);
float2 l9_1087=float2(0.0);
float2 l9_1088=float2(0.0);
float2 l9_1089=float2(0.0);
ssGlobals l9_1090=l9_1012;
float2 l9_1091;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1092=float2(0.0);
l9_1092=l9_1090.Surface_UVCoord0;
l9_1085=l9_1092;
l9_1091=l9_1085;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1093=float2(0.0);
l9_1093=l9_1090.Surface_UVCoord1;
l9_1086=l9_1093;
l9_1091=l9_1086;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1094=float2(0.0);
l9_1094=l9_1090.gScreenCoord;
l9_1087=l9_1094;
l9_1091=l9_1087;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1095=float2(0.0);
float2 l9_1096=float2(0.0);
float2 l9_1097=float2(0.0);
ssGlobals l9_1098=l9_1090;
float2 l9_1099;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1100=float2(0.0);
float2 l9_1101=float2(0.0);
float2 l9_1102=float2(0.0);
ssGlobals l9_1103=l9_1098;
float2 l9_1104;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1105=float2(0.0);
float2 l9_1106=float2(0.0);
float2 l9_1107=float2(0.0);
float2 l9_1108=float2(0.0);
float2 l9_1109=float2(0.0);
ssGlobals l9_1110=l9_1103;
float2 l9_1111;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1112=float2(0.0);
l9_1112=l9_1110.Surface_UVCoord0;
l9_1106=l9_1112;
l9_1111=l9_1106;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1113=float2(0.0);
l9_1113=l9_1110.Surface_UVCoord1;
l9_1107=l9_1113;
l9_1111=l9_1107;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1114=float2(0.0);
l9_1114=l9_1110.gScreenCoord;
l9_1108=l9_1114;
l9_1111=l9_1108;
}
else
{
float2 l9_1115=float2(0.0);
l9_1115=l9_1110.Surface_UVCoord0;
l9_1109=l9_1115;
l9_1111=l9_1109;
}
}
}
l9_1105=l9_1111;
float2 l9_1116=float2(0.0);
float2 l9_1117=(*sc_set0.UserUniforms).uv2Scale;
l9_1116=l9_1117;
float2 l9_1118=float2(0.0);
l9_1118=l9_1116;
float2 l9_1119=float2(0.0);
float2 l9_1120=(*sc_set0.UserUniforms).uv2Offset;
l9_1119=l9_1120;
float2 l9_1121=float2(0.0);
l9_1121=l9_1119;
float2 l9_1122=float2(0.0);
l9_1122=(l9_1105*l9_1118)+l9_1121;
float2 l9_1123=float2(0.0);
l9_1123=l9_1122+(l9_1121*(l9_1103.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1101=l9_1123;
l9_1104=l9_1101;
}
else
{
float2 l9_1124=float2(0.0);
float2 l9_1125=float2(0.0);
float2 l9_1126=float2(0.0);
float2 l9_1127=float2(0.0);
float2 l9_1128=float2(0.0);
ssGlobals l9_1129=l9_1103;
float2 l9_1130;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1131=float2(0.0);
l9_1131=l9_1129.Surface_UVCoord0;
l9_1125=l9_1131;
l9_1130=l9_1125;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1132=float2(0.0);
l9_1132=l9_1129.Surface_UVCoord1;
l9_1126=l9_1132;
l9_1130=l9_1126;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1133=float2(0.0);
l9_1133=l9_1129.gScreenCoord;
l9_1127=l9_1133;
l9_1130=l9_1127;
}
else
{
float2 l9_1134=float2(0.0);
l9_1134=l9_1129.Surface_UVCoord0;
l9_1128=l9_1134;
l9_1130=l9_1128;
}
}
}
l9_1124=l9_1130;
float2 l9_1135=float2(0.0);
float2 l9_1136=(*sc_set0.UserUniforms).uv2Scale;
l9_1135=l9_1136;
float2 l9_1137=float2(0.0);
l9_1137=l9_1135;
float2 l9_1138=float2(0.0);
float2 l9_1139=(*sc_set0.UserUniforms).uv2Offset;
l9_1138=l9_1139;
float2 l9_1140=float2(0.0);
l9_1140=l9_1138;
float2 l9_1141=float2(0.0);
l9_1141=(l9_1124*l9_1137)+l9_1140;
l9_1102=l9_1141;
l9_1104=l9_1102;
}
l9_1100=l9_1104;
l9_1096=l9_1100;
l9_1099=l9_1096;
}
else
{
float2 l9_1142=float2(0.0);
l9_1142=l9_1098.Surface_UVCoord0;
l9_1097=l9_1142;
l9_1099=l9_1097;
}
l9_1095=l9_1099;
float2 l9_1143=float2(0.0);
l9_1143=l9_1095;
float2 l9_1144=float2(0.0);
l9_1144=l9_1143;
l9_1088=l9_1144;
l9_1091=l9_1088;
}
else
{
float2 l9_1145=float2(0.0);
l9_1145=l9_1090.Surface_UVCoord0;
l9_1089=l9_1145;
l9_1091=l9_1089;
}
}
}
}
l9_1084=l9_1091;
float2 l9_1146=float2(0.0);
float2 l9_1147=(*sc_set0.UserUniforms).uv3Scale;
l9_1146=l9_1147;
float2 l9_1148=float2(0.0);
l9_1148=l9_1146;
float2 l9_1149=float2(0.0);
float2 l9_1150=(*sc_set0.UserUniforms).uv3Offset;
l9_1149=l9_1150;
float2 l9_1151=float2(0.0);
l9_1151=l9_1149;
float2 l9_1152=float2(0.0);
l9_1152=(l9_1084*l9_1148)+l9_1151;
l9_1011=l9_1152;
l9_1013=l9_1011;
}
l9_1009=l9_1013;
l9_1005=l9_1009;
l9_1008=l9_1005;
}
else
{
float2 l9_1153=float2(0.0);
l9_1153=l9_1007.Surface_UVCoord0;
l9_1006=l9_1153;
l9_1008=l9_1006;
}
l9_1004=l9_1008;
float2 l9_1154=float2(0.0);
l9_1154=l9_1004;
float2 l9_1155=float2(0.0);
l9_1155=l9_1154;
l9_948=l9_1155;
l9_951=l9_948;
}
else
{
float2 l9_1156=float2(0.0);
l9_1156=l9_950.Surface_UVCoord0;
l9_949=l9_1156;
l9_951=l9_949;
}
}
}
}
l9_944=l9_951;
float4 l9_1157=float4(0.0);
float2 l9_1158=l9_944;
int l9_1159=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_1160=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1160=0;
}
else
{
l9_1160=in.varStereoViewID;
}
int l9_1161=l9_1160;
l9_1159=1-l9_1161;
}
else
{
int l9_1162=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1162=0;
}
else
{
l9_1162=in.varStereoViewID;
}
int l9_1163=l9_1162;
l9_1159=l9_1163;
}
int l9_1164=l9_1159;
int l9_1165=detailNormalTexLayout_tmp;
int l9_1166=l9_1164;
float2 l9_1167=l9_1158;
bool l9_1168=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_1169=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_1170=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_1171=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_1172=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_1173=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_1174=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_1175=0.0;
bool l9_1176=l9_1173&&(!l9_1171);
float l9_1177=1.0;
float l9_1178=l9_1167.x;
int l9_1179=l9_1170.x;
if (l9_1179==1)
{
l9_1178=fract(l9_1178);
}
else
{
if (l9_1179==2)
{
float l9_1180=fract(l9_1178);
float l9_1181=l9_1178-l9_1180;
float l9_1182=step(0.25,fract(l9_1181*0.5));
l9_1178=mix(l9_1180,1.0-l9_1180,fast::clamp(l9_1182,0.0,1.0));
}
}
l9_1167.x=l9_1178;
float l9_1183=l9_1167.y;
int l9_1184=l9_1170.y;
if (l9_1184==1)
{
l9_1183=fract(l9_1183);
}
else
{
if (l9_1184==2)
{
float l9_1185=fract(l9_1183);
float l9_1186=l9_1183-l9_1185;
float l9_1187=step(0.25,fract(l9_1186*0.5));
l9_1183=mix(l9_1185,1.0-l9_1185,fast::clamp(l9_1187,0.0,1.0));
}
}
l9_1167.y=l9_1183;
if (l9_1171)
{
bool l9_1188=l9_1173;
bool l9_1189;
if (l9_1188)
{
l9_1189=l9_1170.x==3;
}
else
{
l9_1189=l9_1188;
}
float l9_1190=l9_1167.x;
float l9_1191=l9_1172.x;
float l9_1192=l9_1172.z;
bool l9_1193=l9_1189;
float l9_1194=l9_1177;
float l9_1195=fast::clamp(l9_1190,l9_1191,l9_1192);
float l9_1196=step(abs(l9_1190-l9_1195),9.9999997e-06);
l9_1194*=(l9_1196+((1.0-float(l9_1193))*(1.0-l9_1196)));
l9_1190=l9_1195;
l9_1167.x=l9_1190;
l9_1177=l9_1194;
bool l9_1197=l9_1173;
bool l9_1198;
if (l9_1197)
{
l9_1198=l9_1170.y==3;
}
else
{
l9_1198=l9_1197;
}
float l9_1199=l9_1167.y;
float l9_1200=l9_1172.y;
float l9_1201=l9_1172.w;
bool l9_1202=l9_1198;
float l9_1203=l9_1177;
float l9_1204=fast::clamp(l9_1199,l9_1200,l9_1201);
float l9_1205=step(abs(l9_1199-l9_1204),9.9999997e-06);
l9_1203*=(l9_1205+((1.0-float(l9_1202))*(1.0-l9_1205)));
l9_1199=l9_1204;
l9_1167.y=l9_1199;
l9_1177=l9_1203;
}
float2 l9_1206=l9_1167;
bool l9_1207=l9_1168;
float3x3 l9_1208=l9_1169;
if (l9_1207)
{
l9_1206=float2((l9_1208*float3(l9_1206,1.0)).xy);
}
float2 l9_1209=l9_1206;
float2 l9_1210=l9_1209;
float2 l9_1211=l9_1210;
l9_1167=l9_1211;
float l9_1212=l9_1167.x;
int l9_1213=l9_1170.x;
bool l9_1214=l9_1176;
float l9_1215=l9_1177;
if ((l9_1213==0)||(l9_1213==3))
{
float l9_1216=l9_1212;
float l9_1217=0.0;
float l9_1218=1.0;
bool l9_1219=l9_1214;
float l9_1220=l9_1215;
float l9_1221=fast::clamp(l9_1216,l9_1217,l9_1218);
float l9_1222=step(abs(l9_1216-l9_1221),9.9999997e-06);
l9_1220*=(l9_1222+((1.0-float(l9_1219))*(1.0-l9_1222)));
l9_1216=l9_1221;
l9_1212=l9_1216;
l9_1215=l9_1220;
}
l9_1167.x=l9_1212;
l9_1177=l9_1215;
float l9_1223=l9_1167.y;
int l9_1224=l9_1170.y;
bool l9_1225=l9_1176;
float l9_1226=l9_1177;
if ((l9_1224==0)||(l9_1224==3))
{
float l9_1227=l9_1223;
float l9_1228=0.0;
float l9_1229=1.0;
bool l9_1230=l9_1225;
float l9_1231=l9_1226;
float l9_1232=fast::clamp(l9_1227,l9_1228,l9_1229);
float l9_1233=step(abs(l9_1227-l9_1232),9.9999997e-06);
l9_1231*=(l9_1233+((1.0-float(l9_1230))*(1.0-l9_1233)));
l9_1227=l9_1232;
l9_1223=l9_1227;
l9_1226=l9_1231;
}
l9_1167.y=l9_1223;
l9_1177=l9_1226;
float2 l9_1234=l9_1167;
int l9_1235=l9_1165;
int l9_1236=l9_1166;
float l9_1237=l9_1175;
float2 l9_1238=l9_1234;
int l9_1239=l9_1235;
int l9_1240=l9_1236;
float3 l9_1241=float3(0.0);
if (l9_1239==0)
{
l9_1241=float3(l9_1238,0.0);
}
else
{
if (l9_1239==1)
{
l9_1241=float3(l9_1238.x,(l9_1238.y*0.5)+(0.5-(float(l9_1240)*0.5)),0.0);
}
else
{
l9_1241=float3(l9_1238,float(l9_1240));
}
}
float3 l9_1242=l9_1241;
float3 l9_1243=l9_1242;
float2 l9_1244=l9_1243.xy;
float l9_1245=l9_1237;
float4 l9_1246=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_1244,bias(l9_1245));
float4 l9_1247=l9_1246;
float4 l9_1248=l9_1247;
if (l9_1173)
{
l9_1248=mix(l9_1174,l9_1248,float4(l9_1177));
}
float4 l9_1249=l9_1248;
float4 l9_1250=l9_1249;
float3 l9_1251=(l9_1250.xyz*1.9921875)-float3(1.0);
l9_1250=float4(l9_1251.x,l9_1251.y,l9_1251.z,l9_1250.w);
l9_1157=l9_1250;
l9_940=l9_1157.xyz;
l9_943=l9_940;
}
else
{
l9_943=l9_941;
}
l9_939=l9_943;
float3 l9_1252=float3(0.0);
float3 l9_1253=l9_844.xyz;
float l9_1254=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_1255=l9_939;
float l9_1256=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_1257=l9_1253;
float l9_1258=l9_1254;
float3 l9_1259=l9_1255;
float l9_1260=l9_1256;
float3 l9_1261=mix(float3(0.0,0.0,1.0),l9_1257,float3(l9_1258))+float3(0.0,0.0,1.0);
float3 l9_1262=mix(float3(0.0,0.0,1.0),l9_1259,float3(l9_1260))*float3(-1.0,-1.0,1.0);
float3 l9_1263=normalize((l9_1261*dot(l9_1261,l9_1262))-(l9_1262*l9_1261.z));
l9_1255=l9_1263;
float3 l9_1264=l9_1255;
l9_1252=l9_1264;
float3 l9_1265=float3(0.0);
l9_1265=l9_630*l9_1252;
float3 l9_1266=float3(0.0);
float3 l9_1267=l9_1265;
float l9_1268=dot(l9_1267,l9_1267);
float l9_1269;
if (l9_1268>0.0)
{
l9_1269=1.0/sqrt(l9_1268);
}
else
{
l9_1269=0.0;
}
float l9_1270=l9_1269;
float3 l9_1271=l9_1267*l9_1270;
l9_1266=l9_1271;
param_13=l9_1266;
param_15=param_13;
}
else
{
float3 l9_1272=float3(0.0);
l9_1272=param_16.VertexNormal_WorldSpace;
float3 l9_1273=float3(0.0);
float3 l9_1274=l9_1272;
float l9_1275=dot(l9_1274,l9_1274);
float l9_1276;
if (l9_1275>0.0)
{
l9_1276=1.0/sqrt(l9_1275);
}
else
{
l9_1276=0.0;
}
float l9_1277=l9_1276;
float3 l9_1278=l9_1274*l9_1277;
l9_1273=l9_1278;
param_14=l9_1273;
param_15=param_14;
}
Result_N337=param_15;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float2 Result_N176=float2(0.0);
float2 param_17=float2(0.0);
float2 param_18=float2(0.0);
float2 param_19=float2(0.0);
float2 param_20=float2(0.0);
float2 param_21=float2(0.0);
ssGlobals param_23=Globals;
float2 param_22;
if (NODE_221_DROPLIST_ITEM_tmp==0)
{
float2 l9_1279=float2(0.0);
l9_1279=param_23.Surface_UVCoord0;
param_17=l9_1279;
param_22=param_17;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==1)
{
float2 l9_1280=float2(0.0);
l9_1280=param_23.Surface_UVCoord1;
param_18=l9_1280;
param_22=param_18;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==2)
{
float2 l9_1281=float2(0.0);
float2 l9_1282=float2(0.0);
float2 l9_1283=float2(0.0);
ssGlobals l9_1284=param_23;
float2 l9_1285;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1286=float2(0.0);
float2 l9_1287=float2(0.0);
float2 l9_1288=float2(0.0);
ssGlobals l9_1289=l9_1284;
float2 l9_1290;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1291=float2(0.0);
float2 l9_1292=float2(0.0);
float2 l9_1293=float2(0.0);
float2 l9_1294=float2(0.0);
float2 l9_1295=float2(0.0);
ssGlobals l9_1296=l9_1289;
float2 l9_1297;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1298=float2(0.0);
l9_1298=l9_1296.Surface_UVCoord0;
l9_1292=l9_1298;
l9_1297=l9_1292;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1299=float2(0.0);
l9_1299=l9_1296.Surface_UVCoord1;
l9_1293=l9_1299;
l9_1297=l9_1293;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1300=float2(0.0);
l9_1300=l9_1296.gScreenCoord;
l9_1294=l9_1300;
l9_1297=l9_1294;
}
else
{
float2 l9_1301=float2(0.0);
l9_1301=l9_1296.Surface_UVCoord0;
l9_1295=l9_1301;
l9_1297=l9_1295;
}
}
}
l9_1291=l9_1297;
float2 l9_1302=float2(0.0);
float2 l9_1303=(*sc_set0.UserUniforms).uv2Scale;
l9_1302=l9_1303;
float2 l9_1304=float2(0.0);
l9_1304=l9_1302;
float2 l9_1305=float2(0.0);
float2 l9_1306=(*sc_set0.UserUniforms).uv2Offset;
l9_1305=l9_1306;
float2 l9_1307=float2(0.0);
l9_1307=l9_1305;
float2 l9_1308=float2(0.0);
l9_1308=(l9_1291*l9_1304)+l9_1307;
float2 l9_1309=float2(0.0);
l9_1309=l9_1308+(l9_1307*(l9_1289.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1287=l9_1309;
l9_1290=l9_1287;
}
else
{
float2 l9_1310=float2(0.0);
float2 l9_1311=float2(0.0);
float2 l9_1312=float2(0.0);
float2 l9_1313=float2(0.0);
float2 l9_1314=float2(0.0);
ssGlobals l9_1315=l9_1289;
float2 l9_1316;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1317=float2(0.0);
l9_1317=l9_1315.Surface_UVCoord0;
l9_1311=l9_1317;
l9_1316=l9_1311;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1318=float2(0.0);
l9_1318=l9_1315.Surface_UVCoord1;
l9_1312=l9_1318;
l9_1316=l9_1312;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1319=float2(0.0);
l9_1319=l9_1315.gScreenCoord;
l9_1313=l9_1319;
l9_1316=l9_1313;
}
else
{
float2 l9_1320=float2(0.0);
l9_1320=l9_1315.Surface_UVCoord0;
l9_1314=l9_1320;
l9_1316=l9_1314;
}
}
}
l9_1310=l9_1316;
float2 l9_1321=float2(0.0);
float2 l9_1322=(*sc_set0.UserUniforms).uv2Scale;
l9_1321=l9_1322;
float2 l9_1323=float2(0.0);
l9_1323=l9_1321;
float2 l9_1324=float2(0.0);
float2 l9_1325=(*sc_set0.UserUniforms).uv2Offset;
l9_1324=l9_1325;
float2 l9_1326=float2(0.0);
l9_1326=l9_1324;
float2 l9_1327=float2(0.0);
l9_1327=(l9_1310*l9_1323)+l9_1326;
l9_1288=l9_1327;
l9_1290=l9_1288;
}
l9_1286=l9_1290;
l9_1282=l9_1286;
l9_1285=l9_1282;
}
else
{
float2 l9_1328=float2(0.0);
l9_1328=l9_1284.Surface_UVCoord0;
l9_1283=l9_1328;
l9_1285=l9_1283;
}
l9_1281=l9_1285;
float2 l9_1329=float2(0.0);
l9_1329=l9_1281;
float2 l9_1330=float2(0.0);
l9_1330=l9_1329;
param_19=l9_1330;
param_22=param_19;
}
else
{
if (NODE_221_DROPLIST_ITEM_tmp==3)
{
float2 l9_1331=float2(0.0);
float2 l9_1332=float2(0.0);
float2 l9_1333=float2(0.0);
ssGlobals l9_1334=param_23;
float2 l9_1335;
if ((int(Tweak_N11_tmp)!=0))
{
float2 l9_1336=float2(0.0);
float2 l9_1337=float2(0.0);
float2 l9_1338=float2(0.0);
ssGlobals l9_1339=l9_1334;
float2 l9_1340;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1341=float2(0.0);
float2 l9_1342=float2(0.0);
float2 l9_1343=float2(0.0);
float2 l9_1344=float2(0.0);
float2 l9_1345=float2(0.0);
float2 l9_1346=float2(0.0);
ssGlobals l9_1347=l9_1339;
float2 l9_1348;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1349=float2(0.0);
l9_1349=l9_1347.Surface_UVCoord0;
l9_1342=l9_1349;
l9_1348=l9_1342;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1350=float2(0.0);
l9_1350=l9_1347.Surface_UVCoord1;
l9_1343=l9_1350;
l9_1348=l9_1343;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1351=float2(0.0);
l9_1351=l9_1347.gScreenCoord;
l9_1344=l9_1351;
l9_1348=l9_1344;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1352=float2(0.0);
float2 l9_1353=float2(0.0);
float2 l9_1354=float2(0.0);
ssGlobals l9_1355=l9_1347;
float2 l9_1356;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1357=float2(0.0);
float2 l9_1358=float2(0.0);
float2 l9_1359=float2(0.0);
ssGlobals l9_1360=l9_1355;
float2 l9_1361;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1362=float2(0.0);
float2 l9_1363=float2(0.0);
float2 l9_1364=float2(0.0);
float2 l9_1365=float2(0.0);
float2 l9_1366=float2(0.0);
ssGlobals l9_1367=l9_1360;
float2 l9_1368;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1369=float2(0.0);
l9_1369=l9_1367.Surface_UVCoord0;
l9_1363=l9_1369;
l9_1368=l9_1363;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1370=float2(0.0);
l9_1370=l9_1367.Surface_UVCoord1;
l9_1364=l9_1370;
l9_1368=l9_1364;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1371=float2(0.0);
l9_1371=l9_1367.gScreenCoord;
l9_1365=l9_1371;
l9_1368=l9_1365;
}
else
{
float2 l9_1372=float2(0.0);
l9_1372=l9_1367.Surface_UVCoord0;
l9_1366=l9_1372;
l9_1368=l9_1366;
}
}
}
l9_1362=l9_1368;
float2 l9_1373=float2(0.0);
float2 l9_1374=(*sc_set0.UserUniforms).uv2Scale;
l9_1373=l9_1374;
float2 l9_1375=float2(0.0);
l9_1375=l9_1373;
float2 l9_1376=float2(0.0);
float2 l9_1377=(*sc_set0.UserUniforms).uv2Offset;
l9_1376=l9_1377;
float2 l9_1378=float2(0.0);
l9_1378=l9_1376;
float2 l9_1379=float2(0.0);
l9_1379=(l9_1362*l9_1375)+l9_1378;
float2 l9_1380=float2(0.0);
l9_1380=l9_1379+(l9_1378*(l9_1360.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1358=l9_1380;
l9_1361=l9_1358;
}
else
{
float2 l9_1381=float2(0.0);
float2 l9_1382=float2(0.0);
float2 l9_1383=float2(0.0);
float2 l9_1384=float2(0.0);
float2 l9_1385=float2(0.0);
ssGlobals l9_1386=l9_1360;
float2 l9_1387;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1388=float2(0.0);
l9_1388=l9_1386.Surface_UVCoord0;
l9_1382=l9_1388;
l9_1387=l9_1382;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1389=float2(0.0);
l9_1389=l9_1386.Surface_UVCoord1;
l9_1383=l9_1389;
l9_1387=l9_1383;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1390=float2(0.0);
l9_1390=l9_1386.gScreenCoord;
l9_1384=l9_1390;
l9_1387=l9_1384;
}
else
{
float2 l9_1391=float2(0.0);
l9_1391=l9_1386.Surface_UVCoord0;
l9_1385=l9_1391;
l9_1387=l9_1385;
}
}
}
l9_1381=l9_1387;
float2 l9_1392=float2(0.0);
float2 l9_1393=(*sc_set0.UserUniforms).uv2Scale;
l9_1392=l9_1393;
float2 l9_1394=float2(0.0);
l9_1394=l9_1392;
float2 l9_1395=float2(0.0);
float2 l9_1396=(*sc_set0.UserUniforms).uv2Offset;
l9_1395=l9_1396;
float2 l9_1397=float2(0.0);
l9_1397=l9_1395;
float2 l9_1398=float2(0.0);
l9_1398=(l9_1381*l9_1394)+l9_1397;
l9_1359=l9_1398;
l9_1361=l9_1359;
}
l9_1357=l9_1361;
l9_1353=l9_1357;
l9_1356=l9_1353;
}
else
{
float2 l9_1399=float2(0.0);
l9_1399=l9_1355.Surface_UVCoord0;
l9_1354=l9_1399;
l9_1356=l9_1354;
}
l9_1352=l9_1356;
float2 l9_1400=float2(0.0);
l9_1400=l9_1352;
float2 l9_1401=float2(0.0);
l9_1401=l9_1400;
l9_1345=l9_1401;
l9_1348=l9_1345;
}
else
{
float2 l9_1402=float2(0.0);
l9_1402=l9_1347.Surface_UVCoord0;
l9_1346=l9_1402;
l9_1348=l9_1346;
}
}
}
}
l9_1341=l9_1348;
float2 l9_1403=float2(0.0);
float2 l9_1404=(*sc_set0.UserUniforms).uv3Scale;
l9_1403=l9_1404;
float2 l9_1405=float2(0.0);
l9_1405=l9_1403;
float2 l9_1406=float2(0.0);
float2 l9_1407=(*sc_set0.UserUniforms).uv3Offset;
l9_1406=l9_1407;
float2 l9_1408=float2(0.0);
l9_1408=l9_1406;
float2 l9_1409=float2(0.0);
l9_1409=(l9_1341*l9_1405)+l9_1408;
float2 l9_1410=float2(0.0);
l9_1410=l9_1409+(l9_1408*(l9_1339.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1337=l9_1410;
l9_1340=l9_1337;
}
else
{
float2 l9_1411=float2(0.0);
float2 l9_1412=float2(0.0);
float2 l9_1413=float2(0.0);
float2 l9_1414=float2(0.0);
float2 l9_1415=float2(0.0);
float2 l9_1416=float2(0.0);
ssGlobals l9_1417=l9_1339;
float2 l9_1418;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1419=float2(0.0);
l9_1419=l9_1417.Surface_UVCoord0;
l9_1412=l9_1419;
l9_1418=l9_1412;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1420=float2(0.0);
l9_1420=l9_1417.Surface_UVCoord1;
l9_1413=l9_1420;
l9_1418=l9_1413;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1421=float2(0.0);
l9_1421=l9_1417.gScreenCoord;
l9_1414=l9_1421;
l9_1418=l9_1414;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1422=float2(0.0);
float2 l9_1423=float2(0.0);
float2 l9_1424=float2(0.0);
ssGlobals l9_1425=l9_1417;
float2 l9_1426;
if ((int(Tweak_N67_tmp)!=0))
{
float2 l9_1427=float2(0.0);
float2 l9_1428=float2(0.0);
float2 l9_1429=float2(0.0);
ssGlobals l9_1430=l9_1425;
float2 l9_1431;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1432=float2(0.0);
float2 l9_1433=float2(0.0);
float2 l9_1434=float2(0.0);
float2 l9_1435=float2(0.0);
float2 l9_1436=float2(0.0);
ssGlobals l9_1437=l9_1430;
float2 l9_1438;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1439=float2(0.0);
l9_1439=l9_1437.Surface_UVCoord0;
l9_1433=l9_1439;
l9_1438=l9_1433;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1440=float2(0.0);
l9_1440=l9_1437.Surface_UVCoord1;
l9_1434=l9_1440;
l9_1438=l9_1434;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1441=float2(0.0);
l9_1441=l9_1437.gScreenCoord;
l9_1435=l9_1441;
l9_1438=l9_1435;
}
else
{
float2 l9_1442=float2(0.0);
l9_1442=l9_1437.Surface_UVCoord0;
l9_1436=l9_1442;
l9_1438=l9_1436;
}
}
}
l9_1432=l9_1438;
float2 l9_1443=float2(0.0);
float2 l9_1444=(*sc_set0.UserUniforms).uv2Scale;
l9_1443=l9_1444;
float2 l9_1445=float2(0.0);
l9_1445=l9_1443;
float2 l9_1446=float2(0.0);
float2 l9_1447=(*sc_set0.UserUniforms).uv2Offset;
l9_1446=l9_1447;
float2 l9_1448=float2(0.0);
l9_1448=l9_1446;
float2 l9_1449=float2(0.0);
l9_1449=(l9_1432*l9_1445)+l9_1448;
float2 l9_1450=float2(0.0);
l9_1450=l9_1449+(l9_1448*(l9_1430.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1428=l9_1450;
l9_1431=l9_1428;
}
else
{
float2 l9_1451=float2(0.0);
float2 l9_1452=float2(0.0);
float2 l9_1453=float2(0.0);
float2 l9_1454=float2(0.0);
float2 l9_1455=float2(0.0);
ssGlobals l9_1456=l9_1430;
float2 l9_1457;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1458=float2(0.0);
l9_1458=l9_1456.Surface_UVCoord0;
l9_1452=l9_1458;
l9_1457=l9_1452;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1459=float2(0.0);
l9_1459=l9_1456.Surface_UVCoord1;
l9_1453=l9_1459;
l9_1457=l9_1453;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1460=float2(0.0);
l9_1460=l9_1456.gScreenCoord;
l9_1454=l9_1460;
l9_1457=l9_1454;
}
else
{
float2 l9_1461=float2(0.0);
l9_1461=l9_1456.Surface_UVCoord0;
l9_1455=l9_1461;
l9_1457=l9_1455;
}
}
}
l9_1451=l9_1457;
float2 l9_1462=float2(0.0);
float2 l9_1463=(*sc_set0.UserUniforms).uv2Scale;
l9_1462=l9_1463;
float2 l9_1464=float2(0.0);
l9_1464=l9_1462;
float2 l9_1465=float2(0.0);
float2 l9_1466=(*sc_set0.UserUniforms).uv2Offset;
l9_1465=l9_1466;
float2 l9_1467=float2(0.0);
l9_1467=l9_1465;
float2 l9_1468=float2(0.0);
l9_1468=(l9_1451*l9_1464)+l9_1467;
l9_1429=l9_1468;
l9_1431=l9_1429;
}
l9_1427=l9_1431;
l9_1423=l9_1427;
l9_1426=l9_1423;
}
else
{
float2 l9_1469=float2(0.0);
l9_1469=l9_1425.Surface_UVCoord0;
l9_1424=l9_1469;
l9_1426=l9_1424;
}
l9_1422=l9_1426;
float2 l9_1470=float2(0.0);
l9_1470=l9_1422;
float2 l9_1471=float2(0.0);
l9_1471=l9_1470;
l9_1415=l9_1471;
l9_1418=l9_1415;
}
else
{
float2 l9_1472=float2(0.0);
l9_1472=l9_1417.Surface_UVCoord0;
l9_1416=l9_1472;
l9_1418=l9_1416;
}
}
}
}
l9_1411=l9_1418;
float2 l9_1473=float2(0.0);
float2 l9_1474=(*sc_set0.UserUniforms).uv3Scale;
l9_1473=l9_1474;
float2 l9_1475=float2(0.0);
l9_1475=l9_1473;
float2 l9_1476=float2(0.0);
float2 l9_1477=(*sc_set0.UserUniforms).uv3Offset;
l9_1476=l9_1477;
float2 l9_1478=float2(0.0);
l9_1478=l9_1476;
float2 l9_1479=float2(0.0);
l9_1479=(l9_1411*l9_1475)+l9_1478;
l9_1338=l9_1479;
l9_1340=l9_1338;
}
l9_1336=l9_1340;
l9_1332=l9_1336;
l9_1335=l9_1332;
}
else
{
float2 l9_1480=float2(0.0);
l9_1480=l9_1334.Surface_UVCoord0;
l9_1333=l9_1480;
l9_1335=l9_1333;
}
l9_1331=l9_1335;
float2 l9_1481=float2(0.0);
l9_1481=l9_1331;
float2 l9_1482=float2(0.0);
l9_1482=l9_1481;
param_20=l9_1482;
param_22=param_20;
}
else
{
float2 l9_1483=float2(0.0);
l9_1483=param_23.Surface_UVCoord0;
param_21=l9_1483;
param_22=param_21;
}
}
}
}
Result_N176=param_22;
float4 Color_N66=float4(0.0);
int l9_1484=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_1485=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1485=0;
}
else
{
l9_1485=in.varStereoViewID;
}
int l9_1486=l9_1485;
l9_1484=1-l9_1486;
}
else
{
int l9_1487=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1487=0;
}
else
{
l9_1487=in.varStereoViewID;
}
int l9_1488=l9_1487;
l9_1484=l9_1488;
}
int l9_1489=l9_1484;
int param_24=materialParamsTexLayout_tmp;
int param_25=l9_1489;
float2 param_26=Result_N176;
bool param_27=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 param_28=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 param_29=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool param_30=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 param_31=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool param_32=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 param_33=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float param_34=0.0;
bool l9_1490=param_32&&(!param_30);
float l9_1491=1.0;
float l9_1492=param_26.x;
int l9_1493=param_29.x;
if (l9_1493==1)
{
l9_1492=fract(l9_1492);
}
else
{
if (l9_1493==2)
{
float l9_1494=fract(l9_1492);
float l9_1495=l9_1492-l9_1494;
float l9_1496=step(0.25,fract(l9_1495*0.5));
l9_1492=mix(l9_1494,1.0-l9_1494,fast::clamp(l9_1496,0.0,1.0));
}
}
param_26.x=l9_1492;
float l9_1497=param_26.y;
int l9_1498=param_29.y;
if (l9_1498==1)
{
l9_1497=fract(l9_1497);
}
else
{
if (l9_1498==2)
{
float l9_1499=fract(l9_1497);
float l9_1500=l9_1497-l9_1499;
float l9_1501=step(0.25,fract(l9_1500*0.5));
l9_1497=mix(l9_1499,1.0-l9_1499,fast::clamp(l9_1501,0.0,1.0));
}
}
param_26.y=l9_1497;
if (param_30)
{
bool l9_1502=param_32;
bool l9_1503;
if (l9_1502)
{
l9_1503=param_29.x==3;
}
else
{
l9_1503=l9_1502;
}
float l9_1504=param_26.x;
float l9_1505=param_31.x;
float l9_1506=param_31.z;
bool l9_1507=l9_1503;
float l9_1508=l9_1491;
float l9_1509=fast::clamp(l9_1504,l9_1505,l9_1506);
float l9_1510=step(abs(l9_1504-l9_1509),9.9999997e-06);
l9_1508*=(l9_1510+((1.0-float(l9_1507))*(1.0-l9_1510)));
l9_1504=l9_1509;
param_26.x=l9_1504;
l9_1491=l9_1508;
bool l9_1511=param_32;
bool l9_1512;
if (l9_1511)
{
l9_1512=param_29.y==3;
}
else
{
l9_1512=l9_1511;
}
float l9_1513=param_26.y;
float l9_1514=param_31.y;
float l9_1515=param_31.w;
bool l9_1516=l9_1512;
float l9_1517=l9_1491;
float l9_1518=fast::clamp(l9_1513,l9_1514,l9_1515);
float l9_1519=step(abs(l9_1513-l9_1518),9.9999997e-06);
l9_1517*=(l9_1519+((1.0-float(l9_1516))*(1.0-l9_1519)));
l9_1513=l9_1518;
param_26.y=l9_1513;
l9_1491=l9_1517;
}
float2 l9_1520=param_26;
bool l9_1521=param_27;
float3x3 l9_1522=param_28;
if (l9_1521)
{
l9_1520=float2((l9_1522*float3(l9_1520,1.0)).xy);
}
float2 l9_1523=l9_1520;
float2 l9_1524=l9_1523;
float2 l9_1525=l9_1524;
param_26=l9_1525;
float l9_1526=param_26.x;
int l9_1527=param_29.x;
bool l9_1528=l9_1490;
float l9_1529=l9_1491;
if ((l9_1527==0)||(l9_1527==3))
{
float l9_1530=l9_1526;
float l9_1531=0.0;
float l9_1532=1.0;
bool l9_1533=l9_1528;
float l9_1534=l9_1529;
float l9_1535=fast::clamp(l9_1530,l9_1531,l9_1532);
float l9_1536=step(abs(l9_1530-l9_1535),9.9999997e-06);
l9_1534*=(l9_1536+((1.0-float(l9_1533))*(1.0-l9_1536)));
l9_1530=l9_1535;
l9_1526=l9_1530;
l9_1529=l9_1534;
}
param_26.x=l9_1526;
l9_1491=l9_1529;
float l9_1537=param_26.y;
int l9_1538=param_29.y;
bool l9_1539=l9_1490;
float l9_1540=l9_1491;
if ((l9_1538==0)||(l9_1538==3))
{
float l9_1541=l9_1537;
float l9_1542=0.0;
float l9_1543=1.0;
bool l9_1544=l9_1539;
float l9_1545=l9_1540;
float l9_1546=fast::clamp(l9_1541,l9_1542,l9_1543);
float l9_1547=step(abs(l9_1541-l9_1546),9.9999997e-06);
l9_1545*=(l9_1547+((1.0-float(l9_1544))*(1.0-l9_1547)));
l9_1541=l9_1546;
l9_1537=l9_1541;
l9_1540=l9_1545;
}
param_26.y=l9_1537;
l9_1491=l9_1540;
float2 l9_1548=param_26;
int l9_1549=param_24;
int l9_1550=param_25;
float l9_1551=param_34;
float2 l9_1552=l9_1548;
int l9_1553=l9_1549;
int l9_1554=l9_1550;
float3 l9_1555=float3(0.0);
if (l9_1553==0)
{
l9_1555=float3(l9_1552,0.0);
}
else
{
if (l9_1553==1)
{
l9_1555=float3(l9_1552.x,(l9_1552.y*0.5)+(0.5-(float(l9_1554)*0.5)),0.0);
}
else
{
l9_1555=float3(l9_1552,float(l9_1554));
}
}
float3 l9_1556=l9_1555;
float3 l9_1557=l9_1556;
float2 l9_1558=l9_1557.xy;
float l9_1559=l9_1551;
float4 l9_1560=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_1558,bias(l9_1559));
float4 l9_1561=l9_1560;
float4 l9_1562=l9_1561;
if (param_32)
{
l9_1562=mix(param_33,l9_1562,float4(l9_1491));
}
float4 l9_1563=l9_1562;
Color_N66=l9_1563;
float Value2_N304=0.0;
float2 param_35=Color_N66.xy;
float param_36=param_35.y;
Value2_N304=param_36;
float Output_N243=0.0;
float param_37=(*sc_set0.UserUniforms).roughness;
Output_N243=param_37;
float Value_N278=0.0;
Value_N278=Output_N243;
float Output_N313=0.0;
Output_N313=Value_N278*Value2_N304;
float Export_N224=0.0;
Export_N224=Output_N313;
float param_38=Export_N158;
float3 param_39=Export_N334;
float param_40=Export_N224;
ssGlobals param_41=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_41.BumpedNormal=param_39;
}
param_38=fast::clamp(param_38,0.0,1.0);
float l9_1564=param_38;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1564<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1565=gl_FragCoord;
float2 l9_1566=floor(mod(l9_1565.xy,float2(4.0)));
float l9_1567=(mod(dot(l9_1566,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1564<l9_1567)
{
discard_fragment();
}
}
float3 l9_1568=param_41.PositionWS;
float3 l9_1569=param_41.BumpedNormal;
float l9_1570=param_40;
float3 l9_1571=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_1568);
if (dot(l9_1571,l9_1569)>=(-0.050000001))
{
uint3 l9_1572=uint3(round((l9_1568-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_1572.x,l9_1572.y,l9_1572.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_1573=l9_1569;
float l9_1574=dot(abs(l9_1573),float3(1.0));
l9_1573/=float3(l9_1574);
float l9_1575=fast::clamp(-l9_1573.z,0.0,1.0);
float2 l9_1576=l9_1573.xy;
float l9_1577;
if (l9_1573.x>=0.0)
{
l9_1577=l9_1575;
}
else
{
l9_1577=-l9_1575;
}
l9_1576.x+=l9_1577;
float l9_1578;
if (l9_1573.y>=0.0)
{
l9_1578=l9_1575;
}
else
{
l9_1578=-l9_1575;
}
l9_1576.y+=l9_1578;
float2 l9_1579=l9_1576;
float2 l9_1580=l9_1579;
uint2 l9_1581=uint2(as_type<uint>(half2(float2(l9_1580.x,0.0))),as_type<uint>(half2(float2(l9_1580.y,0.0))));
out.normal_and_more=uint4(l9_1581.x,l9_1581.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_1582;
if (l9_1570<0.0)
{
l9_1582=1023u;
}
else
{
l9_1582=uint(fast::clamp(l9_1570,0.0,1.0)*1000.0);
}
uint l9_1583=l9_1582;
l9_1583 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_1583;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
return out;
}
} // RECEIVER MODE SHADER
