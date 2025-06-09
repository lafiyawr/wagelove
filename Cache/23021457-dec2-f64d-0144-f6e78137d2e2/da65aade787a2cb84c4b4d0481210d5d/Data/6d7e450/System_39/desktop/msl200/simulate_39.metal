#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
//efine SC_DISABLE_FRUSTUM_CULLING 1
#ifdef isIdle
#undef isIdle
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
//sampler sampler renderTarget0SmpSC 0:20
//sampler sampler renderTarget1SmpSC 0:21
//sampler sampler renderTarget2SmpSC 0:22
//sampler sampler renderTarget3SmpSC 0:23
//texture texture2D renderTarget0 0:1:0:20
//texture texture2D renderTarget1 0:2:0:21
//texture texture2D renderTarget2 0:3:0:22
//texture texture2D renderTarget3 0:4:0:23
//ubo int UserUniforms 0:31:7792 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_StereoClipPlanes 3664:[2]:16
//int overrideTimeEnabled 3980
//float overrideTimeElapsed 3984:[32]:4
//float overrideTimeDelta 4112
//bool vfxBatchEnable 4120:[32]:4
//float4x4 vfxModelMatrix 4384:[32]:64
//float3 vfxLocalAabbMin 6624
//float3 vfxLocalAabbMax 6640
//int vfxOffsetInstancesRead 7108
//int vfxOffsetInstancesWrite 7112
//float2 vfxTargetSizeRead 7120
//float2 vfxTargetSizeWrite 7128
//int vfxTargetWidth 7136
//bool isIdle 7140
//float3 velocity 7152
//float3 inputPos 7168
//float4 colorA 7184
//float4 colorB 7200
//float4 colorC 7216
//float4 colorD 7232
//float4 colorE 7248
//float3 Port_Import_N216 7264
//float Port_Input1_N047 7280
//float3 Port_Min_N048 7296
//float3 Port_Max_N048 7312
//float Port_Import_N052 7328
//float Port_Input1_N054 7332
//float3 Port_Max_N055 7344
//float Port_Import_N058 7360
//float3 Port_Import_N059 7376
//float Port_Input1_N079 7392
//float Port_Input1_N149 7396
//float4 Port_Value_N011 7408
//float Port_Import_N143 7424
//float Port_Import_N144 7428
//float Port_Import_N027 7432
//float Port_Import_N038 7436
//float Port_Input1_N050 7440
//float Port_Input1_N007 7444
//float Port_RangeMinA_N051 7448
//float Port_RangeMaxA_N051 7452
//float Port_RangeMinB_N051 7456
//float Port_RangeMaxB_N051 7460
//float Port_Input1_N002 7464
//float Port_RangeMinA_N044 7468
//float Port_RangeMaxA_N044 7472
//float Port_RangeMinB_N044 7476
//float Port_RangeMaxB_N044 7480
//float Port_RangeMinA_N151 7504
//float Port_RangeMaxA_N151 7508
//float Port_RangeMinB_N151 7512
//float Port_RangeMaxB_N151 7516
//float3 Port_Import_N075 7536
//float3 Port_Import_N318 7552
//float Port_Multiplier_N319 7568
//float Port_RangeMinA_N152 7572
//float Port_RangeMaxA_N152 7576
//float Port_RangeMinB_N152 7580
//float Port_RangeMaxB_N152 7584
//float2 Port_Input1_N326 7616
//float2 Port_Scale_N327 7624
//float2 Port_Input1_N329 7632
//float2 Port_Scale_N330 7640
//float2 Port_Input1_N332 7648
//float2 Port_Scale_N333 7656
//float3 Port_Input1_N335 7664
//float Port_Import_N267 7680
//float Port_Import_N268 7684
//float Port_Import_N269 7688
//float Port_Input4_N270 7692
//float Port_Multiplier_N272 7696
//float Port_Import_N177 7700
//float Port_Import_N178 7704
//float Port_Input0_N181 7712
//float Port_Import_N185 7716
//float Port_Input1_N227 7724
//float Port_Input2_N227 7728
//float Port_Input0_N192 7732
//float Port_Import_N188 7736
//float Port_Input1_N236 7744
//float Port_Input2_N236 7748
//float Port_RangeMinA_N140 7752
//float Port_RangeMaxA_N140 7756
//float Port_RangeMinB_N140 7760
//float Port_RangeMaxB_N140 7764
//float Port_Input1_N148 7768
//float Port_Input2_N148 7772
//float Port_Position1_N137 7776
//float Port_Position2_N137 7780
//float Port_Position3_N137 7784
//}
//spec_const bool renderTarget0HasSwappedViews 0 0
//spec_const bool renderTarget1HasSwappedViews 1 0
//spec_const bool renderTarget2HasSwappedViews 2 0
//spec_const bool renderTarget3HasSwappedViews 3 0
//spec_const int SC_DEVICE_CLASS 4 -1
//spec_const int renderTarget0Layout 5 0
//spec_const int renderTarget1Layout 6 0
//spec_const int renderTarget2Layout 7 0
//spec_const int renderTarget3Layout 8 0
//spec_const int sc_ShaderCacheConstant 9 0
//spec_const int sc_StereoRenderingMode 10 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 11 0
//SG_REFLECTION_END
constant bool renderTarget0HasSwappedViews [[function_constant(0)]];
constant bool renderTarget0HasSwappedViews_tmp = is_function_constant_defined(renderTarget0HasSwappedViews) ? renderTarget0HasSwappedViews : false;
constant bool renderTarget1HasSwappedViews [[function_constant(1)]];
constant bool renderTarget1HasSwappedViews_tmp = is_function_constant_defined(renderTarget1HasSwappedViews) ? renderTarget1HasSwappedViews : false;
constant bool renderTarget2HasSwappedViews [[function_constant(2)]];
constant bool renderTarget2HasSwappedViews_tmp = is_function_constant_defined(renderTarget2HasSwappedViews) ? renderTarget2HasSwappedViews : false;
constant bool renderTarget3HasSwappedViews [[function_constant(3)]];
constant bool renderTarget3HasSwappedViews_tmp = is_function_constant_defined(renderTarget3HasSwappedViews) ? renderTarget3HasSwappedViews : false;
constant int SC_DEVICE_CLASS [[function_constant(4)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int renderTarget0Layout [[function_constant(5)]];
constant int renderTarget0Layout_tmp = is_function_constant_defined(renderTarget0Layout) ? renderTarget0Layout : 0;
constant int renderTarget1Layout [[function_constant(6)]];
constant int renderTarget1Layout_tmp = is_function_constant_defined(renderTarget1Layout) ? renderTarget1Layout : 0;
constant int renderTarget2Layout [[function_constant(7)]];
constant int renderTarget2Layout_tmp = is_function_constant_defined(renderTarget2Layout) ? renderTarget2Layout : 0;
constant int renderTarget3Layout [[function_constant(8)]];
constant int renderTarget3Layout_tmp = is_function_constant_defined(renderTarget3Layout) ? renderTarget3Layout : 0;
constant int sc_ShaderCacheConstant [[function_constant(9)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_StereoRenderingMode [[function_constant(10)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(11)]];
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
float3 velocity;
float3 inputPos;
float4 colorA;
float4 colorB;
float4 colorC;
float4 colorD;
float4 colorE;
float3 Port_Import_N216;
float Port_Input1_N047;
float3 Port_Min_N048;
float3 Port_Max_N048;
float Port_Import_N052;
float Port_Input1_N054;
float3 Port_Max_N055;
float Port_Import_N058;
float3 Port_Import_N059;
float Port_Input1_N079;
float Port_Input1_N149;
float4 Port_Value_N011;
float Port_Import_N143;
float Port_Import_N144;
float Port_Import_N027;
float Port_Import_N038;
float Port_Input1_N050;
float Port_Input1_N007;
float Port_RangeMinA_N051;
float Port_RangeMaxA_N051;
float Port_RangeMinB_N051;
float Port_RangeMaxB_N051;
float Port_Input1_N002;
float Port_RangeMinA_N044;
float Port_RangeMaxA_N044;
float Port_RangeMinB_N044;
float Port_RangeMaxB_N044;
float Port_Import_N308;
float3 Port_Import_N309;
float Port_RangeMinA_N151;
float Port_RangeMaxA_N151;
float Port_RangeMinB_N151;
float Port_RangeMaxB_N151;
float3 Port_Import_N071;
float3 Port_Import_N075;
float3 Port_Import_N318;
float Port_Multiplier_N319;
float Port_RangeMinA_N152;
float Port_RangeMaxA_N152;
float Port_RangeMinB_N152;
float Port_RangeMaxB_N152;
float3 Port_Import_N322;
float2 Port_Input1_N326;
float2 Port_Scale_N327;
float2 Port_Input1_N329;
float2 Port_Scale_N330;
float2 Port_Input1_N332;
float2 Port_Scale_N333;
float3 Port_Input1_N335;
float Port_Import_N267;
float Port_Import_N268;
float Port_Import_N269;
float Port_Input4_N270;
float Port_Multiplier_N272;
float Port_Import_N177;
float Port_Import_N178;
float Port_Import_N191;
float Port_Input0_N181;
float Port_Import_N185;
float Port_Import_N180;
float Port_Input1_N227;
float Port_Input2_N227;
float Port_Input0_N192;
float Port_Import_N188;
float Port_Import_N184;
float Port_Input1_N236;
float Port_Input2_N236;
float Port_RangeMinA_N140;
float Port_RangeMaxA_N140;
float Port_RangeMinB_N140;
float Port_RangeMaxB_N140;
float Port_Input1_N148;
float Port_Input2_N148;
float Port_Position1_N137;
float Port_Position2_N137;
float Port_Position3_N137;
};
struct sc_Set0
{
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
sampler renderTarget0SmpSC [[id(20)]];
sampler renderTarget1SmpSC [[id(21)]];
sampler renderTarget2SmpSC [[id(22)]];
sampler renderTarget3SmpSC [[id(23)]];
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
gParticle.CopyId=float(InstanceID/52500);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
int l9_0=param/52500;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%52500;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(52500*((param/52500)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%512,l9_1/512);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/52500.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(512.0,103.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/52499.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/52499.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(511.0,102.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*15.0;
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
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+30.0)/15.0)*4.32723);
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
l9_61=!(UserUniforms.vfxBatchEnable[l9_62/52500]!=0);
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
float param_32=15.0;
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
float param_35=15.0;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_4/52500];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float Delay=0.0;
float Warmup=0.0;
gParticle.Age=mod((Globals.gTimeElapsedShifted-gParticle.SpawnOffset)+Warmup,15.0);
float l9_5=Globals.gTimeElapsed;
float l9_6=gParticle.SpawnOffset;
float l9_7=Delay;
float l9_8=Warmup;
bool l9_9=(l9_5-l9_6)<(l9_7-l9_8);
bool l9_10;
if (!l9_9)
{
l9_10=gParticle.Age>15.0;
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
l9_14=mod(((fast::max(Globals.gTimeElapsed,0.1)-gParticle.SpawnOffset)-Delay)+Warmup,15.0)<=Globals.gTimeDelta;
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
l9_15.Seed+=(floor(((((l9_18-l9_15.SpawnOffset)-0.0)+0.0)+30.0)/15.0)*4.32723);
l9_15.Seed=fract(abs(l9_15.Seed));
int2 l9_19=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_19)+float2(1.0))/float2(399.0);
gParticle=l9_15;
float l9_20=229.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_20)))/l9_20)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_20))/l9_20)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=15.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
float l9_21=0.0;
float l9_22=float((*sc_set0.UserUniforms).isIdle!=0);
l9_21=l9_22;
float l9_23=l9_21;
if ((l9_23*1.0)!=0.0)
{
gParticle.Dead=true;
}
float3 l9_24=float3(0.0);
l9_24=(*sc_set0.UserUniforms).Port_Import_N216;
float l9_25=0.0;
float l9_26=0.0;
float l9_27=0.0;
float l9_28=0.0;
ssGlobals l9_29=param_1;
float l9_30=0.0;
l9_30=0.0;
float l9_31=0.0;
l9_31=float(l9_30==(*sc_set0.UserUniforms).Port_Input1_N047);
l9_26=l9_31;
float l9_32;
if ((l9_26*1.0)!=0.0)
{
float3 l9_33=float3(0.0);
float3 l9_34=(*sc_set0.UserUniforms).Port_Min_N048;
float3 l9_35=(*sc_set0.UserUniforms).Port_Max_N048;
ssGlobals l9_36=l9_29;
int l9_37=3;
bool l9_38=true;
bool l9_39=true;
bool l9_40=true;
float l9_41=48.0;
ssParticle l9_42=gParticle;
float l9_43=0.0;
float l9_44=l9_36.gTimeElapsed;
float4 l9_45=float4(0.0);
float4 l9_46=float4(0.0);
if (l9_38)
{
l9_46.x=floor(fract(l9_44)*1000.0);
}
if (l9_40)
{
l9_46.y=float(l9_42.Index1D^((l9_42.Index1D*15299)+l9_42.Index1D));
}
if (l9_39)
{
l9_46.z=l9_41;
}
l9_46.w=l9_43*1000.0;
int l9_47=int(l9_46.x);
int l9_48=int(l9_46.y);
int l9_49=int(l9_46.z);
int l9_50=int(l9_46.w);
int l9_51=(((l9_47*15299)^(l9_48*30133))^(l9_49*17539))^(l9_50*12113);
int l9_52=l9_51;
if (l9_37==1)
{
int l9_53=l9_52;
int l9_54=l9_53;
int l9_55=((l9_54*((l9_54*1471343)+101146501))+1559861749)&2147483647;
int l9_56=l9_55;
float l9_57=float(l9_56)*4.6566129e-10;
float l9_58=l9_57;
l9_45.x=l9_58;
}
else
{
if (l9_37==2)
{
int l9_59=l9_52;
int l9_60=l9_59;
int l9_61=((l9_60*((l9_60*1471343)+101146501))+1559861749)&2147483647;
int l9_62=l9_61;
int l9_63=l9_59*1399;
int l9_64=((l9_63*((l9_63*1471343)+101146501))+1559861749)&2147483647;
int l9_65=l9_64;
int l9_66=l9_62;
float l9_67=float(l9_66)*4.6566129e-10;
int l9_68=l9_65;
float l9_69=float(l9_68)*4.6566129e-10;
float2 l9_70=float2(l9_67,l9_69);
l9_45=float4(l9_70.x,l9_70.y,l9_45.z,l9_45.w);
}
else
{
if (l9_37==3)
{
int l9_71=l9_52;
int l9_72=l9_71;
int l9_73=((l9_72*((l9_72*1471343)+101146501))+1559861749)&2147483647;
int l9_74=l9_73;
int l9_75=l9_71*1399;
int l9_76=((l9_75*((l9_75*1471343)+101146501))+1559861749)&2147483647;
int l9_77=l9_76;
int l9_78=l9_71*7177;
int l9_79=((l9_78*((l9_78*1471343)+101146501))+1559861749)&2147483647;
int l9_80=l9_79;
int l9_81=l9_74;
float l9_82=float(l9_81)*4.6566129e-10;
int l9_83=l9_77;
float l9_84=float(l9_83)*4.6566129e-10;
int l9_85=l9_80;
float l9_86=float(l9_85)*4.6566129e-10;
float3 l9_87=float3(l9_82,l9_84,l9_86);
l9_45=float4(l9_87.x,l9_87.y,l9_87.z,l9_45.w);
}
else
{
int l9_88=l9_52;
int l9_89=l9_88;
int l9_90=((l9_89*((l9_89*1471343)+101146501))+1559861749)&2147483647;
int l9_91=l9_90;
int l9_92=l9_88*1399;
int l9_93=((l9_92*((l9_92*1471343)+101146501))+1559861749)&2147483647;
int l9_94=l9_93;
int l9_95=l9_88*7177;
int l9_96=((l9_95*((l9_95*1471343)+101146501))+1559861749)&2147483647;
int l9_97=l9_96;
int l9_98=l9_88*18919;
int l9_99=((l9_98*((l9_98*1471343)+101146501))+1559861749)&2147483647;
int l9_100=l9_99;
int l9_101=l9_91;
float l9_102=float(l9_101)*4.6566129e-10;
int l9_103=l9_94;
float l9_104=float(l9_103)*4.6566129e-10;
int l9_105=l9_97;
float l9_106=float(l9_105)*4.6566129e-10;
int l9_107=l9_100;
float l9_108=float(l9_107)*4.6566129e-10;
float4 l9_109=float4(l9_102,l9_104,l9_106,l9_108);
l9_45=l9_109;
}
}
}
float4 l9_110=l9_45;
float4 l9_111=l9_110;
float3 l9_112=mix(l9_34,l9_35,l9_111.xyz);
l9_33=l9_112;
float l9_113=0.0;
l9_113=length(l9_33);
float3 l9_114=float3(0.0);
l9_114=l9_33/(float3(l9_113)+float3(1.234e-06));
float l9_115=0.0;
l9_115=fast::clamp((*sc_set0.UserUniforms).Port_Import_N052,0.0,1.0);
float l9_116=0.0;
l9_116=1.0-l9_115;
float l9_117=0.0;
float l9_118;
if (l9_116<=0.0)
{
l9_118=0.0;
}
else
{
l9_118=pow(l9_116,(*sc_set0.UserUniforms).Port_Input1_N054);
}
l9_117=l9_118;
float3 l9_119=float3(0.0);
float3 l9_120=float3(l9_117);
float3 l9_121=(*sc_set0.UserUniforms).Port_Max_N055;
ssGlobals l9_122=l9_29;
int l9_123=3;
bool l9_124=true;
bool l9_125=true;
bool l9_126=true;
float l9_127=55.0;
ssParticle l9_128=gParticle;
float l9_129=0.0;
float l9_130=l9_122.gTimeElapsed;
float4 l9_131=float4(0.0);
float4 l9_132=float4(0.0);
if (l9_124)
{
l9_132.x=floor(fract(l9_130)*1000.0);
}
if (l9_126)
{
l9_132.y=float(l9_128.Index1D^((l9_128.Index1D*15299)+l9_128.Index1D));
}
if (l9_125)
{
l9_132.z=l9_127;
}
l9_132.w=l9_129*1000.0;
int l9_133=int(l9_132.x);
int l9_134=int(l9_132.y);
int l9_135=int(l9_132.z);
int l9_136=int(l9_132.w);
int l9_137=(((l9_133*15299)^(l9_134*30133))^(l9_135*17539))^(l9_136*12113);
int l9_138=l9_137;
if (l9_123==1)
{
int l9_139=l9_138;
int l9_140=l9_139;
int l9_141=((l9_140*((l9_140*1471343)+101146501))+1559861749)&2147483647;
int l9_142=l9_141;
float l9_143=float(l9_142)*4.6566129e-10;
float l9_144=l9_143;
l9_131.x=l9_144;
}
else
{
if (l9_123==2)
{
int l9_145=l9_138;
int l9_146=l9_145;
int l9_147=((l9_146*((l9_146*1471343)+101146501))+1559861749)&2147483647;
int l9_148=l9_147;
int l9_149=l9_145*1399;
int l9_150=((l9_149*((l9_149*1471343)+101146501))+1559861749)&2147483647;
int l9_151=l9_150;
int l9_152=l9_148;
float l9_153=float(l9_152)*4.6566129e-10;
int l9_154=l9_151;
float l9_155=float(l9_154)*4.6566129e-10;
float2 l9_156=float2(l9_153,l9_155);
l9_131=float4(l9_156.x,l9_156.y,l9_131.z,l9_131.w);
}
else
{
if (l9_123==3)
{
int l9_157=l9_138;
int l9_158=l9_157;
int l9_159=((l9_158*((l9_158*1471343)+101146501))+1559861749)&2147483647;
int l9_160=l9_159;
int l9_161=l9_157*1399;
int l9_162=((l9_161*((l9_161*1471343)+101146501))+1559861749)&2147483647;
int l9_163=l9_162;
int l9_164=l9_157*7177;
int l9_165=((l9_164*((l9_164*1471343)+101146501))+1559861749)&2147483647;
int l9_166=l9_165;
int l9_167=l9_160;
float l9_168=float(l9_167)*4.6566129e-10;
int l9_169=l9_163;
float l9_170=float(l9_169)*4.6566129e-10;
int l9_171=l9_166;
float l9_172=float(l9_171)*4.6566129e-10;
float3 l9_173=float3(l9_168,l9_170,l9_172);
l9_131=float4(l9_173.x,l9_173.y,l9_173.z,l9_131.w);
}
else
{
int l9_174=l9_138;
int l9_175=l9_174;
int l9_176=((l9_175*((l9_175*1471343)+101146501))+1559861749)&2147483647;
int l9_177=l9_176;
int l9_178=l9_174*1399;
int l9_179=((l9_178*((l9_178*1471343)+101146501))+1559861749)&2147483647;
int l9_180=l9_179;
int l9_181=l9_174*7177;
int l9_182=((l9_181*((l9_181*1471343)+101146501))+1559861749)&2147483647;
int l9_183=l9_182;
int l9_184=l9_174*18919;
int l9_185=((l9_184*((l9_184*1471343)+101146501))+1559861749)&2147483647;
int l9_186=l9_185;
int l9_187=l9_177;
float l9_188=float(l9_187)*4.6566129e-10;
int l9_189=l9_180;
float l9_190=float(l9_189)*4.6566129e-10;
int l9_191=l9_183;
float l9_192=float(l9_191)*4.6566129e-10;
int l9_193=l9_186;
float l9_194=float(l9_193)*4.6566129e-10;
float4 l9_195=float4(l9_188,l9_190,l9_192,l9_194);
l9_131=l9_195;
}
}
}
float4 l9_196=l9_131;
float4 l9_197=l9_196;
float3 l9_198=mix(l9_120,l9_121,l9_197.xyz);
l9_119=l9_198;
float3 l9_199=float3(0.0);
float l9_200;
if (l9_119.x<=0.0)
{
l9_200=0.0;
}
else
{
l9_200=sqrt(l9_119.x);
}
float l9_201=l9_200;
float l9_202;
if (l9_119.y<=0.0)
{
l9_202=0.0;
}
else
{
l9_202=sqrt(l9_119.y);
}
float l9_203=l9_202;
float l9_204;
if (l9_119.z<=0.0)
{
l9_204=0.0;
}
else
{
l9_204=sqrt(l9_119.z);
}
l9_199=float3(l9_201,l9_203,l9_204);
float3 l9_205=float3(0.0);
float l9_206;
if (l9_199.x<=0.0)
{
l9_206=0.0;
}
else
{
l9_206=sqrt(l9_199.x);
}
float l9_207=l9_206;
float l9_208;
if (l9_199.y<=0.0)
{
l9_208=0.0;
}
else
{
l9_208=sqrt(l9_199.y);
}
float l9_209=l9_208;
float l9_210;
if (l9_199.z<=0.0)
{
l9_210=0.0;
}
else
{
l9_210=sqrt(l9_199.z);
}
l9_205=float3(l9_207,l9_209,l9_210);
float l9_211=0.0;
l9_211=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_212=float3(0.0);
l9_212=(*sc_set0.UserUniforms).Port_Import_N059;
float3 l9_213=float3(0.0);
l9_213=((l9_114*l9_205)*float3(l9_211))*l9_212;
float l9_214=0.0;
float3 l9_215=l9_213;
float l9_216=l9_215.x;
l9_214=l9_216;
float l9_217=0.0;
l9_217=abs(l9_214);
l9_27=l9_217;
l9_32=l9_27;
}
else
{
float3 l9_218=float3(0.0);
float3 l9_219=(*sc_set0.UserUniforms).Port_Min_N048;
float3 l9_220=(*sc_set0.UserUniforms).Port_Max_N048;
ssGlobals l9_221=l9_29;
int l9_222=3;
bool l9_223=true;
bool l9_224=true;
bool l9_225=true;
float l9_226=48.0;
ssParticle l9_227=gParticle;
float l9_228=0.0;
float l9_229=l9_221.gTimeElapsed;
float4 l9_230=float4(0.0);
float4 l9_231=float4(0.0);
if (l9_223)
{
l9_231.x=floor(fract(l9_229)*1000.0);
}
if (l9_225)
{
l9_231.y=float(l9_227.Index1D^((l9_227.Index1D*15299)+l9_227.Index1D));
}
if (l9_224)
{
l9_231.z=l9_226;
}
l9_231.w=l9_228*1000.0;
int l9_232=int(l9_231.x);
int l9_233=int(l9_231.y);
int l9_234=int(l9_231.z);
int l9_235=int(l9_231.w);
int l9_236=(((l9_232*15299)^(l9_233*30133))^(l9_234*17539))^(l9_235*12113);
int l9_237=l9_236;
if (l9_222==1)
{
int l9_238=l9_237;
int l9_239=l9_238;
int l9_240=((l9_239*((l9_239*1471343)+101146501))+1559861749)&2147483647;
int l9_241=l9_240;
float l9_242=float(l9_241)*4.6566129e-10;
float l9_243=l9_242;
l9_230.x=l9_243;
}
else
{
if (l9_222==2)
{
int l9_244=l9_237;
int l9_245=l9_244;
int l9_246=((l9_245*((l9_245*1471343)+101146501))+1559861749)&2147483647;
int l9_247=l9_246;
int l9_248=l9_244*1399;
int l9_249=((l9_248*((l9_248*1471343)+101146501))+1559861749)&2147483647;
int l9_250=l9_249;
int l9_251=l9_247;
float l9_252=float(l9_251)*4.6566129e-10;
int l9_253=l9_250;
float l9_254=float(l9_253)*4.6566129e-10;
float2 l9_255=float2(l9_252,l9_254);
l9_230=float4(l9_255.x,l9_255.y,l9_230.z,l9_230.w);
}
else
{
if (l9_222==3)
{
int l9_256=l9_237;
int l9_257=l9_256;
int l9_258=((l9_257*((l9_257*1471343)+101146501))+1559861749)&2147483647;
int l9_259=l9_258;
int l9_260=l9_256*1399;
int l9_261=((l9_260*((l9_260*1471343)+101146501))+1559861749)&2147483647;
int l9_262=l9_261;
int l9_263=l9_256*7177;
int l9_264=((l9_263*((l9_263*1471343)+101146501))+1559861749)&2147483647;
int l9_265=l9_264;
int l9_266=l9_259;
float l9_267=float(l9_266)*4.6566129e-10;
int l9_268=l9_262;
float l9_269=float(l9_268)*4.6566129e-10;
int l9_270=l9_265;
float l9_271=float(l9_270)*4.6566129e-10;
float3 l9_272=float3(l9_267,l9_269,l9_271);
l9_230=float4(l9_272.x,l9_272.y,l9_272.z,l9_230.w);
}
else
{
int l9_273=l9_237;
int l9_274=l9_273;
int l9_275=((l9_274*((l9_274*1471343)+101146501))+1559861749)&2147483647;
int l9_276=l9_275;
int l9_277=l9_273*1399;
int l9_278=((l9_277*((l9_277*1471343)+101146501))+1559861749)&2147483647;
int l9_279=l9_278;
int l9_280=l9_273*7177;
int l9_281=((l9_280*((l9_280*1471343)+101146501))+1559861749)&2147483647;
int l9_282=l9_281;
int l9_283=l9_273*18919;
int l9_284=((l9_283*((l9_283*1471343)+101146501))+1559861749)&2147483647;
int l9_285=l9_284;
int l9_286=l9_276;
float l9_287=float(l9_286)*4.6566129e-10;
int l9_288=l9_279;
float l9_289=float(l9_288)*4.6566129e-10;
int l9_290=l9_282;
float l9_291=float(l9_290)*4.6566129e-10;
int l9_292=l9_285;
float l9_293=float(l9_292)*4.6566129e-10;
float4 l9_294=float4(l9_287,l9_289,l9_291,l9_293);
l9_230=l9_294;
}
}
}
float4 l9_295=l9_230;
float4 l9_296=l9_295;
float3 l9_297=mix(l9_219,l9_220,l9_296.xyz);
l9_218=l9_297;
float l9_298=0.0;
l9_298=length(l9_218);
float3 l9_299=float3(0.0);
l9_299=l9_218/(float3(l9_298)+float3(1.234e-06));
float l9_300=0.0;
l9_300=fast::clamp((*sc_set0.UserUniforms).Port_Import_N052,0.0,1.0);
float l9_301=0.0;
l9_301=1.0-l9_300;
float l9_302=0.0;
float l9_303;
if (l9_301<=0.0)
{
l9_303=0.0;
}
else
{
l9_303=pow(l9_301,(*sc_set0.UserUniforms).Port_Input1_N054);
}
l9_302=l9_303;
float3 l9_304=float3(0.0);
float3 l9_305=float3(l9_302);
float3 l9_306=(*sc_set0.UserUniforms).Port_Max_N055;
ssGlobals l9_307=l9_29;
int l9_308=3;
bool l9_309=true;
bool l9_310=true;
bool l9_311=true;
float l9_312=55.0;
ssParticle l9_313=gParticle;
float l9_314=0.0;
float l9_315=l9_307.gTimeElapsed;
float4 l9_316=float4(0.0);
float4 l9_317=float4(0.0);
if (l9_309)
{
l9_317.x=floor(fract(l9_315)*1000.0);
}
if (l9_311)
{
l9_317.y=float(l9_313.Index1D^((l9_313.Index1D*15299)+l9_313.Index1D));
}
if (l9_310)
{
l9_317.z=l9_312;
}
l9_317.w=l9_314*1000.0;
int l9_318=int(l9_317.x);
int l9_319=int(l9_317.y);
int l9_320=int(l9_317.z);
int l9_321=int(l9_317.w);
int l9_322=(((l9_318*15299)^(l9_319*30133))^(l9_320*17539))^(l9_321*12113);
int l9_323=l9_322;
if (l9_308==1)
{
int l9_324=l9_323;
int l9_325=l9_324;
int l9_326=((l9_325*((l9_325*1471343)+101146501))+1559861749)&2147483647;
int l9_327=l9_326;
float l9_328=float(l9_327)*4.6566129e-10;
float l9_329=l9_328;
l9_316.x=l9_329;
}
else
{
if (l9_308==2)
{
int l9_330=l9_323;
int l9_331=l9_330;
int l9_332=((l9_331*((l9_331*1471343)+101146501))+1559861749)&2147483647;
int l9_333=l9_332;
int l9_334=l9_330*1399;
int l9_335=((l9_334*((l9_334*1471343)+101146501))+1559861749)&2147483647;
int l9_336=l9_335;
int l9_337=l9_333;
float l9_338=float(l9_337)*4.6566129e-10;
int l9_339=l9_336;
float l9_340=float(l9_339)*4.6566129e-10;
float2 l9_341=float2(l9_338,l9_340);
l9_316=float4(l9_341.x,l9_341.y,l9_316.z,l9_316.w);
}
else
{
if (l9_308==3)
{
int l9_342=l9_323;
int l9_343=l9_342;
int l9_344=((l9_343*((l9_343*1471343)+101146501))+1559861749)&2147483647;
int l9_345=l9_344;
int l9_346=l9_342*1399;
int l9_347=((l9_346*((l9_346*1471343)+101146501))+1559861749)&2147483647;
int l9_348=l9_347;
int l9_349=l9_342*7177;
int l9_350=((l9_349*((l9_349*1471343)+101146501))+1559861749)&2147483647;
int l9_351=l9_350;
int l9_352=l9_345;
float l9_353=float(l9_352)*4.6566129e-10;
int l9_354=l9_348;
float l9_355=float(l9_354)*4.6566129e-10;
int l9_356=l9_351;
float l9_357=float(l9_356)*4.6566129e-10;
float3 l9_358=float3(l9_353,l9_355,l9_357);
l9_316=float4(l9_358.x,l9_358.y,l9_358.z,l9_316.w);
}
else
{
int l9_359=l9_323;
int l9_360=l9_359;
int l9_361=((l9_360*((l9_360*1471343)+101146501))+1559861749)&2147483647;
int l9_362=l9_361;
int l9_363=l9_359*1399;
int l9_364=((l9_363*((l9_363*1471343)+101146501))+1559861749)&2147483647;
int l9_365=l9_364;
int l9_366=l9_359*7177;
int l9_367=((l9_366*((l9_366*1471343)+101146501))+1559861749)&2147483647;
int l9_368=l9_367;
int l9_369=l9_359*18919;
int l9_370=((l9_369*((l9_369*1471343)+101146501))+1559861749)&2147483647;
int l9_371=l9_370;
int l9_372=l9_362;
float l9_373=float(l9_372)*4.6566129e-10;
int l9_374=l9_365;
float l9_375=float(l9_374)*4.6566129e-10;
int l9_376=l9_368;
float l9_377=float(l9_376)*4.6566129e-10;
int l9_378=l9_371;
float l9_379=float(l9_378)*4.6566129e-10;
float4 l9_380=float4(l9_373,l9_375,l9_377,l9_379);
l9_316=l9_380;
}
}
}
float4 l9_381=l9_316;
float4 l9_382=l9_381;
float3 l9_383=mix(l9_305,l9_306,l9_382.xyz);
l9_304=l9_383;
float3 l9_384=float3(0.0);
float l9_385;
if (l9_304.x<=0.0)
{
l9_385=0.0;
}
else
{
l9_385=sqrt(l9_304.x);
}
float l9_386=l9_385;
float l9_387;
if (l9_304.y<=0.0)
{
l9_387=0.0;
}
else
{
l9_387=sqrt(l9_304.y);
}
float l9_388=l9_387;
float l9_389;
if (l9_304.z<=0.0)
{
l9_389=0.0;
}
else
{
l9_389=sqrt(l9_304.z);
}
l9_384=float3(l9_386,l9_388,l9_389);
float3 l9_390=float3(0.0);
float l9_391;
if (l9_384.x<=0.0)
{
l9_391=0.0;
}
else
{
l9_391=sqrt(l9_384.x);
}
float l9_392=l9_391;
float l9_393;
if (l9_384.y<=0.0)
{
l9_393=0.0;
}
else
{
l9_393=sqrt(l9_384.y);
}
float l9_394=l9_393;
float l9_395;
if (l9_384.z<=0.0)
{
l9_395=0.0;
}
else
{
l9_395=sqrt(l9_384.z);
}
l9_390=float3(l9_392,l9_394,l9_395);
float l9_396=0.0;
l9_396=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_397=float3(0.0);
l9_397=(*sc_set0.UserUniforms).Port_Import_N059;
float3 l9_398=float3(0.0);
l9_398=((l9_299*l9_390)*float3(l9_396))*l9_397;
float l9_399=0.0;
float3 l9_400=l9_398;
float l9_401=l9_400.x;
l9_399=l9_401;
l9_28=l9_399;
l9_32=l9_28;
}
l9_25=l9_32;
float l9_402=0.0;
float l9_403=0.0;
float l9_404=0.0;
float l9_405=0.0;
ssGlobals l9_406=param_1;
float l9_407=0.0;
l9_407=0.0;
float l9_408=0.0;
l9_408=float(l9_407==(*sc_set0.UserUniforms).Port_Input1_N079);
l9_403=l9_408;
float l9_409;
if ((l9_403*1.0)!=0.0)
{
float3 l9_410=float3(0.0);
float3 l9_411=(*sc_set0.UserUniforms).Port_Min_N048;
float3 l9_412=(*sc_set0.UserUniforms).Port_Max_N048;
ssGlobals l9_413=l9_406;
int l9_414=3;
bool l9_415=true;
bool l9_416=true;
bool l9_417=true;
float l9_418=48.0;
ssParticle l9_419=gParticle;
float l9_420=0.0;
float l9_421=l9_413.gTimeElapsed;
float4 l9_422=float4(0.0);
float4 l9_423=float4(0.0);
if (l9_415)
{
l9_423.x=floor(fract(l9_421)*1000.0);
}
if (l9_417)
{
l9_423.y=float(l9_419.Index1D^((l9_419.Index1D*15299)+l9_419.Index1D));
}
if (l9_416)
{
l9_423.z=l9_418;
}
l9_423.w=l9_420*1000.0;
int l9_424=int(l9_423.x);
int l9_425=int(l9_423.y);
int l9_426=int(l9_423.z);
int l9_427=int(l9_423.w);
int l9_428=(((l9_424*15299)^(l9_425*30133))^(l9_426*17539))^(l9_427*12113);
int l9_429=l9_428;
if (l9_414==1)
{
int l9_430=l9_429;
int l9_431=l9_430;
int l9_432=((l9_431*((l9_431*1471343)+101146501))+1559861749)&2147483647;
int l9_433=l9_432;
float l9_434=float(l9_433)*4.6566129e-10;
float l9_435=l9_434;
l9_422.x=l9_435;
}
else
{
if (l9_414==2)
{
int l9_436=l9_429;
int l9_437=l9_436;
int l9_438=((l9_437*((l9_437*1471343)+101146501))+1559861749)&2147483647;
int l9_439=l9_438;
int l9_440=l9_436*1399;
int l9_441=((l9_440*((l9_440*1471343)+101146501))+1559861749)&2147483647;
int l9_442=l9_441;
int l9_443=l9_439;
float l9_444=float(l9_443)*4.6566129e-10;
int l9_445=l9_442;
float l9_446=float(l9_445)*4.6566129e-10;
float2 l9_447=float2(l9_444,l9_446);
l9_422=float4(l9_447.x,l9_447.y,l9_422.z,l9_422.w);
}
else
{
if (l9_414==3)
{
int l9_448=l9_429;
int l9_449=l9_448;
int l9_450=((l9_449*((l9_449*1471343)+101146501))+1559861749)&2147483647;
int l9_451=l9_450;
int l9_452=l9_448*1399;
int l9_453=((l9_452*((l9_452*1471343)+101146501))+1559861749)&2147483647;
int l9_454=l9_453;
int l9_455=l9_448*7177;
int l9_456=((l9_455*((l9_455*1471343)+101146501))+1559861749)&2147483647;
int l9_457=l9_456;
int l9_458=l9_451;
float l9_459=float(l9_458)*4.6566129e-10;
int l9_460=l9_454;
float l9_461=float(l9_460)*4.6566129e-10;
int l9_462=l9_457;
float l9_463=float(l9_462)*4.6566129e-10;
float3 l9_464=float3(l9_459,l9_461,l9_463);
l9_422=float4(l9_464.x,l9_464.y,l9_464.z,l9_422.w);
}
else
{
int l9_465=l9_429;
int l9_466=l9_465;
int l9_467=((l9_466*((l9_466*1471343)+101146501))+1559861749)&2147483647;
int l9_468=l9_467;
int l9_469=l9_465*1399;
int l9_470=((l9_469*((l9_469*1471343)+101146501))+1559861749)&2147483647;
int l9_471=l9_470;
int l9_472=l9_465*7177;
int l9_473=((l9_472*((l9_472*1471343)+101146501))+1559861749)&2147483647;
int l9_474=l9_473;
int l9_475=l9_465*18919;
int l9_476=((l9_475*((l9_475*1471343)+101146501))+1559861749)&2147483647;
int l9_477=l9_476;
int l9_478=l9_468;
float l9_479=float(l9_478)*4.6566129e-10;
int l9_480=l9_471;
float l9_481=float(l9_480)*4.6566129e-10;
int l9_482=l9_474;
float l9_483=float(l9_482)*4.6566129e-10;
int l9_484=l9_477;
float l9_485=float(l9_484)*4.6566129e-10;
float4 l9_486=float4(l9_479,l9_481,l9_483,l9_485);
l9_422=l9_486;
}
}
}
float4 l9_487=l9_422;
float4 l9_488=l9_487;
float3 l9_489=mix(l9_411,l9_412,l9_488.xyz);
l9_410=l9_489;
float l9_490=0.0;
l9_490=length(l9_410);
float3 l9_491=float3(0.0);
l9_491=l9_410/(float3(l9_490)+float3(1.234e-06));
float l9_492=0.0;
l9_492=fast::clamp((*sc_set0.UserUniforms).Port_Import_N052,0.0,1.0);
float l9_493=0.0;
l9_493=1.0-l9_492;
float l9_494=0.0;
float l9_495;
if (l9_493<=0.0)
{
l9_495=0.0;
}
else
{
l9_495=pow(l9_493,(*sc_set0.UserUniforms).Port_Input1_N054);
}
l9_494=l9_495;
float3 l9_496=float3(0.0);
float3 l9_497=float3(l9_494);
float3 l9_498=(*sc_set0.UserUniforms).Port_Max_N055;
ssGlobals l9_499=l9_406;
int l9_500=3;
bool l9_501=true;
bool l9_502=true;
bool l9_503=true;
float l9_504=55.0;
ssParticle l9_505=gParticle;
float l9_506=0.0;
float l9_507=l9_499.gTimeElapsed;
float4 l9_508=float4(0.0);
float4 l9_509=float4(0.0);
if (l9_501)
{
l9_509.x=floor(fract(l9_507)*1000.0);
}
if (l9_503)
{
l9_509.y=float(l9_505.Index1D^((l9_505.Index1D*15299)+l9_505.Index1D));
}
if (l9_502)
{
l9_509.z=l9_504;
}
l9_509.w=l9_506*1000.0;
int l9_510=int(l9_509.x);
int l9_511=int(l9_509.y);
int l9_512=int(l9_509.z);
int l9_513=int(l9_509.w);
int l9_514=(((l9_510*15299)^(l9_511*30133))^(l9_512*17539))^(l9_513*12113);
int l9_515=l9_514;
if (l9_500==1)
{
int l9_516=l9_515;
int l9_517=l9_516;
int l9_518=((l9_517*((l9_517*1471343)+101146501))+1559861749)&2147483647;
int l9_519=l9_518;
float l9_520=float(l9_519)*4.6566129e-10;
float l9_521=l9_520;
l9_508.x=l9_521;
}
else
{
if (l9_500==2)
{
int l9_522=l9_515;
int l9_523=l9_522;
int l9_524=((l9_523*((l9_523*1471343)+101146501))+1559861749)&2147483647;
int l9_525=l9_524;
int l9_526=l9_522*1399;
int l9_527=((l9_526*((l9_526*1471343)+101146501))+1559861749)&2147483647;
int l9_528=l9_527;
int l9_529=l9_525;
float l9_530=float(l9_529)*4.6566129e-10;
int l9_531=l9_528;
float l9_532=float(l9_531)*4.6566129e-10;
float2 l9_533=float2(l9_530,l9_532);
l9_508=float4(l9_533.x,l9_533.y,l9_508.z,l9_508.w);
}
else
{
if (l9_500==3)
{
int l9_534=l9_515;
int l9_535=l9_534;
int l9_536=((l9_535*((l9_535*1471343)+101146501))+1559861749)&2147483647;
int l9_537=l9_536;
int l9_538=l9_534*1399;
int l9_539=((l9_538*((l9_538*1471343)+101146501))+1559861749)&2147483647;
int l9_540=l9_539;
int l9_541=l9_534*7177;
int l9_542=((l9_541*((l9_541*1471343)+101146501))+1559861749)&2147483647;
int l9_543=l9_542;
int l9_544=l9_537;
float l9_545=float(l9_544)*4.6566129e-10;
int l9_546=l9_540;
float l9_547=float(l9_546)*4.6566129e-10;
int l9_548=l9_543;
float l9_549=float(l9_548)*4.6566129e-10;
float3 l9_550=float3(l9_545,l9_547,l9_549);
l9_508=float4(l9_550.x,l9_550.y,l9_550.z,l9_508.w);
}
else
{
int l9_551=l9_515;
int l9_552=l9_551;
int l9_553=((l9_552*((l9_552*1471343)+101146501))+1559861749)&2147483647;
int l9_554=l9_553;
int l9_555=l9_551*1399;
int l9_556=((l9_555*((l9_555*1471343)+101146501))+1559861749)&2147483647;
int l9_557=l9_556;
int l9_558=l9_551*7177;
int l9_559=((l9_558*((l9_558*1471343)+101146501))+1559861749)&2147483647;
int l9_560=l9_559;
int l9_561=l9_551*18919;
int l9_562=((l9_561*((l9_561*1471343)+101146501))+1559861749)&2147483647;
int l9_563=l9_562;
int l9_564=l9_554;
float l9_565=float(l9_564)*4.6566129e-10;
int l9_566=l9_557;
float l9_567=float(l9_566)*4.6566129e-10;
int l9_568=l9_560;
float l9_569=float(l9_568)*4.6566129e-10;
int l9_570=l9_563;
float l9_571=float(l9_570)*4.6566129e-10;
float4 l9_572=float4(l9_565,l9_567,l9_569,l9_571);
l9_508=l9_572;
}
}
}
float4 l9_573=l9_508;
float4 l9_574=l9_573;
float3 l9_575=mix(l9_497,l9_498,l9_574.xyz);
l9_496=l9_575;
float3 l9_576=float3(0.0);
float l9_577;
if (l9_496.x<=0.0)
{
l9_577=0.0;
}
else
{
l9_577=sqrt(l9_496.x);
}
float l9_578=l9_577;
float l9_579;
if (l9_496.y<=0.0)
{
l9_579=0.0;
}
else
{
l9_579=sqrt(l9_496.y);
}
float l9_580=l9_579;
float l9_581;
if (l9_496.z<=0.0)
{
l9_581=0.0;
}
else
{
l9_581=sqrt(l9_496.z);
}
l9_576=float3(l9_578,l9_580,l9_581);
float3 l9_582=float3(0.0);
float l9_583;
if (l9_576.x<=0.0)
{
l9_583=0.0;
}
else
{
l9_583=sqrt(l9_576.x);
}
float l9_584=l9_583;
float l9_585;
if (l9_576.y<=0.0)
{
l9_585=0.0;
}
else
{
l9_585=sqrt(l9_576.y);
}
float l9_586=l9_585;
float l9_587;
if (l9_576.z<=0.0)
{
l9_587=0.0;
}
else
{
l9_587=sqrt(l9_576.z);
}
l9_582=float3(l9_584,l9_586,l9_587);
float l9_588=0.0;
l9_588=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_589=float3(0.0);
l9_589=(*sc_set0.UserUniforms).Port_Import_N059;
float3 l9_590=float3(0.0);
l9_590=((l9_491*l9_582)*float3(l9_588))*l9_589;
float l9_591=0.0;
float3 l9_592=l9_590;
float l9_593=l9_592.y;
l9_591=l9_593;
float l9_594=0.0;
l9_594=abs(l9_591);
l9_404=l9_594;
l9_409=l9_404;
}
else
{
float3 l9_595=float3(0.0);
float3 l9_596=(*sc_set0.UserUniforms).Port_Min_N048;
float3 l9_597=(*sc_set0.UserUniforms).Port_Max_N048;
ssGlobals l9_598=l9_406;
int l9_599=3;
bool l9_600=true;
bool l9_601=true;
bool l9_602=true;
float l9_603=48.0;
ssParticle l9_604=gParticle;
float l9_605=0.0;
float l9_606=l9_598.gTimeElapsed;
float4 l9_607=float4(0.0);
float4 l9_608=float4(0.0);
if (l9_600)
{
l9_608.x=floor(fract(l9_606)*1000.0);
}
if (l9_602)
{
l9_608.y=float(l9_604.Index1D^((l9_604.Index1D*15299)+l9_604.Index1D));
}
if (l9_601)
{
l9_608.z=l9_603;
}
l9_608.w=l9_605*1000.0;
int l9_609=int(l9_608.x);
int l9_610=int(l9_608.y);
int l9_611=int(l9_608.z);
int l9_612=int(l9_608.w);
int l9_613=(((l9_609*15299)^(l9_610*30133))^(l9_611*17539))^(l9_612*12113);
int l9_614=l9_613;
if (l9_599==1)
{
int l9_615=l9_614;
int l9_616=l9_615;
int l9_617=((l9_616*((l9_616*1471343)+101146501))+1559861749)&2147483647;
int l9_618=l9_617;
float l9_619=float(l9_618)*4.6566129e-10;
float l9_620=l9_619;
l9_607.x=l9_620;
}
else
{
if (l9_599==2)
{
int l9_621=l9_614;
int l9_622=l9_621;
int l9_623=((l9_622*((l9_622*1471343)+101146501))+1559861749)&2147483647;
int l9_624=l9_623;
int l9_625=l9_621*1399;
int l9_626=((l9_625*((l9_625*1471343)+101146501))+1559861749)&2147483647;
int l9_627=l9_626;
int l9_628=l9_624;
float l9_629=float(l9_628)*4.6566129e-10;
int l9_630=l9_627;
float l9_631=float(l9_630)*4.6566129e-10;
float2 l9_632=float2(l9_629,l9_631);
l9_607=float4(l9_632.x,l9_632.y,l9_607.z,l9_607.w);
}
else
{
if (l9_599==3)
{
int l9_633=l9_614;
int l9_634=l9_633;
int l9_635=((l9_634*((l9_634*1471343)+101146501))+1559861749)&2147483647;
int l9_636=l9_635;
int l9_637=l9_633*1399;
int l9_638=((l9_637*((l9_637*1471343)+101146501))+1559861749)&2147483647;
int l9_639=l9_638;
int l9_640=l9_633*7177;
int l9_641=((l9_640*((l9_640*1471343)+101146501))+1559861749)&2147483647;
int l9_642=l9_641;
int l9_643=l9_636;
float l9_644=float(l9_643)*4.6566129e-10;
int l9_645=l9_639;
float l9_646=float(l9_645)*4.6566129e-10;
int l9_647=l9_642;
float l9_648=float(l9_647)*4.6566129e-10;
float3 l9_649=float3(l9_644,l9_646,l9_648);
l9_607=float4(l9_649.x,l9_649.y,l9_649.z,l9_607.w);
}
else
{
int l9_650=l9_614;
int l9_651=l9_650;
int l9_652=((l9_651*((l9_651*1471343)+101146501))+1559861749)&2147483647;
int l9_653=l9_652;
int l9_654=l9_650*1399;
int l9_655=((l9_654*((l9_654*1471343)+101146501))+1559861749)&2147483647;
int l9_656=l9_655;
int l9_657=l9_650*7177;
int l9_658=((l9_657*((l9_657*1471343)+101146501))+1559861749)&2147483647;
int l9_659=l9_658;
int l9_660=l9_650*18919;
int l9_661=((l9_660*((l9_660*1471343)+101146501))+1559861749)&2147483647;
int l9_662=l9_661;
int l9_663=l9_653;
float l9_664=float(l9_663)*4.6566129e-10;
int l9_665=l9_656;
float l9_666=float(l9_665)*4.6566129e-10;
int l9_667=l9_659;
float l9_668=float(l9_667)*4.6566129e-10;
int l9_669=l9_662;
float l9_670=float(l9_669)*4.6566129e-10;
float4 l9_671=float4(l9_664,l9_666,l9_668,l9_670);
l9_607=l9_671;
}
}
}
float4 l9_672=l9_607;
float4 l9_673=l9_672;
float3 l9_674=mix(l9_596,l9_597,l9_673.xyz);
l9_595=l9_674;
float l9_675=0.0;
l9_675=length(l9_595);
float3 l9_676=float3(0.0);
l9_676=l9_595/(float3(l9_675)+float3(1.234e-06));
float l9_677=0.0;
l9_677=fast::clamp((*sc_set0.UserUniforms).Port_Import_N052,0.0,1.0);
float l9_678=0.0;
l9_678=1.0-l9_677;
float l9_679=0.0;
float l9_680;
if (l9_678<=0.0)
{
l9_680=0.0;
}
else
{
l9_680=pow(l9_678,(*sc_set0.UserUniforms).Port_Input1_N054);
}
l9_679=l9_680;
float3 l9_681=float3(0.0);
float3 l9_682=float3(l9_679);
float3 l9_683=(*sc_set0.UserUniforms).Port_Max_N055;
ssGlobals l9_684=l9_406;
int l9_685=3;
bool l9_686=true;
bool l9_687=true;
bool l9_688=true;
float l9_689=55.0;
ssParticle l9_690=gParticle;
float l9_691=0.0;
float l9_692=l9_684.gTimeElapsed;
float4 l9_693=float4(0.0);
float4 l9_694=float4(0.0);
if (l9_686)
{
l9_694.x=floor(fract(l9_692)*1000.0);
}
if (l9_688)
{
l9_694.y=float(l9_690.Index1D^((l9_690.Index1D*15299)+l9_690.Index1D));
}
if (l9_687)
{
l9_694.z=l9_689;
}
l9_694.w=l9_691*1000.0;
int l9_695=int(l9_694.x);
int l9_696=int(l9_694.y);
int l9_697=int(l9_694.z);
int l9_698=int(l9_694.w);
int l9_699=(((l9_695*15299)^(l9_696*30133))^(l9_697*17539))^(l9_698*12113);
int l9_700=l9_699;
if (l9_685==1)
{
int l9_701=l9_700;
int l9_702=l9_701;
int l9_703=((l9_702*((l9_702*1471343)+101146501))+1559861749)&2147483647;
int l9_704=l9_703;
float l9_705=float(l9_704)*4.6566129e-10;
float l9_706=l9_705;
l9_693.x=l9_706;
}
else
{
if (l9_685==2)
{
int l9_707=l9_700;
int l9_708=l9_707;
int l9_709=((l9_708*((l9_708*1471343)+101146501))+1559861749)&2147483647;
int l9_710=l9_709;
int l9_711=l9_707*1399;
int l9_712=((l9_711*((l9_711*1471343)+101146501))+1559861749)&2147483647;
int l9_713=l9_712;
int l9_714=l9_710;
float l9_715=float(l9_714)*4.6566129e-10;
int l9_716=l9_713;
float l9_717=float(l9_716)*4.6566129e-10;
float2 l9_718=float2(l9_715,l9_717);
l9_693=float4(l9_718.x,l9_718.y,l9_693.z,l9_693.w);
}
else
{
if (l9_685==3)
{
int l9_719=l9_700;
int l9_720=l9_719;
int l9_721=((l9_720*((l9_720*1471343)+101146501))+1559861749)&2147483647;
int l9_722=l9_721;
int l9_723=l9_719*1399;
int l9_724=((l9_723*((l9_723*1471343)+101146501))+1559861749)&2147483647;
int l9_725=l9_724;
int l9_726=l9_719*7177;
int l9_727=((l9_726*((l9_726*1471343)+101146501))+1559861749)&2147483647;
int l9_728=l9_727;
int l9_729=l9_722;
float l9_730=float(l9_729)*4.6566129e-10;
int l9_731=l9_725;
float l9_732=float(l9_731)*4.6566129e-10;
int l9_733=l9_728;
float l9_734=float(l9_733)*4.6566129e-10;
float3 l9_735=float3(l9_730,l9_732,l9_734);
l9_693=float4(l9_735.x,l9_735.y,l9_735.z,l9_693.w);
}
else
{
int l9_736=l9_700;
int l9_737=l9_736;
int l9_738=((l9_737*((l9_737*1471343)+101146501))+1559861749)&2147483647;
int l9_739=l9_738;
int l9_740=l9_736*1399;
int l9_741=((l9_740*((l9_740*1471343)+101146501))+1559861749)&2147483647;
int l9_742=l9_741;
int l9_743=l9_736*7177;
int l9_744=((l9_743*((l9_743*1471343)+101146501))+1559861749)&2147483647;
int l9_745=l9_744;
int l9_746=l9_736*18919;
int l9_747=((l9_746*((l9_746*1471343)+101146501))+1559861749)&2147483647;
int l9_748=l9_747;
int l9_749=l9_739;
float l9_750=float(l9_749)*4.6566129e-10;
int l9_751=l9_742;
float l9_752=float(l9_751)*4.6566129e-10;
int l9_753=l9_745;
float l9_754=float(l9_753)*4.6566129e-10;
int l9_755=l9_748;
float l9_756=float(l9_755)*4.6566129e-10;
float4 l9_757=float4(l9_750,l9_752,l9_754,l9_756);
l9_693=l9_757;
}
}
}
float4 l9_758=l9_693;
float4 l9_759=l9_758;
float3 l9_760=mix(l9_682,l9_683,l9_759.xyz);
l9_681=l9_760;
float3 l9_761=float3(0.0);
float l9_762;
if (l9_681.x<=0.0)
{
l9_762=0.0;
}
else
{
l9_762=sqrt(l9_681.x);
}
float l9_763=l9_762;
float l9_764;
if (l9_681.y<=0.0)
{
l9_764=0.0;
}
else
{
l9_764=sqrt(l9_681.y);
}
float l9_765=l9_764;
float l9_766;
if (l9_681.z<=0.0)
{
l9_766=0.0;
}
else
{
l9_766=sqrt(l9_681.z);
}
l9_761=float3(l9_763,l9_765,l9_766);
float3 l9_767=float3(0.0);
float l9_768;
if (l9_761.x<=0.0)
{
l9_768=0.0;
}
else
{
l9_768=sqrt(l9_761.x);
}
float l9_769=l9_768;
float l9_770;
if (l9_761.y<=0.0)
{
l9_770=0.0;
}
else
{
l9_770=sqrt(l9_761.y);
}
float l9_771=l9_770;
float l9_772;
if (l9_761.z<=0.0)
{
l9_772=0.0;
}
else
{
l9_772=sqrt(l9_761.z);
}
l9_767=float3(l9_769,l9_771,l9_772);
float l9_773=0.0;
l9_773=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_774=float3(0.0);
l9_774=(*sc_set0.UserUniforms).Port_Import_N059;
float3 l9_775=float3(0.0);
l9_775=((l9_676*l9_767)*float3(l9_773))*l9_774;
float l9_776=0.0;
float3 l9_777=l9_775;
float l9_778=l9_777.y;
l9_776=l9_778;
l9_405=l9_776;
l9_409=l9_405;
}
l9_402=l9_409;
float l9_779=0.0;
float l9_780=0.0;
float l9_781=0.0;
float l9_782=0.0;
ssGlobals l9_783=param_1;
float l9_784=0.0;
l9_784=0.0;
float l9_785=0.0;
l9_785=float(l9_784==(*sc_set0.UserUniforms).Port_Input1_N149);
l9_780=l9_785;
float l9_786;
if ((l9_780*1.0)!=0.0)
{
float3 l9_787=float3(0.0);
float3 l9_788=(*sc_set0.UserUniforms).Port_Min_N048;
float3 l9_789=(*sc_set0.UserUniforms).Port_Max_N048;
ssGlobals l9_790=l9_783;
int l9_791=3;
bool l9_792=true;
bool l9_793=true;
bool l9_794=true;
float l9_795=48.0;
ssParticle l9_796=gParticle;
float l9_797=0.0;
float l9_798=l9_790.gTimeElapsed;
float4 l9_799=float4(0.0);
float4 l9_800=float4(0.0);
if (l9_792)
{
l9_800.x=floor(fract(l9_798)*1000.0);
}
if (l9_794)
{
l9_800.y=float(l9_796.Index1D^((l9_796.Index1D*15299)+l9_796.Index1D));
}
if (l9_793)
{
l9_800.z=l9_795;
}
l9_800.w=l9_797*1000.0;
int l9_801=int(l9_800.x);
int l9_802=int(l9_800.y);
int l9_803=int(l9_800.z);
int l9_804=int(l9_800.w);
int l9_805=(((l9_801*15299)^(l9_802*30133))^(l9_803*17539))^(l9_804*12113);
int l9_806=l9_805;
if (l9_791==1)
{
int l9_807=l9_806;
int l9_808=l9_807;
int l9_809=((l9_808*((l9_808*1471343)+101146501))+1559861749)&2147483647;
int l9_810=l9_809;
float l9_811=float(l9_810)*4.6566129e-10;
float l9_812=l9_811;
l9_799.x=l9_812;
}
else
{
if (l9_791==2)
{
int l9_813=l9_806;
int l9_814=l9_813;
int l9_815=((l9_814*((l9_814*1471343)+101146501))+1559861749)&2147483647;
int l9_816=l9_815;
int l9_817=l9_813*1399;
int l9_818=((l9_817*((l9_817*1471343)+101146501))+1559861749)&2147483647;
int l9_819=l9_818;
int l9_820=l9_816;
float l9_821=float(l9_820)*4.6566129e-10;
int l9_822=l9_819;
float l9_823=float(l9_822)*4.6566129e-10;
float2 l9_824=float2(l9_821,l9_823);
l9_799=float4(l9_824.x,l9_824.y,l9_799.z,l9_799.w);
}
else
{
if (l9_791==3)
{
int l9_825=l9_806;
int l9_826=l9_825;
int l9_827=((l9_826*((l9_826*1471343)+101146501))+1559861749)&2147483647;
int l9_828=l9_827;
int l9_829=l9_825*1399;
int l9_830=((l9_829*((l9_829*1471343)+101146501))+1559861749)&2147483647;
int l9_831=l9_830;
int l9_832=l9_825*7177;
int l9_833=((l9_832*((l9_832*1471343)+101146501))+1559861749)&2147483647;
int l9_834=l9_833;
int l9_835=l9_828;
float l9_836=float(l9_835)*4.6566129e-10;
int l9_837=l9_831;
float l9_838=float(l9_837)*4.6566129e-10;
int l9_839=l9_834;
float l9_840=float(l9_839)*4.6566129e-10;
float3 l9_841=float3(l9_836,l9_838,l9_840);
l9_799=float4(l9_841.x,l9_841.y,l9_841.z,l9_799.w);
}
else
{
int l9_842=l9_806;
int l9_843=l9_842;
int l9_844=((l9_843*((l9_843*1471343)+101146501))+1559861749)&2147483647;
int l9_845=l9_844;
int l9_846=l9_842*1399;
int l9_847=((l9_846*((l9_846*1471343)+101146501))+1559861749)&2147483647;
int l9_848=l9_847;
int l9_849=l9_842*7177;
int l9_850=((l9_849*((l9_849*1471343)+101146501))+1559861749)&2147483647;
int l9_851=l9_850;
int l9_852=l9_842*18919;
int l9_853=((l9_852*((l9_852*1471343)+101146501))+1559861749)&2147483647;
int l9_854=l9_853;
int l9_855=l9_845;
float l9_856=float(l9_855)*4.6566129e-10;
int l9_857=l9_848;
float l9_858=float(l9_857)*4.6566129e-10;
int l9_859=l9_851;
float l9_860=float(l9_859)*4.6566129e-10;
int l9_861=l9_854;
float l9_862=float(l9_861)*4.6566129e-10;
float4 l9_863=float4(l9_856,l9_858,l9_860,l9_862);
l9_799=l9_863;
}
}
}
float4 l9_864=l9_799;
float4 l9_865=l9_864;
float3 l9_866=mix(l9_788,l9_789,l9_865.xyz);
l9_787=l9_866;
float l9_867=0.0;
l9_867=length(l9_787);
float3 l9_868=float3(0.0);
l9_868=l9_787/(float3(l9_867)+float3(1.234e-06));
float l9_869=0.0;
l9_869=fast::clamp((*sc_set0.UserUniforms).Port_Import_N052,0.0,1.0);
float l9_870=0.0;
l9_870=1.0-l9_869;
float l9_871=0.0;
float l9_872;
if (l9_870<=0.0)
{
l9_872=0.0;
}
else
{
l9_872=pow(l9_870,(*sc_set0.UserUniforms).Port_Input1_N054);
}
l9_871=l9_872;
float3 l9_873=float3(0.0);
float3 l9_874=float3(l9_871);
float3 l9_875=(*sc_set0.UserUniforms).Port_Max_N055;
ssGlobals l9_876=l9_783;
int l9_877=3;
bool l9_878=true;
bool l9_879=true;
bool l9_880=true;
float l9_881=55.0;
ssParticle l9_882=gParticle;
float l9_883=0.0;
float l9_884=l9_876.gTimeElapsed;
float4 l9_885=float4(0.0);
float4 l9_886=float4(0.0);
if (l9_878)
{
l9_886.x=floor(fract(l9_884)*1000.0);
}
if (l9_880)
{
l9_886.y=float(l9_882.Index1D^((l9_882.Index1D*15299)+l9_882.Index1D));
}
if (l9_879)
{
l9_886.z=l9_881;
}
l9_886.w=l9_883*1000.0;
int l9_887=int(l9_886.x);
int l9_888=int(l9_886.y);
int l9_889=int(l9_886.z);
int l9_890=int(l9_886.w);
int l9_891=(((l9_887*15299)^(l9_888*30133))^(l9_889*17539))^(l9_890*12113);
int l9_892=l9_891;
if (l9_877==1)
{
int l9_893=l9_892;
int l9_894=l9_893;
int l9_895=((l9_894*((l9_894*1471343)+101146501))+1559861749)&2147483647;
int l9_896=l9_895;
float l9_897=float(l9_896)*4.6566129e-10;
float l9_898=l9_897;
l9_885.x=l9_898;
}
else
{
if (l9_877==2)
{
int l9_899=l9_892;
int l9_900=l9_899;
int l9_901=((l9_900*((l9_900*1471343)+101146501))+1559861749)&2147483647;
int l9_902=l9_901;
int l9_903=l9_899*1399;
int l9_904=((l9_903*((l9_903*1471343)+101146501))+1559861749)&2147483647;
int l9_905=l9_904;
int l9_906=l9_902;
float l9_907=float(l9_906)*4.6566129e-10;
int l9_908=l9_905;
float l9_909=float(l9_908)*4.6566129e-10;
float2 l9_910=float2(l9_907,l9_909);
l9_885=float4(l9_910.x,l9_910.y,l9_885.z,l9_885.w);
}
else
{
if (l9_877==3)
{
int l9_911=l9_892;
int l9_912=l9_911;
int l9_913=((l9_912*((l9_912*1471343)+101146501))+1559861749)&2147483647;
int l9_914=l9_913;
int l9_915=l9_911*1399;
int l9_916=((l9_915*((l9_915*1471343)+101146501))+1559861749)&2147483647;
int l9_917=l9_916;
int l9_918=l9_911*7177;
int l9_919=((l9_918*((l9_918*1471343)+101146501))+1559861749)&2147483647;
int l9_920=l9_919;
int l9_921=l9_914;
float l9_922=float(l9_921)*4.6566129e-10;
int l9_923=l9_917;
float l9_924=float(l9_923)*4.6566129e-10;
int l9_925=l9_920;
float l9_926=float(l9_925)*4.6566129e-10;
float3 l9_927=float3(l9_922,l9_924,l9_926);
l9_885=float4(l9_927.x,l9_927.y,l9_927.z,l9_885.w);
}
else
{
int l9_928=l9_892;
int l9_929=l9_928;
int l9_930=((l9_929*((l9_929*1471343)+101146501))+1559861749)&2147483647;
int l9_931=l9_930;
int l9_932=l9_928*1399;
int l9_933=((l9_932*((l9_932*1471343)+101146501))+1559861749)&2147483647;
int l9_934=l9_933;
int l9_935=l9_928*7177;
int l9_936=((l9_935*((l9_935*1471343)+101146501))+1559861749)&2147483647;
int l9_937=l9_936;
int l9_938=l9_928*18919;
int l9_939=((l9_938*((l9_938*1471343)+101146501))+1559861749)&2147483647;
int l9_940=l9_939;
int l9_941=l9_931;
float l9_942=float(l9_941)*4.6566129e-10;
int l9_943=l9_934;
float l9_944=float(l9_943)*4.6566129e-10;
int l9_945=l9_937;
float l9_946=float(l9_945)*4.6566129e-10;
int l9_947=l9_940;
float l9_948=float(l9_947)*4.6566129e-10;
float4 l9_949=float4(l9_942,l9_944,l9_946,l9_948);
l9_885=l9_949;
}
}
}
float4 l9_950=l9_885;
float4 l9_951=l9_950;
float3 l9_952=mix(l9_874,l9_875,l9_951.xyz);
l9_873=l9_952;
float3 l9_953=float3(0.0);
float l9_954;
if (l9_873.x<=0.0)
{
l9_954=0.0;
}
else
{
l9_954=sqrt(l9_873.x);
}
float l9_955=l9_954;
float l9_956;
if (l9_873.y<=0.0)
{
l9_956=0.0;
}
else
{
l9_956=sqrt(l9_873.y);
}
float l9_957=l9_956;
float l9_958;
if (l9_873.z<=0.0)
{
l9_958=0.0;
}
else
{
l9_958=sqrt(l9_873.z);
}
l9_953=float3(l9_955,l9_957,l9_958);
float3 l9_959=float3(0.0);
float l9_960;
if (l9_953.x<=0.0)
{
l9_960=0.0;
}
else
{
l9_960=sqrt(l9_953.x);
}
float l9_961=l9_960;
float l9_962;
if (l9_953.y<=0.0)
{
l9_962=0.0;
}
else
{
l9_962=sqrt(l9_953.y);
}
float l9_963=l9_962;
float l9_964;
if (l9_953.z<=0.0)
{
l9_964=0.0;
}
else
{
l9_964=sqrt(l9_953.z);
}
l9_959=float3(l9_961,l9_963,l9_964);
float l9_965=0.0;
l9_965=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_966=float3(0.0);
l9_966=(*sc_set0.UserUniforms).Port_Import_N059;
float3 l9_967=float3(0.0);
l9_967=((l9_868*l9_959)*float3(l9_965))*l9_966;
float l9_968=0.0;
float3 l9_969=l9_967;
float l9_970=l9_969.z;
l9_968=l9_970;
float l9_971=0.0;
l9_971=abs(l9_968);
l9_781=l9_971;
l9_786=l9_781;
}
else
{
float3 l9_972=float3(0.0);
float3 l9_973=(*sc_set0.UserUniforms).Port_Min_N048;
float3 l9_974=(*sc_set0.UserUniforms).Port_Max_N048;
ssGlobals l9_975=l9_783;
int l9_976=3;
bool l9_977=true;
bool l9_978=true;
bool l9_979=true;
float l9_980=48.0;
ssParticle l9_981=gParticle;
float l9_982=0.0;
float l9_983=l9_975.gTimeElapsed;
float4 l9_984=float4(0.0);
float4 l9_985=float4(0.0);
if (l9_977)
{
l9_985.x=floor(fract(l9_983)*1000.0);
}
if (l9_979)
{
l9_985.y=float(l9_981.Index1D^((l9_981.Index1D*15299)+l9_981.Index1D));
}
if (l9_978)
{
l9_985.z=l9_980;
}
l9_985.w=l9_982*1000.0;
int l9_986=int(l9_985.x);
int l9_987=int(l9_985.y);
int l9_988=int(l9_985.z);
int l9_989=int(l9_985.w);
int l9_990=(((l9_986*15299)^(l9_987*30133))^(l9_988*17539))^(l9_989*12113);
int l9_991=l9_990;
if (l9_976==1)
{
int l9_992=l9_991;
int l9_993=l9_992;
int l9_994=((l9_993*((l9_993*1471343)+101146501))+1559861749)&2147483647;
int l9_995=l9_994;
float l9_996=float(l9_995)*4.6566129e-10;
float l9_997=l9_996;
l9_984.x=l9_997;
}
else
{
if (l9_976==2)
{
int l9_998=l9_991;
int l9_999=l9_998;
int l9_1000=((l9_999*((l9_999*1471343)+101146501))+1559861749)&2147483647;
int l9_1001=l9_1000;
int l9_1002=l9_998*1399;
int l9_1003=((l9_1002*((l9_1002*1471343)+101146501))+1559861749)&2147483647;
int l9_1004=l9_1003;
int l9_1005=l9_1001;
float l9_1006=float(l9_1005)*4.6566129e-10;
int l9_1007=l9_1004;
float l9_1008=float(l9_1007)*4.6566129e-10;
float2 l9_1009=float2(l9_1006,l9_1008);
l9_984=float4(l9_1009.x,l9_1009.y,l9_984.z,l9_984.w);
}
else
{
if (l9_976==3)
{
int l9_1010=l9_991;
int l9_1011=l9_1010;
int l9_1012=((l9_1011*((l9_1011*1471343)+101146501))+1559861749)&2147483647;
int l9_1013=l9_1012;
int l9_1014=l9_1010*1399;
int l9_1015=((l9_1014*((l9_1014*1471343)+101146501))+1559861749)&2147483647;
int l9_1016=l9_1015;
int l9_1017=l9_1010*7177;
int l9_1018=((l9_1017*((l9_1017*1471343)+101146501))+1559861749)&2147483647;
int l9_1019=l9_1018;
int l9_1020=l9_1013;
float l9_1021=float(l9_1020)*4.6566129e-10;
int l9_1022=l9_1016;
float l9_1023=float(l9_1022)*4.6566129e-10;
int l9_1024=l9_1019;
float l9_1025=float(l9_1024)*4.6566129e-10;
float3 l9_1026=float3(l9_1021,l9_1023,l9_1025);
l9_984=float4(l9_1026.x,l9_1026.y,l9_1026.z,l9_984.w);
}
else
{
int l9_1027=l9_991;
int l9_1028=l9_1027;
int l9_1029=((l9_1028*((l9_1028*1471343)+101146501))+1559861749)&2147483647;
int l9_1030=l9_1029;
int l9_1031=l9_1027*1399;
int l9_1032=((l9_1031*((l9_1031*1471343)+101146501))+1559861749)&2147483647;
int l9_1033=l9_1032;
int l9_1034=l9_1027*7177;
int l9_1035=((l9_1034*((l9_1034*1471343)+101146501))+1559861749)&2147483647;
int l9_1036=l9_1035;
int l9_1037=l9_1027*18919;
int l9_1038=((l9_1037*((l9_1037*1471343)+101146501))+1559861749)&2147483647;
int l9_1039=l9_1038;
int l9_1040=l9_1030;
float l9_1041=float(l9_1040)*4.6566129e-10;
int l9_1042=l9_1033;
float l9_1043=float(l9_1042)*4.6566129e-10;
int l9_1044=l9_1036;
float l9_1045=float(l9_1044)*4.6566129e-10;
int l9_1046=l9_1039;
float l9_1047=float(l9_1046)*4.6566129e-10;
float4 l9_1048=float4(l9_1041,l9_1043,l9_1045,l9_1047);
l9_984=l9_1048;
}
}
}
float4 l9_1049=l9_984;
float4 l9_1050=l9_1049;
float3 l9_1051=mix(l9_973,l9_974,l9_1050.xyz);
l9_972=l9_1051;
float l9_1052=0.0;
l9_1052=length(l9_972);
float3 l9_1053=float3(0.0);
l9_1053=l9_972/(float3(l9_1052)+float3(1.234e-06));
float l9_1054=0.0;
l9_1054=fast::clamp((*sc_set0.UserUniforms).Port_Import_N052,0.0,1.0);
float l9_1055=0.0;
l9_1055=1.0-l9_1054;
float l9_1056=0.0;
float l9_1057;
if (l9_1055<=0.0)
{
l9_1057=0.0;
}
else
{
l9_1057=pow(l9_1055,(*sc_set0.UserUniforms).Port_Input1_N054);
}
l9_1056=l9_1057;
float3 l9_1058=float3(0.0);
float3 l9_1059=float3(l9_1056);
float3 l9_1060=(*sc_set0.UserUniforms).Port_Max_N055;
ssGlobals l9_1061=l9_783;
int l9_1062=3;
bool l9_1063=true;
bool l9_1064=true;
bool l9_1065=true;
float l9_1066=55.0;
ssParticle l9_1067=gParticle;
float l9_1068=0.0;
float l9_1069=l9_1061.gTimeElapsed;
float4 l9_1070=float4(0.0);
float4 l9_1071=float4(0.0);
if (l9_1063)
{
l9_1071.x=floor(fract(l9_1069)*1000.0);
}
if (l9_1065)
{
l9_1071.y=float(l9_1067.Index1D^((l9_1067.Index1D*15299)+l9_1067.Index1D));
}
if (l9_1064)
{
l9_1071.z=l9_1066;
}
l9_1071.w=l9_1068*1000.0;
int l9_1072=int(l9_1071.x);
int l9_1073=int(l9_1071.y);
int l9_1074=int(l9_1071.z);
int l9_1075=int(l9_1071.w);
int l9_1076=(((l9_1072*15299)^(l9_1073*30133))^(l9_1074*17539))^(l9_1075*12113);
int l9_1077=l9_1076;
if (l9_1062==1)
{
int l9_1078=l9_1077;
int l9_1079=l9_1078;
int l9_1080=((l9_1079*((l9_1079*1471343)+101146501))+1559861749)&2147483647;
int l9_1081=l9_1080;
float l9_1082=float(l9_1081)*4.6566129e-10;
float l9_1083=l9_1082;
l9_1070.x=l9_1083;
}
else
{
if (l9_1062==2)
{
int l9_1084=l9_1077;
int l9_1085=l9_1084;
int l9_1086=((l9_1085*((l9_1085*1471343)+101146501))+1559861749)&2147483647;
int l9_1087=l9_1086;
int l9_1088=l9_1084*1399;
int l9_1089=((l9_1088*((l9_1088*1471343)+101146501))+1559861749)&2147483647;
int l9_1090=l9_1089;
int l9_1091=l9_1087;
float l9_1092=float(l9_1091)*4.6566129e-10;
int l9_1093=l9_1090;
float l9_1094=float(l9_1093)*4.6566129e-10;
float2 l9_1095=float2(l9_1092,l9_1094);
l9_1070=float4(l9_1095.x,l9_1095.y,l9_1070.z,l9_1070.w);
}
else
{
if (l9_1062==3)
{
int l9_1096=l9_1077;
int l9_1097=l9_1096;
int l9_1098=((l9_1097*((l9_1097*1471343)+101146501))+1559861749)&2147483647;
int l9_1099=l9_1098;
int l9_1100=l9_1096*1399;
int l9_1101=((l9_1100*((l9_1100*1471343)+101146501))+1559861749)&2147483647;
int l9_1102=l9_1101;
int l9_1103=l9_1096*7177;
int l9_1104=((l9_1103*((l9_1103*1471343)+101146501))+1559861749)&2147483647;
int l9_1105=l9_1104;
int l9_1106=l9_1099;
float l9_1107=float(l9_1106)*4.6566129e-10;
int l9_1108=l9_1102;
float l9_1109=float(l9_1108)*4.6566129e-10;
int l9_1110=l9_1105;
float l9_1111=float(l9_1110)*4.6566129e-10;
float3 l9_1112=float3(l9_1107,l9_1109,l9_1111);
l9_1070=float4(l9_1112.x,l9_1112.y,l9_1112.z,l9_1070.w);
}
else
{
int l9_1113=l9_1077;
int l9_1114=l9_1113;
int l9_1115=((l9_1114*((l9_1114*1471343)+101146501))+1559861749)&2147483647;
int l9_1116=l9_1115;
int l9_1117=l9_1113*1399;
int l9_1118=((l9_1117*((l9_1117*1471343)+101146501))+1559861749)&2147483647;
int l9_1119=l9_1118;
int l9_1120=l9_1113*7177;
int l9_1121=((l9_1120*((l9_1120*1471343)+101146501))+1559861749)&2147483647;
int l9_1122=l9_1121;
int l9_1123=l9_1113*18919;
int l9_1124=((l9_1123*((l9_1123*1471343)+101146501))+1559861749)&2147483647;
int l9_1125=l9_1124;
int l9_1126=l9_1116;
float l9_1127=float(l9_1126)*4.6566129e-10;
int l9_1128=l9_1119;
float l9_1129=float(l9_1128)*4.6566129e-10;
int l9_1130=l9_1122;
float l9_1131=float(l9_1130)*4.6566129e-10;
int l9_1132=l9_1125;
float l9_1133=float(l9_1132)*4.6566129e-10;
float4 l9_1134=float4(l9_1127,l9_1129,l9_1131,l9_1133);
l9_1070=l9_1134;
}
}
}
float4 l9_1135=l9_1070;
float4 l9_1136=l9_1135;
float3 l9_1137=mix(l9_1059,l9_1060,l9_1136.xyz);
l9_1058=l9_1137;
float3 l9_1138=float3(0.0);
float l9_1139;
if (l9_1058.x<=0.0)
{
l9_1139=0.0;
}
else
{
l9_1139=sqrt(l9_1058.x);
}
float l9_1140=l9_1139;
float l9_1141;
if (l9_1058.y<=0.0)
{
l9_1141=0.0;
}
else
{
l9_1141=sqrt(l9_1058.y);
}
float l9_1142=l9_1141;
float l9_1143;
if (l9_1058.z<=0.0)
{
l9_1143=0.0;
}
else
{
l9_1143=sqrt(l9_1058.z);
}
l9_1138=float3(l9_1140,l9_1142,l9_1143);
float3 l9_1144=float3(0.0);
float l9_1145;
if (l9_1138.x<=0.0)
{
l9_1145=0.0;
}
else
{
l9_1145=sqrt(l9_1138.x);
}
float l9_1146=l9_1145;
float l9_1147;
if (l9_1138.y<=0.0)
{
l9_1147=0.0;
}
else
{
l9_1147=sqrt(l9_1138.y);
}
float l9_1148=l9_1147;
float l9_1149;
if (l9_1138.z<=0.0)
{
l9_1149=0.0;
}
else
{
l9_1149=sqrt(l9_1138.z);
}
l9_1144=float3(l9_1146,l9_1148,l9_1149);
float l9_1150=0.0;
l9_1150=(*sc_set0.UserUniforms).Port_Import_N058;
float3 l9_1151=float3(0.0);
l9_1151=(*sc_set0.UserUniforms).Port_Import_N059;
float3 l9_1152=float3(0.0);
l9_1152=((l9_1053*l9_1144)*float3(l9_1150))*l9_1151;
float l9_1153=0.0;
float3 l9_1154=l9_1152;
float l9_1155=l9_1154.z;
l9_1153=l9_1155;
l9_782=l9_1153;
l9_786=l9_782;
}
l9_779=l9_786;
float3 l9_1156=float3(0.0);
l9_1156.x=l9_25;
l9_1156.y=l9_402;
l9_1156.z=l9_779;
float3 l9_1157=float3(0.0);
l9_1157=l9_24+l9_1156;
gParticle.Position=l9_1157;
gParticle.Color=(*sc_set0.UserUniforms).Port_Value_N011;
float l9_1158=0.0;
l9_1158=(*sc_set0.UserUniforms).Port_Import_N143;
float l9_1159=0.0;
l9_1159=(*sc_set0.UserUniforms).Port_Import_N144;
float l9_1160=0.0;
float l9_1161=l9_1158;
float l9_1162=l9_1159;
ssGlobals l9_1163=param_1;
int l9_1164=1;
bool l9_1165=true;
bool l9_1166=true;
bool l9_1167=true;
float l9_1168=145.0;
ssParticle l9_1169=gParticle;
float l9_1170=0.0;
float l9_1171=l9_1163.gTimeElapsed;
float4 l9_1172=float4(0.0);
float4 l9_1173=float4(0.0);
if (l9_1165)
{
l9_1173.x=floor(fract(l9_1171)*1000.0);
}
if (l9_1167)
{
l9_1173.y=float(l9_1169.Index1D^((l9_1169.Index1D*15299)+l9_1169.Index1D));
}
if (l9_1166)
{
l9_1173.z=l9_1168;
}
l9_1173.w=l9_1170*1000.0;
int l9_1174=int(l9_1173.x);
int l9_1175=int(l9_1173.y);
int l9_1176=int(l9_1173.z);
int l9_1177=int(l9_1173.w);
int l9_1178=(((l9_1174*15299)^(l9_1175*30133))^(l9_1176*17539))^(l9_1177*12113);
int l9_1179=l9_1178;
if (l9_1164==1)
{
int l9_1180=l9_1179;
int l9_1181=l9_1180;
int l9_1182=((l9_1181*((l9_1181*1471343)+101146501))+1559861749)&2147483647;
int l9_1183=l9_1182;
float l9_1184=float(l9_1183)*4.6566129e-10;
float l9_1185=l9_1184;
l9_1172.x=l9_1185;
}
else
{
if (l9_1164==2)
{
int l9_1186=l9_1179;
int l9_1187=l9_1186;
int l9_1188=((l9_1187*((l9_1187*1471343)+101146501))+1559861749)&2147483647;
int l9_1189=l9_1188;
int l9_1190=l9_1186*1399;
int l9_1191=((l9_1190*((l9_1190*1471343)+101146501))+1559861749)&2147483647;
int l9_1192=l9_1191;
int l9_1193=l9_1189;
float l9_1194=float(l9_1193)*4.6566129e-10;
int l9_1195=l9_1192;
float l9_1196=float(l9_1195)*4.6566129e-10;
float2 l9_1197=float2(l9_1194,l9_1196);
l9_1172=float4(l9_1197.x,l9_1197.y,l9_1172.z,l9_1172.w);
}
else
{
if (l9_1164==3)
{
int l9_1198=l9_1179;
int l9_1199=l9_1198;
int l9_1200=((l9_1199*((l9_1199*1471343)+101146501))+1559861749)&2147483647;
int l9_1201=l9_1200;
int l9_1202=l9_1198*1399;
int l9_1203=((l9_1202*((l9_1202*1471343)+101146501))+1559861749)&2147483647;
int l9_1204=l9_1203;
int l9_1205=l9_1198*7177;
int l9_1206=((l9_1205*((l9_1205*1471343)+101146501))+1559861749)&2147483647;
int l9_1207=l9_1206;
int l9_1208=l9_1201;
float l9_1209=float(l9_1208)*4.6566129e-10;
int l9_1210=l9_1204;
float l9_1211=float(l9_1210)*4.6566129e-10;
int l9_1212=l9_1207;
float l9_1213=float(l9_1212)*4.6566129e-10;
float3 l9_1214=float3(l9_1209,l9_1211,l9_1213);
l9_1172=float4(l9_1214.x,l9_1214.y,l9_1214.z,l9_1172.w);
}
else
{
int l9_1215=l9_1179;
int l9_1216=l9_1215;
int l9_1217=((l9_1216*((l9_1216*1471343)+101146501))+1559861749)&2147483647;
int l9_1218=l9_1217;
int l9_1219=l9_1215*1399;
int l9_1220=((l9_1219*((l9_1219*1471343)+101146501))+1559861749)&2147483647;
int l9_1221=l9_1220;
int l9_1222=l9_1215*7177;
int l9_1223=((l9_1222*((l9_1222*1471343)+101146501))+1559861749)&2147483647;
int l9_1224=l9_1223;
int l9_1225=l9_1215*18919;
int l9_1226=((l9_1225*((l9_1225*1471343)+101146501))+1559861749)&2147483647;
int l9_1227=l9_1226;
int l9_1228=l9_1218;
float l9_1229=float(l9_1228)*4.6566129e-10;
int l9_1230=l9_1221;
float l9_1231=float(l9_1230)*4.6566129e-10;
int l9_1232=l9_1224;
float l9_1233=float(l9_1232)*4.6566129e-10;
int l9_1234=l9_1227;
float l9_1235=float(l9_1234)*4.6566129e-10;
float4 l9_1236=float4(l9_1229,l9_1231,l9_1233,l9_1235);
l9_1172=l9_1236;
}
}
}
float4 l9_1237=l9_1172;
float4 l9_1238=l9_1237;
float l9_1239=mix(l9_1161,l9_1162,l9_1238.x);
l9_1160=l9_1239;
float l9_1240=l9_1160;
gParticle.Mass=l9_1240;
gParticle.Mass=fast::max(9.9999997e-06,gParticle.Mass);
float l9_1241=0.0;
float l9_1242=1.0;
float l9_1243=1.0;
float l9_1244=0.0;
ssGlobals l9_1245=param_1;
float l9_1246=0.0;
l9_1246=0.0;
l9_1242=l9_1246;
float l9_1247;
if ((l9_1242*1.0)!=0.0)
{
float l9_1248=0.0;
l9_1248=(*sc_set0.UserUniforms).Port_Import_N027;
float l9_1249=0.0;
l9_1249=(*sc_set0.UserUniforms).Port_Import_N038;
float l9_1250=0.0;
float l9_1251=l9_1248;
float l9_1252=l9_1249;
ssGlobals l9_1253=l9_1245;
int l9_1254=1;
bool l9_1255=false;
bool l9_1256=true;
bool l9_1257=true;
float l9_1258=28.0;
ssParticle l9_1259=gParticle;
float l9_1260=0.0;
float l9_1261=l9_1253.gTimeElapsed;
float4 l9_1262=float4(0.0);
float4 l9_1263=float4(0.0);
if (l9_1255)
{
l9_1263.x=floor(fract(l9_1261)*1000.0);
}
if (l9_1257)
{
l9_1263.y=float(l9_1259.Index1D^((l9_1259.Index1D*15299)+l9_1259.Index1D));
}
if (l9_1256)
{
l9_1263.z=l9_1258;
}
l9_1263.w=l9_1260*1000.0;
int l9_1264=int(l9_1263.x);
int l9_1265=int(l9_1263.y);
int l9_1266=int(l9_1263.z);
int l9_1267=int(l9_1263.w);
int l9_1268=(((l9_1264*15299)^(l9_1265*30133))^(l9_1266*17539))^(l9_1267*12113);
int l9_1269=l9_1268;
if (l9_1254==1)
{
int l9_1270=l9_1269;
int l9_1271=l9_1270;
int l9_1272=((l9_1271*((l9_1271*1471343)+101146501))+1559861749)&2147483647;
int l9_1273=l9_1272;
float l9_1274=float(l9_1273)*4.6566129e-10;
float l9_1275=l9_1274;
l9_1262.x=l9_1275;
}
else
{
if (l9_1254==2)
{
int l9_1276=l9_1269;
int l9_1277=l9_1276;
int l9_1278=((l9_1277*((l9_1277*1471343)+101146501))+1559861749)&2147483647;
int l9_1279=l9_1278;
int l9_1280=l9_1276*1399;
int l9_1281=((l9_1280*((l9_1280*1471343)+101146501))+1559861749)&2147483647;
int l9_1282=l9_1281;
int l9_1283=l9_1279;
float l9_1284=float(l9_1283)*4.6566129e-10;
int l9_1285=l9_1282;
float l9_1286=float(l9_1285)*4.6566129e-10;
float2 l9_1287=float2(l9_1284,l9_1286);
l9_1262=float4(l9_1287.x,l9_1287.y,l9_1262.z,l9_1262.w);
}
else
{
if (l9_1254==3)
{
int l9_1288=l9_1269;
int l9_1289=l9_1288;
int l9_1290=((l9_1289*((l9_1289*1471343)+101146501))+1559861749)&2147483647;
int l9_1291=l9_1290;
int l9_1292=l9_1288*1399;
int l9_1293=((l9_1292*((l9_1292*1471343)+101146501))+1559861749)&2147483647;
int l9_1294=l9_1293;
int l9_1295=l9_1288*7177;
int l9_1296=((l9_1295*((l9_1295*1471343)+101146501))+1559861749)&2147483647;
int l9_1297=l9_1296;
int l9_1298=l9_1291;
float l9_1299=float(l9_1298)*4.6566129e-10;
int l9_1300=l9_1294;
float l9_1301=float(l9_1300)*4.6566129e-10;
int l9_1302=l9_1297;
float l9_1303=float(l9_1302)*4.6566129e-10;
float3 l9_1304=float3(l9_1299,l9_1301,l9_1303);
l9_1262=float4(l9_1304.x,l9_1304.y,l9_1304.z,l9_1262.w);
}
else
{
int l9_1305=l9_1269;
int l9_1306=l9_1305;
int l9_1307=((l9_1306*((l9_1306*1471343)+101146501))+1559861749)&2147483647;
int l9_1308=l9_1307;
int l9_1309=l9_1305*1399;
int l9_1310=((l9_1309*((l9_1309*1471343)+101146501))+1559861749)&2147483647;
int l9_1311=l9_1310;
int l9_1312=l9_1305*7177;
int l9_1313=((l9_1312*((l9_1312*1471343)+101146501))+1559861749)&2147483647;
int l9_1314=l9_1313;
int l9_1315=l9_1305*18919;
int l9_1316=((l9_1315*((l9_1315*1471343)+101146501))+1559861749)&2147483647;
int l9_1317=l9_1316;
int l9_1318=l9_1308;
float l9_1319=float(l9_1318)*4.6566129e-10;
int l9_1320=l9_1311;
float l9_1321=float(l9_1320)*4.6566129e-10;
int l9_1322=l9_1314;
float l9_1323=float(l9_1322)*4.6566129e-10;
int l9_1324=l9_1317;
float l9_1325=float(l9_1324)*4.6566129e-10;
float4 l9_1326=float4(l9_1319,l9_1321,l9_1323,l9_1325);
l9_1262=l9_1326;
}
}
}
float4 l9_1327=l9_1262;
float4 l9_1328=l9_1327;
float l9_1329=mix(l9_1251,l9_1252,l9_1328.x);
l9_1250=l9_1329;
float3 l9_1330=float3(0.0);
l9_1330=(*sc_set0.UserUniforms).vfxLocalAabbMax;
float3 l9_1331=float3(0.0);
l9_1331=(*sc_set0.UserUniforms).vfxLocalAabbMin;
float3 l9_1332=float3(0.0);
l9_1332=l9_1330-l9_1331;
float l9_1333=0.0;
l9_1333=length(l9_1332);
float l9_1334=0.0;
l9_1334=l9_1250/(l9_1333+1.234e-06);
l9_1243=l9_1334;
l9_1247=l9_1243;
}
else
{
float l9_1335=0.0;
l9_1335=(*sc_set0.UserUniforms).Port_Import_N027;
float l9_1336=0.0;
l9_1336=(*sc_set0.UserUniforms).Port_Import_N038;
float l9_1337=0.0;
float l9_1338=l9_1335;
float l9_1339=l9_1336;
ssGlobals l9_1340=l9_1245;
int l9_1341=1;
bool l9_1342=false;
bool l9_1343=true;
bool l9_1344=true;
float l9_1345=28.0;
ssParticle l9_1346=gParticle;
float l9_1347=0.0;
float l9_1348=l9_1340.gTimeElapsed;
float4 l9_1349=float4(0.0);
float4 l9_1350=float4(0.0);
if (l9_1342)
{
l9_1350.x=floor(fract(l9_1348)*1000.0);
}
if (l9_1344)
{
l9_1350.y=float(l9_1346.Index1D^((l9_1346.Index1D*15299)+l9_1346.Index1D));
}
if (l9_1343)
{
l9_1350.z=l9_1345;
}
l9_1350.w=l9_1347*1000.0;
int l9_1351=int(l9_1350.x);
int l9_1352=int(l9_1350.y);
int l9_1353=int(l9_1350.z);
int l9_1354=int(l9_1350.w);
int l9_1355=(((l9_1351*15299)^(l9_1352*30133))^(l9_1353*17539))^(l9_1354*12113);
int l9_1356=l9_1355;
if (l9_1341==1)
{
int l9_1357=l9_1356;
int l9_1358=l9_1357;
int l9_1359=((l9_1358*((l9_1358*1471343)+101146501))+1559861749)&2147483647;
int l9_1360=l9_1359;
float l9_1361=float(l9_1360)*4.6566129e-10;
float l9_1362=l9_1361;
l9_1349.x=l9_1362;
}
else
{
if (l9_1341==2)
{
int l9_1363=l9_1356;
int l9_1364=l9_1363;
int l9_1365=((l9_1364*((l9_1364*1471343)+101146501))+1559861749)&2147483647;
int l9_1366=l9_1365;
int l9_1367=l9_1363*1399;
int l9_1368=((l9_1367*((l9_1367*1471343)+101146501))+1559861749)&2147483647;
int l9_1369=l9_1368;
int l9_1370=l9_1366;
float l9_1371=float(l9_1370)*4.6566129e-10;
int l9_1372=l9_1369;
float l9_1373=float(l9_1372)*4.6566129e-10;
float2 l9_1374=float2(l9_1371,l9_1373);
l9_1349=float4(l9_1374.x,l9_1374.y,l9_1349.z,l9_1349.w);
}
else
{
if (l9_1341==3)
{
int l9_1375=l9_1356;
int l9_1376=l9_1375;
int l9_1377=((l9_1376*((l9_1376*1471343)+101146501))+1559861749)&2147483647;
int l9_1378=l9_1377;
int l9_1379=l9_1375*1399;
int l9_1380=((l9_1379*((l9_1379*1471343)+101146501))+1559861749)&2147483647;
int l9_1381=l9_1380;
int l9_1382=l9_1375*7177;
int l9_1383=((l9_1382*((l9_1382*1471343)+101146501))+1559861749)&2147483647;
int l9_1384=l9_1383;
int l9_1385=l9_1378;
float l9_1386=float(l9_1385)*4.6566129e-10;
int l9_1387=l9_1381;
float l9_1388=float(l9_1387)*4.6566129e-10;
int l9_1389=l9_1384;
float l9_1390=float(l9_1389)*4.6566129e-10;
float3 l9_1391=float3(l9_1386,l9_1388,l9_1390);
l9_1349=float4(l9_1391.x,l9_1391.y,l9_1391.z,l9_1349.w);
}
else
{
int l9_1392=l9_1356;
int l9_1393=l9_1392;
int l9_1394=((l9_1393*((l9_1393*1471343)+101146501))+1559861749)&2147483647;
int l9_1395=l9_1394;
int l9_1396=l9_1392*1399;
int l9_1397=((l9_1396*((l9_1396*1471343)+101146501))+1559861749)&2147483647;
int l9_1398=l9_1397;
int l9_1399=l9_1392*7177;
int l9_1400=((l9_1399*((l9_1399*1471343)+101146501))+1559861749)&2147483647;
int l9_1401=l9_1400;
int l9_1402=l9_1392*18919;
int l9_1403=((l9_1402*((l9_1402*1471343)+101146501))+1559861749)&2147483647;
int l9_1404=l9_1403;
int l9_1405=l9_1395;
float l9_1406=float(l9_1405)*4.6566129e-10;
int l9_1407=l9_1398;
float l9_1408=float(l9_1407)*4.6566129e-10;
int l9_1409=l9_1401;
float l9_1410=float(l9_1409)*4.6566129e-10;
int l9_1411=l9_1404;
float l9_1412=float(l9_1411)*4.6566129e-10;
float4 l9_1413=float4(l9_1406,l9_1408,l9_1410,l9_1412);
l9_1349=l9_1413;
}
}
}
float4 l9_1414=l9_1349;
float4 l9_1415=l9_1414;
float l9_1416=mix(l9_1338,l9_1339,l9_1415.x);
l9_1337=l9_1416;
l9_1244=l9_1337;
l9_1247=l9_1244;
}
l9_1241=l9_1247;
gParticle.Size=l9_1241;
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
int l9_1417=gl_InstanceIndex;
gParticle.Position=((*sc_set0.UserUniforms).vfxModelMatrix[l9_1417/52500]*float4(gParticle.Position,1.0)).xyz;
int l9_1418=gl_InstanceIndex;
int l9_1419=l9_1418/52500;
gParticle.Velocity=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_1419][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1419][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1419][2].xyz)*gParticle.Velocity;
int l9_1420=gl_InstanceIndex;
int l9_1421=l9_1420/52500;
gParticle.Force=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_1421][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1421][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1421][2].xyz)*gParticle.Force;
int l9_1422=gl_InstanceIndex;
int l9_1423=gl_InstanceIndex;
int l9_1424=gl_InstanceIndex;
gParticle.Size=fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_1422/52500][0].xyz),fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_1423/52500][1].xyz),length((*sc_set0.UserUniforms).vfxModelMatrix[l9_1424/52500][2].xyz)))*gParticle.Size;
int l9_1425=gl_InstanceIndex;
int l9_1426=l9_1425/52500;
gParticle.Matrix=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_1426][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1426][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1426][2].xyz)*gParticle.Matrix;
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
float4 l9_1427=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1428=dot(l9_1427,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1429=l9_1428;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1429;
}
}
float4 l9_1430=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_1430;
return out;
}
float3 Output_N5=float3(0.0);
float3 param_3=(*sc_set0.UserUniforms).velocity;
Output_N5=param_3;
float3 Output_N50=float3(0.0);
Output_N50=Output_N5*float3((*sc_set0.UserUniforms).Port_Input1_N050);
float Output_N7=0.0;
float param_4=1.0;
float param_5=(*sc_set0.UserUniforms).Port_Input1_N007;
float param_6=0.0;
float l9_1432=0.0;
float l9_1433=float((*sc_set0.UserUniforms).isIdle!=0);
l9_1432=l9_1433;
param_4=l9_1432;
float param_7;
if ((param_4*1.0)!=0.0)
{
param_7=param_5;
}
else
{
float3 l9_1434=float3(0.0);
float3 l9_1435=(*sc_set0.UserUniforms).inputPos;
l9_1434=l9_1435;
float3 l9_1436=float3(0.0);
l9_1436=gParticle.Position;
float l9_1437=0.0;
l9_1437=distance(l9_1434,l9_1436);
param_6=l9_1437;
param_7=param_6;
}
Output_N7=param_7;
float ValueOut_N51=0.0;
float param_8=Output_N7;
float param_10=(*sc_set0.UserUniforms).Port_RangeMinA_N051;
float param_11=(*sc_set0.UserUniforms).Port_RangeMaxA_N051;
float param_12=(*sc_set0.UserUniforms).Port_RangeMinB_N051;
float param_13=(*sc_set0.UserUniforms).Port_RangeMaxB_N051;
float param_9=(((param_8-param_10)/((param_11-param_10)+1e-06))*(param_13-param_12))+param_12;
float l9_1438;
if (param_13>param_12)
{
l9_1438=fast::clamp(param_9,param_12,param_13);
}
else
{
l9_1438=fast::clamp(param_9,param_13,param_12);
}
param_9=l9_1438;
ValueOut_N51=param_9;
float Output_N2=0.0;
float l9_1439;
if (ValueOut_N51<=0.0)
{
l9_1439=0.0;
}
else
{
l9_1439=pow(ValueOut_N51,(*sc_set0.UserUniforms).Port_Input1_N002);
}
Output_N2=l9_1439;
float3 Output_N136=float3(0.0);
Output_N136=Output_N50*float3(Output_N2);
gParticle.Force+=Output_N136;
float ValueOut_N44=0.0;
ValueOut_N44=(((Output_N2-(*sc_set0.UserUniforms).Port_RangeMinA_N044)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N044-(*sc_set0.UserUniforms).Port_RangeMinA_N044)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N044-(*sc_set0.UserUniforms).Port_RangeMinB_N044))+(*sc_set0.UserUniforms).Port_RangeMinB_N044;
float Value_N308=0.0;
Value_N308=ValueOut_N44;
float3 Output_N24=float3(0.0);
float3 param_14=(*sc_set0.UserUniforms).inputPos;
Output_N24=param_14;
float3 Value_N309=float3(0.0);
Value_N309=Output_N24;
float3 Value_N310=float3(0.0);
Value_N310=gParticle.Position;
float3 Output_N311=float3(0.0);
Output_N311=Value_N309-Value_N310;
float3 Output_N312=float3(0.0);
float3 param_15=Output_N311;
float l9_1440=dot(param_15,param_15);
float l9_1441;
if (l9_1440>0.0)
{
l9_1441=1.0/sqrt(l9_1440);
}
else
{
l9_1441=0.0;
}
float l9_1442=l9_1441;
float3 param_16=param_15*l9_1442;
Output_N312=param_16;
float3 Output_N313=float3(0.0);
Output_N313=float3(Value_N308)*Output_N312;
gParticle.Force+=Output_N313;
float ValueOut_N151=0.0;
ValueOut_N151=(((ValueOut_N51-(*sc_set0.UserUniforms).Port_RangeMinA_N151)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N151-(*sc_set0.UserUniforms).Port_RangeMinA_N151)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N151-(*sc_set0.UserUniforms).Port_RangeMinB_N151))+(*sc_set0.UserUniforms).Port_RangeMinB_N151;
float3 Value_N71=float3(0.0);
Value_N71=float3(ValueOut_N151);
float3 Value_N73=float3(0.0);
Value_N73=gParticle.Position;
float3 Value_N75=float3(0.0);
Value_N75=(*sc_set0.UserUniforms).Port_Import_N075;
float3 Value_N318=float3(0.0);
Value_N318=(*sc_set0.UserUniforms).Port_Import_N318;
float Time_N319=0.0;
Time_N319=Globals.gTimeElapsedShifted*(*sc_set0.UserUniforms).Port_Multiplier_N319;
float3 Output_N320=float3(0.0);
Output_N320=Value_N318*float3(Time_N319);
float3 Output_N321=float3(0.0);
Output_N321=(Value_N73+Value_N75)+Output_N320;
float ValueOut_N152=0.0;
ValueOut_N152=(((ValueOut_N51-(*sc_set0.UserUniforms).Port_RangeMinA_N152)/(((*sc_set0.UserUniforms).Port_RangeMaxA_N152-(*sc_set0.UserUniforms).Port_RangeMinA_N152)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N152-(*sc_set0.UserUniforms).Port_RangeMinB_N152))+(*sc_set0.UserUniforms).Port_RangeMinB_N152;
float3 Value_N322=float3(0.0);
Value_N322=float3(ValueOut_N152);
float3 Output_N323=float3(0.0);
Output_N323=float3(1.0)/Value_N322;
float3 Output_N324=float3(0.0);
Output_N324=Output_N321*Output_N323;
float2 Output_N325=float2(0.0);
Output_N325=float2(Output_N324.x,Output_N324.y);
float2 Output_N326=float2(0.0);
Output_N326=Output_N325+(*sc_set0.UserUniforms).Port_Input1_N326;
float Noise_N327=0.0;
float2 param_17=Output_N326;
float2 param_18=(*sc_set0.UserUniforms).Port_Scale_N327;
param_17.x=floor(param_17.x*10000.0)*9.9999997e-05;
param_17.y=floor(param_17.y*10000.0)*9.9999997e-05;
param_17*=(param_18*0.5);
float2 l9_1443=param_17;
float param_19=(snoise(l9_1443)*0.5)+0.5;
param_19=floor(param_19*10000.0)*9.9999997e-05;
Noise_N327=param_19;
float2 Output_N328=float2(0.0);
Output_N328=float2(Output_N324.y,Output_N324.z);
float2 Output_N329=float2(0.0);
Output_N329=Output_N328+(*sc_set0.UserUniforms).Port_Input1_N329;
float Noise_N330=0.0;
float2 param_20=Output_N329;
float2 param_21=(*sc_set0.UserUniforms).Port_Scale_N330;
param_20.x=floor(param_20.x*10000.0)*9.9999997e-05;
param_20.y=floor(param_20.y*10000.0)*9.9999997e-05;
param_20*=(param_21*0.5);
float2 l9_1444=param_20;
float param_22=(snoise(l9_1444)*0.5)+0.5;
param_22=floor(param_22*10000.0)*9.9999997e-05;
Noise_N330=param_22;
float2 Output_N331=float2(0.0);
Output_N331=float2(Output_N324.z,Output_N324.x);
float2 Output_N332=float2(0.0);
Output_N332=Output_N331+(*sc_set0.UserUniforms).Port_Input1_N332;
float Noise_N333=0.0;
float2 param_23=Output_N332;
float2 param_24=(*sc_set0.UserUniforms).Port_Scale_N333;
param_23.x=floor(param_23.x*10000.0)*9.9999997e-05;
param_23.y=floor(param_23.y*10000.0)*9.9999997e-05;
param_23*=(param_24*0.5);
float2 l9_1445=param_23;
float param_25=(snoise(l9_1445)*0.5)+0.5;
param_25=floor(param_25*10000.0)*9.9999997e-05;
Noise_N333=param_25;
float3 Value_N334=float3(0.0);
Value_N334.x=Noise_N327;
Value_N334.y=Noise_N330;
Value_N334.z=Noise_N333;
float3 Output_N335=float3(0.0);
Output_N335=Value_N334*(*sc_set0.UserUniforms).Port_Input1_N335;
float3 Output_N336=float3(0.0);
Output_N336=Output_N335-float3(1.0);
float3 Output_N337=float3(0.0);
Output_N337=Value_N71*Output_N336;
gParticle.Force+=Output_N337;
float Value_N267=0.0;
Value_N267=(*sc_set0.UserUniforms).Port_Import_N267;
float Value_N268=0.0;
Value_N268=(*sc_set0.UserUniforms).Port_Import_N268;
float Value_N269=0.0;
Value_N269=(*sc_set0.UserUniforms).Port_Import_N269;
float3 Value_N81=float3(0.0);
Value_N81=gParticle.Velocity;
float3 Output_N264=float3(0.0);
Output_N264=-Value_N81;
float Output_N265=0.0;
Output_N265=length(Value_N81);
float3 Output_N266=float3(0.0);
Output_N266=Output_N264*float3(Output_N265);
float3 Output_N270=float3(0.0);
Output_N270=(((float3(Value_N267)*float3(Value_N268))*float3(Value_N269))*Output_N266)*float3((*sc_set0.UserUniforms).Port_Input4_N270);
float3 Value_N271=float3(0.0);
Value_N271=gParticle.Velocity;
float Value_N82=0.0;
Value_N82=gParticle.Mass;
float3 Output_N83=float3(0.0);
Output_N83=Value_N271*float3(Value_N82);
float3 Output_N84=float3(0.0);
Output_N84=abs(Output_N83);
float Time_N272=0.0;
Time_N272=Globals.gTimeDelta*(*sc_set0.UserUniforms).Port_Multiplier_N272;
float3 Output_N273=float3(0.0);
Output_N273=Output_N84/(float3(Time_N272)+float3(1.234e-06));
float3 Output_N274=float3(0.0);
Output_N274=-Output_N273;
float3 Output_N275=float3(0.0);
Output_N275=fast::clamp(Output_N270,Output_N274,Output_N273);
gParticle.Force+=Output_N275;
float4 Value_N176=float4(0.0);
Value_N176=gParticle.Color;
float Value_N177=0.0;
Value_N177=(*sc_set0.UserUniforms).Port_Import_N177;
float Value_N178=0.0;
Value_N178=(*sc_set0.UserUniforms).Port_Import_N178;
float Value_N183=0.0;
Value_N183=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float Value_N191=0.0;
Value_N191=Value_N183;
float Value_N185=0.0;
Value_N185=(*sc_set0.UserUniforms).Port_Import_N185;
float Value_N186=0.0;
Value_N186=gParticle.Life;
float Output_N187=0.0;
Output_N187=Value_N185/(Value_N186+1.234e-06);
float Value_N180=0.0;
Value_N180=Output_N187;
float Output_N181=0.0;
Output_N181=(*sc_set0.UserUniforms).Port_Input0_N181/(Value_N180+1.234e-06);
float Output_N182=0.0;
Output_N182=Value_N191*Output_N181;
float Output_N227=0.0;
Output_N227=fast::clamp(Output_N182+0.001,(*sc_set0.UserUniforms).Port_Input1_N227+0.001,(*sc_set0.UserUniforms).Port_Input2_N227+0.001)-0.001;
float Output_N232=0.0;
Output_N232=1.0-Value_N191;
float Value_N188=0.0;
Value_N188=(*sc_set0.UserUniforms).Port_Import_N188;
float Output_N189=0.0;
Output_N189=Value_N188/(Value_N186+1.234e-06);
float Value_N184=0.0;
Value_N184=Output_N189;
float Output_N192=0.0;
Output_N192=(*sc_set0.UserUniforms).Port_Input0_N192/(Value_N184+1.234e-06);
float Output_N193=0.0;
Output_N193=Output_N232*Output_N192;
float Output_N236=0.0;
Output_N236=fast::clamp(Output_N193+0.001,(*sc_set0.UserUniforms).Port_Input1_N236+0.001,(*sc_set0.UserUniforms).Port_Input2_N236+0.001)-0.001;
float Output_N194=0.0;
Output_N194=Output_N227*Output_N236;
float Export_N195=0.0;
Export_N195=Output_N194;
float Output_N239=0.0;
Output_N239=mix(Value_N177,Value_N178,Export_N195);
float4 Value_N242=float4(0.0);
Value_N242=float4(Value_N176.xyz.x,Value_N176.xyz.y,Value_N176.xyz.z,Value_N242.w);
Value_N242.w=Output_N239;
gParticle.Color=Value_N242;
float4 Value_N199=float4(0.0);
Value_N199=gParticle.Color;
float4 Output_N200=float4(0.0);
Output_N200=float4(1.0,1.0,1.0,Value_N199.w);
float3 Value_N138=float3(0.0);
Value_N138=gParticle.Velocity;
float Output_N139=0.0;
Output_N139=length(Value_N138);
float ValueOut_N140=0.0;
float param_26=Output_N139;
float param_28=(*sc_set0.UserUniforms).Port_RangeMinA_N140;
float param_29=(*sc_set0.UserUniforms).Port_RangeMaxA_N140;
float param_30=(*sc_set0.UserUniforms).Port_RangeMinB_N140;
float param_31=(*sc_set0.UserUniforms).Port_RangeMaxB_N140;
float param_27=(((param_26-param_28)/((param_29-param_28)+1e-06))*(param_31-param_30))+param_30;
float l9_1446;
if (param_31>param_30)
{
l9_1446=fast::clamp(param_27,param_30,param_31);
}
else
{
l9_1446=fast::clamp(param_27,param_31,param_30);
}
param_27=l9_1446;
ValueOut_N140=param_27;
float Output_N148=0.0;
Output_N148=fast::clamp(ValueOut_N140,(*sc_set0.UserUniforms).Port_Input1_N148,(*sc_set0.UserUniforms).Port_Input2_N148);
float4 Output_N13=float4(0.0);
float4 param_32=(*sc_set0.UserUniforms).colorA;
Output_N13=param_32;
float4 Output_N14=float4(0.0);
float4 param_33=(*sc_set0.UserUniforms).colorB;
Output_N14=param_33;
float4 Output_N16=float4(0.0);
float4 param_34=(*sc_set0.UserUniforms).colorC;
Output_N16=param_34;
float4 Output_N17=float4(0.0);
float4 param_35=(*sc_set0.UserUniforms).colorD;
Output_N17=param_35;
float4 Output_N18=float4(0.0);
float4 param_36=(*sc_set0.UserUniforms).colorE;
Output_N18=param_36;
float4 Value_N137=float4(0.0);
float param_37=Output_N148;
float4 param_38=Output_N13;
float param_39=(*sc_set0.UserUniforms).Port_Position1_N137;
float4 param_40=Output_N14;
float param_41=(*sc_set0.UserUniforms).Port_Position2_N137;
float4 param_42=Output_N16;
float param_43=(*sc_set0.UserUniforms).Port_Position3_N137;
float4 param_44=Output_N17;
float4 param_45=Output_N18;
param_37=fast::clamp(param_37,0.0,1.0);
float4 param_46;
if (param_37<param_39)
{
param_46=mix(param_38,param_40,float4(fast::clamp(param_37/param_39,0.0,1.0)));
}
else
{
if (param_37<param_41)
{
param_46=mix(param_40,param_42,float4(fast::clamp((param_37-param_39)/(param_41-param_39),0.0,1.0)));
}
else
{
if (param_37<param_43)
{
param_46=mix(param_42,param_44,float4(fast::clamp((param_37-param_41)/(param_43-param_41),0.0,1.0)));
}
else
{
param_46=mix(param_44,param_45,float4(fast::clamp((param_37-param_43)/(1.0-param_43),0.0,1.0)));
}
}
}
Value_N137=param_46;
float4 Output_N201=float4(0.0);
Output_N201=Output_N200*Value_N137;
gParticle.Color=Output_N201;
float3x3 param_47=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_47);
float Drift=0.0049999999;
if (gParticle.Dead)
{
float4 param_48=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_48.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1447=param_48;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1448=dot(l9_1447,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1449=l9_1448;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1449;
}
}
float4 l9_1450=float4(param_48.x,-param_48.y,(param_48.z*0.5)+(param_48.w*0.5),param_48.w);
out.gl_Position=l9_1450;
return out;
}
float l9_1451;
if (abs(gParticle.Force.x)<Drift)
{
l9_1451=0.0;
}
else
{
l9_1451=gParticle.Force.x;
}
gParticle.Force.x=l9_1451;
float l9_1452;
if (abs(gParticle.Force.y)<Drift)
{
l9_1452=0.0;
}
else
{
l9_1452=gParticle.Force.y;
}
gParticle.Force.y=l9_1452;
float l9_1453;
if (abs(gParticle.Force.z)<Drift)
{
l9_1453=0.0;
}
else
{
l9_1453=gParticle.Force.z;
}
gParticle.Force.z=l9_1453;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_1454;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_1454=0.0;
}
else
{
l9_1454=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_1454;
float l9_1455;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_1455=0.0;
}
else
{
l9_1455=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_1455;
float l9_1456;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_1456=0.0;
}
else
{
l9_1456=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_1456;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(4.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_1457=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_1457;
int particleRow=512;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_1458;
if (v.texture0.x<0.5)
{
l9_1458=0.0;
}
else
{
l9_1458=QuadSize.x;
}
Vertex.x=l9_1458;
float l9_1459;
if (v.texture0.y<0.5)
{
l9_1459=0.0;
}
else
{
l9_1459=QuadSize.y;
}
Vertex.y=l9_1459;
Vertex+=Offset;
float4 param_49=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_49.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1460=param_49;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1461=dot(l9_1460,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1462=l9_1461;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1462;
}
}
float4 l9_1463=float4(param_49.x,-param_49.y,(param_49.z*0.5)+(param_49.w*0.5),param_49.w);
out.gl_Position=l9_1463;
int l9_1464=gl_InstanceIndex;
out.Interp_Particle_Index=l9_1464;
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
float4 param_50=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_50.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1465=param_50;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1466=dot(l9_1465,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1467=l9_1466;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1467;
}
}
float4 l9_1468=float4(param_50.x,-param_50.y,(param_50.z*0.5)+(param_50.w*0.5),param_50.w);
out.gl_Position=l9_1468;
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
float3 velocity;
float3 inputPos;
float4 colorA;
float4 colorB;
float4 colorC;
float4 colorD;
float4 colorE;
float3 Port_Import_N216;
float Port_Input1_N047;
float3 Port_Min_N048;
float3 Port_Max_N048;
float Port_Import_N052;
float Port_Input1_N054;
float3 Port_Max_N055;
float Port_Import_N058;
float3 Port_Import_N059;
float Port_Input1_N079;
float Port_Input1_N149;
float4 Port_Value_N011;
float Port_Import_N143;
float Port_Import_N144;
float Port_Import_N027;
float Port_Import_N038;
float Port_Input1_N050;
float Port_Input1_N007;
float Port_RangeMinA_N051;
float Port_RangeMaxA_N051;
float Port_RangeMinB_N051;
float Port_RangeMaxB_N051;
float Port_Input1_N002;
float Port_RangeMinA_N044;
float Port_RangeMaxA_N044;
float Port_RangeMinB_N044;
float Port_RangeMaxB_N044;
float Port_Import_N308;
float3 Port_Import_N309;
float Port_RangeMinA_N151;
float Port_RangeMaxA_N151;
float Port_RangeMinB_N151;
float Port_RangeMaxB_N151;
float3 Port_Import_N071;
float3 Port_Import_N075;
float3 Port_Import_N318;
float Port_Multiplier_N319;
float Port_RangeMinA_N152;
float Port_RangeMaxA_N152;
float Port_RangeMinB_N152;
float Port_RangeMaxB_N152;
float3 Port_Import_N322;
float2 Port_Input1_N326;
float2 Port_Scale_N327;
float2 Port_Input1_N329;
float2 Port_Scale_N330;
float2 Port_Input1_N332;
float2 Port_Scale_N333;
float3 Port_Input1_N335;
float Port_Import_N267;
float Port_Import_N268;
float Port_Import_N269;
float Port_Input4_N270;
float Port_Multiplier_N272;
float Port_Import_N177;
float Port_Import_N178;
float Port_Import_N191;
float Port_Input0_N181;
float Port_Import_N185;
float Port_Import_N180;
float Port_Input1_N227;
float Port_Input2_N227;
float Port_Input0_N192;
float Port_Import_N188;
float Port_Import_N184;
float Port_Input1_N236;
float Port_Input2_N236;
float Port_RangeMinA_N140;
float Port_RangeMaxA_N140;
float Port_RangeMinB_N140;
float Port_RangeMaxB_N140;
float Port_Input1_N148;
float Port_Input2_N148;
float Port_Position1_N137;
float Port_Position2_N137;
float Port_Position3_N137;
};
struct sc_Set0
{
texture2d<float> renderTarget0 [[id(1)]];
texture2d<float> renderTarget1 [[id(2)]];
texture2d<float> renderTarget2 [[id(3)]];
texture2d<float> renderTarget3 [[id(4)]];
sampler renderTarget0SmpSC [[id(20)]];
sampler renderTarget1SmpSC [[id(21)]];
sampler renderTarget2SmpSC [[id(22)]];
sampler renderTarget3SmpSC [[id(23)]];
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
float l9_128=15.0;
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
float l9_146=15.0;
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
