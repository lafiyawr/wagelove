//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//sampler sampler Tweak_N104SmpSC 0:23
//sampler sampler Tweak_N10SmpSC 0:24
//sampler sampler Tweak_N8SmpSC 0:25
//sampler sampler baseTexSmpSC 0:26
//sampler sampler intensityTextureSmpSC 0:27
//sampler sampler renderTarget0SmpSC 0:28
//sampler sampler renderTarget1SmpSC 0:29
//sampler sampler renderTarget2SmpSC 0:30
//sampler sampler renderTarget3SmpSC 0:31
//sampler sampler sc_ScreenTextureSmpSC 0:36
//texture texture2D Tweak_N10 0:0:0:24
//texture texture2D Tweak_N104 0:1:0:23
//texture texture2D Tweak_N8 0:2:0:25
//texture texture2D baseTex 0:3:0:26
//texture texture2D intensityTexture 0:4:0:27
//texture texture2D renderTarget0 0:5:0:28
//texture texture2D renderTarget1 0:6:0:29
//texture texture2D renderTarget2 0:7:0:30
//texture texture2D renderTarget3 0:8:0:31
//texture texture2D sc_ScreenTexture 0:20:0:36
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR 2 0
//spec_const bool BLEND_MODE_COLOR_BURN 3 0
//spec_const bool BLEND_MODE_COLOR_DODGE 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool SC_DISABLE_FRUSTUM_CULLING 30 0
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N10 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N104 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N8 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 36 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N10 37 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N104 38 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N8 39 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 40 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 41 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N10 42 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N104 43 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N8 44 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 45 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 46 0
//spec_const bool Tweak_N104HasSwappedViews 47 0
//spec_const bool Tweak_N10HasSwappedViews 48 0
//spec_const bool Tweak_N8HasSwappedViews 49 0
//spec_const bool baseTexHasSwappedViews 50 0
//spec_const bool intensityTextureHasSwappedViews 51 0
//spec_const bool renderTarget0HasSwappedViews 52 0
//spec_const bool renderTarget1HasSwappedViews 53 0
//spec_const bool renderTarget2HasSwappedViews 54 0
//spec_const bool renderTarget3HasSwappedViews 55 0
//spec_const bool sc_BlendMode_ColoredGlass 56 0
//spec_const bool sc_BlendMode_Custom 57 0
//spec_const bool sc_BlendMode_MultiplyOriginal 58 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 59 0
//spec_const bool sc_BlendMode_Screen 60 0
//spec_const bool sc_BlendMode_Software 61 0
//spec_const bool sc_CanUseTextureLod 62 0
//spec_const bool sc_FramebufferFetch 63 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 64 0
//spec_const bool sc_IsEditor 65 0
//spec_const bool sc_MotionVectorsPass 66 0
//spec_const bool sc_RenderAlphaToColor 67 0
//spec_const bool sc_ScreenTextureHasSwappedViews 68 0
//spec_const bool sc_ShaderComplexityAnalyzer 69 0
//spec_const bool sc_UseFramebufferFetchMarker 70 0
//spec_const int SC_DEVICE_CLASS 71 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N10 72 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N104 73 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N8 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N10 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N104 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N8 79 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 80 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 81 -1
//spec_const int Tweak_N104Layout 82 0
//spec_const int Tweak_N10Layout 83 0
//spec_const int Tweak_N8Layout 84 0
//spec_const int baseTexLayout 85 0
//spec_const int intensityTextureLayout 86 0
//spec_const int renderTarget0Layout 87 0
//spec_const int renderTarget1Layout 88 0
//spec_const int renderTarget2Layout 89 0
//spec_const int renderTarget3Layout 90 0
//spec_const int sc_DepthBufferMode 91 0
//spec_const int sc_ScreenTextureLayout 92 0
//spec_const int sc_ShaderCacheConstant 93 0
//spec_const int sc_StereoRenderingMode 94 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 95 0
//spec_const int sc_StereoViewID 96 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING 1
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
float Counter_N3;
float Tap_N2;
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
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef SC_DISABLE_FRUSTUM_CULLING
#define SC_DISABLE_FRUSTUM_CULLING 0
#elif SC_DISABLE_FRUSTUM_CULLING==1
#undef SC_DISABLE_FRUSTUM_CULLING
#define SC_DISABLE_FRUSTUM_CULLING 1
#endif
#ifndef sc_DepthBufferMode
#define sc_DepthBufferMode 0
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
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform float sc_DisableFrustumCullingMarker;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed[32];
uniform vec4 sc_Time;
uniform int vfxOffsetInstancesRead;
uniform int vfxTargetWidth;
uniform vec2 vfxTargetSizeRead;
uniform bool vfxBatchEnable[32];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform int vfxNumCopies;
uniform float Port_Import_N099;
uniform vec2 Port_Import_N100;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
varying float varClipDistance;
varying float varStereoViewID;
attribute vec4 position;
attribute vec3 normal;
attribute vec4 tangent;
attribute vec2 texture0;
attribute vec2 texture1;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varPackedTex;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying float Interp_Particle_Index;
varying vec3 Interp_Particle_Force;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Size;
varying vec4 Interp_Particle_Color;
varying vec4 Interp_Particle_Quaternion;
varying float Interp_Particle_Counter_N3;
varying float Interp_Particle_Tap_N2;
varying float Interp_Particle_Mass;
varying vec2 varShadowTex;
varying vec4 varColor;
varying vec2 Interp_Particle_Coord;
varying float Interp_Particle_SpawnIndex;
varying float Interp_Particle_NextBurstTime;
varying float gParticlesDebug;
varying vec2 ParticleUV;
ssParticle gParticle;
int sc_GetLocalInstanceID()
{
#ifdef sc_LocalInstanceID
    return sc_LocalInstanceID;
#else
    return 0;
#endif
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
float DecodeFloat8(float r,bool Quantize)
{
if (Quantize)
{
r=floor((r*255.0)+0.5)/255.0;
}
return r;
}
mat3 quaternionToMatrix(vec4 q)
{
q=normalize(q.yzwx);
float l9_0=q.x*q.x;
float l9_1=q.y*q.y;
float l9_2=q.z*q.z;
float l9_3=q.x*q.z;
float l9_4=q.x*q.y;
float l9_5=q.y*q.z;
float l9_6=q.w*q.x;
float l9_7=q.w*q.y;
float l9_8=q.w*q.z;
return mat3(vec3(1.0-(2.0*(l9_1+l9_2)),2.0*(l9_4+l9_8),2.0*(l9_3-l9_7)),vec3(2.0*(l9_4-l9_8),1.0-(2.0*(l9_0+l9_2)),2.0*(l9_5+l9_6)),vec3(2.0*(l9_3+l9_7),2.0*(l9_5-l9_6),1.0-(2.0*(l9_0+l9_1))));
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
gParticle.CopyId=float(InstanceID/200);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int l9_0=InstanceID;
int l9_1=l9_0/200;
int l9_2=l9_0%200;
float l9_3=float(l9_2);
ivec2 l9_4=ivec2(l9_2,l9_1);
float l9_5=float(l9_0);
vec2 l9_6=vec2(l9_4);
float l9_7=l9_5/199.0;
float l9_8=l9_7*10.0;
float l9_9;
if (overrideTimeEnabled==1)
{
l9_9=overrideTimeElapsed[l9_1];
}
else
{
l9_9=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,gParticle.Counter_N3,gParticle.Tap_N2,l9_8,fract(abs(((l9_7*0.97637898)+0.151235)+(floor(((((l9_9-l9_8)-0.0)+0.0)+20.0)/10.0)*4.32723))),(vec2(ivec2(l9_0%400,l9_0/400))+vec2(1.0))/vec2(399.0),float(((l9_0*((l9_0*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,l9_0,l9_2,l9_3,(200*(l9_1+1))-1,(l9_5+0.5)/200.0,l9_7,l9_3/199.0,l9_4,(l9_6+vec2(0.5))/vec2(200.0,1.0),l9_6/vec2(199.0,1.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
int l9_10=InstanceID;
int l9_11=(vfxOffsetInstancesRead+l9_10)*4;
int l9_12=l9_11/vfxTargetWidth;
vec2 l9_13=(vec2(ivec2(l9_11-(l9_12*vfxTargetWidth),l9_12))+vec2(0.5))/vec2(2048.0,vfxTargetSizeRead.y);
vec2 l9_14=l9_13+vec2(0.0);
vec4 l9_15=renderTarget0SampleViewIndexBias(l9_14,renderTarget0GetStereoViewIndex(),0.0);
bool l9_16=dot(abs(l9_15),vec4(1.0))<9.9999997e-06;
bool l9_17;
if (!l9_16)
{
l9_17=!vfxBatchEnable[sc_GetLocalInstanceID()/200];
}
else
{
l9_17=l9_16;
}
if (l9_17)
{
return false;
}
float l9_18=1000.0-(-1000.0);
float l9_19=0.99998999-0.0;
gParticle.Position.x=(-1000.0)+(((DecodeFloat32(l9_15,true)-0.0)*l9_18)/l9_19);
gParticle.Position.y=(-1000.0)+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_14,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*l9_18)/l9_19);
gParticle.Position.z=(-1000.0)+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_14,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_18)/l9_19);
gParticle.Velocity.x=(-1000.0)+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_14,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_18)/l9_19);
vec2 l9_20=l9_13+vec2(0.00048828125,0.0);
gParticle.Velocity.y=(-1000.0)+(((DecodeFloat32(renderTarget0SampleViewIndexBias(l9_20,renderTarget0GetStereoViewIndex(),0.0),true)-0.0)*l9_18)/l9_19);
gParticle.Velocity.z=(-1000.0)+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_20,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*l9_18)/l9_19);
float l9_21=10.0-0.0;
gParticle.Life=0.0+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_20,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_19);
gParticle.Age=0.0+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_20,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_19);
vec2 l9_22=l9_13+vec2(0.0009765625,0.0);
vec4 l9_23=renderTarget0SampleViewIndexBias(l9_22,renderTarget0GetStereoViewIndex(),0.0);
vec4 l9_24=renderTarget1SampleViewIndexBias(l9_22,renderTarget1GetStereoViewIndex(),0.0);
vec4 l9_25=renderTarget2SampleViewIndexBias(l9_22,renderTarget2GetStereoViewIndex(),0.0);
vec4 l9_26=renderTarget3SampleViewIndexBias(l9_22,renderTarget3GetStereoViewIndex(),0.0);
float l9_27=100.0-0.0;
gParticle.Size=0.0+(((DecodeFloat16(vec2(l9_23.xy),true)-0.0)*l9_27)/l9_19);
float l9_28=1.0-(-1.0);
gParticle.Quaternion.x=(-1.0)+(((DecodeFloat16(vec2(l9_23.zw),true)-0.0)*l9_28)/l9_19);
gParticle.Quaternion.y=(-1.0)+(((DecodeFloat16(vec2(l9_24.xy),true)-0.0)*l9_28)/l9_19);
gParticle.Quaternion.z=(-1.0)+(((DecodeFloat16(vec2(l9_24.zw),true)-0.0)*l9_28)/l9_19);
gParticle.Quaternion.w=(-1.0)+(((DecodeFloat16(vec2(l9_25.xy),true)-0.0)*l9_28)/l9_19);
gParticle.Mass=0.0+(((DecodeFloat16(vec2(l9_25.zw),true)-0.0)*l9_27)/l9_19);
float l9_29=1.00001-0.0;
float l9_30=1.0-0.0;
gParticle.Color.x=0.0+(((DecodeFloat8(l9_26.x,true)-0.0)*l9_29)/l9_30);
gParticle.Color.y=0.0+(((DecodeFloat8(l9_26.y,true)-0.0)*l9_29)/l9_30);
gParticle.Color.z=0.0+(((DecodeFloat8(l9_26.z,true)-0.0)*l9_29)/l9_30);
gParticle.Color.w=0.0+(((DecodeFloat8(l9_26.w,true)-0.0)*l9_29)/l9_30);
vec2 l9_31=l9_13+vec2(0.0014648438,0.0);
vec4 l9_32=renderTarget0SampleViewIndexBias(l9_31,renderTarget0GetStereoViewIndex(),0.0);
gParticle.Counter_N3=0.0+(((DecodeFloat8(l9_32.x,true)-0.0)*(25.0-0.0))/l9_30);
gParticle.Tap_N2=0.0+(((DecodeFloat8(l9_32.y,true)-0.0)*l9_30)/l9_30);
gParticle.Matrix=quaternionToMatrix(gParticle.Quaternion);
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+vec3(0.5))*0.00050000002;
gParticle.Position=floor((gParticle.Position*2000.0)+vec3(0.5))*0.00050000002;
gParticle.Color=floor((gParticle.Color*2000.0)+vec4(0.5))*0.00050000002;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.00050000002;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.00050000002;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.00050000002;
return true;
}
void main()
{
vec4 l9_0;
#if (sc_IsEditor&&SC_DISABLE_FRUSTUM_CULLING)
{
vec4 l9_1=position;
l9_1.x=position.x+sc_DisableFrustumCullingMarker;
l9_0=l9_1;
}
#else
{
l9_0=position;
}
#endif
int l9_2=sc_GetLocalInstanceID();
bool l9_3=l9_2>=(200*(vfxNumCopies+1));
bool l9_4;
if (!l9_3)
{
l9_4=vfxBatchEnable[sc_GetLocalInstanceID()/200]==false;
}
else
{
l9_4=l9_3;
}
if (l9_4)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
bool l9_5=ssDecodeParticle(l9_2);
if (!l9_5)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
float l9_6=gParticle.Size;
bool l9_7=l9_6<9.9999997e-06;
bool l9_8;
if (!l9_7)
{
l9_8=gParticle.Age>=gParticle.Life;
}
else
{
l9_8=l9_7;
}
if (l9_8)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
gParticle.Matrix=quaternionToMatrix(gParticle.Quaternion);
varPos=gParticle.Position+(gParticle.Matrix*vec3(l9_0.x*gParticle.Size,l9_0.y*gParticle.Size,0.0));
varNormal=gParticle.Matrix*vec3(0.0,0.0,1.0);
vec3 l9_9=gParticle.Matrix*vec3(1.0,0.0,0.0);
varTangent=vec4(l9_9.x,l9_9.y,l9_9.z,varTangent.w);
varTangent.w=1.0;
varPackedTex=vec4(texture0,texture1);
vec3 l9_10=gParticle.Velocity;
float l9_11=length(l9_10);
vec3 l9_12;
if ((l9_11<0.029999999)||(Port_Import_N099<9.9999997e-05))
{
l9_12=vec3(0.0,1.0,0.0);
}
else
{
l9_12=normalize(gParticle.Velocity);
}
vec3 l9_13=normalize(sc_ViewMatrixInverseArray[sc_GetStereoViewIndex()][2].xyz);
vec3 l9_14=normalize(cross(l9_13,l9_12));
vec3 l9_15=normalize(cross(l9_14,l9_13));
vec4 l9_16=mat4(vec4(gParticle.Matrix[0].x,gParticle.Matrix[0].y,gParticle.Matrix[0].z,0.0),vec4(gParticle.Matrix[1].x,gParticle.Matrix[1].y,gParticle.Matrix[1].z,0.0),vec4(gParticle.Matrix[2].x,gParticle.Matrix[2].y,gParticle.Matrix[2].z,0.0),vec4(0.0,0.0,0.0,1.0))*vec4((texture0-vec2(0.5))+clamp(Port_Import_N100,vec2(-0.5),vec2(0.5)),0.0,1.0);
varPos=(gParticle.Position+((-l9_14)*(gParticle.Size*l9_16.x)))+(l9_15*((gParticle.Size*l9_16.y)*max(l9_11*Port_Import_N099,1.0)));
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
varNormal=l9_13;
vec4 l9_17=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
vec4 l9_18;
#if (sc_DepthBufferMode==1)
{
vec4 l9_19;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
float l9_20=l9_17.w;
vec4 l9_21=l9_17;
l9_21.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_20))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_20;
l9_19=l9_21;
}
else
{
l9_19=l9_17;
}
l9_18=l9_19;
}
#else
{
l9_18=l9_17;
}
#endif
sc_SetClipPosition(l9_18);
Interp_Particle_Index=float(sc_GetLocalInstanceID());
Interp_Particle_Force=gParticle.Force;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Quaternion=gParticle.Quaternion;
Interp_Particle_Counter_N3=gParticle.Counter_N3;
Interp_Particle_Tap_N2=gParticle.Tap_N2;
Interp_Particle_Mass=gParticle.Mass;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING 1
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
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 0
#elif sc_BlendMode_PremultipliedAlphaAuto==1
#undef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_MotionVectorsPass
#define sc_MotionVectorsPass 0
#elif sc_MotionVectorsPass==1
#undef sc_MotionVectorsPass
#define sc_MotionVectorsPass 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 0
#elif sc_UseFramebufferFetchMarker==1
#undef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 1
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 0
#elif sc_GetFramebufferColorInvalidUsageMarker==1
#undef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 1
#endif
#ifndef sc_BlendMode_Software
#define sc_BlendMode_Software 0
#elif sc_BlendMode_Software==1
#undef sc_BlendMode_Software
#define sc_BlendMode_Software 1
#endif
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
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
#endif
#ifndef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 0
#elif SC_GL_FRAGMENT_PRECISION_HIGH==1
#undef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 1
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
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
#ifndef baseTexHasSwappedViews
#define baseTexHasSwappedViews 0
#elif baseTexHasSwappedViews==1
#undef baseTexHasSwappedViews
#define baseTexHasSwappedViews 1
#endif
#ifndef baseTexLayout
#define baseTexLayout 0
#endif
#ifndef Tweak_N8HasSwappedViews
#define Tweak_N8HasSwappedViews 0
#elif Tweak_N8HasSwappedViews==1
#undef Tweak_N8HasSwappedViews
#define Tweak_N8HasSwappedViews 1
#endif
#ifndef Tweak_N8Layout
#define Tweak_N8Layout 0
#endif
#ifndef Tweak_N104HasSwappedViews
#define Tweak_N104HasSwappedViews 0
#elif Tweak_N104HasSwappedViews==1
#undef Tweak_N104HasSwappedViews
#define Tweak_N104HasSwappedViews 1
#endif
#ifndef Tweak_N104Layout
#define Tweak_N104Layout 0
#endif
#ifndef Tweak_N10HasSwappedViews
#define Tweak_N10HasSwappedViews 0
#elif Tweak_N10HasSwappedViews==1
#undef Tweak_N10HasSwappedViews
#define Tweak_N10HasSwappedViews 1
#endif
#ifndef Tweak_N10Layout
#define Tweak_N10Layout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_baseTex
#define SC_USE_UV_TRANSFORM_baseTex 0
#elif SC_USE_UV_TRANSFORM_baseTex==1
#undef SC_USE_UV_TRANSFORM_baseTex
#define SC_USE_UV_TRANSFORM_baseTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_baseTex
#define SC_SOFTWARE_WRAP_MODE_U_baseTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_baseTex
#define SC_SOFTWARE_WRAP_MODE_V_baseTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_baseTex
#define SC_USE_UV_MIN_MAX_baseTex 0
#elif SC_USE_UV_MIN_MAX_baseTex==1
#undef SC_USE_UV_MIN_MAX_baseTex
#define SC_USE_UV_MIN_MAX_baseTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_baseTex
#define SC_USE_CLAMP_TO_BORDER_baseTex 0
#elif SC_USE_CLAMP_TO_BORDER_baseTex==1
#undef SC_USE_CLAMP_TO_BORDER_baseTex
#define SC_USE_CLAMP_TO_BORDER_baseTex 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N104
#define SC_USE_UV_TRANSFORM_Tweak_N104 0
#elif SC_USE_UV_TRANSFORM_Tweak_N104==1
#undef SC_USE_UV_TRANSFORM_Tweak_N104
#define SC_USE_UV_TRANSFORM_Tweak_N104 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N104
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N104 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N104
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N104 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N104
#define SC_USE_UV_MIN_MAX_Tweak_N104 0
#elif SC_USE_UV_MIN_MAX_Tweak_N104==1
#undef SC_USE_UV_MIN_MAX_Tweak_N104
#define SC_USE_UV_MIN_MAX_Tweak_N104 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N104
#define SC_USE_CLAMP_TO_BORDER_Tweak_N104 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N104==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N104
#define SC_USE_CLAMP_TO_BORDER_Tweak_N104 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N8
#define SC_USE_UV_TRANSFORM_Tweak_N8 0
#elif SC_USE_UV_TRANSFORM_Tweak_N8==1
#undef SC_USE_UV_TRANSFORM_Tweak_N8
#define SC_USE_UV_TRANSFORM_Tweak_N8 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N8
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N8 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N8
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N8 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N8
#define SC_USE_UV_MIN_MAX_Tweak_N8 0
#elif SC_USE_UV_MIN_MAX_Tweak_N8==1
#undef SC_USE_UV_MIN_MAX_Tweak_N8
#define SC_USE_UV_MIN_MAX_Tweak_N8 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N8
#define SC_USE_CLAMP_TO_BORDER_Tweak_N8 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N8==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N8
#define SC_USE_CLAMP_TO_BORDER_Tweak_N8 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N10
#define SC_USE_UV_TRANSFORM_Tweak_N10 0
#elif SC_USE_UV_TRANSFORM_Tweak_N10==1
#undef SC_USE_UV_TRANSFORM_Tweak_N10
#define SC_USE_UV_TRANSFORM_Tweak_N10 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N10
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N10 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N10
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N10 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N10
#define SC_USE_UV_MIN_MAX_Tweak_N10 0
#elif SC_USE_UV_MIN_MAX_Tweak_N10==1
#undef SC_USE_UV_MIN_MAX_Tweak_N10
#define SC_USE_UV_MIN_MAX_Tweak_N10 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N10
#define SC_USE_CLAMP_TO_BORDER_Tweak_N10 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N10==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N10
#define SC_USE_CLAMP_TO_BORDER_Tweak_N10 1
#endif
uniform vec4 sc_CurrentRenderTargetDims;
uniform float shaderComplexityValue;
uniform vec4 sc_UniformConstants;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed[32];
uniform vec4 sc_Time;
uniform int Tweak_N114;
uniform mat3 baseTexTransform;
uniform vec4 baseTexUvMinMax;
uniform vec4 baseTexBorderColor;
uniform mat3 Tweak_N104Transform;
uniform vec4 Tweak_N104UvMinMax;
uniform vec4 Tweak_N104BorderColor;
uniform mat3 Tweak_N8Transform;
uniform vec4 Tweak_N8UvMinMax;
uniform vec4 Tweak_N8BorderColor;
uniform vec2 Port_SpriteCount_N026;
uniform float Port_Input1_N121;
uniform vec2 Port_Center_N119;
uniform vec2 Port_Scale_N123;
uniform float Port_ValueA_N141;
uniform float Port_TimeA_N141;
uniform float Port_TimeTransition_N141;
uniform float Port_ValueB_N141;
uniform float Port_TimeB_N141;
uniform vec2 Port_Center_N130;
uniform vec2 Port_Input1_N126;
uniform vec2 Port_Input2_N126;
uniform float Port_FlowStrength_N076;
uniform float Port_FlowSpeed_N076;
uniform vec2 Port_Center_N116;
uniform vec2 Port_Input1_N122;
uniform vec2 Port_Input2_N122;
uniform mat3 Tweak_N10Transform;
uniform vec4 Tweak_N10UvMinMax;
uniform vec4 Tweak_N10BorderColor;
uniform float overrideTimeDelta;
uniform sampler2D Tweak_N104;
uniform sampler2D Tweak_N8;
uniform sampler2D Tweak_N10;
uniform sampler2D baseTex;
uniform sampler2D sc_ScreenTexture;
uniform sampler2D intensityTexture;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying float Interp_Particle_Index;
varying vec4 varPackedTex;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying float Interp_Particle_Size;
varying vec4 Interp_Particle_Color;
varying vec4 Interp_Particle_Quaternion;
varying float Interp_Particle_Counter_N3;
varying float Interp_Particle_Tap_N2;
varying float Interp_Particle_Mass;
varying vec3 varPos;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
varying vec3 Interp_Particle_Force;
varying vec2 Interp_Particle_Coord;
varying float Interp_Particle_SpawnIndex;
varying float Interp_Particle_NextBurstTime;
varying float gParticlesDebug;
varying vec2 ParticleUV;
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
float snoise(vec2 v)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_0=floor(v+vec2(dot(v,vec2(0.36602542))));
vec2 l9_1=(v-l9_0)+vec2(dot(l9_0,vec2(0.21132487)));
float l9_2=l9_1.x;
float l9_3=l9_1.y;
bvec2 l9_4=bvec2(l9_2>l9_3);
vec2 l9_5=vec2(l9_4.x ? vec2(1.0,0.0).x : vec2(0.0,1.0).x,l9_4.y ? vec2(1.0,0.0).y : vec2(0.0,1.0).y);
vec2 l9_6=(l9_1+vec2(0.21132487))-l9_5;
vec2 l9_7=l9_1+vec2(-0.57735026);
vec2 l9_8=l9_0-(floor(l9_0*0.0034602077)*289.0);
vec3 l9_9=vec3(l9_8.y)+vec3(0.0,l9_5.y,1.0);
vec3 l9_10=((l9_9*34.0)+vec3(1.0))*l9_9;
vec3 l9_11=((l9_10-(floor(l9_10*0.0034602077)*289.0))+vec3(l9_8.x))+vec3(0.0,l9_5.x,1.0);
vec3 l9_12=((l9_11*34.0)+vec3(1.0))*l9_11;
vec3 l9_13=max(vec3(0.5)-vec3(dot(l9_1,l9_1),dot(l9_6,l9_6),dot(l9_7,l9_7)),vec3(0.0));
vec3 l9_14=l9_13*l9_13;
vec3 l9_15=(fract((l9_12-(floor(l9_12*0.0034602077)*289.0))*vec3(0.024390243))*2.0)-vec3(1.0);
vec3 l9_16=abs(l9_15)-vec3(0.5);
vec3 l9_17=l9_15-floor(l9_15+vec3(0.5));
vec3 l9_18=vec3(0.0);
l9_18.x=(l9_17.x*l9_2)+(l9_16.x*l9_3);
vec2 l9_19=(l9_17.yz*vec2(l9_6.x,l9_7.x))+(l9_16.yz*vec2(l9_6.y,l9_7.y));
return 130.0*dot((l9_14*l9_14)*(vec3(1.7928429)-(((l9_17*l9_17)+(l9_16*l9_16))*0.85373473)),vec3(l9_18.x,l9_19.x,l9_19.y));
}
#else
{
return 0.0;
}
#endif
}
void sc_SoftwareWrapEarly(inout float uv,int softwareWrapMode)
{
if (softwareWrapMode==1)
{
uv=fract(uv);
}
else
{
if (softwareWrapMode==2)
{
float l9_0=fract(uv);
uv=mix(l9_0,1.0-l9_0,clamp(step(0.25,fract((uv-l9_0)*0.5)),0.0,1.0));
}
}
}
void sc_ClampUV(inout float value,float minValue,float maxValue,bool useClampToBorder,inout float clampToBorderFactor)
{
float l9_0=clamp(value,minValue,maxValue);
float l9_1=step(abs(value-l9_0),9.9999997e-06);
clampToBorderFactor*=(l9_1+((1.0-float(useClampToBorder))*(1.0-l9_1)));
value=l9_0;
}
vec2 sc_TransformUV(vec2 uv,bool useUvTransform,mat3 uvTransform)
{
if (useUvTransform)
{
uv=vec2((uvTransform*vec3(uv,1.0)).xy);
}
return uv;
}
void sc_SoftwareWrapLate(inout float uv,int softwareWrapMode,bool useClampToBorder,inout float clampToBorderFactor)
{
if ((softwareWrapMode==0)||(softwareWrapMode==3))
{
sc_ClampUV(uv,0.0,1.0,useClampToBorder,clampToBorderFactor);
}
}
int Tweak_N8GetStereoViewIndex()
{
int l9_0;
#if (Tweak_N8HasSwappedViews)
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
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
}
float transformSingleColor(float original,float intMap,float target)
{
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
return original/pow(1.0-target,intMap);
}
#else
{
#if (BLEND_MODE_DIVISION)
{
return original/(1.0-target);
}
#else
{
#if (BLEND_MODE_BRIGHT)
{
return original/pow(1.0-target,2.0-(2.0*original));
}
#endif
}
#endif
}
#endif
return 0.0;
}
vec3 RGBtoHCV(vec3 rgb)
{
vec4 l9_0;
if (rgb.y<rgb.z)
{
l9_0=vec4(rgb.zy,-1.0,0.66666669);
}
else
{
l9_0=vec4(rgb.yz,0.0,-0.33333334);
}
vec4 l9_1;
if (rgb.x<l9_0.x)
{
l9_1=vec4(l9_0.xyw,rgb.x);
}
else
{
l9_1=vec4(rgb.x,l9_0.yzx);
}
float l9_2=l9_1.x-min(l9_1.w,l9_1.y);
return vec3(abs(((l9_1.w-l9_1.y)/((6.0*l9_2)+1e-07))+l9_1.z),l9_2,l9_1.x);
}
vec3 RGBToHSL(vec3 rgb)
{
vec3 l9_0=RGBtoHCV(rgb);
float l9_1=l9_0.y;
float l9_2=l9_0.z-(l9_1*0.5);
return vec3(l9_0.x,l9_1/((1.0-abs((2.0*l9_2)-1.0))+1e-07),l9_2);
}
vec3 HUEtoRGB(float hue)
{
return clamp(vec3(abs((6.0*hue)-3.0)-1.0,2.0-abs((6.0*hue)-2.0),2.0-abs((6.0*hue)-4.0)),vec3(0.0),vec3(1.0));
}
vec3 HSLToRGB(vec3 hsl)
{
return ((HUEtoRGB(hsl.x)-vec3(0.5))*((1.0-abs((2.0*hsl.z)-1.0))*hsl.y))+vec3(hsl.z);
}
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight,float intMap)
{
#if (BLEND_MODE_INTENSE)
{
return mix(original,HSLToRGB(vec3(target.x,target.y,RGBToHSL(original).z)),vec3(weight));
}
#else
{
return mix(original,clamp(vec3(transformSingleColor(yValue,intMap,target.x),transformSingleColor(yValue,intMap,target.y),transformSingleColor(yValue,intMap,target.z)),vec3(0.0),vec3(1.0)),vec3(weight));
}
#endif
}
vec3 definedBlend(vec3 a,vec3 b)
{
#if (BLEND_MODE_LIGHTEN)
{
return max(a,b);
}
#else
{
#if (BLEND_MODE_DARKEN)
{
return min(a,b);
}
#else
{
#if (BLEND_MODE_DIVIDE)
{
return b/a;
}
#else
{
#if (BLEND_MODE_AVERAGE)
{
return (a+b)*0.5;
}
#else
{
#if (BLEND_MODE_SUBTRACT)
{
return max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
#if (BLEND_MODE_DIFFERENCE)
{
return abs(a-b);
}
#else
{
#if (BLEND_MODE_NEGATION)
{
return vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
#if (BLEND_MODE_EXCLUSION)
{
return (a+b)-((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_OVERLAY)
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1;
if (a.y<0.5)
{
l9_1=(2.0*a.y)*b.y;
}
else
{
l9_1=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_2;
if (a.z<0.5)
{
l9_2=(2.0*a.z)*b.z;
}
else
{
l9_2=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return vec3(l9_0,l9_1,l9_2);
}
#else
{
#if (BLEND_MODE_SOFT_LIGHT)
{
return (((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_3;
if (b.x<0.5)
{
l9_3=(2.0*b.x)*a.x;
}
else
{
l9_3=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_4;
if (b.y<0.5)
{
l9_4=(2.0*b.y)*a.y;
}
else
{
l9_4=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_5;
if (b.z<0.5)
{
l9_5=(2.0*b.z)*a.z;
}
else
{
l9_5=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return vec3(l9_3,l9_4,l9_5);
}
#else
{
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_6;
if (b.x==1.0)
{
l9_6=b.x;
}
else
{
l9_6=min(a.x/(1.0-b.x),1.0);
}
float l9_7;
if (b.y==1.0)
{
l9_7=b.y;
}
else
{
l9_7=min(a.y/(1.0-b.y),1.0);
}
float l9_8;
if (b.z==1.0)
{
l9_8=b.z;
}
else
{
l9_8=min(a.z/(1.0-b.z),1.0);
}
return vec3(l9_6,l9_7,l9_8);
}
#else
{
#if (BLEND_MODE_COLOR_BURN)
{
float l9_9;
if (b.x==0.0)
{
l9_9=b.x;
}
else
{
l9_9=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_10;
if (b.y==0.0)
{
l9_10=b.y;
}
else
{
l9_10=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_11;
if (b.z==0.0)
{
l9_11=b.z;
}
else
{
l9_11=max(1.0-((1.0-a.z)/b.z),0.0);
}
return vec3(l9_9,l9_10,l9_11);
}
#else
{
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_12;
if (b.x<0.5)
{
l9_12=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_12=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_13;
if (b.y<0.5)
{
l9_13=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_13=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_14;
if (b.z<0.5)
{
l9_14=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_14=min(a.z+(2.0*(b.z-0.5)),1.0);
}
return vec3(l9_12,l9_13,l9_14);
}
#else
{
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_15;
if (b.x<0.5)
{
float l9_16;
if ((2.0*b.x)==0.0)
{
l9_16=2.0*b.x;
}
else
{
l9_16=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_15=l9_16;
}
else
{
float l9_17;
if ((2.0*(b.x-0.5))==1.0)
{
l9_17=2.0*(b.x-0.5);
}
else
{
l9_17=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_15=l9_17;
}
float l9_18;
if (b.y<0.5)
{
float l9_19;
if ((2.0*b.y)==0.0)
{
l9_19=2.0*b.y;
}
else
{
l9_19=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_18=l9_19;
}
else
{
float l9_20;
if ((2.0*(b.y-0.5))==1.0)
{
l9_20=2.0*(b.y-0.5);
}
else
{
l9_20=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_18=l9_20;
}
float l9_21;
if (b.z<0.5)
{
float l9_22;
if ((2.0*b.z)==0.0)
{
l9_22=2.0*b.z;
}
else
{
l9_22=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_21=l9_22;
}
else
{
float l9_23;
if ((2.0*(b.z-0.5))==1.0)
{
l9_23=2.0*(b.z-0.5);
}
else
{
l9_23=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_21=l9_23;
}
return vec3(l9_15,l9_18,l9_21);
}
#else
{
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_24;
if (b.x<0.5)
{
l9_24=min(a.x,2.0*b.x);
}
else
{
l9_24=max(a.x,2.0*(b.x-0.5));
}
float l9_25;
if (b.y<0.5)
{
l9_25=min(a.y,2.0*b.y);
}
else
{
l9_25=max(a.y,2.0*(b.y-0.5));
}
float l9_26;
if (b.z<0.5)
{
l9_26=min(a.z,2.0*b.z);
}
else
{
l9_26=max(a.z,2.0*(b.z-0.5));
}
return vec3(l9_24,l9_25,l9_26);
}
#else
{
#if (BLEND_MODE_HARD_MIX)
{
float l9_27;
if (b.x<0.5)
{
float l9_28;
if ((2.0*b.x)==0.0)
{
l9_28=2.0*b.x;
}
else
{
l9_28=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_27=l9_28;
}
else
{
float l9_29;
if ((2.0*(b.x-0.5))==1.0)
{
l9_29=2.0*(b.x-0.5);
}
else
{
l9_29=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_27=l9_29;
}
bool l9_30=l9_27<0.5;
float l9_31;
if (b.y<0.5)
{
float l9_32;
if ((2.0*b.y)==0.0)
{
l9_32=2.0*b.y;
}
else
{
l9_32=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_31=l9_32;
}
else
{
float l9_33;
if ((2.0*(b.y-0.5))==1.0)
{
l9_33=2.0*(b.y-0.5);
}
else
{
l9_33=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_31=l9_33;
}
bool l9_34=l9_31<0.5;
float l9_35;
if (b.z<0.5)
{
float l9_36;
if ((2.0*b.z)==0.0)
{
l9_36=2.0*b.z;
}
else
{
l9_36=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_35=l9_36;
}
else
{
float l9_37;
if ((2.0*(b.z-0.5))==1.0)
{
l9_37=2.0*(b.z-0.5);
}
else
{
l9_37=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_35=l9_37;
}
return vec3(l9_30 ? 0.0 : 1.0,l9_34 ? 0.0 : 1.0,(l9_35<0.5) ? 0.0 : 1.0);
}
#else
{
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_38;
if (b.x==1.0)
{
l9_38=b.x;
}
else
{
l9_38=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_39;
if (b.y==1.0)
{
l9_39=b.y;
}
else
{
l9_39=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_40;
if (b.z==1.0)
{
l9_40=b.z;
}
else
{
l9_40=min((a.z*a.z)/(1.0-b.z),1.0);
}
return vec3(l9_38,l9_39,l9_40);
}
#else
{
#if (BLEND_MODE_HARD_GLOW)
{
float l9_41;
if (a.x==1.0)
{
l9_41=a.x;
}
else
{
l9_41=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_42;
if (a.y==1.0)
{
l9_42=a.y;
}
else
{
l9_42=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_43;
if (a.z==1.0)
{
l9_43=a.z;
}
else
{
l9_43=min((b.z*b.z)/(1.0-a.z),1.0);
}
return vec3(l9_41,l9_42,l9_43);
}
#else
{
#if (BLEND_MODE_HARD_PHOENIX)
{
return (min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
#if (BLEND_MODE_HUE)
{
return HSLToRGB(vec3(RGBToHSL(b).x,RGBToHSL(a).yz));
}
#else
{
#if (BLEND_MODE_SATURATION)
{
vec3 l9_44=RGBToHSL(a);
return HSLToRGB(vec3(l9_44.x,RGBToHSL(b).y,l9_44.z));
}
#else
{
#if (BLEND_MODE_COLOR)
{
return HSLToRGB(vec3(RGBToHSL(b).xy,RGBToHSL(a).z));
}
#else
{
#if (BLEND_MODE_LUMINOSITY)
{
return HSLToRGB(vec3(RGBToHSL(a).xy,RGBToHSL(b).z));
}
#else
{
vec3 l9_45=a;
vec3 l9_46=b;
float l9_47=((0.29899999*l9_45.x)+(0.58700001*l9_45.y))+(0.114*l9_45.z);
int l9_48;
#if (intensityTextureHasSwappedViews)
{
l9_48=1-sc_GetStereoViewIndex();
}
#else
{
l9_48=sc_GetStereoViewIndex();
}
#endif
bool l9_49=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_50=pow(l9_47,1.0/correctedIntensity);
sc_SoftwareWrapEarly(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_51=l9_50;
float l9_52=0.5;
sc_SoftwareWrapEarly(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_53=l9_52;
vec2 l9_54;
float l9_55;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_56;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_56=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_56=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_57=l9_51;
float l9_58=1.0;
sc_ClampUV(l9_57,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_56,l9_58);
float l9_59=l9_57;
float l9_60=l9_58;
bool l9_61;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_61=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_61=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_62=l9_53;
float l9_63=l9_60;
sc_ClampUV(l9_62,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_61,l9_63);
l9_55=l9_63;
l9_54=vec2(l9_59,l9_62);
}
#else
{
l9_55=1.0;
l9_54=vec2(l9_51,l9_53);
}
#endif
vec2 l9_64=sc_TransformUV(l9_54,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_65=l9_64.x;
float l9_66=l9_55;
sc_SoftwareWrapLate(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_49,l9_66);
float l9_67=l9_64.y;
float l9_68=l9_66;
sc_SoftwareWrapLate(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_49,l9_68);
float l9_69=l9_68;
vec3 l9_70=sc_SamplingCoordsViewToGlobal(vec2(l9_65,l9_67),intensityTextureLayout,l9_48);
vec4 l9_71=texture2D(intensityTexture,l9_70.xy,0.0);
vec4 l9_72;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_72=mix(intensityTextureBorderColor,l9_71,vec4(l9_69));
}
#else
{
l9_72=l9_71;
}
#endif
float l9_73=((((l9_72.x*256.0)+l9_72.y)+(l9_72.z/256.0))/257.00391)*16.0;
float l9_74;
#if (BLEND_MODE_FORGRAY)
{
l9_74=max(l9_73,1.0);
}
#else
{
l9_74=l9_73;
}
#endif
float l9_75;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_75=min(l9_74,1.0);
}
#else
{
l9_75=l9_74;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_75);
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
#endif
}
#endif
}
#endif
}
#endif
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
    col.x+=zero*float(cacheConst);
    sc_FragData0=col;
}
void main()
{
#if (sc_MotionVectorsPass)
{
discard;
}
#endif
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
int l9_4=int(Interp_Particle_Index);
float l9_5=float(l9_4)/199.0;
float l9_6;
if (overrideTimeEnabled==1)
{
l9_6=overrideTimeElapsed[l9_4/200];
}
else
{
l9_6=sc_Time.x;
}
float l9_7=l9_6-(l9_5*10.0);
float l9_8=fract(abs(((l9_5*0.97637898)+0.151235)+(floor((((l9_7-0.0)+0.0)+20.0)/10.0)*4.32723)));
float l9_9=(sc_Time.x-((float(((l9_4*((l9_4*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10)*min(overrideTimeDelta,0.5)))-0.0;
vec4 l9_10;
if ((floor(Interp_Particle_Tap_N2+0.5)*1.0)!=0.0)
{
float l9_11=floor(Port_SpriteCount_N026.x);
float l9_12=floor(Port_SpriteCount_N026.y);
float l9_13=1.0/l9_11;
float l9_14=1.0/l9_12;
float l9_15=floor(mod(floor(floor(Interp_Particle_Counter_N3+0.5)),min(l9_11*l9_12,floor(float(Tweak_N114)))));
int l9_16;
#if (baseTexHasSwappedViews)
{
l9_16=1-sc_GetStereoViewIndex();
}
#else
{
l9_16=sc_GetStereoViewIndex();
}
#endif
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_baseTex)!=0));
float l9_18=(l9_13*varPackedTex.x)+(mod(l9_15,l9_11)*l9_13);
sc_SoftwareWrapEarly(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x);
float l9_19=l9_18;
float l9_20=((1.0-l9_14)-(floor(l9_15/l9_11)*l9_14))+(l9_14*varPackedTex.y);
sc_SoftwareWrapEarly(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y);
float l9_21=l9_20;
vec2 l9_22;
float l9_23;
#if (SC_USE_UV_MIN_MAX_baseTex)
{
bool l9_24;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_24=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x==3;
}
#else
{
l9_24=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_25=l9_19;
float l9_26=1.0;
sc_ClampUV(l9_25,baseTexUvMinMax.x,baseTexUvMinMax.z,l9_24,l9_26);
float l9_27=l9_25;
float l9_28=l9_26;
bool l9_29;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_29=ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y==3;
}
#else
{
l9_29=(int(SC_USE_CLAMP_TO_BORDER_baseTex)!=0);
}
#endif
float l9_30=l9_21;
float l9_31=l9_28;
sc_ClampUV(l9_30,baseTexUvMinMax.y,baseTexUvMinMax.w,l9_29,l9_31);
l9_23=l9_31;
l9_22=vec2(l9_27,l9_30);
}
#else
{
l9_23=1.0;
l9_22=vec2(l9_19,l9_21);
}
#endif
vec2 l9_32=sc_TransformUV(l9_22,(int(SC_USE_UV_TRANSFORM_baseTex)!=0),baseTexTransform);
float l9_33=l9_32.x;
float l9_34=l9_23;
sc_SoftwareWrapLate(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).x,l9_17,l9_34);
float l9_35=l9_32.y;
float l9_36=l9_34;
sc_SoftwareWrapLate(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_baseTex,SC_SOFTWARE_WRAP_MODE_V_baseTex).y,l9_17,l9_36);
float l9_37=l9_36;
vec3 l9_38=sc_SamplingCoordsViewToGlobal(vec2(l9_33,l9_35),baseTexLayout,l9_16);
vec4 l9_39=texture2D(baseTex,l9_38.xy,0.0);
vec4 l9_40;
#if (SC_USE_CLAMP_TO_BORDER_baseTex)
{
l9_40=mix(baseTexBorderColor,l9_39,vec4(l9_37));
}
#else
{
l9_40=l9_39;
}
#endif
l9_10=l9_40;
}
else
{
float l9_41=radians(l9_8*Port_Input1_N121);
float l9_42=sin(l9_41);
float l9_43=cos(l9_41);
vec2 l9_44=varPackedTex.xy-Port_Center_N119;
vec2 l9_45=varPackedTex.xy+vec2(l9_8);
float l9_46=snoise(vec2(floor(l9_45.x*10000.0)*9.9999997e-05,floor(l9_45.y*10000.0)*9.9999997e-05)*(Port_Scale_N123*0.5));
float l9_47=((Port_TimeA_N141+Port_TimeTransition_N141)+Port_TimeB_N141)+9.9999997e-05;
vec2 l9_48=vec2(mix(Port_ValueA_N141,Port_ValueB_N141,smoothstep(Port_TimeA_N141/l9_47,1.0-(Port_TimeB_N141/l9_47),abs((mod((l9_9/l9_47)+(floor(((l9_46*0.5)+0.5)*10000.0)*9.9999997e-05),1.0)*2.0)-1.0))));
vec2 l9_49=clamp(((((vec2(dot(vec2(l9_43,l9_42),l9_44),dot(vec2(-l9_42,l9_43),l9_44))+Port_Center_N119)-Port_Center_N130)*l9_48)+Port_Center_N130)+vec2(0.001),Port_Input1_N126+vec2(0.001),Port_Input2_N126+vec2(0.001))-vec2(0.001);
int l9_50;
#if (Tweak_N104HasSwappedViews)
{
l9_50=1-sc_GetStereoViewIndex();
}
#else
{
l9_50=sc_GetStereoViewIndex();
}
#endif
bool l9_51=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N104)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N104)!=0));
float l9_52=l9_49.x;
sc_SoftwareWrapEarly(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N104,SC_SOFTWARE_WRAP_MODE_V_Tweak_N104).x);
float l9_53=l9_52;
float l9_54=l9_49.y;
sc_SoftwareWrapEarly(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N104,SC_SOFTWARE_WRAP_MODE_V_Tweak_N104).y);
float l9_55=l9_54;
vec2 l9_56;
float l9_57;
#if (SC_USE_UV_MIN_MAX_Tweak_N104)
{
bool l9_58;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N104)
{
l9_58=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N104,SC_SOFTWARE_WRAP_MODE_V_Tweak_N104).x==3;
}
#else
{
l9_58=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N104)!=0);
}
#endif
float l9_59=l9_53;
float l9_60=1.0;
sc_ClampUV(l9_59,Tweak_N104UvMinMax.x,Tweak_N104UvMinMax.z,l9_58,l9_60);
float l9_61=l9_59;
float l9_62=l9_60;
bool l9_63;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N104)
{
l9_63=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N104,SC_SOFTWARE_WRAP_MODE_V_Tweak_N104).y==3;
}
#else
{
l9_63=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N104)!=0);
}
#endif
float l9_64=l9_55;
float l9_65=l9_62;
sc_ClampUV(l9_64,Tweak_N104UvMinMax.y,Tweak_N104UvMinMax.w,l9_63,l9_65);
l9_57=l9_65;
l9_56=vec2(l9_61,l9_64);
}
#else
{
l9_57=1.0;
l9_56=vec2(l9_53,l9_55);
}
#endif
vec2 l9_66=sc_TransformUV(l9_56,(int(SC_USE_UV_TRANSFORM_Tweak_N104)!=0),Tweak_N104Transform);
float l9_67=l9_66.x;
float l9_68=l9_57;
sc_SoftwareWrapLate(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N104,SC_SOFTWARE_WRAP_MODE_V_Tweak_N104).x,l9_51,l9_68);
float l9_69=l9_66.y;
float l9_70=l9_68;
sc_SoftwareWrapLate(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N104,SC_SOFTWARE_WRAP_MODE_V_Tweak_N104).y,l9_51,l9_70);
float l9_71=l9_70;
vec3 l9_72=sc_SamplingCoordsViewToGlobal(vec2(l9_67,l9_69),Tweak_N104Layout,l9_50);
vec4 l9_73=texture2D(Tweak_N104,l9_72.xy,0.0);
vec4 l9_74;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N104)
{
l9_74=mix(Tweak_N104BorderColor,l9_73,vec4(l9_71));
}
#else
{
l9_74=l9_73;
}
#endif
vec4 l9_75=l9_74-vec4(0.5);
float l9_76=l9_9*Port_FlowSpeed_N076;
float l9_77=fract(l9_76+0.5);
vec2 l9_78=(l9_75*2.0).xy;
vec2 l9_79=l9_49+((l9_78*l9_77)*Port_FlowStrength_N076);
bool l9_80=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N8)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N8)!=0));
float l9_81=l9_79.x;
sc_SoftwareWrapEarly(l9_81,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).x);
float l9_82=l9_81;
float l9_83=l9_79.y;
sc_SoftwareWrapEarly(l9_83,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).y);
float l9_84=l9_83;
vec2 l9_85;
float l9_86;
#if (SC_USE_UV_MIN_MAX_Tweak_N8)
{
bool l9_87;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N8)
{
l9_87=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).x==3;
}
#else
{
l9_87=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N8)!=0);
}
#endif
float l9_88=l9_82;
float l9_89=1.0;
sc_ClampUV(l9_88,Tweak_N8UvMinMax.x,Tweak_N8UvMinMax.z,l9_87,l9_89);
float l9_90=l9_88;
float l9_91=l9_89;
bool l9_92;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N8)
{
l9_92=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).y==3;
}
#else
{
l9_92=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N8)!=0);
}
#endif
float l9_93=l9_84;
float l9_94=l9_91;
sc_ClampUV(l9_93,Tweak_N8UvMinMax.y,Tweak_N8UvMinMax.w,l9_92,l9_94);
l9_86=l9_94;
l9_85=vec2(l9_90,l9_93);
}
#else
{
l9_86=1.0;
l9_85=vec2(l9_82,l9_84);
}
#endif
vec2 l9_95=sc_TransformUV(l9_85,(int(SC_USE_UV_TRANSFORM_Tweak_N8)!=0),Tweak_N8Transform);
float l9_96=l9_95.x;
float l9_97=l9_86;
sc_SoftwareWrapLate(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).x,l9_80,l9_97);
float l9_98=l9_95.y;
float l9_99=l9_97;
sc_SoftwareWrapLate(l9_98,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).y,l9_80,l9_99);
float l9_100=l9_99;
vec3 l9_101=sc_SamplingCoordsViewToGlobal(vec2(l9_96,l9_98),Tweak_N8Layout,Tweak_N8GetStereoViewIndex());
vec4 l9_102=texture2D(Tweak_N8,l9_101.xy,0.0);
vec4 l9_103;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N8)
{
l9_103=mix(Tweak_N8BorderColor,l9_102,vec4(l9_100));
}
#else
{
l9_103=l9_102;
}
#endif
vec2 l9_104=l9_49+((l9_78*fract(l9_76+1.0))*Port_FlowStrength_N076);
float l9_105=l9_104.x;
sc_SoftwareWrapEarly(l9_105,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).x);
float l9_106=l9_105;
float l9_107=l9_104.y;
sc_SoftwareWrapEarly(l9_107,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).y);
float l9_108=l9_107;
vec2 l9_109;
float l9_110;
#if (SC_USE_UV_MIN_MAX_Tweak_N8)
{
bool l9_111;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N8)
{
l9_111=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).x==3;
}
#else
{
l9_111=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N8)!=0);
}
#endif
float l9_112=l9_106;
float l9_113=1.0;
sc_ClampUV(l9_112,Tweak_N8UvMinMax.x,Tweak_N8UvMinMax.z,l9_111,l9_113);
float l9_114=l9_112;
float l9_115=l9_113;
bool l9_116;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N8)
{
l9_116=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).y==3;
}
#else
{
l9_116=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N8)!=0);
}
#endif
float l9_117=l9_108;
float l9_118=l9_115;
sc_ClampUV(l9_117,Tweak_N8UvMinMax.y,Tweak_N8UvMinMax.w,l9_116,l9_118);
l9_110=l9_118;
l9_109=vec2(l9_114,l9_117);
}
#else
{
l9_110=1.0;
l9_109=vec2(l9_106,l9_108);
}
#endif
vec2 l9_119=sc_TransformUV(l9_109,(int(SC_USE_UV_TRANSFORM_Tweak_N8)!=0),Tweak_N8Transform);
float l9_120=l9_119.x;
float l9_121=l9_110;
sc_SoftwareWrapLate(l9_120,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).x,l9_80,l9_121);
float l9_122=l9_119.y;
float l9_123=l9_121;
sc_SoftwareWrapLate(l9_122,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N8,SC_SOFTWARE_WRAP_MODE_V_Tweak_N8).y,l9_80,l9_123);
float l9_124=l9_123;
vec3 l9_125=sc_SamplingCoordsViewToGlobal(vec2(l9_120,l9_122),Tweak_N8Layout,Tweak_N8GetStereoViewIndex());
vec4 l9_126=texture2D(Tweak_N8,l9_125.xy,0.0);
vec4 l9_127;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N8)
{
l9_127=mix(Tweak_N8BorderColor,l9_126,vec4(l9_124));
}
#else
{
l9_127=l9_126;
}
#endif
vec4 l9_128=mix(l9_103,l9_127,vec4(abs((0.5-l9_77)/0.5)));
vec2 l9_129=clamp((((varPackedTex.xy-Port_Center_N116)*l9_48)+Port_Center_N116)+vec2(0.001),Port_Input1_N122+vec2(0.001),Port_Input2_N122+vec2(0.001))-vec2(0.001);
int l9_130;
#if (Tweak_N10HasSwappedViews)
{
l9_130=1-sc_GetStereoViewIndex();
}
#else
{
l9_130=sc_GetStereoViewIndex();
}
#endif
bool l9_131=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N10)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N10)!=0));
float l9_132=l9_129.x;
sc_SoftwareWrapEarly(l9_132,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N10,SC_SOFTWARE_WRAP_MODE_V_Tweak_N10).x);
float l9_133=l9_132;
float l9_134=l9_129.y;
sc_SoftwareWrapEarly(l9_134,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N10,SC_SOFTWARE_WRAP_MODE_V_Tweak_N10).y);
float l9_135=l9_134;
vec2 l9_136;
float l9_137;
#if (SC_USE_UV_MIN_MAX_Tweak_N10)
{
bool l9_138;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N10)
{
l9_138=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N10,SC_SOFTWARE_WRAP_MODE_V_Tweak_N10).x==3;
}
#else
{
l9_138=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N10)!=0);
}
#endif
float l9_139=l9_133;
float l9_140=1.0;
sc_ClampUV(l9_139,Tweak_N10UvMinMax.x,Tweak_N10UvMinMax.z,l9_138,l9_140);
float l9_141=l9_139;
float l9_142=l9_140;
bool l9_143;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N10)
{
l9_143=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N10,SC_SOFTWARE_WRAP_MODE_V_Tweak_N10).y==3;
}
#else
{
l9_143=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N10)!=0);
}
#endif
float l9_144=l9_135;
float l9_145=l9_142;
sc_ClampUV(l9_144,Tweak_N10UvMinMax.y,Tweak_N10UvMinMax.w,l9_143,l9_145);
l9_137=l9_145;
l9_136=vec2(l9_141,l9_144);
}
#else
{
l9_137=1.0;
l9_136=vec2(l9_133,l9_135);
}
#endif
vec2 l9_146=sc_TransformUV(l9_136,(int(SC_USE_UV_TRANSFORM_Tweak_N10)!=0),Tweak_N10Transform);
float l9_147=l9_146.x;
float l9_148=l9_137;
sc_SoftwareWrapLate(l9_147,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N10,SC_SOFTWARE_WRAP_MODE_V_Tweak_N10).x,l9_131,l9_148);
float l9_149=l9_146.y;
float l9_150=l9_148;
sc_SoftwareWrapLate(l9_149,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N10,SC_SOFTWARE_WRAP_MODE_V_Tweak_N10).y,l9_131,l9_150);
float l9_151=l9_150;
vec3 l9_152=sc_SamplingCoordsViewToGlobal(vec2(l9_147,l9_149),Tweak_N10Layout,l9_130);
vec4 l9_153=texture2D(Tweak_N10,l9_152.xy,0.0);
vec4 l9_154;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N10)
{
l9_154=mix(Tweak_N10BorderColor,l9_153,vec4(l9_151));
}
#else
{
l9_154=l9_153;
}
#endif
vec3 l9_155=l9_128.xyz;
vec3 l9_156=mix(l9_155,(vec3(1.0)-((vec3(1.0)-l9_155)*(vec3(1.0)-l9_154.xyz))).xyz,vec3(l9_154.w));
vec4 l9_157=vec4(l9_156.x,l9_156.y,l9_156.z,vec4(0.0).w);
l9_157.w=l9_128.w;
l9_10=l9_157;
}
vec4 l9_158;
#if (sc_RenderAlphaToColor)
{
l9_158=vec4(l9_10.w);
}
#else
{
vec4 l9_159;
#if (sc_BlendMode_Custom)
{
vec4 l9_160;
#if (sc_FramebufferFetch)
{
vec4 l9_161=sc_readFragData0_Platform();
vec4 l9_162;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_163=l9_161;
l9_163.x=l9_161.x+_sc_framebufferFetchMarker;
l9_162=l9_163;
}
#else
{
l9_162=l9_161;
}
#endif
l9_160=l9_162;
}
#else
{
vec2 l9_164=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_165;
#if (sc_StereoRenderingMode==1)
{
vec3 l9_166=vec3(l9_164,0.0);
l9_166.y=((2.0*l9_164.y)+float(sc_GetStereoViewIndex()))-1.0;
l9_165=l9_166.xy;
}
#else
{
l9_165=l9_164;
}
#endif
int l9_167;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_167=1-sc_GetStereoViewIndex();
}
#else
{
l9_167=sc_GetStereoViewIndex();
}
#endif
l9_160=texture2D(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_165,sc_ScreenTextureLayout,l9_167).xy,0.0);
}
#endif
vec4 l9_168;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_169=l9_160;
l9_169.x=l9_160.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_168=l9_169;
}
#else
{
l9_168=l9_160;
}
#endif
vec3 l9_170=mix(l9_168.xyz,definedBlend(l9_168.xyz,l9_10.xyz).xyz,vec3(l9_10.w));
vec4 l9_171=vec4(l9_170.x,l9_170.y,l9_170.z,vec4(0.0).w);
l9_171.w=1.0;
l9_159=l9_171;
}
#else
{
vec4 l9_172;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_172=vec4(mix(vec3(1.0),l9_10.xyz,vec3(l9_10.w)),l9_10.w);
}
#else
{
vec4 l9_173;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_174;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_174=clamp(l9_10.w,0.0,1.0);
}
#else
{
l9_174=l9_10.w;
}
#endif
l9_173=vec4(l9_10.xyz*l9_174,l9_174);
}
#else
{
l9_173=l9_10;
}
#endif
l9_172=l9_173;
}
#endif
l9_159=l9_172;
}
#endif
l9_158=l9_159;
}
#endif
vec4 l9_175;
#if (sc_ShaderComplexityAnalyzer)
{
l9_175=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_175=vec4(0.0);
}
#endif
vec4 l9_176;
if (l9_175.w>0.0)
{
l9_176=l9_175;
}
else
{
l9_176=l9_158;
}
sc_writeFragData0Internal(l9_176,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
