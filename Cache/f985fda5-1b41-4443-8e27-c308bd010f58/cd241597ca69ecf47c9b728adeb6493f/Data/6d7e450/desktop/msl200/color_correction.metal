#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
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
//sampler sampler baseTexSmpSC 0:19
//sampler sampler intensityTextureSmpSC 0:20
//sampler sampler opacityTexSmpSC 0:21
//sampler sampler sc_ScreenTextureSmpSC 0:26
//sampler sampler screenTextureSmpSC 0:29
//texture texture2D baseTex 0:1:0:19
//texture texture2D intensityTexture 0:2:0:20
//texture texture2D opacityTex 0:3:0:21
//texture texture2D sc_ScreenTexture 0:15:0:26
//texture texture2D screenTexture 0:18:0:29
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:30:4544 {
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
//float correctedIntensity 3824
//float3x3 intensityTextureTransform 3888
//float4 intensityTextureUvMinMax 3936
//float4 intensityTextureBorderColor 3952
//int PreviewEnabled 4116
//float alphaTestThreshold 4124
//float3x3 screenTextureTransform 4176
//float4 screenTextureUvMinMax 4224
//float4 screenTextureBorderColor 4240
//float3x3 baseTexTransform 4304
//float4 baseTexUvMinMax 4352
//float4 baseTexBorderColor 4368
//float4 baseColor 4384
//float3x3 opacityTexTransform 4448
//float4 opacityTexUvMinMax 4496
//float4 opacityTexBorderColor 4512
//float opacity 4528
//float Port_Input2_N011 4532
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
//spec_const bool ENABLE_OPACITY_TEX 30 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTexture 35 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 36 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 37 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 38 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTexture 39 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 40 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 41 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 42 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTexture 43 0
//spec_const bool USE_LEGACY_512_TEXTURE 44 0
//spec_const bool UseViewSpaceDepthVariant 45 1
//spec_const bool baseTexHasSwappedViews 46 0
//spec_const bool intensityTextureHasSwappedViews 47 0
//spec_const bool opacityTexHasSwappedViews 48 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 49 0
//spec_const bool sc_BlendMode_Add 50 0
//spec_const bool sc_BlendMode_AlphaTest 51 0
//spec_const bool sc_BlendMode_AlphaToCoverage 52 0
//spec_const bool sc_BlendMode_ColoredGlass 53 0
//spec_const bool sc_BlendMode_Custom 54 0
//spec_const bool sc_BlendMode_Max 55 0
//spec_const bool sc_BlendMode_Min 56 0
//spec_const bool sc_BlendMode_MultiplyOriginal 57 0
//spec_const bool sc_BlendMode_Multiply 58 0
//spec_const bool sc_BlendMode_Normal 59 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 60 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 61 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 62 0
//spec_const bool sc_BlendMode_Screen 63 0
//spec_const bool sc_DepthOnly 64 0
//spec_const bool sc_FramebufferFetch 65 0
//spec_const bool sc_MotionVectorsPass 66 0
//spec_const bool sc_OITCompositingPass 67 0
//spec_const bool sc_OITDepthBoundsPass 68 0
//spec_const bool sc_OITDepthGatherPass 69 0
//spec_const bool sc_ProjectiveShadowsCaster 70 0
//spec_const bool sc_ProjectiveShadowsReceiver 71 0
//spec_const bool sc_RenderAlphaToColor 72 0
//spec_const bool sc_ScreenTextureHasSwappedViews 73 0
//spec_const bool sc_ShaderComplexityAnalyzer 74 0
//spec_const bool sc_TAAEnabled 75 0
//spec_const bool sc_UseFramebufferFetchMarker 76 0
//spec_const bool sc_VertexBlendingUseNormals 77 0
//spec_const bool sc_VertexBlending 78 0
//spec_const bool screenTextureHasSwappedViews 79 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 80 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 81 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 82 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTexture 83 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 84 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 85 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 86 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTexture 87 -1
//spec_const int baseTexLayout 88 0
//spec_const int intensityTextureLayout 89 0
//spec_const int opacityTexLayout 90 0
//spec_const int sc_DepthBufferMode 91 0
//spec_const int sc_RenderingSpace 92 -1
//spec_const int sc_ScreenTextureLayout 93 0
//spec_const int sc_ShaderCacheConstant 94 0
//spec_const int sc_SkinBonesCount 95 0
//spec_const int sc_StereoRenderingMode 96 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 97 0
//spec_const int screenTextureLayout 98 0
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
constant bool ENABLE_OPACITY_TEX [[function_constant(30)]];
constant bool ENABLE_OPACITY_TEX_tmp = is_function_constant_defined(ENABLE_OPACITY_TEX) ? ENABLE_OPACITY_TEX : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(31)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_screenTexture [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_screenTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screenTexture) ? SC_USE_CLAMP_TO_BORDER_screenTexture : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_screenTexture [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_screenTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screenTexture) ? SC_USE_UV_MIN_MAX_screenTexture : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(40)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(41)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_screenTexture [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_screenTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screenTexture) ? SC_USE_UV_TRANSFORM_screenTexture : false;
constant bool USE_LEGACY_512_TEXTURE [[function_constant(44)]];
constant bool USE_LEGACY_512_TEXTURE_tmp = is_function_constant_defined(USE_LEGACY_512_TEXTURE) ? USE_LEGACY_512_TEXTURE : false;
constant bool UseViewSpaceDepthVariant [[function_constant(45)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(46)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(47)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(48)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(49)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(50)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(51)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(52)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(53)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(54)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(55)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(56)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(57)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(58)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(59)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(60)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(61)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(62)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(63)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(64)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(65)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(66)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(67)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(68)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(69)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(70)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(71)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(72)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(73)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(74)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(75)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(76)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(77)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(78)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool screenTextureHasSwappedViews [[function_constant(79)]];
constant bool screenTextureHasSwappedViews_tmp = is_function_constant_defined(screenTextureHasSwappedViews) ? screenTextureHasSwappedViews : false;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(80)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(81)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(82)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screenTexture [[function_constant(83)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screenTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screenTexture) ? SC_SOFTWARE_WRAP_MODE_U_screenTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(84)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(85)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(86)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screenTexture [[function_constant(87)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screenTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screenTexture) ? SC_SOFTWARE_WRAP_MODE_V_screenTexture : -1;
constant int baseTexLayout [[function_constant(88)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(89)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int opacityTexLayout [[function_constant(90)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int sc_DepthBufferMode [[function_constant(91)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(92)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(93)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(94)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(95)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(96)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(97)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenTextureLayout [[function_constant(98)]];
constant int screenTextureLayout_tmp = is_function_constant_defined(screenTextureLayout) ? screenTextureLayout : 0;

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
float4 screenTextureSize;
float4 screenTextureDims;
float4 screenTextureView;
float3x3 screenTextureTransform;
float4 screenTextureUvMinMax;
float4 screenTextureBorderColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float4 baseColor;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float opacity;
float Port_Input2_N011;
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
texture2d<float> baseTex [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> opacityTex [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
texture2d<float> screenTexture [[id(18)]];
sampler baseTexSmpSC [[id(19)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler opacityTexSmpSC [[id(21)]];
sampler sc_ScreenTextureSmpSC [[id(26)]];
sampler screenTextureSmpSC [[id(29)]];
constant userUniformsObj* UserUniforms [[id(30)]];
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
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_1=v;
float3 param_2=WorldPosition;
float3 param_3=WorldNormal;
float3 param_4=WorldTangent;
float4 param_5=v.position;
out.varPos=param_2;
out.varNormal=normalize(param_3);
float3 l9_119=normalize(param_4);
out.varTangent=float4(l9_119.x,l9_119.y,l9_119.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_120=param_1.position;
float4 l9_121=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
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
l9_121=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_123]*l9_120;
}
else
{
if (sc_RenderingSpace_tmp==2)
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
l9_121=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_125]*l9_120;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=gl_InstanceIndex%2;
}
int l9_127=l9_126;
l9_121=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_127]*l9_120;
}
else
{
l9_121=l9_120;
}
}
}
float4 l9_128=l9_121;
out.varViewSpaceDepth=-l9_128.z;
}
float4 l9_129=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_129=param_5;
}
else
{
if (sc_RenderingSpace_tmp==4)
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
l9_129=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_131]*param_1.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
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
l9_129=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_133]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
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
l9_129=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_135]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_1.texture0,param_1.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_136=param_1.position;
float4 l9_137=l9_136;
if (sc_RenderingSpace_tmp==1)
{
l9_137=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_136;
}
float4 l9_138=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_137;
float2 l9_139=((l9_138.xy/float2(l9_138.w))*0.5)+float2(0.5);
out.varShadowTex=l9_139;
}
float4 l9_140=l9_129;
if (sc_DepthBufferMode_tmp==1)
{
int l9_141=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_141=0;
}
else
{
l9_141=gl_InstanceIndex%2;
}
int l9_142=l9_141;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_142][2].w!=0.0)
{
float l9_143=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_140.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_140.w))*l9_143)-1.0)*l9_140.w;
}
}
float4 l9_144=l9_140;
l9_129=l9_144;
float4 l9_145=l9_129;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_146=l9_145.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_145.w);
l9_145=float4(l9_146.x,l9_146.y,l9_145.z,l9_145.w);
}
float4 l9_147=l9_145;
l9_129=l9_147;
float4 l9_148=l9_129;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_148.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_149=l9_148;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_150=dot(l9_149,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_151=l9_150;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_151;
}
}
float4 l9_152=float4(l9_148.x,-l9_148.y,(l9_148.z*0.5)+(l9_148.w*0.5),l9_148.w);
out.gl_Position=l9_152;
v=param_1;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 gScreenCoord;
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
float4 screenTextureSize;
float4 screenTextureDims;
float4 screenTextureView;
float3x3 screenTextureTransform;
float4 screenTextureUvMinMax;
float4 screenTextureBorderColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float4 baseColor;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float opacity;
float Port_Input2_N011;
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
texture2d<float> baseTex [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> opacityTex [[id(3)]];
texture2d<float> sc_ScreenTexture [[id(15)]];
texture2d<float> screenTexture [[id(18)]];
sampler baseTexSmpSC [[id(19)]];
sampler intensityTextureSmpSC [[id(20)]];
sampler opacityTexSmpSC [[id(21)]];
sampler sc_ScreenTextureSmpSC [[id(26)]];
sampler screenTextureSmpSC [[id(29)]];
constant userUniformsObj* UserUniforms [[id(30)]];
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
float3 N12_ScreenTexture=float3(0.0);
float4 N12_BaseColor=float4(0.0);
float N12_factor=0.0;
float4 N12_Result=float4(0.0);
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
float4 Output_N14=float4(0.0);
float4 param=float4(1.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
float4 param_2;
if ((int(USE_LEGACY_512_TEXTURE_tmp)!=0))
{
float2 l9_14=float2(0.0);
l9_14=param_3.gScreenCoord;
float4 l9_15=float4(0.0);
int l9_16=0;
if ((int(screenTextureHasSwappedViews_tmp)!=0))
{
int l9_17=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_17=0;
}
else
{
l9_17=in.varStereoViewID;
}
int l9_18=l9_17;
l9_16=1-l9_18;
}
else
{
int l9_19=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_19=0;
}
else
{
l9_19=in.varStereoViewID;
}
int l9_20=l9_19;
l9_16=l9_20;
}
int l9_21=l9_16;
int l9_22=screenTextureLayout_tmp;
int l9_23=l9_21;
float2 l9_24=l9_14;
bool l9_25=(int(SC_USE_UV_TRANSFORM_screenTexture_tmp)!=0);
float3x3 l9_26=(*sc_set0.UserUniforms).screenTextureTransform;
int2 l9_27=int2(SC_SOFTWARE_WRAP_MODE_U_screenTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTexture_tmp);
bool l9_28=(int(SC_USE_UV_MIN_MAX_screenTexture_tmp)!=0);
float4 l9_29=(*sc_set0.UserUniforms).screenTextureUvMinMax;
bool l9_30=(int(SC_USE_CLAMP_TO_BORDER_screenTexture_tmp)!=0);
float4 l9_31=(*sc_set0.UserUniforms).screenTextureBorderColor;
float l9_32=0.0;
bool l9_33=l9_30&&(!l9_28);
float l9_34=1.0;
float l9_35=l9_24.x;
int l9_36=l9_27.x;
if (l9_36==1)
{
l9_35=fract(l9_35);
}
else
{
if (l9_36==2)
{
float l9_37=fract(l9_35);
float l9_38=l9_35-l9_37;
float l9_39=step(0.25,fract(l9_38*0.5));
l9_35=mix(l9_37,1.0-l9_37,fast::clamp(l9_39,0.0,1.0));
}
}
l9_24.x=l9_35;
float l9_40=l9_24.y;
int l9_41=l9_27.y;
if (l9_41==1)
{
l9_40=fract(l9_40);
}
else
{
if (l9_41==2)
{
float l9_42=fract(l9_40);
float l9_43=l9_40-l9_42;
float l9_44=step(0.25,fract(l9_43*0.5));
l9_40=mix(l9_42,1.0-l9_42,fast::clamp(l9_44,0.0,1.0));
}
}
l9_24.y=l9_40;
if (l9_28)
{
bool l9_45=l9_30;
bool l9_46;
if (l9_45)
{
l9_46=l9_27.x==3;
}
else
{
l9_46=l9_45;
}
float l9_47=l9_24.x;
float l9_48=l9_29.x;
float l9_49=l9_29.z;
bool l9_50=l9_46;
float l9_51=l9_34;
float l9_52=fast::clamp(l9_47,l9_48,l9_49);
float l9_53=step(abs(l9_47-l9_52),9.9999997e-06);
l9_51*=(l9_53+((1.0-float(l9_50))*(1.0-l9_53)));
l9_47=l9_52;
l9_24.x=l9_47;
l9_34=l9_51;
bool l9_54=l9_30;
bool l9_55;
if (l9_54)
{
l9_55=l9_27.y==3;
}
else
{
l9_55=l9_54;
}
float l9_56=l9_24.y;
float l9_57=l9_29.y;
float l9_58=l9_29.w;
bool l9_59=l9_55;
float l9_60=l9_34;
float l9_61=fast::clamp(l9_56,l9_57,l9_58);
float l9_62=step(abs(l9_56-l9_61),9.9999997e-06);
l9_60*=(l9_62+((1.0-float(l9_59))*(1.0-l9_62)));
l9_56=l9_61;
l9_24.y=l9_56;
l9_34=l9_60;
}
float2 l9_63=l9_24;
bool l9_64=l9_25;
float3x3 l9_65=l9_26;
if (l9_64)
{
l9_63=float2((l9_65*float3(l9_63,1.0)).xy);
}
float2 l9_66=l9_63;
float2 l9_67=l9_66;
float2 l9_68=l9_67;
l9_24=l9_68;
float l9_69=l9_24.x;
int l9_70=l9_27.x;
bool l9_71=l9_33;
float l9_72=l9_34;
if ((l9_70==0)||(l9_70==3))
{
float l9_73=l9_69;
float l9_74=0.0;
float l9_75=1.0;
bool l9_76=l9_71;
float l9_77=l9_72;
float l9_78=fast::clamp(l9_73,l9_74,l9_75);
float l9_79=step(abs(l9_73-l9_78),9.9999997e-06);
l9_77*=(l9_79+((1.0-float(l9_76))*(1.0-l9_79)));
l9_73=l9_78;
l9_69=l9_73;
l9_72=l9_77;
}
l9_24.x=l9_69;
l9_34=l9_72;
float l9_80=l9_24.y;
int l9_81=l9_27.y;
bool l9_82=l9_33;
float l9_83=l9_34;
if ((l9_81==0)||(l9_81==3))
{
float l9_84=l9_80;
float l9_85=0.0;
float l9_86=1.0;
bool l9_87=l9_82;
float l9_88=l9_83;
float l9_89=fast::clamp(l9_84,l9_85,l9_86);
float l9_90=step(abs(l9_84-l9_89),9.9999997e-06);
l9_88*=(l9_90+((1.0-float(l9_87))*(1.0-l9_90)));
l9_84=l9_89;
l9_80=l9_84;
l9_83=l9_88;
}
l9_24.y=l9_80;
l9_34=l9_83;
float2 l9_91=l9_24;
int l9_92=l9_22;
int l9_93=l9_23;
float l9_94=l9_32;
float2 l9_95=l9_91;
int l9_96=l9_92;
int l9_97=l9_93;
float3 l9_98=float3(0.0);
if (l9_96==0)
{
l9_98=float3(l9_95,0.0);
}
else
{
if (l9_96==1)
{
l9_98=float3(l9_95.x,(l9_95.y*0.5)+(0.5-(float(l9_97)*0.5)),0.0);
}
else
{
l9_98=float3(l9_95,float(l9_97));
}
}
float3 l9_99=l9_98;
float3 l9_100=l9_99;
float2 l9_101=l9_100.xy;
float l9_102=l9_94;
float4 l9_103=sc_set0.screenTexture.sample(sc_set0.screenTextureSmpSC,l9_101,bias(l9_102));
float4 l9_104=l9_103;
float4 l9_105=l9_104;
if (l9_30)
{
l9_105=mix(l9_31,l9_105,float4(l9_34));
}
float4 l9_106=l9_105;
l9_15=l9_106;
float4 l9_107=float4(0.0);
float4 l9_108=(*sc_set0.UserUniforms).baseColor;
l9_107=l9_108;
float l9_109=0.0;
l9_109=l9_107.w;
float l9_110=0.0;
float l9_111=1.0;
float l9_112=(*sc_set0.UserUniforms).Port_Input2_N011;
ssGlobals l9_113=param_3;
float l9_114;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_115=float2(0.0);
l9_115=l9_113.gScreenCoord;
float4 l9_116=float4(0.0);
int l9_117=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_118=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_118=0;
}
else
{
l9_118=in.varStereoViewID;
}
int l9_119=l9_118;
l9_117=1-l9_119;
}
else
{
int l9_120=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_120=0;
}
else
{
l9_120=in.varStereoViewID;
}
int l9_121=l9_120;
l9_117=l9_121;
}
int l9_122=l9_117;
int l9_123=opacityTexLayout_tmp;
int l9_124=l9_122;
float2 l9_125=l9_115;
bool l9_126=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_127=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_128=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_129=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_130=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_131=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_132=(*sc_set0.UserUniforms).opacityTexBorderColor;
float l9_133=0.0;
bool l9_134=l9_131&&(!l9_129);
float l9_135=1.0;
float l9_136=l9_125.x;
int l9_137=l9_128.x;
if (l9_137==1)
{
l9_136=fract(l9_136);
}
else
{
if (l9_137==2)
{
float l9_138=fract(l9_136);
float l9_139=l9_136-l9_138;
float l9_140=step(0.25,fract(l9_139*0.5));
l9_136=mix(l9_138,1.0-l9_138,fast::clamp(l9_140,0.0,1.0));
}
}
l9_125.x=l9_136;
float l9_141=l9_125.y;
int l9_142=l9_128.y;
if (l9_142==1)
{
l9_141=fract(l9_141);
}
else
{
if (l9_142==2)
{
float l9_143=fract(l9_141);
float l9_144=l9_141-l9_143;
float l9_145=step(0.25,fract(l9_144*0.5));
l9_141=mix(l9_143,1.0-l9_143,fast::clamp(l9_145,0.0,1.0));
}
}
l9_125.y=l9_141;
if (l9_129)
{
bool l9_146=l9_131;
bool l9_147;
if (l9_146)
{
l9_147=l9_128.x==3;
}
else
{
l9_147=l9_146;
}
float l9_148=l9_125.x;
float l9_149=l9_130.x;
float l9_150=l9_130.z;
bool l9_151=l9_147;
float l9_152=l9_135;
float l9_153=fast::clamp(l9_148,l9_149,l9_150);
float l9_154=step(abs(l9_148-l9_153),9.9999997e-06);
l9_152*=(l9_154+((1.0-float(l9_151))*(1.0-l9_154)));
l9_148=l9_153;
l9_125.x=l9_148;
l9_135=l9_152;
bool l9_155=l9_131;
bool l9_156;
if (l9_155)
{
l9_156=l9_128.y==3;
}
else
{
l9_156=l9_155;
}
float l9_157=l9_125.y;
float l9_158=l9_130.y;
float l9_159=l9_130.w;
bool l9_160=l9_156;
float l9_161=l9_135;
float l9_162=fast::clamp(l9_157,l9_158,l9_159);
float l9_163=step(abs(l9_157-l9_162),9.9999997e-06);
l9_161*=(l9_163+((1.0-float(l9_160))*(1.0-l9_163)));
l9_157=l9_162;
l9_125.y=l9_157;
l9_135=l9_161;
}
float2 l9_164=l9_125;
bool l9_165=l9_126;
float3x3 l9_166=l9_127;
if (l9_165)
{
l9_164=float2((l9_166*float3(l9_164,1.0)).xy);
}
float2 l9_167=l9_164;
float2 l9_168=l9_167;
float2 l9_169=l9_168;
l9_125=l9_169;
float l9_170=l9_125.x;
int l9_171=l9_128.x;
bool l9_172=l9_134;
float l9_173=l9_135;
if ((l9_171==0)||(l9_171==3))
{
float l9_174=l9_170;
float l9_175=0.0;
float l9_176=1.0;
bool l9_177=l9_172;
float l9_178=l9_173;
float l9_179=fast::clamp(l9_174,l9_175,l9_176);
float l9_180=step(abs(l9_174-l9_179),9.9999997e-06);
l9_178*=(l9_180+((1.0-float(l9_177))*(1.0-l9_180)));
l9_174=l9_179;
l9_170=l9_174;
l9_173=l9_178;
}
l9_125.x=l9_170;
l9_135=l9_173;
float l9_181=l9_125.y;
int l9_182=l9_128.y;
bool l9_183=l9_134;
float l9_184=l9_135;
if ((l9_182==0)||(l9_182==3))
{
float l9_185=l9_181;
float l9_186=0.0;
float l9_187=1.0;
bool l9_188=l9_183;
float l9_189=l9_184;
float l9_190=fast::clamp(l9_185,l9_186,l9_187);
float l9_191=step(abs(l9_185-l9_190),9.9999997e-06);
l9_189*=(l9_191+((1.0-float(l9_188))*(1.0-l9_191)));
l9_185=l9_190;
l9_181=l9_185;
l9_184=l9_189;
}
l9_125.y=l9_181;
l9_135=l9_184;
float2 l9_192=l9_125;
int l9_193=l9_123;
int l9_194=l9_124;
float l9_195=l9_133;
float2 l9_196=l9_192;
int l9_197=l9_193;
int l9_198=l9_194;
float3 l9_199=float3(0.0);
if (l9_197==0)
{
l9_199=float3(l9_196,0.0);
}
else
{
if (l9_197==1)
{
l9_199=float3(l9_196.x,(l9_196.y*0.5)+(0.5-(float(l9_198)*0.5)),0.0);
}
else
{
l9_199=float3(l9_196,float(l9_198));
}
}
float3 l9_200=l9_199;
float3 l9_201=l9_200;
float2 l9_202=l9_201.xy;
float l9_203=l9_195;
float4 l9_204=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_202,bias(l9_203));
float4 l9_205=l9_204;
float4 l9_206=l9_205;
if (l9_131)
{
l9_206=mix(l9_132,l9_206,float4(l9_135));
}
float4 l9_207=l9_206;
l9_116=l9_207;
float l9_208=0.0;
l9_208=l9_116.x;
float l9_209=0.0;
float l9_210=(*sc_set0.UserUniforms).opacity;
l9_209=l9_210;
float l9_211=0.0;
l9_211=l9_208*l9_209;
l9_111=l9_211;
l9_114=l9_111;
}
else
{
l9_114=l9_112;
}
l9_110=l9_114;
float l9_212=0.0;
l9_212=l9_109*l9_110;
float4 l9_213=float4(0.0);
float3 l9_214=l9_15.xyz;
float4 l9_215=l9_107;
float l9_216=l9_212;
float4 l9_217=float4(0.0);
N12_ScreenTexture=l9_214;
N12_BaseColor=l9_215;
N12_factor=l9_216;
float3 l9_218=N12_ScreenTexture;
float l9_219=(l9_218.z*255.0)/4.0;
float2 l9_220=fast::clamp(float2(floor(l9_219))+float2(0.0,1.0),float2(0.0),float2(63.0));
float2 l9_221=floor((l9_220/float2(8.0))+float2(1e-06));
float4 l9_222=float4(l9_221,l9_220-(l9_221*8.0));
float4 l9_223=((l9_218.yyxx*0.12304688)+(l9_222*0.125))+float4(0.0009765625);
float l9_224=l9_219-l9_220.x;
float2 l9_225=float2(l9_223.z,1.0-l9_223.x);
float4 l9_226=float4(0.0);
int l9_227=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_228=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_228=0;
}
else
{
l9_228=in.varStereoViewID;
}
int l9_229=l9_228;
l9_227=1-l9_229;
}
else
{
int l9_230=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_230=0;
}
else
{
l9_230=in.varStereoViewID;
}
int l9_231=l9_230;
l9_227=l9_231;
}
int l9_232=l9_227;
int l9_233=baseTexLayout_tmp;
int l9_234=l9_232;
float2 l9_235=l9_225;
bool l9_236=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_237=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_238=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_239=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_240=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_241=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_242=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_243=0.0;
bool l9_244=l9_241&&(!l9_239);
float l9_245=1.0;
float l9_246=l9_235.x;
int l9_247=l9_238.x;
if (l9_247==1)
{
l9_246=fract(l9_246);
}
else
{
if (l9_247==2)
{
float l9_248=fract(l9_246);
float l9_249=l9_246-l9_248;
float l9_250=step(0.25,fract(l9_249*0.5));
l9_246=mix(l9_248,1.0-l9_248,fast::clamp(l9_250,0.0,1.0));
}
}
l9_235.x=l9_246;
float l9_251=l9_235.y;
int l9_252=l9_238.y;
if (l9_252==1)
{
l9_251=fract(l9_251);
}
else
{
if (l9_252==2)
{
float l9_253=fract(l9_251);
float l9_254=l9_251-l9_253;
float l9_255=step(0.25,fract(l9_254*0.5));
l9_251=mix(l9_253,1.0-l9_253,fast::clamp(l9_255,0.0,1.0));
}
}
l9_235.y=l9_251;
if (l9_239)
{
bool l9_256=l9_241;
bool l9_257;
if (l9_256)
{
l9_257=l9_238.x==3;
}
else
{
l9_257=l9_256;
}
float l9_258=l9_235.x;
float l9_259=l9_240.x;
float l9_260=l9_240.z;
bool l9_261=l9_257;
float l9_262=l9_245;
float l9_263=fast::clamp(l9_258,l9_259,l9_260);
float l9_264=step(abs(l9_258-l9_263),9.9999997e-06);
l9_262*=(l9_264+((1.0-float(l9_261))*(1.0-l9_264)));
l9_258=l9_263;
l9_235.x=l9_258;
l9_245=l9_262;
bool l9_265=l9_241;
bool l9_266;
if (l9_265)
{
l9_266=l9_238.y==3;
}
else
{
l9_266=l9_265;
}
float l9_267=l9_235.y;
float l9_268=l9_240.y;
float l9_269=l9_240.w;
bool l9_270=l9_266;
float l9_271=l9_245;
float l9_272=fast::clamp(l9_267,l9_268,l9_269);
float l9_273=step(abs(l9_267-l9_272),9.9999997e-06);
l9_271*=(l9_273+((1.0-float(l9_270))*(1.0-l9_273)));
l9_267=l9_272;
l9_235.y=l9_267;
l9_245=l9_271;
}
float2 l9_274=l9_235;
bool l9_275=l9_236;
float3x3 l9_276=l9_237;
if (l9_275)
{
l9_274=float2((l9_276*float3(l9_274,1.0)).xy);
}
float2 l9_277=l9_274;
float2 l9_278=l9_277;
float2 l9_279=l9_278;
l9_235=l9_279;
float l9_280=l9_235.x;
int l9_281=l9_238.x;
bool l9_282=l9_244;
float l9_283=l9_245;
if ((l9_281==0)||(l9_281==3))
{
float l9_284=l9_280;
float l9_285=0.0;
float l9_286=1.0;
bool l9_287=l9_282;
float l9_288=l9_283;
float l9_289=fast::clamp(l9_284,l9_285,l9_286);
float l9_290=step(abs(l9_284-l9_289),9.9999997e-06);
l9_288*=(l9_290+((1.0-float(l9_287))*(1.0-l9_290)));
l9_284=l9_289;
l9_280=l9_284;
l9_283=l9_288;
}
l9_235.x=l9_280;
l9_245=l9_283;
float l9_291=l9_235.y;
int l9_292=l9_238.y;
bool l9_293=l9_244;
float l9_294=l9_245;
if ((l9_292==0)||(l9_292==3))
{
float l9_295=l9_291;
float l9_296=0.0;
float l9_297=1.0;
bool l9_298=l9_293;
float l9_299=l9_294;
float l9_300=fast::clamp(l9_295,l9_296,l9_297);
float l9_301=step(abs(l9_295-l9_300),9.9999997e-06);
l9_299*=(l9_301+((1.0-float(l9_298))*(1.0-l9_301)));
l9_295=l9_300;
l9_291=l9_295;
l9_294=l9_299;
}
l9_235.y=l9_291;
l9_245=l9_294;
float2 l9_302=l9_235;
int l9_303=l9_233;
int l9_304=l9_234;
float l9_305=l9_243;
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
float4 l9_314=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_312,bias(l9_313));
float4 l9_315=l9_314;
float4 l9_316=l9_315;
if (l9_241)
{
l9_316=mix(l9_242,l9_316,float4(l9_245));
}
float4 l9_317=l9_316;
l9_226=l9_317;
float4 l9_318=l9_226;
float3 l9_319=l9_318.xyz;
float2 l9_320=float2(l9_223.w,1.0-l9_223.y);
float4 l9_321=float4(0.0);
int l9_322=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_323=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_323=0;
}
else
{
l9_323=in.varStereoViewID;
}
int l9_324=l9_323;
l9_322=1-l9_324;
}
else
{
int l9_325=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_325=0;
}
else
{
l9_325=in.varStereoViewID;
}
int l9_326=l9_325;
l9_322=l9_326;
}
int l9_327=l9_322;
int l9_328=baseTexLayout_tmp;
int l9_329=l9_327;
float2 l9_330=l9_320;
bool l9_331=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_332=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_333=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_334=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_335=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_336=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_337=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_338=0.0;
bool l9_339=l9_336&&(!l9_334);
float l9_340=1.0;
float l9_341=l9_330.x;
int l9_342=l9_333.x;
if (l9_342==1)
{
l9_341=fract(l9_341);
}
else
{
if (l9_342==2)
{
float l9_343=fract(l9_341);
float l9_344=l9_341-l9_343;
float l9_345=step(0.25,fract(l9_344*0.5));
l9_341=mix(l9_343,1.0-l9_343,fast::clamp(l9_345,0.0,1.0));
}
}
l9_330.x=l9_341;
float l9_346=l9_330.y;
int l9_347=l9_333.y;
if (l9_347==1)
{
l9_346=fract(l9_346);
}
else
{
if (l9_347==2)
{
float l9_348=fract(l9_346);
float l9_349=l9_346-l9_348;
float l9_350=step(0.25,fract(l9_349*0.5));
l9_346=mix(l9_348,1.0-l9_348,fast::clamp(l9_350,0.0,1.0));
}
}
l9_330.y=l9_346;
if (l9_334)
{
bool l9_351=l9_336;
bool l9_352;
if (l9_351)
{
l9_352=l9_333.x==3;
}
else
{
l9_352=l9_351;
}
float l9_353=l9_330.x;
float l9_354=l9_335.x;
float l9_355=l9_335.z;
bool l9_356=l9_352;
float l9_357=l9_340;
float l9_358=fast::clamp(l9_353,l9_354,l9_355);
float l9_359=step(abs(l9_353-l9_358),9.9999997e-06);
l9_357*=(l9_359+((1.0-float(l9_356))*(1.0-l9_359)));
l9_353=l9_358;
l9_330.x=l9_353;
l9_340=l9_357;
bool l9_360=l9_336;
bool l9_361;
if (l9_360)
{
l9_361=l9_333.y==3;
}
else
{
l9_361=l9_360;
}
float l9_362=l9_330.y;
float l9_363=l9_335.y;
float l9_364=l9_335.w;
bool l9_365=l9_361;
float l9_366=l9_340;
float l9_367=fast::clamp(l9_362,l9_363,l9_364);
float l9_368=step(abs(l9_362-l9_367),9.9999997e-06);
l9_366*=(l9_368+((1.0-float(l9_365))*(1.0-l9_368)));
l9_362=l9_367;
l9_330.y=l9_362;
l9_340=l9_366;
}
float2 l9_369=l9_330;
bool l9_370=l9_331;
float3x3 l9_371=l9_332;
if (l9_370)
{
l9_369=float2((l9_371*float3(l9_369,1.0)).xy);
}
float2 l9_372=l9_369;
float2 l9_373=l9_372;
float2 l9_374=l9_373;
l9_330=l9_374;
float l9_375=l9_330.x;
int l9_376=l9_333.x;
bool l9_377=l9_339;
float l9_378=l9_340;
if ((l9_376==0)||(l9_376==3))
{
float l9_379=l9_375;
float l9_380=0.0;
float l9_381=1.0;
bool l9_382=l9_377;
float l9_383=l9_378;
float l9_384=fast::clamp(l9_379,l9_380,l9_381);
float l9_385=step(abs(l9_379-l9_384),9.9999997e-06);
l9_383*=(l9_385+((1.0-float(l9_382))*(1.0-l9_385)));
l9_379=l9_384;
l9_375=l9_379;
l9_378=l9_383;
}
l9_330.x=l9_375;
l9_340=l9_378;
float l9_386=l9_330.y;
int l9_387=l9_333.y;
bool l9_388=l9_339;
float l9_389=l9_340;
if ((l9_387==0)||(l9_387==3))
{
float l9_390=l9_386;
float l9_391=0.0;
float l9_392=1.0;
bool l9_393=l9_388;
float l9_394=l9_389;
float l9_395=fast::clamp(l9_390,l9_391,l9_392);
float l9_396=step(abs(l9_390-l9_395),9.9999997e-06);
l9_394*=(l9_396+((1.0-float(l9_393))*(1.0-l9_396)));
l9_390=l9_395;
l9_386=l9_390;
l9_389=l9_394;
}
l9_330.y=l9_386;
l9_340=l9_389;
float2 l9_397=l9_330;
int l9_398=l9_328;
int l9_399=l9_329;
float l9_400=l9_338;
float2 l9_401=l9_397;
int l9_402=l9_398;
int l9_403=l9_399;
float3 l9_404=float3(0.0);
if (l9_402==0)
{
l9_404=float3(l9_401,0.0);
}
else
{
if (l9_402==1)
{
l9_404=float3(l9_401.x,(l9_401.y*0.5)+(0.5-(float(l9_403)*0.5)),0.0);
}
else
{
l9_404=float3(l9_401,float(l9_403));
}
}
float3 l9_405=l9_404;
float3 l9_406=l9_405;
float2 l9_407=l9_406.xy;
float l9_408=l9_400;
float4 l9_409=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_407,bias(l9_408));
float4 l9_410=l9_409;
float4 l9_411=l9_410;
if (l9_336)
{
l9_411=mix(l9_337,l9_411,float4(l9_340));
}
float4 l9_412=l9_411;
l9_321=l9_412;
float4 l9_413=l9_321;
float3 l9_414=l9_413.xyz;
float3 l9_415=mix(l9_319,l9_414,float3(l9_224));
float3 l9_416=l9_415;
float3 l9_417=l9_416*N12_BaseColor.xyz;
N12_Result=float4(mix(N12_ScreenTexture,l9_417,float3(N12_factor)),1.0);
l9_217=N12_Result;
l9_213=l9_217;
param=l9_213;
param_2=param;
}
else
{
float2 l9_418=float2(0.0);
l9_418=param_3.gScreenCoord;
float4 l9_419=float4(0.0);
int l9_420=0;
if ((int(screenTextureHasSwappedViews_tmp)!=0))
{
int l9_421=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_421=0;
}
else
{
l9_421=in.varStereoViewID;
}
int l9_422=l9_421;
l9_420=1-l9_422;
}
else
{
int l9_423=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_423=0;
}
else
{
l9_423=in.varStereoViewID;
}
int l9_424=l9_423;
l9_420=l9_424;
}
int l9_425=l9_420;
int l9_426=screenTextureLayout_tmp;
int l9_427=l9_425;
float2 l9_428=l9_418;
bool l9_429=(int(SC_USE_UV_TRANSFORM_screenTexture_tmp)!=0);
float3x3 l9_430=(*sc_set0.UserUniforms).screenTextureTransform;
int2 l9_431=int2(SC_SOFTWARE_WRAP_MODE_U_screenTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTexture_tmp);
bool l9_432=(int(SC_USE_UV_MIN_MAX_screenTexture_tmp)!=0);
float4 l9_433=(*sc_set0.UserUniforms).screenTextureUvMinMax;
bool l9_434=(int(SC_USE_CLAMP_TO_BORDER_screenTexture_tmp)!=0);
float4 l9_435=(*sc_set0.UserUniforms).screenTextureBorderColor;
float l9_436=0.0;
bool l9_437=l9_434&&(!l9_432);
float l9_438=1.0;
float l9_439=l9_428.x;
int l9_440=l9_431.x;
if (l9_440==1)
{
l9_439=fract(l9_439);
}
else
{
if (l9_440==2)
{
float l9_441=fract(l9_439);
float l9_442=l9_439-l9_441;
float l9_443=step(0.25,fract(l9_442*0.5));
l9_439=mix(l9_441,1.0-l9_441,fast::clamp(l9_443,0.0,1.0));
}
}
l9_428.x=l9_439;
float l9_444=l9_428.y;
int l9_445=l9_431.y;
if (l9_445==1)
{
l9_444=fract(l9_444);
}
else
{
if (l9_445==2)
{
float l9_446=fract(l9_444);
float l9_447=l9_444-l9_446;
float l9_448=step(0.25,fract(l9_447*0.5));
l9_444=mix(l9_446,1.0-l9_446,fast::clamp(l9_448,0.0,1.0));
}
}
l9_428.y=l9_444;
if (l9_432)
{
bool l9_449=l9_434;
bool l9_450;
if (l9_449)
{
l9_450=l9_431.x==3;
}
else
{
l9_450=l9_449;
}
float l9_451=l9_428.x;
float l9_452=l9_433.x;
float l9_453=l9_433.z;
bool l9_454=l9_450;
float l9_455=l9_438;
float l9_456=fast::clamp(l9_451,l9_452,l9_453);
float l9_457=step(abs(l9_451-l9_456),9.9999997e-06);
l9_455*=(l9_457+((1.0-float(l9_454))*(1.0-l9_457)));
l9_451=l9_456;
l9_428.x=l9_451;
l9_438=l9_455;
bool l9_458=l9_434;
bool l9_459;
if (l9_458)
{
l9_459=l9_431.y==3;
}
else
{
l9_459=l9_458;
}
float l9_460=l9_428.y;
float l9_461=l9_433.y;
float l9_462=l9_433.w;
bool l9_463=l9_459;
float l9_464=l9_438;
float l9_465=fast::clamp(l9_460,l9_461,l9_462);
float l9_466=step(abs(l9_460-l9_465),9.9999997e-06);
l9_464*=(l9_466+((1.0-float(l9_463))*(1.0-l9_466)));
l9_460=l9_465;
l9_428.y=l9_460;
l9_438=l9_464;
}
float2 l9_467=l9_428;
bool l9_468=l9_429;
float3x3 l9_469=l9_430;
if (l9_468)
{
l9_467=float2((l9_469*float3(l9_467,1.0)).xy);
}
float2 l9_470=l9_467;
float2 l9_471=l9_470;
float2 l9_472=l9_471;
l9_428=l9_472;
float l9_473=l9_428.x;
int l9_474=l9_431.x;
bool l9_475=l9_437;
float l9_476=l9_438;
if ((l9_474==0)||(l9_474==3))
{
float l9_477=l9_473;
float l9_478=0.0;
float l9_479=1.0;
bool l9_480=l9_475;
float l9_481=l9_476;
float l9_482=fast::clamp(l9_477,l9_478,l9_479);
float l9_483=step(abs(l9_477-l9_482),9.9999997e-06);
l9_481*=(l9_483+((1.0-float(l9_480))*(1.0-l9_483)));
l9_477=l9_482;
l9_473=l9_477;
l9_476=l9_481;
}
l9_428.x=l9_473;
l9_438=l9_476;
float l9_484=l9_428.y;
int l9_485=l9_431.y;
bool l9_486=l9_437;
float l9_487=l9_438;
if ((l9_485==0)||(l9_485==3))
{
float l9_488=l9_484;
float l9_489=0.0;
float l9_490=1.0;
bool l9_491=l9_486;
float l9_492=l9_487;
float l9_493=fast::clamp(l9_488,l9_489,l9_490);
float l9_494=step(abs(l9_488-l9_493),9.9999997e-06);
l9_492*=(l9_494+((1.0-float(l9_491))*(1.0-l9_494)));
l9_488=l9_493;
l9_484=l9_488;
l9_487=l9_492;
}
l9_428.y=l9_484;
l9_438=l9_487;
float2 l9_495=l9_428;
int l9_496=l9_426;
int l9_497=l9_427;
float l9_498=l9_436;
float2 l9_499=l9_495;
int l9_500=l9_496;
int l9_501=l9_497;
float3 l9_502=float3(0.0);
if (l9_500==0)
{
l9_502=float3(l9_499,0.0);
}
else
{
if (l9_500==1)
{
l9_502=float3(l9_499.x,(l9_499.y*0.5)+(0.5-(float(l9_501)*0.5)),0.0);
}
else
{
l9_502=float3(l9_499,float(l9_501));
}
}
float3 l9_503=l9_502;
float3 l9_504=l9_503;
float2 l9_505=l9_504.xy;
float l9_506=l9_498;
float4 l9_507=sc_set0.screenTexture.sample(sc_set0.screenTextureSmpSC,l9_505,bias(l9_506));
float4 l9_508=l9_507;
float4 l9_509=l9_508;
if (l9_434)
{
l9_509=mix(l9_435,l9_509,float4(l9_438));
}
float4 l9_510=l9_509;
l9_419=l9_510;
float4 l9_511=float4(0.0);
float4 l9_512=l9_419;
float l9_513=l9_512.z*15.0;
float2 l9_514=fast::clamp(float2(floor(l9_513))+float2(0.0,1.0),float2(0.0),float2(15.0));
float3 l9_515=((l9_512.xxy*float3(0.05859375,0.05859375,0.9375))+float3(l9_514*0.0625,0.0))+float3(0.001953125,0.001953125,0.03125);
float l9_516=l9_513-l9_514.x;
int l9_517=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_518=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_518=0;
}
else
{
l9_518=in.varStereoViewID;
}
int l9_519=l9_518;
l9_517=1-l9_519;
}
else
{
int l9_520=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_520=0;
}
else
{
l9_520=in.varStereoViewID;
}
int l9_521=l9_520;
l9_517=l9_521;
}
int l9_522=l9_517;
int l9_523=baseTexLayout_tmp;
int l9_524=l9_522;
float2 l9_525=l9_515.xz;
bool l9_526=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_527=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_528=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_529=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_530=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_531=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_532=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_533=0.0;
bool l9_534=l9_531&&(!l9_529);
float l9_535=1.0;
float l9_536=l9_525.x;
int l9_537=l9_528.x;
if (l9_537==1)
{
l9_536=fract(l9_536);
}
else
{
if (l9_537==2)
{
float l9_538=fract(l9_536);
float l9_539=l9_536-l9_538;
float l9_540=step(0.25,fract(l9_539*0.5));
l9_536=mix(l9_538,1.0-l9_538,fast::clamp(l9_540,0.0,1.0));
}
}
l9_525.x=l9_536;
float l9_541=l9_525.y;
int l9_542=l9_528.y;
if (l9_542==1)
{
l9_541=fract(l9_541);
}
else
{
if (l9_542==2)
{
float l9_543=fract(l9_541);
float l9_544=l9_541-l9_543;
float l9_545=step(0.25,fract(l9_544*0.5));
l9_541=mix(l9_543,1.0-l9_543,fast::clamp(l9_545,0.0,1.0));
}
}
l9_525.y=l9_541;
if (l9_529)
{
bool l9_546=l9_531;
bool l9_547;
if (l9_546)
{
l9_547=l9_528.x==3;
}
else
{
l9_547=l9_546;
}
float l9_548=l9_525.x;
float l9_549=l9_530.x;
float l9_550=l9_530.z;
bool l9_551=l9_547;
float l9_552=l9_535;
float l9_553=fast::clamp(l9_548,l9_549,l9_550);
float l9_554=step(abs(l9_548-l9_553),9.9999997e-06);
l9_552*=(l9_554+((1.0-float(l9_551))*(1.0-l9_554)));
l9_548=l9_553;
l9_525.x=l9_548;
l9_535=l9_552;
bool l9_555=l9_531;
bool l9_556;
if (l9_555)
{
l9_556=l9_528.y==3;
}
else
{
l9_556=l9_555;
}
float l9_557=l9_525.y;
float l9_558=l9_530.y;
float l9_559=l9_530.w;
bool l9_560=l9_556;
float l9_561=l9_535;
float l9_562=fast::clamp(l9_557,l9_558,l9_559);
float l9_563=step(abs(l9_557-l9_562),9.9999997e-06);
l9_561*=(l9_563+((1.0-float(l9_560))*(1.0-l9_563)));
l9_557=l9_562;
l9_525.y=l9_557;
l9_535=l9_561;
}
float2 l9_564=l9_525;
bool l9_565=l9_526;
float3x3 l9_566=l9_527;
if (l9_565)
{
l9_564=float2((l9_566*float3(l9_564,1.0)).xy);
}
float2 l9_567=l9_564;
float2 l9_568=l9_567;
float2 l9_569=l9_568;
l9_525=l9_569;
float l9_570=l9_525.x;
int l9_571=l9_528.x;
bool l9_572=l9_534;
float l9_573=l9_535;
if ((l9_571==0)||(l9_571==3))
{
float l9_574=l9_570;
float l9_575=0.0;
float l9_576=1.0;
bool l9_577=l9_572;
float l9_578=l9_573;
float l9_579=fast::clamp(l9_574,l9_575,l9_576);
float l9_580=step(abs(l9_574-l9_579),9.9999997e-06);
l9_578*=(l9_580+((1.0-float(l9_577))*(1.0-l9_580)));
l9_574=l9_579;
l9_570=l9_574;
l9_573=l9_578;
}
l9_525.x=l9_570;
l9_535=l9_573;
float l9_581=l9_525.y;
int l9_582=l9_528.y;
bool l9_583=l9_534;
float l9_584=l9_535;
if ((l9_582==0)||(l9_582==3))
{
float l9_585=l9_581;
float l9_586=0.0;
float l9_587=1.0;
bool l9_588=l9_583;
float l9_589=l9_584;
float l9_590=fast::clamp(l9_585,l9_586,l9_587);
float l9_591=step(abs(l9_585-l9_590),9.9999997e-06);
l9_589*=(l9_591+((1.0-float(l9_588))*(1.0-l9_591)));
l9_585=l9_590;
l9_581=l9_585;
l9_584=l9_589;
}
l9_525.y=l9_581;
l9_535=l9_584;
float2 l9_592=l9_525;
int l9_593=l9_523;
int l9_594=l9_524;
float l9_595=l9_533;
float2 l9_596=l9_592;
int l9_597=l9_593;
int l9_598=l9_594;
float3 l9_599=float3(0.0);
if (l9_597==0)
{
l9_599=float3(l9_596,0.0);
}
else
{
if (l9_597==1)
{
l9_599=float3(l9_596.x,(l9_596.y*0.5)+(0.5-(float(l9_598)*0.5)),0.0);
}
else
{
l9_599=float3(l9_596,float(l9_598));
}
}
float3 l9_600=l9_599;
float3 l9_601=l9_600;
float2 l9_602=l9_601.xy;
float l9_603=l9_595;
float4 l9_604=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_602,bias(l9_603));
float4 l9_605=l9_604;
float4 l9_606=l9_605;
if (l9_531)
{
l9_606=mix(l9_532,l9_606,float4(l9_535));
}
float4 l9_607=l9_606;
float4 l9_608=l9_607;
int l9_609=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_610=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_610=0;
}
else
{
l9_610=in.varStereoViewID;
}
int l9_611=l9_610;
l9_609=1-l9_611;
}
else
{
int l9_612=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_612=0;
}
else
{
l9_612=in.varStereoViewID;
}
int l9_613=l9_612;
l9_609=l9_613;
}
int l9_614=l9_609;
int l9_615=baseTexLayout_tmp;
int l9_616=l9_614;
float2 l9_617=l9_515.yz;
bool l9_618=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_619=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_620=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_621=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_622=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_623=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_624=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_625=0.0;
bool l9_626=l9_623&&(!l9_621);
float l9_627=1.0;
float l9_628=l9_617.x;
int l9_629=l9_620.x;
if (l9_629==1)
{
l9_628=fract(l9_628);
}
else
{
if (l9_629==2)
{
float l9_630=fract(l9_628);
float l9_631=l9_628-l9_630;
float l9_632=step(0.25,fract(l9_631*0.5));
l9_628=mix(l9_630,1.0-l9_630,fast::clamp(l9_632,0.0,1.0));
}
}
l9_617.x=l9_628;
float l9_633=l9_617.y;
int l9_634=l9_620.y;
if (l9_634==1)
{
l9_633=fract(l9_633);
}
else
{
if (l9_634==2)
{
float l9_635=fract(l9_633);
float l9_636=l9_633-l9_635;
float l9_637=step(0.25,fract(l9_636*0.5));
l9_633=mix(l9_635,1.0-l9_635,fast::clamp(l9_637,0.0,1.0));
}
}
l9_617.y=l9_633;
if (l9_621)
{
bool l9_638=l9_623;
bool l9_639;
if (l9_638)
{
l9_639=l9_620.x==3;
}
else
{
l9_639=l9_638;
}
float l9_640=l9_617.x;
float l9_641=l9_622.x;
float l9_642=l9_622.z;
bool l9_643=l9_639;
float l9_644=l9_627;
float l9_645=fast::clamp(l9_640,l9_641,l9_642);
float l9_646=step(abs(l9_640-l9_645),9.9999997e-06);
l9_644*=(l9_646+((1.0-float(l9_643))*(1.0-l9_646)));
l9_640=l9_645;
l9_617.x=l9_640;
l9_627=l9_644;
bool l9_647=l9_623;
bool l9_648;
if (l9_647)
{
l9_648=l9_620.y==3;
}
else
{
l9_648=l9_647;
}
float l9_649=l9_617.y;
float l9_650=l9_622.y;
float l9_651=l9_622.w;
bool l9_652=l9_648;
float l9_653=l9_627;
float l9_654=fast::clamp(l9_649,l9_650,l9_651);
float l9_655=step(abs(l9_649-l9_654),9.9999997e-06);
l9_653*=(l9_655+((1.0-float(l9_652))*(1.0-l9_655)));
l9_649=l9_654;
l9_617.y=l9_649;
l9_627=l9_653;
}
float2 l9_656=l9_617;
bool l9_657=l9_618;
float3x3 l9_658=l9_619;
if (l9_657)
{
l9_656=float2((l9_658*float3(l9_656,1.0)).xy);
}
float2 l9_659=l9_656;
float2 l9_660=l9_659;
float2 l9_661=l9_660;
l9_617=l9_661;
float l9_662=l9_617.x;
int l9_663=l9_620.x;
bool l9_664=l9_626;
float l9_665=l9_627;
if ((l9_663==0)||(l9_663==3))
{
float l9_666=l9_662;
float l9_667=0.0;
float l9_668=1.0;
bool l9_669=l9_664;
float l9_670=l9_665;
float l9_671=fast::clamp(l9_666,l9_667,l9_668);
float l9_672=step(abs(l9_666-l9_671),9.9999997e-06);
l9_670*=(l9_672+((1.0-float(l9_669))*(1.0-l9_672)));
l9_666=l9_671;
l9_662=l9_666;
l9_665=l9_670;
}
l9_617.x=l9_662;
l9_627=l9_665;
float l9_673=l9_617.y;
int l9_674=l9_620.y;
bool l9_675=l9_626;
float l9_676=l9_627;
if ((l9_674==0)||(l9_674==3))
{
float l9_677=l9_673;
float l9_678=0.0;
float l9_679=1.0;
bool l9_680=l9_675;
float l9_681=l9_676;
float l9_682=fast::clamp(l9_677,l9_678,l9_679);
float l9_683=step(abs(l9_677-l9_682),9.9999997e-06);
l9_681*=(l9_683+((1.0-float(l9_680))*(1.0-l9_683)));
l9_677=l9_682;
l9_673=l9_677;
l9_676=l9_681;
}
l9_617.y=l9_673;
l9_627=l9_676;
float2 l9_684=l9_617;
int l9_685=l9_615;
int l9_686=l9_616;
float l9_687=l9_625;
float2 l9_688=l9_684;
int l9_689=l9_685;
int l9_690=l9_686;
float3 l9_691=float3(0.0);
if (l9_689==0)
{
l9_691=float3(l9_688,0.0);
}
else
{
if (l9_689==1)
{
l9_691=float3(l9_688.x,(l9_688.y*0.5)+(0.5-(float(l9_690)*0.5)),0.0);
}
else
{
l9_691=float3(l9_688,float(l9_690));
}
}
float3 l9_692=l9_691;
float3 l9_693=l9_692;
float2 l9_694=l9_693.xy;
float l9_695=l9_687;
float4 l9_696=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_694,bias(l9_695));
float4 l9_697=l9_696;
float4 l9_698=l9_697;
if (l9_623)
{
l9_698=mix(l9_624,l9_698,float4(l9_627));
}
float4 l9_699=l9_698;
float4 l9_700=l9_699;
float4 l9_701=float4(mix(l9_608.xyz,l9_700.xyz,float3(l9_516)),l9_512.w);
l9_511=l9_701;
float4 l9_702=float4(0.0);
float4 l9_703=(*sc_set0.UserUniforms).baseColor;
l9_702=l9_703;
float3 l9_704=float3(0.0);
l9_704=l9_511.xyz*l9_702.xyz;
float l9_705=0.0;
l9_705=l9_702.w;
float l9_706=0.0;
float l9_707=1.0;
float l9_708=(*sc_set0.UserUniforms).Port_Input2_N011;
ssGlobals l9_709=param_3;
float l9_710;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_711=float2(0.0);
l9_711=l9_709.gScreenCoord;
float4 l9_712=float4(0.0);
int l9_713=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_714=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_714=0;
}
else
{
l9_714=in.varStereoViewID;
}
int l9_715=l9_714;
l9_713=1-l9_715;
}
else
{
int l9_716=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_716=0;
}
else
{
l9_716=in.varStereoViewID;
}
int l9_717=l9_716;
l9_713=l9_717;
}
int l9_718=l9_713;
int l9_719=opacityTexLayout_tmp;
int l9_720=l9_718;
float2 l9_721=l9_711;
bool l9_722=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_723=(*sc_set0.UserUniforms).opacityTexTransform;
int2 l9_724=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_725=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_726=(*sc_set0.UserUniforms).opacityTexUvMinMax;
bool l9_727=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_728=(*sc_set0.UserUniforms).opacityTexBorderColor;
float l9_729=0.0;
bool l9_730=l9_727&&(!l9_725);
float l9_731=1.0;
float l9_732=l9_721.x;
int l9_733=l9_724.x;
if (l9_733==1)
{
l9_732=fract(l9_732);
}
else
{
if (l9_733==2)
{
float l9_734=fract(l9_732);
float l9_735=l9_732-l9_734;
float l9_736=step(0.25,fract(l9_735*0.5));
l9_732=mix(l9_734,1.0-l9_734,fast::clamp(l9_736,0.0,1.0));
}
}
l9_721.x=l9_732;
float l9_737=l9_721.y;
int l9_738=l9_724.y;
if (l9_738==1)
{
l9_737=fract(l9_737);
}
else
{
if (l9_738==2)
{
float l9_739=fract(l9_737);
float l9_740=l9_737-l9_739;
float l9_741=step(0.25,fract(l9_740*0.5));
l9_737=mix(l9_739,1.0-l9_739,fast::clamp(l9_741,0.0,1.0));
}
}
l9_721.y=l9_737;
if (l9_725)
{
bool l9_742=l9_727;
bool l9_743;
if (l9_742)
{
l9_743=l9_724.x==3;
}
else
{
l9_743=l9_742;
}
float l9_744=l9_721.x;
float l9_745=l9_726.x;
float l9_746=l9_726.z;
bool l9_747=l9_743;
float l9_748=l9_731;
float l9_749=fast::clamp(l9_744,l9_745,l9_746);
float l9_750=step(abs(l9_744-l9_749),9.9999997e-06);
l9_748*=(l9_750+((1.0-float(l9_747))*(1.0-l9_750)));
l9_744=l9_749;
l9_721.x=l9_744;
l9_731=l9_748;
bool l9_751=l9_727;
bool l9_752;
if (l9_751)
{
l9_752=l9_724.y==3;
}
else
{
l9_752=l9_751;
}
float l9_753=l9_721.y;
float l9_754=l9_726.y;
float l9_755=l9_726.w;
bool l9_756=l9_752;
float l9_757=l9_731;
float l9_758=fast::clamp(l9_753,l9_754,l9_755);
float l9_759=step(abs(l9_753-l9_758),9.9999997e-06);
l9_757*=(l9_759+((1.0-float(l9_756))*(1.0-l9_759)));
l9_753=l9_758;
l9_721.y=l9_753;
l9_731=l9_757;
}
float2 l9_760=l9_721;
bool l9_761=l9_722;
float3x3 l9_762=l9_723;
if (l9_761)
{
l9_760=float2((l9_762*float3(l9_760,1.0)).xy);
}
float2 l9_763=l9_760;
float2 l9_764=l9_763;
float2 l9_765=l9_764;
l9_721=l9_765;
float l9_766=l9_721.x;
int l9_767=l9_724.x;
bool l9_768=l9_730;
float l9_769=l9_731;
if ((l9_767==0)||(l9_767==3))
{
float l9_770=l9_766;
float l9_771=0.0;
float l9_772=1.0;
bool l9_773=l9_768;
float l9_774=l9_769;
float l9_775=fast::clamp(l9_770,l9_771,l9_772);
float l9_776=step(abs(l9_770-l9_775),9.9999997e-06);
l9_774*=(l9_776+((1.0-float(l9_773))*(1.0-l9_776)));
l9_770=l9_775;
l9_766=l9_770;
l9_769=l9_774;
}
l9_721.x=l9_766;
l9_731=l9_769;
float l9_777=l9_721.y;
int l9_778=l9_724.y;
bool l9_779=l9_730;
float l9_780=l9_731;
if ((l9_778==0)||(l9_778==3))
{
float l9_781=l9_777;
float l9_782=0.0;
float l9_783=1.0;
bool l9_784=l9_779;
float l9_785=l9_780;
float l9_786=fast::clamp(l9_781,l9_782,l9_783);
float l9_787=step(abs(l9_781-l9_786),9.9999997e-06);
l9_785*=(l9_787+((1.0-float(l9_784))*(1.0-l9_787)));
l9_781=l9_786;
l9_777=l9_781;
l9_780=l9_785;
}
l9_721.y=l9_777;
l9_731=l9_780;
float2 l9_788=l9_721;
int l9_789=l9_719;
int l9_790=l9_720;
float l9_791=l9_729;
float2 l9_792=l9_788;
int l9_793=l9_789;
int l9_794=l9_790;
float3 l9_795=float3(0.0);
if (l9_793==0)
{
l9_795=float3(l9_792,0.0);
}
else
{
if (l9_793==1)
{
l9_795=float3(l9_792.x,(l9_792.y*0.5)+(0.5-(float(l9_794)*0.5)),0.0);
}
else
{
l9_795=float3(l9_792,float(l9_794));
}
}
float3 l9_796=l9_795;
float3 l9_797=l9_796;
float2 l9_798=l9_797.xy;
float l9_799=l9_791;
float4 l9_800=sc_set0.opacityTex.sample(sc_set0.opacityTexSmpSC,l9_798,bias(l9_799));
float4 l9_801=l9_800;
float4 l9_802=l9_801;
if (l9_727)
{
l9_802=mix(l9_728,l9_802,float4(l9_731));
}
float4 l9_803=l9_802;
l9_712=l9_803;
float l9_804=0.0;
l9_804=l9_712.x;
float l9_805=0.0;
float l9_806=(*sc_set0.UserUniforms).opacity;
l9_805=l9_806;
float l9_807=0.0;
l9_807=l9_804*l9_805;
l9_707=l9_807;
l9_710=l9_707;
}
else
{
l9_710=l9_708;
}
l9_706=l9_710;
float l9_808=0.0;
l9_808=l9_705*l9_706;
float3 l9_809=float3(0.0);
l9_809=mix(l9_419.xyz,l9_704,float3(l9_808));
float4 l9_810=float4(0.0);
l9_810=float4(l9_809.x,l9_809.y,l9_809.z,1.0);
param_1=l9_810;
param_2=param_1;
}
Output_N14=param_2;
FinalColor=Output_N14;
float param_4=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_4<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_811=gl_FragCoord;
float2 l9_812=floor(mod(l9_811.xy,float2(4.0)));
float l9_813=(mod(dot(l9_812,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_4<l9_813)
{
discard_fragment();
}
}
float4 param_5=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_814=param_5;
float4 l9_815=l9_814;
float l9_816=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_816=l9_815.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_816=fast::clamp(l9_815.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_816=fast::clamp(dot(l9_815.xyz,float3(l9_815.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_816=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_816=(1.0-dot(l9_815.xyz,float3(0.33333001)))*l9_815.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_816=(1.0-fast::clamp(dot(l9_815.xyz,float3(1.0)),0.0,1.0))*l9_815.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_816=fast::clamp(dot(l9_815.xyz,float3(1.0)),0.0,1.0)*l9_815.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_816=fast::clamp(dot(l9_815.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_816=fast::clamp(dot(l9_815.xyz,float3(1.0)),0.0,1.0)*l9_815.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_816=dot(l9_815.xyz,float3(0.33333001))*l9_815.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_816=1.0-fast::clamp(dot(l9_815.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_816=fast::clamp(dot(l9_815.xyz,float3(1.0)),0.0,1.0);
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
float l9_817=l9_816;
float l9_818=l9_817;
float l9_819=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_818;
float3 l9_820=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_814.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_821=float4(l9_820.x,l9_820.y,l9_820.z,l9_819);
param_5=l9_821;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_5=float4(param_5.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_822=param_5;
float4 l9_823=float4(0.0);
float4 l9_824=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_825=out.FragColor0;
float4 l9_826=l9_825;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_826.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_827=l9_826;
l9_824=l9_827;
}
else
{
float4 l9_828=gl_FragCoord;
float2 l9_829=l9_828.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_830=l9_829;
float2 l9_831=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_832=1;
int l9_833=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_833=0;
}
else
{
l9_833=in.varStereoViewID;
}
int l9_834=l9_833;
int l9_835=l9_834;
float3 l9_836=float3(l9_830,0.0);
int l9_837=l9_832;
int l9_838=l9_835;
if (l9_837==1)
{
l9_836.y=((2.0*l9_836.y)+float(l9_838))-1.0;
}
float2 l9_839=l9_836.xy;
l9_831=l9_839;
}
else
{
l9_831=l9_830;
}
float2 l9_840=l9_831;
float2 l9_841=l9_840;
float2 l9_842=l9_841;
int l9_843=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_844=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_844=0;
}
else
{
l9_844=in.varStereoViewID;
}
int l9_845=l9_844;
l9_843=1-l9_845;
}
else
{
int l9_846=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_846=0;
}
else
{
l9_846=in.varStereoViewID;
}
int l9_847=l9_846;
l9_843=l9_847;
}
int l9_848=l9_843;
float2 l9_849=l9_842;
int l9_850=l9_848;
float2 l9_851=l9_849;
int l9_852=l9_850;
float l9_853=0.0;
float4 l9_854=float4(0.0);
float2 l9_855=l9_851;
int l9_856=sc_ScreenTextureLayout_tmp;
int l9_857=l9_852;
float l9_858=l9_853;
float2 l9_859=l9_855;
int l9_860=l9_856;
int l9_861=l9_857;
float3 l9_862=float3(0.0);
if (l9_860==0)
{
l9_862=float3(l9_859,0.0);
}
else
{
if (l9_860==1)
{
l9_862=float3(l9_859.x,(l9_859.y*0.5)+(0.5-(float(l9_861)*0.5)),0.0);
}
else
{
l9_862=float3(l9_859,float(l9_861));
}
}
float3 l9_863=l9_862;
float3 l9_864=l9_863;
float2 l9_865=l9_864.xy;
float l9_866=l9_858;
float4 l9_867=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_865,bias(l9_866));
float4 l9_868=l9_867;
l9_854=l9_868;
float4 l9_869=l9_854;
float4 l9_870=l9_869;
float4 l9_871=l9_870;
l9_824=l9_871;
}
float4 l9_872=l9_824;
float4 l9_873=l9_872;
float3 l9_874=l9_873.xyz;
float3 l9_875=l9_874;
float3 l9_876=l9_822.xyz;
float3 l9_877=definedBlend(l9_875,l9_876,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_823=float4(l9_877.x,l9_877.y,l9_877.z,l9_823.w);
float3 l9_878=mix(l9_874,l9_823.xyz,float3(l9_822.w));
l9_823=float4(l9_878.x,l9_878.y,l9_878.z,l9_823.w);
l9_823.w=1.0;
float4 l9_879=l9_823;
param_5=l9_879;
}
else
{
float4 l9_880=param_5;
float4 l9_881=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_881=float4(mix(float3(1.0),l9_880.xyz,float3(l9_880.w)),l9_880.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_882=l9_880.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_882=fast::clamp(l9_882,0.0,1.0);
}
l9_881=float4(l9_880.xyz*l9_882,l9_882);
}
else
{
l9_881=l9_880;
}
}
float4 l9_883=l9_881;
param_5=l9_883;
}
}
}
float4 l9_884=param_5;
FinalColor=l9_884;
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
float4 l9_885=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_885=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_885=float4(0.0);
}
float4 l9_886=l9_885;
float4 Cost=l9_886;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_6=in.varPos;
float4 param_7=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_6,param_7,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_8=FinalColor;
float4 l9_887=param_8;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_887.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_887;
return out;
}
} // FRAGMENT SHADER
