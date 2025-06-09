#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
//efine SC_DISABLE_FRUSTUM_CULLING 1
#define SC_ENABLE_INSTANCED_RENDERING
#ifdef ALIGNTOX
#undef ALIGNTOX
#endif
#ifdef ALIGNTOY
#undef ALIGNTOY
#endif
#ifdef ALIGNTOZ
#undef ALIGNTOZ
#endif
#ifdef CENTER_BBOX
#undef CENTER_BBOX
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
//sampler sampler colorRampTextureSmpSC 0:29
//sampler sampler intensityTextureSmpSC 0:30
//sampler sampler mainTextureSmpSC 0:31
//sampler sampler materialParamsTexSmpSC 0:32
//sampler sampler normalTexSmpSC 0:33
//sampler sampler sc_EnvmapDiffuseSmpSC 0:34
//sampler sampler sc_EnvmapSpecularSmpSC 0:35
//sampler sampler sc_RayTracedAoTextureSmpSC 0:37
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:38
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:39
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:40
//sampler sampler sc_SSAOTextureSmpSC 0:41
//sampler sampler sc_ScreenTextureSmpSC 0:42
//sampler sampler sc_ShadowTextureSmpSC 0:43
//sampler sampler sizeRampTextureSmpSC 0:45
//sampler sampler trailColorRampTexSmpSC 0:46
//sampler sampler trailSizeRampTexSmpSC 0:47
//sampler sampler trailTexSmpSC 0:48
//sampler sampler velRampTextureSmpSC 0:49
//texture texture2D colorRampTexture 0:1:0:29
//texture texture2D intensityTexture 0:2:0:30
//texture texture2D mainTexture 0:3:0:31
//texture texture2D materialParamsTex 0:4:0:32
//texture texture2D normalTex 0:5:0:33
//texture texture2D sc_EnvmapDiffuse 0:6:0:34
//texture texture2D sc_EnvmapSpecular 0:7:0:35
//texture texture2D sc_RayTracedAoTexture 0:16:0:37
//texture texture2D sc_RayTracedDiffIndTexture 0:17:0:38
//texture texture2D sc_RayTracedReflectionTexture 0:18:0:39
//texture texture2D sc_RayTracedShadowTexture 0:19:0:40
//texture texture2D sc_SSAOTexture 0:20:0:41
//texture texture2D sc_ScreenTexture 0:21:0:42
//texture texture2D sc_ShadowTexture 0:22:0:43
//texture texture2D sizeRampTexture 0:24:0:45
//texture texture2D trailColorRampTex 0:25:0:46
//texture texture2D trailSizeRampTex 0:26:0:47
//texture texture2D trailTex 0:27:0:48
//texture texture2D velRampTexture 0:28:0:49
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:50:6400 {
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
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
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
//bool receivesRayTracedShadows 3828
//bool receivesRayTracedDiffuseIndirect 3832
//bool receivesRayTracedAo 3836
//float receiver_mask 4032
//float3 OriginNormalizationScale 4048
//float3 OriginNormalizationOffset 4080
//int receiverId 4096
//float correctedIntensity 4100
//float3x3 intensityTextureTransform 4160
//float4 intensityTextureUvMinMax 4208
//float4 intensityTextureBorderColor 4224
//int PreviewEnabled 4388
//float alphaTestThreshold 4396
//float timeGlobal 4400
//float externalTimeInput 4404
//float externalSeed 4408
//float lifeTimeConstant 4412
//float2 lifeTimeMinMax 4416
//float spawnDuration 4424
//float trailLength 4428
//float2 trailTaper 4432
//float trailWidth 4440
//float3x3 trailSizeRampTexTransform 4496
//float4 trailSizeRampTexUvMinMax 4544
//float4 trailSizeRampTexBorderColor 4560
//float3 spawnLocation 4576
//float3 spawnBox 4592
//float3 spawnSphere 4608
//float3 noiseMult 4624
//float3 noiseFrequency 4640
//float3 sNoiseMult 4656
//float3 sNoiseFrequency 4672
//float3 velocityMin 4688
//float3 velocityMax 4704
//float3 velocityDrag 4720
//float3x3 velRampTextureTransform 4784
//float4 velRampTextureUvMinMax 4832
//float4 velRampTextureBorderColor 4848
//float2 sizeStart 4864
//float3 sizeStart3D 4880
//float2 sizeEnd 4896
//float3 sizeEnd3D 4912
//float2 sizeStartMin 4928
//float3 sizeStartMin3D 4944
//float2 sizeStartMax 4960
//float3 sizeStartMax3D 4976
//float2 sizeEndMin 4992
//float3 sizeEndMin3D 5008
//float2 sizeEndMax 5024
//float3 sizeEndMax3D 5040
//float sizeSpeed 5056
//float3x3 sizeRampTextureTransform 5120
//float4 sizeRampTextureUvMinMax 5168
//float4 sizeRampTextureBorderColor 5184
//float gravity 5200
//float3 localForce 5216
//float sizeVelScale 5232
//bool ALIGNTOX 5236
//bool ALIGNTOY 5240
//bool ALIGNTOZ 5244
//float2 rotationRandomX 5248
//float2 rotationRateX 5256
//float2 randomRotationY 5264
//float2 rotationRateY 5272
//float2 rotationRandom 5280
//float2 randomRotationZ 5288
//float2 rotationRate 5296
//float2 rotationRateZ 5304
//float rotationDrag 5312
//bool CENTER_BBOX 5316
//float fadeDistanceVisible 5320
//float fadeDistanceInvisible 5324
//float3x3 trailTexTransform 5376
//float4 trailTexUvMinMax 5424
//float4 trailTexBorderColor 5440
//float4 trailColorRampTexSize 5456
//float3x3 trailColorRampTexTransform 5504
//float4 trailColorRampTexUvMinMax 5552
//float4 trailColorRampTexBorderColor 5568
//float2 trailFadeStartEnd 5584
//float2 trailFadeInOut 5592
//float3 colorStart 5600
//float3 colorEnd 5616
//float3 colorMinStart 5632
//float3 colorMinEnd 5648
//float3 colorMaxStart 5664
//float3 colorMaxEnd 5680
//float alphaStart 5696
//float alphaEnd 5700
//float alphaMinStart 5704
//float alphaMinEnd 5708
//float alphaMaxStart 5712
//float alphaMaxEnd 5716
//float alphaDissolveMult 5720
//float numValidFrames 5724
//float2 gridSize 5728
//float flipBookSpeedMult 5736
//float flipBookRandomStart 5740
//float4 colorRampTextureSize 5744
//float3x3 colorRampTextureTransform 5792
//float4 colorRampTextureUvMinMax 5840
//float4 colorRampTextureBorderColor 5856
//float4 colorRampMult 5872
//float3x3 mainTextureTransform 5936
//float4 mainTextureUvMinMax 5984
//float4 mainTextureBorderColor 6000
//float3x3 normalTexTransform 6064
//float4 normalTexUvMinMax 6112
//float4 normalTexBorderColor 6128
//float3x3 materialParamsTexTransform 6192
//float4 materialParamsTexUvMinMax 6240
//float4 materialParamsTexBorderColor 6256
//float2 Port_Input1_N138 6280
//float2 Port_Input1_N139 6288
//float2 Port_Input1_N140 6296
//float2 Port_Input1_N144 6304
//float Port_Input1_N110 6320
//float Port_Input1_N216 6328
//float3 Port_Default_N182 6336
//float3 Port_Emissive_N014 6352
//float3 Port_AO_N014 6368
//float3 Port_SpecularAO_N014 6384
//}
//spec_const bool ALIGNTOCAMERAUP 0 0
//spec_const bool ALPHADISSOLVE 1 0
//spec_const bool ALPHAMINMAX 2 0
//spec_const bool BASETEXTURE 3 0
//spec_const bool BLACKASALPHA 4 0
//spec_const bool BLEND_MODE_AVERAGE 5 0
//spec_const bool BLEND_MODE_BRIGHT 6 0
//spec_const bool BLEND_MODE_COLOR_BURN 7 0
//spec_const bool BLEND_MODE_COLOR_DODGE 8 0
//spec_const bool BLEND_MODE_COLOR 9 0
//spec_const bool BLEND_MODE_DARKEN 10 0
//spec_const bool BLEND_MODE_DIFFERENCE 11 0
//spec_const bool BLEND_MODE_DIVIDE 12 0
//spec_const bool BLEND_MODE_DIVISION 13 0
//spec_const bool BLEND_MODE_EXCLUSION 14 0
//spec_const bool BLEND_MODE_FORGRAY 15 0
//spec_const bool BLEND_MODE_HARD_GLOW 16 0
//spec_const bool BLEND_MODE_HARD_LIGHT 17 0
//spec_const bool BLEND_MODE_HARD_MIX 18 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 19 0
//spec_const bool BLEND_MODE_HARD_REFLECT 20 0
//spec_const bool BLEND_MODE_HUE 21 0
//spec_const bool BLEND_MODE_INTENSE 22 0
//spec_const bool BLEND_MODE_LIGHTEN 23 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 24 0
//spec_const bool BLEND_MODE_LUMINOSITY 25 0
//spec_const bool BLEND_MODE_NEGATION 26 0
//spec_const bool BLEND_MODE_NOTBRIGHT 27 0
//spec_const bool BLEND_MODE_OVERLAY 28 0
//spec_const bool BLEND_MODE_PIN_LIGHT 29 0
//spec_const bool BLEND_MODE_REALISTIC 30 0
//spec_const bool BLEND_MODE_SATURATION 31 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 32 0
//spec_const bool BLEND_MODE_SUBTRACT 33 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 34 0
//spec_const bool BOXSPAWN 35 0
//spec_const bool COLORMINMAX 36 0
//spec_const bool COLORMONOMIN 37 0
//spec_const bool COLORRAMP 38 0
//spec_const bool ENABLE_SIZERAMPSTARTENDASBOUNDS 39 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 40 0
//spec_const bool EXTERNALTIME 41 0
//spec_const bool FLIPBOOKBLEND 42 0
//spec_const bool FLIPBOOKBYLIFE 43 0
//spec_const bool FLIPBOOK 44 0
//spec_const bool FORCE 45 0
//spec_const bool IGNORETRANSFORMSCALE 46 0
//spec_const bool IGNOREVEL 47 0
//spec_const bool INILOCATION 48 0
//spec_const bool INSTANTSPAWN 49 0
//spec_const bool LIFETIMEMINMAX 50 0
//spec_const bool NOISE 51 0
//spec_const bool NORANDOFFSET 52 0
//spec_const bool PBRNORMALTEX 53 0
//spec_const bool PBR 54 0
//spec_const bool PREMULTIPLIEDCOLOR 55 0
//spec_const bool SCREENFADE 56 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_colorRampTexture 57 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 58 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_mainTexture 59 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 60 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 61 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture 62 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_trailColorRampTex 63 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_trailSizeRampTex 64 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_trailTex 65 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_velRampTexture 66 0
//spec_const bool SC_USE_UV_MIN_MAX_colorRampTexture 67 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 68 0
//spec_const bool SC_USE_UV_MIN_MAX_mainTexture 69 0
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 70 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 71 0
//spec_const bool SC_USE_UV_MIN_MAX_sizeRampTexture 72 0
//spec_const bool SC_USE_UV_MIN_MAX_trailColorRampTex 73 0
//spec_const bool SC_USE_UV_MIN_MAX_trailSizeRampTex 74 0
//spec_const bool SC_USE_UV_MIN_MAX_trailTex 75 0
//spec_const bool SC_USE_UV_MIN_MAX_velRampTexture 76 0
//spec_const bool SC_USE_UV_TRANSFORM_colorRampTexture 77 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 78 0
//spec_const bool SC_USE_UV_TRANSFORM_mainTexture 79 0
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 80 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 81 0
//spec_const bool SC_USE_UV_TRANSFORM_sizeRampTexture 82 0
//spec_const bool SC_USE_UV_TRANSFORM_trailColorRampTex 83 0
//spec_const bool SC_USE_UV_TRANSFORM_trailSizeRampTex 84 0
//spec_const bool SC_USE_UV_TRANSFORM_trailTex 85 0
//spec_const bool SC_USE_UV_TRANSFORM_velRampTexture 86 0
//spec_const bool SIZEMINMAX 87 0
//spec_const bool SIZERAMP 88 0
//spec_const bool SNOISE 89 0
//spec_const bool SPHERESPAWN 90 0
//spec_const bool TRAILCOLORRAMP 91 0
//spec_const bool TRAILSIZERAMPSTARTENDASBOUNDS 92 0
//spec_const bool TRAILSIZERAMP 93 0
//spec_const bool TRAILS 94 0
//spec_const bool TRAILTEXTURE 95 0
//spec_const bool TRAILTWIST 96 0
//spec_const bool UseViewSpaceDepthVariant 97 1
//spec_const bool VELOCITYDIR 98 0
//spec_const bool VELRAMP 99 0
//spec_const bool WORLDPOSSEED 100 0
//spec_const bool colorRampTextureHasSwappedViews 101 0
//spec_const bool intensityTextureHasSwappedViews 102 0
//spec_const bool mainTextureHasSwappedViews 103 0
//spec_const bool materialParamsTexHasSwappedViews 104 0
//spec_const bool normalTexHasSwappedViews 105 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 106 0
//spec_const bool sc_BlendMode_Add 107 0
//spec_const bool sc_BlendMode_AlphaTest 108 0
//spec_const bool sc_BlendMode_AlphaToCoverage 109 0
//spec_const bool sc_BlendMode_ColoredGlass 110 0
//spec_const bool sc_BlendMode_Custom 111 0
//spec_const bool sc_BlendMode_Max 112 0
//spec_const bool sc_BlendMode_Min 113 0
//spec_const bool sc_BlendMode_MultiplyOriginal 114 0
//spec_const bool sc_BlendMode_Multiply 115 0
//spec_const bool sc_BlendMode_Normal 116 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 117 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 118 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 119 0
//spec_const bool sc_BlendMode_Screen 120 0
//spec_const bool sc_DepthOnly 121 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 122 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 123 0
//spec_const bool sc_FramebufferFetch 124 0
//spec_const bool sc_HasDiffuseEnvmap 125 0
//spec_const bool sc_LightEstimation 126 0
//spec_const bool sc_MotionVectorsPass 127 0
//spec_const bool sc_OITCompositingPass 128 0
//spec_const bool sc_OITDepthBoundsPass 129 0
//spec_const bool sc_OITDepthGatherPass 130 0
//spec_const bool sc_ProjectiveShadowsCaster 131 0
//spec_const bool sc_ProjectiveShadowsReceiver 132 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 133 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 134 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 135 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 136 0
//spec_const bool sc_RenderAlphaToColor 137 0
//spec_const bool sc_SSAOEnabled 138 0
//spec_const bool sc_ScreenTextureHasSwappedViews 139 0
//spec_const bool sc_ShaderComplexityAnalyzer 140 0
//spec_const bool sc_TAAEnabled 141 0
//spec_const bool sc_UseFramebufferFetchMarker 142 0
//spec_const bool sc_VertexBlendingUseNormals 143 0
//spec_const bool sc_VertexBlending 144 0
//spec_const bool sizeRampTextureHasSwappedViews 145 0
//spec_const bool trailColorRampTexHasSwappedViews 146 0
//spec_const bool trailSizeRampTexHasSwappedViews 147 0
//spec_const bool trailTexHasSwappedViews 148 0
//spec_const bool velRampTextureHasSwappedViews 149 0
//spec_const int MESHTYPE 150 0
//spec_const int SC_DEVICE_CLASS 151 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture 152 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 153 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_mainTexture 154 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 155 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 156 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture 157 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex 158 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_trailSizeRampTex 159 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_trailTex 160 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_velRampTexture 161 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture 162 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 163 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_mainTexture 164 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 165 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 166 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture 167 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex 168 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_trailSizeRampTex 169 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_trailTex 170 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_velRampTexture 171 -1
//spec_const int TRAILBEHAVIOR 172 0
//spec_const int colorRampTextureLayout 173 0
//spec_const int intensityTextureLayout 174 0
//spec_const int mainTextureLayout 175 0
//spec_const int materialParamsTexLayout 176 0
//spec_const int normalTexLayout 177 0
//spec_const int rotationSpace 178 0
//spec_const int sc_AmbientLightMode0 179 0
//spec_const int sc_AmbientLightMode1 180 0
//spec_const int sc_AmbientLightMode2 181 0
//spec_const int sc_AmbientLightMode_Constant 182 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 183 0
//spec_const int sc_AmbientLightMode_FromCamera 184 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 185 0
//spec_const int sc_AmbientLightsCount 186 0
//spec_const int sc_DepthBufferMode 187 0
//spec_const int sc_DirectionalLightsCount 188 0
//spec_const int sc_EnvLightMode 189 0
//spec_const int sc_EnvmapDiffuseLayout 190 0
//spec_const int sc_EnvmapSpecularLayout 191 0
//spec_const int sc_LightEstimationSGCount 192 0
//spec_const int sc_MaxTextureImageUnits 193 0
//spec_const int sc_PointLightsCount 194 0
//spec_const int sc_RayTracedAoTextureLayout 195 0
//spec_const int sc_RayTracedDiffIndTextureLayout 196 0
//spec_const int sc_RayTracedReflectionTextureLayout 197 0
//spec_const int sc_RayTracedShadowTextureLayout 198 0
//spec_const int sc_RenderingSpace 199 -1
//spec_const int sc_ScreenTextureLayout 200 0
//spec_const int sc_ShaderCacheConstant 201 0
//spec_const int sc_SkinBonesCount 202 0
//spec_const int sc_StereoRenderingMode 203 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 204 0
//spec_const int sizeRampTextureLayout 205 0
//spec_const int trailColorRampTexLayout 206 0
//spec_const int trailSizeRampTexLayout 207 0
//spec_const int trailTexLayout 208 0
//spec_const int velRampTextureLayout 209 0
//SG_REFLECTION_END
constant bool ALIGNTOCAMERAUP [[function_constant(0)]];
constant bool ALIGNTOCAMERAUP_tmp = is_function_constant_defined(ALIGNTOCAMERAUP) ? ALIGNTOCAMERAUP : false;
constant bool ALPHADISSOLVE [[function_constant(1)]];
constant bool ALPHADISSOLVE_tmp = is_function_constant_defined(ALPHADISSOLVE) ? ALPHADISSOLVE : false;
constant bool ALPHAMINMAX [[function_constant(2)]];
constant bool ALPHAMINMAX_tmp = is_function_constant_defined(ALPHAMINMAX) ? ALPHAMINMAX : false;
constant bool BASETEXTURE [[function_constant(3)]];
constant bool BASETEXTURE_tmp = is_function_constant_defined(BASETEXTURE) ? BASETEXTURE : false;
constant bool BLACKASALPHA [[function_constant(4)]];
constant bool BLACKASALPHA_tmp = is_function_constant_defined(BLACKASALPHA) ? BLACKASALPHA : false;
constant bool BLEND_MODE_AVERAGE [[function_constant(5)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(6)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(7)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(8)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(9)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(10)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(11)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(12)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(13)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(14)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(15)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(16)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(17)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(18)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(19)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(20)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(21)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(22)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(23)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(25)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(26)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(27)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(28)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(30)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(31)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(32)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(33)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(34)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool BOXSPAWN [[function_constant(35)]];
constant bool BOXSPAWN_tmp = is_function_constant_defined(BOXSPAWN) ? BOXSPAWN : false;
constant bool COLORMINMAX [[function_constant(36)]];
constant bool COLORMINMAX_tmp = is_function_constant_defined(COLORMINMAX) ? COLORMINMAX : false;
constant bool COLORMONOMIN [[function_constant(37)]];
constant bool COLORMONOMIN_tmp = is_function_constant_defined(COLORMONOMIN) ? COLORMONOMIN : false;
constant bool COLORRAMP [[function_constant(38)]];
constant bool COLORRAMP_tmp = is_function_constant_defined(COLORRAMP) ? COLORRAMP : false;
constant bool ENABLE_SIZERAMPSTARTENDASBOUNDS [[function_constant(39)]];
constant bool ENABLE_SIZERAMPSTARTENDASBOUNDS_tmp = is_function_constant_defined(ENABLE_SIZERAMPSTARTENDASBOUNDS) ? ENABLE_SIZERAMPSTARTENDASBOUNDS : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(40)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool EXTERNALTIME [[function_constant(41)]];
constant bool EXTERNALTIME_tmp = is_function_constant_defined(EXTERNALTIME) ? EXTERNALTIME : false;
constant bool FLIPBOOKBLEND [[function_constant(42)]];
constant bool FLIPBOOKBLEND_tmp = is_function_constant_defined(FLIPBOOKBLEND) ? FLIPBOOKBLEND : false;
constant bool FLIPBOOKBYLIFE [[function_constant(43)]];
constant bool FLIPBOOKBYLIFE_tmp = is_function_constant_defined(FLIPBOOKBYLIFE) ? FLIPBOOKBYLIFE : false;
constant bool FLIPBOOK [[function_constant(44)]];
constant bool FLIPBOOK_tmp = is_function_constant_defined(FLIPBOOK) ? FLIPBOOK : false;
constant bool FORCE [[function_constant(45)]];
constant bool FORCE_tmp = is_function_constant_defined(FORCE) ? FORCE : false;
constant bool IGNORETRANSFORMSCALE [[function_constant(46)]];
constant bool IGNORETRANSFORMSCALE_tmp = is_function_constant_defined(IGNORETRANSFORMSCALE) ? IGNORETRANSFORMSCALE : false;
constant bool IGNOREVEL [[function_constant(47)]];
constant bool IGNOREVEL_tmp = is_function_constant_defined(IGNOREVEL) ? IGNOREVEL : false;
constant bool INILOCATION [[function_constant(48)]];
constant bool INILOCATION_tmp = is_function_constant_defined(INILOCATION) ? INILOCATION : false;
constant bool INSTANTSPAWN [[function_constant(49)]];
constant bool INSTANTSPAWN_tmp = is_function_constant_defined(INSTANTSPAWN) ? INSTANTSPAWN : false;
constant bool LIFETIMEMINMAX [[function_constant(50)]];
constant bool LIFETIMEMINMAX_tmp = is_function_constant_defined(LIFETIMEMINMAX) ? LIFETIMEMINMAX : false;
constant bool NOISE [[function_constant(51)]];
constant bool NOISE_tmp = is_function_constant_defined(NOISE) ? NOISE : false;
constant bool NORANDOFFSET [[function_constant(52)]];
constant bool NORANDOFFSET_tmp = is_function_constant_defined(NORANDOFFSET) ? NORANDOFFSET : false;
constant bool PBRNORMALTEX [[function_constant(53)]];
constant bool PBRNORMALTEX_tmp = is_function_constant_defined(PBRNORMALTEX) ? PBRNORMALTEX : false;
constant bool PBR [[function_constant(54)]];
constant bool PBR_tmp = is_function_constant_defined(PBR) ? PBR : false;
constant bool PREMULTIPLIEDCOLOR [[function_constant(55)]];
constant bool PREMULTIPLIEDCOLOR_tmp = is_function_constant_defined(PREMULTIPLIEDCOLOR) ? PREMULTIPLIEDCOLOR : false;
constant bool SCREENFADE [[function_constant(56)]];
constant bool SCREENFADE_tmp = is_function_constant_defined(SCREENFADE) ? SCREENFADE : false;
constant bool SC_USE_CLAMP_TO_BORDER_colorRampTexture [[function_constant(57)]];
constant bool SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_colorRampTexture) ? SC_USE_CLAMP_TO_BORDER_colorRampTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(58)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_mainTexture [[function_constant(59)]];
constant bool SC_USE_CLAMP_TO_BORDER_mainTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_mainTexture) ? SC_USE_CLAMP_TO_BORDER_mainTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(60)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(61)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture [[function_constant(62)]];
constant bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sizeRampTexture) ? SC_USE_CLAMP_TO_BORDER_sizeRampTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_trailColorRampTex [[function_constant(63)]];
constant bool SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_trailColorRampTex) ? SC_USE_CLAMP_TO_BORDER_trailColorRampTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_trailSizeRampTex [[function_constant(64)]];
constant bool SC_USE_CLAMP_TO_BORDER_trailSizeRampTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_trailSizeRampTex) ? SC_USE_CLAMP_TO_BORDER_trailSizeRampTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_trailTex [[function_constant(65)]];
constant bool SC_USE_CLAMP_TO_BORDER_trailTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_trailTex) ? SC_USE_CLAMP_TO_BORDER_trailTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_velRampTexture [[function_constant(66)]];
constant bool SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_velRampTexture) ? SC_USE_CLAMP_TO_BORDER_velRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_colorRampTexture [[function_constant(67)]];
constant bool SC_USE_UV_MIN_MAX_colorRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_colorRampTexture) ? SC_USE_UV_MIN_MAX_colorRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(68)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_mainTexture [[function_constant(69)]];
constant bool SC_USE_UV_MIN_MAX_mainTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_mainTexture) ? SC_USE_UV_MIN_MAX_mainTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(70)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(71)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_sizeRampTexture [[function_constant(72)]];
constant bool SC_USE_UV_MIN_MAX_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sizeRampTexture) ? SC_USE_UV_MIN_MAX_sizeRampTexture : false;
constant bool SC_USE_UV_MIN_MAX_trailColorRampTex [[function_constant(73)]];
constant bool SC_USE_UV_MIN_MAX_trailColorRampTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_trailColorRampTex) ? SC_USE_UV_MIN_MAX_trailColorRampTex : false;
constant bool SC_USE_UV_MIN_MAX_trailSizeRampTex [[function_constant(74)]];
constant bool SC_USE_UV_MIN_MAX_trailSizeRampTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_trailSizeRampTex) ? SC_USE_UV_MIN_MAX_trailSizeRampTex : false;
constant bool SC_USE_UV_MIN_MAX_trailTex [[function_constant(75)]];
constant bool SC_USE_UV_MIN_MAX_trailTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_trailTex) ? SC_USE_UV_MIN_MAX_trailTex : false;
constant bool SC_USE_UV_MIN_MAX_velRampTexture [[function_constant(76)]];
constant bool SC_USE_UV_MIN_MAX_velRampTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_velRampTexture) ? SC_USE_UV_MIN_MAX_velRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_colorRampTexture [[function_constant(77)]];
constant bool SC_USE_UV_TRANSFORM_colorRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_colorRampTexture) ? SC_USE_UV_TRANSFORM_colorRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(78)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_mainTexture [[function_constant(79)]];
constant bool SC_USE_UV_TRANSFORM_mainTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_mainTexture) ? SC_USE_UV_TRANSFORM_mainTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(80)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(81)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_sizeRampTexture [[function_constant(82)]];
constant bool SC_USE_UV_TRANSFORM_sizeRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sizeRampTexture) ? SC_USE_UV_TRANSFORM_sizeRampTexture : false;
constant bool SC_USE_UV_TRANSFORM_trailColorRampTex [[function_constant(83)]];
constant bool SC_USE_UV_TRANSFORM_trailColorRampTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_trailColorRampTex) ? SC_USE_UV_TRANSFORM_trailColorRampTex : false;
constant bool SC_USE_UV_TRANSFORM_trailSizeRampTex [[function_constant(84)]];
constant bool SC_USE_UV_TRANSFORM_trailSizeRampTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_trailSizeRampTex) ? SC_USE_UV_TRANSFORM_trailSizeRampTex : false;
constant bool SC_USE_UV_TRANSFORM_trailTex [[function_constant(85)]];
constant bool SC_USE_UV_TRANSFORM_trailTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_trailTex) ? SC_USE_UV_TRANSFORM_trailTex : false;
constant bool SC_USE_UV_TRANSFORM_velRampTexture [[function_constant(86)]];
constant bool SC_USE_UV_TRANSFORM_velRampTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_velRampTexture) ? SC_USE_UV_TRANSFORM_velRampTexture : false;
constant bool SIZEMINMAX [[function_constant(87)]];
constant bool SIZEMINMAX_tmp = is_function_constant_defined(SIZEMINMAX) ? SIZEMINMAX : false;
constant bool SIZERAMP [[function_constant(88)]];
constant bool SIZERAMP_tmp = is_function_constant_defined(SIZERAMP) ? SIZERAMP : false;
constant bool SNOISE [[function_constant(89)]];
constant bool SNOISE_tmp = is_function_constant_defined(SNOISE) ? SNOISE : false;
constant bool SPHERESPAWN [[function_constant(90)]];
constant bool SPHERESPAWN_tmp = is_function_constant_defined(SPHERESPAWN) ? SPHERESPAWN : false;
constant bool TRAILCOLORRAMP [[function_constant(91)]];
constant bool TRAILCOLORRAMP_tmp = is_function_constant_defined(TRAILCOLORRAMP) ? TRAILCOLORRAMP : false;
constant bool TRAILSIZERAMPSTARTENDASBOUNDS [[function_constant(92)]];
constant bool TRAILSIZERAMPSTARTENDASBOUNDS_tmp = is_function_constant_defined(TRAILSIZERAMPSTARTENDASBOUNDS) ? TRAILSIZERAMPSTARTENDASBOUNDS : false;
constant bool TRAILSIZERAMP [[function_constant(93)]];
constant bool TRAILSIZERAMP_tmp = is_function_constant_defined(TRAILSIZERAMP) ? TRAILSIZERAMP : false;
constant bool TRAILS [[function_constant(94)]];
constant bool TRAILS_tmp = is_function_constant_defined(TRAILS) ? TRAILS : false;
constant bool TRAILTEXTURE [[function_constant(95)]];
constant bool TRAILTEXTURE_tmp = is_function_constant_defined(TRAILTEXTURE) ? TRAILTEXTURE : false;
constant bool TRAILTWIST [[function_constant(96)]];
constant bool TRAILTWIST_tmp = is_function_constant_defined(TRAILTWIST) ? TRAILTWIST : false;
constant bool UseViewSpaceDepthVariant [[function_constant(97)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool VELOCITYDIR [[function_constant(98)]];
constant bool VELOCITYDIR_tmp = is_function_constant_defined(VELOCITYDIR) ? VELOCITYDIR : false;
constant bool VELRAMP [[function_constant(99)]];
constant bool VELRAMP_tmp = is_function_constant_defined(VELRAMP) ? VELRAMP : false;
constant bool WORLDPOSSEED [[function_constant(100)]];
constant bool WORLDPOSSEED_tmp = is_function_constant_defined(WORLDPOSSEED) ? WORLDPOSSEED : false;
constant bool colorRampTextureHasSwappedViews [[function_constant(101)]];
constant bool colorRampTextureHasSwappedViews_tmp = is_function_constant_defined(colorRampTextureHasSwappedViews) ? colorRampTextureHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(102)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool mainTextureHasSwappedViews [[function_constant(103)]];
constant bool mainTextureHasSwappedViews_tmp = is_function_constant_defined(mainTextureHasSwappedViews) ? mainTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(104)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(105)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(106)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(107)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(108)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(109)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(110)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(111)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(112)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(113)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(114)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(115)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(116)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(117)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(118)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(119)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(120)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(121)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(122)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(123)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(124)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(125)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(126)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(127)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(128)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(129)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(130)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(131)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(132)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(133)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(134)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(135)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(136)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(137)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(138)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(139)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(140)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(141)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(142)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(143)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(144)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sizeRampTextureHasSwappedViews [[function_constant(145)]];
constant bool sizeRampTextureHasSwappedViews_tmp = is_function_constant_defined(sizeRampTextureHasSwappedViews) ? sizeRampTextureHasSwappedViews : false;
constant bool trailColorRampTexHasSwappedViews [[function_constant(146)]];
constant bool trailColorRampTexHasSwappedViews_tmp = is_function_constant_defined(trailColorRampTexHasSwappedViews) ? trailColorRampTexHasSwappedViews : false;
constant bool trailSizeRampTexHasSwappedViews [[function_constant(147)]];
constant bool trailSizeRampTexHasSwappedViews_tmp = is_function_constant_defined(trailSizeRampTexHasSwappedViews) ? trailSizeRampTexHasSwappedViews : false;
constant bool trailTexHasSwappedViews [[function_constant(148)]];
constant bool trailTexHasSwappedViews_tmp = is_function_constant_defined(trailTexHasSwappedViews) ? trailTexHasSwappedViews : false;
constant bool velRampTextureHasSwappedViews [[function_constant(149)]];
constant bool velRampTextureHasSwappedViews_tmp = is_function_constant_defined(velRampTextureHasSwappedViews) ? velRampTextureHasSwappedViews : false;
constant int MESHTYPE [[function_constant(150)]];
constant int MESHTYPE_tmp = is_function_constant_defined(MESHTYPE) ? MESHTYPE : 0;
constant int SC_DEVICE_CLASS [[function_constant(151)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture [[function_constant(152)]];
constant int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_colorRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(153)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_mainTexture [[function_constant(154)]];
constant int SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_mainTexture) ? SC_SOFTWARE_WRAP_MODE_U_mainTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(155)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(156)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture [[function_constant(157)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex [[function_constant(158)]];
constant int SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex) ? SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_trailSizeRampTex [[function_constant(159)]];
constant int SC_SOFTWARE_WRAP_MODE_U_trailSizeRampTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_trailSizeRampTex) ? SC_SOFTWARE_WRAP_MODE_U_trailSizeRampTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_trailTex [[function_constant(160)]];
constant int SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_trailTex) ? SC_SOFTWARE_WRAP_MODE_U_trailTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_velRampTexture [[function_constant(161)]];
constant int SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_velRampTexture) ? SC_SOFTWARE_WRAP_MODE_U_velRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture [[function_constant(162)]];
constant int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_colorRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_colorRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(163)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_mainTexture [[function_constant(164)]];
constant int SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_mainTexture) ? SC_SOFTWARE_WRAP_MODE_V_mainTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(165)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(166)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture [[function_constant(167)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex [[function_constant(168)]];
constant int SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex) ? SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_trailSizeRampTex [[function_constant(169)]];
constant int SC_SOFTWARE_WRAP_MODE_V_trailSizeRampTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_trailSizeRampTex) ? SC_SOFTWARE_WRAP_MODE_V_trailSizeRampTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_trailTex [[function_constant(170)]];
constant int SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_trailTex) ? SC_SOFTWARE_WRAP_MODE_V_trailTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_velRampTexture [[function_constant(171)]];
constant int SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_velRampTexture) ? SC_SOFTWARE_WRAP_MODE_V_velRampTexture : -1;
constant int TRAILBEHAVIOR [[function_constant(172)]];
constant int TRAILBEHAVIOR_tmp = is_function_constant_defined(TRAILBEHAVIOR) ? TRAILBEHAVIOR : 0;
constant int colorRampTextureLayout [[function_constant(173)]];
constant int colorRampTextureLayout_tmp = is_function_constant_defined(colorRampTextureLayout) ? colorRampTextureLayout : 0;
constant int intensityTextureLayout [[function_constant(174)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int mainTextureLayout [[function_constant(175)]];
constant int mainTextureLayout_tmp = is_function_constant_defined(mainTextureLayout) ? mainTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(176)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(177)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int rotationSpace [[function_constant(178)]];
constant int rotationSpace_tmp = is_function_constant_defined(rotationSpace) ? rotationSpace : 0;
constant int sc_AmbientLightMode0 [[function_constant(179)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(180)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(181)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(182)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(183)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(184)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(185)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(186)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(187)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(188)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(189)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(190)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(191)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(192)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(193)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(194)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(195)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(196)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(197)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(198)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(199)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(200)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(201)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(202)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(203)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(204)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int sizeRampTextureLayout [[function_constant(205)]];
constant int sizeRampTextureLayout_tmp = is_function_constant_defined(sizeRampTextureLayout) ? sizeRampTextureLayout : 0;
constant int trailColorRampTexLayout [[function_constant(206)]];
constant int trailColorRampTexLayout_tmp = is_function_constant_defined(trailColorRampTexLayout) ? trailColorRampTexLayout : 0;
constant int trailSizeRampTexLayout [[function_constant(207)]];
constant int trailSizeRampTexLayout_tmp = is_function_constant_defined(trailSizeRampTexLayout) ? trailSizeRampTexLayout : 0;
constant int trailTexLayout [[function_constant(208)]];
constant int trailTexLayout_tmp = is_function_constant_defined(trailTexLayout) ? trailTexLayout : 0;
constant int velRampTextureLayout [[function_constant(209)]];
constant int velRampTextureLayout_tmp = is_function_constant_defined(velRampTextureLayout) ? velRampTextureLayout : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float4 VertexColor;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_WorldSpace;
float3 VertexNormal_ObjectSpace;
float gInstanceID;
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
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float trailLength;
float2 trailTaper;
float trailWidth;
float4 trailSizeRampTexSize;
float4 trailSizeRampTexDims;
float4 trailSizeRampTexView;
float3x3 trailSizeRampTexTransform;
float4 trailSizeRampTexUvMinMax;
float4 trailSizeRampTexBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float2 sizeStart;
float3 sizeStart3D;
float2 sizeEnd;
float3 sizeEnd3D;
float2 sizeStartMin;
float3 sizeStartMin3D;
float2 sizeStartMax;
float3 sizeStartMax3D;
float2 sizeEndMin;
float3 sizeEndMin3D;
float2 sizeEndMax;
float3 sizeEndMax3D;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandomX;
float2 rotationRateX;
float2 randomRotationY;
float2 rotationRateY;
float2 rotationRandom;
float2 randomRotationZ;
float2 rotationRate;
float2 rotationRateZ;
float rotationDrag;
int CENTER_BBOX;
float fadeDistanceVisible;
float fadeDistanceInvisible;
float4 trailTexSize;
float4 trailTexDims;
float4 trailTexView;
float3x3 trailTexTransform;
float4 trailTexUvMinMax;
float4 trailTexBorderColor;
float4 trailColorRampTexSize;
float4 trailColorRampTexDims;
float4 trailColorRampTexView;
float3x3 trailColorRampTexTransform;
float4 trailColorRampTexUvMinMax;
float4 trailColorRampTexBorderColor;
float2 trailFadeStartEnd;
float2 trailFadeInOut;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float alphaDissolveMult;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float Port_Input1_N119;
float2 Port_Input1_N138;
float2 Port_Input1_N139;
float2 Port_Input1_N140;
float2 Port_Input1_N144;
float Port_Input1_N069;
float Port_Input1_N068;
float Port_Input1_N110;
float Port_Input1_N154;
float Port_Input1_N216;
float3 Port_Default_N182;
float3 Port_Emissive_N014;
float3 Port_AO_N014;
float3 Port_SpecularAO_N014;
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
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> materialParamsTex [[id(4)]];
texture2d<float> normalTex [[id(5)]];
texture2d<float> sc_EnvmapDiffuse [[id(6)]];
texture2d<float> sc_EnvmapSpecular [[id(7)]];
texture2d<float> sc_RayTracedAoTexture [[id(16)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(17)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(18)]];
texture2d<float> sc_RayTracedShadowTexture [[id(19)]];
texture2d<float> sc_SSAOTexture [[id(20)]];
texture2d<float> sc_ScreenTexture [[id(21)]];
texture2d<float> sc_ShadowTexture [[id(22)]];
texture2d<float> sizeRampTexture [[id(24)]];
texture2d<float> trailColorRampTex [[id(25)]];
texture2d<float> trailSizeRampTex [[id(26)]];
texture2d<float> trailTex [[id(27)]];
texture2d<float> velRampTexture [[id(28)]];
sampler colorRampTextureSmpSC [[id(29)]];
sampler intensityTextureSmpSC [[id(30)]];
sampler mainTextureSmpSC [[id(31)]];
sampler materialParamsTexSmpSC [[id(32)]];
sampler normalTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(39)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
sampler sizeRampTextureSmpSC [[id(45)]];
sampler trailColorRampTexSmpSC [[id(46)]];
sampler trailSizeRampTexSmpSC [[id(47)]];
sampler trailTexSmpSC [[id(48)]];
sampler velRampTextureSmpSC [[id(49)]];
constant userUniformsObj* UserUniforms [[id(50)]];
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
float Interpolator_gInstanceID [[user(locn13)]];
float4 Interpolator0 [[user(locn14)]];
float4 Interpolator1 [[user(locn15)]];
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
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float2 N111_pSize(thread const float& random1,thread const float& random2,thread const float& timeIn,thread const float& N111_sizeSpeed,thread bool& N111_isTrail,thread bool& N111_ENABLE_TRAILS,thread float2& N111_trailHeadTime,thread bool& N111_ENABLE_INDEPENDENTTRAIL,thread float& N111_trailSizeMult,thread bool& N111_ENABLE_TRAILSIZERAMP,thread bool& N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS,thread float3& N111_sizeStart,thread float3& N111_sizeEnd,thread bool& N111_ENABLE_SIZEMINMAX,thread float3& N111_sizeStartMin,thread float3& N111_sizeStartMax,thread float3& N111_sizeEndMin,thread float3& N111_sizeEndMax,thread bool& N111_ENABLE_SIZERAMP,thread bool& N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,thread uint& gl_InstanceIndex,constant userUniformsObj& UserUniforms,thread texture2d<float> trailSizeRampTex,thread sampler trailSizeRampTexSmpSC,thread texture2d<float> sizeRampTexture,thread sampler sizeRampTextureSmpSC,thread ssGlobals& tempGlobals)
{
float2 psizeStart=float2(0.0);
float2 psizeEnd=float2(0.0);
float normTime=timeIn;
if (N111_ENABLE_TRAILS)
{
if (!N111_ENABLE_INDEPENDENTTRAIL)
{
normTime=N111_trailHeadTime.y;
}
}
float param=normTime;
float param_1=N111_sizeSpeed;
float l9_0;
if (param<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(param,param_1);
}
float l9_1=l9_0;
float sizePow=l9_1;
if (N111_ENABLE_SIZEMINMAX)
{
psizeStart=mix(N111_sizeStartMin.xy,N111_sizeStartMax.xy,float2(random1));
psizeEnd=mix(N111_sizeEndMin.xy,N111_sizeEndMax.xy,float2(random2));
}
else
{
psizeStart=N111_sizeStart.xy;
psizeEnd=N111_sizeEnd.xy;
}
float2 sizeLife=mix(psizeStart,psizeEnd,float2(sizePow));
if (!(SC_DEVICE_CLASS_tmp>=2))
{
return sizeLife;
}
if (N111_ENABLE_SIZERAMP)
{
float sizeRampPanning=ceil(normTime*10000.0)/10000.0;
float2 l9_2=tempGlobals.Surface_UVCoord0;
float2 sizeRampUV=(l9_2/float2(10000.0,1.0))+float2(sizeRampPanning,0.0);
float2 param_2=sizeRampUV;
float4 l9_3=float4(0.0);
int l9_4=0;
if ((int(sizeRampTextureHasSwappedViews_tmp)!=0))
{
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=gl_InstanceIndex%2;
}
int l9_6=l9_5;
l9_4=1-l9_6;
}
else
{
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=gl_InstanceIndex%2;
}
int l9_8=l9_7;
l9_4=l9_8;
}
int l9_9=l9_4;
int l9_10=sizeRampTextureLayout_tmp;
int l9_11=l9_9;
float2 l9_12=param_2;
bool l9_13=(int(SC_USE_UV_TRANSFORM_sizeRampTexture_tmp)!=0);
float3x3 l9_14=UserUniforms.sizeRampTextureTransform;
int2 l9_15=int2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp);
bool l9_16=(int(SC_USE_UV_MIN_MAX_sizeRampTexture_tmp)!=0);
float4 l9_17=UserUniforms.sizeRampTextureUvMinMax;
bool l9_18=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp)!=0);
float4 l9_19=UserUniforms.sizeRampTextureBorderColor;
float l9_20=0.0;
bool l9_21=l9_18&&(!l9_16);
float l9_22=1.0;
float l9_23=l9_12.x;
int l9_24=l9_15.x;
if (l9_24==1)
{
l9_23=fract(l9_23);
}
else
{
if (l9_24==2)
{
float l9_25=fract(l9_23);
float l9_26=l9_23-l9_25;
float l9_27=step(0.25,fract(l9_26*0.5));
l9_23=mix(l9_25,1.0-l9_25,fast::clamp(l9_27,0.0,1.0));
}
}
l9_12.x=l9_23;
float l9_28=l9_12.y;
int l9_29=l9_15.y;
if (l9_29==1)
{
l9_28=fract(l9_28);
}
else
{
if (l9_29==2)
{
float l9_30=fract(l9_28);
float l9_31=l9_28-l9_30;
float l9_32=step(0.25,fract(l9_31*0.5));
l9_28=mix(l9_30,1.0-l9_30,fast::clamp(l9_32,0.0,1.0));
}
}
l9_12.y=l9_28;
if (l9_16)
{
bool l9_33=l9_18;
bool l9_34;
if (l9_33)
{
l9_34=l9_15.x==3;
}
else
{
l9_34=l9_33;
}
float l9_35=l9_12.x;
float l9_36=l9_17.x;
float l9_37=l9_17.z;
bool l9_38=l9_34;
float l9_39=l9_22;
float l9_40=fast::clamp(l9_35,l9_36,l9_37);
float l9_41=step(abs(l9_35-l9_40),9.9999997e-06);
l9_39*=(l9_41+((1.0-float(l9_38))*(1.0-l9_41)));
l9_35=l9_40;
l9_12.x=l9_35;
l9_22=l9_39;
bool l9_42=l9_18;
bool l9_43;
if (l9_42)
{
l9_43=l9_15.y==3;
}
else
{
l9_43=l9_42;
}
float l9_44=l9_12.y;
float l9_45=l9_17.y;
float l9_46=l9_17.w;
bool l9_47=l9_43;
float l9_48=l9_22;
float l9_49=fast::clamp(l9_44,l9_45,l9_46);
float l9_50=step(abs(l9_44-l9_49),9.9999997e-06);
l9_48*=(l9_50+((1.0-float(l9_47))*(1.0-l9_50)));
l9_44=l9_49;
l9_12.y=l9_44;
l9_22=l9_48;
}
float2 l9_51=l9_12;
bool l9_52=l9_13;
float3x3 l9_53=l9_14;
if (l9_52)
{
l9_51=float2((l9_53*float3(l9_51,1.0)).xy);
}
float2 l9_54=l9_51;
float2 l9_55=l9_54;
float2 l9_56=l9_55;
l9_12=l9_56;
float l9_57=l9_12.x;
int l9_58=l9_15.x;
bool l9_59=l9_21;
float l9_60=l9_22;
if ((l9_58==0)||(l9_58==3))
{
float l9_61=l9_57;
float l9_62=0.0;
float l9_63=1.0;
bool l9_64=l9_59;
float l9_65=l9_60;
float l9_66=fast::clamp(l9_61,l9_62,l9_63);
float l9_67=step(abs(l9_61-l9_66),9.9999997e-06);
l9_65*=(l9_67+((1.0-float(l9_64))*(1.0-l9_67)));
l9_61=l9_66;
l9_57=l9_61;
l9_60=l9_65;
}
l9_12.x=l9_57;
l9_22=l9_60;
float l9_68=l9_12.y;
int l9_69=l9_15.y;
bool l9_70=l9_21;
float l9_71=l9_22;
if ((l9_69==0)||(l9_69==3))
{
float l9_72=l9_68;
float l9_73=0.0;
float l9_74=1.0;
bool l9_75=l9_70;
float l9_76=l9_71;
float l9_77=fast::clamp(l9_72,l9_73,l9_74);
float l9_78=step(abs(l9_72-l9_77),9.9999997e-06);
l9_76*=(l9_78+((1.0-float(l9_75))*(1.0-l9_78)));
l9_72=l9_77;
l9_68=l9_72;
l9_71=l9_76;
}
l9_12.y=l9_68;
l9_22=l9_71;
float2 l9_79=l9_12;
int l9_80=l9_10;
int l9_81=l9_11;
float l9_82=l9_20;
float2 l9_83=l9_79;
int l9_84=l9_80;
int l9_85=l9_81;
float3 l9_86=float3(0.0);
if (l9_84==0)
{
l9_86=float3(l9_83,0.0);
}
else
{
if (l9_84==1)
{
l9_86=float3(l9_83.x,(l9_83.y*0.5)+(0.5-(float(l9_85)*0.5)),0.0);
}
else
{
l9_86=float3(l9_83,float(l9_85));
}
}
float3 l9_87=l9_86;
float3 l9_88=l9_87;
float2 l9_89=l9_88.xy;
float l9_90=l9_82;
float4 l9_91=sizeRampTexture.sample(sizeRampTextureSmpSC,l9_89,level(l9_90));
float4 l9_92=l9_91;
float4 l9_93=l9_92;
if (l9_18)
{
l9_93=mix(l9_19,l9_93,float4(l9_22));
}
float4 l9_94=l9_93;
l9_3=l9_94;
float4 l9_95=l9_3;
float2 sizeRampTex=l9_95.xy;
sizeLife=sizeRampTex*psizeStart;
if (N111_ENABLE_SIZERAMPSTARTENDASBOUNDS)
{
sizeLife=mix(psizeStart,psizeEnd,sizeRampTex);
}
}
if (N111_ENABLE_TRAILS)
{
if (N111_isTrail)
{
if (N111_ENABLE_TRAILSIZERAMP)
{
normTime=timeIn;
float sizeRampPanning_1=ceil(normTime*10000.0)/10000.0;
float2 l9_96=tempGlobals.Surface_UVCoord0;
float2 sizeRampUV_1=(l9_96/float2(10000.0,1.0))+float2(sizeRampPanning_1,0.0);
float2 param_3=sizeRampUV_1;
float4 l9_97=float4(0.0);
int l9_98=0;
if ((int(trailSizeRampTexHasSwappedViews_tmp)!=0))
{
int l9_99=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_99=0;
}
else
{
l9_99=gl_InstanceIndex%2;
}
int l9_100=l9_99;
l9_98=1-l9_100;
}
else
{
int l9_101=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_101=0;
}
else
{
l9_101=gl_InstanceIndex%2;
}
int l9_102=l9_101;
l9_98=l9_102;
}
int l9_103=l9_98;
int l9_104=trailSizeRampTexLayout_tmp;
int l9_105=l9_103;
float2 l9_106=param_3;
bool l9_107=(int(SC_USE_UV_TRANSFORM_trailSizeRampTex_tmp)!=0);
float3x3 l9_108=UserUniforms.trailSizeRampTexTransform;
int2 l9_109=int2(SC_SOFTWARE_WRAP_MODE_U_trailSizeRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailSizeRampTex_tmp);
bool l9_110=(int(SC_USE_UV_MIN_MAX_trailSizeRampTex_tmp)!=0);
float4 l9_111=UserUniforms.trailSizeRampTexUvMinMax;
bool l9_112=(int(SC_USE_CLAMP_TO_BORDER_trailSizeRampTex_tmp)!=0);
float4 l9_113=UserUniforms.trailSizeRampTexBorderColor;
float l9_114=0.0;
bool l9_115=l9_112&&(!l9_110);
float l9_116=1.0;
float l9_117=l9_106.x;
int l9_118=l9_109.x;
if (l9_118==1)
{
l9_117=fract(l9_117);
}
else
{
if (l9_118==2)
{
float l9_119=fract(l9_117);
float l9_120=l9_117-l9_119;
float l9_121=step(0.25,fract(l9_120*0.5));
l9_117=mix(l9_119,1.0-l9_119,fast::clamp(l9_121,0.0,1.0));
}
}
l9_106.x=l9_117;
float l9_122=l9_106.y;
int l9_123=l9_109.y;
if (l9_123==1)
{
l9_122=fract(l9_122);
}
else
{
if (l9_123==2)
{
float l9_124=fract(l9_122);
float l9_125=l9_122-l9_124;
float l9_126=step(0.25,fract(l9_125*0.5));
l9_122=mix(l9_124,1.0-l9_124,fast::clamp(l9_126,0.0,1.0));
}
}
l9_106.y=l9_122;
if (l9_110)
{
bool l9_127=l9_112;
bool l9_128;
if (l9_127)
{
l9_128=l9_109.x==3;
}
else
{
l9_128=l9_127;
}
float l9_129=l9_106.x;
float l9_130=l9_111.x;
float l9_131=l9_111.z;
bool l9_132=l9_128;
float l9_133=l9_116;
float l9_134=fast::clamp(l9_129,l9_130,l9_131);
float l9_135=step(abs(l9_129-l9_134),9.9999997e-06);
l9_133*=(l9_135+((1.0-float(l9_132))*(1.0-l9_135)));
l9_129=l9_134;
l9_106.x=l9_129;
l9_116=l9_133;
bool l9_136=l9_112;
bool l9_137;
if (l9_136)
{
l9_137=l9_109.y==3;
}
else
{
l9_137=l9_136;
}
float l9_138=l9_106.y;
float l9_139=l9_111.y;
float l9_140=l9_111.w;
bool l9_141=l9_137;
float l9_142=l9_116;
float l9_143=fast::clamp(l9_138,l9_139,l9_140);
float l9_144=step(abs(l9_138-l9_143),9.9999997e-06);
l9_142*=(l9_144+((1.0-float(l9_141))*(1.0-l9_144)));
l9_138=l9_143;
l9_106.y=l9_138;
l9_116=l9_142;
}
float2 l9_145=l9_106;
bool l9_146=l9_107;
float3x3 l9_147=l9_108;
if (l9_146)
{
l9_145=float2((l9_147*float3(l9_145,1.0)).xy);
}
float2 l9_148=l9_145;
float2 l9_149=l9_148;
float2 l9_150=l9_149;
l9_106=l9_150;
float l9_151=l9_106.x;
int l9_152=l9_109.x;
bool l9_153=l9_115;
float l9_154=l9_116;
if ((l9_152==0)||(l9_152==3))
{
float l9_155=l9_151;
float l9_156=0.0;
float l9_157=1.0;
bool l9_158=l9_153;
float l9_159=l9_154;
float l9_160=fast::clamp(l9_155,l9_156,l9_157);
float l9_161=step(abs(l9_155-l9_160),9.9999997e-06);
l9_159*=(l9_161+((1.0-float(l9_158))*(1.0-l9_161)));
l9_155=l9_160;
l9_151=l9_155;
l9_154=l9_159;
}
l9_106.x=l9_151;
l9_116=l9_154;
float l9_162=l9_106.y;
int l9_163=l9_109.y;
bool l9_164=l9_115;
float l9_165=l9_116;
if ((l9_163==0)||(l9_163==3))
{
float l9_166=l9_162;
float l9_167=0.0;
float l9_168=1.0;
bool l9_169=l9_164;
float l9_170=l9_165;
float l9_171=fast::clamp(l9_166,l9_167,l9_168);
float l9_172=step(abs(l9_166-l9_171),9.9999997e-06);
l9_170*=(l9_172+((1.0-float(l9_169))*(1.0-l9_172)));
l9_166=l9_171;
l9_162=l9_166;
l9_165=l9_170;
}
l9_106.y=l9_162;
l9_116=l9_165;
float2 l9_173=l9_106;
int l9_174=l9_104;
int l9_175=l9_105;
float l9_176=l9_114;
float2 l9_177=l9_173;
int l9_178=l9_174;
int l9_179=l9_175;
float3 l9_180=float3(0.0);
if (l9_178==0)
{
l9_180=float3(l9_177,0.0);
}
else
{
if (l9_178==1)
{
l9_180=float3(l9_177.x,(l9_177.y*0.5)+(0.5-(float(l9_179)*0.5)),0.0);
}
else
{
l9_180=float3(l9_177,float(l9_179));
}
}
float3 l9_181=l9_180;
float3 l9_182=l9_181;
float2 l9_183=l9_182.xy;
float l9_184=l9_176;
float4 l9_185=trailSizeRampTex.sample(trailSizeRampTexSmpSC,l9_183,level(l9_184));
float4 l9_186=l9_185;
float4 l9_187=l9_186;
if (l9_112)
{
l9_187=mix(l9_113,l9_187,float4(l9_116));
}
float4 l9_188=l9_187;
l9_97=l9_188;
float4 l9_189=l9_97;
float sizeRampTex_1=l9_189.x;
sizeLife.x=sizeRampTex_1*psizeStart.x;
if (N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS)
{
sizeLife.x=mix(psizeStart.x,psizeEnd.x,sizeRampTex_1);
}
}
sizeLife.x*=N111_trailSizeMult;
sizeLife.y=0.0;
}
}
return sizeLife;
}
float3 N111_pSize3D(thread const float& random1,thread const float& random2,thread const float& normTime,thread const float& N111_sizeSpeed,thread float3& N111_sizeStart,thread float3& N111_sizeEnd,thread bool& N111_ENABLE_SIZEMINMAX,thread float3& N111_sizeStartMin,thread float3& N111_sizeStartMax,thread float3& N111_sizeEndMin,thread float3& N111_sizeEndMax,thread bool& N111_ENABLE_SIZERAMP,thread bool& N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,thread uint& gl_InstanceIndex,constant userUniformsObj& UserUniforms,thread texture2d<float> sizeRampTexture,thread sampler sizeRampTextureSmpSC,thread ssGlobals& tempGlobals)
{
float3 psizeStart=float3(0.0);
float3 psizeEnd=float3(0.0);
float param=normTime;
float param_1=N111_sizeSpeed;
float l9_0;
if (param<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(param,param_1);
}
float l9_1=l9_0;
float sizePow=l9_1;
if (N111_ENABLE_SIZEMINMAX)
{
psizeStart=mix(N111_sizeStartMin,N111_sizeStartMax,float3(random1));
psizeEnd=mix(N111_sizeEndMin,N111_sizeEndMax,float3(random2));
}
else
{
psizeStart=N111_sizeStart;
psizeEnd=N111_sizeEnd;
}
float3 sizeLife=mix(psizeStart,psizeEnd,float3(sizePow));
if (!(SC_DEVICE_CLASS_tmp>=2))
{
return sizeLife;
}
if (N111_ENABLE_SIZERAMP)
{
float sizeRampPanning=ceil(normTime*10000.0)/10000.0;
float2 l9_2=tempGlobals.Surface_UVCoord0;
float2 sizeRampUV=(l9_2/float2(10000.0,1.0))+float2(sizeRampPanning,0.0);
float2 param_2=sizeRampUV;
float4 l9_3=float4(0.0);
int l9_4=0;
if ((int(sizeRampTextureHasSwappedViews_tmp)!=0))
{
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=gl_InstanceIndex%2;
}
int l9_6=l9_5;
l9_4=1-l9_6;
}
else
{
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=gl_InstanceIndex%2;
}
int l9_8=l9_7;
l9_4=l9_8;
}
int l9_9=l9_4;
int l9_10=sizeRampTextureLayout_tmp;
int l9_11=l9_9;
float2 l9_12=param_2;
bool l9_13=(int(SC_USE_UV_TRANSFORM_sizeRampTexture_tmp)!=0);
float3x3 l9_14=UserUniforms.sizeRampTextureTransform;
int2 l9_15=int2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture_tmp);
bool l9_16=(int(SC_USE_UV_MIN_MAX_sizeRampTexture_tmp)!=0);
float4 l9_17=UserUniforms.sizeRampTextureUvMinMax;
bool l9_18=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture_tmp)!=0);
float4 l9_19=UserUniforms.sizeRampTextureBorderColor;
float l9_20=0.0;
bool l9_21=l9_18&&(!l9_16);
float l9_22=1.0;
float l9_23=l9_12.x;
int l9_24=l9_15.x;
if (l9_24==1)
{
l9_23=fract(l9_23);
}
else
{
if (l9_24==2)
{
float l9_25=fract(l9_23);
float l9_26=l9_23-l9_25;
float l9_27=step(0.25,fract(l9_26*0.5));
l9_23=mix(l9_25,1.0-l9_25,fast::clamp(l9_27,0.0,1.0));
}
}
l9_12.x=l9_23;
float l9_28=l9_12.y;
int l9_29=l9_15.y;
if (l9_29==1)
{
l9_28=fract(l9_28);
}
else
{
if (l9_29==2)
{
float l9_30=fract(l9_28);
float l9_31=l9_28-l9_30;
float l9_32=step(0.25,fract(l9_31*0.5));
l9_28=mix(l9_30,1.0-l9_30,fast::clamp(l9_32,0.0,1.0));
}
}
l9_12.y=l9_28;
if (l9_16)
{
bool l9_33=l9_18;
bool l9_34;
if (l9_33)
{
l9_34=l9_15.x==3;
}
else
{
l9_34=l9_33;
}
float l9_35=l9_12.x;
float l9_36=l9_17.x;
float l9_37=l9_17.z;
bool l9_38=l9_34;
float l9_39=l9_22;
float l9_40=fast::clamp(l9_35,l9_36,l9_37);
float l9_41=step(abs(l9_35-l9_40),9.9999997e-06);
l9_39*=(l9_41+((1.0-float(l9_38))*(1.0-l9_41)));
l9_35=l9_40;
l9_12.x=l9_35;
l9_22=l9_39;
bool l9_42=l9_18;
bool l9_43;
if (l9_42)
{
l9_43=l9_15.y==3;
}
else
{
l9_43=l9_42;
}
float l9_44=l9_12.y;
float l9_45=l9_17.y;
float l9_46=l9_17.w;
bool l9_47=l9_43;
float l9_48=l9_22;
float l9_49=fast::clamp(l9_44,l9_45,l9_46);
float l9_50=step(abs(l9_44-l9_49),9.9999997e-06);
l9_48*=(l9_50+((1.0-float(l9_47))*(1.0-l9_50)));
l9_44=l9_49;
l9_12.y=l9_44;
l9_22=l9_48;
}
float2 l9_51=l9_12;
bool l9_52=l9_13;
float3x3 l9_53=l9_14;
if (l9_52)
{
l9_51=float2((l9_53*float3(l9_51,1.0)).xy);
}
float2 l9_54=l9_51;
float2 l9_55=l9_54;
float2 l9_56=l9_55;
l9_12=l9_56;
float l9_57=l9_12.x;
int l9_58=l9_15.x;
bool l9_59=l9_21;
float l9_60=l9_22;
if ((l9_58==0)||(l9_58==3))
{
float l9_61=l9_57;
float l9_62=0.0;
float l9_63=1.0;
bool l9_64=l9_59;
float l9_65=l9_60;
float l9_66=fast::clamp(l9_61,l9_62,l9_63);
float l9_67=step(abs(l9_61-l9_66),9.9999997e-06);
l9_65*=(l9_67+((1.0-float(l9_64))*(1.0-l9_67)));
l9_61=l9_66;
l9_57=l9_61;
l9_60=l9_65;
}
l9_12.x=l9_57;
l9_22=l9_60;
float l9_68=l9_12.y;
int l9_69=l9_15.y;
bool l9_70=l9_21;
float l9_71=l9_22;
if ((l9_69==0)||(l9_69==3))
{
float l9_72=l9_68;
float l9_73=0.0;
float l9_74=1.0;
bool l9_75=l9_70;
float l9_76=l9_71;
float l9_77=fast::clamp(l9_72,l9_73,l9_74);
float l9_78=step(abs(l9_72-l9_77),9.9999997e-06);
l9_76*=(l9_78+((1.0-float(l9_75))*(1.0-l9_78)));
l9_72=l9_77;
l9_68=l9_72;
l9_71=l9_76;
}
l9_12.y=l9_68;
l9_22=l9_71;
float2 l9_79=l9_12;
int l9_80=l9_10;
int l9_81=l9_11;
float l9_82=l9_20;
float2 l9_83=l9_79;
int l9_84=l9_80;
int l9_85=l9_81;
float3 l9_86=float3(0.0);
if (l9_84==0)
{
l9_86=float3(l9_83,0.0);
}
else
{
if (l9_84==1)
{
l9_86=float3(l9_83.x,(l9_83.y*0.5)+(0.5-(float(l9_85)*0.5)),0.0);
}
else
{
l9_86=float3(l9_83,float(l9_85));
}
}
float3 l9_87=l9_86;
float3 l9_88=l9_87;
float2 l9_89=l9_88.xy;
float l9_90=l9_82;
float4 l9_91=sizeRampTexture.sample(sizeRampTextureSmpSC,l9_89,level(l9_90));
float4 l9_92=l9_91;
float4 l9_93=l9_92;
if (l9_18)
{
l9_93=mix(l9_19,l9_93,float4(l9_22));
}
float4 l9_94=l9_93;
l9_3=l9_94;
float4 l9_95=l9_3;
float3 sizeRampTex=l9_95.xyz;
sizeLife=sizeRampTex*psizeStart;
if (N111_ENABLE_SIZERAMPSTARTENDASBOUNDS)
{
sizeLife=mix(psizeStart,psizeEnd,sizeRampTex);
}
}
return sizeLife;
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool N111_isTrail=false;
bool N111_ENABLE_ALIGNTOX=false;
bool N111_ENABLE_ALIGNTOY=false;
bool N111_ENABLE_ALIGNTOZ=false;
bool N111_ENABLE_CENTER_IN_BBOX=false;
bool N111_MESHTYPE_QUAD=false;
float3 N111_particleSeedIn=float3(0.0);
float N111_globalSeedIn=0.0;
float N111_particleAlive=0.0;
float4 N111_timeValuesIn=float4(0.0);
bool N111_ENABLE_TRAILS=false;
float2 N111_trailHeadTime=float2(0.0);
bool N111_ENABLE_INDEPENDENTTRAIL=false;
float2 N111_taper=float2(0.0);
bool N111_ENABLE_TRAILSPIN=false;
float N111_trailSizeMult=0.0;
bool N111_ENABLE_TRAILSIZERAMP=false;
bool N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS=false;
float3 N111_positionObjectSpace=float3(0.0);
float3 N111_normalObjectSpace=float3(0.0);
bool N111_ENABLE_INILOCATION=false;
float3 N111_spawnLocation=float3(0.0);
bool N111_ENABLE_BOXSPAWN=false;
float3 N111_spawnBox=float3(0.0);
bool N111_ENABLE_SPHERESPAWN=false;
float3 N111_spawnSphere=float3(0.0);
bool N111_ENABLE_NOISE=false;
float3 N111_noiseMult=float3(0.0);
float3 N111_noiseFrequency=float3(0.0);
bool N111_ENABLE_SNOISE=false;
float3 N111_sNoiseMult=float3(0.0);
float3 N111_sNoiseFrequency=float3(0.0);
bool N111_ENABLE_VELRAMP=false;
float3 N111_velocityMin=float3(0.0);
float3 N111_velocityMax=float3(0.0);
float3 N111_velocityDrag=float3(0.0);
float3 N111_sizeStart=float3(0.0);
float3 N111_sizeEnd=float3(0.0);
bool N111_ENABLE_SIZEMINMAX=false;
float3 N111_sizeStartMin=float3(0.0);
float3 N111_sizeStartMax=float3(0.0);
float3 N111_sizeEndMin=float3(0.0);
float3 N111_sizeEndMax=float3(0.0);
float N111_sizeSpeed=0.0;
bool N111_ENABLE_SIZERAMP=false;
bool N111_ENABLE_SIZERAMPSTARTENDASBOUNDS=false;
float N111_gravity=0.0;
bool N111_ENABLE_FORCE=false;
float3 N111_localForce=float3(0.0);
bool N111_ENABLE_ALIGNQUADTOCAMERAUP=false;
bool N111_ENABLE_ALIGNTOVEL=false;
float N111_sizeVelScale=0.0;
bool N111_ENABLE_IGNOREVEL=false;
bool N111_ENABLE_IGNORETRANSFORMSCALE=false;
float2 N111_rotationRandomX=float2(0.0);
float2 N111_rotationRateX=float2(0.0);
float2 N111_rotationRandomY=float2(0.0);
float2 N111_rotationRateY=float2(0.0);
float2 N111_rotationRandomZ=float2(0.0);
float2 N111_rotationRateZ=float2(0.0);
float N111_rotationDrag=0.0;
bool N111_WORLDSPACE=false;
bool N111_WORLDFORCE=false;
bool N111_ENABLE_SCREENFADE=false;
float N111_fadeDistanceVisible=0.0;
float N111_fadeDistanceInvisible=0.0;
float3 N111_particleSeed=float3(0.0);
float N111_globalSeed=0.0;
float4 N111_timeValues=float4(0.0);
float4 N111_cameraFade_trailHeadTime_taper=float4(0.0);
float3 N111_position=float3(0.0);
float3 N111_normal=float3(0.0);
float N111_EPSILON=1e-06;
float N111_PI=3.1415927;
bool N181_isTrailCondition=false;
float N181_timeGlobal=0.0;
bool N181_ENABLE_EXTERNALTIME=false;
float N181_externalTime=0.0;
bool N181_ENABLE_WORLDPOSSEED=false;
float N181_externalSeed=0.0;
bool N181_ENABLE_LIFETIMEMINMAX=false;
float N181_lifeTimeConstant=0.0;
float2 N181_lifeTimeMinMax=float2(0.0);
bool N181_ENABLE_INSTANTSPAWN=false;
float N181_spawnDuration=0.0;
bool N181_ENABLE_TRAILS=false;
float N181_trailLength=0.0;
bool N181_ENABLE_INDEPENDENTTRAIL=false;
float3 N181_particleSeed=float3(0.0);
float N181_globalSeed=0.0;
float N181_particleAlive=0.0;
float4 N181_timeValues=float4(0.0);
float N181_isTrail=0.0;
float2 N181_trailHeadTime=float2(0.0);
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
ssGlobals tempGlobals;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set0.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set0.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set0.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set0.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set0.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set0.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=int(in.boneData.x);
int l9_56=int(in.boneData.y);
int l9_57=int(in.boneData.z);
int l9_58=int(in.boneData.w);
int l9_59=l9_55;
float4 l9_60=l9_51.position;
float3 l9_61=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_62=l9_59;
float4 l9_63=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[0];
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[1];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[2];
float4 l9_66[3];
l9_66[0]=l9_63;
l9_66[1]=l9_64;
l9_66[2]=l9_65;
l9_61=float3(dot(l9_60,l9_66[0]),dot(l9_60,l9_66[1]),dot(l9_60,l9_66[2]));
}
else
{
l9_61=l9_60.xyz;
}
float3 l9_67=l9_61;
float3 l9_68=l9_67;
float l9_69=l9_54.x;
int l9_70=l9_56;
float4 l9_71=l9_51.position;
float3 l9_72=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_73=l9_70;
float4 l9_74=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[0];
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[1];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[2];
float4 l9_77[3];
l9_77[0]=l9_74;
l9_77[1]=l9_75;
l9_77[2]=l9_76;
l9_72=float3(dot(l9_71,l9_77[0]),dot(l9_71,l9_77[1]),dot(l9_71,l9_77[2]));
}
else
{
l9_72=l9_71.xyz;
}
float3 l9_78=l9_72;
float3 l9_79=l9_78;
float l9_80=l9_54.y;
int l9_81=l9_57;
float4 l9_82=l9_51.position;
float3 l9_83=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_84=l9_81;
float4 l9_85=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[0];
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[1];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[2];
float4 l9_88[3];
l9_88[0]=l9_85;
l9_88[1]=l9_86;
l9_88[2]=l9_87;
l9_83=float3(dot(l9_82,l9_88[0]),dot(l9_82,l9_88[1]),dot(l9_82,l9_88[2]));
}
else
{
l9_83=l9_82.xyz;
}
float3 l9_89=l9_83;
float3 l9_90=l9_89;
float l9_91=l9_54.z;
int l9_92=l9_58;
float4 l9_93=l9_51.position;
float3 l9_94=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_95=l9_92;
float4 l9_96=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[0];
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[1];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[2];
float4 l9_99[3];
l9_99[0]=l9_96;
l9_99[1]=l9_97;
l9_99[2]=l9_98;
l9_94=float3(dot(l9_93,l9_99[0]),dot(l9_93,l9_99[1]),dot(l9_93,l9_99[2]));
}
else
{
l9_94=l9_93.xyz;
}
float3 l9_100=l9_94;
float3 l9_101=(((l9_68*l9_69)+(l9_79*l9_80))+(l9_90*l9_91))+(l9_100*l9_54.w);
l9_51.position=float4(l9_101.x,l9_101.y,l9_101.z,l9_51.position.w);
int l9_102=l9_55;
float3x3 l9_103=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[2].xyz));
float3x3 l9_104=l9_103;
float3x3 l9_105=l9_104;
int l9_106=l9_56;
float3x3 l9_107=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[2].xyz));
float3x3 l9_108=l9_107;
float3x3 l9_109=l9_108;
int l9_110=l9_57;
float3x3 l9_111=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[2].xyz));
float3x3 l9_112=l9_111;
float3x3 l9_113=l9_112;
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
l9_51.normal=((((l9_105*l9_51.normal)*l9_54.x)+((l9_109*l9_51.normal)*l9_54.y))+((l9_113*l9_51.normal)*l9_54.z))+((l9_117*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_105*l9_51.tangent)*l9_54.x)+((l9_109*l9_51.tangent)*l9_54.y))+((l9_113*l9_51.tangent)*l9_54.z))+((l9_117*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_118=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_118.x,l9_118.y,l9_118.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.Surface_UVCoord0=v.texture0;
Globals.VertexColor=out.varColor;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPos,1.0)).xyz;
Globals.VertexNormal_WorldSpace=out.varNormal;
Globals.VertexNormal_ObjectSpace=normalize(((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexNormal_WorldSpace,0.0)).xyz);
int l9_119=gl_InstanceIndex;
Globals.gInstanceID=float(l9_119);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float Output_N3=0.0;
float param_1=(*sc_set0.UserUniforms).timeGlobal;
Output_N3=param_1;
float Output_N5=0.0;
float param_2=(*sc_set0.UserUniforms).externalTimeInput;
Output_N5=param_2;
float Output_N7=0.0;
float param_3=(*sc_set0.UserUniforms).externalSeed;
Output_N7=param_3;
float Output_N9=0.0;
float param_4=(*sc_set0.UserUniforms).lifeTimeConstant;
Output_N9=param_4;
float2 Output_N10=float2(0.0);
float2 param_5=(*sc_set0.UserUniforms).lifeTimeMinMax;
Output_N10=param_5;
float Output_N12=0.0;
float param_6=(*sc_set0.UserUniforms).spawnDuration;
Output_N12=param_6;
float Output_N192=0.0;
float param_7;
if ((int(TRAILS_tmp)!=0))
{
param_7=1.001;
}
else
{
param_7=0.001;
}
param_7-=0.001;
Output_N192=param_7;
float Output_N180=0.0;
float param_8=(*sc_set0.UserUniforms).trailLength;
Output_N180=param_8;
float4 Color_N168=float4(0.0);
Color_N168=Globals.VertexColor;
float Output_N217=0.0;
Output_N217=Color_N168.x;
float Result_N218=0.0;
float l9_120=Output_N192;
bool l9_121=(l9_120*1.0)!=0.0;
bool l9_122;
if (l9_121)
{
l9_122=(Output_N217*1.0)!=0.0;
}
else
{
l9_122=l9_121;
}
Result_N218=float(l9_122);
float3 particleSeed_N181=float3(0.0);
float globalSeed_N181=0.0;
float particleAlive_N181=0.0;
float4 timeValues_N181=float4(0.0);
float isTrail_N181=0.0;
float2 trailHeadTime_N181=float2(0.0);
float param_9=Output_N3;
float param_10=Output_N5;
float param_11=Output_N7;
float param_12=Output_N9;
float2 param_13=Output_N10;
float param_14=Output_N12;
float param_15=Output_N180;
float param_16=Result_N218;
ssGlobals param_23=Globals;
tempGlobals=param_23;
float3 param_17=float3(0.0);
float param_18=0.0;
float param_19=0.0;
float4 param_20=float4(0.0);
float param_21=0.0;
float2 param_22=float2(0.0);
N181_timeGlobal=param_9;
N181_ENABLE_EXTERNALTIME=(int(EXTERNALTIME_tmp)!=0);
N181_externalTime=param_10;
N181_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N181_externalSeed=param_11;
N181_ENABLE_LIFETIMEMINMAX=(int(LIFETIMEMINMAX_tmp)!=0);
N181_lifeTimeConstant=param_12;
N181_lifeTimeMinMax=param_13;
N181_ENABLE_INSTANTSPAWN=(int(INSTANTSPAWN_tmp)!=0);
N181_spawnDuration=param_14;
N181_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N181_trailLength=param_15;
N181_isTrailCondition=param_16!=0.0;
N181_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
float l9_123=0.0;
if (N181_ENABLE_WORLDPOSSEED)
{
float4x4 l9_124=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_123=length(float4(1.0)*l9_124);
}
N181_globalSeed=N181_externalSeed+l9_123;
int l9_125=0;
int l9_126=gl_InstanceIndex;
l9_125=l9_126;
int l9_127=l9_125;
float l9_128=float(l9_127);
int l9_129=int(l9_128);
int l9_130=l9_129^(l9_129*15299);
int l9_131=l9_130;
int l9_132=l9_131;
int l9_133=((l9_132*((l9_132*1471343)+101146501))+1559861749)&2147483647;
int l9_134=l9_133;
int l9_135=l9_131*1399;
int l9_136=((l9_135*((l9_135*1471343)+101146501))+1559861749)&2147483647;
int l9_137=l9_136;
int l9_138=l9_131*7177;
int l9_139=((l9_138*((l9_138*1471343)+101146501))+1559861749)&2147483647;
int l9_140=l9_139;
int l9_141=l9_134;
float l9_142=float(l9_141)*4.6566129e-10;
int l9_143=l9_137;
float l9_144=float(l9_143)*4.6566129e-10;
int l9_145=l9_140;
float l9_146=float(l9_145)*4.6566129e-10;
float3 l9_147=float3(l9_142,l9_144,l9_146);
float3 l9_148=l9_147;
N181_particleSeed=l9_148;
float l9_149=fract((N181_particleSeed.y*12.12358)+N181_globalSeed);
float l9_150=fract((N181_particleSeed.z*3.5358)+N181_globalSeed);
float2 l9_151;
if (N181_ENABLE_LIFETIMEMINMAX)
{
l9_151=N181_lifeTimeMinMax;
}
else
{
l9_151=float2(N181_lifeTimeConstant);
}
float2 l9_152=l9_151;
float l9_153=fast::max(l9_152.x,0.0099999998);
float l9_154=fast::max(l9_152.y,0.0099999998);
float l9_155=tempGlobals.gTimeElapsed;
float l9_156=l9_155;
if (N181_ENABLE_EXTERNALTIME)
{
l9_156=N181_externalTime;
}
float l9_157=l9_156;
if (N181_ENABLE_INSTANTSPAWN)
{
l9_157=N181_timeGlobal*l9_156;
}
else
{
float l9_158=0.0;
if (N181_ENABLE_TRAILS)
{
if (N181_ENABLE_INDEPENDENTTRAIL)
{
l9_158=N181_trailLength;
}
}
float l9_159=fract(((l9_156*N181_timeGlobal)*(1.0/(l9_152.y+l9_158)))+l9_149);
l9_157=l9_159*(l9_152.y+l9_158);
}
float l9_160=mix(l9_157/l9_153,l9_157/l9_154,l9_150);
float l9_161=fast::clamp(l9_160,0.0,1.0);
N181_isTrail=0.0;
N181_trailHeadTime=float2(l9_157,l9_161);
if (N181_ENABLE_TRAILS)
{
if (N181_isTrailCondition)
{
N181_isTrail=1.0;
float2 l9_162=tempGlobals.Surface_UVCoord0;
l9_157-=(l9_162.y*N181_trailLength);
l9_160=mix(l9_157/l9_153,l9_157/l9_154,l9_150);
l9_161=fast::clamp(l9_160,0.0,1.0);
}
}
float l9_163=0.0;
if (!N181_ENABLE_INSTANTSPAWN)
{
if (N181_spawnDuration>0.0)
{
if ((l9_156-N181_spawnDuration)>=l9_157)
{
l9_163=1.0;
}
}
}
float l9_164=l9_160+l9_163;
N181_particleAlive=1.0;
if ((l9_164>0.99989998)||(l9_157<=0.0))
{
N181_particleAlive=0.0;
}
N181_timeValues=float4(l9_152,l9_157,l9_161);
param_17=N181_particleSeed;
param_18=N181_globalSeed;
param_19=N181_particleAlive;
param_20=N181_timeValues;
param_21=N181_isTrail;
param_22=N181_trailHeadTime;
particleSeed_N181=param_17;
globalSeed_N181=param_18;
particleAlive_N181=param_19;
timeValues_N181=param_20;
isTrail_N181=param_21;
trailHeadTime_N181=param_22;
float2 Output_N183=float2(0.0);
float2 param_24=(*sc_set0.UserUniforms).trailTaper;
Output_N183=param_24;
float Output_N188=0.0;
float param_25=(*sc_set0.UserUniforms).trailWidth;
Output_N188=param_25;
float3 Position_N114=float3(0.0);
Position_N114=Globals.SurfacePosition_ObjectSpace;
float3 Normal_N172=float3(0.0);
Normal_N172=Globals.VertexNormal_ObjectSpace;
float3 Output_N16=float3(0.0);
float3 param_26=(*sc_set0.UserUniforms).spawnLocation;
Output_N16=param_26;
float3 Output_N18=float3(0.0);
float3 param_27=(*sc_set0.UserUniforms).spawnBox;
Output_N18=param_27;
float3 Output_N20=float3(0.0);
float3 param_28=(*sc_set0.UserUniforms).spawnSphere;
Output_N20=param_28;
float3 Output_N39=float3(0.0);
float3 param_29=(*sc_set0.UserUniforms).noiseMult;
Output_N39=param_29;
float3 Output_N40=float3(0.0);
float3 param_30=(*sc_set0.UserUniforms).noiseFrequency;
Output_N40=param_30;
float3 Output_N41=float3(0.0);
float3 param_31=(*sc_set0.UserUniforms).sNoiseMult;
Output_N41=param_31;
float3 Output_N42=float3(0.0);
float3 param_32=(*sc_set0.UserUniforms).sNoiseFrequency;
Output_N42=param_32;
float3 Output_N34=float3(0.0);
float3 param_33=(*sc_set0.UserUniforms).velocityMin;
Output_N34=param_33;
float3 Output_N35=float3(0.0);
float3 param_34=(*sc_set0.UserUniforms).velocityMax;
Output_N35=param_34;
float3 Output_N36=float3(0.0);
float3 param_35=(*sc_set0.UserUniforms).velocityDrag;
Output_N36=param_35;
float3 Result_N70=float3(0.0);
float3 param_36=float3(0.0);
float3 param_37=float3(0.0);
float3 param_38;
if (MESHTYPE_tmp==0)
{
float2 l9_165=float2(0.0);
float2 l9_166=(*sc_set0.UserUniforms).sizeStart;
l9_165=l9_166;
param_36=float3(l9_165,0.0);
param_38=param_36;
}
else
{
float3 l9_167=float3(0.0);
float3 l9_168=(*sc_set0.UserUniforms).sizeStart3D;
l9_167=l9_168;
param_37=l9_167;
param_38=param_37;
}
Result_N70=param_38;
float3 Result_N121=float3(0.0);
float3 param_39=float3(0.0);
float3 param_40=float3(0.0);
float3 param_41;
if (MESHTYPE_tmp==0)
{
float2 l9_169=float2(0.0);
float2 l9_170=(*sc_set0.UserUniforms).sizeEnd;
l9_169=l9_170;
param_39=float3(l9_169,0.0);
param_41=param_39;
}
else
{
float3 l9_171=float3(0.0);
float3 l9_172=(*sc_set0.UserUniforms).sizeEnd3D;
l9_171=l9_172;
param_40=l9_171;
param_41=param_40;
}
Result_N121=param_41;
float3 Result_N124=float3(0.0);
float3 param_42=float3(0.0);
float3 param_43=float3(0.0);
float3 param_44;
if (MESHTYPE_tmp==0)
{
float2 l9_173=float2(0.0);
float2 l9_174=(*sc_set0.UserUniforms).sizeStartMin;
l9_173=l9_174;
param_42=float3(l9_173,0.0);
param_44=param_42;
}
else
{
float3 l9_175=float3(0.0);
float3 l9_176=(*sc_set0.UserUniforms).sizeStartMin3D;
l9_175=l9_176;
param_43=l9_175;
param_44=param_43;
}
Result_N124=param_44;
float3 Result_N123=float3(0.0);
float3 param_45=float3(0.0);
float3 param_46=float3(0.0);
float3 param_47;
if (MESHTYPE_tmp==0)
{
float2 l9_177=float2(0.0);
float2 l9_178=(*sc_set0.UserUniforms).sizeStartMax;
l9_177=l9_178;
param_45=float3(l9_177,0.0);
param_47=param_45;
}
else
{
float3 l9_179=float3(0.0);
float3 l9_180=(*sc_set0.UserUniforms).sizeStartMax3D;
l9_179=l9_180;
param_46=l9_179;
param_47=param_46;
}
Result_N123=param_47;
float3 Result_N125=float3(0.0);
float3 param_48=float3(0.0);
float3 param_49=float3(0.0);
float3 param_50;
if (MESHTYPE_tmp==0)
{
float2 l9_181=float2(0.0);
float2 l9_182=(*sc_set0.UserUniforms).sizeEndMin;
l9_181=l9_182;
param_48=float3(l9_181,0.0);
param_50=param_48;
}
else
{
float3 l9_183=float3(0.0);
float3 l9_184=(*sc_set0.UserUniforms).sizeEndMin3D;
l9_183=l9_184;
param_49=l9_183;
param_50=param_49;
}
Result_N125=param_50;
float3 Result_N126=float3(0.0);
float3 param_51=float3(0.0);
float3 param_52=float3(0.0);
float3 param_53;
if (MESHTYPE_tmp==0)
{
float2 l9_185=float2(0.0);
float2 l9_186=(*sc_set0.UserUniforms).sizeEndMax;
l9_185=l9_186;
param_51=float3(l9_185,0.0);
param_53=param_51;
}
else
{
float3 l9_187=float3(0.0);
float3 l9_188=(*sc_set0.UserUniforms).sizeEndMax3D;
l9_187=l9_188;
param_52=l9_187;
param_53=param_52;
}
Result_N126=param_53;
float Output_N27=0.0;
float param_54=(*sc_set0.UserUniforms).sizeSpeed;
Output_N27=param_54;
float Output_N195=0.0;
float param_55;
if ((int(ENABLE_SIZERAMPSTARTENDASBOUNDS_tmp)!=0))
{
param_55=1.001;
}
else
{
param_55=0.001;
}
param_55-=0.001;
Output_N195=param_55;
float Output_N55=0.0;
float param_56=(*sc_set0.UserUniforms).gravity;
Output_N55=param_56;
float3 Output_N46=float3(0.0);
float3 param_57=(*sc_set0.UserUniforms).localForce;
Output_N46=param_57;
float Output_N51=0.0;
float param_58=(*sc_set0.UserUniforms).sizeVelScale;
Output_N51=param_58;
float Output_N48=0.0;
float param_59=float((*sc_set0.UserUniforms).ALIGNTOX!=0);
Output_N48=param_59;
float Output_N49=0.0;
float param_60=float((*sc_set0.UserUniforms).ALIGNTOY!=0);
Output_N49=param_60;
float Output_N50=0.0;
float param_61=float((*sc_set0.UserUniforms).ALIGNTOZ!=0);
Output_N50=param_61;
float2 Output_N138=float2(0.0);
float2 param_62=(*sc_set0.UserUniforms).Port_Input1_N138;
float2 param_63=float2(0.0);
float2 param_64;
if (MESHTYPE_tmp==0)
{
param_64=param_62;
}
else
{
float2 l9_189=float2(0.0);
float2 l9_190=(*sc_set0.UserUniforms).rotationRandomX;
l9_189=l9_190;
param_63=l9_189;
param_64=param_63;
}
Output_N138=param_64;
float2 Output_N139=float2(0.0);
float2 param_65=(*sc_set0.UserUniforms).Port_Input1_N139;
float2 param_66=float2(0.0);
float2 param_67;
if (MESHTYPE_tmp==0)
{
param_67=param_65;
}
else
{
float2 l9_191=float2(0.0);
float2 l9_192=(*sc_set0.UserUniforms).rotationRateX;
l9_191=l9_192;
param_66=l9_191;
param_67=param_66;
}
Output_N139=param_67;
float2 Output_N140=float2(0.0);
float2 param_68=(*sc_set0.UserUniforms).Port_Input1_N140;
float2 param_69=float2(0.0);
float2 param_70;
if (MESHTYPE_tmp==0)
{
param_70=param_68;
}
else
{
float2 l9_193=float2(0.0);
float2 l9_194=(*sc_set0.UserUniforms).randomRotationY;
l9_193=l9_194;
param_69=l9_193;
param_70=param_69;
}
Output_N140=param_70;
float2 Output_N144=float2(0.0);
float2 param_71=(*sc_set0.UserUniforms).Port_Input1_N144;
float2 param_72=float2(0.0);
float2 param_73;
if (MESHTYPE_tmp==0)
{
param_73=param_71;
}
else
{
float2 l9_195=float2(0.0);
float2 l9_196=(*sc_set0.UserUniforms).rotationRateY;
l9_195=l9_196;
param_72=l9_195;
param_73=param_72;
}
Output_N144=param_73;
float2 Output_N135=float2(0.0);
float2 param_74=float2(1.0);
float2 param_75=float2(0.0);
float2 param_76;
if (MESHTYPE_tmp==0)
{
float2 l9_197=float2(0.0);
float2 l9_198=(*sc_set0.UserUniforms).rotationRandom;
l9_197=l9_198;
param_74=l9_197;
param_76=param_74;
}
else
{
float2 l9_199=float2(0.0);
float2 l9_200=(*sc_set0.UserUniforms).randomRotationZ;
l9_199=l9_200;
param_75=l9_199;
param_76=param_75;
}
Output_N135=param_76;
float2 Output_N137=float2(0.0);
float2 param_77=float2(1.0);
float2 param_78=float2(0.0);
float2 param_79;
if (MESHTYPE_tmp==0)
{
float2 l9_201=float2(0.0);
float2 l9_202=(*sc_set0.UserUniforms).rotationRate;
l9_201=l9_202;
param_77=l9_201;
param_79=param_77;
}
else
{
float2 l9_203=float2(0.0);
float2 l9_204=(*sc_set0.UserUniforms).rotationRateZ;
l9_203=l9_204;
param_78=l9_203;
param_79=param_78;
}
Output_N137=param_79;
float Output_N54=0.0;
float param_80=(*sc_set0.UserUniforms).rotationDrag;
Output_N54=param_80;
float Output_N110=0.0;
float param_81=(*sc_set0.UserUniforms).Port_Input1_N110;
float param_82=0.0;
float param_83;
if (MESHTYPE_tmp==0)
{
param_83=param_81;
}
else
{
float l9_205=0.0;
float l9_206=float((*sc_set0.UserUniforms).CENTER_BBOX!=0);
l9_205=l9_206;
param_82=l9_205;
param_83=param_82;
}
Output_N110=param_83;
float Output_N176=0.0;
float param_84=(*sc_set0.UserUniforms).fadeDistanceVisible;
Output_N176=param_84;
float Output_N178=0.0;
float param_85=(*sc_set0.UserUniforms).fadeDistanceInvisible;
Output_N178=param_85;
float3 position_N111=float3(0.0);
float3 param_86=particleSeed_N181;
float param_87=globalSeed_N181;
float param_88=particleAlive_N181;
float4 param_89=timeValues_N181;
float param_90=isTrail_N181;
float2 param_91=trailHeadTime_N181;
float2 param_92=Output_N183;
float param_93=Output_N188;
float3 param_94=Position_N114;
float3 param_95=Normal_N172;
float3 param_96=Output_N16;
float3 param_97=Output_N18;
float3 param_98=Output_N20;
float3 param_99=Output_N39;
float3 param_100=Output_N40;
float3 param_101=Output_N41;
float3 param_102=Output_N42;
float3 param_103=Output_N34;
float3 param_104=Output_N35;
float3 param_105=Output_N36;
float3 param_106=Result_N70;
float3 param_107=Result_N121;
float3 param_108=Result_N124;
float3 param_109=Result_N123;
float3 param_110=Result_N125;
float3 param_111=Result_N126;
float param_112=Output_N27;
float param_113=Output_N195;
float param_114=Output_N55;
float3 param_115=Output_N46;
float param_116=Output_N51;
float param_117=Output_N48;
float param_118=Output_N49;
float param_119=Output_N50;
float2 param_120=Output_N138;
float2 param_121=Output_N139;
float2 param_122=Output_N140;
float2 param_123=Output_N144;
float2 param_124=Output_N135;
float2 param_125=Output_N137;
float param_126=Output_N54;
float param_127=Output_N110;
float param_128=Output_N176;
float param_129=Output_N178;
ssGlobals param_131=Globals;
tempGlobals=param_131;
float3 param_130=float3(0.0);
N111_MESHTYPE_QUAD=MESHTYPE_tmp==0;
N111_particleSeedIn=param_86;
N111_globalSeedIn=param_87;
N111_particleAlive=param_88;
N111_timeValuesIn=param_89;
N111_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N111_isTrail=param_90!=0.0;
N111_trailHeadTime=param_91;
N111_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N111_taper=param_92;
N111_ENABLE_TRAILSPIN=(int(TRAILTWIST_tmp)!=0);
N111_trailSizeMult=param_93;
N111_ENABLE_TRAILSIZERAMP=(int(TRAILSIZERAMP_tmp)!=0);
N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS=(int(TRAILSIZERAMPSTARTENDASBOUNDS_tmp)!=0);
N111_positionObjectSpace=param_94;
N111_normalObjectSpace=param_95;
N111_ENABLE_INILOCATION=(int(INILOCATION_tmp)!=0);
N111_spawnLocation=param_96;
N111_ENABLE_BOXSPAWN=(int(BOXSPAWN_tmp)!=0);
N111_spawnBox=param_97;
N111_ENABLE_SPHERESPAWN=(int(SPHERESPAWN_tmp)!=0);
N111_spawnSphere=param_98;
N111_ENABLE_NOISE=(int(NOISE_tmp)!=0);
N111_noiseMult=param_99;
N111_noiseFrequency=param_100;
N111_ENABLE_SNOISE=(int(SNOISE_tmp)!=0);
N111_sNoiseMult=param_101;
N111_sNoiseFrequency=param_102;
N111_ENABLE_VELRAMP=(int(VELRAMP_tmp)!=0);
N111_velocityMin=param_103;
N111_velocityMax=param_104;
N111_velocityDrag=param_105;
N111_sizeStart=param_106;
N111_sizeEnd=param_107;
N111_ENABLE_SIZEMINMAX=(int(SIZEMINMAX_tmp)!=0);
N111_sizeStartMin=param_108;
N111_sizeStartMax=param_109;
N111_sizeEndMin=param_110;
N111_sizeEndMax=param_111;
N111_sizeSpeed=param_112;
N111_ENABLE_SIZERAMP=(int(SIZERAMP_tmp)!=0);
N111_ENABLE_SIZERAMPSTARTENDASBOUNDS=param_113!=0.0;
N111_gravity=param_114;
N111_ENABLE_FORCE=(int(FORCE_tmp)!=0);
N111_localForce=param_115;
N111_ENABLE_ALIGNQUADTOCAMERAUP=(int(ALIGNTOCAMERAUP_tmp)!=0);
N111_ENABLE_ALIGNTOVEL=(int(VELOCITYDIR_tmp)!=0);
N111_sizeVelScale=param_116;
N111_ENABLE_IGNOREVEL=(int(IGNOREVEL_tmp)!=0);
N111_ENABLE_IGNORETRANSFORMSCALE=(int(IGNORETRANSFORMSCALE_tmp)!=0);
N111_ENABLE_ALIGNTOX=param_117!=0.0;
N111_ENABLE_ALIGNTOY=param_118!=0.0;
N111_ENABLE_ALIGNTOZ=param_119!=0.0;
N111_rotationRandomX=param_120;
N111_rotationRateX=param_121;
N111_rotationRandomY=param_122;
N111_rotationRateY=param_123;
N111_rotationRandomZ=param_124;
N111_rotationRateZ=param_125;
N111_rotationDrag=param_126;
N111_WORLDSPACE=rotationSpace_tmp==1;
N111_WORLDFORCE=rotationSpace_tmp==2;
N111_ENABLE_CENTER_IN_BBOX=param_127!=0.0;
N111_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N111_fadeDistanceVisible=param_128;
N111_fadeDistanceInvisible=param_129;
float3 l9_207=float3(0.0);
N111_particleSeed=N111_particleSeedIn;
N111_globalSeed=N111_globalSeedIn;
float l9_208=N111_particleSeed.x;
float l9_209=N111_particleSeed.y;
float l9_210=N111_particleSeed.z;
float3 l9_211=fract((float3(l9_208,l9_209,l9_210)*3048.28)+float3(N111_globalSeed))-float3(0.5);
float3 l9_212=fract((N111_particleSeed*374.57129)+float3(N111_globalSeed))-float3(0.5);
float3 l9_213=normalize(l9_212+float3(N111_EPSILON));
float l9_214=fract(N111_particleSeed.x+N111_globalSeed);
float l9_215=l9_214;
float l9_216=0.33333334;
float l9_217;
if (l9_215<=0.0)
{
l9_217=0.0;
}
else
{
l9_217=pow(l9_215,l9_216);
}
float l9_218=l9_217;
float l9_219=l9_218;
l9_213*=l9_219;
l9_213/=float3(2.0);
float l9_220=fract((N111_particleSeed.x*334.59122)+N111_globalSeed)-0.5;
float l9_221=fract((N111_particleSeed.y*41.231232)+N111_globalSeed)-0.5;
float l9_222=fract((N111_particleSeed.z*18.984529)+N111_globalSeed);
float l9_223=fract((N111_particleSeed.x*654.15588)+N111_globalSeed);
float l9_224=fract((N111_particleSeed.y*45.722408)+N111_globalSeed);
float3 l9_225=(float3(l9_223,l9_224,l9_222)-float3(0.5))*2.0;
float3 l9_226=float3(l9_223,l9_224,l9_222);
float l9_227=fract((N111_particleSeed.z*15.32451)+N111_globalSeed);
float2 l9_228=N111_timeValuesIn.xy;
float l9_229=N111_timeValuesIn.z;
float l9_230=N111_timeValuesIn.w;
N111_cameraFade_trailHeadTime_taper=float4(0.0);
float3 l9_231=l9_207;
float3 l9_232=l9_207;
float3 l9_233=l9_207;
if (N111_ENABLE_INILOCATION)
{
l9_233=N111_spawnLocation;
}
if (N111_ENABLE_BOXSPAWN)
{
l9_231=N111_spawnBox*l9_211;
}
if (N111_ENABLE_SPHERESPAWN)
{
l9_232=N111_spawnSphere*l9_213;
}
float3 l9_234=(l9_233+l9_232)+l9_231;
float3 l9_235=l9_207;
if (N111_ENABLE_NOISE)
{
float3 l9_236=N111_noiseFrequency;
float3 l9_237=N111_noiseMult;
float3 l9_238=l9_225;
float l9_239=l9_230;
float l9_240=sin(l9_239*l9_236.x);
float l9_241=sin(l9_239*l9_236.y);
float l9_242=sin(l9_239*l9_236.z);
float3 l9_243=(float3(l9_240,l9_241,l9_242)*l9_237)*l9_238;
float3 l9_244=l9_243;
l9_235+=l9_244;
}
if (N111_ENABLE_SNOISE)
{
float l9_245=l9_222;
float l9_246=l9_223;
float l9_247=l9_224;
float3 l9_248=N111_sNoiseFrequency;
float3 l9_249=N111_sNoiseMult;
float3 l9_250=l9_225;
float l9_251=l9_229;
float2 l9_252=float2(l9_245*l9_251,l9_248.x);
float2 l9_253=floor(l9_252+float2(dot(l9_252,float2(0.36602542))));
float2 l9_254=(l9_252-l9_253)+float2(dot(l9_253,float2(0.21132487)));
float2 l9_255=float2(0.0);
bool2 l9_256=bool2(l9_254.x>l9_254.y);
l9_255=float2(l9_256.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_256.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_257=l9_254.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_258=l9_257.xy-l9_255;
l9_257=float4(l9_258.x,l9_258.y,l9_257.z,l9_257.w);
l9_253=mod(l9_253,float2(289.0));
float3 l9_259=float3(l9_253.y)+float3(0.0,l9_255.y,1.0);
float3 l9_260=mod(((l9_259*34.0)+float3(1.0))*l9_259,float3(289.0));
float3 l9_261=(l9_260+float3(l9_253.x))+float3(0.0,l9_255.x,1.0);
float3 l9_262=mod(((l9_261*34.0)+float3(1.0))*l9_261,float3(289.0));
float3 l9_263=l9_262;
float3 l9_264=fast::max(float3(0.5)-float3(dot(l9_254,l9_254),dot(l9_257.xy,l9_257.xy),dot(l9_257.zw,l9_257.zw)),float3(0.0));
l9_264*=l9_264;
l9_264*=l9_264;
float3 l9_265=(fract(l9_263*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_266=abs(l9_265)-float3(0.5);
float3 l9_267=floor(l9_265+float3(0.5));
float3 l9_268=l9_265-l9_267;
l9_264*=(float3(1.7928429)-(((l9_268*l9_268)+(l9_266*l9_266))*0.85373473));
float3 l9_269=float3(0.0);
l9_269.x=(l9_268.x*l9_254.x)+(l9_266.x*l9_254.y);
float2 l9_270=(l9_268.yz*l9_257.xz)+(l9_266.yz*l9_257.yw);
l9_269=float3(l9_269.x,l9_270.x,l9_270.y);
float l9_271=130.0*dot(l9_264,l9_269);
float l9_272=l9_271;
float2 l9_273=float2(l9_246*l9_251,l9_248.y);
float2 l9_274=floor(l9_273+float2(dot(l9_273,float2(0.36602542))));
float2 l9_275=(l9_273-l9_274)+float2(dot(l9_274,float2(0.21132487)));
float2 l9_276=float2(0.0);
bool2 l9_277=bool2(l9_275.x>l9_275.y);
l9_276=float2(l9_277.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_277.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_278=l9_275.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_279=l9_278.xy-l9_276;
l9_278=float4(l9_279.x,l9_279.y,l9_278.z,l9_278.w);
l9_274=mod(l9_274,float2(289.0));
float3 l9_280=float3(l9_274.y)+float3(0.0,l9_276.y,1.0);
float3 l9_281=mod(((l9_280*34.0)+float3(1.0))*l9_280,float3(289.0));
float3 l9_282=(l9_281+float3(l9_274.x))+float3(0.0,l9_276.x,1.0);
float3 l9_283=mod(((l9_282*34.0)+float3(1.0))*l9_282,float3(289.0));
float3 l9_284=l9_283;
float3 l9_285=fast::max(float3(0.5)-float3(dot(l9_275,l9_275),dot(l9_278.xy,l9_278.xy),dot(l9_278.zw,l9_278.zw)),float3(0.0));
l9_285*=l9_285;
l9_285*=l9_285;
float3 l9_286=(fract(l9_284*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_287=abs(l9_286)-float3(0.5);
float3 l9_288=floor(l9_286+float3(0.5));
float3 l9_289=l9_286-l9_288;
l9_285*=(float3(1.7928429)-(((l9_289*l9_289)+(l9_287*l9_287))*0.85373473));
float3 l9_290=float3(0.0);
l9_290.x=(l9_289.x*l9_275.x)+(l9_287.x*l9_275.y);
float2 l9_291=(l9_289.yz*l9_278.xz)+(l9_287.yz*l9_278.yw);
l9_290=float3(l9_290.x,l9_291.x,l9_291.y);
float l9_292=130.0*dot(l9_285,l9_290);
float l9_293=l9_292;
float2 l9_294=float2(l9_247*l9_251,l9_248.z);
float2 l9_295=floor(l9_294+float2(dot(l9_294,float2(0.36602542))));
float2 l9_296=(l9_294-l9_295)+float2(dot(l9_295,float2(0.21132487)));
float2 l9_297=float2(0.0);
bool2 l9_298=bool2(l9_296.x>l9_296.y);
l9_297=float2(l9_298.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_298.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_299=l9_296.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_300=l9_299.xy-l9_297;
l9_299=float4(l9_300.x,l9_300.y,l9_299.z,l9_299.w);
l9_295=mod(l9_295,float2(289.0));
float3 l9_301=float3(l9_295.y)+float3(0.0,l9_297.y,1.0);
float3 l9_302=mod(((l9_301*34.0)+float3(1.0))*l9_301,float3(289.0));
float3 l9_303=(l9_302+float3(l9_295.x))+float3(0.0,l9_297.x,1.0);
float3 l9_304=mod(((l9_303*34.0)+float3(1.0))*l9_303,float3(289.0));
float3 l9_305=l9_304;
float3 l9_306=fast::max(float3(0.5)-float3(dot(l9_296,l9_296),dot(l9_299.xy,l9_299.xy),dot(l9_299.zw,l9_299.zw)),float3(0.0));
l9_306*=l9_306;
l9_306*=l9_306;
float3 l9_307=(fract(l9_305*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_308=abs(l9_307)-float3(0.5);
float3 l9_309=floor(l9_307+float3(0.5));
float3 l9_310=l9_307-l9_309;
l9_306*=(float3(1.7928429)-(((l9_310*l9_310)+(l9_308*l9_308))*0.85373473));
float3 l9_311=float3(0.0);
l9_311.x=(l9_310.x*l9_296.x)+(l9_308.x*l9_296.y);
float2 l9_312=(l9_310.yz*l9_299.xz)+(l9_308.yz*l9_299.yw);
l9_311=float3(l9_311.x,l9_312.x,l9_312.y);
float l9_313=130.0*dot(l9_306,l9_311);
float l9_314=l9_313;
float3 l9_315=(float3(l9_272,l9_293,l9_314)*l9_249)*l9_250;
l9_235+=l9_315;
}
float3 l9_316=float3(0.0,((N111_gravity/2.0)*l9_229)*l9_229,0.0);
float3 l9_317=l9_207;
if (N111_ENABLE_FORCE)
{
l9_317=((N111_localForce/float3(2.0))*l9_229)*l9_229;
}
float3 l9_318=l9_207;
float3 l9_319=N111_velocityMin+(((l9_225+float3(1.0))/float3(2.0))*(N111_velocityMax-N111_velocityMin));
if (N111_ENABLE_VELRAMP)
{
l9_319=mix(N111_velocityMin,N111_velocityMax,l9_226);
}
float3 l9_320=l9_319;
float l9_321=l9_229;
float3 l9_322=N111_velocityDrag;
float3 l9_323=l9_235;
float l9_324=l9_230;
float3 l9_325=float3(l9_321,l9_321,l9_321);
float3 l9_326=l9_322;
float l9_327;
if (l9_325.x<=0.0)
{
l9_327=0.0;
}
else
{
l9_327=pow(l9_325.x,l9_326.x);
}
float l9_328=l9_327;
float l9_329;
if (l9_325.y<=0.0)
{
l9_329=0.0;
}
else
{
l9_329=pow(l9_325.y,l9_326.y);
}
float l9_330=l9_329;
float l9_331;
if (l9_325.z<=0.0)
{
l9_331=0.0;
}
else
{
l9_331=pow(l9_325.z,l9_326.z);
}
float3 l9_332=float3(l9_328,l9_330,l9_331);
float3 l9_333=l9_332;
float3 l9_334=(l9_320+l9_323)*l9_333;
if (N111_ENABLE_VELRAMP)
{
float l9_335=floor(l9_324*10000.0)/10000.0;
float2 l9_336=tempGlobals.Surface_UVCoord0;
float2 l9_337=(l9_336/float2(10000.0,1.0))+float2(l9_335,0.0);
float2 l9_338=l9_337;
float4 l9_339=float4(0.0);
int l9_340=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_341=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_341=0;
}
else
{
l9_341=gl_InstanceIndex%2;
}
int l9_342=l9_341;
l9_340=1-l9_342;
}
else
{
int l9_343=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_343=0;
}
else
{
l9_343=gl_InstanceIndex%2;
}
int l9_344=l9_343;
l9_340=l9_344;
}
int l9_345=l9_340;
int l9_346=velRampTextureLayout_tmp;
int l9_347=l9_345;
float2 l9_348=l9_338;
bool l9_349=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_350=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_351=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_352=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_353=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_354=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_355=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_356=0.0;
bool l9_357=l9_354&&(!l9_352);
float l9_358=1.0;
float l9_359=l9_348.x;
int l9_360=l9_351.x;
if (l9_360==1)
{
l9_359=fract(l9_359);
}
else
{
if (l9_360==2)
{
float l9_361=fract(l9_359);
float l9_362=l9_359-l9_361;
float l9_363=step(0.25,fract(l9_362*0.5));
l9_359=mix(l9_361,1.0-l9_361,fast::clamp(l9_363,0.0,1.0));
}
}
l9_348.x=l9_359;
float l9_364=l9_348.y;
int l9_365=l9_351.y;
if (l9_365==1)
{
l9_364=fract(l9_364);
}
else
{
if (l9_365==2)
{
float l9_366=fract(l9_364);
float l9_367=l9_364-l9_366;
float l9_368=step(0.25,fract(l9_367*0.5));
l9_364=mix(l9_366,1.0-l9_366,fast::clamp(l9_368,0.0,1.0));
}
}
l9_348.y=l9_364;
if (l9_352)
{
bool l9_369=l9_354;
bool l9_370;
if (l9_369)
{
l9_370=l9_351.x==3;
}
else
{
l9_370=l9_369;
}
float l9_371=l9_348.x;
float l9_372=l9_353.x;
float l9_373=l9_353.z;
bool l9_374=l9_370;
float l9_375=l9_358;
float l9_376=fast::clamp(l9_371,l9_372,l9_373);
float l9_377=step(abs(l9_371-l9_376),9.9999997e-06);
l9_375*=(l9_377+((1.0-float(l9_374))*(1.0-l9_377)));
l9_371=l9_376;
l9_348.x=l9_371;
l9_358=l9_375;
bool l9_378=l9_354;
bool l9_379;
if (l9_378)
{
l9_379=l9_351.y==3;
}
else
{
l9_379=l9_378;
}
float l9_380=l9_348.y;
float l9_381=l9_353.y;
float l9_382=l9_353.w;
bool l9_383=l9_379;
float l9_384=l9_358;
float l9_385=fast::clamp(l9_380,l9_381,l9_382);
float l9_386=step(abs(l9_380-l9_385),9.9999997e-06);
l9_384*=(l9_386+((1.0-float(l9_383))*(1.0-l9_386)));
l9_380=l9_385;
l9_348.y=l9_380;
l9_358=l9_384;
}
float2 l9_387=l9_348;
bool l9_388=l9_349;
float3x3 l9_389=l9_350;
if (l9_388)
{
l9_387=float2((l9_389*float3(l9_387,1.0)).xy);
}
float2 l9_390=l9_387;
float2 l9_391=l9_390;
float2 l9_392=l9_391;
l9_348=l9_392;
float l9_393=l9_348.x;
int l9_394=l9_351.x;
bool l9_395=l9_357;
float l9_396=l9_358;
if ((l9_394==0)||(l9_394==3))
{
float l9_397=l9_393;
float l9_398=0.0;
float l9_399=1.0;
bool l9_400=l9_395;
float l9_401=l9_396;
float l9_402=fast::clamp(l9_397,l9_398,l9_399);
float l9_403=step(abs(l9_397-l9_402),9.9999997e-06);
l9_401*=(l9_403+((1.0-float(l9_400))*(1.0-l9_403)));
l9_397=l9_402;
l9_393=l9_397;
l9_396=l9_401;
}
l9_348.x=l9_393;
l9_358=l9_396;
float l9_404=l9_348.y;
int l9_405=l9_351.y;
bool l9_406=l9_357;
float l9_407=l9_358;
if ((l9_405==0)||(l9_405==3))
{
float l9_408=l9_404;
float l9_409=0.0;
float l9_410=1.0;
bool l9_411=l9_406;
float l9_412=l9_407;
float l9_413=fast::clamp(l9_408,l9_409,l9_410);
float l9_414=step(abs(l9_408-l9_413),9.9999997e-06);
l9_412*=(l9_414+((1.0-float(l9_411))*(1.0-l9_414)));
l9_408=l9_413;
l9_404=l9_408;
l9_407=l9_412;
}
l9_348.y=l9_404;
l9_358=l9_407;
float2 l9_415=l9_348;
int l9_416=l9_346;
int l9_417=l9_347;
float l9_418=l9_356;
float2 l9_419=l9_415;
int l9_420=l9_416;
int l9_421=l9_417;
float3 l9_422=float3(0.0);
if (l9_420==0)
{
l9_422=float3(l9_419,0.0);
}
else
{
if (l9_420==1)
{
l9_422=float3(l9_419.x,(l9_419.y*0.5)+(0.5-(float(l9_421)*0.5)),0.0);
}
else
{
l9_422=float3(l9_419,float(l9_421));
}
}
float3 l9_423=l9_422;
float3 l9_424=l9_423;
float2 l9_425=l9_424.xy;
float l9_426=l9_418;
float4 l9_427=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_425,level(l9_426));
float4 l9_428=l9_427;
float4 l9_429=l9_428;
if (l9_354)
{
l9_429=mix(l9_355,l9_429,float4(l9_358));
}
float4 l9_430=l9_429;
l9_339=l9_430;
float4 l9_431=l9_339;
float3 l9_432=l9_431.xyz;
l9_334=(l9_320+l9_323)*l9_432;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_334=l9_320*l9_333;
}
}
float3 l9_433=l9_334;
l9_318=l9_433;
if (N111_ENABLE_TRAILS)
{
if (N111_isTrail)
{
float2 l9_434=tempGlobals.Surface_UVCoord0;
float2 l9_435=l9_434;
float l9_436=mix(1.0,l9_435.y,1.0-N111_taper.x);
l9_436*=mix(1.0,1.0-l9_435.y,1.0-N111_taper.y);
N111_cameraFade_trailHeadTime_taper=float4(N111_cameraFade_trailHeadTime_taper.x,N111_trailHeadTime.x,N111_trailHeadTime.y,N111_cameraFade_trailHeadTime_taper.w);
N111_cameraFade_trailHeadTime_taper.w=l9_436;
}
}
float4x4 l9_437=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_438=length(l9_437[0].xyz);
float4x4 l9_439=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_440=length(l9_439[1].xyz);
float4x4 l9_441=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_442=length(l9_441[2].xyz);
float3 l9_443=float3(l9_438,l9_440,l9_442);
float4x4 l9_444=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_445=l9_444;
float4 l9_446=l9_445[0];
float4 l9_447=l9_445[1];
float4 l9_448=l9_445[2];
float3x3 l9_449=float3x3(float3(float3(l9_446.x,l9_447.x,l9_448.x)),float3(float3(l9_446.y,l9_447.y,l9_448.y)),float3(float3(l9_446.z,l9_447.z,l9_448.z)));
float3x3 l9_450=l9_449;
float3 l9_451=((l9_318+l9_316)+l9_317)*l9_450;
if (N111_WORLDFORCE)
{
float4x4 l9_452=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_453=l9_452;
float4 l9_454=l9_453[0];
float4 l9_455=l9_453[1];
float4 l9_456=l9_453[2];
float3x3 l9_457=float3x3(float3(float3(l9_454.x,l9_455.x,l9_456.x)),float3(float3(l9_454.y,l9_455.y,l9_456.y)),float3(float3(l9_454.z,l9_455.z,l9_456.z)));
float3x3 l9_458=l9_457;
l9_451=((l9_318*l9_458)+l9_316)+l9_317;
}
if (N111_WORLDSPACE)
{
l9_451=((l9_318*l9_443)+l9_316)+l9_317;
}
float4x4 l9_459=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_460=(l9_459*float4(l9_234,1.0)).xyz+l9_451;
float l9_461=mix(N111_rotationRandomZ.x,N111_rotationRandomZ.y,l9_227);
float l9_462=1.0-l9_230;
float l9_463=N111_rotationDrag;
float l9_464;
if (l9_462<=0.0)
{
l9_464=0.0;
}
else
{
l9_464=pow(l9_462,l9_463);
}
float l9_465=l9_464;
float l9_466=l9_465;
float l9_467=mix(N111_rotationRateZ.x,N111_rotationRateZ.y,l9_227);
float l9_468=((l9_467*l9_466)*l9_230)*2.0;
float l9_469=N111_PI*((l9_468+l9_461)-0.5);
float l9_470=1.0;
if (N111_ENABLE_SCREENFADE)
{
float3 l9_471=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_472=l9_471-l9_460;
float l9_473=dot(l9_472,l9_472);
float l9_474=(N111_fadeDistanceInvisible+N111_EPSILON)*(N111_fadeDistanceInvisible+N111_EPSILON);
float l9_475=N111_fadeDistanceVisible*N111_fadeDistanceVisible;
float l9_476=fast::min(l9_474,l9_475);
float l9_477=fast::max(l9_474,l9_475);
float l9_478=smoothstep(l9_476,l9_477,l9_473);
float l9_479;
if (l9_474>l9_475)
{
l9_479=1.0-l9_478;
}
else
{
l9_479=l9_478;
}
l9_478=l9_479;
if (l9_478<=N111_EPSILON)
{
l9_470=0.0;
}
N111_cameraFade_trailHeadTime_taper.x=l9_478;
}
if (N111_MESHTYPE_QUAD||N111_ENABLE_TRAILS)
{
if (N111_MESHTYPE_QUAD||N111_isTrail)
{
int l9_480=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_480=0;
}
else
{
l9_480=gl_InstanceIndex%2;
}
int l9_481=l9_480;
float4x4 l9_482=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_481];
float3 l9_483=normalize(l9_482[2].xyz);
if (N111_isTrail)
{
l9_483*=float3(-1.0);
}
float3 l9_484=float3(0.0,1.0,0.0);
if (N111_ENABLE_ALIGNQUADTOCAMERAUP)
{
int l9_485=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_485=0;
}
else
{
l9_485=gl_InstanceIndex%2;
}
int l9_486=l9_485;
float3 l9_487=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_486][1].xyz;
l9_484=l9_487;
}
float3 l9_488=-normalize(cross(l9_483,l9_484));
float3 l9_489=normalize(cross(l9_488,l9_483));
float l9_490=1.0;
if (N111_ENABLE_ALIGNTOX)
{
l9_488=float3(0.0,0.0,1.0);
l9_489=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_488=float3(1.0,0.0,0.0);
l9_489=float3(0.0,0.0,1.0);
}
if (N111_ENABLE_ALIGNTOZ)
{
l9_488=float3(1.0,0.0,0.0);
l9_489=float3(0.0,1.0,0.0);
}
float2 l9_491=float2(cos(l9_469),sin(l9_469));
float2 l9_492=float2(-sin(l9_469),cos(l9_469));
float3 l9_493=float3((l9_488*l9_491.x)+(l9_489*l9_491.y));
float3 l9_494=float3((l9_488*l9_492.x)+(l9_489*l9_492.y));
if (N111_ENABLE_ALIGNTOVEL||N111_ENABLE_TRAILS)
{
if (N111_ENABLE_ALIGNTOVEL||N111_isTrail)
{
float3 l9_495=normalize(((l9_451+l9_316)+l9_317)+float3(N111_EPSILON));
float3 l9_496=l9_451*(l9_229-0.0099999998);
float3 l9_497=l9_451*(l9_229+0.0099999998);
l9_493=l9_495;
l9_494=normalize(cross(l9_493,l9_483));
if (N111_ENABLE_TRAILSPIN)
{
if (N111_isTrail)
{
l9_494=float3((l9_493*l9_491.x)+(l9_494*l9_491.y));
}
}
if (!N111_isTrail)
{
if (N111_ENABLE_IGNOREVEL)
{
l9_490=fast::max(N111_sizeVelScale,N111_EPSILON);
}
else
{
l9_490=length(l9_497-l9_496)*N111_sizeVelScale;
if (N111_ENABLE_IGNORETRANSFORMSCALE)
{
float4x4 l9_498=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_490=(length(l9_497-l9_496)/length(l9_498[0].xyz))*N111_sizeVelScale;
}
}
}
}
}
float4x4 l9_499=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_500=length(l9_499[0].xyz);
float2 l9_501=tempGlobals.Surface_UVCoord0;
float l9_502=l9_220;
float l9_503=l9_221;
float l9_504=l9_230;
float l9_505=N111_sizeSpeed;
float2 l9_506=(((l9_501-float2(0.5))*l9_470)*N111_pSize(l9_502,l9_503,l9_504,l9_505,N111_isTrail,N111_ENABLE_TRAILS,N111_trailHeadTime,N111_ENABLE_INDEPENDENTTRAIL,N111_trailSizeMult,N111_ENABLE_TRAILSIZERAMP,N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.trailSizeRampTex,sc_set0.trailSizeRampTexSmpSC,sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals))*l9_500;
float3 l9_507=(l9_460+(l9_494*l9_506.x))+(l9_493*(l9_506.y*l9_490));
N111_position=l9_507;
if ((N111_particleAlive<0.5)||(l9_470<0.5))
{
N111_position/=float3(0.0);
}
N111_normal=l9_483;
}
}
if (!N111_MESHTYPE_QUAD)
{
if (!N111_isTrail)
{
N111_position=N111_positionObjectSpace;
if (N111_ENABLE_CENTER_IN_BBOX)
{
float3 l9_508=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_509=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_510=(l9_508+l9_509)/float3(2.0);
N111_position-=l9_510;
}
float l9_511=l9_220;
float l9_512=l9_221;
float l9_513=l9_230;
float l9_514=N111_sizeSpeed;
N111_position=(N111_position*l9_443)*N111_pSize3D(l9_511,l9_512,l9_513,l9_514,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals);
if ((N111_particleAlive<0.5)||(l9_470<0.5))
{
N111_position.x=2.1474836e+09;
}
float3x3 l9_515;
if (((N111_ENABLE_ALIGNTOVEL||N111_ENABLE_ALIGNTOX)||N111_ENABLE_ALIGNTOY)||N111_ENABLE_ALIGNTOZ)
{
if (N111_ENABLE_ALIGNTOZ)
{
l9_515=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
}
else
{
float3 l9_516=float3(0.0);
if (N111_ENABLE_ALIGNTOX)
{
l9_516=float3(1.0,0.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_516=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOVEL)
{
float l9_517=0.001;
float3 l9_518=l9_319;
float l9_519=l9_229-l9_517;
float3 l9_520=N111_velocityDrag;
float3 l9_521=l9_235;
float l9_522=l9_230-l9_517;
float3 l9_523=float3(l9_519,l9_519,l9_519);
float3 l9_524=l9_520;
float l9_525;
if (l9_523.x<=0.0)
{
l9_525=0.0;
}
else
{
l9_525=pow(l9_523.x,l9_524.x);
}
float l9_526=l9_525;
float l9_527;
if (l9_523.y<=0.0)
{
l9_527=0.0;
}
else
{
l9_527=pow(l9_523.y,l9_524.y);
}
float l9_528=l9_527;
float l9_529;
if (l9_523.z<=0.0)
{
l9_529=0.0;
}
else
{
l9_529=pow(l9_523.z,l9_524.z);
}
float3 l9_530=float3(l9_526,l9_528,l9_529);
float3 l9_531=l9_530;
float3 l9_532=(l9_518+l9_521)*l9_531;
if (N111_ENABLE_VELRAMP)
{
float l9_533=floor(l9_522*10000.0)/10000.0;
float2 l9_534=tempGlobals.Surface_UVCoord0;
float2 l9_535=(l9_534/float2(10000.0,1.0))+float2(l9_533,0.0);
float2 l9_536=l9_535;
float4 l9_537=float4(0.0);
int l9_538=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_539=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_539=0;
}
else
{
l9_539=gl_InstanceIndex%2;
}
int l9_540=l9_539;
l9_538=1-l9_540;
}
else
{
int l9_541=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_541=0;
}
else
{
l9_541=gl_InstanceIndex%2;
}
int l9_542=l9_541;
l9_538=l9_542;
}
int l9_543=l9_538;
int l9_544=velRampTextureLayout_tmp;
int l9_545=l9_543;
float2 l9_546=l9_536;
bool l9_547=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_548=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_549=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_550=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_551=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_552=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_553=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_554=0.0;
bool l9_555=l9_552&&(!l9_550);
float l9_556=1.0;
float l9_557=l9_546.x;
int l9_558=l9_549.x;
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
l9_546.x=l9_557;
float l9_562=l9_546.y;
int l9_563=l9_549.y;
if (l9_563==1)
{
l9_562=fract(l9_562);
}
else
{
if (l9_563==2)
{
float l9_564=fract(l9_562);
float l9_565=l9_562-l9_564;
float l9_566=step(0.25,fract(l9_565*0.5));
l9_562=mix(l9_564,1.0-l9_564,fast::clamp(l9_566,0.0,1.0));
}
}
l9_546.y=l9_562;
if (l9_550)
{
bool l9_567=l9_552;
bool l9_568;
if (l9_567)
{
l9_568=l9_549.x==3;
}
else
{
l9_568=l9_567;
}
float l9_569=l9_546.x;
float l9_570=l9_551.x;
float l9_571=l9_551.z;
bool l9_572=l9_568;
float l9_573=l9_556;
float l9_574=fast::clamp(l9_569,l9_570,l9_571);
float l9_575=step(abs(l9_569-l9_574),9.9999997e-06);
l9_573*=(l9_575+((1.0-float(l9_572))*(1.0-l9_575)));
l9_569=l9_574;
l9_546.x=l9_569;
l9_556=l9_573;
bool l9_576=l9_552;
bool l9_577;
if (l9_576)
{
l9_577=l9_549.y==3;
}
else
{
l9_577=l9_576;
}
float l9_578=l9_546.y;
float l9_579=l9_551.y;
float l9_580=l9_551.w;
bool l9_581=l9_577;
float l9_582=l9_556;
float l9_583=fast::clamp(l9_578,l9_579,l9_580);
float l9_584=step(abs(l9_578-l9_583),9.9999997e-06);
l9_582*=(l9_584+((1.0-float(l9_581))*(1.0-l9_584)));
l9_578=l9_583;
l9_546.y=l9_578;
l9_556=l9_582;
}
float2 l9_585=l9_546;
bool l9_586=l9_547;
float3x3 l9_587=l9_548;
if (l9_586)
{
l9_585=float2((l9_587*float3(l9_585,1.0)).xy);
}
float2 l9_588=l9_585;
float2 l9_589=l9_588;
float2 l9_590=l9_589;
l9_546=l9_590;
float l9_591=l9_546.x;
int l9_592=l9_549.x;
bool l9_593=l9_555;
float l9_594=l9_556;
if ((l9_592==0)||(l9_592==3))
{
float l9_595=l9_591;
float l9_596=0.0;
float l9_597=1.0;
bool l9_598=l9_593;
float l9_599=l9_594;
float l9_600=fast::clamp(l9_595,l9_596,l9_597);
float l9_601=step(abs(l9_595-l9_600),9.9999997e-06);
l9_599*=(l9_601+((1.0-float(l9_598))*(1.0-l9_601)));
l9_595=l9_600;
l9_591=l9_595;
l9_594=l9_599;
}
l9_546.x=l9_591;
l9_556=l9_594;
float l9_602=l9_546.y;
int l9_603=l9_549.y;
bool l9_604=l9_555;
float l9_605=l9_556;
if ((l9_603==0)||(l9_603==3))
{
float l9_606=l9_602;
float l9_607=0.0;
float l9_608=1.0;
bool l9_609=l9_604;
float l9_610=l9_605;
float l9_611=fast::clamp(l9_606,l9_607,l9_608);
float l9_612=step(abs(l9_606-l9_611),9.9999997e-06);
l9_610*=(l9_612+((1.0-float(l9_609))*(1.0-l9_612)));
l9_606=l9_611;
l9_602=l9_606;
l9_605=l9_610;
}
l9_546.y=l9_602;
l9_556=l9_605;
float2 l9_613=l9_546;
int l9_614=l9_544;
int l9_615=l9_545;
float l9_616=l9_554;
float2 l9_617=l9_613;
int l9_618=l9_614;
int l9_619=l9_615;
float3 l9_620=float3(0.0);
if (l9_618==0)
{
l9_620=float3(l9_617,0.0);
}
else
{
if (l9_618==1)
{
l9_620=float3(l9_617.x,(l9_617.y*0.5)+(0.5-(float(l9_619)*0.5)),0.0);
}
else
{
l9_620=float3(l9_617,float(l9_619));
}
}
float3 l9_621=l9_620;
float3 l9_622=l9_621;
float2 l9_623=l9_622.xy;
float l9_624=l9_616;
float4 l9_625=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_623,level(l9_624));
float4 l9_626=l9_625;
float4 l9_627=l9_626;
if (l9_552)
{
l9_627=mix(l9_553,l9_627,float4(l9_556));
}
float4 l9_628=l9_627;
l9_537=l9_628;
float4 l9_629=l9_537;
float3 l9_630=l9_629.xyz;
l9_532=(l9_518+l9_521)*l9_630;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_532=l9_518*l9_531;
}
}
float3 l9_631=l9_532;
float3 l9_632=l9_631;
float l9_633=((N111_gravity/2.0)*(l9_229-l9_517))*(l9_229-l9_517);
l9_316.y-=l9_633;
if (N111_ENABLE_FORCE)
{
float3 l9_634=float3(((N111_localForce/float3(2.0))*(l9_229-l9_517))*(l9_229-l9_517));
l9_317-=l9_634;
}
if (N111_WORLDFORCE)
{
float4x4 l9_635=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_636=l9_635;
float4 l9_637=l9_636[0];
float4 l9_638=l9_636[1];
float4 l9_639=l9_636[2];
float3x3 l9_640=float3x3(float3(float3(l9_637.x,l9_638.x,l9_639.x)),float3(float3(l9_637.y,l9_638.y,l9_639.y)),float3(float3(l9_637.z,l9_638.z,l9_639.z)));
float3x3 l9_641=l9_640;
l9_516=(((l9_318-l9_632)*l9_641)+l9_316)+l9_317;
}
else
{
if (N111_WORLDSPACE)
{
l9_516=((l9_318-l9_632)+l9_316)+l9_317;
}
else
{
float4x4 l9_642=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_643=l9_642;
float4 l9_644=l9_643[0];
float4 l9_645=l9_643[1];
float4 l9_646=l9_643[2];
float3x3 l9_647=float3x3(float3(float3(l9_644.x,l9_645.x,l9_646.x)),float3(float3(l9_644.y,l9_645.y,l9_646.y)),float3(float3(l9_644.z,l9_645.z,l9_646.z)));
float3x3 l9_648=l9_647;
l9_516=(((l9_318-l9_632)+l9_317)+l9_316)*l9_648;
}
}
l9_516=normalize(l9_516+float3(N111_EPSILON));
}
float3 l9_649=float3(0.0,0.0,1.0);
float3 l9_650=cross(l9_516,l9_649);
float3 l9_651=normalize(l9_650);
float l9_652=length(l9_650);
float l9_653=dot(l9_649,l9_516);
float l9_654=1.0-l9_653;
l9_515=float3x3(float3(((l9_654*l9_651.x)*l9_651.x)+l9_653,((l9_654*l9_651.x)*l9_651.y)-(l9_651.z*l9_652),((l9_654*l9_651.z)*l9_651.x)+(l9_651.y*l9_652)),float3(((l9_654*l9_651.x)*l9_651.y)+(l9_651.z*l9_652),((l9_654*l9_651.y)*l9_651.y)+l9_653,((l9_654*l9_651.y)*l9_651.z)-(l9_651.x*l9_652)),float3(((l9_654*l9_651.z)*l9_651.x)-(l9_651.y*l9_652),((l9_654*l9_651.y)*l9_651.z)+(l9_651.x*l9_652),((l9_654*l9_651.z)*l9_651.z)+l9_653));
}
float3x3 l9_655=float3x3(float3(cos(l9_469),-sin(l9_469),0.0),float3(sin(l9_469),cos(l9_469),0.0),float3(0.0,0.0,1.0));
l9_515=l9_515*l9_655;
if (N111_ENABLE_ALIGNTOVEL&&(!N111_ENABLE_IGNOREVEL))
{
float3 l9_656=l9_451*(l9_229-0.0099999998);
float3 l9_657=l9_451*(l9_229+0.0099999998);
N111_position.z*=(length(l9_657-l9_656)*fast::max(N111_sizeVelScale,0.1));
}
}
else
{
float l9_658=fract((N111_particleSeed.x*92.653008)+N111_globalSeed);
float l9_659=mix(N111_rotationRandomX.x,N111_rotationRandomX.y,l9_658);
float l9_660=mix(N111_rotationRateX.x,N111_rotationRateX.y,l9_658);
float l9_661=((l9_660*l9_466)*l9_230)*2.0;
float l9_662=fract((N111_particleSeed.y*6.7557559)+N111_globalSeed);
float l9_663=mix(N111_rotationRandomY.x,N111_rotationRandomY.y,l9_662);
float l9_664=mix(N111_rotationRateY.x,N111_rotationRateY.y,l9_662);
float l9_665=((l9_664*l9_466)*l9_230)*2.0;
float l9_666=N111_PI*(l9_661+l9_659);
float l9_667=N111_PI*(l9_665+l9_663);
float l9_668=N111_PI*(l9_468+l9_461);
float3 l9_669=float3(l9_666,l9_667,l9_668);
float l9_670=cos(l9_669.x);
float l9_671=sin(l9_669.x);
float l9_672=cos(l9_669.y);
float l9_673=sin(l9_669.y);
float l9_674=cos(l9_669.z);
float l9_675=sin(l9_669.z);
l9_515=float3x3(float3(l9_672*l9_674,(l9_670*l9_675)+((l9_671*l9_673)*l9_674),(l9_671*l9_675)-((l9_670*l9_673)*l9_674)),float3((-l9_672)*l9_675,(l9_670*l9_674)-((l9_671*l9_673)*l9_675),(l9_671*l9_674)+((l9_670*l9_673)*l9_675)),float3(l9_673,(-l9_671)*l9_672,l9_670*l9_672));
}
if ((!N111_WORLDSPACE)&&(!N111_ENABLE_ALIGNTOVEL))
{
float4x4 l9_676=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_677=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_678=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3x3 l9_679=float3x3(float3(l9_676[0].xyz/float3(l9_443.x)),float3(l9_677[1].xyz/float3(l9_443.y)),float3(l9_678[2].xyz/float3(l9_443.z)));
l9_515=l9_679*l9_515;
}
N111_position=l9_515*N111_position;
N111_normal=normalize(l9_515*N111_normalObjectSpace);
N111_position+=l9_460;
}
}
N111_timeValues=float4(l9_228,l9_229,l9_230);
param_130=N111_position;
position_N111=param_130;
WorldPosition=position_N111;
float Output_N3_1=0.0;
float param_132=(*sc_set0.UserUniforms).timeGlobal;
Output_N3_1=param_132;
float Output_N5_1=0.0;
float param_133=(*sc_set0.UserUniforms).externalTimeInput;
Output_N5_1=param_133;
float Output_N7_1=0.0;
float param_134=(*sc_set0.UserUniforms).externalSeed;
Output_N7_1=param_134;
float Output_N9_1=0.0;
float param_135=(*sc_set0.UserUniforms).lifeTimeConstant;
Output_N9_1=param_135;
float2 Output_N10_1=float2(0.0);
float2 param_136=(*sc_set0.UserUniforms).lifeTimeMinMax;
Output_N10_1=param_136;
float Output_N12_1=0.0;
float param_137=(*sc_set0.UserUniforms).spawnDuration;
Output_N12_1=param_137;
float Output_N192_1=0.0;
float param_138;
if ((int(TRAILS_tmp)!=0))
{
param_138=1.001;
}
else
{
param_138=0.001;
}
param_138-=0.001;
Output_N192_1=param_138;
float Output_N180_1=0.0;
float param_139=(*sc_set0.UserUniforms).trailLength;
Output_N180_1=param_139;
float4 Color_N168_1=float4(0.0);
Color_N168_1=Globals.VertexColor;
float Output_N217_1=0.0;
Output_N217_1=Color_N168_1.x;
float Result_N218_1=0.0;
float l9_680=Output_N192_1;
bool l9_681=(l9_680*1.0)!=0.0;
bool l9_682;
if (l9_681)
{
l9_682=(Output_N217_1*1.0)!=0.0;
}
else
{
l9_682=l9_681;
}
Result_N218_1=float(l9_682);
float3 particleSeed_N181_1=float3(0.0);
float globalSeed_N181_1=0.0;
float particleAlive_N181_1=0.0;
float4 timeValues_N181_1=float4(0.0);
float isTrail_N181_1=0.0;
float2 trailHeadTime_N181_1=float2(0.0);
float param_140=Output_N3_1;
float param_141=Output_N5_1;
float param_142=Output_N7_1;
float param_143=Output_N9_1;
float2 param_144=Output_N10_1;
float param_145=Output_N12_1;
float param_146=Output_N180_1;
float param_147=Result_N218_1;
ssGlobals param_154=Globals;
tempGlobals=param_154;
float3 param_148=float3(0.0);
float param_149=0.0;
float param_150=0.0;
float4 param_151=float4(0.0);
float param_152=0.0;
float2 param_153=float2(0.0);
N181_timeGlobal=param_140;
N181_ENABLE_EXTERNALTIME=(int(EXTERNALTIME_tmp)!=0);
N181_externalTime=param_141;
N181_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N181_externalSeed=param_142;
N181_ENABLE_LIFETIMEMINMAX=(int(LIFETIMEMINMAX_tmp)!=0);
N181_lifeTimeConstant=param_143;
N181_lifeTimeMinMax=param_144;
N181_ENABLE_INSTANTSPAWN=(int(INSTANTSPAWN_tmp)!=0);
N181_spawnDuration=param_145;
N181_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N181_trailLength=param_146;
N181_isTrailCondition=param_147!=0.0;
N181_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
float l9_683=0.0;
if (N181_ENABLE_WORLDPOSSEED)
{
float4x4 l9_684=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_683=length(float4(1.0)*l9_684);
}
N181_globalSeed=N181_externalSeed+l9_683;
int l9_685=0;
int l9_686=gl_InstanceIndex;
l9_685=l9_686;
int l9_687=l9_685;
float l9_688=float(l9_687);
int l9_689=int(l9_688);
int l9_690=l9_689^(l9_689*15299);
int l9_691=l9_690;
int l9_692=l9_691;
int l9_693=((l9_692*((l9_692*1471343)+101146501))+1559861749)&2147483647;
int l9_694=l9_693;
int l9_695=l9_691*1399;
int l9_696=((l9_695*((l9_695*1471343)+101146501))+1559861749)&2147483647;
int l9_697=l9_696;
int l9_698=l9_691*7177;
int l9_699=((l9_698*((l9_698*1471343)+101146501))+1559861749)&2147483647;
int l9_700=l9_699;
int l9_701=l9_694;
float l9_702=float(l9_701)*4.6566129e-10;
int l9_703=l9_697;
float l9_704=float(l9_703)*4.6566129e-10;
int l9_705=l9_700;
float l9_706=float(l9_705)*4.6566129e-10;
float3 l9_707=float3(l9_702,l9_704,l9_706);
float3 l9_708=l9_707;
N181_particleSeed=l9_708;
float l9_709=fract((N181_particleSeed.y*12.12358)+N181_globalSeed);
float l9_710=fract((N181_particleSeed.z*3.5358)+N181_globalSeed);
float2 l9_711;
if (N181_ENABLE_LIFETIMEMINMAX)
{
l9_711=N181_lifeTimeMinMax;
}
else
{
l9_711=float2(N181_lifeTimeConstant);
}
float2 l9_712=l9_711;
float l9_713=fast::max(l9_712.x,0.0099999998);
float l9_714=fast::max(l9_712.y,0.0099999998);
float l9_715=tempGlobals.gTimeElapsed;
float l9_716=l9_715;
if (N181_ENABLE_EXTERNALTIME)
{
l9_716=N181_externalTime;
}
float l9_717=l9_716;
if (N181_ENABLE_INSTANTSPAWN)
{
l9_717=N181_timeGlobal*l9_716;
}
else
{
float l9_718=0.0;
if (N181_ENABLE_TRAILS)
{
if (N181_ENABLE_INDEPENDENTTRAIL)
{
l9_718=N181_trailLength;
}
}
float l9_719=fract(((l9_716*N181_timeGlobal)*(1.0/(l9_712.y+l9_718)))+l9_709);
l9_717=l9_719*(l9_712.y+l9_718);
}
float l9_720=mix(l9_717/l9_713,l9_717/l9_714,l9_710);
float l9_721=fast::clamp(l9_720,0.0,1.0);
N181_isTrail=0.0;
N181_trailHeadTime=float2(l9_717,l9_721);
if (N181_ENABLE_TRAILS)
{
if (N181_isTrailCondition)
{
N181_isTrail=1.0;
float2 l9_722=tempGlobals.Surface_UVCoord0;
l9_717-=(l9_722.y*N181_trailLength);
l9_720=mix(l9_717/l9_713,l9_717/l9_714,l9_710);
l9_721=fast::clamp(l9_720,0.0,1.0);
}
}
float l9_723=0.0;
if (!N181_ENABLE_INSTANTSPAWN)
{
if (N181_spawnDuration>0.0)
{
if ((l9_716-N181_spawnDuration)>=l9_717)
{
l9_723=1.0;
}
}
}
float l9_724=l9_720+l9_723;
N181_particleAlive=1.0;
if ((l9_724>0.99989998)||(l9_717<=0.0))
{
N181_particleAlive=0.0;
}
N181_timeValues=float4(l9_712,l9_717,l9_721);
param_148=N181_particleSeed;
param_149=N181_globalSeed;
param_150=N181_particleAlive;
param_151=N181_timeValues;
param_152=N181_isTrail;
param_153=N181_trailHeadTime;
particleSeed_N181_1=param_148;
globalSeed_N181_1=param_149;
particleAlive_N181_1=param_150;
timeValues_N181_1=param_151;
isTrail_N181_1=param_152;
trailHeadTime_N181_1=param_153;
float2 Output_N183_1=float2(0.0);
float2 param_155=(*sc_set0.UserUniforms).trailTaper;
Output_N183_1=param_155;
float Output_N188_1=0.0;
float param_156=(*sc_set0.UserUniforms).trailWidth;
Output_N188_1=param_156;
float3 Position_N114_1=float3(0.0);
Position_N114_1=Globals.SurfacePosition_ObjectSpace;
float3 Normal_N172_1=float3(0.0);
Normal_N172_1=Globals.VertexNormal_ObjectSpace;
float3 Output_N16_1=float3(0.0);
float3 param_157=(*sc_set0.UserUniforms).spawnLocation;
Output_N16_1=param_157;
float3 Output_N18_1=float3(0.0);
float3 param_158=(*sc_set0.UserUniforms).spawnBox;
Output_N18_1=param_158;
float3 Output_N20_1=float3(0.0);
float3 param_159=(*sc_set0.UserUniforms).spawnSphere;
Output_N20_1=param_159;
float3 Output_N39_1=float3(0.0);
float3 param_160=(*sc_set0.UserUniforms).noiseMult;
Output_N39_1=param_160;
float3 Output_N40_1=float3(0.0);
float3 param_161=(*sc_set0.UserUniforms).noiseFrequency;
Output_N40_1=param_161;
float3 Output_N41_1=float3(0.0);
float3 param_162=(*sc_set0.UserUniforms).sNoiseMult;
Output_N41_1=param_162;
float3 Output_N42_1=float3(0.0);
float3 param_163=(*sc_set0.UserUniforms).sNoiseFrequency;
Output_N42_1=param_163;
float3 Output_N34_1=float3(0.0);
float3 param_164=(*sc_set0.UserUniforms).velocityMin;
Output_N34_1=param_164;
float3 Output_N35_1=float3(0.0);
float3 param_165=(*sc_set0.UserUniforms).velocityMax;
Output_N35_1=param_165;
float3 Output_N36_1=float3(0.0);
float3 param_166=(*sc_set0.UserUniforms).velocityDrag;
Output_N36_1=param_166;
float3 Result_N70_1=float3(0.0);
float3 param_167=float3(0.0);
float3 param_168=float3(0.0);
float3 param_169;
if (MESHTYPE_tmp==0)
{
float2 l9_725=float2(0.0);
float2 l9_726=(*sc_set0.UserUniforms).sizeStart;
l9_725=l9_726;
param_167=float3(l9_725,0.0);
param_169=param_167;
}
else
{
float3 l9_727=float3(0.0);
float3 l9_728=(*sc_set0.UserUniforms).sizeStart3D;
l9_727=l9_728;
param_168=l9_727;
param_169=param_168;
}
Result_N70_1=param_169;
float3 Result_N121_1=float3(0.0);
float3 param_170=float3(0.0);
float3 param_171=float3(0.0);
float3 param_172;
if (MESHTYPE_tmp==0)
{
float2 l9_729=float2(0.0);
float2 l9_730=(*sc_set0.UserUniforms).sizeEnd;
l9_729=l9_730;
param_170=float3(l9_729,0.0);
param_172=param_170;
}
else
{
float3 l9_731=float3(0.0);
float3 l9_732=(*sc_set0.UserUniforms).sizeEnd3D;
l9_731=l9_732;
param_171=l9_731;
param_172=param_171;
}
Result_N121_1=param_172;
float3 Result_N124_1=float3(0.0);
float3 param_173=float3(0.0);
float3 param_174=float3(0.0);
float3 param_175;
if (MESHTYPE_tmp==0)
{
float2 l9_733=float2(0.0);
float2 l9_734=(*sc_set0.UserUniforms).sizeStartMin;
l9_733=l9_734;
param_173=float3(l9_733,0.0);
param_175=param_173;
}
else
{
float3 l9_735=float3(0.0);
float3 l9_736=(*sc_set0.UserUniforms).sizeStartMin3D;
l9_735=l9_736;
param_174=l9_735;
param_175=param_174;
}
Result_N124_1=param_175;
float3 Result_N123_1=float3(0.0);
float3 param_176=float3(0.0);
float3 param_177=float3(0.0);
float3 param_178;
if (MESHTYPE_tmp==0)
{
float2 l9_737=float2(0.0);
float2 l9_738=(*sc_set0.UserUniforms).sizeStartMax;
l9_737=l9_738;
param_176=float3(l9_737,0.0);
param_178=param_176;
}
else
{
float3 l9_739=float3(0.0);
float3 l9_740=(*sc_set0.UserUniforms).sizeStartMax3D;
l9_739=l9_740;
param_177=l9_739;
param_178=param_177;
}
Result_N123_1=param_178;
float3 Result_N125_1=float3(0.0);
float3 param_179=float3(0.0);
float3 param_180=float3(0.0);
float3 param_181;
if (MESHTYPE_tmp==0)
{
float2 l9_741=float2(0.0);
float2 l9_742=(*sc_set0.UserUniforms).sizeEndMin;
l9_741=l9_742;
param_179=float3(l9_741,0.0);
param_181=param_179;
}
else
{
float3 l9_743=float3(0.0);
float3 l9_744=(*sc_set0.UserUniforms).sizeEndMin3D;
l9_743=l9_744;
param_180=l9_743;
param_181=param_180;
}
Result_N125_1=param_181;
float3 Result_N126_1=float3(0.0);
float3 param_182=float3(0.0);
float3 param_183=float3(0.0);
float3 param_184;
if (MESHTYPE_tmp==0)
{
float2 l9_745=float2(0.0);
float2 l9_746=(*sc_set0.UserUniforms).sizeEndMax;
l9_745=l9_746;
param_182=float3(l9_745,0.0);
param_184=param_182;
}
else
{
float3 l9_747=float3(0.0);
float3 l9_748=(*sc_set0.UserUniforms).sizeEndMax3D;
l9_747=l9_748;
param_183=l9_747;
param_184=param_183;
}
Result_N126_1=param_184;
float Output_N27_1=0.0;
float param_185=(*sc_set0.UserUniforms).sizeSpeed;
Output_N27_1=param_185;
float Output_N195_1=0.0;
float param_186;
if ((int(ENABLE_SIZERAMPSTARTENDASBOUNDS_tmp)!=0))
{
param_186=1.001;
}
else
{
param_186=0.001;
}
param_186-=0.001;
Output_N195_1=param_186;
float Output_N55_1=0.0;
float param_187=(*sc_set0.UserUniforms).gravity;
Output_N55_1=param_187;
float3 Output_N46_1=float3(0.0);
float3 param_188=(*sc_set0.UserUniforms).localForce;
Output_N46_1=param_188;
float Output_N51_1=0.0;
float param_189=(*sc_set0.UserUniforms).sizeVelScale;
Output_N51_1=param_189;
float Output_N48_1=0.0;
float param_190=float((*sc_set0.UserUniforms).ALIGNTOX!=0);
Output_N48_1=param_190;
float Output_N49_1=0.0;
float param_191=float((*sc_set0.UserUniforms).ALIGNTOY!=0);
Output_N49_1=param_191;
float Output_N50_1=0.0;
float param_192=float((*sc_set0.UserUniforms).ALIGNTOZ!=0);
Output_N50_1=param_192;
float2 Output_N138_1=float2(0.0);
float2 param_193=(*sc_set0.UserUniforms).Port_Input1_N138;
float2 param_194=float2(0.0);
float2 param_195;
if (MESHTYPE_tmp==0)
{
param_195=param_193;
}
else
{
float2 l9_749=float2(0.0);
float2 l9_750=(*sc_set0.UserUniforms).rotationRandomX;
l9_749=l9_750;
param_194=l9_749;
param_195=param_194;
}
Output_N138_1=param_195;
float2 Output_N139_1=float2(0.0);
float2 param_196=(*sc_set0.UserUniforms).Port_Input1_N139;
float2 param_197=float2(0.0);
float2 param_198;
if (MESHTYPE_tmp==0)
{
param_198=param_196;
}
else
{
float2 l9_751=float2(0.0);
float2 l9_752=(*sc_set0.UserUniforms).rotationRateX;
l9_751=l9_752;
param_197=l9_751;
param_198=param_197;
}
Output_N139_1=param_198;
float2 Output_N140_1=float2(0.0);
float2 param_199=(*sc_set0.UserUniforms).Port_Input1_N140;
float2 param_200=float2(0.0);
float2 param_201;
if (MESHTYPE_tmp==0)
{
param_201=param_199;
}
else
{
float2 l9_753=float2(0.0);
float2 l9_754=(*sc_set0.UserUniforms).randomRotationY;
l9_753=l9_754;
param_200=l9_753;
param_201=param_200;
}
Output_N140_1=param_201;
float2 Output_N144_1=float2(0.0);
float2 param_202=(*sc_set0.UserUniforms).Port_Input1_N144;
float2 param_203=float2(0.0);
float2 param_204;
if (MESHTYPE_tmp==0)
{
param_204=param_202;
}
else
{
float2 l9_755=float2(0.0);
float2 l9_756=(*sc_set0.UserUniforms).rotationRateY;
l9_755=l9_756;
param_203=l9_755;
param_204=param_203;
}
Output_N144_1=param_204;
float2 Output_N135_1=float2(0.0);
float2 param_205=float2(1.0);
float2 param_206=float2(0.0);
float2 param_207;
if (MESHTYPE_tmp==0)
{
float2 l9_757=float2(0.0);
float2 l9_758=(*sc_set0.UserUniforms).rotationRandom;
l9_757=l9_758;
param_205=l9_757;
param_207=param_205;
}
else
{
float2 l9_759=float2(0.0);
float2 l9_760=(*sc_set0.UserUniforms).randomRotationZ;
l9_759=l9_760;
param_206=l9_759;
param_207=param_206;
}
Output_N135_1=param_207;
float2 Output_N137_1=float2(0.0);
float2 param_208=float2(1.0);
float2 param_209=float2(0.0);
float2 param_210;
if (MESHTYPE_tmp==0)
{
float2 l9_761=float2(0.0);
float2 l9_762=(*sc_set0.UserUniforms).rotationRate;
l9_761=l9_762;
param_208=l9_761;
param_210=param_208;
}
else
{
float2 l9_763=float2(0.0);
float2 l9_764=(*sc_set0.UserUniforms).rotationRateZ;
l9_763=l9_764;
param_209=l9_763;
param_210=param_209;
}
Output_N137_1=param_210;
float Output_N54_1=0.0;
float param_211=(*sc_set0.UserUniforms).rotationDrag;
Output_N54_1=param_211;
float Output_N110_1=0.0;
float param_212=(*sc_set0.UserUniforms).Port_Input1_N110;
float param_213=0.0;
float param_214;
if (MESHTYPE_tmp==0)
{
param_214=param_212;
}
else
{
float l9_765=0.0;
float l9_766=float((*sc_set0.UserUniforms).CENTER_BBOX!=0);
l9_765=l9_766;
param_213=l9_765;
param_214=param_213;
}
Output_N110_1=param_214;
float Output_N176_1=0.0;
float param_215=(*sc_set0.UserUniforms).fadeDistanceVisible;
Output_N176_1=param_215;
float Output_N178_1=0.0;
float param_216=(*sc_set0.UserUniforms).fadeDistanceInvisible;
Output_N178_1=param_216;
float3 normal_N111=float3(0.0);
float3 param_217=particleSeed_N181_1;
float param_218=globalSeed_N181_1;
float param_219=particleAlive_N181_1;
float4 param_220=timeValues_N181_1;
float param_221=isTrail_N181_1;
float2 param_222=trailHeadTime_N181_1;
float2 param_223=Output_N183_1;
float param_224=Output_N188_1;
float3 param_225=Position_N114_1;
float3 param_226=Normal_N172_1;
float3 param_227=Output_N16_1;
float3 param_228=Output_N18_1;
float3 param_229=Output_N20_1;
float3 param_230=Output_N39_1;
float3 param_231=Output_N40_1;
float3 param_232=Output_N41_1;
float3 param_233=Output_N42_1;
float3 param_234=Output_N34_1;
float3 param_235=Output_N35_1;
float3 param_236=Output_N36_1;
float3 param_237=Result_N70_1;
float3 param_238=Result_N121_1;
float3 param_239=Result_N124_1;
float3 param_240=Result_N123_1;
float3 param_241=Result_N125_1;
float3 param_242=Result_N126_1;
float param_243=Output_N27_1;
float param_244=Output_N195_1;
float param_245=Output_N55_1;
float3 param_246=Output_N46_1;
float param_247=Output_N51_1;
float param_248=Output_N48_1;
float param_249=Output_N49_1;
float param_250=Output_N50_1;
float2 param_251=Output_N138_1;
float2 param_252=Output_N139_1;
float2 param_253=Output_N140_1;
float2 param_254=Output_N144_1;
float2 param_255=Output_N135_1;
float2 param_256=Output_N137_1;
float param_257=Output_N54_1;
float param_258=Output_N110_1;
float param_259=Output_N176_1;
float param_260=Output_N178_1;
ssGlobals param_262=Globals;
tempGlobals=param_262;
float3 param_261=float3(0.0);
N111_MESHTYPE_QUAD=MESHTYPE_tmp==0;
N111_particleSeedIn=param_217;
N111_globalSeedIn=param_218;
N111_particleAlive=param_219;
N111_timeValuesIn=param_220;
N111_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N111_isTrail=param_221!=0.0;
N111_trailHeadTime=param_222;
N111_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N111_taper=param_223;
N111_ENABLE_TRAILSPIN=(int(TRAILTWIST_tmp)!=0);
N111_trailSizeMult=param_224;
N111_ENABLE_TRAILSIZERAMP=(int(TRAILSIZERAMP_tmp)!=0);
N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS=(int(TRAILSIZERAMPSTARTENDASBOUNDS_tmp)!=0);
N111_positionObjectSpace=param_225;
N111_normalObjectSpace=param_226;
N111_ENABLE_INILOCATION=(int(INILOCATION_tmp)!=0);
N111_spawnLocation=param_227;
N111_ENABLE_BOXSPAWN=(int(BOXSPAWN_tmp)!=0);
N111_spawnBox=param_228;
N111_ENABLE_SPHERESPAWN=(int(SPHERESPAWN_tmp)!=0);
N111_spawnSphere=param_229;
N111_ENABLE_NOISE=(int(NOISE_tmp)!=0);
N111_noiseMult=param_230;
N111_noiseFrequency=param_231;
N111_ENABLE_SNOISE=(int(SNOISE_tmp)!=0);
N111_sNoiseMult=param_232;
N111_sNoiseFrequency=param_233;
N111_ENABLE_VELRAMP=(int(VELRAMP_tmp)!=0);
N111_velocityMin=param_234;
N111_velocityMax=param_235;
N111_velocityDrag=param_236;
N111_sizeStart=param_237;
N111_sizeEnd=param_238;
N111_ENABLE_SIZEMINMAX=(int(SIZEMINMAX_tmp)!=0);
N111_sizeStartMin=param_239;
N111_sizeStartMax=param_240;
N111_sizeEndMin=param_241;
N111_sizeEndMax=param_242;
N111_sizeSpeed=param_243;
N111_ENABLE_SIZERAMP=(int(SIZERAMP_tmp)!=0);
N111_ENABLE_SIZERAMPSTARTENDASBOUNDS=param_244!=0.0;
N111_gravity=param_245;
N111_ENABLE_FORCE=(int(FORCE_tmp)!=0);
N111_localForce=param_246;
N111_ENABLE_ALIGNQUADTOCAMERAUP=(int(ALIGNTOCAMERAUP_tmp)!=0);
N111_ENABLE_ALIGNTOVEL=(int(VELOCITYDIR_tmp)!=0);
N111_sizeVelScale=param_247;
N111_ENABLE_IGNOREVEL=(int(IGNOREVEL_tmp)!=0);
N111_ENABLE_IGNORETRANSFORMSCALE=(int(IGNORETRANSFORMSCALE_tmp)!=0);
N111_ENABLE_ALIGNTOX=param_248!=0.0;
N111_ENABLE_ALIGNTOY=param_249!=0.0;
N111_ENABLE_ALIGNTOZ=param_250!=0.0;
N111_rotationRandomX=param_251;
N111_rotationRateX=param_252;
N111_rotationRandomY=param_253;
N111_rotationRateY=param_254;
N111_rotationRandomZ=param_255;
N111_rotationRateZ=param_256;
N111_rotationDrag=param_257;
N111_WORLDSPACE=rotationSpace_tmp==1;
N111_WORLDFORCE=rotationSpace_tmp==2;
N111_ENABLE_CENTER_IN_BBOX=param_258!=0.0;
N111_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N111_fadeDistanceVisible=param_259;
N111_fadeDistanceInvisible=param_260;
float3 l9_767=float3(0.0);
N111_particleSeed=N111_particleSeedIn;
N111_globalSeed=N111_globalSeedIn;
float l9_768=N111_particleSeed.x;
float l9_769=N111_particleSeed.y;
float l9_770=N111_particleSeed.z;
float3 l9_771=fract((float3(l9_768,l9_769,l9_770)*3048.28)+float3(N111_globalSeed))-float3(0.5);
float3 l9_772=fract((N111_particleSeed*374.57129)+float3(N111_globalSeed))-float3(0.5);
float3 l9_773=normalize(l9_772+float3(N111_EPSILON));
float l9_774=fract(N111_particleSeed.x+N111_globalSeed);
float l9_775=l9_774;
float l9_776=0.33333334;
float l9_777;
if (l9_775<=0.0)
{
l9_777=0.0;
}
else
{
l9_777=pow(l9_775,l9_776);
}
float l9_778=l9_777;
float l9_779=l9_778;
l9_773*=l9_779;
l9_773/=float3(2.0);
float l9_780=fract((N111_particleSeed.x*334.59122)+N111_globalSeed)-0.5;
float l9_781=fract((N111_particleSeed.y*41.231232)+N111_globalSeed)-0.5;
float l9_782=fract((N111_particleSeed.z*18.984529)+N111_globalSeed);
float l9_783=fract((N111_particleSeed.x*654.15588)+N111_globalSeed);
float l9_784=fract((N111_particleSeed.y*45.722408)+N111_globalSeed);
float3 l9_785=(float3(l9_783,l9_784,l9_782)-float3(0.5))*2.0;
float3 l9_786=float3(l9_783,l9_784,l9_782);
float l9_787=fract((N111_particleSeed.z*15.32451)+N111_globalSeed);
float2 l9_788=N111_timeValuesIn.xy;
float l9_789=N111_timeValuesIn.z;
float l9_790=N111_timeValuesIn.w;
N111_cameraFade_trailHeadTime_taper=float4(0.0);
float3 l9_791=l9_767;
float3 l9_792=l9_767;
float3 l9_793=l9_767;
if (N111_ENABLE_INILOCATION)
{
l9_793=N111_spawnLocation;
}
if (N111_ENABLE_BOXSPAWN)
{
l9_791=N111_spawnBox*l9_771;
}
if (N111_ENABLE_SPHERESPAWN)
{
l9_792=N111_spawnSphere*l9_773;
}
float3 l9_794=(l9_793+l9_792)+l9_791;
float3 l9_795=l9_767;
if (N111_ENABLE_NOISE)
{
float3 l9_796=N111_noiseFrequency;
float3 l9_797=N111_noiseMult;
float3 l9_798=l9_785;
float l9_799=l9_790;
float l9_800=sin(l9_799*l9_796.x);
float l9_801=sin(l9_799*l9_796.y);
float l9_802=sin(l9_799*l9_796.z);
float3 l9_803=(float3(l9_800,l9_801,l9_802)*l9_797)*l9_798;
float3 l9_804=l9_803;
l9_795+=l9_804;
}
if (N111_ENABLE_SNOISE)
{
float l9_805=l9_782;
float l9_806=l9_783;
float l9_807=l9_784;
float3 l9_808=N111_sNoiseFrequency;
float3 l9_809=N111_sNoiseMult;
float3 l9_810=l9_785;
float l9_811=l9_789;
float2 l9_812=float2(l9_805*l9_811,l9_808.x);
float2 l9_813=floor(l9_812+float2(dot(l9_812,float2(0.36602542))));
float2 l9_814=(l9_812-l9_813)+float2(dot(l9_813,float2(0.21132487)));
float2 l9_815=float2(0.0);
bool2 l9_816=bool2(l9_814.x>l9_814.y);
l9_815=float2(l9_816.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_816.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_817=l9_814.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_818=l9_817.xy-l9_815;
l9_817=float4(l9_818.x,l9_818.y,l9_817.z,l9_817.w);
l9_813=mod(l9_813,float2(289.0));
float3 l9_819=float3(l9_813.y)+float3(0.0,l9_815.y,1.0);
float3 l9_820=mod(((l9_819*34.0)+float3(1.0))*l9_819,float3(289.0));
float3 l9_821=(l9_820+float3(l9_813.x))+float3(0.0,l9_815.x,1.0);
float3 l9_822=mod(((l9_821*34.0)+float3(1.0))*l9_821,float3(289.0));
float3 l9_823=l9_822;
float3 l9_824=fast::max(float3(0.5)-float3(dot(l9_814,l9_814),dot(l9_817.xy,l9_817.xy),dot(l9_817.zw,l9_817.zw)),float3(0.0));
l9_824*=l9_824;
l9_824*=l9_824;
float3 l9_825=(fract(l9_823*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_826=abs(l9_825)-float3(0.5);
float3 l9_827=floor(l9_825+float3(0.5));
float3 l9_828=l9_825-l9_827;
l9_824*=(float3(1.7928429)-(((l9_828*l9_828)+(l9_826*l9_826))*0.85373473));
float3 l9_829=float3(0.0);
l9_829.x=(l9_828.x*l9_814.x)+(l9_826.x*l9_814.y);
float2 l9_830=(l9_828.yz*l9_817.xz)+(l9_826.yz*l9_817.yw);
l9_829=float3(l9_829.x,l9_830.x,l9_830.y);
float l9_831=130.0*dot(l9_824,l9_829);
float l9_832=l9_831;
float2 l9_833=float2(l9_806*l9_811,l9_808.y);
float2 l9_834=floor(l9_833+float2(dot(l9_833,float2(0.36602542))));
float2 l9_835=(l9_833-l9_834)+float2(dot(l9_834,float2(0.21132487)));
float2 l9_836=float2(0.0);
bool2 l9_837=bool2(l9_835.x>l9_835.y);
l9_836=float2(l9_837.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_837.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_838=l9_835.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_839=l9_838.xy-l9_836;
l9_838=float4(l9_839.x,l9_839.y,l9_838.z,l9_838.w);
l9_834=mod(l9_834,float2(289.0));
float3 l9_840=float3(l9_834.y)+float3(0.0,l9_836.y,1.0);
float3 l9_841=mod(((l9_840*34.0)+float3(1.0))*l9_840,float3(289.0));
float3 l9_842=(l9_841+float3(l9_834.x))+float3(0.0,l9_836.x,1.0);
float3 l9_843=mod(((l9_842*34.0)+float3(1.0))*l9_842,float3(289.0));
float3 l9_844=l9_843;
float3 l9_845=fast::max(float3(0.5)-float3(dot(l9_835,l9_835),dot(l9_838.xy,l9_838.xy),dot(l9_838.zw,l9_838.zw)),float3(0.0));
l9_845*=l9_845;
l9_845*=l9_845;
float3 l9_846=(fract(l9_844*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_847=abs(l9_846)-float3(0.5);
float3 l9_848=floor(l9_846+float3(0.5));
float3 l9_849=l9_846-l9_848;
l9_845*=(float3(1.7928429)-(((l9_849*l9_849)+(l9_847*l9_847))*0.85373473));
float3 l9_850=float3(0.0);
l9_850.x=(l9_849.x*l9_835.x)+(l9_847.x*l9_835.y);
float2 l9_851=(l9_849.yz*l9_838.xz)+(l9_847.yz*l9_838.yw);
l9_850=float3(l9_850.x,l9_851.x,l9_851.y);
float l9_852=130.0*dot(l9_845,l9_850);
float l9_853=l9_852;
float2 l9_854=float2(l9_807*l9_811,l9_808.z);
float2 l9_855=floor(l9_854+float2(dot(l9_854,float2(0.36602542))));
float2 l9_856=(l9_854-l9_855)+float2(dot(l9_855,float2(0.21132487)));
float2 l9_857=float2(0.0);
bool2 l9_858=bool2(l9_856.x>l9_856.y);
l9_857=float2(l9_858.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_858.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_859=l9_856.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_860=l9_859.xy-l9_857;
l9_859=float4(l9_860.x,l9_860.y,l9_859.z,l9_859.w);
l9_855=mod(l9_855,float2(289.0));
float3 l9_861=float3(l9_855.y)+float3(0.0,l9_857.y,1.0);
float3 l9_862=mod(((l9_861*34.0)+float3(1.0))*l9_861,float3(289.0));
float3 l9_863=(l9_862+float3(l9_855.x))+float3(0.0,l9_857.x,1.0);
float3 l9_864=mod(((l9_863*34.0)+float3(1.0))*l9_863,float3(289.0));
float3 l9_865=l9_864;
float3 l9_866=fast::max(float3(0.5)-float3(dot(l9_856,l9_856),dot(l9_859.xy,l9_859.xy),dot(l9_859.zw,l9_859.zw)),float3(0.0));
l9_866*=l9_866;
l9_866*=l9_866;
float3 l9_867=(fract(l9_865*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_868=abs(l9_867)-float3(0.5);
float3 l9_869=floor(l9_867+float3(0.5));
float3 l9_870=l9_867-l9_869;
l9_866*=(float3(1.7928429)-(((l9_870*l9_870)+(l9_868*l9_868))*0.85373473));
float3 l9_871=float3(0.0);
l9_871.x=(l9_870.x*l9_856.x)+(l9_868.x*l9_856.y);
float2 l9_872=(l9_870.yz*l9_859.xz)+(l9_868.yz*l9_859.yw);
l9_871=float3(l9_871.x,l9_872.x,l9_872.y);
float l9_873=130.0*dot(l9_866,l9_871);
float l9_874=l9_873;
float3 l9_875=(float3(l9_832,l9_853,l9_874)*l9_809)*l9_810;
l9_795+=l9_875;
}
float3 l9_876=float3(0.0,((N111_gravity/2.0)*l9_789)*l9_789,0.0);
float3 l9_877=l9_767;
if (N111_ENABLE_FORCE)
{
l9_877=((N111_localForce/float3(2.0))*l9_789)*l9_789;
}
float3 l9_878=l9_767;
float3 l9_879=N111_velocityMin+(((l9_785+float3(1.0))/float3(2.0))*(N111_velocityMax-N111_velocityMin));
if (N111_ENABLE_VELRAMP)
{
l9_879=mix(N111_velocityMin,N111_velocityMax,l9_786);
}
float3 l9_880=l9_879;
float l9_881=l9_789;
float3 l9_882=N111_velocityDrag;
float3 l9_883=l9_795;
float l9_884=l9_790;
float3 l9_885=float3(l9_881,l9_881,l9_881);
float3 l9_886=l9_882;
float l9_887;
if (l9_885.x<=0.0)
{
l9_887=0.0;
}
else
{
l9_887=pow(l9_885.x,l9_886.x);
}
float l9_888=l9_887;
float l9_889;
if (l9_885.y<=0.0)
{
l9_889=0.0;
}
else
{
l9_889=pow(l9_885.y,l9_886.y);
}
float l9_890=l9_889;
float l9_891;
if (l9_885.z<=0.0)
{
l9_891=0.0;
}
else
{
l9_891=pow(l9_885.z,l9_886.z);
}
float3 l9_892=float3(l9_888,l9_890,l9_891);
float3 l9_893=l9_892;
float3 l9_894=(l9_880+l9_883)*l9_893;
if (N111_ENABLE_VELRAMP)
{
float l9_895=floor(l9_884*10000.0)/10000.0;
float2 l9_896=tempGlobals.Surface_UVCoord0;
float2 l9_897=(l9_896/float2(10000.0,1.0))+float2(l9_895,0.0);
float2 l9_898=l9_897;
float4 l9_899=float4(0.0);
int l9_900=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_901=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_901=0;
}
else
{
l9_901=gl_InstanceIndex%2;
}
int l9_902=l9_901;
l9_900=1-l9_902;
}
else
{
int l9_903=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_903=0;
}
else
{
l9_903=gl_InstanceIndex%2;
}
int l9_904=l9_903;
l9_900=l9_904;
}
int l9_905=l9_900;
int l9_906=velRampTextureLayout_tmp;
int l9_907=l9_905;
float2 l9_908=l9_898;
bool l9_909=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_910=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_911=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_912=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_913=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_914=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_915=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_916=0.0;
bool l9_917=l9_914&&(!l9_912);
float l9_918=1.0;
float l9_919=l9_908.x;
int l9_920=l9_911.x;
if (l9_920==1)
{
l9_919=fract(l9_919);
}
else
{
if (l9_920==2)
{
float l9_921=fract(l9_919);
float l9_922=l9_919-l9_921;
float l9_923=step(0.25,fract(l9_922*0.5));
l9_919=mix(l9_921,1.0-l9_921,fast::clamp(l9_923,0.0,1.0));
}
}
l9_908.x=l9_919;
float l9_924=l9_908.y;
int l9_925=l9_911.y;
if (l9_925==1)
{
l9_924=fract(l9_924);
}
else
{
if (l9_925==2)
{
float l9_926=fract(l9_924);
float l9_927=l9_924-l9_926;
float l9_928=step(0.25,fract(l9_927*0.5));
l9_924=mix(l9_926,1.0-l9_926,fast::clamp(l9_928,0.0,1.0));
}
}
l9_908.y=l9_924;
if (l9_912)
{
bool l9_929=l9_914;
bool l9_930;
if (l9_929)
{
l9_930=l9_911.x==3;
}
else
{
l9_930=l9_929;
}
float l9_931=l9_908.x;
float l9_932=l9_913.x;
float l9_933=l9_913.z;
bool l9_934=l9_930;
float l9_935=l9_918;
float l9_936=fast::clamp(l9_931,l9_932,l9_933);
float l9_937=step(abs(l9_931-l9_936),9.9999997e-06);
l9_935*=(l9_937+((1.0-float(l9_934))*(1.0-l9_937)));
l9_931=l9_936;
l9_908.x=l9_931;
l9_918=l9_935;
bool l9_938=l9_914;
bool l9_939;
if (l9_938)
{
l9_939=l9_911.y==3;
}
else
{
l9_939=l9_938;
}
float l9_940=l9_908.y;
float l9_941=l9_913.y;
float l9_942=l9_913.w;
bool l9_943=l9_939;
float l9_944=l9_918;
float l9_945=fast::clamp(l9_940,l9_941,l9_942);
float l9_946=step(abs(l9_940-l9_945),9.9999997e-06);
l9_944*=(l9_946+((1.0-float(l9_943))*(1.0-l9_946)));
l9_940=l9_945;
l9_908.y=l9_940;
l9_918=l9_944;
}
float2 l9_947=l9_908;
bool l9_948=l9_909;
float3x3 l9_949=l9_910;
if (l9_948)
{
l9_947=float2((l9_949*float3(l9_947,1.0)).xy);
}
float2 l9_950=l9_947;
float2 l9_951=l9_950;
float2 l9_952=l9_951;
l9_908=l9_952;
float l9_953=l9_908.x;
int l9_954=l9_911.x;
bool l9_955=l9_917;
float l9_956=l9_918;
if ((l9_954==0)||(l9_954==3))
{
float l9_957=l9_953;
float l9_958=0.0;
float l9_959=1.0;
bool l9_960=l9_955;
float l9_961=l9_956;
float l9_962=fast::clamp(l9_957,l9_958,l9_959);
float l9_963=step(abs(l9_957-l9_962),9.9999997e-06);
l9_961*=(l9_963+((1.0-float(l9_960))*(1.0-l9_963)));
l9_957=l9_962;
l9_953=l9_957;
l9_956=l9_961;
}
l9_908.x=l9_953;
l9_918=l9_956;
float l9_964=l9_908.y;
int l9_965=l9_911.y;
bool l9_966=l9_917;
float l9_967=l9_918;
if ((l9_965==0)||(l9_965==3))
{
float l9_968=l9_964;
float l9_969=0.0;
float l9_970=1.0;
bool l9_971=l9_966;
float l9_972=l9_967;
float l9_973=fast::clamp(l9_968,l9_969,l9_970);
float l9_974=step(abs(l9_968-l9_973),9.9999997e-06);
l9_972*=(l9_974+((1.0-float(l9_971))*(1.0-l9_974)));
l9_968=l9_973;
l9_964=l9_968;
l9_967=l9_972;
}
l9_908.y=l9_964;
l9_918=l9_967;
float2 l9_975=l9_908;
int l9_976=l9_906;
int l9_977=l9_907;
float l9_978=l9_916;
float2 l9_979=l9_975;
int l9_980=l9_976;
int l9_981=l9_977;
float3 l9_982=float3(0.0);
if (l9_980==0)
{
l9_982=float3(l9_979,0.0);
}
else
{
if (l9_980==1)
{
l9_982=float3(l9_979.x,(l9_979.y*0.5)+(0.5-(float(l9_981)*0.5)),0.0);
}
else
{
l9_982=float3(l9_979,float(l9_981));
}
}
float3 l9_983=l9_982;
float3 l9_984=l9_983;
float2 l9_985=l9_984.xy;
float l9_986=l9_978;
float4 l9_987=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_985,level(l9_986));
float4 l9_988=l9_987;
float4 l9_989=l9_988;
if (l9_914)
{
l9_989=mix(l9_915,l9_989,float4(l9_918));
}
float4 l9_990=l9_989;
l9_899=l9_990;
float4 l9_991=l9_899;
float3 l9_992=l9_991.xyz;
l9_894=(l9_880+l9_883)*l9_992;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_894=l9_880*l9_893;
}
}
float3 l9_993=l9_894;
l9_878=l9_993;
if (N111_ENABLE_TRAILS)
{
if (N111_isTrail)
{
float2 l9_994=tempGlobals.Surface_UVCoord0;
float2 l9_995=l9_994;
float l9_996=mix(1.0,l9_995.y,1.0-N111_taper.x);
l9_996*=mix(1.0,1.0-l9_995.y,1.0-N111_taper.y);
N111_cameraFade_trailHeadTime_taper=float4(N111_cameraFade_trailHeadTime_taper.x,N111_trailHeadTime.x,N111_trailHeadTime.y,N111_cameraFade_trailHeadTime_taper.w);
N111_cameraFade_trailHeadTime_taper.w=l9_996;
}
}
float4x4 l9_997=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_998=length(l9_997[0].xyz);
float4x4 l9_999=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1000=length(l9_999[1].xyz);
float4x4 l9_1001=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1002=length(l9_1001[2].xyz);
float3 l9_1003=float3(l9_998,l9_1000,l9_1002);
float4x4 l9_1004=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1005=l9_1004;
float4 l9_1006=l9_1005[0];
float4 l9_1007=l9_1005[1];
float4 l9_1008=l9_1005[2];
float3x3 l9_1009=float3x3(float3(float3(l9_1006.x,l9_1007.x,l9_1008.x)),float3(float3(l9_1006.y,l9_1007.y,l9_1008.y)),float3(float3(l9_1006.z,l9_1007.z,l9_1008.z)));
float3x3 l9_1010=l9_1009;
float3 l9_1011=((l9_878+l9_876)+l9_877)*l9_1010;
if (N111_WORLDFORCE)
{
float4x4 l9_1012=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1013=l9_1012;
float4 l9_1014=l9_1013[0];
float4 l9_1015=l9_1013[1];
float4 l9_1016=l9_1013[2];
float3x3 l9_1017=float3x3(float3(float3(l9_1014.x,l9_1015.x,l9_1016.x)),float3(float3(l9_1014.y,l9_1015.y,l9_1016.y)),float3(float3(l9_1014.z,l9_1015.z,l9_1016.z)));
float3x3 l9_1018=l9_1017;
l9_1011=((l9_878*l9_1018)+l9_876)+l9_877;
}
if (N111_WORLDSPACE)
{
l9_1011=((l9_878*l9_1003)+l9_876)+l9_877;
}
float4x4 l9_1019=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_1020=(l9_1019*float4(l9_794,1.0)).xyz+l9_1011;
float l9_1021=mix(N111_rotationRandomZ.x,N111_rotationRandomZ.y,l9_787);
float l9_1022=1.0-l9_790;
float l9_1023=N111_rotationDrag;
float l9_1024;
if (l9_1022<=0.0)
{
l9_1024=0.0;
}
else
{
l9_1024=pow(l9_1022,l9_1023);
}
float l9_1025=l9_1024;
float l9_1026=l9_1025;
float l9_1027=mix(N111_rotationRateZ.x,N111_rotationRateZ.y,l9_787);
float l9_1028=((l9_1027*l9_1026)*l9_790)*2.0;
float l9_1029=N111_PI*((l9_1028+l9_1021)-0.5);
float l9_1030=1.0;
if (N111_ENABLE_SCREENFADE)
{
float3 l9_1031=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_1032=l9_1031-l9_1020;
float l9_1033=dot(l9_1032,l9_1032);
float l9_1034=(N111_fadeDistanceInvisible+N111_EPSILON)*(N111_fadeDistanceInvisible+N111_EPSILON);
float l9_1035=N111_fadeDistanceVisible*N111_fadeDistanceVisible;
float l9_1036=fast::min(l9_1034,l9_1035);
float l9_1037=fast::max(l9_1034,l9_1035);
float l9_1038=smoothstep(l9_1036,l9_1037,l9_1033);
float l9_1039;
if (l9_1034>l9_1035)
{
l9_1039=1.0-l9_1038;
}
else
{
l9_1039=l9_1038;
}
l9_1038=l9_1039;
if (l9_1038<=N111_EPSILON)
{
l9_1030=0.0;
}
N111_cameraFade_trailHeadTime_taper.x=l9_1038;
}
if (N111_MESHTYPE_QUAD||N111_ENABLE_TRAILS)
{
if (N111_MESHTYPE_QUAD||N111_isTrail)
{
int l9_1040=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1040=0;
}
else
{
l9_1040=gl_InstanceIndex%2;
}
int l9_1041=l9_1040;
float4x4 l9_1042=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_1041];
float3 l9_1043=normalize(l9_1042[2].xyz);
if (N111_isTrail)
{
l9_1043*=float3(-1.0);
}
float3 l9_1044=float3(0.0,1.0,0.0);
if (N111_ENABLE_ALIGNQUADTOCAMERAUP)
{
int l9_1045=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1045=0;
}
else
{
l9_1045=gl_InstanceIndex%2;
}
int l9_1046=l9_1045;
float3 l9_1047=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_1046][1].xyz;
l9_1044=l9_1047;
}
float3 l9_1048=-normalize(cross(l9_1043,l9_1044));
float3 l9_1049=normalize(cross(l9_1048,l9_1043));
float l9_1050=1.0;
if (N111_ENABLE_ALIGNTOX)
{
l9_1048=float3(0.0,0.0,1.0);
l9_1049=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_1048=float3(1.0,0.0,0.0);
l9_1049=float3(0.0,0.0,1.0);
}
if (N111_ENABLE_ALIGNTOZ)
{
l9_1048=float3(1.0,0.0,0.0);
l9_1049=float3(0.0,1.0,0.0);
}
float2 l9_1051=float2(cos(l9_1029),sin(l9_1029));
float2 l9_1052=float2(-sin(l9_1029),cos(l9_1029));
float3 l9_1053=float3((l9_1048*l9_1051.x)+(l9_1049*l9_1051.y));
float3 l9_1054=float3((l9_1048*l9_1052.x)+(l9_1049*l9_1052.y));
if (N111_ENABLE_ALIGNTOVEL||N111_ENABLE_TRAILS)
{
if (N111_ENABLE_ALIGNTOVEL||N111_isTrail)
{
float3 l9_1055=normalize(((l9_1011+l9_876)+l9_877)+float3(N111_EPSILON));
float3 l9_1056=l9_1011*(l9_789-0.0099999998);
float3 l9_1057=l9_1011*(l9_789+0.0099999998);
l9_1053=l9_1055;
l9_1054=normalize(cross(l9_1053,l9_1043));
if (N111_ENABLE_TRAILSPIN)
{
if (N111_isTrail)
{
l9_1054=float3((l9_1053*l9_1051.x)+(l9_1054*l9_1051.y));
}
}
if (!N111_isTrail)
{
if (N111_ENABLE_IGNOREVEL)
{
l9_1050=fast::max(N111_sizeVelScale,N111_EPSILON);
}
else
{
l9_1050=length(l9_1057-l9_1056)*N111_sizeVelScale;
if (N111_ENABLE_IGNORETRANSFORMSCALE)
{
float4x4 l9_1058=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_1050=(length(l9_1057-l9_1056)/length(l9_1058[0].xyz))*N111_sizeVelScale;
}
}
}
}
}
float4x4 l9_1059=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1060=length(l9_1059[0].xyz);
float2 l9_1061=tempGlobals.Surface_UVCoord0;
float l9_1062=l9_780;
float l9_1063=l9_781;
float l9_1064=l9_790;
float l9_1065=N111_sizeSpeed;
float2 l9_1066=(((l9_1061-float2(0.5))*l9_1030)*N111_pSize(l9_1062,l9_1063,l9_1064,l9_1065,N111_isTrail,N111_ENABLE_TRAILS,N111_trailHeadTime,N111_ENABLE_INDEPENDENTTRAIL,N111_trailSizeMult,N111_ENABLE_TRAILSIZERAMP,N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.trailSizeRampTex,sc_set0.trailSizeRampTexSmpSC,sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals))*l9_1060;
float3 l9_1067=(l9_1020+(l9_1054*l9_1066.x))+(l9_1053*(l9_1066.y*l9_1050));
N111_position=l9_1067;
if ((N111_particleAlive<0.5)||(l9_1030<0.5))
{
N111_position/=float3(0.0);
}
N111_normal=l9_1043;
}
}
if (!N111_MESHTYPE_QUAD)
{
if (!N111_isTrail)
{
N111_position=N111_positionObjectSpace;
if (N111_ENABLE_CENTER_IN_BBOX)
{
float3 l9_1068=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_1069=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_1070=(l9_1068+l9_1069)/float3(2.0);
N111_position-=l9_1070;
}
float l9_1071=l9_780;
float l9_1072=l9_781;
float l9_1073=l9_790;
float l9_1074=N111_sizeSpeed;
N111_position=(N111_position*l9_1003)*N111_pSize3D(l9_1071,l9_1072,l9_1073,l9_1074,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals);
if ((N111_particleAlive<0.5)||(l9_1030<0.5))
{
N111_position.x=2.1474836e+09;
}
float3x3 l9_1075;
if (((N111_ENABLE_ALIGNTOVEL||N111_ENABLE_ALIGNTOX)||N111_ENABLE_ALIGNTOY)||N111_ENABLE_ALIGNTOZ)
{
if (N111_ENABLE_ALIGNTOZ)
{
l9_1075=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
}
else
{
float3 l9_1076=float3(0.0);
if (N111_ENABLE_ALIGNTOX)
{
l9_1076=float3(1.0,0.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_1076=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOVEL)
{
float l9_1077=0.001;
float3 l9_1078=l9_879;
float l9_1079=l9_789-l9_1077;
float3 l9_1080=N111_velocityDrag;
float3 l9_1081=l9_795;
float l9_1082=l9_790-l9_1077;
float3 l9_1083=float3(l9_1079,l9_1079,l9_1079);
float3 l9_1084=l9_1080;
float l9_1085;
if (l9_1083.x<=0.0)
{
l9_1085=0.0;
}
else
{
l9_1085=pow(l9_1083.x,l9_1084.x);
}
float l9_1086=l9_1085;
float l9_1087;
if (l9_1083.y<=0.0)
{
l9_1087=0.0;
}
else
{
l9_1087=pow(l9_1083.y,l9_1084.y);
}
float l9_1088=l9_1087;
float l9_1089;
if (l9_1083.z<=0.0)
{
l9_1089=0.0;
}
else
{
l9_1089=pow(l9_1083.z,l9_1084.z);
}
float3 l9_1090=float3(l9_1086,l9_1088,l9_1089);
float3 l9_1091=l9_1090;
float3 l9_1092=(l9_1078+l9_1081)*l9_1091;
if (N111_ENABLE_VELRAMP)
{
float l9_1093=floor(l9_1082*10000.0)/10000.0;
float2 l9_1094=tempGlobals.Surface_UVCoord0;
float2 l9_1095=(l9_1094/float2(10000.0,1.0))+float2(l9_1093,0.0);
float2 l9_1096=l9_1095;
float4 l9_1097=float4(0.0);
int l9_1098=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_1099=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1099=0;
}
else
{
l9_1099=gl_InstanceIndex%2;
}
int l9_1100=l9_1099;
l9_1098=1-l9_1100;
}
else
{
int l9_1101=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1101=0;
}
else
{
l9_1101=gl_InstanceIndex%2;
}
int l9_1102=l9_1101;
l9_1098=l9_1102;
}
int l9_1103=l9_1098;
int l9_1104=velRampTextureLayout_tmp;
int l9_1105=l9_1103;
float2 l9_1106=l9_1096;
bool l9_1107=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_1108=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_1109=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_1110=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_1111=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_1112=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_1113=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_1114=0.0;
bool l9_1115=l9_1112&&(!l9_1110);
float l9_1116=1.0;
float l9_1117=l9_1106.x;
int l9_1118=l9_1109.x;
if (l9_1118==1)
{
l9_1117=fract(l9_1117);
}
else
{
if (l9_1118==2)
{
float l9_1119=fract(l9_1117);
float l9_1120=l9_1117-l9_1119;
float l9_1121=step(0.25,fract(l9_1120*0.5));
l9_1117=mix(l9_1119,1.0-l9_1119,fast::clamp(l9_1121,0.0,1.0));
}
}
l9_1106.x=l9_1117;
float l9_1122=l9_1106.y;
int l9_1123=l9_1109.y;
if (l9_1123==1)
{
l9_1122=fract(l9_1122);
}
else
{
if (l9_1123==2)
{
float l9_1124=fract(l9_1122);
float l9_1125=l9_1122-l9_1124;
float l9_1126=step(0.25,fract(l9_1125*0.5));
l9_1122=mix(l9_1124,1.0-l9_1124,fast::clamp(l9_1126,0.0,1.0));
}
}
l9_1106.y=l9_1122;
if (l9_1110)
{
bool l9_1127=l9_1112;
bool l9_1128;
if (l9_1127)
{
l9_1128=l9_1109.x==3;
}
else
{
l9_1128=l9_1127;
}
float l9_1129=l9_1106.x;
float l9_1130=l9_1111.x;
float l9_1131=l9_1111.z;
bool l9_1132=l9_1128;
float l9_1133=l9_1116;
float l9_1134=fast::clamp(l9_1129,l9_1130,l9_1131);
float l9_1135=step(abs(l9_1129-l9_1134),9.9999997e-06);
l9_1133*=(l9_1135+((1.0-float(l9_1132))*(1.0-l9_1135)));
l9_1129=l9_1134;
l9_1106.x=l9_1129;
l9_1116=l9_1133;
bool l9_1136=l9_1112;
bool l9_1137;
if (l9_1136)
{
l9_1137=l9_1109.y==3;
}
else
{
l9_1137=l9_1136;
}
float l9_1138=l9_1106.y;
float l9_1139=l9_1111.y;
float l9_1140=l9_1111.w;
bool l9_1141=l9_1137;
float l9_1142=l9_1116;
float l9_1143=fast::clamp(l9_1138,l9_1139,l9_1140);
float l9_1144=step(abs(l9_1138-l9_1143),9.9999997e-06);
l9_1142*=(l9_1144+((1.0-float(l9_1141))*(1.0-l9_1144)));
l9_1138=l9_1143;
l9_1106.y=l9_1138;
l9_1116=l9_1142;
}
float2 l9_1145=l9_1106;
bool l9_1146=l9_1107;
float3x3 l9_1147=l9_1108;
if (l9_1146)
{
l9_1145=float2((l9_1147*float3(l9_1145,1.0)).xy);
}
float2 l9_1148=l9_1145;
float2 l9_1149=l9_1148;
float2 l9_1150=l9_1149;
l9_1106=l9_1150;
float l9_1151=l9_1106.x;
int l9_1152=l9_1109.x;
bool l9_1153=l9_1115;
float l9_1154=l9_1116;
if ((l9_1152==0)||(l9_1152==3))
{
float l9_1155=l9_1151;
float l9_1156=0.0;
float l9_1157=1.0;
bool l9_1158=l9_1153;
float l9_1159=l9_1154;
float l9_1160=fast::clamp(l9_1155,l9_1156,l9_1157);
float l9_1161=step(abs(l9_1155-l9_1160),9.9999997e-06);
l9_1159*=(l9_1161+((1.0-float(l9_1158))*(1.0-l9_1161)));
l9_1155=l9_1160;
l9_1151=l9_1155;
l9_1154=l9_1159;
}
l9_1106.x=l9_1151;
l9_1116=l9_1154;
float l9_1162=l9_1106.y;
int l9_1163=l9_1109.y;
bool l9_1164=l9_1115;
float l9_1165=l9_1116;
if ((l9_1163==0)||(l9_1163==3))
{
float l9_1166=l9_1162;
float l9_1167=0.0;
float l9_1168=1.0;
bool l9_1169=l9_1164;
float l9_1170=l9_1165;
float l9_1171=fast::clamp(l9_1166,l9_1167,l9_1168);
float l9_1172=step(abs(l9_1166-l9_1171),9.9999997e-06);
l9_1170*=(l9_1172+((1.0-float(l9_1169))*(1.0-l9_1172)));
l9_1166=l9_1171;
l9_1162=l9_1166;
l9_1165=l9_1170;
}
l9_1106.y=l9_1162;
l9_1116=l9_1165;
float2 l9_1173=l9_1106;
int l9_1174=l9_1104;
int l9_1175=l9_1105;
float l9_1176=l9_1114;
float2 l9_1177=l9_1173;
int l9_1178=l9_1174;
int l9_1179=l9_1175;
float3 l9_1180=float3(0.0);
if (l9_1178==0)
{
l9_1180=float3(l9_1177,0.0);
}
else
{
if (l9_1178==1)
{
l9_1180=float3(l9_1177.x,(l9_1177.y*0.5)+(0.5-(float(l9_1179)*0.5)),0.0);
}
else
{
l9_1180=float3(l9_1177,float(l9_1179));
}
}
float3 l9_1181=l9_1180;
float3 l9_1182=l9_1181;
float2 l9_1183=l9_1182.xy;
float l9_1184=l9_1176;
float4 l9_1185=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_1183,level(l9_1184));
float4 l9_1186=l9_1185;
float4 l9_1187=l9_1186;
if (l9_1112)
{
l9_1187=mix(l9_1113,l9_1187,float4(l9_1116));
}
float4 l9_1188=l9_1187;
l9_1097=l9_1188;
float4 l9_1189=l9_1097;
float3 l9_1190=l9_1189.xyz;
l9_1092=(l9_1078+l9_1081)*l9_1190;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_1092=l9_1078*l9_1091;
}
}
float3 l9_1191=l9_1092;
float3 l9_1192=l9_1191;
float l9_1193=((N111_gravity/2.0)*(l9_789-l9_1077))*(l9_789-l9_1077);
l9_876.y-=l9_1193;
if (N111_ENABLE_FORCE)
{
float3 l9_1194=float3(((N111_localForce/float3(2.0))*(l9_789-l9_1077))*(l9_789-l9_1077));
l9_877-=l9_1194;
}
if (N111_WORLDFORCE)
{
float4x4 l9_1195=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1196=l9_1195;
float4 l9_1197=l9_1196[0];
float4 l9_1198=l9_1196[1];
float4 l9_1199=l9_1196[2];
float3x3 l9_1200=float3x3(float3(float3(l9_1197.x,l9_1198.x,l9_1199.x)),float3(float3(l9_1197.y,l9_1198.y,l9_1199.y)),float3(float3(l9_1197.z,l9_1198.z,l9_1199.z)));
float3x3 l9_1201=l9_1200;
l9_1076=(((l9_878-l9_1192)*l9_1201)+l9_876)+l9_877;
}
else
{
if (N111_WORLDSPACE)
{
l9_1076=((l9_878-l9_1192)+l9_876)+l9_877;
}
else
{
float4x4 l9_1202=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1203=l9_1202;
float4 l9_1204=l9_1203[0];
float4 l9_1205=l9_1203[1];
float4 l9_1206=l9_1203[2];
float3x3 l9_1207=float3x3(float3(float3(l9_1204.x,l9_1205.x,l9_1206.x)),float3(float3(l9_1204.y,l9_1205.y,l9_1206.y)),float3(float3(l9_1204.z,l9_1205.z,l9_1206.z)));
float3x3 l9_1208=l9_1207;
l9_1076=(((l9_878-l9_1192)+l9_877)+l9_876)*l9_1208;
}
}
l9_1076=normalize(l9_1076+float3(N111_EPSILON));
}
float3 l9_1209=float3(0.0,0.0,1.0);
float3 l9_1210=cross(l9_1076,l9_1209);
float3 l9_1211=normalize(l9_1210);
float l9_1212=length(l9_1210);
float l9_1213=dot(l9_1209,l9_1076);
float l9_1214=1.0-l9_1213;
l9_1075=float3x3(float3(((l9_1214*l9_1211.x)*l9_1211.x)+l9_1213,((l9_1214*l9_1211.x)*l9_1211.y)-(l9_1211.z*l9_1212),((l9_1214*l9_1211.z)*l9_1211.x)+(l9_1211.y*l9_1212)),float3(((l9_1214*l9_1211.x)*l9_1211.y)+(l9_1211.z*l9_1212),((l9_1214*l9_1211.y)*l9_1211.y)+l9_1213,((l9_1214*l9_1211.y)*l9_1211.z)-(l9_1211.x*l9_1212)),float3(((l9_1214*l9_1211.z)*l9_1211.x)-(l9_1211.y*l9_1212),((l9_1214*l9_1211.y)*l9_1211.z)+(l9_1211.x*l9_1212),((l9_1214*l9_1211.z)*l9_1211.z)+l9_1213));
}
float3x3 l9_1215=float3x3(float3(cos(l9_1029),-sin(l9_1029),0.0),float3(sin(l9_1029),cos(l9_1029),0.0),float3(0.0,0.0,1.0));
l9_1075=l9_1075*l9_1215;
if (N111_ENABLE_ALIGNTOVEL&&(!N111_ENABLE_IGNOREVEL))
{
float3 l9_1216=l9_1011*(l9_789-0.0099999998);
float3 l9_1217=l9_1011*(l9_789+0.0099999998);
N111_position.z*=(length(l9_1217-l9_1216)*fast::max(N111_sizeVelScale,0.1));
}
}
else
{
float l9_1218=fract((N111_particleSeed.x*92.653008)+N111_globalSeed);
float l9_1219=mix(N111_rotationRandomX.x,N111_rotationRandomX.y,l9_1218);
float l9_1220=mix(N111_rotationRateX.x,N111_rotationRateX.y,l9_1218);
float l9_1221=((l9_1220*l9_1026)*l9_790)*2.0;
float l9_1222=fract((N111_particleSeed.y*6.7557559)+N111_globalSeed);
float l9_1223=mix(N111_rotationRandomY.x,N111_rotationRandomY.y,l9_1222);
float l9_1224=mix(N111_rotationRateY.x,N111_rotationRateY.y,l9_1222);
float l9_1225=((l9_1224*l9_1026)*l9_790)*2.0;
float l9_1226=N111_PI*(l9_1221+l9_1219);
float l9_1227=N111_PI*(l9_1225+l9_1223);
float l9_1228=N111_PI*(l9_1028+l9_1021);
float3 l9_1229=float3(l9_1226,l9_1227,l9_1228);
float l9_1230=cos(l9_1229.x);
float l9_1231=sin(l9_1229.x);
float l9_1232=cos(l9_1229.y);
float l9_1233=sin(l9_1229.y);
float l9_1234=cos(l9_1229.z);
float l9_1235=sin(l9_1229.z);
l9_1075=float3x3(float3(l9_1232*l9_1234,(l9_1230*l9_1235)+((l9_1231*l9_1233)*l9_1234),(l9_1231*l9_1235)-((l9_1230*l9_1233)*l9_1234)),float3((-l9_1232)*l9_1235,(l9_1230*l9_1234)-((l9_1231*l9_1233)*l9_1235),(l9_1231*l9_1234)+((l9_1230*l9_1233)*l9_1235)),float3(l9_1233,(-l9_1231)*l9_1232,l9_1230*l9_1232));
}
if ((!N111_WORLDSPACE)&&(!N111_ENABLE_ALIGNTOVEL))
{
float4x4 l9_1236=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1237=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1238=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3x3 l9_1239=float3x3(float3(l9_1236[0].xyz/float3(l9_1003.x)),float3(l9_1237[1].xyz/float3(l9_1003.y)),float3(l9_1238[2].xyz/float3(l9_1003.z)));
l9_1075=l9_1239*l9_1075;
}
N111_position=l9_1075*N111_position;
N111_normal=normalize(l9_1075*N111_normalObjectSpace);
N111_position+=l9_1020;
}
}
N111_timeValues=float4(l9_788,l9_789,l9_790);
param_261=N111_normal;
normal_N111=param_261;
WorldNormal=normal_N111;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_263=v;
float3 param_264=WorldPosition;
float3 param_265=WorldNormal;
float3 param_266=WorldTangent;
float4 param_267=v.position;
out.varPos=param_264;
out.varNormal=normalize(param_265);
float3 l9_1240=normalize(param_266);
out.varTangent=float4(l9_1240.x,l9_1240.y,l9_1240.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_1241=param_263.position;
float4 l9_1242=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_1243=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1243=0;
}
else
{
l9_1243=gl_InstanceIndex%2;
}
int l9_1244=l9_1243;
l9_1242=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_1244]*l9_1241;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_1245=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1245=0;
}
else
{
l9_1245=gl_InstanceIndex%2;
}
int l9_1246=l9_1245;
l9_1242=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_1246]*l9_1241;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_1247=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1247=0;
}
else
{
l9_1247=gl_InstanceIndex%2;
}
int l9_1248=l9_1247;
l9_1242=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_1248]*l9_1241;
}
else
{
l9_1242=l9_1241;
}
}
}
float4 l9_1249=l9_1242;
out.varViewSpaceDepth=-l9_1249.z;
}
float4 l9_1250=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_1250=param_267;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_1251=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1251=0;
}
else
{
l9_1251=gl_InstanceIndex%2;
}
int l9_1252=l9_1251;
l9_1250=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_1252]*param_263.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_1253=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1253=0;
}
else
{
l9_1253=gl_InstanceIndex%2;
}
int l9_1254=l9_1253;
l9_1250=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_1254]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_1255=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1255=0;
}
else
{
l9_1255=gl_InstanceIndex%2;
}
int l9_1256=l9_1255;
l9_1250=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_1256]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_263.texture0,param_263.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_1257=param_263.position;
float4 l9_1258=l9_1257;
if (sc_RenderingSpace_tmp==1)
{
l9_1258=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_1257;
}
float4 l9_1259=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_1258;
float2 l9_1260=((l9_1259.xy/float2(l9_1259.w))*0.5)+float2(0.5);
out.varShadowTex=l9_1260;
}
float4 l9_1261=l9_1250;
if (sc_DepthBufferMode_tmp==1)
{
int l9_1262=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1262=0;
}
else
{
l9_1262=gl_InstanceIndex%2;
}
int l9_1263=l9_1262;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_1263][2].w!=0.0)
{
float l9_1264=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_1261.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_1261.w))*l9_1264)-1.0)*l9_1261.w;
}
}
float4 l9_1265=l9_1261;
l9_1250=l9_1265;
float4 l9_1266=l9_1250;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_1267=l9_1266.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_1266.w);
l9_1266=float4(l9_1267.x,l9_1267.y,l9_1266.z,l9_1266.w);
}
float4 l9_1268=l9_1266;
l9_1250=l9_1268;
float4 l9_1269=l9_1250;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1269.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1270=l9_1269;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1271=dot(l9_1270,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1272=l9_1271;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1272;
}
}
float4 l9_1273=float4(l9_1269.x,-l9_1269.y,(l9_1269.z*0.5)+(l9_1269.w*0.5),l9_1269.w);
out.gl_Position=l9_1273;
v=param_263;
out.Interpolator_gInstanceID=Globals.gInstanceID;
ssGlobals param_268=Globals;
float4 l9_1275=float4(0.0);
float l9_1276=0.0;
float l9_1277=(*sc_set0.UserUniforms).timeGlobal;
l9_1276=l9_1277;
float l9_1278=0.0;
float l9_1279=(*sc_set0.UserUniforms).externalTimeInput;
l9_1278=l9_1279;
float l9_1280=0.0;
float l9_1281=(*sc_set0.UserUniforms).externalSeed;
l9_1280=l9_1281;
float l9_1282=0.0;
float l9_1283=(*sc_set0.UserUniforms).lifeTimeConstant;
l9_1282=l9_1283;
float2 l9_1284=float2(0.0);
float2 l9_1285=(*sc_set0.UserUniforms).lifeTimeMinMax;
l9_1284=l9_1285;
float l9_1286=0.0;
float l9_1287=(*sc_set0.UserUniforms).spawnDuration;
l9_1286=l9_1287;
float l9_1288=0.0;
float l9_1289;
if ((int(TRAILS_tmp)!=0))
{
l9_1289=1.001;
}
else
{
l9_1289=0.001;
}
l9_1289-=0.001;
l9_1288=l9_1289;
float l9_1290=0.0;
float l9_1291=(*sc_set0.UserUniforms).trailLength;
l9_1290=l9_1291;
float4 l9_1292=float4(0.0);
l9_1292=param_268.VertexColor;
float l9_1293=0.0;
l9_1293=l9_1292.x;
float l9_1294=0.0;
float l9_1295=l9_1288;
bool l9_1296=(l9_1295*1.0)!=0.0;
bool l9_1297;
if (l9_1296)
{
l9_1297=(l9_1293*1.0)!=0.0;
}
else
{
l9_1297=l9_1296;
}
l9_1294=float(l9_1297);
float3 l9_1298=float3(0.0);
float l9_1299=0.0;
float l9_1300=0.0;
float4 l9_1301=float4(0.0);
float l9_1302=0.0;
float2 l9_1303=float2(0.0);
float l9_1304=l9_1276;
float l9_1305=l9_1278;
float l9_1306=l9_1280;
float l9_1307=l9_1282;
float2 l9_1308=l9_1284;
float l9_1309=l9_1286;
float l9_1310=l9_1290;
float l9_1311=l9_1294;
ssGlobals l9_1312=param_268;
tempGlobals=l9_1312;
float3 l9_1313=float3(0.0);
float l9_1314=0.0;
float l9_1315=0.0;
float4 l9_1316=float4(0.0);
float l9_1317=0.0;
float2 l9_1318=float2(0.0);
N181_timeGlobal=l9_1304;
N181_ENABLE_EXTERNALTIME=(int(EXTERNALTIME_tmp)!=0);
N181_externalTime=l9_1305;
N181_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N181_externalSeed=l9_1306;
N181_ENABLE_LIFETIMEMINMAX=(int(LIFETIMEMINMAX_tmp)!=0);
N181_lifeTimeConstant=l9_1307;
N181_lifeTimeMinMax=l9_1308;
N181_ENABLE_INSTANTSPAWN=(int(INSTANTSPAWN_tmp)!=0);
N181_spawnDuration=l9_1309;
N181_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N181_trailLength=l9_1310;
N181_isTrailCondition=l9_1311!=0.0;
N181_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
float l9_1319=0.0;
if (N181_ENABLE_WORLDPOSSEED)
{
float4x4 l9_1320=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_1319=length(float4(1.0)*l9_1320);
}
N181_globalSeed=N181_externalSeed+l9_1319;
int l9_1321=0;
int l9_1322=gl_InstanceIndex;
l9_1321=l9_1322;
int l9_1323=l9_1321;
float l9_1324=float(l9_1323);
int l9_1325=int(l9_1324);
int l9_1326=l9_1325^(l9_1325*15299);
int l9_1327=l9_1326;
int l9_1328=l9_1327;
int l9_1329=((l9_1328*((l9_1328*1471343)+101146501))+1559861749)&2147483647;
int l9_1330=l9_1329;
int l9_1331=l9_1327*1399;
int l9_1332=((l9_1331*((l9_1331*1471343)+101146501))+1559861749)&2147483647;
int l9_1333=l9_1332;
int l9_1334=l9_1327*7177;
int l9_1335=((l9_1334*((l9_1334*1471343)+101146501))+1559861749)&2147483647;
int l9_1336=l9_1335;
int l9_1337=l9_1330;
float l9_1338=float(l9_1337)*4.6566129e-10;
int l9_1339=l9_1333;
float l9_1340=float(l9_1339)*4.6566129e-10;
int l9_1341=l9_1336;
float l9_1342=float(l9_1341)*4.6566129e-10;
float3 l9_1343=float3(l9_1338,l9_1340,l9_1342);
float3 l9_1344=l9_1343;
N181_particleSeed=l9_1344;
float l9_1345=fract((N181_particleSeed.y*12.12358)+N181_globalSeed);
float l9_1346=fract((N181_particleSeed.z*3.5358)+N181_globalSeed);
float2 l9_1347;
if (N181_ENABLE_LIFETIMEMINMAX)
{
l9_1347=N181_lifeTimeMinMax;
}
else
{
l9_1347=float2(N181_lifeTimeConstant);
}
float2 l9_1348=l9_1347;
float l9_1349=fast::max(l9_1348.x,0.0099999998);
float l9_1350=fast::max(l9_1348.y,0.0099999998);
float l9_1351=tempGlobals.gTimeElapsed;
float l9_1352=l9_1351;
if (N181_ENABLE_EXTERNALTIME)
{
l9_1352=N181_externalTime;
}
float l9_1353=l9_1352;
if (N181_ENABLE_INSTANTSPAWN)
{
l9_1353=N181_timeGlobal*l9_1352;
}
else
{
float l9_1354=0.0;
if (N181_ENABLE_TRAILS)
{
if (N181_ENABLE_INDEPENDENTTRAIL)
{
l9_1354=N181_trailLength;
}
}
float l9_1355=fract(((l9_1352*N181_timeGlobal)*(1.0/(l9_1348.y+l9_1354)))+l9_1345);
l9_1353=l9_1355*(l9_1348.y+l9_1354);
}
float l9_1356=mix(l9_1353/l9_1349,l9_1353/l9_1350,l9_1346);
float l9_1357=fast::clamp(l9_1356,0.0,1.0);
N181_isTrail=0.0;
N181_trailHeadTime=float2(l9_1353,l9_1357);
if (N181_ENABLE_TRAILS)
{
if (N181_isTrailCondition)
{
N181_isTrail=1.0;
float2 l9_1358=tempGlobals.Surface_UVCoord0;
l9_1353-=(l9_1358.y*N181_trailLength);
l9_1356=mix(l9_1353/l9_1349,l9_1353/l9_1350,l9_1346);
l9_1357=fast::clamp(l9_1356,0.0,1.0);
}
}
float l9_1359=0.0;
if (!N181_ENABLE_INSTANTSPAWN)
{
if (N181_spawnDuration>0.0)
{
if ((l9_1352-N181_spawnDuration)>=l9_1353)
{
l9_1359=1.0;
}
}
}
float l9_1360=l9_1356+l9_1359;
N181_particleAlive=1.0;
if ((l9_1360>0.99989998)||(l9_1353<=0.0))
{
N181_particleAlive=0.0;
}
N181_timeValues=float4(l9_1348,l9_1353,l9_1357);
l9_1313=N181_particleSeed;
l9_1314=N181_globalSeed;
l9_1315=N181_particleAlive;
l9_1316=N181_timeValues;
l9_1317=N181_isTrail;
l9_1318=N181_trailHeadTime;
l9_1298=l9_1313;
l9_1299=l9_1314;
l9_1300=l9_1315;
l9_1301=l9_1316;
l9_1302=l9_1317;
l9_1303=l9_1318;
float2 l9_1361=float2(0.0);
float2 l9_1362=(*sc_set0.UserUniforms).trailTaper;
l9_1361=l9_1362;
float l9_1363=0.0;
float l9_1364=(*sc_set0.UserUniforms).trailWidth;
l9_1363=l9_1364;
float3 l9_1365=float3(0.0);
l9_1365=param_268.SurfacePosition_ObjectSpace;
float3 l9_1366=float3(0.0);
l9_1366=param_268.VertexNormal_ObjectSpace;
float3 l9_1367=float3(0.0);
float3 l9_1368=(*sc_set0.UserUniforms).spawnLocation;
l9_1367=l9_1368;
float3 l9_1369=float3(0.0);
float3 l9_1370=(*sc_set0.UserUniforms).spawnBox;
l9_1369=l9_1370;
float3 l9_1371=float3(0.0);
float3 l9_1372=(*sc_set0.UserUniforms).spawnSphere;
l9_1371=l9_1372;
float3 l9_1373=float3(0.0);
float3 l9_1374=(*sc_set0.UserUniforms).noiseMult;
l9_1373=l9_1374;
float3 l9_1375=float3(0.0);
float3 l9_1376=(*sc_set0.UserUniforms).noiseFrequency;
l9_1375=l9_1376;
float3 l9_1377=float3(0.0);
float3 l9_1378=(*sc_set0.UserUniforms).sNoiseMult;
l9_1377=l9_1378;
float3 l9_1379=float3(0.0);
float3 l9_1380=(*sc_set0.UserUniforms).sNoiseFrequency;
l9_1379=l9_1380;
float3 l9_1381=float3(0.0);
float3 l9_1382=(*sc_set0.UserUniforms).velocityMin;
l9_1381=l9_1382;
float3 l9_1383=float3(0.0);
float3 l9_1384=(*sc_set0.UserUniforms).velocityMax;
l9_1383=l9_1384;
float3 l9_1385=float3(0.0);
float3 l9_1386=(*sc_set0.UserUniforms).velocityDrag;
l9_1385=l9_1386;
float3 l9_1387=float3(0.0);
float3 l9_1388=float3(0.0);
float3 l9_1389=float3(0.0);
float3 l9_1390;
if (MESHTYPE_tmp==0)
{
float2 l9_1391=float2(0.0);
float2 l9_1392=(*sc_set0.UserUniforms).sizeStart;
l9_1391=l9_1392;
l9_1388=float3(l9_1391,0.0);
l9_1390=l9_1388;
}
else
{
float3 l9_1393=float3(0.0);
float3 l9_1394=(*sc_set0.UserUniforms).sizeStart3D;
l9_1393=l9_1394;
l9_1389=l9_1393;
l9_1390=l9_1389;
}
l9_1387=l9_1390;
float3 l9_1395=float3(0.0);
float3 l9_1396=float3(0.0);
float3 l9_1397=float3(0.0);
float3 l9_1398;
if (MESHTYPE_tmp==0)
{
float2 l9_1399=float2(0.0);
float2 l9_1400=(*sc_set0.UserUniforms).sizeEnd;
l9_1399=l9_1400;
l9_1396=float3(l9_1399,0.0);
l9_1398=l9_1396;
}
else
{
float3 l9_1401=float3(0.0);
float3 l9_1402=(*sc_set0.UserUniforms).sizeEnd3D;
l9_1401=l9_1402;
l9_1397=l9_1401;
l9_1398=l9_1397;
}
l9_1395=l9_1398;
float3 l9_1403=float3(0.0);
float3 l9_1404=float3(0.0);
float3 l9_1405=float3(0.0);
float3 l9_1406;
if (MESHTYPE_tmp==0)
{
float2 l9_1407=float2(0.0);
float2 l9_1408=(*sc_set0.UserUniforms).sizeStartMin;
l9_1407=l9_1408;
l9_1404=float3(l9_1407,0.0);
l9_1406=l9_1404;
}
else
{
float3 l9_1409=float3(0.0);
float3 l9_1410=(*sc_set0.UserUniforms).sizeStartMin3D;
l9_1409=l9_1410;
l9_1405=l9_1409;
l9_1406=l9_1405;
}
l9_1403=l9_1406;
float3 l9_1411=float3(0.0);
float3 l9_1412=float3(0.0);
float3 l9_1413=float3(0.0);
float3 l9_1414;
if (MESHTYPE_tmp==0)
{
float2 l9_1415=float2(0.0);
float2 l9_1416=(*sc_set0.UserUniforms).sizeStartMax;
l9_1415=l9_1416;
l9_1412=float3(l9_1415,0.0);
l9_1414=l9_1412;
}
else
{
float3 l9_1417=float3(0.0);
float3 l9_1418=(*sc_set0.UserUniforms).sizeStartMax3D;
l9_1417=l9_1418;
l9_1413=l9_1417;
l9_1414=l9_1413;
}
l9_1411=l9_1414;
float3 l9_1419=float3(0.0);
float3 l9_1420=float3(0.0);
float3 l9_1421=float3(0.0);
float3 l9_1422;
if (MESHTYPE_tmp==0)
{
float2 l9_1423=float2(0.0);
float2 l9_1424=(*sc_set0.UserUniforms).sizeEndMin;
l9_1423=l9_1424;
l9_1420=float3(l9_1423,0.0);
l9_1422=l9_1420;
}
else
{
float3 l9_1425=float3(0.0);
float3 l9_1426=(*sc_set0.UserUniforms).sizeEndMin3D;
l9_1425=l9_1426;
l9_1421=l9_1425;
l9_1422=l9_1421;
}
l9_1419=l9_1422;
float3 l9_1427=float3(0.0);
float3 l9_1428=float3(0.0);
float3 l9_1429=float3(0.0);
float3 l9_1430;
if (MESHTYPE_tmp==0)
{
float2 l9_1431=float2(0.0);
float2 l9_1432=(*sc_set0.UserUniforms).sizeEndMax;
l9_1431=l9_1432;
l9_1428=float3(l9_1431,0.0);
l9_1430=l9_1428;
}
else
{
float3 l9_1433=float3(0.0);
float3 l9_1434=(*sc_set0.UserUniforms).sizeEndMax3D;
l9_1433=l9_1434;
l9_1429=l9_1433;
l9_1430=l9_1429;
}
l9_1427=l9_1430;
float l9_1435=0.0;
float l9_1436=(*sc_set0.UserUniforms).sizeSpeed;
l9_1435=l9_1436;
float l9_1437=0.0;
float l9_1438;
if ((int(ENABLE_SIZERAMPSTARTENDASBOUNDS_tmp)!=0))
{
l9_1438=1.001;
}
else
{
l9_1438=0.001;
}
l9_1438-=0.001;
l9_1437=l9_1438;
float l9_1439=0.0;
float l9_1440=(*sc_set0.UserUniforms).gravity;
l9_1439=l9_1440;
float3 l9_1441=float3(0.0);
float3 l9_1442=(*sc_set0.UserUniforms).localForce;
l9_1441=l9_1442;
float l9_1443=0.0;
float l9_1444=(*sc_set0.UserUniforms).sizeVelScale;
l9_1443=l9_1444;
float l9_1445=0.0;
float l9_1446=float((*sc_set0.UserUniforms).ALIGNTOX!=0);
l9_1445=l9_1446;
float l9_1447=0.0;
float l9_1448=float((*sc_set0.UserUniforms).ALIGNTOY!=0);
l9_1447=l9_1448;
float l9_1449=0.0;
float l9_1450=float((*sc_set0.UserUniforms).ALIGNTOZ!=0);
l9_1449=l9_1450;
float2 l9_1451=float2(0.0);
float2 l9_1452=(*sc_set0.UserUniforms).Port_Input1_N138;
float2 l9_1453=float2(0.0);
float2 l9_1454;
if (MESHTYPE_tmp==0)
{
l9_1454=l9_1452;
}
else
{
float2 l9_1455=float2(0.0);
float2 l9_1456=(*sc_set0.UserUniforms).rotationRandomX;
l9_1455=l9_1456;
l9_1453=l9_1455;
l9_1454=l9_1453;
}
l9_1451=l9_1454;
float2 l9_1457=float2(0.0);
float2 l9_1458=(*sc_set0.UserUniforms).Port_Input1_N139;
float2 l9_1459=float2(0.0);
float2 l9_1460;
if (MESHTYPE_tmp==0)
{
l9_1460=l9_1458;
}
else
{
float2 l9_1461=float2(0.0);
float2 l9_1462=(*sc_set0.UserUniforms).rotationRateX;
l9_1461=l9_1462;
l9_1459=l9_1461;
l9_1460=l9_1459;
}
l9_1457=l9_1460;
float2 l9_1463=float2(0.0);
float2 l9_1464=(*sc_set0.UserUniforms).Port_Input1_N140;
float2 l9_1465=float2(0.0);
float2 l9_1466;
if (MESHTYPE_tmp==0)
{
l9_1466=l9_1464;
}
else
{
float2 l9_1467=float2(0.0);
float2 l9_1468=(*sc_set0.UserUniforms).randomRotationY;
l9_1467=l9_1468;
l9_1465=l9_1467;
l9_1466=l9_1465;
}
l9_1463=l9_1466;
float2 l9_1469=float2(0.0);
float2 l9_1470=(*sc_set0.UserUniforms).Port_Input1_N144;
float2 l9_1471=float2(0.0);
float2 l9_1472;
if (MESHTYPE_tmp==0)
{
l9_1472=l9_1470;
}
else
{
float2 l9_1473=float2(0.0);
float2 l9_1474=(*sc_set0.UserUniforms).rotationRateY;
l9_1473=l9_1474;
l9_1471=l9_1473;
l9_1472=l9_1471;
}
l9_1469=l9_1472;
float2 l9_1475=float2(0.0);
float2 l9_1476=float2(1.0);
float2 l9_1477=float2(0.0);
float2 l9_1478;
if (MESHTYPE_tmp==0)
{
float2 l9_1479=float2(0.0);
float2 l9_1480=(*sc_set0.UserUniforms).rotationRandom;
l9_1479=l9_1480;
l9_1476=l9_1479;
l9_1478=l9_1476;
}
else
{
float2 l9_1481=float2(0.0);
float2 l9_1482=(*sc_set0.UserUniforms).randomRotationZ;
l9_1481=l9_1482;
l9_1477=l9_1481;
l9_1478=l9_1477;
}
l9_1475=l9_1478;
float2 l9_1483=float2(0.0);
float2 l9_1484=float2(1.0);
float2 l9_1485=float2(0.0);
float2 l9_1486;
if (MESHTYPE_tmp==0)
{
float2 l9_1487=float2(0.0);
float2 l9_1488=(*sc_set0.UserUniforms).rotationRate;
l9_1487=l9_1488;
l9_1484=l9_1487;
l9_1486=l9_1484;
}
else
{
float2 l9_1489=float2(0.0);
float2 l9_1490=(*sc_set0.UserUniforms).rotationRateZ;
l9_1489=l9_1490;
l9_1485=l9_1489;
l9_1486=l9_1485;
}
l9_1483=l9_1486;
float l9_1491=0.0;
float l9_1492=(*sc_set0.UserUniforms).rotationDrag;
l9_1491=l9_1492;
float l9_1493=0.0;
float l9_1494=(*sc_set0.UserUniforms).Port_Input1_N110;
float l9_1495=0.0;
float l9_1496;
if (MESHTYPE_tmp==0)
{
l9_1496=l9_1494;
}
else
{
float l9_1497=0.0;
float l9_1498=float((*sc_set0.UserUniforms).CENTER_BBOX!=0);
l9_1497=l9_1498;
l9_1495=l9_1497;
l9_1496=l9_1495;
}
l9_1493=l9_1496;
float l9_1499=0.0;
float l9_1500=(*sc_set0.UserUniforms).fadeDistanceVisible;
l9_1499=l9_1500;
float l9_1501=0.0;
float l9_1502=(*sc_set0.UserUniforms).fadeDistanceInvisible;
l9_1501=l9_1502;
float4 l9_1503=float4(0.0);
float3 l9_1504=l9_1298;
float l9_1505=l9_1299;
float l9_1506=l9_1300;
float4 l9_1507=l9_1301;
float l9_1508=l9_1302;
float2 l9_1509=l9_1303;
float2 l9_1510=l9_1361;
float l9_1511=l9_1363;
float3 l9_1512=l9_1365;
float3 l9_1513=l9_1366;
float3 l9_1514=l9_1367;
float3 l9_1515=l9_1369;
float3 l9_1516=l9_1371;
float3 l9_1517=l9_1373;
float3 l9_1518=l9_1375;
float3 l9_1519=l9_1377;
float3 l9_1520=l9_1379;
float3 l9_1521=l9_1381;
float3 l9_1522=l9_1383;
float3 l9_1523=l9_1385;
float3 l9_1524=l9_1387;
float3 l9_1525=l9_1395;
float3 l9_1526=l9_1403;
float3 l9_1527=l9_1411;
float3 l9_1528=l9_1419;
float3 l9_1529=l9_1427;
float l9_1530=l9_1435;
float l9_1531=l9_1437;
float l9_1532=l9_1439;
float3 l9_1533=l9_1441;
float l9_1534=l9_1443;
float l9_1535=l9_1445;
float l9_1536=l9_1447;
float l9_1537=l9_1449;
float2 l9_1538=l9_1451;
float2 l9_1539=l9_1457;
float2 l9_1540=l9_1463;
float2 l9_1541=l9_1469;
float2 l9_1542=l9_1475;
float2 l9_1543=l9_1483;
float l9_1544=l9_1491;
float l9_1545=l9_1493;
float l9_1546=l9_1499;
float l9_1547=l9_1501;
ssGlobals l9_1548=param_268;
tempGlobals=l9_1548;
float4 l9_1549=float4(0.0);
N111_MESHTYPE_QUAD=MESHTYPE_tmp==0;
N111_particleSeedIn=l9_1504;
N111_globalSeedIn=l9_1505;
N111_particleAlive=l9_1506;
N111_timeValuesIn=l9_1507;
N111_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N111_isTrail=l9_1508!=0.0;
N111_trailHeadTime=l9_1509;
N111_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N111_taper=l9_1510;
N111_ENABLE_TRAILSPIN=(int(TRAILTWIST_tmp)!=0);
N111_trailSizeMult=l9_1511;
N111_ENABLE_TRAILSIZERAMP=(int(TRAILSIZERAMP_tmp)!=0);
N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS=(int(TRAILSIZERAMPSTARTENDASBOUNDS_tmp)!=0);
N111_positionObjectSpace=l9_1512;
N111_normalObjectSpace=l9_1513;
N111_ENABLE_INILOCATION=(int(INILOCATION_tmp)!=0);
N111_spawnLocation=l9_1514;
N111_ENABLE_BOXSPAWN=(int(BOXSPAWN_tmp)!=0);
N111_spawnBox=l9_1515;
N111_ENABLE_SPHERESPAWN=(int(SPHERESPAWN_tmp)!=0);
N111_spawnSphere=l9_1516;
N111_ENABLE_NOISE=(int(NOISE_tmp)!=0);
N111_noiseMult=l9_1517;
N111_noiseFrequency=l9_1518;
N111_ENABLE_SNOISE=(int(SNOISE_tmp)!=0);
N111_sNoiseMult=l9_1519;
N111_sNoiseFrequency=l9_1520;
N111_ENABLE_VELRAMP=(int(VELRAMP_tmp)!=0);
N111_velocityMin=l9_1521;
N111_velocityMax=l9_1522;
N111_velocityDrag=l9_1523;
N111_sizeStart=l9_1524;
N111_sizeEnd=l9_1525;
N111_ENABLE_SIZEMINMAX=(int(SIZEMINMAX_tmp)!=0);
N111_sizeStartMin=l9_1526;
N111_sizeStartMax=l9_1527;
N111_sizeEndMin=l9_1528;
N111_sizeEndMax=l9_1529;
N111_sizeSpeed=l9_1530;
N111_ENABLE_SIZERAMP=(int(SIZERAMP_tmp)!=0);
N111_ENABLE_SIZERAMPSTARTENDASBOUNDS=l9_1531!=0.0;
N111_gravity=l9_1532;
N111_ENABLE_FORCE=(int(FORCE_tmp)!=0);
N111_localForce=l9_1533;
N111_ENABLE_ALIGNQUADTOCAMERAUP=(int(ALIGNTOCAMERAUP_tmp)!=0);
N111_ENABLE_ALIGNTOVEL=(int(VELOCITYDIR_tmp)!=0);
N111_sizeVelScale=l9_1534;
N111_ENABLE_IGNOREVEL=(int(IGNOREVEL_tmp)!=0);
N111_ENABLE_IGNORETRANSFORMSCALE=(int(IGNORETRANSFORMSCALE_tmp)!=0);
N111_ENABLE_ALIGNTOX=l9_1535!=0.0;
N111_ENABLE_ALIGNTOY=l9_1536!=0.0;
N111_ENABLE_ALIGNTOZ=l9_1537!=0.0;
N111_rotationRandomX=l9_1538;
N111_rotationRateX=l9_1539;
N111_rotationRandomY=l9_1540;
N111_rotationRateY=l9_1541;
N111_rotationRandomZ=l9_1542;
N111_rotationRateZ=l9_1543;
N111_rotationDrag=l9_1544;
N111_WORLDSPACE=rotationSpace_tmp==1;
N111_WORLDFORCE=rotationSpace_tmp==2;
N111_ENABLE_CENTER_IN_BBOX=l9_1545!=0.0;
N111_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N111_fadeDistanceVisible=l9_1546;
N111_fadeDistanceInvisible=l9_1547;
float3 l9_1550=float3(0.0);
N111_particleSeed=N111_particleSeedIn;
N111_globalSeed=N111_globalSeedIn;
float l9_1551=N111_particleSeed.x;
float l9_1552=N111_particleSeed.y;
float l9_1553=N111_particleSeed.z;
float3 l9_1554=fract((float3(l9_1551,l9_1552,l9_1553)*3048.28)+float3(N111_globalSeed))-float3(0.5);
float3 l9_1555=fract((N111_particleSeed*374.57129)+float3(N111_globalSeed))-float3(0.5);
float3 l9_1556=normalize(l9_1555+float3(N111_EPSILON));
float l9_1557=fract(N111_particleSeed.x+N111_globalSeed);
float l9_1558=l9_1557;
float l9_1559=0.33333334;
float l9_1560;
if (l9_1558<=0.0)
{
l9_1560=0.0;
}
else
{
l9_1560=pow(l9_1558,l9_1559);
}
float l9_1561=l9_1560;
float l9_1562=l9_1561;
l9_1556*=l9_1562;
l9_1556/=float3(2.0);
float l9_1563=fract((N111_particleSeed.x*334.59122)+N111_globalSeed)-0.5;
float l9_1564=fract((N111_particleSeed.y*41.231232)+N111_globalSeed)-0.5;
float l9_1565=fract((N111_particleSeed.z*18.984529)+N111_globalSeed);
float l9_1566=fract((N111_particleSeed.x*654.15588)+N111_globalSeed);
float l9_1567=fract((N111_particleSeed.y*45.722408)+N111_globalSeed);
float3 l9_1568=(float3(l9_1566,l9_1567,l9_1565)-float3(0.5))*2.0;
float3 l9_1569=float3(l9_1566,l9_1567,l9_1565);
float l9_1570=fract((N111_particleSeed.z*15.32451)+N111_globalSeed);
float2 l9_1571=N111_timeValuesIn.xy;
float l9_1572=N111_timeValuesIn.z;
float l9_1573=N111_timeValuesIn.w;
N111_cameraFade_trailHeadTime_taper=float4(0.0);
float3 l9_1574=l9_1550;
float3 l9_1575=l9_1550;
float3 l9_1576=l9_1550;
if (N111_ENABLE_INILOCATION)
{
l9_1576=N111_spawnLocation;
}
if (N111_ENABLE_BOXSPAWN)
{
l9_1574=N111_spawnBox*l9_1554;
}
if (N111_ENABLE_SPHERESPAWN)
{
l9_1575=N111_spawnSphere*l9_1556;
}
float3 l9_1577=(l9_1576+l9_1575)+l9_1574;
float3 l9_1578=l9_1550;
if (N111_ENABLE_NOISE)
{
float3 l9_1579=N111_noiseFrequency;
float3 l9_1580=N111_noiseMult;
float3 l9_1581=l9_1568;
float l9_1582=l9_1573;
float l9_1583=sin(l9_1582*l9_1579.x);
float l9_1584=sin(l9_1582*l9_1579.y);
float l9_1585=sin(l9_1582*l9_1579.z);
float3 l9_1586=(float3(l9_1583,l9_1584,l9_1585)*l9_1580)*l9_1581;
float3 l9_1587=l9_1586;
l9_1578+=l9_1587;
}
if (N111_ENABLE_SNOISE)
{
float l9_1588=l9_1565;
float l9_1589=l9_1566;
float l9_1590=l9_1567;
float3 l9_1591=N111_sNoiseFrequency;
float3 l9_1592=N111_sNoiseMult;
float3 l9_1593=l9_1568;
float l9_1594=l9_1572;
float2 l9_1595=float2(l9_1588*l9_1594,l9_1591.x);
float2 l9_1596=floor(l9_1595+float2(dot(l9_1595,float2(0.36602542))));
float2 l9_1597=(l9_1595-l9_1596)+float2(dot(l9_1596,float2(0.21132487)));
float2 l9_1598=float2(0.0);
bool2 l9_1599=bool2(l9_1597.x>l9_1597.y);
l9_1598=float2(l9_1599.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_1599.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_1600=l9_1597.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_1601=l9_1600.xy-l9_1598;
l9_1600=float4(l9_1601.x,l9_1601.y,l9_1600.z,l9_1600.w);
l9_1596=mod(l9_1596,float2(289.0));
float3 l9_1602=float3(l9_1596.y)+float3(0.0,l9_1598.y,1.0);
float3 l9_1603=mod(((l9_1602*34.0)+float3(1.0))*l9_1602,float3(289.0));
float3 l9_1604=(l9_1603+float3(l9_1596.x))+float3(0.0,l9_1598.x,1.0);
float3 l9_1605=mod(((l9_1604*34.0)+float3(1.0))*l9_1604,float3(289.0));
float3 l9_1606=l9_1605;
float3 l9_1607=fast::max(float3(0.5)-float3(dot(l9_1597,l9_1597),dot(l9_1600.xy,l9_1600.xy),dot(l9_1600.zw,l9_1600.zw)),float3(0.0));
l9_1607*=l9_1607;
l9_1607*=l9_1607;
float3 l9_1608=(fract(l9_1606*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_1609=abs(l9_1608)-float3(0.5);
float3 l9_1610=floor(l9_1608+float3(0.5));
float3 l9_1611=l9_1608-l9_1610;
l9_1607*=(float3(1.7928429)-(((l9_1611*l9_1611)+(l9_1609*l9_1609))*0.85373473));
float3 l9_1612=float3(0.0);
l9_1612.x=(l9_1611.x*l9_1597.x)+(l9_1609.x*l9_1597.y);
float2 l9_1613=(l9_1611.yz*l9_1600.xz)+(l9_1609.yz*l9_1600.yw);
l9_1612=float3(l9_1612.x,l9_1613.x,l9_1613.y);
float l9_1614=130.0*dot(l9_1607,l9_1612);
float l9_1615=l9_1614;
float2 l9_1616=float2(l9_1589*l9_1594,l9_1591.y);
float2 l9_1617=floor(l9_1616+float2(dot(l9_1616,float2(0.36602542))));
float2 l9_1618=(l9_1616-l9_1617)+float2(dot(l9_1617,float2(0.21132487)));
float2 l9_1619=float2(0.0);
bool2 l9_1620=bool2(l9_1618.x>l9_1618.y);
l9_1619=float2(l9_1620.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_1620.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_1621=l9_1618.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_1622=l9_1621.xy-l9_1619;
l9_1621=float4(l9_1622.x,l9_1622.y,l9_1621.z,l9_1621.w);
l9_1617=mod(l9_1617,float2(289.0));
float3 l9_1623=float3(l9_1617.y)+float3(0.0,l9_1619.y,1.0);
float3 l9_1624=mod(((l9_1623*34.0)+float3(1.0))*l9_1623,float3(289.0));
float3 l9_1625=(l9_1624+float3(l9_1617.x))+float3(0.0,l9_1619.x,1.0);
float3 l9_1626=mod(((l9_1625*34.0)+float3(1.0))*l9_1625,float3(289.0));
float3 l9_1627=l9_1626;
float3 l9_1628=fast::max(float3(0.5)-float3(dot(l9_1618,l9_1618),dot(l9_1621.xy,l9_1621.xy),dot(l9_1621.zw,l9_1621.zw)),float3(0.0));
l9_1628*=l9_1628;
l9_1628*=l9_1628;
float3 l9_1629=(fract(l9_1627*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_1630=abs(l9_1629)-float3(0.5);
float3 l9_1631=floor(l9_1629+float3(0.5));
float3 l9_1632=l9_1629-l9_1631;
l9_1628*=(float3(1.7928429)-(((l9_1632*l9_1632)+(l9_1630*l9_1630))*0.85373473));
float3 l9_1633=float3(0.0);
l9_1633.x=(l9_1632.x*l9_1618.x)+(l9_1630.x*l9_1618.y);
float2 l9_1634=(l9_1632.yz*l9_1621.xz)+(l9_1630.yz*l9_1621.yw);
l9_1633=float3(l9_1633.x,l9_1634.x,l9_1634.y);
float l9_1635=130.0*dot(l9_1628,l9_1633);
float l9_1636=l9_1635;
float2 l9_1637=float2(l9_1590*l9_1594,l9_1591.z);
float2 l9_1638=floor(l9_1637+float2(dot(l9_1637,float2(0.36602542))));
float2 l9_1639=(l9_1637-l9_1638)+float2(dot(l9_1638,float2(0.21132487)));
float2 l9_1640=float2(0.0);
bool2 l9_1641=bool2(l9_1639.x>l9_1639.y);
l9_1640=float2(l9_1641.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_1641.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_1642=l9_1639.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_1643=l9_1642.xy-l9_1640;
l9_1642=float4(l9_1643.x,l9_1643.y,l9_1642.z,l9_1642.w);
l9_1638=mod(l9_1638,float2(289.0));
float3 l9_1644=float3(l9_1638.y)+float3(0.0,l9_1640.y,1.0);
float3 l9_1645=mod(((l9_1644*34.0)+float3(1.0))*l9_1644,float3(289.0));
float3 l9_1646=(l9_1645+float3(l9_1638.x))+float3(0.0,l9_1640.x,1.0);
float3 l9_1647=mod(((l9_1646*34.0)+float3(1.0))*l9_1646,float3(289.0));
float3 l9_1648=l9_1647;
float3 l9_1649=fast::max(float3(0.5)-float3(dot(l9_1639,l9_1639),dot(l9_1642.xy,l9_1642.xy),dot(l9_1642.zw,l9_1642.zw)),float3(0.0));
l9_1649*=l9_1649;
l9_1649*=l9_1649;
float3 l9_1650=(fract(l9_1648*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_1651=abs(l9_1650)-float3(0.5);
float3 l9_1652=floor(l9_1650+float3(0.5));
float3 l9_1653=l9_1650-l9_1652;
l9_1649*=(float3(1.7928429)-(((l9_1653*l9_1653)+(l9_1651*l9_1651))*0.85373473));
float3 l9_1654=float3(0.0);
l9_1654.x=(l9_1653.x*l9_1639.x)+(l9_1651.x*l9_1639.y);
float2 l9_1655=(l9_1653.yz*l9_1642.xz)+(l9_1651.yz*l9_1642.yw);
l9_1654=float3(l9_1654.x,l9_1655.x,l9_1655.y);
float l9_1656=130.0*dot(l9_1649,l9_1654);
float l9_1657=l9_1656;
float3 l9_1658=(float3(l9_1615,l9_1636,l9_1657)*l9_1592)*l9_1593;
l9_1578+=l9_1658;
}
float3 l9_1659=float3(0.0,((N111_gravity/2.0)*l9_1572)*l9_1572,0.0);
float3 l9_1660=l9_1550;
if (N111_ENABLE_FORCE)
{
l9_1660=((N111_localForce/float3(2.0))*l9_1572)*l9_1572;
}
float3 l9_1661=l9_1550;
float3 l9_1662=N111_velocityMin+(((l9_1568+float3(1.0))/float3(2.0))*(N111_velocityMax-N111_velocityMin));
if (N111_ENABLE_VELRAMP)
{
l9_1662=mix(N111_velocityMin,N111_velocityMax,l9_1569);
}
float3 l9_1663=l9_1662;
float l9_1664=l9_1572;
float3 l9_1665=N111_velocityDrag;
float3 l9_1666=l9_1578;
float l9_1667=l9_1573;
float3 l9_1668=float3(l9_1664,l9_1664,l9_1664);
float3 l9_1669=l9_1665;
float l9_1670;
if (l9_1668.x<=0.0)
{
l9_1670=0.0;
}
else
{
l9_1670=pow(l9_1668.x,l9_1669.x);
}
float l9_1671=l9_1670;
float l9_1672;
if (l9_1668.y<=0.0)
{
l9_1672=0.0;
}
else
{
l9_1672=pow(l9_1668.y,l9_1669.y);
}
float l9_1673=l9_1672;
float l9_1674;
if (l9_1668.z<=0.0)
{
l9_1674=0.0;
}
else
{
l9_1674=pow(l9_1668.z,l9_1669.z);
}
float3 l9_1675=float3(l9_1671,l9_1673,l9_1674);
float3 l9_1676=l9_1675;
float3 l9_1677=(l9_1663+l9_1666)*l9_1676;
if (N111_ENABLE_VELRAMP)
{
float l9_1678=floor(l9_1667*10000.0)/10000.0;
float2 l9_1679=tempGlobals.Surface_UVCoord0;
float2 l9_1680=(l9_1679/float2(10000.0,1.0))+float2(l9_1678,0.0);
float2 l9_1681=l9_1680;
float4 l9_1682=float4(0.0);
int l9_1683=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_1684=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1684=0;
}
else
{
l9_1684=gl_InstanceIndex%2;
}
int l9_1685=l9_1684;
l9_1683=1-l9_1685;
}
else
{
int l9_1686=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1686=0;
}
else
{
l9_1686=gl_InstanceIndex%2;
}
int l9_1687=l9_1686;
l9_1683=l9_1687;
}
int l9_1688=l9_1683;
int l9_1689=velRampTextureLayout_tmp;
int l9_1690=l9_1688;
float2 l9_1691=l9_1681;
bool l9_1692=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_1693=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_1694=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_1695=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_1696=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_1697=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_1698=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_1699=0.0;
bool l9_1700=l9_1697&&(!l9_1695);
float l9_1701=1.0;
float l9_1702=l9_1691.x;
int l9_1703=l9_1694.x;
if (l9_1703==1)
{
l9_1702=fract(l9_1702);
}
else
{
if (l9_1703==2)
{
float l9_1704=fract(l9_1702);
float l9_1705=l9_1702-l9_1704;
float l9_1706=step(0.25,fract(l9_1705*0.5));
l9_1702=mix(l9_1704,1.0-l9_1704,fast::clamp(l9_1706,0.0,1.0));
}
}
l9_1691.x=l9_1702;
float l9_1707=l9_1691.y;
int l9_1708=l9_1694.y;
if (l9_1708==1)
{
l9_1707=fract(l9_1707);
}
else
{
if (l9_1708==2)
{
float l9_1709=fract(l9_1707);
float l9_1710=l9_1707-l9_1709;
float l9_1711=step(0.25,fract(l9_1710*0.5));
l9_1707=mix(l9_1709,1.0-l9_1709,fast::clamp(l9_1711,0.0,1.0));
}
}
l9_1691.y=l9_1707;
if (l9_1695)
{
bool l9_1712=l9_1697;
bool l9_1713;
if (l9_1712)
{
l9_1713=l9_1694.x==3;
}
else
{
l9_1713=l9_1712;
}
float l9_1714=l9_1691.x;
float l9_1715=l9_1696.x;
float l9_1716=l9_1696.z;
bool l9_1717=l9_1713;
float l9_1718=l9_1701;
float l9_1719=fast::clamp(l9_1714,l9_1715,l9_1716);
float l9_1720=step(abs(l9_1714-l9_1719),9.9999997e-06);
l9_1718*=(l9_1720+((1.0-float(l9_1717))*(1.0-l9_1720)));
l9_1714=l9_1719;
l9_1691.x=l9_1714;
l9_1701=l9_1718;
bool l9_1721=l9_1697;
bool l9_1722;
if (l9_1721)
{
l9_1722=l9_1694.y==3;
}
else
{
l9_1722=l9_1721;
}
float l9_1723=l9_1691.y;
float l9_1724=l9_1696.y;
float l9_1725=l9_1696.w;
bool l9_1726=l9_1722;
float l9_1727=l9_1701;
float l9_1728=fast::clamp(l9_1723,l9_1724,l9_1725);
float l9_1729=step(abs(l9_1723-l9_1728),9.9999997e-06);
l9_1727*=(l9_1729+((1.0-float(l9_1726))*(1.0-l9_1729)));
l9_1723=l9_1728;
l9_1691.y=l9_1723;
l9_1701=l9_1727;
}
float2 l9_1730=l9_1691;
bool l9_1731=l9_1692;
float3x3 l9_1732=l9_1693;
if (l9_1731)
{
l9_1730=float2((l9_1732*float3(l9_1730,1.0)).xy);
}
float2 l9_1733=l9_1730;
float2 l9_1734=l9_1733;
float2 l9_1735=l9_1734;
l9_1691=l9_1735;
float l9_1736=l9_1691.x;
int l9_1737=l9_1694.x;
bool l9_1738=l9_1700;
float l9_1739=l9_1701;
if ((l9_1737==0)||(l9_1737==3))
{
float l9_1740=l9_1736;
float l9_1741=0.0;
float l9_1742=1.0;
bool l9_1743=l9_1738;
float l9_1744=l9_1739;
float l9_1745=fast::clamp(l9_1740,l9_1741,l9_1742);
float l9_1746=step(abs(l9_1740-l9_1745),9.9999997e-06);
l9_1744*=(l9_1746+((1.0-float(l9_1743))*(1.0-l9_1746)));
l9_1740=l9_1745;
l9_1736=l9_1740;
l9_1739=l9_1744;
}
l9_1691.x=l9_1736;
l9_1701=l9_1739;
float l9_1747=l9_1691.y;
int l9_1748=l9_1694.y;
bool l9_1749=l9_1700;
float l9_1750=l9_1701;
if ((l9_1748==0)||(l9_1748==3))
{
float l9_1751=l9_1747;
float l9_1752=0.0;
float l9_1753=1.0;
bool l9_1754=l9_1749;
float l9_1755=l9_1750;
float l9_1756=fast::clamp(l9_1751,l9_1752,l9_1753);
float l9_1757=step(abs(l9_1751-l9_1756),9.9999997e-06);
l9_1755*=(l9_1757+((1.0-float(l9_1754))*(1.0-l9_1757)));
l9_1751=l9_1756;
l9_1747=l9_1751;
l9_1750=l9_1755;
}
l9_1691.y=l9_1747;
l9_1701=l9_1750;
float2 l9_1758=l9_1691;
int l9_1759=l9_1689;
int l9_1760=l9_1690;
float l9_1761=l9_1699;
float2 l9_1762=l9_1758;
int l9_1763=l9_1759;
int l9_1764=l9_1760;
float3 l9_1765=float3(0.0);
if (l9_1763==0)
{
l9_1765=float3(l9_1762,0.0);
}
else
{
if (l9_1763==1)
{
l9_1765=float3(l9_1762.x,(l9_1762.y*0.5)+(0.5-(float(l9_1764)*0.5)),0.0);
}
else
{
l9_1765=float3(l9_1762,float(l9_1764));
}
}
float3 l9_1766=l9_1765;
float3 l9_1767=l9_1766;
float2 l9_1768=l9_1767.xy;
float l9_1769=l9_1761;
float4 l9_1770=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_1768,level(l9_1769));
float4 l9_1771=l9_1770;
float4 l9_1772=l9_1771;
if (l9_1697)
{
l9_1772=mix(l9_1698,l9_1772,float4(l9_1701));
}
float4 l9_1773=l9_1772;
l9_1682=l9_1773;
float4 l9_1774=l9_1682;
float3 l9_1775=l9_1774.xyz;
l9_1677=(l9_1663+l9_1666)*l9_1775;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_1677=l9_1663*l9_1676;
}
}
float3 l9_1776=l9_1677;
l9_1661=l9_1776;
if (N111_ENABLE_TRAILS)
{
if (N111_isTrail)
{
float2 l9_1777=tempGlobals.Surface_UVCoord0;
float2 l9_1778=l9_1777;
float l9_1779=mix(1.0,l9_1778.y,1.0-N111_taper.x);
l9_1779*=mix(1.0,1.0-l9_1778.y,1.0-N111_taper.y);
N111_cameraFade_trailHeadTime_taper=float4(N111_cameraFade_trailHeadTime_taper.x,N111_trailHeadTime.x,N111_trailHeadTime.y,N111_cameraFade_trailHeadTime_taper.w);
N111_cameraFade_trailHeadTime_taper.w=l9_1779;
}
}
float4x4 l9_1780=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1781=length(l9_1780[0].xyz);
float4x4 l9_1782=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1783=length(l9_1782[1].xyz);
float4x4 l9_1784=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1785=length(l9_1784[2].xyz);
float3 l9_1786=float3(l9_1781,l9_1783,l9_1785);
float4x4 l9_1787=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1788=l9_1787;
float4 l9_1789=l9_1788[0];
float4 l9_1790=l9_1788[1];
float4 l9_1791=l9_1788[2];
float3x3 l9_1792=float3x3(float3(float3(l9_1789.x,l9_1790.x,l9_1791.x)),float3(float3(l9_1789.y,l9_1790.y,l9_1791.y)),float3(float3(l9_1789.z,l9_1790.z,l9_1791.z)));
float3x3 l9_1793=l9_1792;
float3 l9_1794=((l9_1661+l9_1659)+l9_1660)*l9_1793;
if (N111_WORLDFORCE)
{
float4x4 l9_1795=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1796=l9_1795;
float4 l9_1797=l9_1796[0];
float4 l9_1798=l9_1796[1];
float4 l9_1799=l9_1796[2];
float3x3 l9_1800=float3x3(float3(float3(l9_1797.x,l9_1798.x,l9_1799.x)),float3(float3(l9_1797.y,l9_1798.y,l9_1799.y)),float3(float3(l9_1797.z,l9_1798.z,l9_1799.z)));
float3x3 l9_1801=l9_1800;
l9_1794=((l9_1661*l9_1801)+l9_1659)+l9_1660;
}
if (N111_WORLDSPACE)
{
l9_1794=((l9_1661*l9_1786)+l9_1659)+l9_1660;
}
float4x4 l9_1802=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_1803=(l9_1802*float4(l9_1577,1.0)).xyz+l9_1794;
float l9_1804=mix(N111_rotationRandomZ.x,N111_rotationRandomZ.y,l9_1570);
float l9_1805=1.0-l9_1573;
float l9_1806=N111_rotationDrag;
float l9_1807;
if (l9_1805<=0.0)
{
l9_1807=0.0;
}
else
{
l9_1807=pow(l9_1805,l9_1806);
}
float l9_1808=l9_1807;
float l9_1809=l9_1808;
float l9_1810=mix(N111_rotationRateZ.x,N111_rotationRateZ.y,l9_1570);
float l9_1811=((l9_1810*l9_1809)*l9_1573)*2.0;
float l9_1812=N111_PI*((l9_1811+l9_1804)-0.5);
float l9_1813=1.0;
if (N111_ENABLE_SCREENFADE)
{
float3 l9_1814=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_1815=l9_1814-l9_1803;
float l9_1816=dot(l9_1815,l9_1815);
float l9_1817=(N111_fadeDistanceInvisible+N111_EPSILON)*(N111_fadeDistanceInvisible+N111_EPSILON);
float l9_1818=N111_fadeDistanceVisible*N111_fadeDistanceVisible;
float l9_1819=fast::min(l9_1817,l9_1818);
float l9_1820=fast::max(l9_1817,l9_1818);
float l9_1821=smoothstep(l9_1819,l9_1820,l9_1816);
float l9_1822;
if (l9_1817>l9_1818)
{
l9_1822=1.0-l9_1821;
}
else
{
l9_1822=l9_1821;
}
l9_1821=l9_1822;
if (l9_1821<=N111_EPSILON)
{
l9_1813=0.0;
}
N111_cameraFade_trailHeadTime_taper.x=l9_1821;
}
if (N111_MESHTYPE_QUAD||N111_ENABLE_TRAILS)
{
if (N111_MESHTYPE_QUAD||N111_isTrail)
{
int l9_1823=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1823=0;
}
else
{
l9_1823=gl_InstanceIndex%2;
}
int l9_1824=l9_1823;
float4x4 l9_1825=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_1824];
float3 l9_1826=normalize(l9_1825[2].xyz);
if (N111_isTrail)
{
l9_1826*=float3(-1.0);
}
float3 l9_1827=float3(0.0,1.0,0.0);
if (N111_ENABLE_ALIGNQUADTOCAMERAUP)
{
int l9_1828=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1828=0;
}
else
{
l9_1828=gl_InstanceIndex%2;
}
int l9_1829=l9_1828;
float3 l9_1830=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_1829][1].xyz;
l9_1827=l9_1830;
}
float3 l9_1831=-normalize(cross(l9_1826,l9_1827));
float3 l9_1832=normalize(cross(l9_1831,l9_1826));
float l9_1833=1.0;
if (N111_ENABLE_ALIGNTOX)
{
l9_1831=float3(0.0,0.0,1.0);
l9_1832=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_1831=float3(1.0,0.0,0.0);
l9_1832=float3(0.0,0.0,1.0);
}
if (N111_ENABLE_ALIGNTOZ)
{
l9_1831=float3(1.0,0.0,0.0);
l9_1832=float3(0.0,1.0,0.0);
}
float2 l9_1834=float2(cos(l9_1812),sin(l9_1812));
float2 l9_1835=float2(-sin(l9_1812),cos(l9_1812));
float3 l9_1836=float3((l9_1831*l9_1834.x)+(l9_1832*l9_1834.y));
float3 l9_1837=float3((l9_1831*l9_1835.x)+(l9_1832*l9_1835.y));
if (N111_ENABLE_ALIGNTOVEL||N111_ENABLE_TRAILS)
{
if (N111_ENABLE_ALIGNTOVEL||N111_isTrail)
{
float3 l9_1838=normalize(((l9_1794+l9_1659)+l9_1660)+float3(N111_EPSILON));
float3 l9_1839=l9_1794*(l9_1572-0.0099999998);
float3 l9_1840=l9_1794*(l9_1572+0.0099999998);
l9_1836=l9_1838;
l9_1837=normalize(cross(l9_1836,l9_1826));
if (N111_ENABLE_TRAILSPIN)
{
if (N111_isTrail)
{
l9_1837=float3((l9_1836*l9_1834.x)+(l9_1837*l9_1834.y));
}
}
if (!N111_isTrail)
{
if (N111_ENABLE_IGNOREVEL)
{
l9_1833=fast::max(N111_sizeVelScale,N111_EPSILON);
}
else
{
l9_1833=length(l9_1840-l9_1839)*N111_sizeVelScale;
if (N111_ENABLE_IGNORETRANSFORMSCALE)
{
float4x4 l9_1841=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_1833=(length(l9_1840-l9_1839)/length(l9_1841[0].xyz))*N111_sizeVelScale;
}
}
}
}
}
float4x4 l9_1842=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_1843=length(l9_1842[0].xyz);
float2 l9_1844=tempGlobals.Surface_UVCoord0;
float l9_1845=l9_1563;
float l9_1846=l9_1564;
float l9_1847=l9_1573;
float l9_1848=N111_sizeSpeed;
float2 l9_1849=(((l9_1844-float2(0.5))*l9_1813)*N111_pSize(l9_1845,l9_1846,l9_1847,l9_1848,N111_isTrail,N111_ENABLE_TRAILS,N111_trailHeadTime,N111_ENABLE_INDEPENDENTTRAIL,N111_trailSizeMult,N111_ENABLE_TRAILSIZERAMP,N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.trailSizeRampTex,sc_set0.trailSizeRampTexSmpSC,sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals))*l9_1843;
float3 l9_1850=(l9_1803+(l9_1837*l9_1849.x))+(l9_1836*(l9_1849.y*l9_1833));
N111_position=l9_1850;
if ((N111_particleAlive<0.5)||(l9_1813<0.5))
{
N111_position/=float3(0.0);
}
N111_normal=l9_1826;
}
}
if (!N111_MESHTYPE_QUAD)
{
if (!N111_isTrail)
{
N111_position=N111_positionObjectSpace;
if (N111_ENABLE_CENTER_IN_BBOX)
{
float3 l9_1851=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_1852=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_1853=(l9_1851+l9_1852)/float3(2.0);
N111_position-=l9_1853;
}
float l9_1854=l9_1563;
float l9_1855=l9_1564;
float l9_1856=l9_1573;
float l9_1857=N111_sizeSpeed;
N111_position=(N111_position*l9_1786)*N111_pSize3D(l9_1854,l9_1855,l9_1856,l9_1857,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals);
if ((N111_particleAlive<0.5)||(l9_1813<0.5))
{
N111_position.x=2.1474836e+09;
}
float3x3 l9_1858;
if (((N111_ENABLE_ALIGNTOVEL||N111_ENABLE_ALIGNTOX)||N111_ENABLE_ALIGNTOY)||N111_ENABLE_ALIGNTOZ)
{
if (N111_ENABLE_ALIGNTOZ)
{
l9_1858=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
}
else
{
float3 l9_1859=float3(0.0);
if (N111_ENABLE_ALIGNTOX)
{
l9_1859=float3(1.0,0.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_1859=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOVEL)
{
float l9_1860=0.001;
float3 l9_1861=l9_1662;
float l9_1862=l9_1572-l9_1860;
float3 l9_1863=N111_velocityDrag;
float3 l9_1864=l9_1578;
float l9_1865=l9_1573-l9_1860;
float3 l9_1866=float3(l9_1862,l9_1862,l9_1862);
float3 l9_1867=l9_1863;
float l9_1868;
if (l9_1866.x<=0.0)
{
l9_1868=0.0;
}
else
{
l9_1868=pow(l9_1866.x,l9_1867.x);
}
float l9_1869=l9_1868;
float l9_1870;
if (l9_1866.y<=0.0)
{
l9_1870=0.0;
}
else
{
l9_1870=pow(l9_1866.y,l9_1867.y);
}
float l9_1871=l9_1870;
float l9_1872;
if (l9_1866.z<=0.0)
{
l9_1872=0.0;
}
else
{
l9_1872=pow(l9_1866.z,l9_1867.z);
}
float3 l9_1873=float3(l9_1869,l9_1871,l9_1872);
float3 l9_1874=l9_1873;
float3 l9_1875=(l9_1861+l9_1864)*l9_1874;
if (N111_ENABLE_VELRAMP)
{
float l9_1876=floor(l9_1865*10000.0)/10000.0;
float2 l9_1877=tempGlobals.Surface_UVCoord0;
float2 l9_1878=(l9_1877/float2(10000.0,1.0))+float2(l9_1876,0.0);
float2 l9_1879=l9_1878;
float4 l9_1880=float4(0.0);
int l9_1881=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_1882=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1882=0;
}
else
{
l9_1882=gl_InstanceIndex%2;
}
int l9_1883=l9_1882;
l9_1881=1-l9_1883;
}
else
{
int l9_1884=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1884=0;
}
else
{
l9_1884=gl_InstanceIndex%2;
}
int l9_1885=l9_1884;
l9_1881=l9_1885;
}
int l9_1886=l9_1881;
int l9_1887=velRampTextureLayout_tmp;
int l9_1888=l9_1886;
float2 l9_1889=l9_1879;
bool l9_1890=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_1891=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_1892=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_1893=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_1894=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_1895=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_1896=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_1897=0.0;
bool l9_1898=l9_1895&&(!l9_1893);
float l9_1899=1.0;
float l9_1900=l9_1889.x;
int l9_1901=l9_1892.x;
if (l9_1901==1)
{
l9_1900=fract(l9_1900);
}
else
{
if (l9_1901==2)
{
float l9_1902=fract(l9_1900);
float l9_1903=l9_1900-l9_1902;
float l9_1904=step(0.25,fract(l9_1903*0.5));
l9_1900=mix(l9_1902,1.0-l9_1902,fast::clamp(l9_1904,0.0,1.0));
}
}
l9_1889.x=l9_1900;
float l9_1905=l9_1889.y;
int l9_1906=l9_1892.y;
if (l9_1906==1)
{
l9_1905=fract(l9_1905);
}
else
{
if (l9_1906==2)
{
float l9_1907=fract(l9_1905);
float l9_1908=l9_1905-l9_1907;
float l9_1909=step(0.25,fract(l9_1908*0.5));
l9_1905=mix(l9_1907,1.0-l9_1907,fast::clamp(l9_1909,0.0,1.0));
}
}
l9_1889.y=l9_1905;
if (l9_1893)
{
bool l9_1910=l9_1895;
bool l9_1911;
if (l9_1910)
{
l9_1911=l9_1892.x==3;
}
else
{
l9_1911=l9_1910;
}
float l9_1912=l9_1889.x;
float l9_1913=l9_1894.x;
float l9_1914=l9_1894.z;
bool l9_1915=l9_1911;
float l9_1916=l9_1899;
float l9_1917=fast::clamp(l9_1912,l9_1913,l9_1914);
float l9_1918=step(abs(l9_1912-l9_1917),9.9999997e-06);
l9_1916*=(l9_1918+((1.0-float(l9_1915))*(1.0-l9_1918)));
l9_1912=l9_1917;
l9_1889.x=l9_1912;
l9_1899=l9_1916;
bool l9_1919=l9_1895;
bool l9_1920;
if (l9_1919)
{
l9_1920=l9_1892.y==3;
}
else
{
l9_1920=l9_1919;
}
float l9_1921=l9_1889.y;
float l9_1922=l9_1894.y;
float l9_1923=l9_1894.w;
bool l9_1924=l9_1920;
float l9_1925=l9_1899;
float l9_1926=fast::clamp(l9_1921,l9_1922,l9_1923);
float l9_1927=step(abs(l9_1921-l9_1926),9.9999997e-06);
l9_1925*=(l9_1927+((1.0-float(l9_1924))*(1.0-l9_1927)));
l9_1921=l9_1926;
l9_1889.y=l9_1921;
l9_1899=l9_1925;
}
float2 l9_1928=l9_1889;
bool l9_1929=l9_1890;
float3x3 l9_1930=l9_1891;
if (l9_1929)
{
l9_1928=float2((l9_1930*float3(l9_1928,1.0)).xy);
}
float2 l9_1931=l9_1928;
float2 l9_1932=l9_1931;
float2 l9_1933=l9_1932;
l9_1889=l9_1933;
float l9_1934=l9_1889.x;
int l9_1935=l9_1892.x;
bool l9_1936=l9_1898;
float l9_1937=l9_1899;
if ((l9_1935==0)||(l9_1935==3))
{
float l9_1938=l9_1934;
float l9_1939=0.0;
float l9_1940=1.0;
bool l9_1941=l9_1936;
float l9_1942=l9_1937;
float l9_1943=fast::clamp(l9_1938,l9_1939,l9_1940);
float l9_1944=step(abs(l9_1938-l9_1943),9.9999997e-06);
l9_1942*=(l9_1944+((1.0-float(l9_1941))*(1.0-l9_1944)));
l9_1938=l9_1943;
l9_1934=l9_1938;
l9_1937=l9_1942;
}
l9_1889.x=l9_1934;
l9_1899=l9_1937;
float l9_1945=l9_1889.y;
int l9_1946=l9_1892.y;
bool l9_1947=l9_1898;
float l9_1948=l9_1899;
if ((l9_1946==0)||(l9_1946==3))
{
float l9_1949=l9_1945;
float l9_1950=0.0;
float l9_1951=1.0;
bool l9_1952=l9_1947;
float l9_1953=l9_1948;
float l9_1954=fast::clamp(l9_1949,l9_1950,l9_1951);
float l9_1955=step(abs(l9_1949-l9_1954),9.9999997e-06);
l9_1953*=(l9_1955+((1.0-float(l9_1952))*(1.0-l9_1955)));
l9_1949=l9_1954;
l9_1945=l9_1949;
l9_1948=l9_1953;
}
l9_1889.y=l9_1945;
l9_1899=l9_1948;
float2 l9_1956=l9_1889;
int l9_1957=l9_1887;
int l9_1958=l9_1888;
float l9_1959=l9_1897;
float2 l9_1960=l9_1956;
int l9_1961=l9_1957;
int l9_1962=l9_1958;
float3 l9_1963=float3(0.0);
if (l9_1961==0)
{
l9_1963=float3(l9_1960,0.0);
}
else
{
if (l9_1961==1)
{
l9_1963=float3(l9_1960.x,(l9_1960.y*0.5)+(0.5-(float(l9_1962)*0.5)),0.0);
}
else
{
l9_1963=float3(l9_1960,float(l9_1962));
}
}
float3 l9_1964=l9_1963;
float3 l9_1965=l9_1964;
float2 l9_1966=l9_1965.xy;
float l9_1967=l9_1959;
float4 l9_1968=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_1966,level(l9_1967));
float4 l9_1969=l9_1968;
float4 l9_1970=l9_1969;
if (l9_1895)
{
l9_1970=mix(l9_1896,l9_1970,float4(l9_1899));
}
float4 l9_1971=l9_1970;
l9_1880=l9_1971;
float4 l9_1972=l9_1880;
float3 l9_1973=l9_1972.xyz;
l9_1875=(l9_1861+l9_1864)*l9_1973;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_1875=l9_1861*l9_1874;
}
}
float3 l9_1974=l9_1875;
float3 l9_1975=l9_1974;
float l9_1976=((N111_gravity/2.0)*(l9_1572-l9_1860))*(l9_1572-l9_1860);
l9_1659.y-=l9_1976;
if (N111_ENABLE_FORCE)
{
float3 l9_1977=float3(((N111_localForce/float3(2.0))*(l9_1572-l9_1860))*(l9_1572-l9_1860));
l9_1660-=l9_1977;
}
if (N111_WORLDFORCE)
{
float4x4 l9_1978=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1979=l9_1978;
float4 l9_1980=l9_1979[0];
float4 l9_1981=l9_1979[1];
float4 l9_1982=l9_1979[2];
float3x3 l9_1983=float3x3(float3(float3(l9_1980.x,l9_1981.x,l9_1982.x)),float3(float3(l9_1980.y,l9_1981.y,l9_1982.y)),float3(float3(l9_1980.z,l9_1981.z,l9_1982.z)));
float3x3 l9_1984=l9_1983;
l9_1859=(((l9_1661-l9_1975)*l9_1984)+l9_1659)+l9_1660;
}
else
{
if (N111_WORLDSPACE)
{
l9_1859=((l9_1661-l9_1975)+l9_1659)+l9_1660;
}
else
{
float4x4 l9_1985=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_1986=l9_1985;
float4 l9_1987=l9_1986[0];
float4 l9_1988=l9_1986[1];
float4 l9_1989=l9_1986[2];
float3x3 l9_1990=float3x3(float3(float3(l9_1987.x,l9_1988.x,l9_1989.x)),float3(float3(l9_1987.y,l9_1988.y,l9_1989.y)),float3(float3(l9_1987.z,l9_1988.z,l9_1989.z)));
float3x3 l9_1991=l9_1990;
l9_1859=(((l9_1661-l9_1975)+l9_1660)+l9_1659)*l9_1991;
}
}
l9_1859=normalize(l9_1859+float3(N111_EPSILON));
}
float3 l9_1992=float3(0.0,0.0,1.0);
float3 l9_1993=cross(l9_1859,l9_1992);
float3 l9_1994=normalize(l9_1993);
float l9_1995=length(l9_1993);
float l9_1996=dot(l9_1992,l9_1859);
float l9_1997=1.0-l9_1996;
l9_1858=float3x3(float3(((l9_1997*l9_1994.x)*l9_1994.x)+l9_1996,((l9_1997*l9_1994.x)*l9_1994.y)-(l9_1994.z*l9_1995),((l9_1997*l9_1994.z)*l9_1994.x)+(l9_1994.y*l9_1995)),float3(((l9_1997*l9_1994.x)*l9_1994.y)+(l9_1994.z*l9_1995),((l9_1997*l9_1994.y)*l9_1994.y)+l9_1996,((l9_1997*l9_1994.y)*l9_1994.z)-(l9_1994.x*l9_1995)),float3(((l9_1997*l9_1994.z)*l9_1994.x)-(l9_1994.y*l9_1995),((l9_1997*l9_1994.y)*l9_1994.z)+(l9_1994.x*l9_1995),((l9_1997*l9_1994.z)*l9_1994.z)+l9_1996));
}
float3x3 l9_1998=float3x3(float3(cos(l9_1812),-sin(l9_1812),0.0),float3(sin(l9_1812),cos(l9_1812),0.0),float3(0.0,0.0,1.0));
l9_1858=l9_1858*l9_1998;
if (N111_ENABLE_ALIGNTOVEL&&(!N111_ENABLE_IGNOREVEL))
{
float3 l9_1999=l9_1794*(l9_1572-0.0099999998);
float3 l9_2000=l9_1794*(l9_1572+0.0099999998);
N111_position.z*=(length(l9_2000-l9_1999)*fast::max(N111_sizeVelScale,0.1));
}
}
else
{
float l9_2001=fract((N111_particleSeed.x*92.653008)+N111_globalSeed);
float l9_2002=mix(N111_rotationRandomX.x,N111_rotationRandomX.y,l9_2001);
float l9_2003=mix(N111_rotationRateX.x,N111_rotationRateX.y,l9_2001);
float l9_2004=((l9_2003*l9_1809)*l9_1573)*2.0;
float l9_2005=fract((N111_particleSeed.y*6.7557559)+N111_globalSeed);
float l9_2006=mix(N111_rotationRandomY.x,N111_rotationRandomY.y,l9_2005);
float l9_2007=mix(N111_rotationRateY.x,N111_rotationRateY.y,l9_2005);
float l9_2008=((l9_2007*l9_1809)*l9_1573)*2.0;
float l9_2009=N111_PI*(l9_2004+l9_2002);
float l9_2010=N111_PI*(l9_2008+l9_2006);
float l9_2011=N111_PI*(l9_1811+l9_1804);
float3 l9_2012=float3(l9_2009,l9_2010,l9_2011);
float l9_2013=cos(l9_2012.x);
float l9_2014=sin(l9_2012.x);
float l9_2015=cos(l9_2012.y);
float l9_2016=sin(l9_2012.y);
float l9_2017=cos(l9_2012.z);
float l9_2018=sin(l9_2012.z);
l9_1858=float3x3(float3(l9_2015*l9_2017,(l9_2013*l9_2018)+((l9_2014*l9_2016)*l9_2017),(l9_2014*l9_2018)-((l9_2013*l9_2016)*l9_2017)),float3((-l9_2015)*l9_2018,(l9_2013*l9_2017)-((l9_2014*l9_2016)*l9_2018),(l9_2014*l9_2017)+((l9_2013*l9_2016)*l9_2018)),float3(l9_2016,(-l9_2014)*l9_2015,l9_2013*l9_2015));
}
if ((!N111_WORLDSPACE)&&(!N111_ENABLE_ALIGNTOVEL))
{
float4x4 l9_2019=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2020=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2021=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3x3 l9_2022=float3x3(float3(l9_2019[0].xyz/float3(l9_1786.x)),float3(l9_2020[1].xyz/float3(l9_1786.y)),float3(l9_2021[2].xyz/float3(l9_1786.z)));
l9_1858=l9_2022*l9_1858;
}
N111_position=l9_1858*N111_position;
N111_normal=normalize(l9_1858*N111_normalObjectSpace);
N111_position+=l9_1803;
}
}
N111_timeValues=float4(l9_1571,l9_1572,l9_1573);
l9_1549=N111_timeValues;
l9_1503=l9_1549;
l9_1275=l9_1503;
out.Interpolator0.x=l9_1275.x;
out.Interpolator0.y=l9_1275.y;
out.Interpolator0.z=l9_1275.z;
out.Interpolator0.w=l9_1275.w;
ssGlobals param_269=Globals;
float4 l9_2023=float4(0.0);
float l9_2024=0.0;
float l9_2025=(*sc_set0.UserUniforms).timeGlobal;
l9_2024=l9_2025;
float l9_2026=0.0;
float l9_2027=(*sc_set0.UserUniforms).externalTimeInput;
l9_2026=l9_2027;
float l9_2028=0.0;
float l9_2029=(*sc_set0.UserUniforms).externalSeed;
l9_2028=l9_2029;
float l9_2030=0.0;
float l9_2031=(*sc_set0.UserUniforms).lifeTimeConstant;
l9_2030=l9_2031;
float2 l9_2032=float2(0.0);
float2 l9_2033=(*sc_set0.UserUniforms).lifeTimeMinMax;
l9_2032=l9_2033;
float l9_2034=0.0;
float l9_2035=(*sc_set0.UserUniforms).spawnDuration;
l9_2034=l9_2035;
float l9_2036=0.0;
float l9_2037;
if ((int(TRAILS_tmp)!=0))
{
l9_2037=1.001;
}
else
{
l9_2037=0.001;
}
l9_2037-=0.001;
l9_2036=l9_2037;
float l9_2038=0.0;
float l9_2039=(*sc_set0.UserUniforms).trailLength;
l9_2038=l9_2039;
float4 l9_2040=float4(0.0);
l9_2040=param_269.VertexColor;
float l9_2041=0.0;
l9_2041=l9_2040.x;
float l9_2042=0.0;
float l9_2043=l9_2036;
bool l9_2044=(l9_2043*1.0)!=0.0;
bool l9_2045;
if (l9_2044)
{
l9_2045=(l9_2041*1.0)!=0.0;
}
else
{
l9_2045=l9_2044;
}
l9_2042=float(l9_2045);
float3 l9_2046=float3(0.0);
float l9_2047=0.0;
float l9_2048=0.0;
float4 l9_2049=float4(0.0);
float l9_2050=0.0;
float2 l9_2051=float2(0.0);
float l9_2052=l9_2024;
float l9_2053=l9_2026;
float l9_2054=l9_2028;
float l9_2055=l9_2030;
float2 l9_2056=l9_2032;
float l9_2057=l9_2034;
float l9_2058=l9_2038;
float l9_2059=l9_2042;
ssGlobals l9_2060=param_269;
tempGlobals=l9_2060;
float3 l9_2061=float3(0.0);
float l9_2062=0.0;
float l9_2063=0.0;
float4 l9_2064=float4(0.0);
float l9_2065=0.0;
float2 l9_2066=float2(0.0);
N181_timeGlobal=l9_2052;
N181_ENABLE_EXTERNALTIME=(int(EXTERNALTIME_tmp)!=0);
N181_externalTime=l9_2053;
N181_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N181_externalSeed=l9_2054;
N181_ENABLE_LIFETIMEMINMAX=(int(LIFETIMEMINMAX_tmp)!=0);
N181_lifeTimeConstant=l9_2055;
N181_lifeTimeMinMax=l9_2056;
N181_ENABLE_INSTANTSPAWN=(int(INSTANTSPAWN_tmp)!=0);
N181_spawnDuration=l9_2057;
N181_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N181_trailLength=l9_2058;
N181_isTrailCondition=l9_2059!=0.0;
N181_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
float l9_2067=0.0;
if (N181_ENABLE_WORLDPOSSEED)
{
float4x4 l9_2068=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_2067=length(float4(1.0)*l9_2068);
}
N181_globalSeed=N181_externalSeed+l9_2067;
int l9_2069=0;
int l9_2070=gl_InstanceIndex;
l9_2069=l9_2070;
int l9_2071=l9_2069;
float l9_2072=float(l9_2071);
int l9_2073=int(l9_2072);
int l9_2074=l9_2073^(l9_2073*15299);
int l9_2075=l9_2074;
int l9_2076=l9_2075;
int l9_2077=((l9_2076*((l9_2076*1471343)+101146501))+1559861749)&2147483647;
int l9_2078=l9_2077;
int l9_2079=l9_2075*1399;
int l9_2080=((l9_2079*((l9_2079*1471343)+101146501))+1559861749)&2147483647;
int l9_2081=l9_2080;
int l9_2082=l9_2075*7177;
int l9_2083=((l9_2082*((l9_2082*1471343)+101146501))+1559861749)&2147483647;
int l9_2084=l9_2083;
int l9_2085=l9_2078;
float l9_2086=float(l9_2085)*4.6566129e-10;
int l9_2087=l9_2081;
float l9_2088=float(l9_2087)*4.6566129e-10;
int l9_2089=l9_2084;
float l9_2090=float(l9_2089)*4.6566129e-10;
float3 l9_2091=float3(l9_2086,l9_2088,l9_2090);
float3 l9_2092=l9_2091;
N181_particleSeed=l9_2092;
float l9_2093=fract((N181_particleSeed.y*12.12358)+N181_globalSeed);
float l9_2094=fract((N181_particleSeed.z*3.5358)+N181_globalSeed);
float2 l9_2095;
if (N181_ENABLE_LIFETIMEMINMAX)
{
l9_2095=N181_lifeTimeMinMax;
}
else
{
l9_2095=float2(N181_lifeTimeConstant);
}
float2 l9_2096=l9_2095;
float l9_2097=fast::max(l9_2096.x,0.0099999998);
float l9_2098=fast::max(l9_2096.y,0.0099999998);
float l9_2099=tempGlobals.gTimeElapsed;
float l9_2100=l9_2099;
if (N181_ENABLE_EXTERNALTIME)
{
l9_2100=N181_externalTime;
}
float l9_2101=l9_2100;
if (N181_ENABLE_INSTANTSPAWN)
{
l9_2101=N181_timeGlobal*l9_2100;
}
else
{
float l9_2102=0.0;
if (N181_ENABLE_TRAILS)
{
if (N181_ENABLE_INDEPENDENTTRAIL)
{
l9_2102=N181_trailLength;
}
}
float l9_2103=fract(((l9_2100*N181_timeGlobal)*(1.0/(l9_2096.y+l9_2102)))+l9_2093);
l9_2101=l9_2103*(l9_2096.y+l9_2102);
}
float l9_2104=mix(l9_2101/l9_2097,l9_2101/l9_2098,l9_2094);
float l9_2105=fast::clamp(l9_2104,0.0,1.0);
N181_isTrail=0.0;
N181_trailHeadTime=float2(l9_2101,l9_2105);
if (N181_ENABLE_TRAILS)
{
if (N181_isTrailCondition)
{
N181_isTrail=1.0;
float2 l9_2106=tempGlobals.Surface_UVCoord0;
l9_2101-=(l9_2106.y*N181_trailLength);
l9_2104=mix(l9_2101/l9_2097,l9_2101/l9_2098,l9_2094);
l9_2105=fast::clamp(l9_2104,0.0,1.0);
}
}
float l9_2107=0.0;
if (!N181_ENABLE_INSTANTSPAWN)
{
if (N181_spawnDuration>0.0)
{
if ((l9_2100-N181_spawnDuration)>=l9_2101)
{
l9_2107=1.0;
}
}
}
float l9_2108=l9_2104+l9_2107;
N181_particleAlive=1.0;
if ((l9_2108>0.99989998)||(l9_2101<=0.0))
{
N181_particleAlive=0.0;
}
N181_timeValues=float4(l9_2096,l9_2101,l9_2105);
l9_2061=N181_particleSeed;
l9_2062=N181_globalSeed;
l9_2063=N181_particleAlive;
l9_2064=N181_timeValues;
l9_2065=N181_isTrail;
l9_2066=N181_trailHeadTime;
l9_2046=l9_2061;
l9_2047=l9_2062;
l9_2048=l9_2063;
l9_2049=l9_2064;
l9_2050=l9_2065;
l9_2051=l9_2066;
float2 l9_2109=float2(0.0);
float2 l9_2110=(*sc_set0.UserUniforms).trailTaper;
l9_2109=l9_2110;
float l9_2111=0.0;
float l9_2112=(*sc_set0.UserUniforms).trailWidth;
l9_2111=l9_2112;
float3 l9_2113=float3(0.0);
l9_2113=param_269.SurfacePosition_ObjectSpace;
float3 l9_2114=float3(0.0);
l9_2114=param_269.VertexNormal_ObjectSpace;
float3 l9_2115=float3(0.0);
float3 l9_2116=(*sc_set0.UserUniforms).spawnLocation;
l9_2115=l9_2116;
float3 l9_2117=float3(0.0);
float3 l9_2118=(*sc_set0.UserUniforms).spawnBox;
l9_2117=l9_2118;
float3 l9_2119=float3(0.0);
float3 l9_2120=(*sc_set0.UserUniforms).spawnSphere;
l9_2119=l9_2120;
float3 l9_2121=float3(0.0);
float3 l9_2122=(*sc_set0.UserUniforms).noiseMult;
l9_2121=l9_2122;
float3 l9_2123=float3(0.0);
float3 l9_2124=(*sc_set0.UserUniforms).noiseFrequency;
l9_2123=l9_2124;
float3 l9_2125=float3(0.0);
float3 l9_2126=(*sc_set0.UserUniforms).sNoiseMult;
l9_2125=l9_2126;
float3 l9_2127=float3(0.0);
float3 l9_2128=(*sc_set0.UserUniforms).sNoiseFrequency;
l9_2127=l9_2128;
float3 l9_2129=float3(0.0);
float3 l9_2130=(*sc_set0.UserUniforms).velocityMin;
l9_2129=l9_2130;
float3 l9_2131=float3(0.0);
float3 l9_2132=(*sc_set0.UserUniforms).velocityMax;
l9_2131=l9_2132;
float3 l9_2133=float3(0.0);
float3 l9_2134=(*sc_set0.UserUniforms).velocityDrag;
l9_2133=l9_2134;
float3 l9_2135=float3(0.0);
float3 l9_2136=float3(0.0);
float3 l9_2137=float3(0.0);
float3 l9_2138;
if (MESHTYPE_tmp==0)
{
float2 l9_2139=float2(0.0);
float2 l9_2140=(*sc_set0.UserUniforms).sizeStart;
l9_2139=l9_2140;
l9_2136=float3(l9_2139,0.0);
l9_2138=l9_2136;
}
else
{
float3 l9_2141=float3(0.0);
float3 l9_2142=(*sc_set0.UserUniforms).sizeStart3D;
l9_2141=l9_2142;
l9_2137=l9_2141;
l9_2138=l9_2137;
}
l9_2135=l9_2138;
float3 l9_2143=float3(0.0);
float3 l9_2144=float3(0.0);
float3 l9_2145=float3(0.0);
float3 l9_2146;
if (MESHTYPE_tmp==0)
{
float2 l9_2147=float2(0.0);
float2 l9_2148=(*sc_set0.UserUniforms).sizeEnd;
l9_2147=l9_2148;
l9_2144=float3(l9_2147,0.0);
l9_2146=l9_2144;
}
else
{
float3 l9_2149=float3(0.0);
float3 l9_2150=(*sc_set0.UserUniforms).sizeEnd3D;
l9_2149=l9_2150;
l9_2145=l9_2149;
l9_2146=l9_2145;
}
l9_2143=l9_2146;
float3 l9_2151=float3(0.0);
float3 l9_2152=float3(0.0);
float3 l9_2153=float3(0.0);
float3 l9_2154;
if (MESHTYPE_tmp==0)
{
float2 l9_2155=float2(0.0);
float2 l9_2156=(*sc_set0.UserUniforms).sizeStartMin;
l9_2155=l9_2156;
l9_2152=float3(l9_2155,0.0);
l9_2154=l9_2152;
}
else
{
float3 l9_2157=float3(0.0);
float3 l9_2158=(*sc_set0.UserUniforms).sizeStartMin3D;
l9_2157=l9_2158;
l9_2153=l9_2157;
l9_2154=l9_2153;
}
l9_2151=l9_2154;
float3 l9_2159=float3(0.0);
float3 l9_2160=float3(0.0);
float3 l9_2161=float3(0.0);
float3 l9_2162;
if (MESHTYPE_tmp==0)
{
float2 l9_2163=float2(0.0);
float2 l9_2164=(*sc_set0.UserUniforms).sizeStartMax;
l9_2163=l9_2164;
l9_2160=float3(l9_2163,0.0);
l9_2162=l9_2160;
}
else
{
float3 l9_2165=float3(0.0);
float3 l9_2166=(*sc_set0.UserUniforms).sizeStartMax3D;
l9_2165=l9_2166;
l9_2161=l9_2165;
l9_2162=l9_2161;
}
l9_2159=l9_2162;
float3 l9_2167=float3(0.0);
float3 l9_2168=float3(0.0);
float3 l9_2169=float3(0.0);
float3 l9_2170;
if (MESHTYPE_tmp==0)
{
float2 l9_2171=float2(0.0);
float2 l9_2172=(*sc_set0.UserUniforms).sizeEndMin;
l9_2171=l9_2172;
l9_2168=float3(l9_2171,0.0);
l9_2170=l9_2168;
}
else
{
float3 l9_2173=float3(0.0);
float3 l9_2174=(*sc_set0.UserUniforms).sizeEndMin3D;
l9_2173=l9_2174;
l9_2169=l9_2173;
l9_2170=l9_2169;
}
l9_2167=l9_2170;
float3 l9_2175=float3(0.0);
float3 l9_2176=float3(0.0);
float3 l9_2177=float3(0.0);
float3 l9_2178;
if (MESHTYPE_tmp==0)
{
float2 l9_2179=float2(0.0);
float2 l9_2180=(*sc_set0.UserUniforms).sizeEndMax;
l9_2179=l9_2180;
l9_2176=float3(l9_2179,0.0);
l9_2178=l9_2176;
}
else
{
float3 l9_2181=float3(0.0);
float3 l9_2182=(*sc_set0.UserUniforms).sizeEndMax3D;
l9_2181=l9_2182;
l9_2177=l9_2181;
l9_2178=l9_2177;
}
l9_2175=l9_2178;
float l9_2183=0.0;
float l9_2184=(*sc_set0.UserUniforms).sizeSpeed;
l9_2183=l9_2184;
float l9_2185=0.0;
float l9_2186;
if ((int(ENABLE_SIZERAMPSTARTENDASBOUNDS_tmp)!=0))
{
l9_2186=1.001;
}
else
{
l9_2186=0.001;
}
l9_2186-=0.001;
l9_2185=l9_2186;
float l9_2187=0.0;
float l9_2188=(*sc_set0.UserUniforms).gravity;
l9_2187=l9_2188;
float3 l9_2189=float3(0.0);
float3 l9_2190=(*sc_set0.UserUniforms).localForce;
l9_2189=l9_2190;
float l9_2191=0.0;
float l9_2192=(*sc_set0.UserUniforms).sizeVelScale;
l9_2191=l9_2192;
float l9_2193=0.0;
float l9_2194=float((*sc_set0.UserUniforms).ALIGNTOX!=0);
l9_2193=l9_2194;
float l9_2195=0.0;
float l9_2196=float((*sc_set0.UserUniforms).ALIGNTOY!=0);
l9_2195=l9_2196;
float l9_2197=0.0;
float l9_2198=float((*sc_set0.UserUniforms).ALIGNTOZ!=0);
l9_2197=l9_2198;
float2 l9_2199=float2(0.0);
float2 l9_2200=(*sc_set0.UserUniforms).Port_Input1_N138;
float2 l9_2201=float2(0.0);
float2 l9_2202;
if (MESHTYPE_tmp==0)
{
l9_2202=l9_2200;
}
else
{
float2 l9_2203=float2(0.0);
float2 l9_2204=(*sc_set0.UserUniforms).rotationRandomX;
l9_2203=l9_2204;
l9_2201=l9_2203;
l9_2202=l9_2201;
}
l9_2199=l9_2202;
float2 l9_2205=float2(0.0);
float2 l9_2206=(*sc_set0.UserUniforms).Port_Input1_N139;
float2 l9_2207=float2(0.0);
float2 l9_2208;
if (MESHTYPE_tmp==0)
{
l9_2208=l9_2206;
}
else
{
float2 l9_2209=float2(0.0);
float2 l9_2210=(*sc_set0.UserUniforms).rotationRateX;
l9_2209=l9_2210;
l9_2207=l9_2209;
l9_2208=l9_2207;
}
l9_2205=l9_2208;
float2 l9_2211=float2(0.0);
float2 l9_2212=(*sc_set0.UserUniforms).Port_Input1_N140;
float2 l9_2213=float2(0.0);
float2 l9_2214;
if (MESHTYPE_tmp==0)
{
l9_2214=l9_2212;
}
else
{
float2 l9_2215=float2(0.0);
float2 l9_2216=(*sc_set0.UserUniforms).randomRotationY;
l9_2215=l9_2216;
l9_2213=l9_2215;
l9_2214=l9_2213;
}
l9_2211=l9_2214;
float2 l9_2217=float2(0.0);
float2 l9_2218=(*sc_set0.UserUniforms).Port_Input1_N144;
float2 l9_2219=float2(0.0);
float2 l9_2220;
if (MESHTYPE_tmp==0)
{
l9_2220=l9_2218;
}
else
{
float2 l9_2221=float2(0.0);
float2 l9_2222=(*sc_set0.UserUniforms).rotationRateY;
l9_2221=l9_2222;
l9_2219=l9_2221;
l9_2220=l9_2219;
}
l9_2217=l9_2220;
float2 l9_2223=float2(0.0);
float2 l9_2224=float2(1.0);
float2 l9_2225=float2(0.0);
float2 l9_2226;
if (MESHTYPE_tmp==0)
{
float2 l9_2227=float2(0.0);
float2 l9_2228=(*sc_set0.UserUniforms).rotationRandom;
l9_2227=l9_2228;
l9_2224=l9_2227;
l9_2226=l9_2224;
}
else
{
float2 l9_2229=float2(0.0);
float2 l9_2230=(*sc_set0.UserUniforms).randomRotationZ;
l9_2229=l9_2230;
l9_2225=l9_2229;
l9_2226=l9_2225;
}
l9_2223=l9_2226;
float2 l9_2231=float2(0.0);
float2 l9_2232=float2(1.0);
float2 l9_2233=float2(0.0);
float2 l9_2234;
if (MESHTYPE_tmp==0)
{
float2 l9_2235=float2(0.0);
float2 l9_2236=(*sc_set0.UserUniforms).rotationRate;
l9_2235=l9_2236;
l9_2232=l9_2235;
l9_2234=l9_2232;
}
else
{
float2 l9_2237=float2(0.0);
float2 l9_2238=(*sc_set0.UserUniforms).rotationRateZ;
l9_2237=l9_2238;
l9_2233=l9_2237;
l9_2234=l9_2233;
}
l9_2231=l9_2234;
float l9_2239=0.0;
float l9_2240=(*sc_set0.UserUniforms).rotationDrag;
l9_2239=l9_2240;
float l9_2241=0.0;
float l9_2242=(*sc_set0.UserUniforms).Port_Input1_N110;
float l9_2243=0.0;
float l9_2244;
if (MESHTYPE_tmp==0)
{
l9_2244=l9_2242;
}
else
{
float l9_2245=0.0;
float l9_2246=float((*sc_set0.UserUniforms).CENTER_BBOX!=0);
l9_2245=l9_2246;
l9_2243=l9_2245;
l9_2244=l9_2243;
}
l9_2241=l9_2244;
float l9_2247=0.0;
float l9_2248=(*sc_set0.UserUniforms).fadeDistanceVisible;
l9_2247=l9_2248;
float l9_2249=0.0;
float l9_2250=(*sc_set0.UserUniforms).fadeDistanceInvisible;
l9_2249=l9_2250;
float4 l9_2251=float4(0.0);
float3 l9_2252=l9_2046;
float l9_2253=l9_2047;
float l9_2254=l9_2048;
float4 l9_2255=l9_2049;
float l9_2256=l9_2050;
float2 l9_2257=l9_2051;
float2 l9_2258=l9_2109;
float l9_2259=l9_2111;
float3 l9_2260=l9_2113;
float3 l9_2261=l9_2114;
float3 l9_2262=l9_2115;
float3 l9_2263=l9_2117;
float3 l9_2264=l9_2119;
float3 l9_2265=l9_2121;
float3 l9_2266=l9_2123;
float3 l9_2267=l9_2125;
float3 l9_2268=l9_2127;
float3 l9_2269=l9_2129;
float3 l9_2270=l9_2131;
float3 l9_2271=l9_2133;
float3 l9_2272=l9_2135;
float3 l9_2273=l9_2143;
float3 l9_2274=l9_2151;
float3 l9_2275=l9_2159;
float3 l9_2276=l9_2167;
float3 l9_2277=l9_2175;
float l9_2278=l9_2183;
float l9_2279=l9_2185;
float l9_2280=l9_2187;
float3 l9_2281=l9_2189;
float l9_2282=l9_2191;
float l9_2283=l9_2193;
float l9_2284=l9_2195;
float l9_2285=l9_2197;
float2 l9_2286=l9_2199;
float2 l9_2287=l9_2205;
float2 l9_2288=l9_2211;
float2 l9_2289=l9_2217;
float2 l9_2290=l9_2223;
float2 l9_2291=l9_2231;
float l9_2292=l9_2239;
float l9_2293=l9_2241;
float l9_2294=l9_2247;
float l9_2295=l9_2249;
ssGlobals l9_2296=param_269;
tempGlobals=l9_2296;
float4 l9_2297=float4(0.0);
N111_MESHTYPE_QUAD=MESHTYPE_tmp==0;
N111_particleSeedIn=l9_2252;
N111_globalSeedIn=l9_2253;
N111_particleAlive=l9_2254;
N111_timeValuesIn=l9_2255;
N111_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N111_isTrail=l9_2256!=0.0;
N111_trailHeadTime=l9_2257;
N111_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N111_taper=l9_2258;
N111_ENABLE_TRAILSPIN=(int(TRAILTWIST_tmp)!=0);
N111_trailSizeMult=l9_2259;
N111_ENABLE_TRAILSIZERAMP=(int(TRAILSIZERAMP_tmp)!=0);
N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS=(int(TRAILSIZERAMPSTARTENDASBOUNDS_tmp)!=0);
N111_positionObjectSpace=l9_2260;
N111_normalObjectSpace=l9_2261;
N111_ENABLE_INILOCATION=(int(INILOCATION_tmp)!=0);
N111_spawnLocation=l9_2262;
N111_ENABLE_BOXSPAWN=(int(BOXSPAWN_tmp)!=0);
N111_spawnBox=l9_2263;
N111_ENABLE_SPHERESPAWN=(int(SPHERESPAWN_tmp)!=0);
N111_spawnSphere=l9_2264;
N111_ENABLE_NOISE=(int(NOISE_tmp)!=0);
N111_noiseMult=l9_2265;
N111_noiseFrequency=l9_2266;
N111_ENABLE_SNOISE=(int(SNOISE_tmp)!=0);
N111_sNoiseMult=l9_2267;
N111_sNoiseFrequency=l9_2268;
N111_ENABLE_VELRAMP=(int(VELRAMP_tmp)!=0);
N111_velocityMin=l9_2269;
N111_velocityMax=l9_2270;
N111_velocityDrag=l9_2271;
N111_sizeStart=l9_2272;
N111_sizeEnd=l9_2273;
N111_ENABLE_SIZEMINMAX=(int(SIZEMINMAX_tmp)!=0);
N111_sizeStartMin=l9_2274;
N111_sizeStartMax=l9_2275;
N111_sizeEndMin=l9_2276;
N111_sizeEndMax=l9_2277;
N111_sizeSpeed=l9_2278;
N111_ENABLE_SIZERAMP=(int(SIZERAMP_tmp)!=0);
N111_ENABLE_SIZERAMPSTARTENDASBOUNDS=l9_2279!=0.0;
N111_gravity=l9_2280;
N111_ENABLE_FORCE=(int(FORCE_tmp)!=0);
N111_localForce=l9_2281;
N111_ENABLE_ALIGNQUADTOCAMERAUP=(int(ALIGNTOCAMERAUP_tmp)!=0);
N111_ENABLE_ALIGNTOVEL=(int(VELOCITYDIR_tmp)!=0);
N111_sizeVelScale=l9_2282;
N111_ENABLE_IGNOREVEL=(int(IGNOREVEL_tmp)!=0);
N111_ENABLE_IGNORETRANSFORMSCALE=(int(IGNORETRANSFORMSCALE_tmp)!=0);
N111_ENABLE_ALIGNTOX=l9_2283!=0.0;
N111_ENABLE_ALIGNTOY=l9_2284!=0.0;
N111_ENABLE_ALIGNTOZ=l9_2285!=0.0;
N111_rotationRandomX=l9_2286;
N111_rotationRateX=l9_2287;
N111_rotationRandomY=l9_2288;
N111_rotationRateY=l9_2289;
N111_rotationRandomZ=l9_2290;
N111_rotationRateZ=l9_2291;
N111_rotationDrag=l9_2292;
N111_WORLDSPACE=rotationSpace_tmp==1;
N111_WORLDFORCE=rotationSpace_tmp==2;
N111_ENABLE_CENTER_IN_BBOX=l9_2293!=0.0;
N111_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N111_fadeDistanceVisible=l9_2294;
N111_fadeDistanceInvisible=l9_2295;
float3 l9_2298=float3(0.0);
N111_particleSeed=N111_particleSeedIn;
N111_globalSeed=N111_globalSeedIn;
float l9_2299=N111_particleSeed.x;
float l9_2300=N111_particleSeed.y;
float l9_2301=N111_particleSeed.z;
float3 l9_2302=fract((float3(l9_2299,l9_2300,l9_2301)*3048.28)+float3(N111_globalSeed))-float3(0.5);
float3 l9_2303=fract((N111_particleSeed*374.57129)+float3(N111_globalSeed))-float3(0.5);
float3 l9_2304=normalize(l9_2303+float3(N111_EPSILON));
float l9_2305=fract(N111_particleSeed.x+N111_globalSeed);
float l9_2306=l9_2305;
float l9_2307=0.33333334;
float l9_2308;
if (l9_2306<=0.0)
{
l9_2308=0.0;
}
else
{
l9_2308=pow(l9_2306,l9_2307);
}
float l9_2309=l9_2308;
float l9_2310=l9_2309;
l9_2304*=l9_2310;
l9_2304/=float3(2.0);
float l9_2311=fract((N111_particleSeed.x*334.59122)+N111_globalSeed)-0.5;
float l9_2312=fract((N111_particleSeed.y*41.231232)+N111_globalSeed)-0.5;
float l9_2313=fract((N111_particleSeed.z*18.984529)+N111_globalSeed);
float l9_2314=fract((N111_particleSeed.x*654.15588)+N111_globalSeed);
float l9_2315=fract((N111_particleSeed.y*45.722408)+N111_globalSeed);
float3 l9_2316=(float3(l9_2314,l9_2315,l9_2313)-float3(0.5))*2.0;
float3 l9_2317=float3(l9_2314,l9_2315,l9_2313);
float l9_2318=fract((N111_particleSeed.z*15.32451)+N111_globalSeed);
float2 l9_2319=N111_timeValuesIn.xy;
float l9_2320=N111_timeValuesIn.z;
float l9_2321=N111_timeValuesIn.w;
N111_cameraFade_trailHeadTime_taper=float4(0.0);
float3 l9_2322=l9_2298;
float3 l9_2323=l9_2298;
float3 l9_2324=l9_2298;
if (N111_ENABLE_INILOCATION)
{
l9_2324=N111_spawnLocation;
}
if (N111_ENABLE_BOXSPAWN)
{
l9_2322=N111_spawnBox*l9_2302;
}
if (N111_ENABLE_SPHERESPAWN)
{
l9_2323=N111_spawnSphere*l9_2304;
}
float3 l9_2325=(l9_2324+l9_2323)+l9_2322;
float3 l9_2326=l9_2298;
if (N111_ENABLE_NOISE)
{
float3 l9_2327=N111_noiseFrequency;
float3 l9_2328=N111_noiseMult;
float3 l9_2329=l9_2316;
float l9_2330=l9_2321;
float l9_2331=sin(l9_2330*l9_2327.x);
float l9_2332=sin(l9_2330*l9_2327.y);
float l9_2333=sin(l9_2330*l9_2327.z);
float3 l9_2334=(float3(l9_2331,l9_2332,l9_2333)*l9_2328)*l9_2329;
float3 l9_2335=l9_2334;
l9_2326+=l9_2335;
}
if (N111_ENABLE_SNOISE)
{
float l9_2336=l9_2313;
float l9_2337=l9_2314;
float l9_2338=l9_2315;
float3 l9_2339=N111_sNoiseFrequency;
float3 l9_2340=N111_sNoiseMult;
float3 l9_2341=l9_2316;
float l9_2342=l9_2320;
float2 l9_2343=float2(l9_2336*l9_2342,l9_2339.x);
float2 l9_2344=floor(l9_2343+float2(dot(l9_2343,float2(0.36602542))));
float2 l9_2345=(l9_2343-l9_2344)+float2(dot(l9_2344,float2(0.21132487)));
float2 l9_2346=float2(0.0);
bool2 l9_2347=bool2(l9_2345.x>l9_2345.y);
l9_2346=float2(l9_2347.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_2347.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_2348=l9_2345.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_2349=l9_2348.xy-l9_2346;
l9_2348=float4(l9_2349.x,l9_2349.y,l9_2348.z,l9_2348.w);
l9_2344=mod(l9_2344,float2(289.0));
float3 l9_2350=float3(l9_2344.y)+float3(0.0,l9_2346.y,1.0);
float3 l9_2351=mod(((l9_2350*34.0)+float3(1.0))*l9_2350,float3(289.0));
float3 l9_2352=(l9_2351+float3(l9_2344.x))+float3(0.0,l9_2346.x,1.0);
float3 l9_2353=mod(((l9_2352*34.0)+float3(1.0))*l9_2352,float3(289.0));
float3 l9_2354=l9_2353;
float3 l9_2355=fast::max(float3(0.5)-float3(dot(l9_2345,l9_2345),dot(l9_2348.xy,l9_2348.xy),dot(l9_2348.zw,l9_2348.zw)),float3(0.0));
l9_2355*=l9_2355;
l9_2355*=l9_2355;
float3 l9_2356=(fract(l9_2354*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_2357=abs(l9_2356)-float3(0.5);
float3 l9_2358=floor(l9_2356+float3(0.5));
float3 l9_2359=l9_2356-l9_2358;
l9_2355*=(float3(1.7928429)-(((l9_2359*l9_2359)+(l9_2357*l9_2357))*0.85373473));
float3 l9_2360=float3(0.0);
l9_2360.x=(l9_2359.x*l9_2345.x)+(l9_2357.x*l9_2345.y);
float2 l9_2361=(l9_2359.yz*l9_2348.xz)+(l9_2357.yz*l9_2348.yw);
l9_2360=float3(l9_2360.x,l9_2361.x,l9_2361.y);
float l9_2362=130.0*dot(l9_2355,l9_2360);
float l9_2363=l9_2362;
float2 l9_2364=float2(l9_2337*l9_2342,l9_2339.y);
float2 l9_2365=floor(l9_2364+float2(dot(l9_2364,float2(0.36602542))));
float2 l9_2366=(l9_2364-l9_2365)+float2(dot(l9_2365,float2(0.21132487)));
float2 l9_2367=float2(0.0);
bool2 l9_2368=bool2(l9_2366.x>l9_2366.y);
l9_2367=float2(l9_2368.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_2368.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_2369=l9_2366.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_2370=l9_2369.xy-l9_2367;
l9_2369=float4(l9_2370.x,l9_2370.y,l9_2369.z,l9_2369.w);
l9_2365=mod(l9_2365,float2(289.0));
float3 l9_2371=float3(l9_2365.y)+float3(0.0,l9_2367.y,1.0);
float3 l9_2372=mod(((l9_2371*34.0)+float3(1.0))*l9_2371,float3(289.0));
float3 l9_2373=(l9_2372+float3(l9_2365.x))+float3(0.0,l9_2367.x,1.0);
float3 l9_2374=mod(((l9_2373*34.0)+float3(1.0))*l9_2373,float3(289.0));
float3 l9_2375=l9_2374;
float3 l9_2376=fast::max(float3(0.5)-float3(dot(l9_2366,l9_2366),dot(l9_2369.xy,l9_2369.xy),dot(l9_2369.zw,l9_2369.zw)),float3(0.0));
l9_2376*=l9_2376;
l9_2376*=l9_2376;
float3 l9_2377=(fract(l9_2375*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_2378=abs(l9_2377)-float3(0.5);
float3 l9_2379=floor(l9_2377+float3(0.5));
float3 l9_2380=l9_2377-l9_2379;
l9_2376*=(float3(1.7928429)-(((l9_2380*l9_2380)+(l9_2378*l9_2378))*0.85373473));
float3 l9_2381=float3(0.0);
l9_2381.x=(l9_2380.x*l9_2366.x)+(l9_2378.x*l9_2366.y);
float2 l9_2382=(l9_2380.yz*l9_2369.xz)+(l9_2378.yz*l9_2369.yw);
l9_2381=float3(l9_2381.x,l9_2382.x,l9_2382.y);
float l9_2383=130.0*dot(l9_2376,l9_2381);
float l9_2384=l9_2383;
float2 l9_2385=float2(l9_2338*l9_2342,l9_2339.z);
float2 l9_2386=floor(l9_2385+float2(dot(l9_2385,float2(0.36602542))));
float2 l9_2387=(l9_2385-l9_2386)+float2(dot(l9_2386,float2(0.21132487)));
float2 l9_2388=float2(0.0);
bool2 l9_2389=bool2(l9_2387.x>l9_2387.y);
l9_2388=float2(l9_2389.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_2389.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float4 l9_2390=l9_2387.xyxy+float4(0.21132487,0.21132487,-0.57735026,-0.57735026);
float2 l9_2391=l9_2390.xy-l9_2388;
l9_2390=float4(l9_2391.x,l9_2391.y,l9_2390.z,l9_2390.w);
l9_2386=mod(l9_2386,float2(289.0));
float3 l9_2392=float3(l9_2386.y)+float3(0.0,l9_2388.y,1.0);
float3 l9_2393=mod(((l9_2392*34.0)+float3(1.0))*l9_2392,float3(289.0));
float3 l9_2394=(l9_2393+float3(l9_2386.x))+float3(0.0,l9_2388.x,1.0);
float3 l9_2395=mod(((l9_2394*34.0)+float3(1.0))*l9_2394,float3(289.0));
float3 l9_2396=l9_2395;
float3 l9_2397=fast::max(float3(0.5)-float3(dot(l9_2387,l9_2387),dot(l9_2390.xy,l9_2390.xy),dot(l9_2390.zw,l9_2390.zw)),float3(0.0));
l9_2397*=l9_2397;
l9_2397*=l9_2397;
float3 l9_2398=(fract(l9_2396*float3(0.024390243))*2.0)-float3(1.0);
float3 l9_2399=abs(l9_2398)-float3(0.5);
float3 l9_2400=floor(l9_2398+float3(0.5));
float3 l9_2401=l9_2398-l9_2400;
l9_2397*=(float3(1.7928429)-(((l9_2401*l9_2401)+(l9_2399*l9_2399))*0.85373473));
float3 l9_2402=float3(0.0);
l9_2402.x=(l9_2401.x*l9_2387.x)+(l9_2399.x*l9_2387.y);
float2 l9_2403=(l9_2401.yz*l9_2390.xz)+(l9_2399.yz*l9_2390.yw);
l9_2402=float3(l9_2402.x,l9_2403.x,l9_2403.y);
float l9_2404=130.0*dot(l9_2397,l9_2402);
float l9_2405=l9_2404;
float3 l9_2406=(float3(l9_2363,l9_2384,l9_2405)*l9_2340)*l9_2341;
l9_2326+=l9_2406;
}
float3 l9_2407=float3(0.0,((N111_gravity/2.0)*l9_2320)*l9_2320,0.0);
float3 l9_2408=l9_2298;
if (N111_ENABLE_FORCE)
{
l9_2408=((N111_localForce/float3(2.0))*l9_2320)*l9_2320;
}
float3 l9_2409=l9_2298;
float3 l9_2410=N111_velocityMin+(((l9_2316+float3(1.0))/float3(2.0))*(N111_velocityMax-N111_velocityMin));
if (N111_ENABLE_VELRAMP)
{
l9_2410=mix(N111_velocityMin,N111_velocityMax,l9_2317);
}
float3 l9_2411=l9_2410;
float l9_2412=l9_2320;
float3 l9_2413=N111_velocityDrag;
float3 l9_2414=l9_2326;
float l9_2415=l9_2321;
float3 l9_2416=float3(l9_2412,l9_2412,l9_2412);
float3 l9_2417=l9_2413;
float l9_2418;
if (l9_2416.x<=0.0)
{
l9_2418=0.0;
}
else
{
l9_2418=pow(l9_2416.x,l9_2417.x);
}
float l9_2419=l9_2418;
float l9_2420;
if (l9_2416.y<=0.0)
{
l9_2420=0.0;
}
else
{
l9_2420=pow(l9_2416.y,l9_2417.y);
}
float l9_2421=l9_2420;
float l9_2422;
if (l9_2416.z<=0.0)
{
l9_2422=0.0;
}
else
{
l9_2422=pow(l9_2416.z,l9_2417.z);
}
float3 l9_2423=float3(l9_2419,l9_2421,l9_2422);
float3 l9_2424=l9_2423;
float3 l9_2425=(l9_2411+l9_2414)*l9_2424;
if (N111_ENABLE_VELRAMP)
{
float l9_2426=floor(l9_2415*10000.0)/10000.0;
float2 l9_2427=tempGlobals.Surface_UVCoord0;
float2 l9_2428=(l9_2427/float2(10000.0,1.0))+float2(l9_2426,0.0);
float2 l9_2429=l9_2428;
float4 l9_2430=float4(0.0);
int l9_2431=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_2432=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2432=0;
}
else
{
l9_2432=gl_InstanceIndex%2;
}
int l9_2433=l9_2432;
l9_2431=1-l9_2433;
}
else
{
int l9_2434=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2434=0;
}
else
{
l9_2434=gl_InstanceIndex%2;
}
int l9_2435=l9_2434;
l9_2431=l9_2435;
}
int l9_2436=l9_2431;
int l9_2437=velRampTextureLayout_tmp;
int l9_2438=l9_2436;
float2 l9_2439=l9_2429;
bool l9_2440=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_2441=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_2442=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_2443=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_2444=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_2445=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_2446=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_2447=0.0;
bool l9_2448=l9_2445&&(!l9_2443);
float l9_2449=1.0;
float l9_2450=l9_2439.x;
int l9_2451=l9_2442.x;
if (l9_2451==1)
{
l9_2450=fract(l9_2450);
}
else
{
if (l9_2451==2)
{
float l9_2452=fract(l9_2450);
float l9_2453=l9_2450-l9_2452;
float l9_2454=step(0.25,fract(l9_2453*0.5));
l9_2450=mix(l9_2452,1.0-l9_2452,fast::clamp(l9_2454,0.0,1.0));
}
}
l9_2439.x=l9_2450;
float l9_2455=l9_2439.y;
int l9_2456=l9_2442.y;
if (l9_2456==1)
{
l9_2455=fract(l9_2455);
}
else
{
if (l9_2456==2)
{
float l9_2457=fract(l9_2455);
float l9_2458=l9_2455-l9_2457;
float l9_2459=step(0.25,fract(l9_2458*0.5));
l9_2455=mix(l9_2457,1.0-l9_2457,fast::clamp(l9_2459,0.0,1.0));
}
}
l9_2439.y=l9_2455;
if (l9_2443)
{
bool l9_2460=l9_2445;
bool l9_2461;
if (l9_2460)
{
l9_2461=l9_2442.x==3;
}
else
{
l9_2461=l9_2460;
}
float l9_2462=l9_2439.x;
float l9_2463=l9_2444.x;
float l9_2464=l9_2444.z;
bool l9_2465=l9_2461;
float l9_2466=l9_2449;
float l9_2467=fast::clamp(l9_2462,l9_2463,l9_2464);
float l9_2468=step(abs(l9_2462-l9_2467),9.9999997e-06);
l9_2466*=(l9_2468+((1.0-float(l9_2465))*(1.0-l9_2468)));
l9_2462=l9_2467;
l9_2439.x=l9_2462;
l9_2449=l9_2466;
bool l9_2469=l9_2445;
bool l9_2470;
if (l9_2469)
{
l9_2470=l9_2442.y==3;
}
else
{
l9_2470=l9_2469;
}
float l9_2471=l9_2439.y;
float l9_2472=l9_2444.y;
float l9_2473=l9_2444.w;
bool l9_2474=l9_2470;
float l9_2475=l9_2449;
float l9_2476=fast::clamp(l9_2471,l9_2472,l9_2473);
float l9_2477=step(abs(l9_2471-l9_2476),9.9999997e-06);
l9_2475*=(l9_2477+((1.0-float(l9_2474))*(1.0-l9_2477)));
l9_2471=l9_2476;
l9_2439.y=l9_2471;
l9_2449=l9_2475;
}
float2 l9_2478=l9_2439;
bool l9_2479=l9_2440;
float3x3 l9_2480=l9_2441;
if (l9_2479)
{
l9_2478=float2((l9_2480*float3(l9_2478,1.0)).xy);
}
float2 l9_2481=l9_2478;
float2 l9_2482=l9_2481;
float2 l9_2483=l9_2482;
l9_2439=l9_2483;
float l9_2484=l9_2439.x;
int l9_2485=l9_2442.x;
bool l9_2486=l9_2448;
float l9_2487=l9_2449;
if ((l9_2485==0)||(l9_2485==3))
{
float l9_2488=l9_2484;
float l9_2489=0.0;
float l9_2490=1.0;
bool l9_2491=l9_2486;
float l9_2492=l9_2487;
float l9_2493=fast::clamp(l9_2488,l9_2489,l9_2490);
float l9_2494=step(abs(l9_2488-l9_2493),9.9999997e-06);
l9_2492*=(l9_2494+((1.0-float(l9_2491))*(1.0-l9_2494)));
l9_2488=l9_2493;
l9_2484=l9_2488;
l9_2487=l9_2492;
}
l9_2439.x=l9_2484;
l9_2449=l9_2487;
float l9_2495=l9_2439.y;
int l9_2496=l9_2442.y;
bool l9_2497=l9_2448;
float l9_2498=l9_2449;
if ((l9_2496==0)||(l9_2496==3))
{
float l9_2499=l9_2495;
float l9_2500=0.0;
float l9_2501=1.0;
bool l9_2502=l9_2497;
float l9_2503=l9_2498;
float l9_2504=fast::clamp(l9_2499,l9_2500,l9_2501);
float l9_2505=step(abs(l9_2499-l9_2504),9.9999997e-06);
l9_2503*=(l9_2505+((1.0-float(l9_2502))*(1.0-l9_2505)));
l9_2499=l9_2504;
l9_2495=l9_2499;
l9_2498=l9_2503;
}
l9_2439.y=l9_2495;
l9_2449=l9_2498;
float2 l9_2506=l9_2439;
int l9_2507=l9_2437;
int l9_2508=l9_2438;
float l9_2509=l9_2447;
float2 l9_2510=l9_2506;
int l9_2511=l9_2507;
int l9_2512=l9_2508;
float3 l9_2513=float3(0.0);
if (l9_2511==0)
{
l9_2513=float3(l9_2510,0.0);
}
else
{
if (l9_2511==1)
{
l9_2513=float3(l9_2510.x,(l9_2510.y*0.5)+(0.5-(float(l9_2512)*0.5)),0.0);
}
else
{
l9_2513=float3(l9_2510,float(l9_2512));
}
}
float3 l9_2514=l9_2513;
float3 l9_2515=l9_2514;
float2 l9_2516=l9_2515.xy;
float l9_2517=l9_2509;
float4 l9_2518=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_2516,level(l9_2517));
float4 l9_2519=l9_2518;
float4 l9_2520=l9_2519;
if (l9_2445)
{
l9_2520=mix(l9_2446,l9_2520,float4(l9_2449));
}
float4 l9_2521=l9_2520;
l9_2430=l9_2521;
float4 l9_2522=l9_2430;
float3 l9_2523=l9_2522.xyz;
l9_2425=(l9_2411+l9_2414)*l9_2523;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_2425=l9_2411*l9_2424;
}
}
float3 l9_2524=l9_2425;
l9_2409=l9_2524;
if (N111_ENABLE_TRAILS)
{
if (N111_isTrail)
{
float2 l9_2525=tempGlobals.Surface_UVCoord0;
float2 l9_2526=l9_2525;
float l9_2527=mix(1.0,l9_2526.y,1.0-N111_taper.x);
l9_2527*=mix(1.0,1.0-l9_2526.y,1.0-N111_taper.y);
N111_cameraFade_trailHeadTime_taper=float4(N111_cameraFade_trailHeadTime_taper.x,N111_trailHeadTime.x,N111_trailHeadTime.y,N111_cameraFade_trailHeadTime_taper.w);
N111_cameraFade_trailHeadTime_taper.w=l9_2527;
}
}
float4x4 l9_2528=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_2529=length(l9_2528[0].xyz);
float4x4 l9_2530=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_2531=length(l9_2530[1].xyz);
float4x4 l9_2532=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_2533=length(l9_2532[2].xyz);
float3 l9_2534=float3(l9_2529,l9_2531,l9_2533);
float4x4 l9_2535=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2536=l9_2535;
float4 l9_2537=l9_2536[0];
float4 l9_2538=l9_2536[1];
float4 l9_2539=l9_2536[2];
float3x3 l9_2540=float3x3(float3(float3(l9_2537.x,l9_2538.x,l9_2539.x)),float3(float3(l9_2537.y,l9_2538.y,l9_2539.y)),float3(float3(l9_2537.z,l9_2538.z,l9_2539.z)));
float3x3 l9_2541=l9_2540;
float3 l9_2542=((l9_2409+l9_2407)+l9_2408)*l9_2541;
if (N111_WORLDFORCE)
{
float4x4 l9_2543=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2544=l9_2543;
float4 l9_2545=l9_2544[0];
float4 l9_2546=l9_2544[1];
float4 l9_2547=l9_2544[2];
float3x3 l9_2548=float3x3(float3(float3(l9_2545.x,l9_2546.x,l9_2547.x)),float3(float3(l9_2545.y,l9_2546.y,l9_2547.y)),float3(float3(l9_2545.z,l9_2546.z,l9_2547.z)));
float3x3 l9_2549=l9_2548;
l9_2542=((l9_2409*l9_2549)+l9_2407)+l9_2408;
}
if (N111_WORLDSPACE)
{
l9_2542=((l9_2409*l9_2534)+l9_2407)+l9_2408;
}
float4x4 l9_2550=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3 l9_2551=(l9_2550*float4(l9_2325,1.0)).xyz+l9_2542;
float l9_2552=mix(N111_rotationRandomZ.x,N111_rotationRandomZ.y,l9_2318);
float l9_2553=1.0-l9_2321;
float l9_2554=N111_rotationDrag;
float l9_2555;
if (l9_2553<=0.0)
{
l9_2555=0.0;
}
else
{
l9_2555=pow(l9_2553,l9_2554);
}
float l9_2556=l9_2555;
float l9_2557=l9_2556;
float l9_2558=mix(N111_rotationRateZ.x,N111_rotationRateZ.y,l9_2318);
float l9_2559=((l9_2558*l9_2557)*l9_2321)*2.0;
float l9_2560=N111_PI*((l9_2559+l9_2552)-0.5);
float l9_2561=1.0;
if (N111_ENABLE_SCREENFADE)
{
float3 l9_2562=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_2563=l9_2562-l9_2551;
float l9_2564=dot(l9_2563,l9_2563);
float l9_2565=(N111_fadeDistanceInvisible+N111_EPSILON)*(N111_fadeDistanceInvisible+N111_EPSILON);
float l9_2566=N111_fadeDistanceVisible*N111_fadeDistanceVisible;
float l9_2567=fast::min(l9_2565,l9_2566);
float l9_2568=fast::max(l9_2565,l9_2566);
float l9_2569=smoothstep(l9_2567,l9_2568,l9_2564);
float l9_2570;
if (l9_2565>l9_2566)
{
l9_2570=1.0-l9_2569;
}
else
{
l9_2570=l9_2569;
}
l9_2569=l9_2570;
if (l9_2569<=N111_EPSILON)
{
l9_2561=0.0;
}
N111_cameraFade_trailHeadTime_taper.x=l9_2569;
}
if (N111_MESHTYPE_QUAD||N111_ENABLE_TRAILS)
{
if (N111_MESHTYPE_QUAD||N111_isTrail)
{
int l9_2571=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2571=0;
}
else
{
l9_2571=gl_InstanceIndex%2;
}
int l9_2572=l9_2571;
float4x4 l9_2573=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_2572];
float3 l9_2574=normalize(l9_2573[2].xyz);
if (N111_isTrail)
{
l9_2574*=float3(-1.0);
}
float3 l9_2575=float3(0.0,1.0,0.0);
if (N111_ENABLE_ALIGNQUADTOCAMERAUP)
{
int l9_2576=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2576=0;
}
else
{
l9_2576=gl_InstanceIndex%2;
}
int l9_2577=l9_2576;
float3 l9_2578=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_2577][1].xyz;
l9_2575=l9_2578;
}
float3 l9_2579=-normalize(cross(l9_2574,l9_2575));
float3 l9_2580=normalize(cross(l9_2579,l9_2574));
float l9_2581=1.0;
if (N111_ENABLE_ALIGNTOX)
{
l9_2579=float3(0.0,0.0,1.0);
l9_2580=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_2579=float3(1.0,0.0,0.0);
l9_2580=float3(0.0,0.0,1.0);
}
if (N111_ENABLE_ALIGNTOZ)
{
l9_2579=float3(1.0,0.0,0.0);
l9_2580=float3(0.0,1.0,0.0);
}
float2 l9_2582=float2(cos(l9_2560),sin(l9_2560));
float2 l9_2583=float2(-sin(l9_2560),cos(l9_2560));
float3 l9_2584=float3((l9_2579*l9_2582.x)+(l9_2580*l9_2582.y));
float3 l9_2585=float3((l9_2579*l9_2583.x)+(l9_2580*l9_2583.y));
if (N111_ENABLE_ALIGNTOVEL||N111_ENABLE_TRAILS)
{
if (N111_ENABLE_ALIGNTOVEL||N111_isTrail)
{
float3 l9_2586=normalize(((l9_2542+l9_2407)+l9_2408)+float3(N111_EPSILON));
float3 l9_2587=l9_2542*(l9_2320-0.0099999998);
float3 l9_2588=l9_2542*(l9_2320+0.0099999998);
l9_2584=l9_2586;
l9_2585=normalize(cross(l9_2584,l9_2574));
if (N111_ENABLE_TRAILSPIN)
{
if (N111_isTrail)
{
l9_2585=float3((l9_2584*l9_2582.x)+(l9_2585*l9_2582.y));
}
}
if (!N111_isTrail)
{
if (N111_ENABLE_IGNOREVEL)
{
l9_2581=fast::max(N111_sizeVelScale,N111_EPSILON);
}
else
{
l9_2581=length(l9_2588-l9_2587)*N111_sizeVelScale;
if (N111_ENABLE_IGNORETRANSFORMSCALE)
{
float4x4 l9_2589=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_2581=(length(l9_2588-l9_2587)/length(l9_2589[0].xyz))*N111_sizeVelScale;
}
}
}
}
}
float4x4 l9_2590=(*sc_set0.UserUniforms).sc_ModelMatrix;
float l9_2591=length(l9_2590[0].xyz);
float2 l9_2592=tempGlobals.Surface_UVCoord0;
float l9_2593=l9_2311;
float l9_2594=l9_2312;
float l9_2595=l9_2321;
float l9_2596=N111_sizeSpeed;
float2 l9_2597=(((l9_2592-float2(0.5))*l9_2561)*N111_pSize(l9_2593,l9_2594,l9_2595,l9_2596,N111_isTrail,N111_ENABLE_TRAILS,N111_trailHeadTime,N111_ENABLE_INDEPENDENTTRAIL,N111_trailSizeMult,N111_ENABLE_TRAILSIZERAMP,N111_ENABLE_TRAILSIZERAMPSTARTENDASBOUNDS,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.trailSizeRampTex,sc_set0.trailSizeRampTexSmpSC,sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals))*l9_2591;
float3 l9_2598=(l9_2551+(l9_2585*l9_2597.x))+(l9_2584*(l9_2597.y*l9_2581));
N111_position=l9_2598;
if ((N111_particleAlive<0.5)||(l9_2561<0.5))
{
N111_position/=float3(0.0);
}
N111_normal=l9_2574;
}
}
if (!N111_MESHTYPE_QUAD)
{
if (!N111_isTrail)
{
N111_position=N111_positionObjectSpace;
if (N111_ENABLE_CENTER_IN_BBOX)
{
float3 l9_2599=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_2600=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_2601=(l9_2599+l9_2600)/float3(2.0);
N111_position-=l9_2601;
}
float l9_2602=l9_2311;
float l9_2603=l9_2312;
float l9_2604=l9_2321;
float l9_2605=N111_sizeSpeed;
N111_position=(N111_position*l9_2534)*N111_pSize3D(l9_2602,l9_2603,l9_2604,l9_2605,N111_sizeStart,N111_sizeEnd,N111_ENABLE_SIZEMINMAX,N111_sizeStartMin,N111_sizeStartMax,N111_sizeEndMin,N111_sizeEndMax,N111_ENABLE_SIZERAMP,N111_ENABLE_SIZERAMPSTARTENDASBOUNDS,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.sizeRampTexture,sc_set0.sizeRampTextureSmpSC,tempGlobals);
if ((N111_particleAlive<0.5)||(l9_2561<0.5))
{
N111_position.x=2.1474836e+09;
}
float3x3 l9_2606;
if (((N111_ENABLE_ALIGNTOVEL||N111_ENABLE_ALIGNTOX)||N111_ENABLE_ALIGNTOY)||N111_ENABLE_ALIGNTOZ)
{
if (N111_ENABLE_ALIGNTOZ)
{
l9_2606=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
}
else
{
float3 l9_2607=float3(0.0);
if (N111_ENABLE_ALIGNTOX)
{
l9_2607=float3(1.0,0.0,0.0);
}
if (N111_ENABLE_ALIGNTOY)
{
l9_2607=float3(0.0,1.0,0.0);
}
if (N111_ENABLE_ALIGNTOVEL)
{
float l9_2608=0.001;
float3 l9_2609=l9_2410;
float l9_2610=l9_2320-l9_2608;
float3 l9_2611=N111_velocityDrag;
float3 l9_2612=l9_2326;
float l9_2613=l9_2321-l9_2608;
float3 l9_2614=float3(l9_2610,l9_2610,l9_2610);
float3 l9_2615=l9_2611;
float l9_2616;
if (l9_2614.x<=0.0)
{
l9_2616=0.0;
}
else
{
l9_2616=pow(l9_2614.x,l9_2615.x);
}
float l9_2617=l9_2616;
float l9_2618;
if (l9_2614.y<=0.0)
{
l9_2618=0.0;
}
else
{
l9_2618=pow(l9_2614.y,l9_2615.y);
}
float l9_2619=l9_2618;
float l9_2620;
if (l9_2614.z<=0.0)
{
l9_2620=0.0;
}
else
{
l9_2620=pow(l9_2614.z,l9_2615.z);
}
float3 l9_2621=float3(l9_2617,l9_2619,l9_2620);
float3 l9_2622=l9_2621;
float3 l9_2623=(l9_2609+l9_2612)*l9_2622;
if (N111_ENABLE_VELRAMP)
{
float l9_2624=floor(l9_2613*10000.0)/10000.0;
float2 l9_2625=tempGlobals.Surface_UVCoord0;
float2 l9_2626=(l9_2625/float2(10000.0,1.0))+float2(l9_2624,0.0);
float2 l9_2627=l9_2626;
float4 l9_2628=float4(0.0);
int l9_2629=0;
if ((int(velRampTextureHasSwappedViews_tmp)!=0))
{
int l9_2630=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2630=0;
}
else
{
l9_2630=gl_InstanceIndex%2;
}
int l9_2631=l9_2630;
l9_2629=1-l9_2631;
}
else
{
int l9_2632=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2632=0;
}
else
{
l9_2632=gl_InstanceIndex%2;
}
int l9_2633=l9_2632;
l9_2629=l9_2633;
}
int l9_2634=l9_2629;
int l9_2635=velRampTextureLayout_tmp;
int l9_2636=l9_2634;
float2 l9_2637=l9_2627;
bool l9_2638=(int(SC_USE_UV_TRANSFORM_velRampTexture_tmp)!=0);
float3x3 l9_2639=(*sc_set0.UserUniforms).velRampTextureTransform;
int2 l9_2640=int2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_velRampTexture_tmp);
bool l9_2641=(int(SC_USE_UV_MIN_MAX_velRampTexture_tmp)!=0);
float4 l9_2642=(*sc_set0.UserUniforms).velRampTextureUvMinMax;
bool l9_2643=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture_tmp)!=0);
float4 l9_2644=(*sc_set0.UserUniforms).velRampTextureBorderColor;
float l9_2645=0.0;
bool l9_2646=l9_2643&&(!l9_2641);
float l9_2647=1.0;
float l9_2648=l9_2637.x;
int l9_2649=l9_2640.x;
if (l9_2649==1)
{
l9_2648=fract(l9_2648);
}
else
{
if (l9_2649==2)
{
float l9_2650=fract(l9_2648);
float l9_2651=l9_2648-l9_2650;
float l9_2652=step(0.25,fract(l9_2651*0.5));
l9_2648=mix(l9_2650,1.0-l9_2650,fast::clamp(l9_2652,0.0,1.0));
}
}
l9_2637.x=l9_2648;
float l9_2653=l9_2637.y;
int l9_2654=l9_2640.y;
if (l9_2654==1)
{
l9_2653=fract(l9_2653);
}
else
{
if (l9_2654==2)
{
float l9_2655=fract(l9_2653);
float l9_2656=l9_2653-l9_2655;
float l9_2657=step(0.25,fract(l9_2656*0.5));
l9_2653=mix(l9_2655,1.0-l9_2655,fast::clamp(l9_2657,0.0,1.0));
}
}
l9_2637.y=l9_2653;
if (l9_2641)
{
bool l9_2658=l9_2643;
bool l9_2659;
if (l9_2658)
{
l9_2659=l9_2640.x==3;
}
else
{
l9_2659=l9_2658;
}
float l9_2660=l9_2637.x;
float l9_2661=l9_2642.x;
float l9_2662=l9_2642.z;
bool l9_2663=l9_2659;
float l9_2664=l9_2647;
float l9_2665=fast::clamp(l9_2660,l9_2661,l9_2662);
float l9_2666=step(abs(l9_2660-l9_2665),9.9999997e-06);
l9_2664*=(l9_2666+((1.0-float(l9_2663))*(1.0-l9_2666)));
l9_2660=l9_2665;
l9_2637.x=l9_2660;
l9_2647=l9_2664;
bool l9_2667=l9_2643;
bool l9_2668;
if (l9_2667)
{
l9_2668=l9_2640.y==3;
}
else
{
l9_2668=l9_2667;
}
float l9_2669=l9_2637.y;
float l9_2670=l9_2642.y;
float l9_2671=l9_2642.w;
bool l9_2672=l9_2668;
float l9_2673=l9_2647;
float l9_2674=fast::clamp(l9_2669,l9_2670,l9_2671);
float l9_2675=step(abs(l9_2669-l9_2674),9.9999997e-06);
l9_2673*=(l9_2675+((1.0-float(l9_2672))*(1.0-l9_2675)));
l9_2669=l9_2674;
l9_2637.y=l9_2669;
l9_2647=l9_2673;
}
float2 l9_2676=l9_2637;
bool l9_2677=l9_2638;
float3x3 l9_2678=l9_2639;
if (l9_2677)
{
l9_2676=float2((l9_2678*float3(l9_2676,1.0)).xy);
}
float2 l9_2679=l9_2676;
float2 l9_2680=l9_2679;
float2 l9_2681=l9_2680;
l9_2637=l9_2681;
float l9_2682=l9_2637.x;
int l9_2683=l9_2640.x;
bool l9_2684=l9_2646;
float l9_2685=l9_2647;
if ((l9_2683==0)||(l9_2683==3))
{
float l9_2686=l9_2682;
float l9_2687=0.0;
float l9_2688=1.0;
bool l9_2689=l9_2684;
float l9_2690=l9_2685;
float l9_2691=fast::clamp(l9_2686,l9_2687,l9_2688);
float l9_2692=step(abs(l9_2686-l9_2691),9.9999997e-06);
l9_2690*=(l9_2692+((1.0-float(l9_2689))*(1.0-l9_2692)));
l9_2686=l9_2691;
l9_2682=l9_2686;
l9_2685=l9_2690;
}
l9_2637.x=l9_2682;
l9_2647=l9_2685;
float l9_2693=l9_2637.y;
int l9_2694=l9_2640.y;
bool l9_2695=l9_2646;
float l9_2696=l9_2647;
if ((l9_2694==0)||(l9_2694==3))
{
float l9_2697=l9_2693;
float l9_2698=0.0;
float l9_2699=1.0;
bool l9_2700=l9_2695;
float l9_2701=l9_2696;
float l9_2702=fast::clamp(l9_2697,l9_2698,l9_2699);
float l9_2703=step(abs(l9_2697-l9_2702),9.9999997e-06);
l9_2701*=(l9_2703+((1.0-float(l9_2700))*(1.0-l9_2703)));
l9_2697=l9_2702;
l9_2693=l9_2697;
l9_2696=l9_2701;
}
l9_2637.y=l9_2693;
l9_2647=l9_2696;
float2 l9_2704=l9_2637;
int l9_2705=l9_2635;
int l9_2706=l9_2636;
float l9_2707=l9_2645;
float2 l9_2708=l9_2704;
int l9_2709=l9_2705;
int l9_2710=l9_2706;
float3 l9_2711=float3(0.0);
if (l9_2709==0)
{
l9_2711=float3(l9_2708,0.0);
}
else
{
if (l9_2709==1)
{
l9_2711=float3(l9_2708.x,(l9_2708.y*0.5)+(0.5-(float(l9_2710)*0.5)),0.0);
}
else
{
l9_2711=float3(l9_2708,float(l9_2710));
}
}
float3 l9_2712=l9_2711;
float3 l9_2713=l9_2712;
float2 l9_2714=l9_2713.xy;
float l9_2715=l9_2707;
float4 l9_2716=sc_set0.velRampTexture.sample(sc_set0.velRampTextureSmpSC,l9_2714,level(l9_2715));
float4 l9_2717=l9_2716;
float4 l9_2718=l9_2717;
if (l9_2643)
{
l9_2718=mix(l9_2644,l9_2718,float4(l9_2647));
}
float4 l9_2719=l9_2718;
l9_2628=l9_2719;
float4 l9_2720=l9_2628;
float3 l9_2721=l9_2720.xyz;
l9_2623=(l9_2609+l9_2612)*l9_2721;
if (!(SC_DEVICE_CLASS_tmp>=2))
{
l9_2623=l9_2609*l9_2622;
}
}
float3 l9_2722=l9_2623;
float3 l9_2723=l9_2722;
float l9_2724=((N111_gravity/2.0)*(l9_2320-l9_2608))*(l9_2320-l9_2608);
l9_2407.y-=l9_2724;
if (N111_ENABLE_FORCE)
{
float3 l9_2725=float3(((N111_localForce/float3(2.0))*(l9_2320-l9_2608))*(l9_2320-l9_2608));
l9_2408-=l9_2725;
}
if (N111_WORLDFORCE)
{
float4x4 l9_2726=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2727=l9_2726;
float4 l9_2728=l9_2727[0];
float4 l9_2729=l9_2727[1];
float4 l9_2730=l9_2727[2];
float3x3 l9_2731=float3x3(float3(float3(l9_2728.x,l9_2729.x,l9_2730.x)),float3(float3(l9_2728.y,l9_2729.y,l9_2730.y)),float3(float3(l9_2728.z,l9_2729.z,l9_2730.z)));
float3x3 l9_2732=l9_2731;
l9_2607=(((l9_2409-l9_2723)*l9_2732)+l9_2407)+l9_2408;
}
else
{
if (N111_WORLDSPACE)
{
l9_2607=((l9_2409-l9_2723)+l9_2407)+l9_2408;
}
else
{
float4x4 l9_2733=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2734=l9_2733;
float4 l9_2735=l9_2734[0];
float4 l9_2736=l9_2734[1];
float4 l9_2737=l9_2734[2];
float3x3 l9_2738=float3x3(float3(float3(l9_2735.x,l9_2736.x,l9_2737.x)),float3(float3(l9_2735.y,l9_2736.y,l9_2737.y)),float3(float3(l9_2735.z,l9_2736.z,l9_2737.z)));
float3x3 l9_2739=l9_2738;
l9_2607=(((l9_2409-l9_2723)+l9_2408)+l9_2407)*l9_2739;
}
}
l9_2607=normalize(l9_2607+float3(N111_EPSILON));
}
float3 l9_2740=float3(0.0,0.0,1.0);
float3 l9_2741=cross(l9_2607,l9_2740);
float3 l9_2742=normalize(l9_2741);
float l9_2743=length(l9_2741);
float l9_2744=dot(l9_2740,l9_2607);
float l9_2745=1.0-l9_2744;
l9_2606=float3x3(float3(((l9_2745*l9_2742.x)*l9_2742.x)+l9_2744,((l9_2745*l9_2742.x)*l9_2742.y)-(l9_2742.z*l9_2743),((l9_2745*l9_2742.z)*l9_2742.x)+(l9_2742.y*l9_2743)),float3(((l9_2745*l9_2742.x)*l9_2742.y)+(l9_2742.z*l9_2743),((l9_2745*l9_2742.y)*l9_2742.y)+l9_2744,((l9_2745*l9_2742.y)*l9_2742.z)-(l9_2742.x*l9_2743)),float3(((l9_2745*l9_2742.z)*l9_2742.x)-(l9_2742.y*l9_2743),((l9_2745*l9_2742.y)*l9_2742.z)+(l9_2742.x*l9_2743),((l9_2745*l9_2742.z)*l9_2742.z)+l9_2744));
}
float3x3 l9_2746=float3x3(float3(cos(l9_2560),-sin(l9_2560),0.0),float3(sin(l9_2560),cos(l9_2560),0.0),float3(0.0,0.0,1.0));
l9_2606=l9_2606*l9_2746;
if (N111_ENABLE_ALIGNTOVEL&&(!N111_ENABLE_IGNOREVEL))
{
float3 l9_2747=l9_2542*(l9_2320-0.0099999998);
float3 l9_2748=l9_2542*(l9_2320+0.0099999998);
N111_position.z*=(length(l9_2748-l9_2747)*fast::max(N111_sizeVelScale,0.1));
}
}
else
{
float l9_2749=fract((N111_particleSeed.x*92.653008)+N111_globalSeed);
float l9_2750=mix(N111_rotationRandomX.x,N111_rotationRandomX.y,l9_2749);
float l9_2751=mix(N111_rotationRateX.x,N111_rotationRateX.y,l9_2749);
float l9_2752=((l9_2751*l9_2557)*l9_2321)*2.0;
float l9_2753=fract((N111_particleSeed.y*6.7557559)+N111_globalSeed);
float l9_2754=mix(N111_rotationRandomY.x,N111_rotationRandomY.y,l9_2753);
float l9_2755=mix(N111_rotationRateY.x,N111_rotationRateY.y,l9_2753);
float l9_2756=((l9_2755*l9_2557)*l9_2321)*2.0;
float l9_2757=N111_PI*(l9_2752+l9_2750);
float l9_2758=N111_PI*(l9_2756+l9_2754);
float l9_2759=N111_PI*(l9_2559+l9_2552);
float3 l9_2760=float3(l9_2757,l9_2758,l9_2759);
float l9_2761=cos(l9_2760.x);
float l9_2762=sin(l9_2760.x);
float l9_2763=cos(l9_2760.y);
float l9_2764=sin(l9_2760.y);
float l9_2765=cos(l9_2760.z);
float l9_2766=sin(l9_2760.z);
l9_2606=float3x3(float3(l9_2763*l9_2765,(l9_2761*l9_2766)+((l9_2762*l9_2764)*l9_2765),(l9_2762*l9_2766)-((l9_2761*l9_2764)*l9_2765)),float3((-l9_2763)*l9_2766,(l9_2761*l9_2765)-((l9_2762*l9_2764)*l9_2766),(l9_2762*l9_2765)+((l9_2761*l9_2764)*l9_2766)),float3(l9_2764,(-l9_2762)*l9_2763,l9_2761*l9_2763));
}
if ((!N111_WORLDSPACE)&&(!N111_ENABLE_ALIGNTOVEL))
{
float4x4 l9_2767=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2768=(*sc_set0.UserUniforms).sc_ModelMatrix;
float4x4 l9_2769=(*sc_set0.UserUniforms).sc_ModelMatrix;
float3x3 l9_2770=float3x3(float3(l9_2767[0].xyz/float3(l9_2534.x)),float3(l9_2768[1].xyz/float3(l9_2534.y)),float3(l9_2769[2].xyz/float3(l9_2534.z)));
l9_2606=l9_2770*l9_2606;
}
N111_position=l9_2606*N111_position;
N111_normal=normalize(l9_2606*N111_normalObjectSpace);
N111_position+=l9_2551;
}
}
N111_timeValues=float4(l9_2319,l9_2320,l9_2321);
l9_2297=N111_cameraFade_trailHeadTime_taper;
l9_2251=l9_2297;
l9_2023=l9_2251;
out.Interpolator1.x=l9_2023.x;
out.Interpolator1.y=l9_2023.y;
out.Interpolator1.z=l9_2023.z;
out.Interpolator1.w=l9_2023.w;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
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
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float4 VertexColor;
float gInstanceID;
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
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float trailLength;
float2 trailTaper;
float trailWidth;
float4 trailSizeRampTexSize;
float4 trailSizeRampTexDims;
float4 trailSizeRampTexView;
float3x3 trailSizeRampTexTransform;
float4 trailSizeRampTexUvMinMax;
float4 trailSizeRampTexBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float2 sizeStart;
float3 sizeStart3D;
float2 sizeEnd;
float3 sizeEnd3D;
float2 sizeStartMin;
float3 sizeStartMin3D;
float2 sizeStartMax;
float3 sizeStartMax3D;
float2 sizeEndMin;
float3 sizeEndMin3D;
float2 sizeEndMax;
float3 sizeEndMax3D;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandomX;
float2 rotationRateX;
float2 randomRotationY;
float2 rotationRateY;
float2 rotationRandom;
float2 randomRotationZ;
float2 rotationRate;
float2 rotationRateZ;
float rotationDrag;
int CENTER_BBOX;
float fadeDistanceVisible;
float fadeDistanceInvisible;
float4 trailTexSize;
float4 trailTexDims;
float4 trailTexView;
float3x3 trailTexTransform;
float4 trailTexUvMinMax;
float4 trailTexBorderColor;
float4 trailColorRampTexSize;
float4 trailColorRampTexDims;
float4 trailColorRampTexView;
float3x3 trailColorRampTexTransform;
float4 trailColorRampTexUvMinMax;
float4 trailColorRampTexBorderColor;
float2 trailFadeStartEnd;
float2 trailFadeInOut;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float alphaDissolveMult;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float Port_Input1_N119;
float2 Port_Input1_N138;
float2 Port_Input1_N139;
float2 Port_Input1_N140;
float2 Port_Input1_N144;
float Port_Input1_N069;
float Port_Input1_N068;
float Port_Input1_N110;
float Port_Input1_N154;
float Port_Input1_N216;
float3 Port_Default_N182;
float3 Port_Emissive_N014;
float3 Port_AO_N014;
float3 Port_SpecularAO_N014;
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
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> materialParamsTex [[id(4)]];
texture2d<float> normalTex [[id(5)]];
texture2d<float> sc_EnvmapDiffuse [[id(6)]];
texture2d<float> sc_EnvmapSpecular [[id(7)]];
texture2d<float> sc_RayTracedAoTexture [[id(16)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(17)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(18)]];
texture2d<float> sc_RayTracedShadowTexture [[id(19)]];
texture2d<float> sc_SSAOTexture [[id(20)]];
texture2d<float> sc_ScreenTexture [[id(21)]];
texture2d<float> sc_ShadowTexture [[id(22)]];
texture2d<float> sizeRampTexture [[id(24)]];
texture2d<float> trailColorRampTex [[id(25)]];
texture2d<float> trailSizeRampTex [[id(26)]];
texture2d<float> trailTex [[id(27)]];
texture2d<float> velRampTexture [[id(28)]];
sampler colorRampTextureSmpSC [[id(29)]];
sampler intensityTextureSmpSC [[id(30)]];
sampler mainTextureSmpSC [[id(31)]];
sampler materialParamsTexSmpSC [[id(32)]];
sampler normalTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(39)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
sampler sizeRampTextureSmpSC [[id(45)]];
sampler trailColorRampTexSmpSC [[id(46)]];
sampler trailSizeRampTexSmpSC [[id(47)]];
sampler trailTexSmpSC [[id(48)]];
sampler velRampTextureSmpSC [[id(49)]];
constant userUniformsObj* UserUniforms [[id(50)]];
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
float Interpolator_gInstanceID [[user(locn13)]];
float4 Interpolator0 [[user(locn14)]];
float4 Interpolator1 [[user(locn15)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
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
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
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
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
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
bool N2_isTrailCondition=false;
bool N2_ENABLE_TRAILS=false;
bool N2_ENABLE_INDEPENDENTTRAIL=false;
bool N2_ENABLE_TRAILTEXTURE=false;
bool N2_ENABLE_TRAILCOLORRAMP=false;
float4 N2_fadeInOut=float4(0.0);
float3 N2_colorStart=float3(0.0);
float3 N2_colorEnd=float3(0.0);
bool N2_ENABLE_COLORMINMAX=false;
float3 N2_colorMinStart=float3(0.0);
float3 N2_colorMinEnd=float3(0.0);
float3 N2_colorMaxStart=float3(0.0);
float3 N2_colorMaxEnd=float3(0.0);
bool N2_ENABLE_COLORMONOMIN=false;
float N2_alphaStart=0.0;
float N2_alphaEnd=0.0;
bool N2_ENABLE_ALPHAMINMAX=false;
float N2_alphaMinStart=0.0;
float N2_alphaMinEnd=0.0;
float N2_alphaMaxStart=0.0;
float N2_alphaMaxEnd=0.0;
bool N2_ENABLE_ALPHADISSOLVE=false;
float N2_alphaDissolveMult=0.0;
bool N2_ENABLE_PREMULTIPLIEDCOLOR=false;
bool N2_ENABLE_BLACKASALPHA=false;
bool N2_ENABLE_SCREENFADE=false;
bool N2_ENABLE_FLIPBOOK=false;
float N2_numValidFrames=0.0;
float2 N2_gridSize=float2(0.0);
float N2_flipBookSpeedMult=0.0;
float N2_flipBookRandomStart=0.0;
bool N2_ENABLE_FLIPBOOKBLEND=false;
bool N2_ENABLE_FLIPBOOKBYLIFE=false;
bool N2_ENABLE_COLORRAMP=false;
float2 N2_texSize=float2(0.0);
float4 N2_colorRampMult=float4(0.0);
bool N2_ENABLE_NORANDOFFSET=false;
bool N2_ENABLE_BASETEXTURE=false;
bool N2_ENABLE_WORLDPOSSEED=false;
float N2_externalSeed=0.0;
float4 N2_timeValuesIn=float4(0.0);
float4 N2_cameraFade_trailHeadTime_taper=float4(0.0);
float3 N2_particleSeed=float3(0.0);
float N2_globalSeed=0.0;
float4 N2_result=float4(0.0);
float2 N2_uv=float2(0.0);
float N2_isTrail=0.0;
float2 N2_trailHeadTime=float2(0.0);
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
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.VertexColor=in.varColor;
Globals.gInstanceID=in.Interpolator_gInstanceID;
float4 Result_N158=float4(0.0);
float4 param=float4(0.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
ssGlobals tempGlobals;
float4 param_2;
if ((MESHTYPE_tmp==1)&&(int(PBR_tmp)!=0))
{
float l9_0=0.0;
float l9_1;
if ((int(TRAILS_tmp)!=0))
{
l9_1=1.001;
}
else
{
l9_1=0.001;
}
l9_1-=0.001;
l9_0=l9_1;
float4 l9_2=float4(0.0);
l9_2=param_3.VertexColor;
float l9_3=0.0;
l9_3=l9_2.x;
float l9_4=0.0;
float l9_5=l9_0;
bool l9_6=(l9_5*1.0)!=0.0;
bool l9_7;
if (l9_6)
{
l9_7=(l9_3*1.0)!=0.0;
}
else
{
l9_7=l9_6;
}
l9_4=float(l9_7);
float2 l9_8=float2(0.0);
float2 l9_9=(*sc_set0.UserUniforms).trailFadeStartEnd;
l9_8=l9_9;
float2 l9_10=float2(0.0);
float l9_11=(*sc_set0.UserUniforms).Port_Input1_N216;
float2 l9_12=float2(0.0);
float2 l9_13;
if (TRAILBEHAVIOR_tmp!=0)
{
l9_13=float2(l9_11);
}
else
{
float2 l9_14=float2(0.0);
float2 l9_15=(*sc_set0.UserUniforms).trailFadeInOut;
l9_14=l9_15;
l9_12=l9_14;
l9_13=l9_12;
}
l9_10=l9_13;
float4 l9_16=float4(0.0);
l9_16=float4(l9_8.x,l9_8.y,l9_16.z,l9_16.w);
l9_16=float4(l9_16.x,l9_16.y,l9_10.x,l9_10.y);
float3 l9_17=float3(0.0);
float3 l9_18=(*sc_set0.UserUniforms).colorStart;
l9_17=l9_18;
float3 l9_19=float3(0.0);
float3 l9_20=(*sc_set0.UserUniforms).colorEnd;
l9_19=l9_20;
float3 l9_21=float3(0.0);
float3 l9_22=(*sc_set0.UserUniforms).colorMinStart;
l9_21=l9_22;
float3 l9_23=float3(0.0);
float3 l9_24=(*sc_set0.UserUniforms).colorMinEnd;
l9_23=l9_24;
float3 l9_25=float3(0.0);
float3 l9_26=(*sc_set0.UserUniforms).colorMaxStart;
l9_25=l9_26;
float3 l9_27=float3(0.0);
float3 l9_28=(*sc_set0.UserUniforms).colorMaxEnd;
l9_27=l9_28;
float l9_29=0.0;
float l9_30=(*sc_set0.UserUniforms).alphaStart;
l9_29=l9_30;
float l9_31=0.0;
float l9_32=(*sc_set0.UserUniforms).alphaEnd;
l9_31=l9_32;
float l9_33=0.0;
float l9_34=(*sc_set0.UserUniforms).alphaMinStart;
l9_33=l9_34;
float l9_35=0.0;
float l9_36=(*sc_set0.UserUniforms).alphaMinEnd;
l9_35=l9_36;
float l9_37=0.0;
float l9_38=(*sc_set0.UserUniforms).alphaMaxStart;
l9_37=l9_38;
float l9_39=0.0;
float l9_40=(*sc_set0.UserUniforms).alphaMaxEnd;
l9_39=l9_40;
float l9_41=0.0;
float l9_42=(*sc_set0.UserUniforms).alphaDissolveMult;
l9_41=l9_42;
float l9_43=0.0;
float l9_44=(*sc_set0.UserUniforms).numValidFrames;
l9_43=l9_44;
float2 l9_45=float2(0.0);
float2 l9_46=(*sc_set0.UserUniforms).gridSize;
l9_45=l9_46;
float l9_47=0.0;
float l9_48=(*sc_set0.UserUniforms).flipBookSpeedMult;
l9_47=l9_48;
float l9_49=0.0;
float l9_50=(*sc_set0.UserUniforms).flipBookRandomStart;
l9_49=l9_50;
float2 l9_51=float2(0.0);
float2 l9_52=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
l9_51=l9_52;
float4 l9_53=float4(0.0);
float4 l9_54=(*sc_set0.UserUniforms).colorRampMult;
l9_53=l9_54;
float l9_55=0.0;
float l9_56=(*sc_set0.UserUniforms).externalSeed;
l9_55=l9_56;
float4 l9_57=float4(0.0);
float4 l9_58;
l9_58.x=in.Interpolator0.x;
l9_58.y=in.Interpolator0.y;
l9_58.z=in.Interpolator0.z;
l9_58.w=in.Interpolator0.w;
l9_57=l9_58;
float4 l9_59=float4(0.0);
float4 l9_60;
l9_60.x=in.Interpolator1.x;
l9_60.y=in.Interpolator1.y;
l9_60.z=in.Interpolator1.z;
l9_60.w=in.Interpolator1.w;
l9_59=l9_60;
float4 l9_61=float4(0.0);
float l9_62=l9_4;
float4 l9_63=l9_16;
float3 l9_64=l9_17;
float3 l9_65=l9_19;
float3 l9_66=l9_21;
float3 l9_67=l9_23;
float3 l9_68=l9_25;
float3 l9_69=l9_27;
float l9_70=l9_29;
float l9_71=l9_31;
float l9_72=l9_33;
float l9_73=l9_35;
float l9_74=l9_37;
float l9_75=l9_39;
float l9_76=l9_41;
float l9_77=l9_43;
float2 l9_78=l9_45;
float l9_79=l9_47;
float l9_80=l9_49;
float2 l9_81=l9_51;
float4 l9_82=l9_53;
float l9_83=l9_55;
float4 l9_84=l9_57;
float4 l9_85=l9_59;
ssGlobals l9_86=param_3;
tempGlobals=l9_86;
float4 l9_87=float4(0.0);
N2_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N2_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N2_isTrailCondition=l9_62!=0.0;
N2_ENABLE_TRAILTEXTURE=(int(TRAILTEXTURE_tmp)!=0);
N2_ENABLE_TRAILCOLORRAMP=(int(TRAILCOLORRAMP_tmp)!=0);
N2_fadeInOut=l9_63;
N2_colorStart=l9_64;
N2_colorEnd=l9_65;
N2_ENABLE_COLORMINMAX=(int(COLORMINMAX_tmp)!=0);
N2_colorMinStart=l9_66;
N2_colorMinEnd=l9_67;
N2_colorMaxStart=l9_68;
N2_colorMaxEnd=l9_69;
N2_ENABLE_COLORMONOMIN=(int(COLORMONOMIN_tmp)!=0);
N2_alphaStart=l9_70;
N2_alphaEnd=l9_71;
N2_ENABLE_ALPHAMINMAX=(int(ALPHAMINMAX_tmp)!=0);
N2_alphaMinStart=l9_72;
N2_alphaMinEnd=l9_73;
N2_alphaMaxStart=l9_74;
N2_alphaMaxEnd=l9_75;
N2_ENABLE_ALPHADISSOLVE=(int(ALPHADISSOLVE_tmp)!=0);
N2_alphaDissolveMult=l9_76;
N2_ENABLE_PREMULTIPLIEDCOLOR=(int(PREMULTIPLIEDCOLOR_tmp)!=0);
N2_ENABLE_BLACKASALPHA=(int(BLACKASALPHA_tmp)!=0);
N2_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N2_ENABLE_FLIPBOOK=(int(FLIPBOOK_tmp)!=0);
N2_numValidFrames=l9_77;
N2_gridSize=l9_78;
N2_flipBookSpeedMult=l9_79;
N2_flipBookRandomStart=l9_80;
N2_ENABLE_FLIPBOOKBLEND=(int(FLIPBOOKBLEND_tmp)!=0);
N2_ENABLE_FLIPBOOKBYLIFE=(int(FLIPBOOKBYLIFE_tmp)!=0);
N2_ENABLE_COLORRAMP=(int(COLORRAMP_tmp)!=0);
N2_texSize=l9_81;
N2_colorRampMult=l9_82;
N2_ENABLE_NORANDOFFSET=(int(NORANDOFFSET_tmp)!=0);
N2_ENABLE_BASETEXTURE=(int(BASETEXTURE_tmp)!=0);
N2_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N2_externalSeed=l9_83;
N2_timeValuesIn=l9_84;
N2_cameraFade_trailHeadTime_taper=l9_85;
float l9_88=0.0;
if (N2_ENABLE_WORLDPOSSEED)
{
float4x4 l9_89=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_88=length(float4(1.0)*l9_89);
}
N2_globalSeed=N2_externalSeed+l9_88;
int l9_90=0;
l9_90=int(tempGlobals.gInstanceID+0.5);
int l9_91=l9_90;
float l9_92=float(l9_91);
int l9_93=int(l9_92);
int l9_94=l9_93^(l9_93*15299);
int l9_95=l9_94;
int l9_96=l9_95;
int l9_97=((l9_96*((l9_96*1471343)+101146501))+1559861749)&2147483647;
int l9_98=l9_97;
int l9_99=l9_95*1399;
int l9_100=((l9_99*((l9_99*1471343)+101146501))+1559861749)&2147483647;
int l9_101=l9_100;
int l9_102=l9_95*7177;
int l9_103=((l9_102*((l9_102*1471343)+101146501))+1559861749)&2147483647;
int l9_104=l9_103;
int l9_105=l9_98;
float l9_106=float(l9_105)*4.6566129e-10;
int l9_107=l9_101;
float l9_108=float(l9_107)*4.6566129e-10;
int l9_109=l9_104;
float l9_110=float(l9_109)*4.6566129e-10;
float3 l9_111=float3(l9_106,l9_108,l9_110);
float3 l9_112=l9_111;
N2_particleSeed=l9_112;
float l9_113=N2_timeValuesIn.w;
float l9_114=N2_particleSeed.x;
float l9_115=N2_particleSeed.y;
float l9_116=N2_particleSeed.z;
float3 l9_117=fract((float3(l9_114,l9_115,l9_116)*27.21883)+float3(N2_globalSeed));
if (N2_ENABLE_COLORMONOMIN)
{
l9_117=fract((float3(l9_114,l9_114,l9_114)*27.21883)+float3(N2_globalSeed));
}
float l9_118=fract((N2_particleSeed.x*3121.3333)+N2_globalSeed);
float l9_119=fract((N2_particleSeed.y*13.2234)+N2_globalSeed);
float l9_120=fract((N2_particleSeed.z*3.5358)+N2_globalSeed);
N2_isTrail=0.0;
float l9_121=1.0;
N2_trailHeadTime=N2_cameraFade_trailHeadTime_taper.yz;
float4 l9_122=float4(1.0);
float2 l9_123=tempGlobals.Surface_UVCoord0;
N2_uv=l9_123;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrailCondition)
{
N2_isTrail=1.0;
float l9_124=N2_cameraFade_trailHeadTime_taper.w;
float2 l9_125=float2(0.5-(l9_124/2.0),0.5+(l9_124/2.0));
float l9_126=N2_uv.x;
float l9_127=l9_125.x;
bool l9_128=l9_126<l9_127;
bool l9_129;
if (!l9_128)
{
l9_129=N2_uv.x>l9_125.y;
}
else
{
l9_129=l9_128;
}
if (l9_129)
{
discard_fragment();
}
N2_uv=float2(0.0+(((N2_uv.x-l9_125.x)*1.0)/((l9_125.y-l9_125.x)+1e-06)),N2_uv.y);
if (N2_ENABLE_TRAILTEXTURE)
{
float2 l9_130=float2(N2_uv.x,1.0-N2_uv.y);
float4 l9_131=float4(0.0);
int l9_132=0;
if ((int(trailTexHasSwappedViews_tmp)!=0))
{
int l9_133=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_133=0;
}
else
{
l9_133=in.varStereoViewID;
}
int l9_134=l9_133;
l9_132=1-l9_134;
}
else
{
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=in.varStereoViewID;
}
int l9_136=l9_135;
l9_132=l9_136;
}
int l9_137=l9_132;
int l9_138=trailTexLayout_tmp;
int l9_139=l9_137;
float2 l9_140=l9_130;
bool l9_141=(int(SC_USE_UV_TRANSFORM_trailTex_tmp)!=0);
float3x3 l9_142=(*sc_set0.UserUniforms).trailTexTransform;
int2 l9_143=int2(SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp);
bool l9_144=(int(SC_USE_UV_MIN_MAX_trailTex_tmp)!=0);
float4 l9_145=(*sc_set0.UserUniforms).trailTexUvMinMax;
bool l9_146=(int(SC_USE_CLAMP_TO_BORDER_trailTex_tmp)!=0);
float4 l9_147=(*sc_set0.UserUniforms).trailTexBorderColor;
float l9_148=0.0;
bool l9_149=l9_146&&(!l9_144);
float l9_150=1.0;
float l9_151=l9_140.x;
int l9_152=l9_143.x;
if (l9_152==1)
{
l9_151=fract(l9_151);
}
else
{
if (l9_152==2)
{
float l9_153=fract(l9_151);
float l9_154=l9_151-l9_153;
float l9_155=step(0.25,fract(l9_154*0.5));
l9_151=mix(l9_153,1.0-l9_153,fast::clamp(l9_155,0.0,1.0));
}
}
l9_140.x=l9_151;
float l9_156=l9_140.y;
int l9_157=l9_143.y;
if (l9_157==1)
{
l9_156=fract(l9_156);
}
else
{
if (l9_157==2)
{
float l9_158=fract(l9_156);
float l9_159=l9_156-l9_158;
float l9_160=step(0.25,fract(l9_159*0.5));
l9_156=mix(l9_158,1.0-l9_158,fast::clamp(l9_160,0.0,1.0));
}
}
l9_140.y=l9_156;
if (l9_144)
{
bool l9_161=l9_146;
bool l9_162;
if (l9_161)
{
l9_162=l9_143.x==3;
}
else
{
l9_162=l9_161;
}
float l9_163=l9_140.x;
float l9_164=l9_145.x;
float l9_165=l9_145.z;
bool l9_166=l9_162;
float l9_167=l9_150;
float l9_168=fast::clamp(l9_163,l9_164,l9_165);
float l9_169=step(abs(l9_163-l9_168),9.9999997e-06);
l9_167*=(l9_169+((1.0-float(l9_166))*(1.0-l9_169)));
l9_163=l9_168;
l9_140.x=l9_163;
l9_150=l9_167;
bool l9_170=l9_146;
bool l9_171;
if (l9_170)
{
l9_171=l9_143.y==3;
}
else
{
l9_171=l9_170;
}
float l9_172=l9_140.y;
float l9_173=l9_145.y;
float l9_174=l9_145.w;
bool l9_175=l9_171;
float l9_176=l9_150;
float l9_177=fast::clamp(l9_172,l9_173,l9_174);
float l9_178=step(abs(l9_172-l9_177),9.9999997e-06);
l9_176*=(l9_178+((1.0-float(l9_175))*(1.0-l9_178)));
l9_172=l9_177;
l9_140.y=l9_172;
l9_150=l9_176;
}
float2 l9_179=l9_140;
bool l9_180=l9_141;
float3x3 l9_181=l9_142;
if (l9_180)
{
l9_179=float2((l9_181*float3(l9_179,1.0)).xy);
}
float2 l9_182=l9_179;
float2 l9_183=l9_182;
float2 l9_184=l9_183;
l9_140=l9_184;
float l9_185=l9_140.x;
int l9_186=l9_143.x;
bool l9_187=l9_149;
float l9_188=l9_150;
if ((l9_186==0)||(l9_186==3))
{
float l9_189=l9_185;
float l9_190=0.0;
float l9_191=1.0;
bool l9_192=l9_187;
float l9_193=l9_188;
float l9_194=fast::clamp(l9_189,l9_190,l9_191);
float l9_195=step(abs(l9_189-l9_194),9.9999997e-06);
l9_193*=(l9_195+((1.0-float(l9_192))*(1.0-l9_195)));
l9_189=l9_194;
l9_185=l9_189;
l9_188=l9_193;
}
l9_140.x=l9_185;
l9_150=l9_188;
float l9_196=l9_140.y;
int l9_197=l9_143.y;
bool l9_198=l9_149;
float l9_199=l9_150;
if ((l9_197==0)||(l9_197==3))
{
float l9_200=l9_196;
float l9_201=0.0;
float l9_202=1.0;
bool l9_203=l9_198;
float l9_204=l9_199;
float l9_205=fast::clamp(l9_200,l9_201,l9_202);
float l9_206=step(abs(l9_200-l9_205),9.9999997e-06);
l9_204*=(l9_206+((1.0-float(l9_203))*(1.0-l9_206)));
l9_200=l9_205;
l9_196=l9_200;
l9_199=l9_204;
}
l9_140.y=l9_196;
l9_150=l9_199;
float2 l9_207=l9_140;
int l9_208=l9_138;
int l9_209=l9_139;
float l9_210=l9_148;
float2 l9_211=l9_207;
int l9_212=l9_208;
int l9_213=l9_209;
float3 l9_214=float3(0.0);
if (l9_212==0)
{
l9_214=float3(l9_211,0.0);
}
else
{
if (l9_212==1)
{
l9_214=float3(l9_211.x,(l9_211.y*0.5)+(0.5-(float(l9_213)*0.5)),0.0);
}
else
{
l9_214=float3(l9_211,float(l9_213));
}
}
float3 l9_215=l9_214;
float3 l9_216=l9_215;
float2 l9_217=l9_216.xy;
float l9_218=l9_210;
float4 l9_219=sc_set0.trailTex.sample(sc_set0.trailTexSmpSC,l9_217,bias(l9_218));
float4 l9_220=l9_219;
float4 l9_221=l9_220;
if (l9_146)
{
l9_221=mix(l9_147,l9_221,float4(l9_150));
}
float4 l9_222=l9_221;
l9_131=l9_222;
float4 l9_223=l9_131;
l9_122=l9_223;
}
float l9_224=fast::max(1e-06,N2_fadeInOut.x);
float l9_225=N2_timeValuesIn.w;
l9_121*=mix(0.0,1.0,fast::clamp(l9_225,0.0,l9_224)/l9_224);
l9_224=fast::max(1e-06,N2_fadeInOut.y);
l9_121*=mix(0.0,1.0,fast::clamp(1.0-l9_225,0.0,l9_224)/l9_224);
if (!N2_ENABLE_INDEPENDENTTRAIL)
{
l9_113=N2_trailHeadTime.y;
l9_224=fast::max(1e-06,N2_fadeInOut.z);
l9_121*=mix(0.0,1.0,fast::clamp(l9_113,0.0,l9_224)/l9_224);
l9_224=fast::max(1e-06,N2_fadeInOut.w);
l9_121*=mix(0.0,1.0,fast::clamp(1.0-l9_113,0.0,l9_224)/l9_224);
}
if (N2_ENABLE_TRAILCOLORRAMP)
{
float2 l9_226=float2(0.0);
l9_226=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_227=l9_226;
float2 l9_228=float2(0.0);
l9_228=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_229=l9_228;
float l9_230=ceil(l9_113*l9_227.x)/l9_229.x;
float2 l9_231=float2(l9_230,0.5);
float4 l9_232=float4(0.0);
int l9_233=0;
if ((int(trailColorRampTexHasSwappedViews_tmp)!=0))
{
int l9_234=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_234=0;
}
else
{
l9_234=in.varStereoViewID;
}
int l9_235=l9_234;
l9_233=1-l9_235;
}
else
{
int l9_236=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_236=0;
}
else
{
l9_236=in.varStereoViewID;
}
int l9_237=l9_236;
l9_233=l9_237;
}
int l9_238=l9_233;
int l9_239=trailColorRampTexLayout_tmp;
int l9_240=l9_238;
float2 l9_241=l9_231;
bool l9_242=(int(SC_USE_UV_TRANSFORM_trailColorRampTex_tmp)!=0);
float3x3 l9_243=(*sc_set0.UserUniforms).trailColorRampTexTransform;
int2 l9_244=int2(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp);
bool l9_245=(int(SC_USE_UV_MIN_MAX_trailColorRampTex_tmp)!=0);
float4 l9_246=(*sc_set0.UserUniforms).trailColorRampTexUvMinMax;
bool l9_247=(int(SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp)!=0);
float4 l9_248=(*sc_set0.UserUniforms).trailColorRampTexBorderColor;
float l9_249=0.0;
bool l9_250=l9_247&&(!l9_245);
float l9_251=1.0;
float l9_252=l9_241.x;
int l9_253=l9_244.x;
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
l9_241.x=l9_252;
float l9_257=l9_241.y;
int l9_258=l9_244.y;
if (l9_258==1)
{
l9_257=fract(l9_257);
}
else
{
if (l9_258==2)
{
float l9_259=fract(l9_257);
float l9_260=l9_257-l9_259;
float l9_261=step(0.25,fract(l9_260*0.5));
l9_257=mix(l9_259,1.0-l9_259,fast::clamp(l9_261,0.0,1.0));
}
}
l9_241.y=l9_257;
if (l9_245)
{
bool l9_262=l9_247;
bool l9_263;
if (l9_262)
{
l9_263=l9_244.x==3;
}
else
{
l9_263=l9_262;
}
float l9_264=l9_241.x;
float l9_265=l9_246.x;
float l9_266=l9_246.z;
bool l9_267=l9_263;
float l9_268=l9_251;
float l9_269=fast::clamp(l9_264,l9_265,l9_266);
float l9_270=step(abs(l9_264-l9_269),9.9999997e-06);
l9_268*=(l9_270+((1.0-float(l9_267))*(1.0-l9_270)));
l9_264=l9_269;
l9_241.x=l9_264;
l9_251=l9_268;
bool l9_271=l9_247;
bool l9_272;
if (l9_271)
{
l9_272=l9_244.y==3;
}
else
{
l9_272=l9_271;
}
float l9_273=l9_241.y;
float l9_274=l9_246.y;
float l9_275=l9_246.w;
bool l9_276=l9_272;
float l9_277=l9_251;
float l9_278=fast::clamp(l9_273,l9_274,l9_275);
float l9_279=step(abs(l9_273-l9_278),9.9999997e-06);
l9_277*=(l9_279+((1.0-float(l9_276))*(1.0-l9_279)));
l9_273=l9_278;
l9_241.y=l9_273;
l9_251=l9_277;
}
float2 l9_280=l9_241;
bool l9_281=l9_242;
float3x3 l9_282=l9_243;
if (l9_281)
{
l9_280=float2((l9_282*float3(l9_280,1.0)).xy);
}
float2 l9_283=l9_280;
float2 l9_284=l9_283;
float2 l9_285=l9_284;
l9_241=l9_285;
float l9_286=l9_241.x;
int l9_287=l9_244.x;
bool l9_288=l9_250;
float l9_289=l9_251;
if ((l9_287==0)||(l9_287==3))
{
float l9_290=l9_286;
float l9_291=0.0;
float l9_292=1.0;
bool l9_293=l9_288;
float l9_294=l9_289;
float l9_295=fast::clamp(l9_290,l9_291,l9_292);
float l9_296=step(abs(l9_290-l9_295),9.9999997e-06);
l9_294*=(l9_296+((1.0-float(l9_293))*(1.0-l9_296)));
l9_290=l9_295;
l9_286=l9_290;
l9_289=l9_294;
}
l9_241.x=l9_286;
l9_251=l9_289;
float l9_297=l9_241.y;
int l9_298=l9_244.y;
bool l9_299=l9_250;
float l9_300=l9_251;
if ((l9_298==0)||(l9_298==3))
{
float l9_301=l9_297;
float l9_302=0.0;
float l9_303=1.0;
bool l9_304=l9_299;
float l9_305=l9_300;
float l9_306=fast::clamp(l9_301,l9_302,l9_303);
float l9_307=step(abs(l9_301-l9_306),9.9999997e-06);
l9_305*=(l9_307+((1.0-float(l9_304))*(1.0-l9_307)));
l9_301=l9_306;
l9_297=l9_301;
l9_300=l9_305;
}
l9_241.y=l9_297;
l9_251=l9_300;
float2 l9_308=l9_241;
int l9_309=l9_239;
int l9_310=l9_240;
float l9_311=l9_249;
float2 l9_312=l9_308;
int l9_313=l9_309;
int l9_314=l9_310;
float3 l9_315=float3(0.0);
if (l9_313==0)
{
l9_315=float3(l9_312,0.0);
}
else
{
if (l9_313==1)
{
l9_315=float3(l9_312.x,(l9_312.y*0.5)+(0.5-(float(l9_314)*0.5)),0.0);
}
else
{
l9_315=float3(l9_312,float(l9_314));
}
}
float3 l9_316=l9_315;
float3 l9_317=l9_316;
float2 l9_318=l9_317.xy;
float l9_319=l9_311;
float4 l9_320=sc_set0.trailColorRampTex.sample(sc_set0.trailColorRampTexSmpSC,l9_318,bias(l9_319));
float4 l9_321=l9_320;
float4 l9_322=l9_321;
if (l9_247)
{
l9_322=mix(l9_248,l9_322,float4(l9_251));
}
float4 l9_323=l9_322;
l9_232=l9_323;
float4 l9_324=l9_232;
l9_122*=l9_324;
}
}
}
float4 l9_325=float4(0.0);
float3 l9_326=float3(0.0);
float3 l9_327=float3(0.0);
float l9_328=0.0;
float l9_329=0.0;
if (N2_ENABLE_COLORMINMAX)
{
l9_326=mix(N2_colorMinStart,N2_colorMaxStart,l9_117);
l9_327=mix(N2_colorMinEnd,N2_colorMaxEnd,l9_117);
}
else
{
l9_326=N2_colorStart;
l9_327=N2_colorEnd;
}
if (N2_ENABLE_ALPHAMINMAX)
{
l9_328=mix(N2_alphaMinStart,N2_alphaMaxStart,l9_118);
l9_329=mix(N2_alphaMinEnd,N2_alphaMaxEnd,l9_118);
}
else
{
l9_328=N2_alphaStart;
l9_329=N2_alphaEnd;
}
l9_326=mix(l9_326,l9_327,float3(l9_113));
l9_328=mix(l9_328,l9_329,l9_113);
l9_325=float4(l9_326,l9_328);
float4 l9_330=float4(0.0);
float2 l9_331=float2(0.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
float2 l9_332=tempGlobals.Surface_UVCoord0;
l9_331=l9_332;
float2 l9_333=l9_331;
float l9_334=fast::max(N2_timeValuesIn.x,1e-06);
float l9_335=fast::max(N2_timeValuesIn.y,1e-06);
float l9_336=N2_timeValuesIn.z;
if (N2_ENABLE_FLIPBOOKBYLIFE)
{
float l9_337=mix(l9_334,l9_335,l9_120);
l9_336/=l9_337;
}
float l9_338=floor((N2_flipBookRandomStart+1.0)*l9_119);
float2 l9_339=l9_331;
float2 l9_340=N2_gridSize;
float l9_341=N2_numValidFrames;
float l9_342=l9_338;
float l9_343=N2_flipBookSpeedMult;
float l9_344=l9_336;
float l9_345=floor(l9_340.x);
float l9_346=floor(l9_340.y);
float l9_347=1.0/l9_345;
float l9_348=1.0/l9_346;
float l9_349=fast::min(l9_345*l9_346,floor(l9_341));
float l9_350=floor(mod((l9_344*l9_343)+floor(l9_342),l9_349));
float l9_351=floor(l9_350/l9_345);
float l9_352=mod(l9_350,l9_345);
float2 l9_353=float2((l9_347*l9_339.x)+(l9_352*l9_347),((1.0-l9_348)-(l9_351*l9_348))+(l9_348*l9_339.y));
l9_331=l9_353;
float2 l9_354=l9_331;
float4 l9_355=float4(0.0);
int l9_356=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_357=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_357=0;
}
else
{
l9_357=in.varStereoViewID;
}
int l9_358=l9_357;
l9_356=1-l9_358;
}
else
{
int l9_359=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_359=0;
}
else
{
l9_359=in.varStereoViewID;
}
int l9_360=l9_359;
l9_356=l9_360;
}
int l9_361=l9_356;
int l9_362=mainTextureLayout_tmp;
int l9_363=l9_361;
float2 l9_364=l9_354;
bool l9_365=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_366=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_367=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_368=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_369=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_370=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_371=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_372=0.0;
bool l9_373=l9_370&&(!l9_368);
float l9_374=1.0;
float l9_375=l9_364.x;
int l9_376=l9_367.x;
if (l9_376==1)
{
l9_375=fract(l9_375);
}
else
{
if (l9_376==2)
{
float l9_377=fract(l9_375);
float l9_378=l9_375-l9_377;
float l9_379=step(0.25,fract(l9_378*0.5));
l9_375=mix(l9_377,1.0-l9_377,fast::clamp(l9_379,0.0,1.0));
}
}
l9_364.x=l9_375;
float l9_380=l9_364.y;
int l9_381=l9_367.y;
if (l9_381==1)
{
l9_380=fract(l9_380);
}
else
{
if (l9_381==2)
{
float l9_382=fract(l9_380);
float l9_383=l9_380-l9_382;
float l9_384=step(0.25,fract(l9_383*0.5));
l9_380=mix(l9_382,1.0-l9_382,fast::clamp(l9_384,0.0,1.0));
}
}
l9_364.y=l9_380;
if (l9_368)
{
bool l9_385=l9_370;
bool l9_386;
if (l9_385)
{
l9_386=l9_367.x==3;
}
else
{
l9_386=l9_385;
}
float l9_387=l9_364.x;
float l9_388=l9_369.x;
float l9_389=l9_369.z;
bool l9_390=l9_386;
float l9_391=l9_374;
float l9_392=fast::clamp(l9_387,l9_388,l9_389);
float l9_393=step(abs(l9_387-l9_392),9.9999997e-06);
l9_391*=(l9_393+((1.0-float(l9_390))*(1.0-l9_393)));
l9_387=l9_392;
l9_364.x=l9_387;
l9_374=l9_391;
bool l9_394=l9_370;
bool l9_395;
if (l9_394)
{
l9_395=l9_367.y==3;
}
else
{
l9_395=l9_394;
}
float l9_396=l9_364.y;
float l9_397=l9_369.y;
float l9_398=l9_369.w;
bool l9_399=l9_395;
float l9_400=l9_374;
float l9_401=fast::clamp(l9_396,l9_397,l9_398);
float l9_402=step(abs(l9_396-l9_401),9.9999997e-06);
l9_400*=(l9_402+((1.0-float(l9_399))*(1.0-l9_402)));
l9_396=l9_401;
l9_364.y=l9_396;
l9_374=l9_400;
}
float2 l9_403=l9_364;
bool l9_404=l9_365;
float3x3 l9_405=l9_366;
if (l9_404)
{
l9_403=float2((l9_405*float3(l9_403,1.0)).xy);
}
float2 l9_406=l9_403;
float2 l9_407=l9_406;
float2 l9_408=l9_407;
l9_364=l9_408;
float l9_409=l9_364.x;
int l9_410=l9_367.x;
bool l9_411=l9_373;
float l9_412=l9_374;
if ((l9_410==0)||(l9_410==3))
{
float l9_413=l9_409;
float l9_414=0.0;
float l9_415=1.0;
bool l9_416=l9_411;
float l9_417=l9_412;
float l9_418=fast::clamp(l9_413,l9_414,l9_415);
float l9_419=step(abs(l9_413-l9_418),9.9999997e-06);
l9_417*=(l9_419+((1.0-float(l9_416))*(1.0-l9_419)));
l9_413=l9_418;
l9_409=l9_413;
l9_412=l9_417;
}
l9_364.x=l9_409;
l9_374=l9_412;
float l9_420=l9_364.y;
int l9_421=l9_367.y;
bool l9_422=l9_373;
float l9_423=l9_374;
if ((l9_421==0)||(l9_421==3))
{
float l9_424=l9_420;
float l9_425=0.0;
float l9_426=1.0;
bool l9_427=l9_422;
float l9_428=l9_423;
float l9_429=fast::clamp(l9_424,l9_425,l9_426);
float l9_430=step(abs(l9_424-l9_429),9.9999997e-06);
l9_428*=(l9_430+((1.0-float(l9_427))*(1.0-l9_430)));
l9_424=l9_429;
l9_420=l9_424;
l9_423=l9_428;
}
l9_364.y=l9_420;
l9_374=l9_423;
float2 l9_431=l9_364;
int l9_432=l9_362;
int l9_433=l9_363;
float l9_434=l9_372;
float2 l9_435=l9_431;
int l9_436=l9_432;
int l9_437=l9_433;
float3 l9_438=float3(0.0);
if (l9_436==0)
{
l9_438=float3(l9_435,0.0);
}
else
{
if (l9_436==1)
{
l9_438=float3(l9_435.x,(l9_435.y*0.5)+(0.5-(float(l9_437)*0.5)),0.0);
}
else
{
l9_438=float3(l9_435,float(l9_437));
}
}
float3 l9_439=l9_438;
float3 l9_440=l9_439;
float2 l9_441=l9_440.xy;
float l9_442=l9_434;
float4 l9_443=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_441,bias(l9_442));
float4 l9_444=l9_443;
float4 l9_445=l9_444;
if (l9_370)
{
l9_445=mix(l9_371,l9_445,float4(l9_374));
}
float4 l9_446=l9_445;
l9_355=l9_446;
float4 l9_447=l9_355;
l9_330=l9_447;
if (N2_ENABLE_FLIPBOOKBLEND)
{
float2 l9_448=l9_333;
float2 l9_449=N2_gridSize;
float l9_450=N2_numValidFrames;
float l9_451=floor(mod(l9_338+1.0,N2_numValidFrames));
float l9_452=N2_flipBookSpeedMult;
float l9_453=l9_336;
float l9_454=floor(l9_449.x);
float l9_455=floor(l9_449.y);
float l9_456=1.0/l9_454;
float l9_457=1.0/l9_455;
float l9_458=fast::min(l9_454*l9_455,floor(l9_450));
float l9_459=floor(mod((l9_453*l9_452)+floor(l9_451),l9_458));
float l9_460=floor(l9_459/l9_454);
float l9_461=mod(l9_459,l9_454);
float2 l9_462=float2((l9_456*l9_448.x)+(l9_461*l9_456),((1.0-l9_457)-(l9_460*l9_457))+(l9_457*l9_448.y));
l9_333=l9_462;
float4 l9_463=l9_330;
float2 l9_464=l9_333;
float4 l9_465=float4(0.0);
int l9_466=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_467=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_467=0;
}
else
{
l9_467=in.varStereoViewID;
}
int l9_468=l9_467;
l9_466=1-l9_468;
}
else
{
int l9_469=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_469=0;
}
else
{
l9_469=in.varStereoViewID;
}
int l9_470=l9_469;
l9_466=l9_470;
}
int l9_471=l9_466;
int l9_472=mainTextureLayout_tmp;
int l9_473=l9_471;
float2 l9_474=l9_464;
bool l9_475=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_476=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_477=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_478=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_479=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_480=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_481=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_482=0.0;
bool l9_483=l9_480&&(!l9_478);
float l9_484=1.0;
float l9_485=l9_474.x;
int l9_486=l9_477.x;
if (l9_486==1)
{
l9_485=fract(l9_485);
}
else
{
if (l9_486==2)
{
float l9_487=fract(l9_485);
float l9_488=l9_485-l9_487;
float l9_489=step(0.25,fract(l9_488*0.5));
l9_485=mix(l9_487,1.0-l9_487,fast::clamp(l9_489,0.0,1.0));
}
}
l9_474.x=l9_485;
float l9_490=l9_474.y;
int l9_491=l9_477.y;
if (l9_491==1)
{
l9_490=fract(l9_490);
}
else
{
if (l9_491==2)
{
float l9_492=fract(l9_490);
float l9_493=l9_490-l9_492;
float l9_494=step(0.25,fract(l9_493*0.5));
l9_490=mix(l9_492,1.0-l9_492,fast::clamp(l9_494,0.0,1.0));
}
}
l9_474.y=l9_490;
if (l9_478)
{
bool l9_495=l9_480;
bool l9_496;
if (l9_495)
{
l9_496=l9_477.x==3;
}
else
{
l9_496=l9_495;
}
float l9_497=l9_474.x;
float l9_498=l9_479.x;
float l9_499=l9_479.z;
bool l9_500=l9_496;
float l9_501=l9_484;
float l9_502=fast::clamp(l9_497,l9_498,l9_499);
float l9_503=step(abs(l9_497-l9_502),9.9999997e-06);
l9_501*=(l9_503+((1.0-float(l9_500))*(1.0-l9_503)));
l9_497=l9_502;
l9_474.x=l9_497;
l9_484=l9_501;
bool l9_504=l9_480;
bool l9_505;
if (l9_504)
{
l9_505=l9_477.y==3;
}
else
{
l9_505=l9_504;
}
float l9_506=l9_474.y;
float l9_507=l9_479.y;
float l9_508=l9_479.w;
bool l9_509=l9_505;
float l9_510=l9_484;
float l9_511=fast::clamp(l9_506,l9_507,l9_508);
float l9_512=step(abs(l9_506-l9_511),9.9999997e-06);
l9_510*=(l9_512+((1.0-float(l9_509))*(1.0-l9_512)));
l9_506=l9_511;
l9_474.y=l9_506;
l9_484=l9_510;
}
float2 l9_513=l9_474;
bool l9_514=l9_475;
float3x3 l9_515=l9_476;
if (l9_514)
{
l9_513=float2((l9_515*float3(l9_513,1.0)).xy);
}
float2 l9_516=l9_513;
float2 l9_517=l9_516;
float2 l9_518=l9_517;
l9_474=l9_518;
float l9_519=l9_474.x;
int l9_520=l9_477.x;
bool l9_521=l9_483;
float l9_522=l9_484;
if ((l9_520==0)||(l9_520==3))
{
float l9_523=l9_519;
float l9_524=0.0;
float l9_525=1.0;
bool l9_526=l9_521;
float l9_527=l9_522;
float l9_528=fast::clamp(l9_523,l9_524,l9_525);
float l9_529=step(abs(l9_523-l9_528),9.9999997e-06);
l9_527*=(l9_529+((1.0-float(l9_526))*(1.0-l9_529)));
l9_523=l9_528;
l9_519=l9_523;
l9_522=l9_527;
}
l9_474.x=l9_519;
l9_484=l9_522;
float l9_530=l9_474.y;
int l9_531=l9_477.y;
bool l9_532=l9_483;
float l9_533=l9_484;
if ((l9_531==0)||(l9_531==3))
{
float l9_534=l9_530;
float l9_535=0.0;
float l9_536=1.0;
bool l9_537=l9_532;
float l9_538=l9_533;
float l9_539=fast::clamp(l9_534,l9_535,l9_536);
float l9_540=step(abs(l9_534-l9_539),9.9999997e-06);
l9_538*=(l9_540+((1.0-float(l9_537))*(1.0-l9_540)));
l9_534=l9_539;
l9_530=l9_534;
l9_533=l9_538;
}
l9_474.y=l9_530;
l9_484=l9_533;
float2 l9_541=l9_474;
int l9_542=l9_472;
int l9_543=l9_473;
float l9_544=l9_482;
float2 l9_545=l9_541;
int l9_546=l9_542;
int l9_547=l9_543;
float3 l9_548=float3(0.0);
if (l9_546==0)
{
l9_548=float3(l9_545,0.0);
}
else
{
if (l9_546==1)
{
l9_548=float3(l9_545.x,(l9_545.y*0.5)+(0.5-(float(l9_547)*0.5)),0.0);
}
else
{
l9_548=float3(l9_545,float(l9_547));
}
}
float3 l9_549=l9_548;
float3 l9_550=l9_549;
float2 l9_551=l9_550.xy;
float l9_552=l9_544;
float4 l9_553=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_551,bias(l9_552));
float4 l9_554=l9_553;
float4 l9_555=l9_554;
if (l9_480)
{
l9_555=mix(l9_481,l9_555,float4(l9_484));
}
float4 l9_556=l9_555;
l9_465=l9_556;
float4 l9_557=l9_465;
l9_330=mix(l9_463,l9_557,float4(fract((l9_336*N2_flipBookSpeedMult)+l9_338)));
}
}
}
float4 l9_558=float4(1.0);
if (N2_ENABLE_COLORRAMP)
{
float l9_559=ceil(l9_113*N2_texSize.x)/N2_texSize.x;
float l9_560=l9_559;
if (N2_ENABLE_NORANDOFFSET)
{
float2 l9_561=tempGlobals.Surface_UVCoord0;
l9_560+=(l9_561.x/N2_texSize.x);
}
float2 l9_562=float2(l9_560,0.5);
float4 l9_563=float4(0.0);
int l9_564=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_565=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_565=0;
}
else
{
l9_565=in.varStereoViewID;
}
int l9_566=l9_565;
l9_564=1-l9_566;
}
else
{
int l9_567=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_567=0;
}
else
{
l9_567=in.varStereoViewID;
}
int l9_568=l9_567;
l9_564=l9_568;
}
int l9_569=l9_564;
int l9_570=colorRampTextureLayout_tmp;
int l9_571=l9_569;
float2 l9_572=l9_562;
bool l9_573=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_574=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_575=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_576=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_577=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_578=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_579=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_580=0.0;
bool l9_581=l9_578&&(!l9_576);
float l9_582=1.0;
float l9_583=l9_572.x;
int l9_584=l9_575.x;
if (l9_584==1)
{
l9_583=fract(l9_583);
}
else
{
if (l9_584==2)
{
float l9_585=fract(l9_583);
float l9_586=l9_583-l9_585;
float l9_587=step(0.25,fract(l9_586*0.5));
l9_583=mix(l9_585,1.0-l9_585,fast::clamp(l9_587,0.0,1.0));
}
}
l9_572.x=l9_583;
float l9_588=l9_572.y;
int l9_589=l9_575.y;
if (l9_589==1)
{
l9_588=fract(l9_588);
}
else
{
if (l9_589==2)
{
float l9_590=fract(l9_588);
float l9_591=l9_588-l9_590;
float l9_592=step(0.25,fract(l9_591*0.5));
l9_588=mix(l9_590,1.0-l9_590,fast::clamp(l9_592,0.0,1.0));
}
}
l9_572.y=l9_588;
if (l9_576)
{
bool l9_593=l9_578;
bool l9_594;
if (l9_593)
{
l9_594=l9_575.x==3;
}
else
{
l9_594=l9_593;
}
float l9_595=l9_572.x;
float l9_596=l9_577.x;
float l9_597=l9_577.z;
bool l9_598=l9_594;
float l9_599=l9_582;
float l9_600=fast::clamp(l9_595,l9_596,l9_597);
float l9_601=step(abs(l9_595-l9_600),9.9999997e-06);
l9_599*=(l9_601+((1.0-float(l9_598))*(1.0-l9_601)));
l9_595=l9_600;
l9_572.x=l9_595;
l9_582=l9_599;
bool l9_602=l9_578;
bool l9_603;
if (l9_602)
{
l9_603=l9_575.y==3;
}
else
{
l9_603=l9_602;
}
float l9_604=l9_572.y;
float l9_605=l9_577.y;
float l9_606=l9_577.w;
bool l9_607=l9_603;
float l9_608=l9_582;
float l9_609=fast::clamp(l9_604,l9_605,l9_606);
float l9_610=step(abs(l9_604-l9_609),9.9999997e-06);
l9_608*=(l9_610+((1.0-float(l9_607))*(1.0-l9_610)));
l9_604=l9_609;
l9_572.y=l9_604;
l9_582=l9_608;
}
float2 l9_611=l9_572;
bool l9_612=l9_573;
float3x3 l9_613=l9_574;
if (l9_612)
{
l9_611=float2((l9_613*float3(l9_611,1.0)).xy);
}
float2 l9_614=l9_611;
float2 l9_615=l9_614;
float2 l9_616=l9_615;
l9_572=l9_616;
float l9_617=l9_572.x;
int l9_618=l9_575.x;
bool l9_619=l9_581;
float l9_620=l9_582;
if ((l9_618==0)||(l9_618==3))
{
float l9_621=l9_617;
float l9_622=0.0;
float l9_623=1.0;
bool l9_624=l9_619;
float l9_625=l9_620;
float l9_626=fast::clamp(l9_621,l9_622,l9_623);
float l9_627=step(abs(l9_621-l9_626),9.9999997e-06);
l9_625*=(l9_627+((1.0-float(l9_624))*(1.0-l9_627)));
l9_621=l9_626;
l9_617=l9_621;
l9_620=l9_625;
}
l9_572.x=l9_617;
l9_582=l9_620;
float l9_628=l9_572.y;
int l9_629=l9_575.y;
bool l9_630=l9_581;
float l9_631=l9_582;
if ((l9_629==0)||(l9_629==3))
{
float l9_632=l9_628;
float l9_633=0.0;
float l9_634=1.0;
bool l9_635=l9_630;
float l9_636=l9_631;
float l9_637=fast::clamp(l9_632,l9_633,l9_634);
float l9_638=step(abs(l9_632-l9_637),9.9999997e-06);
l9_636*=(l9_638+((1.0-float(l9_635))*(1.0-l9_638)));
l9_632=l9_637;
l9_628=l9_632;
l9_631=l9_636;
}
l9_572.y=l9_628;
l9_582=l9_631;
float2 l9_639=l9_572;
int l9_640=l9_570;
int l9_641=l9_571;
float l9_642=l9_580;
float2 l9_643=l9_639;
int l9_644=l9_640;
int l9_645=l9_641;
float3 l9_646=float3(0.0);
if (l9_644==0)
{
l9_646=float3(l9_643,0.0);
}
else
{
if (l9_644==1)
{
l9_646=float3(l9_643.x,(l9_643.y*0.5)+(0.5-(float(l9_645)*0.5)),0.0);
}
else
{
l9_646=float3(l9_643,float(l9_645));
}
}
float3 l9_647=l9_646;
float3 l9_648=l9_647;
float2 l9_649=l9_648.xy;
float l9_650=l9_642;
float4 l9_651=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_649,bias(l9_650));
float4 l9_652=l9_651;
float4 l9_653=l9_652;
if (l9_578)
{
l9_653=mix(l9_579,l9_653,float4(l9_582));
}
float4 l9_654=l9_653;
l9_563=l9_654;
float4 l9_655=l9_563;
l9_558=l9_655*N2_colorRampMult;
}
float4 l9_656=float4(1.0);
float4 l9_657=float4(1.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
N2_uv=l9_331;
l9_656=l9_330;
}
else
{
float2 l9_658=N2_uv;
float4 l9_659=float4(0.0);
int l9_660=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_661=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_661=0;
}
else
{
l9_661=in.varStereoViewID;
}
int l9_662=l9_661;
l9_660=1-l9_662;
}
else
{
int l9_663=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_663=0;
}
else
{
l9_663=in.varStereoViewID;
}
int l9_664=l9_663;
l9_660=l9_664;
}
int l9_665=l9_660;
int l9_666=mainTextureLayout_tmp;
int l9_667=l9_665;
float2 l9_668=l9_658;
bool l9_669=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_670=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_671=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_672=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_673=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_674=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_675=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_676=0.0;
bool l9_677=l9_674&&(!l9_672);
float l9_678=1.0;
float l9_679=l9_668.x;
int l9_680=l9_671.x;
if (l9_680==1)
{
l9_679=fract(l9_679);
}
else
{
if (l9_680==2)
{
float l9_681=fract(l9_679);
float l9_682=l9_679-l9_681;
float l9_683=step(0.25,fract(l9_682*0.5));
l9_679=mix(l9_681,1.0-l9_681,fast::clamp(l9_683,0.0,1.0));
}
}
l9_668.x=l9_679;
float l9_684=l9_668.y;
int l9_685=l9_671.y;
if (l9_685==1)
{
l9_684=fract(l9_684);
}
else
{
if (l9_685==2)
{
float l9_686=fract(l9_684);
float l9_687=l9_684-l9_686;
float l9_688=step(0.25,fract(l9_687*0.5));
l9_684=mix(l9_686,1.0-l9_686,fast::clamp(l9_688,0.0,1.0));
}
}
l9_668.y=l9_684;
if (l9_672)
{
bool l9_689=l9_674;
bool l9_690;
if (l9_689)
{
l9_690=l9_671.x==3;
}
else
{
l9_690=l9_689;
}
float l9_691=l9_668.x;
float l9_692=l9_673.x;
float l9_693=l9_673.z;
bool l9_694=l9_690;
float l9_695=l9_678;
float l9_696=fast::clamp(l9_691,l9_692,l9_693);
float l9_697=step(abs(l9_691-l9_696),9.9999997e-06);
l9_695*=(l9_697+((1.0-float(l9_694))*(1.0-l9_697)));
l9_691=l9_696;
l9_668.x=l9_691;
l9_678=l9_695;
bool l9_698=l9_674;
bool l9_699;
if (l9_698)
{
l9_699=l9_671.y==3;
}
else
{
l9_699=l9_698;
}
float l9_700=l9_668.y;
float l9_701=l9_673.y;
float l9_702=l9_673.w;
bool l9_703=l9_699;
float l9_704=l9_678;
float l9_705=fast::clamp(l9_700,l9_701,l9_702);
float l9_706=step(abs(l9_700-l9_705),9.9999997e-06);
l9_704*=(l9_706+((1.0-float(l9_703))*(1.0-l9_706)));
l9_700=l9_705;
l9_668.y=l9_700;
l9_678=l9_704;
}
float2 l9_707=l9_668;
bool l9_708=l9_669;
float3x3 l9_709=l9_670;
if (l9_708)
{
l9_707=float2((l9_709*float3(l9_707,1.0)).xy);
}
float2 l9_710=l9_707;
float2 l9_711=l9_710;
float2 l9_712=l9_711;
l9_668=l9_712;
float l9_713=l9_668.x;
int l9_714=l9_671.x;
bool l9_715=l9_677;
float l9_716=l9_678;
if ((l9_714==0)||(l9_714==3))
{
float l9_717=l9_713;
float l9_718=0.0;
float l9_719=1.0;
bool l9_720=l9_715;
float l9_721=l9_716;
float l9_722=fast::clamp(l9_717,l9_718,l9_719);
float l9_723=step(abs(l9_717-l9_722),9.9999997e-06);
l9_721*=(l9_723+((1.0-float(l9_720))*(1.0-l9_723)));
l9_717=l9_722;
l9_713=l9_717;
l9_716=l9_721;
}
l9_668.x=l9_713;
l9_678=l9_716;
float l9_724=l9_668.y;
int l9_725=l9_671.y;
bool l9_726=l9_677;
float l9_727=l9_678;
if ((l9_725==0)||(l9_725==3))
{
float l9_728=l9_724;
float l9_729=0.0;
float l9_730=1.0;
bool l9_731=l9_726;
float l9_732=l9_727;
float l9_733=fast::clamp(l9_728,l9_729,l9_730);
float l9_734=step(abs(l9_728-l9_733),9.9999997e-06);
l9_732*=(l9_734+((1.0-float(l9_731))*(1.0-l9_734)));
l9_728=l9_733;
l9_724=l9_728;
l9_727=l9_732;
}
l9_668.y=l9_724;
l9_678=l9_727;
float2 l9_735=l9_668;
int l9_736=l9_666;
int l9_737=l9_667;
float l9_738=l9_676;
float2 l9_739=l9_735;
int l9_740=l9_736;
int l9_741=l9_737;
float3 l9_742=float3(0.0);
if (l9_740==0)
{
l9_742=float3(l9_739,0.0);
}
else
{
if (l9_740==1)
{
l9_742=float3(l9_739.x,(l9_739.y*0.5)+(0.5-(float(l9_741)*0.5)),0.0);
}
else
{
l9_742=float3(l9_739,float(l9_741));
}
}
float3 l9_743=l9_742;
float3 l9_744=l9_743;
float2 l9_745=l9_744.xy;
float l9_746=l9_738;
float4 l9_747=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_745,bias(l9_746));
float4 l9_748=l9_747;
float4 l9_749=l9_748;
if (l9_674)
{
l9_749=mix(l9_675,l9_749,float4(l9_678));
}
float4 l9_750=l9_749;
l9_659=l9_750;
float4 l9_751=l9_659;
l9_656=l9_751;
}
}
if (N2_ENABLE_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_657=l9_558;
}
}
N2_result=(l9_656*l9_325)*l9_657;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrail>0.0)
{
N2_result=(l9_122*l9_325)*l9_657;
N2_result.w*=l9_121;
}
}
if (N2_ENABLE_SCREENFADE)
{
N2_result.w*=N2_cameraFade_trailHeadTime_taper.x;
}
if (N2_ENABLE_ALPHADISSOLVE)
{
float l9_752=l9_113*N2_alphaDissolveMult;
N2_result.w=fast::clamp(N2_result.w-l9_752,0.0,1.0);
}
if (N2_ENABLE_BLACKASALPHA)
{
float l9_753=length(N2_result.xyz);
N2_result.w=l9_753;
if (N2_ENABLE_TRAILS)
{
N2_result.w*=l9_121;
}
}
if (N2_ENABLE_PREMULTIPLIEDCOLOR)
{
float3 l9_754=N2_result.xyz*N2_result.w;
N2_result=float4(l9_754.x,l9_754.y,l9_754.z,N2_result.w);
}
l9_87=N2_result;
l9_61=l9_87;
float3 l9_755=float3(0.0);
float l9_756=0.0;
float4 l9_757=l9_61;
float3 l9_758=l9_757.xyz;
float l9_759=l9_757.w;
l9_755=l9_758;
l9_756=l9_759;
float3 l9_760=float3(0.0);
float3 l9_761=float3(0.0);
float3 l9_762=(*sc_set0.UserUniforms).Port_Default_N182;
ssGlobals l9_763=param_3;
float3 l9_764;
if ((int(PBRNORMALTEX_tmp)!=0))
{
float l9_765=0.0;
float l9_766;
if ((int(TRAILS_tmp)!=0))
{
l9_766=1.001;
}
else
{
l9_766=0.001;
}
l9_766-=0.001;
l9_765=l9_766;
float4 l9_767=float4(0.0);
l9_767=l9_763.VertexColor;
float l9_768=0.0;
l9_768=l9_767.x;
float l9_769=0.0;
float l9_770=l9_765;
bool l9_771=(l9_770*1.0)!=0.0;
bool l9_772;
if (l9_771)
{
l9_772=(l9_768*1.0)!=0.0;
}
else
{
l9_772=l9_771;
}
l9_769=float(l9_772);
float2 l9_773=float2(0.0);
float2 l9_774=(*sc_set0.UserUniforms).trailFadeStartEnd;
l9_773=l9_774;
float2 l9_775=float2(0.0);
float l9_776=(*sc_set0.UserUniforms).Port_Input1_N216;
float2 l9_777=float2(0.0);
float2 l9_778;
if (TRAILBEHAVIOR_tmp!=0)
{
l9_778=float2(l9_776);
}
else
{
float2 l9_779=float2(0.0);
float2 l9_780=(*sc_set0.UserUniforms).trailFadeInOut;
l9_779=l9_780;
l9_777=l9_779;
l9_778=l9_777;
}
l9_775=l9_778;
float4 l9_781=float4(0.0);
l9_781=float4(l9_773.x,l9_773.y,l9_781.z,l9_781.w);
l9_781=float4(l9_781.x,l9_781.y,l9_775.x,l9_775.y);
float3 l9_782=float3(0.0);
float3 l9_783=(*sc_set0.UserUniforms).colorStart;
l9_782=l9_783;
float3 l9_784=float3(0.0);
float3 l9_785=(*sc_set0.UserUniforms).colorEnd;
l9_784=l9_785;
float3 l9_786=float3(0.0);
float3 l9_787=(*sc_set0.UserUniforms).colorMinStart;
l9_786=l9_787;
float3 l9_788=float3(0.0);
float3 l9_789=(*sc_set0.UserUniforms).colorMinEnd;
l9_788=l9_789;
float3 l9_790=float3(0.0);
float3 l9_791=(*sc_set0.UserUniforms).colorMaxStart;
l9_790=l9_791;
float3 l9_792=float3(0.0);
float3 l9_793=(*sc_set0.UserUniforms).colorMaxEnd;
l9_792=l9_793;
float l9_794=0.0;
float l9_795=(*sc_set0.UserUniforms).alphaStart;
l9_794=l9_795;
float l9_796=0.0;
float l9_797=(*sc_set0.UserUniforms).alphaEnd;
l9_796=l9_797;
float l9_798=0.0;
float l9_799=(*sc_set0.UserUniforms).alphaMinStart;
l9_798=l9_799;
float l9_800=0.0;
float l9_801=(*sc_set0.UserUniforms).alphaMinEnd;
l9_800=l9_801;
float l9_802=0.0;
float l9_803=(*sc_set0.UserUniforms).alphaMaxStart;
l9_802=l9_803;
float l9_804=0.0;
float l9_805=(*sc_set0.UserUniforms).alphaMaxEnd;
l9_804=l9_805;
float l9_806=0.0;
float l9_807=(*sc_set0.UserUniforms).alphaDissolveMult;
l9_806=l9_807;
float l9_808=0.0;
float l9_809=(*sc_set0.UserUniforms).numValidFrames;
l9_808=l9_809;
float2 l9_810=float2(0.0);
float2 l9_811=(*sc_set0.UserUniforms).gridSize;
l9_810=l9_811;
float l9_812=0.0;
float l9_813=(*sc_set0.UserUniforms).flipBookSpeedMult;
l9_812=l9_813;
float l9_814=0.0;
float l9_815=(*sc_set0.UserUniforms).flipBookRandomStart;
l9_814=l9_815;
float2 l9_816=float2(0.0);
float2 l9_817=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
l9_816=l9_817;
float4 l9_818=float4(0.0);
float4 l9_819=(*sc_set0.UserUniforms).colorRampMult;
l9_818=l9_819;
float l9_820=0.0;
float l9_821=(*sc_set0.UserUniforms).externalSeed;
l9_820=l9_821;
float4 l9_822=float4(0.0);
float4 l9_823;
l9_823.x=in.Interpolator0.x;
l9_823.y=in.Interpolator0.y;
l9_823.z=in.Interpolator0.z;
l9_823.w=in.Interpolator0.w;
l9_822=l9_823;
float4 l9_824=float4(0.0);
float4 l9_825;
l9_825.x=in.Interpolator1.x;
l9_825.y=in.Interpolator1.y;
l9_825.z=in.Interpolator1.z;
l9_825.w=in.Interpolator1.w;
l9_824=l9_825;
float2 l9_826=float2(0.0);
float l9_827=l9_769;
float4 l9_828=l9_781;
float3 l9_829=l9_782;
float3 l9_830=l9_784;
float3 l9_831=l9_786;
float3 l9_832=l9_788;
float3 l9_833=l9_790;
float3 l9_834=l9_792;
float l9_835=l9_794;
float l9_836=l9_796;
float l9_837=l9_798;
float l9_838=l9_800;
float l9_839=l9_802;
float l9_840=l9_804;
float l9_841=l9_806;
float l9_842=l9_808;
float2 l9_843=l9_810;
float l9_844=l9_812;
float l9_845=l9_814;
float2 l9_846=l9_816;
float4 l9_847=l9_818;
float l9_848=l9_820;
float4 l9_849=l9_822;
float4 l9_850=l9_824;
ssGlobals l9_851=l9_763;
tempGlobals=l9_851;
float2 l9_852=float2(0.0);
N2_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N2_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N2_isTrailCondition=l9_827!=0.0;
N2_ENABLE_TRAILTEXTURE=(int(TRAILTEXTURE_tmp)!=0);
N2_ENABLE_TRAILCOLORRAMP=(int(TRAILCOLORRAMP_tmp)!=0);
N2_fadeInOut=l9_828;
N2_colorStart=l9_829;
N2_colorEnd=l9_830;
N2_ENABLE_COLORMINMAX=(int(COLORMINMAX_tmp)!=0);
N2_colorMinStart=l9_831;
N2_colorMinEnd=l9_832;
N2_colorMaxStart=l9_833;
N2_colorMaxEnd=l9_834;
N2_ENABLE_COLORMONOMIN=(int(COLORMONOMIN_tmp)!=0);
N2_alphaStart=l9_835;
N2_alphaEnd=l9_836;
N2_ENABLE_ALPHAMINMAX=(int(ALPHAMINMAX_tmp)!=0);
N2_alphaMinStart=l9_837;
N2_alphaMinEnd=l9_838;
N2_alphaMaxStart=l9_839;
N2_alphaMaxEnd=l9_840;
N2_ENABLE_ALPHADISSOLVE=(int(ALPHADISSOLVE_tmp)!=0);
N2_alphaDissolveMult=l9_841;
N2_ENABLE_PREMULTIPLIEDCOLOR=(int(PREMULTIPLIEDCOLOR_tmp)!=0);
N2_ENABLE_BLACKASALPHA=(int(BLACKASALPHA_tmp)!=0);
N2_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N2_ENABLE_FLIPBOOK=(int(FLIPBOOK_tmp)!=0);
N2_numValidFrames=l9_842;
N2_gridSize=l9_843;
N2_flipBookSpeedMult=l9_844;
N2_flipBookRandomStart=l9_845;
N2_ENABLE_FLIPBOOKBLEND=(int(FLIPBOOKBLEND_tmp)!=0);
N2_ENABLE_FLIPBOOKBYLIFE=(int(FLIPBOOKBYLIFE_tmp)!=0);
N2_ENABLE_COLORRAMP=(int(COLORRAMP_tmp)!=0);
N2_texSize=l9_846;
N2_colorRampMult=l9_847;
N2_ENABLE_NORANDOFFSET=(int(NORANDOFFSET_tmp)!=0);
N2_ENABLE_BASETEXTURE=(int(BASETEXTURE_tmp)!=0);
N2_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N2_externalSeed=l9_848;
N2_timeValuesIn=l9_849;
N2_cameraFade_trailHeadTime_taper=l9_850;
float l9_853=0.0;
if (N2_ENABLE_WORLDPOSSEED)
{
float4x4 l9_854=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_853=length(float4(1.0)*l9_854);
}
N2_globalSeed=N2_externalSeed+l9_853;
int l9_855=0;
l9_855=int(tempGlobals.gInstanceID+0.5);
int l9_856=l9_855;
float l9_857=float(l9_856);
int l9_858=int(l9_857);
int l9_859=l9_858^(l9_858*15299);
int l9_860=l9_859;
int l9_861=l9_860;
int l9_862=((l9_861*((l9_861*1471343)+101146501))+1559861749)&2147483647;
int l9_863=l9_862;
int l9_864=l9_860*1399;
int l9_865=((l9_864*((l9_864*1471343)+101146501))+1559861749)&2147483647;
int l9_866=l9_865;
int l9_867=l9_860*7177;
int l9_868=((l9_867*((l9_867*1471343)+101146501))+1559861749)&2147483647;
int l9_869=l9_868;
int l9_870=l9_863;
float l9_871=float(l9_870)*4.6566129e-10;
int l9_872=l9_866;
float l9_873=float(l9_872)*4.6566129e-10;
int l9_874=l9_869;
float l9_875=float(l9_874)*4.6566129e-10;
float3 l9_876=float3(l9_871,l9_873,l9_875);
float3 l9_877=l9_876;
N2_particleSeed=l9_877;
float l9_878=N2_timeValuesIn.w;
float l9_879=N2_particleSeed.x;
float l9_880=N2_particleSeed.y;
float l9_881=N2_particleSeed.z;
float3 l9_882=fract((float3(l9_879,l9_880,l9_881)*27.21883)+float3(N2_globalSeed));
if (N2_ENABLE_COLORMONOMIN)
{
l9_882=fract((float3(l9_879,l9_879,l9_879)*27.21883)+float3(N2_globalSeed));
}
float l9_883=fract((N2_particleSeed.x*3121.3333)+N2_globalSeed);
float l9_884=fract((N2_particleSeed.y*13.2234)+N2_globalSeed);
float l9_885=fract((N2_particleSeed.z*3.5358)+N2_globalSeed);
N2_isTrail=0.0;
float l9_886=1.0;
N2_trailHeadTime=N2_cameraFade_trailHeadTime_taper.yz;
float4 l9_887=float4(1.0);
float2 l9_888=tempGlobals.Surface_UVCoord0;
N2_uv=l9_888;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrailCondition)
{
N2_isTrail=1.0;
float l9_889=N2_cameraFade_trailHeadTime_taper.w;
float2 l9_890=float2(0.5-(l9_889/2.0),0.5+(l9_889/2.0));
float l9_891=N2_uv.x;
float l9_892=l9_890.x;
bool l9_893=l9_891<l9_892;
bool l9_894;
if (!l9_893)
{
l9_894=N2_uv.x>l9_890.y;
}
else
{
l9_894=l9_893;
}
if (l9_894)
{
discard_fragment();
}
N2_uv=float2(0.0+(((N2_uv.x-l9_890.x)*1.0)/((l9_890.y-l9_890.x)+1e-06)),N2_uv.y);
if (N2_ENABLE_TRAILTEXTURE)
{
float2 l9_895=float2(N2_uv.x,1.0-N2_uv.y);
float4 l9_896=float4(0.0);
int l9_897=0;
if ((int(trailTexHasSwappedViews_tmp)!=0))
{
int l9_898=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_898=0;
}
else
{
l9_898=in.varStereoViewID;
}
int l9_899=l9_898;
l9_897=1-l9_899;
}
else
{
int l9_900=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_900=0;
}
else
{
l9_900=in.varStereoViewID;
}
int l9_901=l9_900;
l9_897=l9_901;
}
int l9_902=l9_897;
int l9_903=trailTexLayout_tmp;
int l9_904=l9_902;
float2 l9_905=l9_895;
bool l9_906=(int(SC_USE_UV_TRANSFORM_trailTex_tmp)!=0);
float3x3 l9_907=(*sc_set0.UserUniforms).trailTexTransform;
int2 l9_908=int2(SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp);
bool l9_909=(int(SC_USE_UV_MIN_MAX_trailTex_tmp)!=0);
float4 l9_910=(*sc_set0.UserUniforms).trailTexUvMinMax;
bool l9_911=(int(SC_USE_CLAMP_TO_BORDER_trailTex_tmp)!=0);
float4 l9_912=(*sc_set0.UserUniforms).trailTexBorderColor;
float l9_913=0.0;
bool l9_914=l9_911&&(!l9_909);
float l9_915=1.0;
float l9_916=l9_905.x;
int l9_917=l9_908.x;
if (l9_917==1)
{
l9_916=fract(l9_916);
}
else
{
if (l9_917==2)
{
float l9_918=fract(l9_916);
float l9_919=l9_916-l9_918;
float l9_920=step(0.25,fract(l9_919*0.5));
l9_916=mix(l9_918,1.0-l9_918,fast::clamp(l9_920,0.0,1.0));
}
}
l9_905.x=l9_916;
float l9_921=l9_905.y;
int l9_922=l9_908.y;
if (l9_922==1)
{
l9_921=fract(l9_921);
}
else
{
if (l9_922==2)
{
float l9_923=fract(l9_921);
float l9_924=l9_921-l9_923;
float l9_925=step(0.25,fract(l9_924*0.5));
l9_921=mix(l9_923,1.0-l9_923,fast::clamp(l9_925,0.0,1.0));
}
}
l9_905.y=l9_921;
if (l9_909)
{
bool l9_926=l9_911;
bool l9_927;
if (l9_926)
{
l9_927=l9_908.x==3;
}
else
{
l9_927=l9_926;
}
float l9_928=l9_905.x;
float l9_929=l9_910.x;
float l9_930=l9_910.z;
bool l9_931=l9_927;
float l9_932=l9_915;
float l9_933=fast::clamp(l9_928,l9_929,l9_930);
float l9_934=step(abs(l9_928-l9_933),9.9999997e-06);
l9_932*=(l9_934+((1.0-float(l9_931))*(1.0-l9_934)));
l9_928=l9_933;
l9_905.x=l9_928;
l9_915=l9_932;
bool l9_935=l9_911;
bool l9_936;
if (l9_935)
{
l9_936=l9_908.y==3;
}
else
{
l9_936=l9_935;
}
float l9_937=l9_905.y;
float l9_938=l9_910.y;
float l9_939=l9_910.w;
bool l9_940=l9_936;
float l9_941=l9_915;
float l9_942=fast::clamp(l9_937,l9_938,l9_939);
float l9_943=step(abs(l9_937-l9_942),9.9999997e-06);
l9_941*=(l9_943+((1.0-float(l9_940))*(1.0-l9_943)));
l9_937=l9_942;
l9_905.y=l9_937;
l9_915=l9_941;
}
float2 l9_944=l9_905;
bool l9_945=l9_906;
float3x3 l9_946=l9_907;
if (l9_945)
{
l9_944=float2((l9_946*float3(l9_944,1.0)).xy);
}
float2 l9_947=l9_944;
float2 l9_948=l9_947;
float2 l9_949=l9_948;
l9_905=l9_949;
float l9_950=l9_905.x;
int l9_951=l9_908.x;
bool l9_952=l9_914;
float l9_953=l9_915;
if ((l9_951==0)||(l9_951==3))
{
float l9_954=l9_950;
float l9_955=0.0;
float l9_956=1.0;
bool l9_957=l9_952;
float l9_958=l9_953;
float l9_959=fast::clamp(l9_954,l9_955,l9_956);
float l9_960=step(abs(l9_954-l9_959),9.9999997e-06);
l9_958*=(l9_960+((1.0-float(l9_957))*(1.0-l9_960)));
l9_954=l9_959;
l9_950=l9_954;
l9_953=l9_958;
}
l9_905.x=l9_950;
l9_915=l9_953;
float l9_961=l9_905.y;
int l9_962=l9_908.y;
bool l9_963=l9_914;
float l9_964=l9_915;
if ((l9_962==0)||(l9_962==3))
{
float l9_965=l9_961;
float l9_966=0.0;
float l9_967=1.0;
bool l9_968=l9_963;
float l9_969=l9_964;
float l9_970=fast::clamp(l9_965,l9_966,l9_967);
float l9_971=step(abs(l9_965-l9_970),9.9999997e-06);
l9_969*=(l9_971+((1.0-float(l9_968))*(1.0-l9_971)));
l9_965=l9_970;
l9_961=l9_965;
l9_964=l9_969;
}
l9_905.y=l9_961;
l9_915=l9_964;
float2 l9_972=l9_905;
int l9_973=l9_903;
int l9_974=l9_904;
float l9_975=l9_913;
float2 l9_976=l9_972;
int l9_977=l9_973;
int l9_978=l9_974;
float3 l9_979=float3(0.0);
if (l9_977==0)
{
l9_979=float3(l9_976,0.0);
}
else
{
if (l9_977==1)
{
l9_979=float3(l9_976.x,(l9_976.y*0.5)+(0.5-(float(l9_978)*0.5)),0.0);
}
else
{
l9_979=float3(l9_976,float(l9_978));
}
}
float3 l9_980=l9_979;
float3 l9_981=l9_980;
float2 l9_982=l9_981.xy;
float l9_983=l9_975;
float4 l9_984=sc_set0.trailTex.sample(sc_set0.trailTexSmpSC,l9_982,bias(l9_983));
float4 l9_985=l9_984;
float4 l9_986=l9_985;
if (l9_911)
{
l9_986=mix(l9_912,l9_986,float4(l9_915));
}
float4 l9_987=l9_986;
l9_896=l9_987;
float4 l9_988=l9_896;
l9_887=l9_988;
}
float l9_989=fast::max(1e-06,N2_fadeInOut.x);
float l9_990=N2_timeValuesIn.w;
l9_886*=mix(0.0,1.0,fast::clamp(l9_990,0.0,l9_989)/l9_989);
l9_989=fast::max(1e-06,N2_fadeInOut.y);
l9_886*=mix(0.0,1.0,fast::clamp(1.0-l9_990,0.0,l9_989)/l9_989);
if (!N2_ENABLE_INDEPENDENTTRAIL)
{
l9_878=N2_trailHeadTime.y;
l9_989=fast::max(1e-06,N2_fadeInOut.z);
l9_886*=mix(0.0,1.0,fast::clamp(l9_878,0.0,l9_989)/l9_989);
l9_989=fast::max(1e-06,N2_fadeInOut.w);
l9_886*=mix(0.0,1.0,fast::clamp(1.0-l9_878,0.0,l9_989)/l9_989);
}
if (N2_ENABLE_TRAILCOLORRAMP)
{
float2 l9_991=float2(0.0);
l9_991=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_992=l9_991;
float2 l9_993=float2(0.0);
l9_993=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_994=l9_993;
float l9_995=ceil(l9_878*l9_992.x)/l9_994.x;
float2 l9_996=float2(l9_995,0.5);
float4 l9_997=float4(0.0);
int l9_998=0;
if ((int(trailColorRampTexHasSwappedViews_tmp)!=0))
{
int l9_999=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_999=0;
}
else
{
l9_999=in.varStereoViewID;
}
int l9_1000=l9_999;
l9_998=1-l9_1000;
}
else
{
int l9_1001=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1001=0;
}
else
{
l9_1001=in.varStereoViewID;
}
int l9_1002=l9_1001;
l9_998=l9_1002;
}
int l9_1003=l9_998;
int l9_1004=trailColorRampTexLayout_tmp;
int l9_1005=l9_1003;
float2 l9_1006=l9_996;
bool l9_1007=(int(SC_USE_UV_TRANSFORM_trailColorRampTex_tmp)!=0);
float3x3 l9_1008=(*sc_set0.UserUniforms).trailColorRampTexTransform;
int2 l9_1009=int2(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp);
bool l9_1010=(int(SC_USE_UV_MIN_MAX_trailColorRampTex_tmp)!=0);
float4 l9_1011=(*sc_set0.UserUniforms).trailColorRampTexUvMinMax;
bool l9_1012=(int(SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp)!=0);
float4 l9_1013=(*sc_set0.UserUniforms).trailColorRampTexBorderColor;
float l9_1014=0.0;
bool l9_1015=l9_1012&&(!l9_1010);
float l9_1016=1.0;
float l9_1017=l9_1006.x;
int l9_1018=l9_1009.x;
if (l9_1018==1)
{
l9_1017=fract(l9_1017);
}
else
{
if (l9_1018==2)
{
float l9_1019=fract(l9_1017);
float l9_1020=l9_1017-l9_1019;
float l9_1021=step(0.25,fract(l9_1020*0.5));
l9_1017=mix(l9_1019,1.0-l9_1019,fast::clamp(l9_1021,0.0,1.0));
}
}
l9_1006.x=l9_1017;
float l9_1022=l9_1006.y;
int l9_1023=l9_1009.y;
if (l9_1023==1)
{
l9_1022=fract(l9_1022);
}
else
{
if (l9_1023==2)
{
float l9_1024=fract(l9_1022);
float l9_1025=l9_1022-l9_1024;
float l9_1026=step(0.25,fract(l9_1025*0.5));
l9_1022=mix(l9_1024,1.0-l9_1024,fast::clamp(l9_1026,0.0,1.0));
}
}
l9_1006.y=l9_1022;
if (l9_1010)
{
bool l9_1027=l9_1012;
bool l9_1028;
if (l9_1027)
{
l9_1028=l9_1009.x==3;
}
else
{
l9_1028=l9_1027;
}
float l9_1029=l9_1006.x;
float l9_1030=l9_1011.x;
float l9_1031=l9_1011.z;
bool l9_1032=l9_1028;
float l9_1033=l9_1016;
float l9_1034=fast::clamp(l9_1029,l9_1030,l9_1031);
float l9_1035=step(abs(l9_1029-l9_1034),9.9999997e-06);
l9_1033*=(l9_1035+((1.0-float(l9_1032))*(1.0-l9_1035)));
l9_1029=l9_1034;
l9_1006.x=l9_1029;
l9_1016=l9_1033;
bool l9_1036=l9_1012;
bool l9_1037;
if (l9_1036)
{
l9_1037=l9_1009.y==3;
}
else
{
l9_1037=l9_1036;
}
float l9_1038=l9_1006.y;
float l9_1039=l9_1011.y;
float l9_1040=l9_1011.w;
bool l9_1041=l9_1037;
float l9_1042=l9_1016;
float l9_1043=fast::clamp(l9_1038,l9_1039,l9_1040);
float l9_1044=step(abs(l9_1038-l9_1043),9.9999997e-06);
l9_1042*=(l9_1044+((1.0-float(l9_1041))*(1.0-l9_1044)));
l9_1038=l9_1043;
l9_1006.y=l9_1038;
l9_1016=l9_1042;
}
float2 l9_1045=l9_1006;
bool l9_1046=l9_1007;
float3x3 l9_1047=l9_1008;
if (l9_1046)
{
l9_1045=float2((l9_1047*float3(l9_1045,1.0)).xy);
}
float2 l9_1048=l9_1045;
float2 l9_1049=l9_1048;
float2 l9_1050=l9_1049;
l9_1006=l9_1050;
float l9_1051=l9_1006.x;
int l9_1052=l9_1009.x;
bool l9_1053=l9_1015;
float l9_1054=l9_1016;
if ((l9_1052==0)||(l9_1052==3))
{
float l9_1055=l9_1051;
float l9_1056=0.0;
float l9_1057=1.0;
bool l9_1058=l9_1053;
float l9_1059=l9_1054;
float l9_1060=fast::clamp(l9_1055,l9_1056,l9_1057);
float l9_1061=step(abs(l9_1055-l9_1060),9.9999997e-06);
l9_1059*=(l9_1061+((1.0-float(l9_1058))*(1.0-l9_1061)));
l9_1055=l9_1060;
l9_1051=l9_1055;
l9_1054=l9_1059;
}
l9_1006.x=l9_1051;
l9_1016=l9_1054;
float l9_1062=l9_1006.y;
int l9_1063=l9_1009.y;
bool l9_1064=l9_1015;
float l9_1065=l9_1016;
if ((l9_1063==0)||(l9_1063==3))
{
float l9_1066=l9_1062;
float l9_1067=0.0;
float l9_1068=1.0;
bool l9_1069=l9_1064;
float l9_1070=l9_1065;
float l9_1071=fast::clamp(l9_1066,l9_1067,l9_1068);
float l9_1072=step(abs(l9_1066-l9_1071),9.9999997e-06);
l9_1070*=(l9_1072+((1.0-float(l9_1069))*(1.0-l9_1072)));
l9_1066=l9_1071;
l9_1062=l9_1066;
l9_1065=l9_1070;
}
l9_1006.y=l9_1062;
l9_1016=l9_1065;
float2 l9_1073=l9_1006;
int l9_1074=l9_1004;
int l9_1075=l9_1005;
float l9_1076=l9_1014;
float2 l9_1077=l9_1073;
int l9_1078=l9_1074;
int l9_1079=l9_1075;
float3 l9_1080=float3(0.0);
if (l9_1078==0)
{
l9_1080=float3(l9_1077,0.0);
}
else
{
if (l9_1078==1)
{
l9_1080=float3(l9_1077.x,(l9_1077.y*0.5)+(0.5-(float(l9_1079)*0.5)),0.0);
}
else
{
l9_1080=float3(l9_1077,float(l9_1079));
}
}
float3 l9_1081=l9_1080;
float3 l9_1082=l9_1081;
float2 l9_1083=l9_1082.xy;
float l9_1084=l9_1076;
float4 l9_1085=sc_set0.trailColorRampTex.sample(sc_set0.trailColorRampTexSmpSC,l9_1083,bias(l9_1084));
float4 l9_1086=l9_1085;
float4 l9_1087=l9_1086;
if (l9_1012)
{
l9_1087=mix(l9_1013,l9_1087,float4(l9_1016));
}
float4 l9_1088=l9_1087;
l9_997=l9_1088;
float4 l9_1089=l9_997;
l9_887*=l9_1089;
}
}
}
float4 l9_1090=float4(0.0);
float3 l9_1091=float3(0.0);
float3 l9_1092=float3(0.0);
float l9_1093=0.0;
float l9_1094=0.0;
if (N2_ENABLE_COLORMINMAX)
{
l9_1091=mix(N2_colorMinStart,N2_colorMaxStart,l9_882);
l9_1092=mix(N2_colorMinEnd,N2_colorMaxEnd,l9_882);
}
else
{
l9_1091=N2_colorStart;
l9_1092=N2_colorEnd;
}
if (N2_ENABLE_ALPHAMINMAX)
{
l9_1093=mix(N2_alphaMinStart,N2_alphaMaxStart,l9_883);
l9_1094=mix(N2_alphaMinEnd,N2_alphaMaxEnd,l9_883);
}
else
{
l9_1093=N2_alphaStart;
l9_1094=N2_alphaEnd;
}
l9_1091=mix(l9_1091,l9_1092,float3(l9_878));
l9_1093=mix(l9_1093,l9_1094,l9_878);
l9_1090=float4(l9_1091,l9_1093);
float4 l9_1095=float4(0.0);
float2 l9_1096=float2(0.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
float2 l9_1097=tempGlobals.Surface_UVCoord0;
l9_1096=l9_1097;
float2 l9_1098=l9_1096;
float l9_1099=fast::max(N2_timeValuesIn.x,1e-06);
float l9_1100=fast::max(N2_timeValuesIn.y,1e-06);
float l9_1101=N2_timeValuesIn.z;
if (N2_ENABLE_FLIPBOOKBYLIFE)
{
float l9_1102=mix(l9_1099,l9_1100,l9_885);
l9_1101/=l9_1102;
}
float l9_1103=floor((N2_flipBookRandomStart+1.0)*l9_884);
float2 l9_1104=l9_1096;
float2 l9_1105=N2_gridSize;
float l9_1106=N2_numValidFrames;
float l9_1107=l9_1103;
float l9_1108=N2_flipBookSpeedMult;
float l9_1109=l9_1101;
float l9_1110=floor(l9_1105.x);
float l9_1111=floor(l9_1105.y);
float l9_1112=1.0/l9_1110;
float l9_1113=1.0/l9_1111;
float l9_1114=fast::min(l9_1110*l9_1111,floor(l9_1106));
float l9_1115=floor(mod((l9_1109*l9_1108)+floor(l9_1107),l9_1114));
float l9_1116=floor(l9_1115/l9_1110);
float l9_1117=mod(l9_1115,l9_1110);
float2 l9_1118=float2((l9_1112*l9_1104.x)+(l9_1117*l9_1112),((1.0-l9_1113)-(l9_1116*l9_1113))+(l9_1113*l9_1104.y));
l9_1096=l9_1118;
float2 l9_1119=l9_1096;
float4 l9_1120=float4(0.0);
int l9_1121=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_1122=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1122=0;
}
else
{
l9_1122=in.varStereoViewID;
}
int l9_1123=l9_1122;
l9_1121=1-l9_1123;
}
else
{
int l9_1124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1124=0;
}
else
{
l9_1124=in.varStereoViewID;
}
int l9_1125=l9_1124;
l9_1121=l9_1125;
}
int l9_1126=l9_1121;
int l9_1127=mainTextureLayout_tmp;
int l9_1128=l9_1126;
float2 l9_1129=l9_1119;
bool l9_1130=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_1131=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_1132=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_1133=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_1134=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_1135=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_1136=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_1137=0.0;
bool l9_1138=l9_1135&&(!l9_1133);
float l9_1139=1.0;
float l9_1140=l9_1129.x;
int l9_1141=l9_1132.x;
if (l9_1141==1)
{
l9_1140=fract(l9_1140);
}
else
{
if (l9_1141==2)
{
float l9_1142=fract(l9_1140);
float l9_1143=l9_1140-l9_1142;
float l9_1144=step(0.25,fract(l9_1143*0.5));
l9_1140=mix(l9_1142,1.0-l9_1142,fast::clamp(l9_1144,0.0,1.0));
}
}
l9_1129.x=l9_1140;
float l9_1145=l9_1129.y;
int l9_1146=l9_1132.y;
if (l9_1146==1)
{
l9_1145=fract(l9_1145);
}
else
{
if (l9_1146==2)
{
float l9_1147=fract(l9_1145);
float l9_1148=l9_1145-l9_1147;
float l9_1149=step(0.25,fract(l9_1148*0.5));
l9_1145=mix(l9_1147,1.0-l9_1147,fast::clamp(l9_1149,0.0,1.0));
}
}
l9_1129.y=l9_1145;
if (l9_1133)
{
bool l9_1150=l9_1135;
bool l9_1151;
if (l9_1150)
{
l9_1151=l9_1132.x==3;
}
else
{
l9_1151=l9_1150;
}
float l9_1152=l9_1129.x;
float l9_1153=l9_1134.x;
float l9_1154=l9_1134.z;
bool l9_1155=l9_1151;
float l9_1156=l9_1139;
float l9_1157=fast::clamp(l9_1152,l9_1153,l9_1154);
float l9_1158=step(abs(l9_1152-l9_1157),9.9999997e-06);
l9_1156*=(l9_1158+((1.0-float(l9_1155))*(1.0-l9_1158)));
l9_1152=l9_1157;
l9_1129.x=l9_1152;
l9_1139=l9_1156;
bool l9_1159=l9_1135;
bool l9_1160;
if (l9_1159)
{
l9_1160=l9_1132.y==3;
}
else
{
l9_1160=l9_1159;
}
float l9_1161=l9_1129.y;
float l9_1162=l9_1134.y;
float l9_1163=l9_1134.w;
bool l9_1164=l9_1160;
float l9_1165=l9_1139;
float l9_1166=fast::clamp(l9_1161,l9_1162,l9_1163);
float l9_1167=step(abs(l9_1161-l9_1166),9.9999997e-06);
l9_1165*=(l9_1167+((1.0-float(l9_1164))*(1.0-l9_1167)));
l9_1161=l9_1166;
l9_1129.y=l9_1161;
l9_1139=l9_1165;
}
float2 l9_1168=l9_1129;
bool l9_1169=l9_1130;
float3x3 l9_1170=l9_1131;
if (l9_1169)
{
l9_1168=float2((l9_1170*float3(l9_1168,1.0)).xy);
}
float2 l9_1171=l9_1168;
float2 l9_1172=l9_1171;
float2 l9_1173=l9_1172;
l9_1129=l9_1173;
float l9_1174=l9_1129.x;
int l9_1175=l9_1132.x;
bool l9_1176=l9_1138;
float l9_1177=l9_1139;
if ((l9_1175==0)||(l9_1175==3))
{
float l9_1178=l9_1174;
float l9_1179=0.0;
float l9_1180=1.0;
bool l9_1181=l9_1176;
float l9_1182=l9_1177;
float l9_1183=fast::clamp(l9_1178,l9_1179,l9_1180);
float l9_1184=step(abs(l9_1178-l9_1183),9.9999997e-06);
l9_1182*=(l9_1184+((1.0-float(l9_1181))*(1.0-l9_1184)));
l9_1178=l9_1183;
l9_1174=l9_1178;
l9_1177=l9_1182;
}
l9_1129.x=l9_1174;
l9_1139=l9_1177;
float l9_1185=l9_1129.y;
int l9_1186=l9_1132.y;
bool l9_1187=l9_1138;
float l9_1188=l9_1139;
if ((l9_1186==0)||(l9_1186==3))
{
float l9_1189=l9_1185;
float l9_1190=0.0;
float l9_1191=1.0;
bool l9_1192=l9_1187;
float l9_1193=l9_1188;
float l9_1194=fast::clamp(l9_1189,l9_1190,l9_1191);
float l9_1195=step(abs(l9_1189-l9_1194),9.9999997e-06);
l9_1193*=(l9_1195+((1.0-float(l9_1192))*(1.0-l9_1195)));
l9_1189=l9_1194;
l9_1185=l9_1189;
l9_1188=l9_1193;
}
l9_1129.y=l9_1185;
l9_1139=l9_1188;
float2 l9_1196=l9_1129;
int l9_1197=l9_1127;
int l9_1198=l9_1128;
float l9_1199=l9_1137;
float2 l9_1200=l9_1196;
int l9_1201=l9_1197;
int l9_1202=l9_1198;
float3 l9_1203=float3(0.0);
if (l9_1201==0)
{
l9_1203=float3(l9_1200,0.0);
}
else
{
if (l9_1201==1)
{
l9_1203=float3(l9_1200.x,(l9_1200.y*0.5)+(0.5-(float(l9_1202)*0.5)),0.0);
}
else
{
l9_1203=float3(l9_1200,float(l9_1202));
}
}
float3 l9_1204=l9_1203;
float3 l9_1205=l9_1204;
float2 l9_1206=l9_1205.xy;
float l9_1207=l9_1199;
float4 l9_1208=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_1206,bias(l9_1207));
float4 l9_1209=l9_1208;
float4 l9_1210=l9_1209;
if (l9_1135)
{
l9_1210=mix(l9_1136,l9_1210,float4(l9_1139));
}
float4 l9_1211=l9_1210;
l9_1120=l9_1211;
float4 l9_1212=l9_1120;
l9_1095=l9_1212;
if (N2_ENABLE_FLIPBOOKBLEND)
{
float2 l9_1213=l9_1098;
float2 l9_1214=N2_gridSize;
float l9_1215=N2_numValidFrames;
float l9_1216=floor(mod(l9_1103+1.0,N2_numValidFrames));
float l9_1217=N2_flipBookSpeedMult;
float l9_1218=l9_1101;
float l9_1219=floor(l9_1214.x);
float l9_1220=floor(l9_1214.y);
float l9_1221=1.0/l9_1219;
float l9_1222=1.0/l9_1220;
float l9_1223=fast::min(l9_1219*l9_1220,floor(l9_1215));
float l9_1224=floor(mod((l9_1218*l9_1217)+floor(l9_1216),l9_1223));
float l9_1225=floor(l9_1224/l9_1219);
float l9_1226=mod(l9_1224,l9_1219);
float2 l9_1227=float2((l9_1221*l9_1213.x)+(l9_1226*l9_1221),((1.0-l9_1222)-(l9_1225*l9_1222))+(l9_1222*l9_1213.y));
l9_1098=l9_1227;
float4 l9_1228=l9_1095;
float2 l9_1229=l9_1098;
float4 l9_1230=float4(0.0);
int l9_1231=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_1232=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1232=0;
}
else
{
l9_1232=in.varStereoViewID;
}
int l9_1233=l9_1232;
l9_1231=1-l9_1233;
}
else
{
int l9_1234=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1234=0;
}
else
{
l9_1234=in.varStereoViewID;
}
int l9_1235=l9_1234;
l9_1231=l9_1235;
}
int l9_1236=l9_1231;
int l9_1237=mainTextureLayout_tmp;
int l9_1238=l9_1236;
float2 l9_1239=l9_1229;
bool l9_1240=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_1241=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_1242=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_1243=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_1244=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_1245=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_1246=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_1247=0.0;
bool l9_1248=l9_1245&&(!l9_1243);
float l9_1249=1.0;
float l9_1250=l9_1239.x;
int l9_1251=l9_1242.x;
if (l9_1251==1)
{
l9_1250=fract(l9_1250);
}
else
{
if (l9_1251==2)
{
float l9_1252=fract(l9_1250);
float l9_1253=l9_1250-l9_1252;
float l9_1254=step(0.25,fract(l9_1253*0.5));
l9_1250=mix(l9_1252,1.0-l9_1252,fast::clamp(l9_1254,0.0,1.0));
}
}
l9_1239.x=l9_1250;
float l9_1255=l9_1239.y;
int l9_1256=l9_1242.y;
if (l9_1256==1)
{
l9_1255=fract(l9_1255);
}
else
{
if (l9_1256==2)
{
float l9_1257=fract(l9_1255);
float l9_1258=l9_1255-l9_1257;
float l9_1259=step(0.25,fract(l9_1258*0.5));
l9_1255=mix(l9_1257,1.0-l9_1257,fast::clamp(l9_1259,0.0,1.0));
}
}
l9_1239.y=l9_1255;
if (l9_1243)
{
bool l9_1260=l9_1245;
bool l9_1261;
if (l9_1260)
{
l9_1261=l9_1242.x==3;
}
else
{
l9_1261=l9_1260;
}
float l9_1262=l9_1239.x;
float l9_1263=l9_1244.x;
float l9_1264=l9_1244.z;
bool l9_1265=l9_1261;
float l9_1266=l9_1249;
float l9_1267=fast::clamp(l9_1262,l9_1263,l9_1264);
float l9_1268=step(abs(l9_1262-l9_1267),9.9999997e-06);
l9_1266*=(l9_1268+((1.0-float(l9_1265))*(1.0-l9_1268)));
l9_1262=l9_1267;
l9_1239.x=l9_1262;
l9_1249=l9_1266;
bool l9_1269=l9_1245;
bool l9_1270;
if (l9_1269)
{
l9_1270=l9_1242.y==3;
}
else
{
l9_1270=l9_1269;
}
float l9_1271=l9_1239.y;
float l9_1272=l9_1244.y;
float l9_1273=l9_1244.w;
bool l9_1274=l9_1270;
float l9_1275=l9_1249;
float l9_1276=fast::clamp(l9_1271,l9_1272,l9_1273);
float l9_1277=step(abs(l9_1271-l9_1276),9.9999997e-06);
l9_1275*=(l9_1277+((1.0-float(l9_1274))*(1.0-l9_1277)));
l9_1271=l9_1276;
l9_1239.y=l9_1271;
l9_1249=l9_1275;
}
float2 l9_1278=l9_1239;
bool l9_1279=l9_1240;
float3x3 l9_1280=l9_1241;
if (l9_1279)
{
l9_1278=float2((l9_1280*float3(l9_1278,1.0)).xy);
}
float2 l9_1281=l9_1278;
float2 l9_1282=l9_1281;
float2 l9_1283=l9_1282;
l9_1239=l9_1283;
float l9_1284=l9_1239.x;
int l9_1285=l9_1242.x;
bool l9_1286=l9_1248;
float l9_1287=l9_1249;
if ((l9_1285==0)||(l9_1285==3))
{
float l9_1288=l9_1284;
float l9_1289=0.0;
float l9_1290=1.0;
bool l9_1291=l9_1286;
float l9_1292=l9_1287;
float l9_1293=fast::clamp(l9_1288,l9_1289,l9_1290);
float l9_1294=step(abs(l9_1288-l9_1293),9.9999997e-06);
l9_1292*=(l9_1294+((1.0-float(l9_1291))*(1.0-l9_1294)));
l9_1288=l9_1293;
l9_1284=l9_1288;
l9_1287=l9_1292;
}
l9_1239.x=l9_1284;
l9_1249=l9_1287;
float l9_1295=l9_1239.y;
int l9_1296=l9_1242.y;
bool l9_1297=l9_1248;
float l9_1298=l9_1249;
if ((l9_1296==0)||(l9_1296==3))
{
float l9_1299=l9_1295;
float l9_1300=0.0;
float l9_1301=1.0;
bool l9_1302=l9_1297;
float l9_1303=l9_1298;
float l9_1304=fast::clamp(l9_1299,l9_1300,l9_1301);
float l9_1305=step(abs(l9_1299-l9_1304),9.9999997e-06);
l9_1303*=(l9_1305+((1.0-float(l9_1302))*(1.0-l9_1305)));
l9_1299=l9_1304;
l9_1295=l9_1299;
l9_1298=l9_1303;
}
l9_1239.y=l9_1295;
l9_1249=l9_1298;
float2 l9_1306=l9_1239;
int l9_1307=l9_1237;
int l9_1308=l9_1238;
float l9_1309=l9_1247;
float2 l9_1310=l9_1306;
int l9_1311=l9_1307;
int l9_1312=l9_1308;
float3 l9_1313=float3(0.0);
if (l9_1311==0)
{
l9_1313=float3(l9_1310,0.0);
}
else
{
if (l9_1311==1)
{
l9_1313=float3(l9_1310.x,(l9_1310.y*0.5)+(0.5-(float(l9_1312)*0.5)),0.0);
}
else
{
l9_1313=float3(l9_1310,float(l9_1312));
}
}
float3 l9_1314=l9_1313;
float3 l9_1315=l9_1314;
float2 l9_1316=l9_1315.xy;
float l9_1317=l9_1309;
float4 l9_1318=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_1316,bias(l9_1317));
float4 l9_1319=l9_1318;
float4 l9_1320=l9_1319;
if (l9_1245)
{
l9_1320=mix(l9_1246,l9_1320,float4(l9_1249));
}
float4 l9_1321=l9_1320;
l9_1230=l9_1321;
float4 l9_1322=l9_1230;
l9_1095=mix(l9_1228,l9_1322,float4(fract((l9_1101*N2_flipBookSpeedMult)+l9_1103)));
}
}
}
float4 l9_1323=float4(1.0);
if (N2_ENABLE_COLORRAMP)
{
float l9_1324=ceil(l9_878*N2_texSize.x)/N2_texSize.x;
float l9_1325=l9_1324;
if (N2_ENABLE_NORANDOFFSET)
{
float2 l9_1326=tempGlobals.Surface_UVCoord0;
l9_1325+=(l9_1326.x/N2_texSize.x);
}
float2 l9_1327=float2(l9_1325,0.5);
float4 l9_1328=float4(0.0);
int l9_1329=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_1330=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1330=0;
}
else
{
l9_1330=in.varStereoViewID;
}
int l9_1331=l9_1330;
l9_1329=1-l9_1331;
}
else
{
int l9_1332=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1332=0;
}
else
{
l9_1332=in.varStereoViewID;
}
int l9_1333=l9_1332;
l9_1329=l9_1333;
}
int l9_1334=l9_1329;
int l9_1335=colorRampTextureLayout_tmp;
int l9_1336=l9_1334;
float2 l9_1337=l9_1327;
bool l9_1338=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_1339=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_1340=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_1341=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_1342=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_1343=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_1344=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_1345=0.0;
bool l9_1346=l9_1343&&(!l9_1341);
float l9_1347=1.0;
float l9_1348=l9_1337.x;
int l9_1349=l9_1340.x;
if (l9_1349==1)
{
l9_1348=fract(l9_1348);
}
else
{
if (l9_1349==2)
{
float l9_1350=fract(l9_1348);
float l9_1351=l9_1348-l9_1350;
float l9_1352=step(0.25,fract(l9_1351*0.5));
l9_1348=mix(l9_1350,1.0-l9_1350,fast::clamp(l9_1352,0.0,1.0));
}
}
l9_1337.x=l9_1348;
float l9_1353=l9_1337.y;
int l9_1354=l9_1340.y;
if (l9_1354==1)
{
l9_1353=fract(l9_1353);
}
else
{
if (l9_1354==2)
{
float l9_1355=fract(l9_1353);
float l9_1356=l9_1353-l9_1355;
float l9_1357=step(0.25,fract(l9_1356*0.5));
l9_1353=mix(l9_1355,1.0-l9_1355,fast::clamp(l9_1357,0.0,1.0));
}
}
l9_1337.y=l9_1353;
if (l9_1341)
{
bool l9_1358=l9_1343;
bool l9_1359;
if (l9_1358)
{
l9_1359=l9_1340.x==3;
}
else
{
l9_1359=l9_1358;
}
float l9_1360=l9_1337.x;
float l9_1361=l9_1342.x;
float l9_1362=l9_1342.z;
bool l9_1363=l9_1359;
float l9_1364=l9_1347;
float l9_1365=fast::clamp(l9_1360,l9_1361,l9_1362);
float l9_1366=step(abs(l9_1360-l9_1365),9.9999997e-06);
l9_1364*=(l9_1366+((1.0-float(l9_1363))*(1.0-l9_1366)));
l9_1360=l9_1365;
l9_1337.x=l9_1360;
l9_1347=l9_1364;
bool l9_1367=l9_1343;
bool l9_1368;
if (l9_1367)
{
l9_1368=l9_1340.y==3;
}
else
{
l9_1368=l9_1367;
}
float l9_1369=l9_1337.y;
float l9_1370=l9_1342.y;
float l9_1371=l9_1342.w;
bool l9_1372=l9_1368;
float l9_1373=l9_1347;
float l9_1374=fast::clamp(l9_1369,l9_1370,l9_1371);
float l9_1375=step(abs(l9_1369-l9_1374),9.9999997e-06);
l9_1373*=(l9_1375+((1.0-float(l9_1372))*(1.0-l9_1375)));
l9_1369=l9_1374;
l9_1337.y=l9_1369;
l9_1347=l9_1373;
}
float2 l9_1376=l9_1337;
bool l9_1377=l9_1338;
float3x3 l9_1378=l9_1339;
if (l9_1377)
{
l9_1376=float2((l9_1378*float3(l9_1376,1.0)).xy);
}
float2 l9_1379=l9_1376;
float2 l9_1380=l9_1379;
float2 l9_1381=l9_1380;
l9_1337=l9_1381;
float l9_1382=l9_1337.x;
int l9_1383=l9_1340.x;
bool l9_1384=l9_1346;
float l9_1385=l9_1347;
if ((l9_1383==0)||(l9_1383==3))
{
float l9_1386=l9_1382;
float l9_1387=0.0;
float l9_1388=1.0;
bool l9_1389=l9_1384;
float l9_1390=l9_1385;
float l9_1391=fast::clamp(l9_1386,l9_1387,l9_1388);
float l9_1392=step(abs(l9_1386-l9_1391),9.9999997e-06);
l9_1390*=(l9_1392+((1.0-float(l9_1389))*(1.0-l9_1392)));
l9_1386=l9_1391;
l9_1382=l9_1386;
l9_1385=l9_1390;
}
l9_1337.x=l9_1382;
l9_1347=l9_1385;
float l9_1393=l9_1337.y;
int l9_1394=l9_1340.y;
bool l9_1395=l9_1346;
float l9_1396=l9_1347;
if ((l9_1394==0)||(l9_1394==3))
{
float l9_1397=l9_1393;
float l9_1398=0.0;
float l9_1399=1.0;
bool l9_1400=l9_1395;
float l9_1401=l9_1396;
float l9_1402=fast::clamp(l9_1397,l9_1398,l9_1399);
float l9_1403=step(abs(l9_1397-l9_1402),9.9999997e-06);
l9_1401*=(l9_1403+((1.0-float(l9_1400))*(1.0-l9_1403)));
l9_1397=l9_1402;
l9_1393=l9_1397;
l9_1396=l9_1401;
}
l9_1337.y=l9_1393;
l9_1347=l9_1396;
float2 l9_1404=l9_1337;
int l9_1405=l9_1335;
int l9_1406=l9_1336;
float l9_1407=l9_1345;
float2 l9_1408=l9_1404;
int l9_1409=l9_1405;
int l9_1410=l9_1406;
float3 l9_1411=float3(0.0);
if (l9_1409==0)
{
l9_1411=float3(l9_1408,0.0);
}
else
{
if (l9_1409==1)
{
l9_1411=float3(l9_1408.x,(l9_1408.y*0.5)+(0.5-(float(l9_1410)*0.5)),0.0);
}
else
{
l9_1411=float3(l9_1408,float(l9_1410));
}
}
float3 l9_1412=l9_1411;
float3 l9_1413=l9_1412;
float2 l9_1414=l9_1413.xy;
float l9_1415=l9_1407;
float4 l9_1416=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_1414,bias(l9_1415));
float4 l9_1417=l9_1416;
float4 l9_1418=l9_1417;
if (l9_1343)
{
l9_1418=mix(l9_1344,l9_1418,float4(l9_1347));
}
float4 l9_1419=l9_1418;
l9_1328=l9_1419;
float4 l9_1420=l9_1328;
l9_1323=l9_1420*N2_colorRampMult;
}
float4 l9_1421=float4(1.0);
float4 l9_1422=float4(1.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
N2_uv=l9_1096;
l9_1421=l9_1095;
}
else
{
float2 l9_1423=N2_uv;
float4 l9_1424=float4(0.0);
int l9_1425=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_1426=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1426=0;
}
else
{
l9_1426=in.varStereoViewID;
}
int l9_1427=l9_1426;
l9_1425=1-l9_1427;
}
else
{
int l9_1428=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1428=0;
}
else
{
l9_1428=in.varStereoViewID;
}
int l9_1429=l9_1428;
l9_1425=l9_1429;
}
int l9_1430=l9_1425;
int l9_1431=mainTextureLayout_tmp;
int l9_1432=l9_1430;
float2 l9_1433=l9_1423;
bool l9_1434=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_1435=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_1436=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_1437=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_1438=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_1439=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_1440=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_1441=0.0;
bool l9_1442=l9_1439&&(!l9_1437);
float l9_1443=1.0;
float l9_1444=l9_1433.x;
int l9_1445=l9_1436.x;
if (l9_1445==1)
{
l9_1444=fract(l9_1444);
}
else
{
if (l9_1445==2)
{
float l9_1446=fract(l9_1444);
float l9_1447=l9_1444-l9_1446;
float l9_1448=step(0.25,fract(l9_1447*0.5));
l9_1444=mix(l9_1446,1.0-l9_1446,fast::clamp(l9_1448,0.0,1.0));
}
}
l9_1433.x=l9_1444;
float l9_1449=l9_1433.y;
int l9_1450=l9_1436.y;
if (l9_1450==1)
{
l9_1449=fract(l9_1449);
}
else
{
if (l9_1450==2)
{
float l9_1451=fract(l9_1449);
float l9_1452=l9_1449-l9_1451;
float l9_1453=step(0.25,fract(l9_1452*0.5));
l9_1449=mix(l9_1451,1.0-l9_1451,fast::clamp(l9_1453,0.0,1.0));
}
}
l9_1433.y=l9_1449;
if (l9_1437)
{
bool l9_1454=l9_1439;
bool l9_1455;
if (l9_1454)
{
l9_1455=l9_1436.x==3;
}
else
{
l9_1455=l9_1454;
}
float l9_1456=l9_1433.x;
float l9_1457=l9_1438.x;
float l9_1458=l9_1438.z;
bool l9_1459=l9_1455;
float l9_1460=l9_1443;
float l9_1461=fast::clamp(l9_1456,l9_1457,l9_1458);
float l9_1462=step(abs(l9_1456-l9_1461),9.9999997e-06);
l9_1460*=(l9_1462+((1.0-float(l9_1459))*(1.0-l9_1462)));
l9_1456=l9_1461;
l9_1433.x=l9_1456;
l9_1443=l9_1460;
bool l9_1463=l9_1439;
bool l9_1464;
if (l9_1463)
{
l9_1464=l9_1436.y==3;
}
else
{
l9_1464=l9_1463;
}
float l9_1465=l9_1433.y;
float l9_1466=l9_1438.y;
float l9_1467=l9_1438.w;
bool l9_1468=l9_1464;
float l9_1469=l9_1443;
float l9_1470=fast::clamp(l9_1465,l9_1466,l9_1467);
float l9_1471=step(abs(l9_1465-l9_1470),9.9999997e-06);
l9_1469*=(l9_1471+((1.0-float(l9_1468))*(1.0-l9_1471)));
l9_1465=l9_1470;
l9_1433.y=l9_1465;
l9_1443=l9_1469;
}
float2 l9_1472=l9_1433;
bool l9_1473=l9_1434;
float3x3 l9_1474=l9_1435;
if (l9_1473)
{
l9_1472=float2((l9_1474*float3(l9_1472,1.0)).xy);
}
float2 l9_1475=l9_1472;
float2 l9_1476=l9_1475;
float2 l9_1477=l9_1476;
l9_1433=l9_1477;
float l9_1478=l9_1433.x;
int l9_1479=l9_1436.x;
bool l9_1480=l9_1442;
float l9_1481=l9_1443;
if ((l9_1479==0)||(l9_1479==3))
{
float l9_1482=l9_1478;
float l9_1483=0.0;
float l9_1484=1.0;
bool l9_1485=l9_1480;
float l9_1486=l9_1481;
float l9_1487=fast::clamp(l9_1482,l9_1483,l9_1484);
float l9_1488=step(abs(l9_1482-l9_1487),9.9999997e-06);
l9_1486*=(l9_1488+((1.0-float(l9_1485))*(1.0-l9_1488)));
l9_1482=l9_1487;
l9_1478=l9_1482;
l9_1481=l9_1486;
}
l9_1433.x=l9_1478;
l9_1443=l9_1481;
float l9_1489=l9_1433.y;
int l9_1490=l9_1436.y;
bool l9_1491=l9_1442;
float l9_1492=l9_1443;
if ((l9_1490==0)||(l9_1490==3))
{
float l9_1493=l9_1489;
float l9_1494=0.0;
float l9_1495=1.0;
bool l9_1496=l9_1491;
float l9_1497=l9_1492;
float l9_1498=fast::clamp(l9_1493,l9_1494,l9_1495);
float l9_1499=step(abs(l9_1493-l9_1498),9.9999997e-06);
l9_1497*=(l9_1499+((1.0-float(l9_1496))*(1.0-l9_1499)));
l9_1493=l9_1498;
l9_1489=l9_1493;
l9_1492=l9_1497;
}
l9_1433.y=l9_1489;
l9_1443=l9_1492;
float2 l9_1500=l9_1433;
int l9_1501=l9_1431;
int l9_1502=l9_1432;
float l9_1503=l9_1441;
float2 l9_1504=l9_1500;
int l9_1505=l9_1501;
int l9_1506=l9_1502;
float3 l9_1507=float3(0.0);
if (l9_1505==0)
{
l9_1507=float3(l9_1504,0.0);
}
else
{
if (l9_1505==1)
{
l9_1507=float3(l9_1504.x,(l9_1504.y*0.5)+(0.5-(float(l9_1506)*0.5)),0.0);
}
else
{
l9_1507=float3(l9_1504,float(l9_1506));
}
}
float3 l9_1508=l9_1507;
float3 l9_1509=l9_1508;
float2 l9_1510=l9_1509.xy;
float l9_1511=l9_1503;
float4 l9_1512=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_1510,bias(l9_1511));
float4 l9_1513=l9_1512;
float4 l9_1514=l9_1513;
if (l9_1439)
{
l9_1514=mix(l9_1440,l9_1514,float4(l9_1443));
}
float4 l9_1515=l9_1514;
l9_1424=l9_1515;
float4 l9_1516=l9_1424;
l9_1421=l9_1516;
}
}
if (N2_ENABLE_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_1422=l9_1323;
}
}
N2_result=(l9_1421*l9_1090)*l9_1422;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrail>0.0)
{
N2_result=(l9_887*l9_1090)*l9_1422;
N2_result.w*=l9_886;
}
}
if (N2_ENABLE_SCREENFADE)
{
N2_result.w*=N2_cameraFade_trailHeadTime_taper.x;
}
if (N2_ENABLE_ALPHADISSOLVE)
{
float l9_1517=l9_878*N2_alphaDissolveMult;
N2_result.w=fast::clamp(N2_result.w-l9_1517,0.0,1.0);
}
if (N2_ENABLE_BLACKASALPHA)
{
float l9_1518=length(N2_result.xyz);
N2_result.w=l9_1518;
if (N2_ENABLE_TRAILS)
{
N2_result.w*=l9_886;
}
}
if (N2_ENABLE_PREMULTIPLIEDCOLOR)
{
float3 l9_1519=N2_result.xyz*N2_result.w;
N2_result=float4(l9_1519.x,l9_1519.y,l9_1519.z,N2_result.w);
}
l9_852=N2_uv;
l9_826=l9_852;
float4 l9_1520=float4(0.0);
float2 l9_1521=l9_826;
int l9_1522=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_1523=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1523=0;
}
else
{
l9_1523=in.varStereoViewID;
}
int l9_1524=l9_1523;
l9_1522=1-l9_1524;
}
else
{
int l9_1525=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1525=0;
}
else
{
l9_1525=in.varStereoViewID;
}
int l9_1526=l9_1525;
l9_1522=l9_1526;
}
int l9_1527=l9_1522;
int l9_1528=normalTexLayout_tmp;
int l9_1529=l9_1527;
float2 l9_1530=l9_1521;
bool l9_1531=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_1532=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_1533=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_1534=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_1535=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_1536=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_1537=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_1538=0.0;
bool l9_1539=l9_1536&&(!l9_1534);
float l9_1540=1.0;
float l9_1541=l9_1530.x;
int l9_1542=l9_1533.x;
if (l9_1542==1)
{
l9_1541=fract(l9_1541);
}
else
{
if (l9_1542==2)
{
float l9_1543=fract(l9_1541);
float l9_1544=l9_1541-l9_1543;
float l9_1545=step(0.25,fract(l9_1544*0.5));
l9_1541=mix(l9_1543,1.0-l9_1543,fast::clamp(l9_1545,0.0,1.0));
}
}
l9_1530.x=l9_1541;
float l9_1546=l9_1530.y;
int l9_1547=l9_1533.y;
if (l9_1547==1)
{
l9_1546=fract(l9_1546);
}
else
{
if (l9_1547==2)
{
float l9_1548=fract(l9_1546);
float l9_1549=l9_1546-l9_1548;
float l9_1550=step(0.25,fract(l9_1549*0.5));
l9_1546=mix(l9_1548,1.0-l9_1548,fast::clamp(l9_1550,0.0,1.0));
}
}
l9_1530.y=l9_1546;
if (l9_1534)
{
bool l9_1551=l9_1536;
bool l9_1552;
if (l9_1551)
{
l9_1552=l9_1533.x==3;
}
else
{
l9_1552=l9_1551;
}
float l9_1553=l9_1530.x;
float l9_1554=l9_1535.x;
float l9_1555=l9_1535.z;
bool l9_1556=l9_1552;
float l9_1557=l9_1540;
float l9_1558=fast::clamp(l9_1553,l9_1554,l9_1555);
float l9_1559=step(abs(l9_1553-l9_1558),9.9999997e-06);
l9_1557*=(l9_1559+((1.0-float(l9_1556))*(1.0-l9_1559)));
l9_1553=l9_1558;
l9_1530.x=l9_1553;
l9_1540=l9_1557;
bool l9_1560=l9_1536;
bool l9_1561;
if (l9_1560)
{
l9_1561=l9_1533.y==3;
}
else
{
l9_1561=l9_1560;
}
float l9_1562=l9_1530.y;
float l9_1563=l9_1535.y;
float l9_1564=l9_1535.w;
bool l9_1565=l9_1561;
float l9_1566=l9_1540;
float l9_1567=fast::clamp(l9_1562,l9_1563,l9_1564);
float l9_1568=step(abs(l9_1562-l9_1567),9.9999997e-06);
l9_1566*=(l9_1568+((1.0-float(l9_1565))*(1.0-l9_1568)));
l9_1562=l9_1567;
l9_1530.y=l9_1562;
l9_1540=l9_1566;
}
float2 l9_1569=l9_1530;
bool l9_1570=l9_1531;
float3x3 l9_1571=l9_1532;
if (l9_1570)
{
l9_1569=float2((l9_1571*float3(l9_1569,1.0)).xy);
}
float2 l9_1572=l9_1569;
float2 l9_1573=l9_1572;
float2 l9_1574=l9_1573;
l9_1530=l9_1574;
float l9_1575=l9_1530.x;
int l9_1576=l9_1533.x;
bool l9_1577=l9_1539;
float l9_1578=l9_1540;
if ((l9_1576==0)||(l9_1576==3))
{
float l9_1579=l9_1575;
float l9_1580=0.0;
float l9_1581=1.0;
bool l9_1582=l9_1577;
float l9_1583=l9_1578;
float l9_1584=fast::clamp(l9_1579,l9_1580,l9_1581);
float l9_1585=step(abs(l9_1579-l9_1584),9.9999997e-06);
l9_1583*=(l9_1585+((1.0-float(l9_1582))*(1.0-l9_1585)));
l9_1579=l9_1584;
l9_1575=l9_1579;
l9_1578=l9_1583;
}
l9_1530.x=l9_1575;
l9_1540=l9_1578;
float l9_1586=l9_1530.y;
int l9_1587=l9_1533.y;
bool l9_1588=l9_1539;
float l9_1589=l9_1540;
if ((l9_1587==0)||(l9_1587==3))
{
float l9_1590=l9_1586;
float l9_1591=0.0;
float l9_1592=1.0;
bool l9_1593=l9_1588;
float l9_1594=l9_1589;
float l9_1595=fast::clamp(l9_1590,l9_1591,l9_1592);
float l9_1596=step(abs(l9_1590-l9_1595),9.9999997e-06);
l9_1594*=(l9_1596+((1.0-float(l9_1593))*(1.0-l9_1596)));
l9_1590=l9_1595;
l9_1586=l9_1590;
l9_1589=l9_1594;
}
l9_1530.y=l9_1586;
l9_1540=l9_1589;
float2 l9_1597=l9_1530;
int l9_1598=l9_1528;
int l9_1599=l9_1529;
float l9_1600=l9_1538;
float2 l9_1601=l9_1597;
int l9_1602=l9_1598;
int l9_1603=l9_1599;
float3 l9_1604=float3(0.0);
if (l9_1602==0)
{
l9_1604=float3(l9_1601,0.0);
}
else
{
if (l9_1602==1)
{
l9_1604=float3(l9_1601.x,(l9_1601.y*0.5)+(0.5-(float(l9_1603)*0.5)),0.0);
}
else
{
l9_1604=float3(l9_1601,float(l9_1603));
}
}
float3 l9_1605=l9_1604;
float3 l9_1606=l9_1605;
float2 l9_1607=l9_1606.xy;
float l9_1608=l9_1600;
float4 l9_1609=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_1607,bias(l9_1608));
float4 l9_1610=l9_1609;
float4 l9_1611=l9_1610;
if (l9_1536)
{
l9_1611=mix(l9_1537,l9_1611,float4(l9_1540));
}
float4 l9_1612=l9_1611;
float4 l9_1613=l9_1612;
float3 l9_1614=(l9_1613.xyz*1.9921875)-float3(1.0);
l9_1613=float4(l9_1614.x,l9_1614.y,l9_1614.z,l9_1613.w);
l9_1520=l9_1613;
l9_761=l9_1520.xyz;
l9_764=l9_761;
}
else
{
l9_764=l9_762;
}
l9_760=l9_764;
float4 l9_1615=float4(0.0);
int l9_1616=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_1617=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1617=0;
}
else
{
l9_1617=in.varStereoViewID;
}
int l9_1618=l9_1617;
l9_1616=1-l9_1618;
}
else
{
int l9_1619=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1619=0;
}
else
{
l9_1619=in.varStereoViewID;
}
int l9_1620=l9_1619;
l9_1616=l9_1620;
}
int l9_1621=l9_1616;
int l9_1622=materialParamsTexLayout_tmp;
int l9_1623=l9_1621;
float2 l9_1624=param_3.Surface_UVCoord0;
bool l9_1625=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_1626=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_1627=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_1628=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_1629=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_1630=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_1631=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_1632=0.0;
bool l9_1633=l9_1630&&(!l9_1628);
float l9_1634=1.0;
float l9_1635=l9_1624.x;
int l9_1636=l9_1627.x;
if (l9_1636==1)
{
l9_1635=fract(l9_1635);
}
else
{
if (l9_1636==2)
{
float l9_1637=fract(l9_1635);
float l9_1638=l9_1635-l9_1637;
float l9_1639=step(0.25,fract(l9_1638*0.5));
l9_1635=mix(l9_1637,1.0-l9_1637,fast::clamp(l9_1639,0.0,1.0));
}
}
l9_1624.x=l9_1635;
float l9_1640=l9_1624.y;
int l9_1641=l9_1627.y;
if (l9_1641==1)
{
l9_1640=fract(l9_1640);
}
else
{
if (l9_1641==2)
{
float l9_1642=fract(l9_1640);
float l9_1643=l9_1640-l9_1642;
float l9_1644=step(0.25,fract(l9_1643*0.5));
l9_1640=mix(l9_1642,1.0-l9_1642,fast::clamp(l9_1644,0.0,1.0));
}
}
l9_1624.y=l9_1640;
if (l9_1628)
{
bool l9_1645=l9_1630;
bool l9_1646;
if (l9_1645)
{
l9_1646=l9_1627.x==3;
}
else
{
l9_1646=l9_1645;
}
float l9_1647=l9_1624.x;
float l9_1648=l9_1629.x;
float l9_1649=l9_1629.z;
bool l9_1650=l9_1646;
float l9_1651=l9_1634;
float l9_1652=fast::clamp(l9_1647,l9_1648,l9_1649);
float l9_1653=step(abs(l9_1647-l9_1652),9.9999997e-06);
l9_1651*=(l9_1653+((1.0-float(l9_1650))*(1.0-l9_1653)));
l9_1647=l9_1652;
l9_1624.x=l9_1647;
l9_1634=l9_1651;
bool l9_1654=l9_1630;
bool l9_1655;
if (l9_1654)
{
l9_1655=l9_1627.y==3;
}
else
{
l9_1655=l9_1654;
}
float l9_1656=l9_1624.y;
float l9_1657=l9_1629.y;
float l9_1658=l9_1629.w;
bool l9_1659=l9_1655;
float l9_1660=l9_1634;
float l9_1661=fast::clamp(l9_1656,l9_1657,l9_1658);
float l9_1662=step(abs(l9_1656-l9_1661),9.9999997e-06);
l9_1660*=(l9_1662+((1.0-float(l9_1659))*(1.0-l9_1662)));
l9_1656=l9_1661;
l9_1624.y=l9_1656;
l9_1634=l9_1660;
}
float2 l9_1663=l9_1624;
bool l9_1664=l9_1625;
float3x3 l9_1665=l9_1626;
if (l9_1664)
{
l9_1663=float2((l9_1665*float3(l9_1663,1.0)).xy);
}
float2 l9_1666=l9_1663;
float2 l9_1667=l9_1666;
float2 l9_1668=l9_1667;
l9_1624=l9_1668;
float l9_1669=l9_1624.x;
int l9_1670=l9_1627.x;
bool l9_1671=l9_1633;
float l9_1672=l9_1634;
if ((l9_1670==0)||(l9_1670==3))
{
float l9_1673=l9_1669;
float l9_1674=0.0;
float l9_1675=1.0;
bool l9_1676=l9_1671;
float l9_1677=l9_1672;
float l9_1678=fast::clamp(l9_1673,l9_1674,l9_1675);
float l9_1679=step(abs(l9_1673-l9_1678),9.9999997e-06);
l9_1677*=(l9_1679+((1.0-float(l9_1676))*(1.0-l9_1679)));
l9_1673=l9_1678;
l9_1669=l9_1673;
l9_1672=l9_1677;
}
l9_1624.x=l9_1669;
l9_1634=l9_1672;
float l9_1680=l9_1624.y;
int l9_1681=l9_1627.y;
bool l9_1682=l9_1633;
float l9_1683=l9_1634;
if ((l9_1681==0)||(l9_1681==3))
{
float l9_1684=l9_1680;
float l9_1685=0.0;
float l9_1686=1.0;
bool l9_1687=l9_1682;
float l9_1688=l9_1683;
float l9_1689=fast::clamp(l9_1684,l9_1685,l9_1686);
float l9_1690=step(abs(l9_1684-l9_1689),9.9999997e-06);
l9_1688*=(l9_1690+((1.0-float(l9_1687))*(1.0-l9_1690)));
l9_1684=l9_1689;
l9_1680=l9_1684;
l9_1683=l9_1688;
}
l9_1624.y=l9_1680;
l9_1634=l9_1683;
float2 l9_1691=l9_1624;
int l9_1692=l9_1622;
int l9_1693=l9_1623;
float l9_1694=l9_1632;
float2 l9_1695=l9_1691;
int l9_1696=l9_1692;
int l9_1697=l9_1693;
float3 l9_1698=float3(0.0);
if (l9_1696==0)
{
l9_1698=float3(l9_1695,0.0);
}
else
{
if (l9_1696==1)
{
l9_1698=float3(l9_1695.x,(l9_1695.y*0.5)+(0.5-(float(l9_1697)*0.5)),0.0);
}
else
{
l9_1698=float3(l9_1695,float(l9_1697));
}
}
float3 l9_1699=l9_1698;
float3 l9_1700=l9_1699;
float2 l9_1701=l9_1700.xy;
float l9_1702=l9_1694;
float4 l9_1703=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_1701,bias(l9_1702));
float4 l9_1704=l9_1703;
float4 l9_1705=l9_1704;
if (l9_1630)
{
l9_1705=mix(l9_1631,l9_1705,float4(l9_1634));
}
float4 l9_1706=l9_1705;
l9_1615=l9_1706;
float l9_1707=0.0;
float l9_1708=0.0;
float4 l9_1709=l9_1615;
float l9_1710=l9_1709.x;
float l9_1711=l9_1709.y;
l9_1707=l9_1710;
l9_1708=l9_1711;
float4 l9_1712=float4(0.0);
float3 l9_1713=l9_755;
float l9_1714=l9_756;
float3 l9_1715=l9_760;
float3 l9_1716=(*sc_set0.UserUniforms).Port_Emissive_N014;
float l9_1717=l9_1707;
float l9_1718=l9_1708;
float3 l9_1719=(*sc_set0.UserUniforms).Port_AO_N014;
float3 l9_1720=(*sc_set0.UserUniforms).Port_SpecularAO_N014;
ssGlobals l9_1721=param_3;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1721.BumpedNormal=float3x3(float3(l9_1721.VertexTangent_WorldSpace),float3(l9_1721.VertexBinormal_WorldSpace),float3(l9_1721.VertexNormal_WorldSpace))*l9_1715;
}
l9_1714=fast::clamp(l9_1714,0.0,1.0);
float l9_1722=l9_1714;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1722<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1723=gl_FragCoord;
float2 l9_1724=floor(mod(l9_1723.xy,float2(4.0)));
float l9_1725=(mod(dot(l9_1724,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1722<l9_1725)
{
discard_fragment();
}
}
l9_1713=fast::max(l9_1713,float3(0.0));
float4 l9_1726;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1726=float4(l9_1713,l9_1714);
}
else
{
l9_1717=fast::clamp(l9_1717,0.0,1.0);
l9_1718=fast::clamp(l9_1718,0.0,1.0);
float3 l9_1727=l9_1713;
float l9_1728=l9_1714;
float3 l9_1729=l9_1721.BumpedNormal;
float3 l9_1730=l9_1721.PositionWS;
float3 l9_1731=l9_1721.ViewDirWS;
float3 l9_1732=l9_1716;
float l9_1733=l9_1717;
float l9_1734=l9_1718;
float3 l9_1735=l9_1719;
float3 l9_1736=l9_1720;
SurfaceProperties l9_1737;
l9_1737.albedo=float3(0.0);
l9_1737.opacity=1.0;
l9_1737.normal=float3(0.0);
l9_1737.positionWS=float3(0.0);
l9_1737.viewDirWS=float3(0.0);
l9_1737.metallic=0.0;
l9_1737.roughness=0.0;
l9_1737.emissive=float3(0.0);
l9_1737.ao=float3(1.0);
l9_1737.specularAo=float3(1.0);
l9_1737.bakedShadows=float3(1.0);
SurfaceProperties l9_1738=l9_1737;
SurfaceProperties l9_1739=l9_1738;
l9_1739.opacity=l9_1728;
float3 l9_1740=l9_1727;
float3 l9_1741;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1741=float3(pow(l9_1740.x,2.2),pow(l9_1740.y,2.2),pow(l9_1740.z,2.2));
}
else
{
l9_1741=l9_1740*l9_1740;
}
float3 l9_1742=l9_1741;
l9_1739.albedo=l9_1742;
l9_1739.normal=normalize(l9_1729);
l9_1739.positionWS=l9_1730;
l9_1739.viewDirWS=l9_1731;
float3 l9_1743=l9_1732;
float3 l9_1744;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1744=float3(pow(l9_1743.x,2.2),pow(l9_1743.y,2.2),pow(l9_1743.z,2.2));
}
else
{
l9_1744=l9_1743*l9_1743;
}
float3 l9_1745=l9_1744;
l9_1739.emissive=l9_1745;
l9_1739.metallic=l9_1733;
l9_1739.roughness=l9_1734;
l9_1739.ao=l9_1735;
l9_1739.specularAo=l9_1736;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_1746=l9_1739.positionWS;
l9_1739.ao=evaluateSSAO(l9_1746,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_1747=l9_1739;
SurfaceProperties l9_1748=l9_1747;
float3 l9_1749=mix(float3(0.039999999),l9_1748.albedo*l9_1748.metallic,float3(l9_1748.metallic));
float3 l9_1750=mix(l9_1748.albedo*(1.0-l9_1748.metallic),float3(0.0),float3(l9_1748.metallic));
l9_1747.albedo=l9_1750;
l9_1747.specColor=l9_1749;
SurfaceProperties l9_1751=l9_1747;
l9_1739=l9_1751;
SurfaceProperties l9_1752=l9_1739;
LightingComponents l9_1753;
l9_1753.directDiffuse=float3(0.0);
l9_1753.directSpecular=float3(0.0);
l9_1753.indirectDiffuse=float3(1.0);
l9_1753.indirectSpecular=float3(0.0);
l9_1753.emitted=float3(0.0);
l9_1753.transmitted=float3(0.0);
LightingComponents l9_1754=l9_1753;
LightingComponents l9_1755=l9_1754;
float3 l9_1756=l9_1752.viewDirWS;
int l9_1757=0;
float4 l9_1758=float4(l9_1752.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_1759;
LightProperties l9_1760;
int l9_1761=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1761<sc_DirectionalLightsCount_tmp)
{
l9_1759.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_1761].direction;
l9_1759.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_1761].color;
l9_1760.direction=l9_1759.direction;
l9_1760.color=l9_1759.color.xyz;
l9_1760.attenuation=l9_1759.color.w;
l9_1760.attenuation*=l9_1758[(l9_1757<3) ? l9_1757 : 3];
l9_1757++;
LightingComponents l9_1762=l9_1755;
LightProperties l9_1763=l9_1760;
SurfaceProperties l9_1764=l9_1752;
float3 l9_1765=l9_1756;
SurfaceProperties l9_1766=l9_1764;
float3 l9_1767=l9_1763.direction;
float l9_1768=dot(l9_1766.normal,l9_1767);
float l9_1769=fast::clamp(l9_1768,0.0,1.0);
float3 l9_1770=float3(l9_1769);
l9_1762.directDiffuse+=((l9_1770*l9_1763.color)*l9_1763.attenuation);
SurfaceProperties l9_1771=l9_1764;
float3 l9_1772=l9_1763.direction;
float3 l9_1773=l9_1765;
l9_1762.directSpecular+=((calculateDirectSpecular(l9_1771,l9_1772,l9_1773)*l9_1763.color)*l9_1763.attenuation);
LightingComponents l9_1774=l9_1762;
l9_1755=l9_1774;
l9_1761++;
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
sc_PointLight_t_1 l9_1775;
LightProperties l9_1776;
int l9_1777=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1777<sc_PointLightsCount_tmp)
{
l9_1775.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].falloffEnabled!=0;
l9_1775.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].falloffEndDistance;
l9_1775.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].negRcpFalloffEndDistance4;
l9_1775.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].angleScale;
l9_1775.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].angleOffset;
l9_1775.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].direction;
l9_1775.position=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].position;
l9_1775.color=(*sc_set0.UserUniforms).sc_PointLights[l9_1777].color;
float3 l9_1778=l9_1775.position-l9_1752.positionWS;
l9_1776.direction=normalize(l9_1778);
l9_1776.color=l9_1775.color.xyz;
l9_1776.attenuation=l9_1775.color.w;
l9_1776.attenuation*=l9_1758[(l9_1757<3) ? l9_1757 : 3];
float3 l9_1779=l9_1776.direction;
float3 l9_1780=l9_1775.direction;
float l9_1781=l9_1775.angleScale;
float l9_1782=l9_1775.angleOffset;
float l9_1783=dot(l9_1779,l9_1780);
float l9_1784=fast::clamp((l9_1783*l9_1781)+l9_1782,0.0,1.0);
float l9_1785=l9_1784*l9_1784;
l9_1776.attenuation*=l9_1785;
if (l9_1775.falloffEnabled)
{
float l9_1786=length(l9_1778);
float l9_1787=l9_1775.falloffEndDistance;
l9_1776.attenuation*=computeDistanceAttenuation(l9_1786,l9_1787);
}
l9_1757++;
LightingComponents l9_1788=l9_1755;
LightProperties l9_1789=l9_1776;
SurfaceProperties l9_1790=l9_1752;
float3 l9_1791=l9_1756;
SurfaceProperties l9_1792=l9_1790;
float3 l9_1793=l9_1789.direction;
float l9_1794=dot(l9_1792.normal,l9_1793);
float l9_1795=fast::clamp(l9_1794,0.0,1.0);
float3 l9_1796=float3(l9_1795);
l9_1788.directDiffuse+=((l9_1796*l9_1789.color)*l9_1789.attenuation);
SurfaceProperties l9_1797=l9_1790;
float3 l9_1798=l9_1789.direction;
float3 l9_1799=l9_1791;
l9_1788.directSpecular+=((calculateDirectSpecular(l9_1797,l9_1798,l9_1799)*l9_1789.color)*l9_1789.attenuation);
LightingComponents l9_1800=l9_1788;
l9_1755=l9_1800;
l9_1777++;
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
float3 l9_1801=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_1802=abs(in.varShadowTex-float2(0.5));
float l9_1803=fast::max(l9_1802.x,l9_1802.y);
float l9_1804=step(l9_1803,0.5);
float4 l9_1805=sc_set0.sc_ShadowTexture.sample(sc_set0.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_1804;
float3 l9_1806=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1805.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float l9_1807=l9_1805.w*(*sc_set0.UserUniforms).sc_ShadowDensity;
l9_1801=mix(float3(1.0),l9_1806,float3(l9_1807));
}
else
{
l9_1801=float3(1.0);
}
float3 l9_1808=l9_1801;
float3 l9_1809=l9_1808;
l9_1755.directDiffuse*=l9_1809;
l9_1755.directSpecular*=l9_1809;
}
bool l9_1810=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_1810)
{
float4 l9_1811=gl_FragCoord;
float2 l9_1812=l9_1811.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1813=l9_1812;
float2 l9_1814=l9_1813;
int l9_1815=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_1816=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1816=0;
}
else
{
l9_1816=in.varStereoViewID;
}
int l9_1817=l9_1816;
l9_1815=1-l9_1817;
}
else
{
int l9_1818=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1818=0;
}
else
{
l9_1818=in.varStereoViewID;
}
int l9_1819=l9_1818;
l9_1815=l9_1819;
}
int l9_1820=l9_1815;
float2 l9_1821=l9_1814;
int l9_1822=l9_1820;
float2 l9_1823=l9_1821;
int l9_1824=l9_1822;
float l9_1825=0.0;
float4 l9_1826=float4(0.0);
float2 l9_1827=l9_1823;
int l9_1828=sc_RayTracedShadowTextureLayout_tmp;
int l9_1829=l9_1824;
float l9_1830=l9_1825;
float2 l9_1831=l9_1827;
int l9_1832=l9_1828;
int l9_1833=l9_1829;
float3 l9_1834=float3(0.0);
if (l9_1832==0)
{
l9_1834=float3(l9_1831,0.0);
}
else
{
if (l9_1832==1)
{
l9_1834=float3(l9_1831.x,(l9_1831.y*0.5)+(0.5-(float(l9_1833)*0.5)),0.0);
}
else
{
l9_1834=float3(l9_1831,float(l9_1833));
}
}
float3 l9_1835=l9_1834;
float3 l9_1836=l9_1835;
float2 l9_1837=l9_1836.xy;
float l9_1838=l9_1830;
float4 l9_1839=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_1837,bias(l9_1838));
float4 l9_1840=l9_1839;
l9_1826=l9_1840;
float4 l9_1841=l9_1826;
float4 l9_1842=l9_1841;
float4 l9_1843=l9_1842;
float l9_1844=l9_1843.x;
float3 l9_1845=float3(l9_1844);
float3 l9_1846=l9_1845;
l9_1755.directDiffuse*=(float3(1.0)-l9_1846);
l9_1755.directSpecular*=(float3(1.0)-l9_1846);
}
SurfaceProperties l9_1847=l9_1752;
float3 l9_1848=l9_1847.normal;
float3 l9_1849=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_1850=l9_1848;
float3 l9_1851=l9_1850;
float l9_1852=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_1853=float2(0.0);
float l9_1854=l9_1851.x;
float l9_1855=-l9_1851.z;
float l9_1856=(l9_1854<0.0) ? (-1.0) : 1.0;
float l9_1857=l9_1856*acos(fast::clamp(l9_1855/length(float2(l9_1854,l9_1855)),-1.0,1.0));
l9_1853.x=l9_1857-1.5707964;
l9_1853.y=acos(l9_1851.y);
l9_1853/=float2(6.2831855,3.1415927);
l9_1853.y=1.0-l9_1853.y;
l9_1853.x+=(l9_1852/360.0);
l9_1853.x=fract((l9_1853.x+floor(l9_1853.x))+1.0);
float2 l9_1858=l9_1853;
float2 l9_1859=l9_1858;
float4 l9_1860=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_1861=l9_1859;
float2 l9_1862=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1863=5.0;
l9_1859=calcSeamlessPanoramicUvsForSampling(l9_1861,l9_1862,l9_1863);
}
float2 l9_1864=l9_1859;
float l9_1865=13.0;
int l9_1866=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1867=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1867=0;
}
else
{
l9_1867=in.varStereoViewID;
}
int l9_1868=l9_1867;
l9_1866=1-l9_1868;
}
else
{
int l9_1869=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1869=0;
}
else
{
l9_1869=in.varStereoViewID;
}
int l9_1870=l9_1869;
l9_1866=l9_1870;
}
int l9_1871=l9_1866;
float2 l9_1872=l9_1864;
int l9_1873=l9_1871;
float l9_1874=l9_1865;
float4 l9_1875=float4(0.0);
float2 l9_1876=l9_1872;
int l9_1877=sc_EnvmapSpecularLayout_tmp;
int l9_1878=l9_1873;
float l9_1879=l9_1874;
float2 l9_1880=l9_1876;
int l9_1881=l9_1877;
int l9_1882=l9_1878;
float3 l9_1883=float3(0.0);
if (l9_1881==0)
{
l9_1883=float3(l9_1880,0.0);
}
else
{
if (l9_1881==1)
{
l9_1883=float3(l9_1880.x,(l9_1880.y*0.5)+(0.5-(float(l9_1882)*0.5)),0.0);
}
else
{
l9_1883=float3(l9_1880,float(l9_1882));
}
}
float3 l9_1884=l9_1883;
float3 l9_1885=l9_1884;
float2 l9_1886=l9_1885.xy;
float l9_1887=l9_1879;
float4 l9_1888=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1886,bias(l9_1887));
float4 l9_1889=l9_1888;
l9_1875=l9_1889;
float4 l9_1890=l9_1875;
float4 l9_1891=l9_1890;
l9_1860=l9_1891;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_1892=l9_1859;
float2 l9_1893=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_1894=0.0;
l9_1859=calcSeamlessPanoramicUvsForSampling(l9_1892,l9_1893,l9_1894);
float2 l9_1895=l9_1859;
float l9_1896=-13.0;
int l9_1897=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_1898=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1898=0;
}
else
{
l9_1898=in.varStereoViewID;
}
int l9_1899=l9_1898;
l9_1897=1-l9_1899;
}
else
{
int l9_1900=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1900=0;
}
else
{
l9_1900=in.varStereoViewID;
}
int l9_1901=l9_1900;
l9_1897=l9_1901;
}
int l9_1902=l9_1897;
float2 l9_1903=l9_1895;
int l9_1904=l9_1902;
float l9_1905=l9_1896;
float4 l9_1906=float4(0.0);
float2 l9_1907=l9_1903;
int l9_1908=sc_EnvmapDiffuseLayout_tmp;
int l9_1909=l9_1904;
float l9_1910=l9_1905;
float2 l9_1911=l9_1907;
int l9_1912=l9_1908;
int l9_1913=l9_1909;
float3 l9_1914=float3(0.0);
if (l9_1912==0)
{
l9_1914=float3(l9_1911,0.0);
}
else
{
if (l9_1912==1)
{
l9_1914=float3(l9_1911.x,(l9_1911.y*0.5)+(0.5-(float(l9_1913)*0.5)),0.0);
}
else
{
l9_1914=float3(l9_1911,float(l9_1913));
}
}
float3 l9_1915=l9_1914;
float3 l9_1916=l9_1915;
float2 l9_1917=l9_1916.xy;
float l9_1918=l9_1910;
float4 l9_1919=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_1917,bias(l9_1918));
float4 l9_1920=l9_1919;
l9_1906=l9_1920;
float4 l9_1921=l9_1906;
float4 l9_1922=l9_1921;
l9_1860=l9_1922;
}
else
{
float2 l9_1923=l9_1859;
float l9_1924=13.0;
int l9_1925=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1926=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1926=0;
}
else
{
l9_1926=in.varStereoViewID;
}
int l9_1927=l9_1926;
l9_1925=1-l9_1927;
}
else
{
int l9_1928=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1928=0;
}
else
{
l9_1928=in.varStereoViewID;
}
int l9_1929=l9_1928;
l9_1925=l9_1929;
}
int l9_1930=l9_1925;
float2 l9_1931=l9_1923;
int l9_1932=l9_1930;
float l9_1933=l9_1924;
float4 l9_1934=float4(0.0);
float2 l9_1935=l9_1931;
int l9_1936=sc_EnvmapSpecularLayout_tmp;
int l9_1937=l9_1932;
float l9_1938=l9_1933;
float2 l9_1939=l9_1935;
int l9_1940=l9_1936;
int l9_1941=l9_1937;
float3 l9_1942=float3(0.0);
if (l9_1940==0)
{
l9_1942=float3(l9_1939,0.0);
}
else
{
if (l9_1940==1)
{
l9_1942=float3(l9_1939.x,(l9_1939.y*0.5)+(0.5-(float(l9_1941)*0.5)),0.0);
}
else
{
l9_1942=float3(l9_1939,float(l9_1941));
}
}
float3 l9_1943=l9_1942;
float3 l9_1944=l9_1943;
float2 l9_1945=l9_1944.xy;
float l9_1946=l9_1938;
float4 l9_1947=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1945,bias(l9_1946));
float4 l9_1948=l9_1947;
l9_1934=l9_1948;
float4 l9_1949=l9_1934;
float4 l9_1950=l9_1949;
l9_1860=l9_1950;
}
}
float4 l9_1951=l9_1860;
float3 l9_1952=l9_1951.xyz*(1.0/l9_1951.w);
float3 l9_1953=l9_1952*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_1849=l9_1953;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_1954=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_1955=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_1956=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_1957=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_1958=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_1959=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_1960=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_1961=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_1962=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_1963=-l9_1848;
float l9_1964=0.0;
l9_1964=l9_1963.x;
float l9_1965=l9_1963.y;
float l9_1966=l9_1963.z;
float l9_1967=l9_1964*l9_1964;
float l9_1968=l9_1965*l9_1965;
float l9_1969=l9_1966*l9_1966;
float l9_1970=l9_1964*l9_1965;
float l9_1971=l9_1965*l9_1966;
float l9_1972=l9_1964*l9_1966;
float3 l9_1973=((((((l9_1962*0.42904299)*(l9_1967-l9_1968))+((l9_1960*0.74312502)*l9_1969))+(l9_1954*0.88622701))-(l9_1960*0.24770799))+((((l9_1958*l9_1970)+(l9_1961*l9_1972))+(l9_1959*l9_1971))*0.85808599))+((((l9_1957*l9_1964)+(l9_1955*l9_1965))+(l9_1956*l9_1966))*1.0233279);
l9_1849=l9_1973*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_1974=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_1974)
{
float4 l9_1975=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_1849=mix(l9_1849,l9_1975.xyz,float3(l9_1975.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1849+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_1849.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1849+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_1849.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1849+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_1849.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_1976=l9_1848;
float3 l9_1977=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_1978;
float l9_1979;
int l9_1980=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1980<sc_LightEstimationSGCount_tmp)
{
l9_1978.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1980].color;
l9_1978.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1980].sharpness;
l9_1978.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1980].axis;
float3 l9_1981=l9_1976;
float l9_1982=dot(l9_1978.axis,l9_1981);
float l9_1983=l9_1978.sharpness;
float l9_1984=0.36000001;
float l9_1985=1.0/(4.0*l9_1984);
float l9_1986=exp(-l9_1983);
float l9_1987=l9_1986*l9_1986;
float l9_1988=1.0/l9_1983;
float l9_1989=(1.0+(2.0*l9_1987))-l9_1988;
float l9_1990=((l9_1986-l9_1987)*l9_1988)-l9_1987;
float l9_1991=sqrt(1.0-l9_1989);
float l9_1992=l9_1984*l9_1982;
float l9_1993=l9_1985*l9_1991;
float l9_1994=l9_1992+l9_1993;
float l9_1995=l9_1982;
float l9_1996=fast::clamp(l9_1995,0.0,1.0);
float l9_1997=l9_1996;
if (step(abs(l9_1992),l9_1993)>0.5)
{
l9_1979=(l9_1994*l9_1994)/l9_1991;
}
else
{
l9_1979=l9_1997;
}
l9_1997=l9_1979;
float l9_1998=(l9_1989*l9_1997)+l9_1990;
sc_SphericalGaussianLight_t l9_1999=l9_1978;
float3 l9_2000=(l9_1999.color/float3(l9_1999.sharpness))*6.2831855;
float3 l9_2001=(l9_2000*l9_1998)/float3(3.1415927);
l9_1977+=l9_2001;
l9_1980++;
continue;
}
else
{
break;
}
}
float3 l9_2002=l9_1977;
l9_1849+=l9_2002;
}
float3 l9_2003=l9_1849;
float3 l9_2004=l9_2003;
l9_1755.indirectDiffuse=l9_2004;
SurfaceProperties l9_2005=l9_1752;
float3 l9_2006=l9_1756;
float3 l9_2007=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_2008=l9_2005;
float3 l9_2009=l9_2006;
float3 l9_2010=l9_2008.normal;
float3 l9_2011=reflect(-l9_2009,l9_2010);
float3 l9_2012=l9_2010;
float3 l9_2013=l9_2011;
float l9_2014=l9_2008.roughness;
l9_2011=getSpecularDominantDir(l9_2012,l9_2013,l9_2014);
float l9_2015=l9_2008.roughness;
float l9_2016=pow(l9_2015,0.66666669);
float l9_2017=fast::clamp(l9_2016,0.0,1.0);
float l9_2018=l9_2017*5.0;
float l9_2019=l9_2018;
float l9_2020=l9_2019;
float3 l9_2021=l9_2011;
float l9_2022=l9_2020;
float3 l9_2023=l9_2021;
float l9_2024=l9_2022;
float4 l9_2025=float4(0.0);
float3 l9_2026=l9_2023;
float l9_2027=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_2028=float2(0.0);
float l9_2029=l9_2026.x;
float l9_2030=-l9_2026.z;
float l9_2031=(l9_2029<0.0) ? (-1.0) : 1.0;
float l9_2032=l9_2031*acos(fast::clamp(l9_2030/length(float2(l9_2029,l9_2030)),-1.0,1.0));
l9_2028.x=l9_2032-1.5707964;
l9_2028.y=acos(l9_2026.y);
l9_2028/=float2(6.2831855,3.1415927);
l9_2028.y=1.0-l9_2028.y;
l9_2028.x+=(l9_2027/360.0);
l9_2028.x=fract((l9_2028.x+floor(l9_2028.x))+1.0);
float2 l9_2033=l9_2028;
float2 l9_2034=l9_2033;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_2035=floor(l9_2024);
float l9_2036=ceil(l9_2024);
float l9_2037=l9_2024-l9_2035;
float2 l9_2038=l9_2034;
float2 l9_2039=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2040=l9_2035;
float2 l9_2041=calcSeamlessPanoramicUvsForSampling(l9_2038,l9_2039,l9_2040);
float2 l9_2042=l9_2041;
float l9_2043=l9_2035;
float2 l9_2044=l9_2042;
float l9_2045=l9_2043;
int l9_2046=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2047=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2047=0;
}
else
{
l9_2047=in.varStereoViewID;
}
int l9_2048=l9_2047;
l9_2046=1-l9_2048;
}
else
{
int l9_2049=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2049=0;
}
else
{
l9_2049=in.varStereoViewID;
}
int l9_2050=l9_2049;
l9_2046=l9_2050;
}
int l9_2051=l9_2046;
float2 l9_2052=l9_2044;
int l9_2053=l9_2051;
float l9_2054=l9_2045;
float4 l9_2055=float4(0.0);
float2 l9_2056=l9_2052;
int l9_2057=sc_EnvmapSpecularLayout_tmp;
int l9_2058=l9_2053;
float l9_2059=l9_2054;
float2 l9_2060=l9_2056;
int l9_2061=l9_2057;
int l9_2062=l9_2058;
float3 l9_2063=float3(0.0);
if (l9_2061==0)
{
l9_2063=float3(l9_2060,0.0);
}
else
{
if (l9_2061==1)
{
l9_2063=float3(l9_2060.x,(l9_2060.y*0.5)+(0.5-(float(l9_2062)*0.5)),0.0);
}
else
{
l9_2063=float3(l9_2060,float(l9_2062));
}
}
float3 l9_2064=l9_2063;
float3 l9_2065=l9_2064;
float2 l9_2066=l9_2065.xy;
float l9_2067=l9_2059;
float4 l9_2068=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2066,level(l9_2067));
float4 l9_2069=l9_2068;
l9_2055=l9_2069;
float4 l9_2070=l9_2055;
float4 l9_2071=l9_2070;
float4 l9_2072=l9_2071;
float4 l9_2073=l9_2072;
float2 l9_2074=l9_2034;
float2 l9_2075=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2076=l9_2036;
float2 l9_2077=calcSeamlessPanoramicUvsForSampling(l9_2074,l9_2075,l9_2076);
float2 l9_2078=l9_2077;
float l9_2079=l9_2036;
float2 l9_2080=l9_2078;
float l9_2081=l9_2079;
int l9_2082=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2083=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2083=0;
}
else
{
l9_2083=in.varStereoViewID;
}
int l9_2084=l9_2083;
l9_2082=1-l9_2084;
}
else
{
int l9_2085=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2085=0;
}
else
{
l9_2085=in.varStereoViewID;
}
int l9_2086=l9_2085;
l9_2082=l9_2086;
}
int l9_2087=l9_2082;
float2 l9_2088=l9_2080;
int l9_2089=l9_2087;
float l9_2090=l9_2081;
float4 l9_2091=float4(0.0);
float2 l9_2092=l9_2088;
int l9_2093=sc_EnvmapSpecularLayout_tmp;
int l9_2094=l9_2089;
float l9_2095=l9_2090;
float2 l9_2096=l9_2092;
int l9_2097=l9_2093;
int l9_2098=l9_2094;
float3 l9_2099=float3(0.0);
if (l9_2097==0)
{
l9_2099=float3(l9_2096,0.0);
}
else
{
if (l9_2097==1)
{
l9_2099=float3(l9_2096.x,(l9_2096.y*0.5)+(0.5-(float(l9_2098)*0.5)),0.0);
}
else
{
l9_2099=float3(l9_2096,float(l9_2098));
}
}
float3 l9_2100=l9_2099;
float3 l9_2101=l9_2100;
float2 l9_2102=l9_2101.xy;
float l9_2103=l9_2095;
float4 l9_2104=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2102,level(l9_2103));
float4 l9_2105=l9_2104;
l9_2091=l9_2105;
float4 l9_2106=l9_2091;
float4 l9_2107=l9_2106;
float4 l9_2108=l9_2107;
float4 l9_2109=l9_2108;
l9_2025=mix(l9_2073,l9_2109,float4(l9_2037));
}
else
{
float2 l9_2110=l9_2034;
float l9_2111=l9_2024;
float2 l9_2112=l9_2110;
float l9_2113=l9_2111;
int l9_2114=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2115=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2115=0;
}
else
{
l9_2115=in.varStereoViewID;
}
int l9_2116=l9_2115;
l9_2114=1-l9_2116;
}
else
{
int l9_2117=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2117=0;
}
else
{
l9_2117=in.varStereoViewID;
}
int l9_2118=l9_2117;
l9_2114=l9_2118;
}
int l9_2119=l9_2114;
float2 l9_2120=l9_2112;
int l9_2121=l9_2119;
float l9_2122=l9_2113;
float4 l9_2123=float4(0.0);
float2 l9_2124=l9_2120;
int l9_2125=sc_EnvmapSpecularLayout_tmp;
int l9_2126=l9_2121;
float l9_2127=l9_2122;
float2 l9_2128=l9_2124;
int l9_2129=l9_2125;
int l9_2130=l9_2126;
float3 l9_2131=float3(0.0);
if (l9_2129==0)
{
l9_2131=float3(l9_2128,0.0);
}
else
{
if (l9_2129==1)
{
l9_2131=float3(l9_2128.x,(l9_2128.y*0.5)+(0.5-(float(l9_2130)*0.5)),0.0);
}
else
{
l9_2131=float3(l9_2128,float(l9_2130));
}
}
float3 l9_2132=l9_2131;
float3 l9_2133=l9_2132;
float2 l9_2134=l9_2133.xy;
float l9_2135=l9_2127;
float4 l9_2136=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_2134,level(l9_2135));
float4 l9_2137=l9_2136;
l9_2123=l9_2137;
float4 l9_2138=l9_2123;
float4 l9_2139=l9_2138;
float4 l9_2140=l9_2139;
l9_2025=l9_2140;
}
float4 l9_2141=l9_2025;
float3 l9_2142=l9_2141.xyz*(1.0/l9_2141.w);
float3 l9_2143=l9_2142;
float3 l9_2144=l9_2143*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_2144+=float3(1e-06);
float3 l9_2145=l9_2144;
float3 l9_2146=l9_2145;
bool l9_2147=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_2147)
{
float4 l9_2148=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_2146=mix(l9_2146,l9_2148.xyz,float3(l9_2148.w));
}
SurfaceProperties l9_2149=l9_2008;
float l9_2150=abs(dot(l9_2010,l9_2009));
float3 l9_2151=l9_2146*envBRDFApprox(l9_2149,l9_2150);
l9_2007+=l9_2151;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_2152=l9_2005;
float3 l9_2153=l9_2006;
float l9_2154=fast::clamp(l9_2152.roughness*l9_2152.roughness,0.0099999998,1.0);
float3 l9_2155=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_2152.specColor;
sc_SphericalGaussianLight_t l9_2156;
sc_SphericalGaussianLight_t l9_2157;
sc_SphericalGaussianLight_t l9_2158;
int l9_2159=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2159<sc_LightEstimationSGCount_tmp)
{
l9_2156.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2159].color;
l9_2156.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2159].sharpness;
l9_2156.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_2159].axis;
float3 l9_2160=l9_2152.normal;
float l9_2161=l9_2154;
float3 l9_2162=l9_2153;
float3 l9_2163=l9_2152.specColor;
float3 l9_2164=l9_2160;
float l9_2165=l9_2161;
l9_2157.axis=l9_2164;
float l9_2166=l9_2165*l9_2165;
l9_2157.sharpness=2.0/l9_2166;
l9_2157.color=float3(1.0/(3.1415927*l9_2166));
sc_SphericalGaussianLight_t l9_2167=l9_2157;
sc_SphericalGaussianLight_t l9_2168=l9_2167;
sc_SphericalGaussianLight_t l9_2169=l9_2168;
float3 l9_2170=l9_2162;
l9_2158.axis=reflect(-l9_2170,l9_2169.axis);
l9_2158.color=l9_2169.color;
l9_2158.sharpness=l9_2169.sharpness;
l9_2158.sharpness/=(4.0*fast::max(dot(l9_2169.axis,l9_2170),9.9999997e-05));
sc_SphericalGaussianLight_t l9_2171=l9_2158;
sc_SphericalGaussianLight_t l9_2172=l9_2171;
sc_SphericalGaussianLight_t l9_2173=l9_2172;
sc_SphericalGaussianLight_t l9_2174=l9_2156;
float l9_2175=length((l9_2173.axis*l9_2173.sharpness)+(l9_2174.axis*l9_2174.sharpness));
float3 l9_2176=(l9_2173.color*exp((l9_2175-l9_2173.sharpness)-l9_2174.sharpness))*l9_2174.color;
float l9_2177=1.0-exp((-2.0)*l9_2175);
float3 l9_2178=((l9_2176*6.2831855)*l9_2177)/float3(l9_2175);
float3 l9_2179=l9_2178;
float3 l9_2180=l9_2172.axis;
float l9_2181=l9_2161*l9_2161;
float l9_2182=dot(l9_2160,l9_2180);
float l9_2183=fast::clamp(l9_2182,0.0,1.0);
float l9_2184=l9_2183;
float l9_2185=dot(l9_2160,l9_2162);
float l9_2186=fast::clamp(l9_2185,0.0,1.0);
float l9_2187=l9_2186;
float3 l9_2188=normalize(l9_2172.axis+l9_2162);
float l9_2189=l9_2181;
float l9_2190=l9_2184;
float l9_2191=1.0/(l9_2190+sqrt(l9_2189+(((1.0-l9_2189)*l9_2190)*l9_2190)));
float l9_2192=l9_2181;
float l9_2193=l9_2187;
float l9_2194=1.0/(l9_2193+sqrt(l9_2192+(((1.0-l9_2192)*l9_2193)*l9_2193)));
l9_2179*=(l9_2191*l9_2194);
float l9_2195=dot(l9_2180,l9_2188);
float l9_2196=fast::clamp(l9_2195,0.0,1.0);
float l9_2197=pow(1.0-l9_2196,5.0);
l9_2179*=(l9_2163+((float3(1.0)-l9_2163)*l9_2197));
l9_2179*=l9_2184;
float3 l9_2198=l9_2179;
l9_2155+=l9_2198;
l9_2159++;
continue;
}
else
{
break;
}
}
float3 l9_2199=l9_2155;
l9_2007+=l9_2199;
}
float3 l9_2200=l9_2007;
l9_1755.indirectSpecular=l9_2200;
LightingComponents l9_2201=l9_1755;
LightingComponents l9_2202=l9_2201;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_2202.directDiffuse=float3(0.0);
l9_2202.indirectDiffuse=float3(0.0);
float4 l9_2203=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_2204=out.FragColor0;
float4 l9_2205=l9_2204;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_2205.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_2206=l9_2205;
l9_2203=l9_2206;
}
else
{
float4 l9_2207=gl_FragCoord;
float2 l9_2208=l9_2207.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2209=l9_2208;
float2 l9_2210=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_2211=1;
int l9_2212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2212=0;
}
else
{
l9_2212=in.varStereoViewID;
}
int l9_2213=l9_2212;
int l9_2214=l9_2213;
float3 l9_2215=float3(l9_2209,0.0);
int l9_2216=l9_2211;
int l9_2217=l9_2214;
if (l9_2216==1)
{
l9_2215.y=((2.0*l9_2215.y)+float(l9_2217))-1.0;
}
float2 l9_2218=l9_2215.xy;
l9_2210=l9_2218;
}
else
{
l9_2210=l9_2209;
}
float2 l9_2219=l9_2210;
float2 l9_2220=l9_2219;
float2 l9_2221=l9_2220;
int l9_2222=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_2223=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2223=0;
}
else
{
l9_2223=in.varStereoViewID;
}
int l9_2224=l9_2223;
l9_2222=1-l9_2224;
}
else
{
int l9_2225=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2225=0;
}
else
{
l9_2225=in.varStereoViewID;
}
int l9_2226=l9_2225;
l9_2222=l9_2226;
}
int l9_2227=l9_2222;
float2 l9_2228=l9_2221;
int l9_2229=l9_2227;
float2 l9_2230=l9_2228;
int l9_2231=l9_2229;
float l9_2232=0.0;
float4 l9_2233=float4(0.0);
float2 l9_2234=l9_2230;
int l9_2235=sc_ScreenTextureLayout_tmp;
int l9_2236=l9_2231;
float l9_2237=l9_2232;
float2 l9_2238=l9_2234;
int l9_2239=l9_2235;
int l9_2240=l9_2236;
float3 l9_2241=float3(0.0);
if (l9_2239==0)
{
l9_2241=float3(l9_2238,0.0);
}
else
{
if (l9_2239==1)
{
l9_2241=float3(l9_2238.x,(l9_2238.y*0.5)+(0.5-(float(l9_2240)*0.5)),0.0);
}
else
{
l9_2241=float3(l9_2238,float(l9_2240));
}
}
float3 l9_2242=l9_2241;
float3 l9_2243=l9_2242;
float2 l9_2244=l9_2243.xy;
float l9_2245=l9_2237;
float4 l9_2246=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_2244,bias(l9_2245));
float4 l9_2247=l9_2246;
l9_2233=l9_2247;
float4 l9_2248=l9_2233;
float4 l9_2249=l9_2248;
float4 l9_2250=l9_2249;
l9_2203=l9_2250;
}
float4 l9_2251=l9_2203;
float4 l9_2252=l9_2251;
float3 l9_2253=l9_2252.xyz;
float3 l9_2254;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2254=float3(pow(l9_2253.x,2.2),pow(l9_2253.y,2.2),pow(l9_2253.z,2.2));
}
else
{
l9_2254=l9_2253*l9_2253;
}
float3 l9_2255=l9_2254;
float3 l9_2256=l9_2255;
l9_2202.transmitted=l9_2256*mix(float3(1.0),l9_1739.albedo,float3(l9_1739.opacity));
l9_1739.opacity=1.0;
}
bool l9_2257=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_2257=true;
}
SurfaceProperties l9_2258=l9_1739;
LightingComponents l9_2259=l9_2202;
bool l9_2260=l9_2257;
float3 l9_2261=float3(0.0);
bool l9_2262=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_2262)
{
l9_2261=l9_2258.albedo*(l9_2259.directDiffuse+(l9_2259.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_2261=l9_2258.albedo*(l9_2259.directDiffuse+(l9_2259.indirectDiffuse*l9_2258.ao));
}
float3 l9_2263=l9_2259.directSpecular+(l9_2259.indirectSpecular*l9_2258.specularAo);
float3 l9_2264=l9_2258.emissive;
float3 l9_2265=l9_2259.transmitted;
if (l9_2260)
{
float l9_2266=l9_2258.opacity;
l9_2261*=srgbToLinear(l9_2266);
}
float3 l9_2267=((l9_2261+l9_2263)+l9_2264)+l9_2265;
float3 l9_2268=l9_2267;
float4 l9_2269=float4(l9_2268,l9_1739.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_2270=l9_2269.xyz;
float l9_2271=1.8;
float l9_2272=1.4;
float l9_2273=0.5;
float l9_2274=1.5;
float3 l9_2275=(l9_2270*((l9_2270*l9_2271)+float3(l9_2272)))/((l9_2270*((l9_2270*l9_2271)+float3(l9_2273)))+float3(l9_2274));
l9_2269=float4(l9_2275.x,l9_2275.y,l9_2275.z,l9_2269.w);
}
float3 l9_2276=l9_2269.xyz;
float l9_2277=l9_2276.x;
float l9_2278=l9_2276.y;
float l9_2279=l9_2276.z;
float3 l9_2280=float3(linearToSrgb(l9_2277),linearToSrgb(l9_2278),linearToSrgb(l9_2279));
l9_2269=float4(l9_2280.x,l9_2280.y,l9_2280.z,l9_2269.w);
float4 l9_2281=l9_2269;
l9_1726=l9_2281;
}
l9_1726=fast::max(l9_1726,float4(0.0));
l9_1712=l9_1726;
param=l9_1712;
param_2=param;
}
else
{
float l9_2282=0.0;
float l9_2283;
if ((int(TRAILS_tmp)!=0))
{
l9_2283=1.001;
}
else
{
l9_2283=0.001;
}
l9_2283-=0.001;
l9_2282=l9_2283;
float4 l9_2284=float4(0.0);
l9_2284=param_3.VertexColor;
float l9_2285=0.0;
l9_2285=l9_2284.x;
float l9_2286=0.0;
float l9_2287=l9_2282;
bool l9_2288=(l9_2287*1.0)!=0.0;
bool l9_2289;
if (l9_2288)
{
l9_2289=(l9_2285*1.0)!=0.0;
}
else
{
l9_2289=l9_2288;
}
l9_2286=float(l9_2289);
float2 l9_2290=float2(0.0);
float2 l9_2291=(*sc_set0.UserUniforms).trailFadeStartEnd;
l9_2290=l9_2291;
float2 l9_2292=float2(0.0);
float l9_2293=(*sc_set0.UserUniforms).Port_Input1_N216;
float2 l9_2294=float2(0.0);
float2 l9_2295;
if (TRAILBEHAVIOR_tmp!=0)
{
l9_2295=float2(l9_2293);
}
else
{
float2 l9_2296=float2(0.0);
float2 l9_2297=(*sc_set0.UserUniforms).trailFadeInOut;
l9_2296=l9_2297;
l9_2294=l9_2296;
l9_2295=l9_2294;
}
l9_2292=l9_2295;
float4 l9_2298=float4(0.0);
l9_2298=float4(l9_2290.x,l9_2290.y,l9_2298.z,l9_2298.w);
l9_2298=float4(l9_2298.x,l9_2298.y,l9_2292.x,l9_2292.y);
float3 l9_2299=float3(0.0);
float3 l9_2300=(*sc_set0.UserUniforms).colorStart;
l9_2299=l9_2300;
float3 l9_2301=float3(0.0);
float3 l9_2302=(*sc_set0.UserUniforms).colorEnd;
l9_2301=l9_2302;
float3 l9_2303=float3(0.0);
float3 l9_2304=(*sc_set0.UserUniforms).colorMinStart;
l9_2303=l9_2304;
float3 l9_2305=float3(0.0);
float3 l9_2306=(*sc_set0.UserUniforms).colorMinEnd;
l9_2305=l9_2306;
float3 l9_2307=float3(0.0);
float3 l9_2308=(*sc_set0.UserUniforms).colorMaxStart;
l9_2307=l9_2308;
float3 l9_2309=float3(0.0);
float3 l9_2310=(*sc_set0.UserUniforms).colorMaxEnd;
l9_2309=l9_2310;
float l9_2311=0.0;
float l9_2312=(*sc_set0.UserUniforms).alphaStart;
l9_2311=l9_2312;
float l9_2313=0.0;
float l9_2314=(*sc_set0.UserUniforms).alphaEnd;
l9_2313=l9_2314;
float l9_2315=0.0;
float l9_2316=(*sc_set0.UserUniforms).alphaMinStart;
l9_2315=l9_2316;
float l9_2317=0.0;
float l9_2318=(*sc_set0.UserUniforms).alphaMinEnd;
l9_2317=l9_2318;
float l9_2319=0.0;
float l9_2320=(*sc_set0.UserUniforms).alphaMaxStart;
l9_2319=l9_2320;
float l9_2321=0.0;
float l9_2322=(*sc_set0.UserUniforms).alphaMaxEnd;
l9_2321=l9_2322;
float l9_2323=0.0;
float l9_2324=(*sc_set0.UserUniforms).alphaDissolveMult;
l9_2323=l9_2324;
float l9_2325=0.0;
float l9_2326=(*sc_set0.UserUniforms).numValidFrames;
l9_2325=l9_2326;
float2 l9_2327=float2(0.0);
float2 l9_2328=(*sc_set0.UserUniforms).gridSize;
l9_2327=l9_2328;
float l9_2329=0.0;
float l9_2330=(*sc_set0.UserUniforms).flipBookSpeedMult;
l9_2329=l9_2330;
float l9_2331=0.0;
float l9_2332=(*sc_set0.UserUniforms).flipBookRandomStart;
l9_2331=l9_2332;
float2 l9_2333=float2(0.0);
float2 l9_2334=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
l9_2333=l9_2334;
float4 l9_2335=float4(0.0);
float4 l9_2336=(*sc_set0.UserUniforms).colorRampMult;
l9_2335=l9_2336;
float l9_2337=0.0;
float l9_2338=(*sc_set0.UserUniforms).externalSeed;
l9_2337=l9_2338;
float4 l9_2339=float4(0.0);
float4 l9_2340;
l9_2340.x=in.Interpolator0.x;
l9_2340.y=in.Interpolator0.y;
l9_2340.z=in.Interpolator0.z;
l9_2340.w=in.Interpolator0.w;
l9_2339=l9_2340;
float4 l9_2341=float4(0.0);
float4 l9_2342;
l9_2342.x=in.Interpolator1.x;
l9_2342.y=in.Interpolator1.y;
l9_2342.z=in.Interpolator1.z;
l9_2342.w=in.Interpolator1.w;
l9_2341=l9_2342;
float4 l9_2343=float4(0.0);
float l9_2344=l9_2286;
float4 l9_2345=l9_2298;
float3 l9_2346=l9_2299;
float3 l9_2347=l9_2301;
float3 l9_2348=l9_2303;
float3 l9_2349=l9_2305;
float3 l9_2350=l9_2307;
float3 l9_2351=l9_2309;
float l9_2352=l9_2311;
float l9_2353=l9_2313;
float l9_2354=l9_2315;
float l9_2355=l9_2317;
float l9_2356=l9_2319;
float l9_2357=l9_2321;
float l9_2358=l9_2323;
float l9_2359=l9_2325;
float2 l9_2360=l9_2327;
float l9_2361=l9_2329;
float l9_2362=l9_2331;
float2 l9_2363=l9_2333;
float4 l9_2364=l9_2335;
float l9_2365=l9_2337;
float4 l9_2366=l9_2339;
float4 l9_2367=l9_2341;
ssGlobals l9_2368=param_3;
tempGlobals=l9_2368;
float4 l9_2369=float4(0.0);
N2_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N2_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N2_isTrailCondition=l9_2344!=0.0;
N2_ENABLE_TRAILTEXTURE=(int(TRAILTEXTURE_tmp)!=0);
N2_ENABLE_TRAILCOLORRAMP=(int(TRAILCOLORRAMP_tmp)!=0);
N2_fadeInOut=l9_2345;
N2_colorStart=l9_2346;
N2_colorEnd=l9_2347;
N2_ENABLE_COLORMINMAX=(int(COLORMINMAX_tmp)!=0);
N2_colorMinStart=l9_2348;
N2_colorMinEnd=l9_2349;
N2_colorMaxStart=l9_2350;
N2_colorMaxEnd=l9_2351;
N2_ENABLE_COLORMONOMIN=(int(COLORMONOMIN_tmp)!=0);
N2_alphaStart=l9_2352;
N2_alphaEnd=l9_2353;
N2_ENABLE_ALPHAMINMAX=(int(ALPHAMINMAX_tmp)!=0);
N2_alphaMinStart=l9_2354;
N2_alphaMinEnd=l9_2355;
N2_alphaMaxStart=l9_2356;
N2_alphaMaxEnd=l9_2357;
N2_ENABLE_ALPHADISSOLVE=(int(ALPHADISSOLVE_tmp)!=0);
N2_alphaDissolveMult=l9_2358;
N2_ENABLE_PREMULTIPLIEDCOLOR=(int(PREMULTIPLIEDCOLOR_tmp)!=0);
N2_ENABLE_BLACKASALPHA=(int(BLACKASALPHA_tmp)!=0);
N2_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N2_ENABLE_FLIPBOOK=(int(FLIPBOOK_tmp)!=0);
N2_numValidFrames=l9_2359;
N2_gridSize=l9_2360;
N2_flipBookSpeedMult=l9_2361;
N2_flipBookRandomStart=l9_2362;
N2_ENABLE_FLIPBOOKBLEND=(int(FLIPBOOKBLEND_tmp)!=0);
N2_ENABLE_FLIPBOOKBYLIFE=(int(FLIPBOOKBYLIFE_tmp)!=0);
N2_ENABLE_COLORRAMP=(int(COLORRAMP_tmp)!=0);
N2_texSize=l9_2363;
N2_colorRampMult=l9_2364;
N2_ENABLE_NORANDOFFSET=(int(NORANDOFFSET_tmp)!=0);
N2_ENABLE_BASETEXTURE=(int(BASETEXTURE_tmp)!=0);
N2_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N2_externalSeed=l9_2365;
N2_timeValuesIn=l9_2366;
N2_cameraFade_trailHeadTime_taper=l9_2367;
float l9_2370=0.0;
if (N2_ENABLE_WORLDPOSSEED)
{
float4x4 l9_2371=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_2370=length(float4(1.0)*l9_2371);
}
N2_globalSeed=N2_externalSeed+l9_2370;
int l9_2372=0;
l9_2372=int(tempGlobals.gInstanceID+0.5);
int l9_2373=l9_2372;
float l9_2374=float(l9_2373);
int l9_2375=int(l9_2374);
int l9_2376=l9_2375^(l9_2375*15299);
int l9_2377=l9_2376;
int l9_2378=l9_2377;
int l9_2379=((l9_2378*((l9_2378*1471343)+101146501))+1559861749)&2147483647;
int l9_2380=l9_2379;
int l9_2381=l9_2377*1399;
int l9_2382=((l9_2381*((l9_2381*1471343)+101146501))+1559861749)&2147483647;
int l9_2383=l9_2382;
int l9_2384=l9_2377*7177;
int l9_2385=((l9_2384*((l9_2384*1471343)+101146501))+1559861749)&2147483647;
int l9_2386=l9_2385;
int l9_2387=l9_2380;
float l9_2388=float(l9_2387)*4.6566129e-10;
int l9_2389=l9_2383;
float l9_2390=float(l9_2389)*4.6566129e-10;
int l9_2391=l9_2386;
float l9_2392=float(l9_2391)*4.6566129e-10;
float3 l9_2393=float3(l9_2388,l9_2390,l9_2392);
float3 l9_2394=l9_2393;
N2_particleSeed=l9_2394;
float l9_2395=N2_timeValuesIn.w;
float l9_2396=N2_particleSeed.x;
float l9_2397=N2_particleSeed.y;
float l9_2398=N2_particleSeed.z;
float3 l9_2399=fract((float3(l9_2396,l9_2397,l9_2398)*27.21883)+float3(N2_globalSeed));
if (N2_ENABLE_COLORMONOMIN)
{
l9_2399=fract((float3(l9_2396,l9_2396,l9_2396)*27.21883)+float3(N2_globalSeed));
}
float l9_2400=fract((N2_particleSeed.x*3121.3333)+N2_globalSeed);
float l9_2401=fract((N2_particleSeed.y*13.2234)+N2_globalSeed);
float l9_2402=fract((N2_particleSeed.z*3.5358)+N2_globalSeed);
N2_isTrail=0.0;
float l9_2403=1.0;
N2_trailHeadTime=N2_cameraFade_trailHeadTime_taper.yz;
float4 l9_2404=float4(1.0);
float2 l9_2405=tempGlobals.Surface_UVCoord0;
N2_uv=l9_2405;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrailCondition)
{
N2_isTrail=1.0;
float l9_2406=N2_cameraFade_trailHeadTime_taper.w;
float2 l9_2407=float2(0.5-(l9_2406/2.0),0.5+(l9_2406/2.0));
float l9_2408=N2_uv.x;
float l9_2409=l9_2407.x;
bool l9_2410=l9_2408<l9_2409;
bool l9_2411;
if (!l9_2410)
{
l9_2411=N2_uv.x>l9_2407.y;
}
else
{
l9_2411=l9_2410;
}
if (l9_2411)
{
discard_fragment();
}
N2_uv=float2(0.0+(((N2_uv.x-l9_2407.x)*1.0)/((l9_2407.y-l9_2407.x)+1e-06)),N2_uv.y);
if (N2_ENABLE_TRAILTEXTURE)
{
float2 l9_2412=float2(N2_uv.x,1.0-N2_uv.y);
float4 l9_2413=float4(0.0);
int l9_2414=0;
if ((int(trailTexHasSwappedViews_tmp)!=0))
{
int l9_2415=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2415=0;
}
else
{
l9_2415=in.varStereoViewID;
}
int l9_2416=l9_2415;
l9_2414=1-l9_2416;
}
else
{
int l9_2417=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2417=0;
}
else
{
l9_2417=in.varStereoViewID;
}
int l9_2418=l9_2417;
l9_2414=l9_2418;
}
int l9_2419=l9_2414;
int l9_2420=trailTexLayout_tmp;
int l9_2421=l9_2419;
float2 l9_2422=l9_2412;
bool l9_2423=(int(SC_USE_UV_TRANSFORM_trailTex_tmp)!=0);
float3x3 l9_2424=(*sc_set0.UserUniforms).trailTexTransform;
int2 l9_2425=int2(SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp);
bool l9_2426=(int(SC_USE_UV_MIN_MAX_trailTex_tmp)!=0);
float4 l9_2427=(*sc_set0.UserUniforms).trailTexUvMinMax;
bool l9_2428=(int(SC_USE_CLAMP_TO_BORDER_trailTex_tmp)!=0);
float4 l9_2429=(*sc_set0.UserUniforms).trailTexBorderColor;
float l9_2430=0.0;
bool l9_2431=l9_2428&&(!l9_2426);
float l9_2432=1.0;
float l9_2433=l9_2422.x;
int l9_2434=l9_2425.x;
if (l9_2434==1)
{
l9_2433=fract(l9_2433);
}
else
{
if (l9_2434==2)
{
float l9_2435=fract(l9_2433);
float l9_2436=l9_2433-l9_2435;
float l9_2437=step(0.25,fract(l9_2436*0.5));
l9_2433=mix(l9_2435,1.0-l9_2435,fast::clamp(l9_2437,0.0,1.0));
}
}
l9_2422.x=l9_2433;
float l9_2438=l9_2422.y;
int l9_2439=l9_2425.y;
if (l9_2439==1)
{
l9_2438=fract(l9_2438);
}
else
{
if (l9_2439==2)
{
float l9_2440=fract(l9_2438);
float l9_2441=l9_2438-l9_2440;
float l9_2442=step(0.25,fract(l9_2441*0.5));
l9_2438=mix(l9_2440,1.0-l9_2440,fast::clamp(l9_2442,0.0,1.0));
}
}
l9_2422.y=l9_2438;
if (l9_2426)
{
bool l9_2443=l9_2428;
bool l9_2444;
if (l9_2443)
{
l9_2444=l9_2425.x==3;
}
else
{
l9_2444=l9_2443;
}
float l9_2445=l9_2422.x;
float l9_2446=l9_2427.x;
float l9_2447=l9_2427.z;
bool l9_2448=l9_2444;
float l9_2449=l9_2432;
float l9_2450=fast::clamp(l9_2445,l9_2446,l9_2447);
float l9_2451=step(abs(l9_2445-l9_2450),9.9999997e-06);
l9_2449*=(l9_2451+((1.0-float(l9_2448))*(1.0-l9_2451)));
l9_2445=l9_2450;
l9_2422.x=l9_2445;
l9_2432=l9_2449;
bool l9_2452=l9_2428;
bool l9_2453;
if (l9_2452)
{
l9_2453=l9_2425.y==3;
}
else
{
l9_2453=l9_2452;
}
float l9_2454=l9_2422.y;
float l9_2455=l9_2427.y;
float l9_2456=l9_2427.w;
bool l9_2457=l9_2453;
float l9_2458=l9_2432;
float l9_2459=fast::clamp(l9_2454,l9_2455,l9_2456);
float l9_2460=step(abs(l9_2454-l9_2459),9.9999997e-06);
l9_2458*=(l9_2460+((1.0-float(l9_2457))*(1.0-l9_2460)));
l9_2454=l9_2459;
l9_2422.y=l9_2454;
l9_2432=l9_2458;
}
float2 l9_2461=l9_2422;
bool l9_2462=l9_2423;
float3x3 l9_2463=l9_2424;
if (l9_2462)
{
l9_2461=float2((l9_2463*float3(l9_2461,1.0)).xy);
}
float2 l9_2464=l9_2461;
float2 l9_2465=l9_2464;
float2 l9_2466=l9_2465;
l9_2422=l9_2466;
float l9_2467=l9_2422.x;
int l9_2468=l9_2425.x;
bool l9_2469=l9_2431;
float l9_2470=l9_2432;
if ((l9_2468==0)||(l9_2468==3))
{
float l9_2471=l9_2467;
float l9_2472=0.0;
float l9_2473=1.0;
bool l9_2474=l9_2469;
float l9_2475=l9_2470;
float l9_2476=fast::clamp(l9_2471,l9_2472,l9_2473);
float l9_2477=step(abs(l9_2471-l9_2476),9.9999997e-06);
l9_2475*=(l9_2477+((1.0-float(l9_2474))*(1.0-l9_2477)));
l9_2471=l9_2476;
l9_2467=l9_2471;
l9_2470=l9_2475;
}
l9_2422.x=l9_2467;
l9_2432=l9_2470;
float l9_2478=l9_2422.y;
int l9_2479=l9_2425.y;
bool l9_2480=l9_2431;
float l9_2481=l9_2432;
if ((l9_2479==0)||(l9_2479==3))
{
float l9_2482=l9_2478;
float l9_2483=0.0;
float l9_2484=1.0;
bool l9_2485=l9_2480;
float l9_2486=l9_2481;
float l9_2487=fast::clamp(l9_2482,l9_2483,l9_2484);
float l9_2488=step(abs(l9_2482-l9_2487),9.9999997e-06);
l9_2486*=(l9_2488+((1.0-float(l9_2485))*(1.0-l9_2488)));
l9_2482=l9_2487;
l9_2478=l9_2482;
l9_2481=l9_2486;
}
l9_2422.y=l9_2478;
l9_2432=l9_2481;
float2 l9_2489=l9_2422;
int l9_2490=l9_2420;
int l9_2491=l9_2421;
float l9_2492=l9_2430;
float2 l9_2493=l9_2489;
int l9_2494=l9_2490;
int l9_2495=l9_2491;
float3 l9_2496=float3(0.0);
if (l9_2494==0)
{
l9_2496=float3(l9_2493,0.0);
}
else
{
if (l9_2494==1)
{
l9_2496=float3(l9_2493.x,(l9_2493.y*0.5)+(0.5-(float(l9_2495)*0.5)),0.0);
}
else
{
l9_2496=float3(l9_2493,float(l9_2495));
}
}
float3 l9_2497=l9_2496;
float3 l9_2498=l9_2497;
float2 l9_2499=l9_2498.xy;
float l9_2500=l9_2492;
float4 l9_2501=sc_set0.trailTex.sample(sc_set0.trailTexSmpSC,l9_2499,bias(l9_2500));
float4 l9_2502=l9_2501;
float4 l9_2503=l9_2502;
if (l9_2428)
{
l9_2503=mix(l9_2429,l9_2503,float4(l9_2432));
}
float4 l9_2504=l9_2503;
l9_2413=l9_2504;
float4 l9_2505=l9_2413;
l9_2404=l9_2505;
}
float l9_2506=fast::max(1e-06,N2_fadeInOut.x);
float l9_2507=N2_timeValuesIn.w;
l9_2403*=mix(0.0,1.0,fast::clamp(l9_2507,0.0,l9_2506)/l9_2506);
l9_2506=fast::max(1e-06,N2_fadeInOut.y);
l9_2403*=mix(0.0,1.0,fast::clamp(1.0-l9_2507,0.0,l9_2506)/l9_2506);
if (!N2_ENABLE_INDEPENDENTTRAIL)
{
l9_2395=N2_trailHeadTime.y;
l9_2506=fast::max(1e-06,N2_fadeInOut.z);
l9_2403*=mix(0.0,1.0,fast::clamp(l9_2395,0.0,l9_2506)/l9_2506);
l9_2506=fast::max(1e-06,N2_fadeInOut.w);
l9_2403*=mix(0.0,1.0,fast::clamp(1.0-l9_2395,0.0,l9_2506)/l9_2506);
}
if (N2_ENABLE_TRAILCOLORRAMP)
{
float2 l9_2508=float2(0.0);
l9_2508=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_2509=l9_2508;
float2 l9_2510=float2(0.0);
l9_2510=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_2511=l9_2510;
float l9_2512=ceil(l9_2395*l9_2509.x)/l9_2511.x;
float2 l9_2513=float2(l9_2512,0.5);
float4 l9_2514=float4(0.0);
int l9_2515=0;
if ((int(trailColorRampTexHasSwappedViews_tmp)!=0))
{
int l9_2516=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2516=0;
}
else
{
l9_2516=in.varStereoViewID;
}
int l9_2517=l9_2516;
l9_2515=1-l9_2517;
}
else
{
int l9_2518=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2518=0;
}
else
{
l9_2518=in.varStereoViewID;
}
int l9_2519=l9_2518;
l9_2515=l9_2519;
}
int l9_2520=l9_2515;
int l9_2521=trailColorRampTexLayout_tmp;
int l9_2522=l9_2520;
float2 l9_2523=l9_2513;
bool l9_2524=(int(SC_USE_UV_TRANSFORM_trailColorRampTex_tmp)!=0);
float3x3 l9_2525=(*sc_set0.UserUniforms).trailColorRampTexTransform;
int2 l9_2526=int2(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp);
bool l9_2527=(int(SC_USE_UV_MIN_MAX_trailColorRampTex_tmp)!=0);
float4 l9_2528=(*sc_set0.UserUniforms).trailColorRampTexUvMinMax;
bool l9_2529=(int(SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp)!=0);
float4 l9_2530=(*sc_set0.UserUniforms).trailColorRampTexBorderColor;
float l9_2531=0.0;
bool l9_2532=l9_2529&&(!l9_2527);
float l9_2533=1.0;
float l9_2534=l9_2523.x;
int l9_2535=l9_2526.x;
if (l9_2535==1)
{
l9_2534=fract(l9_2534);
}
else
{
if (l9_2535==2)
{
float l9_2536=fract(l9_2534);
float l9_2537=l9_2534-l9_2536;
float l9_2538=step(0.25,fract(l9_2537*0.5));
l9_2534=mix(l9_2536,1.0-l9_2536,fast::clamp(l9_2538,0.0,1.0));
}
}
l9_2523.x=l9_2534;
float l9_2539=l9_2523.y;
int l9_2540=l9_2526.y;
if (l9_2540==1)
{
l9_2539=fract(l9_2539);
}
else
{
if (l9_2540==2)
{
float l9_2541=fract(l9_2539);
float l9_2542=l9_2539-l9_2541;
float l9_2543=step(0.25,fract(l9_2542*0.5));
l9_2539=mix(l9_2541,1.0-l9_2541,fast::clamp(l9_2543,0.0,1.0));
}
}
l9_2523.y=l9_2539;
if (l9_2527)
{
bool l9_2544=l9_2529;
bool l9_2545;
if (l9_2544)
{
l9_2545=l9_2526.x==3;
}
else
{
l9_2545=l9_2544;
}
float l9_2546=l9_2523.x;
float l9_2547=l9_2528.x;
float l9_2548=l9_2528.z;
bool l9_2549=l9_2545;
float l9_2550=l9_2533;
float l9_2551=fast::clamp(l9_2546,l9_2547,l9_2548);
float l9_2552=step(abs(l9_2546-l9_2551),9.9999997e-06);
l9_2550*=(l9_2552+((1.0-float(l9_2549))*(1.0-l9_2552)));
l9_2546=l9_2551;
l9_2523.x=l9_2546;
l9_2533=l9_2550;
bool l9_2553=l9_2529;
bool l9_2554;
if (l9_2553)
{
l9_2554=l9_2526.y==3;
}
else
{
l9_2554=l9_2553;
}
float l9_2555=l9_2523.y;
float l9_2556=l9_2528.y;
float l9_2557=l9_2528.w;
bool l9_2558=l9_2554;
float l9_2559=l9_2533;
float l9_2560=fast::clamp(l9_2555,l9_2556,l9_2557);
float l9_2561=step(abs(l9_2555-l9_2560),9.9999997e-06);
l9_2559*=(l9_2561+((1.0-float(l9_2558))*(1.0-l9_2561)));
l9_2555=l9_2560;
l9_2523.y=l9_2555;
l9_2533=l9_2559;
}
float2 l9_2562=l9_2523;
bool l9_2563=l9_2524;
float3x3 l9_2564=l9_2525;
if (l9_2563)
{
l9_2562=float2((l9_2564*float3(l9_2562,1.0)).xy);
}
float2 l9_2565=l9_2562;
float2 l9_2566=l9_2565;
float2 l9_2567=l9_2566;
l9_2523=l9_2567;
float l9_2568=l9_2523.x;
int l9_2569=l9_2526.x;
bool l9_2570=l9_2532;
float l9_2571=l9_2533;
if ((l9_2569==0)||(l9_2569==3))
{
float l9_2572=l9_2568;
float l9_2573=0.0;
float l9_2574=1.0;
bool l9_2575=l9_2570;
float l9_2576=l9_2571;
float l9_2577=fast::clamp(l9_2572,l9_2573,l9_2574);
float l9_2578=step(abs(l9_2572-l9_2577),9.9999997e-06);
l9_2576*=(l9_2578+((1.0-float(l9_2575))*(1.0-l9_2578)));
l9_2572=l9_2577;
l9_2568=l9_2572;
l9_2571=l9_2576;
}
l9_2523.x=l9_2568;
l9_2533=l9_2571;
float l9_2579=l9_2523.y;
int l9_2580=l9_2526.y;
bool l9_2581=l9_2532;
float l9_2582=l9_2533;
if ((l9_2580==0)||(l9_2580==3))
{
float l9_2583=l9_2579;
float l9_2584=0.0;
float l9_2585=1.0;
bool l9_2586=l9_2581;
float l9_2587=l9_2582;
float l9_2588=fast::clamp(l9_2583,l9_2584,l9_2585);
float l9_2589=step(abs(l9_2583-l9_2588),9.9999997e-06);
l9_2587*=(l9_2589+((1.0-float(l9_2586))*(1.0-l9_2589)));
l9_2583=l9_2588;
l9_2579=l9_2583;
l9_2582=l9_2587;
}
l9_2523.y=l9_2579;
l9_2533=l9_2582;
float2 l9_2590=l9_2523;
int l9_2591=l9_2521;
int l9_2592=l9_2522;
float l9_2593=l9_2531;
float2 l9_2594=l9_2590;
int l9_2595=l9_2591;
int l9_2596=l9_2592;
float3 l9_2597=float3(0.0);
if (l9_2595==0)
{
l9_2597=float3(l9_2594,0.0);
}
else
{
if (l9_2595==1)
{
l9_2597=float3(l9_2594.x,(l9_2594.y*0.5)+(0.5-(float(l9_2596)*0.5)),0.0);
}
else
{
l9_2597=float3(l9_2594,float(l9_2596));
}
}
float3 l9_2598=l9_2597;
float3 l9_2599=l9_2598;
float2 l9_2600=l9_2599.xy;
float l9_2601=l9_2593;
float4 l9_2602=sc_set0.trailColorRampTex.sample(sc_set0.trailColorRampTexSmpSC,l9_2600,bias(l9_2601));
float4 l9_2603=l9_2602;
float4 l9_2604=l9_2603;
if (l9_2529)
{
l9_2604=mix(l9_2530,l9_2604,float4(l9_2533));
}
float4 l9_2605=l9_2604;
l9_2514=l9_2605;
float4 l9_2606=l9_2514;
l9_2404*=l9_2606;
}
}
}
float4 l9_2607=float4(0.0);
float3 l9_2608=float3(0.0);
float3 l9_2609=float3(0.0);
float l9_2610=0.0;
float l9_2611=0.0;
if (N2_ENABLE_COLORMINMAX)
{
l9_2608=mix(N2_colorMinStart,N2_colorMaxStart,l9_2399);
l9_2609=mix(N2_colorMinEnd,N2_colorMaxEnd,l9_2399);
}
else
{
l9_2608=N2_colorStart;
l9_2609=N2_colorEnd;
}
if (N2_ENABLE_ALPHAMINMAX)
{
l9_2610=mix(N2_alphaMinStart,N2_alphaMaxStart,l9_2400);
l9_2611=mix(N2_alphaMinEnd,N2_alphaMaxEnd,l9_2400);
}
else
{
l9_2610=N2_alphaStart;
l9_2611=N2_alphaEnd;
}
l9_2608=mix(l9_2608,l9_2609,float3(l9_2395));
l9_2610=mix(l9_2610,l9_2611,l9_2395);
l9_2607=float4(l9_2608,l9_2610);
float4 l9_2612=float4(0.0);
float2 l9_2613=float2(0.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
float2 l9_2614=tempGlobals.Surface_UVCoord0;
l9_2613=l9_2614;
float2 l9_2615=l9_2613;
float l9_2616=fast::max(N2_timeValuesIn.x,1e-06);
float l9_2617=fast::max(N2_timeValuesIn.y,1e-06);
float l9_2618=N2_timeValuesIn.z;
if (N2_ENABLE_FLIPBOOKBYLIFE)
{
float l9_2619=mix(l9_2616,l9_2617,l9_2402);
l9_2618/=l9_2619;
}
float l9_2620=floor((N2_flipBookRandomStart+1.0)*l9_2401);
float2 l9_2621=l9_2613;
float2 l9_2622=N2_gridSize;
float l9_2623=N2_numValidFrames;
float l9_2624=l9_2620;
float l9_2625=N2_flipBookSpeedMult;
float l9_2626=l9_2618;
float l9_2627=floor(l9_2622.x);
float l9_2628=floor(l9_2622.y);
float l9_2629=1.0/l9_2627;
float l9_2630=1.0/l9_2628;
float l9_2631=fast::min(l9_2627*l9_2628,floor(l9_2623));
float l9_2632=floor(mod((l9_2626*l9_2625)+floor(l9_2624),l9_2631));
float l9_2633=floor(l9_2632/l9_2627);
float l9_2634=mod(l9_2632,l9_2627);
float2 l9_2635=float2((l9_2629*l9_2621.x)+(l9_2634*l9_2629),((1.0-l9_2630)-(l9_2633*l9_2630))+(l9_2630*l9_2621.y));
l9_2613=l9_2635;
float2 l9_2636=l9_2613;
float4 l9_2637=float4(0.0);
int l9_2638=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_2639=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2639=0;
}
else
{
l9_2639=in.varStereoViewID;
}
int l9_2640=l9_2639;
l9_2638=1-l9_2640;
}
else
{
int l9_2641=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2641=0;
}
else
{
l9_2641=in.varStereoViewID;
}
int l9_2642=l9_2641;
l9_2638=l9_2642;
}
int l9_2643=l9_2638;
int l9_2644=mainTextureLayout_tmp;
int l9_2645=l9_2643;
float2 l9_2646=l9_2636;
bool l9_2647=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_2648=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_2649=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_2650=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_2651=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_2652=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_2653=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_2654=0.0;
bool l9_2655=l9_2652&&(!l9_2650);
float l9_2656=1.0;
float l9_2657=l9_2646.x;
int l9_2658=l9_2649.x;
if (l9_2658==1)
{
l9_2657=fract(l9_2657);
}
else
{
if (l9_2658==2)
{
float l9_2659=fract(l9_2657);
float l9_2660=l9_2657-l9_2659;
float l9_2661=step(0.25,fract(l9_2660*0.5));
l9_2657=mix(l9_2659,1.0-l9_2659,fast::clamp(l9_2661,0.0,1.0));
}
}
l9_2646.x=l9_2657;
float l9_2662=l9_2646.y;
int l9_2663=l9_2649.y;
if (l9_2663==1)
{
l9_2662=fract(l9_2662);
}
else
{
if (l9_2663==2)
{
float l9_2664=fract(l9_2662);
float l9_2665=l9_2662-l9_2664;
float l9_2666=step(0.25,fract(l9_2665*0.5));
l9_2662=mix(l9_2664,1.0-l9_2664,fast::clamp(l9_2666,0.0,1.0));
}
}
l9_2646.y=l9_2662;
if (l9_2650)
{
bool l9_2667=l9_2652;
bool l9_2668;
if (l9_2667)
{
l9_2668=l9_2649.x==3;
}
else
{
l9_2668=l9_2667;
}
float l9_2669=l9_2646.x;
float l9_2670=l9_2651.x;
float l9_2671=l9_2651.z;
bool l9_2672=l9_2668;
float l9_2673=l9_2656;
float l9_2674=fast::clamp(l9_2669,l9_2670,l9_2671);
float l9_2675=step(abs(l9_2669-l9_2674),9.9999997e-06);
l9_2673*=(l9_2675+((1.0-float(l9_2672))*(1.0-l9_2675)));
l9_2669=l9_2674;
l9_2646.x=l9_2669;
l9_2656=l9_2673;
bool l9_2676=l9_2652;
bool l9_2677;
if (l9_2676)
{
l9_2677=l9_2649.y==3;
}
else
{
l9_2677=l9_2676;
}
float l9_2678=l9_2646.y;
float l9_2679=l9_2651.y;
float l9_2680=l9_2651.w;
bool l9_2681=l9_2677;
float l9_2682=l9_2656;
float l9_2683=fast::clamp(l9_2678,l9_2679,l9_2680);
float l9_2684=step(abs(l9_2678-l9_2683),9.9999997e-06);
l9_2682*=(l9_2684+((1.0-float(l9_2681))*(1.0-l9_2684)));
l9_2678=l9_2683;
l9_2646.y=l9_2678;
l9_2656=l9_2682;
}
float2 l9_2685=l9_2646;
bool l9_2686=l9_2647;
float3x3 l9_2687=l9_2648;
if (l9_2686)
{
l9_2685=float2((l9_2687*float3(l9_2685,1.0)).xy);
}
float2 l9_2688=l9_2685;
float2 l9_2689=l9_2688;
float2 l9_2690=l9_2689;
l9_2646=l9_2690;
float l9_2691=l9_2646.x;
int l9_2692=l9_2649.x;
bool l9_2693=l9_2655;
float l9_2694=l9_2656;
if ((l9_2692==0)||(l9_2692==3))
{
float l9_2695=l9_2691;
float l9_2696=0.0;
float l9_2697=1.0;
bool l9_2698=l9_2693;
float l9_2699=l9_2694;
float l9_2700=fast::clamp(l9_2695,l9_2696,l9_2697);
float l9_2701=step(abs(l9_2695-l9_2700),9.9999997e-06);
l9_2699*=(l9_2701+((1.0-float(l9_2698))*(1.0-l9_2701)));
l9_2695=l9_2700;
l9_2691=l9_2695;
l9_2694=l9_2699;
}
l9_2646.x=l9_2691;
l9_2656=l9_2694;
float l9_2702=l9_2646.y;
int l9_2703=l9_2649.y;
bool l9_2704=l9_2655;
float l9_2705=l9_2656;
if ((l9_2703==0)||(l9_2703==3))
{
float l9_2706=l9_2702;
float l9_2707=0.0;
float l9_2708=1.0;
bool l9_2709=l9_2704;
float l9_2710=l9_2705;
float l9_2711=fast::clamp(l9_2706,l9_2707,l9_2708);
float l9_2712=step(abs(l9_2706-l9_2711),9.9999997e-06);
l9_2710*=(l9_2712+((1.0-float(l9_2709))*(1.0-l9_2712)));
l9_2706=l9_2711;
l9_2702=l9_2706;
l9_2705=l9_2710;
}
l9_2646.y=l9_2702;
l9_2656=l9_2705;
float2 l9_2713=l9_2646;
int l9_2714=l9_2644;
int l9_2715=l9_2645;
float l9_2716=l9_2654;
float2 l9_2717=l9_2713;
int l9_2718=l9_2714;
int l9_2719=l9_2715;
float3 l9_2720=float3(0.0);
if (l9_2718==0)
{
l9_2720=float3(l9_2717,0.0);
}
else
{
if (l9_2718==1)
{
l9_2720=float3(l9_2717.x,(l9_2717.y*0.5)+(0.5-(float(l9_2719)*0.5)),0.0);
}
else
{
l9_2720=float3(l9_2717,float(l9_2719));
}
}
float3 l9_2721=l9_2720;
float3 l9_2722=l9_2721;
float2 l9_2723=l9_2722.xy;
float l9_2724=l9_2716;
float4 l9_2725=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_2723,bias(l9_2724));
float4 l9_2726=l9_2725;
float4 l9_2727=l9_2726;
if (l9_2652)
{
l9_2727=mix(l9_2653,l9_2727,float4(l9_2656));
}
float4 l9_2728=l9_2727;
l9_2637=l9_2728;
float4 l9_2729=l9_2637;
l9_2612=l9_2729;
if (N2_ENABLE_FLIPBOOKBLEND)
{
float2 l9_2730=l9_2615;
float2 l9_2731=N2_gridSize;
float l9_2732=N2_numValidFrames;
float l9_2733=floor(mod(l9_2620+1.0,N2_numValidFrames));
float l9_2734=N2_flipBookSpeedMult;
float l9_2735=l9_2618;
float l9_2736=floor(l9_2731.x);
float l9_2737=floor(l9_2731.y);
float l9_2738=1.0/l9_2736;
float l9_2739=1.0/l9_2737;
float l9_2740=fast::min(l9_2736*l9_2737,floor(l9_2732));
float l9_2741=floor(mod((l9_2735*l9_2734)+floor(l9_2733),l9_2740));
float l9_2742=floor(l9_2741/l9_2736);
float l9_2743=mod(l9_2741,l9_2736);
float2 l9_2744=float2((l9_2738*l9_2730.x)+(l9_2743*l9_2738),((1.0-l9_2739)-(l9_2742*l9_2739))+(l9_2739*l9_2730.y));
l9_2615=l9_2744;
float4 l9_2745=l9_2612;
float2 l9_2746=l9_2615;
float4 l9_2747=float4(0.0);
int l9_2748=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_2749=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2749=0;
}
else
{
l9_2749=in.varStereoViewID;
}
int l9_2750=l9_2749;
l9_2748=1-l9_2750;
}
else
{
int l9_2751=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2751=0;
}
else
{
l9_2751=in.varStereoViewID;
}
int l9_2752=l9_2751;
l9_2748=l9_2752;
}
int l9_2753=l9_2748;
int l9_2754=mainTextureLayout_tmp;
int l9_2755=l9_2753;
float2 l9_2756=l9_2746;
bool l9_2757=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_2758=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_2759=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_2760=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_2761=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_2762=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_2763=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_2764=0.0;
bool l9_2765=l9_2762&&(!l9_2760);
float l9_2766=1.0;
float l9_2767=l9_2756.x;
int l9_2768=l9_2759.x;
if (l9_2768==1)
{
l9_2767=fract(l9_2767);
}
else
{
if (l9_2768==2)
{
float l9_2769=fract(l9_2767);
float l9_2770=l9_2767-l9_2769;
float l9_2771=step(0.25,fract(l9_2770*0.5));
l9_2767=mix(l9_2769,1.0-l9_2769,fast::clamp(l9_2771,0.0,1.0));
}
}
l9_2756.x=l9_2767;
float l9_2772=l9_2756.y;
int l9_2773=l9_2759.y;
if (l9_2773==1)
{
l9_2772=fract(l9_2772);
}
else
{
if (l9_2773==2)
{
float l9_2774=fract(l9_2772);
float l9_2775=l9_2772-l9_2774;
float l9_2776=step(0.25,fract(l9_2775*0.5));
l9_2772=mix(l9_2774,1.0-l9_2774,fast::clamp(l9_2776,0.0,1.0));
}
}
l9_2756.y=l9_2772;
if (l9_2760)
{
bool l9_2777=l9_2762;
bool l9_2778;
if (l9_2777)
{
l9_2778=l9_2759.x==3;
}
else
{
l9_2778=l9_2777;
}
float l9_2779=l9_2756.x;
float l9_2780=l9_2761.x;
float l9_2781=l9_2761.z;
bool l9_2782=l9_2778;
float l9_2783=l9_2766;
float l9_2784=fast::clamp(l9_2779,l9_2780,l9_2781);
float l9_2785=step(abs(l9_2779-l9_2784),9.9999997e-06);
l9_2783*=(l9_2785+((1.0-float(l9_2782))*(1.0-l9_2785)));
l9_2779=l9_2784;
l9_2756.x=l9_2779;
l9_2766=l9_2783;
bool l9_2786=l9_2762;
bool l9_2787;
if (l9_2786)
{
l9_2787=l9_2759.y==3;
}
else
{
l9_2787=l9_2786;
}
float l9_2788=l9_2756.y;
float l9_2789=l9_2761.y;
float l9_2790=l9_2761.w;
bool l9_2791=l9_2787;
float l9_2792=l9_2766;
float l9_2793=fast::clamp(l9_2788,l9_2789,l9_2790);
float l9_2794=step(abs(l9_2788-l9_2793),9.9999997e-06);
l9_2792*=(l9_2794+((1.0-float(l9_2791))*(1.0-l9_2794)));
l9_2788=l9_2793;
l9_2756.y=l9_2788;
l9_2766=l9_2792;
}
float2 l9_2795=l9_2756;
bool l9_2796=l9_2757;
float3x3 l9_2797=l9_2758;
if (l9_2796)
{
l9_2795=float2((l9_2797*float3(l9_2795,1.0)).xy);
}
float2 l9_2798=l9_2795;
float2 l9_2799=l9_2798;
float2 l9_2800=l9_2799;
l9_2756=l9_2800;
float l9_2801=l9_2756.x;
int l9_2802=l9_2759.x;
bool l9_2803=l9_2765;
float l9_2804=l9_2766;
if ((l9_2802==0)||(l9_2802==3))
{
float l9_2805=l9_2801;
float l9_2806=0.0;
float l9_2807=1.0;
bool l9_2808=l9_2803;
float l9_2809=l9_2804;
float l9_2810=fast::clamp(l9_2805,l9_2806,l9_2807);
float l9_2811=step(abs(l9_2805-l9_2810),9.9999997e-06);
l9_2809*=(l9_2811+((1.0-float(l9_2808))*(1.0-l9_2811)));
l9_2805=l9_2810;
l9_2801=l9_2805;
l9_2804=l9_2809;
}
l9_2756.x=l9_2801;
l9_2766=l9_2804;
float l9_2812=l9_2756.y;
int l9_2813=l9_2759.y;
bool l9_2814=l9_2765;
float l9_2815=l9_2766;
if ((l9_2813==0)||(l9_2813==3))
{
float l9_2816=l9_2812;
float l9_2817=0.0;
float l9_2818=1.0;
bool l9_2819=l9_2814;
float l9_2820=l9_2815;
float l9_2821=fast::clamp(l9_2816,l9_2817,l9_2818);
float l9_2822=step(abs(l9_2816-l9_2821),9.9999997e-06);
l9_2820*=(l9_2822+((1.0-float(l9_2819))*(1.0-l9_2822)));
l9_2816=l9_2821;
l9_2812=l9_2816;
l9_2815=l9_2820;
}
l9_2756.y=l9_2812;
l9_2766=l9_2815;
float2 l9_2823=l9_2756;
int l9_2824=l9_2754;
int l9_2825=l9_2755;
float l9_2826=l9_2764;
float2 l9_2827=l9_2823;
int l9_2828=l9_2824;
int l9_2829=l9_2825;
float3 l9_2830=float3(0.0);
if (l9_2828==0)
{
l9_2830=float3(l9_2827,0.0);
}
else
{
if (l9_2828==1)
{
l9_2830=float3(l9_2827.x,(l9_2827.y*0.5)+(0.5-(float(l9_2829)*0.5)),0.0);
}
else
{
l9_2830=float3(l9_2827,float(l9_2829));
}
}
float3 l9_2831=l9_2830;
float3 l9_2832=l9_2831;
float2 l9_2833=l9_2832.xy;
float l9_2834=l9_2826;
float4 l9_2835=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_2833,bias(l9_2834));
float4 l9_2836=l9_2835;
float4 l9_2837=l9_2836;
if (l9_2762)
{
l9_2837=mix(l9_2763,l9_2837,float4(l9_2766));
}
float4 l9_2838=l9_2837;
l9_2747=l9_2838;
float4 l9_2839=l9_2747;
l9_2612=mix(l9_2745,l9_2839,float4(fract((l9_2618*N2_flipBookSpeedMult)+l9_2620)));
}
}
}
float4 l9_2840=float4(1.0);
if (N2_ENABLE_COLORRAMP)
{
float l9_2841=ceil(l9_2395*N2_texSize.x)/N2_texSize.x;
float l9_2842=l9_2841;
if (N2_ENABLE_NORANDOFFSET)
{
float2 l9_2843=tempGlobals.Surface_UVCoord0;
l9_2842+=(l9_2843.x/N2_texSize.x);
}
float2 l9_2844=float2(l9_2842,0.5);
float4 l9_2845=float4(0.0);
int l9_2846=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_2847=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2847=0;
}
else
{
l9_2847=in.varStereoViewID;
}
int l9_2848=l9_2847;
l9_2846=1-l9_2848;
}
else
{
int l9_2849=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2849=0;
}
else
{
l9_2849=in.varStereoViewID;
}
int l9_2850=l9_2849;
l9_2846=l9_2850;
}
int l9_2851=l9_2846;
int l9_2852=colorRampTextureLayout_tmp;
int l9_2853=l9_2851;
float2 l9_2854=l9_2844;
bool l9_2855=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_2856=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_2857=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_2858=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_2859=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_2860=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_2861=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_2862=0.0;
bool l9_2863=l9_2860&&(!l9_2858);
float l9_2864=1.0;
float l9_2865=l9_2854.x;
int l9_2866=l9_2857.x;
if (l9_2866==1)
{
l9_2865=fract(l9_2865);
}
else
{
if (l9_2866==2)
{
float l9_2867=fract(l9_2865);
float l9_2868=l9_2865-l9_2867;
float l9_2869=step(0.25,fract(l9_2868*0.5));
l9_2865=mix(l9_2867,1.0-l9_2867,fast::clamp(l9_2869,0.0,1.0));
}
}
l9_2854.x=l9_2865;
float l9_2870=l9_2854.y;
int l9_2871=l9_2857.y;
if (l9_2871==1)
{
l9_2870=fract(l9_2870);
}
else
{
if (l9_2871==2)
{
float l9_2872=fract(l9_2870);
float l9_2873=l9_2870-l9_2872;
float l9_2874=step(0.25,fract(l9_2873*0.5));
l9_2870=mix(l9_2872,1.0-l9_2872,fast::clamp(l9_2874,0.0,1.0));
}
}
l9_2854.y=l9_2870;
if (l9_2858)
{
bool l9_2875=l9_2860;
bool l9_2876;
if (l9_2875)
{
l9_2876=l9_2857.x==3;
}
else
{
l9_2876=l9_2875;
}
float l9_2877=l9_2854.x;
float l9_2878=l9_2859.x;
float l9_2879=l9_2859.z;
bool l9_2880=l9_2876;
float l9_2881=l9_2864;
float l9_2882=fast::clamp(l9_2877,l9_2878,l9_2879);
float l9_2883=step(abs(l9_2877-l9_2882),9.9999997e-06);
l9_2881*=(l9_2883+((1.0-float(l9_2880))*(1.0-l9_2883)));
l9_2877=l9_2882;
l9_2854.x=l9_2877;
l9_2864=l9_2881;
bool l9_2884=l9_2860;
bool l9_2885;
if (l9_2884)
{
l9_2885=l9_2857.y==3;
}
else
{
l9_2885=l9_2884;
}
float l9_2886=l9_2854.y;
float l9_2887=l9_2859.y;
float l9_2888=l9_2859.w;
bool l9_2889=l9_2885;
float l9_2890=l9_2864;
float l9_2891=fast::clamp(l9_2886,l9_2887,l9_2888);
float l9_2892=step(abs(l9_2886-l9_2891),9.9999997e-06);
l9_2890*=(l9_2892+((1.0-float(l9_2889))*(1.0-l9_2892)));
l9_2886=l9_2891;
l9_2854.y=l9_2886;
l9_2864=l9_2890;
}
float2 l9_2893=l9_2854;
bool l9_2894=l9_2855;
float3x3 l9_2895=l9_2856;
if (l9_2894)
{
l9_2893=float2((l9_2895*float3(l9_2893,1.0)).xy);
}
float2 l9_2896=l9_2893;
float2 l9_2897=l9_2896;
float2 l9_2898=l9_2897;
l9_2854=l9_2898;
float l9_2899=l9_2854.x;
int l9_2900=l9_2857.x;
bool l9_2901=l9_2863;
float l9_2902=l9_2864;
if ((l9_2900==0)||(l9_2900==3))
{
float l9_2903=l9_2899;
float l9_2904=0.0;
float l9_2905=1.0;
bool l9_2906=l9_2901;
float l9_2907=l9_2902;
float l9_2908=fast::clamp(l9_2903,l9_2904,l9_2905);
float l9_2909=step(abs(l9_2903-l9_2908),9.9999997e-06);
l9_2907*=(l9_2909+((1.0-float(l9_2906))*(1.0-l9_2909)));
l9_2903=l9_2908;
l9_2899=l9_2903;
l9_2902=l9_2907;
}
l9_2854.x=l9_2899;
l9_2864=l9_2902;
float l9_2910=l9_2854.y;
int l9_2911=l9_2857.y;
bool l9_2912=l9_2863;
float l9_2913=l9_2864;
if ((l9_2911==0)||(l9_2911==3))
{
float l9_2914=l9_2910;
float l9_2915=0.0;
float l9_2916=1.0;
bool l9_2917=l9_2912;
float l9_2918=l9_2913;
float l9_2919=fast::clamp(l9_2914,l9_2915,l9_2916);
float l9_2920=step(abs(l9_2914-l9_2919),9.9999997e-06);
l9_2918*=(l9_2920+((1.0-float(l9_2917))*(1.0-l9_2920)));
l9_2914=l9_2919;
l9_2910=l9_2914;
l9_2913=l9_2918;
}
l9_2854.y=l9_2910;
l9_2864=l9_2913;
float2 l9_2921=l9_2854;
int l9_2922=l9_2852;
int l9_2923=l9_2853;
float l9_2924=l9_2862;
float2 l9_2925=l9_2921;
int l9_2926=l9_2922;
int l9_2927=l9_2923;
float3 l9_2928=float3(0.0);
if (l9_2926==0)
{
l9_2928=float3(l9_2925,0.0);
}
else
{
if (l9_2926==1)
{
l9_2928=float3(l9_2925.x,(l9_2925.y*0.5)+(0.5-(float(l9_2927)*0.5)),0.0);
}
else
{
l9_2928=float3(l9_2925,float(l9_2927));
}
}
float3 l9_2929=l9_2928;
float3 l9_2930=l9_2929;
float2 l9_2931=l9_2930.xy;
float l9_2932=l9_2924;
float4 l9_2933=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_2931,bias(l9_2932));
float4 l9_2934=l9_2933;
float4 l9_2935=l9_2934;
if (l9_2860)
{
l9_2935=mix(l9_2861,l9_2935,float4(l9_2864));
}
float4 l9_2936=l9_2935;
l9_2845=l9_2936;
float4 l9_2937=l9_2845;
l9_2840=l9_2937*N2_colorRampMult;
}
float4 l9_2938=float4(1.0);
float4 l9_2939=float4(1.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
N2_uv=l9_2613;
l9_2938=l9_2612;
}
else
{
float2 l9_2940=N2_uv;
float4 l9_2941=float4(0.0);
int l9_2942=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_2943=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2943=0;
}
else
{
l9_2943=in.varStereoViewID;
}
int l9_2944=l9_2943;
l9_2942=1-l9_2944;
}
else
{
int l9_2945=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2945=0;
}
else
{
l9_2945=in.varStereoViewID;
}
int l9_2946=l9_2945;
l9_2942=l9_2946;
}
int l9_2947=l9_2942;
int l9_2948=mainTextureLayout_tmp;
int l9_2949=l9_2947;
float2 l9_2950=l9_2940;
bool l9_2951=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_2952=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_2953=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_2954=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_2955=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_2956=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_2957=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_2958=0.0;
bool l9_2959=l9_2956&&(!l9_2954);
float l9_2960=1.0;
float l9_2961=l9_2950.x;
int l9_2962=l9_2953.x;
if (l9_2962==1)
{
l9_2961=fract(l9_2961);
}
else
{
if (l9_2962==2)
{
float l9_2963=fract(l9_2961);
float l9_2964=l9_2961-l9_2963;
float l9_2965=step(0.25,fract(l9_2964*0.5));
l9_2961=mix(l9_2963,1.0-l9_2963,fast::clamp(l9_2965,0.0,1.0));
}
}
l9_2950.x=l9_2961;
float l9_2966=l9_2950.y;
int l9_2967=l9_2953.y;
if (l9_2967==1)
{
l9_2966=fract(l9_2966);
}
else
{
if (l9_2967==2)
{
float l9_2968=fract(l9_2966);
float l9_2969=l9_2966-l9_2968;
float l9_2970=step(0.25,fract(l9_2969*0.5));
l9_2966=mix(l9_2968,1.0-l9_2968,fast::clamp(l9_2970,0.0,1.0));
}
}
l9_2950.y=l9_2966;
if (l9_2954)
{
bool l9_2971=l9_2956;
bool l9_2972;
if (l9_2971)
{
l9_2972=l9_2953.x==3;
}
else
{
l9_2972=l9_2971;
}
float l9_2973=l9_2950.x;
float l9_2974=l9_2955.x;
float l9_2975=l9_2955.z;
bool l9_2976=l9_2972;
float l9_2977=l9_2960;
float l9_2978=fast::clamp(l9_2973,l9_2974,l9_2975);
float l9_2979=step(abs(l9_2973-l9_2978),9.9999997e-06);
l9_2977*=(l9_2979+((1.0-float(l9_2976))*(1.0-l9_2979)));
l9_2973=l9_2978;
l9_2950.x=l9_2973;
l9_2960=l9_2977;
bool l9_2980=l9_2956;
bool l9_2981;
if (l9_2980)
{
l9_2981=l9_2953.y==3;
}
else
{
l9_2981=l9_2980;
}
float l9_2982=l9_2950.y;
float l9_2983=l9_2955.y;
float l9_2984=l9_2955.w;
bool l9_2985=l9_2981;
float l9_2986=l9_2960;
float l9_2987=fast::clamp(l9_2982,l9_2983,l9_2984);
float l9_2988=step(abs(l9_2982-l9_2987),9.9999997e-06);
l9_2986*=(l9_2988+((1.0-float(l9_2985))*(1.0-l9_2988)));
l9_2982=l9_2987;
l9_2950.y=l9_2982;
l9_2960=l9_2986;
}
float2 l9_2989=l9_2950;
bool l9_2990=l9_2951;
float3x3 l9_2991=l9_2952;
if (l9_2990)
{
l9_2989=float2((l9_2991*float3(l9_2989,1.0)).xy);
}
float2 l9_2992=l9_2989;
float2 l9_2993=l9_2992;
float2 l9_2994=l9_2993;
l9_2950=l9_2994;
float l9_2995=l9_2950.x;
int l9_2996=l9_2953.x;
bool l9_2997=l9_2959;
float l9_2998=l9_2960;
if ((l9_2996==0)||(l9_2996==3))
{
float l9_2999=l9_2995;
float l9_3000=0.0;
float l9_3001=1.0;
bool l9_3002=l9_2997;
float l9_3003=l9_2998;
float l9_3004=fast::clamp(l9_2999,l9_3000,l9_3001);
float l9_3005=step(abs(l9_2999-l9_3004),9.9999997e-06);
l9_3003*=(l9_3005+((1.0-float(l9_3002))*(1.0-l9_3005)));
l9_2999=l9_3004;
l9_2995=l9_2999;
l9_2998=l9_3003;
}
l9_2950.x=l9_2995;
l9_2960=l9_2998;
float l9_3006=l9_2950.y;
int l9_3007=l9_2953.y;
bool l9_3008=l9_2959;
float l9_3009=l9_2960;
if ((l9_3007==0)||(l9_3007==3))
{
float l9_3010=l9_3006;
float l9_3011=0.0;
float l9_3012=1.0;
bool l9_3013=l9_3008;
float l9_3014=l9_3009;
float l9_3015=fast::clamp(l9_3010,l9_3011,l9_3012);
float l9_3016=step(abs(l9_3010-l9_3015),9.9999997e-06);
l9_3014*=(l9_3016+((1.0-float(l9_3013))*(1.0-l9_3016)));
l9_3010=l9_3015;
l9_3006=l9_3010;
l9_3009=l9_3014;
}
l9_2950.y=l9_3006;
l9_2960=l9_3009;
float2 l9_3017=l9_2950;
int l9_3018=l9_2948;
int l9_3019=l9_2949;
float l9_3020=l9_2958;
float2 l9_3021=l9_3017;
int l9_3022=l9_3018;
int l9_3023=l9_3019;
float3 l9_3024=float3(0.0);
if (l9_3022==0)
{
l9_3024=float3(l9_3021,0.0);
}
else
{
if (l9_3022==1)
{
l9_3024=float3(l9_3021.x,(l9_3021.y*0.5)+(0.5-(float(l9_3023)*0.5)),0.0);
}
else
{
l9_3024=float3(l9_3021,float(l9_3023));
}
}
float3 l9_3025=l9_3024;
float3 l9_3026=l9_3025;
float2 l9_3027=l9_3026.xy;
float l9_3028=l9_3020;
float4 l9_3029=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_3027,bias(l9_3028));
float4 l9_3030=l9_3029;
float4 l9_3031=l9_3030;
if (l9_2956)
{
l9_3031=mix(l9_2957,l9_3031,float4(l9_2960));
}
float4 l9_3032=l9_3031;
l9_2941=l9_3032;
float4 l9_3033=l9_2941;
l9_2938=l9_3033;
}
}
if (N2_ENABLE_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_2939=l9_2840;
}
}
N2_result=(l9_2938*l9_2607)*l9_2939;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrail>0.0)
{
N2_result=(l9_2404*l9_2607)*l9_2939;
N2_result.w*=l9_2403;
}
}
if (N2_ENABLE_SCREENFADE)
{
N2_result.w*=N2_cameraFade_trailHeadTime_taper.x;
}
if (N2_ENABLE_ALPHADISSOLVE)
{
float l9_3034=l9_2395*N2_alphaDissolveMult;
N2_result.w=fast::clamp(N2_result.w-l9_3034,0.0,1.0);
}
if (N2_ENABLE_BLACKASALPHA)
{
float l9_3035=length(N2_result.xyz);
N2_result.w=l9_3035;
if (N2_ENABLE_TRAILS)
{
N2_result.w*=l9_2403;
}
}
if (N2_ENABLE_PREMULTIPLIEDCOLOR)
{
float3 l9_3036=N2_result.xyz*N2_result.w;
N2_result=float4(l9_3036.x,l9_3036.y,l9_3036.z,N2_result.w);
}
l9_2369=N2_result;
l9_2343=l9_2369;
param_1=l9_2343;
param_2=param_1;
}
Result_N158=param_2;
FinalColor=Result_N158;
float4 param_4=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_3037=param_4;
float4 l9_3038=l9_3037;
float l9_3039=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3039=l9_3038.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3039=fast::clamp(l9_3038.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3039=fast::clamp(dot(l9_3038.xyz,float3(l9_3038.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_3039=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_3039=(1.0-dot(l9_3038.xyz,float3(0.33333001)))*l9_3038.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3039=(1.0-fast::clamp(dot(l9_3038.xyz,float3(1.0)),0.0,1.0))*l9_3038.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3039=fast::clamp(dot(l9_3038.xyz,float3(1.0)),0.0,1.0)*l9_3038.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_3039=fast::clamp(dot(l9_3038.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3039=fast::clamp(dot(l9_3038.xyz,float3(1.0)),0.0,1.0)*l9_3038.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_3039=dot(l9_3038.xyz,float3(0.33333001))*l9_3038.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_3039=1.0-fast::clamp(dot(l9_3038.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_3039=fast::clamp(dot(l9_3038.xyz,float3(1.0)),0.0,1.0);
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
float l9_3040=l9_3039;
float l9_3041=l9_3040;
float l9_3042=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_3041;
float3 l9_3043=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_3037.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_3044=float4(l9_3043.x,l9_3043.y,l9_3043.z,l9_3042);
param_4=l9_3044;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_4=float4(param_4.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_3045=param_4;
float4 l9_3046=float4(0.0);
float4 l9_3047=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3048=out.FragColor0;
float4 l9_3049=l9_3048;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3049.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3050=l9_3049;
l9_3047=l9_3050;
}
else
{
float4 l9_3051=gl_FragCoord;
float2 l9_3052=l9_3051.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3053=l9_3052;
float2 l9_3054=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3055=1;
int l9_3056=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3056=0;
}
else
{
l9_3056=in.varStereoViewID;
}
int l9_3057=l9_3056;
int l9_3058=l9_3057;
float3 l9_3059=float3(l9_3053,0.0);
int l9_3060=l9_3055;
int l9_3061=l9_3058;
if (l9_3060==1)
{
l9_3059.y=((2.0*l9_3059.y)+float(l9_3061))-1.0;
}
float2 l9_3062=l9_3059.xy;
l9_3054=l9_3062;
}
else
{
l9_3054=l9_3053;
}
float2 l9_3063=l9_3054;
float2 l9_3064=l9_3063;
float2 l9_3065=l9_3064;
int l9_3066=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3067=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3067=0;
}
else
{
l9_3067=in.varStereoViewID;
}
int l9_3068=l9_3067;
l9_3066=1-l9_3068;
}
else
{
int l9_3069=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3069=0;
}
else
{
l9_3069=in.varStereoViewID;
}
int l9_3070=l9_3069;
l9_3066=l9_3070;
}
int l9_3071=l9_3066;
float2 l9_3072=l9_3065;
int l9_3073=l9_3071;
float2 l9_3074=l9_3072;
int l9_3075=l9_3073;
float l9_3076=0.0;
float4 l9_3077=float4(0.0);
float2 l9_3078=l9_3074;
int l9_3079=sc_ScreenTextureLayout_tmp;
int l9_3080=l9_3075;
float l9_3081=l9_3076;
float2 l9_3082=l9_3078;
int l9_3083=l9_3079;
int l9_3084=l9_3080;
float3 l9_3085=float3(0.0);
if (l9_3083==0)
{
l9_3085=float3(l9_3082,0.0);
}
else
{
if (l9_3083==1)
{
l9_3085=float3(l9_3082.x,(l9_3082.y*0.5)+(0.5-(float(l9_3084)*0.5)),0.0);
}
else
{
l9_3085=float3(l9_3082,float(l9_3084));
}
}
float3 l9_3086=l9_3085;
float3 l9_3087=l9_3086;
float2 l9_3088=l9_3087.xy;
float l9_3089=l9_3081;
float4 l9_3090=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3088,bias(l9_3089));
float4 l9_3091=l9_3090;
l9_3077=l9_3091;
float4 l9_3092=l9_3077;
float4 l9_3093=l9_3092;
float4 l9_3094=l9_3093;
l9_3047=l9_3094;
}
float4 l9_3095=l9_3047;
float4 l9_3096=l9_3095;
float3 l9_3097=l9_3096.xyz;
float3 l9_3098=l9_3097;
float3 l9_3099=l9_3045.xyz;
float3 l9_3100=definedBlend(l9_3098,l9_3099,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_3046=float4(l9_3100.x,l9_3100.y,l9_3100.z,l9_3046.w);
float3 l9_3101=mix(l9_3097,l9_3046.xyz,float3(l9_3045.w));
l9_3046=float4(l9_3101.x,l9_3101.y,l9_3101.z,l9_3046.w);
l9_3046.w=1.0;
float4 l9_3102=l9_3046;
param_4=l9_3102;
}
else
{
float4 l9_3103=param_4;
float4 l9_3104=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3104=float4(mix(float3(1.0),l9_3103.xyz,float3(l9_3103.w)),l9_3103.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_3105=l9_3103.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3105=fast::clamp(l9_3105,0.0,1.0);
}
l9_3104=float4(l9_3103.xyz*l9_3105,l9_3105);
}
else
{
l9_3104=l9_3103;
}
}
float4 l9_3106=l9_3104;
param_4=l9_3106;
}
}
}
float4 l9_3107=param_4;
FinalColor=l9_3107;
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
float4 l9_3108=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_3108=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_3108=float4(0.0);
}
float4 l9_3109=l9_3108;
float4 Cost=l9_3109;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_5=in.varPos;
float4 param_6=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_5,param_6,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_7=FinalColor;
float4 l9_3110=param_7;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_3110.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_3110;
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
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float4 VertexColor;
float gInstanceID;
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
float timeGlobal;
float externalTimeInput;
float externalSeed;
float lifeTimeConstant;
float2 lifeTimeMinMax;
float spawnDuration;
float trailLength;
float2 trailTaper;
float trailWidth;
float4 trailSizeRampTexSize;
float4 trailSizeRampTexDims;
float4 trailSizeRampTexView;
float3x3 trailSizeRampTexTransform;
float4 trailSizeRampTexUvMinMax;
float4 trailSizeRampTexBorderColor;
float3 spawnLocation;
float3 spawnBox;
float3 spawnSphere;
float3 noiseMult;
float3 noiseFrequency;
float3 sNoiseMult;
float3 sNoiseFrequency;
float3 velocityMin;
float3 velocityMax;
float3 velocityDrag;
float4 velRampTextureSize;
float4 velRampTextureDims;
float4 velRampTextureView;
float3x3 velRampTextureTransform;
float4 velRampTextureUvMinMax;
float4 velRampTextureBorderColor;
float2 sizeStart;
float3 sizeStart3D;
float2 sizeEnd;
float3 sizeEnd3D;
float2 sizeStartMin;
float3 sizeStartMin3D;
float2 sizeStartMax;
float3 sizeStartMax3D;
float2 sizeEndMin;
float3 sizeEndMin3D;
float2 sizeEndMax;
float3 sizeEndMax3D;
float sizeSpeed;
float4 sizeRampTextureSize;
float4 sizeRampTextureDims;
float4 sizeRampTextureView;
float3x3 sizeRampTextureTransform;
float4 sizeRampTextureUvMinMax;
float4 sizeRampTextureBorderColor;
float gravity;
float3 localForce;
float sizeVelScale;
int ALIGNTOX;
int ALIGNTOY;
int ALIGNTOZ;
float2 rotationRandomX;
float2 rotationRateX;
float2 randomRotationY;
float2 rotationRateY;
float2 rotationRandom;
float2 randomRotationZ;
float2 rotationRate;
float2 rotationRateZ;
float rotationDrag;
int CENTER_BBOX;
float fadeDistanceVisible;
float fadeDistanceInvisible;
float4 trailTexSize;
float4 trailTexDims;
float4 trailTexView;
float3x3 trailTexTransform;
float4 trailTexUvMinMax;
float4 trailTexBorderColor;
float4 trailColorRampTexSize;
float4 trailColorRampTexDims;
float4 trailColorRampTexView;
float3x3 trailColorRampTexTransform;
float4 trailColorRampTexUvMinMax;
float4 trailColorRampTexBorderColor;
float2 trailFadeStartEnd;
float2 trailFadeInOut;
float3 colorStart;
float3 colorEnd;
float3 colorMinStart;
float3 colorMinEnd;
float3 colorMaxStart;
float3 colorMaxEnd;
float alphaStart;
float alphaEnd;
float alphaMinStart;
float alphaMinEnd;
float alphaMaxStart;
float alphaMaxEnd;
float alphaDissolveMult;
float numValidFrames;
float2 gridSize;
float flipBookSpeedMult;
float flipBookRandomStart;
float4 colorRampTextureSize;
float4 colorRampTextureDims;
float4 colorRampTextureView;
float3x3 colorRampTextureTransform;
float4 colorRampTextureUvMinMax;
float4 colorRampTextureBorderColor;
float4 colorRampMult;
float4 mainTextureSize;
float4 mainTextureDims;
float4 mainTextureView;
float3x3 mainTextureTransform;
float4 mainTextureUvMinMax;
float4 mainTextureBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float Port_Input1_N119;
float2 Port_Input1_N138;
float2 Port_Input1_N139;
float2 Port_Input1_N140;
float2 Port_Input1_N144;
float Port_Input1_N069;
float Port_Input1_N068;
float Port_Input1_N110;
float Port_Input1_N154;
float Port_Input1_N216;
float3 Port_Default_N182;
float3 Port_Emissive_N014;
float3 Port_AO_N014;
float3 Port_SpecularAO_N014;
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
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> colorRampTexture [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> mainTexture [[id(3)]];
texture2d<float> materialParamsTex [[id(4)]];
texture2d<float> normalTex [[id(5)]];
texture2d<float> sc_EnvmapDiffuse [[id(6)]];
texture2d<float> sc_EnvmapSpecular [[id(7)]];
texture2d<float> sc_RayTracedAoTexture [[id(16)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(17)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(18)]];
texture2d<float> sc_RayTracedShadowTexture [[id(19)]];
texture2d<float> sc_SSAOTexture [[id(20)]];
texture2d<float> sc_ScreenTexture [[id(21)]];
texture2d<float> sc_ShadowTexture [[id(22)]];
texture2d<float> sizeRampTexture [[id(24)]];
texture2d<float> trailColorRampTex [[id(25)]];
texture2d<float> trailSizeRampTex [[id(26)]];
texture2d<float> trailTex [[id(27)]];
texture2d<float> velRampTexture [[id(28)]];
sampler colorRampTextureSmpSC [[id(29)]];
sampler intensityTextureSmpSC [[id(30)]];
sampler mainTextureSmpSC [[id(31)]];
sampler materialParamsTexSmpSC [[id(32)]];
sampler normalTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(39)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
sampler sizeRampTextureSmpSC [[id(45)]];
sampler trailColorRampTexSmpSC [[id(46)]];
sampler trailSizeRampTexSmpSC [[id(47)]];
sampler trailTexSmpSC [[id(48)]];
sampler velRampTextureSmpSC [[id(49)]];
constant userUniformsObj* UserUniforms [[id(50)]];
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
float Interpolator_gInstanceID [[user(locn13)]];
float4 Interpolator0 [[user(locn14)]];
float4 Interpolator1 [[user(locn15)]];
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
bool N2_isTrailCondition=false;
bool N2_ENABLE_TRAILS=false;
bool N2_ENABLE_INDEPENDENTTRAIL=false;
bool N2_ENABLE_TRAILTEXTURE=false;
bool N2_ENABLE_TRAILCOLORRAMP=false;
float4 N2_fadeInOut=float4(0.0);
float3 N2_colorStart=float3(0.0);
float3 N2_colorEnd=float3(0.0);
bool N2_ENABLE_COLORMINMAX=false;
float3 N2_colorMinStart=float3(0.0);
float3 N2_colorMinEnd=float3(0.0);
float3 N2_colorMaxStart=float3(0.0);
float3 N2_colorMaxEnd=float3(0.0);
bool N2_ENABLE_COLORMONOMIN=false;
float N2_alphaStart=0.0;
float N2_alphaEnd=0.0;
bool N2_ENABLE_ALPHAMINMAX=false;
float N2_alphaMinStart=0.0;
float N2_alphaMinEnd=0.0;
float N2_alphaMaxStart=0.0;
float N2_alphaMaxEnd=0.0;
bool N2_ENABLE_ALPHADISSOLVE=false;
float N2_alphaDissolveMult=0.0;
bool N2_ENABLE_PREMULTIPLIEDCOLOR=false;
bool N2_ENABLE_BLACKASALPHA=false;
bool N2_ENABLE_SCREENFADE=false;
bool N2_ENABLE_FLIPBOOK=false;
float N2_numValidFrames=0.0;
float2 N2_gridSize=float2(0.0);
float N2_flipBookSpeedMult=0.0;
float N2_flipBookRandomStart=0.0;
bool N2_ENABLE_FLIPBOOKBLEND=false;
bool N2_ENABLE_FLIPBOOKBYLIFE=false;
bool N2_ENABLE_COLORRAMP=false;
float2 N2_texSize=float2(0.0);
float4 N2_colorRampMult=float4(0.0);
bool N2_ENABLE_NORANDOFFSET=false;
bool N2_ENABLE_BASETEXTURE=false;
bool N2_ENABLE_WORLDPOSSEED=false;
float N2_externalSeed=0.0;
float4 N2_timeValuesIn=float4(0.0);
float4 N2_cameraFade_trailHeadTime_taper=float4(0.0);
float3 N2_particleSeed=float3(0.0);
float N2_globalSeed=0.0;
float4 N2_result=float4(0.0);
float2 N2_uv=float2(0.0);
float N2_isTrail=0.0;
float2 N2_trailHeadTime=float2(0.0);
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
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.VertexColor=in.varColor;
Globals.gInstanceID=in.Interpolator_gInstanceID;
ssGlobals param=Globals;
ssGlobals tempGlobals;
if ((MESHTYPE_tmp==1)&&(int(PBR_tmp)!=0))
{
float l9_0=0.0;
float l9_1;
if ((int(TRAILS_tmp)!=0))
{
l9_1=1.001;
}
else
{
l9_1=0.001;
}
l9_1-=0.001;
l9_0=l9_1;
float4 l9_2=float4(0.0);
l9_2=param.VertexColor;
float l9_3=0.0;
l9_3=l9_2.x;
float l9_4=0.0;
float l9_5=l9_0;
bool l9_6=(l9_5*1.0)!=0.0;
bool l9_7;
if (l9_6)
{
l9_7=(l9_3*1.0)!=0.0;
}
else
{
l9_7=l9_6;
}
l9_4=float(l9_7);
float2 l9_8=float2(0.0);
float2 l9_9=(*sc_set0.UserUniforms).trailFadeStartEnd;
l9_8=l9_9;
float2 l9_10=float2(0.0);
float l9_11=(*sc_set0.UserUniforms).Port_Input1_N216;
float2 l9_12=float2(0.0);
float2 l9_13;
if (TRAILBEHAVIOR_tmp!=0)
{
l9_13=float2(l9_11);
}
else
{
float2 l9_14=float2(0.0);
float2 l9_15=(*sc_set0.UserUniforms).trailFadeInOut;
l9_14=l9_15;
l9_12=l9_14;
l9_13=l9_12;
}
l9_10=l9_13;
float4 l9_16=float4(0.0);
l9_16=float4(l9_8.x,l9_8.y,l9_16.z,l9_16.w);
l9_16=float4(l9_16.x,l9_16.y,l9_10.x,l9_10.y);
float3 l9_17=float3(0.0);
float3 l9_18=(*sc_set0.UserUniforms).colorStart;
l9_17=l9_18;
float3 l9_19=float3(0.0);
float3 l9_20=(*sc_set0.UserUniforms).colorEnd;
l9_19=l9_20;
float3 l9_21=float3(0.0);
float3 l9_22=(*sc_set0.UserUniforms).colorMinStart;
l9_21=l9_22;
float3 l9_23=float3(0.0);
float3 l9_24=(*sc_set0.UserUniforms).colorMinEnd;
l9_23=l9_24;
float3 l9_25=float3(0.0);
float3 l9_26=(*sc_set0.UserUniforms).colorMaxStart;
l9_25=l9_26;
float3 l9_27=float3(0.0);
float3 l9_28=(*sc_set0.UserUniforms).colorMaxEnd;
l9_27=l9_28;
float l9_29=0.0;
float l9_30=(*sc_set0.UserUniforms).alphaStart;
l9_29=l9_30;
float l9_31=0.0;
float l9_32=(*sc_set0.UserUniforms).alphaEnd;
l9_31=l9_32;
float l9_33=0.0;
float l9_34=(*sc_set0.UserUniforms).alphaMinStart;
l9_33=l9_34;
float l9_35=0.0;
float l9_36=(*sc_set0.UserUniforms).alphaMinEnd;
l9_35=l9_36;
float l9_37=0.0;
float l9_38=(*sc_set0.UserUniforms).alphaMaxStart;
l9_37=l9_38;
float l9_39=0.0;
float l9_40=(*sc_set0.UserUniforms).alphaMaxEnd;
l9_39=l9_40;
float l9_41=0.0;
float l9_42=(*sc_set0.UserUniforms).alphaDissolveMult;
l9_41=l9_42;
float l9_43=0.0;
float l9_44=(*sc_set0.UserUniforms).numValidFrames;
l9_43=l9_44;
float2 l9_45=float2(0.0);
float2 l9_46=(*sc_set0.UserUniforms).gridSize;
l9_45=l9_46;
float l9_47=0.0;
float l9_48=(*sc_set0.UserUniforms).flipBookSpeedMult;
l9_47=l9_48;
float l9_49=0.0;
float l9_50=(*sc_set0.UserUniforms).flipBookRandomStart;
l9_49=l9_50;
float2 l9_51=float2(0.0);
float2 l9_52=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
l9_51=l9_52;
float4 l9_53=float4(0.0);
float4 l9_54=(*sc_set0.UserUniforms).colorRampMult;
l9_53=l9_54;
float l9_55=0.0;
float l9_56=(*sc_set0.UserUniforms).externalSeed;
l9_55=l9_56;
float4 l9_57=float4(0.0);
float4 l9_58;
l9_58.x=in.Interpolator0.x;
l9_58.y=in.Interpolator0.y;
l9_58.z=in.Interpolator0.z;
l9_58.w=in.Interpolator0.w;
l9_57=l9_58;
float4 l9_59=float4(0.0);
float4 l9_60;
l9_60.x=in.Interpolator1.x;
l9_60.y=in.Interpolator1.y;
l9_60.z=in.Interpolator1.z;
l9_60.w=in.Interpolator1.w;
l9_59=l9_60;
float4 l9_61=float4(0.0);
float l9_62=l9_4;
float4 l9_63=l9_16;
float3 l9_64=l9_17;
float3 l9_65=l9_19;
float3 l9_66=l9_21;
float3 l9_67=l9_23;
float3 l9_68=l9_25;
float3 l9_69=l9_27;
float l9_70=l9_29;
float l9_71=l9_31;
float l9_72=l9_33;
float l9_73=l9_35;
float l9_74=l9_37;
float l9_75=l9_39;
float l9_76=l9_41;
float l9_77=l9_43;
float2 l9_78=l9_45;
float l9_79=l9_47;
float l9_80=l9_49;
float2 l9_81=l9_51;
float4 l9_82=l9_53;
float l9_83=l9_55;
float4 l9_84=l9_57;
float4 l9_85=l9_59;
ssGlobals l9_86=param;
tempGlobals=l9_86;
float4 l9_87=float4(0.0);
N2_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N2_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N2_isTrailCondition=l9_62!=0.0;
N2_ENABLE_TRAILTEXTURE=(int(TRAILTEXTURE_tmp)!=0);
N2_ENABLE_TRAILCOLORRAMP=(int(TRAILCOLORRAMP_tmp)!=0);
N2_fadeInOut=l9_63;
N2_colorStart=l9_64;
N2_colorEnd=l9_65;
N2_ENABLE_COLORMINMAX=(int(COLORMINMAX_tmp)!=0);
N2_colorMinStart=l9_66;
N2_colorMinEnd=l9_67;
N2_colorMaxStart=l9_68;
N2_colorMaxEnd=l9_69;
N2_ENABLE_COLORMONOMIN=(int(COLORMONOMIN_tmp)!=0);
N2_alphaStart=l9_70;
N2_alphaEnd=l9_71;
N2_ENABLE_ALPHAMINMAX=(int(ALPHAMINMAX_tmp)!=0);
N2_alphaMinStart=l9_72;
N2_alphaMinEnd=l9_73;
N2_alphaMaxStart=l9_74;
N2_alphaMaxEnd=l9_75;
N2_ENABLE_ALPHADISSOLVE=(int(ALPHADISSOLVE_tmp)!=0);
N2_alphaDissolveMult=l9_76;
N2_ENABLE_PREMULTIPLIEDCOLOR=(int(PREMULTIPLIEDCOLOR_tmp)!=0);
N2_ENABLE_BLACKASALPHA=(int(BLACKASALPHA_tmp)!=0);
N2_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N2_ENABLE_FLIPBOOK=(int(FLIPBOOK_tmp)!=0);
N2_numValidFrames=l9_77;
N2_gridSize=l9_78;
N2_flipBookSpeedMult=l9_79;
N2_flipBookRandomStart=l9_80;
N2_ENABLE_FLIPBOOKBLEND=(int(FLIPBOOKBLEND_tmp)!=0);
N2_ENABLE_FLIPBOOKBYLIFE=(int(FLIPBOOKBYLIFE_tmp)!=0);
N2_ENABLE_COLORRAMP=(int(COLORRAMP_tmp)!=0);
N2_texSize=l9_81;
N2_colorRampMult=l9_82;
N2_ENABLE_NORANDOFFSET=(int(NORANDOFFSET_tmp)!=0);
N2_ENABLE_BASETEXTURE=(int(BASETEXTURE_tmp)!=0);
N2_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N2_externalSeed=l9_83;
N2_timeValuesIn=l9_84;
N2_cameraFade_trailHeadTime_taper=l9_85;
float l9_88=0.0;
if (N2_ENABLE_WORLDPOSSEED)
{
float4x4 l9_89=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_88=length(float4(1.0)*l9_89);
}
N2_globalSeed=N2_externalSeed+l9_88;
int l9_90=0;
l9_90=int(tempGlobals.gInstanceID+0.5);
int l9_91=l9_90;
float l9_92=float(l9_91);
int l9_93=int(l9_92);
int l9_94=l9_93^(l9_93*15299);
int l9_95=l9_94;
int l9_96=l9_95;
int l9_97=((l9_96*((l9_96*1471343)+101146501))+1559861749)&2147483647;
int l9_98=l9_97;
int l9_99=l9_95*1399;
int l9_100=((l9_99*((l9_99*1471343)+101146501))+1559861749)&2147483647;
int l9_101=l9_100;
int l9_102=l9_95*7177;
int l9_103=((l9_102*((l9_102*1471343)+101146501))+1559861749)&2147483647;
int l9_104=l9_103;
int l9_105=l9_98;
float l9_106=float(l9_105)*4.6566129e-10;
int l9_107=l9_101;
float l9_108=float(l9_107)*4.6566129e-10;
int l9_109=l9_104;
float l9_110=float(l9_109)*4.6566129e-10;
float3 l9_111=float3(l9_106,l9_108,l9_110);
float3 l9_112=l9_111;
N2_particleSeed=l9_112;
float l9_113=N2_timeValuesIn.w;
float l9_114=N2_particleSeed.x;
float l9_115=N2_particleSeed.y;
float l9_116=N2_particleSeed.z;
float3 l9_117=fract((float3(l9_114,l9_115,l9_116)*27.21883)+float3(N2_globalSeed));
if (N2_ENABLE_COLORMONOMIN)
{
l9_117=fract((float3(l9_114,l9_114,l9_114)*27.21883)+float3(N2_globalSeed));
}
float l9_118=fract((N2_particleSeed.x*3121.3333)+N2_globalSeed);
float l9_119=fract((N2_particleSeed.y*13.2234)+N2_globalSeed);
float l9_120=fract((N2_particleSeed.z*3.5358)+N2_globalSeed);
N2_isTrail=0.0;
float l9_121=1.0;
N2_trailHeadTime=N2_cameraFade_trailHeadTime_taper.yz;
float4 l9_122=float4(1.0);
float2 l9_123=tempGlobals.Surface_UVCoord0;
N2_uv=l9_123;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrailCondition)
{
N2_isTrail=1.0;
float l9_124=N2_cameraFade_trailHeadTime_taper.w;
float2 l9_125=float2(0.5-(l9_124/2.0),0.5+(l9_124/2.0));
float l9_126=N2_uv.x;
float l9_127=l9_125.x;
bool l9_128=l9_126<l9_127;
bool l9_129;
if (!l9_128)
{
l9_129=N2_uv.x>l9_125.y;
}
else
{
l9_129=l9_128;
}
if (l9_129)
{
discard_fragment();
}
N2_uv=float2(0.0+(((N2_uv.x-l9_125.x)*1.0)/((l9_125.y-l9_125.x)+1e-06)),N2_uv.y);
if (N2_ENABLE_TRAILTEXTURE)
{
float2 l9_130=float2(N2_uv.x,1.0-N2_uv.y);
float4 l9_131=float4(0.0);
int l9_132=0;
if ((int(trailTexHasSwappedViews_tmp)!=0))
{
int l9_133=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_133=0;
}
else
{
l9_133=in.varStereoViewID;
}
int l9_134=l9_133;
l9_132=1-l9_134;
}
else
{
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=in.varStereoViewID;
}
int l9_136=l9_135;
l9_132=l9_136;
}
int l9_137=l9_132;
int l9_138=trailTexLayout_tmp;
int l9_139=l9_137;
float2 l9_140=l9_130;
bool l9_141=(int(SC_USE_UV_TRANSFORM_trailTex_tmp)!=0);
float3x3 l9_142=(*sc_set0.UserUniforms).trailTexTransform;
int2 l9_143=int2(SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp);
bool l9_144=(int(SC_USE_UV_MIN_MAX_trailTex_tmp)!=0);
float4 l9_145=(*sc_set0.UserUniforms).trailTexUvMinMax;
bool l9_146=(int(SC_USE_CLAMP_TO_BORDER_trailTex_tmp)!=0);
float4 l9_147=(*sc_set0.UserUniforms).trailTexBorderColor;
float l9_148=0.0;
bool l9_149=l9_146&&(!l9_144);
float l9_150=1.0;
float l9_151=l9_140.x;
int l9_152=l9_143.x;
if (l9_152==1)
{
l9_151=fract(l9_151);
}
else
{
if (l9_152==2)
{
float l9_153=fract(l9_151);
float l9_154=l9_151-l9_153;
float l9_155=step(0.25,fract(l9_154*0.5));
l9_151=mix(l9_153,1.0-l9_153,fast::clamp(l9_155,0.0,1.0));
}
}
l9_140.x=l9_151;
float l9_156=l9_140.y;
int l9_157=l9_143.y;
if (l9_157==1)
{
l9_156=fract(l9_156);
}
else
{
if (l9_157==2)
{
float l9_158=fract(l9_156);
float l9_159=l9_156-l9_158;
float l9_160=step(0.25,fract(l9_159*0.5));
l9_156=mix(l9_158,1.0-l9_158,fast::clamp(l9_160,0.0,1.0));
}
}
l9_140.y=l9_156;
if (l9_144)
{
bool l9_161=l9_146;
bool l9_162;
if (l9_161)
{
l9_162=l9_143.x==3;
}
else
{
l9_162=l9_161;
}
float l9_163=l9_140.x;
float l9_164=l9_145.x;
float l9_165=l9_145.z;
bool l9_166=l9_162;
float l9_167=l9_150;
float l9_168=fast::clamp(l9_163,l9_164,l9_165);
float l9_169=step(abs(l9_163-l9_168),9.9999997e-06);
l9_167*=(l9_169+((1.0-float(l9_166))*(1.0-l9_169)));
l9_163=l9_168;
l9_140.x=l9_163;
l9_150=l9_167;
bool l9_170=l9_146;
bool l9_171;
if (l9_170)
{
l9_171=l9_143.y==3;
}
else
{
l9_171=l9_170;
}
float l9_172=l9_140.y;
float l9_173=l9_145.y;
float l9_174=l9_145.w;
bool l9_175=l9_171;
float l9_176=l9_150;
float l9_177=fast::clamp(l9_172,l9_173,l9_174);
float l9_178=step(abs(l9_172-l9_177),9.9999997e-06);
l9_176*=(l9_178+((1.0-float(l9_175))*(1.0-l9_178)));
l9_172=l9_177;
l9_140.y=l9_172;
l9_150=l9_176;
}
float2 l9_179=l9_140;
bool l9_180=l9_141;
float3x3 l9_181=l9_142;
if (l9_180)
{
l9_179=float2((l9_181*float3(l9_179,1.0)).xy);
}
float2 l9_182=l9_179;
float2 l9_183=l9_182;
float2 l9_184=l9_183;
l9_140=l9_184;
float l9_185=l9_140.x;
int l9_186=l9_143.x;
bool l9_187=l9_149;
float l9_188=l9_150;
if ((l9_186==0)||(l9_186==3))
{
float l9_189=l9_185;
float l9_190=0.0;
float l9_191=1.0;
bool l9_192=l9_187;
float l9_193=l9_188;
float l9_194=fast::clamp(l9_189,l9_190,l9_191);
float l9_195=step(abs(l9_189-l9_194),9.9999997e-06);
l9_193*=(l9_195+((1.0-float(l9_192))*(1.0-l9_195)));
l9_189=l9_194;
l9_185=l9_189;
l9_188=l9_193;
}
l9_140.x=l9_185;
l9_150=l9_188;
float l9_196=l9_140.y;
int l9_197=l9_143.y;
bool l9_198=l9_149;
float l9_199=l9_150;
if ((l9_197==0)||(l9_197==3))
{
float l9_200=l9_196;
float l9_201=0.0;
float l9_202=1.0;
bool l9_203=l9_198;
float l9_204=l9_199;
float l9_205=fast::clamp(l9_200,l9_201,l9_202);
float l9_206=step(abs(l9_200-l9_205),9.9999997e-06);
l9_204*=(l9_206+((1.0-float(l9_203))*(1.0-l9_206)));
l9_200=l9_205;
l9_196=l9_200;
l9_199=l9_204;
}
l9_140.y=l9_196;
l9_150=l9_199;
float2 l9_207=l9_140;
int l9_208=l9_138;
int l9_209=l9_139;
float l9_210=l9_148;
float2 l9_211=l9_207;
int l9_212=l9_208;
int l9_213=l9_209;
float3 l9_214=float3(0.0);
if (l9_212==0)
{
l9_214=float3(l9_211,0.0);
}
else
{
if (l9_212==1)
{
l9_214=float3(l9_211.x,(l9_211.y*0.5)+(0.5-(float(l9_213)*0.5)),0.0);
}
else
{
l9_214=float3(l9_211,float(l9_213));
}
}
float3 l9_215=l9_214;
float3 l9_216=l9_215;
float2 l9_217=l9_216.xy;
float l9_218=l9_210;
float4 l9_219=sc_set0.trailTex.sample(sc_set0.trailTexSmpSC,l9_217,bias(l9_218));
float4 l9_220=l9_219;
float4 l9_221=l9_220;
if (l9_146)
{
l9_221=mix(l9_147,l9_221,float4(l9_150));
}
float4 l9_222=l9_221;
l9_131=l9_222;
float4 l9_223=l9_131;
l9_122=l9_223;
}
float l9_224=fast::max(1e-06,N2_fadeInOut.x);
float l9_225=N2_timeValuesIn.w;
l9_121*=mix(0.0,1.0,fast::clamp(l9_225,0.0,l9_224)/l9_224);
l9_224=fast::max(1e-06,N2_fadeInOut.y);
l9_121*=mix(0.0,1.0,fast::clamp(1.0-l9_225,0.0,l9_224)/l9_224);
if (!N2_ENABLE_INDEPENDENTTRAIL)
{
l9_113=N2_trailHeadTime.y;
l9_224=fast::max(1e-06,N2_fadeInOut.z);
l9_121*=mix(0.0,1.0,fast::clamp(l9_113,0.0,l9_224)/l9_224);
l9_224=fast::max(1e-06,N2_fadeInOut.w);
l9_121*=mix(0.0,1.0,fast::clamp(1.0-l9_113,0.0,l9_224)/l9_224);
}
if (N2_ENABLE_TRAILCOLORRAMP)
{
float2 l9_226=float2(0.0);
l9_226=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_227=l9_226;
float2 l9_228=float2(0.0);
l9_228=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_229=l9_228;
float l9_230=ceil(l9_113*l9_227.x)/l9_229.x;
float2 l9_231=float2(l9_230,0.5);
float4 l9_232=float4(0.0);
int l9_233=0;
if ((int(trailColorRampTexHasSwappedViews_tmp)!=0))
{
int l9_234=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_234=0;
}
else
{
l9_234=in.varStereoViewID;
}
int l9_235=l9_234;
l9_233=1-l9_235;
}
else
{
int l9_236=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_236=0;
}
else
{
l9_236=in.varStereoViewID;
}
int l9_237=l9_236;
l9_233=l9_237;
}
int l9_238=l9_233;
int l9_239=trailColorRampTexLayout_tmp;
int l9_240=l9_238;
float2 l9_241=l9_231;
bool l9_242=(int(SC_USE_UV_TRANSFORM_trailColorRampTex_tmp)!=0);
float3x3 l9_243=(*sc_set0.UserUniforms).trailColorRampTexTransform;
int2 l9_244=int2(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp);
bool l9_245=(int(SC_USE_UV_MIN_MAX_trailColorRampTex_tmp)!=0);
float4 l9_246=(*sc_set0.UserUniforms).trailColorRampTexUvMinMax;
bool l9_247=(int(SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp)!=0);
float4 l9_248=(*sc_set0.UserUniforms).trailColorRampTexBorderColor;
float l9_249=0.0;
bool l9_250=l9_247&&(!l9_245);
float l9_251=1.0;
float l9_252=l9_241.x;
int l9_253=l9_244.x;
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
l9_241.x=l9_252;
float l9_257=l9_241.y;
int l9_258=l9_244.y;
if (l9_258==1)
{
l9_257=fract(l9_257);
}
else
{
if (l9_258==2)
{
float l9_259=fract(l9_257);
float l9_260=l9_257-l9_259;
float l9_261=step(0.25,fract(l9_260*0.5));
l9_257=mix(l9_259,1.0-l9_259,fast::clamp(l9_261,0.0,1.0));
}
}
l9_241.y=l9_257;
if (l9_245)
{
bool l9_262=l9_247;
bool l9_263;
if (l9_262)
{
l9_263=l9_244.x==3;
}
else
{
l9_263=l9_262;
}
float l9_264=l9_241.x;
float l9_265=l9_246.x;
float l9_266=l9_246.z;
bool l9_267=l9_263;
float l9_268=l9_251;
float l9_269=fast::clamp(l9_264,l9_265,l9_266);
float l9_270=step(abs(l9_264-l9_269),9.9999997e-06);
l9_268*=(l9_270+((1.0-float(l9_267))*(1.0-l9_270)));
l9_264=l9_269;
l9_241.x=l9_264;
l9_251=l9_268;
bool l9_271=l9_247;
bool l9_272;
if (l9_271)
{
l9_272=l9_244.y==3;
}
else
{
l9_272=l9_271;
}
float l9_273=l9_241.y;
float l9_274=l9_246.y;
float l9_275=l9_246.w;
bool l9_276=l9_272;
float l9_277=l9_251;
float l9_278=fast::clamp(l9_273,l9_274,l9_275);
float l9_279=step(abs(l9_273-l9_278),9.9999997e-06);
l9_277*=(l9_279+((1.0-float(l9_276))*(1.0-l9_279)));
l9_273=l9_278;
l9_241.y=l9_273;
l9_251=l9_277;
}
float2 l9_280=l9_241;
bool l9_281=l9_242;
float3x3 l9_282=l9_243;
if (l9_281)
{
l9_280=float2((l9_282*float3(l9_280,1.0)).xy);
}
float2 l9_283=l9_280;
float2 l9_284=l9_283;
float2 l9_285=l9_284;
l9_241=l9_285;
float l9_286=l9_241.x;
int l9_287=l9_244.x;
bool l9_288=l9_250;
float l9_289=l9_251;
if ((l9_287==0)||(l9_287==3))
{
float l9_290=l9_286;
float l9_291=0.0;
float l9_292=1.0;
bool l9_293=l9_288;
float l9_294=l9_289;
float l9_295=fast::clamp(l9_290,l9_291,l9_292);
float l9_296=step(abs(l9_290-l9_295),9.9999997e-06);
l9_294*=(l9_296+((1.0-float(l9_293))*(1.0-l9_296)));
l9_290=l9_295;
l9_286=l9_290;
l9_289=l9_294;
}
l9_241.x=l9_286;
l9_251=l9_289;
float l9_297=l9_241.y;
int l9_298=l9_244.y;
bool l9_299=l9_250;
float l9_300=l9_251;
if ((l9_298==0)||(l9_298==3))
{
float l9_301=l9_297;
float l9_302=0.0;
float l9_303=1.0;
bool l9_304=l9_299;
float l9_305=l9_300;
float l9_306=fast::clamp(l9_301,l9_302,l9_303);
float l9_307=step(abs(l9_301-l9_306),9.9999997e-06);
l9_305*=(l9_307+((1.0-float(l9_304))*(1.0-l9_307)));
l9_301=l9_306;
l9_297=l9_301;
l9_300=l9_305;
}
l9_241.y=l9_297;
l9_251=l9_300;
float2 l9_308=l9_241;
int l9_309=l9_239;
int l9_310=l9_240;
float l9_311=l9_249;
float2 l9_312=l9_308;
int l9_313=l9_309;
int l9_314=l9_310;
float3 l9_315=float3(0.0);
if (l9_313==0)
{
l9_315=float3(l9_312,0.0);
}
else
{
if (l9_313==1)
{
l9_315=float3(l9_312.x,(l9_312.y*0.5)+(0.5-(float(l9_314)*0.5)),0.0);
}
else
{
l9_315=float3(l9_312,float(l9_314));
}
}
float3 l9_316=l9_315;
float3 l9_317=l9_316;
float2 l9_318=l9_317.xy;
float l9_319=l9_311;
float4 l9_320=sc_set0.trailColorRampTex.sample(sc_set0.trailColorRampTexSmpSC,l9_318,bias(l9_319));
float4 l9_321=l9_320;
float4 l9_322=l9_321;
if (l9_247)
{
l9_322=mix(l9_248,l9_322,float4(l9_251));
}
float4 l9_323=l9_322;
l9_232=l9_323;
float4 l9_324=l9_232;
l9_122*=l9_324;
}
}
}
float4 l9_325=float4(0.0);
float3 l9_326=float3(0.0);
float3 l9_327=float3(0.0);
float l9_328=0.0;
float l9_329=0.0;
if (N2_ENABLE_COLORMINMAX)
{
l9_326=mix(N2_colorMinStart,N2_colorMaxStart,l9_117);
l9_327=mix(N2_colorMinEnd,N2_colorMaxEnd,l9_117);
}
else
{
l9_326=N2_colorStart;
l9_327=N2_colorEnd;
}
if (N2_ENABLE_ALPHAMINMAX)
{
l9_328=mix(N2_alphaMinStart,N2_alphaMaxStart,l9_118);
l9_329=mix(N2_alphaMinEnd,N2_alphaMaxEnd,l9_118);
}
else
{
l9_328=N2_alphaStart;
l9_329=N2_alphaEnd;
}
l9_326=mix(l9_326,l9_327,float3(l9_113));
l9_328=mix(l9_328,l9_329,l9_113);
l9_325=float4(l9_326,l9_328);
float4 l9_330=float4(0.0);
float2 l9_331=float2(0.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
float2 l9_332=tempGlobals.Surface_UVCoord0;
l9_331=l9_332;
float2 l9_333=l9_331;
float l9_334=fast::max(N2_timeValuesIn.x,1e-06);
float l9_335=fast::max(N2_timeValuesIn.y,1e-06);
float l9_336=N2_timeValuesIn.z;
if (N2_ENABLE_FLIPBOOKBYLIFE)
{
float l9_337=mix(l9_334,l9_335,l9_120);
l9_336/=l9_337;
}
float l9_338=floor((N2_flipBookRandomStart+1.0)*l9_119);
float2 l9_339=l9_331;
float2 l9_340=N2_gridSize;
float l9_341=N2_numValidFrames;
float l9_342=l9_338;
float l9_343=N2_flipBookSpeedMult;
float l9_344=l9_336;
float l9_345=floor(l9_340.x);
float l9_346=floor(l9_340.y);
float l9_347=1.0/l9_345;
float l9_348=1.0/l9_346;
float l9_349=fast::min(l9_345*l9_346,floor(l9_341));
float l9_350=floor(mod((l9_344*l9_343)+floor(l9_342),l9_349));
float l9_351=floor(l9_350/l9_345);
float l9_352=mod(l9_350,l9_345);
float2 l9_353=float2((l9_347*l9_339.x)+(l9_352*l9_347),((1.0-l9_348)-(l9_351*l9_348))+(l9_348*l9_339.y));
l9_331=l9_353;
float2 l9_354=l9_331;
float4 l9_355=float4(0.0);
int l9_356=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_357=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_357=0;
}
else
{
l9_357=in.varStereoViewID;
}
int l9_358=l9_357;
l9_356=1-l9_358;
}
else
{
int l9_359=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_359=0;
}
else
{
l9_359=in.varStereoViewID;
}
int l9_360=l9_359;
l9_356=l9_360;
}
int l9_361=l9_356;
int l9_362=mainTextureLayout_tmp;
int l9_363=l9_361;
float2 l9_364=l9_354;
bool l9_365=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_366=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_367=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_368=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_369=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_370=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_371=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_372=0.0;
bool l9_373=l9_370&&(!l9_368);
float l9_374=1.0;
float l9_375=l9_364.x;
int l9_376=l9_367.x;
if (l9_376==1)
{
l9_375=fract(l9_375);
}
else
{
if (l9_376==2)
{
float l9_377=fract(l9_375);
float l9_378=l9_375-l9_377;
float l9_379=step(0.25,fract(l9_378*0.5));
l9_375=mix(l9_377,1.0-l9_377,fast::clamp(l9_379,0.0,1.0));
}
}
l9_364.x=l9_375;
float l9_380=l9_364.y;
int l9_381=l9_367.y;
if (l9_381==1)
{
l9_380=fract(l9_380);
}
else
{
if (l9_381==2)
{
float l9_382=fract(l9_380);
float l9_383=l9_380-l9_382;
float l9_384=step(0.25,fract(l9_383*0.5));
l9_380=mix(l9_382,1.0-l9_382,fast::clamp(l9_384,0.0,1.0));
}
}
l9_364.y=l9_380;
if (l9_368)
{
bool l9_385=l9_370;
bool l9_386;
if (l9_385)
{
l9_386=l9_367.x==3;
}
else
{
l9_386=l9_385;
}
float l9_387=l9_364.x;
float l9_388=l9_369.x;
float l9_389=l9_369.z;
bool l9_390=l9_386;
float l9_391=l9_374;
float l9_392=fast::clamp(l9_387,l9_388,l9_389);
float l9_393=step(abs(l9_387-l9_392),9.9999997e-06);
l9_391*=(l9_393+((1.0-float(l9_390))*(1.0-l9_393)));
l9_387=l9_392;
l9_364.x=l9_387;
l9_374=l9_391;
bool l9_394=l9_370;
bool l9_395;
if (l9_394)
{
l9_395=l9_367.y==3;
}
else
{
l9_395=l9_394;
}
float l9_396=l9_364.y;
float l9_397=l9_369.y;
float l9_398=l9_369.w;
bool l9_399=l9_395;
float l9_400=l9_374;
float l9_401=fast::clamp(l9_396,l9_397,l9_398);
float l9_402=step(abs(l9_396-l9_401),9.9999997e-06);
l9_400*=(l9_402+((1.0-float(l9_399))*(1.0-l9_402)));
l9_396=l9_401;
l9_364.y=l9_396;
l9_374=l9_400;
}
float2 l9_403=l9_364;
bool l9_404=l9_365;
float3x3 l9_405=l9_366;
if (l9_404)
{
l9_403=float2((l9_405*float3(l9_403,1.0)).xy);
}
float2 l9_406=l9_403;
float2 l9_407=l9_406;
float2 l9_408=l9_407;
l9_364=l9_408;
float l9_409=l9_364.x;
int l9_410=l9_367.x;
bool l9_411=l9_373;
float l9_412=l9_374;
if ((l9_410==0)||(l9_410==3))
{
float l9_413=l9_409;
float l9_414=0.0;
float l9_415=1.0;
bool l9_416=l9_411;
float l9_417=l9_412;
float l9_418=fast::clamp(l9_413,l9_414,l9_415);
float l9_419=step(abs(l9_413-l9_418),9.9999997e-06);
l9_417*=(l9_419+((1.0-float(l9_416))*(1.0-l9_419)));
l9_413=l9_418;
l9_409=l9_413;
l9_412=l9_417;
}
l9_364.x=l9_409;
l9_374=l9_412;
float l9_420=l9_364.y;
int l9_421=l9_367.y;
bool l9_422=l9_373;
float l9_423=l9_374;
if ((l9_421==0)||(l9_421==3))
{
float l9_424=l9_420;
float l9_425=0.0;
float l9_426=1.0;
bool l9_427=l9_422;
float l9_428=l9_423;
float l9_429=fast::clamp(l9_424,l9_425,l9_426);
float l9_430=step(abs(l9_424-l9_429),9.9999997e-06);
l9_428*=(l9_430+((1.0-float(l9_427))*(1.0-l9_430)));
l9_424=l9_429;
l9_420=l9_424;
l9_423=l9_428;
}
l9_364.y=l9_420;
l9_374=l9_423;
float2 l9_431=l9_364;
int l9_432=l9_362;
int l9_433=l9_363;
float l9_434=l9_372;
float2 l9_435=l9_431;
int l9_436=l9_432;
int l9_437=l9_433;
float3 l9_438=float3(0.0);
if (l9_436==0)
{
l9_438=float3(l9_435,0.0);
}
else
{
if (l9_436==1)
{
l9_438=float3(l9_435.x,(l9_435.y*0.5)+(0.5-(float(l9_437)*0.5)),0.0);
}
else
{
l9_438=float3(l9_435,float(l9_437));
}
}
float3 l9_439=l9_438;
float3 l9_440=l9_439;
float2 l9_441=l9_440.xy;
float l9_442=l9_434;
float4 l9_443=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_441,bias(l9_442));
float4 l9_444=l9_443;
float4 l9_445=l9_444;
if (l9_370)
{
l9_445=mix(l9_371,l9_445,float4(l9_374));
}
float4 l9_446=l9_445;
l9_355=l9_446;
float4 l9_447=l9_355;
l9_330=l9_447;
if (N2_ENABLE_FLIPBOOKBLEND)
{
float2 l9_448=l9_333;
float2 l9_449=N2_gridSize;
float l9_450=N2_numValidFrames;
float l9_451=floor(mod(l9_338+1.0,N2_numValidFrames));
float l9_452=N2_flipBookSpeedMult;
float l9_453=l9_336;
float l9_454=floor(l9_449.x);
float l9_455=floor(l9_449.y);
float l9_456=1.0/l9_454;
float l9_457=1.0/l9_455;
float l9_458=fast::min(l9_454*l9_455,floor(l9_450));
float l9_459=floor(mod((l9_453*l9_452)+floor(l9_451),l9_458));
float l9_460=floor(l9_459/l9_454);
float l9_461=mod(l9_459,l9_454);
float2 l9_462=float2((l9_456*l9_448.x)+(l9_461*l9_456),((1.0-l9_457)-(l9_460*l9_457))+(l9_457*l9_448.y));
l9_333=l9_462;
float4 l9_463=l9_330;
float2 l9_464=l9_333;
float4 l9_465=float4(0.0);
int l9_466=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_467=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_467=0;
}
else
{
l9_467=in.varStereoViewID;
}
int l9_468=l9_467;
l9_466=1-l9_468;
}
else
{
int l9_469=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_469=0;
}
else
{
l9_469=in.varStereoViewID;
}
int l9_470=l9_469;
l9_466=l9_470;
}
int l9_471=l9_466;
int l9_472=mainTextureLayout_tmp;
int l9_473=l9_471;
float2 l9_474=l9_464;
bool l9_475=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_476=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_477=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_478=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_479=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_480=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_481=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_482=0.0;
bool l9_483=l9_480&&(!l9_478);
float l9_484=1.0;
float l9_485=l9_474.x;
int l9_486=l9_477.x;
if (l9_486==1)
{
l9_485=fract(l9_485);
}
else
{
if (l9_486==2)
{
float l9_487=fract(l9_485);
float l9_488=l9_485-l9_487;
float l9_489=step(0.25,fract(l9_488*0.5));
l9_485=mix(l9_487,1.0-l9_487,fast::clamp(l9_489,0.0,1.0));
}
}
l9_474.x=l9_485;
float l9_490=l9_474.y;
int l9_491=l9_477.y;
if (l9_491==1)
{
l9_490=fract(l9_490);
}
else
{
if (l9_491==2)
{
float l9_492=fract(l9_490);
float l9_493=l9_490-l9_492;
float l9_494=step(0.25,fract(l9_493*0.5));
l9_490=mix(l9_492,1.0-l9_492,fast::clamp(l9_494,0.0,1.0));
}
}
l9_474.y=l9_490;
if (l9_478)
{
bool l9_495=l9_480;
bool l9_496;
if (l9_495)
{
l9_496=l9_477.x==3;
}
else
{
l9_496=l9_495;
}
float l9_497=l9_474.x;
float l9_498=l9_479.x;
float l9_499=l9_479.z;
bool l9_500=l9_496;
float l9_501=l9_484;
float l9_502=fast::clamp(l9_497,l9_498,l9_499);
float l9_503=step(abs(l9_497-l9_502),9.9999997e-06);
l9_501*=(l9_503+((1.0-float(l9_500))*(1.0-l9_503)));
l9_497=l9_502;
l9_474.x=l9_497;
l9_484=l9_501;
bool l9_504=l9_480;
bool l9_505;
if (l9_504)
{
l9_505=l9_477.y==3;
}
else
{
l9_505=l9_504;
}
float l9_506=l9_474.y;
float l9_507=l9_479.y;
float l9_508=l9_479.w;
bool l9_509=l9_505;
float l9_510=l9_484;
float l9_511=fast::clamp(l9_506,l9_507,l9_508);
float l9_512=step(abs(l9_506-l9_511),9.9999997e-06);
l9_510*=(l9_512+((1.0-float(l9_509))*(1.0-l9_512)));
l9_506=l9_511;
l9_474.y=l9_506;
l9_484=l9_510;
}
float2 l9_513=l9_474;
bool l9_514=l9_475;
float3x3 l9_515=l9_476;
if (l9_514)
{
l9_513=float2((l9_515*float3(l9_513,1.0)).xy);
}
float2 l9_516=l9_513;
float2 l9_517=l9_516;
float2 l9_518=l9_517;
l9_474=l9_518;
float l9_519=l9_474.x;
int l9_520=l9_477.x;
bool l9_521=l9_483;
float l9_522=l9_484;
if ((l9_520==0)||(l9_520==3))
{
float l9_523=l9_519;
float l9_524=0.0;
float l9_525=1.0;
bool l9_526=l9_521;
float l9_527=l9_522;
float l9_528=fast::clamp(l9_523,l9_524,l9_525);
float l9_529=step(abs(l9_523-l9_528),9.9999997e-06);
l9_527*=(l9_529+((1.0-float(l9_526))*(1.0-l9_529)));
l9_523=l9_528;
l9_519=l9_523;
l9_522=l9_527;
}
l9_474.x=l9_519;
l9_484=l9_522;
float l9_530=l9_474.y;
int l9_531=l9_477.y;
bool l9_532=l9_483;
float l9_533=l9_484;
if ((l9_531==0)||(l9_531==3))
{
float l9_534=l9_530;
float l9_535=0.0;
float l9_536=1.0;
bool l9_537=l9_532;
float l9_538=l9_533;
float l9_539=fast::clamp(l9_534,l9_535,l9_536);
float l9_540=step(abs(l9_534-l9_539),9.9999997e-06);
l9_538*=(l9_540+((1.0-float(l9_537))*(1.0-l9_540)));
l9_534=l9_539;
l9_530=l9_534;
l9_533=l9_538;
}
l9_474.y=l9_530;
l9_484=l9_533;
float2 l9_541=l9_474;
int l9_542=l9_472;
int l9_543=l9_473;
float l9_544=l9_482;
float2 l9_545=l9_541;
int l9_546=l9_542;
int l9_547=l9_543;
float3 l9_548=float3(0.0);
if (l9_546==0)
{
l9_548=float3(l9_545,0.0);
}
else
{
if (l9_546==1)
{
l9_548=float3(l9_545.x,(l9_545.y*0.5)+(0.5-(float(l9_547)*0.5)),0.0);
}
else
{
l9_548=float3(l9_545,float(l9_547));
}
}
float3 l9_549=l9_548;
float3 l9_550=l9_549;
float2 l9_551=l9_550.xy;
float l9_552=l9_544;
float4 l9_553=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_551,bias(l9_552));
float4 l9_554=l9_553;
float4 l9_555=l9_554;
if (l9_480)
{
l9_555=mix(l9_481,l9_555,float4(l9_484));
}
float4 l9_556=l9_555;
l9_465=l9_556;
float4 l9_557=l9_465;
l9_330=mix(l9_463,l9_557,float4(fract((l9_336*N2_flipBookSpeedMult)+l9_338)));
}
}
}
float4 l9_558=float4(1.0);
if (N2_ENABLE_COLORRAMP)
{
float l9_559=ceil(l9_113*N2_texSize.x)/N2_texSize.x;
float l9_560=l9_559;
if (N2_ENABLE_NORANDOFFSET)
{
float2 l9_561=tempGlobals.Surface_UVCoord0;
l9_560+=(l9_561.x/N2_texSize.x);
}
float2 l9_562=float2(l9_560,0.5);
float4 l9_563=float4(0.0);
int l9_564=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_565=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_565=0;
}
else
{
l9_565=in.varStereoViewID;
}
int l9_566=l9_565;
l9_564=1-l9_566;
}
else
{
int l9_567=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_567=0;
}
else
{
l9_567=in.varStereoViewID;
}
int l9_568=l9_567;
l9_564=l9_568;
}
int l9_569=l9_564;
int l9_570=colorRampTextureLayout_tmp;
int l9_571=l9_569;
float2 l9_572=l9_562;
bool l9_573=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_574=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_575=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_576=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_577=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_578=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_579=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_580=0.0;
bool l9_581=l9_578&&(!l9_576);
float l9_582=1.0;
float l9_583=l9_572.x;
int l9_584=l9_575.x;
if (l9_584==1)
{
l9_583=fract(l9_583);
}
else
{
if (l9_584==2)
{
float l9_585=fract(l9_583);
float l9_586=l9_583-l9_585;
float l9_587=step(0.25,fract(l9_586*0.5));
l9_583=mix(l9_585,1.0-l9_585,fast::clamp(l9_587,0.0,1.0));
}
}
l9_572.x=l9_583;
float l9_588=l9_572.y;
int l9_589=l9_575.y;
if (l9_589==1)
{
l9_588=fract(l9_588);
}
else
{
if (l9_589==2)
{
float l9_590=fract(l9_588);
float l9_591=l9_588-l9_590;
float l9_592=step(0.25,fract(l9_591*0.5));
l9_588=mix(l9_590,1.0-l9_590,fast::clamp(l9_592,0.0,1.0));
}
}
l9_572.y=l9_588;
if (l9_576)
{
bool l9_593=l9_578;
bool l9_594;
if (l9_593)
{
l9_594=l9_575.x==3;
}
else
{
l9_594=l9_593;
}
float l9_595=l9_572.x;
float l9_596=l9_577.x;
float l9_597=l9_577.z;
bool l9_598=l9_594;
float l9_599=l9_582;
float l9_600=fast::clamp(l9_595,l9_596,l9_597);
float l9_601=step(abs(l9_595-l9_600),9.9999997e-06);
l9_599*=(l9_601+((1.0-float(l9_598))*(1.0-l9_601)));
l9_595=l9_600;
l9_572.x=l9_595;
l9_582=l9_599;
bool l9_602=l9_578;
bool l9_603;
if (l9_602)
{
l9_603=l9_575.y==3;
}
else
{
l9_603=l9_602;
}
float l9_604=l9_572.y;
float l9_605=l9_577.y;
float l9_606=l9_577.w;
bool l9_607=l9_603;
float l9_608=l9_582;
float l9_609=fast::clamp(l9_604,l9_605,l9_606);
float l9_610=step(abs(l9_604-l9_609),9.9999997e-06);
l9_608*=(l9_610+((1.0-float(l9_607))*(1.0-l9_610)));
l9_604=l9_609;
l9_572.y=l9_604;
l9_582=l9_608;
}
float2 l9_611=l9_572;
bool l9_612=l9_573;
float3x3 l9_613=l9_574;
if (l9_612)
{
l9_611=float2((l9_613*float3(l9_611,1.0)).xy);
}
float2 l9_614=l9_611;
float2 l9_615=l9_614;
float2 l9_616=l9_615;
l9_572=l9_616;
float l9_617=l9_572.x;
int l9_618=l9_575.x;
bool l9_619=l9_581;
float l9_620=l9_582;
if ((l9_618==0)||(l9_618==3))
{
float l9_621=l9_617;
float l9_622=0.0;
float l9_623=1.0;
bool l9_624=l9_619;
float l9_625=l9_620;
float l9_626=fast::clamp(l9_621,l9_622,l9_623);
float l9_627=step(abs(l9_621-l9_626),9.9999997e-06);
l9_625*=(l9_627+((1.0-float(l9_624))*(1.0-l9_627)));
l9_621=l9_626;
l9_617=l9_621;
l9_620=l9_625;
}
l9_572.x=l9_617;
l9_582=l9_620;
float l9_628=l9_572.y;
int l9_629=l9_575.y;
bool l9_630=l9_581;
float l9_631=l9_582;
if ((l9_629==0)||(l9_629==3))
{
float l9_632=l9_628;
float l9_633=0.0;
float l9_634=1.0;
bool l9_635=l9_630;
float l9_636=l9_631;
float l9_637=fast::clamp(l9_632,l9_633,l9_634);
float l9_638=step(abs(l9_632-l9_637),9.9999997e-06);
l9_636*=(l9_638+((1.0-float(l9_635))*(1.0-l9_638)));
l9_632=l9_637;
l9_628=l9_632;
l9_631=l9_636;
}
l9_572.y=l9_628;
l9_582=l9_631;
float2 l9_639=l9_572;
int l9_640=l9_570;
int l9_641=l9_571;
float l9_642=l9_580;
float2 l9_643=l9_639;
int l9_644=l9_640;
int l9_645=l9_641;
float3 l9_646=float3(0.0);
if (l9_644==0)
{
l9_646=float3(l9_643,0.0);
}
else
{
if (l9_644==1)
{
l9_646=float3(l9_643.x,(l9_643.y*0.5)+(0.5-(float(l9_645)*0.5)),0.0);
}
else
{
l9_646=float3(l9_643,float(l9_645));
}
}
float3 l9_647=l9_646;
float3 l9_648=l9_647;
float2 l9_649=l9_648.xy;
float l9_650=l9_642;
float4 l9_651=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_649,bias(l9_650));
float4 l9_652=l9_651;
float4 l9_653=l9_652;
if (l9_578)
{
l9_653=mix(l9_579,l9_653,float4(l9_582));
}
float4 l9_654=l9_653;
l9_563=l9_654;
float4 l9_655=l9_563;
l9_558=l9_655*N2_colorRampMult;
}
float4 l9_656=float4(1.0);
float4 l9_657=float4(1.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
N2_uv=l9_331;
l9_656=l9_330;
}
else
{
float2 l9_658=N2_uv;
float4 l9_659=float4(0.0);
int l9_660=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_661=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_661=0;
}
else
{
l9_661=in.varStereoViewID;
}
int l9_662=l9_661;
l9_660=1-l9_662;
}
else
{
int l9_663=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_663=0;
}
else
{
l9_663=in.varStereoViewID;
}
int l9_664=l9_663;
l9_660=l9_664;
}
int l9_665=l9_660;
int l9_666=mainTextureLayout_tmp;
int l9_667=l9_665;
float2 l9_668=l9_658;
bool l9_669=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_670=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_671=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_672=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_673=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_674=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_675=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_676=0.0;
bool l9_677=l9_674&&(!l9_672);
float l9_678=1.0;
float l9_679=l9_668.x;
int l9_680=l9_671.x;
if (l9_680==1)
{
l9_679=fract(l9_679);
}
else
{
if (l9_680==2)
{
float l9_681=fract(l9_679);
float l9_682=l9_679-l9_681;
float l9_683=step(0.25,fract(l9_682*0.5));
l9_679=mix(l9_681,1.0-l9_681,fast::clamp(l9_683,0.0,1.0));
}
}
l9_668.x=l9_679;
float l9_684=l9_668.y;
int l9_685=l9_671.y;
if (l9_685==1)
{
l9_684=fract(l9_684);
}
else
{
if (l9_685==2)
{
float l9_686=fract(l9_684);
float l9_687=l9_684-l9_686;
float l9_688=step(0.25,fract(l9_687*0.5));
l9_684=mix(l9_686,1.0-l9_686,fast::clamp(l9_688,0.0,1.0));
}
}
l9_668.y=l9_684;
if (l9_672)
{
bool l9_689=l9_674;
bool l9_690;
if (l9_689)
{
l9_690=l9_671.x==3;
}
else
{
l9_690=l9_689;
}
float l9_691=l9_668.x;
float l9_692=l9_673.x;
float l9_693=l9_673.z;
bool l9_694=l9_690;
float l9_695=l9_678;
float l9_696=fast::clamp(l9_691,l9_692,l9_693);
float l9_697=step(abs(l9_691-l9_696),9.9999997e-06);
l9_695*=(l9_697+((1.0-float(l9_694))*(1.0-l9_697)));
l9_691=l9_696;
l9_668.x=l9_691;
l9_678=l9_695;
bool l9_698=l9_674;
bool l9_699;
if (l9_698)
{
l9_699=l9_671.y==3;
}
else
{
l9_699=l9_698;
}
float l9_700=l9_668.y;
float l9_701=l9_673.y;
float l9_702=l9_673.w;
bool l9_703=l9_699;
float l9_704=l9_678;
float l9_705=fast::clamp(l9_700,l9_701,l9_702);
float l9_706=step(abs(l9_700-l9_705),9.9999997e-06);
l9_704*=(l9_706+((1.0-float(l9_703))*(1.0-l9_706)));
l9_700=l9_705;
l9_668.y=l9_700;
l9_678=l9_704;
}
float2 l9_707=l9_668;
bool l9_708=l9_669;
float3x3 l9_709=l9_670;
if (l9_708)
{
l9_707=float2((l9_709*float3(l9_707,1.0)).xy);
}
float2 l9_710=l9_707;
float2 l9_711=l9_710;
float2 l9_712=l9_711;
l9_668=l9_712;
float l9_713=l9_668.x;
int l9_714=l9_671.x;
bool l9_715=l9_677;
float l9_716=l9_678;
if ((l9_714==0)||(l9_714==3))
{
float l9_717=l9_713;
float l9_718=0.0;
float l9_719=1.0;
bool l9_720=l9_715;
float l9_721=l9_716;
float l9_722=fast::clamp(l9_717,l9_718,l9_719);
float l9_723=step(abs(l9_717-l9_722),9.9999997e-06);
l9_721*=(l9_723+((1.0-float(l9_720))*(1.0-l9_723)));
l9_717=l9_722;
l9_713=l9_717;
l9_716=l9_721;
}
l9_668.x=l9_713;
l9_678=l9_716;
float l9_724=l9_668.y;
int l9_725=l9_671.y;
bool l9_726=l9_677;
float l9_727=l9_678;
if ((l9_725==0)||(l9_725==3))
{
float l9_728=l9_724;
float l9_729=0.0;
float l9_730=1.0;
bool l9_731=l9_726;
float l9_732=l9_727;
float l9_733=fast::clamp(l9_728,l9_729,l9_730);
float l9_734=step(abs(l9_728-l9_733),9.9999997e-06);
l9_732*=(l9_734+((1.0-float(l9_731))*(1.0-l9_734)));
l9_728=l9_733;
l9_724=l9_728;
l9_727=l9_732;
}
l9_668.y=l9_724;
l9_678=l9_727;
float2 l9_735=l9_668;
int l9_736=l9_666;
int l9_737=l9_667;
float l9_738=l9_676;
float2 l9_739=l9_735;
int l9_740=l9_736;
int l9_741=l9_737;
float3 l9_742=float3(0.0);
if (l9_740==0)
{
l9_742=float3(l9_739,0.0);
}
else
{
if (l9_740==1)
{
l9_742=float3(l9_739.x,(l9_739.y*0.5)+(0.5-(float(l9_741)*0.5)),0.0);
}
else
{
l9_742=float3(l9_739,float(l9_741));
}
}
float3 l9_743=l9_742;
float3 l9_744=l9_743;
float2 l9_745=l9_744.xy;
float l9_746=l9_738;
float4 l9_747=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_745,bias(l9_746));
float4 l9_748=l9_747;
float4 l9_749=l9_748;
if (l9_674)
{
l9_749=mix(l9_675,l9_749,float4(l9_678));
}
float4 l9_750=l9_749;
l9_659=l9_750;
float4 l9_751=l9_659;
l9_656=l9_751;
}
}
if (N2_ENABLE_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_657=l9_558;
}
}
N2_result=(l9_656*l9_325)*l9_657;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrail>0.0)
{
N2_result=(l9_122*l9_325)*l9_657;
N2_result.w*=l9_121;
}
}
if (N2_ENABLE_SCREENFADE)
{
N2_result.w*=N2_cameraFade_trailHeadTime_taper.x;
}
if (N2_ENABLE_ALPHADISSOLVE)
{
float l9_752=l9_113*N2_alphaDissolveMult;
N2_result.w=fast::clamp(N2_result.w-l9_752,0.0,1.0);
}
if (N2_ENABLE_BLACKASALPHA)
{
float l9_753=length(N2_result.xyz);
N2_result.w=l9_753;
if (N2_ENABLE_TRAILS)
{
N2_result.w*=l9_121;
}
}
if (N2_ENABLE_PREMULTIPLIEDCOLOR)
{
float3 l9_754=N2_result.xyz*N2_result.w;
N2_result=float4(l9_754.x,l9_754.y,l9_754.z,N2_result.w);
}
l9_87=N2_result;
l9_61=l9_87;
float l9_755=0.0;
float4 l9_756=l9_61;
float l9_757=l9_756.w;
l9_755=l9_757;
float3 l9_758=float3(0.0);
float3 l9_759=float3(0.0);
float3 l9_760=(*sc_set0.UserUniforms).Port_Default_N182;
ssGlobals l9_761=param;
float3 l9_762;
if ((int(PBRNORMALTEX_tmp)!=0))
{
float l9_763=0.0;
float l9_764;
if ((int(TRAILS_tmp)!=0))
{
l9_764=1.001;
}
else
{
l9_764=0.001;
}
l9_764-=0.001;
l9_763=l9_764;
float4 l9_765=float4(0.0);
l9_765=l9_761.VertexColor;
float l9_766=0.0;
l9_766=l9_765.x;
float l9_767=0.0;
float l9_768=l9_763;
bool l9_769=(l9_768*1.0)!=0.0;
bool l9_770;
if (l9_769)
{
l9_770=(l9_766*1.0)!=0.0;
}
else
{
l9_770=l9_769;
}
l9_767=float(l9_770);
float2 l9_771=float2(0.0);
float2 l9_772=(*sc_set0.UserUniforms).trailFadeStartEnd;
l9_771=l9_772;
float2 l9_773=float2(0.0);
float l9_774=(*sc_set0.UserUniforms).Port_Input1_N216;
float2 l9_775=float2(0.0);
float2 l9_776;
if (TRAILBEHAVIOR_tmp!=0)
{
l9_776=float2(l9_774);
}
else
{
float2 l9_777=float2(0.0);
float2 l9_778=(*sc_set0.UserUniforms).trailFadeInOut;
l9_777=l9_778;
l9_775=l9_777;
l9_776=l9_775;
}
l9_773=l9_776;
float4 l9_779=float4(0.0);
l9_779=float4(l9_771.x,l9_771.y,l9_779.z,l9_779.w);
l9_779=float4(l9_779.x,l9_779.y,l9_773.x,l9_773.y);
float3 l9_780=float3(0.0);
float3 l9_781=(*sc_set0.UserUniforms).colorStart;
l9_780=l9_781;
float3 l9_782=float3(0.0);
float3 l9_783=(*sc_set0.UserUniforms).colorEnd;
l9_782=l9_783;
float3 l9_784=float3(0.0);
float3 l9_785=(*sc_set0.UserUniforms).colorMinStart;
l9_784=l9_785;
float3 l9_786=float3(0.0);
float3 l9_787=(*sc_set0.UserUniforms).colorMinEnd;
l9_786=l9_787;
float3 l9_788=float3(0.0);
float3 l9_789=(*sc_set0.UserUniforms).colorMaxStart;
l9_788=l9_789;
float3 l9_790=float3(0.0);
float3 l9_791=(*sc_set0.UserUniforms).colorMaxEnd;
l9_790=l9_791;
float l9_792=0.0;
float l9_793=(*sc_set0.UserUniforms).alphaStart;
l9_792=l9_793;
float l9_794=0.0;
float l9_795=(*sc_set0.UserUniforms).alphaEnd;
l9_794=l9_795;
float l9_796=0.0;
float l9_797=(*sc_set0.UserUniforms).alphaMinStart;
l9_796=l9_797;
float l9_798=0.0;
float l9_799=(*sc_set0.UserUniforms).alphaMinEnd;
l9_798=l9_799;
float l9_800=0.0;
float l9_801=(*sc_set0.UserUniforms).alphaMaxStart;
l9_800=l9_801;
float l9_802=0.0;
float l9_803=(*sc_set0.UserUniforms).alphaMaxEnd;
l9_802=l9_803;
float l9_804=0.0;
float l9_805=(*sc_set0.UserUniforms).alphaDissolveMult;
l9_804=l9_805;
float l9_806=0.0;
float l9_807=(*sc_set0.UserUniforms).numValidFrames;
l9_806=l9_807;
float2 l9_808=float2(0.0);
float2 l9_809=(*sc_set0.UserUniforms).gridSize;
l9_808=l9_809;
float l9_810=0.0;
float l9_811=(*sc_set0.UserUniforms).flipBookSpeedMult;
l9_810=l9_811;
float l9_812=0.0;
float l9_813=(*sc_set0.UserUniforms).flipBookRandomStart;
l9_812=l9_813;
float2 l9_814=float2(0.0);
float2 l9_815=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
l9_814=l9_815;
float4 l9_816=float4(0.0);
float4 l9_817=(*sc_set0.UserUniforms).colorRampMult;
l9_816=l9_817;
float l9_818=0.0;
float l9_819=(*sc_set0.UserUniforms).externalSeed;
l9_818=l9_819;
float4 l9_820=float4(0.0);
float4 l9_821;
l9_821.x=in.Interpolator0.x;
l9_821.y=in.Interpolator0.y;
l9_821.z=in.Interpolator0.z;
l9_821.w=in.Interpolator0.w;
l9_820=l9_821;
float4 l9_822=float4(0.0);
float4 l9_823;
l9_823.x=in.Interpolator1.x;
l9_823.y=in.Interpolator1.y;
l9_823.z=in.Interpolator1.z;
l9_823.w=in.Interpolator1.w;
l9_822=l9_823;
float2 l9_824=float2(0.0);
float l9_825=l9_767;
float4 l9_826=l9_779;
float3 l9_827=l9_780;
float3 l9_828=l9_782;
float3 l9_829=l9_784;
float3 l9_830=l9_786;
float3 l9_831=l9_788;
float3 l9_832=l9_790;
float l9_833=l9_792;
float l9_834=l9_794;
float l9_835=l9_796;
float l9_836=l9_798;
float l9_837=l9_800;
float l9_838=l9_802;
float l9_839=l9_804;
float l9_840=l9_806;
float2 l9_841=l9_808;
float l9_842=l9_810;
float l9_843=l9_812;
float2 l9_844=l9_814;
float4 l9_845=l9_816;
float l9_846=l9_818;
float4 l9_847=l9_820;
float4 l9_848=l9_822;
ssGlobals l9_849=l9_761;
tempGlobals=l9_849;
float2 l9_850=float2(0.0);
N2_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N2_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N2_isTrailCondition=l9_825!=0.0;
N2_ENABLE_TRAILTEXTURE=(int(TRAILTEXTURE_tmp)!=0);
N2_ENABLE_TRAILCOLORRAMP=(int(TRAILCOLORRAMP_tmp)!=0);
N2_fadeInOut=l9_826;
N2_colorStart=l9_827;
N2_colorEnd=l9_828;
N2_ENABLE_COLORMINMAX=(int(COLORMINMAX_tmp)!=0);
N2_colorMinStart=l9_829;
N2_colorMinEnd=l9_830;
N2_colorMaxStart=l9_831;
N2_colorMaxEnd=l9_832;
N2_ENABLE_COLORMONOMIN=(int(COLORMONOMIN_tmp)!=0);
N2_alphaStart=l9_833;
N2_alphaEnd=l9_834;
N2_ENABLE_ALPHAMINMAX=(int(ALPHAMINMAX_tmp)!=0);
N2_alphaMinStart=l9_835;
N2_alphaMinEnd=l9_836;
N2_alphaMaxStart=l9_837;
N2_alphaMaxEnd=l9_838;
N2_ENABLE_ALPHADISSOLVE=(int(ALPHADISSOLVE_tmp)!=0);
N2_alphaDissolveMult=l9_839;
N2_ENABLE_PREMULTIPLIEDCOLOR=(int(PREMULTIPLIEDCOLOR_tmp)!=0);
N2_ENABLE_BLACKASALPHA=(int(BLACKASALPHA_tmp)!=0);
N2_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N2_ENABLE_FLIPBOOK=(int(FLIPBOOK_tmp)!=0);
N2_numValidFrames=l9_840;
N2_gridSize=l9_841;
N2_flipBookSpeedMult=l9_842;
N2_flipBookRandomStart=l9_843;
N2_ENABLE_FLIPBOOKBLEND=(int(FLIPBOOKBLEND_tmp)!=0);
N2_ENABLE_FLIPBOOKBYLIFE=(int(FLIPBOOKBYLIFE_tmp)!=0);
N2_ENABLE_COLORRAMP=(int(COLORRAMP_tmp)!=0);
N2_texSize=l9_844;
N2_colorRampMult=l9_845;
N2_ENABLE_NORANDOFFSET=(int(NORANDOFFSET_tmp)!=0);
N2_ENABLE_BASETEXTURE=(int(BASETEXTURE_tmp)!=0);
N2_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N2_externalSeed=l9_846;
N2_timeValuesIn=l9_847;
N2_cameraFade_trailHeadTime_taper=l9_848;
float l9_851=0.0;
if (N2_ENABLE_WORLDPOSSEED)
{
float4x4 l9_852=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_851=length(float4(1.0)*l9_852);
}
N2_globalSeed=N2_externalSeed+l9_851;
int l9_853=0;
l9_853=int(tempGlobals.gInstanceID+0.5);
int l9_854=l9_853;
float l9_855=float(l9_854);
int l9_856=int(l9_855);
int l9_857=l9_856^(l9_856*15299);
int l9_858=l9_857;
int l9_859=l9_858;
int l9_860=((l9_859*((l9_859*1471343)+101146501))+1559861749)&2147483647;
int l9_861=l9_860;
int l9_862=l9_858*1399;
int l9_863=((l9_862*((l9_862*1471343)+101146501))+1559861749)&2147483647;
int l9_864=l9_863;
int l9_865=l9_858*7177;
int l9_866=((l9_865*((l9_865*1471343)+101146501))+1559861749)&2147483647;
int l9_867=l9_866;
int l9_868=l9_861;
float l9_869=float(l9_868)*4.6566129e-10;
int l9_870=l9_864;
float l9_871=float(l9_870)*4.6566129e-10;
int l9_872=l9_867;
float l9_873=float(l9_872)*4.6566129e-10;
float3 l9_874=float3(l9_869,l9_871,l9_873);
float3 l9_875=l9_874;
N2_particleSeed=l9_875;
float l9_876=N2_timeValuesIn.w;
float l9_877=N2_particleSeed.x;
float l9_878=N2_particleSeed.y;
float l9_879=N2_particleSeed.z;
float3 l9_880=fract((float3(l9_877,l9_878,l9_879)*27.21883)+float3(N2_globalSeed));
if (N2_ENABLE_COLORMONOMIN)
{
l9_880=fract((float3(l9_877,l9_877,l9_877)*27.21883)+float3(N2_globalSeed));
}
float l9_881=fract((N2_particleSeed.x*3121.3333)+N2_globalSeed);
float l9_882=fract((N2_particleSeed.y*13.2234)+N2_globalSeed);
float l9_883=fract((N2_particleSeed.z*3.5358)+N2_globalSeed);
N2_isTrail=0.0;
float l9_884=1.0;
N2_trailHeadTime=N2_cameraFade_trailHeadTime_taper.yz;
float4 l9_885=float4(1.0);
float2 l9_886=tempGlobals.Surface_UVCoord0;
N2_uv=l9_886;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrailCondition)
{
N2_isTrail=1.0;
float l9_887=N2_cameraFade_trailHeadTime_taper.w;
float2 l9_888=float2(0.5-(l9_887/2.0),0.5+(l9_887/2.0));
float l9_889=N2_uv.x;
float l9_890=l9_888.x;
bool l9_891=l9_889<l9_890;
bool l9_892;
if (!l9_891)
{
l9_892=N2_uv.x>l9_888.y;
}
else
{
l9_892=l9_891;
}
if (l9_892)
{
discard_fragment();
}
N2_uv=float2(0.0+(((N2_uv.x-l9_888.x)*1.0)/((l9_888.y-l9_888.x)+1e-06)),N2_uv.y);
if (N2_ENABLE_TRAILTEXTURE)
{
float2 l9_893=float2(N2_uv.x,1.0-N2_uv.y);
float4 l9_894=float4(0.0);
int l9_895=0;
if ((int(trailTexHasSwappedViews_tmp)!=0))
{
int l9_896=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_896=0;
}
else
{
l9_896=in.varStereoViewID;
}
int l9_897=l9_896;
l9_895=1-l9_897;
}
else
{
int l9_898=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_898=0;
}
else
{
l9_898=in.varStereoViewID;
}
int l9_899=l9_898;
l9_895=l9_899;
}
int l9_900=l9_895;
int l9_901=trailTexLayout_tmp;
int l9_902=l9_900;
float2 l9_903=l9_893;
bool l9_904=(int(SC_USE_UV_TRANSFORM_trailTex_tmp)!=0);
float3x3 l9_905=(*sc_set0.UserUniforms).trailTexTransform;
int2 l9_906=int2(SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp);
bool l9_907=(int(SC_USE_UV_MIN_MAX_trailTex_tmp)!=0);
float4 l9_908=(*sc_set0.UserUniforms).trailTexUvMinMax;
bool l9_909=(int(SC_USE_CLAMP_TO_BORDER_trailTex_tmp)!=0);
float4 l9_910=(*sc_set0.UserUniforms).trailTexBorderColor;
float l9_911=0.0;
bool l9_912=l9_909&&(!l9_907);
float l9_913=1.0;
float l9_914=l9_903.x;
int l9_915=l9_906.x;
if (l9_915==1)
{
l9_914=fract(l9_914);
}
else
{
if (l9_915==2)
{
float l9_916=fract(l9_914);
float l9_917=l9_914-l9_916;
float l9_918=step(0.25,fract(l9_917*0.5));
l9_914=mix(l9_916,1.0-l9_916,fast::clamp(l9_918,0.0,1.0));
}
}
l9_903.x=l9_914;
float l9_919=l9_903.y;
int l9_920=l9_906.y;
if (l9_920==1)
{
l9_919=fract(l9_919);
}
else
{
if (l9_920==2)
{
float l9_921=fract(l9_919);
float l9_922=l9_919-l9_921;
float l9_923=step(0.25,fract(l9_922*0.5));
l9_919=mix(l9_921,1.0-l9_921,fast::clamp(l9_923,0.0,1.0));
}
}
l9_903.y=l9_919;
if (l9_907)
{
bool l9_924=l9_909;
bool l9_925;
if (l9_924)
{
l9_925=l9_906.x==3;
}
else
{
l9_925=l9_924;
}
float l9_926=l9_903.x;
float l9_927=l9_908.x;
float l9_928=l9_908.z;
bool l9_929=l9_925;
float l9_930=l9_913;
float l9_931=fast::clamp(l9_926,l9_927,l9_928);
float l9_932=step(abs(l9_926-l9_931),9.9999997e-06);
l9_930*=(l9_932+((1.0-float(l9_929))*(1.0-l9_932)));
l9_926=l9_931;
l9_903.x=l9_926;
l9_913=l9_930;
bool l9_933=l9_909;
bool l9_934;
if (l9_933)
{
l9_934=l9_906.y==3;
}
else
{
l9_934=l9_933;
}
float l9_935=l9_903.y;
float l9_936=l9_908.y;
float l9_937=l9_908.w;
bool l9_938=l9_934;
float l9_939=l9_913;
float l9_940=fast::clamp(l9_935,l9_936,l9_937);
float l9_941=step(abs(l9_935-l9_940),9.9999997e-06);
l9_939*=(l9_941+((1.0-float(l9_938))*(1.0-l9_941)));
l9_935=l9_940;
l9_903.y=l9_935;
l9_913=l9_939;
}
float2 l9_942=l9_903;
bool l9_943=l9_904;
float3x3 l9_944=l9_905;
if (l9_943)
{
l9_942=float2((l9_944*float3(l9_942,1.0)).xy);
}
float2 l9_945=l9_942;
float2 l9_946=l9_945;
float2 l9_947=l9_946;
l9_903=l9_947;
float l9_948=l9_903.x;
int l9_949=l9_906.x;
bool l9_950=l9_912;
float l9_951=l9_913;
if ((l9_949==0)||(l9_949==3))
{
float l9_952=l9_948;
float l9_953=0.0;
float l9_954=1.0;
bool l9_955=l9_950;
float l9_956=l9_951;
float l9_957=fast::clamp(l9_952,l9_953,l9_954);
float l9_958=step(abs(l9_952-l9_957),9.9999997e-06);
l9_956*=(l9_958+((1.0-float(l9_955))*(1.0-l9_958)));
l9_952=l9_957;
l9_948=l9_952;
l9_951=l9_956;
}
l9_903.x=l9_948;
l9_913=l9_951;
float l9_959=l9_903.y;
int l9_960=l9_906.y;
bool l9_961=l9_912;
float l9_962=l9_913;
if ((l9_960==0)||(l9_960==3))
{
float l9_963=l9_959;
float l9_964=0.0;
float l9_965=1.0;
bool l9_966=l9_961;
float l9_967=l9_962;
float l9_968=fast::clamp(l9_963,l9_964,l9_965);
float l9_969=step(abs(l9_963-l9_968),9.9999997e-06);
l9_967*=(l9_969+((1.0-float(l9_966))*(1.0-l9_969)));
l9_963=l9_968;
l9_959=l9_963;
l9_962=l9_967;
}
l9_903.y=l9_959;
l9_913=l9_962;
float2 l9_970=l9_903;
int l9_971=l9_901;
int l9_972=l9_902;
float l9_973=l9_911;
float2 l9_974=l9_970;
int l9_975=l9_971;
int l9_976=l9_972;
float3 l9_977=float3(0.0);
if (l9_975==0)
{
l9_977=float3(l9_974,0.0);
}
else
{
if (l9_975==1)
{
l9_977=float3(l9_974.x,(l9_974.y*0.5)+(0.5-(float(l9_976)*0.5)),0.0);
}
else
{
l9_977=float3(l9_974,float(l9_976));
}
}
float3 l9_978=l9_977;
float3 l9_979=l9_978;
float2 l9_980=l9_979.xy;
float l9_981=l9_973;
float4 l9_982=sc_set0.trailTex.sample(sc_set0.trailTexSmpSC,l9_980,bias(l9_981));
float4 l9_983=l9_982;
float4 l9_984=l9_983;
if (l9_909)
{
l9_984=mix(l9_910,l9_984,float4(l9_913));
}
float4 l9_985=l9_984;
l9_894=l9_985;
float4 l9_986=l9_894;
l9_885=l9_986;
}
float l9_987=fast::max(1e-06,N2_fadeInOut.x);
float l9_988=N2_timeValuesIn.w;
l9_884*=mix(0.0,1.0,fast::clamp(l9_988,0.0,l9_987)/l9_987);
l9_987=fast::max(1e-06,N2_fadeInOut.y);
l9_884*=mix(0.0,1.0,fast::clamp(1.0-l9_988,0.0,l9_987)/l9_987);
if (!N2_ENABLE_INDEPENDENTTRAIL)
{
l9_876=N2_trailHeadTime.y;
l9_987=fast::max(1e-06,N2_fadeInOut.z);
l9_884*=mix(0.0,1.0,fast::clamp(l9_876,0.0,l9_987)/l9_987);
l9_987=fast::max(1e-06,N2_fadeInOut.w);
l9_884*=mix(0.0,1.0,fast::clamp(1.0-l9_876,0.0,l9_987)/l9_987);
}
if (N2_ENABLE_TRAILCOLORRAMP)
{
float2 l9_989=float2(0.0);
l9_989=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_990=l9_989;
float2 l9_991=float2(0.0);
l9_991=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_992=l9_991;
float l9_993=ceil(l9_876*l9_990.x)/l9_992.x;
float2 l9_994=float2(l9_993,0.5);
float4 l9_995=float4(0.0);
int l9_996=0;
if ((int(trailColorRampTexHasSwappedViews_tmp)!=0))
{
int l9_997=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_997=0;
}
else
{
l9_997=in.varStereoViewID;
}
int l9_998=l9_997;
l9_996=1-l9_998;
}
else
{
int l9_999=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_999=0;
}
else
{
l9_999=in.varStereoViewID;
}
int l9_1000=l9_999;
l9_996=l9_1000;
}
int l9_1001=l9_996;
int l9_1002=trailColorRampTexLayout_tmp;
int l9_1003=l9_1001;
float2 l9_1004=l9_994;
bool l9_1005=(int(SC_USE_UV_TRANSFORM_trailColorRampTex_tmp)!=0);
float3x3 l9_1006=(*sc_set0.UserUniforms).trailColorRampTexTransform;
int2 l9_1007=int2(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp);
bool l9_1008=(int(SC_USE_UV_MIN_MAX_trailColorRampTex_tmp)!=0);
float4 l9_1009=(*sc_set0.UserUniforms).trailColorRampTexUvMinMax;
bool l9_1010=(int(SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp)!=0);
float4 l9_1011=(*sc_set0.UserUniforms).trailColorRampTexBorderColor;
float l9_1012=0.0;
bool l9_1013=l9_1010&&(!l9_1008);
float l9_1014=1.0;
float l9_1015=l9_1004.x;
int l9_1016=l9_1007.x;
if (l9_1016==1)
{
l9_1015=fract(l9_1015);
}
else
{
if (l9_1016==2)
{
float l9_1017=fract(l9_1015);
float l9_1018=l9_1015-l9_1017;
float l9_1019=step(0.25,fract(l9_1018*0.5));
l9_1015=mix(l9_1017,1.0-l9_1017,fast::clamp(l9_1019,0.0,1.0));
}
}
l9_1004.x=l9_1015;
float l9_1020=l9_1004.y;
int l9_1021=l9_1007.y;
if (l9_1021==1)
{
l9_1020=fract(l9_1020);
}
else
{
if (l9_1021==2)
{
float l9_1022=fract(l9_1020);
float l9_1023=l9_1020-l9_1022;
float l9_1024=step(0.25,fract(l9_1023*0.5));
l9_1020=mix(l9_1022,1.0-l9_1022,fast::clamp(l9_1024,0.0,1.0));
}
}
l9_1004.y=l9_1020;
if (l9_1008)
{
bool l9_1025=l9_1010;
bool l9_1026;
if (l9_1025)
{
l9_1026=l9_1007.x==3;
}
else
{
l9_1026=l9_1025;
}
float l9_1027=l9_1004.x;
float l9_1028=l9_1009.x;
float l9_1029=l9_1009.z;
bool l9_1030=l9_1026;
float l9_1031=l9_1014;
float l9_1032=fast::clamp(l9_1027,l9_1028,l9_1029);
float l9_1033=step(abs(l9_1027-l9_1032),9.9999997e-06);
l9_1031*=(l9_1033+((1.0-float(l9_1030))*(1.0-l9_1033)));
l9_1027=l9_1032;
l9_1004.x=l9_1027;
l9_1014=l9_1031;
bool l9_1034=l9_1010;
bool l9_1035;
if (l9_1034)
{
l9_1035=l9_1007.y==3;
}
else
{
l9_1035=l9_1034;
}
float l9_1036=l9_1004.y;
float l9_1037=l9_1009.y;
float l9_1038=l9_1009.w;
bool l9_1039=l9_1035;
float l9_1040=l9_1014;
float l9_1041=fast::clamp(l9_1036,l9_1037,l9_1038);
float l9_1042=step(abs(l9_1036-l9_1041),9.9999997e-06);
l9_1040*=(l9_1042+((1.0-float(l9_1039))*(1.0-l9_1042)));
l9_1036=l9_1041;
l9_1004.y=l9_1036;
l9_1014=l9_1040;
}
float2 l9_1043=l9_1004;
bool l9_1044=l9_1005;
float3x3 l9_1045=l9_1006;
if (l9_1044)
{
l9_1043=float2((l9_1045*float3(l9_1043,1.0)).xy);
}
float2 l9_1046=l9_1043;
float2 l9_1047=l9_1046;
float2 l9_1048=l9_1047;
l9_1004=l9_1048;
float l9_1049=l9_1004.x;
int l9_1050=l9_1007.x;
bool l9_1051=l9_1013;
float l9_1052=l9_1014;
if ((l9_1050==0)||(l9_1050==3))
{
float l9_1053=l9_1049;
float l9_1054=0.0;
float l9_1055=1.0;
bool l9_1056=l9_1051;
float l9_1057=l9_1052;
float l9_1058=fast::clamp(l9_1053,l9_1054,l9_1055);
float l9_1059=step(abs(l9_1053-l9_1058),9.9999997e-06);
l9_1057*=(l9_1059+((1.0-float(l9_1056))*(1.0-l9_1059)));
l9_1053=l9_1058;
l9_1049=l9_1053;
l9_1052=l9_1057;
}
l9_1004.x=l9_1049;
l9_1014=l9_1052;
float l9_1060=l9_1004.y;
int l9_1061=l9_1007.y;
bool l9_1062=l9_1013;
float l9_1063=l9_1014;
if ((l9_1061==0)||(l9_1061==3))
{
float l9_1064=l9_1060;
float l9_1065=0.0;
float l9_1066=1.0;
bool l9_1067=l9_1062;
float l9_1068=l9_1063;
float l9_1069=fast::clamp(l9_1064,l9_1065,l9_1066);
float l9_1070=step(abs(l9_1064-l9_1069),9.9999997e-06);
l9_1068*=(l9_1070+((1.0-float(l9_1067))*(1.0-l9_1070)));
l9_1064=l9_1069;
l9_1060=l9_1064;
l9_1063=l9_1068;
}
l9_1004.y=l9_1060;
l9_1014=l9_1063;
float2 l9_1071=l9_1004;
int l9_1072=l9_1002;
int l9_1073=l9_1003;
float l9_1074=l9_1012;
float2 l9_1075=l9_1071;
int l9_1076=l9_1072;
int l9_1077=l9_1073;
float3 l9_1078=float3(0.0);
if (l9_1076==0)
{
l9_1078=float3(l9_1075,0.0);
}
else
{
if (l9_1076==1)
{
l9_1078=float3(l9_1075.x,(l9_1075.y*0.5)+(0.5-(float(l9_1077)*0.5)),0.0);
}
else
{
l9_1078=float3(l9_1075,float(l9_1077));
}
}
float3 l9_1079=l9_1078;
float3 l9_1080=l9_1079;
float2 l9_1081=l9_1080.xy;
float l9_1082=l9_1074;
float4 l9_1083=sc_set0.trailColorRampTex.sample(sc_set0.trailColorRampTexSmpSC,l9_1081,bias(l9_1082));
float4 l9_1084=l9_1083;
float4 l9_1085=l9_1084;
if (l9_1010)
{
l9_1085=mix(l9_1011,l9_1085,float4(l9_1014));
}
float4 l9_1086=l9_1085;
l9_995=l9_1086;
float4 l9_1087=l9_995;
l9_885*=l9_1087;
}
}
}
float4 l9_1088=float4(0.0);
float3 l9_1089=float3(0.0);
float3 l9_1090=float3(0.0);
float l9_1091=0.0;
float l9_1092=0.0;
if (N2_ENABLE_COLORMINMAX)
{
l9_1089=mix(N2_colorMinStart,N2_colorMaxStart,l9_880);
l9_1090=mix(N2_colorMinEnd,N2_colorMaxEnd,l9_880);
}
else
{
l9_1089=N2_colorStart;
l9_1090=N2_colorEnd;
}
if (N2_ENABLE_ALPHAMINMAX)
{
l9_1091=mix(N2_alphaMinStart,N2_alphaMaxStart,l9_881);
l9_1092=mix(N2_alphaMinEnd,N2_alphaMaxEnd,l9_881);
}
else
{
l9_1091=N2_alphaStart;
l9_1092=N2_alphaEnd;
}
l9_1089=mix(l9_1089,l9_1090,float3(l9_876));
l9_1091=mix(l9_1091,l9_1092,l9_876);
l9_1088=float4(l9_1089,l9_1091);
float4 l9_1093=float4(0.0);
float2 l9_1094=float2(0.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
float2 l9_1095=tempGlobals.Surface_UVCoord0;
l9_1094=l9_1095;
float2 l9_1096=l9_1094;
float l9_1097=fast::max(N2_timeValuesIn.x,1e-06);
float l9_1098=fast::max(N2_timeValuesIn.y,1e-06);
float l9_1099=N2_timeValuesIn.z;
if (N2_ENABLE_FLIPBOOKBYLIFE)
{
float l9_1100=mix(l9_1097,l9_1098,l9_883);
l9_1099/=l9_1100;
}
float l9_1101=floor((N2_flipBookRandomStart+1.0)*l9_882);
float2 l9_1102=l9_1094;
float2 l9_1103=N2_gridSize;
float l9_1104=N2_numValidFrames;
float l9_1105=l9_1101;
float l9_1106=N2_flipBookSpeedMult;
float l9_1107=l9_1099;
float l9_1108=floor(l9_1103.x);
float l9_1109=floor(l9_1103.y);
float l9_1110=1.0/l9_1108;
float l9_1111=1.0/l9_1109;
float l9_1112=fast::min(l9_1108*l9_1109,floor(l9_1104));
float l9_1113=floor(mod((l9_1107*l9_1106)+floor(l9_1105),l9_1112));
float l9_1114=floor(l9_1113/l9_1108);
float l9_1115=mod(l9_1113,l9_1108);
float2 l9_1116=float2((l9_1110*l9_1102.x)+(l9_1115*l9_1110),((1.0-l9_1111)-(l9_1114*l9_1111))+(l9_1111*l9_1102.y));
l9_1094=l9_1116;
float2 l9_1117=l9_1094;
float4 l9_1118=float4(0.0);
int l9_1119=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_1120=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1120=0;
}
else
{
l9_1120=in.varStereoViewID;
}
int l9_1121=l9_1120;
l9_1119=1-l9_1121;
}
else
{
int l9_1122=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1122=0;
}
else
{
l9_1122=in.varStereoViewID;
}
int l9_1123=l9_1122;
l9_1119=l9_1123;
}
int l9_1124=l9_1119;
int l9_1125=mainTextureLayout_tmp;
int l9_1126=l9_1124;
float2 l9_1127=l9_1117;
bool l9_1128=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_1129=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_1130=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_1131=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_1132=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_1133=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_1134=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_1135=0.0;
bool l9_1136=l9_1133&&(!l9_1131);
float l9_1137=1.0;
float l9_1138=l9_1127.x;
int l9_1139=l9_1130.x;
if (l9_1139==1)
{
l9_1138=fract(l9_1138);
}
else
{
if (l9_1139==2)
{
float l9_1140=fract(l9_1138);
float l9_1141=l9_1138-l9_1140;
float l9_1142=step(0.25,fract(l9_1141*0.5));
l9_1138=mix(l9_1140,1.0-l9_1140,fast::clamp(l9_1142,0.0,1.0));
}
}
l9_1127.x=l9_1138;
float l9_1143=l9_1127.y;
int l9_1144=l9_1130.y;
if (l9_1144==1)
{
l9_1143=fract(l9_1143);
}
else
{
if (l9_1144==2)
{
float l9_1145=fract(l9_1143);
float l9_1146=l9_1143-l9_1145;
float l9_1147=step(0.25,fract(l9_1146*0.5));
l9_1143=mix(l9_1145,1.0-l9_1145,fast::clamp(l9_1147,0.0,1.0));
}
}
l9_1127.y=l9_1143;
if (l9_1131)
{
bool l9_1148=l9_1133;
bool l9_1149;
if (l9_1148)
{
l9_1149=l9_1130.x==3;
}
else
{
l9_1149=l9_1148;
}
float l9_1150=l9_1127.x;
float l9_1151=l9_1132.x;
float l9_1152=l9_1132.z;
bool l9_1153=l9_1149;
float l9_1154=l9_1137;
float l9_1155=fast::clamp(l9_1150,l9_1151,l9_1152);
float l9_1156=step(abs(l9_1150-l9_1155),9.9999997e-06);
l9_1154*=(l9_1156+((1.0-float(l9_1153))*(1.0-l9_1156)));
l9_1150=l9_1155;
l9_1127.x=l9_1150;
l9_1137=l9_1154;
bool l9_1157=l9_1133;
bool l9_1158;
if (l9_1157)
{
l9_1158=l9_1130.y==3;
}
else
{
l9_1158=l9_1157;
}
float l9_1159=l9_1127.y;
float l9_1160=l9_1132.y;
float l9_1161=l9_1132.w;
bool l9_1162=l9_1158;
float l9_1163=l9_1137;
float l9_1164=fast::clamp(l9_1159,l9_1160,l9_1161);
float l9_1165=step(abs(l9_1159-l9_1164),9.9999997e-06);
l9_1163*=(l9_1165+((1.0-float(l9_1162))*(1.0-l9_1165)));
l9_1159=l9_1164;
l9_1127.y=l9_1159;
l9_1137=l9_1163;
}
float2 l9_1166=l9_1127;
bool l9_1167=l9_1128;
float3x3 l9_1168=l9_1129;
if (l9_1167)
{
l9_1166=float2((l9_1168*float3(l9_1166,1.0)).xy);
}
float2 l9_1169=l9_1166;
float2 l9_1170=l9_1169;
float2 l9_1171=l9_1170;
l9_1127=l9_1171;
float l9_1172=l9_1127.x;
int l9_1173=l9_1130.x;
bool l9_1174=l9_1136;
float l9_1175=l9_1137;
if ((l9_1173==0)||(l9_1173==3))
{
float l9_1176=l9_1172;
float l9_1177=0.0;
float l9_1178=1.0;
bool l9_1179=l9_1174;
float l9_1180=l9_1175;
float l9_1181=fast::clamp(l9_1176,l9_1177,l9_1178);
float l9_1182=step(abs(l9_1176-l9_1181),9.9999997e-06);
l9_1180*=(l9_1182+((1.0-float(l9_1179))*(1.0-l9_1182)));
l9_1176=l9_1181;
l9_1172=l9_1176;
l9_1175=l9_1180;
}
l9_1127.x=l9_1172;
l9_1137=l9_1175;
float l9_1183=l9_1127.y;
int l9_1184=l9_1130.y;
bool l9_1185=l9_1136;
float l9_1186=l9_1137;
if ((l9_1184==0)||(l9_1184==3))
{
float l9_1187=l9_1183;
float l9_1188=0.0;
float l9_1189=1.0;
bool l9_1190=l9_1185;
float l9_1191=l9_1186;
float l9_1192=fast::clamp(l9_1187,l9_1188,l9_1189);
float l9_1193=step(abs(l9_1187-l9_1192),9.9999997e-06);
l9_1191*=(l9_1193+((1.0-float(l9_1190))*(1.0-l9_1193)));
l9_1187=l9_1192;
l9_1183=l9_1187;
l9_1186=l9_1191;
}
l9_1127.y=l9_1183;
l9_1137=l9_1186;
float2 l9_1194=l9_1127;
int l9_1195=l9_1125;
int l9_1196=l9_1126;
float l9_1197=l9_1135;
float2 l9_1198=l9_1194;
int l9_1199=l9_1195;
int l9_1200=l9_1196;
float3 l9_1201=float3(0.0);
if (l9_1199==0)
{
l9_1201=float3(l9_1198,0.0);
}
else
{
if (l9_1199==1)
{
l9_1201=float3(l9_1198.x,(l9_1198.y*0.5)+(0.5-(float(l9_1200)*0.5)),0.0);
}
else
{
l9_1201=float3(l9_1198,float(l9_1200));
}
}
float3 l9_1202=l9_1201;
float3 l9_1203=l9_1202;
float2 l9_1204=l9_1203.xy;
float l9_1205=l9_1197;
float4 l9_1206=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_1204,bias(l9_1205));
float4 l9_1207=l9_1206;
float4 l9_1208=l9_1207;
if (l9_1133)
{
l9_1208=mix(l9_1134,l9_1208,float4(l9_1137));
}
float4 l9_1209=l9_1208;
l9_1118=l9_1209;
float4 l9_1210=l9_1118;
l9_1093=l9_1210;
if (N2_ENABLE_FLIPBOOKBLEND)
{
float2 l9_1211=l9_1096;
float2 l9_1212=N2_gridSize;
float l9_1213=N2_numValidFrames;
float l9_1214=floor(mod(l9_1101+1.0,N2_numValidFrames));
float l9_1215=N2_flipBookSpeedMult;
float l9_1216=l9_1099;
float l9_1217=floor(l9_1212.x);
float l9_1218=floor(l9_1212.y);
float l9_1219=1.0/l9_1217;
float l9_1220=1.0/l9_1218;
float l9_1221=fast::min(l9_1217*l9_1218,floor(l9_1213));
float l9_1222=floor(mod((l9_1216*l9_1215)+floor(l9_1214),l9_1221));
float l9_1223=floor(l9_1222/l9_1217);
float l9_1224=mod(l9_1222,l9_1217);
float2 l9_1225=float2((l9_1219*l9_1211.x)+(l9_1224*l9_1219),((1.0-l9_1220)-(l9_1223*l9_1220))+(l9_1220*l9_1211.y));
l9_1096=l9_1225;
float4 l9_1226=l9_1093;
float2 l9_1227=l9_1096;
float4 l9_1228=float4(0.0);
int l9_1229=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_1230=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1230=0;
}
else
{
l9_1230=in.varStereoViewID;
}
int l9_1231=l9_1230;
l9_1229=1-l9_1231;
}
else
{
int l9_1232=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1232=0;
}
else
{
l9_1232=in.varStereoViewID;
}
int l9_1233=l9_1232;
l9_1229=l9_1233;
}
int l9_1234=l9_1229;
int l9_1235=mainTextureLayout_tmp;
int l9_1236=l9_1234;
float2 l9_1237=l9_1227;
bool l9_1238=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_1239=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_1240=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_1241=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_1242=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_1243=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_1244=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_1245=0.0;
bool l9_1246=l9_1243&&(!l9_1241);
float l9_1247=1.0;
float l9_1248=l9_1237.x;
int l9_1249=l9_1240.x;
if (l9_1249==1)
{
l9_1248=fract(l9_1248);
}
else
{
if (l9_1249==2)
{
float l9_1250=fract(l9_1248);
float l9_1251=l9_1248-l9_1250;
float l9_1252=step(0.25,fract(l9_1251*0.5));
l9_1248=mix(l9_1250,1.0-l9_1250,fast::clamp(l9_1252,0.0,1.0));
}
}
l9_1237.x=l9_1248;
float l9_1253=l9_1237.y;
int l9_1254=l9_1240.y;
if (l9_1254==1)
{
l9_1253=fract(l9_1253);
}
else
{
if (l9_1254==2)
{
float l9_1255=fract(l9_1253);
float l9_1256=l9_1253-l9_1255;
float l9_1257=step(0.25,fract(l9_1256*0.5));
l9_1253=mix(l9_1255,1.0-l9_1255,fast::clamp(l9_1257,0.0,1.0));
}
}
l9_1237.y=l9_1253;
if (l9_1241)
{
bool l9_1258=l9_1243;
bool l9_1259;
if (l9_1258)
{
l9_1259=l9_1240.x==3;
}
else
{
l9_1259=l9_1258;
}
float l9_1260=l9_1237.x;
float l9_1261=l9_1242.x;
float l9_1262=l9_1242.z;
bool l9_1263=l9_1259;
float l9_1264=l9_1247;
float l9_1265=fast::clamp(l9_1260,l9_1261,l9_1262);
float l9_1266=step(abs(l9_1260-l9_1265),9.9999997e-06);
l9_1264*=(l9_1266+((1.0-float(l9_1263))*(1.0-l9_1266)));
l9_1260=l9_1265;
l9_1237.x=l9_1260;
l9_1247=l9_1264;
bool l9_1267=l9_1243;
bool l9_1268;
if (l9_1267)
{
l9_1268=l9_1240.y==3;
}
else
{
l9_1268=l9_1267;
}
float l9_1269=l9_1237.y;
float l9_1270=l9_1242.y;
float l9_1271=l9_1242.w;
bool l9_1272=l9_1268;
float l9_1273=l9_1247;
float l9_1274=fast::clamp(l9_1269,l9_1270,l9_1271);
float l9_1275=step(abs(l9_1269-l9_1274),9.9999997e-06);
l9_1273*=(l9_1275+((1.0-float(l9_1272))*(1.0-l9_1275)));
l9_1269=l9_1274;
l9_1237.y=l9_1269;
l9_1247=l9_1273;
}
float2 l9_1276=l9_1237;
bool l9_1277=l9_1238;
float3x3 l9_1278=l9_1239;
if (l9_1277)
{
l9_1276=float2((l9_1278*float3(l9_1276,1.0)).xy);
}
float2 l9_1279=l9_1276;
float2 l9_1280=l9_1279;
float2 l9_1281=l9_1280;
l9_1237=l9_1281;
float l9_1282=l9_1237.x;
int l9_1283=l9_1240.x;
bool l9_1284=l9_1246;
float l9_1285=l9_1247;
if ((l9_1283==0)||(l9_1283==3))
{
float l9_1286=l9_1282;
float l9_1287=0.0;
float l9_1288=1.0;
bool l9_1289=l9_1284;
float l9_1290=l9_1285;
float l9_1291=fast::clamp(l9_1286,l9_1287,l9_1288);
float l9_1292=step(abs(l9_1286-l9_1291),9.9999997e-06);
l9_1290*=(l9_1292+((1.0-float(l9_1289))*(1.0-l9_1292)));
l9_1286=l9_1291;
l9_1282=l9_1286;
l9_1285=l9_1290;
}
l9_1237.x=l9_1282;
l9_1247=l9_1285;
float l9_1293=l9_1237.y;
int l9_1294=l9_1240.y;
bool l9_1295=l9_1246;
float l9_1296=l9_1247;
if ((l9_1294==0)||(l9_1294==3))
{
float l9_1297=l9_1293;
float l9_1298=0.0;
float l9_1299=1.0;
bool l9_1300=l9_1295;
float l9_1301=l9_1296;
float l9_1302=fast::clamp(l9_1297,l9_1298,l9_1299);
float l9_1303=step(abs(l9_1297-l9_1302),9.9999997e-06);
l9_1301*=(l9_1303+((1.0-float(l9_1300))*(1.0-l9_1303)));
l9_1297=l9_1302;
l9_1293=l9_1297;
l9_1296=l9_1301;
}
l9_1237.y=l9_1293;
l9_1247=l9_1296;
float2 l9_1304=l9_1237;
int l9_1305=l9_1235;
int l9_1306=l9_1236;
float l9_1307=l9_1245;
float2 l9_1308=l9_1304;
int l9_1309=l9_1305;
int l9_1310=l9_1306;
float3 l9_1311=float3(0.0);
if (l9_1309==0)
{
l9_1311=float3(l9_1308,0.0);
}
else
{
if (l9_1309==1)
{
l9_1311=float3(l9_1308.x,(l9_1308.y*0.5)+(0.5-(float(l9_1310)*0.5)),0.0);
}
else
{
l9_1311=float3(l9_1308,float(l9_1310));
}
}
float3 l9_1312=l9_1311;
float3 l9_1313=l9_1312;
float2 l9_1314=l9_1313.xy;
float l9_1315=l9_1307;
float4 l9_1316=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_1314,bias(l9_1315));
float4 l9_1317=l9_1316;
float4 l9_1318=l9_1317;
if (l9_1243)
{
l9_1318=mix(l9_1244,l9_1318,float4(l9_1247));
}
float4 l9_1319=l9_1318;
l9_1228=l9_1319;
float4 l9_1320=l9_1228;
l9_1093=mix(l9_1226,l9_1320,float4(fract((l9_1099*N2_flipBookSpeedMult)+l9_1101)));
}
}
}
float4 l9_1321=float4(1.0);
if (N2_ENABLE_COLORRAMP)
{
float l9_1322=ceil(l9_876*N2_texSize.x)/N2_texSize.x;
float l9_1323=l9_1322;
if (N2_ENABLE_NORANDOFFSET)
{
float2 l9_1324=tempGlobals.Surface_UVCoord0;
l9_1323+=(l9_1324.x/N2_texSize.x);
}
float2 l9_1325=float2(l9_1323,0.5);
float4 l9_1326=float4(0.0);
int l9_1327=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_1328=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1328=0;
}
else
{
l9_1328=in.varStereoViewID;
}
int l9_1329=l9_1328;
l9_1327=1-l9_1329;
}
else
{
int l9_1330=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1330=0;
}
else
{
l9_1330=in.varStereoViewID;
}
int l9_1331=l9_1330;
l9_1327=l9_1331;
}
int l9_1332=l9_1327;
int l9_1333=colorRampTextureLayout_tmp;
int l9_1334=l9_1332;
float2 l9_1335=l9_1325;
bool l9_1336=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_1337=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_1338=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_1339=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_1340=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_1341=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_1342=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_1343=0.0;
bool l9_1344=l9_1341&&(!l9_1339);
float l9_1345=1.0;
float l9_1346=l9_1335.x;
int l9_1347=l9_1338.x;
if (l9_1347==1)
{
l9_1346=fract(l9_1346);
}
else
{
if (l9_1347==2)
{
float l9_1348=fract(l9_1346);
float l9_1349=l9_1346-l9_1348;
float l9_1350=step(0.25,fract(l9_1349*0.5));
l9_1346=mix(l9_1348,1.0-l9_1348,fast::clamp(l9_1350,0.0,1.0));
}
}
l9_1335.x=l9_1346;
float l9_1351=l9_1335.y;
int l9_1352=l9_1338.y;
if (l9_1352==1)
{
l9_1351=fract(l9_1351);
}
else
{
if (l9_1352==2)
{
float l9_1353=fract(l9_1351);
float l9_1354=l9_1351-l9_1353;
float l9_1355=step(0.25,fract(l9_1354*0.5));
l9_1351=mix(l9_1353,1.0-l9_1353,fast::clamp(l9_1355,0.0,1.0));
}
}
l9_1335.y=l9_1351;
if (l9_1339)
{
bool l9_1356=l9_1341;
bool l9_1357;
if (l9_1356)
{
l9_1357=l9_1338.x==3;
}
else
{
l9_1357=l9_1356;
}
float l9_1358=l9_1335.x;
float l9_1359=l9_1340.x;
float l9_1360=l9_1340.z;
bool l9_1361=l9_1357;
float l9_1362=l9_1345;
float l9_1363=fast::clamp(l9_1358,l9_1359,l9_1360);
float l9_1364=step(abs(l9_1358-l9_1363),9.9999997e-06);
l9_1362*=(l9_1364+((1.0-float(l9_1361))*(1.0-l9_1364)));
l9_1358=l9_1363;
l9_1335.x=l9_1358;
l9_1345=l9_1362;
bool l9_1365=l9_1341;
bool l9_1366;
if (l9_1365)
{
l9_1366=l9_1338.y==3;
}
else
{
l9_1366=l9_1365;
}
float l9_1367=l9_1335.y;
float l9_1368=l9_1340.y;
float l9_1369=l9_1340.w;
bool l9_1370=l9_1366;
float l9_1371=l9_1345;
float l9_1372=fast::clamp(l9_1367,l9_1368,l9_1369);
float l9_1373=step(abs(l9_1367-l9_1372),9.9999997e-06);
l9_1371*=(l9_1373+((1.0-float(l9_1370))*(1.0-l9_1373)));
l9_1367=l9_1372;
l9_1335.y=l9_1367;
l9_1345=l9_1371;
}
float2 l9_1374=l9_1335;
bool l9_1375=l9_1336;
float3x3 l9_1376=l9_1337;
if (l9_1375)
{
l9_1374=float2((l9_1376*float3(l9_1374,1.0)).xy);
}
float2 l9_1377=l9_1374;
float2 l9_1378=l9_1377;
float2 l9_1379=l9_1378;
l9_1335=l9_1379;
float l9_1380=l9_1335.x;
int l9_1381=l9_1338.x;
bool l9_1382=l9_1344;
float l9_1383=l9_1345;
if ((l9_1381==0)||(l9_1381==3))
{
float l9_1384=l9_1380;
float l9_1385=0.0;
float l9_1386=1.0;
bool l9_1387=l9_1382;
float l9_1388=l9_1383;
float l9_1389=fast::clamp(l9_1384,l9_1385,l9_1386);
float l9_1390=step(abs(l9_1384-l9_1389),9.9999997e-06);
l9_1388*=(l9_1390+((1.0-float(l9_1387))*(1.0-l9_1390)));
l9_1384=l9_1389;
l9_1380=l9_1384;
l9_1383=l9_1388;
}
l9_1335.x=l9_1380;
l9_1345=l9_1383;
float l9_1391=l9_1335.y;
int l9_1392=l9_1338.y;
bool l9_1393=l9_1344;
float l9_1394=l9_1345;
if ((l9_1392==0)||(l9_1392==3))
{
float l9_1395=l9_1391;
float l9_1396=0.0;
float l9_1397=1.0;
bool l9_1398=l9_1393;
float l9_1399=l9_1394;
float l9_1400=fast::clamp(l9_1395,l9_1396,l9_1397);
float l9_1401=step(abs(l9_1395-l9_1400),9.9999997e-06);
l9_1399*=(l9_1401+((1.0-float(l9_1398))*(1.0-l9_1401)));
l9_1395=l9_1400;
l9_1391=l9_1395;
l9_1394=l9_1399;
}
l9_1335.y=l9_1391;
l9_1345=l9_1394;
float2 l9_1402=l9_1335;
int l9_1403=l9_1333;
int l9_1404=l9_1334;
float l9_1405=l9_1343;
float2 l9_1406=l9_1402;
int l9_1407=l9_1403;
int l9_1408=l9_1404;
float3 l9_1409=float3(0.0);
if (l9_1407==0)
{
l9_1409=float3(l9_1406,0.0);
}
else
{
if (l9_1407==1)
{
l9_1409=float3(l9_1406.x,(l9_1406.y*0.5)+(0.5-(float(l9_1408)*0.5)),0.0);
}
else
{
l9_1409=float3(l9_1406,float(l9_1408));
}
}
float3 l9_1410=l9_1409;
float3 l9_1411=l9_1410;
float2 l9_1412=l9_1411.xy;
float l9_1413=l9_1405;
float4 l9_1414=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_1412,bias(l9_1413));
float4 l9_1415=l9_1414;
float4 l9_1416=l9_1415;
if (l9_1341)
{
l9_1416=mix(l9_1342,l9_1416,float4(l9_1345));
}
float4 l9_1417=l9_1416;
l9_1326=l9_1417;
float4 l9_1418=l9_1326;
l9_1321=l9_1418*N2_colorRampMult;
}
float4 l9_1419=float4(1.0);
float4 l9_1420=float4(1.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
N2_uv=l9_1094;
l9_1419=l9_1093;
}
else
{
float2 l9_1421=N2_uv;
float4 l9_1422=float4(0.0);
int l9_1423=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_1424=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1424=0;
}
else
{
l9_1424=in.varStereoViewID;
}
int l9_1425=l9_1424;
l9_1423=1-l9_1425;
}
else
{
int l9_1426=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1426=0;
}
else
{
l9_1426=in.varStereoViewID;
}
int l9_1427=l9_1426;
l9_1423=l9_1427;
}
int l9_1428=l9_1423;
int l9_1429=mainTextureLayout_tmp;
int l9_1430=l9_1428;
float2 l9_1431=l9_1421;
bool l9_1432=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_1433=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_1434=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_1435=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_1436=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_1437=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_1438=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_1439=0.0;
bool l9_1440=l9_1437&&(!l9_1435);
float l9_1441=1.0;
float l9_1442=l9_1431.x;
int l9_1443=l9_1434.x;
if (l9_1443==1)
{
l9_1442=fract(l9_1442);
}
else
{
if (l9_1443==2)
{
float l9_1444=fract(l9_1442);
float l9_1445=l9_1442-l9_1444;
float l9_1446=step(0.25,fract(l9_1445*0.5));
l9_1442=mix(l9_1444,1.0-l9_1444,fast::clamp(l9_1446,0.0,1.0));
}
}
l9_1431.x=l9_1442;
float l9_1447=l9_1431.y;
int l9_1448=l9_1434.y;
if (l9_1448==1)
{
l9_1447=fract(l9_1447);
}
else
{
if (l9_1448==2)
{
float l9_1449=fract(l9_1447);
float l9_1450=l9_1447-l9_1449;
float l9_1451=step(0.25,fract(l9_1450*0.5));
l9_1447=mix(l9_1449,1.0-l9_1449,fast::clamp(l9_1451,0.0,1.0));
}
}
l9_1431.y=l9_1447;
if (l9_1435)
{
bool l9_1452=l9_1437;
bool l9_1453;
if (l9_1452)
{
l9_1453=l9_1434.x==3;
}
else
{
l9_1453=l9_1452;
}
float l9_1454=l9_1431.x;
float l9_1455=l9_1436.x;
float l9_1456=l9_1436.z;
bool l9_1457=l9_1453;
float l9_1458=l9_1441;
float l9_1459=fast::clamp(l9_1454,l9_1455,l9_1456);
float l9_1460=step(abs(l9_1454-l9_1459),9.9999997e-06);
l9_1458*=(l9_1460+((1.0-float(l9_1457))*(1.0-l9_1460)));
l9_1454=l9_1459;
l9_1431.x=l9_1454;
l9_1441=l9_1458;
bool l9_1461=l9_1437;
bool l9_1462;
if (l9_1461)
{
l9_1462=l9_1434.y==3;
}
else
{
l9_1462=l9_1461;
}
float l9_1463=l9_1431.y;
float l9_1464=l9_1436.y;
float l9_1465=l9_1436.w;
bool l9_1466=l9_1462;
float l9_1467=l9_1441;
float l9_1468=fast::clamp(l9_1463,l9_1464,l9_1465);
float l9_1469=step(abs(l9_1463-l9_1468),9.9999997e-06);
l9_1467*=(l9_1469+((1.0-float(l9_1466))*(1.0-l9_1469)));
l9_1463=l9_1468;
l9_1431.y=l9_1463;
l9_1441=l9_1467;
}
float2 l9_1470=l9_1431;
bool l9_1471=l9_1432;
float3x3 l9_1472=l9_1433;
if (l9_1471)
{
l9_1470=float2((l9_1472*float3(l9_1470,1.0)).xy);
}
float2 l9_1473=l9_1470;
float2 l9_1474=l9_1473;
float2 l9_1475=l9_1474;
l9_1431=l9_1475;
float l9_1476=l9_1431.x;
int l9_1477=l9_1434.x;
bool l9_1478=l9_1440;
float l9_1479=l9_1441;
if ((l9_1477==0)||(l9_1477==3))
{
float l9_1480=l9_1476;
float l9_1481=0.0;
float l9_1482=1.0;
bool l9_1483=l9_1478;
float l9_1484=l9_1479;
float l9_1485=fast::clamp(l9_1480,l9_1481,l9_1482);
float l9_1486=step(abs(l9_1480-l9_1485),9.9999997e-06);
l9_1484*=(l9_1486+((1.0-float(l9_1483))*(1.0-l9_1486)));
l9_1480=l9_1485;
l9_1476=l9_1480;
l9_1479=l9_1484;
}
l9_1431.x=l9_1476;
l9_1441=l9_1479;
float l9_1487=l9_1431.y;
int l9_1488=l9_1434.y;
bool l9_1489=l9_1440;
float l9_1490=l9_1441;
if ((l9_1488==0)||(l9_1488==3))
{
float l9_1491=l9_1487;
float l9_1492=0.0;
float l9_1493=1.0;
bool l9_1494=l9_1489;
float l9_1495=l9_1490;
float l9_1496=fast::clamp(l9_1491,l9_1492,l9_1493);
float l9_1497=step(abs(l9_1491-l9_1496),9.9999997e-06);
l9_1495*=(l9_1497+((1.0-float(l9_1494))*(1.0-l9_1497)));
l9_1491=l9_1496;
l9_1487=l9_1491;
l9_1490=l9_1495;
}
l9_1431.y=l9_1487;
l9_1441=l9_1490;
float2 l9_1498=l9_1431;
int l9_1499=l9_1429;
int l9_1500=l9_1430;
float l9_1501=l9_1439;
float2 l9_1502=l9_1498;
int l9_1503=l9_1499;
int l9_1504=l9_1500;
float3 l9_1505=float3(0.0);
if (l9_1503==0)
{
l9_1505=float3(l9_1502,0.0);
}
else
{
if (l9_1503==1)
{
l9_1505=float3(l9_1502.x,(l9_1502.y*0.5)+(0.5-(float(l9_1504)*0.5)),0.0);
}
else
{
l9_1505=float3(l9_1502,float(l9_1504));
}
}
float3 l9_1506=l9_1505;
float3 l9_1507=l9_1506;
float2 l9_1508=l9_1507.xy;
float l9_1509=l9_1501;
float4 l9_1510=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_1508,bias(l9_1509));
float4 l9_1511=l9_1510;
float4 l9_1512=l9_1511;
if (l9_1437)
{
l9_1512=mix(l9_1438,l9_1512,float4(l9_1441));
}
float4 l9_1513=l9_1512;
l9_1422=l9_1513;
float4 l9_1514=l9_1422;
l9_1419=l9_1514;
}
}
if (N2_ENABLE_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_1420=l9_1321;
}
}
N2_result=(l9_1419*l9_1088)*l9_1420;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrail>0.0)
{
N2_result=(l9_885*l9_1088)*l9_1420;
N2_result.w*=l9_884;
}
}
if (N2_ENABLE_SCREENFADE)
{
N2_result.w*=N2_cameraFade_trailHeadTime_taper.x;
}
if (N2_ENABLE_ALPHADISSOLVE)
{
float l9_1515=l9_876*N2_alphaDissolveMult;
N2_result.w=fast::clamp(N2_result.w-l9_1515,0.0,1.0);
}
if (N2_ENABLE_BLACKASALPHA)
{
float l9_1516=length(N2_result.xyz);
N2_result.w=l9_1516;
if (N2_ENABLE_TRAILS)
{
N2_result.w*=l9_884;
}
}
if (N2_ENABLE_PREMULTIPLIEDCOLOR)
{
float3 l9_1517=N2_result.xyz*N2_result.w;
N2_result=float4(l9_1517.x,l9_1517.y,l9_1517.z,N2_result.w);
}
l9_850=N2_uv;
l9_824=l9_850;
float4 l9_1518=float4(0.0);
float2 l9_1519=l9_824;
int l9_1520=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_1521=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1521=0;
}
else
{
l9_1521=in.varStereoViewID;
}
int l9_1522=l9_1521;
l9_1520=1-l9_1522;
}
else
{
int l9_1523=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1523=0;
}
else
{
l9_1523=in.varStereoViewID;
}
int l9_1524=l9_1523;
l9_1520=l9_1524;
}
int l9_1525=l9_1520;
int l9_1526=normalTexLayout_tmp;
int l9_1527=l9_1525;
float2 l9_1528=l9_1519;
bool l9_1529=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_1530=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_1531=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_1532=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_1533=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_1534=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_1535=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_1536=0.0;
bool l9_1537=l9_1534&&(!l9_1532);
float l9_1538=1.0;
float l9_1539=l9_1528.x;
int l9_1540=l9_1531.x;
if (l9_1540==1)
{
l9_1539=fract(l9_1539);
}
else
{
if (l9_1540==2)
{
float l9_1541=fract(l9_1539);
float l9_1542=l9_1539-l9_1541;
float l9_1543=step(0.25,fract(l9_1542*0.5));
l9_1539=mix(l9_1541,1.0-l9_1541,fast::clamp(l9_1543,0.0,1.0));
}
}
l9_1528.x=l9_1539;
float l9_1544=l9_1528.y;
int l9_1545=l9_1531.y;
if (l9_1545==1)
{
l9_1544=fract(l9_1544);
}
else
{
if (l9_1545==2)
{
float l9_1546=fract(l9_1544);
float l9_1547=l9_1544-l9_1546;
float l9_1548=step(0.25,fract(l9_1547*0.5));
l9_1544=mix(l9_1546,1.0-l9_1546,fast::clamp(l9_1548,0.0,1.0));
}
}
l9_1528.y=l9_1544;
if (l9_1532)
{
bool l9_1549=l9_1534;
bool l9_1550;
if (l9_1549)
{
l9_1550=l9_1531.x==3;
}
else
{
l9_1550=l9_1549;
}
float l9_1551=l9_1528.x;
float l9_1552=l9_1533.x;
float l9_1553=l9_1533.z;
bool l9_1554=l9_1550;
float l9_1555=l9_1538;
float l9_1556=fast::clamp(l9_1551,l9_1552,l9_1553);
float l9_1557=step(abs(l9_1551-l9_1556),9.9999997e-06);
l9_1555*=(l9_1557+((1.0-float(l9_1554))*(1.0-l9_1557)));
l9_1551=l9_1556;
l9_1528.x=l9_1551;
l9_1538=l9_1555;
bool l9_1558=l9_1534;
bool l9_1559;
if (l9_1558)
{
l9_1559=l9_1531.y==3;
}
else
{
l9_1559=l9_1558;
}
float l9_1560=l9_1528.y;
float l9_1561=l9_1533.y;
float l9_1562=l9_1533.w;
bool l9_1563=l9_1559;
float l9_1564=l9_1538;
float l9_1565=fast::clamp(l9_1560,l9_1561,l9_1562);
float l9_1566=step(abs(l9_1560-l9_1565),9.9999997e-06);
l9_1564*=(l9_1566+((1.0-float(l9_1563))*(1.0-l9_1566)));
l9_1560=l9_1565;
l9_1528.y=l9_1560;
l9_1538=l9_1564;
}
float2 l9_1567=l9_1528;
bool l9_1568=l9_1529;
float3x3 l9_1569=l9_1530;
if (l9_1568)
{
l9_1567=float2((l9_1569*float3(l9_1567,1.0)).xy);
}
float2 l9_1570=l9_1567;
float2 l9_1571=l9_1570;
float2 l9_1572=l9_1571;
l9_1528=l9_1572;
float l9_1573=l9_1528.x;
int l9_1574=l9_1531.x;
bool l9_1575=l9_1537;
float l9_1576=l9_1538;
if ((l9_1574==0)||(l9_1574==3))
{
float l9_1577=l9_1573;
float l9_1578=0.0;
float l9_1579=1.0;
bool l9_1580=l9_1575;
float l9_1581=l9_1576;
float l9_1582=fast::clamp(l9_1577,l9_1578,l9_1579);
float l9_1583=step(abs(l9_1577-l9_1582),9.9999997e-06);
l9_1581*=(l9_1583+((1.0-float(l9_1580))*(1.0-l9_1583)));
l9_1577=l9_1582;
l9_1573=l9_1577;
l9_1576=l9_1581;
}
l9_1528.x=l9_1573;
l9_1538=l9_1576;
float l9_1584=l9_1528.y;
int l9_1585=l9_1531.y;
bool l9_1586=l9_1537;
float l9_1587=l9_1538;
if ((l9_1585==0)||(l9_1585==3))
{
float l9_1588=l9_1584;
float l9_1589=0.0;
float l9_1590=1.0;
bool l9_1591=l9_1586;
float l9_1592=l9_1587;
float l9_1593=fast::clamp(l9_1588,l9_1589,l9_1590);
float l9_1594=step(abs(l9_1588-l9_1593),9.9999997e-06);
l9_1592*=(l9_1594+((1.0-float(l9_1591))*(1.0-l9_1594)));
l9_1588=l9_1593;
l9_1584=l9_1588;
l9_1587=l9_1592;
}
l9_1528.y=l9_1584;
l9_1538=l9_1587;
float2 l9_1595=l9_1528;
int l9_1596=l9_1526;
int l9_1597=l9_1527;
float l9_1598=l9_1536;
float2 l9_1599=l9_1595;
int l9_1600=l9_1596;
int l9_1601=l9_1597;
float3 l9_1602=float3(0.0);
if (l9_1600==0)
{
l9_1602=float3(l9_1599,0.0);
}
else
{
if (l9_1600==1)
{
l9_1602=float3(l9_1599.x,(l9_1599.y*0.5)+(0.5-(float(l9_1601)*0.5)),0.0);
}
else
{
l9_1602=float3(l9_1599,float(l9_1601));
}
}
float3 l9_1603=l9_1602;
float3 l9_1604=l9_1603;
float2 l9_1605=l9_1604.xy;
float l9_1606=l9_1598;
float4 l9_1607=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_1605,bias(l9_1606));
float4 l9_1608=l9_1607;
float4 l9_1609=l9_1608;
if (l9_1534)
{
l9_1609=mix(l9_1535,l9_1609,float4(l9_1538));
}
float4 l9_1610=l9_1609;
float4 l9_1611=l9_1610;
float3 l9_1612=(l9_1611.xyz*1.9921875)-float3(1.0);
l9_1611=float4(l9_1612.x,l9_1612.y,l9_1612.z,l9_1611.w);
l9_1518=l9_1611;
l9_759=l9_1518.xyz;
l9_762=l9_759;
}
else
{
l9_762=l9_760;
}
l9_758=l9_762;
float4 l9_1613=float4(0.0);
int l9_1614=0;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_1615=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1615=0;
}
else
{
l9_1615=in.varStereoViewID;
}
int l9_1616=l9_1615;
l9_1614=1-l9_1616;
}
else
{
int l9_1617=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1617=0;
}
else
{
l9_1617=in.varStereoViewID;
}
int l9_1618=l9_1617;
l9_1614=l9_1618;
}
int l9_1619=l9_1614;
int l9_1620=materialParamsTexLayout_tmp;
int l9_1621=l9_1619;
float2 l9_1622=param.Surface_UVCoord0;
bool l9_1623=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_1624=(*sc_set0.UserUniforms).materialParamsTexTransform;
int2 l9_1625=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_1626=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_1627=(*sc_set0.UserUniforms).materialParamsTexUvMinMax;
bool l9_1628=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_1629=(*sc_set0.UserUniforms).materialParamsTexBorderColor;
float l9_1630=0.0;
bool l9_1631=l9_1628&&(!l9_1626);
float l9_1632=1.0;
float l9_1633=l9_1622.x;
int l9_1634=l9_1625.x;
if (l9_1634==1)
{
l9_1633=fract(l9_1633);
}
else
{
if (l9_1634==2)
{
float l9_1635=fract(l9_1633);
float l9_1636=l9_1633-l9_1635;
float l9_1637=step(0.25,fract(l9_1636*0.5));
l9_1633=mix(l9_1635,1.0-l9_1635,fast::clamp(l9_1637,0.0,1.0));
}
}
l9_1622.x=l9_1633;
float l9_1638=l9_1622.y;
int l9_1639=l9_1625.y;
if (l9_1639==1)
{
l9_1638=fract(l9_1638);
}
else
{
if (l9_1639==2)
{
float l9_1640=fract(l9_1638);
float l9_1641=l9_1638-l9_1640;
float l9_1642=step(0.25,fract(l9_1641*0.5));
l9_1638=mix(l9_1640,1.0-l9_1640,fast::clamp(l9_1642,0.0,1.0));
}
}
l9_1622.y=l9_1638;
if (l9_1626)
{
bool l9_1643=l9_1628;
bool l9_1644;
if (l9_1643)
{
l9_1644=l9_1625.x==3;
}
else
{
l9_1644=l9_1643;
}
float l9_1645=l9_1622.x;
float l9_1646=l9_1627.x;
float l9_1647=l9_1627.z;
bool l9_1648=l9_1644;
float l9_1649=l9_1632;
float l9_1650=fast::clamp(l9_1645,l9_1646,l9_1647);
float l9_1651=step(abs(l9_1645-l9_1650),9.9999997e-06);
l9_1649*=(l9_1651+((1.0-float(l9_1648))*(1.0-l9_1651)));
l9_1645=l9_1650;
l9_1622.x=l9_1645;
l9_1632=l9_1649;
bool l9_1652=l9_1628;
bool l9_1653;
if (l9_1652)
{
l9_1653=l9_1625.y==3;
}
else
{
l9_1653=l9_1652;
}
float l9_1654=l9_1622.y;
float l9_1655=l9_1627.y;
float l9_1656=l9_1627.w;
bool l9_1657=l9_1653;
float l9_1658=l9_1632;
float l9_1659=fast::clamp(l9_1654,l9_1655,l9_1656);
float l9_1660=step(abs(l9_1654-l9_1659),9.9999997e-06);
l9_1658*=(l9_1660+((1.0-float(l9_1657))*(1.0-l9_1660)));
l9_1654=l9_1659;
l9_1622.y=l9_1654;
l9_1632=l9_1658;
}
float2 l9_1661=l9_1622;
bool l9_1662=l9_1623;
float3x3 l9_1663=l9_1624;
if (l9_1662)
{
l9_1661=float2((l9_1663*float3(l9_1661,1.0)).xy);
}
float2 l9_1664=l9_1661;
float2 l9_1665=l9_1664;
float2 l9_1666=l9_1665;
l9_1622=l9_1666;
float l9_1667=l9_1622.x;
int l9_1668=l9_1625.x;
bool l9_1669=l9_1631;
float l9_1670=l9_1632;
if ((l9_1668==0)||(l9_1668==3))
{
float l9_1671=l9_1667;
float l9_1672=0.0;
float l9_1673=1.0;
bool l9_1674=l9_1669;
float l9_1675=l9_1670;
float l9_1676=fast::clamp(l9_1671,l9_1672,l9_1673);
float l9_1677=step(abs(l9_1671-l9_1676),9.9999997e-06);
l9_1675*=(l9_1677+((1.0-float(l9_1674))*(1.0-l9_1677)));
l9_1671=l9_1676;
l9_1667=l9_1671;
l9_1670=l9_1675;
}
l9_1622.x=l9_1667;
l9_1632=l9_1670;
float l9_1678=l9_1622.y;
int l9_1679=l9_1625.y;
bool l9_1680=l9_1631;
float l9_1681=l9_1632;
if ((l9_1679==0)||(l9_1679==3))
{
float l9_1682=l9_1678;
float l9_1683=0.0;
float l9_1684=1.0;
bool l9_1685=l9_1680;
float l9_1686=l9_1681;
float l9_1687=fast::clamp(l9_1682,l9_1683,l9_1684);
float l9_1688=step(abs(l9_1682-l9_1687),9.9999997e-06);
l9_1686*=(l9_1688+((1.0-float(l9_1685))*(1.0-l9_1688)));
l9_1682=l9_1687;
l9_1678=l9_1682;
l9_1681=l9_1686;
}
l9_1622.y=l9_1678;
l9_1632=l9_1681;
float2 l9_1689=l9_1622;
int l9_1690=l9_1620;
int l9_1691=l9_1621;
float l9_1692=l9_1630;
float2 l9_1693=l9_1689;
int l9_1694=l9_1690;
int l9_1695=l9_1691;
float3 l9_1696=float3(0.0);
if (l9_1694==0)
{
l9_1696=float3(l9_1693,0.0);
}
else
{
if (l9_1694==1)
{
l9_1696=float3(l9_1693.x,(l9_1693.y*0.5)+(0.5-(float(l9_1695)*0.5)),0.0);
}
else
{
l9_1696=float3(l9_1693,float(l9_1695));
}
}
float3 l9_1697=l9_1696;
float3 l9_1698=l9_1697;
float2 l9_1699=l9_1698.xy;
float l9_1700=l9_1692;
float4 l9_1701=sc_set0.materialParamsTex.sample(sc_set0.materialParamsTexSmpSC,l9_1699,bias(l9_1700));
float4 l9_1702=l9_1701;
float4 l9_1703=l9_1702;
if (l9_1628)
{
l9_1703=mix(l9_1629,l9_1703,float4(l9_1632));
}
float4 l9_1704=l9_1703;
l9_1613=l9_1704;
float l9_1705=0.0;
float4 l9_1706=l9_1613;
float l9_1707=l9_1706.y;
l9_1705=l9_1707;
float l9_1708=l9_755;
float3 l9_1709=l9_758;
float l9_1710=l9_1705;
ssGlobals l9_1711=param;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1711.BumpedNormal=float3x3(float3(l9_1711.VertexTangent_WorldSpace),float3(l9_1711.VertexBinormal_WorldSpace),float3(l9_1711.VertexNormal_WorldSpace))*l9_1709;
}
l9_1708=fast::clamp(l9_1708,0.0,1.0);
float l9_1712=l9_1708;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1712<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1713=gl_FragCoord;
float2 l9_1714=floor(mod(l9_1713.xy,float2(4.0)));
float l9_1715=(mod(dot(l9_1714,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1712<l9_1715)
{
discard_fragment();
}
}
float3 l9_1716=l9_1711.PositionWS;
float3 l9_1717=l9_1711.BumpedNormal;
float l9_1718=l9_1710;
float3 l9_1719=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_1716);
if (dot(l9_1719,l9_1717)>=(-0.050000001))
{
uint3 l9_1720=uint3(round((l9_1716-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_1720.x,l9_1720.y,l9_1720.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_1721=l9_1717;
float l9_1722=dot(abs(l9_1721),float3(1.0));
l9_1721/=float3(l9_1722);
float l9_1723=fast::clamp(-l9_1721.z,0.0,1.0);
float2 l9_1724=l9_1721.xy;
float l9_1725;
if (l9_1721.x>=0.0)
{
l9_1725=l9_1723;
}
else
{
l9_1725=-l9_1723;
}
l9_1724.x+=l9_1725;
float l9_1726;
if (l9_1721.y>=0.0)
{
l9_1726=l9_1723;
}
else
{
l9_1726=-l9_1723;
}
l9_1724.y+=l9_1726;
float2 l9_1727=l9_1724;
float2 l9_1728=l9_1727;
uint2 l9_1729=uint2(as_type<uint>(half2(float2(l9_1728.x,0.0))),as_type<uint>(half2(float2(l9_1728.y,0.0))));
out.normal_and_more=uint4(l9_1729.x,l9_1729.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_1730;
if (l9_1718<0.0)
{
l9_1730=1023u;
}
else
{
l9_1730=uint(fast::clamp(l9_1718,0.0,1.0)*1000.0);
}
uint l9_1731=l9_1730;
l9_1731 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_1731;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float l9_1732=0.0;
float l9_1733;
if ((int(TRAILS_tmp)!=0))
{
l9_1733=1.001;
}
else
{
l9_1733=0.001;
}
l9_1733-=0.001;
l9_1732=l9_1733;
float4 l9_1734=float4(0.0);
l9_1734=param.VertexColor;
float l9_1735=0.0;
l9_1735=l9_1734.x;
float l9_1736=0.0;
float l9_1737=l9_1732;
bool l9_1738=(l9_1737*1.0)!=0.0;
bool l9_1739;
if (l9_1738)
{
l9_1739=(l9_1735*1.0)!=0.0;
}
else
{
l9_1739=l9_1738;
}
l9_1736=float(l9_1739);
float2 l9_1740=float2(0.0);
float2 l9_1741=(*sc_set0.UserUniforms).trailFadeStartEnd;
l9_1740=l9_1741;
float2 l9_1742=float2(0.0);
float l9_1743=(*sc_set0.UserUniforms).Port_Input1_N216;
float2 l9_1744=float2(0.0);
float2 l9_1745;
if (TRAILBEHAVIOR_tmp!=0)
{
l9_1745=float2(l9_1743);
}
else
{
float2 l9_1746=float2(0.0);
float2 l9_1747=(*sc_set0.UserUniforms).trailFadeInOut;
l9_1746=l9_1747;
l9_1744=l9_1746;
l9_1745=l9_1744;
}
l9_1742=l9_1745;
float4 l9_1748=float4(0.0);
l9_1748=float4(l9_1740.x,l9_1740.y,l9_1748.z,l9_1748.w);
l9_1748=float4(l9_1748.x,l9_1748.y,l9_1742.x,l9_1742.y);
float3 l9_1749=float3(0.0);
float3 l9_1750=(*sc_set0.UserUniforms).colorStart;
l9_1749=l9_1750;
float3 l9_1751=float3(0.0);
float3 l9_1752=(*sc_set0.UserUniforms).colorEnd;
l9_1751=l9_1752;
float3 l9_1753=float3(0.0);
float3 l9_1754=(*sc_set0.UserUniforms).colorMinStart;
l9_1753=l9_1754;
float3 l9_1755=float3(0.0);
float3 l9_1756=(*sc_set0.UserUniforms).colorMinEnd;
l9_1755=l9_1756;
float3 l9_1757=float3(0.0);
float3 l9_1758=(*sc_set0.UserUniforms).colorMaxStart;
l9_1757=l9_1758;
float3 l9_1759=float3(0.0);
float3 l9_1760=(*sc_set0.UserUniforms).colorMaxEnd;
l9_1759=l9_1760;
float l9_1761=0.0;
float l9_1762=(*sc_set0.UserUniforms).alphaStart;
l9_1761=l9_1762;
float l9_1763=0.0;
float l9_1764=(*sc_set0.UserUniforms).alphaEnd;
l9_1763=l9_1764;
float l9_1765=0.0;
float l9_1766=(*sc_set0.UserUniforms).alphaMinStart;
l9_1765=l9_1766;
float l9_1767=0.0;
float l9_1768=(*sc_set0.UserUniforms).alphaMinEnd;
l9_1767=l9_1768;
float l9_1769=0.0;
float l9_1770=(*sc_set0.UserUniforms).alphaMaxStart;
l9_1769=l9_1770;
float l9_1771=0.0;
float l9_1772=(*sc_set0.UserUniforms).alphaMaxEnd;
l9_1771=l9_1772;
float l9_1773=0.0;
float l9_1774=(*sc_set0.UserUniforms).alphaDissolveMult;
l9_1773=l9_1774;
float l9_1775=0.0;
float l9_1776=(*sc_set0.UserUniforms).numValidFrames;
l9_1775=l9_1776;
float2 l9_1777=float2(0.0);
float2 l9_1778=(*sc_set0.UserUniforms).gridSize;
l9_1777=l9_1778;
float l9_1779=0.0;
float l9_1780=(*sc_set0.UserUniforms).flipBookSpeedMult;
l9_1779=l9_1780;
float l9_1781=0.0;
float l9_1782=(*sc_set0.UserUniforms).flipBookRandomStart;
l9_1781=l9_1782;
float2 l9_1783=float2(0.0);
float2 l9_1784=(*sc_set0.UserUniforms).colorRampTextureSize.xy;
l9_1783=l9_1784;
float4 l9_1785=float4(0.0);
float4 l9_1786=(*sc_set0.UserUniforms).colorRampMult;
l9_1785=l9_1786;
float l9_1787=0.0;
float l9_1788=(*sc_set0.UserUniforms).externalSeed;
l9_1787=l9_1788;
float4 l9_1789=float4(0.0);
float4 l9_1790;
l9_1790.x=in.Interpolator0.x;
l9_1790.y=in.Interpolator0.y;
l9_1790.z=in.Interpolator0.z;
l9_1790.w=in.Interpolator0.w;
l9_1789=l9_1790;
float4 l9_1791=float4(0.0);
float4 l9_1792;
l9_1792.x=in.Interpolator1.x;
l9_1792.y=in.Interpolator1.y;
l9_1792.z=in.Interpolator1.z;
l9_1792.w=in.Interpolator1.w;
l9_1791=l9_1792;
float l9_1793=l9_1736;
float4 l9_1794=l9_1748;
float3 l9_1795=l9_1749;
float3 l9_1796=l9_1751;
float3 l9_1797=l9_1753;
float3 l9_1798=l9_1755;
float3 l9_1799=l9_1757;
float3 l9_1800=l9_1759;
float l9_1801=l9_1761;
float l9_1802=l9_1763;
float l9_1803=l9_1765;
float l9_1804=l9_1767;
float l9_1805=l9_1769;
float l9_1806=l9_1771;
float l9_1807=l9_1773;
float l9_1808=l9_1775;
float2 l9_1809=l9_1777;
float l9_1810=l9_1779;
float l9_1811=l9_1781;
float2 l9_1812=l9_1783;
float4 l9_1813=l9_1785;
float l9_1814=l9_1787;
float4 l9_1815=l9_1789;
float4 l9_1816=l9_1791;
ssGlobals l9_1817=param;
tempGlobals=l9_1817;
N2_ENABLE_TRAILS=(int(TRAILS_tmp)!=0);
N2_ENABLE_INDEPENDENTTRAIL=TRAILBEHAVIOR_tmp!=0;
N2_isTrailCondition=l9_1793!=0.0;
N2_ENABLE_TRAILTEXTURE=(int(TRAILTEXTURE_tmp)!=0);
N2_ENABLE_TRAILCOLORRAMP=(int(TRAILCOLORRAMP_tmp)!=0);
N2_fadeInOut=l9_1794;
N2_colorStart=l9_1795;
N2_colorEnd=l9_1796;
N2_ENABLE_COLORMINMAX=(int(COLORMINMAX_tmp)!=0);
N2_colorMinStart=l9_1797;
N2_colorMinEnd=l9_1798;
N2_colorMaxStart=l9_1799;
N2_colorMaxEnd=l9_1800;
N2_ENABLE_COLORMONOMIN=(int(COLORMONOMIN_tmp)!=0);
N2_alphaStart=l9_1801;
N2_alphaEnd=l9_1802;
N2_ENABLE_ALPHAMINMAX=(int(ALPHAMINMAX_tmp)!=0);
N2_alphaMinStart=l9_1803;
N2_alphaMinEnd=l9_1804;
N2_alphaMaxStart=l9_1805;
N2_alphaMaxEnd=l9_1806;
N2_ENABLE_ALPHADISSOLVE=(int(ALPHADISSOLVE_tmp)!=0);
N2_alphaDissolveMult=l9_1807;
N2_ENABLE_PREMULTIPLIEDCOLOR=(int(PREMULTIPLIEDCOLOR_tmp)!=0);
N2_ENABLE_BLACKASALPHA=(int(BLACKASALPHA_tmp)!=0);
N2_ENABLE_SCREENFADE=(int(SCREENFADE_tmp)!=0);
N2_ENABLE_FLIPBOOK=(int(FLIPBOOK_tmp)!=0);
N2_numValidFrames=l9_1808;
N2_gridSize=l9_1809;
N2_flipBookSpeedMult=l9_1810;
N2_flipBookRandomStart=l9_1811;
N2_ENABLE_FLIPBOOKBLEND=(int(FLIPBOOKBLEND_tmp)!=0);
N2_ENABLE_FLIPBOOKBYLIFE=(int(FLIPBOOKBYLIFE_tmp)!=0);
N2_ENABLE_COLORRAMP=(int(COLORRAMP_tmp)!=0);
N2_texSize=l9_1812;
N2_colorRampMult=l9_1813;
N2_ENABLE_NORANDOFFSET=(int(NORANDOFFSET_tmp)!=0);
N2_ENABLE_BASETEXTURE=(int(BASETEXTURE_tmp)!=0);
N2_ENABLE_WORLDPOSSEED=(int(WORLDPOSSEED_tmp)!=0);
N2_externalSeed=l9_1814;
N2_timeValuesIn=l9_1815;
N2_cameraFade_trailHeadTime_taper=l9_1816;
float l9_1818=0.0;
if (N2_ENABLE_WORLDPOSSEED)
{
float4x4 l9_1819=(*sc_set0.UserUniforms).sc_ModelMatrix;
l9_1818=length(float4(1.0)*l9_1819);
}
N2_globalSeed=N2_externalSeed+l9_1818;
int l9_1820=0;
l9_1820=int(tempGlobals.gInstanceID+0.5);
int l9_1821=l9_1820;
float l9_1822=float(l9_1821);
int l9_1823=int(l9_1822);
int l9_1824=l9_1823^(l9_1823*15299);
int l9_1825=l9_1824;
int l9_1826=l9_1825;
int l9_1827=((l9_1826*((l9_1826*1471343)+101146501))+1559861749)&2147483647;
int l9_1828=l9_1827;
int l9_1829=l9_1825*1399;
int l9_1830=((l9_1829*((l9_1829*1471343)+101146501))+1559861749)&2147483647;
int l9_1831=l9_1830;
int l9_1832=l9_1825*7177;
int l9_1833=((l9_1832*((l9_1832*1471343)+101146501))+1559861749)&2147483647;
int l9_1834=l9_1833;
int l9_1835=l9_1828;
float l9_1836=float(l9_1835)*4.6566129e-10;
int l9_1837=l9_1831;
float l9_1838=float(l9_1837)*4.6566129e-10;
int l9_1839=l9_1834;
float l9_1840=float(l9_1839)*4.6566129e-10;
float3 l9_1841=float3(l9_1836,l9_1838,l9_1840);
float3 l9_1842=l9_1841;
N2_particleSeed=l9_1842;
float l9_1843=N2_timeValuesIn.w;
float l9_1844=N2_particleSeed.x;
float l9_1845=N2_particleSeed.y;
float l9_1846=N2_particleSeed.z;
float3 l9_1847=fract((float3(l9_1844,l9_1845,l9_1846)*27.21883)+float3(N2_globalSeed));
if (N2_ENABLE_COLORMONOMIN)
{
l9_1847=fract((float3(l9_1844,l9_1844,l9_1844)*27.21883)+float3(N2_globalSeed));
}
float l9_1848=fract((N2_particleSeed.x*3121.3333)+N2_globalSeed);
float l9_1849=fract((N2_particleSeed.y*13.2234)+N2_globalSeed);
float l9_1850=fract((N2_particleSeed.z*3.5358)+N2_globalSeed);
N2_isTrail=0.0;
float l9_1851=1.0;
N2_trailHeadTime=N2_cameraFade_trailHeadTime_taper.yz;
float4 l9_1852=float4(1.0);
float2 l9_1853=tempGlobals.Surface_UVCoord0;
N2_uv=l9_1853;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrailCondition)
{
N2_isTrail=1.0;
float l9_1854=N2_cameraFade_trailHeadTime_taper.w;
float2 l9_1855=float2(0.5-(l9_1854/2.0),0.5+(l9_1854/2.0));
float l9_1856=N2_uv.x;
float l9_1857=l9_1855.x;
bool l9_1858=l9_1856<l9_1857;
bool l9_1859;
if (!l9_1858)
{
l9_1859=N2_uv.x>l9_1855.y;
}
else
{
l9_1859=l9_1858;
}
if (l9_1859)
{
discard_fragment();
}
N2_uv=float2(0.0+(((N2_uv.x-l9_1855.x)*1.0)/((l9_1855.y-l9_1855.x)+1e-06)),N2_uv.y);
if (N2_ENABLE_TRAILTEXTURE)
{
float2 l9_1860=float2(N2_uv.x,1.0-N2_uv.y);
float4 l9_1861=float4(0.0);
int l9_1862=0;
if ((int(trailTexHasSwappedViews_tmp)!=0))
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
int l9_1868=trailTexLayout_tmp;
int l9_1869=l9_1867;
float2 l9_1870=l9_1860;
bool l9_1871=(int(SC_USE_UV_TRANSFORM_trailTex_tmp)!=0);
float3x3 l9_1872=(*sc_set0.UserUniforms).trailTexTransform;
int2 l9_1873=int2(SC_SOFTWARE_WRAP_MODE_U_trailTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailTex_tmp);
bool l9_1874=(int(SC_USE_UV_MIN_MAX_trailTex_tmp)!=0);
float4 l9_1875=(*sc_set0.UserUniforms).trailTexUvMinMax;
bool l9_1876=(int(SC_USE_CLAMP_TO_BORDER_trailTex_tmp)!=0);
float4 l9_1877=(*sc_set0.UserUniforms).trailTexBorderColor;
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
float4 l9_1949=sc_set0.trailTex.sample(sc_set0.trailTexSmpSC,l9_1947,bias(l9_1948));
float4 l9_1950=l9_1949;
float4 l9_1951=l9_1950;
if (l9_1876)
{
l9_1951=mix(l9_1877,l9_1951,float4(l9_1880));
}
float4 l9_1952=l9_1951;
l9_1861=l9_1952;
float4 l9_1953=l9_1861;
l9_1852=l9_1953;
}
float l9_1954=fast::max(1e-06,N2_fadeInOut.x);
float l9_1955=N2_timeValuesIn.w;
l9_1851*=mix(0.0,1.0,fast::clamp(l9_1955,0.0,l9_1954)/l9_1954);
l9_1954=fast::max(1e-06,N2_fadeInOut.y);
l9_1851*=mix(0.0,1.0,fast::clamp(1.0-l9_1955,0.0,l9_1954)/l9_1954);
if (!N2_ENABLE_INDEPENDENTTRAIL)
{
l9_1843=N2_trailHeadTime.y;
l9_1954=fast::max(1e-06,N2_fadeInOut.z);
l9_1851*=mix(0.0,1.0,fast::clamp(l9_1843,0.0,l9_1954)/l9_1954);
l9_1954=fast::max(1e-06,N2_fadeInOut.w);
l9_1851*=mix(0.0,1.0,fast::clamp(1.0-l9_1843,0.0,l9_1954)/l9_1954);
}
if (N2_ENABLE_TRAILCOLORRAMP)
{
float2 l9_1956=float2(0.0);
l9_1956=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_1957=l9_1956;
float2 l9_1958=float2(0.0);
l9_1958=(*sc_set0.UserUniforms).trailColorRampTexSize.xy;
float2 l9_1959=l9_1958;
float l9_1960=ceil(l9_1843*l9_1957.x)/l9_1959.x;
float2 l9_1961=float2(l9_1960,0.5);
float4 l9_1962=float4(0.0);
int l9_1963=0;
if ((int(trailColorRampTexHasSwappedViews_tmp)!=0))
{
int l9_1964=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1964=0;
}
else
{
l9_1964=in.varStereoViewID;
}
int l9_1965=l9_1964;
l9_1963=1-l9_1965;
}
else
{
int l9_1966=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1966=0;
}
else
{
l9_1966=in.varStereoViewID;
}
int l9_1967=l9_1966;
l9_1963=l9_1967;
}
int l9_1968=l9_1963;
int l9_1969=trailColorRampTexLayout_tmp;
int l9_1970=l9_1968;
float2 l9_1971=l9_1961;
bool l9_1972=(int(SC_USE_UV_TRANSFORM_trailColorRampTex_tmp)!=0);
float3x3 l9_1973=(*sc_set0.UserUniforms).trailColorRampTexTransform;
int2 l9_1974=int2(SC_SOFTWARE_WRAP_MODE_U_trailColorRampTex_tmp,SC_SOFTWARE_WRAP_MODE_V_trailColorRampTex_tmp);
bool l9_1975=(int(SC_USE_UV_MIN_MAX_trailColorRampTex_tmp)!=0);
float4 l9_1976=(*sc_set0.UserUniforms).trailColorRampTexUvMinMax;
bool l9_1977=(int(SC_USE_CLAMP_TO_BORDER_trailColorRampTex_tmp)!=0);
float4 l9_1978=(*sc_set0.UserUniforms).trailColorRampTexBorderColor;
float l9_1979=0.0;
bool l9_1980=l9_1977&&(!l9_1975);
float l9_1981=1.0;
float l9_1982=l9_1971.x;
int l9_1983=l9_1974.x;
if (l9_1983==1)
{
l9_1982=fract(l9_1982);
}
else
{
if (l9_1983==2)
{
float l9_1984=fract(l9_1982);
float l9_1985=l9_1982-l9_1984;
float l9_1986=step(0.25,fract(l9_1985*0.5));
l9_1982=mix(l9_1984,1.0-l9_1984,fast::clamp(l9_1986,0.0,1.0));
}
}
l9_1971.x=l9_1982;
float l9_1987=l9_1971.y;
int l9_1988=l9_1974.y;
if (l9_1988==1)
{
l9_1987=fract(l9_1987);
}
else
{
if (l9_1988==2)
{
float l9_1989=fract(l9_1987);
float l9_1990=l9_1987-l9_1989;
float l9_1991=step(0.25,fract(l9_1990*0.5));
l9_1987=mix(l9_1989,1.0-l9_1989,fast::clamp(l9_1991,0.0,1.0));
}
}
l9_1971.y=l9_1987;
if (l9_1975)
{
bool l9_1992=l9_1977;
bool l9_1993;
if (l9_1992)
{
l9_1993=l9_1974.x==3;
}
else
{
l9_1993=l9_1992;
}
float l9_1994=l9_1971.x;
float l9_1995=l9_1976.x;
float l9_1996=l9_1976.z;
bool l9_1997=l9_1993;
float l9_1998=l9_1981;
float l9_1999=fast::clamp(l9_1994,l9_1995,l9_1996);
float l9_2000=step(abs(l9_1994-l9_1999),9.9999997e-06);
l9_1998*=(l9_2000+((1.0-float(l9_1997))*(1.0-l9_2000)));
l9_1994=l9_1999;
l9_1971.x=l9_1994;
l9_1981=l9_1998;
bool l9_2001=l9_1977;
bool l9_2002;
if (l9_2001)
{
l9_2002=l9_1974.y==3;
}
else
{
l9_2002=l9_2001;
}
float l9_2003=l9_1971.y;
float l9_2004=l9_1976.y;
float l9_2005=l9_1976.w;
bool l9_2006=l9_2002;
float l9_2007=l9_1981;
float l9_2008=fast::clamp(l9_2003,l9_2004,l9_2005);
float l9_2009=step(abs(l9_2003-l9_2008),9.9999997e-06);
l9_2007*=(l9_2009+((1.0-float(l9_2006))*(1.0-l9_2009)));
l9_2003=l9_2008;
l9_1971.y=l9_2003;
l9_1981=l9_2007;
}
float2 l9_2010=l9_1971;
bool l9_2011=l9_1972;
float3x3 l9_2012=l9_1973;
if (l9_2011)
{
l9_2010=float2((l9_2012*float3(l9_2010,1.0)).xy);
}
float2 l9_2013=l9_2010;
float2 l9_2014=l9_2013;
float2 l9_2015=l9_2014;
l9_1971=l9_2015;
float l9_2016=l9_1971.x;
int l9_2017=l9_1974.x;
bool l9_2018=l9_1980;
float l9_2019=l9_1981;
if ((l9_2017==0)||(l9_2017==3))
{
float l9_2020=l9_2016;
float l9_2021=0.0;
float l9_2022=1.0;
bool l9_2023=l9_2018;
float l9_2024=l9_2019;
float l9_2025=fast::clamp(l9_2020,l9_2021,l9_2022);
float l9_2026=step(abs(l9_2020-l9_2025),9.9999997e-06);
l9_2024*=(l9_2026+((1.0-float(l9_2023))*(1.0-l9_2026)));
l9_2020=l9_2025;
l9_2016=l9_2020;
l9_2019=l9_2024;
}
l9_1971.x=l9_2016;
l9_1981=l9_2019;
float l9_2027=l9_1971.y;
int l9_2028=l9_1974.y;
bool l9_2029=l9_1980;
float l9_2030=l9_1981;
if ((l9_2028==0)||(l9_2028==3))
{
float l9_2031=l9_2027;
float l9_2032=0.0;
float l9_2033=1.0;
bool l9_2034=l9_2029;
float l9_2035=l9_2030;
float l9_2036=fast::clamp(l9_2031,l9_2032,l9_2033);
float l9_2037=step(abs(l9_2031-l9_2036),9.9999997e-06);
l9_2035*=(l9_2037+((1.0-float(l9_2034))*(1.0-l9_2037)));
l9_2031=l9_2036;
l9_2027=l9_2031;
l9_2030=l9_2035;
}
l9_1971.y=l9_2027;
l9_1981=l9_2030;
float2 l9_2038=l9_1971;
int l9_2039=l9_1969;
int l9_2040=l9_1970;
float l9_2041=l9_1979;
float2 l9_2042=l9_2038;
int l9_2043=l9_2039;
int l9_2044=l9_2040;
float3 l9_2045=float3(0.0);
if (l9_2043==0)
{
l9_2045=float3(l9_2042,0.0);
}
else
{
if (l9_2043==1)
{
l9_2045=float3(l9_2042.x,(l9_2042.y*0.5)+(0.5-(float(l9_2044)*0.5)),0.0);
}
else
{
l9_2045=float3(l9_2042,float(l9_2044));
}
}
float3 l9_2046=l9_2045;
float3 l9_2047=l9_2046;
float2 l9_2048=l9_2047.xy;
float l9_2049=l9_2041;
float4 l9_2050=sc_set0.trailColorRampTex.sample(sc_set0.trailColorRampTexSmpSC,l9_2048,bias(l9_2049));
float4 l9_2051=l9_2050;
float4 l9_2052=l9_2051;
if (l9_1977)
{
l9_2052=mix(l9_1978,l9_2052,float4(l9_1981));
}
float4 l9_2053=l9_2052;
l9_1962=l9_2053;
float4 l9_2054=l9_1962;
l9_1852*=l9_2054;
}
}
}
float4 l9_2055=float4(0.0);
float3 l9_2056=float3(0.0);
float3 l9_2057=float3(0.0);
float l9_2058=0.0;
float l9_2059=0.0;
if (N2_ENABLE_COLORMINMAX)
{
l9_2056=mix(N2_colorMinStart,N2_colorMaxStart,l9_1847);
l9_2057=mix(N2_colorMinEnd,N2_colorMaxEnd,l9_1847);
}
else
{
l9_2056=N2_colorStart;
l9_2057=N2_colorEnd;
}
if (N2_ENABLE_ALPHAMINMAX)
{
l9_2058=mix(N2_alphaMinStart,N2_alphaMaxStart,l9_1848);
l9_2059=mix(N2_alphaMinEnd,N2_alphaMaxEnd,l9_1848);
}
else
{
l9_2058=N2_alphaStart;
l9_2059=N2_alphaEnd;
}
l9_2056=mix(l9_2056,l9_2057,float3(l9_1843));
l9_2058=mix(l9_2058,l9_2059,l9_1843);
l9_2055=float4(l9_2056,l9_2058);
float4 l9_2060=float4(0.0);
float2 l9_2061=float2(0.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
float2 l9_2062=tempGlobals.Surface_UVCoord0;
l9_2061=l9_2062;
float2 l9_2063=l9_2061;
float l9_2064=fast::max(N2_timeValuesIn.x,1e-06);
float l9_2065=fast::max(N2_timeValuesIn.y,1e-06);
float l9_2066=N2_timeValuesIn.z;
if (N2_ENABLE_FLIPBOOKBYLIFE)
{
float l9_2067=mix(l9_2064,l9_2065,l9_1850);
l9_2066/=l9_2067;
}
float l9_2068=floor((N2_flipBookRandomStart+1.0)*l9_1849);
float2 l9_2069=l9_2061;
float2 l9_2070=N2_gridSize;
float l9_2071=N2_numValidFrames;
float l9_2072=l9_2068;
float l9_2073=N2_flipBookSpeedMult;
float l9_2074=l9_2066;
float l9_2075=floor(l9_2070.x);
float l9_2076=floor(l9_2070.y);
float l9_2077=1.0/l9_2075;
float l9_2078=1.0/l9_2076;
float l9_2079=fast::min(l9_2075*l9_2076,floor(l9_2071));
float l9_2080=floor(mod((l9_2074*l9_2073)+floor(l9_2072),l9_2079));
float l9_2081=floor(l9_2080/l9_2075);
float l9_2082=mod(l9_2080,l9_2075);
float2 l9_2083=float2((l9_2077*l9_2069.x)+(l9_2082*l9_2077),((1.0-l9_2078)-(l9_2081*l9_2078))+(l9_2078*l9_2069.y));
l9_2061=l9_2083;
float2 l9_2084=l9_2061;
float4 l9_2085=float4(0.0);
int l9_2086=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_2087=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2087=0;
}
else
{
l9_2087=in.varStereoViewID;
}
int l9_2088=l9_2087;
l9_2086=1-l9_2088;
}
else
{
int l9_2089=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2089=0;
}
else
{
l9_2089=in.varStereoViewID;
}
int l9_2090=l9_2089;
l9_2086=l9_2090;
}
int l9_2091=l9_2086;
int l9_2092=mainTextureLayout_tmp;
int l9_2093=l9_2091;
float2 l9_2094=l9_2084;
bool l9_2095=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_2096=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_2097=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_2098=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_2099=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_2100=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_2101=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_2102=0.0;
bool l9_2103=l9_2100&&(!l9_2098);
float l9_2104=1.0;
float l9_2105=l9_2094.x;
int l9_2106=l9_2097.x;
if (l9_2106==1)
{
l9_2105=fract(l9_2105);
}
else
{
if (l9_2106==2)
{
float l9_2107=fract(l9_2105);
float l9_2108=l9_2105-l9_2107;
float l9_2109=step(0.25,fract(l9_2108*0.5));
l9_2105=mix(l9_2107,1.0-l9_2107,fast::clamp(l9_2109,0.0,1.0));
}
}
l9_2094.x=l9_2105;
float l9_2110=l9_2094.y;
int l9_2111=l9_2097.y;
if (l9_2111==1)
{
l9_2110=fract(l9_2110);
}
else
{
if (l9_2111==2)
{
float l9_2112=fract(l9_2110);
float l9_2113=l9_2110-l9_2112;
float l9_2114=step(0.25,fract(l9_2113*0.5));
l9_2110=mix(l9_2112,1.0-l9_2112,fast::clamp(l9_2114,0.0,1.0));
}
}
l9_2094.y=l9_2110;
if (l9_2098)
{
bool l9_2115=l9_2100;
bool l9_2116;
if (l9_2115)
{
l9_2116=l9_2097.x==3;
}
else
{
l9_2116=l9_2115;
}
float l9_2117=l9_2094.x;
float l9_2118=l9_2099.x;
float l9_2119=l9_2099.z;
bool l9_2120=l9_2116;
float l9_2121=l9_2104;
float l9_2122=fast::clamp(l9_2117,l9_2118,l9_2119);
float l9_2123=step(abs(l9_2117-l9_2122),9.9999997e-06);
l9_2121*=(l9_2123+((1.0-float(l9_2120))*(1.0-l9_2123)));
l9_2117=l9_2122;
l9_2094.x=l9_2117;
l9_2104=l9_2121;
bool l9_2124=l9_2100;
bool l9_2125;
if (l9_2124)
{
l9_2125=l9_2097.y==3;
}
else
{
l9_2125=l9_2124;
}
float l9_2126=l9_2094.y;
float l9_2127=l9_2099.y;
float l9_2128=l9_2099.w;
bool l9_2129=l9_2125;
float l9_2130=l9_2104;
float l9_2131=fast::clamp(l9_2126,l9_2127,l9_2128);
float l9_2132=step(abs(l9_2126-l9_2131),9.9999997e-06);
l9_2130*=(l9_2132+((1.0-float(l9_2129))*(1.0-l9_2132)));
l9_2126=l9_2131;
l9_2094.y=l9_2126;
l9_2104=l9_2130;
}
float2 l9_2133=l9_2094;
bool l9_2134=l9_2095;
float3x3 l9_2135=l9_2096;
if (l9_2134)
{
l9_2133=float2((l9_2135*float3(l9_2133,1.0)).xy);
}
float2 l9_2136=l9_2133;
float2 l9_2137=l9_2136;
float2 l9_2138=l9_2137;
l9_2094=l9_2138;
float l9_2139=l9_2094.x;
int l9_2140=l9_2097.x;
bool l9_2141=l9_2103;
float l9_2142=l9_2104;
if ((l9_2140==0)||(l9_2140==3))
{
float l9_2143=l9_2139;
float l9_2144=0.0;
float l9_2145=1.0;
bool l9_2146=l9_2141;
float l9_2147=l9_2142;
float l9_2148=fast::clamp(l9_2143,l9_2144,l9_2145);
float l9_2149=step(abs(l9_2143-l9_2148),9.9999997e-06);
l9_2147*=(l9_2149+((1.0-float(l9_2146))*(1.0-l9_2149)));
l9_2143=l9_2148;
l9_2139=l9_2143;
l9_2142=l9_2147;
}
l9_2094.x=l9_2139;
l9_2104=l9_2142;
float l9_2150=l9_2094.y;
int l9_2151=l9_2097.y;
bool l9_2152=l9_2103;
float l9_2153=l9_2104;
if ((l9_2151==0)||(l9_2151==3))
{
float l9_2154=l9_2150;
float l9_2155=0.0;
float l9_2156=1.0;
bool l9_2157=l9_2152;
float l9_2158=l9_2153;
float l9_2159=fast::clamp(l9_2154,l9_2155,l9_2156);
float l9_2160=step(abs(l9_2154-l9_2159),9.9999997e-06);
l9_2158*=(l9_2160+((1.0-float(l9_2157))*(1.0-l9_2160)));
l9_2154=l9_2159;
l9_2150=l9_2154;
l9_2153=l9_2158;
}
l9_2094.y=l9_2150;
l9_2104=l9_2153;
float2 l9_2161=l9_2094;
int l9_2162=l9_2092;
int l9_2163=l9_2093;
float l9_2164=l9_2102;
float2 l9_2165=l9_2161;
int l9_2166=l9_2162;
int l9_2167=l9_2163;
float3 l9_2168=float3(0.0);
if (l9_2166==0)
{
l9_2168=float3(l9_2165,0.0);
}
else
{
if (l9_2166==1)
{
l9_2168=float3(l9_2165.x,(l9_2165.y*0.5)+(0.5-(float(l9_2167)*0.5)),0.0);
}
else
{
l9_2168=float3(l9_2165,float(l9_2167));
}
}
float3 l9_2169=l9_2168;
float3 l9_2170=l9_2169;
float2 l9_2171=l9_2170.xy;
float l9_2172=l9_2164;
float4 l9_2173=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_2171,bias(l9_2172));
float4 l9_2174=l9_2173;
float4 l9_2175=l9_2174;
if (l9_2100)
{
l9_2175=mix(l9_2101,l9_2175,float4(l9_2104));
}
float4 l9_2176=l9_2175;
l9_2085=l9_2176;
float4 l9_2177=l9_2085;
l9_2060=l9_2177;
if (N2_ENABLE_FLIPBOOKBLEND)
{
float2 l9_2178=l9_2063;
float2 l9_2179=N2_gridSize;
float l9_2180=N2_numValidFrames;
float l9_2181=floor(mod(l9_2068+1.0,N2_numValidFrames));
float l9_2182=N2_flipBookSpeedMult;
float l9_2183=l9_2066;
float l9_2184=floor(l9_2179.x);
float l9_2185=floor(l9_2179.y);
float l9_2186=1.0/l9_2184;
float l9_2187=1.0/l9_2185;
float l9_2188=fast::min(l9_2184*l9_2185,floor(l9_2180));
float l9_2189=floor(mod((l9_2183*l9_2182)+floor(l9_2181),l9_2188));
float l9_2190=floor(l9_2189/l9_2184);
float l9_2191=mod(l9_2189,l9_2184);
float2 l9_2192=float2((l9_2186*l9_2178.x)+(l9_2191*l9_2186),((1.0-l9_2187)-(l9_2190*l9_2187))+(l9_2187*l9_2178.y));
l9_2063=l9_2192;
float4 l9_2193=l9_2060;
float2 l9_2194=l9_2063;
float4 l9_2195=float4(0.0);
int l9_2196=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_2197=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2197=0;
}
else
{
l9_2197=in.varStereoViewID;
}
int l9_2198=l9_2197;
l9_2196=1-l9_2198;
}
else
{
int l9_2199=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2199=0;
}
else
{
l9_2199=in.varStereoViewID;
}
int l9_2200=l9_2199;
l9_2196=l9_2200;
}
int l9_2201=l9_2196;
int l9_2202=mainTextureLayout_tmp;
int l9_2203=l9_2201;
float2 l9_2204=l9_2194;
bool l9_2205=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_2206=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_2207=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_2208=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_2209=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_2210=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_2211=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_2212=0.0;
bool l9_2213=l9_2210&&(!l9_2208);
float l9_2214=1.0;
float l9_2215=l9_2204.x;
int l9_2216=l9_2207.x;
if (l9_2216==1)
{
l9_2215=fract(l9_2215);
}
else
{
if (l9_2216==2)
{
float l9_2217=fract(l9_2215);
float l9_2218=l9_2215-l9_2217;
float l9_2219=step(0.25,fract(l9_2218*0.5));
l9_2215=mix(l9_2217,1.0-l9_2217,fast::clamp(l9_2219,0.0,1.0));
}
}
l9_2204.x=l9_2215;
float l9_2220=l9_2204.y;
int l9_2221=l9_2207.y;
if (l9_2221==1)
{
l9_2220=fract(l9_2220);
}
else
{
if (l9_2221==2)
{
float l9_2222=fract(l9_2220);
float l9_2223=l9_2220-l9_2222;
float l9_2224=step(0.25,fract(l9_2223*0.5));
l9_2220=mix(l9_2222,1.0-l9_2222,fast::clamp(l9_2224,0.0,1.0));
}
}
l9_2204.y=l9_2220;
if (l9_2208)
{
bool l9_2225=l9_2210;
bool l9_2226;
if (l9_2225)
{
l9_2226=l9_2207.x==3;
}
else
{
l9_2226=l9_2225;
}
float l9_2227=l9_2204.x;
float l9_2228=l9_2209.x;
float l9_2229=l9_2209.z;
bool l9_2230=l9_2226;
float l9_2231=l9_2214;
float l9_2232=fast::clamp(l9_2227,l9_2228,l9_2229);
float l9_2233=step(abs(l9_2227-l9_2232),9.9999997e-06);
l9_2231*=(l9_2233+((1.0-float(l9_2230))*(1.0-l9_2233)));
l9_2227=l9_2232;
l9_2204.x=l9_2227;
l9_2214=l9_2231;
bool l9_2234=l9_2210;
bool l9_2235;
if (l9_2234)
{
l9_2235=l9_2207.y==3;
}
else
{
l9_2235=l9_2234;
}
float l9_2236=l9_2204.y;
float l9_2237=l9_2209.y;
float l9_2238=l9_2209.w;
bool l9_2239=l9_2235;
float l9_2240=l9_2214;
float l9_2241=fast::clamp(l9_2236,l9_2237,l9_2238);
float l9_2242=step(abs(l9_2236-l9_2241),9.9999997e-06);
l9_2240*=(l9_2242+((1.0-float(l9_2239))*(1.0-l9_2242)));
l9_2236=l9_2241;
l9_2204.y=l9_2236;
l9_2214=l9_2240;
}
float2 l9_2243=l9_2204;
bool l9_2244=l9_2205;
float3x3 l9_2245=l9_2206;
if (l9_2244)
{
l9_2243=float2((l9_2245*float3(l9_2243,1.0)).xy);
}
float2 l9_2246=l9_2243;
float2 l9_2247=l9_2246;
float2 l9_2248=l9_2247;
l9_2204=l9_2248;
float l9_2249=l9_2204.x;
int l9_2250=l9_2207.x;
bool l9_2251=l9_2213;
float l9_2252=l9_2214;
if ((l9_2250==0)||(l9_2250==3))
{
float l9_2253=l9_2249;
float l9_2254=0.0;
float l9_2255=1.0;
bool l9_2256=l9_2251;
float l9_2257=l9_2252;
float l9_2258=fast::clamp(l9_2253,l9_2254,l9_2255);
float l9_2259=step(abs(l9_2253-l9_2258),9.9999997e-06);
l9_2257*=(l9_2259+((1.0-float(l9_2256))*(1.0-l9_2259)));
l9_2253=l9_2258;
l9_2249=l9_2253;
l9_2252=l9_2257;
}
l9_2204.x=l9_2249;
l9_2214=l9_2252;
float l9_2260=l9_2204.y;
int l9_2261=l9_2207.y;
bool l9_2262=l9_2213;
float l9_2263=l9_2214;
if ((l9_2261==0)||(l9_2261==3))
{
float l9_2264=l9_2260;
float l9_2265=0.0;
float l9_2266=1.0;
bool l9_2267=l9_2262;
float l9_2268=l9_2263;
float l9_2269=fast::clamp(l9_2264,l9_2265,l9_2266);
float l9_2270=step(abs(l9_2264-l9_2269),9.9999997e-06);
l9_2268*=(l9_2270+((1.0-float(l9_2267))*(1.0-l9_2270)));
l9_2264=l9_2269;
l9_2260=l9_2264;
l9_2263=l9_2268;
}
l9_2204.y=l9_2260;
l9_2214=l9_2263;
float2 l9_2271=l9_2204;
int l9_2272=l9_2202;
int l9_2273=l9_2203;
float l9_2274=l9_2212;
float2 l9_2275=l9_2271;
int l9_2276=l9_2272;
int l9_2277=l9_2273;
float3 l9_2278=float3(0.0);
if (l9_2276==0)
{
l9_2278=float3(l9_2275,0.0);
}
else
{
if (l9_2276==1)
{
l9_2278=float3(l9_2275.x,(l9_2275.y*0.5)+(0.5-(float(l9_2277)*0.5)),0.0);
}
else
{
l9_2278=float3(l9_2275,float(l9_2277));
}
}
float3 l9_2279=l9_2278;
float3 l9_2280=l9_2279;
float2 l9_2281=l9_2280.xy;
float l9_2282=l9_2274;
float4 l9_2283=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_2281,bias(l9_2282));
float4 l9_2284=l9_2283;
float4 l9_2285=l9_2284;
if (l9_2210)
{
l9_2285=mix(l9_2211,l9_2285,float4(l9_2214));
}
float4 l9_2286=l9_2285;
l9_2195=l9_2286;
float4 l9_2287=l9_2195;
l9_2060=mix(l9_2193,l9_2287,float4(fract((l9_2066*N2_flipBookSpeedMult)+l9_2068)));
}
}
}
float4 l9_2288=float4(1.0);
if (N2_ENABLE_COLORRAMP)
{
float l9_2289=ceil(l9_1843*N2_texSize.x)/N2_texSize.x;
float l9_2290=l9_2289;
if (N2_ENABLE_NORANDOFFSET)
{
float2 l9_2291=tempGlobals.Surface_UVCoord0;
l9_2290+=(l9_2291.x/N2_texSize.x);
}
float2 l9_2292=float2(l9_2290,0.5);
float4 l9_2293=float4(0.0);
int l9_2294=0;
if ((int(colorRampTextureHasSwappedViews_tmp)!=0))
{
int l9_2295=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2295=0;
}
else
{
l9_2295=in.varStereoViewID;
}
int l9_2296=l9_2295;
l9_2294=1-l9_2296;
}
else
{
int l9_2297=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2297=0;
}
else
{
l9_2297=in.varStereoViewID;
}
int l9_2298=l9_2297;
l9_2294=l9_2298;
}
int l9_2299=l9_2294;
int l9_2300=colorRampTextureLayout_tmp;
int l9_2301=l9_2299;
float2 l9_2302=l9_2292;
bool l9_2303=(int(SC_USE_UV_TRANSFORM_colorRampTexture_tmp)!=0);
float3x3 l9_2304=(*sc_set0.UserUniforms).colorRampTextureTransform;
int2 l9_2305=int2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture_tmp);
bool l9_2306=(int(SC_USE_UV_MIN_MAX_colorRampTexture_tmp)!=0);
float4 l9_2307=(*sc_set0.UserUniforms).colorRampTextureUvMinMax;
bool l9_2308=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture_tmp)!=0);
float4 l9_2309=(*sc_set0.UserUniforms).colorRampTextureBorderColor;
float l9_2310=0.0;
bool l9_2311=l9_2308&&(!l9_2306);
float l9_2312=1.0;
float l9_2313=l9_2302.x;
int l9_2314=l9_2305.x;
if (l9_2314==1)
{
l9_2313=fract(l9_2313);
}
else
{
if (l9_2314==2)
{
float l9_2315=fract(l9_2313);
float l9_2316=l9_2313-l9_2315;
float l9_2317=step(0.25,fract(l9_2316*0.5));
l9_2313=mix(l9_2315,1.0-l9_2315,fast::clamp(l9_2317,0.0,1.0));
}
}
l9_2302.x=l9_2313;
float l9_2318=l9_2302.y;
int l9_2319=l9_2305.y;
if (l9_2319==1)
{
l9_2318=fract(l9_2318);
}
else
{
if (l9_2319==2)
{
float l9_2320=fract(l9_2318);
float l9_2321=l9_2318-l9_2320;
float l9_2322=step(0.25,fract(l9_2321*0.5));
l9_2318=mix(l9_2320,1.0-l9_2320,fast::clamp(l9_2322,0.0,1.0));
}
}
l9_2302.y=l9_2318;
if (l9_2306)
{
bool l9_2323=l9_2308;
bool l9_2324;
if (l9_2323)
{
l9_2324=l9_2305.x==3;
}
else
{
l9_2324=l9_2323;
}
float l9_2325=l9_2302.x;
float l9_2326=l9_2307.x;
float l9_2327=l9_2307.z;
bool l9_2328=l9_2324;
float l9_2329=l9_2312;
float l9_2330=fast::clamp(l9_2325,l9_2326,l9_2327);
float l9_2331=step(abs(l9_2325-l9_2330),9.9999997e-06);
l9_2329*=(l9_2331+((1.0-float(l9_2328))*(1.0-l9_2331)));
l9_2325=l9_2330;
l9_2302.x=l9_2325;
l9_2312=l9_2329;
bool l9_2332=l9_2308;
bool l9_2333;
if (l9_2332)
{
l9_2333=l9_2305.y==3;
}
else
{
l9_2333=l9_2332;
}
float l9_2334=l9_2302.y;
float l9_2335=l9_2307.y;
float l9_2336=l9_2307.w;
bool l9_2337=l9_2333;
float l9_2338=l9_2312;
float l9_2339=fast::clamp(l9_2334,l9_2335,l9_2336);
float l9_2340=step(abs(l9_2334-l9_2339),9.9999997e-06);
l9_2338*=(l9_2340+((1.0-float(l9_2337))*(1.0-l9_2340)));
l9_2334=l9_2339;
l9_2302.y=l9_2334;
l9_2312=l9_2338;
}
float2 l9_2341=l9_2302;
bool l9_2342=l9_2303;
float3x3 l9_2343=l9_2304;
if (l9_2342)
{
l9_2341=float2((l9_2343*float3(l9_2341,1.0)).xy);
}
float2 l9_2344=l9_2341;
float2 l9_2345=l9_2344;
float2 l9_2346=l9_2345;
l9_2302=l9_2346;
float l9_2347=l9_2302.x;
int l9_2348=l9_2305.x;
bool l9_2349=l9_2311;
float l9_2350=l9_2312;
if ((l9_2348==0)||(l9_2348==3))
{
float l9_2351=l9_2347;
float l9_2352=0.0;
float l9_2353=1.0;
bool l9_2354=l9_2349;
float l9_2355=l9_2350;
float l9_2356=fast::clamp(l9_2351,l9_2352,l9_2353);
float l9_2357=step(abs(l9_2351-l9_2356),9.9999997e-06);
l9_2355*=(l9_2357+((1.0-float(l9_2354))*(1.0-l9_2357)));
l9_2351=l9_2356;
l9_2347=l9_2351;
l9_2350=l9_2355;
}
l9_2302.x=l9_2347;
l9_2312=l9_2350;
float l9_2358=l9_2302.y;
int l9_2359=l9_2305.y;
bool l9_2360=l9_2311;
float l9_2361=l9_2312;
if ((l9_2359==0)||(l9_2359==3))
{
float l9_2362=l9_2358;
float l9_2363=0.0;
float l9_2364=1.0;
bool l9_2365=l9_2360;
float l9_2366=l9_2361;
float l9_2367=fast::clamp(l9_2362,l9_2363,l9_2364);
float l9_2368=step(abs(l9_2362-l9_2367),9.9999997e-06);
l9_2366*=(l9_2368+((1.0-float(l9_2365))*(1.0-l9_2368)));
l9_2362=l9_2367;
l9_2358=l9_2362;
l9_2361=l9_2366;
}
l9_2302.y=l9_2358;
l9_2312=l9_2361;
float2 l9_2369=l9_2302;
int l9_2370=l9_2300;
int l9_2371=l9_2301;
float l9_2372=l9_2310;
float2 l9_2373=l9_2369;
int l9_2374=l9_2370;
int l9_2375=l9_2371;
float3 l9_2376=float3(0.0);
if (l9_2374==0)
{
l9_2376=float3(l9_2373,0.0);
}
else
{
if (l9_2374==1)
{
l9_2376=float3(l9_2373.x,(l9_2373.y*0.5)+(0.5-(float(l9_2375)*0.5)),0.0);
}
else
{
l9_2376=float3(l9_2373,float(l9_2375));
}
}
float3 l9_2377=l9_2376;
float3 l9_2378=l9_2377;
float2 l9_2379=l9_2378.xy;
float l9_2380=l9_2372;
float4 l9_2381=sc_set0.colorRampTexture.sample(sc_set0.colorRampTextureSmpSC,l9_2379,bias(l9_2380));
float4 l9_2382=l9_2381;
float4 l9_2383=l9_2382;
if (l9_2308)
{
l9_2383=mix(l9_2309,l9_2383,float4(l9_2312));
}
float4 l9_2384=l9_2383;
l9_2293=l9_2384;
float4 l9_2385=l9_2293;
l9_2288=l9_2385*N2_colorRampMult;
}
float4 l9_2386=float4(1.0);
float4 l9_2387=float4(1.0);
if (N2_ENABLE_BASETEXTURE)
{
if (N2_ENABLE_FLIPBOOK)
{
N2_uv=l9_2061;
l9_2386=l9_2060;
}
else
{
float2 l9_2388=N2_uv;
float4 l9_2389=float4(0.0);
int l9_2390=0;
if ((int(mainTextureHasSwappedViews_tmp)!=0))
{
int l9_2391=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2391=0;
}
else
{
l9_2391=in.varStereoViewID;
}
int l9_2392=l9_2391;
l9_2390=1-l9_2392;
}
else
{
int l9_2393=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2393=0;
}
else
{
l9_2393=in.varStereoViewID;
}
int l9_2394=l9_2393;
l9_2390=l9_2394;
}
int l9_2395=l9_2390;
int l9_2396=mainTextureLayout_tmp;
int l9_2397=l9_2395;
float2 l9_2398=l9_2388;
bool l9_2399=(int(SC_USE_UV_TRANSFORM_mainTexture_tmp)!=0);
float3x3 l9_2400=(*sc_set0.UserUniforms).mainTextureTransform;
int2 l9_2401=int2(SC_SOFTWARE_WRAP_MODE_U_mainTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_mainTexture_tmp);
bool l9_2402=(int(SC_USE_UV_MIN_MAX_mainTexture_tmp)!=0);
float4 l9_2403=(*sc_set0.UserUniforms).mainTextureUvMinMax;
bool l9_2404=(int(SC_USE_CLAMP_TO_BORDER_mainTexture_tmp)!=0);
float4 l9_2405=(*sc_set0.UserUniforms).mainTextureBorderColor;
float l9_2406=0.0;
bool l9_2407=l9_2404&&(!l9_2402);
float l9_2408=1.0;
float l9_2409=l9_2398.x;
int l9_2410=l9_2401.x;
if (l9_2410==1)
{
l9_2409=fract(l9_2409);
}
else
{
if (l9_2410==2)
{
float l9_2411=fract(l9_2409);
float l9_2412=l9_2409-l9_2411;
float l9_2413=step(0.25,fract(l9_2412*0.5));
l9_2409=mix(l9_2411,1.0-l9_2411,fast::clamp(l9_2413,0.0,1.0));
}
}
l9_2398.x=l9_2409;
float l9_2414=l9_2398.y;
int l9_2415=l9_2401.y;
if (l9_2415==1)
{
l9_2414=fract(l9_2414);
}
else
{
if (l9_2415==2)
{
float l9_2416=fract(l9_2414);
float l9_2417=l9_2414-l9_2416;
float l9_2418=step(0.25,fract(l9_2417*0.5));
l9_2414=mix(l9_2416,1.0-l9_2416,fast::clamp(l9_2418,0.0,1.0));
}
}
l9_2398.y=l9_2414;
if (l9_2402)
{
bool l9_2419=l9_2404;
bool l9_2420;
if (l9_2419)
{
l9_2420=l9_2401.x==3;
}
else
{
l9_2420=l9_2419;
}
float l9_2421=l9_2398.x;
float l9_2422=l9_2403.x;
float l9_2423=l9_2403.z;
bool l9_2424=l9_2420;
float l9_2425=l9_2408;
float l9_2426=fast::clamp(l9_2421,l9_2422,l9_2423);
float l9_2427=step(abs(l9_2421-l9_2426),9.9999997e-06);
l9_2425*=(l9_2427+((1.0-float(l9_2424))*(1.0-l9_2427)));
l9_2421=l9_2426;
l9_2398.x=l9_2421;
l9_2408=l9_2425;
bool l9_2428=l9_2404;
bool l9_2429;
if (l9_2428)
{
l9_2429=l9_2401.y==3;
}
else
{
l9_2429=l9_2428;
}
float l9_2430=l9_2398.y;
float l9_2431=l9_2403.y;
float l9_2432=l9_2403.w;
bool l9_2433=l9_2429;
float l9_2434=l9_2408;
float l9_2435=fast::clamp(l9_2430,l9_2431,l9_2432);
float l9_2436=step(abs(l9_2430-l9_2435),9.9999997e-06);
l9_2434*=(l9_2436+((1.0-float(l9_2433))*(1.0-l9_2436)));
l9_2430=l9_2435;
l9_2398.y=l9_2430;
l9_2408=l9_2434;
}
float2 l9_2437=l9_2398;
bool l9_2438=l9_2399;
float3x3 l9_2439=l9_2400;
if (l9_2438)
{
l9_2437=float2((l9_2439*float3(l9_2437,1.0)).xy);
}
float2 l9_2440=l9_2437;
float2 l9_2441=l9_2440;
float2 l9_2442=l9_2441;
l9_2398=l9_2442;
float l9_2443=l9_2398.x;
int l9_2444=l9_2401.x;
bool l9_2445=l9_2407;
float l9_2446=l9_2408;
if ((l9_2444==0)||(l9_2444==3))
{
float l9_2447=l9_2443;
float l9_2448=0.0;
float l9_2449=1.0;
bool l9_2450=l9_2445;
float l9_2451=l9_2446;
float l9_2452=fast::clamp(l9_2447,l9_2448,l9_2449);
float l9_2453=step(abs(l9_2447-l9_2452),9.9999997e-06);
l9_2451*=(l9_2453+((1.0-float(l9_2450))*(1.0-l9_2453)));
l9_2447=l9_2452;
l9_2443=l9_2447;
l9_2446=l9_2451;
}
l9_2398.x=l9_2443;
l9_2408=l9_2446;
float l9_2454=l9_2398.y;
int l9_2455=l9_2401.y;
bool l9_2456=l9_2407;
float l9_2457=l9_2408;
if ((l9_2455==0)||(l9_2455==3))
{
float l9_2458=l9_2454;
float l9_2459=0.0;
float l9_2460=1.0;
bool l9_2461=l9_2456;
float l9_2462=l9_2457;
float l9_2463=fast::clamp(l9_2458,l9_2459,l9_2460);
float l9_2464=step(abs(l9_2458-l9_2463),9.9999997e-06);
l9_2462*=(l9_2464+((1.0-float(l9_2461))*(1.0-l9_2464)));
l9_2458=l9_2463;
l9_2454=l9_2458;
l9_2457=l9_2462;
}
l9_2398.y=l9_2454;
l9_2408=l9_2457;
float2 l9_2465=l9_2398;
int l9_2466=l9_2396;
int l9_2467=l9_2397;
float l9_2468=l9_2406;
float2 l9_2469=l9_2465;
int l9_2470=l9_2466;
int l9_2471=l9_2467;
float3 l9_2472=float3(0.0);
if (l9_2470==0)
{
l9_2472=float3(l9_2469,0.0);
}
else
{
if (l9_2470==1)
{
l9_2472=float3(l9_2469.x,(l9_2469.y*0.5)+(0.5-(float(l9_2471)*0.5)),0.0);
}
else
{
l9_2472=float3(l9_2469,float(l9_2471));
}
}
float3 l9_2473=l9_2472;
float3 l9_2474=l9_2473;
float2 l9_2475=l9_2474.xy;
float l9_2476=l9_2468;
float4 l9_2477=sc_set0.mainTexture.sample(sc_set0.mainTextureSmpSC,l9_2475,bias(l9_2476));
float4 l9_2478=l9_2477;
float4 l9_2479=l9_2478;
if (l9_2404)
{
l9_2479=mix(l9_2405,l9_2479,float4(l9_2408));
}
float4 l9_2480=l9_2479;
l9_2389=l9_2480;
float4 l9_2481=l9_2389;
l9_2386=l9_2481;
}
}
if (N2_ENABLE_COLORRAMP)
{
if (!(!(SC_DEVICE_CLASS_tmp>=2)))
{
l9_2387=l9_2288;
}
}
N2_result=(l9_2386*l9_2055)*l9_2387;
if (N2_ENABLE_TRAILS)
{
if (N2_isTrail>0.0)
{
N2_result=(l9_1852*l9_2055)*l9_2387;
N2_result.w*=l9_1851;
}
}
if (N2_ENABLE_SCREENFADE)
{
N2_result.w*=N2_cameraFade_trailHeadTime_taper.x;
}
if (N2_ENABLE_ALPHADISSOLVE)
{
float l9_2482=l9_1843*N2_alphaDissolveMult;
N2_result.w=fast::clamp(N2_result.w-l9_2482,0.0,1.0);
}
if (N2_ENABLE_BLACKASALPHA)
{
float l9_2483=length(N2_result.xyz);
N2_result.w=l9_2483;
if (N2_ENABLE_TRAILS)
{
N2_result.w*=l9_1851;
}
}
if (N2_ENABLE_PREMULTIPLIEDCOLOR)
{
float3 l9_2484=N2_result.xyz*N2_result.w;
N2_result=float4(l9_2484.x,l9_2484.y,l9_2484.z,N2_result.w);
}
}
return out;
}
} // RECEIVER MODE SHADER
