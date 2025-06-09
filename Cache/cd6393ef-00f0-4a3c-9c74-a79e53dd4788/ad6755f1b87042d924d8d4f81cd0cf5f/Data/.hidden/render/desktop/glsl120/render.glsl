//SG_REFLECTION_BEGIN(100)
//sampler sampler flipbookTexSmpSC 2:15
//sampler sampler intensityTextureSmpSC 2:16
//sampler sampler renderTarget0SmpSC 2:17
//sampler sampler renderTarget1SmpSC 2:18
//sampler sampler renderTarget2SmpSC 2:19
//sampler sampler renderTarget3SmpSC 2:20
//sampler sampler repelflipbookTexSmpSC 2:21
//sampler sampler sc_OITCommonSampler 2:22
//texture texture2D flipbookTex 2:0:2:15
//texture texture2D intensityTexture 2:1:2:16
//texture texture2D renderTarget0 2:2:2:17
//texture texture2D renderTarget1 2:3:2:18
//texture texture2D renderTarget2 2:4:2:19
//texture texture2D renderTarget3 2:5:2:20
//texture texture2D repelflipbookTex 2:6:2:21
//texture texture2D sc_OITAlpha0 2:7:2:22
//texture texture2D sc_OITAlpha1 2:8:2:22
//texture texture2D sc_OITDepthHigh0 2:9:2:22
//texture texture2D sc_OITDepthHigh1 2:10:2:22
//texture texture2D sc_OITDepthLow0 2:11:2:22
//texture texture2D sc_OITDepthLow1 2:12:2:22
//texture texture2D sc_OITFilteredDepthBoundsTexture 2:13:2:22
//texture texture2D sc_OITFrontDepthTexture 2:14:2:22
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
uniform vec4 flipbookTexDims;
uniform vec4 repelflipbookTexDims;
uniform float Port_Value_N170;
uniform float velocityStretch;
uniform float _sc_allow16TexturesMarker;
uniform float overrideTimeDelta;
uniform float Port_Input1_N362;
uniform vec3 Port_Input1_N420;
uniform float Port_RangeMinA_N171;
uniform float Port_RangeMaxA_N171;
uniform float Port_RangeMaxB_N171;
uniform float Port_RangeMinB_N171;
uniform float Port_Input1_N358;
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
uniform bool isIdle;
uniform vec4 flipbookTexSize;
uniform vec4 flipbookTexView;
uniform mat3 flipbookTexTransform;
uniform vec4 flipbookTexUvMinMax;
uniform vec4 flipbookTexBorderColor;
uniform bool isAttracting;
uniform vec4 colorMix;
uniform float intensity;
uniform vec4 repelflipbookTexSize;
uniform vec4 repelflipbookTexView;
uniform mat3 repelflipbookTexTransform;
uniform vec4 repelflipbookTexUvMinMax;
uniform vec4 repelflipbookTexBorderColor;
uniform float Port_Import_N356;
uniform float Port_AlphaTestThreshold_N039;
uniform vec2 Port_SpriteCount_N045;
uniform float Port_MaxFrames_N045;
uniform float Port_Rotation_N159;
uniform vec2 Port_Center_N159;
uniform float Port_RangeMinA_N156;
uniform float Port_RangeMaxA_N156;
uniform float Port_RangeMinB_N156;
uniform float Port_RangeMaxB_N156;
uniform float Port_SecondOffset_N045;
uniform vec3 Port_Input0_N038;
uniform vec2 Port_Input1_N031;
uniform float Port_Input1_N246;
uniform float Port_Input2_N246;
uniform vec2 Port_Input1_N035;
uniform float Port_Input1_N036;
uniform vec3 Port_Emissive_N026;
uniform float Port_Metallic_N026;
uniform float Port_Roughness_N026;
uniform vec3 Port_AO_N026;
uniform vec3 Port_SpecularAO_N026;
uniform vec2 Port_SpriteCount_N167;
uniform float Port_MaxFrames_N167;
uniform float Port_SecondOffset_N167;
uniform vec3 Port_Emissive_N258;
uniform float Port_Metallic_N258;
uniform float Port_Roughness_N258;
uniform vec3 Port_AO_N258;
uniform vec3 Port_SpecularAO_N258;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
flat varying int Interp_Particle_Index;
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
varying vec2 Interp_Particle_Coord;
varying float gParticlesDebug;
varying vec2 ParticleUV;
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
void main()
{
sc_Vertex_t l9_0=sc_LoadVertexAttributes();
vec4 l9_1=l9_0.position;
vec2 l9_2=l9_0.texture0;
vec4 l9_3;
#if (sc_IsEditor)
{
vec4 l9_4=l9_1;
l9_4.x=l9_1.x+_sc_allow16TexturesMarker;
l9_3=l9_4;
}
#else
{
l9_3=l9_1;
}
#endif
int l9_5=sc_GetLocalInstanceID();
if (l9_5>=1600)
{
sc_SetClipPosition(vec4(0.0));
return;
}
ssDecodeParticle(l9_5);
float l9_6=gParticle.Dead;
bool l9_7=l9_6>16.0;
bool l9_8;
if (!l9_7)
{
l9_8=gParticle.Size<1e-05;
}
else
{
l9_8=l9_7;
}
bool l9_9;
if (!l9_8)
{
l9_9=gParticle.Age>=gParticle.Life;
}
else
{
l9_9=l9_8;
}
if (l9_9)
{
sc_SetClipPosition(vec4(0.0));
return;
}
varPos=gParticle.Position+(gParticle.Matrix*vec3(l9_3.x*gParticle.Size,l9_3.y*gParticle.Size,0.0));
varNormal=gParticle.Matrix*vec3(0.0,0.0,1.0);
vec3 l9_10=gParticle.Matrix*vec3(1.0,0.0,0.0);
varTangent=vec4(l9_10.x,l9_10.y,l9_10.z,varTangent.w);
varTangent.w=1.0;
varPackedTex=vec4(l9_2,l9_0.texture1);
vec3 l9_11=gParticle.Position;
float l9_12=gParticle.Size;
vec2 l9_13=l9_2-vec2(Port_Input1_N362);
vec3 l9_14;
if (float(length(gParticle.Velocity)<Port_Value_N170)!=0.0)
{
l9_14=Port_Input1_N420;
}
else
{
vec3 l9_15=gParticle.Velocity;
float l9_16=dot(l9_15,l9_15);
float l9_17;
if (l9_16>0.0)
{
l9_17=1.0/sqrt(l9_16);
}
else
{
l9_17=0.0;
}
l9_14=l9_15*l9_17;
}
vec3 l9_18=varNormal;
vec3 l9_19=cross(l9_14,-l9_18);
float l9_20=dot(l9_19,l9_19);
float l9_21;
if (l9_20>0.0)
{
l9_21=1.0/sqrt(l9_20);
}
else
{
l9_21=0.0;
}
vec3 l9_22=l9_19*l9_21;
vec3 l9_23=vec3(l9_12);
varPos=(l9_11+((l9_23*vec3(l9_13.x))*l9_22))+(((l9_23*vec3(l9_13.y))*vec3(max(((((velocityStretch-Port_RangeMinA_N171)/(Port_RangeMaxA_N171-Port_RangeMinA_N171))*(Port_RangeMaxB_N171-Port_RangeMinB_N171))+Port_RangeMinB_N171)*length(gParticle.Velocity),Port_Input1_N358)))*l9_14);
varTangent=vec4(l9_14.x,l9_14.y,l9_14.z,varTangent.w);
vec3 l9_24=cross(l9_14,l9_22);
float l9_25=dot(l9_24,l9_24);
float l9_26;
if (l9_25>0.0)
{
l9_26=1.0/sqrt(l9_25);
}
else
{
l9_26=0.0;
}
varNormal=l9_24*l9_26;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_27=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
varViewSpaceDepth=-l9_27.z;
sc_SetClipPosition(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_27);
}
#else
{
sc_SetClipPosition(sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0));
}
#endif
Interp_Particle_Index=sc_GetLocalInstanceID();
Interp_Particle_Force=gParticle.Force;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Mass=gParticle.Mass;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Dead=gParticle.Dead;
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
struct SurfaceProperties
{
vec3 albedo;
float opacity;
vec3 normal;
vec3 positionWS;
vec3 viewDirWS;
float metallic;
float roughness;
vec3 emissive;
vec3 ao;
vec3 specularAo;
vec3 bakedShadows;
vec3 specColor;
};
struct LightingComponents
{
vec3 directDiffuse;
vec3 directSpecular;
vec3 indirectDiffuse;
vec3 indirectSpecular;
vec3 emitted;
vec3 transmitted;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexTangent_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
};
#ifndef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 0
#elif intensityTextureHasSwappedViews==1
#undef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 1
#endif
#ifndef intensityTextureLayout
#define intensityTextureLayout 0
#endif
#ifndef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 0
#elif BLEND_MODE_REALISTIC==1
#undef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 1
#endif
#ifndef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 0
#elif BLEND_MODE_FORGRAY==1
#undef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 1
#endif
#ifndef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 0
#elif BLEND_MODE_NOTBRIGHT==1
#undef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 1
#endif
#ifndef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 0
#elif BLEND_MODE_DIVISION==1
#undef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 1
#endif
#ifndef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 0
#elif BLEND_MODE_BRIGHT==1
#undef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 1
#endif
#ifndef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 0
#elif BLEND_MODE_INTENSE==1
#undef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 0
#elif SC_USE_UV_TRANSFORM_intensityTexture==1
#undef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_U_intensityTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_V_intensityTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 0
#elif SC_USE_UV_MIN_MAX_intensityTexture==1
#undef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 0
#elif SC_USE_CLAMP_TO_BORDER_intensityTexture==1
#undef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 1
#endif
#ifndef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 0
#elif BLEND_MODE_LIGHTEN==1
#undef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 1
#endif
#ifndef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 0
#elif BLEND_MODE_DARKEN==1
#undef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 1
#endif
#ifndef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 0
#elif BLEND_MODE_DIVIDE==1
#undef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 1
#endif
#ifndef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 0
#elif BLEND_MODE_AVERAGE==1
#undef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 1
#endif
#ifndef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 0
#elif BLEND_MODE_SUBTRACT==1
#undef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 1
#endif
#ifndef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 0
#elif BLEND_MODE_DIFFERENCE==1
#undef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 1
#endif
#ifndef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 0
#elif BLEND_MODE_NEGATION==1
#undef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 1
#endif
#ifndef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 0
#elif BLEND_MODE_EXCLUSION==1
#undef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 1
#endif
#ifndef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 0
#elif BLEND_MODE_OVERLAY==1
#undef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 1
#endif
#ifndef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 0
#elif BLEND_MODE_SOFT_LIGHT==1
#undef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 0
#elif BLEND_MODE_HARD_LIGHT==1
#undef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 1
#endif
#ifndef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 0
#elif BLEND_MODE_COLOR_DODGE==1
#undef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 1
#endif
#ifndef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 0
#elif BLEND_MODE_COLOR_BURN==1
#undef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 1
#endif
#ifndef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 0
#elif BLEND_MODE_LINEAR_LIGHT==1
#undef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 1
#endif
#ifndef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 0
#elif BLEND_MODE_VIVID_LIGHT==1
#undef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 1
#endif
#ifndef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 0
#elif BLEND_MODE_PIN_LIGHT==1
#undef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 0
#elif BLEND_MODE_HARD_MIX==1
#undef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 1
#endif
#ifndef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 0
#elif BLEND_MODE_HARD_REFLECT==1
#undef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 1
#endif
#ifndef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 0
#elif BLEND_MODE_HARD_GLOW==1
#undef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 1
#endif
#ifndef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 0
#elif BLEND_MODE_HARD_PHOENIX==1
#undef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 1
#endif
#ifndef BLEND_MODE_HUE
#define BLEND_MODE_HUE 0
#elif BLEND_MODE_HUE==1
#undef BLEND_MODE_HUE
#define BLEND_MODE_HUE 1
#endif
#ifndef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 0
#elif BLEND_MODE_SATURATION==1
#undef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 1
#endif
#ifndef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 0
#elif BLEND_MODE_COLOR==1
#undef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 1
#endif
#ifndef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 0
#elif BLEND_MODE_LUMINOSITY==1
#undef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 1
#endif
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
#ifndef flipbookTexHasSwappedViews
#define flipbookTexHasSwappedViews 0
#elif flipbookTexHasSwappedViews==1
#undef flipbookTexHasSwappedViews
#define flipbookTexHasSwappedViews 1
#endif
#ifndef flipbookTexLayout
#define flipbookTexLayout 0
#endif
#ifndef repelflipbookTexHasSwappedViews
#define repelflipbookTexHasSwappedViews 0
#elif repelflipbookTexHasSwappedViews==1
#undef repelflipbookTexHasSwappedViews
#define repelflipbookTexHasSwappedViews 1
#endif
#ifndef repelflipbookTexLayout
#define repelflipbookTexLayout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_flipbookTex
#define SC_USE_UV_TRANSFORM_flipbookTex 0
#elif SC_USE_UV_TRANSFORM_flipbookTex==1
#undef SC_USE_UV_TRANSFORM_flipbookTex
#define SC_USE_UV_TRANSFORM_flipbookTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_flipbookTex
#define SC_SOFTWARE_WRAP_MODE_U_flipbookTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_flipbookTex
#define SC_SOFTWARE_WRAP_MODE_V_flipbookTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_flipbookTex
#define SC_USE_UV_MIN_MAX_flipbookTex 0
#elif SC_USE_UV_MIN_MAX_flipbookTex==1
#undef SC_USE_UV_MIN_MAX_flipbookTex
#define SC_USE_UV_MIN_MAX_flipbookTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_flipbookTex
#define SC_USE_CLAMP_TO_BORDER_flipbookTex 0
#elif SC_USE_CLAMP_TO_BORDER_flipbookTex==1
#undef SC_USE_CLAMP_TO_BORDER_flipbookTex
#define SC_USE_CLAMP_TO_BORDER_flipbookTex 1
#endif
#ifndef Tweak_N248
#define Tweak_N248 0
#elif Tweak_N248==1
#undef Tweak_N248
#define Tweak_N248 1
#endif
#ifndef Tweak_N261
#define Tweak_N261 0
#elif Tweak_N261==1
#undef Tweak_N261
#define Tweak_N261 1
#endif
#ifndef NODE_243_DROPLIST_ITEM
#define NODE_243_DROPLIST_ITEM 0
#endif
#ifndef SC_USE_UV_TRANSFORM_repelflipbookTex
#define SC_USE_UV_TRANSFORM_repelflipbookTex 0
#elif SC_USE_UV_TRANSFORM_repelflipbookTex==1
#undef SC_USE_UV_TRANSFORM_repelflipbookTex
#define SC_USE_UV_TRANSFORM_repelflipbookTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex
#define SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex
#define SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_repelflipbookTex
#define SC_USE_UV_MIN_MAX_repelflipbookTex 0
#elif SC_USE_UV_MIN_MAX_repelflipbookTex==1
#undef SC_USE_UV_MIN_MAX_repelflipbookTex
#define SC_USE_UV_MIN_MAX_repelflipbookTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_repelflipbookTex
#define SC_USE_CLAMP_TO_BORDER_repelflipbookTex 0
#elif SC_USE_CLAMP_TO_BORDER_repelflipbookTex==1
#undef SC_USE_CLAMP_TO_BORDER_repelflipbookTex
#define SC_USE_CLAMP_TO_BORDER_repelflipbookTex 1
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
uniform vec4 flipbookTexDims;
uniform vec4 repelflipbookTexDims;
uniform bool isIdle;
uniform mat3 flipbookTexTransform;
uniform vec4 flipbookTexUvMinMax;
uniform vec4 flipbookTexBorderColor;
uniform bool isAttracting;
uniform vec4 colorMix;
uniform float Port_Rotation_N159;
uniform vec2 Port_Center_N159;
uniform float Port_RangeMinA_N156;
uniform float Port_RangeMaxA_N156;
uniform float Port_RangeMaxB_N156;
uniform float Port_RangeMinB_N156;
uniform vec2 Port_SpriteCount_N045;
uniform float Port_MaxFrames_N045;
uniform float Port_SecondOffset_N045;
uniform float intensity;
uniform mat3 repelflipbookTexTransform;
uniform vec4 repelflipbookTexUvMinMax;
uniform vec4 repelflipbookTexBorderColor;
uniform vec2 Port_SpriteCount_N167;
uniform float Port_MaxFrames_N167;
uniform float Port_SecondOffset_N167;
uniform vec2 Port_Input1_N031;
uniform float Port_Input1_N246;
uniform float Port_Input2_N246;
uniform vec2 Port_Input1_N035;
uniform float Port_Input1_N036;
uniform vec3 Port_Input0_N038;
uniform vec3 Port_Emissive_N026;
uniform float Port_Metallic_N026;
uniform float Port_Roughness_N026;
uniform vec3 Port_AO_N026;
uniform vec3 Port_SpecularAO_N026;
uniform vec3 Port_Emissive_N258;
uniform float Port_Metallic_N258;
uniform float Port_Roughness_N258;
uniform vec3 Port_AO_N258;
uniform vec3 Port_SpecularAO_N258;
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
uniform float velocityStretch;
uniform vec4 flipbookTexSize;
uniform vec4 flipbookTexView;
uniform vec4 repelflipbookTexSize;
uniform vec4 repelflipbookTexView;
uniform float Port_Input1_N362;
uniform float Port_Value_N170;
uniform vec3 Port_Input1_N420;
uniform float Port_RangeMinA_N171;
uniform float Port_RangeMaxA_N171;
uniform float Port_RangeMinB_N171;
uniform float Port_RangeMaxB_N171;
uniform float Port_Import_N356;
uniform float Port_Input1_N358;
uniform float Port_AlphaTestThreshold_N039;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
uniform sampler2D flipbookTex;
uniform sampler2D repelflipbookTex;
uniform sampler2D intensityTexture;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
varying vec4 Interp_Particle_Color;
varying float Interp_Particle_Size;
varying float Interp_Particle_Mass;
varying vec3 Interp_Particle_Velocity;
varying vec3 Interp_Particle_Position;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Dead;
flat varying int Interp_Particle_Index;
varying vec4 varColor;
varying vec3 Interp_Particle_Force;
varying vec2 Interp_Particle_Coord;
varying float gParticlesDebug;
varying vec2 ParticleUV;
ssParticle gParticle;
void Node45_Flipbook_Sample(vec2 SpriteCount,float MaxFrames,vec2 UVCoord,float FrameOffset,float Speed,float SecondOffset,out vec4 Color,ssGlobals Globals)
{
float l9_0=SpriteCount.x;
int l9_1=int(l9_0);
float l9_2=SpriteCount.y;
int l9_3=int(l9_2);
int l9_4=l9_1*l9_3;
float l9_5=MaxFrames;
int l9_6=int(l9_5);
int l9_7=(l9_4<l9_6) ? l9_4 : l9_6;
float l9_8=1.0/float(l9_3);
float l9_9=Globals.gTimeElapsedShifted;
float l9_10=SecondOffset;
float l9_11=Speed;
float l9_12=FrameOffset;
int l9_13=int(((l9_9+l9_10)*l9_11)+floor(l9_12));
int l9_14=l9_13-(l9_7*(l9_13/l9_7));
int l9_15=l9_14/l9_1;
float l9_16=UVCoord.x;
float l9_17=UVCoord.y;
int l9_18;
#if (flipbookTexHasSwappedViews)
{
l9_18=1-sc_GetStereoViewIndex();
}
#else
{
l9_18=sc_GetStereoViewIndex();
}
#endif
Color=sc_SampleTextureBiasOrLevel(flipbookTexDims.xy,flipbookTexLayout,l9_18,mod(vec2((1.0/float(l9_1))*(l9_16+float(l9_14-(l9_1*l9_15))),((1.0-l9_8)-(float(l9_15)*l9_8))+(l9_8*l9_17)),vec2(1.0)),(int(SC_USE_UV_TRANSFORM_flipbookTex)!=0),flipbookTexTransform,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex),(int(SC_USE_UV_MIN_MAX_flipbookTex)!=0),flipbookTexUvMinMax,(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0),flipbookTexBorderColor,0.0,flipbookTex);
}
vec3 calculateDirectSpecular(SurfaceProperties surfaceProperties,vec3 L,vec3 V)
{
float l9_0=surfaceProperties.roughness;
float l9_1=max(l9_0,0.03);
vec3 l9_2=surfaceProperties.specColor;
vec3 l9_3=surfaceProperties.normal;
vec3 l9_4=L;
vec3 l9_5=V;
vec3 l9_6=normalize(l9_4+l9_5);
vec3 l9_7=L;
float l9_8=clamp(dot(l9_3,l9_7),0.0,1.0);
vec3 l9_9=V;
float l9_10=clamp(dot(l9_3,l9_6),0.0,1.0);
vec3 l9_11=V;
float l9_12=clamp(dot(l9_11,l9_6),0.0,1.0);
vec3 l9_13;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
float l9_14=l9_1*l9_1;
float l9_15=l9_14*l9_14;
float l9_16=((l9_10*l9_10)*(l9_15-1.0))+1.0;
float l9_17=l9_1+1.0;
float l9_18=(l9_17*l9_17)*0.125;
float l9_19=1.0-l9_18;
float l9_20=1.0-l9_12;
float l9_21=l9_20*l9_20;
l9_13=(l9_2+((vec3(1.0)-l9_2)*((l9_21*l9_21)*l9_20)))*((((l9_15/((l9_16*l9_16)+1e-07))*(1.0/(((l9_8*l9_19)+l9_18)*((clamp(dot(l9_3,l9_9),0.0,1.0)*l9_19)+l9_18))))*0.25)*l9_8);
}
#else
{
float l9_22=exp2(11.0-(10.0*l9_1));
float l9_23=1.0-l9_12;
float l9_24=l9_23*l9_23;
l9_13=(((l9_2+((vec3(1.0)-l9_2)*((l9_24*l9_24)*l9_23)))*((l9_22*0.125)+0.25))*pow(l9_10,l9_22))*l9_8;
}
#endif
return l9_13;
}
vec3 DiffuseTermSG(sc_SphericalGaussianLight_t lightingLobe,vec3 normal)
{
vec3 l9_0=lightingLobe.axis;
vec3 l9_1=normal;
float l9_2=dot(l9_0,l9_1);
float l9_3=lightingLobe.sharpness;
float l9_4=exp(-l9_3);
float l9_5=l9_4*l9_4;
float l9_6=1.0/l9_3;
float l9_7=(1.0+(2.0*l9_5))-l9_6;
float l9_8=sqrt(1.0-l9_7);
float l9_9=0.36*l9_2;
float l9_10=0.694444*l9_8;
float l9_11=l9_9+l9_10;
float l9_12;
if (step(abs(l9_9),l9_10)>0.5)
{
l9_12=(l9_11*l9_11)/l9_8;
}
else
{
l9_12=clamp(l9_2,0.0,1.0);
}
return (((lightingLobe.color/vec3(lightingLobe.sharpness))*6.28319)*((l9_7*l9_12)+(((l9_4-l9_5)*l9_6)-l9_5)))*vec3(0.31831);
}
vec3 calculateDiffuseIrradiance(vec3 N)
{
vec3 l9_0;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
float l9_1=-N.z;
vec2 l9_2=vec2(0.0);
l9_2.x=(((N.x<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_1/length(vec2(N.x,l9_1)),-1.0,1.0)))-1.5708;
vec2 l9_3=l9_2;
l9_3.y=acos(N.y);
vec2 l9_4=l9_3*vec2(0.159155,0.31831);
vec2 l9_5=l9_4;
l9_5.y=1.0-l9_4.y;
float l9_6=l9_4.x+(sc_EnvmapRotation.y*0.00277778);
vec2 l9_7=l9_5;
l9_7.x=fract((l9_6+floor(l9_6))+1.0);
vec4 l9_8;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_9;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_10;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_11=max(vec2(1.0),sc_EnvmapSpecularSize.xy*vec2(0.03125));
l9_10=((l9_7*(l9_11-vec2(1.0)))/l9_11)+(vec2(0.5)/l9_11);
}
#else
{
l9_10=l9_7;
}
#endif
l9_9=l9_10;
}
#else
{
l9_9=l9_7;
}
#endif
l9_8=sc_EnvmapSpecularSampleViewBias(l9_9,13.0);
}
#else
{
vec4 l9_12;
#if ((sc_MaxTextureImageUnits>8)&&sc_HasDiffuseEnvmap)
{
vec2 l9_13;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_14=max(vec2(1.0),sc_EnvmapDiffuseSize.xy);
l9_13=((l9_7*(l9_14-vec2(1.0)))/l9_14)+(vec2(0.5)/l9_14);
}
#else
{
l9_13=l9_7;
}
#endif
l9_12=sc_EnvmapDiffuseSampleViewBias(l9_13,-13.0);
}
#else
{
l9_12=sc_EnvmapSpecularSampleViewBias(l9_7,13.0);
}
#endif
l9_8=l9_12;
}
#endif
l9_0=(l9_8.xyz*(1.0/l9_8.w))*sc_EnvmapExposure;
}
#else
{
vec3 l9_15;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
vec3 l9_16=-N;
float l9_17=l9_16.x;
float l9_18=l9_16.y;
float l9_19=l9_16.z;
l9_15=(((((((sc_Sh[8]*0.429043)*((l9_17*l9_17)-(l9_18*l9_18)))+((sc_Sh[6]*0.743125)*(l9_19*l9_19)))+(sc_Sh[0]*0.886227))-(sc_Sh[6]*0.247708))+((((sc_Sh[4]*(l9_17*l9_18))+(sc_Sh[7]*(l9_17*l9_19)))+(sc_Sh[5]*(l9_18*l9_19)))*0.858086))+((((sc_Sh[3]*l9_17)+(sc_Sh[1]*l9_18))+(sc_Sh[2]*l9_19))*1.02333))*sc_ShIntensity;
}
#else
{
l9_15=vec3(0.0);
}
#endif
l9_0=l9_15;
}
#endif
vec3 l9_20;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_21;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_21=l9_0+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_22=l9_0;
l9_22.x=l9_0.x+(1e-06*sc_AmbientLights[0].color.x);
l9_21=l9_22;
}
#endif
l9_20=l9_21;
}
#else
{
l9_20=l9_0;
}
#endif
vec3 l9_23;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_24;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_24=l9_20+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_25=l9_20;
l9_25.x=l9_20.x+(1e-06*sc_AmbientLights[1].color.x);
l9_24=l9_25;
}
#endif
l9_23=l9_24;
}
#else
{
l9_23=l9_20;
}
#endif
vec3 l9_26;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_27;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_27=l9_23+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_28=l9_23;
l9_28.x=l9_23.x+(1e-06*sc_AmbientLights[2].color.x);
l9_27=l9_28;
}
#endif
l9_26=l9_27;
}
#else
{
l9_26=l9_23;
}
#endif
vec3 l9_29;
#if (sc_LightEstimation)
{
vec3 l9_30=N;
vec3 l9_31;
l9_31=sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_32;
vec3 l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_LightEstimationSGCount)
{
l9_31+=DiffuseTermSG(sc_LightEstimationData.sg[l9_34],l9_30);
l9_34++;
continue;
}
else
{
break;
}
}
l9_29=l9_26+l9_31;
}
#else
{
l9_29=l9_26;
}
#endif
vec3 l9_35=l9_29;
l9_35.x=l9_29.x+1e-06;
return l9_35;
}
vec3 SpecularTermSG(sc_SphericalGaussianLight_t light,vec3 normal,float roughness,vec3 view,vec3 specColor)
{
float l9_0=roughness*roughness;
vec3 l9_1=reflect(-view,normal);
float l9_2=(2.0/l9_0)/(4.0*max(dot(normal,view),0.0001));
float l9_3=length((l9_1*l9_2)+(light.axis*light.sharpness));
float l9_4=roughness*roughness;
float l9_5=clamp(dot(normal,l9_1),0.0,1.0);
float l9_6=clamp(dot(normal,view),0.0,1.0);
float l9_7=1.0-l9_4;
return (((((((vec3(0.31831/l9_0)*exp((l9_3-l9_2)-light.sharpness))*light.color)*6.28319)*(1.0-exp((-2.0)*l9_3)))/vec3(l9_3))*((1.0/(l9_5+sqrt(l9_4+((l9_7*l9_5)*l9_5))))*(1.0/(l9_6+sqrt(l9_4+((l9_7*l9_6)*l9_6))))))*(specColor+((vec3(1.0)-specColor)*pow(1.0-clamp(dot(l9_1,normalize(l9_1+view)),0.0,1.0),5.0))))*l9_5;
}
LightingComponents evaluateLighting(SurfaceProperties surfaceProperties)
{
vec3 l9_0=surfaceProperties.viewDirWS;
vec4 bakedShadows=vec4(surfaceProperties.bakedShadows,1.0);
vec3 l9_1;
vec3 l9_2;
int l9_3;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_4;
vec3 l9_5;
int l9_6;
l9_6=0;
l9_5=vec3(0.0);
l9_4=vec3(0.0);
SurfaceProperties l9_7;
vec3 l9_8;
vec3 l9_9;
int l9_10=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_10<sc_DirectionalLightsCount)
{
float l9_11=sc_DirectionalLights[l9_10].color.w*bakedShadows[(l9_6<3) ? l9_6 : 3];
l9_6++;
l9_5+=((calculateDirectSpecular(surfaceProperties,sc_DirectionalLights[l9_10].direction,l9_0)*sc_DirectionalLights[l9_10].color.xyz)*l9_11);
l9_4+=((vec3(clamp(dot(surfaceProperties.normal,sc_DirectionalLights[l9_10].direction),0.0,1.0))*sc_DirectionalLights[l9_10].color.xyz)*l9_11);
l9_10++;
continue;
}
else
{
break;
}
}
l9_3=l9_6;
l9_2=l9_5;
l9_1=l9_4;
}
#else
{
l9_3=0;
l9_2=vec3(0.0);
l9_1=vec3(0.0);
}
#endif
vec3 l9_12;
vec3 l9_13;
#if (sc_PointLightsCount>0)
{
vec3 l9_14;
vec3 l9_15;
l9_15=l9_2;
l9_14=l9_1;
int l9_16;
vec3 l9_17;
vec3 l9_18;
int l9_19=0;
int l9_20=l9_3;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_19<sc_PointLightsCount)
{
vec3 l9_21=surfaceProperties.positionWS;
vec3 l9_22=sc_PointLights[l9_19].position-l9_21;
vec3 l9_23=normalize(l9_22);
float l9_24=bakedShadows[(l9_20<3) ? l9_20 : 3];
float l9_25=clamp((dot(l9_23,sc_PointLights[l9_19].direction)*sc_PointLights[l9_19].angleScale)+sc_PointLights[l9_19].angleOffset,0.0,1.0);
float l9_26=(sc_PointLights[l9_19].color.w*l9_24)*(l9_25*l9_25);
float l9_27;
if (sc_PointLights[l9_19].falloffEnabled)
{
float l9_28=length(l9_22);
float l9_29=l9_28*l9_28;
float l9_30;
if (sc_PointLights[l9_19].falloffEndDistance==0.0)
{
l9_30=1.0/l9_29;
}
else
{
l9_30=max(min(1.0-((l9_29*l9_29)/pow(sc_PointLights[l9_19].falloffEndDistance,4.0)),1.0),0.0)/l9_29;
}
l9_27=l9_26*l9_30;
}
else
{
l9_27=l9_26;
}
l9_16=l9_20+1;
l9_17=l9_14+((vec3(clamp(dot(surfaceProperties.normal,l9_23),0.0,1.0))*sc_PointLights[l9_19].color.xyz)*l9_27);
l9_18=l9_15+((calculateDirectSpecular(surfaceProperties,l9_23,l9_0)*sc_PointLights[l9_19].color.xyz)*l9_27);
l9_20=l9_16;
l9_15=l9_18;
l9_14=l9_17;
l9_19++;
continue;
}
else
{
break;
}
}
l9_13=l9_15;
l9_12=l9_14;
}
#else
{
l9_13=l9_2;
l9_12=l9_1;
}
#endif
vec3 l9_31;
vec3 l9_32;
#if (sc_ProjectiveShadowsReceiver)
{
vec3 l9_33=evaluateShadow();
l9_32=l9_12*l9_33;
l9_31=l9_13*l9_33;
}
#else
{
l9_32=l9_12;
l9_31=l9_13;
}
#endif
vec3 l9_34=calculateDiffuseIrradiance(surfaceProperties.normal);
SurfaceProperties l9_35=surfaceProperties;
vec3 l9_36;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
vec3 l9_37=reflect(-l9_0,l9_35.normal);
vec3 l9_38;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_38=normalize(mix(l9_37,l9_35.normal,vec3((l9_35.roughness*l9_35.roughness)*l9_35.roughness)));
}
#else
{
l9_38=l9_37;
}
#endif
float l9_39=clamp(pow(l9_35.roughness,0.666667),0.0,1.0)*5.0;
float l9_40=-l9_38.z;
vec2 l9_41=vec2(0.0);
l9_41.x=(((l9_38.x<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_40/length(vec2(l9_38.x,l9_40)),-1.0,1.0)))-1.5708;
vec2 l9_42=l9_41;
l9_42.y=acos(l9_38.y);
vec2 l9_43=l9_42*vec2(0.159155,0.31831);
vec2 l9_44=l9_43;
l9_44.y=1.0-l9_43.y;
float l9_45=l9_43.x+(sc_EnvmapRotation.y*0.00277778);
vec2 l9_46=l9_44;
l9_46.x=fract((l9_45+floor(l9_45))+1.0);
vec4 l9_47;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
float l9_48=floor(l9_39);
float l9_49=ceil(l9_39);
vec2 l9_50;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_51=max(vec2(1.0),sc_EnvmapSpecularSize.xy/vec2(exp2(l9_48)));
l9_50=((l9_46*(l9_51-vec2(1.0)))/l9_51)+(vec2(0.5)/l9_51);
}
#else
{
l9_50=l9_46;
}
#endif
vec4 l9_52=sc_EnvmapSpecularSampleViewLevel(l9_50,l9_48);
vec2 l9_53;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_54=max(vec2(1.0),sc_EnvmapSpecularSize.xy/vec2(exp2(l9_49)));
l9_53=((l9_46*(l9_54-vec2(1.0)))/l9_54)+(vec2(0.5)/l9_54);
}
#else
{
l9_53=l9_46;
}
#endif
l9_47=mix(l9_52,sc_EnvmapSpecularSampleViewLevel(l9_53,l9_49),vec4(l9_39-l9_48));
}
#else
{
l9_47=sc_EnvmapSpecularSampleViewLevel(l9_46,l9_39);
}
#endif
vec3 l9_55=((l9_47.xyz*(1.0/l9_47.w))*sc_EnvmapExposure)+vec3(1e-06);
vec3 l9_56;
if (ReceivesRayTracedReflections())
{
vec4 l9_57;
if (!ReceivesRayTracedReflections())
{
l9_57=vec4(0.0);
}
else
{
l9_57=sc_RayTracedReflectionTextureSampleView(sc_GetGlobalScreenCoords());
}
l9_56=mix(l9_55,l9_57.xyz,vec3(l9_57.w));
}
else
{
l9_56=l9_55;
}
float l9_58=abs(dot(l9_35.normal,l9_0));
vec3 l9_59;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec4 l9_60=(vec4(-1.0,-0.0275,-0.572,0.022)*l9_35.roughness)+vec4(1.0,0.0425,1.04,-0.04);
float l9_61=l9_60.x;
vec2 l9_62=(vec2(-1.04,1.04)*((min(l9_61*l9_61,exp2((-9.28)*l9_58))*l9_61)+l9_60.y))+l9_60.zw;
l9_59=max((l9_35.specColor*l9_62.x)+vec3(l9_62.y),vec3(0.0));
}
#else
{
float l9_63=1.0-l9_58;
float l9_64=l9_63*l9_63;
l9_59=l9_35.specColor+((max(vec3(1.0-l9_35.roughness),l9_35.specColor)-l9_35.specColor)*((l9_64*l9_64)*l9_63));
}
#endif
l9_36=l9_56*l9_59;
}
#else
{
l9_36=vec3(0.0);
}
#endif
vec3 l9_65;
#if (sc_LightEstimation)
{
vec3 l9_66;
l9_66=sc_LightEstimationData.ambientLight*l9_35.specColor;
sc_SphericalGaussianLight_t l9_67;
vec3 l9_68;
float l9_69;
vec3 l9_70;
vec3 l9_71;
int l9_72=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_72<sc_LightEstimationSGCount)
{
l9_66+=SpecularTermSG(sc_LightEstimationData.sg[l9_72],l9_35.normal,clamp(l9_35.roughness*l9_35.roughness,0.01,1.0),l9_0,l9_35.specColor);
l9_72++;
continue;
}
else
{
break;
}
}
l9_65=l9_36+l9_66;
}
#else
{
l9_65=l9_36;
}
#endif
return LightingComponents(l9_32,l9_31,l9_34,l9_65,vec3(0.0),vec3(0.0));
}
vec4 ngsCalculateLighting(vec3 albedo,float opacity,vec3 normal,vec3 position,vec3 viewDir,vec3 emissive,float metallic,float roughness,vec3 ao,vec3 specularAO)
{
float l9_0=opacity;
vec3 l9_1=albedo;
vec3 l9_2;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_2=vec3(pow(l9_1.x,2.2),pow(l9_1.y,2.2),pow(l9_1.z,2.2));
}
#else
{
l9_2=l9_1*l9_1;
}
#endif
vec3 l9_3=normal;
vec3 l9_4=position;
vec3 l9_5=viewDir;
vec3 l9_6=emissive;
vec3 l9_7;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_7=vec3(pow(l9_6.x,2.2),pow(l9_6.y,2.2),pow(l9_6.z,2.2));
}
#else
{
l9_7=l9_6*l9_6;
}
#endif
float l9_8=metallic;
vec3 l9_9=ao;
vec3 l9_10=specularAO;
vec3 l9_11=vec3(l9_8);
vec3 l9_12=l9_2*(1.0-l9_8);
vec3 l9_13=mix(l9_12,vec3(0.0),l9_11);
LightingComponents l9_14=evaluateLighting(SurfaceProperties(l9_13,l9_0,normalize(l9_3),l9_4,l9_5,l9_8,roughness,l9_7,l9_9,l9_10,vec3(1.0),mix(vec3(0.04),l9_2*l9_8,l9_11)));
float l9_15;
vec3 l9_16;
vec3 l9_17;
vec3 l9_18;
#if (sc_BlendMode_ColoredGlass)
{
vec4 l9_19=getFramebufferColor();
vec3 l9_20=l9_19.xyz;
vec3 l9_21;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_21=vec3(pow(l9_19.x,2.2),pow(l9_19.y,2.2),pow(l9_19.z,2.2));
}
#else
{
l9_21=l9_20*l9_20;
}
#endif
l9_18=vec3(0.0);
l9_17=vec3(0.0);
l9_16=l9_21*mix(vec3(1.0),l9_13,vec3(l9_0));
l9_15=1.0;
}
#else
{
l9_18=l9_14.directDiffuse;
l9_17=l9_14.indirectDiffuse;
l9_16=l9_14.transmitted;
l9_15=l9_0;
}
#endif
bool l9_22;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_22=true;
}
#else
{
l9_22=false;
}
#endif
vec3 l9_23=l9_17*l9_9;
vec3 l9_24=l9_18+l9_23;
vec3 l9_25=l9_13*l9_24;
vec3 l9_26;
if (l9_22)
{
float l9_27;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_27=pow(l9_15,2.2);
}
#else
{
l9_27=l9_15*l9_15;
}
#endif
l9_26=l9_25*l9_27;
}
else
{
l9_26=l9_25;
}
vec3 l9_28=l9_26+(l9_14.directSpecular+(l9_14.indirectSpecular*l9_10));
vec3 l9_29=l9_28+l9_7;
vec3 l9_30=l9_29+l9_16;
vec4 l9_31=vec4(l9_30,l9_15);
vec4 l9_32;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_33=l9_31.xyz;
vec3 l9_34;
#if (SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec3 l9_35=l9_33*1.8;
l9_34=(l9_33*(l9_35+vec3(1.4)))/((l9_33*(l9_35+vec3(0.5)))+vec3(1.5));
}
#else
{
vec3 l9_36=l9_33*1.8;
l9_34=(l9_33*(l9_36+vec3(1.4)))/min(vec3(1000.0),(l9_33*(l9_36+vec3(0.5)))+vec3(1.5));
}
#endif
l9_32=vec4(l9_34.x,l9_34.y,l9_34.z,l9_31.w);
}
#else
{
l9_32=l9_31;
}
#endif
float l9_37;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_37=pow(l9_32.x,0.454545);
}
#else
{
l9_37=sqrt(l9_32.x);
}
#endif
float l9_38;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_38=pow(l9_32.y,0.454545);
}
#else
{
l9_38=sqrt(l9_32.y);
}
#endif
float l9_39;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_39=pow(l9_32.z,0.454545);
}
#else
{
l9_39=sqrt(l9_32.z);
}
#endif
vec3 l9_40=vec3(l9_37,l9_38,l9_39);
return vec4(l9_40.x,l9_40.y,l9_40.z,l9_32.w);
}
void Node26_PBR_Lighting(vec3 Albedo,float Opacity,vec3 Normal,vec3 Emissive,float Metallic,float Roughness,vec3 AO,vec3 SpecularAO,out vec4 Output,ssGlobals Globals)
{
#if (!sc_ProjectiveShadowsCaster)
{
Globals.BumpedNormal=mat3(Globals.VertexTangent_WorldSpace,Globals.VertexBinormal_WorldSpace,Globals.VertexNormal_WorldSpace)*Normal;
}
#endif
Opacity=clamp(Opacity,0.0,1.0);
Albedo=max(Albedo,vec3(0.0));
#if (!sc_ProjectiveShadowsCaster)
{
Output=ngsCalculateLighting(Albedo,Opacity,Globals.BumpedNormal,Globals.PositionWS,Globals.ViewDirWS,Emissive,Metallic,Roughness,AO,SpecularAO);
}
#else
{
Output=vec4(Albedo,Opacity);
}
#endif
Output=max(Output,vec4(0.0));
}
void Node240_Switch(float Switch,float Value0,float Value1,float Value2,float Value3,float Default,out float Result,ssGlobals Globals)
{
#if (NODE_243_DROPLIST_ITEM==0)
{
float l9_0=radians(Port_Rotation_N159);
float l9_1=sin(l9_0);
float l9_2=cos(l9_0);
vec2 l9_3=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_6;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_2,l9_1),l9_3),dot(vec2(-l9_1,l9_2),l9_3))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_6,Globals);
Value0=param_6.x;
Result=Value0;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==1)
{
float l9_4=radians(Port_Rotation_N159);
float l9_5=sin(l9_4);
float l9_6=cos(l9_4);
vec2 l9_7=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_14;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_6,l9_5),l9_7),dot(vec2(-l9_5,l9_6),l9_7))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_14,Globals);
Value1=param_14.y;
Result=Value1;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==2)
{
float l9_8=radians(Port_Rotation_N159);
float l9_9=sin(l9_8);
float l9_10=cos(l9_8);
vec2 l9_11=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_22;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_10,l9_9),l9_11),dot(vec2(-l9_9,l9_10),l9_11))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_22,Globals);
Value2=param_22.z;
Result=Value2;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==3)
{
float l9_12=radians(Port_Rotation_N159);
float l9_13=sin(l9_12);
float l9_14=cos(l9_12);
vec2 l9_15=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_30;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_14,l9_13),l9_15),dot(vec2(-l9_13,l9_14),l9_15))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_30,Globals);
Value3=param_30.w;
Result=Value3;
}
#else
{
float l9_16=radians(Port_Rotation_N159);
float l9_17=sin(l9_16);
float l9_18=cos(l9_16);
vec2 l9_19=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_38;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_18,l9_17),l9_19),dot(vec2(-l9_17,l9_18),l9_19))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_38,Globals);
Default=param_38.w;
Result=Default;
}
#endif
}
#endif
}
#endif
}
#endif
}
void Node167_Flipbook_Sample(vec2 SpriteCount,float MaxFrames,vec2 UVCoord,float FrameOffset,float Speed,float SecondOffset,out vec4 Color,ssGlobals Globals)
{
float l9_0=SpriteCount.x;
int l9_1=int(l9_0);
float l9_2=SpriteCount.y;
int l9_3=int(l9_2);
int l9_4=l9_1*l9_3;
float l9_5=MaxFrames;
int l9_6=int(l9_5);
int l9_7=(l9_4<l9_6) ? l9_4 : l9_6;
float l9_8=1.0/float(l9_3);
float l9_9=Globals.gTimeElapsedShifted;
float l9_10=SecondOffset;
float l9_11=Speed;
float l9_12=FrameOffset;
int l9_13=int(((l9_9+l9_10)*l9_11)+floor(l9_12));
int l9_14=l9_13-(l9_7*(l9_13/l9_7));
int l9_15=l9_14/l9_1;
float l9_16=UVCoord.x;
float l9_17=UVCoord.y;
int l9_18;
#if (repelflipbookTexHasSwappedViews)
{
l9_18=1-sc_GetStereoViewIndex();
}
#else
{
l9_18=sc_GetStereoViewIndex();
}
#endif
Color=sc_SampleTextureBiasOrLevel(repelflipbookTexDims.xy,repelflipbookTexLayout,l9_18,mod(vec2((1.0/float(l9_1))*(l9_16+float(l9_14-(l9_1*l9_15))),((1.0-l9_8)-(float(l9_15)*l9_8))+(l9_8*l9_17)),vec2(1.0)),(int(SC_USE_UV_TRANSFORM_repelflipbookTex)!=0),repelflipbookTexTransform,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex),(int(SC_USE_UV_MIN_MAX_repelflipbookTex)!=0),repelflipbookTexUvMinMax,(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0),repelflipbookTexBorderColor,0.0,repelflipbookTex);
}
void Node252_If_else(float Bool1,vec4 Value1,vec4 Default,out vec4 Result,ssGlobals Globals)
{
#if (Tweak_N248)
{
vec4 l9_0=gParticle.Color;
ssGlobals l9_1=Globals;
float l9_2;
#if (Tweak_N261)
{
float l9_3;
Node240_Switch(0.0,0.0,0.0,0.0,0.0,0.0,l9_3,l9_1);
l9_2=1.0-l9_3;
}
#else
{
float l9_4;
Node240_Switch(0.0,0.0,0.0,0.0,0.0,0.0,l9_4,l9_1);
l9_2=l9_4;
}
#endif
vec4 l9_5=vec4(l9_2);
vec4 l9_6=mix(l9_0,colorMix,l9_5);
float l9_7=l9_6.x;
float l9_8;
if (l9_7<=0.0)
{
l9_8=0.0;
}
else
{
l9_8=pow(l9_7,intensity);
}
float l9_9=l9_6.y;
float l9_10;
if (l9_9<=0.0)
{
l9_10=0.0;
}
else
{
l9_10=pow(l9_9,intensity);
}
float l9_11=l9_6.z;
float l9_12;
if (l9_11<=0.0)
{
l9_12=0.0;
}
else
{
l9_12=pow(l9_11,intensity);
}
float l9_13=l9_6.w;
float l9_14;
if (l9_13<=0.0)
{
l9_14=0.0;
}
else
{
l9_14=pow(l9_13,intensity);
}
Value1=vec4(l9_8,l9_10,l9_12,l9_14);
Result=Value1;
}
#else
{
float l9_15=radians(Port_Rotation_N159);
float l9_16=sin(l9_15);
float l9_17=cos(l9_15);
vec2 l9_18=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_6;
Node167_Flipbook_Sample(Port_SpriteCount_N167,Port_MaxFrames_N167,vec2(dot(vec2(l9_17,l9_16),l9_18),dot(vec2(-l9_16,l9_17),l9_18))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N167,param_6,Globals);
Default=param_6;
Result=Default;
}
#endif
}
void Node259_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
#if (Tweak_N248)
{
float l9_0=radians(Port_Rotation_N159);
float l9_1=sin(l9_0);
float l9_2=cos(l9_0);
vec2 l9_3=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_6;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_2,l9_1),l9_3),dot(vec2(-l9_1,l9_2),l9_3))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_6,Globals);
Input1=param_6.w*gParticle.Color.w;
Output=Input1;
}
#else
{
float l9_4=radians(Port_Rotation_N159);
float l9_5=sin(l9_4);
float l9_6=cos(l9_4);
vec2 l9_7=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_14;
Node167_Flipbook_Sample(Port_SpriteCount_N167,Port_MaxFrames_N167,vec2(dot(vec2(l9_6,l9_5),l9_7),dot(vec2(-l9_5,l9_6),l9_7))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N167,param_14,Globals);
Input2=gParticle.Color.w*param_14.w;
Output=Input2;
}
#endif
}
void Node258_PBR_Lighting(vec3 Albedo,float Opacity,vec3 Normal,vec3 Emissive,float Metallic,float Roughness,vec3 AO,vec3 SpecularAO,out vec4 Output,ssGlobals Globals)
{
#if (!sc_ProjectiveShadowsCaster)
{
Globals.BumpedNormal=mat3(Globals.VertexTangent_WorldSpace,Globals.VertexBinormal_WorldSpace,Globals.VertexNormal_WorldSpace)*Normal;
}
#endif
Opacity=clamp(Opacity,0.0,1.0);
Albedo=max(Albedo,vec3(0.0));
#if (!sc_ProjectiveShadowsCaster)
{
Output=ngsCalculateLighting(Albedo,Opacity,Globals.BumpedNormal,Globals.PositionWS,Globals.ViewDirWS,Emissive,Metallic,Roughness,AO,SpecularAO);
}
#else
{
Output=vec4(Albedo,Opacity);
}
#endif
Output=max(Output,vec4(0.0));
}
void Node11_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if (Input0!=0.0)
{
float l9_0=radians(Port_Rotation_N159);
float l9_1=sin(l9_0);
float l9_2=cos(l9_0);
vec2 l9_3=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_6;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_2,l9_1),l9_3),dot(vec2(-l9_1,l9_2),l9_3))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_6,Globals);
vec4 l9_4=param_6;
vec2 l9_5=Globals.Surface_UVCoord0;
vec2 l9_6=(l9_5*Port_Input1_N031)-vec2(1.0);
float l9_7=1.001-clamp(dot(l9_6,l9_6)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001);
float l9_8;
if (l9_7<=0.0)
{
l9_8=0.0;
}
else
{
l9_8=sqrt(l9_7);
}
vec3 l9_9=vec3(l9_6.x,l9_6.y,vec3(0.0).z);
l9_9.z=l9_8;
vec4 param_16;
Node26_PBR_Lighting(l9_4.xyz,l9_4.w*gParticle.Color.w,mix(Port_Input0_N038,l9_9,vec3(float(distance(l9_5,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N026,Port_Metallic_N026,Port_Roughness_N026,Port_AO_N026,Port_SpecularAO_N026,param_16,Globals);
Input1=param_16;
Output=Input1;
}
else
{
vec4 param_21;
Node252_If_else(0.0,vec4(0.0),vec4(0.0),param_21,Globals);
vec4 l9_10=param_21;
float param_26;
Node259_Conditional(1.0,1.0,0.0,param_26,Globals);
float l9_11=param_26;
vec2 l9_12=Globals.Surface_UVCoord0;
vec2 l9_13=(l9_12*Port_Input1_N031)-vec2(1.0);
float l9_14=1.001-clamp(dot(l9_13,l9_13)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001);
float l9_15;
if (l9_14<=0.0)
{
l9_15=0.0;
}
else
{
l9_15=sqrt(l9_14);
}
vec3 l9_16=vec3(l9_13.x,l9_13.y,vec3(0.0).z);
l9_16.z=l9_15;
vec4 param_36;
Node258_PBR_Lighting(l9_10.xyz,l9_11,mix(Port_Input0_N038,l9_16,vec3(float(distance(l9_12,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N258,Port_Metallic_N258,Port_Roughness_N258,Port_AO_N258,Port_SpecularAO_N258,param_36,Globals);
Input2=param_36;
Output=Input2;
}
}
void Node42_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
Input0=float(isIdle);
if (Input0!=0.0)
{
float l9_0=radians(Port_Rotation_N159);
float l9_1=sin(l9_0);
float l9_2=cos(l9_0);
vec2 l9_3=Globals.Surface_UVCoord0-Port_Center_N159;
vec4 param_6;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,vec2(dot(vec2(l9_2,l9_1),l9_3),dot(vec2(-l9_1,l9_2),l9_3))+Port_Center_N159,float(gParticle.Index1D),(((gParticle.Ratio1D-Port_RangeMinA_N156)/(Port_RangeMaxA_N156-Port_RangeMinA_N156))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_6,Globals);
vec4 l9_4=param_6;
vec2 l9_5=Globals.Surface_UVCoord0;
vec2 l9_6=(l9_5*Port_Input1_N031)-vec2(1.0);
float l9_7=1.001-clamp(dot(l9_6,l9_6)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001);
float l9_8;
if (l9_7<=0.0)
{
l9_8=0.0;
}
else
{
l9_8=sqrt(l9_7);
}
vec3 l9_9=vec3(l9_6.x,l9_6.y,vec3(0.0).z);
l9_9.z=l9_8;
vec4 param_16;
Node26_PBR_Lighting(l9_4.xyz,l9_4.w*gParticle.Color.w,mix(Port_Input0_N038,l9_9,vec3(float(distance(l9_5,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N026,Port_Metallic_N026,Port_Roughness_N026,Port_AO_N026,Port_SpecularAO_N026,param_16,Globals);
Input1=param_16;
Output=Input1;
}
else
{
vec4 param_21;
Node11_Conditional(1.0,vec4(1.0),vec4(0.5,0.0,0.0,0.0),param_21,Globals);
Input2=param_21;
Output=Input2;
}
}
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight,float intMap)
{
vec3 l9_0;
#if (BLEND_MODE_INTENSE)
{
vec3 l9_1=original;
vec4 l9_2;
if (l9_1.y<l9_1.z)
{
l9_2=vec4(l9_1.zy,-1.0,0.666667);
}
else
{
l9_2=vec4(l9_1.yz,0.0,-0.333333);
}
vec4 l9_3;
if (l9_1.x<l9_2.x)
{
l9_3=vec4(l9_2.xy,0.0,l9_1.x);
}
else
{
l9_3=vec4(l9_1.x,l9_2.y,0.0,l9_2.x);
}
float l9_4=l9_3.x-((l9_3.x-min(l9_3.w,l9_3.y))*0.5);
float l9_5=6.0*target.x;
l9_0=mix(original,((clamp(vec3(abs(l9_5-3.0)-1.0,2.0-abs(l9_5-2.0),2.0-abs(l9_5-4.0)),vec3(0.0),vec3(1.0))-vec3(0.5))*((1.0-abs((2.0*l9_4)-1.0))*target.y))+vec3(l9_4),vec3(weight));
}
#else
{
float l9_6=yValue;
float l9_7=intMap;
float l9_8=target.x;
float l9_9;
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
l9_9=l9_6/pow(1.0-l9_8,l9_7);
}
#else
{
float l9_10;
#if (BLEND_MODE_DIVISION)
{
l9_10=l9_6/(1.0-l9_8);
}
#else
{
float l9_11;
#if (BLEND_MODE_BRIGHT)
{
l9_11=l9_6/pow(1.0-l9_8,2.0-(2.0*l9_6));
}
#else
{
l9_11=0.0;
}
#endif
l9_10=l9_11;
}
#endif
l9_9=l9_10;
}
#endif
vec3 l9_12=vec3(0.0);
l9_12.x=l9_9;
float l9_13=yValue;
float l9_14=intMap;
float l9_15=target.y;
float l9_16;
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
l9_16=l9_13/pow(1.0-l9_15,l9_14);
}
#else
{
float l9_17;
#if (BLEND_MODE_DIVISION)
{
l9_17=l9_13/(1.0-l9_15);
}
#else
{
float l9_18;
#if (BLEND_MODE_BRIGHT)
{
l9_18=l9_13/pow(1.0-l9_15,2.0-(2.0*l9_13));
}
#else
{
l9_18=0.0;
}
#endif
l9_17=l9_18;
}
#endif
l9_16=l9_17;
}
#endif
vec3 l9_19=l9_12;
l9_19.y=l9_16;
float l9_20=yValue;
float l9_21=intMap;
float l9_22=target.z;
float l9_23;
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
l9_23=l9_20/pow(1.0-l9_22,l9_21);
}
#else
{
float l9_24;
#if (BLEND_MODE_DIVISION)
{
l9_24=l9_20/(1.0-l9_22);
}
#else
{
float l9_25;
#if (BLEND_MODE_BRIGHT)
{
l9_25=l9_20/pow(1.0-l9_22,2.0-(2.0*l9_20));
}
#else
{
l9_25=0.0;
}
#endif
l9_24=l9_25;
}
#endif
l9_23=l9_24;
}
#endif
vec3 l9_26=l9_19;
l9_26.z=l9_23;
l9_0=mix(original,clamp(l9_26,vec3(0.0),vec3(1.0)),vec3(weight));
}
#endif
return l9_0;
}
vec3 definedBlend(vec3 a,vec3 b)
{
vec3 l9_0;
#if (BLEND_MODE_LIGHTEN)
{
l9_0=max(a,b);
}
#else
{
vec3 l9_1;
#if (BLEND_MODE_DARKEN)
{
l9_1=min(a,b);
}
#else
{
vec3 l9_2;
#if (BLEND_MODE_DIVIDE)
{
l9_2=b/a;
}
#else
{
vec3 l9_3;
#if (BLEND_MODE_AVERAGE)
{
l9_3=(a+b)*0.5;
}
#else
{
vec3 l9_4;
#if (BLEND_MODE_SUBTRACT)
{
l9_4=max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
vec3 l9_5;
#if (BLEND_MODE_DIFFERENCE)
{
l9_5=abs(a-b);
}
#else
{
vec3 l9_6;
#if (BLEND_MODE_NEGATION)
{
l9_6=vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
vec3 l9_7;
#if (BLEND_MODE_EXCLUSION)
{
l9_7=(a+b)-((a*2.0)*b);
}
#else
{
vec3 l9_8;
#if (BLEND_MODE_OVERLAY)
{
float l9_9;
if (a.x<0.5)
{
l9_9=(2.0*a.x)*b.x;
}
else
{
l9_9=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_10;
if (a.y<0.5)
{
l9_10=(2.0*a.y)*b.y;
}
else
{
l9_10=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_11;
if (a.z<0.5)
{
l9_11=(2.0*a.z)*b.z;
}
else
{
l9_11=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
l9_8=vec3(l9_9,l9_10,l9_11);
}
#else
{
vec3 l9_12;
#if (BLEND_MODE_SOFT_LIGHT)
{
l9_12=(((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
vec3 l9_13;
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_14;
if (b.x<0.5)
{
l9_14=(2.0*b.x)*a.x;
}
else
{
l9_14=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_15;
if (b.y<0.5)
{
l9_15=(2.0*b.y)*a.y;
}
else
{
l9_15=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_16;
if (b.z<0.5)
{
l9_16=(2.0*b.z)*a.z;
}
else
{
l9_16=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
l9_13=vec3(l9_14,l9_15,l9_16);
}
#else
{
vec3 l9_17;
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_18;
if (b.x==1.0)
{
l9_18=b.x;
}
else
{
l9_18=min(a.x/(1.0-b.x),1.0);
}
float l9_19;
if (b.y==1.0)
{
l9_19=b.y;
}
else
{
l9_19=min(a.y/(1.0-b.y),1.0);
}
float l9_20;
if (b.z==1.0)
{
l9_20=b.z;
}
else
{
l9_20=min(a.z/(1.0-b.z),1.0);
}
l9_17=vec3(l9_18,l9_19,l9_20);
}
#else
{
vec3 l9_21;
#if (BLEND_MODE_COLOR_BURN)
{
float l9_22;
if (b.x==0.0)
{
l9_22=b.x;
}
else
{
l9_22=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_23;
if (b.y==0.0)
{
l9_23=b.y;
}
else
{
l9_23=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_24;
if (b.z==0.0)
{
l9_24=b.z;
}
else
{
l9_24=max(1.0-((1.0-a.z)/b.z),0.0);
}
l9_21=vec3(l9_22,l9_23,l9_24);
}
#else
{
vec3 l9_25;
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_26;
if (b.x<0.5)
{
l9_26=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_26=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_27;
if (b.y<0.5)
{
l9_27=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_27=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_28;
if (b.z<0.5)
{
l9_28=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_28=min(a.z+(2.0*(b.z-0.5)),1.0);
}
l9_25=vec3(l9_26,l9_27,l9_28);
}
#else
{
vec3 l9_29;
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_30;
if (b.x<0.5)
{
float l9_31;
if ((2.0*b.x)==0.0)
{
l9_31=2.0*b.x;
}
else
{
l9_31=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_30=l9_31;
}
else
{
float l9_32;
if ((2.0*(b.x-0.5))==1.0)
{
l9_32=2.0*(b.x-0.5);
}
else
{
l9_32=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_30=l9_32;
}
float l9_33;
if (b.y<0.5)
{
float l9_34;
if ((2.0*b.y)==0.0)
{
l9_34=2.0*b.y;
}
else
{
l9_34=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.y-0.5))==1.0)
{
l9_35=2.0*(b.y-0.5);
}
else
{
l9_35=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_33=l9_35;
}
float l9_36;
if (b.z<0.5)
{
float l9_37;
if ((2.0*b.z)==0.0)
{
l9_37=2.0*b.z;
}
else
{
l9_37=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_36=l9_37;
}
else
{
float l9_38;
if ((2.0*(b.z-0.5))==1.0)
{
l9_38=2.0*(b.z-0.5);
}
else
{
l9_38=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_36=l9_38;
}
l9_29=vec3(l9_30,l9_33,l9_36);
}
#else
{
vec3 l9_39;
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_40;
if (b.x<0.5)
{
l9_40=min(a.x,2.0*b.x);
}
else
{
l9_40=max(a.x,2.0*(b.x-0.5));
}
float l9_41;
if (b.y<0.5)
{
l9_41=min(a.y,2.0*b.y);
}
else
{
l9_41=max(a.y,2.0*(b.y-0.5));
}
float l9_42;
if (b.z<0.5)
{
l9_42=min(a.z,2.0*b.z);
}
else
{
l9_42=max(a.z,2.0*(b.z-0.5));
}
l9_39=vec3(l9_40,l9_41,l9_42);
}
#else
{
vec3 l9_43;
#if (BLEND_MODE_HARD_MIX)
{
float l9_44;
if (b.x<0.5)
{
float l9_45;
if ((2.0*b.x)==0.0)
{
l9_45=2.0*b.x;
}
else
{
l9_45=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_44=l9_45;
}
else
{
float l9_46;
if ((2.0*(b.x-0.5))==1.0)
{
l9_46=2.0*(b.x-0.5);
}
else
{
l9_46=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_44=l9_46;
}
bool l9_47=l9_44<0.5;
float l9_48;
if (b.y<0.5)
{
float l9_49;
if ((2.0*b.y)==0.0)
{
l9_49=2.0*b.y;
}
else
{
l9_49=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_48=l9_49;
}
else
{
float l9_50;
if ((2.0*(b.y-0.5))==1.0)
{
l9_50=2.0*(b.y-0.5);
}
else
{
l9_50=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_48=l9_50;
}
bool l9_51=l9_48<0.5;
float l9_52;
if (b.z<0.5)
{
float l9_53;
if ((2.0*b.z)==0.0)
{
l9_53=2.0*b.z;
}
else
{
l9_53=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_52=l9_53;
}
else
{
float l9_54;
if ((2.0*(b.z-0.5))==1.0)
{
l9_54=2.0*(b.z-0.5);
}
else
{
l9_54=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_52=l9_54;
}
l9_43=vec3(l9_47 ? 0.0 : 1.0,l9_51 ? 0.0 : 1.0,(l9_52<0.5) ? 0.0 : 1.0);
}
#else
{
vec3 l9_55;
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_56;
if (b.x==1.0)
{
l9_56=b.x;
}
else
{
l9_56=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_57;
if (b.y==1.0)
{
l9_57=b.y;
}
else
{
l9_57=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_58;
if (b.z==1.0)
{
l9_58=b.z;
}
else
{
l9_58=min((a.z*a.z)/(1.0-b.z),1.0);
}
l9_55=vec3(l9_56,l9_57,l9_58);
}
#else
{
vec3 l9_59;
#if (BLEND_MODE_HARD_GLOW)
{
float l9_60;
if (a.x==1.0)
{
l9_60=a.x;
}
else
{
l9_60=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_61;
if (a.y==1.0)
{
l9_61=a.y;
}
else
{
l9_61=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_62;
if (a.z==1.0)
{
l9_62=a.z;
}
else
{
l9_62=min((b.z*b.z)/(1.0-a.z),1.0);
}
l9_59=vec3(l9_60,l9_61,l9_62);
}
#else
{
vec3 l9_63;
#if (BLEND_MODE_HARD_PHOENIX)
{
l9_63=(min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
vec3 l9_64;
#if (BLEND_MODE_HUE)
{
vec3 l9_65=a;
vec3 l9_66=b;
vec4 l9_67;
if (l9_65.y<l9_65.z)
{
l9_67=vec4(l9_65.zy,-1.0,0.666667);
}
else
{
l9_67=vec4(l9_65.yz,0.0,-0.333333);
}
vec4 l9_68;
if (l9_65.x<l9_67.x)
{
l9_68=vec4(l9_67.xy,0.0,l9_65.x);
}
else
{
l9_68=vec4(l9_65.x,l9_67.y,0.0,l9_67.x);
}
float l9_69=l9_68.x-min(l9_68.w,l9_68.y);
float l9_70=l9_68.x-(l9_69*0.5);
float l9_71=abs((2.0*l9_70)-1.0);
vec4 l9_72;
if (l9_66.y<l9_66.z)
{
l9_72=vec4(l9_66.zy,-1.0,0.666667);
}
else
{
l9_72=vec4(l9_66.yz,0.0,-0.333333);
}
vec4 l9_73;
if (l9_66.x<l9_72.x)
{
l9_73=vec4(l9_72.xyw,l9_66.x);
}
else
{
l9_73=vec4(l9_66.x,l9_72.yzx);
}
float l9_74=6.0*abs(((l9_73.w-l9_73.y)/((6.0*(l9_73.x-min(l9_73.w,l9_73.y)))+1e-07))+l9_73.z);
l9_64=((clamp(vec3(abs(l9_74-3.0)-1.0,2.0-abs(l9_74-2.0),2.0-abs(l9_74-4.0)),vec3(0.0),vec3(1.0))-vec3(0.5))*((1.0-l9_71)*(l9_69/(1.0-l9_71))))+vec3(l9_70);
}
#else
{
vec3 l9_75;
#if (BLEND_MODE_SATURATION)
{
vec3 l9_76=a;
vec3 l9_77=b;
vec4 l9_78;
if (l9_76.y<l9_76.z)
{
l9_78=vec4(l9_76.zy,-1.0,0.666667);
}
else
{
l9_78=vec4(l9_76.yz,0.0,-0.333333);
}
vec4 l9_79;
if (l9_76.x<l9_78.x)
{
l9_79=vec4(l9_78.xyw,l9_76.x);
}
else
{
l9_79=vec4(l9_76.x,l9_78.yzx);
}
float l9_80=l9_79.x-min(l9_79.w,l9_79.y);
float l9_81=l9_79.x-(l9_80*0.5);
vec4 l9_82;
if (l9_77.y<l9_77.z)
{
l9_82=vec4(l9_77.zy,-1.0,0.666667);
}
else
{
l9_82=vec4(l9_77.yz,0.0,-0.333333);
}
vec4 l9_83;
if (l9_77.x<l9_82.x)
{
l9_83=vec4(l9_82.xy,0.0,l9_77.x);
}
else
{
l9_83=vec4(l9_77.x,l9_82.y,0.0,l9_82.x);
}
float l9_84=l9_83.x-min(l9_83.w,l9_83.y);
float l9_85=6.0*abs(((l9_79.w-l9_79.y)/((6.0*l9_80)+1e-07))+l9_79.z);
l9_75=((clamp(vec3(abs(l9_85-3.0)-1.0,2.0-abs(l9_85-2.0),2.0-abs(l9_85-4.0)),vec3(0.0),vec3(1.0))-vec3(0.5))*((1.0-abs((2.0*l9_81)-1.0))*(l9_84/(1.0-abs((2.0*(l9_83.x-(l9_84*0.5)))-1.0)))))+vec3(l9_81);
}
#else
{
vec3 l9_86;
#if (BLEND_MODE_COLOR)
{
vec3 l9_87=a;
vec3 l9_88=b;
vec4 l9_89;
if (l9_88.y<l9_88.z)
{
l9_89=vec4(l9_88.zy,-1.0,0.666667);
}
else
{
l9_89=vec4(l9_88.yz,0.0,-0.333333);
}
vec4 l9_90;
if (l9_88.x<l9_89.x)
{
l9_90=vec4(l9_89.xyw,l9_88.x);
}
else
{
l9_90=vec4(l9_88.x,l9_89.yzx);
}
float l9_91=l9_90.x-min(l9_90.w,l9_90.y);
vec4 l9_92;
if (l9_87.y<l9_87.z)
{
l9_92=vec4(l9_87.zy,-1.0,0.666667);
}
else
{
l9_92=vec4(l9_87.yz,0.0,-0.333333);
}
vec4 l9_93;
if (l9_87.x<l9_92.x)
{
l9_93=vec4(l9_92.xy,0.0,l9_87.x);
}
else
{
l9_93=vec4(l9_87.x,l9_92.y,0.0,l9_92.x);
}
float l9_94=l9_93.x-((l9_93.x-min(l9_93.w,l9_93.y))*0.5);
float l9_95=6.0*abs(((l9_90.w-l9_90.y)/((6.0*l9_91)+1e-07))+l9_90.z);
l9_86=((clamp(vec3(abs(l9_95-3.0)-1.0,2.0-abs(l9_95-2.0),2.0-abs(l9_95-4.0)),vec3(0.0),vec3(1.0))-vec3(0.5))*((1.0-abs((2.0*l9_94)-1.0))*(l9_91/(1.0-abs((2.0*(l9_90.x-(l9_91*0.5)))-1.0)))))+vec3(l9_94);
}
#else
{
vec3 l9_96;
#if (BLEND_MODE_LUMINOSITY)
{
vec3 l9_97=a;
vec3 l9_98=b;
vec4 l9_99;
if (l9_97.y<l9_97.z)
{
l9_99=vec4(l9_97.zy,-1.0,0.666667);
}
else
{
l9_99=vec4(l9_97.yz,0.0,-0.333333);
}
vec4 l9_100;
if (l9_97.x<l9_99.x)
{
l9_100=vec4(l9_99.xyw,l9_97.x);
}
else
{
l9_100=vec4(l9_97.x,l9_99.yzx);
}
float l9_101=l9_100.x-min(l9_100.w,l9_100.y);
vec4 l9_102;
if (l9_98.y<l9_98.z)
{
l9_102=vec4(l9_98.zy,-1.0,0.666667);
}
else
{
l9_102=vec4(l9_98.yz,0.0,-0.333333);
}
vec4 l9_103;
if (l9_98.x<l9_102.x)
{
l9_103=vec4(l9_102.xy,0.0,l9_98.x);
}
else
{
l9_103=vec4(l9_98.x,l9_102.y,0.0,l9_102.x);
}
float l9_104=l9_103.x-((l9_103.x-min(l9_103.w,l9_103.y))*0.5);
float l9_105=6.0*abs(((l9_100.w-l9_100.y)/((6.0*l9_101)+1e-07))+l9_100.z);
l9_96=((clamp(vec3(abs(l9_105-3.0)-1.0,2.0-abs(l9_105-2.0),2.0-abs(l9_105-4.0)),vec3(0.0),vec3(1.0))-vec3(0.5))*((1.0-abs((2.0*l9_104)-1.0))*(l9_101/(1.0-abs((2.0*(l9_100.x-(l9_101*0.5)))-1.0)))))+vec3(l9_104);
}
#else
{
vec3 l9_106=a;
vec3 l9_107=b;
float l9_108=((0.299*l9_106.x)+(0.587*l9_106.y))+(0.114*l9_106.z);
int l9_109;
#if (intensityTextureHasSwappedViews)
{
l9_109=1-sc_GetStereoViewIndex();
}
#else
{
l9_109=sc_GetStereoViewIndex();
}
#endif
vec4 l9_110=sc_SampleTextureBiasOrLevel(intensityTextureDims.xy,intensityTextureLayout,l9_109,vec2(pow(l9_108,1.0/correctedIntensity),0.5),(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture),(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0),intensityTextureUvMinMax,(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0),intensityTextureBorderColor,0.0,intensityTexture);
float l9_111=(((l9_110.x*256.0)+l9_110.y)+(l9_110.z*0.00390625))*0.0622559;
float l9_112;
#if (BLEND_MODE_FORGRAY)
{
l9_112=max(l9_111,1.0);
}
#else
{
l9_112=l9_111;
}
#endif
float l9_113;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_113=min(l9_112,1.0);
}
#else
{
l9_113=l9_112;
}
#endif
l9_96=transformColor(l9_108,l9_106,l9_107,1.0,l9_113);
}
#endif
l9_86=l9_96;
}
#endif
l9_75=l9_86;
}
#endif
l9_64=l9_75;
}
#endif
l9_63=l9_64;
}
#endif
l9_59=l9_63;
}
#endif
l9_55=l9_59;
}
#endif
l9_43=l9_55;
}
#endif
l9_39=l9_43;
}
#endif
l9_29=l9_39;
}
#endif
l9_25=l9_29;
}
#endif
l9_21=l9_25;
}
#endif
l9_17=l9_21;
}
#endif
l9_13=l9_17;
}
#endif
l9_12=l9_13;
}
#endif
l9_8=l9_12;
}
#endif
l9_7=l9_8;
}
#endif
l9_6=l9_7;
}
#endif
l9_5=l9_6;
}
#endif
l9_4=l9_5;
}
#endif
l9_3=l9_4;
}
#endif
l9_2=l9_3;
}
#endif
l9_1=l9_2;
}
#endif
l9_0=l9_1;
}
#endif
return l9_0;
}
vec4 ngsPixelShader(vec4 result)
{
#if (sc_ProjectiveShadowsCaster)
{
return evaluateShadowCasterColor(result);
}
#else
{
#if (sc_RenderAlphaToColor)
{
return vec4(result.w);
}
#endif
}
#endif
#if (sc_BlendMode_Custom)
{
vec3 l9_0=getFramebufferColor().xyz;
vec3 l9_1=mix(l9_0,definedBlend(l9_0,result.xyz).xyz,vec3(result.w));
vec4 l9_2=vec4(l9_1.x,l9_1.y,l9_1.z,vec4(0.0).w);
l9_2.w=1.0;
result=l9_2;
}
#else
{
result=sc_ApplyBlendModeModifications(result);
}
#endif
return result;
}
void oitDepthGather(vec4 materialColor)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_0=getScreenUV();
#if (sc_OITMaxLayers4Plus1)
{
vec4 l9_1=texture2D(sc_OITFrontDepthTexture,l9_0);
float l9_2;
#if (sc_SkinBonesCount>0)
{
l9_2=5e-07;
}
#else
{
l9_2=5e-08;
}
#endif
if ((sc_GetGlFragCoord().z-l9_1.x)<=l9_2)
{
discard;
}
}
#endif
vec4 l9_3=texture2D(sc_OITFilteredDepthBoundsTexture,l9_0);
float l9_4;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
l9_4=varViewSpaceDepth;
}
#else
{
l9_4=sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((sc_GetGlFragCoord().z*2.0)-1.0));
}
#endif
float l9_5=(1.0-l9_3.x)*1000.0;
float l9_6=l9_4-l9_5;
int l9_7=int(clamp(l9_6/((l9_3.y*1000.0)-l9_5),0.0,1.0)*65535.0);
float l9_8=materialColor.w;
int l9_9=int(l9_8*255.0);
float l9_10;
int l9_11;
#if (sc_OITDepthGatherPass)
{
l9_11=l9_7/4;
l9_10=floor(floor(mod(float(l9_7),4.0))*64.0)*0.00392157;
}
#else
{
l9_11=l9_7;
l9_10=0.0;
}
#endif
vec4 l9_12=vec4(0.0);
l9_12.x=l9_10;
float l9_13;
int l9_14;
#if (sc_OITDepthGatherPass)
{
l9_14=l9_11/4;
l9_13=floor(floor(mod(float(l9_11),4.0))*64.0)*0.00392157;
}
#else
{
l9_14=l9_11;
l9_13=0.0;
}
#endif
vec4 l9_15=l9_12;
l9_15.y=l9_13;
float l9_16;
int l9_17;
#if (sc_OITDepthGatherPass)
{
l9_17=l9_14/4;
l9_16=floor(floor(mod(float(l9_14),4.0))*64.0)*0.00392157;
}
#else
{
l9_17=l9_14;
l9_16=0.0;
}
#endif
vec4 l9_18=l9_15;
l9_18.z=l9_16;
float l9_19;
int l9_20;
#if (sc_OITDepthGatherPass)
{
l9_20=l9_17/4;
l9_19=floor(floor(mod(float(l9_17),4.0))*64.0)*0.00392157;
}
#else
{
l9_20=l9_17;
l9_19=0.0;
}
#endif
vec4 l9_21=l9_18;
l9_21.w=l9_19;
float l9_22;
int l9_23;
#if (sc_OITDepthGatherPass)
{
l9_23=l9_20/4;
l9_22=floor(floor(mod(float(l9_20),4.0))*64.0)*0.00392157;
}
#else
{
l9_23=l9_20;
l9_22=0.0;
}
#endif
vec4 l9_24=vec4(0.0);
l9_24.x=l9_22;
float l9_25;
int l9_26;
#if (sc_OITDepthGatherPass)
{
l9_26=l9_23/4;
l9_25=floor(floor(mod(float(l9_23),4.0))*64.0)*0.00392157;
}
#else
{
l9_26=l9_23;
l9_25=0.0;
}
#endif
vec4 l9_27=l9_24;
l9_27.y=l9_25;
float l9_28;
int l9_29;
#if (sc_OITDepthGatherPass)
{
l9_29=l9_26/4;
l9_28=floor(floor(mod(float(l9_26),4.0))*64.0)*0.00392157;
}
#else
{
l9_29=l9_26;
l9_28=0.0;
}
#endif
vec4 l9_30=l9_27;
l9_30.z=l9_28;
float l9_31;
#if (sc_OITDepthGatherPass)
{
l9_31=floor(floor(mod(float(l9_29),4.0))*64.0)*0.00392157;
}
#else
{
l9_31=0.0;
}
#endif
vec4 l9_32=l9_30;
l9_32.w=l9_31;
float l9_33;
int l9_34;
#if (sc_OITDepthGatherPass)
{
l9_34=l9_9/4;
l9_33=floor(floor(mod(float(l9_9),4.0))*64.0)*0.00392157;
}
#else
{
l9_34=l9_9;
l9_33=0.0;
}
#endif
vec4 l9_35=vec4(0.0);
l9_35.x=l9_33;
float l9_36;
int l9_37;
#if (sc_OITDepthGatherPass)
{
l9_37=l9_34/4;
l9_36=floor(floor(mod(float(l9_34),4.0))*64.0)*0.00392157;
}
#else
{
l9_37=l9_34;
l9_36=0.0;
}
#endif
vec4 l9_38=l9_35;
l9_38.y=l9_36;
float l9_39;
int l9_40;
#if (sc_OITDepthGatherPass)
{
l9_40=l9_37/4;
l9_39=floor(floor(mod(float(l9_37),4.0))*64.0)*0.00392157;
}
#else
{
l9_40=l9_37;
l9_39=0.0;
}
#endif
vec4 l9_41=l9_38;
l9_41.z=l9_39;
float l9_42;
#if (sc_OITDepthGatherPass)
{
l9_42=floor(floor(mod(float(l9_40),4.0))*64.0)*0.00392157;
}
#else
{
l9_42=0.0;
}
#endif
vec4 l9_43=l9_41;
l9_43.w=l9_42;
sc_writeFragData0(l9_32);
sc_writeFragData1(l9_21);
sc_writeFragData2(l9_43);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.00392157,0.0,0.0,0.0));
}
#endif
}
#endif
}
void oitCompositing(vec4 materialColor)
{
#if (sc_OITCompositingPass)
{
vec2 l9_0=getScreenUV();
#if (sc_OITMaxLayers4Plus1)
{
vec4 l9_1=texture2D(sc_OITFrontDepthTexture,l9_0);
float l9_2;
#if (sc_SkinBonesCount>0)
{
l9_2=5e-07;
}
#else
{
l9_2=5e-08;
}
#endif
if ((sc_GetGlFragCoord().z-l9_1.x)<=l9_2)
{
discard;
}
}
#endif
int depths[8];
int alphas[8];
int l9_3=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3<8)
{
depths[l9_3]=0;
alphas[l9_3]=0;
l9_3++;
continue;
}
else
{
break;
}
}
int l9_4;
#if (sc_OITMaxLayers8)
{
l9_4=2;
}
#else
{
l9_4=1;
}
#endif
vec4 l9_5;
vec4 l9_6;
vec4 l9_7;
l9_7=vec4(0.0);
l9_6=vec4(0.0);
l9_5=vec4(0.0);
vec4 l9_8;
vec4 l9_9;
vec4 l9_10;
int l9_11=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_11<l9_4)
{
vec4 l9_12;
vec4 l9_13;
vec4 l9_14;
if (l9_11==0)
{
l9_14=texture2D(sc_OITAlpha0,l9_0);
l9_13=texture2D(sc_OITDepthLow0,l9_0);
l9_12=texture2D(sc_OITDepthHigh0,l9_0);
}
else
{
l9_14=l9_7;
l9_13=l9_6;
l9_12=l9_5;
}
if (l9_11==1)
{
l9_10=texture2D(sc_OITAlpha1,l9_0);
l9_9=texture2D(sc_OITDepthLow1,l9_0);
l9_8=texture2D(sc_OITDepthHigh1,l9_0);
}
else
{
l9_10=l9_14;
l9_9=l9_13;
l9_8=l9_12;
}
if (any(notEqual(l9_8,vec4(0.0)))||any(notEqual(l9_9,vec4(0.0))))
{
int param[8]=depths;
#if (sc_OITCompositingPass)
{
int l9_15=((l9_11+1)*4)-1;
float l9_16=floor((l9_8.w*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_15>=(l9_11*4))
{
param[l9_15]=(param[l9_15]*4)+int(floor(mod(l9_16,4.0)));
l9_16=floor(l9_16*0.25);
l9_15--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param;
int param_1[8]=param;
#if (sc_OITCompositingPass)
{
int l9_17=((l9_11+1)*4)-1;
float l9_18=floor((l9_8.z*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_17>=(l9_11*4))
{
param_1[l9_17]=(param_1[l9_17]*4)+int(floor(mod(l9_18,4.0)));
l9_18=floor(l9_18*0.25);
l9_17--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_1;
int param_2[8]=param_1;
#if (sc_OITCompositingPass)
{
int l9_19=((l9_11+1)*4)-1;
float l9_20=floor((l9_8.y*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_19>=(l9_11*4))
{
param_2[l9_19]=(param_2[l9_19]*4)+int(floor(mod(l9_20,4.0)));
l9_20=floor(l9_20*0.25);
l9_19--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_2;
int param_3[8]=param_2;
#if (sc_OITCompositingPass)
{
int l9_21=((l9_11+1)*4)-1;
float l9_22=floor((l9_8.x*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_21>=(l9_11*4))
{
param_3[l9_21]=(param_3[l9_21]*4)+int(floor(mod(l9_22,4.0)));
l9_22=floor(l9_22*0.25);
l9_21--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_3;
int param_4[8]=param_3;
#if (sc_OITCompositingPass)
{
int l9_23=((l9_11+1)*4)-1;
float l9_24=floor((l9_9.w*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_23>=(l9_11*4))
{
param_4[l9_23]=(param_4[l9_23]*4)+int(floor(mod(l9_24,4.0)));
l9_24=floor(l9_24*0.25);
l9_23--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_4;
int param_5[8]=param_4;
#if (sc_OITCompositingPass)
{
int l9_25=((l9_11+1)*4)-1;
float l9_26=floor((l9_9.z*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_25>=(l9_11*4))
{
param_5[l9_25]=(param_5[l9_25]*4)+int(floor(mod(l9_26,4.0)));
l9_26=floor(l9_26*0.25);
l9_25--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_5;
int param_6[8]=param_5;
#if (sc_OITCompositingPass)
{
int l9_27=((l9_11+1)*4)-1;
float l9_28=floor((l9_9.y*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_27>=(l9_11*4))
{
param_6[l9_27]=(param_6[l9_27]*4)+int(floor(mod(l9_28,4.0)));
l9_28=floor(l9_28*0.25);
l9_27--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_6;
int param_7[8]=param_6;
#if (sc_OITCompositingPass)
{
int l9_29=((l9_11+1)*4)-1;
float l9_30=floor((l9_9.x*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_29>=(l9_11*4))
{
param_7[l9_29]=(param_7[l9_29]*4)+int(floor(mod(l9_30,4.0)));
l9_30=floor(l9_30*0.25);
l9_29--;
continue;
}
else
{
break;
}
}
}
#endif
depths=param_7;
int param_8[8]=alphas;
#if (sc_OITCompositingPass)
{
int l9_31=((l9_11+1)*4)-1;
float l9_32=floor((l9_10.w*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_31>=(l9_11*4))
{
param_8[l9_31]=(param_8[l9_31]*4)+int(floor(mod(l9_32,4.0)));
l9_32=floor(l9_32*0.25);
l9_31--;
continue;
}
else
{
break;
}
}
}
#endif
alphas=param_8;
int param_9[8]=param_8;
#if (sc_OITCompositingPass)
{
int l9_33=((l9_11+1)*4)-1;
float l9_34=floor((l9_10.z*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_33>=(l9_11*4))
{
param_9[l9_33]=(param_9[l9_33]*4)+int(floor(mod(l9_34,4.0)));
l9_34=floor(l9_34*0.25);
l9_33--;
continue;
}
else
{
break;
}
}
}
#endif
alphas=param_9;
int param_10[8]=param_9;
#if (sc_OITCompositingPass)
{
int l9_35=((l9_11+1)*4)-1;
float l9_36=floor((l9_10.y*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_35>=(l9_11*4))
{
param_10[l9_35]=(param_10[l9_35]*4)+int(floor(mod(l9_36,4.0)));
l9_36=floor(l9_36*0.25);
l9_35--;
continue;
}
else
{
break;
}
}
}
#endif
alphas=param_10;
int param_11[8]=param_10;
#if (sc_OITCompositingPass)
{
int l9_37=((l9_11+1)*4)-1;
float l9_38=floor((l9_10.x*255.0)+0.5);
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_37>=(l9_11*4))
{
param_11[l9_37]=(param_11[l9_37]*4)+int(floor(mod(l9_38,4.0)));
l9_38=floor(l9_38*0.25);
l9_37--;
continue;
}
else
{
break;
}
}
}
#endif
alphas=param_11;
}
l9_7=l9_10;
l9_6=l9_9;
l9_5=l9_8;
l9_11++;
continue;
}
else
{
break;
}
}
vec4 l9_39=texture2D(sc_OITFilteredDepthBoundsTexture,l9_0);
int l9_40;
#if (sc_SkinBonesCount>0)
{
float l9_41;
#if (sc_SkinBonesCount>0)
{
l9_41=0.001;
}
#else
{
l9_41=0.0;
}
#endif
float l9_42=(1.0-l9_39.x)*1000.0;
l9_40=int(clamp(((l9_42+l9_41)-l9_42)/((l9_39.y*1000.0)-l9_42),0.0,1.0)*65535.0);
}
#else
{
l9_40=0;
}
#endif
float l9_43;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
l9_43=varViewSpaceDepth;
}
#else
{
l9_43=sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((sc_GetGlFragCoord().z*2.0)-1.0));
}
#endif
float l9_44=(1.0-l9_39.x)*1000.0;
float l9_45=l9_43-l9_44;
vec4 l9_46;
l9_46=materialColor*materialColor.w;
vec4 l9_47;
int l9_48=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_48<8)
{
int l9_49=depths[l9_48];
int l9_50=int(clamp(l9_45/((l9_39.y*1000.0)-l9_44),0.0,1.0)*65535.0)-l9_40;
bool l9_51=l9_49<l9_50;
bool l9_52;
if (l9_51)
{
l9_52=depths[l9_48]>0;
}
else
{
l9_52=l9_51;
}
if (l9_52)
{
vec3 l9_53=l9_46.xyz*(1.0-(float(alphas[l9_48])*0.00392157));
l9_47=vec4(l9_53.x,l9_53.y,l9_53.z,l9_46.w);
}
else
{
l9_47=l9_46;
}
l9_46=l9_47;
l9_48++;
continue;
}
else
{
break;
}
}
sc_writeFragData0(l9_46);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
discard;
}
#endif
}
#endif
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
vec3 l9_7;
if (sc_GetGlFrontFacing())
{
l9_7=varNormal;
}
else
{
l9_7=-varNormal;
}
vec3 l9_8;
if (sc_GetGlFrontFacing())
{
l9_8=varTangent.xyz;
}
else
{
l9_8=-varTangent.xyz;
}
vec2 l9_9;
if (sc_GetGlFrontFacing())
{
l9_9=varPackedTex.xy;
}
else
{
l9_9=vec2(1.0-varPackedTex.x,varPackedTex.y);
}
gParticle.Color=Interp_Particle_Color;
gParticle.Size=Interp_Particle_Size;
gParticle.Mass=Interp_Particle_Mass;
gParticle.Velocity=Interp_Particle_Velocity;
gParticle.Position=Interp_Particle_Position;
gParticle.Life=Interp_Particle_Life;
gParticle.Age=Interp_Particle_Age;
gParticle.Dead=Interp_Particle_Dead;
bool l9_10=overrideTimeEnabled==1;
float l9_11;
if (l9_10)
{
l9_11=overrideTimeElapsed;
}
else
{
l9_11=sc_Time.x;
}
float l9_12;
if (l9_10)
{
l9_12=overrideTimeDelta;
}
else
{
l9_12=max(sc_Time.y,0.0);
}
vec3 l9_13=normalize(l9_8.xyz);
vec3 l9_14=normalize(l9_7);
ivec2 l9_15=ivec2(Interp_Particle_Index%512,Interp_Particle_Index/512);
float l9_16=float(Interp_Particle_Index);
vec2 l9_17=vec2(l9_15);
float l9_18=l9_16*0.000625391;
float l9_19=l9_16*0.00500313;
float l9_20;
if (l9_10)
{
l9_20=overrideTimeElapsed;
}
else
{
l9_20=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,gParticle.Quaternion,gParticle.Dead,l9_19,fract(abs(((l9_16*0.000610619)+0.151235)+(floor(((l9_20-l9_19)+16.0)*0.125)*4.32723))),(vec2(ivec2(Interp_Particle_Index%400,Interp_Particle_Index/400))+vec2(1.0))*vec2(0.00250627),floor(fract(sin(dot(vec2(l9_18)*vec2(0.3452,0.52254),vec2(0.98253,0.72662)))*479.371)*10000.0)*0.0001,Interp_Particle_Index,(l9_16+0.5)*0.000625,l9_18,l9_15,(l9_17+vec2(0.5))*vec2(0.00195312,0.25),l9_17*vec2(0.00195695,0.333333),vec3(0.0),false);
vec4 param_51;
Node42_Conditional(1.0,vec4(1.0),vec4(0.501961,0.0,0.00813306,1.0),param_51,ssGlobals(l9_11,l9_12,l9_11-(gParticle.TimeShift*l9_12),vec3(0.0),normalize(sc_Camera.position-varPos),varPos,l9_13,l9_14,cross(l9_14,l9_13),l9_9));
vec4 l9_21=ngsPixelShader(param_51);
vec4 l9_22=getPixelRenderingCost();
vec4 l9_23;
if (l9_22.w>0.0)
{
l9_23=l9_22;
}
else
{
l9_23=l9_21;
}
sc_writeFragData0(l9_23);
vec4 l9_24=clamp(l9_23,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_25;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
l9_25=varViewSpaceDepth;
}
#else
{
l9_25=sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((sc_GetGlFragCoord().z*2.0)-1.0));
}
#endif
float l9_26=clamp(l9_25*0.001,0.0,1.0);
sc_writeFragData0(vec4(max(0.0,1.00392-l9_26),min(1.0,l9_26+0.00392157),0.0,0.0));
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0(vec4(1.0));
}
#else
{
#if (sc_OITDepthGatherPass)
{
oitDepthGather(l9_24);
}
#else
{
#if (sc_OITCompositingPass)
{
oitCompositing(l9_24);
}
#else
{
#if (sc_OITFrontLayerPass)
{
#if (sc_OITFrontLayerPass)
{
vec4 l9_27=texture2D(sc_OITFrontDepthTexture,getScreenUV());
float l9_28;
#if (sc_SkinBonesCount>0)
{
l9_28=5e-07;
}
#else
{
l9_28=5e-08;
}
#endif
if (abs(sc_GetGlFragCoord().z-l9_27.x)>l9_28)
{
discard;
}
sc_writeFragData0(l9_24);
}
#endif
}
#else
{
sc_writeFragData0(l9_23);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
