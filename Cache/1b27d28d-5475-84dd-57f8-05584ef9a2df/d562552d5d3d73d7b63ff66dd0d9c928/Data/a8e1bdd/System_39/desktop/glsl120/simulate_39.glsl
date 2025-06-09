//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 position 0
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec3 normal 1
//attribute vec4 tangent 2
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
//spec_const bool renderTarget0HasSwappedViews 0 0
//spec_const bool renderTarget1HasSwappedViews 1 0
//spec_const bool renderTarget2HasSwappedViews 2 0
//spec_const bool renderTarget3HasSwappedViews 3 0
//spec_const bool sc_CanUseTextureLod 4 0
//spec_const int renderTarget0Layout 5 0
//spec_const int renderTarget1Layout 6 0
//spec_const int renderTarget2Layout 7 0
//spec_const int renderTarget3Layout 8 0
//spec_const int sc_ShaderCacheConstant 9 0
//spec_const int sc_StereoRenderingMode 10 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 11 0
//spec_const int sc_StereoViewID 12 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING 1
#ifdef isIdle
#undef isIdle
#endif
#ifdef isAttracting
#undef isAttracting
#endif
#define SC_ENABLE_INSTANCED_RENDERING
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
#ifdef VERTEX_SHADER
    #define scOutPos(clipPosition) gl_Position=clipPosition
    #define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
    #ifndef sc_EnableInstancing
        #define sc_EnableInstancing 1
    #endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
    #define sc_CanUseTextureLod 1
#else
    #ifdef FRAGMENT_SHADER
        #if defined(GL_EXT_shader_texture_lod)
            #extension GL_EXT_shader_texture_lod : require
            #define sc_CanUseTextureLod 1
            #define texture2DLod texture2DLodEXT
        #endif
    #endif
#endif
#if defined(sc_EnableMultiviewStereoRendering)
    #define sc_StereoRenderingMode sc_StereoRendering_Multiview
    #define sc_NumStereoViews 2
    #extension GL_OVR_multiview2 : require
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #define sc_LocalInstanceID sc_GlobalInstanceID
        #define sc_StereoViewID int(gl_ViewID_OVR)
    #endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
    #ifndef sc_EnableInstancing
        #error Instanced-clipped stereo rendering requires enabled instancing.
    #endif
    #ifndef sc_EnableStereoClipDistance
        #define sc_StereoRendering_IsClipDistanceEnabled 0
    #else
        #define sc_StereoRendering_IsClipDistanceEnabled 1
    #endif
    #define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
    #define sc_NumStereoClipPlanes 1
    #define sc_NumStereoViews 2
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
        #ifdef GL_ARB_draw_instanced
            #extension GL_ARB_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDARB
        #endif
        #ifdef GL_EXT_draw_instanced
            #extension GL_EXT_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDEXT
        #endif
        #ifndef sc_InstanceID
            #define sc_InstanceID gl_InstanceID
        #endif
        #ifndef sc_GlobalInstanceID
            #ifdef sc_EnableInstancingFallback
                #define sc_GlobalInstanceID (sc_FallbackInstanceID)
                #define sc_LocalInstanceID (sc_FallbackInstanceID)
            #else
                #define sc_GlobalInstanceID gl_InstanceID
                #define sc_LocalInstanceID gl_InstanceID
            #endif
        #endif
    #endif
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #ifndef sc_CanUseTextureLod
    #define sc_CanUseTextureLod 1
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef FRAGMENT_SHADER
        #ifdef GL_OES_standard_derivatives
            #extension GL_OES_standard_derivatives : require
            #define sc_CanUseStandardDerivatives 1
        #endif
    #endif
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
#endif
#ifdef GL_ES
    #ifdef sc_FramebufferFetch
        #if defined(GL_EXT_shader_framebuffer_fetch)
            #extension GL_EXT_shader_framebuffer_fetch : require
        #elif defined(GL_ARM_shader_framebuffer_fetch)
            #extension GL_ARM_shader_framebuffer_fetch : require
        #else
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #endif
    #ifdef GL_FRAGMENT_PRECISION_HIGH
        #define sc_FragmentPrecision highp
    #else
        #define sc_FragmentPrecision mediump
    #endif
    #ifdef FRAGMENT_SHADER
        precision highp int;
        precision highp float;
    #endif
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableMultiviewStereoRendering
        layout(num_views=sc_NumStereoViews) in;
    #endif
