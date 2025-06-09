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
//ubo int UserUniforms 0:43:7984 {
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
//float4 TintColor 7568
//float3x3 repelflipbookTexTransform 7632
//float4 repelflipbookTexUvMinMax 7680
//float4 repelflipbookTexBorderColor 7696
//float intensity 7712
//float Port_RangeMinA_N171 7716
//float Port_RangeMaxA_N171 7720
//float Port_RangeMinB_N171 7724
//float Port_RangeMaxB_N171 7728
//float2 Port_SpriteCount_N045 7744
//float Port_MaxFrames_N045 7752
//float Port_Rotation_N159 7756
//float2 Port_Center_N159 7760
//float Port_RangeMinA_N156 7768
//float Port_RangeMaxA_N156 7772
//float Port_RangeMinB_N156 7776
//float Port_RangeMaxB_N156 7780
//float Port_SecondOffset_N045 7784
//float3 Port_Input0_N038 7792
//float2 Port_Input1_N031 7808
//float Port_Input1_N246 7816
//float Port_Input2_N246 7820
//float2 Port_Input1_N035 7824
//float Port_Input1_N036 7832
//float3 Port_Emissive_N026 7840
//float Port_Metallic_N026 7856
//float Port_Roughness_N026 7860
//float3 Port_AO_N026 7872
//float3 Port_SpecularAO_N026 7888
//float2 Port_SpriteCount_N167 7904
//float Port_MaxFrames_N167 7912
//float Port_SecondOffset_N167 7916
//float3 Port_Emissive_N258 7920
//float Port_Metallic_N258 7936
//float Port_Roughness_N258 7940
//float3 Port_AO_N258 7952
//float3 Port_SpecularAO_N258 7968
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
float4 TintColor;
float4 repelflipbookTexSize;
float4 repelflipbookTexDims;
float4 repelflipbookTexView;
float3x3 repelflipbookTexTransform;
float4 repelflipbookTexUvMinMax;
float4 repelflipbookTexBorderColor;
float intensity;
float Port_RangeMinA_N171;
float Port_RangeMaxA_N171;
float Port_RangeMinB_N171;
float Port_RangeMaxB_N171;
float Port_Import_N155;
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
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*8.0;
ssParticle l9_19=param_1;
int l9_20=l9_0;
float l9_21;
if (UserUniforms.overrideTimeEnabled==1)
{
l9_21=UserUniforms.overrideTimeElapsed[l9_20];
}
else
{
l9_21=UserUniforms.sc_Time.x;
}
float l9_22=l9_21;
l9_19.Seed=(l9_19.Ratio1D*0.97637898)+0.151235;
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_1=l9_19;
gParticle=param_1;
int offsetPixelId=(UserUniforms.vfxOffsetInstancesRead+InstanceID)*4;
int param_2=offsetPixelId;
int param_3=UserUniforms.vfxTargetWidth;
int l9_24=param_2-((param_2/param_3)*param_3);
int2 Index2D=int2(l9_24,offsetPixelId/UserUniforms.vfxTargetWidth);
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
int l9_25=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_26=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_26=0;
}
else
{
l9_26=gl_InstanceIndex%2;
}
int l9_27=l9_26;
l9_25=1-l9_27;
}
else
{
int l9_28=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_28=0;
}
else
{
l9_28=gl_InstanceIndex%2;
}
int l9_29=l9_28;
l9_25=l9_29;
}
int l9_30=l9_25;
float2 l9_31=param_4;
int l9_32=l9_30;
float2 l9_33=l9_31;
int l9_34=l9_32;
float l9_35=0.0;
float4 l9_36=float4(0.0);
float2 l9_37=l9_33;
int l9_38=l9_34;
float l9_39=l9_35;
float4 l9_40=float4(0.0);
float2 l9_41=l9_37;
int l9_42=renderTarget0Layout_tmp;
int l9_43=l9_38;
float l9_44=l9_39;
float2 l9_45=l9_41;
int l9_46=l9_42;
int l9_47=l9_43;
float3 l9_48=float3(0.0);
if (l9_46==0)
{
l9_48=float3(l9_45,0.0);
}
else
{
if (l9_46==1)
{
l9_48=float3(l9_45.x,(l9_45.y*0.5)+(0.5-(float(l9_47)*0.5)),0.0);
}
else
{
l9_48=float3(l9_45,float(l9_47));
}
}
float3 l9_49=l9_48;
float3 l9_50=l9_49;
float2 l9_51=l9_50.xy;
float l9_52=l9_44;
float4 l9_53=renderTarget0.sample(renderTarget0SmpSC,l9_51,level(l9_52));
float4 l9_54=l9_53;
l9_40=l9_54;
float4 l9_55=l9_40;
l9_36=l9_55;
float4 l9_56=l9_36;
float4 l9_57=l9_56;
float4 l9_58=l9_57;
float4 renderTarget0Sample=l9_58;
float4 l9_59=renderTarget0Sample;
bool l9_60=dot(abs(l9_59),float4(1.0))<9.9999997e-06;
bool l9_61;
if (!l9_60)
{
int l9_62=gl_InstanceIndex;
l9_61=!(UserUniforms.vfxBatchEnable[l9_62/1600]!=0);
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
return false;
}
Scalar0=renderTarget0Sample.x;
Scalar1=renderTarget0Sample.y;
Scalar2=renderTarget0Sample.z;
Scalar3=renderTarget0Sample.w;
float2 param_5=uv;
int l9_63=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_64=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_64=0;
}
else
{
l9_64=gl_InstanceIndex%2;
}
int l9_65=l9_64;
l9_63=1-l9_65;
}
else
{
int l9_66=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_66=0;
}
else
{
l9_66=gl_InstanceIndex%2;
}
int l9_67=l9_66;
l9_63=l9_67;
}
int l9_68=l9_63;
float2 l9_69=param_5;
int l9_70=l9_68;
float2 l9_71=l9_69;
int l9_72=l9_70;
float l9_73=0.0;
float4 l9_74=float4(0.0);
float2 l9_75=l9_71;
int l9_76=l9_72;
float l9_77=l9_73;
float4 l9_78=float4(0.0);
float2 l9_79=l9_75;
int l9_80=renderTarget1Layout_tmp;
int l9_81=l9_76;
float l9_82=l9_77;
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
float4 l9_91=renderTarget1.sample(renderTarget1SmpSC,l9_89,level(l9_90));
float4 l9_92=l9_91;
l9_78=l9_92;
float4 l9_93=l9_78;
l9_74=l9_93;
float4 l9_94=l9_74;
float4 l9_95=l9_94;
float4 l9_96=l9_95;
float4 renderTarget1Sample=l9_96;
Scalar4=renderTarget1Sample.x;
Scalar5=renderTarget1Sample.y;
Scalar6=renderTarget1Sample.z;
Scalar7=renderTarget1Sample.w;
float2 param_6=uv;
int l9_97=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_98=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_98=0;
}
else
{
l9_98=gl_InstanceIndex%2;
}
int l9_99=l9_98;
l9_97=1-l9_99;
}
else
{
int l9_100=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_100=0;
}
else
{
l9_100=gl_InstanceIndex%2;
}
int l9_101=l9_100;
l9_97=l9_101;
}
int l9_102=l9_97;
float2 l9_103=param_6;
int l9_104=l9_102;
float2 l9_105=l9_103;
int l9_106=l9_104;
float l9_107=0.0;
float4 l9_108=float4(0.0);
float2 l9_109=l9_105;
int l9_110=l9_106;
float l9_111=l9_107;
float4 l9_112=float4(0.0);
float2 l9_113=l9_109;
int l9_114=renderTarget2Layout_tmp;
int l9_115=l9_110;
float l9_116=l9_111;
float2 l9_117=l9_113;
int l9_118=l9_114;
int l9_119=l9_115;
float3 l9_120=float3(0.0);
if (l9_118==0)
{
l9_120=float3(l9_117,0.0);
}
else
{
if (l9_118==1)
{
l9_120=float3(l9_117.x,(l9_117.y*0.5)+(0.5-(float(l9_119)*0.5)),0.0);
}
else
{
l9_120=float3(l9_117,float(l9_119));
}
}
float3 l9_121=l9_120;
float3 l9_122=l9_121;
float2 l9_123=l9_122.xy;
float l9_124=l9_116;
float4 l9_125=renderTarget2.sample(renderTarget2SmpSC,l9_123,level(l9_124));
float4 l9_126=l9_125;
l9_112=l9_126;
float4 l9_127=l9_112;
l9_108=l9_127;
float4 l9_128=l9_108;
float4 l9_129=l9_128;
float4 l9_130=l9_129;
float4 renderTarget2Sample=l9_130;
Scalar8=renderTarget2Sample.x;
Scalar9=renderTarget2Sample.y;
Scalar10=renderTarget2Sample.z;
Scalar11=renderTarget2Sample.w;
float2 param_7=uv;
int l9_131=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
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
l9_131=1-l9_133;
}
else
{
int l9_134=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_134=0;
}
else
{
l9_134=gl_InstanceIndex%2;
}
int l9_135=l9_134;
l9_131=l9_135;
}
int l9_136=l9_131;
float2 l9_137=param_7;
int l9_138=l9_136;
float2 l9_139=l9_137;
int l9_140=l9_138;
float l9_141=0.0;
float4 l9_142=float4(0.0);
float2 l9_143=l9_139;
int l9_144=l9_140;
float l9_145=l9_141;
float4 l9_146=float4(0.0);
float2 l9_147=l9_143;
int l9_148=renderTarget3Layout_tmp;
int l9_149=l9_144;
float l9_150=l9_145;
float2 l9_151=l9_147;
int l9_152=l9_148;
int l9_153=l9_149;
float3 l9_154=float3(0.0);
if (l9_152==0)
{
l9_154=float3(l9_151,0.0);
}
else
{
if (l9_152==1)
{
l9_154=float3(l9_151.x,(l9_151.y*0.5)+(0.5-(float(l9_153)*0.5)),0.0);
}
else
{
l9_154=float3(l9_151,float(l9_153));
}
}
float3 l9_155=l9_154;
float3 l9_156=l9_155;
float2 l9_157=l9_156.xy;
float l9_158=l9_150;
float4 l9_159=renderTarget3.sample(renderTarget3SmpSC,l9_157,level(l9_158));
float4 l9_160=l9_159;
l9_146=l9_160;
float4 l9_161=l9_146;
l9_142=l9_161;
float4 l9_162=l9_142;
float4 l9_163=l9_162;
float4 l9_164=l9_163;
float4 renderTarget3Sample=l9_164;
Scalar12=renderTarget3Sample.x;
Scalar13=renderTarget3Sample.y;
Scalar14=renderTarget3Sample.z;
Scalar15=renderTarget3Sample.w;
float4 param_8=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_9=-1000.0;
float param_10=1000.0;
float4 l9_165=param_8;
float l9_166=param_9;
float l9_167=param_10;
float l9_168=0.99998999;
float4 l9_169=l9_165;
#if (1)
{
l9_169=floor((l9_169*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_170=dot(l9_169,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_171=l9_170;
float l9_172=0.0;
float l9_173=l9_168;
float l9_174=l9_166;
float l9_175=l9_167;
float l9_176=l9_174+(((l9_171-l9_172)*(l9_175-l9_174))/(l9_173-l9_172));
float l9_177=l9_176;
float l9_178=l9_177;
gParticle.Position.x=l9_178;
float4 param_11=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_12=-1000.0;
float param_13=1000.0;
float4 l9_179=param_11;
float l9_180=param_12;
float l9_181=param_13;
float l9_182=0.99998999;
float4 l9_183=l9_179;
#if (1)
{
l9_183=floor((l9_183*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_184=dot(l9_183,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_185=l9_184;
float l9_186=0.0;
float l9_187=l9_182;
float l9_188=l9_180;
float l9_189=l9_181;
float l9_190=l9_188+(((l9_185-l9_186)*(l9_189-l9_188))/(l9_187-l9_186));
float l9_191=l9_190;
float l9_192=l9_191;
gParticle.Position.y=l9_192;
float4 param_14=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_15=-1000.0;
float param_16=1000.0;
float4 l9_193=param_14;
float l9_194=param_15;
float l9_195=param_16;
float l9_196=0.99998999;
float4 l9_197=l9_193;
#if (1)
{
l9_197=floor((l9_197*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_198=dot(l9_197,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_199=l9_198;
float l9_200=0.0;
float l9_201=l9_196;
float l9_202=l9_194;
float l9_203=l9_195;
float l9_204=l9_202+(((l9_199-l9_200)*(l9_203-l9_202))/(l9_201-l9_200));
float l9_205=l9_204;
float l9_206=l9_205;
gParticle.Position.z=l9_206;
float4 param_17=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_18=-1000.0;
float param_19=1000.0;
float4 l9_207=param_17;
float l9_208=param_18;
float l9_209=param_19;
float l9_210=0.99998999;
float4 l9_211=l9_207;
#if (1)
{
l9_211=floor((l9_211*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_212=dot(l9_211,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_213=l9_212;
float l9_214=0.0;
float l9_215=l9_210;
float l9_216=l9_208;
float l9_217=l9_209;
float l9_218=l9_216+(((l9_213-l9_214)*(l9_217-l9_216))/(l9_215-l9_214));
float l9_219=l9_218;
float l9_220=l9_219;
gParticle.Velocity.x=l9_220;
uv=Coord+(Offset*1.0);
float2 param_20=uv;
int l9_221=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_222=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_222=0;
}
else
{
l9_222=gl_InstanceIndex%2;
}
int l9_223=l9_222;
l9_221=1-l9_223;
}
else
{
int l9_224=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_224=0;
}
else
{
l9_224=gl_InstanceIndex%2;
}
int l9_225=l9_224;
l9_221=l9_225;
}
int l9_226=l9_221;
float2 l9_227=param_20;
int l9_228=l9_226;
float2 l9_229=l9_227;
int l9_230=l9_228;
float l9_231=0.0;
float4 l9_232=float4(0.0);
float2 l9_233=l9_229;
int l9_234=l9_230;
float l9_235=l9_231;
float4 l9_236=float4(0.0);
float2 l9_237=l9_233;
int l9_238=renderTarget0Layout_tmp;
int l9_239=l9_234;
float l9_240=l9_235;
float2 l9_241=l9_237;
int l9_242=l9_238;
int l9_243=l9_239;
float3 l9_244=float3(0.0);
if (l9_242==0)
{
l9_244=float3(l9_241,0.0);
}
else
{
if (l9_242==1)
{
l9_244=float3(l9_241.x,(l9_241.y*0.5)+(0.5-(float(l9_243)*0.5)),0.0);
}
else
{
l9_244=float3(l9_241,float(l9_243));
}
}
float3 l9_245=l9_244;
float3 l9_246=l9_245;
float2 l9_247=l9_246.xy;
float l9_248=l9_240;
float4 l9_249=renderTarget0.sample(renderTarget0SmpSC,l9_247,level(l9_248));
float4 l9_250=l9_249;
l9_236=l9_250;
float4 l9_251=l9_236;
l9_232=l9_251;
float4 l9_252=l9_232;
float4 l9_253=l9_252;
float4 l9_254=l9_253;
float4 renderTarget0Sample_1=l9_254;
Scalar0=renderTarget0Sample_1.x;
Scalar1=renderTarget0Sample_1.y;
Scalar2=renderTarget0Sample_1.z;
Scalar3=renderTarget0Sample_1.w;
float2 param_21=uv;
int l9_255=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_256=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_256=0;
}
else
{
l9_256=gl_InstanceIndex%2;
}
int l9_257=l9_256;
l9_255=1-l9_257;
}
else
{
int l9_258=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_258=0;
}
else
{
l9_258=gl_InstanceIndex%2;
}
int l9_259=l9_258;
l9_255=l9_259;
}
int l9_260=l9_255;
float2 l9_261=param_21;
int l9_262=l9_260;
float2 l9_263=l9_261;
int l9_264=l9_262;
float l9_265=0.0;
float4 l9_266=float4(0.0);
float2 l9_267=l9_263;
int l9_268=l9_264;
float l9_269=l9_265;
float4 l9_270=float4(0.0);
float2 l9_271=l9_267;
int l9_272=renderTarget1Layout_tmp;
int l9_273=l9_268;
float l9_274=l9_269;
float2 l9_275=l9_271;
int l9_276=l9_272;
int l9_277=l9_273;
float3 l9_278=float3(0.0);
if (l9_276==0)
{
l9_278=float3(l9_275,0.0);
}
else
{
if (l9_276==1)
{
l9_278=float3(l9_275.x,(l9_275.y*0.5)+(0.5-(float(l9_277)*0.5)),0.0);
}
else
{
l9_278=float3(l9_275,float(l9_277));
}
}
float3 l9_279=l9_278;
float3 l9_280=l9_279;
float2 l9_281=l9_280.xy;
float l9_282=l9_274;
float4 l9_283=renderTarget1.sample(renderTarget1SmpSC,l9_281,level(l9_282));
float4 l9_284=l9_283;
l9_270=l9_284;
float4 l9_285=l9_270;
l9_266=l9_285;
float4 l9_286=l9_266;
float4 l9_287=l9_286;
float4 l9_288=l9_287;
float4 renderTarget1Sample_1=l9_288;
Scalar4=renderTarget1Sample_1.x;
Scalar5=renderTarget1Sample_1.y;
Scalar6=renderTarget1Sample_1.z;
Scalar7=renderTarget1Sample_1.w;
float2 param_22=uv;
int l9_289=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_290=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_290=0;
}
else
{
l9_290=gl_InstanceIndex%2;
}
int l9_291=l9_290;
l9_289=1-l9_291;
}
else
{
int l9_292=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_292=0;
}
else
{
l9_292=gl_InstanceIndex%2;
}
int l9_293=l9_292;
l9_289=l9_293;
}
int l9_294=l9_289;
float2 l9_295=param_22;
int l9_296=l9_294;
float2 l9_297=l9_295;
int l9_298=l9_296;
float l9_299=0.0;
float4 l9_300=float4(0.0);
float2 l9_301=l9_297;
int l9_302=l9_298;
float l9_303=l9_299;
float4 l9_304=float4(0.0);
float2 l9_305=l9_301;
int l9_306=renderTarget2Layout_tmp;
int l9_307=l9_302;
float l9_308=l9_303;
float2 l9_309=l9_305;
int l9_310=l9_306;
int l9_311=l9_307;
float3 l9_312=float3(0.0);
if (l9_310==0)
{
l9_312=float3(l9_309,0.0);
}
else
{
if (l9_310==1)
{
l9_312=float3(l9_309.x,(l9_309.y*0.5)+(0.5-(float(l9_311)*0.5)),0.0);
}
else
{
l9_312=float3(l9_309,float(l9_311));
}
}
float3 l9_313=l9_312;
float3 l9_314=l9_313;
float2 l9_315=l9_314.xy;
float l9_316=l9_308;
float4 l9_317=renderTarget2.sample(renderTarget2SmpSC,l9_315,level(l9_316));
float4 l9_318=l9_317;
l9_304=l9_318;
float4 l9_319=l9_304;
l9_300=l9_319;
float4 l9_320=l9_300;
float4 l9_321=l9_320;
float4 l9_322=l9_321;
float4 renderTarget2Sample_1=l9_322;
Scalar8=renderTarget2Sample_1.x;
Scalar9=renderTarget2Sample_1.y;
Scalar10=renderTarget2Sample_1.z;
Scalar11=renderTarget2Sample_1.w;
float2 param_23=uv;
int l9_323=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_324=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_324=0;
}
else
{
l9_324=gl_InstanceIndex%2;
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
l9_326=gl_InstanceIndex%2;
}
int l9_327=l9_326;
l9_323=l9_327;
}
int l9_328=l9_323;
float2 l9_329=param_23;
int l9_330=l9_328;
float2 l9_331=l9_329;
int l9_332=l9_330;
float l9_333=0.0;
float4 l9_334=float4(0.0);
float2 l9_335=l9_331;
int l9_336=l9_332;
float l9_337=l9_333;
float4 l9_338=float4(0.0);
float2 l9_339=l9_335;
int l9_340=renderTarget3Layout_tmp;
int l9_341=l9_336;
float l9_342=l9_337;
float2 l9_343=l9_339;
int l9_344=l9_340;
int l9_345=l9_341;
float3 l9_346=float3(0.0);
if (l9_344==0)
{
l9_346=float3(l9_343,0.0);
}
else
{
if (l9_344==1)
{
l9_346=float3(l9_343.x,(l9_343.y*0.5)+(0.5-(float(l9_345)*0.5)),0.0);
}
else
{
l9_346=float3(l9_343,float(l9_345));
}
}
float3 l9_347=l9_346;
float3 l9_348=l9_347;
float2 l9_349=l9_348.xy;
float l9_350=l9_342;
float4 l9_351=renderTarget3.sample(renderTarget3SmpSC,l9_349,level(l9_350));
float4 l9_352=l9_351;
l9_338=l9_352;
float4 l9_353=l9_338;
l9_334=l9_353;
float4 l9_354=l9_334;
float4 l9_355=l9_354;
float4 l9_356=l9_355;
float4 renderTarget3Sample_1=l9_356;
Scalar12=renderTarget3Sample_1.x;
Scalar13=renderTarget3Sample_1.y;
Scalar14=renderTarget3Sample_1.z;
Scalar15=renderTarget3Sample_1.w;
float4 param_24=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_25=-1000.0;
float param_26=1000.0;
float4 l9_357=param_24;
float l9_358=param_25;
float l9_359=param_26;
float l9_360=0.99998999;
float4 l9_361=l9_357;
#if (1)
{
l9_361=floor((l9_361*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_362=dot(l9_361,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_363=l9_362;
float l9_364=0.0;
float l9_365=l9_360;
float l9_366=l9_358;
float l9_367=l9_359;
float l9_368=l9_366+(((l9_363-l9_364)*(l9_367-l9_366))/(l9_365-l9_364));
float l9_369=l9_368;
float l9_370=l9_369;
gParticle.Velocity.y=l9_370;
float4 param_27=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_28=-1000.0;
float param_29=1000.0;
float4 l9_371=param_27;
float l9_372=param_28;
float l9_373=param_29;
float l9_374=0.99998999;
float4 l9_375=l9_371;
#if (1)
{
l9_375=floor((l9_375*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_376=dot(l9_375,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_377=l9_376;
float l9_378=0.0;
float l9_379=l9_374;
float l9_380=l9_372;
float l9_381=l9_373;
float l9_382=l9_380+(((l9_377-l9_378)*(l9_381-l9_380))/(l9_379-l9_378));
float l9_383=l9_382;
float l9_384=l9_383;
gParticle.Velocity.z=l9_384;
float4 param_30=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_31=0.0;
float param_32=8.0;
float4 l9_385=param_30;
float l9_386=param_31;
float l9_387=param_32;
float l9_388=0.99998999;
float4 l9_389=l9_385;
#if (1)
{
l9_389=floor((l9_389*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_390=dot(l9_389,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_391=l9_390;
float l9_392=0.0;
float l9_393=l9_388;
float l9_394=l9_386;
float l9_395=l9_387;
float l9_396=l9_394+(((l9_391-l9_392)*(l9_395-l9_394))/(l9_393-l9_392));
float l9_397=l9_396;
float l9_398=l9_397;
gParticle.Life=l9_398;
float4 param_33=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_34=0.0;
float param_35=8.0;
float4 l9_399=param_33;
float l9_400=param_34;
float l9_401=param_35;
float l9_402=0.99998999;
float4 l9_403=l9_399;
#if (1)
{
l9_403=floor((l9_403*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_404=dot(l9_403,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_405=l9_404;
float l9_406=0.0;
float l9_407=l9_402;
float l9_408=l9_400;
float l9_409=l9_401;
float l9_410=l9_408+(((l9_405-l9_406)*(l9_409-l9_408))/(l9_407-l9_406));
float l9_411=l9_410;
float l9_412=l9_411;
gParticle.Age=l9_412;
uv=Coord+(Offset*2.0);
float2 param_36=uv;
int l9_413=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_414=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_414=0;
}
else
{
l9_414=gl_InstanceIndex%2;
}
int l9_415=l9_414;
l9_413=1-l9_415;
}
else
{
int l9_416=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_416=0;
}
else
{
l9_416=gl_InstanceIndex%2;
}
int l9_417=l9_416;
l9_413=l9_417;
}
int l9_418=l9_413;
float2 l9_419=param_36;
int l9_420=l9_418;
float2 l9_421=l9_419;
int l9_422=l9_420;
float l9_423=0.0;
float4 l9_424=float4(0.0);
float2 l9_425=l9_421;
int l9_426=l9_422;
float l9_427=l9_423;
float4 l9_428=float4(0.0);
float2 l9_429=l9_425;
int l9_430=renderTarget0Layout_tmp;
int l9_431=l9_426;
float l9_432=l9_427;
float2 l9_433=l9_429;
int l9_434=l9_430;
int l9_435=l9_431;
float3 l9_436=float3(0.0);
if (l9_434==0)
{
l9_436=float3(l9_433,0.0);
}
else
{
if (l9_434==1)
{
l9_436=float3(l9_433.x,(l9_433.y*0.5)+(0.5-(float(l9_435)*0.5)),0.0);
}
else
{
l9_436=float3(l9_433,float(l9_435));
}
}
float3 l9_437=l9_436;
float3 l9_438=l9_437;
float2 l9_439=l9_438.xy;
float l9_440=l9_432;
float4 l9_441=renderTarget0.sample(renderTarget0SmpSC,l9_439,level(l9_440));
float4 l9_442=l9_441;
l9_428=l9_442;
float4 l9_443=l9_428;
l9_424=l9_443;
float4 l9_444=l9_424;
float4 l9_445=l9_444;
float4 l9_446=l9_445;
float4 renderTarget0Sample_2=l9_446;
Scalar0=renderTarget0Sample_2.x;
Scalar1=renderTarget0Sample_2.y;
Scalar2=renderTarget0Sample_2.z;
Scalar3=renderTarget0Sample_2.w;
float2 param_37=uv;
int l9_447=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_448=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_448=0;
}
else
{
l9_448=gl_InstanceIndex%2;
}
int l9_449=l9_448;
l9_447=1-l9_449;
}
else
{
int l9_450=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_450=0;
}
else
{
l9_450=gl_InstanceIndex%2;
}
int l9_451=l9_450;
l9_447=l9_451;
}
int l9_452=l9_447;
float2 l9_453=param_37;
int l9_454=l9_452;
float2 l9_455=l9_453;
int l9_456=l9_454;
float l9_457=0.0;
float4 l9_458=float4(0.0);
float2 l9_459=l9_455;
int l9_460=l9_456;
float l9_461=l9_457;
float4 l9_462=float4(0.0);
float2 l9_463=l9_459;
int l9_464=renderTarget1Layout_tmp;
int l9_465=l9_460;
float l9_466=l9_461;
float2 l9_467=l9_463;
int l9_468=l9_464;
int l9_469=l9_465;
float3 l9_470=float3(0.0);
if (l9_468==0)
{
l9_470=float3(l9_467,0.0);
}
else
{
if (l9_468==1)
{
l9_470=float3(l9_467.x,(l9_467.y*0.5)+(0.5-(float(l9_469)*0.5)),0.0);
}
else
{
l9_470=float3(l9_467,float(l9_469));
}
}
float3 l9_471=l9_470;
float3 l9_472=l9_471;
float2 l9_473=l9_472.xy;
float l9_474=l9_466;
float4 l9_475=renderTarget1.sample(renderTarget1SmpSC,l9_473,level(l9_474));
float4 l9_476=l9_475;
l9_462=l9_476;
float4 l9_477=l9_462;
l9_458=l9_477;
float4 l9_478=l9_458;
float4 l9_479=l9_478;
float4 l9_480=l9_479;
float4 renderTarget1Sample_2=l9_480;
Scalar4=renderTarget1Sample_2.x;
Scalar5=renderTarget1Sample_2.y;
Scalar6=renderTarget1Sample_2.z;
Scalar7=renderTarget1Sample_2.w;
float2 param_38=uv;
int l9_481=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_482=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_482=0;
}
else
{
l9_482=gl_InstanceIndex%2;
}
int l9_483=l9_482;
l9_481=1-l9_483;
}
else
{
int l9_484=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_484=0;
}
else
{
l9_484=gl_InstanceIndex%2;
}
int l9_485=l9_484;
l9_481=l9_485;
}
int l9_486=l9_481;
float2 l9_487=param_38;
int l9_488=l9_486;
float2 l9_489=l9_487;
int l9_490=l9_488;
float l9_491=0.0;
float4 l9_492=float4(0.0);
float2 l9_493=l9_489;
int l9_494=l9_490;
float l9_495=l9_491;
float4 l9_496=float4(0.0);
float2 l9_497=l9_493;
int l9_498=renderTarget2Layout_tmp;
int l9_499=l9_494;
float l9_500=l9_495;
float2 l9_501=l9_497;
int l9_502=l9_498;
int l9_503=l9_499;
float3 l9_504=float3(0.0);
if (l9_502==0)
{
l9_504=float3(l9_501,0.0);
}
else
{
if (l9_502==1)
{
l9_504=float3(l9_501.x,(l9_501.y*0.5)+(0.5-(float(l9_503)*0.5)),0.0);
}
else
{
l9_504=float3(l9_501,float(l9_503));
}
}
float3 l9_505=l9_504;
float3 l9_506=l9_505;
float2 l9_507=l9_506.xy;
float l9_508=l9_500;
float4 l9_509=renderTarget2.sample(renderTarget2SmpSC,l9_507,level(l9_508));
float4 l9_510=l9_509;
l9_496=l9_510;
float4 l9_511=l9_496;
l9_492=l9_511;
float4 l9_512=l9_492;
float4 l9_513=l9_512;
float4 l9_514=l9_513;
float4 renderTarget2Sample_2=l9_514;
Scalar8=renderTarget2Sample_2.x;
Scalar9=renderTarget2Sample_2.y;
Scalar10=renderTarget2Sample_2.z;
Scalar11=renderTarget2Sample_2.w;
float2 param_39=uv;
int l9_515=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_516=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_516=0;
}
else
{
l9_516=gl_InstanceIndex%2;
}
int l9_517=l9_516;
l9_515=1-l9_517;
}
else
{
int l9_518=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_518=0;
}
else
{
l9_518=gl_InstanceIndex%2;
}
int l9_519=l9_518;
l9_515=l9_519;
}
int l9_520=l9_515;
float2 l9_521=param_39;
int l9_522=l9_520;
float2 l9_523=l9_521;
int l9_524=l9_522;
float l9_525=0.0;
float4 l9_526=float4(0.0);
float2 l9_527=l9_523;
int l9_528=l9_524;
float l9_529=l9_525;
float4 l9_530=float4(0.0);
float2 l9_531=l9_527;
int l9_532=renderTarget3Layout_tmp;
int l9_533=l9_528;
float l9_534=l9_529;
float2 l9_535=l9_531;
int l9_536=l9_532;
int l9_537=l9_533;
float3 l9_538=float3(0.0);
if (l9_536==0)
{
l9_538=float3(l9_535,0.0);
}
else
{
if (l9_536==1)
{
l9_538=float3(l9_535.x,(l9_535.y*0.5)+(0.5-(float(l9_537)*0.5)),0.0);
}
else
{
l9_538=float3(l9_535,float(l9_537));
}
}
float3 l9_539=l9_538;
float3 l9_540=l9_539;
float2 l9_541=l9_540.xy;
float l9_542=l9_534;
float4 l9_543=renderTarget3.sample(renderTarget3SmpSC,l9_541,level(l9_542));
float4 l9_544=l9_543;
l9_530=l9_544;
float4 l9_545=l9_530;
l9_526=l9_545;
float4 l9_546=l9_526;
float4 l9_547=l9_546;
float4 l9_548=l9_547;
float4 renderTarget3Sample_2=l9_548;
Scalar12=renderTarget3Sample_2.x;
Scalar13=renderTarget3Sample_2.y;
Scalar14=renderTarget3Sample_2.z;
Scalar15=renderTarget3Sample_2.w;
float4 param_40=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_41=0.0;
float param_42=100.0;
float4 l9_549=param_40;
float l9_550=param_41;
float l9_551=param_42;
float l9_552=0.99998999;
float4 l9_553=l9_549;
#if (1)
{
l9_553=floor((l9_553*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_554=dot(l9_553,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_555=l9_554;
float l9_556=0.0;
float l9_557=l9_552;
float l9_558=l9_550;
float l9_559=l9_551;
float l9_560=l9_558+(((l9_555-l9_556)*(l9_559-l9_558))/(l9_557-l9_556));
float l9_561=l9_560;
float l9_562=l9_561;
gParticle.Size=l9_562;
float4 param_43=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_44=0.0;
float param_45=1.00001;
float4 l9_563=param_43;
float l9_564=param_44;
float l9_565=param_45;
float l9_566=0.99998999;
float4 l9_567=l9_563;
#if (1)
{
l9_567=floor((l9_567*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_568=dot(l9_567,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_569=l9_568;
float l9_570=0.0;
float l9_571=l9_566;
float l9_572=l9_564;
float l9_573=l9_565;
float l9_574=l9_572+(((l9_569-l9_570)*(l9_573-l9_572))/(l9_571-l9_570));
float l9_575=l9_574;
float l9_576=l9_575;
gParticle.Color.x=l9_576;
float4 param_46=float4(Scalar8,Scalar9,Scalar10,Scalar11);
float param_47=0.0;
float param_48=1.00001;
float4 l9_577=param_46;
float l9_578=param_47;
float l9_579=param_48;
float l9_580=0.99998999;
float4 l9_581=l9_577;
#if (1)
{
l9_581=floor((l9_581*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_582=dot(l9_581,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_583=l9_582;
float l9_584=0.0;
float l9_585=l9_580;
float l9_586=l9_578;
float l9_587=l9_579;
float l9_588=l9_586+(((l9_583-l9_584)*(l9_587-l9_586))/(l9_585-l9_584));
float l9_589=l9_588;
float l9_590=l9_589;
gParticle.Color.y=l9_590;
float4 param_49=float4(Scalar12,Scalar13,Scalar14,Scalar15);
float param_50=0.0;
float param_51=1.00001;
float4 l9_591=param_49;
float l9_592=param_50;
float l9_593=param_51;
float l9_594=0.99998999;
float4 l9_595=l9_591;
#if (1)
{
l9_595=floor((l9_595*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_596=dot(l9_595,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_597=l9_596;
float l9_598=0.0;
float l9_599=l9_594;
float l9_600=l9_592;
float l9_601=l9_593;
float l9_602=l9_600+(((l9_597-l9_598)*(l9_601-l9_600))/(l9_599-l9_598));
float l9_603=l9_602;
float l9_604=l9_603;
gParticle.Color.z=l9_604;
uv=Coord+(Offset*3.0);
float2 param_52=uv;
int l9_605=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_606=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_606=0;
}
else
{
l9_606=gl_InstanceIndex%2;
}
int l9_607=l9_606;
l9_605=1-l9_607;
}
else
{
int l9_608=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_608=0;
}
else
{
l9_608=gl_InstanceIndex%2;
}
int l9_609=l9_608;
l9_605=l9_609;
}
int l9_610=l9_605;
float2 l9_611=param_52;
int l9_612=l9_610;
float2 l9_613=l9_611;
int l9_614=l9_612;
float l9_615=0.0;
float4 l9_616=float4(0.0);
float2 l9_617=l9_613;
int l9_618=l9_614;
float l9_619=l9_615;
float4 l9_620=float4(0.0);
float2 l9_621=l9_617;
int l9_622=renderTarget0Layout_tmp;
int l9_623=l9_618;
float l9_624=l9_619;
float2 l9_625=l9_621;
int l9_626=l9_622;
int l9_627=l9_623;
float3 l9_628=float3(0.0);
if (l9_626==0)
{
l9_628=float3(l9_625,0.0);
}
else
{
if (l9_626==1)
{
l9_628=float3(l9_625.x,(l9_625.y*0.5)+(0.5-(float(l9_627)*0.5)),0.0);
}
else
{
l9_628=float3(l9_625,float(l9_627));
}
}
float3 l9_629=l9_628;
float3 l9_630=l9_629;
float2 l9_631=l9_630.xy;
float l9_632=l9_624;
float4 l9_633=renderTarget0.sample(renderTarget0SmpSC,l9_631,level(l9_632));
float4 l9_634=l9_633;
l9_620=l9_634;
float4 l9_635=l9_620;
l9_616=l9_635;
float4 l9_636=l9_616;
float4 l9_637=l9_636;
float4 l9_638=l9_637;
float4 renderTarget0Sample_3=l9_638;
Scalar0=renderTarget0Sample_3.x;
Scalar1=renderTarget0Sample_3.y;
Scalar2=renderTarget0Sample_3.z;
Scalar3=renderTarget0Sample_3.w;
float2 param_53=uv;
int l9_639=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_640=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_640=0;
}
else
{
l9_640=gl_InstanceIndex%2;
}
int l9_641=l9_640;
l9_639=1-l9_641;
}
else
{
int l9_642=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_642=0;
}
else
{
l9_642=gl_InstanceIndex%2;
}
int l9_643=l9_642;
l9_639=l9_643;
}
int l9_644=l9_639;
float2 l9_645=param_53;
int l9_646=l9_644;
float2 l9_647=l9_645;
int l9_648=l9_646;
float l9_649=0.0;
float4 l9_650=float4(0.0);
float2 l9_651=l9_647;
int l9_652=l9_648;
float l9_653=l9_649;
float4 l9_654=float4(0.0);
float2 l9_655=l9_651;
int l9_656=renderTarget1Layout_tmp;
int l9_657=l9_652;
float l9_658=l9_653;
float2 l9_659=l9_655;
int l9_660=l9_656;
int l9_661=l9_657;
float3 l9_662=float3(0.0);
if (l9_660==0)
{
l9_662=float3(l9_659,0.0);
}
else
{
if (l9_660==1)
{
l9_662=float3(l9_659.x,(l9_659.y*0.5)+(0.5-(float(l9_661)*0.5)),0.0);
}
else
{
l9_662=float3(l9_659,float(l9_661));
}
}
float3 l9_663=l9_662;
float3 l9_664=l9_663;
float2 l9_665=l9_664.xy;
float l9_666=l9_658;
float4 l9_667=renderTarget1.sample(renderTarget1SmpSC,l9_665,level(l9_666));
float4 l9_668=l9_667;
l9_654=l9_668;
float4 l9_669=l9_654;
l9_650=l9_669;
float4 l9_670=l9_650;
float4 l9_671=l9_670;
float4 l9_672=l9_671;
float4 renderTarget1Sample_3=l9_672;
Scalar4=renderTarget1Sample_3.x;
Scalar5=renderTarget1Sample_3.y;
Scalar6=renderTarget1Sample_3.z;
Scalar7=renderTarget1Sample_3.w;
float2 param_54=uv;
int l9_673=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_674=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_674=0;
}
else
{
l9_674=gl_InstanceIndex%2;
}
int l9_675=l9_674;
l9_673=1-l9_675;
}
else
{
int l9_676=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_676=0;
}
else
{
l9_676=gl_InstanceIndex%2;
}
int l9_677=l9_676;
l9_673=l9_677;
}
int l9_678=l9_673;
float2 l9_679=param_54;
int l9_680=l9_678;
float2 l9_681=l9_679;
int l9_682=l9_680;
float l9_683=0.0;
float4 l9_684=float4(0.0);
float2 l9_685=l9_681;
int l9_686=l9_682;
float l9_687=l9_683;
float4 l9_688=float4(0.0);
float2 l9_689=l9_685;
int l9_690=renderTarget2Layout_tmp;
int l9_691=l9_686;
float l9_692=l9_687;
float2 l9_693=l9_689;
int l9_694=l9_690;
int l9_695=l9_691;
float3 l9_696=float3(0.0);
if (l9_694==0)
{
l9_696=float3(l9_693,0.0);
}
else
{
if (l9_694==1)
{
l9_696=float3(l9_693.x,(l9_693.y*0.5)+(0.5-(float(l9_695)*0.5)),0.0);
}
else
{
l9_696=float3(l9_693,float(l9_695));
}
}
float3 l9_697=l9_696;
float3 l9_698=l9_697;
float2 l9_699=l9_698.xy;
float l9_700=l9_692;
float4 l9_701=renderTarget2.sample(renderTarget2SmpSC,l9_699,level(l9_700));
float4 l9_702=l9_701;
l9_688=l9_702;
float4 l9_703=l9_688;
l9_684=l9_703;
float4 l9_704=l9_684;
float4 l9_705=l9_704;
float4 l9_706=l9_705;
float4 renderTarget2Sample_3=l9_706;
Scalar8=renderTarget2Sample_3.x;
Scalar9=renderTarget2Sample_3.y;
Scalar10=renderTarget2Sample_3.z;
Scalar11=renderTarget2Sample_3.w;
float2 param_55=uv;
int l9_707=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_708=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_708=0;
}
else
{
l9_708=gl_InstanceIndex%2;
}
int l9_709=l9_708;
l9_707=1-l9_709;
}
else
{
int l9_710=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_710=0;
}
else
{
l9_710=gl_InstanceIndex%2;
}
int l9_711=l9_710;
l9_707=l9_711;
}
int l9_712=l9_707;
float2 l9_713=param_55;
int l9_714=l9_712;
float2 l9_715=l9_713;
int l9_716=l9_714;
float l9_717=0.0;
float4 l9_718=float4(0.0);
float2 l9_719=l9_715;
int l9_720=l9_716;
float l9_721=l9_717;
float4 l9_722=float4(0.0);
float2 l9_723=l9_719;
int l9_724=renderTarget3Layout_tmp;
int l9_725=l9_720;
float l9_726=l9_721;
float2 l9_727=l9_723;
int l9_728=l9_724;
int l9_729=l9_725;
float3 l9_730=float3(0.0);
if (l9_728==0)
{
l9_730=float3(l9_727,0.0);
}
else
{
if (l9_728==1)
{
l9_730=float3(l9_727.x,(l9_727.y*0.5)+(0.5-(float(l9_729)*0.5)),0.0);
}
else
{
l9_730=float3(l9_727,float(l9_729));
}
}
float3 l9_731=l9_730;
float3 l9_732=l9_731;
float2 l9_733=l9_732.xy;
float l9_734=l9_726;
float4 l9_735=renderTarget3.sample(renderTarget3SmpSC,l9_733,level(l9_734));
float4 l9_736=l9_735;
l9_722=l9_736;
float4 l9_737=l9_722;
l9_718=l9_737;
float4 l9_738=l9_718;
float4 l9_739=l9_738;
float4 l9_740=l9_739;
float4 renderTarget3Sample_3=l9_740;
Scalar12=renderTarget3Sample_3.x;
Scalar13=renderTarget3Sample_3.y;
Scalar14=renderTarget3Sample_3.z;
Scalar15=renderTarget3Sample_3.w;
float4 param_56=float4(Scalar0,Scalar1,Scalar2,Scalar3);
float param_57=0.0;
float param_58=1.00001;
float4 l9_741=param_56;
float l9_742=param_57;
float l9_743=param_58;
float l9_744=0.99998999;
float4 l9_745=l9_741;
#if (1)
{
l9_745=floor((l9_745*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_746=dot(l9_745,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_747=l9_746;
float l9_748=0.0;
float l9_749=l9_744;
float l9_750=l9_742;
float l9_751=l9_743;
float l9_752=l9_750+(((l9_747-l9_748)*(l9_751-l9_750))/(l9_749-l9_748));
float l9_753=l9_752;
float l9_754=l9_753;
gParticle.Color.w=l9_754;
float4 param_59=float4(Scalar4,Scalar5,Scalar6,Scalar7);
float param_60=0.0;
float param_61=1000.0;
float4 l9_755=param_59;
float l9_756=param_60;
float l9_757=param_61;
float l9_758=0.99998999;
float4 l9_759=l9_755;
#if (1)
{
l9_759=floor((l9_759*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_760=dot(l9_759,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_761=l9_760;
float l9_762=0.0;
float l9_763=l9_758;
float l9_764=l9_756;
float l9_765=l9_757;
float l9_766=l9_764+(((l9_761-l9_762)*(l9_765-l9_764))/(l9_763-l9_762));
float l9_767=l9_766;
float l9_768=l9_767;
gParticle.Mass=l9_768;
float2 param_62=float2(Scalar8,Scalar9);
float param_63=-1.0;
float param_64=1.0;
float2 l9_769=param_62;
float l9_770=param_63;
float l9_771=param_64;
float l9_772=0.99998999;
float2 l9_773=l9_769;
#if (1)
{
l9_773=floor((l9_773*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_774=dot(l9_773,float2(1.0,0.0039215689));
float l9_775=l9_774;
float l9_776=0.0;
float l9_777=l9_772;
float l9_778=l9_770;
float l9_779=l9_771;
float l9_780=l9_778+(((l9_775-l9_776)*(l9_779-l9_778))/(l9_777-l9_776));
float l9_781=l9_780;
float l9_782=l9_781;
gParticle.Quaternion.x=l9_782;
float2 param_65=float2(Scalar10,Scalar11);
float param_66=-1.0;
float param_67=1.0;
float2 l9_783=param_65;
float l9_784=param_66;
float l9_785=param_67;
float l9_786=0.99998999;
float2 l9_787=l9_783;
#if (1)
{
l9_787=floor((l9_787*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_788=dot(l9_787,float2(1.0,0.0039215689));
float l9_789=l9_788;
float l9_790=0.0;
float l9_791=l9_786;
float l9_792=l9_784;
float l9_793=l9_785;
float l9_794=l9_792+(((l9_789-l9_790)*(l9_793-l9_792))/(l9_791-l9_790));
float l9_795=l9_794;
float l9_796=l9_795;
gParticle.Quaternion.y=l9_796;
float2 param_68=float2(Scalar12,Scalar13);
float param_69=-1.0;
float param_70=1.0;
float2 l9_797=param_68;
float l9_798=param_69;
float l9_799=param_70;
float l9_800=0.99998999;
float2 l9_801=l9_797;
#if (1)
{
l9_801=floor((l9_801*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_802=dot(l9_801,float2(1.0,0.0039215689));
float l9_803=l9_802;
float l9_804=0.0;
float l9_805=l9_800;
float l9_806=l9_798;
float l9_807=l9_799;
float l9_808=l9_806+(((l9_803-l9_804)*(l9_807-l9_806))/(l9_805-l9_804));
float l9_809=l9_808;
float l9_810=l9_809;
gParticle.Quaternion.z=l9_810;
float2 param_71=float2(Scalar14,Scalar15);
float param_72=-1.0;
float param_73=1.0;
float2 l9_811=param_71;
float l9_812=param_72;
float l9_813=param_73;
float l9_814=0.99998999;
float2 l9_815=l9_811;
#if (1)
{
l9_815=floor((l9_815*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_816=dot(l9_815,float2(1.0,0.0039215689));
float l9_817=l9_816;
float l9_818=0.0;
float l9_819=l9_814;
float l9_820=l9_812;
float l9_821=l9_813;
float l9_822=l9_820+(((l9_817-l9_818)*(l9_821-l9_820))/(l9_819-l9_818));
float l9_823=l9_822;
float l9_824=l9_823;
gParticle.Quaternion.w=l9_824;
float4 param_74=gParticle.Quaternion;
param_74=normalize(param_74.yzwx);
float l9_825=param_74.x*param_74.x;
float l9_826=param_74.y*param_74.y;
float l9_827=param_74.z*param_74.z;
float l9_828=param_74.x*param_74.z;
float l9_829=param_74.x*param_74.y;
float l9_830=param_74.y*param_74.z;
float l9_831=param_74.w*param_74.x;
float l9_832=param_74.w*param_74.y;
float l9_833=param_74.w*param_74.z;
float3x3 l9_834=float3x3(float3(1.0-(2.0*(l9_826+l9_827)),2.0*(l9_829+l9_833),2.0*(l9_828-l9_832)),float3(2.0*(l9_829-l9_833),1.0-(2.0*(l9_825+l9_827)),2.0*(l9_830+l9_831)),float3(2.0*(l9_828+l9_832),2.0*(l9_830-l9_831),1.0-(2.0*(l9_825+l9_826))));
gParticle.Matrix=l9_834;
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
int N175_Alignment=0;
float N175_VelocityStretchAmount=0.0;
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
float Value_N150=0.0;
Value_N150=1.0;
float Output_N169=0.0;
float param_4=(*sc_set0.UserUniforms).velocityStretch;
Output_N169=param_4;
float ValueOut_N171=0.0;
ValueOut_N171=(((Output_N169-(*sc_set0.UserUniforms).Port_RangeMinA_N171)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N171-(*sc_set0.UserUniforms).Port_RangeMinA_N171)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N171-(*sc_set0.UserUniforms).Port_RangeMinB_N171))+(*sc_set0.UserUniforms).Port_RangeMinB_N171;
float Value_N155=0.0;
Value_N155=ValueOut_N171;
float param_5=Value_N150;
float param_6=Value_N155;
ssGlobals param_7=Globals;
ssGlobals tempGlobals=param_7;
N175_Alignment=int(param_5);
N175_VelocityStretchAmount=param_6;
float l9_26=0.029999999;
float3 l9_27=gParticle.Velocity;
float l9_28=length(l9_27);
float l9_29=fast::max(l9_28*N175_VelocityStretchAmount,1.0);
float3 l9_30=float3(0.0,1.0,0.0);
float3 l9_31=l9_30;
float3 l9_32=gParticle.Velocity;
float3 l9_33=normalize(l9_32);
if (l9_28<l9_26)
{
l9_33=float3(0.0,0.0,1.0);
}
if (N175_Alignment>0)
{
l9_31=l9_33;
l9_30=float3(0.0,1.0,0.0);
l9_33=normalize(cross(l9_30,l9_31));
}
float3 l9_34=normalize(cross(l9_33,l9_31));
float3 l9_35=normalize(cross(l9_34,l9_33));
float2 l9_36=tempGlobals.Surface_UVCoord0;
float2 l9_37=l9_36-float2(0.5);
float4x4 l9_38=float4x4(float4(gParticle.Matrix[0].x,gParticle.Matrix[0].y,gParticle.Matrix[0].z,0.0),float4(gParticle.Matrix[1].x,gParticle.Matrix[1].y,gParticle.Matrix[1].z,0.0),float4(gParticle.Matrix[2].x,gParticle.Matrix[2].y,gParticle.Matrix[2].z,0.0),float4(0.0,0.0,0.0,1.0));
l9_37=(l9_38*float4(l9_37,0.0,1.0)).xy;
float3 l9_39=gParticle.Position;
float3 l9_40=l9_39;
float l9_41=gParticle.Size;
l9_40+=((-l9_34)*(l9_41*l9_37.x));
float l9_42=gParticle.Size;
l9_40+=(l9_35*((l9_42*l9_37.y)*l9_29));
float3 l9_43=l9_40;
out.varPos=l9_43;
float3 l9_44=l9_35;
out.varTangent=float4(l9_44.x,l9_44.y,l9_44.z,out.varTangent.w);
float3 l9_45=l9_33;
out.varNormal=l9_45;
int l9_46=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_46=0;
}
else
{
l9_46=gl_InstanceIndex%2;
}
int l9_47=l9_46;
float4 clipPosition=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_47]*float4(out.varPos,1.0);
float4 param_8=clipPosition;
if (sc_DepthBufferMode_tmp==1)
{
int l9_48=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_48=0;
}
else
{
l9_48=gl_InstanceIndex%2;
}
int l9_49=l9_48;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_49][2].w!=0.0)
{
float l9_50=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
param_8.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+param_8.w))*l9_50)-1.0)*param_8.w;
}
}
float4 l9_51=param_8;
clipPosition=l9_51;
float4 param_9=clipPosition;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_9.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_52=param_9;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_53=dot(l9_52,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_54=l9_53;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_54;
}
}
float4 l9_55=float4(param_9.x,-param_9.y,(param_9.z*0.5)+(param_9.w*0.5),param_9.w);
out.gl_Position=l9_55;
int l9_56=gl_InstanceIndex;
out.Interp_Particle_Index=l9_56;
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
float4 TintColor;
float4 repelflipbookTexSize;
float4 repelflipbookTexDims;
float4 repelflipbookTexView;
float3x3 repelflipbookTexTransform;
float4 repelflipbookTexUvMinMax;
float4 repelflipbookTexBorderColor;
float intensity;
float Port_RangeMinA_N171;
float Port_RangeMaxA_N171;
float Port_RangeMinB_N171;
float Port_RangeMaxB_N171;
float Port_Import_N155;
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
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*8.0;
ssParticle l9_19=param_1;
int l9_20=l9_0;
float l9_21;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_21=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_20];
}
else
{
l9_21=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_22=l9_21;
l9_19.Seed=(l9_19.Ratio1D*0.97637898)+0.151235;
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_1=l9_19;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Output_Color0=gParticle.Color;
float4 Output_N42=float4(0.0);
float param_2=1.0;
float4 param_3=float4(1.0);
float4 param_4=float4(0.50196099,0.0,0.0081330603,1.0);
ssGlobals param_6=Globals;
float l9_24=0.0;
float l9_25=float((*sc_set0.UserUniforms).isIdle!=0);
l9_24=l9_25;
param_2=l9_24;
float4 param_5;
if ((param_2*1.0)!=0.0)
{
float2 l9_26=float2(0.0);
l9_26=param_6.Surface_UVCoord0;
float2 l9_27=float2(0.0);
float2 l9_28=l9_26;
float l9_29=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_30=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_31=sin(radians(l9_29));
float l9_32=cos(radians(l9_29));
float2 l9_33=l9_28-l9_30;
l9_33=float2(dot(float2(l9_32,l9_31),l9_33),dot(float2(-l9_31,l9_32),l9_33))+l9_30;
l9_27=l9_33;
float l9_34=0.0;
l9_34=gParticle.Index1DPerCopyF;
float l9_35=0.0;
l9_35=gParticle.Ratio1DPerCopy;
float l9_36=0.0;
l9_36=(((l9_35-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_37=float4(0.0);
float2 l9_38=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_39=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_40=l9_27;
float l9_41=l9_34;
float l9_42=l9_36;
float l9_43=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_44=param_6;
float2 l9_45=float2(0.0);
float l9_46=floor(l9_38.x);
float l9_47=floor(l9_38.y);
float l9_48=1.0/l9_46;
float l9_49=1.0/l9_47;
float l9_50=fast::min(l9_46*l9_47,floor(l9_39));
float l9_51=floor(mod(((l9_44.gTimeElapsedShifted+l9_43)*l9_42)+floor(l9_41),l9_50));
float l9_52=floor(l9_51/l9_46);
float l9_53=mod(l9_51,l9_46);
l9_45=float2((l9_48*l9_40.x)+(l9_53*l9_48),((1.0-l9_49)-(l9_52*l9_49))+(l9_49*l9_40.y));
int l9_54=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_55=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_55=0;
}
else
{
l9_55=in.varStereoViewID;
}
int l9_56=l9_55;
l9_54=1-l9_56;
}
else
{
int l9_57=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_57=0;
}
else
{
l9_57=in.varStereoViewID;
}
int l9_58=l9_57;
l9_54=l9_58;
}
int l9_59=l9_54;
int l9_60=flipbookTexLayout_tmp;
int l9_61=l9_59;
float2 l9_62=l9_45;
bool l9_63=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_64=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_65=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_66=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_67=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_68=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_69=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_70=0.0;
bool l9_71=l9_68&&(!l9_66);
float l9_72=1.0;
float l9_73=l9_62.x;
int l9_74=l9_65.x;
if (l9_74==1)
{
l9_73=fract(l9_73);
}
else
{
if (l9_74==2)
{
float l9_75=fract(l9_73);
float l9_76=l9_73-l9_75;
float l9_77=step(0.25,fract(l9_76*0.5));
l9_73=mix(l9_75,1.0-l9_75,fast::clamp(l9_77,0.0,1.0));
}
}
l9_62.x=l9_73;
float l9_78=l9_62.y;
int l9_79=l9_65.y;
if (l9_79==1)
{
l9_78=fract(l9_78);
}
else
{
if (l9_79==2)
{
float l9_80=fract(l9_78);
float l9_81=l9_78-l9_80;
float l9_82=step(0.25,fract(l9_81*0.5));
l9_78=mix(l9_80,1.0-l9_80,fast::clamp(l9_82,0.0,1.0));
}
}
l9_62.y=l9_78;
if (l9_66)
{
bool l9_83=l9_68;
bool l9_84;
if (l9_83)
{
l9_84=l9_65.x==3;
}
else
{
l9_84=l9_83;
}
float l9_85=l9_62.x;
float l9_86=l9_67.x;
float l9_87=l9_67.z;
bool l9_88=l9_84;
float l9_89=l9_72;
float l9_90=fast::clamp(l9_85,l9_86,l9_87);
float l9_91=step(abs(l9_85-l9_90),9.9999997e-06);
l9_89*=(l9_91+((1.0-float(l9_88))*(1.0-l9_91)));
l9_85=l9_90;
l9_62.x=l9_85;
l9_72=l9_89;
bool l9_92=l9_68;
bool l9_93;
if (l9_92)
{
l9_93=l9_65.y==3;
}
else
{
l9_93=l9_92;
}
float l9_94=l9_62.y;
float l9_95=l9_67.y;
float l9_96=l9_67.w;
bool l9_97=l9_93;
float l9_98=l9_72;
float l9_99=fast::clamp(l9_94,l9_95,l9_96);
float l9_100=step(abs(l9_94-l9_99),9.9999997e-06);
l9_98*=(l9_100+((1.0-float(l9_97))*(1.0-l9_100)));
l9_94=l9_99;
l9_62.y=l9_94;
l9_72=l9_98;
}
float2 l9_101=l9_62;
bool l9_102=l9_63;
float3x3 l9_103=l9_64;
if (l9_102)
{
l9_101=float2((l9_103*float3(l9_101,1.0)).xy);
}
float2 l9_104=l9_101;
float2 l9_105=l9_104;
float2 l9_106=l9_105;
l9_62=l9_106;
float l9_107=l9_62.x;
int l9_108=l9_65.x;
bool l9_109=l9_71;
float l9_110=l9_72;
if ((l9_108==0)||(l9_108==3))
{
float l9_111=l9_107;
float l9_112=0.0;
float l9_113=1.0;
bool l9_114=l9_109;
float l9_115=l9_110;
float l9_116=fast::clamp(l9_111,l9_112,l9_113);
float l9_117=step(abs(l9_111-l9_116),9.9999997e-06);
l9_115*=(l9_117+((1.0-float(l9_114))*(1.0-l9_117)));
l9_111=l9_116;
l9_107=l9_111;
l9_110=l9_115;
}
l9_62.x=l9_107;
l9_72=l9_110;
float l9_118=l9_62.y;
int l9_119=l9_65.y;
bool l9_120=l9_71;
float l9_121=l9_72;
if ((l9_119==0)||(l9_119==3))
{
float l9_122=l9_118;
float l9_123=0.0;
float l9_124=1.0;
bool l9_125=l9_120;
float l9_126=l9_121;
float l9_127=fast::clamp(l9_122,l9_123,l9_124);
float l9_128=step(abs(l9_122-l9_127),9.9999997e-06);
l9_126*=(l9_128+((1.0-float(l9_125))*(1.0-l9_128)));
l9_122=l9_127;
l9_118=l9_122;
l9_121=l9_126;
}
l9_62.y=l9_118;
l9_72=l9_121;
float2 l9_129=l9_62;
int l9_130=l9_60;
int l9_131=l9_61;
float l9_132=l9_70;
float2 l9_133=l9_129;
int l9_134=l9_130;
int l9_135=l9_131;
float3 l9_136=float3(0.0);
if (l9_134==0)
{
l9_136=float3(l9_133,0.0);
}
else
{
if (l9_134==1)
{
l9_136=float3(l9_133.x,(l9_133.y*0.5)+(0.5-(float(l9_135)*0.5)),0.0);
}
else
{
l9_136=float3(l9_133,float(l9_135));
}
}
float3 l9_137=l9_136;
float3 l9_138=l9_137;
float2 l9_139=l9_138.xy;
float l9_140=l9_132;
float4 l9_141=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_139,bias(l9_140));
float4 l9_142=l9_141;
float4 l9_143=l9_142;
if (l9_68)
{
l9_143=mix(l9_69,l9_143,float4(l9_72));
}
float4 l9_144=l9_143;
float4 l9_145=l9_144;
l9_37=l9_145;
float l9_146=0.0;
l9_146=l9_37.w;
float4 l9_147=float4(0.0);
l9_147=gParticle.Color;
float l9_148=0.0;
l9_148=l9_147.w;
float l9_149=0.0;
l9_149=l9_146*l9_148;
float2 l9_150=float2(0.0);
l9_150=param_6.Surface_UVCoord0;
float2 l9_151=float2(0.0);
l9_151=l9_150*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_152=float2(0.0);
l9_152=l9_151-float2(1.0);
float l9_153=0.0;
l9_153=dot(l9_152,l9_152);
float l9_154=0.0;
l9_154=fast::clamp(l9_153+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_155=0.0;
l9_155=1.0-l9_154;
float l9_156=0.0;
float l9_157;
if (l9_155<=0.0)
{
l9_157=0.0;
}
else
{
l9_157=sqrt(l9_155);
}
l9_156=l9_157;
float3 l9_158=float3(0.0);
l9_158=float3(l9_152.x,l9_152.y,l9_158.z);
l9_158.z=l9_156;
float l9_159=0.0;
l9_159=distance(l9_150,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_160=0.0;
l9_160=float(l9_159<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_161=float3(0.0);
l9_161=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_158,float3(l9_160));
float3 l9_162=float3(0.0);
l9_162=l9_161;
float4 l9_163=float4(0.0);
float3 l9_164=l9_37.xyz;
float l9_165=l9_149;
float3 l9_166=l9_162;
float3 l9_167=(*sc_set0.UserUniforms).Port_Emissive_N026;
float l9_168=(*sc_set0.UserUniforms).Port_Metallic_N026;
float l9_169=(*sc_set0.UserUniforms).Port_Roughness_N026;
float3 l9_170=(*sc_set0.UserUniforms).Port_AO_N026;
float3 l9_171=(*sc_set0.UserUniforms).Port_SpecularAO_N026;
ssGlobals l9_172=param_6;
l9_172.BumpedNormal=float3x3(float3(l9_172.VertexTangent_WorldSpace),float3(l9_172.VertexBinormal_WorldSpace),float3(l9_172.VertexNormal_WorldSpace))*l9_166;
l9_165=fast::clamp(l9_165,0.0,1.0);
l9_164=fast::max(l9_164,float3(0.0));
float3 l9_173=l9_164;
float l9_174=l9_165;
float3 l9_175=l9_172.BumpedNormal;
float3 l9_176=l9_172.PositionWS;
float3 l9_177=l9_172.ViewDirWS;
float3 l9_178=l9_167;
float l9_179=l9_168;
float l9_180=l9_169;
float3 l9_181=l9_170;
float3 l9_182=l9_171;
SurfaceProperties l9_183;
l9_183.albedo=float3(0.0);
l9_183.opacity=1.0;
l9_183.normal=float3(0.0);
l9_183.positionWS=float3(0.0);
l9_183.viewDirWS=float3(0.0);
l9_183.metallic=0.0;
l9_183.roughness=0.0;
l9_183.emissive=float3(0.0);
l9_183.ao=float3(1.0);
l9_183.specularAo=float3(1.0);
l9_183.bakedShadows=float3(1.0);
SurfaceProperties l9_184=l9_183;
SurfaceProperties l9_185=l9_184;
l9_185.opacity=l9_174;
float3 l9_186=l9_173;
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
l9_185.albedo=l9_188;
l9_185.normal=normalize(l9_175);
l9_185.positionWS=l9_176;
l9_185.viewDirWS=l9_177;
float3 l9_189=l9_178;
float3 l9_190;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_190=float3(pow(l9_189.x,2.2),pow(l9_189.y,2.2),pow(l9_189.z,2.2));
}
else
{
l9_190=l9_189*l9_189;
}
float3 l9_191=l9_190;
l9_185.emissive=l9_191;
l9_185.metallic=l9_179;
l9_185.roughness=l9_180;
l9_185.ao=l9_181;
l9_185.specularAo=l9_182;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_192=l9_185.positionWS;
l9_185.ao=evaluateSSAO(l9_192,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_193=l9_185;
SurfaceProperties l9_194=l9_193;
float3 l9_195=mix(float3(0.039999999),l9_194.albedo*l9_194.metallic,float3(l9_194.metallic));
float3 l9_196=mix(l9_194.albedo*(1.0-l9_194.metallic),float3(0.0),float3(l9_194.metallic));
l9_193.albedo=l9_196;
l9_193.specColor=l9_195;
SurfaceProperties l9_197=l9_193;
l9_185=l9_197;
SurfaceProperties l9_198=l9_185;
LightingComponents l9_199;
l9_199.directDiffuse=float3(0.0);
l9_199.directSpecular=float3(0.0);
l9_199.indirectDiffuse=float3(1.0);
l9_199.indirectSpecular=float3(0.0);
l9_199.emitted=float3(0.0);
l9_199.transmitted=float3(0.0);
LightingComponents l9_200=l9_199;
LightingComponents l9_201=l9_200;
float3 l9_202=l9_198.viewDirWS;
int l9_203=0;
float4 l9_204=float4(l9_198.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_205;
LightProperties l9_206;
int l9_207=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_207<sc_DirectionalLightsCount_tmp)
{
l9_205.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_207].direction;
l9_205.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_207].color;
l9_206.direction=l9_205.direction;
l9_206.color=l9_205.color.xyz;
l9_206.attenuation=l9_205.color.w;
l9_206.attenuation*=l9_204[(l9_203<3) ? l9_203 : 3];
l9_203++;
LightingComponents l9_208=l9_201;
LightProperties l9_209=l9_206;
SurfaceProperties l9_210=l9_198;
float3 l9_211=l9_202;
SurfaceProperties l9_212=l9_210;
float3 l9_213=l9_209.direction;
float3 l9_214=float3(fast::clamp(dot(l9_212.normal,l9_213),0.0,1.0));
l9_208.directDiffuse+=((l9_214*l9_209.color)*l9_209.attenuation);
SurfaceProperties l9_215=l9_210;
float3 l9_216=l9_209.direction;
float3 l9_217=l9_211;
l9_208.directSpecular+=((calculateDirectSpecular(l9_215,l9_216,l9_217)*l9_209.color)*l9_209.attenuation);
LightingComponents l9_218=l9_208;
l9_201=l9_218;
l9_207++;
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
sc_PointLight_t_1 l9_219;
LightProperties l9_220;
int l9_221=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_221<sc_PointLightsCount_tmp)
{
l9_219.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_221].falloffEnabled!=0;
l9_219.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_221].falloffEndDistance;
l9_219.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_221].negRcpFalloffEndDistance4;
l9_219.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_221].angleScale;
l9_219.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_221].angleOffset;
l9_219.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_221].direction;
l9_219.position=(*sc_set0.UserUniforms).sc_PointLights[l9_221].position;
l9_219.color=(*sc_set0.UserUniforms).sc_PointLights[l9_221].color;
float3 l9_222=l9_219.position-l9_198.positionWS;
l9_220.direction=normalize(l9_222);
l9_220.color=l9_219.color.xyz;
l9_220.attenuation=l9_219.color.w;
l9_220.attenuation*=l9_204[(l9_203<3) ? l9_203 : 3];
float3 l9_223=l9_220.direction;
float3 l9_224=l9_219.direction;
float l9_225=l9_219.angleScale;
float l9_226=l9_219.angleOffset;
float l9_227=dot(l9_223,l9_224);
float l9_228=fast::clamp((l9_227*l9_225)+l9_226,0.0,1.0);
float l9_229=l9_228*l9_228;
l9_220.attenuation*=l9_229;
if (l9_219.falloffEnabled)
{
float l9_230=length(l9_222);
float l9_231=l9_219.falloffEndDistance;
l9_220.attenuation*=computeDistanceAttenuation(l9_230,l9_231);
}
l9_203++;
LightingComponents l9_232=l9_201;
LightProperties l9_233=l9_220;
SurfaceProperties l9_234=l9_198;
float3 l9_235=l9_202;
SurfaceProperties l9_236=l9_234;
float3 l9_237=l9_233.direction;
float3 l9_238=float3(fast::clamp(dot(l9_236.normal,l9_237),0.0,1.0));
l9_232.directDiffuse+=((l9_238*l9_233.color)*l9_233.attenuation);
SurfaceProperties l9_239=l9_234;
float3 l9_240=l9_233.direction;
float3 l9_241=l9_235;
l9_232.directSpecular+=((calculateDirectSpecular(l9_239,l9_240,l9_241)*l9_233.color)*l9_233.attenuation);
LightingComponents l9_242=l9_232;
l9_201=l9_242;
l9_221++;
continue;
}
else
{
break;
}
}
}
bool l9_243=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_243)
{
float4 l9_244=gl_FragCoord;
float2 l9_245=l9_244.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_246=l9_245;
float2 l9_247=l9_246;
int l9_248=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_249=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_249=0;
}
else
{
l9_249=in.varStereoViewID;
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
l9_251=in.varStereoViewID;
}
int l9_252=l9_251;
l9_248=l9_252;
}
int l9_253=l9_248;
float2 l9_254=l9_247;
int l9_255=l9_253;
float2 l9_256=l9_254;
int l9_257=l9_255;
float l9_258=0.0;
float4 l9_259=float4(0.0);
float2 l9_260=l9_256;
int l9_261=sc_RayTracedShadowTextureLayout_tmp;
int l9_262=l9_257;
float l9_263=l9_258;
float2 l9_264=l9_260;
int l9_265=l9_261;
int l9_266=l9_262;
float3 l9_267=float3(0.0);
if (l9_265==0)
{
l9_267=float3(l9_264,0.0);
}
else
{
if (l9_265==1)
{
l9_267=float3(l9_264.x,(l9_264.y*0.5)+(0.5-(float(l9_266)*0.5)),0.0);
}
else
{
l9_267=float3(l9_264,float(l9_266));
}
}
float3 l9_268=l9_267;
float3 l9_269=l9_268;
float2 l9_270=l9_269.xy;
float l9_271=l9_263;
float4 l9_272=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_270,bias(l9_271));
float4 l9_273=l9_272;
l9_259=l9_273;
float4 l9_274=l9_259;
float4 l9_275=l9_274;
float4 l9_276=l9_275;
float l9_277=l9_276.x;
float3 l9_278=float3(l9_277);
float3 l9_279=l9_278;
l9_201.directDiffuse*=(float3(1.0)-l9_279);
l9_201.directSpecular*=(float3(1.0)-l9_279);
}
SurfaceProperties l9_280=l9_198;
float3 l9_281=l9_280.normal;
float3 l9_282=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_283=l9_281;
float3 l9_284=l9_283;
float l9_285=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_286=float2(0.0);
float l9_287=l9_284.x;
float l9_288=-l9_284.z;
float l9_289=(l9_287<0.0) ? (-1.0) : 1.0;
float l9_290=l9_289*acos(fast::clamp(l9_288/length(float2(l9_287,l9_288)),-1.0,1.0));
l9_286.x=l9_290-1.5707964;
l9_286.y=acos(l9_284.y);
l9_286/=float2(6.2831855,3.1415927);
l9_286.y=1.0-l9_286.y;
l9_286.x+=(l9_285/360.0);
l9_286.x=fract((l9_286.x+floor(l9_286.x))+1.0);
float2 l9_291=l9_286;
float2 l9_292=l9_291;
float4 l9_293=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_294=l9_292;
float2 l9_295=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_296=5.0;
l9_292=calcSeamlessPanoramicUvsForSampling(l9_294,l9_295,l9_296);
}
float2 l9_297=l9_292;
float l9_298=13.0;
int l9_299=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_300=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_300=0;
}
else
{
l9_300=in.varStereoViewID;
}
int l9_301=l9_300;
l9_299=1-l9_301;
}
else
{
int l9_302=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_302=0;
}
else
{
l9_302=in.varStereoViewID;
}
int l9_303=l9_302;
l9_299=l9_303;
}
int l9_304=l9_299;
float2 l9_305=l9_297;
int l9_306=l9_304;
float l9_307=l9_298;
float4 l9_308=float4(0.0);
float2 l9_309=l9_305;
int l9_310=sc_EnvmapSpecularLayout_tmp;
int l9_311=l9_306;
float l9_312=l9_307;
float2 l9_313=l9_309;
int l9_314=l9_310;
int l9_315=l9_311;
float3 l9_316=float3(0.0);
if (l9_314==0)
{
l9_316=float3(l9_313,0.0);
}
else
{
if (l9_314==1)
{
l9_316=float3(l9_313.x,(l9_313.y*0.5)+(0.5-(float(l9_315)*0.5)),0.0);
}
else
{
l9_316=float3(l9_313,float(l9_315));
}
}
float3 l9_317=l9_316;
float3 l9_318=l9_317;
float2 l9_319=l9_318.xy;
float l9_320=l9_312;
float4 l9_321=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_319,bias(l9_320));
float4 l9_322=l9_321;
l9_308=l9_322;
float4 l9_323=l9_308;
float4 l9_324=l9_323;
l9_293=l9_324;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_325=l9_292;
float2 l9_326=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_327=0.0;
l9_292=calcSeamlessPanoramicUvsForSampling(l9_325,l9_326,l9_327);
float2 l9_328=l9_292;
float l9_329=-13.0;
int l9_330=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_331=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_331=0;
}
else
{
l9_331=in.varStereoViewID;
}
int l9_332=l9_331;
l9_330=1-l9_332;
}
else
{
int l9_333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_333=0;
}
else
{
l9_333=in.varStereoViewID;
}
int l9_334=l9_333;
l9_330=l9_334;
}
int l9_335=l9_330;
float2 l9_336=l9_328;
int l9_337=l9_335;
float l9_338=l9_329;
float4 l9_339=float4(0.0);
float2 l9_340=l9_336;
int l9_341=sc_EnvmapDiffuseLayout_tmp;
int l9_342=l9_337;
float l9_343=l9_338;
float2 l9_344=l9_340;
int l9_345=l9_341;
int l9_346=l9_342;
float3 l9_347=float3(0.0);
if (l9_345==0)
{
l9_347=float3(l9_344,0.0);
}
else
{
if (l9_345==1)
{
l9_347=float3(l9_344.x,(l9_344.y*0.5)+(0.5-(float(l9_346)*0.5)),0.0);
}
else
{
l9_347=float3(l9_344,float(l9_346));
}
}
float3 l9_348=l9_347;
float3 l9_349=l9_348;
float2 l9_350=l9_349.xy;
float l9_351=l9_343;
float4 l9_352=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_350,bias(l9_351));
float4 l9_353=l9_352;
l9_339=l9_353;
float4 l9_354=l9_339;
float4 l9_355=l9_354;
l9_293=l9_355;
}
else
{
float2 l9_356=l9_292;
float l9_357=13.0;
int l9_358=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
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
l9_358=1-l9_360;
}
else
{
int l9_361=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_361=0;
}
else
{
l9_361=in.varStereoViewID;
}
int l9_362=l9_361;
l9_358=l9_362;
}
int l9_363=l9_358;
float2 l9_364=l9_356;
int l9_365=l9_363;
float l9_366=l9_357;
float4 l9_367=float4(0.0);
float2 l9_368=l9_364;
int l9_369=sc_EnvmapSpecularLayout_tmp;
int l9_370=l9_365;
float l9_371=l9_366;
float2 l9_372=l9_368;
int l9_373=l9_369;
int l9_374=l9_370;
float3 l9_375=float3(0.0);
if (l9_373==0)
{
l9_375=float3(l9_372,0.0);
}
else
{
if (l9_373==1)
{
l9_375=float3(l9_372.x,(l9_372.y*0.5)+(0.5-(float(l9_374)*0.5)),0.0);
}
else
{
l9_375=float3(l9_372,float(l9_374));
}
}
float3 l9_376=l9_375;
float3 l9_377=l9_376;
float2 l9_378=l9_377.xy;
float l9_379=l9_371;
float4 l9_380=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_378,bias(l9_379));
float4 l9_381=l9_380;
l9_367=l9_381;
float4 l9_382=l9_367;
float4 l9_383=l9_382;
l9_293=l9_383;
}
}
float4 l9_384=l9_293;
float3 l9_385=l9_384.xyz*(1.0/l9_384.w);
float3 l9_386=l9_385*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_282=l9_386;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_387=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_388=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_389=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_390=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_391=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_392=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_393=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_394=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_395=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_396=-l9_281;
float l9_397=0.0;
l9_397=l9_396.x;
float l9_398=l9_396.y;
float l9_399=l9_396.z;
float l9_400=l9_397*l9_397;
float l9_401=l9_398*l9_398;
float l9_402=l9_399*l9_399;
float l9_403=l9_397*l9_398;
float l9_404=l9_398*l9_399;
float l9_405=l9_397*l9_399;
float3 l9_406=((((((l9_395*0.42904299)*(l9_400-l9_401))+((l9_393*0.74312502)*l9_402))+(l9_387*0.88622701))-(l9_393*0.24770799))+((((l9_391*l9_403)+(l9_394*l9_405))+(l9_392*l9_404))*0.85808599))+((((l9_390*l9_397)+(l9_388*l9_398))+(l9_389*l9_399))*1.0233279);
l9_282=l9_406*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_407=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_407)
{
float4 l9_408=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_282=mix(l9_282,l9_408.xyz,float3(l9_408.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_282+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_282.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_282+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_282.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_282+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_282.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_409=l9_281;
float3 l9_410=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_411;
float l9_412;
int l9_413=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_413<sc_LightEstimationSGCount_tmp)
{
l9_411.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_413].color;
l9_411.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_413].sharpness;
l9_411.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_413].axis;
float3 l9_414=l9_409;
float l9_415=dot(l9_411.axis,l9_414);
float l9_416=l9_411.sharpness;
float l9_417=0.36000001;
float l9_418=1.0/(4.0*l9_417);
float l9_419=exp(-l9_416);
float l9_420=l9_419*l9_419;
float l9_421=1.0/l9_416;
float l9_422=(1.0+(2.0*l9_420))-l9_421;
float l9_423=((l9_419-l9_420)*l9_421)-l9_420;
float l9_424=sqrt(1.0-l9_422);
float l9_425=l9_417*l9_415;
float l9_426=l9_418*l9_424;
float l9_427=l9_425+l9_426;
float l9_428=fast::clamp(l9_415,0.0,1.0);
if (step(abs(l9_425),l9_426)>0.5)
{
l9_412=(l9_427*l9_427)/l9_424;
}
else
{
l9_412=l9_428;
}
l9_428=l9_412;
float l9_429=(l9_422*l9_428)+l9_423;
sc_SphericalGaussianLight_t l9_430=l9_411;
float3 l9_431=(l9_430.color/float3(l9_430.sharpness))*6.2831855;
float3 l9_432=(l9_431*l9_429)/float3(3.1415927);
l9_410+=l9_432;
l9_413++;
continue;
}
else
{
break;
}
}
float3 l9_433=l9_410;
l9_282+=l9_433;
}
float3 l9_434=l9_282;
float3 l9_435=l9_434;
l9_201.indirectDiffuse=l9_435;
SurfaceProperties l9_436=l9_198;
float3 l9_437=l9_202;
float3 l9_438=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_439=l9_436;
float3 l9_440=l9_437;
float3 l9_441=l9_439.normal;
float3 l9_442=reflect(-l9_440,l9_441);
float3 l9_443=l9_441;
float3 l9_444=l9_442;
float l9_445=l9_439.roughness;
l9_442=getSpecularDominantDir(l9_443,l9_444,l9_445);
float l9_446=l9_439.roughness;
float l9_447=fast::clamp(pow(l9_446,0.66666669),0.0,1.0)*5.0;
float l9_448=l9_447;
float l9_449=l9_448;
float3 l9_450=l9_442;
float l9_451=l9_449;
float3 l9_452=l9_450;
float l9_453=l9_451;
float4 l9_454=float4(0.0);
float3 l9_455=l9_452;
float l9_456=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_457=float2(0.0);
float l9_458=l9_455.x;
float l9_459=-l9_455.z;
float l9_460=(l9_458<0.0) ? (-1.0) : 1.0;
float l9_461=l9_460*acos(fast::clamp(l9_459/length(float2(l9_458,l9_459)),-1.0,1.0));
l9_457.x=l9_461-1.5707964;
l9_457.y=acos(l9_455.y);
l9_457/=float2(6.2831855,3.1415927);
l9_457.y=1.0-l9_457.y;
l9_457.x+=(l9_456/360.0);
l9_457.x=fract((l9_457.x+floor(l9_457.x))+1.0);
float2 l9_462=l9_457;
float2 l9_463=l9_462;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_464=floor(l9_453);
float l9_465=ceil(l9_453);
float l9_466=l9_453-l9_464;
float2 l9_467=l9_463;
float2 l9_468=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_469=l9_464;
float2 l9_470=calcSeamlessPanoramicUvsForSampling(l9_467,l9_468,l9_469);
float2 l9_471=l9_470;
float l9_472=l9_464;
float2 l9_473=l9_471;
float l9_474=l9_472;
int l9_475=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_476=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_476=0;
}
else
{
l9_476=in.varStereoViewID;
}
int l9_477=l9_476;
l9_475=1-l9_477;
}
else
{
int l9_478=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_478=0;
}
else
{
l9_478=in.varStereoViewID;
}
int l9_479=l9_478;
l9_475=l9_479;
}
int l9_480=l9_475;
float2 l9_481=l9_473;
int l9_482=l9_480;
float l9_483=l9_474;
float4 l9_484=float4(0.0);
float2 l9_485=l9_481;
int l9_486=sc_EnvmapSpecularLayout_tmp;
int l9_487=l9_482;
float l9_488=l9_483;
float2 l9_489=l9_485;
int l9_490=l9_486;
int l9_491=l9_487;
float3 l9_492=float3(0.0);
if (l9_490==0)
{
l9_492=float3(l9_489,0.0);
}
else
{
if (l9_490==1)
{
l9_492=float3(l9_489.x,(l9_489.y*0.5)+(0.5-(float(l9_491)*0.5)),0.0);
}
else
{
l9_492=float3(l9_489,float(l9_491));
}
}
float3 l9_493=l9_492;
float3 l9_494=l9_493;
float2 l9_495=l9_494.xy;
float l9_496=l9_488;
float4 l9_497=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_495,level(l9_496));
float4 l9_498=l9_497;
l9_484=l9_498;
float4 l9_499=l9_484;
float4 l9_500=l9_499;
float4 l9_501=l9_500;
float4 l9_502=l9_501;
float2 l9_503=l9_463;
float2 l9_504=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_505=l9_465;
float2 l9_506=calcSeamlessPanoramicUvsForSampling(l9_503,l9_504,l9_505);
float2 l9_507=l9_506;
float l9_508=l9_465;
float2 l9_509=l9_507;
float l9_510=l9_508;
int l9_511=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_512=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_512=0;
}
else
{
l9_512=in.varStereoViewID;
}
int l9_513=l9_512;
l9_511=1-l9_513;
}
else
{
int l9_514=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_514=0;
}
else
{
l9_514=in.varStereoViewID;
}
int l9_515=l9_514;
l9_511=l9_515;
}
int l9_516=l9_511;
float2 l9_517=l9_509;
int l9_518=l9_516;
float l9_519=l9_510;
float4 l9_520=float4(0.0);
float2 l9_521=l9_517;
int l9_522=sc_EnvmapSpecularLayout_tmp;
int l9_523=l9_518;
float l9_524=l9_519;
float2 l9_525=l9_521;
int l9_526=l9_522;
int l9_527=l9_523;
float3 l9_528=float3(0.0);
if (l9_526==0)
{
l9_528=float3(l9_525,0.0);
}
else
{
if (l9_526==1)
{
l9_528=float3(l9_525.x,(l9_525.y*0.5)+(0.5-(float(l9_527)*0.5)),0.0);
}
else
{
l9_528=float3(l9_525,float(l9_527));
}
}
float3 l9_529=l9_528;
float3 l9_530=l9_529;
float2 l9_531=l9_530.xy;
float l9_532=l9_524;
float4 l9_533=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_531,level(l9_532));
float4 l9_534=l9_533;
l9_520=l9_534;
float4 l9_535=l9_520;
float4 l9_536=l9_535;
float4 l9_537=l9_536;
float4 l9_538=l9_537;
l9_454=mix(l9_502,l9_538,float4(l9_466));
}
else
{
float2 l9_539=l9_463;
float l9_540=l9_453;
float2 l9_541=l9_539;
float l9_542=l9_540;
int l9_543=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_544=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_544=0;
}
else
{
l9_544=in.varStereoViewID;
}
int l9_545=l9_544;
l9_543=1-l9_545;
}
else
{
int l9_546=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_546=0;
}
else
{
l9_546=in.varStereoViewID;
}
int l9_547=l9_546;
l9_543=l9_547;
}
int l9_548=l9_543;
float2 l9_549=l9_541;
int l9_550=l9_548;
float l9_551=l9_542;
float4 l9_552=float4(0.0);
float2 l9_553=l9_549;
int l9_554=sc_EnvmapSpecularLayout_tmp;
int l9_555=l9_550;
float l9_556=l9_551;
float2 l9_557=l9_553;
int l9_558=l9_554;
int l9_559=l9_555;
float3 l9_560=float3(0.0);
if (l9_558==0)
{
l9_560=float3(l9_557,0.0);
}
else
{
if (l9_558==1)
{
l9_560=float3(l9_557.x,(l9_557.y*0.5)+(0.5-(float(l9_559)*0.5)),0.0);
}
else
{
l9_560=float3(l9_557,float(l9_559));
}
}
float3 l9_561=l9_560;
float3 l9_562=l9_561;
float2 l9_563=l9_562.xy;
float l9_564=l9_556;
float4 l9_565=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_563,level(l9_564));
float4 l9_566=l9_565;
l9_552=l9_566;
float4 l9_567=l9_552;
float4 l9_568=l9_567;
float4 l9_569=l9_568;
l9_454=l9_569;
}
float4 l9_570=l9_454;
float3 l9_571=l9_570.xyz*(1.0/l9_570.w);
float3 l9_572=l9_571;
float3 l9_573=l9_572*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_573+=float3(1e-06);
float3 l9_574=l9_573;
float3 l9_575=l9_574;
bool l9_576=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_576)
{
float4 l9_577=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_575=mix(l9_575,l9_577.xyz,float3(l9_577.w));
}
SurfaceProperties l9_578=l9_439;
float l9_579=abs(dot(l9_441,l9_440));
float3 l9_580=l9_575*envBRDFApprox(l9_578,l9_579);
l9_438+=l9_580;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_581=l9_436;
float3 l9_582=l9_437;
float l9_583=fast::clamp(l9_581.roughness*l9_581.roughness,0.0099999998,1.0);
float3 l9_584=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_581.specColor;
sc_SphericalGaussianLight_t l9_585;
sc_SphericalGaussianLight_t l9_586;
sc_SphericalGaussianLight_t l9_587;
int l9_588=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_588<sc_LightEstimationSGCount_tmp)
{
l9_585.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_588].color;
l9_585.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_588].sharpness;
l9_585.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_588].axis;
float3 l9_589=l9_581.normal;
float l9_590=l9_583;
float3 l9_591=l9_582;
float3 l9_592=l9_581.specColor;
float3 l9_593=l9_589;
float l9_594=l9_590;
l9_586.axis=l9_593;
float l9_595=l9_594*l9_594;
l9_586.sharpness=2.0/l9_595;
l9_586.color=float3(1.0/(3.1415927*l9_595));
sc_SphericalGaussianLight_t l9_596=l9_586;
sc_SphericalGaussianLight_t l9_597=l9_596;
sc_SphericalGaussianLight_t l9_598=l9_597;
float3 l9_599=l9_591;
l9_587.axis=reflect(-l9_599,l9_598.axis);
l9_587.color=l9_598.color;
l9_587.sharpness=l9_598.sharpness;
l9_587.sharpness/=(4.0*fast::max(dot(l9_598.axis,l9_599),9.9999997e-05));
sc_SphericalGaussianLight_t l9_600=l9_587;
sc_SphericalGaussianLight_t l9_601=l9_600;
sc_SphericalGaussianLight_t l9_602=l9_601;
sc_SphericalGaussianLight_t l9_603=l9_585;
float l9_604=length((l9_602.axis*l9_602.sharpness)+(l9_603.axis*l9_603.sharpness));
float3 l9_605=(l9_602.color*exp((l9_604-l9_602.sharpness)-l9_603.sharpness))*l9_603.color;
float l9_606=1.0-exp((-2.0)*l9_604);
float3 l9_607=((l9_605*6.2831855)*l9_606)/float3(l9_604);
float3 l9_608=l9_607;
float3 l9_609=l9_601.axis;
float l9_610=l9_590*l9_590;
float l9_611=fast::clamp(dot(l9_589,l9_609),0.0,1.0);
float l9_612=fast::clamp(dot(l9_589,l9_591),0.0,1.0);
float3 l9_613=normalize(l9_601.axis+l9_591);
float l9_614=l9_610;
float l9_615=l9_611;
float l9_616=1.0/(l9_615+sqrt(l9_614+(((1.0-l9_614)*l9_615)*l9_615)));
float l9_617=l9_610;
float l9_618=l9_612;
float l9_619=1.0/(l9_618+sqrt(l9_617+(((1.0-l9_617)*l9_618)*l9_618)));
l9_608*=(l9_616*l9_619);
float l9_620=pow(1.0-fast::clamp(dot(l9_609,l9_613),0.0,1.0),5.0);
l9_608*=(l9_592+((float3(1.0)-l9_592)*l9_620));
l9_608*=l9_611;
float3 l9_621=l9_608;
l9_584+=l9_621;
l9_588++;
continue;
}
else
{
break;
}
}
float3 l9_622=l9_584;
l9_438+=l9_622;
}
float3 l9_623=l9_438;
l9_201.indirectSpecular=l9_623;
LightingComponents l9_624=l9_201;
LightingComponents l9_625=l9_624;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_625.directDiffuse=float3(0.0);
l9_625.indirectDiffuse=float3(0.0);
float4 l9_626=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_627=out.FragColor0;
float4 l9_628=l9_627;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_628.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_629=l9_628;
l9_626=l9_629;
}
else
{
float4 l9_630=gl_FragCoord;
float2 l9_631=l9_630.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_632=l9_631;
float2 l9_633=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_634=1;
int l9_635=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_635=0;
}
else
{
l9_635=in.varStereoViewID;
}
int l9_636=l9_635;
int l9_637=l9_636;
float3 l9_638=float3(l9_632,0.0);
int l9_639=l9_634;
int l9_640=l9_637;
if (l9_639==1)
{
l9_638.y=((2.0*l9_638.y)+float(l9_640))-1.0;
}
float2 l9_641=l9_638.xy;
l9_633=l9_641;
}
else
{
l9_633=l9_632;
}
float2 l9_642=l9_633;
float2 l9_643=l9_642;
float2 l9_644=l9_643;
int l9_645=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_646=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_646=0;
}
else
{
l9_646=in.varStereoViewID;
}
int l9_647=l9_646;
l9_645=1-l9_647;
}
else
{
int l9_648=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_648=0;
}
else
{
l9_648=in.varStereoViewID;
}
int l9_649=l9_648;
l9_645=l9_649;
}
int l9_650=l9_645;
float2 l9_651=l9_644;
int l9_652=l9_650;
float2 l9_653=l9_651;
int l9_654=l9_652;
float l9_655=0.0;
float4 l9_656=float4(0.0);
float2 l9_657=l9_653;
int l9_658=sc_ScreenTextureLayout_tmp;
int l9_659=l9_654;
float l9_660=l9_655;
float2 l9_661=l9_657;
int l9_662=l9_658;
int l9_663=l9_659;
float3 l9_664=float3(0.0);
if (l9_662==0)
{
l9_664=float3(l9_661,0.0);
}
else
{
if (l9_662==1)
{
l9_664=float3(l9_661.x,(l9_661.y*0.5)+(0.5-(float(l9_663)*0.5)),0.0);
}
else
{
l9_664=float3(l9_661,float(l9_663));
}
}
float3 l9_665=l9_664;
float3 l9_666=l9_665;
float2 l9_667=l9_666.xy;
float l9_668=l9_660;
float4 l9_669=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_667,bias(l9_668));
float4 l9_670=l9_669;
l9_656=l9_670;
float4 l9_671=l9_656;
float4 l9_672=l9_671;
float4 l9_673=l9_672;
l9_626=l9_673;
}
float4 l9_674=l9_626;
float4 l9_675=l9_674;
float3 l9_676=l9_675.xyz;
float3 l9_677;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_677=float3(pow(l9_676.x,2.2),pow(l9_676.y,2.2),pow(l9_676.z,2.2));
}
else
{
l9_677=l9_676*l9_676;
}
float3 l9_678=l9_677;
float3 l9_679=l9_678;
l9_625.transmitted=l9_679*mix(float3(1.0),l9_185.albedo,float3(l9_185.opacity));
l9_185.opacity=1.0;
}
bool l9_680=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_680=true;
}
SurfaceProperties l9_681=l9_185;
LightingComponents l9_682=l9_625;
bool l9_683=l9_680;
float3 l9_684=float3(0.0);
bool l9_685=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_685)
{
l9_684=l9_681.albedo*(l9_682.directDiffuse+(l9_682.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_684=l9_681.albedo*(l9_682.directDiffuse+(l9_682.indirectDiffuse*l9_681.ao));
}
float3 l9_686=l9_682.directSpecular+(l9_682.indirectSpecular*l9_681.specularAo);
float3 l9_687=l9_681.emissive;
float3 l9_688=l9_682.transmitted;
if (l9_683)
{
float l9_689=l9_681.opacity;
l9_684*=srgbToLinear(l9_689);
}
float3 l9_690=((l9_684+l9_686)+l9_687)+l9_688;
float3 l9_691=l9_690;
float4 l9_692=float4(l9_691,l9_185.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_693=l9_692.xyz;
float l9_694=1.8;
float l9_695=1.4;
float l9_696=0.5;
float l9_697=1.5;
float3 l9_698=(l9_693*((l9_693*l9_694)+float3(l9_695)))/((l9_693*((l9_693*l9_694)+float3(l9_696)))+float3(l9_697));
l9_692=float4(l9_698.x,l9_698.y,l9_698.z,l9_692.w);
}
float3 l9_699=l9_692.xyz;
float l9_700=l9_699.x;
float l9_701=l9_699.y;
float l9_702=l9_699.z;
float3 l9_703=float3(linearToSrgb(l9_700),linearToSrgb(l9_701),linearToSrgb(l9_702));
l9_692=float4(l9_703.x,l9_703.y,l9_703.z,l9_692.w);
float4 l9_704=l9_692;
float4 l9_705=l9_704;
l9_705=fast::max(l9_705,float4(0.0));
l9_163=l9_705;
param_3=l9_163;
param_5=param_3;
}
else
{
float4 l9_706=float4(0.0);
float l9_707=1.0;
float4 l9_708=float4(1.0);
float4 l9_709=float4(0.5,0.0,0.0,0.0);
ssGlobals l9_710=param_6;
float l9_711=0.0;
float l9_712=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_711=l9_712;
l9_707=l9_711;
float4 l9_713;
if ((l9_707*1.0)!=0.0)
{
float2 l9_714=float2(0.0);
l9_714=l9_710.Surface_UVCoord0;
float2 l9_715=float2(0.0);
float2 l9_716=l9_714;
float l9_717=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_718=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_719=sin(radians(l9_717));
float l9_720=cos(radians(l9_717));
float2 l9_721=l9_716-l9_718;
l9_721=float2(dot(float2(l9_720,l9_719),l9_721),dot(float2(-l9_719,l9_720),l9_721))+l9_718;
l9_715=l9_721;
float l9_722=0.0;
l9_722=gParticle.Index1DPerCopyF;
float l9_723=0.0;
l9_723=gParticle.Ratio1DPerCopy;
float l9_724=0.0;
l9_724=(((l9_723-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_725=float4(0.0);
float2 l9_726=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_727=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_728=l9_715;
float l9_729=l9_722;
float l9_730=l9_724;
float l9_731=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_732=l9_710;
float2 l9_733=float2(0.0);
float l9_734=floor(l9_726.x);
float l9_735=floor(l9_726.y);
float l9_736=1.0/l9_734;
float l9_737=1.0/l9_735;
float l9_738=fast::min(l9_734*l9_735,floor(l9_727));
float l9_739=floor(mod(((l9_732.gTimeElapsedShifted+l9_731)*l9_730)+floor(l9_729),l9_738));
float l9_740=floor(l9_739/l9_734);
float l9_741=mod(l9_739,l9_734);
l9_733=float2((l9_736*l9_728.x)+(l9_741*l9_736),((1.0-l9_737)-(l9_740*l9_737))+(l9_737*l9_728.y));
int l9_742=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_743=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_743=0;
}
else
{
l9_743=in.varStereoViewID;
}
int l9_744=l9_743;
l9_742=1-l9_744;
}
else
{
int l9_745=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_745=0;
}
else
{
l9_745=in.varStereoViewID;
}
int l9_746=l9_745;
l9_742=l9_746;
}
int l9_747=l9_742;
int l9_748=flipbookTexLayout_tmp;
int l9_749=l9_747;
float2 l9_750=l9_733;
bool l9_751=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_752=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_753=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_754=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_755=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_756=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_757=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_758=0.0;
bool l9_759=l9_756&&(!l9_754);
float l9_760=1.0;
float l9_761=l9_750.x;
int l9_762=l9_753.x;
if (l9_762==1)
{
l9_761=fract(l9_761);
}
else
{
if (l9_762==2)
{
float l9_763=fract(l9_761);
float l9_764=l9_761-l9_763;
float l9_765=step(0.25,fract(l9_764*0.5));
l9_761=mix(l9_763,1.0-l9_763,fast::clamp(l9_765,0.0,1.0));
}
}
l9_750.x=l9_761;
float l9_766=l9_750.y;
int l9_767=l9_753.y;
if (l9_767==1)
{
l9_766=fract(l9_766);
}
else
{
if (l9_767==2)
{
float l9_768=fract(l9_766);
float l9_769=l9_766-l9_768;
float l9_770=step(0.25,fract(l9_769*0.5));
l9_766=mix(l9_768,1.0-l9_768,fast::clamp(l9_770,0.0,1.0));
}
}
l9_750.y=l9_766;
if (l9_754)
{
bool l9_771=l9_756;
bool l9_772;
if (l9_771)
{
l9_772=l9_753.x==3;
}
else
{
l9_772=l9_771;
}
float l9_773=l9_750.x;
float l9_774=l9_755.x;
float l9_775=l9_755.z;
bool l9_776=l9_772;
float l9_777=l9_760;
float l9_778=fast::clamp(l9_773,l9_774,l9_775);
float l9_779=step(abs(l9_773-l9_778),9.9999997e-06);
l9_777*=(l9_779+((1.0-float(l9_776))*(1.0-l9_779)));
l9_773=l9_778;
l9_750.x=l9_773;
l9_760=l9_777;
bool l9_780=l9_756;
bool l9_781;
if (l9_780)
{
l9_781=l9_753.y==3;
}
else
{
l9_781=l9_780;
}
float l9_782=l9_750.y;
float l9_783=l9_755.y;
float l9_784=l9_755.w;
bool l9_785=l9_781;
float l9_786=l9_760;
float l9_787=fast::clamp(l9_782,l9_783,l9_784);
float l9_788=step(abs(l9_782-l9_787),9.9999997e-06);
l9_786*=(l9_788+((1.0-float(l9_785))*(1.0-l9_788)));
l9_782=l9_787;
l9_750.y=l9_782;
l9_760=l9_786;
}
float2 l9_789=l9_750;
bool l9_790=l9_751;
float3x3 l9_791=l9_752;
if (l9_790)
{
l9_789=float2((l9_791*float3(l9_789,1.0)).xy);
}
float2 l9_792=l9_789;
float2 l9_793=l9_792;
float2 l9_794=l9_793;
l9_750=l9_794;
float l9_795=l9_750.x;
int l9_796=l9_753.x;
bool l9_797=l9_759;
float l9_798=l9_760;
if ((l9_796==0)||(l9_796==3))
{
float l9_799=l9_795;
float l9_800=0.0;
float l9_801=1.0;
bool l9_802=l9_797;
float l9_803=l9_798;
float l9_804=fast::clamp(l9_799,l9_800,l9_801);
float l9_805=step(abs(l9_799-l9_804),9.9999997e-06);
l9_803*=(l9_805+((1.0-float(l9_802))*(1.0-l9_805)));
l9_799=l9_804;
l9_795=l9_799;
l9_798=l9_803;
}
l9_750.x=l9_795;
l9_760=l9_798;
float l9_806=l9_750.y;
int l9_807=l9_753.y;
bool l9_808=l9_759;
float l9_809=l9_760;
if ((l9_807==0)||(l9_807==3))
{
float l9_810=l9_806;
float l9_811=0.0;
float l9_812=1.0;
bool l9_813=l9_808;
float l9_814=l9_809;
float l9_815=fast::clamp(l9_810,l9_811,l9_812);
float l9_816=step(abs(l9_810-l9_815),9.9999997e-06);
l9_814*=(l9_816+((1.0-float(l9_813))*(1.0-l9_816)));
l9_810=l9_815;
l9_806=l9_810;
l9_809=l9_814;
}
l9_750.y=l9_806;
l9_760=l9_809;
float2 l9_817=l9_750;
int l9_818=l9_748;
int l9_819=l9_749;
float l9_820=l9_758;
float2 l9_821=l9_817;
int l9_822=l9_818;
int l9_823=l9_819;
float3 l9_824=float3(0.0);
if (l9_822==0)
{
l9_824=float3(l9_821,0.0);
}
else
{
if (l9_822==1)
{
l9_824=float3(l9_821.x,(l9_821.y*0.5)+(0.5-(float(l9_823)*0.5)),0.0);
}
else
{
l9_824=float3(l9_821,float(l9_823));
}
}
float3 l9_825=l9_824;
float3 l9_826=l9_825;
float2 l9_827=l9_826.xy;
float l9_828=l9_820;
float4 l9_829=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_827,bias(l9_828));
float4 l9_830=l9_829;
float4 l9_831=l9_830;
if (l9_756)
{
l9_831=mix(l9_757,l9_831,float4(l9_760));
}
float4 l9_832=l9_831;
float4 l9_833=l9_832;
l9_725=l9_833;
float l9_834=0.0;
l9_834=l9_725.w;
float4 l9_835=float4(0.0);
l9_835=gParticle.Color;
float l9_836=0.0;
l9_836=l9_835.w;
float l9_837=0.0;
l9_837=l9_834*l9_836;
float2 l9_838=float2(0.0);
l9_838=l9_710.Surface_UVCoord0;
float2 l9_839=float2(0.0);
l9_839=l9_838*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_840=float2(0.0);
l9_840=l9_839-float2(1.0);
float l9_841=0.0;
l9_841=dot(l9_840,l9_840);
float l9_842=0.0;
l9_842=fast::clamp(l9_841+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_843=0.0;
l9_843=1.0-l9_842;
float l9_844=0.0;
float l9_845;
if (l9_843<=0.0)
{
l9_845=0.0;
}
else
{
l9_845=sqrt(l9_843);
}
l9_844=l9_845;
float3 l9_846=float3(0.0);
l9_846=float3(l9_840.x,l9_840.y,l9_846.z);
l9_846.z=l9_844;
float l9_847=0.0;
l9_847=distance(l9_838,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_848=0.0;
l9_848=float(l9_847<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_849=float3(0.0);
l9_849=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_846,float3(l9_848));
float3 l9_850=float3(0.0);
l9_850=l9_849;
float4 l9_851=float4(0.0);
float3 l9_852=l9_725.xyz;
float l9_853=l9_837;
float3 l9_854=l9_850;
float3 l9_855=(*sc_set0.UserUniforms).Port_Emissive_N026;
float l9_856=(*sc_set0.UserUniforms).Port_Metallic_N026;
float l9_857=(*sc_set0.UserUniforms).Port_Roughness_N026;
float3 l9_858=(*sc_set0.UserUniforms).Port_AO_N026;
float3 l9_859=(*sc_set0.UserUniforms).Port_SpecularAO_N026;
ssGlobals l9_860=l9_710;
l9_860.BumpedNormal=float3x3(float3(l9_860.VertexTangent_WorldSpace),float3(l9_860.VertexBinormal_WorldSpace),float3(l9_860.VertexNormal_WorldSpace))*l9_854;
l9_853=fast::clamp(l9_853,0.0,1.0);
l9_852=fast::max(l9_852,float3(0.0));
float3 l9_861=l9_852;
float l9_862=l9_853;
float3 l9_863=l9_860.BumpedNormal;
float3 l9_864=l9_860.PositionWS;
float3 l9_865=l9_860.ViewDirWS;
float3 l9_866=l9_855;
float l9_867=l9_856;
float l9_868=l9_857;
float3 l9_869=l9_858;
float3 l9_870=l9_859;
SurfaceProperties l9_871;
l9_871.albedo=float3(0.0);
l9_871.opacity=1.0;
l9_871.normal=float3(0.0);
l9_871.positionWS=float3(0.0);
l9_871.viewDirWS=float3(0.0);
l9_871.metallic=0.0;
l9_871.roughness=0.0;
l9_871.emissive=float3(0.0);
l9_871.ao=float3(1.0);
l9_871.specularAo=float3(1.0);
l9_871.bakedShadows=float3(1.0);
SurfaceProperties l9_872=l9_871;
SurfaceProperties l9_873=l9_872;
l9_873.opacity=l9_862;
float3 l9_874=l9_861;
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
l9_873.albedo=l9_876;
l9_873.normal=normalize(l9_863);
l9_873.positionWS=l9_864;
l9_873.viewDirWS=l9_865;
float3 l9_877=l9_866;
float3 l9_878;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_878=float3(pow(l9_877.x,2.2),pow(l9_877.y,2.2),pow(l9_877.z,2.2));
}
else
{
l9_878=l9_877*l9_877;
}
float3 l9_879=l9_878;
l9_873.emissive=l9_879;
l9_873.metallic=l9_867;
l9_873.roughness=l9_868;
l9_873.ao=l9_869;
l9_873.specularAo=l9_870;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_880=l9_873.positionWS;
l9_873.ao=evaluateSSAO(l9_880,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_881=l9_873;
SurfaceProperties l9_882=l9_881;
float3 l9_883=mix(float3(0.039999999),l9_882.albedo*l9_882.metallic,float3(l9_882.metallic));
float3 l9_884=mix(l9_882.albedo*(1.0-l9_882.metallic),float3(0.0),float3(l9_882.metallic));
l9_881.albedo=l9_884;
l9_881.specColor=l9_883;
SurfaceProperties l9_885=l9_881;
l9_873=l9_885;
SurfaceProperties l9_886=l9_873;
LightingComponents l9_887;
l9_887.directDiffuse=float3(0.0);
l9_887.directSpecular=float3(0.0);
l9_887.indirectDiffuse=float3(1.0);
l9_887.indirectSpecular=float3(0.0);
l9_887.emitted=float3(0.0);
l9_887.transmitted=float3(0.0);
LightingComponents l9_888=l9_887;
LightingComponents l9_889=l9_888;
float3 l9_890=l9_886.viewDirWS;
int l9_891=0;
float4 l9_892=float4(l9_886.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_893;
LightProperties l9_894;
int l9_895=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_895<sc_DirectionalLightsCount_tmp)
{
l9_893.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_895].direction;
l9_893.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_895].color;
l9_894.direction=l9_893.direction;
l9_894.color=l9_893.color.xyz;
l9_894.attenuation=l9_893.color.w;
l9_894.attenuation*=l9_892[(l9_891<3) ? l9_891 : 3];
l9_891++;
LightingComponents l9_896=l9_889;
LightProperties l9_897=l9_894;
SurfaceProperties l9_898=l9_886;
float3 l9_899=l9_890;
SurfaceProperties l9_900=l9_898;
float3 l9_901=l9_897.direction;
float3 l9_902=float3(fast::clamp(dot(l9_900.normal,l9_901),0.0,1.0));
l9_896.directDiffuse+=((l9_902*l9_897.color)*l9_897.attenuation);
SurfaceProperties l9_903=l9_898;
float3 l9_904=l9_897.direction;
float3 l9_905=l9_899;
l9_896.directSpecular+=((calculateDirectSpecular(l9_903,l9_904,l9_905)*l9_897.color)*l9_897.attenuation);
LightingComponents l9_906=l9_896;
l9_889=l9_906;
l9_895++;
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
sc_PointLight_t_1 l9_907;
LightProperties l9_908;
int l9_909=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_909<sc_PointLightsCount_tmp)
{
l9_907.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_909].falloffEnabled!=0;
l9_907.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_909].falloffEndDistance;
l9_907.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_909].negRcpFalloffEndDistance4;
l9_907.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_909].angleScale;
l9_907.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_909].angleOffset;
l9_907.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_909].direction;
l9_907.position=(*sc_set0.UserUniforms).sc_PointLights[l9_909].position;
l9_907.color=(*sc_set0.UserUniforms).sc_PointLights[l9_909].color;
float3 l9_910=l9_907.position-l9_886.positionWS;
l9_908.direction=normalize(l9_910);
l9_908.color=l9_907.color.xyz;
l9_908.attenuation=l9_907.color.w;
l9_908.attenuation*=l9_892[(l9_891<3) ? l9_891 : 3];
float3 l9_911=l9_908.direction;
float3 l9_912=l9_907.direction;
float l9_913=l9_907.angleScale;
float l9_914=l9_907.angleOffset;
float l9_915=dot(l9_911,l9_912);
float l9_916=fast::clamp((l9_915*l9_913)+l9_914,0.0,1.0);
float l9_917=l9_916*l9_916;
l9_908.attenuation*=l9_917;
if (l9_907.falloffEnabled)
{
float l9_918=length(l9_910);
float l9_919=l9_907.falloffEndDistance;
l9_908.attenuation*=computeDistanceAttenuation(l9_918,l9_919);
}
l9_891++;
LightingComponents l9_920=l9_889;
LightProperties l9_921=l9_908;
SurfaceProperties l9_922=l9_886;
float3 l9_923=l9_890;
SurfaceProperties l9_924=l9_922;
float3 l9_925=l9_921.direction;
float3 l9_926=float3(fast::clamp(dot(l9_924.normal,l9_925),0.0,1.0));
l9_920.directDiffuse+=((l9_926*l9_921.color)*l9_921.attenuation);
SurfaceProperties l9_927=l9_922;
float3 l9_928=l9_921.direction;
float3 l9_929=l9_923;
l9_920.directSpecular+=((calculateDirectSpecular(l9_927,l9_928,l9_929)*l9_921.color)*l9_921.attenuation);
LightingComponents l9_930=l9_920;
l9_889=l9_930;
l9_909++;
continue;
}
else
{
break;
}
}
}
bool l9_931=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_931)
{
float4 l9_932=gl_FragCoord;
float2 l9_933=l9_932.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_934=l9_933;
float2 l9_935=l9_934;
int l9_936=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_937=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_937=0;
}
else
{
l9_937=in.varStereoViewID;
}
int l9_938=l9_937;
l9_936=1-l9_938;
}
else
{
int l9_939=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_939=0;
}
else
{
l9_939=in.varStereoViewID;
}
int l9_940=l9_939;
l9_936=l9_940;
}
int l9_941=l9_936;
float2 l9_942=l9_935;
int l9_943=l9_941;
float2 l9_944=l9_942;
int l9_945=l9_943;
float l9_946=0.0;
float4 l9_947=float4(0.0);
float2 l9_948=l9_944;
int l9_949=sc_RayTracedShadowTextureLayout_tmp;
int l9_950=l9_945;
float l9_951=l9_946;
float2 l9_952=l9_948;
int l9_953=l9_949;
int l9_954=l9_950;
float3 l9_955=float3(0.0);
if (l9_953==0)
{
l9_955=float3(l9_952,0.0);
}
else
{
if (l9_953==1)
{
l9_955=float3(l9_952.x,(l9_952.y*0.5)+(0.5-(float(l9_954)*0.5)),0.0);
}
else
{
l9_955=float3(l9_952,float(l9_954));
}
}
float3 l9_956=l9_955;
float3 l9_957=l9_956;
float2 l9_958=l9_957.xy;
float l9_959=l9_951;
float4 l9_960=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_958,bias(l9_959));
float4 l9_961=l9_960;
l9_947=l9_961;
float4 l9_962=l9_947;
float4 l9_963=l9_962;
float4 l9_964=l9_963;
float l9_965=l9_964.x;
float3 l9_966=float3(l9_965);
float3 l9_967=l9_966;
l9_889.directDiffuse*=(float3(1.0)-l9_967);
l9_889.directSpecular*=(float3(1.0)-l9_967);
}
SurfaceProperties l9_968=l9_886;
float3 l9_969=l9_968.normal;
float3 l9_970=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_971=l9_969;
float3 l9_972=l9_971;
float l9_973=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_974=float2(0.0);
float l9_975=l9_972.x;
float l9_976=-l9_972.z;
float l9_977=(l9_975<0.0) ? (-1.0) : 1.0;
float l9_978=l9_977*acos(fast::clamp(l9_976/length(float2(l9_975,l9_976)),-1.0,1.0));
l9_974.x=l9_978-1.5707964;
l9_974.y=acos(l9_972.y);
l9_974/=float2(6.2831855,3.1415927);
l9_974.y=1.0-l9_974.y;
l9_974.x+=(l9_973/360.0);
l9_974.x=fract((l9_974.x+floor(l9_974.x))+1.0);
float2 l9_979=l9_974;
float2 l9_980=l9_979;
float4 l9_981=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_982=l9_980;
float2 l9_983=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_984=5.0;
l9_980=calcSeamlessPanoramicUvsForSampling(l9_982,l9_983,l9_984);
}
float2 l9_985=l9_980;
float l9_986=13.0;
int l9_987=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_988=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_988=0;
}
else
{
l9_988=in.varStereoViewID;
}
int l9_989=l9_988;
l9_987=1-l9_989;
}
else
{
int l9_990=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_990=0;
}
else
{
l9_990=in.varStereoViewID;
}
int l9_991=l9_990;
l9_987=l9_991;
}
int l9_992=l9_987;
float2 l9_993=l9_985;
int l9_994=l9_992;
float l9_995=l9_986;
float4 l9_996=float4(0.0);
float2 l9_997=l9_993;
int l9_998=sc_EnvmapSpecularLayout_tmp;
int l9_999=l9_994;
float l9_1000=l9_995;
float2 l9_1001=l9_997;
int l9_1002=l9_998;
int l9_1003=l9_999;
float3 l9_1004=float3(0.0);
if (l9_1002==0)
{
l9_1004=float3(l9_1001,0.0);
}
else
{
if (l9_1002==1)
{
l9_1004=float3(l9_1001.x,(l9_1001.y*0.5)+(0.5-(float(l9_1003)*0.5)),0.0);
}
else
{
l9_1004=float3(l9_1001,float(l9_1003));
}
}
float3 l9_1005=l9_1004;
float3 l9_1006=l9_1005;
float2 l9_1007=l9_1006.xy;
float l9_1008=l9_1000;
float4 l9_1009=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1007,bias(l9_1008));
float4 l9_1010=l9_1009;
l9_996=l9_1010;
float4 l9_1011=l9_996;
float4 l9_1012=l9_1011;
l9_981=l9_1012;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_1013=l9_980;
float2 l9_1014=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_1015=0.0;
l9_980=calcSeamlessPanoramicUvsForSampling(l9_1013,l9_1014,l9_1015);
float2 l9_1016=l9_980;
float l9_1017=-13.0;
int l9_1018=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_1019=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1019=0;
}
else
{
l9_1019=in.varStereoViewID;
}
int l9_1020=l9_1019;
l9_1018=1-l9_1020;
}
else
{
int l9_1021=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1021=0;
}
else
{
l9_1021=in.varStereoViewID;
}
int l9_1022=l9_1021;
l9_1018=l9_1022;
}
int l9_1023=l9_1018;
float2 l9_1024=l9_1016;
int l9_1025=l9_1023;
float l9_1026=l9_1017;
float4 l9_1027=float4(0.0);
float2 l9_1028=l9_1024;
int l9_1029=sc_EnvmapDiffuseLayout_tmp;
int l9_1030=l9_1025;
float l9_1031=l9_1026;
float2 l9_1032=l9_1028;
int l9_1033=l9_1029;
int l9_1034=l9_1030;
float3 l9_1035=float3(0.0);
if (l9_1033==0)
{
l9_1035=float3(l9_1032,0.0);
}
else
{
if (l9_1033==1)
{
l9_1035=float3(l9_1032.x,(l9_1032.y*0.5)+(0.5-(float(l9_1034)*0.5)),0.0);
}
else
{
l9_1035=float3(l9_1032,float(l9_1034));
}
}
float3 l9_1036=l9_1035;
float3 l9_1037=l9_1036;
float2 l9_1038=l9_1037.xy;
float l9_1039=l9_1031;
float4 l9_1040=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_1038,bias(l9_1039));
float4 l9_1041=l9_1040;
l9_1027=l9_1041;
float4 l9_1042=l9_1027;
float4 l9_1043=l9_1042;
l9_981=l9_1043;
}
else
{
float2 l9_1044=l9_980;
float l9_1045=13.0;
int l9_1046=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1047=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1047=0;
}
else
{
l9_1047=in.varStereoViewID;
}
int l9_1048=l9_1047;
l9_1046=1-l9_1048;
}
else
{
int l9_1049=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1049=0;
}
else
{
l9_1049=in.varStereoViewID;
}
int l9_1050=l9_1049;
l9_1046=l9_1050;
}
int l9_1051=l9_1046;
float2 l9_1052=l9_1044;
int l9_1053=l9_1051;
float l9_1054=l9_1045;
float4 l9_1055=float4(0.0);
float2 l9_1056=l9_1052;
int l9_1057=sc_EnvmapSpecularLayout_tmp;
int l9_1058=l9_1053;
float l9_1059=l9_1054;
float2 l9_1060=l9_1056;
int l9_1061=l9_1057;
int l9_1062=l9_1058;
float3 l9_1063=float3(0.0);
if (l9_1061==0)
{
l9_1063=float3(l9_1060,0.0);
}
else
{
if (l9_1061==1)
{
l9_1063=float3(l9_1060.x,(l9_1060.y*0.5)+(0.5-(float(l9_1062)*0.5)),0.0);
}
else
{
l9_1063=float3(l9_1060,float(l9_1062));
}
}
float3 l9_1064=l9_1063;
float3 l9_1065=l9_1064;
float2 l9_1066=l9_1065.xy;
float l9_1067=l9_1059;
float4 l9_1068=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1066,bias(l9_1067));
float4 l9_1069=l9_1068;
l9_1055=l9_1069;
float4 l9_1070=l9_1055;
float4 l9_1071=l9_1070;
l9_981=l9_1071;
}
}
float4 l9_1072=l9_981;
float3 l9_1073=l9_1072.xyz*(1.0/l9_1072.w);
float3 l9_1074=l9_1073*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_970=l9_1074;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_1075=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_1076=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_1077=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_1078=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_1079=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_1080=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_1081=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_1082=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_1083=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_1084=-l9_969;
float l9_1085=0.0;
l9_1085=l9_1084.x;
float l9_1086=l9_1084.y;
float l9_1087=l9_1084.z;
float l9_1088=l9_1085*l9_1085;
float l9_1089=l9_1086*l9_1086;
float l9_1090=l9_1087*l9_1087;
float l9_1091=l9_1085*l9_1086;
float l9_1092=l9_1086*l9_1087;
float l9_1093=l9_1085*l9_1087;
float3 l9_1094=((((((l9_1083*0.42904299)*(l9_1088-l9_1089))+((l9_1081*0.74312502)*l9_1090))+(l9_1075*0.88622701))-(l9_1081*0.24770799))+((((l9_1079*l9_1091)+(l9_1082*l9_1093))+(l9_1080*l9_1092))*0.85808599))+((((l9_1078*l9_1085)+(l9_1076*l9_1086))+(l9_1077*l9_1087))*1.0233279);
l9_970=l9_1094*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_1095=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_1095)
{
float4 l9_1096=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_970=mix(l9_970,l9_1096.xyz,float3(l9_1096.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_970+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_970.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_970+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_970.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_970+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_970.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_1097=l9_969;
float3 l9_1098=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_1099;
float l9_1100;
int l9_1101=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1101<sc_LightEstimationSGCount_tmp)
{
l9_1099.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1101].color;
l9_1099.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1101].sharpness;
l9_1099.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1101].axis;
float3 l9_1102=l9_1097;
float l9_1103=dot(l9_1099.axis,l9_1102);
float l9_1104=l9_1099.sharpness;
float l9_1105=0.36000001;
float l9_1106=1.0/(4.0*l9_1105);
float l9_1107=exp(-l9_1104);
float l9_1108=l9_1107*l9_1107;
float l9_1109=1.0/l9_1104;
float l9_1110=(1.0+(2.0*l9_1108))-l9_1109;
float l9_1111=((l9_1107-l9_1108)*l9_1109)-l9_1108;
float l9_1112=sqrt(1.0-l9_1110);
float l9_1113=l9_1105*l9_1103;
float l9_1114=l9_1106*l9_1112;
float l9_1115=l9_1113+l9_1114;
float l9_1116=fast::clamp(l9_1103,0.0,1.0);
if (step(abs(l9_1113),l9_1114)>0.5)
{
l9_1100=(l9_1115*l9_1115)/l9_1112;
}
else
{
l9_1100=l9_1116;
}
l9_1116=l9_1100;
float l9_1117=(l9_1110*l9_1116)+l9_1111;
sc_SphericalGaussianLight_t l9_1118=l9_1099;
float3 l9_1119=(l9_1118.color/float3(l9_1118.sharpness))*6.2831855;
float3 l9_1120=(l9_1119*l9_1117)/float3(3.1415927);
l9_1098+=l9_1120;
l9_1101++;
continue;
}
else
{
break;
}
}
float3 l9_1121=l9_1098;
l9_970+=l9_1121;
}
float3 l9_1122=l9_970;
float3 l9_1123=l9_1122;
l9_889.indirectDiffuse=l9_1123;
SurfaceProperties l9_1124=l9_886;
float3 l9_1125=l9_890;
float3 l9_1126=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_1127=l9_1124;
float3 l9_1128=l9_1125;
float3 l9_1129=l9_1127.normal;
float3 l9_1130=reflect(-l9_1128,l9_1129);
float3 l9_1131=l9_1129;
float3 l9_1132=l9_1130;
float l9_1133=l9_1127.roughness;
l9_1130=getSpecularDominantDir(l9_1131,l9_1132,l9_1133);
float l9_1134=l9_1127.roughness;
float l9_1135=fast::clamp(pow(l9_1134,0.66666669),0.0,1.0)*5.0;
float l9_1136=l9_1135;
float l9_1137=l9_1136;
float3 l9_1138=l9_1130;
float l9_1139=l9_1137;
float3 l9_1140=l9_1138;
float l9_1141=l9_1139;
float4 l9_1142=float4(0.0);
float3 l9_1143=l9_1140;
float l9_1144=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_1145=float2(0.0);
float l9_1146=l9_1143.x;
float l9_1147=-l9_1143.z;
float l9_1148=(l9_1146<0.0) ? (-1.0) : 1.0;
float l9_1149=l9_1148*acos(fast::clamp(l9_1147/length(float2(l9_1146,l9_1147)),-1.0,1.0));
l9_1145.x=l9_1149-1.5707964;
l9_1145.y=acos(l9_1143.y);
l9_1145/=float2(6.2831855,3.1415927);
l9_1145.y=1.0-l9_1145.y;
l9_1145.x+=(l9_1144/360.0);
l9_1145.x=fract((l9_1145.x+floor(l9_1145.x))+1.0);
float2 l9_1150=l9_1145;
float2 l9_1151=l9_1150;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_1152=floor(l9_1141);
float l9_1153=ceil(l9_1141);
float l9_1154=l9_1141-l9_1152;
float2 l9_1155=l9_1151;
float2 l9_1156=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1157=l9_1152;
float2 l9_1158=calcSeamlessPanoramicUvsForSampling(l9_1155,l9_1156,l9_1157);
float2 l9_1159=l9_1158;
float l9_1160=l9_1152;
float2 l9_1161=l9_1159;
float l9_1162=l9_1160;
int l9_1163=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1164=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1164=0;
}
else
{
l9_1164=in.varStereoViewID;
}
int l9_1165=l9_1164;
l9_1163=1-l9_1165;
}
else
{
int l9_1166=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1166=0;
}
else
{
l9_1166=in.varStereoViewID;
}
int l9_1167=l9_1166;
l9_1163=l9_1167;
}
int l9_1168=l9_1163;
float2 l9_1169=l9_1161;
int l9_1170=l9_1168;
float l9_1171=l9_1162;
float4 l9_1172=float4(0.0);
float2 l9_1173=l9_1169;
int l9_1174=sc_EnvmapSpecularLayout_tmp;
int l9_1175=l9_1170;
float l9_1176=l9_1171;
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
float4 l9_1185=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1183,level(l9_1184));
float4 l9_1186=l9_1185;
l9_1172=l9_1186;
float4 l9_1187=l9_1172;
float4 l9_1188=l9_1187;
float4 l9_1189=l9_1188;
float4 l9_1190=l9_1189;
float2 l9_1191=l9_1151;
float2 l9_1192=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1193=l9_1153;
float2 l9_1194=calcSeamlessPanoramicUvsForSampling(l9_1191,l9_1192,l9_1193);
float2 l9_1195=l9_1194;
float l9_1196=l9_1153;
float2 l9_1197=l9_1195;
float l9_1198=l9_1196;
int l9_1199=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1200=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1200=0;
}
else
{
l9_1200=in.varStereoViewID;
}
int l9_1201=l9_1200;
l9_1199=1-l9_1201;
}
else
{
int l9_1202=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1202=0;
}
else
{
l9_1202=in.varStereoViewID;
}
int l9_1203=l9_1202;
l9_1199=l9_1203;
}
int l9_1204=l9_1199;
float2 l9_1205=l9_1197;
int l9_1206=l9_1204;
float l9_1207=l9_1198;
float4 l9_1208=float4(0.0);
float2 l9_1209=l9_1205;
int l9_1210=sc_EnvmapSpecularLayout_tmp;
int l9_1211=l9_1206;
float l9_1212=l9_1207;
float2 l9_1213=l9_1209;
int l9_1214=l9_1210;
int l9_1215=l9_1211;
float3 l9_1216=float3(0.0);
if (l9_1214==0)
{
l9_1216=float3(l9_1213,0.0);
}
else
{
if (l9_1214==1)
{
l9_1216=float3(l9_1213.x,(l9_1213.y*0.5)+(0.5-(float(l9_1215)*0.5)),0.0);
}
else
{
l9_1216=float3(l9_1213,float(l9_1215));
}
}
float3 l9_1217=l9_1216;
float3 l9_1218=l9_1217;
float2 l9_1219=l9_1218.xy;
float l9_1220=l9_1212;
float4 l9_1221=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1219,level(l9_1220));
float4 l9_1222=l9_1221;
l9_1208=l9_1222;
float4 l9_1223=l9_1208;
float4 l9_1224=l9_1223;
float4 l9_1225=l9_1224;
float4 l9_1226=l9_1225;
l9_1142=mix(l9_1190,l9_1226,float4(l9_1154));
}
else
{
float2 l9_1227=l9_1151;
float l9_1228=l9_1141;
float2 l9_1229=l9_1227;
float l9_1230=l9_1228;
int l9_1231=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
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
float2 l9_1237=l9_1229;
int l9_1238=l9_1236;
float l9_1239=l9_1230;
float4 l9_1240=float4(0.0);
float2 l9_1241=l9_1237;
int l9_1242=sc_EnvmapSpecularLayout_tmp;
int l9_1243=l9_1238;
float l9_1244=l9_1239;
float2 l9_1245=l9_1241;
int l9_1246=l9_1242;
int l9_1247=l9_1243;
float3 l9_1248=float3(0.0);
if (l9_1246==0)
{
l9_1248=float3(l9_1245,0.0);
}
else
{
if (l9_1246==1)
{
l9_1248=float3(l9_1245.x,(l9_1245.y*0.5)+(0.5-(float(l9_1247)*0.5)),0.0);
}
else
{
l9_1248=float3(l9_1245,float(l9_1247));
}
}
float3 l9_1249=l9_1248;
float3 l9_1250=l9_1249;
float2 l9_1251=l9_1250.xy;
float l9_1252=l9_1244;
float4 l9_1253=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_1251,level(l9_1252));
float4 l9_1254=l9_1253;
l9_1240=l9_1254;
float4 l9_1255=l9_1240;
float4 l9_1256=l9_1255;
float4 l9_1257=l9_1256;
l9_1142=l9_1257;
}
float4 l9_1258=l9_1142;
float3 l9_1259=l9_1258.xyz*(1.0/l9_1258.w);
float3 l9_1260=l9_1259;
float3 l9_1261=l9_1260*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_1261+=float3(1e-06);
float3 l9_1262=l9_1261;
float3 l9_1263=l9_1262;
bool l9_1264=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_1264)
{
float4 l9_1265=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_1263=mix(l9_1263,l9_1265.xyz,float3(l9_1265.w));
}
SurfaceProperties l9_1266=l9_1127;
float l9_1267=abs(dot(l9_1129,l9_1128));
float3 l9_1268=l9_1263*envBRDFApprox(l9_1266,l9_1267);
l9_1126+=l9_1268;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_1269=l9_1124;
float3 l9_1270=l9_1125;
float l9_1271=fast::clamp(l9_1269.roughness*l9_1269.roughness,0.0099999998,1.0);
float3 l9_1272=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_1269.specColor;
sc_SphericalGaussianLight_t l9_1273;
sc_SphericalGaussianLight_t l9_1274;
sc_SphericalGaussianLight_t l9_1275;
int l9_1276=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1276<sc_LightEstimationSGCount_tmp)
{
l9_1273.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1276].color;
l9_1273.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1276].sharpness;
l9_1273.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_1276].axis;
float3 l9_1277=l9_1269.normal;
float l9_1278=l9_1271;
float3 l9_1279=l9_1270;
float3 l9_1280=l9_1269.specColor;
float3 l9_1281=l9_1277;
float l9_1282=l9_1278;
l9_1274.axis=l9_1281;
float l9_1283=l9_1282*l9_1282;
l9_1274.sharpness=2.0/l9_1283;
l9_1274.color=float3(1.0/(3.1415927*l9_1283));
sc_SphericalGaussianLight_t l9_1284=l9_1274;
sc_SphericalGaussianLight_t l9_1285=l9_1284;
sc_SphericalGaussianLight_t l9_1286=l9_1285;
float3 l9_1287=l9_1279;
l9_1275.axis=reflect(-l9_1287,l9_1286.axis);
l9_1275.color=l9_1286.color;
l9_1275.sharpness=l9_1286.sharpness;
l9_1275.sharpness/=(4.0*fast::max(dot(l9_1286.axis,l9_1287),9.9999997e-05));
sc_SphericalGaussianLight_t l9_1288=l9_1275;
sc_SphericalGaussianLight_t l9_1289=l9_1288;
sc_SphericalGaussianLight_t l9_1290=l9_1289;
sc_SphericalGaussianLight_t l9_1291=l9_1273;
float l9_1292=length((l9_1290.axis*l9_1290.sharpness)+(l9_1291.axis*l9_1291.sharpness));
float3 l9_1293=(l9_1290.color*exp((l9_1292-l9_1290.sharpness)-l9_1291.sharpness))*l9_1291.color;
float l9_1294=1.0-exp((-2.0)*l9_1292);
float3 l9_1295=((l9_1293*6.2831855)*l9_1294)/float3(l9_1292);
float3 l9_1296=l9_1295;
float3 l9_1297=l9_1289.axis;
float l9_1298=l9_1278*l9_1278;
float l9_1299=fast::clamp(dot(l9_1277,l9_1297),0.0,1.0);
float l9_1300=fast::clamp(dot(l9_1277,l9_1279),0.0,1.0);
float3 l9_1301=normalize(l9_1289.axis+l9_1279);
float l9_1302=l9_1298;
float l9_1303=l9_1299;
float l9_1304=1.0/(l9_1303+sqrt(l9_1302+(((1.0-l9_1302)*l9_1303)*l9_1303)));
float l9_1305=l9_1298;
float l9_1306=l9_1300;
float l9_1307=1.0/(l9_1306+sqrt(l9_1305+(((1.0-l9_1305)*l9_1306)*l9_1306)));
l9_1296*=(l9_1304*l9_1307);
float l9_1308=pow(1.0-fast::clamp(dot(l9_1297,l9_1301),0.0,1.0),5.0);
l9_1296*=(l9_1280+((float3(1.0)-l9_1280)*l9_1308));
l9_1296*=l9_1299;
float3 l9_1309=l9_1296;
l9_1272+=l9_1309;
l9_1276++;
continue;
}
else
{
break;
}
}
float3 l9_1310=l9_1272;
l9_1126+=l9_1310;
}
float3 l9_1311=l9_1126;
l9_889.indirectSpecular=l9_1311;
LightingComponents l9_1312=l9_889;
LightingComponents l9_1313=l9_1312;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1313.directDiffuse=float3(0.0);
l9_1313.indirectDiffuse=float3(0.0);
float4 l9_1314=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1315=out.FragColor0;
float4 l9_1316=l9_1315;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1316.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1317=l9_1316;
l9_1314=l9_1317;
}
else
{
float4 l9_1318=gl_FragCoord;
float2 l9_1319=l9_1318.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1320=l9_1319;
float2 l9_1321=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1322=1;
int l9_1323=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1323=0;
}
else
{
l9_1323=in.varStereoViewID;
}
int l9_1324=l9_1323;
int l9_1325=l9_1324;
float3 l9_1326=float3(l9_1320,0.0);
int l9_1327=l9_1322;
int l9_1328=l9_1325;
if (l9_1327==1)
{
l9_1326.y=((2.0*l9_1326.y)+float(l9_1328))-1.0;
}
float2 l9_1329=l9_1326.xy;
l9_1321=l9_1329;
}
else
{
l9_1321=l9_1320;
}
float2 l9_1330=l9_1321;
float2 l9_1331=l9_1330;
float2 l9_1332=l9_1331;
int l9_1333=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1334=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1334=0;
}
else
{
l9_1334=in.varStereoViewID;
}
int l9_1335=l9_1334;
l9_1333=1-l9_1335;
}
else
{
int l9_1336=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1336=0;
}
else
{
l9_1336=in.varStereoViewID;
}
int l9_1337=l9_1336;
l9_1333=l9_1337;
}
int l9_1338=l9_1333;
float2 l9_1339=l9_1332;
int l9_1340=l9_1338;
float2 l9_1341=l9_1339;
int l9_1342=l9_1340;
float l9_1343=0.0;
float4 l9_1344=float4(0.0);
float2 l9_1345=l9_1341;
int l9_1346=sc_ScreenTextureLayout_tmp;
int l9_1347=l9_1342;
float l9_1348=l9_1343;
float2 l9_1349=l9_1345;
int l9_1350=l9_1346;
int l9_1351=l9_1347;
float3 l9_1352=float3(0.0);
if (l9_1350==0)
{
l9_1352=float3(l9_1349,0.0);
}
else
{
if (l9_1350==1)
{
l9_1352=float3(l9_1349.x,(l9_1349.y*0.5)+(0.5-(float(l9_1351)*0.5)),0.0);
}
else
{
l9_1352=float3(l9_1349,float(l9_1351));
}
}
float3 l9_1353=l9_1352;
float3 l9_1354=l9_1353;
float2 l9_1355=l9_1354.xy;
float l9_1356=l9_1348;
float4 l9_1357=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1355,bias(l9_1356));
float4 l9_1358=l9_1357;
l9_1344=l9_1358;
float4 l9_1359=l9_1344;
float4 l9_1360=l9_1359;
float4 l9_1361=l9_1360;
l9_1314=l9_1361;
}
float4 l9_1362=l9_1314;
float4 l9_1363=l9_1362;
float3 l9_1364=l9_1363.xyz;
float3 l9_1365;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1365=float3(pow(l9_1364.x,2.2),pow(l9_1364.y,2.2),pow(l9_1364.z,2.2));
}
else
{
l9_1365=l9_1364*l9_1364;
}
float3 l9_1366=l9_1365;
float3 l9_1367=l9_1366;
l9_1313.transmitted=l9_1367*mix(float3(1.0),l9_873.albedo,float3(l9_873.opacity));
l9_873.opacity=1.0;
}
bool l9_1368=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1368=true;
}
SurfaceProperties l9_1369=l9_873;
LightingComponents l9_1370=l9_1313;
bool l9_1371=l9_1368;
float3 l9_1372=float3(0.0);
bool l9_1373=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_1373)
{
l9_1372=l9_1369.albedo*(l9_1370.directDiffuse+(l9_1370.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_1372=l9_1369.albedo*(l9_1370.directDiffuse+(l9_1370.indirectDiffuse*l9_1369.ao));
}
float3 l9_1374=l9_1370.directSpecular+(l9_1370.indirectSpecular*l9_1369.specularAo);
float3 l9_1375=l9_1369.emissive;
float3 l9_1376=l9_1370.transmitted;
if (l9_1371)
{
float l9_1377=l9_1369.opacity;
l9_1372*=srgbToLinear(l9_1377);
}
float3 l9_1378=((l9_1372+l9_1374)+l9_1375)+l9_1376;
float3 l9_1379=l9_1378;
float4 l9_1380=float4(l9_1379,l9_873.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_1381=l9_1380.xyz;
float l9_1382=1.8;
float l9_1383=1.4;
float l9_1384=0.5;
float l9_1385=1.5;
float3 l9_1386=(l9_1381*((l9_1381*l9_1382)+float3(l9_1383)))/((l9_1381*((l9_1381*l9_1382)+float3(l9_1384)))+float3(l9_1385));
l9_1380=float4(l9_1386.x,l9_1386.y,l9_1386.z,l9_1380.w);
}
float3 l9_1387=l9_1380.xyz;
float l9_1388=l9_1387.x;
float l9_1389=l9_1387.y;
float l9_1390=l9_1387.z;
float3 l9_1391=float3(linearToSrgb(l9_1388),linearToSrgb(l9_1389),linearToSrgb(l9_1390));
l9_1380=float4(l9_1391.x,l9_1391.y,l9_1391.z,l9_1380.w);
float4 l9_1392=l9_1380;
float4 l9_1393=l9_1392;
l9_1393=fast::max(l9_1393,float4(0.0));
l9_851=l9_1393;
l9_708=l9_851;
l9_713=l9_708;
}
else
{
float4 l9_1394=float4(0.0);
l9_1394=gParticle.Color;
float4 l9_1395=float4(0.0);
float4 l9_1396=(*sc_set0.UserUniforms).TintColor;
l9_1395=l9_1396;
float l9_1397=0.0;
float l9_1398=1.0;
float l9_1399=0.0;
ssGlobals l9_1400=l9_710;
float l9_1401;
if ((int(Tweak_N261_tmp)!=0))
{
float l9_1402=0.0;
float l9_1403=0.0;
float l9_1404=0.0;
float l9_1405=0.0;
float l9_1406=0.0;
float l9_1407=0.0;
ssGlobals l9_1408=l9_1400;
float l9_1409;
if (NODE_243_DROPLIST_ITEM_tmp==0)
{
float4 l9_1410=float4(0.0);
float4 l9_1411=float4(1.0);
float4 l9_1412=float4(0.0);
ssGlobals l9_1413=l9_1408;
float4 l9_1414;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_1415=float2(0.0);
l9_1415=l9_1413.Surface_UVCoord0;
float2 l9_1416=float2(0.0);
float2 l9_1417=l9_1415;
float l9_1418=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1419=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1420=sin(radians(l9_1418));
float l9_1421=cos(radians(l9_1418));
float2 l9_1422=l9_1417-l9_1419;
l9_1422=float2(dot(float2(l9_1421,l9_1420),l9_1422),dot(float2(-l9_1420,l9_1421),l9_1422))+l9_1419;
l9_1416=l9_1422;
float l9_1423=0.0;
l9_1423=gParticle.Index1DPerCopyF;
float l9_1424=0.0;
l9_1424=gParticle.Ratio1DPerCopy;
float l9_1425=0.0;
l9_1425=(((l9_1424-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1426=float4(0.0);
float2 l9_1427=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1428=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1429=l9_1416;
float l9_1430=l9_1423;
float l9_1431=l9_1425;
float l9_1432=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1433=l9_1413;
float2 l9_1434=float2(0.0);
float l9_1435=floor(l9_1427.x);
float l9_1436=floor(l9_1427.y);
float l9_1437=1.0/l9_1435;
float l9_1438=1.0/l9_1436;
float l9_1439=fast::min(l9_1435*l9_1436,floor(l9_1428));
float l9_1440=floor(mod(((l9_1433.gTimeElapsedShifted+l9_1432)*l9_1431)+floor(l9_1430),l9_1439));
float l9_1441=floor(l9_1440/l9_1435);
float l9_1442=mod(l9_1440,l9_1435);
l9_1434=float2((l9_1437*l9_1429.x)+(l9_1442*l9_1437),((1.0-l9_1438)-(l9_1441*l9_1438))+(l9_1438*l9_1429.y));
int l9_1443=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1444=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1444=0;
}
else
{
l9_1444=in.varStereoViewID;
}
int l9_1445=l9_1444;
l9_1443=1-l9_1445;
}
else
{
int l9_1446=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1446=0;
}
else
{
l9_1446=in.varStereoViewID;
}
int l9_1447=l9_1446;
l9_1443=l9_1447;
}
int l9_1448=l9_1443;
int l9_1449=flipbookTexLayout_tmp;
int l9_1450=l9_1448;
float2 l9_1451=l9_1434;
bool l9_1452=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1453=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1454=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1455=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1456=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1457=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1458=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1459=0.0;
bool l9_1460=l9_1457&&(!l9_1455);
float l9_1461=1.0;
float l9_1462=l9_1451.x;
int l9_1463=l9_1454.x;
if (l9_1463==1)
{
l9_1462=fract(l9_1462);
}
else
{
if (l9_1463==2)
{
float l9_1464=fract(l9_1462);
float l9_1465=l9_1462-l9_1464;
float l9_1466=step(0.25,fract(l9_1465*0.5));
l9_1462=mix(l9_1464,1.0-l9_1464,fast::clamp(l9_1466,0.0,1.0));
}
}
l9_1451.x=l9_1462;
float l9_1467=l9_1451.y;
int l9_1468=l9_1454.y;
if (l9_1468==1)
{
l9_1467=fract(l9_1467);
}
else
{
if (l9_1468==2)
{
float l9_1469=fract(l9_1467);
float l9_1470=l9_1467-l9_1469;
float l9_1471=step(0.25,fract(l9_1470*0.5));
l9_1467=mix(l9_1469,1.0-l9_1469,fast::clamp(l9_1471,0.0,1.0));
}
}
l9_1451.y=l9_1467;
if (l9_1455)
{
bool l9_1472=l9_1457;
bool l9_1473;
if (l9_1472)
{
l9_1473=l9_1454.x==3;
}
else
{
l9_1473=l9_1472;
}
float l9_1474=l9_1451.x;
float l9_1475=l9_1456.x;
float l9_1476=l9_1456.z;
bool l9_1477=l9_1473;
float l9_1478=l9_1461;
float l9_1479=fast::clamp(l9_1474,l9_1475,l9_1476);
float l9_1480=step(abs(l9_1474-l9_1479),9.9999997e-06);
l9_1478*=(l9_1480+((1.0-float(l9_1477))*(1.0-l9_1480)));
l9_1474=l9_1479;
l9_1451.x=l9_1474;
l9_1461=l9_1478;
bool l9_1481=l9_1457;
bool l9_1482;
if (l9_1481)
{
l9_1482=l9_1454.y==3;
}
else
{
l9_1482=l9_1481;
}
float l9_1483=l9_1451.y;
float l9_1484=l9_1456.y;
float l9_1485=l9_1456.w;
bool l9_1486=l9_1482;
float l9_1487=l9_1461;
float l9_1488=fast::clamp(l9_1483,l9_1484,l9_1485);
float l9_1489=step(abs(l9_1483-l9_1488),9.9999997e-06);
l9_1487*=(l9_1489+((1.0-float(l9_1486))*(1.0-l9_1489)));
l9_1483=l9_1488;
l9_1451.y=l9_1483;
l9_1461=l9_1487;
}
float2 l9_1490=l9_1451;
bool l9_1491=l9_1452;
float3x3 l9_1492=l9_1453;
if (l9_1491)
{
l9_1490=float2((l9_1492*float3(l9_1490,1.0)).xy);
}
float2 l9_1493=l9_1490;
float2 l9_1494=l9_1493;
float2 l9_1495=l9_1494;
l9_1451=l9_1495;
float l9_1496=l9_1451.x;
int l9_1497=l9_1454.x;
bool l9_1498=l9_1460;
float l9_1499=l9_1461;
if ((l9_1497==0)||(l9_1497==3))
{
float l9_1500=l9_1496;
float l9_1501=0.0;
float l9_1502=1.0;
bool l9_1503=l9_1498;
float l9_1504=l9_1499;
float l9_1505=fast::clamp(l9_1500,l9_1501,l9_1502);
float l9_1506=step(abs(l9_1500-l9_1505),9.9999997e-06);
l9_1504*=(l9_1506+((1.0-float(l9_1503))*(1.0-l9_1506)));
l9_1500=l9_1505;
l9_1496=l9_1500;
l9_1499=l9_1504;
}
l9_1451.x=l9_1496;
l9_1461=l9_1499;
float l9_1507=l9_1451.y;
int l9_1508=l9_1454.y;
bool l9_1509=l9_1460;
float l9_1510=l9_1461;
if ((l9_1508==0)||(l9_1508==3))
{
float l9_1511=l9_1507;
float l9_1512=0.0;
float l9_1513=1.0;
bool l9_1514=l9_1509;
float l9_1515=l9_1510;
float l9_1516=fast::clamp(l9_1511,l9_1512,l9_1513);
float l9_1517=step(abs(l9_1511-l9_1516),9.9999997e-06);
l9_1515*=(l9_1517+((1.0-float(l9_1514))*(1.0-l9_1517)));
l9_1511=l9_1516;
l9_1507=l9_1511;
l9_1510=l9_1515;
}
l9_1451.y=l9_1507;
l9_1461=l9_1510;
float2 l9_1518=l9_1451;
int l9_1519=l9_1449;
int l9_1520=l9_1450;
float l9_1521=l9_1459;
float2 l9_1522=l9_1518;
int l9_1523=l9_1519;
int l9_1524=l9_1520;
float3 l9_1525=float3(0.0);
if (l9_1523==0)
{
l9_1525=float3(l9_1522,0.0);
}
else
{
if (l9_1523==1)
{
l9_1525=float3(l9_1522.x,(l9_1522.y*0.5)+(0.5-(float(l9_1524)*0.5)),0.0);
}
else
{
l9_1525=float3(l9_1522,float(l9_1524));
}
}
float3 l9_1526=l9_1525;
float3 l9_1527=l9_1526;
float2 l9_1528=l9_1527.xy;
float l9_1529=l9_1521;
float4 l9_1530=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1528,bias(l9_1529));
float4 l9_1531=l9_1530;
float4 l9_1532=l9_1531;
if (l9_1457)
{
l9_1532=mix(l9_1458,l9_1532,float4(l9_1461));
}
float4 l9_1533=l9_1532;
float4 l9_1534=l9_1533;
l9_1426=l9_1534;
l9_1411=l9_1426;
l9_1414=l9_1411;
}
else
{
float2 l9_1535=float2(0.0);
l9_1535=l9_1413.Surface_UVCoord0;
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
float2 l9_1547=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_1548=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_1549=l9_1536;
float l9_1550=l9_1543;
float l9_1551=l9_1545;
float l9_1552=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_1553=l9_1413;
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
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
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
int l9_1569=repelflipbookTexLayout_tmp;
int l9_1570=l9_1568;
float2 l9_1571=l9_1554;
bool l9_1572=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_1573=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_1574=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_1575=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_1576=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_1577=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_1578=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
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
float4 l9_1650=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_1648,bias(l9_1649));
float4 l9_1651=l9_1650;
float4 l9_1652=l9_1651;
if (l9_1577)
{
l9_1652=mix(l9_1578,l9_1652,float4(l9_1581));
}
float4 l9_1653=l9_1652;
float4 l9_1654=l9_1653;
l9_1546=l9_1654;
l9_1412=l9_1546;
l9_1414=l9_1412;
}
l9_1410=l9_1414;
float l9_1655=0.0;
float4 l9_1656=l9_1410;
float l9_1657=l9_1656.x;
l9_1655=l9_1657;
l9_1403=l9_1655;
l9_1409=l9_1403;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==1)
{
float4 l9_1658=float4(0.0);
float4 l9_1659=float4(1.0);
float4 l9_1660=float4(0.0);
ssGlobals l9_1661=l9_1408;
float4 l9_1662;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_1663=float2(0.0);
l9_1663=l9_1661.Surface_UVCoord0;
float2 l9_1664=float2(0.0);
float2 l9_1665=l9_1663;
float l9_1666=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1667=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1668=sin(radians(l9_1666));
float l9_1669=cos(radians(l9_1666));
float2 l9_1670=l9_1665-l9_1667;
l9_1670=float2(dot(float2(l9_1669,l9_1668),l9_1670),dot(float2(-l9_1668,l9_1669),l9_1670))+l9_1667;
l9_1664=l9_1670;
float l9_1671=0.0;
l9_1671=gParticle.Index1DPerCopyF;
float l9_1672=0.0;
l9_1672=gParticle.Ratio1DPerCopy;
float l9_1673=0.0;
l9_1673=(((l9_1672-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1674=float4(0.0);
float2 l9_1675=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1676=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1677=l9_1664;
float l9_1678=l9_1671;
float l9_1679=l9_1673;
float l9_1680=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1681=l9_1661;
float2 l9_1682=float2(0.0);
float l9_1683=floor(l9_1675.x);
float l9_1684=floor(l9_1675.y);
float l9_1685=1.0/l9_1683;
float l9_1686=1.0/l9_1684;
float l9_1687=fast::min(l9_1683*l9_1684,floor(l9_1676));
float l9_1688=floor(mod(((l9_1681.gTimeElapsedShifted+l9_1680)*l9_1679)+floor(l9_1678),l9_1687));
float l9_1689=floor(l9_1688/l9_1683);
float l9_1690=mod(l9_1688,l9_1683);
l9_1682=float2((l9_1685*l9_1677.x)+(l9_1690*l9_1685),((1.0-l9_1686)-(l9_1689*l9_1686))+(l9_1686*l9_1677.y));
int l9_1691=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1692=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1692=0;
}
else
{
l9_1692=in.varStereoViewID;
}
int l9_1693=l9_1692;
l9_1691=1-l9_1693;
}
else
{
int l9_1694=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1694=0;
}
else
{
l9_1694=in.varStereoViewID;
}
int l9_1695=l9_1694;
l9_1691=l9_1695;
}
int l9_1696=l9_1691;
int l9_1697=flipbookTexLayout_tmp;
int l9_1698=l9_1696;
float2 l9_1699=l9_1682;
bool l9_1700=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1701=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1702=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1703=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1704=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1705=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1706=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1707=0.0;
bool l9_1708=l9_1705&&(!l9_1703);
float l9_1709=1.0;
float l9_1710=l9_1699.x;
int l9_1711=l9_1702.x;
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
l9_1699.x=l9_1710;
float l9_1715=l9_1699.y;
int l9_1716=l9_1702.y;
if (l9_1716==1)
{
l9_1715=fract(l9_1715);
}
else
{
if (l9_1716==2)
{
float l9_1717=fract(l9_1715);
float l9_1718=l9_1715-l9_1717;
float l9_1719=step(0.25,fract(l9_1718*0.5));
l9_1715=mix(l9_1717,1.0-l9_1717,fast::clamp(l9_1719,0.0,1.0));
}
}
l9_1699.y=l9_1715;
if (l9_1703)
{
bool l9_1720=l9_1705;
bool l9_1721;
if (l9_1720)
{
l9_1721=l9_1702.x==3;
}
else
{
l9_1721=l9_1720;
}
float l9_1722=l9_1699.x;
float l9_1723=l9_1704.x;
float l9_1724=l9_1704.z;
bool l9_1725=l9_1721;
float l9_1726=l9_1709;
float l9_1727=fast::clamp(l9_1722,l9_1723,l9_1724);
float l9_1728=step(abs(l9_1722-l9_1727),9.9999997e-06);
l9_1726*=(l9_1728+((1.0-float(l9_1725))*(1.0-l9_1728)));
l9_1722=l9_1727;
l9_1699.x=l9_1722;
l9_1709=l9_1726;
bool l9_1729=l9_1705;
bool l9_1730;
if (l9_1729)
{
l9_1730=l9_1702.y==3;
}
else
{
l9_1730=l9_1729;
}
float l9_1731=l9_1699.y;
float l9_1732=l9_1704.y;
float l9_1733=l9_1704.w;
bool l9_1734=l9_1730;
float l9_1735=l9_1709;
float l9_1736=fast::clamp(l9_1731,l9_1732,l9_1733);
float l9_1737=step(abs(l9_1731-l9_1736),9.9999997e-06);
l9_1735*=(l9_1737+((1.0-float(l9_1734))*(1.0-l9_1737)));
l9_1731=l9_1736;
l9_1699.y=l9_1731;
l9_1709=l9_1735;
}
float2 l9_1738=l9_1699;
bool l9_1739=l9_1700;
float3x3 l9_1740=l9_1701;
if (l9_1739)
{
l9_1738=float2((l9_1740*float3(l9_1738,1.0)).xy);
}
float2 l9_1741=l9_1738;
float2 l9_1742=l9_1741;
float2 l9_1743=l9_1742;
l9_1699=l9_1743;
float l9_1744=l9_1699.x;
int l9_1745=l9_1702.x;
bool l9_1746=l9_1708;
float l9_1747=l9_1709;
if ((l9_1745==0)||(l9_1745==3))
{
float l9_1748=l9_1744;
float l9_1749=0.0;
float l9_1750=1.0;
bool l9_1751=l9_1746;
float l9_1752=l9_1747;
float l9_1753=fast::clamp(l9_1748,l9_1749,l9_1750);
float l9_1754=step(abs(l9_1748-l9_1753),9.9999997e-06);
l9_1752*=(l9_1754+((1.0-float(l9_1751))*(1.0-l9_1754)));
l9_1748=l9_1753;
l9_1744=l9_1748;
l9_1747=l9_1752;
}
l9_1699.x=l9_1744;
l9_1709=l9_1747;
float l9_1755=l9_1699.y;
int l9_1756=l9_1702.y;
bool l9_1757=l9_1708;
float l9_1758=l9_1709;
if ((l9_1756==0)||(l9_1756==3))
{
float l9_1759=l9_1755;
float l9_1760=0.0;
float l9_1761=1.0;
bool l9_1762=l9_1757;
float l9_1763=l9_1758;
float l9_1764=fast::clamp(l9_1759,l9_1760,l9_1761);
float l9_1765=step(abs(l9_1759-l9_1764),9.9999997e-06);
l9_1763*=(l9_1765+((1.0-float(l9_1762))*(1.0-l9_1765)));
l9_1759=l9_1764;
l9_1755=l9_1759;
l9_1758=l9_1763;
}
l9_1699.y=l9_1755;
l9_1709=l9_1758;
float2 l9_1766=l9_1699;
int l9_1767=l9_1697;
int l9_1768=l9_1698;
float l9_1769=l9_1707;
float2 l9_1770=l9_1766;
int l9_1771=l9_1767;
int l9_1772=l9_1768;
float3 l9_1773=float3(0.0);
if (l9_1771==0)
{
l9_1773=float3(l9_1770,0.0);
}
else
{
if (l9_1771==1)
{
l9_1773=float3(l9_1770.x,(l9_1770.y*0.5)+(0.5-(float(l9_1772)*0.5)),0.0);
}
else
{
l9_1773=float3(l9_1770,float(l9_1772));
}
}
float3 l9_1774=l9_1773;
float3 l9_1775=l9_1774;
float2 l9_1776=l9_1775.xy;
float l9_1777=l9_1769;
float4 l9_1778=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_1776,bias(l9_1777));
float4 l9_1779=l9_1778;
float4 l9_1780=l9_1779;
if (l9_1705)
{
l9_1780=mix(l9_1706,l9_1780,float4(l9_1709));
}
float4 l9_1781=l9_1780;
float4 l9_1782=l9_1781;
l9_1674=l9_1782;
l9_1659=l9_1674;
l9_1662=l9_1659;
}
else
{
float2 l9_1783=float2(0.0);
l9_1783=l9_1661.Surface_UVCoord0;
float2 l9_1784=float2(0.0);
float2 l9_1785=l9_1783;
float l9_1786=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1787=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1788=sin(radians(l9_1786));
float l9_1789=cos(radians(l9_1786));
float2 l9_1790=l9_1785-l9_1787;
l9_1790=float2(dot(float2(l9_1789,l9_1788),l9_1790),dot(float2(-l9_1788,l9_1789),l9_1790))+l9_1787;
l9_1784=l9_1790;
float l9_1791=0.0;
l9_1791=gParticle.Index1DPerCopyF;
float l9_1792=0.0;
l9_1792=gParticle.Ratio1DPerCopy;
float l9_1793=0.0;
l9_1793=(((l9_1792-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1794=float4(0.0);
float2 l9_1795=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_1796=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_1797=l9_1784;
float l9_1798=l9_1791;
float l9_1799=l9_1793;
float l9_1800=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_1801=l9_1661;
float2 l9_1802=float2(0.0);
float l9_1803=floor(l9_1795.x);
float l9_1804=floor(l9_1795.y);
float l9_1805=1.0/l9_1803;
float l9_1806=1.0/l9_1804;
float l9_1807=fast::min(l9_1803*l9_1804,floor(l9_1796));
float l9_1808=floor(mod(((l9_1801.gTimeElapsedShifted+l9_1800)*l9_1799)+floor(l9_1798),l9_1807));
float l9_1809=floor(l9_1808/l9_1803);
float l9_1810=mod(l9_1808,l9_1803);
l9_1802=float2((l9_1805*l9_1797.x)+(l9_1810*l9_1805),((1.0-l9_1806)-(l9_1809*l9_1806))+(l9_1806*l9_1797.y));
int l9_1811=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
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
l9_1811=1-l9_1813;
}
else
{
int l9_1814=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1814=0;
}
else
{
l9_1814=in.varStereoViewID;
}
int l9_1815=l9_1814;
l9_1811=l9_1815;
}
int l9_1816=l9_1811;
int l9_1817=repelflipbookTexLayout_tmp;
int l9_1818=l9_1816;
float2 l9_1819=l9_1802;
bool l9_1820=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_1821=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_1822=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_1823=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_1824=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_1825=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_1826=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_1827=0.0;
bool l9_1828=l9_1825&&(!l9_1823);
float l9_1829=1.0;
float l9_1830=l9_1819.x;
int l9_1831=l9_1822.x;
if (l9_1831==1)
{
l9_1830=fract(l9_1830);
}
else
{
if (l9_1831==2)
{
float l9_1832=fract(l9_1830);
float l9_1833=l9_1830-l9_1832;
float l9_1834=step(0.25,fract(l9_1833*0.5));
l9_1830=mix(l9_1832,1.0-l9_1832,fast::clamp(l9_1834,0.0,1.0));
}
}
l9_1819.x=l9_1830;
float l9_1835=l9_1819.y;
int l9_1836=l9_1822.y;
if (l9_1836==1)
{
l9_1835=fract(l9_1835);
}
else
{
if (l9_1836==2)
{
float l9_1837=fract(l9_1835);
float l9_1838=l9_1835-l9_1837;
float l9_1839=step(0.25,fract(l9_1838*0.5));
l9_1835=mix(l9_1837,1.0-l9_1837,fast::clamp(l9_1839,0.0,1.0));
}
}
l9_1819.y=l9_1835;
if (l9_1823)
{
bool l9_1840=l9_1825;
bool l9_1841;
if (l9_1840)
{
l9_1841=l9_1822.x==3;
}
else
{
l9_1841=l9_1840;
}
float l9_1842=l9_1819.x;
float l9_1843=l9_1824.x;
float l9_1844=l9_1824.z;
bool l9_1845=l9_1841;
float l9_1846=l9_1829;
float l9_1847=fast::clamp(l9_1842,l9_1843,l9_1844);
float l9_1848=step(abs(l9_1842-l9_1847),9.9999997e-06);
l9_1846*=(l9_1848+((1.0-float(l9_1845))*(1.0-l9_1848)));
l9_1842=l9_1847;
l9_1819.x=l9_1842;
l9_1829=l9_1846;
bool l9_1849=l9_1825;
bool l9_1850;
if (l9_1849)
{
l9_1850=l9_1822.y==3;
}
else
{
l9_1850=l9_1849;
}
float l9_1851=l9_1819.y;
float l9_1852=l9_1824.y;
float l9_1853=l9_1824.w;
bool l9_1854=l9_1850;
float l9_1855=l9_1829;
float l9_1856=fast::clamp(l9_1851,l9_1852,l9_1853);
float l9_1857=step(abs(l9_1851-l9_1856),9.9999997e-06);
l9_1855*=(l9_1857+((1.0-float(l9_1854))*(1.0-l9_1857)));
l9_1851=l9_1856;
l9_1819.y=l9_1851;
l9_1829=l9_1855;
}
float2 l9_1858=l9_1819;
bool l9_1859=l9_1820;
float3x3 l9_1860=l9_1821;
if (l9_1859)
{
l9_1858=float2((l9_1860*float3(l9_1858,1.0)).xy);
}
float2 l9_1861=l9_1858;
float2 l9_1862=l9_1861;
float2 l9_1863=l9_1862;
l9_1819=l9_1863;
float l9_1864=l9_1819.x;
int l9_1865=l9_1822.x;
bool l9_1866=l9_1828;
float l9_1867=l9_1829;
if ((l9_1865==0)||(l9_1865==3))
{
float l9_1868=l9_1864;
float l9_1869=0.0;
float l9_1870=1.0;
bool l9_1871=l9_1866;
float l9_1872=l9_1867;
float l9_1873=fast::clamp(l9_1868,l9_1869,l9_1870);
float l9_1874=step(abs(l9_1868-l9_1873),9.9999997e-06);
l9_1872*=(l9_1874+((1.0-float(l9_1871))*(1.0-l9_1874)));
l9_1868=l9_1873;
l9_1864=l9_1868;
l9_1867=l9_1872;
}
l9_1819.x=l9_1864;
l9_1829=l9_1867;
float l9_1875=l9_1819.y;
int l9_1876=l9_1822.y;
bool l9_1877=l9_1828;
float l9_1878=l9_1829;
if ((l9_1876==0)||(l9_1876==3))
{
float l9_1879=l9_1875;
float l9_1880=0.0;
float l9_1881=1.0;
bool l9_1882=l9_1877;
float l9_1883=l9_1878;
float l9_1884=fast::clamp(l9_1879,l9_1880,l9_1881);
float l9_1885=step(abs(l9_1879-l9_1884),9.9999997e-06);
l9_1883*=(l9_1885+((1.0-float(l9_1882))*(1.0-l9_1885)));
l9_1879=l9_1884;
l9_1875=l9_1879;
l9_1878=l9_1883;
}
l9_1819.y=l9_1875;
l9_1829=l9_1878;
float2 l9_1886=l9_1819;
int l9_1887=l9_1817;
int l9_1888=l9_1818;
float l9_1889=l9_1827;
float2 l9_1890=l9_1886;
int l9_1891=l9_1887;
int l9_1892=l9_1888;
float3 l9_1893=float3(0.0);
if (l9_1891==0)
{
l9_1893=float3(l9_1890,0.0);
}
else
{
if (l9_1891==1)
{
l9_1893=float3(l9_1890.x,(l9_1890.y*0.5)+(0.5-(float(l9_1892)*0.5)),0.0);
}
else
{
l9_1893=float3(l9_1890,float(l9_1892));
}
}
float3 l9_1894=l9_1893;
float3 l9_1895=l9_1894;
float2 l9_1896=l9_1895.xy;
float l9_1897=l9_1889;
float4 l9_1898=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_1896,bias(l9_1897));
float4 l9_1899=l9_1898;
float4 l9_1900=l9_1899;
if (l9_1825)
{
l9_1900=mix(l9_1826,l9_1900,float4(l9_1829));
}
float4 l9_1901=l9_1900;
float4 l9_1902=l9_1901;
l9_1794=l9_1902;
l9_1660=l9_1794;
l9_1662=l9_1660;
}
l9_1658=l9_1662;
float l9_1903=0.0;
float4 l9_1904=l9_1658;
float l9_1905=l9_1904.y;
l9_1903=l9_1905;
l9_1404=l9_1903;
l9_1409=l9_1404;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==2)
{
float4 l9_1906=float4(0.0);
float4 l9_1907=float4(1.0);
float4 l9_1908=float4(0.0);
ssGlobals l9_1909=l9_1408;
float4 l9_1910;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_1911=float2(0.0);
l9_1911=l9_1909.Surface_UVCoord0;
float2 l9_1912=float2(0.0);
float2 l9_1913=l9_1911;
float l9_1914=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_1915=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_1916=sin(radians(l9_1914));
float l9_1917=cos(radians(l9_1914));
float2 l9_1918=l9_1913-l9_1915;
l9_1918=float2(dot(float2(l9_1917,l9_1916),l9_1918),dot(float2(-l9_1916,l9_1917),l9_1918))+l9_1915;
l9_1912=l9_1918;
float l9_1919=0.0;
l9_1919=gParticle.Index1DPerCopyF;
float l9_1920=0.0;
l9_1920=gParticle.Ratio1DPerCopy;
float l9_1921=0.0;
l9_1921=(((l9_1920-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_1922=float4(0.0);
float2 l9_1923=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_1924=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_1925=l9_1912;
float l9_1926=l9_1919;
float l9_1927=l9_1921;
float l9_1928=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_1929=l9_1909;
float2 l9_1930=float2(0.0);
float l9_1931=floor(l9_1923.x);
float l9_1932=floor(l9_1923.y);
float l9_1933=1.0/l9_1931;
float l9_1934=1.0/l9_1932;
float l9_1935=fast::min(l9_1931*l9_1932,floor(l9_1924));
float l9_1936=floor(mod(((l9_1929.gTimeElapsedShifted+l9_1928)*l9_1927)+floor(l9_1926),l9_1935));
float l9_1937=floor(l9_1936/l9_1931);
float l9_1938=mod(l9_1936,l9_1931);
l9_1930=float2((l9_1933*l9_1925.x)+(l9_1938*l9_1933),((1.0-l9_1934)-(l9_1937*l9_1934))+(l9_1934*l9_1925.y));
int l9_1939=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_1940=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1940=0;
}
else
{
l9_1940=in.varStereoViewID;
}
int l9_1941=l9_1940;
l9_1939=1-l9_1941;
}
else
{
int l9_1942=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1942=0;
}
else
{
l9_1942=in.varStereoViewID;
}
int l9_1943=l9_1942;
l9_1939=l9_1943;
}
int l9_1944=l9_1939;
int l9_1945=flipbookTexLayout_tmp;
int l9_1946=l9_1944;
float2 l9_1947=l9_1930;
bool l9_1948=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_1949=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_1950=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_1951=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_1952=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_1953=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_1954=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_1955=0.0;
bool l9_1956=l9_1953&&(!l9_1951);
float l9_1957=1.0;
float l9_1958=l9_1947.x;
int l9_1959=l9_1950.x;
if (l9_1959==1)
{
l9_1958=fract(l9_1958);
}
else
{
if (l9_1959==2)
{
float l9_1960=fract(l9_1958);
float l9_1961=l9_1958-l9_1960;
float l9_1962=step(0.25,fract(l9_1961*0.5));
l9_1958=mix(l9_1960,1.0-l9_1960,fast::clamp(l9_1962,0.0,1.0));
}
}
l9_1947.x=l9_1958;
float l9_1963=l9_1947.y;
int l9_1964=l9_1950.y;
if (l9_1964==1)
{
l9_1963=fract(l9_1963);
}
else
{
if (l9_1964==2)
{
float l9_1965=fract(l9_1963);
float l9_1966=l9_1963-l9_1965;
float l9_1967=step(0.25,fract(l9_1966*0.5));
l9_1963=mix(l9_1965,1.0-l9_1965,fast::clamp(l9_1967,0.0,1.0));
}
}
l9_1947.y=l9_1963;
if (l9_1951)
{
bool l9_1968=l9_1953;
bool l9_1969;
if (l9_1968)
{
l9_1969=l9_1950.x==3;
}
else
{
l9_1969=l9_1968;
}
float l9_1970=l9_1947.x;
float l9_1971=l9_1952.x;
float l9_1972=l9_1952.z;
bool l9_1973=l9_1969;
float l9_1974=l9_1957;
float l9_1975=fast::clamp(l9_1970,l9_1971,l9_1972);
float l9_1976=step(abs(l9_1970-l9_1975),9.9999997e-06);
l9_1974*=(l9_1976+((1.0-float(l9_1973))*(1.0-l9_1976)));
l9_1970=l9_1975;
l9_1947.x=l9_1970;
l9_1957=l9_1974;
bool l9_1977=l9_1953;
bool l9_1978;
if (l9_1977)
{
l9_1978=l9_1950.y==3;
}
else
{
l9_1978=l9_1977;
}
float l9_1979=l9_1947.y;
float l9_1980=l9_1952.y;
float l9_1981=l9_1952.w;
bool l9_1982=l9_1978;
float l9_1983=l9_1957;
float l9_1984=fast::clamp(l9_1979,l9_1980,l9_1981);
float l9_1985=step(abs(l9_1979-l9_1984),9.9999997e-06);
l9_1983*=(l9_1985+((1.0-float(l9_1982))*(1.0-l9_1985)));
l9_1979=l9_1984;
l9_1947.y=l9_1979;
l9_1957=l9_1983;
}
float2 l9_1986=l9_1947;
bool l9_1987=l9_1948;
float3x3 l9_1988=l9_1949;
if (l9_1987)
{
l9_1986=float2((l9_1988*float3(l9_1986,1.0)).xy);
}
float2 l9_1989=l9_1986;
float2 l9_1990=l9_1989;
float2 l9_1991=l9_1990;
l9_1947=l9_1991;
float l9_1992=l9_1947.x;
int l9_1993=l9_1950.x;
bool l9_1994=l9_1956;
float l9_1995=l9_1957;
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
l9_1947.x=l9_1992;
l9_1957=l9_1995;
float l9_2003=l9_1947.y;
int l9_2004=l9_1950.y;
bool l9_2005=l9_1956;
float l9_2006=l9_1957;
if ((l9_2004==0)||(l9_2004==3))
{
float l9_2007=l9_2003;
float l9_2008=0.0;
float l9_2009=1.0;
bool l9_2010=l9_2005;
float l9_2011=l9_2006;
float l9_2012=fast::clamp(l9_2007,l9_2008,l9_2009);
float l9_2013=step(abs(l9_2007-l9_2012),9.9999997e-06);
l9_2011*=(l9_2013+((1.0-float(l9_2010))*(1.0-l9_2013)));
l9_2007=l9_2012;
l9_2003=l9_2007;
l9_2006=l9_2011;
}
l9_1947.y=l9_2003;
l9_1957=l9_2006;
float2 l9_2014=l9_1947;
int l9_2015=l9_1945;
int l9_2016=l9_1946;
float l9_2017=l9_1955;
float2 l9_2018=l9_2014;
int l9_2019=l9_2015;
int l9_2020=l9_2016;
float3 l9_2021=float3(0.0);
if (l9_2019==0)
{
l9_2021=float3(l9_2018,0.0);
}
else
{
if (l9_2019==1)
{
l9_2021=float3(l9_2018.x,(l9_2018.y*0.5)+(0.5-(float(l9_2020)*0.5)),0.0);
}
else
{
l9_2021=float3(l9_2018,float(l9_2020));
}
}
float3 l9_2022=l9_2021;
float3 l9_2023=l9_2022;
float2 l9_2024=l9_2023.xy;
float l9_2025=l9_2017;
float4 l9_2026=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2024,bias(l9_2025));
float4 l9_2027=l9_2026;
float4 l9_2028=l9_2027;
if (l9_1953)
{
l9_2028=mix(l9_1954,l9_2028,float4(l9_1957));
}
float4 l9_2029=l9_2028;
float4 l9_2030=l9_2029;
l9_1922=l9_2030;
l9_1907=l9_1922;
l9_1910=l9_1907;
}
else
{
float2 l9_2031=float2(0.0);
l9_2031=l9_1909.Surface_UVCoord0;
float2 l9_2032=float2(0.0);
float2 l9_2033=l9_2031;
float l9_2034=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2035=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2036=sin(radians(l9_2034));
float l9_2037=cos(radians(l9_2034));
float2 l9_2038=l9_2033-l9_2035;
l9_2038=float2(dot(float2(l9_2037,l9_2036),l9_2038),dot(float2(-l9_2036,l9_2037),l9_2038))+l9_2035;
l9_2032=l9_2038;
float l9_2039=0.0;
l9_2039=gParticle.Index1DPerCopyF;
float l9_2040=0.0;
l9_2040=gParticle.Ratio1DPerCopy;
float l9_2041=0.0;
l9_2041=(((l9_2040-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2042=float4(0.0);
float2 l9_2043=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2044=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2045=l9_2032;
float l9_2046=l9_2039;
float l9_2047=l9_2041;
float l9_2048=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2049=l9_1909;
float2 l9_2050=float2(0.0);
float l9_2051=floor(l9_2043.x);
float l9_2052=floor(l9_2043.y);
float l9_2053=1.0/l9_2051;
float l9_2054=1.0/l9_2052;
float l9_2055=fast::min(l9_2051*l9_2052,floor(l9_2044));
float l9_2056=floor(mod(((l9_2049.gTimeElapsedShifted+l9_2048)*l9_2047)+floor(l9_2046),l9_2055));
float l9_2057=floor(l9_2056/l9_2051);
float l9_2058=mod(l9_2056,l9_2051);
l9_2050=float2((l9_2053*l9_2045.x)+(l9_2058*l9_2053),((1.0-l9_2054)-(l9_2057*l9_2054))+(l9_2054*l9_2045.y));
int l9_2059=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2060=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2060=0;
}
else
{
l9_2060=in.varStereoViewID;
}
int l9_2061=l9_2060;
l9_2059=1-l9_2061;
}
else
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
l9_2059=l9_2063;
}
int l9_2064=l9_2059;
int l9_2065=repelflipbookTexLayout_tmp;
int l9_2066=l9_2064;
float2 l9_2067=l9_2050;
bool l9_2068=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2069=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2070=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2071=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2072=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2073=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2074=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_2075=0.0;
bool l9_2076=l9_2073&&(!l9_2071);
float l9_2077=1.0;
float l9_2078=l9_2067.x;
int l9_2079=l9_2070.x;
if (l9_2079==1)
{
l9_2078=fract(l9_2078);
}
else
{
if (l9_2079==2)
{
float l9_2080=fract(l9_2078);
float l9_2081=l9_2078-l9_2080;
float l9_2082=step(0.25,fract(l9_2081*0.5));
l9_2078=mix(l9_2080,1.0-l9_2080,fast::clamp(l9_2082,0.0,1.0));
}
}
l9_2067.x=l9_2078;
float l9_2083=l9_2067.y;
int l9_2084=l9_2070.y;
if (l9_2084==1)
{
l9_2083=fract(l9_2083);
}
else
{
if (l9_2084==2)
{
float l9_2085=fract(l9_2083);
float l9_2086=l9_2083-l9_2085;
float l9_2087=step(0.25,fract(l9_2086*0.5));
l9_2083=mix(l9_2085,1.0-l9_2085,fast::clamp(l9_2087,0.0,1.0));
}
}
l9_2067.y=l9_2083;
if (l9_2071)
{
bool l9_2088=l9_2073;
bool l9_2089;
if (l9_2088)
{
l9_2089=l9_2070.x==3;
}
else
{
l9_2089=l9_2088;
}
float l9_2090=l9_2067.x;
float l9_2091=l9_2072.x;
float l9_2092=l9_2072.z;
bool l9_2093=l9_2089;
float l9_2094=l9_2077;
float l9_2095=fast::clamp(l9_2090,l9_2091,l9_2092);
float l9_2096=step(abs(l9_2090-l9_2095),9.9999997e-06);
l9_2094*=(l9_2096+((1.0-float(l9_2093))*(1.0-l9_2096)));
l9_2090=l9_2095;
l9_2067.x=l9_2090;
l9_2077=l9_2094;
bool l9_2097=l9_2073;
bool l9_2098;
if (l9_2097)
{
l9_2098=l9_2070.y==3;
}
else
{
l9_2098=l9_2097;
}
float l9_2099=l9_2067.y;
float l9_2100=l9_2072.y;
float l9_2101=l9_2072.w;
bool l9_2102=l9_2098;
float l9_2103=l9_2077;
float l9_2104=fast::clamp(l9_2099,l9_2100,l9_2101);
float l9_2105=step(abs(l9_2099-l9_2104),9.9999997e-06);
l9_2103*=(l9_2105+((1.0-float(l9_2102))*(1.0-l9_2105)));
l9_2099=l9_2104;
l9_2067.y=l9_2099;
l9_2077=l9_2103;
}
float2 l9_2106=l9_2067;
bool l9_2107=l9_2068;
float3x3 l9_2108=l9_2069;
if (l9_2107)
{
l9_2106=float2((l9_2108*float3(l9_2106,1.0)).xy);
}
float2 l9_2109=l9_2106;
float2 l9_2110=l9_2109;
float2 l9_2111=l9_2110;
l9_2067=l9_2111;
float l9_2112=l9_2067.x;
int l9_2113=l9_2070.x;
bool l9_2114=l9_2076;
float l9_2115=l9_2077;
if ((l9_2113==0)||(l9_2113==3))
{
float l9_2116=l9_2112;
float l9_2117=0.0;
float l9_2118=1.0;
bool l9_2119=l9_2114;
float l9_2120=l9_2115;
float l9_2121=fast::clamp(l9_2116,l9_2117,l9_2118);
float l9_2122=step(abs(l9_2116-l9_2121),9.9999997e-06);
l9_2120*=(l9_2122+((1.0-float(l9_2119))*(1.0-l9_2122)));
l9_2116=l9_2121;
l9_2112=l9_2116;
l9_2115=l9_2120;
}
l9_2067.x=l9_2112;
l9_2077=l9_2115;
float l9_2123=l9_2067.y;
int l9_2124=l9_2070.y;
bool l9_2125=l9_2076;
float l9_2126=l9_2077;
if ((l9_2124==0)||(l9_2124==3))
{
float l9_2127=l9_2123;
float l9_2128=0.0;
float l9_2129=1.0;
bool l9_2130=l9_2125;
float l9_2131=l9_2126;
float l9_2132=fast::clamp(l9_2127,l9_2128,l9_2129);
float l9_2133=step(abs(l9_2127-l9_2132),9.9999997e-06);
l9_2131*=(l9_2133+((1.0-float(l9_2130))*(1.0-l9_2133)));
l9_2127=l9_2132;
l9_2123=l9_2127;
l9_2126=l9_2131;
}
l9_2067.y=l9_2123;
l9_2077=l9_2126;
float2 l9_2134=l9_2067;
int l9_2135=l9_2065;
int l9_2136=l9_2066;
float l9_2137=l9_2075;
float2 l9_2138=l9_2134;
int l9_2139=l9_2135;
int l9_2140=l9_2136;
float3 l9_2141=float3(0.0);
if (l9_2139==0)
{
l9_2141=float3(l9_2138,0.0);
}
else
{
if (l9_2139==1)
{
l9_2141=float3(l9_2138.x,(l9_2138.y*0.5)+(0.5-(float(l9_2140)*0.5)),0.0);
}
else
{
l9_2141=float3(l9_2138,float(l9_2140));
}
}
float3 l9_2142=l9_2141;
float3 l9_2143=l9_2142;
float2 l9_2144=l9_2143.xy;
float l9_2145=l9_2137;
float4 l9_2146=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_2144,bias(l9_2145));
float4 l9_2147=l9_2146;
float4 l9_2148=l9_2147;
if (l9_2073)
{
l9_2148=mix(l9_2074,l9_2148,float4(l9_2077));
}
float4 l9_2149=l9_2148;
float4 l9_2150=l9_2149;
l9_2042=l9_2150;
l9_1908=l9_2042;
l9_1910=l9_1908;
}
l9_1906=l9_1910;
float l9_2151=0.0;
float4 l9_2152=l9_1906;
float l9_2153=l9_2152.z;
l9_2151=l9_2153;
l9_1405=l9_2151;
l9_1409=l9_1405;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==3)
{
float4 l9_2154=float4(0.0);
float4 l9_2155=float4(1.0);
float4 l9_2156=float4(0.0);
ssGlobals l9_2157=l9_1408;
float4 l9_2158;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_2159=float2(0.0);
l9_2159=l9_2157.Surface_UVCoord0;
float2 l9_2160=float2(0.0);
float2 l9_2161=l9_2159;
float l9_2162=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2163=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2164=sin(radians(l9_2162));
float l9_2165=cos(radians(l9_2162));
float2 l9_2166=l9_2161-l9_2163;
l9_2166=float2(dot(float2(l9_2165,l9_2164),l9_2166),dot(float2(-l9_2164,l9_2165),l9_2166))+l9_2163;
l9_2160=l9_2166;
float l9_2167=0.0;
l9_2167=gParticle.Index1DPerCopyF;
float l9_2168=0.0;
l9_2168=gParticle.Ratio1DPerCopy;
float l9_2169=0.0;
l9_2169=(((l9_2168-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2170=float4(0.0);
float2 l9_2171=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2172=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2173=l9_2160;
float l9_2174=l9_2167;
float l9_2175=l9_2169;
float l9_2176=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2177=l9_2157;
float2 l9_2178=float2(0.0);
float l9_2179=floor(l9_2171.x);
float l9_2180=floor(l9_2171.y);
float l9_2181=1.0/l9_2179;
float l9_2182=1.0/l9_2180;
float l9_2183=fast::min(l9_2179*l9_2180,floor(l9_2172));
float l9_2184=floor(mod(((l9_2177.gTimeElapsedShifted+l9_2176)*l9_2175)+floor(l9_2174),l9_2183));
float l9_2185=floor(l9_2184/l9_2179);
float l9_2186=mod(l9_2184,l9_2179);
l9_2178=float2((l9_2181*l9_2173.x)+(l9_2186*l9_2181),((1.0-l9_2182)-(l9_2185*l9_2182))+(l9_2182*l9_2173.y));
int l9_2187=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2188=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2188=0;
}
else
{
l9_2188=in.varStereoViewID;
}
int l9_2189=l9_2188;
l9_2187=1-l9_2189;
}
else
{
int l9_2190=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2190=0;
}
else
{
l9_2190=in.varStereoViewID;
}
int l9_2191=l9_2190;
l9_2187=l9_2191;
}
int l9_2192=l9_2187;
int l9_2193=flipbookTexLayout_tmp;
int l9_2194=l9_2192;
float2 l9_2195=l9_2178;
bool l9_2196=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2197=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2198=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2199=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2200=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2201=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2202=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2203=0.0;
bool l9_2204=l9_2201&&(!l9_2199);
float l9_2205=1.0;
float l9_2206=l9_2195.x;
int l9_2207=l9_2198.x;
if (l9_2207==1)
{
l9_2206=fract(l9_2206);
}
else
{
if (l9_2207==2)
{
float l9_2208=fract(l9_2206);
float l9_2209=l9_2206-l9_2208;
float l9_2210=step(0.25,fract(l9_2209*0.5));
l9_2206=mix(l9_2208,1.0-l9_2208,fast::clamp(l9_2210,0.0,1.0));
}
}
l9_2195.x=l9_2206;
float l9_2211=l9_2195.y;
int l9_2212=l9_2198.y;
if (l9_2212==1)
{
l9_2211=fract(l9_2211);
}
else
{
if (l9_2212==2)
{
float l9_2213=fract(l9_2211);
float l9_2214=l9_2211-l9_2213;
float l9_2215=step(0.25,fract(l9_2214*0.5));
l9_2211=mix(l9_2213,1.0-l9_2213,fast::clamp(l9_2215,0.0,1.0));
}
}
l9_2195.y=l9_2211;
if (l9_2199)
{
bool l9_2216=l9_2201;
bool l9_2217;
if (l9_2216)
{
l9_2217=l9_2198.x==3;
}
else
{
l9_2217=l9_2216;
}
float l9_2218=l9_2195.x;
float l9_2219=l9_2200.x;
float l9_2220=l9_2200.z;
bool l9_2221=l9_2217;
float l9_2222=l9_2205;
float l9_2223=fast::clamp(l9_2218,l9_2219,l9_2220);
float l9_2224=step(abs(l9_2218-l9_2223),9.9999997e-06);
l9_2222*=(l9_2224+((1.0-float(l9_2221))*(1.0-l9_2224)));
l9_2218=l9_2223;
l9_2195.x=l9_2218;
l9_2205=l9_2222;
bool l9_2225=l9_2201;
bool l9_2226;
if (l9_2225)
{
l9_2226=l9_2198.y==3;
}
else
{
l9_2226=l9_2225;
}
float l9_2227=l9_2195.y;
float l9_2228=l9_2200.y;
float l9_2229=l9_2200.w;
bool l9_2230=l9_2226;
float l9_2231=l9_2205;
float l9_2232=fast::clamp(l9_2227,l9_2228,l9_2229);
float l9_2233=step(abs(l9_2227-l9_2232),9.9999997e-06);
l9_2231*=(l9_2233+((1.0-float(l9_2230))*(1.0-l9_2233)));
l9_2227=l9_2232;
l9_2195.y=l9_2227;
l9_2205=l9_2231;
}
float2 l9_2234=l9_2195;
bool l9_2235=l9_2196;
float3x3 l9_2236=l9_2197;
if (l9_2235)
{
l9_2234=float2((l9_2236*float3(l9_2234,1.0)).xy);
}
float2 l9_2237=l9_2234;
float2 l9_2238=l9_2237;
float2 l9_2239=l9_2238;
l9_2195=l9_2239;
float l9_2240=l9_2195.x;
int l9_2241=l9_2198.x;
bool l9_2242=l9_2204;
float l9_2243=l9_2205;
if ((l9_2241==0)||(l9_2241==3))
{
float l9_2244=l9_2240;
float l9_2245=0.0;
float l9_2246=1.0;
bool l9_2247=l9_2242;
float l9_2248=l9_2243;
float l9_2249=fast::clamp(l9_2244,l9_2245,l9_2246);
float l9_2250=step(abs(l9_2244-l9_2249),9.9999997e-06);
l9_2248*=(l9_2250+((1.0-float(l9_2247))*(1.0-l9_2250)));
l9_2244=l9_2249;
l9_2240=l9_2244;
l9_2243=l9_2248;
}
l9_2195.x=l9_2240;
l9_2205=l9_2243;
float l9_2251=l9_2195.y;
int l9_2252=l9_2198.y;
bool l9_2253=l9_2204;
float l9_2254=l9_2205;
if ((l9_2252==0)||(l9_2252==3))
{
float l9_2255=l9_2251;
float l9_2256=0.0;
float l9_2257=1.0;
bool l9_2258=l9_2253;
float l9_2259=l9_2254;
float l9_2260=fast::clamp(l9_2255,l9_2256,l9_2257);
float l9_2261=step(abs(l9_2255-l9_2260),9.9999997e-06);
l9_2259*=(l9_2261+((1.0-float(l9_2258))*(1.0-l9_2261)));
l9_2255=l9_2260;
l9_2251=l9_2255;
l9_2254=l9_2259;
}
l9_2195.y=l9_2251;
l9_2205=l9_2254;
float2 l9_2262=l9_2195;
int l9_2263=l9_2193;
int l9_2264=l9_2194;
float l9_2265=l9_2203;
float2 l9_2266=l9_2262;
int l9_2267=l9_2263;
int l9_2268=l9_2264;
float3 l9_2269=float3(0.0);
if (l9_2267==0)
{
l9_2269=float3(l9_2266,0.0);
}
else
{
if (l9_2267==1)
{
l9_2269=float3(l9_2266.x,(l9_2266.y*0.5)+(0.5-(float(l9_2268)*0.5)),0.0);
}
else
{
l9_2269=float3(l9_2266,float(l9_2268));
}
}
float3 l9_2270=l9_2269;
float3 l9_2271=l9_2270;
float2 l9_2272=l9_2271.xy;
float l9_2273=l9_2265;
float4 l9_2274=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2272,bias(l9_2273));
float4 l9_2275=l9_2274;
float4 l9_2276=l9_2275;
if (l9_2201)
{
l9_2276=mix(l9_2202,l9_2276,float4(l9_2205));
}
float4 l9_2277=l9_2276;
float4 l9_2278=l9_2277;
l9_2170=l9_2278;
l9_2155=l9_2170;
l9_2158=l9_2155;
}
else
{
float2 l9_2279=float2(0.0);
l9_2279=l9_2157.Surface_UVCoord0;
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
float2 l9_2291=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2292=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2293=l9_2280;
float l9_2294=l9_2287;
float l9_2295=l9_2289;
float l9_2296=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2297=l9_2157;
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
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
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
int l9_2313=repelflipbookTexLayout_tmp;
int l9_2314=l9_2312;
float2 l9_2315=l9_2298;
bool l9_2316=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2317=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2318=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2319=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2320=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2321=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2322=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
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
float4 l9_2394=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_2392,bias(l9_2393));
float4 l9_2395=l9_2394;
float4 l9_2396=l9_2395;
if (l9_2321)
{
l9_2396=mix(l9_2322,l9_2396,float4(l9_2325));
}
float4 l9_2397=l9_2396;
float4 l9_2398=l9_2397;
l9_2290=l9_2398;
l9_2156=l9_2290;
l9_2158=l9_2156;
}
l9_2154=l9_2158;
float l9_2399=0.0;
float4 l9_2400=l9_2154;
float l9_2401=l9_2400.w;
l9_2399=l9_2401;
l9_1406=l9_2399;
l9_1409=l9_1406;
}
else
{
float4 l9_2402=float4(0.0);
float4 l9_2403=float4(1.0);
float4 l9_2404=float4(0.0);
ssGlobals l9_2405=l9_1408;
float4 l9_2406;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_2407=float2(0.0);
l9_2407=l9_2405.Surface_UVCoord0;
float2 l9_2408=float2(0.0);
float2 l9_2409=l9_2407;
float l9_2410=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2411=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2412=sin(radians(l9_2410));
float l9_2413=cos(radians(l9_2410));
float2 l9_2414=l9_2409-l9_2411;
l9_2414=float2(dot(float2(l9_2413,l9_2412),l9_2414),dot(float2(-l9_2412,l9_2413),l9_2414))+l9_2411;
l9_2408=l9_2414;
float l9_2415=0.0;
l9_2415=gParticle.Index1DPerCopyF;
float l9_2416=0.0;
l9_2416=gParticle.Ratio1DPerCopy;
float l9_2417=0.0;
l9_2417=(((l9_2416-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2418=float4(0.0);
float2 l9_2419=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2420=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2421=l9_2408;
float l9_2422=l9_2415;
float l9_2423=l9_2417;
float l9_2424=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2425=l9_2405;
float2 l9_2426=float2(0.0);
float l9_2427=floor(l9_2419.x);
float l9_2428=floor(l9_2419.y);
float l9_2429=1.0/l9_2427;
float l9_2430=1.0/l9_2428;
float l9_2431=fast::min(l9_2427*l9_2428,floor(l9_2420));
float l9_2432=floor(mod(((l9_2425.gTimeElapsedShifted+l9_2424)*l9_2423)+floor(l9_2422),l9_2431));
float l9_2433=floor(l9_2432/l9_2427);
float l9_2434=mod(l9_2432,l9_2427);
l9_2426=float2((l9_2429*l9_2421.x)+(l9_2434*l9_2429),((1.0-l9_2430)-(l9_2433*l9_2430))+(l9_2430*l9_2421.y));
int l9_2435=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2436=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2436=0;
}
else
{
l9_2436=in.varStereoViewID;
}
int l9_2437=l9_2436;
l9_2435=1-l9_2437;
}
else
{
int l9_2438=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2438=0;
}
else
{
l9_2438=in.varStereoViewID;
}
int l9_2439=l9_2438;
l9_2435=l9_2439;
}
int l9_2440=l9_2435;
int l9_2441=flipbookTexLayout_tmp;
int l9_2442=l9_2440;
float2 l9_2443=l9_2426;
bool l9_2444=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2445=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2446=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2447=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2448=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2449=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2450=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2451=0.0;
bool l9_2452=l9_2449&&(!l9_2447);
float l9_2453=1.0;
float l9_2454=l9_2443.x;
int l9_2455=l9_2446.x;
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
l9_2443.x=l9_2454;
float l9_2459=l9_2443.y;
int l9_2460=l9_2446.y;
if (l9_2460==1)
{
l9_2459=fract(l9_2459);
}
else
{
if (l9_2460==2)
{
float l9_2461=fract(l9_2459);
float l9_2462=l9_2459-l9_2461;
float l9_2463=step(0.25,fract(l9_2462*0.5));
l9_2459=mix(l9_2461,1.0-l9_2461,fast::clamp(l9_2463,0.0,1.0));
}
}
l9_2443.y=l9_2459;
if (l9_2447)
{
bool l9_2464=l9_2449;
bool l9_2465;
if (l9_2464)
{
l9_2465=l9_2446.x==3;
}
else
{
l9_2465=l9_2464;
}
float l9_2466=l9_2443.x;
float l9_2467=l9_2448.x;
float l9_2468=l9_2448.z;
bool l9_2469=l9_2465;
float l9_2470=l9_2453;
float l9_2471=fast::clamp(l9_2466,l9_2467,l9_2468);
float l9_2472=step(abs(l9_2466-l9_2471),9.9999997e-06);
l9_2470*=(l9_2472+((1.0-float(l9_2469))*(1.0-l9_2472)));
l9_2466=l9_2471;
l9_2443.x=l9_2466;
l9_2453=l9_2470;
bool l9_2473=l9_2449;
bool l9_2474;
if (l9_2473)
{
l9_2474=l9_2446.y==3;
}
else
{
l9_2474=l9_2473;
}
float l9_2475=l9_2443.y;
float l9_2476=l9_2448.y;
float l9_2477=l9_2448.w;
bool l9_2478=l9_2474;
float l9_2479=l9_2453;
float l9_2480=fast::clamp(l9_2475,l9_2476,l9_2477);
float l9_2481=step(abs(l9_2475-l9_2480),9.9999997e-06);
l9_2479*=(l9_2481+((1.0-float(l9_2478))*(1.0-l9_2481)));
l9_2475=l9_2480;
l9_2443.y=l9_2475;
l9_2453=l9_2479;
}
float2 l9_2482=l9_2443;
bool l9_2483=l9_2444;
float3x3 l9_2484=l9_2445;
if (l9_2483)
{
l9_2482=float2((l9_2484*float3(l9_2482,1.0)).xy);
}
float2 l9_2485=l9_2482;
float2 l9_2486=l9_2485;
float2 l9_2487=l9_2486;
l9_2443=l9_2487;
float l9_2488=l9_2443.x;
int l9_2489=l9_2446.x;
bool l9_2490=l9_2452;
float l9_2491=l9_2453;
if ((l9_2489==0)||(l9_2489==3))
{
float l9_2492=l9_2488;
float l9_2493=0.0;
float l9_2494=1.0;
bool l9_2495=l9_2490;
float l9_2496=l9_2491;
float l9_2497=fast::clamp(l9_2492,l9_2493,l9_2494);
float l9_2498=step(abs(l9_2492-l9_2497),9.9999997e-06);
l9_2496*=(l9_2498+((1.0-float(l9_2495))*(1.0-l9_2498)));
l9_2492=l9_2497;
l9_2488=l9_2492;
l9_2491=l9_2496;
}
l9_2443.x=l9_2488;
l9_2453=l9_2491;
float l9_2499=l9_2443.y;
int l9_2500=l9_2446.y;
bool l9_2501=l9_2452;
float l9_2502=l9_2453;
if ((l9_2500==0)||(l9_2500==3))
{
float l9_2503=l9_2499;
float l9_2504=0.0;
float l9_2505=1.0;
bool l9_2506=l9_2501;
float l9_2507=l9_2502;
float l9_2508=fast::clamp(l9_2503,l9_2504,l9_2505);
float l9_2509=step(abs(l9_2503-l9_2508),9.9999997e-06);
l9_2507*=(l9_2509+((1.0-float(l9_2506))*(1.0-l9_2509)));
l9_2503=l9_2508;
l9_2499=l9_2503;
l9_2502=l9_2507;
}
l9_2443.y=l9_2499;
l9_2453=l9_2502;
float2 l9_2510=l9_2443;
int l9_2511=l9_2441;
int l9_2512=l9_2442;
float l9_2513=l9_2451;
float2 l9_2514=l9_2510;
int l9_2515=l9_2511;
int l9_2516=l9_2512;
float3 l9_2517=float3(0.0);
if (l9_2515==0)
{
l9_2517=float3(l9_2514,0.0);
}
else
{
if (l9_2515==1)
{
l9_2517=float3(l9_2514.x,(l9_2514.y*0.5)+(0.5-(float(l9_2516)*0.5)),0.0);
}
else
{
l9_2517=float3(l9_2514,float(l9_2516));
}
}
float3 l9_2518=l9_2517;
float3 l9_2519=l9_2518;
float2 l9_2520=l9_2519.xy;
float l9_2521=l9_2513;
float4 l9_2522=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2520,bias(l9_2521));
float4 l9_2523=l9_2522;
float4 l9_2524=l9_2523;
if (l9_2449)
{
l9_2524=mix(l9_2450,l9_2524,float4(l9_2453));
}
float4 l9_2525=l9_2524;
float4 l9_2526=l9_2525;
l9_2418=l9_2526;
l9_2403=l9_2418;
l9_2406=l9_2403;
}
else
{
float2 l9_2527=float2(0.0);
l9_2527=l9_2405.Surface_UVCoord0;
float2 l9_2528=float2(0.0);
float2 l9_2529=l9_2527;
float l9_2530=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2531=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2532=sin(radians(l9_2530));
float l9_2533=cos(radians(l9_2530));
float2 l9_2534=l9_2529-l9_2531;
l9_2534=float2(dot(float2(l9_2533,l9_2532),l9_2534),dot(float2(-l9_2532,l9_2533),l9_2534))+l9_2531;
l9_2528=l9_2534;
float l9_2535=0.0;
l9_2535=gParticle.Index1DPerCopyF;
float l9_2536=0.0;
l9_2536=gParticle.Ratio1DPerCopy;
float l9_2537=0.0;
l9_2537=(((l9_2536-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2538=float4(0.0);
float2 l9_2539=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2540=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2541=l9_2528;
float l9_2542=l9_2535;
float l9_2543=l9_2537;
float l9_2544=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2545=l9_2405;
float2 l9_2546=float2(0.0);
float l9_2547=floor(l9_2539.x);
float l9_2548=floor(l9_2539.y);
float l9_2549=1.0/l9_2547;
float l9_2550=1.0/l9_2548;
float l9_2551=fast::min(l9_2547*l9_2548,floor(l9_2540));
float l9_2552=floor(mod(((l9_2545.gTimeElapsedShifted+l9_2544)*l9_2543)+floor(l9_2542),l9_2551));
float l9_2553=floor(l9_2552/l9_2547);
float l9_2554=mod(l9_2552,l9_2547);
l9_2546=float2((l9_2549*l9_2541.x)+(l9_2554*l9_2549),((1.0-l9_2550)-(l9_2553*l9_2550))+(l9_2550*l9_2541.y));
int l9_2555=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
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
l9_2555=1-l9_2557;
}
else
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
l9_2555=l9_2559;
}
int l9_2560=l9_2555;
int l9_2561=repelflipbookTexLayout_tmp;
int l9_2562=l9_2560;
float2 l9_2563=l9_2546;
bool l9_2564=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2565=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2566=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2567=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2568=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2569=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2570=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_2571=0.0;
bool l9_2572=l9_2569&&(!l9_2567);
float l9_2573=1.0;
float l9_2574=l9_2563.x;
int l9_2575=l9_2566.x;
if (l9_2575==1)
{
l9_2574=fract(l9_2574);
}
else
{
if (l9_2575==2)
{
float l9_2576=fract(l9_2574);
float l9_2577=l9_2574-l9_2576;
float l9_2578=step(0.25,fract(l9_2577*0.5));
l9_2574=mix(l9_2576,1.0-l9_2576,fast::clamp(l9_2578,0.0,1.0));
}
}
l9_2563.x=l9_2574;
float l9_2579=l9_2563.y;
int l9_2580=l9_2566.y;
if (l9_2580==1)
{
l9_2579=fract(l9_2579);
}
else
{
if (l9_2580==2)
{
float l9_2581=fract(l9_2579);
float l9_2582=l9_2579-l9_2581;
float l9_2583=step(0.25,fract(l9_2582*0.5));
l9_2579=mix(l9_2581,1.0-l9_2581,fast::clamp(l9_2583,0.0,1.0));
}
}
l9_2563.y=l9_2579;
if (l9_2567)
{
bool l9_2584=l9_2569;
bool l9_2585;
if (l9_2584)
{
l9_2585=l9_2566.x==3;
}
else
{
l9_2585=l9_2584;
}
float l9_2586=l9_2563.x;
float l9_2587=l9_2568.x;
float l9_2588=l9_2568.z;
bool l9_2589=l9_2585;
float l9_2590=l9_2573;
float l9_2591=fast::clamp(l9_2586,l9_2587,l9_2588);
float l9_2592=step(abs(l9_2586-l9_2591),9.9999997e-06);
l9_2590*=(l9_2592+((1.0-float(l9_2589))*(1.0-l9_2592)));
l9_2586=l9_2591;
l9_2563.x=l9_2586;
l9_2573=l9_2590;
bool l9_2593=l9_2569;
bool l9_2594;
if (l9_2593)
{
l9_2594=l9_2566.y==3;
}
else
{
l9_2594=l9_2593;
}
float l9_2595=l9_2563.y;
float l9_2596=l9_2568.y;
float l9_2597=l9_2568.w;
bool l9_2598=l9_2594;
float l9_2599=l9_2573;
float l9_2600=fast::clamp(l9_2595,l9_2596,l9_2597);
float l9_2601=step(abs(l9_2595-l9_2600),9.9999997e-06);
l9_2599*=(l9_2601+((1.0-float(l9_2598))*(1.0-l9_2601)));
l9_2595=l9_2600;
l9_2563.y=l9_2595;
l9_2573=l9_2599;
}
float2 l9_2602=l9_2563;
bool l9_2603=l9_2564;
float3x3 l9_2604=l9_2565;
if (l9_2603)
{
l9_2602=float2((l9_2604*float3(l9_2602,1.0)).xy);
}
float2 l9_2605=l9_2602;
float2 l9_2606=l9_2605;
float2 l9_2607=l9_2606;
l9_2563=l9_2607;
float l9_2608=l9_2563.x;
int l9_2609=l9_2566.x;
bool l9_2610=l9_2572;
float l9_2611=l9_2573;
if ((l9_2609==0)||(l9_2609==3))
{
float l9_2612=l9_2608;
float l9_2613=0.0;
float l9_2614=1.0;
bool l9_2615=l9_2610;
float l9_2616=l9_2611;
float l9_2617=fast::clamp(l9_2612,l9_2613,l9_2614);
float l9_2618=step(abs(l9_2612-l9_2617),9.9999997e-06);
l9_2616*=(l9_2618+((1.0-float(l9_2615))*(1.0-l9_2618)));
l9_2612=l9_2617;
l9_2608=l9_2612;
l9_2611=l9_2616;
}
l9_2563.x=l9_2608;
l9_2573=l9_2611;
float l9_2619=l9_2563.y;
int l9_2620=l9_2566.y;
bool l9_2621=l9_2572;
float l9_2622=l9_2573;
if ((l9_2620==0)||(l9_2620==3))
{
float l9_2623=l9_2619;
float l9_2624=0.0;
float l9_2625=1.0;
bool l9_2626=l9_2621;
float l9_2627=l9_2622;
float l9_2628=fast::clamp(l9_2623,l9_2624,l9_2625);
float l9_2629=step(abs(l9_2623-l9_2628),9.9999997e-06);
l9_2627*=(l9_2629+((1.0-float(l9_2626))*(1.0-l9_2629)));
l9_2623=l9_2628;
l9_2619=l9_2623;
l9_2622=l9_2627;
}
l9_2563.y=l9_2619;
l9_2573=l9_2622;
float2 l9_2630=l9_2563;
int l9_2631=l9_2561;
int l9_2632=l9_2562;
float l9_2633=l9_2571;
float2 l9_2634=l9_2630;
int l9_2635=l9_2631;
int l9_2636=l9_2632;
float3 l9_2637=float3(0.0);
if (l9_2635==0)
{
l9_2637=float3(l9_2634,0.0);
}
else
{
if (l9_2635==1)
{
l9_2637=float3(l9_2634.x,(l9_2634.y*0.5)+(0.5-(float(l9_2636)*0.5)),0.0);
}
else
{
l9_2637=float3(l9_2634,float(l9_2636));
}
}
float3 l9_2638=l9_2637;
float3 l9_2639=l9_2638;
float2 l9_2640=l9_2639.xy;
float l9_2641=l9_2633;
float4 l9_2642=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_2640,bias(l9_2641));
float4 l9_2643=l9_2642;
float4 l9_2644=l9_2643;
if (l9_2569)
{
l9_2644=mix(l9_2570,l9_2644,float4(l9_2573));
}
float4 l9_2645=l9_2644;
float4 l9_2646=l9_2645;
l9_2538=l9_2646;
l9_2404=l9_2538;
l9_2406=l9_2404;
}
l9_2402=l9_2406;
float l9_2647=0.0;
float4 l9_2648=l9_2402;
float l9_2649=l9_2648.w;
l9_2647=l9_2649;
l9_1407=l9_2647;
l9_1409=l9_1407;
}
}
}
}
l9_1402=l9_1409;
float l9_2650=0.0;
l9_2650=l9_1402;
float l9_2651=0.0;
l9_2651=1.0-l9_2650;
l9_1398=l9_2651;
l9_1401=l9_1398;
}
else
{
float l9_2652=0.0;
float l9_2653=0.0;
float l9_2654=0.0;
float l9_2655=0.0;
float l9_2656=0.0;
float l9_2657=0.0;
ssGlobals l9_2658=l9_1400;
float l9_2659;
if (NODE_243_DROPLIST_ITEM_tmp==0)
{
float4 l9_2660=float4(0.0);
float4 l9_2661=float4(1.0);
float4 l9_2662=float4(0.0);
ssGlobals l9_2663=l9_2658;
float4 l9_2664;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_2665=float2(0.0);
l9_2665=l9_2663.Surface_UVCoord0;
float2 l9_2666=float2(0.0);
float2 l9_2667=l9_2665;
float l9_2668=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2669=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2670=sin(radians(l9_2668));
float l9_2671=cos(radians(l9_2668));
float2 l9_2672=l9_2667-l9_2669;
l9_2672=float2(dot(float2(l9_2671,l9_2670),l9_2672),dot(float2(-l9_2670,l9_2671),l9_2672))+l9_2669;
l9_2666=l9_2672;
float l9_2673=0.0;
l9_2673=gParticle.Index1DPerCopyF;
float l9_2674=0.0;
l9_2674=gParticle.Ratio1DPerCopy;
float l9_2675=0.0;
l9_2675=(((l9_2674-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2676=float4(0.0);
float2 l9_2677=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2678=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2679=l9_2666;
float l9_2680=l9_2673;
float l9_2681=l9_2675;
float l9_2682=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2683=l9_2663;
float2 l9_2684=float2(0.0);
float l9_2685=floor(l9_2677.x);
float l9_2686=floor(l9_2677.y);
float l9_2687=1.0/l9_2685;
float l9_2688=1.0/l9_2686;
float l9_2689=fast::min(l9_2685*l9_2686,floor(l9_2678));
float l9_2690=floor(mod(((l9_2683.gTimeElapsedShifted+l9_2682)*l9_2681)+floor(l9_2680),l9_2689));
float l9_2691=floor(l9_2690/l9_2685);
float l9_2692=mod(l9_2690,l9_2685);
l9_2684=float2((l9_2687*l9_2679.x)+(l9_2692*l9_2687),((1.0-l9_2688)-(l9_2691*l9_2688))+(l9_2688*l9_2679.y));
int l9_2693=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_2694=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2694=0;
}
else
{
l9_2694=in.varStereoViewID;
}
int l9_2695=l9_2694;
l9_2693=1-l9_2695;
}
else
{
int l9_2696=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2696=0;
}
else
{
l9_2696=in.varStereoViewID;
}
int l9_2697=l9_2696;
l9_2693=l9_2697;
}
int l9_2698=l9_2693;
int l9_2699=flipbookTexLayout_tmp;
int l9_2700=l9_2698;
float2 l9_2701=l9_2684;
bool l9_2702=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2703=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2704=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2705=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2706=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2707=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2708=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2709=0.0;
bool l9_2710=l9_2707&&(!l9_2705);
float l9_2711=1.0;
float l9_2712=l9_2701.x;
int l9_2713=l9_2704.x;
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
l9_2701.x=l9_2712;
float l9_2717=l9_2701.y;
int l9_2718=l9_2704.y;
if (l9_2718==1)
{
l9_2717=fract(l9_2717);
}
else
{
if (l9_2718==2)
{
float l9_2719=fract(l9_2717);
float l9_2720=l9_2717-l9_2719;
float l9_2721=step(0.25,fract(l9_2720*0.5));
l9_2717=mix(l9_2719,1.0-l9_2719,fast::clamp(l9_2721,0.0,1.0));
}
}
l9_2701.y=l9_2717;
if (l9_2705)
{
bool l9_2722=l9_2707;
bool l9_2723;
if (l9_2722)
{
l9_2723=l9_2704.x==3;
}
else
{
l9_2723=l9_2722;
}
float l9_2724=l9_2701.x;
float l9_2725=l9_2706.x;
float l9_2726=l9_2706.z;
bool l9_2727=l9_2723;
float l9_2728=l9_2711;
float l9_2729=fast::clamp(l9_2724,l9_2725,l9_2726);
float l9_2730=step(abs(l9_2724-l9_2729),9.9999997e-06);
l9_2728*=(l9_2730+((1.0-float(l9_2727))*(1.0-l9_2730)));
l9_2724=l9_2729;
l9_2701.x=l9_2724;
l9_2711=l9_2728;
bool l9_2731=l9_2707;
bool l9_2732;
if (l9_2731)
{
l9_2732=l9_2704.y==3;
}
else
{
l9_2732=l9_2731;
}
float l9_2733=l9_2701.y;
float l9_2734=l9_2706.y;
float l9_2735=l9_2706.w;
bool l9_2736=l9_2732;
float l9_2737=l9_2711;
float l9_2738=fast::clamp(l9_2733,l9_2734,l9_2735);
float l9_2739=step(abs(l9_2733-l9_2738),9.9999997e-06);
l9_2737*=(l9_2739+((1.0-float(l9_2736))*(1.0-l9_2739)));
l9_2733=l9_2738;
l9_2701.y=l9_2733;
l9_2711=l9_2737;
}
float2 l9_2740=l9_2701;
bool l9_2741=l9_2702;
float3x3 l9_2742=l9_2703;
if (l9_2741)
{
l9_2740=float2((l9_2742*float3(l9_2740,1.0)).xy);
}
float2 l9_2743=l9_2740;
float2 l9_2744=l9_2743;
float2 l9_2745=l9_2744;
l9_2701=l9_2745;
float l9_2746=l9_2701.x;
int l9_2747=l9_2704.x;
bool l9_2748=l9_2710;
float l9_2749=l9_2711;
if ((l9_2747==0)||(l9_2747==3))
{
float l9_2750=l9_2746;
float l9_2751=0.0;
float l9_2752=1.0;
bool l9_2753=l9_2748;
float l9_2754=l9_2749;
float l9_2755=fast::clamp(l9_2750,l9_2751,l9_2752);
float l9_2756=step(abs(l9_2750-l9_2755),9.9999997e-06);
l9_2754*=(l9_2756+((1.0-float(l9_2753))*(1.0-l9_2756)));
l9_2750=l9_2755;
l9_2746=l9_2750;
l9_2749=l9_2754;
}
l9_2701.x=l9_2746;
l9_2711=l9_2749;
float l9_2757=l9_2701.y;
int l9_2758=l9_2704.y;
bool l9_2759=l9_2710;
float l9_2760=l9_2711;
if ((l9_2758==0)||(l9_2758==3))
{
float l9_2761=l9_2757;
float l9_2762=0.0;
float l9_2763=1.0;
bool l9_2764=l9_2759;
float l9_2765=l9_2760;
float l9_2766=fast::clamp(l9_2761,l9_2762,l9_2763);
float l9_2767=step(abs(l9_2761-l9_2766),9.9999997e-06);
l9_2765*=(l9_2767+((1.0-float(l9_2764))*(1.0-l9_2767)));
l9_2761=l9_2766;
l9_2757=l9_2761;
l9_2760=l9_2765;
}
l9_2701.y=l9_2757;
l9_2711=l9_2760;
float2 l9_2768=l9_2701;
int l9_2769=l9_2699;
int l9_2770=l9_2700;
float l9_2771=l9_2709;
float2 l9_2772=l9_2768;
int l9_2773=l9_2769;
int l9_2774=l9_2770;
float3 l9_2775=float3(0.0);
if (l9_2773==0)
{
l9_2775=float3(l9_2772,0.0);
}
else
{
if (l9_2773==1)
{
l9_2775=float3(l9_2772.x,(l9_2772.y*0.5)+(0.5-(float(l9_2774)*0.5)),0.0);
}
else
{
l9_2775=float3(l9_2772,float(l9_2774));
}
}
float3 l9_2776=l9_2775;
float3 l9_2777=l9_2776;
float2 l9_2778=l9_2777.xy;
float l9_2779=l9_2771;
float4 l9_2780=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_2778,bias(l9_2779));
float4 l9_2781=l9_2780;
float4 l9_2782=l9_2781;
if (l9_2707)
{
l9_2782=mix(l9_2708,l9_2782,float4(l9_2711));
}
float4 l9_2783=l9_2782;
float4 l9_2784=l9_2783;
l9_2676=l9_2784;
l9_2661=l9_2676;
l9_2664=l9_2661;
}
else
{
float2 l9_2785=float2(0.0);
l9_2785=l9_2663.Surface_UVCoord0;
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
float2 l9_2797=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_2798=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_2799=l9_2786;
float l9_2800=l9_2793;
float l9_2801=l9_2795;
float l9_2802=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_2803=l9_2663;
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
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
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
int l9_2819=repelflipbookTexLayout_tmp;
int l9_2820=l9_2818;
float2 l9_2821=l9_2804;
bool l9_2822=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_2823=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_2824=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_2825=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_2826=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_2827=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_2828=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
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
float4 l9_2900=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_2898,bias(l9_2899));
float4 l9_2901=l9_2900;
float4 l9_2902=l9_2901;
if (l9_2827)
{
l9_2902=mix(l9_2828,l9_2902,float4(l9_2831));
}
float4 l9_2903=l9_2902;
float4 l9_2904=l9_2903;
l9_2796=l9_2904;
l9_2662=l9_2796;
l9_2664=l9_2662;
}
l9_2660=l9_2664;
float l9_2905=0.0;
float4 l9_2906=l9_2660;
float l9_2907=l9_2906.x;
l9_2905=l9_2907;
l9_2653=l9_2905;
l9_2659=l9_2653;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==1)
{
float4 l9_2908=float4(0.0);
float4 l9_2909=float4(1.0);
float4 l9_2910=float4(0.0);
ssGlobals l9_2911=l9_2658;
float4 l9_2912;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_2913=float2(0.0);
l9_2913=l9_2911.Surface_UVCoord0;
float2 l9_2914=float2(0.0);
float2 l9_2915=l9_2913;
float l9_2916=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_2917=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_2918=sin(radians(l9_2916));
float l9_2919=cos(radians(l9_2916));
float2 l9_2920=l9_2915-l9_2917;
l9_2920=float2(dot(float2(l9_2919,l9_2918),l9_2920),dot(float2(-l9_2918,l9_2919),l9_2920))+l9_2917;
l9_2914=l9_2920;
float l9_2921=0.0;
l9_2921=gParticle.Index1DPerCopyF;
float l9_2922=0.0;
l9_2922=gParticle.Ratio1DPerCopy;
float l9_2923=0.0;
l9_2923=(((l9_2922-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_2924=float4(0.0);
float2 l9_2925=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_2926=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_2927=l9_2914;
float l9_2928=l9_2921;
float l9_2929=l9_2923;
float l9_2930=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_2931=l9_2911;
float2 l9_2932=float2(0.0);
float l9_2933=floor(l9_2925.x);
float l9_2934=floor(l9_2925.y);
float l9_2935=1.0/l9_2933;
float l9_2936=1.0/l9_2934;
float l9_2937=fast::min(l9_2933*l9_2934,floor(l9_2926));
float l9_2938=floor(mod(((l9_2931.gTimeElapsedShifted+l9_2930)*l9_2929)+floor(l9_2928),l9_2937));
float l9_2939=floor(l9_2938/l9_2933);
float l9_2940=mod(l9_2938,l9_2933);
l9_2932=float2((l9_2935*l9_2927.x)+(l9_2940*l9_2935),((1.0-l9_2936)-(l9_2939*l9_2936))+(l9_2936*l9_2927.y));
int l9_2941=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
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
l9_2941=1-l9_2943;
}
else
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
l9_2941=l9_2945;
}
int l9_2946=l9_2941;
int l9_2947=flipbookTexLayout_tmp;
int l9_2948=l9_2946;
float2 l9_2949=l9_2932;
bool l9_2950=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_2951=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_2952=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_2953=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_2954=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_2955=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_2956=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_2957=0.0;
bool l9_2958=l9_2955&&(!l9_2953);
float l9_2959=1.0;
float l9_2960=l9_2949.x;
int l9_2961=l9_2952.x;
if (l9_2961==1)
{
l9_2960=fract(l9_2960);
}
else
{
if (l9_2961==2)
{
float l9_2962=fract(l9_2960);
float l9_2963=l9_2960-l9_2962;
float l9_2964=step(0.25,fract(l9_2963*0.5));
l9_2960=mix(l9_2962,1.0-l9_2962,fast::clamp(l9_2964,0.0,1.0));
}
}
l9_2949.x=l9_2960;
float l9_2965=l9_2949.y;
int l9_2966=l9_2952.y;
if (l9_2966==1)
{
l9_2965=fract(l9_2965);
}
else
{
if (l9_2966==2)
{
float l9_2967=fract(l9_2965);
float l9_2968=l9_2965-l9_2967;
float l9_2969=step(0.25,fract(l9_2968*0.5));
l9_2965=mix(l9_2967,1.0-l9_2967,fast::clamp(l9_2969,0.0,1.0));
}
}
l9_2949.y=l9_2965;
if (l9_2953)
{
bool l9_2970=l9_2955;
bool l9_2971;
if (l9_2970)
{
l9_2971=l9_2952.x==3;
}
else
{
l9_2971=l9_2970;
}
float l9_2972=l9_2949.x;
float l9_2973=l9_2954.x;
float l9_2974=l9_2954.z;
bool l9_2975=l9_2971;
float l9_2976=l9_2959;
float l9_2977=fast::clamp(l9_2972,l9_2973,l9_2974);
float l9_2978=step(abs(l9_2972-l9_2977),9.9999997e-06);
l9_2976*=(l9_2978+((1.0-float(l9_2975))*(1.0-l9_2978)));
l9_2972=l9_2977;
l9_2949.x=l9_2972;
l9_2959=l9_2976;
bool l9_2979=l9_2955;
bool l9_2980;
if (l9_2979)
{
l9_2980=l9_2952.y==3;
}
else
{
l9_2980=l9_2979;
}
float l9_2981=l9_2949.y;
float l9_2982=l9_2954.y;
float l9_2983=l9_2954.w;
bool l9_2984=l9_2980;
float l9_2985=l9_2959;
float l9_2986=fast::clamp(l9_2981,l9_2982,l9_2983);
float l9_2987=step(abs(l9_2981-l9_2986),9.9999997e-06);
l9_2985*=(l9_2987+((1.0-float(l9_2984))*(1.0-l9_2987)));
l9_2981=l9_2986;
l9_2949.y=l9_2981;
l9_2959=l9_2985;
}
float2 l9_2988=l9_2949;
bool l9_2989=l9_2950;
float3x3 l9_2990=l9_2951;
if (l9_2989)
{
l9_2988=float2((l9_2990*float3(l9_2988,1.0)).xy);
}
float2 l9_2991=l9_2988;
float2 l9_2992=l9_2991;
float2 l9_2993=l9_2992;
l9_2949=l9_2993;
float l9_2994=l9_2949.x;
int l9_2995=l9_2952.x;
bool l9_2996=l9_2958;
float l9_2997=l9_2959;
if ((l9_2995==0)||(l9_2995==3))
{
float l9_2998=l9_2994;
float l9_2999=0.0;
float l9_3000=1.0;
bool l9_3001=l9_2996;
float l9_3002=l9_2997;
float l9_3003=fast::clamp(l9_2998,l9_2999,l9_3000);
float l9_3004=step(abs(l9_2998-l9_3003),9.9999997e-06);
l9_3002*=(l9_3004+((1.0-float(l9_3001))*(1.0-l9_3004)));
l9_2998=l9_3003;
l9_2994=l9_2998;
l9_2997=l9_3002;
}
l9_2949.x=l9_2994;
l9_2959=l9_2997;
float l9_3005=l9_2949.y;
int l9_3006=l9_2952.y;
bool l9_3007=l9_2958;
float l9_3008=l9_2959;
if ((l9_3006==0)||(l9_3006==3))
{
float l9_3009=l9_3005;
float l9_3010=0.0;
float l9_3011=1.0;
bool l9_3012=l9_3007;
float l9_3013=l9_3008;
float l9_3014=fast::clamp(l9_3009,l9_3010,l9_3011);
float l9_3015=step(abs(l9_3009-l9_3014),9.9999997e-06);
l9_3013*=(l9_3015+((1.0-float(l9_3012))*(1.0-l9_3015)));
l9_3009=l9_3014;
l9_3005=l9_3009;
l9_3008=l9_3013;
}
l9_2949.y=l9_3005;
l9_2959=l9_3008;
float2 l9_3016=l9_2949;
int l9_3017=l9_2947;
int l9_3018=l9_2948;
float l9_3019=l9_2957;
float2 l9_3020=l9_3016;
int l9_3021=l9_3017;
int l9_3022=l9_3018;
float3 l9_3023=float3(0.0);
if (l9_3021==0)
{
l9_3023=float3(l9_3020,0.0);
}
else
{
if (l9_3021==1)
{
l9_3023=float3(l9_3020.x,(l9_3020.y*0.5)+(0.5-(float(l9_3022)*0.5)),0.0);
}
else
{
l9_3023=float3(l9_3020,float(l9_3022));
}
}
float3 l9_3024=l9_3023;
float3 l9_3025=l9_3024;
float2 l9_3026=l9_3025.xy;
float l9_3027=l9_3019;
float4 l9_3028=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_3026,bias(l9_3027));
float4 l9_3029=l9_3028;
float4 l9_3030=l9_3029;
if (l9_2955)
{
l9_3030=mix(l9_2956,l9_3030,float4(l9_2959));
}
float4 l9_3031=l9_3030;
float4 l9_3032=l9_3031;
l9_2924=l9_3032;
l9_2909=l9_2924;
l9_2912=l9_2909;
}
else
{
float2 l9_3033=float2(0.0);
l9_3033=l9_2911.Surface_UVCoord0;
float2 l9_3034=float2(0.0);
float2 l9_3035=l9_3033;
float l9_3036=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3037=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3038=sin(radians(l9_3036));
float l9_3039=cos(radians(l9_3036));
float2 l9_3040=l9_3035-l9_3037;
l9_3040=float2(dot(float2(l9_3039,l9_3038),l9_3040),dot(float2(-l9_3038,l9_3039),l9_3040))+l9_3037;
l9_3034=l9_3040;
float l9_3041=0.0;
l9_3041=gParticle.Index1DPerCopyF;
float l9_3042=0.0;
l9_3042=gParticle.Ratio1DPerCopy;
float l9_3043=0.0;
l9_3043=(((l9_3042-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3044=float4(0.0);
float2 l9_3045=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_3046=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_3047=l9_3034;
float l9_3048=l9_3041;
float l9_3049=l9_3043;
float l9_3050=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_3051=l9_2911;
float2 l9_3052=float2(0.0);
float l9_3053=floor(l9_3045.x);
float l9_3054=floor(l9_3045.y);
float l9_3055=1.0/l9_3053;
float l9_3056=1.0/l9_3054;
float l9_3057=fast::min(l9_3053*l9_3054,floor(l9_3046));
float l9_3058=floor(mod(((l9_3051.gTimeElapsedShifted+l9_3050)*l9_3049)+floor(l9_3048),l9_3057));
float l9_3059=floor(l9_3058/l9_3053);
float l9_3060=mod(l9_3058,l9_3053);
l9_3052=float2((l9_3055*l9_3047.x)+(l9_3060*l9_3055),((1.0-l9_3056)-(l9_3059*l9_3056))+(l9_3056*l9_3047.y));
int l9_3061=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3062=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3062=0;
}
else
{
l9_3062=in.varStereoViewID;
}
int l9_3063=l9_3062;
l9_3061=1-l9_3063;
}
else
{
int l9_3064=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3064=0;
}
else
{
l9_3064=in.varStereoViewID;
}
int l9_3065=l9_3064;
l9_3061=l9_3065;
}
int l9_3066=l9_3061;
int l9_3067=repelflipbookTexLayout_tmp;
int l9_3068=l9_3066;
float2 l9_3069=l9_3052;
bool l9_3070=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_3071=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_3072=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_3073=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_3074=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_3075=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_3076=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_3077=0.0;
bool l9_3078=l9_3075&&(!l9_3073);
float l9_3079=1.0;
float l9_3080=l9_3069.x;
int l9_3081=l9_3072.x;
if (l9_3081==1)
{
l9_3080=fract(l9_3080);
}
else
{
if (l9_3081==2)
{
float l9_3082=fract(l9_3080);
float l9_3083=l9_3080-l9_3082;
float l9_3084=step(0.25,fract(l9_3083*0.5));
l9_3080=mix(l9_3082,1.0-l9_3082,fast::clamp(l9_3084,0.0,1.0));
}
}
l9_3069.x=l9_3080;
float l9_3085=l9_3069.y;
int l9_3086=l9_3072.y;
if (l9_3086==1)
{
l9_3085=fract(l9_3085);
}
else
{
if (l9_3086==2)
{
float l9_3087=fract(l9_3085);
float l9_3088=l9_3085-l9_3087;
float l9_3089=step(0.25,fract(l9_3088*0.5));
l9_3085=mix(l9_3087,1.0-l9_3087,fast::clamp(l9_3089,0.0,1.0));
}
}
l9_3069.y=l9_3085;
if (l9_3073)
{
bool l9_3090=l9_3075;
bool l9_3091;
if (l9_3090)
{
l9_3091=l9_3072.x==3;
}
else
{
l9_3091=l9_3090;
}
float l9_3092=l9_3069.x;
float l9_3093=l9_3074.x;
float l9_3094=l9_3074.z;
bool l9_3095=l9_3091;
float l9_3096=l9_3079;
float l9_3097=fast::clamp(l9_3092,l9_3093,l9_3094);
float l9_3098=step(abs(l9_3092-l9_3097),9.9999997e-06);
l9_3096*=(l9_3098+((1.0-float(l9_3095))*(1.0-l9_3098)));
l9_3092=l9_3097;
l9_3069.x=l9_3092;
l9_3079=l9_3096;
bool l9_3099=l9_3075;
bool l9_3100;
if (l9_3099)
{
l9_3100=l9_3072.y==3;
}
else
{
l9_3100=l9_3099;
}
float l9_3101=l9_3069.y;
float l9_3102=l9_3074.y;
float l9_3103=l9_3074.w;
bool l9_3104=l9_3100;
float l9_3105=l9_3079;
float l9_3106=fast::clamp(l9_3101,l9_3102,l9_3103);
float l9_3107=step(abs(l9_3101-l9_3106),9.9999997e-06);
l9_3105*=(l9_3107+((1.0-float(l9_3104))*(1.0-l9_3107)));
l9_3101=l9_3106;
l9_3069.y=l9_3101;
l9_3079=l9_3105;
}
float2 l9_3108=l9_3069;
bool l9_3109=l9_3070;
float3x3 l9_3110=l9_3071;
if (l9_3109)
{
l9_3108=float2((l9_3110*float3(l9_3108,1.0)).xy);
}
float2 l9_3111=l9_3108;
float2 l9_3112=l9_3111;
float2 l9_3113=l9_3112;
l9_3069=l9_3113;
float l9_3114=l9_3069.x;
int l9_3115=l9_3072.x;
bool l9_3116=l9_3078;
float l9_3117=l9_3079;
if ((l9_3115==0)||(l9_3115==3))
{
float l9_3118=l9_3114;
float l9_3119=0.0;
float l9_3120=1.0;
bool l9_3121=l9_3116;
float l9_3122=l9_3117;
float l9_3123=fast::clamp(l9_3118,l9_3119,l9_3120);
float l9_3124=step(abs(l9_3118-l9_3123),9.9999997e-06);
l9_3122*=(l9_3124+((1.0-float(l9_3121))*(1.0-l9_3124)));
l9_3118=l9_3123;
l9_3114=l9_3118;
l9_3117=l9_3122;
}
l9_3069.x=l9_3114;
l9_3079=l9_3117;
float l9_3125=l9_3069.y;
int l9_3126=l9_3072.y;
bool l9_3127=l9_3078;
float l9_3128=l9_3079;
if ((l9_3126==0)||(l9_3126==3))
{
float l9_3129=l9_3125;
float l9_3130=0.0;
float l9_3131=1.0;
bool l9_3132=l9_3127;
float l9_3133=l9_3128;
float l9_3134=fast::clamp(l9_3129,l9_3130,l9_3131);
float l9_3135=step(abs(l9_3129-l9_3134),9.9999997e-06);
l9_3133*=(l9_3135+((1.0-float(l9_3132))*(1.0-l9_3135)));
l9_3129=l9_3134;
l9_3125=l9_3129;
l9_3128=l9_3133;
}
l9_3069.y=l9_3125;
l9_3079=l9_3128;
float2 l9_3136=l9_3069;
int l9_3137=l9_3067;
int l9_3138=l9_3068;
float l9_3139=l9_3077;
float2 l9_3140=l9_3136;
int l9_3141=l9_3137;
int l9_3142=l9_3138;
float3 l9_3143=float3(0.0);
if (l9_3141==0)
{
l9_3143=float3(l9_3140,0.0);
}
else
{
if (l9_3141==1)
{
l9_3143=float3(l9_3140.x,(l9_3140.y*0.5)+(0.5-(float(l9_3142)*0.5)),0.0);
}
else
{
l9_3143=float3(l9_3140,float(l9_3142));
}
}
float3 l9_3144=l9_3143;
float3 l9_3145=l9_3144;
float2 l9_3146=l9_3145.xy;
float l9_3147=l9_3139;
float4 l9_3148=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_3146,bias(l9_3147));
float4 l9_3149=l9_3148;
float4 l9_3150=l9_3149;
if (l9_3075)
{
l9_3150=mix(l9_3076,l9_3150,float4(l9_3079));
}
float4 l9_3151=l9_3150;
float4 l9_3152=l9_3151;
l9_3044=l9_3152;
l9_2910=l9_3044;
l9_2912=l9_2910;
}
l9_2908=l9_2912;
float l9_3153=0.0;
float4 l9_3154=l9_2908;
float l9_3155=l9_3154.y;
l9_3153=l9_3155;
l9_2654=l9_3153;
l9_2659=l9_2654;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==2)
{
float4 l9_3156=float4(0.0);
float4 l9_3157=float4(1.0);
float4 l9_3158=float4(0.0);
ssGlobals l9_3159=l9_2658;
float4 l9_3160;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_3161=float2(0.0);
l9_3161=l9_3159.Surface_UVCoord0;
float2 l9_3162=float2(0.0);
float2 l9_3163=l9_3161;
float l9_3164=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3165=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3166=sin(radians(l9_3164));
float l9_3167=cos(radians(l9_3164));
float2 l9_3168=l9_3163-l9_3165;
l9_3168=float2(dot(float2(l9_3167,l9_3166),l9_3168),dot(float2(-l9_3166,l9_3167),l9_3168))+l9_3165;
l9_3162=l9_3168;
float l9_3169=0.0;
l9_3169=gParticle.Index1DPerCopyF;
float l9_3170=0.0;
l9_3170=gParticle.Ratio1DPerCopy;
float l9_3171=0.0;
l9_3171=(((l9_3170-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3172=float4(0.0);
float2 l9_3173=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_3174=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_3175=l9_3162;
float l9_3176=l9_3169;
float l9_3177=l9_3171;
float l9_3178=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_3179=l9_3159;
float2 l9_3180=float2(0.0);
float l9_3181=floor(l9_3173.x);
float l9_3182=floor(l9_3173.y);
float l9_3183=1.0/l9_3181;
float l9_3184=1.0/l9_3182;
float l9_3185=fast::min(l9_3181*l9_3182,floor(l9_3174));
float l9_3186=floor(mod(((l9_3179.gTimeElapsedShifted+l9_3178)*l9_3177)+floor(l9_3176),l9_3185));
float l9_3187=floor(l9_3186/l9_3181);
float l9_3188=mod(l9_3186,l9_3181);
l9_3180=float2((l9_3183*l9_3175.x)+(l9_3188*l9_3183),((1.0-l9_3184)-(l9_3187*l9_3184))+(l9_3184*l9_3175.y));
int l9_3189=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3190=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3190=0;
}
else
{
l9_3190=in.varStereoViewID;
}
int l9_3191=l9_3190;
l9_3189=1-l9_3191;
}
else
{
int l9_3192=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3192=0;
}
else
{
l9_3192=in.varStereoViewID;
}
int l9_3193=l9_3192;
l9_3189=l9_3193;
}
int l9_3194=l9_3189;
int l9_3195=flipbookTexLayout_tmp;
int l9_3196=l9_3194;
float2 l9_3197=l9_3180;
bool l9_3198=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_3199=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_3200=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_3201=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_3202=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_3203=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_3204=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_3205=0.0;
bool l9_3206=l9_3203&&(!l9_3201);
float l9_3207=1.0;
float l9_3208=l9_3197.x;
int l9_3209=l9_3200.x;
if (l9_3209==1)
{
l9_3208=fract(l9_3208);
}
else
{
if (l9_3209==2)
{
float l9_3210=fract(l9_3208);
float l9_3211=l9_3208-l9_3210;
float l9_3212=step(0.25,fract(l9_3211*0.5));
l9_3208=mix(l9_3210,1.0-l9_3210,fast::clamp(l9_3212,0.0,1.0));
}
}
l9_3197.x=l9_3208;
float l9_3213=l9_3197.y;
int l9_3214=l9_3200.y;
if (l9_3214==1)
{
l9_3213=fract(l9_3213);
}
else
{
if (l9_3214==2)
{
float l9_3215=fract(l9_3213);
float l9_3216=l9_3213-l9_3215;
float l9_3217=step(0.25,fract(l9_3216*0.5));
l9_3213=mix(l9_3215,1.0-l9_3215,fast::clamp(l9_3217,0.0,1.0));
}
}
l9_3197.y=l9_3213;
if (l9_3201)
{
bool l9_3218=l9_3203;
bool l9_3219;
if (l9_3218)
{
l9_3219=l9_3200.x==3;
}
else
{
l9_3219=l9_3218;
}
float l9_3220=l9_3197.x;
float l9_3221=l9_3202.x;
float l9_3222=l9_3202.z;
bool l9_3223=l9_3219;
float l9_3224=l9_3207;
float l9_3225=fast::clamp(l9_3220,l9_3221,l9_3222);
float l9_3226=step(abs(l9_3220-l9_3225),9.9999997e-06);
l9_3224*=(l9_3226+((1.0-float(l9_3223))*(1.0-l9_3226)));
l9_3220=l9_3225;
l9_3197.x=l9_3220;
l9_3207=l9_3224;
bool l9_3227=l9_3203;
bool l9_3228;
if (l9_3227)
{
l9_3228=l9_3200.y==3;
}
else
{
l9_3228=l9_3227;
}
float l9_3229=l9_3197.y;
float l9_3230=l9_3202.y;
float l9_3231=l9_3202.w;
bool l9_3232=l9_3228;
float l9_3233=l9_3207;
float l9_3234=fast::clamp(l9_3229,l9_3230,l9_3231);
float l9_3235=step(abs(l9_3229-l9_3234),9.9999997e-06);
l9_3233*=(l9_3235+((1.0-float(l9_3232))*(1.0-l9_3235)));
l9_3229=l9_3234;
l9_3197.y=l9_3229;
l9_3207=l9_3233;
}
float2 l9_3236=l9_3197;
bool l9_3237=l9_3198;
float3x3 l9_3238=l9_3199;
if (l9_3237)
{
l9_3236=float2((l9_3238*float3(l9_3236,1.0)).xy);
}
float2 l9_3239=l9_3236;
float2 l9_3240=l9_3239;
float2 l9_3241=l9_3240;
l9_3197=l9_3241;
float l9_3242=l9_3197.x;
int l9_3243=l9_3200.x;
bool l9_3244=l9_3206;
float l9_3245=l9_3207;
if ((l9_3243==0)||(l9_3243==3))
{
float l9_3246=l9_3242;
float l9_3247=0.0;
float l9_3248=1.0;
bool l9_3249=l9_3244;
float l9_3250=l9_3245;
float l9_3251=fast::clamp(l9_3246,l9_3247,l9_3248);
float l9_3252=step(abs(l9_3246-l9_3251),9.9999997e-06);
l9_3250*=(l9_3252+((1.0-float(l9_3249))*(1.0-l9_3252)));
l9_3246=l9_3251;
l9_3242=l9_3246;
l9_3245=l9_3250;
}
l9_3197.x=l9_3242;
l9_3207=l9_3245;
float l9_3253=l9_3197.y;
int l9_3254=l9_3200.y;
bool l9_3255=l9_3206;
float l9_3256=l9_3207;
if ((l9_3254==0)||(l9_3254==3))
{
float l9_3257=l9_3253;
float l9_3258=0.0;
float l9_3259=1.0;
bool l9_3260=l9_3255;
float l9_3261=l9_3256;
float l9_3262=fast::clamp(l9_3257,l9_3258,l9_3259);
float l9_3263=step(abs(l9_3257-l9_3262),9.9999997e-06);
l9_3261*=(l9_3263+((1.0-float(l9_3260))*(1.0-l9_3263)));
l9_3257=l9_3262;
l9_3253=l9_3257;
l9_3256=l9_3261;
}
l9_3197.y=l9_3253;
l9_3207=l9_3256;
float2 l9_3264=l9_3197;
int l9_3265=l9_3195;
int l9_3266=l9_3196;
float l9_3267=l9_3205;
float2 l9_3268=l9_3264;
int l9_3269=l9_3265;
int l9_3270=l9_3266;
float3 l9_3271=float3(0.0);
if (l9_3269==0)
{
l9_3271=float3(l9_3268,0.0);
}
else
{
if (l9_3269==1)
{
l9_3271=float3(l9_3268.x,(l9_3268.y*0.5)+(0.5-(float(l9_3270)*0.5)),0.0);
}
else
{
l9_3271=float3(l9_3268,float(l9_3270));
}
}
float3 l9_3272=l9_3271;
float3 l9_3273=l9_3272;
float2 l9_3274=l9_3273.xy;
float l9_3275=l9_3267;
float4 l9_3276=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_3274,bias(l9_3275));
float4 l9_3277=l9_3276;
float4 l9_3278=l9_3277;
if (l9_3203)
{
l9_3278=mix(l9_3204,l9_3278,float4(l9_3207));
}
float4 l9_3279=l9_3278;
float4 l9_3280=l9_3279;
l9_3172=l9_3280;
l9_3157=l9_3172;
l9_3160=l9_3157;
}
else
{
float2 l9_3281=float2(0.0);
l9_3281=l9_3159.Surface_UVCoord0;
float2 l9_3282=float2(0.0);
float2 l9_3283=l9_3281;
float l9_3284=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3285=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3286=sin(radians(l9_3284));
float l9_3287=cos(radians(l9_3284));
float2 l9_3288=l9_3283-l9_3285;
l9_3288=float2(dot(float2(l9_3287,l9_3286),l9_3288),dot(float2(-l9_3286,l9_3287),l9_3288))+l9_3285;
l9_3282=l9_3288;
float l9_3289=0.0;
l9_3289=gParticle.Index1DPerCopyF;
float l9_3290=0.0;
l9_3290=gParticle.Ratio1DPerCopy;
float l9_3291=0.0;
l9_3291=(((l9_3290-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3292=float4(0.0);
float2 l9_3293=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_3294=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_3295=l9_3282;
float l9_3296=l9_3289;
float l9_3297=l9_3291;
float l9_3298=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_3299=l9_3159;
float2 l9_3300=float2(0.0);
float l9_3301=floor(l9_3293.x);
float l9_3302=floor(l9_3293.y);
float l9_3303=1.0/l9_3301;
float l9_3304=1.0/l9_3302;
float l9_3305=fast::min(l9_3301*l9_3302,floor(l9_3294));
float l9_3306=floor(mod(((l9_3299.gTimeElapsedShifted+l9_3298)*l9_3297)+floor(l9_3296),l9_3305));
float l9_3307=floor(l9_3306/l9_3301);
float l9_3308=mod(l9_3306,l9_3301);
l9_3300=float2((l9_3303*l9_3295.x)+(l9_3308*l9_3303),((1.0-l9_3304)-(l9_3307*l9_3304))+(l9_3304*l9_3295.y));
int l9_3309=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3310=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3310=0;
}
else
{
l9_3310=in.varStereoViewID;
}
int l9_3311=l9_3310;
l9_3309=1-l9_3311;
}
else
{
int l9_3312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3312=0;
}
else
{
l9_3312=in.varStereoViewID;
}
int l9_3313=l9_3312;
l9_3309=l9_3313;
}
int l9_3314=l9_3309;
int l9_3315=repelflipbookTexLayout_tmp;
int l9_3316=l9_3314;
float2 l9_3317=l9_3300;
bool l9_3318=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_3319=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_3320=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_3321=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_3322=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_3323=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_3324=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_3325=0.0;
bool l9_3326=l9_3323&&(!l9_3321);
float l9_3327=1.0;
float l9_3328=l9_3317.x;
int l9_3329=l9_3320.x;
if (l9_3329==1)
{
l9_3328=fract(l9_3328);
}
else
{
if (l9_3329==2)
{
float l9_3330=fract(l9_3328);
float l9_3331=l9_3328-l9_3330;
float l9_3332=step(0.25,fract(l9_3331*0.5));
l9_3328=mix(l9_3330,1.0-l9_3330,fast::clamp(l9_3332,0.0,1.0));
}
}
l9_3317.x=l9_3328;
float l9_3333=l9_3317.y;
int l9_3334=l9_3320.y;
if (l9_3334==1)
{
l9_3333=fract(l9_3333);
}
else
{
if (l9_3334==2)
{
float l9_3335=fract(l9_3333);
float l9_3336=l9_3333-l9_3335;
float l9_3337=step(0.25,fract(l9_3336*0.5));
l9_3333=mix(l9_3335,1.0-l9_3335,fast::clamp(l9_3337,0.0,1.0));
}
}
l9_3317.y=l9_3333;
if (l9_3321)
{
bool l9_3338=l9_3323;
bool l9_3339;
if (l9_3338)
{
l9_3339=l9_3320.x==3;
}
else
{
l9_3339=l9_3338;
}
float l9_3340=l9_3317.x;
float l9_3341=l9_3322.x;
float l9_3342=l9_3322.z;
bool l9_3343=l9_3339;
float l9_3344=l9_3327;
float l9_3345=fast::clamp(l9_3340,l9_3341,l9_3342);
float l9_3346=step(abs(l9_3340-l9_3345),9.9999997e-06);
l9_3344*=(l9_3346+((1.0-float(l9_3343))*(1.0-l9_3346)));
l9_3340=l9_3345;
l9_3317.x=l9_3340;
l9_3327=l9_3344;
bool l9_3347=l9_3323;
bool l9_3348;
if (l9_3347)
{
l9_3348=l9_3320.y==3;
}
else
{
l9_3348=l9_3347;
}
float l9_3349=l9_3317.y;
float l9_3350=l9_3322.y;
float l9_3351=l9_3322.w;
bool l9_3352=l9_3348;
float l9_3353=l9_3327;
float l9_3354=fast::clamp(l9_3349,l9_3350,l9_3351);
float l9_3355=step(abs(l9_3349-l9_3354),9.9999997e-06);
l9_3353*=(l9_3355+((1.0-float(l9_3352))*(1.0-l9_3355)));
l9_3349=l9_3354;
l9_3317.y=l9_3349;
l9_3327=l9_3353;
}
float2 l9_3356=l9_3317;
bool l9_3357=l9_3318;
float3x3 l9_3358=l9_3319;
if (l9_3357)
{
l9_3356=float2((l9_3358*float3(l9_3356,1.0)).xy);
}
float2 l9_3359=l9_3356;
float2 l9_3360=l9_3359;
float2 l9_3361=l9_3360;
l9_3317=l9_3361;
float l9_3362=l9_3317.x;
int l9_3363=l9_3320.x;
bool l9_3364=l9_3326;
float l9_3365=l9_3327;
if ((l9_3363==0)||(l9_3363==3))
{
float l9_3366=l9_3362;
float l9_3367=0.0;
float l9_3368=1.0;
bool l9_3369=l9_3364;
float l9_3370=l9_3365;
float l9_3371=fast::clamp(l9_3366,l9_3367,l9_3368);
float l9_3372=step(abs(l9_3366-l9_3371),9.9999997e-06);
l9_3370*=(l9_3372+((1.0-float(l9_3369))*(1.0-l9_3372)));
l9_3366=l9_3371;
l9_3362=l9_3366;
l9_3365=l9_3370;
}
l9_3317.x=l9_3362;
l9_3327=l9_3365;
float l9_3373=l9_3317.y;
int l9_3374=l9_3320.y;
bool l9_3375=l9_3326;
float l9_3376=l9_3327;
if ((l9_3374==0)||(l9_3374==3))
{
float l9_3377=l9_3373;
float l9_3378=0.0;
float l9_3379=1.0;
bool l9_3380=l9_3375;
float l9_3381=l9_3376;
float l9_3382=fast::clamp(l9_3377,l9_3378,l9_3379);
float l9_3383=step(abs(l9_3377-l9_3382),9.9999997e-06);
l9_3381*=(l9_3383+((1.0-float(l9_3380))*(1.0-l9_3383)));
l9_3377=l9_3382;
l9_3373=l9_3377;
l9_3376=l9_3381;
}
l9_3317.y=l9_3373;
l9_3327=l9_3376;
float2 l9_3384=l9_3317;
int l9_3385=l9_3315;
int l9_3386=l9_3316;
float l9_3387=l9_3325;
float2 l9_3388=l9_3384;
int l9_3389=l9_3385;
int l9_3390=l9_3386;
float3 l9_3391=float3(0.0);
if (l9_3389==0)
{
l9_3391=float3(l9_3388,0.0);
}
else
{
if (l9_3389==1)
{
l9_3391=float3(l9_3388.x,(l9_3388.y*0.5)+(0.5-(float(l9_3390)*0.5)),0.0);
}
else
{
l9_3391=float3(l9_3388,float(l9_3390));
}
}
float3 l9_3392=l9_3391;
float3 l9_3393=l9_3392;
float2 l9_3394=l9_3393.xy;
float l9_3395=l9_3387;
float4 l9_3396=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_3394,bias(l9_3395));
float4 l9_3397=l9_3396;
float4 l9_3398=l9_3397;
if (l9_3323)
{
l9_3398=mix(l9_3324,l9_3398,float4(l9_3327));
}
float4 l9_3399=l9_3398;
float4 l9_3400=l9_3399;
l9_3292=l9_3400;
l9_3158=l9_3292;
l9_3160=l9_3158;
}
l9_3156=l9_3160;
float l9_3401=0.0;
float4 l9_3402=l9_3156;
float l9_3403=l9_3402.z;
l9_3401=l9_3403;
l9_2655=l9_3401;
l9_2659=l9_2655;
}
else
{
if (NODE_243_DROPLIST_ITEM_tmp==3)
{
float4 l9_3404=float4(0.0);
float4 l9_3405=float4(1.0);
float4 l9_3406=float4(0.0);
ssGlobals l9_3407=l9_2658;
float4 l9_3408;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_3409=float2(0.0);
l9_3409=l9_3407.Surface_UVCoord0;
float2 l9_3410=float2(0.0);
float2 l9_3411=l9_3409;
float l9_3412=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3413=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3414=sin(radians(l9_3412));
float l9_3415=cos(radians(l9_3412));
float2 l9_3416=l9_3411-l9_3413;
l9_3416=float2(dot(float2(l9_3415,l9_3414),l9_3416),dot(float2(-l9_3414,l9_3415),l9_3416))+l9_3413;
l9_3410=l9_3416;
float l9_3417=0.0;
l9_3417=gParticle.Index1DPerCopyF;
float l9_3418=0.0;
l9_3418=gParticle.Ratio1DPerCopy;
float l9_3419=0.0;
l9_3419=(((l9_3418-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3420=float4(0.0);
float2 l9_3421=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_3422=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_3423=l9_3410;
float l9_3424=l9_3417;
float l9_3425=l9_3419;
float l9_3426=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_3427=l9_3407;
float2 l9_3428=float2(0.0);
float l9_3429=floor(l9_3421.x);
float l9_3430=floor(l9_3421.y);
float l9_3431=1.0/l9_3429;
float l9_3432=1.0/l9_3430;
float l9_3433=fast::min(l9_3429*l9_3430,floor(l9_3422));
float l9_3434=floor(mod(((l9_3427.gTimeElapsedShifted+l9_3426)*l9_3425)+floor(l9_3424),l9_3433));
float l9_3435=floor(l9_3434/l9_3429);
float l9_3436=mod(l9_3434,l9_3429);
l9_3428=float2((l9_3431*l9_3423.x)+(l9_3436*l9_3431),((1.0-l9_3432)-(l9_3435*l9_3432))+(l9_3432*l9_3423.y));
int l9_3437=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3438=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3438=0;
}
else
{
l9_3438=in.varStereoViewID;
}
int l9_3439=l9_3438;
l9_3437=1-l9_3439;
}
else
{
int l9_3440=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3440=0;
}
else
{
l9_3440=in.varStereoViewID;
}
int l9_3441=l9_3440;
l9_3437=l9_3441;
}
int l9_3442=l9_3437;
int l9_3443=flipbookTexLayout_tmp;
int l9_3444=l9_3442;
float2 l9_3445=l9_3428;
bool l9_3446=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_3447=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_3448=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_3449=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_3450=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_3451=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_3452=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_3453=0.0;
bool l9_3454=l9_3451&&(!l9_3449);
float l9_3455=1.0;
float l9_3456=l9_3445.x;
int l9_3457=l9_3448.x;
if (l9_3457==1)
{
l9_3456=fract(l9_3456);
}
else
{
if (l9_3457==2)
{
float l9_3458=fract(l9_3456);
float l9_3459=l9_3456-l9_3458;
float l9_3460=step(0.25,fract(l9_3459*0.5));
l9_3456=mix(l9_3458,1.0-l9_3458,fast::clamp(l9_3460,0.0,1.0));
}
}
l9_3445.x=l9_3456;
float l9_3461=l9_3445.y;
int l9_3462=l9_3448.y;
if (l9_3462==1)
{
l9_3461=fract(l9_3461);
}
else
{
if (l9_3462==2)
{
float l9_3463=fract(l9_3461);
float l9_3464=l9_3461-l9_3463;
float l9_3465=step(0.25,fract(l9_3464*0.5));
l9_3461=mix(l9_3463,1.0-l9_3463,fast::clamp(l9_3465,0.0,1.0));
}
}
l9_3445.y=l9_3461;
if (l9_3449)
{
bool l9_3466=l9_3451;
bool l9_3467;
if (l9_3466)
{
l9_3467=l9_3448.x==3;
}
else
{
l9_3467=l9_3466;
}
float l9_3468=l9_3445.x;
float l9_3469=l9_3450.x;
float l9_3470=l9_3450.z;
bool l9_3471=l9_3467;
float l9_3472=l9_3455;
float l9_3473=fast::clamp(l9_3468,l9_3469,l9_3470);
float l9_3474=step(abs(l9_3468-l9_3473),9.9999997e-06);
l9_3472*=(l9_3474+((1.0-float(l9_3471))*(1.0-l9_3474)));
l9_3468=l9_3473;
l9_3445.x=l9_3468;
l9_3455=l9_3472;
bool l9_3475=l9_3451;
bool l9_3476;
if (l9_3475)
{
l9_3476=l9_3448.y==3;
}
else
{
l9_3476=l9_3475;
}
float l9_3477=l9_3445.y;
float l9_3478=l9_3450.y;
float l9_3479=l9_3450.w;
bool l9_3480=l9_3476;
float l9_3481=l9_3455;
float l9_3482=fast::clamp(l9_3477,l9_3478,l9_3479);
float l9_3483=step(abs(l9_3477-l9_3482),9.9999997e-06);
l9_3481*=(l9_3483+((1.0-float(l9_3480))*(1.0-l9_3483)));
l9_3477=l9_3482;
l9_3445.y=l9_3477;
l9_3455=l9_3481;
}
float2 l9_3484=l9_3445;
bool l9_3485=l9_3446;
float3x3 l9_3486=l9_3447;
if (l9_3485)
{
l9_3484=float2((l9_3486*float3(l9_3484,1.0)).xy);
}
float2 l9_3487=l9_3484;
float2 l9_3488=l9_3487;
float2 l9_3489=l9_3488;
l9_3445=l9_3489;
float l9_3490=l9_3445.x;
int l9_3491=l9_3448.x;
bool l9_3492=l9_3454;
float l9_3493=l9_3455;
if ((l9_3491==0)||(l9_3491==3))
{
float l9_3494=l9_3490;
float l9_3495=0.0;
float l9_3496=1.0;
bool l9_3497=l9_3492;
float l9_3498=l9_3493;
float l9_3499=fast::clamp(l9_3494,l9_3495,l9_3496);
float l9_3500=step(abs(l9_3494-l9_3499),9.9999997e-06);
l9_3498*=(l9_3500+((1.0-float(l9_3497))*(1.0-l9_3500)));
l9_3494=l9_3499;
l9_3490=l9_3494;
l9_3493=l9_3498;
}
l9_3445.x=l9_3490;
l9_3455=l9_3493;
float l9_3501=l9_3445.y;
int l9_3502=l9_3448.y;
bool l9_3503=l9_3454;
float l9_3504=l9_3455;
if ((l9_3502==0)||(l9_3502==3))
{
float l9_3505=l9_3501;
float l9_3506=0.0;
float l9_3507=1.0;
bool l9_3508=l9_3503;
float l9_3509=l9_3504;
float l9_3510=fast::clamp(l9_3505,l9_3506,l9_3507);
float l9_3511=step(abs(l9_3505-l9_3510),9.9999997e-06);
l9_3509*=(l9_3511+((1.0-float(l9_3508))*(1.0-l9_3511)));
l9_3505=l9_3510;
l9_3501=l9_3505;
l9_3504=l9_3509;
}
l9_3445.y=l9_3501;
l9_3455=l9_3504;
float2 l9_3512=l9_3445;
int l9_3513=l9_3443;
int l9_3514=l9_3444;
float l9_3515=l9_3453;
float2 l9_3516=l9_3512;
int l9_3517=l9_3513;
int l9_3518=l9_3514;
float3 l9_3519=float3(0.0);
if (l9_3517==0)
{
l9_3519=float3(l9_3516,0.0);
}
else
{
if (l9_3517==1)
{
l9_3519=float3(l9_3516.x,(l9_3516.y*0.5)+(0.5-(float(l9_3518)*0.5)),0.0);
}
else
{
l9_3519=float3(l9_3516,float(l9_3518));
}
}
float3 l9_3520=l9_3519;
float3 l9_3521=l9_3520;
float2 l9_3522=l9_3521.xy;
float l9_3523=l9_3515;
float4 l9_3524=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_3522,bias(l9_3523));
float4 l9_3525=l9_3524;
float4 l9_3526=l9_3525;
if (l9_3451)
{
l9_3526=mix(l9_3452,l9_3526,float4(l9_3455));
}
float4 l9_3527=l9_3526;
float4 l9_3528=l9_3527;
l9_3420=l9_3528;
l9_3405=l9_3420;
l9_3408=l9_3405;
}
else
{
float2 l9_3529=float2(0.0);
l9_3529=l9_3407.Surface_UVCoord0;
float2 l9_3530=float2(0.0);
float2 l9_3531=l9_3529;
float l9_3532=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3533=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3534=sin(radians(l9_3532));
float l9_3535=cos(radians(l9_3532));
float2 l9_3536=l9_3531-l9_3533;
l9_3536=float2(dot(float2(l9_3535,l9_3534),l9_3536),dot(float2(-l9_3534,l9_3535),l9_3536))+l9_3533;
l9_3530=l9_3536;
float l9_3537=0.0;
l9_3537=gParticle.Index1DPerCopyF;
float l9_3538=0.0;
l9_3538=gParticle.Ratio1DPerCopy;
float l9_3539=0.0;
l9_3539=(((l9_3538-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3540=float4(0.0);
float2 l9_3541=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_3542=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_3543=l9_3530;
float l9_3544=l9_3537;
float l9_3545=l9_3539;
float l9_3546=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_3547=l9_3407;
float2 l9_3548=float2(0.0);
float l9_3549=floor(l9_3541.x);
float l9_3550=floor(l9_3541.y);
float l9_3551=1.0/l9_3549;
float l9_3552=1.0/l9_3550;
float l9_3553=fast::min(l9_3549*l9_3550,floor(l9_3542));
float l9_3554=floor(mod(((l9_3547.gTimeElapsedShifted+l9_3546)*l9_3545)+floor(l9_3544),l9_3553));
float l9_3555=floor(l9_3554/l9_3549);
float l9_3556=mod(l9_3554,l9_3549);
l9_3548=float2((l9_3551*l9_3543.x)+(l9_3556*l9_3551),((1.0-l9_3552)-(l9_3555*l9_3552))+(l9_3552*l9_3543.y));
int l9_3557=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3558=0;
}
else
{
l9_3558=in.varStereoViewID;
}
int l9_3559=l9_3558;
l9_3557=1-l9_3559;
}
else
{
int l9_3560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3560=0;
}
else
{
l9_3560=in.varStereoViewID;
}
int l9_3561=l9_3560;
l9_3557=l9_3561;
}
int l9_3562=l9_3557;
int l9_3563=repelflipbookTexLayout_tmp;
int l9_3564=l9_3562;
float2 l9_3565=l9_3548;
bool l9_3566=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_3567=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_3568=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_3569=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_3570=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_3571=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_3572=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_3573=0.0;
bool l9_3574=l9_3571&&(!l9_3569);
float l9_3575=1.0;
float l9_3576=l9_3565.x;
int l9_3577=l9_3568.x;
if (l9_3577==1)
{
l9_3576=fract(l9_3576);
}
else
{
if (l9_3577==2)
{
float l9_3578=fract(l9_3576);
float l9_3579=l9_3576-l9_3578;
float l9_3580=step(0.25,fract(l9_3579*0.5));
l9_3576=mix(l9_3578,1.0-l9_3578,fast::clamp(l9_3580,0.0,1.0));
}
}
l9_3565.x=l9_3576;
float l9_3581=l9_3565.y;
int l9_3582=l9_3568.y;
if (l9_3582==1)
{
l9_3581=fract(l9_3581);
}
else
{
if (l9_3582==2)
{
float l9_3583=fract(l9_3581);
float l9_3584=l9_3581-l9_3583;
float l9_3585=step(0.25,fract(l9_3584*0.5));
l9_3581=mix(l9_3583,1.0-l9_3583,fast::clamp(l9_3585,0.0,1.0));
}
}
l9_3565.y=l9_3581;
if (l9_3569)
{
bool l9_3586=l9_3571;
bool l9_3587;
if (l9_3586)
{
l9_3587=l9_3568.x==3;
}
else
{
l9_3587=l9_3586;
}
float l9_3588=l9_3565.x;
float l9_3589=l9_3570.x;
float l9_3590=l9_3570.z;
bool l9_3591=l9_3587;
float l9_3592=l9_3575;
float l9_3593=fast::clamp(l9_3588,l9_3589,l9_3590);
float l9_3594=step(abs(l9_3588-l9_3593),9.9999997e-06);
l9_3592*=(l9_3594+((1.0-float(l9_3591))*(1.0-l9_3594)));
l9_3588=l9_3593;
l9_3565.x=l9_3588;
l9_3575=l9_3592;
bool l9_3595=l9_3571;
bool l9_3596;
if (l9_3595)
{
l9_3596=l9_3568.y==3;
}
else
{
l9_3596=l9_3595;
}
float l9_3597=l9_3565.y;
float l9_3598=l9_3570.y;
float l9_3599=l9_3570.w;
bool l9_3600=l9_3596;
float l9_3601=l9_3575;
float l9_3602=fast::clamp(l9_3597,l9_3598,l9_3599);
float l9_3603=step(abs(l9_3597-l9_3602),9.9999997e-06);
l9_3601*=(l9_3603+((1.0-float(l9_3600))*(1.0-l9_3603)));
l9_3597=l9_3602;
l9_3565.y=l9_3597;
l9_3575=l9_3601;
}
float2 l9_3604=l9_3565;
bool l9_3605=l9_3566;
float3x3 l9_3606=l9_3567;
if (l9_3605)
{
l9_3604=float2((l9_3606*float3(l9_3604,1.0)).xy);
}
float2 l9_3607=l9_3604;
float2 l9_3608=l9_3607;
float2 l9_3609=l9_3608;
l9_3565=l9_3609;
float l9_3610=l9_3565.x;
int l9_3611=l9_3568.x;
bool l9_3612=l9_3574;
float l9_3613=l9_3575;
if ((l9_3611==0)||(l9_3611==3))
{
float l9_3614=l9_3610;
float l9_3615=0.0;
float l9_3616=1.0;
bool l9_3617=l9_3612;
float l9_3618=l9_3613;
float l9_3619=fast::clamp(l9_3614,l9_3615,l9_3616);
float l9_3620=step(abs(l9_3614-l9_3619),9.9999997e-06);
l9_3618*=(l9_3620+((1.0-float(l9_3617))*(1.0-l9_3620)));
l9_3614=l9_3619;
l9_3610=l9_3614;
l9_3613=l9_3618;
}
l9_3565.x=l9_3610;
l9_3575=l9_3613;
float l9_3621=l9_3565.y;
int l9_3622=l9_3568.y;
bool l9_3623=l9_3574;
float l9_3624=l9_3575;
if ((l9_3622==0)||(l9_3622==3))
{
float l9_3625=l9_3621;
float l9_3626=0.0;
float l9_3627=1.0;
bool l9_3628=l9_3623;
float l9_3629=l9_3624;
float l9_3630=fast::clamp(l9_3625,l9_3626,l9_3627);
float l9_3631=step(abs(l9_3625-l9_3630),9.9999997e-06);
l9_3629*=(l9_3631+((1.0-float(l9_3628))*(1.0-l9_3631)));
l9_3625=l9_3630;
l9_3621=l9_3625;
l9_3624=l9_3629;
}
l9_3565.y=l9_3621;
l9_3575=l9_3624;
float2 l9_3632=l9_3565;
int l9_3633=l9_3563;
int l9_3634=l9_3564;
float l9_3635=l9_3573;
float2 l9_3636=l9_3632;
int l9_3637=l9_3633;
int l9_3638=l9_3634;
float3 l9_3639=float3(0.0);
if (l9_3637==0)
{
l9_3639=float3(l9_3636,0.0);
}
else
{
if (l9_3637==1)
{
l9_3639=float3(l9_3636.x,(l9_3636.y*0.5)+(0.5-(float(l9_3638)*0.5)),0.0);
}
else
{
l9_3639=float3(l9_3636,float(l9_3638));
}
}
float3 l9_3640=l9_3639;
float3 l9_3641=l9_3640;
float2 l9_3642=l9_3641.xy;
float l9_3643=l9_3635;
float4 l9_3644=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_3642,bias(l9_3643));
float4 l9_3645=l9_3644;
float4 l9_3646=l9_3645;
if (l9_3571)
{
l9_3646=mix(l9_3572,l9_3646,float4(l9_3575));
}
float4 l9_3647=l9_3646;
float4 l9_3648=l9_3647;
l9_3540=l9_3648;
l9_3406=l9_3540;
l9_3408=l9_3406;
}
l9_3404=l9_3408;
float l9_3649=0.0;
float4 l9_3650=l9_3404;
float l9_3651=l9_3650.w;
l9_3649=l9_3651;
l9_2656=l9_3649;
l9_2659=l9_2656;
}
else
{
float4 l9_3652=float4(0.0);
float4 l9_3653=float4(1.0);
float4 l9_3654=float4(0.0);
ssGlobals l9_3655=l9_2658;
float4 l9_3656;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_3657=float2(0.0);
l9_3657=l9_3655.Surface_UVCoord0;
float2 l9_3658=float2(0.0);
float2 l9_3659=l9_3657;
float l9_3660=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3661=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3662=sin(radians(l9_3660));
float l9_3663=cos(radians(l9_3660));
float2 l9_3664=l9_3659-l9_3661;
l9_3664=float2(dot(float2(l9_3663,l9_3662),l9_3664),dot(float2(-l9_3662,l9_3663),l9_3664))+l9_3661;
l9_3658=l9_3664;
float l9_3665=0.0;
l9_3665=gParticle.Index1DPerCopyF;
float l9_3666=0.0;
l9_3666=gParticle.Ratio1DPerCopy;
float l9_3667=0.0;
l9_3667=(((l9_3666-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3668=float4(0.0);
float2 l9_3669=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_3670=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_3671=l9_3658;
float l9_3672=l9_3665;
float l9_3673=l9_3667;
float l9_3674=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_3675=l9_3655;
float2 l9_3676=float2(0.0);
float l9_3677=floor(l9_3669.x);
float l9_3678=floor(l9_3669.y);
float l9_3679=1.0/l9_3677;
float l9_3680=1.0/l9_3678;
float l9_3681=fast::min(l9_3677*l9_3678,floor(l9_3670));
float l9_3682=floor(mod(((l9_3675.gTimeElapsedShifted+l9_3674)*l9_3673)+floor(l9_3672),l9_3681));
float l9_3683=floor(l9_3682/l9_3677);
float l9_3684=mod(l9_3682,l9_3677);
l9_3676=float2((l9_3679*l9_3671.x)+(l9_3684*l9_3679),((1.0-l9_3680)-(l9_3683*l9_3680))+(l9_3680*l9_3671.y));
int l9_3685=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3686=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3686=0;
}
else
{
l9_3686=in.varStereoViewID;
}
int l9_3687=l9_3686;
l9_3685=1-l9_3687;
}
else
{
int l9_3688=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3688=0;
}
else
{
l9_3688=in.varStereoViewID;
}
int l9_3689=l9_3688;
l9_3685=l9_3689;
}
int l9_3690=l9_3685;
int l9_3691=flipbookTexLayout_tmp;
int l9_3692=l9_3690;
float2 l9_3693=l9_3676;
bool l9_3694=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_3695=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_3696=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_3697=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_3698=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_3699=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_3700=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_3701=0.0;
bool l9_3702=l9_3699&&(!l9_3697);
float l9_3703=1.0;
float l9_3704=l9_3693.x;
int l9_3705=l9_3696.x;
if (l9_3705==1)
{
l9_3704=fract(l9_3704);
}
else
{
if (l9_3705==2)
{
float l9_3706=fract(l9_3704);
float l9_3707=l9_3704-l9_3706;
float l9_3708=step(0.25,fract(l9_3707*0.5));
l9_3704=mix(l9_3706,1.0-l9_3706,fast::clamp(l9_3708,0.0,1.0));
}
}
l9_3693.x=l9_3704;
float l9_3709=l9_3693.y;
int l9_3710=l9_3696.y;
if (l9_3710==1)
{
l9_3709=fract(l9_3709);
}
else
{
if (l9_3710==2)
{
float l9_3711=fract(l9_3709);
float l9_3712=l9_3709-l9_3711;
float l9_3713=step(0.25,fract(l9_3712*0.5));
l9_3709=mix(l9_3711,1.0-l9_3711,fast::clamp(l9_3713,0.0,1.0));
}
}
l9_3693.y=l9_3709;
if (l9_3697)
{
bool l9_3714=l9_3699;
bool l9_3715;
if (l9_3714)
{
l9_3715=l9_3696.x==3;
}
else
{
l9_3715=l9_3714;
}
float l9_3716=l9_3693.x;
float l9_3717=l9_3698.x;
float l9_3718=l9_3698.z;
bool l9_3719=l9_3715;
float l9_3720=l9_3703;
float l9_3721=fast::clamp(l9_3716,l9_3717,l9_3718);
float l9_3722=step(abs(l9_3716-l9_3721),9.9999997e-06);
l9_3720*=(l9_3722+((1.0-float(l9_3719))*(1.0-l9_3722)));
l9_3716=l9_3721;
l9_3693.x=l9_3716;
l9_3703=l9_3720;
bool l9_3723=l9_3699;
bool l9_3724;
if (l9_3723)
{
l9_3724=l9_3696.y==3;
}
else
{
l9_3724=l9_3723;
}
float l9_3725=l9_3693.y;
float l9_3726=l9_3698.y;
float l9_3727=l9_3698.w;
bool l9_3728=l9_3724;
float l9_3729=l9_3703;
float l9_3730=fast::clamp(l9_3725,l9_3726,l9_3727);
float l9_3731=step(abs(l9_3725-l9_3730),9.9999997e-06);
l9_3729*=(l9_3731+((1.0-float(l9_3728))*(1.0-l9_3731)));
l9_3725=l9_3730;
l9_3693.y=l9_3725;
l9_3703=l9_3729;
}
float2 l9_3732=l9_3693;
bool l9_3733=l9_3694;
float3x3 l9_3734=l9_3695;
if (l9_3733)
{
l9_3732=float2((l9_3734*float3(l9_3732,1.0)).xy);
}
float2 l9_3735=l9_3732;
float2 l9_3736=l9_3735;
float2 l9_3737=l9_3736;
l9_3693=l9_3737;
float l9_3738=l9_3693.x;
int l9_3739=l9_3696.x;
bool l9_3740=l9_3702;
float l9_3741=l9_3703;
if ((l9_3739==0)||(l9_3739==3))
{
float l9_3742=l9_3738;
float l9_3743=0.0;
float l9_3744=1.0;
bool l9_3745=l9_3740;
float l9_3746=l9_3741;
float l9_3747=fast::clamp(l9_3742,l9_3743,l9_3744);
float l9_3748=step(abs(l9_3742-l9_3747),9.9999997e-06);
l9_3746*=(l9_3748+((1.0-float(l9_3745))*(1.0-l9_3748)));
l9_3742=l9_3747;
l9_3738=l9_3742;
l9_3741=l9_3746;
}
l9_3693.x=l9_3738;
l9_3703=l9_3741;
float l9_3749=l9_3693.y;
int l9_3750=l9_3696.y;
bool l9_3751=l9_3702;
float l9_3752=l9_3703;
if ((l9_3750==0)||(l9_3750==3))
{
float l9_3753=l9_3749;
float l9_3754=0.0;
float l9_3755=1.0;
bool l9_3756=l9_3751;
float l9_3757=l9_3752;
float l9_3758=fast::clamp(l9_3753,l9_3754,l9_3755);
float l9_3759=step(abs(l9_3753-l9_3758),9.9999997e-06);
l9_3757*=(l9_3759+((1.0-float(l9_3756))*(1.0-l9_3759)));
l9_3753=l9_3758;
l9_3749=l9_3753;
l9_3752=l9_3757;
}
l9_3693.y=l9_3749;
l9_3703=l9_3752;
float2 l9_3760=l9_3693;
int l9_3761=l9_3691;
int l9_3762=l9_3692;
float l9_3763=l9_3701;
float2 l9_3764=l9_3760;
int l9_3765=l9_3761;
int l9_3766=l9_3762;
float3 l9_3767=float3(0.0);
if (l9_3765==0)
{
l9_3767=float3(l9_3764,0.0);
}
else
{
if (l9_3765==1)
{
l9_3767=float3(l9_3764.x,(l9_3764.y*0.5)+(0.5-(float(l9_3766)*0.5)),0.0);
}
else
{
l9_3767=float3(l9_3764,float(l9_3766));
}
}
float3 l9_3768=l9_3767;
float3 l9_3769=l9_3768;
float2 l9_3770=l9_3769.xy;
float l9_3771=l9_3763;
float4 l9_3772=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_3770,bias(l9_3771));
float4 l9_3773=l9_3772;
float4 l9_3774=l9_3773;
if (l9_3699)
{
l9_3774=mix(l9_3700,l9_3774,float4(l9_3703));
}
float4 l9_3775=l9_3774;
float4 l9_3776=l9_3775;
l9_3668=l9_3776;
l9_3653=l9_3668;
l9_3656=l9_3653;
}
else
{
float2 l9_3777=float2(0.0);
l9_3777=l9_3655.Surface_UVCoord0;
float2 l9_3778=float2(0.0);
float2 l9_3779=l9_3777;
float l9_3780=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3781=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3782=sin(radians(l9_3780));
float l9_3783=cos(radians(l9_3780));
float2 l9_3784=l9_3779-l9_3781;
l9_3784=float2(dot(float2(l9_3783,l9_3782),l9_3784),dot(float2(-l9_3782,l9_3783),l9_3784))+l9_3781;
l9_3778=l9_3784;
float l9_3785=0.0;
l9_3785=gParticle.Index1DPerCopyF;
float l9_3786=0.0;
l9_3786=gParticle.Ratio1DPerCopy;
float l9_3787=0.0;
l9_3787=(((l9_3786-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3788=float4(0.0);
float2 l9_3789=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_3790=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_3791=l9_3778;
float l9_3792=l9_3785;
float l9_3793=l9_3787;
float l9_3794=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_3795=l9_3655;
float2 l9_3796=float2(0.0);
float l9_3797=floor(l9_3789.x);
float l9_3798=floor(l9_3789.y);
float l9_3799=1.0/l9_3797;
float l9_3800=1.0/l9_3798;
float l9_3801=fast::min(l9_3797*l9_3798,floor(l9_3790));
float l9_3802=floor(mod(((l9_3795.gTimeElapsedShifted+l9_3794)*l9_3793)+floor(l9_3792),l9_3801));
float l9_3803=floor(l9_3802/l9_3797);
float l9_3804=mod(l9_3802,l9_3797);
l9_3796=float2((l9_3799*l9_3791.x)+(l9_3804*l9_3799),((1.0-l9_3800)-(l9_3803*l9_3800))+(l9_3800*l9_3791.y));
int l9_3805=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3806=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3806=0;
}
else
{
l9_3806=in.varStereoViewID;
}
int l9_3807=l9_3806;
l9_3805=1-l9_3807;
}
else
{
int l9_3808=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3808=0;
}
else
{
l9_3808=in.varStereoViewID;
}
int l9_3809=l9_3808;
l9_3805=l9_3809;
}
int l9_3810=l9_3805;
int l9_3811=repelflipbookTexLayout_tmp;
int l9_3812=l9_3810;
float2 l9_3813=l9_3796;
bool l9_3814=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_3815=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_3816=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_3817=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_3818=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_3819=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_3820=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_3821=0.0;
bool l9_3822=l9_3819&&(!l9_3817);
float l9_3823=1.0;
float l9_3824=l9_3813.x;
int l9_3825=l9_3816.x;
if (l9_3825==1)
{
l9_3824=fract(l9_3824);
}
else
{
if (l9_3825==2)
{
float l9_3826=fract(l9_3824);
float l9_3827=l9_3824-l9_3826;
float l9_3828=step(0.25,fract(l9_3827*0.5));
l9_3824=mix(l9_3826,1.0-l9_3826,fast::clamp(l9_3828,0.0,1.0));
}
}
l9_3813.x=l9_3824;
float l9_3829=l9_3813.y;
int l9_3830=l9_3816.y;
if (l9_3830==1)
{
l9_3829=fract(l9_3829);
}
else
{
if (l9_3830==2)
{
float l9_3831=fract(l9_3829);
float l9_3832=l9_3829-l9_3831;
float l9_3833=step(0.25,fract(l9_3832*0.5));
l9_3829=mix(l9_3831,1.0-l9_3831,fast::clamp(l9_3833,0.0,1.0));
}
}
l9_3813.y=l9_3829;
if (l9_3817)
{
bool l9_3834=l9_3819;
bool l9_3835;
if (l9_3834)
{
l9_3835=l9_3816.x==3;
}
else
{
l9_3835=l9_3834;
}
float l9_3836=l9_3813.x;
float l9_3837=l9_3818.x;
float l9_3838=l9_3818.z;
bool l9_3839=l9_3835;
float l9_3840=l9_3823;
float l9_3841=fast::clamp(l9_3836,l9_3837,l9_3838);
float l9_3842=step(abs(l9_3836-l9_3841),9.9999997e-06);
l9_3840*=(l9_3842+((1.0-float(l9_3839))*(1.0-l9_3842)));
l9_3836=l9_3841;
l9_3813.x=l9_3836;
l9_3823=l9_3840;
bool l9_3843=l9_3819;
bool l9_3844;
if (l9_3843)
{
l9_3844=l9_3816.y==3;
}
else
{
l9_3844=l9_3843;
}
float l9_3845=l9_3813.y;
float l9_3846=l9_3818.y;
float l9_3847=l9_3818.w;
bool l9_3848=l9_3844;
float l9_3849=l9_3823;
float l9_3850=fast::clamp(l9_3845,l9_3846,l9_3847);
float l9_3851=step(abs(l9_3845-l9_3850),9.9999997e-06);
l9_3849*=(l9_3851+((1.0-float(l9_3848))*(1.0-l9_3851)));
l9_3845=l9_3850;
l9_3813.y=l9_3845;
l9_3823=l9_3849;
}
float2 l9_3852=l9_3813;
bool l9_3853=l9_3814;
float3x3 l9_3854=l9_3815;
if (l9_3853)
{
l9_3852=float2((l9_3854*float3(l9_3852,1.0)).xy);
}
float2 l9_3855=l9_3852;
float2 l9_3856=l9_3855;
float2 l9_3857=l9_3856;
l9_3813=l9_3857;
float l9_3858=l9_3813.x;
int l9_3859=l9_3816.x;
bool l9_3860=l9_3822;
float l9_3861=l9_3823;
if ((l9_3859==0)||(l9_3859==3))
{
float l9_3862=l9_3858;
float l9_3863=0.0;
float l9_3864=1.0;
bool l9_3865=l9_3860;
float l9_3866=l9_3861;
float l9_3867=fast::clamp(l9_3862,l9_3863,l9_3864);
float l9_3868=step(abs(l9_3862-l9_3867),9.9999997e-06);
l9_3866*=(l9_3868+((1.0-float(l9_3865))*(1.0-l9_3868)));
l9_3862=l9_3867;
l9_3858=l9_3862;
l9_3861=l9_3866;
}
l9_3813.x=l9_3858;
l9_3823=l9_3861;
float l9_3869=l9_3813.y;
int l9_3870=l9_3816.y;
bool l9_3871=l9_3822;
float l9_3872=l9_3823;
if ((l9_3870==0)||(l9_3870==3))
{
float l9_3873=l9_3869;
float l9_3874=0.0;
float l9_3875=1.0;
bool l9_3876=l9_3871;
float l9_3877=l9_3872;
float l9_3878=fast::clamp(l9_3873,l9_3874,l9_3875);
float l9_3879=step(abs(l9_3873-l9_3878),9.9999997e-06);
l9_3877*=(l9_3879+((1.0-float(l9_3876))*(1.0-l9_3879)));
l9_3873=l9_3878;
l9_3869=l9_3873;
l9_3872=l9_3877;
}
l9_3813.y=l9_3869;
l9_3823=l9_3872;
float2 l9_3880=l9_3813;
int l9_3881=l9_3811;
int l9_3882=l9_3812;
float l9_3883=l9_3821;
float2 l9_3884=l9_3880;
int l9_3885=l9_3881;
int l9_3886=l9_3882;
float3 l9_3887=float3(0.0);
if (l9_3885==0)
{
l9_3887=float3(l9_3884,0.0);
}
else
{
if (l9_3885==1)
{
l9_3887=float3(l9_3884.x,(l9_3884.y*0.5)+(0.5-(float(l9_3886)*0.5)),0.0);
}
else
{
l9_3887=float3(l9_3884,float(l9_3886));
}
}
float3 l9_3888=l9_3887;
float3 l9_3889=l9_3888;
float2 l9_3890=l9_3889.xy;
float l9_3891=l9_3883;
float4 l9_3892=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_3890,bias(l9_3891));
float4 l9_3893=l9_3892;
float4 l9_3894=l9_3893;
if (l9_3819)
{
l9_3894=mix(l9_3820,l9_3894,float4(l9_3823));
}
float4 l9_3895=l9_3894;
float4 l9_3896=l9_3895;
l9_3788=l9_3896;
l9_3654=l9_3788;
l9_3656=l9_3654;
}
l9_3652=l9_3656;
float l9_3897=0.0;
float4 l9_3898=l9_3652;
float l9_3899=l9_3898.w;
l9_3897=l9_3899;
l9_2657=l9_3897;
l9_2659=l9_2657;
}
}
}
}
l9_2652=l9_2659;
float l9_3900=0.0;
l9_3900=l9_2652;
l9_1399=l9_3900;
l9_1401=l9_1399;
}
l9_1397=l9_1401;
float4 l9_3901=float4(0.0);
l9_3901=mix(l9_1394,l9_1395,float4(l9_1397));
float l9_3902=0.0;
float l9_3903=(*sc_set0.UserUniforms).intensity;
l9_3902=l9_3903;
float4 l9_3904=float4(0.0);
float l9_3905;
if (l9_3901.x<=0.0)
{
l9_3905=0.0;
}
else
{
l9_3905=pow(l9_3901.x,l9_3902);
}
float l9_3906=l9_3905;
float l9_3907;
if (l9_3901.y<=0.0)
{
l9_3907=0.0;
}
else
{
l9_3907=pow(l9_3901.y,l9_3902);
}
float l9_3908=l9_3907;
float l9_3909;
if (l9_3901.z<=0.0)
{
l9_3909=0.0;
}
else
{
l9_3909=pow(l9_3901.z,l9_3902);
}
float l9_3910=l9_3909;
float l9_3911;
if (l9_3901.w<=0.0)
{
l9_3911=0.0;
}
else
{
l9_3911=pow(l9_3901.w,l9_3902);
}
l9_3904=float4(l9_3906,l9_3908,l9_3910,l9_3911);
float l9_3912=0.0;
l9_3912=l9_1394.w;
float4 l9_3913=float4(0.0);
float4 l9_3914=float4(1.0);
float4 l9_3915=float4(0.0);
ssGlobals l9_3916=l9_710;
float4 l9_3917;
if ((int(Tweak_N248_tmp)!=0))
{
float2 l9_3918=float2(0.0);
l9_3918=l9_3916.Surface_UVCoord0;
float2 l9_3919=float2(0.0);
float2 l9_3920=l9_3918;
float l9_3921=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_3922=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_3923=sin(radians(l9_3921));
float l9_3924=cos(radians(l9_3921));
float2 l9_3925=l9_3920-l9_3922;
l9_3925=float2(dot(float2(l9_3924,l9_3923),l9_3925),dot(float2(-l9_3923,l9_3924),l9_3925))+l9_3922;
l9_3919=l9_3925;
float l9_3926=0.0;
l9_3926=gParticle.Index1DPerCopyF;
float l9_3927=0.0;
l9_3927=gParticle.Ratio1DPerCopy;
float l9_3928=0.0;
l9_3928=(((l9_3927-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_3929=float4(0.0);
float2 l9_3930=(*sc_set0.UserUniforms).Port_SpriteCount_N045;
float l9_3931=(*sc_set0.UserUniforms).Port_MaxFrames_N045;
float2 l9_3932=l9_3919;
float l9_3933=l9_3926;
float l9_3934=l9_3928;
float l9_3935=(*sc_set0.UserUniforms).Port_SecondOffset_N045;
ssGlobals l9_3936=l9_3916;
float2 l9_3937=float2(0.0);
float l9_3938=floor(l9_3930.x);
float l9_3939=floor(l9_3930.y);
float l9_3940=1.0/l9_3938;
float l9_3941=1.0/l9_3939;
float l9_3942=fast::min(l9_3938*l9_3939,floor(l9_3931));
float l9_3943=floor(mod(((l9_3936.gTimeElapsedShifted+l9_3935)*l9_3934)+floor(l9_3933),l9_3942));
float l9_3944=floor(l9_3943/l9_3938);
float l9_3945=mod(l9_3943,l9_3938);
l9_3937=float2((l9_3940*l9_3932.x)+(l9_3945*l9_3940),((1.0-l9_3941)-(l9_3944*l9_3941))+(l9_3941*l9_3932.y));
int l9_3946=0;
if ((int(flipbookTexHasSwappedViews_tmp)!=0))
{
int l9_3947=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3947=0;
}
else
{
l9_3947=in.varStereoViewID;
}
int l9_3948=l9_3947;
l9_3946=1-l9_3948;
}
else
{
int l9_3949=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3949=0;
}
else
{
l9_3949=in.varStereoViewID;
}
int l9_3950=l9_3949;
l9_3946=l9_3950;
}
int l9_3951=l9_3946;
int l9_3952=flipbookTexLayout_tmp;
int l9_3953=l9_3951;
float2 l9_3954=l9_3937;
bool l9_3955=(int(SC_USE_UV_TRANSFORM_flipbookTex_tmp)!=0);
float3x3 l9_3956=(*sc_set0.UserUniforms).flipbookTexTransform;
int2 l9_3957=int2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_flipbookTex_tmp);
bool l9_3958=(int(SC_USE_UV_MIN_MAX_flipbookTex_tmp)!=0);
float4 l9_3959=(*sc_set0.UserUniforms).flipbookTexUvMinMax;
bool l9_3960=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex_tmp)!=0);
float4 l9_3961=(*sc_set0.UserUniforms).flipbookTexBorderColor;
float l9_3962=0.0;
bool l9_3963=l9_3960&&(!l9_3958);
float l9_3964=1.0;
float l9_3965=l9_3954.x;
int l9_3966=l9_3957.x;
if (l9_3966==1)
{
l9_3965=fract(l9_3965);
}
else
{
if (l9_3966==2)
{
float l9_3967=fract(l9_3965);
float l9_3968=l9_3965-l9_3967;
float l9_3969=step(0.25,fract(l9_3968*0.5));
l9_3965=mix(l9_3967,1.0-l9_3967,fast::clamp(l9_3969,0.0,1.0));
}
}
l9_3954.x=l9_3965;
float l9_3970=l9_3954.y;
int l9_3971=l9_3957.y;
if (l9_3971==1)
{
l9_3970=fract(l9_3970);
}
else
{
if (l9_3971==2)
{
float l9_3972=fract(l9_3970);
float l9_3973=l9_3970-l9_3972;
float l9_3974=step(0.25,fract(l9_3973*0.5));
l9_3970=mix(l9_3972,1.0-l9_3972,fast::clamp(l9_3974,0.0,1.0));
}
}
l9_3954.y=l9_3970;
if (l9_3958)
{
bool l9_3975=l9_3960;
bool l9_3976;
if (l9_3975)
{
l9_3976=l9_3957.x==3;
}
else
{
l9_3976=l9_3975;
}
float l9_3977=l9_3954.x;
float l9_3978=l9_3959.x;
float l9_3979=l9_3959.z;
bool l9_3980=l9_3976;
float l9_3981=l9_3964;
float l9_3982=fast::clamp(l9_3977,l9_3978,l9_3979);
float l9_3983=step(abs(l9_3977-l9_3982),9.9999997e-06);
l9_3981*=(l9_3983+((1.0-float(l9_3980))*(1.0-l9_3983)));
l9_3977=l9_3982;
l9_3954.x=l9_3977;
l9_3964=l9_3981;
bool l9_3984=l9_3960;
bool l9_3985;
if (l9_3984)
{
l9_3985=l9_3957.y==3;
}
else
{
l9_3985=l9_3984;
}
float l9_3986=l9_3954.y;
float l9_3987=l9_3959.y;
float l9_3988=l9_3959.w;
bool l9_3989=l9_3985;
float l9_3990=l9_3964;
float l9_3991=fast::clamp(l9_3986,l9_3987,l9_3988);
float l9_3992=step(abs(l9_3986-l9_3991),9.9999997e-06);
l9_3990*=(l9_3992+((1.0-float(l9_3989))*(1.0-l9_3992)));
l9_3986=l9_3991;
l9_3954.y=l9_3986;
l9_3964=l9_3990;
}
float2 l9_3993=l9_3954;
bool l9_3994=l9_3955;
float3x3 l9_3995=l9_3956;
if (l9_3994)
{
l9_3993=float2((l9_3995*float3(l9_3993,1.0)).xy);
}
float2 l9_3996=l9_3993;
float2 l9_3997=l9_3996;
float2 l9_3998=l9_3997;
l9_3954=l9_3998;
float l9_3999=l9_3954.x;
int l9_4000=l9_3957.x;
bool l9_4001=l9_3963;
float l9_4002=l9_3964;
if ((l9_4000==0)||(l9_4000==3))
{
float l9_4003=l9_3999;
float l9_4004=0.0;
float l9_4005=1.0;
bool l9_4006=l9_4001;
float l9_4007=l9_4002;
float l9_4008=fast::clamp(l9_4003,l9_4004,l9_4005);
float l9_4009=step(abs(l9_4003-l9_4008),9.9999997e-06);
l9_4007*=(l9_4009+((1.0-float(l9_4006))*(1.0-l9_4009)));
l9_4003=l9_4008;
l9_3999=l9_4003;
l9_4002=l9_4007;
}
l9_3954.x=l9_3999;
l9_3964=l9_4002;
float l9_4010=l9_3954.y;
int l9_4011=l9_3957.y;
bool l9_4012=l9_3963;
float l9_4013=l9_3964;
if ((l9_4011==0)||(l9_4011==3))
{
float l9_4014=l9_4010;
float l9_4015=0.0;
float l9_4016=1.0;
bool l9_4017=l9_4012;
float l9_4018=l9_4013;
float l9_4019=fast::clamp(l9_4014,l9_4015,l9_4016);
float l9_4020=step(abs(l9_4014-l9_4019),9.9999997e-06);
l9_4018*=(l9_4020+((1.0-float(l9_4017))*(1.0-l9_4020)));
l9_4014=l9_4019;
l9_4010=l9_4014;
l9_4013=l9_4018;
}
l9_3954.y=l9_4010;
l9_3964=l9_4013;
float2 l9_4021=l9_3954;
int l9_4022=l9_3952;
int l9_4023=l9_3953;
float l9_4024=l9_3962;
float2 l9_4025=l9_4021;
int l9_4026=l9_4022;
int l9_4027=l9_4023;
float3 l9_4028=float3(0.0);
if (l9_4026==0)
{
l9_4028=float3(l9_4025,0.0);
}
else
{
if (l9_4026==1)
{
l9_4028=float3(l9_4025.x,(l9_4025.y*0.5)+(0.5-(float(l9_4027)*0.5)),0.0);
}
else
{
l9_4028=float3(l9_4025,float(l9_4027));
}
}
float3 l9_4029=l9_4028;
float3 l9_4030=l9_4029;
float2 l9_4031=l9_4030.xy;
float l9_4032=l9_4024;
float4 l9_4033=sc_set0.flipbookTex.sample(sc_set0.flipbookTexSmpSC,l9_4031,bias(l9_4032));
float4 l9_4034=l9_4033;
float4 l9_4035=l9_4034;
if (l9_3960)
{
l9_4035=mix(l9_3961,l9_4035,float4(l9_3964));
}
float4 l9_4036=l9_4035;
float4 l9_4037=l9_4036;
l9_3929=l9_4037;
l9_3914=l9_3929;
l9_3917=l9_3914;
}
else
{
float2 l9_4038=float2(0.0);
l9_4038=l9_3916.Surface_UVCoord0;
float2 l9_4039=float2(0.0);
float2 l9_4040=l9_4038;
float l9_4041=(*sc_set0.UserUniforms).Port_Rotation_N159;
float2 l9_4042=(*sc_set0.UserUniforms).Port_Center_N159;
float l9_4043=sin(radians(l9_4041));
float l9_4044=cos(radians(l9_4041));
float2 l9_4045=l9_4040-l9_4042;
l9_4045=float2(dot(float2(l9_4044,l9_4043),l9_4045),dot(float2(-l9_4043,l9_4044),l9_4045))+l9_4042;
l9_4039=l9_4045;
float l9_4046=0.0;
l9_4046=gParticle.Index1DPerCopyF;
float l9_4047=0.0;
l9_4047=gParticle.Ratio1DPerCopy;
float l9_4048=0.0;
l9_4048=(((l9_4047-(*sc_set0.UserUniforms).Port_RangeMinA_N156)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N156-(*sc_set0.UserUniforms).Port_RangeMinA_N156)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N156-(*sc_set0.UserUniforms).Port_RangeMinB_N156))+(*sc_set0.UserUniforms).Port_RangeMinB_N156;
float4 l9_4049=float4(0.0);
float2 l9_4050=(*sc_set0.UserUniforms).Port_SpriteCount_N167;
float l9_4051=(*sc_set0.UserUniforms).Port_MaxFrames_N167;
float2 l9_4052=l9_4039;
float l9_4053=l9_4046;
float l9_4054=l9_4048;
float l9_4055=(*sc_set0.UserUniforms).Port_SecondOffset_N167;
ssGlobals l9_4056=l9_3916;
float2 l9_4057=float2(0.0);
float l9_4058=floor(l9_4050.x);
float l9_4059=floor(l9_4050.y);
float l9_4060=1.0/l9_4058;
float l9_4061=1.0/l9_4059;
float l9_4062=fast::min(l9_4058*l9_4059,floor(l9_4051));
float l9_4063=floor(mod(((l9_4056.gTimeElapsedShifted+l9_4055)*l9_4054)+floor(l9_4053),l9_4062));
float l9_4064=floor(l9_4063/l9_4058);
float l9_4065=mod(l9_4063,l9_4058);
l9_4057=float2((l9_4060*l9_4052.x)+(l9_4065*l9_4060),((1.0-l9_4061)-(l9_4064*l9_4061))+(l9_4061*l9_4052.y));
int l9_4066=0;
if ((int(repelflipbookTexHasSwappedViews_tmp)!=0))
{
int l9_4067=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4067=0;
}
else
{
l9_4067=in.varStereoViewID;
}
int l9_4068=l9_4067;
l9_4066=1-l9_4068;
}
else
{
int l9_4069=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4069=0;
}
else
{
l9_4069=in.varStereoViewID;
}
int l9_4070=l9_4069;
l9_4066=l9_4070;
}
int l9_4071=l9_4066;
int l9_4072=repelflipbookTexLayout_tmp;
int l9_4073=l9_4071;
float2 l9_4074=l9_4057;
bool l9_4075=(int(SC_USE_UV_TRANSFORM_repelflipbookTex_tmp)!=0);
float3x3 l9_4076=(*sc_set0.UserUniforms).repelflipbookTexTransform;
int2 l9_4077=int2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex_tmp,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex_tmp);
bool l9_4078=(int(SC_USE_UV_MIN_MAX_repelflipbookTex_tmp)!=0);
float4 l9_4079=(*sc_set0.UserUniforms).repelflipbookTexUvMinMax;
bool l9_4080=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex_tmp)!=0);
float4 l9_4081=(*sc_set0.UserUniforms).repelflipbookTexBorderColor;
float l9_4082=0.0;
bool l9_4083=l9_4080&&(!l9_4078);
float l9_4084=1.0;
float l9_4085=l9_4074.x;
int l9_4086=l9_4077.x;
if (l9_4086==1)
{
l9_4085=fract(l9_4085);
}
else
{
if (l9_4086==2)
{
float l9_4087=fract(l9_4085);
float l9_4088=l9_4085-l9_4087;
float l9_4089=step(0.25,fract(l9_4088*0.5));
l9_4085=mix(l9_4087,1.0-l9_4087,fast::clamp(l9_4089,0.0,1.0));
}
}
l9_4074.x=l9_4085;
float l9_4090=l9_4074.y;
int l9_4091=l9_4077.y;
if (l9_4091==1)
{
l9_4090=fract(l9_4090);
}
else
{
if (l9_4091==2)
{
float l9_4092=fract(l9_4090);
float l9_4093=l9_4090-l9_4092;
float l9_4094=step(0.25,fract(l9_4093*0.5));
l9_4090=mix(l9_4092,1.0-l9_4092,fast::clamp(l9_4094,0.0,1.0));
}
}
l9_4074.y=l9_4090;
if (l9_4078)
{
bool l9_4095=l9_4080;
bool l9_4096;
if (l9_4095)
{
l9_4096=l9_4077.x==3;
}
else
{
l9_4096=l9_4095;
}
float l9_4097=l9_4074.x;
float l9_4098=l9_4079.x;
float l9_4099=l9_4079.z;
bool l9_4100=l9_4096;
float l9_4101=l9_4084;
float l9_4102=fast::clamp(l9_4097,l9_4098,l9_4099);
float l9_4103=step(abs(l9_4097-l9_4102),9.9999997e-06);
l9_4101*=(l9_4103+((1.0-float(l9_4100))*(1.0-l9_4103)));
l9_4097=l9_4102;
l9_4074.x=l9_4097;
l9_4084=l9_4101;
bool l9_4104=l9_4080;
bool l9_4105;
if (l9_4104)
{
l9_4105=l9_4077.y==3;
}
else
{
l9_4105=l9_4104;
}
float l9_4106=l9_4074.y;
float l9_4107=l9_4079.y;
float l9_4108=l9_4079.w;
bool l9_4109=l9_4105;
float l9_4110=l9_4084;
float l9_4111=fast::clamp(l9_4106,l9_4107,l9_4108);
float l9_4112=step(abs(l9_4106-l9_4111),9.9999997e-06);
l9_4110*=(l9_4112+((1.0-float(l9_4109))*(1.0-l9_4112)));
l9_4106=l9_4111;
l9_4074.y=l9_4106;
l9_4084=l9_4110;
}
float2 l9_4113=l9_4074;
bool l9_4114=l9_4075;
float3x3 l9_4115=l9_4076;
if (l9_4114)
{
l9_4113=float2((l9_4115*float3(l9_4113,1.0)).xy);
}
float2 l9_4116=l9_4113;
float2 l9_4117=l9_4116;
float2 l9_4118=l9_4117;
l9_4074=l9_4118;
float l9_4119=l9_4074.x;
int l9_4120=l9_4077.x;
bool l9_4121=l9_4083;
float l9_4122=l9_4084;
if ((l9_4120==0)||(l9_4120==3))
{
float l9_4123=l9_4119;
float l9_4124=0.0;
float l9_4125=1.0;
bool l9_4126=l9_4121;
float l9_4127=l9_4122;
float l9_4128=fast::clamp(l9_4123,l9_4124,l9_4125);
float l9_4129=step(abs(l9_4123-l9_4128),9.9999997e-06);
l9_4127*=(l9_4129+((1.0-float(l9_4126))*(1.0-l9_4129)));
l9_4123=l9_4128;
l9_4119=l9_4123;
l9_4122=l9_4127;
}
l9_4074.x=l9_4119;
l9_4084=l9_4122;
float l9_4130=l9_4074.y;
int l9_4131=l9_4077.y;
bool l9_4132=l9_4083;
float l9_4133=l9_4084;
if ((l9_4131==0)||(l9_4131==3))
{
float l9_4134=l9_4130;
float l9_4135=0.0;
float l9_4136=1.0;
bool l9_4137=l9_4132;
float l9_4138=l9_4133;
float l9_4139=fast::clamp(l9_4134,l9_4135,l9_4136);
float l9_4140=step(abs(l9_4134-l9_4139),9.9999997e-06);
l9_4138*=(l9_4140+((1.0-float(l9_4137))*(1.0-l9_4140)));
l9_4134=l9_4139;
l9_4130=l9_4134;
l9_4133=l9_4138;
}
l9_4074.y=l9_4130;
l9_4084=l9_4133;
float2 l9_4141=l9_4074;
int l9_4142=l9_4072;
int l9_4143=l9_4073;
float l9_4144=l9_4082;
float2 l9_4145=l9_4141;
int l9_4146=l9_4142;
int l9_4147=l9_4143;
float3 l9_4148=float3(0.0);
if (l9_4146==0)
{
l9_4148=float3(l9_4145,0.0);
}
else
{
if (l9_4146==1)
{
l9_4148=float3(l9_4145.x,(l9_4145.y*0.5)+(0.5-(float(l9_4147)*0.5)),0.0);
}
else
{
l9_4148=float3(l9_4145,float(l9_4147));
}
}
float3 l9_4149=l9_4148;
float3 l9_4150=l9_4149;
float2 l9_4151=l9_4150.xy;
float l9_4152=l9_4144;
float4 l9_4153=sc_set0.repelflipbookTex.sample(sc_set0.repelflipbookTexSmpSC,l9_4151,bias(l9_4152));
float4 l9_4154=l9_4153;
float4 l9_4155=l9_4154;
if (l9_4080)
{
l9_4155=mix(l9_4081,l9_4155,float4(l9_4084));
}
float4 l9_4156=l9_4155;
float4 l9_4157=l9_4156;
l9_4049=l9_4157;
l9_3915=l9_4049;
l9_3917=l9_3915;
}
l9_3913=l9_3917;
float l9_4158=0.0;
l9_4158=l9_3913.w;
float l9_4159=0.0;
l9_4159=l9_3912*l9_4158;
float2 l9_4160=float2(0.0);
l9_4160=l9_710.Surface_UVCoord0;
float2 l9_4161=float2(0.0);
l9_4161=l9_4160*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_4162=float2(0.0);
l9_4162=l9_4161-float2(1.0);
float l9_4163=0.0;
l9_4163=dot(l9_4162,l9_4162);
float l9_4164=0.0;
l9_4164=fast::clamp(l9_4163+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_4165=0.0;
l9_4165=1.0-l9_4164;
float l9_4166=0.0;
float l9_4167;
if (l9_4165<=0.0)
{
l9_4167=0.0;
}
else
{
l9_4167=sqrt(l9_4165);
}
l9_4166=l9_4167;
float3 l9_4168=float3(0.0);
l9_4168=float3(l9_4162.x,l9_4162.y,l9_4168.z);
l9_4168.z=l9_4166;
float l9_4169=0.0;
l9_4169=distance(l9_4160,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_4170=0.0;
l9_4170=float(l9_4169<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_4171=float3(0.0);
l9_4171=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_4168,float3(l9_4170));
float3 l9_4172=float3(0.0);
l9_4172=l9_4171;
float4 l9_4173=float4(0.0);
float3 l9_4174=l9_3904.xyz;
float l9_4175=l9_4159;
float3 l9_4176=l9_4172;
float3 l9_4177=(*sc_set0.UserUniforms).Port_Emissive_N258;
float l9_4178=(*sc_set0.UserUniforms).Port_Metallic_N258;
float l9_4179=(*sc_set0.UserUniforms).Port_Roughness_N258;
float3 l9_4180=(*sc_set0.UserUniforms).Port_AO_N258;
float3 l9_4181=(*sc_set0.UserUniforms).Port_SpecularAO_N258;
ssGlobals l9_4182=l9_710;
l9_4182.BumpedNormal=float3x3(float3(l9_4182.VertexTangent_WorldSpace),float3(l9_4182.VertexBinormal_WorldSpace),float3(l9_4182.VertexNormal_WorldSpace))*l9_4176;
l9_4175=fast::clamp(l9_4175,0.0,1.0);
l9_4174=fast::max(l9_4174,float3(0.0));
float3 l9_4183=l9_4174;
float l9_4184=l9_4175;
float3 l9_4185=l9_4182.BumpedNormal;
float3 l9_4186=l9_4182.PositionWS;
float3 l9_4187=l9_4182.ViewDirWS;
float3 l9_4188=l9_4177;
float l9_4189=l9_4178;
float l9_4190=l9_4179;
float3 l9_4191=l9_4180;
float3 l9_4192=l9_4181;
SurfaceProperties l9_4193;
l9_4193.albedo=float3(0.0);
l9_4193.opacity=1.0;
l9_4193.normal=float3(0.0);
l9_4193.positionWS=float3(0.0);
l9_4193.viewDirWS=float3(0.0);
l9_4193.metallic=0.0;
l9_4193.roughness=0.0;
l9_4193.emissive=float3(0.0);
l9_4193.ao=float3(1.0);
l9_4193.specularAo=float3(1.0);
l9_4193.bakedShadows=float3(1.0);
SurfaceProperties l9_4194=l9_4193;
SurfaceProperties l9_4195=l9_4194;
l9_4195.opacity=l9_4184;
float3 l9_4196=l9_4183;
float3 l9_4197;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4197=float3(pow(l9_4196.x,2.2),pow(l9_4196.y,2.2),pow(l9_4196.z,2.2));
}
else
{
l9_4197=l9_4196*l9_4196;
}
float3 l9_4198=l9_4197;
l9_4195.albedo=l9_4198;
l9_4195.normal=normalize(l9_4185);
l9_4195.positionWS=l9_4186;
l9_4195.viewDirWS=l9_4187;
float3 l9_4199=l9_4188;
float3 l9_4200;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4200=float3(pow(l9_4199.x,2.2),pow(l9_4199.y,2.2),pow(l9_4199.z,2.2));
}
else
{
l9_4200=l9_4199*l9_4199;
}
float3 l9_4201=l9_4200;
l9_4195.emissive=l9_4201;
l9_4195.metallic=l9_4189;
l9_4195.roughness=l9_4190;
l9_4195.ao=l9_4191;
l9_4195.specularAo=l9_4192;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_4202=l9_4195.positionWS;
l9_4195.ao=evaluateSSAO(l9_4202,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_4203=l9_4195;
SurfaceProperties l9_4204=l9_4203;
float3 l9_4205=mix(float3(0.039999999),l9_4204.albedo*l9_4204.metallic,float3(l9_4204.metallic));
float3 l9_4206=mix(l9_4204.albedo*(1.0-l9_4204.metallic),float3(0.0),float3(l9_4204.metallic));
l9_4203.albedo=l9_4206;
l9_4203.specColor=l9_4205;
SurfaceProperties l9_4207=l9_4203;
l9_4195=l9_4207;
SurfaceProperties l9_4208=l9_4195;
LightingComponents l9_4209;
l9_4209.directDiffuse=float3(0.0);
l9_4209.directSpecular=float3(0.0);
l9_4209.indirectDiffuse=float3(1.0);
l9_4209.indirectSpecular=float3(0.0);
l9_4209.emitted=float3(0.0);
l9_4209.transmitted=float3(0.0);
LightingComponents l9_4210=l9_4209;
LightingComponents l9_4211=l9_4210;
float3 l9_4212=l9_4208.viewDirWS;
int l9_4213=0;
float4 l9_4214=float4(l9_4208.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_4215;
LightProperties l9_4216;
int l9_4217=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_4217<sc_DirectionalLightsCount_tmp)
{
l9_4215.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_4217].direction;
l9_4215.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_4217].color;
l9_4216.direction=l9_4215.direction;
l9_4216.color=l9_4215.color.xyz;
l9_4216.attenuation=l9_4215.color.w;
l9_4216.attenuation*=l9_4214[(l9_4213<3) ? l9_4213 : 3];
l9_4213++;
LightingComponents l9_4218=l9_4211;
LightProperties l9_4219=l9_4216;
SurfaceProperties l9_4220=l9_4208;
float3 l9_4221=l9_4212;
SurfaceProperties l9_4222=l9_4220;
float3 l9_4223=l9_4219.direction;
float3 l9_4224=float3(fast::clamp(dot(l9_4222.normal,l9_4223),0.0,1.0));
l9_4218.directDiffuse+=((l9_4224*l9_4219.color)*l9_4219.attenuation);
SurfaceProperties l9_4225=l9_4220;
float3 l9_4226=l9_4219.direction;
float3 l9_4227=l9_4221;
l9_4218.directSpecular+=((calculateDirectSpecular(l9_4225,l9_4226,l9_4227)*l9_4219.color)*l9_4219.attenuation);
LightingComponents l9_4228=l9_4218;
l9_4211=l9_4228;
l9_4217++;
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
sc_PointLight_t_1 l9_4229;
LightProperties l9_4230;
int l9_4231=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_4231<sc_PointLightsCount_tmp)
{
l9_4229.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].falloffEnabled!=0;
l9_4229.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].falloffEndDistance;
l9_4229.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].negRcpFalloffEndDistance4;
l9_4229.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].angleScale;
l9_4229.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].angleOffset;
l9_4229.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].direction;
l9_4229.position=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].position;
l9_4229.color=(*sc_set0.UserUniforms).sc_PointLights[l9_4231].color;
float3 l9_4232=l9_4229.position-l9_4208.positionWS;
l9_4230.direction=normalize(l9_4232);
l9_4230.color=l9_4229.color.xyz;
l9_4230.attenuation=l9_4229.color.w;
l9_4230.attenuation*=l9_4214[(l9_4213<3) ? l9_4213 : 3];
float3 l9_4233=l9_4230.direction;
float3 l9_4234=l9_4229.direction;
float l9_4235=l9_4229.angleScale;
float l9_4236=l9_4229.angleOffset;
float l9_4237=dot(l9_4233,l9_4234);
float l9_4238=fast::clamp((l9_4237*l9_4235)+l9_4236,0.0,1.0);
float l9_4239=l9_4238*l9_4238;
l9_4230.attenuation*=l9_4239;
if (l9_4229.falloffEnabled)
{
float l9_4240=length(l9_4232);
float l9_4241=l9_4229.falloffEndDistance;
l9_4230.attenuation*=computeDistanceAttenuation(l9_4240,l9_4241);
}
l9_4213++;
LightingComponents l9_4242=l9_4211;
LightProperties l9_4243=l9_4230;
SurfaceProperties l9_4244=l9_4208;
float3 l9_4245=l9_4212;
SurfaceProperties l9_4246=l9_4244;
float3 l9_4247=l9_4243.direction;
float3 l9_4248=float3(fast::clamp(dot(l9_4246.normal,l9_4247),0.0,1.0));
l9_4242.directDiffuse+=((l9_4248*l9_4243.color)*l9_4243.attenuation);
SurfaceProperties l9_4249=l9_4244;
float3 l9_4250=l9_4243.direction;
float3 l9_4251=l9_4245;
l9_4242.directSpecular+=((calculateDirectSpecular(l9_4249,l9_4250,l9_4251)*l9_4243.color)*l9_4243.attenuation);
LightingComponents l9_4252=l9_4242;
l9_4211=l9_4252;
l9_4231++;
continue;
}
else
{
break;
}
}
}
bool l9_4253=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_4253)
{
float4 l9_4254=gl_FragCoord;
float2 l9_4255=l9_4254.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_4256=l9_4255;
float2 l9_4257=l9_4256;
int l9_4258=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_4259=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4259=0;
}
else
{
l9_4259=in.varStereoViewID;
}
int l9_4260=l9_4259;
l9_4258=1-l9_4260;
}
else
{
int l9_4261=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4261=0;
}
else
{
l9_4261=in.varStereoViewID;
}
int l9_4262=l9_4261;
l9_4258=l9_4262;
}
int l9_4263=l9_4258;
float2 l9_4264=l9_4257;
int l9_4265=l9_4263;
float2 l9_4266=l9_4264;
int l9_4267=l9_4265;
float l9_4268=0.0;
float4 l9_4269=float4(0.0);
float2 l9_4270=l9_4266;
int l9_4271=sc_RayTracedShadowTextureLayout_tmp;
int l9_4272=l9_4267;
float l9_4273=l9_4268;
float2 l9_4274=l9_4270;
int l9_4275=l9_4271;
int l9_4276=l9_4272;
float3 l9_4277=float3(0.0);
if (l9_4275==0)
{
l9_4277=float3(l9_4274,0.0);
}
else
{
if (l9_4275==1)
{
l9_4277=float3(l9_4274.x,(l9_4274.y*0.5)+(0.5-(float(l9_4276)*0.5)),0.0);
}
else
{
l9_4277=float3(l9_4274,float(l9_4276));
}
}
float3 l9_4278=l9_4277;
float3 l9_4279=l9_4278;
float2 l9_4280=l9_4279.xy;
float l9_4281=l9_4273;
float4 l9_4282=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_4280,bias(l9_4281));
float4 l9_4283=l9_4282;
l9_4269=l9_4283;
float4 l9_4284=l9_4269;
float4 l9_4285=l9_4284;
float4 l9_4286=l9_4285;
float l9_4287=l9_4286.x;
float3 l9_4288=float3(l9_4287);
float3 l9_4289=l9_4288;
l9_4211.directDiffuse*=(float3(1.0)-l9_4289);
l9_4211.directSpecular*=(float3(1.0)-l9_4289);
}
SurfaceProperties l9_4290=l9_4208;
float3 l9_4291=l9_4290.normal;
float3 l9_4292=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_4293=l9_4291;
float3 l9_4294=l9_4293;
float l9_4295=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_4296=float2(0.0);
float l9_4297=l9_4294.x;
float l9_4298=-l9_4294.z;
float l9_4299=(l9_4297<0.0) ? (-1.0) : 1.0;
float l9_4300=l9_4299*acos(fast::clamp(l9_4298/length(float2(l9_4297,l9_4298)),-1.0,1.0));
l9_4296.x=l9_4300-1.5707964;
l9_4296.y=acos(l9_4294.y);
l9_4296/=float2(6.2831855,3.1415927);
l9_4296.y=1.0-l9_4296.y;
l9_4296.x+=(l9_4295/360.0);
l9_4296.x=fract((l9_4296.x+floor(l9_4296.x))+1.0);
float2 l9_4301=l9_4296;
float2 l9_4302=l9_4301;
float4 l9_4303=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_4304=l9_4302;
float2 l9_4305=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_4306=5.0;
l9_4302=calcSeamlessPanoramicUvsForSampling(l9_4304,l9_4305,l9_4306);
}
float2 l9_4307=l9_4302;
float l9_4308=13.0;
int l9_4309=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_4310=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4310=0;
}
else
{
l9_4310=in.varStereoViewID;
}
int l9_4311=l9_4310;
l9_4309=1-l9_4311;
}
else
{
int l9_4312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4312=0;
}
else
{
l9_4312=in.varStereoViewID;
}
int l9_4313=l9_4312;
l9_4309=l9_4313;
}
int l9_4314=l9_4309;
float2 l9_4315=l9_4307;
int l9_4316=l9_4314;
float l9_4317=l9_4308;
float4 l9_4318=float4(0.0);
float2 l9_4319=l9_4315;
int l9_4320=sc_EnvmapSpecularLayout_tmp;
int l9_4321=l9_4316;
float l9_4322=l9_4317;
float2 l9_4323=l9_4319;
int l9_4324=l9_4320;
int l9_4325=l9_4321;
float3 l9_4326=float3(0.0);
if (l9_4324==0)
{
l9_4326=float3(l9_4323,0.0);
}
else
{
if (l9_4324==1)
{
l9_4326=float3(l9_4323.x,(l9_4323.y*0.5)+(0.5-(float(l9_4325)*0.5)),0.0);
}
else
{
l9_4326=float3(l9_4323,float(l9_4325));
}
}
float3 l9_4327=l9_4326;
float3 l9_4328=l9_4327;
float2 l9_4329=l9_4328.xy;
float l9_4330=l9_4322;
float4 l9_4331=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_4329,bias(l9_4330));
float4 l9_4332=l9_4331;
l9_4318=l9_4332;
float4 l9_4333=l9_4318;
float4 l9_4334=l9_4333;
l9_4303=l9_4334;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_4335=l9_4302;
float2 l9_4336=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_4337=0.0;
l9_4302=calcSeamlessPanoramicUvsForSampling(l9_4335,l9_4336,l9_4337);
float2 l9_4338=l9_4302;
float l9_4339=-13.0;
int l9_4340=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_4341=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4341=0;
}
else
{
l9_4341=in.varStereoViewID;
}
int l9_4342=l9_4341;
l9_4340=1-l9_4342;
}
else
{
int l9_4343=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4343=0;
}
else
{
l9_4343=in.varStereoViewID;
}
int l9_4344=l9_4343;
l9_4340=l9_4344;
}
int l9_4345=l9_4340;
float2 l9_4346=l9_4338;
int l9_4347=l9_4345;
float l9_4348=l9_4339;
float4 l9_4349=float4(0.0);
float2 l9_4350=l9_4346;
int l9_4351=sc_EnvmapDiffuseLayout_tmp;
int l9_4352=l9_4347;
float l9_4353=l9_4348;
float2 l9_4354=l9_4350;
int l9_4355=l9_4351;
int l9_4356=l9_4352;
float3 l9_4357=float3(0.0);
if (l9_4355==0)
{
l9_4357=float3(l9_4354,0.0);
}
else
{
if (l9_4355==1)
{
l9_4357=float3(l9_4354.x,(l9_4354.y*0.5)+(0.5-(float(l9_4356)*0.5)),0.0);
}
else
{
l9_4357=float3(l9_4354,float(l9_4356));
}
}
float3 l9_4358=l9_4357;
float3 l9_4359=l9_4358;
float2 l9_4360=l9_4359.xy;
float l9_4361=l9_4353;
float4 l9_4362=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_4360,bias(l9_4361));
float4 l9_4363=l9_4362;
l9_4349=l9_4363;
float4 l9_4364=l9_4349;
float4 l9_4365=l9_4364;
l9_4303=l9_4365;
}
else
{
float2 l9_4366=l9_4302;
float l9_4367=13.0;
int l9_4368=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_4369=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4369=0;
}
else
{
l9_4369=in.varStereoViewID;
}
int l9_4370=l9_4369;
l9_4368=1-l9_4370;
}
else
{
int l9_4371=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4371=0;
}
else
{
l9_4371=in.varStereoViewID;
}
int l9_4372=l9_4371;
l9_4368=l9_4372;
}
int l9_4373=l9_4368;
float2 l9_4374=l9_4366;
int l9_4375=l9_4373;
float l9_4376=l9_4367;
float4 l9_4377=float4(0.0);
float2 l9_4378=l9_4374;
int l9_4379=sc_EnvmapSpecularLayout_tmp;
int l9_4380=l9_4375;
float l9_4381=l9_4376;
float2 l9_4382=l9_4378;
int l9_4383=l9_4379;
int l9_4384=l9_4380;
float3 l9_4385=float3(0.0);
if (l9_4383==0)
{
l9_4385=float3(l9_4382,0.0);
}
else
{
if (l9_4383==1)
{
l9_4385=float3(l9_4382.x,(l9_4382.y*0.5)+(0.5-(float(l9_4384)*0.5)),0.0);
}
else
{
l9_4385=float3(l9_4382,float(l9_4384));
}
}
float3 l9_4386=l9_4385;
float3 l9_4387=l9_4386;
float2 l9_4388=l9_4387.xy;
float l9_4389=l9_4381;
float4 l9_4390=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_4388,bias(l9_4389));
float4 l9_4391=l9_4390;
l9_4377=l9_4391;
float4 l9_4392=l9_4377;
float4 l9_4393=l9_4392;
l9_4303=l9_4393;
}
}
float4 l9_4394=l9_4303;
float3 l9_4395=l9_4394.xyz*(1.0/l9_4394.w);
float3 l9_4396=l9_4395*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_4292=l9_4396;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_4397=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_4398=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_4399=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_4400=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_4401=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_4402=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_4403=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_4404=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_4405=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_4406=-l9_4291;
float l9_4407=0.0;
l9_4407=l9_4406.x;
float l9_4408=l9_4406.y;
float l9_4409=l9_4406.z;
float l9_4410=l9_4407*l9_4407;
float l9_4411=l9_4408*l9_4408;
float l9_4412=l9_4409*l9_4409;
float l9_4413=l9_4407*l9_4408;
float l9_4414=l9_4408*l9_4409;
float l9_4415=l9_4407*l9_4409;
float3 l9_4416=((((((l9_4405*0.42904299)*(l9_4410-l9_4411))+((l9_4403*0.74312502)*l9_4412))+(l9_4397*0.88622701))-(l9_4403*0.24770799))+((((l9_4401*l9_4413)+(l9_4404*l9_4415))+(l9_4402*l9_4414))*0.85808599))+((((l9_4400*l9_4407)+(l9_4398*l9_4408))+(l9_4399*l9_4409))*1.0233279);
l9_4292=l9_4416*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_4417=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_4417)
{
float4 l9_4418=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_4292=mix(l9_4292,l9_4418.xyz,float3(l9_4418.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_4292+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_4292.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_4292+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_4292.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_4292+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_4292.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_4419=l9_4291;
float3 l9_4420=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_4421;
float l9_4422;
int l9_4423=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_4423<sc_LightEstimationSGCount_tmp)
{
l9_4421.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_4423].color;
l9_4421.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_4423].sharpness;
l9_4421.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_4423].axis;
float3 l9_4424=l9_4419;
float l9_4425=dot(l9_4421.axis,l9_4424);
float l9_4426=l9_4421.sharpness;
float l9_4427=0.36000001;
float l9_4428=1.0/(4.0*l9_4427);
float l9_4429=exp(-l9_4426);
float l9_4430=l9_4429*l9_4429;
float l9_4431=1.0/l9_4426;
float l9_4432=(1.0+(2.0*l9_4430))-l9_4431;
float l9_4433=((l9_4429-l9_4430)*l9_4431)-l9_4430;
float l9_4434=sqrt(1.0-l9_4432);
float l9_4435=l9_4427*l9_4425;
float l9_4436=l9_4428*l9_4434;
float l9_4437=l9_4435+l9_4436;
float l9_4438=fast::clamp(l9_4425,0.0,1.0);
if (step(abs(l9_4435),l9_4436)>0.5)
{
l9_4422=(l9_4437*l9_4437)/l9_4434;
}
else
{
l9_4422=l9_4438;
}
l9_4438=l9_4422;
float l9_4439=(l9_4432*l9_4438)+l9_4433;
sc_SphericalGaussianLight_t l9_4440=l9_4421;
float3 l9_4441=(l9_4440.color/float3(l9_4440.sharpness))*6.2831855;
float3 l9_4442=(l9_4441*l9_4439)/float3(3.1415927);
l9_4420+=l9_4442;
l9_4423++;
continue;
}
else
{
break;
}
}
float3 l9_4443=l9_4420;
l9_4292+=l9_4443;
}
float3 l9_4444=l9_4292;
float3 l9_4445=l9_4444;
l9_4211.indirectDiffuse=l9_4445;
SurfaceProperties l9_4446=l9_4208;
float3 l9_4447=l9_4212;
float3 l9_4448=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_4449=l9_4446;
float3 l9_4450=l9_4447;
float3 l9_4451=l9_4449.normal;
float3 l9_4452=reflect(-l9_4450,l9_4451);
float3 l9_4453=l9_4451;
float3 l9_4454=l9_4452;
float l9_4455=l9_4449.roughness;
l9_4452=getSpecularDominantDir(l9_4453,l9_4454,l9_4455);
float l9_4456=l9_4449.roughness;
float l9_4457=fast::clamp(pow(l9_4456,0.66666669),0.0,1.0)*5.0;
float l9_4458=l9_4457;
float l9_4459=l9_4458;
float3 l9_4460=l9_4452;
float l9_4461=l9_4459;
float3 l9_4462=l9_4460;
float l9_4463=l9_4461;
float4 l9_4464=float4(0.0);
float3 l9_4465=l9_4462;
float l9_4466=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_4467=float2(0.0);
float l9_4468=l9_4465.x;
float l9_4469=-l9_4465.z;
float l9_4470=(l9_4468<0.0) ? (-1.0) : 1.0;
float l9_4471=l9_4470*acos(fast::clamp(l9_4469/length(float2(l9_4468,l9_4469)),-1.0,1.0));
l9_4467.x=l9_4471-1.5707964;
l9_4467.y=acos(l9_4465.y);
l9_4467/=float2(6.2831855,3.1415927);
l9_4467.y=1.0-l9_4467.y;
l9_4467.x+=(l9_4466/360.0);
l9_4467.x=fract((l9_4467.x+floor(l9_4467.x))+1.0);
float2 l9_4472=l9_4467;
float2 l9_4473=l9_4472;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_4474=floor(l9_4463);
float l9_4475=ceil(l9_4463);
float l9_4476=l9_4463-l9_4474;
float2 l9_4477=l9_4473;
float2 l9_4478=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_4479=l9_4474;
float2 l9_4480=calcSeamlessPanoramicUvsForSampling(l9_4477,l9_4478,l9_4479);
float2 l9_4481=l9_4480;
float l9_4482=l9_4474;
float2 l9_4483=l9_4481;
float l9_4484=l9_4482;
int l9_4485=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_4486=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4486=0;
}
else
{
l9_4486=in.varStereoViewID;
}
int l9_4487=l9_4486;
l9_4485=1-l9_4487;
}
else
{
int l9_4488=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4488=0;
}
else
{
l9_4488=in.varStereoViewID;
}
int l9_4489=l9_4488;
l9_4485=l9_4489;
}
int l9_4490=l9_4485;
float2 l9_4491=l9_4483;
int l9_4492=l9_4490;
float l9_4493=l9_4484;
float4 l9_4494=float4(0.0);
float2 l9_4495=l9_4491;
int l9_4496=sc_EnvmapSpecularLayout_tmp;
int l9_4497=l9_4492;
float l9_4498=l9_4493;
float2 l9_4499=l9_4495;
int l9_4500=l9_4496;
int l9_4501=l9_4497;
float3 l9_4502=float3(0.0);
if (l9_4500==0)
{
l9_4502=float3(l9_4499,0.0);
}
else
{
if (l9_4500==1)
{
l9_4502=float3(l9_4499.x,(l9_4499.y*0.5)+(0.5-(float(l9_4501)*0.5)),0.0);
}
else
{
l9_4502=float3(l9_4499,float(l9_4501));
}
}
float3 l9_4503=l9_4502;
float3 l9_4504=l9_4503;
float2 l9_4505=l9_4504.xy;
float l9_4506=l9_4498;
float4 l9_4507=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_4505,level(l9_4506));
float4 l9_4508=l9_4507;
l9_4494=l9_4508;
float4 l9_4509=l9_4494;
float4 l9_4510=l9_4509;
float4 l9_4511=l9_4510;
float4 l9_4512=l9_4511;
float2 l9_4513=l9_4473;
float2 l9_4514=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_4515=l9_4475;
float2 l9_4516=calcSeamlessPanoramicUvsForSampling(l9_4513,l9_4514,l9_4515);
float2 l9_4517=l9_4516;
float l9_4518=l9_4475;
float2 l9_4519=l9_4517;
float l9_4520=l9_4518;
int l9_4521=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_4522=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4522=0;
}
else
{
l9_4522=in.varStereoViewID;
}
int l9_4523=l9_4522;
l9_4521=1-l9_4523;
}
else
{
int l9_4524=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4524=0;
}
else
{
l9_4524=in.varStereoViewID;
}
int l9_4525=l9_4524;
l9_4521=l9_4525;
}
int l9_4526=l9_4521;
float2 l9_4527=l9_4519;
int l9_4528=l9_4526;
float l9_4529=l9_4520;
float4 l9_4530=float4(0.0);
float2 l9_4531=l9_4527;
int l9_4532=sc_EnvmapSpecularLayout_tmp;
int l9_4533=l9_4528;
float l9_4534=l9_4529;
float2 l9_4535=l9_4531;
int l9_4536=l9_4532;
int l9_4537=l9_4533;
float3 l9_4538=float3(0.0);
if (l9_4536==0)
{
l9_4538=float3(l9_4535,0.0);
}
else
{
if (l9_4536==1)
{
l9_4538=float3(l9_4535.x,(l9_4535.y*0.5)+(0.5-(float(l9_4537)*0.5)),0.0);
}
else
{
l9_4538=float3(l9_4535,float(l9_4537));
}
}
float3 l9_4539=l9_4538;
float3 l9_4540=l9_4539;
float2 l9_4541=l9_4540.xy;
float l9_4542=l9_4534;
float4 l9_4543=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_4541,level(l9_4542));
float4 l9_4544=l9_4543;
l9_4530=l9_4544;
float4 l9_4545=l9_4530;
float4 l9_4546=l9_4545;
float4 l9_4547=l9_4546;
float4 l9_4548=l9_4547;
l9_4464=mix(l9_4512,l9_4548,float4(l9_4476));
}
else
{
float2 l9_4549=l9_4473;
float l9_4550=l9_4463;
float2 l9_4551=l9_4549;
float l9_4552=l9_4550;
int l9_4553=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_4554=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4554=0;
}
else
{
l9_4554=in.varStereoViewID;
}
int l9_4555=l9_4554;
l9_4553=1-l9_4555;
}
else
{
int l9_4556=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4556=0;
}
else
{
l9_4556=in.varStereoViewID;
}
int l9_4557=l9_4556;
l9_4553=l9_4557;
}
int l9_4558=l9_4553;
float2 l9_4559=l9_4551;
int l9_4560=l9_4558;
float l9_4561=l9_4552;
float4 l9_4562=float4(0.0);
float2 l9_4563=l9_4559;
int l9_4564=sc_EnvmapSpecularLayout_tmp;
int l9_4565=l9_4560;
float l9_4566=l9_4561;
float2 l9_4567=l9_4563;
int l9_4568=l9_4564;
int l9_4569=l9_4565;
float3 l9_4570=float3(0.0);
if (l9_4568==0)
{
l9_4570=float3(l9_4567,0.0);
}
else
{
if (l9_4568==1)
{
l9_4570=float3(l9_4567.x,(l9_4567.y*0.5)+(0.5-(float(l9_4569)*0.5)),0.0);
}
else
{
l9_4570=float3(l9_4567,float(l9_4569));
}
}
float3 l9_4571=l9_4570;
float3 l9_4572=l9_4571;
float2 l9_4573=l9_4572.xy;
float l9_4574=l9_4566;
float4 l9_4575=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_4573,level(l9_4574));
float4 l9_4576=l9_4575;
l9_4562=l9_4576;
float4 l9_4577=l9_4562;
float4 l9_4578=l9_4577;
float4 l9_4579=l9_4578;
l9_4464=l9_4579;
}
float4 l9_4580=l9_4464;
float3 l9_4581=l9_4580.xyz*(1.0/l9_4580.w);
float3 l9_4582=l9_4581;
float3 l9_4583=l9_4582*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_4583+=float3(1e-06);
float3 l9_4584=l9_4583;
float3 l9_4585=l9_4584;
bool l9_4586=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_4586)
{
float4 l9_4587=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_4585=mix(l9_4585,l9_4587.xyz,float3(l9_4587.w));
}
SurfaceProperties l9_4588=l9_4449;
float l9_4589=abs(dot(l9_4451,l9_4450));
float3 l9_4590=l9_4585*envBRDFApprox(l9_4588,l9_4589);
l9_4448+=l9_4590;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_4591=l9_4446;
float3 l9_4592=l9_4447;
float l9_4593=fast::clamp(l9_4591.roughness*l9_4591.roughness,0.0099999998,1.0);
float3 l9_4594=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_4591.specColor;
sc_SphericalGaussianLight_t l9_4595;
sc_SphericalGaussianLight_t l9_4596;
sc_SphericalGaussianLight_t l9_4597;
int l9_4598=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_4598<sc_LightEstimationSGCount_tmp)
{
l9_4595.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_4598].color;
l9_4595.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_4598].sharpness;
l9_4595.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_4598].axis;
float3 l9_4599=l9_4591.normal;
float l9_4600=l9_4593;
float3 l9_4601=l9_4592;
float3 l9_4602=l9_4591.specColor;
float3 l9_4603=l9_4599;
float l9_4604=l9_4600;
l9_4596.axis=l9_4603;
float l9_4605=l9_4604*l9_4604;
l9_4596.sharpness=2.0/l9_4605;
l9_4596.color=float3(1.0/(3.1415927*l9_4605));
sc_SphericalGaussianLight_t l9_4606=l9_4596;
sc_SphericalGaussianLight_t l9_4607=l9_4606;
sc_SphericalGaussianLight_t l9_4608=l9_4607;
float3 l9_4609=l9_4601;
l9_4597.axis=reflect(-l9_4609,l9_4608.axis);
l9_4597.color=l9_4608.color;
l9_4597.sharpness=l9_4608.sharpness;
l9_4597.sharpness/=(4.0*fast::max(dot(l9_4608.axis,l9_4609),9.9999997e-05));
sc_SphericalGaussianLight_t l9_4610=l9_4597;
sc_SphericalGaussianLight_t l9_4611=l9_4610;
sc_SphericalGaussianLight_t l9_4612=l9_4611;
sc_SphericalGaussianLight_t l9_4613=l9_4595;
float l9_4614=length((l9_4612.axis*l9_4612.sharpness)+(l9_4613.axis*l9_4613.sharpness));
float3 l9_4615=(l9_4612.color*exp((l9_4614-l9_4612.sharpness)-l9_4613.sharpness))*l9_4613.color;
float l9_4616=1.0-exp((-2.0)*l9_4614);
float3 l9_4617=((l9_4615*6.2831855)*l9_4616)/float3(l9_4614);
float3 l9_4618=l9_4617;
float3 l9_4619=l9_4611.axis;
float l9_4620=l9_4600*l9_4600;
float l9_4621=fast::clamp(dot(l9_4599,l9_4619),0.0,1.0);
float l9_4622=fast::clamp(dot(l9_4599,l9_4601),0.0,1.0);
float3 l9_4623=normalize(l9_4611.axis+l9_4601);
float l9_4624=l9_4620;
float l9_4625=l9_4621;
float l9_4626=1.0/(l9_4625+sqrt(l9_4624+(((1.0-l9_4624)*l9_4625)*l9_4625)));
float l9_4627=l9_4620;
float l9_4628=l9_4622;
float l9_4629=1.0/(l9_4628+sqrt(l9_4627+(((1.0-l9_4627)*l9_4628)*l9_4628)));
l9_4618*=(l9_4626*l9_4629);
float l9_4630=pow(1.0-fast::clamp(dot(l9_4619,l9_4623),0.0,1.0),5.0);
l9_4618*=(l9_4602+((float3(1.0)-l9_4602)*l9_4630));
l9_4618*=l9_4621;
float3 l9_4631=l9_4618;
l9_4594+=l9_4631;
l9_4598++;
continue;
}
else
{
break;
}
}
float3 l9_4632=l9_4594;
l9_4448+=l9_4632;
}
float3 l9_4633=l9_4448;
l9_4211.indirectSpecular=l9_4633;
LightingComponents l9_4634=l9_4211;
LightingComponents l9_4635=l9_4634;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_4635.directDiffuse=float3(0.0);
l9_4635.indirectDiffuse=float3(0.0);
float4 l9_4636=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_4637=out.FragColor0;
float4 l9_4638=l9_4637;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_4638.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_4639=l9_4638;
l9_4636=l9_4639;
}
else
{
float4 l9_4640=gl_FragCoord;
float2 l9_4641=l9_4640.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_4642=l9_4641;
float2 l9_4643=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4644=1;
int l9_4645=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4645=0;
}
else
{
l9_4645=in.varStereoViewID;
}
int l9_4646=l9_4645;
int l9_4647=l9_4646;
float3 l9_4648=float3(l9_4642,0.0);
int l9_4649=l9_4644;
int l9_4650=l9_4647;
if (l9_4649==1)
{
l9_4648.y=((2.0*l9_4648.y)+float(l9_4650))-1.0;
}
float2 l9_4651=l9_4648.xy;
l9_4643=l9_4651;
}
else
{
l9_4643=l9_4642;
}
float2 l9_4652=l9_4643;
float2 l9_4653=l9_4652;
float2 l9_4654=l9_4653;
int l9_4655=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_4656=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4656=0;
}
else
{
l9_4656=in.varStereoViewID;
}
int l9_4657=l9_4656;
l9_4655=1-l9_4657;
}
else
{
int l9_4658=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4658=0;
}
else
{
l9_4658=in.varStereoViewID;
}
int l9_4659=l9_4658;
l9_4655=l9_4659;
}
int l9_4660=l9_4655;
float2 l9_4661=l9_4654;
int l9_4662=l9_4660;
float2 l9_4663=l9_4661;
int l9_4664=l9_4662;
float l9_4665=0.0;
float4 l9_4666=float4(0.0);
float2 l9_4667=l9_4663;
int l9_4668=sc_ScreenTextureLayout_tmp;
int l9_4669=l9_4664;
float l9_4670=l9_4665;
float2 l9_4671=l9_4667;
int l9_4672=l9_4668;
int l9_4673=l9_4669;
float3 l9_4674=float3(0.0);
if (l9_4672==0)
{
l9_4674=float3(l9_4671,0.0);
}
else
{
if (l9_4672==1)
{
l9_4674=float3(l9_4671.x,(l9_4671.y*0.5)+(0.5-(float(l9_4673)*0.5)),0.0);
}
else
{
l9_4674=float3(l9_4671,float(l9_4673));
}
}
float3 l9_4675=l9_4674;
float3 l9_4676=l9_4675;
float2 l9_4677=l9_4676.xy;
float l9_4678=l9_4670;
float4 l9_4679=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_4677,bias(l9_4678));
float4 l9_4680=l9_4679;
l9_4666=l9_4680;
float4 l9_4681=l9_4666;
float4 l9_4682=l9_4681;
float4 l9_4683=l9_4682;
l9_4636=l9_4683;
}
float4 l9_4684=l9_4636;
float4 l9_4685=l9_4684;
float3 l9_4686=l9_4685.xyz;
float3 l9_4687;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4687=float3(pow(l9_4686.x,2.2),pow(l9_4686.y,2.2),pow(l9_4686.z,2.2));
}
else
{
l9_4687=l9_4686*l9_4686;
}
float3 l9_4688=l9_4687;
float3 l9_4689=l9_4688;
l9_4635.transmitted=l9_4689*mix(float3(1.0),l9_4195.albedo,float3(l9_4195.opacity));
l9_4195.opacity=1.0;
}
bool l9_4690=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_4690=true;
}
SurfaceProperties l9_4691=l9_4195;
LightingComponents l9_4692=l9_4635;
bool l9_4693=l9_4690;
float3 l9_4694=float3(0.0);
bool l9_4695=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_4695)
{
l9_4694=l9_4691.albedo*(l9_4692.directDiffuse+(l9_4692.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_4694=l9_4691.albedo*(l9_4692.directDiffuse+(l9_4692.indirectDiffuse*l9_4691.ao));
}
float3 l9_4696=l9_4692.directSpecular+(l9_4692.indirectSpecular*l9_4691.specularAo);
float3 l9_4697=l9_4691.emissive;
float3 l9_4698=l9_4692.transmitted;
if (l9_4693)
{
float l9_4699=l9_4691.opacity;
l9_4694*=srgbToLinear(l9_4699);
}
float3 l9_4700=((l9_4694+l9_4696)+l9_4697)+l9_4698;
float3 l9_4701=l9_4700;
float4 l9_4702=float4(l9_4701,l9_4195.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_4703=l9_4702.xyz;
float l9_4704=1.8;
float l9_4705=1.4;
float l9_4706=0.5;
float l9_4707=1.5;
float3 l9_4708=(l9_4703*((l9_4703*l9_4704)+float3(l9_4705)))/((l9_4703*((l9_4703*l9_4704)+float3(l9_4706)))+float3(l9_4707));
l9_4702=float4(l9_4708.x,l9_4708.y,l9_4708.z,l9_4702.w);
}
float3 l9_4709=l9_4702.xyz;
float l9_4710=l9_4709.x;
float l9_4711=l9_4709.y;
float l9_4712=l9_4709.z;
float3 l9_4713=float3(linearToSrgb(l9_4710),linearToSrgb(l9_4711),linearToSrgb(l9_4712));
l9_4702=float4(l9_4713.x,l9_4713.y,l9_4713.z,l9_4702.w);
float4 l9_4714=l9_4702;
float4 l9_4715=l9_4714;
l9_4715=fast::max(l9_4715,float4(0.0));
l9_4173=l9_4715;
l9_709=l9_4173;
l9_713=l9_709;
}
l9_706=l9_713;
param_4=l9_706;
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
float4 l9_4716=param_8;
float4 l9_4717=float4(0.0);
float4 l9_4718=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_4719=out.FragColor0;
float4 l9_4720=l9_4719;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_4720.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_4721=l9_4720;
l9_4718=l9_4721;
}
else
{
float4 l9_4722=gl_FragCoord;
float2 l9_4723=l9_4722.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_4724=l9_4723;
float2 l9_4725=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4726=1;
int l9_4727=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4727=0;
}
else
{
l9_4727=in.varStereoViewID;
}
int l9_4728=l9_4727;
int l9_4729=l9_4728;
float3 l9_4730=float3(l9_4724,0.0);
int l9_4731=l9_4726;
int l9_4732=l9_4729;
if (l9_4731==1)
{
l9_4730.y=((2.0*l9_4730.y)+float(l9_4732))-1.0;
}
float2 l9_4733=l9_4730.xy;
l9_4725=l9_4733;
}
else
{
l9_4725=l9_4724;
}
float2 l9_4734=l9_4725;
float2 l9_4735=l9_4734;
float2 l9_4736=l9_4735;
int l9_4737=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_4738=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4738=0;
}
else
{
l9_4738=in.varStereoViewID;
}
int l9_4739=l9_4738;
l9_4737=1-l9_4739;
}
else
{
int l9_4740=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4740=0;
}
else
{
l9_4740=in.varStereoViewID;
}
int l9_4741=l9_4740;
l9_4737=l9_4741;
}
int l9_4742=l9_4737;
float2 l9_4743=l9_4736;
int l9_4744=l9_4742;
float2 l9_4745=l9_4743;
int l9_4746=l9_4744;
float l9_4747=0.0;
float4 l9_4748=float4(0.0);
float2 l9_4749=l9_4745;
int l9_4750=sc_ScreenTextureLayout_tmp;
int l9_4751=l9_4746;
float l9_4752=l9_4747;
float2 l9_4753=l9_4749;
int l9_4754=l9_4750;
int l9_4755=l9_4751;
float3 l9_4756=float3(0.0);
if (l9_4754==0)
{
l9_4756=float3(l9_4753,0.0);
}
else
{
if (l9_4754==1)
{
l9_4756=float3(l9_4753.x,(l9_4753.y*0.5)+(0.5-(float(l9_4755)*0.5)),0.0);
}
else
{
l9_4756=float3(l9_4753,float(l9_4755));
}
}
float3 l9_4757=l9_4756;
float3 l9_4758=l9_4757;
float2 l9_4759=l9_4758.xy;
float l9_4760=l9_4752;
float4 l9_4761=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_4759,bias(l9_4760));
float4 l9_4762=l9_4761;
l9_4748=l9_4762;
float4 l9_4763=l9_4748;
float4 l9_4764=l9_4763;
float4 l9_4765=l9_4764;
l9_4718=l9_4765;
}
float4 l9_4766=l9_4718;
float4 l9_4767=l9_4766;
float3 l9_4768=l9_4767.xyz;
float3 l9_4769=l9_4768;
float3 l9_4770=l9_4716.xyz;
float3 l9_4771=definedBlend(l9_4769,l9_4770,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_4717=float4(l9_4771.x,l9_4771.y,l9_4771.z,l9_4717.w);
float3 l9_4772=mix(l9_4768,l9_4717.xyz,float3(l9_4716.w));
l9_4717=float4(l9_4772.x,l9_4772.y,l9_4772.z,l9_4717.w);
l9_4717.w=1.0;
float4 l9_4773=l9_4717;
param_8=l9_4773;
}
else
{
float4 l9_4774=param_8;
float4 l9_4775=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_4775=float4(mix(float3(1.0),l9_4774.xyz,float3(l9_4774.w)),l9_4774.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_4776=l9_4774.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_4776=fast::clamp(l9_4776,0.0,1.0);
}
l9_4775=float4(l9_4774.xyz*l9_4776,l9_4776);
}
else
{
l9_4775=l9_4774;
}
}
float4 l9_4777=l9_4775;
param_8=l9_4777;
}
}
float4 l9_4778=param_8;
Output_Color0=l9_4778;
float4 l9_4779=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_4779=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_4779=float4(0.0);
}
float4 l9_4780=l9_4779;
float4 Cost=l9_4780;
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
float4 TintColor;
float4 repelflipbookTexSize;
float4 repelflipbookTexDims;
float4 repelflipbookTexView;
float3x3 repelflipbookTexTransform;
float4 repelflipbookTexUvMinMax;
float4 repelflipbookTexBorderColor;
float intensity;
float Port_RangeMinA_N171;
float Port_RangeMaxA_N171;
float Port_RangeMinB_N171;
float Port_RangeMaxB_N171;
float Port_Import_N155;
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
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*8.0;
ssParticle l9_19=param_1;
int l9_20=l9_0;
float l9_21;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_21=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_20];
}
else
{
l9_21=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_22=l9_21;
l9_19.Seed=(l9_19.Ratio1D*0.97637898)+0.151235;
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_1=l9_19;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float param_2=1.0;
ssGlobals param_3=Globals;
float l9_24=0.0;
float l9_25=float((*sc_set0.UserUniforms).isIdle!=0);
l9_24=l9_25;
param_2=l9_24;
if ((param_2*1.0)!=0.0)
{
float2 l9_26=float2(0.0);
l9_26=param_3.Surface_UVCoord0;
float2 l9_27=float2(0.0);
l9_27=l9_26*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_28=float2(0.0);
l9_28=l9_27-float2(1.0);
float l9_29=0.0;
l9_29=dot(l9_28,l9_28);
float l9_30=0.0;
l9_30=fast::clamp(l9_29+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_31=0.0;
l9_31=1.0-l9_30;
float l9_32=0.0;
float l9_33;
if (l9_31<=0.0)
{
l9_33=0.0;
}
else
{
l9_33=sqrt(l9_31);
}
l9_32=l9_33;
float3 l9_34=float3(0.0);
l9_34=float3(l9_28.x,l9_28.y,l9_34.z);
l9_34.z=l9_32;
float l9_35=0.0;
l9_35=distance(l9_26,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_36=0.0;
l9_36=float(l9_35<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_37=float3(0.0);
l9_37=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_34,float3(l9_36));
float3 l9_38=float3(0.0);
l9_38=l9_37;
float3 l9_39=l9_38;
float l9_40=(*sc_set0.UserUniforms).Port_Roughness_N026;
ssGlobals l9_41=param_3;
l9_41.BumpedNormal=float3x3(float3(l9_41.VertexTangent_WorldSpace),float3(l9_41.VertexBinormal_WorldSpace),float3(l9_41.VertexNormal_WorldSpace))*l9_39;
float3 l9_42=l9_41.PositionWS;
float3 l9_43=l9_41.BumpedNormal;
float l9_44=l9_40;
float3 l9_45=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_42);
if (dot(l9_45,l9_43)>=(-0.050000001))
{
uint3 l9_46=uint3(round((l9_42-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_46.x,l9_46.y,l9_46.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_47=l9_43;
float l9_48=dot(abs(l9_47),float3(1.0));
l9_47/=float3(l9_48);
float l9_49=fast::clamp(-l9_47.z,0.0,1.0);
float2 l9_50=l9_47.xy;
float l9_51;
if (l9_47.x>=0.0)
{
l9_51=l9_49;
}
else
{
l9_51=-l9_49;
}
l9_50.x+=l9_51;
float l9_52;
if (l9_47.y>=0.0)
{
l9_52=l9_49;
}
else
{
l9_52=-l9_49;
}
l9_50.y+=l9_52;
float2 l9_53=l9_50;
float2 l9_54=l9_53;
uint2 l9_55=uint2(as_type<uint>(half2(float2(l9_54.x,0.0))),as_type<uint>(half2(float2(l9_54.y,0.0))));
out.normal_and_more=uint4(l9_55.x,l9_55.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_56;
if (l9_44<0.0)
{
l9_56=1023u;
}
else
{
l9_56=uint(fast::clamp(l9_44,0.0,1.0)*1000.0);
}
uint l9_57=l9_56;
l9_57 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_57;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float l9_58=1.0;
ssGlobals l9_59=param_3;
float l9_60=0.0;
float l9_61=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_60=l9_61;
l9_58=l9_60;
if ((l9_58*1.0)!=0.0)
{
float2 l9_62=float2(0.0);
l9_62=l9_59.Surface_UVCoord0;
float2 l9_63=float2(0.0);
l9_63=l9_62*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_64=float2(0.0);
l9_64=l9_63-float2(1.0);
float l9_65=0.0;
l9_65=dot(l9_64,l9_64);
float l9_66=0.0;
l9_66=fast::clamp(l9_65+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_67=0.0;
l9_67=1.0-l9_66;
float l9_68=0.0;
float l9_69;
if (l9_67<=0.0)
{
l9_69=0.0;
}
else
{
l9_69=sqrt(l9_67);
}
l9_68=l9_69;
float3 l9_70=float3(0.0);
l9_70=float3(l9_64.x,l9_64.y,l9_70.z);
l9_70.z=l9_68;
float l9_71=0.0;
l9_71=distance(l9_62,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_72=0.0;
l9_72=float(l9_71<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_73=float3(0.0);
l9_73=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_70,float3(l9_72));
float3 l9_74=float3(0.0);
l9_74=l9_73;
float3 l9_75=l9_74;
float l9_76=(*sc_set0.UserUniforms).Port_Roughness_N026;
ssGlobals l9_77=l9_59;
l9_77.BumpedNormal=float3x3(float3(l9_77.VertexTangent_WorldSpace),float3(l9_77.VertexBinormal_WorldSpace),float3(l9_77.VertexNormal_WorldSpace))*l9_75;
float3 l9_78=l9_77.PositionWS;
float3 l9_79=l9_77.BumpedNormal;
float l9_80=l9_76;
float3 l9_81=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_78);
if (dot(l9_81,l9_79)>=(-0.050000001))
{
uint3 l9_82=uint3(round((l9_78-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_82.x,l9_82.y,l9_82.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_83=l9_79;
float l9_84=dot(abs(l9_83),float3(1.0));
l9_83/=float3(l9_84);
float l9_85=fast::clamp(-l9_83.z,0.0,1.0);
float2 l9_86=l9_83.xy;
float l9_87;
if (l9_83.x>=0.0)
{
l9_87=l9_85;
}
else
{
l9_87=-l9_85;
}
l9_86.x+=l9_87;
float l9_88;
if (l9_83.y>=0.0)
{
l9_88=l9_85;
}
else
{
l9_88=-l9_85;
}
l9_86.y+=l9_88;
float2 l9_89=l9_86;
float2 l9_90=l9_89;
uint2 l9_91=uint2(as_type<uint>(half2(float2(l9_90.x,0.0))),as_type<uint>(half2(float2(l9_90.y,0.0))));
out.normal_and_more=uint4(l9_91.x,l9_91.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_92;
if (l9_80<0.0)
{
l9_92=1023u;
}
else
{
l9_92=uint(fast::clamp(l9_80,0.0,1.0)*1000.0);
}
uint l9_93=l9_92;
l9_93 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_93;
}
else
{
out.position_and_mask=uint4(0u);
out.normal_and_more=uint4(0u);
}
}
else
{
float2 l9_94=float2(0.0);
l9_94=l9_59.Surface_UVCoord0;
float2 l9_95=float2(0.0);
l9_95=l9_94*(*sc_set0.UserUniforms).Port_Input1_N031;
float2 l9_96=float2(0.0);
l9_96=l9_95-float2(1.0);
float l9_97=0.0;
l9_97=dot(l9_96,l9_96);
float l9_98=0.0;
l9_98=fast::clamp(l9_97+0.001,(*sc_set0.UserUniforms).Port_Input1_N246+0.001,(*sc_set0.UserUniforms).Port_Input2_N246+0.001)-0.001;
float l9_99=0.0;
l9_99=1.0-l9_98;
float l9_100=0.0;
float l9_101;
if (l9_99<=0.0)
{
l9_101=0.0;
}
else
{
l9_101=sqrt(l9_99);
}
l9_100=l9_101;
float3 l9_102=float3(0.0);
l9_102=float3(l9_96.x,l9_96.y,l9_102.z);
l9_102.z=l9_100;
float l9_103=0.0;
l9_103=distance(l9_94,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_104=0.0;
l9_104=float(l9_103<(*sc_set0.UserUniforms).Port_Input1_N036);
float3 l9_105=float3(0.0);
l9_105=mix((*sc_set0.UserUniforms).Port_Input0_N038,l9_102,float3(l9_104));
float3 l9_106=float3(0.0);
l9_106=l9_105;
float3 l9_107=l9_106;
float l9_108=(*sc_set0.UserUniforms).Port_Roughness_N258;
ssGlobals l9_109=l9_59;
l9_109.BumpedNormal=float3x3(float3(l9_109.VertexTangent_WorldSpace),float3(l9_109.VertexBinormal_WorldSpace),float3(l9_109.VertexNormal_WorldSpace))*l9_107;
float3 l9_110=l9_109.PositionWS;
float3 l9_111=l9_109.BumpedNormal;
float l9_112=l9_108;
float3 l9_113=normalize((*sc_set0.UserUniforms).sc_Camera.position-l9_110);
if (dot(l9_113,l9_111)>=(-0.050000001))
{
uint3 l9_114=uint3(round((l9_110-(*sc_set0.UserUniforms).OriginNormalizationOffset)*(*sc_set0.UserUniforms).OriginNormalizationScale));
out.position_and_mask=uint4(l9_114.x,l9_114.y,l9_114.z,out.position_and_mask.w);
out.position_and_mask.w=uint((*sc_set0.UserUniforms).receiver_mask);
float3 l9_115=l9_111;
float l9_116=dot(abs(l9_115),float3(1.0));
l9_115/=float3(l9_116);
float l9_117=fast::clamp(-l9_115.z,0.0,1.0);
float2 l9_118=l9_115.xy;
float l9_119;
if (l9_115.x>=0.0)
{
l9_119=l9_117;
}
else
{
l9_119=-l9_117;
}
l9_118.x+=l9_119;
float l9_120;
if (l9_115.y>=0.0)
{
l9_120=l9_117;
}
else
{
l9_120=-l9_117;
}
l9_118.y+=l9_120;
float2 l9_121=l9_118;
float2 l9_122=l9_121;
uint2 l9_123=uint2(as_type<uint>(half2(float2(l9_122.x,0.0))),as_type<uint>(half2(float2(l9_122.y,0.0))));
out.normal_and_more=uint4(l9_123.x,l9_123.y,out.normal_and_more.z,out.normal_and_more.w);
out.normal_and_more.z=as_type<uint>(half2(float2(0.0)));
uint l9_124;
if (l9_112<0.0)
{
l9_124=1023u;
}
else
{
l9_124=uint(fast::clamp(l9_112,0.0,1.0)*1000.0);
}
uint l9_125=l9_124;
l9_125 |= uint(((*sc_set0.UserUniforms).receiverId%32)<<int(10u));
out.normal_and_more.w=l9_125;
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
