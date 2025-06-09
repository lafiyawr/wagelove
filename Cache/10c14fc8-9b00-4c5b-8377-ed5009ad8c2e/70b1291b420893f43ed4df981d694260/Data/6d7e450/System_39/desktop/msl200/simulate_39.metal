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
//ubo int UserUniforms 0:31:7472 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_StereoClipPlanes 3664:[2]:16
//int overrideTimeEnabled 3980
//float overrideTimeElapsed 3984:[32]:4
//float overrideTimeDelta 4112
//bool vfxBatchEnable 4120:[32]:4
//float4x4 vfxModelMatrix 4384:[32]:64
//int vfxOffsetInstancesRead 7108
//int vfxOffsetInstancesWrite 7112
//float2 vfxTargetSizeRead 7120
//float2 vfxTargetSizeWrite 7128
//int vfxTargetWidth 7136
//float3 planePos 7152
//float3 planeNorm 7168
//float3 Port_Import_N033 7184
//float3 Port_Min_N034 7200
//float3 Port_Max_N034 7216
//float Port_Min_N058 7232
//float Port_Max_N058 7236
//float Port_Import_N068 7240
//float3 Port_Import_N069 7248
//float3 Port_Import_N075 7264
//float3 Port_Import_N076 7280
//float Port_Import_N026 7296
//float Port_Import_N027 7300
//float Port_Import_N074 7304
//float4 Port_Value_N005 7312
//float Port_Import_N204 7328
//float Port_Input2_N206 7332
//float Port_Import_N044 7336
//float Port_Import_N045 7340
//float Port_Import_N046 7344
//float Port_Input4_N080 7348
//float Port_Multiplier_N272 7352
//float Port_Import_N121 7392
//float Port_Import_N122 7396
//float Port_Input1_N285 7400
//float Port_VelocityThreshold_N133 7408
//float Port_DefaultFloat_N134 7412
//float Port_Input1_N019 7416
//float4 Port_Min_N052 7424
//float4 Port_Max_N052 7440
//float4 Port_Input1_N017 7456
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
float gComponentTime;
};
struct N133_CollisionPlane
{
bool isColliding;
float3 velocity;
float3 position;
float3 force;
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
float3 planePos;
float3 planeNorm;
float3 Port_Import_N033;
float3 Port_Min_N034;
float3 Port_Max_N034;
float Port_Min_N058;
float Port_Max_N058;
float Port_Import_N068;
float3 Port_Import_N069;
float3 Port_Import_N075;
float3 Port_Import_N076;
float Port_Import_N026;
float Port_Import_N027;
float Port_Import_N074;
float4 Port_Value_N005;
float Port_Import_N204;
float Port_Input2_N206;
float Port_Import_N044;
float Port_Import_N045;
float Port_Import_N046;
float Port_Input4_N080;
float Port_Multiplier_N272;
float3 Port_Import_N118;
float3 Port_Import_N119;
float Port_Import_N121;
float Port_Import_N122;
float Port_Input1_N285;
float Port_Import_N128;
float Port_VelocityThreshold_N133;
float Port_DefaultFloat_N134;
float Port_Input1_N019;
float4 Port_Min_N052;
float4 Port_Max_N052;
float4 Port_Input1_N017;
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
float Interp_Particle_collisionCount_N134 [[user(locn22)]];
float Interp_Particle_Mass [[user(locn23)]];
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
int N133_OnCollision=0;
float3 N133_PlanePos=float3(0.0);
float3 N133_PlaneNormal=float3(0.0);
float N133_Bounciness=0.0;
float N133_Friction=0.0;
float N133_PlaneOffset=0.0;
float N133_CollisionCount=0.0;
float N133_VelocityThreshold=0.0;
float N133_SetCollisionCount=0.0;
float3 N133_SetForce=float3(0.0);
float3 N133_SetVelocity=float3(0.0);
float3 N133_SetPosition=float3(0.0);
float N133_KillParticle=0.0;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_4/60];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float Delay=0.0;
float Warmup=0.0;
gParticle.Age=mod((Globals.gTimeElapsedShifted-gParticle.SpawnOffset)+Warmup,13.3333);
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
float l9_14=gParticle.Life;
bool l9_15=l9_14<9.9999997e-05;
bool l9_16;
if (!l9_15)
{
l9_16=mod(((fast::max(Globals.gTimeElapsed,0.1)-gParticle.SpawnOffset)-Delay)+Warmup,13.3333)<=Globals.gTimeDelta;
}
else
{
l9_16=l9_15;
}
l9_13=l9_16;
}
else
{
l9_13=l9_12;
}
if (l9_13)
{
if (Globals.gTimeDelta!=0.0)
{
ssGlobals param_1=Globals;
ssParticle l9_17=gParticle;
int l9_18=int(gParticle.CopyId);
float l9_19;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_19=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_18];
}
else
{
l9_19=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_20=l9_19;
l9_17.Seed=(l9_17.Ratio1D*0.97637898)+0.151235;
l9_17.Seed+=(floor(((((l9_20-l9_17.SpawnOffset)-0.0)+0.0)+26.666599)/13.3333)*4.32723);
l9_17.Seed=fract(abs(l9_17.Seed));
int2 l9_21=int2(l9_17.Index1D%400,l9_17.Index1D/400);
l9_17.Seed2000=(float2(l9_21)+float2(1.0))/float2(399.0);
gParticle=l9_17;
float l9_22=7.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_22)))/l9_22)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_22))/l9_22)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=8.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
float3 l9_23=float3(0.0);
l9_23=(*sc_set0.UserUniforms).Port_Import_N033;
float3 l9_24=float3(0.0);
float3 l9_25=(*sc_set0.UserUniforms).Port_Min_N034;
float3 l9_26=(*sc_set0.UserUniforms).Port_Max_N034;
ssGlobals l9_27=param_1;
int l9_28=3;
bool l9_29=true;
bool l9_30=true;
bool l9_31=true;
float l9_32=34.0;
ssParticle l9_33=gParticle;
float l9_34=1.0;
float l9_35=l9_27.gTimeElapsed;
float4 l9_36=float4(0.0);
float4 l9_37=float4(1.0);
float l9_38=1.0;
float2 l9_39=float2(1.0);
if (l9_29)
{
l9_37=float4(fract(l9_35*10.0));
l9_37=floor(l9_37*10000.0)*9.9999997e-05;
l9_37=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_37;
}
if (l9_30)
{
l9_38=1.0+((l9_32+1.0)*0.0099999998);
}
if (l9_31)
{
l9_39=l9_33.Seed2000;
}
l9_34=(l9_34+1.0)*0.5;
if (l9_28>=1)
{
float2 l9_40=(((float2(0.2353,0.78750002)*l9_39)*l9_38)*l9_37.x)*l9_34;
float l9_41=dot(l9_40,float2(0.98253,0.72662002));
l9_41=sin(l9_41)*479.371;
l9_41=fract(l9_41);
l9_41=floor(l9_41*10000.0)*9.9999997e-05;
float l9_42=l9_41;
l9_36.x=l9_42;
}
if (l9_28>=2)
{
float2 l9_43=(((float2(0.5751,0.62730002)*l9_39)*l9_38)*l9_37.y)*l9_34;
float l9_44=dot(l9_43,float2(0.98253,0.72662002));
l9_44=sin(l9_44)*479.371;
l9_44=fract(l9_44);
l9_44=floor(l9_44*10000.0)*9.9999997e-05;
float l9_45=l9_44;
l9_36.y=l9_45;
}
if (l9_28>=3)
{
float2 l9_46=(((float2(0.6947,0.52170002)*l9_39)*l9_38)*l9_37.z)*l9_34;
float l9_47=dot(l9_46,float2(0.98253,0.72662002));
l9_47=sin(l9_47)*479.371;
l9_47=fract(l9_47);
l9_47=floor(l9_47*10000.0)*9.9999997e-05;
float l9_48=l9_47;
l9_36.z=l9_48;
}
if (l9_28>=4)
{
float2 l9_49=(((float2(0.47889999,0.39669999)*l9_39)*l9_38)*l9_37.w)*l9_34;
float l9_50=dot(l9_49,float2(0.98253,0.72662002));
l9_50=sin(l9_50)*479.371;
l9_50=fract(l9_50);
l9_50=floor(l9_50*10000.0)*9.9999997e-05;
float l9_51=l9_50;
l9_36.w=l9_51;
}
float4 l9_52=l9_36;
float4 l9_53=l9_52;
float3 l9_54=mix(l9_25,l9_26,l9_53.xyz);
l9_24=l9_54;
float l9_55=0.0;
l9_55=length(l9_24);
float3 l9_56=float3(0.0);
l9_56=l9_24/(float3(l9_55)+float3(1.234e-06));
float l9_57=0.0;
float l9_58=(*sc_set0.UserUniforms).Port_Min_N058;
float l9_59=(*sc_set0.UserUniforms).Port_Max_N058;
ssGlobals l9_60=param_1;
int l9_61=1;
bool l9_62=true;
bool l9_63=true;
bool l9_64=true;
float l9_65=58.0;
ssParticle l9_66=gParticle;
float l9_67=1.0;
float l9_68=l9_60.gTimeElapsed;
float4 l9_69=float4(0.0);
float4 l9_70=float4(1.0);
float l9_71=1.0;
float2 l9_72=float2(1.0);
if (l9_62)
{
l9_70=float4(fract(l9_68*10.0));
l9_70=floor(l9_70*10000.0)*9.9999997e-05;
l9_70=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_70;
}
if (l9_63)
{
l9_71=1.0+((l9_65+1.0)*0.0099999998);
}
if (l9_64)
{
l9_72=l9_66.Seed2000;
}
l9_67=(l9_67+1.0)*0.5;
if (l9_61>=1)
{
float2 l9_73=(((float2(0.2353,0.78750002)*l9_72)*l9_71)*l9_70.x)*l9_67;
float l9_74=dot(l9_73,float2(0.98253,0.72662002));
l9_74=sin(l9_74)*479.371;
l9_74=fract(l9_74);
l9_74=floor(l9_74*10000.0)*9.9999997e-05;
float l9_75=l9_74;
l9_69.x=l9_75;
}
if (l9_61>=2)
{
float2 l9_76=(((float2(0.5751,0.62730002)*l9_72)*l9_71)*l9_70.y)*l9_67;
float l9_77=dot(l9_76,float2(0.98253,0.72662002));
l9_77=sin(l9_77)*479.371;
l9_77=fract(l9_77);
l9_77=floor(l9_77*10000.0)*9.9999997e-05;
float l9_78=l9_77;
l9_69.y=l9_78;
}
if (l9_61>=3)
{
float2 l9_79=(((float2(0.6947,0.52170002)*l9_72)*l9_71)*l9_70.z)*l9_67;
float l9_80=dot(l9_79,float2(0.98253,0.72662002));
l9_80=sin(l9_80)*479.371;
l9_80=fract(l9_80);
l9_80=floor(l9_80*10000.0)*9.9999997e-05;
float l9_81=l9_80;
l9_69.z=l9_81;
}
if (l9_61>=4)
{
float2 l9_82=(((float2(0.47889999,0.39669999)*l9_72)*l9_71)*l9_70.w)*l9_67;
float l9_83=dot(l9_82,float2(0.98253,0.72662002));
l9_83=sin(l9_83)*479.371;
l9_83=fract(l9_83);
l9_83=floor(l9_83*10000.0)*9.9999997e-05;
float l9_84=l9_83;
l9_69.w=l9_84;
}
float4 l9_85=l9_69;
float4 l9_86=l9_85;
float l9_87=mix(l9_58,l9_59,l9_86.x);
l9_57=l9_87;
float l9_88=0.0;
float l9_89;
if (l9_57<=0.0)
{
l9_89=0.0;
}
else
{
l9_89=sqrt(l9_57);
}
l9_88=l9_89;
float l9_90=0.0;
float l9_91;
if (l9_88<=0.0)
{
l9_91=0.0;
}
else
{
l9_91=sqrt(l9_88);
}
l9_90=l9_91;
float l9_92=0.0;
l9_92=(*sc_set0.UserUniforms).Port_Import_N068;
float3 l9_93=float3(0.0);
l9_93=(*sc_set0.UserUniforms).Port_Import_N069;
float3 l9_94=float3(0.0);
l9_94=((l9_56*float3(l9_90))*float3(l9_92))*l9_93;
float3 l9_95=float3(0.0);
l9_95=l9_23+l9_94;
gParticle.Position=l9_95;
float3 l9_96=float3(0.0);
l9_96=(*sc_set0.UserUniforms).Port_Import_N075;
float3 l9_97=float3(0.0);
l9_97=(*sc_set0.UserUniforms).Port_Import_N076;
float3 l9_98=float3(0.0);
float3 l9_99=l9_96;
float3 l9_100=l9_97;
ssGlobals l9_101=param_1;
int l9_102=3;
bool l9_103=true;
bool l9_104=true;
bool l9_105=true;
float l9_106=77.0;
ssParticle l9_107=gParticle;
float l9_108=1.0;
float l9_109=l9_101.gTimeElapsed;
float4 l9_110=float4(0.0);
float4 l9_111=float4(1.0);
float l9_112=1.0;
float2 l9_113=float2(1.0);
if (l9_103)
{
l9_111=float4(fract(l9_109*10.0));
l9_111=floor(l9_111*10000.0)*9.9999997e-05;
l9_111=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_111;
}
if (l9_104)
{
l9_112=1.0+((l9_106+1.0)*0.0099999998);
}
if (l9_105)
{
l9_113=l9_107.Seed2000;
}
l9_108=(l9_108+1.0)*0.5;
if (l9_102>=1)
{
float2 l9_114=(((float2(0.2353,0.78750002)*l9_113)*l9_112)*l9_111.x)*l9_108;
float l9_115=dot(l9_114,float2(0.98253,0.72662002));
l9_115=sin(l9_115)*479.371;
l9_115=fract(l9_115);
l9_115=floor(l9_115*10000.0)*9.9999997e-05;
float l9_116=l9_115;
l9_110.x=l9_116;
}
if (l9_102>=2)
{
float2 l9_117=(((float2(0.5751,0.62730002)*l9_113)*l9_112)*l9_111.y)*l9_108;
float l9_118=dot(l9_117,float2(0.98253,0.72662002));
l9_118=sin(l9_118)*479.371;
l9_118=fract(l9_118);
l9_118=floor(l9_118*10000.0)*9.9999997e-05;
float l9_119=l9_118;
l9_110.y=l9_119;
}
if (l9_102>=3)
{
float2 l9_120=(((float2(0.6947,0.52170002)*l9_113)*l9_112)*l9_111.z)*l9_108;
float l9_121=dot(l9_120,float2(0.98253,0.72662002));
l9_121=sin(l9_121)*479.371;
l9_121=fract(l9_121);
l9_121=floor(l9_121*10000.0)*9.9999997e-05;
float l9_122=l9_121;
l9_110.z=l9_122;
}
if (l9_102>=4)
{
float2 l9_123=(((float2(0.47889999,0.39669999)*l9_113)*l9_112)*l9_111.w)*l9_108;
float l9_124=dot(l9_123,float2(0.98253,0.72662002));
l9_124=sin(l9_124)*479.371;
l9_124=fract(l9_124);
l9_124=floor(l9_124*10000.0)*9.9999997e-05;
float l9_125=l9_124;
l9_110.w=l9_125;
}
float4 l9_126=l9_110;
float4 l9_127=l9_126;
float3 l9_128=mix(l9_99,l9_100,l9_127.xyz);
l9_98=l9_128;
gParticle.Velocity+=l9_98;
float l9_129=0.0;
l9_129=(*sc_set0.UserUniforms).Port_Import_N026;
float l9_130=0.0;
l9_130=(*sc_set0.UserUniforms).Port_Import_N027;
float l9_131=0.0;
float l9_132=l9_129;
float l9_133=l9_130;
ssGlobals l9_134=param_1;
int l9_135=1;
bool l9_136=true;
bool l9_137=true;
bool l9_138=true;
float l9_139=28.0;
ssParticle l9_140=gParticle;
float l9_141=1.0;
float l9_142=l9_134.gTimeElapsed;
float4 l9_143=float4(0.0);
float4 l9_144=float4(1.0);
float l9_145=1.0;
float2 l9_146=float2(1.0);
if (l9_136)
{
l9_144=float4(fract(l9_142*10.0));
l9_144=floor(l9_144*10000.0)*9.9999997e-05;
l9_144=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_144;
}
if (l9_137)
{
l9_145=1.0+((l9_139+1.0)*0.0099999998);
}
if (l9_138)
{
l9_146=l9_140.Seed2000;
}
l9_141=(l9_141+1.0)*0.5;
if (l9_135>=1)
{
float2 l9_147=(((float2(0.2353,0.78750002)*l9_146)*l9_145)*l9_144.x)*l9_141;
float l9_148=dot(l9_147,float2(0.98253,0.72662002));
l9_148=sin(l9_148)*479.371;
l9_148=fract(l9_148);
l9_148=floor(l9_148*10000.0)*9.9999997e-05;
float l9_149=l9_148;
l9_143.x=l9_149;
}
if (l9_135>=2)
{
float2 l9_150=(((float2(0.5751,0.62730002)*l9_146)*l9_145)*l9_144.y)*l9_141;
float l9_151=dot(l9_150,float2(0.98253,0.72662002));
l9_151=sin(l9_151)*479.371;
l9_151=fract(l9_151);
l9_151=floor(l9_151*10000.0)*9.9999997e-05;
float l9_152=l9_151;
l9_143.y=l9_152;
}
if (l9_135>=3)
{
float2 l9_153=(((float2(0.6947,0.52170002)*l9_146)*l9_145)*l9_144.z)*l9_141;
float l9_154=dot(l9_153,float2(0.98253,0.72662002));
l9_154=sin(l9_154)*479.371;
l9_154=fract(l9_154);
l9_154=floor(l9_154*10000.0)*9.9999997e-05;
float l9_155=l9_154;
l9_143.z=l9_155;
}
if (l9_135>=4)
{
float2 l9_156=(((float2(0.47889999,0.39669999)*l9_146)*l9_145)*l9_144.w)*l9_141;
float l9_157=dot(l9_156,float2(0.98253,0.72662002));
l9_157=sin(l9_157)*479.371;
l9_157=fract(l9_157);
l9_157=floor(l9_157*10000.0)*9.9999997e-05;
float l9_158=l9_157;
l9_143.w=l9_158;
}
float4 l9_159=l9_143;
float4 l9_160=l9_159;
float l9_161=mix(l9_132,l9_133,l9_160.x);
l9_131=l9_161;
float l9_162=l9_131;
gParticle.Mass=l9_162;
gParticle.Mass=fast::max(9.9999997e-06,gParticle.Mass);
float l9_163=0.0;
l9_163=gParticle.Mass;
float l9_164=0.0;
float l9_165;
if (l9_163<=0.0)
{
l9_165=0.0;
}
else
{
l9_165=sqrt(l9_163);
}
l9_164=l9_165;
float l9_166=0.0;
l9_166=(*sc_set0.UserUniforms).Port_Import_N074;
float l9_167=0.0;
l9_167=l9_164*l9_166;
gParticle.Size=l9_167;
gParticle.Color=(*sc_set0.UserUniforms).Port_Value_N005;
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
int l9_168=gl_InstanceIndex;
gParticle.Position=((*sc_set0.UserUniforms).vfxModelMatrix[l9_168/60]*float4(gParticle.Position,1.0)).xyz;
int l9_169=gl_InstanceIndex;
int l9_170=l9_169/60;
gParticle.Velocity=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_170][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_170][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_170][2].xyz)*gParticle.Velocity;
int l9_171=gl_InstanceIndex;
int l9_172=l9_171/60;
gParticle.Force=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_172][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_172][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_172][2].xyz)*gParticle.Force;
int l9_173=gl_InstanceIndex;
int l9_174=gl_InstanceIndex;
int l9_175=gl_InstanceIndex;
gParticle.Size=fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_173/60][0].xyz),fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_174/60][1].xyz),length((*sc_set0.UserUniforms).vfxModelMatrix[l9_175/60][2].xyz)))*gParticle.Size;
int l9_176=gl_InstanceIndex;
int l9_177=l9_176/60;
gParticle.Matrix=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_177][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_177][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_177][2].xyz)*gParticle.Matrix;
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
float4 l9_178=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_179=dot(l9_178,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_180=l9_179;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_180;
}
}
float4 l9_181=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_181;
return out;
}
float Value_N204=0.0;
Value_N204=(*sc_set0.UserUniforms).Port_Import_N204;
float Value_N205=0.0;
Value_N205=gParticle.Mass;
float Output_N206=0.0;
Output_N206=(Value_N204*Value_N205)*(*sc_set0.UserUniforms).Port_Input2_N206;
float3 Output_N207=float3(0.0);
Output_N207=float3(0.0,Output_N206,0.0);
gParticle.Force+=Output_N207;
float Value_N44=0.0;
Value_N44=(*sc_set0.UserUniforms).Port_Import_N044;
float Value_N45=0.0;
Value_N45=(*sc_set0.UserUniforms).Port_Import_N045;
float Value_N46=0.0;
Value_N46=(*sc_set0.UserUniforms).Port_Import_N046;
float3 Value_N78=float3(0.0);
Value_N78=gParticle.Velocity;
float3 Output_N264=float3(0.0);
Output_N264=-Value_N78;
float Output_N265=0.0;
Output_N265=length(Value_N78);
float3 Output_N79=float3(0.0);
Output_N79=Output_N264*float3(Output_N265);
float3 Output_N80=float3(0.0);
Output_N80=(((float3(Value_N44)*float3(Value_N45))*float3(Value_N46))*Output_N79)*float3((*sc_set0.UserUniforms).Port_Input4_N080);
float3 Value_N81=float3(0.0);
Value_N81=gParticle.Velocity;
float Value_N82=0.0;
Value_N82=gParticle.Mass;
float3 Output_N83=float3(0.0);
Output_N83=Value_N81*float3(Value_N82);
float3 Output_N84=float3(0.0);
Output_N84=abs(Output_N83);
float Time_N272=0.0;
Time_N272=Globals.gTimeDelta*(*sc_set0.UserUniforms).Port_Multiplier_N272;
float3 Output_N273=float3(0.0);
Output_N273=Output_N84/(float3(Time_N272)+float3(1.234e-06));
float3 Output_N274=float3(0.0);
Output_N274=-Output_N273;
float3 Output_N275=float3(0.0);
Output_N275=fast::clamp(Output_N80,Output_N274,Output_N273);
gParticle.Force+=Output_N275;
float Value_N116=0.0;
Value_N116=0.0;
float3 Output_N234=float3(0.0);
float3 param_3=(*sc_set0.UserUniforms).planePos;
Output_N234=param_3;
float3 Value_N118=float3(0.0);
Value_N118=Output_N234;
float3 Output_N257=float3(0.0);
float3 param_4=(*sc_set0.UserUniforms).planeNorm;
Output_N257=param_4;
float3 Value_N119=float3(0.0);
Value_N119=Output_N257;
float Value_N121=0.0;
Value_N121=fast::clamp((*sc_set0.UserUniforms).Port_Import_N121,0.0,1.0);
float Value_N122=0.0;
Value_N122=fast::clamp((*sc_set0.UserUniforms).Port_Import_N122,0.0,1.0);
float Value_N284=0.0;
Value_N284=gParticle.Size;
float Output_N285=0.0;
Output_N285=Value_N284*(*sc_set0.UserUniforms).Port_Input1_N285;
float Value_N128=0.0;
Value_N128=Output_N285;
float Value_N129=0.0;
Value_N129=gParticle.collisionCount_N134;
float SetCollisionCount_N133=0.0;
float3 SetForce_N133=float3(0.0);
float3 SetVelocity_N133=float3(0.0);
float3 SetPosition_N133=float3(0.0);
float KillParticle_N133=0.0;
float param_5=Value_N116;
float3 param_6=Value_N118;
float3 param_7=Value_N119;
float param_8=Value_N121;
float param_9=Value_N122;
float param_10=Value_N128;
float param_11=Value_N129;
float param_12=(*sc_set0.UserUniforms).Port_VelocityThreshold_N133;
ssGlobals param_18=Globals;
ssGlobals tempGlobals=param_18;
float param_13=0.0;
float3 param_14=float3(0.0);
float3 param_15=float3(0.0);
float3 param_16=float3(0.0);
float param_17=0.0;
N133_OnCollision=int(param_5);
N133_PlanePos=param_6;
N133_PlaneNormal=param_7;
N133_Bounciness=param_8;
N133_Friction=param_9;
N133_PlaneOffset=param_10;
N133_CollisionCount=param_11;
N133_VelocityThreshold=param_12;
N133_CollisionPlane l9_183;
N133_CollisionPlane l9_184=l9_183;
l9_184.isColliding=false;
float3 l9_185=gParticle.Velocity;
l9_184.velocity=l9_185;
float3 l9_186=gParticle.Force;
l9_184.force=l9_186;
float3 l9_187=gParticle.Position;
l9_184.position=l9_187;
float3 l9_188=gParticle.Velocity;
float3 l9_189=gParticle.Force;
float l9_190=gParticle.Mass;
float l9_191=tempGlobals.gTimeDelta;
float3 l9_192=l9_188+((l9_189/float3(fast::max(9.9999997e-06,l9_190)))*float3(l9_191));
float l9_193=tempGlobals.gTimeDelta;
float3 l9_194=gParticle.Position;
float3 l9_195=(l9_192*float3(l9_193))+l9_194;
float3 l9_196=l9_195;
float3 l9_197=normalize(N133_PlaneNormal);
float l9_198=dot(l9_197,l9_196-N133_PlanePos)-N133_PlaneOffset;
if (l9_198<0.0)
{
l9_184.isColliding=true;
float3 l9_199=l9_197;
float l9_200=N133_Bounciness;
float l9_201=N133_Friction;
float3 l9_202=gParticle.Velocity;
float3 l9_203=l9_199*dot(l9_199,l9_202);
float3 l9_204=gParticle.Velocity;
float3 l9_205=l9_204-l9_203;
l9_205*=(1.0-l9_201);
l9_203*=l9_200;
float3 l9_206=l9_205-l9_203;
l9_184.velocity=l9_206;
l9_184.force*=float(length(l9_184.velocity)>N133_VelocityThreshold);
float3 l9_207=gParticle.Position;
float l9_208=dot(l9_197,l9_207-N133_PlanePos)-N133_PlaneOffset;
l9_184.position+=(l9_197*(-l9_208));
}
N133_CollisionPlane l9_209=l9_184;
l9_183=l9_209;
N133_KillParticle=0.0;
N133_SetCollisionCount=floor(N133_CollisionCount);
if (l9_183.isColliding)
{
N133_SetCollisionCount+=1.0;
}
N133_SetPosition=l9_183.position;
N133_SetForce=l9_183.force;
N133_SetVelocity=l9_183.velocity;
if ((N133_OnCollision==1)&&(N133_SetCollisionCount>0.0))
{
N133_SetForce=float3(0.0);
N133_SetVelocity=float3(0.0);
}
if ((N133_OnCollision==2)&&(N133_SetCollisionCount>0.0))
{
N133_KillParticle=1.0;
}
param_13=N133_SetCollisionCount;
param_14=N133_SetForce;
param_15=N133_SetVelocity;
param_16=N133_SetPosition;
param_17=N133_KillParticle;
SetCollisionCount_N133=param_13;
SetForce_N133=param_14;
SetVelocity_N133=param_15;
SetPosition_N133=param_16;
KillParticle_N133=param_17;
float param_19=SetCollisionCount_N133;
float param_20=(*sc_set0.UserUniforms).Port_DefaultFloat_N134;
if (gParticle.Spawned)
{
gParticle.collisionCount_N134=param_20;
}
else
{
gParticle.collisionCount_N134=param_19;
}
gParticle.Force=SetForce_N133;
gParticle.Velocity=SetVelocity_N133;
gParticle.Position=SetPosition_N133;
float param_21=KillParticle_N133;
if ((param_21*1.0)!=0.0)
{
gParticle.Dead=true;
}
float4 Output_N54=float4(0.0);
float param_22=1.0;
float4 param_23=float4(1.0);
float4 param_24=float4(0.0);
ssGlobals param_26=Globals;
float l9_210=0.0;
l9_210=gParticle.collisionCount_N134;
float l9_211=0.0;
l9_211=floor(l9_210);
float l9_212=0.0;
l9_212=float(l9_211==(*sc_set0.UserUniforms).Port_Input1_N019);
param_22=l9_212;
float4 param_25;
if ((param_22*1.0)!=0.0)
{
float4 l9_213=float4(0.0);
float4 l9_214=(*sc_set0.UserUniforms).Port_Min_N052;
float4 l9_215=(*sc_set0.UserUniforms).Port_Max_N052;
ssGlobals l9_216=param_26;
int l9_217=4;
bool l9_218=false;
bool l9_219=true;
bool l9_220=true;
float l9_221=52.0;
ssParticle l9_222=gParticle;
float l9_223=1.0;
float l9_224=l9_216.gTimeElapsed;
float4 l9_225=float4(0.0);
float4 l9_226=float4(1.0);
float l9_227=1.0;
float2 l9_228=float2(1.0);
if (l9_218)
{
l9_226=float4(fract(l9_224*10.0));
l9_226=floor(l9_226*10000.0)*9.9999997e-05;
l9_226=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_226;
}
if (l9_219)
{
l9_227=1.0+((l9_221+1.0)*0.0099999998);
}
if (l9_220)
{
l9_228=l9_222.Seed2000;
}
l9_223=(l9_223+1.0)*0.5;
if (l9_217>=1)
{
float2 l9_229=(((float2(0.2353,0.78750002)*l9_228)*l9_227)*l9_226.x)*l9_223;
float l9_230=dot(l9_229,float2(0.98253,0.72662002));
l9_230=sin(l9_230)*479.371;
l9_230=fract(l9_230);
l9_230=floor(l9_230*10000.0)*9.9999997e-05;
float l9_231=l9_230;
l9_225.x=l9_231;
}
if (l9_217>=2)
{
float2 l9_232=(((float2(0.5751,0.62730002)*l9_228)*l9_227)*l9_226.y)*l9_223;
float l9_233=dot(l9_232,float2(0.98253,0.72662002));
l9_233=sin(l9_233)*479.371;
l9_233=fract(l9_233);
l9_233=floor(l9_233*10000.0)*9.9999997e-05;
float l9_234=l9_233;
l9_225.y=l9_234;
}
if (l9_217>=3)
{
float2 l9_235=(((float2(0.6947,0.52170002)*l9_228)*l9_227)*l9_226.z)*l9_223;
float l9_236=dot(l9_235,float2(0.98253,0.72662002));
l9_236=sin(l9_236)*479.371;
l9_236=fract(l9_236);
l9_236=floor(l9_236*10000.0)*9.9999997e-05;
float l9_237=l9_236;
l9_225.z=l9_237;
}
if (l9_217>=4)
{
float2 l9_238=(((float2(0.47889999,0.39669999)*l9_228)*l9_227)*l9_226.w)*l9_223;
float l9_239=dot(l9_238,float2(0.98253,0.72662002));
l9_239=sin(l9_239)*479.371;
l9_239=fract(l9_239);
l9_239=floor(l9_239*10000.0)*9.9999997e-05;
float l9_240=l9_239;
l9_225.w=l9_240;
}
float4 l9_241=l9_225;
float4 l9_242=l9_241;
float4 l9_243=mix(l9_214,l9_215,l9_242);
l9_213=l9_243;
param_23=l9_213;
param_25=param_23;
}
else
{
float4 l9_244=float4(0.0);
float4 l9_245=(*sc_set0.UserUniforms).Port_Min_N052;
float4 l9_246=(*sc_set0.UserUniforms).Port_Max_N052;
ssGlobals l9_247=param_26;
int l9_248=4;
bool l9_249=false;
bool l9_250=true;
bool l9_251=true;
float l9_252=52.0;
ssParticle l9_253=gParticle;
float l9_254=1.0;
float l9_255=l9_247.gTimeElapsed;
float4 l9_256=float4(0.0);
float4 l9_257=float4(1.0);
float l9_258=1.0;
float2 l9_259=float2(1.0);
if (l9_249)
{
l9_257=float4(fract(l9_255*10.0));
l9_257=floor(l9_257*10000.0)*9.9999997e-05;
l9_257=float4(0.32339999,0.65740001,0.22579999,0.87629998)+l9_257;
}
if (l9_250)
{
l9_258=1.0+((l9_252+1.0)*0.0099999998);
}
if (l9_251)
{
l9_259=l9_253.Seed2000;
}
l9_254=(l9_254+1.0)*0.5;
if (l9_248>=1)
{
float2 l9_260=(((float2(0.2353,0.78750002)*l9_259)*l9_258)*l9_257.x)*l9_254;
float l9_261=dot(l9_260,float2(0.98253,0.72662002));
l9_261=sin(l9_261)*479.371;
l9_261=fract(l9_261);
l9_261=floor(l9_261*10000.0)*9.9999997e-05;
float l9_262=l9_261;
l9_256.x=l9_262;
}
if (l9_248>=2)
{
float2 l9_263=(((float2(0.5751,0.62730002)*l9_259)*l9_258)*l9_257.y)*l9_254;
float l9_264=dot(l9_263,float2(0.98253,0.72662002));
l9_264=sin(l9_264)*479.371;
l9_264=fract(l9_264);
l9_264=floor(l9_264*10000.0)*9.9999997e-05;
float l9_265=l9_264;
l9_256.y=l9_265;
}
if (l9_248>=3)
{
float2 l9_266=(((float2(0.6947,0.52170002)*l9_259)*l9_258)*l9_257.z)*l9_254;
float l9_267=dot(l9_266,float2(0.98253,0.72662002));
l9_267=sin(l9_267)*479.371;
l9_267=fract(l9_267);
l9_267=floor(l9_267*10000.0)*9.9999997e-05;
float l9_268=l9_267;
l9_256.z=l9_268;
}
if (l9_248>=4)
{
float2 l9_269=(((float2(0.47889999,0.39669999)*l9_259)*l9_258)*l9_257.w)*l9_254;
float l9_270=dot(l9_269,float2(0.98253,0.72662002));
l9_270=sin(l9_270)*479.371;
l9_270=fract(l9_270);
l9_270=floor(l9_270*10000.0)*9.9999997e-05;
float l9_271=l9_270;
l9_256.w=l9_271;
}
float4 l9_272=l9_256;
float4 l9_273=l9_272;
float4 l9_274=mix(l9_245,l9_246,l9_273);
l9_244=l9_274;
float4 l9_275=float4(0.0);
l9_275=l9_244*(*sc_set0.UserUniforms).Port_Input1_N017;
param_24=l9_275;
param_25=param_24;
}
Output_N54=param_25;
gParticle.Color=Output_N54;
float3x3 param_27=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_27);
float Drift=0.0049999999;
if (gParticle.Dead)
{
float4 param_28=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_28.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_276=param_28;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_277=dot(l9_276,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_278=l9_277;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_278;
}
}
float4 l9_279=float4(param_28.x,-param_28.y,(param_28.z*0.5)+(param_28.w*0.5),param_28.w);
out.gl_Position=l9_279;
return out;
}
float l9_280;
if (abs(gParticle.Force.x)<Drift)
{
l9_280=0.0;
}
else
{
l9_280=gParticle.Force.x;
}
gParticle.Force.x=l9_280;
float l9_281;
if (abs(gParticle.Force.y)<Drift)
{
l9_281=0.0;
}
else
{
l9_281=gParticle.Force.y;
}
gParticle.Force.y=l9_281;
float l9_282;
if (abs(gParticle.Force.z)<Drift)
{
l9_282=0.0;
}
else
{
l9_282=gParticle.Force.z;
}
gParticle.Force.z=l9_282;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_283;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_283=0.0;
}
else
{
l9_283=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_283;
float l9_284;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_284=0.0;
}
else
{
l9_284=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_284;
float l9_285;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_285=0.0;
}
else
{
l9_285=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_285;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(5.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_286=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_286;
int particleRow=409;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_287;
if (v.texture0.x<0.5)
{
l9_287=0.0;
}
else
{
l9_287=QuadSize.x;
}
Vertex.x=l9_287;
float l9_288;
if (v.texture0.y<0.5)
{
l9_288=0.0;
}
else
{
l9_288=QuadSize.y;
}
Vertex.y=l9_288;
Vertex+=Offset;
float4 param_29=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_29.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_289=param_29;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_290=dot(l9_289,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_291=l9_290;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_291;
}
}
float4 l9_292=float4(param_29.x,-param_29.y,(param_29.z*0.5)+(param_29.w*0.5),param_29.w);
out.gl_Position=l9_292;
int l9_293=gl_InstanceIndex;
out.Interp_Particle_Index=l9_293;
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
out.Interp_Particle_collisionCount_N134=gParticle.collisionCount_N134;
out.Interp_Particle_Mass=gParticle.Mass;
if (gParticle.Dead)
{
float4 param_30=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_30.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_294=param_30;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_295=dot(l9_294,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_296=l9_295;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_296;
}
}
float4 l9_297=float4(param_30.x,-param_30.y,(param_30.z*0.5)+(param_30.w*0.5),param_30.w);
out.gl_Position=l9_297;
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
float3 planePos;
float3 planeNorm;
float3 Port_Import_N033;
float3 Port_Min_N034;
float3 Port_Max_N034;
float Port_Min_N058;
float Port_Max_N058;
float Port_Import_N068;
float3 Port_Import_N069;
float3 Port_Import_N075;
float3 Port_Import_N076;
float Port_Import_N026;
float Port_Import_N027;
float Port_Import_N074;
float4 Port_Value_N005;
float Port_Import_N204;
float Port_Input2_N206;
float Port_Import_N044;
float Port_Import_N045;
float Port_Import_N046;
float Port_Input4_N080;
float Port_Multiplier_N272;
float3 Port_Import_N118;
float3 Port_Import_N119;
float Port_Import_N121;
float Port_Import_N122;
float Port_Input1_N285;
float Port_Import_N128;
float Port_VelocityThreshold_N133;
float Port_DefaultFloat_N134;
float Port_Input1_N019;
float4 Port_Min_N052;
float4 Port_Max_N052;
float4 Port_Input1_N017;
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
float Interp_Particle_collisionCount_N134 [[user(locn22)]];
float Interp_Particle_Mass [[user(locn23)]];
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
gParticle.collisionCount_N134=in.Interp_Particle_collisionCount_N134;
gParticle.Mass=in.Interp_Particle_Mass;
gParticle.SpawnIndex=in.Interp_Particle_SpawnIndex;
gParticle.NextBurstTime=in.Interp_Particle_NextBurstTime;
float2 param=in.Interp_Particle_Coord;
int l9_0=int(floor(param.x*5.0));
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
else
{
if (l9_0==4)
{
float l9_342=gParticle.collisionCount_N134;
float l9_343=0.0;
float l9_344=255.0;
float l9_345=fast::clamp(l9_342,l9_343,l9_344);
float l9_346=l9_343;
float l9_347=l9_344;
float l9_348=0.0;
float l9_349=1.0;
float l9_350=l9_348+(((l9_345-l9_346)*(l9_349-l9_348))/(l9_347-l9_346));
float l9_351=l9_350;
l9_1.x=l9_351;
l9_2=l9_1.x;
}
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
