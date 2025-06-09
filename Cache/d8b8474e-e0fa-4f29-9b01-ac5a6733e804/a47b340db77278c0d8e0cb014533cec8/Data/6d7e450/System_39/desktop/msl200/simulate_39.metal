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
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec3 normal 1
//attribute vec4 tangent 2
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler noiseTexSmpSC 0:21
//sampler sampler renderTarget0SmpSC 0:22
//sampler sampler renderTarget1SmpSC 0:23
//sampler sampler renderTarget2SmpSC 0:24
//sampler sampler renderTarget3SmpSC 0:25
//texture texture3D noiseTex 0:1:0:21
//texture texture2D renderTarget0 0:2:0:22
//texture texture2D renderTarget1 0:3:0:23
//texture texture2D renderTarget2 0:4:0:24
//texture texture2D renderTarget3 0:5:0:25
//ubo int UserUniforms 0:33:7920 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_StereoClipPlanes 3664:[2]:16
//float overrideTimeElapsed 3984:[32]:4
//float overrideTimeDelta 4112
//bool vfxBatchEnable 4120:[32]:4
//int vfxOffsetInstancesRead 7108
//int vfxOffsetInstancesWrite 7112
//float2 vfxTargetSizeRead 7120
//float2 vfxTargetSizeWrite 7128
//int vfxTargetWidth 7136
//bool isIdle 7140
//float3 influencePosition 7152
//bool isAttracting 7168
//float4 colorA 7216
//float4 colorB 7232
//float4 colorC 7248
//float4 colorD 7264
//float4 colorE 7280
//float Port_TimeBias_N052 7296
//float Port_ValueA_N052 7300
//float Port_TimeA_N052 7304
//float Port_TimeTransition_N052 7308
//float Port_ValueB_N052 7312
//float Port_TimeB_N052 7316
//float Port_Input1_N053 7320
//float3 Port_Min_N213 7344
//float3 Port_Max_N213 7360
//float Port_Min_N254 7376
//float Port_Max_N254 7380
//float Port_Input1_N021 7384
//float Port_Input1_N067 7388
//float Port_Input2_N067 7392
//float3 Port_Import_N212 7408
//float3 Port_Import_N075 7424
//float3 Port_Import_N076 7440
//float Port_Import_N058 7460
//float3 Port_Input2_N060 7488
//float Port_Import_N099 7504
//float Port_Import_N109 7508
//float3 Port_Import_N081 7520
//float Port_RangeMinA_N178 7536
//float Port_RangeMaxA_N178 7540
//float Port_RangeMinB_N178 7544
//float Port_RangeMaxB_N178 7548
//float Port_Value4_N102 7556
//float Port_Value4_N117 7560
//float Port_Value4_N126 7564
//float4 Port_Column3_N127 7568
//float Port_RangeMinA_N133 7584
//float Port_RangeMaxA_N133 7588
//float Port_Input1_N114 7592
//float Port_Input2_N114 7596
//float Port_RangeMaxB_N133 7600
//float Port_Input1_N018 7604
//float Port_Input1_N066 7608
//float Port_Input2_N066 7612
//float Port_Input1_N237 7648
//float Port_Input1_N201 7652
//float Port_Input2_N201 7656
//float3 Port_Import_N205 7680
//float3 Port_Import_N206 7696
//float Port_Multiplier_N207 7712
//float3 Port_Import_N210 7728
//float Port_Input1_N222 7744
//float Port_Input1_N229 7748
//float Port_Import_N049 7752
//float Port_Import_N051 7756
//float Port_Import_N050 7760
//float Port_Input4_N224 7764
//float Port_Input1_N241 7768
//float Port_Input1_N200 7772
//float Port_Input2_N200 7776
//float Port_Input1_N063 7784
//float Port_Input2_N063 7788
//float Port_Input1_N008 7796
//float4 Port_Input1_N065 7808
//float Port_Min_N019 7824
//float Port_Max_N019 7828
//float Port_Input1_N166 7832
//float Port_Input1_N164 7836
//float Port_Input1_N165 7840
//float Port_Input2_N165 7844
//float Port_Position1_N172 7848
//float Port_Position2_N172 7852
//float Port_Position3_N172 7856
//float Port_Import_N079 7860
//float Port_Import_N091 7864
//float Port_Input0_N143 7872
//float Port_Input1_N266 7876
//float Port_Input2_N266 7880
//float Port_Input1_N182 7892
//float Port_Input2_N182 7896
//float Port_Input0_N193 7900
//float Port_Import_N188 7904
//float Port_Input1_N236 7912
//float Port_Input2_N236 7916
//}
//spec_const bool renderTarget0HasSwappedViews 0 0
//spec_const bool renderTarget1HasSwappedViews 1 0
//spec_const bool renderTarget2HasSwappedViews 2 0
//spec_const bool renderTarget3HasSwappedViews 3 0
//spec_const int renderTarget0Layout 4 0
//spec_const int renderTarget1Layout 5 0
//spec_const int renderTarget2Layout 6 0
//spec_const int renderTarget3Layout 7 0
//spec_const int sc_ShaderCacheConstant 8 0
//spec_const int sc_StereoRenderingMode 9 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 10 0
//SG_REFLECTION_END
constant bool renderTarget0HasSwappedViews [[function_constant(0)]];
constant bool renderTarget0HasSwappedViews_tmp = is_function_constant_defined(renderTarget0HasSwappedViews) ? renderTarget0HasSwappedViews : false;
constant bool renderTarget1HasSwappedViews [[function_constant(1)]];
constant bool renderTarget1HasSwappedViews_tmp = is_function_constant_defined(renderTarget1HasSwappedViews) ? renderTarget1HasSwappedViews : false;
constant bool renderTarget2HasSwappedViews [[function_constant(2)]];
constant bool renderTarget2HasSwappedViews_tmp = is_function_constant_defined(renderTarget2HasSwappedViews) ? renderTarget2HasSwappedViews : false;
constant bool renderTarget3HasSwappedViews [[function_constant(3)]];
constant bool renderTarget3HasSwappedViews_tmp = is_function_constant_defined(renderTarget3HasSwappedViews) ? renderTarget3HasSwappedViews : false;
constant int renderTarget0Layout [[function_constant(4)]];
constant int renderTarget0Layout_tmp = is_function_constant_defined(renderTarget0Layout) ? renderTarget0Layout : 0;
constant int renderTarget1Layout [[function_constant(5)]];
constant int renderTarget1Layout_tmp = is_function_constant_defined(renderTarget1Layout) ? renderTarget1Layout : 0;
constant int renderTarget2Layout [[function_constant(6)]];
constant int renderTarget2Layout_tmp = is_function_constant_defined(renderTarget2Layout) ? renderTarget2Layout : 0;
constant int renderTarget3Layout [[function_constant(7)]];
constant int renderTarget3Layout_tmp = is_function_constant_defined(renderTarget3Layout) ? renderTarget3Layout : 0;
constant int sc_ShaderCacheConstant [[function_constant(8)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_StereoRenderingMode [[function_constant(9)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(10)]];
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
int isIdle;
float3 influencePosition;
int isAttracting;
float4 noiseTexSize;
float2 noiseTexDepth;
float4 colorA;
float4 colorB;
float4 colorC;
float4 colorD;
float4 colorE;
float Port_TimeBias_N052;
float Port_ValueA_N052;
float Port_TimeA_N052;
float Port_TimeTransition_N052;
float Port_ValueB_N052;
float Port_TimeB_N052;
float Port_Input1_N053;
float3 Port_Import_N216;
float3 Port_Min_N213;
float3 Port_Max_N213;
float Port_Min_N254;
float Port_Max_N254;
float Port_Input1_N021;
float Port_Input1_N067;
float Port_Input2_N067;
float Port_Import_N214;
float3 Port_Import_N212;
float3 Port_Import_N075;
float3 Port_Import_N076;
float Port_Import_N062;
float Port_Import_N058;
float3 Port_Import_N059;
float3 Port_Input2_N060;
float Port_Import_N099;
float Port_Import_N109;
float3 Port_Import_N081;
float Port_RangeMinA_N178;
float Port_RangeMaxA_N178;
float Port_RangeMinB_N178;
float Port_RangeMaxB_N178;
float Port_Import_N087;
float Port_Value4_N102;
float Port_Value4_N117;
float Port_Value4_N126;
float4 Port_Column3_N127;
float Port_RangeMinA_N133;
float Port_RangeMaxA_N133;
float Port_Input1_N114;
float Port_Input2_N114;
float Port_RangeMaxB_N133;
float Port_Input1_N018;
float Port_Input1_N066;
float Port_Input2_N066;
float Port_Import_N308;
float3 Port_Import_N309;
float Port_Input1_N237;
float Port_Input1_N201;
float Port_Input2_N201;
float3 Port_Import_N202;
float3 Port_Import_N205;
float3 Port_Import_N206;
float Port_Multiplier_N207;
float3 Port_Import_N210;
float Port_Input1_N222;
float Port_Input1_N229;
float Port_Import_N049;
float Port_Import_N051;
float Port_Import_N050;
float Port_Input4_N224;
float Port_Input1_N241;
float Port_Input1_N200;
float Port_Input2_N200;
float Port_Import_N150;
float Port_Input1_N063;
float Port_Input2_N063;
float Port_Import_N155;
float Port_Input1_N008;
float4 Port_Input1_N065;
float Port_Min_N019;
float Port_Max_N019;
float Port_Input1_N166;
float Port_Input1_N164;
float Port_Input1_N165;
float Port_Input2_N165;
float Port_Position1_N172;
float Port_Position2_N172;
float Port_Position3_N172;
float Port_Import_N079;
float Port_Import_N091;
float Port_Import_N191;
float Port_Input0_N143;
float Port_Input1_N266;
float Port_Input2_N266;
float Port_Import_N185;
float Port_Import_N138;
float Port_Input1_N182;
float Port_Input2_N182;
float Port_Input0_N193;
float Port_Import_N188;
float Port_Import_N192;
float Port_Input1_N236;
float Port_Input2_N236;
};
struct sc_Set0
{
texture3d<float> noiseTex [[id(1)]];
texture2d<float> renderTarget0 [[id(2)]];
texture2d<float> renderTarget1 [[id(3)]];
texture2d<float> renderTarget2 [[id(4)]];
texture2d<float> renderTarget3 [[id(5)]];
sampler noiseTexSmpSC [[id(21)]];
sampler renderTarget0SmpSC [[id(22)]];
sampler renderTarget1SmpSC [[id(23)]];
sampler renderTarget2SmpSC [[id(24)]];
sampler renderTarget3SmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(33)]];
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
float4 matrixToQuaternion(thread const float3x3& m)
{
float fourXSquaredMinus1=(m[0].x-m[1].y)-m[2].z;
float fourYSquaredMinus1=(m[1].y-m[0].x)-m[2].z;
float fourZSquaredMinus1=(m[2].z-m[0].x)-m[1].y;
float fourWSquaredMinus1=(m[0].x+m[1].y)+m[2].z;
int biggestIndex=0;
float fourBiggestSquaredMinus1=fourWSquaredMinus1;
if (fourXSquaredMinus1>fourBiggestSquaredMinus1)
{
fourBiggestSquaredMinus1=fourXSquaredMinus1;
biggestIndex=1;
}
if (fourYSquaredMinus1>fourBiggestSquaredMinus1)
{
fourBiggestSquaredMinus1=fourYSquaredMinus1;
biggestIndex=2;
}
if (fourZSquaredMinus1>fourBiggestSquaredMinus1)
{
fourBiggestSquaredMinus1=fourZSquaredMinus1;
biggestIndex=3;
}
float biggestVal=sqrt(fourBiggestSquaredMinus1+1.0)*0.5;
float mult=0.25/biggestVal;
if (biggestIndex==0)
{
return float4(biggestVal,(m[1].z-m[2].y)*mult,(m[2].x-m[0].z)*mult,(m[0].y-m[1].x)*mult);
}
else
{
if (biggestIndex==1)
{
return float4((m[1].z-m[2].y)*mult,biggestVal,(m[0].y+m[1].x)*mult,(m[2].x+m[0].z)*mult);
}
else
{
if (biggestIndex==2)
{
return float4((m[2].x-m[0].z)*mult,(m[0].y+m[1].x)*mult,biggestVal,(m[1].z+m[2].y)*mult);
}
else
{
if (biggestIndex==3)
{
return float4((m[0].y-m[1].x)*mult,(m[2].x+m[0].z)*mult,(m[1].z+m[2].y)*mult,biggestVal);
}
else
{
return float4(1.0,0.0,0.0,0.0);
}
}
}
}
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t v=l9_1;
int l9_2=gl_InstanceIndex;
int InstanceID=l9_2;
int param=InstanceID;
ssParticle gParticle;
bool l9_3=ssDecodeParticle(param,gl_InstanceIndex,(*sc_set0.UserUniforms),sc_set0.renderTarget0,sc_set0.renderTarget0SmpSC,sc_set0.renderTarget1,sc_set0.renderTarget1SmpSC,sc_set0.renderTarget2,sc_set0.renderTarget2SmpSC,sc_set0.renderTarget3,sc_set0.renderTarget3SmpSC,gParticle);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
int l9_4=gl_InstanceIndex;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_4/1000];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
gParticle.Age=Globals.gTimeElapsedShifted;
if (gParticle.Life<0.1)
{
ssGlobals param_1=Globals;
ssParticle l9_5=gParticle;
l9_5.Seed=(l9_5.Ratio1D*0.97637898)+0.151235;
int2 l9_6=int2(l9_5.Index1D%400,l9_5.Index1D/400);
l9_5.Seed2000=(float2(l9_6)+float2(1.0))/float2(399.0);
gParticle=l9_5;
float l9_7=31.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_7)))/l9_7)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_7))/l9_7)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=8.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
float3 l9_8=float3(0.0);
float l9_9=1.0;
float3 l9_10=float3(0.0);
float3 l9_11=float3(0.0);
ssGlobals l9_12=param_1;
float l9_13=0.0;
float l9_14=float((*sc_set0.UserUniforms).isIdle!=0);
l9_13=l9_14;
l9_9=l9_13;
float3 l9_15;
if ((l9_9*1.0)!=0.0)
{
float l9_16=0.0;
float l9_17=(*sc_set0.UserUniforms).Port_TimeBias_N052;
float l9_18=(*sc_set0.UserUniforms).Port_ValueA_N052;
float l9_19=(*sc_set0.UserUniforms).Port_TimeA_N052;
float l9_20=(*sc_set0.UserUniforms).Port_TimeTransition_N052;
float l9_21=(*sc_set0.UserUniforms).Port_ValueB_N052;
float l9_22=(*sc_set0.UserUniforms).Port_TimeB_N052;
ssGlobals l9_23=l9_12;
float l9_24=((l9_19+l9_20)+l9_22)+9.9999997e-05;
float l9_25=l9_19/l9_24;
float l9_26=1.0-(l9_22/l9_24);
float l9_27=(mod((l9_23.gTimeElapsedShifted/l9_24)+l9_17,1.0)*2.0)-1.0;
float l9_28=abs(l9_27);
float l9_29=mix(l9_18,l9_21,smoothstep(l9_25,l9_26,l9_28));
l9_16=l9_29;
float l9_30=0.0;
l9_30=l9_16*(*sc_set0.UserUniforms).Port_Input1_N053;
float3 l9_31=float3(0.0);
l9_31=float3(float2(l9_30).x,float2(l9_30).y,0.0);
l9_10=l9_31;
l9_15=l9_10;
}
else
{
float3 l9_32=float3(0.0);
float3 l9_33=(*sc_set0.UserUniforms).influencePosition;
l9_32=l9_33;
l9_11=l9_32;
l9_15=l9_11;
}
l9_8=l9_15;
float3 l9_34=float3(0.0);
l9_34=l9_8;
float3 l9_35=float3(0.0);
float3 l9_36=(*sc_set0.UserUniforms).Port_Min_N213;
float3 l9_37=(*sc_set0.UserUniforms).Port_Max_N213;
ssGlobals l9_38=param_1;
int l9_39=3;
bool l9_40=true;
bool l9_41=true;
bool l9_42=true;
float l9_43=213.0;
ssParticle l9_44=gParticle;
float l9_45=1.0;
float l9_46=l9_38.gTimeElapsed;
float4 l9_47=float4(0.0);
float4 l9_48=float4(1.0);
float l9_49=1.0;
float2 l9_50=float2(1.0);
if (l9_40)
{
l9_48=float4(fract(l9_46*10.0));
l9_48=floor(l9_48*10000.0)*9.9999997e-05;
l9_48=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_48;
}
if (l9_41)
{
l9_49=1.0+((l9_43+1.0)*0.0099999998);
}
if (l9_42)
{
l9_50=l9_44.Seed2000;
}
l9_45=(l9_45+1.0)*0.5;
if (l9_39>=1)
{
float2 l9_51=(((float2(0.2353,0.78750002)*l9_50)*l9_49)*l9_48.x)*l9_45;
float l9_52=dot(l9_51,float2(0.98253,0.72662002));
l9_52=sin(l9_52)*479.371;
l9_52=fract(l9_52);
l9_52=floor(l9_52*10000.0)*9.9999997e-05;
float l9_53=l9_52;
l9_47.x=l9_53;
}
if (l9_39>=2)
{
float2 l9_54=(((float2(0.5751,0.62730002)*l9_50)*l9_49)*l9_48.y)*l9_45;
float l9_55=dot(l9_54,float2(0.98253,0.72662002));
l9_55=sin(l9_55)*479.371;
l9_55=fract(l9_55);
l9_55=floor(l9_55*10000.0)*9.9999997e-05;
float l9_56=l9_55;
l9_47.y=l9_56;
}
if (l9_39>=3)
{
float2 l9_57=(((float2(0.6947,0.52170002)*l9_50)*l9_49)*l9_48.z)*l9_45;
float l9_58=dot(l9_57,float2(0.98253,0.72662002));
l9_58=sin(l9_58)*479.371;
l9_58=fract(l9_58);
l9_58=floor(l9_58*10000.0)*9.9999997e-05;
float l9_59=l9_58;
l9_47.z=l9_59;
}
if (l9_39>=4)
{
float2 l9_60=(((float2(0.47889999,0.39669999)*l9_50)*l9_49)*l9_48.w)*l9_45;
float l9_61=dot(l9_60,float2(0.98253,0.72662002));
l9_61=sin(l9_61)*479.371;
l9_61=fract(l9_61);
l9_61=floor(l9_61*10000.0)*9.9999997e-05;
float l9_62=l9_61;
l9_47.w=l9_62;
}
float4 l9_63=l9_47;
float4 l9_64=l9_63;
float3 l9_65=mix(l9_36,l9_37,l9_64.xyz);
l9_35=l9_65;
float l9_66=0.0;
l9_66=length(l9_35);
float3 l9_67=float3(0.0);
l9_67=l9_35/float3(l9_66);
float l9_68=0.0;
float l9_69=(*sc_set0.UserUniforms).Port_Min_N254;
float l9_70=(*sc_set0.UserUniforms).Port_Max_N254;
ssGlobals l9_71=param_1;
int l9_72=1;
bool l9_73=true;
bool l9_74=true;
bool l9_75=true;
float l9_76=254.0;
ssParticle l9_77=gParticle;
float l9_78=1.0;
float l9_79=l9_71.gTimeElapsed;
float4 l9_80=float4(0.0);
float4 l9_81=float4(1.0);
float l9_82=1.0;
float2 l9_83=float2(1.0);
if (l9_73)
{
l9_81=float4(fract(l9_79*10.0));
l9_81=floor(l9_81*10000.0)*9.9999997e-05;
l9_81=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_81;
}
if (l9_74)
{
l9_82=1.0+((l9_76+1.0)*0.0099999998);
}
if (l9_75)
{
l9_83=l9_77.Seed2000;
}
l9_78=(l9_78+1.0)*0.5;
if (l9_72>=1)
{
float2 l9_84=(((float2(0.2353,0.78750002)*l9_83)*l9_82)*l9_81.x)*l9_78;
float l9_85=dot(l9_84,float2(0.98253,0.72662002));
l9_85=sin(l9_85)*479.371;
l9_85=fract(l9_85);
l9_85=floor(l9_85*10000.0)*9.9999997e-05;
float l9_86=l9_85;
l9_80.x=l9_86;
}
if (l9_72>=2)
{
float2 l9_87=(((float2(0.5751,0.62730002)*l9_83)*l9_82)*l9_81.y)*l9_78;
float l9_88=dot(l9_87,float2(0.98253,0.72662002));
l9_88=sin(l9_88)*479.371;
l9_88=fract(l9_88);
l9_88=floor(l9_88*10000.0)*9.9999997e-05;
float l9_89=l9_88;
l9_80.y=l9_89;
}
if (l9_72>=3)
{
float2 l9_90=(((float2(0.6947,0.52170002)*l9_83)*l9_82)*l9_81.z)*l9_78;
float l9_91=dot(l9_90,float2(0.98253,0.72662002));
l9_91=sin(l9_91)*479.371;
l9_91=fract(l9_91);
l9_91=floor(l9_91*10000.0)*9.9999997e-05;
float l9_92=l9_91;
l9_80.z=l9_92;
}
if (l9_72>=4)
{
float2 l9_93=(((float2(0.47889999,0.39669999)*l9_83)*l9_82)*l9_81.w)*l9_78;
float l9_94=dot(l9_93,float2(0.98253,0.72662002));
l9_94=sin(l9_94)*479.371;
l9_94=fract(l9_94);
l9_94=floor(l9_94*10000.0)*9.9999997e-05;
float l9_95=l9_94;
l9_80.w=l9_95;
}
float4 l9_96=l9_80;
float4 l9_97=l9_96;
float l9_98=mix(l9_69,l9_70,l9_97.x);
l9_68=l9_98;
float l9_99=0.0;
float l9_100;
if (l9_68<=0.0)
{
l9_100=0.0;
}
else
{
l9_100=sqrt(l9_68);
}
l9_99=l9_100;
float l9_101=0.0;
float l9_102;
if (l9_99<=0.0)
{
l9_102=0.0;
}
else
{
l9_102=sqrt(l9_99);
}
l9_101=l9_102;
float l9_103=0.0;
float l9_104=1.0;
float l9_105=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_106=10.0;
float l9_107=0.0;
float l9_108=float((*sc_set0.UserUniforms).isIdle!=0);
l9_107=l9_108;
l9_104=l9_107;
float l9_109;
if ((l9_104*1.0)!=0.0)
{
l9_109=l9_105;
}
else
{
float l9_110=0.0;
float l9_111=1.0;
float l9_112=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_113=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_114=0.0;
float l9_115=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_114=l9_115;
l9_111=l9_114;
float l9_116;
if ((l9_111*1.0)!=0.0)
{
l9_116=l9_112;
}
else
{
l9_116=l9_113;
}
l9_110=l9_116;
l9_106=l9_110;
l9_109=l9_106;
}
l9_103=l9_109;
float l9_117=0.0;
l9_117=l9_103;
float3 l9_118=float3(0.0);
l9_118=(*sc_set0.UserUniforms).Port_Import_N212;
float3 l9_119=float3(0.0);
l9_119=((l9_67*float3(l9_101))*float3(l9_117))*l9_118;
float3 l9_120=float3(0.0);
l9_120=l9_34+l9_119;
gParticle.Position=l9_120;
float3 l9_121=float3(0.0);
l9_121=(*sc_set0.UserUniforms).Port_Import_N075;
float3 l9_122=float3(0.0);
l9_122=(*sc_set0.UserUniforms).Port_Import_N076;
float3 l9_123=float3(0.0);
float3 l9_124=l9_121;
float3 l9_125=l9_122;
ssGlobals l9_126=param_1;
int l9_127=3;
bool l9_128=true;
bool l9_129=true;
bool l9_130=true;
float l9_131=77.0;
ssParticle l9_132=gParticle;
float l9_133=1.0;
float l9_134=l9_126.gTimeElapsed;
float4 l9_135=float4(0.0);
float4 l9_136=float4(1.0);
float l9_137=1.0;
float2 l9_138=float2(1.0);
if (l9_128)
{
l9_136=float4(fract(l9_134*10.0));
l9_136=floor(l9_136*10000.0)*9.9999997e-05;
l9_136=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_136;
}
if (l9_129)
{
l9_137=1.0+((l9_131+1.0)*0.0099999998);
}
if (l9_130)
{
l9_138=l9_132.Seed2000;
}
l9_133=(l9_133+1.0)*0.5;
if (l9_127>=1)
{
float2 l9_139=(((float2(0.2353,0.78750002)*l9_138)*l9_137)*l9_136.x)*l9_133;
float l9_140=dot(l9_139,float2(0.98253,0.72662002));
l9_140=sin(l9_140)*479.371;
l9_140=fract(l9_140);
l9_140=floor(l9_140*10000.0)*9.9999997e-05;
float l9_141=l9_140;
l9_135.x=l9_141;
}
if (l9_127>=2)
{
float2 l9_142=(((float2(0.5751,0.62730002)*l9_138)*l9_137)*l9_136.y)*l9_133;
float l9_143=dot(l9_142,float2(0.98253,0.72662002));
l9_143=sin(l9_143)*479.371;
l9_143=fract(l9_143);
l9_143=floor(l9_143*10000.0)*9.9999997e-05;
float l9_144=l9_143;
l9_135.y=l9_144;
}
if (l9_127>=3)
{
float2 l9_145=(((float2(0.6947,0.52170002)*l9_138)*l9_137)*l9_136.z)*l9_133;
float l9_146=dot(l9_145,float2(0.98253,0.72662002));
l9_146=sin(l9_146)*479.371;
l9_146=fract(l9_146);
l9_146=floor(l9_146*10000.0)*9.9999997e-05;
float l9_147=l9_146;
l9_135.z=l9_147;
}
if (l9_127>=4)
{
float2 l9_148=(((float2(0.47889999,0.39669999)*l9_138)*l9_137)*l9_136.w)*l9_133;
float l9_149=dot(l9_148,float2(0.98253,0.72662002));
l9_149=sin(l9_149)*479.371;
l9_149=fract(l9_149);
l9_149=floor(l9_149*10000.0)*9.9999997e-05;
float l9_150=l9_149;
l9_135.w=l9_150;
}
float4 l9_151=l9_135;
float4 l9_152=l9_151;
float3 l9_153=mix(l9_124,l9_125,l9_152.xyz);
l9_123=l9_153;
gParticle.Velocity+=l9_123;
float3 l9_154=float3(0.0);
float l9_155=1.0;
float3 l9_156=float3(1.0);
float3 l9_157=(*sc_set0.UserUniforms).Port_Input2_N060;
ssGlobals l9_158=param_1;
float l9_159=0.0;
float l9_160=float((*sc_set0.UserUniforms).isIdle!=0);
l9_159=l9_160;
float l9_161=0.0;
l9_161=l9_159;
l9_155=l9_161;
float3 l9_162;
if ((l9_155*1.0)!=0.0)
{
float l9_163=0.0;
l9_163=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_164=float3(0.0);
float l9_165=1.0;
float3 l9_166=float3(0.0);
float3 l9_167=float3(0.0);
ssGlobals l9_168=l9_158;
float l9_169=0.0;
float l9_170=float((*sc_set0.UserUniforms).isIdle!=0);
l9_169=l9_170;
l9_165=l9_169;
float3 l9_171;
if ((l9_165*1.0)!=0.0)
{
float l9_172=0.0;
float l9_173=(*sc_set0.UserUniforms).Port_TimeBias_N052;
float l9_174=(*sc_set0.UserUniforms).Port_ValueA_N052;
float l9_175=(*sc_set0.UserUniforms).Port_TimeA_N052;
float l9_176=(*sc_set0.UserUniforms).Port_TimeTransition_N052;
float l9_177=(*sc_set0.UserUniforms).Port_ValueB_N052;
float l9_178=(*sc_set0.UserUniforms).Port_TimeB_N052;
ssGlobals l9_179=l9_168;
float l9_180=((l9_175+l9_176)+l9_178)+9.9999997e-05;
float l9_181=l9_175/l9_180;
float l9_182=1.0-(l9_178/l9_180);
float l9_183=(mod((l9_179.gTimeElapsedShifted/l9_180)+l9_173,1.0)*2.0)-1.0;
float l9_184=abs(l9_183);
float l9_185=mix(l9_174,l9_177,smoothstep(l9_181,l9_182,l9_184));
l9_172=l9_185;
float l9_186=0.0;
l9_186=l9_172*(*sc_set0.UserUniforms).Port_Input1_N053;
float3 l9_187=float3(0.0);
l9_187=float3(float2(l9_186).x,float2(l9_186).y,0.0);
l9_166=l9_187;
l9_171=l9_166;
}
else
{
float3 l9_188=float3(0.0);
float3 l9_189=(*sc_set0.UserUniforms).influencePosition;
l9_188=l9_189;
l9_167=l9_188;
l9_171=l9_167;
}
l9_164=l9_171;
float3 l9_190=float3(0.0);
l9_190=l9_164;
float3 l9_191=float3(0.0);
l9_191=gParticle.Position;
float3 l9_192=float3(0.0);
l9_192=l9_190-l9_191;
float3 l9_193=float3(0.0);
float3 l9_194=l9_192;
float l9_195=dot(l9_194,l9_194);
float l9_196;
if (l9_195>0.0)
{
l9_196=1.0/sqrt(l9_195);
}
else
{
l9_196=0.0;
}
float l9_197=l9_196;
float3 l9_198=l9_194*l9_197;
l9_193=l9_198;
float3 l9_199=float3(0.0);
l9_199=float3(l9_163)*l9_193;
l9_156=l9_199;
l9_162=l9_156;
}
else
{
l9_162=l9_157;
}
l9_154=l9_162;
gParticle.Force+=l9_154;
float l9_200=0.0;
l9_200=(*sc_set0.UserUniforms).Port_Import_N099;
float l9_201=0.0;
l9_201=(*sc_set0.UserUniforms).Port_Import_N109;
float l9_202=0.0;
float l9_203=l9_200;
float l9_204=l9_201;
ssGlobals l9_205=param_1;
int l9_206=1;
bool l9_207=true;
bool l9_208=true;
bool l9_209=true;
float l9_210=110.0;
ssParticle l9_211=gParticle;
float l9_212=1.0;
float l9_213=l9_205.gTimeElapsed;
float4 l9_214=float4(0.0);
float4 l9_215=float4(1.0);
float l9_216=1.0;
float2 l9_217=float2(1.0);
if (l9_207)
{
l9_215=float4(fract(l9_213*10.0));
l9_215=floor(l9_215*10000.0)*9.9999997e-05;
l9_215=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_215;
}
if (l9_208)
{
l9_216=1.0+((l9_210+1.0)*0.0099999998);
}
if (l9_209)
{
l9_217=l9_211.Seed2000;
}
l9_212=(l9_212+1.0)*0.5;
if (l9_206>=1)
{
float2 l9_218=(((float2(0.2353,0.78750002)*l9_217)*l9_216)*l9_215.x)*l9_212;
float l9_219=dot(l9_218,float2(0.98253,0.72662002));
l9_219=sin(l9_219)*479.371;
l9_219=fract(l9_219);
l9_219=floor(l9_219*10000.0)*9.9999997e-05;
float l9_220=l9_219;
l9_214.x=l9_220;
}
if (l9_206>=2)
{
float2 l9_221=(((float2(0.5751,0.62730002)*l9_217)*l9_216)*l9_215.y)*l9_212;
float l9_222=dot(l9_221,float2(0.98253,0.72662002));
l9_222=sin(l9_222)*479.371;
l9_222=fract(l9_222);
l9_222=floor(l9_222*10000.0)*9.9999997e-05;
float l9_223=l9_222;
l9_214.y=l9_223;
}
if (l9_206>=3)
{
float2 l9_224=(((float2(0.6947,0.52170002)*l9_217)*l9_216)*l9_215.z)*l9_212;
float l9_225=dot(l9_224,float2(0.98253,0.72662002));
l9_225=sin(l9_225)*479.371;
l9_225=fract(l9_225);
l9_225=floor(l9_225*10000.0)*9.9999997e-05;
float l9_226=l9_225;
l9_214.z=l9_226;
}
if (l9_206>=4)
{
float2 l9_227=(((float2(0.47889999,0.39669999)*l9_217)*l9_216)*l9_215.w)*l9_212;
float l9_228=dot(l9_227,float2(0.98253,0.72662002));
l9_228=sin(l9_228)*479.371;
l9_228=fract(l9_228);
l9_228=floor(l9_228*10000.0)*9.9999997e-05;
float l9_229=l9_228;
l9_214.w=l9_229;
}
float4 l9_230=l9_214;
float4 l9_231=l9_230;
float l9_232=mix(l9_203,l9_204,l9_231.x);
l9_202=l9_232;
float l9_233=l9_202;
gParticle.Mass=l9_233;
gParticle.Mass=fast::max(9.9999997e-06,gParticle.Mass);
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
gParticle.Spawned=true;
gParticle.Age=Globals.gTimeElapsedShifted;
}
gParticle.Life=1.0;
if (gParticle.Dead)
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
float4 l9_234=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_235=dot(l9_234,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_236=l9_235;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_236;
}
}
float4 l9_237=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_237;
return out;
}
float Output_N149=0.0;
float param_3=float((*sc_set0.UserUniforms).isAttracting!=0);
Output_N149=param_3;
float3 Value_N81=float3(0.0);
Value_N81=(*sc_set0.UserUniforms).Port_Import_N081;
float3 Output_N84=float3(0.0);
float3 param_4=Value_N81;
float l9_239=dot(param_4,param_4);
float l9_240;
if (l9_239>0.0)
{
l9_240=1.0/sqrt(l9_239);
}
else
{
l9_240=0.0;
}
float l9_241=l9_240;
float3 param_5=param_4*l9_241;
Output_N84=param_5;
float Value1_N86=0.0;
float Value2_N86=0.0;
float Value3_N86=0.0;
float3 param_6=Output_N84;
float param_7=param_6.x;
float param_8=param_6.y;
float param_9=param_6.z;
Value1_N86=param_7;
Value2_N86=param_8;
Value3_N86=param_9;
float3 Value_N176=float3(0.0);
Value_N176=gParticle.Position;
float Output_N177=0.0;
Output_N177=length(Value_N176);
float ValueOut_N178=0.0;
float param_10=Output_N177;
float param_12=(*sc_set0.UserUniforms).Port_RangeMinA_N178;
float param_13=(*sc_set0.UserUniforms).Port_RangeMaxA_N178;
float param_14=(*sc_set0.UserUniforms).Port_RangeMinB_N178;
float param_15=(*sc_set0.UserUniforms).Port_RangeMaxB_N178;
float param_11=(((param_10-param_12)/((param_13-param_12)+1e-06))*(param_15-param_14))+param_14;
float l9_242;
if (param_15>param_14)
{
l9_242=fast::clamp(param_11,param_14,param_15);
}
else
{
l9_242=fast::clamp(param_11,param_15,param_14);
}
param_11=l9_242;
ValueOut_N178=param_11;
float Value_N87=0.0;
Value_N87=ValueOut_N178;
float Output_N88=0.0;
Output_N88=cos(Value_N87);
float Output_N90=0.0;
Output_N90=1.0-Output_N88;
float Output_N92=0.0;
Output_N92=(Value1_N86*Value1_N86)*Output_N90;
float Output_N93=0.0;
Output_N93=Output_N92+Output_N88;
float Output_N94=0.0;
Output_N94=(Value1_N86*Value2_N86)*Output_N90;
float Output_N95=0.0;
Output_N95=sin(Value_N87);
float Output_N96=0.0;
Output_N96=Value3_N86*Output_N95;
float Output_N97=0.0;
Output_N97=Output_N94-Output_N96;
float Output_N98=0.0;
Output_N98=(Value3_N86*Value1_N86)*Output_N90;
float Output_N100=0.0;
Output_N100=Value2_N86*Output_N95;
float Output_N101=0.0;
Output_N101=Output_N98+Output_N100;
float4 Value_N102=float4(0.0);
Value_N102.x=Output_N93;
Value_N102.y=Output_N97;
Value_N102.z=Output_N101;
Value_N102.w=(*sc_set0.UserUniforms).Port_Value4_N102;
float Output_N103=0.0;
Output_N103=(Value1_N86*Value2_N86)*Output_N90;
float Output_N104=0.0;
Output_N104=Value3_N86*Output_N95;
float Output_N105=0.0;
Output_N105=Output_N103+Output_N104;
float Output_N106=0.0;
Output_N106=(Value2_N86*Value2_N86)*Output_N90;
float Output_N107=0.0;
Output_N107=Output_N106+Output_N88;
float Output_N108=0.0;
Output_N108=(Value2_N86*Value3_N86)*Output_N90;
float Output_N115=0.0;
Output_N115=Value1_N86*Output_N95;
float Output_N116=0.0;
Output_N116=Output_N108-Output_N115;
float4 Value_N117=float4(0.0);
Value_N117.x=Output_N105;
Value_N117.y=Output_N107;
Value_N117.z=Output_N116;
Value_N117.w=(*sc_set0.UserUniforms).Port_Value4_N117;
float Output_N118=0.0;
Output_N118=(Value3_N86*Value1_N86)*Output_N90;
float Output_N119=0.0;
Output_N119=Value2_N86*Output_N95;
float Output_N120=0.0;
Output_N120=Output_N118-Output_N119;
float Output_N121=0.0;
Output_N121=(Value2_N86*Value3_N86)*Output_N90;
float Output_N122=0.0;
Output_N122=Value1_N86*Output_N95;
float Output_N123=0.0;
Output_N123=Output_N121+Output_N122;
float Output_N124=0.0;
Output_N124=(Value3_N86*Value3_N86)*Output_N90;
float Output_N125=0.0;
Output_N125=Output_N124+Output_N88;
float4 Value_N126=float4(0.0);
Value_N126.x=Output_N120;
Value_N126.y=Output_N123;
Value_N126.z=Output_N125;
Value_N126.w=(*sc_set0.UserUniforms).Port_Value4_N126;
float4x4 Matrix_N127=float4x4(float4(0.0),float4(0.0),float4(0.0),float4(0.0));
Matrix_N127=float4x4(float4(Value_N102),float4(Value_N117),float4(Value_N126),float4((*sc_set0.UserUniforms).Port_Column3_N127));
float4x4 Export_N128=float4x4(float4(0.0),float4(0.0),float4(0.0),float4(0.0));
Export_N128=Matrix_N127;
float3 Output_N130=float3(0.0);
Output_N130=float3x3(Export_N128[0].xyz,Export_N128[1].xyz,Export_N128[2].xyz)*Value_N176;
float3 Output_N131=float3(0.0);
Output_N131=Output_N130-Value_N176;
float Value_N132=0.0;
Value_N132=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float Output_N114=0.0;
float param_16=1.0;
float param_17=(*sc_set0.UserUniforms).Port_Input1_N114;
float param_18=(*sc_set0.UserUniforms).Port_Input2_N114;
float l9_243=0.0;
float l9_244=float((*sc_set0.UserUniforms).isIdle!=0);
l9_243=l9_244;
param_16=l9_243;
float param_19;
if ((param_16*1.0)!=0.0)
{
param_19=param_17;
}
else
{
param_19=param_18;
}
Output_N114=param_19;
float ValueOut_N133=0.0;
ValueOut_N133=(((Value_N132-(*sc_set0.UserUniforms).Port_RangeMinA_N133)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N133-(*sc_set0.UserUniforms).Port_RangeMinA_N133)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N133-Output_N114))+Output_N114;
float3 Output_N134=float3(0.0);
Output_N134=Output_N131*float3(ValueOut_N133);
float param_20=Output_N149;
float3 param_21=Output_N134;
if (param_20!=0.0)
{
gParticle.Force=param_21;
}
float Output_N18=0.0;
float param_22=1.0;
float param_23=(*sc_set0.UserUniforms).Port_Input1_N018;
float param_24=50.0;
float l9_245=0.0;
float l9_246=float((*sc_set0.UserUniforms).isIdle!=0);
l9_245=l9_246;
param_22=l9_245;
float param_25;
if ((param_22*1.0)!=0.0)
{
param_25=param_23;
}
else
{
float l9_247=0.0;
float l9_248=1.0;
float l9_249=(*sc_set0.UserUniforms).Port_Input1_N066;
float l9_250=(*sc_set0.UserUniforms).Port_Input2_N066;
float l9_251=0.0;
float l9_252=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_251=l9_252;
l9_248=l9_251;
float l9_253;
if ((l9_248*1.0)!=0.0)
{
l9_253=l9_249;
}
else
{
l9_253=l9_250;
}
l9_247=l9_253;
param_24=l9_247;
param_25=param_24;
}
Output_N18=param_25;
float Value_N137=0.0;
Value_N137=gParticle.Mass;
float Output_N136=0.0;
Output_N136=Output_N18*Value_N137;
float Value_N308=0.0;
Value_N308=Output_N136;
float3 Output_N148=float3(0.0);
float param_26=1.0;
float3 param_27=float3(0.0);
float3 param_28=float3(0.0);
ssGlobals param_30=Globals;
float l9_254=0.0;
float l9_255=float((*sc_set0.UserUniforms).isIdle!=0);
l9_254=l9_255;
param_26=l9_254;
float3 param_29;
if ((param_26*1.0)!=0.0)
{
float l9_256=0.0;
float l9_257=(*sc_set0.UserUniforms).Port_TimeBias_N052;
float l9_258=(*sc_set0.UserUniforms).Port_ValueA_N052;
float l9_259=(*sc_set0.UserUniforms).Port_TimeA_N052;
float l9_260=(*sc_set0.UserUniforms).Port_TimeTransition_N052;
float l9_261=(*sc_set0.UserUniforms).Port_ValueB_N052;
float l9_262=(*sc_set0.UserUniforms).Port_TimeB_N052;
ssGlobals l9_263=param_30;
float l9_264=((l9_259+l9_260)+l9_262)+9.9999997e-05;
float l9_265=l9_259/l9_264;
float l9_266=1.0-(l9_262/l9_264);
float l9_267=(mod((l9_263.gTimeElapsedShifted/l9_264)+l9_257,1.0)*2.0)-1.0;
float l9_268=abs(l9_267);
float l9_269=mix(l9_258,l9_261,smoothstep(l9_265,l9_266,l9_268));
l9_256=l9_269;
float l9_270=0.0;
l9_270=l9_256*(*sc_set0.UserUniforms).Port_Input1_N053;
float3 l9_271=float3(0.0);
l9_271=float3(float2(l9_270).x,float2(l9_270).y,0.0);
param_27=l9_271;
param_29=param_27;
}
else
{
float3 l9_272=float3(0.0);
float3 l9_273=(*sc_set0.UserUniforms).influencePosition;
l9_272=l9_273;
param_28=l9_272;
param_29=param_28;
}
Output_N148=param_29;
float3 Value_N309=float3(0.0);
Value_N309=Output_N148;
float3 Value_N310=float3(0.0);
Value_N310=gParticle.Position;
float3 Output_N311=float3(0.0);
Output_N311=Value_N309-Value_N310;
float3 Output_N312=float3(0.0);
float3 param_31=Output_N311;
float l9_274=dot(param_31,param_31);
float l9_275;
if (l9_274>0.0)
{
l9_275=1.0/sqrt(l9_274);
}
else
{
l9_275=0.0;
}
float l9_276=l9_275;
float3 param_32=param_31*l9_276;
Output_N312=param_32;
float3 Output_N313=float3(0.0);
Output_N313=float3(Value_N308)*Output_N312;
gParticle.Force+=Output_N313;
float Output_N237=0.0;
float param_33=1.0;
float param_34=(*sc_set0.UserUniforms).Port_Input1_N237;
float param_35=5.0;
float l9_277=0.0;
float l9_278=float((*sc_set0.UserUniforms).isIdle!=0);
l9_277=l9_278;
param_33=l9_277;
float param_36;
if ((param_33*1.0)!=0.0)
{
param_36=param_34;
}
else
{
float l9_279=0.0;
float l9_280=1.0;
float l9_281=(*sc_set0.UserUniforms).Port_Input1_N201;
float l9_282=(*sc_set0.UserUniforms).Port_Input2_N201;
float l9_283=0.0;
float l9_284=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_283=l9_284;
l9_280=l9_283;
float l9_285;
if ((l9_280*1.0)!=0.0)
{
l9_285=l9_281;
}
else
{
l9_285=l9_282;
}
l9_279=l9_285;
param_35=l9_279;
param_36=param_35;
}
Output_N237=param_36;
float3 Value_N202=float3(0.0);
Value_N202=float3(Output_N237);
float3 Value_N204=float3(0.0);
Value_N204=gParticle.Position;
float3 Value_N205=float3(0.0);
Value_N205=(*sc_set0.UserUniforms).Port_Import_N205;
float3 Value_N206=float3(0.0);
Value_N206=(*sc_set0.UserUniforms).Port_Import_N206;
float Time_N207=0.0;
Time_N207=Globals.gTimeElapsedShifted*(*sc_set0.UserUniforms).Port_Multiplier_N207;
float3 Output_N208=float3(0.0);
Output_N208=Value_N206*float3(Time_N207);
float3 Output_N209=float3(0.0);
Output_N209=(Value_N204+Value_N205)+Output_N208;
float3 Value_N210=float3(0.0);
Value_N210=(*sc_set0.UserUniforms).Port_Import_N210;
float3 Output_N221=float3(0.0);
Output_N221=Output_N209+Value_N210;
float3 Output_N222=float3(0.0);
Output_N222=Value_N210*float3((*sc_set0.UserUniforms).Port_Input1_N222);
float3 Output_N223=float3(0.0);
Output_N223=float3(1.0)/Output_N222;
float3 Output_N227=float3(0.0);
Output_N227=Output_N221*Output_N223;
float4 Color_N228=float4(0.0);
float3 param_37=Output_N227;
float param_38=0.0;
float3 l9_286=param_37;
float l9_287=param_38;
float4 l9_288=float4(0.0);
l9_288=sc_set0.noiseTex.sample(sc_set0.noiseTexSmpSC,l9_286,level(l9_287));
float4 l9_289=l9_288;
float4 l9_290=l9_289;
Color_N228=l9_290;
float4 Output_N229=float4(0.0);
Output_N229=Color_N228*float4((*sc_set0.UserUniforms).Port_Input1_N229);
float4 Output_N230=float4(0.0);
Output_N230=Output_N229-float4(1.0);
float3 Output_N284=float3(0.0);
Output_N284=Value_N202*Output_N230.xyz;
gParticle.Force+=Output_N284;
float3 Value_N217=float3(0.0);
Value_N217=gParticle.Velocity;
float3 Output_N218=float3(0.0);
Output_N218=-Value_N217;
float Output_N4=0.0;
Output_N4=length(Value_N217);
float3 Output_N5=float3(0.0);
Output_N5=Output_N218*float3(Output_N4);
float Value_N49=0.0;
Value_N49=(*sc_set0.UserUniforms).Port_Import_N049;
float Value_N51=0.0;
Value_N51=(*sc_set0.UserUniforms).Port_Import_N051;
float Value_N50=0.0;
Value_N50=(*sc_set0.UserUniforms).Port_Import_N050;
float3 Output_N224=float3(0.0);
Output_N224=(((Output_N5*float3(Value_N49))*float3(Value_N51))*float3(Value_N50))*float3((*sc_set0.UserUniforms).Port_Input4_N224);
gParticle.Force+=Output_N224;
float Output_N241=0.0;
float param_39=1.0;
float param_40=(*sc_set0.UserUniforms).Port_Input1_N241;
float param_41=3.0;
float l9_291=0.0;
float l9_292=float((*sc_set0.UserUniforms).isIdle!=0);
l9_291=l9_292;
param_39=l9_291;
float param_42;
if ((param_39*1.0)!=0.0)
{
param_42=param_40;
}
else
{
float l9_293=0.0;
float l9_294=1.0;
float l9_295=(*sc_set0.UserUniforms).Port_Input1_N200;
float l9_296=(*sc_set0.UserUniforms).Port_Input2_N200;
float l9_297=0.0;
float l9_298=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_297=l9_298;
l9_294=l9_297;
float l9_299;
if ((l9_294*1.0)!=0.0)
{
l9_299=l9_295;
}
else
{
l9_299=l9_296;
}
l9_293=l9_299;
param_41=l9_293;
param_42=param_41;
}
Output_N241=param_42;
float Value_N150=0.0;
Value_N150=Output_N241;
float Output_N63=0.0;
float param_43=1.0;
float param_44=(*sc_set0.UserUniforms).Port_Input1_N063;
float param_45=(*sc_set0.UserUniforms).Port_Input2_N063;
float l9_300=0.0;
float l9_301=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_300=l9_301;
param_43=l9_300;
float param_46;
if ((param_43*1.0)!=0.0)
{
param_46=param_44;
}
else
{
param_46=param_45;
}
Output_N63=param_46;
float Value_N155=0.0;
Value_N155=Output_N63;
float Value_N175=0.0;
Value_N175=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float Output_N179=0.0;
Output_N179=mix(Value_N150,Value_N155,Value_N175);
gParticle.Size=Output_N179;
float4 Output_N8=float4(0.0);
float param_47=1.0;
float param_48=(*sc_set0.UserUniforms).Port_Input1_N008;
float4 param_49=float4(0.5,0.0,0.0,0.0);
ssGlobals param_51=Globals;
float l9_302=0.0;
float l9_303=float((*sc_set0.UserUniforms).isIdle!=0);
l9_302=l9_303;
param_47=l9_302;
float4 param_50;
if ((param_47*1.0)!=0.0)
{
param_50=float4(param_48);
}
else
{
float4 l9_304=float4(0.0);
float l9_305=1.0;
float4 l9_306=(*sc_set0.UserUniforms).Port_Input1_N065;
float4 l9_307=float4(1.0);
ssGlobals l9_308=param_51;
float l9_309=0.0;
float l9_310=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_309=l9_310;
l9_305=l9_309;
float4 l9_311;
if ((l9_305*1.0)!=0.0)
{
l9_311=l9_306;
}
else
{
float l9_312=0.0;
float l9_313=(*sc_set0.UserUniforms).Port_Min_N019;
float l9_314=(*sc_set0.UserUniforms).Port_Max_N019;
ssGlobals l9_315=l9_308;
int l9_316=1;
bool l9_317=false;
bool l9_318=true;
bool l9_319=true;
float l9_320=19.0;
ssParticle l9_321=gParticle;
float l9_322=1.0;
float l9_323=l9_315.gTimeElapsed;
float4 l9_324=float4(0.0);
float4 l9_325=float4(1.0);
float l9_326=1.0;
float2 l9_327=float2(1.0);
if (l9_317)
{
l9_325=float4(fract(l9_323*10.0));
l9_325=floor(l9_325*10000.0)*9.9999997e-05;
l9_325=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_325;
}
if (l9_318)
{
l9_326=1.0+((l9_320+1.0)*0.0099999998);
}
if (l9_319)
{
l9_327=l9_321.Seed2000;
}
l9_322=(l9_322+1.0)*0.5;
if (l9_316>=1)
{
float2 l9_328=(((float2(0.2353,0.78750002)*l9_327)*l9_326)*l9_325.x)*l9_322;
float l9_329=dot(l9_328,float2(0.98253,0.72662002));
l9_329=sin(l9_329)*479.371;
l9_329=fract(l9_329);
l9_329=floor(l9_329*10000.0)*9.9999997e-05;
float l9_330=l9_329;
l9_324.x=l9_330;
}
if (l9_316>=2)
{
float2 l9_331=(((float2(0.5751,0.62730002)*l9_327)*l9_326)*l9_325.y)*l9_322;
float l9_332=dot(l9_331,float2(0.98253,0.72662002));
l9_332=sin(l9_332)*479.371;
l9_332=fract(l9_332);
l9_332=floor(l9_332*10000.0)*9.9999997e-05;
float l9_333=l9_332;
l9_324.y=l9_333;
}
if (l9_316>=3)
{
float2 l9_334=(((float2(0.6947,0.52170002)*l9_327)*l9_326)*l9_325.z)*l9_322;
float l9_335=dot(l9_334,float2(0.98253,0.72662002));
l9_335=sin(l9_335)*479.371;
l9_335=fract(l9_335);
l9_335=floor(l9_335*10000.0)*9.9999997e-05;
float l9_336=l9_335;
l9_324.z=l9_336;
}
if (l9_316>=4)
{
float2 l9_337=(((float2(0.47889999,0.39669999)*l9_327)*l9_326)*l9_325.w)*l9_322;
float l9_338=dot(l9_337,float2(0.98253,0.72662002));
l9_338=sin(l9_338)*479.371;
l9_338=fract(l9_338);
l9_338=floor(l9_338*10000.0)*9.9999997e-05;
float l9_339=l9_338;
l9_324.w=l9_339;
}
float4 l9_340=l9_324;
float4 l9_341=l9_340;
float l9_342=mix(l9_313,l9_314,l9_341.x);
l9_312=l9_342;
float l9_343=0.0;
l9_343=l9_312*(*sc_set0.UserUniforms).Port_Input1_N166;
float3 l9_344=float3(0.0);
float3 l9_345=(*sc_set0.UserUniforms).influencePosition;
l9_344=l9_345;
float3 l9_346=float3(0.0);
l9_346=gParticle.Position;
float l9_347=0.0;
l9_347=distance(l9_344,l9_346);
float l9_348=0.0;
l9_348=l9_347*(*sc_set0.UserUniforms).Port_Input1_N164;
float l9_349=0.0;
l9_349=l9_348*l9_312;
float l9_350=0.0;
l9_350=l9_343+l9_349;
float l9_351=0.0;
l9_351=fast::clamp(l9_350+0.001,(*sc_set0.UserUniforms).Port_Input1_N165+0.001,(*sc_set0.UserUniforms).Port_Input2_N165+0.001)-0.001;
float4 l9_352=float4(0.0);
float4 l9_353=(*sc_set0.UserUniforms).colorA;
l9_352=l9_353;
float4 l9_354=float4(0.0);
float4 l9_355=(*sc_set0.UserUniforms).colorB;
l9_354=l9_355;
float4 l9_356=float4(0.0);
float4 l9_357=(*sc_set0.UserUniforms).colorC;
l9_356=l9_357;
float4 l9_358=float4(0.0);
float4 l9_359=(*sc_set0.UserUniforms).colorD;
l9_358=l9_359;
float4 l9_360=float4(0.0);
float4 l9_361=(*sc_set0.UserUniforms).colorE;
l9_360=l9_361;
float4 l9_362=float4(0.0);
float l9_363=l9_351;
float4 l9_364=l9_352;
float l9_365=(*sc_set0.UserUniforms).Port_Position1_N172;
float4 l9_366=l9_354;
float l9_367=(*sc_set0.UserUniforms).Port_Position2_N172;
float4 l9_368=l9_356;
float l9_369=(*sc_set0.UserUniforms).Port_Position3_N172;
float4 l9_370=l9_358;
float4 l9_371=l9_360;
l9_363=fast::clamp(l9_363,0.0,1.0);
float4 l9_372;
if (l9_363<l9_365)
{
l9_372=mix(l9_364,l9_366,float4(fast::clamp(l9_363/l9_365,0.0,1.0)));
}
else
{
if (l9_363<l9_367)
{
l9_372=mix(l9_366,l9_368,float4(fast::clamp((l9_363-l9_365)/(l9_367-l9_365),0.0,1.0)));
}
else
{
if (l9_363<l9_369)
{
l9_372=mix(l9_368,l9_370,float4(fast::clamp((l9_363-l9_367)/(l9_369-l9_367),0.0,1.0)));
}
else
{
l9_372=mix(l9_370,l9_371,float4(fast::clamp((l9_363-l9_369)/(1.0-l9_369),0.0,1.0)));
}
}
}
l9_362=l9_372;
l9_307=l9_362;
l9_311=l9_307;
}
l9_304=l9_311;
param_49=l9_304;
param_50=param_49;
}
Output_N8=param_50;
gParticle.Color=Output_N8;
float4 Value_N78=float4(0.0);
Value_N78=gParticle.Color;
float Value_N79=0.0;
Value_N79=(*sc_set0.UserUniforms).Port_Import_N079;
float Value_N91=0.0;
Value_N91=(*sc_set0.UserUniforms).Port_Import_N091;
float Value_N183=0.0;
Value_N183=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float Value_N191=0.0;
Value_N191=Value_N183;
float Output_N266=0.0;
float param_52=1.0;
float param_53=(*sc_set0.UserUniforms).Port_Input1_N266;
float param_54=(*sc_set0.UserUniforms).Port_Input2_N266;
float l9_373=0.0;
float l9_374=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_373=l9_374;
param_52=l9_373;
float param_55;
if ((param_52*1.0)!=0.0)
{
param_55=param_53;
}
else
{
param_55=param_54;
}
Output_N266=param_55;
float Value_N185=0.0;
Value_N185=Output_N266;
float Value_N186=0.0;
Value_N186=gParticle.Life;
float Output_N187=0.0;
Output_N187=Value_N185/Value_N186;
float Value_N138=0.0;
Value_N138=Output_N187;
float Output_N143=0.0;
Output_N143=(*sc_set0.UserUniforms).Port_Input0_N143/Value_N138;
float Output_N144=0.0;
Output_N144=Value_N191*Output_N143;
float Output_N182=0.0;
Output_N182=fast::clamp(Output_N144+0.001,(*sc_set0.UserUniforms).Port_Input1_N182+0.001,(*sc_set0.UserUniforms).Port_Input2_N182+0.001)-0.001;
float Output_N184=0.0;
Output_N184=1.0-Value_N191;
float Value_N188=0.0;
Value_N188=(*sc_set0.UserUniforms).Port_Import_N188;
float Output_N189=0.0;
Output_N189=Value_N188/Value_N186;
float Value_N192=0.0;
Value_N192=Output_N189;
float Output_N193=0.0;
Output_N193=(*sc_set0.UserUniforms).Port_Input0_N193/Value_N192;
float Output_N194=0.0;
Output_N194=Output_N184*Output_N193;
float Output_N236=0.0;
Output_N236=fast::clamp(Output_N194+0.001,(*sc_set0.UserUniforms).Port_Input1_N236+0.001,(*sc_set0.UserUniforms).Port_Input2_N236+0.001)-0.001;
float Output_N195=0.0;
Output_N195=Output_N182*Output_N236;
float Export_N196=0.0;
Export_N196=Output_N195;
float Output_N239=0.0;
Output_N239=mix(Value_N79,Value_N91,Export_N196);
float4 Value_N242=float4(0.0);
Value_N242=float4(Value_N78.xyz.x,Value_N78.xyz.y,Value_N78.xyz.z,Value_N242.w);
Value_N242.w=Output_N239;
gParticle.Color=Value_N242;
float3x3 param_56=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_56);
float Drift=0.0049999999;
if (gParticle.Dead)
{
float4 param_57=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_57.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_375=param_57;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_376=dot(l9_375,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_377=l9_376;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_377;
}
}
float4 l9_378=float4(param_57.x,-param_57.y,(param_57.z*0.5)+(param_57.w*0.5),param_57.w);
out.gl_Position=l9_378;
return out;
}
float l9_379;
if (abs(gParticle.Force.x)<Drift)
{
l9_379=0.0;
}
else
{
l9_379=gParticle.Force.x;
}
gParticle.Force.x=l9_379;
float l9_380;
if (abs(gParticle.Force.y)<Drift)
{
l9_380=0.0;
}
else
{
l9_380=gParticle.Force.y;
}
gParticle.Force.y=l9_380;
float l9_381;
if (abs(gParticle.Force.z)<Drift)
{
l9_381=0.0;
}
else
{
l9_381=gParticle.Force.z;
}
gParticle.Force.z=l9_381;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_382;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_382=0.0;
}
else
{
l9_382=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_382;
float l9_383;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_383=0.0;
}
else
{
l9_383=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_383;
float l9_384;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_384=0.0;
}
else
{
l9_384=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_384;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(4.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_385=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_385;
int particleRow=512;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_386;
if (v.texture0.x<0.5)
{
l9_386=0.0;
}
else
{
l9_386=QuadSize.x;
}
Vertex.x=l9_386;
float l9_387;
if (v.texture0.y<0.5)
{
l9_387=0.0;
}
else
{
l9_387=QuadSize.y;
}
Vertex.y=l9_387;
Vertex+=Offset;
float4 param_58=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_58.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_388=param_58;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_389=dot(l9_388,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_390=l9_389;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_390;
}
}
float4 l9_391=float4(param_58.x,-param_58.y,(param_58.z*0.5)+(param_58.w*0.5),param_58.w);
out.gl_Position=l9_391;
int l9_392=gl_InstanceIndex;
out.Interp_Particle_Index=l9_392;
out.Interp_Particle_Coord=v.texture0;
out.Interp_Particle_Force=gParticle.Force;
out.Interp_Particle_SpawnIndex=gParticle.SpawnIndex;
out.Interp_Particle_NextBurstTime=gParticle.NextBurstTime;
out.Interp_Particle_Position=gParticle.Position;
out.Interp_Particle_Velocity=gParticle.Velocity;
out.Interp_Particle_Life=gParticle.Life;
out.Interp_Particle_Age=gParticle.Age;
out.Interp_Particle_Size=gParticle.Size;
out.Interp_Particle_Color=gParticle.Color;
out.Interp_Particle_Quaternion=gParticle.Quaternion;
out.Interp_Particle_Mass=gParticle.Mass;
if (gParticle.Dead)
{
float4 param_59=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_59.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_393=param_59;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_394=dot(l9_393,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_395=l9_394;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_395;
}
}
float4 l9_396=float4(param_59.x,-param_59.y,(param_59.z*0.5)+(param_59.w*0.5),param_59.w);
out.gl_Position=l9_396;
return out;
}
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
int isIdle;
float3 influencePosition;
int isAttracting;
float4 noiseTexSize;
float2 noiseTexDepth;
float4 colorA;
float4 colorB;
float4 colorC;
float4 colorD;
float4 colorE;
float Port_TimeBias_N052;
float Port_ValueA_N052;
float Port_TimeA_N052;
float Port_TimeTransition_N052;
float Port_ValueB_N052;
float Port_TimeB_N052;
float Port_Input1_N053;
float3 Port_Import_N216;
float3 Port_Min_N213;
float3 Port_Max_N213;
float Port_Min_N254;
float Port_Max_N254;
float Port_Input1_N021;
float Port_Input1_N067;
float Port_Input2_N067;
float Port_Import_N214;
float3 Port_Import_N212;
float3 Port_Import_N075;
float3 Port_Import_N076;
float Port_Import_N062;
float Port_Import_N058;
float3 Port_Import_N059;
float3 Port_Input2_N060;
float Port_Import_N099;
float Port_Import_N109;
float3 Port_Import_N081;
float Port_RangeMinA_N178;
float Port_RangeMaxA_N178;
float Port_RangeMinB_N178;
float Port_RangeMaxB_N178;
float Port_Import_N087;
float Port_Value4_N102;
float Port_Value4_N117;
float Port_Value4_N126;
float4 Port_Column3_N127;
float Port_RangeMinA_N133;
float Port_RangeMaxA_N133;
float Port_Input1_N114;
float Port_Input2_N114;
float Port_RangeMaxB_N133;
float Port_Input1_N018;
float Port_Input1_N066;
float Port_Input2_N066;
float Port_Import_N308;
float3 Port_Import_N309;
float Port_Input1_N237;
float Port_Input1_N201;
float Port_Input2_N201;
float3 Port_Import_N202;
float3 Port_Import_N205;
float3 Port_Import_N206;
float Port_Multiplier_N207;
float3 Port_Import_N210;
float Port_Input1_N222;
float Port_Input1_N229;
float Port_Import_N049;
float Port_Import_N051;
float Port_Import_N050;
float Port_Input4_N224;
float Port_Input1_N241;
float Port_Input1_N200;
float Port_Input2_N200;
float Port_Import_N150;
float Port_Input1_N063;
float Port_Input2_N063;
float Port_Import_N155;
float Port_Input1_N008;
float4 Port_Input1_N065;
float Port_Min_N019;
float Port_Max_N019;
float Port_Input1_N166;
float Port_Input1_N164;
float Port_Input1_N165;
float Port_Input2_N165;
float Port_Position1_N172;
float Port_Position2_N172;
float Port_Position3_N172;
float Port_Import_N079;
float Port_Import_N091;
float Port_Import_N191;
float Port_Input0_N143;
float Port_Input1_N266;
float Port_Input2_N266;
float Port_Import_N185;
float Port_Import_N138;
float Port_Input1_N182;
float Port_Input2_N182;
float Port_Input0_N193;
float Port_Import_N188;
float Port_Import_N192;
float Port_Input1_N236;
float Port_Input2_N236;
};
struct sc_Set0
{
texture3d<float> noiseTex [[id(1)]];
texture2d<float> renderTarget0 [[id(2)]];
texture2d<float> renderTarget1 [[id(3)]];
texture2d<float> renderTarget2 [[id(4)]];
texture2d<float> renderTarget3 [[id(5)]];
sampler noiseTexSmpSC [[id(21)]];
sampler renderTarget0SmpSC [[id(22)]];
sampler renderTarget1SmpSC [[id(23)]];
sampler renderTarget2SmpSC [[id(24)]];
sampler renderTarget3SmpSC [[id(25)]];
constant userUniformsObj* UserUniforms [[id(33)]];
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
};
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]])
{
main_frag_out out={};
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
float4 Data0=float4(0.0);
float4 Data1=float4(0.0);
float4 Data2=float4(0.0);
float4 Data3=float4(0.0);
ssParticle gParticle;
gParticle.Position=in.Interp_Particle_Position;
gParticle.Velocity=in.Interp_Particle_Velocity;
gParticle.Life=in.Interp_Particle_Life;
gParticle.Age=in.Interp_Particle_Age;
gParticle.Size=in.Interp_Particle_Size;
gParticle.Color=in.Interp_Particle_Color;
gParticle.Quaternion=in.Interp_Particle_Quaternion;
gParticle.Mass=in.Interp_Particle_Mass;
gParticle.SpawnIndex=in.Interp_Particle_SpawnIndex;
gParticle.NextBurstTime=in.Interp_Particle_NextBurstTime;
float2 param=in.Interp_Particle_Coord;
int l9_0=int(floor(param.x*4.0));
float4 l9_1=float4(0.0);
float l9_2=0.0;
float l9_3=0.0;
float l9_4=0.0;
float l9_5=0.0;
float l9_6=0.0;
float l9_7=0.0;
float l9_8=0.0;
float l9_9=0.0;
float l9_10=0.0;
float l9_11=0.0;
float l9_12=0.0;
float l9_13=0.0;
float l9_14=0.0;
float l9_15=0.0;
float l9_16=0.0;
float l9_17=0.0;
if (l9_0==0)
{
float l9_18=gParticle.Position.x;
float l9_19=-1000.0;
float l9_20=1000.0;
float l9_21=l9_18;
float l9_22=l9_19;
float l9_23=l9_20;
float l9_24=0.99998999;
float l9_25=fast::clamp(l9_21,l9_22,l9_23);
float l9_26=l9_22;
float l9_27=l9_23;
float l9_28=0.0;
float l9_29=l9_24;
float l9_30=l9_28+(((l9_25-l9_26)*(l9_29-l9_28))/(l9_27-l9_26));
float l9_31=l9_30;
float4 l9_32=float4(1.0,255.0,65025.0,16581375.0)*l9_31;
l9_32=fract(l9_32);
l9_32-=(l9_32.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_33=l9_32;
float4 l9_34=l9_33;
float4 l9_35=l9_34;
l9_1=l9_35;
l9_2=l9_1.x;
l9_3=l9_1.y;
l9_4=l9_1.z;
l9_5=l9_1.w;
float l9_36=gParticle.Position.y;
float l9_37=-1000.0;
float l9_38=1000.0;
float l9_39=l9_36;
float l9_40=l9_37;
float l9_41=l9_38;
float l9_42=0.99998999;
float l9_43=fast::clamp(l9_39,l9_40,l9_41);
float l9_44=l9_40;
float l9_45=l9_41;
float l9_46=0.0;
float l9_47=l9_42;
float l9_48=l9_46+(((l9_43-l9_44)*(l9_47-l9_46))/(l9_45-l9_44));
float l9_49=l9_48;
float4 l9_50=float4(1.0,255.0,65025.0,16581375.0)*l9_49;
l9_50=fract(l9_50);
l9_50-=(l9_50.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_51=l9_50;
float4 l9_52=l9_51;
float4 l9_53=l9_52;
l9_1=l9_53;
l9_6=l9_1.x;
l9_7=l9_1.y;
l9_8=l9_1.z;
l9_9=l9_1.w;
float l9_54=gParticle.Position.z;
float l9_55=-1000.0;
float l9_56=1000.0;
float l9_57=l9_54;
float l9_58=l9_55;
float l9_59=l9_56;
float l9_60=0.99998999;
float l9_61=fast::clamp(l9_57,l9_58,l9_59);
float l9_62=l9_58;
float l9_63=l9_59;
float l9_64=0.0;
float l9_65=l9_60;
float l9_66=l9_64+(((l9_61-l9_62)*(l9_65-l9_64))/(l9_63-l9_62));
float l9_67=l9_66;
float4 l9_68=float4(1.0,255.0,65025.0,16581375.0)*l9_67;
l9_68=fract(l9_68);
l9_68-=(l9_68.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_69=l9_68;
float4 l9_70=l9_69;
float4 l9_71=l9_70;
l9_1=l9_71;
l9_10=l9_1.x;
l9_11=l9_1.y;
l9_12=l9_1.z;
l9_13=l9_1.w;
float l9_72=gParticle.Velocity.x;
float l9_73=-1000.0;
float l9_74=1000.0;
float l9_75=l9_72;
float l9_76=l9_73;
float l9_77=l9_74;
float l9_78=0.99998999;
float l9_79=fast::clamp(l9_75,l9_76,l9_77);
float l9_80=l9_76;
float l9_81=l9_77;
float l9_82=0.0;
float l9_83=l9_78;
float l9_84=l9_82+(((l9_79-l9_80)*(l9_83-l9_82))/(l9_81-l9_80));
float l9_85=l9_84;
float4 l9_86=float4(1.0,255.0,65025.0,16581375.0)*l9_85;
l9_86=fract(l9_86);
l9_86-=(l9_86.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_87=l9_86;
float4 l9_88=l9_87;
float4 l9_89=l9_88;
l9_1=l9_89;
l9_14=l9_1.x;
l9_15=l9_1.y;
l9_16=l9_1.z;
l9_17=l9_1.w;
}
else
{
if (l9_0==1)
{
float l9_90=gParticle.Velocity.y;
float l9_91=-1000.0;
float l9_92=1000.0;
float l9_93=l9_90;
float l9_94=l9_91;
float l9_95=l9_92;
float l9_96=0.99998999;
float l9_97=fast::clamp(l9_93,l9_94,l9_95);
float l9_98=l9_94;
float l9_99=l9_95;
float l9_100=0.0;
float l9_101=l9_96;
float l9_102=l9_100+(((l9_97-l9_98)*(l9_101-l9_100))/(l9_99-l9_98));
float l9_103=l9_102;
float4 l9_104=float4(1.0,255.0,65025.0,16581375.0)*l9_103;
l9_104=fract(l9_104);
l9_104-=(l9_104.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_105=l9_104;
float4 l9_106=l9_105;
float4 l9_107=l9_106;
l9_1=l9_107;
l9_2=l9_1.x;
l9_3=l9_1.y;
l9_4=l9_1.z;
l9_5=l9_1.w;
float l9_108=gParticle.Velocity.z;
float l9_109=-1000.0;
float l9_110=1000.0;
float l9_111=l9_108;
float l9_112=l9_109;
float l9_113=l9_110;
float l9_114=0.99998999;
float l9_115=fast::clamp(l9_111,l9_112,l9_113);
float l9_116=l9_112;
float l9_117=l9_113;
float l9_118=0.0;
float l9_119=l9_114;
float l9_120=l9_118+(((l9_115-l9_116)*(l9_119-l9_118))/(l9_117-l9_116));
float l9_121=l9_120;
float4 l9_122=float4(1.0,255.0,65025.0,16581375.0)*l9_121;
l9_122=fract(l9_122);
l9_122-=(l9_122.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_123=l9_122;
float4 l9_124=l9_123;
float4 l9_125=l9_124;
l9_1=l9_125;
l9_6=l9_1.x;
l9_7=l9_1.y;
l9_8=l9_1.z;
l9_9=l9_1.w;
float l9_126=gParticle.Life;
float l9_127=0.0;
float l9_128=8.0;
float l9_129=l9_126;
float l9_130=l9_127;
float l9_131=l9_128;
float l9_132=0.99998999;
float l9_133=fast::clamp(l9_129,l9_130,l9_131);
float l9_134=l9_130;
float l9_135=l9_131;
float l9_136=0.0;
float l9_137=l9_132;
float l9_138=l9_136+(((l9_133-l9_134)*(l9_137-l9_136))/(l9_135-l9_134));
float l9_139=l9_138;
float4 l9_140=float4(1.0,255.0,65025.0,16581375.0)*l9_139;
l9_140=fract(l9_140);
l9_140-=(l9_140.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_141=l9_140;
float4 l9_142=l9_141;
float4 l9_143=l9_142;
l9_1=l9_143;
l9_10=l9_1.x;
l9_11=l9_1.y;
l9_12=l9_1.z;
l9_13=l9_1.w;
float l9_144=gParticle.Age;
float l9_145=0.0;
float l9_146=8.0;
float l9_147=l9_144;
float l9_148=l9_145;
float l9_149=l9_146;
float l9_150=0.99998999;
float l9_151=fast::clamp(l9_147,l9_148,l9_149);
float l9_152=l9_148;
float l9_153=l9_149;
float l9_154=0.0;
float l9_155=l9_150;
float l9_156=l9_154+(((l9_151-l9_152)*(l9_155-l9_154))/(l9_153-l9_152));
float l9_157=l9_156;
float4 l9_158=float4(1.0,255.0,65025.0,16581375.0)*l9_157;
l9_158=fract(l9_158);
l9_158-=(l9_158.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_159=l9_158;
float4 l9_160=l9_159;
float4 l9_161=l9_160;
l9_1=l9_161;
l9_14=l9_1.x;
l9_15=l9_1.y;
l9_16=l9_1.z;
l9_17=l9_1.w;
}
else
{
if (l9_0==2)
{
float l9_162=gParticle.Size;
float l9_163=0.0;
float l9_164=100.0;
float l9_165=l9_162;
float l9_166=l9_163;
float l9_167=l9_164;
float l9_168=0.99998999;
float l9_169=fast::clamp(l9_165,l9_166,l9_167);
float l9_170=l9_166;
float l9_171=l9_167;
float l9_172=0.0;
float l9_173=l9_168;
float l9_174=l9_172+(((l9_169-l9_170)*(l9_173-l9_172))/(l9_171-l9_170));
float l9_175=l9_174;
float4 l9_176=float4(1.0,255.0,65025.0,16581375.0)*l9_175;
l9_176=fract(l9_176);
l9_176-=(l9_176.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_177=l9_176;
float4 l9_178=l9_177;
float4 l9_179=l9_178;
l9_1=l9_179;
l9_2=l9_1.x;
l9_3=l9_1.y;
l9_4=l9_1.z;
l9_5=l9_1.w;
float l9_180=gParticle.Color.x;
float l9_181=0.0;
float l9_182=1.00001;
float l9_183=l9_180;
float l9_184=l9_181;
float l9_185=l9_182;
float l9_186=0.99998999;
float l9_187=fast::clamp(l9_183,l9_184,l9_185);
float l9_188=l9_184;
float l9_189=l9_185;
float l9_190=0.0;
float l9_191=l9_186;
float l9_192=l9_190+(((l9_187-l9_188)*(l9_191-l9_190))/(l9_189-l9_188));
float l9_193=l9_192;
float4 l9_194=float4(1.0,255.0,65025.0,16581375.0)*l9_193;
l9_194=fract(l9_194);
l9_194-=(l9_194.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_195=l9_194;
float4 l9_196=l9_195;
float4 l9_197=l9_196;
l9_1=l9_197;
l9_6=l9_1.x;
l9_7=l9_1.y;
l9_8=l9_1.z;
l9_9=l9_1.w;
float l9_198=gParticle.Color.y;
float l9_199=0.0;
float l9_200=1.00001;
float l9_201=l9_198;
float l9_202=l9_199;
float l9_203=l9_200;
float l9_204=0.99998999;
float l9_205=fast::clamp(l9_201,l9_202,l9_203);
float l9_206=l9_202;
float l9_207=l9_203;
float l9_208=0.0;
float l9_209=l9_204;
float l9_210=l9_208+(((l9_205-l9_206)*(l9_209-l9_208))/(l9_207-l9_206));
float l9_211=l9_210;
float4 l9_212=float4(1.0,255.0,65025.0,16581375.0)*l9_211;
l9_212=fract(l9_212);
l9_212-=(l9_212.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_213=l9_212;
float4 l9_214=l9_213;
float4 l9_215=l9_214;
l9_1=l9_215;
l9_10=l9_1.x;
l9_11=l9_1.y;
l9_12=l9_1.z;
l9_13=l9_1.w;
float l9_216=gParticle.Color.z;
float l9_217=0.0;
float l9_218=1.00001;
float l9_219=l9_216;
float l9_220=l9_217;
float l9_221=l9_218;
float l9_222=0.99998999;
float l9_223=fast::clamp(l9_219,l9_220,l9_221);
float l9_224=l9_220;
float l9_225=l9_221;
float l9_226=0.0;
float l9_227=l9_222;
float l9_228=l9_226+(((l9_223-l9_224)*(l9_227-l9_226))/(l9_225-l9_224));
float l9_229=l9_228;
float4 l9_230=float4(1.0,255.0,65025.0,16581375.0)*l9_229;
l9_230=fract(l9_230);
l9_230-=(l9_230.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_231=l9_230;
float4 l9_232=l9_231;
float4 l9_233=l9_232;
l9_1=l9_233;
l9_14=l9_1.x;
l9_15=l9_1.y;
l9_16=l9_1.z;
l9_17=l9_1.w;
}
else
{
if (l9_0==3)
{
float l9_234=gParticle.Color.w;
float l9_235=0.0;
float l9_236=1.00001;
float l9_237=l9_234;
float l9_238=l9_235;
float l9_239=l9_236;
float l9_240=0.99998999;
float l9_241=fast::clamp(l9_237,l9_238,l9_239);
float l9_242=l9_238;
float l9_243=l9_239;
float l9_244=0.0;
float l9_245=l9_240;
float l9_246=l9_244+(((l9_241-l9_242)*(l9_245-l9_244))/(l9_243-l9_242));
float l9_247=l9_246;
float4 l9_248=float4(1.0,255.0,65025.0,16581375.0)*l9_247;
l9_248=fract(l9_248);
l9_248-=(l9_248.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_249=l9_248;
float4 l9_250=l9_249;
float4 l9_251=l9_250;
l9_1=l9_251;
l9_2=l9_1.x;
l9_3=l9_1.y;
l9_4=l9_1.z;
l9_5=l9_1.w;
float l9_252=gParticle.Mass;
float l9_253=0.0;
float l9_254=1000.0;
float l9_255=l9_252;
float l9_256=l9_253;
float l9_257=l9_254;
float l9_258=0.99998999;
float l9_259=fast::clamp(l9_255,l9_256,l9_257);
float l9_260=l9_256;
float l9_261=l9_257;
float l9_262=0.0;
float l9_263=l9_258;
float l9_264=l9_262+(((l9_259-l9_260)*(l9_263-l9_262))/(l9_261-l9_260));
float l9_265=l9_264;
float4 l9_266=float4(1.0,255.0,65025.0,16581375.0)*l9_265;
l9_266=fract(l9_266);
l9_266-=(l9_266.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_267=l9_266;
float4 l9_268=l9_267;
float4 l9_269=l9_268;
l9_1=l9_269;
l9_6=l9_1.x;
l9_7=l9_1.y;
l9_8=l9_1.z;
l9_9=l9_1.w;
float l9_270=gParticle.Quaternion.x;
float l9_271=-1.0;
float l9_272=1.0;
float l9_273=l9_270;
float l9_274=l9_271;
float l9_275=l9_272;
float l9_276=0.99998999;
float l9_277=fast::clamp(l9_273,l9_274,l9_275);
float l9_278=l9_274;
float l9_279=l9_275;
float l9_280=0.0;
float l9_281=l9_276;
float l9_282=l9_280+(((l9_277-l9_278)*(l9_281-l9_280))/(l9_279-l9_278));
float l9_283=l9_282;
float4 l9_284=float4(1.0,255.0,65025.0,16581375.0)*l9_283;
l9_284=fract(l9_284);
l9_284-=(l9_284.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_285=l9_284.xy;
float2 l9_286=l9_285;
float2 l9_287=l9_286;
l9_1=float4(l9_287.x,l9_287.y,l9_1.z,l9_1.w);
l9_10=l9_1.x;
l9_11=l9_1.y;
float l9_288=gParticle.Quaternion.y;
float l9_289=-1.0;
float l9_290=1.0;
float l9_291=l9_288;
float l9_292=l9_289;
float l9_293=l9_290;
float l9_294=0.99998999;
float l9_295=fast::clamp(l9_291,l9_292,l9_293);
float l9_296=l9_292;
float l9_297=l9_293;
float l9_298=0.0;
float l9_299=l9_294;
float l9_300=l9_298+(((l9_295-l9_296)*(l9_299-l9_298))/(l9_297-l9_296));
float l9_301=l9_300;
float4 l9_302=float4(1.0,255.0,65025.0,16581375.0)*l9_301;
l9_302=fract(l9_302);
l9_302-=(l9_302.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_303=l9_302.xy;
float2 l9_304=l9_303;
float2 l9_305=l9_304;
l9_1=float4(l9_305.x,l9_305.y,l9_1.z,l9_1.w);
l9_12=l9_1.x;
l9_13=l9_1.y;
float l9_306=gParticle.Quaternion.z;
float l9_307=-1.0;
float l9_308=1.0;
float l9_309=l9_306;
float l9_310=l9_307;
float l9_311=l9_308;
float l9_312=0.99998999;
float l9_313=fast::clamp(l9_309,l9_310,l9_311);
float l9_314=l9_310;
float l9_315=l9_311;
float l9_316=0.0;
float l9_317=l9_312;
float l9_318=l9_316+(((l9_313-l9_314)*(l9_317-l9_316))/(l9_315-l9_314));
float l9_319=l9_318;
float4 l9_320=float4(1.0,255.0,65025.0,16581375.0)*l9_319;
l9_320=fract(l9_320);
l9_320-=(l9_320.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_321=l9_320.xy;
float2 l9_322=l9_321;
float2 l9_323=l9_322;
l9_1=float4(l9_323.x,l9_323.y,l9_1.z,l9_1.w);
l9_14=l9_1.x;
l9_15=l9_1.y;
float l9_324=gParticle.Quaternion.w;
float l9_325=-1.0;
float l9_326=1.0;
float l9_327=l9_324;
float l9_328=l9_325;
float l9_329=l9_326;
float l9_330=0.99998999;
float l9_331=fast::clamp(l9_327,l9_328,l9_329);
float l9_332=l9_328;
float l9_333=l9_329;
float l9_334=0.0;
float l9_335=l9_330;
float l9_336=l9_334+(((l9_331-l9_332)*(l9_335-l9_334))/(l9_333-l9_332));
float l9_337=l9_336;
float4 l9_338=float4(1.0,255.0,65025.0,16581375.0)*l9_337;
l9_338=fract(l9_338);
l9_338-=(l9_338.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_339=l9_338.xy;
float2 l9_340=l9_339;
float2 l9_341=l9_340;
l9_1=float4(l9_341.x,l9_341.y,l9_1.z,l9_1.w);
l9_16=l9_1.x;
l9_17=l9_1.y;
}
}
}
}
float4 param_1=float4(l9_2,l9_3,l9_4,l9_5);
float4 param_2=float4(l9_6,l9_7,l9_8,l9_9);
float4 param_3=float4(l9_10,l9_11,l9_12,l9_13);
float4 param_4=float4(l9_14,l9_15,l9_16,l9_17);
Data0=param_1;
Data1=param_2;
Data2=param_3;
Data3=param_4;
if (dot(((Data0+Data1)+Data2)+Data3,float4(0.23454))==0.34231836)
{
Data0+=float4(1e-06);
}
float4 param_5=Data0;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_5.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_5;
float4 param_6=Data1;
out.FragColor1=param_6;
float4 param_7=Data2;
out.FragColor2=param_7;
float4 param_8=Data3;
out.FragColor3=param_8;
return out;
}
} // FRAGMENT SHADER
