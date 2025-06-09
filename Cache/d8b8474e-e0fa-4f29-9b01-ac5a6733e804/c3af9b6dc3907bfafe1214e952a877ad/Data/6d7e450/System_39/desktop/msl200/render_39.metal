#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
//efine SC_DISABLE_FRUSTUM_CULLING 1
#ifdef isIdle
#undef isIdle
#endif
#ifdef isAttracting
#undef isAttracting
#endif
#define SC_ENABLE_INSTANCED_RENDERING
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
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler flipbookTexSmpSC 0:25
//sampler sampler intensityTextureSmpSC 0:26
//sampler sampler renderTarget0SmpSC 0:27
//sampler sampler renderTarget1SmpSC 0:28
//sampler sampler renderTarget2SmpSC 0:29
//sampler sampler renderTarget3SmpSC 0:30
//sampler sampler repelflipbookTexSmpSC 0:31
//sampler sampler sc_EnvmapDiffuseSmpSC 0:32
//sampler sampler sc_EnvmapSpecularSmpSC 0:33
//sampler sampler sc_RayTracedAoTextureSmpSC 0:35
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:36
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:37
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:38
//sampler sampler sc_SSAOTextureSmpSC 0:39
//sampler sampler sc_ScreenTextureSmpSC 0:40
//texture texture2D flipbookTex 0:0:0:25
//texture texture2D intensityTexture 0:1:0:26
//texture texture2D renderTarget0 0:2:0:27
//texture texture2D renderTarget1 0:3:0:28
//texture texture2D renderTarget2 0:4:0:29
//texture texture2D renderTarget3 0:5:0:30
//texture texture2D repelflipbookTex 0:6:0:31
//texture texture2D sc_EnvmapDiffuse 0:7:0:32
//texture texture2D sc_EnvmapSpecular 0:8:0:33
//texture texture2D sc_RayTracedAoTexture 0:17:0:35
//texture texture2D sc_RayTracedDiffIndTexture 0:18:0:36
//texture texture2D sc_RayTracedReflectionTexture 0:19:0:37
//texture texture2D sc_RayTracedShadowTexture 0:20:0:38
//texture texture2D sc_SSAOTexture 0:21:0:39
//texture texture2D sc_ScreenTexture 0:22:0:40
//ubo int UserUniforms 0:43:8032 {
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
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float shaderComplexityValue 3604
//float4 sc_StereoClipPlanes 3664:[2]:16
//float _sc_framebufferFetchMarker 3700
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
//int overrideTimeEnabled 4252
//float overrideTimeElapsed 4256:[32]:4
//float overrideTimeDelta 4384
//int vfxNumCopies 4388
//bool vfxBatchEnable 4392:[32]:4
//int vfxOffsetInstancesRead 7380
//float2 vfxTargetSizeRead 7392
//int vfxTargetWidth 7408
//float velocityStretch 7412
//bool isIdle 7416
//float3x3 flipbookTexTransform 7472
//float4 flipbookTexUvMinMax 7520
//float4 flipbookTexBorderColor 7536
//bool isAttracting 7552
//float4 colorMix 7568
//float intensity 7584
//float3x3 repelflipbookTexTransform 7648
//float4 repelflipbookTexUvMinMax 7696
//float4 repelflipbookTexBorderColor 7712
//float Port_Input1_N362 7728
//float Port_Value_N170 7732
//float3 Port_Input1_N420 7744
//float Port_RangeMinA_N171 7760
//float Port_RangeMaxA_N171 7764
//float Port_RangeMinB_N171 7768
//float Port_RangeMaxB_N171 7772
//float Port_Input1_N358 7780
//float2 Port_SpriteCount_N045 7792
//float Port_MaxFrames_N045 7800
//float Port_Rotation_N159 7804
//float2 Port_Center_N159 7808
//float Port_RangeMinA_N156 7816
//float Port_RangeMaxA_N156 7820
//float Port_RangeMinB_N156 7824
//float Port_RangeMaxB_N156 7828
//float Port_SecondOffset_N045 7832
//float3 Port_Input0_N038 7840
//float2 Port_Input1_N031 7856
//float Port_Input1_N246 7864
//float Port_Input2_N246 7868
//float2 Port_Input1_N035 7872
//float Port_Input1_N036 7880
//float3 Port_Emissive_N026 7888
//float Port_Metallic_N026 7904
//float Port_Roughness_N026 7908
//float3 Port_AO_N026 7920
//float3 Port_SpecularAO_N026 7936
//float2 Port_SpriteCount_N167 7952
//float Port_MaxFrames_N167 7960
//float Port_SecondOffset_N167 7964
//float3 Port_Emissive_N258 7968
//float Port_Metallic_N258 7984
//float Port_Roughness_N258 7988
//float3 Port_AO_N258 8000
//float3 Port_SpecularAO_N258 8016
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_flipbookTex 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_repelflipbookTex 32 0
//spec_const bool SC_USE_UV_MIN_MAX_flipbookTex 33 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_repelflipbookTex 35 0
//spec_const bool SC_USE_UV_TRANSFORM_flipbookTex 36 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 37 0
//spec_const bool SC_USE_UV_TRANSFORM_repelflipbookTex 38 0
//spec_const bool Tweak_N248 39 0
//spec_const bool Tweak_N261 40 0
//spec_const bool flipbookTexHasSwappedViews 41 0
//spec_const bool intensityTextureHasSwappedViews 42 0
//spec_const bool renderTarget0HasSwappedViews 43 0
//spec_const bool renderTarget1HasSwappedViews 44 0
//spec_const bool renderTarget2HasSwappedViews 45 0
//spec_const bool renderTarget3HasSwappedViews 46 0
//spec_const bool repelflipbookTexHasSwappedViews 47 0
//spec_const bool sc_BlendMode_ColoredGlass 48 0
//spec_const bool sc_BlendMode_Custom 49 0
//spec_const bool sc_BlendMode_MultiplyOriginal 50 0
//spec_const bool sc_BlendMode_Multiply 51 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 52 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 53 0
//spec_const bool sc_BlendMode_Screen 54 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 55 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 56 0
//spec_const bool sc_FramebufferFetch 57 0
//spec_const bool sc_HasDiffuseEnvmap 58 0
//spec_const bool sc_LightEstimation 59 0
//spec_const bool sc_MotionVectorsPass 60 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 61 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 62 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 63 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 64 0
//spec_const bool sc_RenderAlphaToColor 65 0
//spec_const bool sc_SSAOEnabled 66 0
//spec_const bool sc_ScreenTextureHasSwappedViews 67 0
//spec_const bool sc_ShaderComplexityAnalyzer 68 0
//spec_const bool sc_UseFramebufferFetchMarker 69 0
//spec_const int NODE_243_DROPLIST_ITEM 70 0
//spec_const int SC_DEVICE_CLASS 71 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_flipbookTex 72 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 73 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_flipbookTex 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex 77 -1
//spec_const int flipbookTexLayout 78 0
//spec_const int intensityTextureLayout 79 0
//spec_const int renderTarget0Layout 80 0
//spec_const int renderTarget1Layout 81 0
//spec_const int renderTarget2Layout 82 0
//spec_const int renderTarget3Layout 83 0
//spec_const int repelflipbookTexLayout 84 0
//spec_const int sc_AmbientLightMode0 85 0
//spec_const int sc_AmbientLightMode1 86 0
//spec_const int sc_AmbientLightMode2 87 0
//spec_const int sc_AmbientLightMode_Constant 88 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 89 0
//spec_const int sc_AmbientLightMode_FromCamera 90 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 91 0
//spec_const int sc_AmbientLightsCount 92 0
//spec_const int sc_DepthBufferMode 93 0
//spec_const int sc_DirectionalLightsCount 94 0
//spec_const int sc_EnvLightMode 95 0
//spec_const int sc_EnvmapDiffuseLayout 96 0
//spec_const int sc_EnvmapSpecularLayout 97 0
//spec_const int sc_LightEstimationSGCount 98 0
//spec_const int sc_MaxTextureImageUnits 99 0
//spec_const int sc_PointLightsCount 100 0
//spec_const int sc_RayTracedAoTextureLayout 101 0
//spec_const int sc_RayTracedDiffIndTextureLayout 102 0
//spec_const int sc_RayTracedReflectionTextureLayout 103 0
//spec_const int sc_RayTracedShadowTextureLayout 104 0
//spec_const int sc_ScreenTextureLayout 105 0
//spec_const int sc_ShaderCacheConstant 106 0
//spec_const int sc_StereoRenderingMode 107 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 108 0
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
constant bool SC_USE_CLAMP_TO_BORDER_flipbookTex [[function_constant(30)]];
constant bool SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_flipbookTex) ? SC_USE_CLAMP_TO_BORDER_flipbookTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_repelflipbookTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_repelflipbookTex) ? SC_USE_CLAMP_TO_BORDER_repelflipbookTex : false;
constant bool SC_USE_UV_MIN_MAX_flipbookTex [[function_constant(33)]];
constant bool SC_USE_UV_MIN_MAX_flipbookTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_flipbookTex) ? SC_USE_UV_MIN_MAX_flipbookTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_repelflipbookTex [[function_constant(35)]];
constant bool SC_USE_UV_MIN_MAX_repelflipbookTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_repelflipbookTex) ? SC_USE_UV_MIN_MAX_repelflipbookTex : false;
constant bool SC_USE_UV_TRANSFORM_flipbookTex [[function_constant(36)]];
constant bool SC_USE_UV_TRANSFORM_flipbookTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_flipbookTex) ? SC_USE_UV_TRANSFORM_flipbookTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(37)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_repelflipbookTex [[function_constant(38)]];
constant bool SC_USE_UV_TRANSFORM_repelflipbookTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_repelflipbookTex) ? SC_USE_UV_TRANSFORM_repelflipbookTex : false;
constant bool Tweak_N248 [[function_constant(39)]];
constant bool Tweak_N248_tmp = is_function_constant_defined(Tweak_N248) ? Tweak_N248 : false;
constant bool Tweak_N261 [[function_constant(40)]];
constant bool Tweak_N261_tmp = is_function_constant_defined(Tweak_N261) ? Tweak_N261 : false;
constant bool flipbookTexHasSwappedViews [[function_constant(41)]];
constant bool flipbookTexHasSwappedViews_tmp = is_function_constant_defined(flipbookTexHasSwappedViews) ? flipbookTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(42)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool renderTarget0HasSwappedViews [[function_constant(43)]];
constant bool renderTarget0HasSwappedViews_tmp = is_function_constant_defined(renderTarget0HasSwappedViews) ? renderTarget0HasSwappedViews : false;
constant bool renderTarget1HasSwappedViews [[function_constant(44)]];
constant bool renderTarget1HasSwappedViews_tmp = is_function_constant_defined(renderTarget1HasSwappedViews) ? renderTarget1HasSwappedViews : false;
constant bool renderTarget2HasSwappedViews [[function_constant(45)]];
constant bool renderTarget2HasSwappedViews_tmp = is_function_constant_defined(renderTarget2HasSwappedViews) ? renderTarget2HasSwappedViews : false;
constant bool renderTarget3HasSwappedViews [[function_constant(46)]];
constant bool renderTarget3HasSwappedViews_tmp = is_function_constant_defined(renderTarget3HasSwappedViews) ? renderTarget3HasSwappedViews : false;
constant bool repelflipbookTexHasSwappedViews [[function_constant(47)]];
constant bool repelflipbookTexHasSwappedViews_tmp = is_function_constant_defined(repelflipbookTexHasSwappedViews) ? repelflipbookTexHasSwappedViews : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(48)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(49)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(50)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(51)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(52)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(53)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(54)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(55)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(56)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(57)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(58)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(59)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(60)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(61)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(62)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(63)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(64)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(65)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(66)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(67)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(68)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(69)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant int NODE_243_DROPLIST_ITEM [[function_constant(70)]];
constant int NODE_243_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_243_DROPLIST_ITEM) ? NODE_243_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(71)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_flipbookTex [[function_constant(72)]];
constant int SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_flipbookTex) ? SC_SOFTWARE_WRAP_MODE_U_flipbookTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(73)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex) ? SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_flipbookTex [[function_constant(75)]];
constant int SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_flipbookTex) ? SC_SOFTWARE_WRAP_MODE_V_flipbookTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(76)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex [[function_constant(77)]];
constant int SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex) ? SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex : -1;
constant int flipbookTexLayout [[function_constant(78)]];
constant int flipbookTexLayout_tmp = is_function_constant_defined(flipbookTexLayout) ? flipbookTexLayout : 0;
constant int intensityTextureLayout [[function_constant(79)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int renderTarget0Layout [[function_constant(80)]];
constant int renderTarget0Layout_tmp = is_function_constant_defined(renderTarget0Layout) ? renderTarget0Layout : 0;
constant int renderTarget1Layout [[function_constant(81)]];
constant int renderTarget1Layout_tmp = is_function_constant_defined(renderTarget1Layout) ? renderTarget1Layout : 0;
constant int renderTarget2Layout [[function_constant(82)]];
constant int renderTarget2Layout_tmp = is_function_constant_defined(renderTarget2Layout) ? renderTarget2Layout : 0;
constant int renderTarget3Layout [[function_constant(83)]];
constant int renderTarget3Layout_tmp = is_function_constant_defined(renderTarget3Layout) ? renderTarget3Layout : 0;
constant int repelflipbookTexLayout [[function_constant(84)]];
constant int repelflipbookTexLayout_tmp = is_function_constant_defined(repelflipbookTexLayout) ? repelflipbookTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(85)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(86)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(87)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(88)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(89)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(90)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(91)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(92)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(93)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(94)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(95)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(96)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(97)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(98)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(99)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(100)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(101)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(102)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(103)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(104)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_ScreenTextureLayout [[function_constant(105)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(106)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_StereoRenderingMode [[function_constant(107)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(108)]];
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
struct ssParticle
{
float3 Position;
float3 Velocity;
float4 Color;
float Size;
float Age;
float Life;
float Mass;
float3x3 Matrix;
bool Dead;
float4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float SpawnOffset;
float Seed;
float2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
int2 Index2D;
float2 Coord2D;
float2 Ratio2D;
float3 Force;
bool Spawned;
float CopyId;
float SpawnAmount;
float BurstAmount;
float BurstPeriod;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float gComponentTime;
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
int vfxNumCopies;
int vfxBatchEnable[32];
int vfxEmitParticle[32];
float4x4 vfxModelMatrix[32];
float4 renderTarget0Size;
float4 renderTarget0Dims;
float4 renderTarget0View;
float4 renderTarget1Size;
float4 renderTarget1Dims;
float4 renderTarget1View;
float4 renderTarget2Size;
float4 renderTarget2Dims;
float4 renderTarget2View;
float4 renderTarget3Size;
float4 renderTarget3Dims;
float4 renderTarget3View;
float3 vfxLocalAabbMin;
float3 vfxLocalAabbMax;
float vfxCameraAspect;
float vfxCameraNear;
float vfxCameraFar;
float3 vfxCameraUp;
float3 vfxCameraForward;
float3 vfxCameraRight;
float4x4 vfxProjectionMatrix;
float4x4 vfxProjectionMatrixInverse;
float4x4 vfxViewMatrix;
float4x4 vfxViewMatrixInverse;
float4x4 vfxViewProjectionMatrix;
float4x4 vfxViewProjectionMatrixInverse;
int vfxFrame;
int vfxOffsetInstancesRead;
int vfxOffsetInstancesWrite;
float2 vfxTargetSizeRead;
float2 vfxTargetSizeWrite;
int vfxTargetWidth;
float velocityStretch;
int isIdle;
float4 flipbookTexSize;
float4 flipbookTexDims;
float4 flipbookTexView;
float3x3 flipbookTexTransform;
float4 flipbookTexUvMinMax;
float4 flipbookTexBorderColor;
int isAttracting;
float4 colorMix;
float intensity;
float4 repelflipbookTexSize;
float4 repelflipbookTexDims;
float4 repelflipbookTexView;
float3x3 repelflipbookTexTransform;
float4 repelflipbookTexUvMinMax;
float4 repelflipbookTexBorderColor;
float Port_Input1_N362;
float Port_Value_N170;
float3 Port_Input1_N420;
float Port_RangeMinA_N171;
float Port_RangeMaxA_N171;
float Port_RangeMinB_N171;
float Port_RangeMaxB_N171;
float Port_Import_N356;
float Port_Input1_N358;
float Port_AlphaTestThreshold_N039;
float2 Port_SpriteCount_N045;
float Port_MaxFrames_N045;
float Port_Rotation_N159;
float2 Port_Center_N159;
float Port_RangeMinA_N156;
float Port_RangeMaxA_N156;
float Port_RangeMinB_N156;
float Port_RangeMaxB_N156;
float Port_SecondOffset_N045;
float3 Port_Input0_N038;
float2 Port_Input1_N031;
float Port_Input1_N246;
float Port_Input2_N246;
float2 Port_Input1_N035;
float Port_Input1_N036;
float3 Port_Emissive_N026;
float Port_Metallic_N026;
float Port_Roughness_N026;
float3 Port_AO_N026;
float3 Port_SpecularAO_N026;
float2 Port_SpriteCount_N167;
float Port_MaxFrames_N167;
float Port_SecondOffset_N167;
float3 Port_Emissive_N258;
float Port_Metallic_N258;
float Port_Roughness_N258;
float3 Port_AO_N258;
float3 Port_SpecularAO_N258;
};
struct sc_Set0
{
texture2d<float> flipbookTex [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> renderTarget0 [[id(2)]];
texture2d<float> renderTarget1 [[id(3)]];
texture2d<float> renderTarget2 [[id(4)]];
texture2d<float> renderTarget3 [[id(5)]];
texture2d<float> repelflipbookTex [[id(6)]];
texture2d<float> sc_EnvmapDiffuse [[id(7)]];
texture2d<float> sc_EnvmapSpecular [[id(8)]];
texture2d<float> sc_RayTracedAoTexture [[id(17)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(18)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(19)]];
texture2d<float> sc_RayTracedShadowTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
sampler flipbookTexSmpSC [[id(25)]];
sampler intensityTextureSmpSC [[id(26)]];
sampler renderTarget0SmpSC [[id(27)]];
sampler renderTarget1SmpSC [[id(28)]];
sampler renderTarget2SmpSC [[id(29)]];
sampler renderTarget3SmpSC [[id(30)]];
sampler repelflipbookTexSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedAoTextureSmpSC [[id(35)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(36)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(38)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
constant userUniformsObj* UserUniforms [[id(43)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float2 varShadowTex [[user(locn6)]];
int varStereoViewID [[user(locn7)]];
float varClipDistance [[user(locn8)]];
float4 varColor [[user(locn9)]];
int Interp_Particle_Index [[user(locn10)]];
float3 Interp_Particle_Force [[user(locn11)]];
float2 Interp_Particle_Coord [[user(locn12)]];
float Interp_Particle_SpawnIndex [[user(locn13)]];
float Interp_Particle_NextBurstTime [[user(locn14)]];
float3 Interp_Particle_Position [[user(locn15)]];
float3 Interp_Particle_Velocity [[user(locn16)]];
float Interp_Particle_Life [[user(locn17)]];
float Interp_Particle_Age [[user(locn18)]];
float Interp_Particle_Size [[user(locn19)]];
float4 Interp_Particle_Color [[user(locn20)]];
float4 Interp_Particle_Quaternion [[user(locn21)]];
float Interp_Particle_Mass [[user(locn22)]];
float gParticlesDebug [[user(locn23)]];
float2 ParticleUV [[user(locn24)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
};
bool ssDecodeParticle(thread const int& InstanceID,thread uint& gl_InstanceIndex,constant userUniformsObj& UserUniforms,thread texture2d<float> renderTarget0,thread sampler renderTarget0SmpSC,thread texture2d<float> renderTarget1,thread sampler renderTarget1SmpSC,thread texture2d<float> renderTarget2,thread sampler renderTarget2SmpSC,thread texture2d<float> renderTarget3,thread sampler renderTarget3SmpSC,thread ssParticle& gParticle)
{
gParticle.Position=float3(0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(0.0);
gParticle.Size=0.0;
gParticle.Age=0.0;
gParticle.Life=0.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
gParticle.CopyId=float(InstanceID/1600);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
int l9_0=param/1600;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%1600;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(1600*((param/1600)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%512,l9_1/512);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/1600.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(512.0,4.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/1599.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/1599.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(511.0,3.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
float2 l9_13=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_14=dot(l9_13,float2(0.98253,0.72662002));
l9_14=sin(l9_14)*479.371;
l9_14=fract(l9_14);
l9_14=floor(l9_14*10000.0)*9.9999997e-05;
float l9_15=l9_14;
param_1.TimeShift=l9_15;
param_1.SpawnOffset=param_1.Ratio1D*8.0;
ssParticle l9_16=param_1;
int l9_17=l9_0;
float l9_18;
if (UserUniforms.overrideTimeEnabled==1)
{
l9_18=UserUniforms.overrideTimeElapsed[l9_17];
}
else
{
l9_18=UserUniforms.sc_Time.x;
}
float l9_19=l9_18;
l9_16.Seed=(l9_16.Ratio1D*0.97637898)+0.151235;
l9_16.Seed+=(floor(((((l9_19-l9_16.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_16.Seed=fract(abs(l9_16.Seed));
int2 l9_20=int2(l9_16.Index1D%400,l9_16.Index1D/400);
l9_16.Seed2000=(float2(l9_20)+float2(1.0))/float2(399.0);
param_1=l9_16;
gParticle=param_1;
int offsetPixelId=(UserUniforms.vfxOffsetInstancesRead+InstanceID)*4;
int param_2=offsetPixelId;
int param_3=UserUniforms.vfxTargetWidth;
int l9_21=param_2-((param_2/param_3)*param_3);
int2 Index2D=int2(l9_21,offsetPixelId/UserUniforms.vfxTargetWidth);
float2 Coord=(float2(Index2D)+float2(0.5))/float2(2048.0,UserUniforms.vfxTargetSizeRead.y);
float2 Offset=float2(0.00048828125,0.0);
float2 uv=float2(0.0);
float Scalar0=0.0;
float Scalar1=0.0;
float Scalar2=0.0;
float Scalar3=0.0;
float Scalar4=0.0;
float Scalar5=0.0;
float Scalar6=0.0;
float Scalar7=0.0;
float Scalar8=0.0;
float Scalar9=0.0;
float Scalar10=0.0;
float Scalar11=0.0;
float Scalar12=0.0;
float Scalar13=0.0;
float Scalar14=0.0;
float Scalar15=0.0;
uv=Coord+(Offset*0.0);
float2 param_4=uv;
int l9_22=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_23=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_23=0;
}
else
{
l9_23=gl_InstanceIndex%2;
}
int l9_24=l9_23;
l9_22=1-l9_24;
}
else
{
int l9_25=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_25=0;
}
else
{
l9_25=gl_InstanceIndex%2;
}
int l9_26=l9_25;
l9_22=l9_26;
}
int l9_27=l9_22;
float2 l9_28=param_4;
int l9_29=l9_27;
float2 l9_30=l9_28;
int l9_31=l9_29;
float l9_32=0.0;
float4 l9_33=float4(0.0);
float2 l9_34=l9_30;
int l9_35=l9_31;
float l9_36=l9_32;
float4 l9_37=float4(0.0);
float2 l9_38=l9_34;
int l9_39=renderTarget0Layout_tmp;
int l9_40=l9_35;
float l9_41=l9_36;
float2 l9_42=l9_38;
int l9_43=l9_39;
int l9_44=l9_40;
float3 l9_45=float3(0.0);
if (l9_43==0)
{
l9_45=float3(l9_42,0.0);
}
else
{
if (l9_43==1)
{
l9_45=float3(l9_42.x,(l9_42.y*0.5)+(0.5-(float(l9_44)*0.5)),0.0);
}
else
{
l9_45=float3(l9_42,float(l9_44));
}
}
float3 l9_46=l9_45;
float3 l9_47=l9_46;
float2 l9_48=l9_47.xy;
float l9_49=l9_41;
float4 l9_50=renderTarget0.sample(renderTarget0SmpSC,l9_48,level(l9_49));
float4 l9_51=l9_50;
l9_37=l9_51;
float4 l9_52=l9_37;
l9_33=l9_52;
float4 l9_53=l9_33;
float4 l9_54=l9_53;
float4 l9_55=l9_54;
float4 renderTarget0Sample=l9_55;
float4 l9_56=renderTarget0Sample;
bool l9_57=dot(abs(l9_56),float4(1.0))<9.9999997e-06;
bool l9_58;
if (!l9_57)
{
int l9_59=gl_InstanceIndex;
l9_58=!(UserUniforms.vfxBatchEnable[l9_59/1600]!=0);
}
else
{
l9_58=l9_57;
}
if (l9_58)
{
return false;
}
Scalar0=renderTarget0Sample.x;
Scalar1=renderTarget0Sample.y;
Scalar2=renderTarget0Sample.z;
Scalar3=renderTarget0Sample.w;
float2 param_5=uv;
int l9_60=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_61=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_61=0;
}
else
{
l9_61=gl_InstanceIndex%2;
}
int l9_62=l9_61;
l9_60=1-l9_62;
}
else
{
int l9_63=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_63=0;
}
else
{
l9_63=gl_InstanceIndex%2;
}
int l9_64=l9_63;
l9_60=l9_64;
}
int l9_65=l9_60;
float2 l9_66=param_5;
int l9_67=l9_65;
float2 l9_68=l9_66;
int l9_69=l9_67;
float l9_70=0.0;
float4 l9_71=float4(0.0);
float2 l9_72=l9_68;
int l9_73=l9_69;
float l9_74=l9_70;
float4 l9_75=float4(0.0);
float2 l9_76=l9_72;
int l9_77=renderTarget1Layout_tmp;
int l9_78=l9_73;
float l9_79=l9_74;
float2 l9_80=l9_76;
int l9_81=l9_77;
int l9_82=l9_78;
float3 l9_83=float3(0.0);
if (l9_81==0)
{
l9_83=float3(l9_80,0.0);
}
else
{
if (l9_81==1)
{
l9_83=float3(l9_80.x,(l9_80.y*0.5)+(0.5-(float(l9_82)*0.5)),0.0);
}
else
{
l9_83=float3(l9_80,float(l9_82));
}
}
float3 l9_84=l9_83;
float3 l9_85=l9_84;
float2 l9_86=l9_85.xy;
float l9_87=l9_79;
float4 l9_88=renderTarget1.sample(renderTarget1SmpSC,l9_86,level(l9_87));
float4 l9_89=l9_88;
l9_75=l9_89;
float4 l9_90=l9_75;
l9_71=l9_90;
float4 l9_91=l9_71;
float4 l9_92=l9_91;
float4 l9_93=l9_92;
float4 renderTarget1Sample=l9_93;
Scalar4=renderTarget1Sample.x;
Scalar5=renderTarget1Sample.y;
Scalar6=renderTarget1Sample.z;
Scalar7=renderTarget1Sample.w;
float2 param_6=uv;
int l9_94=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_95=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_95=0;
}
else
{
l9_95=gl_InstanceIndex%2;
}
int l9_96=l9_95;
l9_94=1-l9_96;
}
else
{
int l9_97=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_97=0;
}
else
{
l9_97=gl_InstanceIndex%2;
}
int l9_98=l9_97;
l9_94=l9_98;
}
int l9_99=l9_94;
float2 l9_100=param_6;
int l9_101=l9_99;
float2 l9_102=l9_100;
int l9_103=l9_101;
float l9_104=0.0;
float4 l9_105=float4(0.0);
float2 l9_106=l9_102;
int l9_107=l9_103;
float l9_108=l9_104;
float4 l9_109=float4(0.0);
float2 l9_110=l9_106;
int l9_111=renderTarget2Layout_tmp;
int l9_112=l9_107;
float l9_113=l9_108;
float2 l9_114=l9_110;
int l9_115=l9_111;
int l9_116=l9_112;
float3 l9_117=float3(0.0);
if (l9_115==0)
{
l9_117=float3(l9_114,0.0);
}
else
{
if (l9_115==1)
{
l9_117=float3(l9_114.x,(l9_114.y*0.5)+(0.5-(float(l9_116)*0.5)),0.0);
}
else
{
l9_117=float3(l9_114,float(l9_116));
}
}
float3 l9_118=l9_117;
float3 l9_119=l9_118;
float2 l9_120=l9_119.xy;
float l9_121=l9_113;
float4 l9_122=renderTarget2.sample(renderTarget2SmpSC,l9_120,level(l9_121));
float4 l9_123=l9_122;
l9_109=l9_123;
float4 l9_124=l9_109;
l9_105=l9_124;
float4 l9_125=l9_105;
float4 l9_126=l9_125;
float4 l9_127=l9_126;
float4 renderTarget2Sample=l9_127;
Scalar8=renderTarget2Sample.x;
Scalar9=renderTarget2Sample.y;
Scalar10=renderTarget2Sample.z;
Scalar11=renderTarget2Sample.w;
float2 param_7=uv;
int l9_128=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_129=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_129=0;
}
else
{
l9_129=gl_InstanceIndex%2;
}
int l9_130=l9_129;
l9_128=1-l9_130;
}
else
{
int l9_131=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_131=0;
}
else
{
l9_131=gl_InstanceIndex%2;
}
int l9_132=l9_131;
l9_128=l9_132;
}
int l9_133=l9_128;
float2 l9_134=param_7;
int l9_135=l9_133;
float2 l9_136=l9_134;
int l9_137=l9_135;
float l9_138=0.0;
float4 l9_139=float4(0.0);
float2 l9_140=l9_136;
int l9_141=l9_137;
float l9_142=l9_138;
float4 l9_143=float4(0.0);
float2 l9_144=l9_140;
int l9_145=renderTarget3Layout_tmp;
int l9_146=l9_141;
float l9_147=l9_142;
float2 l9_148=l9_144;
int l9_149=l9_145;
int l9_150=l9_146;
float3 l9_151=float3(0.0);
if (l9_149==0)
{
l9_151=float3(l9_148,0.0);
}
else
{
if (l9_149==1)
{
l9_151=float3(l9_148.x,(l9_148.y*0.5)+(0.5-(float(l9_150)*0.5)),0.0);
}
else
{
l9_151=float3(l9_148,float(l9_150));
}
}
float3 l9_152=l9_151;
float3 l9_153=l9_152;
float2 l9_154=l9_153.xy;
float l9_155=l9_147;
float4 l9_156=renderTarget3.sample(renderTarget3SmpSC,l9_154,level(l9_155));
float4 l9_157=l9_156;
l9_143=l9_157;
float4 l9_158=l9_143;
l9_139=l9_158;
float4 l9_159=l9_139;
float4 l9_160=l9_159;
float4 l9_161=l9_160;
float4 renderTarget3Sample=l9_161;
Scalar12=renderTarget3Sample.x;
Scalar13=renderTarget3Sample.y;
Scalar14=renderTarget3Sample.z;
Scalar15=renderTarget3Sample.w;
float4 param_8=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_9=-1000.0;
float param_10=1000.0;
float4 l9_162=param_8;
float l9_163=param_9;
float l9_164=param_10;
float l9_165=0.99998999;
float4 l9_166=l9_162;
#if (1)
{
l9_166=floor((l9_166*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_167=dot(l9_166,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_168=l9_167;
float l9_169=0.0;
float l9_170=l9_165;
float l9_171=l9_163;
float l9_172=l9_164;
float l9_173=l9_171+(((l9_168-l9_169)*(l9_172-l9_171))/(l9_170-l9_169));
float l9_174=l9_173;
float l9_175=l9_174;
gParticle.Position.x=l9_175;
float4 param_11=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_12=-1000.0;
float param_13=1000.0;
float4 l9_176=param_11;
float l9_177=param_12;
float l9_178=param_13;
float l9_179=0.99998999;
float4 l9_180=l9_176;
#if (1)
{
l9_180=floor((l9_180*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_181=dot(l9_180,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_182=l9_181;
float l9_183=0.0;
float l9_184=l9_179;
float l9_185=l9_177;
float l9_186=l9_178;
float l9_187=l9_185+(((l9_182-l9_183)*(l9_186-l9_185))/(l9_184-l9_183));
float l9_188=l9_187;
float l9_189=l9_188;
gParticle.Position.y=l9_189;
float4 param_14=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_15=-1000.0;
float param_16=1000.0;
float4 l9_190=param_14;
float l9_191=param_15;
float l9_192=param_16;
float l9_193=0.99998999;
float4 l9_194=l9_190;
#if (1)
{
l9_194=floor((l9_194*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_195=dot(l9_194,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_196=l9_195;
float l9_197=0.0;
float l9_198=l9_193;
float l9_199=l9_191;
float l9_200=l9_192;
float l9_201=l9_199+(((l9_196-l9_197)*(l9_200-l9_199))/(l9_198-l9_197));
float l9_202=l9_201;
float l9_203=l9_202;
gParticle.Position.z=l9_203;
float4 param_17=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_18=-1000.0;
float param_19=1000.0;
float4 l9_204=param_17;
float l9_205=param_18;
float l9_206=param_19;
float l9_207=0.99998999;
float4 l9_208=l9_204;
#if (1)
{
l9_208=floor((l9_208*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_209=dot(l9_208,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_210=l9_209;
float l9_211=0.0;
float l9_212=l9_207;
float l9_213=l9_205;
float l9_214=l9_206;
float l9_215=l9_213+(((l9_210-l9_211)*(l9_214-l9_213))/(l9_212-l9_211));
float l9_216=l9_215;
float l9_217=l9_216;
gParticle.Velocity.x=l9_217;
uv=Coord+(Offset*1.0);
float2 param_20=uv;
int l9_218=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_219=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_219=0;
}
else
{
l9_219=gl_InstanceIndex%2;
}
int l9_220=l9_219;
l9_218=1-l9_220;
}
else
{
int l9_221=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_221=0;
}
else
{
l9_221=gl_InstanceIndex%2;
}
int l9_222=l9_221;
l9_218=l9_222;
}
int l9_223=l9_218;
float2 l9_224=param_20;
int l9_225=l9_223;
float2 l9_226=l9_224;
int l9_227=l9_225;
float l9_228=0.0;
float4 l9_229=float4(0.0);
float2 l9_230=l9_226;
int l9_231=l9_227;
float l9_232=l9_228;
float4 l9_233=float4(0.0);
float2 l9_234=l9_230;
int l9_235=renderTarget0Layout_tmp;
int l9_236=l9_231;
float l9_237=l9_232;
float2 l9_238=l9_234;
int l9_239=l9_235;
int l9_240=l9_236;
float3 l9_241=float3(0.0);
if (l9_239==0)
{
l9_241=float3(l9_238,0.0);
}
else
{
if (l9_239==1)
{
l9_241=float3(l9_238.x,(l9_238.y*0.5)+(0.5-(float(l9_240)*0.5)),0.0);
}
else
{
l9_241=float3(l9_238,float(l9_240));
}
}
float3 l9_242=l9_241;
float3 l9_243=l9_242;
float2 l9_244=l9_243.xy;
float l9_245=l9_237;
float4 l9_246=renderTarget0.sample(renderTarget0SmpSC,l9_244,level(l9_245));
float4 l9_247=l9_246;
l9_233=l9_247;
float4 l9_248=l9_233;
l9_229=l9_248;
float4 l9_249=l9_229;
float4 l9_250=l9_249;
float4 l9_251=l9_250;
float4 renderTarget0Sample_1=l9_251;
Scalar0=renderTarget0Sample_1.x;
Scalar1=renderTarget0Sample_1.y;
Scalar2=renderTarget0Sample_1.z;
Scalar3=renderTarget0Sample_1.w;
float2 param_21=uv;
int l9_252=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_253=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_253=0;
}
else
{
l9_253=gl_InstanceIndex%2;
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
l9_255=gl_InstanceIndex%2;
}
int l9_256=l9_255;
l9_252=l9_256;
}
int l9_257=l9_252;
float2 l9_258=param_21;
int l9_259=l9_257;
float2 l9_260=l9_258;
int l9_261=l9_259;
float l9_262=0.0;
float4 l9_263=float4(0.0);
float2 l9_264=l9_260;
int l9_265=l9_261;
float l9_266=l9_262;
float4 l9_267=float4(0.0);
float2 l9_268=l9_264;
int l9_269=renderTarget1Layout_tmp;
int l9_270=l9_265;
float l9_271=l9_266;
float2 l9_272=l9_268;
int l9_273=l9_269;
int l9_274=l9_270;
float3 l9_275=float3(0.0);
if (l9_273==0)
{
l9_275=float3(l9_272,0.0);
}
else
{
if (l9_273==1)
{
l9_275=float3(l9_272.x,(l9_272.y*0.5)+(0.5-(float(l9_274)*0.5)),0.0);
}
else
{
l9_275=float3(l9_272,float(l9_274));
}
}
float3 l9_276=l9_275;
float3 l9_277=l9_276;
float2 l9_278=l9_277.xy;
float l9_279=l9_271;
float4 l9_280=renderTarget1.sample(renderTarget1SmpSC,l9_278,level(l9_279));
float4 l9_281=l9_280;
l9_267=l9_281;
float4 l9_282=l9_267;
l9_263=l9_282;
float4 l9_283=l9_263;
float4 l9_284=l9_283;
float4 l9_285=l9_284;
float4 renderTarget1Sample_1=l9_285;
Scalar4=renderTarget1Sample_1.x;
Scalar5=renderTarget1Sample_1.y;
Scalar6=renderTarget1Sample_1.z;
Scalar7=renderTarget1Sample_1.w;
float2 param_22=uv;
int l9_286=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_287=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_287=0;
}
else
{
l9_287=gl_InstanceIndex%2;
}
int l9_288=l9_287;
l9_286=1-l9_288;
}
else
{
int l9_289=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_289=0;
}
else
{
l9_289=gl_InstanceIndex%2;
}
int l9_290=l9_289;
l9_286=l9_290;
}
int l9_291=l9_286;
float2 l9_292=param_22;
int l9_293=l9_291;
float2 l9_294=l9_292;
int l9_295=l9_293;
float l9_296=0.0;
float4 l9_297=float4(0.0);
float2 l9_298=l9_294;
int l9_299=l9_295;
float l9_300=l9_296;
float4 l9_301=float4(0.0);
float2 l9_302=l9_298;
int l9_303=renderTarget2Layout_tmp;
int l9_304=l9_299;
float l9_305=l9_300;
float2 l9_306=l9_302;
int l9_307=l9_303;
int l9_308=l9_304;
float3 l9_309=float3(0.0);
if (l9_307==0)
{
l9_309=float3(l9_306,0.0);
}
else
{
if (l9_307==1)
{
l9_309=float3(l9_306.x,(l9_306.y*0.5)+(0.5-(float(l9_308)*0.5)),0.0);
}
else
{
l9_309=float3(l9_306,float(l9_308));
}
}
float3 l9_310=l9_309;
float3 l9_311=l9_310;
float2 l9_312=l9_311.xy;
float l9_313=l9_305;
float4 l9_314=renderTarget2.sample(renderTarget2SmpSC,l9_312,level(l9_313));
float4 l9_315=l9_314;
l9_301=l9_315;
float4 l9_316=l9_301;
l9_297=l9_316;
float4 l9_317=l9_297;
float4 l9_318=l9_317;
float4 l9_319=l9_318;
float4 renderTarget2Sample_1=l9_319;
Scalar8=renderTarget2Sample_1.x;
Scalar9=renderTarget2Sample_1.y;
Scalar10=renderTarget2Sample_1.z;
Scalar11=renderTarget2Sample_1.w;
float2 param_23=uv;
int l9_320=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_321=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_321=0;
}
else
{
l9_321=gl_InstanceIndex%2;
}
int l9_322=l9_321;
l9_320=1-l9_322;
}
else
{
int l9_323=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_323=0;
}
else
{
l9_323=gl_InstanceIndex%2;
}
int l9_324=l9_323;
l9_320=l9_324;
}
int l9_325=l9_320;
float2 l9_326=param_23;
int l9_327=l9_325;
float2 l9_328=l9_326;
int l9_329=l9_327;
float l9_330=0.0;
float4 l9_331=float4(0.0);
float2 l9_332=l9_328;
int l9_333=l9_329;
float l9_334=l9_330;
float4 l9_335=float4(0.0);
float2 l9_336=l9_332;
int l9_337=renderTarget3Layout_tmp;
int l9_338=l9_333;
float l9_339=l9_334;
float2 l9_340=l9_336;
int l9_341=l9_337;
int l9_342=l9_338;
float3 l9_343=float3(0.0);
if (l9_341==0)
{
l9_343=float3(l9_340,0.0);
}
else
{
if (l9_341==1)
{
l9_343=float3(l9_340.x,(l9_340.y*0.5)+(0.5-(float(l9_342)*0.5)),0.0);
}
else
{
l9_343=float3(l9_340,float(l9_342));
}
}
float3 l9_344=l9_343;
float3 l9_345=l9_344;
float2 l9_346=l9_345.xy;
float l9_347=l9_339;
float4 l9_348=renderTarget3.sample(renderTarget3SmpSC,l9_346,level(l9_347));
float4 l9_349=l9_348;
l9_335=l9_349;
float4 l9_350=l9_335;
l9_331=l9_350;
float4 l9_351=l9_331;
float4 l9_352=l9_351;
float4 l9_353=l9_352;
float4 renderTarget3Sample_1=l9_353;
Scalar12=renderTarget3Sample_1.x;
Scalar13=renderTarget3Sample_1.y;
Scalar14=renderTarget3Sample_1.z;
Scalar15=renderTarget3Sample_1.w;
float4 param_24=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_25=-1000.0;
float param_26=1000.0;
float4 l9_354=param_24;
float l9_355=param_25;
float l9_356=param_26;
float l9_357=0.99998999;
float4 l9_358=l9_354;
#if (1)
{
l9_358=floor((l9_358*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_359=dot(l9_358,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_360=l9_359;
float l9_361=0.0;
float l9_362=l9_357;
float l9_363=l9_355;
float l9_364=l9_356;
float l9_365=l9_363+(((l9_360-l9_361)*(l9_364-l9_363))/(l9_362-l9_361));
float l9_366=l9_365;
float l9_367=l9_366;
gParticle.Velocity.y=l9_367;
float4 param_27=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_28=-1000.0;
float param_29=1000.0;
float4 l9_368=param_27;
float l9_369=param_28;
float l9_370=param_29;
float l9_371=0.99998999;
float4 l9_372=l9_368;
#if (1)
{
l9_372=floor((l9_372*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_373=dot(l9_372,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_374=l9_373;
float l9_375=0.0;
float l9_376=l9_371;
float l9_377=l9_369;
float l9_378=l9_370;
float l9_379=l9_377+(((l9_374-l9_375)*(l9_378-l9_377))/(l9_376-l9_375));
float l9_380=l9_379;
float l9_381=l9_380;
gParticle.Velocity.z=l9_381;
float4 param_30=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_31=0.0;
float param_32=8.0;
float4 l9_382=param_30;
float l9_383=param_31;
float l9_384=param_32;
float l9_385=0.99998999;
float4 l9_386=l9_382;
#if (1)
{
l9_386=floor((l9_386*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_387=dot(l9_386,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_388=l9_387;
float l9_389=0.0;
float l9_390=l9_385;
float l9_391=l9_383;
float l9_392=l9_384;
float l9_393=l9_391+(((l9_388-l9_389)*(l9_392-l9_391))/(l9_390-l9_389));
float l9_394=l9_393;
float l9_395=l9_394;
gParticle.Life=l9_395;
float4 param_33=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_34=0.0;
float param_35=8.0;
float4 l9_396=param_33;
float l9_397=param_34;
float l9_398=param_35;
float l9_399=0.99998999;
float4 l9_400=l9_396;
#if (1)
{
l9_400=floor((l9_400*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_401=dot(l9_400,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_402=l9_401;
float l9_403=0.0;
float l9_404=l9_399;
float l9_405=l9_397;
float l9_406=l9_398;
float l9_407=l9_405+(((l9_402-l9_403)*(l9_406-l9_405))/(l9_404-l9_403));
float l9_408=l9_407;
float l9_409=l9_408;
gParticle.Age=l9_409;
uv=Coord+(Offset*2.0);
float2 param_36=uv;
int l9_410=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_411=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_411=0;
}
else
{
l9_411=gl_InstanceIndex%2;
}
int l9_412=l9_411;
l9_410=1-l9_412;
}
else
{
int l9_413=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_413=0;
}
else
{
l9_413=gl_InstanceIndex%2;
}
int l9_414=l9_413;
l9_410=l9_414;
}
int l9_415=l9_410;
float2 l9_416=param_36;
int l9_417=l9_415;
float2 l9_418=l9_416;
int l9_419=l9_417;
float l9_420=0.0;
float4 l9_421=float4(0.0);
float2 l9_422=l9_418;
int l9_423=l9_419;
float l9_424=l9_420;
float4 l9_425=float4(0.0);
float2 l9_426=l9_422;
int l9_427=renderTarget0Layout_tmp;
int l9_428=l9_423;
float l9_429=l9_424;
float2 l9_430=l9_426;
int l9_431=l9_427;
int l9_432=l9_428;
float3 l9_433=float3(0.0);
if (l9_431==0)
{
l9_433=float3(l9_430,0.0);
}
else
{
if (l9_431==1)
{
l9_433=float3(l9_430.x,(l9_430.y*0.5)+(0.5-(float(l9_432)*0.5)),0.0);
}
else
{
l9_433=float3(l9_430,float(l9_432));
}
}
float3 l9_434=l9_433;
float3 l9_435=l9_434;
float2 l9_436=l9_435.xy;
float l9_437=l9_429;
float4 l9_438=renderTarget0.sample(renderTarget0SmpSC,l9_436,level(l9_437));
float4 l9_439=l9_438;
l9_425=l9_439;
float4 l9_440=l9_425;
l9_421=l9_440;
float4 l9_441=l9_421;
float4 l9_442=l9_441;
float4 l9_443=l9_442;
float4 renderTarget0Sample_2=l9_443;
Scalar0=renderTarget0Sample_2.x;
Scalar1=renderTarget0Sample_2.y;
Scalar2=renderTarget0Sample_2.z;
Scalar3=renderTarget0Sample_2.w;
float2 param_37=uv;
int l9_444=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_445=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_445=0;
}
else
{
l9_445=gl_InstanceIndex%2;
}
int l9_446=l9_445;
l9_444=1-l9_446;
}
else
{
int l9_447=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_447=0;
}
else
{
l9_447=gl_InstanceIndex%2;
}
int l9_448=l9_447;
l9_444=l9_448;
}
int l9_449=l9_444;
float2 l9_450=param_37;
int l9_451=l9_449;
float2 l9_452=l9_450;
int l9_453=l9_451;
float l9_454=0.0;
float4 l9_455=float4(0.0);
float2 l9_456=l9_452;
int l9_457=l9_453;
float l9_458=l9_454;
float4 l9_459=float4(0.0);
float2 l9_460=l9_456;
int l9_461=renderTarget1Layout_tmp;
int l9_462=l9_457;
float l9_463=l9_458;
float2 l9_464=l9_460;
int l9_465=l9_461;
int l9_466=l9_462;
float3 l9_467=float3(0.0);
if (l9_465==0)
{
l9_467=float3(l9_464,0.0);
}
else
{
if (l9_465==1)
{
l9_467=float3(l9_464.x,(l9_464.y*0.5)+(0.5-(float(l9_466)*0.5)),0.0);
}
else
{
l9_467=float3(l9_464,float(l9_466));
}
}
float3 l9_468=l9_467;
float3 l9_469=l9_468;
float2 l9_470=l9_469.xy;
float l9_471=l9_463;
float4 l9_472=renderTarget1.sample(renderTarget1SmpSC,l9_470,level(l9_471));
float4 l9_473=l9_472;
l9_459=l9_473;
float4 l9_474=l9_459;
l9_455=l9_474;
float4 l9_475=l9_455;
float4 l9_476=l9_475;
float4 l9_477=l9_476;
float4 renderTarget1Sample_2=l9_477;
Scalar4=renderTarget1Sample_2.x;
Scalar5=renderTarget1Sample_2.y;
Scalar6=renderTarget1Sample_2.z;
Scalar7=renderTarget1Sample_2.w;
float2 param_38=uv;
int l9_478=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_479=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_479=0;
}
else
{
l9_479=gl_InstanceIndex%2;
}
int l9_480=l9_479;
l9_478=1-l9_480;
}
else
{
int l9_481=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_481=0;
}
else
{
l9_481=gl_InstanceIndex%2;
}
int l9_482=l9_481;
l9_478=l9_482;
}
int l9_483=l9_478;
float2 l9_484=param_38;
int l9_485=l9_483;
float2 l9_486=l9_484;
int l9_487=l9_485;
float l9_488=0.0;
float4 l9_489=float4(0.0);
float2 l9_490=l9_486;
int l9_491=l9_487;
float l9_492=l9_488;
float4 l9_493=float4(0.0);
float2 l9_494=l9_490;
int l9_495=renderTarget2Layout_tmp;
int l9_496=l9_491;
float l9_497=l9_492;
float2 l9_498=l9_494;
int l9_499=l9_495;
int l9_500=l9_496;
float3 l9_501=float3(0.0);
if (l9_499==0)
{
l9_501=float3(l9_498,0.0);
}
else
{
if (l9_499==1)
{
l9_501=float3(l9_498.x,(l9_498.y*0.5)+(0.5-(float(l9_500)*0.5)),0.0);
}
else
{
l9_501=float3(l9_498,float(l9_500));
}
}
float3 l9_502=l9_501;
float3 l9_503=l9_502;
float2 l9_504=l9_503.xy;
float l9_505=l9_497;
float4 l9_506=renderTarget2.sample(renderTarget2SmpSC,l9_504,level(l9_505));
float4 l9_507=l9_506;
l9_493=l9_507;
float4 l9_508=l9_493;
l9_489=l9_508;
float4 l9_509=l9_489;
float4 l9_510=l9_509;
float4 l9_511=l9_510;
float4 renderTarget2Sample_2=l9_511;
Scalar8=renderTarget2Sample_2.x;
Scalar9=renderTarget2Sample_2.y;
Scalar10=renderTarget2Sample_2.z;
Scalar11=renderTarget2Sample_2.w;
float2 param_39=uv;
int l9_512=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_513=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_513=0;
}
else
{
l9_513=gl_InstanceIndex%2;
}
int l9_514=l9_513;
l9_512=1-l9_514;
}
else
{
int l9_515=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_515=0;
}
else
{
l9_515=gl_InstanceIndex%2;
}
int l9_516=l9_515;
l9_512=l9_516;
}
int l9_517=l9_512;
float2 l9_518=param_39;
int l9_519=l9_517;
float2 l9_520=l9_518;
int l9_521=l9_519;
float l9_522=0.0;
float4 l9_523=float4(0.0);
float2 l9_524=l9_520;
int l9_525=l9_521;
float l9_526=l9_522;
float4 l9_527=float4(0.0);
float2 l9_528=l9_524;
int l9_529=renderTarget3Layout_tmp;
int l9_530=l9_525;
float l9_531=l9_526;
float2 l9_532=l9_528;
int l9_533=l9_529;
int l9_534=l9_530;
float3 l9_535=float3(0.0);
if (l9_533==0)
{
l9_535=float3(l9_532,0.0);
}
else
{
if (l9_533==1)
{
l9_535=float3(l9_532.x,(l9_532.y*0.5)+(0.5-(float(l9_534)*0.5)),0.0);
}
else
{
l9_535=float3(l9_532,float(l9_534));
}
}
float3 l9_536=l9_535;
float3 l9_537=l9_536;
float2 l9_538=l9_537.xy;
float l9_539=l9_531;
float4 l9_540=renderTarget3.sample(renderTarget3SmpSC,l9_538,level(l9_539));
float4 l9_541=l9_540;
l9_527=l9_541;
float4 l9_542=l9_527;
l9_523=l9_542;
float4 l9_543=l9_523;
float4 l9_544=l9_543;
float4 l9_545=l9_544;
float4 renderTarget3Sample_2=l9_545;
Scalar12=renderTarget3Sample_2.x;
Scalar13=renderTarget3Sample_2.y;
Scalar14=renderTarget3Sample_2.z;
Scalar15=renderTarget3Sample_2.w;
float4 param_40=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_41=0.0;
float param_42=100.0;
float4 l9_546=param_40;
float l9_547=param_41;
float l9_548=param_42;
float l9_549=0.99998999;
float4 l9_550=l9_546;
#if (1)
{
l9_550=floor((l9_550*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_551=dot(l9_550,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_552=l9_551;
float l9_553=0.0;
float l9_554=l9_549;
float l9_555=l9_547;
float l9_556=l9_548;
float l9_557=l9_555+(((l9_552-l9_553)*(l9_556-l9_555))/(l9_554-l9_553));
float l9_558=l9_557;
float l9_559=l9_558;
gParticle.Size=l9_559;
float4 param_43=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_44=0.0;
float param_45=1.00001;
float4 l9_560=param_43;
float l9_561=param_44;
float l9_562=param_45;
float l9_563=0.99998999;
float4 l9_564=l9_560;
#if (1)
{
l9_564=floor((l9_564*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_565=dot(l9_564,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_566=l9_565;
float l9_567=0.0;
float l9_568=l9_563;
float l9_569=l9_561;
float l9_570=l9_562;
float l9_571=l9_569+(((l9_566-l9_567)*(l9_570-l9_569))/(l9_568-l9_567));
float l9_572=l9_571;
float l9_573=l9_572;
gParticle.Color.x=l9_573;
float4 param_46=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_47=0.0;
float param_48=1.00001;
float4 l9_574=param_46;
float l9_575=param_47;
float l9_576=param_48;
float l9_577=0.99998999;
float4 l9_578=l9_574;
#if (1)
{
l9_578=floor((l9_578*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_579=dot(l9_578,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_580=l9_579;
float l9_581=0.0;
float l9_582=l9_577;
float l9_583=l9_575;
float l9_584=l9_576;
float l9_585=l9_583+(((l9_580-l9_581)*(l9_584-l9_583))/(l9_582-l9_581));
float l9_586=l9_585;
float l9_587=l9_586;
gParticle.Color.y=l9_587;
float4 param_49=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_50=0.0;
float param_51=1.00001;
float4 l9_588=param_49;
float l9_589=param_50;
float l9_590=param_51;
float l9_591=0.99998999;
float4 l9_592=l9_588;
#if (1)
{
l9_592=floor((l9_592*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_593=dot(l9_592,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_594=l9_593;
float l9_595=0.0;
float l9_596=l9_591;
float l9_597=l9_589;
float l9_598=l9_590;
float l9_599=l9_597+(((l9_594-l9_595)*(l9_598-l9_597))/(l9_596-l9_595));
float l9_600=l9_599;
float l9_601=l9_600;
gParticle.Color.z=l9_601;
uv=Coord+(Offset*3.0);
float2 param_52=uv;
int l9_602=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_603=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_603=0;
}
else
{
l9_603=gl_InstanceIndex%2;
}
int l9_604=l9_603;
l9_602=1-l9_604;
}
else
{
int l9_605=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_605=0;
}
else
{
l9_605=gl_InstanceIndex%2;
}
int l9_606=l9_605;
l9_602=l9_606;
}
int l9_607=l9_602;
float2 l9_608=param_52;
int l9_609=l9_607;
float2 l9_610=l9_608;
int l9_611=l9_609;
float l9_612=0.0;
float4 l9_613=float4(0.0);
float2 l9_614=l9_610;
int l9_615=l9_611;
float l9_616=l9_612;
float4 l9_617=float4(0.0);
float2 l9_618=l9_614;
int l9_619=renderTarget0Layout_tmp;
int l9_620=l9_615;
float l9_621=l9_616;
float2 l9_622=l9_618;
int l9_623=l9_619;
int l9_624=l9_620;
float3 l9_625=float3(0.0);
if (l9_623==0)
{
l9_625=float3(l9_622,0.0);
}
else
{
if (l9_623==1)
{
l9_625=float3(l9_622.x,(l9_622.y*0.5)+(0.5-(float(l9_624)*0.5)),0.0);
}
else
{
l9_625=float3(l9_622,float(l9_624));
}
}
float3 l9_626=l9_625;
float3 l9_627=l9_626;
float2 l9_628=l9_627.xy;
float l9_629=l9_621;
float4 l9_630=renderTarget0.sample(renderTarget0SmpSC,l9_628,level(l9_629));
float4 l9_631=l9_630;
l9_617=l9_631;
float4 l9_632=l9_617;
l9_613=l9_632;
float4 l9_633=l9_613;
float4 l9_634=l9_633;
float4 l9_635=l9_634;
float4 renderTarget0Sample_3=l9_635;
Scalar0=renderTarget0Sample_3.x;
Scalar1=renderTarget0Sample_3.y;
Scalar2=renderTarget0Sample_3.z;
Scalar3=renderTarget0Sample_3.w;
float2 param_53=uv;
int l9_636=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_637=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_637=0;
}
else
{
l9_637=gl_InstanceIndex%2;
}
int l9_638=l9_637;
l9_636=1-l9_638;
}
else
{
int l9_639=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_639=0;
}
else
{
l9_639=gl_InstanceIndex%2;
}
int l9_640=l9_639;
l9_636=l9_640;
}
int l9_641=l9_636;
float2 l9_642=param_53;
int l9_643=l9_641;
float2 l9_644=l9_642;
int l9_645=l9_643;
float l9_646=0.0;
float4 l9_647=float4(0.0);
float2 l9_648=l9_644;
int l9_649=l9_645;
float l9_650=l9_646;
float4 l9_651=float4(0.0);
float2 l9_652=l9_648;
int l9_653=renderTarget1Layout_tmp;
int l9_654=l9_649;
float l9_655=l9_650;
float2 l9_656=l9_652;
int l9_657=l9_653;
int l9_658=l9_654;
float3 l9_659=float3(0.0);
if (l9_657==0)
{
l9_659=float3(l9_656,0.0);
}
else
{
if (l9_657==1)
{
l9_659=float3(l9_656.x,(l9_656.y*0.5)+(0.5-(float(l9_658)*0.5)),0.0);
}
else
{
l9_659=float3(l9_656,float(l9_658));
}
}
float3 l9_660=l9_659;
float3 l9_661=l9_660;
float2 l9_662=l9_661.xy;
float l9_663=l9_655;
float4 l9_664=renderTarget1.sample(renderTarget1SmpSC,l9_662,level(l9_663));
float4 l9_665=l9_664;
l9_651=l9_665;
float4 l9_666=l9_651;
l9_647=l9_666;
float4 l9_667=l9_647;
float4 l9_668=l9_667;
float4 l9_669=l9_668;
float4 renderTarget1Sample_3=l9_669;
Scalar4=renderTarget1Sample_3.x;
Scalar5=renderTarget1Sample_3.y;
Scalar6=renderTarget1Sample_3.z;
Scalar7=renderTarget1Sample_3.w;
float2 param_54=uv;
int l9_670=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_671=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_671=0;
}
else
{
l9_671=gl_InstanceIndex%2;
}
int l9_672=l9_671;
l9_670=1-l9_672;
}
else
{
int l9_673=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_673=0;
}
else
{
l9_673=gl_InstanceIndex%2;
}
int l9_674=l9_673;
l9_670=l9_674;
}
int l9_675=l9_670;
float2 l9_676=param_54;
int l9_677=l9_675;
float2 l9_678=l9_676;
int l9_679=l9_677;
float l9_680=0.0;
float4 l9_681=float4(0.0);
float2 l9_682=l9_678;
int l9_683=l9_679;
float l9_684=l9_680;
float4 l9_685=float4(0.0);
float2 l9_686=l9_682;
int l9_687=renderTarget2Layout_tmp;
int l9_688=l9_683;
float l9_689=l9_684;
float2 l9_690=l9_686;
int l9_691=l9_687;
int l9_692=l9_688;
float3 l9_693=float3(0.0);
if (l9_691==0)
{
l9_693=float3(l9_690,0.0);
}
else
{
if (l9_691==1)
{
l9_693=float3(l9_690.x,(l9_690.y*0.5)+(0.5-(float(l9_692)*0.5)),0.0);
}
else
{
l9_693=float3(l9_690,float(l9_692));
}
}
float3 l9_694=l9_693;
float3 l9_695=l9_694;
float2 l9_696=l9_695.xy;
float l9_697=l9_689;
float4 l9_698=renderTarget2.sample(renderTarget2SmpSC,l9_696,level(l9_697));
float4 l9_699=l9_698;
l9_685=l9_699;
float4 l9_700=l9_685;
l9_681=l9_700;
float4 l9_701=l9_681;
float4 l9_702=l9_701;
float4 l9_703=l9_702;
float4 renderTarget2Sample_3=l9_703;
Scalar8=renderTarget2Sample_3.x;
Scalar9=renderTarget2Sample_3.y;
Scalar10=renderTarget2Sample_3.z;
Scalar11=renderTarget2Sample_3.w;
float2 param_55=uv;
int l9_704=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_705=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_705=0;
}
else
{
l9_705=gl_InstanceIndex%2;
}
int l9_706=l9_705;
l9_704=1-l9_706;
}
else
{
int l9_707=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_707=0;
}
else
{
l9_707=gl_InstanceIndex%2;
}
int l9_708=l9_707;
l9_704=l9_708;
}
int l9_709=l9_704;
float2 l9_710=param_55;
int l9_711=l9_709;
float2 l9_712=l9_710;
int l9_713=l9_711;
float l9_714=0.0;
float4 l9_715=float4(0.0);
float2 l9_716=l9_712;
int l9_717=l9_713;
float l9_718=l9_714;
float4 l9_719=float4(0.0);
float2 l9_720=l9_716;
int l9_721=renderTarget3Layout_tmp;
int l9_722=l9_717;
float l9_723=l9_718;
float2 l9_724=l9_720;
int l9_725=l9_721;
int l9_726=l9_722;
float3 l9_727=float3(0.0);
if (l9_725==0)
{
l9_727=float3(l9_724,0.0);
}
else
{
if (l9_725==1)
{
l9_727=float3(l9_724.x,(l9_724.y*0.5)+(0.5-(float(l9_726)*0.5)),0.0);
}
else
{
l9_727=float3(l9_724,float(l9_726));
}
}
float3 l9_728=l9_727;
float3 l9_729=l9_728;
float2 l9_730=l9_729.xy;
float l9_731=l9_723;
float4 l9_732=renderTarget3.sample(renderTarget3SmpSC,l9_730,level(l9_731));
float4 l9_733=l9_732;
l9_719=l9_733;
float4 l9_734=l9_719;
l9_715=l9_734;
float4 l9_735=l9_715;
float4 l9_736=l9_735;
float4 l9_737=l9_736;
float4 renderTarget3Sample_3=l9_737;
Scalar12=renderTarget3Sample_3.x;
Scalar13=renderTarget3Sample_3.y;
Scalar14=renderTarget3Sample_3.z;
Scalar15=renderTarget3Sample_3.w;
float4 param_56=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_57=0.0;
float param_58=1.00001;
float4 l9_738=param_56;
float l9_739=param_57;
float l9_740=param_58;
float l9_741=0.99998999;
float4 l9_742=l9_738;
#if (1)
{
l9_742=floor((l9_742*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_743=dot(l9_742,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_744=l9_743;
float l9_745=0.0;
float l9_746=l9_741;
float l9_747=l9_739;
float l9_748=l9_740;
float l9_749=l9_747+(((l9_744-l9_745)*(l9_748-l9_747))/(l9_746-l9_745));
float l9_750=l9_749;
float l9_751=l9_750;
gParticle.Color.w=l9_751;
float4 param_59=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_60=0.0;
float param_61=1000.0;
float4 l9_752=param_59;
float l9_753=param_60;
float l9_754=param_61;
float l9_755=0.99998999;
float4 l9_756=l9_752;
#if (1)
{
l9_756=floor((l9_756*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_757=dot(l9_756,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_758=l9_757;
float l9_759=0.0;
float l9_760=l9_755;
float l9_761=l9_753;
float l9_762=l9_754;
float l9_763=l9_761+(((l9_758-l9_759)*(l9_762-l9_761))/(l9_760-l9_759));
float l9_764=l9_763;
float l9_765=l9_764;
gParticle.Mass=l9_765;
float2 param_62=float2(Scalar8,Scalar9);
float param_63=-1.0;
float param_64=1.0;
float2 l9_766=param_62;
float l9_767=param_63;
float l9_768=param_64;
float l9_769=0.99998999;
float2 l9_770=l9_766;
#if (1)
{
l9_770=floor((l9_770*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_771=dot(l9_770,float2(1.0,0.0039215689));
float l9_772=l9_771;
float l9_773=0.0;
float l9_774=l9_769;
float l9_775=l9_767;
float l9_776=l9_768;
float l9_777=l9_775+(((l9_772-l9_773)*(l9_776-l9_775))/(l9_774-l9_773));
float l9_778=l9_777;
float l9_779=l9_778;
gParticle.Quaternion.x=l9_779;
float2 param_65=float2(Scalar10,Scalar11);
float param_66=-1.0;
float param_67=1.0;
float2 l9_780=param_65;
float l9_781=param_66;
float l9_782=param_67;
float l9_783=0.99998999;
float2 l9_784=l9_780;
#if (1)
{
l9_784=floor((l9_784*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_785=dot(l9_784,float2(1.0,0.0039215689));
float l9_786=l9_785;
float l9_787=0.0;
float l9_788=l9_783;
float l9_789=l9_781;
float l9_790=l9_782;
float l9_791=l9_789+(((l9_786-l9_787)*(l9_790-l9_789))/(l9_788-l9_787));
float l9_792=l9_791;
float l9_793=l9_792;
gParticle.Quaternion.y=l9_793;
float2 param_68=float2(Scalar12,Scalar13);
float param_69=-1.0;
float param_70=1.0;
float2 l9_794=param_68;
float l9_795=param_69;
float l9_796=param_70;
float l9_797=0.99998999;
float2 l9_798=l9_794;
#if (1)
{
l9_798=floor((l9_798*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_799=dot(l9_798,float2(1.0,0.0039215689));
float l9_800=l9_799;
float l9_801=0.0;
float l9_802=l9_797;
float l9_803=l9_795;
float l9_804=l9_796;
float l9_805=l9_803+(((l9_800-l9_801)*(l9_804-l9_803))/(l9_802-l9_801));
float l9_806=l9_805;
float l9_807=l9_806;
gParticle.Quaternion.z=l9_807;
float2 param_71=float2(Scalar14,Scalar15);
float param_72=-1.0;
float param_73=1.0;
float2 l9_808=param_71;
float l9_809=param_72;
float l9_810=param_73;
float l9_811=0.99998999;
float2 l9_812=l9_808;
#if (1)
{
l9_812=floor((l9_812*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_813=dot(l9_812,float2(1.0,0.0039215689));
float l9_814=l9_813;
float l9_815=0.0;
float l9_816=l9_811;
float l9_817=l9_809;
float l9_818=l9_810;
float l9_819=l9_817+(((l9_814-l9_815)*(l9_818-l9_817))/(l9_816-l9_815));
float l9_820=l9_819;
float l9_821=l9_820;
gParticle.Quaternion.w=l9_821;
float4 param_74=gParticle.Quaternion;
param_74=normalize(param_74.yzwx);
float l9_822=param_74.x*param_74.x;
float l9_823=param_74.y*param_74.y;
float l9_824=param_74.z*param_74.z;
float l9_825=param_74.x*param_74.z;
float l9_826=param_74.x*param_74.y;
float l9_827=param_74.y*param_74.z;
float l9_828=param_74.w*param_74.x;
float l9_829=param_74.w*param_74.y;
float l9_830=param_74.w*param_74.z;
float3x3 l9_831=float3x3(float3(1.0-(2.0*(l9_823+l9_824)),2.0*(l9_826+l9_830),2.0*(l9_825-l9_829)),float3(2.0*(l9_826-l9_830),1.0-(2.0*(l9_822+l9_824)),2.0*(l9_827+l9_828)),float3(2.0*(l9_825+l9_829),2.0*(l9_827-l9_828),1.0-(2.0*(l9_822+l9_823))));
gParticle.Matrix=l9_831;
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+float3(0.5))*0.00050000002;
gParticle.Position=floor((gParticle.Position*2000.0)+float3(0.5))*0.00050000002;
gParticle.Color=floor((gParticle.Color*2000.0)+float4(0.5))*0.00050000002;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.00050000002;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.00050000002;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.00050000002;
return true;
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t v=l9_1;
int l9_2=gl_InstanceIndex;
int InstanceID=l9_2;
int l9_3=InstanceID;
bool l9_4=l9_3>=(1600*((*sc_set0.UserUniforms).vfxNumCopies+1));
ssParticle gParticle;
bool l9_5;
if (!l9_4)
{
int l9_6=gl_InstanceIndex;
l9_5=((*sc_set0.UserUniforms).vfxBatchEnable[l9_6/1600]!=0)==false;
}
else
{
l9_5=l9_4;
}
if (l9_5)
{
float4 param=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_7=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_8=dot(l9_7,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_9=l9_8;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_9;
}
}
float4 l9_10=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_10;
return out;
}
int param_1=InstanceID;
bool l9_12=ssDecodeParticle(param_1,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.renderTarget0,sc_set0.renderTarget0SmpSC,sc_set0.renderTarget1,sc_set0.renderTarget1SmpSC,sc_set0.renderTarget2,sc_set0.renderTarget2SmpSC,sc_set0.renderTarget3,sc_set0.renderTarget3SmpSC,gParticle);
if (!l9_12)
{
float4 param_2=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_2.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_13=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_14=dot(l9_13,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_15=l9_14;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_15;
}
}
float4 l9_16=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_16;
return out;
}
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
int l9_17=gl_InstanceIndex;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_17/1600];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.Surface_UVCoord0=v.texture0;
float l9_18=gParticle.Size;
bool l9_19=l9_18<9.9999997e-06;
bool l9_20;
if (!l9_19)
{
l9_20=gParticle.Age>=gParticle.Life;
}
else
{
l9_20=l9_19;
}
if (l9_20)
{
float4 param_3=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_3.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_21=param_3;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_22=dot(l9_21,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_23=l9_22;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_23;
}
}
float4 l9_24=float4(param_3.x,-param_3.y,(param_3.z*0.5)+(param_3.w*0.5),param_3.w);
out.gl_Position=l9_24;
return out;
}
out.varPos=gParticle.Position+(gParticle.Matrix*float3(v.position.x*gParticle.Size,v.position.y*gParticle.Size,0.0));
out.varNormal=gParticle.Matrix*float3(0.0,0.0,1.0);
float3 l9_25=gParticle.Matrix*float3(1.0,0.0,0.0);
out.varTangent=float4(l9_25.x,l9_25.y,l9_25.z,out.varTangent.w);
out.varTangent.w=1.0;
out.varPackedTex=float4(v.texture0,v.texture1);
float3 Value_N353=float3(0.0);
Value_N353=gParticle.Position;
float Value_N373=0.0;
Value_N373=gParticle.Size;
float2 UVCoord_N361=float2(0.0);
UVCoord_N361=Globals.Surface_UVCoord0;
float2 Output_N362=float2(0.0);
Output_N362=UVCoord_N361-float2((*sc_set0.UserUniforms).Port_Input1_N362);
float Value1_N141=0.0;
float Value2_N141=0.0;
float2 param_4=Output_N362;
float param_5=param_4.x;
float param_6=param_4.y;
Value1_N141=param_5;
Value2_N141=param_6;
float3 Output_N420=float3(0.0);
float param_7=1.0;
float3 param_8=(*sc_set0.UserUniforms).Port_Input1_N420;
float3 param_9=float3(0.0);
float3 l9_26=float3(0.0);
l9_26=gParticle.Velocity;
float l9_27=0.0;
l9_27=length(l9_26);
float l9_28=0.0;
float l9_29=(*sc_set0.UserUniforms).Port_Value_N170;
float l9_30=l9_29+0.001;
l9_30-=0.001;
l9_28=l9_30;
float l9_31=0.0;
l9_31=float(l9_27<l9_28);
param_7=l9_31;
float3 param_10;
if ((param_7*1.0)!=0.0)
{
param_10=param_8;
}
else
{
float3 l9_32=float3(0.0);
l9_32=gParticle.Velocity;
float3 l9_33=float3(0.0);
float3 l9_34=l9_32;
float l9_35=dot(l9_34,l9_34);
float l9_36;
if (l9_35>0.0)
{
l9_36=1.0/sqrt(l9_35);
}
else
{
l9_36=0.0;
}
float l9_37=l9_36;
float3 l9_38=l9_34*l9_37;
l9_33=l9_38;
param_9=l9_33;
param_10=param_9;
}
Output_N420=param_10;
float3 Normal_N142=float3(0.0);
Normal_N142=out.varNormal;
float3 Output_N147=float3(0.0);
Output_N147=-Normal_N142;
float3 Result_N370=float3(0.0);
Result_N370=cross(Output_N420,Output_N147);
float3 Output_N371=float3(0.0);
float3 param_11=Result_N370;
float l9_39=dot(param_11,param_11);
float l9_40;
if (l9_39>0.0)
{
l9_40=1.0/sqrt(l9_39);
}
else
{
l9_40=0.0;
}
float l9_41=l9_40;
float3 param_12=param_11*l9_41;
Output_N371=param_12;
float3 Output_N365=float3(0.0);
Output_N365=(float3(Value_N373)*float3(Value1_N141))*Output_N371;
float Output_N169=0.0;
float param_13=(*sc_set0.UserUniforms).velocityStretch;
Output_N169=param_13;
float ValueOut_N171=0.0;
ValueOut_N171=(((Output_N169-(*sc_set0.UserUniforms).Port_RangeMinA_N171)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N171-(*sc_set0.UserUniforms).Port_RangeMinA_N171)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N171-(*sc_set0.UserUniforms).Port_RangeMinB_N171))+(*sc_set0.UserUniforms).Port_RangeMinB_N171;
float Value_N356=0.0;
Value_N356=ValueOut_N171;
float3 Value_N354=float3(0.0);
Value_N354=gParticle.Velocity;
float Output_N355=0.0;
Output_N355=length(Value_N354);
float Output_N357=0.0;
Output_N357=Value_N356*Output_N355;
float Output_N358=0.0;
Output_N358=fast::max(Output_N357,(*sc_set0.UserUniforms).Port_Input1_N358);
float3 Output_N374=float3(0.0);
Output_N374=((float3(Value_N373)*float3(Value2_N141))*float3(Output_N358))*Output_N420;
float3 Output_N375=float3(0.0);
Output_N375=(Value_N353+Output_N365)+Output_N374;
float3 param_14=Output_N375;
out.varPos=param_14;
float3 param_15=Output_N420;
out.varTangent=float4(param_15.x,param_15.y,param_15.z,out.varTangent.w);
float3 Result_N153=float3(0.0);
Result_N153=cross(Output_N420,Output_N371);
float3 Output_N154=float3(0.0);
float3 param_16=Result_N153;
float l9_42=dot(param_16,param_16);
float l9_43;
if (l9_42>0.0)
{
l9_43=1.0/sqrt(l9_42);
}
else
{
l9_43=0.0;
}
float l9_44=l9_43;
float3 param_17=param_16*l9_44;
Output_N154=param_17;
float3 param_18=Output_N154;
out.varNormal=param_18;
int l9_45=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_45=0;
}
else
{
l9_45=gl_InstanceIndex%2;
}
int l9_46=l9_45;
float4 clipPosition=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_46]*float4(out.varPos,1.0);
float4 param_19=clipPosition;
if (sc_DepthBufferMode_tmp==1)
{
int l9_47=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_47=0;
}
else
{
l9_47=gl_InstanceIndex%2;
}
int l9_48=l9_47;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_48][2].w!=0.0)
{
float l9_49=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
param_19.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+param_19.w))*l9_49)-1.0)*param_19.w;
}
}
float4 l9_50=param_19;
clipPosition=l9_50;
float4 param_20=clipPosition;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_20.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_51=param_20;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_52=dot(l9_51,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_53=l9_52;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_53;
}
}
float4 l9_54=float4(param_20.x,-param_20.y,(param_20.z*0.5)+(param_20.w*0.5),param_20.w);
out.gl_Position=l9_54;
int l9_55=gl_InstanceIndex;
out.Interp_Particle_Index=l9_55;
out.Interp_Particle_Force=gParticle.Force;
out.Interp_Particle_Position=gParticle.Position;
out.Interp_Particle_Velocity=gParticle.Velocity;
out.Interp_Particle_Life=gParticle.Life;
out.Interp_Particle_Age=gParticle.Age;
out.Interp_Particle_Size=gParticle.Size;
out.Interp_Particle_Color=gParticle.Color;
out.Interp_Particle_Quaternion=gParticle.Quaternion;
out.Interp_Particle_Mass=gParticle.Mass;
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssParticle
{
float3 Position;
float3 Velocity;
float4 Color;
float Size;
float Age;
float Life;
float Mass;
float3x3 Matrix;
bool Dead;
float4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float SpawnOffset;
float Seed;
float2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
int2 Index2D;
float2 Coord2D;
float2 Ratio2D;
float3 Force;
bool Spawned;
float CopyId;
float SpawnAmount;
float BurstAmount;
float BurstPeriod;
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
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float gComponentTime;
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
int vfxNumCopies;
int vfxBatchEnable[32];
int vfxEmitParticle[32];
float4x4 vfxModelMatrix[32];
float4 renderTarget0Size;
float4 renderTarget0Dims;
float4 renderTarget0View;
float4 renderTarget1Size;
float4 renderTarget1Dims;
float4 renderTarget1View;
float4 renderTarget2Size;
float4 renderTarget2Dims;
float4 renderTarget2View;
float4 renderTarget3Size;
float4 renderTarget3Dims;
float4 renderTarget3View;
float3 vfxLocalAabbMin;
float3 vfxLocalAabbMax;
float vfxCameraAspect;
float vfxCameraNear;
float vfxCameraFar;
float3 vfxCameraUp;
float3 vfxCameraForward;
float3 vfxCameraRight;
float4x4 vfxProjectionMatrix;
float4x4 vfxProjectionMatrixInverse;
float4x4 vfxViewMatrix;
float4x4 vfxViewMatrixInverse;
float4x4 vfxViewProjectionMatrix;
float4x4 vfxViewProjectionMatrixInverse;
int vfxFrame;
int vfxOffsetInstancesRead;
int vfxOffsetInstancesWrite;
float2 vfxTargetSizeRead;
float2 vfxTargetSizeWrite;
int vfxTargetWidth;
float velocityStretch;
int isIdle;
float4 flipbookTexSize;
float4 flipbookTexDims;
float4 flipbookTexView;
float3x3 flipbookTexTransform;
float4 flipbookTexUvMinMax;
float4 flipbookTexBorderColor;
int isAttracting;
float4 colorMix;
float intensity;
float4 repelflipbookTexSize;
float4 repelflipbookTexDims;
float4 repelflipbookTexView;
float3x3 repelflipbookTexTransform;
float4 repelflipbookTexUvMinMax;
float4 repelflipbookTexBorderColor;
float Port_Input1_N362;
float Port_Value_N170;
float3 Port_Input1_N420;
float Port_RangeMinA_N171;
float Port_RangeMaxA_N171;
float Port_RangeMinB_N171;
float Port_RangeMaxB_N171;
float Port_Import_N356;
float Port_Input1_N358;
float Port_AlphaTestThreshold_N039;
float2 Port_SpriteCount_N045;
float Port_MaxFrames_N045;
float Port_Rotation_N159;
float2 Port_Center_N159;
float Port_RangeMinA_N156;
float Port_RangeMaxA_N156;
float Port_RangeMinB_N156;
float Port_RangeMaxB_N156;
float Port_SecondOffset_N045;
float3 Port_Input0_N038;
float2 Port_Input1_N031;
float Port_Input1_N246;
float Port_Input2_N246;
float2 Port_Input1_N035;
float Port_Input1_N036;
float3 Port_Emissive_N026;
float Port_Metallic_N026;
float Port_Roughness_N026;
float3 Port_AO_N026;
float3 Port_SpecularAO_N026;
float2 Port_SpriteCount_N167;
float Port_MaxFrames_N167;
float Port_SecondOffset_N167;
float3 Port_Emissive_N258;
float Port_Metallic_N258;
float Port_Roughness_N258;
float3 Port_AO_N258;
float3 Port_SpecularAO_N258;
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
struct sc_Set0
{
texture2d<float> flipbookTex [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> renderTarget0 [[id(2)]];
texture2d<float> renderTarget1 [[id(3)]];
texture2d<float> renderTarget2 [[id(4)]];
texture2d<float> renderTarget3 [[id(5)]];
texture2d<float> repelflipbookTex [[id(6)]];
texture2d<float> sc_EnvmapDiffuse [[id(7)]];
texture2d<float> sc_EnvmapSpecular [[id(8)]];
texture2d<float> sc_RayTracedAoTexture [[id(17)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(18)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(19)]];
texture2d<float> sc_RayTracedShadowTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
sampler flipbookTexSmpSC [[id(25)]];
sampler intensityTextureSmpSC [[id(26)]];
sampler renderTarget0SmpSC [[id(27)]];
sampler renderTarget1SmpSC [[id(28)]];
sampler renderTarget2SmpSC [[id(29)]];
sampler renderTarget3SmpSC [[id(30)]];
sampler repelflipbookTexSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedAoTextureSmpSC [[id(35)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(36)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(38)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
constant userUniformsObj* UserUniforms [[id(43)]];
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
float2 varShadowTex [[user(locn6)]];
int varStereoViewID [[user(locn7)]];
float varClipDistance [[user(locn8)]];
float4 varColor [[user(locn9)]];
int Interp_Particle_Index [[user(locn10)]];
float3 Interp_Particle_Force [[user(locn11)]];
float2 Interp_Particle_Coord [[user(locn12)]];
float Interp_Particle_SpawnIndex [[user(locn13)]];
float Interp_Particle_NextBurstTime [[user(locn14)]];
float3 Interp_Particle_Position [[user(locn15)]];
float3 Interp_Particle_Velocity [[user(locn16)]];
float Interp_Particle_Life [[user(locn17)]];
float Interp_Particle_Age [[user(locn18)]];
float Interp_Particle_Size [[user(locn19)]];
float4 Interp_Particle_Color [[user(locn20)]];
float4 Interp_Particle_Quaternion [[user(locn21)]];
float Interp_Particle_Mass [[user(locn22)]];
float gParticlesDebug [[user(locn23)]];
float2 ParticleUV [[user(locn24)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
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
float NdotL=fast::clamp(dot(N,L),0.0,1.0);
float NdotV=fast::clamp(dot(N,V),0.0,1.0);
float NdotH=fast::clamp(dot(N,H),0.0,1.0);
float VdotH=fast::clamp(dot(V,H),0.0,1.0);
if (SC_DEVICE_CLASS_tmp>=2)
{
float param=NdotH;
float param_1=r;
float l9_0=param_1*param_1;
float l9_1=l9_0*l9_0;
float l9_2=param*param;
float l9_3=(l9_2*(l9_1-1.0))+1.0;
float l9_4=l9_3*l9_3;
float l9_5=9.9999999e-09;
float l9_6=l9_1/(l9_4+l9_5);
float param_2=NdotL;
float param_3=NdotV;
float param_4=r;
float l9_7=param_2;
float l9_8=param_4;
float l9_9=l9_8+1.0;
l9_9=(l9_9*l9_9)*0.125;
float l9_10=(l9_7*(1.0-l9_9))+l9_9;
float l9_11=param_3;
float l9_12=param_4;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=1.0/(l9_10*l9_14);
float param_5=VdotH;
float3 param_6=F0;
float l9_16=param_5;
float3 l9_17=param_6;
float3 l9_18=float3(1.0);
float l9_19=1.0-l9_16;
float l9_20=l9_19*l9_19;
float l9_21=(l9_20*l9_20)*l9_19;
float3 l9_22=l9_17+((l9_18-l9_17)*l9_21);
float3 l9_23=l9_22;
return l9_23*(((l9_6*l9_15)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_7=VdotH;
float3 param_8=F0;
float l9_24=param_7;
float3 l9_25=param_8;
float3 l9_26=float3(1.0);
float l9_27=1.0-l9_24;
float l9_28=l9_27*l9_27;
float l9_29=(l9_28*l9_28)*l9_27;
float3 l9_30=l9_25+((l9_26-l9_25)*l9_29);
float3 l9_31=l9_30;
return ((l9_31*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
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
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
float4 Output_Color0=float4(0.0);
float3 ngsTempNormal=float3(0.0);
float4 ngsTempTangent=float4(0.0);
float2 ngsTempUVCoord0=float2(0.0);
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
discard_fragment();
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ngsTempUVCoord0=in.varPackedTex.xy;
ngsTempNormal=in.varNormal;
ngsTempTangent=float4(in.varTangent.xyz.x,in.varTangent.xyz.y,in.varTangent.xyz.z,ngsTempTangent.w);
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
gParticle.Mass=in.Interp_Particle_Mass;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/1600];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(ngsTempTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(ngsTempNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace);
Globals.Surface_UVCoord0=ngsTempUVCoord0;
int param=in.Interp_Particle_Index;
ssParticle param_1=gParticle;
int l9_0=param/1600;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%1600;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(1600*((param/1600)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%512,l9_1/512);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/1600.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(512.0,4.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/1599.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/1599.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(511.0,3.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
float2 l9_13=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_14=dot(l9_13,float2(0.98253,0.72662002));
l9_14=sin(l9_14)*479.371;
l9_14=fract(l9_14);
l9_14=floor(l9_14*10000.0)*9.9999997e-05;
float l9_15=l9_14;
param_1.TimeShift=l9_15;
param_1.SpawnOffset=param_1.Ratio1D*8.0;
ssParticle l9_16=param_1;
int l9_17=l9_0;
float l9_18;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_18=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_17];
}
else
{
l9_18=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_19=l9_18;
l9_16.Seed=(l9_16.Ratio1D*0.97637898)+0.151235;
l9_16.Seed+=(floor(((((l9_19-l9_16.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_16.Seed=fract(abs(l9_16.Seed));
int2 l9_20=int2(l9_16.Index1D%400,l9_16.Index1D/400);
l9_16.Seed2000=(float2(l9_20)+float2(1.0))/float2(399.0);
param_1=l9_16;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Output_Color0=gParticle.Color;
float4 Output_N42=float4(0.0);
float param_2=1.0;
float4 param_3=float4(1.0);
float4 param_4=float4(0.50196099,0.0,0.0081330603,1.0);
ssGlobals param_6=Globals;
float l9_21=0.0;
float l9_22=float((*sc_set0.UserUniforms).isIdle!=0);
l9_21=l9_22;
param_2=l9_21;
float4 param_5;
if ((param_2*1.0)!=0.0)
{
float2 l9_23=float2(0.0);
l9_23=param_6.Surface_UVCoord0;
float2 l9_24=float2(0.0);
float2 l9_25=l9_23;
float l9_26=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_27=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_28=sin(radians(l9_26));
float l9_29=cos(radians(l9_26));
float2 l9_30=l9_25-l9_27;
l9_30=float2(dot(float2(l9_29,l9_28),l9_30),dot(float2(-l9_28,l9_29),l9_30))+l9_27;
l9_24=l9_30;
float l9_31=0.0;
l9_31=gParticle.Index1DPerCopyF;
float l9_32=0.0;
l9_32=gParticle.Ratio1DPerCopy;
float l9_33=0.0;
l9_33=(((l9_32-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_34=float4(0.0);
float2 l9_35=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_36=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_37=l9_24;
float l9_38=l9_31;
float l9_39=l9_33;
float l9_40=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_41=param_6;
float2 l9_42=float2(0.0);
float l9_43=floor(l9_35.x);
float l9_44=floor(l9_35.y);
float l9_45=1.0/l9_43;
float l9_46=1.0/l9_44;
float l9_47=fast::min(l9_43*l9_44,floor(l9_36));
float l9_48=floor(mod(((l9_41.gTimeElapsedShifted+l9_40)*l9_39)+floor(l9_38),l9_47));
float l9_49=floor(l9_48/l9_43);
float l9_50=mod(l9_48,l9_43);
l9_42=float2((l9_45*l9_37.x)+(l9_50*l9_45),((1.0-l9_46)-(l9_49*l9_46))+(l9_46*l9_37.y));
int l9_51=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_52=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_52=0;
}
else
{
l9_52=in.varStereoViewID;
}
int l9_53=l9_52;
l9_51=1-l9_53;
}
else
{
int l9_54=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_54=0;
}
else
{
l9_54=in.varStereoViewID;
}
int l9_55=l9_54;
l9_51=l9_55;
}
int l9_56=l9_51;
int l9_57=flipbookTexLayout_tmp;
int l9_58=l9_56;
float2 l9_59=l9_42;
bool l9_60=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_61=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_62=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_63=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_64=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_65=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_66=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_67=0.0;
bool l9_68=l9_65&&(!l9_63);
float l9_69=1.0;
float l9_70=l9_59.x;
int l9_71=l9_62.x;
if (l9_71==1)
{
l9_70=fract(l9_70);
}
else
{
if (l9_71==2)
{
float l9_72=fract(l9_70);
float l9_73=l9_70-l9_72;
float l9_74=step(0.25,fract(l9_73*0.5));
l9_70=mix(l9_72,1.0-l9_72,fast::clamp(l9_74,0.0,1.0));
}
}
l9_59.x=l9_70;
float l9_75=l9_59.y;
int l9_76=l9_62.y;
if (l9_76==1)
{
l9_75=fract(l9_75);
}
else
{
if (l9_76==2)
{
float l9_77=fract(l9_75);
float l9_78=l9_75-l9_77;
float l9_79=step(0.25,fract(l9_78*0.5));
l9_75=mix(l9_77,1.0-l9_77,fast::clamp(l9_79,0.0,1.0));
}
}
l9_59.y=l9_75;
if (l9_63)
{
bool l9_80=l9_65;
bool l9_81;
if (l9_80)
{
l9_81=l9_62.x==3;
}
else
{
l9_81=l9_80;
}
float l9_82=l9_59.x;
float l9_83=l9_64.x;
float l9_84=l9_64.z;
bool l9_85=l9_81;
float l9_86=l9_69;
float l9_87=fast::clamp(l9_82,l9_83,l9_84);
float l9_88=step(abs(l9_82-l9_87),9.9999997e-06);
l9_86*=(l9_88+((1.0-float(l9_85))*(1.0-l9_88)));
l9_82=l9_87;
l9_59.x=l9_82;
l9_69=l9_86;
bool l9_89=l9_65;
bool l9_90;
if (l9_89)
{
l9_90=l9_62.y==3;
}
else
{
l9_90=l9_89;
}
float l9_91=l9_59.y;
float l9_92=l9_64.y;
float l9_93=l9_64.w;
bool l9_94=l9_90;
float l9_95=l9_69;
float l9_96=fast::clamp(l9_91,l9_92,l9_93);
float l9_97=step(abs(l9_91-l9_96),9.9999997e-06);
l9_95*=(l9_97+((1.0-float(l9_94))*(1.0-l9_97)));
l9_91=l9_96;
l9_59.y=l9_91;
l9_69=l9_95;
}
float2 l9_98=l9_59;
bool l9_99=l9_60;
float3x3 l9_100=l9_61;
if (l9_99)
{
l9_98=float2((l9_100*float3(l9_98,1.0)).xy);
}
float2 l9_101=l9_98;
float2 l9_102=l9_101;
float2 l9_103=l9_102;
l9_59=l9_103;
float l9_104=l9_59.x;
int l9_105=l9_62.x;
bool l9_106=l9_68;
float l9_107=l9_69;
if ((l9_105==0)||(l9_105==3))
{
float l9_108=l9_104;
float l9_109=0.0;
float l9_110=1.0;
bool l9_111=l9_106;
float l9_112=l9_107;
float l9_113=fast::clamp(l9_108,l9_109,l9_110);
float l9_114=step(abs(l9_108-l9_113),9.9999997e-06);
l9_112*=(l9_114+((1.0-float(l9_111))*(1.0-l9_114)));
l9_108=l9_113;
l9_104=l9_108;
l9_107=l9_112;
}
l9_59.x=l9_104;
l9_69=l9_107;
float l9_115=l9_59.y;
int l9_116=l9_62.y;
bool l9_117=l9_68;
float l9_118=l9_69;
if ((l9_116==0)||(l9_116==3))
{
float l9_119=l9_115;
float l9_120=0.0;
float l9_121=1.0;
bool l9_122=l9_117;
float l9_123=l9_118;
float l9_124=fast::clamp(l9_119,l9_120,l9_121);
float l9_125=step(abs(l9_119-l9_124),9.9999997e-06);
l9_123*=(l9_125+((1.0-float(l9_122))*(1.0-l9_125)));
l9_119=l9_124;
l9_115=l9_119;
l9_118=l9_123;
}
l9_59.y=l9_115;
l9_69=l9_118;
float2 l9_126=l9_59;
int l9_127=l9_57;
int l9_128=l9_58;
float l9_129=l9_67;
float2 l9_130=l9_126;
int l9_131=l9_127;
int l9_132=l9_128;
float3 l9_133=float3(0.0);
if (l9_131==0)
{
l9_133=float3(l9_130,0.0);
}
else
{
if (l9_131==1)
{
l9_133=float3(l9_130.x,(l9_130.y*0.5)+(0.5-(float(l9_132)*0.5)),0.0);
}
else
{
l9_133=float3(l9_130,float(l9_132));
}
}
float3 l9_134=l9_133;
float3 l9_135=l9_134;
float2 l9_136=l9_135.xy;
float l9_137=l9_129;
float4 l9_138=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_136,bias(l9_137));
float4 l9_139=l9_138;
float4 l9_140=l9_139;
if (l9_65)
{
l9_140=mix(l9_66,l9_140,float4(l9_69));
}
float4 l9_141=l9_140;
float4 l9_142=l9_141;
l9_34=l9_142;
float l9_143=0.0;
l9_143=l9_34.w;
float4 l9_144=float4(0.0);
l9_144=gParticle.Color;
float l9_145=0.0;
l9_145=l9_144.w;
float l9_146=0.0;
l9_146=l9_143*l9_145;
float2 l9_147=float2(0.0);
l9_147=param_6.Surface_UVCoord0;
float2 l9_148=float2(0.0);
l9_148=l9_147*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_149=float2(0.0);
l9_149=l9_148-float2(1.0);
float l9_150=0.0;
l9_150=dot(l9_149,l9_149);
float l9_151=0.0;
l9_151=fast::clamp(l9_150+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_152=0.0;
l9_152=1.0-l9_151;
float l9_153=0.0;
float l9_154;
if (l9_152<=0.0)
{
l9_154=0.0;
}
else
{
l9_154=sqrt(l9_152);
}
l9_153=l9_154;
float3 l9_155=float3(0.0);
l9_155=float3(l9_149.x,l9_149.y,l9_155.z);
l9_155.z=l9_153;
float l9_156=0.0;
l9_156=distance(l9_147,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_157=0.0;
l9_157=float(l9_156<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_158=float3(0.0);
l9_158=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_155,float3(l9_157));
float3 l9_159=float3(0.0);
l9_159=l9_158;
float4 l9_160=float4(0.0);
float3 l9_161=l9_34.xyz;
float l9_162=l9_146;
float3 l9_163=l9_159;
float3 l9_164=(*sc_set0.UserUniforms).Port_Emissive_N026;
float l9_165=(*sc_set0.UserUniforms).Port_Metallic_N026;
float l9_166=(*sc_set0.UserUniforms).Port_Roughness_N026;
float3 l9_167=(*sc_set0.UserUniforms).Port_AO_N026;
float3 l9_168=(*sc_set0.UserUniforms).Port_SpecularAO_N026;
ssGlobals l9_169=param_6;
l9_169.BumpedNormal=float3x3(float3(l9_169.VertexTangent_WorldSpace),float3(l9_169.VertexBinormal_WorldSpace),float3(l9_169.VertexNormal_WorldSpace))*l9_163;
l9_162=fast::clamp(l9_162,0.0,1.0);
l9_161=fast::max(l9_161,float3(0.0));
float3 l9_170=l9_161;
float l9_171=l9_162;
float3 l9_172=l9_169.BumpedNormal;
float3 l9_173=l9_169.PositionWS;
float3 l9_174=l9_169.ViewDirWS;
float3 l9_175=l9_164;
float l9_176=l9_165;
float l9_177=l9_166;
float3 l9_178=l9_167;
float3 l9_179=l9_168;
SurfaceProperties l9_180;
l9_180.albedo=float3(0.0);
l9_180.opacity=1.0;
l9_180.normal=float3(0.0);
l9_180.positionWS=float3(0.0);
l9_180.viewDirWS=float3(0.0);
l9_180.metallic=0.0;
l9_180.roughness=0.0;
l9_180.emissive=float3(0.0);
l9_180.ao=float3(1.0);
l9_180.specularAo=float3(1.0);
l9_180.bakedShadows=float3(1.0);
SurfaceProperties l9_181=l9_180;
SurfaceProperties l9_182=l9_181;
l9_182.opacity=l9_171;
float3 l9_183=l9_170;
float3 l9_184;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_184=float3(pow(l9_183.x,2.2),pow(l9_183.y,2.2),pow(l9_183.z,2.2));
}
else
{
l9_184=l9_183*l9_183;
}
float3 l9_185=l9_184;
l9_182.albedo=l9_185;
l9_182.normal=normalize(l9_172);
l9_182.positionWS=l9_173;
l9_182.viewDirWS=l9_174;
float3 l9_186=l9_175;
float3 l9_187;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_187=float3(pow(l9_186.x,2.2),pow(l9_186.y,2.2),pow(l9_186.z,2.2));
}
else
{
l9_187=l9_186*l9_186;
}
float3 l9_188=l9_187;
l9_182.emissive=l9_188;
l9_182.metallic=l9_176;
l9_182.roughness=l9_177;
l9_182.ao=l9_178;
l9_182.specularAo=l9_179;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_189=l9_182.positionWS;
l9_182.ao=evaluateSSAO(l9_189,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_190=l9_182;
SurfaceProperties l9_191=l9_190;
float3 l9_192=mix(float3(0.039999999),l9_191.albedo*l9_191.metallic,float3(l9_191.metallic));
float3 l9_193=mix(l9_191.albedo*(1.0-l9_191.metallic),float3(0.0),float3(l9_191.metallic));
l9_190.albedo=l9_193;
l9_190.specColor=l9_192;
SurfaceProperties l9_194=l9_190;
l9_182=l9_194;
SurfaceProperties l9_195=l9_182;
LightingComponents l9_196;
l9_196.directDiffuse=float3(0.0);
l9_196.directSpecular=float3(0.0);
l9_196.indirectDiffuse=float3(1.0);
l9_196.indirectSpecular=float3(0.0);
l9_196.emitted=float3(0.0);
l9_196.transmitted=float3(0.0);
LightingComponents l9_197=l9_196;
LightingComponents l9_198=l9_197;
float3 l9_199=l9_195.viewDirWS;
int l9_200=0;
float4 l9_201=float4(l9_195.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_202;
LightProperties l9_203;
int l9_204=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_204<sc_DirectionalLightsCount_tmp)
{
l9_202.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_204].direction;
l9_202.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_204].color;
l9_203.direction=l9_202.direction;
l9_203.color=l9_202.color.xyz;
l9_203.attenuation=l9_202.color.w;
l9_203.attenuation*=l9_201[(l9_200<3) ? l9_200 : 3];
l9_200++;
LightingComponents l9_205=l9_198;
LightProperties l9_206=l9_203;
SurfaceProperties l9_207=l9_195;
float3 l9_208=l9_199;
SurfaceProperties l9_209=l9_207;
float3 l9_210=l9_206.direction;
float3 l9_211=float3(fast::clamp(dot(l9_209.normal,l9_210),0.0,1.0));
l9_205.directDiffuse+=((l9_211*l9_206.color)*l9_206.attenuation);
SurfaceProperties l9_212=l9_207;
float3 l9_213=l9_206.direction;
float3 l9_214=l9_208;
l9_205.directSpecular+=((calculateDirectSpecular(l9_212,l9_213,l9_214)*l9_206.color)*l9_206.attenuation);
LightingComponents l9_215=l9_205;
l9_198=l9_215;
l9_204++;
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
sc_PointLight_t_1 l9_216;
LightProperties l9_217;
int l9_218=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_218<sc_PointLightsCount_tmp)
{
l9_216.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_218].falloffEnabled!=0;
l9_216.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_218].falloffEndDistance;
l9_216.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_218].negRcpFalloffEndDistance4;
l9_216.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_218].angleScale;
l9_216.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_218].angleOffset;
l9_216.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_218].direction;
l9_216.position=(*sc_set0.UserUniforms).sc_PointLights[l9_218].position;
l9_216.color=(*sc_set0.UserUniforms).sc_PointLights[l9_218].color;
float3 l9_219=l9_216.position-l9_195.positionWS;
l9_217.direction=normalize(l9_219);
l9_217.color=l9_216.color.xyz;
l9_217.attenuation=l9_216.color.w;
l9_217.attenuation*=l9_201[(l9_200<3) ? l9_200 : 3];
float3 l9_220=l9_217.direction;
float3 l9_221=l9_216.direction;
float l9_222=l9_216.angleScale;
float l9_223=l9_216.angleOffset;
float l9_224=dot(l9_220,l9_221);
float l9_225=fast::clamp((l9_224*l9_222)+l9_223,0.0,1.0);
float l9_226=l9_225*l9_225;
l9_217.attenuation*=l9_226;
if (l9_216.falloffEnabled)
{
float l9_227=length(l9_219);
float l9_228=l9_216.falloffEndDistance;
l9_217.attenuation*=computeDistanceAttenuation(l9_227,l9_228);
}
l9_200++;
LightingComponents l9_229=l9_198;
LightProperties l9_230=l9_217;
SurfaceProperties l9_231=l9_195;
float3 l9_232=l9_199;
SurfaceProperties l9_233=l9_231;
float3 l9_234=l9_230.direction;
float3 l9_235=float3(fast::clamp(dot(l9_233.normal,l9_234),0.0,1.0));
l9_229.directDiffuse+=((l9_235*l9_230.color)*l9_230.attenuation);
SurfaceProperties l9_236=l9_231;
float3 l9_237=l9_230.direction;
float3 l9_238=l9_232;
l9_229.directSpecular+=((calculateDirectSpecular(l9_236,l9_237,l9_238)*l9_230.color)*l9_230.attenuation);
LightingComponents l9_239=l9_229;
l9_198=l9_239;
l9_218++;
continue;
}
else
{
break;
}
}
}
bool l9_240=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_240)
{
float4 l9_241=gl_FragCoord;
float2 l9_242=l9_241.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_243=l9_242;
float2 l9_244=l9_243;
int l9_245=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_246=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_246=0;
}
else
{
l9_246=in.varStereoViewID;
}
int l9_247=l9_246;
l9_245=1-l9_247;
}
else
{
int l9_248=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_248=0;
}
else
{
l9_248=in.varStereoViewID;
}
int l9_249=l9_248;
l9_245=l9_249;
}
int l9_250=l9_245;
float2 l9_251=l9_244;
int l9_252=l9_250;
float2 l9_253=l9_251;
int l9_254=l9_252;
float l9_255=0.0;
float4 l9_256=float4(0.0);
float2 l9_257=l9_253;
int l9_258=sc_RayTracedShadowTextureLayout_tmp;
int l9_259=l9_254;
float l9_260=l9_255;
float2 l9_261=l9_257;
int l9_262=l9_258;
int l9_263=l9_259;
float3 l9_264=float3(0.0);
if (l9_262==0)
{
l9_264=float3(l9_261,0.0);
}
else
{
if (l9_262==1)
{
l9_264=float3(l9_261.x,(l9_261.y*0.5)+(0.5-(float(l9_263)*0.5)),0.0);
}
else
{
l9_264=float3(l9_261,float(l9_263));
}
}
float3 l9_265=l9_264;
float3 l9_266=l9_265;
float2 l9_267=l9_266.xy;
float l9_268=l9_260;
float4 l9_269=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_267,bias(l9_268));
float4 l9_270=l9_269;
l9_256=l9_270;
float4 l9_271=l9_256;
float4 l9_272=l9_271;
float4 l9_273=l9_272;
float l9_274=l9_273.x;
float3 l9_275=float3(l9_274);
float3 l9_276=l9_275;
l9_198.directDiffuse*=(float3(1.0)-l9_276);
l9_198.directSpecular*=(float3(1.0)-l9_276);
}
SurfaceProperties l9_277=l9_195;
float3 l9_278=l9_277.normal;
float3 l9_279=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_280=l9_278;
float3 l9_281=l9_280;
float l9_282=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_283=float2(0.0);
float l9_284=l9_281.x;
float l9_285=-l9_281.z;
float l9_286=(l9_284<0.0) ? (-1.0) : 1.0;
float l9_287=l9_286*acos(fast::clamp(l9_285/length(float2(l9_284,l9_285)),-1.0,1.0));
l9_283.x=l9_287-1.5707964;
l9_283.y=acos(l9_281.y);
l9_283/=float2(6.2831855,3.1415927);
l9_283.y=1.0-l9_283.y;
l9_283.x+=(l9_282/360.0);
l9_283.x=fract((l9_283.x+floor(l9_283.x))+1.0);
float2 l9_288=l9_283;
float2 l9_289=l9_288;
float4 l9_290=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_291=l9_289;
float2 l9_292=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_293=5.0;
l9_289=calcSeamlessPanoramicUvsForSampling(l9_291,l9_292,l9_293);
}
float2 l9_294=l9_289;
float l9_295=13.0;
int l9_296=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_297=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_297=0;
}
else
{
l9_297=in.varStereoViewID;
}
int l9_298=l9_297;
l9_296=1-l9_298;
}
else
{
int l9_299=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_299=0;
}
else
{
l9_299=in.varStereoViewID;
}
int l9_300=l9_299;
l9_296=l9_300;
}
int l9_301=l9_296;
float2 l9_302=l9_294;
int l9_303=l9_301;
float l9_304=l9_295;
float4 l9_305=float4(0.0);
float2 l9_306=l9_302;
int l9_307=sc_EnvmapSpecularLayout_tmp;
int l9_308=l9_303;
float l9_309=l9_304;
float2 l9_310=l9_306;
int l9_311=l9_307;
int l9_312=l9_308;
float3 l9_313=float3(0.0);
if (l9_311==0)
{
l9_313=float3(l9_310,0.0);
}
else
{
if (l9_311==1)
{
l9_313=float3(l9_310.x,(l9_310.y*0.5)+(0.5-(float(l9_312)*0.5)),0.0);
}
else
{
l9_313=float3(l9_310,float(l9_312));
}
}
float3 l9_314=l9_313;
float3 l9_315=l9_314;
float2 l9_316=l9_315.xy;
float l9_317=l9_309;
float4 l9_318=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_316,bias(l9_317));
float4 l9_319=l9_318;
l9_305=l9_319;
float4 l9_320=l9_305;
float4 l9_321=l9_320;
l9_290=l9_321;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_322=l9_289;
float2 l9_323=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_324=0.0;
l9_289=calcSeamlessPanoramicUvsForSampling(l9_322,l9_323,l9_324);
float2 l9_325=l9_289;
float l9_326=-13.0;
int l9_327=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_328=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_328=0;
}
else
{
l9_328=in.varStereoViewID;
}
int l9_329=l9_328;
l9_327=1-l9_329;
}
else
{
int l9_330=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_330=0;
}
else
{
l9_330=in.varStereoViewID;
}
int l9_331=l9_330;
l9_327=l9_331;
}
int l9_332=l9_327;
float2 l9_333=l9_325;
int l9_334=l9_332;
float l9_335=l9_326;
float4 l9_336=float4(0.0);
float2 l9_337=l9_333;
int l9_338=sc_EnvmapDiffuseLayout_tmp;
int l9_339=l9_334;
float l9_340=l9_335;
float2 l9_341=l9_337;
int l9_342=l9_338;
int l9_343=l9_339;
float3 l9_344=float3(0.0);
if (l9_342==0)
{
l9_344=float3(l9_341,0.0);
}
else
{
if (l9_342==1)
{
l9_344=float3(l9_341.x,(l9_341.y*0.5)+(0.5-(float(l9_343)*0.5)),0.0);
}
else
{
l9_344=float3(l9_341,float(l9_343));
}
}
float3 l9_345=l9_344;
float3 l9_346=l9_345;
float2 l9_347=l9_346.xy;
float l9_348=l9_340;
float4 l9_349=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_347,bias(l9_348));
float4 l9_350=l9_349;
l9_336=l9_350;
float4 l9_351=l9_336;
float4 l9_352=l9_351;
l9_290=l9_352;
}
else
{
float2 l9_353=l9_289;
float l9_354=13.0;
int l9_355=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_356=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_356=0;
}
else
{
l9_356=in.varStereoViewID;
}
int l9_357=l9_356;
l9_355=1-l9_357;
}
else
{
int l9_358=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_358=0;
}
else
{
l9_358=in.varStereoViewID;
}
int l9_359=l9_358;
l9_355=l9_359;
}
int l9_360=l9_355;
float2 l9_361=l9_353;
int l9_362=l9_360;
float l9_363=l9_354;
float4 l9_364=float4(0.0);
float2 l9_365=l9_361;
int l9_366=sc_EnvmapSpecularLayout_tmp;
int l9_367=l9_362;
float l9_368=l9_363;
float2 l9_369=l9_365;
int l9_370=l9_366;
int l9_371=l9_367;
float3 l9_372=float3(0.0);
if (l9_370==0)
{
l9_372=float3(l9_369,0.0);
}
else
{
if (l9_370==1)
{
l9_372=float3(l9_369.x,(l9_369.y*0.5)+(0.5-(float(l9_371)*0.5)),0.0);
}
else
{
l9_372=float3(l9_369,float(l9_371));
}
}
float3 l9_373=l9_372;
float3 l9_374=l9_373;
float2 l9_375=l9_374.xy;
float l9_376=l9_368;
float4 l9_377=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_375,bias(l9_376));
float4 l9_378=l9_377;
l9_364=l9_378;
float4 l9_379=l9_364;
float4 l9_380=l9_379;
l9_290=l9_380;
}
}
float4 l9_381=l9_290;
float3 l9_382=l9_381.xyz*(1.0/l9_381.w);
float3 l9_383=l9_382*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_279=l9_383;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_384=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_385=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_386=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_387=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_388=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_389=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_390=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_391=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_392=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_393=-l9_278;
float l9_394=0.0;
l9_394=l9_393.x;
float l9_395=l9_393.y;
float l9_396=l9_393.z;
float l9_397=l9_394*l9_394;
float l9_398=l9_395*l9_395;
float l9_399=l9_396*l9_396;
float l9_400=l9_394*l9_395;
float l9_401=l9_395*l9_396;
float l9_402=l9_394*l9_396;
float3 l9_403=((((((l9_392*0.42904299)*(l9_397-l9_398))+((l9_390*0.74312502)*l9_399))+(l9_384*0.88622701))-(l9_390*0.24770799))+((((l9_388*l9_400)+(l9_391*l9_402))+(l9_389*l9_401))*0.85808599))+((((l9_387*l9_394)+(l9_385*l9_395))+(l9_386*l9_396))*1.0233279);
l9_279=l9_403*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_404=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_404)
{
float4 l9_405=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_279=mix(l9_279,l9_405.xyz,float3(l9_405.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_279+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_279.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_279+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_279.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_279+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_279.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_406=l9_278;
float3 l9_407=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_408;
float l9_409;
int l9_410=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_410<sc_LightEstimationSGCount_tmp)
{
l9_408.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_410].color;
l9_408.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_410].sharpness;
l9_408.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_410].axis;
float3 l9_411=l9_406;
float l9_412=dot(l9_408.axis,l9_411);
float l9_413=l9_408.sharpness;
float l9_414=0.36000001;
float l9_415=1.0/(4.0*l9_414);
float l9_416=exp(-l9_413);
float l9_417=l9_416*l9_416;
float l9_418=1.0/l9_413;
float l9_419=(1.0+(2.0*l9_417))-l9_418;
float l9_420=((l9_416-l9_417)*l9_418)-l9_417;
float l9_421=sqrt(1.0-l9_419);
float l9_422=l9_414*l9_412;
float l9_423=l9_415*l9_421;
float l9_424=l9_422+l9_423;
float l9_425=fast::clamp(l9_412,0.0,1.0);
if (step(abs(l9_422),l9_423)>0.5)
{
l9_409=(l9_424*l9_424)/l9_421;
}
else
{
l9_409=l9_425;
}
l9_425=l9_409;
float l9_426=(l9_419*l9_425)+l9_420;
sc_SphericalGaussianLight_t l9_427=l9_408;
float3 l9_428=(l9_427.color/float3(l9_427.sharpness))*6.2831855;
float3 l9_429=(l9_428*l9_426)/float3(3.1415927);
l9_407+=l9_429;
l9_410++;
continue;
}
else
{
break;
}
}
float3 l9_430=l9_407;
l9_279+=l9_430;
}
float3 l9_431=l9_279;
float3 l9_432=l9_431;
l9_198.indirectDiffuse=l9_432;
SurfaceProperties l9_433=l9_195;
float3 l9_434=l9_199;
float3 l9_435=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_436=l9_433;
float3 l9_437=l9_434;
float3 l9_438=l9_436.normal;
float3 l9_439=reflect(-l9_437,l9_438);
float3 l9_440=l9_438;
float3 l9_441=l9_439;
float l9_442=l9_436.roughness;
l9_439=getSpecularDominantDir(l9_440,l9_441,l9_442);
float l9_443=l9_436.roughness;
float l9_444=fast::clamp(pow(l9_443,0.66666669),0.0,1.0)*5.0;
float l9_445=l9_444;
float l9_446=l9_445;
float3 l9_447=l9_439;
float l9_448=l9_446;
float3 l9_449=l9_447;
float l9_450=l9_448;
float4 l9_451=float4(0.0);
float3 l9_452=l9_449;
float l9_453=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_454=float2(0.0);
float l9_455=l9_452.x;
float l9_456=-l9_452.z;
float l9_457=(l9_455<0.0) ? (-1.0) : 1.0;
float l9_458=l9_457*acos(fast::clamp(l9_456/length(float2(l9_455,l9_456)),-1.0,1.0));
l9_454.x=l9_458-1.5707964;
l9_454.y=acos(l9_452.y);
l9_454/=float2(6.2831855,3.1415927);
l9_454.y=1.0-l9_454.y;
l9_454.x+=(l9_453/360.0);
l9_454.x=fract((l9_454.x+floor(l9_454.x))+1.0);
float2 l9_459=l9_454;
float2 l9_460=l9_459;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_461=floor(l9_450);
float l9_462=ceil(l9_450);
float l9_463=l9_450-l9_461;
float2 l9_464=l9_460;
float2 l9_465=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_466=l9_461;
float2 l9_467=calcSeamlessPanoramicUvsForSampling(l9_464,l9_465,l9_466);
float2 l9_468=l9_467;
float l9_469=l9_461;
float2 l9_470=l9_468;
float l9_471=l9_469;
int l9_472=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_473=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_473=0;
}
else
{
l9_473=in.varStereoViewID;
}
int l9_474=l9_473;
l9_472=1-l9_474;
}
else
{
int l9_475=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_475=0;
}
else
{
l9_475=in.varStereoViewID;
}
int l9_476=l9_475;
l9_472=l9_476;
}
int l9_477=l9_472;
float2 l9_478=l9_470;
int l9_479=l9_477;
float l9_480=l9_471;
float4 l9_481=float4(0.0);
float2 l9_482=l9_478;
int l9_483=sc_EnvmapSpecularLayout_tmp;
int l9_484=l9_479;
float l9_485=l9_480;
float2 l9_486=l9_482;
int l9_487=l9_483;
int l9_488=l9_484;
float3 l9_489=float3(0.0);
if (l9_487==0)
{
l9_489=float3(l9_486,0.0);
}
else
{
if (l9_487==1)
{
l9_489=float3(l9_486.x,(l9_486.y*0.5)+(0.5-(float(l9_488)*0.5)),0.0);
}
else
{
l9_489=float3(l9_486,float(l9_488));
}
}
float3 l9_490=l9_489;
float3 l9_491=l9_490;
float2 l9_492=l9_491.xy;
float l9_493=l9_485;
float4 l9_494=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_492,level(l9_493));
float4 l9_495=l9_494;
l9_481=l9_495;
float4 l9_496=l9_481;
float4 l9_497=l9_496;
float4 l9_498=l9_497;
float4 l9_499=l9_498;
float2 l9_500=l9_460;
float2 l9_501=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_502=l9_462;
float2 l9_503=calcSeamlessPanoramicUvsForSampling(l9_500,l9_501,l9_502);
float2 l9_504=l9_503;
float l9_505=l9_462;
float2 l9_506=l9_504;
float l9_507=l9_505;
int l9_508=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_509=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_509=0;
}
else
{
l9_509=in.varStereoViewID;
}
int l9_510=l9_509;
l9_508=1-l9_510;
}
else
{
int l9_511=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_511=0;
}
else
{
l9_511=in.varStereoViewID;
}
int l9_512=l9_511;
l9_508=l9_512;
}
int l9_513=l9_508;
float2 l9_514=l9_506;
int l9_515=l9_513;
float l9_516=l9_507;
float4 l9_517=float4(0.0);
float2 l9_518=l9_514;
int l9_519=sc_EnvmapSpecularLayout_tmp;
int l9_520=l9_515;
float l9_521=l9_516;
float2 l9_522=l9_518;
int l9_523=l9_519;
int l9_524=l9_520;
float3 l9_525=float3(0.0);
if (l9_523==0)
{
l9_525=float3(l9_522,0.0);
}
else
{
if (l9_523==1)
{
l9_525=float3(l9_522.x,(l9_522.y*0.5)+(0.5-(float(l9_524)*0.5)),0.0);
}
else
{
l9_525=float3(l9_522,float(l9_524));
}
}
float3 l9_526=l9_525;
float3 l9_527=l9_526;
float2 l9_528=l9_527.xy;
float l9_529=l9_521;
float4 l9_530=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_528,level(l9_529));
float4 l9_531=l9_530;
l9_517=l9_531;
float4 l9_532=l9_517;
float4 l9_533=l9_532;
float4 l9_534=l9_533;
float4 l9_535=l9_534;
l9_451=mix(l9_499,l9_535,float4(l9_463));
}
else
{
float2 l9_536=l9_460;
float l9_537=l9_450;
float2 l9_538=l9_536;
float l9_539=l9_537;
int l9_540=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_541=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_541=0;
}
else
{
l9_541=in.varStereoViewID;
}
int l9_542=l9_541;
l9_540=1-l9_542;
}
else
{
int l9_543=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_543=0;
}
else
{
l9_543=in.varStereoViewID;
}
int l9_544=l9_543;
l9_540=l9_544;
}
int l9_545=l9_540;
float2 l9_546=l9_538;
int l9_547=l9_545;
float l9_548=l9_539;
float4 l9_549=float4(0.0);
float2 l9_550=l9_546;
int l9_551=sc_EnvmapSpecularLayout_tmp;
int l9_552=l9_547;
float l9_553=l9_548;
float2 l9_554=l9_550;
int l9_555=l9_551;
int l9_556=l9_552;
float3 l9_557=float3(0.0);
if (l9_555==0)
{
l9_557=float3(l9_554,0.0);
}
else
{
if (l9_555==1)
{
l9_557=float3(l9_554.x,(l9_554.y*0.5)+(0.5-(float(l9_556)*0.5)),0.0);
}
else
{
l9_557=float3(l9_554,float(l9_556));
}
}
float3 l9_558=l9_557;
float3 l9_559=l9_558;
float2 l9_560=l9_559.xy;
float l9_561=l9_553;
float4 l9_562=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_560,level(l9_561));
float4 l9_563=l9_562;
l9_549=l9_563;
float4 l9_564=l9_549;
float4 l9_565=l9_564;
float4 l9_566=l9_565;
l9_451=l9_566;
}
float4 l9_567=l9_451;
float3 l9_568=l9_567.xyz*(1.0/l9_567.w);
float3 l9_569=l9_568;
float3 l9_570=l9_569*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_570+=float3(1e-06);
float3 l9_571=l9_570;
float3 l9_572=l9_571;
bool l9_573=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_573)
{
float4 l9_574=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_572=mix(l9_572,l9_574.xyz,float3(l9_574.w));
}
SurfaceProperties l9_575=l9_436;
float l9_576=abs(dot(l9_438,l9_437));
float3 l9_577=l9_572*envBRDFApprox(l9_575,l9_576);
l9_435+=l9_577;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_578=l9_433;
float3 l9_579=l9_434;
float l9_580=fast::clamp(l9_578.roughness*l9_578.roughness,0.0099999998,1.0);
float3 l9_581=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_578.specColor;
sc_SphericalGaussianLight_t l9_582;
sc_SphericalGaussianLight_t l9_583;
sc_SphericalGaussianLight_t l9_584;
int l9_585=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_585<sc_LightEstimationSGCount_tmp)
{
l9_582.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_585].color;
l9_582.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_585].sharpness;
l9_582.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_585].axis;
float3 l9_586=l9_578.normal;
float l9_587=l9_580;
float3 l9_588=l9_579;
float3 l9_589=l9_578.specColor;
float3 l9_590=l9_586;
float l9_591=l9_587;
l9_583.axis=l9_590;
float l9_592=l9_591*l9_591;
l9_583.sharpness=2.0/l9_592;
l9_583.color=float3(1.0/(3.1415927*l9_592));
sc_SphericalGaussianLight_t l9_593=l9_583;
sc_SphericalGaussianLight_t l9_594=l9_593;
sc_SphericalGaussianLight_t l9_595=l9_594;
float3 l9_596=l9_588;
l9_584.axis=reflect(-l9_596,l9_595.axis);
l9_584.color=l9_595.color;
l9_584.sharpness=l9_595.sharpness;
l9_584.sharpness/=(4.0*fast::max(dot(l9_595.axis,l9_596),9.9999997e-05));
sc_SphericalGaussianLight_t l9_597=l9_584;
sc_SphericalGaussianLight_t l9_598=l9_597;
sc_SphericalGaussianLight_t l9_599=l9_598;
sc_SphericalGaussianLight_t l9_600=l9_582;
float l9_601=length((l9_599.axis*l9_599.sharpness)+(l9_600.axis*l9_600.sharpness));
float3 l9_602=(l9_599.color*exp((l9_601-l9_599.sharpness)-l9_600.sharpness))*l9_600.color;
float l9_603=1.0-exp((-2.0)*l9_601);
float3 l9_604=((l9_602*6.2831855)*l9_603)/float3(l9_601);
float3 l9_605=l9_604;
float3 l9_606=l9_598.axis;
float l9_607=l9_587*l9_587;
float l9_608=fast::clamp(dot(l9_586,l9_606),0.0,1.0);
float l9_609=fast::clamp(dot(l9_586,l9_588),0.0,1.0);
float3 l9_610=normalize(l9_598.axis+l9_588);
float l9_611=l9_607;
float l9_612=l9_608;
float l9_613=1.0/(l9_612+sqrt(l9_611+(((1.0-l9_611)*l9_612)*l9_612)));
float l9_614=l9_607;
float l9_615=l9_609;
float l9_616=1.0/(l9_615+sqrt(l9_614+(((1.0-l9_614)*l9_615)*l9_615)));
l9_605*=(l9_613*l9_616);
float l9_617=pow(1.0-fast::clamp(dot(l9_606,l9_610),0.0,1.0),5.0);
l9_605*=(l9_589+((float3(1.0)-l9_589)*l9_617));
l9_605*=l9_608;
float3 l9_618=l9_605;
l9_581+=l9_618;
l9_585++;
continue;
}
else
{
break;
}
}
float3 l9_619=l9_581;
l9_435+=l9_619;
}
float3 l9_620=l9_435;
l9_198.indirectSpecular=l9_620;
LightingComponents l9_621=l9_198;
LightingComponents l9_622=l9_621;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_622.directDiffuse=float3(0.0);
l9_622.indirectDiffuse=float3(0.0);
float4 l9_623=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_624=out.FragColor0;
float4 l9_625=l9_624;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_625.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_626=l9_625;
l9_623=l9_626;
}
else
{
float4 l9_627=gl_FragCoord;
float2 l9_628=l9_627.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_629=l9_628;
float2 l9_630=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_631=1;
int l9_632=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_632=0;
}
else
{
l9_632=in.varStereoViewID;
}
int l9_633=l9_632;
int l9_634=l9_633;
float3 l9_635=float3(l9_629,0.0);
int l9_636=l9_631;
int l9_637=l9_634;
if (l9_636==1)
{
l9_635.y=((2.0*l9_635.y)+float(l9_637))-1.0;
}
float2 l9_638=l9_635.xy;
l9_630=l9_638;
}
else
{
l9_630=l9_629;
}
float2 l9_639=l9_630;
float2 l9_640=l9_639;
float2 l9_641=l9_640;
int l9_642=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_643=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_643=0;
}
else
{
l9_643=in.varStereoViewID;
}
int l9_644=l9_643;
l9_642=1-l9_644;
}
else
{
int l9_645=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_645=0;
}
else
{
l9_645=in.varStereoViewID;
}
int l9_646=l9_645;
l9_642=l9_646;
}
int l9_647=l9_642;
float2 l9_648=l9_641;
int l9_649=l9_647;
float2 l9_650=l9_648;
int l9_651=l9_649;
float l9_652=0.0;
float4 l9_653=float4(0.0);
float2 l9_654=l9_650;
int l9_655=sc_ScreenTextureLayout_tmp;
int l9_656=l9_651;
float l9_657=l9_652;
float2 l9_658=l9_654;
int l9_659=l9_655;
int l9_660=l9_656;
float3 l9_661=float3(0.0);
if (l9_659==0)
{
l9_661=float3(l9_658,0.0);
}
else
{
if (l9_659==1)
{
l9_661=float3(l9_658.x,(l9_658.y*0.5)+(0.5-(float(l9_660)*0.5)),0.0);
}
else
{
l9_661=float3(l9_658,float(l9_660));
}
}
float3 l9_662=l9_661;
float3 l9_663=l9_662;
float2 l9_664=l9_663.xy;
float l9_665=l9_657;
float4 l9_666=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_664,bias(l9_665));
float4 l9_667=l9_666;
l9_653=l9_667;
float4 l9_668=l9_653;
float4 l9_669=l9_668;
float4 l9_670=l9_669;
l9_623=l9_670;
}
float4 l9_671=l9_623;
float4 l9_672=l9_671;
float3 l9_673=l9_672.xyz;
float3 l9_674;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_674=float3(pow(l9_673.x,2.2),pow(l9_673.y,2.2),pow(l9_673.z,2.2));
}
else
{
l9_674=l9_673*l9_673;
}
float3 l9_675=l9_674;
float3 l9_676=l9_675;
l9_622.transmitted=l9_676*mix(float3(1.0),l9_182.albedo,float3(l9_182.opacity));
l9_182.opacity=1.0;
}
bool l9_677=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_677=true;
}
SurfaceProperties l9_678=l9_182;
LightingComponents l9_679=l9_622;
bool l9_680=l9_677;
float3 l9_681=float3(0.0);
bool l9_682=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_682)
{
l9_681=l9_678.albedo*(l9_679.directDiffuse+(l9_679.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_681=l9_678.albedo*(l9_679.directDiffuse+(l9_679.indirectDiffuse*l9_678.ao));
}
float3 l9_683=l9_679.directSpecular+(l9_679.indirectSpecular*l9_678.specularAo);
float3 l9_684=l9_678.emissive;
float3 l9_685=l9_679.transmitted;
if (l9_680)
{
float l9_686=l9_678.opacity;
l9_681*=srgbToLinear(l9_686);
}
float3 l9_687=((l9_681+l9_683)+l9_684)+l9_685;
float3 l9_688=l9_687;
float4 l9_689=float4(l9_688,l9_182.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_690=l9_689.xyz;
float l9_691=1.8;
float l9_692=1.4;
float l9_693=0.5;
float l9_694=1.5;
float3 l9_695=(l9_690*((l9_690*l9_691)+float3(l9_692)))/((l9_690*((l9_690*l9_691)+float3(l9_693)))+float3(l9_694));
l9_689=float4(l9_695.x,l9_695.y,l9_695.z,l9_689.w);
}
float3 l9_696=l9_689.xyz;
float l9_697=l9_696.x;
float l9_698=l9_696.y;
float l9_699=l9_696.z;
float3 l9_700=float3(linearToSrgb(l9_697),linearToSrgb(l9_698),linearToSrgb(l9_699));
l9_689=float4(l9_700.x,l9_700.y,l9_700.z,l9_689.w);
float4 l9_701=l9_689;
float4 l9_702=l9_701;
l9_702=fast::max(l9_702,float4(0.0));
l9_160=l9_702;
param_3=l9_160;
param_5=param_3;
}
else
{
float4 l9_703=float4(0.0);
float l9_704=1.0;
float4 l9_705=float4(1.0);
float4 l9_706=float4(0.5,0.0,0.0,0.0);
ssGlobals l9_707=param_6;
float l9_708=0.0;
float l9_709=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_708=l9_709;
l9_704=l9_708;
float4 l9_710;
if ((l9_704*1.0)!=0.0)
{
float2 l9_711=float2(0.0);
l9_711=l9_707.Surface_UVCoord0;
float2 l9_712=float2(0.0);
float2 l9_713=l9_711;
float l9_714=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_715=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_716=sin(radians(l9_714));
float l9_717=cos(radians(l9_714));
float2 l9_718=l9_713-l9_715;
l9_718=float2(dot(float2(l9_717,l9_716),l9_718),dot(float2(-l9_716,l9_717),l9_718))+l9_715;
l9_712=l9_718;
float l9_719=0.0;
l9_719=gParticle.Index1DPerCopyF;
float l9_720=0.0;
l9_720=gParticle.Ratio1DPerCopy;
float l9_721=0.0;
l9_721=(((l9_720-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_722=float4(0.0);
float2 l9_723=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_724=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_725=l9_712;
float l9_726=l9_719;
float l9_727=l9_721;
float l9_728=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_729=l9_707;
float2 l9_730=float2(0.0);
float l9_731=floor(l9_723.x);
float l9_732=floor(l9_723.y);
float l9_733=1.0/l9_731;
float l9_734=1.0/l9_732;
float l9_735=fast::min(l9_731*l9_732,floor(l9_724));
float l9_736=floor(mod(((l9_729.gTimeElapsedShifted+l9_728)*l9_727)+floor(l9_726),l9_735));
float l9_737=floor(l9_736/l9_731);
float l9_738=mod(l9_736,l9_731);
l9_730=float2((l9_733*l9_725.x)+(l9_738*l9_733),((1.0-l9_734)-(l9_737*l9_734))+(l9_734*l9_725.y));
int l9_739=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_740=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_740=0;
}
else
{
l9_740=in.varStereoViewID;
}
int l9_741=l9_740;
l9_739=1-l9_741;
}
else
{
int l9_742=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_742=0;
}
else
{
l9_742=in.varStereoViewID;
}
int l9_743=l9_742;
l9_739=l9_743;
}
int l9_744=l9_739;
int l9_745=flipbookTexLayout_tmp;
int l9_746=l9_744;
float2 l9_747=l9_730;
bool l9_748=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_749=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_750=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_751=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_752=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_753=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_754=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_755=0.0;
bool l9_756=l9_753&&(!l9_751);
float l9_757=1.0;
float l9_758=l9_747.x;
int l9_759=l9_750.x;
if (l9_759==1)
{
l9_758=fract(l9_758);
}
else
{
if (l9_759==2)
{
float l9_760=fract(l9_758);
float l9_761=l9_758-l9_760;
float l9_762=step(0.25,fract(l9_761*0.5));
l9_758=mix(l9_760,1.0-l9_760,fast::clamp(l9_762,0.0,1.0));
}
}
l9_747.x=l9_758;
float l9_763=l9_747.y;
int l9_764=l9_750.y;
if (l9_764==1)
{
l9_763=fract(l9_763);
}
else
{
if (l9_764==2)
{
float l9_765=fract(l9_763);
float l9_766=l9_763-l9_765;
float l9_767=step(0.25,fract(l9_766*0.5));
l9_763=mix(l9_765,1.0-l9_765,fast::clamp(l9_767,0.0,1.0));
}
}
l9_747.y=l9_763;
if (l9_751)
{
bool l9_768=l9_753;
bool l9_769;
if (l9_768)
{
l9_769=l9_750.x==3;
}
else
{
l9_769=l9_768;
}
float l9_770=l9_747.x;
float l9_771=l9_752.x;
float l9_772=l9_752.z;
bool l9_773=l9_769;
float l9_774=l9_757;
float l9_775=fast::clamp(l9_770,l9_771,l9_772);
float l9_776=step(abs(l9_770-l9_775),9.9999997e-06);
l9_774*=(l9_776+((1.0-float(l9_773))*(1.0-l9_776)));
l9_770=l9_775;
l9_747.x=l9_770;
l9_757=l9_774;
bool l9_777=l9_753;
bool l9_778;
if (l9_777)
{
l9_778=l9_750.y==3;
}
else
{
l9_778=l9_777;
}
float l9_779=l9_747.y;
float l9_780=l9_752.y;
float l9_781=l9_752.w;
bool l9_782=l9_778;
float l9_783=l9_757;
float l9_784=fast::clamp(l9_779,l9_780,l9_781);
float l9_785=step(abs(l9_779-l9_784),9.9999997e-06);
l9_783*=(l9_785+((1.0-float(l9_782))*(1.0-l9_785)));
l9_779=l9_784;
l9_747.y=l9_779;
l9_757=l9_783;
}
float2 l9_786=l9_747;
bool l9_787=l9_748;
float3x3 l9_788=l9_749;
if (l9_787)
{
l9_786=float2((l9_788*float3(l9_786,1.0)).xy);
}
float2 l9_789=l9_786;
float2 l9_790=l9_789;
float2 l9_791=l9_790;
l9_747=l9_791;
float l9_792=l9_747.x;
int l9_793=l9_750.x;
bool l9_794=l9_756;
float l9_795=l9_757;
if ((l9_793==0)||(l9_793==3))
{
float l9_796=l9_792;
float l9_797=0.0;
float l9_798=1.0;
bool l9_799=l9_794;
float l9_800=l9_795;
float l9_801=fast::clamp(l9_796,l9_797,l9_798);
float l9_802=step(abs(l9_796-l9_801),9.9999997e-06);
l9_800*=(l9_802+((1.0-float(l9_799))*(1.0-l9_802)));
l9_796=l9_801;
l9_792=l9_796;
l9_795=l9_800;
}
l9_747.x=l9_792;
l9_757=l9_795;
float l9_803=l9_747.y;
int l9_804=l9_750.y;
bool l9_805=l9_756;
float l9_806=l9_757;
if ((l9_804==0)||(l9_804==3))
{
float l9_807=l9_803;
float l9_808=0.0;
float l9_809=1.0;
bool l9_810=l9_805;
float l9_811=l9_806;
float l9_812=fast::clamp(l9_807,l9_808,l9_809);
float l9_813=step(abs(l9_807-l9_812),9.9999997e-06);
l9_811*=(l9_813+((1.0-float(l9_810))*(1.0-l9_813)));
l9_807=l9_812;
l9_803=l9_807;
l9_806=l9_811;
}
l9_747.y=l9_803;
l9_757=l9_806;
float2 l9_814=l9_747;
int l9_815=l9_745;
int l9_816=l9_746;
float l9_817=l9_755;
float2 l9_818=l9_814;
int l9_819=l9_815;
int l9_820=l9_816;
float3 l9_821=float3(0.0);
if (l9_819==0)
{
l9_821=float3(l9_818,0.0);
}
else
{
if (l9_819==1)
{
l9_821=float3(l9_818.x,(l9_818.y*0.5)+(0.5-(float(l9_820)*0.5)),0.0);
}
else
{
l9_821=float3(l9_818,float(l9_820));
}
}
float3 l9_822=l9_821;
float3 l9_823=l9_822;
float2 l9_824=l9_823.xy;
float l9_825=l9_817;
float4 l9_826=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_824,bias(l9_825));
float4 l9_827=l9_826;
float4 l9_828=l9_827;
if (l9_753)
{
l9_828=mix(l9_754,l9_828,float4(l9_757));
}
float4 l9_829=l9_828;
float4 l9_830=l9_829;
l9_722=l9_830;
float l9_831=0.0;
l9_831=l9_722.w;
float4 l9_832=float4(0.0);
l9_832=gParticle.Color;
float l9_833=0.0;
l9_833=l9_832.w;
float l9_834=0.0;
l9_834=l9_831*l9_833;
float2 l9_835=float2(0.0);
l9_835=l9_707.Surface_UVCoord0;
float2 l9_836=float2(0.0);
l9_836=l9_835*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_837=float2(0.0);
l9_837=l9_836-float2(1.0);
float l9_838=0.0;
l9_838=dot(l9_837,l9_837);
float l9_839=0.0;
l9_839=fast::clamp(l9_838+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_840=0.0;
l9_840=1.0-l9_839;
float l9_841=0.0;
float l9_842;
if (l9_840<=0.0)
{
l9_842=0.0;
}
else
{
l9_842=sqrt(l9_840);
}
l9_841=l9_842;
float3 l9_843=float3(0.0);
l9_843=float3(l9_837.x,l9_837.y,l9_843.z);
l9_843.z=l9_841;
float l9_844=0.0;
l9_844=distance(l9_835,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_845=0.0;
l9_845=float(l9_844<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_846=float3(0.0);
l9_846=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_843,float3(l9_845));
float3 l9_847=float3(0.0);
l9_847=l9_846;
float4 l9_848=float4(0.0);
float3 l9_849=l9_722.xyz;
float l9_850=l9_834;
float3 l9_851=l9_847;
float3 l9_852=(*sc_set0.UserUniforms).Port_Emissive_N026;
float l9_853=(*sc_set0.UserUniforms).Port_Metallic_N026;
float l9_854=(*sc_set0.UserUniforms).Port_Roughness_N026;
float3 l9_855=(*sc_set0.UserUniforms).Port_AO_N026;
float3 l9_856=(*sc_set0.UserUniforms).Port_SpecularAO_N026;
ssGlobals l9_857=l9_707;
l9_857.BumpedNormal=float3x3(float3(l9_857.VertexTangent_WorldSpace),float3(l9_857.VertexBinormal_WorldSpace),float3(l9_857.VertexNormal_WorldSpace))*l9_851;
l9_850=fast::clamp(l9_850,0.0,1.0);
l9_849=fast::max(l9_849,float3(0.0));
float3 l9_858=l9_849;
float l9_859=l9_850;
float3 l9_860=l9_857.BumpedNormal;
float3 l9_861=l9_857.PositionWS;
float3 l9_862=l9_857.ViewDirWS;
float3 l9_863=l9_852;
float l9_864=l9_853;
float l9_865=l9_854;
float3 l9_866=l9_855;
float3 l9_867=l9_856;
SurfaceProperties l9_868;
l9_868.albedo=float3(0.0);
l9_868.opacity=1.0;
l9_868.normal=float3(0.0);
l9_868.positionWS=float3(0.0);
l9_868.viewDirWS=float3(0.0);
l9_868.metallic=0.0;
l9_868.roughness=0.0;
l9_868.emissive=float3(0.0);
l9_868.ao=float3(1.0);
l9_868.specularAo=float3(1.0);
l9_868.bakedShadows=float3(1.0);
SurfaceProperties l9_869=l9_868;
SurfaceProperties l9_870=l9_869;
l9_870.opacity=l9_859;
float3 l9_871=l9_858;
float3 l9_872;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_872=float3(pow(l9_871.x,2.2),pow(l9_871.y,2.2),pow(l9_871.z,2.2));
}
else
{
l9_872=l9_871*l9_871;
}
float3 l9_873=l9_872;
l9_870.albedo=l9_873;
l9_870.normal=normalize(l9_860);
l9_870.positionWS=l9_861;
l9_870.viewDirWS=l9_862;
float3 l9_874=l9_863;
float3 l9_875;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_875=float3(pow(l9_874.x,2.2),pow(l9_874.y,2.2),pow(l9_874.z,2.2));
}
else
{
l9_875=l9_874*l9_874;
}
float3 l9_876=l9_875;
l9_870.emissive=l9_876;
l9_870.metallic=l9_864;
l9_870.roughness=l9_865;
l9_870.ao=l9_866;
l9_870.specularAo=l9_867;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_877=l9_870.positionWS;
l9_870.ao=evaluateSSAO(l9_877,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_878=l9_870;
SurfaceProperties l9_879=l9_878;
float3 l9_880=mix(float3(0.039999999),l9_879.albedo*l9_879.metallic,float3(l9_879.metallic));
float3 l9_881=mix(l9_879.albedo*(1.0-l9_879.metallic),float3(0.0),float3(l9_879.metallic));
l9_878.albedo=l9_881;
l9_878.specColor=l9_880;
SurfaceProperties l9_882=l9_878;
l9_870=l9_882;
SurfaceProperties l9_883=l9_870;
LightingComponents l9_884;
l9_884.directDiffuse=float3(0.0);
l9_884.directSpecular=float3(0.0);
l9_884.indirectDiffuse=float3(1.0);
l9_884.indirectSpecular=float3(0.0);
l9_884.emitted=float3(0.0);
l9_884.transmitted=float3(0.0);
LightingComponents l9_885=l9_884;
LightingComponents l9_886=l9_885;
float3 l9_887=l9_883.viewDirWS;
int l9_888=0;
float4 l9_889=float4(l9_883.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_890;
LightProperties l9_891;
int l9_892=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_892<sc_DirectionalLightsCount_tmp)
{
l9_890.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_892].direction;
l9_890.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_892].color;
l9_891.direction=l9_890.direction;
l9_891.color=l9_890.color.xyz;
l9_891.attenuation=l9_890.color.w;
l9_891.attenuation*=l9_889[(l9_888<3) ? l9_888 : 3];
l9_888++;
LightingComponents l9_893=l9_886;
LightProperties l9_894=l9_891;
SurfaceProperties l9_895=l9_883;
float3 l9_896=l9_887;
SurfaceProperties l9_897=l9_895;
float3 l9_898=l9_894.direction;
float3 l9_899=float3(fast::clamp(dot(l9_897.normal,l9_898),0.0,1.0));
l9_893.directDiffuse+=((l9_899*l9_894.color)*l9_894.attenuation);
SurfaceProperties l9_900=l9_895;
float3 l9_901=l9_894.direction;
float3 l9_902=l9_896;
l9_893.directSpecular+=((calculateDirectSpecular(l9_900,l9_901,l9_902)*l9_894.color)*l9_894.attenuation);
LightingComponents l9_903=l9_893;
l9_886=l9_903;
l9_892++;
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
sc_PointLight_t_1 l9_904;
LightProperties l9_905;
int l9_906=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_906<sc_PointLightsCount_tmp)
{
l9_904.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_906].falloffEnabled!=0;
l9_904.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_906].falloffEndDistance;
l9_904.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_906].negRcpFalloffEndDistance4;
l9_904.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_906].angleScale;
l9_904.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_906].angleOffset;
l9_904.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_906].direction;
l9_904.position=(*sc_set0.UserUniforms).sc_PointLights[l9_906].position;
l9_904.color=(*sc_set0.UserUniforms).sc_PointLights[l9_906].color;
float3 l9_907=l9_904.position-l9_883.positionWS;
l9_905.direction=normalize(l9_907);
l9_905.color=l9_904.color.xyz;
l9_905.attenuation=l9_904.color.w;
l9_905.attenuation*=l9_889[(l9_888<3) ? l9_888 : 3];
float3 l9_908=l9_905.direction;
float3 l9_909=l9_904.direction;
float l9_910=l9_904.angleScale;
float l9_911=l9_904.angleOffset;
float l9_912=dot(l9_908,l9_909);
float l9_913=fast::clamp((l9_912*l9_910)+l9_911,0.0,1.0);
float l9_914=l9_913*l9_913;
l9_905.attenuation*=l9_914;
if (l9_904.falloffEnabled)
{
float l9_915=length(l9_907);
float l9_916=l9_904.falloffEndDistance;
l9_905.attenuation*=computeDistanceAttenuation(l9_915,l9_916);
}
l9_888++;
LightingComponents l9_917=l9_886;
LightProperties l9_918=l9_905;
SurfaceProperties l9_919=l9_883;
float3 l9_920=l9_887;
SurfaceProperties l9_921=l9_919;
float3 l9_922=l9_918.direction;
float3 l9_923=float3(fast::clamp(dot(l9_921.normal,l9_922),0.0,1.0));
l9_917.directDiffuse+=((l9_923*l9_918.color)*l9_918.attenuation);
SurfaceProperties l9_924=l9_919;
float3 l9_925=l9_918.direction;
float3 l9_926=l9_920;
l9_917.directSpecular+=((calculateDirectSpecular(l9_924,l9_925,l9_926)*l9_918.color)*l9_918.attenuation);
LightingComponents l9_927=l9_917;
l9_886=l9_927;
l9_906++;
continue;
}
else
{
break;
}
}
}
bool l9_928=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_928)
{
float4 l9_929=gl_FragCoord;
float2 l9_930=l9_929.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_931=l9_930;
float2 l9_932=l9_931;
int l9_933=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_934=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_934=0;
}
else
{
l9_934=in.varStereoViewID;
}
int l9_935=l9_934;
l9_933=1-l9_935;
}
else
{
int l9_936=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_936=0;
}
else
{
l9_936=in.varStereoViewID;
}
int l9_937=l9_936;
l9_933=l9_937;
}
int l9_938=l9_933;
float2 l9_939=l9_932;
int l9_940=l9_938;
float2 l9_941=l9_939;
int l9_942=l9_940;
float l9_943=0.0;
float4 l9_944=float4(0.0);
float2 l9_945=l9_941;
int l9_946=sc_RayTracedShadowTextureLayout_tmp;
int l9_947=l9_942;
float l9_948=l9_943;
float2 l9_949=l9_945;
int l9_950=l9_946;
int l9_951=l9_947;
float3 l9_952=float3(0.0);
if (l9_950==0)
{
l9_952=float3(l9_949,0.0);
}
else
{
if (l9_950==1)
{
l9_952=float3(l9_949.x,(l9_949.y*0.5)+(0.5-(float(l9_951)*0.5)),0.0);
}
else
{
l9_952=float3(l9_949,float(l9_951));
}
}
float3 l9_953=l9_952;
float3 l9_954=l9_953;
float2 l9_955=l9_954.xy;
float l9_956=l9_948;
float4 l9_957=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_955,bias(l9_956));
float4 l9_958=l9_957;
l9_944=l9_958;
float4 l9_959=l9_944;
float4 l9_960=l9_959;
float4 l9_961=l9_960;
float l9_962=l9_961.x;
float3 l9_963=float3(l9_962);
float3 l9_964=l9_963;
l9_886.directDiffuse*=(float3(1.0)-l9_964);
l9_886.directSpecular*=(float3(1.0)-l9_964);
}
SurfaceProperties l9_965=l9_883;
float3 l9_966=l9_965.normal;
float3 l9_967=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_968=l9_966;
float3 l9_969=l9_968;
float l9_970=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_971=float2(0.0);
float l9_972=l9_969.x;
float l9_973=-l9_969.z;
float l9_974=(l9_972<0.0) ? (-1.0) : 1.0;
float l9_975=l9_974*acos(fast::clamp(l9_973/length(float2(l9_972,l9_973)),-1.0,1.0));
l9_971.x=l9_975-1.5707964;
l9_971.y=acos(l9_969.y);
l9_971/=float2(6.2831855,3.1415927);
l9_971.y=1.0-l9_971.y;
l9_971.x+=(l9_970/360.0);
l9_971.x=fract((l9_971.x+floor(l9_971.x))+1.0);
float2 l9_976=l9_971;
float2 l9_977=l9_976;
float4 l9_978=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_979=l9_977;
float2 l9_980=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_981=5.0;
l9_977=calcSeamlessPanoramicUvsForSampling(l9_979,l9_980,l9_981);
}
float2 l9_982=l9_977;
float l9_983=13.0;
int l9_984=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_985=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_985=0;
}
else
{
l9_985=in.varStereoViewID;
}
int l9_986=l9_985;
l9_984=1-l9_986;
}
else
{
int l9_987=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_987=0;
}
else
{
l9_987=in.varStereoViewID;
}
int l9_988=l9_987;
l9_984=l9_988;
}
int l9_989=l9_984;
float2 l9_990=l9_982;
int l9_991=l9_989;
float l9_992=l9_983;
float4 l9_993=float4(0.0);
float2 l9_994=l9_990;
int l9_995=sc_EnvmapSpecularLayout_tmp;
int l9_996=l9_991;
float l9_997=l9_992;
float2 l9_998=l9_994;
int l9_999=l9_995;
int l9_1000=l9_996;
float3 l9_1001=float3(0.0);
if (l9_999==0)
{
l9_1001=float3(l9_998,0.0);
}
else
{
if (l9_999==1)
{
l9_1001=float3(l9_998.x,(l9_998.y*0.5)+(0.5-(float(l9_1000)*0.5)),0.0);
}
else
{
l9_1001=float3(l9_998,float(l9_1000));
}
}
float3 l9_1002=l9_1001;
float3 l9_1003=l9_1002;
float2 l9_1004=l9_1003.xy;
float l9_1005=l9_997;
float4 l9_1006=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1004,bias(l9_1005));
float4 l9_1007=l9_1006;
l9_993=l9_1007;
float4 l9_1008=l9_993;
float4 l9_1009=l9_1008;
l9_978=l9_1009;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_1010=l9_977;
float2 l9_1011=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_1012=0.0;
l9_977=calcSeamlessPanoramicUvsForSampling(l9_1010,l9_1011,l9_1012);
float2 l9_1013=l9_977;
float l9_1014=-13.0;
int l9_1015=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_1016=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1016=0;
}
else
{
l9_1016=in.varStereoViewID;
}
int l9_1017=l9_1016;
l9_1015=1-l9_1017;
}
else
{
int l9_1018=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1018=0;
}
else
{
l9_1018=in.varStereoViewID;
}
int l9_1019=l9_1018;
l9_1015=l9_1019;
}
int l9_1020=l9_1015;
float2 l9_1021=l9_1013;
int l9_1022=l9_1020;
float l9_1023=l9_1014;
float4 l9_1024=float4(0.0);
float2 l9_1025=l9_1021;
int l9_1026=sc_EnvmapDiffuseLayout_tmp;
int l9_1027=l9_1022;
float l9_1028=l9_1023;
float2 l9_1029=l9_1025;
int l9_1030=l9_1026;
int l9_1031=l9_1027;
float3 l9_1032=float3(0.0);
if (l9_1030==0)
{
l9_1032=float3(l9_1029,0.0);
}
else
{
if (l9_1030==1)
{
l9_1032=float3(l9_1029.x,(l9_1029.y*0.5)+(0.5-(float(l9_1031)*0.5)),0.0);
}
else
{
l9_1032=float3(l9_1029,float(l9_1031));
}
}
float3 l9_1033=l9_1032;
float3 l9_1034=l9_1033;
float2 l9_1035=l9_1034.xy;
float l9_1036=l9_1028;
float4 l9_1037=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_1035,bias(l9_1036));
float4 l9_1038=l9_1037;
l9_1024=l9_1038;
float4 l9_1039=l9_1024;
float4 l9_1040=l9_1039;
l9_978=l9_1040;
}
else
{
float2 l9_1041=l9_977;
float l9_1042=13.0;
int l9_1043=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1044=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1044=0;
}
else
{
l9_1044=in.varStereoViewID;
}
int l9_1045=l9_1044;
l9_1043=1-l9_1045;
}
else
{
int l9_1046=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1046=0;
}
else
{
l9_1046=in.varStereoViewID;
}
int l9_1047=l9_1046;
l9_1043=l9_1047;
}
int l9_1048=l9_1043;
float2 l9_1049=l9_1041;
int l9_1050=l9_1048;
float l9_1051=l9_1042;
float4 l9_1052=float4(0.0);
float2 l9_1053=l9_1049;
int l9_1054=sc_EnvmapSpecularLayout_tmp;
int l9_1055=l9_1050;
float l9_1056=l9_1051;
float2 l9_1057=l9_1053;
int l9_1058=l9_1054;
int l9_1059=l9_1055;
float3 l9_1060=float3(0.0);
if (l9_1058==0)
{
l9_1060=float3(l9_1057,0.0);
}
else
{
if (l9_1058==1)
{
l9_1060=float3(l9_1057.x,(l9_1057.y*0.5)+(0.5-(float(l9_1059)*0.5)),0.0);
}
else
{
l9_1060=float3(l9_1057,float(l9_1059));
}
}
float3 l9_1061=l9_1060;
float3 l9_1062=l9_1061;
float2 l9_1063=l9_1062.xy;
float l9_1064=l9_1056;
float4 l9_1065=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1063,bias(l9_1064));
float4 l9_1066=l9_1065;
l9_1052=l9_1066;
float4 l9_1067=l9_1052;
float4 l9_1068=l9_1067;
l9_978=l9_1068;
}
}
float4 l9_1069=l9_978;
float3 l9_1070=l9_1069.xyz*(1.0/l9_1069.w);
float3 l9_1071=l9_1070*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_967=l9_1071;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_1072=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_1073=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_1074=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_1075=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_1076=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_1077=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_1078=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_1079=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_1080=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_1081=-l9_966;
float l9_1082=0.0;
l9_1082=l9_1081.x;
float l9_1083=l9_1081.y;
float l9_1084=l9_1081.z;
float l9_1085=l9_1082*l9_1082;
float l9_1086=l9_1083*l9_1083;
float l9_1087=l9_1084*l9_1084;
float l9_1088=l9_1082*l9_1083;
float l9_1089=l9_1083*l9_1084;
float l9_1090=l9_1082*l9_1084;
float3 l9_1091=((((((l9_1080*0.42904299)*(l9_1085-l9_1086))+((l9_1078*0.74312502)*l9_1087))+(l9_1072*0.88622701))-(l9_1078*0.24770799))+((((l9_1076*l9_1088)+(l9_1079*l9_1090))+(l9_1077*l9_1089))*0.85808599))+((((l9_1075*l9_1082)+(l9_1073*l9_1083))+(l9_1074*l9_1084))*1.0233279);
l9_967=l9_1091*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_1092=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_1092)
{
float4 l9_1093=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_967=mix(l9_967,l9_1093.xyz,float3(l9_1093.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_967+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_967.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_967+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_967.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_967+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_967.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_1094=l9_966;
float3 l9_1095=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_1096;
float l9_1097;
int l9_1098=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1098<sc_LightEstimationSGCount_tmp)
{
l9_1096.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1098].color;
l9_1096.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1098].sharpness;
l9_1096.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1098].axis;
float3 l9_1099=l9_1094;
float l9_1100=dot(l9_1096.axis,l9_1099);
float l9_1101=l9_1096.sharpness;
float l9_1102=0.36000001;
float l9_1103=1.0/(4.0*l9_1102);
float l9_1104=exp(-l9_1101);
float l9_1105=l9_1104*l9_1104;
float l9_1106=1.0/l9_1101;
float l9_1107=(1.0+(2.0*l9_1105))-l9_1106;
float l9_1108=((l9_1104-l9_1105)*l9_1106)-l9_1105;
float l9_1109=sqrt(1.0-l9_1107);
float l9_1110=l9_1102*l9_1100;
float l9_1111=l9_1103*l9_1109;
float l9_1112=l9_1110+l9_1111;
float l9_1113=fast::clamp(l9_1100,0.0,1.0);
if (step(abs(l9_1110),l9_1111)>0.5)
{
l9_1097=(l9_1112*l9_1112)/l9_1109;
}
else
{
l9_1097=l9_1113;
}
l9_1113=l9_1097;
float l9_1114=(l9_1107*l9_1113)+l9_1108;
sc_SphericalGaussianLight_t l9_1115=l9_1096;
float3 l9_1116=(l9_1115.color/float3(l9_1115.sharpness))*6.2831855;
float3 l9_1117=(l9_1116*l9_1114)/float3(3.1415927);
l9_1095+=l9_1117;
l9_1098++;
continue;
}
else
{
break;
}
}
float3 l9_1118=l9_1095;
l9_967+=l9_1118;
}
float3 l9_1119=l9_967;
float3 l9_1120=l9_1119;
l9_886.indirectDiffuse=l9_1120;
SurfaceProperties l9_1121=l9_883;
float3 l9_1122=l9_887;
float3 l9_1123=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_1124=l9_1121;
float3 l9_1125=l9_1122;
float3 l9_1126=l9_1124.normal;
float3 l9_1127=reflect(-l9_1125,l9_1126);
float3 l9_1128=l9_1126;
float3 l9_1129=l9_1127;
float l9_1130=l9_1124.roughness;
l9_1127=getSpecularDominantDir(l9_1128,l9_1129,l9_1130);
float l9_1131=l9_1124.roughness;
float l9_1132=fast::clamp(pow(l9_1131,0.66666669),0.0,1.0)*5.0;
float l9_1133=l9_1132;
float l9_1134=l9_1133;
float3 l9_1135=l9_1127;
float l9_1136=l9_1134;
float3 l9_1137=l9_1135;
float l9_1138=l9_1136;
float4 l9_1139=float4(0.0);
float3 l9_1140=l9_1137;
float l9_1141=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_1142=float2(0.0);
float l9_1143=l9_1140.x;
float l9_1144=-l9_1140.z;
float l9_1145=(l9_1143<0.0) ? (-1.0) : 1.0;
float l9_1146=l9_1145*acos(fast::clamp(l9_1144/length(float2(l9_1143,l9_1144)),-1.0,1.0));
l9_1142.x=l9_1146-1.5707964;
l9_1142.y=acos(l9_1140.y);
l9_1142/=float2(6.2831855,3.1415927);
l9_1142.y=1.0-l9_1142.y;
l9_1142.x+=(l9_1141/360.0);
l9_1142.x=fract((l9_1142.x+floor(l9_1142.x))+1.0);
float2 l9_1147=l9_1142;
float2 l9_1148=l9_1147;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_1149=floor(l9_1138);
float l9_1150=ceil(l9_1138);
float l9_1151=l9_1138-l9_1149;
float2 l9_1152=l9_1148;
float2 l9_1153=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1154=l9_1149;
float2 l9_1155=calcSeamlessPanoramicUvsForSampling(l9_1152,l9_1153,l9_1154);
float2 l9_1156=l9_1155;
float l9_1157=l9_1149;
float2 l9_1158=l9_1156;
float l9_1159=l9_1157;
int l9_1160=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1161=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1161=0;
}
else
{
l9_1161=in.varStereoViewID;
}
int l9_1162=l9_1161;
l9_1160=1-l9_1162;
}
else
{
int l9_1163=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1163=0;
}
else
{
l9_1163=in.varStereoViewID;
}
int l9_1164=l9_1163;
l9_1160=l9_1164;
}
int l9_1165=l9_1160;
float2 l9_1166=l9_1158;
int l9_1167=l9_1165;
float l9_1168=l9_1159;
float4 l9_1169=float4(0.0);
float2 l9_1170=l9_1166;
int l9_1171=sc_EnvmapSpecularLayout_tmp;
int l9_1172=l9_1167;
float l9_1173=l9_1168;
float2 l9_1174=l9_1170;
int l9_1175=l9_1171;
int l9_1176=l9_1172;
float3 l9_1177=float3(0.0);
if (l9_1175==0)
{
l9_1177=float3(l9_1174,0.0);
}
else
{
if (l9_1175==1)
{
l9_1177=float3(l9_1174.x,(l9_1174.y*0.5)+(0.5-(float(l9_1176)*0.5)),0.0);
}
else
{
l9_1177=float3(l9_1174,float(l9_1176));
}
}
float3 l9_1178=l9_1177;
float3 l9_1179=l9_1178;
float2 l9_1180=l9_1179.xy;
float l9_1181=l9_1173;
float4 l9_1182=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1180,level(l9_1181));
float4 l9_1183=l9_1182;
l9_1169=l9_1183;
float4 l9_1184=l9_1169;
float4 l9_1185=l9_1184;
float4 l9_1186=l9_1185;
float4 l9_1187=l9_1186;
float2 l9_1188=l9_1148;
float2 l9_1189=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1190=l9_1150;
float2 l9_1191=calcSeamlessPanoramicUvsForSampling(l9_1188,l9_1189,l9_1190);
float2 l9_1192=l9_1191;
float l9_1193=l9_1150;
float2 l9_1194=l9_1192;
float l9_1195=l9_1193;
int l9_1196=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1197=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1197=0;
}
else
{
l9_1197=in.varStereoViewID;
}
int l9_1198=l9_1197;
l9_1196=1-l9_1198;
}
else
{
int l9_1199=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1199=0;
}
else
{
l9_1199=in.varStereoViewID;
}
int l9_1200=l9_1199;
l9_1196=l9_1200;
}
int l9_1201=l9_1196;
float2 l9_1202=l9_1194;
int l9_1203=l9_1201;
float l9_1204=l9_1195;
float4 l9_1205=float4(0.0);
float2 l9_1206=l9_1202;
int l9_1207=sc_EnvmapSpecularLayout_tmp;
int l9_1208=l9_1203;
float l9_1209=l9_1204;
float2 l9_1210=l9_1206;
int l9_1211=l9_1207;
int l9_1212=l9_1208;
float3 l9_1213=float3(0.0);
if (l9_1211==0)
{
l9_1213=float3(l9_1210,0.0);
}
else
{
if (l9_1211==1)
{
l9_1213=float3(l9_1210.x,(l9_1210.y*0.5)+(0.5-(float(l9_1212)*0.5)),0.0);
}
else
{
l9_1213=float3(l9_1210,float(l9_1212));
}
}
float3 l9_1214=l9_1213;
float3 l9_1215=l9_1214;
float2 l9_1216=l9_1215.xy;
float l9_1217=l9_1209;
float4 l9_1218=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1216,level(l9_1217));
float4 l9_1219=l9_1218;
l9_1205=l9_1219;
float4 l9_1220=l9_1205;
float4 l9_1221=l9_1220;
float4 l9_1222=l9_1221;
float4 l9_1223=l9_1222;
l9_1139=mix(l9_1187,l9_1223,float4(l9_1151));
}
else
{
float2 l9_1224=l9_1148;
float l9_1225=l9_1138;
float2 l9_1226=l9_1224;
float l9_1227=l9_1225;
int l9_1228=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1229=0;
}
else
{
l9_1229=in.varStereoViewID;
}
int l9_1230=l9_1229;
l9_1228=1-l9_1230;
}
else
{
int l9_1231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1231=0;
}
else
{
l9_1231=in.varStereoViewID;
}
int l9_1232=l9_1231;
l9_1228=l9_1232;
}
int l9_1233=l9_1228;
float2 l9_1234=l9_1226;
int l9_1235=l9_1233;
float l9_1236=l9_1227;
float4 l9_1237=float4(0.0);
float2 l9_1238=l9_1234;
int l9_1239=sc_EnvmapSpecularLayout_tmp;
int l9_1240=l9_1235;
float l9_1241=l9_1236;
float2 l9_1242=l9_1238;
int l9_1243=l9_1239;
int l9_1244=l9_1240;
float3 l9_1245=float3(0.0);
if (l9_1243==0)
{
l9_1245=float3(l9_1242,0.0);
}
else
{
if (l9_1243==1)
{
l9_1245=float3(l9_1242.x,(l9_1242.y*0.5)+(0.5-(float(l9_1244)*0.5)),0.0);
}
else
{
l9_1245=float3(l9_1242,float(l9_1244));
}
}
float3 l9_1246=l9_1245;
float3 l9_1247=l9_1246;
float2 l9_1248=l9_1247.xy;
float l9_1249=l9_1241;
float4 l9_1250=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1248,level(l9_1249));
float4 l9_1251=l9_1250;
l9_1237=l9_1251;
float4 l9_1252=l9_1237;
float4 l9_1253=l9_1252;
float4 l9_1254=l9_1253;
l9_1139=l9_1254;
}
float4 l9_1255=l9_1139;
float3 l9_1256=l9_1255.xyz*(1.0/l9_1255.w);
float3 l9_1257=l9_1256;
float3 l9_1258=l9_1257*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_1258+=float3(1e-06);
float3 l9_1259=l9_1258;
float3 l9_1260=l9_1259;
bool l9_1261=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_1261)
{
float4 l9_1262=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_1260=mix(l9_1260,l9_1262.xyz,float3(l9_1262.w));
}
SurfaceProperties l9_1263=l9_1124;
float l9_1264=abs(dot(l9_1126,l9_1125));
float3 l9_1265=l9_1260*envBRDFApprox(l9_1263,l9_1264);
l9_1123+=l9_1265;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_1266=l9_1121;
float3 l9_1267=l9_1122;
float l9_1268=fast::clamp(l9_1266.roughness*l9_1266.roughness,0.0099999998,1.0);
float3 l9_1269=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_1266.specColor;
sc_SphericalGaussianLight_t l9_1270;
sc_SphericalGaussianLight_t l9_1271;
sc_SphericalGaussianLight_t l9_1272;
int l9_1273=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1273<sc_LightEstimationSGCount_tmp)
{
l9_1270.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1273].color;
l9_1270.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1273].sharpness;
l9_1270.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1273].axis;
float3 l9_1274=l9_1266.normal;
float l9_1275=l9_1268;
float3 l9_1276=l9_1267;
float3 l9_1277=l9_1266.specColor;
float3 l9_1278=l9_1274;
float l9_1279=l9_1275;
l9_1271.axis=l9_1278;
float l9_1280=l9_1279*l9_1279;
l9_1271.sharpness=2.0/l9_1280;
l9_1271.color=float3(1.0/(3.1415927*l9_1280));
sc_SphericalGaussianLight_t l9_1281=l9_1271;
sc_SphericalGaussianLight_t l9_1282=l9_1281;
sc_SphericalGaussianLight_t l9_1283=l9_1282;
float3 l9_1284=l9_1276;
l9_1272.axis=reflect(-l9_1284,l9_1283.axis);
l9_1272.color=l9_1283.color;
l9_1272.sharpness=l9_1283.sharpness;
l9_1272.sharpness/=(4.0*fast::max(dot(l9_1283.axis,l9_1284),9.9999997e-05));
sc_SphericalGaussianLight_t l9_1285=l9_1272;
sc_SphericalGaussianLight_t l9_1286=l9_1285;
sc_SphericalGaussianLight_t l9_1287=l9_1286;
sc_SphericalGaussianLight_t l9_1288=l9_1270;
float l9_1289=length((l9_1287.axis*l9_1287.sharpness)+(l9_1288.axis*l9_1288.sharpness));
float3 l9_1290=(l9_1287.color*exp((l9_1289-l9_1287.sharpness)-l9_1288.sharpness))*l9_1288.color;
float l9_1291=1.0-exp((-2.0)*l9_1289);
float3 l9_1292=((l9_1290*6.2831855)*l9_1291)/float3(l9_1289);
float3 l9_1293=l9_1292;
float3 l9_1294=l9_1286.axis;
float l9_1295=l9_1275*l9_1275;
float l9_1296=fast::clamp(dot(l9_1274,l9_1294),0.0,1.0);
float l9_1297=fast::clamp(dot(l9_1274,l9_1276),0.0,1.0);
float3 l9_1298=normalize(l9_1286.axis+l9_1276);
float l9_1299=l9_1295;
float l9_1300=l9_1296;
float l9_1301=1.0/(l9_1300+sqrt(l9_1299+(((1.0-l9_1299)*l9_1300)*l9_1300)));
float l9_1302=l9_1295;
float l9_1303=l9_1297;
float l9_1304=1.0/(l9_1303+sqrt(l9_1302+(((1.0-l9_1302)*l9_1303)*l9_1303)));
l9_1293*=(l9_1301*l9_1304);
float l9_1305=pow(1.0-fast::clamp(dot(l9_1294,l9_1298),0.0,1.0),5.0);
l9_1293*=(l9_1277+((float3(1.0)-l9_1277)*l9_1305));
l9_1293*=l9_1296;
float3 l9_1306=l9_1293;
l9_1269+=l9_1306;
l9_1273++;
continue;
}
else
{
break;
}
}
float3 l9_1307=l9_1269;
l9_1123+=l9_1307;
}
float3 l9_1308=l9_1123;
l9_886.indirectSpecular=l9_1308;
LightingComponents l9_1309=l9_886;
LightingComponents l9_1310=l9_1309;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1310.directDiffuse=float3(0.0);
l9_1310.indirectDiffuse=float3(0.0);
float4 l9_1311=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1312=out.FragColor0;
float4 l9_1313=l9_1312;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1313.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1314=l9_1313;
l9_1311=l9_1314;
}
else
{
float4 l9_1315=gl_FragCoord;
float2 l9_1316=l9_1315.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1317=l9_1316;
float2 l9_1318=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1319=1;
int l9_1320=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1320=0;
}
else
{
l9_1320=in.varStereoViewID;
}
int l9_1321=l9_1320;
int l9_1322=l9_1321;
float3 l9_1323=float3(l9_1317,0.0);
int l9_1324=l9_1319;
int l9_1325=l9_1322;
if (l9_1324==1)
{
l9_1323.y=((2.0*l9_1323.y)+float(l9_1325))-1.0;
}
float2 l9_1326=l9_1323.xy;
l9_1318=l9_1326;
}
else
{
l9_1318=l9_1317;
}
float2 l9_1327=l9_1318;
float2 l9_1328=l9_1327;
float2 l9_1329=l9_1328;
int l9_1330=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1331=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1331=0;
}
else
{
l9_1331=in.varStereoViewID;
}
int l9_1332=l9_1331;
l9_1330=1-l9_1332;
}
else
{
int l9_1333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1333=0;
}
else
{
l9_1333=in.varStereoViewID;
}
int l9_1334=l9_1333;
l9_1330=l9_1334;
}
int l9_1335=l9_1330;
float2 l9_1336=l9_1329;
int l9_1337=l9_1335;
float2 l9_1338=l9_1336;
int l9_1339=l9_1337;
float l9_1340=0.0;
float4 l9_1341=float4(0.0);
float2 l9_1342=l9_1338;
int l9_1343=sc_ScreenTextureLayout_tmp;
int l9_1344=l9_1339;
float l9_1345=l9_1340;
float2 l9_1346=l9_1342;
int l9_1347=l9_1343;
int l9_1348=l9_1344;
float3 l9_1349=float3(0.0);
if (l9_1347==0)
{
l9_1349=float3(l9_1346,0.0);
}
else
{
if (l9_1347==1)
{
l9_1349=float3(l9_1346.x,(l9_1346.y*0.5)+(0.5-(float(l9_1348)*0.5)),0.0);
}
else
{
l9_1349=float3(l9_1346,float(l9_1348));
}
}
float3 l9_1350=l9_1349;
float3 l9_1351=l9_1350;
float2 l9_1352=l9_1351.xy;
float l9_1353=l9_1345;
float4 l9_1354=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1352,bias(l9_1353));
float4 l9_1355=l9_1354;
l9_1341=l9_1355;
float4 l9_1356=l9_1341;
float4 l9_1357=l9_1356;
float4 l9_1358=l9_1357;
l9_1311=l9_1358;
}
float4 l9_1359=l9_1311;
float4 l9_1360=l9_1359;
float3 l9_1361=l9_1360.xyz;
float3 l9_1362;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1362=float3(pow(l9_1361.x,2.2),pow(l9_1361.y,2.2),pow(l9_1361.z,2.2));
}
else
{
l9_1362=l9_1361*l9_1361;
}
float3 l9_1363=l9_1362;
float3 l9_1364=l9_1363;
l9_1310.transmitted=l9_1364*mix(float3(1.0),l9_870.albedo,float3(l9_870.opacity));
l9_870.opacity=1.0;
}
bool l9_1365=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1365=true;
}
SurfaceProperties l9_1366=l9_870;
LightingComponents l9_1367=l9_1310;
bool l9_1368=l9_1365;
float3 l9_1369=float3(0.0);
bool l9_1370=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_1370)
{
l9_1369=l9_1366.albedo*(l9_1367.directDiffuse+(l9_1367.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_1369=l9_1366.albedo*(l9_1367.directDiffuse+(l9_1367.indirectDiffuse*l9_1366.ao));
}
float3 l9_1371=l9_1367.directSpecular+(l9_1367.indirectSpecular*l9_1366.specularAo);
float3 l9_1372=l9_1366.emissive;
float3 l9_1373=l9_1367.transmitted;
if (l9_1368)
{
float l9_1374=l9_1366.opacity;
l9_1369*=srgbToLinear(l9_1374);
}
float3 l9_1375=((l9_1369+l9_1371)+l9_1372)+l9_1373;
float3 l9_1376=l9_1375;
float4 l9_1377=float4(l9_1376,l9_870.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_1378=l9_1377.xyz;
float l9_1379=1.8;
float l9_1380=1.4;
float l9_1381=0.5;
float l9_1382=1.5;
float3 l9_1383=(l9_1378*((l9_1378*l9_1379)+float3(l9_1380)))/((l9_1378*((l9_1378*l9_1379)+float3(l9_1381)))+float3(l9_1382));
l9_1377=float4(l9_1383.x,l9_1383.y,l9_1383.z,l9_1377.w);
}
float3 l9_1384=l9_1377.xyz;
float l9_1385=l9_1384.x;
float l9_1386=l9_1384.y;
float l9_1387=l9_1384.z;
float3 l9_1388=float3(linearToSrgb(l9_1385),linearToSrgb(l9_1386),linearToSrgb(l9_1387));
l9_1377=float4(l9_1388.x,l9_1388.y,l9_1388.z,l9_1377.w);
float4 l9_1389=l9_1377;
float4 l9_1390=l9_1389;
l9_1390=fast::max(l9_1390,float4(0.0));
l9_848=l9_1390;
l9_705=l9_848;
l9_710=l9_705;
}
else
{
float4 l9_1391=float4(0.0);
float4 l9_1392=float4(0.0);
float4 l9_1393=float4(0.0);
ssGlobals l9_1394=l9_707;
float4 l9_1395;
if ((int(Tweak_N248_tmp)!=0))
{
float4 l9_1396=float4(0.0);
l9_1396=gParticle.Color;
float4 l9_1397=float4(0.0);
float4 l9_1398=(*sc_set0.UserUniforms).colorMix;
l9_1397=l9_1398;
float l9_1399=0.0;
float l9_1400=1.0;
float l9_1401=0.0;
ssGlobals l9_1402=l9_1394;
float l9_1403;
if ((int(Tweak_N261_tmp)!=0))
{
float l9_1404=0.0;
float l9_1405=0.0;
float l9_1406=0.0;
float l9_1407=0.0;
float l9_1408=0.0;
float l9_1409=0.0;
ssGlobals l9_1410=l9_1402;
float l9_1411;
if (NODE_243_DROPLIST_ITEM_tmp==0)
{
float2 l9_1412=float2(0.0);
l9_1412=l9_1410.Surface_UVCoord0;
float2 l9_1413=float2(0.0);
float2 l9_1414=l9_1412;
float l9_1415=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1416=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1417=sin(radians(l9_1415));
float l9_1418=cos(radians(l9_1415));
float2 l9_1419=l9_1414-l9_1416;
l9_1419=float2(dot(float2(l9_1418,l9_1417),l9_1419),dot(float2(-l9_1417,l9_1418),l9_1419))+l9_1416;
l9_1413=l9_1419;
float l9_1420=0.0;
l9_1420=gParticle.Index1DPerCopyF;
float l9_1421=0.0;
l9_1421=gParticle.Ratio1DPerCopy;
float l9_1422=0.0;
l9_1422=(((l9_1421-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1423=float4(0.0);
float2 l9_1424=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1425=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1426=l9_1413;
float l9_1427=l9_1420;
float l9_1428=l9_1422;
float l9_1429=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1430=l9_1410;
float2 l9_1431=float2(0.0);
float l9_1432=floor(l9_1424.x);
float l9_1433=floor(l9_1424.y);
float l9_1434=1.0/l9_1432;
float l9_1435=1.0/l9_1433;
float l9_1436=fast::min(l9_1432*l9_1433,floor(l9_1425));
float l9_1437=floor(mod(((l9_1430.gTimeElapsedShifted+l9_1429)*l9_1428)+floor(l9_1427),l9_1436));
float l9_1438=floor(l9_1437/l9_1432);
float l9_1439=mod(l9_1437,l9_1432);
l9_1431=float2((l9_1434*l9_1426.x)+(l9_1439*l9_1434),((1.0-l9_1435)-(l9_1438*l9_1435))+(l9_1435*l9_1426.y));
int l9_1440=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1441=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1441=0;
}
else
{
l9_1441=in.varStereoViewID;
}
int l9_1442=l9_1441;
l9_1440=1-l9_1442;
}
else
{
int l9_1443=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1443=0;
}
else
{
l9_1443=in.varStereoViewID;
}
int l9_1444=l9_1443;
l9_1440=l9_1444;
}
int l9_1445=l9_1440;
int l9_1446=flipbookTexLayout_tmp;
int l9_1447=l9_1445;
float2 l9_1448=l9_1431;
bool l9_1449=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1450=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1451=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1452=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1453=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1454=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1455=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1456=0.0;
bool l9_1457=l9_1454&&(!l9_1452);
float l9_1458=1.0;
float l9_1459=l9_1448.x;
int l9_1460=l9_1451.x;
if (l9_1460==1)
{
l9_1459=fract(l9_1459);
}
else
{
if (l9_1460==2)
{
float l9_1461=fract(l9_1459);
float l9_1462=l9_1459-l9_1461;
float l9_1463=step(0.25,fract(l9_1462*0.5));
l9_1459=mix(l9_1461,1.0-l9_1461,fast::clamp(l9_1463,0.0,1.0));
}
}
l9_1448.x=l9_1459;
float l9_1464=l9_1448.y;
int l9_1465=l9_1451.y;
if (l9_1465==1)
{
l9_1464=fract(l9_1464);
}
else
{
if (l9_1465==2)
{
float l9_1466=fract(l9_1464);
float l9_1467=l9_1464-l9_1466;
float l9_1468=step(0.25,fract(l9_1467*0.5));
l9_1464=mix(l9_1466,1.0-l9_1466,fast::clamp(l9_1468,0.0,1.0));
}
}
l9_1448.y=l9_1464;
if (l9_1452)
{
bool l9_1469=l9_1454;
bool l9_1470;
if (l9_1469)
{
l9_1470=l9_1451.x==3;
}
else
{
l9_1470=l9_1469;
}
float l9_1471=l9_1448.x;
float l9_1472=l9_1453.x;
float l9_1473=l9_1453.z;
bool l9_1474=l9_1470;
float l9_1475=l9_1458;
float l9_1476=fast::clamp(l9_1471,l9_1472,l9_1473);
float l9_1477=step(abs(l9_1471-l9_1476),9.9999997e-06);
l9_1475*=(l9_1477+((1.0-float(l9_1474))*(1.0-l9_1477)));
l9_1471=l9_1476;
l9_1448.x=l9_1471;
l9_1458=l9_1475;
bool l9_1478=l9_1454;
bool l9_1479;
if (l9_1478)
{
l9_1479=l9_1451.y==3;
}
else
{
l9_1479=l9_1478;
}
float l9_1480=l9_1448.y;
float l9_1481=l9_1453.y;
float l9_1482=l9_1453.w;
bool l9_1483=l9_1479;
float l9_1484=l9_1458;
float l9_1485=fast::clamp(l9_1480,l9_1481,l9_1482);
float l9_1486=step(abs(l9_1480-l9_1485),9.9999997e-06);
l9_1484*=(l9_1486+((1.0-float(l9_1483))*(1.0-l9_1486)));
l9_1480=l9_1485;
l9_1448.y=l9_1480;
l9_1458=l9_1484;
}
float2 l9_1487=l9_1448;
bool l9_1488=l9_1449;
float3x3 l9_1489=l9_1450;
if (l9_1488)
{
l9_1487=float2((l9_1489*float3(l9_1487,1.0)).xy);
}
float2 l9_1490=l9_1487;
float2 l9_1491=l9_1490;
float2 l9_1492=l9_1491;
l9_1448=l9_1492;
float l9_1493=l9_1448.x;
int l9_1494=l9_1451.x;
bool l9_1495=l9_1457;
float l9_1496=l9_1458;
if ((l9_1494==0)||(l9_1494==3))
{
float l9_1497=l9_1493;
float l9_1498=0.0;
float l9_1499=1.0;
bool l9_1500=l9_1495;
float l9_1501=l9_1496;
float l9_1502=fast::clamp(l9_1497,l9_1498,l9_1499);
float l9_1503=step(abs(l9_1497-l9_1502),9.9999997e-06);
l9_1501*=(l9_1503+((1.0-float(l9_1500))*(1.0-l9_1503)));
l9_1497=l9_1502;
l9_1493=l9_1497;
l9_1496=l9_1501;
}
l9_1448.x=l9_1493;
l9_1458=l9_1496;
float l9_1504=l9_1448.y;
int l9_1505=l9_1451.y;
bool l9_1506=l9_1457;
float l9_1507=l9_1458;
if ((l9_1505==0)||(l9_1505==3))
{
float l9_1508=l9_1504;
float l9_1509=0.0;
float l9_1510=1.0;
bool l9_1511=l9_1506;
float l9_1512=l9_1507;
float l9_1513=fast::clamp(l9_1508,l9_1509,l9_1510);
float l9_1514=step(abs(l9_1508-l9_1513),9.9999997e-06);
l9_1512*=(l9_1514+((1.0-float(l9_1511))*(1.0-l9_1514)));
l9_1508=l9_1513;
l9_1504=l9_1508;
l9_1507=l9_1512;
}
l9_1448.y=l9_1504;
l9_1458=l9_1507;
float2 l9_1515=l9_1448;
int l9_1516=l9_1446;
int l9_1517=l9_1447;
float l9_1518=l9_1456;
float2 l9_1519=l9_1515;
int l9_1520=l9_1516;
int l9_1521=l9_1517;
float3 l9_1522=float3(0.0);
if (l9_1520==0)
{
l9_1522=float3(l9_1519,0.0);
}
else
{
if (l9_1520==1)
{
l9_1522=float3(l9_1519.x,(l9_1519.y*0.5)+(0.5-(float(l9_1521)*0.5)),0.0);
}
else
{
l9_1522=float3(l9_1519,float(l9_1521));
}
}
float3 l9_1523=l9_1522;
float3 l9_1524=l9_1523;
float2 l9_1525=l9_1524.xy;
float l9_1526=l9_1518;
float4 l9_1527=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1525,bias(l9_1526));
float4 l9_1528=l9_1527;
float4 l9_1529=l9_1528;
if (l9_1454)
{
l9_1529=mix(l9_1455,l9_1529,float4(l9_1458));
}
float4 l9_1530=l9_1529;
float4 l9_1531=l9_1530;
l9_1423=l9_1531;
float l9_1532=0.0;
float4 l9_1533=l9_1423;
float l9_1534=l9_1533.x;
l9_1532=l9_1534;
l9_1405=l9_1532;
l9_1411=l9_1405;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==1)
{
float2 l9_1535=float2(0.0);
l9_1535=l9_1410.Surface_UVCoord0;
float2 l9_1536=float2(0.0);
float2 l9_1537=l9_1535;
float l9_1538=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1539=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1540=sin(radians(l9_1538));
float l9_1541=cos(radians(l9_1538));
float2 l9_1542=l9_1537-l9_1539;
l9_1542=float2(dot(float2(l9_1541,l9_1540),l9_1542),dot(float2(-l9_1540,l9_1541),l9_1542))+l9_1539;
l9_1536=l9_1542;
float l9_1543=0.0;
l9_1543=gParticle.Index1DPerCopyF;
float l9_1544=0.0;
l9_1544=gParticle.Ratio1DPerCopy;
float l9_1545=0.0;
l9_1545=(((l9_1544-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1546=float4(0.0);
float2 l9_1547=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1548=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1549=l9_1536;
float l9_1550=l9_1543;
float l9_1551=l9_1545;
float l9_1552=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1553=l9_1410;
float2 l9_1554=float2(0.0);
float l9_1555=floor(l9_1547.x);
float l9_1556=floor(l9_1547.y);
float l9_1557=1.0/l9_1555;
float l9_1558=1.0/l9_1556;
float l9_1559=fast::min(l9_1555*l9_1556,floor(l9_1548));
float l9_1560=floor(mod(((l9_1553.gTimeElapsedShifted+l9_1552)*l9_1551)+floor(l9_1550),l9_1559));
float l9_1561=floor(l9_1560/l9_1555);
float l9_1562=mod(l9_1560,l9_1555);
l9_1554=float2((l9_1557*l9_1549.x)+(l9_1562*l9_1557),((1.0-l9_1558)-(l9_1561*l9_1558))+(l9_1558*l9_1549.y));
int l9_1563=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1564=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1564=0;
}
else
{
l9_1564=in.varStereoViewID;
}
int l9_1565=l9_1564;
l9_1563=1-l9_1565;
}
else
{
int l9_1566=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1566=0;
}
else
{
l9_1566=in.varStereoViewID;
}
int l9_1567=l9_1566;
l9_1563=l9_1567;
}
int l9_1568=l9_1563;
int l9_1569=flipbookTexLayout_tmp;
int l9_1570=l9_1568;
float2 l9_1571=l9_1554;
bool l9_1572=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1573=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1574=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1575=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1576=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1577=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1578=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1579=0.0;
bool l9_1580=l9_1577&&(!l9_1575);
float l9_1581=1.0;
float l9_1582=l9_1571.x;
int l9_1583=l9_1574.x;
if (l9_1583==1)
{
l9_1582=fract(l9_1582);
}
else
{
if (l9_1583==2)
{
float l9_1584=fract(l9_1582);
float l9_1585=l9_1582-l9_1584;
float l9_1586=step(0.25,fract(l9_1585*0.5));
l9_1582=mix(l9_1584,1.0-l9_1584,fast::clamp(l9_1586,0.0,1.0));
}
}
l9_1571.x=l9_1582;
float l9_1587=l9_1571.y;
int l9_1588=l9_1574.y;
if (l9_1588==1)
{
l9_1587=fract(l9_1587);
}
else
{
if (l9_1588==2)
{
float l9_1589=fract(l9_1587);
float l9_1590=l9_1587-l9_1589;
float l9_1591=step(0.25,fract(l9_1590*0.5));
l9_1587=mix(l9_1589,1.0-l9_1589,fast::clamp(l9_1591,0.0,1.0));
}
}
l9_1571.y=l9_1587;
if (l9_1575)
{
bool l9_1592=l9_1577;
bool l9_1593;
if (l9_1592)
{
l9_1593=l9_1574.x==3;
}
else
{
l9_1593=l9_1592;
}
float l9_1594=l9_1571.x;
float l9_1595=l9_1576.x;
float l9_1596=l9_1576.z;
bool l9_1597=l9_1593;
float l9_1598=l9_1581;
float l9_1599=fast::clamp(l9_1594,l9_1595,l9_1596);
float l9_1600=step(abs(l9_1594-l9_1599),9.9999997e-06);
l9_1598*=(l9_1600+((1.0-float(l9_1597))*(1.0-l9_1600)));
l9_1594=l9_1599;
l9_1571.x=l9_1594;
l9_1581=l9_1598;
bool l9_1601=l9_1577;
bool l9_1602;
if (l9_1601)
{
l9_1602=l9_1574.y==3;
}
else
{
l9_1602=l9_1601;
}
float l9_1603=l9_1571.y;
float l9_1604=l9_1576.y;
float l9_1605=l9_1576.w;
bool l9_1606=l9_1602;
float l9_1607=l9_1581;
float l9_1608=fast::clamp(l9_1603,l9_1604,l9_1605);
float l9_1609=step(abs(l9_1603-l9_1608),9.9999997e-06);
l9_1607*=(l9_1609+((1.0-float(l9_1606))*(1.0-l9_1609)));
l9_1603=l9_1608;
l9_1571.y=l9_1603;
l9_1581=l9_1607;
}
float2 l9_1610=l9_1571;
bool l9_1611=l9_1572;
float3x3 l9_1612=l9_1573;
if (l9_1611)
{
l9_1610=float2((l9_1612*float3(l9_1610,1.0)).xy);
}
float2 l9_1613=l9_1610;
float2 l9_1614=l9_1613;
float2 l9_1615=l9_1614;
l9_1571=l9_1615;
float l9_1616=l9_1571.x;
int l9_1617=l9_1574.x;
bool l9_1618=l9_1580;
float l9_1619=l9_1581;
if ((l9_1617==0)||(l9_1617==3))
{
float l9_1620=l9_1616;
float l9_1621=0.0;
float l9_1622=1.0;
bool l9_1623=l9_1618;
float l9_1624=l9_1619;
float l9_1625=fast::clamp(l9_1620,l9_1621,l9_1622);
float l9_1626=step(abs(l9_1620-l9_1625),9.9999997e-06);
l9_1624*=(l9_1626+((1.0-float(l9_1623))*(1.0-l9_1626)));
l9_1620=l9_1625;
l9_1616=l9_1620;
l9_1619=l9_1624;
}
l9_1571.x=l9_1616;
l9_1581=l9_1619;
float l9_1627=l9_1571.y;
int l9_1628=l9_1574.y;
bool l9_1629=l9_1580;
float l9_1630=l9_1581;
if ((l9_1628==0)||(l9_1628==3))
{
float l9_1631=l9_1627;
float l9_1632=0.0;
float l9_1633=1.0;
bool l9_1634=l9_1629;
float l9_1635=l9_1630;
float l9_1636=fast::clamp(l9_1631,l9_1632,l9_1633);
float l9_1637=step(abs(l9_1631-l9_1636),9.9999997e-06);
l9_1635*=(l9_1637+((1.0-float(l9_1634))*(1.0-l9_1637)));
l9_1631=l9_1636;
l9_1627=l9_1631;
l9_1630=l9_1635;
}
l9_1571.y=l9_1627;
l9_1581=l9_1630;
float2 l9_1638=l9_1571;
int l9_1639=l9_1569;
int l9_1640=l9_1570;
float l9_1641=l9_1579;
float2 l9_1642=l9_1638;
int l9_1643=l9_1639;
int l9_1644=l9_1640;
float3 l9_1645=float3(0.0);
if (l9_1643==0)
{
l9_1645=float3(l9_1642,0.0);
}
else
{
if (l9_1643==1)
{
l9_1645=float3(l9_1642.x,(l9_1642.y*0.5)+(0.5-(float(l9_1644)*0.5)),0.0);
}
else
{
l9_1645=float3(l9_1642,float(l9_1644));
}
}
float3 l9_1646=l9_1645;
float3 l9_1647=l9_1646;
float2 l9_1648=l9_1647.xy;
float l9_1649=l9_1641;
float4 l9_1650=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1648,bias(l9_1649));
float4 l9_1651=l9_1650;
float4 l9_1652=l9_1651;
if (l9_1577)
{
l9_1652=mix(l9_1578,l9_1652,float4(l9_1581));
}
float4 l9_1653=l9_1652;
float4 l9_1654=l9_1653;
l9_1546=l9_1654;
float l9_1655=0.0;
float4 l9_1656=l9_1546;
float l9_1657=l9_1656.y;
l9_1655=l9_1657;
l9_1406=l9_1655;
l9_1411=l9_1406;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==2)
{
float2 l9_1658=float2(0.0);
l9_1658=l9_1410.Surface_UVCoord0;
float2 l9_1659=float2(0.0);
float2 l9_1660=l9_1658;
float l9_1661=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1662=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1663=sin(radians(l9_1661));
float l9_1664=cos(radians(l9_1661));
float2 l9_1665=l9_1660-l9_1662;
l9_1665=float2(dot(float2(l9_1664,l9_1663),l9_1665),dot(float2(-l9_1663,l9_1664),l9_1665))+l9_1662;
l9_1659=l9_1665;
float l9_1666=0.0;
l9_1666=gParticle.Index1DPerCopyF;
float l9_1667=0.0;
l9_1667=gParticle.Ratio1DPerCopy;
float l9_1668=0.0;
l9_1668=(((l9_1667-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1669=float4(0.0);
float2 l9_1670=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1671=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1672=l9_1659;
float l9_1673=l9_1666;
float l9_1674=l9_1668;
float l9_1675=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1676=l9_1410;
float2 l9_1677=float2(0.0);
float l9_1678=floor(l9_1670.x);
float l9_1679=floor(l9_1670.y);
float l9_1680=1.0/l9_1678;
float l9_1681=1.0/l9_1679;
float l9_1682=fast::min(l9_1678*l9_1679,floor(l9_1671));
float l9_1683=floor(mod(((l9_1676.gTimeElapsedShifted+l9_1675)*l9_1674)+floor(l9_1673),l9_1682));
float l9_1684=floor(l9_1683/l9_1678);
float l9_1685=mod(l9_1683,l9_1678);
l9_1677=float2((l9_1680*l9_1672.x)+(l9_1685*l9_1680),((1.0-l9_1681)-(l9_1684*l9_1681))+(l9_1681*l9_1672.y));
int l9_1686=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1687=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1687=0;
}
else
{
l9_1687=in.varStereoViewID;
}
int l9_1688=l9_1687;
l9_1686=1-l9_1688;
}
else
{
int l9_1689=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1689=0;
}
else
{
l9_1689=in.varStereoViewID;
}
int l9_1690=l9_1689;
l9_1686=l9_1690;
}
int l9_1691=l9_1686;
int l9_1692=flipbookTexLayout_tmp;
int l9_1693=l9_1691;
float2 l9_1694=l9_1677;
bool l9_1695=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1696=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1697=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1698=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1699=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1700=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1701=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1702=0.0;
bool l9_1703=l9_1700&&(!l9_1698);
float l9_1704=1.0;
float l9_1705=l9_1694.x;
int l9_1706=l9_1697.x;
if (l9_1706==1)
{
l9_1705=fract(l9_1705);
}
else
{
if (l9_1706==2)
{
float l9_1707=fract(l9_1705);
float l9_1708=l9_1705-l9_1707;
float l9_1709=step(0.25,fract(l9_1708*0.5));
l9_1705=mix(l9_1707,1.0-l9_1707,fast::clamp(l9_1709,0.0,1.0));
}
}
l9_1694.x=l9_1705;
float l9_1710=l9_1694.y;
int l9_1711=l9_1697.y;
if (l9_1711==1)
{
l9_1710=fract(l9_1710);
}
else
{
if (l9_1711==2)
{
float l9_1712=fract(l9_1710);
float l9_1713=l9_1710-l9_1712;
float l9_1714=step(0.25,fract(l9_1713*0.5));
l9_1710=mix(l9_1712,1.0-l9_1712,fast::clamp(l9_1714,0.0,1.0));
}
}
l9_1694.y=l9_1710;
if (l9_1698)
{
bool l9_1715=l9_1700;
bool l9_1716;
if (l9_1715)
{
l9_1716=l9_1697.x==3;
}
else
{
l9_1716=l9_1715;
}
float l9_1717=l9_1694.x;
float l9_1718=l9_1699.x;
float l9_1719=l9_1699.z;
bool l9_1720=l9_1716;
float l9_1721=l9_1704;
float l9_1722=fast::clamp(l9_1717,l9_1718,l9_1719);
float l9_1723=step(abs(l9_1717-l9_1722),9.9999997e-06);
l9_1721*=(l9_1723+((1.0-float(l9_1720))*(1.0-l9_1723)));
l9_1717=l9_1722;
l9_1694.x=l9_1717;
l9_1704=l9_1721;
bool l9_1724=l9_1700;
bool l9_1725;
if (l9_1724)
{
l9_1725=l9_1697.y==3;
}
else
{
l9_1725=l9_1724;
}
float l9_1726=l9_1694.y;
float l9_1727=l9_1699.y;
float l9_1728=l9_1699.w;
bool l9_1729=l9_1725;
float l9_1730=l9_1704;
float l9_1731=fast::clamp(l9_1726,l9_1727,l9_1728);
float l9_1732=step(abs(l9_1726-l9_1731),9.9999997e-06);
l9_1730*=(l9_1732+((1.0-float(l9_1729))*(1.0-l9_1732)));
l9_1726=l9_1731;
l9_1694.y=l9_1726;
l9_1704=l9_1730;
}
float2 l9_1733=l9_1694;
bool l9_1734=l9_1695;
float3x3 l9_1735=l9_1696;
if (l9_1734)
{
l9_1733=float2((l9_1735*float3(l9_1733,1.0)).xy);
}
float2 l9_1736=l9_1733;
float2 l9_1737=l9_1736;
float2 l9_1738=l9_1737;
l9_1694=l9_1738;
float l9_1739=l9_1694.x;
int l9_1740=l9_1697.x;
bool l9_1741=l9_1703;
float l9_1742=l9_1704;
if ((l9_1740==0)||(l9_1740==3))
{
float l9_1743=l9_1739;
float l9_1744=0.0;
float l9_1745=1.0;
bool l9_1746=l9_1741;
float l9_1747=l9_1742;
float l9_1748=fast::clamp(l9_1743,l9_1744,l9_1745);
float l9_1749=step(abs(l9_1743-l9_1748),9.9999997e-06);
l9_1747*=(l9_1749+((1.0-float(l9_1746))*(1.0-l9_1749)));
l9_1743=l9_1748;
l9_1739=l9_1743;
l9_1742=l9_1747;
}
l9_1694.x=l9_1739;
l9_1704=l9_1742;
float l9_1750=l9_1694.y;
int l9_1751=l9_1697.y;
bool l9_1752=l9_1703;
float l9_1753=l9_1704;
if ((l9_1751==0)||(l9_1751==3))
{
float l9_1754=l9_1750;
float l9_1755=0.0;
float l9_1756=1.0;
bool l9_1757=l9_1752;
float l9_1758=l9_1753;
float l9_1759=fast::clamp(l9_1754,l9_1755,l9_1756);
float l9_1760=step(abs(l9_1754-l9_1759),9.9999997e-06);
l9_1758*=(l9_1760+((1.0-float(l9_1757))*(1.0-l9_1760)));
l9_1754=l9_1759;
l9_1750=l9_1754;
l9_1753=l9_1758;
}
l9_1694.y=l9_1750;
l9_1704=l9_1753;
float2 l9_1761=l9_1694;
int l9_1762=l9_1692;
int l9_1763=l9_1693;
float l9_1764=l9_1702;
float2 l9_1765=l9_1761;
int l9_1766=l9_1762;
int l9_1767=l9_1763;
float3 l9_1768=float3(0.0);
if (l9_1766==0)
{
l9_1768=float3(l9_1765,0.0);
}
else
{
if (l9_1766==1)
{
l9_1768=float3(l9_1765.x,(l9_1765.y*0.5)+(0.5-(float(l9_1767)*0.5)),0.0);
}
else
{
l9_1768=float3(l9_1765,float(l9_1767));
}
}
float3 l9_1769=l9_1768;
float3 l9_1770=l9_1769;
float2 l9_1771=l9_1770.xy;
float l9_1772=l9_1764;
float4 l9_1773=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1771,bias(l9_1772));
float4 l9_1774=l9_1773;
float4 l9_1775=l9_1774;
if (l9_1700)
{
l9_1775=mix(l9_1701,l9_1775,float4(l9_1704));
}
float4 l9_1776=l9_1775;
float4 l9_1777=l9_1776;
l9_1669=l9_1777;
float l9_1778=0.0;
float4 l9_1779=l9_1669;
float l9_1780=l9_1779.z;
l9_1778=l9_1780;
l9_1407=l9_1778;
l9_1411=l9_1407;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==3)
{
float2 l9_1781=float2(0.0);
l9_1781=l9_1410.Surface_UVCoord0;
float2 l9_1782=float2(0.0);
float2 l9_1783=l9_1781;
float l9_1784=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1785=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1786=sin(radians(l9_1784));
float l9_1787=cos(radians(l9_1784));
float2 l9_1788=l9_1783-l9_1785;
l9_1788=float2(dot(float2(l9_1787,l9_1786),l9_1788),dot(float2(-l9_1786,l9_1787),l9_1788))+l9_1785;
l9_1782=l9_1788;
float l9_1789=0.0;
l9_1789=gParticle.Index1DPerCopyF;
float l9_1790=0.0;
l9_1790=gParticle.Ratio1DPerCopy;
float l9_1791=0.0;
l9_1791=(((l9_1790-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1792=float4(0.0);
float2 l9_1793=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1794=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1795=l9_1782;
float l9_1796=l9_1789;
float l9_1797=l9_1791;
float l9_1798=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1799=l9_1410;
float2 l9_1800=float2(0.0);
float l9_1801=floor(l9_1793.x);
float l9_1802=floor(l9_1793.y);
float l9_1803=1.0/l9_1801;
float l9_1804=1.0/l9_1802;
float l9_1805=fast::min(l9_1801*l9_1802,floor(l9_1794));
float l9_1806=floor(mod(((l9_1799.gTimeElapsedShifted+l9_1798)*l9_1797)+floor(l9_1796),l9_1805));
float l9_1807=floor(l9_1806/l9_1801);
float l9_1808=mod(l9_1806,l9_1801);
l9_1800=float2((l9_1803*l9_1795.x)+(l9_1808*l9_1803),((1.0-l9_1804)-(l9_1807*l9_1804))+(l9_1804*l9_1795.y));
int l9_1809=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1810=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1810=0;
}
else
{
l9_1810=in.varStereoViewID;
}
int l9_1811=l9_1810;
l9_1809=1-l9_1811;
}
else
{
int l9_1812=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1812=0;
}
else
{
l9_1812=in.varStereoViewID;
}
int l9_1813=l9_1812;
l9_1809=l9_1813;
}
int l9_1814=l9_1809;
int l9_1815=flipbookTexLayout_tmp;
int l9_1816=l9_1814;
float2 l9_1817=l9_1800;
bool l9_1818=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1819=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1820=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1821=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1822=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1823=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1824=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1825=0.0;
bool l9_1826=l9_1823&&(!l9_1821);
float l9_1827=1.0;
float l9_1828=l9_1817.x;
int l9_1829=l9_1820.x;
if (l9_1829==1)
{
l9_1828=fract(l9_1828);
}
else
{
if (l9_1829==2)
{
float l9_1830=fract(l9_1828);
float l9_1831=l9_1828-l9_1830;
float l9_1832=step(0.25,fract(l9_1831*0.5));
l9_1828=mix(l9_1830,1.0-l9_1830,fast::clamp(l9_1832,0.0,1.0));
}
}
l9_1817.x=l9_1828;
float l9_1833=l9_1817.y;
int l9_1834=l9_1820.y;
if (l9_1834==1)
{
l9_1833=fract(l9_1833);
}
else
{
if (l9_1834==2)
{
float l9_1835=fract(l9_1833);
float l9_1836=l9_1833-l9_1835;
float l9_1837=step(0.25,fract(l9_1836*0.5));
l9_1833=mix(l9_1835,1.0-l9_1835,fast::clamp(l9_1837,0.0,1.0));
}
}
l9_1817.y=l9_1833;
if (l9_1821)
{
bool l9_1838=l9_1823;
bool l9_1839;
if (l9_1838)
{
l9_1839=l9_1820.x==3;
}
else
{
l9_1839=l9_1838;
}
float l9_1840=l9_1817.x;
float l9_1841=l9_1822.x;
float l9_1842=l9_1822.z;
bool l9_1843=l9_1839;
float l9_1844=l9_1827;
float l9_1845=fast::clamp(l9_1840,l9_1841,l9_1842);
float l9_1846=step(abs(l9_1840-l9_1845),9.9999997e-06);
l9_1844*=(l9_1846+((1.0-float(l9_1843))*(1.0-l9_1846)));
l9_1840=l9_1845;
l9_1817.x=l9_1840;
l9_1827=l9_1844;
bool l9_1847=l9_1823;
bool l9_1848;
if (l9_1847)
{
l9_1848=l9_1820.y==3;
}
else
{
l9_1848=l9_1847;
}
float l9_1849=l9_1817.y;
float l9_1850=l9_1822.y;
float l9_1851=l9_1822.w;
bool l9_1852=l9_1848;
float l9_1853=l9_1827;
float l9_1854=fast::clamp(l9_1849,l9_1850,l9_1851);
float l9_1855=step(abs(l9_1849-l9_1854),9.9999997e-06);
l9_1853*=(l9_1855+((1.0-float(l9_1852))*(1.0-l9_1855)));
l9_1849=l9_1854;
l9_1817.y=l9_1849;
l9_1827=l9_1853;
}
float2 l9_1856=l9_1817;
bool l9_1857=l9_1818;
float3x3 l9_1858=l9_1819;
if (l9_1857)
{
l9_1856=float2((l9_1858*float3(l9_1856,1.0)).xy);
}
float2 l9_1859=l9_1856;
float2 l9_1860=l9_1859;
float2 l9_1861=l9_1860;
l9_1817=l9_1861;
float l9_1862=l9_1817.x;
int l9_1863=l9_1820.x;
bool l9_1864=l9_1826;
float l9_1865=l9_1827;
if ((l9_1863==0)||(l9_1863==3))
{
float l9_1866=l9_1862;
float l9_1867=0.0;
float l9_1868=1.0;
bool l9_1869=l9_1864;
float l9_1870=l9_1865;
float l9_1871=fast::clamp(l9_1866,l9_1867,l9_1868);
float l9_1872=step(abs(l9_1866-l9_1871),9.9999997e-06);
l9_1870*=(l9_1872+((1.0-float(l9_1869))*(1.0-l9_1872)));
l9_1866=l9_1871;
l9_1862=l9_1866;
l9_1865=l9_1870;
}
l9_1817.x=l9_1862;
l9_1827=l9_1865;
float l9_1873=l9_1817.y;
int l9_1874=l9_1820.y;
bool l9_1875=l9_1826;
float l9_1876=l9_1827;
if ((l9_1874==0)||(l9_1874==3))
{
float l9_1877=l9_1873;
float l9_1878=0.0;
float l9_1879=1.0;
bool l9_1880=l9_1875;
float l9_1881=l9_1876;
float l9_1882=fast::clamp(l9_1877,l9_1878,l9_1879);
float l9_1883=step(abs(l9_1877-l9_1882),9.9999997e-06);
l9_1881*=(l9_1883+((1.0-float(l9_1880))*(1.0-l9_1883)));
l9_1877=l9_1882;
l9_1873=l9_1877;
l9_1876=l9_1881;
}
l9_1817.y=l9_1873;
l9_1827=l9_1876;
float2 l9_1884=l9_1817;
int l9_1885=l9_1815;
int l9_1886=l9_1816;
float l9_1887=l9_1825;
float2 l9_1888=l9_1884;
int l9_1889=l9_1885;
int l9_1890=l9_1886;
float3 l9_1891=float3(0.0);
if (l9_1889==0)
{
l9_1891=float3(l9_1888,0.0);
}
else
{
if (l9_1889==1)
{
l9_1891=float3(l9_1888.x,(l9_1888.y*0.5)+(0.5-(float(l9_1890)*0.5)),0.0);
}
else
{
l9_1891=float3(l9_1888,float(l9_1890));
}
}
float3 l9_1892=l9_1891;
float3 l9_1893=l9_1892;
float2 l9_1894=l9_1893.xy;
float l9_1895=l9_1887;
float4 l9_1896=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1894,bias(l9_1895));
float4 l9_1897=l9_1896;
float4 l9_1898=l9_1897;
if (l9_1823)
{
l9_1898=mix(l9_1824,l9_1898,float4(l9_1827));
}
float4 l9_1899=l9_1898;
float4 l9_1900=l9_1899;
l9_1792=l9_1900;
float l9_1901=0.0;
float4 l9_1902=l9_1792;
float l9_1903=l9_1902.w;
l9_1901=l9_1903;
l9_1408=l9_1901;
l9_1411=l9_1408;
}
else
{
float2 l9_1904=float2(0.0);
l9_1904=l9_1410.Surface_UVCoord0;
float2 l9_1905=float2(0.0);
float2 l9_1906=l9_1904;
float l9_1907=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1908=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1909=sin(radians(l9_1907));
float l9_1910=cos(radians(l9_1907));
float2 l9_1911=l9_1906-l9_1908;
l9_1911=float2(dot(float2(l9_1910,l9_1909),l9_1911),dot(float2(-l9_1909,l9_1910),l9_1911))+l9_1908;
l9_1905=l9_1911;
float l9_1912=0.0;
l9_1912=gParticle.Index1DPerCopyF;
float l9_1913=0.0;
l9_1913=gParticle.Ratio1DPerCopy;
float l9_1914=0.0;
l9_1914=(((l9_1913-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1915=float4(0.0);
float2 l9_1916=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1917=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1918=l9_1905;
float l9_1919=l9_1912;
float l9_1920=l9_1914;
float l9_1921=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1922=l9_1410;
float2 l9_1923=float2(0.0);
float l9_1924=floor(l9_1916.x);
float l9_1925=floor(l9_1916.y);
float l9_1926=1.0/l9_1924;
float l9_1927=1.0/l9_1925;
float l9_1928=fast::min(l9_1924*l9_1925,floor(l9_1917));
float l9_1929=floor(mod(((l9_1922.gTimeElapsedShifted+l9_1921)*l9_1920)+floor(l9_1919),l9_1928));
float l9_1930=floor(l9_1929/l9_1924);
float l9_1931=mod(l9_1929,l9_1924);
l9_1923=float2((l9_1926*l9_1918.x)+(l9_1931*l9_1926),((1.0-l9_1927)-(l9_1930*l9_1927))+(l9_1927*l9_1918.y));
int l9_1932=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1933=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1933=0;
}
else
{
l9_1933=in.varStereoViewID;
}
int l9_1934=l9_1933;
l9_1932=1-l9_1934;
}
else
{
int l9_1935=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1935=0;
}
else
{
l9_1935=in.varStereoViewID;
}
int l9_1936=l9_1935;
l9_1932=l9_1936;
}
int l9_1937=l9_1932;
int l9_1938=flipbookTexLayout_tmp;
int l9_1939=l9_1937;
float2 l9_1940=l9_1923;
bool l9_1941=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1942=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1943=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1944=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1945=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1946=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1947=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1948=0.0;
bool l9_1949=l9_1946&&(!l9_1944);
float l9_1950=1.0;
float l9_1951=l9_1940.x;
int l9_1952=l9_1943.x;
if (l9_1952==1)
{
l9_1951=fract(l9_1951);
}
else
{
if (l9_1952==2)
{
float l9_1953=fract(l9_1951);
float l9_1954=l9_1951-l9_1953;
float l9_1955=step(0.25,fract(l9_1954*0.5));
l9_1951=mix(l9_1953,1.0-l9_1953,fast::clamp(l9_1955,0.0,1.0));
}
}
l9_1940.x=l9_1951;
float l9_1956=l9_1940.y;
int l9_1957=l9_1943.y;
if (l9_1957==1)
{
l9_1956=fract(l9_1956);
}
else
{
if (l9_1957==2)
{
float l9_1958=fract(l9_1956);
float l9_1959=l9_1956-l9_1958;
float l9_1960=step(0.25,fract(l9_1959*0.5));
l9_1956=mix(l9_1958,1.0-l9_1958,fast::clamp(l9_1960,0.0,1.0));
}
}
l9_1940.y=l9_1956;
if (l9_1944)
{
bool l9_1961=l9_1946;
bool l9_1962;
if (l9_1961)
{
l9_1962=l9_1943.x==3;
}
else
{
l9_1962=l9_1961;
}
float l9_1963=l9_1940.x;
float l9_1964=l9_1945.x;
float l9_1965=l9_1945.z;
bool l9_1966=l9_1962;
float l9_1967=l9_1950;
float l9_1968=fast::clamp(l9_1963,l9_1964,l9_1965);
float l9_1969=step(abs(l9_1963-l9_1968),9.9999997e-06);
l9_1967*=(l9_1969+((1.0-float(l9_1966))*(1.0-l9_1969)));
l9_1963=l9_1968;
l9_1940.x=l9_1963;
l9_1950=l9_1967;
bool l9_1970=l9_1946;
bool l9_1971;
if (l9_1970)
{
l9_1971=l9_1943.y==3;
}
else
{
l9_1971=l9_1970;
}
float l9_1972=l9_1940.y;
float l9_1973=l9_1945.y;
float l9_1974=l9_1945.w;
bool l9_1975=l9_1971;
float l9_1976=l9_1950;
float l9_1977=fast::clamp(l9_1972,l9_1973,l9_1974);
float l9_1978=step(abs(l9_1972-l9_1977),9.9999997e-06);
l9_1976*=(l9_1978+((1.0-float(l9_1975))*(1.0-l9_1978)));
l9_1972=l9_1977;
l9_1940.y=l9_1972;
l9_1950=l9_1976;
}
float2 l9_1979=l9_1940;
bool l9_1980=l9_1941;
float3x3 l9_1981=l9_1942;
if (l9_1980)
{
l9_1979=float2((l9_1981*float3(l9_1979,1.0)).xy);
}
float2 l9_1982=l9_1979;
float2 l9_1983=l9_1982;
float2 l9_1984=l9_1983;
l9_1940=l9_1984;
float l9_1985=l9_1940.x;
int l9_1986=l9_1943.x;
bool l9_1987=l9_1949;
float l9_1988=l9_1950;
if ((l9_1986==0)||(l9_1986==3))
{
float l9_1989=l9_1985;
float l9_1990=0.0;
float l9_1991=1.0;
bool l9_1992=l9_1987;
float l9_1993=l9_1988;
float l9_1994=fast::clamp(l9_1989,l9_1990,l9_1991);
float l9_1995=step(abs(l9_1989-l9_1994),9.9999997e-06);
l9_1993*=(l9_1995+((1.0-float(l9_1992))*(1.0-l9_1995)));
l9_1989=l9_1994;
l9_1985=l9_1989;
l9_1988=l9_1993;
}
l9_1940.x=l9_1985;
l9_1950=l9_1988;
float l9_1996=l9_1940.y;
int l9_1997=l9_1943.y;
bool l9_1998=l9_1949;
float l9_1999=l9_1950;
if ((l9_1997==0)||(l9_1997==3))
{
float l9_2000=l9_1996;
float l9_2001=0.0;
float l9_2002=1.0;
bool l9_2003=l9_1998;
float l9_2004=l9_1999;
float l9_2005=fast::clamp(l9_2000,l9_2001,l9_2002);
float l9_2006=step(abs(l9_2000-l9_2005),9.9999997e-06);
l9_2004*=(l9_2006+((1.0-float(l9_2003))*(1.0-l9_2006)));
l9_2000=l9_2005;
l9_1996=l9_2000;
l9_1999=l9_2004;
}
l9_1940.y=l9_1996;
l9_1950=l9_1999;
float2 l9_2007=l9_1940;
int l9_2008=l9_1938;
int l9_2009=l9_1939;
float l9_2010=l9_1948;
float2 l9_2011=l9_2007;
int l9_2012=l9_2008;
int l9_2013=l9_2009;
float3 l9_2014=float3(0.0);
if (l9_2012==0)
{
l9_2014=float3(l9_2011,0.0);
}
else
{
if (l9_2012==1)
{
l9_2014=float3(l9_2011.x,(l9_2011.y*0.5)+(0.5-(float(l9_2013)*0.5)),0.0);
}
else
{
l9_2014=float3(l9_2011,float(l9_2013));
}
}
float3 l9_2015=l9_2014;
float3 l9_2016=l9_2015;
float2 l9_2017=l9_2016.xy;
float l9_2018=l9_2010;
float4 l9_2019=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2017,bias(l9_2018));
float4 l9_2020=l9_2019;
float4 l9_2021=l9_2020;
if (l9_1946)
{
l9_2021=mix(l9_1947,l9_2021,float4(l9_1950));
}
float4 l9_2022=l9_2021;
float4 l9_2023=l9_2022;
l9_1915=l9_2023;
float l9_2024=0.0;
float4 l9_2025=l9_1915;
float l9_2026=l9_2025.w;
l9_2024=l9_2026;
l9_1409=l9_2024;
l9_1411=l9_1409;
}
}
}
}
l9_1404=l9_1411;
float l9_2027=0.0;
l9_2027=l9_1404;
float l9_2028=0.0;
l9_2028=1.0-l9_2027;
l9_1400=l9_2028;
l9_1403=l9_1400;
}
else
{
float l9_2029=0.0;
float l9_2030=0.0;
float l9_2031=0.0;
float l9_2032=0.0;
float l9_2033=0.0;
float l9_2034=0.0;
ssGlobals l9_2035=l9_1402;
float l9_2036;
if (NODE_243_DROPLIST_ITEM_tmp==0)
{
float2 l9_2037=float2(0.0);
l9_2037=l9_2035.Surface_UVCoord0;
float2 l9_2038=float2(0.0);
float2 l9_2039=l9_2037;
float l9_2040=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2041=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2042=sin(radians(l9_2040));
float l9_2043=cos(radians(l9_2040));
float2 l9_2044=l9_2039-l9_2041;
l9_2044=float2(dot(float2(l9_2043,l9_2042),l9_2044),dot(float2(-l9_2042,l9_2043),l9_2044))+l9_2041;
l9_2038=l9_2044;
float l9_2045=0.0;
l9_2045=gParticle.Index1DPerCopyF;
float l9_2046=0.0;
l9_2046=gParticle.Ratio1DPerCopy;
float l9_2047=0.0;
l9_2047=(((l9_2046-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2048=float4(0.0);
float2 l9_2049=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2050=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2051=l9_2038;
float l9_2052=l9_2045;
float l9_2053=l9_2047;
float l9_2054=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2055=l9_2035;
float2 l9_2056=float2(0.0);
float l9_2057=floor(l9_2049.x);
float l9_2058=floor(l9_2049.y);
float l9_2059=1.0/l9_2057;
float l9_2060=1.0/l9_2058;
float l9_2061=fast::min(l9_2057*l9_2058,floor(l9_2050));
float l9_2062=floor(mod(((l9_2055.gTimeElapsedShifted+l9_2054)*l9_2053)+floor(l9_2052),l9_2061));
float l9_2063=floor(l9_2062/l9_2057);
float l9_2064=mod(l9_2062,l9_2057);
l9_2056=float2((l9_2059*l9_2051.x)+(l9_2064*l9_2059),((1.0-l9_2060)-(l9_2063*l9_2060))+(l9_2060*l9_2051.y));
int l9_2065=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2066=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2066=0;
}
else
{
l9_2066=in.varStereoViewID;
}
int l9_2067=l9_2066;
l9_2065=1-l9_2067;
}
else
{
int l9_2068=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2068=0;
}
else
{
l9_2068=in.varStereoViewID;
}
int l9_2069=l9_2068;
l9_2065=l9_2069;
}
int l9_2070=l9_2065;
int l9_2071=flipbookTexLayout_tmp;
int l9_2072=l9_2070;
float2 l9_2073=l9_2056;
bool l9_2074=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2075=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2076=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2077=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2078=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2079=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2080=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2081=0.0;
bool l9_2082=l9_2079&&(!l9_2077);
float l9_2083=1.0;
float l9_2084=l9_2073.x;
int l9_2085=l9_2076.x;
if (l9_2085==1)
{
l9_2084=fract(l9_2084);
}
else
{
if (l9_2085==2)
{
float l9_2086=fract(l9_2084);
float l9_2087=l9_2084-l9_2086;
float l9_2088=step(0.25,fract(l9_2087*0.5));
l9_2084=mix(l9_2086,1.0-l9_2086,fast::clamp(l9_2088,0.0,1.0));
}
}
l9_2073.x=l9_2084;
float l9_2089=l9_2073.y;
int l9_2090=l9_2076.y;
if (l9_2090==1)
{
l9_2089=fract(l9_2089);
}
else
{
if (l9_2090==2)
{
float l9_2091=fract(l9_2089);
float l9_2092=l9_2089-l9_2091;
float l9_2093=step(0.25,fract(l9_2092*0.5));
l9_2089=mix(l9_2091,1.0-l9_2091,fast::clamp(l9_2093,0.0,1.0));
}
}
l9_2073.y=l9_2089;
if (l9_2077)
{
bool l9_2094=l9_2079;
bool l9_2095;
if (l9_2094)
{
l9_2095=l9_2076.x==3;
}
else
{
l9_2095=l9_2094;
}
float l9_2096=l9_2073.x;
float l9_2097=l9_2078.x;
float l9_2098=l9_2078.z;
bool l9_2099=l9_2095;
float l9_2100=l9_2083;
float l9_2101=fast::clamp(l9_2096,l9_2097,l9_2098);
float l9_2102=step(abs(l9_2096-l9_2101),9.9999997e-06);
l9_2100*=(l9_2102+((1.0-float(l9_2099))*(1.0-l9_2102)));
l9_2096=l9_2101;
l9_2073.x=l9_2096;
l9_2083=l9_2100;
bool l9_2103=l9_2079;
bool l9_2104;
if (l9_2103)
{
l9_2104=l9_2076.y==3;
}
else
{
l9_2104=l9_2103;
}
float l9_2105=l9_2073.y;
float l9_2106=l9_2078.y;
float l9_2107=l9_2078.w;
bool l9_2108=l9_2104;
float l9_2109=l9_2083;
float l9_2110=fast::clamp(l9_2105,l9_2106,l9_2107);
float l9_2111=step(abs(l9_2105-l9_2110),9.9999997e-06);
l9_2109*=(l9_2111+((1.0-float(l9_2108))*(1.0-l9_2111)));
l9_2105=l9_2110;
l9_2073.y=l9_2105;
l9_2083=l9_2109;
}
float2 l9_2112=l9_2073;
bool l9_2113=l9_2074;
float3x3 l9_2114=l9_2075;
if (l9_2113)
{
l9_2112=float2((l9_2114*float3(l9_2112,1.0)).xy);
}
float2 l9_2115=l9_2112;
float2 l9_2116=l9_2115;
float2 l9_2117=l9_2116;
l9_2073=l9_2117;
float l9_2118=l9_2073.x;
int l9_2119=l9_2076.x;
bool l9_2120=l9_2082;
float l9_2121=l9_2083;
if ((l9_2119==0)||(l9_2119==3))
{
float l9_2122=l9_2118;
float l9_2123=0.0;
float l9_2124=1.0;
bool l9_2125=l9_2120;
float l9_2126=l9_2121;
float l9_2127=fast::clamp(l9_2122,l9_2123,l9_2124);
float l9_2128=step(abs(l9_2122-l9_2127),9.9999997e-06);
l9_2126*=(l9_2128+((1.0-float(l9_2125))*(1.0-l9_2128)));
l9_2122=l9_2127;
l9_2118=l9_2122;
l9_2121=l9_2126;
}
l9_2073.x=l9_2118;
l9_2083=l9_2121;
float l9_2129=l9_2073.y;
int l9_2130=l9_2076.y;
bool l9_2131=l9_2082;
float l9_2132=l9_2083;
if ((l9_2130==0)||(l9_2130==3))
{
float l9_2133=l9_2129;
float l9_2134=0.0;
float l9_2135=1.0;
bool l9_2136=l9_2131;
float l9_2137=l9_2132;
float l9_2138=fast::clamp(l9_2133,l9_2134,l9_2135);
float l9_2139=step(abs(l9_2133-l9_2138),9.9999997e-06);
l9_2137*=(l9_2139+((1.0-float(l9_2136))*(1.0-l9_2139)));
l9_2133=l9_2138;
l9_2129=l9_2133;
l9_2132=l9_2137;
}
l9_2073.y=l9_2129;
l9_2083=l9_2132;
float2 l9_2140=l9_2073;
int l9_2141=l9_2071;
int l9_2142=l9_2072;
float l9_2143=l9_2081;
float2 l9_2144=l9_2140;
int l9_2145=l9_2141;
int l9_2146=l9_2142;
float3 l9_2147=float3(0.0);
if (l9_2145==0)
{
l9_2147=float3(l9_2144,0.0);
}
else
{
if (l9_2145==1)
{
l9_2147=float3(l9_2144.x,(l9_2144.y*0.5)+(0.5-(float(l9_2146)*0.5)),0.0);
}
else
{
l9_2147=float3(l9_2144,float(l9_2146));
}
}
float3 l9_2148=l9_2147;
float3 l9_2149=l9_2148;
float2 l9_2150=l9_2149.xy;
float l9_2151=l9_2143;
float4 l9_2152=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2150,bias(l9_2151));
float4 l9_2153=l9_2152;
float4 l9_2154=l9_2153;
if (l9_2079)
{
l9_2154=mix(l9_2080,l9_2154,float4(l9_2083));
}
float4 l9_2155=l9_2154;
float4 l9_2156=l9_2155;
l9_2048=l9_2156;
float l9_2157=0.0;
float4 l9_2158=l9_2048;
float l9_2159=l9_2158.x;
l9_2157=l9_2159;
l9_2030=l9_2157;
l9_2036=l9_2030;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==1)
{
float2 l9_2160=float2(0.0);
l9_2160=l9_2035.Surface_UVCoord0;
float2 l9_2161=float2(0.0);
float2 l9_2162=l9_2160;
float l9_2163=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2164=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2165=sin(radians(l9_2163));
float l9_2166=cos(radians(l9_2163));
float2 l9_2167=l9_2162-l9_2164;
l9_2167=float2(dot(float2(l9_2166,l9_2165),l9_2167),dot(float2(-l9_2165,l9_2166),l9_2167))+l9_2164;
l9_2161=l9_2167;
float l9_2168=0.0;
l9_2168=gParticle.Index1DPerCopyF;
float l9_2169=0.0;
l9_2169=gParticle.Ratio1DPerCopy;
float l9_2170=0.0;
l9_2170=(((l9_2169-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2171=float4(0.0);
float2 l9_2172=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2173=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2174=l9_2161;
float l9_2175=l9_2168;
float l9_2176=l9_2170;
float l9_2177=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2178=l9_2035;
float2 l9_2179=float2(0.0);
float l9_2180=floor(l9_2172.x);
float l9_2181=floor(l9_2172.y);
float l9_2182=1.0/l9_2180;
float l9_2183=1.0/l9_2181;
float l9_2184=fast::min(l9_2180*l9_2181,floor(l9_2173));
float l9_2185=floor(mod(((l9_2178.gTimeElapsedShifted+l9_2177)*l9_2176)+floor(l9_2175),l9_2184));
float l9_2186=floor(l9_2185/l9_2180);
float l9_2187=mod(l9_2185,l9_2180);
l9_2179=float2((l9_2182*l9_2174.x)+(l9_2187*l9_2182),((1.0-l9_2183)-(l9_2186*l9_2183))+(l9_2183*l9_2174.y));
int l9_2188=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2189=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2189=0;
}
else
{
l9_2189=in.varStereoViewID;
}
int l9_2190=l9_2189;
l9_2188=1-l9_2190;
}
else
{
int l9_2191=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2191=0;
}
else
{
l9_2191=in.varStereoViewID;
}
int l9_2192=l9_2191;
l9_2188=l9_2192;
}
int l9_2193=l9_2188;
int l9_2194=flipbookTexLayout_tmp;
int l9_2195=l9_2193;
float2 l9_2196=l9_2179;
bool l9_2197=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2198=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2199=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2200=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2201=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2202=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2203=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2204=0.0;
bool l9_2205=l9_2202&&(!l9_2200);
float l9_2206=1.0;
float l9_2207=l9_2196.x;
int l9_2208=l9_2199.x;
if (l9_2208==1)
{
l9_2207=fract(l9_2207);
}
else
{
if (l9_2208==2)
{
float l9_2209=fract(l9_2207);
float l9_2210=l9_2207-l9_2209;
float l9_2211=step(0.25,fract(l9_2210*0.5));
l9_2207=mix(l9_2209,1.0-l9_2209,fast::clamp(l9_2211,0.0,1.0));
}
}
l9_2196.x=l9_2207;
float l9_2212=l9_2196.y;
int l9_2213=l9_2199.y;
if (l9_2213==1)
{
l9_2212=fract(l9_2212);
}
else
{
if (l9_2213==2)
{
float l9_2214=fract(l9_2212);
float l9_2215=l9_2212-l9_2214;
float l9_2216=step(0.25,fract(l9_2215*0.5));
l9_2212=mix(l9_2214,1.0-l9_2214,fast::clamp(l9_2216,0.0,1.0));
}
}
l9_2196.y=l9_2212;
if (l9_2200)
{
bool l9_2217=l9_2202;
bool l9_2218;
if (l9_2217)
{
l9_2218=l9_2199.x==3;
}
else
{
l9_2218=l9_2217;
}
float l9_2219=l9_2196.x;
float l9_2220=l9_2201.x;
float l9_2221=l9_2201.z;
bool l9_2222=l9_2218;
float l9_2223=l9_2206;
float l9_2224=fast::clamp(l9_2219,l9_2220,l9_2221);
float l9_2225=step(abs(l9_2219-l9_2224),9.9999997e-06);
l9_2223*=(l9_2225+((1.0-float(l9_2222))*(1.0-l9_2225)));
l9_2219=l9_2224;
l9_2196.x=l9_2219;
l9_2206=l9_2223;
bool l9_2226=l9_2202;
bool l9_2227;
if (l9_2226)
{
l9_2227=l9_2199.y==3;
}
else
{
l9_2227=l9_2226;
}
float l9_2228=l9_2196.y;
float l9_2229=l9_2201.y;
float l9_2230=l9_2201.w;
bool l9_2231=l9_2227;
float l9_2232=l9_2206;
float l9_2233=fast::clamp(l9_2228,l9_2229,l9_2230);
float l9_2234=step(abs(l9_2228-l9_2233),9.9999997e-06);
l9_2232*=(l9_2234+((1.0-float(l9_2231))*(1.0-l9_2234)));
l9_2228=l9_2233;
l9_2196.y=l9_2228;
l9_2206=l9_2232;
}
float2 l9_2235=l9_2196;
bool l9_2236=l9_2197;
float3x3 l9_2237=l9_2198;
if (l9_2236)
{
l9_2235=float2((l9_2237*float3(l9_2235,1.0)).xy);
}
float2 l9_2238=l9_2235;
float2 l9_2239=l9_2238;
float2 l9_2240=l9_2239;
l9_2196=l9_2240;
float l9_2241=l9_2196.x;
int l9_2242=l9_2199.x;
bool l9_2243=l9_2205;
float l9_2244=l9_2206;
if ((l9_2242==0)||(l9_2242==3))
{
float l9_2245=l9_2241;
float l9_2246=0.0;
float l9_2247=1.0;
bool l9_2248=l9_2243;
float l9_2249=l9_2244;
float l9_2250=fast::clamp(l9_2245,l9_2246,l9_2247);
float l9_2251=step(abs(l9_2245-l9_2250),9.9999997e-06);
l9_2249*=(l9_2251+((1.0-float(l9_2248))*(1.0-l9_2251)));
l9_2245=l9_2250;
l9_2241=l9_2245;
l9_2244=l9_2249;
}
l9_2196.x=l9_2241;
l9_2206=l9_2244;
float l9_2252=l9_2196.y;
int l9_2253=l9_2199.y;
bool l9_2254=l9_2205;
float l9_2255=l9_2206;
if ((l9_2253==0)||(l9_2253==3))
{
float l9_2256=l9_2252;
float l9_2257=0.0;
float l9_2258=1.0;
bool l9_2259=l9_2254;
float l9_2260=l9_2255;
float l9_2261=fast::clamp(l9_2256,l9_2257,l9_2258);
float l9_2262=step(abs(l9_2256-l9_2261),9.9999997e-06);
l9_2260*=(l9_2262+((1.0-float(l9_2259))*(1.0-l9_2262)));
l9_2256=l9_2261;
l9_2252=l9_2256;
l9_2255=l9_2260;
}
l9_2196.y=l9_2252;
l9_2206=l9_2255;
float2 l9_2263=l9_2196;
int l9_2264=l9_2194;
int l9_2265=l9_2195;
float l9_2266=l9_2204;
float2 l9_2267=l9_2263;
int l9_2268=l9_2264;
int l9_2269=l9_2265;
float3 l9_2270=float3(0.0);
if (l9_2268==0)
{
l9_2270=float3(l9_2267,0.0);
}
else
{
if (l9_2268==1)
{
l9_2270=float3(l9_2267.x,(l9_2267.y*0.5)+(0.5-(float(l9_2269)*0.5)),0.0);
}
else
{
l9_2270=float3(l9_2267,float(l9_2269));
}
}
float3 l9_2271=l9_2270;
float3 l9_2272=l9_2271;
float2 l9_2273=l9_2272.xy;
float l9_2274=l9_2266;
float4 l9_2275=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2273,bias(l9_2274));
float4 l9_2276=l9_2275;
float4 l9_2277=l9_2276;
if (l9_2202)
{
l9_2277=mix(l9_2203,l9_2277,float4(l9_2206));
}
float4 l9_2278=l9_2277;
float4 l9_2279=l9_2278;
l9_2171=l9_2279;
float l9_2280=0.0;
float4 l9_2281=l9_2171;
float l9_2282=l9_2281.y;
l9_2280=l9_2282;
l9_2031=l9_2280;
l9_2036=l9_2031;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==2)
{
float2 l9_2283=float2(0.0);
l9_2283=l9_2035.Surface_UVCoord0;
float2 l9_2284=float2(0.0);
float2 l9_2285=l9_2283;
float l9_2286=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2287=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2288=sin(radians(l9_2286));
float l9_2289=cos(radians(l9_2286));
float2 l9_2290=l9_2285-l9_2287;
l9_2290=float2(dot(float2(l9_2289,l9_2288),l9_2290),dot(float2(-l9_2288,l9_2289),l9_2290))+l9_2287;
l9_2284=l9_2290;
float l9_2291=0.0;
l9_2291=gParticle.Index1DPerCopyF;
float l9_2292=0.0;
l9_2292=gParticle.Ratio1DPerCopy;
float l9_2293=0.0;
l9_2293=(((l9_2292-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2294=float4(0.0);
float2 l9_2295=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2296=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2297=l9_2284;
float l9_2298=l9_2291;
float l9_2299=l9_2293;
float l9_2300=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2301=l9_2035;
float2 l9_2302=float2(0.0);
float l9_2303=floor(l9_2295.x);
float l9_2304=floor(l9_2295.y);
float l9_2305=1.0/l9_2303;
float l9_2306=1.0/l9_2304;
float l9_2307=fast::min(l9_2303*l9_2304,floor(l9_2296));
float l9_2308=floor(mod(((l9_2301.gTimeElapsedShifted+l9_2300)*l9_2299)+floor(l9_2298),l9_2307));
float l9_2309=floor(l9_2308/l9_2303);
float l9_2310=mod(l9_2308,l9_2303);
l9_2302=float2((l9_2305*l9_2297.x)+(l9_2310*l9_2305),((1.0-l9_2306)-(l9_2309*l9_2306))+(l9_2306*l9_2297.y));
int l9_2311=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2312=0;
}
else
{
l9_2312=in.varStereoViewID;
}
int l9_2313=l9_2312;
l9_2311=1-l9_2313;
}
else
{
int l9_2314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2314=0;
}
else
{
l9_2314=in.varStereoViewID;
}
int l9_2315=l9_2314;
l9_2311=l9_2315;
}
int l9_2316=l9_2311;
int l9_2317=flipbookTexLayout_tmp;
int l9_2318=l9_2316;
float2 l9_2319=l9_2302;
bool l9_2320=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2321=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2322=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2323=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2324=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2325=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2326=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2327=0.0;
bool l9_2328=l9_2325&&(!l9_2323);
float l9_2329=1.0;
float l9_2330=l9_2319.x;
int l9_2331=l9_2322.x;
if (l9_2331==1)
{
l9_2330=fract(l9_2330);
}
else
{
if (l9_2331==2)
{
float l9_2332=fract(l9_2330);
float l9_2333=l9_2330-l9_2332;
float l9_2334=step(0.25,fract(l9_2333*0.5));
l9_2330=mix(l9_2332,1.0-l9_2332,fast::clamp(l9_2334,0.0,1.0));
}
}
l9_2319.x=l9_2330;
float l9_2335=l9_2319.y;
int l9_2336=l9_2322.y;
if (l9_2336==1)
{
l9_2335=fract(l9_2335);
}
else
{
if (l9_2336==2)
{
float l9_2337=fract(l9_2335);
float l9_2338=l9_2335-l9_2337;
float l9_2339=step(0.25,fract(l9_2338*0.5));
l9_2335=mix(l9_2337,1.0-l9_2337,fast::clamp(l9_2339,0.0,1.0));
}
}
l9_2319.y=l9_2335;
if (l9_2323)
{
bool l9_2340=l9_2325;
bool l9_2341;
if (l9_2340)
{
l9_2341=l9_2322.x==3;
}
else
{
l9_2341=l9_2340;
}
float l9_2342=l9_2319.x;
float l9_2343=l9_2324.x;
float l9_2344=l9_2324.z;
bool l9_2345=l9_2341;
float l9_2346=l9_2329;
float l9_2347=fast::clamp(l9_2342,l9_2343,l9_2344);
float l9_2348=step(abs(l9_2342-l9_2347),9.9999997e-06);
l9_2346*=(l9_2348+((1.0-float(l9_2345))*(1.0-l9_2348)));
l9_2342=l9_2347;
l9_2319.x=l9_2342;
l9_2329=l9_2346;
bool l9_2349=l9_2325;
bool l9_2350;
if (l9_2349)
{
l9_2350=l9_2322.y==3;
}
else
{
l9_2350=l9_2349;
}
float l9_2351=l9_2319.y;
float l9_2352=l9_2324.y;
float l9_2353=l9_2324.w;
bool l9_2354=l9_2350;
float l9_2355=l9_2329;
float l9_2356=fast::clamp(l9_2351,l9_2352,l9_2353);
float l9_2357=step(abs(l9_2351-l9_2356),9.9999997e-06);
l9_2355*=(l9_2357+((1.0-float(l9_2354))*(1.0-l9_2357)));
l9_2351=l9_2356;
l9_2319.y=l9_2351;
l9_2329=l9_2355;
}
float2 l9_2358=l9_2319;
bool l9_2359=l9_2320;
float3x3 l9_2360=l9_2321;
if (l9_2359)
{
l9_2358=float2((l9_2360*float3(l9_2358,1.0)).xy);
}
float2 l9_2361=l9_2358;
float2 l9_2362=l9_2361;
float2 l9_2363=l9_2362;
l9_2319=l9_2363;
float l9_2364=l9_2319.x;
int l9_2365=l9_2322.x;
bool l9_2366=l9_2328;
float l9_2367=l9_2329;
if ((l9_2365==0)||(l9_2365==3))
{
float l9_2368=l9_2364;
float l9_2369=0.0;
float l9_2370=1.0;
bool l9_2371=l9_2366;
float l9_2372=l9_2367;
float l9_2373=fast::clamp(l9_2368,l9_2369,l9_2370);
float l9_2374=step(abs(l9_2368-l9_2373),9.9999997e-06);
l9_2372*=(l9_2374+((1.0-float(l9_2371))*(1.0-l9_2374)));
l9_2368=l9_2373;
l9_2364=l9_2368;
l9_2367=l9_2372;
}
l9_2319.x=l9_2364;
l9_2329=l9_2367;
float l9_2375=l9_2319.y;
int l9_2376=l9_2322.y;
bool l9_2377=l9_2328;
float l9_2378=l9_2329;
if ((l9_2376==0)||(l9_2376==3))
{
float l9_2379=l9_2375;
float l9_2380=0.0;
float l9_2381=1.0;
bool l9_2382=l9_2377;
float l9_2383=l9_2378;
float l9_2384=fast::clamp(l9_2379,l9_2380,l9_2381);
float l9_2385=step(abs(l9_2379-l9_2384),9.9999997e-06);
l9_2383*=(l9_2385+((1.0-float(l9_2382))*(1.0-l9_2385)));
l9_2379=l9_2384;
l9_2375=l9_2379;
l9_2378=l9_2383;
}
l9_2319.y=l9_2375;
l9_2329=l9_2378;
float2 l9_2386=l9_2319;
int l9_2387=l9_2317;
int l9_2388=l9_2318;
float l9_2389=l9_2327;
float2 l9_2390=l9_2386;
int l9_2391=l9_2387;
int l9_2392=l9_2388;
float3 l9_2393=float3(0.0);
if (l9_2391==0)
{
l9_2393=float3(l9_2390,0.0);
}
else
{
if (l9_2391==1)
{
l9_2393=float3(l9_2390.x,(l9_2390.y*0.5)+(0.5-(float(l9_2392)*0.5)),0.0);
}
else
{
l9_2393=float3(l9_2390,float(l9_2392));
}
}
float3 l9_2394=l9_2393;
float3 l9_2395=l9_2394;
float2 l9_2396=l9_2395.xy;
float l9_2397=l9_2389;
float4 l9_2398=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2396,bias(l9_2397));
float4 l9_2399=l9_2398;
float4 l9_2400=l9_2399;
if (l9_2325)
{
l9_2400=mix(l9_2326,l9_2400,float4(l9_2329));
}
float4 l9_2401=l9_2400;
float4 l9_2402=l9_2401;
l9_2294=l9_2402;
float l9_2403=0.0;
float4 l9_2404=l9_2294;
float l9_2405=l9_2404.z;
l9_2403=l9_2405;
l9_2032=l9_2403;
l9_2036=l9_2032;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==3)
{
float2 l9_2406=float2(0.0);
l9_2406=l9_2035.Surface_UVCoord0;
float2 l9_2407=float2(0.0);
float2 l9_2408=l9_2406;
float l9_2409=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2410=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2411=sin(radians(l9_2409));
float l9_2412=cos(radians(l9_2409));
float2 l9_2413=l9_2408-l9_2410;
l9_2413=float2(dot(float2(l9_2412,l9_2411),l9_2413),dot(float2(-l9_2411,l9_2412),l9_2413))+l9_2410;
l9_2407=l9_2413;
float l9_2414=0.0;
l9_2414=gParticle.Index1DPerCopyF;
float l9_2415=0.0;
l9_2415=gParticle.Ratio1DPerCopy;
float l9_2416=0.0;
l9_2416=(((l9_2415-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2417=float4(0.0);
float2 l9_2418=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2419=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2420=l9_2407;
float l9_2421=l9_2414;
float l9_2422=l9_2416;
float l9_2423=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2424=l9_2035;
float2 l9_2425=float2(0.0);
float l9_2426=floor(l9_2418.x);
float l9_2427=floor(l9_2418.y);
float l9_2428=1.0/l9_2426;
float l9_2429=1.0/l9_2427;
float l9_2430=fast::min(l9_2426*l9_2427,floor(l9_2419));
float l9_2431=floor(mod(((l9_2424.gTimeElapsedShifted+l9_2423)*l9_2422)+floor(l9_2421),l9_2430));
float l9_2432=floor(l9_2431/l9_2426);
float l9_2433=mod(l9_2431,l9_2426);
l9_2425=float2((l9_2428*l9_2420.x)+(l9_2433*l9_2428),((1.0-l9_2429)-(l9_2432*l9_2429))+(l9_2429*l9_2420.y));
int l9_2434=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2435=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2435=0;
}
else
{
l9_2435=in.varStereoViewID;
}
int l9_2436=l9_2435;
l9_2434=1-l9_2436;
}
else
{
int l9_2437=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2437=0;
}
else
{
l9_2437=in.varStereoViewID;
}
int l9_2438=l9_2437;
l9_2434=l9_2438;
}
int l9_2439=l9_2434;
int l9_2440=flipbookTexLayout_tmp;
int l9_2441=l9_2439;
float2 l9_2442=l9_2425;
bool l9_2443=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2444=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2445=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2446=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2447=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2448=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2449=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2450=0.0;
bool l9_2451=l9_2448&&(!l9_2446);
float l9_2452=1.0;
float l9_2453=l9_2442.x;
int l9_2454=l9_2445.x;
if (l9_2454==1)
{
l9_2453=fract(l9_2453);
}
else
{
if (l9_2454==2)
{
float l9_2455=fract(l9_2453);
float l9_2456=l9_2453-l9_2455;
float l9_2457=step(0.25,fract(l9_2456*0.5));
l9_2453=mix(l9_2455,1.0-l9_2455,fast::clamp(l9_2457,0.0,1.0));
}
}
l9_2442.x=l9_2453;
float l9_2458=l9_2442.y;
int l9_2459=l9_2445.y;
if (l9_2459==1)
{
l9_2458=fract(l9_2458);
}
else
{
if (l9_2459==2)
{
float l9_2460=fract(l9_2458);
float l9_2461=l9_2458-l9_2460;
float l9_2462=step(0.25,fract(l9_2461*0.5));
l9_2458=mix(l9_2460,1.0-l9_2460,fast::clamp(l9_2462,0.0,1.0));
}
}
l9_2442.y=l9_2458;
if (l9_2446)
{
bool l9_2463=l9_2448;
bool l9_2464;
if (l9_2463)
{
l9_2464=l9_2445.x==3;
}
else
{
l9_2464=l9_2463;
}
float l9_2465=l9_2442.x;
float l9_2466=l9_2447.x;
float l9_2467=l9_2447.z;
bool l9_2468=l9_2464;
float l9_2469=l9_2452;
float l9_2470=fast::clamp(l9_2465,l9_2466,l9_2467);
float l9_2471=step(abs(l9_2465-l9_2470),9.9999997e-06);
l9_2469*=(l9_2471+((1.0-float(l9_2468))*(1.0-l9_2471)));
l9_2465=l9_2470;
l9_2442.x=l9_2465;
l9_2452=l9_2469;
bool l9_2472=l9_2448;
bool l9_2473;
if (l9_2472)
{
l9_2473=l9_2445.y==3;
}
else
{
l9_2473=l9_2472;
}
float l9_2474=l9_2442.y;
float l9_2475=l9_2447.y;
float l9_2476=l9_2447.w;
bool l9_2477=l9_2473;
float l9_2478=l9_2452;
float l9_2479=fast::clamp(l9_2474,l9_2475,l9_2476);
float l9_2480=step(abs(l9_2474-l9_2479),9.9999997e-06);
l9_2478*=(l9_2480+((1.0-float(l9_2477))*(1.0-l9_2480)));
l9_2474=l9_2479;
l9_2442.y=l9_2474;
l9_2452=l9_2478;
}
float2 l9_2481=l9_2442;
bool l9_2482=l9_2443;
float3x3 l9_2483=l9_2444;
if (l9_2482)
{
l9_2481=float2((l9_2483*float3(l9_2481,1.0)).xy);
}
float2 l9_2484=l9_2481;
float2 l9_2485=l9_2484;
float2 l9_2486=l9_2485;
l9_2442=l9_2486;
float l9_2487=l9_2442.x;
int l9_2488=l9_2445.x;
bool l9_2489=l9_2451;
float l9_2490=l9_2452;
if ((l9_2488==0)||(l9_2488==3))
{
float l9_2491=l9_2487;
float l9_2492=0.0;
float l9_2493=1.0;
bool l9_2494=l9_2489;
float l9_2495=l9_2490;
float l9_2496=fast::clamp(l9_2491,l9_2492,l9_2493);
float l9_2497=step(abs(l9_2491-l9_2496),9.9999997e-06);
l9_2495*=(l9_2497+((1.0-float(l9_2494))*(1.0-l9_2497)));
l9_2491=l9_2496;
l9_2487=l9_2491;
l9_2490=l9_2495;
}
l9_2442.x=l9_2487;
l9_2452=l9_2490;
float l9_2498=l9_2442.y;
int l9_2499=l9_2445.y;
bool l9_2500=l9_2451;
float l9_2501=l9_2452;
if ((l9_2499==0)||(l9_2499==3))
{
float l9_2502=l9_2498;
float l9_2503=0.0;
float l9_2504=1.0;
bool l9_2505=l9_2500;
float l9_2506=l9_2501;
float l9_2507=fast::clamp(l9_2502,l9_2503,l9_2504);
float l9_2508=step(abs(l9_2502-l9_2507),9.9999997e-06);
l9_2506*=(l9_2508+((1.0-float(l9_2505))*(1.0-l9_2508)));
l9_2502=l9_2507;
l9_2498=l9_2502;
l9_2501=l9_2506;
}
l9_2442.y=l9_2498;
l9_2452=l9_2501;
float2 l9_2509=l9_2442;
int l9_2510=l9_2440;
int l9_2511=l9_2441;
float l9_2512=l9_2450;
float2 l9_2513=l9_2509;
int l9_2514=l9_2510;
int l9_2515=l9_2511;
float3 l9_2516=float3(0.0);
if (l9_2514==0)
{
l9_2516=float3(l9_2513,0.0);
}
else
{
if (l9_2514==1)
{
l9_2516=float3(l9_2513.x,(l9_2513.y*0.5)+(0.5-(float(l9_2515)*0.5)),0.0);
}
else
{
l9_2516=float3(l9_2513,float(l9_2515));
}
}
float3 l9_2517=l9_2516;
float3 l9_2518=l9_2517;
float2 l9_2519=l9_2518.xy;
float l9_2520=l9_2512;
float4 l9_2521=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2519,bias(l9_2520));
float4 l9_2522=l9_2521;
float4 l9_2523=l9_2522;
if (l9_2448)
{
l9_2523=mix(l9_2449,l9_2523,float4(l9_2452));
}
float4 l9_2524=l9_2523;
float4 l9_2525=l9_2524;
l9_2417=l9_2525;
float l9_2526=0.0;
float4 l9_2527=l9_2417;
float l9_2528=l9_2527.w;
l9_2526=l9_2528;
l9_2033=l9_2526;
l9_2036=l9_2033;
}
else
{
float2 l9_2529=float2(0.0);
l9_2529=l9_2035.Surface_UVCoord0;
float2 l9_2530=float2(0.0);
float2 l9_2531=l9_2529;
float l9_2532=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2533=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2534=sin(radians(l9_2532));
float l9_2535=cos(radians(l9_2532));
float2 l9_2536=l9_2531-l9_2533;
l9_2536=float2(dot(float2(l9_2535,l9_2534),l9_2536),dot(float2(-l9_2534,l9_2535),l9_2536))+l9_2533;
l9_2530=l9_2536;
float l9_2537=0.0;
l9_2537=gParticle.Index1DPerCopyF;
float l9_2538=0.0;
l9_2538=gParticle.Ratio1DPerCopy;
float l9_2539=0.0;
l9_2539=(((l9_2538-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2540=float4(0.0);
float2 l9_2541=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2542=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2543=l9_2530;
float l9_2544=l9_2537;
float l9_2545=l9_2539;
float l9_2546=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2547=l9_2035;
float2 l9_2548=float2(0.0);
float l9_2549=floor(l9_2541.x);
float l9_2550=floor(l9_2541.y);
float l9_2551=1.0/l9_2549;
float l9_2552=1.0/l9_2550;
float l9_2553=fast::min(l9_2549*l9_2550,floor(l9_2542));
float l9_2554=floor(mod(((l9_2547.gTimeElapsedShifted+l9_2546)*l9_2545)+floor(l9_2544),l9_2553));
float l9_2555=floor(l9_2554/l9_2549);
float l9_2556=mod(l9_2554,l9_2549);
l9_2548=float2((l9_2551*l9_2543.x)+(l9_2556*l9_2551),((1.0-l9_2552)-(l9_2555*l9_2552))+(l9_2552*l9_2543.y));
int l9_2557=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2558=0;
}
else
{
l9_2558=in.varStereoViewID;
}
int l9_2559=l9_2558;
l9_2557=1-l9_2559;
}
else
{
int l9_2560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2560=0;
}
else
{
l9_2560=in.varStereoViewID;
}
int l9_2561=l9_2560;
l9_2557=l9_2561;
}
int l9_2562=l9_2557;
int l9_2563=flipbookTexLayout_tmp;
int l9_2564=l9_2562;
float2 l9_2565=l9_2548;
bool l9_2566=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2567=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2568=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2569=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2570=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2571=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2572=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2573=0.0;
bool l9_2574=l9_2571&&(!l9_2569);
float l9_2575=1.0;
float l9_2576=l9_2565.x;
int l9_2577=l9_2568.x;
if (l9_2577==1)
{
l9_2576=fract(l9_2576);
}
else
{
if (l9_2577==2)
{
float l9_2578=fract(l9_2576);
float l9_2579=l9_2576-l9_2578;
float l9_2580=step(0.25,fract(l9_2579*0.5));
l9_2576=mix(l9_2578,1.0-l9_2578,fast::clamp(l9_2580,0.0,1.0));
}
}
l9_2565.x=l9_2576;
float l9_2581=l9_2565.y;
int l9_2582=l9_2568.y;
if (l9_2582==1)
{
l9_2581=fract(l9_2581);
}
else
{
if (l9_2582==2)
{
float l9_2583=fract(l9_2581);
float l9_2584=l9_2581-l9_2583;
float l9_2585=step(0.25,fract(l9_2584*0.5));
l9_2581=mix(l9_2583,1.0-l9_2583,fast::clamp(l9_2585,0.0,1.0));
}
}
l9_2565.y=l9_2581;
if (l9_2569)
{
bool l9_2586=l9_2571;
bool l9_2587;
if (l9_2586)
{
l9_2587=l9_2568.x==3;
}
else
{
l9_2587=l9_2586;
}
float l9_2588=l9_2565.x;
float l9_2589=l9_2570.x;
float l9_2590=l9_2570.z;
bool l9_2591=l9_2587;
float l9_2592=l9_2575;
float l9_2593=fast::clamp(l9_2588,l9_2589,l9_2590);
float l9_2594=step(abs(l9_2588-l9_2593),9.9999997e-06);
l9_2592*=(l9_2594+((1.0-float(l9_2591))*(1.0-l9_2594)));
l9_2588=l9_2593;
l9_2565.x=l9_2588;
l9_2575=l9_2592;
bool l9_2595=l9_2571;
bool l9_2596;
if (l9_2595)
{
l9_2596=l9_2568.y==3;
}
else
{
l9_2596=l9_2595;
}
float l9_2597=l9_2565.y;
float l9_2598=l9_2570.y;
float l9_2599=l9_2570.w;
bool l9_2600=l9_2596;
float l9_2601=l9_2575;
float l9_2602=fast::clamp(l9_2597,l9_2598,l9_2599);
float l9_2603=step(abs(l9_2597-l9_2602),9.9999997e-06);
l9_2601*=(l9_2603+((1.0-float(l9_2600))*(1.0-l9_2603)));
l9_2597=l9_2602;
l9_2565.y=l9_2597;
l9_2575=l9_2601;
}
float2 l9_2604=l9_2565;
bool l9_2605=l9_2566;
float3x3 l9_2606=l9_2567;
if (l9_2605)
{
l9_2604=float2((l9_2606*float3(l9_2604,1.0)).xy);
}
float2 l9_2607=l9_2604;
float2 l9_2608=l9_2607;
float2 l9_2609=l9_2608;
l9_2565=l9_2609;
float l9_2610=l9_2565.x;
int l9_2611=l9_2568.x;
bool l9_2612=l9_2574;
float l9_2613=l9_2575;
if ((l9_2611==0)||(l9_2611==3))
{
float l9_2614=l9_2610;
float l9_2615=0.0;
float l9_2616=1.0;
bool l9_2617=l9_2612;
float l9_2618=l9_2613;
float l9_2619=fast::clamp(l9_2614,l9_2615,l9_2616);
float l9_2620=step(abs(l9_2614-l9_2619),9.9999997e-06);
l9_2618*=(l9_2620+((1.0-float(l9_2617))*(1.0-l9_2620)));
l9_2614=l9_2619;
l9_2610=l9_2614;
l9_2613=l9_2618;
}
l9_2565.x=l9_2610;
l9_2575=l9_2613;
float l9_2621=l9_2565.y;
int l9_2622=l9_2568.y;
bool l9_2623=l9_2574;
float l9_2624=l9_2575;
if ((l9_2622==0)||(l9_2622==3))
{
float l9_2625=l9_2621;
float l9_2626=0.0;
float l9_2627=1.0;
bool l9_2628=l9_2623;
float l9_2629=l9_2624;
float l9_2630=fast::clamp(l9_2625,l9_2626,l9_2627);
float l9_2631=step(abs(l9_2625-l9_2630),9.9999997e-06);
l9_2629*=(l9_2631+((1.0-float(l9_2628))*(1.0-l9_2631)));
l9_2625=l9_2630;
l9_2621=l9_2625;
l9_2624=l9_2629;
}
l9_2565.y=l9_2621;
l9_2575=l9_2624;
float2 l9_2632=l9_2565;
int l9_2633=l9_2563;
int l9_2634=l9_2564;
float l9_2635=l9_2573;
float2 l9_2636=l9_2632;
int l9_2637=l9_2633;
int l9_2638=l9_2634;
float3 l9_2639=float3(0.0);
if (l9_2637==0)
{
l9_2639=float3(l9_2636,0.0);
}
else
{
if (l9_2637==1)
{
l9_2639=float3(l9_2636.x,(l9_2636.y*0.5)+(0.5-(float(l9_2638)*0.5)),0.0);
}
else
{
l9_2639=float3(l9_2636,float(l9_2638));
}
}
float3 l9_2640=l9_2639;
float3 l9_2641=l9_2640;
float2 l9_2642=l9_2641.xy;
float l9_2643=l9_2635;
float4 l9_2644=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2642,bias(l9_2643));
float4 l9_2645=l9_2644;
float4 l9_2646=l9_2645;
if (l9_2571)
{
l9_2646=mix(l9_2572,l9_2646,float4(l9_2575));
}
float4 l9_2647=l9_2646;
float4 l9_2648=l9_2647;
l9_2540=l9_2648;
float l9_2649=0.0;
float4 l9_2650=l9_2540;
float l9_2651=l9_2650.w;
l9_2649=l9_2651;
l9_2034=l9_2649;
l9_2036=l9_2034;
}
}
}
}
l9_2029=l9_2036;
float l9_2652=0.0;
l9_2652=l9_2029;
l9_1401=l9_2652;
l9_1403=l9_1401;
}
l9_1399=l9_1403;
float4 l9_2653=float4(0.0);
l9_2653=mix(l9_1396,l9_1397,float4(l9_1399));
float l9_2654=0.0;
float l9_2655=(*sc_set0.UserUniforms).intensity;
l9_2654=l9_2655;
float4 l9_2656=float4(0.0);
float l9_2657;
if (l9_2653.x<=0.0)
{
l9_2657=0.0;
}
else
{
l9_2657=pow(l9_2653.x,l9_2654);
}
float l9_2658=l9_2657;
float l9_2659;
if (l9_2653.y<=0.0)
{
l9_2659=0.0;
}
else
{
l9_2659=pow(l9_2653.y,l9_2654);
}
float l9_2660=l9_2659;
float l9_2661;
if (l9_2653.z<=0.0)
{
l9_2661=0.0;
}
else
{
l9_2661=pow(l9_2653.z,l9_2654);
}
float l9_2662=l9_2661;
float l9_2663;
if (l9_2653.w<=0.0)
{
l9_2663=0.0;
}
else
{
l9_2663=pow(l9_2653.w,l9_2654);
}
l9_2656=float4(l9_2658,l9_2660,l9_2662,l9_2663);
l9_1392=l9_2656;
l9_1395=l9_1392;
}
else
{
float2 l9_2664=float2(0.0);
l9_2664=l9_1394.Surface_UVCoord0;
float2 l9_2665=float2(0.0);
float2 l9_2666=l9_2664;
float l9_2667=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2668=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2669=sin(radians(l9_2667));
float l9_2670=cos(radians(l9_2667));
float2 l9_2671=l9_2666-l9_2668;
l9_2671=float2(dot(float2(l9_2670,l9_2669),l9_2671),dot(float2(-l9_2669,l9_2670),l9_2671))+l9_2668;
l9_2665=l9_2671;
float l9_2672=0.0;
l9_2672=gParticle.Index1DPerCopyF;
float l9_2673=0.0;
l9_2673=gParticle.Ratio1DPerCopy;
float l9_2674=0.0;
l9_2674=(((l9_2673-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2675=float4(0.0);
float2 l9_2676=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2677=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2678=l9_2665;
float l9_2679=l9_2672;
float l9_2680=l9_2674;
float l9_2681=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2682=l9_1394;
float2 l9_2683=float2(0.0);
float l9_2684=floor(l9_2676.x);
float l9_2685=floor(l9_2676.y);
float l9_2686=1.0/l9_2684;
float l9_2687=1.0/l9_2685;
float l9_2688=fast::min(l9_2684*l9_2685,floor(l9_2677));
float l9_2689=floor(mod(((l9_2682.gTimeElapsedShifted+l9_2681)*l9_2680)+floor(l9_2679),l9_2688));
float l9_2690=floor(l9_2689/l9_2684);
float l9_2691=mod(l9_2689,l9_2684);
l9_2683=float2((l9_2686*l9_2678.x)+(l9_2691*l9_2686),((1.0-l9_2687)-(l9_2690*l9_2687))+(l9_2687*l9_2678.y));
int l9_2692=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2693=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2693=0;
}
else
{
l9_2693=in.varStereoViewID;
}
int l9_2694=l9_2693;
l9_2692=1-l9_2694;
}
else
{
int l9_2695=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2695=0;
}
else
{
l9_2695=in.varStereoViewID;
}
int l9_2696=l9_2695;
l9_2692=l9_2696;
}
int l9_2697=l9_2692;
int l9_2698=repelflipbookTexLayout_tmp;
int l9_2699=l9_2697;
float2 l9_2700=l9_2683;
bool l9_2701=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2702=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2703=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2704=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2705=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2706=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2707=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_2708=0.0;
bool l9_2709=l9_2706&&(!l9_2704);
float l9_2710=1.0;
float l9_2711=l9_2700.x;
int l9_2712=l9_2703.x;
if (l9_2712==1)
{
l9_2711=fract(l9_2711);
}
else
{
if (l9_2712==2)
{
float l9_2713=fract(l9_2711);
float l9_2714=l9_2711-l9_2713;
float l9_2715=step(0.25,fract(l9_2714*0.5));
l9_2711=mix(l9_2713,1.0-l9_2713,fast::clamp(l9_2715,0.0,1.0));
}
}
l9_2700.x=l9_2711;
float l9_2716=l9_2700.y;
int l9_2717=l9_2703.y;
if (l9_2717==1)
{
l9_2716=fract(l9_2716);
}
else
{
if (l9_2717==2)
{
float l9_2718=fract(l9_2716);
float l9_2719=l9_2716-l9_2718;
float l9_2720=step(0.25,fract(l9_2719*0.5));
l9_2716=mix(l9_2718,1.0-l9_2718,fast::clamp(l9_2720,0.0,1.0));
}
}
l9_2700.y=l9_2716;
if (l9_2704)
{
bool l9_2721=l9_2706;
bool l9_2722;
if (l9_2721)
{
l9_2722=l9_2703.x==3;
}
else
{
l9_2722=l9_2721;
}
float l9_2723=l9_2700.x;
float l9_2724=l9_2705.x;
float l9_2725=l9_2705.z;
bool l9_2726=l9_2722;
float l9_2727=l9_2710;
float l9_2728=fast::clamp(l9_2723,l9_2724,l9_2725);
float l9_2729=step(abs(l9_2723-l9_2728),9.9999997e-06);
l9_2727*=(l9_2729+((1.0-float(l9_2726))*(1.0-l9_2729)));
l9_2723=l9_2728;
l9_2700.x=l9_2723;
l9_2710=l9_2727;
bool l9_2730=l9_2706;
bool l9_2731;
if (l9_2730)
{
l9_2731=l9_2703.y==3;
}
else
{
l9_2731=l9_2730;
}
float l9_2732=l9_2700.y;
float l9_2733=l9_2705.y;
float l9_2734=l9_2705.w;
bool l9_2735=l9_2731;
float l9_2736=l9_2710;
float l9_2737=fast::clamp(l9_2732,l9_2733,l9_2734);
float l9_2738=step(abs(l9_2732-l9_2737),9.9999997e-06);
l9_2736*=(l9_2738+((1.0-float(l9_2735))*(1.0-l9_2738)));
l9_2732=l9_2737;
l9_2700.y=l9_2732;
l9_2710=l9_2736;
}
float2 l9_2739=l9_2700;
bool l9_2740=l9_2701;
float3x3 l9_2741=l9_2702;
if (l9_2740)
{
l9_2739=float2((l9_2741*float3(l9_2739,1.0)).xy);
}
float2 l9_2742=l9_2739;
float2 l9_2743=l9_2742;
float2 l9_2744=l9_2743;
l9_2700=l9_2744;
float l9_2745=l9_2700.x;
int l9_2746=l9_2703.x;
bool l9_2747=l9_2709;
float l9_2748=l9_2710;
if ((l9_2746==0)||(l9_2746==3))
{
float l9_2749=l9_2745;
float l9_2750=0.0;
float l9_2751=1.0;
bool l9_2752=l9_2747;
float l9_2753=l9_2748;
float l9_2754=fast::clamp(l9_2749,l9_2750,l9_2751);
float l9_2755=step(abs(l9_2749-l9_2754),9.9999997e-06);
l9_2753*=(l9_2755+((1.0-float(l9_2752))*(1.0-l9_2755)));
l9_2749=l9_2754;
l9_2745=l9_2749;
l9_2748=l9_2753;
}
l9_2700.x=l9_2745;
l9_2710=l9_2748;
float l9_2756=l9_2700.y;
int l9_2757=l9_2703.y;
bool l9_2758=l9_2709;
float l9_2759=l9_2710;
if ((l9_2757==0)||(l9_2757==3))
{
float l9_2760=l9_2756;
float l9_2761=0.0;
float l9_2762=1.0;
bool l9_2763=l9_2758;
float l9_2764=l9_2759;
float l9_2765=fast::clamp(l9_2760,l9_2761,l9_2762);
float l9_2766=step(abs(l9_2760-l9_2765),9.9999997e-06);
l9_2764*=(l9_2766+((1.0-float(l9_2763))*(1.0-l9_2766)));
l9_2760=l9_2765;
l9_2756=l9_2760;
l9_2759=l9_2764;
}
l9_2700.y=l9_2756;
l9_2710=l9_2759;
float2 l9_2767=l9_2700;
int l9_2768=l9_2698;
int l9_2769=l9_2699;
float l9_2770=l9_2708;
float2 l9_2771=l9_2767;
int l9_2772=l9_2768;
int l9_2773=l9_2769;
float3 l9_2774=float3(0.0);
if (l9_2772==0)
{
l9_2774=float3(l9_2771,0.0);
}
else
{
if (l9_2772==1)
{
l9_2774=float3(l9_2771.x,(l9_2771.y*0.5)+(0.5-(float(l9_2773)*0.5)),0.0);
}
else
{
l9_2774=float3(l9_2771,float(l9_2773));
}
}
float3 l9_2775=l9_2774;
float3 l9_2776=l9_2775;
float2 l9_2777=l9_2776.xy;
float l9_2778=l9_2770;
float4 l9_2779=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_2777,bias(l9_2778));
float4 l9_2780=l9_2779;
float4 l9_2781=l9_2780;
if (l9_2706)
{
l9_2781=mix(l9_2707,l9_2781,float4(l9_2710));
}
float4 l9_2782=l9_2781;
float4 l9_2783=l9_2782;
l9_2675=l9_2783;
l9_1393=l9_2675;
l9_1395=l9_1393;
}
l9_1391=l9_1395;
float l9_2784=0.0;
float l9_2785=1.0;
float l9_2786=0.0;
ssGlobals l9_2787=l9_707;
float l9_2788;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_2789=float2(0.0);
l9_2789=l9_2787.Surface_UVCoord0;
float2 l9_2790=float2(0.0);
float2 l9_2791=l9_2789;
float l9_2792=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2793=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2794=sin(radians(l9_2792));
float l9_2795=cos(radians(l9_2792));
float2 l9_2796=l9_2791-l9_2793;
l9_2796=float2(dot(float2(l9_2795,l9_2794),l9_2796),dot(float2(-l9_2794,l9_2795),l9_2796))+l9_2793;
l9_2790=l9_2796;
float l9_2797=0.0;
l9_2797=gParticle.Index1DPerCopyF;
float l9_2798=0.0;
l9_2798=gParticle.Ratio1DPerCopy;
float l9_2799=0.0;
l9_2799=(((l9_2798-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2800=float4(0.0);
float2 l9_2801=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2802=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2803=l9_2790;
float l9_2804=l9_2797;
float l9_2805=l9_2799;
float l9_2806=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2807=l9_2787;
float2 l9_2808=float2(0.0);
float l9_2809=floor(l9_2801.x);
float l9_2810=floor(l9_2801.y);
float l9_2811=1.0/l9_2809;
float l9_2812=1.0/l9_2810;
float l9_2813=fast::min(l9_2809*l9_2810,floor(l9_2802));
float l9_2814=floor(mod(((l9_2807.gTimeElapsedShifted+l9_2806)*l9_2805)+floor(l9_2804),l9_2813));
float l9_2815=floor(l9_2814/l9_2809);
float l9_2816=mod(l9_2814,l9_2809);
l9_2808=float2((l9_2811*l9_2803.x)+(l9_2816*l9_2811),((1.0-l9_2812)-(l9_2815*l9_2812))+(l9_2812*l9_2803.y));
int l9_2817=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2818=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2818=0;
}
else
{
l9_2818=in.varStereoViewID;
}
int l9_2819=l9_2818;
l9_2817=1-l9_2819;
}
else
{
int l9_2820=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2820=0;
}
else
{
l9_2820=in.varStereoViewID;
}
int l9_2821=l9_2820;
l9_2817=l9_2821;
}
int l9_2822=l9_2817;
int l9_2823=flipbookTexLayout_tmp;
int l9_2824=l9_2822;
float2 l9_2825=l9_2808;
bool l9_2826=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2827=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2828=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2829=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2830=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2831=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2832=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2833=0.0;
bool l9_2834=l9_2831&&(!l9_2829);
float l9_2835=1.0;
float l9_2836=l9_2825.x;
int l9_2837=l9_2828.x;
if (l9_2837==1)
{
l9_2836=fract(l9_2836);
}
else
{
if (l9_2837==2)
{
float l9_2838=fract(l9_2836);
float l9_2839=l9_2836-l9_2838;
float l9_2840=step(0.25,fract(l9_2839*0.5));
l9_2836=mix(l9_2838,1.0-l9_2838,fast::clamp(l9_2840,0.0,1.0));
}
}
l9_2825.x=l9_2836;
float l9_2841=l9_2825.y;
int l9_2842=l9_2828.y;
if (l9_2842==1)
{
l9_2841=fract(l9_2841);
}
else
{
if (l9_2842==2)
{
float l9_2843=fract(l9_2841);
float l9_2844=l9_2841-l9_2843;
float l9_2845=step(0.25,fract(l9_2844*0.5));
l9_2841=mix(l9_2843,1.0-l9_2843,fast::clamp(l9_2845,0.0,1.0));
}
}
l9_2825.y=l9_2841;
if (l9_2829)
{
bool l9_2846=l9_2831;
bool l9_2847;
if (l9_2846)
{
l9_2847=l9_2828.x==3;
}
else
{
l9_2847=l9_2846;
}
float l9_2848=l9_2825.x;
float l9_2849=l9_2830.x;
float l9_2850=l9_2830.z;
bool l9_2851=l9_2847;
float l9_2852=l9_2835;
float l9_2853=fast::clamp(l9_2848,l9_2849,l9_2850);
float l9_2854=step(abs(l9_2848-l9_2853),9.9999997e-06);
l9_2852*=(l9_2854+((1.0-float(l9_2851))*(1.0-l9_2854)));
l9_2848=l9_2853;
l9_2825.x=l9_2848;
l9_2835=l9_2852;
bool l9_2855=l9_2831;
bool l9_2856;
if (l9_2855)
{
l9_2856=l9_2828.y==3;
}
else
{
l9_2856=l9_2855;
}
float l9_2857=l9_2825.y;
float l9_2858=l9_2830.y;
float l9_2859=l9_2830.w;
bool l9_2860=l9_2856;
float l9_2861=l9_2835;
float l9_2862=fast::clamp(l9_2857,l9_2858,l9_2859);
float l9_2863=step(abs(l9_2857-l9_2862),9.9999997e-06);
l9_2861*=(l9_2863+((1.0-float(l9_2860))*(1.0-l9_2863)));
l9_2857=l9_2862;
l9_2825.y=l9_2857;
l9_2835=l9_2861;
}
float2 l9_2864=l9_2825;
bool l9_2865=l9_2826;
float3x3 l9_2866=l9_2827;
if (l9_2865)
{
l9_2864=float2((l9_2866*float3(l9_2864,1.0)).xy);
}
float2 l9_2867=l9_2864;
float2 l9_2868=l9_2867;
float2 l9_2869=l9_2868;
l9_2825=l9_2869;
float l9_2870=l9_2825.x;
int l9_2871=l9_2828.x;
bool l9_2872=l9_2834;
float l9_2873=l9_2835;
if ((l9_2871==0)||(l9_2871==3))
{
float l9_2874=l9_2870;
float l9_2875=0.0;
float l9_2876=1.0;
bool l9_2877=l9_2872;
float l9_2878=l9_2873;
float l9_2879=fast::clamp(l9_2874,l9_2875,l9_2876);
float l9_2880=step(abs(l9_2874-l9_2879),9.9999997e-06);
l9_2878*=(l9_2880+((1.0-float(l9_2877))*(1.0-l9_2880)));
l9_2874=l9_2879;
l9_2870=l9_2874;
l9_2873=l9_2878;
}
l9_2825.x=l9_2870;
l9_2835=l9_2873;
float l9_2881=l9_2825.y;
int l9_2882=l9_2828.y;
bool l9_2883=l9_2834;
float l9_2884=l9_2835;
if ((l9_2882==0)||(l9_2882==3))
{
float l9_2885=l9_2881;
float l9_2886=0.0;
float l9_2887=1.0;
bool l9_2888=l9_2883;
float l9_2889=l9_2884;
float l9_2890=fast::clamp(l9_2885,l9_2886,l9_2887);
float l9_2891=step(abs(l9_2885-l9_2890),9.9999997e-06);
l9_2889*=(l9_2891+((1.0-float(l9_2888))*(1.0-l9_2891)));
l9_2885=l9_2890;
l9_2881=l9_2885;
l9_2884=l9_2889;
}
l9_2825.y=l9_2881;
l9_2835=l9_2884;
float2 l9_2892=l9_2825;
int l9_2893=l9_2823;
int l9_2894=l9_2824;
float l9_2895=l9_2833;
float2 l9_2896=l9_2892;
int l9_2897=l9_2893;
int l9_2898=l9_2894;
float3 l9_2899=float3(0.0);
if (l9_2897==0)
{
l9_2899=float3(l9_2896,0.0);
}
else
{
if (l9_2897==1)
{
l9_2899=float3(l9_2896.x,(l9_2896.y*0.5)+(0.5-(float(l9_2898)*0.5)),0.0);
}
else
{
l9_2899=float3(l9_2896,float(l9_2898));
}
}
float3 l9_2900=l9_2899;
float3 l9_2901=l9_2900;
float2 l9_2902=l9_2901.xy;
float l9_2903=l9_2895;
float4 l9_2904=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2902,bias(l9_2903));
float4 l9_2905=l9_2904;
float4 l9_2906=l9_2905;
if (l9_2831)
{
l9_2906=mix(l9_2832,l9_2906,float4(l9_2835));
}
float4 l9_2907=l9_2906;
float4 l9_2908=l9_2907;
l9_2800=l9_2908;
float l9_2909=0.0;
l9_2909=l9_2800.w;
float4 l9_2910=float4(0.0);
l9_2910=gParticle.Color;
float l9_2911=0.0;
l9_2911=l9_2910.w;
float l9_2912=0.0;
l9_2912=l9_2909*l9_2911;
l9_2785=l9_2912;
l9_2788=l9_2785;
}
else
{
float4 l9_2913=float4(0.0);
l9_2913=gParticle.Color;
float l9_2914=0.0;
l9_2914=l9_2913.w;
float2 l9_2915=float2(0.0);
l9_2915=l9_2787.Surface_UVCoord0;
float2 l9_2916=float2(0.0);
float2 l9_2917=l9_2915;
float l9_2918=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2919=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2920=sin(radians(l9_2918));
float l9_2921=cos(radians(l9_2918));
float2 l9_2922=l9_2917-l9_2919;
l9_2922=float2(dot(float2(l9_2921,l9_2920),l9_2922),dot(float2(-l9_2920,l9_2921),l9_2922))+l9_2919;
l9_2916=l9_2922;
float l9_2923=0.0;
l9_2923=gParticle.Index1DPerCopyF;
float l9_2924=0.0;
l9_2924=gParticle.Ratio1DPerCopy;
float l9_2925=0.0;
l9_2925=(((l9_2924-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2926=float4(0.0);
float2 l9_2927=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2928=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2929=l9_2916;
float l9_2930=l9_2923;
float l9_2931=l9_2925;
float l9_2932=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2933=l9_2787;
float2 l9_2934=float2(0.0);
float l9_2935=floor(l9_2927.x);
float l9_2936=floor(l9_2927.y);
float l9_2937=1.0/l9_2935;
float l9_2938=1.0/l9_2936;
float l9_2939=fast::min(l9_2935*l9_2936,floor(l9_2928));
float l9_2940=floor(mod(((l9_2933.gTimeElapsedShifted+l9_2932)*l9_2931)+floor(l9_2930),l9_2939));
float l9_2941=floor(l9_2940/l9_2935);
float l9_2942=mod(l9_2940,l9_2935);
l9_2934=float2((l9_2937*l9_2929.x)+(l9_2942*l9_2937),((1.0-l9_2938)-(l9_2941*l9_2938))+(l9_2938*l9_2929.y));
int l9_2943=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2944=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2944=0;
}
else
{
l9_2944=in.varStereoViewID;
}
int l9_2945=l9_2944;
l9_2943=1-l9_2945;
}
else
{
int l9_2946=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2946=0;
}
else
{
l9_2946=in.varStereoViewID;
}
int l9_2947=l9_2946;
l9_2943=l9_2947;
}
int l9_2948=l9_2943;
int l9_2949=repelflipbookTexLayout_tmp;
int l9_2950=l9_2948;
float2 l9_2951=l9_2934;
bool l9_2952=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2953=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2954=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2955=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2956=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2957=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2958=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_2959=0.0;
bool l9_2960=l9_2957&&(!l9_2955);
float l9_2961=1.0;
float l9_2962=l9_2951.x;
int l9_2963=l9_2954.x;
if (l9_2963==1)
{
l9_2962=fract(l9_2962);
}
else
{
if (l9_2963==2)
{
float l9_2964=fract(l9_2962);
float l9_2965=l9_2962-l9_2964;
float l9_2966=step(0.25,fract(l9_2965*0.5));
l9_2962=mix(l9_2964,1.0-l9_2964,fast::clamp(l9_2966,0.0,1.0));
}
}
l9_2951.x=l9_2962;
float l9_2967=l9_2951.y;
int l9_2968=l9_2954.y;
if (l9_2968==1)
{
l9_2967=fract(l9_2967);
}
else
{
if (l9_2968==2)
{
float l9_2969=fract(l9_2967);
float l9_2970=l9_2967-l9_2969;
float l9_2971=step(0.25,fract(l9_2970*0.5));
l9_2967=mix(l9_2969,1.0-l9_2969,fast::clamp(l9_2971,0.0,1.0));
}
}
l9_2951.y=l9_2967;
if (l9_2955)
{
bool l9_2972=l9_2957;
bool l9_2973;
if (l9_2972)
{
l9_2973=l9_2954.x==3;
}
else
{
l9_2973=l9_2972;
}
float l9_2974=l9_2951.x;
float l9_2975=l9_2956.x;
float l9_2976=l9_2956.z;
bool l9_2977=l9_2973;
float l9_2978=l9_2961;
float l9_2979=fast::clamp(l9_2974,l9_2975,l9_2976);
float l9_2980=step(abs(l9_2974-l9_2979),9.9999997e-06);
l9_2978*=(l9_2980+((1.0-float(l9_2977))*(1.0-l9_2980)));
l9_2974=l9_2979;
l9_2951.x=l9_2974;
l9_2961=l9_2978;
bool l9_2981=l9_2957;
bool l9_2982;
if (l9_2981)
{
l9_2982=l9_2954.y==3;
}
else
{
l9_2982=l9_2981;
}
float l9_2983=l9_2951.y;
float l9_2984=l9_2956.y;
float l9_2985=l9_2956.w;
bool l9_2986=l9_2982;
float l9_2987=l9_2961;
float l9_2988=fast::clamp(l9_2983,l9_2984,l9_2985);
float l9_2989=step(abs(l9_2983-l9_2988),9.9999997e-06);
l9_2987*=(l9_2989+((1.0-float(l9_2986))*(1.0-l9_2989)));
l9_2983=l9_2988;
l9_2951.y=l9_2983;
l9_2961=l9_2987;
}
float2 l9_2990=l9_2951;
bool l9_2991=l9_2952;
float3x3 l9_2992=l9_2953;
if (l9_2991)
{
l9_2990=float2((l9_2992*float3(l9_2990,1.0)).xy);
}
float2 l9_2993=l9_2990;
float2 l9_2994=l9_2993;
float2 l9_2995=l9_2994;
l9_2951=l9_2995;
float l9_2996=l9_2951.x;
int l9_2997=l9_2954.x;
bool l9_2998=l9_2960;
float l9_2999=l9_2961;
if ((l9_2997==0)||(l9_2997==3))
{
float l9_3000=l9_2996;
float l9_3001=0.0;
float l9_3002=1.0;
bool l9_3003=l9_2998;
float l9_3004=l9_2999;
float l9_3005=fast::clamp(l9_3000,l9_3001,l9_3002);
float l9_3006=step(abs(l9_3000-l9_3005),9.9999997e-06);
l9_3004*=(l9_3006+((1.0-float(l9_3003))*(1.0-l9_3006)));
l9_3000=l9_3005;
l9_2996=l9_3000;
l9_2999=l9_3004;
}
l9_2951.x=l9_2996;
l9_2961=l9_2999;
float l9_3007=l9_2951.y;
int l9_3008=l9_2954.y;
bool l9_3009=l9_2960;
float l9_3010=l9_2961;
if ((l9_3008==0)||(l9_3008==3))
{
float l9_3011=l9_3007;
float l9_3012=0.0;
float l9_3013=1.0;
bool l9_3014=l9_3009;
float l9_3015=l9_3010;
float l9_3016=fast::clamp(l9_3011,l9_3012,l9_3013);
float l9_3017=step(abs(l9_3011-l9_3016),9.9999997e-06);
l9_3015*=(l9_3017+((1.0-float(l9_3014))*(1.0-l9_3017)));
l9_3011=l9_3016;
l9_3007=l9_3011;
l9_3010=l9_3015;
}
l9_2951.y=l9_3007;
l9_2961=l9_3010;
float2 l9_3018=l9_2951;
int l9_3019=l9_2949;
int l9_3020=l9_2950;
float l9_3021=l9_2959;
float2 l9_3022=l9_3018;
int l9_3023=l9_3019;
int l9_3024=l9_3020;
float3 l9_3025=float3(0.0);
if (l9_3023==0)
{
l9_3025=float3(l9_3022,0.0);
}
else
{
if (l9_3023==1)
{
l9_3025=float3(l9_3022.x,(l9_3022.y*0.5)+(0.5-(float(l9_3024)*0.5)),0.0);
}
else
{
l9_3025=float3(l9_3022,float(l9_3024));
}
}
float3 l9_3026=l9_3025;
float3 l9_3027=l9_3026;
float2 l9_3028=l9_3027.xy;
float l9_3029=l9_3021;
float4 l9_3030=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_3028,bias(l9_3029));
float4 l9_3031=l9_3030;
float4 l9_3032=l9_3031;
if (l9_2957)
{
l9_3032=mix(l9_2958,l9_3032,float4(l9_2961));
}
float4 l9_3033=l9_3032;
float4 l9_3034=l9_3033;
l9_2926=l9_3034;
float l9_3035=0.0;
l9_3035=l9_2926.w;
float l9_3036=0.0;
l9_3036=l9_2914*l9_3035;
l9_2786=l9_3036;
l9_2788=l9_2786;
}
l9_2784=l9_2788;
float2 l9_3037=float2(0.0);
l9_3037=l9_707.Surface_UVCoord0;
float2 l9_3038=float2(0.0);
l9_3038=l9_3037*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_3039=float2(0.0);
l9_3039=l9_3038-float2(1.0);
float l9_3040=0.0;
l9_3040=dot(l9_3039,l9_3039);
float l9_3041=0.0;
l9_3041=fast::clamp(l9_3040+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_3042=0.0;
l9_3042=1.0-l9_3041;
float l9_3043=0.0;
float l9_3044;
if (l9_3042<=0.0)
{
l9_3044=0.0;
}
else
{
l9_3044=sqrt(l9_3042);
}
l9_3043=l9_3044;
float3 l9_3045=float3(0.0);
l9_3045=float3(l9_3039.x,l9_3039.y,l9_3045.z);
l9_3045.z=l9_3043;
float l9_3046=0.0;
l9_3046=distance(l9_3037,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3047=0.0;
l9_3047=float(l9_3046<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_3048=float3(0.0);
l9_3048=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_3045,float3(l9_3047));
float3 l9_3049=float3(0.0);
l9_3049=l9_3048;
float4 l9_3050=float4(0.0);
float3 l9_3051=l9_1391.xyz;
float l9_3052=l9_2784;
float3 l9_3053=l9_3049;
float3 l9_3054=(*sc_set0.UserUniforms).Port_Emissive_N258;
float l9_3055=(*sc_set0.UserUniforms).Port_Metallic_N258;
float l9_3056=(*sc_set0.UserUniforms).Port_Roughness_N258;
float3 l9_3057=(*sc_set0.UserUniforms).Port_AO_N258;
float3 l9_3058=(*sc_set0.UserUniforms).Port_SpecularAO_N258;
ssGlobals l9_3059=l9_707;
l9_3059.BumpedNormal=float3x3(float3(l9_3059.VertexTangent_WorldSpace),float3(l9_3059.VertexBinormal_WorldSpace),float3(l9_3059.VertexNormal_WorldSpace))*l9_3053;
l9_3052=fast::clamp(l9_3052,0.0,1.0);
l9_3051=fast::max(l9_3051,float3(0.0));
float3 l9_3060=l9_3051;
float l9_3061=l9_3052;
float3 l9_3062=l9_3059.BumpedNormal;
float3 l9_3063=l9_3059.PositionWS;
float3 l9_3064=l9_3059.ViewDirWS;
float3 l9_3065=l9_3054;
float l9_3066=l9_3055;
float l9_3067=l9_3056;
float3 l9_3068=l9_3057;
float3 l9_3069=l9_3058;
SurfaceProperties l9_3070;
l9_3070.albedo=float3(0.0);
l9_3070.opacity=1.0;
l9_3070.normal=float3(0.0);
l9_3070.positionWS=float3(0.0);
l9_3070.viewDirWS=float3(0.0);
l9_3070.metallic=0.0;
l9_3070.roughness=0.0;
l9_3070.emissive=float3(0.0);
l9_3070.ao=float3(1.0);
l9_3070.specularAo=float3(1.0);
l9_3070.bakedShadows=float3(1.0);
SurfaceProperties l9_3071=l9_3070;
SurfaceProperties l9_3072=l9_3071;
l9_3072.opacity=l9_3061;
float3 l9_3073=l9_3060;
float3 l9_3074;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3074=float3(pow(l9_3073.x,2.2),pow(l9_3073.y,2.2),pow(l9_3073.z,2.2));
}
else
{
l9_3074=l9_3073*l9_3073;
}
float3 l9_3075=l9_3074;
l9_3072.albedo=l9_3075;
l9_3072.normal=normalize(l9_3062);
l9_3072.positionWS=l9_3063;
l9_3072.viewDirWS=l9_3064;
float3 l9_3076=l9_3065;
float3 l9_3077;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3077=float3(pow(l9_3076.x,2.2),pow(l9_3076.y,2.2),pow(l9_3076.z,2.2));
}
else
{
l9_3077=l9_3076*l9_3076;
}
float3 l9_3078=l9_3077;
l9_3072.emissive=l9_3078;
l9_3072.metallic=l9_3066;
l9_3072.roughness=l9_3067;
l9_3072.ao=l9_3068;
l9_3072.specularAo=l9_3069;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_3079=l9_3072.positionWS;
l9_3072.ao=evaluateSSAO(l9_3079,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_3080=l9_3072;
SurfaceProperties l9_3081=l9_3080;
float3 l9_3082=mix(float3(0.039999999),l9_3081.albedo*l9_3081.metallic,float3(l9_3081.metallic));
float3 l9_3083=mix(l9_3081.albedo*(1.0-l9_3081.metallic),float3(0.0),float3(l9_3081.metallic));
l9_3080.albedo=l9_3083;
l9_3080.specColor=l9_3082;
SurfaceProperties l9_3084=l9_3080;
l9_3072=l9_3084;
SurfaceProperties l9_3085=l9_3072;
LightingComponents l9_3086;
l9_3086.directDiffuse=float3(0.0);
l9_3086.directSpecular=float3(0.0);
l9_3086.indirectDiffuse=float3(1.0);
l9_3086.indirectSpecular=float3(0.0);
l9_3086.emitted=float3(0.0);
l9_3086.transmitted=float3(0.0);
LightingComponents l9_3087=l9_3086;
LightingComponents l9_3088=l9_3087;
float3 l9_3089=l9_3085.viewDirWS;
int l9_3090=0;
float4 l9_3091=float4(l9_3085.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_3092;
LightProperties l9_3093;
int l9_3094=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3094<sc_DirectionalLightsCount_tmp)
{
l9_3092.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_3094].direction;
l9_3092.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_3094].color;
l9_3093.direction=l9_3092.direction;
l9_3093.color=l9_3092.color.xyz;
l9_3093.attenuation=l9_3092.color.w;
l9_3093.attenuation*=l9_3091[(l9_3090<3) ? l9_3090 : 3];
l9_3090++;
LightingComponents l9_3095=l9_3088;
LightProperties l9_3096=l9_3093;
SurfaceProperties l9_3097=l9_3085;
float3 l9_3098=l9_3089;
SurfaceProperties l9_3099=l9_3097;
float3 l9_3100=l9_3096.direction;
float3 l9_3101=float3(fast::clamp(dot(l9_3099.normal,l9_3100),0.0,1.0));
l9_3095.directDiffuse+=((l9_3101*l9_3096.color)*l9_3096.attenuation);
SurfaceProperties l9_3102=l9_3097;
float3 l9_3103=l9_3096.direction;
float3 l9_3104=l9_3098;
l9_3095.directSpecular+=((calculateDirectSpecular(l9_3102,l9_3103,l9_3104)*l9_3096.color)*l9_3096.attenuation);
LightingComponents l9_3105=l9_3095;
l9_3088=l9_3105;
l9_3094++;
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
sc_PointLight_t_1 l9_3106;
LightProperties l9_3107;
int l9_3108=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3108<sc_PointLightsCount_tmp)
{
l9_3106.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].falloffEnabled!=0;
l9_3106.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].falloffEndDistance;
l9_3106.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].negRcpFalloffEndDistance4;
l9_3106.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].angleScale;
l9_3106.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].angleOffset;
l9_3106.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].direction;
l9_3106.position=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].position;
l9_3106.color=(*sc_set0.UserUniforms).sc_PointLights[l9_3108].color;
float3 l9_3109=l9_3106.position-l9_3085.positionWS;
l9_3107.direction=normalize(l9_3109);
l9_3107.color=l9_3106.color.xyz;
l9_3107.attenuation=l9_3106.color.w;
l9_3107.attenuation*=l9_3091[(l9_3090<3) ? l9_3090 : 3];
float3 l9_3110=l9_3107.direction;
float3 l9_3111=l9_3106.direction;
float l9_3112=l9_3106.angleScale;
float l9_3113=l9_3106.angleOffset;
float l9_3114=dot(l9_3110,l9_3111);
float l9_3115=fast::clamp((l9_3114*l9_3112)+l9_3113,0.0,1.0);
float l9_3116=l9_3115*l9_3115;
l9_3107.attenuation*=l9_3116;
if (l9_3106.falloffEnabled)
{
float l9_3117=length(l9_3109);
float l9_3118=l9_3106.falloffEndDistance;
l9_3107.attenuation*=computeDistanceAttenuation(l9_3117,l9_3118);
}
l9_3090++;
LightingComponents l9_3119=l9_3088;
LightProperties l9_3120=l9_3107;
SurfaceProperties l9_3121=l9_3085;
float3 l9_3122=l9_3089;
SurfaceProperties l9_3123=l9_3121;
float3 l9_3124=l9_3120.direction;
float3 l9_3125=float3(fast::clamp(dot(l9_3123.normal,l9_3124),0.0,1.0));
l9_3119.directDiffuse+=((l9_3125*l9_3120.color)*l9_3120.attenuation);
SurfaceProperties l9_3126=l9_3121;
float3 l9_3127=l9_3120.direction;
float3 l9_3128=l9_3122;
l9_3119.directSpecular+=((calculateDirectSpecular(l9_3126,l9_3127,l9_3128)*l9_3120.color)*l9_3120.attenuation);
LightingComponents l9_3129=l9_3119;
l9_3088=l9_3129;
l9_3108++;
continue;
}
else
{
break;
}
}
}
bool l9_3130=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_3130)
{
float4 l9_3131=gl_FragCoord;
float2 l9_3132=l9_3131.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3133=l9_3132;
float2 l9_3134=l9_3133;
int l9_3135=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_3136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3136=0;
}
else
{
l9_3136=in.varStereoViewID;
}
int l9_3137=l9_3136;
l9_3135=1-l9_3137;
}
else
{
int l9_3138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3138=0;
}
else
{
l9_3138=in.varStereoViewID;
}
int l9_3139=l9_3138;
l9_3135=l9_3139;
}
int l9_3140=l9_3135;
float2 l9_3141=l9_3134;
int l9_3142=l9_3140;
float2 l9_3143=l9_3141;
int l9_3144=l9_3142;
float l9_3145=0.0;
float4 l9_3146=float4(0.0);
float2 l9_3147=l9_3143;
int l9_3148=sc_RayTracedShadowTextureLayout_tmp;
int l9_3149=l9_3144;
float l9_3150=l9_3145;
float2 l9_3151=l9_3147;
int l9_3152=l9_3148;
int l9_3153=l9_3149;
float3 l9_3154=float3(0.0);
if (l9_3152==0)
{
l9_3154=float3(l9_3151,0.0);
}
else
{
if (l9_3152==1)
{
l9_3154=float3(l9_3151.x,(l9_3151.y*0.5)+(0.5-(float(l9_3153)*0.5)),0.0);
}
else
{
l9_3154=float3(l9_3151,float(l9_3153));
}
}
float3 l9_3155=l9_3154;
float3 l9_3156=l9_3155;
float2 l9_3157=l9_3156.xy;
float l9_3158=l9_3150;
float4 l9_3159=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_3157,bias(l9_3158));
float4 l9_3160=l9_3159;
l9_3146=l9_3160;
float4 l9_3161=l9_3146;
float4 l9_3162=l9_3161;
float4 l9_3163=l9_3162;
float l9_3164=l9_3163.x;
float3 l9_3165=float3(l9_3164);
float3 l9_3166=l9_3165;
l9_3088.directDiffuse*=(float3(1.0)-l9_3166);
l9_3088.directSpecular*=(float3(1.0)-l9_3166);
}
SurfaceProperties l9_3167=l9_3085;
float3 l9_3168=l9_3167.normal;
float3 l9_3169=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_3170=l9_3168;
float3 l9_3171=l9_3170;
float l9_3172=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_3173=float2(0.0);
float l9_3174=l9_3171.x;
float l9_3175=-l9_3171.z;
float l9_3176=(l9_3174<0.0) ? (-1.0) : 1.0;
float l9_3177=l9_3176*acos(fast::clamp(l9_3175/length(float2(l9_3174,l9_3175)),-1.0,1.0));
l9_3173.x=l9_3177-1.5707964;
l9_3173.y=acos(l9_3171.y);
l9_3173/=float2(6.2831855,3.1415927);
l9_3173.y=1.0-l9_3173.y;
l9_3173.x+=(l9_3172/360.0);
l9_3173.x=fract((l9_3173.x+floor(l9_3173.x))+1.0);
float2 l9_3178=l9_3173;
float2 l9_3179=l9_3178;
float4 l9_3180=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_3181=l9_3179;
float2 l9_3182=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3183=5.0;
l9_3179=calcSeamlessPanoramicUvsForSampling(l9_3181,l9_3182,l9_3183);
}
float2 l9_3184=l9_3179;
float l9_3185=13.0;
int l9_3186=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3187=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3187=0;
}
else
{
l9_3187=in.varStereoViewID;
}
int l9_3188=l9_3187;
l9_3186=1-l9_3188;
}
else
{
int l9_3189=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3189=0;
}
else
{
l9_3189=in.varStereoViewID;
}
int l9_3190=l9_3189;
l9_3186=l9_3190;
}
int l9_3191=l9_3186;
float2 l9_3192=l9_3184;
int l9_3193=l9_3191;
float l9_3194=l9_3185;
float4 l9_3195=float4(0.0);
float2 l9_3196=l9_3192;
int l9_3197=sc_EnvmapSpecularLayout_tmp;
int l9_3198=l9_3193;
float l9_3199=l9_3194;
float2 l9_3200=l9_3196;
int l9_3201=l9_3197;
int l9_3202=l9_3198;
float3 l9_3203=float3(0.0);
if (l9_3201==0)
{
l9_3203=float3(l9_3200,0.0);
}
else
{
if (l9_3201==1)
{
l9_3203=float3(l9_3200.x,(l9_3200.y*0.5)+(0.5-(float(l9_3202)*0.5)),0.0);
}
else
{
l9_3203=float3(l9_3200,float(l9_3202));
}
}
float3 l9_3204=l9_3203;
float3 l9_3205=l9_3204;
float2 l9_3206=l9_3205.xy;
float l9_3207=l9_3199;
float4 l9_3208=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3206,bias(l9_3207));
float4 l9_3209=l9_3208;
l9_3195=l9_3209;
float4 l9_3210=l9_3195;
float4 l9_3211=l9_3210;
l9_3180=l9_3211;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_3212=l9_3179;
float2 l9_3213=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_3214=0.0;
l9_3179=calcSeamlessPanoramicUvsForSampling(l9_3212,l9_3213,l9_3214);
float2 l9_3215=l9_3179;
float l9_3216=-13.0;
int l9_3217=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_3218=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3218=0;
}
else
{
l9_3218=in.varStereoViewID;
}
int l9_3219=l9_3218;
l9_3217=1-l9_3219;
}
else
{
int l9_3220=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3220=0;
}
else
{
l9_3220=in.varStereoViewID;
}
int l9_3221=l9_3220;
l9_3217=l9_3221;
}
int l9_3222=l9_3217;
float2 l9_3223=l9_3215;
int l9_3224=l9_3222;
float l9_3225=l9_3216;
float4 l9_3226=float4(0.0);
float2 l9_3227=l9_3223;
int l9_3228=sc_EnvmapDiffuseLayout_tmp;
int l9_3229=l9_3224;
float l9_3230=l9_3225;
float2 l9_3231=l9_3227;
int l9_3232=l9_3228;
int l9_3233=l9_3229;
float3 l9_3234=float3(0.0);
if (l9_3232==0)
{
l9_3234=float3(l9_3231,0.0);
}
else
{
if (l9_3232==1)
{
l9_3234=float3(l9_3231.x,(l9_3231.y*0.5)+(0.5-(float(l9_3233)*0.5)),0.0);
}
else
{
l9_3234=float3(l9_3231,float(l9_3233));
}
}
float3 l9_3235=l9_3234;
float3 l9_3236=l9_3235;
float2 l9_3237=l9_3236.xy;
float l9_3238=l9_3230;
float4 l9_3239=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_3237,bias(l9_3238));
float4 l9_3240=l9_3239;
l9_3226=l9_3240;
float4 l9_3241=l9_3226;
float4 l9_3242=l9_3241;
l9_3180=l9_3242;
}
else
{
float2 l9_3243=l9_3179;
float l9_3244=13.0;
int l9_3245=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3246=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3246=0;
}
else
{
l9_3246=in.varStereoViewID;
}
int l9_3247=l9_3246;
l9_3245=1-l9_3247;
}
else
{
int l9_3248=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3248=0;
}
else
{
l9_3248=in.varStereoViewID;
}
int l9_3249=l9_3248;
l9_3245=l9_3249;
}
int l9_3250=l9_3245;
float2 l9_3251=l9_3243;
int l9_3252=l9_3250;
float l9_3253=l9_3244;
float4 l9_3254=float4(0.0);
float2 l9_3255=l9_3251;
int l9_3256=sc_EnvmapSpecularLayout_tmp;
int l9_3257=l9_3252;
float l9_3258=l9_3253;
float2 l9_3259=l9_3255;
int l9_3260=l9_3256;
int l9_3261=l9_3257;
float3 l9_3262=float3(0.0);
if (l9_3260==0)
{
l9_3262=float3(l9_3259,0.0);
}
else
{
if (l9_3260==1)
{
l9_3262=float3(l9_3259.x,(l9_3259.y*0.5)+(0.5-(float(l9_3261)*0.5)),0.0);
}
else
{
l9_3262=float3(l9_3259,float(l9_3261));
}
}
float3 l9_3263=l9_3262;
float3 l9_3264=l9_3263;
float2 l9_3265=l9_3264.xy;
float l9_3266=l9_3258;
float4 l9_3267=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3265,bias(l9_3266));
float4 l9_3268=l9_3267;
l9_3254=l9_3268;
float4 l9_3269=l9_3254;
float4 l9_3270=l9_3269;
l9_3180=l9_3270;
}
}
float4 l9_3271=l9_3180;
float3 l9_3272=l9_3271.xyz*(1.0/l9_3271.w);
float3 l9_3273=l9_3272*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_3169=l9_3273;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_3274=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_3275=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_3276=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_3277=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_3278=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_3279=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_3280=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_3281=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_3282=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_3283=-l9_3168;
float l9_3284=0.0;
l9_3284=l9_3283.x;
float l9_3285=l9_3283.y;
float l9_3286=l9_3283.z;
float l9_3287=l9_3284*l9_3284;
float l9_3288=l9_3285*l9_3285;
float l9_3289=l9_3286*l9_3286;
float l9_3290=l9_3284*l9_3285;
float l9_3291=l9_3285*l9_3286;
float l9_3292=l9_3284*l9_3286;
float3 l9_3293=((((((l9_3282*0.42904299)*(l9_3287-l9_3288))+((l9_3280*0.74312502)*l9_3289))+(l9_3274*0.88622701))-(l9_3280*0.24770799))+((((l9_3278*l9_3290)+(l9_3281*l9_3292))+(l9_3279*l9_3291))*0.85808599))+((((l9_3277*l9_3284)+(l9_3275*l9_3285))+(l9_3276*l9_3286))*1.0233279);
l9_3169=l9_3293*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_3294=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_3294)
{
float4 l9_3295=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_3169=mix(l9_3169,l9_3295.xyz,float3(l9_3295.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3169+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_3169.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3169+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_3169.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3169+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_3169.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_3296=l9_3168;
float3 l9_3297=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_3298;
float l9_3299;
int l9_3300=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3300<sc_LightEstimationSGCount_tmp)
{
l9_3298.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3300].color;
l9_3298.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3300].sharpness;
l9_3298.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3300].axis;
float3 l9_3301=l9_3296;
float l9_3302=dot(l9_3298.axis,l9_3301);
float l9_3303=l9_3298.sharpness;
float l9_3304=0.36000001;
float l9_3305=1.0/(4.0*l9_3304);
float l9_3306=exp(-l9_3303);
float l9_3307=l9_3306*l9_3306;
float l9_3308=1.0/l9_3303;
float l9_3309=(1.0+(2.0*l9_3307))-l9_3308;
float l9_3310=((l9_3306-l9_3307)*l9_3308)-l9_3307;
float l9_3311=sqrt(1.0-l9_3309);
float l9_3312=l9_3304*l9_3302;
float l9_3313=l9_3305*l9_3311;
float l9_3314=l9_3312+l9_3313;
float l9_3315=fast::clamp(l9_3302,0.0,1.0);
if (step(abs(l9_3312),l9_3313)>0.5)
{
l9_3299=(l9_3314*l9_3314)/l9_3311;
}
else
{
l9_3299=l9_3315;
}
l9_3315=l9_3299;
float l9_3316=(l9_3309*l9_3315)+l9_3310;
sc_SphericalGaussianLight_t l9_3317=l9_3298;
float3 l9_3318=(l9_3317.color/float3(l9_3317.sharpness))*6.2831855;
float3 l9_3319=(l9_3318*l9_3316)/float3(3.1415927);
l9_3297+=l9_3319;
l9_3300++;
continue;
}
else
{
break;
}
}
float3 l9_3320=l9_3297;
l9_3169+=l9_3320;
}
float3 l9_3321=l9_3169;
float3 l9_3322=l9_3321;
l9_3088.indirectDiffuse=l9_3322;
SurfaceProperties l9_3323=l9_3085;
float3 l9_3324=l9_3089;
float3 l9_3325=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_3326=l9_3323;
float3 l9_3327=l9_3324;
float3 l9_3328=l9_3326.normal;
float3 l9_3329=reflect(-l9_3327,l9_3328);
float3 l9_3330=l9_3328;
float3 l9_3331=l9_3329;
float l9_3332=l9_3326.roughness;
l9_3329=getSpecularDominantDir(l9_3330,l9_3331,l9_3332);
float l9_3333=l9_3326.roughness;
float l9_3334=fast::clamp(pow(l9_3333,0.66666669),0.0,1.0)*5.0;
float l9_3335=l9_3334;
float l9_3336=l9_3335;
float3 l9_3337=l9_3329;
float l9_3338=l9_3336;
float3 l9_3339=l9_3337;
float l9_3340=l9_3338;
float4 l9_3341=float4(0.0);
float3 l9_3342=l9_3339;
float l9_3343=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_3344=float2(0.0);
float l9_3345=l9_3342.x;
float l9_3346=-l9_3342.z;
float l9_3347=(l9_3345<0.0) ? (-1.0) : 1.0;
float l9_3348=l9_3347*acos(fast::clamp(l9_3346/length(float2(l9_3345,l9_3346)),-1.0,1.0));
l9_3344.x=l9_3348-1.5707964;
l9_3344.y=acos(l9_3342.y);
l9_3344/=float2(6.2831855,3.1415927);
l9_3344.y=1.0-l9_3344.y;
l9_3344.x+=(l9_3343/360.0);
l9_3344.x=fract((l9_3344.x+floor(l9_3344.x))+1.0);
float2 l9_3349=l9_3344;
float2 l9_3350=l9_3349;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_3351=floor(l9_3340);
float l9_3352=ceil(l9_3340);
float l9_3353=l9_3340-l9_3351;
float2 l9_3354=l9_3350;
float2 l9_3355=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3356=l9_3351;
float2 l9_3357=calcSeamlessPanoramicUvsForSampling(l9_3354,l9_3355,l9_3356);
float2 l9_3358=l9_3357;
float l9_3359=l9_3351;
float2 l9_3360=l9_3358;
float l9_3361=l9_3359;
int l9_3362=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3363=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3363=0;
}
else
{
l9_3363=in.varStereoViewID;
}
int l9_3364=l9_3363;
l9_3362=1-l9_3364;
}
else
{
int l9_3365=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3365=0;
}
else
{
l9_3365=in.varStereoViewID;
}
int l9_3366=l9_3365;
l9_3362=l9_3366;
}
int l9_3367=l9_3362;
float2 l9_3368=l9_3360;
int l9_3369=l9_3367;
float l9_3370=l9_3361;
float4 l9_3371=float4(0.0);
float2 l9_3372=l9_3368;
int l9_3373=sc_EnvmapSpecularLayout_tmp;
int l9_3374=l9_3369;
float l9_3375=l9_3370;
float2 l9_3376=l9_3372;
int l9_3377=l9_3373;
int l9_3378=l9_3374;
float3 l9_3379=float3(0.0);
if (l9_3377==0)
{
l9_3379=float3(l9_3376,0.0);
}
else
{
if (l9_3377==1)
{
l9_3379=float3(l9_3376.x,(l9_3376.y*0.5)+(0.5-(float(l9_3378)*0.5)),0.0);
}
else
{
l9_3379=float3(l9_3376,float(l9_3378));
}
}
float3 l9_3380=l9_3379;
float3 l9_3381=l9_3380;
float2 l9_3382=l9_3381.xy;
float l9_3383=l9_3375;
float4 l9_3384=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3382,level(l9_3383));
float4 l9_3385=l9_3384;
l9_3371=l9_3385;
float4 l9_3386=l9_3371;
float4 l9_3387=l9_3386;
float4 l9_3388=l9_3387;
float4 l9_3389=l9_3388;
float2 l9_3390=l9_3350;
float2 l9_3391=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3392=l9_3352;
float2 l9_3393=calcSeamlessPanoramicUvsForSampling(l9_3390,l9_3391,l9_3392);
float2 l9_3394=l9_3393;
float l9_3395=l9_3352;
float2 l9_3396=l9_3394;
float l9_3397=l9_3395;
int l9_3398=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3399=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3399=0;
}
else
{
l9_3399=in.varStereoViewID;
}
int l9_3400=l9_3399;
l9_3398=1-l9_3400;
}
else
{
int l9_3401=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3401=0;
}
else
{
l9_3401=in.varStereoViewID;
}
int l9_3402=l9_3401;
l9_3398=l9_3402;
}
int l9_3403=l9_3398;
float2 l9_3404=l9_3396;
int l9_3405=l9_3403;
float l9_3406=l9_3397;
float4 l9_3407=float4(0.0);
float2 l9_3408=l9_3404;
int l9_3409=sc_EnvmapSpecularLayout_tmp;
int l9_3410=l9_3405;
float l9_3411=l9_3406;
float2 l9_3412=l9_3408;
int l9_3413=l9_3409;
int l9_3414=l9_3410;
float3 l9_3415=float3(0.0);
if (l9_3413==0)
{
l9_3415=float3(l9_3412,0.0);
}
else
{
if (l9_3413==1)
{
l9_3415=float3(l9_3412.x,(l9_3412.y*0.5)+(0.5-(float(l9_3414)*0.5)),0.0);
}
else
{
l9_3415=float3(l9_3412,float(l9_3414));
}
}
float3 l9_3416=l9_3415;
float3 l9_3417=l9_3416;
float2 l9_3418=l9_3417.xy;
float l9_3419=l9_3411;
float4 l9_3420=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3418,level(l9_3419));
float4 l9_3421=l9_3420;
l9_3407=l9_3421;
float4 l9_3422=l9_3407;
float4 l9_3423=l9_3422;
float4 l9_3424=l9_3423;
float4 l9_3425=l9_3424;
l9_3341=mix(l9_3389,l9_3425,float4(l9_3353));
}
else
{
float2 l9_3426=l9_3350;
float l9_3427=l9_3340;
float2 l9_3428=l9_3426;
float l9_3429=l9_3427;
int l9_3430=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3431=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3431=0;
}
else
{
l9_3431=in.varStereoViewID;
}
int l9_3432=l9_3431;
l9_3430=1-l9_3432;
}
else
{
int l9_3433=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3433=0;
}
else
{
l9_3433=in.varStereoViewID;
}
int l9_3434=l9_3433;
l9_3430=l9_3434;
}
int l9_3435=l9_3430;
float2 l9_3436=l9_3428;
int l9_3437=l9_3435;
float l9_3438=l9_3429;
float4 l9_3439=float4(0.0);
float2 l9_3440=l9_3436;
int l9_3441=sc_EnvmapSpecularLayout_tmp;
int l9_3442=l9_3437;
float l9_3443=l9_3438;
float2 l9_3444=l9_3440;
int l9_3445=l9_3441;
int l9_3446=l9_3442;
float3 l9_3447=float3(0.0);
if (l9_3445==0)
{
l9_3447=float3(l9_3444,0.0);
}
else
{
if (l9_3445==1)
{
l9_3447=float3(l9_3444.x,(l9_3444.y*0.5)+(0.5-(float(l9_3446)*0.5)),0.0);
}
else
{
l9_3447=float3(l9_3444,float(l9_3446));
}
}
float3 l9_3448=l9_3447;
float3 l9_3449=l9_3448;
float2 l9_3450=l9_3449.xy;
float l9_3451=l9_3443;
float4 l9_3452=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3450,level(l9_3451));
float4 l9_3453=l9_3452;
l9_3439=l9_3453;
float4 l9_3454=l9_3439;
float4 l9_3455=l9_3454;
float4 l9_3456=l9_3455;
l9_3341=l9_3456;
}
float4 l9_3457=l9_3341;
float3 l9_3458=l9_3457.xyz*(1.0/l9_3457.w);
float3 l9_3459=l9_3458;
float3 l9_3460=l9_3459*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_3460+=float3(1e-06);
float3 l9_3461=l9_3460;
float3 l9_3462=l9_3461;
bool l9_3463=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_3463)
{
float4 l9_3464=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_3462=mix(l9_3462,l9_3464.xyz,float3(l9_3464.w));
}
SurfaceProperties l9_3465=l9_3326;
float l9_3466=abs(dot(l9_3328,l9_3327));
float3 l9_3467=l9_3462*envBRDFApprox(l9_3465,l9_3466);
l9_3325+=l9_3467;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_3468=l9_3323;
float3 l9_3469=l9_3324;
float l9_3470=fast::clamp(l9_3468.roughness*l9_3468.roughness,0.0099999998,1.0);
float3 l9_3471=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_3468.specColor;
sc_SphericalGaussianLight_t l9_3472;
sc_SphericalGaussianLight_t l9_3473;
sc_SphericalGaussianLight_t l9_3474;
int l9_3475=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3475<sc_LightEstimationSGCount_tmp)
{
l9_3472.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3475].color;
l9_3472.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3475].sharpness;
l9_3472.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3475].axis;
float3 l9_3476=l9_3468.normal;
float l9_3477=l9_3470;
float3 l9_3478=l9_3469;
float3 l9_3479=l9_3468.specColor;
float3 l9_3480=l9_3476;
float l9_3481=l9_3477;
l9_3473.axis=l9_3480;
float l9_3482=l9_3481*l9_3481;
l9_3473.sharpness=2.0/l9_3482;
l9_3473.color=float3(1.0/(3.1415927*l9_3482));
sc_SphericalGaussianLight_t l9_3483=l9_3473;
sc_SphericalGaussianLight_t l9_3484=l9_3483;
sc_SphericalGaussianLight_t l9_3485=l9_3484;
float3 l9_3486=l9_3478;
l9_3474.axis=reflect(-l9_3486,l9_3485.axis);
l9_3474.color=l9_3485.color;
l9_3474.sharpness=l9_3485.sharpness;
l9_3474.sharpness/=(4.0*fast::max(dot(l9_3485.axis,l9_3486),9.9999997e-05));
sc_SphericalGaussianLight_t l9_3487=l9_3474;
sc_SphericalGaussianLight_t l9_3488=l9_3487;
sc_SphericalGaussianLight_t l9_3489=l9_3488;
sc_SphericalGaussianLight_t l9_3490=l9_3472;
float l9_3491=length((l9_3489.axis*l9_3489.sharpness)+(l9_3490.axis*l9_3490.sharpness));
float3 l9_3492=(l9_3489.color*exp((l9_3491-l9_3489.sharpness)-l9_3490.sharpness))*l9_3490.color;
float l9_3493=1.0-exp((-2.0)*l9_3491);
float3 l9_3494=((l9_3492*6.2831855)*l9_3493)/float3(l9_3491);
float3 l9_3495=l9_3494;
float3 l9_3496=l9_3488.axis;
float l9_3497=l9_3477*l9_3477;
float l9_3498=fast::clamp(dot(l9_3476,l9_3496),0.0,1.0);
float l9_3499=fast::clamp(dot(l9_3476,l9_3478),0.0,1.0);
float3 l9_3500=normalize(l9_3488.axis+l9_3478);
float l9_3501=l9_3497;
float l9_3502=l9_3498;
float l9_3503=1.0/(l9_3502+sqrt(l9_3501+(((1.0-l9_3501)*l9_3502)*l9_3502)));
float l9_3504=l9_3497;
float l9_3505=l9_3499;
float l9_3506=1.0/(l9_3505+sqrt(l9_3504+(((1.0-l9_3504)*l9_3505)*l9_3505)));
l9_3495*=(l9_3503*l9_3506);
float l9_3507=pow(1.0-fast::clamp(dot(l9_3496,l9_3500),0.0,1.0),5.0);
l9_3495*=(l9_3479+((float3(1.0)-l9_3479)*l9_3507));
l9_3495*=l9_3498;
float3 l9_3508=l9_3495;
l9_3471+=l9_3508;
l9_3475++;
continue;
}
else
{
break;
}
}
float3 l9_3509=l9_3471;
l9_3325+=l9_3509;
}
float3 l9_3510=l9_3325;
l9_3088.indirectSpecular=l9_3510;
LightingComponents l9_3511=l9_3088;
LightingComponents l9_3512=l9_3511;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3512.directDiffuse=float3(0.0);
l9_3512.indirectDiffuse=float3(0.0);
float4 l9_3513=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3514=out.FragColor0;
float4 l9_3515=l9_3514;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3515.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3516=l9_3515;
l9_3513=l9_3516;
}
else
{
float4 l9_3517=gl_FragCoord;
float2 l9_3518=l9_3517.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3519=l9_3518;
float2 l9_3520=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3521=1;
int l9_3522=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3522=0;
}
else
{
l9_3522=in.varStereoViewID;
}
int l9_3523=l9_3522;
int l9_3524=l9_3523;
float3 l9_3525=float3(l9_3519,0.0);
int l9_3526=l9_3521;
int l9_3527=l9_3524;
if (l9_3526==1)
{
l9_3525.y=((2.0*l9_3525.y)+float(l9_3527))-1.0;
}
float2 l9_3528=l9_3525.xy;
l9_3520=l9_3528;
}
else
{
l9_3520=l9_3519;
}
float2 l9_3529=l9_3520;
float2 l9_3530=l9_3529;
float2 l9_3531=l9_3530;
int l9_3532=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3533=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3533=0;
}
else
{
l9_3533=in.varStereoViewID;
}
int l9_3534=l9_3533;
l9_3532=1-l9_3534;
}
else
{
int l9_3535=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3535=0;
}
else
{
l9_3535=in.varStereoViewID;
}
int l9_3536=l9_3535;
l9_3532=l9_3536;
}
int l9_3537=l9_3532;
float2 l9_3538=l9_3531;
int l9_3539=l9_3537;
float2 l9_3540=l9_3538;
int l9_3541=l9_3539;
float l9_3542=0.0;
float4 l9_3543=float4(0.0);
float2 l9_3544=l9_3540;
int l9_3545=sc_ScreenTextureLayout_tmp;
int l9_3546=l9_3541;
float l9_3547=l9_3542;
float2 l9_3548=l9_3544;
int l9_3549=l9_3545;
int l9_3550=l9_3546;
float3 l9_3551=float3(0.0);
if (l9_3549==0)
{
l9_3551=float3(l9_3548,0.0);
}
else
{
if (l9_3549==1)
{
l9_3551=float3(l9_3548.x,(l9_3548.y*0.5)+(0.5-(float(l9_3550)*0.5)),0.0);
}
else
{
l9_3551=float3(l9_3548,float(l9_3550));
}
}
float3 l9_3552=l9_3551;
float3 l9_3553=l9_3552;
float2 l9_3554=l9_3553.xy;
float l9_3555=l9_3547;
float4 l9_3556=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3554,bias(l9_3555));
float4 l9_3557=l9_3556;
l9_3543=l9_3557;
float4 l9_3558=l9_3543;
float4 l9_3559=l9_3558;
float4 l9_3560=l9_3559;
l9_3513=l9_3560;
}
float4 l9_3561=l9_3513;
float4 l9_3562=l9_3561;
float3 l9_3563=l9_3562.xyz;
float3 l9_3564;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3564=float3(pow(l9_3563.x,2.2),pow(l9_3563.y,2.2),pow(l9_3563.z,2.2));
}
else
{
l9_3564=l9_3563*l9_3563;
}
float3 l9_3565=l9_3564;
float3 l9_3566=l9_3565;
l9_3512.transmitted=l9_3566*mix(float3(1.0),l9_3072.albedo,float3(l9_3072.opacity));
l9_3072.opacity=1.0;
}
bool l9_3567=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3567=true;
}
SurfaceProperties l9_3568=l9_3072;
LightingComponents l9_3569=l9_3512;
bool l9_3570=l9_3567;
float3 l9_3571=float3(0.0);
bool l9_3572=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_3572)
{
l9_3571=l9_3568.albedo*(l9_3569.directDiffuse+(l9_3569.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_3571=l9_3568.albedo*(l9_3569.directDiffuse+(l9_3569.indirectDiffuse*l9_3568.ao));
}
float3 l9_3573=l9_3569.directSpecular+(l9_3569.indirectSpecular*l9_3568.specularAo);
float3 l9_3574=l9_3568.emissive;
float3 l9_3575=l9_3569.transmitted;
if (l9_3570)
{
float l9_3576=l9_3568.opacity;
l9_3571*=srgbToLinear(l9_3576);
}
float3 l9_3577=((l9_3571+l9_3573)+l9_3574)+l9_3575;
float3 l9_3578=l9_3577;
float4 l9_3579=float4(l9_3578,l9_3072.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_3580=l9_3579.xyz;
float l9_3581=1.8;
float l9_3582=1.4;
float l9_3583=0.5;
float l9_3584=1.5;
float3 l9_3585=(l9_3580*((l9_3580*l9_3581)+float3(l9_3582)))/((l9_3580*((l9_3580*l9_3581)+float3(l9_3583)))+float3(l9_3584));
l9_3579=float4(l9_3585.x,l9_3585.y,l9_3585.z,l9_3579.w);
}
float3 l9_3586=l9_3579.xyz;
float l9_3587=l9_3586.x;
float l9_3588=l9_3586.y;
float l9_3589=l9_3586.z;
float3 l9_3590=float3(linearToSrgb(l9_3587),linearToSrgb(l9_3588),linearToSrgb(l9_3589));
l9_3579=float4(l9_3590.x,l9_3590.y,l9_3590.z,l9_3579.w);
float4 l9_3591=l9_3579;
float4 l9_3592=l9_3591;
l9_3592=fast::max(l9_3592,float4(0.0));
l9_3050=l9_3592;
l9_706=l9_3050;
l9_710=l9_706;
}
l9_703=l9_710;
param_4=l9_703;
param_5=param_4;
}
Output_N42=param_5;
float4 param_7=Output_N42;
Output_Color0=param_7;
float4 param_8=Output_Color0;
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_8=float4(param_8.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_3593=param_8;
float4 l9_3594=float4(0.0);
float4 l9_3595=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3596=out.FragColor0;
float4 l9_3597=l9_3596;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3597.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3598=l9_3597;
l9_3595=l9_3598;
}
else
{
float4 l9_3599=gl_FragCoord;
float2 l9_3600=l9_3599.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3601=l9_3600;
float2 l9_3602=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3603=1;
int l9_3604=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3604=0;
}
else
{
l9_3604=in.varStereoViewID;
}
int l9_3605=l9_3604;
int l9_3606=l9_3605;
float3 l9_3607=float3(l9_3601,0.0);
int l9_3608=l9_3603;
int l9_3609=l9_3606;
if (l9_3608==1)
{
l9_3607.y=((2.0*l9_3607.y)+float(l9_3609))-1.0;
}
float2 l9_3610=l9_3607.xy;
l9_3602=l9_3610;
}
else
{
l9_3602=l9_3601;
}
float2 l9_3611=l9_3602;
float2 l9_3612=l9_3611;
float2 l9_3613=l9_3612;
int l9_3614=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3615=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3615=0;
}
else
{
l9_3615=in.varStereoViewID;
}
int l9_3616=l9_3615;
l9_3614=1-l9_3616;
}
else
{
int l9_3617=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3617=0;
}
else
{
l9_3617=in.varStereoViewID;
}
int l9_3618=l9_3617;
l9_3614=l9_3618;
}
int l9_3619=l9_3614;
float2 l9_3620=l9_3613;
int l9_3621=l9_3619;
float2 l9_3622=l9_3620;
int l9_3623=l9_3621;
float l9_3624=0.0;
float4 l9_3625=float4(0.0);
float2 l9_3626=l9_3622;
int l9_3627=sc_ScreenTextureLayout_tmp;
int l9_3628=l9_3623;
float l9_3629=l9_3624;
float2 l9_3630=l9_3626;
int l9_3631=l9_3627;
int l9_3632=l9_3628;
float3 l9_3633=float3(0.0);
if (l9_3631==0)
{
l9_3633=float3(l9_3630,0.0);
}
else
{
if (l9_3631==1)
{
l9_3633=float3(l9_3630.x,(l9_3630.y*0.5)+(0.5-(float(l9_3632)*0.5)),0.0);
}
else
{
l9_3633=float3(l9_3630,float(l9_3632));
}
}
float3 l9_3634=l9_3633;
float3 l9_3635=l9_3634;
float2 l9_3636=l9_3635.xy;
float l9_3637=l9_3629;
float4 l9_3638=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3636,bias(l9_3637));
float4 l9_3639=l9_3638;
l9_3625=l9_3639;
float4 l9_3640=l9_3625;
float4 l9_3641=l9_3640;
float4 l9_3642=l9_3641;
l9_3595=l9_3642;
}
float4 l9_3643=l9_3595;
float4 l9_3644=l9_3643;
float3 l9_3645=l9_3644.xyz;
float3 l9_3646=l9_3645;
float3 l9_3647=l9_3593.xyz;
float3 l9_3648=definedBlend(l9_3646,l9_3647,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_3594=float4(l9_3648.x,l9_3648.y,l9_3648.z,l9_3594.w);
float3 l9_3649=mix(l9_3645,l9_3594.xyz,float3(l9_3593.w));
l9_3594=float4(l9_3649.x,l9_3649.y,l9_3649.z,l9_3594.w);
l9_3594.w=1.0;
float4 l9_3650=l9_3594;
param_8=l9_3650;
}
else
{
float4 l9_3651=param_8;
float4 l9_3652=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3652=float4(mix(float3(1.0),l9_3651.xyz,float3(l9_3651.w)),l9_3651.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_3653=l9_3651.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3653=fast::clamp(l9_3653,0.0,1.0);
}
l9_3652=float4(l9_3651.xyz*l9_3653,l9_3653);
}
else
{
l9_3652=l9_3651;
}
}
float4 l9_3654=l9_3652;
param_8=l9_3654;
}
}
float4 l9_3655=param_8;
Output_Color0=l9_3655;
float4 l9_3656=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_3656=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_3656=float4(0.0);
}
float4 l9_3657=l9_3656;
float4 Cost=l9_3657;
if (Cost.w>0.0)
{
Output_Color0=Cost;
}
float4 param_9=Output_Color0;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_9.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_9;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssParticle
{
float3 Position;
float3 Velocity;
float4 Color;
float Size;
float Age;
float Life;
float Mass;
float3x3 Matrix;
bool Dead;
float4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float SpawnOffset;
float Seed;
float2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
int2 Index2D;
float2 Coord2D;
float2 Ratio2D;
float3 Force;
bool Spawned;
float CopyId;
float SpawnAmount;
float BurstAmount;
float BurstPeriod;
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
float gComponentTime;
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
int vfxNumCopies;
int vfxBatchEnable[32];
int vfxEmitParticle[32];
float4x4 vfxModelMatrix[32];
float4 renderTarget0Size;
float4 renderTarget0Dims;
float4 renderTarget0View;
float4 renderTarget1Size;
float4 renderTarget1Dims;
float4 renderTarget1View;
float4 renderTarget2Size;
float4 renderTarget2Dims;
float4 renderTarget2View;
float4 renderTarget3Size;
float4 renderTarget3Dims;
float4 renderTarget3View;
float3 vfxLocalAabbMin;
float3 vfxLocalAabbMax;
float vfxCameraAspect;
float vfxCameraNear;
float vfxCameraFar;
float3 vfxCameraUp;
float3 vfxCameraForward;
float3 vfxCameraRight;
float4x4 vfxProjectionMatrix;
float4x4 vfxProjectionMatrixInverse;
float4x4 vfxViewMatrix;
float4x4 vfxViewMatrixInverse;
float4x4 vfxViewProjectionMatrix;
float4x4 vfxViewProjectionMatrixInverse;
int vfxFrame;
int vfxOffsetInstancesRead;
int vfxOffsetInstancesWrite;
float2 vfxTargetSizeRead;
float2 vfxTargetSizeWrite;
int vfxTargetWidth;
float velocityStretch;
int isIdle;
float4 flipbookTexSize;
float4 flipbookTexDims;
float4 flipbookTexView;
float3x3 flipbookTexTransform;
float4 flipbookTexUvMinMax;
float4 flipbookTexBorderColor;
int isAttracting;
float4 colorMix;
float intensity;
float4 repelflipbookTexSize;
float4 repelflipbookTexDims;
float4 repelflipbookTexView;
float3x3 repelflipbookTexTransform;
float4 repelflipbookTexUvMinMax;
float4 repelflipbookTexBorderColor;
float Port_Input1_N362;
float Port_Value_N170;
float3 Port_Input1_N420;
float Port_RangeMinA_N171;
float Port_RangeMaxA_N171;
float Port_RangeMinB_N171;
float Port_RangeMaxB_N171;
float Port_Import_N356;
float Port_Input1_N358;
float Port_AlphaTestThreshold_N039;
float2 Port_SpriteCount_N045;
float Port_MaxFrames_N045;
float Port_Rotation_N159;
float2 Port_Center_N159;
float Port_RangeMinA_N156;
float Port_RangeMaxA_N156;
float Port_RangeMinB_N156;
float Port_RangeMaxB_N156;
float Port_SecondOffset_N045;
float3 Port_Input0_N038;
float2 Port_Input1_N031;
float Port_Input1_N246;
float Port_Input2_N246;
float2 Port_Input1_N035;
float Port_Input1_N036;
float3 Port_Emissive_N026;
float Port_Metallic_N026;
float Port_Roughness_N026;
float3 Port_AO_N026;
float3 Port_SpecularAO_N026;
float2 Port_SpriteCount_N167;
float Port_MaxFrames_N167;
float Port_SecondOffset_N167;
float3 Port_Emissive_N258;
float Port_Metallic_N258;
float Port_Roughness_N258;
float3 Port_AO_N258;
float3 Port_SpecularAO_N258;
};
struct sc_Set0
{
texture2d<float> flipbookTex [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> renderTarget0 [[id(2)]];
texture2d<float> renderTarget1 [[id(3)]];
texture2d<float> renderTarget2 [[id(4)]];
texture2d<float> renderTarget3 [[id(5)]];
texture2d<float> repelflipbookTex [[id(6)]];
texture2d<float> sc_EnvmapDiffuse [[id(7)]];
texture2d<float> sc_EnvmapSpecular [[id(8)]];
texture2d<float> sc_RayTracedAoTexture [[id(17)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(18)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(19)]];
texture2d<float> sc_RayTracedShadowTexture [[id(20)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
sampler flipbookTexSmpSC [[id(25)]];
sampler intensityTextureSmpSC [[id(26)]];
sampler renderTarget0SmpSC [[id(27)]];
sampler renderTarget1SmpSC [[id(28)]];
sampler renderTarget2SmpSC [[id(29)]];
sampler renderTarget3SmpSC [[id(30)]];
sampler repelflipbookTexSmpSC [[id(31)]];
sampler sc_EnvmapDiffuseSmpSC [[id(32)]];
sampler sc_EnvmapSpecularSmpSC [[id(33)]];
sampler sc_RayTracedAoTextureSmpSC [[id(35)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(36)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(37)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(38)]];
sampler sc_SSAOTextureSmpSC [[id(39)]];
sampler sc_ScreenTextureSmpSC [[id(40)]];
constant userUniformsObj* UserUniforms [[id(43)]];
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
float2 varShadowTex [[user(locn6)]];
int varStereoViewID [[user(locn7)]];
float varClipDistance [[user(locn8)]];
float4 varColor [[user(locn9)]];
int Interp_Particle_Index [[user(locn10)]];
float3 Interp_Particle_Force [[user(locn11)]];
float2 Interp_Particle_Coord [[user(locn12)]];
float Interp_Particle_SpawnIndex [[user(locn13)]];
float Interp_Particle_NextBurstTime [[user(locn14)]];
float3 Interp_Particle_Position [[user(locn15)]];
float3 Interp_Particle_Velocity [[user(locn16)]];
float Interp_Particle_Life [[user(locn17)]];
float Interp_Particle_Age [[user(locn18)]];
float Interp_Particle_Size [[user(locn19)]];
float4 Interp_Particle_Color [[user(locn20)]];
float4 Interp_Particle_Quaternion [[user(locn21)]];
float Interp_Particle_Mass [[user(locn22)]];
float gParticlesDebug [[user(locn23)]];
float2 ParticleUV [[user(locn24)]];
};
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]])
{
main_recv_out out={};
float3 ngsTempNormal=float3(0.0);
float4 ngsTempTangent=float4(0.0);
float2 ngsTempUVCoord0=float2(0.0);
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
discard_fragment();
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ngsTempUVCoord0=in.varPackedTex.xy;
ngsTempNormal=in.varNormal;
ngsTempTangent=float4(in.varTangent.xyz.x,in.varTangent.xyz.y,in.varTangent.xyz.z,ngsTempTangent.w);
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
gParticle.Mass=in.Interp_Particle_Mass;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/1600];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexTangent_WorldSpace=normalize(ngsTempTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(ngsTempNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace);
Globals.Surface_UVCoord0=ngsTempUVCoord0;
int param=in.Interp_Particle_Index;
ssParticle param_1=gParticle;
int l9_0=param/1600;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%1600;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(1600*((param/1600)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%512,l9_1/512);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/1600.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(512.0,4.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/1599.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/1599.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(511.0,3.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
float2 l9_13=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_14=dot(l9_13,float2(0.98253,0.72662002));
l9_14=sin(l9_14)*479.371;
l9_14=fract(l9_14);
l9_14=floor(l9_14*10000.0)*9.9999997e-05;
float l9_15=l9_14;
param_1.TimeShift=l9_15;
param_1.SpawnOffset=param_1.Ratio1D*8.0;
ssParticle l9_16=param_1;
int l9_17=l9_0;
float l9_18;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_18=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_17];
}
else
{
l9_18=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_19=l9_18;
l9_16.Seed=(l9_16.Ratio1D*0.97637898)+0.151235;
l9_16.Seed+=(floor(((((l9_19-l9_16.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_16.Seed=fract(abs(l9_16.Seed));
int2 l9_20=int2(l9_16.Index1D%400,l9_16.Index1D/400);
l9_16.Seed2000=(float2(l9_20)+float2(1.0))/float2(399.0);
param_1=l9_16;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float param_2=1.0;
ssGlobals param_3=Globals;
float l9_21=0.0;
float l9_22=float((*sc_set0.UserUniforms).isIdle!=0);
l9_21=l9_22;
param_2=l9_21;
if ((param_2*1.0)!=0.0)
{
float2 l9_23=float2(0.0);
l9_23=param_3.Surface_UVCoord0;
float2 l9_24=float2(0.0);
l9_24=l9_23*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_25=float2(0.0);
l9_25=l9_24-float2(1.0);
float l9_26=0.0;
l9_26=dot(l9_25,l9_25);
float l9_27=0.0;
l9_27=fast::clamp(l9_26+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_28=0.0;
l9_28=1.0-l9_27;
float l9_29=0.0;
float l9_30;
if (l9_28<=0.0)
{
l9_30=0.0;
}
else
{
l9_30=sqrt(l9_28);
}
l9_29=l9_30;
float3 l9_31=float3(0.0);
l9_31=float3(l9_25.x,l9_25.y,l9_31.z);
l9_31.z=l9_29;
float l9_32=0.0;
l9_32=distance(l9_23,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_33=0.0;
l9_33=float(l9_32<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_34=float3(0.0);
l9_34=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_31,float3(l9_33));
float3 l9_35=float3(0.0);
l9_35=l9_34;
float3 l9_36=l9_35;
float l9_37=(*sc_set0.UserUniforms).Port_Roughness_N026;
ssGlobals l9_38=param_3;
l9_38.BumpedNormal=float3x3(float3(l9_38.VertexTangent_WorldSpace),float3(l9_38.VertexBinormal_WorldSpace),float3(l9_38.VertexNormal_WorldSpace))*l9_36;
float3 l9_39=l9_38.PositionWS;
float3 l9_40=l9_38.BumpedNormal;
float l9_41=l9_37;
float3 l9_42=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_39);
if (dot(l9_42,l9_40)>=(-0.050000001))
{
uint3 l9_43=uint3(round((l9_39-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_43.x,l9_43.y,l9_43.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_44=l9_40;
float l9_45=dot(abs(l9_44),float3(1.0));
l9_44/=float3(l9_45);
float l9_46=fast::clamp(-l9_44.z,0.0,1.0);
float2 l9_47=l9_44.xy;
float l9_48;
if (l9_44.x>=0.0)
{
l9_48=l9_46;
}
else
{
l9_48=-l9_46;
}
l9_47.x+=l9_48;
float l9_49;
if (l9_44.y>=0.0)
{
l9_49=l9_46;
}
else
{
l9_49=-l9_46;
}
l9_47.y+=l9_49;
float2 l9_50=l9_47;
float2 l9_51=l9_50;
uint2 l9_52=uint2(as_type<uint>(half2(float2(l9_51.x,0.0))),as_type<uint>(half2(float2(l9_51.y,0.0))));
out.normal_and_more=uint4(l9_52.x,l9_52.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_53;
if (l9_41<0.0)
{
l9_53=1023u;
}
else
{
l9_53=uint(fast::clamp(l9_41,0.0,1.0)*1000.0);
}
uint l9_54=l9_53;
l9_54 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_54;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float l9_55=1.0;
ssGlobals l9_56=param_3;
float l9_57=0.0;
float l9_58=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_57=l9_58;
l9_55=l9_57;
if ((l9_55*1.0)!=0.0)
{
float2 l9_59=float2(0.0);
l9_59=l9_56.Surface_UVCoord0;
float2 l9_60=float2(0.0);
l9_60=l9_59*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_61=float2(0.0);
l9_61=l9_60-float2(1.0);
float l9_62=0.0;
l9_62=dot(l9_61,l9_61);
float l9_63=0.0;
l9_63=fast::clamp(l9_62+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_64=0.0;
l9_64=1.0-l9_63;
float l9_65=0.0;
float l9_66;
if (l9_64<=0.0)
{
l9_66=0.0;
}
else
{
l9_66=sqrt(l9_64);
}
l9_65=l9_66;
float3 l9_67=float3(0.0);
l9_67=float3(l9_61.x,l9_61.y,l9_67.z);
l9_67.z=l9_65;
float l9_68=0.0;
l9_68=distance(l9_59,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_69=0.0;
l9_69=float(l9_68<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_70=float3(0.0);
l9_70=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_67,float3(l9_69));
float3 l9_71=float3(0.0);
l9_71=l9_70;
float3 l9_72=l9_71;
float l9_73=(*sc_set0.UserUniforms).Port_Roughness_N026;
ssGlobals l9_74=l9_56;
l9_74.BumpedNormal=float3x3(float3(l9_74.VertexTangent_WorldSpace),float3(l9_74.VertexBinormal_WorldSpace),float3(l9_74.VertexNormal_WorldSpace))*l9_72;
float3 l9_75=l9_74.PositionWS;
float3 l9_76=l9_74.BumpedNormal;
float l9_77=l9_73;
float3 l9_78=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_75);
if (dot(l9_78,l9_76)>=(-0.050000001))
{
uint3 l9_79=uint3(round((l9_75-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_79.x,l9_79.y,l9_79.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_80=l9_76;
float l9_81=dot(abs(l9_80),float3(1.0));
l9_80/=float3(l9_81);
float l9_82=fast::clamp(-l9_80.z,0.0,1.0);
float2 l9_83=l9_80.xy;
float l9_84;
if (l9_80.x>=0.0)
{
l9_84=l9_82;
}
else
{
l9_84=-l9_82;
}
l9_83.x+=l9_84;
float l9_85;
if (l9_80.y>=0.0)
{
l9_85=l9_82;
}
else
{
l9_85=-l9_82;
}
l9_83.y+=l9_85;
float2 l9_86=l9_83;
float2 l9_87=l9_86;
uint2 l9_88=uint2(as_type<uint>(half2(float2(l9_87.x,0.0))),as_type<uint>(half2(float2(l9_87.y,0.0))));
out.normal_and_more=uint4(l9_88.x,l9_88.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_89;
if (l9_77<0.0)
{
l9_89=1023u;
}
else
{
l9_89=uint(fast::clamp(l9_77,0.0,1.0)*1000.0);
}
uint l9_90=l9_89;
l9_90 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_90;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float2 l9_91=float2(0.0);
l9_91=l9_56.Surface_UVCoord0;
float2 l9_92=float2(0.0);
l9_92=l9_91*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_93=float2(0.0);
l9_93=l9_92-float2(1.0);
float l9_94=0.0;
l9_94=dot(l9_93,l9_93);
float l9_95=0.0;
l9_95=fast::clamp(l9_94+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_96=0.0;
l9_96=1.0-l9_95;
float l9_97=0.0;
float l9_98;
if (l9_96<=0.0)
{
l9_98=0.0;
}
else
{
l9_98=sqrt(l9_96);
}
l9_97=l9_98;
float3 l9_99=float3(0.0);
l9_99=float3(l9_93.x,l9_93.y,l9_99.z);
l9_99.z=l9_97;
float l9_100=0.0;
l9_100=distance(l9_91,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_101=0.0;
l9_101=float(l9_100<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_102=float3(0.0);
l9_102=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_99,float3(l9_101));
float3 l9_103=float3(0.0);
l9_103=l9_102;
float3 l9_104=l9_103;
float l9_105=(*sc_set0.UserUniforms).Port_Roughness_N258;
ssGlobals l9_106=l9_56;
l9_106.BumpedNormal=float3x3(float3(l9_106.VertexTangent_WorldSpace),float3(l9_106.VertexBinormal_WorldSpace),float3(l9_106.VertexNormal_WorldSpace))*l9_104;
float3 l9_107=l9_106.PositionWS;
float3 l9_108=l9_106.BumpedNormal;
float l9_109=l9_105;
float3 l9_110=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_107);
if (dot(l9_110,l9_108)>=(-0.050000001))
{
uint3 l9_111=uint3(round((l9_107-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_111.x,l9_111.y,l9_111.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_112=l9_108;
float l9_113=dot(abs(l9_112),float3(1.0));
l9_112/=float3(l9_113);
float l9_114=fast::clamp(-l9_112.z,0.0,1.0);
float2 l9_115=l9_112.xy;
float l9_116;
if (l9_112.x>=0.0)
{
l9_116=l9_114;
}
else
{
l9_116=-l9_114;
}
l9_115.x+=l9_116;
float l9_117;
if (l9_112.y>=0.0)
{
l9_117=l9_114;
}
else
{
l9_117=-l9_114;
}
l9_115.y+=l9_117;
float2 l9_118=l9_115;
float2 l9_119=l9_118;
uint2 l9_120=uint2(as_type<uint>(half2(float2(l9_119.x,0.0))),as_type<uint>(half2(float2(l9_119.y,0.0))));
out.normal_and_more=uint4(l9_120.x,l9_120.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_121;
if (l9_109<0.0)
{
l9_121=1023u;
}
else
{
l9_121=uint(fast::clamp(l9_109,0.0,1.0)*1000.0);
}
uint l9_122=l9_121;
l9_122 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_122;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
}
return out;
}
} // RECEIVER MODE SHADER