#endif
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
    #if __VERSION__==100||defined(SCC_VALIDATION)
        #define sampler2DArray vec2
        #define sampler3D vec3
        #define samplerCube vec4
        vec4 texture3D(vec3 s,vec3 uv)                       { return vec4(0.0); }
        vec4 texture3D(vec3 s,vec3 uv,float bias)           { return vec4(0.0); }
        vec4 texture3DLod(vec3 s,vec3 uv,float bias)        { return vec4(0.0); }
        vec4 texture3DLodEXT(vec3 s,vec3 uv,float lod)      { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv)                  { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv,float bias)      { return vec4(0.0); }
        vec4 texture2DArrayLod(vec2 s,vec3 uv,float lod)    { return vec4(0.0); }
        vec4 texture2DArrayLodEXT(vec2 s,vec3 uv,float lod) { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv)                     { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv,float lod)          { return vec4(0.0); }
        vec4 textureCubeLod(vec4 s,vec3 uv,float lod)       { return vec4(0.0); }
        vec4 textureCubeLodEXT(vec4 s,vec3 uv,float lod)    { return vec4(0.0); }
        #if defined(VERTEX_SHADER)||!sc_CanUseTextureLod
            #define texture2DLod(s,uv,lod)      vec4(0.0)
            #define texture2DLodEXT(s,uv,lod)   vec4(0.0)
        #endif
    #elif __VERSION__>=300
        #define texture3D texture
        #define textureCube texture
        #define texture2DArray texture
        #define texture2DLod textureLod
        #define texture3DLod textureLod
        #define texture2DLodEXT textureLod
        #define texture3DLodEXT textureLod
        #define textureCubeLod textureLod
        #define textureCubeLodEXT textureLod
        #define texture2DArrayLod textureLod
        #define texture2DArrayLodEXT textureLod
    #endif
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
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
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
bool Dead;
vec4 Quaternion;
float SpawnIndex;
float SpawnIndexRemainder;
float NextBurstTime;
float SpawnOffset;
float Seed;
vec2 Seed2000;
float TimeShift;
int Index1D;
int Index1DPerCopy;
float Index1DPerCopyF;
int StateID;
float Coord1D;
float Ratio1D;
float Ratio1DPerCopy;
ivec2 Index2D;
vec2 Coord2D;
vec2 Ratio2D;
vec3 Force;
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
#ifndef sc_CanUseTextureLod
#define sc_CanUseTextureLod 0
#elif sc_CanUseTextureLod==1
#undef sc_CanUseTextureLod
#define sc_CanUseTextureLod 1
#endif
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
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
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed[32];
uniform vec4 sc_Time;
uniform int vfxOffsetInstancesRead;
uniform int vfxTargetWidth;
uniform vec2 vfxTargetSizeRead;
uniform bool vfxBatchEnable[32];
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
uniform float Port_Input1_N292;
uniform vec3 Port_Min_N293;
uniform vec3 Port_Max_N293;
uniform float Port_Import_N296;
uniform float Port_Input1_N298;
uniform vec3 Port_Max_N299;
uniform float Port_Input1_N021;
uniform vec3 Port_Import_N304;
uniform float Port_Input1_N319;
uniform float Port_Input1_N322;
uniform float Port_Import_N058;
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
uniform float Port_Input1_N241;
uniform float Port_Input1_N063;
uniform float Port_Input2_N063;
uniform vec3 vfxLocalAabbMax;
uniform vec3 vfxLocalAabbMin;
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
uniform float overrideTimeDelta;
uniform vec3 Port_Import_N081;
uniform float Port_RangeMinA_N178;
uniform float Port_RangeMaxA_N178;
uniform float Port_RangeMinB_N178;
uniform float Port_RangeMaxB_N178;
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
uniform vec2 vfxTargetSizeWrite;
uniform int vfxOffsetInstancesWrite;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
uniform sampler3D noiseTex;
varying float varClipDistance;
varying float varStereoViewID;
attribute vec4 position;
attribute vec2 texture0;
attribute vec2 texture1;
varying vec3 varPos;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying float Interp_Particle_Index;
varying vec2 Interp_Particle_Coord;
varying vec3 Interp_Particle_Force;
varying float Interp_Particle_SpawnIndex;
varying float Interp_Particle_NextBurstTime;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Size;
varying vec4 Interp_Particle_Color;
varying vec4 Interp_Particle_Quaternion;
varying float Interp_Particle_Mass;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec2 varShadowTex;
attribute vec3 normal;
attribute vec4 tangent;
varying vec4 varColor;
ssParticle gParticle;
int sc_GetLocalInstanceID()
{
#ifdef sc_LocalInstanceID
    return sc_LocalInstanceID;
#else
    return 0;
#endif
}
void ssCalculateParticleSeed(inout ssParticle Particle,int copyId)
{
float l9_0;
if (overrideTimeEnabled==1)
{
l9_0=overrideTimeElapsed[copyId];
}
else
{
l9_0=sc_Time.x;
}
Particle.Seed=(Particle.Ratio1D*0.97637898)+0.151235;
Particle.Seed+=(floor(((((l9_0-Particle.SpawnOffset)-0.0)+0.0)+16.0)/8.0)*4.32723);
Particle.Seed=fract(abs(Particle.Seed));
Particle.Seed2000=(vec2(ivec2(Particle.Index1D%400,Particle.Index1D/400))+vec2(1.0))/vec2(399.0);
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=sc_StereoViewID;
}
#endif
return l9_0;
}
int renderTarget0GetStereoViewIndex()
{
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
return l9_0;
}
vec3 sc_SamplingCoordsViewToGlobal(vec2 uv,int renderingLayout,int viewIndex)
{
vec3 l9_0;
if (renderingLayout==0)
{
l9_0=vec3(uv,0.0);
}
else
{
vec3 l9_1;
if (renderingLayout==1)
{
l9_1=vec3(uv.x,(uv.y*0.5)+(0.5-(float(viewIndex)*0.5)),0.0);
}
else
{
l9_1=vec3(uv,float(viewIndex));
}
l9_0=l9_1;
}
return l9_0;
}
vec4 renderTarget0SampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
float l9_1=level_;
vec3 l9_2=sc_SamplingCoordsViewToGlobal(uv,renderTarget0Layout,viewIndex);
vec4 l9_3;
#if (sc_CanUseTextureLod)
{
l9_3=texture2DLod(renderTarget0,l9_2.xy,l9_1);
}
#else
{
l9_3=vec4(0.0);
}
#endif
l9_0=l9_3;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec4 renderTarget0SampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=renderTarget0SampleViewIndexLevel(uv,viewIndex,bias);
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
int renderTarget1GetStereoViewIndex()
{
int l9_0;
#if (renderTarget1HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
vec4 renderTarget1SampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
float l9_1=level_;
vec3 l9_2=sc_SamplingCoordsViewToGlobal(uv,renderTarget1Layout,viewIndex);
vec4 l9_3;
#if (sc_CanUseTextureLod)
{
l9_3=texture2DLod(renderTarget1,l9_2.xy,l9_1);
}
#else
{
l9_3=vec4(0.0);
}
#endif
l9_0=l9_3;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec4 renderTarget1SampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=renderTarget1SampleViewIndexLevel(uv,viewIndex,bias);
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
int renderTarget2GetStereoViewIndex()
{
int l9_0;
#if (renderTarget2HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
vec4 renderTarget2SampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
float l9_1=level_;
vec3 l9_2=sc_SamplingCoordsViewToGlobal(uv,renderTarget2Layout,viewIndex);
vec4 l9_3;
#if (sc_CanUseTextureLod)
{
l9_3=texture2DLod(renderTarget2,l9_2.xy,l9_1);
}
#else
{
l9_3=vec4(0.0);
}
#endif
l9_0=l9_3;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec4 renderTarget2SampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=renderTarget2SampleViewIndexLevel(uv,viewIndex,bias);
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
int renderTarget3GetStereoViewIndex()
{
int l9_0;
#if (renderTarget3HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
vec4 renderTarget3SampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
float l9_1=level_;
vec3 l9_2=sc_SamplingCoordsViewToGlobal(uv,renderTarget3Layout,viewIndex);
vec4 l9_3;
#if (sc_CanUseTextureLod)
{
l9_3=texture2DLod(renderTarget3,l9_2.xy,l9_1);
}
#else
{
l9_3=vec4(0.0);
}
#endif
l9_0=l9_3;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec4 renderTarget3SampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=renderTarget3SampleViewIndexLevel(uv,viewIndex,bias);
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
float DecodeFloat32(vec4 rgba,bool Quantize)
{
if (Quantize)
{
rgba=floor((rgba*255.0)+vec4(0.5))/vec4(255.0);
}
return dot(rgba,vec4(1.0,0.0039215689,1.53787e-05,6.0308629e-08));
}
float DecodeFloat16(vec2 rg,bool Quantize)
{
if (Quantize)
{
rg=floor((rg*255.0)+vec2(0.5))/vec2(255.0);
}
return dot(rg,vec2(1.0,0.0039215689));
}
bool ssDecodeParticle(int InstanceID)
{
gParticle.Position=vec3(0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(0.0);
gParticle.Size=0.0;
gParticle.Age=0.0;
gParticle.Life=0.0;
gParticle.Mass=1.0;
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
gParticle.Quaternion=vec4(0.0,0.0,0.0,1.0);
gParticle.CopyId=float(InstanceID/1600);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int l9_0=InstanceID/1600;
int l9_1=InstanceID%1600;
float l9_2=float(l9_1);
ivec2 l9_3=ivec2(InstanceID%512,InstanceID/512);
float l9_4=float(InstanceID);
vec2 l9_5=vec2(l9_3);
float l9_6=l9_4/1599.0;
ssParticle l9_7=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,l9_6*8.0,0.0,gParticle.Seed2000,float(((InstanceID*((InstanceID*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,InstanceID,l9_1,l9_2,(1600*(l9_0+1))-1,(l9_4+0.5)/1600.0,l9_6,l9_2/1599.0,l9_3,(l9_5+vec2(0.5))/vec2(512.0,4.0),l9_5/vec2(511.0,3.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
ssCalculateParticleSeed(l9_7,l9_0);
gParticle=l9_7;
int l9_8=InstanceID;
int l9_9=(vfxOffsetInstancesRead+l9_8)*4;
int l9_10=l9_9/vfxTargetWidth;
vec2 l9_11=(vec2(ivec2(l9_9-(l9_10*vfxTargetWidth),l9_10))+vec2(0.5))/vec2(2048.0,vfxTargetSizeRead.y);
vec2 l9_12=l9_11+vec2(0.0);
vec4 l9_13=renderTarget0SampleViewIndexBias(l9_12,renderTarget0GetStereoViewIndex(),0.0);
bool l9_14=dot(abs(l9_13),vec4(1.0))<9.9999997e-06;
bool l9_15;
if (!l9_14)
{
l9_15=!vfxBatchEnable[sc_GetLocalInstanceID()/1600];
}
else
{
l9_15=l9_14;
}
if (l9_15)
{
return false;
}
float l9_16=1000.0-(-1000.0);
float l9_17=0.99998999-0.0;
gParticle.Position.x=(-1000.0)+(((DecodeFloat32(l9_13,true)-0.0)*l9_16)/l9_17);
gParticle.Position.y=(-1000.0)+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_12,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*l9_16)/l9_17);
gParticle.Position.z=(-1000.0)+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_12,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_16)/l9_17);
gParticle.Velocity.x=(-1000.0)+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_12,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_16)/l9_17);
vec2 l9_18=l9_11+vec2(0.00048828125,0.0);
gParticle.Velocity.y=(-1000.0)+(((DecodeFloat32(renderTarget0SampleViewIndexBias(l9_18,renderTarget0GetStereoViewIndex(),0.0),true)-0.0)*l9_16)/l9_17);
gParticle.Velocity.z=(-1000.0)+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_18,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*l9_16)/l9_17);
float l9_19=8.0-0.0;
gParticle.Life=0.0+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_18,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_19)/l9_17);
gParticle.Age=0.0+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_18,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_19)/l9_17);
vec2 l9_20=l9_11+vec2(0.0009765625,0.0);
gParticle.Size=0.0+(((DecodeFloat32(renderTarget0SampleViewIndexBias(l9_20,renderTarget0GetStereoViewIndex(),0.0),true)-0.0)*(100.0-0.0))/l9_17);
float l9_21=1.00001-0.0;
gParticle.Color.x=0.0+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_20,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_17);
gParticle.Color.y=0.0+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_20,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_17);
gParticle.Color.z=0.0+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_20,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_17);
vec2 l9_22=l9_11+vec2(0.0014648438,0.0);
vec4 l9_23=renderTarget2SampleViewIndexBias(l9_22,renderTarget2GetStereoViewIndex(),0.0);
vec4 l9_24=renderTarget3SampleViewIndexBias(l9_22,renderTarget3GetStereoViewIndex(),0.0);
gParticle.Color.w=0.0+(((DecodeFloat32(renderTarget0SampleViewIndexBias(l9_22,renderTarget0GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_17);
gParticle.Mass=0.0+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_22,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*(1000.0-0.0))/l9_17);
float l9_25=1.0-(-1.0);
gParticle.Quaternion.x=(-1.0)+(((DecodeFloat16(vec2(l9_23.xy),true)-0.0)*l9_25)/l9_17);
gParticle.Quaternion.y=(-1.0)+(((DecodeFloat16(vec2(l9_23.zw),true)-0.0)*l9_25)/l9_17);
gParticle.Quaternion.z=(-1.0)+(((DecodeFloat16(vec2(l9_24.xy),true)-0.0)*l9_25)/l9_17);
gParticle.Quaternion.w=(-1.0)+(((DecodeFloat16(vec2(l9_24.zw),true)-0.0)*l9_25)/l9_17);
vec4 l9_26=normalize(gParticle.Quaternion.yzwx);
float l9_27=l9_26.x;
float l9_28=l9_27*l9_27;
float l9_29=l9_26.y;
float l9_30=l9_29*l9_29;
float l9_31=l9_26.z;
float l9_32=l9_31*l9_31;
float l9_33=l9_27*l9_31;
float l9_34=l9_27*l9_29;
float l9_35=l9_29*l9_31;
float l9_36=l9_26.w;
float l9_37=l9_36*l9_27;
float l9_38=l9_36*l9_29;
float l9_39=l9_36*l9_31;
gParticle.Matrix=mat3(vec3(1.0-(2.0*(l9_30+l9_32)),2.0*(l9_34+l9_39),2.0*(l9_33-l9_38)),vec3(2.0*(l9_34-l9_39),1.0-(2.0*(l9_28+l9_32)),2.0*(l9_35+l9_37)),vec3(2.0*(l9_33+l9_38),2.0*(l9_35-l9_37),1.0-(2.0*(l9_28+l9_30))));
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+vec3(0.5))*0.00050000002;
gParticle.Position=floor((gParticle.Position*2000.0)+vec3(0.5))*0.00050000002;
gParticle.Color=floor((gParticle.Color*2000.0)+vec4(0.5))*0.00050000002;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.00050000002;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.00050000002;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.00050000002;
return true;
}
void Node52_Fluctuate(float TimeBias,float ValueA,float TimeA,float TimeTransition,float ValueB,float TimeB,out float Value,ssGlobals Globals)
{
float l9_0=((TimeA+TimeTransition)+TimeB)+9.9999997e-05;
Value=mix(ValueA,ValueB,smoothstep(TimeA/l9_0,1.0-(TimeB/l9_0),abs((mod((Globals.gTimeElapsedShifted/l9_0)+TimeBias,1.0)*2.0)-1.0)));
}
void Node148_Conditional(float Input0,vec3 Input1,vec3 Input2,out vec3 Output,ssGlobals Globals)
{
Input0=float(isIdle);
if ((Input0*1.0)!=0.0)
{
float param_6;
Node52_Fluctuate(Port_TimeBias_N052,Port_ValueA_N052,Port_TimeA_N052,Port_TimeTransition_N052,Port_ValueB_N052,Port_TimeB_N052,param_6,Globals);
float l9_0=param_6*Port_Input1_N053;
Input1=vec3(l9_0,l9_0,0.0);
Output=Input1;
}
else
{
Input2=influencePosition;
Output=Input2;
}
}
vec4 ssRandVec4(int seed)
{
return vec4(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*7177)*((seed*1969894119)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*18919)*((seed*2066534441)+101146501))+1559861749)&2147483647)*4.6566129e-10);
}
vec3 ssRandVec3(int seed)
{
return vec3(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*7177)*((seed*1969894119)+101146501))+1559861749)&2147483647)*4.6566129e-10);
}
vec2 ssRandVec2(int seed)
{
return vec2(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.6566129e-10);
}
vec4 ssGetParticleRandom(int Dimension,bool UseTime,bool UseNodeID,bool UseParticleID,float NodeID,ssParticle Particle,float ExtraSeed,float Time)
{
vec4 l9_0;
if (UseTime)
{
vec4 l9_1=vec4(0.0);
l9_1.x=floor(fract(Time)*1000.0);
l9_0=l9_1;
}
else
{
l9_0=vec4(0.0);
}
vec4 l9_2;
if (UseParticleID)
{
vec4 l9_3=l9_0;
l9_3.y=float(Particle.Index1D^((Particle.Index1D*15299)+Particle.Index1D));
l9_2=l9_3;
}
else
{
l9_2=l9_0;
}
vec4 l9_4;
if (UseNodeID)
{
vec4 l9_5=l9_2;
l9_5.z=NodeID;
l9_4=l9_5;
}
else
{
l9_4=l9_2;
}
float l9_6=ExtraSeed;
int l9_7=(((int(l9_4.x)*15299)^(int(l9_4.y)*30133))^(int(l9_4.z)*17539))^(int(l9_6*1000.0)*12113);
vec4 l9_8;
if (Dimension==1)
{
vec4 l9_9=vec4(0.0);
l9_9.x=float(((l9_7*((l9_7*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10;
l9_8=l9_9;
}
else
{
vec4 l9_10;
if (Dimension==2)
{
vec2 l9_11=ssRandVec2(l9_7);
l9_10=vec4(l9_11.x,l9_11.y,vec4(0.0).z,vec4(0.0).w);
}
else
{
vec4 l9_12;
if (Dimension==3)
{
vec3 l9_13=ssRandVec3(l9_7);
l9_12=vec4(l9_13.x,l9_13.y,l9_13.z,vec4(0.0).w);
}
else
{
l9_12=ssRandVec4(l9_7);
}
l9_10=l9_12;
}
l9_8=l9_10;
}
return l9_8;
}
void Node293_Particle_Random(vec3 Min,vec3 Max,out vec3 Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(3,true,true,true,293.0,gParticle,0.0,Globals.gTimeElapsed).xyz);
}
void Node299_Particle_Random(vec3 Min,vec3 Max,out vec3 Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(3,true,true,true,299.0,gParticle,0.0,Globals.gTimeElapsed).xyz);
}
void Node67_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if ((Input0*1.0)!=0.0)
{
Output=Input1;
}
else
{
Output=Input2;
}
}
void Node21_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
Input0=float(isIdle);
if ((Input0*1.0)!=0.0)
{
Output=Input1;
}
else
{
float param_3;
Node67_Conditional(1.0,Port_Input1_N067,Port_Input2_N067,param_3,Globals);
Input2=param_3;
Output=Input2;
}
}
void sc_SetClipDistancePlatform(float dstClipDistance)
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
        gl_ClipDistance[0]=dstClipDistance;
    #endif
}
void sc_SetClipDistance(float dstClipDistance)
{
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(dstClipDistance);
}
#else
{
varClipDistance=dstClipDistance;
}
#endif
}
void sc_SetClipDistance(vec4 clipPosition)
{
#if (sc_StereoRenderingMode==1)
{
sc_SetClipDistance(dot(clipPosition,sc_StereoClipPlanes[sc_StereoViewID]));
}
#endif
}
void sc_SetClipPosition(vec4 clipPosition)
{
#if (sc_ShaderCacheConstant!=0)
{
clipPosition.x+=(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
}
void Node200_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if ((Input0*1.0)!=0.0)
{
Output=Input1;
}
else
{
Output=Input2;
}
}
void Node241_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
Input0=float(isIdle);
if ((Input0*1.0)!=0.0)
{
Output=Input1;
}
else
{
float param_3;
Node200_Conditional(1.0,Port_Input1_N200,Port_Input2_N200,param_3,Globals);
Input2=param_3;
Output=Input2;
}
}
void Node63_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if ((Input0*1.0)!=0.0)
{
Output=Input1;
}
else
{
Output=Input2;
}
}
vec4 matrixToQuaternion(mat3 m)
{
float l9_0=m[0].x;
float l9_1=m[1].y;
float l9_2=m[2].z;
float l9_3=(l9_0-l9_1)-l9_2;
float l9_4=m[1].y;
float l9_5=m[0].x;
float l9_6=m[2].z;
float l9_7=(l9_4-l9_5)-l9_6;
float l9_8=m[2].z;
float l9_9=m[0].x;
float l9_10=m[1].y;
float l9_11=(l9_8-l9_9)-l9_10;
float l9_12=m[0].x;
float l9_13=m[1].y;
float l9_14=m[2].z;
float l9_15=(l9_12+l9_13)+l9_14;
float l9_16;
int l9_17;
if (l9_3>l9_15)
{
l9_17=1;
l9_16=l9_3;
}
else
{
l9_17=0;
l9_16=l9_15;
}
float l9_18;
int l9_19;
if (l9_7>l9_16)
{
l9_19=2;
l9_18=l9_7;
}
else
{
l9_19=l9_17;
l9_18=l9_16;
}
float l9_20;
int l9_21;
if (l9_11>l9_18)
{
l9_21=3;
l9_20=l9_11;
}
else
{
l9_21=l9_19;
l9_20=l9_18;
}
float l9_22=l9_20+1.0;
float l9_23=sqrt(l9_22)*0.5;
float l9_24=0.25/l9_23;
if (l9_21==0)
{
return vec4(l9_23,(m[1].z-m[2].y)*l9_24,(m[2].x-m[0].z)*l9_24,(m[0].y-m[1].x)*l9_24);
}
else
{
if (l9_21==1)
{
return vec4((m[1].z-m[2].y)*l9_24,l9_23,(m[0].y+m[1].x)*l9_24,(m[2].x+m[0].z)*l9_24);
}
else
{
if (l9_21==2)
{
return vec4((m[2].x-m[0].z)*l9_24,(m[0].y+m[1].x)*l9_24,l9_23,(m[1].z+m[2].y)*l9_24);
}
else
{
if (l9_21==3)
{
return vec4((m[0].y-m[1].x)*l9_24,(m[2].x+m[0].z)*l9_24,(m[1].z+m[2].y)*l9_24,l9_23);
}
else
{
return vec4(1.0,0.0,0.0,0.0);
}
}
}
}
}
void main()
{
bool l9_0=ssDecodeParticle(sc_GetLocalInstanceID());
int l9_1=sc_GetLocalInstanceID()/1600;
float l9_2=min(overrideTimeDelta,0.5);
float l9_3=gParticle.TimeShift;
float l9_4=(sc_Time.x-(l9_3*l9_2))-0.0;
gParticle.Age=mod((l9_4-gParticle.SpawnOffset)+0.0,8.0);
float l9_5=gParticle.SpawnOffset;
bool l9_6=(sc_Time.x-l9_5)<(0.0-0.0);
bool l9_7;
if (!l9_6)
{
l9_7=gParticle.Age>8.0;
}
else
{
l9_7=l9_6;
}
bool l9_8=l9_7 ? true : false;
bool l9_9=!l9_8;
bool l9_10;
if (l9_9)
{
l9_10=gParticle.Life<=9.9999997e-05;
}
else
{
l9_10=l9_9;
}
bool l9_11;
if (!l9_10)
{
l9_11=mod(((max(sc_Time.x,0.1)-gParticle.SpawnOffset)-0.0)+0.0,8.0)<=l9_2;
}
else
{
l9_11=l9_10;
}
if (l9_11)
{
if (l9_2!=0.0)
{
ssGlobals l9_12=ssGlobals(sc_Time.x,l9_2,l9_4,overrideTimeElapsed[l9_1]);
ssCalculateParticleSeed(gParticle,int(gParticle.CopyId));
float l9_14=floor(40.0);
gParticle.Position=(vec3(((floor(mod(gParticle.Index1DPerCopyF,l9_14))/40.0)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/l9_14)/40.0)*2.0)-1.0,0.0)*20.0)+vec3(1.0,1.0,0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(1.0);
gParticle.Age=0.0;
gParticle.Life=8.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
gParticle.Quaternion=vec4(0.0,0.0,0.0,1.0);
vec3 l9_15;
Node148_Conditional(1.0,vec3(0.0),vec3(0.0),l9_15,l9_12);
vec3 l9_16=l9_15;
float l9_17;
if ((float(0.0==Port_Input1_N292)*1.0)!=0.0)
{
vec3 l9_18;
Node293_Particle_Random(Port_Min_N293,Port_Max_N293,l9_18,l9_12);
vec3 l9_19=l9_18;
float l9_20=1.0-clamp(Port_Import_N296,0.0,1.0);
float l9_21;
if (l9_20<=0.0)
{
l9_21=0.0;
}
else
{
l9_21=pow(l9_20,Port_Input1_N298);
}
vec3 l9_22;
Node299_Particle_Random(vec3(l9_21),Port_Max_N299,l9_22,l9_12);
vec3 l9_23=l9_22;
float l9_24;
if (l9_23.x<=0.0)
{
l9_24=0.0;
}
else
{
l9_24=sqrt(l9_23.x);
}
float l9_25;
if (l9_24<=0.0)
{
l9_25=0.0;
}
else
{
l9_25=sqrt(l9_24);
}
float l9_26;
Node21_Conditional(1.0,Port_Input1_N021,10.0,l9_26,l9_12);
l9_17=abs(((((l9_19/(vec3(length(l9_19))+vec3(1.234e-06)))*vec3(l9_25,0.0,0.0))*vec3(l9_26))*Port_Import_N304).x);
}
else
{
vec3 l9_27;
Node293_Particle_Random(Port_Min_N293,Port_Max_N293,l9_27,l9_12);
vec3 l9_28=l9_27;
float l9_29=1.0-clamp(Port_Import_N296,0.0,1.0);
float l9_30;
if (l9_29<=0.0)
{
l9_30=0.0;
}
else
{
l9_30=pow(l9_29,Port_Input1_N298);
}
vec3 l9_31;
Node299_Particle_Random(vec3(l9_30),Port_Max_N299,l9_31,l9_12);
vec3 l9_32=l9_31;
float l9_33;
if (l9_32.x<=0.0)
{
l9_33=0.0;
}
else
{
l9_33=sqrt(l9_32.x);
}
float l9_34;
if (l9_33<=0.0)
{
l9_34=0.0;
}
else
{
l9_34=sqrt(l9_33);
}
float l9_35;
Node21_Conditional(1.0,Port_Input1_N021,10.0,l9_35,l9_12);
l9_17=((((l9_28/(vec3(length(l9_28))+vec3(1.234e-06)))*vec3(l9_34,0.0,0.0))*vec3(l9_35))*Port_Import_N304).x;
}
float l9_36;
if ((float(0.0==Port_Input1_N319)*1.0)!=0.0)
{
vec3 l9_37;
Node293_Particle_Random(Port_Min_N293,Port_Max_N293,l9_37,l9_12);
vec3 l9_38=l9_37;
float l9_39=1.0-clamp(Port_Import_N296,0.0,1.0);
float l9_40;
if (l9_39<=0.0)
{
l9_40=0.0;
}
else
{
l9_40=pow(l9_39,Port_Input1_N298);
}
vec3 l9_41;
Node299_Particle_Random(vec3(l9_40),Port_Max_N299,l9_41,l9_12);
vec3 l9_42=l9_41;
float l9_43;
if (l9_42.y<=0.0)
{
l9_43=0.0;
}
else
{
l9_43=sqrt(l9_42.y);
}
float l9_44;
if (l9_43<=0.0)
{
l9_44=0.0;
}
else
{
l9_44=sqrt(l9_43);
}
float l9_45;
Node21_Conditional(1.0,Port_Input1_N021,10.0,l9_45,l9_12);
l9_36=abs(((((l9_38/(vec3(length(l9_38))+vec3(1.234e-06)))*vec3(0.0,l9_44,0.0))*vec3(l9_45))*Port_Import_N304).y);
}
else
{
vec3 l9_46;
Node293_Particle_Random(Port_Min_N293,Port_Max_N293,l9_46,l9_12);
vec3 l9_47=l9_46;
float l9_48=1.0-clamp(Port_Import_N296,0.0,1.0);
float l9_49;
if (l9_48<=0.0)
{
l9_49=0.0;
}
else
{
l9_49=pow(l9_48,Port_Input1_N298);
}
vec3 l9_50;
Node299_Particle_Random(vec3(l9_49),Port_Max_N299,l9_50,l9_12);
vec3 l9_51=l9_50;
float l9_52;
if (l9_51.y<=0.0)
{
l9_52=0.0;
}
else
{
l9_52=sqrt(l9_51.y);
}
float l9_53;
if (l9_52<=0.0)
{
l9_53=0.0;
}
else
{
l9_53=sqrt(l9_52);
}
float l9_54;
Node21_Conditional(1.0,Port_Input1_N021,10.0,l9_54,l9_12);
l9_36=((((l9_47/(vec3(length(l9_47))+vec3(1.234e-06)))*vec3(0.0,l9_53,0.0))*vec3(l9_54))*Port_Import_N304).y;
}
float l9_55;
if ((float(0.0==Port_Input1_N322)*1.0)!=0.0)
{
vec3 l9_56;
Node293_Particle_Random(Port_Min_N293,Port_Max_N293,l9_56,l9_12);
vec3 l9_57=l9_56;
float l9_58=1.0-clamp(Port_Import_N296,0.0,1.0);
float l9_59;
if (l9_58<=0.0)
{
l9_59=0.0;
}
else
{
l9_59=pow(l9_58,Port_Input1_N298);
}
vec3 l9_60;
Node299_Particle_Random(vec3(l9_59),Port_Max_N299,l9_60,l9_12);
vec3 l9_61=l9_60;
float l9_62;
if (l9_61.z<=0.0)
{
l9_62=0.0;
}
else
{
l9_62=sqrt(l9_61.z);
}
float l9_63;
if (l9_62<=0.0)
{
l9_63=0.0;
}
else
{
l9_63=sqrt(l9_62);
}
float l9_64;
Node21_Conditional(1.0,Port_Input1_N021,10.0,l9_64,l9_12);
l9_55=abs(((((l9_57/(vec3(length(l9_57))+vec3(1.234e-06)))*vec3(0.0,0.0,l9_63))*vec3(l9_64))*Port_Import_N304).z);
}
else
{
vec3 l9_65;
Node293_Particle_Random(Port_Min_N293,Port_Max_N293,l9_65,l9_12);
vec3 l9_66=l9_65;
float l9_67=1.0-clamp(Port_Import_N296,0.0,1.0);
float l9_68;
if (l9_67<=0.0)
{
l9_68=0.0;
}
else
{
l9_68=pow(l9_67,Port_Input1_N298);
}
vec3 l9_69;
Node299_Particle_Random(vec3(l9_68),Port_Max_N299,l9_69,l9_12);
vec3 l9_70=l9_69;
float l9_71;
if (l9_70.z<=0.0)
{
l9_71=0.0;
}
else
{
l9_71=sqrt(l9_70.z);
}
float l9_72;
if (l9_71<=0.0)
{
l9_72=0.0;
}
else
{
l9_72=sqrt(l9_71);
}
float l9_73;
Node21_Conditional(1.0,Port_Input1_N021,10.0,l9_73,l9_12);
l9_55=((((l9_66/(vec3(length(l9_66))+vec3(1.234e-06)))*vec3(0.0,0.0,l9_72))*vec3(l9_73))*Port_Import_N304).z;
}
gParticle.Position=l9_16+vec3(l9_17,l9_36,l9_55);
gParticle.Velocity+=mix(Port_Import_N075,Port_Import_N076,ssGetParticleRandom(3,true,true,true,77.0,gParticle,0.0,sc_Time.x).xyz);
vec3 l9_74;
if ((float(isIdle)*1.0)!=0.0)
{
vec3 l9_75;
Node148_Conditional(1.0,vec3(0.0),vec3(0.0),l9_75,l9_12);
vec3 l9_76=l9_75;
vec3 l9_77=gParticle.Position;
vec3 l9_78=l9_76-l9_77;
float l9_79=dot(l9_78,l9_78);
float l9_80;
if (l9_79>0.0)
{
l9_80=1.0/sqrt(l9_79);
}
else
{
l9_80=0.0;
}
l9_74=vec3(Port_Import_N058)*(l9_78*l9_80);
}
else
{
l9_74=Port_Input2_N060;
}
gParticle.Force+=l9_74;
gParticle.Mass=mix(Port_Import_N099,Port_Import_N109,ssGetParticleRandom(1,true,true,true,110.0,gParticle,0.0,sc_Time.x).x);
gParticle.Mass=max(9.9999997e-06,gParticle.Mass);
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*0.033330001);
gParticle.Force=vec3(0.0);
gParticle.Spawned=true;
}
}
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
float l9_81=float(isAttracting);
float l9_82=dot(Port_Import_N081,Port_Import_N081);
float l9_83;
if (l9_82>0.0)
{
l9_83=1.0/sqrt(l9_82);
}
else
{
l9_83=0.0;
}
vec3 l9_84=Port_Import_N081*l9_83;
float l9_85=l9_84.x;
float l9_86=l9_84.y;
float l9_87=l9_84.z;
vec3 l9_88=gParticle.Position;
float l9_89=(((length(l9_88)-Port_RangeMinA_N178)/((Port_RangeMaxA_N178-Port_RangeMinA_N178)+1e-06))*(Port_RangeMaxB_N178-Port_RangeMinB_N178))+Port_RangeMinB_N178;
float l9_90;
if (Port_RangeMaxB_N178>Port_RangeMinB_N178)
{
l9_90=clamp(l9_89,Port_RangeMinB_N178,Port_RangeMaxB_N178);
}
else
{
l9_90=clamp(l9_89,Port_RangeMaxB_N178,Port_RangeMinB_N178);
}
float l9_91=cos(l9_90);
float l9_92=1.0-l9_91;
float l9_93=(l9_85*l9_86)*l9_92;
float l9_94=sin(l9_90);
float l9_95=l9_87*l9_94;
float l9_96=(l9_87*l9_85)*l9_92;
float l9_97=l9_86*l9_94;
float l9_98=(l9_86*l9_87)*l9_92;
float l9_99=l9_85*l9_94;
float l9_100=gParticle.Age;
float l9_101=gParticle.Life;
bool l9_102=(float(isIdle)*1.0)!=0.0;
float l9_103;
if (l9_102)
{
l9_103=Port_Input1_N114;
}
else
{
l9_103=Port_Input2_N114;
}
float l9_104=Port_RangeMaxB_N133-l9_103;
float l9_105=(((clamp(l9_100/l9_101,0.0,1.0)-Port_RangeMinA_N133)/((Port_RangeMaxA_N133-Port_RangeMinA_N133)+1e-06))*l9_104)+l9_103;
if (l9_81!=0.0)
{
gParticle.Force=((mat3(vec4(((l9_85*l9_85)*l9_92)+l9_91,l9_93-l9_95,l9_96+l9_97,0.0).xyz,vec4(l9_93+l9_95,((l9_86*l9_86)*l9_92)+l9_91,l9_98-l9_99,0.0).xyz,vec4(l9_96-l9_97,l9_98+l9_99,((l9_87*l9_87)*l9_92)+l9_91,0.0).xyz)*l9_88)-l9_88)*vec3(l9_105);
}
float l9_106;
if (l9_102)
{
l9_106=Port_Input1_N018;
}
else
{
float l9_107;
if ((l9_81*1.0)!=0.0)
{
l9_107=Port_Input1_N066;
}
else
{
l9_107=Port_Input2_N066;
}
l9_106=l9_107;
}
float l9_108=gParticle.Mass;
float l9_109=l9_106*l9_108;
ssGlobals l9_110=ssGlobals(sc_Time.x,l9_2,l9_4,overrideTimeElapsed[l9_1]);
vec3 param_5;
Node148_Conditional(1.0,vec3(0.0),vec3(0.0),param_5,l9_110);
vec3 l9_111=param_5;
vec3 l9_112=gParticle.Position;
vec3 l9_113=l9_111-l9_112;
float l9_114=dot(l9_113,l9_113);
float l9_115;
if (l9_114>0.0)
{
l9_115=1.0/sqrt(l9_114);
}
else
{
l9_115=0.0;
}
gParticle.Force+=(vec3(l9_109)*(l9_113*l9_115));
float l9_116;
if (l9_102)
{
l9_116=Port_Input1_N237;
}
else
{
float l9_117;
if ((l9_81*1.0)!=0.0)
{
l9_117=Port_Input1_N201;
}
else
{
l9_117=Port_Input2_N201;
}
l9_116=l9_117;
}
vec3 l9_118=vec3(l9_116);
vec3 l9_119=gParticle.Position;
vec4 l9_120;
#if (sc_CanUseTextureLod)
{
l9_120=texture3DLod(noiseTex,(((l9_119+Port_Import_N205)+(Port_Import_N206*vec3(l9_4*Port_Multiplier_N207)))+Port_Import_N210)*(vec3(1.0)/(Port_Import_N210*vec3(Port_Input1_N222))),0.0);
}
#else
{
l9_120=vec4(0.0);
}
#endif
gParticle.Force+=(l9_118*((l9_120*vec4(Port_Input1_N229))-vec4(1.0)).xyz);
gParticle.Force+=((((((-gParticle.Velocity)*vec3(length(gParticle.Velocity)))*vec3(Port_Import_N049))*vec3(Port_Import_N051))*vec3(Port_Import_N050))*vec3(Port_Input4_N224));
float l9_121;
if ((0.0*1.0)!=0.0)
{
float l9_122;
Node241_Conditional(1.0,Port_Input1_N241,3.0,l9_122,l9_110);
float l9_123;
Node63_Conditional(1.0,Port_Input1_N063,Port_Input2_N063,l9_123,l9_110);
l9_121=mix(l9_122,l9_123,clamp(gParticle.Age/gParticle.Life,0.0,1.0))/(length(vfxLocalAabbMax-vfxLocalAabbMin)+1.234e-06);
}
else
{
float l9_124;
Node241_Conditional(1.0,Port_Input1_N241,3.0,l9_124,l9_110);
float l9_125;
Node63_Conditional(1.0,Port_Input1_N063,Port_Input2_N063,l9_125,l9_110);
l9_121=mix(l9_124,l9_125,clamp(gParticle.Age/gParticle.Life,0.0,1.0));
}
gParticle.Size=l9_121;
vec4 l9_126;
if (l9_102)
{
l9_126=vec4(Port_Input1_N008);
}
else
{
vec4 l9_127;
if ((l9_81*1.0)!=0.0)
{
l9_127=Port_Input1_N065;
}
else
{
vec4 l9_128=ssGetParticleRandom(1,false,true,true,19.0,gParticle,0.0,sc_Time.x);
float l9_129=mix(Port_Min_N019,Port_Max_N019,l9_128.x);
vec3 l9_130=gParticle.Position;
float l9_131=clamp(clamp(((l9_129*Port_Input1_N166)+((distance(influencePosition,l9_130)*Port_Input1_N164)*l9_129))+0.001,Port_Input1_N165+0.001,Port_Input2_N165+0.001)-0.001,0.0,1.0);
vec4 l9_132;
if (l9_131<Port_Position1_N172)
{
l9_132=mix(colorA,colorB,vec4(clamp(l9_131/Port_Position1_N172,0.0,1.0)));
}
else
{
vec4 l9_133;
if (l9_131<Port_Position2_N172)
{
l9_133=mix(colorB,colorC,vec4(clamp((l9_131-Port_Position1_N172)/(Port_Position2_N172-Port_Position1_N172),0.0,1.0)));
}
else
{
vec4 l9_134;
if (l9_131<Port_Position3_N172)
{
l9_134=mix(colorC,colorD,vec4(clamp((l9_131-Port_Position2_N172)/(Port_Position3_N172-Port_Position2_N172),0.0,1.0)));
}
else
{
l9_134=mix(colorD,colorE,vec4(clamp((l9_131-Port_Position3_N172)/(1.0-Port_Position3_N172),0.0,1.0)));
}
l9_133=l9_134;
}
l9_132=l9_133;
}
l9_127=l9_132;
}
l9_126=l9_127;
}
gParticle.Color=l9_126;
vec4 l9_135=gParticle.Color;
float l9_136=gParticle.Age;
float l9_137=gParticle.Life;
float l9_138=clamp(l9_136/l9_137,0.0,1.0);
float l9_139;
if ((l9_81*1.0)!=0.0)
{
l9_139=Port_Input1_N266;
}
else
{
l9_139=Port_Input2_N266;
}
float l9_140=gParticle.Life+1.234e-06;
vec4 l9_141=vec4(l9_135.x,l9_135.y,l9_135.z,vec4(0.0).w);
l9_141.w=mix(Port_Import_N079,Port_Import_N091,(clamp((l9_138*(Port_Input0_N143/((l9_139/l9_140)+1.234e-06)))+0.001,Port_Input1_N182+0.001,Port_Input2_N182+0.001)-0.001)*(clamp(((1.0-l9_138)*(Port_Input0_N193/((Port_Import_N188/l9_140)+1.234e-06)))+0.001,Port_Input1_N236+0.001,Port_Input2_N236+0.001)-0.001));
gParticle.Color=l9_141;
gParticle.Quaternion=matrixToQuaternion(gParticle.Matrix);
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
float l9_142;
if (abs(gParticle.Force.x)<0.0049999999)
{
l9_142=0.0;
}
else
{
l9_142=gParticle.Force.x;
}
gParticle.Force.x=l9_142;
float l9_143;
if (abs(gParticle.Force.y)<0.0049999999)
{
l9_143=0.0;
}
else
{
l9_143=gParticle.Force.y;
}
gParticle.Force.y=l9_143;
float l9_144;
if (abs(gParticle.Force.z)<0.0049999999)
{
l9_144=0.0;
}
else
{
l9_144=gParticle.Force.z;
}
gParticle.Force.z=l9_144;
gParticle.Mass=max(0.0049999999,gParticle.Mass);
if (l9_2!=0.0)
{
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*l9_2);
}
float l9_145;
if (abs(gParticle.Velocity.x)<0.0049999999)
{
l9_145=0.0;
}
else
{
l9_145=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_145;
float l9_146;
if (abs(gParticle.Velocity.y)<0.0049999999)
{
l9_146=0.0;
}
else
{
l9_146=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_146;
float l9_147;
if (abs(gParticle.Velocity.z)<0.0049999999)
{
l9_147=0.0;
}
else
{
l9_147=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_147;
gParticle.Position+=(gParticle.Velocity*l9_2);
vec2 l9_148=vec2(4.0,1.0)/vec2(2048.0,vfxTargetSizeWrite.y);
int l9_149=vfxOffsetInstancesWrite+sc_GetLocalInstanceID();
float l9_150;
if (texture0.x<0.5)
{
l9_150=0.0;
}
else
{
l9_150=l9_148.x;
}
float l9_151;
if (texture0.y<0.5)
{
l9_151=0.0;
}
else
{
l9_151=l9_148.y;
}
sc_SetClipPosition(vec4(((vec2(l9_150,l9_151)+(vec2(float(l9_149%512),float(l9_149/512))*l9_148))*2.0)-vec2(1.0),1.0,1.0));
Interp_Particle_Index=float(sc_GetLocalInstanceID());
Interp_Particle_Coord=texture0;
Interp_Particle_Force=gParticle.Force;
Interp_Particle_SpawnIndex=gParticle.SpawnIndex;
Interp_Particle_NextBurstTime=gParticle.NextBurstTime;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Quaternion=gParticle.Quaternion;
Interp_Particle_Mass=gParticle.Mass;
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING 1
#ifdef isIdle
#undef isIdle
#endif
#ifdef isAttracting
#undef isAttracting
#endif
#define SC_ENABLE_INSTANCED_RENDERING
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
#ifdef VERTEX_SHADER
    #define scOutPos(clipPosition) gl_Position=clipPosition
    #define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
    #ifndef sc_EnableInstancing
        #define sc_EnableInstancing 1
    #endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
    #define sc_CanUseTextureLod 1
#else
    #ifdef FRAGMENT_SHADER
        #if defined(GL_EXT_shader_texture_lod)
            #extension GL_EXT_shader_texture_lod : require
            #define sc_CanUseTextureLod 1
            #define texture2DLod texture2DLodEXT
        #endif
    #endif
#endif
#if defined(sc_EnableMultiviewStereoRendering)
    #define sc_StereoRenderingMode sc_StereoRendering_Multiview
    #define sc_NumStereoViews 2
    #extension GL_OVR_multiview2 : require
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #define sc_LocalInstanceID sc_GlobalInstanceID
        #define sc_StereoViewID int(gl_ViewID_OVR)
    #endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
    #ifndef sc_EnableInstancing
        #error Instanced-clipped stereo rendering requires enabled instancing.
    #endif
    #ifndef sc_EnableStereoClipDistance
        #define sc_StereoRendering_IsClipDistanceEnabled 0
    #else
        #define sc_StereoRendering_IsClipDistanceEnabled 1
    #endif
    #define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
    #define sc_NumStereoClipPlanes 1
    #define sc_NumStereoViews 2
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
        #ifdef GL_ARB_draw_instanced
            #extension GL_ARB_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDARB
        #endif
        #ifdef GL_EXT_draw_instanced
            #extension GL_EXT_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDEXT
        #endif
        #ifndef sc_InstanceID
            #define sc_InstanceID gl_InstanceID
        #endif
        #ifndef sc_GlobalInstanceID
            #ifdef sc_EnableInstancingFallback
                #define sc_GlobalInstanceID (sc_FallbackInstanceID)
                #define sc_LocalInstanceID (sc_FallbackInstanceID)
            #else
                #define sc_GlobalInstanceID gl_InstanceID
                #define sc_LocalInstanceID gl_InstanceID
            #endif
        #endif
    #endif
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #ifndef sc_CanUseTextureLod
    #define sc_CanUseTextureLod 1
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef FRAGMENT_SHADER
        #ifdef GL_OES_standard_derivatives
            #extension GL_OES_standard_derivatives : require
            #define sc_CanUseStandardDerivatives 1
        #endif
    #endif
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
#endif
#ifdef GL_ES
    #ifdef sc_FramebufferFetch
        #if defined(GL_EXT_shader_framebuffer_fetch)
            #extension GL_EXT_shader_framebuffer_fetch : require
        #elif defined(GL_ARM_shader_framebuffer_fetch)
            #extension GL_ARM_shader_framebuffer_fetch : require
        #else
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #endif
    #ifdef GL_FRAGMENT_PRECISION_HIGH
        #define sc_FragmentPrecision highp
    #else
        #define sc_FragmentPrecision mediump
    #endif
    #ifdef FRAGMENT_SHADER
        precision highp int;
        precision highp float;
    #endif
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableMultiviewStereoRendering
        layout(num_views=sc_NumStereoViews) in;
    #endif
#endif
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
    #if __VERSION__==100||defined(SCC_VALIDATION)
        #define sampler2DArray vec2
        #define sampler3D vec3
        #define samplerCube vec4
        vec4 texture3D(vec3 s,vec3 uv)                       { return vec4(0.0); }
        vec4 texture3D(vec3 s,vec3 uv,float bias)           { return vec4(0.0); }
        vec4 texture3DLod(vec3 s,vec3 uv,float bias)        { return vec4(0.0); }
        vec4 texture3DLodEXT(vec3 s,vec3 uv,float lod)      { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv)                  { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv,float bias)      { return vec4(0.0); }
        vec4 texture2DArrayLod(vec2 s,vec3 uv,float lod)    { return vec4(0.0); }
        vec4 texture2DArrayLodEXT(vec2 s,vec3 uv,float lod) { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv)                     { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv,float lod)          { return vec4(0.0); }
        vec4 textureCubeLod(vec4 s,vec3 uv,float lod)       { return vec4(0.0); }
        vec4 textureCubeLodEXT(vec4 s,vec3 uv,float lod)    { return vec4(0.0); }
        #if defined(VERTEX_SHADER)||!sc_CanUseTextureLod
            #define texture2DLod(s,uv,lod)      vec4(0.0)
            #define texture2DLodEXT(s,uv,lod)   vec4(0.0)
        #endif
    #elif __VERSION__>=300
        #define texture3D texture
        #define textureCube texture
        #define texture2DArray texture
        #define texture2DLod textureLod
        #define texture3DLod textureLod
        #define texture2DLodEXT textureLod
        #define texture3DLodEXT textureLod
        #define textureCubeLod textureLod
        #define textureCubeLodEXT textureLod
        #define texture2DArrayLod textureLod
        #define texture2DArrayLodEXT textureLod
    #endif
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
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#if sc_ExporterVersion<224
#define MAIN main
#endif
    #ifndef sc_FramebufferFetch
    #define sc_FramebufferFetch 0
    #elif sc_FramebufferFetch==1
    #undef sc_FramebufferFetch
    #define sc_FramebufferFetch 1
    #endif
    #if !defined(GL_ES)&&__VERSION__<420
        #ifdef FRAGMENT_SHADER
            #define sc_FragData0 gl_FragData[0]
            #define sc_FragData1 gl_FragData[1]
            #define sc_FragData2 gl_FragData[2]
            #define sc_FragData3 gl_FragData[3]
        #endif
        mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
        #define gl_LastFragData (getFragData())
        #if sc_FramebufferFetch
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #elif defined(sc_EnableFeatureLevelES3)
        #if sc_FragDataCount>=1
            #define sc_DeclareFragData0(StorageQualifier) layout(location=0) StorageQualifier sc_FragmentPrecision vec4 sc_FragData0
        #endif
        #if sc_FragDataCount>=2
            #define sc_DeclareFragData1(StorageQualifier) layout(location=1) StorageQualifier sc_FragmentPrecision vec4 sc_FragData1
        #endif
        #if sc_FragDataCount>=3
            #define sc_DeclareFragData2(StorageQualifier) layout(location=2) StorageQualifier sc_FragmentPrecision vec4 sc_FragData2
        #endif
        #if sc_FragDataCount>=4
            #define sc_DeclareFragData3(StorageQualifier) layout(location=3) StorageQualifier sc_FragmentPrecision vec4 sc_FragData3
        #endif
        #ifndef sc_DeclareFragData0
            #define sc_DeclareFragData0(_) const vec4 sc_FragData0=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData1
            #define sc_DeclareFragData1(_) const vec4 sc_FragData1=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData2
            #define sc_DeclareFragData2(_) const vec4 sc_FragData2=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData3
            #define sc_DeclareFragData3(_) const vec4 sc_FragData3=vec4(0.0)
        #endif
        #if sc_FramebufferFetch
            #ifdef GL_EXT_shader_framebuffer_fetch
                sc_DeclareFragData0(inout);
                sc_DeclareFragData1(inout);
                sc_DeclareFragData2(inout);
                sc_DeclareFragData3(inout);
                mediump mat4 getFragData() { return mat4(sc_FragData0,sc_FragData1,sc_FragData2,sc_FragData3); }
                #define gl_LastFragData (getFragData())
            #elif defined(GL_ARM_shader_framebuffer_fetch)
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(gl_LastFragColorARM,vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #else
            #ifdef sc_EnableFeatureLevelES3
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #endif
    #elif defined(sc_EnableFeatureLevelES2)
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #else
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #endif
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
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
uniform vec4 sc_UniformConstants;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying float Interp_Particle_Index;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Size;
varying vec4 Interp_Particle_Color;
varying vec4 Interp_Particle_Quaternion;
varying float Interp_Particle_Mass;
varying float Interp_Particle_SpawnIndex;
varying float Interp_Particle_NextBurstTime;
varying vec2 Interp_Particle_Coord;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
varying vec3 Interp_Particle_Force;
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=int(varStereoViewID);
}
#endif
return l9_0;
}
vec3 sc_SamplingCoordsViewToGlobal(vec2 uv,int renderingLayout,int viewIndex)
{
vec3 l9_0;
if (renderingLayout==0)
{
l9_0=vec3(uv,0.0);
}
else
{
vec3 l9_1;
if (renderingLayout==1)
{
l9_1=vec3(uv.x,(uv.y*0.5)+(0.5-(float(viewIndex)*0.5)),0.0);
}
else
{
l9_1=vec3(uv,float(viewIndex));
}
l9_0=l9_1;
}
return l9_0;
}
vec4 ssEncodeFloat32(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,16581375.0)*(0.0+(((clamp(Value,Min,Max)-Min)*(RemapRange-0.0))/(Max-Min))));
return l9_0-(l9_0.yzww*vec4(0.0039215689,0.0039215689,0.0039215689,0.0));
}
vec2 ssEncodeFloat16(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,16581375.0)*(0.0+(((clamp(Value,Min,Max)-Min)*(RemapRange-0.0))/(Max-Min))));
return (l9_0-(l9_0.yzww*vec4(0.0039215689,0.0039215689,0.0039215689,0.0))).xy;
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
    col.x+=zero*float(cacheConst);
    sc_FragData0=col;
}
void sc_writeFragData1(vec4 col)
{
#if sc_FragDataCount>=2
    sc_FragData1=col;
#endif
}
void sc_writeFragData2(vec4 col)
{
#if sc_FragDataCount>=3
    sc_FragData2=col;
#endif
}
void sc_writeFragData3(vec4 col)
{
#if sc_FragDataCount>=4
    sc_FragData3=col;
#endif
}
void main()
{
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
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
int l9_1;
#if (renderTarget1HasSwappedViews)
{
l9_1=1-sc_GetStereoViewIndex();
}
#else
{
l9_1=sc_GetStereoViewIndex();
}
#endif
int l9_2;
#if (renderTarget2HasSwappedViews)
{
l9_2=1-sc_GetStereoViewIndex();
}
#else
{
l9_2=sc_GetStereoViewIndex();
}
#endif
int l9_3;
#if (renderTarget3HasSwappedViews)
{
l9_3=1-sc_GetStereoViewIndex();
}
#else
{
l9_3=sc_GetStereoViewIndex();
}
#endif
int l9_4=int(floor(Interp_Particle_Coord.x*4.0));
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
float l9_18;
float l9_19;
float l9_20;
if (l9_4==0)
{
vec4 l9_21=ssEncodeFloat32(Interp_Particle_Position.x,-1000.0,1000.0,0.99998999);
vec4 l9_22=ssEncodeFloat32(Interp_Particle_Position.y,-1000.0,1000.0,0.99998999);
vec4 l9_23=ssEncodeFloat32(Interp_Particle_Position.z,-1000.0,1000.0,0.99998999);
vec4 l9_24=ssEncodeFloat32(Interp_Particle_Velocity.x,-1000.0,1000.0,0.99998999);
l9_20=l9_24.w;
l9_19=l9_24.z;
l9_18=l9_24.y;
l9_17=l9_24.x;
l9_16=l9_23.w;
l9_15=l9_23.z;
l9_14=l9_23.y;
l9_13=l9_23.x;
l9_12=l9_22.w;
l9_11=l9_22.z;
l9_10=l9_22.y;
l9_9=l9_22.x;
l9_8=l9_21.w;
l9_7=l9_21.z;
l9_6=l9_21.y;
l9_5=l9_21.x;
}
else
{
float l9_25;
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
if (l9_4==1)
{
vec4 l9_41=ssEncodeFloat32(Interp_Particle_Velocity.y,-1000.0,1000.0,0.99998999);
vec4 l9_42=ssEncodeFloat32(Interp_Particle_Velocity.z,-1000.0,1000.0,0.99998999);
vec4 l9_43=ssEncodeFloat32(Interp_Particle_Life,0.0,8.0,0.99998999);
vec4 l9_44=ssEncodeFloat32(Interp_Particle_Age,0.0,8.0,0.99998999);
l9_40=l9_44.w;
l9_39=l9_44.z;
l9_38=l9_44.y;
l9_37=l9_44.x;
l9_36=l9_43.w;
l9_35=l9_43.z;
l9_34=l9_43.y;
l9_33=l9_43.x;
l9_32=l9_42.w;
l9_31=l9_42.z;
l9_30=l9_42.y;
l9_29=l9_42.x;
l9_28=l9_41.w;
l9_27=l9_41.z;
l9_26=l9_41.y;
l9_25=l9_41.x;
}
else
{
float l9_45;
float l9_46;
float l9_47;
float l9_48;
float l9_49;
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
if (l9_4==2)
{
vec4 l9_61=ssEncodeFloat32(Interp_Particle_Size,0.0,100.0,0.99998999);
vec4 l9_62=ssEncodeFloat32(Interp_Particle_Color.x,0.0,1.00001,0.99998999);
vec4 l9_63=ssEncodeFloat32(Interp_Particle_Color.y,0.0,1.00001,0.99998999);
vec4 l9_64=ssEncodeFloat32(Interp_Particle_Color.z,0.0,1.00001,0.99998999);
l9_60=l9_64.w;
l9_59=l9_64.z;
l9_58=l9_64.y;
l9_57=l9_64.x;
l9_56=l9_63.w;
l9_55=l9_63.z;
l9_54=l9_63.y;
l9_53=l9_63.x;
l9_52=l9_62.w;
l9_51=l9_62.z;
l9_50=l9_62.y;
l9_49=l9_62.x;
l9_48=l9_61.w;
l9_47=l9_61.z;
l9_46=l9_61.y;
l9_45=l9_61.x;
}
else
{
float l9_65;
float l9_66;
float l9_67;
float l9_68;
float l9_69;
float l9_70;
float l9_71;
float l9_72;
float l9_73;
float l9_74;
float l9_75;
float l9_76;
float l9_77;
float l9_78;
float l9_79;
float l9_80;
if (l9_4==3)
{
vec4 l9_81=ssEncodeFloat32(Interp_Particle_Color.w,0.0,1.00001,0.99998999);
vec4 l9_82=ssEncodeFloat32(Interp_Particle_Mass,0.0,1000.0,0.99998999);
vec2 l9_83=ssEncodeFloat16(Interp_Particle_Quaternion.x,-1.0,1.0,0.99998999);
vec2 l9_84=ssEncodeFloat16(Interp_Particle_Quaternion.y,-1.0,1.0,0.99998999);
vec2 l9_85=ssEncodeFloat16(Interp_Particle_Quaternion.z,-1.0,1.0,0.99998999);
vec2 l9_86=ssEncodeFloat16(Interp_Particle_Quaternion.w,-1.0,1.0,0.99998999);
l9_80=l9_86.y;
l9_79=l9_86.x;
l9_78=l9_85.y;
l9_77=l9_85.x;
l9_76=l9_84.y;
l9_75=l9_84.x;
l9_74=l9_83.y;
l9_73=l9_83.x;
l9_72=l9_82.w;
l9_71=l9_82.z;
l9_70=l9_82.y;
l9_69=l9_82.x;
l9_68=l9_81.w;
l9_67=l9_81.z;
l9_66=l9_81.y;
l9_65=l9_81.x;
}
else
{
l9_80=0.0;
l9_79=0.0;
l9_78=0.0;
l9_77=0.0;
l9_76=0.0;
l9_75=0.0;
l9_74=0.0;
l9_73=0.0;
l9_72=0.0;
l9_71=0.0;
l9_70=0.0;
l9_69=0.0;
l9_68=0.0;
l9_67=0.0;
l9_66=0.0;
l9_65=0.0;
}
l9_60=l9_80;
l9_59=l9_79;
l9_58=l9_78;
l9_57=l9_77;
l9_56=l9_76;
l9_55=l9_75;
l9_54=l9_74;
l9_53=l9_73;
l9_52=l9_72;
l9_51=l9_71;
l9_50=l9_70;
l9_49=l9_69;
l9_48=l9_68;
l9_47=l9_67;
l9_46=l9_66;
l9_45=l9_65;
}
l9_40=l9_60;
l9_39=l9_59;
l9_38=l9_58;
l9_37=l9_57;
l9_36=l9_56;
l9_35=l9_55;
l9_34=l9_54;
l9_33=l9_53;
l9_32=l9_52;
l9_31=l9_51;
l9_30=l9_50;
l9_29=l9_49;
l9_28=l9_48;
l9_27=l9_47;
l9_26=l9_46;
l9_25=l9_45;
}
l9_20=l9_40;
l9_19=l9_39;
l9_18=l9_38;
l9_17=l9_37;
l9_16=l9_36;
l9_15=l9_35;
l9_14=l9_34;
l9_13=l9_33;
l9_12=l9_32;
l9_11=l9_31;
l9_10=l9_30;
l9_9=l9_29;
l9_8=l9_28;
l9_7=l9_27;
l9_6=l9_26;
l9_5=l9_25;
}
vec4 l9_87=vec4(l9_5,l9_6,l9_7,l9_8);
vec4 l9_88=vec4(l9_9,l9_10,l9_11,l9_12);
vec4 l9_89=vec4(l9_13,l9_14,l9_15,l9_16);
vec4 l9_90=vec4(l9_17,l9_18,l9_19,l9_20);
vec4 l9_91;
if (dot(((l9_87+l9_88)+l9_89)+l9_90,vec4(0.23454))==0.34231836)
{
l9_91=l9_87+vec4(1e-06);
}
else
{
l9_91=l9_87;
}
sc_writeFragData0Internal(l9_91,sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(l9_88);
sc_writeFragData2(l9_89);
sc_writeFragData3(l9_90);
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
