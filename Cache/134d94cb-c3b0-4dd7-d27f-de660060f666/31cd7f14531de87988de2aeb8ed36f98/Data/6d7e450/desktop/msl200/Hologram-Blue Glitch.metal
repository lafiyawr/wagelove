#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
//efine SC_DISABLE_FRUSTUM_CULLING 1
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
//sampler sampler intensityTextureSmpSC 0:17
//sampler sampler opacityTextureSmpSC 0:18
//sampler sampler sc_ScreenTextureSmpSC 0:23
//texture texture2D intensityTexture 0:1:0:17
//texture texture2D opacityTexture 0:2:0:18
//texture texture2D sc_ScreenTexture 0:14:0:23
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:26:4752 {
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
//float correctedIntensity 3824
//float3x3 intensityTextureTransform 3888
//float4 intensityTextureUvMinMax 3936
//float4 intensityTextureBorderColor 3952
//int PreviewEnabled 4116
//float alphaTestThreshold 4124
//float glitchFrequency 4128
//float glitchSpeed 4132
//float glitchOffset 4136
//float glitchIntensity 4140
//float glitchScale 4144
//float thickLines 4148
//float scanlineSpeed 4152
//float Offset 4156
//float randScale 4160
//float4 thicklinesColor 4176
//float thinLines 4192
//float4 thinlinesColor 4208
//float4 rimTint 4224
//float3x3 opacityTextureTransform 4288
//float4 opacityTextureUvMinMax 4336
//float4 opacityTextureBorderColor 4352
//float Port_RangeMinA_N034 4372
//float Port_RangeMaxA_N034 4376
//float Port_RangeMinB_N034 4380
//float Port_RangeMaxB_N034 4384
//float Port_RangeMinA_N002 4388
//float Port_RangeMaxA_N002 4392
//float Port_RangeMinB_N002 4396
//float Port_RangeMaxB_N002 4400
//float Port_RangeMinA_N103 4404
//float Port_RangeMaxA_N103 4408
//float Port_RangeMinB_N103 4412
//float Port_RangeMaxB_N103 4416
//float Port_Input1_N055 4424
//float Port_Input1_N056 4428
//float Port_Input1_N066 4432
//float Port_Import_N203 4444
//float Port_Input0_N009 4480
//float Port_Import_N181 4512
//float Port_Input1_N182 4516
//float Port_Input2_N182 4520
//float Port_Import_N174 4544
//float2 Port_Scale_N164 4552
//float Port_Input1_N140 4560
//float Port_Input1_N141 4564
//float Port_Input2_N110 4568
//float Port_Input1_N117 4572
//float Port_RangeMinA_N063 4576
//float Port_RangeMaxA_N063 4580
//float Port_RangeMinB_N063 4584
//float Port_RangeMaxB_N063 4588
//float Port_RangeMinA_N067 4592
//float Port_RangeMaxA_N067 4596
//float Port_RangeMinB_N067 4600
//float Port_RangeMaxB_N067 4604
//float Port_Input1_N078 4608
//float Port_Input0_N129 4612
//float Port_Import_N071 4656
//float Port_Input1_N072 4660
//float Port_Input2_N072 4664
//float Port_Import_N106 4688
//float2 Port_Scale_N041 4696
//float Port_Input1_N122 4704
//float Port_Input1_N125 4708
//float Port_Input1_N126 4712
//float Port_Input2_N126 4716
//float Port_Input1_N020 4720
//float Port_Input1_N049 4724
//float Port_Input2_N014 4728
//float Port_Input1_N058 4732
//float Port_Input2_N058 4736
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTexture 32 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 33 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTexture 34 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 35 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTexture 36 0
//spec_const bool Tweak_N12 37 0
//spec_const bool Tweak_N130 38 0
//spec_const bool Tweak_N68 39 0
//spec_const bool Tweak_N75 40 0
//spec_const bool Tweak_N76 41 0
//spec_const bool Tweak_N87 42 0
//spec_const bool Tweak_N89 43 0
//spec_const bool UseViewSpaceDepthVariant 44 1
//spec_const bool animated 45 0
//spec_const bool intensityTextureHasSwappedViews 46 0
//spec_const bool opacityTextureHasSwappedViews 47 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 48 0
//spec_const bool sc_BlendMode_Add 49 0
//spec_const bool sc_BlendMode_AlphaTest 50 0
//spec_const bool sc_BlendMode_AlphaToCoverage 51 0
//spec_const bool sc_BlendMode_ColoredGlass 52 0
//spec_const bool sc_BlendMode_Custom 53 0
//spec_const bool sc_BlendMode_Max 54 0
//spec_const bool sc_BlendMode_Min 55 0
//spec_const bool sc_BlendMode_MultiplyOriginal 56 0
//spec_const bool sc_BlendMode_Multiply 57 0
//spec_const bool sc_BlendMode_Normal 58 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 59 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 60 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 61 0
//spec_const bool sc_BlendMode_Screen 62 0
//spec_const bool sc_DepthOnly 63 0
//spec_const bool sc_FramebufferFetch 64 0
//spec_const bool sc_MotionVectorsPass 65 0
//spec_const bool sc_OITCompositingPass 66 0
//spec_const bool sc_OITDepthBoundsPass 67 0
//spec_const bool sc_OITDepthGatherPass 68 0
//spec_const bool sc_ProjectiveShadowsCaster 69 0
//spec_const bool sc_ProjectiveShadowsReceiver 70 0
//spec_const bool sc_RenderAlphaToColor 71 0
//spec_const bool sc_ScreenTextureHasSwappedViews 72 0
//spec_const bool sc_ShaderComplexityAnalyzer 73 0
//spec_const bool sc_TAAEnabled 74 0
//spec_const bool sc_UseFramebufferFetchMarker 75 0
//spec_const bool sc_VertexBlendingUseNormals 76 0
//spec_const bool sc_VertexBlending 77 0
//spec_const int SC_DEVICE_CLASS 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 79 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTexture 80 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 81 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTexture 82 -1
//spec_const int intensityTextureLayout 83 0
//spec_const int opacityTextureLayout 84 0
//spec_const int sc_DepthBufferMode 85 0
//spec_const int sc_RenderingSpace 86 -1
//spec_const int sc_ScreenTextureLayout 87 0
//spec_const int sc_ShaderCacheConstant 88 0
//spec_const int sc_SkinBonesCount 89 0
//spec_const int sc_StereoRenderingMode 90 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 91 0
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
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTexture) ? SC_USE_CLAMP_TO_BORDER_opacityTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(33)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_opacityTexture [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_opacityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTexture) ? SC_USE_UV_MIN_MAX_opacityTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(35)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_opacityTexture [[function_constant(36)]];
constant bool SC_USE_UV_TRANSFORM_opacityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTexture) ? SC_USE_UV_TRANSFORM_opacityTexture : false;
constant bool Tweak_N12 [[function_constant(37)]];
constant bool Tweak_N12_tmp = is_function_constant_defined(Tweak_N12) ? Tweak_N12 : false;
constant bool Tweak_N130 [[function_constant(38)]];
constant bool Tweak_N130_tmp = is_function_constant_defined(Tweak_N130) ? Tweak_N130 : false;
constant bool Tweak_N68 [[function_constant(39)]];
constant bool Tweak_N68_tmp = is_function_constant_defined(Tweak_N68) ? Tweak_N68 : false;
constant bool Tweak_N75 [[function_constant(40)]];
constant bool Tweak_N75_tmp = is_function_constant_defined(Tweak_N75) ? Tweak_N75 : false;
constant bool Tweak_N76 [[function_constant(41)]];
constant bool Tweak_N76_tmp = is_function_constant_defined(Tweak_N76) ? Tweak_N76 : false;
constant bool Tweak_N87 [[function_constant(42)]];
constant bool Tweak_N87_tmp = is_function_constant_defined(Tweak_N87) ? Tweak_N87 : false;
constant bool Tweak_N89 [[function_constant(43)]];
constant bool Tweak_N89_tmp = is_function_constant_defined(Tweak_N89) ? Tweak_N89 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(44)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool animated [[function_constant(45)]];
constant bool animated_tmp = is_function_constant_defined(animated) ? animated : false;
constant bool intensityTextureHasSwappedViews [[function_constant(46)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool opacityTextureHasSwappedViews [[function_constant(47)]];
constant bool opacityTextureHasSwappedViews_tmp = is_function_constant_defined(opacityTextureHasSwappedViews) ? opacityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(48)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(49)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(50)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(51)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(52)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(53)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(54)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(55)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(56)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(57)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(58)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(59)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(60)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(61)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(62)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(63)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(64)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(65)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(66)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(67)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(68)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(69)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(70)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(71)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(72)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(73)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_TAAEnabled [[function_constant(74)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(75)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(76)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(77)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_DEVICE_CLASS [[function_constant(78)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(79)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTexture [[function_constant(80)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTexture) ? SC_SOFTWARE_WRAP_MODE_U_opacityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(81)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTexture [[function_constant(82)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTexture) ? SC_SOFTWARE_WRAP_MODE_V_opacityTexture : -1;
constant int intensityTextureLayout [[function_constant(83)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int opacityTextureLayout [[function_constant(84)]];
constant int opacityTextureLayout_tmp = is_function_constant_defined(opacityTextureLayout) ? opacityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(85)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(86)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(87)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(88)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(89)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(90)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(91)]];
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_WorldSpace;
float3 VertexNormal_ObjectSpace;
float2 gTriplanarCoords;
float3 SurfacePosition_WorldSpace;
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
float glitchFrequency;
float glitchSpeed;
float glitchOffset;
float glitchIntensity;
float glitchScale;
float thickLines;
float scanlineSpeed;
float Offset;
float randScale;
float4 thicklinesColor;
float thinLines;
float4 thinlinesColor;
float4 rimTint;
float4 opacityTextureSize;
float4 opacityTextureDims;
float4 opacityTextureView;
float3x3 opacityTextureTransform;
float4 opacityTextureUvMinMax;
float4 opacityTextureBorderColor;
float Port_Import_N050;
float Port_RangeMinA_N034;
float Port_RangeMaxA_N034;
float Port_RangeMinB_N034;
float Port_RangeMaxB_N034;
float Port_RangeMinA_N002;
float Port_RangeMaxA_N002;
float Port_RangeMinB_N002;
float Port_RangeMaxB_N002;
float Port_RangeMinA_N103;
float Port_RangeMaxA_N103;
float Port_RangeMinB_N103;
float Port_RangeMaxB_N103;
float Port_Import_N028;
float Port_Input1_N055;
float Port_Input1_N056;
float Port_Input1_N066;
float Port_Import_N093;
float Port_Import_N198;
float Port_Import_N203;
float Port_Import_N038;
float3 Port_Import_N179;
float Port_Input0_N009;
float3 Port_Import_N180;
float Port_Import_N181;
float Port_Input1_N182;
float Port_Input2_N182;
float3 Port_Import_N167;
float Port_Import_N174;
float2 Port_Scale_N164;
float Port_Input1_N140;
float Port_Input1_N141;
float Port_Input2_N110;
float Port_Input1_N117;
float Port_RangeMinA_N063;
float Port_RangeMaxA_N063;
float Port_RangeMinB_N063;
float Port_RangeMaxB_N063;
float Port_RangeMinA_N067;
float Port_RangeMaxA_N067;
float Port_RangeMinB_N067;
float Port_RangeMaxB_N067;
float Port_Input1_N078;
float Port_Input0_N129;
float3 Port_Import_N070;
float3 Port_Import_N069;
float Port_Import_N071;
float Port_Input1_N072;
float Port_Input2_N072;
float3 Port_Import_N094;
float Port_Import_N106;
float2 Port_Scale_N041;
float Port_Input1_N122;
float Port_Input1_N125;
float Port_Input1_N126;
float Port_Input2_N126;
float Port_Input1_N020;
float Port_Input1_N049;
float Port_Input2_N014;
float Port_Input1_N058;
float Port_Input2_N058;
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
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> opacityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler intensityTextureSmpSC [[id(17)]];
sampler opacityTextureSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
constant userUniformsObj* UserUniforms [[id(26)]];
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
float snoise(thread const float2& v)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 i=floor(v+float2(dot(v,float2(0.36602542))));
float2 x0=(v-i)+float2(dot(i,float2(0.21132487)));
float2 i1=float2(0.0);
bool2 l9_0=bool2(x0.x>x0.y);
i1=float2(l9_0.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_0.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float2 x1=(x0+float2(0.21132487))-i1;
float2 x2=x0+float2(-0.57735026);
float2 param=i;
float2 l9_1=param-(floor(param*0.0034602077)*289.0);
i=l9_1;
float3 param_1=float3(i.y)+float3(0.0,i1.y,1.0);
float3 l9_2=((param_1*34.0)+float3(1.0))*param_1;
float3 l9_3=l9_2-(floor(l9_2*0.0034602077)*289.0);
float3 l9_4=l9_3;
float3 param_2=(l9_4+float3(i.x))+float3(0.0,i1.x,1.0);
float3 l9_5=((param_2*34.0)+float3(1.0))*param_2;
float3 l9_6=l9_5-(floor(l9_5*0.0034602077)*289.0);
float3 l9_7=l9_6;
float3 p=l9_7;
float3 m=fast::max(float3(0.5)-float3(dot(x0,x0),dot(x1,x1),dot(x2,x2)),float3(0.0));
m*=m;
m*=m;
float3 x=(fract(p*float3(0.024390243))*2.0)-float3(1.0);
float3 h=abs(x)-float3(0.5);
float3 ox=floor(x+float3(0.5));
float3 a0=x-ox;
m*=(float3(1.7928429)-(((a0*a0)+(h*h))*0.85373473));
float3 g=float3(0.0);
g.x=(a0.x*x0.x)+(h.x*x0.y);
float2 l9_8=(a0.yz*float2(x1.x,x2.x))+(h.yz*float2(x1.y,x2.y));
g=float3(g.x,l9_8.x,l9_8.y);
return 130.0*dot(m,g);
}
else
{
return 0.0;
}
}
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
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPos,1.0)).xyz;
Globals.VertexNormal_WorldSpace=out.varNormal;
Globals.VertexNormal_ObjectSpace=normalize(((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexNormal_WorldSpace,0.0)).xyz);
Globals.gTriplanarCoords=float2(0.0);
Globals.SurfacePosition_WorldSpace=out.varPos;
int l9_119=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_119=0;
}
else
{
l9_119=gl_InstanceIndex%2;
}
int l9_120=l9_119;
float4 Result=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_120]*float4(out.varPos,1.0);
float3 l9_121=Result.xyz/float3(Result.w);
Result=float4(l9_121.x,l9_121.y,l9_121.z,Result.w);
Globals.gScreenCoord=(Result.xy*0.5)+float2(0.5);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float3 Result_N40=float3(0.0);
float3 param_1=float3(0.0);
float3 param_2=float3(0.0);
float3 param_3=float3(0.0);
ssGlobals param_5=Globals;
float3 param_4;
if ((int(Tweak_N75_tmp)!=0)&&(int(Tweak_N76_tmp)!=0))
{
float3 l9_122=float3(0.0);
float l9_123=0.0;
float3 l9_124=float3(1.0);
float3 l9_125=float3(0.0);
ssGlobals l9_126=param_5;
float l9_127=0.0;
float l9_128=(*sc_set0.UserUniforms).glitchFrequency;
l9_127=l9_128;
float l9_129=0.0;
l9_129=l9_127;
float l9_130=0.0;
l9_130=(((l9_129-(*sc_set0.UserUniforms).Port_RangeMinA_N034)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N034-(*sc_set0.UserUniforms).Port_RangeMinA_N034)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N034-(*sc_set0.UserUniforms).Port_RangeMinB_N034))+(*sc_set0.UserUniforms).Port_RangeMinB_N034;
float l9_131=0.0;
float l9_132=0.0;
float l9_133=0.0;
ssGlobals l9_134=l9_126;
float l9_135;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_136=0.0;
float l9_137=(*sc_set0.UserUniforms).glitchSpeed;
l9_136=l9_137;
float l9_138=0.0;
l9_138=(((l9_136-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_139=0.0;
l9_139=l9_134.gTimeElapsed*l9_138;
float l9_140=0.0;
float l9_141=(*sc_set0.UserUniforms).glitchOffset;
l9_140=l9_141;
float l9_142=0.0;
l9_142=(((l9_140-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_143=0.0;
l9_143=l9_139+l9_142;
l9_132=l9_143;
l9_135=l9_132;
}
else
{
float l9_144=0.0;
float l9_145=(*sc_set0.UserUniforms).glitchOffset;
l9_144=l9_145;
float l9_146=0.0;
l9_146=(((l9_144-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_133=l9_146;
l9_135=l9_133;
}
l9_131=l9_135;
float l9_147=0.0;
l9_147=l9_131;
float l9_148=0.0;
l9_148=l9_130*l9_147;
float l9_149=0.0;
l9_149=fract(l9_148);
float l9_150=0.0;
l9_150=float(l9_149<(*sc_set0.UserUniforms).Port_Input1_N055);
float l9_151=0.0;
l9_151=l9_148*(*sc_set0.UserUniforms).Port_Input1_N056;
float l9_152=0.0;
l9_152=fract(l9_151);
float l9_153=0.0;
l9_153=float(l9_152<(*sc_set0.UserUniforms).Port_Input1_N066);
float l9_154=0.0;
l9_154=l9_150+l9_153;
l9_123=l9_154;
float3 l9_155;
if ((l9_123*1.0)!=0.0)
{
float l9_156=0.0;
float l9_157=0.0;
float l9_158=0.0;
ssGlobals l9_159=l9_126;
float l9_160;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_161=0.0;
float l9_162=(*sc_set0.UserUniforms).glitchSpeed;
l9_161=l9_162;
float l9_163=0.0;
l9_163=(((l9_161-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_164=0.0;
l9_164=l9_159.gTimeElapsed*l9_163;
float l9_165=0.0;
float l9_166=(*sc_set0.UserUniforms).glitchOffset;
l9_165=l9_166;
float l9_167=0.0;
l9_167=(((l9_165-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_168=0.0;
l9_168=l9_164+l9_167;
l9_157=l9_168;
l9_160=l9_157;
}
else
{
float l9_169=0.0;
float l9_170=(*sc_set0.UserUniforms).glitchOffset;
l9_169=l9_170;
float l9_171=0.0;
l9_171=(((l9_169-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_158=l9_171;
l9_160=l9_158;
}
l9_156=l9_160;
float l9_172=0.0;
l9_172=l9_156;
float3 l9_173=float3(0.0);
l9_173=l9_126.SurfacePosition_ObjectSpace;
float l9_174=0.0;
float l9_175=(*sc_set0.UserUniforms).glitchIntensity;
l9_174=l9_175;
float l9_176=0.0;
l9_176=fast::min(l9_174,30.0);
float l9_177=0.0;
l9_177=l9_176;
float3 l9_178=float3(0.0);
l9_178=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_179=float3(0.0);
l9_179=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_180=float3(0.0);
l9_180=l9_178-l9_179;
float l9_181=0.0;
l9_181=length(l9_180);
float l9_182=0.0;
l9_182=(*sc_set0.UserUniforms).Port_Import_N203;
float l9_183=0.0;
l9_183=(l9_177*l9_181)*l9_182;
float l9_184=0.0;
l9_184=l9_183;
float l9_185=0.0;
float l9_186=0.0;
float3 l9_187=float3(0.0);
float3 l9_188=float3(0.0,1.0,0.0);
float3 l9_189=float3(1.0);
float3 l9_190=float3(0.0);
float l9_191=1.0;
ssGlobals l9_192=l9_126;
float l9_193=0.0;
float l9_194=(*sc_set0.UserUniforms).glitchScale;
l9_193=l9_194;
float l9_195=0.0;
l9_195=fast::clamp(l9_193,0.0,1.0);
float3 l9_196=float3(0.0);
l9_196=float3(l9_195);
l9_189=l9_196;
float l9_197=0.0;
float l9_198=0.0;
float l9_199=0.0;
ssGlobals l9_200=l9_192;
float l9_201;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_202=0.0;
float l9_203=(*sc_set0.UserUniforms).glitchSpeed;
l9_202=l9_203;
float l9_204=0.0;
l9_204=(((l9_202-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_205=0.0;
l9_205=l9_200.gTimeElapsed*l9_204;
float l9_206=0.0;
float l9_207=(*sc_set0.UserUniforms).glitchOffset;
l9_206=l9_207;
float l9_208=0.0;
l9_208=(((l9_206-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_209=0.0;
l9_209=l9_205+l9_208;
l9_198=l9_209;
l9_201=l9_198;
}
else
{
float l9_210=0.0;
float l9_211=(*sc_set0.UserUniforms).glitchOffset;
l9_210=l9_211;
float l9_212=0.0;
l9_212=(((l9_210-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_199=l9_212;
l9_201=l9_199;
}
l9_197=l9_201;
float l9_213=0.0;
l9_213=l9_197;
float l9_214=0.0;
l9_214=(*sc_set0.UserUniforms).Port_Input0_N009*l9_213;
float3 l9_215=float3(0.0);
l9_215=float3(l9_214);
l9_190=l9_215;
float l9_216=0.0;
l9_216=(*sc_set0.UserUniforms).Port_Import_N181;
float l9_217=0.0;
l9_217=fast::clamp(l9_216+0.001,(*sc_set0.UserUniforms).Port_Input1_N182+0.001,(*sc_set0.UserUniforms).Port_Input2_N182+0.001)-0.001;
l9_191=l9_217;
float3 l9_218=float3(0.0);
l9_218=l9_192.SurfacePosition_ObjectSpace;
float3 l9_219=float3(0.0);
l9_219=l9_218;
float3 l9_220=float3(0.0);
l9_220=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_221=float3(0.0);
l9_221=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_222=float3(0.0);
l9_222=l9_220-l9_221;
float l9_223=0.0;
l9_223=length(l9_222);
float3 l9_224=float3(0.0);
l9_224=l9_219/(float3(l9_223)+float3(1.234e-06));
float3 l9_225=float3(0.0);
l9_225=l9_224;
float l9_226=0.0;
l9_226=fast::max((*sc_set0.UserUniforms).Port_Import_N174,0.0);
float3 l9_227=float3(0.0);
l9_227=l9_225*float3(l9_226);
l9_187=l9_227;
float3 l9_228=float3(0.0);
l9_228=l9_192.VertexNormal_ObjectSpace;
l9_188=l9_228;
float3 l9_229=l9_187;
float3 l9_230=l9_188;
l9_229+=l9_190;
l9_229*=l9_189;
l9_230=abs(l9_230);
float l9_231=l9_230.x;
float l9_232=l9_230.y;
bool l9_233=l9_231>l9_232;
bool l9_234;
if (l9_233)
{
l9_234=l9_230.x>l9_230.z;
}
else
{
l9_234=l9_233;
}
int3 l9_235;
if (l9_234)
{
l9_235=int3(0,1,2);
}
else
{
bool3 l9_236=bool3(l9_230.y>l9_230.z);
l9_235=int3(l9_236.x ? int3(1,2,0).x : int3(2,0,1).x,l9_236.y ? int3(1,2,0).y : int3(2,0,1).y,l9_236.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_237=l9_235;
float l9_238=l9_230.x;
float l9_239=l9_230.y;
bool l9_240=l9_238<l9_239;
bool l9_241;
if (l9_240)
{
l9_241=l9_230.x<l9_230.z;
}
else
{
l9_241=l9_240;
}
int3 l9_242;
if (l9_241)
{
l9_242=int3(0,1,2);
}
else
{
bool3 l9_243=bool3(l9_230.y<l9_230.z);
l9_242=int3(l9_243.x ? int3(1,2,0).x : int3(2,0,1).x,l9_243.y ? int3(1,2,0).y : int3(2,0,1).y,l9_243.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_244=l9_242;
int3 l9_245=(int3(3)-l9_244)-l9_237;
l9_192.gTriplanarCoords=float2(l9_229[l9_237.y],l9_229[l9_237.z]);
float2 l9_246=float2(0.0);
l9_246=l9_192.gTriplanarCoords;
float l9_247=0.0;
float2 l9_248=l9_246;
float2 l9_249=(*sc_set0.UserUniforms).Port_Scale_N164;
l9_248.x=floor(l9_248.x*10000.0)*9.9999997e-05;
l9_248.y=floor(l9_248.y*10000.0)*9.9999997e-05;
l9_248*=(l9_249*0.5);
float2 l9_250=l9_248;
float l9_251=(snoise(l9_250)*0.5)+0.5;
l9_251=floor(l9_251*10000.0)*9.9999997e-05;
l9_247=l9_251;
l9_186=l9_247;
float l9_252=l9_186;
l9_192.gTriplanarCoords=float2(l9_229[l9_245.y],l9_229[l9_245.z]);
float2 l9_253=float2(0.0);
l9_253=l9_192.gTriplanarCoords;
float l9_254=0.0;
float2 l9_255=l9_253;
float2 l9_256=(*sc_set0.UserUniforms).Port_Scale_N164;
l9_255.x=floor(l9_255.x*10000.0)*9.9999997e-05;
l9_255.y=floor(l9_255.y*10000.0)*9.9999997e-05;
l9_255*=(l9_256*0.5);
float2 l9_257=l9_255;
float l9_258=(snoise(l9_257)*0.5)+0.5;
l9_258=floor(l9_258*10000.0)*9.9999997e-05;
l9_254=l9_258;
l9_186=l9_254;
float l9_259=l9_186;
float2 l9_260=float2(l9_230[l9_237.x],l9_230[l9_245.x]);
l9_260=pow(l9_260,float2(1.0/(1.0-(l9_191*0.99000001))));
float l9_261=((l9_252*l9_260.x)+(l9_259*l9_260.y))/(l9_260.x+l9_260.y);
l9_185=l9_261;
float l9_262=0.0;
l9_262=l9_185;
float l9_263=0.0;
l9_263=l9_262*(*sc_set0.UserUniforms).Port_Input1_N140;
float l9_264=0.0;
float l9_265;
if (l9_263<=0.0)
{
l9_265=0.0;
}
else
{
l9_265=pow(l9_263,(*sc_set0.UserUniforms).Port_Input1_N141);
}
l9_264=l9_265;
float l9_266=0.0;
l9_266=(l9_184*l9_264)*(*sc_set0.UserUniforms).Port_Input2_N110;
float3 l9_267=float3(0.0);
l9_267=l9_126.VertexNormal_ObjectSpace;
float3 l9_268=float3(0.0);
l9_268=float3(l9_266)*l9_267;
float3 l9_269=float3(0.0);
l9_269=l9_173-l9_268;
float3 l9_270=float3(0.0);
l9_270=float3(l9_269.x,l9_173.y,l9_269.z);
float l9_271=0.0;
float l9_272=0.0;
float l9_273=0.0;
float l9_274=0.0;
float4 l9_275=float4(l9_270,0.0);
float l9_276=l9_275.x;
float l9_277=l9_275.y;
float l9_278=l9_275.z;
float l9_279=l9_275.w;
l9_271=l9_276;
l9_272=l9_277;
l9_273=l9_278;
l9_274=l9_279;
float l9_280=0.0;
l9_280=l9_172*l9_272;
float l9_281=0.0;
l9_281=sin(l9_280);
float l9_282=0.0;
l9_282=l9_184/((*sc_set0.UserUniforms).Port_Input1_N117+1.234e-06);
float l9_283=0.0;
l9_283=l9_281*l9_282;
float l9_284=0.0;
l9_284=l9_283+l9_271;
float4 l9_285=float4(0.0);
l9_285.x=l9_284;
l9_285.y=l9_272;
l9_285.z=l9_273;
l9_285.w=l9_274;
l9_124=l9_285.xyz;
l9_155=l9_124;
}
else
{
float3 l9_286=float3(0.0);
l9_286=l9_126.SurfacePosition_ObjectSpace;
l9_125=l9_286;
l9_155=l9_125;
}
l9_122=l9_155;
float3 l9_287=float3(0.0);
l9_287=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(l9_122,1.0)).xyz;
float3 l9_288=float3(0.0);
l9_288=l9_287;
float3 l9_289=float3(0.0);
l9_289=param_5.SurfacePosition_WorldSpace;
float l9_290=0.0;
float l9_291=1.0;
float l9_292=0.0;
ssGlobals l9_293=param_5;
float l9_294;
if ((int(Tweak_N130_tmp)!=0))
{
float l9_295=0.0;
float l9_296=(*sc_set0.UserUniforms).thickLines;
l9_295=l9_296;
float l9_297=0.0;
float l9_298=0.0;
float l9_299=0.0;
ssGlobals l9_300=l9_293;
float l9_301;
if ((int(animated_tmp)!=0))
{
float l9_302=0.0;
float l9_303=1.0;
float l9_304=0.0;
float l9_305;
if ((int(Tweak_N68_tmp)!=0))
{
float l9_306=0.0;
float l9_307=(*sc_set0.UserUniforms).scanlineSpeed;
l9_306=l9_307;
float l9_308=0.0;
l9_308=(((l9_306-(*sc_set0.UserUniforms).Port_RangeMinA_N063)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N063-(*sc_set0.UserUniforms).Port_RangeMinA_N063)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N063-(*sc_set0.UserUniforms).Port_RangeMinB_N063))+(*sc_set0.UserUniforms).Port_RangeMinB_N063;
float l9_309=0.0;
l9_309=1.0-l9_308;
l9_303=l9_309;
l9_305=l9_303;
}
else
{
float l9_310=0.0;
float l9_311=(*sc_set0.UserUniforms).scanlineSpeed;
l9_310=l9_311;
float l9_312=0.0;
l9_312=(((l9_310-(*sc_set0.UserUniforms).Port_RangeMinA_N063)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N063-(*sc_set0.UserUniforms).Port_RangeMinA_N063)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N063-(*sc_set0.UserUniforms).Port_RangeMinB_N063))+(*sc_set0.UserUniforms).Port_RangeMinB_N063;
l9_304=l9_312;
l9_305=l9_304;
}
l9_302=l9_305;
float l9_313=0.0;
l9_313=l9_300.gTimeElapsed*l9_302;
float l9_314=0.0;
float l9_315=(*sc_set0.UserUniforms).Offset;
l9_314=l9_315;
float l9_316=0.0;
l9_316=(((l9_314-(*sc_set0.UserUniforms).Port_RangeMinA_N067)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N067-(*sc_set0.UserUniforms).Port_RangeMinA_N067)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N067-(*sc_set0.UserUniforms).Port_RangeMinB_N067))+(*sc_set0.UserUniforms).Port_RangeMinB_N067;
float l9_317=0.0;
l9_317=l9_313+l9_316;
l9_298=l9_317;
l9_301=l9_298;
}
else
{
float l9_318=0.0;
float l9_319=(*sc_set0.UserUniforms).Offset;
l9_318=l9_319;
float l9_320=0.0;
l9_320=(((l9_318-(*sc_set0.UserUniforms).Port_RangeMinA_N067)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N067-(*sc_set0.UserUniforms).Port_RangeMinA_N067)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N067-(*sc_set0.UserUniforms).Port_RangeMinB_N067))+(*sc_set0.UserUniforms).Port_RangeMinB_N067;
l9_299=l9_320;
l9_301=l9_299;
}
l9_297=l9_301;
float2 l9_321=float2(0.0);
float2 l9_322=float2(1.0);
float2 l9_323=float2(0.0);
ssGlobals l9_324=l9_293;
float2 l9_325;
if ((int(Tweak_N89_tmp)!=0))
{
float2 l9_326=float2(0.0);
l9_326=l9_324.gScreenCoord;
float2 l9_327=float2(0.0);
l9_327=l9_326/(float2((*sc_set0.UserUniforms).Port_Input1_N078)+float2(1.234e-06));
l9_322=l9_327;
l9_325=l9_322;
}
else
{
float3 l9_328=float3(0.0);
l9_328=l9_324.SurfacePosition_ObjectSpace;
l9_323=l9_328.xy;
l9_325=l9_323;
}
l9_321=l9_325;
float l9_329=0.0;
l9_329=l9_321.y;
float l9_330=0.0;
l9_330=l9_297-l9_329;
float l9_331=0.0;
l9_331=l9_295*l9_330;
float l9_332=0.0;
l9_332=fract(l9_331);
float l9_333=0.0;
float l9_334=(*sc_set0.UserUniforms).randScale;
l9_333=l9_334;
float l9_335=0.0;
l9_335=(*sc_set0.UserUniforms).Port_Input0_N129-l9_333;
float l9_336=0.0;
l9_336=1.0-l9_335;
float l9_337=0.0;
l9_337=float(l9_332<l9_336);
float l9_338=0.0;
float l9_339=0.0;
float3 l9_340=float3(0.0);
float3 l9_341=float3(0.0,1.0,0.0);
float3 l9_342=float3(1.0);
float3 l9_343=float3(0.0);
float l9_344=1.0;
ssGlobals l9_345=l9_293;
float l9_346=0.0;
float l9_347=(*sc_set0.UserUniforms).randScale;
l9_346=l9_347;
float l9_348=0.0;
l9_348=(*sc_set0.UserUniforms).Port_Input0_N129-l9_346;
float3 l9_349=float3(0.0);
l9_349=float3(l9_348);
l9_342=l9_349;
float l9_350=0.0;
float l9_351=0.0;
float l9_352=0.0;
ssGlobals l9_353=l9_345;
float l9_354;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_355=0.0;
float l9_356=(*sc_set0.UserUniforms).glitchSpeed;
l9_355=l9_356;
float l9_357=0.0;
l9_357=(((l9_355-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_358=0.0;
l9_358=l9_353.gTimeElapsed*l9_357;
float l9_359=0.0;
float l9_360=(*sc_set0.UserUniforms).glitchOffset;
l9_359=l9_360;
float l9_361=0.0;
l9_361=(((l9_359-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_362=0.0;
l9_362=l9_358+l9_361;
l9_351=l9_362;
l9_354=l9_351;
}
else
{
float l9_363=0.0;
float l9_364=(*sc_set0.UserUniforms).glitchOffset;
l9_363=l9_364;
float l9_365=0.0;
l9_365=(((l9_363-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_352=l9_365;
l9_354=l9_352;
}
l9_350=l9_354;
float3 l9_366=float3(0.0);
l9_366=float3(l9_350);
l9_343=l9_366;
float l9_367=0.0;
l9_367=(*sc_set0.UserUniforms).Port_Import_N071;
float l9_368=0.0;
l9_368=fast::clamp(l9_367+0.001,(*sc_set0.UserUniforms).Port_Input1_N072+0.001,(*sc_set0.UserUniforms).Port_Input2_N072+0.001)-0.001;
l9_344=l9_368;
float3 l9_369=float3(0.0);
l9_369=l9_345.SurfacePosition_ObjectSpace;
float3 l9_370=float3(0.0);
l9_370=l9_369;
float3 l9_371=float3(0.0);
l9_371=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_372=float3(0.0);
l9_372=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_373=float3(0.0);
l9_373=l9_371-l9_372;
float l9_374=0.0;
l9_374=length(l9_373);
float3 l9_375=float3(0.0);
l9_375=l9_370/(float3(l9_374)+float3(1.234e-06));
float3 l9_376=float3(0.0);
l9_376=l9_375;
float l9_377=0.0;
l9_377=fast::max((*sc_set0.UserUniforms).Port_Import_N106,0.0);
float3 l9_378=float3(0.0);
l9_378=l9_376*float3(l9_377);
l9_340=l9_378;
float3 l9_379=float3(0.0);
l9_379=l9_345.VertexNormal_ObjectSpace;
l9_341=l9_379;
float3 l9_380=l9_340;
float3 l9_381=l9_341;
l9_380+=l9_343;
l9_380*=l9_342;
l9_381=abs(l9_381);
float l9_382=l9_381.x;
float l9_383=l9_381.y;
bool l9_384=l9_382>l9_383;
bool l9_385;
if (l9_384)
{
l9_385=l9_381.x>l9_381.z;
}
else
{
l9_385=l9_384;
}
int3 l9_386;
if (l9_385)
{
l9_386=int3(0,1,2);
}
else
{
bool3 l9_387=bool3(l9_381.y>l9_381.z);
l9_386=int3(l9_387.x ? int3(1,2,0).x : int3(2,0,1).x,l9_387.y ? int3(1,2,0).y : int3(2,0,1).y,l9_387.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_388=l9_386;
float l9_389=l9_381.x;
float l9_390=l9_381.y;
bool l9_391=l9_389<l9_390;
bool l9_392;
if (l9_391)
{
l9_392=l9_381.x<l9_381.z;
}
else
{
l9_392=l9_391;
}
int3 l9_393;
if (l9_392)
{
l9_393=int3(0,1,2);
}
else
{
bool3 l9_394=bool3(l9_381.y<l9_381.z);
l9_393=int3(l9_394.x ? int3(1,2,0).x : int3(2,0,1).x,l9_394.y ? int3(1,2,0).y : int3(2,0,1).y,l9_394.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_395=l9_393;
int3 l9_396=(int3(3)-l9_395)-l9_388;
l9_345.gTriplanarCoords=float2(l9_380[l9_388.y],l9_380[l9_388.z]);
float2 l9_397=float2(0.0);
l9_397=l9_345.gTriplanarCoords;
float l9_398=0.0;
float2 l9_399=l9_397;
float2 l9_400=(*sc_set0.UserUniforms).Port_Scale_N041;
l9_399.x=floor(l9_399.x*10000.0)*9.9999997e-05;
l9_399.y=floor(l9_399.y*10000.0)*9.9999997e-05;
l9_399*=(l9_400*0.5);
float2 l9_401=l9_399;
float l9_402=(snoise(l9_401)*0.5)+0.5;
l9_402=floor(l9_402*10000.0)*9.9999997e-05;
l9_398=l9_402;
l9_339=l9_398;
float l9_403=l9_339;
l9_345.gTriplanarCoords=float2(l9_380[l9_396.y],l9_380[l9_396.z]);
float2 l9_404=float2(0.0);
l9_404=l9_345.gTriplanarCoords;
float l9_405=0.0;
float2 l9_406=l9_404;
float2 l9_407=(*sc_set0.UserUniforms).Port_Scale_N041;
l9_406.x=floor(l9_406.x*10000.0)*9.9999997e-05;
l9_406.y=floor(l9_406.y*10000.0)*9.9999997e-05;
l9_406*=(l9_407*0.5);
float2 l9_408=l9_406;
float l9_409=(snoise(l9_408)*0.5)+0.5;
l9_409=floor(l9_409*10000.0)*9.9999997e-05;
l9_405=l9_409;
l9_339=l9_405;
float l9_410=l9_339;
float2 l9_411=float2(l9_381[l9_388.x],l9_381[l9_396.x]);
l9_411=pow(l9_411,float2(1.0/(1.0-(l9_344*0.99000001))));
float l9_412=((l9_403*l9_411.x)+(l9_410*l9_411.y))/(l9_411.x+l9_411.y);
l9_338=l9_412;
float l9_413=0.0;
l9_413=l9_338;
float l9_414=0.0;
l9_414=l9_413*(*sc_set0.UserUniforms).Port_Input1_N122;
float l9_415=0.0;
float l9_416;
if (l9_414<=0.0)
{
l9_416=0.0;
}
else
{
l9_416=pow(l9_414,(*sc_set0.UserUniforms).Port_Input1_N125);
}
l9_415=l9_416;
float l9_417=0.0;
l9_417=l9_337*l9_415;
float l9_418=0.0;
l9_418=fast::clamp(l9_417+0.001,(*sc_set0.UserUniforms).Port_Input1_N126+0.001,(*sc_set0.UserUniforms).Port_Input2_N126+0.001)-0.001;
l9_291=l9_418;
l9_294=l9_291;
}
else
{
float l9_419=0.0;
float l9_420=(*sc_set0.UserUniforms).thickLines;
l9_419=l9_420;
float l9_421=0.0;
float l9_422=0.0;
float l9_423=0.0;
ssGlobals l9_424=l9_293;
float l9_425;
if ((int(animated_tmp)!=0))
{
float l9_426=0.0;
float l9_427=1.0;
float l9_428=0.0;
float l9_429;
if ((int(Tweak_N68_tmp)!=0))
{
float l9_430=0.0;
float l9_431=(*sc_set0.UserUniforms).scanlineSpeed;
l9_430=l9_431;
float l9_432=0.0;
l9_432=(((l9_430-(*sc_set0.UserUniforms).Port_RangeMinA_N063)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N063-(*sc_set0.UserUniforms).Port_RangeMinA_N063)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N063-(*sc_set0.UserUniforms).Port_RangeMinB_N063))+(*sc_set0.UserUniforms).Port_RangeMinB_N063;
float l9_433=0.0;
l9_433=1.0-l9_432;
l9_427=l9_433;
l9_429=l9_427;
}
else
{
float l9_434=0.0;
float l9_435=(*sc_set0.UserUniforms).scanlineSpeed;
l9_434=l9_435;
float l9_436=0.0;
l9_436=(((l9_434-(*sc_set0.UserUniforms).Port_RangeMinA_N063)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N063-(*sc_set0.UserUniforms).Port_RangeMinA_N063)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N063-(*sc_set0.UserUniforms).Port_RangeMinB_N063))+(*sc_set0.UserUniforms).Port_RangeMinB_N063;
l9_428=l9_436;
l9_429=l9_428;
}
l9_426=l9_429;
float l9_437=0.0;
l9_437=l9_424.gTimeElapsed*l9_426;
float l9_438=0.0;
float l9_439=(*sc_set0.UserUniforms).Offset;
l9_438=l9_439;
float l9_440=0.0;
l9_440=(((l9_438-(*sc_set0.UserUniforms).Port_RangeMinA_N067)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N067-(*sc_set0.UserUniforms).Port_RangeMinA_N067)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N067-(*sc_set0.UserUniforms).Port_RangeMinB_N067))+(*sc_set0.UserUniforms).Port_RangeMinB_N067;
float l9_441=0.0;
l9_441=l9_437+l9_440;
l9_422=l9_441;
l9_425=l9_422;
}
else
{
float l9_442=0.0;
float l9_443=(*sc_set0.UserUniforms).Offset;
l9_442=l9_443;
float l9_444=0.0;
l9_444=(((l9_442-(*sc_set0.UserUniforms).Port_RangeMinA_N067)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N067-(*sc_set0.UserUniforms).Port_RangeMinA_N067)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N067-(*sc_set0.UserUniforms).Port_RangeMinB_N067))+(*sc_set0.UserUniforms).Port_RangeMinB_N067;
l9_423=l9_444;
l9_425=l9_423;
}
l9_421=l9_425;
float2 l9_445=float2(0.0);
float2 l9_446=float2(1.0);
float2 l9_447=float2(0.0);
ssGlobals l9_448=l9_293;
float2 l9_449;
if ((int(Tweak_N89_tmp)!=0))
{
float2 l9_450=float2(0.0);
l9_450=l9_448.gScreenCoord;
float2 l9_451=float2(0.0);
l9_451=l9_450/(float2((*sc_set0.UserUniforms).Port_Input1_N078)+float2(1.234e-06));
l9_446=l9_451;
l9_449=l9_446;
}
else
{
float3 l9_452=float3(0.0);
l9_452=l9_448.SurfacePosition_ObjectSpace;
l9_447=l9_452.xy;
l9_449=l9_447;
}
l9_445=l9_449;
float l9_453=0.0;
l9_453=l9_445.y;
float l9_454=0.0;
l9_454=l9_421-l9_453;
float l9_455=0.0;
l9_455=l9_419*l9_454;
float l9_456=0.0;
l9_456=fract(l9_455);
float l9_457=0.0;
float l9_458=(*sc_set0.UserUniforms).randScale;
l9_457=l9_458;
float l9_459=0.0;
l9_459=(*sc_set0.UserUniforms).Port_Input0_N129-l9_457;
float l9_460=0.0;
l9_460=1.0-l9_459;
float l9_461=0.0;
l9_461=float(l9_456<l9_460);
float l9_462=0.0;
float l9_463=0.0;
float3 l9_464=float3(0.0);
float3 l9_465=float3(0.0,1.0,0.0);
float3 l9_466=float3(1.0);
float3 l9_467=float3(0.0);
float l9_468=1.0;
ssGlobals l9_469=l9_293;
float l9_470=0.0;
float l9_471=(*sc_set0.UserUniforms).randScale;
l9_470=l9_471;
float l9_472=0.0;
l9_472=(*sc_set0.UserUniforms).Port_Input0_N129-l9_470;
float3 l9_473=float3(0.0);
l9_473=float3(l9_472);
l9_466=l9_473;
float l9_474=0.0;
float l9_475=0.0;
float l9_476=0.0;
ssGlobals l9_477=l9_469;
float l9_478;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_479=0.0;
float l9_480=(*sc_set0.UserUniforms).glitchSpeed;
l9_479=l9_480;
float l9_481=0.0;
l9_481=(((l9_479-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_482=0.0;
l9_482=l9_477.gTimeElapsed*l9_481;
float l9_483=0.0;
float l9_484=(*sc_set0.UserUniforms).glitchOffset;
l9_483=l9_484;
float l9_485=0.0;
l9_485=(((l9_483-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_486=0.0;
l9_486=l9_482+l9_485;
l9_475=l9_486;
l9_478=l9_475;
}
else
{
float l9_487=0.0;
float l9_488=(*sc_set0.UserUniforms).glitchOffset;
l9_487=l9_488;
float l9_489=0.0;
l9_489=(((l9_487-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_476=l9_489;
l9_478=l9_476;
}
l9_474=l9_478;
float3 l9_490=float3(0.0);
l9_490=float3(l9_474);
l9_467=l9_490;
float l9_491=0.0;
l9_491=(*sc_set0.UserUniforms).Port_Import_N071;
float l9_492=0.0;
l9_492=fast::clamp(l9_491+0.001,(*sc_set0.UserUniforms).Port_Input1_N072+0.001,(*sc_set0.UserUniforms).Port_Input2_N072+0.001)-0.001;
l9_468=l9_492;
float3 l9_493=float3(0.0);
l9_493=l9_469.SurfacePosition_ObjectSpace;
float3 l9_494=float3(0.0);
l9_494=l9_493;
float3 l9_495=float3(0.0);
l9_495=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_496=float3(0.0);
l9_496=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_497=float3(0.0);
l9_497=l9_495-l9_496;
float l9_498=0.0;
l9_498=length(l9_497);
float3 l9_499=float3(0.0);
l9_499=l9_494/(float3(l9_498)+float3(1.234e-06));
float3 l9_500=float3(0.0);
l9_500=l9_499;
float l9_501=0.0;
l9_501=fast::max((*sc_set0.UserUniforms).Port_Import_N106,0.0);
float3 l9_502=float3(0.0);
l9_502=l9_500*float3(l9_501);
l9_464=l9_502;
float3 l9_503=float3(0.0);
l9_503=l9_469.VertexNormal_ObjectSpace;
l9_465=l9_503;
float3 l9_504=l9_464;
float3 l9_505=l9_465;
l9_504+=l9_467;
l9_504*=l9_466;
l9_505=abs(l9_505);
float l9_506=l9_505.x;
float l9_507=l9_505.y;
bool l9_508=l9_506>l9_507;
bool l9_509;
if (l9_508)
{
l9_509=l9_505.x>l9_505.z;
}
else
{
l9_509=l9_508;
}
int3 l9_510;
if (l9_509)
{
l9_510=int3(0,1,2);
}
else
{
bool3 l9_511=bool3(l9_505.y>l9_505.z);
l9_510=int3(l9_511.x ? int3(1,2,0).x : int3(2,0,1).x,l9_511.y ? int3(1,2,0).y : int3(2,0,1).y,l9_511.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_512=l9_510;
float l9_513=l9_505.x;
float l9_514=l9_505.y;
bool l9_515=l9_513<l9_514;
bool l9_516;
if (l9_515)
{
l9_516=l9_505.x<l9_505.z;
}
else
{
l9_516=l9_515;
}
int3 l9_517;
if (l9_516)
{
l9_517=int3(0,1,2);
}
else
{
bool3 l9_518=bool3(l9_505.y<l9_505.z);
l9_517=int3(l9_518.x ? int3(1,2,0).x : int3(2,0,1).x,l9_518.y ? int3(1,2,0).y : int3(2,0,1).y,l9_518.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_519=l9_517;
int3 l9_520=(int3(3)-l9_519)-l9_512;
l9_469.gTriplanarCoords=float2(l9_504[l9_512.y],l9_504[l9_512.z]);
float2 l9_521=float2(0.0);
l9_521=l9_469.gTriplanarCoords;
float l9_522=0.0;
float2 l9_523=l9_521;
float2 l9_524=(*sc_set0.UserUniforms).Port_Scale_N041;
l9_523.x=floor(l9_523.x*10000.0)*9.9999997e-05;
l9_523.y=floor(l9_523.y*10000.0)*9.9999997e-05;
l9_523*=(l9_524*0.5);
float2 l9_525=l9_523;
float l9_526=(snoise(l9_525)*0.5)+0.5;
l9_526=floor(l9_526*10000.0)*9.9999997e-05;
l9_522=l9_526;
l9_463=l9_522;
float l9_527=l9_463;
l9_469.gTriplanarCoords=float2(l9_504[l9_520.y],l9_504[l9_520.z]);
float2 l9_528=float2(0.0);
l9_528=l9_469.gTriplanarCoords;
float l9_529=0.0;
float2 l9_530=l9_528;
float2 l9_531=(*sc_set0.UserUniforms).Port_Scale_N041;
l9_530.x=floor(l9_530.x*10000.0)*9.9999997e-05;
l9_530.y=floor(l9_530.y*10000.0)*9.9999997e-05;
l9_530*=(l9_531*0.5);
float2 l9_532=l9_530;
float l9_533=(snoise(l9_532)*0.5)+0.5;
l9_533=floor(l9_533*10000.0)*9.9999997e-05;
l9_529=l9_533;
l9_463=l9_529;
float l9_534=l9_463;
float2 l9_535=float2(l9_505[l9_512.x],l9_505[l9_520.x]);
l9_535=pow(l9_535,float2(1.0/(1.0-(l9_468*0.99000001))));
float l9_536=((l9_527*l9_535.x)+(l9_534*l9_535.y))/(l9_535.x+l9_535.y);
l9_462=l9_536;
float l9_537=0.0;
l9_537=l9_462;
float l9_538=0.0;
l9_538=l9_537*(*sc_set0.UserUniforms).Port_Input1_N122;
float l9_539=0.0;
float l9_540;
if (l9_538<=0.0)
{
l9_540=0.0;
}
else
{
l9_540=pow(l9_538,(*sc_set0.UserUniforms).Port_Input1_N125);
}
l9_539=l9_540;
float l9_541=0.0;
l9_541=l9_461*l9_539;
float l9_542=0.0;
l9_542=fast::clamp(l9_541+0.001,(*sc_set0.UserUniforms).Port_Input1_N126+0.001,(*sc_set0.UserUniforms).Port_Input2_N126+0.001)-0.001;
float l9_543=0.0;
l9_543=1.0-l9_542;
l9_292=l9_543;
l9_294=l9_292;
}
l9_290=l9_294;
float3 l9_544=float3(0.0);
l9_544=mix(l9_288,l9_289,float3(l9_290));
param_1=l9_544;
param_4=param_1;
}
else
{
if ((int(Tweak_N76_tmp)!=0))
{
float3 l9_545=float3(0.0);
float l9_546=0.0;
float3 l9_547=float3(1.0);
float3 l9_548=float3(0.0);
ssGlobals l9_549=param_5;
float l9_550=0.0;
float l9_551=(*sc_set0.UserUniforms).glitchFrequency;
l9_550=l9_551;
float l9_552=0.0;
l9_552=l9_550;
float l9_553=0.0;
l9_553=(((l9_552-(*sc_set0.UserUniforms).Port_RangeMinA_N034)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N034-(*sc_set0.UserUniforms).Port_RangeMinA_N034)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N034-(*sc_set0.UserUniforms).Port_RangeMinB_N034))+(*sc_set0.UserUniforms).Port_RangeMinB_N034;
float l9_554=0.0;
float l9_555=0.0;
float l9_556=0.0;
ssGlobals l9_557=l9_549;
float l9_558;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_559=0.0;
float l9_560=(*sc_set0.UserUniforms).glitchSpeed;
l9_559=l9_560;
float l9_561=0.0;
l9_561=(((l9_559-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_562=0.0;
l9_562=l9_557.gTimeElapsed*l9_561;
float l9_563=0.0;
float l9_564=(*sc_set0.UserUniforms).glitchOffset;
l9_563=l9_564;
float l9_565=0.0;
l9_565=(((l9_563-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_566=0.0;
l9_566=l9_562+l9_565;
l9_555=l9_566;
l9_558=l9_555;
}
else
{
float l9_567=0.0;
float l9_568=(*sc_set0.UserUniforms).glitchOffset;
l9_567=l9_568;
float l9_569=0.0;
l9_569=(((l9_567-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_556=l9_569;
l9_558=l9_556;
}
l9_554=l9_558;
float l9_570=0.0;
l9_570=l9_554;
float l9_571=0.0;
l9_571=l9_553*l9_570;
float l9_572=0.0;
l9_572=fract(l9_571);
float l9_573=0.0;
l9_573=float(l9_572<(*sc_set0.UserUniforms).Port_Input1_N055);
float l9_574=0.0;
l9_574=l9_571*(*sc_set0.UserUniforms).Port_Input1_N056;
float l9_575=0.0;
l9_575=fract(l9_574);
float l9_576=0.0;
l9_576=float(l9_575<(*sc_set0.UserUniforms).Port_Input1_N066);
float l9_577=0.0;
l9_577=l9_573+l9_576;
l9_546=l9_577;
float3 l9_578;
if ((l9_546*1.0)!=0.0)
{
float l9_579=0.0;
float l9_580=0.0;
float l9_581=0.0;
ssGlobals l9_582=l9_549;
float l9_583;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_584=0.0;
float l9_585=(*sc_set0.UserUniforms).glitchSpeed;
l9_584=l9_585;
float l9_586=0.0;
l9_586=(((l9_584-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_587=0.0;
l9_587=l9_582.gTimeElapsed*l9_586;
float l9_588=0.0;
float l9_589=(*sc_set0.UserUniforms).glitchOffset;
l9_588=l9_589;
float l9_590=0.0;
l9_590=(((l9_588-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_591=0.0;
l9_591=l9_587+l9_590;
l9_580=l9_591;
l9_583=l9_580;
}
else
{
float l9_592=0.0;
float l9_593=(*sc_set0.UserUniforms).glitchOffset;
l9_592=l9_593;
float l9_594=0.0;
l9_594=(((l9_592-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_581=l9_594;
l9_583=l9_581;
}
l9_579=l9_583;
float l9_595=0.0;
l9_595=l9_579;
float3 l9_596=float3(0.0);
l9_596=l9_549.SurfacePosition_ObjectSpace;
float l9_597=0.0;
float l9_598=(*sc_set0.UserUniforms).glitchIntensity;
l9_597=l9_598;
float l9_599=0.0;
l9_599=fast::min(l9_597,30.0);
float l9_600=0.0;
l9_600=l9_599;
float3 l9_601=float3(0.0);
l9_601=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_602=float3(0.0);
l9_602=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_603=float3(0.0);
l9_603=l9_601-l9_602;
float l9_604=0.0;
l9_604=length(l9_603);
float l9_605=0.0;
l9_605=(*sc_set0.UserUniforms).Port_Import_N203;
float l9_606=0.0;
l9_606=(l9_600*l9_604)*l9_605;
float l9_607=0.0;
l9_607=l9_606;
float l9_608=0.0;
float l9_609=0.0;
float3 l9_610=float3(0.0);
float3 l9_611=float3(0.0,1.0,0.0);
float3 l9_612=float3(1.0);
float3 l9_613=float3(0.0);
float l9_614=1.0;
ssGlobals l9_615=l9_549;
float l9_616=0.0;
float l9_617=(*sc_set0.UserUniforms).glitchScale;
l9_616=l9_617;
float l9_618=0.0;
l9_618=fast::clamp(l9_616,0.0,1.0);
float3 l9_619=float3(0.0);
l9_619=float3(l9_618);
l9_612=l9_619;
float l9_620=0.0;
float l9_621=0.0;
float l9_622=0.0;
ssGlobals l9_623=l9_615;
float l9_624;
if ((int(Tweak_N87_tmp)!=0))
{
float l9_625=0.0;
float l9_626=(*sc_set0.UserUniforms).glitchSpeed;
l9_625=l9_626;
float l9_627=0.0;
l9_627=(((l9_625-(*sc_set0.UserUniforms).Port_RangeMinA_N002)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N002-(*sc_set0.UserUniforms).Port_RangeMinA_N002)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N002-(*sc_set0.UserUniforms).Port_RangeMinB_N002))+(*sc_set0.UserUniforms).Port_RangeMinB_N002;
float l9_628=0.0;
l9_628=l9_623.gTimeElapsed*l9_627;
float l9_629=0.0;
float l9_630=(*sc_set0.UserUniforms).glitchOffset;
l9_629=l9_630;
float l9_631=0.0;
l9_631=(((l9_629-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
float l9_632=0.0;
l9_632=l9_628+l9_631;
l9_621=l9_632;
l9_624=l9_621;
}
else
{
float l9_633=0.0;
float l9_634=(*sc_set0.UserUniforms).glitchOffset;
l9_633=l9_634;
float l9_635=0.0;
l9_635=(((l9_633-(*sc_set0.UserUniforms).Port_RangeMinA_N103)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N103-(*sc_set0.UserUniforms).Port_RangeMinA_N103)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N103-(*sc_set0.UserUniforms).Port_RangeMinB_N103))+(*sc_set0.UserUniforms).Port_RangeMinB_N103;
l9_622=l9_635;
l9_624=l9_622;
}
l9_620=l9_624;
float l9_636=0.0;
l9_636=l9_620;
float l9_637=0.0;
l9_637=(*sc_set0.UserUniforms).Port_Input0_N009*l9_636;
float3 l9_638=float3(0.0);
l9_638=float3(l9_637);
l9_613=l9_638;
float l9_639=0.0;
l9_639=(*sc_set0.UserUniforms).Port_Import_N181;
float l9_640=0.0;
l9_640=fast::clamp(l9_639+0.001,(*sc_set0.UserUniforms).Port_Input1_N182+0.001,(*sc_set0.UserUniforms).Port_Input2_N182+0.001)-0.001;
l9_614=l9_640;
float3 l9_641=float3(0.0);
l9_641=l9_615.SurfacePosition_ObjectSpace;
float3 l9_642=float3(0.0);
l9_642=l9_641;
float3 l9_643=float3(0.0);
l9_643=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_644=float3(0.0);
l9_644=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_645=float3(0.0);
l9_645=l9_643-l9_644;
float l9_646=0.0;
l9_646=length(l9_645);
float3 l9_647=float3(0.0);
l9_647=l9_642/(float3(l9_646)+float3(1.234e-06));
float3 l9_648=float3(0.0);
l9_648=l9_647;
float l9_649=0.0;
l9_649=fast::max((*sc_set0.UserUniforms).Port_Import_N174,0.0);
float3 l9_650=float3(0.0);
l9_650=l9_648*float3(l9_649);
l9_610=l9_650;
float3 l9_651=float3(0.0);
l9_651=l9_615.VertexNormal_ObjectSpace;
l9_611=l9_651;
float3 l9_652=l9_610;
float3 l9_653=l9_611;
l9_652+=l9_613;
l9_652*=l9_612;
l9_653=abs(l9_653);
float l9_654=l9_653.x;
float l9_655=l9_653.y;
bool l9_656=l9_654>l9_655;
bool l9_657;
if (l9_656)
{
l9_657=l9_653.x>l9_653.z;
}
else
{
l9_657=l9_656;
}
int3 l9_658;
if (l9_657)
{
l9_658=int3(0,1,2);
}
else
{
bool3 l9_659=bool3(l9_653.y>l9_653.z);
l9_658=int3(l9_659.x ? int3(1,2,0).x : int3(2,0,1).x,l9_659.y ? int3(1,2,0).y : int3(2,0,1).y,l9_659.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_660=l9_658;
float l9_661=l9_653.x;
float l9_662=l9_653.y;
bool l9_663=l9_661<l9_662;
bool l9_664;
if (l9_663)
{
l9_664=l9_653.x<l9_653.z;
}
else
{
l9_664=l9_663;
}
int3 l9_665;
if (l9_664)
{
l9_665=int3(0,1,2);
}
else
{
bool3 l9_666=bool3(l9_653.y<l9_653.z);
l9_665=int3(l9_666.x ? int3(1,2,0).x : int3(2,0,1).x,l9_666.y ? int3(1,2,0).y : int3(2,0,1).y,l9_666.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_667=l9_665;
int3 l9_668=(int3(3)-l9_667)-l9_660;
l9_615.gTriplanarCoords=float2(l9_652[l9_660.y],l9_652[l9_660.z]);
float2 l9_669=float2(0.0);
l9_669=l9_615.gTriplanarCoords;
float l9_670=0.0;
float2 l9_671=l9_669;
float2 l9_672=(*sc_set0.UserUniforms).Port_Scale_N164;
l9_671.x=floor(l9_671.x*10000.0)*9.9999997e-05;
l9_671.y=floor(l9_671.y*10000.0)*9.9999997e-05;
l9_671*=(l9_672*0.5);
float2 l9_673=l9_671;
float l9_674=(snoise(l9_673)*0.5)+0.5;
l9_674=floor(l9_674*10000.0)*9.9999997e-05;
l9_670=l9_674;
l9_609=l9_670;
float l9_675=l9_609;
l9_615.gTriplanarCoords=float2(l9_652[l9_668.y],l9_652[l9_668.z]);
float2 l9_676=float2(0.0);
l9_676=l9_615.gTriplanarCoords;
float l9_677=0.0;
float2 l9_678=l9_676;
float2 l9_679=(*sc_set0.UserUniforms).Port_Scale_N164;
l9_678.x=floor(l9_678.x*10000.0)*9.9999997e-05;
l9_678.y=floor(l9_678.y*10000.0)*9.9999997e-05;
l9_678*=(l9_679*0.5);
float2 l9_680=l9_678;
float l9_681=(snoise(l9_680)*0.5)+0.5;
l9_681=floor(l9_681*10000.0)*9.9999997e-05;
l9_677=l9_681;
l9_609=l9_677;
float l9_682=l9_609;
float2 l9_683=float2(l9_653[l9_660.x],l9_653[l9_668.x]);
l9_683=pow(l9_683,float2(1.0/(1.0-(l9_614*0.99000001))));
float l9_684=((l9_675*l9_683.x)+(l9_682*l9_683.y))/(l9_683.x+l9_683.y);
l9_608=l9_684;
float l9_685=0.0;
l9_685=l9_608;
float l9_686=0.0;
l9_686=l9_685*(*sc_set0.UserUniforms).Port_Input1_N140;
float l9_687=0.0;
float l9_688;
if (l9_686<=0.0)
{
l9_688=0.0;
}
else
{
l9_688=pow(l9_686,(*sc_set0.UserUniforms).Port_Input1_N141);
}
l9_687=l9_688;
float l9_689=0.0;
l9_689=(l9_607*l9_687)*(*sc_set0.UserUniforms).Port_Input2_N110;
float3 l9_690=float3(0.0);
l9_690=l9_549.VertexNormal_ObjectSpace;
float3 l9_691=float3(0.0);
l9_691=float3(l9_689)*l9_690;
float3 l9_692=float3(0.0);
l9_692=l9_596-l9_691;
float3 l9_693=float3(0.0);
l9_693=float3(l9_692.x,l9_596.y,l9_692.z);
float l9_694=0.0;
float l9_695=0.0;
float l9_696=0.0;
float l9_697=0.0;
float4 l9_698=float4(l9_693,0.0);
float l9_699=l9_698.x;
float l9_700=l9_698.y;
float l9_701=l9_698.z;
float l9_702=l9_698.w;
l9_694=l9_699;
l9_695=l9_700;
l9_696=l9_701;
l9_697=l9_702;
float l9_703=0.0;
l9_703=l9_595*l9_695;
float l9_704=0.0;
l9_704=sin(l9_703);
float l9_705=0.0;
l9_705=l9_607/((*sc_set0.UserUniforms).Port_Input1_N117+1.234e-06);
float l9_706=0.0;
l9_706=l9_704*l9_705;
float l9_707=0.0;
l9_707=l9_706+l9_694;
float4 l9_708=float4(0.0);
l9_708.x=l9_707;
l9_708.y=l9_695;
l9_708.z=l9_696;
l9_708.w=l9_697;
l9_547=l9_708.xyz;
l9_578=l9_547;
}
else
{
float3 l9_709=float3(0.0);
l9_709=l9_549.SurfacePosition_ObjectSpace;
l9_548=l9_709;
l9_578=l9_548;
}
l9_545=l9_578;
float3 l9_710=float3(0.0);
l9_710=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(l9_545,1.0)).xyz;
float3 l9_711=float3(0.0);
l9_711=l9_710;
param_2=l9_711;
param_4=param_2;
}
else
{
float3 l9_712=float3(0.0);
l9_712=param_5.SurfacePosition_WorldSpace;
param_3=l9_712;
param_4=param_3;
}
}
Result_N40=param_4;
WorldPosition=Result_N40;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_6=v;
float3 param_7=WorldPosition;
float3 param_8=WorldNormal;
float3 param_9=WorldTangent;
float4 param_10=v.position;
out.varPos=param_7;
out.varNormal=normalize(param_8);
float3 l9_713=normalize(param_9);
out.varTangent=float4(l9_713.x,l9_713.y,l9_713.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_714=param_6.position;
float4 l9_715=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_716=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_716=0;
}
else
{
l9_716=gl_InstanceIndex%2;
}
int l9_717=l9_716;
l9_715=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_717]*l9_714;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_718=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_718=0;
}
else
{
l9_718=gl_InstanceIndex%2;
}
int l9_719=l9_718;
l9_715=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_719]*l9_714;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_720=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_720=0;
}
else
{
l9_720=gl_InstanceIndex%2;
}
int l9_721=l9_720;
l9_715=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_721]*l9_714;
}
else
{
l9_715=l9_714;
}
}
}
float4 l9_722=l9_715;
out.varViewSpaceDepth=-l9_722.z;
}
float4 l9_723=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_723=param_10;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_724=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_724=0;
}
else
{
l9_724=gl_InstanceIndex%2;
}
int l9_725=l9_724;
l9_723=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_725]*param_6.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_726=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_726=0;
}
else
{
l9_726=gl_InstanceIndex%2;
}
int l9_727=l9_726;
l9_723=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_727]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_728=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_728=0;
}
else
{
l9_728=gl_InstanceIndex%2;
}
int l9_729=l9_728;
l9_723=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_729]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_6.texture0,param_6.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_730=param_6.position;
float4 l9_731=l9_730;
if (sc_RenderingSpace_tmp==1)
{
l9_731=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_730;
}
float4 l9_732=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_731;
float2 l9_733=((l9_732.xy/float2(l9_732.w))*0.5)+float2(0.5);
out.varShadowTex=l9_733;
}
float4 l9_734=l9_723;
if (sc_DepthBufferMode_tmp==1)
{
int l9_735=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_735=0;
}
else
{
l9_735=gl_InstanceIndex%2;
}
int l9_736=l9_735;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_736][2].w!=0.0)
{
float l9_737=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_734.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_734.w))*l9_737)-1.0)*l9_734.w;
}
}
float4 l9_738=l9_734;
l9_723=l9_738;
float4 l9_739=l9_723;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_740=l9_739.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_739.w);
l9_739=float4(l9_740.x,l9_740.y,l9_739.z,l9_739.w);
}
float4 l9_741=l9_739;
l9_723=l9_741;
float4 l9_742=l9_723;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_742.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_743=l9_742;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_744=dot(l9_743,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_745=l9_744;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_745;
}
}
float4 l9_746=float4(l9_742.x,-l9_742.y,(l9_742.z*0.5)+(l9_742.w*0.5),l9_742.w);
out.gl_Position=l9_746;
v=param_6;
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
float3 SurfacePosition_ObjectSpace;
float3 ViewDirWS;
float3 SurfacePosition_WorldSpace;
float3 VertexNormal_WorldSpace;
float2 Surface_UVCoord0;
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
float glitchFrequency;
float glitchSpeed;
float glitchOffset;
float glitchIntensity;
float glitchScale;
float thickLines;
float scanlineSpeed;
float Offset;
float randScale;
float4 thicklinesColor;
float thinLines;
float4 thinlinesColor;
float4 rimTint;
float4 opacityTextureSize;
float4 opacityTextureDims;
float4 opacityTextureView;
float3x3 opacityTextureTransform;
float4 opacityTextureUvMinMax;
float4 opacityTextureBorderColor;
float Port_Import_N050;
float Port_RangeMinA_N034;
float Port_RangeMaxA_N034;
float Port_RangeMinB_N034;
float Port_RangeMaxB_N034;
float Port_RangeMinA_N002;
float Port_RangeMaxA_N002;
float Port_RangeMinB_N002;
float Port_RangeMaxB_N002;
float Port_RangeMinA_N103;
float Port_RangeMaxA_N103;
float Port_RangeMinB_N103;
float Port_RangeMaxB_N103;
float Port_Import_N028;
float Port_Input1_N055;
float Port_Input1_N056;
float Port_Input1_N066;
float Port_Import_N093;
float Port_Import_N198;
float Port_Import_N203;
float Port_Import_N038;
float3 Port_Import_N179;
float Port_Input0_N009;
float3 Port_Import_N180;
float Port_Import_N181;
float Port_Input1_N182;
float Port_Input2_N182;
float3 Port_Import_N167;
float Port_Import_N174;
float2 Port_Scale_N164;
float Port_Input1_N140;
float Port_Input1_N141;
float Port_Input2_N110;
float Port_Input1_N117;
float Port_RangeMinA_N063;
float Port_RangeMaxA_N063;
float Port_RangeMinB_N063;
float Port_RangeMaxB_N063;
float Port_RangeMinA_N067;
float Port_RangeMaxA_N067;
float Port_RangeMinB_N067;
float Port_RangeMaxB_N067;
float Port_Input1_N078;
float Port_Input0_N129;
float3 Port_Import_N070;
float3 Port_Import_N069;
float Port_Import_N071;
float Port_Input1_N072;
float Port_Input2_N072;
float3 Port_Import_N094;
float Port_Import_N106;
float2 Port_Scale_N041;
float Port_Input1_N122;
float Port_Input1_N125;
float Port_Input1_N126;
float Port_Input2_N126;
float Port_Input1_N020;
float Port_Input1_N049;
float Port_Input2_N014;
float Port_Input1_N058;
float Port_Input2_N058;
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
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> opacityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler intensityTextureSmpSC [[id(17)]];
sampler opacityTextureSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
constant userUniformsObj* UserUniforms [[id(26)]];
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
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(in.varPos,1.0)).xyz;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.Surface_UVCoord0=in.varPackedTex.xy;
float4 Output_N21=float4(0.0);
float4 param=(*sc_set0.UserUniforms).thicklinesColor;
Output_N21=param;
float Output_N42=0.0;
float param_1=(*sc_set0.UserUniforms).thickLines;
Output_N42=param_1;
float Result_N10=0.0;
float param_2=0.0;
float param_3=0.0;
ssGlobals param_5=Globals;
float param_4;
if ((int(animated_tmp)!=0))
{
float l9_14=0.0;
float l9_15=1.0;
float l9_16=0.0;
float l9_17;
if ((int(Tweak_N68_tmp)!=0))
{
float l9_18=0.0;
float l9_19=(*sc_set0.UserUniforms).scanlineSpeed;
l9_18=l9_19;
float l9_20=0.0;
l9_20=(((l9_18-(*sc_set0.UserUniforms).Port_RangeMinA_N063)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N063-(*sc_set0.UserUniforms).Port_RangeMinA_N063)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N063-(*sc_set0.UserUniforms).Port_RangeMinB_N063))+(*sc_set0.UserUniforms).Port_RangeMinB_N063;
float l9_21=0.0;
l9_21=1.0-l9_20;
l9_15=l9_21;
l9_17=l9_15;
}
else
{
float l9_22=0.0;
float l9_23=(*sc_set0.UserUniforms).scanlineSpeed;
l9_22=l9_23;
float l9_24=0.0;
l9_24=(((l9_22-(*sc_set0.UserUniforms).Port_RangeMinA_N063)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N063-(*sc_set0.UserUniforms).Port_RangeMinA_N063)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N063-(*sc_set0.UserUniforms).Port_RangeMinB_N063))+(*sc_set0.UserUniforms).Port_RangeMinB_N063;
l9_16=l9_24;
l9_17=l9_16;
}
l9_14=l9_17;
float l9_25=0.0;
l9_25=param_5.gTimeElapsed*l9_14;
float l9_26=0.0;
float l9_27=(*sc_set0.UserUniforms).Offset;
l9_26=l9_27;
float l9_28=0.0;
l9_28=(((l9_26-(*sc_set0.UserUniforms).Port_RangeMinA_N067)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N067-(*sc_set0.UserUniforms).Port_RangeMinA_N067)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N067-(*sc_set0.UserUniforms).Port_RangeMinB_N067))+(*sc_set0.UserUniforms).Port_RangeMinB_N067;
float l9_29=0.0;
l9_29=l9_25+l9_28;
param_2=l9_29;
param_4=param_2;
}
else
{
float l9_30=0.0;
float l9_31=(*sc_set0.UserUniforms).Offset;
l9_30=l9_31;
float l9_32=0.0;
l9_32=(((l9_30-(*sc_set0.UserUniforms).Port_RangeMinA_N067)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N067-(*sc_set0.UserUniforms).Port_RangeMinA_N067)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N067-(*sc_set0.UserUniforms).Port_RangeMinB_N067))+(*sc_set0.UserUniforms).Port_RangeMinB_N067;
param_3=l9_32;
param_4=param_3;
}
Result_N10=param_4;
float2 Output_N86=float2(0.0);
float2 param_6=float2(1.0);
float2 param_7=float2(0.0);
ssGlobals param_9=Globals;
float2 param_8;
if ((int(Tweak_N89_tmp)!=0))
{
float2 l9_33=float2(0.0);
l9_33=param_9.gScreenCoord;
float2 l9_34=float2(0.0);
l9_34=l9_33/(float2((*sc_set0.UserUniforms).Port_Input1_N078)+float2(1.234e-06));
param_6=l9_34;
param_8=param_6;
}
else
{
float3 l9_35=float3(0.0);
l9_35=param_9.SurfacePosition_ObjectSpace;
param_7=l9_35.xy;
param_8=param_7;
}
Output_N86=param_8;
float Output_N16=0.0;
Output_N16=Output_N86.y;
float Output_N17=0.0;
Output_N17=Result_N10-Output_N16;
float Output_N46=0.0;
Output_N46=Output_N42*Output_N17;
float Output_N18=0.0;
Output_N18=fract(Output_N46);
float4 Output_N20=float4(0.0);
Output_N20=(Output_N21*float4((*sc_set0.UserUniforms).Port_Input1_N020))*float4(Output_N18);
float Output_N44=0.0;
float param_10=(*sc_set0.UserUniforms).thinLines;
Output_N44=param_10;
float Output_N51=0.0;
Output_N51=Output_N16*Output_N44;
float Output_N47=0.0;
Output_N47=fract(Output_N51);
float4 Output_N48=float4(0.0);
float4 param_11=(*sc_set0.UserUniforms).thinlinesColor;
Output_N48=param_11;
float4 Output_N49=float4(0.0);
Output_N49=(float4(Output_N47)*float4((*sc_set0.UserUniforms).Port_Input1_N049))*Output_N48;
float Ratio_N23=0.0;
float param_12=dot(Globals.ViewDirWS,Globals.VertexNormal_WorldSpace);
float l9_36=fast::clamp(param_12,0.0,1.0);
Ratio_N23=1.0-l9_36;
float4 Output_N25=float4(0.0);
float4 param_13=(*sc_set0.UserUniforms).rimTint;
Output_N25=param_13;
float4 Output_N24=float4(0.0);
Output_N24=float4(Ratio_N23)*Output_N25;
float4 Output_N22=float4(0.0);
Output_N22=(Output_N20+Output_N49)+Output_N24;
float Output_N61=0.0;
Output_N61=Output_N22.w;
float4 Output_N14=float4(0.0);
float4 param_14=float4(1.0);
float param_15=(*sc_set0.UserUniforms).Port_Input2_N014;
ssGlobals param_17=Globals;
float4 param_16;
if ((int(Tweak_N12_tmp)!=0))
{
float4 l9_37=float4(0.0);
int l9_38=0;
if ((int(opacityTextureHasSwappedViews_tmp)!=0))
{
int l9_39=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_39=0;
}
else
{
l9_39=in.varStereoViewID;
}
int l9_40=l9_39;
l9_38=1-l9_40;
}
else
{
int l9_41=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_41=0;
}
else
{
l9_41=in.varStereoViewID;
}
int l9_42=l9_41;
l9_38=l9_42;
}
int l9_43=l9_38;
int l9_44=opacityTextureLayout_tmp;
int l9_45=l9_43;
float2 l9_46=param_17.Surface_UVCoord0;
bool l9_47=(int(SC_USE_UV_TRANSFORM_opacityTexture_tmp)!=0);
float3x3 l9_48=(*sc_set0.UserUniforms).opacityTextureTransform;
int2 l9_49=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTexture_tmp);
bool l9_50=(int(SC_USE_UV_MIN_MAX_opacityTexture_tmp)!=0);
float4 l9_51=(*sc_set0.UserUniforms).opacityTextureUvMinMax;
bool l9_52=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture_tmp)!=0);
float4 l9_53=(*sc_set0.UserUniforms).opacityTextureBorderColor;
float l9_54=0.0;
bool l9_55=l9_52&&(!l9_50);
float l9_56=1.0;
float l9_57=l9_46.x;
int l9_58=l9_49.x;
if (l9_58==1)
{
l9_57=fract(l9_57);
}
else
{
if (l9_58==2)
{
float l9_59=fract(l9_57);
float l9_60=l9_57-l9_59;
float l9_61=step(0.25,fract(l9_60*0.5));
l9_57=mix(l9_59,1.0-l9_59,fast::clamp(l9_61,0.0,1.0));
}
}
l9_46.x=l9_57;
float l9_62=l9_46.y;
int l9_63=l9_49.y;
if (l9_63==1)
{
l9_62=fract(l9_62);
}
else
{
if (l9_63==2)
{
float l9_64=fract(l9_62);
float l9_65=l9_62-l9_64;
float l9_66=step(0.25,fract(l9_65*0.5));
l9_62=mix(l9_64,1.0-l9_64,fast::clamp(l9_66,0.0,1.0));
}
}
l9_46.y=l9_62;
if (l9_50)
{
bool l9_67=l9_52;
bool l9_68;
if (l9_67)
{
l9_68=l9_49.x==3;
}
else
{
l9_68=l9_67;
}
float l9_69=l9_46.x;
float l9_70=l9_51.x;
float l9_71=l9_51.z;
bool l9_72=l9_68;
float l9_73=l9_56;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
l9_46.x=l9_69;
l9_56=l9_73;
bool l9_76=l9_52;
bool l9_77;
if (l9_76)
{
l9_77=l9_49.y==3;
}
else
{
l9_77=l9_76;
}
float l9_78=l9_46.y;
float l9_79=l9_51.y;
float l9_80=l9_51.w;
bool l9_81=l9_77;
float l9_82=l9_56;
float l9_83=fast::clamp(l9_78,l9_79,l9_80);
float l9_84=step(abs(l9_78-l9_83),9.9999997e-06);
l9_82*=(l9_84+((1.0-float(l9_81))*(1.0-l9_84)));
l9_78=l9_83;
l9_46.y=l9_78;
l9_56=l9_82;
}
float2 l9_85=l9_46;
bool l9_86=l9_47;
float3x3 l9_87=l9_48;
if (l9_86)
{
l9_85=float2((l9_87*float3(l9_85,1.0)).xy);
}
float2 l9_88=l9_85;
float2 l9_89=l9_88;
float2 l9_90=l9_89;
l9_46=l9_90;
float l9_91=l9_46.x;
int l9_92=l9_49.x;
bool l9_93=l9_55;
float l9_94=l9_56;
if ((l9_92==0)||(l9_92==3))
{
float l9_95=l9_91;
float l9_96=0.0;
float l9_97=1.0;
bool l9_98=l9_93;
float l9_99=l9_94;
float l9_100=fast::clamp(l9_95,l9_96,l9_97);
float l9_101=step(abs(l9_95-l9_100),9.9999997e-06);
l9_99*=(l9_101+((1.0-float(l9_98))*(1.0-l9_101)));
l9_95=l9_100;
l9_91=l9_95;
l9_94=l9_99;
}
l9_46.x=l9_91;
l9_56=l9_94;
float l9_102=l9_46.y;
int l9_103=l9_49.y;
bool l9_104=l9_55;
float l9_105=l9_56;
if ((l9_103==0)||(l9_103==3))
{
float l9_106=l9_102;
float l9_107=0.0;
float l9_108=1.0;
bool l9_109=l9_104;
float l9_110=l9_105;
float l9_111=fast::clamp(l9_106,l9_107,l9_108);
float l9_112=step(abs(l9_106-l9_111),9.9999997e-06);
l9_110*=(l9_112+((1.0-float(l9_109))*(1.0-l9_112)));
l9_106=l9_111;
l9_102=l9_106;
l9_105=l9_110;
}
l9_46.y=l9_102;
l9_56=l9_105;
float2 l9_113=l9_46;
int l9_114=l9_44;
int l9_115=l9_45;
float l9_116=l9_54;
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
float4 l9_125=sc_set0.opacityTexture.sample(sc_set0.opacityTextureSmpSC,l9_123,bias(l9_124));
float4 l9_126=l9_125;
float4 l9_127=l9_126;
if (l9_52)
{
l9_127=mix(l9_53,l9_127,float4(l9_56));
}
float4 l9_128=l9_127;
l9_37=l9_128;
param_14=l9_37;
param_16=param_14;
}
else
{
param_16=float4(param_15);
}
Output_N14=param_16;
float Output_N26=0.0;
Output_N26=Output_N14.x;
float Output_N57=0.0;
Output_N57=Output_N61*Output_N26;
float Output_N58=0.0;
Output_N58=fast::clamp(Output_N57+0.001,(*sc_set0.UserUniforms).Port_Input1_N058+0.001,(*sc_set0.UserUniforms).Port_Input2_N058+0.001)-0.001;
float4 Value_N60=float4(0.0);
Value_N60=float4(Output_N22.xyz.x,Output_N22.xyz.y,Output_N22.xyz.z,Value_N60.w);
Value_N60.w=Output_N58;
FinalColor=Value_N60;
float param_18=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_18<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_129=gl_FragCoord;
float2 l9_130=floor(mod(l9_129.xy,float2(4.0)));
float l9_131=(mod(dot(l9_130,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_18<l9_131)
{
discard_fragment();
}
}
float4 param_19=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_132=param_19;
float4 l9_133=l9_132;
float l9_134=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_134=l9_133.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_134=fast::clamp(l9_133.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_134=fast::clamp(dot(l9_133.xyz,float3(l9_133.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_134=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_134=(1.0-dot(l9_133.xyz,float3(0.33333001)))*l9_133.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_134=(1.0-fast::clamp(dot(l9_133.xyz,float3(1.0)),0.0,1.0))*l9_133.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_134=fast::clamp(dot(l9_133.xyz,float3(1.0)),0.0,1.0)*l9_133.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_134=fast::clamp(dot(l9_133.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_134=fast::clamp(dot(l9_133.xyz,float3(1.0)),0.0,1.0)*l9_133.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_134=dot(l9_133.xyz,float3(0.33333001))*l9_133.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_134=1.0-fast::clamp(dot(l9_133.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_134=fast::clamp(dot(l9_133.xyz,float3(1.0)),0.0,1.0);
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
float l9_135=l9_134;
float l9_136=l9_135;
float l9_137=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_136;
float3 l9_138=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_132.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_139=float4(l9_138.x,l9_138.y,l9_138.z,l9_137);
param_19=l9_139;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_19=float4(param_19.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_140=param_19;
float4 l9_141=float4(0.0);
float4 l9_142=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_143=out.FragColor0;
float4 l9_144=l9_143;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_144.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_145=l9_144;
l9_142=l9_145;
}
else
{
float4 l9_146=gl_FragCoord;
float2 l9_147=l9_146.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_148=l9_147;
float2 l9_149=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_150=1;
int l9_151=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_151=0;
}
else
{
l9_151=in.varStereoViewID;
}
int l9_152=l9_151;
int l9_153=l9_152;
float3 l9_154=float3(l9_148,0.0);
int l9_155=l9_150;
int l9_156=l9_153;
if (l9_155==1)
{
l9_154.y=((2.0*l9_154.y)+float(l9_156))-1.0;
}
float2 l9_157=l9_154.xy;
l9_149=l9_157;
}
else
{
l9_149=l9_148;
}
float2 l9_158=l9_149;
float2 l9_159=l9_158;
float2 l9_160=l9_159;
int l9_161=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_162=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_162=0;
}
else
{
l9_162=in.varStereoViewID;
}
int l9_163=l9_162;
l9_161=1-l9_163;
}
else
{
int l9_164=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_164=0;
}
else
{
l9_164=in.varStereoViewID;
}
int l9_165=l9_164;
l9_161=l9_165;
}
int l9_166=l9_161;
float2 l9_167=l9_160;
int l9_168=l9_166;
float2 l9_169=l9_167;
int l9_170=l9_168;
float l9_171=0.0;
float4 l9_172=float4(0.0);
float2 l9_173=l9_169;
int l9_174=sc_ScreenTextureLayout_tmp;
int l9_175=l9_170;
float l9_176=l9_171;
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
float4 l9_185=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_183,bias(l9_184));
float4 l9_186=l9_185;
l9_172=l9_186;
float4 l9_187=l9_172;
float4 l9_188=l9_187;
float4 l9_189=l9_188;
l9_142=l9_189;
}
float4 l9_190=l9_142;
float4 l9_191=l9_190;
float3 l9_192=l9_191.xyz;
float3 l9_193=l9_192;
float3 l9_194=l9_140.xyz;
float3 l9_195=definedBlend(l9_193,l9_194,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_141=float4(l9_195.x,l9_195.y,l9_195.z,l9_141.w);
float3 l9_196=mix(l9_192,l9_141.xyz,float3(l9_140.w));
l9_141=float4(l9_196.x,l9_196.y,l9_196.z,l9_141.w);
l9_141.w=1.0;
float4 l9_197=l9_141;
param_19=l9_197;
}
else
{
float4 l9_198=param_19;
float4 l9_199=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_199=float4(mix(float3(1.0),l9_198.xyz,float3(l9_198.w)),l9_198.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_200=l9_198.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_200=fast::clamp(l9_200,0.0,1.0);
}
l9_199=float4(l9_198.xyz*l9_200,l9_200);
}
else
{
l9_199=l9_198;
}
}
float4 l9_201=l9_199;
param_19=l9_201;
}
}
}
float4 l9_202=param_19;
FinalColor=l9_202;
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
float4 l9_203=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_203=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_203=float4(0.0);
}
float4 l9_204=l9_203;
float4 Cost=l9_204;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_20=in.varPos;
float4 param_21=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_20,param_21,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_22=FinalColor;
float4 l9_205=param_22;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_205.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_205;
return out;
}
} // FRAGMENT SHADER
