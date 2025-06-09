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
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler intensityTextureSmpSC 0:19
//sampler sampler renderTarget0SmpSC 0:20
//sampler sampler renderTarget1SmpSC 0:21
//sampler sampler renderTarget2SmpSC 0:22
//sampler sampler renderTarget3SmpSC 0:23
//sampler sampler sc_ScreenTextureSmpSC 0:28
//texture texture2D intensityTexture 0:0:0:19
//texture texture2D renderTarget0 0:1:0:20
//texture texture2D renderTarget1 0:2:0:21
//texture texture2D renderTarget2 0:3:0:22
//texture texture2D renderTarget3 0:4:0:23
//texture texture2D sc_ScreenTexture 0:16:0:28
//ubo int UserUniforms 0:31:7200 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float shaderComplexityValue 3604
//float4 sc_StereoClipPlanes 3664:[2]:16
//float _sc_framebufferFetchMarker 3700
//float correctedIntensity 3824
//float3x3 intensityTextureTransform 3888
//float4 intensityTextureUvMinMax 3936
//float4 intensityTextureBorderColor 3952
//int overrideTimeEnabled 3980
//float overrideTimeElapsed 3984:[32]:4
//float overrideTimeDelta 4112
//int vfxNumCopies 4116
//bool vfxBatchEnable 4120:[32]:4
//int vfxOffsetInstancesRead 7108
//float2 vfxTargetSizeRead 7120
//int vfxTargetWidth 7136
//float Port_Import_N004 7140
//float2 Port_Import_N006 7144
//float2 Port_Input1_N131 7160
//float Port_Input1_N153 7168
//float Port_Import_N286 7172
//float Port_Import_N288 7176
//float Port_Input1_N290 7180
//float Port_Input2_N290 7184
//float Port_Input1_N294 7188
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
//spec_const bool sc_BlendMode_Custom 38 0
//spec_const bool sc_BlendMode_MultiplyOriginal 39 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 40 0
//spec_const bool sc_BlendMode_Screen 41 0
//spec_const bool sc_FramebufferFetch 42 0
//spec_const bool sc_MotionVectorsPass 43 0
//spec_const bool sc_RenderAlphaToColor 44 0
//spec_const bool sc_ScreenTextureHasSwappedViews 45 0
//spec_const bool sc_ShaderComplexityAnalyzer 46 0
//spec_const bool sc_UseFramebufferFetchMarker 47 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 48 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 49 -1
//spec_const int intensityTextureLayout 50 0
//spec_const int renderTarget0Layout 51 0
//spec_const int renderTarget1Layout 52 0
//spec_const int renderTarget2Layout 53 0
//spec_const int renderTarget3Layout 54 0
//spec_const int sc_DepthBufferMode 55 0
//spec_const int sc_ScreenTextureLayout 56 0
//spec_const int sc_ShaderCacheConstant 57 0
//spec_const int sc_StereoRenderingMode 58 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 59 0
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
constant bool sc_BlendMode_Custom [[function_constant(38)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(39)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(40)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_Screen [[function_constant(41)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_FramebufferFetch [[function_constant(42)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(43)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_RenderAlphaToColor [[function_constant(44)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(45)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(46)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(47)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(48)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(49)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int intensityTextureLayout [[function_constant(50)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int renderTarget0Layout [[function_constant(51)]];
constant int renderTarget0Layout_tmp = is_function_constant_defined(renderTarget0Layout) ? renderTarget0Layout : 0;
constant int renderTarget1Layout [[function_constant(52)]];
constant int renderTarget1Layout_tmp = is_function_constant_defined(renderTarget1Layout) ? renderTarget1Layout : 0;
constant int renderTarget2Layout [[function_constant(53)]];
constant int renderTarget2Layout_tmp = is_function_constant_defined(renderTarget2Layout) ? renderTarget2Layout : 0;
constant int renderTarget3Layout [[function_constant(54)]];
constant int renderTarget3Layout_tmp = is_function_constant_defined(renderTarget3Layout) ? renderTarget3Layout : 0;
constant int sc_DepthBufferMode [[function_constant(55)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_ScreenTextureLayout [[function_constant(56)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(57)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_StereoRenderingMode [[function_constant(58)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(59)]];
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
float collisionCount_N134;
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
float Port_Import_N004;
float2 Port_Import_N006;
float Port_AlphaTestThreshold_N039;
float2 Port_Input1_N131;
float Port_Input1_N153;
float Port_Import_N286;
float Port_Import_N288;
float Port_Input1_N290;
float Port_Input2_N290;
float Port_Input1_N294;
};
struct sc_Set0
{
texture2d<float> intensityTexture [[id(0)]];
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler renderTarget0SmpSC [[id(20)]];
sampler renderTarget1SmpSC [[id(21)]];
sampler renderTarget2SmpSC [[id(22)]];
sampler renderTarget3SmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(31)]];
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
float Interp_Particle_collisionCount_N134 [[user(locn22)]];
float Interp_Particle_Mass [[user(locn23)]];
float gParticlesDebug [[user(locn24)]];
float2 ParticleUV [[user(locn25)]];
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
gParticle.CopyId=float(InstanceID/60);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
int l9_0=param/60;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%60;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(60*((param/60)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%60,l9_1/60);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/60.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(60.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/59.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/59.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(59.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
float2 l9_13=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_14=dot(l9_13,float2(0.98253,0.72662002));
l9_14=sin(l9_14)*479.371;
l9_14=fract(l9_14);
l9_14=floor(l9_14*10000.0)*9.9999997e-05;
float l9_15=l9_14;
param_1.TimeShift=l9_15;
param_1.TimeShift=0.0;
param_1.SpawnOffset=floor(param_1.Index1DPerCopyF/30.0)*6.6666698;
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
l9_16.Seed+=(floor(((((l9_19-l9_16.SpawnOffset)-0.0)+0.0)+26.666599)/13.3333)*4.32723);
l9_16.Seed=fract(abs(l9_16.Seed));
int2 l9_20=int2(l9_16.Index1D%400,l9_16.Index1D/400);
l9_16.Seed2000=(float2(l9_20)+float2(1.0))/float2(399.0);
param_1=l9_16;
gParticle=param_1;
int offsetPixelId=(UserUniforms.vfxOffsetInstancesRead+InstanceID)*5;
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
l9_58=!(UserUniforms.vfxBatchEnable[l9_59/60]!=0);
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
uv=Coord+(Offset*4.0);
float2 param_74=uv;
int l9_822=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_823=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_823=0;
}
else
{
l9_823=gl_InstanceIndex%2;
}
int l9_824=l9_823;
l9_822=1-l9_824;
}
else
{
int l9_825=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_825=0;
}
else
{
l9_825=gl_InstanceIndex%2;
}
int l9_826=l9_825;
l9_822=l9_826;
}
int l9_827=l9_822;
float2 l9_828=param_74;
int l9_829=l9_827;
float2 l9_830=l9_828;
int l9_831=l9_829;
float l9_832=0.0;
float4 l9_833=float4(0.0);
float2 l9_834=l9_830;
int l9_835=l9_831;
float l9_836=l9_832;
float4 l9_837=float4(0.0);
float2 l9_838=l9_834;
int l9_839=renderTarget0Layout_tmp;
int l9_840=l9_835;
float l9_841=l9_836;
float2 l9_842=l9_838;
int l9_843=l9_839;
int l9_844=l9_840;
float3 l9_845=float3(0.0);
if (l9_843==0)
{
l9_845=float3(l9_842,0.0);
}
else
{
if (l9_843==1)
{
l9_845=float3(l9_842.x,(l9_842.y*0.5)+(0.5-(float(l9_844)*0.5)),0.0);
}
else
{
l9_845=float3(l9_842,float(l9_844));
}
}
float3 l9_846=l9_845;
float3 l9_847=l9_846;
float2 l9_848=l9_847.xy;
float l9_849=l9_841;
float4 l9_850=renderTarget0.sample(renderTarget0SmpSC,l9_848,level(l9_849));
float4 l9_851=l9_850;
l9_837=l9_851;
float4 l9_852=l9_837;
l9_833=l9_852;
float4 l9_853=l9_833;
float4 l9_854=l9_853;
float4 l9_855=l9_854;
float4 renderTarget0Sample_4=l9_855;
Scalar0=renderTarget0Sample_4.x;
Scalar1=renderTarget0Sample_4.y;
Scalar2=renderTarget0Sample_4.z;
Scalar3=renderTarget0Sample_4.w;
float2 param_75=uv;
int l9_856=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_857=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_857=0;
}
else
{
l9_857=gl_InstanceIndex%2;
}
int l9_858=l9_857;
l9_856=1-l9_858;
}
else
{
int l9_859=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_859=0;
}
else
{
l9_859=gl_InstanceIndex%2;
}
int l9_860=l9_859;
l9_856=l9_860;
}
int l9_861=l9_856;
float2 l9_862=param_75;
int l9_863=l9_861;
float2 l9_864=l9_862;
int l9_865=l9_863;
float l9_866=0.0;
float4 l9_867=float4(0.0);
float2 l9_868=l9_864;
int l9_869=l9_865;
float l9_870=l9_866;
float4 l9_871=float4(0.0);
float2 l9_872=l9_868;
int l9_873=renderTarget1Layout_tmp;
int l9_874=l9_869;
float l9_875=l9_870;
float2 l9_876=l9_872;
int l9_877=l9_873;
int l9_878=l9_874;
float3 l9_879=float3(0.0);
if (l9_877==0)
{
l9_879=float3(l9_876,0.0);
}
else
{
if (l9_877==1)
{
l9_879=float3(l9_876.x,(l9_876.y*0.5)+(0.5-(float(l9_878)*0.5)),0.0);
}
else
{
l9_879=float3(l9_876,float(l9_878));
}
}
float3 l9_880=l9_879;
float3 l9_881=l9_880;
float2 l9_882=l9_881.xy;
float l9_883=l9_875;
float4 l9_884=renderTarget1.sample(renderTarget1SmpSC,l9_882,level(l9_883));
float4 l9_885=l9_884;
l9_871=l9_885;
float4 l9_886=l9_871;
l9_867=l9_886;
float4 l9_887=l9_867;
float4 l9_888=l9_887;
float4 l9_889=l9_888;
float4 renderTarget1Sample_4=l9_889;
Scalar4=renderTarget1Sample_4.x;
Scalar5=renderTarget1Sample_4.y;
Scalar6=renderTarget1Sample_4.z;
Scalar7=renderTarget1Sample_4.w;
float2 param_76=uv;
int l9_890=0;
if ((int(renderTarget2HasSwappedViews_tmp)!=0))
{
int l9_891=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_891=0;
}
else
{
l9_891=gl_InstanceIndex%2;
}
int l9_892=l9_891;
l9_890=1-l9_892;
}
else
{
int l9_893=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_893=0;
}
else
{
l9_893=gl_InstanceIndex%2;
}
int l9_894=l9_893;
l9_890=l9_894;
}
int l9_895=l9_890;
float2 l9_896=param_76;
int l9_897=l9_895;
float2 l9_898=l9_896;
int l9_899=l9_897;
float l9_900=0.0;
float4 l9_901=float4(0.0);
float2 l9_902=l9_898;
int l9_903=l9_899;
float l9_904=l9_900;
float4 l9_905=float4(0.0);
float2 l9_906=l9_902;
int l9_907=renderTarget2Layout_tmp;
int l9_908=l9_903;
float l9_909=l9_904;
float2 l9_910=l9_906;
int l9_911=l9_907;
int l9_912=l9_908;
float3 l9_913=float3(0.0);
if (l9_911==0)
{
l9_913=float3(l9_910,0.0);
}
else
{
if (l9_911==1)
{
l9_913=float3(l9_910.x,(l9_910.y*0.5)+(0.5-(float(l9_912)*0.5)),0.0);
}
else
{
l9_913=float3(l9_910,float(l9_912));
}
}
float3 l9_914=l9_913;
float3 l9_915=l9_914;
float2 l9_916=l9_915.xy;
float l9_917=l9_909;
float4 l9_918=renderTarget2.sample(renderTarget2SmpSC,l9_916,level(l9_917));
float4 l9_919=l9_918;
l9_905=l9_919;
float4 l9_920=l9_905;
l9_901=l9_920;
float4 l9_921=l9_901;
float4 l9_922=l9_921;
float4 l9_923=l9_922;
float4 renderTarget2Sample_4=l9_923;
Scalar8=renderTarget2Sample_4.x;
Scalar9=renderTarget2Sample_4.y;
Scalar10=renderTarget2Sample_4.z;
Scalar11=renderTarget2Sample_4.w;
float2 param_77=uv;
int l9_924=0;
if ((int(renderTarget3HasSwappedViews_tmp)!=0))
{
int l9_925=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_925=0;
}
else
{
l9_925=gl_InstanceIndex%2;
}
int l9_926=l9_925;
l9_924=1-l9_926;
}
else
{
int l9_927=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_927=0;
}
else
{
l9_927=gl_InstanceIndex%2;
}
int l9_928=l9_927;
l9_924=l9_928;
}
int l9_929=l9_924;
float2 l9_930=param_77;
int l9_931=l9_929;
float2 l9_932=l9_930;
int l9_933=l9_931;
float l9_934=0.0;
float4 l9_935=float4(0.0);
float2 l9_936=l9_932;
int l9_937=l9_933;
float l9_938=l9_934;
float4 l9_939=float4(0.0);
float2 l9_940=l9_936;
int l9_941=renderTarget3Layout_tmp;
int l9_942=l9_937;
float l9_943=l9_938;
float2 l9_944=l9_940;
int l9_945=l9_941;
int l9_946=l9_942;
float3 l9_947=float3(0.0);
if (l9_945==0)
{
l9_947=float3(l9_944,0.0);
}
else
{
if (l9_945==1)
{
l9_947=float3(l9_944.x,(l9_944.y*0.5)+(0.5-(float(l9_946)*0.5)),0.0);
}
else
{
l9_947=float3(l9_944,float(l9_946));
}
}
float3 l9_948=l9_947;
float3 l9_949=l9_948;
float2 l9_950=l9_949.xy;
float l9_951=l9_943;
float4 l9_952=renderTarget3.sample(renderTarget3SmpSC,l9_950,level(l9_951));
float4 l9_953=l9_952;
l9_939=l9_953;
float4 l9_954=l9_939;
l9_935=l9_954;
float4 l9_955=l9_935;
float4 l9_956=l9_955;
float4 l9_957=l9_956;
float4 renderTarget3Sample_4=l9_957;
Scalar12=renderTarget3Sample_4.x;
Scalar13=renderTarget3Sample_4.y;
Scalar14=renderTarget3Sample_4.z;
Scalar15=renderTarget3Sample_4.w;
float param_78=Scalar0;
float param_79=0.0;
float param_80=255.0;
float l9_958=param_78;
float l9_959=param_79;
float l9_960=param_80;
float l9_961=1.0;
float l9_962=l9_958;
#if (1)
{
l9_962=floor((l9_962*255.0)+0.5)/255.0;
}
#endif
float l9_963=l9_962;
float l9_964=l9_963;
float l9_965=0.0;
float l9_966=l9_961;
float l9_967=l9_959;
float l9_968=l9_960;
float l9_969=l9_967+(((l9_964-l9_965)*(l9_968-l9_967))/(l9_966-l9_965));
float l9_970=l9_969;
float l9_971=l9_970;
gParticle.collisionCount_N134=l9_971;
float4 param_81=gParticle.Quaternion;
param_81=normalize(param_81.yzwx);
float l9_972=param_81.x*param_81.x;
float l9_973=param_81.y*param_81.y;
float l9_974=param_81.z*param_81.z;
float l9_975=param_81.x*param_81.z;
float l9_976=param_81.x*param_81.y;
float l9_977=param_81.y*param_81.z;
float l9_978=param_81.w*param_81.x;
float l9_979=param_81.w*param_81.y;
float l9_980=param_81.w*param_81.z;
float3x3 l9_981=float3x3(float3(1.0-(2.0*(l9_973+l9_974)),2.0*(l9_976+l9_980),2.0*(l9_975-l9_979)),float3(2.0*(l9_976-l9_980),1.0-(2.0*(l9_972+l9_974)),2.0*(l9_977+l9_978)),float3(2.0*(l9_975+l9_979),2.0*(l9_977-l9_978),1.0-(2.0*(l9_972+l9_973))));
gParticle.Matrix=l9_981;
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
int N7_FacingMode=0;
int N7_Alignment=0;
float N7_VelocityStretchAmount=0.0;
float2 N7_PivotPoint=float2(0.0);
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
bool l9_4=l9_3>=(60*((*sc_set0.UserUniforms).vfxNumCopies+1));
ssParticle gParticle;
bool l9_5;
if (!l9_4)
{
int l9_6=gl_InstanceIndex;
l9_5=((*sc_set0.UserUniforms).vfxBatchEnable[l9_6/60]!=0)==false;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_17/60];
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
out.varPos=gParticle.Position+(gParticle.Matrix*float3(v.position.x*gParticle.Size,v.position.y*gParticle.Size,0.0));
out.varNormal=gParticle.Matrix*float3(0.0,0.0,1.0);
float3 l9_35=gParticle.Matrix*float3(1.0,0.0,0.0);
out.varTangent=float4(l9_35.x,l9_35.y,l9_35.z,out.varTangent.w);
out.varTangent.w=1.0;
out.varPackedTex=float4(v.texture0,v.texture1);
float Value_N2=0.0;
Value_N2=1.0;
float Value_N3=0.0;
Value_N3=0.0;
float Value_N4=0.0;
Value_N4=(*sc_set0.UserUniforms).Port_Import_N004;
float2 Value_N6=float2(0.0);
Value_N6=fast::clamp((*sc_set0.UserUniforms).Port_Import_N006,float2(-0.5),float2(0.5));
float param_5=Value_N2;
float param_6=Value_N3;
float param_7=Value_N4;
float2 param_8=Value_N6;
ssGlobals param_9=Globals;
ssGlobals tempGlobals=param_9;
N7_FacingMode=int(param_5);
N7_Alignment=int(param_6);
N7_VelocityStretchAmount=param_7;
N7_PivotPoint=param_8;
float l9_36=0.029999999;
float3 l9_37=float3(0.0,1.0,0.0);
float3 l9_38=gParticle.Velocity;
float l9_39=length(l9_38);
float l9_40=fast::max(l9_39*N7_VelocityStretchAmount,1.0);
if ((l9_39<l9_36)||(N7_VelocityStretchAmount<9.9999997e-05))
{
if (N7_Alignment==1)
{
int l9_41=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_41=0;
}
else
{
l9_41=gl_InstanceIndex%2;
}
int l9_42=l9_41;
float3 l9_43=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_42][1].xyz;
l9_37=l9_43;
}
}
else
{
float3 l9_44=gParticle.Velocity;
l9_37=normalize(l9_44);
}
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
float4x4 l9_47=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_46];
float3 l9_48=l9_47[2].xyz;
if (N7_FacingMode==0)
{
float3 l9_49=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_50=gParticle.Position;
l9_48=l9_49-l9_50;
}
l9_48=normalize(l9_48);
float3 l9_51=normalize(cross(l9_48,l9_37));
float3 l9_52=normalize(cross(l9_51,l9_48));
float2 l9_53=tempGlobals.Surface_UVCoord0;
float2 l9_54=(l9_53-float2(0.5))+N7_PivotPoint;
float4x4 l9_55=float4x4(float4(gParticle.Matrix[0].x,gParticle.Matrix[0].y,gParticle.Matrix[0].z,0.0),float4(gParticle.Matrix[1].x,gParticle.Matrix[1].y,gParticle.Matrix[1].z,0.0),float4(gParticle.Matrix[2].x,gParticle.Matrix[2].y,gParticle.Matrix[2].z,0.0),float4(0.0,0.0,0.0,1.0));
l9_54=(l9_55*float4(l9_54,0.0,1.0)).xy;
float3 l9_56=gParticle.Position;
float3 l9_57=l9_56;
float l9_58=gParticle.Size;
l9_57+=((-l9_51)*(l9_58*l9_54.x));
float l9_59=gParticle.Size;
l9_57+=(l9_52*((l9_59*l9_54.y)*l9_40));
float3 l9_60=l9_57;
out.varPos=l9_60;
float3 l9_61=l9_52;
out.varTangent=float4(l9_61.x,l9_61.y,l9_61.z,out.varTangent.w);
float3 l9_62=l9_48;
out.varNormal=l9_62;
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
float4 clipPosition=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_64]*float4(out.varPos,1.0);
float4 param_10=clipPosition;
if (sc_DepthBufferMode_tmp==1)
{
int l9_65=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_65=0;
}
else
{
l9_65=gl_InstanceIndex%2;
}
int l9_66=l9_65;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_66][2].w!=0.0)
{
float l9_67=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
param_10.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+param_10.w))*l9_67)-1.0)*param_10.w;
}
}
float4 l9_68=param_10;
clipPosition=l9_68;
float4 param_11=clipPosition;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_11.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_69=param_11;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_70=dot(l9_69,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_71=l9_70;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_71;
}
}
float4 l9_72=float4(param_11.x,-param_11.y,(param_11.z*0.5)+(param_11.w*0.5),param_11.w);
out.gl_Position=l9_72;
int l9_73=gl_InstanceIndex;
out.Interp_Particle_Index=l9_73;
out.Interp_Particle_Force=gParticle.Force;
out.Interp_Particle_Position=gParticle.Position;
out.Interp_Particle_Velocity=gParticle.Velocity;
out.Interp_Particle_Life=gParticle.Life;
out.Interp_Particle_Age=gParticle.Age;
out.Interp_Particle_Size=gParticle.Size;
out.Interp_Particle_Color=gParticle.Color;
out.Interp_Particle_Quaternion=gParticle.Quaternion;
out.Interp_Particle_collisionCount_N134=gParticle.collisionCount_N134;
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
float collisionCount_N134;
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
float Port_Import_N004;
float2 Port_Import_N006;
float Port_AlphaTestThreshold_N039;
float2 Port_Input1_N131;
float Port_Input1_N153;
float Port_Import_N286;
float Port_Import_N288;
float Port_Input1_N290;
float Port_Input2_N290;
float Port_Input1_N294;
};
struct sc_Set0
{
texture2d<float> intensityTexture [[id(0)]];
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler renderTarget0SmpSC [[id(20)]];
sampler renderTarget1SmpSC [[id(21)]];
sampler renderTarget2SmpSC [[id(22)]];
sampler renderTarget3SmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(31)]];
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
float Interp_Particle_collisionCount_N134 [[user(locn22)]];
float Interp_Particle_Mass [[user(locn23)]];
float gParticlesDebug [[user(locn24)]];
float2 ParticleUV [[user(locn25)]];
};
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
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
gParticle.collisionCount_N134=in.Interp_Particle_collisionCount_N134;
gParticle.Mass=in.Interp_Particle_Mass;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[in.Interp_Particle_Index/60];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Globals.Surface_UVCoord0=ngsTempUVCoord0;
int param=in.Interp_Particle_Index;
ssParticle param_1=gParticle;
int l9_0=param/60;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%60;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(60*((param/60)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%60,l9_1/60);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/60.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(60.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/59.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/59.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(59.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
float2 l9_13=float2(param_1.Ratio1D)*float2(0.3452,0.52253997);
float l9_14=dot(l9_13,float2(0.98253,0.72662002));
l9_14=sin(l9_14)*479.371;
l9_14=fract(l9_14);
l9_14=floor(l9_14*10000.0)*9.9999997e-05;
float l9_15=l9_14;
param_1.TimeShift=l9_15;
param_1.TimeShift=0.0;
param_1.SpawnOffset=floor(param_1.Index1DPerCopyF/30.0)*6.6666698;
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
l9_16.Seed+=(floor(((((l9_19-l9_16.SpawnOffset)-0.0)+0.0)+26.666599)/13.3333)*4.32723);
l9_16.Seed=fract(abs(l9_16.Seed));
int2 l9_20=int2(l9_16.Index1D%400,l9_16.Index1D/400);
l9_16.Seed2000=(float2(l9_20)+float2(1.0))/float2(399.0);
param_1=l9_16;
gParticle=param_1;
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
Output_Color0=gParticle.Color;
float4 Value_N292=float4(0.0);
Value_N292=gParticle.Color;
float2 UVCoord_N120=float2(0.0);
UVCoord_N120=Globals.Surface_UVCoord0;
float Output_N131=0.0;
Output_N131=distance(UVCoord_N120,(*sc_set0.UserUniforms).Port_Input1_N131);
float Output_N153=0.0;
Output_N153=Output_N131*(*sc_set0.UserUniforms).Port_Input1_N153;
float Output_N261=0.0;
Output_N261=1.0-Output_N153;
float Value_N286=0.0;
Value_N286=(*sc_set0.UserUniforms).Port_Import_N286;
float Output_N287=0.0;
float l9_21;
if (Output_N261<=0.0)
{
l9_21=0.0;
}
else
{
l9_21=pow(Output_N261,Value_N286);
}
Output_N287=l9_21;
float Value_N288=0.0;
Value_N288=(*sc_set0.UserUniforms).Port_Import_N288;
float Output_N289=0.0;
Output_N289=Output_N287*Value_N288;
float Output_N290=0.0;
Output_N290=fast::clamp(Output_N289+0.001,(*sc_set0.UserUniforms).Port_Input1_N290+0.001,(*sc_set0.UserUniforms).Port_Input2_N290+0.001)-0.001;
float Export_N291=0.0;
Export_N291=Output_N290;
float Output_N294=0.0;
Output_N294=float(Export_N291<(*sc_set0.UserUniforms).Port_Input1_N294);
float4 Output_N293=float4(0.0);
float4 param_2=Value_N292;
float param_3=Output_N294;
float4 param_4=param_2;
if ((param_3*1.0)!=0.0)
{
discard_fragment();
}
Output_N293=param_4;
float4 param_5=Output_N293;
Output_Color0=param_5;
float4 param_6=Output_Color0;
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_6=float4(param_6.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_22=param_6;
float4 l9_23=float4(0.0);
float4 l9_24=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_25=out.FragColor0;
float4 l9_26=l9_25;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_26.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_27=l9_26;
l9_24=l9_27;
}
else
{
float4 l9_28=gl_FragCoord;
float2 l9_29=l9_28.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_30=l9_29;
float2 l9_31=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_32=1;
int l9_33=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_33=0;
}
else
{
l9_33=in.varStereoViewID;
}
int l9_34=l9_33;
int l9_35=l9_34;
float3 l9_36=float3(l9_30,0.0);
int l9_37=l9_32;
int l9_38=l9_35;
if (l9_37==1)
{
l9_36.y=((2.0*l9_36.y)+float(l9_38))-1.0;
}
float2 l9_39=l9_36.xy;
l9_31=l9_39;
}
else
{
l9_31=l9_30;
}
float2 l9_40=l9_31;
float2 l9_41=l9_40;
float2 l9_42=l9_41;
int l9_43=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_44=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_44=0;
}
else
{
l9_44=in.varStereoViewID;
}
int l9_45=l9_44;
l9_43=1-l9_45;
}
else
{
int l9_46=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_46=0;
}
else
{
l9_46=in.varStereoViewID;
}
int l9_47=l9_46;
l9_43=l9_47;
}
int l9_48=l9_43;
float2 l9_49=l9_42;
int l9_50=l9_48;
float2 l9_51=l9_49;
int l9_52=l9_50;
float l9_53=0.0;
float4 l9_54=float4(0.0);
float2 l9_55=l9_51;
int l9_56=sc_ScreenTextureLayout_tmp;
int l9_57=l9_52;
float l9_58=l9_53;
float2 l9_59=l9_55;
int l9_60=l9_56;
int l9_61=l9_57;
float3 l9_62=float3(0.0);
if (l9_60==0)
{
l9_62=float3(l9_59,0.0);
}
else
{
if (l9_60==1)
{
l9_62=float3(l9_59.x,(l9_59.y*0.5)+(0.5-(float(l9_61)*0.5)),0.0);
}
else
{
l9_62=float3(l9_59,float(l9_61));
}
}
float3 l9_63=l9_62;
float3 l9_64=l9_63;
float2 l9_65=l9_64.xy;
float l9_66=l9_58;
float4 l9_67=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_65,bias(l9_66));
float4 l9_68=l9_67;
l9_54=l9_68;
float4 l9_69=l9_54;
float4 l9_70=l9_69;
float4 l9_71=l9_70;
l9_24=l9_71;
}
float4 l9_72=l9_24;
float4 l9_73=l9_72;
float3 l9_74=l9_73.xyz;
float3 l9_75=l9_74;
float3 l9_76=l9_22.xyz;
float3 l9_77=definedBlend(l9_75,l9_76,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_23=float4(l9_77.x,l9_77.y,l9_77.z,l9_23.w);
float3 l9_78=mix(l9_74,l9_23.xyz,float3(l9_22.w));
l9_23=float4(l9_78.x,l9_78.y,l9_78.z,l9_23.w);
l9_23.w=1.0;
float4 l9_79=l9_23;
param_6=l9_79;
}
else
{
float4 l9_80=param_6;
float4 l9_81=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_81=float4(mix(float3(1.0),l9_80.xyz,float3(l9_80.w)),l9_80.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_82=l9_80.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_82=fast::clamp(l9_82,0.0,1.0);
}
l9_81=float4(l9_80.xyz*l9_82,l9_82);
}
else
{
l9_81=l9_80;
}
}
float4 l9_83=l9_81;
param_6=l9_83;
}
}
float4 l9_84=param_6;
Output_Color0=l9_84;
float4 l9_85=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_85=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_85=float4(0.0);
}
float4 l9_86=l9_85;
float4 Cost=l9_86;
if (Cost.w>0.0)
{
Output_Color0=Cost;
}
float4 param_7=Output_Color0;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_7.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_7;
return out;
}
} // FRAGMENT SHADER
