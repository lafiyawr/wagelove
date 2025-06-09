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
//ubo int UserUniforms 0:31:7456 {
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
//float3 Port_Import_N069 7152
//float2 Port_Min_N117 7168
//float2 Port_Max_N117 7176
//float Port_Import_N120 7184
//float Port_Input1_N122 7188
//float Port_Max_N131 7192
//float Port_Import_N146 7196
//float3 Port_Import_N156 7200
//float3 Port_Import_N071 7216
//float3 Port_Import_N073 7232
//float3 Port_Import_N318 7248
//float Port_Multiplier_N319 7264
//float3 Port_Import_N322 7280
//float2 Port_Input1_N326 7296
//float2 Port_Scale_N327 7304
//float2 Port_Input1_N329 7312
//float2 Port_Scale_N330 7320
//float2 Port_Input1_N332 7328
//float2 Port_Scale_N333 7336
//float3 Port_Input1_N335 7344
//float Port_Import_N134 7360
//float Port_Input2_N136 7364
//float Port_Import_N009 7368
//float Port_Import_N010 7372
//float Port_Input0_N214 7380
//float Port_Import_N012 7384
//float Port_Input1_N076 7392
//float Port_Input2_N076 7396
//float Port_Input0_N079 7400
//float Port_Import_N064 7404
//float Port_Input1_N081 7412
//float Port_Input2_N081 7416
//float Port_Import_N126 7420
//float Port_Import_N127 7424
//float Port_Import_N128 7428
//float Port_Input4_N137 7432
//float Port_Multiplier_N272 7436
//float Port_Import_N047 7440
//float Port_Import_N048 7444
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
float3 Port_Import_N069;
float2 Port_Min_N117;
float2 Port_Max_N117;
float Port_Import_N120;
float Port_Input1_N122;
float Port_Max_N131;
float Port_Import_N146;
float3 Port_Import_N156;
float3 Port_Import_N071;
float3 Port_Import_N073;
float3 Port_Import_N318;
float Port_Multiplier_N319;
float3 Port_Import_N322;
float2 Port_Input1_N326;
float2 Port_Scale_N327;
float2 Port_Input1_N329;
float2 Port_Scale_N330;
float2 Port_Input1_N332;
float2 Port_Scale_N333;
float3 Port_Input1_N335;
float Port_Import_N134;
float Port_Input2_N136;
float Port_Import_N009;
float Port_Import_N010;
float Port_Import_N075;
float Port_Input0_N214;
float Port_Import_N012;
float Port_Import_N213;
float Port_Input1_N076;
float Port_Input2_N076;
float Port_Input0_N079;
float Port_Import_N064;
float Port_Import_N078;
float Port_Input1_N081;
float Port_Input2_N081;
float Port_Import_N126;
float Port_Import_N127;
float Port_Import_N128;
float Port_Input4_N137;
float Port_Multiplier_N272;
float Port_Import_N047;
float Port_Import_N048;
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
gParticle.CopyId=float(InstanceID/25);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int param=InstanceID;
ssParticle param_1=gParticle;
int l9_0=param/25;
param_1.Spawned=false;
param_1.Dead=false;
param_1.Force=float3(0.0);
param_1.Index1D=param;
param_1.Index1DPerCopy=param%25;
param_1.Index1DPerCopyF=float(param_1.Index1DPerCopy);
param_1.StateID=(25*((param/25)+1))-1;
int l9_1=param_1.Index1D;
int2 l9_2=int2(l9_1%25,l9_1/25);
param_1.Index2D=l9_2;
int l9_3=param_1.Index1D;
float l9_4=(float(l9_3)+0.5)/25.0;
param_1.Coord1D=l9_4;
int2 l9_5=param_1.Index2D;
float2 l9_6=(float2(l9_5)+float2(0.5))/float2(25.0,1.0);
param_1.Coord2D=l9_6;
int l9_7=param_1.Index1D;
float l9_8=float(l9_7)/24.0;
param_1.Ratio1D=l9_8;
int l9_9=param_1.Index1DPerCopy;
float l9_10=float(l9_9)/24.0;
param_1.Ratio1DPerCopy=l9_10;
int2 l9_11=param_1.Index2D;
float2 l9_12=float2(l9_11)/float2(24.0,1.0);
param_1.Ratio2D=l9_12;
param_1.Seed=0.0;
int l9_13=param_1.Index1D;
int l9_14=l9_13;
int l9_15=((l9_14*((l9_14*1471343)+101146501))+1559861749)&2147483647;
int l9_16=l9_15;
float l9_17=float(l9_16)*4.6566129e-10;
float l9_18=l9_17;
param_1.TimeShift=l9_18;
param_1.SpawnOffset=param_1.Ratio1D*5.0;
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
l9_19.Seed+=(floor(((((l9_22-l9_19.SpawnOffset)-0.0)+0.0)+10.0)/5.0)*4.32723);
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
l9_61=!(UserUniforms.vfxBatchEnable[l9_62/25]!=0);
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
float param_32=5.0;
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
float param_35=5.0;
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
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_4/25];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
float Delay=0.0;
float Warmup=0.0;
gParticle.Age=mod((Globals.gTimeElapsedShifted-gParticle.SpawnOffset)+Warmup,5.0);
float l9_5=Globals.gTimeElapsed;
float l9_6=gParticle.SpawnOffset;
float l9_7=Delay;
float l9_8=Warmup;
bool l9_9=(l9_5-l9_6)<(l9_7-l9_8);
bool l9_10;
if (!l9_9)
{
l9_10=gParticle.Age>5.0;
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
l9_14=mod(((fast::max(Globals.gTimeElapsed,0.1)-gParticle.SpawnOffset)-Delay)+Warmup,5.0)<=Globals.gTimeDelta;
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
l9_15.Seed+=(floor(((((l9_18-l9_15.SpawnOffset)-0.0)+0.0)+10.0)/5.0)*4.32723);
l9_15.Seed=fract(abs(l9_15.Seed));
int2 l9_19=int2(l9_15.Index1D%400,l9_15.Index1D/400);
l9_15.Seed2000=(float2(l9_19)+float2(1.0))/float2(399.0);
gParticle=l9_15;
float l9_20=5.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_20)))/l9_20)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_20))/l9_20)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=5.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
float3 l9_21=float3(0.0);
l9_21=(*sc_set0.UserUniforms).Port_Import_N069;
float3 l9_22=float3(0.0);
float l9_23=0.0;
float3 l9_24=float3(0.0);
float3 l9_25=float3(0.0);
float3 l9_26=float3(0.0);
float3 l9_27=float3(0.0);
ssGlobals l9_28=param_1;
float l9_29=0.0;
l9_29=1.0;
l9_23=l9_29;
l9_23=floor(l9_23);
float3 l9_30;
if (l9_23==0.0)
{
float2 l9_31=float2(0.0);
float2 l9_32=(*sc_set0.UserUniforms).Port_Min_N117;
float2 l9_33=(*sc_set0.UserUniforms).Port_Max_N117;
ssGlobals l9_34=l9_28;
int l9_35=2;
bool l9_36=true;
bool l9_37=true;
bool l9_38=true;
float l9_39=117.0;
ssParticle l9_40=gParticle;
float l9_41=0.0;
float l9_42=l9_34.gTimeElapsed;
float4 l9_43=float4(0.0);
float4 l9_44=float4(0.0);
if (l9_36)
{
l9_44.x=floor(fract(l9_42)*1000.0);
}
if (l9_38)
{
l9_44.y=float(l9_40.Index1D^((l9_40.Index1D*15299)+l9_40.Index1D));
}
if (l9_37)
{
l9_44.z=l9_39;
}
l9_44.w=l9_41*1000.0;
int l9_45=int(l9_44.x);
int l9_46=int(l9_44.y);
int l9_47=int(l9_44.z);
int l9_48=int(l9_44.w);
int l9_49=(((l9_45*15299)^(l9_46*30133))^(l9_47*17539))^(l9_48*12113);
int l9_50=l9_49;
if (l9_35==1)
{
int l9_51=l9_50;
int l9_52=l9_51;
int l9_53=((l9_52*((l9_52*1471343)+101146501))+1559861749)&2147483647;
int l9_54=l9_53;
float l9_55=float(l9_54)*4.6566129e-10;
float l9_56=l9_55;
l9_43.x=l9_56;
}
else
{
if (l9_35==2)
{
int l9_57=l9_50;
int l9_58=l9_57;
int l9_59=((l9_58*((l9_58*1471343)+101146501))+1559861749)&2147483647;
int l9_60=l9_59;
int l9_61=l9_57*1399;
int l9_62=((l9_61*((l9_61*1471343)+101146501))+1559861749)&2147483647;
int l9_63=l9_62;
int l9_64=l9_60;
float l9_65=float(l9_64)*4.6566129e-10;
int l9_66=l9_63;
float l9_67=float(l9_66)*4.6566129e-10;
float2 l9_68=float2(l9_65,l9_67);
l9_43=float4(l9_68.x,l9_68.y,l9_43.z,l9_43.w);
}
else
{
if (l9_35==3)
{
int l9_69=l9_50;
int l9_70=l9_69;
int l9_71=((l9_70*((l9_70*1471343)+101146501))+1559861749)&2147483647;
int l9_72=l9_71;
int l9_73=l9_69*1399;
int l9_74=((l9_73*((l9_73*1471343)+101146501))+1559861749)&2147483647;
int l9_75=l9_74;
int l9_76=l9_69*7177;
int l9_77=((l9_76*((l9_76*1471343)+101146501))+1559861749)&2147483647;
int l9_78=l9_77;
int l9_79=l9_72;
float l9_80=float(l9_79)*4.6566129e-10;
int l9_81=l9_75;
float l9_82=float(l9_81)*4.6566129e-10;
int l9_83=l9_78;
float l9_84=float(l9_83)*4.6566129e-10;
float3 l9_85=float3(l9_80,l9_82,l9_84);
l9_43=float4(l9_85.x,l9_85.y,l9_85.z,l9_43.w);
}
else
{
int l9_86=l9_50;
int l9_87=l9_86;
int l9_88=((l9_87*((l9_87*1471343)+101146501))+1559861749)&2147483647;
int l9_89=l9_88;
int l9_90=l9_86*1399;
int l9_91=((l9_90*((l9_90*1471343)+101146501))+1559861749)&2147483647;
int l9_92=l9_91;
int l9_93=l9_86*7177;
int l9_94=((l9_93*((l9_93*1471343)+101146501))+1559861749)&2147483647;
int l9_95=l9_94;
int l9_96=l9_86*18919;
int l9_97=((l9_96*((l9_96*1471343)+101146501))+1559861749)&2147483647;
int l9_98=l9_97;
int l9_99=l9_89;
float l9_100=float(l9_99)*4.6566129e-10;
int l9_101=l9_92;
float l9_102=float(l9_101)*4.6566129e-10;
int l9_103=l9_95;
float l9_104=float(l9_103)*4.6566129e-10;
int l9_105=l9_98;
float l9_106=float(l9_105)*4.6566129e-10;
float4 l9_107=float4(l9_100,l9_102,l9_104,l9_106);
l9_43=l9_107;
}
}
}
float4 l9_108=l9_43;
float4 l9_109=l9_108;
float2 l9_110=mix(l9_32,l9_33,l9_109.xy);
l9_31=l9_110;
float l9_111=0.0;
l9_111=length(l9_31);
float2 l9_112=float2(0.0);
l9_112=l9_31/(float2(l9_111)+float2(1.234e-06));
float l9_113=0.0;
l9_113=fast::clamp((*sc_set0.UserUniforms).Port_Import_N120,0.0,1.0);
float l9_114=0.0;
l9_114=1.0-l9_113;
float l9_115=0.0;
float l9_116;
if (l9_114<=0.0)
{
l9_116=0.0;
}
else
{
l9_116=pow(l9_114,(*sc_set0.UserUniforms).Port_Input1_N122);
}
l9_115=l9_116;
float l9_117=0.0;
float l9_118=l9_115;
float l9_119=(*sc_set0.UserUniforms).Port_Max_N131;
ssGlobals l9_120=l9_28;
int l9_121=1;
bool l9_122=true;
bool l9_123=true;
bool l9_124=true;
float l9_125=131.0;
ssParticle l9_126=gParticle;
float l9_127=0.0;
float l9_128=l9_120.gTimeElapsed;
float4 l9_129=float4(0.0);
float4 l9_130=float4(0.0);
if (l9_122)
{
l9_130.x=floor(fract(l9_128)*1000.0);
}
if (l9_124)
{
l9_130.y=float(l9_126.Index1D^((l9_126.Index1D*15299)+l9_126.Index1D));
}
if (l9_123)
{
l9_130.z=l9_125;
}
l9_130.w=l9_127*1000.0;
int l9_131=int(l9_130.x);
int l9_132=int(l9_130.y);
int l9_133=int(l9_130.z);
int l9_134=int(l9_130.w);
int l9_135=(((l9_131*15299)^(l9_132*30133))^(l9_133*17539))^(l9_134*12113);
int l9_136=l9_135;
if (l9_121==1)
{
int l9_137=l9_136;
int l9_138=l9_137;
int l9_139=((l9_138*((l9_138*1471343)+101146501))+1559861749)&2147483647;
int l9_140=l9_139;
float l9_141=float(l9_140)*4.6566129e-10;
float l9_142=l9_141;
l9_129.x=l9_142;
}
else
{
if (l9_121==2)
{
int l9_143=l9_136;
int l9_144=l9_143;
int l9_145=((l9_144*((l9_144*1471343)+101146501))+1559861749)&2147483647;
int l9_146=l9_145;
int l9_147=l9_143*1399;
int l9_148=((l9_147*((l9_147*1471343)+101146501))+1559861749)&2147483647;
int l9_149=l9_148;
int l9_150=l9_146;
float l9_151=float(l9_150)*4.6566129e-10;
int l9_152=l9_149;
float l9_153=float(l9_152)*4.6566129e-10;
float2 l9_154=float2(l9_151,l9_153);
l9_129=float4(l9_154.x,l9_154.y,l9_129.z,l9_129.w);
}
else
{
if (l9_121==3)
{
int l9_155=l9_136;
int l9_156=l9_155;
int l9_157=((l9_156*((l9_156*1471343)+101146501))+1559861749)&2147483647;
int l9_158=l9_157;
int l9_159=l9_155*1399;
int l9_160=((l9_159*((l9_159*1471343)+101146501))+1559861749)&2147483647;
int l9_161=l9_160;
int l9_162=l9_155*7177;
int l9_163=((l9_162*((l9_162*1471343)+101146501))+1559861749)&2147483647;
int l9_164=l9_163;
int l9_165=l9_158;
float l9_166=float(l9_165)*4.6566129e-10;
int l9_167=l9_161;
float l9_168=float(l9_167)*4.6566129e-10;
int l9_169=l9_164;
float l9_170=float(l9_169)*4.6566129e-10;
float3 l9_171=float3(l9_166,l9_168,l9_170);
l9_129=float4(l9_171.x,l9_171.y,l9_171.z,l9_129.w);
}
else
{
int l9_172=l9_136;
int l9_173=l9_172;
int l9_174=((l9_173*((l9_173*1471343)+101146501))+1559861749)&2147483647;
int l9_175=l9_174;
int l9_176=l9_172*1399;
int l9_177=((l9_176*((l9_176*1471343)+101146501))+1559861749)&2147483647;
int l9_178=l9_177;
int l9_179=l9_172*7177;
int l9_180=((l9_179*((l9_179*1471343)+101146501))+1559861749)&2147483647;
int l9_181=l9_180;
int l9_182=l9_172*18919;
int l9_183=((l9_182*((l9_182*1471343)+101146501))+1559861749)&2147483647;
int l9_184=l9_183;
int l9_185=l9_175;
float l9_186=float(l9_185)*4.6566129e-10;
int l9_187=l9_178;
float l9_188=float(l9_187)*4.6566129e-10;
int l9_189=l9_181;
float l9_190=float(l9_189)*4.6566129e-10;
int l9_191=l9_184;
float l9_192=float(l9_191)*4.6566129e-10;
float4 l9_193=float4(l9_186,l9_188,l9_190,l9_192);
l9_129=l9_193;
}
}
}
float4 l9_194=l9_129;
float4 l9_195=l9_194;
float l9_196=mix(l9_118,l9_119,l9_195.x);
l9_117=l9_196;
float l9_197=0.0;
float l9_198;
if (l9_117<=0.0)
{
l9_198=0.0;
}
else
{
l9_198=sqrt(l9_117);
}
l9_197=l9_198;
float l9_199=0.0;
l9_199=(*sc_set0.UserUniforms).Port_Import_N146;
float2 l9_200=float2(0.0);
l9_200=(l9_112*float2(l9_197))*float2(l9_199);
l9_24=float3(l9_200,0.0);
l9_30=l9_24;
}
else
{
if (l9_23==1.0)
{
float2 l9_201=float2(0.0);
float2 l9_202=(*sc_set0.UserUniforms).Port_Min_N117;
float2 l9_203=(*sc_set0.UserUniforms).Port_Max_N117;
ssGlobals l9_204=l9_28;
int l9_205=2;
bool l9_206=true;
bool l9_207=true;
bool l9_208=true;
float l9_209=117.0;
ssParticle l9_210=gParticle;
float l9_211=0.0;
float l9_212=l9_204.gTimeElapsed;
float4 l9_213=float4(0.0);
float4 l9_214=float4(0.0);
if (l9_206)
{
l9_214.x=floor(fract(l9_212)*1000.0);
}
if (l9_208)
{
l9_214.y=float(l9_210.Index1D^((l9_210.Index1D*15299)+l9_210.Index1D));
}
if (l9_207)
{
l9_214.z=l9_209;
}
l9_214.w=l9_211*1000.0;
int l9_215=int(l9_214.x);
int l9_216=int(l9_214.y);
int l9_217=int(l9_214.z);
int l9_218=int(l9_214.w);
int l9_219=(((l9_215*15299)^(l9_216*30133))^(l9_217*17539))^(l9_218*12113);
int l9_220=l9_219;
if (l9_205==1)
{
int l9_221=l9_220;
int l9_222=l9_221;
int l9_223=((l9_222*((l9_222*1471343)+101146501))+1559861749)&2147483647;
int l9_224=l9_223;
float l9_225=float(l9_224)*4.6566129e-10;
float l9_226=l9_225;
l9_213.x=l9_226;
}
else
{
if (l9_205==2)
{
int l9_227=l9_220;
int l9_228=l9_227;
int l9_229=((l9_228*((l9_228*1471343)+101146501))+1559861749)&2147483647;
int l9_230=l9_229;
int l9_231=l9_227*1399;
int l9_232=((l9_231*((l9_231*1471343)+101146501))+1559861749)&2147483647;
int l9_233=l9_232;
int l9_234=l9_230;
float l9_235=float(l9_234)*4.6566129e-10;
int l9_236=l9_233;
float l9_237=float(l9_236)*4.6566129e-10;
float2 l9_238=float2(l9_235,l9_237);
l9_213=float4(l9_238.x,l9_238.y,l9_213.z,l9_213.w);
}
else
{
if (l9_205==3)
{
int l9_239=l9_220;
int l9_240=l9_239;
int l9_241=((l9_240*((l9_240*1471343)+101146501))+1559861749)&2147483647;
int l9_242=l9_241;
int l9_243=l9_239*1399;
int l9_244=((l9_243*((l9_243*1471343)+101146501))+1559861749)&2147483647;
int l9_245=l9_244;
int l9_246=l9_239*7177;
int l9_247=((l9_246*((l9_246*1471343)+101146501))+1559861749)&2147483647;
int l9_248=l9_247;
int l9_249=l9_242;
float l9_250=float(l9_249)*4.6566129e-10;
int l9_251=l9_245;
float l9_252=float(l9_251)*4.6566129e-10;
int l9_253=l9_248;
float l9_254=float(l9_253)*4.6566129e-10;
float3 l9_255=float3(l9_250,l9_252,l9_254);
l9_213=float4(l9_255.x,l9_255.y,l9_255.z,l9_213.w);
}
else
{
int l9_256=l9_220;
int l9_257=l9_256;
int l9_258=((l9_257*((l9_257*1471343)+101146501))+1559861749)&2147483647;
int l9_259=l9_258;
int l9_260=l9_256*1399;
int l9_261=((l9_260*((l9_260*1471343)+101146501))+1559861749)&2147483647;
int l9_262=l9_261;
int l9_263=l9_256*7177;
int l9_264=((l9_263*((l9_263*1471343)+101146501))+1559861749)&2147483647;
int l9_265=l9_264;
int l9_266=l9_256*18919;
int l9_267=((l9_266*((l9_266*1471343)+101146501))+1559861749)&2147483647;
int l9_268=l9_267;
int l9_269=l9_259;
float l9_270=float(l9_269)*4.6566129e-10;
int l9_271=l9_262;
float l9_272=float(l9_271)*4.6566129e-10;
int l9_273=l9_265;
float l9_274=float(l9_273)*4.6566129e-10;
int l9_275=l9_268;
float l9_276=float(l9_275)*4.6566129e-10;
float4 l9_277=float4(l9_270,l9_272,l9_274,l9_276);
l9_213=l9_277;
}
}
}
float4 l9_278=l9_213;
float4 l9_279=l9_278;
float2 l9_280=mix(l9_202,l9_203,l9_279.xy);
l9_201=l9_280;
float l9_281=0.0;
l9_281=length(l9_201);
float2 l9_282=float2(0.0);
l9_282=l9_201/(float2(l9_281)+float2(1.234e-06));
float l9_283=0.0;
l9_283=fast::clamp((*sc_set0.UserUniforms).Port_Import_N120,0.0,1.0);
float l9_284=0.0;
l9_284=1.0-l9_283;
float l9_285=0.0;
float l9_286;
if (l9_284<=0.0)
{
l9_286=0.0;
}
else
{
l9_286=pow(l9_284,(*sc_set0.UserUniforms).Port_Input1_N122);
}
l9_285=l9_286;
float l9_287=0.0;
float l9_288=l9_285;
float l9_289=(*sc_set0.UserUniforms).Port_Max_N131;
ssGlobals l9_290=l9_28;
int l9_291=1;
bool l9_292=true;
bool l9_293=true;
bool l9_294=true;
float l9_295=131.0;
ssParticle l9_296=gParticle;
float l9_297=0.0;
float l9_298=l9_290.gTimeElapsed;
float4 l9_299=float4(0.0);
float4 l9_300=float4(0.0);
if (l9_292)
{
l9_300.x=floor(fract(l9_298)*1000.0);
}
if (l9_294)
{
l9_300.y=float(l9_296.Index1D^((l9_296.Index1D*15299)+l9_296.Index1D));
}
if (l9_293)
{
l9_300.z=l9_295;
}
l9_300.w=l9_297*1000.0;
int l9_301=int(l9_300.x);
int l9_302=int(l9_300.y);
int l9_303=int(l9_300.z);
int l9_304=int(l9_300.w);
int l9_305=(((l9_301*15299)^(l9_302*30133))^(l9_303*17539))^(l9_304*12113);
int l9_306=l9_305;
if (l9_291==1)
{
int l9_307=l9_306;
int l9_308=l9_307;
int l9_309=((l9_308*((l9_308*1471343)+101146501))+1559861749)&2147483647;
int l9_310=l9_309;
float l9_311=float(l9_310)*4.6566129e-10;
float l9_312=l9_311;
l9_299.x=l9_312;
}
else
{
if (l9_291==2)
{
int l9_313=l9_306;
int l9_314=l9_313;
int l9_315=((l9_314*((l9_314*1471343)+101146501))+1559861749)&2147483647;
int l9_316=l9_315;
int l9_317=l9_313*1399;
int l9_318=((l9_317*((l9_317*1471343)+101146501))+1559861749)&2147483647;
int l9_319=l9_318;
int l9_320=l9_316;
float l9_321=float(l9_320)*4.6566129e-10;
int l9_322=l9_319;
float l9_323=float(l9_322)*4.6566129e-10;
float2 l9_324=float2(l9_321,l9_323);
l9_299=float4(l9_324.x,l9_324.y,l9_299.z,l9_299.w);
}
else
{
if (l9_291==3)
{
int l9_325=l9_306;
int l9_326=l9_325;
int l9_327=((l9_326*((l9_326*1471343)+101146501))+1559861749)&2147483647;
int l9_328=l9_327;
int l9_329=l9_325*1399;
int l9_330=((l9_329*((l9_329*1471343)+101146501))+1559861749)&2147483647;
int l9_331=l9_330;
int l9_332=l9_325*7177;
int l9_333=((l9_332*((l9_332*1471343)+101146501))+1559861749)&2147483647;
int l9_334=l9_333;
int l9_335=l9_328;
float l9_336=float(l9_335)*4.6566129e-10;
int l9_337=l9_331;
float l9_338=float(l9_337)*4.6566129e-10;
int l9_339=l9_334;
float l9_340=float(l9_339)*4.6566129e-10;
float3 l9_341=float3(l9_336,l9_338,l9_340);
l9_299=float4(l9_341.x,l9_341.y,l9_341.z,l9_299.w);
}
else
{
int l9_342=l9_306;
int l9_343=l9_342;
int l9_344=((l9_343*((l9_343*1471343)+101146501))+1559861749)&2147483647;
int l9_345=l9_344;
int l9_346=l9_342*1399;
int l9_347=((l9_346*((l9_346*1471343)+101146501))+1559861749)&2147483647;
int l9_348=l9_347;
int l9_349=l9_342*7177;
int l9_350=((l9_349*((l9_349*1471343)+101146501))+1559861749)&2147483647;
int l9_351=l9_350;
int l9_352=l9_342*18919;
int l9_353=((l9_352*((l9_352*1471343)+101146501))+1559861749)&2147483647;
int l9_354=l9_353;
int l9_355=l9_345;
float l9_356=float(l9_355)*4.6566129e-10;
int l9_357=l9_348;
float l9_358=float(l9_357)*4.6566129e-10;
int l9_359=l9_351;
float l9_360=float(l9_359)*4.6566129e-10;
int l9_361=l9_354;
float l9_362=float(l9_361)*4.6566129e-10;
float4 l9_363=float4(l9_356,l9_358,l9_360,l9_362);
l9_299=l9_363;
}
}
}
float4 l9_364=l9_299;
float4 l9_365=l9_364;
float l9_366=mix(l9_288,l9_289,l9_365.x);
l9_287=l9_366;
float l9_367=0.0;
float l9_368;
if (l9_287<=0.0)
{
l9_368=0.0;
}
else
{
l9_368=sqrt(l9_287);
}
l9_367=l9_368;
float l9_369=0.0;
l9_369=(*sc_set0.UserUniforms).Port_Import_N146;
float2 l9_370=float2(0.0);
l9_370=(l9_282*float2(l9_367))*float2(l9_369);
float3 l9_371=float3(0.0);
l9_371=float3(float3(l9_370,0.0).y,float3(l9_370,0.0).z,float3(l9_370,0.0).x);
l9_25=l9_371;
l9_30=l9_25;
}
else
{
if (l9_23==2.0)
{
float2 l9_372=float2(0.0);
float2 l9_373=(*sc_set0.UserUniforms).Port_Min_N117;
float2 l9_374=(*sc_set0.UserUniforms).Port_Max_N117;
ssGlobals l9_375=l9_28;
int l9_376=2;
bool l9_377=true;
bool l9_378=true;
bool l9_379=true;
float l9_380=117.0;
ssParticle l9_381=gParticle;
float l9_382=0.0;
float l9_383=l9_375.gTimeElapsed;
float4 l9_384=float4(0.0);
float4 l9_385=float4(0.0);
if (l9_377)
{
l9_385.x=floor(fract(l9_383)*1000.0);
}
if (l9_379)
{
l9_385.y=float(l9_381.Index1D^((l9_381.Index1D*15299)+l9_381.Index1D));
}
if (l9_378)
{
l9_385.z=l9_380;
}
l9_385.w=l9_382*1000.0;
int l9_386=int(l9_385.x);
int l9_387=int(l9_385.y);
int l9_388=int(l9_385.z);
int l9_389=int(l9_385.w);
int l9_390=(((l9_386*15299)^(l9_387*30133))^(l9_388*17539))^(l9_389*12113);
int l9_391=l9_390;
if (l9_376==1)
{
int l9_392=l9_391;
int l9_393=l9_392;
int l9_394=((l9_393*((l9_393*1471343)+101146501))+1559861749)&2147483647;
int l9_395=l9_394;
float l9_396=float(l9_395)*4.6566129e-10;
float l9_397=l9_396;
l9_384.x=l9_397;
}
else
{
if (l9_376==2)
{
int l9_398=l9_391;
int l9_399=l9_398;
int l9_400=((l9_399*((l9_399*1471343)+101146501))+1559861749)&2147483647;
int l9_401=l9_400;
int l9_402=l9_398*1399;
int l9_403=((l9_402*((l9_402*1471343)+101146501))+1559861749)&2147483647;
int l9_404=l9_403;
int l9_405=l9_401;
float l9_406=float(l9_405)*4.6566129e-10;
int l9_407=l9_404;
float l9_408=float(l9_407)*4.6566129e-10;
float2 l9_409=float2(l9_406,l9_408);
l9_384=float4(l9_409.x,l9_409.y,l9_384.z,l9_384.w);
}
else
{
if (l9_376==3)
{
int l9_410=l9_391;
int l9_411=l9_410;
int l9_412=((l9_411*((l9_411*1471343)+101146501))+1559861749)&2147483647;
int l9_413=l9_412;
int l9_414=l9_410*1399;
int l9_415=((l9_414*((l9_414*1471343)+101146501))+1559861749)&2147483647;
int l9_416=l9_415;
int l9_417=l9_410*7177;
int l9_418=((l9_417*((l9_417*1471343)+101146501))+1559861749)&2147483647;
int l9_419=l9_418;
int l9_420=l9_413;
float l9_421=float(l9_420)*4.6566129e-10;
int l9_422=l9_416;
float l9_423=float(l9_422)*4.6566129e-10;
int l9_424=l9_419;
float l9_425=float(l9_424)*4.6566129e-10;
float3 l9_426=float3(l9_421,l9_423,l9_425);
l9_384=float4(l9_426.x,l9_426.y,l9_426.z,l9_384.w);
}
else
{
int l9_427=l9_391;
int l9_428=l9_427;
int l9_429=((l9_428*((l9_428*1471343)+101146501))+1559861749)&2147483647;
int l9_430=l9_429;
int l9_431=l9_427*1399;
int l9_432=((l9_431*((l9_431*1471343)+101146501))+1559861749)&2147483647;
int l9_433=l9_432;
int l9_434=l9_427*7177;
int l9_435=((l9_434*((l9_434*1471343)+101146501))+1559861749)&2147483647;
int l9_436=l9_435;
int l9_437=l9_427*18919;
int l9_438=((l9_437*((l9_437*1471343)+101146501))+1559861749)&2147483647;
int l9_439=l9_438;
int l9_440=l9_430;
float l9_441=float(l9_440)*4.6566129e-10;
int l9_442=l9_433;
float l9_443=float(l9_442)*4.6566129e-10;
int l9_444=l9_436;
float l9_445=float(l9_444)*4.6566129e-10;
int l9_446=l9_439;
float l9_447=float(l9_446)*4.6566129e-10;
float4 l9_448=float4(l9_441,l9_443,l9_445,l9_447);
l9_384=l9_448;
}
}
}
float4 l9_449=l9_384;
float4 l9_450=l9_449;
float2 l9_451=mix(l9_373,l9_374,l9_450.xy);
l9_372=l9_451;
float l9_452=0.0;
l9_452=length(l9_372);
float2 l9_453=float2(0.0);
l9_453=l9_372/(float2(l9_452)+float2(1.234e-06));
float l9_454=0.0;
l9_454=fast::clamp((*sc_set0.UserUniforms).Port_Import_N120,0.0,1.0);
float l9_455=0.0;
l9_455=1.0-l9_454;
float l9_456=0.0;
float l9_457;
if (l9_455<=0.0)
{
l9_457=0.0;
}
else
{
l9_457=pow(l9_455,(*sc_set0.UserUniforms).Port_Input1_N122);
}
l9_456=l9_457;
float l9_458=0.0;
float l9_459=l9_456;
float l9_460=(*sc_set0.UserUniforms).Port_Max_N131;
ssGlobals l9_461=l9_28;
int l9_462=1;
bool l9_463=true;
bool l9_464=true;
bool l9_465=true;
float l9_466=131.0;
ssParticle l9_467=gParticle;
float l9_468=0.0;
float l9_469=l9_461.gTimeElapsed;
float4 l9_470=float4(0.0);
float4 l9_471=float4(0.0);
if (l9_463)
{
l9_471.x=floor(fract(l9_469)*1000.0);
}
if (l9_465)
{
l9_471.y=float(l9_467.Index1D^((l9_467.Index1D*15299)+l9_467.Index1D));
}
if (l9_464)
{
l9_471.z=l9_466;
}
l9_471.w=l9_468*1000.0;
int l9_472=int(l9_471.x);
int l9_473=int(l9_471.y);
int l9_474=int(l9_471.z);
int l9_475=int(l9_471.w);
int l9_476=(((l9_472*15299)^(l9_473*30133))^(l9_474*17539))^(l9_475*12113);
int l9_477=l9_476;
if (l9_462==1)
{
int l9_478=l9_477;
int l9_479=l9_478;
int l9_480=((l9_479*((l9_479*1471343)+101146501))+1559861749)&2147483647;
int l9_481=l9_480;
float l9_482=float(l9_481)*4.6566129e-10;
float l9_483=l9_482;
l9_470.x=l9_483;
}
else
{
if (l9_462==2)
{
int l9_484=l9_477;
int l9_485=l9_484;
int l9_486=((l9_485*((l9_485*1471343)+101146501))+1559861749)&2147483647;
int l9_487=l9_486;
int l9_488=l9_484*1399;
int l9_489=((l9_488*((l9_488*1471343)+101146501))+1559861749)&2147483647;
int l9_490=l9_489;
int l9_491=l9_487;
float l9_492=float(l9_491)*4.6566129e-10;
int l9_493=l9_490;
float l9_494=float(l9_493)*4.6566129e-10;
float2 l9_495=float2(l9_492,l9_494);
l9_470=float4(l9_495.x,l9_495.y,l9_470.z,l9_470.w);
}
else
{
if (l9_462==3)
{
int l9_496=l9_477;
int l9_497=l9_496;
int l9_498=((l9_497*((l9_497*1471343)+101146501))+1559861749)&2147483647;
int l9_499=l9_498;
int l9_500=l9_496*1399;
int l9_501=((l9_500*((l9_500*1471343)+101146501))+1559861749)&2147483647;
int l9_502=l9_501;
int l9_503=l9_496*7177;
int l9_504=((l9_503*((l9_503*1471343)+101146501))+1559861749)&2147483647;
int l9_505=l9_504;
int l9_506=l9_499;
float l9_507=float(l9_506)*4.6566129e-10;
int l9_508=l9_502;
float l9_509=float(l9_508)*4.6566129e-10;
int l9_510=l9_505;
float l9_511=float(l9_510)*4.6566129e-10;
float3 l9_512=float3(l9_507,l9_509,l9_511);
l9_470=float4(l9_512.x,l9_512.y,l9_512.z,l9_470.w);
}
else
{
int l9_513=l9_477;
int l9_514=l9_513;
int l9_515=((l9_514*((l9_514*1471343)+101146501))+1559861749)&2147483647;
int l9_516=l9_515;
int l9_517=l9_513*1399;
int l9_518=((l9_517*((l9_517*1471343)+101146501))+1559861749)&2147483647;
int l9_519=l9_518;
int l9_520=l9_513*7177;
int l9_521=((l9_520*((l9_520*1471343)+101146501))+1559861749)&2147483647;
int l9_522=l9_521;
int l9_523=l9_513*18919;
int l9_524=((l9_523*((l9_523*1471343)+101146501))+1559861749)&2147483647;
int l9_525=l9_524;
int l9_526=l9_516;
float l9_527=float(l9_526)*4.6566129e-10;
int l9_528=l9_519;
float l9_529=float(l9_528)*4.6566129e-10;
int l9_530=l9_522;
float l9_531=float(l9_530)*4.6566129e-10;
int l9_532=l9_525;
float l9_533=float(l9_532)*4.6566129e-10;
float4 l9_534=float4(l9_527,l9_529,l9_531,l9_533);
l9_470=l9_534;
}
}
}
float4 l9_535=l9_470;
float4 l9_536=l9_535;
float l9_537=mix(l9_459,l9_460,l9_536.x);
l9_458=l9_537;
float l9_538=0.0;
float l9_539;
if (l9_458<=0.0)
{
l9_539=0.0;
}
else
{
l9_539=sqrt(l9_458);
}
l9_538=l9_539;
float l9_540=0.0;
l9_540=(*sc_set0.UserUniforms).Port_Import_N146;
float2 l9_541=float2(0.0);
l9_541=(l9_453*float2(l9_538))*float2(l9_540);
float3 l9_542=float3(0.0);
l9_542=float3(float3(l9_541,0.0).z,float3(l9_541,0.0).y,float3(l9_541,0.0).x);
l9_26=l9_542;
l9_30=l9_26;
}
else
{
float2 l9_543=float2(0.0);
float2 l9_544=(*sc_set0.UserUniforms).Port_Min_N117;
float2 l9_545=(*sc_set0.UserUniforms).Port_Max_N117;
ssGlobals l9_546=l9_28;
int l9_547=2;
bool l9_548=true;
bool l9_549=true;
bool l9_550=true;
float l9_551=117.0;
ssParticle l9_552=gParticle;
float l9_553=0.0;
float l9_554=l9_546.gTimeElapsed;
float4 l9_555=float4(0.0);
float4 l9_556=float4(0.0);
if (l9_548)
{
l9_556.x=floor(fract(l9_554)*1000.0);
}
if (l9_550)
{
l9_556.y=float(l9_552.Index1D^((l9_552.Index1D*15299)+l9_552.Index1D));
}
if (l9_549)
{
l9_556.z=l9_551;
}
l9_556.w=l9_553*1000.0;
int l9_557=int(l9_556.x);
int l9_558=int(l9_556.y);
int l9_559=int(l9_556.z);
int l9_560=int(l9_556.w);
int l9_561=(((l9_557*15299)^(l9_558*30133))^(l9_559*17539))^(l9_560*12113);
int l9_562=l9_561;
if (l9_547==1)
{
int l9_563=l9_562;
int l9_564=l9_563;
int l9_565=((l9_564*((l9_564*1471343)+101146501))+1559861749)&2147483647;
int l9_566=l9_565;
float l9_567=float(l9_566)*4.6566129e-10;
float l9_568=l9_567;
l9_555.x=l9_568;
}
else
{
if (l9_547==2)
{
int l9_569=l9_562;
int l9_570=l9_569;
int l9_571=((l9_570*((l9_570*1471343)+101146501))+1559861749)&2147483647;
int l9_572=l9_571;
int l9_573=l9_569*1399;
int l9_574=((l9_573*((l9_573*1471343)+101146501))+1559861749)&2147483647;
int l9_575=l9_574;
int l9_576=l9_572;
float l9_577=float(l9_576)*4.6566129e-10;
int l9_578=l9_575;
float l9_579=float(l9_578)*4.6566129e-10;
float2 l9_580=float2(l9_577,l9_579);
l9_555=float4(l9_580.x,l9_580.y,l9_555.z,l9_555.w);
}
else
{
if (l9_547==3)
{
int l9_581=l9_562;
int l9_582=l9_581;
int l9_583=((l9_582*((l9_582*1471343)+101146501))+1559861749)&2147483647;
int l9_584=l9_583;
int l9_585=l9_581*1399;
int l9_586=((l9_585*((l9_585*1471343)+101146501))+1559861749)&2147483647;
int l9_587=l9_586;
int l9_588=l9_581*7177;
int l9_589=((l9_588*((l9_588*1471343)+101146501))+1559861749)&2147483647;
int l9_590=l9_589;
int l9_591=l9_584;
float l9_592=float(l9_591)*4.6566129e-10;
int l9_593=l9_587;
float l9_594=float(l9_593)*4.6566129e-10;
int l9_595=l9_590;
float l9_596=float(l9_595)*4.6566129e-10;
float3 l9_597=float3(l9_592,l9_594,l9_596);
l9_555=float4(l9_597.x,l9_597.y,l9_597.z,l9_555.w);
}
else
{
int l9_598=l9_562;
int l9_599=l9_598;
int l9_600=((l9_599*((l9_599*1471343)+101146501))+1559861749)&2147483647;
int l9_601=l9_600;
int l9_602=l9_598*1399;
int l9_603=((l9_602*((l9_602*1471343)+101146501))+1559861749)&2147483647;
int l9_604=l9_603;
int l9_605=l9_598*7177;
int l9_606=((l9_605*((l9_605*1471343)+101146501))+1559861749)&2147483647;
int l9_607=l9_606;
int l9_608=l9_598*18919;
int l9_609=((l9_608*((l9_608*1471343)+101146501))+1559861749)&2147483647;
int l9_610=l9_609;
int l9_611=l9_601;
float l9_612=float(l9_611)*4.6566129e-10;
int l9_613=l9_604;
float l9_614=float(l9_613)*4.6566129e-10;
int l9_615=l9_607;
float l9_616=float(l9_615)*4.6566129e-10;
int l9_617=l9_610;
float l9_618=float(l9_617)*4.6566129e-10;
float4 l9_619=float4(l9_612,l9_614,l9_616,l9_618);
l9_555=l9_619;
}
}
}
float4 l9_620=l9_555;
float4 l9_621=l9_620;
float2 l9_622=mix(l9_544,l9_545,l9_621.xy);
l9_543=l9_622;
float l9_623=0.0;
l9_623=length(l9_543);
float2 l9_624=float2(0.0);
l9_624=l9_543/(float2(l9_623)+float2(1.234e-06));
float l9_625=0.0;
l9_625=fast::clamp((*sc_set0.UserUniforms).Port_Import_N120,0.0,1.0);
float l9_626=0.0;
l9_626=1.0-l9_625;
float l9_627=0.0;
float l9_628;
if (l9_626<=0.0)
{
l9_628=0.0;
}
else
{
l9_628=pow(l9_626,(*sc_set0.UserUniforms).Port_Input1_N122);
}
l9_627=l9_628;
float l9_629=0.0;
float l9_630=l9_627;
float l9_631=(*sc_set0.UserUniforms).Port_Max_N131;
ssGlobals l9_632=l9_28;
int l9_633=1;
bool l9_634=true;
bool l9_635=true;
bool l9_636=true;
float l9_637=131.0;
ssParticle l9_638=gParticle;
float l9_639=0.0;
float l9_640=l9_632.gTimeElapsed;
float4 l9_641=float4(0.0);
float4 l9_642=float4(0.0);
if (l9_634)
{
l9_642.x=floor(fract(l9_640)*1000.0);
}
if (l9_636)
{
l9_642.y=float(l9_638.Index1D^((l9_638.Index1D*15299)+l9_638.Index1D));
}
if (l9_635)
{
l9_642.z=l9_637;
}
l9_642.w=l9_639*1000.0;
int l9_643=int(l9_642.x);
int l9_644=int(l9_642.y);
int l9_645=int(l9_642.z);
int l9_646=int(l9_642.w);
int l9_647=(((l9_643*15299)^(l9_644*30133))^(l9_645*17539))^(l9_646*12113);
int l9_648=l9_647;
if (l9_633==1)
{
int l9_649=l9_648;
int l9_650=l9_649;
int l9_651=((l9_650*((l9_650*1471343)+101146501))+1559861749)&2147483647;
int l9_652=l9_651;
float l9_653=float(l9_652)*4.6566129e-10;
float l9_654=l9_653;
l9_641.x=l9_654;
}
else
{
if (l9_633==2)
{
int l9_655=l9_648;
int l9_656=l9_655;
int l9_657=((l9_656*((l9_656*1471343)+101146501))+1559861749)&2147483647;
int l9_658=l9_657;
int l9_659=l9_655*1399;
int l9_660=((l9_659*((l9_659*1471343)+101146501))+1559861749)&2147483647;
int l9_661=l9_660;
int l9_662=l9_658;
float l9_663=float(l9_662)*4.6566129e-10;
int l9_664=l9_661;
float l9_665=float(l9_664)*4.6566129e-10;
float2 l9_666=float2(l9_663,l9_665);
l9_641=float4(l9_666.x,l9_666.y,l9_641.z,l9_641.w);
}
else
{
if (l9_633==3)
{
int l9_667=l9_648;
int l9_668=l9_667;
int l9_669=((l9_668*((l9_668*1471343)+101146501))+1559861749)&2147483647;
int l9_670=l9_669;
int l9_671=l9_667*1399;
int l9_672=((l9_671*((l9_671*1471343)+101146501))+1559861749)&2147483647;
int l9_673=l9_672;
int l9_674=l9_667*7177;
int l9_675=((l9_674*((l9_674*1471343)+101146501))+1559861749)&2147483647;
int l9_676=l9_675;
int l9_677=l9_670;
float l9_678=float(l9_677)*4.6566129e-10;
int l9_679=l9_673;
float l9_680=float(l9_679)*4.6566129e-10;
int l9_681=l9_676;
float l9_682=float(l9_681)*4.6566129e-10;
float3 l9_683=float3(l9_678,l9_680,l9_682);
l9_641=float4(l9_683.x,l9_683.y,l9_683.z,l9_641.w);
}
else
{
int l9_684=l9_648;
int l9_685=l9_684;
int l9_686=((l9_685*((l9_685*1471343)+101146501))+1559861749)&2147483647;
int l9_687=l9_686;
int l9_688=l9_684*1399;
int l9_689=((l9_688*((l9_688*1471343)+101146501))+1559861749)&2147483647;
int l9_690=l9_689;
int l9_691=l9_684*7177;
int l9_692=((l9_691*((l9_691*1471343)+101146501))+1559861749)&2147483647;
int l9_693=l9_692;
int l9_694=l9_684*18919;
int l9_695=((l9_694*((l9_694*1471343)+101146501))+1559861749)&2147483647;
int l9_696=l9_695;
int l9_697=l9_687;
float l9_698=float(l9_697)*4.6566129e-10;
int l9_699=l9_690;
float l9_700=float(l9_699)*4.6566129e-10;
int l9_701=l9_693;
float l9_702=float(l9_701)*4.6566129e-10;
int l9_703=l9_696;
float l9_704=float(l9_703)*4.6566129e-10;
float4 l9_705=float4(l9_698,l9_700,l9_702,l9_704);
l9_641=l9_705;
}
}
}
float4 l9_706=l9_641;
float4 l9_707=l9_706;
float l9_708=mix(l9_630,l9_631,l9_707.x);
l9_629=l9_708;
float l9_709=0.0;
float l9_710;
if (l9_629<=0.0)
{
l9_710=0.0;
}
else
{
l9_710=sqrt(l9_629);
}
l9_709=l9_710;
float l9_711=0.0;
l9_711=(*sc_set0.UserUniforms).Port_Import_N146;
float2 l9_712=float2(0.0);
l9_712=(l9_624*float2(l9_709))*float2(l9_711);
l9_27=float3(l9_712,0.0);
l9_30=l9_27;
}
}
}
l9_22=l9_30;
float3 l9_713=float3(0.0);
l9_713=l9_21+l9_22;
float3 l9_714=float3(0.0);
l9_714=(*sc_set0.UserUniforms).Port_Import_N156;
float3 l9_715=float3(0.0);
l9_715=l9_713*l9_714;
gParticle.Position=l9_715;
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
int l9_716=gl_InstanceIndex;
gParticle.Position=((*sc_set0.UserUniforms).vfxModelMatrix[l9_716/25]*float4(gParticle.Position,1.0)).xyz;
int l9_717=gl_InstanceIndex;
int l9_718=l9_717/25;
gParticle.Velocity=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_718][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_718][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_718][2].xyz)*gParticle.Velocity;
int l9_719=gl_InstanceIndex;
int l9_720=l9_719/25;
gParticle.Force=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_720][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_720][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_720][2].xyz)*gParticle.Force;
int l9_721=gl_InstanceIndex;
int l9_722=gl_InstanceIndex;
int l9_723=gl_InstanceIndex;
gParticle.Size=fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_721/25][0].xyz),fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_722/25][1].xyz),length((*sc_set0.UserUniforms).vfxModelMatrix[l9_723/25][2].xyz)))*gParticle.Size;
int l9_724=gl_InstanceIndex;
int l9_725=l9_724/25;
gParticle.Matrix=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_725][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_725][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_725][2].xyz)*gParticle.Matrix;
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
float4 l9_726=param_2;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_727=dot(l9_726,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_728=l9_727;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_728;
}
}
float4 l9_729=float4(param_2.x,-param_2.y,(param_2.z*0.5)+(param_2.w*0.5),param_2.w);
out.gl_Position=l9_729;
return out;
}
float3 Value_N71=float3(0.0);
Value_N71=(*sc_set0.UserUniforms).Port_Import_N071;
float3 Value_N72=float3(0.0);
Value_N72=gParticle.Position;
float3 Value_N73=float3(0.0);
Value_N73=(*sc_set0.UserUniforms).Port_Import_N073;
float3 Value_N318=float3(0.0);
Value_N318=(*sc_set0.UserUniforms).Port_Import_N318;
float Time_N319=0.0;
Time_N319=Globals.gTimeElapsedShifted*(*sc_set0.UserUniforms).Port_Multiplier_N319;
float3 Output_N320=float3(0.0);
Output_N320=Value_N318*float3(Time_N319);
float3 Output_N321=float3(0.0);
Output_N321=(Value_N72+Value_N73)+Output_N320;
float3 Value_N322=float3(0.0);
Value_N322=(*sc_set0.UserUniforms).Port_Import_N322;
float3 Output_N323=float3(0.0);
Output_N323=float3(1.0)/Value_N322;
float3 Output_N324=float3(0.0);
Output_N324=Output_N321*Output_N323;
float2 Output_N325=float2(0.0);
Output_N325=float2(Output_N324.x,Output_N324.y);
float2 Output_N326=float2(0.0);
Output_N326=Output_N325+(*sc_set0.UserUniforms).Port_Input1_N326;
float Noise_N327=0.0;
float2 param_3=Output_N326;
float2 param_4=(*sc_set0.UserUniforms).Port_Scale_N327;
param_3.x=floor(param_3.x*10000.0)*9.9999997e-05;
param_3.y=floor(param_3.y*10000.0)*9.9999997e-05;
param_3*=(param_4*0.5);
float2 l9_731=param_3;
float param_5=(snoise(l9_731)*0.5)+0.5;
param_5=floor(param_5*10000.0)*9.9999997e-05;
Noise_N327=param_5;
float2 Output_N328=float2(0.0);
Output_N328=float2(Output_N324.y,Output_N324.z);
float2 Output_N329=float2(0.0);
Output_N329=Output_N328+(*sc_set0.UserUniforms).Port_Input1_N329;
float Noise_N330=0.0;
float2 param_6=Output_N329;
float2 param_7=(*sc_set0.UserUniforms).Port_Scale_N330;
param_6.x=floor(param_6.x*10000.0)*9.9999997e-05;
param_6.y=floor(param_6.y*10000.0)*9.9999997e-05;
param_6*=(param_7*0.5);
float2 l9_732=param_6;
float param_8=(snoise(l9_732)*0.5)+0.5;
param_8=floor(param_8*10000.0)*9.9999997e-05;
Noise_N330=param_8;
float2 Output_N331=float2(0.0);
Output_N331=float2(Output_N324.z,Output_N324.x);
float2 Output_N332=float2(0.0);
Output_N332=Output_N331+(*sc_set0.UserUniforms).Port_Input1_N332;
float Noise_N333=0.0;
float2 param_9=Output_N332;
float2 param_10=(*sc_set0.UserUniforms).Port_Scale_N333;
param_9.x=floor(param_9.x*10000.0)*9.9999997e-05;
param_9.y=floor(param_9.y*10000.0)*9.9999997e-05;
param_9*=(param_10*0.5);
float2 l9_733=param_9;
float param_11=(snoise(l9_733)*0.5)+0.5;
param_11=floor(param_11*10000.0)*9.9999997e-05;
Noise_N333=param_11;
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
float Value_N134=0.0;
Value_N134=(*sc_set0.UserUniforms).Port_Import_N134;
float Value_N135=0.0;
Value_N135=gParticle.Mass;
float Output_N136=0.0;
Output_N136=(Value_N134*Value_N135)*(*sc_set0.UserUniforms).Port_Input2_N136;
float3 Output_N6=float3(0.0);
Output_N6=float3(0.0,Output_N136,0.0);
gParticle.Force+=Output_N6;
float4 Value_N8=float4(0.0);
Value_N8=gParticle.Color;
float Value_N9=0.0;
Value_N9=(*sc_set0.UserUniforms).Port_Import_N009;
float Value_N10=0.0;
Value_N10=(*sc_set0.UserUniforms).Port_Import_N010;
float Value_N11=0.0;
Value_N11=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float Value_N75=0.0;
Value_N75=Value_N11;
float Value_N12=0.0;
Value_N12=(*sc_set0.UserUniforms).Port_Import_N012;
float Value_N13=0.0;
Value_N13=gParticle.Life;
float Output_N63=0.0;
Output_N63=Value_N12/(Value_N13+1.234e-06);
float Value_N213=0.0;
Value_N213=Output_N63;
float Output_N214=0.0;
Output_N214=(*sc_set0.UserUniforms).Port_Input0_N214/(Value_N213+1.234e-06);
float Output_N215=0.0;
Output_N215=Value_N75*Output_N214;
float Output_N76=0.0;
Output_N76=fast::clamp(Output_N215+0.001,(*sc_set0.UserUniforms).Port_Input1_N076+0.001,(*sc_set0.UserUniforms).Port_Input2_N076+0.001)-0.001;
float Output_N77=0.0;
Output_N77=1.0-Value_N75;
float Value_N64=0.0;
Value_N64=(*sc_set0.UserUniforms).Port_Import_N064;
float Output_N65=0.0;
Output_N65=Value_N64/(Value_N13+1.234e-06);
float Value_N78=0.0;
Value_N78=Output_N65;
float Output_N79=0.0;
Output_N79=(*sc_set0.UserUniforms).Port_Input0_N079/(Value_N78+1.234e-06);
float Output_N80=0.0;
Output_N80=Output_N77*Output_N79;
float Output_N81=0.0;
Output_N81=fast::clamp(Output_N80+0.001,(*sc_set0.UserUniforms).Port_Input1_N081+0.001,(*sc_set0.UserUniforms).Port_Input2_N081+0.001)-0.001;
float Output_N82=0.0;
Output_N82=Output_N76*Output_N81;
float Export_N83=0.0;
Export_N83=Output_N82;
float Output_N84=0.0;
Output_N84=mix(Value_N9,Value_N10,Export_N83);
float4 Value_N86=float4(0.0);
Value_N86=float4(Value_N8.xyz.x,Value_N8.xyz.y,Value_N8.xyz.z,Value_N86.w);
Value_N86.w=Output_N84;
gParticle.Color=Value_N86;
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
float Output_N60=0.0;
float param_12=1.0;
float param_13=1.0;
float param_14=0.0;
float l9_734=0.0;
l9_734=0.0;
param_12=l9_734;
float param_15;
if ((param_12*1.0)!=0.0)
{
float l9_735=0.0;
l9_735=(*sc_set0.UserUniforms).Port_Import_N047;
float l9_736=0.0;
l9_736=(*sc_set0.UserUniforms).Port_Import_N048;
float l9_737=0.0;
l9_737=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_738=0.0;
l9_738=mix(l9_735,l9_736,l9_737);
float3 l9_739=float3(0.0);
l9_739=(*sc_set0.UserUniforms).vfxLocalAabbMax;
float3 l9_740=float3(0.0);
l9_740=(*sc_set0.UserUniforms).vfxLocalAabbMin;
float3 l9_741=float3(0.0);
l9_741=l9_739-l9_740;
float l9_742=0.0;
l9_742=length(l9_741);
float l9_743=0.0;
l9_743=l9_738/(l9_742+1.234e-06);
param_13=l9_743;
param_15=param_13;
}
else
{
float l9_744=0.0;
l9_744=(*sc_set0.UserUniforms).Port_Import_N047;
float l9_745=0.0;
l9_745=(*sc_set0.UserUniforms).Port_Import_N048;
float l9_746=0.0;
l9_746=fast::clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_747=0.0;
l9_747=mix(l9_744,l9_745,l9_746);
param_14=l9_747;
param_15=param_14;
}
Output_N60=param_15;
gParticle.Size=Output_N60;
float3x3 param_16=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_16);
float Drift=0.0049999999;
if (gParticle.Dead)
{
float4 param_17=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_17.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_748=param_17;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_749=dot(l9_748,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_750=l9_749;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_750;
}
}
float4 l9_751=float4(param_17.x,-param_17.y,(param_17.z*0.5)+(param_17.w*0.5),param_17.w);
out.gl_Position=l9_751;
return out;
}
float l9_752;
if (abs(gParticle.Force.x)<Drift)
{
l9_752=0.0;
}
else
{
l9_752=gParticle.Force.x;
}
gParticle.Force.x=l9_752;
float l9_753;
if (abs(gParticle.Force.y)<Drift)
{
l9_753=0.0;
}
else
{
l9_753=gParticle.Force.y;
}
gParticle.Force.y=l9_753;
float l9_754;
if (abs(gParticle.Force.z)<Drift)
{
l9_754=0.0;
}
else
{
l9_754=gParticle.Force.z;
}
gParticle.Force.z=l9_754;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_755;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_755=0.0;
}
else
{
l9_755=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_755;
float l9_756;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_756=0.0;
}
else
{
l9_756=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_756;
float l9_757;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_757=0.0;
}
else
{
l9_757=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_757;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(4.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_758=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_758;
int particleRow=512;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_759;
if (v.texture0.x<0.5)
{
l9_759=0.0;
}
else
{
l9_759=QuadSize.x;
}
Vertex.x=l9_759;
float l9_760;
if (v.texture0.y<0.5)
{
l9_760=0.0;
}
else
{
l9_760=QuadSize.y;
}
Vertex.y=l9_760;
Vertex+=Offset;
float4 param_18=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_18.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_761=param_18;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_762=dot(l9_761,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_763=l9_762;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_763;
}
}
float4 l9_764=float4(param_18.x,-param_18.y,(param_18.z*0.5)+(param_18.w*0.5),param_18.w);
out.gl_Position=l9_764;
int l9_765=gl_InstanceIndex;
out.Interp_Particle_Index=l9_765;
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
float4 param_19=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_19.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_766=param_19;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_767=dot(l9_766,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_768=l9_767;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_768;
}
}
float4 l9_769=float4(param_19.x,-param_19.y,(param_19.z*0.5)+(param_19.w*0.5),param_19.w);
out.gl_Position=l9_769;
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
float3 Port_Import_N069;
float2 Port_Min_N117;
float2 Port_Max_N117;
float Port_Import_N120;
float Port_Input1_N122;
float Port_Max_N131;
float Port_Import_N146;
float3 Port_Import_N156;
float3 Port_Import_N071;
float3 Port_Import_N073;
float3 Port_Import_N318;
float Port_Multiplier_N319;
float3 Port_Import_N322;
float2 Port_Input1_N326;
float2 Port_Scale_N327;
float2 Port_Input1_N329;
float2 Port_Scale_N330;
float2 Port_Input1_N332;
float2 Port_Scale_N333;
float3 Port_Input1_N335;
float Port_Import_N134;
float Port_Input2_N136;
float Port_Import_N009;
float Port_Import_N010;
float Port_Import_N075;
float Port_Input0_N214;
float Port_Import_N012;
float Port_Import_N213;
float Port_Input1_N076;
float Port_Input2_N076;
float Port_Input0_N079;
float Port_Import_N064;
float Port_Import_N078;
float Port_Input1_N081;
float Port_Input2_N081;
float Port_Import_N126;
float Port_Import_N127;
float Port_Import_N128;
float Port_Input4_N137;
float Port_Multiplier_N272;
float Port_Import_N047;
float Port_Import_N048;
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
float l9_128=5.0;
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
float l9_146=5.0;
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
