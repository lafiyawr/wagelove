#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
//efine SC_DISABLE_FRUSTUM_CULLING 1
#ifdef pauseSpawn
#undef pauseSpawn
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
//ubo int UserUniforms 0:33:7616 {
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
//float3 spawnPosition 7152
//float3 directionPosition 7168
//bool pauseSpawn 7184
//float Port_Input1_N014 7248
//float3 Port_Min_N076 7264
//float3 Port_Max_N076 7280
//float Port_Import_N084 7296
//float Port_Input1_N087 7300
//float3 Port_Max_N088 7312
//float Port_Import_N131 7328
//float3 Port_Import_N132 7344
//float Port_Input1_N158 7360
//float Port_Input1_N162 7364
//float Port_Min_N008 7368
//float Port_Max_N008 7372
//float Port_Import_N116 7408
//float Port_Import_N117 7412
//float Port_Import_N126 7416
//float Port_Import_N127 7420
//float Port_Import_N128 7424
//float Port_Input4_N137 7428
//float Port_Multiplier_N272 7432
//float3 Port_Import_N026 7440
//float3 Port_Import_N029 7456
//float3 Port_Import_N030 7472
//float Port_Multiplier_N031 7488
//float3 Port_Import_N143 7504
//float Port_Input1_N145 7520
//float Port_Input1_N149 7524
//float Port_Min_N020 7528
//float Port_Max_N020 7532
//float Port_Min_N019 7540
//float Port_Max_N019 7544
//float Port_Import_N065 7552
//float Port_Import_N074 7556
//float Port_Input0_N214 7564
//float Port_Import_N185 7568
//float Port_Input1_N227 7576
//float Port_Input2_N227 7580
//float Port_Input0_N009 7584
//float Port_Import_N188 7588
//float Port_Input1_N236 7596
//float Port_Input2_N236 7600
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
float3 spawnPosition;
float3 directionPosition;
int pauseSpawn;
float4 noiseTexSize;
float2 noiseTexDepth;
float3 Port_Import_N216;
float Port_Input1_N014;
float3 Port_Min_N076;
float3 Port_Max_N076;
float Port_Import_N084;
float Port_Input1_N087;
float3 Port_Max_N088;
float Port_Import_N131;
float3 Port_Import_N132;
float Port_Input1_N158;
float Port_Input1_N162;
float Port_Min_N008;
float Port_Max_N008;
float Port_Import_N053;
float3 Port_Import_N054;
float Port_Import_N116;
float Port_Import_N117;
float Port_Import_N126;
float Port_Import_N127;
float Port_Import_N128;
float Port_Input4_N137;
float Port_Multiplier_N272;
float3 Port_Import_N026;
float3 Port_Import_N029;
float3 Port_Import_N030;
float Port_Multiplier_N031;
float3 Port_Import_N143;
float Port_Input1_N145;
float Port_Input1_N149;
float Port_Min_N020;
float Port_Max_N020;
float Port_Import_N034;
float Port_Min_N019;
float Port_Max_N019;
float Port_Import_N047;
float Port_Import_N065;
float Port_Import_N074;
float Port_Import_N191;
float Port_Input0_N214;
float Port_Import_N185;
float Port_Import_N213;
float Port_Input1_N227;
float Port_Input2_N227;
float Port_Input0_N009;
float Port_Import_N188;
float Port_Import_N075;
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
gParticle.CopyId=float(InstanceID/40);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
int l9_0=param/40;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%40;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(40*((param/40)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%40,l9_1/40);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/40.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(40.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/39.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/39.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(39.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*2.0;
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
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+4.0)/2.0)*4.32723);
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
l9_61=!(UserUniforms.vfxBatchEnable[l9_62/40]!=0);
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
float param_32=2.0;
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
float param_35=2.0;
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
float2 param_59=float2(Scalar4,Scalar5);
float param_60=-1.0;
float param_61=1.0;
float2 l9_755=param_59;
float l9_756=param_60;
float l9_757=param_61;
float l9_758=0.99998999;
float2 l9_759=l9_755;
#if (1)
{
l9_759=floor((l9_759*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_760=dot(l9_759,float2(1.0,0.0039215689));
float l9_761=l9_760;
float l9_762=0.0;
float l9_763=l9_758;
float l9_764=l9_756;
float l9_765=l9_757;
float l9_766=l9_764+(((l9_761-l9_762)*(l9_765-l9_764))/(l9_763-l9_762));
float l9_767=l9_766;
float l9_768=l9_767;
gParticle.Quaternion.x=l9_768;
float2 param_62=float2(Scalar6,Scalar7);
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
gParticle.Quaternion.y=l9_782;
float2 param_65=float2(Scalar8,Scalar9);
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
gParticle.Quaternion.z=l9_796;
float2 param_68=float2(Scalar10,Scalar11);
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
gParticle.Quaternion.w=l9_810;
float4 param_71=gParticle.Quaternion;
param_71=normalize(param_71.yzwx);
float l9_811=param_71.x*param_71.x;
float l9_812=param_71.y*param_71.y;
float l9_813=param_71.z*param_71.z;
float l9_814=param_71.x*param_71.z;
float l9_815=param_71.x*param_71.y;
float l9_816=param_71.y*param_71.z;
float l9_817=param_71.w*param_71.x;
float l9_818=param_71.w*param_71.y;
float l9_819=param_71.w*param_71.z;
float3x3 l9_820=float3x3(float3(1.0-(2.0*(l9_812+l9_813)),2.0*(l9_815+l9_819),2.0*(l9_814-l9_818)),float3(2.0*(l9_815-l9_819),1.0-(2.0*(l9_811+l9_813)),2.0*(l9_816+l9_817)),float3(2.0*(l9_814+l9_818),2.0*(l9_816-l9_817),1.0-(2.0*(l9_811+l9_812))));
gParticle.Matrix=l9_820;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_4/40];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float Delay=0.0;
float Warmup=0.0;
gParticle.Age=mod((Globals.gTimeElapsedShifted-gParticle.SpawnOffset)+Warmup,2.0);
float l9_5=Globals.gTimeElapsed;
float l9_6=gParticle.SpawnOffset;
float l9_7=Delay;
float l9_8=Warmup;
bool l9_9=(l9_5-l9_6)<(l9_7-l9_8);
bool l9_10;
if (!l9_9)
{
l9_10=gParticle.Age>2.0;
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
l9_14=mod(((fast::max(Globals.gTimeElapsed,0.1)-gParticle.SpawnOffset)-Delay)+Warmup,2.0)<=Globals.gTimeDelta;
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
l9_15.Seed+=(floor(((((l9_18-l9_15.SpawnOffset)-0.0)+0.0)+4.0)/2.0)*4.32723);
l9_15.Seed=fract(abs(l9_15.Seed));
int2 l9_19=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_19)+float2(1.0))/float2(399.0);
gParticle=l9_15;
float l9_20=6.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_20)))/l9_20)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_20))/l9_20)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=2.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
float3 l9_21=float3(0.0);
float3 l9_22=(*sc_set0.UserUniforms).spawnPosition;
l9_21=l9_22;
float3 l9_23=float3(0.0);
l9_23=l9_21;
float l9_24=0.0;
float l9_25=0.0;
float l9_26=0.0;
float l9_27=0.0;
ssGlobals l9_28=param_1;
float l9_29=0.0;
l9_29=0.0;
float l9_30=0.0;
l9_30=float(l9_29==(*sc_set0.UserUniforms).Port_Input1_N014);
l9_25=l9_30;
float l9_31;
if ((l9_25*1.0)!=0.0)
{
float3 l9_32=float3(0.0);
float3 l9_33=(*sc_set0.UserUniforms).Port_Min_N076;
float3 l9_34=(*sc_set0.UserUniforms).Port_Max_N076;
ssGlobals l9_35=l9_28;
int l9_36=3;
bool l9_37=true;
bool l9_38=true;
bool l9_39=true;
float l9_40=76.0;
ssParticle l9_41=gParticle;
float l9_42=0.0;
float l9_43=l9_35.gTimeElapsed;
float4 l9_44=float4(0.0);
float4 l9_45=float4(0.0);
if (l9_37)
{
l9_45.x=floor(fract(l9_43)*1000.0);
}
if (l9_39)
{
l9_45.y=float(l9_41.Index1D^((l9_41.Index1D*15299)+l9_41.Index1D));
}
if (l9_38)
{
l9_45.z=l9_40;
}
l9_45.w=l9_42*1000.0;
int l9_46=int(l9_45.x);
int l9_47=int(l9_45.y);
int l9_48=int(l9_45.z);
int l9_49=int(l9_45.w);
int l9_50=(((l9_46*15299)^(l9_47*30133))^(l9_48*17539))^(l9_49*12113);
int l9_51=l9_50;
if (l9_36==1)
{
int l9_52=l9_51;
int l9_53=l9_52;
int l9_54=((l9_53*((l9_53*1471343)+101146501))+1559861749)&2147483647;
int l9_55=l9_54;
float l9_56=float(l9_55)*4.6566129e-10;
float l9_57=l9_56;
l9_44.x=l9_57;
}
else
{
if (l9_36==2)
{
int l9_58=l9_51;
int l9_59=l9_58;
int l9_60=((l9_59*((l9_59*1471343)+101146501))+1559861749)&2147483647;
int l9_61=l9_60;
int l9_62=l9_58*1399;
int l9_63=((l9_62*((l9_62*1471343)+101146501))+1559861749)&2147483647;
int l9_64=l9_63;
int l9_65=l9_61;
float l9_66=float(l9_65)*4.6566129e-10;
int l9_67=l9_64;
float l9_68=float(l9_67)*4.6566129e-10;
float2 l9_69=float2(l9_66,l9_68);
l9_44=float4(l9_69.x,l9_69.y,l9_44.z,l9_44.w);
}
else
{
if (l9_36==3)
{
int l9_70=l9_51;
int l9_71=l9_70;
int l9_72=((l9_71*((l9_71*1471343)+101146501))+1559861749)&2147483647;
int l9_73=l9_72;
int l9_74=l9_70*1399;
int l9_75=((l9_74*((l9_74*1471343)+101146501))+1559861749)&2147483647;
int l9_76=l9_75;
int l9_77=l9_70*7177;
int l9_78=((l9_77*((l9_77*1471343)+101146501))+1559861749)&2147483647;
int l9_79=l9_78;
int l9_80=l9_73;
float l9_81=float(l9_80)*4.6566129e-10;
int l9_82=l9_76;
float l9_83=float(l9_82)*4.6566129e-10;
int l9_84=l9_79;
float l9_85=float(l9_84)*4.6566129e-10;
float3 l9_86=float3(l9_81,l9_83,l9_85);
l9_44=float4(l9_86.x,l9_86.y,l9_86.z,l9_44.w);
}
else
{
int l9_87=l9_51;
int l9_88=l9_87;
int l9_89=((l9_88*((l9_88*1471343)+101146501))+1559861749)&2147483647;
int l9_90=l9_89;
int l9_91=l9_87*1399;
int l9_92=((l9_91*((l9_91*1471343)+101146501))+1559861749)&2147483647;
int l9_93=l9_92;
int l9_94=l9_87*7177;
int l9_95=((l9_94*((l9_94*1471343)+101146501))+1559861749)&2147483647;
int l9_96=l9_95;
int l9_97=l9_87*18919;
int l9_98=((l9_97*((l9_97*1471343)+101146501))+1559861749)&2147483647;
int l9_99=l9_98;
int l9_100=l9_90;
float l9_101=float(l9_100)*4.6566129e-10;
int l9_102=l9_93;
float l9_103=float(l9_102)*4.6566129e-10;
int l9_104=l9_96;
float l9_105=float(l9_104)*4.6566129e-10;
int l9_106=l9_99;
float l9_107=float(l9_106)*4.6566129e-10;
float4 l9_108=float4(l9_101,l9_103,l9_105,l9_107);
l9_44=l9_108;
}
}
}
float4 l9_109=l9_44;
float4 l9_110=l9_109;
float3 l9_111=mix(l9_33,l9_34,l9_110.xyz);
l9_32=l9_111;
float l9_112=0.0;
l9_112=length(l9_32);
float3 l9_113=float3(0.0);
l9_113=l9_32/(float3(l9_112)+float3(1.234e-06));
float l9_114=0.0;
l9_114=fast::clamp((*sc_set0.UserUniforms).Port_Import_N084,0.0,1.0);
float l9_115=0.0;
l9_115=1.0-l9_114;
float l9_116=0.0;
float l9_117;
if (l9_115<=0.0)
{
l9_117=0.0;
}
else
{
l9_117=pow(l9_115,(*sc_set0.UserUniforms).Port_Input1_N087);
}
l9_116=l9_117;
float3 l9_118=float3(0.0);
float3 l9_119=float3(l9_116);
float3 l9_120=(*sc_set0.UserUniforms).Port_Max_N088;
ssGlobals l9_121=l9_28;
int l9_122=3;
bool l9_123=true;
bool l9_124=true;
bool l9_125=true;
float l9_126=88.0;
ssParticle l9_127=gParticle;
float l9_128=0.0;
float l9_129=l9_121.gTimeElapsed;
float4 l9_130=float4(0.0);
float4 l9_131=float4(0.0);
if (l9_123)
{
l9_131.x=floor(fract(l9_129)*1000.0);
}
if (l9_125)
{
l9_131.y=float(l9_127.Index1D^((l9_127.Index1D*15299)+l9_127.Index1D));
}
if (l9_124)
{
l9_131.z=l9_126;
}
l9_131.w=l9_128*1000.0;
int l9_132=int(l9_131.x);
int l9_133=int(l9_131.y);
int l9_134=int(l9_131.z);
int l9_135=int(l9_131.w);
int l9_136=(((l9_132*15299)^(l9_133*30133))^(l9_134*17539))^(l9_135*12113);
int l9_137=l9_136;
if (l9_122==1)
{
int l9_138=l9_137;
int l9_139=l9_138;
int l9_140=((l9_139*((l9_139*1471343)+101146501))+1559861749)&2147483647;
int l9_141=l9_140;
float l9_142=float(l9_141)*4.6566129e-10;
float l9_143=l9_142;
l9_130.x=l9_143;
}
else
{
if (l9_122==2)
{
int l9_144=l9_137;
int l9_145=l9_144;
int l9_146=((l9_145*((l9_145*1471343)+101146501))+1559861749)&2147483647;
int l9_147=l9_146;
int l9_148=l9_144*1399;
int l9_149=((l9_148*((l9_148*1471343)+101146501))+1559861749)&2147483647;
int l9_150=l9_149;
int l9_151=l9_147;
float l9_152=float(l9_151)*4.6566129e-10;
int l9_153=l9_150;
float l9_154=float(l9_153)*4.6566129e-10;
float2 l9_155=float2(l9_152,l9_154);
l9_130=float4(l9_155.x,l9_155.y,l9_130.z,l9_130.w);
}
else
{
if (l9_122==3)
{
int l9_156=l9_137;
int l9_157=l9_156;
int l9_158=((l9_157*((l9_157*1471343)+101146501))+1559861749)&2147483647;
int l9_159=l9_158;
int l9_160=l9_156*1399;
int l9_161=((l9_160*((l9_160*1471343)+101146501))+1559861749)&2147483647;
int l9_162=l9_161;
int l9_163=l9_156*7177;
int l9_164=((l9_163*((l9_163*1471343)+101146501))+1559861749)&2147483647;
int l9_165=l9_164;
int l9_166=l9_159;
float l9_167=float(l9_166)*4.6566129e-10;
int l9_168=l9_162;
float l9_169=float(l9_168)*4.6566129e-10;
int l9_170=l9_165;
float l9_171=float(l9_170)*4.6566129e-10;
float3 l9_172=float3(l9_167,l9_169,l9_171);
l9_130=float4(l9_172.x,l9_172.y,l9_172.z,l9_130.w);
}
else
{
int l9_173=l9_137;
int l9_174=l9_173;
int l9_175=((l9_174*((l9_174*1471343)+101146501))+1559861749)&2147483647;
int l9_176=l9_175;
int l9_177=l9_173*1399;
int l9_178=((l9_177*((l9_177*1471343)+101146501))+1559861749)&2147483647;
int l9_179=l9_178;
int l9_180=l9_173*7177;
int l9_181=((l9_180*((l9_180*1471343)+101146501))+1559861749)&2147483647;
int l9_182=l9_181;
int l9_183=l9_173*18919;
int l9_184=((l9_183*((l9_183*1471343)+101146501))+1559861749)&2147483647;
int l9_185=l9_184;
int l9_186=l9_176;
float l9_187=float(l9_186)*4.6566129e-10;
int l9_188=l9_179;
float l9_189=float(l9_188)*4.6566129e-10;
int l9_190=l9_182;
float l9_191=float(l9_190)*4.6566129e-10;
int l9_192=l9_185;
float l9_193=float(l9_192)*4.6566129e-10;
float4 l9_194=float4(l9_187,l9_189,l9_191,l9_193);
l9_130=l9_194;
}
}
}
float4 l9_195=l9_130;
float4 l9_196=l9_195;
float3 l9_197=mix(l9_119,l9_120,l9_196.xyz);
l9_118=l9_197;
float3 l9_198=float3(0.0);
float l9_199;
if (l9_118.x<=0.0)
{
l9_199=0.0;
}
else
{
l9_199=sqrt(l9_118.x);
}
float l9_200=l9_199;
float l9_201;
if (l9_118.y<=0.0)
{
l9_201=0.0;
}
else
{
l9_201=sqrt(l9_118.y);
}
float l9_202=l9_201;
float l9_203;
if (l9_118.z<=0.0)
{
l9_203=0.0;
}
else
{
l9_203=sqrt(l9_118.z);
}
l9_198=float3(l9_200,l9_202,l9_203);
float3 l9_204=float3(0.0);
float l9_205;
if (l9_198.x<=0.0)
{
l9_205=0.0;
}
else
{
l9_205=sqrt(l9_198.x);
}
float l9_206=l9_205;
float l9_207;
if (l9_198.y<=0.0)
{
l9_207=0.0;
}
else
{
l9_207=sqrt(l9_198.y);
}
float l9_208=l9_207;
float l9_209;
if (l9_198.z<=0.0)
{
l9_209=0.0;
}
else
{
l9_209=sqrt(l9_198.z);
}
l9_204=float3(l9_206,l9_208,l9_209);
float l9_210=0.0;
l9_210=(*sc_set0.UserUniforms).Port_Import_N131;
float3 l9_211=float3(0.0);
l9_211=(*sc_set0.UserUniforms).Port_Import_N132;
float3 l9_212=float3(0.0);
l9_212=((l9_113*l9_204)*float3(l9_210))*l9_211;
float l9_213=0.0;
float3 l9_214=l9_212;
float l9_215=l9_214.x;
l9_213=l9_215;
float l9_216=0.0;
l9_216=abs(l9_213);
l9_26=l9_216;
l9_31=l9_26;
}
else
{
float3 l9_217=float3(0.0);
float3 l9_218=(*sc_set0.UserUniforms).Port_Min_N076;
float3 l9_219=(*sc_set0.UserUniforms).Port_Max_N076;
ssGlobals l9_220=l9_28;
int l9_221=3;
bool l9_222=true;
bool l9_223=true;
bool l9_224=true;
float l9_225=76.0;
ssParticle l9_226=gParticle;
float l9_227=0.0;
float l9_228=l9_220.gTimeElapsed;
float4 l9_229=float4(0.0);
float4 l9_230=float4(0.0);
if (l9_222)
{
l9_230.x=floor(fract(l9_228)*1000.0);
}
if (l9_224)
{
l9_230.y=float(l9_226.Index1D^((l9_226.Index1D*15299)+l9_226.Index1D));
}
if (l9_223)
{
l9_230.z=l9_225;
}
l9_230.w=l9_227*1000.0;
int l9_231=int(l9_230.x);
int l9_232=int(l9_230.y);
int l9_233=int(l9_230.z);
int l9_234=int(l9_230.w);
int l9_235=(((l9_231*15299)^(l9_232*30133))^(l9_233*17539))^(l9_234*12113);
int l9_236=l9_235;
if (l9_221==1)
{
int l9_237=l9_236;
int l9_238=l9_237;
int l9_239=((l9_238*((l9_238*1471343)+101146501))+1559861749)&2147483647;
int l9_240=l9_239;
float l9_241=float(l9_240)*4.6566129e-10;
float l9_242=l9_241;
l9_229.x=l9_242;
}
else
{
if (l9_221==2)
{
int l9_243=l9_236;
int l9_244=l9_243;
int l9_245=((l9_244*((l9_244*1471343)+101146501))+1559861749)&2147483647;
int l9_246=l9_245;
int l9_247=l9_243*1399;
int l9_248=((l9_247*((l9_247*1471343)+101146501))+1559861749)&2147483647;
int l9_249=l9_248;
int l9_250=l9_246;
float l9_251=float(l9_250)*4.6566129e-10;
int l9_252=l9_249;
float l9_253=float(l9_252)*4.6566129e-10;
float2 l9_254=float2(l9_251,l9_253);
l9_229=float4(l9_254.x,l9_254.y,l9_229.z,l9_229.w);
}
else
{
if (l9_221==3)
{
int l9_255=l9_236;
int l9_256=l9_255;
int l9_257=((l9_256*((l9_256*1471343)+101146501))+1559861749)&2147483647;
int l9_258=l9_257;
int l9_259=l9_255*1399;
int l9_260=((l9_259*((l9_259*1471343)+101146501))+1559861749)&2147483647;
int l9_261=l9_260;
int l9_262=l9_255*7177;
int l9_263=((l9_262*((l9_262*1471343)+101146501))+1559861749)&2147483647;
int l9_264=l9_263;
int l9_265=l9_258;
float l9_266=float(l9_265)*4.6566129e-10;
int l9_267=l9_261;
float l9_268=float(l9_267)*4.6566129e-10;
int l9_269=l9_264;
float l9_270=float(l9_269)*4.6566129e-10;
float3 l9_271=float3(l9_266,l9_268,l9_270);
l9_229=float4(l9_271.x,l9_271.y,l9_271.z,l9_229.w);
}
else
{
int l9_272=l9_236;
int l9_273=l9_272;
int l9_274=((l9_273*((l9_273*1471343)+101146501))+1559861749)&2147483647;
int l9_275=l9_274;
int l9_276=l9_272*1399;
int l9_277=((l9_276*((l9_276*1471343)+101146501))+1559861749)&2147483647;
int l9_278=l9_277;
int l9_279=l9_272*7177;
int l9_280=((l9_279*((l9_279*1471343)+101146501))+1559861749)&2147483647;
int l9_281=l9_280;
int l9_282=l9_272*18919;
int l9_283=((l9_282*((l9_282*1471343)+101146501))+1559861749)&2147483647;
int l9_284=l9_283;
int l9_285=l9_275;
float l9_286=float(l9_285)*4.6566129e-10;
int l9_287=l9_278;
float l9_288=float(l9_287)*4.6566129e-10;
int l9_289=l9_281;
float l9_290=float(l9_289)*4.6566129e-10;
int l9_291=l9_284;
float l9_292=float(l9_291)*4.6566129e-10;
float4 l9_293=float4(l9_286,l9_288,l9_290,l9_292);
l9_229=l9_293;
}
}
}
float4 l9_294=l9_229;
float4 l9_295=l9_294;
float3 l9_296=mix(l9_218,l9_219,l9_295.xyz);
l9_217=l9_296;
float l9_297=0.0;
l9_297=length(l9_217);
float3 l9_298=float3(0.0);
l9_298=l9_217/(float3(l9_297)+float3(1.234e-06));
float l9_299=0.0;
l9_299=fast::clamp((*sc_set0.UserUniforms).Port_Import_N084,0.0,1.0);
float l9_300=0.0;
l9_300=1.0-l9_299;
float l9_301=0.0;
float l9_302;
if (l9_300<=0.0)
{
l9_302=0.0;
}
else
{
l9_302=pow(l9_300,(*sc_set0.UserUniforms).Port_Input1_N087);
}
l9_301=l9_302;
float3 l9_303=float3(0.0);
float3 l9_304=float3(l9_301);
float3 l9_305=(*sc_set0.UserUniforms).Port_Max_N088;
ssGlobals l9_306=l9_28;
int l9_307=3;
bool l9_308=true;
bool l9_309=true;
bool l9_310=true;
float l9_311=88.0;
ssParticle l9_312=gParticle;
float l9_313=0.0;
float l9_314=l9_306.gTimeElapsed;
float4 l9_315=float4(0.0);
float4 l9_316=float4(0.0);
if (l9_308)
{
l9_316.x=floor(fract(l9_314)*1000.0);
}
if (l9_310)
{
l9_316.y=float(l9_312.Index1D^((l9_312.Index1D*15299)+l9_312.Index1D));
}
if (l9_309)
{
l9_316.z=l9_311;
}
l9_316.w=l9_313*1000.0;
int l9_317=int(l9_316.x);
int l9_318=int(l9_316.y);
int l9_319=int(l9_316.z);
int l9_320=int(l9_316.w);
int l9_321=(((l9_317*15299)^(l9_318*30133))^(l9_319*17539))^(l9_320*12113);
int l9_322=l9_321;
if (l9_307==1)
{
int l9_323=l9_322;
int l9_324=l9_323;
int l9_325=((l9_324*((l9_324*1471343)+101146501))+1559861749)&2147483647;
int l9_326=l9_325;
float l9_327=float(l9_326)*4.6566129e-10;
float l9_328=l9_327;
l9_315.x=l9_328;
}
else
{
if (l9_307==2)
{
int l9_329=l9_322;
int l9_330=l9_329;
int l9_331=((l9_330*((l9_330*1471343)+101146501))+1559861749)&2147483647;
int l9_332=l9_331;
int l9_333=l9_329*1399;
int l9_334=((l9_333*((l9_333*1471343)+101146501))+1559861749)&2147483647;
int l9_335=l9_334;
int l9_336=l9_332;
float l9_337=float(l9_336)*4.6566129e-10;
int l9_338=l9_335;
float l9_339=float(l9_338)*4.6566129e-10;
float2 l9_340=float2(l9_337,l9_339);
l9_315=float4(l9_340.x,l9_340.y,l9_315.z,l9_315.w);
}
else
{
if (l9_307==3)
{
int l9_341=l9_322;
int l9_342=l9_341;
int l9_343=((l9_342*((l9_342*1471343)+101146501))+1559861749)&2147483647;
int l9_344=l9_343;
int l9_345=l9_341*1399;
int l9_346=((l9_345*((l9_345*1471343)+101146501))+1559861749)&2147483647;
int l9_347=l9_346;
int l9_348=l9_341*7177;
int l9_349=((l9_348*((l9_348*1471343)+101146501))+1559861749)&2147483647;
int l9_350=l9_349;
int l9_351=l9_344;
float l9_352=float(l9_351)*4.6566129e-10;
int l9_353=l9_347;
float l9_354=float(l9_353)*4.6566129e-10;
int l9_355=l9_350;
float l9_356=float(l9_355)*4.6566129e-10;
float3 l9_357=float3(l9_352,l9_354,l9_356);
l9_315=float4(l9_357.x,l9_357.y,l9_357.z,l9_315.w);
}
else
{
int l9_358=l9_322;
int l9_359=l9_358;
int l9_360=((l9_359*((l9_359*1471343)+101146501))+1559861749)&2147483647;
int l9_361=l9_360;
int l9_362=l9_358*1399;
int l9_363=((l9_362*((l9_362*1471343)+101146501))+1559861749)&2147483647;
int l9_364=l9_363;
int l9_365=l9_358*7177;
int l9_366=((l9_365*((l9_365*1471343)+101146501))+1559861749)&2147483647;
int l9_367=l9_366;
int l9_368=l9_358*18919;
int l9_369=((l9_368*((l9_368*1471343)+101146501))+1559861749)&2147483647;
int l9_370=l9_369;
int l9_371=l9_361;
float l9_372=float(l9_371)*4.6566129e-10;
int l9_373=l9_364;
float l9_374=float(l9_373)*4.6566129e-10;
int l9_375=l9_367;
float l9_376=float(l9_375)*4.6566129e-10;
int l9_377=l9_370;
float l9_378=float(l9_377)*4.6566129e-10;
float4 l9_379=float4(l9_372,l9_374,l9_376,l9_378);
l9_315=l9_379;
}
}
}
float4 l9_380=l9_315;
float4 l9_381=l9_380;
float3 l9_382=mix(l9_304,l9_305,l9_381.xyz);
l9_303=l9_382;
float3 l9_383=float3(0.0);
float l9_384;
if (l9_303.x<=0.0)
{
l9_384=0.0;
}
else
{
l9_384=sqrt(l9_303.x);
}
float l9_385=l9_384;
float l9_386;
if (l9_303.y<=0.0)
{
l9_386=0.0;
}
else
{
l9_386=sqrt(l9_303.y);
}
float l9_387=l9_386;
float l9_388;
if (l9_303.z<=0.0)
{
l9_388=0.0;
}
else
{
l9_388=sqrt(l9_303.z);
}
l9_383=float3(l9_385,l9_387,l9_388);
float3 l9_389=float3(0.0);
float l9_390;
if (l9_383.x<=0.0)
{
l9_390=0.0;
}
else
{
l9_390=sqrt(l9_383.x);
}
float l9_391=l9_390;
float l9_392;
if (l9_383.y<=0.0)
{
l9_392=0.0;
}
else
{
l9_392=sqrt(l9_383.y);
}
float l9_393=l9_392;
float l9_394;
if (l9_383.z<=0.0)
{
l9_394=0.0;
}
else
{
l9_394=sqrt(l9_383.z);
}
l9_389=float3(l9_391,l9_393,l9_394);
float l9_395=0.0;
l9_395=(*sc_set0.UserUniforms).Port_Import_N131;
float3 l9_396=float3(0.0);
l9_396=(*sc_set0.UserUniforms).Port_Import_N132;
float3 l9_397=float3(0.0);
l9_397=((l9_298*l9_389)*float3(l9_395))*l9_396;
float l9_398=0.0;
float3 l9_399=l9_397;
float l9_400=l9_399.x;
l9_398=l9_400;
l9_27=l9_398;
l9_31=l9_27;
}
l9_24=l9_31;
float l9_401=0.0;
float l9_402=0.0;
float l9_403=0.0;
float l9_404=0.0;
ssGlobals l9_405=param_1;
float l9_406=0.0;
l9_406=0.0;
float l9_407=0.0;
l9_407=float(l9_406==(*sc_set0.UserUniforms).Port_Input1_N158);
l9_402=l9_407;
float l9_408;
if ((l9_402*1.0)!=0.0)
{
float3 l9_409=float3(0.0);
float3 l9_410=(*sc_set0.UserUniforms).Port_Min_N076;
float3 l9_411=(*sc_set0.UserUniforms).Port_Max_N076;
ssGlobals l9_412=l9_405;
int l9_413=3;
bool l9_414=true;
bool l9_415=true;
bool l9_416=true;
float l9_417=76.0;
ssParticle l9_418=gParticle;
float l9_419=0.0;
float l9_420=l9_412.gTimeElapsed;
float4 l9_421=float4(0.0);
float4 l9_422=float4(0.0);
if (l9_414)
{
l9_422.x=floor(fract(l9_420)*1000.0);
}
if (l9_416)
{
l9_422.y=float(l9_418.Index1D^((l9_418.Index1D*15299)+l9_418.Index1D));
}
if (l9_415)
{
l9_422.z=l9_417;
}
l9_422.w=l9_419*1000.0;
int l9_423=int(l9_422.x);
int l9_424=int(l9_422.y);
int l9_425=int(l9_422.z);
int l9_426=int(l9_422.w);
int l9_427=(((l9_423*15299)^(l9_424*30133))^(l9_425*17539))^(l9_426*12113);
int l9_428=l9_427;
if (l9_413==1)
{
int l9_429=l9_428;
int l9_430=l9_429;
int l9_431=((l9_430*((l9_430*1471343)+101146501))+1559861749)&2147483647;
int l9_432=l9_431;
float l9_433=float(l9_432)*4.6566129e-10;
float l9_434=l9_433;
l9_421.x=l9_434;
}
else
{
if (l9_413==2)
{
int l9_435=l9_428;
int l9_436=l9_435;
int l9_437=((l9_436*((l9_436*1471343)+101146501))+1559861749)&2147483647;
int l9_438=l9_437;
int l9_439=l9_435*1399;
int l9_440=((l9_439*((l9_439*1471343)+101146501))+1559861749)&2147483647;
int l9_441=l9_440;
int l9_442=l9_438;
float l9_443=float(l9_442)*4.6566129e-10;
int l9_444=l9_441;
float l9_445=float(l9_444)*4.6566129e-10;
float2 l9_446=float2(l9_443,l9_445);
l9_421=float4(l9_446.x,l9_446.y,l9_421.z,l9_421.w);
}
else
{
if (l9_413==3)
{
int l9_447=l9_428;
int l9_448=l9_447;
int l9_449=((l9_448*((l9_448*1471343)+101146501))+1559861749)&2147483647;
int l9_450=l9_449;
int l9_451=l9_447*1399;
int l9_452=((l9_451*((l9_451*1471343)+101146501))+1559861749)&2147483647;
int l9_453=l9_452;
int l9_454=l9_447*7177;
int l9_455=((l9_454*((l9_454*1471343)+101146501))+1559861749)&2147483647;
int l9_456=l9_455;
int l9_457=l9_450;
float l9_458=float(l9_457)*4.6566129e-10;
int l9_459=l9_453;
float l9_460=float(l9_459)*4.6566129e-10;
int l9_461=l9_456;
float l9_462=float(l9_461)*4.6566129e-10;
float3 l9_463=float3(l9_458,l9_460,l9_462);
l9_421=float4(l9_463.x,l9_463.y,l9_463.z,l9_421.w);
}
else
{
int l9_464=l9_428;
int l9_465=l9_464;
int l9_466=((l9_465*((l9_465*1471343)+101146501))+1559861749)&2147483647;
int l9_467=l9_466;
int l9_468=l9_464*1399;
int l9_469=((l9_468*((l9_468*1471343)+101146501))+1559861749)&2147483647;
int l9_470=l9_469;
int l9_471=l9_464*7177;
int l9_472=((l9_471*((l9_471*1471343)+101146501))+1559861749)&2147483647;
int l9_473=l9_472;
int l9_474=l9_464*18919;
int l9_475=((l9_474*((l9_474*1471343)+101146501))+1559861749)&2147483647;
int l9_476=l9_475;
int l9_477=l9_467;
float l9_478=float(l9_477)*4.6566129e-10;
int l9_479=l9_470;
float l9_480=float(l9_479)*4.6566129e-10;
int l9_481=l9_473;
float l9_482=float(l9_481)*4.6566129e-10;
int l9_483=l9_476;
float l9_484=float(l9_483)*4.6566129e-10;
float4 l9_485=float4(l9_478,l9_480,l9_482,l9_484);
l9_421=l9_485;
}
}
}
float4 l9_486=l9_421;
float4 l9_487=l9_486;
float3 l9_488=mix(l9_410,l9_411,l9_487.xyz);
l9_409=l9_488;
float l9_489=0.0;
l9_489=length(l9_409);
float3 l9_490=float3(0.0);
l9_490=l9_409/(float3(l9_489)+float3(1.234e-06));
float l9_491=0.0;
l9_491=fast::clamp((*sc_set0.UserUniforms).Port_Import_N084,0.0,1.0);
float l9_492=0.0;
l9_492=1.0-l9_491;
float l9_493=0.0;
float l9_494;
if (l9_492<=0.0)
{
l9_494=0.0;
}
else
{
l9_494=pow(l9_492,(*sc_set0.UserUniforms).Port_Input1_N087);
}
l9_493=l9_494;
float3 l9_495=float3(0.0);
float3 l9_496=float3(l9_493);
float3 l9_497=(*sc_set0.UserUniforms).Port_Max_N088;
ssGlobals l9_498=l9_405;
int l9_499=3;
bool l9_500=true;
bool l9_501=true;
bool l9_502=true;
float l9_503=88.0;
ssParticle l9_504=gParticle;
float l9_505=0.0;
float l9_506=l9_498.gTimeElapsed;
float4 l9_507=float4(0.0);
float4 l9_508=float4(0.0);
if (l9_500)
{
l9_508.x=floor(fract(l9_506)*1000.0);
}
if (l9_502)
{
l9_508.y=float(l9_504.Index1D^((l9_504.Index1D*15299)+l9_504.Index1D));
}
if (l9_501)
{
l9_508.z=l9_503;
}
l9_508.w=l9_505*1000.0;
int l9_509=int(l9_508.x);
int l9_510=int(l9_508.y);
int l9_511=int(l9_508.z);
int l9_512=int(l9_508.w);
int l9_513=(((l9_509*15299)^(l9_510*30133))^(l9_511*17539))^(l9_512*12113);
int l9_514=l9_513;
if (l9_499==1)
{
int l9_515=l9_514;
int l9_516=l9_515;
int l9_517=((l9_516*((l9_516*1471343)+101146501))+1559861749)&2147483647;
int l9_518=l9_517;
float l9_519=float(l9_518)*4.6566129e-10;
float l9_520=l9_519;
l9_507.x=l9_520;
}
else
{
if (l9_499==2)
{
int l9_521=l9_514;
int l9_522=l9_521;
int l9_523=((l9_522*((l9_522*1471343)+101146501))+1559861749)&2147483647;
int l9_524=l9_523;
int l9_525=l9_521*1399;
int l9_526=((l9_525*((l9_525*1471343)+101146501))+1559861749)&2147483647;
int l9_527=l9_526;
int l9_528=l9_524;
float l9_529=float(l9_528)*4.6566129e-10;
int l9_530=l9_527;
float l9_531=float(l9_530)*4.6566129e-10;
float2 l9_532=float2(l9_529,l9_531);
l9_507=float4(l9_532.x,l9_532.y,l9_507.z,l9_507.w);
}
else
{
if (l9_499==3)
{
int l9_533=l9_514;
int l9_534=l9_533;
int l9_535=((l9_534*((l9_534*1471343)+101146501))+1559861749)&2147483647;
int l9_536=l9_535;
int l9_537=l9_533*1399;
int l9_538=((l9_537*((l9_537*1471343)+101146501))+1559861749)&2147483647;
int l9_539=l9_538;
int l9_540=l9_533*7177;
int l9_541=((l9_540*((l9_540*1471343)+101146501))+1559861749)&2147483647;
int l9_542=l9_541;
int l9_543=l9_536;
float l9_544=float(l9_543)*4.6566129e-10;
int l9_545=l9_539;
float l9_546=float(l9_545)*4.6566129e-10;
int l9_547=l9_542;
float l9_548=float(l9_547)*4.6566129e-10;
float3 l9_549=float3(l9_544,l9_546,l9_548);
l9_507=float4(l9_549.x,l9_549.y,l9_549.z,l9_507.w);
}
else
{
int l9_550=l9_514;
int l9_551=l9_550;
int l9_552=((l9_551*((l9_551*1471343)+101146501))+1559861749)&2147483647;
int l9_553=l9_552;
int l9_554=l9_550*1399;
int l9_555=((l9_554*((l9_554*1471343)+101146501))+1559861749)&2147483647;
int l9_556=l9_555;
int l9_557=l9_550*7177;
int l9_558=((l9_557*((l9_557*1471343)+101146501))+1559861749)&2147483647;
int l9_559=l9_558;
int l9_560=l9_550*18919;
int l9_561=((l9_560*((l9_560*1471343)+101146501))+1559861749)&2147483647;
int l9_562=l9_561;
int l9_563=l9_553;
float l9_564=float(l9_563)*4.6566129e-10;
int l9_565=l9_556;
float l9_566=float(l9_565)*4.6566129e-10;
int l9_567=l9_559;
float l9_568=float(l9_567)*4.6566129e-10;
int l9_569=l9_562;
float l9_570=float(l9_569)*4.6566129e-10;
float4 l9_571=float4(l9_564,l9_566,l9_568,l9_570);
l9_507=l9_571;
}
}
}
float4 l9_572=l9_507;
float4 l9_573=l9_572;
float3 l9_574=mix(l9_496,l9_497,l9_573.xyz);
l9_495=l9_574;
float3 l9_575=float3(0.0);
float l9_576;
if (l9_495.x<=0.0)
{
l9_576=0.0;
}
else
{
l9_576=sqrt(l9_495.x);
}
float l9_577=l9_576;
float l9_578;
if (l9_495.y<=0.0)
{
l9_578=0.0;
}
else
{
l9_578=sqrt(l9_495.y);
}
float l9_579=l9_578;
float l9_580;
if (l9_495.z<=0.0)
{
l9_580=0.0;
}
else
{
l9_580=sqrt(l9_495.z);
}
l9_575=float3(l9_577,l9_579,l9_580);
float3 l9_581=float3(0.0);
float l9_582;
if (l9_575.x<=0.0)
{
l9_582=0.0;
}
else
{
l9_582=sqrt(l9_575.x);
}
float l9_583=l9_582;
float l9_584;
if (l9_575.y<=0.0)
{
l9_584=0.0;
}
else
{
l9_584=sqrt(l9_575.y);
}
float l9_585=l9_584;
float l9_586;
if (l9_575.z<=0.0)
{
l9_586=0.0;
}
else
{
l9_586=sqrt(l9_575.z);
}
l9_581=float3(l9_583,l9_585,l9_586);
float l9_587=0.0;
l9_587=(*sc_set0.UserUniforms).Port_Import_N131;
float3 l9_588=float3(0.0);
l9_588=(*sc_set0.UserUniforms).Port_Import_N132;
float3 l9_589=float3(0.0);
l9_589=((l9_490*l9_581)*float3(l9_587))*l9_588;
float l9_590=0.0;
float3 l9_591=l9_589;
float l9_592=l9_591.y;
l9_590=l9_592;
float l9_593=0.0;
l9_593=abs(l9_590);
l9_403=l9_593;
l9_408=l9_403;
}
else
{
float3 l9_594=float3(0.0);
float3 l9_595=(*sc_set0.UserUniforms).Port_Min_N076;
float3 l9_596=(*sc_set0.UserUniforms).Port_Max_N076;
ssGlobals l9_597=l9_405;
int l9_598=3;
bool l9_599=true;
bool l9_600=true;
bool l9_601=true;
float l9_602=76.0;
ssParticle l9_603=gParticle;
float l9_604=0.0;
float l9_605=l9_597.gTimeElapsed;
float4 l9_606=float4(0.0);
float4 l9_607=float4(0.0);
if (l9_599)
{
l9_607.x=floor(fract(l9_605)*1000.0);
}
if (l9_601)
{
l9_607.y=float(l9_603.Index1D^((l9_603.Index1D*15299)+l9_603.Index1D));
}
if (l9_600)
{
l9_607.z=l9_602;
}
l9_607.w=l9_604*1000.0;
int l9_608=int(l9_607.x);
int l9_609=int(l9_607.y);
int l9_610=int(l9_607.z);
int l9_611=int(l9_607.w);
int l9_612=(((l9_608*15299)^(l9_609*30133))^(l9_610*17539))^(l9_611*12113);
int l9_613=l9_612;
if (l9_598==1)
{
int l9_614=l9_613;
int l9_615=l9_614;
int l9_616=((l9_615*((l9_615*1471343)+101146501))+1559861749)&2147483647;
int l9_617=l9_616;
float l9_618=float(l9_617)*4.6566129e-10;
float l9_619=l9_618;
l9_606.x=l9_619;
}
else
{
if (l9_598==2)
{
int l9_620=l9_613;
int l9_621=l9_620;
int l9_622=((l9_621*((l9_621*1471343)+101146501))+1559861749)&2147483647;
int l9_623=l9_622;
int l9_624=l9_620*1399;
int l9_625=((l9_624*((l9_624*1471343)+101146501))+1559861749)&2147483647;
int l9_626=l9_625;
int l9_627=l9_623;
float l9_628=float(l9_627)*4.6566129e-10;
int l9_629=l9_626;
float l9_630=float(l9_629)*4.6566129e-10;
float2 l9_631=float2(l9_628,l9_630);
l9_606=float4(l9_631.x,l9_631.y,l9_606.z,l9_606.w);
}
else
{
if (l9_598==3)
{
int l9_632=l9_613;
int l9_633=l9_632;
int l9_634=((l9_633*((l9_633*1471343)+101146501))+1559861749)&2147483647;
int l9_635=l9_634;
int l9_636=l9_632*1399;
int l9_637=((l9_636*((l9_636*1471343)+101146501))+1559861749)&2147483647;
int l9_638=l9_637;
int l9_639=l9_632*7177;
int l9_640=((l9_639*((l9_639*1471343)+101146501))+1559861749)&2147483647;
int l9_641=l9_640;
int l9_642=l9_635;
float l9_643=float(l9_642)*4.6566129e-10;
int l9_644=l9_638;
float l9_645=float(l9_644)*4.6566129e-10;
int l9_646=l9_641;
float l9_647=float(l9_646)*4.6566129e-10;
float3 l9_648=float3(l9_643,l9_645,l9_647);
l9_606=float4(l9_648.x,l9_648.y,l9_648.z,l9_606.w);
}
else
{
int l9_649=l9_613;
int l9_650=l9_649;
int l9_651=((l9_650*((l9_650*1471343)+101146501))+1559861749)&2147483647;
int l9_652=l9_651;
int l9_653=l9_649*1399;
int l9_654=((l9_653*((l9_653*1471343)+101146501))+1559861749)&2147483647;
int l9_655=l9_654;
int l9_656=l9_649*7177;
int l9_657=((l9_656*((l9_656*1471343)+101146501))+1559861749)&2147483647;
int l9_658=l9_657;
int l9_659=l9_649*18919;
int l9_660=((l9_659*((l9_659*1471343)+101146501))+1559861749)&2147483647;
int l9_661=l9_660;
int l9_662=l9_652;
float l9_663=float(l9_662)*4.6566129e-10;
int l9_664=l9_655;
float l9_665=float(l9_664)*4.6566129e-10;
int l9_666=l9_658;
float l9_667=float(l9_666)*4.6566129e-10;
int l9_668=l9_661;
float l9_669=float(l9_668)*4.6566129e-10;
float4 l9_670=float4(l9_663,l9_665,l9_667,l9_669);
l9_606=l9_670;
}
}
}
float4 l9_671=l9_606;
float4 l9_672=l9_671;
float3 l9_673=mix(l9_595,l9_596,l9_672.xyz);
l9_594=l9_673;
float l9_674=0.0;
l9_674=length(l9_594);
float3 l9_675=float3(0.0);
l9_675=l9_594/(float3(l9_674)+float3(1.234e-06));
float l9_676=0.0;
l9_676=fast::clamp((*sc_set0.UserUniforms).Port_Import_N084,0.0,1.0);
float l9_677=0.0;
l9_677=1.0-l9_676;
float l9_678=0.0;
float l9_679;
if (l9_677<=0.0)
{
l9_679=0.0;
}
else
{
l9_679=pow(l9_677,(*sc_set0.UserUniforms).Port_Input1_N087);
}
l9_678=l9_679;
float3 l9_680=float3(0.0);
float3 l9_681=float3(l9_678);
float3 l9_682=(*sc_set0.UserUniforms).Port_Max_N088;
ssGlobals l9_683=l9_405;
int l9_684=3;
bool l9_685=true;
bool l9_686=true;
bool l9_687=true;
float l9_688=88.0;
ssParticle l9_689=gParticle;
float l9_690=0.0;
float l9_691=l9_683.gTimeElapsed;
float4 l9_692=float4(0.0);
float4 l9_693=float4(0.0);
if (l9_685)
{
l9_693.x=floor(fract(l9_691)*1000.0);
}
if (l9_687)
{
l9_693.y=float(l9_689.Index1D^((l9_689.Index1D*15299)+l9_689.Index1D));
}
if (l9_686)
{
l9_693.z=l9_688;
}
l9_693.w=l9_690*1000.0;
int l9_694=int(l9_693.x);
int l9_695=int(l9_693.y);
int l9_696=int(l9_693.z);
int l9_697=int(l9_693.w);
int l9_698=(((l9_694*15299)^(l9_695*30133))^(l9_696*17539))^(l9_697*12113);
int l9_699=l9_698;
if (l9_684==1)
{
int l9_700=l9_699;
int l9_701=l9_700;
int l9_702=((l9_701*((l9_701*1471343)+101146501))+1559861749)&2147483647;
int l9_703=l9_702;
float l9_704=float(l9_703)*4.6566129e-10;
float l9_705=l9_704;
l9_692.x=l9_705;
}
else
{
if (l9_684==2)
{
int l9_706=l9_699;
int l9_707=l9_706;
int l9_708=((l9_707*((l9_707*1471343)+101146501))+1559861749)&2147483647;
int l9_709=l9_708;
int l9_710=l9_706*1399;
int l9_711=((l9_710*((l9_710*1471343)+101146501))+1559861749)&2147483647;
int l9_712=l9_711;
int l9_713=l9_709;
float l9_714=float(l9_713)*4.6566129e-10;
int l9_715=l9_712;
float l9_716=float(l9_715)*4.6566129e-10;
float2 l9_717=float2(l9_714,l9_716);
l9_692=float4(l9_717.x,l9_717.y,l9_692.z,l9_692.w);
}
else
{
if (l9_684==3)
{
int l9_718=l9_699;
int l9_719=l9_718;
int l9_720=((l9_719*((l9_719*1471343)+101146501))+1559861749)&2147483647;
int l9_721=l9_720;
int l9_722=l9_718*1399;
int l9_723=((l9_722*((l9_722*1471343)+101146501))+1559861749)&2147483647;
int l9_724=l9_723;
int l9_725=l9_718*7177;
int l9_726=((l9_725*((l9_725*1471343)+101146501))+1559861749)&2147483647;
int l9_727=l9_726;
int l9_728=l9_721;
float l9_729=float(l9_728)*4.6566129e-10;
int l9_730=l9_724;
float l9_731=float(l9_730)*4.6566129e-10;
int l9_732=l9_727;
float l9_733=float(l9_732)*4.6566129e-10;
float3 l9_734=float3(l9_729,l9_731,l9_733);
l9_692=float4(l9_734.x,l9_734.y,l9_734.z,l9_692.w);
}
else
{
int l9_735=l9_699;
int l9_736=l9_735;
int l9_737=((l9_736*((l9_736*1471343)+101146501))+1559861749)&2147483647;
int l9_738=l9_737;
int l9_739=l9_735*1399;
int l9_740=((l9_739*((l9_739*1471343)+101146501))+1559861749)&2147483647;
int l9_741=l9_740;
int l9_742=l9_735*7177;
int l9_743=((l9_742*((l9_742*1471343)+101146501))+1559861749)&2147483647;
int l9_744=l9_743;
int l9_745=l9_735*18919;
int l9_746=((l9_745*((l9_745*1471343)+101146501))+1559861749)&2147483647;
int l9_747=l9_746;
int l9_748=l9_738;
float l9_749=float(l9_748)*4.6566129e-10;
int l9_750=l9_741;
float l9_751=float(l9_750)*4.6566129e-10;
int l9_752=l9_744;
float l9_753=float(l9_752)*4.6566129e-10;
int l9_754=l9_747;
float l9_755=float(l9_754)*4.6566129e-10;
float4 l9_756=float4(l9_749,l9_751,l9_753,l9_755);
l9_692=l9_756;
}
}
}
float4 l9_757=l9_692;
float4 l9_758=l9_757;
float3 l9_759=mix(l9_681,l9_682,l9_758.xyz);
l9_680=l9_759;
float3 l9_760=float3(0.0);
float l9_761;
if (l9_680.x<=0.0)
{
l9_761=0.0;
}
else
{
l9_761=sqrt(l9_680.x);
}
float l9_762=l9_761;
float l9_763;
if (l9_680.y<=0.0)
{
l9_763=0.0;
}
else
{
l9_763=sqrt(l9_680.y);
}
float l9_764=l9_763;
float l9_765;
if (l9_680.z<=0.0)
{
l9_765=0.0;
}
else
{
l9_765=sqrt(l9_680.z);
}
l9_760=float3(l9_762,l9_764,l9_765);
float3 l9_766=float3(0.0);
float l9_767;
if (l9_760.x<=0.0)
{
l9_767=0.0;
}
else
{
l9_767=sqrt(l9_760.x);
}
float l9_768=l9_767;
float l9_769;
if (l9_760.y<=0.0)
{
l9_769=0.0;
}
else
{
l9_769=sqrt(l9_760.y);
}
float l9_770=l9_769;
float l9_771;
if (l9_760.z<=0.0)
{
l9_771=0.0;
}
else
{
l9_771=sqrt(l9_760.z);
}
l9_766=float3(l9_768,l9_770,l9_771);
float l9_772=0.0;
l9_772=(*sc_set0.UserUniforms).Port_Import_N131;
float3 l9_773=float3(0.0);
l9_773=(*sc_set0.UserUniforms).Port_Import_N132;
float3 l9_774=float3(0.0);
l9_774=((l9_675*l9_766)*float3(l9_772))*l9_773;
float l9_775=0.0;
float3 l9_776=l9_774;
float l9_777=l9_776.y;
l9_775=l9_777;
l9_404=l9_775;
l9_408=l9_404;
}
l9_401=l9_408;
float l9_778=0.0;
float l9_779=0.0;
float l9_780=0.0;
float l9_781=0.0;
ssGlobals l9_782=param_1;
float l9_783=0.0;
l9_783=0.0;
float l9_784=0.0;
l9_784=float(l9_783==(*sc_set0.UserUniforms).Port_Input1_N162);
l9_779=l9_784;
float l9_785;
if ((l9_779*1.0)!=0.0)
{
float3 l9_786=float3(0.0);
float3 l9_787=(*sc_set0.UserUniforms).Port_Min_N076;
float3 l9_788=(*sc_set0.UserUniforms).Port_Max_N076;
ssGlobals l9_789=l9_782;
int l9_790=3;
bool l9_791=true;
bool l9_792=true;
bool l9_793=true;
float l9_794=76.0;
ssParticle l9_795=gParticle;
float l9_796=0.0;
float l9_797=l9_789.gTimeElapsed;
float4 l9_798=float4(0.0);
float4 l9_799=float4(0.0);
if (l9_791)
{
l9_799.x=floor(fract(l9_797)*1000.0);
}
if (l9_793)
{
l9_799.y=float(l9_795.Index1D^((l9_795.Index1D*15299)+l9_795.Index1D));
}
if (l9_792)
{
l9_799.z=l9_794;
}
l9_799.w=l9_796*1000.0;
int l9_800=int(l9_799.x);
int l9_801=int(l9_799.y);
int l9_802=int(l9_799.z);
int l9_803=int(l9_799.w);
int l9_804=(((l9_800*15299)^(l9_801*30133))^(l9_802*17539))^(l9_803*12113);
int l9_805=l9_804;
if (l9_790==1)
{
int l9_806=l9_805;
int l9_807=l9_806;
int l9_808=((l9_807*((l9_807*1471343)+101146501))+1559861749)&2147483647;
int l9_809=l9_808;
float l9_810=float(l9_809)*4.6566129e-10;
float l9_811=l9_810;
l9_798.x=l9_811;
}
else
{
if (l9_790==2)
{
int l9_812=l9_805;
int l9_813=l9_812;
int l9_814=((l9_813*((l9_813*1471343)+101146501))+1559861749)&2147483647;
int l9_815=l9_814;
int l9_816=l9_812*1399;
int l9_817=((l9_816*((l9_816*1471343)+101146501))+1559861749)&2147483647;
int l9_818=l9_817;
int l9_819=l9_815;
float l9_820=float(l9_819)*4.6566129e-10;
int l9_821=l9_818;
float l9_822=float(l9_821)*4.6566129e-10;
float2 l9_823=float2(l9_820,l9_822);
l9_798=float4(l9_823.x,l9_823.y,l9_798.z,l9_798.w);
}
else
{
if (l9_790==3)
{
int l9_824=l9_805;
int l9_825=l9_824;
int l9_826=((l9_825*((l9_825*1471343)+101146501))+1559861749)&2147483647;
int l9_827=l9_826;
int l9_828=l9_824*1399;
int l9_829=((l9_828*((l9_828*1471343)+101146501))+1559861749)&2147483647;
int l9_830=l9_829;
int l9_831=l9_824*7177;
int l9_832=((l9_831*((l9_831*1471343)+101146501))+1559861749)&2147483647;
int l9_833=l9_832;
int l9_834=l9_827;
float l9_835=float(l9_834)*4.6566129e-10;
int l9_836=l9_830;
float l9_837=float(l9_836)*4.6566129e-10;
int l9_838=l9_833;
float l9_839=float(l9_838)*4.6566129e-10;
float3 l9_840=float3(l9_835,l9_837,l9_839);
l9_798=float4(l9_840.x,l9_840.y,l9_840.z,l9_798.w);
}
else
{
int l9_841=l9_805;
int l9_842=l9_841;
int l9_843=((l9_842*((l9_842*1471343)+101146501))+1559861749)&2147483647;
int l9_844=l9_843;
int l9_845=l9_841*1399;
int l9_846=((l9_845*((l9_845*1471343)+101146501))+1559861749)&2147483647;
int l9_847=l9_846;
int l9_848=l9_841*7177;
int l9_849=((l9_848*((l9_848*1471343)+101146501))+1559861749)&2147483647;
int l9_850=l9_849;
int l9_851=l9_841*18919;
int l9_852=((l9_851*((l9_851*1471343)+101146501))+1559861749)&2147483647;
int l9_853=l9_852;
int l9_854=l9_844;
float l9_855=float(l9_854)*4.6566129e-10;
int l9_856=l9_847;
float l9_857=float(l9_856)*4.6566129e-10;
int l9_858=l9_850;
float l9_859=float(l9_858)*4.6566129e-10;
int l9_860=l9_853;
float l9_861=float(l9_860)*4.6566129e-10;
float4 l9_862=float4(l9_855,l9_857,l9_859,l9_861);
l9_798=l9_862;
}
}
}
float4 l9_863=l9_798;
float4 l9_864=l9_863;
float3 l9_865=mix(l9_787,l9_788,l9_864.xyz);
l9_786=l9_865;
float l9_866=0.0;
l9_866=length(l9_786);
float3 l9_867=float3(0.0);
l9_867=l9_786/(float3(l9_866)+float3(1.234e-06));
float l9_868=0.0;
l9_868=fast::clamp((*sc_set0.UserUniforms).Port_Import_N084,0.0,1.0);
float l9_869=0.0;
l9_869=1.0-l9_868;
float l9_870=0.0;
float l9_871;
if (l9_869<=0.0)
{
l9_871=0.0;
}
else
{
l9_871=pow(l9_869,(*sc_set0.UserUniforms).Port_Input1_N087);
}
l9_870=l9_871;
float3 l9_872=float3(0.0);
float3 l9_873=float3(l9_870);
float3 l9_874=(*sc_set0.UserUniforms).Port_Max_N088;
ssGlobals l9_875=l9_782;
int l9_876=3;
bool l9_877=true;
bool l9_878=true;
bool l9_879=true;
float l9_880=88.0;
ssParticle l9_881=gParticle;
float l9_882=0.0;
float l9_883=l9_875.gTimeElapsed;
float4 l9_884=float4(0.0);
float4 l9_885=float4(0.0);
if (l9_877)
{
l9_885.x=floor(fract(l9_883)*1000.0);
}
if (l9_879)
{
l9_885.y=float(l9_881.Index1D^((l9_881.Index1D*15299)+l9_881.Index1D));
}
if (l9_878)
{
l9_885.z=l9_880;
}
l9_885.w=l9_882*1000.0;
int l9_886=int(l9_885.x);
int l9_887=int(l9_885.y);
int l9_888=int(l9_885.z);
int l9_889=int(l9_885.w);
int l9_890=(((l9_886*15299)^(l9_887*30133))^(l9_888*17539))^(l9_889*12113);
int l9_891=l9_890;
if (l9_876==1)
{
int l9_892=l9_891;
int l9_893=l9_892;
int l9_894=((l9_893*((l9_893*1471343)+101146501))+1559861749)&2147483647;
int l9_895=l9_894;
float l9_896=float(l9_895)*4.6566129e-10;
float l9_897=l9_896;
l9_884.x=l9_897;
}
else
{
if (l9_876==2)
{
int l9_898=l9_891;
int l9_899=l9_898;
int l9_900=((l9_899*((l9_899*1471343)+101146501))+1559861749)&2147483647;
int l9_901=l9_900;
int l9_902=l9_898*1399;
int l9_903=((l9_902*((l9_902*1471343)+101146501))+1559861749)&2147483647;
int l9_904=l9_903;
int l9_905=l9_901;
float l9_906=float(l9_905)*4.6566129e-10;
int l9_907=l9_904;
float l9_908=float(l9_907)*4.6566129e-10;
float2 l9_909=float2(l9_906,l9_908);
l9_884=float4(l9_909.x,l9_909.y,l9_884.z,l9_884.w);
}
else
{
if (l9_876==3)
{
int l9_910=l9_891;
int l9_911=l9_910;
int l9_912=((l9_911*((l9_911*1471343)+101146501))+1559861749)&2147483647;
int l9_913=l9_912;
int l9_914=l9_910*1399;
int l9_915=((l9_914*((l9_914*1471343)+101146501))+1559861749)&2147483647;
int l9_916=l9_915;
int l9_917=l9_910*7177;
int l9_918=((l9_917*((l9_917*1471343)+101146501))+1559861749)&2147483647;
int l9_919=l9_918;
int l9_920=l9_913;
float l9_921=float(l9_920)*4.6566129e-10;
int l9_922=l9_916;
float l9_923=float(l9_922)*4.6566129e-10;
int l9_924=l9_919;
float l9_925=float(l9_924)*4.6566129e-10;
float3 l9_926=float3(l9_921,l9_923,l9_925);
l9_884=float4(l9_926.x,l9_926.y,l9_926.z,l9_884.w);
}
else
{
int l9_927=l9_891;
int l9_928=l9_927;
int l9_929=((l9_928*((l9_928*1471343)+101146501))+1559861749)&2147483647;
int l9_930=l9_929;
int l9_931=l9_927*1399;
int l9_932=((l9_931*((l9_931*1471343)+101146501))+1559861749)&2147483647;
int l9_933=l9_932;
int l9_934=l9_927*7177;
int l9_935=((l9_934*((l9_934*1471343)+101146501))+1559861749)&2147483647;
int l9_936=l9_935;
int l9_937=l9_927*18919;
int l9_938=((l9_937*((l9_937*1471343)+101146501))+1559861749)&2147483647;
int l9_939=l9_938;
int l9_940=l9_930;
float l9_941=float(l9_940)*4.6566129e-10;
int l9_942=l9_933;
float l9_943=float(l9_942)*4.6566129e-10;
int l9_944=l9_936;
float l9_945=float(l9_944)*4.6566129e-10;
int l9_946=l9_939;
float l9_947=float(l9_946)*4.6566129e-10;
float4 l9_948=float4(l9_941,l9_943,l9_945,l9_947);
l9_884=l9_948;
}
}
}
float4 l9_949=l9_884;
float4 l9_950=l9_949;
float3 l9_951=mix(l9_873,l9_874,l9_950.xyz);
l9_872=l9_951;
float3 l9_952=float3(0.0);
float l9_953;
if (l9_872.x<=0.0)
{
l9_953=0.0;
}
else
{
l9_953=sqrt(l9_872.x);
}
float l9_954=l9_953;
float l9_955;
if (l9_872.y<=0.0)
{
l9_955=0.0;
}
else
{
l9_955=sqrt(l9_872.y);
}
float l9_956=l9_955;
float l9_957;
if (l9_872.z<=0.0)
{
l9_957=0.0;
}
else
{
l9_957=sqrt(l9_872.z);
}
l9_952=float3(l9_954,l9_956,l9_957);
float3 l9_958=float3(0.0);
float l9_959;
if (l9_952.x<=0.0)
{
l9_959=0.0;
}
else
{
l9_959=sqrt(l9_952.x);
}
float l9_960=l9_959;
float l9_961;
if (l9_952.y<=0.0)
{
l9_961=0.0;
}
else
{
l9_961=sqrt(l9_952.y);
}
float l9_962=l9_961;
float l9_963;
if (l9_952.z<=0.0)
{
l9_963=0.0;
}
else
{
l9_963=sqrt(l9_952.z);
}
l9_958=float3(l9_960,l9_962,l9_963);
float l9_964=0.0;
l9_964=(*sc_set0.UserUniforms).Port_Import_N131;
float3 l9_965=float3(0.0);
l9_965=(*sc_set0.UserUniforms).Port_Import_N132;
float3 l9_966=float3(0.0);
l9_966=((l9_867*l9_958)*float3(l9_964))*l9_965;
float l9_967=0.0;
float3 l9_968=l9_966;
float l9_969=l9_968.z;
l9_967=l9_969;
float l9_970=0.0;
l9_970=abs(l9_967);
l9_780=l9_970;
l9_785=l9_780;
}
else
{
float3 l9_971=float3(0.0);
float3 l9_972=(*sc_set0.UserUniforms).Port_Min_N076;
float3 l9_973=(*sc_set0.UserUniforms).Port_Max_N076;
ssGlobals l9_974=l9_782;
int l9_975=3;
bool l9_976=true;
bool l9_977=true;
bool l9_978=true;
float l9_979=76.0;
ssParticle l9_980=gParticle;
float l9_981=0.0;
float l9_982=l9_974.gTimeElapsed;
float4 l9_983=float4(0.0);
float4 l9_984=float4(0.0);
if (l9_976)
{
l9_984.x=floor(fract(l9_982)*1000.0);
}
if (l9_978)
{
l9_984.y=float(l9_980.Index1D^((l9_980.Index1D*15299)+l9_980.Index1D));
}
if (l9_977)
{
l9_984.z=l9_979;
}
l9_984.w=l9_981*1000.0;
int l9_985=int(l9_984.x);
int l9_986=int(l9_984.y);
int l9_987=int(l9_984.z);
int l9_988=int(l9_984.w);
int l9_989=(((l9_985*15299)^(l9_986*30133))^(l9_987*17539))^(l9_988*12113);
int l9_990=l9_989;
if (l9_975==1)
{
int l9_991=l9_990;
int l9_992=l9_991;
int l9_993=((l9_992*((l9_992*1471343)+101146501))+1559861749)&2147483647;
int l9_994=l9_993;
float l9_995=float(l9_994)*4.6566129e-10;
float l9_996=l9_995;
l9_983.x=l9_996;
}
else
{
if (l9_975==2)
{
int l9_997=l9_990;
int l9_998=l9_997;
int l9_999=((l9_998*((l9_998*1471343)+101146501))+1559861749)&2147483647;
int l9_1000=l9_999;
int l9_1001=l9_997*1399;
int l9_1002=((l9_1001*((l9_1001*1471343)+101146501))+1559861749)&2147483647;
int l9_1003=l9_1002;
int l9_1004=l9_1000;
float l9_1005=float(l9_1004)*4.6566129e-10;
int l9_1006=l9_1003;
float l9_1007=float(l9_1006)*4.6566129e-10;
float2 l9_1008=float2(l9_1005,l9_1007);
l9_983=float4(l9_1008.x,l9_1008.y,l9_983.z,l9_983.w);
}
else
{
if (l9_975==3)
{
int l9_1009=l9_990;
int l9_1010=l9_1009;
int l9_1011=((l9_1010*((l9_1010*1471343)+101146501))+1559861749)&2147483647;
int l9_1012=l9_1011;
int l9_1013=l9_1009*1399;
int l9_1014=((l9_1013*((l9_1013*1471343)+101146501))+1559861749)&2147483647;
int l9_1015=l9_1014;
int l9_1016=l9_1009*7177;
int l9_1017=((l9_1016*((l9_1016*1471343)+101146501))+1559861749)&2147483647;
int l9_1018=l9_1017;
int l9_1019=l9_1012;
float l9_1020=float(l9_1019)*4.6566129e-10;
int l9_1021=l9_1015;
float l9_1022=float(l9_1021)*4.6566129e-10;
int l9_1023=l9_1018;
float l9_1024=float(l9_1023)*4.6566129e-10;
float3 l9_1025=float3(l9_1020,l9_1022,l9_1024);
l9_983=float4(l9_1025.x,l9_1025.y,l9_1025.z,l9_983.w);
}
else
{
int l9_1026=l9_990;
int l9_1027=l9_1026;
int l9_1028=((l9_1027*((l9_1027*1471343)+101146501))+1559861749)&2147483647;
int l9_1029=l9_1028;
int l9_1030=l9_1026*1399;
int l9_1031=((l9_1030*((l9_1030*1471343)+101146501))+1559861749)&2147483647;
int l9_1032=l9_1031;
int l9_1033=l9_1026*7177;
int l9_1034=((l9_1033*((l9_1033*1471343)+101146501))+1559861749)&2147483647;
int l9_1035=l9_1034;
int l9_1036=l9_1026*18919;
int l9_1037=((l9_1036*((l9_1036*1471343)+101146501))+1559861749)&2147483647;
int l9_1038=l9_1037;
int l9_1039=l9_1029;
float l9_1040=float(l9_1039)*4.6566129e-10;
int l9_1041=l9_1032;
float l9_1042=float(l9_1041)*4.6566129e-10;
int l9_1043=l9_1035;
float l9_1044=float(l9_1043)*4.6566129e-10;
int l9_1045=l9_1038;
float l9_1046=float(l9_1045)*4.6566129e-10;
float4 l9_1047=float4(l9_1040,l9_1042,l9_1044,l9_1046);
l9_983=l9_1047;
}
}
}
float4 l9_1048=l9_983;
float4 l9_1049=l9_1048;
float3 l9_1050=mix(l9_972,l9_973,l9_1049.xyz);
l9_971=l9_1050;
float l9_1051=0.0;
l9_1051=length(l9_971);
float3 l9_1052=float3(0.0);
l9_1052=l9_971/(float3(l9_1051)+float3(1.234e-06));
float l9_1053=0.0;
l9_1053=fast::clamp((*sc_set0.UserUniforms).Port_Import_N084,0.0,1.0);
float l9_1054=0.0;
l9_1054=1.0-l9_1053;
float l9_1055=0.0;
float l9_1056;
if (l9_1054<=0.0)
{
l9_1056=0.0;
}
else
{
l9_1056=pow(l9_1054,(*sc_set0.UserUniforms).Port_Input1_N087);
}
l9_1055=l9_1056;
float3 l9_1057=float3(0.0);
float3 l9_1058=float3(l9_1055);
float3 l9_1059=(*sc_set0.UserUniforms).Port_Max_N088;
ssGlobals l9_1060=l9_782;
int l9_1061=3;
bool l9_1062=true;
bool l9_1063=true;
bool l9_1064=true;
float l9_1065=88.0;
ssParticle l9_1066=gParticle;
float l9_1067=0.0;
float l9_1068=l9_1060.gTimeElapsed;
float4 l9_1069=float4(0.0);
float4 l9_1070=float4(0.0);
if (l9_1062)
{
l9_1070.x=floor(fract(l9_1068)*1000.0);
}
if (l9_1064)
{
l9_1070.y=float(l9_1066.Index1D^((l9_1066.Index1D*15299)+l9_1066.Index1D));
}
if (l9_1063)
{
l9_1070.z=l9_1065;
}
l9_1070.w=l9_1067*1000.0;
int l9_1071=int(l9_1070.x);
int l9_1072=int(l9_1070.y);
int l9_1073=int(l9_1070.z);
int l9_1074=int(l9_1070.w);
int l9_1075=(((l9_1071*15299)^(l9_1072*30133))^(l9_1073*17539))^(l9_1074*12113);
int l9_1076=l9_1075;
if (l9_1061==1)
{
int l9_1077=l9_1076;
int l9_1078=l9_1077;
int l9_1079=((l9_1078*((l9_1078*1471343)+101146501))+1559861749)&2147483647;
int l9_1080=l9_1079;
float l9_1081=float(l9_1080)*4.6566129e-10;
float l9_1082=l9_1081;
l9_1069.x=l9_1082;
}
else
{
if (l9_1061==2)
{
int l9_1083=l9_1076;
int l9_1084=l9_1083;
int l9_1085=((l9_1084*((l9_1084*1471343)+101146501))+1559861749)&2147483647;
int l9_1086=l9_1085;
int l9_1087=l9_1083*1399;
int l9_1088=((l9_1087*((l9_1087*1471343)+101146501))+1559861749)&2147483647;
int l9_1089=l9_1088;
int l9_1090=l9_1086;
float l9_1091=float(l9_1090)*4.6566129e-10;
int l9_1092=l9_1089;
float l9_1093=float(l9_1092)*4.6566129e-10;
float2 l9_1094=float2(l9_1091,l9_1093);
l9_1069=float4(l9_1094.x,l9_1094.y,l9_1069.z,l9_1069.w);
}
else
{
if (l9_1061==3)
{
int l9_1095=l9_1076;
int l9_1096=l9_1095;
int l9_1097=((l9_1096*((l9_1096*1471343)+101146501))+1559861749)&2147483647;
int l9_1098=l9_1097;
int l9_1099=l9_1095*1399;
int l9_1100=((l9_1099*((l9_1099*1471343)+101146501))+1559861749)&2147483647;
int l9_1101=l9_1100;
int l9_1102=l9_1095*7177;
int l9_1103=((l9_1102*((l9_1102*1471343)+101146501))+1559861749)&2147483647;
int l9_1104=l9_1103;
int l9_1105=l9_1098;
float l9_1106=float(l9_1105)*4.6566129e-10;
int l9_1107=l9_1101;
float l9_1108=float(l9_1107)*4.6566129e-10;
int l9_1109=l9_1104;
float l9_1110=float(l9_1109)*4.6566129e-10;
float3 l9_1111=float3(l9_1106,l9_1108,l9_1110);
l9_1069=float4(l9_1111.x,l9_1111.y,l9_1111.z,l9_1069.w);
}
else
{
int l9_1112=l9_1076;
int l9_1113=l9_1112;
int l9_1114=((l9_1113*((l9_1113*1471343)+101146501))+1559861749)&2147483647;
int l9_1115=l9_1114;
int l9_1116=l9_1112*1399;
int l9_1117=((l9_1116*((l9_1116*1471343)+101146501))+1559861749)&2147483647;
int l9_1118=l9_1117;
int l9_1119=l9_1112*7177;
int l9_1120=((l9_1119*((l9_1119*1471343)+101146501))+1559861749)&2147483647;
int l9_1121=l9_1120;
int l9_1122=l9_1112*18919;
int l9_1123=((l9_1122*((l9_1122*1471343)+101146501))+1559861749)&2147483647;
int l9_1124=l9_1123;
int l9_1125=l9_1115;
float l9_1126=float(l9_1125)*4.6566129e-10;
int l9_1127=l9_1118;
float l9_1128=float(l9_1127)*4.6566129e-10;
int l9_1129=l9_1121;
float l9_1130=float(l9_1129)*4.6566129e-10;
int l9_1131=l9_1124;
float l9_1132=float(l9_1131)*4.6566129e-10;
float4 l9_1133=float4(l9_1126,l9_1128,l9_1130,l9_1132);
l9_1069=l9_1133;
}
}
}
float4 l9_1134=l9_1069;
float4 l9_1135=l9_1134;
float3 l9_1136=mix(l9_1058,l9_1059,l9_1135.xyz);
l9_1057=l9_1136;
float3 l9_1137=float3(0.0);
float l9_1138;
if (l9_1057.x<=0.0)
{
l9_1138=0.0;
}
else
{
l9_1138=sqrt(l9_1057.x);
}
float l9_1139=l9_1138;
float l9_1140;
if (l9_1057.y<=0.0)
{
l9_1140=0.0;
}
else
{
l9_1140=sqrt(l9_1057.y);
}
float l9_1141=l9_1140;
float l9_1142;
if (l9_1057.z<=0.0)
{
l9_1142=0.0;
}
else
{
l9_1142=sqrt(l9_1057.z);
}
l9_1137=float3(l9_1139,l9_1141,l9_1142);
float3 l9_1143=float3(0.0);
float l9_1144;
if (l9_1137.x<=0.0)
{
l9_1144=0.0;
}
else
{
l9_1144=sqrt(l9_1137.x);
}
float l9_1145=l9_1144;
float l9_1146;
if (l9_1137.y<=0.0)
{
l9_1146=0.0;
}
else
{
l9_1146=sqrt(l9_1137.y);
}
float l9_1147=l9_1146;
float l9_1148;
if (l9_1137.z<=0.0)
{
l9_1148=0.0;
}
else
{
l9_1148=sqrt(l9_1137.z);
}
l9_1143=float3(l9_1145,l9_1147,l9_1148);
float l9_1149=0.0;
l9_1149=(*sc_set0.UserUniforms).Port_Import_N131;
float3 l9_1150=float3(0.0);
l9_1150=(*sc_set0.UserUniforms).Port_Import_N132;
float3 l9_1151=float3(0.0);
l9_1151=((l9_1052*l9_1143)*float3(l9_1149))*l9_1150;
float l9_1152=0.0;
float3 l9_1153=l9_1151;
float l9_1154=l9_1153.z;
l9_1152=l9_1154;
l9_781=l9_1152;
l9_785=l9_781;
}
l9_778=l9_785;
float3 l9_1155=float3(0.0);
l9_1155.x=l9_24;
l9_1155.y=l9_401;
l9_1155.z=l9_778;
float3 l9_1156=float3(0.0);
l9_1156=l9_23+l9_1155;
gParticle.Position=l9_1156;
float l9_1157=0.0;
float l9_1158=(*sc_set0.UserUniforms).Port_Min_N008;
float l9_1159=(*sc_set0.UserUniforms).Port_Max_N008;
ssGlobals l9_1160=param_1;
int l9_1161=1;
bool l9_1162=false;
bool l9_1163=true;
bool l9_1164=true;
float l9_1165=8.0;
ssParticle l9_1166=gParticle;
float l9_1167=0.0;
float l9_1168=l9_1160.gTimeElapsed;
float4 l9_1169=float4(0.0);
float4 l9_1170=float4(0.0);
if (l9_1162)
{
l9_1170.x=floor(fract(l9_1168)*1000.0);
}
if (l9_1164)
{
l9_1170.y=float(l9_1166.Index1D^((l9_1166.Index1D*15299)+l9_1166.Index1D));
}
if (l9_1163)
{
l9_1170.z=l9_1165;
}
l9_1170.w=l9_1167*1000.0;
int l9_1171=int(l9_1170.x);
int l9_1172=int(l9_1170.y);
int l9_1173=int(l9_1170.z);
int l9_1174=int(l9_1170.w);
int l9_1175=(((l9_1171*15299)^(l9_1172*30133))^(l9_1173*17539))^(l9_1174*12113);
int l9_1176=l9_1175;
if (l9_1161==1)
{
int l9_1177=l9_1176;
int l9_1178=l9_1177;
int l9_1179=((l9_1178*((l9_1178*1471343)+101146501))+1559861749)&2147483647;
int l9_1180=l9_1179;
float l9_1181=float(l9_1180)*4.6566129e-10;
float l9_1182=l9_1181;
l9_1169.x=l9_1182;
}
else
{
if (l9_1161==2)
{
int l9_1183=l9_1176;
int l9_1184=l9_1183;
int l9_1185=((l9_1184*((l9_1184*1471343)+101146501))+1559861749)&2147483647;
int l9_1186=l9_1185;
int l9_1187=l9_1183*1399;
int l9_1188=((l9_1187*((l9_1187*1471343)+101146501))+1559861749)&2147483647;
int l9_1189=l9_1188;
int l9_1190=l9_1186;
float l9_1191=float(l9_1190)*4.6566129e-10;
int l9_1192=l9_1189;
float l9_1193=float(l9_1192)*4.6566129e-10;
float2 l9_1194=float2(l9_1191,l9_1193);
l9_1169=float4(l9_1194.x,l9_1194.y,l9_1169.z,l9_1169.w);
}
else
{
if (l9_1161==3)
{
int l9_1195=l9_1176;
int l9_1196=l9_1195;
int l9_1197=((l9_1196*((l9_1196*1471343)+101146501))+1559861749)&2147483647;
int l9_1198=l9_1197;
int l9_1199=l9_1195*1399;
int l9_1200=((l9_1199*((l9_1199*1471343)+101146501))+1559861749)&2147483647;
int l9_1201=l9_1200;
int l9_1202=l9_1195*7177;
int l9_1203=((l9_1202*((l9_1202*1471343)+101146501))+1559861749)&2147483647;
int l9_1204=l9_1203;
int l9_1205=l9_1198;
float l9_1206=float(l9_1205)*4.6566129e-10;
int l9_1207=l9_1201;
float l9_1208=float(l9_1207)*4.6566129e-10;
int l9_1209=l9_1204;
float l9_1210=float(l9_1209)*4.6566129e-10;
float3 l9_1211=float3(l9_1206,l9_1208,l9_1210);
l9_1169=float4(l9_1211.x,l9_1211.y,l9_1211.z,l9_1169.w);
}
else
{
int l9_1212=l9_1176;
int l9_1213=l9_1212;
int l9_1214=((l9_1213*((l9_1213*1471343)+101146501))+1559861749)&2147483647;
int l9_1215=l9_1214;
int l9_1216=l9_1212*1399;
int l9_1217=((l9_1216*((l9_1216*1471343)+101146501))+1559861749)&2147483647;
int l9_1218=l9_1217;
int l9_1219=l9_1212*7177;
int l9_1220=((l9_1219*((l9_1219*1471343)+101146501))+1559861749)&2147483647;
int l9_1221=l9_1220;
int l9_1222=l9_1212*18919;
int l9_1223=((l9_1222*((l9_1222*1471343)+101146501))+1559861749)&2147483647;
int l9_1224=l9_1223;
int l9_1225=l9_1215;
float l9_1226=float(l9_1225)*4.6566129e-10;
int l9_1227=l9_1218;
float l9_1228=float(l9_1227)*4.6566129e-10;
int l9_1229=l9_1221;
float l9_1230=float(l9_1229)*4.6566129e-10;
int l9_1231=l9_1224;
float l9_1232=float(l9_1231)*4.6566129e-10;
float4 l9_1233=float4(l9_1226,l9_1228,l9_1230,l9_1232);
l9_1169=l9_1233;
}
}
}
float4 l9_1234=l9_1169;
float4 l9_1235=l9_1234;
float l9_1236=mix(l9_1158,l9_1159,l9_1235.x);
l9_1157=l9_1236;
float l9_1237=0.0;
l9_1237=l9_1157;
float3 l9_1238=float3(0.0);
float3 l9_1239=(*sc_set0.UserUniforms).directionPosition;
l9_1238=l9_1239;
float3 l9_1240=float3(0.0);
l9_1240=l9_1238;
float3 l9_1241=float3(0.0);
l9_1241=gParticle.Position;
float3 l9_1242=float3(0.0);
l9_1242=l9_1240-l9_1241;
float3 l9_1243=float3(0.0);
float3 l9_1244=l9_1242;
float l9_1245=dot(l9_1244,l9_1244);
float l9_1246;
if (l9_1245>0.0)
{
l9_1246=1.0/sqrt(l9_1245);
}
else
{
l9_1246=0.0;
}
float l9_1247=l9_1246;
float3 l9_1248=l9_1244*l9_1247;
l9_1243=l9_1248;
float3 l9_1249=float3(0.0);
l9_1249=float3(l9_1237)*l9_1243;
gParticle.Force+=l9_1249;
float l9_1250=0.0;
l9_1250=(*sc_set0.UserUniforms).Port_Import_N116;
float l9_1251=0.0;
l9_1251=(*sc_set0.UserUniforms).Port_Import_N117;
float l9_1252=0.0;
float l9_1253=l9_1250;
float l9_1254=l9_1251;
ssGlobals l9_1255=param_1;
int l9_1256=1;
bool l9_1257=true;
bool l9_1258=true;
bool l9_1259=true;
float l9_1260=118.0;
ssParticle l9_1261=gParticle;
float l9_1262=1.0;
float l9_1263=l9_1255.gTimeElapsed;
float4 l9_1264=float4(0.0);
float4 l9_1265=float4(0.0);
if (l9_1257)
{
l9_1265.x=floor(fract(l9_1263)*1000.0);
}
if (l9_1259)
{
l9_1265.y=float(l9_1261.Index1D^((l9_1261.Index1D*15299)+l9_1261.Index1D));
}
if (l9_1258)
{
l9_1265.z=l9_1260;
}
l9_1265.w=l9_1262*1000.0;
int l9_1266=int(l9_1265.x);
int l9_1267=int(l9_1265.y);
int l9_1268=int(l9_1265.z);
int l9_1269=int(l9_1265.w);
int l9_1270=(((l9_1266*15299)^(l9_1267*30133))^(l9_1268*17539))^(l9_1269*12113);
int l9_1271=l9_1270;
if (l9_1256==1)
{
int l9_1272=l9_1271;
int l9_1273=l9_1272;
int l9_1274=((l9_1273*((l9_1273*1471343)+101146501))+1559861749)&2147483647;
int l9_1275=l9_1274;
float l9_1276=float(l9_1275)*4.6566129e-10;
float l9_1277=l9_1276;
l9_1264.x=l9_1277;
}
else
{
if (l9_1256==2)
{
int l9_1278=l9_1271;
int l9_1279=l9_1278;
int l9_1280=((l9_1279*((l9_1279*1471343)+101146501))+1559861749)&2147483647;
int l9_1281=l9_1280;
int l9_1282=l9_1278*1399;
int l9_1283=((l9_1282*((l9_1282*1471343)+101146501))+1559861749)&2147483647;
int l9_1284=l9_1283;
int l9_1285=l9_1281;
float l9_1286=float(l9_1285)*4.6566129e-10;
int l9_1287=l9_1284;
float l9_1288=float(l9_1287)*4.6566129e-10;
float2 l9_1289=float2(l9_1286,l9_1288);
l9_1264=float4(l9_1289.x,l9_1289.y,l9_1264.z,l9_1264.w);
}
else
{
if (l9_1256==3)
{
int l9_1290=l9_1271;
int l9_1291=l9_1290;
int l9_1292=((l9_1291*((l9_1291*1471343)+101146501))+1559861749)&2147483647;
int l9_1293=l9_1292;
int l9_1294=l9_1290*1399;
int l9_1295=((l9_1294*((l9_1294*1471343)+101146501))+1559861749)&2147483647;
int l9_1296=l9_1295;
int l9_1297=l9_1290*7177;
int l9_1298=((l9_1297*((l9_1297*1471343)+101146501))+1559861749)&2147483647;
int l9_1299=l9_1298;
int l9_1300=l9_1293;
float l9_1301=float(l9_1300)*4.6566129e-10;
int l9_1302=l9_1296;
float l9_1303=float(l9_1302)*4.6566129e-10;
int l9_1304=l9_1299;
float l9_1305=float(l9_1304)*4.6566129e-10;
float3 l9_1306=float3(l9_1301,l9_1303,l9_1305);
l9_1264=float4(l9_1306.x,l9_1306.y,l9_1306.z,l9_1264.w);
}
else
{
int l9_1307=l9_1271;
int l9_1308=l9_1307;
int l9_1309=((l9_1308*((l9_1308*1471343)+101146501))+1559861749)&2147483647;
int l9_1310=l9_1309;
int l9_1311=l9_1307*1399;
int l9_1312=((l9_1311*((l9_1311*1471343)+101146501))+1559861749)&2147483647;
int l9_1313=l9_1312;
int l9_1314=l9_1307*7177;
int l9_1315=((l9_1314*((l9_1314*1471343)+101146501))+1559861749)&2147483647;
int l9_1316=l9_1315;
int l9_1317=l9_1307*18919;
int l9_1318=((l9_1317*((l9_1317*1471343)+101146501))+1559861749)&2147483647;
int l9_1319=l9_1318;
int l9_1320=l9_1310;
float l9_1321=float(l9_1320)*4.6566129e-10;
int l9_1322=l9_1313;
float l9_1323=float(l9_1322)*4.6566129e-10;
int l9_1324=l9_1316;
float l9_1325=float(l9_1324)*4.6566129e-10;
int l9_1326=l9_1319;
float l9_1327=float(l9_1326)*4.6566129e-10;
float4 l9_1328=float4(l9_1321,l9_1323,l9_1325,l9_1327);
l9_1264=l9_1328;
}
}
}
float4 l9_1329=l9_1264;
float4 l9_1330=l9_1329;
float l9_1331=mix(l9_1253,l9_1254,l9_1330.x);
l9_1252=l9_1331;
float l9_1332=l9_1252;
gParticle.Life=l9_1332;
gParticle.Life=fast::clamp(gParticle.Life,0.1,2.0);
float l9_1333=0.0;
float l9_1334=float((*sc_set0.UserUniforms).pauseSpawn!=0);
l9_1333=l9_1334;
float l9_1335=l9_1333;
if ((l9_1335*1.0)!=0.0)
{
gParticle.Dead=true;
}
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
int l9_1336=gl_InstanceIndex;
gParticle.Position=((*sc_set0.UserUniforms).vfxModelMatrix[l9_1336/40]*float4(gParticle.Position,1.0)).xyz;
int l9_1337=gl_InstanceIndex;
int l9_1338=l9_1337/40;
gParticle.Velocity=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_1338][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1338][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1338][2].xyz)*gParticle.Velocity;
int l9_1339=gl_InstanceIndex;
int l9_1340=l9_1339/40;
gParticle.Force=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_1340][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1340][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1340][2].xyz)*gParticle.Force;
int l9_1341=gl_InstanceIndex;
int l9_1342=gl_InstanceIndex;
int l9_1343=gl_InstanceIndex;
gParticle.Size=fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_1341/40][0].xyz),fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_1342/40][1].xyz),length((*sc_set0.UserUniforms).vfxModelMatrix[l9_1343/40][2].xyz)))*gParticle.Size;
int l9_1344=gl_InstanceIndex;
int l9_1345=l9_1344/40;
gParticle.Matrix=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_1345][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1345][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_1345][2].xyz)*gParticle.Matrix;
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
float4 l9_1346=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1347=dot(l9_1346,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1348=l9_1347;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1348;
}
}
float4 l9_1349=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_1349;
return out;
}
float Value_N126=0.0;
Value_N126=(*sc_set0.UserUniforms).Port_Import_N126;
float Value_N127=0.0;
Value_N127=(*sc_set0.UserUniforms).Port_Import_N127;
float Value_N128=0.0;
Value_N128=(*sc_set0.UserUniforms).Port_Import_N128;
float3 Value_N129=float3(0.0);
Value_N129=gParticle.Velocity;
float3 Output_N264=float3(0.0);
Output_N264=-Value_N129;
float Output_N265=0.0;
Output_N265=length(Value_N129);
float3 Output_N130=float3(0.0);
Output_N130=Output_N264*float3(Output_N265);
float3 Output_N137=float3(0.0);
Output_N137=(((float3(Value_N126)*float3(Value_N127))*float3(Value_N128))*Output_N130)*float3((*sc_set0.UserUniforms).Port_Input4_N137);
float3 Value_N138=float3(0.0);
Value_N138=gParticle.Velocity;
float Value_N139=0.0;
Value_N139=gParticle.Mass;
float3 Output_N140=float3(0.0);
Output_N140=Value_N138*float3(Value_N139);
float3 Output_N141=float3(0.0);
Output_N141=abs(Output_N140);
float Time_N272=0.0;
Time_N272=Globals.gTimeDelta*(*sc_set0.UserUniforms).Port_Multiplier_N272;
float3 Output_N273=float3(0.0);
Output_N273=Output_N141/float3(Time_N272);
float3 Output_N274=float3(0.0);
Output_N274=-Output_N273;
float3 Output_N275=float3(0.0);
Output_N275=fast::clamp(Output_N137,Output_N274,Output_N273);
gParticle.Force+=Output_N275;
float3 Value_N26=float3(0.0);
Value_N26=(*sc_set0.UserUniforms).Port_Import_N026;
float3 Value_N28=float3(0.0);
Value_N28=gParticle.Position;
float3 Value_N29=float3(0.0);
Value_N29=(*sc_set0.UserUniforms).Port_Import_N029;
float3 Value_N30=float3(0.0);
Value_N30=(*sc_set0.UserUniforms).Port_Import_N030;
float Time_N31=0.0;
Time_N31=Globals.gTimeElapsedShifted*(*sc_set0.UserUniforms).Port_Multiplier_N031;
float3 Output_N89=float3(0.0);
Output_N89=Value_N30*float3(Time_N31);
float3 Output_N142=float3(0.0);
Output_N142=(Value_N28+Value_N29)+Output_N89;
float3 Value_N143=float3(0.0);
Value_N143=(*sc_set0.UserUniforms).Port_Import_N143;
float3 Output_N144=float3(0.0);
Output_N144=Output_N142+Value_N143;
float3 Output_N145=float3(0.0);
Output_N145=Value_N143*float3((*sc_set0.UserUniforms).Port_Input1_N145);
float3 Output_N146=float3(0.0);
Output_N146=float3(1.0)/Output_N145;
float3 Output_N147=float3(0.0);
Output_N147=Output_N144*Output_N146;
float4 Color_N148=float4(0.0);
float3 param_3=Output_N147;
float param_4=0.0;
float3 l9_1351=param_3;
float l9_1352=param_4;
float4 l9_1353=float4(0.0);
l9_1353=sc_set0.noiseTex.sample(sc_set0.noiseTexSmpSC,l9_1351,level(l9_1352));
float4 l9_1354=l9_1353;
float4 l9_1355=l9_1354;
Color_N148=l9_1355;
float4 Output_N149=float4(0.0);
Output_N149=Color_N148*float4((*sc_set0.UserUniforms).Port_Input1_N149);
float4 Output_N150=float4(0.0);
Output_N150=Output_N149-float4(1.0);
float3 Output_N284=float3(0.0);
Output_N284=Value_N26*Output_N150.xyz;
gParticle.Force+=Output_N284;
float Output_N71=0.0;
float param_5=1.0;
float param_6=1.0;
float param_7=0.0;
ssGlobals param_9=Globals;
float l9_1356=0.0;
l9_1356=0.0;
param_5=l9_1356;
float param_8;
if ((param_5*1.0)!=0.0)
{
float l9_1357=0.0;
float l9_1358=(*sc_set0.UserUniforms).Port_Min_N020;
float l9_1359=(*sc_set0.UserUniforms).Port_Max_N020;
ssGlobals l9_1360=param_9;
int l9_1361=1;
bool l9_1362=false;
bool l9_1363=true;
bool l9_1364=true;
float l9_1365=20.0;
ssParticle l9_1366=gParticle;
float l9_1367=0.0;
float l9_1368=l9_1360.gTimeElapsed;
float4 l9_1369=float4(0.0);
float4 l9_1370=float4(0.0);
if (l9_1362)
{
l9_1370.x=floor(fract(l9_1368)*1000.0);
}
if (l9_1364)
{
l9_1370.y=float(l9_1366.Index1D^((l9_1366.Index1D*15299)+l9_1366.Index1D));
}
if (l9_1363)
{
l9_1370.z=l9_1365;
}
l9_1370.w=l9_1367*1000.0;
int l9_1371=int(l9_1370.x);
int l9_1372=int(l9_1370.y);
int l9_1373=int(l9_1370.z);
int l9_1374=int(l9_1370.w);
int l9_1375=(((l9_1371*15299)^(l9_1372*30133))^(l9_1373*17539))^(l9_1374*12113);
int l9_1376=l9_1375;
if (l9_1361==1)
{
int l9_1377=l9_1376;
int l9_1378=l9_1377;
int l9_1379=((l9_1378*((l9_1378*1471343)+101146501))+1559861749)&2147483647;
int l9_1380=l9_1379;
float l9_1381=float(l9_1380)*4.6566129e-10;
float l9_1382=l9_1381;
l9_1369.x=l9_1382;
}
else
{
if (l9_1361==2)
{
int l9_1383=l9_1376;
int l9_1384=l9_1383;
int l9_1385=((l9_1384*((l9_1384*1471343)+101146501))+1559861749)&2147483647;
int l9_1386=l9_1385;
int l9_1387=l9_1383*1399;
int l9_1388=((l9_1387*((l9_1387*1471343)+101146501))+1559861749)&2147483647;
int l9_1389=l9_1388;
int l9_1390=l9_1386;
float l9_1391=float(l9_1390)*4.6566129e-10;
int l9_1392=l9_1389;
float l9_1393=float(l9_1392)*4.6566129e-10;
float2 l9_1394=float2(l9_1391,l9_1393);
l9_1369=float4(l9_1394.x,l9_1394.y,l9_1369.z,l9_1369.w);
}
else
{
if (l9_1361==3)
{
int l9_1395=l9_1376;
int l9_1396=l9_1395;
int l9_1397=((l9_1396*((l9_1396*1471343)+101146501))+1559861749)&2147483647;
int l9_1398=l9_1397;
int l9_1399=l9_1395*1399;
int l9_1400=((l9_1399*((l9_1399*1471343)+101146501))+1559861749)&2147483647;
int l9_1401=l9_1400;
int l9_1402=l9_1395*7177;
int l9_1403=((l9_1402*((l9_1402*1471343)+101146501))+1559861749)&2147483647;
int l9_1404=l9_1403;
int l9_1405=l9_1398;
float l9_1406=float(l9_1405)*4.6566129e-10;
int l9_1407=l9_1401;
float l9_1408=float(l9_1407)*4.6566129e-10;
int l9_1409=l9_1404;
float l9_1410=float(l9_1409)*4.6566129e-10;
float3 l9_1411=float3(l9_1406,l9_1408,l9_1410);
l9_1369=float4(l9_1411.x,l9_1411.y,l9_1411.z,l9_1369.w);
}
else
{
int l9_1412=l9_1376;
int l9_1413=l9_1412;
int l9_1414=((l9_1413*((l9_1413*1471343)+101146501))+1559861749)&2147483647;
int l9_1415=l9_1414;
int l9_1416=l9_1412*1399;
int l9_1417=((l9_1416*((l9_1416*1471343)+101146501))+1559861749)&2147483647;
int l9_1418=l9_1417;
int l9_1419=l9_1412*7177;
int l9_1420=((l9_1419*((l9_1419*1471343)+101146501))+1559861749)&2147483647;
int l9_1421=l9_1420;
int l9_1422=l9_1412*18919;
int l9_1423=((l9_1422*((l9_1422*1471343)+101146501))+1559861749)&2147483647;
int l9_1424=l9_1423;
int l9_1425=l9_1415;
float l9_1426=float(l9_1425)*4.6566129e-10;
int l9_1427=l9_1418;
float l9_1428=float(l9_1427)*4.6566129e-10;
int l9_1429=l9_1421;
float l9_1430=float(l9_1429)*4.6566129e-10;
int l9_1431=l9_1424;
float l9_1432=float(l9_1431)*4.6566129e-10;
float4 l9_1433=float4(l9_1426,l9_1428,l9_1430,l9_1432);
l9_1369=l9_1433;
}
}
}
float4 l9_1434=l9_1369;
float4 l9_1435=l9_1434;
float l9_1436=mix(l9_1358,l9_1359,l9_1435.x);
l9_1357=l9_1436;
float l9_1437=0.0;
l9_1437=l9_1357;
float l9_1438=0.0;
float l9_1439=(*sc_set0.UserUniforms).Port_Min_N019;
float l9_1440=(*sc_set0.UserUniforms).Port_Max_N019;
ssGlobals l9_1441=param_9;
int l9_1442=1;
bool l9_1443=false;
bool l9_1444=true;
bool l9_1445=true;
float l9_1446=19.0;
ssParticle l9_1447=gParticle;
float l9_1448=0.0;
float l9_1449=l9_1441.gTimeElapsed;
float4 l9_1450=float4(0.0);
float4 l9_1451=float4(0.0);
if (l9_1443)
{
l9_1451.x=floor(fract(l9_1449)*1000.0);
}
if (l9_1445)
{
l9_1451.y=float(l9_1447.Index1D^((l9_1447.Index1D*15299)+l9_1447.Index1D));
}
if (l9_1444)
{
l9_1451.z=l9_1446;
}
l9_1451.w=l9_1448*1000.0;
int l9_1452=int(l9_1451.x);
int l9_1453=int(l9_1451.y);
int l9_1454=int(l9_1451.z);
int l9_1455=int(l9_1451.w);
int l9_1456=(((l9_1452*15299)^(l9_1453*30133))^(l9_1454*17539))^(l9_1455*12113);
int l9_1457=l9_1456;
if (l9_1442==1)
{
int l9_1458=l9_1457;
int l9_1459=l9_1458;
int l9_1460=((l9_1459*((l9_1459*1471343)+101146501))+1559861749)&2147483647;
int l9_1461=l9_1460;
float l9_1462=float(l9_1461)*4.6566129e-10;
float l9_1463=l9_1462;
l9_1450.x=l9_1463;
}
else
{
if (l9_1442==2)
{
int l9_1464=l9_1457;
int l9_1465=l9_1464;
int l9_1466=((l9_1465*((l9_1465*1471343)+101146501))+1559861749)&2147483647;
int l9_1467=l9_1466;
int l9_1468=l9_1464*1399;
int l9_1469=((l9_1468*((l9_1468*1471343)+101146501))+1559861749)&2147483647;
int l9_1470=l9_1469;
int l9_1471=l9_1467;
float l9_1472=float(l9_1471)*4.6566129e-10;
int l9_1473=l9_1470;
float l9_1474=float(l9_1473)*4.6566129e-10;
float2 l9_1475=float2(l9_1472,l9_1474);
l9_1450=float4(l9_1475.x,l9_1475.y,l9_1450.z,l9_1450.w);
}
else
{
if (l9_1442==3)
{
int l9_1476=l9_1457;
int l9_1477=l9_1476;
int l9_1478=((l9_1477*((l9_1477*1471343)+101146501))+1559861749)&2147483647;
int l9_1479=l9_1478;
int l9_1480=l9_1476*1399;
int l9_1481=((l9_1480*((l9_1480*1471343)+101146501))+1559861749)&2147483647;
int l9_1482=l9_1481;
int l9_1483=l9_1476*7177;
int l9_1484=((l9_1483*((l9_1483*1471343)+101146501))+1559861749)&2147483647;
int l9_1485=l9_1484;
int l9_1486=l9_1479;
float l9_1487=float(l9_1486)*4.6566129e-10;
int l9_1488=l9_1482;
float l9_1489=float(l9_1488)*4.6566129e-10;
int l9_1490=l9_1485;
float l9_1491=float(l9_1490)*4.6566129e-10;
float3 l9_1492=float3(l9_1487,l9_1489,l9_1491);
l9_1450=float4(l9_1492.x,l9_1492.y,l9_1492.z,l9_1450.w);
}
else
{
int l9_1493=l9_1457;
int l9_1494=l9_1493;
int l9_1495=((l9_1494*((l9_1494*1471343)+101146501))+1559861749)&2147483647;
int l9_1496=l9_1495;
int l9_1497=l9_1493*1399;
int l9_1498=((l9_1497*((l9_1497*1471343)+101146501))+1559861749)&2147483647;
int l9_1499=l9_1498;
int l9_1500=l9_1493*7177;
int l9_1501=((l9_1500*((l9_1500*1471343)+101146501))+1559861749)&2147483647;
int l9_1502=l9_1501;
int l9_1503=l9_1493*18919;
int l9_1504=((l9_1503*((l9_1503*1471343)+101146501))+1559861749)&2147483647;
int l9_1505=l9_1504;
int l9_1506=l9_1496;
float l9_1507=float(l9_1506)*4.6566129e-10;
int l9_1508=l9_1499;
float l9_1509=float(l9_1508)*4.6566129e-10;
int l9_1510=l9_1502;
float l9_1511=float(l9_1510)*4.6566129e-10;
int l9_1512=l9_1505;
float l9_1513=float(l9_1512)*4.6566129e-10;
float4 l9_1514=float4(l9_1507,l9_1509,l9_1511,l9_1513);
l9_1450=l9_1514;
}
}
}
float4 l9_1515=l9_1450;
float4 l9_1516=l9_1515;
float l9_1517=mix(l9_1439,l9_1440,l9_1516.x);
l9_1438=l9_1517;
float l9_1518=0.0;
l9_1518=l9_1438;
float l9_1519=0.0;
l9_1519=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_1520=0.0;
l9_1520=mix(l9_1437,l9_1518,l9_1519);
float3 l9_1521=float3(0.0);
l9_1521=(*sc_set0.UserUniforms).vfxLocalAabbMax;
float3 l9_1522=float3(0.0);
l9_1522=(*sc_set0.UserUniforms).vfxLocalAabbMin;
float3 l9_1523=float3(0.0);
l9_1523=l9_1521-l9_1522;
float l9_1524=0.0;
l9_1524=length(l9_1523);
float l9_1525=0.0;
l9_1525=l9_1520/(l9_1524+1.234e-06);
param_6=l9_1525;
param_8=param_6;
}
else
{
float l9_1526=0.0;
float l9_1527=(*sc_set0.UserUniforms).Port_Min_N020;
float l9_1528=(*sc_set0.UserUniforms).Port_Max_N020;
ssGlobals l9_1529=param_9;
int l9_1530=1;
bool l9_1531=false;
bool l9_1532=true;
bool l9_1533=true;
float l9_1534=20.0;
ssParticle l9_1535=gParticle;
float l9_1536=0.0;
float l9_1537=l9_1529.gTimeElapsed;
float4 l9_1538=float4(0.0);
float4 l9_1539=float4(0.0);
if (l9_1531)
{
l9_1539.x=floor(fract(l9_1537)*1000.0);
}
if (l9_1533)
{
l9_1539.y=float(l9_1535.Index1D^((l9_1535.Index1D*15299)+l9_1535.Index1D));
}
if (l9_1532)
{
l9_1539.z=l9_1534;
}
l9_1539.w=l9_1536*1000.0;
int l9_1540=int(l9_1539.x);
int l9_1541=int(l9_1539.y);
int l9_1542=int(l9_1539.z);
int l9_1543=int(l9_1539.w);
int l9_1544=(((l9_1540*15299)^(l9_1541*30133))^(l9_1542*17539))^(l9_1543*12113);
int l9_1545=l9_1544;
if (l9_1530==1)
{
int l9_1546=l9_1545;
int l9_1547=l9_1546;
int l9_1548=((l9_1547*((l9_1547*1471343)+101146501))+1559861749)&2147483647;
int l9_1549=l9_1548;
float l9_1550=float(l9_1549)*4.6566129e-10;
float l9_1551=l9_1550;
l9_1538.x=l9_1551;
}
else
{
if (l9_1530==2)
{
int l9_1552=l9_1545;
int l9_1553=l9_1552;
int l9_1554=((l9_1553*((l9_1553*1471343)+101146501))+1559861749)&2147483647;
int l9_1555=l9_1554;
int l9_1556=l9_1552*1399;
int l9_1557=((l9_1556*((l9_1556*1471343)+101146501))+1559861749)&2147483647;
int l9_1558=l9_1557;
int l9_1559=l9_1555;
float l9_1560=float(l9_1559)*4.6566129e-10;
int l9_1561=l9_1558;
float l9_1562=float(l9_1561)*4.6566129e-10;
float2 l9_1563=float2(l9_1560,l9_1562);
l9_1538=float4(l9_1563.x,l9_1563.y,l9_1538.z,l9_1538.w);
}
else
{
if (l9_1530==3)
{
int l9_1564=l9_1545;
int l9_1565=l9_1564;
int l9_1566=((l9_1565*((l9_1565*1471343)+101146501))+1559861749)&2147483647;
int l9_1567=l9_1566;
int l9_1568=l9_1564*1399;
int l9_1569=((l9_1568*((l9_1568*1471343)+101146501))+1559861749)&2147483647;
int l9_1570=l9_1569;
int l9_1571=l9_1564*7177;
int l9_1572=((l9_1571*((l9_1571*1471343)+101146501))+1559861749)&2147483647;
int l9_1573=l9_1572;
int l9_1574=l9_1567;
float l9_1575=float(l9_1574)*4.6566129e-10;
int l9_1576=l9_1570;
float l9_1577=float(l9_1576)*4.6566129e-10;
int l9_1578=l9_1573;
float l9_1579=float(l9_1578)*4.6566129e-10;
float3 l9_1580=float3(l9_1575,l9_1577,l9_1579);
l9_1538=float4(l9_1580.x,l9_1580.y,l9_1580.z,l9_1538.w);
}
else
{
int l9_1581=l9_1545;
int l9_1582=l9_1581;
int l9_1583=((l9_1582*((l9_1582*1471343)+101146501))+1559861749)&2147483647;
int l9_1584=l9_1583;
int l9_1585=l9_1581*1399;
int l9_1586=((l9_1585*((l9_1585*1471343)+101146501))+1559861749)&2147483647;
int l9_1587=l9_1586;
int l9_1588=l9_1581*7177;
int l9_1589=((l9_1588*((l9_1588*1471343)+101146501))+1559861749)&2147483647;
int l9_1590=l9_1589;
int l9_1591=l9_1581*18919;
int l9_1592=((l9_1591*((l9_1591*1471343)+101146501))+1559861749)&2147483647;
int l9_1593=l9_1592;
int l9_1594=l9_1584;
float l9_1595=float(l9_1594)*4.6566129e-10;
int l9_1596=l9_1587;
float l9_1597=float(l9_1596)*4.6566129e-10;
int l9_1598=l9_1590;
float l9_1599=float(l9_1598)*4.6566129e-10;
int l9_1600=l9_1593;
float l9_1601=float(l9_1600)*4.6566129e-10;
float4 l9_1602=float4(l9_1595,l9_1597,l9_1599,l9_1601);
l9_1538=l9_1602;
}
}
}
float4 l9_1603=l9_1538;
float4 l9_1604=l9_1603;
float l9_1605=mix(l9_1527,l9_1528,l9_1604.x);
l9_1526=l9_1605;
float l9_1606=0.0;
l9_1606=l9_1526;
float l9_1607=0.0;
float l9_1608=(*sc_set0.UserUniforms).Port_Min_N019;
float l9_1609=(*sc_set0.UserUniforms).Port_Max_N019;
ssGlobals l9_1610=param_9;
int l9_1611=1;
bool l9_1612=false;
bool l9_1613=true;
bool l9_1614=true;
float l9_1615=19.0;
ssParticle l9_1616=gParticle;
float l9_1617=0.0;
float l9_1618=l9_1610.gTimeElapsed;
float4 l9_1619=float4(0.0);
float4 l9_1620=float4(0.0);
if (l9_1612)
{
l9_1620.x=floor(fract(l9_1618)*1000.0);
}
if (l9_1614)
{
l9_1620.y=float(l9_1616.Index1D^((l9_1616.Index1D*15299)+l9_1616.Index1D));
}
if (l9_1613)
{
l9_1620.z=l9_1615;
}
l9_1620.w=l9_1617*1000.0;
int l9_1621=int(l9_1620.x);
int l9_1622=int(l9_1620.y);
int l9_1623=int(l9_1620.z);
int l9_1624=int(l9_1620.w);
int l9_1625=(((l9_1621*15299)^(l9_1622*30133))^(l9_1623*17539))^(l9_1624*12113);
int l9_1626=l9_1625;
if (l9_1611==1)
{
int l9_1627=l9_1626;
int l9_1628=l9_1627;
int l9_1629=((l9_1628*((l9_1628*1471343)+101146501))+1559861749)&2147483647;
int l9_1630=l9_1629;
float l9_1631=float(l9_1630)*4.6566129e-10;
float l9_1632=l9_1631;
l9_1619.x=l9_1632;
}
else
{
if (l9_1611==2)
{
int l9_1633=l9_1626;
int l9_1634=l9_1633;
int l9_1635=((l9_1634*((l9_1634*1471343)+101146501))+1559861749)&2147483647;
int l9_1636=l9_1635;
int l9_1637=l9_1633*1399;
int l9_1638=((l9_1637*((l9_1637*1471343)+101146501))+1559861749)&2147483647;
int l9_1639=l9_1638;
int l9_1640=l9_1636;
float l9_1641=float(l9_1640)*4.6566129e-10;
int l9_1642=l9_1639;
float l9_1643=float(l9_1642)*4.6566129e-10;
float2 l9_1644=float2(l9_1641,l9_1643);
l9_1619=float4(l9_1644.x,l9_1644.y,l9_1619.z,l9_1619.w);
}
else
{
if (l9_1611==3)
{
int l9_1645=l9_1626;
int l9_1646=l9_1645;
int l9_1647=((l9_1646*((l9_1646*1471343)+101146501))+1559861749)&2147483647;
int l9_1648=l9_1647;
int l9_1649=l9_1645*1399;
int l9_1650=((l9_1649*((l9_1649*1471343)+101146501))+1559861749)&2147483647;
int l9_1651=l9_1650;
int l9_1652=l9_1645*7177;
int l9_1653=((l9_1652*((l9_1652*1471343)+101146501))+1559861749)&2147483647;
int l9_1654=l9_1653;
int l9_1655=l9_1648;
float l9_1656=float(l9_1655)*4.6566129e-10;
int l9_1657=l9_1651;
float l9_1658=float(l9_1657)*4.6566129e-10;
int l9_1659=l9_1654;
float l9_1660=float(l9_1659)*4.6566129e-10;
float3 l9_1661=float3(l9_1656,l9_1658,l9_1660);
l9_1619=float4(l9_1661.x,l9_1661.y,l9_1661.z,l9_1619.w);
}
else
{
int l9_1662=l9_1626;
int l9_1663=l9_1662;
int l9_1664=((l9_1663*((l9_1663*1471343)+101146501))+1559861749)&2147483647;
int l9_1665=l9_1664;
int l9_1666=l9_1662*1399;
int l9_1667=((l9_1666*((l9_1666*1471343)+101146501))+1559861749)&2147483647;
int l9_1668=l9_1667;
int l9_1669=l9_1662*7177;
int l9_1670=((l9_1669*((l9_1669*1471343)+101146501))+1559861749)&2147483647;
int l9_1671=l9_1670;
int l9_1672=l9_1662*18919;
int l9_1673=((l9_1672*((l9_1672*1471343)+101146501))+1559861749)&2147483647;
int l9_1674=l9_1673;
int l9_1675=l9_1665;
float l9_1676=float(l9_1675)*4.6566129e-10;
int l9_1677=l9_1668;
float l9_1678=float(l9_1677)*4.6566129e-10;
int l9_1679=l9_1671;
float l9_1680=float(l9_1679)*4.6566129e-10;
int l9_1681=l9_1674;
float l9_1682=float(l9_1681)*4.6566129e-10;
float4 l9_1683=float4(l9_1676,l9_1678,l9_1680,l9_1682);
l9_1619=l9_1683;
}
}
}
float4 l9_1684=l9_1619;
float4 l9_1685=l9_1684;
float l9_1686=mix(l9_1608,l9_1609,l9_1685.x);
l9_1607=l9_1686;
float l9_1687=0.0;
l9_1687=l9_1607;
float l9_1688=0.0;
l9_1688=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_1689=0.0;
l9_1689=mix(l9_1606,l9_1687,l9_1688);
param_7=l9_1689;
param_8=param_7;
}
Output_N71=param_8;
gParticle.Size=Output_N71;
float4 Value_N64=float4(0.0);
Value_N64=gParticle.Color;
float Value_N65=0.0;
Value_N65=(*sc_set0.UserUniforms).Port_Import_N065;
float Value_N74=0.0;
Value_N74=(*sc_set0.UserUniforms).Port_Import_N074;
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
float Value_N213=0.0;
Value_N213=Output_N187;
float Output_N214=0.0;
Output_N214=(*sc_set0.UserUniforms).Port_Input0_N214/(Value_N213+1.234e-06);
float Output_N215=0.0;
Output_N215=Value_N191*Output_N214;
float Output_N227=0.0;
Output_N227=fast::clamp(Output_N215+0.001,(*sc_set0.UserUniforms).Port_Input1_N227+0.001,(*sc_set0.UserUniforms).Port_Input2_N227+0.001)-0.001;
float Output_N232=0.0;
Output_N232=1.0-Value_N191;
float Value_N188=0.0;
Value_N188=(*sc_set0.UserUniforms).Port_Import_N188;
float Output_N189=0.0;
Output_N189=Value_N188/(Value_N186+1.234e-06);
float Value_N75=0.0;
Value_N75=Output_N189;
float Output_N9=0.0;
Output_N9=(*sc_set0.UserUniforms).Port_Input0_N009/(Value_N75+1.234e-06);
float Output_N10=0.0;
Output_N10=Output_N232*Output_N9;
float Output_N236=0.0;
Output_N236=fast::clamp(Output_N10+0.001,(*sc_set0.UserUniforms).Port_Input1_N236+0.001,(*sc_set0.UserUniforms).Port_Input2_N236+0.001)-0.001;
float Output_N11=0.0;
Output_N11=Output_N227*Output_N236;
float Export_N79=0.0;
Export_N79=Output_N11;
float Output_N239=0.0;
Output_N239=mix(Value_N65,Value_N74,Export_N79);
float4 Value_N242=float4(0.0);
Value_N242=float4(Value_N64.xyz.x,Value_N64.xyz.y,Value_N64.xyz.z,Value_N242.w);
Value_N242.w=Output_N239;
gParticle.Color=Value_N242;
float3x3 param_10=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_10);
float Drift=0.0049999999;
if (gParticle.Dead)
{
float4 param_11=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_11.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1690=param_11;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1691=dot(l9_1690,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1692=l9_1691;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1692;
}
}
float4 l9_1693=float4(param_11.x,-param_11.y,(param_11.z*0.5)+(param_11.w*0.5),param_11.w);
out.gl_Position=l9_1693;
return out;
}
float l9_1694;
if (abs(gParticle.Force.x)<Drift)
{
l9_1694=0.0;
}
else
{
l9_1694=gParticle.Force.x;
}
gParticle.Force.x=l9_1694;
float l9_1695;
if (abs(gParticle.Force.y)<Drift)
{
l9_1695=0.0;
}
else
{
l9_1695=gParticle.Force.y;
}
gParticle.Force.y=l9_1695;
float l9_1696;
if (abs(gParticle.Force.z)<Drift)
{
l9_1696=0.0;
}
else
{
l9_1696=gParticle.Force.z;
}
gParticle.Force.z=l9_1696;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_1697;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_1697=0.0;
}
else
{
l9_1697=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_1697;
float l9_1698;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_1698=0.0;
}
else
{
l9_1698=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_1698;
float l9_1699;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_1699=0.0;
}
else
{
l9_1699=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_1699;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(4.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_1700=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_1700;
int particleRow=512;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_1701;
if (v.texture0.x<0.5)
{
l9_1701=0.0;
}
else
{
l9_1701=QuadSize.x;
}
Vertex.x=l9_1701;
float l9_1702;
if (v.texture0.y<0.5)
{
l9_1702=0.0;
}
else
{
l9_1702=QuadSize.y;
}
Vertex.y=l9_1702;
Vertex+=Offset;
float4 param_12=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_12.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1703=param_12;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1704=dot(l9_1703,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1705=l9_1704;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1705;
}
}
float4 l9_1706=float4(param_12.x,-param_12.y,(param_12.z*0.5)+(param_12.w*0.5),param_12.w);
out.gl_Position=l9_1706;
int l9_1707=gl_InstanceIndex;
out.Interp_Particle_Index=l9_1707;
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
if (gParticle.Dead)
{
float4 param_13=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_13.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1708=param_13;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1709=dot(l9_1708,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_1710=l9_1709;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_1710;
}
}
float4 l9_1711=float4(param_13.x,-param_13.y,(param_13.z*0.5)+(param_13.w*0.5),param_13.w);
out.gl_Position=l9_1711;
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
float3 spawnPosition;
float3 directionPosition;
int pauseSpawn;
float4 noiseTexSize;
float2 noiseTexDepth;
float3 Port_Import_N216;
float Port_Input1_N014;
float3 Port_Min_N076;
float3 Port_Max_N076;
float Port_Import_N084;
float Port_Input1_N087;
float3 Port_Max_N088;
float Port_Import_N131;
float3 Port_Import_N132;
float Port_Input1_N158;
float Port_Input1_N162;
float Port_Min_N008;
float Port_Max_N008;
float Port_Import_N053;
float3 Port_Import_N054;
float Port_Import_N116;
float Port_Import_N117;
float Port_Import_N126;
float Port_Import_N127;
float Port_Import_N128;
float Port_Input4_N137;
float Port_Multiplier_N272;
float3 Port_Import_N026;
float3 Port_Import_N029;
float3 Port_Import_N030;
float Port_Multiplier_N031;
float3 Port_Import_N143;
float Port_Input1_N145;
float Port_Input1_N149;
float Port_Min_N020;
float Port_Max_N020;
float Port_Import_N034;
float Port_Min_N019;
float Port_Max_N019;
float Port_Import_N047;
float Port_Import_N065;
float Port_Import_N074;
float Port_Import_N191;
float Port_Input0_N214;
float Port_Import_N185;
float Port_Import_N213;
float Port_Input1_N227;
float Port_Input2_N227;
float Port_Input0_N009;
float Port_Import_N188;
float Port_Import_N075;
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
float l9_128=2.0;
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
float l9_146=2.0;
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
float l9_252=gParticle.Quaternion.x;
float l9_253=-1.0;
float l9_254=1.0;
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
float2 l9_267=l9_266.xy;
float2 l9_268=l9_267;
float2 l9_269=l9_268;
l9_1=float4(l9_269.x,l9_269.y,l9_1.z,l9_1.w);
l9_6=l9_1.x;
l9_7=l9_1.y;
float l9_270=gParticle.Quaternion.y;
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
l9_8=l9_1.x;
l9_9=l9_1.y;
float l9_288=gParticle.Quaternion.z;
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
l9_10=l9_1.x;
l9_11=l9_1.y;
float l9_306=gParticle.Quaternion.w;
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
l9_12=l9_1.x;
l9_13=l9_1.y;
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
