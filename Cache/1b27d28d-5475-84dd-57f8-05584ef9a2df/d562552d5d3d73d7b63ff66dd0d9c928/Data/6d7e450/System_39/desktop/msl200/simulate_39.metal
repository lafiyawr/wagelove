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
//ubo int UserUniforms 0:33:7968 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_StereoClipPlanes 3664:[2]:16
//int overrideTimeEnabled 3980
//float overrideTimeElapsed 3984:[32]:4
//float overrideTimeDelta 4112
//bool vfxBatchEnable 4120:[32]:4
//float3 vfxLocalAabbMin 6624
//float3 vfxLocalAabbMax 6640
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
//float Port_Input1_N292 7344
//float3 Port_Min_N293 7360
//float3 Port_Max_N293 7376
//float Port_Import_N296 7392
//float Port_Input1_N298 7396
//float3 Port_Max_N299 7408
//float Port_Input1_N021 7424
//float Port_Input1_N067 7428
//float Port_Input2_N067 7432
//float3 Port_Import_N304 7440
//float Port_Input1_N319 7456
//float Port_Input1_N322 7460
//float3 Port_Import_N075 7472
//float3 Port_Import_N076 7488
//float Port_Import_N058 7508
//float3 Port_Input2_N060 7536
//float Port_Import_N099 7552
//float Port_Import_N109 7556
//float3 Port_Import_N081 7568
//float Port_RangeMinA_N178 7584
//float Port_RangeMaxA_N178 7588
//float Port_RangeMinB_N178 7592
//float Port_RangeMaxB_N178 7596
//float Port_Value4_N102 7604
//float Port_Value4_N117 7608
//float Port_Value4_N126 7612
//float4 Port_Column3_N127 7616
//float Port_RangeMinA_N133 7632
//float Port_RangeMaxA_N133 7636
//float Port_Input1_N114 7640
//float Port_Input2_N114 7644
//float Port_RangeMaxB_N133 7648
//float Port_Input1_N018 7652
//float Port_Input1_N066 7656
//float Port_Input2_N066 7660
//float Port_Input1_N237 7696
//float Port_Input1_N201 7700
//float Port_Input2_N201 7704
//float3 Port_Import_N205 7728
//float3 Port_Import_N206 7744
//float Port_Multiplier_N207 7760
//float3 Port_Import_N210 7776
//float Port_Input1_N222 7792
//float Port_Input1_N229 7796
//float Port_Import_N049 7800
//float Port_Import_N051 7804
//float Port_Import_N050 7808
//float Port_Input4_N224 7812
//float Port_Input1_N241 7816
//float Port_Input1_N200 7820
//float Port_Input2_N200 7824
//float Port_Input1_N063 7832
//float Port_Input2_N063 7836
//float Port_Input1_N008 7844
//float4 Port_Input1_N065 7856
//float Port_Min_N019 7872
//float Port_Max_N019 7876
//float Port_Input1_N166 7880
//float Port_Input1_N164 7884
//float Port_Input1_N165 7888
//float Port_Input2_N165 7892
//float Port_Position1_N172 7896
//float Port_Position2_N172 7900
//float Port_Position3_N172 7904
//float Port_Import_N079 7908
//float Port_Import_N091 7912
//float Port_Input0_N143 7920
//float Port_Input1_N266 7924
//float Port_Input2_N266 7928
//float Port_Input1_N182 7940
//float Port_Input2_N182 7944
//float Port_Input0_N193 7948
//float Port_Import_N188 7952
//float Port_Input1_N236 7960
//float Port_Input2_N236 7964
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
float3 Port_Import_N290;
float Port_Input1_N292;
float3 Port_Min_N293;
float3 Port_Max_N293;
float Port_Import_N296;
float Port_Input1_N298;
float3 Port_Max_N299;
float Port_Input1_N021;
float Port_Input1_N067;
float Port_Input2_N067;
float Port_Import_N302;
float3 Port_Import_N304;
float Port_Input1_N319;
float Port_Input1_N322;
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
float Port_Import_N213;
float Port_Input1_N063;
float Port_Input2_N063;
float Port_Import_N252;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_4/1600];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float Delay=0.0;
float Warmup=0.0;
gParticle.Age=mod((Globals.gTimeElapsedShifted-gParticle.SpawnOffset)+Warmup,8.0);
float l9_5=Globals.gTimeElapsed;
float l9_6=gParticle.SpawnOffset;
float l9_7=Delay;
float l9_8=Warmup;
bool l9_9=(l9_5-l9_6)<(l9_7-l9_8);
bool l9_10;
if (!l9_9)
{
l9_10=gParticle.Age>8.0;
}
else
{
l9_10=l9_9;
}
bool Dead=l9_10 ? true : false;
bool l9_11=Dead;
bool l9_12=!l9_11;
bool l9_13;
if (l9_12)
{
l9_13=gParticle.Life<=9.9999997e-05;
}
else
{
l9_13=l9_12;
}
bool l9_14;
if (!l9_13)
{
l9_14=mod(((fast::max(Globals.gTimeElapsed,0.1)-gParticle.SpawnOffset)-Delay)+Warmup,8.0)<=Globals.gTimeDelta;
}
else
{
l9_14=l9_13;
}
if (l9_14)
{
if (Globals.gTimeDelta!=0.0)
{
ssGlobals param_1=Globals;
ssParticle l9_15=gParticle;
int l9_16=int(gParticle.CopyId);
float l9_17;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_17=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_16];
}
else
{
l9_17=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_18=l9_17;
l9_15.Seed=(l9_15.Ratio1D*0.97637898)+0.151235;
l9_15.Seed+=(floor(((((l9_18-l9_15.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
l9_15.Seed=fract(abs(l9_15.Seed));
int2 l9_19=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_19)+float2(1.0))/float2(399.0);
gParticle=l9_15;
float l9_20=40.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_20)))/l9_20)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_20))/l9_20)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=8.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
float3 l9_21=float3(0.0);
float l9_22=1.0;
float3 l9_23=float3(0.0);
float3 l9_24=float3(0.0);
ssGlobals l9_25=param_1;
float l9_26=0.0;
float l9_27=float((*sc_set0.UserUniforms).isIdle!=0);
l9_26=l9_27;
l9_22=l9_26;
float3 l9_28;
if ((l9_22*1.0)!=0.0)
{
float l9_29=0.0;
float l9_30=(*sc_set0.UserUniforms).Port_TimeBias_N052;
float l9_31=(*sc_set0.UserUniforms).Port_ValueA_N052;
float l9_32=(*sc_set0.UserUniforms).Port_TimeA_N052;
float l9_33=(*sc_set0.UserUniforms).Port_TimeTransition_N052;
float l9_34=(*sc_set0.UserUniforms).Port_ValueB_N052;
float l9_35=(*sc_set0.UserUniforms).Port_TimeB_N052;
ssGlobals l9_36=l9_25;
float l9_37=((l9_32+l9_33)+l9_35)+9.9999997e-05;
float l9_38=l9_32/l9_37;
float l9_39=1.0-(l9_35/l9_37);
float l9_40=(mod((l9_36.gTimeElapsedShifted/l9_37)+l9_30,1.0)*2.0)-1.0;
float l9_41=abs(l9_40);
float l9_42=mix(l9_31,l9_34,smoothstep(l9_38,l9_39,l9_41));
l9_29=l9_42;
float l9_43=0.0;
l9_43=l9_29*(*sc_set0.UserUniforms).Port_Input1_N053;
float3 l9_44=float3(0.0);
l9_44=float3(float2(l9_43).x,float2(l9_43).y,0.0);
l9_23=l9_44;
l9_28=l9_23;
}
else
{
float3 l9_45=float3(0.0);
float3 l9_46=(*sc_set0.UserUniforms).influencePosition;
l9_45=l9_46;
l9_24=l9_45;
l9_28=l9_24;
}
l9_21=l9_28;
float3 l9_47=float3(0.0);
l9_47=l9_21;
float l9_48=0.0;
float l9_49=0.0;
float l9_50=0.0;
float l9_51=0.0;
ssGlobals l9_52=param_1;
float l9_53=0.0;
l9_53=0.0;
float l9_54=0.0;
l9_54=float(l9_53==(*sc_set0.UserUniforms).Port_Input1_N292);
l9_49=l9_54;
float l9_55;
if ((l9_49*1.0)!=0.0)
{
float3 l9_56=float3(0.0);
float3 l9_57=(*sc_set0.UserUniforms).Port_Min_N293;
float3 l9_58=(*sc_set0.UserUniforms).Port_Max_N293;
ssGlobals l9_59=l9_52;
int l9_60=3;
bool l9_61=true;
bool l9_62=true;
bool l9_63=true;
float l9_64=293.0;
ssParticle l9_65=gParticle;
float l9_66=0.0;
float l9_67=l9_59.gTimeElapsed;
float4 l9_68=float4(0.0);
float4 l9_69=float4(0.0);
if (l9_61)
{
l9_69.x=floor(fract(l9_67)*1000.0);
}
if (l9_63)
{
l9_69.y=float(l9_65.Index1D^((l9_65.Index1D*15299)+l9_65.Index1D));
}
if (l9_62)
{
l9_69.z=l9_64;
}
l9_69.w=l9_66*1000.0;
int l9_70=int(l9_69.x);
int l9_71=int(l9_69.y);
int l9_72=int(l9_69.z);
int l9_73=int(l9_69.w);
int l9_74=(((l9_70*15299)^(l9_71*30133))^(l9_72*17539))^(l9_73*12113);
int l9_75=l9_74;
if (l9_60==1)
{
int l9_76=l9_75;
int l9_77=l9_76;
int l9_78=((l9_77*((l9_77*1471343)+101146501))+1559861749)&2147483647;
int l9_79=l9_78;
float l9_80=float(l9_79)*4.6566129e-10;
float l9_81=l9_80;
l9_68.x=l9_81;
}
else
{
if (l9_60==2)
{
int l9_82=l9_75;
int l9_83=l9_82;
int l9_84=((l9_83*((l9_83*1471343)+101146501))+1559861749)&2147483647;
int l9_85=l9_84;
int l9_86=l9_82*1399;
int l9_87=((l9_86*((l9_86*1471343)+101146501))+1559861749)&2147483647;
int l9_88=l9_87;
int l9_89=l9_85;
float l9_90=float(l9_89)*4.6566129e-10;
int l9_91=l9_88;
float l9_92=float(l9_91)*4.6566129e-10;
float2 l9_93=float2(l9_90,l9_92);
l9_68=float4(l9_93.x,l9_93.y,l9_68.z,l9_68.w);
}
else
{
if (l9_60==3)
{
int l9_94=l9_75;
int l9_95=l9_94;
int l9_96=((l9_95*((l9_95*1471343)+101146501))+1559861749)&2147483647;
int l9_97=l9_96;
int l9_98=l9_94*1399;
int l9_99=((l9_98*((l9_98*1471343)+101146501))+1559861749)&2147483647;
int l9_100=l9_99;
int l9_101=l9_94*7177;
int l9_102=((l9_101*((l9_101*1471343)+101146501))+1559861749)&2147483647;
int l9_103=l9_102;
int l9_104=l9_97;
float l9_105=float(l9_104)*4.6566129e-10;
int l9_106=l9_100;
float l9_107=float(l9_106)*4.6566129e-10;
int l9_108=l9_103;
float l9_109=float(l9_108)*4.6566129e-10;
float3 l9_110=float3(l9_105,l9_107,l9_109);
l9_68=float4(l9_110.x,l9_110.y,l9_110.z,l9_68.w);
}
else
{
int l9_111=l9_75;
int l9_112=l9_111;
int l9_113=((l9_112*((l9_112*1471343)+101146501))+1559861749)&2147483647;
int l9_114=l9_113;
int l9_115=l9_111*1399;
int l9_116=((l9_115*((l9_115*1471343)+101146501))+1559861749)&2147483647;
int l9_117=l9_116;
int l9_118=l9_111*7177;
int l9_119=((l9_118*((l9_118*1471343)+101146501))+1559861749)&2147483647;
int l9_120=l9_119;
int l9_121=l9_111*18919;
int l9_122=((l9_121*((l9_121*1471343)+101146501))+1559861749)&2147483647;
int l9_123=l9_122;
int l9_124=l9_114;
float l9_125=float(l9_124)*4.6566129e-10;
int l9_126=l9_117;
float l9_127=float(l9_126)*4.6566129e-10;
int l9_128=l9_120;
float l9_129=float(l9_128)*4.6566129e-10;
int l9_130=l9_123;
float l9_131=float(l9_130)*4.6566129e-10;
float4 l9_132=float4(l9_125,l9_127,l9_129,l9_131);
l9_68=l9_132;
}
}
}
float4 l9_133=l9_68;
float4 l9_134=l9_133;
float3 l9_135=mix(l9_57,l9_58,l9_134.xyz);
l9_56=l9_135;
float l9_136=0.0;
l9_136=length(l9_56);
float3 l9_137=float3(0.0);
l9_137=l9_56/(float3(l9_136)+float3(1.234e-06));
float l9_138=0.0;
l9_138=fast::clamp((*sc_set0.UserUniforms).Port_Import_N296,0.0,1.0);
float l9_139=0.0;
l9_139=1.0-l9_138;
float l9_140=0.0;
float l9_141;
if (l9_139<=0.0)
{
l9_141=0.0;
}
else
{
l9_141=pow(l9_139,(*sc_set0.UserUniforms).Port_Input1_N298);
}
l9_140=l9_141;
float3 l9_142=float3(0.0);
float3 l9_143=float3(l9_140);
float3 l9_144=(*sc_set0.UserUniforms).Port_Max_N299;
ssGlobals l9_145=l9_52;
int l9_146=3;
bool l9_147=true;
bool l9_148=true;
bool l9_149=true;
float l9_150=299.0;
ssParticle l9_151=gParticle;
float l9_152=0.0;
float l9_153=l9_145.gTimeElapsed;
float4 l9_154=float4(0.0);
float4 l9_155=float4(0.0);
if (l9_147)
{
l9_155.x=floor(fract(l9_153)*1000.0);
}
if (l9_149)
{
l9_155.y=float(l9_151.Index1D^((l9_151.Index1D*15299)+l9_151.Index1D));
}
if (l9_148)
{
l9_155.z=l9_150;
}
l9_155.w=l9_152*1000.0;
int l9_156=int(l9_155.x);
int l9_157=int(l9_155.y);
int l9_158=int(l9_155.z);
int l9_159=int(l9_155.w);
int l9_160=(((l9_156*15299)^(l9_157*30133))^(l9_158*17539))^(l9_159*12113);
int l9_161=l9_160;
if (l9_146==1)
{
int l9_162=l9_161;
int l9_163=l9_162;
int l9_164=((l9_163*((l9_163*1471343)+101146501))+1559861749)&2147483647;
int l9_165=l9_164;
float l9_166=float(l9_165)*4.6566129e-10;
float l9_167=l9_166;
l9_154.x=l9_167;
}
else
{
if (l9_146==2)
{
int l9_168=l9_161;
int l9_169=l9_168;
int l9_170=((l9_169*((l9_169*1471343)+101146501))+1559861749)&2147483647;
int l9_171=l9_170;
int l9_172=l9_168*1399;
int l9_173=((l9_172*((l9_172*1471343)+101146501))+1559861749)&2147483647;
int l9_174=l9_173;
int l9_175=l9_171;
float l9_176=float(l9_175)*4.6566129e-10;
int l9_177=l9_174;
float l9_178=float(l9_177)*4.6566129e-10;
float2 l9_179=float2(l9_176,l9_178);
l9_154=float4(l9_179.x,l9_179.y,l9_154.z,l9_154.w);
}
else
{
if (l9_146==3)
{
int l9_180=l9_161;
int l9_181=l9_180;
int l9_182=((l9_181*((l9_181*1471343)+101146501))+1559861749)&2147483647;
int l9_183=l9_182;
int l9_184=l9_180*1399;
int l9_185=((l9_184*((l9_184*1471343)+101146501))+1559861749)&2147483647;
int l9_186=l9_185;
int l9_187=l9_180*7177;
int l9_188=((l9_187*((l9_187*1471343)+101146501))+1559861749)&2147483647;
int l9_189=l9_188;
int l9_190=l9_183;
float l9_191=float(l9_190)*4.6566129e-10;
int l9_192=l9_186;
float l9_193=float(l9_192)*4.6566129e-10;
int l9_194=l9_189;
float l9_195=float(l9_194)*4.6566129e-10;
float3 l9_196=float3(l9_191,l9_193,l9_195);
l9_154=float4(l9_196.x,l9_196.y,l9_196.z,l9_154.w);
}
else
{
int l9_197=l9_161;
int l9_198=l9_197;
int l9_199=((l9_198*((l9_198*1471343)+101146501))+1559861749)&2147483647;
int l9_200=l9_199;
int l9_201=l9_197*1399;
int l9_202=((l9_201*((l9_201*1471343)+101146501))+1559861749)&2147483647;
int l9_203=l9_202;
int l9_204=l9_197*7177;
int l9_205=((l9_204*((l9_204*1471343)+101146501))+1559861749)&2147483647;
int l9_206=l9_205;
int l9_207=l9_197*18919;
int l9_208=((l9_207*((l9_207*1471343)+101146501))+1559861749)&2147483647;
int l9_209=l9_208;
int l9_210=l9_200;
float l9_211=float(l9_210)*4.6566129e-10;
int l9_212=l9_203;
float l9_213=float(l9_212)*4.6566129e-10;
int l9_214=l9_206;
float l9_215=float(l9_214)*4.6566129e-10;
int l9_216=l9_209;
float l9_217=float(l9_216)*4.6566129e-10;
float4 l9_218=float4(l9_211,l9_213,l9_215,l9_217);
l9_154=l9_218;
}
}
}
float4 l9_219=l9_154;
float4 l9_220=l9_219;
float3 l9_221=mix(l9_143,l9_144,l9_220.xyz);
l9_142=l9_221;
float3 l9_222=float3(0.0);
float l9_223;
if (l9_142.x<=0.0)
{
l9_223=0.0;
}
else
{
l9_223=sqrt(l9_142.x);
}
float l9_224=l9_223;
float l9_225;
if (l9_142.y<=0.0)
{
l9_225=0.0;
}
else
{
l9_225=sqrt(l9_142.y);
}
float l9_226=l9_225;
float l9_227;
if (l9_142.z<=0.0)
{
l9_227=0.0;
}
else
{
l9_227=sqrt(l9_142.z);
}
l9_222=float3(l9_224,l9_226,l9_227);
float3 l9_228=float3(0.0);
float l9_229;
if (l9_222.x<=0.0)
{
l9_229=0.0;
}
else
{
l9_229=sqrt(l9_222.x);
}
float l9_230=l9_229;
float l9_231;
if (l9_222.y<=0.0)
{
l9_231=0.0;
}
else
{
l9_231=sqrt(l9_222.y);
}
float l9_232=l9_231;
float l9_233;
if (l9_222.z<=0.0)
{
l9_233=0.0;
}
else
{
l9_233=sqrt(l9_222.z);
}
l9_228=float3(l9_230,l9_232,l9_233);
float l9_234=0.0;
float l9_235=1.0;
float l9_236=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_237=10.0;
float l9_238=0.0;
float l9_239=float((*sc_set0.UserUniforms).isIdle!=0);
l9_238=l9_239;
l9_235=l9_238;
float l9_240;
if ((l9_235*1.0)!=0.0)
{
l9_240=l9_236;
}
else
{
float l9_241=0.0;
float l9_242=1.0;
float l9_243=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_244=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_245=0.0;
float l9_246=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_245=l9_246;
l9_242=l9_245;
float l9_247;
if ((l9_242*1.0)!=0.0)
{
l9_247=l9_243;
}
else
{
l9_247=l9_244;
}
l9_241=l9_247;
l9_237=l9_241;
l9_240=l9_237;
}
l9_234=l9_240;
float l9_248=0.0;
l9_248=l9_234;
float3 l9_249=float3(0.0);
l9_249=(*sc_set0.UserUniforms).Port_Import_N304;
float3 l9_250=float3(0.0);
l9_250=((l9_137*l9_228)*float3(l9_248))*l9_249;
float l9_251=0.0;
float3 l9_252=l9_250;
float l9_253=l9_252.x;
l9_251=l9_253;
float l9_254=0.0;
l9_254=abs(l9_251);
l9_50=l9_254;
l9_55=l9_50;
}
else
{
float3 l9_255=float3(0.0);
float3 l9_256=(*sc_set0.UserUniforms).Port_Min_N293;
float3 l9_257=(*sc_set0.UserUniforms).Port_Max_N293;
ssGlobals l9_258=l9_52;
int l9_259=3;
bool l9_260=true;
bool l9_261=true;
bool l9_262=true;
float l9_263=293.0;
ssParticle l9_264=gParticle;
float l9_265=0.0;
float l9_266=l9_258.gTimeElapsed;
float4 l9_267=float4(0.0);
float4 l9_268=float4(0.0);
if (l9_260)
{
l9_268.x=floor(fract(l9_266)*1000.0);
}
if (l9_262)
{
l9_268.y=float(l9_264.Index1D^((l9_264.Index1D*15299)+l9_264.Index1D));
}
if (l9_261)
{
l9_268.z=l9_263;
}
l9_268.w=l9_265*1000.0;
int l9_269=int(l9_268.x);
int l9_270=int(l9_268.y);
int l9_271=int(l9_268.z);
int l9_272=int(l9_268.w);
int l9_273=(((l9_269*15299)^(l9_270*30133))^(l9_271*17539))^(l9_272*12113);
int l9_274=l9_273;
if (l9_259==1)
{
int l9_275=l9_274;
int l9_276=l9_275;
int l9_277=((l9_276*((l9_276*1471343)+101146501))+1559861749)&2147483647;
int l9_278=l9_277;
float l9_279=float(l9_278)*4.6566129e-10;
float l9_280=l9_279;
l9_267.x=l9_280;
}
else
{
if (l9_259==2)
{
int l9_281=l9_274;
int l9_282=l9_281;
int l9_283=((l9_282*((l9_282*1471343)+101146501))+1559861749)&2147483647;
int l9_284=l9_283;
int l9_285=l9_281*1399;
int l9_286=((l9_285*((l9_285*1471343)+101146501))+1559861749)&2147483647;
int l9_287=l9_286;
int l9_288=l9_284;
float l9_289=float(l9_288)*4.6566129e-10;
int l9_290=l9_287;
float l9_291=float(l9_290)*4.6566129e-10;
float2 l9_292=float2(l9_289,l9_291);
l9_267=float4(l9_292.x,l9_292.y,l9_267.z,l9_267.w);
}
else
{
if (l9_259==3)
{
int l9_293=l9_274;
int l9_294=l9_293;
int l9_295=((l9_294*((l9_294*1471343)+101146501))+1559861749)&2147483647;
int l9_296=l9_295;
int l9_297=l9_293*1399;
int l9_298=((l9_297*((l9_297*1471343)+101146501))+1559861749)&2147483647;
int l9_299=l9_298;
int l9_300=l9_293*7177;
int l9_301=((l9_300*((l9_300*1471343)+101146501))+1559861749)&2147483647;
int l9_302=l9_301;
int l9_303=l9_296;
float l9_304=float(l9_303)*4.6566129e-10;
int l9_305=l9_299;
float l9_306=float(l9_305)*4.6566129e-10;
int l9_307=l9_302;
float l9_308=float(l9_307)*4.6566129e-10;
float3 l9_309=float3(l9_304,l9_306,l9_308);
l9_267=float4(l9_309.x,l9_309.y,l9_309.z,l9_267.w);
}
else
{
int l9_310=l9_274;
int l9_311=l9_310;
int l9_312=((l9_311*((l9_311*1471343)+101146501))+1559861749)&2147483647;
int l9_313=l9_312;
int l9_314=l9_310*1399;
int l9_315=((l9_314*((l9_314*1471343)+101146501))+1559861749)&2147483647;
int l9_316=l9_315;
int l9_317=l9_310*7177;
int l9_318=((l9_317*((l9_317*1471343)+101146501))+1559861749)&2147483647;
int l9_319=l9_318;
int l9_320=l9_310*18919;
int l9_321=((l9_320*((l9_320*1471343)+101146501))+1559861749)&2147483647;
int l9_322=l9_321;
int l9_323=l9_313;
float l9_324=float(l9_323)*4.6566129e-10;
int l9_325=l9_316;
float l9_326=float(l9_325)*4.6566129e-10;
int l9_327=l9_319;
float l9_328=float(l9_327)*4.6566129e-10;
int l9_329=l9_322;
float l9_330=float(l9_329)*4.6566129e-10;
float4 l9_331=float4(l9_324,l9_326,l9_328,l9_330);
l9_267=l9_331;
}
}
}
float4 l9_332=l9_267;
float4 l9_333=l9_332;
float3 l9_334=mix(l9_256,l9_257,l9_333.xyz);
l9_255=l9_334;
float l9_335=0.0;
l9_335=length(l9_255);
float3 l9_336=float3(0.0);
l9_336=l9_255/(float3(l9_335)+float3(1.234e-06));
float l9_337=0.0;
l9_337=fast::clamp((*sc_set0.UserUniforms).Port_Import_N296,0.0,1.0);
float l9_338=0.0;
l9_338=1.0-l9_337;
float l9_339=0.0;
float l9_340;
if (l9_338<=0.0)
{
l9_340=0.0;
}
else
{
l9_340=pow(l9_338,(*sc_set0.UserUniforms).Port_Input1_N298);
}
l9_339=l9_340;
float3 l9_341=float3(0.0);
float3 l9_342=float3(l9_339);
float3 l9_343=(*sc_set0.UserUniforms).Port_Max_N299;
ssGlobals l9_344=l9_52;
int l9_345=3;
bool l9_346=true;
bool l9_347=true;
bool l9_348=true;
float l9_349=299.0;
ssParticle l9_350=gParticle;
float l9_351=0.0;
float l9_352=l9_344.gTimeElapsed;
float4 l9_353=float4(0.0);
float4 l9_354=float4(0.0);
if (l9_346)
{
l9_354.x=floor(fract(l9_352)*1000.0);
}
if (l9_348)
{
l9_354.y=float(l9_350.Index1D^((l9_350.Index1D*15299)+l9_350.Index1D));
}
if (l9_347)
{
l9_354.z=l9_349;
}
l9_354.w=l9_351*1000.0;
int l9_355=int(l9_354.x);
int l9_356=int(l9_354.y);
int l9_357=int(l9_354.z);
int l9_358=int(l9_354.w);
int l9_359=(((l9_355*15299)^(l9_356*30133))^(l9_357*17539))^(l9_358*12113);
int l9_360=l9_359;
if (l9_345==1)
{
int l9_361=l9_360;
int l9_362=l9_361;
int l9_363=((l9_362*((l9_362*1471343)+101146501))+1559861749)&2147483647;
int l9_364=l9_363;
float l9_365=float(l9_364)*4.6566129e-10;
float l9_366=l9_365;
l9_353.x=l9_366;
}
else
{
if (l9_345==2)
{
int l9_367=l9_360;
int l9_368=l9_367;
int l9_369=((l9_368*((l9_368*1471343)+101146501))+1559861749)&2147483647;
int l9_370=l9_369;
int l9_371=l9_367*1399;
int l9_372=((l9_371*((l9_371*1471343)+101146501))+1559861749)&2147483647;
int l9_373=l9_372;
int l9_374=l9_370;
float l9_375=float(l9_374)*4.6566129e-10;
int l9_376=l9_373;
float l9_377=float(l9_376)*4.6566129e-10;
float2 l9_378=float2(l9_375,l9_377);
l9_353=float4(l9_378.x,l9_378.y,l9_353.z,l9_353.w);
}
else
{
if (l9_345==3)
{
int l9_379=l9_360;
int l9_380=l9_379;
int l9_381=((l9_380*((l9_380*1471343)+101146501))+1559861749)&2147483647;
int l9_382=l9_381;
int l9_383=l9_379*1399;
int l9_384=((l9_383*((l9_383*1471343)+101146501))+1559861749)&2147483647;
int l9_385=l9_384;
int l9_386=l9_379*7177;
int l9_387=((l9_386*((l9_386*1471343)+101146501))+1559861749)&2147483647;
int l9_388=l9_387;
int l9_389=l9_382;
float l9_390=float(l9_389)*4.6566129e-10;
int l9_391=l9_385;
float l9_392=float(l9_391)*4.6566129e-10;
int l9_393=l9_388;
float l9_394=float(l9_393)*4.6566129e-10;
float3 l9_395=float3(l9_390,l9_392,l9_394);
l9_353=float4(l9_395.x,l9_395.y,l9_395.z,l9_353.w);
}
else
{
int l9_396=l9_360;
int l9_397=l9_396;
int l9_398=((l9_397*((l9_397*1471343)+101146501))+1559861749)&2147483647;
int l9_399=l9_398;
int l9_400=l9_396*1399;
int l9_401=((l9_400*((l9_400*1471343)+101146501))+1559861749)&2147483647;
int l9_402=l9_401;
int l9_403=l9_396*7177;
int l9_404=((l9_403*((l9_403*1471343)+101146501))+1559861749)&2147483647;
int l9_405=l9_404;
int l9_406=l9_396*18919;
int l9_407=((l9_406*((l9_406*1471343)+101146501))+1559861749)&2147483647;
int l9_408=l9_407;
int l9_409=l9_399;
float l9_410=float(l9_409)*4.6566129e-10;
int l9_411=l9_402;
float l9_412=float(l9_411)*4.6566129e-10;
int l9_413=l9_405;
float l9_414=float(l9_413)*4.6566129e-10;
int l9_415=l9_408;
float l9_416=float(l9_415)*4.6566129e-10;
float4 l9_417=float4(l9_410,l9_412,l9_414,l9_416);
l9_353=l9_417;
}
}
}
float4 l9_418=l9_353;
float4 l9_419=l9_418;
float3 l9_420=mix(l9_342,l9_343,l9_419.xyz);
l9_341=l9_420;
float3 l9_421=float3(0.0);
float l9_422;
if (l9_341.x<=0.0)
{
l9_422=0.0;
}
else
{
l9_422=sqrt(l9_341.x);
}
float l9_423=l9_422;
float l9_424;
if (l9_341.y<=0.0)
{
l9_424=0.0;
}
else
{
l9_424=sqrt(l9_341.y);
}
float l9_425=l9_424;
float l9_426;
if (l9_341.z<=0.0)
{
l9_426=0.0;
}
else
{
l9_426=sqrt(l9_341.z);
}
l9_421=float3(l9_423,l9_425,l9_426);
float3 l9_427=float3(0.0);
float l9_428;
if (l9_421.x<=0.0)
{
l9_428=0.0;
}
else
{
l9_428=sqrt(l9_421.x);
}
float l9_429=l9_428;
float l9_430;
if (l9_421.y<=0.0)
{
l9_430=0.0;
}
else
{
l9_430=sqrt(l9_421.y);
}
float l9_431=l9_430;
float l9_432;
if (l9_421.z<=0.0)
{
l9_432=0.0;
}
else
{
l9_432=sqrt(l9_421.z);
}
l9_427=float3(l9_429,l9_431,l9_432);
float l9_433=0.0;
float l9_434=1.0;
float l9_435=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_436=10.0;
float l9_437=0.0;
float l9_438=float((*sc_set0.UserUniforms).isIdle!=0);
l9_437=l9_438;
l9_434=l9_437;
float l9_439;
if ((l9_434*1.0)!=0.0)
{
l9_439=l9_435;
}
else
{
float l9_440=0.0;
float l9_441=1.0;
float l9_442=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_443=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_444=0.0;
float l9_445=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_444=l9_445;
l9_441=l9_444;
float l9_446;
if ((l9_441*1.0)!=0.0)
{
l9_446=l9_442;
}
else
{
l9_446=l9_443;
}
l9_440=l9_446;
l9_436=l9_440;
l9_439=l9_436;
}
l9_433=l9_439;
float l9_447=0.0;
l9_447=l9_433;
float3 l9_448=float3(0.0);
l9_448=(*sc_set0.UserUniforms).Port_Import_N304;
float3 l9_449=float3(0.0);
l9_449=((l9_336*l9_427)*float3(l9_447))*l9_448;
float l9_450=0.0;
float3 l9_451=l9_449;
float l9_452=l9_451.x;
l9_450=l9_452;
l9_51=l9_450;
l9_55=l9_51;
}
l9_48=l9_55;
float l9_453=0.0;
float l9_454=0.0;
float l9_455=0.0;
float l9_456=0.0;
ssGlobals l9_457=param_1;
float l9_458=0.0;
l9_458=0.0;
float l9_459=0.0;
l9_459=float(l9_458==(*sc_set0.UserUniforms).Port_Input1_N319);
l9_454=l9_459;
float l9_460;
if ((l9_454*1.0)!=0.0)
{
float3 l9_461=float3(0.0);
float3 l9_462=(*sc_set0.UserUniforms).Port_Min_N293;
float3 l9_463=(*sc_set0.UserUniforms).Port_Max_N293;
ssGlobals l9_464=l9_457;
int l9_465=3;
bool l9_466=true;
bool l9_467=true;
bool l9_468=true;
float l9_469=293.0;
ssParticle l9_470=gParticle;
float l9_471=0.0;
float l9_472=l9_464.gTimeElapsed;
float4 l9_473=float4(0.0);
float4 l9_474=float4(0.0);
if (l9_466)
{
l9_474.x=floor(fract(l9_472)*1000.0);
}
if (l9_468)
{
l9_474.y=float(l9_470.Index1D^((l9_470.Index1D*15299)+l9_470.Index1D));
}
if (l9_467)
{
l9_474.z=l9_469;
}
l9_474.w=l9_471*1000.0;
int l9_475=int(l9_474.x);
int l9_476=int(l9_474.y);
int l9_477=int(l9_474.z);
int l9_478=int(l9_474.w);
int l9_479=(((l9_475*15299)^(l9_476*30133))^(l9_477*17539))^(l9_478*12113);
int l9_480=l9_479;
if (l9_465==1)
{
int l9_481=l9_480;
int l9_482=l9_481;
int l9_483=((l9_482*((l9_482*1471343)+101146501))+1559861749)&2147483647;
int l9_484=l9_483;
float l9_485=float(l9_484)*4.6566129e-10;
float l9_486=l9_485;
l9_473.x=l9_486;
}
else
{
if (l9_465==2)
{
int l9_487=l9_480;
int l9_488=l9_487;
int l9_489=((l9_488*((l9_488*1471343)+101146501))+1559861749)&2147483647;
int l9_490=l9_489;
int l9_491=l9_487*1399;
int l9_492=((l9_491*((l9_491*1471343)+101146501))+1559861749)&2147483647;
int l9_493=l9_492;
int l9_494=l9_490;
float l9_495=float(l9_494)*4.6566129e-10;
int l9_496=l9_493;
float l9_497=float(l9_496)*4.6566129e-10;
float2 l9_498=float2(l9_495,l9_497);
l9_473=float4(l9_498.x,l9_498.y,l9_473.z,l9_473.w);
}
else
{
if (l9_465==3)
{
int l9_499=l9_480;
int l9_500=l9_499;
int l9_501=((l9_500*((l9_500*1471343)+101146501))+1559861749)&2147483647;
int l9_502=l9_501;
int l9_503=l9_499*1399;
int l9_504=((l9_503*((l9_503*1471343)+101146501))+1559861749)&2147483647;
int l9_505=l9_504;
int l9_506=l9_499*7177;
int l9_507=((l9_506*((l9_506*1471343)+101146501))+1559861749)&2147483647;
int l9_508=l9_507;
int l9_509=l9_502;
float l9_510=float(l9_509)*4.6566129e-10;
int l9_511=l9_505;
float l9_512=float(l9_511)*4.6566129e-10;
int l9_513=l9_508;
float l9_514=float(l9_513)*4.6566129e-10;
float3 l9_515=float3(l9_510,l9_512,l9_514);
l9_473=float4(l9_515.x,l9_515.y,l9_515.z,l9_473.w);
}
else
{
int l9_516=l9_480;
int l9_517=l9_516;
int l9_518=((l9_517*((l9_517*1471343)+101146501))+1559861749)&2147483647;
int l9_519=l9_518;
int l9_520=l9_516*1399;
int l9_521=((l9_520*((l9_520*1471343)+101146501))+1559861749)&2147483647;
int l9_522=l9_521;
int l9_523=l9_516*7177;
int l9_524=((l9_523*((l9_523*1471343)+101146501))+1559861749)&2147483647;
int l9_525=l9_524;
int l9_526=l9_516*18919;
int l9_527=((l9_526*((l9_526*1471343)+101146501))+1559861749)&2147483647;
int l9_528=l9_527;
int l9_529=l9_519;
float l9_530=float(l9_529)*4.6566129e-10;
int l9_531=l9_522;
float l9_532=float(l9_531)*4.6566129e-10;
int l9_533=l9_525;
float l9_534=float(l9_533)*4.6566129e-10;
int l9_535=l9_528;
float l9_536=float(l9_535)*4.6566129e-10;
float4 l9_537=float4(l9_530,l9_532,l9_534,l9_536);
l9_473=l9_537;
}
}
}
float4 l9_538=l9_473;
float4 l9_539=l9_538;
float3 l9_540=mix(l9_462,l9_463,l9_539.xyz);
l9_461=l9_540;
float l9_541=0.0;
l9_541=length(l9_461);
float3 l9_542=float3(0.0);
l9_542=l9_461/(float3(l9_541)+float3(1.234e-06));
float l9_543=0.0;
l9_543=fast::clamp((*sc_set0.UserUniforms).Port_Import_N296,0.0,1.0);
float l9_544=0.0;
l9_544=1.0-l9_543;
float l9_545=0.0;
float l9_546;
if (l9_544<=0.0)
{
l9_546=0.0;
}
else
{
l9_546=pow(l9_544,(*sc_set0.UserUniforms).Port_Input1_N298);
}
l9_545=l9_546;
float3 l9_547=float3(0.0);
float3 l9_548=float3(l9_545);
float3 l9_549=(*sc_set0.UserUniforms).Port_Max_N299;
ssGlobals l9_550=l9_457;
int l9_551=3;
bool l9_552=true;
bool l9_553=true;
bool l9_554=true;
float l9_555=299.0;
ssParticle l9_556=gParticle;
float l9_557=0.0;
float l9_558=l9_550.gTimeElapsed;
float4 l9_559=float4(0.0);
float4 l9_560=float4(0.0);
if (l9_552)
{
l9_560.x=floor(fract(l9_558)*1000.0);
}
if (l9_554)
{
l9_560.y=float(l9_556.Index1D^((l9_556.Index1D*15299)+l9_556.Index1D));
}
if (l9_553)
{
l9_560.z=l9_555;
}
l9_560.w=l9_557*1000.0;
int l9_561=int(l9_560.x);
int l9_562=int(l9_560.y);
int l9_563=int(l9_560.z);
int l9_564=int(l9_560.w);
int l9_565=(((l9_561*15299)^(l9_562*30133))^(l9_563*17539))^(l9_564*12113);
int l9_566=l9_565;
if (l9_551==1)
{
int l9_567=l9_566;
int l9_568=l9_567;
int l9_569=((l9_568*((l9_568*1471343)+101146501))+1559861749)&2147483647;
int l9_570=l9_569;
float l9_571=float(l9_570)*4.6566129e-10;
float l9_572=l9_571;
l9_559.x=l9_572;
}
else
{
if (l9_551==2)
{
int l9_573=l9_566;
int l9_574=l9_573;
int l9_575=((l9_574*((l9_574*1471343)+101146501))+1559861749)&2147483647;
int l9_576=l9_575;
int l9_577=l9_573*1399;
int l9_578=((l9_577*((l9_577*1471343)+101146501))+1559861749)&2147483647;
int l9_579=l9_578;
int l9_580=l9_576;
float l9_581=float(l9_580)*4.6566129e-10;
int l9_582=l9_579;
float l9_583=float(l9_582)*4.6566129e-10;
float2 l9_584=float2(l9_581,l9_583);
l9_559=float4(l9_584.x,l9_584.y,l9_559.z,l9_559.w);
}
else
{
if (l9_551==3)
{
int l9_585=l9_566;
int l9_586=l9_585;
int l9_587=((l9_586*((l9_586*1471343)+101146501))+1559861749)&2147483647;
int l9_588=l9_587;
int l9_589=l9_585*1399;
int l9_590=((l9_589*((l9_589*1471343)+101146501))+1559861749)&2147483647;
int l9_591=l9_590;
int l9_592=l9_585*7177;
int l9_593=((l9_592*((l9_592*1471343)+101146501))+1559861749)&2147483647;
int l9_594=l9_593;
int l9_595=l9_588;
float l9_596=float(l9_595)*4.6566129e-10;
int l9_597=l9_591;
float l9_598=float(l9_597)*4.6566129e-10;
int l9_599=l9_594;
float l9_600=float(l9_599)*4.6566129e-10;
float3 l9_601=float3(l9_596,l9_598,l9_600);
l9_559=float4(l9_601.x,l9_601.y,l9_601.z,l9_559.w);
}
else
{
int l9_602=l9_566;
int l9_603=l9_602;
int l9_604=((l9_603*((l9_603*1471343)+101146501))+1559861749)&2147483647;
int l9_605=l9_604;
int l9_606=l9_602*1399;
int l9_607=((l9_606*((l9_606*1471343)+101146501))+1559861749)&2147483647;
int l9_608=l9_607;
int l9_609=l9_602*7177;
int l9_610=((l9_609*((l9_609*1471343)+101146501))+1559861749)&2147483647;
int l9_611=l9_610;
int l9_612=l9_602*18919;
int l9_613=((l9_612*((l9_612*1471343)+101146501))+1559861749)&2147483647;
int l9_614=l9_613;
int l9_615=l9_605;
float l9_616=float(l9_615)*4.6566129e-10;
int l9_617=l9_608;
float l9_618=float(l9_617)*4.6566129e-10;
int l9_619=l9_611;
float l9_620=float(l9_619)*4.6566129e-10;
int l9_621=l9_614;
float l9_622=float(l9_621)*4.6566129e-10;
float4 l9_623=float4(l9_616,l9_618,l9_620,l9_622);
l9_559=l9_623;
}
}
}
float4 l9_624=l9_559;
float4 l9_625=l9_624;
float3 l9_626=mix(l9_548,l9_549,l9_625.xyz);
l9_547=l9_626;
float3 l9_627=float3(0.0);
float l9_628;
if (l9_547.x<=0.0)
{
l9_628=0.0;
}
else
{
l9_628=sqrt(l9_547.x);
}
float l9_629=l9_628;
float l9_630;
if (l9_547.y<=0.0)
{
l9_630=0.0;
}
else
{
l9_630=sqrt(l9_547.y);
}
float l9_631=l9_630;
float l9_632;
if (l9_547.z<=0.0)
{
l9_632=0.0;
}
else
{
l9_632=sqrt(l9_547.z);
}
l9_627=float3(l9_629,l9_631,l9_632);
float3 l9_633=float3(0.0);
float l9_634;
if (l9_627.x<=0.0)
{
l9_634=0.0;
}
else
{
l9_634=sqrt(l9_627.x);
}
float l9_635=l9_634;
float l9_636;
if (l9_627.y<=0.0)
{
l9_636=0.0;
}
else
{
l9_636=sqrt(l9_627.y);
}
float l9_637=l9_636;
float l9_638;
if (l9_627.z<=0.0)
{
l9_638=0.0;
}
else
{
l9_638=sqrt(l9_627.z);
}
l9_633=float3(l9_635,l9_637,l9_638);
float l9_639=0.0;
float l9_640=1.0;
float l9_641=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_642=10.0;
float l9_643=0.0;
float l9_644=float((*sc_set0.UserUniforms).isIdle!=0);
l9_643=l9_644;
l9_640=l9_643;
float l9_645;
if ((l9_640*1.0)!=0.0)
{
l9_645=l9_641;
}
else
{
float l9_646=0.0;
float l9_647=1.0;
float l9_648=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_649=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_650=0.0;
float l9_651=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_650=l9_651;
l9_647=l9_650;
float l9_652;
if ((l9_647*1.0)!=0.0)
{
l9_652=l9_648;
}
else
{
l9_652=l9_649;
}
l9_646=l9_652;
l9_642=l9_646;
l9_645=l9_642;
}
l9_639=l9_645;
float l9_653=0.0;
l9_653=l9_639;
float3 l9_654=float3(0.0);
l9_654=(*sc_set0.UserUniforms).Port_Import_N304;
float3 l9_655=float3(0.0);
l9_655=((l9_542*l9_633)*float3(l9_653))*l9_654;
float l9_656=0.0;
float3 l9_657=l9_655;
float l9_658=l9_657.y;
l9_656=l9_658;
float l9_659=0.0;
l9_659=abs(l9_656);
l9_455=l9_659;
l9_460=l9_455;
}
else
{
float3 l9_660=float3(0.0);
float3 l9_661=(*sc_set0.UserUniforms).Port_Min_N293;
float3 l9_662=(*sc_set0.UserUniforms).Port_Max_N293;
ssGlobals l9_663=l9_457;
int l9_664=3;
bool l9_665=true;
bool l9_666=true;
bool l9_667=true;
float l9_668=293.0;
ssParticle l9_669=gParticle;
float l9_670=0.0;
float l9_671=l9_663.gTimeElapsed;
float4 l9_672=float4(0.0);
float4 l9_673=float4(0.0);
if (l9_665)
{
l9_673.x=floor(fract(l9_671)*1000.0);
}
if (l9_667)
{
l9_673.y=float(l9_669.Index1D^((l9_669.Index1D*15299)+l9_669.Index1D));
}
if (l9_666)
{
l9_673.z=l9_668;
}
l9_673.w=l9_670*1000.0;
int l9_674=int(l9_673.x);
int l9_675=int(l9_673.y);
int l9_676=int(l9_673.z);
int l9_677=int(l9_673.w);
int l9_678=(((l9_674*15299)^(l9_675*30133))^(l9_676*17539))^(l9_677*12113);
int l9_679=l9_678;
if (l9_664==1)
{
int l9_680=l9_679;
int l9_681=l9_680;
int l9_682=((l9_681*((l9_681*1471343)+101146501))+1559861749)&2147483647;
int l9_683=l9_682;
float l9_684=float(l9_683)*4.6566129e-10;
float l9_685=l9_684;
l9_672.x=l9_685;
}
else
{
if (l9_664==2)
{
int l9_686=l9_679;
int l9_687=l9_686;
int l9_688=((l9_687*((l9_687*1471343)+101146501))+1559861749)&2147483647;
int l9_689=l9_688;
int l9_690=l9_686*1399;
int l9_691=((l9_690*((l9_690*1471343)+101146501))+1559861749)&2147483647;
int l9_692=l9_691;
int l9_693=l9_689;
float l9_694=float(l9_693)*4.6566129e-10;
int l9_695=l9_692;
float l9_696=float(l9_695)*4.6566129e-10;
float2 l9_697=float2(l9_694,l9_696);
l9_672=float4(l9_697.x,l9_697.y,l9_672.z,l9_672.w);
}
else
{
if (l9_664==3)
{
int l9_698=l9_679;
int l9_699=l9_698;
int l9_700=((l9_699*((l9_699*1471343)+101146501))+1559861749)&2147483647;
int l9_701=l9_700;
int l9_702=l9_698*1399;
int l9_703=((l9_702*((l9_702*1471343)+101146501))+1559861749)&2147483647;
int l9_704=l9_703;
int l9_705=l9_698*7177;
int l9_706=((l9_705*((l9_705*1471343)+101146501))+1559861749)&2147483647;
int l9_707=l9_706;
int l9_708=l9_701;
float l9_709=float(l9_708)*4.6566129e-10;
int l9_710=l9_704;
float l9_711=float(l9_710)*4.6566129e-10;
int l9_712=l9_707;
float l9_713=float(l9_712)*4.6566129e-10;
float3 l9_714=float3(l9_709,l9_711,l9_713);
l9_672=float4(l9_714.x,l9_714.y,l9_714.z,l9_672.w);
}
else
{
int l9_715=l9_679;
int l9_716=l9_715;
int l9_717=((l9_716*((l9_716*1471343)+101146501))+1559861749)&2147483647;
int l9_718=l9_717;
int l9_719=l9_715*1399;
int l9_720=((l9_719*((l9_719*1471343)+101146501))+1559861749)&2147483647;
int l9_721=l9_720;
int l9_722=l9_715*7177;
int l9_723=((l9_722*((l9_722*1471343)+101146501))+1559861749)&2147483647;
int l9_724=l9_723;
int l9_725=l9_715*18919;
int l9_726=((l9_725*((l9_725*1471343)+101146501))+1559861749)&2147483647;
int l9_727=l9_726;
int l9_728=l9_718;
float l9_729=float(l9_728)*4.6566129e-10;
int l9_730=l9_721;
float l9_731=float(l9_730)*4.6566129e-10;
int l9_732=l9_724;
float l9_733=float(l9_732)*4.6566129e-10;
int l9_734=l9_727;
float l9_735=float(l9_734)*4.6566129e-10;
float4 l9_736=float4(l9_729,l9_731,l9_733,l9_735);
l9_672=l9_736;
}
}
}
float4 l9_737=l9_672;
float4 l9_738=l9_737;
float3 l9_739=mix(l9_661,l9_662,l9_738.xyz);
l9_660=l9_739;
float l9_740=0.0;
l9_740=length(l9_660);
float3 l9_741=float3(0.0);
l9_741=l9_660/(float3(l9_740)+float3(1.234e-06));
float l9_742=0.0;
l9_742=fast::clamp((*sc_set0.UserUniforms).Port_Import_N296,0.0,1.0);
float l9_743=0.0;
l9_743=1.0-l9_742;
float l9_744=0.0;
float l9_745;
if (l9_743<=0.0)
{
l9_745=0.0;
}
else
{
l9_745=pow(l9_743,(*sc_set0.UserUniforms).Port_Input1_N298);
}
l9_744=l9_745;
float3 l9_746=float3(0.0);
float3 l9_747=float3(l9_744);
float3 l9_748=(*sc_set0.UserUniforms).Port_Max_N299;
ssGlobals l9_749=l9_457;
int l9_750=3;
bool l9_751=true;
bool l9_752=true;
bool l9_753=true;
float l9_754=299.0;
ssParticle l9_755=gParticle;
float l9_756=0.0;
float l9_757=l9_749.gTimeElapsed;
float4 l9_758=float4(0.0);
float4 l9_759=float4(0.0);
if (l9_751)
{
l9_759.x=floor(fract(l9_757)*1000.0);
}
if (l9_753)
{
l9_759.y=float(l9_755.Index1D^((l9_755.Index1D*15299)+l9_755.Index1D));
}
if (l9_752)
{
l9_759.z=l9_754;
}
l9_759.w=l9_756*1000.0;
int l9_760=int(l9_759.x);
int l9_761=int(l9_759.y);
int l9_762=int(l9_759.z);
int l9_763=int(l9_759.w);
int l9_764=(((l9_760*15299)^(l9_761*30133))^(l9_762*17539))^(l9_763*12113);
int l9_765=l9_764;
if (l9_750==1)
{
int l9_766=l9_765;
int l9_767=l9_766;
int l9_768=((l9_767*((l9_767*1471343)+101146501))+1559861749)&2147483647;
int l9_769=l9_768;
float l9_770=float(l9_769)*4.6566129e-10;
float l9_771=l9_770;
l9_758.x=l9_771;
}
else
{
if (l9_750==2)
{
int l9_772=l9_765;
int l9_773=l9_772;
int l9_774=((l9_773*((l9_773*1471343)+101146501))+1559861749)&2147483647;
int l9_775=l9_774;
int l9_776=l9_772*1399;
int l9_777=((l9_776*((l9_776*1471343)+101146501))+1559861749)&2147483647;
int l9_778=l9_777;
int l9_779=l9_775;
float l9_780=float(l9_779)*4.6566129e-10;
int l9_781=l9_778;
float l9_782=float(l9_781)*4.6566129e-10;
float2 l9_783=float2(l9_780,l9_782);
l9_758=float4(l9_783.x,l9_783.y,l9_758.z,l9_758.w);
}
else
{
if (l9_750==3)
{
int l9_784=l9_765;
int l9_785=l9_784;
int l9_786=((l9_785*((l9_785*1471343)+101146501))+1559861749)&2147483647;
int l9_787=l9_786;
int l9_788=l9_784*1399;
int l9_789=((l9_788*((l9_788*1471343)+101146501))+1559861749)&2147483647;
int l9_790=l9_789;
int l9_791=l9_784*7177;
int l9_792=((l9_791*((l9_791*1471343)+101146501))+1559861749)&2147483647;
int l9_793=l9_792;
int l9_794=l9_787;
float l9_795=float(l9_794)*4.6566129e-10;
int l9_796=l9_790;
float l9_797=float(l9_796)*4.6566129e-10;
int l9_798=l9_793;
float l9_799=float(l9_798)*4.6566129e-10;
float3 l9_800=float3(l9_795,l9_797,l9_799);
l9_758=float4(l9_800.x,l9_800.y,l9_800.z,l9_758.w);
}
else
{
int l9_801=l9_765;
int l9_802=l9_801;
int l9_803=((l9_802*((l9_802*1471343)+101146501))+1559861749)&2147483647;
int l9_804=l9_803;
int l9_805=l9_801*1399;
int l9_806=((l9_805*((l9_805*1471343)+101146501))+1559861749)&2147483647;
int l9_807=l9_806;
int l9_808=l9_801*7177;
int l9_809=((l9_808*((l9_808*1471343)+101146501))+1559861749)&2147483647;
int l9_810=l9_809;
int l9_811=l9_801*18919;
int l9_812=((l9_811*((l9_811*1471343)+101146501))+1559861749)&2147483647;
int l9_813=l9_812;
int l9_814=l9_804;
float l9_815=float(l9_814)*4.6566129e-10;
int l9_816=l9_807;
float l9_817=float(l9_816)*4.6566129e-10;
int l9_818=l9_810;
float l9_819=float(l9_818)*4.6566129e-10;
int l9_820=l9_813;
float l9_821=float(l9_820)*4.6566129e-10;
float4 l9_822=float4(l9_815,l9_817,l9_819,l9_821);
l9_758=l9_822;
}
}
}
float4 l9_823=l9_758;
float4 l9_824=l9_823;
float3 l9_825=mix(l9_747,l9_748,l9_824.xyz);
l9_746=l9_825;
float3 l9_826=float3(0.0);
float l9_827;
if (l9_746.x<=0.0)
{
l9_827=0.0;
}
else
{
l9_827=sqrt(l9_746.x);
}
float l9_828=l9_827;
float l9_829;
if (l9_746.y<=0.0)
{
l9_829=0.0;
}
else
{
l9_829=sqrt(l9_746.y);
}
float l9_830=l9_829;
float l9_831;
if (l9_746.z<=0.0)
{
l9_831=0.0;
}
else
{
l9_831=sqrt(l9_746.z);
}
l9_826=float3(l9_828,l9_830,l9_831);
float3 l9_832=float3(0.0);
float l9_833;
if (l9_826.x<=0.0)
{
l9_833=0.0;
}
else
{
l9_833=sqrt(l9_826.x);
}
float l9_834=l9_833;
float l9_835;
if (l9_826.y<=0.0)
{
l9_835=0.0;
}
else
{
l9_835=sqrt(l9_826.y);
}
float l9_836=l9_835;
float l9_837;
if (l9_826.z<=0.0)
{
l9_837=0.0;
}
else
{
l9_837=sqrt(l9_826.z);
}
l9_832=float3(l9_834,l9_836,l9_837);
float l9_838=0.0;
float l9_839=1.0;
float l9_840=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_841=10.0;
float l9_842=0.0;
float l9_843=float((*sc_set0.UserUniforms).isIdle!=0);
l9_842=l9_843;
l9_839=l9_842;
float l9_844;
if ((l9_839*1.0)!=0.0)
{
l9_844=l9_840;
}
else
{
float l9_845=0.0;
float l9_846=1.0;
float l9_847=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_848=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_849=0.0;
float l9_850=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_849=l9_850;
l9_846=l9_849;
float l9_851;
if ((l9_846*1.0)!=0.0)
{
l9_851=l9_847;
}
else
{
l9_851=l9_848;
}
l9_845=l9_851;
l9_841=l9_845;
l9_844=l9_841;
}
l9_838=l9_844;
float l9_852=0.0;
l9_852=l9_838;
float3 l9_853=float3(0.0);
l9_853=(*sc_set0.UserUniforms).Port_Import_N304;
float3 l9_854=float3(0.0);
l9_854=((l9_741*l9_832)*float3(l9_852))*l9_853;
float l9_855=0.0;
float3 l9_856=l9_854;
float l9_857=l9_856.y;
l9_855=l9_857;
l9_456=l9_855;
l9_460=l9_456;
}
l9_453=l9_460;
float l9_858=0.0;
float l9_859=0.0;
float l9_860=0.0;
float l9_861=0.0;
ssGlobals l9_862=param_1;
float l9_863=0.0;
l9_863=0.0;
float l9_864=0.0;
l9_864=float(l9_863==(*sc_set0.UserUniforms).Port_Input1_N322);
l9_859=l9_864;
float l9_865;
if ((l9_859*1.0)!=0.0)
{
float3 l9_866=float3(0.0);
float3 l9_867=(*sc_set0.UserUniforms).Port_Min_N293;
float3 l9_868=(*sc_set0.UserUniforms).Port_Max_N293;
ssGlobals l9_869=l9_862;
int l9_870=3;
bool l9_871=true;
bool l9_872=true;
bool l9_873=true;
float l9_874=293.0;
ssParticle l9_875=gParticle;
float l9_876=0.0;
float l9_877=l9_869.gTimeElapsed;
float4 l9_878=float4(0.0);
float4 l9_879=float4(0.0);
if (l9_871)
{
l9_879.x=floor(fract(l9_877)*1000.0);
}
if (l9_873)
{
l9_879.y=float(l9_875.Index1D^((l9_875.Index1D*15299)+l9_875.Index1D));
}
if (l9_872)
{
l9_879.z=l9_874;
}
l9_879.w=l9_876*1000.0;
int l9_880=int(l9_879.x);
int l9_881=int(l9_879.y);
int l9_882=int(l9_879.z);
int l9_883=int(l9_879.w);
int l9_884=(((l9_880*15299)^(l9_881*30133))^(l9_882*17539))^(l9_883*12113);
int l9_885=l9_884;
if (l9_870==1)
{
int l9_886=l9_885;
int l9_887=l9_886;
int l9_888=((l9_887*((l9_887*1471343)+101146501))+1559861749)&2147483647;
int l9_889=l9_888;
float l9_890=float(l9_889)*4.6566129e-10;
float l9_891=l9_890;
l9_878.x=l9_891;
}
else
{
if (l9_870==2)
{
int l9_892=l9_885;
int l9_893=l9_892;
int l9_894=((l9_893*((l9_893*1471343)+101146501))+1559861749)&2147483647;
int l9_895=l9_894;
int l9_896=l9_892*1399;
int l9_897=((l9_896*((l9_896*1471343)+101146501))+1559861749)&2147483647;
int l9_898=l9_897;
int l9_899=l9_895;
float l9_900=float(l9_899)*4.6566129e-10;
int l9_901=l9_898;
float l9_902=float(l9_901)*4.6566129e-10;
float2 l9_903=float2(l9_900,l9_902);
l9_878=float4(l9_903.x,l9_903.y,l9_878.z,l9_878.w);
}
else
{
if (l9_870==3)
{
int l9_904=l9_885;
int l9_905=l9_904;
int l9_906=((l9_905*((l9_905*1471343)+101146501))+1559861749)&2147483647;
int l9_907=l9_906;
int l9_908=l9_904*1399;
int l9_909=((l9_908*((l9_908*1471343)+101146501))+1559861749)&2147483647;
int l9_910=l9_909;
int l9_911=l9_904*7177;
int l9_912=((l9_911*((l9_911*1471343)+101146501))+1559861749)&2147483647;
int l9_913=l9_912;
int l9_914=l9_907;
float l9_915=float(l9_914)*4.6566129e-10;
int l9_916=l9_910;
float l9_917=float(l9_916)*4.6566129e-10;
int l9_918=l9_913;
float l9_919=float(l9_918)*4.6566129e-10;
float3 l9_920=float3(l9_915,l9_917,l9_919);
l9_878=float4(l9_920.x,l9_920.y,l9_920.z,l9_878.w);
}
else
{
int l9_921=l9_885;
int l9_922=l9_921;
int l9_923=((l9_922*((l9_922*1471343)+101146501))+1559861749)&2147483647;
int l9_924=l9_923;
int l9_925=l9_921*1399;
int l9_926=((l9_925*((l9_925*1471343)+101146501))+1559861749)&2147483647;
int l9_927=l9_926;
int l9_928=l9_921*7177;
int l9_929=((l9_928*((l9_928*1471343)+101146501))+1559861749)&2147483647;
int l9_930=l9_929;
int l9_931=l9_921*18919;
int l9_932=((l9_931*((l9_931*1471343)+101146501))+1559861749)&2147483647;
int l9_933=l9_932;
int l9_934=l9_924;
float l9_935=float(l9_934)*4.6566129e-10;
int l9_936=l9_927;
float l9_937=float(l9_936)*4.6566129e-10;
int l9_938=l9_930;
float l9_939=float(l9_938)*4.6566129e-10;
int l9_940=l9_933;
float l9_941=float(l9_940)*4.6566129e-10;
float4 l9_942=float4(l9_935,l9_937,l9_939,l9_941);
l9_878=l9_942;
}
}
}
float4 l9_943=l9_878;
float4 l9_944=l9_943;
float3 l9_945=mix(l9_867,l9_868,l9_944.xyz);
l9_866=l9_945;
float l9_946=0.0;
l9_946=length(l9_866);
float3 l9_947=float3(0.0);
l9_947=l9_866/(float3(l9_946)+float3(1.234e-06));
float l9_948=0.0;
l9_948=fast::clamp((*sc_set0.UserUniforms).Port_Import_N296,0.0,1.0);
float l9_949=0.0;
l9_949=1.0-l9_948;
float l9_950=0.0;
float l9_951;
if (l9_949<=0.0)
{
l9_951=0.0;
}
else
{
l9_951=pow(l9_949,(*sc_set0.UserUniforms).Port_Input1_N298);
}
l9_950=l9_951;
float3 l9_952=float3(0.0);
float3 l9_953=float3(l9_950);
float3 l9_954=(*sc_set0.UserUniforms).Port_Max_N299;
ssGlobals l9_955=l9_862;
int l9_956=3;
bool l9_957=true;
bool l9_958=true;
bool l9_959=true;
float l9_960=299.0;
ssParticle l9_961=gParticle;
float l9_962=0.0;
float l9_963=l9_955.gTimeElapsed;
float4 l9_964=float4(0.0);
float4 l9_965=float4(0.0);
if (l9_957)
{
l9_965.x=floor(fract(l9_963)*1000.0);
}
if (l9_959)
{
l9_965.y=float(l9_961.Index1D^((l9_961.Index1D*15299)+l9_961.Index1D));
}
if (l9_958)
{
l9_965.z=l9_960;
}
l9_965.w=l9_962*1000.0;
int l9_966=int(l9_965.x);
int l9_967=int(l9_965.y);
int l9_968=int(l9_965.z);
int l9_969=int(l9_965.w);
int l9_970=(((l9_966*15299)^(l9_967*30133))^(l9_968*17539))^(l9_969*12113);
int l9_971=l9_970;
if (l9_956==1)
{
int l9_972=l9_971;
int l9_973=l9_972;
int l9_974=((l9_973*((l9_973*1471343)+101146501))+1559861749)&2147483647;
int l9_975=l9_974;
float l9_976=float(l9_975)*4.6566129e-10;
float l9_977=l9_976;
l9_964.x=l9_977;
}
else
{
if (l9_956==2)
{
int l9_978=l9_971;
int l9_979=l9_978;
int l9_980=((l9_979*((l9_979*1471343)+101146501))+1559861749)&2147483647;
int l9_981=l9_980;
int l9_982=l9_978*1399;
int l9_983=((l9_982*((l9_982*1471343)+101146501))+1559861749)&2147483647;
int l9_984=l9_983;
int l9_985=l9_981;
float l9_986=float(l9_985)*4.6566129e-10;
int l9_987=l9_984;
float l9_988=float(l9_987)*4.6566129e-10;
float2 l9_989=float2(l9_986,l9_988);
l9_964=float4(l9_989.x,l9_989.y,l9_964.z,l9_964.w);
}
else
{
if (l9_956==3)
{
int l9_990=l9_971;
int l9_991=l9_990;
int l9_992=((l9_991*((l9_991*1471343)+101146501))+1559861749)&2147483647;
int l9_993=l9_992;
int l9_994=l9_990*1399;
int l9_995=((l9_994*((l9_994*1471343)+101146501))+1559861749)&2147483647;
int l9_996=l9_995;
int l9_997=l9_990*7177;
int l9_998=((l9_997*((l9_997*1471343)+101146501))+1559861749)&2147483647;
int l9_999=l9_998;
int l9_1000=l9_993;
float l9_1001=float(l9_1000)*4.6566129e-10;
int l9_1002=l9_996;
float l9_1003=float(l9_1002)*4.6566129e-10;
int l9_1004=l9_999;
float l9_1005=float(l9_1004)*4.6566129e-10;
float3 l9_1006=float3(l9_1001,l9_1003,l9_1005);
l9_964=float4(l9_1006.x,l9_1006.y,l9_1006.z,l9_964.w);
}
else
{
int l9_1007=l9_971;
int l9_1008=l9_1007;
int l9_1009=((l9_1008*((l9_1008*1471343)+101146501))+1559861749)&2147483647;
int l9_1010=l9_1009;
int l9_1011=l9_1007*1399;
int l9_1012=((l9_1011*((l9_1011*1471343)+101146501))+1559861749)&2147483647;
int l9_1013=l9_1012;
int l9_1014=l9_1007*7177;
int l9_1015=((l9_1014*((l9_1014*1471343)+101146501))+1559861749)&2147483647;
int l9_1016=l9_1015;
int l9_1017=l9_1007*18919;
int l9_1018=((l9_1017*((l9_1017*1471343)+101146501))+1559861749)&2147483647;
int l9_1019=l9_1018;
int l9_1020=l9_1010;
float l9_1021=float(l9_1020)*4.6566129e-10;
int l9_1022=l9_1013;
float l9_1023=float(l9_1022)*4.6566129e-10;
int l9_1024=l9_1016;
float l9_1025=float(l9_1024)*4.6566129e-10;
int l9_1026=l9_1019;
float l9_1027=float(l9_1026)*4.6566129e-10;
float4 l9_1028=float4(l9_1021,l9_1023,l9_1025,l9_1027);
l9_964=l9_1028;
}
}
}
float4 l9_1029=l9_964;
float4 l9_1030=l9_1029;
float3 l9_1031=mix(l9_953,l9_954,l9_1030.xyz);
l9_952=l9_1031;
float3 l9_1032=float3(0.0);
float l9_1033;
if (l9_952.x<=0.0)
{
l9_1033=0.0;
}
else
{
l9_1033=sqrt(l9_952.x);
}
float l9_1034=l9_1033;
float l9_1035;
if (l9_952.y<=0.0)
{
l9_1035=0.0;
}
else
{
l9_1035=sqrt(l9_952.y);
}
float l9_1036=l9_1035;
float l9_1037;
if (l9_952.z<=0.0)
{
l9_1037=0.0;
}
else
{
l9_1037=sqrt(l9_952.z);
}
l9_1032=float3(l9_1034,l9_1036,l9_1037);
float3 l9_1038=float3(0.0);
float l9_1039;
if (l9_1032.x<=0.0)
{
l9_1039=0.0;
}
else
{
l9_1039=sqrt(l9_1032.x);
}
float l9_1040=l9_1039;
float l9_1041;
if (l9_1032.y<=0.0)
{
l9_1041=0.0;
}
else
{
l9_1041=sqrt(l9_1032.y);
}
float l9_1042=l9_1041;
float l9_1043;
if (l9_1032.z<=0.0)
{
l9_1043=0.0;
}
else
{
l9_1043=sqrt(l9_1032.z);
}
l9_1038=float3(l9_1040,l9_1042,l9_1043);
float l9_1044=0.0;
float l9_1045=1.0;
float l9_1046=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_1047=10.0;
float l9_1048=0.0;
float l9_1049=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1048=l9_1049;
l9_1045=l9_1048;
float l9_1050;
if ((l9_1045*1.0)!=0.0)
{
l9_1050=l9_1046;
}
else
{
float l9_1051=0.0;
float l9_1052=1.0;
float l9_1053=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_1054=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_1055=0.0;
float l9_1056=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1055=l9_1056;
l9_1052=l9_1055;
float l9_1057;
if ((l9_1052*1.0)!=0.0)
{
l9_1057=l9_1053;
}
else
{
l9_1057=l9_1054;
}
l9_1051=l9_1057;
l9_1047=l9_1051;
l9_1050=l9_1047;
}
l9_1044=l9_1050;
float l9_1058=0.0;
l9_1058=l9_1044;
float3 l9_1059=float3(0.0);
l9_1059=(*sc_set0.UserUniforms).Port_Import_N304;
float3 l9_1060=float3(0.0);
l9_1060=((l9_947*l9_1038)*float3(l9_1058))*l9_1059;
float l9_1061=0.0;
float3 l9_1062=l9_1060;
float l9_1063=l9_1062.z;
l9_1061=l9_1063;
float l9_1064=0.0;
l9_1064=abs(l9_1061);
l9_860=l9_1064;
l9_865=l9_860;
}
else
{
float3 l9_1065=float3(0.0);
float3 l9_1066=(*sc_set0.UserUniforms).Port_Min_N293;
float3 l9_1067=(*sc_set0.UserUniforms).Port_Max_N293;
ssGlobals l9_1068=l9_862;
int l9_1069=3;
bool l9_1070=true;
bool l9_1071=true;
bool l9_1072=true;
float l9_1073=293.0;
ssParticle l9_1074=gParticle;
float l9_1075=0.0;
float l9_1076=l9_1068.gTimeElapsed;
float4 l9_1077=float4(0.0);
float4 l9_1078=float4(0.0);
if (l9_1070)
{
l9_1078.x=floor(fract(l9_1076)*1000.0);
}
if (l9_1072)
{
l9_1078.y=float(l9_1074.Index1D^((l9_1074.Index1D*15299)+l9_1074.Index1D));
}
if (l9_1071)
{
l9_1078.z=l9_1073;
}
l9_1078.w=l9_1075*1000.0;
int l9_1079=int(l9_1078.x);
int l9_1080=int(l9_1078.y);
int l9_1081=int(l9_1078.z);
int l9_1082=int(l9_1078.w);
int l9_1083=(((l9_1079*15299)^(l9_1080*30133))^(l9_1081*17539))^(l9_1082*12113);
int l9_1084=l9_1083;
if (l9_1069==1)
{
int l9_1085=l9_1084;
int l9_1086=l9_1085;
int l9_1087=((l9_1086*((l9_1086*1471343)+101146501))+1559861749)&2147483647;
int l9_1088=l9_1087;
float l9_1089=float(l9_1088)*4.6566129e-10;
float l9_1090=l9_1089;
l9_1077.x=l9_1090;
}
else
{
if (l9_1069==2)
{
int l9_1091=l9_1084;
int l9_1092=l9_1091;
int l9_1093=((l9_1092*((l9_1092*1471343)+101146501))+1559861749)&2147483647;
int l9_1094=l9_1093;
int l9_1095=l9_1091*1399;
int l9_1096=((l9_1095*((l9_1095*1471343)+101146501))+1559861749)&2147483647;
int l9_1097=l9_1096;
int l9_1098=l9_1094;
float l9_1099=float(l9_1098)*4.6566129e-10;
int l9_1100=l9_1097;
float l9_1101=float(l9_1100)*4.6566129e-10;
float2 l9_1102=float2(l9_1099,l9_1101);
l9_1077=float4(l9_1102.x,l9_1102.y,l9_1077.z,l9_1077.w);
}
else
{
if (l9_1069==3)
{
int l9_1103=l9_1084;
int l9_1104=l9_1103;
int l9_1105=((l9_1104*((l9_1104*1471343)+101146501))+1559861749)&2147483647;
int l9_1106=l9_1105;
int l9_1107=l9_1103*1399;
int l9_1108=((l9_1107*((l9_1107*1471343)+101146501))+1559861749)&2147483647;
int l9_1109=l9_1108;
int l9_1110=l9_1103*7177;
int l9_1111=((l9_1110*((l9_1110*1471343)+101146501))+1559861749)&2147483647;
int l9_1112=l9_1111;
int l9_1113=l9_1106;
float l9_1114=float(l9_1113)*4.6566129e-10;
int l9_1115=l9_1109;
float l9_1116=float(l9_1115)*4.6566129e-10;
int l9_1117=l9_1112;
float l9_1118=float(l9_1117)*4.6566129e-10;
float3 l9_1119=float3(l9_1114,l9_1116,l9_1118);
l9_1077=float4(l9_1119.x,l9_1119.y,l9_1119.z,l9_1077.w);
}
else
{
int l9_1120=l9_1084;
int l9_1121=l9_1120;
int l9_1122=((l9_1121*((l9_1121*1471343)+101146501))+1559861749)&2147483647;
int l9_1123=l9_1122;
int l9_1124=l9_1120*1399;
int l9_1125=((l9_1124*((l9_1124*1471343)+101146501))+1559861749)&2147483647;
int l9_1126=l9_1125;
int l9_1127=l9_1120*7177;
int l9_1128=((l9_1127*((l9_1127*1471343)+101146501))+1559861749)&2147483647;
int l9_1129=l9_1128;
int l9_1130=l9_1120*18919;
int l9_1131=((l9_1130*((l9_1130*1471343)+101146501))+1559861749)&2147483647;
int l9_1132=l9_1131;
int l9_1133=l9_1123;
float l9_1134=float(l9_1133)*4.6566129e-10;
int l9_1135=l9_1126;
float l9_1136=float(l9_1135)*4.6566129e-10;
int l9_1137=l9_1129;
float l9_1138=float(l9_1137)*4.6566129e-10;
int l9_1139=l9_1132;
float l9_1140=float(l9_1139)*4.6566129e-10;
float4 l9_1141=float4(l9_1134,l9_1136,l9_1138,l9_1140);
l9_1077=l9_1141;
}
}
}
float4 l9_1142=l9_1077;
float4 l9_1143=l9_1142;
float3 l9_1144=mix(l9_1066,l9_1067,l9_1143.xyz);
l9_1065=l9_1144;
float l9_1145=0.0;
l9_1145=length(l9_1065);
float3 l9_1146=float3(0.0);
l9_1146=l9_1065/(float3(l9_1145)+float3(1.234e-06));
float l9_1147=0.0;
l9_1147=fast::clamp((*sc_set0.UserUniforms).Port_Import_N296,0.0,1.0);
float l9_1148=0.0;
l9_1148=1.0-l9_1147;
float l9_1149=0.0;
float l9_1150;
if (l9_1148<=0.0)
{
l9_1150=0.0;
}
else
{
l9_1150=pow(l9_1148,(*sc_set0.UserUniforms).Port_Input1_N298);
}
l9_1149=l9_1150;
float3 l9_1151=float3(0.0);
float3 l9_1152=float3(l9_1149);
float3 l9_1153=(*sc_set0.UserUniforms).Port_Max_N299;
ssGlobals l9_1154=l9_862;
int l9_1155=3;
bool l9_1156=true;
bool l9_1157=true;
bool l9_1158=true;
float l9_1159=299.0;
ssParticle l9_1160=gParticle;
float l9_1161=0.0;
float l9_1162=l9_1154.gTimeElapsed;
float4 l9_1163=float4(0.0);
float4 l9_1164=float4(0.0);
if (l9_1156)
{
l9_1164.x=floor(fract(l9_1162)*1000.0);
}
if (l9_1158)
{
l9_1164.y=float(l9_1160.Index1D^((l9_1160.Index1D*15299)+l9_1160.Index1D));
}
if (l9_1157)
{
l9_1164.z=l9_1159;
}
l9_1164.w=l9_1161*1000.0;
int l9_1165=int(l9_1164.x);
int l9_1166=int(l9_1164.y);
int l9_1167=int(l9_1164.z);
int l9_1168=int(l9_1164.w);
int l9_1169=(((l9_1165*15299)^(l9_1166*30133))^(l9_1167*17539))^(l9_1168*12113);
int l9_1170=l9_1169;
if (l9_1155==1)
{
int l9_1171=l9_1170;
int l9_1172=l9_1171;
int l9_1173=((l9_1172*((l9_1172*1471343)+101146501))+1559861749)&2147483647;
int l9_1174=l9_1173;
float l9_1175=float(l9_1174)*4.6566129e-10;
float l9_1176=l9_1175;
l9_1163.x=l9_1176;
}
else
{
if (l9_1155==2)
{
int l9_1177=l9_1170;
int l9_1178=l9_1177;
int l9_1179=((l9_1178*((l9_1178*1471343)+101146501))+1559861749)&2147483647;
int l9_1180=l9_1179;
int l9_1181=l9_1177*1399;
int l9_1182=((l9_1181*((l9_1181*1471343)+101146501))+1559861749)&2147483647;
int l9_1183=l9_1182;
int l9_1184=l9_1180;
float l9_1185=float(l9_1184)*4.6566129e-10;
int l9_1186=l9_1183;
float l9_1187=float(l9_1186)*4.6566129e-10;
float2 l9_1188=float2(l9_1185,l9_1187);
l9_1163=float4(l9_1188.x,l9_1188.y,l9_1163.z,l9_1163.w);
}
else
{
if (l9_1155==3)
{
int l9_1189=l9_1170;
int l9_1190=l9_1189;
int l9_1191=((l9_1190*((l9_1190*1471343)+101146501))+1559861749)&2147483647;
int l9_1192=l9_1191;
int l9_1193=l9_1189*1399;
int l9_1194=((l9_1193*((l9_1193*1471343)+101146501))+1559861749)&2147483647;
int l9_1195=l9_1194;
int l9_1196=l9_1189*7177;
int l9_1197=((l9_1196*((l9_1196*1471343)+101146501))+1559861749)&2147483647;
int l9_1198=l9_1197;
int l9_1199=l9_1192;
float l9_1200=float(l9_1199)*4.6566129e-10;
int l9_1201=l9_1195;
float l9_1202=float(l9_1201)*4.6566129e-10;
int l9_1203=l9_1198;
float l9_1204=float(l9_1203)*4.6566129e-10;
float3 l9_1205=float3(l9_1200,l9_1202,l9_1204);
l9_1163=float4(l9_1205.x,l9_1205.y,l9_1205.z,l9_1163.w);
}
else
{
int l9_1206=l9_1170;
int l9_1207=l9_1206;
int l9_1208=((l9_1207*((l9_1207*1471343)+101146501))+1559861749)&2147483647;
int l9_1209=l9_1208;
int l9_1210=l9_1206*1399;
int l9_1211=((l9_1210*((l9_1210*1471343)+101146501))+1559861749)&2147483647;
int l9_1212=l9_1211;
int l9_1213=l9_1206*7177;
int l9_1214=((l9_1213*((l9_1213*1471343)+101146501))+1559861749)&2147483647;
int l9_1215=l9_1214;
int l9_1216=l9_1206*18919;
int l9_1217=((l9_1216*((l9_1216*1471343)+101146501))+1559861749)&2147483647;
int l9_1218=l9_1217;
int l9_1219=l9_1209;
float l9_1220=float(l9_1219)*4.6566129e-10;
int l9_1221=l9_1212;
float l9_1222=float(l9_1221)*4.6566129e-10;
int l9_1223=l9_1215;
float l9_1224=float(l9_1223)*4.6566129e-10;
int l9_1225=l9_1218;
float l9_1226=float(l9_1225)*4.6566129e-10;
float4 l9_1227=float4(l9_1220,l9_1222,l9_1224,l9_1226);
l9_1163=l9_1227;
}
}
}
float4 l9_1228=l9_1163;
float4 l9_1229=l9_1228;
float3 l9_1230=mix(l9_1152,l9_1153,l9_1229.xyz);
l9_1151=l9_1230;
float3 l9_1231=float3(0.0);
float l9_1232;
if (l9_1151.x<=0.0)
{
l9_1232=0.0;
}
else
{
l9_1232=sqrt(l9_1151.x);
}
float l9_1233=l9_1232;
float l9_1234;
if (l9_1151.y<=0.0)
{
l9_1234=0.0;
}
else
{
l9_1234=sqrt(l9_1151.y);
}
float l9_1235=l9_1234;
float l9_1236;
if (l9_1151.z<=0.0)
{
l9_1236=0.0;
}
else
{
l9_1236=sqrt(l9_1151.z);
}
l9_1231=float3(l9_1233,l9_1235,l9_1236);
float3 l9_1237=float3(0.0);
float l9_1238;
if (l9_1231.x<=0.0)
{
l9_1238=0.0;
}
else
{
l9_1238=sqrt(l9_1231.x);
}
float l9_1239=l9_1238;
float l9_1240;
if (l9_1231.y<=0.0)
{
l9_1240=0.0;
}
else
{
l9_1240=sqrt(l9_1231.y);
}
float l9_1241=l9_1240;
float l9_1242;
if (l9_1231.z<=0.0)
{
l9_1242=0.0;
}
else
{
l9_1242=sqrt(l9_1231.z);
}
l9_1237=float3(l9_1239,l9_1241,l9_1242);
float l9_1243=0.0;
float l9_1244=1.0;
float l9_1245=(*sc_set0.UserUniforms).Port_Input1_N021;
float l9_1246=10.0;
float l9_1247=0.0;
float l9_1248=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1247=l9_1248;
l9_1244=l9_1247;
float l9_1249;
if ((l9_1244*1.0)!=0.0)
{
l9_1249=l9_1245;
}
else
{
float l9_1250=0.0;
float l9_1251=1.0;
float l9_1252=(*sc_set0.UserUniforms).Port_Input1_N067;
float l9_1253=(*sc_set0.UserUniforms).Port_Input2_N067;
float l9_1254=0.0;
float l9_1255=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1254=l9_1255;
l9_1251=l9_1254;
float l9_1256;
if ((l9_1251*1.0)!=0.0)
{
l9_1256=l9_1252;
}
else
{
l9_1256=l9_1253;
}
l9_1250=l9_1256;
l9_1246=l9_1250;
l9_1249=l9_1246;
}
l9_1243=l9_1249;
float l9_1257=0.0;
l9_1257=l9_1243;
float3 l9_1258=float3(0.0);
l9_1258=(*sc_set0.UserUniforms).Port_Import_N304;
float3 l9_1259=float3(0.0);
l9_1259=((l9_1146*l9_1237)*float3(l9_1257))*l9_1258;
float l9_1260=0.0;
float3 l9_1261=l9_1259;
float l9_1262=l9_1261.z;
l9_1260=l9_1262;
l9_861=l9_1260;
l9_865=l9_861;
}
l9_858=l9_865;
float3 l9_1263=float3(0.0);
l9_1263.x=l9_48;
l9_1263.y=l9_453;
l9_1263.z=l9_858;
float3 l9_1264=float3(0.0);
l9_1264=l9_47+l9_1263;
gParticle.Position=l9_1264;
float3 l9_1265=float3(0.0);
l9_1265=(*sc_set0.UserUniforms).Port_Import_N075;
float3 l9_1266=float3(0.0);
l9_1266=(*sc_set0.UserUniforms).Port_Import_N076;
float3 l9_1267=float3(0.0);
float3 l9_1268=l9_1265;
float3 l9_1269=l9_1266;
ssGlobals l9_1270=param_1;
int l9_1271=3;
bool l9_1272=true;
bool l9_1273=true;
bool l9_1274=true;
float l9_1275=77.0;
ssParticle l9_1276=gParticle;
float l9_1277=0.0;
float l9_1278=l9_1270.gTimeElapsed;
float4 l9_1279=float4(0.0);
float4 l9_1280=float4(0.0);
if (l9_1272)
{
l9_1280.x=floor(fract(l9_1278)*1000.0);
}
if (l9_1274)
{
l9_1280.y=float(l9_1276.Index1D^((l9_1276.Index1D*15299)+l9_1276.Index1D));
}
if (l9_1273)
{
l9_1280.z=l9_1275;
}
l9_1280.w=l9_1277*1000.0;
int l9_1281=int(l9_1280.x);
int l9_1282=int(l9_1280.y);
int l9_1283=int(l9_1280.z);
int l9_1284=int(l9_1280.w);
int l9_1285=(((l9_1281*15299)^(l9_1282*30133))^(l9_1283*17539))^(l9_1284*12113);
int l9_1286=l9_1285;
if (l9_1271==1)
{
int l9_1287=l9_1286;
int l9_1288=l9_1287;
int l9_1289=((l9_1288*((l9_1288*1471343)+101146501))+1559861749)&2147483647;
int l9_1290=l9_1289;
float l9_1291=float(l9_1290)*4.6566129e-10;
float l9_1292=l9_1291;
l9_1279.x=l9_1292;
}
else
{
if (l9_1271==2)
{
int l9_1293=l9_1286;
int l9_1294=l9_1293;
int l9_1295=((l9_1294*((l9_1294*1471343)+101146501))+1559861749)&2147483647;
int l9_1296=l9_1295;
int l9_1297=l9_1293*1399;
int l9_1298=((l9_1297*((l9_1297*1471343)+101146501))+1559861749)&2147483647;
int l9_1299=l9_1298;
int l9_1300=l9_1296;
float l9_1301=float(l9_1300)*4.6566129e-10;
int l9_1302=l9_1299;
float l9_1303=float(l9_1302)*4.6566129e-10;
float2 l9_1304=float2(l9_1301,l9_1303);
l9_1279=float4(l9_1304.x,l9_1304.y,l9_1279.z,l9_1279.w);
}
else
{
if (l9_1271==3)
{
int l9_1305=l9_1286;
int l9_1306=l9_1305;
int l9_1307=((l9_1306*((l9_1306*1471343)+101146501))+1559861749)&2147483647;
int l9_1308=l9_1307;
int l9_1309=l9_1305*1399;
int l9_1310=((l9_1309*((l9_1309*1471343)+101146501))+1559861749)&2147483647;
int l9_1311=l9_1310;
int l9_1312=l9_1305*7177;
int l9_1313=((l9_1312*((l9_1312*1471343)+101146501))+1559861749)&2147483647;
int l9_1314=l9_1313;
int l9_1315=l9_1308;
float l9_1316=float(l9_1315)*4.6566129e-10;
int l9_1317=l9_1311;
float l9_1318=float(l9_1317)*4.6566129e-10;
int l9_1319=l9_1314;
float l9_1320=float(l9_1319)*4.6566129e-10;
float3 l9_1321=float3(l9_1316,l9_1318,l9_1320);
l9_1279=float4(l9_1321.x,l9_1321.y,l9_1321.z,l9_1279.w);
}
else
{
int l9_1322=l9_1286;
int l9_1323=l9_1322;
int l9_1324=((l9_1323*((l9_1323*1471343)+101146501))+1559861749)&2147483647;
int l9_1325=l9_1324;
int l9_1326=l9_1322*1399;
int l9_1327=((l9_1326*((l9_1326*1471343)+101146501))+1559861749)&2147483647;
int l9_1328=l9_1327;
int l9_1329=l9_1322*7177;
int l9_1330=((l9_1329*((l9_1329*1471343)+101146501))+1559861749)&2147483647;
int l9_1331=l9_1330;
int l9_1332=l9_1322*18919;
int l9_1333=((l9_1332*((l9_1332*1471343)+101146501))+1559861749)&2147483647;
int l9_1334=l9_1333;
int l9_1335=l9_1325;
float l9_1336=float(l9_1335)*4.6566129e-10;
int l9_1337=l9_1328;
float l9_1338=float(l9_1337)*4.6566129e-10;
int l9_1339=l9_1331;
float l9_1340=float(l9_1339)*4.6566129e-10;
int l9_1341=l9_1334;
float l9_1342=float(l9_1341)*4.6566129e-10;
float4 l9_1343=float4(l9_1336,l9_1338,l9_1340,l9_1342);
l9_1279=l9_1343;
}
}
}
float4 l9_1344=l9_1279;
float4 l9_1345=l9_1344;
float3 l9_1346=mix(l9_1268,l9_1269,l9_1345.xyz);
l9_1267=l9_1346;
gParticle.Velocity+=l9_1267;
float3 l9_1347=float3(0.0);
float l9_1348=1.0;
float3 l9_1349=float3(1.0);
float3 l9_1350=(*sc_set0.UserUniforms).Port_Input2_N060;
ssGlobals l9_1351=param_1;
float l9_1352=0.0;
float l9_1353=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1352=l9_1353;
float l9_1354=0.0;
l9_1354=l9_1352;
l9_1348=l9_1354;
float3 l9_1355;
if ((l9_1348*1.0)!=0.0)
{
float l9_1356=0.0;
l9_1356=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_1357=float3(0.0);
float l9_1358=1.0;
float3 l9_1359=float3(0.0);
float3 l9_1360=float3(0.0);
ssGlobals l9_1361=l9_1351;
float l9_1362=0.0;
float l9_1363=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1362=l9_1363;
l9_1358=l9_1362;
float3 l9_1364;
if ((l9_1358*1.0)!=0.0)
{
float l9_1365=0.0;
float l9_1366=(*sc_set0.UserUniforms).Port_TimeBias_N052;
float l9_1367=(*sc_set0.UserUniforms).Port_ValueA_N052;
float l9_1368=(*sc_set0.UserUniforms).Port_TimeA_N052;
float l9_1369=(*sc_set0.UserUniforms).Port_TimeTransition_N052;
float l9_1370=(*sc_set0.UserUniforms).Port_ValueB_N052;
float l9_1371=(*sc_set0.UserUniforms).Port_TimeB_N052;
ssGlobals l9_1372=l9_1361;
float l9_1373=((l9_1368+l9_1369)+l9_1371)+9.9999997e-05;
float l9_1374=l9_1368/l9_1373;
float l9_1375=1.0-(l9_1371/l9_1373);
float l9_1376=(mod((l9_1372.gTimeElapsedShifted/l9_1373)+l9_1366,1.0)*2.0)-1.0;
float l9_1377=abs(l9_1376);
float l9_1378=mix(l9_1367,l9_1370,smoothstep(l9_1374,l9_1375,l9_1377));
l9_1365=l9_1378;
float l9_1379=0.0;
l9_1379=l9_1365*(*sc_set0.UserUniforms).Port_Input1_N053;
float3 l9_1380=float3(0.0);
l9_1380=float3(float2(l9_1379).x,float2(l9_1379).y,0.0);
l9_1359=l9_1380;
l9_1364=l9_1359;
}
else
{
float3 l9_1381=float3(0.0);
float3 l9_1382=(*sc_set0.UserUniforms).influencePosition;
l9_1381=l9_1382;
l9_1360=l9_1381;
l9_1364=l9_1360;
}
l9_1357=l9_1364;
float3 l9_1383=float3(0.0);
l9_1383=l9_1357;
float3 l9_1384=float3(0.0);
l9_1384=gParticle.Position;
float3 l9_1385=float3(0.0);
l9_1385=l9_1383-l9_1384;
float3 l9_1386=float3(0.0);
float3 l9_1387=l9_1385;
float l9_1388=dot(l9_1387,l9_1387);
float l9_1389;
if (l9_1388>0.0)
{
l9_1389=1.0/sqrt(l9_1388);
}
else
{
l9_1389=0.0;
}
float l9_1390=l9_1389;
float3 l9_1391=l9_1387*l9_1390;
l9_1386=l9_1391;
float3 l9_1392=float3(0.0);
l9_1392=float3(l9_1356)*l9_1386;
l9_1349=l9_1392;
l9_1355=l9_1349;
}
else
{
l9_1355=l9_1350;
}
l9_1347=l9_1355;
gParticle.Force+=l9_1347;
float l9_1393=0.0;
l9_1393=(*sc_set0.UserUniforms).Port_Import_N099;
float l9_1394=0.0;
l9_1394=(*sc_set0.UserUniforms).Port_Import_N109;
float l9_1395=0.0;
float l9_1396=l9_1393;
float l9_1397=l9_1394;
ssGlobals l9_1398=param_1;
int l9_1399=1;
bool l9_1400=true;
bool l9_1401=true;
bool l9_1402=true;
float l9_1403=110.0;
ssParticle l9_1404=gParticle;
float l9_1405=0.0;
float l9_1406=l9_1398.gTimeElapsed;
float4 l9_1407=float4(0.0);
float4 l9_1408=float4(0.0);
if (l9_1400)
{
l9_1408.x=floor(fract(l9_1406)*1000.0);
}
if (l9_1402)
{
l9_1408.y=float(l9_1404.Index1D^((l9_1404.Index1D*15299)+l9_1404.Index1D));
}
if (l9_1401)
{
l9_1408.z=l9_1403;
}
l9_1408.w=l9_1405*1000.0;
int l9_1409=int(l9_1408.x);
int l9_1410=int(l9_1408.y);
int l9_1411=int(l9_1408.z);
int l9_1412=int(l9_1408.w);
int l9_1413=(((l9_1409*15299)^(l9_1410*30133))^(l9_1411*17539))^(l9_1412*12113);
int l9_1414=l9_1413;
if (l9_1399==1)
{
int l9_1415=l9_1414;
int l9_1416=l9_1415;
int l9_1417=((l9_1416*((l9_1416*1471343)+101146501))+1559861749)&2147483647;
int l9_1418=l9_1417;
float l9_1419=float(l9_1418)*4.6566129e-10;
float l9_1420=l9_1419;
l9_1407.x=l9_1420;
}
else
{
if (l9_1399==2)
{
int l9_1421=l9_1414;
int l9_1422=l9_1421;
int l9_1423=((l9_1422*((l9_1422*1471343)+101146501))+1559861749)&2147483647;
int l9_1424=l9_1423;
int l9_1425=l9_1421*1399;
int l9_1426=((l9_1425*((l9_1425*1471343)+101146501))+1559861749)&2147483647;
int l9_1427=l9_1426;
int l9_1428=l9_1424;
float l9_1429=float(l9_1428)*4.6566129e-10;
int l9_1430=l9_1427;
float l9_1431=float(l9_1430)*4.6566129e-10;
float2 l9_1432=float2(l9_1429,l9_1431);
l9_1407=float4(l9_1432.x,l9_1432.y,l9_1407.z,l9_1407.w);
}
else
{
if (l9_1399==3)
{
int l9_1433=l9_1414;
int l9_1434=l9_1433;
int l9_1435=((l9_1434*((l9_1434*1471343)+101146501))+1559861749)&2147483647;
int l9_1436=l9_1435;
int l9_1437=l9_1433*1399;
int l9_1438=((l9_1437*((l9_1437*1471343)+101146501))+1559861749)&2147483647;
int l9_1439=l9_1438;
int l9_1440=l9_1433*7177;
int l9_1441=((l9_1440*((l9_1440*1471343)+101146501))+1559861749)&2147483647;
int l9_1442=l9_1441;
int l9_1443=l9_1436;
float l9_1444=float(l9_1443)*4.6566129e-10;
int l9_1445=l9_1439;
float l9_1446=float(l9_1445)*4.6566129e-10;
int l9_1447=l9_1442;
float l9_1448=float(l9_1447)*4.6566129e-10;
float3 l9_1449=float3(l9_1444,l9_1446,l9_1448);
l9_1407=float4(l9_1449.x,l9_1449.y,l9_1449.z,l9_1407.w);
}
else
{
int l9_1450=l9_1414;
int l9_1451=l9_1450;
int l9_1452=((l9_1451*((l9_1451*1471343)+101146501))+1559861749)&2147483647;
int l9_1453=l9_1452;
int l9_1454=l9_1450*1399;
int l9_1455=((l9_1454*((l9_1454*1471343)+101146501))+1559861749)&2147483647;
int l9_1456=l9_1455;
int l9_1457=l9_1450*7177;
int l9_1458=((l9_1457*((l9_1457*1471343)+101146501))+1559861749)&2147483647;
int l9_1459=l9_1458;
int l9_1460=l9_1450*18919;
int l9_1461=((l9_1460*((l9_1460*1471343)+101146501))+1559861749)&2147483647;
int l9_1462=l9_1461;
int l9_1463=l9_1453;
float l9_1464=float(l9_1463)*4.6566129e-10;
int l9_1465=l9_1456;
float l9_1466=float(l9_1465)*4.6566129e-10;
int l9_1467=l9_1459;
float l9_1468=float(l9_1467)*4.6566129e-10;
int l9_1469=l9_1462;
float l9_1470=float(l9_1469)*4.6566129e-10;
float4 l9_1471=float4(l9_1464,l9_1466,l9_1468,l9_1470);
l9_1407=l9_1471;
}
}
}
float4 l9_1472=l9_1407;
float4 l9_1473=l9_1472;
float l9_1474=mix(l9_1396,l9_1397,l9_1473.x);
l9_1395=l9_1474;
float l9_1475=l9_1395;
gParticle.Mass=l9_1475;
gParticle.Mass=fast::max(9.9999997e-06,gParticle.Mass);
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
gParticle.Spawned=true;
}
}
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
float4 l9_1476=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1477=dot(l9_1476,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1478=l9_1477;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1478;
}
}
float4 l9_1479=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_1479;
return out;
}
float Output_N149=0.0;
float param_3=float((*sc_set0.UserUniforms).isAttracting!=0);
Output_N149=param_3;
float3 Value_N81=float3(0.0);
Value_N81=(*sc_set0.UserUniforms).Port_Import_N081;
float3 Output_N84=float3(0.0);
float3 param_4=Value_N81;
float l9_1481=dot(param_4,param_4);
float l9_1482;
if (l9_1481>0.0)
{
l9_1482=1.0/sqrt(l9_1481);
}
else
{
l9_1482=0.0;
}
float l9_1483=l9_1482;
float3 param_5=param_4*l9_1483;
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
float l9_1484;
if (param_15>param_14)
{
l9_1484=fast::clamp(param_11,param_14,param_15);
}
else
{
l9_1484=fast::clamp(param_11,param_15,param_14);
}
param_11=l9_1484;
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
float l9_1485=0.0;
float l9_1486=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1485=l9_1486;
param_16=l9_1485;
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
float l9_1487=0.0;
float l9_1488=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1487=l9_1488;
param_22=l9_1487;
float param_25;
if ((param_22*1.0)!=0.0)
{
param_25=param_23;
}
else
{
float l9_1489=0.0;
float l9_1490=1.0;
float l9_1491=(*sc_set0.UserUniforms).Port_Input1_N066;
float l9_1492=(*sc_set0.UserUniforms).Port_Input2_N066;
float l9_1493=0.0;
float l9_1494=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1493=l9_1494;
l9_1490=l9_1493;
float l9_1495;
if ((l9_1490*1.0)!=0.0)
{
l9_1495=l9_1491;
}
else
{
l9_1495=l9_1492;
}
l9_1489=l9_1495;
param_24=l9_1489;
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
float l9_1496=0.0;
float l9_1497=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1496=l9_1497;
param_26=l9_1496;
float3 param_29;
if ((param_26*1.0)!=0.0)
{
float l9_1498=0.0;
float l9_1499=(*sc_set0.UserUniforms).Port_TimeBias_N052;
float l9_1500=(*sc_set0.UserUniforms).Port_ValueA_N052;
float l9_1501=(*sc_set0.UserUniforms).Port_TimeA_N052;
float l9_1502=(*sc_set0.UserUniforms).Port_TimeTransition_N052;
float l9_1503=(*sc_set0.UserUniforms).Port_ValueB_N052;
float l9_1504=(*sc_set0.UserUniforms).Port_TimeB_N052;
ssGlobals l9_1505=param_30;
float l9_1506=((l9_1501+l9_1502)+l9_1504)+9.9999997e-05;
float l9_1507=l9_1501/l9_1506;
float l9_1508=1.0-(l9_1504/l9_1506);
float l9_1509=(mod((l9_1505.gTimeElapsedShifted/l9_1506)+l9_1499,1.0)*2.0)-1.0;
float l9_1510=abs(l9_1509);
float l9_1511=mix(l9_1500,l9_1503,smoothstep(l9_1507,l9_1508,l9_1510));
l9_1498=l9_1511;
float l9_1512=0.0;
l9_1512=l9_1498*(*sc_set0.UserUniforms).Port_Input1_N053;
float3 l9_1513=float3(0.0);
l9_1513=float3(float2(l9_1512).x,float2(l9_1512).y,0.0);
param_27=l9_1513;
param_29=param_27;
}
else
{
float3 l9_1514=float3(0.0);
float3 l9_1515=(*sc_set0.UserUniforms).influencePosition;
l9_1514=l9_1515;
param_28=l9_1514;
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
float l9_1516=dot(param_31,param_31);
float l9_1517;
if (l9_1516>0.0)
{
l9_1517=1.0/sqrt(l9_1516);
}
else
{
l9_1517=0.0;
}
float l9_1518=l9_1517;
float3 param_32=param_31*l9_1518;
Output_N312=param_32;
float3 Output_N313=float3(0.0);
Output_N313=float3(Value_N308)*Output_N312;
gParticle.Force+=Output_N313;
float Output_N237=0.0;
float param_33=1.0;
float param_34=(*sc_set0.UserUniforms).Port_Input1_N237;
float param_35=5.0;
float l9_1519=0.0;
float l9_1520=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1519=l9_1520;
param_33=l9_1519;
float param_36;
if ((param_33*1.0)!=0.0)
{
param_36=param_34;
}
else
{
float l9_1521=0.0;
float l9_1522=1.0;
float l9_1523=(*sc_set0.UserUniforms).Port_Input1_N201;
float l9_1524=(*sc_set0.UserUniforms).Port_Input2_N201;
float l9_1525=0.0;
float l9_1526=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1525=l9_1526;
l9_1522=l9_1525;
float l9_1527;
if ((l9_1522*1.0)!=0.0)
{
l9_1527=l9_1523;
}
else
{
l9_1527=l9_1524;
}
l9_1521=l9_1527;
param_35=l9_1521;
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
float3 l9_1528=param_37;
float l9_1529=param_38;
float4 l9_1530=float4(0.0);
l9_1530=sc_set0.noiseTex.sample(sc_set0.noiseTexSmpSC,l9_1528,level(l9_1529));
float4 l9_1531=l9_1530;
float4 l9_1532=l9_1531;
Color_N228=l9_1532;
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
float Output_N255=0.0;
float param_39=1.0;
float param_40=1.0;
float param_41=0.0;
float l9_1533=0.0;
l9_1533=0.0;
param_39=l9_1533;
float param_42;
if ((param_39*1.0)!=0.0)
{
float l9_1534=0.0;
float l9_1535=1.0;
float l9_1536=(*sc_set0.UserUniforms).Port_Input1_N241;
float l9_1537=3.0;
float l9_1538=0.0;
float l9_1539=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1538=l9_1539;
l9_1535=l9_1538;
float l9_1540;
if ((l9_1535*1.0)!=0.0)
{
l9_1540=l9_1536;
}
else
{
float l9_1541=0.0;
float l9_1542=1.0;
float l9_1543=(*sc_set0.UserUniforms).Port_Input1_N200;
float l9_1544=(*sc_set0.UserUniforms).Port_Input2_N200;
float l9_1545=0.0;
float l9_1546=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1545=l9_1546;
l9_1542=l9_1545;
float l9_1547;
if ((l9_1542*1.0)!=0.0)
{
l9_1547=l9_1543;
}
else
{
l9_1547=l9_1544;
}
l9_1541=l9_1547;
l9_1537=l9_1541;
l9_1540=l9_1537;
}
l9_1534=l9_1540;
float l9_1548=0.0;
l9_1548=l9_1534;
float l9_1549=0.0;
float l9_1550=1.0;
float l9_1551=(*sc_set0.UserUniforms).Port_Input1_N063;
float l9_1552=(*sc_set0.UserUniforms).Port_Input2_N063;
float l9_1553=0.0;
float l9_1554=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1553=l9_1554;
l9_1550=l9_1553;
float l9_1555;
if ((l9_1550*1.0)!=0.0)
{
l9_1555=l9_1551;
}
else
{
l9_1555=l9_1552;
}
l9_1549=l9_1555;
float l9_1556=0.0;
l9_1556=l9_1549;
float l9_1557=0.0;
l9_1557=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_1558=0.0;
l9_1558=mix(l9_1548,l9_1556,l9_1557);
float3 l9_1559=float3(0.0);
l9_1559=(*sc_set0.UserUniforms).vfxLocalAabbMax;
float3 l9_1560=float3(0.0);
l9_1560=(*sc_set0.UserUniforms).vfxLocalAabbMin;
float3 l9_1561=float3(0.0);
l9_1561=l9_1559-l9_1560;
float l9_1562=0.0;
l9_1562=length(l9_1561);
float l9_1563=0.0;
l9_1563=l9_1558/(l9_1562+1.234e-06);
param_40=l9_1563;
param_42=param_40;
}
else
{
float l9_1564=0.0;
float l9_1565=1.0;
float l9_1566=(*sc_set0.UserUniforms).Port_Input1_N241;
float l9_1567=3.0;
float l9_1568=0.0;
float l9_1569=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1568=l9_1569;
l9_1565=l9_1568;
float l9_1570;
if ((l9_1565*1.0)!=0.0)
{
l9_1570=l9_1566;
}
else
{
float l9_1571=0.0;
float l9_1572=1.0;
float l9_1573=(*sc_set0.UserUniforms).Port_Input1_N200;
float l9_1574=(*sc_set0.UserUniforms).Port_Input2_N200;
float l9_1575=0.0;
float l9_1576=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1575=l9_1576;
l9_1572=l9_1575;
float l9_1577;
if ((l9_1572*1.0)!=0.0)
{
l9_1577=l9_1573;
}
else
{
l9_1577=l9_1574;
}
l9_1571=l9_1577;
l9_1567=l9_1571;
l9_1570=l9_1567;
}
l9_1564=l9_1570;
float l9_1578=0.0;
l9_1578=l9_1564;
float l9_1579=0.0;
float l9_1580=1.0;
float l9_1581=(*sc_set0.UserUniforms).Port_Input1_N063;
float l9_1582=(*sc_set0.UserUniforms).Port_Input2_N063;
float l9_1583=0.0;
float l9_1584=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1583=l9_1584;
l9_1580=l9_1583;
float l9_1585;
if ((l9_1580*1.0)!=0.0)
{
l9_1585=l9_1581;
}
else
{
l9_1585=l9_1582;
}
l9_1579=l9_1585;
float l9_1586=0.0;
l9_1586=l9_1579;
float l9_1587=0.0;
l9_1587=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_1588=0.0;
l9_1588=mix(l9_1578,l9_1586,l9_1587);
param_41=l9_1588;
param_42=param_41;
}
Output_N255=param_42;
gParticle.Size=Output_N255;
float4 Output_N8=float4(0.0);
float param_43=1.0;
float param_44=(*sc_set0.UserUniforms).Port_Input1_N008;
float4 param_45=float4(0.5,0.0,0.0,0.0);
ssGlobals param_47=Globals;
float l9_1589=0.0;
float l9_1590=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1589=l9_1590;
param_43=l9_1589;
float4 param_46;
if ((param_43*1.0)!=0.0)
{
param_46=float4(param_44);
}
else
{
float4 l9_1591=float4(0.0);
float l9_1592=1.0;
float4 l9_1593=(*sc_set0.UserUniforms).Port_Input1_N065;
float4 l9_1594=float4(1.0);
ssGlobals l9_1595=param_47;
float l9_1596=0.0;
float l9_1597=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1596=l9_1597;
l9_1592=l9_1596;
float4 l9_1598;
if ((l9_1592*1.0)!=0.0)
{
l9_1598=l9_1593;
}
else
{
float l9_1599=0.0;
float l9_1600=(*sc_set0.UserUniforms).Port_Min_N019;
float l9_1601=(*sc_set0.UserUniforms).Port_Max_N019;
ssGlobals l9_1602=l9_1595;
int l9_1603=1;
bool l9_1604=false;
bool l9_1605=true;
bool l9_1606=true;
float l9_1607=19.0;
ssParticle l9_1608=gParticle;
float l9_1609=0.0;
float l9_1610=l9_1602.gTimeElapsed;
float4 l9_1611=float4(0.0);
float4 l9_1612=float4(0.0);
if (l9_1604)
{
l9_1612.x=floor(fract(l9_1610)*1000.0);
}
if (l9_1606)
{
l9_1612.y=float(l9_1608.Index1D^((l9_1608.Index1D*15299)+l9_1608.Index1D));
}
if (l9_1605)
{
l9_1612.z=l9_1607;
}
l9_1612.w=l9_1609*1000.0;
int l9_1613=int(l9_1612.x);
int l9_1614=int(l9_1612.y);
int l9_1615=int(l9_1612.z);
int l9_1616=int(l9_1612.w);
int l9_1617=(((l9_1613*15299)^(l9_1614*30133))^(l9_1615*17539))^(l9_1616*12113);
int l9_1618=l9_1617;
if (l9_1603==1)
{
int l9_1619=l9_1618;
int l9_1620=l9_1619;
int l9_1621=((l9_1620*((l9_1620*1471343)+101146501))+1559861749)&2147483647;
int l9_1622=l9_1621;
float l9_1623=float(l9_1622)*4.6566129e-10;
float l9_1624=l9_1623;
l9_1611.x=l9_1624;
}
else
{
if (l9_1603==2)
{
int l9_1625=l9_1618;
int l9_1626=l9_1625;
int l9_1627=((l9_1626*((l9_1626*1471343)+101146501))+1559861749)&2147483647;
int l9_1628=l9_1627;
int l9_1629=l9_1625*1399;
int l9_1630=((l9_1629*((l9_1629*1471343)+101146501))+1559861749)&2147483647;
int l9_1631=l9_1630;
int l9_1632=l9_1628;
float l9_1633=float(l9_1632)*4.6566129e-10;
int l9_1634=l9_1631;
float l9_1635=float(l9_1634)*4.6566129e-10;
float2 l9_1636=float2(l9_1633,l9_1635);
l9_1611=float4(l9_1636.x,l9_1636.y,l9_1611.z,l9_1611.w);
}
else
{
if (l9_1603==3)
{
int l9_1637=l9_1618;
int l9_1638=l9_1637;
int l9_1639=((l9_1638*((l9_1638*1471343)+101146501))+1559861749)&2147483647;
int l9_1640=l9_1639;
int l9_1641=l9_1637*1399;
int l9_1642=((l9_1641*((l9_1641*1471343)+101146501))+1559861749)&2147483647;
int l9_1643=l9_1642;
int l9_1644=l9_1637*7177;
int l9_1645=((l9_1644*((l9_1644*1471343)+101146501))+1559861749)&2147483647;
int l9_1646=l9_1645;
int l9_1647=l9_1640;
float l9_1648=float(l9_1647)*4.6566129e-10;
int l9_1649=l9_1643;
float l9_1650=float(l9_1649)*4.6566129e-10;
int l9_1651=l9_1646;
float l9_1652=float(l9_1651)*4.6566129e-10;
float3 l9_1653=float3(l9_1648,l9_1650,l9_1652);
l9_1611=float4(l9_1653.x,l9_1653.y,l9_1653.z,l9_1611.w);
}
else
{
int l9_1654=l9_1618;
int l9_1655=l9_1654;
int l9_1656=((l9_1655*((l9_1655*1471343)+101146501))+1559861749)&2147483647;
int l9_1657=l9_1656;
int l9_1658=l9_1654*1399;
int l9_1659=((l9_1658*((l9_1658*1471343)+101146501))+1559861749)&2147483647;
int l9_1660=l9_1659;
int l9_1661=l9_1654*7177;
int l9_1662=((l9_1661*((l9_1661*1471343)+101146501))+1559861749)&2147483647;
int l9_1663=l9_1662;
int l9_1664=l9_1654*18919;
int l9_1665=((l9_1664*((l9_1664*1471343)+101146501))+1559861749)&2147483647;
int l9_1666=l9_1665;
int l9_1667=l9_1657;
float l9_1668=float(l9_1667)*4.6566129e-10;
int l9_1669=l9_1660;
float l9_1670=float(l9_1669)*4.6566129e-10;
int l9_1671=l9_1663;
float l9_1672=float(l9_1671)*4.6566129e-10;
int l9_1673=l9_1666;
float l9_1674=float(l9_1673)*4.6566129e-10;
float4 l9_1675=float4(l9_1668,l9_1670,l9_1672,l9_1674);
l9_1611=l9_1675;
}
}
}
float4 l9_1676=l9_1611;
float4 l9_1677=l9_1676;
float l9_1678=mix(l9_1600,l9_1601,l9_1677.x);
l9_1599=l9_1678;
float l9_1679=0.0;
l9_1679=l9_1599*(*sc_set0.UserUniforms).Port_Input1_N166;
float3 l9_1680=float3(0.0);
float3 l9_1681=(*sc_set0.UserUniforms).influencePosition;
l9_1680=l9_1681;
float3 l9_1682=float3(0.0);
l9_1682=gParticle.Position;
float l9_1683=0.0;
l9_1683=distance(l9_1680,l9_1682);
float l9_1684=0.0;
l9_1684=l9_1683*(*sc_set0.UserUniforms).Port_Input1_N164;
float l9_1685=0.0;
l9_1685=l9_1684*l9_1599;
float l9_1686=0.0;
l9_1686=l9_1679+l9_1685;
float l9_1687=0.0;
l9_1687=fast::clamp(l9_1686+0.001,(*sc_set0.UserUniforms).Port_Input1_N165+0.001,(*sc_set0.UserUniforms).Port_Input2_N165+0.001)-0.001;
float4 l9_1688=float4(0.0);
float4 l9_1689=(*sc_set0.UserUniforms).colorA;
l9_1688=l9_1689;
float4 l9_1690=float4(0.0);
float4 l9_1691=(*sc_set0.UserUniforms).colorB;
l9_1690=l9_1691;
float4 l9_1692=float4(0.0);
float4 l9_1693=(*sc_set0.UserUniforms).colorC;
l9_1692=l9_1693;
float4 l9_1694=float4(0.0);
float4 l9_1695=(*sc_set0.UserUniforms).colorD;
l9_1694=l9_1695;
float4 l9_1696=float4(0.0);
float4 l9_1697=(*sc_set0.UserUniforms).colorE;
l9_1696=l9_1697;
float4 l9_1698=float4(0.0);
float l9_1699=l9_1687;
float4 l9_1700=l9_1688;
float l9_1701=(*sc_set0.UserUniforms).Port_Position1_N172;
float4 l9_1702=l9_1690;
float l9_1703=(*sc_set0.UserUniforms).Port_Position2_N172;
float4 l9_1704=l9_1692;
float l9_1705=(*sc_set0.UserUniforms).Port_Position3_N172;
float4 l9_1706=l9_1694;
float4 l9_1707=l9_1696;
l9_1699=fast::clamp(l9_1699,0.0,1.0);
float4 l9_1708;
if (l9_1699<l9_1701)
{
l9_1708=mix(l9_1700,l9_1702,float4(fast::clamp(l9_1699/l9_1701,0.0,1.0)));
}
else
{
if (l9_1699<l9_1703)
{
l9_1708=mix(l9_1702,l9_1704,float4(fast::clamp((l9_1699-l9_1701)/(l9_1703-l9_1701),0.0,1.0)));
}
else
{
if (l9_1699<l9_1705)
{
l9_1708=mix(l9_1704,l9_1706,float4(fast::clamp((l9_1699-l9_1703)/(l9_1705-l9_1703),0.0,1.0)));
}
else
{
l9_1708=mix(l9_1706,l9_1707,float4(fast::clamp((l9_1699-l9_1705)/(1.0-l9_1705),0.0,1.0)));
}
}
}
l9_1698=l9_1708;
l9_1594=l9_1698;
l9_1598=l9_1594;
}
l9_1591=l9_1598;
param_45=l9_1591;
param_46=param_45;
}
Output_N8=param_46;
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
float param_48=1.0;
float param_49=(*sc_set0.UserUniforms).Port_Input1_N266;
float param_50=(*sc_set0.UserUniforms).Port_Input2_N266;
float l9_1709=0.0;
float l9_1710=float((*sc_set0.UserUniforms).isAttracting!=0);
l9_1709=l9_1710;
param_48=l9_1709;
float param_51;
if ((param_48*1.0)!=0.0)
{
param_51=param_49;
}
else
{
param_51=param_50;
}
Output_N266=param_51;
float Value_N185=0.0;
Value_N185=Output_N266;
float Value_N186=0.0;
Value_N186=gParticle.Life;
float Output_N187=0.0;
Output_N187=Value_N185/(Value_N186+1.234e-06);
float Value_N138=0.0;
Value_N138=Output_N187;
float Output_N143=0.0;
Output_N143=(*sc_set0.UserUniforms).Port_Input0_N143/(Value_N138+1.234e-06);
float Output_N144=0.0;
Output_N144=Value_N191*Output_N143;
float Output_N182=0.0;
Output_N182=fast::clamp(Output_N144+0.001,(*sc_set0.UserUniforms).Port_Input1_N182+0.001,(*sc_set0.UserUniforms).Port_Input2_N182+0.001)-0.001;
float Output_N184=0.0;
Output_N184=1.0-Value_N191;
float Value_N188=0.0;
Value_N188=(*sc_set0.UserUniforms).Port_Import_N188;
float Output_N189=0.0;
Output_N189=Value_N188/(Value_N186+1.234e-06);
float Value_N192=0.0;
Value_N192=Output_N189;
float Output_N193=0.0;
Output_N193=(*sc_set0.UserUniforms).Port_Input0_N193/(Value_N192+1.234e-06);
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
float3x3 param_52=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_52);
float Drift=0.0049999999;
if (gParticle.Dead)
{
float4 param_53=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_53.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1711=param_53;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1712=dot(l9_1711,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1713=l9_1712;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1713;
}
}
float4 l9_1714=float4(param_53.x,-param_53.y,(param_53.z*0.5)+(param_53.w*0.5),param_53.w);
out.gl_Position=l9_1714;
return out;
}
float l9_1715;
if (abs(gParticle.Force.x)<Drift)
{
l9_1715=0.0;
}
else
{
l9_1715=gParticle.Force.x;
}
gParticle.Force.x=l9_1715;
float l9_1716;
if (abs(gParticle.Force.y)<Drift)
{
l9_1716=0.0;
}
else
{
l9_1716=gParticle.Force.y;
}
gParticle.Force.y=l9_1716;
float l9_1717;
if (abs(gParticle.Force.z)<Drift)
{
l9_1717=0.0;
}
else
{
l9_1717=gParticle.Force.z;
}
gParticle.Force.z=l9_1717;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_1718;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_1718=0.0;
}
else
{
l9_1718=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_1718;
float l9_1719;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_1719=0.0;
}
else
{
l9_1719=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_1719;
float l9_1720;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_1720=0.0;
}
else
{
l9_1720=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_1720;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(4.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_1721=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_1721;
int particleRow=512;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_1722;
if (v.texture0.x<0.5)
{
l9_1722=0.0;
}
else
{
l9_1722=QuadSize.x;
}
Vertex.x=l9_1722;
float l9_1723;
if (v.texture0.y<0.5)
{
l9_1723=0.0;
}
else
{
l9_1723=QuadSize.y;
}
Vertex.y=l9_1723;
Vertex+=Offset;
float4 param_54=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_54.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1724=param_54;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1725=dot(l9_1724,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1726=l9_1725;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1726;
}
}
float4 l9_1727=float4(param_54.x,-param_54.y,(param_54.z*0.5)+(param_54.w*0.5),param_54.w);
out.gl_Position=l9_1727;
int l9_1728=gl_InstanceIndex;
out.Interp_Particle_Index=l9_1728;
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
float4 param_55=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_55.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1729=param_55;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1730=dot(l9_1729,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1731=l9_1730;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1731;
}
}
float4 l9_1732=float4(param_55.x,-param_55.y,(param_55.z*0.5)+(param_55.w*0.5),param_55.w);
out.gl_Position=l9_1732;
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
float3 Port_Import_N290;
float Port_Input1_N292;
float3 Port_Min_N293;
float3 Port_Max_N293;
float Port_Import_N296;
float Port_Input1_N298;
float3 Port_Max_N299;
float Port_Input1_N021;
float Port_Input1_N067;
float Port_Input2_N067;
float Port_Import_N302;
float3 Port_Import_N304;
float Port_Input1_N319;
float Port_Input1_N322;
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
float Port_Import_N213;
float Port_Input1_N063;
float Port_Input2_N063;
float Port_Import_N252;
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
