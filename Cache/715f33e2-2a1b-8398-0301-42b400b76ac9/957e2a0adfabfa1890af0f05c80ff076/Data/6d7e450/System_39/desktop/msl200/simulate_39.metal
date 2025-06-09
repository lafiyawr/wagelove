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
//ubo int UserUniforms 0:31:7264 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_StereoClipPlanes 3664:[2]:16
//int overrideTimeEnabled 3980
//float overrideTimeElapsed 3984:[32]:4
//float overrideTimeDelta 4112
//bool vfxBatchEnable 4120:[32]:4
//bool vfxEmitParticle 4248:[32]:4
//float4x4 vfxModelMatrix 4384:[32]:64
//float3 vfxLocalAabbMin 6624
//float3 vfxLocalAabbMax 6640
//int vfxOffsetInstancesRead 7108
//int vfxOffsetInstancesWrite 7112
//float2 vfxTargetSizeRead 7120
//float2 vfxTargetSizeWrite 7128
//int vfxTargetWidth 7136
//float Port_SpawnRate_N006 7140
//float Port_Import_N005 7144
//float3 Port_Import_N017 7152
//float3 Port_Import_N018 7168
//float Port_Import_N043 7184
//float Port_Import_N050 7188
//float Port_Import_N051 7192
//float Port_Import_N058 7196
//float Port_Import_N053 7200
//float3 Port_Import_N054 7216
//float Port_Value_N030 7232
//float Port_Import_N070 7236
//float Port_Import_N126 7240
//float Port_Import_N127 7244
//float Port_Import_N128 7248
//float Port_Input4_N137 7252
//float Port_Multiplier_N272 7256
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
float Port_SpawnRate_N006;
float Port_Import_N005;
float3 Port_Import_N017;
float3 Port_Import_N018;
float Port_Import_N043;
float Port_Import_N050;
float Port_Import_N051;
float Port_Import_N058;
float Port_Import_N053;
float3 Port_Import_N054;
float Port_Value_N030;
float Port_Import_N070;
float Port_Import_N126;
float Port_Import_N127;
float Port_Import_N128;
float Port_Input4_N137;
float Port_Multiplier_N272;
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
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
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
int N63_SphereType=0;
float N63_Radius=0.0;
float3 N63_Scale=float3(0.0);
float3 N63_Center=float3(0.0);
float N63_VolumeFill=0.0;
bool N66_SizeMode=false;
float N66_SizeMin=0.0;
float N66_SizeMax=0.0;
float N66_SizeMul=0.0;
int N71_RotationAxis=0;
float N71_RotationAmount=0.0;
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
int l9_4=((*sc_set0.UserUniforms).vfxOffsetInstancesRead+gParticle.StateID)*3;
int l9_5=l9_4;
int l9_6=(*sc_set0.UserUniforms).vfxTargetWidth;
int l9_7=l9_5-((l9_5/l9_6)*l9_6);
int2 l9_8=int2(l9_7,l9_4/(*sc_set0.UserUniforms).vfxTargetWidth);
float2 l9_9=(float2(l9_8)+float2(0.5))/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeRead.y);
float2 l9_10=float2(0.00048828125,0.0);
float2 l9_11=l9_9+l9_10;
float2 l9_12=l9_11;
int l9_13=0;
if ((int(renderTarget0HasSwappedViews_tmp)!=0))
{
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=gl_InstanceIndex%2;
}
int l9_15=l9_14;
l9_13=1-l9_15;
}
else
{
int l9_16=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_16=0;
}
else
{
l9_16=gl_InstanceIndex%2;
}
int l9_17=l9_16;
l9_13=l9_17;
}
int l9_18=l9_13;
float2 l9_19=l9_12;
int l9_20=l9_18;
float2 l9_21=l9_19;
int l9_22=l9_20;
float l9_23=0.0;
float4 l9_24=float4(0.0);
float2 l9_25=l9_21;
int l9_26=l9_22;
float l9_27=l9_23;
float4 l9_28=float4(0.0);
float2 l9_29=l9_25;
int l9_30=renderTarget0Layout_tmp;
int l9_31=l9_26;
float l9_32=l9_27;
float2 l9_33=l9_29;
int l9_34=l9_30;
int l9_35=l9_31;
float3 l9_36=float3(0.0);
if (l9_34==0)
{
l9_36=float3(l9_33,0.0);
}
else
{
if (l9_34==1)
{
l9_36=float3(l9_33.x,(l9_33.y*0.5)+(0.5-(float(l9_35)*0.5)),0.0);
}
else
{
l9_36=float3(l9_33,float(l9_35));
}
}
float3 l9_37=l9_36;
float3 l9_38=l9_37;
float2 l9_39=l9_38.xy;
float l9_40=l9_32;
float4 l9_41=sc_set0.renderTarget0.sample(sc_set0.renderTarget0SmpSC,l9_39,level(l9_40));
float4 l9_42=l9_41;
l9_28=l9_42;
float4 l9_43=l9_28;
l9_24=l9_43;
float4 l9_44=l9_24;
float4 l9_45=l9_44;
float4 l9_46=l9_45;
float4 l9_47=l9_46;
float2 l9_48=l9_11;
int l9_49=0;
if ((int(renderTarget1HasSwappedViews_tmp)!=0))
{
int l9_50=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_50=0;
}
else
{
l9_50=gl_InstanceIndex%2;
}
int l9_51=l9_50;
l9_49=1-l9_51;
}
else
{
int l9_52=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_52=0;
}
else
{
l9_52=gl_InstanceIndex%2;
}
int l9_53=l9_52;
l9_49=l9_53;
}
int l9_54=l9_49;
float2 l9_55=l9_48;
int l9_56=l9_54;
float2 l9_57=l9_55;
int l9_58=l9_56;
float l9_59=0.0;
float4 l9_60=float4(0.0);
float2 l9_61=l9_57;
int l9_62=l9_58;
float l9_63=l9_59;
float4 l9_64=float4(0.0);
float2 l9_65=l9_61;
int l9_66=renderTarget1Layout_tmp;
int l9_67=l9_62;
float l9_68=l9_63;
float2 l9_69=l9_65;
int l9_70=l9_66;
int l9_71=l9_67;
float3 l9_72=float3(0.0);
if (l9_70==0)
{
l9_72=float3(l9_69,0.0);
}
else
{
if (l9_70==1)
{
l9_72=float3(l9_69.x,(l9_69.y*0.5)+(0.5-(float(l9_71)*0.5)),0.0);
}
else
{
l9_72=float3(l9_69,float(l9_71));
}
}
float3 l9_73=l9_72;
float3 l9_74=l9_73;
float2 l9_75=l9_74.xy;
float l9_76=l9_68;
float4 l9_77=sc_set0.renderTarget1.sample(sc_set0.renderTarget1SmpSC,l9_75,level(l9_76));
float4 l9_78=l9_77;
l9_64=l9_78;
float4 l9_79=l9_64;
l9_60=l9_79;
float4 l9_80=l9_60;
float4 l9_81=l9_80;
float4 l9_82=l9_81;
float4 l9_83=l9_82;
float4 l9_84=l9_47;
float l9_85=-1.0;
float l9_86=500000.0;
float4 l9_87=l9_84;
float l9_88=l9_85;
float l9_89=l9_86;
float l9_90=0.99998999;
float4 l9_91=l9_87;
#if (1)
{
l9_91=floor((l9_91*255.0)+float4(0.5))/float4(255.0);
}
#endif
float l9_92=dot(l9_91,float4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
float l9_93=l9_92;
float l9_94=0.0;
float l9_95=l9_90;
float l9_96=l9_88;
float l9_97=l9_89;
float l9_98=l9_96+(((l9_93-l9_94)*(l9_97-l9_96))/(l9_95-l9_94));
float l9_99=l9_98;
float l9_100=l9_99;
gParticle.SpawnIndex=l9_100;
float2 l9_101=l9_83.xy;
float l9_102=0.0;
float l9_103=300.0;
float2 l9_104=l9_101;
float l9_105=l9_102;
float l9_106=l9_103;
float l9_107=0.99998999;
float2 l9_108=l9_104;
#if (1)
{
l9_108=floor((l9_108*255.0)+float2(0.5))/float2(255.0);
}
#endif
float l9_109=dot(l9_108,float2(1.0,0.0039215689));
float l9_110=l9_109;
float l9_111=0.0;
float l9_112=l9_107;
float l9_113=l9_105;
float l9_114=l9_106;
float l9_115=l9_113+(((l9_110-l9_111)*(l9_114-l9_113))/(l9_112-l9_111));
float l9_116=l9_115;
float l9_117=l9_116;
gParticle.NextBurstTime=l9_117;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
int l9_118=gl_InstanceIndex;
Globals.gComponentTime=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_118/257];
Globals.gTimeDelta=fast::min((*sc_set0.UserUniforms).overrideTimeDelta,0.5);
Globals.gTimeElapsedShifted=(Globals.gTimeElapsed-(gParticle.TimeShift*Globals.gTimeDelta))-0.0;
int l9_119=gl_InstanceIndex;
if ((*sc_set0.UserUniforms).vfxEmitParticle[l9_119/257]!=0)
{
ssGlobals param_1=Globals;
gParticle.SpawnAmount+=((*sc_set0.UserUniforms).Port_SpawnRate_N006*param_1.gTimeDelta);
if (param_1.gTimeElapsed>=gParticle.NextBurstTime)
{
gParticle.NextBurstTime+=gParticle.BurstPeriod;
gParticle.SpawnAmount+=gParticle.BurstAmount;
}
gParticle.SpawnIndex+=gParticle.SpawnAmount;
gParticle.SpawnIndex=floor((gParticle.SpawnIndex*2000.0)+0.5)*0.00050000002;
if (gParticle.SpawnIndex>=256.0)
{
gParticle.SpawnIndexRemainder=mod(gParticle.SpawnIndex,256.0);
}
}
float l9_120=gParticle.Age;
bool l9_121=l9_120<=9.9999997e-05;
bool l9_122;
if (!l9_121)
{
l9_122=gParticle.Age>=(gParticle.Life-Globals.gTimeDelta);
}
else
{
l9_122=l9_121;
}
bool isSpawnCandidate=l9_122;
bool spawnWindowMin=gParticle.Index1DPerCopyF<=gParticle.SpawnIndex;
bool spawnWindowMax=gParticle.Index1DPerCopyF>=(gParticle.SpawnIndex-gParticle.SpawnAmount);
bool spawnRemainder=gParticle.Index1DPerCopyF<=gParticle.SpawnIndexRemainder;
bool l9_123=isSpawnCandidate;
bool l9_124;
if (l9_123)
{
l9_124=(spawnWindowMin&&spawnWindowMax)||spawnRemainder;
}
else
{
l9_124=l9_123;
}
ssGlobals tempGlobals;
if (l9_124)
{
ssGlobals param_2=Globals;
float l9_125=0.0;
l9_125=0.0;
float l9_126=0.0;
l9_126=(*sc_set0.UserUniforms).Port_Import_N050;
float l9_127=0.0;
l9_127=(*sc_set0.UserUniforms).Port_Import_N051;
float l9_128=0.0;
l9_128=fast::max((*sc_set0.UserUniforms).Port_Import_N058,0.0099999998);
float l9_129=l9_125;
float l9_130=l9_126;
float l9_131=l9_127;
float l9_132=l9_128;
ssGlobals l9_133=param_2;
float l9_134=0.0;
l9_134=0.0;
float l9_135=0.0;
l9_135=(*sc_set0.UserUniforms).Port_Import_N005;
float3 l9_136=float3(0.0);
l9_136=(*sc_set0.UserUniforms).Port_Import_N017;
float3 l9_137=float3(0.0);
l9_137=(*sc_set0.UserUniforms).Port_Import_N018;
float l9_138=0.0;
l9_138=fast::clamp((*sc_set0.UserUniforms).Port_Import_N043,0.0,1.0);
float l9_139=l9_134;
float l9_140=l9_135;
float3 l9_141=l9_136;
float3 l9_142=l9_137;
float l9_143=l9_138;
ssGlobals l9_144=l9_133;
ssParticle l9_145=gParticle;
int l9_146=int(gParticle.CopyId);
float l9_147;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_147=(*sc_set0.UserUniforms).overrideTimeElapsed[l9_146];
}
else
{
l9_147=(*sc_set0.UserUniforms).sc_Time.x;
}
float l9_148=l9_147;
l9_145.Seed=(l9_145.Ratio1D*0.97637898)+0.151235;
l9_145.Seed+=(floor(((((l9_148-l9_145.SpawnOffset)-0.0)+0.0)+7200.0)/3600.0)*4.32723);
l9_145.Seed=fract(abs(l9_145.Seed));
int2 l9_149=int2(l9_145.Index1D%400,l9_145.Index1D/400);
l9_145.Seed2000=(float2(l9_149)+float2(1.0))/float2(399.0);
gParticle=l9_145;
float l9_150=16.0;
gParticle.Position=(float3(((floor(mod(gParticle.Index1DPerCopyF,floor(l9_150)))/l9_150)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/floor(l9_150))/l9_150)*2.0)-1.0,0.0)*20.0)+float3(1.0,1.0,0.0);
gParticle.Velocity=float3(0.0);
gParticle.Color=float4(1.0);
gParticle.Age=0.0;
gParticle.Life=16.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(0.0,0.0,1.0));
gParticle.Quaternion=float4(0.0,0.0,0.0,1.0);
tempGlobals=l9_144;
N63_SphereType=int(l9_139);
N63_Radius=l9_140;
N63_Scale=l9_141;
N63_Center=l9_142;
N63_VolumeFill=l9_143;
bool l9_151=true;
bool l9_152=true;
bool l9_153=true;
float l9_154=0.0;
float3 l9_155=float3(0.0);
int l9_156=3;
bool l9_157=l9_153;
bool l9_158=l9_152;
bool l9_159=l9_151;
float l9_160=63.0;
ssParticle l9_161=gParticle;
float l9_162=l9_154;
float l9_163=tempGlobals.gTimeElapsed;
float4 l9_164=float4(0.0);
float4 l9_165=float4(0.0);
if (l9_157)
{
l9_165.x=floor(fract(l9_163)*1000.0);
}
if (l9_159)
{
l9_165.y=float(l9_161.Index1D^((l9_161.Index1D*15299)+l9_161.Index1D));
}
if (l9_158)
{
l9_165.z=l9_160;
}
l9_165.w=l9_162*1000.0;
int l9_166=int(l9_165.x);
int l9_167=int(l9_165.y);
int l9_168=int(l9_165.z);
int l9_169=int(l9_165.w);
int l9_170=(((l9_166*15299)^(l9_167*30133))^(l9_168*17539))^(l9_169*12113);
int l9_171=l9_170;
if (l9_156==1)
{
int l9_172=l9_171;
int l9_173=l9_172;
int l9_174=((l9_173*((l9_173*1471343)+101146501))+1559861749)&2147483647;
int l9_175=l9_174;
float l9_176=float(l9_175)*4.6566129e-10;
float l9_177=l9_176;
l9_164.x=l9_177;
}
else
{
if (l9_156==2)
{
int l9_178=l9_171;
int l9_179=l9_178;
int l9_180=((l9_179*((l9_179*1471343)+101146501))+1559861749)&2147483647;
int l9_181=l9_180;
int l9_182=l9_178*1399;
int l9_183=((l9_182*((l9_182*1471343)+101146501))+1559861749)&2147483647;
int l9_184=l9_183;
int l9_185=l9_181;
float l9_186=float(l9_185)*4.6566129e-10;
int l9_187=l9_184;
float l9_188=float(l9_187)*4.6566129e-10;
float2 l9_189=float2(l9_186,l9_188);
l9_164=float4(l9_189.x,l9_189.y,l9_164.z,l9_164.w);
}
else
{
if (l9_156==3)
{
int l9_190=l9_171;
int l9_191=l9_190;
int l9_192=((l9_191*((l9_191*1471343)+101146501))+1559861749)&2147483647;
int l9_193=l9_192;
int l9_194=l9_190*1399;
int l9_195=((l9_194*((l9_194*1471343)+101146501))+1559861749)&2147483647;
int l9_196=l9_195;
int l9_197=l9_190*7177;
int l9_198=((l9_197*((l9_197*1471343)+101146501))+1559861749)&2147483647;
int l9_199=l9_198;
int l9_200=l9_193;
float l9_201=float(l9_200)*4.6566129e-10;
int l9_202=l9_196;
float l9_203=float(l9_202)*4.6566129e-10;
int l9_204=l9_199;
float l9_205=float(l9_204)*4.6566129e-10;
float3 l9_206=float3(l9_201,l9_203,l9_205);
l9_164=float4(l9_206.x,l9_206.y,l9_206.z,l9_164.w);
}
else
{
int l9_207=l9_171;
int l9_208=l9_207;
int l9_209=((l9_208*((l9_208*1471343)+101146501))+1559861749)&2147483647;
int l9_210=l9_209;
int l9_211=l9_207*1399;
int l9_212=((l9_211*((l9_211*1471343)+101146501))+1559861749)&2147483647;
int l9_213=l9_212;
int l9_214=l9_207*7177;
int l9_215=((l9_214*((l9_214*1471343)+101146501))+1559861749)&2147483647;
int l9_216=l9_215;
int l9_217=l9_207*18919;
int l9_218=((l9_217*((l9_217*1471343)+101146501))+1559861749)&2147483647;
int l9_219=l9_218;
int l9_220=l9_210;
float l9_221=float(l9_220)*4.6566129e-10;
int l9_222=l9_213;
float l9_223=float(l9_222)*4.6566129e-10;
int l9_224=l9_216;
float l9_225=float(l9_224)*4.6566129e-10;
int l9_226=l9_219;
float l9_227=float(l9_226)*4.6566129e-10;
float4 l9_228=float4(l9_221,l9_223,l9_225,l9_227);
l9_164=l9_228;
}
}
}
float4 l9_229=l9_164;
l9_155=l9_229.xyz;
float3 l9_230=l9_155;
float3 l9_231=l9_230;
bool l9_232=true;
bool l9_233=true;
bool l9_234=true;
float l9_235=150.0;
float3 l9_236=float3(0.0);
int l9_237=3;
bool l9_238=l9_234;
bool l9_239=l9_233;
bool l9_240=l9_232;
float l9_241=63.0;
ssParticle l9_242=gParticle;
float l9_243=l9_235;
float l9_244=tempGlobals.gTimeElapsed;
float4 l9_245=float4(0.0);
float4 l9_246=float4(0.0);
if (l9_238)
{
l9_246.x=floor(fract(l9_244)*1000.0);
}
if (l9_240)
{
l9_246.y=float(l9_242.Index1D^((l9_242.Index1D*15299)+l9_242.Index1D));
}
if (l9_239)
{
l9_246.z=l9_241;
}
l9_246.w=l9_243*1000.0;
int l9_247=int(l9_246.x);
int l9_248=int(l9_246.y);
int l9_249=int(l9_246.z);
int l9_250=int(l9_246.w);
int l9_251=(((l9_247*15299)^(l9_248*30133))^(l9_249*17539))^(l9_250*12113);
int l9_252=l9_251;
if (l9_237==1)
{
int l9_253=l9_252;
int l9_254=l9_253;
int l9_255=((l9_254*((l9_254*1471343)+101146501))+1559861749)&2147483647;
int l9_256=l9_255;
float l9_257=float(l9_256)*4.6566129e-10;
float l9_258=l9_257;
l9_245.x=l9_258;
}
else
{
if (l9_237==2)
{
int l9_259=l9_252;
int l9_260=l9_259;
int l9_261=((l9_260*((l9_260*1471343)+101146501))+1559861749)&2147483647;
int l9_262=l9_261;
int l9_263=l9_259*1399;
int l9_264=((l9_263*((l9_263*1471343)+101146501))+1559861749)&2147483647;
int l9_265=l9_264;
int l9_266=l9_262;
float l9_267=float(l9_266)*4.6566129e-10;
int l9_268=l9_265;
float l9_269=float(l9_268)*4.6566129e-10;
float2 l9_270=float2(l9_267,l9_269);
l9_245=float4(l9_270.x,l9_270.y,l9_245.z,l9_245.w);
}
else
{
if (l9_237==3)
{
int l9_271=l9_252;
int l9_272=l9_271;
int l9_273=((l9_272*((l9_272*1471343)+101146501))+1559861749)&2147483647;
int l9_274=l9_273;
int l9_275=l9_271*1399;
int l9_276=((l9_275*((l9_275*1471343)+101146501))+1559861749)&2147483647;
int l9_277=l9_276;
int l9_278=l9_271*7177;
int l9_279=((l9_278*((l9_278*1471343)+101146501))+1559861749)&2147483647;
int l9_280=l9_279;
int l9_281=l9_274;
float l9_282=float(l9_281)*4.6566129e-10;
int l9_283=l9_277;
float l9_284=float(l9_283)*4.6566129e-10;
int l9_285=l9_280;
float l9_286=float(l9_285)*4.6566129e-10;
float3 l9_287=float3(l9_282,l9_284,l9_286);
l9_245=float4(l9_287.x,l9_287.y,l9_287.z,l9_245.w);
}
else
{
int l9_288=l9_252;
int l9_289=l9_288;
int l9_290=((l9_289*((l9_289*1471343)+101146501))+1559861749)&2147483647;
int l9_291=l9_290;
int l9_292=l9_288*1399;
int l9_293=((l9_292*((l9_292*1471343)+101146501))+1559861749)&2147483647;
int l9_294=l9_293;
int l9_295=l9_288*7177;
int l9_296=((l9_295*((l9_295*1471343)+101146501))+1559861749)&2147483647;
int l9_297=l9_296;
int l9_298=l9_288*18919;
int l9_299=((l9_298*((l9_298*1471343)+101146501))+1559861749)&2147483647;
int l9_300=l9_299;
int l9_301=l9_291;
float l9_302=float(l9_301)*4.6566129e-10;
int l9_303=l9_294;
float l9_304=float(l9_303)*4.6566129e-10;
int l9_305=l9_297;
float l9_306=float(l9_305)*4.6566129e-10;
int l9_307=l9_300;
float l9_308=float(l9_307)*4.6566129e-10;
float4 l9_309=float4(l9_302,l9_304,l9_306,l9_308);
l9_245=l9_309;
}
}
}
float4 l9_310=l9_245;
l9_236=l9_310.xyz;
float3 l9_311=l9_236;
float3 l9_312=l9_311;
float l9_313=1.0-N63_VolumeFill;
float l9_314=3.0;
float l9_315;
if (l9_313<=0.0)
{
l9_315=0.0;
}
else
{
l9_315=pow(l9_313,l9_314);
}
float l9_316=l9_315;
float l9_317=l9_316;
l9_231=mix(float3(l9_317),float3(1.0),l9_231);
float3 l9_318=l9_231;
float l9_319;
if (l9_318.x<=0.0)
{
l9_319=0.0;
}
else
{
l9_319=sqrt(l9_318.x);
}
float l9_320=l9_319;
float l9_321;
if (l9_318.y<=0.0)
{
l9_321=0.0;
}
else
{
l9_321=sqrt(l9_318.y);
}
float l9_322=l9_321;
float l9_323;
if (l9_318.z<=0.0)
{
l9_323=0.0;
}
else
{
l9_323=sqrt(l9_318.z);
}
float3 l9_324=float3(l9_320,l9_322,l9_323);
l9_231=l9_324;
l9_312=mix(float3(-1.0),float3(1.0),l9_312);
l9_312/=float3(length(l9_312+float3(9.9999997e-05)));
float3 l9_325=((l9_231*l9_312)*N63_Scale)*N63_Radius;
if (N63_SphereType==1)
{
l9_325.x=abs(l9_325.x);
}
else
{
if (N63_SphereType==2)
{
l9_325.y=abs(l9_325.y);
}
else
{
if (N63_SphereType==3)
{
l9_325.z=abs(l9_325.z);
}
}
}
l9_325+=N63_Center;
float3 l9_326=l9_325;
gParticle.Position=l9_326;
tempGlobals=l9_133;
N66_SizeMode=l9_129!=0.0;
N66_SizeMin=l9_130;
N66_SizeMax=l9_131;
N66_SizeMul=l9_132;
bool l9_327=true;
bool l9_328=true;
bool l9_329=true;
float l9_330=20.0;
float l9_331=0.0;
int l9_332=1;
bool l9_333=l9_329;
bool l9_334=l9_328;
bool l9_335=l9_327;
float l9_336=66.0;
ssParticle l9_337=gParticle;
float l9_338=l9_330;
float l9_339=tempGlobals.gTimeElapsed;
float4 l9_340=float4(0.0);
float4 l9_341=float4(0.0);
if (l9_333)
{
l9_341.x=floor(fract(l9_339)*1000.0);
}
if (l9_335)
{
l9_341.y=float(l9_337.Index1D^((l9_337.Index1D*15299)+l9_337.Index1D));
}
if (l9_334)
{
l9_341.z=l9_336;
}
l9_341.w=l9_338*1000.0;
int l9_342=int(l9_341.x);
int l9_343=int(l9_341.y);
int l9_344=int(l9_341.z);
int l9_345=int(l9_341.w);
int l9_346=(((l9_342*15299)^(l9_343*30133))^(l9_344*17539))^(l9_345*12113);
int l9_347=l9_346;
if (l9_332==1)
{
int l9_348=l9_347;
int l9_349=l9_348;
int l9_350=((l9_349*((l9_349*1471343)+101146501))+1559861749)&2147483647;
int l9_351=l9_350;
float l9_352=float(l9_351)*4.6566129e-10;
float l9_353=l9_352;
l9_340.x=l9_353;
}
else
{
if (l9_332==2)
{
int l9_354=l9_347;
int l9_355=l9_354;
int l9_356=((l9_355*((l9_355*1471343)+101146501))+1559861749)&2147483647;
int l9_357=l9_356;
int l9_358=l9_354*1399;
int l9_359=((l9_358*((l9_358*1471343)+101146501))+1559861749)&2147483647;
int l9_360=l9_359;
int l9_361=l9_357;
float l9_362=float(l9_361)*4.6566129e-10;
int l9_363=l9_360;
float l9_364=float(l9_363)*4.6566129e-10;
float2 l9_365=float2(l9_362,l9_364);
l9_340=float4(l9_365.x,l9_365.y,l9_340.z,l9_340.w);
}
else
{
if (l9_332==3)
{
int l9_366=l9_347;
int l9_367=l9_366;
int l9_368=((l9_367*((l9_367*1471343)+101146501))+1559861749)&2147483647;
int l9_369=l9_368;
int l9_370=l9_366*1399;
int l9_371=((l9_370*((l9_370*1471343)+101146501))+1559861749)&2147483647;
int l9_372=l9_371;
int l9_373=l9_366*7177;
int l9_374=((l9_373*((l9_373*1471343)+101146501))+1559861749)&2147483647;
int l9_375=l9_374;
int l9_376=l9_369;
float l9_377=float(l9_376)*4.6566129e-10;
int l9_378=l9_372;
float l9_379=float(l9_378)*4.6566129e-10;
int l9_380=l9_375;
float l9_381=float(l9_380)*4.6566129e-10;
float3 l9_382=float3(l9_377,l9_379,l9_381);
l9_340=float4(l9_382.x,l9_382.y,l9_382.z,l9_340.w);
}
else
{
int l9_383=l9_347;
int l9_384=l9_383;
int l9_385=((l9_384*((l9_384*1471343)+101146501))+1559861749)&2147483647;
int l9_386=l9_385;
int l9_387=l9_383*1399;
int l9_388=((l9_387*((l9_387*1471343)+101146501))+1559861749)&2147483647;
int l9_389=l9_388;
int l9_390=l9_383*7177;
int l9_391=((l9_390*((l9_390*1471343)+101146501))+1559861749)&2147483647;
int l9_392=l9_391;
int l9_393=l9_383*18919;
int l9_394=((l9_393*((l9_393*1471343)+101146501))+1559861749)&2147483647;
int l9_395=l9_394;
int l9_396=l9_386;
float l9_397=float(l9_396)*4.6566129e-10;
int l9_398=l9_389;
float l9_399=float(l9_398)*4.6566129e-10;
int l9_400=l9_392;
float l9_401=float(l9_400)*4.6566129e-10;
int l9_402=l9_395;
float l9_403=float(l9_402)*4.6566129e-10;
float4 l9_404=float4(l9_397,l9_399,l9_401,l9_403);
l9_340=l9_404;
}
}
}
float4 l9_405=l9_340;
l9_331=l9_405.x;
float l9_406=l9_331;
float l9_407=l9_406;
l9_407=mix(N66_SizeMin*N66_SizeMul,N66_SizeMax*N66_SizeMul,l9_407);
float3 l9_408=(*sc_set0.UserUniforms).vfxLocalAabbMax;
float3 l9_409=(*sc_set0.UserUniforms).vfxLocalAabbMin;
float l9_410=length(l9_408-l9_409);
float l9_411=N66_SizeMode ? (l9_407/l9_410) : l9_407;
gParticle.Size=l9_411;
float l9_412=0.0;
l9_412=(*sc_set0.UserUniforms).Port_Import_N053;
float3 l9_413=float3(0.0);
l9_413=(*sc_set0.UserUniforms).Port_Import_N054;
float3 l9_414=float3(0.0);
l9_414=gParticle.Position;
float3 l9_415=float3(0.0);
l9_415=l9_413-l9_414;
float3 l9_416=float3(0.0);
float3 l9_417=l9_415;
float l9_418=dot(l9_417,l9_417);
float l9_419;
if (l9_418>0.0)
{
l9_419=1.0/sqrt(l9_418);
}
else
{
l9_419=0.0;
}
float l9_420=l9_419;
float3 l9_421=l9_417*l9_420;
l9_416=l9_421;
float3 l9_422=float3(0.0);
l9_422=float3(l9_412)*l9_416;
gParticle.Force+=l9_422;
float l9_423=(*sc_set0.UserUniforms).Port_Value_N030;
gParticle.Life=l9_423;
gParticle.Life=fast::clamp(gParticle.Life,0.1,3600.0);
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*0.033330001);
gParticle.Force=float3(0.0);
int l9_424=gl_InstanceIndex;
gParticle.Position=((*sc_set0.UserUniforms).vfxModelMatrix[l9_424/257]*float4(gParticle.Position,1.0)).xyz;
int l9_425=gl_InstanceIndex;
int l9_426=l9_425/257;
gParticle.Velocity=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_426][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_426][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_426][2].xyz)*gParticle.Velocity;
int l9_427=gl_InstanceIndex;
int l9_428=l9_427/257;
gParticle.Force=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_428][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_428][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_428][2].xyz)*gParticle.Force;
int l9_429=gl_InstanceIndex;
int l9_430=gl_InstanceIndex;
int l9_431=gl_InstanceIndex;
gParticle.Size=fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_429/257][0].xyz),fast::max(length((*sc_set0.UserUniforms).vfxModelMatrix[l9_430/257][1].xyz),length((*sc_set0.UserUniforms).vfxModelMatrix[l9_431/257][2].xyz)))*gParticle.Size;
int l9_432=gl_InstanceIndex;
int l9_433=l9_432/257;
gParticle.Matrix=float3x3((*sc_set0.UserUniforms).vfxModelMatrix[l9_433][0].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_433][1].xyz,(*sc_set0.UserUniforms).vfxModelMatrix[l9_433][2].xyz)*gParticle.Matrix;
gParticle.Spawned=true;
}
if (gParticle.SpawnIndexRemainder>(-1.0))
{
gParticle.SpawnIndex=gParticle.SpawnIndexRemainder;
}
if (gParticle.Index1D==gParticle.StateID)
{
gParticle.Dead=false;
}
if (gParticle.Dead)
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
float4 l9_434=param_3;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_435=dot(l9_434,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_436=l9_435;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_436;
}
}
float4 l9_437=float4(param_3.x,-param_3.y,(param_3.z*0.5)+(param_3.w*0.5),param_3.w);
out.gl_Position=l9_437;
return out;
}
float Value_N69=0.0;
Value_N69=1.0;
float Value_N70=0.0;
Value_N70=(*sc_set0.UserUniforms).Port_Import_N070;
float3x3 ParticleMatrix_N71=float3x3(float3(0.0),float3(0.0),float3(0.0));
float param_4=Value_N69;
float param_5=Value_N70;
ssGlobals param_7=Globals;
tempGlobals=param_7;
float3x3 param_6=float3x3(float3(0.0),float3(0.0),float3(0.0));
N71_RotationAxis=int(param_4);
N71_RotationAmount=param_5;
float3 l9_439=gParticle.Velocity;
float3 l9_440=l9_439;
float l9_441=length(l9_440);
if (l9_441<0.1)
{
l9_440=float3(0.0,1.0,0.0);
}
else
{
l9_440/=float3(l9_441);
}
float3 l9_442=float3(-1.0,0.0,0.0);
if (N71_RotationAxis==1)
{
l9_442=l9_442.yxy;
}
else
{
if (N71_RotationAxis==2)
{
l9_442=l9_442.yyx;
}
}
l9_440=normalize(cross(l9_440,l9_442));
if (N71_RotationAxis==3)
{
l9_440=-l9_442.yyx;
}
float l9_443=tempGlobals.gTimeDelta;
float3 l9_444=l9_440;
float l9_445=((l9_441*N71_RotationAmount)*l9_443)*30.0;
float3 l9_446=normalize(l9_444);
float l9_447=sin(radians(l9_445));
float l9_448=cos(radians(l9_445));
float l9_449=1.0-l9_448;
float3x3 l9_450=float3x3(float3(((l9_449*l9_446.x)*l9_446.x)+l9_448,((l9_449*l9_446.x)*l9_446.y)-(l9_446.z*l9_447),((l9_449*l9_446.z)*l9_446.x)+(l9_446.y*l9_447)),float3(((l9_449*l9_446.x)*l9_446.y)+(l9_446.z*l9_447),((l9_449*l9_446.y)*l9_446.y)+l9_448,((l9_449*l9_446.y)*l9_446.z)-(l9_446.x*l9_447)),float3(((l9_449*l9_446.z)*l9_446.x)-(l9_446.y*l9_447),((l9_449*l9_446.y)*l9_446.z)+(l9_446.x*l9_447),((l9_449*l9_446.z)*l9_446.z)+l9_448));
float3x3 N71_ParticleMatrix=l9_450;
float4x4 l9_451=float4x4(float4(gParticle.Matrix[0].x,gParticle.Matrix[0].y,gParticle.Matrix[0].z,0.0),float4(gParticle.Matrix[1].x,gParticle.Matrix[1].y,gParticle.Matrix[1].z,0.0),float4(gParticle.Matrix[2].x,gParticle.Matrix[2].y,gParticle.Matrix[2].z,0.0),float4(0.0,0.0,0.0,1.0));
N71_ParticleMatrix=float3x3(l9_451[0].xyz,l9_451[1].xyz,l9_451[2].xyz)*N71_ParticleMatrix;
param_6=N71_ParticleMatrix;
ParticleMatrix_N71=param_6;
gParticle.Matrix=ParticleMatrix_N71;
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
Output_N273=Output_N141/(float3(Time_N272)+float3(1.234e-06));
float3 Output_N274=float3(0.0);
Output_N274=-Output_N273;
float3 Output_N275=float3(0.0);
Output_N275=fast::clamp(Output_N137,Output_N274,Output_N273);
gParticle.Force+=Output_N275;
float3x3 param_8=gParticle.Matrix;
gParticle.Quaternion=matrixToQuaternion(param_8);
float Drift=0.0049999999;
gParticle.Age+=Globals.gTimeDelta;
if (gParticle.Age>=gParticle.Life)
{
gParticle.Dead=true;
}
if (gParticle.Index1D==gParticle.StateID)
{
gParticle.Dead=false;
}
if (gParticle.Dead)
{
float4 param_9=float4(4334.0,4334.0,4334.0,0.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_9.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_452=param_9;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_453=dot(l9_452,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_454=l9_453;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_454;
}
}
float4 l9_455=float4(param_9.x,-param_9.y,(param_9.z*0.5)+(param_9.w*0.5),param_9.w);
out.gl_Position=l9_455;
return out;
}
float l9_456;
if (abs(gParticle.Force.x)<Drift)
{
l9_456=0.0;
}
else
{
l9_456=gParticle.Force.x;
}
gParticle.Force.x=l9_456;
float l9_457;
if (abs(gParticle.Force.y)<Drift)
{
l9_457=0.0;
}
else
{
l9_457=gParticle.Force.y;
}
gParticle.Force.y=l9_457;
float l9_458;
if (abs(gParticle.Force.z)<Drift)
{
l9_458=0.0;
}
else
{
l9_458=gParticle.Force.z;
}
gParticle.Force.z=l9_458;
gParticle.Mass=fast::max(Drift,gParticle.Mass);
if (Globals.gTimeDelta!=0.0)
{
gParticle.Velocity+=((gParticle.Force/float3(gParticle.Mass))*Globals.gTimeDelta);
}
float l9_459;
if (abs(gParticle.Velocity.x)<Drift)
{
l9_459=0.0;
}
else
{
l9_459=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_459;
float l9_460;
if (abs(gParticle.Velocity.y)<Drift)
{
l9_460=0.0;
}
else
{
l9_460=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_460;
float l9_461;
if (abs(gParticle.Velocity.z)<Drift)
{
l9_461=0.0;
}
else
{
l9_461=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_461;
gParticle.Position+=(gParticle.Velocity*Globals.gTimeDelta);
float2 QuadSize=float2(3.0,1.0)/float2(2048.0,(*sc_set0.UserUniforms).vfxTargetSizeWrite.y);
float2 Offset=float2(0.0);
int l9_462=gl_InstanceIndex;
int offsetID=(*sc_set0.UserUniforms).vfxOffsetInstancesWrite+l9_462;
int particleRow=682;
Offset.x=float(offsetID%particleRow);
Offset.y=float(offsetID/particleRow);
Offset*=QuadSize;
float2 Vertex=float2(0.0);
float l9_463;
if (v.texture0.x<0.5)
{
l9_463=0.0;
}
else
{
l9_463=QuadSize.x;
}
Vertex.x=l9_463;
float l9_464;
if (v.texture0.y<0.5)
{
l9_464=0.0;
}
else
{
l9_464=QuadSize.y;
}
Vertex.y=l9_464;
Vertex+=Offset;
float4 param_10=float4((Vertex*2.0)-float2(1.0),1.0,1.0);
if (sc_ShaderCacheConstant_tmp!=0)
{
param_10.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_465=param_10;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_466=dot(l9_465,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_467=l9_466;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_467;
}
}
float4 l9_468=float4(param_10.x,-param_10.y,(param_10.z*0.5)+(param_10.w*0.5),param_10.w);
out.gl_Position=l9_468;
int l9_469=gl_InstanceIndex;
out.Interp_Particle_Index=l9_469;
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
if (gParticle.Index1D==gParticle.StateID)
{
gParticle.Dead=false;
}
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
float4 l9_470=param_11;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_471=dot(l9_470,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_472=l9_471;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_472;
}
}
float4 l9_473=float4(param_11.x,-param_11.y,(param_11.z*0.5)+(param_11.w*0.5),param_11.w);
out.gl_Position=l9_473;
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
float Port_SpawnRate_N006;
float Port_Import_N005;
float3 Port_Import_N017;
float3 Port_Import_N018;
float Port_Import_N043;
float Port_Import_N050;
float Port_Import_N051;
float Port_Import_N058;
float Port_Import_N053;
float3 Port_Import_N054;
float Port_Value_N030;
float Port_Import_N070;
float Port_Import_N126;
float Port_Import_N127;
float Port_Import_N128;
float Port_Input4_N137;
float Port_Multiplier_N272;
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
int l9_0=int(floor(param.x*3.0));
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
float l9_128=3600.0;
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
float l9_146=3600.0;
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
float2 l9_177=l9_176.xy;
float2 l9_178=l9_177;
float2 l9_179=l9_178;
l9_1=float4(l9_179.x,l9_179.y,l9_1.z,l9_1.w);
l9_2=l9_1.x;
l9_3=l9_1.y;
float l9_180=gParticle.Quaternion.x;
float l9_181=-1.0;
float l9_182=1.0;
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
float2 l9_195=l9_194.xy;
float2 l9_196=l9_195;
float2 l9_197=l9_196;
l9_1=float4(l9_197.x,l9_197.y,l9_1.z,l9_1.w);
l9_4=l9_1.x;
l9_5=l9_1.y;
float l9_198=gParticle.Quaternion.y;
float l9_199=-1.0;
float l9_200=1.0;
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
float2 l9_213=l9_212.xy;
float2 l9_214=l9_213;
float2 l9_215=l9_214;
l9_1=float4(l9_215.x,l9_215.y,l9_1.z,l9_1.w);
l9_6=l9_1.x;
l9_7=l9_1.y;
float l9_216=gParticle.Quaternion.z;
float l9_217=-1.0;
float l9_218=1.0;
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
float2 l9_231=l9_230.xy;
float2 l9_232=l9_231;
float2 l9_233=l9_232;
l9_1=float4(l9_233.x,l9_233.y,l9_1.z,l9_1.w);
l9_8=l9_1.x;
l9_9=l9_1.y;
float l9_234=gParticle.Quaternion.w;
float l9_235=-1.0;
float l9_236=1.0;
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
float2 l9_249=l9_248.xy;
float2 l9_250=l9_249;
float2 l9_251=l9_250;
l9_1=float4(l9_251.x,l9_251.y,l9_1.z,l9_1.w);
l9_10=l9_1.x;
l9_11=l9_1.y;
float l9_252=gParticle.Color.x;
float l9_253=0.0;
float l9_254=1.00001;
float l9_255=fast::clamp(l9_252,l9_253,l9_254);
float l9_256=l9_253;
float l9_257=l9_254;
float l9_258=0.0;
float l9_259=1.0;
float l9_260=l9_258+(((l9_255-l9_256)*(l9_259-l9_258))/(l9_257-l9_256));
float l9_261=l9_260;
l9_1.x=l9_261;
l9_12=l9_1.x;
float l9_262=gParticle.Color.y;
float l9_263=0.0;
float l9_264=1.00001;
float l9_265=fast::clamp(l9_262,l9_263,l9_264);
float l9_266=l9_263;
float l9_267=l9_264;
float l9_268=0.0;
float l9_269=1.0;
float l9_270=l9_268+(((l9_265-l9_266)*(l9_269-l9_268))/(l9_267-l9_266));
float l9_271=l9_270;
l9_1.x=l9_271;
l9_13=l9_1.x;
float l9_272=gParticle.Color.z;
float l9_273=0.0;
float l9_274=1.00001;
float l9_275=fast::clamp(l9_272,l9_273,l9_274);
float l9_276=l9_273;
float l9_277=l9_274;
float l9_278=0.0;
float l9_279=1.0;
float l9_280=l9_278+(((l9_275-l9_276)*(l9_279-l9_278))/(l9_277-l9_276));
float l9_281=l9_280;
l9_1.x=l9_281;
l9_14=l9_1.x;
float l9_282=gParticle.Color.w;
float l9_283=0.0;
float l9_284=1.00001;
float l9_285=fast::clamp(l9_282,l9_283,l9_284);
float l9_286=l9_283;
float l9_287=l9_284;
float l9_288=0.0;
float l9_289=1.0;
float l9_290=l9_288+(((l9_285-l9_286)*(l9_289-l9_288))/(l9_287-l9_286));
float l9_291=l9_290;
l9_1.x=l9_291;
l9_15=l9_1.x;
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
float4 param_5=Data0;
float4 param_6=Data1;
int l9_292=(257*((in.Interp_Particle_Index/257)+1))-1;
if (in.Interp_Particle_Index==l9_292)
{
float l9_293=gParticle.SpawnIndex;
float l9_294=-1.0;
float l9_295=500000.0;
float l9_296=l9_293;
float l9_297=l9_294;
float l9_298=l9_295;
float l9_299=0.99998999;
float l9_300=fast::clamp(l9_296,l9_297,l9_298);
float l9_301=l9_297;
float l9_302=l9_298;
float l9_303=0.0;
float l9_304=l9_299;
float l9_305=l9_303+(((l9_300-l9_301)*(l9_304-l9_303))/(l9_302-l9_301));
float l9_306=l9_305;
float4 l9_307=float4(1.0,255.0,65025.0,16581375.0)*l9_306;
l9_307=fract(l9_307);
l9_307-=(l9_307.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float4 l9_308=l9_307;
float4 l9_309=l9_308;
float4 l9_310=l9_309;
param_5=l9_310;
float l9_311=gParticle.NextBurstTime;
float l9_312=0.0;
float l9_313=300.0;
float l9_314=l9_311;
float l9_315=l9_312;
float l9_316=l9_313;
float l9_317=0.99998999;
float l9_318=fast::clamp(l9_314,l9_315,l9_316);
float l9_319=l9_315;
float l9_320=l9_316;
float l9_321=0.0;
float l9_322=l9_317;
float l9_323=l9_321+(((l9_318-l9_319)*(l9_322-l9_321))/(l9_320-l9_319));
float l9_324=l9_323;
float4 l9_325=float4(1.0,255.0,65025.0,16581375.0)*l9_324;
l9_325=fract(l9_325);
l9_325-=(l9_325.yzww*float4(0.0039215689,0.0039215689,0.0039215689,0.0));
float2 l9_326=l9_325.xy;
float2 l9_327=l9_326;
float2 l9_328=l9_327;
param_6=float4(l9_328.x,l9_328.y,param_6.z,param_6.w);
}
Data0=param_5;
Data1=param_6;
if (dot(((Data0+Data1)+Data2)+Data3,float4(0.23454))==0.34231836)
{
Data0+=float4(1e-06);
}
float4 param_7=Data0;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_7.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_7;
float4 param_8=Data1;
out.FragColor1=param_8;
float4 param_9=Data2;
out.FragColor2=param_9;
float4 param_10=Data3;
out.FragColor3=param_10;
return out;
}
} // FRAGMENT SHADER
