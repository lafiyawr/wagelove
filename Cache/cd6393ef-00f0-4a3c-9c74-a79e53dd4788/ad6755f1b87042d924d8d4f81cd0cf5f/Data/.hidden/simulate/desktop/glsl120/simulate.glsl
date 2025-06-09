//SG_REFLECTION_BEGIN(100)
//sampler sampler noiseTexSmpSC 2:15
//sampler sampler renderTarget0SmpSC 2:16
//sampler sampler renderTarget1SmpSC 2:17
//sampler sampler renderTarget2SmpSC 2:18
//sampler sampler renderTarget3SmpSC 2:19
//texture texture3D noiseTex 2:1:2:15
//texture texture2D renderTarget0 2:2:2:16
//texture texture2D renderTarget1 2:3:2:17
//texture texture2D renderTarget2 2:4:2:18
//texture texture2D renderTarget3 2:5:2:19
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
#ifdef isIdle
#undef isIdle
#endif
#ifdef isAttracting
#undef isAttracting
#endif
#define SC_ENABLE_INSTANCED_RENDERING
#include <std2.glsl>
#include <std2_vs.glsl>
#include <std2_texture.glsl>
#include <std2_receiver.glsl>
#include <std2_fs.glsl>
struct ssParticle
{
vec3 Position;
vec3 Velocity;
vec4 Color;
float Size;
float Age;
float Life;
float Mass;
mat3 Matrix;
vec4 Quaternion;
float Dead;
float SpawnOffset;
float Seed;
vec2 Seed2000;
float TimeShift;
int Index1D;
float Coord1D;
float Ratio1D;
ivec2 Index2D;
vec2 Coord2D;
vec2 Ratio2D;
vec3 Force;
bool Spawned;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
};
#ifndef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 0
#elif renderTarget0HasSwappedViews==1
#undef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 1
#endif
#ifndef renderTarget0Layout
#define renderTarget0Layout 0
#endif
#ifndef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 0
#elif renderTarget1HasSwappedViews==1
#undef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 1
#endif
#ifndef renderTarget1Layout
#define renderTarget1Layout 0
#endif
#ifndef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 0
#elif renderTarget2HasSwappedViews==1
#undef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 1
#endif
#ifndef renderTarget2Layout
#define renderTarget2Layout 0
#endif
#ifndef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 0
#elif renderTarget3HasSwappedViews==1
#undef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 1
#endif
#ifndef renderTarget3Layout
#define renderTarget3Layout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 0
#elif SC_USE_UV_TRANSFORM_renderTarget0==1
#undef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget0 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget0 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 0
#elif SC_USE_UV_MIN_MAX_renderTarget0==1
#undef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget0==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 0
#elif SC_USE_UV_TRANSFORM_renderTarget1==1
#undef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget1 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget1 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 0
#elif SC_USE_UV_MIN_MAX_renderTarget1==1
#undef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget1==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 0
#elif SC_USE_UV_TRANSFORM_renderTarget2==1
#undef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget2 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget2 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 0
#elif SC_USE_UV_MIN_MAX_renderTarget2==1
#undef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget2==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 0
#elif SC_USE_UV_TRANSFORM_renderTarget3==1
#undef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget3 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget3 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 0
#elif SC_USE_UV_MIN_MAX_renderTarget3==1
#undef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget3==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 1
#endif
uniform vec4 intensityTextureDims;
uniform vec4 renderTarget0Dims;
uniform vec4 renderTarget1Dims;
uniform vec4 renderTarget2Dims;
uniform vec4 renderTarget3Dims;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform mat3 renderTarget0Transform;
uniform vec4 renderTarget0UvMinMax;
uniform vec4 renderTarget0BorderColor;
uniform mat3 renderTarget1Transform;
uniform vec4 renderTarget1UvMinMax;
uniform vec4 renderTarget1BorderColor;
uniform mat3 renderTarget2Transform;
uniform vec4 renderTarget2UvMinMax;
uniform vec4 renderTarget2BorderColor;
uniform mat3 renderTarget3Transform;
uniform vec4 renderTarget3UvMinMax;
uniform vec4 renderTarget3BorderColor;
uniform bool isIdle;
uniform vec3 influencePosition;
uniform float Port_TimeBias_N052;
uniform float Port_ValueA_N052;
uniform float Port_TimeA_N052;
uniform float Port_TimeTransition_N052;
uniform float Port_ValueB_N052;
uniform float Port_TimeB_N052;
uniform float Port_Input1_N053;
uniform bool isAttracting;
uniform float Port_Input1_N067;
uniform float Port_Input2_N067;
uniform float Port_Import_N058;
uniform vec3 Port_Min_N213;
uniform vec3 Port_Max_N213;
uniform float Port_Min_N254;
uniform float Port_Max_N254;
uniform float Port_Input1_N021;
uniform vec3 Port_Import_N212;
uniform vec3 Port_Import_N075;
uniform vec3 Port_Import_N076;
uniform vec3 Port_Input2_N060;
uniform float Port_Import_N099;
uniform float Port_Import_N109;
uniform float Port_Input1_N066;
uniform float Port_Input2_N066;
uniform float Port_Input1_N201;
uniform float Port_Input2_N201;
uniform float Port_Input1_N200;
uniform float Port_Input2_N200;
uniform vec4 colorA;
uniform vec4 colorB;
uniform vec4 colorC;
uniform vec4 colorD;
uniform vec4 colorE;
uniform float Port_Min_N019;
uniform float Port_Max_N019;
uniform float Port_Input1_N166;
uniform float Port_Input1_N164;
uniform float Port_Input1_N165;
uniform float Port_Input2_N165;
uniform float Port_Position1_N172;
uniform float Port_Position2_N172;
uniform float Port_Position3_N172;
uniform vec4 Port_Input1_N065;
uniform float _sc_allow16TexturesMarker;
uniform float overrideTimeDelta;
uniform vec3 Port_Import_N081;
uniform float Port_RangeMinA_N178;
uniform float Port_RangeMaxA_N178;
uniform float Port_RangeMinB_N178;
uniform float Port_RangeMaxB_N178;
uniform float Port_Value4_N102;
uniform float Port_Value4_N117;
uniform float Port_Value4_N126;
uniform vec4 Port_Column3_N127;
uniform float Port_Input1_N114;
uniform float Port_Input2_N114;
uniform float Port_RangeMinA_N133;
uniform float Port_RangeMaxA_N133;
uniform float Port_RangeMaxB_N133;
uniform float Port_Input1_N018;
uniform float Port_Input1_N237;
uniform vec3 Port_Import_N205;
uniform vec3 Port_Import_N206;
uniform float Port_Multiplier_N207;
uniform vec3 Port_Import_N210;
uniform float Port_Input1_N222;
uniform float Port_Input1_N229;
uniform float Port_Import_N049;
uniform float Port_Import_N051;
uniform float Port_Import_N050;
uniform float Port_Input4_N224;
uniform float Port_Input1_N241;
uniform float Port_Input1_N063;
uniform float Port_Input2_N063;
uniform float Port_Input1_N008;
uniform float Port_Import_N079;
uniform float Port_Import_N091;
uniform float Port_Input1_N266;
uniform float Port_Input2_N266;
uniform float Port_Input0_N143;
uniform float Port_Input1_N182;
uniform float Port_Input2_N182;
uniform float Port_Import_N188;
uniform float Port_Input0_N193;
uniform float Port_Input1_N236;
uniform float Port_Input2_N236;
uniform float correctedIntensity;
uniform vec4 intensityTextureSize;
uniform vec4 intensityTextureView;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float reflBlurWidth;
uniform float reflBlurMinRough;
uniform float reflBlurMaxRough;
uniform vec4 renderTarget0Size;
uniform vec4 renderTarget0View;
uniform vec4 renderTarget1Size;
uniform vec4 renderTarget1View;
uniform vec4 renderTarget2Size;
uniform vec4 renderTarget2View;
uniform vec4 renderTarget3Size;
uniform vec4 renderTarget3View;
uniform vec3 vfxLocalAabbMin;
uniform vec3 vfxWorldAabbMin;
uniform vec3 vfxLocalAabbMax;
uniform vec3 vfxWorldAabbMax;
uniform float vfxCameraAspect;
uniform float vfxCameraNear;
uniform float vfxCameraFar;
uniform vec3 vfxCameraUp;
uniform vec3 vfxCameraForward;
uniform vec3 vfxCameraRight;
uniform mat4 vfxModelMatrix;
uniform mat4 vfxModelMatrixInverse;
uniform mat4 vfxModelViewMatrix;
uniform mat4 vfxModelViewMatrixInverse;
uniform mat4 vfxProjectionMatrix;
uniform mat4 vfxProjectionMatrixInverse;
uniform mat4 vfxModelViewProjectionMatrix;
uniform mat4 vfxModelViewProjectionMatrixInverse;
uniform mat4 vfxViewMatrix;
uniform mat4 vfxViewMatrixInverse;
uniform mat4 vfxViewProjectionMatrix;
uniform mat4 vfxViewProjectionMatrixInverse;
uniform int vfxFrame;
uniform vec4 noiseTexSize;
uniform vec2 noiseTexDepth;
uniform vec3 Port_Import_N216;
uniform float Port_Import_N214;
uniform float Port_Import_N062;
uniform vec3 Port_Import_N059;
uniform float Port_Import_N087;
uniform float Port_Import_N308;
uniform vec3 Port_Import_N309;
uniform vec3 Port_Import_N202;
uniform float Port_Import_N150;
uniform float Port_Import_N155;
uniform float Port_Import_N191;
uniform float Port_Import_N185;
uniform float Port_Import_N138;
uniform float Port_Import_N192;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
uniform sampler3D noiseTex;
flat varying int Interp_Particle_Index;
varying vec2 Interp_Particle_Coord;
varying vec3 Interp_Particle_Force;
varying vec4 Interp_Particle_Color;
varying float Interp_Particle_Size;
varying float Interp_Particle_Mass;
varying vec3 Interp_Particle_Velocity;
varying vec3 Interp_Particle_Position;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Dead;
varying vec4 varColor;
ssParticle gParticle;
void ssDecodeParticle(int InstanceID)
{
gParticle.Position=vec3(0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(0.0);
gParticle.Size=0.0;
gParticle.Age=0.0;
gParticle.Life=0.0;
gParticle.Mass=1.0;
gParticle.Quaternion=vec4(0.0);
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
int l9_0=InstanceID;
ivec2 l9_1=ivec2(l9_0%512,l9_0/512);
float l9_2=float(l9_0);
vec2 l9_3=vec2(l9_1);
float l9_4=l9_2*0.000625391;
float l9_5=l9_2*0.00500313;
float l9_6;
if (overrideTimeEnabled==1)
{
l9_6=overrideTimeElapsed;
}
else
{
l9_6=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,gParticle.Quaternion,gParticle.Dead,l9_5,fract(abs(((l9_2*0.000610619)+0.151235)+(floor(((l9_6-l9_5)+16.0)*0.125)*4.32723))),(vec2(ivec2(l9_0%400,l9_0/400))+vec2(1.0))*vec2(0.00250627),floor(fract(sin(dot(vec2(l9_4)*vec2(0.3452,0.52254),vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001,l9_0,(l9_2+0.5)*0.000625,l9_4,l9_1,(l9_3+vec2(0.5))*vec2(0.00195312,0.25),l9_3*vec2(0.00195695,0.333333),vec3(0.0),false);
int l9_7=InstanceID;
int l9_8=l9_7*4;
int l9_9=InstanceID;
vec2 l9_10=(vec2(ivec2(l9_8-((l9_8/2048)*2048),(l9_9*4)/2048))+vec2(0.5))*vec2(0.000488281,0.25);
int l9_11;
#if (renderTarget0HasSwappedViews)
{
l9_11=1-sc_GetStereoViewIndex();
}
#else
{
l9_11=sc_GetStereoViewIndex();
}
#endif
vec4 l9_12=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_11,l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_13;
#if (renderTarget1HasSwappedViews)
{
l9_13=1-sc_GetStereoViewIndex();
}
#else
{
l9_13=sc_GetStereoViewIndex();
}
#endif
vec4 l9_14=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_13,l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_15;
#if (renderTarget2HasSwappedViews)
{
l9_15=1-sc_GetStereoViewIndex();
}
#else
{
l9_15=sc_GetStereoViewIndex();
}
#endif
vec4 l9_16=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_15,l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_17;
#if (renderTarget3HasSwappedViews)
{
l9_17=1-sc_GetStereoViewIndex();
}
#else
{
l9_17=sc_GetStereoViewIndex();
}
#endif
gParticle.Color.x=dot(floor((l9_12*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*1.00001;
gParticle.Color.y=dot(floor((l9_14*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*1.00001;
gParticle.Color.z=dot(floor((l9_16*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*1.00001;
gParticle.Color.w=dot(floor((sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,l9_17,l9_10,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3)*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*1.00001;
vec2 l9_18=l9_10+vec2(0.000488281,0.0);
int l9_19;
#if (renderTarget0HasSwappedViews)
{
l9_19=1-sc_GetStereoViewIndex();
}
#else
{
l9_19=sc_GetStereoViewIndex();
}
#endif
vec4 l9_20=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_19,l9_18,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_21;
#if (renderTarget1HasSwappedViews)
{
l9_21=1-sc_GetStereoViewIndex();
}
#else
{
l9_21=sc_GetStereoViewIndex();
}
#endif
vec4 l9_22=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_21,l9_18,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_23;
#if (renderTarget2HasSwappedViews)
{
l9_23=1-sc_GetStereoViewIndex();
}
#else
{
l9_23=sc_GetStereoViewIndex();
}
#endif
vec4 l9_24=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_23,l9_18,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_25;
#if (renderTarget3HasSwappedViews)
{
l9_25=1-sc_GetStereoViewIndex();
}
#else
{
l9_25=sc_GetStereoViewIndex();
}
#endif
gParticle.Size=dot(floor((l9_20*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*100.001;
gParticle.Mass=dot(floor((l9_22*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*1000.01;
gParticle.Velocity.x=(-1000.0)+(dot(floor((l9_24*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*2000.02);
gParticle.Velocity.y=(-1000.0)+(dot(floor((sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,l9_25,l9_18,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3)*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*2000.02);
vec2 l9_26=l9_10+vec2(0.000976562,0.0);
int l9_27;
#if (renderTarget0HasSwappedViews)
{
l9_27=1-sc_GetStereoViewIndex();
}
#else
{
l9_27=sc_GetStereoViewIndex();
}
#endif
vec4 l9_28=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_27,l9_26,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_29;
#if (renderTarget1HasSwappedViews)
{
l9_29=1-sc_GetStereoViewIndex();
}
#else
{
l9_29=sc_GetStereoViewIndex();
}
#endif
vec4 l9_30=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_29,l9_26,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_31;
#if (renderTarget2HasSwappedViews)
{
l9_31=1-sc_GetStereoViewIndex();
}
#else
{
l9_31=sc_GetStereoViewIndex();
}
#endif
vec4 l9_32=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_31,l9_26,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_33;
#if (renderTarget3HasSwappedViews)
{
l9_33=1-sc_GetStereoViewIndex();
}
#else
{
l9_33=sc_GetStereoViewIndex();
}
#endif
gParticle.Velocity.z=(-1000.0)+(dot(floor((l9_28*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*2000.02);
gParticle.Position.x=(-1000.0)+(dot(floor((l9_30*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*2000.02);
gParticle.Position.y=(-1000.0)+(dot(floor((l9_32*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*2000.02);
gParticle.Position.z=(-1000.0)+(dot(floor((sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,l9_33,l9_26,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3)*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*2000.02);
vec2 l9_34=l9_10+vec2(0.00146484,0.0);
int l9_35;
#if (renderTarget0HasSwappedViews)
{
l9_35=1-sc_GetStereoViewIndex();
}
#else
{
l9_35=sc_GetStereoViewIndex();
}
#endif
vec4 l9_36=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_35,l9_34,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_37;
#if (renderTarget1HasSwappedViews)
{
l9_37=1-sc_GetStereoViewIndex();
}
#else
{
l9_37=sc_GetStereoViewIndex();
}
#endif
vec4 l9_38=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_37,l9_34,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_39;
#if (renderTarget2HasSwappedViews)
{
l9_39=1-sc_GetStereoViewIndex();
}
#else
{
l9_39=sc_GetStereoViewIndex();
}
#endif
vec4 l9_40=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_39,l9_34,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_41;
#if (renderTarget3HasSwappedViews)
{
l9_41=1-sc_GetStereoViewIndex();
}
#else
{
l9_41=sc_GetStereoViewIndex();
}
#endif
gParticle.Life=dot(floor((l9_36*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*8.00008;
gParticle.Age=dot(floor((l9_38*255.0)+vec4(0.5))*vec4(0.00392157),vec4(1.0,0.00392157,1.53787e-05,6.03086e-08))*8.00008;
gParticle.Dead=floor((l9_40.x*255.0)+0.5);
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+vec3(0.5))*0.0005;
gParticle.Position=floor((gParticle.Position*2000.0)+vec3(0.5))*0.0005;
gParticle.Color=floor((gParticle.Color*2000.0)+vec4(0.5))*0.0005;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.0005;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.0005;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.0005;
}
vec4 ssGetParticleRandom(int Dimension,bool UseTime,bool UseNodeID,bool UseParticleID,float NodeID,vec2 ParticleSeed,float ExtraSeed,float Time)
{
vec4 l9_0;
if (UseTime)
{
l9_0=vec4(0.3234,0.6574,0.2258,0.8763)+(floor(vec4(fract(Time*10.0))*10000.0)*0.0001);
}
else
{
l9_0=vec4(1.0);
}
float l9_1;
if (UseNodeID)
{
l9_1=1.0+((NodeID+1.0)*0.01);
}
else
{
l9_1=1.0;
}
vec2 l9_2;
if (UseParticleID)
{
l9_2=ParticleSeed;
}
else
{
l9_2=vec2(1.0);
}
ExtraSeed=(ExtraSeed+1.0)*0.5;
vec4 l9_3;
if (Dimension>=1)
{
vec4 l9_4=vec4(0.0);
l9_4.x=floor(fract(sin(dot((((vec2(0.2353,0.7875)*l9_2)*l9_1)*l9_0.x)*ExtraSeed,vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001;
l9_3=l9_4;
}
else
{
l9_3=vec4(0.0);
}
vec4 l9_5;
if (Dimension>=2)
{
vec4 l9_6=l9_3;
l9_6.y=floor(fract(sin(dot((((vec2(0.5751,0.6273)*l9_2)*l9_1)*l9_0.y)*ExtraSeed,vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001;
l9_5=l9_6;
}
else
{
l9_5=l9_3;
}
vec4 l9_7;
if (Dimension>=3)
{
vec4 l9_8=l9_5;
l9_8.z=floor(fract(sin(dot((((vec2(0.6947,0.5217)*l9_2)*l9_1)*l9_0.z)*ExtraSeed,vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001;
l9_7=l9_8;
}
else
{
l9_7=l9_5;
}
vec4 l9_9;
if (Dimension>=4)
{
vec4 l9_10=l9_7;
l9_10.w=floor(fract(sin(dot((((vec2(0.4789,0.3967)*l9_2)*l9_1)*l9_0.w)*ExtraSeed,vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001;
l9_9=l9_10;
}
else
{
l9_9=l9_7;
}
return l9_9;
}
void SpawnParticle(ssGlobals Globals)
{
float l9_0;
if (overrideTimeEnabled==1)
{
l9_0=overrideTimeElapsed;
}
else
{
l9_0=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,gParticle.Quaternion,gParticle.Dead,gParticle.SpawnOffset,fract(abs(((gParticle.Ratio1D*0.976379)+0.151235)+(floor(((l9_0-gParticle.SpawnOffset)+16.0)*0.125)*4.32723))),(vec2(ivec2(gParticle.Index1D%400,gParticle.Index1D/400))+vec2(1.0))*vec2(0.00250627),gParticle.TimeShift,gParticle.Index1D,gParticle.Coord1D,gParticle.Ratio1D,gParticle.Index2D,gParticle.Coord2D,gParticle.Ratio2D,gParticle.Force,gParticle.Spawned);
gParticle.Position=(vec3((float(gParticle.Index1D-((gParticle.Index1D/40)*40))*0.05)-1.0,(float(gParticle.Index1D/40)*0.05)-1.0,0.0)*20.0)+vec3(1.0,1.0,0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(1.0);
gParticle.Dead=0.0;
gParticle.Age=0.0;
gParticle.Life=8.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Quaternion=vec4(0.0,0.0,0.0,1.0);
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
ssGlobals l9_1=Globals;
bool l9_2=float(isIdle)!=0.0;
vec3 l9_3;
if (l9_2)
{
float l9_4=((Port_TimeA_N052+Port_TimeTransition_N052)+Port_TimeB_N052)+0.0001;
float l9_5=mix(Port_ValueA_N052,Port_ValueB_N052,smoothstep(Port_TimeA_N052/l9_4,1.0-(Port_TimeB_N052/l9_4),abs((mod((l9_1.gTimeElapsedShifted/l9_4)+Port_TimeBias_N052,1.0)*2.0)-1.0)))*Port_Input1_N053;
l9_3=vec3(l9_5,l9_5,0.0);
}
else
{
l9_3=influencePosition;
}
vec4 l9_6=ssGetParticleRandom(3,true,true,true,213.0,gParticle.Seed2000,1.0,Globals.gTimeElapsed);
vec3 l9_7=mix(Port_Min_N213,Port_Max_N213,l9_6.xyz);
vec4 l9_8=ssGetParticleRandom(1,true,true,true,254.0,gParticle.Seed2000,1.0,Globals.gTimeElapsed);
float l9_9=mix(Port_Min_N254,Port_Max_N254,l9_8.x);
float l9_10;
if (l9_9<=0.0)
{
l9_10=0.0;
}
else
{
l9_10=sqrt(l9_9);
}
float l9_11;
if (l9_10<=0.0)
{
l9_11=0.0;
}
else
{
l9_11=sqrt(l9_10);
}
float l9_12;
if (l9_2)
{
l9_12=Port_Input1_N021;
}
else
{
float l9_13;
if (float(isAttracting)!=0.0)
{
l9_13=Port_Input1_N067;
}
else
{
l9_13=Port_Input2_N067;
}
l9_12=l9_13;
}
gParticle.Position=l9_3+((((l9_7/vec3(length(l9_7)))*vec3(l9_11))*vec3(l9_12))*Port_Import_N212);
gParticle.Velocity+=mix(Port_Import_N075,Port_Import_N076,ssGetParticleRandom(3,true,true,true,77.0,gParticle.Seed2000,1.0,Globals.gTimeElapsed).xyz);
ssGlobals l9_14=Globals;
vec3 l9_15;
if (l9_2)
{
vec3 l9_16;
if (l9_2)
{
float l9_17=((Port_TimeA_N052+Port_TimeTransition_N052)+Port_TimeB_N052)+0.0001;
float l9_18=mix(Port_ValueA_N052,Port_ValueB_N052,smoothstep(Port_TimeA_N052/l9_17,1.0-(Port_TimeB_N052/l9_17),abs((mod((l9_14.gTimeElapsedShifted/l9_17)+Port_TimeBias_N052,1.0)*2.0)-1.0)))*Port_Input1_N053;
l9_16=vec3(l9_18,l9_18,0.0);
}
else
{
l9_16=influencePosition;
}
vec3 l9_19=gParticle.Position;
vec3 l9_20=l9_16-l9_19;
float l9_21=dot(l9_20,l9_20);
float l9_22;
if (l9_21>0.0)
{
l9_22=1.0/sqrt(l9_21);
}
else
{
l9_22=0.0;
}
l9_15=vec3(Port_Import_N058)*(l9_20*l9_22);
}
else
{
l9_15=Port_Input2_N060;
}
gParticle.Force+=l9_15;
gParticle.Mass=mix(Port_Import_N099,Port_Import_N109,ssGetParticleRandom(1,true,true,true,110.0,gParticle.Seed2000,1.0,Globals.gTimeElapsed).x);
gParticle.Mass=max(1e-05,gParticle.Mass);
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*0.03333);
gParticle.Force=vec3(0.0);
}
void Node65_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if (Input0!=0.0)
{
Output=Input1;
}
else
{
vec4 l9_0=ssGetParticleRandom(1,false,true,true,19.0,gParticle.Seed2000,1.0,Globals.gTimeElapsed);
vec3 l9_1=gParticle.Position;
float l9_2=clamp(clamp((mix(Port_Min_N019,Port_Max_N019,l9_0.x)*(Port_Input1_N166+(distance(influencePosition,l9_1)*Port_Input1_N164)))+0.001,Port_Input1_N165+0.001,Port_Input2_N165+0.001)-0.001,0.0,1.0);
vec4 l9_3;
if (l9_2<Port_Position1_N172)
{
l9_3=mix(colorA,colorB,vec4(clamp(l9_2/Port_Position1_N172,0.0,1.0)));
}
else
{
vec4 l9_4;
if (l9_2<Port_Position2_N172)
{
l9_4=mix(colorB,colorC,vec4(clamp((l9_2-Port_Position1_N172)/(Port_Position2_N172-Port_Position1_N172),0.0,1.0)));
}
else
{
vec4 l9_5;
if (l9_2<Port_Position3_N172)
{
l9_5=mix(colorC,colorD,vec4(clamp((l9_2-Port_Position2_N172)/(Port_Position3_N172-Port_Position2_N172),0.0,1.0)));
}
else
{
l9_5=mix(colorD,colorE,vec4(clamp((l9_2-Port_Position3_N172)/(1.0-Port_Position3_N172),0.0,1.0)));
}
l9_4=l9_5;
}
l9_3=l9_4;
}
Input2=l9_3;
Output=Input2;
}
}
void main()
{
vec2 l9_0=sc_LoadVertexAttributes().texture0;
vec2 l9_1;
#if (sc_IsEditor)
{
vec2 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_allow16TexturesMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
ssDecodeParticle(sc_GetLocalInstanceID());
bool l9_3=overrideTimeEnabled==1;
float l9_4;
if (l9_3)
{
l9_4=overrideTimeElapsed;
}
else
{
l9_4=sc_Time.x;
}
float l9_5;
if (l9_3)
{
l9_5=overrideTimeDelta;
}
else
{
l9_5=max(sc_Time.y,0.0);
}
float l9_6=gParticle.TimeShift;
float l9_7=l9_6*l9_5;
float l9_8=l9_4-l9_7;
gParticle.Age=mod(l9_8-gParticle.SpawnOffset,8.0);
float l9_9=gParticle.SpawnOffset;
float l9_10=l9_4-l9_9;
bool l9_11=l9_10<0.0;
bool l9_12;
if (!l9_11)
{
l9_12=gParticle.Age>8.0;
}
else
{
l9_12=l9_11;
}
bool l9_13=l9_12 ? true : false;
bool l9_14=!l9_13;
bool l9_15;
if (l9_14)
{
l9_15=gParticle.Life<=0.0001;
}
else
{
l9_15=l9_14;
}
bool l9_16;
if (!l9_15)
{
l9_16=mod(l9_4-gParticle.SpawnOffset,8.0)<=l9_5;
}
else
{
l9_16=l9_15;
}
if (l9_16)
{
SpawnParticle(ssGlobals(l9_4,l9_5,l9_8));
gParticle.Spawned=true;
}
float l9_17=dot(Port_Import_N081,Port_Import_N081);
float l9_18;
if (l9_17>0.0)
{
l9_18=1.0/sqrt(l9_17);
}
else
{
l9_18=0.0;
}
vec3 l9_19=Port_Import_N081*l9_18;
float l9_20=l9_19.x;
float l9_21=l9_19.y;
float l9_22=l9_19.z;
vec3 l9_23=gParticle.Position;
float l9_24=(((length(l9_23)-Port_RangeMinA_N178)/(Port_RangeMaxA_N178-Port_RangeMinA_N178))*(Port_RangeMaxB_N178-Port_RangeMinB_N178))+Port_RangeMinB_N178;
float l9_25;
if (Port_RangeMaxB_N178>Port_RangeMinB_N178)
{
l9_25=clamp(l9_24,Port_RangeMinB_N178,Port_RangeMaxB_N178);
}
else
{
l9_25=clamp(l9_24,Port_RangeMaxB_N178,Port_RangeMinB_N178);
}
float l9_26=cos(l9_25);
float l9_27=1.0-l9_26;
float l9_28=(l9_20*l9_21)*l9_27;
float l9_29=sin(l9_25);
float l9_30=l9_22*l9_29;
float l9_31=(l9_22*l9_20)*l9_27;
float l9_32=l9_21*l9_29;
float l9_33=(l9_21*l9_22)*l9_27;
float l9_34=l9_20*l9_29;
float l9_35=gParticle.Age;
float l9_36=gParticle.Life;
bool l9_37=float(isIdle)!=0.0;
float l9_38;
if (l9_37)
{
l9_38=Port_Input1_N114;
}
else
{
l9_38=Port_Input2_N114;
}
float l9_39=Port_RangeMaxB_N133-l9_38;
float l9_40=(((clamp(l9_35/l9_36,0.0,1.0)-Port_RangeMinA_N133)/(Port_RangeMaxA_N133-Port_RangeMinA_N133))*l9_39)+l9_38;
bool l9_41=float(isAttracting)!=0.0;
if (l9_41)
{
gParticle.Force=((mat3(vec4(((l9_20*l9_20)*l9_27)+l9_26,l9_28-l9_30,l9_31+l9_32,0.0).xyz,vec4(l9_28+l9_30,((l9_21*l9_21)*l9_27)+l9_26,l9_33-l9_34,0.0).xyz,vec4(l9_31-l9_32,l9_33+l9_34,((l9_22*l9_22)*l9_27)+l9_26,0.0).xyz)*l9_23)-l9_23)*vec3(l9_40);
}
float l9_42;
if (l9_37)
{
l9_42=Port_Input1_N018;
}
else
{
float l9_43;
if (l9_41)
{
l9_43=Port_Input1_N066;
}
else
{
l9_43=Port_Input2_N066;
}
l9_42=l9_43;
}
float l9_44=gParticle.Mass;
float l9_45=l9_42*l9_44;
ssGlobals l9_46=ssGlobals(l9_4,l9_5,l9_8);
vec3 l9_47;
if (l9_37)
{
float l9_48=((Port_TimeA_N052+Port_TimeTransition_N052)+Port_TimeB_N052)+0.0001;
float l9_49=mix(Port_ValueA_N052,Port_ValueB_N052,smoothstep(Port_TimeA_N052/l9_48,1.0-(Port_TimeB_N052/l9_48),abs((mod((l9_8/l9_48)+Port_TimeBias_N052,1.0)*2.0)-1.0)))*Port_Input1_N053;
l9_47=vec3(l9_49,l9_49,0.0);
}
else
{
l9_47=influencePosition;
}
vec3 l9_50=gParticle.Position;
vec3 l9_51=l9_47-l9_50;
float l9_52=dot(l9_51,l9_51);
float l9_53;
if (l9_52>0.0)
{
l9_53=1.0/sqrt(l9_52);
}
else
{
l9_53=0.0;
}
gParticle.Force+=(vec3(l9_45)*(l9_51*l9_53));
float l9_54;
if (l9_37)
{
l9_54=Port_Input1_N237;
}
else
{
float l9_55;
if (l9_41)
{
l9_55=Port_Input1_N201;
}
else
{
l9_55=Port_Input2_N201;
}
l9_54=l9_55;
}
gParticle.Force+=(vec3(l9_54)*((sc_SampleTextureBiasOrLevel((((gParticle.Position+Port_Import_N205)+(Port_Import_N206*vec3(l9_8*Port_Multiplier_N207)))+Port_Import_N210)*(vec3(1.0)/(Port_Import_N210*vec3(Port_Input1_N222))),true,0.0,noiseTex)*vec4(Port_Input1_N229))-vec4(1.0)).xyz);
gParticle.Force+=((((((-gParticle.Velocity)*vec3(length(gParticle.Velocity)))*vec3(Port_Import_N049))*vec3(Port_Import_N051))*vec3(Port_Import_N050))*vec3(Port_Input4_N224));
float l9_56;
if (l9_37)
{
l9_56=Port_Input1_N241;
}
else
{
float l9_57;
if (l9_41)
{
l9_57=Port_Input1_N200;
}
else
{
l9_57=Port_Input2_N200;
}
l9_56=l9_57;
}
float l9_58;
if (l9_41)
{
l9_58=Port_Input1_N063;
}
else
{
l9_58=Port_Input2_N063;
}
gParticle.Size=mix(l9_56,l9_58,clamp(gParticle.Age/gParticle.Life,0.0,1.0));
vec4 l9_59;
if (l9_37)
{
l9_59=vec4(Port_Input1_N008);
}
else
{
vec4 l9_60;
Node65_Conditional(1.0,Port_Input1_N065,vec4(1.0),l9_60,l9_46);
l9_59=l9_60;
}
gParticle.Color=l9_59;
vec4 l9_61=gParticle.Color;
float l9_62=gParticle.Age;
float l9_63=gParticle.Life;
float l9_64=clamp(l9_62/l9_63,0.0,1.0);
float l9_65;
if (l9_41)
{
l9_65=Port_Input1_N266;
}
else
{
l9_65=Port_Input2_N266;
}
vec4 l9_66=vec4(l9_61.x,l9_61.y,l9_61.z,vec4(0.0).w);
l9_66.w=mix(Port_Import_N079,Port_Import_N091,(clamp((l9_64*(Port_Input0_N143/(l9_65/gParticle.Life)))+0.001,Port_Input1_N182+0.001,Port_Input2_N182+0.001)-0.001)*(clamp(((1.0-l9_64)*(Port_Input0_N193/(Port_Import_N188/gParticle.Life)))+0.001,Port_Input1_N236+0.001,Port_Input2_N236+0.001)-0.001));
gParticle.Color=l9_66;
float l9_67=clamp(l9_5,0.0001,0.5);
float l9_68;
if (abs(gParticle.Force.x)<0.005)
{
l9_68=0.0;
}
else
{
l9_68=gParticle.Force.x;
}
gParticle.Force.x=l9_68;
float l9_69;
if (abs(gParticle.Force.y)<0.005)
{
l9_69=0.0;
}
else
{
l9_69=gParticle.Force.y;
}
gParticle.Force.y=l9_69;
float l9_70;
if (abs(gParticle.Force.z)<0.005)
{
l9_70=0.0;
}
else
{
l9_70=gParticle.Force.z;
}
gParticle.Force.z=l9_70;
gParticle.Mass=max(0.005,gParticle.Mass);
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*l9_67);
float l9_71;
if (abs(gParticle.Velocity.x)<0.005)
{
l9_71=0.0;
}
else
{
l9_71=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_71;
float l9_72;
if (abs(gParticle.Velocity.y)<0.005)
{
l9_72=0.0;
}
else
{
l9_72=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_72;
float l9_73;
if (abs(gParticle.Velocity.z)<0.005)
{
l9_73=0.0;
}
else
{
l9_73=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_73;
gParticle.Position+=(gParticle.Velocity*l9_67);
int l9_74=sc_GetLocalInstanceID();
float l9_75;
if (l9_1.x<0.5)
{
l9_75=0.0;
}
else
{
l9_75=0.00195312;
}
float l9_76;
if (l9_1.y<0.5)
{
l9_76=0.0;
}
else
{
l9_76=0.25;
}
sc_SetClipPosition(vec4((((vec2(ivec2(l9_74%512,l9_74/512))*vec2(0.00195312,0.25))+vec2(l9_75,l9_76))*2.0)-vec2(1.0),1.0,1.0));
Interp_Particle_Index=sc_GetLocalInstanceID();
Interp_Particle_Coord=l9_1;
Interp_Particle_Force=gParticle.Force;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Mass=gParticle.Mass;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Dead=gParticle.Dead;
if (l9_3&&(overrideTimeDelta==0.0))
{
vec4 l9_77;
if (sc_GetLocalInstanceID()==0)
{
l9_77=vec4((l9_1*2.0)-vec2(1.0),1.0,1.0);
}
else
{
l9_77=vec4(0.0);
}
sc_SetClipPosition(l9_77);
varPackedTex=vec4(l9_1.x,l9_1.y,varPackedTex.z,varPackedTex.w);
}
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
#ifdef isIdle
#undef isIdle
#endif
#ifdef isAttracting
#undef isAttracting
#endif
#define SC_ENABLE_INSTANCED_RENDERING
#include <std2.glsl>
#include <std2_vs.glsl>
#include <std2_texture.glsl>
#include <std2_receiver.glsl>
#include <std2_fs.glsl>
struct ssParticle
{
vec3 Position;
vec3 Velocity;
vec4 Color;
float Size;
float Age;
float Life;
float Mass;
mat3 Matrix;
vec4 Quaternion;
float Dead;
float SpawnOffset;
float Seed;
vec2 Seed2000;
float TimeShift;
int Index1D;
float Coord1D;
float Ratio1D;
ivec2 Index2D;
vec2 Coord2D;
vec2 Ratio2D;
vec3 Force;
bool Spawned;
};
#ifndef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 0
#elif renderTarget0HasSwappedViews==1
#undef renderTarget0HasSwappedViews
#define renderTarget0HasSwappedViews 1
#endif
#ifndef renderTarget0Layout
#define renderTarget0Layout 0
#endif
#ifndef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 0
#elif renderTarget1HasSwappedViews==1
#undef renderTarget1HasSwappedViews
#define renderTarget1HasSwappedViews 1
#endif
#ifndef renderTarget1Layout
#define renderTarget1Layout 0
#endif
#ifndef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 0
#elif renderTarget2HasSwappedViews==1
#undef renderTarget2HasSwappedViews
#define renderTarget2HasSwappedViews 1
#endif
#ifndef renderTarget2Layout
#define renderTarget2Layout 0
#endif
#ifndef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 0
#elif renderTarget3HasSwappedViews==1
#undef renderTarget3HasSwappedViews
#define renderTarget3HasSwappedViews 1
#endif
#ifndef renderTarget3Layout
#define renderTarget3Layout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 0
#elif SC_USE_UV_TRANSFORM_renderTarget0==1
#undef SC_USE_UV_TRANSFORM_renderTarget0
#define SC_USE_UV_TRANSFORM_renderTarget0 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget0 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget0
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget0 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 0
#elif SC_USE_UV_MIN_MAX_renderTarget0==1
#undef SC_USE_UV_MIN_MAX_renderTarget0
#define SC_USE_UV_MIN_MAX_renderTarget0 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget0==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget0
#define SC_USE_CLAMP_TO_BORDER_renderTarget0 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 0
#elif SC_USE_UV_TRANSFORM_renderTarget1==1
#undef SC_USE_UV_TRANSFORM_renderTarget1
#define SC_USE_UV_TRANSFORM_renderTarget1 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget1 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget1
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget1 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 0
#elif SC_USE_UV_MIN_MAX_renderTarget1==1
#undef SC_USE_UV_MIN_MAX_renderTarget1
#define SC_USE_UV_MIN_MAX_renderTarget1 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget1==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget1
#define SC_USE_CLAMP_TO_BORDER_renderTarget1 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 0
#elif SC_USE_UV_TRANSFORM_renderTarget2==1
#undef SC_USE_UV_TRANSFORM_renderTarget2
#define SC_USE_UV_TRANSFORM_renderTarget2 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget2 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget2
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget2 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 0
#elif SC_USE_UV_MIN_MAX_renderTarget2==1
#undef SC_USE_UV_MIN_MAX_renderTarget2
#define SC_USE_UV_MIN_MAX_renderTarget2 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget2==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget2
#define SC_USE_CLAMP_TO_BORDER_renderTarget2 1
#endif
#ifndef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 0
#elif SC_USE_UV_TRANSFORM_renderTarget3==1
#undef SC_USE_UV_TRANSFORM_renderTarget3
#define SC_USE_UV_TRANSFORM_renderTarget3 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_U_renderTarget3 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_renderTarget3
#define SC_SOFTWARE_WRAP_MODE_V_renderTarget3 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 0
#elif SC_USE_UV_MIN_MAX_renderTarget3==1
#undef SC_USE_UV_MIN_MAX_renderTarget3
#define SC_USE_UV_MIN_MAX_renderTarget3 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 0
#elif SC_USE_CLAMP_TO_BORDER_renderTarget3==1
#undef SC_USE_CLAMP_TO_BORDER_renderTarget3
#define SC_USE_CLAMP_TO_BORDER_renderTarget3 1
#endif
uniform vec4 intensityTextureDims;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform vec4 renderTarget0Dims;
uniform vec4 renderTarget1Dims;
uniform vec4 renderTarget2Dims;
uniform vec4 renderTarget3Dims;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform mat3 renderTarget0Transform;
uniform vec4 renderTarget0UvMinMax;
uniform vec4 renderTarget0BorderColor;
uniform mat3 renderTarget1Transform;
uniform vec4 renderTarget1UvMinMax;
uniform vec4 renderTarget1BorderColor;
uniform mat3 renderTarget2Transform;
uniform vec4 renderTarget2UvMinMax;
uniform vec4 renderTarget2BorderColor;
uniform mat3 renderTarget3Transform;
uniform vec4 renderTarget3UvMinMax;
uniform vec4 renderTarget3BorderColor;
uniform float overrideTimeDelta;
uniform vec4 intensityTextureSize;
uniform vec4 intensityTextureView;
uniform float reflBlurWidth;
uniform float reflBlurMinRough;
uniform float reflBlurMaxRough;
uniform vec4 renderTarget0Size;
uniform vec4 renderTarget0View;
uniform vec4 renderTarget1Size;
uniform vec4 renderTarget1View;
uniform vec4 renderTarget2Size;
uniform vec4 renderTarget2View;
uniform vec4 renderTarget3Size;
uniform vec4 renderTarget3View;
uniform float _sc_allow16TexturesMarker;
uniform vec3 vfxLocalAabbMin;
uniform vec3 vfxWorldAabbMin;
uniform vec3 vfxLocalAabbMax;
uniform vec3 vfxWorldAabbMax;
uniform float vfxCameraAspect;
uniform float vfxCameraNear;
uniform float vfxCameraFar;
uniform vec3 vfxCameraUp;
uniform vec3 vfxCameraForward;
uniform vec3 vfxCameraRight;
uniform mat4 vfxModelMatrix;
uniform mat4 vfxModelMatrixInverse;
uniform mat4 vfxModelViewMatrix;
uniform mat4 vfxModelViewMatrixInverse;
uniform mat4 vfxProjectionMatrix;
uniform mat4 vfxProjectionMatrixInverse;
uniform mat4 vfxModelViewProjectionMatrix;
uniform mat4 vfxModelViewProjectionMatrixInverse;
uniform mat4 vfxViewMatrix;
uniform mat4 vfxViewMatrixInverse;
uniform mat4 vfxViewProjectionMatrix;
uniform mat4 vfxViewProjectionMatrixInverse;
uniform int vfxFrame;
uniform bool isIdle;
uniform vec3 influencePosition;
uniform bool isAttracting;
uniform vec4 noiseTexSize;
uniform vec2 noiseTexDepth;
uniform vec4 colorA;
uniform vec4 colorB;
uniform vec4 colorC;
uniform vec4 colorD;
uniform vec4 colorE;
uniform float Port_TimeBias_N052;
uniform float Port_ValueA_N052;
uniform float Port_TimeA_N052;
uniform float Port_TimeTransition_N052;
uniform float Port_ValueB_N052;
uniform float Port_TimeB_N052;
uniform float Port_Input1_N053;
uniform vec3 Port_Import_N216;
uniform vec3 Port_Min_N213;
uniform vec3 Port_Max_N213;
uniform float Port_Min_N254;
uniform float Port_Max_N254;
uniform float Port_Input1_N021;
uniform float Port_Input1_N067;
uniform float Port_Input2_N067;
uniform float Port_Import_N214;
uniform vec3 Port_Import_N212;
uniform vec3 Port_Import_N075;
uniform vec3 Port_Import_N076;
uniform float Port_Import_N062;
uniform float Port_Import_N058;
uniform vec3 Port_Import_N059;
uniform vec3 Port_Input2_N060;
uniform float Port_Import_N099;
uniform float Port_Import_N109;
uniform vec3 Port_Import_N081;
uniform float Port_RangeMinA_N178;
uniform float Port_RangeMaxA_N178;
uniform float Port_RangeMinB_N178;
uniform float Port_RangeMaxB_N178;
uniform float Port_Import_N087;
uniform float Port_Value4_N102;
uniform float Port_Value4_N117;
uniform float Port_Value4_N126;
uniform vec4 Port_Column3_N127;
uniform float Port_RangeMinA_N133;
uniform float Port_RangeMaxA_N133;
uniform float Port_Input1_N114;
uniform float Port_Input2_N114;
uniform float Port_RangeMaxB_N133;
uniform float Port_Input1_N018;
uniform float Port_Input1_N066;
uniform float Port_Input2_N066;
uniform float Port_Import_N308;
uniform vec3 Port_Import_N309;
uniform float Port_Input1_N237;
uniform float Port_Input1_N201;
uniform float Port_Input2_N201;
uniform vec3 Port_Import_N202;
uniform vec3 Port_Import_N205;
uniform vec3 Port_Import_N206;
uniform float Port_Multiplier_N207;
uniform vec3 Port_Import_N210;
uniform float Port_Input1_N222;
uniform float Port_Input1_N229;
uniform float Port_Import_N049;
uniform float Port_Import_N051;
uniform float Port_Import_N050;
uniform float Port_Input4_N224;
uniform float Port_Input1_N241;
uniform float Port_Input1_N200;
uniform float Port_Input2_N200;
uniform float Port_Import_N150;
uniform float Port_Input1_N063;
uniform float Port_Input2_N063;
uniform float Port_Import_N155;
uniform float Port_Input1_N008;
uniform vec4 Port_Input1_N065;
uniform float Port_Min_N019;
uniform float Port_Max_N019;
uniform float Port_Input1_N166;
uniform float Port_Input1_N164;
uniform float Port_Input1_N165;
uniform float Port_Input2_N165;
uniform float Port_Position1_N172;
uniform float Port_Position2_N172;
uniform float Port_Position3_N172;
uniform float Port_Import_N079;
uniform float Port_Import_N091;
uniform float Port_Import_N191;
uniform float Port_Input0_N143;
uniform float Port_Input1_N266;
uniform float Port_Input2_N266;
uniform float Port_Import_N185;
uniform float Port_Import_N138;
uniform float Port_Input1_N182;
uniform float Port_Input2_N182;
uniform float Port_Input0_N193;
uniform float Port_Import_N188;
uniform float Port_Import_N192;
uniform float Port_Input1_N236;
uniform float Port_Input2_N236;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
varying vec4 Interp_Particle_Color;
varying float Interp_Particle_Size;
varying float Interp_Particle_Mass;
varying vec3 Interp_Particle_Velocity;
varying vec3 Interp_Particle_Position;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Dead;
varying vec2 Interp_Particle_Coord;
varying vec4 varColor;
flat varying int Interp_Particle_Index;
varying vec3 Interp_Particle_Force;
ssParticle gParticle;
void ssEncodeParticle(vec2 Coord,out vec4 rt0,out vec4 rt1,out vec4 rt2,out vec4 rt3)
{
float l9_0=Coord.x;
int l9_1=int(floor(l9_0*4.0));
float l9_2;
float l9_3;
float l9_4;
float l9_5;
float l9_6;
float l9_7;
float l9_8;
float l9_9;
float l9_10;
float l9_11;
float l9_12;
float l9_13;
float l9_14;
float l9_15;
float l9_16;
float l9_17;
if (l9_1==0)
{
vec4 l9_18=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Color.x,0.0,1.0)*0.99999));
vec4 l9_19=l9_18-(l9_18.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_20=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Color.y,0.0,1.0)*0.99999));
vec4 l9_21=l9_20-(l9_20.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_22=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Color.z,0.0,1.0)*0.99999));
vec4 l9_23=l9_22-(l9_22.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_24=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Color.w,0.0,1.0)*0.99999));
vec4 l9_25=l9_24-(l9_24.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
l9_17=l9_25.w;
l9_16=l9_25.z;
l9_15=l9_25.y;
l9_14=l9_25.x;
l9_13=l9_23.w;
l9_12=l9_23.z;
l9_11=l9_23.y;
l9_10=l9_23.x;
l9_9=l9_21.w;
l9_8=l9_21.z;
l9_7=l9_21.y;
l9_6=l9_21.x;
l9_5=l9_19.w;
l9_4=l9_19.z;
l9_3=l9_19.y;
l9_2=l9_19.x;
}
else
{
float l9_26;
float l9_27;
float l9_28;
float l9_29;
float l9_30;
float l9_31;
float l9_32;
float l9_33;
float l9_34;
float l9_35;
float l9_36;
float l9_37;
float l9_38;
float l9_39;
float l9_40;
float l9_41;
if (l9_1==1)
{
vec4 l9_42=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Size,0.0,100.0)*0.0099999));
vec4 l9_43=l9_42-(l9_42.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_44=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Mass,0.0,1000.0)*0.00099999));
vec4 l9_45=l9_44-(l9_44.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_46=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*((clamp(gParticle.Velocity.x,-1000.0,1000.0)-(-1000.0))*0.000499995));
vec4 l9_47=l9_46-(l9_46.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_48=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*((clamp(gParticle.Velocity.y,-1000.0,1000.0)-(-1000.0))*0.000499995));
vec4 l9_49=l9_48-(l9_48.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
l9_41=l9_49.w;
l9_40=l9_49.z;
l9_39=l9_49.y;
l9_38=l9_49.x;
l9_37=l9_47.w;
l9_36=l9_47.z;
l9_35=l9_47.y;
l9_34=l9_47.x;
l9_33=l9_45.w;
l9_32=l9_45.z;
l9_31=l9_45.y;
l9_30=l9_45.x;
l9_29=l9_43.w;
l9_28=l9_43.z;
l9_27=l9_43.y;
l9_26=l9_43.x;
}
else
{
float l9_50;
float l9_51;
float l9_52;
float l9_53;
float l9_54;
float l9_55;
float l9_56;
float l9_57;
float l9_58;
float l9_59;
float l9_60;
float l9_61;
float l9_62;
float l9_63;
float l9_64;
float l9_65;
if (l9_1==2)
{
vec4 l9_66=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*((clamp(gParticle.Velocity.z,-1000.0,1000.0)-(-1000.0))*0.000499995));
vec4 l9_67=l9_66-(l9_66.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_68=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*((clamp(gParticle.Position.x,-1000.0,1000.0)-(-1000.0))*0.000499995));
vec4 l9_69=l9_68-(l9_68.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_70=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*((clamp(gParticle.Position.y,-1000.0,1000.0)-(-1000.0))*0.000499995));
vec4 l9_71=l9_70-(l9_70.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_72=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*((clamp(gParticle.Position.z,-1000.0,1000.0)-(-1000.0))*0.000499995));
vec4 l9_73=l9_72-(l9_72.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
l9_65=l9_73.w;
l9_64=l9_73.z;
l9_63=l9_73.y;
l9_62=l9_73.x;
l9_61=l9_71.w;
l9_60=l9_71.z;
l9_59=l9_71.y;
l9_58=l9_71.x;
l9_57=l9_69.w;
l9_56=l9_69.z;
l9_55=l9_69.y;
l9_54=l9_69.x;
l9_53=l9_67.w;
l9_52=l9_67.z;
l9_51=l9_67.y;
l9_50=l9_67.x;
}
else
{
float l9_74;
float l9_75;
float l9_76;
float l9_77;
float l9_78;
float l9_79;
float l9_80;
float l9_81;
float l9_82;
if (l9_1==3)
{
vec4 l9_83=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Life,0.0,8.0)*0.124999));
vec4 l9_84=l9_83-(l9_83.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
vec4 l9_85=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(clamp(gParticle.Age,0.0,8.0)*0.124999));
vec4 l9_86=l9_85-(l9_85.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
l9_82=clamp(gParticle.Dead,0.0,255.0)*0.00392157;
l9_81=l9_86.w;
l9_80=l9_86.z;
l9_79=l9_86.y;
l9_78=l9_86.x;
l9_77=l9_84.w;
l9_76=l9_84.z;
l9_75=l9_84.y;
l9_74=l9_84.x;
}
else
{
l9_82=0.0;
l9_81=0.0;
l9_80=0.0;
l9_79=0.0;
l9_78=0.0;
l9_77=0.0;
l9_76=0.0;
l9_75=0.0;
l9_74=0.0;
}
l9_65=0.0;
l9_64=0.0;
l9_63=0.0;
l9_62=0.0;
l9_61=0.0;
l9_60=0.0;
l9_59=0.0;
l9_58=l9_82;
l9_57=l9_81;
l9_56=l9_80;
l9_55=l9_79;
l9_54=l9_78;
l9_53=l9_77;
l9_52=l9_76;
l9_51=l9_75;
l9_50=l9_74;
}
l9_41=l9_65;
l9_40=l9_64;
l9_39=l9_63;
l9_38=l9_62;
l9_37=l9_61;
l9_36=l9_60;
l9_35=l9_59;
l9_34=l9_58;
l9_33=l9_57;
l9_32=l9_56;
l9_31=l9_55;
l9_30=l9_54;
l9_29=l9_53;
l9_28=l9_52;
l9_27=l9_51;
l9_26=l9_50;
}
l9_17=l9_41;
l9_16=l9_40;
l9_15=l9_39;
l9_14=l9_38;
l9_13=l9_37;
l9_12=l9_36;
l9_11=l9_35;
l9_10=l9_34;
l9_9=l9_33;
l9_8=l9_32;
l9_7=l9_31;
l9_6=l9_30;
l9_5=l9_29;
l9_4=l9_28;
l9_3=l9_27;
l9_2=l9_26;
}
rt0=vec4(l9_2,l9_3,l9_4,l9_5);
rt1=vec4(l9_6,l9_7,l9_8,l9_9);
rt2=vec4(l9_10,l9_11,l9_12,l9_13);
rt3=vec4(l9_14,l9_15,l9_16,l9_17);
}
void main()
{
sc_DiscardStereoFragment();
int l9_0;
#if (renderTarget0HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
vec4 l9_1=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_0,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_2;
#if (renderTarget1HasSwappedViews)
{
l9_2=1-sc_GetStereoViewIndex();
}
#else
{
l9_2=sc_GetStereoViewIndex();
}
#endif
vec4 l9_3=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_2,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_4;
#if (renderTarget2HasSwappedViews)
{
l9_4=1-sc_GetStereoViewIndex();
}
#else
{
l9_4=sc_GetStereoViewIndex();
}
#endif
vec4 l9_5=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_4,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_6;
#if (renderTarget3HasSwappedViews)
{
l9_6=1-sc_GetStereoViewIndex();
}
#else
{
l9_6=sc_GetStereoViewIndex();
}
#endif
if (dot(((l9_1+l9_3)+l9_5)+sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,l9_6,vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),vec4(0.254232))==0.342318)
{
discard;
}
vec4 l9_7;
vec4 l9_8;
vec4 l9_9;
vec4 l9_10;
if ((overrideTimeEnabled==1)&&(overrideTimeDelta==0.0))
{
int l9_11;
#if (renderTarget0HasSwappedViews)
{
l9_11=1-sc_GetStereoViewIndex();
}
#else
{
l9_11=sc_GetStereoViewIndex();
}
#endif
vec4 l9_12=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,l9_11,varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
int l9_13;
#if (renderTarget1HasSwappedViews)
{
l9_13=1-sc_GetStereoViewIndex();
}
#else
{
l9_13=sc_GetStereoViewIndex();
}
#endif
vec4 l9_14=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,l9_13,varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
int l9_15;
#if (renderTarget2HasSwappedViews)
{
l9_15=1-sc_GetStereoViewIndex();
}
#else
{
l9_15=sc_GetStereoViewIndex();
}
#endif
vec4 l9_16=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,l9_15,varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
int l9_17;
#if (renderTarget3HasSwappedViews)
{
l9_17=1-sc_GetStereoViewIndex();
}
#else
{
l9_17=sc_GetStereoViewIndex();
}
#endif
l9_10=sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,l9_17,varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3);
l9_9=l9_16;
l9_8=l9_14;
l9_7=l9_12;
}
else
{
gParticle.Color=Interp_Particle_Color;
gParticle.Size=Interp_Particle_Size;
gParticle.Mass=Interp_Particle_Mass;
gParticle.Velocity=Interp_Particle_Velocity;
gParticle.Position=Interp_Particle_Position;
gParticle.Life=Interp_Particle_Life;
gParticle.Age=Interp_Particle_Age;
gParticle.Dead=Interp_Particle_Dead;
vec4 param_97;
vec4 param_98;
vec4 param_99;
vec4 param_100;
ssEncodeParticle(Interp_Particle_Coord,param_97,param_98,param_99,param_100);
vec4 l9_18=param_97;
vec4 l9_19=param_98;
vec4 l9_20=param_99;
vec4 l9_21=param_100;
vec4 l9_22;
if (dot(((l9_18+l9_19)+l9_20)+l9_21,vec4(0.23454))==0.342318)
{
l9_22=l9_18+vec4(1e-06);
}
else
{
l9_22=l9_18;
}
l9_10=l9_21;
l9_9=l9_20;
l9_8=l9_19;
l9_7=l9_22;
}
sc_writeFragData0(l9_7);
sc_writeFragData1(l9_8);
sc_writeFragData2(l9_9);
sc_writeFragData3(l9_10);
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
