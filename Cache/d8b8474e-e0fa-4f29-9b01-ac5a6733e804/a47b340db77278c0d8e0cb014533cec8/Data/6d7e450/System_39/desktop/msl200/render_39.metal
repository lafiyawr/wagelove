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
gParticle.CopyId=float(InstanceID/1000);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%1000;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(1000*((param/1000)+1))-1;
int l9_0=param_1.Index1D;
int2 l9_1=int2(l9_0%512,l9_0/512);
param_1.Index2D=l9_1;
int l9_2=param_1.Index1D;
float l9_3=(float(l9_2)+0.5)/1000.0;
param_1.Coord1D=l9_3;
int2 l9_4=param_1.Index2D;
float2 l9_5=(float2(l9_4)+float2(0.5))/float2(512.0,2.0);
param_1.Coord2D=l9_5;
int l9_6=param_1.Index1D;
float l9_7=float(l9_6)/999.0;
param_1.Ratio1D=l9_7;
int l9_8=param_1.Index1DPerCopy;
float l9_9=float(l9_8)/999.0;
param_1.Ratio1DPerCopy=l9_9;
int2 l9_10=param_1.Index2D;
float2 l9_11=float2(l9_10)/float2(511.0,1.0);
param_1.Ratio2D=l9_11;
param_1.Seed=0.0;
float2 l9_12=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_13=dot(l9_12,float2(0.98253,0.72662002));
l9_13=sin(l9_13)*479.371;
l9_13=fract(l9_13);
l9_13=floor(l9_13*10000.0)*9.9999997e-05;
float l9_14=l9_13;
param_1.TimeShift=l9_14;
param_1.TimeShift=0.0;
param_1.SpawnOffset=0.0;
ssParticle l9_15=param_1;
l9_15.Seed=(l9_15.Ratio1D*0.97637898)+0.151235;
int2 l9_16=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_16)+float2(1.0))/float2(399.0);
param_1=l9_15;
gParticle=param_1;
int offsetPixelId=(UserUniforms.vfxOffsetInstancesRead+InstanceID)*4;
int param_2=offsetPixelId;
int param_3=UserUniforms.vfxTargetWidth;
int l9_17=param_2-((param_2/param_3)*param_3);
int2 Index2D=int2(l9_17,offsetPixelId/UserUniforms.vfxTargetWidth);
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
int l9_18=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_19=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_19=0;
}
else
{
l9_19=gl_InstanceIndex%2;
}
int l9_20=l9_19;
l9_18=1-l9_20;
}
else
{
int l9_21=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_21=0;
}
else
{
l9_21=gl_InstanceIndex%2;
}
int l9_22=l9_21;
l9_18=l9_22;
}
int l9_23=l9_18;
float2 l9_24=param_4;
int l9_25=l9_23;
float2 l9_26=l9_24;
int l9_27=l9_25;
float l9_28=0.0;
float4 l9_29=float4(0.0);
float2 l9_30=l9_26;
int l9_31=l9_27;
float l9_32=l9_28;
float4 l9_33=float4(0.0);
float2 l9_34=l9_30;
int l9_35=renderTarget0Layout_tmp;
int l9_36=l9_31;
float l9_37=l9_32;
float2 l9_38=l9_34;
int l9_39=l9_35;
int l9_40=l9_36;
float3 l9_41=float3(0.0);
if (l9_39==0)
{
l9_41=float3(l9_38,0.0);
}
else
{
if (l9_39==1)
{
l9_41=float3(l9_38.x,(l9_38.y*0.5)+(0.5-(float(l9_40)*0.5)),0.0);
}
else
{
l9_41=float3(l9_38,float(l9_40));
}
}
float3 l9_42=l9_41;
float3 l9_43=l9_42;
float2 l9_44=l9_43.xy;
float l9_45=l9_37;
float4 l9_46=renderTarget0.sample(renderTarget0SmpSC,l9_44,level(l9_45));
float4 l9_47=l9_46;
l9_33=l9_47;
float4 l9_48=l9_33;
l9_29=l9_48;
float4 l9_49=l9_29;
float4 l9_50=l9_49;
float4 l9_51=l9_50;
float4 renderTarget0Sample=l9_51;
float4 l9_52=renderTarget0Sample;
bool l9_53=dot(abs(l9_52),float4(1.0))<9.9999997e-06;
bool l9_54;
if (!l9_53)
{
int l9_55=gl_InstanceIndex;
l9_54=!(UserUniforms.vfxBatchEnable[l9_55/1000]!=0);
}
else
{
l9_54=l9_53;
}
if (l9_54)
{
return false;
}
Scalar0=renderTarget0Sample.x;
Scalar1=renderTarget0Sample.y;
Scalar2=renderTarget0Sample.z;
Scalar3=renderTarget0Sample.w;
float2 param_5=uv;
int l9_56=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_57=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_57=0;
}
else
{
l9_57=gl_InstanceIndex%2;
}
int l9_58=l9_57;
l9_56=1-l9_58;
}
else
{
int l9_59=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_59=0;
}
else
{
l9_59=gl_InstanceIndex%2;
}
int l9_60=l9_59;
l9_56=l9_60;
}
int l9_61=l9_56;
float2 l9_62=param_5;
int l9_63=l9_61;
float2 l9_64=l9_62;
int l9_65=l9_63;
float l9_66=0.0;
float4 l9_67=float4(0.0);
float2 l9_68=l9_64;
int l9_69=l9_65;
float l9_70=l9_66;
float4 l9_71=float4(0.0);
float2 l9_72=l9_68;
int l9_73=renderTarget1Layout_tmp;
int l9_74=l9_69;
float l9_75=l9_70;
float2 l9_76=l9_72;
int l9_77=l9_73;
int l9_78=l9_74;
float3 l9_79=float3(0.0);
if (l9_77==0)
{
l9_79=float3(l9_76,0.0);
}
else
{
if (l9_77==1)
{
l9_79=float3(l9_76.x,(l9_76.y*0.5)+(0.5-(float(l9_78)*0.5)),0.0);
}
else
{
l9_79=float3(l9_76,float(l9_78));
}
}
float3 l9_80=l9_79;
float3 l9_81=l9_80;
float2 l9_82=l9_81.xy;
float l9_83=l9_75;
float4 l9_84=renderTarget1.sample(renderTarget1SmpSC,l9_82,level(l9_83));
float4 l9_85=l9_84;
l9_71=l9_85;
float4 l9_86=l9_71;
l9_67=l9_86;
float4 l9_87=l9_67;
float4 l9_88=l9_87;
float4 l9_89=l9_88;
float4 renderTarget1Sample=l9_89;
Scalar4=renderTarget1Sample.x;
Scalar5=renderTarget1Sample.y;
Scalar6=renderTarget1Sample.z;
Scalar7=renderTarget1Sample.w;
float2 param_6=uv;
int l9_90=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_91=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_91=0;
}
else
{
l9_91=gl_InstanceIndex%2;
}
int l9_92=l9_91;
l9_90=1-l9_92;
}
else
{
int l9_93=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_93=0;
}
else
{
l9_93=gl_InstanceIndex%2;
}
int l9_94=l9_93;
l9_90=l9_94;
}
int l9_95=l9_90;
float2 l9_96=param_6;
int l9_97=l9_95;
float2 l9_98=l9_96;
int l9_99=l9_97;
float l9_100=0.0;
float4 l9_101=float4(0.0);
float2 l9_102=l9_98;
int l9_103=l9_99;
float l9_104=l9_100;
float4 l9_105=float4(0.0);
float2 l9_106=l9_102;
int l9_107=renderTarget2Layout_tmp;
int l9_108=l9_103;
float l9_109=l9_104;
float2 l9_110=l9_106;
int l9_111=l9_107;
int l9_112=l9_108;
float3 l9_113=float3(0.0);
if (l9_111==0)
{
l9_113=float3(l9_110,0.0);
}
else
{
if (l9_111==1)
{
l9_113=float3(l9_110.x,(l9_110.y*0.5)+(0.5-(float(l9_112)*0.5)),0.0);
}
else
{
l9_113=float3(l9_110,float(l9_112));
}
}
float3 l9_114=l9_113;
float3 l9_115=l9_114;
float2 l9_116=l9_115.xy;
float l9_117=l9_109;
float4 l9_118=renderTarget2.sample(renderTarget2SmpSC,l9_116,level(l9_117));
float4 l9_119=l9_118;
l9_105=l9_119;
float4 l9_120=l9_105;
l9_101=l9_120;
float4 l9_121=l9_101;
float4 l9_122=l9_121;
float4 l9_123=l9_122;
float4 renderTarget2Sample=l9_123;
Scalar8=renderTarget2Sample.x;
Scalar9=renderTarget2Sample.y;
Scalar10=renderTarget2Sample.z;
Scalar11=renderTarget2Sample.w;
float2 param_7=uv;
int l9_124=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_125=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_125=0;
}
else
{
l9_125=gl_InstanceIndex%2;
}
int l9_126=l9_125;
l9_124=1-l9_126;
}
else
{
int l9_127=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_127=0;
}
else
{
l9_127=gl_InstanceIndex%2;
}
int l9_128=l9_127;
l9_124=l9_128;
}
int l9_129=l9_124;
float2 l9_130=param_7;
int l9_131=l9_129;
float2 l9_132=l9_130;
int l9_133=l9_131;
float l9_134=0.0;
float4 l9_135=float4(0.0);
float2 l9_136=l9_132;
int l9_137=l9_133;
float l9_138=l9_134;
float4 l9_139=float4(0.0);
float2 l9_140=l9_136;
int l9_141=renderTarget3Layout_tmp;
int l9_142=l9_137;
float l9_143=l9_138;
float2 l9_144=l9_140;
int l9_145=l9_141;
int l9_146=l9_142;
float3 l9_147=float3(0.0);
if (l9_145==0)
{
l9_147=float3(l9_144,0.0);
}
else
{
if (l9_145==1)
{
l9_147=float3(l9_144.x,(l9_144.y*0.5)+(0.5-(float(l9_146)*0.5)),0.0);
}
else
{
l9_147=float3(l9_144,float(l9_146));
}
}
float3 l9_148=l9_147;
float3 l9_149=l9_148;
float2 l9_150=l9_149.xy;
float l9_151=l9_143;
float4 l9_152=renderTarget3.sample(renderTarget3SmpSC,l9_150,level(l9_151));
float4 l9_153=l9_152;
l9_139=l9_153;
float4 l9_154=l9_139;
l9_135=l9_154;
float4 l9_155=l9_135;
float4 l9_156=l9_155;
float4 l9_157=l9_156;
float4 renderTarget3Sample=l9_157;
Scalar12=renderTarget3Sample.x;
Scalar13=renderTarget3Sample.y;
Scalar14=renderTarget3Sample.z;
Scalar15=renderTarget3Sample.w;
float4 param_8=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_9=-1000.0;
float param_10=1000.0;
float4 l9_158=param_8;
float l9_159=param_9;
float l9_160=param_10;
float l9_161=0.99998999;
float4 l9_162=l9_158;
#if (1)
{
l9_162=floor((l9_162*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_163=dot(l9_162,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_164=l9_163;
float l9_165=0.0;
float l9_166=l9_161;
float l9_167=l9_159;
float l9_168=l9_160;
float l9_169=l9_167+(((l9_164-l9_165)*(l9_168-l9_167))/(l9_166-l9_165));
float l9_170=l9_169;
float l9_171=l9_170;
gParticle.Position.x=l9_171;
float4 param_11=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_12=-1000.0;
float param_13=1000.0;
float4 l9_172=param_11;
float l9_173=param_12;
float l9_174=param_13;
float l9_175=0.99998999;
float4 l9_176=l9_172;
#if (1)
{
l9_176=floor((l9_176*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_177=dot(l9_176,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_178=l9_177;
float l9_179=0.0;
float l9_180=l9_175;
float l9_181=l9_173;
float l9_182=l9_174;
float l9_183=l9_181+(((l9_178-l9_179)*(l9_182-l9_181))/(l9_180-l9_179));
float l9_184=l9_183;
float l9_185=l9_184;
gParticle.Position.y=l9_185;
float4 param_14=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_15=-1000.0;
float param_16=1000.0;
float4 l9_186=param_14;
float l9_187=param_15;
float l9_188=param_16;
float l9_189=0.99998999;
float4 l9_190=l9_186;
#if (1)
{
l9_190=floor((l9_190*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_191=dot(l9_190,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_192=l9_191;
float l9_193=0.0;
float l9_194=l9_189;
float l9_195=l9_187;
float l9_196=l9_188;
float l9_197=l9_195+(((l9_192-l9_193)*(l9_196-l9_195))/(l9_194-l9_193));
float l9_198=l9_197;
float l9_199=l9_198;
gParticle.Position.z=l9_199;
float4 param_17=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_18=-1000.0;
float param_19=1000.0;
float4 l9_200=param_17;
float l9_201=param_18;
float l9_202=param_19;
float l9_203=0.99998999;
float4 l9_204=l9_200;
#if (1)
{
l9_204=floor((l9_204*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_205=dot(l9_204,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_206=l9_205;
float l9_207=0.0;
float l9_208=l9_203;
float l9_209=l9_201;
float l9_210=l9_202;
float l9_211=l9_209+(((l9_206-l9_207)*(l9_210-l9_209))/(l9_208-l9_207));
float l9_212=l9_211;
float l9_213=l9_212;
gParticle.Velocity.x=l9_213;
uv=Coord+(Offset*1.0);
float2 param_20=uv;
int l9_214=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_215=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_215=0;
}
else
{
l9_215=gl_InstanceIndex%2;
}
int l9_216=l9_215;
l9_214=1-l9_216;
}
else
{
int l9_217=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_217=0;
}
else
{
l9_217=gl_InstanceIndex%2;
}
int l9_218=l9_217;
l9_214=l9_218;
}
int l9_219=l9_214;
float2 l9_220=param_20;
int l9_221=l9_219;
float2 l9_222=l9_220;
int l9_223=l9_221;
float l9_224=0.0;
float4 l9_225=float4(0.0);
float2 l9_226=l9_222;
int l9_227=l9_223;
float l9_228=l9_224;
float4 l9_229=float4(0.0);
float2 l9_230=l9_226;
int l9_231=renderTarget0Layout_tmp;
int l9_232=l9_227;
float l9_233=l9_228;
float2 l9_234=l9_230;
int l9_235=l9_231;
int l9_236=l9_232;
float3 l9_237=float3(0.0);
if (l9_235==0)
{
l9_237=float3(l9_234,0.0);
}
else
{
if (l9_235==1)
{
l9_237=float3(l9_234.x,(l9_234.y*0.5)+(0.5-(float(l9_236)*0.5)),0.0);
}
else
{
l9_237=float3(l9_234,float(l9_236));
}
}
float3 l9_238=l9_237;
float3 l9_239=l9_238;
float2 l9_240=l9_239.xy;
float l9_241=l9_233;
float4 l9_242=renderTarget0.sample(renderTarget0SmpSC,l9_240,level(l9_241));
float4 l9_243=l9_242;
l9_229=l9_243;
float4 l9_244=l9_229;
l9_225=l9_244;
float4 l9_245=l9_225;
float4 l9_246=l9_245;
float4 l9_247=l9_246;
float4 renderTarget0Sample_1=l9_247;
Scalar0=renderTarget0Sample_1.x;
Scalar1=renderTarget0Sample_1.y;
Scalar2=renderTarget0Sample_1.z;
Scalar3=renderTarget0Sample_1.w;
float2 param_21=uv;
int l9_248=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_249=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_249=0;
}
else
{
l9_249=gl_InstanceIndex%2;
}
int l9_250=l9_249;
l9_248=1-l9_250;
}
else
{
int l9_251=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_251=0;
}
else
{
l9_251=gl_InstanceIndex%2;
}
int l9_252=l9_251;
l9_248=l9_252;
}
int l9_253=l9_248;
float2 l9_254=param_21;
int l9_255=l9_253;
float2 l9_256=l9_254;
int l9_257=l9_255;
float l9_258=0.0;
float4 l9_259=float4(0.0);
float2 l9_260=l9_256;
int l9_261=l9_257;
float l9_262=l9_258;
float4 l9_263=float4(0.0);
float2 l9_264=l9_260;
int l9_265=renderTarget1Layout_tmp;
int l9_266=l9_261;
float l9_267=l9_262;
float2 l9_268=l9_264;
int l9_269=l9_265;
int l9_270=l9_266;
float3 l9_271=float3(0.0);
if (l9_269==0)
{
l9_271=float3(l9_268,0.0);
}
else
{
if (l9_269==1)
{
l9_271=float3(l9_268.x,(l9_268.y*0.5)+(0.5-(float(l9_270)*0.5)),0.0);
}
else
{
l9_271=float3(l9_268,float(l9_270));
}
}
float3 l9_272=l9_271;
float3 l9_273=l9_272;
float2 l9_274=l9_273.xy;
float l9_275=l9_267;
float4 l9_276=renderTarget1.sample(renderTarget1SmpSC,l9_274,level(l9_275));
float4 l9_277=l9_276;
l9_263=l9_277;
float4 l9_278=l9_263;
l9_259=l9_278;
float4 l9_279=l9_259;
float4 l9_280=l9_279;
float4 l9_281=l9_280;
float4 renderTarget1Sample_1=l9_281;
Scalar4=renderTarget1Sample_1.x;
Scalar5=renderTarget1Sample_1.y;
Scalar6=renderTarget1Sample_1.z;
Scalar7=renderTarget1Sample_1.w;
float2 param_22=uv;
int l9_282=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_283=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_283=0;
}
else
{
l9_283=gl_InstanceIndex%2;
}
int l9_284=l9_283;
l9_282=1-l9_284;
}
else
{
int l9_285=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_285=0;
}
else
{
l9_285=gl_InstanceIndex%2;
}
int l9_286=l9_285;
l9_282=l9_286;
}
int l9_287=l9_282;
float2 l9_288=param_22;
int l9_289=l9_287;
float2 l9_290=l9_288;
int l9_291=l9_289;
float l9_292=0.0;
float4 l9_293=float4(0.0);
float2 l9_294=l9_290;
int l9_295=l9_291;
float l9_296=l9_292;
float4 l9_297=float4(0.0);
float2 l9_298=l9_294;
int l9_299=renderTarget2Layout_tmp;
int l9_300=l9_295;
float l9_301=l9_296;
float2 l9_302=l9_298;
int l9_303=l9_299;
int l9_304=l9_300;
float3 l9_305=float3(0.0);
if (l9_303==0)
{
l9_305=float3(l9_302,0.0);
}
else
{
if (l9_303==1)
{
l9_305=float3(l9_302.x,(l9_302.y*0.5)+(0.5-(float(l9_304)*0.5)),0.0);
}
else
{
l9_305=float3(l9_302,float(l9_304));
}
}
float3 l9_306=l9_305;
float3 l9_307=l9_306;
float2 l9_308=l9_307.xy;
float l9_309=l9_301;
float4 l9_310=renderTarget2.sample(renderTarget2SmpSC,l9_308,level(l9_309));
float4 l9_311=l9_310;
l9_297=l9_311;
float4 l9_312=l9_297;
l9_293=l9_312;
float4 l9_313=l9_293;
float4 l9_314=l9_313;
float4 l9_315=l9_314;
float4 renderTarget2Sample_1=l9_315;
Scalar8=renderTarget2Sample_1.x;
Scalar9=renderTarget2Sample_1.y;
Scalar10=renderTarget2Sample_1.z;
Scalar11=renderTarget2Sample_1.w;
float2 param_23=uv;
int l9_316=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_317=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_317=0;
}
else
{
l9_317=gl_InstanceIndex%2;
}
int l9_318=l9_317;
l9_316=1-l9_318;
}
else
{
int l9_319=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_319=0;
}
else
{
l9_319=gl_InstanceIndex%2;
}
int l9_320=l9_319;
l9_316=l9_320;
}
int l9_321=l9_316;
float2 l9_322=param_23;
int l9_323=l9_321;
float2 l9_324=l9_322;
int l9_325=l9_323;
float l9_326=0.0;
float4 l9_327=float4(0.0);
float2 l9_328=l9_324;
int l9_329=l9_325;
float l9_330=l9_326;
float4 l9_331=float4(0.0);
float2 l9_332=l9_328;
int l9_333=renderTarget3Layout_tmp;
int l9_334=l9_329;
float l9_335=l9_330;
float2 l9_336=l9_332;
int l9_337=l9_333;
int l9_338=l9_334;
float3 l9_339=float3(0.0);
if (l9_337==0)
{
l9_339=float3(l9_336,0.0);
}
else
{
if (l9_337==1)
{
l9_339=float3(l9_336.x,(l9_336.y*0.5)+(0.5-(float(l9_338)*0.5)),0.0);
}
else
{
l9_339=float3(l9_336,float(l9_338));
}
}
float3 l9_340=l9_339;
float3 l9_341=l9_340;
float2 l9_342=l9_341.xy;
float l9_343=l9_335;
float4 l9_344=renderTarget3.sample(renderTarget3SmpSC,l9_342,level(l9_343));
float4 l9_345=l9_344;
l9_331=l9_345;
float4 l9_346=l9_331;
l9_327=l9_346;
float4 l9_347=l9_327;
float4 l9_348=l9_347;
float4 l9_349=l9_348;
float4 renderTarget3Sample_1=l9_349;
Scalar12=renderTarget3Sample_1.x;
Scalar13=renderTarget3Sample_1.y;
Scalar14=renderTarget3Sample_1.z;
Scalar15=renderTarget3Sample_1.w;
float4 param_24=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_25=-1000.0;
float param_26=1000.0;
float4 l9_350=param_24;
float l9_351=param_25;
float l9_352=param_26;
float l9_353=0.99998999;
float4 l9_354=l9_350;
#if (1)
{
l9_354=floor((l9_354*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_355=dot(l9_354,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_356=l9_355;
float l9_357=0.0;
float l9_358=l9_353;
float l9_359=l9_351;
float l9_360=l9_352;
float l9_361=l9_359+(((l9_356-l9_357)*(l9_360-l9_359))/(l9_358-l9_357));
float l9_362=l9_361;
float l9_363=l9_362;
gParticle.Velocity.y=l9_363;
float4 param_27=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_28=-1000.0;
float param_29=1000.0;
float4 l9_364=param_27;
float l9_365=param_28;
float l9_366=param_29;
float l9_367=0.99998999;
float4 l9_368=l9_364;
#if (1)
{
l9_368=floor((l9_368*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_369=dot(l9_368,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_370=l9_369;
float l9_371=0.0;
float l9_372=l9_367;
float l9_373=l9_365;
float l9_374=l9_366;
float l9_375=l9_373+(((l9_370-l9_371)*(l9_374-l9_373))/(l9_372-l9_371));
float l9_376=l9_375;
float l9_377=l9_376;
gParticle.Velocity.z=l9_377;
float4 param_30=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_31=0.0;
float param_32=8.0;
float4 l9_378=param_30;
float l9_379=param_31;
float l9_380=param_32;
float l9_381=0.99998999;
float4 l9_382=l9_378;
#if (1)
{
l9_382=floor((l9_382*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_383=dot(l9_382,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_384=l9_383;
float l9_385=0.0;
float l9_386=l9_381;
float l9_387=l9_379;
float l9_388=l9_380;
float l9_389=l9_387+(((l9_384-l9_385)*(l9_388-l9_387))/(l9_386-l9_385));
float l9_390=l9_389;
float l9_391=l9_390;
gParticle.Life=l9_391;
float4 param_33=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_34=0.0;
float param_35=8.0;
float4 l9_392=param_33;
float l9_393=param_34;
float l9_394=param_35;
float l9_395=0.99998999;
float4 l9_396=l9_392;
#if (1)
{
l9_396=floor((l9_396*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_397=dot(l9_396,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_398=l9_397;
float l9_399=0.0;
float l9_400=l9_395;
float l9_401=l9_393;
float l9_402=l9_394;
float l9_403=l9_401+(((l9_398-l9_399)*(l9_402-l9_401))/(l9_400-l9_399));
float l9_404=l9_403;
float l9_405=l9_404;
gParticle.Age=l9_405;
uv=Coord+(Offset*2.0);
float2 param_36=uv;
int l9_406=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_407=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_407=0;
}
else
{
l9_407=gl_InstanceIndex%2;
}
int l9_408=l9_407;
l9_406=1-l9_408;
}
else
{
int l9_409=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_409=0;
}
else
{
l9_409=gl_InstanceIndex%2;
}
int l9_410=l9_409;
l9_406=l9_410;
}
int l9_411=l9_406;
float2 l9_412=param_36;
int l9_413=l9_411;
float2 l9_414=l9_412;
int l9_415=l9_413;
float l9_416=0.0;
float4 l9_417=float4(0.0);
float2 l9_418=l9_414;
int l9_419=l9_415;
float l9_420=l9_416;
float4 l9_421=float4(0.0);
float2 l9_422=l9_418;
int l9_423=renderTarget0Layout_tmp;
int l9_424=l9_419;
float l9_425=l9_420;
float2 l9_426=l9_422;
int l9_427=l9_423;
int l9_428=l9_424;
float3 l9_429=float3(0.0);
if (l9_427==0)
{
l9_429=float3(l9_426,0.0);
}
else
{
if (l9_427==1)
{
l9_429=float3(l9_426.x,(l9_426.y*0.5)+(0.5-(float(l9_428)*0.5)),0.0);
}
else
{
l9_429=float3(l9_426,float(l9_428));
}
}
float3 l9_430=l9_429;
float3 l9_431=l9_430;
float2 l9_432=l9_431.xy;
float l9_433=l9_425;
float4 l9_434=renderTarget0.sample(renderTarget0SmpSC,l9_432,level(l9_433));
float4 l9_435=l9_434;
l9_421=l9_435;
float4 l9_436=l9_421;
l9_417=l9_436;
float4 l9_437=l9_417;
float4 l9_438=l9_437;
float4 l9_439=l9_438;
float4 renderTarget0Sample_2=l9_439;
Scalar0=renderTarget0Sample_2.x;
Scalar1=renderTarget0Sample_2.y;
Scalar2=renderTarget0Sample_2.z;
Scalar3=renderTarget0Sample_2.w;
float2 param_37=uv;
int l9_440=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_441=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_441=0;
}
else
{
l9_441=gl_InstanceIndex%2;
}
int l9_442=l9_441;
l9_440=1-l9_442;
}
else
{
int l9_443=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_443=0;
}
else
{
l9_443=gl_InstanceIndex%2;
}
int l9_444=l9_443;
l9_440=l9_444;
}
int l9_445=l9_440;
float2 l9_446=param_37;
int l9_447=l9_445;
float2 l9_448=l9_446;
int l9_449=l9_447;
float l9_450=0.0;
float4 l9_451=float4(0.0);
float2 l9_452=l9_448;
int l9_453=l9_449;
float l9_454=l9_450;
float4 l9_455=float4(0.0);
float2 l9_456=l9_452;
int l9_457=renderTarget1Layout_tmp;
int l9_458=l9_453;
float l9_459=l9_454;
float2 l9_460=l9_456;
int l9_461=l9_457;
int l9_462=l9_458;
float3 l9_463=float3(0.0);
if (l9_461==0)
{
l9_463=float3(l9_460,0.0);
}
else
{
if (l9_461==1)
{
l9_463=float3(l9_460.x,(l9_460.y*0.5)+(0.5-(float(l9_462)*0.5)),0.0);
}
else
{
l9_463=float3(l9_460,float(l9_462));
}
}
float3 l9_464=l9_463;
float3 l9_465=l9_464;
float2 l9_466=l9_465.xy;
float l9_467=l9_459;
float4 l9_468=renderTarget1.sample(renderTarget1SmpSC,l9_466,level(l9_467));
float4 l9_469=l9_468;
l9_455=l9_469;
float4 l9_470=l9_455;
l9_451=l9_470;
float4 l9_471=l9_451;
float4 l9_472=l9_471;
float4 l9_473=l9_472;
float4 renderTarget1Sample_2=l9_473;
Scalar4=renderTarget1Sample_2.x;
Scalar5=renderTarget1Sample_2.y;
Scalar6=renderTarget1Sample_2.z;
Scalar7=renderTarget1Sample_2.w;
float2 param_38=uv;
int l9_474=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_475=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_475=0;
}
else
{
l9_475=gl_InstanceIndex%2;
}
int l9_476=l9_475;
l9_474=1-l9_476;
}
else
{
int l9_477=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_477=0;
}
else
{
l9_477=gl_InstanceIndex%2;
}
int l9_478=l9_477;
l9_474=l9_478;
}
int l9_479=l9_474;
float2 l9_480=param_38;
int l9_481=l9_479;
float2 l9_482=l9_480;
int l9_483=l9_481;
float l9_484=0.0;
float4 l9_485=float4(0.0);
float2 l9_486=l9_482;
int l9_487=l9_483;
float l9_488=l9_484;
float4 l9_489=float4(0.0);
float2 l9_490=l9_486;
int l9_491=renderTarget2Layout_tmp;
int l9_492=l9_487;
float l9_493=l9_488;
float2 l9_494=l9_490;
int l9_495=l9_491;
int l9_496=l9_492;
float3 l9_497=float3(0.0);
if (l9_495==0)
{
l9_497=float3(l9_494,0.0);
}
else
{
if (l9_495==1)
{
l9_497=float3(l9_494.x,(l9_494.y*0.5)+(0.5-(float(l9_496)*0.5)),0.0);
}
else
{
l9_497=float3(l9_494,float(l9_496));
}
}
float3 l9_498=l9_497;
float3 l9_499=l9_498;
float2 l9_500=l9_499.xy;
float l9_501=l9_493;
float4 l9_502=renderTarget2.sample(renderTarget2SmpSC,l9_500,level(l9_501));
float4 l9_503=l9_502;
l9_489=l9_503;
float4 l9_504=l9_489;
l9_485=l9_504;
float4 l9_505=l9_485;
float4 l9_506=l9_505;
float4 l9_507=l9_506;
float4 renderTarget2Sample_2=l9_507;
Scalar8=renderTarget2Sample_2.x;
Scalar9=renderTarget2Sample_2.y;
Scalar10=renderTarget2Sample_2.z;
Scalar11=renderTarget2Sample_2.w;
float2 param_39=uv;
int l9_508=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_509=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_509=0;
}
else
{
l9_509=gl_InstanceIndex%2;
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
l9_511=gl_InstanceIndex%2;
}
int l9_512=l9_511;
l9_508=l9_512;
}
int l9_513=l9_508;
float2 l9_514=param_39;
int l9_515=l9_513;
float2 l9_516=l9_514;
int l9_517=l9_515;
float l9_518=0.0;
float4 l9_519=float4(0.0);
float2 l9_520=l9_516;
int l9_521=l9_517;
float l9_522=l9_518;
float4 l9_523=float4(0.0);
float2 l9_524=l9_520;
int l9_525=renderTarget3Layout_tmp;
int l9_526=l9_521;
float l9_527=l9_522;
float2 l9_528=l9_524;
int l9_529=l9_525;
int l9_530=l9_526;
float3 l9_531=float3(0.0);
if (l9_529==0)
{
l9_531=float3(l9_528,0.0);
}
else
{
if (l9_529==1)
{
l9_531=float3(l9_528.x,(l9_528.y*0.5)+(0.5-(float(l9_530)*0.5)),0.0);
}
else
{
l9_531=float3(l9_528,float(l9_530));
}
}
float3 l9_532=l9_531;
float3 l9_533=l9_532;
float2 l9_534=l9_533.xy;
float l9_535=l9_527;
float4 l9_536=renderTarget3.sample(renderTarget3SmpSC,l9_534,level(l9_535));
float4 l9_537=l9_536;
l9_523=l9_537;
float4 l9_538=l9_523;
l9_519=l9_538;
float4 l9_539=l9_519;
float4 l9_540=l9_539;
float4 l9_541=l9_540;
float4 renderTarget3Sample_2=l9_541;
Scalar12=renderTarget3Sample_2.x;
Scalar13=renderTarget3Sample_2.y;
Scalar14=renderTarget3Sample_2.z;
Scalar15=renderTarget3Sample_2.w;
float4 param_40=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_41=0.0;
float param_42=100.0;
float4 l9_542=param_40;
float l9_543=param_41;
float l9_544=param_42;
float l9_545=0.99998999;
float4 l9_546=l9_542;
#if (1)
{
l9_546=floor((l9_546*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_547=dot(l9_546,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_548=l9_547;
float l9_549=0.0;
float l9_550=l9_545;
float l9_551=l9_543;
float l9_552=l9_544;
float l9_553=l9_551+(((l9_548-l9_549)*(l9_552-l9_551))/(l9_550-l9_549));
float l9_554=l9_553;
float l9_555=l9_554;
gParticle.Size=l9_555;
float4 param_43=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_44=0.0;
float param_45=1.00001;
float4 l9_556=param_43;
float l9_557=param_44;
float l9_558=param_45;
float l9_559=0.99998999;
float4 l9_560=l9_556;
#if (1)
{
l9_560=floor((l9_560*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_561=dot(l9_560,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_562=l9_561;
float l9_563=0.0;
float l9_564=l9_559;
float l9_565=l9_557;
float l9_566=l9_558;
float l9_567=l9_565+(((l9_562-l9_563)*(l9_566-l9_565))/(l9_564-l9_563));
float l9_568=l9_567;
float l9_569=l9_568;
gParticle.Color.x=l9_569;
float4 param_46=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_47=0.0;
float param_48=1.00001;
float4 l9_570=param_46;
float l9_571=param_47;
float l9_572=param_48;
float l9_573=0.99998999;
float4 l9_574=l9_570;
#if (1)
{
l9_574=floor((l9_574*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_575=dot(l9_574,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_576=l9_575;
float l9_577=0.0;
float l9_578=l9_573;
float l9_579=l9_571;
float l9_580=l9_572;
float l9_581=l9_579+(((l9_576-l9_577)*(l9_580-l9_579))/(l9_578-l9_577));
float l9_582=l9_581;
float l9_583=l9_582;
gParticle.Color.y=l9_583;
float4 param_49=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_50=0.0;
float param_51=1.00001;
float4 l9_584=param_49;
float l9_585=param_50;
float l9_586=param_51;
float l9_587=0.99998999;
float4 l9_588=l9_584;
#if (1)
{
l9_588=floor((l9_588*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_589=dot(l9_588,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_590=l9_589;
float l9_591=0.0;
float l9_592=l9_587;
float l9_593=l9_585;
float l9_594=l9_586;
float l9_595=l9_593+(((l9_590-l9_591)*(l9_594-l9_593))/(l9_592-l9_591));
float l9_596=l9_595;
float l9_597=l9_596;
gParticle.Color.z=l9_597;
uv=Coord+(Offset*3.0);
float2 param_52=uv;
int l9_598=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_599=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_599=0;
}
else
{
l9_599=gl_InstanceIndex%2;
}
int l9_600=l9_599;
l9_598=1-l9_600;
}
else
{
int l9_601=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_601=0;
}
else
{
l9_601=gl_InstanceIndex%2;
}
int l9_602=l9_601;
l9_598=l9_602;
}
int l9_603=l9_598;
float2 l9_604=param_52;
int l9_605=l9_603;
float2 l9_606=l9_604;
int l9_607=l9_605;
float l9_608=0.0;
float4 l9_609=float4(0.0);
float2 l9_610=l9_606;
int l9_611=l9_607;
float l9_612=l9_608;
float4 l9_613=float4(0.0);
float2 l9_614=l9_610;
int l9_615=renderTarget0Layout_tmp;
int l9_616=l9_611;
float l9_617=l9_612;
float2 l9_618=l9_614;
int l9_619=l9_615;
int l9_620=l9_616;
float3 l9_621=float3(0.0);
if (l9_619==0)
{
l9_621=float3(l9_618,0.0);
}
else
{
if (l9_619==1)
{
l9_621=float3(l9_618.x,(l9_618.y*0.5)+(0.5-(float(l9_620)*0.5)),0.0);
}
else
{
l9_621=float3(l9_618,float(l9_620));
}
}
float3 l9_622=l9_621;
float3 l9_623=l9_622;
float2 l9_624=l9_623.xy;
float l9_625=l9_617;
float4 l9_626=renderTarget0.sample(renderTarget0SmpSC,l9_624,level(l9_625));
float4 l9_627=l9_626;
l9_613=l9_627;
float4 l9_628=l9_613;
l9_609=l9_628;
float4 l9_629=l9_609;
float4 l9_630=l9_629;
float4 l9_631=l9_630;
float4 renderTarget0Sample_3=l9_631;
Scalar0=renderTarget0Sample_3.x;
Scalar1=renderTarget0Sample_3.y;
Scalar2=renderTarget0Sample_3.z;
Scalar3=renderTarget0Sample_3.w;
float2 param_53=uv;
int l9_632=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_633=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_633=0;
}
else
{
l9_633=gl_InstanceIndex%2;
}
int l9_634=l9_633;
l9_632=1-l9_634;
}
else
{
int l9_635=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_635=0;
}
else
{
l9_635=gl_InstanceIndex%2;
}
int l9_636=l9_635;
l9_632=l9_636;
}
int l9_637=l9_632;
float2 l9_638=param_53;
int l9_639=l9_637;
float2 l9_640=l9_638;
int l9_641=l9_639;
float l9_642=0.0;
float4 l9_643=float4(0.0);
float2 l9_644=l9_640;
int l9_645=l9_641;
float l9_646=l9_642;
float4 l9_647=float4(0.0);
float2 l9_648=l9_644;
int l9_649=renderTarget1Layout_tmp;
int l9_650=l9_645;
float l9_651=l9_646;
float2 l9_652=l9_648;
int l9_653=l9_649;
int l9_654=l9_650;
float3 l9_655=float3(0.0);
if (l9_653==0)
{
l9_655=float3(l9_652,0.0);
}
else
{
if (l9_653==1)
{
l9_655=float3(l9_652.x,(l9_652.y*0.5)+(0.5-(float(l9_654)*0.5)),0.0);
}
else
{
l9_655=float3(l9_652,float(l9_654));
}
}
float3 l9_656=l9_655;
float3 l9_657=l9_656;
float2 l9_658=l9_657.xy;
float l9_659=l9_651;
float4 l9_660=renderTarget1.sample(renderTarget1SmpSC,l9_658,level(l9_659));
float4 l9_661=l9_660;
l9_647=l9_661;
float4 l9_662=l9_647;
l9_643=l9_662;
float4 l9_663=l9_643;
float4 l9_664=l9_663;
float4 l9_665=l9_664;
float4 renderTarget1Sample_3=l9_665;
Scalar4=renderTarget1Sample_3.x;
Scalar5=renderTarget1Sample_3.y;
Scalar6=renderTarget1Sample_3.z;
Scalar7=renderTarget1Sample_3.w;
float2 param_54=uv;
int l9_666=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_667=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_667=0;
}
else
{
l9_667=gl_InstanceIndex%2;
}
int l9_668=l9_667;
l9_666=1-l9_668;
}
else
{
int l9_669=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_669=0;
}
else
{
l9_669=gl_InstanceIndex%2;
}
int l9_670=l9_669;
l9_666=l9_670;
}
int l9_671=l9_666;
float2 l9_672=param_54;
int l9_673=l9_671;
float2 l9_674=l9_672;
int l9_675=l9_673;
float l9_676=0.0;
float4 l9_677=float4(0.0);
float2 l9_678=l9_674;
int l9_679=l9_675;
float l9_680=l9_676;
float4 l9_681=float4(0.0);
float2 l9_682=l9_678;
int l9_683=renderTarget2Layout_tmp;
int l9_684=l9_679;
float l9_685=l9_680;
float2 l9_686=l9_682;
int l9_687=l9_683;
int l9_688=l9_684;
float3 l9_689=float3(0.0);
if (l9_687==0)
{
l9_689=float3(l9_686,0.0);
}
else
{
if (l9_687==1)
{
l9_689=float3(l9_686.x,(l9_686.y*0.5)+(0.5-(float(l9_688)*0.5)),0.0);
}
else
{
l9_689=float3(l9_686,float(l9_688));
}
}
float3 l9_690=l9_689;
float3 l9_691=l9_690;
float2 l9_692=l9_691.xy;
float l9_693=l9_685;
float4 l9_694=renderTarget2.sample(renderTarget2SmpSC,l9_692,level(l9_693));
float4 l9_695=l9_694;
l9_681=l9_695;
float4 l9_696=l9_681;
l9_677=l9_696;
float4 l9_697=l9_677;
float4 l9_698=l9_697;
float4 l9_699=l9_698;
float4 renderTarget2Sample_3=l9_699;
Scalar8=renderTarget2Sample_3.x;
Scalar9=renderTarget2Sample_3.y;
Scalar10=renderTarget2Sample_3.z;
Scalar11=renderTarget2Sample_3.w;
float2 param_55=uv;
int l9_700=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_701=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_701=0;
}
else
{
l9_701=gl_InstanceIndex%2;
}
int l9_702=l9_701;
l9_700=1-l9_702;
}
else
{
int l9_703=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_703=0;
}
else
{
l9_703=gl_InstanceIndex%2;
}
int l9_704=l9_703;
l9_700=l9_704;
}
int l9_705=l9_700;
float2 l9_706=param_55;
int l9_707=l9_705;
float2 l9_708=l9_706;
int l9_709=l9_707;
float l9_710=0.0;
float4 l9_711=float4(0.0);
float2 l9_712=l9_708;
int l9_713=l9_709;
float l9_714=l9_710;
float4 l9_715=float4(0.0);
float2 l9_716=l9_712;
int l9_717=renderTarget3Layout_tmp;
int l9_718=l9_713;
float l9_719=l9_714;
float2 l9_720=l9_716;
int l9_721=l9_717;
int l9_722=l9_718;
float3 l9_723=float3(0.0);
if (l9_721==0)
{
l9_723=float3(l9_720,0.0);
}
else
{
if (l9_721==1)
{
l9_723=float3(l9_720.x,(l9_720.y*0.5)+(0.5-(float(l9_722)*0.5)),0.0);
}
else
{
l9_723=float3(l9_720,float(l9_722));
}
}
float3 l9_724=l9_723;
float3 l9_725=l9_724;
float2 l9_726=l9_725.xy;
float l9_727=l9_719;
float4 l9_728=renderTarget3.sample(renderTarget3SmpSC,l9_726,level(l9_727));
float4 l9_729=l9_728;
l9_715=l9_729;
float4 l9_730=l9_715;
l9_711=l9_730;
float4 l9_731=l9_711;
float4 l9_732=l9_731;
float4 l9_733=l9_732;
float4 renderTarget3Sample_3=l9_733;
Scalar12=renderTarget3Sample_3.x;
Scalar13=renderTarget3Sample_3.y;
Scalar14=renderTarget3Sample_3.z;
Scalar15=renderTarget3Sample_3.w;
float4 param_56=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_57=0.0;
float param_58=1.00001;
float4 l9_734=param_56;
float l9_735=param_57;
float l9_736=param_58;
float l9_737=0.99998999;
float4 l9_738=l9_734;
#if (1)
{
l9_738=floor((l9_738*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_739=dot(l9_738,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_740=l9_739;
float l9_741=0.0;
float l9_742=l9_737;
float l9_743=l9_735;
float l9_744=l9_736;
float l9_745=l9_743+(((l9_740-l9_741)*(l9_744-l9_743))/(l9_742-l9_741));
float l9_746=l9_745;
float l9_747=l9_746;
gParticle.Color.w=l9_747;
float4 param_59=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_60=0.0;
float param_61=1000.0;
float4 l9_748=param_59;
float l9_749=param_60;
float l9_750=param_61;
float l9_751=0.99998999;
float4 l9_752=l9_748;
#if (1)
{
l9_752=floor((l9_752*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_753=dot(l9_752,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_754=l9_753;
float l9_755=0.0;
float l9_756=l9_751;
float l9_757=l9_749;
float l9_758=l9_750;
float l9_759=l9_757+(((l9_754-l9_755)*(l9_758-l9_757))/(l9_756-l9_755));
float l9_760=l9_759;
float l9_761=l9_760;
gParticle.Mass=l9_761;
float2 param_62=float2(Scalar8,Scalar9);
float param_63=-1.0;
float param_64=1.0;
float2 l9_762=param_62;
float l9_763=param_63;
float l9_764=param_64;
float l9_765=0.99998999;
float2 l9_766=l9_762;
#if (1)
{
l9_766=floor((l9_766*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_767=dot(l9_766,float2(1.0,0.0039215689));
float l9_768=l9_767;
float l9_769=0.0;
float l9_770=l9_765;
float l9_771=l9_763;
float l9_772=l9_764;
float l9_773=l9_771+(((l9_768-l9_769)*(l9_772-l9_771))/(l9_770-l9_769));
float l9_774=l9_773;
float l9_775=l9_774;
gParticle.Quaternion.x=l9_775;
float2 param_65=float2(Scalar10,Scalar11);
float param_66=-1.0;
float param_67=1.0;
float2 l9_776=param_65;
float l9_777=param_66;
float l9_778=param_67;
float l9_779=0.99998999;
float2 l9_780=l9_776;
#if (1)
{
l9_780=floor((l9_780*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_781=dot(l9_780,float2(1.0,0.0039215689));
float l9_782=l9_781;
float l9_783=0.0;
float l9_784=l9_779;
float l9_785=l9_777;
float l9_786=l9_778;
float l9_787=l9_785+(((l9_782-l9_783)*(l9_786-l9_785))/(l9_784-l9_783));
float l9_788=l9_787;
float l9_789=l9_788;
gParticle.Quaternion.y=l9_789;
float2 param_68=float2(Scalar12,Scalar13);
float param_69=-1.0;
float param_70=1.0;
float2 l9_790=param_68;
float l9_791=param_69;
float l9_792=param_70;
float l9_793=0.99998999;
float2 l9_794=l9_790;
#if (1)
{
l9_794=floor((l9_794*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_795=dot(l9_794,float2(1.0,0.0039215689));
float l9_796=l9_795;
float l9_797=0.0;
float l9_798=l9_793;
float l9_799=l9_791;
float l9_800=l9_792;
float l9_801=l9_799+(((l9_796-l9_797)*(l9_800-l9_799))/(l9_798-l9_797));
float l9_802=l9_801;
float l9_803=l9_802;
gParticle.Quaternion.z=l9_803;
float2 param_71=float2(Scalar14,Scalar15);
float param_72=-1.0;
float param_73=1.0;
float2 l9_804=param_71;
float l9_805=param_72;
float l9_806=param_73;
float l9_807=0.99998999;
float2 l9_808=l9_804;
#if (1)
{
l9_808=floor((l9_808*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_809=dot(l9_808,float2(1.0,0.0039215689));
float l9_810=l9_809;
float l9_811=0.0;
float l9_812=l9_807;
float l9_813=l9_805;
float l9_814=l9_806;
float l9_815=l9_813+(((l9_810-l9_811)*(l9_814-l9_813))/(l9_812-l9_811));
float l9_816=l9_815;
float l9_817=l9_816;
gParticle.Quaternion.w=l9_817;
float4 param_74=gParticle.Quaternion;
param_74=normalize(param_74.yzwx);
float l9_818=param_74.x*param_74.x;
float l9_819=param_74.y*param_74.y;
float l9_820=param_74.z*param_74.z;
float l9_821=param_74.x*param_74.z;
float l9_822=param_74.x*param_74.y;
float l9_823=param_74.y*param_74.z;
float l9_824=param_74.w*param_74.x;
float l9_825=param_74.w*param_74.y;
float l9_826=param_74.w*param_74.z;
float3x3 l9_827=float3x3(float3(1.0-(2.0*(l9_819+l9_820)),2.0*(l9_822+l9_826),2.0*(l9_821-l9_825)),float3(2.0*(l9_822-l9_826),1.0-(2.0*(l9_818+l9_820)),2.0*(l9_823+l9_824)),float3(2.0*(l9_821+l9_825),2.0*(l9_823-l9_824),1.0-(2.0*(l9_818+l9_819))));
gParticle.Matrix=l9_827;
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
bool l9_4=l9_3>=(1000*((*sc_set0.UserUniforms).vfxNumCopies+1));
ssParticle gParticle;
bool l9_5;
if (!l9_4)
{
int l9_6=gl_InstanceIndex;
l9_5=((*sc_set0.UserUniforms).vfxBatchEnable[l9_6/1000]!=0)==false;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_17/1000];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
gParticle.Age=Globals.gTimeElapsedShifted;
Globals.Surface_UVCoord0=v.texture0;
if (gParticle.Size<9.9999997e-06)
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
float4 l9_18=param_3;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_19=dot(l9_18,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_20=l9_19;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_20;
}
}
float4 l9_21=float4(param_3.x,-param_3.y,(param_3.z*0.5)+(param_3.w*0.5),param_3.w);
out.gl_Position=l9_21;
return out;
}
out.varPos=gParticle.Position+(gParticle.Matrix*float3(v.position.x*gParticle.Size,v.position.y*gParticle.Size,0.0));
out.varNormal=gParticle.Matrix*float3(0.0,0.0,1.0);
float3 l9_22=gParticle.Matrix*float3(1.0,0.0,0.0);
out.varTangent=float4(l9_22.x,l9_22.y,l9_22.z,out.varTangent.w);
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
float3 l9_23=float3(0.0);
l9_23=gParticle.Velocity;
float l9_24=0.0;
l9_24=length(l9_23);
float l9_25=0.0;
float l9_26=(*sc_set0.UserUniforms).Port_Value_N170;
float l9_27=l9_26+0.001;
l9_27-=0.001;
l9_25=l9_27;
float l9_28=0.0;
l9_28=float(l9_24<l9_25);
param_7=l9_28;
float3 param_10;
if ((param_7*1.0)!=0.0)
{
param_10=param_8;
}
else
{
float3 l9_29=float3(0.0);
l9_29=gParticle.Velocity;
float3 l9_30=float3(0.0);
float3 l9_31=l9_29;
float l9_32=dot(l9_31,l9_31);
float l9_33;
if (l9_32>0.0)
{
l9_33=1.0/sqrt(l9_32);
}
else
{
l9_33=0.0;
}
float l9_34=l9_33;
float3 l9_35=l9_31*l9_34;
l9_30=l9_35;
param_9=l9_30;
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
float l9_36=dot(param_11,param_11);
float l9_37;
if (l9_36>0.0)
{
l9_37=1.0/sqrt(l9_36);
}
else
{
l9_37=0.0;
}
float l9_38=l9_37;
float3 param_12=param_11*l9_38;
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
float l9_39=dot(param_16,param_16);
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
float3 param_17=param_16*l9_41;
Output_N154=param_17;
float3 param_18=Output_N154;
out.varNormal=param_18;
int l9_42=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_42=0;
}
else
{
l9_42=gl_InstanceIndex%2;
}
int l9_43=l9_42;
float4 clipPosition=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_43]*float4(out.varPos,1.0);
float4 param_19=clipPosition;
if (sc_DepthBufferMode_tmp==1)
{
int l9_44=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_44=0;
}
else
{
l9_44=gl_InstanceIndex%2;
}
int l9_45=l9_44;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_45][2].w!=0.0)
{
float l9_46=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
param_19.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+param_19.w))*l9_46)-1.0)*param_19.w;
}
}
float4 l9_47=param_19;
clipPosition=l9_47;
float4 param_20=clipPosition;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_20.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_48=param_20;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_49=dot(l9_48,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_50=l9_49;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_50;
}
}
float4 l9_51=float4(param_20.x,-param_20.y,(param_20.z*0.5)+(param_20.w*0.5),param_20.w);
out.gl_Position=l9_51;
int l9_52=gl_InstanceIndex;
out.Interp_Particle_Index=l9_52;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/1000];
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
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%1000;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(1000*((param/1000)+1))-1;
int l9_0=param_1.Index1D;
int2 l9_1=int2(l9_0%512,l9_0/512);
param_1.Index2D=l9_1;
int l9_2=param_1.Index1D;
float l9_3=(float(l9_2)+0.5)/1000.0;
param_1.Coord1D=l9_3;
int2 l9_4=param_1.Index2D;
float2 l9_5=(float2(l9_4)+float2(0.5))/float2(512.0,2.0);
param_1.Coord2D=l9_5;
int l9_6=param_1.Index1D;
float l9_7=float(l9_6)/999.0;
param_1.Ratio1D=l9_7;
int l9_8=param_1.Index1DPerCopy;
float l9_9=float(l9_8)/999.0;
param_1.Ratio1DPerCopy=l9_9;
int2 l9_10=param_1.Index2D;
float2 l9_11=float2(l9_10)/float2(511.0,1.0);
param_1.Ratio2D=l9_11;
param_1.Seed=0.0;
float2 l9_12=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_13=dot(l9_12,float2(0.98253,0.72662002));
l9_13=sin(l9_13)*479.371;
l9_13=fract(l9_13);
l9_13=floor(l9_13*10000.0)*9.9999997e-05;
float l9_14=l9_13;
param_1.TimeShift=l9_14;
param_1.TimeShift=0.0;
param_1.SpawnOffset=0.0;
ssParticle l9_15=param_1;
l9_15.Seed=(l9_15.Ratio1D*0.97637898)+0.151235;
int2 l9_16=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_16)+float2(1.0))/float2(399.0);
param_1=l9_15;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Output_Color0=gParticle.Color;
float4 Output_N42=float4(0.0);
float param_2=1.0;
float4 param_3=float4(1.0);
float4 param_4=float4(0.50196099,0.0,0.0081330603,1.0);
ssGlobals param_6=Globals;
float l9_17=0.0;
float l9_18=float((*sc_set0.UserUniforms).isIdle!=0);
l9_17=l9_18;
param_2=l9_17;
float4 param_5;
if ((param_2*1.0)!=0.0)
{
float2 l9_19=float2(0.0);
l9_19=param_6.Surface_UVCoord0;
float2 l9_20=float2(0.0);
float2 l9_21=l9_19;
float l9_22=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_23=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_24=sin(radians(l9_22));
float l9_25=cos(radians(l9_22));
float2 l9_26=l9_21-l9_23;
l9_26=float2(dot(float2(l9_25,l9_24),l9_26),dot(float2(-l9_24,l9_25),l9_26))+l9_23;
l9_20=l9_26;
float l9_27=0.0;
l9_27=gParticle.Index1DPerCopyF;
float l9_28=0.0;
l9_28=gParticle.Ratio1DPerCopy;
float l9_29=0.0;
l9_29=(((l9_28-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_30=float4(0.0);
float2 l9_31=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_32=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_33=l9_20;
float l9_34=l9_27;
float l9_35=l9_29;
float l9_36=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_37=param_6;
float2 l9_38=float2(0.0);
float l9_39=floor(l9_31.x);
float l9_40=floor(l9_31.y);
float l9_41=1.0/l9_39;
float l9_42=1.0/l9_40;
float l9_43=fast::min(l9_39*l9_40,floor(l9_32));
float l9_44=floor(mod(((l9_37.gTimeElapsedShifted+l9_36)*l9_35)+floor(l9_34),l9_43));
float l9_45=floor(l9_44/l9_39);
float l9_46=mod(l9_44,l9_39);
l9_38=float2((l9_41*l9_33.x)+(l9_46*l9_41),((1.0-l9_42)-(l9_45*l9_42))+(l9_42*l9_33.y));
int l9_47=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_48=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_48=0;
}
else
{
l9_48=in.varStereoViewID;
}
int l9_49=l9_48;
l9_47=1-l9_49;
}
else
{
int l9_50=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_50=0;
}
else
{
l9_50=in.varStereoViewID;
}
int l9_51=l9_50;
l9_47=l9_51;
}
int l9_52=l9_47;
int l9_53=flipbookTexLayout_tmp;
int l9_54=l9_52;
float2 l9_55=l9_38;
bool l9_56=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_57=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_58=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_59=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_60=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_61=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_62=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_63=0.0;
bool l9_64=l9_61&&(!l9_59);
float l9_65=1.0;
float l9_66=l9_55.x;
int l9_67=l9_58.x;
if (l9_67==1)
{
l9_66=fract(l9_66);
}
else
{
if (l9_67==2)
{
float l9_68=fract(l9_66);
float l9_69=l9_66-l9_68;
float l9_70=step(0.25,fract(l9_69*0.5));
l9_66=mix(l9_68,1.0-l9_68,fast::clamp(l9_70,0.0,1.0));
}
}
l9_55.x=l9_66;
float l9_71=l9_55.y;
int l9_72=l9_58.y;
if (l9_72==1)
{
l9_71=fract(l9_71);
}
else
{
if (l9_72==2)
{
float l9_73=fract(l9_71);
float l9_74=l9_71-l9_73;
float l9_75=step(0.25,fract(l9_74*0.5));
l9_71=mix(l9_73,1.0-l9_73,fast::clamp(l9_75,0.0,1.0));
}
}
l9_55.y=l9_71;
if (l9_59)
{
bool l9_76=l9_61;
bool l9_77;
if (l9_76)
{
l9_77=l9_58.x==3;
}
else
{
l9_77=l9_76;
}
float l9_78=l9_55.x;
float l9_79=l9_60.x;
float l9_80=l9_60.z;
bool l9_81=l9_77;
float l9_82=l9_65;
float l9_83=fast::clamp(l9_78,l9_79,l9_80);
float l9_84=step(abs(l9_78-l9_83),9.9999997e-06);
l9_82*=(l9_84+((1.0-float(l9_81))*(1.0-l9_84)));
l9_78=l9_83;
l9_55.x=l9_78;
l9_65=l9_82;
bool l9_85=l9_61;
bool l9_86;
if (l9_85)
{
l9_86=l9_58.y==3;
}
else
{
l9_86=l9_85;
}
float l9_87=l9_55.y;
float l9_88=l9_60.y;
float l9_89=l9_60.w;
bool l9_90=l9_86;
float l9_91=l9_65;
float l9_92=fast::clamp(l9_87,l9_88,l9_89);
float l9_93=step(abs(l9_87-l9_92),9.9999997e-06);
l9_91*=(l9_93+((1.0-float(l9_90))*(1.0-l9_93)));
l9_87=l9_92;
l9_55.y=l9_87;
l9_65=l9_91;
}
float2 l9_94=l9_55;
bool l9_95=l9_56;
float3x3 l9_96=l9_57;
if (l9_95)
{
l9_94=float2((l9_96*float3(l9_94,1.0)).xy);
}
float2 l9_97=l9_94;
float2 l9_98=l9_97;
float2 l9_99=l9_98;
l9_55=l9_99;
float l9_100=l9_55.x;
int l9_101=l9_58.x;
bool l9_102=l9_64;
float l9_103=l9_65;
if ((l9_101==0)||(l9_101==3))
{
float l9_104=l9_100;
float l9_105=0.0;
float l9_106=1.0;
bool l9_107=l9_102;
float l9_108=l9_103;
float l9_109=fast::clamp(l9_104,l9_105,l9_106);
float l9_110=step(abs(l9_104-l9_109),9.9999997e-06);
l9_108*=(l9_110+((1.0-float(l9_107))*(1.0-l9_110)));
l9_104=l9_109;
l9_100=l9_104;
l9_103=l9_108;
}
l9_55.x=l9_100;
l9_65=l9_103;
float l9_111=l9_55.y;
int l9_112=l9_58.y;
bool l9_113=l9_64;
float l9_114=l9_65;
if ((l9_112==0)||(l9_112==3))
{
float l9_115=l9_111;
float l9_116=0.0;
float l9_117=1.0;
bool l9_118=l9_113;
float l9_119=l9_114;
float l9_120=fast::clamp(l9_115,l9_116,l9_117);
float l9_121=step(abs(l9_115-l9_120),9.9999997e-06);
l9_119*=(l9_121+((1.0-float(l9_118))*(1.0-l9_121)));
l9_115=l9_120;
l9_111=l9_115;
l9_114=l9_119;
}
l9_55.y=l9_111;
l9_65=l9_114;
float2 l9_122=l9_55;
int l9_123=l9_53;
int l9_124=l9_54;
float l9_125=l9_63;
float2 l9_126=l9_122;
int l9_127=l9_123;
int l9_128=l9_124;
float3 l9_129=float3(0.0);
if (l9_127==0)
{
l9_129=float3(l9_126,0.0);
}
else
{
if (l9_127==1)
{
l9_129=float3(l9_126.x,(l9_126.y*0.5)+(0.5-(float(l9_128)*0.5)),0.0);
}
else
{
l9_129=float3(l9_126,float(l9_128));
}
}
float3 l9_130=l9_129;
float3 l9_131=l9_130;
float2 l9_132=l9_131.xy;
float l9_133=l9_125;
float4 l9_134=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_132,bias(l9_133));
float4 l9_135=l9_134;
float4 l9_136=l9_135;
if (l9_61)
{
l9_136=mix(l9_62,l9_136,float4(l9_65));
}
float4 l9_137=l9_136;
float4 l9_138=l9_137;
l9_30=l9_138;
float l9_139=0.0;
l9_139=l9_30.w;
float4 l9_140=float4(0.0);
l9_140=gParticle.Color;
float l9_141=0.0;
l9_141=l9_140.w;
float l9_142=0.0;
l9_142=l9_139*l9_141;
float2 l9_143=float2(0.0);
l9_143=param_6.Surface_UVCoord0;
float2 l9_144=float2(0.0);
l9_144=l9_143*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_145=float2(0.0);
l9_145=l9_144-float2(1.0);
float l9_146=0.0;
l9_146=dot(l9_145,l9_145);
float l9_147=0.0;
l9_147=fast::clamp(l9_146+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_148=0.0;
l9_148=1.0-l9_147;
float l9_149=0.0;
float l9_150;
if (l9_148<=0.0)
{
l9_150=0.0;
}
else
{
l9_150=sqrt(l9_148);
}
l9_149=l9_150;
float3 l9_151=float3(0.0);
l9_151=float3(l9_145.x,l9_145.y,l9_151.z);
l9_151.z=l9_149;
float l9_152=0.0;
l9_152=distance(l9_143,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_153=0.0;
l9_153=float(l9_152<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_154=float3(0.0);
l9_154=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_151,float3(l9_153));
float3 l9_155=float3(0.0);
l9_155=l9_154;
float4 l9_156=float4(0.0);
float3 l9_157=l9_30.xyz;
float l9_158=l9_142;
float3 l9_159=l9_155;
float3 l9_160=(*sc_set0.UserUniforms).Port_Emissive_N026;
float l9_161=(*sc_set0.UserUniforms).Port_Metallic_N026;
float l9_162=(*sc_set0.UserUniforms).Port_Roughness_N026;
float3 l9_163=(*sc_set0.UserUniforms).Port_AO_N026;
float3 l9_164=(*sc_set0.UserUniforms).Port_SpecularAO_N026;
ssGlobals l9_165=param_6;
l9_165.BumpedNormal=float3x3(float3(l9_165.VertexTangent_WorldSpace),float3(l9_165.VertexBinormal_WorldSpace),float3(l9_165.VertexNormal_WorldSpace))*l9_159;
l9_158=fast::clamp(l9_158,0.0,1.0);
l9_157=fast::max(l9_157,float3(0.0));
float3 l9_166=l9_157;
float l9_167=l9_158;
float3 l9_168=l9_165.BumpedNormal;
float3 l9_169=l9_165.PositionWS;
float3 l9_170=l9_165.ViewDirWS;
float3 l9_171=l9_160;
float l9_172=l9_161;
float l9_173=l9_162;
float3 l9_174=l9_163;
float3 l9_175=l9_164;
SurfaceProperties l9_176;
l9_176.albedo=float3(0.0);
l9_176.opacity=1.0;
l9_176.normal=float3(0.0);
l9_176.positionWS=float3(0.0);
l9_176.viewDirWS=float3(0.0);
l9_176.metallic=0.0;
l9_176.roughness=0.0;
l9_176.emissive=float3(0.0);
l9_176.ao=float3(1.0);
l9_176.specularAo=float3(1.0);
l9_176.bakedShadows=float3(1.0);
SurfaceProperties l9_177=l9_176;
SurfaceProperties l9_178=l9_177;
l9_178.opacity=l9_167;
float3 l9_179=l9_166;
float3 l9_180;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_180=float3(pow(l9_179.x,2.2),pow(l9_179.y,2.2),pow(l9_179.z,2.2));
}
else
{
l9_180=l9_179*l9_179;
}
float3 l9_181=l9_180;
l9_178.albedo=l9_181;
l9_178.normal=normalize(l9_168);
l9_178.positionWS=l9_169;
l9_178.viewDirWS=l9_170;
float3 l9_182=l9_171;
float3 l9_183;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_183=float3(pow(l9_182.x,2.2),pow(l9_182.y,2.2),pow(l9_182.z,2.2));
}
else
{
l9_183=l9_182*l9_182;
}
float3 l9_184=l9_183;
l9_178.emissive=l9_184;
l9_178.metallic=l9_172;
l9_178.roughness=l9_173;
l9_178.ao=l9_174;
l9_178.specularAo=l9_175;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_185=l9_178.positionWS;
l9_178.ao=evaluateSSAO(l9_185,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_186=l9_178;
SurfaceProperties l9_187=l9_186;
float3 l9_188=mix(float3(0.039999999),l9_187.albedo*l9_187.metallic,float3(l9_187.metallic));
float3 l9_189=mix(l9_187.albedo*(1.0-l9_187.metallic),float3(0.0),float3(l9_187.metallic));
l9_186.albedo=l9_189;
l9_186.specColor=l9_188;
SurfaceProperties l9_190=l9_186;
l9_178=l9_190;
SurfaceProperties l9_191=l9_178;
LightingComponents l9_192;
l9_192.directDiffuse=float3(0.0);
l9_192.directSpecular=float3(0.0);
l9_192.indirectDiffuse=float3(1.0);
l9_192.indirectSpecular=float3(0.0);
l9_192.emitted=float3(0.0);
l9_192.transmitted=float3(0.0);
LightingComponents l9_193=l9_192;
LightingComponents l9_194=l9_193;
float3 l9_195=l9_191.viewDirWS;
int l9_196=0;
float4 l9_197=float4(l9_191.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_198;
LightProperties l9_199;
int l9_200=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_200<sc_DirectionalLightsCount_tmp)
{
l9_198.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_200].direction;
l9_198.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_200].color;
l9_199.direction=l9_198.direction;
l9_199.color=l9_198.color.xyz;
l9_199.attenuation=l9_198.color.w;
l9_199.attenuation*=l9_197[(l9_196<3) ? l9_196 : 3];
l9_196++;
LightingComponents l9_201=l9_194;
LightProperties l9_202=l9_199;
SurfaceProperties l9_203=l9_191;
float3 l9_204=l9_195;
SurfaceProperties l9_205=l9_203;
float3 l9_206=l9_202.direction;
float3 l9_207=float3(fast::clamp(dot(l9_205.normal,l9_206),0.0,1.0));
l9_201.directDiffuse+=((l9_207*l9_202.color)*l9_202.attenuation);
SurfaceProperties l9_208=l9_203;
float3 l9_209=l9_202.direction;
float3 l9_210=l9_204;
l9_201.directSpecular+=((calculateDirectSpecular(l9_208,l9_209,l9_210)*l9_202.color)*l9_202.attenuation);
LightingComponents l9_211=l9_201;
l9_194=l9_211;
l9_200++;
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
sc_PointLight_t_1 l9_212;
LightProperties l9_213;
int l9_214=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_214<sc_PointLightsCount_tmp)
{
l9_212.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_214].falloffEnabled!=0;
l9_212.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_214].falloffEndDistance;
l9_212.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_214].negRcpFalloffEndDistance4;
l9_212.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_214].angleScale;
l9_212.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_214].angleOffset;
l9_212.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_214].direction;
l9_212.position=(*sc_set0.UserUniforms).sc_PointLights[l9_214].position;
l9_212.color=(*sc_set0.UserUniforms).sc_PointLights[l9_214].color;
float3 l9_215=l9_212.position-l9_191.positionWS;
l9_213.direction=normalize(l9_215);
l9_213.color=l9_212.color.xyz;
l9_213.attenuation=l9_212.color.w;
l9_213.attenuation*=l9_197[(l9_196<3) ? l9_196 : 3];
float3 l9_216=l9_213.direction;
float3 l9_217=l9_212.direction;
float l9_218=l9_212.angleScale;
float l9_219=l9_212.angleOffset;
float l9_220=dot(l9_216,l9_217);
float l9_221=fast::clamp((l9_220*l9_218)+l9_219,0.0,1.0);
float l9_222=l9_221*l9_221;
l9_213.attenuation*=l9_222;
if (l9_212.falloffEnabled)
{
float l9_223=length(l9_215);
float l9_224=l9_212.falloffEndDistance;
l9_213.attenuation*=computeDistanceAttenuation(l9_223,l9_224);
}
l9_196++;
LightingComponents l9_225=l9_194;
LightProperties l9_226=l9_213;
SurfaceProperties l9_227=l9_191;
float3 l9_228=l9_195;
SurfaceProperties l9_229=l9_227;
float3 l9_230=l9_226.direction;
float3 l9_231=float3(fast::clamp(dot(l9_229.normal,l9_230),0.0,1.0));
l9_225.directDiffuse+=((l9_231*l9_226.color)*l9_226.attenuation);
SurfaceProperties l9_232=l9_227;
float3 l9_233=l9_226.direction;
float3 l9_234=l9_228;
l9_225.directSpecular+=((calculateDirectSpecular(l9_232,l9_233,l9_234)*l9_226.color)*l9_226.attenuation);
LightingComponents l9_235=l9_225;
l9_194=l9_235;
l9_214++;
continue;
}
else
{
break;
}
}
}
bool l9_236=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_236)
{
float4 l9_237=gl_FragCoord;
float2 l9_238=l9_237.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_239=l9_238;
float2 l9_240=l9_239;
int l9_241=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_242=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_242=0;
}
else
{
l9_242=in.varStereoViewID;
}
int l9_243=l9_242;
l9_241=1-l9_243;
}
else
{
int l9_244=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_244=0;
}
else
{
l9_244=in.varStereoViewID;
}
int l9_245=l9_244;
l9_241=l9_245;
}
int l9_246=l9_241;
float2 l9_247=l9_240;
int l9_248=l9_246;
float2 l9_249=l9_247;
int l9_250=l9_248;
float l9_251=0.0;
float4 l9_252=float4(0.0);
float2 l9_253=l9_249;
int l9_254=sc_RayTracedShadowTextureLayout_tmp;
int l9_255=l9_250;
float l9_256=l9_251;
float2 l9_257=l9_253;
int l9_258=l9_254;
int l9_259=l9_255;
float3 l9_260=float3(0.0);
if (l9_258==0)
{
l9_260=float3(l9_257,0.0);
}
else
{
if (l9_258==1)
{
l9_260=float3(l9_257.x,(l9_257.y*0.5)+(0.5-(float(l9_259)*0.5)),0.0);
}
else
{
l9_260=float3(l9_257,float(l9_259));
}
}
float3 l9_261=l9_260;
float3 l9_262=l9_261;
float2 l9_263=l9_262.xy;
float l9_264=l9_256;
float4 l9_265=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_263,bias(l9_264));
float4 l9_266=l9_265;
l9_252=l9_266;
float4 l9_267=l9_252;
float4 l9_268=l9_267;
float4 l9_269=l9_268;
float l9_270=l9_269.x;
float3 l9_271=float3(l9_270);
float3 l9_272=l9_271;
l9_194.directDiffuse*=(float3(1.0)-l9_272);
l9_194.directSpecular*=(float3(1.0)-l9_272);
}
SurfaceProperties l9_273=l9_191;
float3 l9_274=l9_273.normal;
float3 l9_275=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_276=l9_274;
float3 l9_277=l9_276;
float l9_278=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_279=float2(0.0);
float l9_280=l9_277.x;
float l9_281=-l9_277.z;
float l9_282=(l9_280<0.0) ? (-1.0) : 1.0;
float l9_283=l9_282*acos(fast::clamp(l9_281/length(float2(l9_280,l9_281)),-1.0,1.0));
l9_279.x=l9_283-1.5707964;
l9_279.y=acos(l9_277.y);
l9_279/=float2(6.2831855,3.1415927);
l9_279.y=1.0-l9_279.y;
l9_279.x+=(l9_278/360.0);
l9_279.x=fract((l9_279.x+floor(l9_279.x))+1.0);
float2 l9_284=l9_279;
float2 l9_285=l9_284;
float4 l9_286=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_287=l9_285;
float2 l9_288=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_289=5.0;
l9_285=calcSeamlessPanoramicUvsForSampling(l9_287,l9_288,l9_289);
}
float2 l9_290=l9_285;
float l9_291=13.0;
int l9_292=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_293=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_293=0;
}
else
{
l9_293=in.varStereoViewID;
}
int l9_294=l9_293;
l9_292=1-l9_294;
}
else
{
int l9_295=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_295=0;
}
else
{
l9_295=in.varStereoViewID;
}
int l9_296=l9_295;
l9_292=l9_296;
}
int l9_297=l9_292;
float2 l9_298=l9_290;
int l9_299=l9_297;
float l9_300=l9_291;
float4 l9_301=float4(0.0);
float2 l9_302=l9_298;
int l9_303=sc_EnvmapSpecularLayout_tmp;
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
float4 l9_314=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_312,bias(l9_313));
float4 l9_315=l9_314;
l9_301=l9_315;
float4 l9_316=l9_301;
float4 l9_317=l9_316;
l9_286=l9_317;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_318=l9_285;
float2 l9_319=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_320=0.0;
l9_285=calcSeamlessPanoramicUvsForSampling(l9_318,l9_319,l9_320);
float2 l9_321=l9_285;
float l9_322=-13.0;
int l9_323=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_324=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_324=0;
}
else
{
l9_324=in.varStereoViewID;
}
int l9_325=l9_324;
l9_323=1-l9_325;
}
else
{
int l9_326=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_326=0;
}
else
{
l9_326=in.varStereoViewID;
}
int l9_327=l9_326;
l9_323=l9_327;
}
int l9_328=l9_323;
float2 l9_329=l9_321;
int l9_330=l9_328;
float l9_331=l9_322;
float4 l9_332=float4(0.0);
float2 l9_333=l9_329;
int l9_334=sc_EnvmapDiffuseLayout_tmp;
int l9_335=l9_330;
float l9_336=l9_331;
float2 l9_337=l9_333;
int l9_338=l9_334;
int l9_339=l9_335;
float3 l9_340=float3(0.0);
if (l9_338==0)
{
l9_340=float3(l9_337,0.0);
}
else
{
if (l9_338==1)
{
l9_340=float3(l9_337.x,(l9_337.y*0.5)+(0.5-(float(l9_339)*0.5)),0.0);
}
else
{
l9_340=float3(l9_337,float(l9_339));
}
}
float3 l9_341=l9_340;
float3 l9_342=l9_341;
float2 l9_343=l9_342.xy;
float l9_344=l9_336;
float4 l9_345=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_343,bias(l9_344));
float4 l9_346=l9_345;
l9_332=l9_346;
float4 l9_347=l9_332;
float4 l9_348=l9_347;
l9_286=l9_348;
}
else
{
float2 l9_349=l9_285;
float l9_350=13.0;
int l9_351=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_352=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_352=0;
}
else
{
l9_352=in.varStereoViewID;
}
int l9_353=l9_352;
l9_351=1-l9_353;
}
else
{
int l9_354=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_354=0;
}
else
{
l9_354=in.varStereoViewID;
}
int l9_355=l9_354;
l9_351=l9_355;
}
int l9_356=l9_351;
float2 l9_357=l9_349;
int l9_358=l9_356;
float l9_359=l9_350;
float4 l9_360=float4(0.0);
float2 l9_361=l9_357;
int l9_362=sc_EnvmapSpecularLayout_tmp;
int l9_363=l9_358;
float l9_364=l9_359;
float2 l9_365=l9_361;
int l9_366=l9_362;
int l9_367=l9_363;
float3 l9_368=float3(0.0);
if (l9_366==0)
{
l9_368=float3(l9_365,0.0);
}
else
{
if (l9_366==1)
{
l9_368=float3(l9_365.x,(l9_365.y*0.5)+(0.5-(float(l9_367)*0.5)),0.0);
}
else
{
l9_368=float3(l9_365,float(l9_367));
}
}
float3 l9_369=l9_368;
float3 l9_370=l9_369;
float2 l9_371=l9_370.xy;
float l9_372=l9_364;
float4 l9_373=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_371,bias(l9_372));
float4 l9_374=l9_373;
l9_360=l9_374;
float4 l9_375=l9_360;
float4 l9_376=l9_375;
l9_286=l9_376;
}
}
float4 l9_377=l9_286;
float3 l9_378=l9_377.xyz*(1.0/l9_377.w);
float3 l9_379=l9_378*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_275=l9_379;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_380=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_381=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_382=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_383=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_384=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_385=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_386=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_387=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_388=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_389=-l9_274;
float l9_390=0.0;
l9_390=l9_389.x;
float l9_391=l9_389.y;
float l9_392=l9_389.z;
float l9_393=l9_390*l9_390;
float l9_394=l9_391*l9_391;
float l9_395=l9_392*l9_392;
float l9_396=l9_390*l9_391;
float l9_397=l9_391*l9_392;
float l9_398=l9_390*l9_392;
float3 l9_399=((((((l9_388*0.42904299)*(l9_393-l9_394))+((l9_386*0.74312502)*l9_395))+(l9_380*0.88622701))-(l9_386*0.24770799))+((((l9_384*l9_396)+(l9_387*l9_398))+(l9_385*l9_397))*0.85808599))+((((l9_383*l9_390)+(l9_381*l9_391))+(l9_382*l9_392))*1.0233279);
l9_275=l9_399*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_400=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_400)
{
float4 l9_401=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_275=mix(l9_275,l9_401.xyz,float3(l9_401.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_275+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_275.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_275+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_275.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_275+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_275.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_402=l9_274;
float3 l9_403=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_404;
float l9_405;
int l9_406=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_406<sc_LightEstimationSGCount_tmp)
{
l9_404.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_406].color;
l9_404.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_406].sharpness;
l9_404.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_406].axis;
float3 l9_407=l9_402;
float l9_408=dot(l9_404.axis,l9_407);
float l9_409=l9_404.sharpness;
float l9_410=0.36000001;
float l9_411=1.0/(4.0*l9_410);
float l9_412=exp(-l9_409);
float l9_413=l9_412*l9_412;
float l9_414=1.0/l9_409;
float l9_415=(1.0+(2.0*l9_413))-l9_414;
float l9_416=((l9_412-l9_413)*l9_414)-l9_413;
float l9_417=sqrt(1.0-l9_415);
float l9_418=l9_410*l9_408;
float l9_419=l9_411*l9_417;
float l9_420=l9_418+l9_419;
float l9_421=fast::clamp(l9_408,0.0,1.0);
if (step(abs(l9_418),l9_419)>0.5)
{
l9_405=(l9_420*l9_420)/l9_417;
}
else
{
l9_405=l9_421;
}
l9_421=l9_405;
float l9_422=(l9_415*l9_421)+l9_416;
sc_SphericalGaussianLight_t l9_423=l9_404;
float3 l9_424=(l9_423.color/float3(l9_423.sharpness))*6.2831855;
float3 l9_425=(l9_424*l9_422)/float3(3.1415927);
l9_403+=l9_425;
l9_406++;
continue;
}
else
{
break;
}
}
float3 l9_426=l9_403;
l9_275+=l9_426;
}
float3 l9_427=l9_275;
float3 l9_428=l9_427;
l9_194.indirectDiffuse=l9_428;
SurfaceProperties l9_429=l9_191;
float3 l9_430=l9_195;
float3 l9_431=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_432=l9_429;
float3 l9_433=l9_430;
float3 l9_434=l9_432.normal;
float3 l9_435=reflect(-l9_433,l9_434);
float3 l9_436=l9_434;
float3 l9_437=l9_435;
float l9_438=l9_432.roughness;
l9_435=getSpecularDominantDir(l9_436,l9_437,l9_438);
float l9_439=l9_432.roughness;
float l9_440=fast::clamp(pow(l9_439,0.66666669),0.0,1.0)*5.0;
float l9_441=l9_440;
float l9_442=l9_441;
float3 l9_443=l9_435;
float l9_444=l9_442;
float3 l9_445=l9_443;
float l9_446=l9_444;
float4 l9_447=float4(0.0);
float3 l9_448=l9_445;
float l9_449=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_450=float2(0.0);
float l9_451=l9_448.x;
float l9_452=-l9_448.z;
float l9_453=(l9_451<0.0) ? (-1.0) : 1.0;
float l9_454=l9_453*acos(fast::clamp(l9_452/length(float2(l9_451,l9_452)),-1.0,1.0));
l9_450.x=l9_454-1.5707964;
l9_450.y=acos(l9_448.y);
l9_450/=float2(6.2831855,3.1415927);
l9_450.y=1.0-l9_450.y;
l9_450.x+=(l9_449/360.0);
l9_450.x=fract((l9_450.x+floor(l9_450.x))+1.0);
float2 l9_455=l9_450;
float2 l9_456=l9_455;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_457=floor(l9_446);
float l9_458=ceil(l9_446);
float l9_459=l9_446-l9_457;
float2 l9_460=l9_456;
float2 l9_461=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_462=l9_457;
float2 l9_463=calcSeamlessPanoramicUvsForSampling(l9_460,l9_461,l9_462);
float2 l9_464=l9_463;
float l9_465=l9_457;
float2 l9_466=l9_464;
float l9_467=l9_465;
int l9_468=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
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
l9_468=1-l9_470;
}
else
{
int l9_471=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_471=0;
}
else
{
l9_471=in.varStereoViewID;
}
int l9_472=l9_471;
l9_468=l9_472;
}
int l9_473=l9_468;
float2 l9_474=l9_466;
int l9_475=l9_473;
float l9_476=l9_467;
float4 l9_477=float4(0.0);
float2 l9_478=l9_474;
int l9_479=sc_EnvmapSpecularLayout_tmp;
int l9_480=l9_475;
float l9_481=l9_476;
float2 l9_482=l9_478;
int l9_483=l9_479;
int l9_484=l9_480;
float3 l9_485=float3(0.0);
if (l9_483==0)
{
l9_485=float3(l9_482,0.0);
}
else
{
if (l9_483==1)
{
l9_485=float3(l9_482.x,(l9_482.y*0.5)+(0.5-(float(l9_484)*0.5)),0.0);
}
else
{
l9_485=float3(l9_482,float(l9_484));
}
}
float3 l9_486=l9_485;
float3 l9_487=l9_486;
float2 l9_488=l9_487.xy;
float l9_489=l9_481;
float4 l9_490=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_488,level(l9_489));
float4 l9_491=l9_490;
l9_477=l9_491;
float4 l9_492=l9_477;
float4 l9_493=l9_492;
float4 l9_494=l9_493;
float4 l9_495=l9_494;
float2 l9_496=l9_456;
float2 l9_497=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_498=l9_458;
float2 l9_499=calcSeamlessPanoramicUvsForSampling(l9_496,l9_497,l9_498);
float2 l9_500=l9_499;
float l9_501=l9_458;
float2 l9_502=l9_500;
float l9_503=l9_501;
int l9_504=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_505=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_505=0;
}
else
{
l9_505=in.varStereoViewID;
}
int l9_506=l9_505;
l9_504=1-l9_506;
}
else
{
int l9_507=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_507=0;
}
else
{
l9_507=in.varStereoViewID;
}
int l9_508=l9_507;
l9_504=l9_508;
}
int l9_509=l9_504;
float2 l9_510=l9_502;
int l9_511=l9_509;
float l9_512=l9_503;
float4 l9_513=float4(0.0);
float2 l9_514=l9_510;
int l9_515=sc_EnvmapSpecularLayout_tmp;
int l9_516=l9_511;
float l9_517=l9_512;
float2 l9_518=l9_514;
int l9_519=l9_515;
int l9_520=l9_516;
float3 l9_521=float3(0.0);
if (l9_519==0)
{
l9_521=float3(l9_518,0.0);
}
else
{
if (l9_519==1)
{
l9_521=float3(l9_518.x,(l9_518.y*0.5)+(0.5-(float(l9_520)*0.5)),0.0);
}
else
{
l9_521=float3(l9_518,float(l9_520));
}
}
float3 l9_522=l9_521;
float3 l9_523=l9_522;
float2 l9_524=l9_523.xy;
float l9_525=l9_517;
float4 l9_526=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_524,level(l9_525));
float4 l9_527=l9_526;
l9_513=l9_527;
float4 l9_528=l9_513;
float4 l9_529=l9_528;
float4 l9_530=l9_529;
float4 l9_531=l9_530;
l9_447=mix(l9_495,l9_531,float4(l9_459));
}
else
{
float2 l9_532=l9_456;
float l9_533=l9_446;
float2 l9_534=l9_532;
float l9_535=l9_533;
int l9_536=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_537=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_537=0;
}
else
{
l9_537=in.varStereoViewID;
}
int l9_538=l9_537;
l9_536=1-l9_538;
}
else
{
int l9_539=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_539=0;
}
else
{
l9_539=in.varStereoViewID;
}
int l9_540=l9_539;
l9_536=l9_540;
}
int l9_541=l9_536;
float2 l9_542=l9_534;
int l9_543=l9_541;
float l9_544=l9_535;
float4 l9_545=float4(0.0);
float2 l9_546=l9_542;
int l9_547=sc_EnvmapSpecularLayout_tmp;
int l9_548=l9_543;
float l9_549=l9_544;
float2 l9_550=l9_546;
int l9_551=l9_547;
int l9_552=l9_548;
float3 l9_553=float3(0.0);
if (l9_551==0)
{
l9_553=float3(l9_550,0.0);
}
else
{
if (l9_551==1)
{
l9_553=float3(l9_550.x,(l9_550.y*0.5)+(0.5-(float(l9_552)*0.5)),0.0);
}
else
{
l9_553=float3(l9_550,float(l9_552));
}
}
float3 l9_554=l9_553;
float3 l9_555=l9_554;
float2 l9_556=l9_555.xy;
float l9_557=l9_549;
float4 l9_558=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_556,level(l9_557));
float4 l9_559=l9_558;
l9_545=l9_559;
float4 l9_560=l9_545;
float4 l9_561=l9_560;
float4 l9_562=l9_561;
l9_447=l9_562;
}
float4 l9_563=l9_447;
float3 l9_564=l9_563.xyz*(1.0/l9_563.w);
float3 l9_565=l9_564;
float3 l9_566=l9_565*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_566+=float3(1e-06);
float3 l9_567=l9_566;
float3 l9_568=l9_567;
bool l9_569=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_569)
{
float4 l9_570=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_568=mix(l9_568,l9_570.xyz,float3(l9_570.w));
}
SurfaceProperties l9_571=l9_432;
float l9_572=abs(dot(l9_434,l9_433));
float3 l9_573=l9_568*envBRDFApprox(l9_571,l9_572);
l9_431+=l9_573;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_574=l9_429;
float3 l9_575=l9_430;
float l9_576=fast::clamp(l9_574.roughness*l9_574.roughness,0.0099999998,1.0);
float3 l9_577=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_574.specColor;
sc_SphericalGaussianLight_t l9_578;
sc_SphericalGaussianLight_t l9_579;
sc_SphericalGaussianLight_t l9_580;
int l9_581=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_581<sc_LightEstimationSGCount_tmp)
{
l9_578.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_581].color;
l9_578.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_581].sharpness;
l9_578.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_581].axis;
float3 l9_582=l9_574.normal;
float l9_583=l9_576;
float3 l9_584=l9_575;
float3 l9_585=l9_574.specColor;
float3 l9_586=l9_582;
float l9_587=l9_583;
l9_579.axis=l9_586;
float l9_588=l9_587*l9_587;
l9_579.sharpness=2.0/l9_588;
l9_579.color=float3(1.0/(3.1415927*l9_588));
sc_SphericalGaussianLight_t l9_589=l9_579;
sc_SphericalGaussianLight_t l9_590=l9_589;
sc_SphericalGaussianLight_t l9_591=l9_590;
float3 l9_592=l9_584;
l9_580.axis=reflect(-l9_592,l9_591.axis);
l9_580.color=l9_591.color;
l9_580.sharpness=l9_591.sharpness;
l9_580.sharpness/=(4.0*fast::max(dot(l9_591.axis,l9_592),9.9999997e-05));
sc_SphericalGaussianLight_t l9_593=l9_580;
sc_SphericalGaussianLight_t l9_594=l9_593;
sc_SphericalGaussianLight_t l9_595=l9_594;
sc_SphericalGaussianLight_t l9_596=l9_578;
float l9_597=length((l9_595.axis*l9_595.sharpness)+(l9_596.axis*l9_596.sharpness));
float3 l9_598=(l9_595.color*exp((l9_597-l9_595.sharpness)-l9_596.sharpness))*l9_596.color;
float l9_599=1.0-exp((-2.0)*l9_597);
float3 l9_600=((l9_598*6.2831855)*l9_599)/float3(l9_597);
float3 l9_601=l9_600;
float3 l9_602=l9_594.axis;
float l9_603=l9_583*l9_583;
float l9_604=fast::clamp(dot(l9_582,l9_602),0.0,1.0);
float l9_605=fast::clamp(dot(l9_582,l9_584),0.0,1.0);
float3 l9_606=normalize(l9_594.axis+l9_584);
float l9_607=l9_603;
float l9_608=l9_604;
float l9_609=1.0/(l9_608+sqrt(l9_607+(((1.0-l9_607)*l9_608)*l9_608)));
float l9_610=l9_603;
float l9_611=l9_605;
float l9_612=1.0/(l9_611+sqrt(l9_610+(((1.0-l9_610)*l9_611)*l9_611)));
l9_601*=(l9_609*l9_612);
float l9_613=pow(1.0-fast::clamp(dot(l9_602,l9_606),0.0,1.0),5.0);
l9_601*=(l9_585+((float3(1.0)-l9_585)*l9_613));
l9_601*=l9_604;
float3 l9_614=l9_601;
l9_577+=l9_614;
l9_581++;
continue;
}
else
{
break;
}
}
float3 l9_615=l9_577;
l9_431+=l9_615;
}
float3 l9_616=l9_431;
l9_194.indirectSpecular=l9_616;
LightingComponents l9_617=l9_194;
LightingComponents l9_618=l9_617;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_618.directDiffuse=float3(0.0);
l9_618.indirectDiffuse=float3(0.0);
float4 l9_619=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_620=out.FragColor0;
float4 l9_621=l9_620;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_621.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_622=l9_621;
l9_619=l9_622;
}
else
{
float4 l9_623=gl_FragCoord;
float2 l9_624=l9_623.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_625=l9_624;
float2 l9_626=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_627=1;
int l9_628=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_628=0;
}
else
{
l9_628=in.varStereoViewID;
}
int l9_629=l9_628;
int l9_630=l9_629;
float3 l9_631=float3(l9_625,0.0);
int l9_632=l9_627;
int l9_633=l9_630;
if (l9_632==1)
{
l9_631.y=((2.0*l9_631.y)+float(l9_633))-1.0;
}
float2 l9_634=l9_631.xy;
l9_626=l9_634;
}
else
{
l9_626=l9_625;
}
float2 l9_635=l9_626;
float2 l9_636=l9_635;
float2 l9_637=l9_636;
int l9_638=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_639=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_639=0;
}
else
{
l9_639=in.varStereoViewID;
}
int l9_640=l9_639;
l9_638=1-l9_640;
}
else
{
int l9_641=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_641=0;
}
else
{
l9_641=in.varStereoViewID;
}
int l9_642=l9_641;
l9_638=l9_642;
}
int l9_643=l9_638;
float2 l9_644=l9_637;
int l9_645=l9_643;
float2 l9_646=l9_644;
int l9_647=l9_645;
float l9_648=0.0;
float4 l9_649=float4(0.0);
float2 l9_650=l9_646;
int l9_651=sc_ScreenTextureLayout_tmp;
int l9_652=l9_647;
float l9_653=l9_648;
float2 l9_654=l9_650;
int l9_655=l9_651;
int l9_656=l9_652;
float3 l9_657=float3(0.0);
if (l9_655==0)
{
l9_657=float3(l9_654,0.0);
}
else
{
if (l9_655==1)
{
l9_657=float3(l9_654.x,(l9_654.y*0.5)+(0.5-(float(l9_656)*0.5)),0.0);
}
else
{
l9_657=float3(l9_654,float(l9_656));
}
}
float3 l9_658=l9_657;
float3 l9_659=l9_658;
float2 l9_660=l9_659.xy;
float l9_661=l9_653;
float4 l9_662=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_660,bias(l9_661));
float4 l9_663=l9_662;
l9_649=l9_663;
float4 l9_664=l9_649;
float4 l9_665=l9_664;
float4 l9_666=l9_665;
l9_619=l9_666;
}
float4 l9_667=l9_619;
float4 l9_668=l9_667;
float3 l9_669=l9_668.xyz;
float3 l9_670;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_670=float3(pow(l9_669.x,2.2),pow(l9_669.y,2.2),pow(l9_669.z,2.2));
}
else
{
l9_670=l9_669*l9_669;
}
float3 l9_671=l9_670;
float3 l9_672=l9_671;
l9_618.transmitted=l9_672*mix(float3(1.0),l9_178.albedo,float3(l9_178.opacity));
l9_178.opacity=1.0;
}
bool l9_673=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_673=true;
}
SurfaceProperties l9_674=l9_178;
LightingComponents l9_675=l9_618;
bool l9_676=l9_673;
float3 l9_677=float3(0.0);
bool l9_678=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_678)
{
l9_677=l9_674.albedo*(l9_675.directDiffuse+(l9_675.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_677=l9_674.albedo*(l9_675.directDiffuse+(l9_675.indirectDiffuse*l9_674.ao));
}
float3 l9_679=l9_675.directSpecular+(l9_675.indirectSpecular*l9_674.specularAo);
float3 l9_680=l9_674.emissive;
float3 l9_681=l9_675.transmitted;
if (l9_676)
{
float l9_682=l9_674.opacity;
l9_677*=srgbToLinear(l9_682);
}
float3 l9_683=((l9_677+l9_679)+l9_680)+l9_681;
float3 l9_684=l9_683;
float4 l9_685=float4(l9_684,l9_178.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_686=l9_685.xyz;
float l9_687=1.8;
float l9_688=1.4;
float l9_689=0.5;
float l9_690=1.5;
float3 l9_691=(l9_686*((l9_686*l9_687)+float3(l9_688)))/((l9_686*((l9_686*l9_687)+float3(l9_689)))+float3(l9_690));
l9_685=float4(l9_691.x,l9_691.y,l9_691.z,l9_685.w);
}
float3 l9_692=l9_685.xyz;
float l9_693=l9_692.x;
float l9_694=l9_692.y;
float l9_695=l9_692.z;
float3 l9_696=float3(linearToSrgb(l9_693),linearToSrgb(l9_694),linearToSrgb(l9_695));
l9_685=float4(l9_696.x,l9_696.y,l9_696.z,l9_685.w);
float4 l9_697=l9_685;
float4 l9_698=l9_697;
l9_698=fast::max(l9_698,float4(0.0));
l9_156=l9_698;
param_3=l9_156;
param_5=param_3;
}
else
{
float4 l9_699=float4(0.0);
float l9_700=1.0;
float4 l9_701=float4(1.0);
float4 l9_702=float4(0.5,0.0,0.0,0.0);
ssGlobals l9_703=param_6;
float l9_704=0.0;
float l9_705=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_704=l9_705;
l9_700=l9_704;
float4 l9_706;
if ((l9_700*1.0)!=0.0)
{
float2 l9_707=float2(0.0);
l9_707=l9_703.Surface_UVCoord0;
float2 l9_708=float2(0.0);
float2 l9_709=l9_707;
float l9_710=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_711=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_712=sin(radians(l9_710));
float l9_713=cos(radians(l9_710));
float2 l9_714=l9_709-l9_711;
l9_714=float2(dot(float2(l9_713,l9_712),l9_714),dot(float2(-l9_712,l9_713),l9_714))+l9_711;
l9_708=l9_714;
float l9_715=0.0;
l9_715=gParticle.Index1DPerCopyF;
float l9_716=0.0;
l9_716=gParticle.Ratio1DPerCopy;
float l9_717=0.0;
l9_717=(((l9_716-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_718=float4(0.0);
float2 l9_719=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_720=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_721=l9_708;
float l9_722=l9_715;
float l9_723=l9_717;
float l9_724=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_725=l9_703;
float2 l9_726=float2(0.0);
float l9_727=floor(l9_719.x);
float l9_728=floor(l9_719.y);
float l9_729=1.0/l9_727;
float l9_730=1.0/l9_728;
float l9_731=fast::min(l9_727*l9_728,floor(l9_720));
float l9_732=floor(mod(((l9_725.gTimeElapsedShifted+l9_724)*l9_723)+floor(l9_722),l9_731));
float l9_733=floor(l9_732/l9_727);
float l9_734=mod(l9_732,l9_727);
l9_726=float2((l9_729*l9_721.x)+(l9_734*l9_729),((1.0-l9_730)-(l9_733*l9_730))+(l9_730*l9_721.y));
int l9_735=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_736=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_736=0;
}
else
{
l9_736=in.varStereoViewID;
}
int l9_737=l9_736;
l9_735=1-l9_737;
}
else
{
int l9_738=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_738=0;
}
else
{
l9_738=in.varStereoViewID;
}
int l9_739=l9_738;
l9_735=l9_739;
}
int l9_740=l9_735;
int l9_741=flipbookTexLayout_tmp;
int l9_742=l9_740;
float2 l9_743=l9_726;
bool l9_744=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_745=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_746=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_747=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_748=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_749=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_750=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_751=0.0;
bool l9_752=l9_749&&(!l9_747);
float l9_753=1.0;
float l9_754=l9_743.x;
int l9_755=l9_746.x;
if (l9_755==1)
{
l9_754=fract(l9_754);
}
else
{
if (l9_755==2)
{
float l9_756=fract(l9_754);
float l9_757=l9_754-l9_756;
float l9_758=step(0.25,fract(l9_757*0.5));
l9_754=mix(l9_756,1.0-l9_756,fast::clamp(l9_758,0.0,1.0));
}
}
l9_743.x=l9_754;
float l9_759=l9_743.y;
int l9_760=l9_746.y;
if (l9_760==1)
{
l9_759=fract(l9_759);
}
else
{
if (l9_760==2)
{
float l9_761=fract(l9_759);
float l9_762=l9_759-l9_761;
float l9_763=step(0.25,fract(l9_762*0.5));
l9_759=mix(l9_761,1.0-l9_761,fast::clamp(l9_763,0.0,1.0));
}
}
l9_743.y=l9_759;
if (l9_747)
{
bool l9_764=l9_749;
bool l9_765;
if (l9_764)
{
l9_765=l9_746.x==3;
}
else
{
l9_765=l9_764;
}
float l9_766=l9_743.x;
float l9_767=l9_748.x;
float l9_768=l9_748.z;
bool l9_769=l9_765;
float l9_770=l9_753;
float l9_771=fast::clamp(l9_766,l9_767,l9_768);
float l9_772=step(abs(l9_766-l9_771),9.9999997e-06);
l9_770*=(l9_772+((1.0-float(l9_769))*(1.0-l9_772)));
l9_766=l9_771;
l9_743.x=l9_766;
l9_753=l9_770;
bool l9_773=l9_749;
bool l9_774;
if (l9_773)
{
l9_774=l9_746.y==3;
}
else
{
l9_774=l9_773;
}
float l9_775=l9_743.y;
float l9_776=l9_748.y;
float l9_777=l9_748.w;
bool l9_778=l9_774;
float l9_779=l9_753;
float l9_780=fast::clamp(l9_775,l9_776,l9_777);
float l9_781=step(abs(l9_775-l9_780),9.9999997e-06);
l9_779*=(l9_781+((1.0-float(l9_778))*(1.0-l9_781)));
l9_775=l9_780;
l9_743.y=l9_775;
l9_753=l9_779;
}
float2 l9_782=l9_743;
bool l9_783=l9_744;
float3x3 l9_784=l9_745;
if (l9_783)
{
l9_782=float2((l9_784*float3(l9_782,1.0)).xy);
}
float2 l9_785=l9_782;
float2 l9_786=l9_785;
float2 l9_787=l9_786;
l9_743=l9_787;
float l9_788=l9_743.x;
int l9_789=l9_746.x;
bool l9_790=l9_752;
float l9_791=l9_753;
if ((l9_789==0)||(l9_789==3))
{
float l9_792=l9_788;
float l9_793=0.0;
float l9_794=1.0;
bool l9_795=l9_790;
float l9_796=l9_791;
float l9_797=fast::clamp(l9_792,l9_793,l9_794);
float l9_798=step(abs(l9_792-l9_797),9.9999997e-06);
l9_796*=(l9_798+((1.0-float(l9_795))*(1.0-l9_798)));
l9_792=l9_797;
l9_788=l9_792;
l9_791=l9_796;
}
l9_743.x=l9_788;
l9_753=l9_791;
float l9_799=l9_743.y;
int l9_800=l9_746.y;
bool l9_801=l9_752;
float l9_802=l9_753;
if ((l9_800==0)||(l9_800==3))
{
float l9_803=l9_799;
float l9_804=0.0;
float l9_805=1.0;
bool l9_806=l9_801;
float l9_807=l9_802;
float l9_808=fast::clamp(l9_803,l9_804,l9_805);
float l9_809=step(abs(l9_803-l9_808),9.9999997e-06);
l9_807*=(l9_809+((1.0-float(l9_806))*(1.0-l9_809)));
l9_803=l9_808;
l9_799=l9_803;
l9_802=l9_807;
}
l9_743.y=l9_799;
l9_753=l9_802;
float2 l9_810=l9_743;
int l9_811=l9_741;
int l9_812=l9_742;
float l9_813=l9_751;
float2 l9_814=l9_810;
int l9_815=l9_811;
int l9_816=l9_812;
float3 l9_817=float3(0.0);
if (l9_815==0)
{
l9_817=float3(l9_814,0.0);
}
else
{
if (l9_815==1)
{
l9_817=float3(l9_814.x,(l9_814.y*0.5)+(0.5-(float(l9_816)*0.5)),0.0);
}
else
{
l9_817=float3(l9_814,float(l9_816));
}
}
float3 l9_818=l9_817;
float3 l9_819=l9_818;
float2 l9_820=l9_819.xy;
float l9_821=l9_813;
float4 l9_822=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_820,bias(l9_821));
float4 l9_823=l9_822;
float4 l9_824=l9_823;
if (l9_749)
{
l9_824=mix(l9_750,l9_824,float4(l9_753));
}
float4 l9_825=l9_824;
float4 l9_826=l9_825;
l9_718=l9_826;
float l9_827=0.0;
l9_827=l9_718.w;
float4 l9_828=float4(0.0);
l9_828=gParticle.Color;
float l9_829=0.0;
l9_829=l9_828.w;
float l9_830=0.0;
l9_830=l9_827*l9_829;
float2 l9_831=float2(0.0);
l9_831=l9_703.Surface_UVCoord0;
float2 l9_832=float2(0.0);
l9_832=l9_831*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_833=float2(0.0);
l9_833=l9_832-float2(1.0);
float l9_834=0.0;
l9_834=dot(l9_833,l9_833);
float l9_835=0.0;
l9_835=fast::clamp(l9_834+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_836=0.0;
l9_836=1.0-l9_835;
float l9_837=0.0;
float l9_838;
if (l9_836<=0.0)
{
l9_838=0.0;
}
else
{
l9_838=sqrt(l9_836);
}
l9_837=l9_838;
float3 l9_839=float3(0.0);
l9_839=float3(l9_833.x,l9_833.y,l9_839.z);
l9_839.z=l9_837;
float l9_840=0.0;
l9_840=distance(l9_831,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_841=0.0;
l9_841=float(l9_840<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_842=float3(0.0);
l9_842=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_839,float3(l9_841));
float3 l9_843=float3(0.0);
l9_843=l9_842;
float4 l9_844=float4(0.0);
float3 l9_845=l9_718.xyz;
float l9_846=l9_830;
float3 l9_847=l9_843;
float3 l9_848=(*sc_set0.UserUniforms).Port_Emissive_N026;
float l9_849=(*sc_set0.UserUniforms).Port_Metallic_N026;
float l9_850=(*sc_set0.UserUniforms).Port_Roughness_N026;
float3 l9_851=(*sc_set0.UserUniforms).Port_AO_N026;
float3 l9_852=(*sc_set0.UserUniforms).Port_SpecularAO_N026;
ssGlobals l9_853=l9_703;
l9_853.BumpedNormal=float3x3(float3(l9_853.VertexTangent_WorldSpace),float3(l9_853.VertexBinormal_WorldSpace),float3(l9_853.VertexNormal_WorldSpace))*l9_847;
l9_846=fast::clamp(l9_846,0.0,1.0);
l9_845=fast::max(l9_845,float3(0.0));
float3 l9_854=l9_845;
float l9_855=l9_846;
float3 l9_856=l9_853.BumpedNormal;
float3 l9_857=l9_853.PositionWS;
float3 l9_858=l9_853.ViewDirWS;
float3 l9_859=l9_848;
float l9_860=l9_849;
float l9_861=l9_850;
float3 l9_862=l9_851;
float3 l9_863=l9_852;
SurfaceProperties l9_864;
l9_864.albedo=float3(0.0);
l9_864.opacity=1.0;
l9_864.normal=float3(0.0);
l9_864.positionWS=float3(0.0);
l9_864.viewDirWS=float3(0.0);
l9_864.metallic=0.0;
l9_864.roughness=0.0;
l9_864.emissive=float3(0.0);
l9_864.ao=float3(1.0);
l9_864.specularAo=float3(1.0);
l9_864.bakedShadows=float3(1.0);
SurfaceProperties l9_865=l9_864;
SurfaceProperties l9_866=l9_865;
l9_866.opacity=l9_855;
float3 l9_867=l9_854;
float3 l9_868;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_868=float3(pow(l9_867.x,2.2),pow(l9_867.y,2.2),pow(l9_867.z,2.2));
}
else
{
l9_868=l9_867*l9_867;
}
float3 l9_869=l9_868;
l9_866.albedo=l9_869;
l9_866.normal=normalize(l9_856);
l9_866.positionWS=l9_857;
l9_866.viewDirWS=l9_858;
float3 l9_870=l9_859;
float3 l9_871;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_871=float3(pow(l9_870.x,2.2),pow(l9_870.y,2.2),pow(l9_870.z,2.2));
}
else
{
l9_871=l9_870*l9_870;
}
float3 l9_872=l9_871;
l9_866.emissive=l9_872;
l9_866.metallic=l9_860;
l9_866.roughness=l9_861;
l9_866.ao=l9_862;
l9_866.specularAo=l9_863;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_873=l9_866.positionWS;
l9_866.ao=evaluateSSAO(l9_873,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_874=l9_866;
SurfaceProperties l9_875=l9_874;
float3 l9_876=mix(float3(0.039999999),l9_875.albedo*l9_875.metallic,float3(l9_875.metallic));
float3 l9_877=mix(l9_875.albedo*(1.0-l9_875.metallic),float3(0.0),float3(l9_875.metallic));
l9_874.albedo=l9_877;
l9_874.specColor=l9_876;
SurfaceProperties l9_878=l9_874;
l9_866=l9_878;
SurfaceProperties l9_879=l9_866;
LightingComponents l9_880;
l9_880.directDiffuse=float3(0.0);
l9_880.directSpecular=float3(0.0);
l9_880.indirectDiffuse=float3(1.0);
l9_880.indirectSpecular=float3(0.0);
l9_880.emitted=float3(0.0);
l9_880.transmitted=float3(0.0);
LightingComponents l9_881=l9_880;
LightingComponents l9_882=l9_881;
float3 l9_883=l9_879.viewDirWS;
int l9_884=0;
float4 l9_885=float4(l9_879.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_886;
LightProperties l9_887;
int l9_888=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_888<sc_DirectionalLightsCount_tmp)
{
l9_886.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_888].direction;
l9_886.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_888].color;
l9_887.direction=l9_886.direction;
l9_887.color=l9_886.color.xyz;
l9_887.attenuation=l9_886.color.w;
l9_887.attenuation*=l9_885[(l9_884<3) ? l9_884 : 3];
l9_884++;
LightingComponents l9_889=l9_882;
LightProperties l9_890=l9_887;
SurfaceProperties l9_891=l9_879;
float3 l9_892=l9_883;
SurfaceProperties l9_893=l9_891;
float3 l9_894=l9_890.direction;
float3 l9_895=float3(fast::clamp(dot(l9_893.normal,l9_894),0.0,1.0));
l9_889.directDiffuse+=((l9_895*l9_890.color)*l9_890.attenuation);
SurfaceProperties l9_896=l9_891;
float3 l9_897=l9_890.direction;
float3 l9_898=l9_892;
l9_889.directSpecular+=((calculateDirectSpecular(l9_896,l9_897,l9_898)*l9_890.color)*l9_890.attenuation);
LightingComponents l9_899=l9_889;
l9_882=l9_899;
l9_888++;
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
sc_PointLight_t_1 l9_900;
LightProperties l9_901;
int l9_902=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_902<sc_PointLightsCount_tmp)
{
l9_900.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_902].falloffEnabled!=0;
l9_900.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_902].falloffEndDistance;
l9_900.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_902].negRcpFalloffEndDistance4;
l9_900.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_902].angleScale;
l9_900.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_902].angleOffset;
l9_900.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_902].direction;
l9_900.position=(*sc_set0.UserUniforms).sc_PointLights[l9_902].position;
l9_900.color=(*sc_set0.UserUniforms).sc_PointLights[l9_902].color;
float3 l9_903=l9_900.position-l9_879.positionWS;
l9_901.direction=normalize(l9_903);
l9_901.color=l9_900.color.xyz;
l9_901.attenuation=l9_900.color.w;
l9_901.attenuation*=l9_885[(l9_884<3) ? l9_884 : 3];
float3 l9_904=l9_901.direction;
float3 l9_905=l9_900.direction;
float l9_906=l9_900.angleScale;
float l9_907=l9_900.angleOffset;
float l9_908=dot(l9_904,l9_905);
float l9_909=fast::clamp((l9_908*l9_906)+l9_907,0.0,1.0);
float l9_910=l9_909*l9_909;
l9_901.attenuation*=l9_910;
if (l9_900.falloffEnabled)
{
float l9_911=length(l9_903);
float l9_912=l9_900.falloffEndDistance;
l9_901.attenuation*=computeDistanceAttenuation(l9_911,l9_912);
}
l9_884++;
LightingComponents l9_913=l9_882;
LightProperties l9_914=l9_901;
SurfaceProperties l9_915=l9_879;
float3 l9_916=l9_883;
SurfaceProperties l9_917=l9_915;
float3 l9_918=l9_914.direction;
float3 l9_919=float3(fast::clamp(dot(l9_917.normal,l9_918),0.0,1.0));
l9_913.directDiffuse+=((l9_919*l9_914.color)*l9_914.attenuation);
SurfaceProperties l9_920=l9_915;
float3 l9_921=l9_914.direction;
float3 l9_922=l9_916;
l9_913.directSpecular+=((calculateDirectSpecular(l9_920,l9_921,l9_922)*l9_914.color)*l9_914.attenuation);
LightingComponents l9_923=l9_913;
l9_882=l9_923;
l9_902++;
continue;
}
else
{
break;
}
}
}
bool l9_924=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_924)
{
float4 l9_925=gl_FragCoord;
float2 l9_926=l9_925.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_927=l9_926;
float2 l9_928=l9_927;
int l9_929=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_930=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_930=0;
}
else
{
l9_930=in.varStereoViewID;
}
int l9_931=l9_930;
l9_929=1-l9_931;
}
else
{
int l9_932=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_932=0;
}
else
{
l9_932=in.varStereoViewID;
}
int l9_933=l9_932;
l9_929=l9_933;
}
int l9_934=l9_929;
float2 l9_935=l9_928;
int l9_936=l9_934;
float2 l9_937=l9_935;
int l9_938=l9_936;
float l9_939=0.0;
float4 l9_940=float4(0.0);
float2 l9_941=l9_937;
int l9_942=sc_RayTracedShadowTextureLayout_tmp;
int l9_943=l9_938;
float l9_944=l9_939;
float2 l9_945=l9_941;
int l9_946=l9_942;
int l9_947=l9_943;
float3 l9_948=float3(0.0);
if (l9_946==0)
{
l9_948=float3(l9_945,0.0);
}
else
{
if (l9_946==1)
{
l9_948=float3(l9_945.x,(l9_945.y*0.5)+(0.5-(float(l9_947)*0.5)),0.0);
}
else
{
l9_948=float3(l9_945,float(l9_947));
}
}
float3 l9_949=l9_948;
float3 l9_950=l9_949;
float2 l9_951=l9_950.xy;
float l9_952=l9_944;
float4 l9_953=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_951,bias(l9_952));
float4 l9_954=l9_953;
l9_940=l9_954;
float4 l9_955=l9_940;
float4 l9_956=l9_955;
float4 l9_957=l9_956;
float l9_958=l9_957.x;
float3 l9_959=float3(l9_958);
float3 l9_960=l9_959;
l9_882.directDiffuse*=(float3(1.0)-l9_960);
l9_882.directSpecular*=(float3(1.0)-l9_960);
}
SurfaceProperties l9_961=l9_879;
float3 l9_962=l9_961.normal;
float3 l9_963=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_964=l9_962;
float3 l9_965=l9_964;
float l9_966=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_967=float2(0.0);
float l9_968=l9_965.x;
float l9_969=-l9_965.z;
float l9_970=(l9_968<0.0) ? (-1.0) : 1.0;
float l9_971=l9_970*acos(fast::clamp(l9_969/length(float2(l9_968,l9_969)),-1.0,1.0));
l9_967.x=l9_971-1.5707964;
l9_967.y=acos(l9_965.y);
l9_967/=float2(6.2831855,3.1415927);
l9_967.y=1.0-l9_967.y;
l9_967.x+=(l9_966/360.0);
l9_967.x=fract((l9_967.x+floor(l9_967.x))+1.0);
float2 l9_972=l9_967;
float2 l9_973=l9_972;
float4 l9_974=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_975=l9_973;
float2 l9_976=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_977=5.0;
l9_973=calcSeamlessPanoramicUvsForSampling(l9_975,l9_976,l9_977);
}
float2 l9_978=l9_973;
float l9_979=13.0;
int l9_980=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_981=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_981=0;
}
else
{
l9_981=in.varStereoViewID;
}
int l9_982=l9_981;
l9_980=1-l9_982;
}
else
{
int l9_983=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_983=0;
}
else
{
l9_983=in.varStereoViewID;
}
int l9_984=l9_983;
l9_980=l9_984;
}
int l9_985=l9_980;
float2 l9_986=l9_978;
int l9_987=l9_985;
float l9_988=l9_979;
float4 l9_989=float4(0.0);
float2 l9_990=l9_986;
int l9_991=sc_EnvmapSpecularLayout_tmp;
int l9_992=l9_987;
float l9_993=l9_988;
float2 l9_994=l9_990;
int l9_995=l9_991;
int l9_996=l9_992;
float3 l9_997=float3(0.0);
if (l9_995==0)
{
l9_997=float3(l9_994,0.0);
}
else
{
if (l9_995==1)
{
l9_997=float3(l9_994.x,(l9_994.y*0.5)+(0.5-(float(l9_996)*0.5)),0.0);
}
else
{
l9_997=float3(l9_994,float(l9_996));
}
}
float3 l9_998=l9_997;
float3 l9_999=l9_998;
float2 l9_1000=l9_999.xy;
float l9_1001=l9_993;
float4 l9_1002=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1000,bias(l9_1001));
float4 l9_1003=l9_1002;
l9_989=l9_1003;
float4 l9_1004=l9_989;
float4 l9_1005=l9_1004;
l9_974=l9_1005;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_1006=l9_973;
float2 l9_1007=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_1008=0.0;
l9_973=calcSeamlessPanoramicUvsForSampling(l9_1006,l9_1007,l9_1008);
float2 l9_1009=l9_973;
float l9_1010=-13.0;
int l9_1011=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_1012=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1012=0;
}
else
{
l9_1012=in.varStereoViewID;
}
int l9_1013=l9_1012;
l9_1011=1-l9_1013;
}
else
{
int l9_1014=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1014=0;
}
else
{
l9_1014=in.varStereoViewID;
}
int l9_1015=l9_1014;
l9_1011=l9_1015;
}
int l9_1016=l9_1011;
float2 l9_1017=l9_1009;
int l9_1018=l9_1016;
float l9_1019=l9_1010;
float4 l9_1020=float4(0.0);
float2 l9_1021=l9_1017;
int l9_1022=sc_EnvmapDiffuseLayout_tmp;
int l9_1023=l9_1018;
float l9_1024=l9_1019;
float2 l9_1025=l9_1021;
int l9_1026=l9_1022;
int l9_1027=l9_1023;
float3 l9_1028=float3(0.0);
if (l9_1026==0)
{
l9_1028=float3(l9_1025,0.0);
}
else
{
if (l9_1026==1)
{
l9_1028=float3(l9_1025.x,(l9_1025.y*0.5)+(0.5-(float(l9_1027)*0.5)),0.0);
}
else
{
l9_1028=float3(l9_1025,float(l9_1027));
}
}
float3 l9_1029=l9_1028;
float3 l9_1030=l9_1029;
float2 l9_1031=l9_1030.xy;
float l9_1032=l9_1024;
float4 l9_1033=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_1031,bias(l9_1032));
float4 l9_1034=l9_1033;
l9_1020=l9_1034;
float4 l9_1035=l9_1020;
float4 l9_1036=l9_1035;
l9_974=l9_1036;
}
else
{
float2 l9_1037=l9_973;
float l9_1038=13.0;
int l9_1039=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1040=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1040=0;
}
else
{
l9_1040=in.varStereoViewID;
}
int l9_1041=l9_1040;
l9_1039=1-l9_1041;
}
else
{
int l9_1042=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1042=0;
}
else
{
l9_1042=in.varStereoViewID;
}
int l9_1043=l9_1042;
l9_1039=l9_1043;
}
int l9_1044=l9_1039;
float2 l9_1045=l9_1037;
int l9_1046=l9_1044;
float l9_1047=l9_1038;
float4 l9_1048=float4(0.0);
float2 l9_1049=l9_1045;
int l9_1050=sc_EnvmapSpecularLayout_tmp;
int l9_1051=l9_1046;
float l9_1052=l9_1047;
float2 l9_1053=l9_1049;
int l9_1054=l9_1050;
int l9_1055=l9_1051;
float3 l9_1056=float3(0.0);
if (l9_1054==0)
{
l9_1056=float3(l9_1053,0.0);
}
else
{
if (l9_1054==1)
{
l9_1056=float3(l9_1053.x,(l9_1053.y*0.5)+(0.5-(float(l9_1055)*0.5)),0.0);
}
else
{
l9_1056=float3(l9_1053,float(l9_1055));
}
}
float3 l9_1057=l9_1056;
float3 l9_1058=l9_1057;
float2 l9_1059=l9_1058.xy;
float l9_1060=l9_1052;
float4 l9_1061=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1059,bias(l9_1060));
float4 l9_1062=l9_1061;
l9_1048=l9_1062;
float4 l9_1063=l9_1048;
float4 l9_1064=l9_1063;
l9_974=l9_1064;
}
}
float4 l9_1065=l9_974;
float3 l9_1066=l9_1065.xyz*(1.0/l9_1065.w);
float3 l9_1067=l9_1066*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_963=l9_1067;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_1068=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_1069=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_1070=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_1071=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_1072=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_1073=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_1074=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_1075=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_1076=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_1077=-l9_962;
float l9_1078=0.0;
l9_1078=l9_1077.x;
float l9_1079=l9_1077.y;
float l9_1080=l9_1077.z;
float l9_1081=l9_1078*l9_1078;
float l9_1082=l9_1079*l9_1079;
float l9_1083=l9_1080*l9_1080;
float l9_1084=l9_1078*l9_1079;
float l9_1085=l9_1079*l9_1080;
float l9_1086=l9_1078*l9_1080;
float3 l9_1087=((((((l9_1076*0.42904299)*(l9_1081-l9_1082))+((l9_1074*0.74312502)*l9_1083))+(l9_1068*0.88622701))-(l9_1074*0.24770799))+((((l9_1072*l9_1084)+(l9_1075*l9_1086))+(l9_1073*l9_1085))*0.85808599))+((((l9_1071*l9_1078)+(l9_1069*l9_1079))+(l9_1070*l9_1080))*1.0233279);
l9_963=l9_1087*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_1088=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_1088)
{
float4 l9_1089=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_963=mix(l9_963,l9_1089.xyz,float3(l9_1089.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_963+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_963.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_963+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_963.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_963+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_963.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_1090=l9_962;
float3 l9_1091=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_1092;
float l9_1093;
int l9_1094=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1094<sc_LightEstimationSGCount_tmp)
{
l9_1092.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1094].color;
l9_1092.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1094].sharpness;
l9_1092.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1094].axis;
float3 l9_1095=l9_1090;
float l9_1096=dot(l9_1092.axis,l9_1095);
float l9_1097=l9_1092.sharpness;
float l9_1098=0.36000001;
float l9_1099=1.0/(4.0*l9_1098);
float l9_1100=exp(-l9_1097);
float l9_1101=l9_1100*l9_1100;
float l9_1102=1.0/l9_1097;
float l9_1103=(1.0+(2.0*l9_1101))-l9_1102;
float l9_1104=((l9_1100-l9_1101)*l9_1102)-l9_1101;
float l9_1105=sqrt(1.0-l9_1103);
float l9_1106=l9_1098*l9_1096;
float l9_1107=l9_1099*l9_1105;
float l9_1108=l9_1106+l9_1107;
float l9_1109=fast::clamp(l9_1096,0.0,1.0);
if (step(abs(l9_1106),l9_1107)>0.5)
{
l9_1093=(l9_1108*l9_1108)/l9_1105;
}
else
{
l9_1093=l9_1109;
}
l9_1109=l9_1093;
float l9_1110=(l9_1103*l9_1109)+l9_1104;
sc_SphericalGaussianLight_t l9_1111=l9_1092;
float3 l9_1112=(l9_1111.color/float3(l9_1111.sharpness))*6.2831855;
float3 l9_1113=(l9_1112*l9_1110)/float3(3.1415927);
l9_1091+=l9_1113;
l9_1094++;
continue;
}
else
{
break;
}
}
float3 l9_1114=l9_1091;
l9_963+=l9_1114;
}
float3 l9_1115=l9_963;
float3 l9_1116=l9_1115;
l9_882.indirectDiffuse=l9_1116;
SurfaceProperties l9_1117=l9_879;
float3 l9_1118=l9_883;
float3 l9_1119=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_1120=l9_1117;
float3 l9_1121=l9_1118;
float3 l9_1122=l9_1120.normal;
float3 l9_1123=reflect(-l9_1121,l9_1122);
float3 l9_1124=l9_1122;
float3 l9_1125=l9_1123;
float l9_1126=l9_1120.roughness;
l9_1123=getSpecularDominantDir(l9_1124,l9_1125,l9_1126);
float l9_1127=l9_1120.roughness;
float l9_1128=fast::clamp(pow(l9_1127,0.66666669),0.0,1.0)*5.0;
float l9_1129=l9_1128;
float l9_1130=l9_1129;
float3 l9_1131=l9_1123;
float l9_1132=l9_1130;
float3 l9_1133=l9_1131;
float l9_1134=l9_1132;
float4 l9_1135=float4(0.0);
float3 l9_1136=l9_1133;
float l9_1137=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_1138=float2(0.0);
float l9_1139=l9_1136.x;
float l9_1140=-l9_1136.z;
float l9_1141=(l9_1139<0.0) ? (-1.0) : 1.0;
float l9_1142=l9_1141*acos(fast::clamp(l9_1140/length(float2(l9_1139,l9_1140)),-1.0,1.0));
l9_1138.x=l9_1142-1.5707964;
l9_1138.y=acos(l9_1136.y);
l9_1138/=float2(6.2831855,3.1415927);
l9_1138.y=1.0-l9_1138.y;
l9_1138.x+=(l9_1137/360.0);
l9_1138.x=fract((l9_1138.x+floor(l9_1138.x))+1.0);
float2 l9_1143=l9_1138;
float2 l9_1144=l9_1143;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_1145=floor(l9_1134);
float l9_1146=ceil(l9_1134);
float l9_1147=l9_1134-l9_1145;
float2 l9_1148=l9_1144;
float2 l9_1149=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1150=l9_1145;
float2 l9_1151=calcSeamlessPanoramicUvsForSampling(l9_1148,l9_1149,l9_1150);
float2 l9_1152=l9_1151;
float l9_1153=l9_1145;
float2 l9_1154=l9_1152;
float l9_1155=l9_1153;
int l9_1156=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1157=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1157=0;
}
else
{
l9_1157=in.varStereoViewID;
}
int l9_1158=l9_1157;
l9_1156=1-l9_1158;
}
else
{
int l9_1159=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1159=0;
}
else
{
l9_1159=in.varStereoViewID;
}
int l9_1160=l9_1159;
l9_1156=l9_1160;
}
int l9_1161=l9_1156;
float2 l9_1162=l9_1154;
int l9_1163=l9_1161;
float l9_1164=l9_1155;
float4 l9_1165=float4(0.0);
float2 l9_1166=l9_1162;
int l9_1167=sc_EnvmapSpecularLayout_tmp;
int l9_1168=l9_1163;
float l9_1169=l9_1164;
float2 l9_1170=l9_1166;
int l9_1171=l9_1167;
int l9_1172=l9_1168;
float3 l9_1173=float3(0.0);
if (l9_1171==0)
{
l9_1173=float3(l9_1170,0.0);
}
else
{
if (l9_1171==1)
{
l9_1173=float3(l9_1170.x,(l9_1170.y*0.5)+(0.5-(float(l9_1172)*0.5)),0.0);
}
else
{
l9_1173=float3(l9_1170,float(l9_1172));
}
}
float3 l9_1174=l9_1173;
float3 l9_1175=l9_1174;
float2 l9_1176=l9_1175.xy;
float l9_1177=l9_1169;
float4 l9_1178=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1176,level(l9_1177));
float4 l9_1179=l9_1178;
l9_1165=l9_1179;
float4 l9_1180=l9_1165;
float4 l9_1181=l9_1180;
float4 l9_1182=l9_1181;
float4 l9_1183=l9_1182;
float2 l9_1184=l9_1144;
float2 l9_1185=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1186=l9_1146;
float2 l9_1187=calcSeamlessPanoramicUvsForSampling(l9_1184,l9_1185,l9_1186);
float2 l9_1188=l9_1187;
float l9_1189=l9_1146;
float2 l9_1190=l9_1188;
float l9_1191=l9_1189;
int l9_1192=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1193=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1193=0;
}
else
{
l9_1193=in.varStereoViewID;
}
int l9_1194=l9_1193;
l9_1192=1-l9_1194;
}
else
{
int l9_1195=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1195=0;
}
else
{
l9_1195=in.varStereoViewID;
}
int l9_1196=l9_1195;
l9_1192=l9_1196;
}
int l9_1197=l9_1192;
float2 l9_1198=l9_1190;
int l9_1199=l9_1197;
float l9_1200=l9_1191;
float4 l9_1201=float4(0.0);
float2 l9_1202=l9_1198;
int l9_1203=sc_EnvmapSpecularLayout_tmp;
int l9_1204=l9_1199;
float l9_1205=l9_1200;
float2 l9_1206=l9_1202;
int l9_1207=l9_1203;
int l9_1208=l9_1204;
float3 l9_1209=float3(0.0);
if (l9_1207==0)
{
l9_1209=float3(l9_1206,0.0);
}
else
{
if (l9_1207==1)
{
l9_1209=float3(l9_1206.x,(l9_1206.y*0.5)+(0.5-(float(l9_1208)*0.5)),0.0);
}
else
{
l9_1209=float3(l9_1206,float(l9_1208));
}
}
float3 l9_1210=l9_1209;
float3 l9_1211=l9_1210;
float2 l9_1212=l9_1211.xy;
float l9_1213=l9_1205;
float4 l9_1214=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1212,level(l9_1213));
float4 l9_1215=l9_1214;
l9_1201=l9_1215;
float4 l9_1216=l9_1201;
float4 l9_1217=l9_1216;
float4 l9_1218=l9_1217;
float4 l9_1219=l9_1218;
l9_1135=mix(l9_1183,l9_1219,float4(l9_1147));
}
else
{
float2 l9_1220=l9_1144;
float l9_1221=l9_1134;
float2 l9_1222=l9_1220;
float l9_1223=l9_1221;
int l9_1224=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1225=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1225=0;
}
else
{
l9_1225=in.varStereoViewID;
}
int l9_1226=l9_1225;
l9_1224=1-l9_1226;
}
else
{
int l9_1227=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1227=0;
}
else
{
l9_1227=in.varStereoViewID;
}
int l9_1228=l9_1227;
l9_1224=l9_1228;
}
int l9_1229=l9_1224;
float2 l9_1230=l9_1222;
int l9_1231=l9_1229;
float l9_1232=l9_1223;
float4 l9_1233=float4(0.0);
float2 l9_1234=l9_1230;
int l9_1235=sc_EnvmapSpecularLayout_tmp;
int l9_1236=l9_1231;
float l9_1237=l9_1232;
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
float4 l9_1246=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1244,level(l9_1245));
float4 l9_1247=l9_1246;
l9_1233=l9_1247;
float4 l9_1248=l9_1233;
float4 l9_1249=l9_1248;
float4 l9_1250=l9_1249;
l9_1135=l9_1250;
}
float4 l9_1251=l9_1135;
float3 l9_1252=l9_1251.xyz*(1.0/l9_1251.w);
float3 l9_1253=l9_1252;
float3 l9_1254=l9_1253*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_1254+=float3(1e-06);
float3 l9_1255=l9_1254;
float3 l9_1256=l9_1255;
bool l9_1257=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_1257)
{
float4 l9_1258=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_1256=mix(l9_1256,l9_1258.xyz,float3(l9_1258.w));
}
SurfaceProperties l9_1259=l9_1120;
float l9_1260=abs(dot(l9_1122,l9_1121));
float3 l9_1261=l9_1256*envBRDFApprox(l9_1259,l9_1260);
l9_1119+=l9_1261;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_1262=l9_1117;
float3 l9_1263=l9_1118;
float l9_1264=fast::clamp(l9_1262.roughness*l9_1262.roughness,0.0099999998,1.0);
float3 l9_1265=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_1262.specColor;
sc_SphericalGaussianLight_t l9_1266;
sc_SphericalGaussianLight_t l9_1267;
sc_SphericalGaussianLight_t l9_1268;
int l9_1269=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1269<sc_LightEstimationSGCount_tmp)
{
l9_1266.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1269].color;
l9_1266.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1269].sharpness;
l9_1266.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1269].axis;
float3 l9_1270=l9_1262.normal;
float l9_1271=l9_1264;
float3 l9_1272=l9_1263;
float3 l9_1273=l9_1262.specColor;
float3 l9_1274=l9_1270;
float l9_1275=l9_1271;
l9_1267.axis=l9_1274;
float l9_1276=l9_1275*l9_1275;
l9_1267.sharpness=2.0/l9_1276;
l9_1267.color=float3(1.0/(3.1415927*l9_1276));
sc_SphericalGaussianLight_t l9_1277=l9_1267;
sc_SphericalGaussianLight_t l9_1278=l9_1277;
sc_SphericalGaussianLight_t l9_1279=l9_1278;
float3 l9_1280=l9_1272;
l9_1268.axis=reflect(-l9_1280,l9_1279.axis);
l9_1268.color=l9_1279.color;
l9_1268.sharpness=l9_1279.sharpness;
l9_1268.sharpness/=(4.0*fast::max(dot(l9_1279.axis,l9_1280),9.9999997e-05));
sc_SphericalGaussianLight_t l9_1281=l9_1268;
sc_SphericalGaussianLight_t l9_1282=l9_1281;
sc_SphericalGaussianLight_t l9_1283=l9_1282;
sc_SphericalGaussianLight_t l9_1284=l9_1266;
float l9_1285=length((l9_1283.axis*l9_1283.sharpness)+(l9_1284.axis*l9_1284.sharpness));
float3 l9_1286=(l9_1283.color*exp((l9_1285-l9_1283.sharpness)-l9_1284.sharpness))*l9_1284.color;
float l9_1287=1.0-exp((-2.0)*l9_1285);
float3 l9_1288=((l9_1286*6.2831855)*l9_1287)/float3(l9_1285);
float3 l9_1289=l9_1288;
float3 l9_1290=l9_1282.axis;
float l9_1291=l9_1271*l9_1271;
float l9_1292=fast::clamp(dot(l9_1270,l9_1290),0.0,1.0);
float l9_1293=fast::clamp(dot(l9_1270,l9_1272),0.0,1.0);
float3 l9_1294=normalize(l9_1282.axis+l9_1272);
float l9_1295=l9_1291;
float l9_1296=l9_1292;
float l9_1297=1.0/(l9_1296+sqrt(l9_1295+(((1.0-l9_1295)*l9_1296)*l9_1296)));
float l9_1298=l9_1291;
float l9_1299=l9_1293;
float l9_1300=1.0/(l9_1299+sqrt(l9_1298+(((1.0-l9_1298)*l9_1299)*l9_1299)));
l9_1289*=(l9_1297*l9_1300);
float l9_1301=pow(1.0-fast::clamp(dot(l9_1290,l9_1294),0.0,1.0),5.0);
l9_1289*=(l9_1273+((float3(1.0)-l9_1273)*l9_1301));
l9_1289*=l9_1292;
float3 l9_1302=l9_1289;
l9_1265+=l9_1302;
l9_1269++;
continue;
}
else
{
break;
}
}
float3 l9_1303=l9_1265;
l9_1119+=l9_1303;
}
float3 l9_1304=l9_1119;
l9_882.indirectSpecular=l9_1304;
LightingComponents l9_1305=l9_882;
LightingComponents l9_1306=l9_1305;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1306.directDiffuse=float3(0.0);
l9_1306.indirectDiffuse=float3(0.0);
float4 l9_1307=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1308=out.FragColor0;
float4 l9_1309=l9_1308;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1309.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1310=l9_1309;
l9_1307=l9_1310;
}
else
{
float4 l9_1311=gl_FragCoord;
float2 l9_1312=l9_1311.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1313=l9_1312;
float2 l9_1314=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1315=1;
int l9_1316=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1316=0;
}
else
{
l9_1316=in.varStereoViewID;
}
int l9_1317=l9_1316;
int l9_1318=l9_1317;
float3 l9_1319=float3(l9_1313,0.0);
int l9_1320=l9_1315;
int l9_1321=l9_1318;
if (l9_1320==1)
{
l9_1319.y=((2.0*l9_1319.y)+float(l9_1321))-1.0;
}
float2 l9_1322=l9_1319.xy;
l9_1314=l9_1322;
}
else
{
l9_1314=l9_1313;
}
float2 l9_1323=l9_1314;
float2 l9_1324=l9_1323;
float2 l9_1325=l9_1324;
int l9_1326=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1327=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1327=0;
}
else
{
l9_1327=in.varStereoViewID;
}
int l9_1328=l9_1327;
l9_1326=1-l9_1328;
}
else
{
int l9_1329=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1329=0;
}
else
{
l9_1329=in.varStereoViewID;
}
int l9_1330=l9_1329;
l9_1326=l9_1330;
}
int l9_1331=l9_1326;
float2 l9_1332=l9_1325;
int l9_1333=l9_1331;
float2 l9_1334=l9_1332;
int l9_1335=l9_1333;
float l9_1336=0.0;
float4 l9_1337=float4(0.0);
float2 l9_1338=l9_1334;
int l9_1339=sc_ScreenTextureLayout_tmp;
int l9_1340=l9_1335;
float l9_1341=l9_1336;
float2 l9_1342=l9_1338;
int l9_1343=l9_1339;
int l9_1344=l9_1340;
float3 l9_1345=float3(0.0);
if (l9_1343==0)
{
l9_1345=float3(l9_1342,0.0);
}
else
{
if (l9_1343==1)
{
l9_1345=float3(l9_1342.x,(l9_1342.y*0.5)+(0.5-(float(l9_1344)*0.5)),0.0);
}
else
{
l9_1345=float3(l9_1342,float(l9_1344));
}
}
float3 l9_1346=l9_1345;
float3 l9_1347=l9_1346;
float2 l9_1348=l9_1347.xy;
float l9_1349=l9_1341;
float4 l9_1350=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1348,bias(l9_1349));
float4 l9_1351=l9_1350;
l9_1337=l9_1351;
float4 l9_1352=l9_1337;
float4 l9_1353=l9_1352;
float4 l9_1354=l9_1353;
l9_1307=l9_1354;
}
float4 l9_1355=l9_1307;
float4 l9_1356=l9_1355;
float3 l9_1357=l9_1356.xyz;
float3 l9_1358;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1358=float3(pow(l9_1357.x,2.2),pow(l9_1357.y,2.2),pow(l9_1357.z,2.2));
}
else
{
l9_1358=l9_1357*l9_1357;
}
float3 l9_1359=l9_1358;
float3 l9_1360=l9_1359;
l9_1306.transmitted=l9_1360*mix(float3(1.0),l9_866.albedo,float3(l9_866.opacity));
l9_866.opacity=1.0;
}
bool l9_1361=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1361=true;
}
SurfaceProperties l9_1362=l9_866;
LightingComponents l9_1363=l9_1306;
bool l9_1364=l9_1361;
float3 l9_1365=float3(0.0);
bool l9_1366=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_1366)
{
l9_1365=l9_1362.albedo*(l9_1363.directDiffuse+(l9_1363.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_1365=l9_1362.albedo*(l9_1363.directDiffuse+(l9_1363.indirectDiffuse*l9_1362.ao));
}
float3 l9_1367=l9_1363.directSpecular+(l9_1363.indirectSpecular*l9_1362.specularAo);
float3 l9_1368=l9_1362.emissive;
float3 l9_1369=l9_1363.transmitted;
if (l9_1364)
{
float l9_1370=l9_1362.opacity;
l9_1365*=srgbToLinear(l9_1370);
}
float3 l9_1371=((l9_1365+l9_1367)+l9_1368)+l9_1369;
float3 l9_1372=l9_1371;
float4 l9_1373=float4(l9_1372,l9_866.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_1374=l9_1373.xyz;
float l9_1375=1.8;
float l9_1376=1.4;
float l9_1377=0.5;
float l9_1378=1.5;
float3 l9_1379=(l9_1374*((l9_1374*l9_1375)+float3(l9_1376)))/((l9_1374*((l9_1374*l9_1375)+float3(l9_1377)))+float3(l9_1378));
l9_1373=float4(l9_1379.x,l9_1379.y,l9_1379.z,l9_1373.w);
}
float3 l9_1380=l9_1373.xyz;
float l9_1381=l9_1380.x;
float l9_1382=l9_1380.y;
float l9_1383=l9_1380.z;
float3 l9_1384=float3(linearToSrgb(l9_1381),linearToSrgb(l9_1382),linearToSrgb(l9_1383));
l9_1373=float4(l9_1384.x,l9_1384.y,l9_1384.z,l9_1373.w);
float4 l9_1385=l9_1373;
float4 l9_1386=l9_1385;
l9_1386=fast::max(l9_1386,float4(0.0));
l9_844=l9_1386;
l9_701=l9_844;
l9_706=l9_701;
}
else
{
float4 l9_1387=float4(0.0);
float4 l9_1388=float4(0.0);
float4 l9_1389=float4(0.0);
ssGlobals l9_1390=l9_703;
float4 l9_1391;
if ((int(Tweak_N248_tmp)!=0))
{
float4 l9_1392=float4(0.0);
l9_1392=gParticle.Color;
float4 l9_1393=float4(0.0);
float4 l9_1394=(*sc_set0.UserUniforms).colorMix;
l9_1393=l9_1394;
float l9_1395=0.0;
float l9_1396=1.0;
float l9_1397=0.0;
ssGlobals l9_1398=l9_1390;
float l9_1399;
if ((int(Tweak_N261_tmp)!=0))
{
float l9_1400=0.0;
float l9_1401=0.0;
float l9_1402=0.0;
float l9_1403=0.0;
float l9_1404=0.0;
float l9_1405=0.0;
ssGlobals l9_1406=l9_1398;
float l9_1407;
if (NODE_243_DROPLIST_ITEM_tmp==0)
{
float2 l9_1408=float2(0.0);
l9_1408=l9_1406.Surface_UVCoord0;
float2 l9_1409=float2(0.0);
float2 l9_1410=l9_1408;
float l9_1411=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1412=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1413=sin(radians(l9_1411));
float l9_1414=cos(radians(l9_1411));
float2 l9_1415=l9_1410-l9_1412;
l9_1415=float2(dot(float2(l9_1414,l9_1413),l9_1415),dot(float2(-l9_1413,l9_1414),l9_1415))+l9_1412;
l9_1409=l9_1415;
float l9_1416=0.0;
l9_1416=gParticle.Index1DPerCopyF;
float l9_1417=0.0;
l9_1417=gParticle.Ratio1DPerCopy;
float l9_1418=0.0;
l9_1418=(((l9_1417-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1419=float4(0.0);
float2 l9_1420=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1421=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1422=l9_1409;
float l9_1423=l9_1416;
float l9_1424=l9_1418;
float l9_1425=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1426=l9_1406;
float2 l9_1427=float2(0.0);
float l9_1428=floor(l9_1420.x);
float l9_1429=floor(l9_1420.y);
float l9_1430=1.0/l9_1428;
float l9_1431=1.0/l9_1429;
float l9_1432=fast::min(l9_1428*l9_1429,floor(l9_1421));
float l9_1433=floor(mod(((l9_1426.gTimeElapsedShifted+l9_1425)*l9_1424)+floor(l9_1423),l9_1432));
float l9_1434=floor(l9_1433/l9_1428);
float l9_1435=mod(l9_1433,l9_1428);
l9_1427=float2((l9_1430*l9_1422.x)+(l9_1435*l9_1430),((1.0-l9_1431)-(l9_1434*l9_1431))+(l9_1431*l9_1422.y));
int l9_1436=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1437=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1437=0;
}
else
{
l9_1437=in.varStereoViewID;
}
int l9_1438=l9_1437;
l9_1436=1-l9_1438;
}
else
{
int l9_1439=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1439=0;
}
else
{
l9_1439=in.varStereoViewID;
}
int l9_1440=l9_1439;
l9_1436=l9_1440;
}
int l9_1441=l9_1436;
int l9_1442=flipbookTexLayout_tmp;
int l9_1443=l9_1441;
float2 l9_1444=l9_1427;
bool l9_1445=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1446=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1447=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1448=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1449=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1450=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1451=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1452=0.0;
bool l9_1453=l9_1450&&(!l9_1448);
float l9_1454=1.0;
float l9_1455=l9_1444.x;
int l9_1456=l9_1447.x;
if (l9_1456==1)
{
l9_1455=fract(l9_1455);
}
else
{
if (l9_1456==2)
{
float l9_1457=fract(l9_1455);
float l9_1458=l9_1455-l9_1457;
float l9_1459=step(0.25,fract(l9_1458*0.5));
l9_1455=mix(l9_1457,1.0-l9_1457,fast::clamp(l9_1459,0.0,1.0));
}
}
l9_1444.x=l9_1455;
float l9_1460=l9_1444.y;
int l9_1461=l9_1447.y;
if (l9_1461==1)
{
l9_1460=fract(l9_1460);
}
else
{
if (l9_1461==2)
{
float l9_1462=fract(l9_1460);
float l9_1463=l9_1460-l9_1462;
float l9_1464=step(0.25,fract(l9_1463*0.5));
l9_1460=mix(l9_1462,1.0-l9_1462,fast::clamp(l9_1464,0.0,1.0));
}
}
l9_1444.y=l9_1460;
if (l9_1448)
{
bool l9_1465=l9_1450;
bool l9_1466;
if (l9_1465)
{
l9_1466=l9_1447.x==3;
}
else
{
l9_1466=l9_1465;
}
float l9_1467=l9_1444.x;
float l9_1468=l9_1449.x;
float l9_1469=l9_1449.z;
bool l9_1470=l9_1466;
float l9_1471=l9_1454;
float l9_1472=fast::clamp(l9_1467,l9_1468,l9_1469);
float l9_1473=step(abs(l9_1467-l9_1472),9.9999997e-06);
l9_1471*=(l9_1473+((1.0-float(l9_1470))*(1.0-l9_1473)));
l9_1467=l9_1472;
l9_1444.x=l9_1467;
l9_1454=l9_1471;
bool l9_1474=l9_1450;
bool l9_1475;
if (l9_1474)
{
l9_1475=l9_1447.y==3;
}
else
{
l9_1475=l9_1474;
}
float l9_1476=l9_1444.y;
float l9_1477=l9_1449.y;
float l9_1478=l9_1449.w;
bool l9_1479=l9_1475;
float l9_1480=l9_1454;
float l9_1481=fast::clamp(l9_1476,l9_1477,l9_1478);
float l9_1482=step(abs(l9_1476-l9_1481),9.9999997e-06);
l9_1480*=(l9_1482+((1.0-float(l9_1479))*(1.0-l9_1482)));
l9_1476=l9_1481;
l9_1444.y=l9_1476;
l9_1454=l9_1480;
}
float2 l9_1483=l9_1444;
bool l9_1484=l9_1445;
float3x3 l9_1485=l9_1446;
if (l9_1484)
{
l9_1483=float2((l9_1485*float3(l9_1483,1.0)).xy);
}
float2 l9_1486=l9_1483;
float2 l9_1487=l9_1486;
float2 l9_1488=l9_1487;
l9_1444=l9_1488;
float l9_1489=l9_1444.x;
int l9_1490=l9_1447.x;
bool l9_1491=l9_1453;
float l9_1492=l9_1454;
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
l9_1444.x=l9_1489;
l9_1454=l9_1492;
float l9_1500=l9_1444.y;
int l9_1501=l9_1447.y;
bool l9_1502=l9_1453;
float l9_1503=l9_1454;
if ((l9_1501==0)||(l9_1501==3))
{
float l9_1504=l9_1500;
float l9_1505=0.0;
float l9_1506=1.0;
bool l9_1507=l9_1502;
float l9_1508=l9_1503;
float l9_1509=fast::clamp(l9_1504,l9_1505,l9_1506);
float l9_1510=step(abs(l9_1504-l9_1509),9.9999997e-06);
l9_1508*=(l9_1510+((1.0-float(l9_1507))*(1.0-l9_1510)));
l9_1504=l9_1509;
l9_1500=l9_1504;
l9_1503=l9_1508;
}
l9_1444.y=l9_1500;
l9_1454=l9_1503;
float2 l9_1511=l9_1444;
int l9_1512=l9_1442;
int l9_1513=l9_1443;
float l9_1514=l9_1452;
float2 l9_1515=l9_1511;
int l9_1516=l9_1512;
int l9_1517=l9_1513;
float3 l9_1518=float3(0.0);
if (l9_1516==0)
{
l9_1518=float3(l9_1515,0.0);
}
else
{
if (l9_1516==1)
{
l9_1518=float3(l9_1515.x,(l9_1515.y*0.5)+(0.5-(float(l9_1517)*0.5)),0.0);
}
else
{
l9_1518=float3(l9_1515,float(l9_1517));
}
}
float3 l9_1519=l9_1518;
float3 l9_1520=l9_1519;
float2 l9_1521=l9_1520.xy;
float l9_1522=l9_1514;
float4 l9_1523=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1521,bias(l9_1522));
float4 l9_1524=l9_1523;
float4 l9_1525=l9_1524;
if (l9_1450)
{
l9_1525=mix(l9_1451,l9_1525,float4(l9_1454));
}
float4 l9_1526=l9_1525;
float4 l9_1527=l9_1526;
l9_1419=l9_1527;
float l9_1528=0.0;
float4 l9_1529=l9_1419;
float l9_1530=l9_1529.x;
l9_1528=l9_1530;
l9_1401=l9_1528;
l9_1407=l9_1401;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==1)
{
float2 l9_1531=float2(0.0);
l9_1531=l9_1406.Surface_UVCoord0;
float2 l9_1532=float2(0.0);
float2 l9_1533=l9_1531;
float l9_1534=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1535=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1536=sin(radians(l9_1534));
float l9_1537=cos(radians(l9_1534));
float2 l9_1538=l9_1533-l9_1535;
l9_1538=float2(dot(float2(l9_1537,l9_1536),l9_1538),dot(float2(-l9_1536,l9_1537),l9_1538))+l9_1535;
l9_1532=l9_1538;
float l9_1539=0.0;
l9_1539=gParticle.Index1DPerCopyF;
float l9_1540=0.0;
l9_1540=gParticle.Ratio1DPerCopy;
float l9_1541=0.0;
l9_1541=(((l9_1540-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1542=float4(0.0);
float2 l9_1543=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1544=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1545=l9_1532;
float l9_1546=l9_1539;
float l9_1547=l9_1541;
float l9_1548=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1549=l9_1406;
float2 l9_1550=float2(0.0);
float l9_1551=floor(l9_1543.x);
float l9_1552=floor(l9_1543.y);
float l9_1553=1.0/l9_1551;
float l9_1554=1.0/l9_1552;
float l9_1555=fast::min(l9_1551*l9_1552,floor(l9_1544));
float l9_1556=floor(mod(((l9_1549.gTimeElapsedShifted+l9_1548)*l9_1547)+floor(l9_1546),l9_1555));
float l9_1557=floor(l9_1556/l9_1551);
float l9_1558=mod(l9_1556,l9_1551);
l9_1550=float2((l9_1553*l9_1545.x)+(l9_1558*l9_1553),((1.0-l9_1554)-(l9_1557*l9_1554))+(l9_1554*l9_1545.y));
int l9_1559=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
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
l9_1559=1-l9_1561;
}
else
{
int l9_1562=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1562=0;
}
else
{
l9_1562=in.varStereoViewID;
}
int l9_1563=l9_1562;
l9_1559=l9_1563;
}
int l9_1564=l9_1559;
int l9_1565=flipbookTexLayout_tmp;
int l9_1566=l9_1564;
float2 l9_1567=l9_1550;
bool l9_1568=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1569=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1570=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1571=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1572=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1573=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1574=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1575=0.0;
bool l9_1576=l9_1573&&(!l9_1571);
float l9_1577=1.0;
float l9_1578=l9_1567.x;
int l9_1579=l9_1570.x;
if (l9_1579==1)
{
l9_1578=fract(l9_1578);
}
else
{
if (l9_1579==2)
{
float l9_1580=fract(l9_1578);
float l9_1581=l9_1578-l9_1580;
float l9_1582=step(0.25,fract(l9_1581*0.5));
l9_1578=mix(l9_1580,1.0-l9_1580,fast::clamp(l9_1582,0.0,1.0));
}
}
l9_1567.x=l9_1578;
float l9_1583=l9_1567.y;
int l9_1584=l9_1570.y;
if (l9_1584==1)
{
l9_1583=fract(l9_1583);
}
else
{
if (l9_1584==2)
{
float l9_1585=fract(l9_1583);
float l9_1586=l9_1583-l9_1585;
float l9_1587=step(0.25,fract(l9_1586*0.5));
l9_1583=mix(l9_1585,1.0-l9_1585,fast::clamp(l9_1587,0.0,1.0));
}
}
l9_1567.y=l9_1583;
if (l9_1571)
{
bool l9_1588=l9_1573;
bool l9_1589;
if (l9_1588)
{
l9_1589=l9_1570.x==3;
}
else
{
l9_1589=l9_1588;
}
float l9_1590=l9_1567.x;
float l9_1591=l9_1572.x;
float l9_1592=l9_1572.z;
bool l9_1593=l9_1589;
float l9_1594=l9_1577;
float l9_1595=fast::clamp(l9_1590,l9_1591,l9_1592);
float l9_1596=step(abs(l9_1590-l9_1595),9.9999997e-06);
l9_1594*=(l9_1596+((1.0-float(l9_1593))*(1.0-l9_1596)));
l9_1590=l9_1595;
l9_1567.x=l9_1590;
l9_1577=l9_1594;
bool l9_1597=l9_1573;
bool l9_1598;
if (l9_1597)
{
l9_1598=l9_1570.y==3;
}
else
{
l9_1598=l9_1597;
}
float l9_1599=l9_1567.y;
float l9_1600=l9_1572.y;
float l9_1601=l9_1572.w;
bool l9_1602=l9_1598;
float l9_1603=l9_1577;
float l9_1604=fast::clamp(l9_1599,l9_1600,l9_1601);
float l9_1605=step(abs(l9_1599-l9_1604),9.9999997e-06);
l9_1603*=(l9_1605+((1.0-float(l9_1602))*(1.0-l9_1605)));
l9_1599=l9_1604;
l9_1567.y=l9_1599;
l9_1577=l9_1603;
}
float2 l9_1606=l9_1567;
bool l9_1607=l9_1568;
float3x3 l9_1608=l9_1569;
if (l9_1607)
{
l9_1606=float2((l9_1608*float3(l9_1606,1.0)).xy);
}
float2 l9_1609=l9_1606;
float2 l9_1610=l9_1609;
float2 l9_1611=l9_1610;
l9_1567=l9_1611;
float l9_1612=l9_1567.x;
int l9_1613=l9_1570.x;
bool l9_1614=l9_1576;
float l9_1615=l9_1577;
if ((l9_1613==0)||(l9_1613==3))
{
float l9_1616=l9_1612;
float l9_1617=0.0;
float l9_1618=1.0;
bool l9_1619=l9_1614;
float l9_1620=l9_1615;
float l9_1621=fast::clamp(l9_1616,l9_1617,l9_1618);
float l9_1622=step(abs(l9_1616-l9_1621),9.9999997e-06);
l9_1620*=(l9_1622+((1.0-float(l9_1619))*(1.0-l9_1622)));
l9_1616=l9_1621;
l9_1612=l9_1616;
l9_1615=l9_1620;
}
l9_1567.x=l9_1612;
l9_1577=l9_1615;
float l9_1623=l9_1567.y;
int l9_1624=l9_1570.y;
bool l9_1625=l9_1576;
float l9_1626=l9_1577;
if ((l9_1624==0)||(l9_1624==3))
{
float l9_1627=l9_1623;
float l9_1628=0.0;
float l9_1629=1.0;
bool l9_1630=l9_1625;
float l9_1631=l9_1626;
float l9_1632=fast::clamp(l9_1627,l9_1628,l9_1629);
float l9_1633=step(abs(l9_1627-l9_1632),9.9999997e-06);
l9_1631*=(l9_1633+((1.0-float(l9_1630))*(1.0-l9_1633)));
l9_1627=l9_1632;
l9_1623=l9_1627;
l9_1626=l9_1631;
}
l9_1567.y=l9_1623;
l9_1577=l9_1626;
float2 l9_1634=l9_1567;
int l9_1635=l9_1565;
int l9_1636=l9_1566;
float l9_1637=l9_1575;
float2 l9_1638=l9_1634;
int l9_1639=l9_1635;
int l9_1640=l9_1636;
float3 l9_1641=float3(0.0);
if (l9_1639==0)
{
l9_1641=float3(l9_1638,0.0);
}
else
{
if (l9_1639==1)
{
l9_1641=float3(l9_1638.x,(l9_1638.y*0.5)+(0.5-(float(l9_1640)*0.5)),0.0);
}
else
{
l9_1641=float3(l9_1638,float(l9_1640));
}
}
float3 l9_1642=l9_1641;
float3 l9_1643=l9_1642;
float2 l9_1644=l9_1643.xy;
float l9_1645=l9_1637;
float4 l9_1646=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1644,bias(l9_1645));
float4 l9_1647=l9_1646;
float4 l9_1648=l9_1647;
if (l9_1573)
{
l9_1648=mix(l9_1574,l9_1648,float4(l9_1577));
}
float4 l9_1649=l9_1648;
float4 l9_1650=l9_1649;
l9_1542=l9_1650;
float l9_1651=0.0;
float4 l9_1652=l9_1542;
float l9_1653=l9_1652.y;
l9_1651=l9_1653;
l9_1402=l9_1651;
l9_1407=l9_1402;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==2)
{
float2 l9_1654=float2(0.0);
l9_1654=l9_1406.Surface_UVCoord0;
float2 l9_1655=float2(0.0);
float2 l9_1656=l9_1654;
float l9_1657=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1658=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1659=sin(radians(l9_1657));
float l9_1660=cos(radians(l9_1657));
float2 l9_1661=l9_1656-l9_1658;
l9_1661=float2(dot(float2(l9_1660,l9_1659),l9_1661),dot(float2(-l9_1659,l9_1660),l9_1661))+l9_1658;
l9_1655=l9_1661;
float l9_1662=0.0;
l9_1662=gParticle.Index1DPerCopyF;
float l9_1663=0.0;
l9_1663=gParticle.Ratio1DPerCopy;
float l9_1664=0.0;
l9_1664=(((l9_1663-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1665=float4(0.0);
float2 l9_1666=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1667=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1668=l9_1655;
float l9_1669=l9_1662;
float l9_1670=l9_1664;
float l9_1671=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1672=l9_1406;
float2 l9_1673=float2(0.0);
float l9_1674=floor(l9_1666.x);
float l9_1675=floor(l9_1666.y);
float l9_1676=1.0/l9_1674;
float l9_1677=1.0/l9_1675;
float l9_1678=fast::min(l9_1674*l9_1675,floor(l9_1667));
float l9_1679=floor(mod(((l9_1672.gTimeElapsedShifted+l9_1671)*l9_1670)+floor(l9_1669),l9_1678));
float l9_1680=floor(l9_1679/l9_1674);
float l9_1681=mod(l9_1679,l9_1674);
l9_1673=float2((l9_1676*l9_1668.x)+(l9_1681*l9_1676),((1.0-l9_1677)-(l9_1680*l9_1677))+(l9_1677*l9_1668.y));
int l9_1682=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1683=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1683=0;
}
else
{
l9_1683=in.varStereoViewID;
}
int l9_1684=l9_1683;
l9_1682=1-l9_1684;
}
else
{
int l9_1685=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1685=0;
}
else
{
l9_1685=in.varStereoViewID;
}
int l9_1686=l9_1685;
l9_1682=l9_1686;
}
int l9_1687=l9_1682;
int l9_1688=flipbookTexLayout_tmp;
int l9_1689=l9_1687;
float2 l9_1690=l9_1673;
bool l9_1691=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1692=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1693=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1694=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1695=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1696=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1697=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1698=0.0;
bool l9_1699=l9_1696&&(!l9_1694);
float l9_1700=1.0;
float l9_1701=l9_1690.x;
int l9_1702=l9_1693.x;
if (l9_1702==1)
{
l9_1701=fract(l9_1701);
}
else
{
if (l9_1702==2)
{
float l9_1703=fract(l9_1701);
float l9_1704=l9_1701-l9_1703;
float l9_1705=step(0.25,fract(l9_1704*0.5));
l9_1701=mix(l9_1703,1.0-l9_1703,fast::clamp(l9_1705,0.0,1.0));
}
}
l9_1690.x=l9_1701;
float l9_1706=l9_1690.y;
int l9_1707=l9_1693.y;
if (l9_1707==1)
{
l9_1706=fract(l9_1706);
}
else
{
if (l9_1707==2)
{
float l9_1708=fract(l9_1706);
float l9_1709=l9_1706-l9_1708;
float l9_1710=step(0.25,fract(l9_1709*0.5));
l9_1706=mix(l9_1708,1.0-l9_1708,fast::clamp(l9_1710,0.0,1.0));
}
}
l9_1690.y=l9_1706;
if (l9_1694)
{
bool l9_1711=l9_1696;
bool l9_1712;
if (l9_1711)
{
l9_1712=l9_1693.x==3;
}
else
{
l9_1712=l9_1711;
}
float l9_1713=l9_1690.x;
float l9_1714=l9_1695.x;
float l9_1715=l9_1695.z;
bool l9_1716=l9_1712;
float l9_1717=l9_1700;
float l9_1718=fast::clamp(l9_1713,l9_1714,l9_1715);
float l9_1719=step(abs(l9_1713-l9_1718),9.9999997e-06);
l9_1717*=(l9_1719+((1.0-float(l9_1716))*(1.0-l9_1719)));
l9_1713=l9_1718;
l9_1690.x=l9_1713;
l9_1700=l9_1717;
bool l9_1720=l9_1696;
bool l9_1721;
if (l9_1720)
{
l9_1721=l9_1693.y==3;
}
else
{
l9_1721=l9_1720;
}
float l9_1722=l9_1690.y;
float l9_1723=l9_1695.y;
float l9_1724=l9_1695.w;
bool l9_1725=l9_1721;
float l9_1726=l9_1700;
float l9_1727=fast::clamp(l9_1722,l9_1723,l9_1724);
float l9_1728=step(abs(l9_1722-l9_1727),9.9999997e-06);
l9_1726*=(l9_1728+((1.0-float(l9_1725))*(1.0-l9_1728)));
l9_1722=l9_1727;
l9_1690.y=l9_1722;
l9_1700=l9_1726;
}
float2 l9_1729=l9_1690;
bool l9_1730=l9_1691;
float3x3 l9_1731=l9_1692;
if (l9_1730)
{
l9_1729=float2((l9_1731*float3(l9_1729,1.0)).xy);
}
float2 l9_1732=l9_1729;
float2 l9_1733=l9_1732;
float2 l9_1734=l9_1733;
l9_1690=l9_1734;
float l9_1735=l9_1690.x;
int l9_1736=l9_1693.x;
bool l9_1737=l9_1699;
float l9_1738=l9_1700;
if ((l9_1736==0)||(l9_1736==3))
{
float l9_1739=l9_1735;
float l9_1740=0.0;
float l9_1741=1.0;
bool l9_1742=l9_1737;
float l9_1743=l9_1738;
float l9_1744=fast::clamp(l9_1739,l9_1740,l9_1741);
float l9_1745=step(abs(l9_1739-l9_1744),9.9999997e-06);
l9_1743*=(l9_1745+((1.0-float(l9_1742))*(1.0-l9_1745)));
l9_1739=l9_1744;
l9_1735=l9_1739;
l9_1738=l9_1743;
}
l9_1690.x=l9_1735;
l9_1700=l9_1738;
float l9_1746=l9_1690.y;
int l9_1747=l9_1693.y;
bool l9_1748=l9_1699;
float l9_1749=l9_1700;
if ((l9_1747==0)||(l9_1747==3))
{
float l9_1750=l9_1746;
float l9_1751=0.0;
float l9_1752=1.0;
bool l9_1753=l9_1748;
float l9_1754=l9_1749;
float l9_1755=fast::clamp(l9_1750,l9_1751,l9_1752);
float l9_1756=step(abs(l9_1750-l9_1755),9.9999997e-06);
l9_1754*=(l9_1756+((1.0-float(l9_1753))*(1.0-l9_1756)));
l9_1750=l9_1755;
l9_1746=l9_1750;
l9_1749=l9_1754;
}
l9_1690.y=l9_1746;
l9_1700=l9_1749;
float2 l9_1757=l9_1690;
int l9_1758=l9_1688;
int l9_1759=l9_1689;
float l9_1760=l9_1698;
float2 l9_1761=l9_1757;
int l9_1762=l9_1758;
int l9_1763=l9_1759;
float3 l9_1764=float3(0.0);
if (l9_1762==0)
{
l9_1764=float3(l9_1761,0.0);
}
else
{
if (l9_1762==1)
{
l9_1764=float3(l9_1761.x,(l9_1761.y*0.5)+(0.5-(float(l9_1763)*0.5)),0.0);
}
else
{
l9_1764=float3(l9_1761,float(l9_1763));
}
}
float3 l9_1765=l9_1764;
float3 l9_1766=l9_1765;
float2 l9_1767=l9_1766.xy;
float l9_1768=l9_1760;
float4 l9_1769=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1767,bias(l9_1768));
float4 l9_1770=l9_1769;
float4 l9_1771=l9_1770;
if (l9_1696)
{
l9_1771=mix(l9_1697,l9_1771,float4(l9_1700));
}
float4 l9_1772=l9_1771;
float4 l9_1773=l9_1772;
l9_1665=l9_1773;
float l9_1774=0.0;
float4 l9_1775=l9_1665;
float l9_1776=l9_1775.z;
l9_1774=l9_1776;
l9_1403=l9_1774;
l9_1407=l9_1403;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==3)
{
float2 l9_1777=float2(0.0);
l9_1777=l9_1406.Surface_UVCoord0;
float2 l9_1778=float2(0.0);
float2 l9_1779=l9_1777;
float l9_1780=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1781=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1782=sin(radians(l9_1780));
float l9_1783=cos(radians(l9_1780));
float2 l9_1784=l9_1779-l9_1781;
l9_1784=float2(dot(float2(l9_1783,l9_1782),l9_1784),dot(float2(-l9_1782,l9_1783),l9_1784))+l9_1781;
l9_1778=l9_1784;
float l9_1785=0.0;
l9_1785=gParticle.Index1DPerCopyF;
float l9_1786=0.0;
l9_1786=gParticle.Ratio1DPerCopy;
float l9_1787=0.0;
l9_1787=(((l9_1786-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1788=float4(0.0);
float2 l9_1789=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1790=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1791=l9_1778;
float l9_1792=l9_1785;
float l9_1793=l9_1787;
float l9_1794=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1795=l9_1406;
float2 l9_1796=float2(0.0);
float l9_1797=floor(l9_1789.x);
float l9_1798=floor(l9_1789.y);
float l9_1799=1.0/l9_1797;
float l9_1800=1.0/l9_1798;
float l9_1801=fast::min(l9_1797*l9_1798,floor(l9_1790));
float l9_1802=floor(mod(((l9_1795.gTimeElapsedShifted+l9_1794)*l9_1793)+floor(l9_1792),l9_1801));
float l9_1803=floor(l9_1802/l9_1797);
float l9_1804=mod(l9_1802,l9_1797);
l9_1796=float2((l9_1799*l9_1791.x)+(l9_1804*l9_1799),((1.0-l9_1800)-(l9_1803*l9_1800))+(l9_1800*l9_1791.y));
int l9_1805=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1806=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1806=0;
}
else
{
l9_1806=in.varStereoViewID;
}
int l9_1807=l9_1806;
l9_1805=1-l9_1807;
}
else
{
int l9_1808=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1808=0;
}
else
{
l9_1808=in.varStereoViewID;
}
int l9_1809=l9_1808;
l9_1805=l9_1809;
}
int l9_1810=l9_1805;
int l9_1811=flipbookTexLayout_tmp;
int l9_1812=l9_1810;
float2 l9_1813=l9_1796;
bool l9_1814=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1815=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1816=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1817=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1818=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1819=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1820=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1821=0.0;
bool l9_1822=l9_1819&&(!l9_1817);
float l9_1823=1.0;
float l9_1824=l9_1813.x;
int l9_1825=l9_1816.x;
if (l9_1825==1)
{
l9_1824=fract(l9_1824);
}
else
{
if (l9_1825==2)
{
float l9_1826=fract(l9_1824);
float l9_1827=l9_1824-l9_1826;
float l9_1828=step(0.25,fract(l9_1827*0.5));
l9_1824=mix(l9_1826,1.0-l9_1826,fast::clamp(l9_1828,0.0,1.0));
}
}
l9_1813.x=l9_1824;
float l9_1829=l9_1813.y;
int l9_1830=l9_1816.y;
if (l9_1830==1)
{
l9_1829=fract(l9_1829);
}
else
{
if (l9_1830==2)
{
float l9_1831=fract(l9_1829);
float l9_1832=l9_1829-l9_1831;
float l9_1833=step(0.25,fract(l9_1832*0.5));
l9_1829=mix(l9_1831,1.0-l9_1831,fast::clamp(l9_1833,0.0,1.0));
}
}
l9_1813.y=l9_1829;
if (l9_1817)
{
bool l9_1834=l9_1819;
bool l9_1835;
if (l9_1834)
{
l9_1835=l9_1816.x==3;
}
else
{
l9_1835=l9_1834;
}
float l9_1836=l9_1813.x;
float l9_1837=l9_1818.x;
float l9_1838=l9_1818.z;
bool l9_1839=l9_1835;
float l9_1840=l9_1823;
float l9_1841=fast::clamp(l9_1836,l9_1837,l9_1838);
float l9_1842=step(abs(l9_1836-l9_1841),9.9999997e-06);
l9_1840*=(l9_1842+((1.0-float(l9_1839))*(1.0-l9_1842)));
l9_1836=l9_1841;
l9_1813.x=l9_1836;
l9_1823=l9_1840;
bool l9_1843=l9_1819;
bool l9_1844;
if (l9_1843)
{
l9_1844=l9_1816.y==3;
}
else
{
l9_1844=l9_1843;
}
float l9_1845=l9_1813.y;
float l9_1846=l9_1818.y;
float l9_1847=l9_1818.w;
bool l9_1848=l9_1844;
float l9_1849=l9_1823;
float l9_1850=fast::clamp(l9_1845,l9_1846,l9_1847);
float l9_1851=step(abs(l9_1845-l9_1850),9.9999997e-06);
l9_1849*=(l9_1851+((1.0-float(l9_1848))*(1.0-l9_1851)));
l9_1845=l9_1850;
l9_1813.y=l9_1845;
l9_1823=l9_1849;
}
float2 l9_1852=l9_1813;
bool l9_1853=l9_1814;
float3x3 l9_1854=l9_1815;
if (l9_1853)
{
l9_1852=float2((l9_1854*float3(l9_1852,1.0)).xy);
}
float2 l9_1855=l9_1852;
float2 l9_1856=l9_1855;
float2 l9_1857=l9_1856;
l9_1813=l9_1857;
float l9_1858=l9_1813.x;
int l9_1859=l9_1816.x;
bool l9_1860=l9_1822;
float l9_1861=l9_1823;
if ((l9_1859==0)||(l9_1859==3))
{
float l9_1862=l9_1858;
float l9_1863=0.0;
float l9_1864=1.0;
bool l9_1865=l9_1860;
float l9_1866=l9_1861;
float l9_1867=fast::clamp(l9_1862,l9_1863,l9_1864);
float l9_1868=step(abs(l9_1862-l9_1867),9.9999997e-06);
l9_1866*=(l9_1868+((1.0-float(l9_1865))*(1.0-l9_1868)));
l9_1862=l9_1867;
l9_1858=l9_1862;
l9_1861=l9_1866;
}
l9_1813.x=l9_1858;
l9_1823=l9_1861;
float l9_1869=l9_1813.y;
int l9_1870=l9_1816.y;
bool l9_1871=l9_1822;
float l9_1872=l9_1823;
if ((l9_1870==0)||(l9_1870==3))
{
float l9_1873=l9_1869;
float l9_1874=0.0;
float l9_1875=1.0;
bool l9_1876=l9_1871;
float l9_1877=l9_1872;
float l9_1878=fast::clamp(l9_1873,l9_1874,l9_1875);
float l9_1879=step(abs(l9_1873-l9_1878),9.9999997e-06);
l9_1877*=(l9_1879+((1.0-float(l9_1876))*(1.0-l9_1879)));
l9_1873=l9_1878;
l9_1869=l9_1873;
l9_1872=l9_1877;
}
l9_1813.y=l9_1869;
l9_1823=l9_1872;
float2 l9_1880=l9_1813;
int l9_1881=l9_1811;
int l9_1882=l9_1812;
float l9_1883=l9_1821;
float2 l9_1884=l9_1880;
int l9_1885=l9_1881;
int l9_1886=l9_1882;
float3 l9_1887=float3(0.0);
if (l9_1885==0)
{
l9_1887=float3(l9_1884,0.0);
}
else
{
if (l9_1885==1)
{
l9_1887=float3(l9_1884.x,(l9_1884.y*0.5)+(0.5-(float(l9_1886)*0.5)),0.0);
}
else
{
l9_1887=float3(l9_1884,float(l9_1886));
}
}
float3 l9_1888=l9_1887;
float3 l9_1889=l9_1888;
float2 l9_1890=l9_1889.xy;
float l9_1891=l9_1883;
float4 l9_1892=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1890,bias(l9_1891));
float4 l9_1893=l9_1892;
float4 l9_1894=l9_1893;
if (l9_1819)
{
l9_1894=mix(l9_1820,l9_1894,float4(l9_1823));
}
float4 l9_1895=l9_1894;
float4 l9_1896=l9_1895;
l9_1788=l9_1896;
float l9_1897=0.0;
float4 l9_1898=l9_1788;
float l9_1899=l9_1898.w;
l9_1897=l9_1899;
l9_1404=l9_1897;
l9_1407=l9_1404;
}
else
{
float2 l9_1900=float2(0.0);
l9_1900=l9_1406.Surface_UVCoord0;
float2 l9_1901=float2(0.0);
float2 l9_1902=l9_1900;
float l9_1903=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1904=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1905=sin(radians(l9_1903));
float l9_1906=cos(radians(l9_1903));
float2 l9_1907=l9_1902-l9_1904;
l9_1907=float2(dot(float2(l9_1906,l9_1905),l9_1907),dot(float2(-l9_1905,l9_1906),l9_1907))+l9_1904;
l9_1901=l9_1907;
float l9_1908=0.0;
l9_1908=gParticle.Index1DPerCopyF;
float l9_1909=0.0;
l9_1909=gParticle.Ratio1DPerCopy;
float l9_1910=0.0;
l9_1910=(((l9_1909-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1911=float4(0.0);
float2 l9_1912=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1913=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1914=l9_1901;
float l9_1915=l9_1908;
float l9_1916=l9_1910;
float l9_1917=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1918=l9_1406;
float2 l9_1919=float2(0.0);
float l9_1920=floor(l9_1912.x);
float l9_1921=floor(l9_1912.y);
float l9_1922=1.0/l9_1920;
float l9_1923=1.0/l9_1921;
float l9_1924=fast::min(l9_1920*l9_1921,floor(l9_1913));
float l9_1925=floor(mod(((l9_1918.gTimeElapsedShifted+l9_1917)*l9_1916)+floor(l9_1915),l9_1924));
float l9_1926=floor(l9_1925/l9_1920);
float l9_1927=mod(l9_1925,l9_1920);
l9_1919=float2((l9_1922*l9_1914.x)+(l9_1927*l9_1922),((1.0-l9_1923)-(l9_1926*l9_1923))+(l9_1923*l9_1914.y));
int l9_1928=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1929=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1929=0;
}
else
{
l9_1929=in.varStereoViewID;
}
int l9_1930=l9_1929;
l9_1928=1-l9_1930;
}
else
{
int l9_1931=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1931=0;
}
else
{
l9_1931=in.varStereoViewID;
}
int l9_1932=l9_1931;
l9_1928=l9_1932;
}
int l9_1933=l9_1928;
int l9_1934=flipbookTexLayout_tmp;
int l9_1935=l9_1933;
float2 l9_1936=l9_1919;
bool l9_1937=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1938=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1939=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1940=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1941=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1942=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1943=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1944=0.0;
bool l9_1945=l9_1942&&(!l9_1940);
float l9_1946=1.0;
float l9_1947=l9_1936.x;
int l9_1948=l9_1939.x;
if (l9_1948==1)
{
l9_1947=fract(l9_1947);
}
else
{
if (l9_1948==2)
{
float l9_1949=fract(l9_1947);
float l9_1950=l9_1947-l9_1949;
float l9_1951=step(0.25,fract(l9_1950*0.5));
l9_1947=mix(l9_1949,1.0-l9_1949,fast::clamp(l9_1951,0.0,1.0));
}
}
l9_1936.x=l9_1947;
float l9_1952=l9_1936.y;
int l9_1953=l9_1939.y;
if (l9_1953==1)
{
l9_1952=fract(l9_1952);
}
else
{
if (l9_1953==2)
{
float l9_1954=fract(l9_1952);
float l9_1955=l9_1952-l9_1954;
float l9_1956=step(0.25,fract(l9_1955*0.5));
l9_1952=mix(l9_1954,1.0-l9_1954,fast::clamp(l9_1956,0.0,1.0));
}
}
l9_1936.y=l9_1952;
if (l9_1940)
{
bool l9_1957=l9_1942;
bool l9_1958;
if (l9_1957)
{
l9_1958=l9_1939.x==3;
}
else
{
l9_1958=l9_1957;
}
float l9_1959=l9_1936.x;
float l9_1960=l9_1941.x;
float l9_1961=l9_1941.z;
bool l9_1962=l9_1958;
float l9_1963=l9_1946;
float l9_1964=fast::clamp(l9_1959,l9_1960,l9_1961);
float l9_1965=step(abs(l9_1959-l9_1964),9.9999997e-06);
l9_1963*=(l9_1965+((1.0-float(l9_1962))*(1.0-l9_1965)));
l9_1959=l9_1964;
l9_1936.x=l9_1959;
l9_1946=l9_1963;
bool l9_1966=l9_1942;
bool l9_1967;
if (l9_1966)
{
l9_1967=l9_1939.y==3;
}
else
{
l9_1967=l9_1966;
}
float l9_1968=l9_1936.y;
float l9_1969=l9_1941.y;
float l9_1970=l9_1941.w;
bool l9_1971=l9_1967;
float l9_1972=l9_1946;
float l9_1973=fast::clamp(l9_1968,l9_1969,l9_1970);
float l9_1974=step(abs(l9_1968-l9_1973),9.9999997e-06);
l9_1972*=(l9_1974+((1.0-float(l9_1971))*(1.0-l9_1974)));
l9_1968=l9_1973;
l9_1936.y=l9_1968;
l9_1946=l9_1972;
}
float2 l9_1975=l9_1936;
bool l9_1976=l9_1937;
float3x3 l9_1977=l9_1938;
if (l9_1976)
{
l9_1975=float2((l9_1977*float3(l9_1975,1.0)).xy);
}
float2 l9_1978=l9_1975;
float2 l9_1979=l9_1978;
float2 l9_1980=l9_1979;
l9_1936=l9_1980;
float l9_1981=l9_1936.x;
int l9_1982=l9_1939.x;
bool l9_1983=l9_1945;
float l9_1984=l9_1946;
if ((l9_1982==0)||(l9_1982==3))
{
float l9_1985=l9_1981;
float l9_1986=0.0;
float l9_1987=1.0;
bool l9_1988=l9_1983;
float l9_1989=l9_1984;
float l9_1990=fast::clamp(l9_1985,l9_1986,l9_1987);
float l9_1991=step(abs(l9_1985-l9_1990),9.9999997e-06);
l9_1989*=(l9_1991+((1.0-float(l9_1988))*(1.0-l9_1991)));
l9_1985=l9_1990;
l9_1981=l9_1985;
l9_1984=l9_1989;
}
l9_1936.x=l9_1981;
l9_1946=l9_1984;
float l9_1992=l9_1936.y;
int l9_1993=l9_1939.y;
bool l9_1994=l9_1945;
float l9_1995=l9_1946;
if ((l9_1993==0)||(l9_1993==3))
{
float l9_1996=l9_1992;
float l9_1997=0.0;
float l9_1998=1.0;
bool l9_1999=l9_1994;
float l9_2000=l9_1995;
float l9_2001=fast::clamp(l9_1996,l9_1997,l9_1998);
float l9_2002=step(abs(l9_1996-l9_2001),9.9999997e-06);
l9_2000*=(l9_2002+((1.0-float(l9_1999))*(1.0-l9_2002)));
l9_1996=l9_2001;
l9_1992=l9_1996;
l9_1995=l9_2000;
}
l9_1936.y=l9_1992;
l9_1946=l9_1995;
float2 l9_2003=l9_1936;
int l9_2004=l9_1934;
int l9_2005=l9_1935;
float l9_2006=l9_1944;
float2 l9_2007=l9_2003;
int l9_2008=l9_2004;
int l9_2009=l9_2005;
float3 l9_2010=float3(0.0);
if (l9_2008==0)
{
l9_2010=float3(l9_2007,0.0);
}
else
{
if (l9_2008==1)
{
l9_2010=float3(l9_2007.x,(l9_2007.y*0.5)+(0.5-(float(l9_2009)*0.5)),0.0);
}
else
{
l9_2010=float3(l9_2007,float(l9_2009));
}
}
float3 l9_2011=l9_2010;
float3 l9_2012=l9_2011;
float2 l9_2013=l9_2012.xy;
float l9_2014=l9_2006;
float4 l9_2015=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2013,bias(l9_2014));
float4 l9_2016=l9_2015;
float4 l9_2017=l9_2016;
if (l9_1942)
{
l9_2017=mix(l9_1943,l9_2017,float4(l9_1946));
}
float4 l9_2018=l9_2017;
float4 l9_2019=l9_2018;
l9_1911=l9_2019;
float l9_2020=0.0;
float4 l9_2021=l9_1911;
float l9_2022=l9_2021.w;
l9_2020=l9_2022;
l9_1405=l9_2020;
l9_1407=l9_1405;
}
}
}
}
l9_1400=l9_1407;
float l9_2023=0.0;
l9_2023=l9_1400;
float l9_2024=0.0;
l9_2024=1.0-l9_2023;
l9_1396=l9_2024;
l9_1399=l9_1396;
}
else
{
float l9_2025=0.0;
float l9_2026=0.0;
float l9_2027=0.0;
float l9_2028=0.0;
float l9_2029=0.0;
float l9_2030=0.0;
ssGlobals l9_2031=l9_1398;
float l9_2032;
if (NODE_243_DROPLIST_ITEM_tmp==0)
{
float2 l9_2033=float2(0.0);
l9_2033=l9_2031.Surface_UVCoord0;
float2 l9_2034=float2(0.0);
float2 l9_2035=l9_2033;
float l9_2036=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2037=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2038=sin(radians(l9_2036));
float l9_2039=cos(radians(l9_2036));
float2 l9_2040=l9_2035-l9_2037;
l9_2040=float2(dot(float2(l9_2039,l9_2038),l9_2040),dot(float2(-l9_2038,l9_2039),l9_2040))+l9_2037;
l9_2034=l9_2040;
float l9_2041=0.0;
l9_2041=gParticle.Index1DPerCopyF;
float l9_2042=0.0;
l9_2042=gParticle.Ratio1DPerCopy;
float l9_2043=0.0;
l9_2043=(((l9_2042-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2044=float4(0.0);
float2 l9_2045=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2046=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2047=l9_2034;
float l9_2048=l9_2041;
float l9_2049=l9_2043;
float l9_2050=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2051=l9_2031;
float2 l9_2052=float2(0.0);
float l9_2053=floor(l9_2045.x);
float l9_2054=floor(l9_2045.y);
float l9_2055=1.0/l9_2053;
float l9_2056=1.0/l9_2054;
float l9_2057=fast::min(l9_2053*l9_2054,floor(l9_2046));
float l9_2058=floor(mod(((l9_2051.gTimeElapsedShifted+l9_2050)*l9_2049)+floor(l9_2048),l9_2057));
float l9_2059=floor(l9_2058/l9_2053);
float l9_2060=mod(l9_2058,l9_2053);
l9_2052=float2((l9_2055*l9_2047.x)+(l9_2060*l9_2055),((1.0-l9_2056)-(l9_2059*l9_2056))+(l9_2056*l9_2047.y));
int l9_2061=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2062=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2062=0;
}
else
{
l9_2062=in.varStereoViewID;
}
int l9_2063=l9_2062;
l9_2061=1-l9_2063;
}
else
{
int l9_2064=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2064=0;
}
else
{
l9_2064=in.varStereoViewID;
}
int l9_2065=l9_2064;
l9_2061=l9_2065;
}
int l9_2066=l9_2061;
int l9_2067=flipbookTexLayout_tmp;
int l9_2068=l9_2066;
float2 l9_2069=l9_2052;
bool l9_2070=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2071=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2072=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2073=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2074=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2075=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2076=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2077=0.0;
bool l9_2078=l9_2075&&(!l9_2073);
float l9_2079=1.0;
float l9_2080=l9_2069.x;
int l9_2081=l9_2072.x;
if (l9_2081==1)
{
l9_2080=fract(l9_2080);
}
else
{
if (l9_2081==2)
{
float l9_2082=fract(l9_2080);
float l9_2083=l9_2080-l9_2082;
float l9_2084=step(0.25,fract(l9_2083*0.5));
l9_2080=mix(l9_2082,1.0-l9_2082,fast::clamp(l9_2084,0.0,1.0));
}
}
l9_2069.x=l9_2080;
float l9_2085=l9_2069.y;
int l9_2086=l9_2072.y;
if (l9_2086==1)
{
l9_2085=fract(l9_2085);
}
else
{
if (l9_2086==2)
{
float l9_2087=fract(l9_2085);
float l9_2088=l9_2085-l9_2087;
float l9_2089=step(0.25,fract(l9_2088*0.5));
l9_2085=mix(l9_2087,1.0-l9_2087,fast::clamp(l9_2089,0.0,1.0));
}
}
l9_2069.y=l9_2085;
if (l9_2073)
{
bool l9_2090=l9_2075;
bool l9_2091;
if (l9_2090)
{
l9_2091=l9_2072.x==3;
}
else
{
l9_2091=l9_2090;
}
float l9_2092=l9_2069.x;
float l9_2093=l9_2074.x;
float l9_2094=l9_2074.z;
bool l9_2095=l9_2091;
float l9_2096=l9_2079;
float l9_2097=fast::clamp(l9_2092,l9_2093,l9_2094);
float l9_2098=step(abs(l9_2092-l9_2097),9.9999997e-06);
l9_2096*=(l9_2098+((1.0-float(l9_2095))*(1.0-l9_2098)));
l9_2092=l9_2097;
l9_2069.x=l9_2092;
l9_2079=l9_2096;
bool l9_2099=l9_2075;
bool l9_2100;
if (l9_2099)
{
l9_2100=l9_2072.y==3;
}
else
{
l9_2100=l9_2099;
}
float l9_2101=l9_2069.y;
float l9_2102=l9_2074.y;
float l9_2103=l9_2074.w;
bool l9_2104=l9_2100;
float l9_2105=l9_2079;
float l9_2106=fast::clamp(l9_2101,l9_2102,l9_2103);
float l9_2107=step(abs(l9_2101-l9_2106),9.9999997e-06);
l9_2105*=(l9_2107+((1.0-float(l9_2104))*(1.0-l9_2107)));
l9_2101=l9_2106;
l9_2069.y=l9_2101;
l9_2079=l9_2105;
}
float2 l9_2108=l9_2069;
bool l9_2109=l9_2070;
float3x3 l9_2110=l9_2071;
if (l9_2109)
{
l9_2108=float2((l9_2110*float3(l9_2108,1.0)).xy);
}
float2 l9_2111=l9_2108;
float2 l9_2112=l9_2111;
float2 l9_2113=l9_2112;
l9_2069=l9_2113;
float l9_2114=l9_2069.x;
int l9_2115=l9_2072.x;
bool l9_2116=l9_2078;
float l9_2117=l9_2079;
if ((l9_2115==0)||(l9_2115==3))
{
float l9_2118=l9_2114;
float l9_2119=0.0;
float l9_2120=1.0;
bool l9_2121=l9_2116;
float l9_2122=l9_2117;
float l9_2123=fast::clamp(l9_2118,l9_2119,l9_2120);
float l9_2124=step(abs(l9_2118-l9_2123),9.9999997e-06);
l9_2122*=(l9_2124+((1.0-float(l9_2121))*(1.0-l9_2124)));
l9_2118=l9_2123;
l9_2114=l9_2118;
l9_2117=l9_2122;
}
l9_2069.x=l9_2114;
l9_2079=l9_2117;
float l9_2125=l9_2069.y;
int l9_2126=l9_2072.y;
bool l9_2127=l9_2078;
float l9_2128=l9_2079;
if ((l9_2126==0)||(l9_2126==3))
{
float l9_2129=l9_2125;
float l9_2130=0.0;
float l9_2131=1.0;
bool l9_2132=l9_2127;
float l9_2133=l9_2128;
float l9_2134=fast::clamp(l9_2129,l9_2130,l9_2131);
float l9_2135=step(abs(l9_2129-l9_2134),9.9999997e-06);
l9_2133*=(l9_2135+((1.0-float(l9_2132))*(1.0-l9_2135)));
l9_2129=l9_2134;
l9_2125=l9_2129;
l9_2128=l9_2133;
}
l9_2069.y=l9_2125;
l9_2079=l9_2128;
float2 l9_2136=l9_2069;
int l9_2137=l9_2067;
int l9_2138=l9_2068;
float l9_2139=l9_2077;
float2 l9_2140=l9_2136;
int l9_2141=l9_2137;
int l9_2142=l9_2138;
float3 l9_2143=float3(0.0);
if (l9_2141==0)
{
l9_2143=float3(l9_2140,0.0);
}
else
{
if (l9_2141==1)
{
l9_2143=float3(l9_2140.x,(l9_2140.y*0.5)+(0.5-(float(l9_2142)*0.5)),0.0);
}
else
{
l9_2143=float3(l9_2140,float(l9_2142));
}
}
float3 l9_2144=l9_2143;
float3 l9_2145=l9_2144;
float2 l9_2146=l9_2145.xy;
float l9_2147=l9_2139;
float4 l9_2148=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2146,bias(l9_2147));
float4 l9_2149=l9_2148;
float4 l9_2150=l9_2149;
if (l9_2075)
{
l9_2150=mix(l9_2076,l9_2150,float4(l9_2079));
}
float4 l9_2151=l9_2150;
float4 l9_2152=l9_2151;
l9_2044=l9_2152;
float l9_2153=0.0;
float4 l9_2154=l9_2044;
float l9_2155=l9_2154.x;
l9_2153=l9_2155;
l9_2026=l9_2153;
l9_2032=l9_2026;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==1)
{
float2 l9_2156=float2(0.0);
l9_2156=l9_2031.Surface_UVCoord0;
float2 l9_2157=float2(0.0);
float2 l9_2158=l9_2156;
float l9_2159=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2160=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2161=sin(radians(l9_2159));
float l9_2162=cos(radians(l9_2159));
float2 l9_2163=l9_2158-l9_2160;
l9_2163=float2(dot(float2(l9_2162,l9_2161),l9_2163),dot(float2(-l9_2161,l9_2162),l9_2163))+l9_2160;
l9_2157=l9_2163;
float l9_2164=0.0;
l9_2164=gParticle.Index1DPerCopyF;
float l9_2165=0.0;
l9_2165=gParticle.Ratio1DPerCopy;
float l9_2166=0.0;
l9_2166=(((l9_2165-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2167=float4(0.0);
float2 l9_2168=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2169=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2170=l9_2157;
float l9_2171=l9_2164;
float l9_2172=l9_2166;
float l9_2173=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2174=l9_2031;
float2 l9_2175=float2(0.0);
float l9_2176=floor(l9_2168.x);
float l9_2177=floor(l9_2168.y);
float l9_2178=1.0/l9_2176;
float l9_2179=1.0/l9_2177;
float l9_2180=fast::min(l9_2176*l9_2177,floor(l9_2169));
float l9_2181=floor(mod(((l9_2174.gTimeElapsedShifted+l9_2173)*l9_2172)+floor(l9_2171),l9_2180));
float l9_2182=floor(l9_2181/l9_2176);
float l9_2183=mod(l9_2181,l9_2176);
l9_2175=float2((l9_2178*l9_2170.x)+(l9_2183*l9_2178),((1.0-l9_2179)-(l9_2182*l9_2179))+(l9_2179*l9_2170.y));
int l9_2184=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2185=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2185=0;
}
else
{
l9_2185=in.varStereoViewID;
}
int l9_2186=l9_2185;
l9_2184=1-l9_2186;
}
else
{
int l9_2187=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2187=0;
}
else
{
l9_2187=in.varStereoViewID;
}
int l9_2188=l9_2187;
l9_2184=l9_2188;
}
int l9_2189=l9_2184;
int l9_2190=flipbookTexLayout_tmp;
int l9_2191=l9_2189;
float2 l9_2192=l9_2175;
bool l9_2193=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2194=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2195=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2196=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2197=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2198=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2199=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2200=0.0;
bool l9_2201=l9_2198&&(!l9_2196);
float l9_2202=1.0;
float l9_2203=l9_2192.x;
int l9_2204=l9_2195.x;
if (l9_2204==1)
{
l9_2203=fract(l9_2203);
}
else
{
if (l9_2204==2)
{
float l9_2205=fract(l9_2203);
float l9_2206=l9_2203-l9_2205;
float l9_2207=step(0.25,fract(l9_2206*0.5));
l9_2203=mix(l9_2205,1.0-l9_2205,fast::clamp(l9_2207,0.0,1.0));
}
}
l9_2192.x=l9_2203;
float l9_2208=l9_2192.y;
int l9_2209=l9_2195.y;
if (l9_2209==1)
{
l9_2208=fract(l9_2208);
}
else
{
if (l9_2209==2)
{
float l9_2210=fract(l9_2208);
float l9_2211=l9_2208-l9_2210;
float l9_2212=step(0.25,fract(l9_2211*0.5));
l9_2208=mix(l9_2210,1.0-l9_2210,fast::clamp(l9_2212,0.0,1.0));
}
}
l9_2192.y=l9_2208;
if (l9_2196)
{
bool l9_2213=l9_2198;
bool l9_2214;
if (l9_2213)
{
l9_2214=l9_2195.x==3;
}
else
{
l9_2214=l9_2213;
}
float l9_2215=l9_2192.x;
float l9_2216=l9_2197.x;
float l9_2217=l9_2197.z;
bool l9_2218=l9_2214;
float l9_2219=l9_2202;
float l9_2220=fast::clamp(l9_2215,l9_2216,l9_2217);
float l9_2221=step(abs(l9_2215-l9_2220),9.9999997e-06);
l9_2219*=(l9_2221+((1.0-float(l9_2218))*(1.0-l9_2221)));
l9_2215=l9_2220;
l9_2192.x=l9_2215;
l9_2202=l9_2219;
bool l9_2222=l9_2198;
bool l9_2223;
if (l9_2222)
{
l9_2223=l9_2195.y==3;
}
else
{
l9_2223=l9_2222;
}
float l9_2224=l9_2192.y;
float l9_2225=l9_2197.y;
float l9_2226=l9_2197.w;
bool l9_2227=l9_2223;
float l9_2228=l9_2202;
float l9_2229=fast::clamp(l9_2224,l9_2225,l9_2226);
float l9_2230=step(abs(l9_2224-l9_2229),9.9999997e-06);
l9_2228*=(l9_2230+((1.0-float(l9_2227))*(1.0-l9_2230)));
l9_2224=l9_2229;
l9_2192.y=l9_2224;
l9_2202=l9_2228;
}
float2 l9_2231=l9_2192;
bool l9_2232=l9_2193;
float3x3 l9_2233=l9_2194;
if (l9_2232)
{
l9_2231=float2((l9_2233*float3(l9_2231,1.0)).xy);
}
float2 l9_2234=l9_2231;
float2 l9_2235=l9_2234;
float2 l9_2236=l9_2235;
l9_2192=l9_2236;
float l9_2237=l9_2192.x;
int l9_2238=l9_2195.x;
bool l9_2239=l9_2201;
float l9_2240=l9_2202;
if ((l9_2238==0)||(l9_2238==3))
{
float l9_2241=l9_2237;
float l9_2242=0.0;
float l9_2243=1.0;
bool l9_2244=l9_2239;
float l9_2245=l9_2240;
float l9_2246=fast::clamp(l9_2241,l9_2242,l9_2243);
float l9_2247=step(abs(l9_2241-l9_2246),9.9999997e-06);
l9_2245*=(l9_2247+((1.0-float(l9_2244))*(1.0-l9_2247)));
l9_2241=l9_2246;
l9_2237=l9_2241;
l9_2240=l9_2245;
}
l9_2192.x=l9_2237;
l9_2202=l9_2240;
float l9_2248=l9_2192.y;
int l9_2249=l9_2195.y;
bool l9_2250=l9_2201;
float l9_2251=l9_2202;
if ((l9_2249==0)||(l9_2249==3))
{
float l9_2252=l9_2248;
float l9_2253=0.0;
float l9_2254=1.0;
bool l9_2255=l9_2250;
float l9_2256=l9_2251;
float l9_2257=fast::clamp(l9_2252,l9_2253,l9_2254);
float l9_2258=step(abs(l9_2252-l9_2257),9.9999997e-06);
l9_2256*=(l9_2258+((1.0-float(l9_2255))*(1.0-l9_2258)));
l9_2252=l9_2257;
l9_2248=l9_2252;
l9_2251=l9_2256;
}
l9_2192.y=l9_2248;
l9_2202=l9_2251;
float2 l9_2259=l9_2192;
int l9_2260=l9_2190;
int l9_2261=l9_2191;
float l9_2262=l9_2200;
float2 l9_2263=l9_2259;
int l9_2264=l9_2260;
int l9_2265=l9_2261;
float3 l9_2266=float3(0.0);
if (l9_2264==0)
{
l9_2266=float3(l9_2263,0.0);
}
else
{
if (l9_2264==1)
{
l9_2266=float3(l9_2263.x,(l9_2263.y*0.5)+(0.5-(float(l9_2265)*0.5)),0.0);
}
else
{
l9_2266=float3(l9_2263,float(l9_2265));
}
}
float3 l9_2267=l9_2266;
float3 l9_2268=l9_2267;
float2 l9_2269=l9_2268.xy;
float l9_2270=l9_2262;
float4 l9_2271=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2269,bias(l9_2270));
float4 l9_2272=l9_2271;
float4 l9_2273=l9_2272;
if (l9_2198)
{
l9_2273=mix(l9_2199,l9_2273,float4(l9_2202));
}
float4 l9_2274=l9_2273;
float4 l9_2275=l9_2274;
l9_2167=l9_2275;
float l9_2276=0.0;
float4 l9_2277=l9_2167;
float l9_2278=l9_2277.y;
l9_2276=l9_2278;
l9_2027=l9_2276;
l9_2032=l9_2027;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==2)
{
float2 l9_2279=float2(0.0);
l9_2279=l9_2031.Surface_UVCoord0;
float2 l9_2280=float2(0.0);
float2 l9_2281=l9_2279;
float l9_2282=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2283=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2284=sin(radians(l9_2282));
float l9_2285=cos(radians(l9_2282));
float2 l9_2286=l9_2281-l9_2283;
l9_2286=float2(dot(float2(l9_2285,l9_2284),l9_2286),dot(float2(-l9_2284,l9_2285),l9_2286))+l9_2283;
l9_2280=l9_2286;
float l9_2287=0.0;
l9_2287=gParticle.Index1DPerCopyF;
float l9_2288=0.0;
l9_2288=gParticle.Ratio1DPerCopy;
float l9_2289=0.0;
l9_2289=(((l9_2288-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2290=float4(0.0);
float2 l9_2291=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2292=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2293=l9_2280;
float l9_2294=l9_2287;
float l9_2295=l9_2289;
float l9_2296=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2297=l9_2031;
float2 l9_2298=float2(0.0);
float l9_2299=floor(l9_2291.x);
float l9_2300=floor(l9_2291.y);
float l9_2301=1.0/l9_2299;
float l9_2302=1.0/l9_2300;
float l9_2303=fast::min(l9_2299*l9_2300,floor(l9_2292));
float l9_2304=floor(mod(((l9_2297.gTimeElapsedShifted+l9_2296)*l9_2295)+floor(l9_2294),l9_2303));
float l9_2305=floor(l9_2304/l9_2299);
float l9_2306=mod(l9_2304,l9_2299);
l9_2298=float2((l9_2301*l9_2293.x)+(l9_2306*l9_2301),((1.0-l9_2302)-(l9_2305*l9_2302))+(l9_2302*l9_2293.y));
int l9_2307=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2308=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2308=0;
}
else
{
l9_2308=in.varStereoViewID;
}
int l9_2309=l9_2308;
l9_2307=1-l9_2309;
}
else
{
int l9_2310=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2310=0;
}
else
{
l9_2310=in.varStereoViewID;
}
int l9_2311=l9_2310;
l9_2307=l9_2311;
}
int l9_2312=l9_2307;
int l9_2313=flipbookTexLayout_tmp;
int l9_2314=l9_2312;
float2 l9_2315=l9_2298;
bool l9_2316=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2317=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2318=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2319=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2320=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2321=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2322=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2323=0.0;
bool l9_2324=l9_2321&&(!l9_2319);
float l9_2325=1.0;
float l9_2326=l9_2315.x;
int l9_2327=l9_2318.x;
if (l9_2327==1)
{
l9_2326=fract(l9_2326);
}
else
{
if (l9_2327==2)
{
float l9_2328=fract(l9_2326);
float l9_2329=l9_2326-l9_2328;
float l9_2330=step(0.25,fract(l9_2329*0.5));
l9_2326=mix(l9_2328,1.0-l9_2328,fast::clamp(l9_2330,0.0,1.0));
}
}
l9_2315.x=l9_2326;
float l9_2331=l9_2315.y;
int l9_2332=l9_2318.y;
if (l9_2332==1)
{
l9_2331=fract(l9_2331);
}
else
{
if (l9_2332==2)
{
float l9_2333=fract(l9_2331);
float l9_2334=l9_2331-l9_2333;
float l9_2335=step(0.25,fract(l9_2334*0.5));
l9_2331=mix(l9_2333,1.0-l9_2333,fast::clamp(l9_2335,0.0,1.0));
}
}
l9_2315.y=l9_2331;
if (l9_2319)
{
bool l9_2336=l9_2321;
bool l9_2337;
if (l9_2336)
{
l9_2337=l9_2318.x==3;
}
else
{
l9_2337=l9_2336;
}
float l9_2338=l9_2315.x;
float l9_2339=l9_2320.x;
float l9_2340=l9_2320.z;
bool l9_2341=l9_2337;
float l9_2342=l9_2325;
float l9_2343=fast::clamp(l9_2338,l9_2339,l9_2340);
float l9_2344=step(abs(l9_2338-l9_2343),9.9999997e-06);
l9_2342*=(l9_2344+((1.0-float(l9_2341))*(1.0-l9_2344)));
l9_2338=l9_2343;
l9_2315.x=l9_2338;
l9_2325=l9_2342;
bool l9_2345=l9_2321;
bool l9_2346;
if (l9_2345)
{
l9_2346=l9_2318.y==3;
}
else
{
l9_2346=l9_2345;
}
float l9_2347=l9_2315.y;
float l9_2348=l9_2320.y;
float l9_2349=l9_2320.w;
bool l9_2350=l9_2346;
float l9_2351=l9_2325;
float l9_2352=fast::clamp(l9_2347,l9_2348,l9_2349);
float l9_2353=step(abs(l9_2347-l9_2352),9.9999997e-06);
l9_2351*=(l9_2353+((1.0-float(l9_2350))*(1.0-l9_2353)));
l9_2347=l9_2352;
l9_2315.y=l9_2347;
l9_2325=l9_2351;
}
float2 l9_2354=l9_2315;
bool l9_2355=l9_2316;
float3x3 l9_2356=l9_2317;
if (l9_2355)
{
l9_2354=float2((l9_2356*float3(l9_2354,1.0)).xy);
}
float2 l9_2357=l9_2354;
float2 l9_2358=l9_2357;
float2 l9_2359=l9_2358;
l9_2315=l9_2359;
float l9_2360=l9_2315.x;
int l9_2361=l9_2318.x;
bool l9_2362=l9_2324;
float l9_2363=l9_2325;
if ((l9_2361==0)||(l9_2361==3))
{
float l9_2364=l9_2360;
float l9_2365=0.0;
float l9_2366=1.0;
bool l9_2367=l9_2362;
float l9_2368=l9_2363;
float l9_2369=fast::clamp(l9_2364,l9_2365,l9_2366);
float l9_2370=step(abs(l9_2364-l9_2369),9.9999997e-06);
l9_2368*=(l9_2370+((1.0-float(l9_2367))*(1.0-l9_2370)));
l9_2364=l9_2369;
l9_2360=l9_2364;
l9_2363=l9_2368;
}
l9_2315.x=l9_2360;
l9_2325=l9_2363;
float l9_2371=l9_2315.y;
int l9_2372=l9_2318.y;
bool l9_2373=l9_2324;
float l9_2374=l9_2325;
if ((l9_2372==0)||(l9_2372==3))
{
float l9_2375=l9_2371;
float l9_2376=0.0;
float l9_2377=1.0;
bool l9_2378=l9_2373;
float l9_2379=l9_2374;
float l9_2380=fast::clamp(l9_2375,l9_2376,l9_2377);
float l9_2381=step(abs(l9_2375-l9_2380),9.9999997e-06);
l9_2379*=(l9_2381+((1.0-float(l9_2378))*(1.0-l9_2381)));
l9_2375=l9_2380;
l9_2371=l9_2375;
l9_2374=l9_2379;
}
l9_2315.y=l9_2371;
l9_2325=l9_2374;
float2 l9_2382=l9_2315;
int l9_2383=l9_2313;
int l9_2384=l9_2314;
float l9_2385=l9_2323;
float2 l9_2386=l9_2382;
int l9_2387=l9_2383;
int l9_2388=l9_2384;
float3 l9_2389=float3(0.0);
if (l9_2387==0)
{
l9_2389=float3(l9_2386,0.0);
}
else
{
if (l9_2387==1)
{
l9_2389=float3(l9_2386.x,(l9_2386.y*0.5)+(0.5-(float(l9_2388)*0.5)),0.0);
}
else
{
l9_2389=float3(l9_2386,float(l9_2388));
}
}
float3 l9_2390=l9_2389;
float3 l9_2391=l9_2390;
float2 l9_2392=l9_2391.xy;
float l9_2393=l9_2385;
float4 l9_2394=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2392,bias(l9_2393));
float4 l9_2395=l9_2394;
float4 l9_2396=l9_2395;
if (l9_2321)
{
l9_2396=mix(l9_2322,l9_2396,float4(l9_2325));
}
float4 l9_2397=l9_2396;
float4 l9_2398=l9_2397;
l9_2290=l9_2398;
float l9_2399=0.0;
float4 l9_2400=l9_2290;
float l9_2401=l9_2400.z;
l9_2399=l9_2401;
l9_2028=l9_2399;
l9_2032=l9_2028;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==3)
{
float2 l9_2402=float2(0.0);
l9_2402=l9_2031.Surface_UVCoord0;
float2 l9_2403=float2(0.0);
float2 l9_2404=l9_2402;
float l9_2405=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2406=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2407=sin(radians(l9_2405));
float l9_2408=cos(radians(l9_2405));
float2 l9_2409=l9_2404-l9_2406;
l9_2409=float2(dot(float2(l9_2408,l9_2407),l9_2409),dot(float2(-l9_2407,l9_2408),l9_2409))+l9_2406;
l9_2403=l9_2409;
float l9_2410=0.0;
l9_2410=gParticle.Index1DPerCopyF;
float l9_2411=0.0;
l9_2411=gParticle.Ratio1DPerCopy;
float l9_2412=0.0;
l9_2412=(((l9_2411-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2413=float4(0.0);
float2 l9_2414=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2415=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2416=l9_2403;
float l9_2417=l9_2410;
float l9_2418=l9_2412;
float l9_2419=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2420=l9_2031;
float2 l9_2421=float2(0.0);
float l9_2422=floor(l9_2414.x);
float l9_2423=floor(l9_2414.y);
float l9_2424=1.0/l9_2422;
float l9_2425=1.0/l9_2423;
float l9_2426=fast::min(l9_2422*l9_2423,floor(l9_2415));
float l9_2427=floor(mod(((l9_2420.gTimeElapsedShifted+l9_2419)*l9_2418)+floor(l9_2417),l9_2426));
float l9_2428=floor(l9_2427/l9_2422);
float l9_2429=mod(l9_2427,l9_2422);
l9_2421=float2((l9_2424*l9_2416.x)+(l9_2429*l9_2424),((1.0-l9_2425)-(l9_2428*l9_2425))+(l9_2425*l9_2416.y));
int l9_2430=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2431=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2431=0;
}
else
{
l9_2431=in.varStereoViewID;
}
int l9_2432=l9_2431;
l9_2430=1-l9_2432;
}
else
{
int l9_2433=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2433=0;
}
else
{
l9_2433=in.varStereoViewID;
}
int l9_2434=l9_2433;
l9_2430=l9_2434;
}
int l9_2435=l9_2430;
int l9_2436=flipbookTexLayout_tmp;
int l9_2437=l9_2435;
float2 l9_2438=l9_2421;
bool l9_2439=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2440=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2441=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2442=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2443=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2444=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2445=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2446=0.0;
bool l9_2447=l9_2444&&(!l9_2442);
float l9_2448=1.0;
float l9_2449=l9_2438.x;
int l9_2450=l9_2441.x;
if (l9_2450==1)
{
l9_2449=fract(l9_2449);
}
else
{
if (l9_2450==2)
{
float l9_2451=fract(l9_2449);
float l9_2452=l9_2449-l9_2451;
float l9_2453=step(0.25,fract(l9_2452*0.5));
l9_2449=mix(l9_2451,1.0-l9_2451,fast::clamp(l9_2453,0.0,1.0));
}
}
l9_2438.x=l9_2449;
float l9_2454=l9_2438.y;
int l9_2455=l9_2441.y;
if (l9_2455==1)
{
l9_2454=fract(l9_2454);
}
else
{
if (l9_2455==2)
{
float l9_2456=fract(l9_2454);
float l9_2457=l9_2454-l9_2456;
float l9_2458=step(0.25,fract(l9_2457*0.5));
l9_2454=mix(l9_2456,1.0-l9_2456,fast::clamp(l9_2458,0.0,1.0));
}
}
l9_2438.y=l9_2454;
if (l9_2442)
{
bool l9_2459=l9_2444;
bool l9_2460;
if (l9_2459)
{
l9_2460=l9_2441.x==3;
}
else
{
l9_2460=l9_2459;
}
float l9_2461=l9_2438.x;
float l9_2462=l9_2443.x;
float l9_2463=l9_2443.z;
bool l9_2464=l9_2460;
float l9_2465=l9_2448;
float l9_2466=fast::clamp(l9_2461,l9_2462,l9_2463);
float l9_2467=step(abs(l9_2461-l9_2466),9.9999997e-06);
l9_2465*=(l9_2467+((1.0-float(l9_2464))*(1.0-l9_2467)));
l9_2461=l9_2466;
l9_2438.x=l9_2461;
l9_2448=l9_2465;
bool l9_2468=l9_2444;
bool l9_2469;
if (l9_2468)
{
l9_2469=l9_2441.y==3;
}
else
{
l9_2469=l9_2468;
}
float l9_2470=l9_2438.y;
float l9_2471=l9_2443.y;
float l9_2472=l9_2443.w;
bool l9_2473=l9_2469;
float l9_2474=l9_2448;
float l9_2475=fast::clamp(l9_2470,l9_2471,l9_2472);
float l9_2476=step(abs(l9_2470-l9_2475),9.9999997e-06);
l9_2474*=(l9_2476+((1.0-float(l9_2473))*(1.0-l9_2476)));
l9_2470=l9_2475;
l9_2438.y=l9_2470;
l9_2448=l9_2474;
}
float2 l9_2477=l9_2438;
bool l9_2478=l9_2439;
float3x3 l9_2479=l9_2440;
if (l9_2478)
{
l9_2477=float2((l9_2479*float3(l9_2477,1.0)).xy);
}
float2 l9_2480=l9_2477;
float2 l9_2481=l9_2480;
float2 l9_2482=l9_2481;
l9_2438=l9_2482;
float l9_2483=l9_2438.x;
int l9_2484=l9_2441.x;
bool l9_2485=l9_2447;
float l9_2486=l9_2448;
if ((l9_2484==0)||(l9_2484==3))
{
float l9_2487=l9_2483;
float l9_2488=0.0;
float l9_2489=1.0;
bool l9_2490=l9_2485;
float l9_2491=l9_2486;
float l9_2492=fast::clamp(l9_2487,l9_2488,l9_2489);
float l9_2493=step(abs(l9_2487-l9_2492),9.9999997e-06);
l9_2491*=(l9_2493+((1.0-float(l9_2490))*(1.0-l9_2493)));
l9_2487=l9_2492;
l9_2483=l9_2487;
l9_2486=l9_2491;
}
l9_2438.x=l9_2483;
l9_2448=l9_2486;
float l9_2494=l9_2438.y;
int l9_2495=l9_2441.y;
bool l9_2496=l9_2447;
float l9_2497=l9_2448;
if ((l9_2495==0)||(l9_2495==3))
{
float l9_2498=l9_2494;
float l9_2499=0.0;
float l9_2500=1.0;
bool l9_2501=l9_2496;
float l9_2502=l9_2497;
float l9_2503=fast::clamp(l9_2498,l9_2499,l9_2500);
float l9_2504=step(abs(l9_2498-l9_2503),9.9999997e-06);
l9_2502*=(l9_2504+((1.0-float(l9_2501))*(1.0-l9_2504)));
l9_2498=l9_2503;
l9_2494=l9_2498;
l9_2497=l9_2502;
}
l9_2438.y=l9_2494;
l9_2448=l9_2497;
float2 l9_2505=l9_2438;
int l9_2506=l9_2436;
int l9_2507=l9_2437;
float l9_2508=l9_2446;
float2 l9_2509=l9_2505;
int l9_2510=l9_2506;
int l9_2511=l9_2507;
float3 l9_2512=float3(0.0);
if (l9_2510==0)
{
l9_2512=float3(l9_2509,0.0);
}
else
{
if (l9_2510==1)
{
l9_2512=float3(l9_2509.x,(l9_2509.y*0.5)+(0.5-(float(l9_2511)*0.5)),0.0);
}
else
{
l9_2512=float3(l9_2509,float(l9_2511));
}
}
float3 l9_2513=l9_2512;
float3 l9_2514=l9_2513;
float2 l9_2515=l9_2514.xy;
float l9_2516=l9_2508;
float4 l9_2517=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2515,bias(l9_2516));
float4 l9_2518=l9_2517;
float4 l9_2519=l9_2518;
if (l9_2444)
{
l9_2519=mix(l9_2445,l9_2519,float4(l9_2448));
}
float4 l9_2520=l9_2519;
float4 l9_2521=l9_2520;
l9_2413=l9_2521;
float l9_2522=0.0;
float4 l9_2523=l9_2413;
float l9_2524=l9_2523.w;
l9_2522=l9_2524;
l9_2029=l9_2522;
l9_2032=l9_2029;
}
else
{
float2 l9_2525=float2(0.0);
l9_2525=l9_2031.Surface_UVCoord0;
float2 l9_2526=float2(0.0);
float2 l9_2527=l9_2525;
float l9_2528=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2529=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2530=sin(radians(l9_2528));
float l9_2531=cos(radians(l9_2528));
float2 l9_2532=l9_2527-l9_2529;
l9_2532=float2(dot(float2(l9_2531,l9_2530),l9_2532),dot(float2(-l9_2530,l9_2531),l9_2532))+l9_2529;
l9_2526=l9_2532;
float l9_2533=0.0;
l9_2533=gParticle.Index1DPerCopyF;
float l9_2534=0.0;
l9_2534=gParticle.Ratio1DPerCopy;
float l9_2535=0.0;
l9_2535=(((l9_2534-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2536=float4(0.0);
float2 l9_2537=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2538=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2539=l9_2526;
float l9_2540=l9_2533;
float l9_2541=l9_2535;
float l9_2542=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2543=l9_2031;
float2 l9_2544=float2(0.0);
float l9_2545=floor(l9_2537.x);
float l9_2546=floor(l9_2537.y);
float l9_2547=1.0/l9_2545;
float l9_2548=1.0/l9_2546;
float l9_2549=fast::min(l9_2545*l9_2546,floor(l9_2538));
float l9_2550=floor(mod(((l9_2543.gTimeElapsedShifted+l9_2542)*l9_2541)+floor(l9_2540),l9_2549));
float l9_2551=floor(l9_2550/l9_2545);
float l9_2552=mod(l9_2550,l9_2545);
l9_2544=float2((l9_2547*l9_2539.x)+(l9_2552*l9_2547),((1.0-l9_2548)-(l9_2551*l9_2548))+(l9_2548*l9_2539.y));
int l9_2553=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2554=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2554=0;
}
else
{
l9_2554=in.varStereoViewID;
}
int l9_2555=l9_2554;
l9_2553=1-l9_2555;
}
else
{
int l9_2556=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2556=0;
}
else
{
l9_2556=in.varStereoViewID;
}
int l9_2557=l9_2556;
l9_2553=l9_2557;
}
int l9_2558=l9_2553;
int l9_2559=flipbookTexLayout_tmp;
int l9_2560=l9_2558;
float2 l9_2561=l9_2544;
bool l9_2562=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2563=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2564=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2565=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2566=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2567=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2568=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2569=0.0;
bool l9_2570=l9_2567&&(!l9_2565);
float l9_2571=1.0;
float l9_2572=l9_2561.x;
int l9_2573=l9_2564.x;
if (l9_2573==1)
{
l9_2572=fract(l9_2572);
}
else
{
if (l9_2573==2)
{
float l9_2574=fract(l9_2572);
float l9_2575=l9_2572-l9_2574;
float l9_2576=step(0.25,fract(l9_2575*0.5));
l9_2572=mix(l9_2574,1.0-l9_2574,fast::clamp(l9_2576,0.0,1.0));
}
}
l9_2561.x=l9_2572;
float l9_2577=l9_2561.y;
int l9_2578=l9_2564.y;
if (l9_2578==1)
{
l9_2577=fract(l9_2577);
}
else
{
if (l9_2578==2)
{
float l9_2579=fract(l9_2577);
float l9_2580=l9_2577-l9_2579;
float l9_2581=step(0.25,fract(l9_2580*0.5));
l9_2577=mix(l9_2579,1.0-l9_2579,fast::clamp(l9_2581,0.0,1.0));
}
}
l9_2561.y=l9_2577;
if (l9_2565)
{
bool l9_2582=l9_2567;
bool l9_2583;
if (l9_2582)
{
l9_2583=l9_2564.x==3;
}
else
{
l9_2583=l9_2582;
}
float l9_2584=l9_2561.x;
float l9_2585=l9_2566.x;
float l9_2586=l9_2566.z;
bool l9_2587=l9_2583;
float l9_2588=l9_2571;
float l9_2589=fast::clamp(l9_2584,l9_2585,l9_2586);
float l9_2590=step(abs(l9_2584-l9_2589),9.9999997e-06);
l9_2588*=(l9_2590+((1.0-float(l9_2587))*(1.0-l9_2590)));
l9_2584=l9_2589;
l9_2561.x=l9_2584;
l9_2571=l9_2588;
bool l9_2591=l9_2567;
bool l9_2592;
if (l9_2591)
{
l9_2592=l9_2564.y==3;
}
else
{
l9_2592=l9_2591;
}
float l9_2593=l9_2561.y;
float l9_2594=l9_2566.y;
float l9_2595=l9_2566.w;
bool l9_2596=l9_2592;
float l9_2597=l9_2571;
float l9_2598=fast::clamp(l9_2593,l9_2594,l9_2595);
float l9_2599=step(abs(l9_2593-l9_2598),9.9999997e-06);
l9_2597*=(l9_2599+((1.0-float(l9_2596))*(1.0-l9_2599)));
l9_2593=l9_2598;
l9_2561.y=l9_2593;
l9_2571=l9_2597;
}
float2 l9_2600=l9_2561;
bool l9_2601=l9_2562;
float3x3 l9_2602=l9_2563;
if (l9_2601)
{
l9_2600=float2((l9_2602*float3(l9_2600,1.0)).xy);
}
float2 l9_2603=l9_2600;
float2 l9_2604=l9_2603;
float2 l9_2605=l9_2604;
l9_2561=l9_2605;
float l9_2606=l9_2561.x;
int l9_2607=l9_2564.x;
bool l9_2608=l9_2570;
float l9_2609=l9_2571;
if ((l9_2607==0)||(l9_2607==3))
{
float l9_2610=l9_2606;
float l9_2611=0.0;
float l9_2612=1.0;
bool l9_2613=l9_2608;
float l9_2614=l9_2609;
float l9_2615=fast::clamp(l9_2610,l9_2611,l9_2612);
float l9_2616=step(abs(l9_2610-l9_2615),9.9999997e-06);
l9_2614*=(l9_2616+((1.0-float(l9_2613))*(1.0-l9_2616)));
l9_2610=l9_2615;
l9_2606=l9_2610;
l9_2609=l9_2614;
}
l9_2561.x=l9_2606;
l9_2571=l9_2609;
float l9_2617=l9_2561.y;
int l9_2618=l9_2564.y;
bool l9_2619=l9_2570;
float l9_2620=l9_2571;
if ((l9_2618==0)||(l9_2618==3))
{
float l9_2621=l9_2617;
float l9_2622=0.0;
float l9_2623=1.0;
bool l9_2624=l9_2619;
float l9_2625=l9_2620;
float l9_2626=fast::clamp(l9_2621,l9_2622,l9_2623);
float l9_2627=step(abs(l9_2621-l9_2626),9.9999997e-06);
l9_2625*=(l9_2627+((1.0-float(l9_2624))*(1.0-l9_2627)));
l9_2621=l9_2626;
l9_2617=l9_2621;
l9_2620=l9_2625;
}
l9_2561.y=l9_2617;
l9_2571=l9_2620;
float2 l9_2628=l9_2561;
int l9_2629=l9_2559;
int l9_2630=l9_2560;
float l9_2631=l9_2569;
float2 l9_2632=l9_2628;
int l9_2633=l9_2629;
int l9_2634=l9_2630;
float3 l9_2635=float3(0.0);
if (l9_2633==0)
{
l9_2635=float3(l9_2632,0.0);
}
else
{
if (l9_2633==1)
{
l9_2635=float3(l9_2632.x,(l9_2632.y*0.5)+(0.5-(float(l9_2634)*0.5)),0.0);
}
else
{
l9_2635=float3(l9_2632,float(l9_2634));
}
}
float3 l9_2636=l9_2635;
float3 l9_2637=l9_2636;
float2 l9_2638=l9_2637.xy;
float l9_2639=l9_2631;
float4 l9_2640=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2638,bias(l9_2639));
float4 l9_2641=l9_2640;
float4 l9_2642=l9_2641;
if (l9_2567)
{
l9_2642=mix(l9_2568,l9_2642,float4(l9_2571));
}
float4 l9_2643=l9_2642;
float4 l9_2644=l9_2643;
l9_2536=l9_2644;
float l9_2645=0.0;
float4 l9_2646=l9_2536;
float l9_2647=l9_2646.w;
l9_2645=l9_2647;
l9_2030=l9_2645;
l9_2032=l9_2030;
}
}
}
}
l9_2025=l9_2032;
float l9_2648=0.0;
l9_2648=l9_2025;
l9_1397=l9_2648;
l9_1399=l9_1397;
}
l9_1395=l9_1399;
float4 l9_2649=float4(0.0);
l9_2649=mix(l9_1392,l9_1393,float4(l9_1395));
float l9_2650=0.0;
float l9_2651=(*sc_set0.UserUniforms).intensity;
l9_2650=l9_2651;
float4 l9_2652=float4(0.0);
float l9_2653;
if (l9_2649.x<=0.0)
{
l9_2653=0.0;
}
else
{
l9_2653=pow(l9_2649.x,l9_2650);
}
float l9_2654=l9_2653;
float l9_2655;
if (l9_2649.y<=0.0)
{
l9_2655=0.0;
}
else
{
l9_2655=pow(l9_2649.y,l9_2650);
}
float l9_2656=l9_2655;
float l9_2657;
if (l9_2649.z<=0.0)
{
l9_2657=0.0;
}
else
{
l9_2657=pow(l9_2649.z,l9_2650);
}
float l9_2658=l9_2657;
float l9_2659;
if (l9_2649.w<=0.0)
{
l9_2659=0.0;
}
else
{
l9_2659=pow(l9_2649.w,l9_2650);
}
l9_2652=float4(l9_2654,l9_2656,l9_2658,l9_2659);
l9_1388=l9_2652;
l9_1391=l9_1388;
}
else
{
float2 l9_2660=float2(0.0);
l9_2660=l9_1390.Surface_UVCoord0;
float2 l9_2661=float2(0.0);
float2 l9_2662=l9_2660;
float l9_2663=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2664=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2665=sin(radians(l9_2663));
float l9_2666=cos(radians(l9_2663));
float2 l9_2667=l9_2662-l9_2664;
l9_2667=float2(dot(float2(l9_2666,l9_2665),l9_2667),dot(float2(-l9_2665,l9_2666),l9_2667))+l9_2664;
l9_2661=l9_2667;
float l9_2668=0.0;
l9_2668=gParticle.Index1DPerCopyF;
float l9_2669=0.0;
l9_2669=gParticle.Ratio1DPerCopy;
float l9_2670=0.0;
l9_2670=(((l9_2669-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2671=float4(0.0);
float2 l9_2672=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2673=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2674=l9_2661;
float l9_2675=l9_2668;
float l9_2676=l9_2670;
float l9_2677=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2678=l9_1390;
float2 l9_2679=float2(0.0);
float l9_2680=floor(l9_2672.x);
float l9_2681=floor(l9_2672.y);
float l9_2682=1.0/l9_2680;
float l9_2683=1.0/l9_2681;
float l9_2684=fast::min(l9_2680*l9_2681,floor(l9_2673));
float l9_2685=floor(mod(((l9_2678.gTimeElapsedShifted+l9_2677)*l9_2676)+floor(l9_2675),l9_2684));
float l9_2686=floor(l9_2685/l9_2680);
float l9_2687=mod(l9_2685,l9_2680);
l9_2679=float2((l9_2682*l9_2674.x)+(l9_2687*l9_2682),((1.0-l9_2683)-(l9_2686*l9_2683))+(l9_2683*l9_2674.y));
int l9_2688=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2689=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2689=0;
}
else
{
l9_2689=in.varStereoViewID;
}
int l9_2690=l9_2689;
l9_2688=1-l9_2690;
}
else
{
int l9_2691=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2691=0;
}
else
{
l9_2691=in.varStereoViewID;
}
int l9_2692=l9_2691;
l9_2688=l9_2692;
}
int l9_2693=l9_2688;
int l9_2694=repelflipbookTexLayout_tmp;
int l9_2695=l9_2693;
float2 l9_2696=l9_2679;
bool l9_2697=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2698=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2699=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2700=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2701=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2702=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2703=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_2704=0.0;
bool l9_2705=l9_2702&&(!l9_2700);
float l9_2706=1.0;
float l9_2707=l9_2696.x;
int l9_2708=l9_2699.x;
if (l9_2708==1)
{
l9_2707=fract(l9_2707);
}
else
{
if (l9_2708==2)
{
float l9_2709=fract(l9_2707);
float l9_2710=l9_2707-l9_2709;
float l9_2711=step(0.25,fract(l9_2710*0.5));
l9_2707=mix(l9_2709,1.0-l9_2709,fast::clamp(l9_2711,0.0,1.0));
}
}
l9_2696.x=l9_2707;
float l9_2712=l9_2696.y;
int l9_2713=l9_2699.y;
if (l9_2713==1)
{
l9_2712=fract(l9_2712);
}
else
{
if (l9_2713==2)
{
float l9_2714=fract(l9_2712);
float l9_2715=l9_2712-l9_2714;
float l9_2716=step(0.25,fract(l9_2715*0.5));
l9_2712=mix(l9_2714,1.0-l9_2714,fast::clamp(l9_2716,0.0,1.0));
}
}
l9_2696.y=l9_2712;
if (l9_2700)
{
bool l9_2717=l9_2702;
bool l9_2718;
if (l9_2717)
{
l9_2718=l9_2699.x==3;
}
else
{
l9_2718=l9_2717;
}
float l9_2719=l9_2696.x;
float l9_2720=l9_2701.x;
float l9_2721=l9_2701.z;
bool l9_2722=l9_2718;
float l9_2723=l9_2706;
float l9_2724=fast::clamp(l9_2719,l9_2720,l9_2721);
float l9_2725=step(abs(l9_2719-l9_2724),9.9999997e-06);
l9_2723*=(l9_2725+((1.0-float(l9_2722))*(1.0-l9_2725)));
l9_2719=l9_2724;
l9_2696.x=l9_2719;
l9_2706=l9_2723;
bool l9_2726=l9_2702;
bool l9_2727;
if (l9_2726)
{
l9_2727=l9_2699.y==3;
}
else
{
l9_2727=l9_2726;
}
float l9_2728=l9_2696.y;
float l9_2729=l9_2701.y;
float l9_2730=l9_2701.w;
bool l9_2731=l9_2727;
float l9_2732=l9_2706;
float l9_2733=fast::clamp(l9_2728,l9_2729,l9_2730);
float l9_2734=step(abs(l9_2728-l9_2733),9.9999997e-06);
l9_2732*=(l9_2734+((1.0-float(l9_2731))*(1.0-l9_2734)));
l9_2728=l9_2733;
l9_2696.y=l9_2728;
l9_2706=l9_2732;
}
float2 l9_2735=l9_2696;
bool l9_2736=l9_2697;
float3x3 l9_2737=l9_2698;
if (l9_2736)
{
l9_2735=float2((l9_2737*float3(l9_2735,1.0)).xy);
}
float2 l9_2738=l9_2735;
float2 l9_2739=l9_2738;
float2 l9_2740=l9_2739;
l9_2696=l9_2740;
float l9_2741=l9_2696.x;
int l9_2742=l9_2699.x;
bool l9_2743=l9_2705;
float l9_2744=l9_2706;
if ((l9_2742==0)||(l9_2742==3))
{
float l9_2745=l9_2741;
float l9_2746=0.0;
float l9_2747=1.0;
bool l9_2748=l9_2743;
float l9_2749=l9_2744;
float l9_2750=fast::clamp(l9_2745,l9_2746,l9_2747);
float l9_2751=step(abs(l9_2745-l9_2750),9.9999997e-06);
l9_2749*=(l9_2751+((1.0-float(l9_2748))*(1.0-l9_2751)));
l9_2745=l9_2750;
l9_2741=l9_2745;
l9_2744=l9_2749;
}
l9_2696.x=l9_2741;
l9_2706=l9_2744;
float l9_2752=l9_2696.y;
int l9_2753=l9_2699.y;
bool l9_2754=l9_2705;
float l9_2755=l9_2706;
if ((l9_2753==0)||(l9_2753==3))
{
float l9_2756=l9_2752;
float l9_2757=0.0;
float l9_2758=1.0;
bool l9_2759=l9_2754;
float l9_2760=l9_2755;
float l9_2761=fast::clamp(l9_2756,l9_2757,l9_2758);
float l9_2762=step(abs(l9_2756-l9_2761),9.9999997e-06);
l9_2760*=(l9_2762+((1.0-float(l9_2759))*(1.0-l9_2762)));
l9_2756=l9_2761;
l9_2752=l9_2756;
l9_2755=l9_2760;
}
l9_2696.y=l9_2752;
l9_2706=l9_2755;
float2 l9_2763=l9_2696;
int l9_2764=l9_2694;
int l9_2765=l9_2695;
float l9_2766=l9_2704;
float2 l9_2767=l9_2763;
int l9_2768=l9_2764;
int l9_2769=l9_2765;
float3 l9_2770=float3(0.0);
if (l9_2768==0)
{
l9_2770=float3(l9_2767,0.0);
}
else
{
if (l9_2768==1)
{
l9_2770=float3(l9_2767.x,(l9_2767.y*0.5)+(0.5-(float(l9_2769)*0.5)),0.0);
}
else
{
l9_2770=float3(l9_2767,float(l9_2769));
}
}
float3 l9_2771=l9_2770;
float3 l9_2772=l9_2771;
float2 l9_2773=l9_2772.xy;
float l9_2774=l9_2766;
float4 l9_2775=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_2773,bias(l9_2774));
float4 l9_2776=l9_2775;
float4 l9_2777=l9_2776;
if (l9_2702)
{
l9_2777=mix(l9_2703,l9_2777,float4(l9_2706));
}
float4 l9_2778=l9_2777;
float4 l9_2779=l9_2778;
l9_2671=l9_2779;
l9_1389=l9_2671;
l9_1391=l9_1389;
}
l9_1387=l9_1391;
float l9_2780=0.0;
float l9_2781=1.0;
float l9_2782=0.0;
ssGlobals l9_2783=l9_703;
float l9_2784;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_2785=float2(0.0);
l9_2785=l9_2783.Surface_UVCoord0;
float2 l9_2786=float2(0.0);
float2 l9_2787=l9_2785;
float l9_2788=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2789=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2790=sin(radians(l9_2788));
float l9_2791=cos(radians(l9_2788));
float2 l9_2792=l9_2787-l9_2789;
l9_2792=float2(dot(float2(l9_2791,l9_2790),l9_2792),dot(float2(-l9_2790,l9_2791),l9_2792))+l9_2789;
l9_2786=l9_2792;
float l9_2793=0.0;
l9_2793=gParticle.Index1DPerCopyF;
float l9_2794=0.0;
l9_2794=gParticle.Ratio1DPerCopy;
float l9_2795=0.0;
l9_2795=(((l9_2794-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2796=float4(0.0);
float2 l9_2797=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2798=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2799=l9_2786;
float l9_2800=l9_2793;
float l9_2801=l9_2795;
float l9_2802=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2803=l9_2783;
float2 l9_2804=float2(0.0);
float l9_2805=floor(l9_2797.x);
float l9_2806=floor(l9_2797.y);
float l9_2807=1.0/l9_2805;
float l9_2808=1.0/l9_2806;
float l9_2809=fast::min(l9_2805*l9_2806,floor(l9_2798));
float l9_2810=floor(mod(((l9_2803.gTimeElapsedShifted+l9_2802)*l9_2801)+floor(l9_2800),l9_2809));
float l9_2811=floor(l9_2810/l9_2805);
float l9_2812=mod(l9_2810,l9_2805);
l9_2804=float2((l9_2807*l9_2799.x)+(l9_2812*l9_2807),((1.0-l9_2808)-(l9_2811*l9_2808))+(l9_2808*l9_2799.y));
int l9_2813=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2814=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2814=0;
}
else
{
l9_2814=in.varStereoViewID;
}
int l9_2815=l9_2814;
l9_2813=1-l9_2815;
}
else
{
int l9_2816=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2816=0;
}
else
{
l9_2816=in.varStereoViewID;
}
int l9_2817=l9_2816;
l9_2813=l9_2817;
}
int l9_2818=l9_2813;
int l9_2819=flipbookTexLayout_tmp;
int l9_2820=l9_2818;
float2 l9_2821=l9_2804;
bool l9_2822=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2823=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2824=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2825=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2826=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2827=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2828=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2829=0.0;
bool l9_2830=l9_2827&&(!l9_2825);
float l9_2831=1.0;
float l9_2832=l9_2821.x;
int l9_2833=l9_2824.x;
if (l9_2833==1)
{
l9_2832=fract(l9_2832);
}
else
{
if (l9_2833==2)
{
float l9_2834=fract(l9_2832);
float l9_2835=l9_2832-l9_2834;
float l9_2836=step(0.25,fract(l9_2835*0.5));
l9_2832=mix(l9_2834,1.0-l9_2834,fast::clamp(l9_2836,0.0,1.0));
}
}
l9_2821.x=l9_2832;
float l9_2837=l9_2821.y;
int l9_2838=l9_2824.y;
if (l9_2838==1)
{
l9_2837=fract(l9_2837);
}
else
{
if (l9_2838==2)
{
float l9_2839=fract(l9_2837);
float l9_2840=l9_2837-l9_2839;
float l9_2841=step(0.25,fract(l9_2840*0.5));
l9_2837=mix(l9_2839,1.0-l9_2839,fast::clamp(l9_2841,0.0,1.0));
}
}
l9_2821.y=l9_2837;
if (l9_2825)
{
bool l9_2842=l9_2827;
bool l9_2843;
if (l9_2842)
{
l9_2843=l9_2824.x==3;
}
else
{
l9_2843=l9_2842;
}
float l9_2844=l9_2821.x;
float l9_2845=l9_2826.x;
float l9_2846=l9_2826.z;
bool l9_2847=l9_2843;
float l9_2848=l9_2831;
float l9_2849=fast::clamp(l9_2844,l9_2845,l9_2846);
float l9_2850=step(abs(l9_2844-l9_2849),9.9999997e-06);
l9_2848*=(l9_2850+((1.0-float(l9_2847))*(1.0-l9_2850)));
l9_2844=l9_2849;
l9_2821.x=l9_2844;
l9_2831=l9_2848;
bool l9_2851=l9_2827;
bool l9_2852;
if (l9_2851)
{
l9_2852=l9_2824.y==3;
}
else
{
l9_2852=l9_2851;
}
float l9_2853=l9_2821.y;
float l9_2854=l9_2826.y;
float l9_2855=l9_2826.w;
bool l9_2856=l9_2852;
float l9_2857=l9_2831;
float l9_2858=fast::clamp(l9_2853,l9_2854,l9_2855);
float l9_2859=step(abs(l9_2853-l9_2858),9.9999997e-06);
l9_2857*=(l9_2859+((1.0-float(l9_2856))*(1.0-l9_2859)));
l9_2853=l9_2858;
l9_2821.y=l9_2853;
l9_2831=l9_2857;
}
float2 l9_2860=l9_2821;
bool l9_2861=l9_2822;
float3x3 l9_2862=l9_2823;
if (l9_2861)
{
l9_2860=float2((l9_2862*float3(l9_2860,1.0)).xy);
}
float2 l9_2863=l9_2860;
float2 l9_2864=l9_2863;
float2 l9_2865=l9_2864;
l9_2821=l9_2865;
float l9_2866=l9_2821.x;
int l9_2867=l9_2824.x;
bool l9_2868=l9_2830;
float l9_2869=l9_2831;
if ((l9_2867==0)||(l9_2867==3))
{
float l9_2870=l9_2866;
float l9_2871=0.0;
float l9_2872=1.0;
bool l9_2873=l9_2868;
float l9_2874=l9_2869;
float l9_2875=fast::clamp(l9_2870,l9_2871,l9_2872);
float l9_2876=step(abs(l9_2870-l9_2875),9.9999997e-06);
l9_2874*=(l9_2876+((1.0-float(l9_2873))*(1.0-l9_2876)));
l9_2870=l9_2875;
l9_2866=l9_2870;
l9_2869=l9_2874;
}
l9_2821.x=l9_2866;
l9_2831=l9_2869;
float l9_2877=l9_2821.y;
int l9_2878=l9_2824.y;
bool l9_2879=l9_2830;
float l9_2880=l9_2831;
if ((l9_2878==0)||(l9_2878==3))
{
float l9_2881=l9_2877;
float l9_2882=0.0;
float l9_2883=1.0;
bool l9_2884=l9_2879;
float l9_2885=l9_2880;
float l9_2886=fast::clamp(l9_2881,l9_2882,l9_2883);
float l9_2887=step(abs(l9_2881-l9_2886),9.9999997e-06);
l9_2885*=(l9_2887+((1.0-float(l9_2884))*(1.0-l9_2887)));
l9_2881=l9_2886;
l9_2877=l9_2881;
l9_2880=l9_2885;
}
l9_2821.y=l9_2877;
l9_2831=l9_2880;
float2 l9_2888=l9_2821;
int l9_2889=l9_2819;
int l9_2890=l9_2820;
float l9_2891=l9_2829;
float2 l9_2892=l9_2888;
int l9_2893=l9_2889;
int l9_2894=l9_2890;
float3 l9_2895=float3(0.0);
if (l9_2893==0)
{
l9_2895=float3(l9_2892,0.0);
}
else
{
if (l9_2893==1)
{
l9_2895=float3(l9_2892.x,(l9_2892.y*0.5)+(0.5-(float(l9_2894)*0.5)),0.0);
}
else
{
l9_2895=float3(l9_2892,float(l9_2894));
}
}
float3 l9_2896=l9_2895;
float3 l9_2897=l9_2896;
float2 l9_2898=l9_2897.xy;
float l9_2899=l9_2891;
float4 l9_2900=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2898,bias(l9_2899));
float4 l9_2901=l9_2900;
float4 l9_2902=l9_2901;
if (l9_2827)
{
l9_2902=mix(l9_2828,l9_2902,float4(l9_2831));
}
float4 l9_2903=l9_2902;
float4 l9_2904=l9_2903;
l9_2796=l9_2904;
float l9_2905=0.0;
l9_2905=l9_2796.w;
float4 l9_2906=float4(0.0);
l9_2906=gParticle.Color;
float l9_2907=0.0;
l9_2907=l9_2906.w;
float l9_2908=0.0;
l9_2908=l9_2905*l9_2907;
l9_2781=l9_2908;
l9_2784=l9_2781;
}
else
{
float4 l9_2909=float4(0.0);
l9_2909=gParticle.Color;
float l9_2910=0.0;
l9_2910=l9_2909.w;
float2 l9_2911=float2(0.0);
l9_2911=l9_2783.Surface_UVCoord0;
float2 l9_2912=float2(0.0);
float2 l9_2913=l9_2911;
float l9_2914=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2915=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2916=sin(radians(l9_2914));
float l9_2917=cos(radians(l9_2914));
float2 l9_2918=l9_2913-l9_2915;
l9_2918=float2(dot(float2(l9_2917,l9_2916),l9_2918),dot(float2(-l9_2916,l9_2917),l9_2918))+l9_2915;
l9_2912=l9_2918;
float l9_2919=0.0;
l9_2919=gParticle.Index1DPerCopyF;
float l9_2920=0.0;
l9_2920=gParticle.Ratio1DPerCopy;
float l9_2921=0.0;
l9_2921=(((l9_2920-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2922=float4(0.0);
float2 l9_2923=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2924=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2925=l9_2912;
float l9_2926=l9_2919;
float l9_2927=l9_2921;
float l9_2928=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2929=l9_2783;
float2 l9_2930=float2(0.0);
float l9_2931=floor(l9_2923.x);
float l9_2932=floor(l9_2923.y);
float l9_2933=1.0/l9_2931;
float l9_2934=1.0/l9_2932;
float l9_2935=fast::min(l9_2931*l9_2932,floor(l9_2924));
float l9_2936=floor(mod(((l9_2929.gTimeElapsedShifted+l9_2928)*l9_2927)+floor(l9_2926),l9_2935));
float l9_2937=floor(l9_2936/l9_2931);
float l9_2938=mod(l9_2936,l9_2931);
l9_2930=float2((l9_2933*l9_2925.x)+(l9_2938*l9_2933),((1.0-l9_2934)-(l9_2937*l9_2934))+(l9_2934*l9_2925.y));
int l9_2939=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2940=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2940=0;
}
else
{
l9_2940=in.varStereoViewID;
}
int l9_2941=l9_2940;
l9_2939=1-l9_2941;
}
else
{
int l9_2942=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2942=0;
}
else
{
l9_2942=in.varStereoViewID;
}
int l9_2943=l9_2942;
l9_2939=l9_2943;
}
int l9_2944=l9_2939;
int l9_2945=repelflipbookTexLayout_tmp;
int l9_2946=l9_2944;
float2 l9_2947=l9_2930;
bool l9_2948=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2949=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2950=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2951=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2952=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2953=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2954=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_2955=0.0;
bool l9_2956=l9_2953&&(!l9_2951);
float l9_2957=1.0;
float l9_2958=l9_2947.x;
int l9_2959=l9_2950.x;
if (l9_2959==1)
{
l9_2958=fract(l9_2958);
}
else
{
if (l9_2959==2)
{
float l9_2960=fract(l9_2958);
float l9_2961=l9_2958-l9_2960;
float l9_2962=step(0.25,fract(l9_2961*0.5));
l9_2958=mix(l9_2960,1.0-l9_2960,fast::clamp(l9_2962,0.0,1.0));
}
}
l9_2947.x=l9_2958;
float l9_2963=l9_2947.y;
int l9_2964=l9_2950.y;
if (l9_2964==1)
{
l9_2963=fract(l9_2963);
}
else
{
if (l9_2964==2)
{
float l9_2965=fract(l9_2963);
float l9_2966=l9_2963-l9_2965;
float l9_2967=step(0.25,fract(l9_2966*0.5));
l9_2963=mix(l9_2965,1.0-l9_2965,fast::clamp(l9_2967,0.0,1.0));
}
}
l9_2947.y=l9_2963;
if (l9_2951)
{
bool l9_2968=l9_2953;
bool l9_2969;
if (l9_2968)
{
l9_2969=l9_2950.x==3;
}
else
{
l9_2969=l9_2968;
}
float l9_2970=l9_2947.x;
float l9_2971=l9_2952.x;
float l9_2972=l9_2952.z;
bool l9_2973=l9_2969;
float l9_2974=l9_2957;
float l9_2975=fast::clamp(l9_2970,l9_2971,l9_2972);
float l9_2976=step(abs(l9_2970-l9_2975),9.9999997e-06);
l9_2974*=(l9_2976+((1.0-float(l9_2973))*(1.0-l9_2976)));
l9_2970=l9_2975;
l9_2947.x=l9_2970;
l9_2957=l9_2974;
bool l9_2977=l9_2953;
bool l9_2978;
if (l9_2977)
{
l9_2978=l9_2950.y==3;
}
else
{
l9_2978=l9_2977;
}
float l9_2979=l9_2947.y;
float l9_2980=l9_2952.y;
float l9_2981=l9_2952.w;
bool l9_2982=l9_2978;
float l9_2983=l9_2957;
float l9_2984=fast::clamp(l9_2979,l9_2980,l9_2981);
float l9_2985=step(abs(l9_2979-l9_2984),9.9999997e-06);
l9_2983*=(l9_2985+((1.0-float(l9_2982))*(1.0-l9_2985)));
l9_2979=l9_2984;
l9_2947.y=l9_2979;
l9_2957=l9_2983;
}
float2 l9_2986=l9_2947;
bool l9_2987=l9_2948;
float3x3 l9_2988=l9_2949;
if (l9_2987)
{
l9_2986=float2((l9_2988*float3(l9_2986,1.0)).xy);
}
float2 l9_2989=l9_2986;
float2 l9_2990=l9_2989;
float2 l9_2991=l9_2990;
l9_2947=l9_2991;
float l9_2992=l9_2947.x;
int l9_2993=l9_2950.x;
bool l9_2994=l9_2956;
float l9_2995=l9_2957;
if ((l9_2993==0)||(l9_2993==3))
{
float l9_2996=l9_2992;
float l9_2997=0.0;
float l9_2998=1.0;
bool l9_2999=l9_2994;
float l9_3000=l9_2995;
float l9_3001=fast::clamp(l9_2996,l9_2997,l9_2998);
float l9_3002=step(abs(l9_2996-l9_3001),9.9999997e-06);
l9_3000*=(l9_3002+((1.0-float(l9_2999))*(1.0-l9_3002)));
l9_2996=l9_3001;
l9_2992=l9_2996;
l9_2995=l9_3000;
}
l9_2947.x=l9_2992;
l9_2957=l9_2995;
float l9_3003=l9_2947.y;
int l9_3004=l9_2950.y;
bool l9_3005=l9_2956;
float l9_3006=l9_2957;
if ((l9_3004==0)||(l9_3004==3))
{
float l9_3007=l9_3003;
float l9_3008=0.0;
float l9_3009=1.0;
bool l9_3010=l9_3005;
float l9_3011=l9_3006;
float l9_3012=fast::clamp(l9_3007,l9_3008,l9_3009);
float l9_3013=step(abs(l9_3007-l9_3012),9.9999997e-06);
l9_3011*=(l9_3013+((1.0-float(l9_3010))*(1.0-l9_3013)));
l9_3007=l9_3012;
l9_3003=l9_3007;
l9_3006=l9_3011;
}
l9_2947.y=l9_3003;
l9_2957=l9_3006;
float2 l9_3014=l9_2947;
int l9_3015=l9_2945;
int l9_3016=l9_2946;
float l9_3017=l9_2955;
float2 l9_3018=l9_3014;
int l9_3019=l9_3015;
int l9_3020=l9_3016;
float3 l9_3021=float3(0.0);
if (l9_3019==0)
{
l9_3021=float3(l9_3018,0.0);
}
else
{
if (l9_3019==1)
{
l9_3021=float3(l9_3018.x,(l9_3018.y*0.5)+(0.5-(float(l9_3020)*0.5)),0.0);
}
else
{
l9_3021=float3(l9_3018,float(l9_3020));
}
}
float3 l9_3022=l9_3021;
float3 l9_3023=l9_3022;
float2 l9_3024=l9_3023.xy;
float l9_3025=l9_3017;
float4 l9_3026=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_3024,bias(l9_3025));
float4 l9_3027=l9_3026;
float4 l9_3028=l9_3027;
if (l9_2953)
{
l9_3028=mix(l9_2954,l9_3028,float4(l9_2957));
}
float4 l9_3029=l9_3028;
float4 l9_3030=l9_3029;
l9_2922=l9_3030;
float l9_3031=0.0;
l9_3031=l9_2922.w;
float l9_3032=0.0;
l9_3032=l9_2910*l9_3031;
l9_2782=l9_3032;
l9_2784=l9_2782;
}
l9_2780=l9_2784;
float2 l9_3033=float2(0.0);
l9_3033=l9_703.Surface_UVCoord0;
float2 l9_3034=float2(0.0);
l9_3034=l9_3033*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_3035=float2(0.0);
l9_3035=l9_3034-float2(1.0);
float l9_3036=0.0;
l9_3036=dot(l9_3035,l9_3035);
float l9_3037=0.0;
l9_3037=fast::clamp(l9_3036+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_3038=0.0;
l9_3038=1.0-l9_3037;
float l9_3039=0.0;
float l9_3040;
if (l9_3038<=0.0)
{
l9_3040=0.0;
}
else
{
l9_3040=sqrt(l9_3038);
}
l9_3039=l9_3040;
float3 l9_3041=float3(0.0);
l9_3041=float3(l9_3035.x,l9_3035.y,l9_3041.z);
l9_3041.z=l9_3039;
float l9_3042=0.0;
l9_3042=distance(l9_3033,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3043=0.0;
l9_3043=float(l9_3042<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_3044=float3(0.0);
l9_3044=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_3041,float3(l9_3043));
float3 l9_3045=float3(0.0);
l9_3045=l9_3044;
float4 l9_3046=float4(0.0);
float3 l9_3047=l9_1387.xyz;
float l9_3048=l9_2780;
float3 l9_3049=l9_3045;
float3 l9_3050=(*sc_set0.UserUniforms).Port_Emissive_N258;
float l9_3051=(*sc_set0.UserUniforms).Port_Metallic_N258;
float l9_3052=(*sc_set0.UserUniforms).Port_Roughness_N258;
float3 l9_3053=(*sc_set0.UserUniforms).Port_AO_N258;
float3 l9_3054=(*sc_set0.UserUniforms).Port_SpecularAO_N258;
ssGlobals l9_3055=l9_703;
l9_3055.BumpedNormal=float3x3(float3(l9_3055.VertexTangent_WorldSpace),float3(l9_3055.VertexBinormal_WorldSpace),float3(l9_3055.VertexNormal_WorldSpace))*l9_3049;
l9_3048=fast::clamp(l9_3048,0.0,1.0);
l9_3047=fast::max(l9_3047,float3(0.0));
float3 l9_3056=l9_3047;
float l9_3057=l9_3048;
float3 l9_3058=l9_3055.BumpedNormal;
float3 l9_3059=l9_3055.PositionWS;
float3 l9_3060=l9_3055.ViewDirWS;
float3 l9_3061=l9_3050;
float l9_3062=l9_3051;
float l9_3063=l9_3052;
float3 l9_3064=l9_3053;
float3 l9_3065=l9_3054;
SurfaceProperties l9_3066;
l9_3066.albedo=float3(0.0);
l9_3066.opacity=1.0;
l9_3066.normal=float3(0.0);
l9_3066.positionWS=float3(0.0);
l9_3066.viewDirWS=float3(0.0);
l9_3066.metallic=0.0;
l9_3066.roughness=0.0;
l9_3066.emissive=float3(0.0);
l9_3066.ao=float3(1.0);
l9_3066.specularAo=float3(1.0);
l9_3066.bakedShadows=float3(1.0);
SurfaceProperties l9_3067=l9_3066;
SurfaceProperties l9_3068=l9_3067;
l9_3068.opacity=l9_3057;
float3 l9_3069=l9_3056;
float3 l9_3070;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3070=float3(pow(l9_3069.x,2.2),pow(l9_3069.y,2.2),pow(l9_3069.z,2.2));
}
else
{
l9_3070=l9_3069*l9_3069;
}
float3 l9_3071=l9_3070;
l9_3068.albedo=l9_3071;
l9_3068.normal=normalize(l9_3058);
l9_3068.positionWS=l9_3059;
l9_3068.viewDirWS=l9_3060;
float3 l9_3072=l9_3061;
float3 l9_3073;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3073=float3(pow(l9_3072.x,2.2),pow(l9_3072.y,2.2),pow(l9_3072.z,2.2));
}
else
{
l9_3073=l9_3072*l9_3072;
}
float3 l9_3074=l9_3073;
l9_3068.emissive=l9_3074;
l9_3068.metallic=l9_3062;
l9_3068.roughness=l9_3063;
l9_3068.ao=l9_3064;
l9_3068.specularAo=l9_3065;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_3075=l9_3068.positionWS;
l9_3068.ao=evaluateSSAO(l9_3075,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_3076=l9_3068;
SurfaceProperties l9_3077=l9_3076;
float3 l9_3078=mix(float3(0.039999999),l9_3077.albedo*l9_3077.metallic,float3(l9_3077.metallic));
float3 l9_3079=mix(l9_3077.albedo*(1.0-l9_3077.metallic),float3(0.0),float3(l9_3077.metallic));
l9_3076.albedo=l9_3079;
l9_3076.specColor=l9_3078;
SurfaceProperties l9_3080=l9_3076;
l9_3068=l9_3080;
SurfaceProperties l9_3081=l9_3068;
LightingComponents l9_3082;
l9_3082.directDiffuse=float3(0.0);
l9_3082.directSpecular=float3(0.0);
l9_3082.indirectDiffuse=float3(1.0);
l9_3082.indirectSpecular=float3(0.0);
l9_3082.emitted=float3(0.0);
l9_3082.transmitted=float3(0.0);
LightingComponents l9_3083=l9_3082;
LightingComponents l9_3084=l9_3083;
float3 l9_3085=l9_3081.viewDirWS;
int l9_3086=0;
float4 l9_3087=float4(l9_3081.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_3088;
LightProperties l9_3089;
int l9_3090=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3090<sc_DirectionalLightsCount_tmp)
{
l9_3088.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_3090].direction;
l9_3088.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_3090].color;
l9_3089.direction=l9_3088.direction;
l9_3089.color=l9_3088.color.xyz;
l9_3089.attenuation=l9_3088.color.w;
l9_3089.attenuation*=l9_3087[(l9_3086<3) ? l9_3086 : 3];
l9_3086++;
LightingComponents l9_3091=l9_3084;
LightProperties l9_3092=l9_3089;
SurfaceProperties l9_3093=l9_3081;
float3 l9_3094=l9_3085;
SurfaceProperties l9_3095=l9_3093;
float3 l9_3096=l9_3092.direction;
float3 l9_3097=float3(fast::clamp(dot(l9_3095.normal,l9_3096),0.0,1.0));
l9_3091.directDiffuse+=((l9_3097*l9_3092.color)*l9_3092.attenuation);
SurfaceProperties l9_3098=l9_3093;
float3 l9_3099=l9_3092.direction;
float3 l9_3100=l9_3094;
l9_3091.directSpecular+=((calculateDirectSpecular(l9_3098,l9_3099,l9_3100)*l9_3092.color)*l9_3092.attenuation);
LightingComponents l9_3101=l9_3091;
l9_3084=l9_3101;
l9_3090++;
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
sc_PointLight_t_1 l9_3102;
LightProperties l9_3103;
int l9_3104=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3104<sc_PointLightsCount_tmp)
{
l9_3102.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].falloffEnabled!=0;
l9_3102.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].falloffEndDistance;
l9_3102.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].negRcpFalloffEndDistance4;
l9_3102.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].angleScale;
l9_3102.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].angleOffset;
l9_3102.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].direction;
l9_3102.position=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].position;
l9_3102.color=(*sc_set0.UserUniforms).sc_PointLights[l9_3104].color;
float3 l9_3105=l9_3102.position-l9_3081.positionWS;
l9_3103.direction=normalize(l9_3105);
l9_3103.color=l9_3102.color.xyz;
l9_3103.attenuation=l9_3102.color.w;
l9_3103.attenuation*=l9_3087[(l9_3086<3) ? l9_3086 : 3];
float3 l9_3106=l9_3103.direction;
float3 l9_3107=l9_3102.direction;
float l9_3108=l9_3102.angleScale;
float l9_3109=l9_3102.angleOffset;
float l9_3110=dot(l9_3106,l9_3107);
float l9_3111=fast::clamp((l9_3110*l9_3108)+l9_3109,0.0,1.0);
float l9_3112=l9_3111*l9_3111;
l9_3103.attenuation*=l9_3112;
if (l9_3102.falloffEnabled)
{
float l9_3113=length(l9_3105);
float l9_3114=l9_3102.falloffEndDistance;
l9_3103.attenuation*=computeDistanceAttenuation(l9_3113,l9_3114);
}
l9_3086++;
LightingComponents l9_3115=l9_3084;
LightProperties l9_3116=l9_3103;
SurfaceProperties l9_3117=l9_3081;
float3 l9_3118=l9_3085;
SurfaceProperties l9_3119=l9_3117;
float3 l9_3120=l9_3116.direction;
float3 l9_3121=float3(fast::clamp(dot(l9_3119.normal,l9_3120),0.0,1.0));
l9_3115.directDiffuse+=((l9_3121*l9_3116.color)*l9_3116.attenuation);
SurfaceProperties l9_3122=l9_3117;
float3 l9_3123=l9_3116.direction;
float3 l9_3124=l9_3118;
l9_3115.directSpecular+=((calculateDirectSpecular(l9_3122,l9_3123,l9_3124)*l9_3116.color)*l9_3116.attenuation);
LightingComponents l9_3125=l9_3115;
l9_3084=l9_3125;
l9_3104++;
continue;
}
else
{
break;
}
}
}
bool l9_3126=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_3126)
{
float4 l9_3127=gl_FragCoord;
float2 l9_3128=l9_3127.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3129=l9_3128;
float2 l9_3130=l9_3129;
int l9_3131=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_3132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3132=0;
}
else
{
l9_3132=in.varStereoViewID;
}
int l9_3133=l9_3132;
l9_3131=1-l9_3133;
}
else
{
int l9_3134=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3134=0;
}
else
{
l9_3134=in.varStereoViewID;
}
int l9_3135=l9_3134;
l9_3131=l9_3135;
}
int l9_3136=l9_3131;
float2 l9_3137=l9_3130;
int l9_3138=l9_3136;
float2 l9_3139=l9_3137;
int l9_3140=l9_3138;
float l9_3141=0.0;
float4 l9_3142=float4(0.0);
float2 l9_3143=l9_3139;
int l9_3144=sc_RayTracedShadowTextureLayout_tmp;
int l9_3145=l9_3140;
float l9_3146=l9_3141;
float2 l9_3147=l9_3143;
int l9_3148=l9_3144;
int l9_3149=l9_3145;
float3 l9_3150=float3(0.0);
if (l9_3148==0)
{
l9_3150=float3(l9_3147,0.0);
}
else
{
if (l9_3148==1)
{
l9_3150=float3(l9_3147.x,(l9_3147.y*0.5)+(0.5-(float(l9_3149)*0.5)),0.0);
}
else
{
l9_3150=float3(l9_3147,float(l9_3149));
}
}
float3 l9_3151=l9_3150;
float3 l9_3152=l9_3151;
float2 l9_3153=l9_3152.xy;
float l9_3154=l9_3146;
float4 l9_3155=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_3153,bias(l9_3154));
float4 l9_3156=l9_3155;
l9_3142=l9_3156;
float4 l9_3157=l9_3142;
float4 l9_3158=l9_3157;
float4 l9_3159=l9_3158;
float l9_3160=l9_3159.x;
float3 l9_3161=float3(l9_3160);
float3 l9_3162=l9_3161;
l9_3084.directDiffuse*=(float3(1.0)-l9_3162);
l9_3084.directSpecular*=(float3(1.0)-l9_3162);
}
SurfaceProperties l9_3163=l9_3081;
float3 l9_3164=l9_3163.normal;
float3 l9_3165=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_3166=l9_3164;
float3 l9_3167=l9_3166;
float l9_3168=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_3169=float2(0.0);
float l9_3170=l9_3167.x;
float l9_3171=-l9_3167.z;
float l9_3172=(l9_3170<0.0) ? (-1.0) : 1.0;
float l9_3173=l9_3172*acos(fast::clamp(l9_3171/length(float2(l9_3170,l9_3171)),-1.0,1.0));
l9_3169.x=l9_3173-1.5707964;
l9_3169.y=acos(l9_3167.y);
l9_3169/=float2(6.2831855,3.1415927);
l9_3169.y=1.0-l9_3169.y;
l9_3169.x+=(l9_3168/360.0);
l9_3169.x=fract((l9_3169.x+floor(l9_3169.x))+1.0);
float2 l9_3174=l9_3169;
float2 l9_3175=l9_3174;
float4 l9_3176=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_3177=l9_3175;
float2 l9_3178=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3179=5.0;
l9_3175=calcSeamlessPanoramicUvsForSampling(l9_3177,l9_3178,l9_3179);
}
float2 l9_3180=l9_3175;
float l9_3181=13.0;
int l9_3182=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3183=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3183=0;
}
else
{
l9_3183=in.varStereoViewID;
}
int l9_3184=l9_3183;
l9_3182=1-l9_3184;
}
else
{
int l9_3185=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3185=0;
}
else
{
l9_3185=in.varStereoViewID;
}
int l9_3186=l9_3185;
l9_3182=l9_3186;
}
int l9_3187=l9_3182;
float2 l9_3188=l9_3180;
int l9_3189=l9_3187;
float l9_3190=l9_3181;
float4 l9_3191=float4(0.0);
float2 l9_3192=l9_3188;
int l9_3193=sc_EnvmapSpecularLayout_tmp;
int l9_3194=l9_3189;
float l9_3195=l9_3190;
float2 l9_3196=l9_3192;
int l9_3197=l9_3193;
int l9_3198=l9_3194;
float3 l9_3199=float3(0.0);
if (l9_3197==0)
{
l9_3199=float3(l9_3196,0.0);
}
else
{
if (l9_3197==1)
{
l9_3199=float3(l9_3196.x,(l9_3196.y*0.5)+(0.5-(float(l9_3198)*0.5)),0.0);
}
else
{
l9_3199=float3(l9_3196,float(l9_3198));
}
}
float3 l9_3200=l9_3199;
float3 l9_3201=l9_3200;
float2 l9_3202=l9_3201.xy;
float l9_3203=l9_3195;
float4 l9_3204=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3202,bias(l9_3203));
float4 l9_3205=l9_3204;
l9_3191=l9_3205;
float4 l9_3206=l9_3191;
float4 l9_3207=l9_3206;
l9_3176=l9_3207;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_3208=l9_3175;
float2 l9_3209=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_3210=0.0;
l9_3175=calcSeamlessPanoramicUvsForSampling(l9_3208,l9_3209,l9_3210);
float2 l9_3211=l9_3175;
float l9_3212=-13.0;
int l9_3213=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_3214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3214=0;
}
else
{
l9_3214=in.varStereoViewID;
}
int l9_3215=l9_3214;
l9_3213=1-l9_3215;
}
else
{
int l9_3216=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3216=0;
}
else
{
l9_3216=in.varStereoViewID;
}
int l9_3217=l9_3216;
l9_3213=l9_3217;
}
int l9_3218=l9_3213;
float2 l9_3219=l9_3211;
int l9_3220=l9_3218;
float l9_3221=l9_3212;
float4 l9_3222=float4(0.0);
float2 l9_3223=l9_3219;
int l9_3224=sc_EnvmapDiffuseLayout_tmp;
int l9_3225=l9_3220;
float l9_3226=l9_3221;
float2 l9_3227=l9_3223;
int l9_3228=l9_3224;
int l9_3229=l9_3225;
float3 l9_3230=float3(0.0);
if (l9_3228==0)
{
l9_3230=float3(l9_3227,0.0);
}
else
{
if (l9_3228==1)
{
l9_3230=float3(l9_3227.x,(l9_3227.y*0.5)+(0.5-(float(l9_3229)*0.5)),0.0);
}
else
{
l9_3230=float3(l9_3227,float(l9_3229));
}
}
float3 l9_3231=l9_3230;
float3 l9_3232=l9_3231;
float2 l9_3233=l9_3232.xy;
float l9_3234=l9_3226;
float4 l9_3235=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_3233,bias(l9_3234));
float4 l9_3236=l9_3235;
l9_3222=l9_3236;
float4 l9_3237=l9_3222;
float4 l9_3238=l9_3237;
l9_3176=l9_3238;
}
else
{
float2 l9_3239=l9_3175;
float l9_3240=13.0;
int l9_3241=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3242=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3242=0;
}
else
{
l9_3242=in.varStereoViewID;
}
int l9_3243=l9_3242;
l9_3241=1-l9_3243;
}
else
{
int l9_3244=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3244=0;
}
else
{
l9_3244=in.varStereoViewID;
}
int l9_3245=l9_3244;
l9_3241=l9_3245;
}
int l9_3246=l9_3241;
float2 l9_3247=l9_3239;
int l9_3248=l9_3246;
float l9_3249=l9_3240;
float4 l9_3250=float4(0.0);
float2 l9_3251=l9_3247;
int l9_3252=sc_EnvmapSpecularLayout_tmp;
int l9_3253=l9_3248;
float l9_3254=l9_3249;
float2 l9_3255=l9_3251;
int l9_3256=l9_3252;
int l9_3257=l9_3253;
float3 l9_3258=float3(0.0);
if (l9_3256==0)
{
l9_3258=float3(l9_3255,0.0);
}
else
{
if (l9_3256==1)
{
l9_3258=float3(l9_3255.x,(l9_3255.y*0.5)+(0.5-(float(l9_3257)*0.5)),0.0);
}
else
{
l9_3258=float3(l9_3255,float(l9_3257));
}
}
float3 l9_3259=l9_3258;
float3 l9_3260=l9_3259;
float2 l9_3261=l9_3260.xy;
float l9_3262=l9_3254;
float4 l9_3263=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3261,bias(l9_3262));
float4 l9_3264=l9_3263;
l9_3250=l9_3264;
float4 l9_3265=l9_3250;
float4 l9_3266=l9_3265;
l9_3176=l9_3266;
}
}
float4 l9_3267=l9_3176;
float3 l9_3268=l9_3267.xyz*(1.0/l9_3267.w);
float3 l9_3269=l9_3268*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_3165=l9_3269;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_3270=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_3271=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_3272=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_3273=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_3274=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_3275=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_3276=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_3277=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_3278=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_3279=-l9_3164;
float l9_3280=0.0;
l9_3280=l9_3279.x;
float l9_3281=l9_3279.y;
float l9_3282=l9_3279.z;
float l9_3283=l9_3280*l9_3280;
float l9_3284=l9_3281*l9_3281;
float l9_3285=l9_3282*l9_3282;
float l9_3286=l9_3280*l9_3281;
float l9_3287=l9_3281*l9_3282;
float l9_3288=l9_3280*l9_3282;
float3 l9_3289=((((((l9_3278*0.42904299)*(l9_3283-l9_3284))+((l9_3276*0.74312502)*l9_3285))+(l9_3270*0.88622701))-(l9_3276*0.24770799))+((((l9_3274*l9_3286)+(l9_3277*l9_3288))+(l9_3275*l9_3287))*0.85808599))+((((l9_3273*l9_3280)+(l9_3271*l9_3281))+(l9_3272*l9_3282))*1.0233279);
l9_3165=l9_3289*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_3290=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_3290)
{
float4 l9_3291=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_3165=mix(l9_3165,l9_3291.xyz,float3(l9_3291.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3165+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_3165.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3165+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_3165.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3165+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_3165.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_3292=l9_3164;
float3 l9_3293=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_3294;
float l9_3295;
int l9_3296=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3296<sc_LightEstimationSGCount_tmp)
{
l9_3294.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3296].color;
l9_3294.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3296].sharpness;
l9_3294.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3296].axis;
float3 l9_3297=l9_3292;
float l9_3298=dot(l9_3294.axis,l9_3297);
float l9_3299=l9_3294.sharpness;
float l9_3300=0.36000001;
float l9_3301=1.0/(4.0*l9_3300);
float l9_3302=exp(-l9_3299);
float l9_3303=l9_3302*l9_3302;
float l9_3304=1.0/l9_3299;
float l9_3305=(1.0+(2.0*l9_3303))-l9_3304;
float l9_3306=((l9_3302-l9_3303)*l9_3304)-l9_3303;
float l9_3307=sqrt(1.0-l9_3305);
float l9_3308=l9_3300*l9_3298;
float l9_3309=l9_3301*l9_3307;
float l9_3310=l9_3308+l9_3309;
float l9_3311=fast::clamp(l9_3298,0.0,1.0);
if (step(abs(l9_3308),l9_3309)>0.5)
{
l9_3295=(l9_3310*l9_3310)/l9_3307;
}
else
{
l9_3295=l9_3311;
}
l9_3311=l9_3295;
float l9_3312=(l9_3305*l9_3311)+l9_3306;
sc_SphericalGaussianLight_t l9_3313=l9_3294;
float3 l9_3314=(l9_3313.color/float3(l9_3313.sharpness))*6.2831855;
float3 l9_3315=(l9_3314*l9_3312)/float3(3.1415927);
l9_3293+=l9_3315;
l9_3296++;
continue;
}
else
{
break;
}
}
float3 l9_3316=l9_3293;
l9_3165+=l9_3316;
}
float3 l9_3317=l9_3165;
float3 l9_3318=l9_3317;
l9_3084.indirectDiffuse=l9_3318;
SurfaceProperties l9_3319=l9_3081;
float3 l9_3320=l9_3085;
float3 l9_3321=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_3322=l9_3319;
float3 l9_3323=l9_3320;
float3 l9_3324=l9_3322.normal;
float3 l9_3325=reflect(-l9_3323,l9_3324);
float3 l9_3326=l9_3324;
float3 l9_3327=l9_3325;
float l9_3328=l9_3322.roughness;
l9_3325=getSpecularDominantDir(l9_3326,l9_3327,l9_3328);
float l9_3329=l9_3322.roughness;
float l9_3330=fast::clamp(pow(l9_3329,0.66666669),0.0,1.0)*5.0;
float l9_3331=l9_3330;
float l9_3332=l9_3331;
float3 l9_3333=l9_3325;
float l9_3334=l9_3332;
float3 l9_3335=l9_3333;
float l9_3336=l9_3334;
float4 l9_3337=float4(0.0);
float3 l9_3338=l9_3335;
float l9_3339=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_3340=float2(0.0);
float l9_3341=l9_3338.x;
float l9_3342=-l9_3338.z;
float l9_3343=(l9_3341<0.0) ? (-1.0) : 1.0;
float l9_3344=l9_3343*acos(fast::clamp(l9_3342/length(float2(l9_3341,l9_3342)),-1.0,1.0));
l9_3340.x=l9_3344-1.5707964;
l9_3340.y=acos(l9_3338.y);
l9_3340/=float2(6.2831855,3.1415927);
l9_3340.y=1.0-l9_3340.y;
l9_3340.x+=(l9_3339/360.0);
l9_3340.x=fract((l9_3340.x+floor(l9_3340.x))+1.0);
float2 l9_3345=l9_3340;
float2 l9_3346=l9_3345;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_3347=floor(l9_3336);
float l9_3348=ceil(l9_3336);
float l9_3349=l9_3336-l9_3347;
float2 l9_3350=l9_3346;
float2 l9_3351=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3352=l9_3347;
float2 l9_3353=calcSeamlessPanoramicUvsForSampling(l9_3350,l9_3351,l9_3352);
float2 l9_3354=l9_3353;
float l9_3355=l9_3347;
float2 l9_3356=l9_3354;
float l9_3357=l9_3355;
int l9_3358=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3359=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3359=0;
}
else
{
l9_3359=in.varStereoViewID;
}
int l9_3360=l9_3359;
l9_3358=1-l9_3360;
}
else
{
int l9_3361=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3361=0;
}
else
{
l9_3361=in.varStereoViewID;
}
int l9_3362=l9_3361;
l9_3358=l9_3362;
}
int l9_3363=l9_3358;
float2 l9_3364=l9_3356;
int l9_3365=l9_3363;
float l9_3366=l9_3357;
float4 l9_3367=float4(0.0);
float2 l9_3368=l9_3364;
int l9_3369=sc_EnvmapSpecularLayout_tmp;
int l9_3370=l9_3365;
float l9_3371=l9_3366;
float2 l9_3372=l9_3368;
int l9_3373=l9_3369;
int l9_3374=l9_3370;
float3 l9_3375=float3(0.0);
if (l9_3373==0)
{
l9_3375=float3(l9_3372,0.0);
}
else
{
if (l9_3373==1)
{
l9_3375=float3(l9_3372.x,(l9_3372.y*0.5)+(0.5-(float(l9_3374)*0.5)),0.0);
}
else
{
l9_3375=float3(l9_3372,float(l9_3374));
}
}
float3 l9_3376=l9_3375;
float3 l9_3377=l9_3376;
float2 l9_3378=l9_3377.xy;
float l9_3379=l9_3371;
float4 l9_3380=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3378,level(l9_3379));
float4 l9_3381=l9_3380;
l9_3367=l9_3381;
float4 l9_3382=l9_3367;
float4 l9_3383=l9_3382;
float4 l9_3384=l9_3383;
float4 l9_3385=l9_3384;
float2 l9_3386=l9_3346;
float2 l9_3387=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3388=l9_3348;
float2 l9_3389=calcSeamlessPanoramicUvsForSampling(l9_3386,l9_3387,l9_3388);
float2 l9_3390=l9_3389;
float l9_3391=l9_3348;
float2 l9_3392=l9_3390;
float l9_3393=l9_3391;
int l9_3394=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3395=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3395=0;
}
else
{
l9_3395=in.varStereoViewID;
}
int l9_3396=l9_3395;
l9_3394=1-l9_3396;
}
else
{
int l9_3397=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3397=0;
}
else
{
l9_3397=in.varStereoViewID;
}
int l9_3398=l9_3397;
l9_3394=l9_3398;
}
int l9_3399=l9_3394;
float2 l9_3400=l9_3392;
int l9_3401=l9_3399;
float l9_3402=l9_3393;
float4 l9_3403=float4(0.0);
float2 l9_3404=l9_3400;
int l9_3405=sc_EnvmapSpecularLayout_tmp;
int l9_3406=l9_3401;
float l9_3407=l9_3402;
float2 l9_3408=l9_3404;
int l9_3409=l9_3405;
int l9_3410=l9_3406;
float3 l9_3411=float3(0.0);
if (l9_3409==0)
{
l9_3411=float3(l9_3408,0.0);
}
else
{
if (l9_3409==1)
{
l9_3411=float3(l9_3408.x,(l9_3408.y*0.5)+(0.5-(float(l9_3410)*0.5)),0.0);
}
else
{
l9_3411=float3(l9_3408,float(l9_3410));
}
}
float3 l9_3412=l9_3411;
float3 l9_3413=l9_3412;
float2 l9_3414=l9_3413.xy;
float l9_3415=l9_3407;
float4 l9_3416=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3414,level(l9_3415));
float4 l9_3417=l9_3416;
l9_3403=l9_3417;
float4 l9_3418=l9_3403;
float4 l9_3419=l9_3418;
float4 l9_3420=l9_3419;
float4 l9_3421=l9_3420;
l9_3337=mix(l9_3385,l9_3421,float4(l9_3349));
}
else
{
float2 l9_3422=l9_3346;
float l9_3423=l9_3336;
float2 l9_3424=l9_3422;
float l9_3425=l9_3423;
int l9_3426=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3427=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3427=0;
}
else
{
l9_3427=in.varStereoViewID;
}
int l9_3428=l9_3427;
l9_3426=1-l9_3428;
}
else
{
int l9_3429=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3429=0;
}
else
{
l9_3429=in.varStereoViewID;
}
int l9_3430=l9_3429;
l9_3426=l9_3430;
}
int l9_3431=l9_3426;
float2 l9_3432=l9_3424;
int l9_3433=l9_3431;
float l9_3434=l9_3425;
float4 l9_3435=float4(0.0);
float2 l9_3436=l9_3432;
int l9_3437=sc_EnvmapSpecularLayout_tmp;
int l9_3438=l9_3433;
float l9_3439=l9_3434;
float2 l9_3440=l9_3436;
int l9_3441=l9_3437;
int l9_3442=l9_3438;
float3 l9_3443=float3(0.0);
if (l9_3441==0)
{
l9_3443=float3(l9_3440,0.0);
}
else
{
if (l9_3441==1)
{
l9_3443=float3(l9_3440.x,(l9_3440.y*0.5)+(0.5-(float(l9_3442)*0.5)),0.0);
}
else
{
l9_3443=float3(l9_3440,float(l9_3442));
}
}
float3 l9_3444=l9_3443;
float3 l9_3445=l9_3444;
float2 l9_3446=l9_3445.xy;
float l9_3447=l9_3439;
float4 l9_3448=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_3446,level(l9_3447));
float4 l9_3449=l9_3448;
l9_3435=l9_3449;
float4 l9_3450=l9_3435;
float4 l9_3451=l9_3450;
float4 l9_3452=l9_3451;
l9_3337=l9_3452;
}
float4 l9_3453=l9_3337;
float3 l9_3454=l9_3453.xyz*(1.0/l9_3453.w);
float3 l9_3455=l9_3454;
float3 l9_3456=l9_3455*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_3456+=float3(1e-06);
float3 l9_3457=l9_3456;
float3 l9_3458=l9_3457;
bool l9_3459=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_3459)
{
float4 l9_3460=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_3458=mix(l9_3458,l9_3460.xyz,float3(l9_3460.w));
}
SurfaceProperties l9_3461=l9_3322;
float l9_3462=abs(dot(l9_3324,l9_3323));
float3 l9_3463=l9_3458*envBRDFApprox(l9_3461,l9_3462);
l9_3321+=l9_3463;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_3464=l9_3319;
float3 l9_3465=l9_3320;
float l9_3466=fast::clamp(l9_3464.roughness*l9_3464.roughness,0.0099999998,1.0);
float3 l9_3467=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_3464.specColor;
sc_SphericalGaussianLight_t l9_3468;
sc_SphericalGaussianLight_t l9_3469;
sc_SphericalGaussianLight_t l9_3470;
int l9_3471=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3471<sc_LightEstimationSGCount_tmp)
{
l9_3468.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3471].color;
l9_3468.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3471].sharpness;
l9_3468.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_3471].axis;
float3 l9_3472=l9_3464.normal;
float l9_3473=l9_3466;
float3 l9_3474=l9_3465;
float3 l9_3475=l9_3464.specColor;
float3 l9_3476=l9_3472;
float l9_3477=l9_3473;
l9_3469.axis=l9_3476;
float l9_3478=l9_3477*l9_3477;
l9_3469.sharpness=2.0/l9_3478;
l9_3469.color=float3(1.0/(3.1415927*l9_3478));
sc_SphericalGaussianLight_t l9_3479=l9_3469;
sc_SphericalGaussianLight_t l9_3480=l9_3479;
sc_SphericalGaussianLight_t l9_3481=l9_3480;
float3 l9_3482=l9_3474;
l9_3470.axis=reflect(-l9_3482,l9_3481.axis);
l9_3470.color=l9_3481.color;
l9_3470.sharpness=l9_3481.sharpness;
l9_3470.sharpness/=(4.0*fast::max(dot(l9_3481.axis,l9_3482),9.9999997e-05));
sc_SphericalGaussianLight_t l9_3483=l9_3470;
sc_SphericalGaussianLight_t l9_3484=l9_3483;
sc_SphericalGaussianLight_t l9_3485=l9_3484;
sc_SphericalGaussianLight_t l9_3486=l9_3468;
float l9_3487=length((l9_3485.axis*l9_3485.sharpness)+(l9_3486.axis*l9_3486.sharpness));
float3 l9_3488=(l9_3485.color*exp((l9_3487-l9_3485.sharpness)-l9_3486.sharpness))*l9_3486.color;
float l9_3489=1.0-exp((-2.0)*l9_3487);
float3 l9_3490=((l9_3488*6.2831855)*l9_3489)/float3(l9_3487);
float3 l9_3491=l9_3490;
float3 l9_3492=l9_3484.axis;
float l9_3493=l9_3473*l9_3473;
float l9_3494=fast::clamp(dot(l9_3472,l9_3492),0.0,1.0);
float l9_3495=fast::clamp(dot(l9_3472,l9_3474),0.0,1.0);
float3 l9_3496=normalize(l9_3484.axis+l9_3474);
float l9_3497=l9_3493;
float l9_3498=l9_3494;
float l9_3499=1.0/(l9_3498+sqrt(l9_3497+(((1.0-l9_3497)*l9_3498)*l9_3498)));
float l9_3500=l9_3493;
float l9_3501=l9_3495;
float l9_3502=1.0/(l9_3501+sqrt(l9_3500+(((1.0-l9_3500)*l9_3501)*l9_3501)));
l9_3491*=(l9_3499*l9_3502);
float l9_3503=pow(1.0-fast::clamp(dot(l9_3492,l9_3496),0.0,1.0),5.0);
l9_3491*=(l9_3475+((float3(1.0)-l9_3475)*l9_3503));
l9_3491*=l9_3494;
float3 l9_3504=l9_3491;
l9_3467+=l9_3504;
l9_3471++;
continue;
}
else
{
break;
}
}
float3 l9_3505=l9_3467;
l9_3321+=l9_3505;
}
float3 l9_3506=l9_3321;
l9_3084.indirectSpecular=l9_3506;
LightingComponents l9_3507=l9_3084;
LightingComponents l9_3508=l9_3507;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3508.directDiffuse=float3(0.0);
l9_3508.indirectDiffuse=float3(0.0);
float4 l9_3509=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3510=out.FragColor0;
float4 l9_3511=l9_3510;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3511.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3512=l9_3511;
l9_3509=l9_3512;
}
else
{
float4 l9_3513=gl_FragCoord;
float2 l9_3514=l9_3513.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3515=l9_3514;
float2 l9_3516=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3517=1;
int l9_3518=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3518=0;
}
else
{
l9_3518=in.varStereoViewID;
}
int l9_3519=l9_3518;
int l9_3520=l9_3519;
float3 l9_3521=float3(l9_3515,0.0);
int l9_3522=l9_3517;
int l9_3523=l9_3520;
if (l9_3522==1)
{
l9_3521.y=((2.0*l9_3521.y)+float(l9_3523))-1.0;
}
float2 l9_3524=l9_3521.xy;
l9_3516=l9_3524;
}
else
{
l9_3516=l9_3515;
}
float2 l9_3525=l9_3516;
float2 l9_3526=l9_3525;
float2 l9_3527=l9_3526;
int l9_3528=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3529=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3529=0;
}
else
{
l9_3529=in.varStereoViewID;
}
int l9_3530=l9_3529;
l9_3528=1-l9_3530;
}
else
{
int l9_3531=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3531=0;
}
else
{
l9_3531=in.varStereoViewID;
}
int l9_3532=l9_3531;
l9_3528=l9_3532;
}
int l9_3533=l9_3528;
float2 l9_3534=l9_3527;
int l9_3535=l9_3533;
float2 l9_3536=l9_3534;
int l9_3537=l9_3535;
float l9_3538=0.0;
float4 l9_3539=float4(0.0);
float2 l9_3540=l9_3536;
int l9_3541=sc_ScreenTextureLayout_tmp;
int l9_3542=l9_3537;
float l9_3543=l9_3538;
float2 l9_3544=l9_3540;
int l9_3545=l9_3541;
int l9_3546=l9_3542;
float3 l9_3547=float3(0.0);
if (l9_3545==0)
{
l9_3547=float3(l9_3544,0.0);
}
else
{
if (l9_3545==1)
{
l9_3547=float3(l9_3544.x,(l9_3544.y*0.5)+(0.5-(float(l9_3546)*0.5)),0.0);
}
else
{
l9_3547=float3(l9_3544,float(l9_3546));
}
}
float3 l9_3548=l9_3547;
float3 l9_3549=l9_3548;
float2 l9_3550=l9_3549.xy;
float l9_3551=l9_3543;
float4 l9_3552=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3550,bias(l9_3551));
float4 l9_3553=l9_3552;
l9_3539=l9_3553;
float4 l9_3554=l9_3539;
float4 l9_3555=l9_3554;
float4 l9_3556=l9_3555;
l9_3509=l9_3556;
}
float4 l9_3557=l9_3509;
float4 l9_3558=l9_3557;
float3 l9_3559=l9_3558.xyz;
float3 l9_3560;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3560=float3(pow(l9_3559.x,2.2),pow(l9_3559.y,2.2),pow(l9_3559.z,2.2));
}
else
{
l9_3560=l9_3559*l9_3559;
}
float3 l9_3561=l9_3560;
float3 l9_3562=l9_3561;
l9_3508.transmitted=l9_3562*mix(float3(1.0),l9_3068.albedo,float3(l9_3068.opacity));
l9_3068.opacity=1.0;
}
bool l9_3563=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3563=true;
}
SurfaceProperties l9_3564=l9_3068;
LightingComponents l9_3565=l9_3508;
bool l9_3566=l9_3563;
float3 l9_3567=float3(0.0);
bool l9_3568=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_3568)
{
l9_3567=l9_3564.albedo*(l9_3565.directDiffuse+(l9_3565.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_3567=l9_3564.albedo*(l9_3565.directDiffuse+(l9_3565.indirectDiffuse*l9_3564.ao));
}
float3 l9_3569=l9_3565.directSpecular+(l9_3565.indirectSpecular*l9_3564.specularAo);
float3 l9_3570=l9_3564.emissive;
float3 l9_3571=l9_3565.transmitted;
if (l9_3566)
{
float l9_3572=l9_3564.opacity;
l9_3567*=srgbToLinear(l9_3572);
}
float3 l9_3573=((l9_3567+l9_3569)+l9_3570)+l9_3571;
float3 l9_3574=l9_3573;
float4 l9_3575=float4(l9_3574,l9_3068.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_3576=l9_3575.xyz;
float l9_3577=1.8;
float l9_3578=1.4;
float l9_3579=0.5;
float l9_3580=1.5;
float3 l9_3581=(l9_3576*((l9_3576*l9_3577)+float3(l9_3578)))/((l9_3576*((l9_3576*l9_3577)+float3(l9_3579)))+float3(l9_3580));
l9_3575=float4(l9_3581.x,l9_3581.y,l9_3581.z,l9_3575.w);
}
float3 l9_3582=l9_3575.xyz;
float l9_3583=l9_3582.x;
float l9_3584=l9_3582.y;
float l9_3585=l9_3582.z;
float3 l9_3586=float3(linearToSrgb(l9_3583),linearToSrgb(l9_3584),linearToSrgb(l9_3585));
l9_3575=float4(l9_3586.x,l9_3586.y,l9_3586.z,l9_3575.w);
float4 l9_3587=l9_3575;
float4 l9_3588=l9_3587;
l9_3588=fast::max(l9_3588,float4(0.0));
l9_3046=l9_3588;
l9_702=l9_3046;
l9_706=l9_702;
}
l9_699=l9_706;
param_4=l9_699;
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
float4 l9_3589=param_8;
float4 l9_3590=float4(0.0);
float4 l9_3591=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3592=out.FragColor0;
float4 l9_3593=l9_3592;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3593.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3594=l9_3593;
l9_3591=l9_3594;
}
else
{
float4 l9_3595=gl_FragCoord;
float2 l9_3596=l9_3595.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_3597=l9_3596;
float2 l9_3598=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_3599=1;
int l9_3600=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3600=0;
}
else
{
l9_3600=in.varStereoViewID;
}
int l9_3601=l9_3600;
int l9_3602=l9_3601;
float3 l9_3603=float3(l9_3597,0.0);
int l9_3604=l9_3599;
int l9_3605=l9_3602;
if (l9_3604==1)
{
l9_3603.y=((2.0*l9_3603.y)+float(l9_3605))-1.0;
}
float2 l9_3606=l9_3603.xy;
l9_3598=l9_3606;
}
else
{
l9_3598=l9_3597;
}
float2 l9_3607=l9_3598;
float2 l9_3608=l9_3607;
float2 l9_3609=l9_3608;
int l9_3610=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3611=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3611=0;
}
else
{
l9_3611=in.varStereoViewID;
}
int l9_3612=l9_3611;
l9_3610=1-l9_3612;
}
else
{
int l9_3613=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3613=0;
}
else
{
l9_3613=in.varStereoViewID;
}
int l9_3614=l9_3613;
l9_3610=l9_3614;
}
int l9_3615=l9_3610;
float2 l9_3616=l9_3609;
int l9_3617=l9_3615;
float2 l9_3618=l9_3616;
int l9_3619=l9_3617;
float l9_3620=0.0;
float4 l9_3621=float4(0.0);
float2 l9_3622=l9_3618;
int l9_3623=sc_ScreenTextureLayout_tmp;
int l9_3624=l9_3619;
float l9_3625=l9_3620;
float2 l9_3626=l9_3622;
int l9_3627=l9_3623;
int l9_3628=l9_3624;
float3 l9_3629=float3(0.0);
if (l9_3627==0)
{
l9_3629=float3(l9_3626,0.0);
}
else
{
if (l9_3627==1)
{
l9_3629=float3(l9_3626.x,(l9_3626.y*0.5)+(0.5-(float(l9_3628)*0.5)),0.0);
}
else
{
l9_3629=float3(l9_3626,float(l9_3628));
}
}
float3 l9_3630=l9_3629;
float3 l9_3631=l9_3630;
float2 l9_3632=l9_3631.xy;
float l9_3633=l9_3625;
float4 l9_3634=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_3632,bias(l9_3633));
float4 l9_3635=l9_3634;
l9_3621=l9_3635;
float4 l9_3636=l9_3621;
float4 l9_3637=l9_3636;
float4 l9_3638=l9_3637;
l9_3591=l9_3638;
}
float4 l9_3639=l9_3591;
float4 l9_3640=l9_3639;
float3 l9_3641=l9_3640.xyz;
float3 l9_3642=l9_3641;
float3 l9_3643=l9_3589.xyz;
float3 l9_3644=definedBlend(l9_3642,l9_3643,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_3590=float4(l9_3644.x,l9_3644.y,l9_3644.z,l9_3590.w);
float3 l9_3645=mix(l9_3641,l9_3590.xyz,float3(l9_3589.w));
l9_3590=float4(l9_3645.x,l9_3645.y,l9_3645.z,l9_3590.w);
l9_3590.w=1.0;
float4 l9_3646=l9_3590;
param_8=l9_3646;
}
else
{
float4 l9_3647=param_8;
float4 l9_3648=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3648=float4(mix(float3(1.0),l9_3647.xyz,float3(l9_3647.w)),l9_3647.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_3649=l9_3647.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3649=fast::clamp(l9_3649,0.0,1.0);
}
l9_3648=float4(l9_3647.xyz*l9_3649,l9_3649);
}
else
{
l9_3648=l9_3647;
}
}
float4 l9_3650=l9_3648;
param_8=l9_3650;
}
}
float4 l9_3651=param_8;
Output_Color0=l9_3651;
float4 l9_3652=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_3652=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_3652=float4(0.0);
}
float4 l9_3653=l9_3652;
float4 Cost=l9_3653;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/1000];
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
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%1000;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(1000*((param/1000)+1))-1;
int l9_0=param_1.Index1D;
int2 l9_1=int2(l9_0%512,l9_0/512);
param_1.Index2D=l9_1;
int l9_2=param_1.Index1D;
float l9_3=(float(l9_2)+0.5)/1000.0;
param_1.Coord1D=l9_3;
int2 l9_4=param_1.Index2D;
float2 l9_5=(float2(l9_4)+float2(0.5))/float2(512.0,2.0);
param_1.Coord2D=l9_5;
int l9_6=param_1.Index1D;
float l9_7=float(l9_6)/999.0;
param_1.Ratio1D=l9_7;
int l9_8=param_1.Index1DPerCopy;
float l9_9=float(l9_8)/999.0;
param_1.Ratio1DPerCopy=l9_9;
int2 l9_10=param_1.Index2D;
float2 l9_11=float2(l9_10)/float2(511.0,1.0);
param_1.Ratio2D=l9_11;
param_1.Seed=0.0;
float2 l9_12=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_13=dot(l9_12,float2(0.98253,0.72662002));
l9_13=sin(l9_13)*479.371;
l9_13=fract(l9_13);
l9_13=floor(l9_13*10000.0)*9.9999997e-05;
float l9_14=l9_13;
param_1.TimeShift=l9_14;
param_1.TimeShift=0.0;
param_1.SpawnOffset=0.0;
ssParticle l9_15=param_1;
l9_15.Seed=(l9_15.Ratio1D*0.97637898)+0.151235;
int2 l9_16=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_16)+float2(1.0))/float2(399.0);
param_1=l9_15;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float param_2=1.0;
ssGlobals param_3=Globals;
float l9_17=0.0;
float l9_18=float((*sc_set0.UserUniforms).isIdle!=0);
l9_17=l9_18;
param_2=l9_17;
if ((param_2*1.0)!=0.0)
{
float2 l9_19=float2(0.0);
l9_19=param_3.Surface_UVCoord0;
float2 l9_20=float2(0.0);
l9_20=l9_19*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_21=float2(0.0);
l9_21=l9_20-float2(1.0);
float l9_22=0.0;
l9_22=dot(l9_21,l9_21);
float l9_23=0.0;
l9_23=fast::clamp(l9_22+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_24=0.0;
l9_24=1.0-l9_23;
float l9_25=0.0;
float l9_26;
if (l9_24<=0.0)
{
l9_26=0.0;
}
else
{
l9_26=sqrt(l9_24);
}
l9_25=l9_26;
float3 l9_27=float3(0.0);
l9_27=float3(l9_21.x,l9_21.y,l9_27.z);
l9_27.z=l9_25;
float l9_28=0.0;
l9_28=distance(l9_19,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_29=0.0;
l9_29=float(l9_28<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_30=float3(0.0);
l9_30=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_27,float3(l9_29));
float3 l9_31=float3(0.0);
l9_31=l9_30;
float3 l9_32=l9_31;
float l9_33=(*sc_set0.UserUniforms).Port_Roughness_N026;
ssGlobals l9_34=param_3;
l9_34.BumpedNormal=float3x3(float3(l9_34.VertexTangent_WorldSpace),float3(l9_34.VertexBinormal_WorldSpace),float3(l9_34.VertexNormal_WorldSpace))*l9_32;
float3 l9_35=l9_34.PositionWS;
float3 l9_36=l9_34.BumpedNormal;
float l9_37=l9_33;
float3 l9_38=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_35);
if (dot(l9_38,l9_36)>=(-0.050000001))
{
uint3 l9_39=uint3(round((l9_35-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_39.x,l9_39.y,l9_39.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_40=l9_36;
float l9_41=dot(abs(l9_40),float3(1.0));
l9_40/=float3(l9_41);
float l9_42=fast::clamp(-l9_40.z,0.0,1.0);
float2 l9_43=l9_40.xy;
float l9_44;
if (l9_40.x>=0.0)
{
l9_44=l9_42;
}
else
{
l9_44=-l9_42;
}
l9_43.x+=l9_44;
float l9_45;
if (l9_40.y>=0.0)
{
l9_45=l9_42;
}
else
{
l9_45=-l9_42;
}
l9_43.y+=l9_45;
float2 l9_46=l9_43;
float2 l9_47=l9_46;
uint2 l9_48=uint2(as_type<uint>(half2(float2(l9_47.x,0.0))),as_type<uint>(half2(float2(l9_47.y,0.0))));
out.normal_and_more=uint4(l9_48.x,l9_48.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_49;
if (l9_37<0.0)
{
l9_49=1023u;
}
else
{
l9_49=uint(fast::clamp(l9_37,0.0,1.0)*1000.0);
}
uint l9_50=l9_49;
l9_50 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_50;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float l9_51=1.0;
ssGlobals l9_52=param_3;
float l9_53=0.0;
float l9_54=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_53=l9_54;
l9_51=l9_53;
if ((l9_51*1.0)!=0.0)
{
float2 l9_55=float2(0.0);
l9_55=l9_52.Surface_UVCoord0;
float2 l9_56=float2(0.0);
l9_56=l9_55*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_57=float2(0.0);
l9_57=l9_56-float2(1.0);
float l9_58=0.0;
l9_58=dot(l9_57,l9_57);
float l9_59=0.0;
l9_59=fast::clamp(l9_58+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_60=0.0;
l9_60=1.0-l9_59;
float l9_61=0.0;
float l9_62;
if (l9_60<=0.0)
{
l9_62=0.0;
}
else
{
l9_62=sqrt(l9_60);
}
l9_61=l9_62;
float3 l9_63=float3(0.0);
l9_63=float3(l9_57.x,l9_57.y,l9_63.z);
l9_63.z=l9_61;
float l9_64=0.0;
l9_64=distance(l9_55,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_65=0.0;
l9_65=float(l9_64<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_66=float3(0.0);
l9_66=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_63,float3(l9_65));
float3 l9_67=float3(0.0);
l9_67=l9_66;
float3 l9_68=l9_67;
float l9_69=(*sc_set0.UserUniforms).Port_Roughness_N026;
ssGlobals l9_70=l9_52;
l9_70.BumpedNormal=float3x3(float3(l9_70.VertexTangent_WorldSpace),float3(l9_70.VertexBinormal_WorldSpace),float3(l9_70.VertexNormal_WorldSpace))*l9_68;
float3 l9_71=l9_70.PositionWS;
float3 l9_72=l9_70.BumpedNormal;
float l9_73=l9_69;
float3 l9_74=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_71);
if (dot(l9_74,l9_72)>=(-0.050000001))
{
uint3 l9_75=uint3(round((l9_71-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_75.x,l9_75.y,l9_75.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_76=l9_72;
float l9_77=dot(abs(l9_76),float3(1.0));
l9_76/=float3(l9_77);
float l9_78=fast::clamp(-l9_76.z,0.0,1.0);
float2 l9_79=l9_76.xy;
float l9_80;
if (l9_76.x>=0.0)
{
l9_80=l9_78;
}
else
{
l9_80=-l9_78;
}
l9_79.x+=l9_80;
float l9_81;
if (l9_76.y>=0.0)
{
l9_81=l9_78;
}
else
{
l9_81=-l9_78;
}
l9_79.y+=l9_81;
float2 l9_82=l9_79;
float2 l9_83=l9_82;
uint2 l9_84=uint2(as_type<uint>(half2(float2(l9_83.x,0.0))),as_type<uint>(half2(float2(l9_83.y,0.0))));
out.normal_and_more=uint4(l9_84.x,l9_84.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_85;
if (l9_73<0.0)
{
l9_85=1023u;
}
else
{
l9_85=uint(fast::clamp(l9_73,0.0,1.0)*1000.0);
}
uint l9_86=l9_85;
l9_86 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_86;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float2 l9_87=float2(0.0);
l9_87=l9_52.Surface_UVCoord0;
float2 l9_88=float2(0.0);
l9_88=l9_87*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_89=float2(0.0);
l9_89=l9_88-float2(1.0);
float l9_90=0.0;
l9_90=dot(l9_89,l9_89);
float l9_91=0.0;
l9_91=fast::clamp(l9_90+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_92=0.0;
l9_92=1.0-l9_91;
float l9_93=0.0;
float l9_94;
if (l9_92<=0.0)
{
l9_94=0.0;
}
else
{
l9_94=sqrt(l9_92);
}
l9_93=l9_94;
float3 l9_95=float3(0.0);
l9_95=float3(l9_89.x,l9_89.y,l9_95.z);
l9_95.z=l9_93;
float l9_96=0.0;
l9_96=distance(l9_87,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_97=0.0;
l9_97=float(l9_96<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_98=float3(0.0);
l9_98=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_95,float3(l9_97));
float3 l9_99=float3(0.0);
l9_99=l9_98;
float3 l9_100=l9_99;
float l9_101=(*sc_set0.UserUniforms).Port_Roughness_N258;
ssGlobals l9_102=l9_52;
l9_102.BumpedNormal=float3x3(float3(l9_102.VertexTangent_WorldSpace),float3(l9_102.VertexBinormal_WorldSpace),float3(l9_102.VertexNormal_WorldSpace))*l9_100;
float3 l9_103=l9_102.PositionWS;
float3 l9_104=l9_102.BumpedNormal;
float l9_105=l9_101;
float3 l9_106=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_103);
if (dot(l9_106,l9_104)>=(-0.050000001))
{
uint3 l9_107=uint3(round((l9_103-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_107.x,l9_107.y,l9_107.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_108=l9_104;
float l9_109=dot(abs(l9_108),float3(1.0));
l9_108/=float3(l9_109);
float l9_110=fast::clamp(-l9_108.z,0.0,1.0);
float2 l9_111=l9_108.xy;
float l9_112;
if (l9_108.x>=0.0)
{
l9_112=l9_110;
}
else
{
l9_112=-l9_110;
}
l9_111.x+=l9_112;
float l9_113;
if (l9_108.y>=0.0)
{
l9_113=l9_110;
}
else
{
l9_113=-l9_110;
}
l9_111.y+=l9_113;
float2 l9_114=l9_111;
float2 l9_115=l9_114;
uint2 l9_116=uint2(as_type<uint>(half2(float2(l9_115.x,0.0))),as_type<uint>(half2(float2(l9_115.y,0.0))));
out.normal_and_more=uint4(l9_116.x,l9_116.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_117;
if (l9_105<0.0)
{
l9_117=1023u;
}
else
{
l9_117=uint(fast::clamp(l9_105,0.0,1.0)*1000.0);
}
uint l9_118=l9_117;
l9_118 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_118;
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
