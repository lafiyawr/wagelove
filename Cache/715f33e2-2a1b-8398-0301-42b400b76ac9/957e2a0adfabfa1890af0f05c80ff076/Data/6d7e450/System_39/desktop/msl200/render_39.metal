#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
//efine SC_DISABLE_FRUSTUM_CULLING 1
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
//attribute vec4 color 5
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler intensityTextureSmpSC 0:23
//sampler sampler renderTarget0SmpSC 0:24
//sampler sampler renderTarget1SmpSC 0:25
//sampler sampler renderTarget2SmpSC 0:26
//sampler sampler renderTarget3SmpSC 0:27
//sampler sampler sc_EnvmapDiffuseSmpSC 0:28
//sampler sampler sc_EnvmapSpecularSmpSC 0:29
//sampler sampler sc_RayTracedAoTextureSmpSC 0:31
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:32
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:33
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:34
//sampler sampler sc_SSAOTextureSmpSC 0:35
//sampler sampler sc_ScreenTextureSmpSC 0:36
//texture texture2D intensityTexture 0:0:0:23
//texture texture2D renderTarget0 0:1:0:24
//texture texture2D renderTarget1 0:2:0:25
//texture texture2D renderTarget2 0:3:0:26
//texture texture2D renderTarget3 0:4:0:27
//texture texture2D sc_EnvmapDiffuse 0:5:0:28
//texture texture2D sc_EnvmapSpecular 0:6:0:29
//texture texture2D sc_RayTracedAoTexture 0:15:0:31
//texture texture2D sc_RayTracedDiffIndTexture 0:16:0:32
//texture texture2D sc_RayTracedReflectionTexture 0:17:0:33
//texture texture2D sc_RayTracedShadowTexture 0:18:0:34
//texture texture2D sc_SSAOTexture 0:19:0:35
//texture texture2D sc_ScreenTexture 0:20:0:36
//ubo int UserUniforms 0:39:7520 {
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
//float numberMeshes 7412
//float Tweak_N45 7416
//float Port_Opacity_N042 7424
//float3 Port_Emissive_N042 7456
//float Port_Metallic_N042 7472
//float Port_Roughness_N042 7476
//float3 Port_AO_N042 7488
//float3 Port_SpecularAO_N042 7504
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 30 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 31 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 32 0
//spec_const bool intensityTextureHasSwappedViews 33 0
//spec_const bool renderTarget0HasSwappedViews 34 0
//spec_const bool renderTarget1HasSwappedViews 35 0
//spec_const bool renderTarget2HasSwappedViews 36 0
//spec_const bool renderTarget3HasSwappedViews 37 0
//spec_const bool sc_BlendMode_ColoredGlass 38 0
//spec_const bool sc_BlendMode_Custom 39 0
//spec_const bool sc_BlendMode_MultiplyOriginal 40 0
//spec_const bool sc_BlendMode_Multiply 41 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 42 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 43 0
//spec_const bool sc_BlendMode_Screen 44 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 45 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 46 0
//spec_const bool sc_FramebufferFetch 47 0
//spec_const bool sc_HasDiffuseEnvmap 48 0
//spec_const bool sc_LightEstimation 49 0
//spec_const bool sc_MotionVectorsPass 50 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 51 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 52 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 53 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 54 0
//spec_const bool sc_RenderAlphaToColor 55 0
//spec_const bool sc_SSAOEnabled 56 0
//spec_const bool sc_ScreenTextureHasSwappedViews 57 0
//spec_const bool sc_ShaderComplexityAnalyzer 58 0
//spec_const bool sc_UseFramebufferFetchMarker 59 0
//spec_const int NODE_46_DROPLIST_ITEM 60 0
//spec_const int SC_DEVICE_CLASS 61 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 62 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 63 -1
//spec_const int intensityTextureLayout 64 0
//spec_const int renderTarget0Layout 65 0
//spec_const int renderTarget1Layout 66 0
//spec_const int renderTarget2Layout 67 0
//spec_const int renderTarget3Layout 68 0
//spec_const int sc_AmbientLightMode0 69 0
//spec_const int sc_AmbientLightMode1 70 0
//spec_const int sc_AmbientLightMode2 71 0
//spec_const int sc_AmbientLightMode_Constant 72 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 73 0
//spec_const int sc_AmbientLightMode_FromCamera 74 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 75 0
//spec_const int sc_AmbientLightsCount 76 0
//spec_const int sc_DepthBufferMode 77 0
//spec_const int sc_DirectionalLightsCount 78 0
//spec_const int sc_EnvLightMode 79 0
//spec_const int sc_EnvmapDiffuseLayout 80 0
//spec_const int sc_EnvmapSpecularLayout 81 0
//spec_const int sc_LightEstimationSGCount 82 0
//spec_const int sc_MaxTextureImageUnits 83 0
//spec_const int sc_PointLightsCount 84 0
//spec_const int sc_RayTracedAoTextureLayout 85 0
//spec_const int sc_RayTracedDiffIndTextureLayout 86 0
//spec_const int sc_RayTracedReflectionTextureLayout 87 0
//spec_const int sc_RayTracedShadowTextureLayout 88 0
//spec_const int sc_ScreenTextureLayout 89 0
//spec_const int sc_ShaderCacheConstant 90 0
//spec_const int sc_StereoRenderingMode 91 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 92 0
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
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(30)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(31)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(32)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool intensityTextureHasSwappedViews [[function_constant(33)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool renderTarget0HasSwappedViews [[function_constant(34)]];
constant bool renderTarget0HasSwappedViews_tmp = is_function_constant_defined(renderTarget0HasSwappedViews) ? renderTarget0HasSwappedViews : false;
constant bool renderTarget1HasSwappedViews [[function_constant(35)]];
constant bool renderTarget1HasSwappedViews_tmp = is_function_constant_defined(renderTarget1HasSwappedViews) ? renderTarget1HasSwappedViews : false;
constant bool renderTarget2HasSwappedViews [[function_constant(36)]];
constant bool renderTarget2HasSwappedViews_tmp = is_function_constant_defined(renderTarget2HasSwappedViews) ? renderTarget2HasSwappedViews : false;
constant bool renderTarget3HasSwappedViews [[function_constant(37)]];
constant bool renderTarget3HasSwappedViews_tmp = is_function_constant_defined(renderTarget3HasSwappedViews) ? renderTarget3HasSwappedViews : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(38)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(39)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(40)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(41)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(42)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(43)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(44)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(45)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(46)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(47)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(48)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(49)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(50)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(51)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(52)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedReflectionTextureHasSwappedViews [[function_constant(53)]];
constant bool sc_RayTracedReflectionTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureHasSwappedViews) ? sc_RayTracedReflectionTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(54)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(55)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(56)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(57)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(58)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(59)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant int NODE_46_DROPLIST_ITEM [[function_constant(60)]];
constant int NODE_46_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_46_DROPLIST_ITEM) ? NODE_46_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(61)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(62)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(63)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int intensityTextureLayout [[function_constant(64)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int renderTarget0Layout [[function_constant(65)]];
constant int renderTarget0Layout_tmp = is_function_constant_defined(renderTarget0Layout) ? renderTarget0Layout : 0;
constant int renderTarget1Layout [[function_constant(66)]];
constant int renderTarget1Layout_tmp = is_function_constant_defined(renderTarget1Layout) ? renderTarget1Layout : 0;
constant int renderTarget2Layout [[function_constant(67)]];
constant int renderTarget2Layout_tmp = is_function_constant_defined(renderTarget2Layout) ? renderTarget2Layout : 0;
constant int renderTarget3Layout [[function_constant(68)]];
constant int renderTarget3Layout_tmp = is_function_constant_defined(renderTarget3Layout) ? renderTarget3Layout : 0;
constant int sc_AmbientLightMode0 [[function_constant(69)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(70)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(71)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(72)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(73)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(74)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(75)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(76)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(77)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(78)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(79)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(80)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(81)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(82)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(83)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(84)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(85)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(86)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedReflectionTextureLayout [[function_constant(87)]];
constant int sc_RayTracedReflectionTextureLayout_tmp = is_function_constant_defined(sc_RayTracedReflectionTextureLayout) ? sc_RayTracedReflectionTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(88)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_ScreenTextureLayout [[function_constant(89)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(90)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_StereoRenderingMode [[function_constant(91)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(92)]];
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
float4 VertexColor;
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
float numberMeshes;
float Tweak_N45;
float Port_AlphaTestThreshold_N039;
float Port_Opacity_N042;
float3 Port_Normal_N042;
float3 Port_Emissive_N042;
float Port_Metallic_N042;
float Port_Roughness_N042;
float3 Port_AO_N042;
float3 Port_SpecularAO_N042;
};
struct sc_Set0
{
texture2d<float> intensityTexture [[id(0)]];
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracedAoTexture [[id(15)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(16)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(17)]];
texture2d<float> sc_RayTracedShadowTexture [[id(18)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler renderTarget0SmpSC [[id(24)]];
sampler renderTarget1SmpSC [[id(25)]];
sampler renderTarget2SmpSC [[id(26)]];
sampler renderTarget3SmpSC [[id(27)]];
sampler sc_EnvmapDiffuseSmpSC [[id(28)]];
sampler sc_EnvmapSpecularSmpSC [[id(29)]];
sampler sc_RayTracedAoTextureSmpSC [[id(31)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(32)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(33)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(34)]];
sampler sc_SSAOTextureSmpSC [[id(35)]];
sampler sc_ScreenTextureSmpSC [[id(36)]];
constant userUniformsObj* UserUniforms [[id(39)]];
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
float gParticlesDebug [[user(locn22)]];
float2 ParticleUV [[user(locn23)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 color [[attribute(5)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
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
gParticle.CopyId=float(InstanceID/257);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
int l9_0=param/257;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%257;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(257*((param/257)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%257,l9_1/257);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/257.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(257.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/256.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/256.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(256.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*3600.0;
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
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+7200.0)/3600.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_1=l9_19;
gParticle=param_1;
int offsetPixelId=(UserUniforms.vfxOffsetInstancesRead+InstanceID)*3;
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
l9_61=!(UserUniforms.vfxBatchEnable[l9_62/257]!=0);
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
float param_32=3600.0;
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
float param_35=3600.0;
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
float2 param_40=float2(Scalar0,Scalar1);
float param_41=0.0;
float param_42=100.0;
float2 l9_549=param_40;
float l9_550=param_41;
float l9_551=param_42;
float l9_552=0.99998999;
float2 l9_553=l9_549;
#if (1)
{
l9_553=floor((l9_553*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_554=dot(l9_553,float2(1.0,0.0039215689));
float l9_555=l9_554;
float l9_556=0.0;
float l9_557=l9_552;
float l9_558=l9_550;
float l9_559=l9_551;
float l9_560=l9_558+(((l9_555-l9_556)*(l9_559-l9_558))/(l9_557-l9_556));
float l9_561=l9_560;
float l9_562=l9_561;
gParticle.Size=l9_562;
float2 param_43=float2(Scalar2,Scalar3);
float param_44=-1.0;
float param_45=1.0;
float2 l9_563=param_43;
float l9_564=param_44;
float l9_565=param_45;
float l9_566=0.99998999;
float2 l9_567=l9_563;
#if (1)
{
l9_567=floor((l9_567*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_568=dot(l9_567,float2(1.0,0.0039215689));
float l9_569=l9_568;
float l9_570=0.0;
float l9_571=l9_566;
float l9_572=l9_564;
float l9_573=l9_565;
float l9_574=l9_572+(((l9_569-l9_570)*(l9_573-l9_572))/(l9_571-l9_570));
float l9_575=l9_574;
float l9_576=l9_575;
gParticle.Quaternion.x=l9_576;
float2 param_46=float2(Scalar4,Scalar5);
float param_47=-1.0;
float param_48=1.0;
float2 l9_577=param_46;
float l9_578=param_47;
float l9_579=param_48;
float l9_580=0.99998999;
float2 l9_581=l9_577;
#if (1)
{
l9_581=floor((l9_581*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_582=dot(l9_581,float2(1.0,0.0039215689));
float l9_583=l9_582;
float l9_584=0.0;
float l9_585=l9_580;
float l9_586=l9_578;
float l9_587=l9_579;
float l9_588=l9_586+(((l9_583-l9_584)*(l9_587-l9_586))/(l9_585-l9_584));
float l9_589=l9_588;
float l9_590=l9_589;
gParticle.Quaternion.y=l9_590;
float2 param_49=float2(Scalar6,Scalar7);
float param_50=-1.0;
float param_51=1.0;
float2 l9_591=param_49;
float l9_592=param_50;
float l9_593=param_51;
float l9_594=0.99998999;
float2 l9_595=l9_591;
#if (1)
{
l9_595=floor((l9_595*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_596=dot(l9_595,float2(1.0,0.0039215689));
float l9_597=l9_596;
float l9_598=0.0;
float l9_599=l9_594;
float l9_600=l9_592;
float l9_601=l9_593;
float l9_602=l9_600+(((l9_597-l9_598)*(l9_601-l9_600))/(l9_599-l9_598));
float l9_603=l9_602;
float l9_604=l9_603;
gParticle.Quaternion.z=l9_604;
float2 param_52=float2(Scalar8,Scalar9);
float param_53=-1.0;
float param_54=1.0;
float2 l9_605=param_52;
float l9_606=param_53;
float l9_607=param_54;
float l9_608=0.99998999;
float2 l9_609=l9_605;
#if (1)
{
l9_609=floor((l9_609*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_610=dot(l9_609,float2(1.0,0.0039215689));
float l9_611=l9_610;
float l9_612=0.0;
float l9_613=l9_608;
float l9_614=l9_606;
float l9_615=l9_607;
float l9_616=l9_614+(((l9_611-l9_612)*(l9_615-l9_614))/(l9_613-l9_612));
float l9_617=l9_616;
float l9_618=l9_617;
gParticle.Quaternion.w=l9_618;
float param_55=Scalar10;
float param_56=0.0;
float param_57=1.00001;
float l9_619=param_55;
float l9_620=param_56;
float l9_621=param_57;
float l9_622=1.0;
float l9_623=l9_619;
#if (1)
{
l9_623=floor((l9_623*255.0)+0.5)/255.0;
}
#endif
float l9_624=l9_623;
float l9_625=l9_624;
float l9_626=0.0;
float l9_627=l9_622;
float l9_628=l9_620;
float l9_629=l9_621;
float l9_630=l9_628+(((l9_625-l9_626)*(l9_629-l9_628))/(l9_627-l9_626));
float l9_631=l9_630;
float l9_632=l9_631;
gParticle.Color.x=l9_632;
float param_58=Scalar11;
float param_59=0.0;
float param_60=1.00001;
float l9_633=param_58;
float l9_634=param_59;
float l9_635=param_60;
float l9_636=1.0;
float l9_637=l9_633;
#if (1)
{
l9_637=floor((l9_637*255.0)+0.5)/255.0;
}
#endif
float l9_638=l9_637;
float l9_639=l9_638;
float l9_640=0.0;
float l9_641=l9_636;
float l9_642=l9_634;
float l9_643=l9_635;
float l9_644=l9_642+(((l9_639-l9_640)*(l9_643-l9_642))/(l9_641-l9_640));
float l9_645=l9_644;
float l9_646=l9_645;
gParticle.Color.y=l9_646;
float param_61=Scalar12;
float param_62=0.0;
float param_63=1.00001;
float l9_647=param_61;
float l9_648=param_62;
float l9_649=param_63;
float l9_650=1.0;
float l9_651=l9_647;
#if (1)
{
l9_651=floor((l9_651*255.0)+0.5)/255.0;
}
#endif
float l9_652=l9_651;
float l9_653=l9_652;
float l9_654=0.0;
float l9_655=l9_650;
float l9_656=l9_648;
float l9_657=l9_649;
float l9_658=l9_656+(((l9_653-l9_654)*(l9_657-l9_656))/(l9_655-l9_654));
float l9_659=l9_658;
float l9_660=l9_659;
gParticle.Color.z=l9_660;
float param_64=Scalar13;
float param_65=0.0;
float param_66=1.00001;
float l9_661=param_64;
float l9_662=param_65;
float l9_663=param_66;
float l9_664=1.0;
float l9_665=l9_661;
#if (1)
{
l9_665=floor((l9_665*255.0)+0.5)/255.0;
}
#endif
float l9_666=l9_665;
float l9_667=l9_666;
float l9_668=0.0;
float l9_669=l9_664;
float l9_670=l9_662;
float l9_671=l9_663;
float l9_672=l9_670+(((l9_667-l9_668)*(l9_671-l9_670))/(l9_669-l9_668));
float l9_673=l9_672;
float l9_674=l9_673;
gParticle.Color.w=l9_674;
float4 param_67=gParticle.Quaternion;
param_67=normalize(param_67.yzwx);
float l9_675=param_67.x*param_67.x;
float l9_676=param_67.y*param_67.y;
float l9_677=param_67.z*param_67.z;
float l9_678=param_67.x*param_67.z;
float l9_679=param_67.x*param_67.y;
float l9_680=param_67.y*param_67.z;
float l9_681=param_67.w*param_67.x;
float l9_682=param_67.w*param_67.y;
float l9_683=param_67.w*param_67.z;
float3x3 l9_684=float3x3(float3(1.0-(2.0*(l9_676+l9_677)),2.0*(l9_679+l9_683),2.0*(l9_678-l9_682)),float3(2.0*(l9_679-l9_683),1.0-(2.0*(l9_675+l9_677)),2.0*(l9_680+l9_681)),float3(2.0*(l9_678+l9_682),2.0*(l9_680-l9_681),1.0-(2.0*(l9_675+l9_676))));
gParticle.Matrix=l9_684;
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
int N36_NumMeshes=0;
int N36_MeshID=0;
int N36_SelectMode=0;
float3 N36_Position=float3(0.0);
float N36_ComparisonID=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t v=l9_1;
out.varColor=in.color;
int l9_2=gl_InstanceIndex;
int InstanceID=l9_2;
int l9_3=InstanceID;
bool l9_4=l9_3>=(257*((*sc_set0.UserUniforms).vfxNumCopies+1));
ssParticle gParticle;
bool l9_5;
if (!l9_4)
{
int l9_6=gl_InstanceIndex;
l9_5=((*sc_set0.UserUniforms).vfxBatchEnable[l9_6/257]!=0)==false;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_17/257];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.VertexColor=out.varColor;
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
float4 param_4=gParticle.Quaternion;
param_4=normalize(param_4.yzwx);
float l9_25=param_4.x*param_4.x;
float l9_26=param_4.y*param_4.y;
float l9_27=param_4.z*param_4.z;
float l9_28=param_4.x*param_4.z;
float l9_29=param_4.x*param_4.y;
float l9_30=param_4.y*param_4.z;
float l9_31=param_4.w*param_4.x;
float l9_32=param_4.w*param_4.y;
float l9_33=param_4.w*param_4.z;
float3x3 l9_34=float3x3(float3(1.0-(2.0*(l9_26+l9_27)),2.0*(l9_29+l9_33),2.0*(l9_28-l9_32)),float3(2.0*(l9_29-l9_33),1.0-(2.0*(l9_25+l9_27)),2.0*(l9_30+l9_31)),float3(2.0*(l9_28+l9_32),2.0*(l9_30-l9_31),1.0-(2.0*(l9_25+l9_26))));
gParticle.Matrix=l9_34;
out.varPos=gParticle.Position+((gParticle.Matrix*v.position.xyz)*gParticle.Size);
out.varNormal=gParticle.Matrix*v.normal;
float3 l9_35=gParticle.Matrix*v.tangent;
out.varTangent=float4(l9_35.x,l9_35.y,l9_35.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
out.varPackedTex=float4(v.texture0,v.texture1);
float Output_N47=0.0;
float param_5=(*sc_set0.UserUniforms).numberMeshes;
Output_N47=param_5;
float Output_N45=0.0;
float param_6=(*sc_set0.UserUniforms).Tweak_N45;
Output_N45=param_6;
float3 Position_N36=float3(0.0);
float param_7=Output_N47;
float param_8=Output_N45;
ssGlobals param_10=Globals;
ssGlobals tempGlobals=param_10;
float3 param_9=float3(0.0);
N36_NumMeshes=int(param_7);
N36_SelectMode=NODE_46_DROPLIST_ITEM_tmp;
N36_MeshID=int(param_8);
float3 l9_36=out.varPos;
N36_Position=l9_36;
float4 l9_37=tempGlobals.VertexColor;
float l9_38=l9_37.x;
float l9_39=float(N36_NumMeshes);
l9_38=floor(l9_38*l9_39);
if (N36_SelectMode==0)
{
int l9_40=gParticle.Index1DPerCopy;
N36_ComparisonID=mod(float(l9_40),float(N36_NumMeshes));
}
if (N36_SelectMode==1)
{
bool l9_41=true;
bool l9_42=true;
bool l9_43=false;
float l9_44=0.0;
float l9_45=0.0;
int l9_46=1;
bool l9_47=l9_43;
bool l9_48=l9_42;
bool l9_49=l9_41;
float l9_50=36.0;
ssParticle l9_51=gParticle;
float l9_52=l9_44;
float l9_53=tempGlobals.gTimeElapsed;
float4 l9_54=float4(0.0);
float4 l9_55=float4(0.0);
if (l9_47)
{
l9_55.x=floor(fract(l9_53)*1000.0);
}
if (l9_49)
{
l9_55.y=float(l9_51.Index1D^((l9_51.Index1D*15299)+l9_51.Index1D));
}
if (l9_48)
{
l9_55.z=l9_50;
}
l9_55.w=l9_52*1000.0;
int l9_56=int(l9_55.x);
int l9_57=int(l9_55.y);
int l9_58=int(l9_55.z);
int l9_59=int(l9_55.w);
int l9_60=(((l9_56*15299)^(l9_57*30133))^(l9_58*17539))^(l9_59*12113);
int l9_61=l9_60;
if (l9_46==1)
{
int l9_62=l9_61;
int l9_63=l9_62;
int l9_64=((l9_63*((l9_63*1471343)+101146501))+1559861749)&2147483647;
int l9_65=l9_64;
float l9_66=float(l9_65)*4.6566129e-10;
float l9_67=l9_66;
l9_54.x=l9_67;
}
else
{
if (l9_46==2)
{
int l9_68=l9_61;
int l9_69=l9_68;
int l9_70=((l9_69*((l9_69*1471343)+101146501))+1559861749)&2147483647;
int l9_71=l9_70;
int l9_72=l9_68*1399;
int l9_73=((l9_72*((l9_72*1471343)+101146501))+1559861749)&2147483647;
int l9_74=l9_73;
int l9_75=l9_71;
float l9_76=float(l9_75)*4.6566129e-10;
int l9_77=l9_74;
float l9_78=float(l9_77)*4.6566129e-10;
float2 l9_79=float2(l9_76,l9_78);
l9_54=float4(l9_79.x,l9_79.y,l9_54.z,l9_54.w);
}
else
{
if (l9_46==3)
{
int l9_80=l9_61;
int l9_81=l9_80;
int l9_82=((l9_81*((l9_81*1471343)+101146501))+1559861749)&2147483647;
int l9_83=l9_82;
int l9_84=l9_80*1399;
int l9_85=((l9_84*((l9_84*1471343)+101146501))+1559861749)&2147483647;
int l9_86=l9_85;
int l9_87=l9_80*7177;
int l9_88=((l9_87*((l9_87*1471343)+101146501))+1559861749)&2147483647;
int l9_89=l9_88;
int l9_90=l9_83;
float l9_91=float(l9_90)*4.6566129e-10;
int l9_92=l9_86;
float l9_93=float(l9_92)*4.6566129e-10;
int l9_94=l9_89;
float l9_95=float(l9_94)*4.6566129e-10;
float3 l9_96=float3(l9_91,l9_93,l9_95);
l9_54=float4(l9_96.x,l9_96.y,l9_96.z,l9_54.w);
}
else
{
int l9_97=l9_61;
int l9_98=l9_97;
int l9_99=((l9_98*((l9_98*1471343)+101146501))+1559861749)&2147483647;
int l9_100=l9_99;
int l9_101=l9_97*1399;
int l9_102=((l9_101*((l9_101*1471343)+101146501))+1559861749)&2147483647;
int l9_103=l9_102;
int l9_104=l9_97*7177;
int l9_105=((l9_104*((l9_104*1471343)+101146501))+1559861749)&2147483647;
int l9_106=l9_105;
int l9_107=l9_97*18919;
int l9_108=((l9_107*((l9_107*1471343)+101146501))+1559861749)&2147483647;
int l9_109=l9_108;
int l9_110=l9_100;
float l9_111=float(l9_110)*4.6566129e-10;
int l9_112=l9_103;
float l9_113=float(l9_112)*4.6566129e-10;
int l9_114=l9_106;
float l9_115=float(l9_114)*4.6566129e-10;
int l9_116=l9_109;
float l9_117=float(l9_116)*4.6566129e-10;
float4 l9_118=float4(l9_111,l9_113,l9_115,l9_117);
l9_54=l9_118;
}
}
}
float4 l9_119=l9_54;
l9_45=l9_119.x;
float l9_120=l9_45;
float l9_121=l9_120;
N36_ComparisonID=floor(mix(0.0,float(N36_NumMeshes),l9_121));
}
if (N36_SelectMode==2)
{
N36_ComparisonID=float(N36_MeshID);
}
if (l9_38!=N36_ComparisonID)
{
N36_Position=float3(1337.0);
}
param_9=N36_Position;
Position_N36=param_9;
float3 param_11=Position_N36;
out.varPos=param_11;
int l9_122=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_122=0;
}
else
{
l9_122=gl_InstanceIndex%2;
}
int l9_123=l9_122;
float4 clipPosition=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_123]*float4(out.varPos,1.0);
float4 param_12=clipPosition;
if (sc_DepthBufferMode_tmp==1)
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=gl_InstanceIndex%2;
}
int l9_125=l9_124;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_125][2].w!=0.0)
{
float l9_126=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
param_12.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+param_12.w))*l9_126)-1.0)*param_12.w;
}
}
float4 l9_127=param_12;
clipPosition=l9_127;
float4 param_13=clipPosition;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_13.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_128=param_13;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_129=dot(l9_128,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_130=l9_129;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_130;
}
}
float4 l9_131=float4(param_13.x,-param_13.y,(param_13.z*0.5)+(param_13.w*0.5),param_13.w);
out.gl_Position=l9_131;
int l9_132=gl_InstanceIndex;
out.Interp_Particle_Index=l9_132;
out.Interp_Particle_Force=gParticle.Force;
out.Interp_Particle_Position=gParticle.Position;
out.Interp_Particle_Velocity=gParticle.Velocity;
out.Interp_Particle_Life=gParticle.Life;
out.Interp_Particle_Age=gParticle.Age;
out.Interp_Particle_Size=gParticle.Size;
out.Interp_Particle_Color=gParticle.Color;
out.Interp_Particle_Quaternion=gParticle.Quaternion;
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
float3 VertexNormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
float4 VertexColor;
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
float numberMeshes;
float Tweak_N45;
float Port_AlphaTestThreshold_N039;
float Port_Opacity_N042;
float3 Port_Normal_N042;
float3 Port_Emissive_N042;
float Port_Metallic_N042;
float Port_Roughness_N042;
float3 Port_AO_N042;
float3 Port_SpecularAO_N042;
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
texture2d<float> intensityTexture [[id(0)]];
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracedAoTexture [[id(15)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(16)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(17)]];
texture2d<float> sc_RayTracedShadowTexture [[id(18)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler renderTarget0SmpSC [[id(24)]];
sampler renderTarget1SmpSC [[id(25)]];
sampler renderTarget2SmpSC [[id(26)]];
sampler renderTarget3SmpSC [[id(27)]];
sampler sc_EnvmapDiffuseSmpSC [[id(28)]];
sampler sc_EnvmapSpecularSmpSC [[id(29)]];
sampler sc_RayTracedAoTextureSmpSC [[id(31)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(32)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(33)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(34)]];
sampler sc_SSAOTextureSmpSC [[id(35)]];
sampler sc_ScreenTextureSmpSC [[id(36)]];
constant userUniformsObj* UserUniforms [[id(39)]];
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
float gParticlesDebug [[user(locn22)]];
float2 ParticleUV [[user(locn23)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 ssHue_to_RGB(thread float& Hue)
{
Hue=fract(Hue);
if (Hue<0.33329999)
{
return mix(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3((Hue-0.0)/0.33329999));
}
else
{
if (Hue<0.66659999)
{
return mix(float3(0.0,1.0,0.0),float3(0.0,0.0,1.0),float3((Hue-0.33329999)/0.33329999));
}
else
{
return mix(float3(0.0,0.0,1.0),float3(1.0,0.0,0.0),float3((Hue-0.66659999)/0.33329999));
}
}
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
int N36_NumMeshes=0;
int N36_MeshID=0;
int N36_SelectMode=0;
float N36_ComparisonID=0.0;
float3 ngsTempNormal=float3(0.0);
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
ngsTempNormal=in.varNormal;
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/257];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(ngsTempNormal);
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.VertexColor=in.varColor;
int param=in.Interp_Particle_Index;
ssParticle param_1=gParticle;
int l9_0=param/257;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%257;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(257*((param/257)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%257,l9_1/257);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/257.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(257.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/256.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/256.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(256.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*3600.0;
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
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+7200.0)/3600.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_1=l9_19;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Output_Color0=gParticle.Color;
float Output_N47=0.0;
float param_2=(*sc_set0.UserUniforms).numberMeshes;
Output_N47=param_2;
float Output_N45=0.0;
float param_3=(*sc_set0.UserUniforms).Tweak_N45;
Output_N45=param_3;
float ComparisonID_N36=0.0;
float param_4=Output_N47;
float param_5=Output_N45;
ssGlobals param_7=Globals;
ssGlobals tempGlobals=param_7;
float param_6=0.0;
N36_NumMeshes=int(param_4);
N36_SelectMode=NODE_46_DROPLIST_ITEM_tmp;
N36_MeshID=int(param_5);
if (N36_SelectMode==0)
{
int l9_24=gParticle.Index1DPerCopy;
N36_ComparisonID=mod(float(l9_24),float(N36_NumMeshes));
}
if (N36_SelectMode==1)
{
bool l9_25=true;
bool l9_26=true;
bool l9_27=false;
float l9_28=0.0;
float l9_29=0.0;
int l9_30=1;
bool l9_31=l9_27;
bool l9_32=l9_26;
bool l9_33=l9_25;
float l9_34=36.0;
ssParticle l9_35=gParticle;
float l9_36=l9_28;
float l9_37=tempGlobals.gTimeElapsed;
float4 l9_38=float4(0.0);
float4 l9_39=float4(0.0);
if (l9_31)
{
l9_39.x=floor(fract(l9_37)*1000.0);
}
if (l9_33)
{
l9_39.y=float(l9_35.Index1D^((l9_35.Index1D*15299)+l9_35.Index1D));
}
if (l9_32)
{
l9_39.z=l9_34;
}
l9_39.w=l9_36*1000.0;
int l9_40=int(l9_39.x);
int l9_41=int(l9_39.y);
int l9_42=int(l9_39.z);
int l9_43=int(l9_39.w);
int l9_44=(((l9_40*15299)^(l9_41*30133))^(l9_42*17539))^(l9_43*12113);
int l9_45=l9_44;
if (l9_30==1)
{
int l9_46=l9_45;
int l9_47=l9_46;
int l9_48=((l9_47*((l9_47*1471343)+101146501))+1559861749)&2147483647;
int l9_49=l9_48;
float l9_50=float(l9_49)*4.6566129e-10;
float l9_51=l9_50;
l9_38.x=l9_51;
}
else
{
if (l9_30==2)
{
int l9_52=l9_45;
int l9_53=l9_52;
int l9_54=((l9_53*((l9_53*1471343)+101146501))+1559861749)&2147483647;
int l9_55=l9_54;
int l9_56=l9_52*1399;
int l9_57=((l9_56*((l9_56*1471343)+101146501))+1559861749)&2147483647;
int l9_58=l9_57;
int l9_59=l9_55;
float l9_60=float(l9_59)*4.6566129e-10;
int l9_61=l9_58;
float l9_62=float(l9_61)*4.6566129e-10;
float2 l9_63=float2(l9_60,l9_62);
l9_38=float4(l9_63.x,l9_63.y,l9_38.z,l9_38.w);
}
else
{
if (l9_30==3)
{
int l9_64=l9_45;
int l9_65=l9_64;
int l9_66=((l9_65*((l9_65*1471343)+101146501))+1559861749)&2147483647;
int l9_67=l9_66;
int l9_68=l9_64*1399;
int l9_69=((l9_68*((l9_68*1471343)+101146501))+1559861749)&2147483647;
int l9_70=l9_69;
int l9_71=l9_64*7177;
int l9_72=((l9_71*((l9_71*1471343)+101146501))+1559861749)&2147483647;
int l9_73=l9_72;
int l9_74=l9_67;
float l9_75=float(l9_74)*4.6566129e-10;
int l9_76=l9_70;
float l9_77=float(l9_76)*4.6566129e-10;
int l9_78=l9_73;
float l9_79=float(l9_78)*4.6566129e-10;
float3 l9_80=float3(l9_75,l9_77,l9_79);
l9_38=float4(l9_80.x,l9_80.y,l9_80.z,l9_38.w);
}
else
{
int l9_81=l9_45;
int l9_82=l9_81;
int l9_83=((l9_82*((l9_82*1471343)+101146501))+1559861749)&2147483647;
int l9_84=l9_83;
int l9_85=l9_81*1399;
int l9_86=((l9_85*((l9_85*1471343)+101146501))+1559861749)&2147483647;
int l9_87=l9_86;
int l9_88=l9_81*7177;
int l9_89=((l9_88*((l9_88*1471343)+101146501))+1559861749)&2147483647;
int l9_90=l9_89;
int l9_91=l9_81*18919;
int l9_92=((l9_91*((l9_91*1471343)+101146501))+1559861749)&2147483647;
int l9_93=l9_92;
int l9_94=l9_84;
float l9_95=float(l9_94)*4.6566129e-10;
int l9_96=l9_87;
float l9_97=float(l9_96)*4.6566129e-10;
int l9_98=l9_90;
float l9_99=float(l9_98)*4.6566129e-10;
int l9_100=l9_93;
float l9_101=float(l9_100)*4.6566129e-10;
float4 l9_102=float4(l9_95,l9_97,l9_99,l9_101);
l9_38=l9_102;
}
}
}
float4 l9_103=l9_38;
l9_29=l9_103.x;
float l9_104=l9_29;
float l9_105=l9_104;
N36_ComparisonID=floor(mix(0.0,float(N36_NumMeshes),l9_105));
}
if (N36_SelectMode==2)
{
N36_ComparisonID=float(N36_MeshID);
}
param_6=N36_ComparisonID;
ComparisonID_N36=param_6;
float Output_N38=0.0;
Output_N38=ComparisonID_N36/(Output_N47+1.234e-06);
float4 RGB_N41=float4(0.0);
float param_8=Output_N38;
float3 l9_106=ssHue_to_RGB(param_8);
RGB_N41=float4(l9_106,1.0);
float4 Output_N42=float4(0.0);
float3 param_9=RGB_N41.xyz;
float param_10=(*sc_set0.UserUniforms).Port_Opacity_N042;
float3 param_11=(*sc_set0.UserUniforms).Port_Emissive_N042;
float param_12=(*sc_set0.UserUniforms).Port_Metallic_N042;
float param_13=(*sc_set0.UserUniforms).Port_Roughness_N042;
float3 param_14=(*sc_set0.UserUniforms).Port_AO_N042;
float3 param_15=(*sc_set0.UserUniforms).Port_SpecularAO_N042;
ssGlobals param_17=Globals;
param_17.BumpedNormal=param_17.VertexNormal_WorldSpace;
param_9=fast::max(param_9,float3(0.0));
float3 l9_107=param_9;
float l9_108=param_10;
float3 l9_109=param_17.BumpedNormal;
float3 l9_110=param_17.PositionWS;
float3 l9_111=param_17.ViewDirWS;
float3 l9_112=param_11;
float l9_113=param_12;
float l9_114=param_13;
float3 l9_115=param_14;
float3 l9_116=param_15;
SurfaceProperties l9_117;
l9_117.albedo=float3(0.0);
l9_117.opacity=1.0;
l9_117.normal=float3(0.0);
l9_117.positionWS=float3(0.0);
l9_117.viewDirWS=float3(0.0);
l9_117.metallic=0.0;
l9_117.roughness=0.0;
l9_117.emissive=float3(0.0);
l9_117.ao=float3(1.0);
l9_117.specularAo=float3(1.0);
l9_117.bakedShadows=float3(1.0);
SurfaceProperties l9_118=l9_117;
SurfaceProperties l9_119=l9_118;
l9_119.opacity=l9_108;
float3 l9_120=l9_107;
float3 l9_121;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_121=float3(pow(l9_120.x,2.2),pow(l9_120.y,2.2),pow(l9_120.z,2.2));
}
else
{
l9_121=l9_120*l9_120;
}
float3 l9_122=l9_121;
l9_119.albedo=l9_122;
l9_119.normal=normalize(l9_109);
l9_119.positionWS=l9_110;
l9_119.viewDirWS=l9_111;
float3 l9_123=l9_112;
float3 l9_124;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_124=float3(pow(l9_123.x,2.2),pow(l9_123.y,2.2),pow(l9_123.z,2.2));
}
else
{
l9_124=l9_123*l9_123;
}
float3 l9_125=l9_124;
l9_119.emissive=l9_125;
l9_119.metallic=l9_113;
l9_119.roughness=l9_114;
l9_119.ao=l9_115;
l9_119.specularAo=l9_116;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_126=l9_119.positionWS;
l9_119.ao=evaluateSSAO(l9_126,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_127=l9_119;
SurfaceProperties l9_128=l9_127;
float3 l9_129=mix(float3(0.039999999),l9_128.albedo*l9_128.metallic,float3(l9_128.metallic));
float3 l9_130=mix(l9_128.albedo*(1.0-l9_128.metallic),float3(0.0),float3(l9_128.metallic));
l9_127.albedo=l9_130;
l9_127.specColor=l9_129;
SurfaceProperties l9_131=l9_127;
l9_119=l9_131;
SurfaceProperties l9_132=l9_119;
LightingComponents l9_133;
l9_133.directDiffuse=float3(0.0);
l9_133.directSpecular=float3(0.0);
l9_133.indirectDiffuse=float3(1.0);
l9_133.indirectSpecular=float3(0.0);
l9_133.emitted=float3(0.0);
l9_133.transmitted=float3(0.0);
LightingComponents l9_134=l9_133;
LightingComponents l9_135=l9_134;
float3 l9_136=l9_132.viewDirWS;
int l9_137=0;
float4 l9_138=float4(l9_132.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_139;
LightProperties l9_140;
int l9_141=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_141<sc_DirectionalLightsCount_tmp)
{
l9_139.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_141].direction;
l9_139.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_141].color;
l9_140.direction=l9_139.direction;
l9_140.color=l9_139.color.xyz;
l9_140.attenuation=l9_139.color.w;
l9_140.attenuation*=l9_138[(l9_137<3) ? l9_137 : 3];
l9_137++;
LightingComponents l9_142=l9_135;
LightProperties l9_143=l9_140;
SurfaceProperties l9_144=l9_132;
float3 l9_145=l9_136;
SurfaceProperties l9_146=l9_144;
float3 l9_147=l9_143.direction;
float3 l9_148=float3(fast::clamp(dot(l9_146.normal,l9_147),0.0,1.0));
l9_142.directDiffuse+=((l9_148*l9_143.color)*l9_143.attenuation);
SurfaceProperties l9_149=l9_144;
float3 l9_150=l9_143.direction;
float3 l9_151=l9_145;
l9_142.directSpecular+=((calculateDirectSpecular(l9_149,l9_150,l9_151)*l9_143.color)*l9_143.attenuation);
LightingComponents l9_152=l9_142;
l9_135=l9_152;
l9_141++;
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
sc_PointLight_t_1 l9_153;
LightProperties l9_154;
int l9_155=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_155<sc_PointLightsCount_tmp)
{
l9_153.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_155].falloffEnabled!=0;
l9_153.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_155].falloffEndDistance;
l9_153.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_155].negRcpFalloffEndDistance4;
l9_153.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_155].angleScale;
l9_153.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_155].angleOffset;
l9_153.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_155].direction;
l9_153.position=(*sc_set0.UserUniforms).sc_PointLights[l9_155].position;
l9_153.color=(*sc_set0.UserUniforms).sc_PointLights[l9_155].color;
float3 l9_156=l9_153.position-l9_132.positionWS;
l9_154.direction=normalize(l9_156);
l9_154.color=l9_153.color.xyz;
l9_154.attenuation=l9_153.color.w;
l9_154.attenuation*=l9_138[(l9_137<3) ? l9_137 : 3];
float3 l9_157=l9_154.direction;
float3 l9_158=l9_153.direction;
float l9_159=l9_153.angleScale;
float l9_160=l9_153.angleOffset;
float l9_161=dot(l9_157,l9_158);
float l9_162=fast::clamp((l9_161*l9_159)+l9_160,0.0,1.0);
float l9_163=l9_162*l9_162;
l9_154.attenuation*=l9_163;
if (l9_153.falloffEnabled)
{
float l9_164=length(l9_156);
float l9_165=l9_153.falloffEndDistance;
l9_154.attenuation*=computeDistanceAttenuation(l9_164,l9_165);
}
l9_137++;
LightingComponents l9_166=l9_135;
LightProperties l9_167=l9_154;
SurfaceProperties l9_168=l9_132;
float3 l9_169=l9_136;
SurfaceProperties l9_170=l9_168;
float3 l9_171=l9_167.direction;
float3 l9_172=float3(fast::clamp(dot(l9_170.normal,l9_171),0.0,1.0));
l9_166.directDiffuse+=((l9_172*l9_167.color)*l9_167.attenuation);
SurfaceProperties l9_173=l9_168;
float3 l9_174=l9_167.direction;
float3 l9_175=l9_169;
l9_166.directSpecular+=((calculateDirectSpecular(l9_173,l9_174,l9_175)*l9_167.color)*l9_167.attenuation);
LightingComponents l9_176=l9_166;
l9_135=l9_176;
l9_155++;
continue;
}
else
{
break;
}
}
}
bool l9_177=(*sc_set0.UserUniforms).receivesRayTracedShadows!=0;
if (l9_177)
{
float4 l9_178=gl_FragCoord;
float2 l9_179=l9_178.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_180=l9_179;
float2 l9_181=l9_180;
int l9_182=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_183=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_183=0;
}
else
{
l9_183=in.varStereoViewID;
}
int l9_184=l9_183;
l9_182=1-l9_184;
}
else
{
int l9_185=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_185=0;
}
else
{
l9_185=in.varStereoViewID;
}
int l9_186=l9_185;
l9_182=l9_186;
}
int l9_187=l9_182;
float2 l9_188=l9_181;
int l9_189=l9_187;
float2 l9_190=l9_188;
int l9_191=l9_189;
float l9_192=0.0;
float4 l9_193=float4(0.0);
float2 l9_194=l9_190;
int l9_195=sc_RayTracedShadowTextureLayout_tmp;
int l9_196=l9_191;
float l9_197=l9_192;
float2 l9_198=l9_194;
int l9_199=l9_195;
int l9_200=l9_196;
float3 l9_201=float3(0.0);
if (l9_199==0)
{
l9_201=float3(l9_198,0.0);
}
else
{
if (l9_199==1)
{
l9_201=float3(l9_198.x,(l9_198.y*0.5)+(0.5-(float(l9_200)*0.5)),0.0);
}
else
{
l9_201=float3(l9_198,float(l9_200));
}
}
float3 l9_202=l9_201;
float3 l9_203=l9_202;
float2 l9_204=l9_203.xy;
float l9_205=l9_197;
float4 l9_206=sc_set0.sc_RayTracedShadowTexture.sample(sc_set0.sc_RayTracedShadowTextureSmpSC,l9_204,bias(l9_205));
float4 l9_207=l9_206;
l9_193=l9_207;
float4 l9_208=l9_193;
float4 l9_209=l9_208;
float4 l9_210=l9_209;
float l9_211=l9_210.x;
float3 l9_212=float3(l9_211);
float3 l9_213=l9_212;
l9_135.directDiffuse*=(float3(1.0)-l9_213);
l9_135.directSpecular*=(float3(1.0)-l9_213);
}
SurfaceProperties l9_214=l9_132;
float3 l9_215=l9_214.normal;
float3 l9_216=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_217=l9_215;
float3 l9_218=l9_217;
float l9_219=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_220=float2(0.0);
float l9_221=l9_218.x;
float l9_222=-l9_218.z;
float l9_223=(l9_221<0.0) ? (-1.0) : 1.0;
float l9_224=l9_223*acos(fast::clamp(l9_222/length(float2(l9_221,l9_222)),-1.0,1.0));
l9_220.x=l9_224-1.5707964;
l9_220.y=acos(l9_218.y);
l9_220/=float2(6.2831855,3.1415927);
l9_220.y=1.0-l9_220.y;
l9_220.x+=(l9_219/360.0);
l9_220.x=fract((l9_220.x+floor(l9_220.x))+1.0);
float2 l9_225=l9_220;
float2 l9_226=l9_225;
float4 l9_227=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_228=l9_226;
float2 l9_229=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_230=5.0;
l9_226=calcSeamlessPanoramicUvsForSampling(l9_228,l9_229,l9_230);
}
float2 l9_231=l9_226;
float l9_232=13.0;
int l9_233=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
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
float2 l9_239=l9_231;
int l9_240=l9_238;
float l9_241=l9_232;
float4 l9_242=float4(0.0);
float2 l9_243=l9_239;
int l9_244=sc_EnvmapSpecularLayout_tmp;
int l9_245=l9_240;
float l9_246=l9_241;
float2 l9_247=l9_243;
int l9_248=l9_244;
int l9_249=l9_245;
float3 l9_250=float3(0.0);
if (l9_248==0)
{
l9_250=float3(l9_247,0.0);
}
else
{
if (l9_248==1)
{
l9_250=float3(l9_247.x,(l9_247.y*0.5)+(0.5-(float(l9_249)*0.5)),0.0);
}
else
{
l9_250=float3(l9_247,float(l9_249));
}
}
float3 l9_251=l9_250;
float3 l9_252=l9_251;
float2 l9_253=l9_252.xy;
float l9_254=l9_246;
float4 l9_255=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_253,bias(l9_254));
float4 l9_256=l9_255;
l9_242=l9_256;
float4 l9_257=l9_242;
float4 l9_258=l9_257;
l9_227=l9_258;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_259=l9_226;
float2 l9_260=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_261=0.0;
l9_226=calcSeamlessPanoramicUvsForSampling(l9_259,l9_260,l9_261);
float2 l9_262=l9_226;
float l9_263=-13.0;
int l9_264=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_265=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_265=0;
}
else
{
l9_265=in.varStereoViewID;
}
int l9_266=l9_265;
l9_264=1-l9_266;
}
else
{
int l9_267=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_267=0;
}
else
{
l9_267=in.varStereoViewID;
}
int l9_268=l9_267;
l9_264=l9_268;
}
int l9_269=l9_264;
float2 l9_270=l9_262;
int l9_271=l9_269;
float l9_272=l9_263;
float4 l9_273=float4(0.0);
float2 l9_274=l9_270;
int l9_275=sc_EnvmapDiffuseLayout_tmp;
int l9_276=l9_271;
float l9_277=l9_272;
float2 l9_278=l9_274;
int l9_279=l9_275;
int l9_280=l9_276;
float3 l9_281=float3(0.0);
if (l9_279==0)
{
l9_281=float3(l9_278,0.0);
}
else
{
if (l9_279==1)
{
l9_281=float3(l9_278.x,(l9_278.y*0.5)+(0.5-(float(l9_280)*0.5)),0.0);
}
else
{
l9_281=float3(l9_278,float(l9_280));
}
}
float3 l9_282=l9_281;
float3 l9_283=l9_282;
float2 l9_284=l9_283.xy;
float l9_285=l9_277;
float4 l9_286=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_284,bias(l9_285));
float4 l9_287=l9_286;
l9_273=l9_287;
float4 l9_288=l9_273;
float4 l9_289=l9_288;
l9_227=l9_289;
}
else
{
float2 l9_290=l9_226;
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
l9_227=l9_317;
}
}
float4 l9_318=l9_227;
float3 l9_319=l9_318.xyz*(1.0/l9_318.w);
float3 l9_320=l9_319*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_216=l9_320;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_321=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_322=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_323=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_324=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_325=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_326=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_327=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_328=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_329=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_330=-l9_215;
float l9_331=0.0;
l9_331=l9_330.x;
float l9_332=l9_330.y;
float l9_333=l9_330.z;
float l9_334=l9_331*l9_331;
float l9_335=l9_332*l9_332;
float l9_336=l9_333*l9_333;
float l9_337=l9_331*l9_332;
float l9_338=l9_332*l9_333;
float l9_339=l9_331*l9_333;
float3 l9_340=((((((l9_329*0.42904299)*(l9_334-l9_335))+((l9_327*0.74312502)*l9_336))+(l9_321*0.88622701))-(l9_327*0.24770799))+((((l9_325*l9_337)+(l9_328*l9_339))+(l9_326*l9_338))*0.85808599))+((((l9_324*l9_331)+(l9_322*l9_332))+(l9_323*l9_333))*1.0233279);
l9_216=l9_340*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
bool l9_341=(*sc_set0.UserUniforms).receivesRayTracedDiffuseIndirect!=0;
if (l9_341)
{
float4 l9_342=sampleRayTracedIndirectDiffuse(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_216=mix(l9_216,l9_342.xyz,float3(l9_342.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_216+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_216.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_216+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_216.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_216+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_216.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_343=l9_215;
float3 l9_344=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_345;
float l9_346;
int l9_347=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_347<sc_LightEstimationSGCount_tmp)
{
l9_345.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_347].color;
l9_345.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_347].sharpness;
l9_345.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_347].axis;
float3 l9_348=l9_343;
float l9_349=dot(l9_345.axis,l9_348);
float l9_350=l9_345.sharpness;
float l9_351=0.36000001;
float l9_352=1.0/(4.0*l9_351);
float l9_353=exp(-l9_350);
float l9_354=l9_353*l9_353;
float l9_355=1.0/l9_350;
float l9_356=(1.0+(2.0*l9_354))-l9_355;
float l9_357=((l9_353-l9_354)*l9_355)-l9_354;
float l9_358=sqrt(1.0-l9_356);
float l9_359=l9_351*l9_349;
float l9_360=l9_352*l9_358;
float l9_361=l9_359+l9_360;
float l9_362=fast::clamp(l9_349,0.0,1.0);
if (step(abs(l9_359),l9_360)>0.5)
{
l9_346=(l9_361*l9_361)/l9_358;
}
else
{
l9_346=l9_362;
}
l9_362=l9_346;
float l9_363=(l9_356*l9_362)+l9_357;
sc_SphericalGaussianLight_t l9_364=l9_345;
float3 l9_365=(l9_364.color/float3(l9_364.sharpness))*6.2831855;
float3 l9_366=(l9_365*l9_363)/float3(3.1415927);
l9_344+=l9_366;
l9_347++;
continue;
}
else
{
break;
}
}
float3 l9_367=l9_344;
l9_216+=l9_367;
}
float3 l9_368=l9_216;
float3 l9_369=l9_368;
l9_135.indirectDiffuse=l9_369;
SurfaceProperties l9_370=l9_132;
float3 l9_371=l9_136;
float3 l9_372=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_373=l9_370;
float3 l9_374=l9_371;
float3 l9_375=l9_373.normal;
float3 l9_376=reflect(-l9_374,l9_375);
float3 l9_377=l9_375;
float3 l9_378=l9_376;
float l9_379=l9_373.roughness;
l9_376=getSpecularDominantDir(l9_377,l9_378,l9_379);
float l9_380=l9_373.roughness;
float l9_381=fast::clamp(pow(l9_380,0.66666669),0.0,1.0)*5.0;
float l9_382=l9_381;
float l9_383=l9_382;
float3 l9_384=l9_376;
float l9_385=l9_383;
float3 l9_386=l9_384;
float l9_387=l9_385;
float4 l9_388=float4(0.0);
float3 l9_389=l9_386;
float l9_390=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_391=float2(0.0);
float l9_392=l9_389.x;
float l9_393=-l9_389.z;
float l9_394=(l9_392<0.0) ? (-1.0) : 1.0;
float l9_395=l9_394*acos(fast::clamp(l9_393/length(float2(l9_392,l9_393)),-1.0,1.0));
l9_391.x=l9_395-1.5707964;
l9_391.y=acos(l9_389.y);
l9_391/=float2(6.2831855,3.1415927);
l9_391.y=1.0-l9_391.y;
l9_391.x+=(l9_390/360.0);
l9_391.x=fract((l9_391.x+floor(l9_391.x))+1.0);
float2 l9_396=l9_391;
float2 l9_397=l9_396;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_398=floor(l9_387);
float l9_399=ceil(l9_387);
float l9_400=l9_387-l9_398;
float2 l9_401=l9_397;
float2 l9_402=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_403=l9_398;
float2 l9_404=calcSeamlessPanoramicUvsForSampling(l9_401,l9_402,l9_403);
float2 l9_405=l9_404;
float l9_406=l9_398;
float2 l9_407=l9_405;
float l9_408=l9_406;
int l9_409=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_410=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_410=0;
}
else
{
l9_410=in.varStereoViewID;
}
int l9_411=l9_410;
l9_409=1-l9_411;
}
else
{
int l9_412=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_412=0;
}
else
{
l9_412=in.varStereoViewID;
}
int l9_413=l9_412;
l9_409=l9_413;
}
int l9_414=l9_409;
float2 l9_415=l9_407;
int l9_416=l9_414;
float l9_417=l9_408;
float4 l9_418=float4(0.0);
float2 l9_419=l9_415;
int l9_420=sc_EnvmapSpecularLayout_tmp;
int l9_421=l9_416;
float l9_422=l9_417;
float2 l9_423=l9_419;
int l9_424=l9_420;
int l9_425=l9_421;
float3 l9_426=float3(0.0);
if (l9_424==0)
{
l9_426=float3(l9_423,0.0);
}
else
{
if (l9_424==1)
{
l9_426=float3(l9_423.x,(l9_423.y*0.5)+(0.5-(float(l9_425)*0.5)),0.0);
}
else
{
l9_426=float3(l9_423,float(l9_425));
}
}
float3 l9_427=l9_426;
float3 l9_428=l9_427;
float2 l9_429=l9_428.xy;
float l9_430=l9_422;
float4 l9_431=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_429,level(l9_430));
float4 l9_432=l9_431;
l9_418=l9_432;
float4 l9_433=l9_418;
float4 l9_434=l9_433;
float4 l9_435=l9_434;
float4 l9_436=l9_435;
float2 l9_437=l9_397;
float2 l9_438=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_439=l9_399;
float2 l9_440=calcSeamlessPanoramicUvsForSampling(l9_437,l9_438,l9_439);
float2 l9_441=l9_440;
float l9_442=l9_399;
float2 l9_443=l9_441;
float l9_444=l9_442;
int l9_445=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_446=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_446=0;
}
else
{
l9_446=in.varStereoViewID;
}
int l9_447=l9_446;
l9_445=1-l9_447;
}
else
{
int l9_448=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_448=0;
}
else
{
l9_448=in.varStereoViewID;
}
int l9_449=l9_448;
l9_445=l9_449;
}
int l9_450=l9_445;
float2 l9_451=l9_443;
int l9_452=l9_450;
float l9_453=l9_444;
float4 l9_454=float4(0.0);
float2 l9_455=l9_451;
int l9_456=sc_EnvmapSpecularLayout_tmp;
int l9_457=l9_452;
float l9_458=l9_453;
float2 l9_459=l9_455;
int l9_460=l9_456;
int l9_461=l9_457;
float3 l9_462=float3(0.0);
if (l9_460==0)
{
l9_462=float3(l9_459,0.0);
}
else
{
if (l9_460==1)
{
l9_462=float3(l9_459.x,(l9_459.y*0.5)+(0.5-(float(l9_461)*0.5)),0.0);
}
else
{
l9_462=float3(l9_459,float(l9_461));
}
}
float3 l9_463=l9_462;
float3 l9_464=l9_463;
float2 l9_465=l9_464.xy;
float l9_466=l9_458;
float4 l9_467=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_465,level(l9_466));
float4 l9_468=l9_467;
l9_454=l9_468;
float4 l9_469=l9_454;
float4 l9_470=l9_469;
float4 l9_471=l9_470;
float4 l9_472=l9_471;
l9_388=mix(l9_436,l9_472,float4(l9_400));
}
else
{
float2 l9_473=l9_397;
float l9_474=l9_387;
float2 l9_475=l9_473;
float l9_476=l9_474;
int l9_477=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
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
l9_477=1-l9_479;
}
else
{
int l9_480=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_480=0;
}
else
{
l9_480=in.varStereoViewID;
}
int l9_481=l9_480;
l9_477=l9_481;
}
int l9_482=l9_477;
float2 l9_483=l9_475;
int l9_484=l9_482;
float l9_485=l9_476;
float4 l9_486=float4(0.0);
float2 l9_487=l9_483;
int l9_488=sc_EnvmapSpecularLayout_tmp;
int l9_489=l9_484;
float l9_490=l9_485;
float2 l9_491=l9_487;
int l9_492=l9_488;
int l9_493=l9_489;
float3 l9_494=float3(0.0);
if (l9_492==0)
{
l9_494=float3(l9_491,0.0);
}
else
{
if (l9_492==1)
{
l9_494=float3(l9_491.x,(l9_491.y*0.5)+(0.5-(float(l9_493)*0.5)),0.0);
}
else
{
l9_494=float3(l9_491,float(l9_493));
}
}
float3 l9_495=l9_494;
float3 l9_496=l9_495;
float2 l9_497=l9_496.xy;
float l9_498=l9_490;
float4 l9_499=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_497,level(l9_498));
float4 l9_500=l9_499;
l9_486=l9_500;
float4 l9_501=l9_486;
float4 l9_502=l9_501;
float4 l9_503=l9_502;
l9_388=l9_503;
}
float4 l9_504=l9_388;
float3 l9_505=l9_504.xyz*(1.0/l9_504.w);
float3 l9_506=l9_505;
float3 l9_507=l9_506*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_507+=float3(1e-06);
float3 l9_508=l9_507;
float3 l9_509=l9_508;
bool l9_510=(*sc_set0.UserUniforms).receivesRayTracedReflections!=0;
if (l9_510)
{
float4 l9_511=sampleRayTracedReflections(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedReflectionTexture,sc_set0.sc_RayTracedReflectionTextureSmpSC,gl_FragCoord);
l9_509=mix(l9_509,l9_511.xyz,float3(l9_511.w));
}
SurfaceProperties l9_512=l9_373;
float l9_513=abs(dot(l9_375,l9_374));
float3 l9_514=l9_509*envBRDFApprox(l9_512,l9_513);
l9_372+=l9_514;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_515=l9_370;
float3 l9_516=l9_371;
float l9_517=fast::clamp(l9_515.roughness*l9_515.roughness,0.0099999998,1.0);
float3 l9_518=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_515.specColor;
sc_SphericalGaussianLight_t l9_519;
sc_SphericalGaussianLight_t l9_520;
sc_SphericalGaussianLight_t l9_521;
int l9_522=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_522<sc_LightEstimationSGCount_tmp)
{
l9_519.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_522].color;
l9_519.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_522].sharpness;
l9_519.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_522].axis;
float3 l9_523=l9_515.normal;
float l9_524=l9_517;
float3 l9_525=l9_516;
float3 l9_526=l9_515.specColor;
float3 l9_527=l9_523;
float l9_528=l9_524;
l9_520.axis=l9_527;
float l9_529=l9_528*l9_528;
l9_520.sharpness=2.0/l9_529;
l9_520.color=float3(1.0/(3.1415927*l9_529));
sc_SphericalGaussianLight_t l9_530=l9_520;
sc_SphericalGaussianLight_t l9_531=l9_530;
sc_SphericalGaussianLight_t l9_532=l9_531;
float3 l9_533=l9_525;
l9_521.axis=reflect(-l9_533,l9_532.axis);
l9_521.color=l9_532.color;
l9_521.sharpness=l9_532.sharpness;
l9_521.sharpness/=(4.0*fast::max(dot(l9_532.axis,l9_533),9.9999997e-05));
sc_SphericalGaussianLight_t l9_534=l9_521;
sc_SphericalGaussianLight_t l9_535=l9_534;
sc_SphericalGaussianLight_t l9_536=l9_535;
sc_SphericalGaussianLight_t l9_537=l9_519;
float l9_538=length((l9_536.axis*l9_536.sharpness)+(l9_537.axis*l9_537.sharpness));
float3 l9_539=(l9_536.color*exp((l9_538-l9_536.sharpness)-l9_537.sharpness))*l9_537.color;
float l9_540=1.0-exp((-2.0)*l9_538);
float3 l9_541=((l9_539*6.2831855)*l9_540)/float3(l9_538);
float3 l9_542=l9_541;
float3 l9_543=l9_535.axis;
float l9_544=l9_524*l9_524;
float l9_545=fast::clamp(dot(l9_523,l9_543),0.0,1.0);
float l9_546=fast::clamp(dot(l9_523,l9_525),0.0,1.0);
float3 l9_547=normalize(l9_535.axis+l9_525);
float l9_548=l9_544;
float l9_549=l9_545;
float l9_550=1.0/(l9_549+sqrt(l9_548+(((1.0-l9_548)*l9_549)*l9_549)));
float l9_551=l9_544;
float l9_552=l9_546;
float l9_553=1.0/(l9_552+sqrt(l9_551+(((1.0-l9_551)*l9_552)*l9_552)));
l9_542*=(l9_550*l9_553);
float l9_554=pow(1.0-fast::clamp(dot(l9_543,l9_547),0.0,1.0),5.0);
l9_542*=(l9_526+((float3(1.0)-l9_526)*l9_554));
l9_542*=l9_545;
float3 l9_555=l9_542;
l9_518+=l9_555;
l9_522++;
continue;
}
else
{
break;
}
}
float3 l9_556=l9_518;
l9_372+=l9_556;
}
float3 l9_557=l9_372;
l9_135.indirectSpecular=l9_557;
LightingComponents l9_558=l9_135;
LightingComponents l9_559=l9_558;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_559.directDiffuse=float3(0.0);
l9_559.indirectDiffuse=float3(0.0);
float4 l9_560=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_561=out.FragColor0;
float4 l9_562=l9_561;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_562.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_563=l9_562;
l9_560=l9_563;
}
else
{
float4 l9_564=gl_FragCoord;
float2 l9_565=l9_564.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_566=l9_565;
float2 l9_567=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_568=1;
int l9_569=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_569=0;
}
else
{
l9_569=in.varStereoViewID;
}
int l9_570=l9_569;
int l9_571=l9_570;
float3 l9_572=float3(l9_566,0.0);
int l9_573=l9_568;
int l9_574=l9_571;
if (l9_573==1)
{
l9_572.y=((2.0*l9_572.y)+float(l9_574))-1.0;
}
float2 l9_575=l9_572.xy;
l9_567=l9_575;
}
else
{
l9_567=l9_566;
}
float2 l9_576=l9_567;
float2 l9_577=l9_576;
float2 l9_578=l9_577;
int l9_579=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_580=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_580=0;
}
else
{
l9_580=in.varStereoViewID;
}
int l9_581=l9_580;
l9_579=1-l9_581;
}
else
{
int l9_582=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_582=0;
}
else
{
l9_582=in.varStereoViewID;
}
int l9_583=l9_582;
l9_579=l9_583;
}
int l9_584=l9_579;
float2 l9_585=l9_578;
int l9_586=l9_584;
float2 l9_587=l9_585;
int l9_588=l9_586;
float l9_589=0.0;
float4 l9_590=float4(0.0);
float2 l9_591=l9_587;
int l9_592=sc_ScreenTextureLayout_tmp;
int l9_593=l9_588;
float l9_594=l9_589;
float2 l9_595=l9_591;
int l9_596=l9_592;
int l9_597=l9_593;
float3 l9_598=float3(0.0);
if (l9_596==0)
{
l9_598=float3(l9_595,0.0);
}
else
{
if (l9_596==1)
{
l9_598=float3(l9_595.x,(l9_595.y*0.5)+(0.5-(float(l9_597)*0.5)),0.0);
}
else
{
l9_598=float3(l9_595,float(l9_597));
}
}
float3 l9_599=l9_598;
float3 l9_600=l9_599;
float2 l9_601=l9_600.xy;
float l9_602=l9_594;
float4 l9_603=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_601,bias(l9_602));
float4 l9_604=l9_603;
l9_590=l9_604;
float4 l9_605=l9_590;
float4 l9_606=l9_605;
float4 l9_607=l9_606;
l9_560=l9_607;
}
float4 l9_608=l9_560;
float4 l9_609=l9_608;
float3 l9_610=l9_609.xyz;
float3 l9_611;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_611=float3(pow(l9_610.x,2.2),pow(l9_610.y,2.2),pow(l9_610.z,2.2));
}
else
{
l9_611=l9_610*l9_610;
}
float3 l9_612=l9_611;
float3 l9_613=l9_612;
l9_559.transmitted=l9_613*mix(float3(1.0),l9_119.albedo,float3(l9_119.opacity));
l9_119.opacity=1.0;
}
bool l9_614=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_614=true;
}
SurfaceProperties l9_615=l9_119;
LightingComponents l9_616=l9_559;
bool l9_617=l9_614;
float3 l9_618=float3(0.0);
bool l9_619=(*sc_set0.UserUniforms).receivesRayTracedAo!=0;
if (l9_619)
{
l9_618=l9_615.albedo*(l9_616.directDiffuse+(l9_616.indirectDiffuse*float3(1.0-sampleRayTracedAo(in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_618=l9_615.albedo*(l9_616.directDiffuse+(l9_616.indirectDiffuse*l9_615.ao));
}
float3 l9_620=l9_616.directSpecular+(l9_616.indirectSpecular*l9_615.specularAo);
float3 l9_621=l9_615.emissive;
float3 l9_622=l9_616.transmitted;
if (l9_617)
{
float l9_623=l9_615.opacity;
l9_618*=srgbToLinear(l9_623);
}
float3 l9_624=((l9_618+l9_620)+l9_621)+l9_622;
float3 l9_625=l9_624;
float4 l9_626=float4(l9_625,l9_119.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_627=l9_626.xyz;
float l9_628=1.8;
float l9_629=1.4;
float l9_630=0.5;
float l9_631=1.5;
float3 l9_632=(l9_627*((l9_627*l9_628)+float3(l9_629)))/((l9_627*((l9_627*l9_628)+float3(l9_630)))+float3(l9_631));
l9_626=float4(l9_632.x,l9_632.y,l9_632.z,l9_626.w);
}
float3 l9_633=l9_626.xyz;
float l9_634=l9_633.x;
float l9_635=l9_633.y;
float l9_636=l9_633.z;
float3 l9_637=float3(linearToSrgb(l9_634),linearToSrgb(l9_635),linearToSrgb(l9_636));
l9_626=float4(l9_637.x,l9_637.y,l9_637.z,l9_626.w);
float4 l9_638=l9_626;
float4 param_16=l9_638;
param_16=fast::max(param_16,float4(0.0));
Output_N42=param_16;
float4 param_18=Output_N42;
Output_Color0=param_18;
float4 param_19=Output_Color0;
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_19=float4(param_19.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_639=param_19;
float4 l9_640=float4(0.0);
float4 l9_641=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_642=out.FragColor0;
float4 l9_643=l9_642;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_643.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_644=l9_643;
l9_641=l9_644;
}
else
{
float4 l9_645=gl_FragCoord;
float2 l9_646=l9_645.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_647=l9_646;
float2 l9_648=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_649=1;
int l9_650=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_650=0;
}
else
{
l9_650=in.varStereoViewID;
}
int l9_651=l9_650;
int l9_652=l9_651;
float3 l9_653=float3(l9_647,0.0);
int l9_654=l9_649;
int l9_655=l9_652;
if (l9_654==1)
{
l9_653.y=((2.0*l9_653.y)+float(l9_655))-1.0;
}
float2 l9_656=l9_653.xy;
l9_648=l9_656;
}
else
{
l9_648=l9_647;
}
float2 l9_657=l9_648;
float2 l9_658=l9_657;
float2 l9_659=l9_658;
int l9_660=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
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
float2 l9_666=l9_659;
int l9_667=l9_665;
float2 l9_668=l9_666;
int l9_669=l9_667;
float l9_670=0.0;
float4 l9_671=float4(0.0);
float2 l9_672=l9_668;
int l9_673=sc_ScreenTextureLayout_tmp;
int l9_674=l9_669;
float l9_675=l9_670;
float2 l9_676=l9_672;
int l9_677=l9_673;
int l9_678=l9_674;
float3 l9_679=float3(0.0);
if (l9_677==0)
{
l9_679=float3(l9_676,0.0);
}
else
{
if (l9_677==1)
{
l9_679=float3(l9_676.x,(l9_676.y*0.5)+(0.5-(float(l9_678)*0.5)),0.0);
}
else
{
l9_679=float3(l9_676,float(l9_678));
}
}
float3 l9_680=l9_679;
float3 l9_681=l9_680;
float2 l9_682=l9_681.xy;
float l9_683=l9_675;
float4 l9_684=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_682,bias(l9_683));
float4 l9_685=l9_684;
l9_671=l9_685;
float4 l9_686=l9_671;
float4 l9_687=l9_686;
float4 l9_688=l9_687;
l9_641=l9_688;
}
float4 l9_689=l9_641;
float4 l9_690=l9_689;
float3 l9_691=l9_690.xyz;
float3 l9_692=l9_691;
float3 l9_693=l9_639.xyz;
float3 l9_694=definedBlend(l9_692,l9_693,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_640=float4(l9_694.x,l9_694.y,l9_694.z,l9_640.w);
float3 l9_695=mix(l9_691,l9_640.xyz,float3(l9_639.w));
l9_640=float4(l9_695.x,l9_695.y,l9_695.z,l9_640.w);
l9_640.w=1.0;
float4 l9_696=l9_640;
param_19=l9_696;
}
else
{
float4 l9_697=param_19;
float4 l9_698=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_698=float4(mix(float3(1.0),l9_697.xyz,float3(l9_697.w)),l9_697.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_699=l9_697.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_699=fast::clamp(l9_699,0.0,1.0);
}
l9_698=float4(l9_697.xyz*l9_699,l9_699);
}
else
{
l9_698=l9_697;
}
}
float4 l9_700=l9_698;
param_19=l9_700;
}
}
float4 l9_701=param_19;
Output_Color0=l9_701;
float4 l9_702=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_702=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_702=float4(0.0);
}
float4 l9_703=l9_702;
float4 Cost=l9_703;
if (Cost.w>0.0)
{
Output_Color0=Cost;
}
float4 param_20=Output_Color0;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_20.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_20;
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
float3 VertexNormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
float4 VertexColor;
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
float numberMeshes;
float Tweak_N45;
float Port_AlphaTestThreshold_N039;
float Port_Opacity_N042;
float3 Port_Normal_N042;
float3 Port_Emissive_N042;
float Port_Metallic_N042;
float Port_Roughness_N042;
float3 Port_AO_N042;
float3 Port_SpecularAO_N042;
};
struct sc_Set0
{
texture2d<float> intensityTexture [[id(0)]];
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracedAoTexture [[id(15)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(16)]];
texture2d<float> sc_RayTracedReflectionTexture [[id(17)]];
texture2d<float> sc_RayTracedShadowTexture [[id(18)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler renderTarget0SmpSC [[id(24)]];
sampler renderTarget1SmpSC [[id(25)]];
sampler renderTarget2SmpSC [[id(26)]];
sampler renderTarget3SmpSC [[id(27)]];
sampler sc_EnvmapDiffuseSmpSC [[id(28)]];
sampler sc_EnvmapSpecularSmpSC [[id(29)]];
sampler sc_RayTracedAoTextureSmpSC [[id(31)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(32)]];
sampler sc_RayTracedReflectionTextureSmpSC [[id(33)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(34)]];
sampler sc_SSAOTextureSmpSC [[id(35)]];
sampler sc_ScreenTextureSmpSC [[id(36)]];
constant userUniformsObj* UserUniforms [[id(39)]];
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
float gParticlesDebug [[user(locn22)]];
float2 ParticleUV [[user(locn23)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 ssHue_to_RGB(thread float& Hue)
{
Hue=fract(Hue);
if (Hue<0.33329999)
{
return mix(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3((Hue-0.0)/0.33329999));
}
else
{
if (Hue<0.66659999)
{
return mix(float3(0.0,1.0,0.0),float3(0.0,0.0,1.0),float3((Hue-0.33329999)/0.33329999));
}
else
{
return mix(float3(0.0,0.0,1.0),float3(1.0,0.0,0.0),float3((Hue-0.66659999)/0.33329999));
}
}
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]])
{
main_recv_out out={};
int N36_NumMeshes=0;
int N36_MeshID=0;
int N36_SelectMode=0;
float N36_ComparisonID=0.0;
float3 ngsTempNormal=float3(0.0);
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
ngsTempNormal=in.varNormal;
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/257];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(ngsTempNormal);
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.VertexColor=in.varColor;
int param=in.Interp_Particle_Index;
ssParticle param_1=gParticle;
int l9_0=param/257;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%257;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(257*((param/257)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%257,l9_1/257);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/257.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(257.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/256.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/256.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(256.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*3600.0;
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
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+7200.0)/3600.0)*4.32723);
l9_19.Seed=fract(abs(l9_19.Seed));
int2 l9_23=int2(l9_19.Index1D%400,l9_19.Index1D/400);
l9_19.Seed2000=(float2(l9_23)+float2(1.0))/float2(399.0);
param_1=l9_19;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float Output_N47=0.0;
float param_2=(*sc_set0.UserUniforms).numberMeshes;
Output_N47=param_2;
float Output_N45=0.0;
float param_3=(*sc_set0.UserUniforms).Tweak_N45;
Output_N45=param_3;
float ComparisonID_N36=0.0;
float param_4=Output_N47;
float param_5=Output_N45;
ssGlobals param_7=Globals;
ssGlobals tempGlobals=param_7;
float param_6=0.0;
N36_NumMeshes=int(param_4);
N36_SelectMode=NODE_46_DROPLIST_ITEM_tmp;
N36_MeshID=int(param_5);
if (N36_SelectMode==0)
{
int l9_24=gParticle.Index1DPerCopy;
N36_ComparisonID=mod(float(l9_24),float(N36_NumMeshes));
}
if (N36_SelectMode==1)
{
bool l9_25=true;
bool l9_26=true;
bool l9_27=false;
float l9_28=0.0;
float l9_29=0.0;
int l9_30=1;
bool l9_31=l9_27;
bool l9_32=l9_26;
bool l9_33=l9_25;
float l9_34=36.0;
ssParticle l9_35=gParticle;
float l9_36=l9_28;
float l9_37=tempGlobals.gTimeElapsed;
float4 l9_38=float4(0.0);
float4 l9_39=float4(0.0);
if (l9_31)
{
l9_39.x=floor(fract(l9_37)*1000.0);
}
if (l9_33)
{
l9_39.y=float(l9_35.Index1D^((l9_35.Index1D*15299)+l9_35.Index1D));
}
if (l9_32)
{
l9_39.z=l9_34;
}
l9_39.w=l9_36*1000.0;
int l9_40=int(l9_39.x);
int l9_41=int(l9_39.y);
int l9_42=int(l9_39.z);
int l9_43=int(l9_39.w);
int l9_44=(((l9_40*15299)^(l9_41*30133))^(l9_42*17539))^(l9_43*12113);
int l9_45=l9_44;
if (l9_30==1)
{
int l9_46=l9_45;
int l9_47=l9_46;
int l9_48=((l9_47*((l9_47*1471343)+101146501))+1559861749)&2147483647;
int l9_49=l9_48;
float l9_50=float(l9_49)*4.6566129e-10;
float l9_51=l9_50;
l9_38.x=l9_51;
}
else
{
if (l9_30==2)
{
int l9_52=l9_45;
int l9_53=l9_52;
int l9_54=((l9_53*((l9_53*1471343)+101146501))+1559861749)&2147483647;
int l9_55=l9_54;
int l9_56=l9_52*1399;
int l9_57=((l9_56*((l9_56*1471343)+101146501))+1559861749)&2147483647;
int l9_58=l9_57;
int l9_59=l9_55;
float l9_60=float(l9_59)*4.6566129e-10;
int l9_61=l9_58;
float l9_62=float(l9_61)*4.6566129e-10;
float2 l9_63=float2(l9_60,l9_62);
l9_38=float4(l9_63.x,l9_63.y,l9_38.z,l9_38.w);
}
else
{
if (l9_30==3)
{
int l9_64=l9_45;
int l9_65=l9_64;
int l9_66=((l9_65*((l9_65*1471343)+101146501))+1559861749)&2147483647;
int l9_67=l9_66;
int l9_68=l9_64*1399;
int l9_69=((l9_68*((l9_68*1471343)+101146501))+1559861749)&2147483647;
int l9_70=l9_69;
int l9_71=l9_64*7177;
int l9_72=((l9_71*((l9_71*1471343)+101146501))+1559861749)&2147483647;
int l9_73=l9_72;
int l9_74=l9_67;
float l9_75=float(l9_74)*4.6566129e-10;
int l9_76=l9_70;
float l9_77=float(l9_76)*4.6566129e-10;
int l9_78=l9_73;
float l9_79=float(l9_78)*4.6566129e-10;
float3 l9_80=float3(l9_75,l9_77,l9_79);
l9_38=float4(l9_80.x,l9_80.y,l9_80.z,l9_38.w);
}
else
{
int l9_81=l9_45;
int l9_82=l9_81;
int l9_83=((l9_82*((l9_82*1471343)+101146501))+1559861749)&2147483647;
int l9_84=l9_83;
int l9_85=l9_81*1399;
int l9_86=((l9_85*((l9_85*1471343)+101146501))+1559861749)&2147483647;
int l9_87=l9_86;
int l9_88=l9_81*7177;
int l9_89=((l9_88*((l9_88*1471343)+101146501))+1559861749)&2147483647;
int l9_90=l9_89;
int l9_91=l9_81*18919;
int l9_92=((l9_91*((l9_91*1471343)+101146501))+1559861749)&2147483647;
int l9_93=l9_92;
int l9_94=l9_84;
float l9_95=float(l9_94)*4.6566129e-10;
int l9_96=l9_87;
float l9_97=float(l9_96)*4.6566129e-10;
int l9_98=l9_90;
float l9_99=float(l9_98)*4.6566129e-10;
int l9_100=l9_93;
float l9_101=float(l9_100)*4.6566129e-10;
float4 l9_102=float4(l9_95,l9_97,l9_99,l9_101);
l9_38=l9_102;
}
}
}
float4 l9_103=l9_38;
l9_29=l9_103.x;
float l9_104=l9_29;
float l9_105=l9_104;
N36_ComparisonID=floor(mix(0.0,float(N36_NumMeshes),l9_105));
}
if (N36_SelectMode==2)
{
N36_ComparisonID=float(N36_MeshID);
}
param_6=N36_ComparisonID;
ComparisonID_N36=param_6;
float Output_N38=0.0;
Output_N38=ComparisonID_N36/(Output_N47+1.234e-06);
float param_8=Output_N38;
float3 l9_106=ssHue_to_RGB(param_8);
float param_9=(*sc_set0.UserUniforms).Port_Roughness_N042;
ssGlobals param_10=Globals;
param_10.BumpedNormal=param_10.VertexNormal_WorldSpace;
float3 l9_107=param_10.PositionWS;
float3 l9_108=param_10.BumpedNormal;
float l9_109=param_9;
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
return out;
}
} // RECEIVER MODE SHADER
