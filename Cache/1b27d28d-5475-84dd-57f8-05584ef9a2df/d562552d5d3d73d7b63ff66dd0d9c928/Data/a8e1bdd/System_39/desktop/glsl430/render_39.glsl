#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler flipbookTexSmpSC 0:25
//sampler sampler intensityTextureSmpSC 0:26
//sampler sampler renderTarget0SmpSC 0:27
//sampler sampler renderTarget1SmpSC 0:28
//sampler sampler renderTarget2SmpSC 0:29
//sampler sampler renderTarget3SmpSC 0:30
//sampler sampler repelflipbookTexSmpSC 0:31
//sampler sampler sc_EnvmapDiffuseSmpSC 0:32
//sampler sampler sc_EnvmapSpecularSmpSC 0:33
//sampler sampler sc_RayTracedAoTextureSmpSC 0:35
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:36
//sampler sampler sc_RayTracedReflectionTextureSmpSC 0:37
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:38
//sampler sampler sc_SSAOTextureSmpSC 0:39
//sampler sampler sc_ScreenTextureSmpSC 0:40
//texture texture2D flipbookTex 0:0:0:25
//texture texture2D intensityTexture 0:1:0:26
//texture texture2D renderTarget0 0:2:0:27
//texture texture2D renderTarget1 0:3:0:28
//texture texture2D renderTarget2 0:4:0:29
//texture texture2D renderTarget3 0:5:0:30
//texture texture2D repelflipbookTex 0:6:0:31
//texture texture2D sc_EnvmapDiffuse 0:7:0:32
//texture texture2D sc_EnvmapSpecular 0:8:0:33
//texture texture2D sc_RayTracedAoTexture 0:17:0:35
//texture texture2D sc_RayTracedDiffIndTexture 0:18:0:36
//texture texture2D sc_RayTracedReflectionTexture 0:19:0:37
//texture texture2D sc_RayTracedShadowTexture 0:20:0:38
//texture texture2D sc_SSAOTexture 0:21:0:39
//texture texture2D sc_ScreenTexture 0:22:0:40
//texture texture2DArray flipbookTexArrSC 0:43:0:25
//texture texture2DArray intensityTextureArrSC 0:44:0:26
//texture texture2DArray renderTarget0ArrSC 0:45:0:27
//texture texture2DArray renderTarget1ArrSC 0:46:0:28
//texture texture2DArray renderTarget2ArrSC 0:47:0:29
//texture texture2DArray renderTarget3ArrSC 0:48:0:30
//texture texture2DArray repelflipbookTexArrSC 0:49:0:31
//texture texture2DArray sc_EnvmapDiffuseArrSC 0:50:0:32
//texture texture2DArray sc_EnvmapSpecularArrSC 0:51:0:33
//texture texture2DArray sc_RayTracedAoTextureArrSC 0:52:0:35
//texture texture2DArray sc_RayTracedDiffIndTextureArrSC 0:53:0:36
//texture texture2DArray sc_RayTracedReflectionTextureArrSC 0:54:0:37
//texture texture2DArray sc_RayTracedShadowTextureArrSC 0:55:0:38
//texture texture2DArray sc_ScreenTextureArrSC 0:56:0:40
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_flipbookTex 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_repelflipbookTex 34 0
//spec_const bool SC_USE_UV_MIN_MAX_flipbookTex 35 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 36 0
//spec_const bool SC_USE_UV_MIN_MAX_repelflipbookTex 37 0
//spec_const bool SC_USE_UV_TRANSFORM_flipbookTex 38 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 39 0
//spec_const bool SC_USE_UV_TRANSFORM_repelflipbookTex 40 0
//spec_const bool Tweak_N248 41 0
//spec_const bool Tweak_N261 42 0
//spec_const bool flipbookTexHasSwappedViews 43 0
//spec_const bool intensityTextureHasSwappedViews 44 0
//spec_const bool renderTarget0HasSwappedViews 45 0
//spec_const bool renderTarget1HasSwappedViews 46 0
//spec_const bool renderTarget2HasSwappedViews 47 0
//spec_const bool renderTarget3HasSwappedViews 48 0
//spec_const bool repelflipbookTexHasSwappedViews 49 0
//spec_const bool sc_BlendMode_ColoredGlass 50 0
//spec_const bool sc_BlendMode_Custom 51 0
//spec_const bool sc_BlendMode_Multiply 52 0
//spec_const bool sc_BlendMode_MultiplyOriginal 53 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 54 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 55 0
//spec_const bool sc_BlendMode_Screen 56 0
//spec_const bool sc_BlendMode_Software 57 0
//spec_const bool sc_CanUseTextureLod 58 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 59 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 60 0
//spec_const bool sc_FramebufferFetch 61 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 62 0
//spec_const bool sc_HasDiffuseEnvmap 63 0
//spec_const bool sc_IsEditor 64 0
//spec_const bool sc_LightEstimation 65 0
//spec_const bool sc_MotionVectorsPass 66 0
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 67 0
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 68 0
//spec_const bool sc_RayTracedReflectionTextureHasSwappedViews 69 0
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 70 0
//spec_const bool sc_RenderAlphaToColor 71 0
//spec_const bool sc_SSAOEnabled 72 0
//spec_const bool sc_ScreenTextureHasSwappedViews 73 0
//spec_const bool sc_ShaderComplexityAnalyzer 74 0
//spec_const bool sc_UseFramebufferFetchMarker 75 0
//spec_const int NODE_243_DROPLIST_ITEM 76 0
//spec_const int SC_DEVICE_CLASS 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_flipbookTex 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 79 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex 80 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_flipbookTex 81 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 82 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex 83 -1
//spec_const int flipbookTexLayout 84 0
//spec_const int intensityTextureLayout 85 0
//spec_const int renderTarget0Layout 86 0
//spec_const int renderTarget1Layout 87 0
//spec_const int renderTarget2Layout 88 0
//spec_const int renderTarget3Layout 89 0
//spec_const int repelflipbookTexLayout 90 0
//spec_const int sc_AmbientLightMode0 91 0
//spec_const int sc_AmbientLightMode1 92 0
//spec_const int sc_AmbientLightMode2 93 0
//spec_const int sc_AmbientLightMode_Constant 94 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 95 0
//spec_const int sc_AmbientLightMode_FromCamera 96 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 97 0
//spec_const int sc_AmbientLightsCount 98 0
//spec_const int sc_DepthBufferMode 99 0
//spec_const int sc_DirectionalLightsCount 100 0
//spec_const int sc_EnvLightMode 101 0
//spec_const int sc_EnvmapDiffuseLayout 102 0
//spec_const int sc_EnvmapSpecularLayout 103 0
//spec_const int sc_LightEstimationSGCount 104 0
//spec_const int sc_MaxTextureImageUnits 105 0
//spec_const int sc_PointLightsCount 106 0
//spec_const int sc_RayTracedAoTextureLayout 107 0
//spec_const int sc_RayTracedDiffIndTextureLayout 108 0
//spec_const int sc_RayTracedReflectionTextureLayout 109 0
//spec_const int sc_RayTracedShadowTextureLayout 110 0
//spec_const int sc_ScreenTextureLayout 111 0
//spec_const int sc_ShaderCacheConstant 112 0
//spec_const int sc_StereoRenderingMode 113 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 114 0
//spec_const int sc_StereoViewID 115 0
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
uniform float velocityStretch;
uniform int vfxNumCopies;
uniform float Port_RangeMinA_N171;
uniform float Port_RangeMaxA_N171;
uniform float Port_RangeMaxB_N171;
uniform float Port_RangeMinB_N171;
uniform sampler2D renderTarget0;
uniform sampler2DArray renderTarget0ArrSC;
uniform sampler2D renderTarget1;
uniform sampler2DArray renderTarget1ArrSC;
uniform sampler2D renderTarget2;
uniform sampler2DArray renderTarget2ArrSC;
uniform sampler2D renderTarget3;
uniform sampler2DArray renderTarget3ArrSC;
out float varClipDistance;
flat out int varStereoViewID;
in vec4 position;
in vec3 normal;
in vec4 tangent;
in vec2 texture0;
in vec2 texture1;
out vec3 varPos;
out vec3 varNormal;
out vec4 varTangent;
out vec4 varPackedTex;
out vec4 varScreenPos;
out vec2 varScreenTexturePos;
flat out int Interp_Particle_Index;
out vec3 Interp_Particle_Force;
out vec3 Interp_Particle_Position;
out vec3 Interp_Particle_Velocity;
out float Interp_Particle_Life;
out float Interp_Particle_Age;
out float Interp_Particle_Size;
out vec4 Interp_Particle_Color;
out vec4 Interp_Particle_Quaternion;
out float Interp_Particle_Mass;
out vec2 varShadowTex;
out vec4 varColor;
out vec2 Interp_Particle_Coord;
out float Interp_Particle_SpawnIndex;
out float Interp_Particle_NextBurstTime;
out float gParticlesDebug;
out vec2 ParticleUV;
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
varStereoViewID=sc_StereoViewID;
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
vec4 l9_1;
#if (renderTarget0Layout==2)
{
float l9_2=level_;
vec3 l9_3=sc_SamplingCoordsViewToGlobal(uv,renderTarget0Layout,viewIndex);
vec4 l9_4;
#if (sc_CanUseTextureLod)
{
l9_4=textureLod(renderTarget0ArrSC,l9_3,l9_2);
}
#else
{
l9_4=vec4(0.0);
}
#endif
l9_1=l9_4;
}
#else
{
l9_1=textureLod(renderTarget0,sc_SamplingCoordsViewToGlobal(uv,renderTarget0Layout,viewIndex).xy,level_);
}
#endif
l9_0=l9_1;
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
vec4 l9_1;
#if (renderTarget1Layout==2)
{
float l9_2=level_;
vec3 l9_3=sc_SamplingCoordsViewToGlobal(uv,renderTarget1Layout,viewIndex);
vec4 l9_4;
#if (sc_CanUseTextureLod)
{
l9_4=textureLod(renderTarget1ArrSC,l9_3,l9_2);
}
#else
{
l9_4=vec4(0.0);
}
#endif
l9_1=l9_4;
}
#else
{
l9_1=textureLod(renderTarget1,sc_SamplingCoordsViewToGlobal(uv,renderTarget1Layout,viewIndex).xy,level_);
}
#endif
l9_0=l9_1;
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
vec4 l9_1;
#if (renderTarget2Layout==2)
{
float l9_2=level_;
vec3 l9_3=sc_SamplingCoordsViewToGlobal(uv,renderTarget2Layout,viewIndex);
vec4 l9_4;
#if (sc_CanUseTextureLod)
{
l9_4=textureLod(renderTarget2ArrSC,l9_3,l9_2);
}
#else
{
l9_4=vec4(0.0);
}
#endif
l9_1=l9_4;
}
#else
{
l9_1=textureLod(renderTarget2,sc_SamplingCoordsViewToGlobal(uv,renderTarget2Layout,viewIndex).xy,level_);
}
#endif
l9_0=l9_1;
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
vec4 l9_1;
#if (renderTarget3Layout==2)
{
float l9_2=level_;
vec3 l9_3=sc_SamplingCoordsViewToGlobal(uv,renderTarget3Layout,viewIndex);
vec4 l9_4;
#if (sc_CanUseTextureLod)
{
l9_4=textureLod(renderTarget3ArrSC,l9_3,l9_2);
}
#else
{
l9_4=vec4(0.0);
}
#endif
l9_1=l9_4;
}
#else
{
l9_1=textureLod(renderTarget3,sc_SamplingCoordsViewToGlobal(uv,renderTarget3Layout,viewIndex).xy,level_);
}
#endif
l9_0=l9_1;
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
int l9_0=InstanceID;
int l9_1=l9_0/1600;
int l9_2=l9_0%1600;
float l9_3=float(l9_2);
ivec2 l9_4=ivec2(l9_0%512,l9_0/512);
float l9_5=float(l9_0);
vec2 l9_6=vec2(l9_4);
float l9_7=l9_5/1599.0;
float l9_8=l9_7*8.0;
float l9_9;
if (overrideTimeEnabled==1)
{
l9_9=overrideTimeElapsed[l9_1];
}
else
{
l9_9=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,l9_8,fract(abs(((l9_7*0.97637898)+0.151235)+(floor(((((l9_9-l9_8)-0.0)+0.0)+16.0)/8.0)*4.32723))),(vec2(ivec2(l9_0%400,l9_0/400))+vec2(1.0))/vec2(399.0),float(((l9_0*((l9_0*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,l9_0,l9_2,l9_3,(1600*(l9_1+1))-1,(l9_5+0.5)/1600.0,l9_7,l9_3/1599.0,l9_4,(l9_6+vec2(0.5))/vec2(512.0,4.0),l9_6/vec2(511.0,3.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
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
l9_17=!vfxBatchEnable[sc_GetLocalInstanceID()/1600];
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
float l9_21=8.0-0.0;
gParticle.Life=0.0+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_20,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_19);
gParticle.Age=0.0+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_20,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_21)/l9_19);
vec2 l9_22=l9_13+vec2(0.0009765625,0.0);
gParticle.Size=0.0+(((DecodeFloat32(renderTarget0SampleViewIndexBias(l9_22,renderTarget0GetStereoViewIndex(),0.0),true)-0.0)*(100.0-0.0))/l9_19);
float l9_23=1.00001-0.0;
gParticle.Color.x=0.0+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_22,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*l9_23)/l9_19);
gParticle.Color.y=0.0+(((DecodeFloat32(renderTarget2SampleViewIndexBias(l9_22,renderTarget2GetStereoViewIndex(),0.0),true)-0.0)*l9_23)/l9_19);
gParticle.Color.z=0.0+(((DecodeFloat32(renderTarget3SampleViewIndexBias(l9_22,renderTarget3GetStereoViewIndex(),0.0),true)-0.0)*l9_23)/l9_19);
vec2 l9_24=l9_13+vec2(0.0014648438,0.0);
vec4 l9_25=renderTarget2SampleViewIndexBias(l9_24,renderTarget2GetStereoViewIndex(),0.0);
vec4 l9_26=renderTarget3SampleViewIndexBias(l9_24,renderTarget3GetStereoViewIndex(),0.0);
gParticle.Color.w=0.0+(((DecodeFloat32(renderTarget0SampleViewIndexBias(l9_24,renderTarget0GetStereoViewIndex(),0.0),true)-0.0)*l9_23)/l9_19);
gParticle.Mass=0.0+(((DecodeFloat32(renderTarget1SampleViewIndexBias(l9_24,renderTarget1GetStereoViewIndex(),0.0),true)-0.0)*(1000.0-0.0))/l9_19);
float l9_27=1.0-(-1.0);
gParticle.Quaternion.x=(-1.0)+(((DecodeFloat16(vec2(l9_25.xy),true)-0.0)*l9_27)/l9_19);
gParticle.Quaternion.y=(-1.0)+(((DecodeFloat16(vec2(l9_25.zw),true)-0.0)*l9_27)/l9_19);
gParticle.Quaternion.z=(-1.0)+(((DecodeFloat16(vec2(l9_26.xy),true)-0.0)*l9_27)/l9_19);
gParticle.Quaternion.w=(-1.0)+(((DecodeFloat16(vec2(l9_26.zw),true)-0.0)*l9_27)/l9_19);
vec4 l9_28=normalize(gParticle.Quaternion.yzwx);
float l9_29=l9_28.x;
float l9_30=l9_29*l9_29;
float l9_31=l9_28.y;
float l9_32=l9_31*l9_31;
float l9_33=l9_28.z;
float l9_34=l9_33*l9_33;
float l9_35=l9_29*l9_33;
float l9_36=l9_29*l9_31;
float l9_37=l9_31*l9_33;
float l9_38=l9_28.w;
float l9_39=l9_38*l9_29;
float l9_40=l9_38*l9_31;
float l9_41=l9_38*l9_33;
gParticle.Matrix=mat3(vec3(1.0-(2.0*(l9_32+l9_34)),2.0*(l9_36+l9_41),2.0*(l9_35-l9_40)),vec3(2.0*(l9_36-l9_41),1.0-(2.0*(l9_30+l9_34)),2.0*(l9_37+l9_39)),vec3(2.0*(l9_35+l9_40),2.0*(l9_37-l9_39),1.0-(2.0*(l9_30+l9_32))));
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
bool l9_3=l9_2>=(1600*(vfxNumCopies+1));
bool l9_4;
if (!l9_3)
{
l9_4=vfxBatchEnable[sc_GetLocalInstanceID()/1600]==false;
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
varPos=gParticle.Position+(gParticle.Matrix*vec3(l9_0.x*gParticle.Size,l9_0.y*gParticle.Size,0.0));
varNormal=gParticle.Matrix*vec3(0.0,0.0,1.0);
vec3 l9_9=gParticle.Matrix*vec3(1.0,0.0,0.0);
varTangent=vec4(l9_9.x,l9_9.y,l9_9.z,varTangent.w);
varTangent.w=1.0;
varPackedTex=vec4(texture0,texture1);
vec3 l9_10=gParticle.Velocity;
float l9_11=length(l9_10);
vec3 l9_12=gParticle.Velocity;
vec3 l9_13;
if (l9_11<0.029999999)
{
l9_13=vec3(0.0,0.0,1.0);
}
else
{
l9_13=normalize(l9_12);
}
vec3 l9_14=normalize(cross(vec3(0.0,1.0,0.0),l9_13));
vec3 l9_15=normalize(cross(l9_14,l9_13));
vec3 l9_16=normalize(cross(l9_15,l9_14));
vec4 l9_17=mat4(vec4(gParticle.Matrix[0].x,gParticle.Matrix[0].y,gParticle.Matrix[0].z,0.0),vec4(gParticle.Matrix[1].x,gParticle.Matrix[1].y,gParticle.Matrix[1].z,0.0),vec4(gParticle.Matrix[2].x,gParticle.Matrix[2].y,gParticle.Matrix[2].z,0.0),vec4(0.0,0.0,0.0,1.0))*vec4(texture0-vec2(0.5),0.0,1.0);
varPos=(gParticle.Position+((-l9_15)*(gParticle.Size*l9_17.x)))+(l9_16*((gParticle.Size*l9_17.y)*max(l9_11*((((velocityStretch-Port_RangeMinA_N171)/((Port_RangeMaxA_N171-Port_RangeMinA_N171)+1e-06))*(Port_RangeMaxB_N171-Port_RangeMinB_N171))+Port_RangeMinB_N171),1.0)));
varTangent=vec4(l9_16.x,l9_16.y,l9_16.z,varTangent.w);
varNormal=l9_14;
vec4 l9_18=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
vec4 l9_19;
#if (sc_DepthBufferMode==1)
{
vec4 l9_20;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
float l9_21=l9_18.w;
vec4 l9_22=l9_18;
l9_22.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_21))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_21;
l9_20=l9_22;
}
else
{
l9_20=l9_18;
}
l9_19=l9_20;
}
#else
{
l9_19=l9_18;
}
#endif
sc_SetClipPosition(l9_19);
Interp_Particle_Index=sc_GetLocalInstanceID();
Interp_Particle_Force=gParticle.Force;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Quaternion=gParticle.Quaternion;
Interp_Particle_Mass=gParticle.Mass;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#if SC_RT_RECEIVER_MODE
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
vec3 BumpedNormal;
vec3 ViewDirWS;
vec3 PositionWS;
vec3 VertexTangent_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
float gComponentTime;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
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
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
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
#ifndef Tweak_N261
#define Tweak_N261 0
#elif Tweak_N261==1
#undef Tweak_N261
#define Tweak_N261 1
#endif
#ifndef Tweak_N248
#define Tweak_N248 0
#elif Tweak_N248==1
#undef Tweak_N248
#define Tweak_N248 1
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
#ifndef NODE_243_DROPLIST_ITEM
#define NODE_243_DROPLIST_ITEM 0
#endif
uniform sc_Camera_t sc_Camera;
uniform vec3 OriginNormalizationOffset;
uniform vec3 OriginNormalizationScale;
uniform float receiver_mask;
uniform int receiverId;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed[32];
uniform vec4 sc_Time;
uniform bool isIdle;
uniform mat3 flipbookTexTransform;
uniform vec4 flipbookTexUvMinMax;
uniform vec4 flipbookTexBorderColor;
uniform bool isAttracting;
uniform mat3 repelflipbookTexTransform;
uniform vec4 repelflipbookTexUvMinMax;
uniform vec4 repelflipbookTexBorderColor;
uniform float Port_Rotation_N159;
uniform vec2 Port_Center_N159;
uniform float Port_RangeMinA_N156;
uniform float Port_RangeMaxA_N156;
uniform float Port_RangeMaxB_N156;
uniform float Port_RangeMinB_N156;
uniform vec2 Port_SpriteCount_N045;
uniform float Port_MaxFrames_N045;
uniform float Port_SecondOffset_N045;
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
uniform float Port_Roughness_N258;
uniform float overrideTimeDelta;
uniform sampler2DArray flipbookTexArrSC;
uniform sampler2D flipbookTex;
uniform sampler2DArray repelflipbookTexArrSC;
uniform sampler2D repelflipbookTex;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
layout(location=0) out uvec4 position_and_mask;
layout(location=1) out uvec4 normal_and_more;
flat in int Interp_Particle_Index;
in vec4 varPackedTex;
in vec3 varNormal;
in vec4 varTangent;
in vec3 Interp_Particle_Position;
in vec3 Interp_Particle_Velocity;
in float Interp_Particle_Life;
in float Interp_Particle_Age;
in float Interp_Particle_Size;
in vec4 Interp_Particle_Color;
in vec4 Interp_Particle_Quaternion;
in float Interp_Particle_Mass;
in vec3 varPos;
in vec4 varScreenPos;
in vec2 varScreenTexturePos;
in vec4 varColor;
in vec3 Interp_Particle_Force;
in vec2 Interp_Particle_Coord;
in float Interp_Particle_SpawnIndex;
in float Interp_Particle_NextBurstTime;
in float gParticlesDebug;
in vec2 ParticleUV;
ssParticle gParticle;
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=varStereoViewID;
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
void Node159_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
int flipbookTexGetStereoViewIndex()
{
int l9_0;
#if (flipbookTexHasSwappedViews)
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
void Node45_Flipbook_Sample(vec2 SpriteCount,float MaxFrames,vec2 UVCoord,float FrameOffset,float Speed,float SecondOffset,out vec4 Color,ssGlobals Globals)
{
float l9_0=SpriteCount.x;
float l9_1=floor(l9_0);
float l9_2=SpriteCount.y;
float l9_3=floor(l9_2);
float l9_4=1.0/l9_1;
float l9_5=1.0/l9_3;
float l9_6=MaxFrames;
float l9_7=Globals.gTimeElapsedShifted;
float l9_8=SecondOffset;
float l9_9=Speed;
float l9_10=FrameOffset;
float l9_11=floor(mod(((l9_7+l9_8)*l9_9)+floor(l9_10),min(l9_1*l9_3,floor(l9_6))));
float l9_12=UVCoord.x;
float l9_13=(l9_4*l9_12)+(mod(l9_11,l9_1)*l9_4);
float l9_14=UVCoord.y;
float l9_15=((1.0-l9_5)-(floor(l9_11/l9_1)*l9_5))+(l9_5*l9_14);
vec4 l9_16;
#if (flipbookTexLayout==2)
{
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_flipbookTex)!=0));
float l9_18=l9_13;
sc_SoftwareWrapEarly(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x);
float l9_19=l9_18;
float l9_20=l9_15;
sc_SoftwareWrapEarly(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y);
float l9_21=l9_20;
vec2 l9_22;
float l9_23;
#if (SC_USE_UV_MIN_MAX_flipbookTex)
{
bool l9_24;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_24=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x==3;
}
#else
{
l9_24=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_25=l9_19;
float l9_26=1.0;
sc_ClampUV(l9_25,flipbookTexUvMinMax.x,flipbookTexUvMinMax.z,l9_24,l9_26);
float l9_27=l9_25;
float l9_28=l9_26;
bool l9_29;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_29=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y==3;
}
#else
{
l9_29=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_30=l9_21;
float l9_31=l9_28;
sc_ClampUV(l9_30,flipbookTexUvMinMax.y,flipbookTexUvMinMax.w,l9_29,l9_31);
l9_23=l9_31;
l9_22=vec2(l9_27,l9_30);
}
#else
{
l9_23=1.0;
l9_22=vec2(l9_19,l9_21);
}
#endif
vec2 l9_32=sc_TransformUV(l9_22,(int(SC_USE_UV_TRANSFORM_flipbookTex)!=0),flipbookTexTransform);
float l9_33=l9_32.x;
float l9_34=l9_23;
sc_SoftwareWrapLate(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x,l9_17,l9_34);
float l9_35=l9_32.y;
float l9_36=l9_34;
sc_SoftwareWrapLate(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y,l9_17,l9_36);
float l9_37=l9_36;
vec3 l9_38=sc_SamplingCoordsViewToGlobal(vec2(l9_33,l9_35),flipbookTexLayout,flipbookTexGetStereoViewIndex());
vec4 l9_39=texture(flipbookTexArrSC,l9_38,0.0);
vec4 l9_40;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_40=mix(flipbookTexBorderColor,l9_39,vec4(l9_37));
}
#else
{
l9_40=l9_39;
}
#endif
l9_16=l9_40;
}
#else
{
bool l9_41=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_flipbookTex)!=0));
float l9_42=l9_13;
sc_SoftwareWrapEarly(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x);
float l9_43=l9_42;
float l9_44=l9_15;
sc_SoftwareWrapEarly(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y);
float l9_45=l9_44;
vec2 l9_46;
float l9_47;
#if (SC_USE_UV_MIN_MAX_flipbookTex)
{
bool l9_48;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_48=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x==3;
}
#else
{
l9_48=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_49=l9_43;
float l9_50=1.0;
sc_ClampUV(l9_49,flipbookTexUvMinMax.x,flipbookTexUvMinMax.z,l9_48,l9_50);
float l9_51=l9_49;
float l9_52=l9_50;
bool l9_53;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_53=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y==3;
}
#else
{
l9_53=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_54=l9_45;
float l9_55=l9_52;
sc_ClampUV(l9_54,flipbookTexUvMinMax.y,flipbookTexUvMinMax.w,l9_53,l9_55);
l9_47=l9_55;
l9_46=vec2(l9_51,l9_54);
}
#else
{
l9_47=1.0;
l9_46=vec2(l9_43,l9_45);
}
#endif
vec2 l9_56=sc_TransformUV(l9_46,(int(SC_USE_UV_TRANSFORM_flipbookTex)!=0),flipbookTexTransform);
float l9_57=l9_56.x;
float l9_58=l9_47;
sc_SoftwareWrapLate(l9_57,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x,l9_41,l9_58);
float l9_59=l9_56.y;
float l9_60=l9_58;
sc_SoftwareWrapLate(l9_59,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y,l9_41,l9_60);
float l9_61=l9_60;
vec3 l9_62=sc_SamplingCoordsViewToGlobal(vec2(l9_57,l9_59),flipbookTexLayout,flipbookTexGetStereoViewIndex());
vec4 l9_63=texture(flipbookTex,l9_62.xy,0.0);
vec4 l9_64;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_64=mix(flipbookTexBorderColor,l9_63,vec4(l9_61));
}
#else
{
l9_64=l9_63;
}
#endif
l9_16=l9_64;
}
#endif
Color=l9_16;
}
vec2 encode_direction(vec3 d)
{
d/=vec3(dot(abs(d),vec3(1.0)));
float l9_0=d.z;
float l9_1=clamp(-l9_0,0.0,1.0);
vec3 l9_2=d;
float l9_3;
if (d.x>=0.0)
{
l9_3=l9_1;
}
else
{
l9_3=-l9_1;
}
float l9_4=l9_2.x+l9_3;
float l9_5;
if (d.y>=0.0)
{
l9_5=l9_1;
}
else
{
l9_5=-l9_1;
}
return vec2(l9_4,l9_2.y+l9_5);
}
void sc_WriteReceiverData(vec3 positionWS,vec3 normalWS,float roughness)
{
if (dot(normalize(sc_Camera.position-positionWS),normalWS)>=(-0.050000001))
{
uvec3 l9_0=uvec3(round((positionWS-OriginNormalizationOffset)*OriginNormalizationScale));
position_and_mask=uvec4(l9_0.x,l9_0.y,l9_0.z,position_and_mask.w);
position_and_mask.w=uint(receiver_mask);
vec2 l9_1=encode_direction(normalWS);
uvec2 l9_2=uvec2(packHalf2x16(vec2(l9_1.x,0.0)),packHalf2x16(vec2(l9_1.y,0.0)));
normal_and_more=uvec4(l9_2.x,l9_2.y,normal_and_more.z,normal_and_more.w);
normal_and_more.z=packHalf2x16(vec2(0.0));
uint l9_3;
if (roughness<0.0)
{
l9_3=1023u;
}
else
{
l9_3=uint(clamp(roughness,0.0,1.0)*1000.0);
}
normal_and_more.w=l9_3|uint((receiverId%32)<<int(10u));
}
else
{
position_and_mask=uvec4(0u);
normal_and_more=uvec4(0u);
}
}
void Node26_PBR_Lighting(vec3 Albedo,float Opacity,vec3 Normal,vec3 Emissive,float Metallic,float Roughness,vec3 AO,vec3 SpecularAO,out vec4 Output,ssGlobals Globals)
{
Globals.BumpedNormal=mat3(Globals.VertexTangent_WorldSpace,Globals.VertexBinormal_WorldSpace,Globals.VertexNormal_WorldSpace)*Normal;
Opacity=clamp(Opacity,0.0,1.0);
sc_WriteReceiverData(Globals.PositionWS,Globals.BumpedNormal,Roughness);
}
int repelflipbookTexGetStereoViewIndex()
{
int l9_0;
#if (repelflipbookTexHasSwappedViews)
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
void Node167_Flipbook_Sample(vec2 SpriteCount,float MaxFrames,vec2 UVCoord,float FrameOffset,float Speed,float SecondOffset,out vec4 Color,ssGlobals Globals)
{
float l9_0=SpriteCount.x;
float l9_1=floor(l9_0);
float l9_2=SpriteCount.y;
float l9_3=floor(l9_2);
float l9_4=1.0/l9_1;
float l9_5=1.0/l9_3;
float l9_6=MaxFrames;
float l9_7=Globals.gTimeElapsedShifted;
float l9_8=SecondOffset;
float l9_9=Speed;
float l9_10=FrameOffset;
float l9_11=floor(mod(((l9_7+l9_8)*l9_9)+floor(l9_10),min(l9_1*l9_3,floor(l9_6))));
float l9_12=UVCoord.x;
float l9_13=(l9_4*l9_12)+(mod(l9_11,l9_1)*l9_4);
float l9_14=UVCoord.y;
float l9_15=((1.0-l9_5)-(floor(l9_11/l9_1)*l9_5))+(l9_5*l9_14);
vec4 l9_16;
#if (repelflipbookTexLayout==2)
{
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_repelflipbookTex)!=0));
float l9_18=l9_13;
sc_SoftwareWrapEarly(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x);
float l9_19=l9_18;
float l9_20=l9_15;
sc_SoftwareWrapEarly(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y);
float l9_21=l9_20;
vec2 l9_22;
float l9_23;
#if (SC_USE_UV_MIN_MAX_repelflipbookTex)
{
bool l9_24;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_24=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x==3;
}
#else
{
l9_24=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_25=l9_19;
float l9_26=1.0;
sc_ClampUV(l9_25,repelflipbookTexUvMinMax.x,repelflipbookTexUvMinMax.z,l9_24,l9_26);
float l9_27=l9_25;
float l9_28=l9_26;
bool l9_29;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_29=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y==3;
}
#else
{
l9_29=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_30=l9_21;
float l9_31=l9_28;
sc_ClampUV(l9_30,repelflipbookTexUvMinMax.y,repelflipbookTexUvMinMax.w,l9_29,l9_31);
l9_23=l9_31;
l9_22=vec2(l9_27,l9_30);
}
#else
{
l9_23=1.0;
l9_22=vec2(l9_19,l9_21);
}
#endif
vec2 l9_32=sc_TransformUV(l9_22,(int(SC_USE_UV_TRANSFORM_repelflipbookTex)!=0),repelflipbookTexTransform);
float l9_33=l9_32.x;
float l9_34=l9_23;
sc_SoftwareWrapLate(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x,l9_17,l9_34);
float l9_35=l9_32.y;
float l9_36=l9_34;
sc_SoftwareWrapLate(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y,l9_17,l9_36);
float l9_37=l9_36;
vec3 l9_38=sc_SamplingCoordsViewToGlobal(vec2(l9_33,l9_35),repelflipbookTexLayout,repelflipbookTexGetStereoViewIndex());
vec4 l9_39=texture(repelflipbookTexArrSC,l9_38,0.0);
vec4 l9_40;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_40=mix(repelflipbookTexBorderColor,l9_39,vec4(l9_37));
}
#else
{
l9_40=l9_39;
}
#endif
l9_16=l9_40;
}
#else
{
bool l9_41=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_repelflipbookTex)!=0));
float l9_42=l9_13;
sc_SoftwareWrapEarly(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x);
float l9_43=l9_42;
float l9_44=l9_15;
sc_SoftwareWrapEarly(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y);
float l9_45=l9_44;
vec2 l9_46;
float l9_47;
#if (SC_USE_UV_MIN_MAX_repelflipbookTex)
{
bool l9_48;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_48=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x==3;
}
#else
{
l9_48=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_49=l9_43;
float l9_50=1.0;
sc_ClampUV(l9_49,repelflipbookTexUvMinMax.x,repelflipbookTexUvMinMax.z,l9_48,l9_50);
float l9_51=l9_49;
float l9_52=l9_50;
bool l9_53;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_53=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y==3;
}
#else
{
l9_53=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_54=l9_45;
float l9_55=l9_52;
sc_ClampUV(l9_54,repelflipbookTexUvMinMax.y,repelflipbookTexUvMinMax.w,l9_53,l9_55);
l9_47=l9_55;
l9_46=vec2(l9_51,l9_54);
}
#else
{
l9_47=1.0;
l9_46=vec2(l9_43,l9_45);
}
#endif
vec2 l9_56=sc_TransformUV(l9_46,(int(SC_USE_UV_TRANSFORM_repelflipbookTex)!=0),repelflipbookTexTransform);
float l9_57=l9_56.x;
float l9_58=l9_47;
sc_SoftwareWrapLate(l9_57,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x,l9_41,l9_58);
float l9_59=l9_56.y;
float l9_60=l9_58;
sc_SoftwareWrapLate(l9_59,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y,l9_41,l9_60);
float l9_61=l9_60;
vec3 l9_62=sc_SamplingCoordsViewToGlobal(vec2(l9_57,l9_59),repelflipbookTexLayout,repelflipbookTexGetStereoViewIndex());
vec4 l9_63=texture(repelflipbookTex,l9_62.xy,0.0);
vec4 l9_64;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_64=mix(repelflipbookTexBorderColor,l9_63,vec4(l9_61));
}
#else
{
l9_64=l9_63;
}
#endif
l9_16=l9_64;
}
#endif
Color=l9_16;
}
void Node275_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
#if (Tweak_N248)
{
vec2 param_3;
Node159_Rotate_Coords(Globals.Surface_UVCoord0,Port_Rotation_N159,Port_Center_N159,param_3,Globals);
vec4 param_11;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,param_3,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_11,Globals);
Input1=param_11;
Output=Input1;
}
#else
{
vec2 param_16;
Node159_Rotate_Coords(Globals.Surface_UVCoord0,Port_Rotation_N159,Port_Center_N159,param_16,Globals);
vec4 param_24;
Node167_Flipbook_Sample(Port_SpriteCount_N167,Port_MaxFrames_N167,param_16,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N167,param_24,Globals);
Input2=param_24;
Output=Input2;
}
#endif
}
void Node240_Switch(float Switch,float Value0,float Value1,float Value2,float Value3,float Default,out float Result,ssGlobals Globals)
{
#if (NODE_243_DROPLIST_ITEM==0)
{
vec4 param_3;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_3,Globals);
Value0=param_3.x;
Result=Value0;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==1)
{
vec4 param_8;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_8,Globals);
Value1=param_8.y;
Result=Value1;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==2)
{
vec4 param_13;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_13,Globals);
Value2=param_13.z;
Result=Value2;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==3)
{
vec4 param_18;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_18,Globals);
Value3=param_18.w;
Result=Value3;
}
#else
{
vec4 param_23;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_23,Globals);
Default=param_23.w;
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
void Node11_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if ((Input0*1.0)!=0.0)
{
vec2 param_3;
Node159_Rotate_Coords(Globals.Surface_UVCoord0,Port_Rotation_N159,Port_Center_N159,param_3,Globals);
vec4 param_11;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,param_3,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_11,Globals);
vec4 l9_0=param_11;
vec2 l9_1=Globals.Surface_UVCoord0;
vec2 l9_2=(l9_1*Port_Input1_N031)-vec2(1.0);
float l9_3=1.0-(clamp(dot(l9_2,l9_2)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001)-0.001);
float l9_4;
if (l9_3<=0.0)
{
l9_4=0.0;
}
else
{
l9_4=sqrt(l9_3);
}
vec3 l9_5=vec3(l9_2.x,l9_2.y,vec3(0.0).z);
l9_5.z=l9_4;
vec4 param_21;
Node26_PBR_Lighting(l9_0.xyz,l9_0.w*gParticle.Color.w,mix(Port_Input0_N038,l9_5,vec3(float(distance(l9_1,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N026,Port_Metallic_N026,Port_Roughness_N026,Port_AO_N026,Port_SpecularAO_N026,param_21,Globals);
Input1=param_21;
Output=Input1;
}
else
{
ssGlobals l9_6=Globals;
#if (Tweak_N261)
{
float l9_7;
Node240_Switch(0.0,0.0,0.0,0.0,0.0,0.0,l9_7,l9_6);
}
#else
{
float l9_8;
Node240_Switch(0.0,0.0,0.0,0.0,0.0,0.0,l9_8,l9_6);
}
#endif
vec4 param_26;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_26,Globals);
vec2 l9_9=Globals.Surface_UVCoord0;
vec2 l9_10=(l9_9*Port_Input1_N031)-vec2(1.0);
float l9_11=1.0-(clamp(dot(l9_10,l9_10)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001)-0.001);
float l9_12;
if (l9_11<=0.0)
{
l9_12=0.0;
}
else
{
l9_12=sqrt(l9_11);
}
vec3 l9_13=vec3(l9_10.x,l9_10.y,vec3(0.0).z);
l9_13.z=l9_12;
sc_WriteReceiverData(Globals.PositionWS,mat3(Globals.VertexTangent_WorldSpace,Globals.VertexBinormal_WorldSpace,Globals.VertexNormal_WorldSpace)*mix(Port_Input0_N038,l9_13,vec3(float(distance(l9_9,Port_Input1_N035)<Port_Input1_N036))),Port_Roughness_N258);
Output=Input2;
}
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
#if (renderTarget0Layout==2)
{
}
#else
{
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
#if (renderTarget1Layout==2)
{
}
#else
{
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
#if (renderTarget2Layout==2)
{
}
#else
{
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
#if (renderTarget3Layout==2)
{
}
#else
{
}
#endif
gParticle.Position=Interp_Particle_Position;
gParticle.Velocity=Interp_Particle_Velocity;
gParticle.Life=Interp_Particle_Life;
gParticle.Age=Interp_Particle_Age;
gParticle.Size=Interp_Particle_Size;
gParticle.Color=Interp_Particle_Color;
gParticle.Quaternion=Interp_Particle_Quaternion;
gParticle.Mass=Interp_Particle_Mass;
int l9_4=Interp_Particle_Index/1600;
float l9_5=min(overrideTimeDelta,0.5);
vec3 l9_6=normalize(varTangent.xyz);
vec3 l9_7=normalize(varNormal);
int l9_8=Interp_Particle_Index%1600;
float l9_9=float(l9_8);
ivec2 l9_10=ivec2(Interp_Particle_Index%512,Interp_Particle_Index/512);
float l9_11=float(Interp_Particle_Index);
vec2 l9_12=vec2(l9_10);
float l9_13=l9_11/1599.0;
float l9_14=l9_13*8.0;
float l9_15;
if (overrideTimeEnabled==1)
{
l9_15=overrideTimeElapsed[l9_4];
}
else
{
l9_15=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,l9_14,fract(abs(((l9_13*0.97637898)+0.151235)+(floor(((((l9_15-l9_14)-0.0)+0.0)+16.0)/8.0)*4.32723))),(vec2(ivec2(Interp_Particle_Index%400,Interp_Particle_Index/400))+vec2(1.0))/vec2(399.0),float(((Interp_Particle_Index*((Interp_Particle_Index*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,Interp_Particle_Index,l9_8,l9_9,(1600*(l9_4+1))-1,(l9_11+0.5)/1600.0,l9_13,l9_9/1599.0,l9_10,(l9_12+vec2(0.5))/vec2(512.0,4.0),l9_12/vec2(511.0,3.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
float l9_16=gParticle.TimeShift;
ssGlobals l9_17=ssGlobals(sc_Time.x,l9_5,(sc_Time.x-(l9_16*l9_5))-0.0,vec3(0.0),normalize(sc_Camera.position-varPos),varPos,l9_6,l9_7,cross(l9_7,l9_6),varPackedTex.xy,overrideTimeElapsed[l9_4]);
if ((float(isIdle)*1.0)!=0.0)
{
vec2 l9_18;
Node159_Rotate_Coords(varPackedTex.xy,Port_Rotation_N159,Port_Center_N159,l9_18,l9_17);
vec4 l9_19;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,l9_18,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,l9_19,l9_17);
vec4 l9_20=l9_19;
vec2 l9_21=(varPackedTex.xy*Port_Input1_N031)-vec2(1.0);
float l9_22=1.0-(clamp(dot(l9_21,l9_21)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001)-0.001);
float l9_23;
if (l9_22<=0.0)
{
l9_23=0.0;
}
else
{
l9_23=sqrt(l9_22);
}
vec3 l9_24=vec3(l9_21.x,l9_21.y,vec3(0.0).z);
l9_24.z=l9_23;
vec4 l9_25;
Node26_PBR_Lighting(l9_20.xyz,l9_20.w*gParticle.Color.w,mix(Port_Input0_N038,l9_24,vec3(float(distance(varPackedTex.xy,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N026,Port_Metallic_N026,Port_Roughness_N026,Port_AO_N026,Port_SpecularAO_N026,l9_25,l9_17);
}
else
{
vec4 l9_26;
Node11_Conditional(1.0,vec4(1.0),vec4(0.5,0.0,0.0,0.0),l9_26,l9_17);
}
}
#else // #if SC_RT_RECEIVER_MODE
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
struct LightProperties
{
vec3 direction;
vec3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
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
#ifndef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 0
#elif sc_EnvmapDiffuseHasSwappedViews==1
#undef sc_EnvmapDiffuseHasSwappedViews
#define sc_EnvmapDiffuseHasSwappedViews 1
#endif
#ifndef sc_EnvmapDiffuseLayout
#define sc_EnvmapDiffuseLayout 0
#endif
#ifndef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 0
#elif sc_EnvmapSpecularHasSwappedViews==1
#undef sc_EnvmapSpecularHasSwappedViews
#define sc_EnvmapSpecularHasSwappedViews 1
#endif
#ifndef sc_EnvmapSpecularLayout
#define sc_EnvmapSpecularLayout 0
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
#ifndef sc_RayTracedReflectionTextureHasSwappedViews
#define sc_RayTracedReflectionTextureHasSwappedViews 0
#elif sc_RayTracedReflectionTextureHasSwappedViews==1
#undef sc_RayTracedReflectionTextureHasSwappedViews
#define sc_RayTracedReflectionTextureHasSwappedViews 1
#endif
#ifndef sc_RayTracedReflectionTextureLayout
#define sc_RayTracedReflectionTextureLayout 0
#endif
#ifndef sc_RayTracedShadowTextureHasSwappedViews
#define sc_RayTracedShadowTextureHasSwappedViews 0
#elif sc_RayTracedShadowTextureHasSwappedViews==1
#undef sc_RayTracedShadowTextureHasSwappedViews
#define sc_RayTracedShadowTextureHasSwappedViews 1
#endif
#ifndef sc_RayTracedShadowTextureLayout
#define sc_RayTracedShadowTextureLayout 0
#endif
#ifndef sc_RayTracedDiffIndTextureHasSwappedViews
#define sc_RayTracedDiffIndTextureHasSwappedViews 0
#elif sc_RayTracedDiffIndTextureHasSwappedViews==1
#undef sc_RayTracedDiffIndTextureHasSwappedViews
#define sc_RayTracedDiffIndTextureHasSwappedViews 1
#endif
#ifndef sc_RayTracedDiffIndTextureLayout
#define sc_RayTracedDiffIndTextureLayout 0
#endif
#ifndef sc_RayTracedAoTextureHasSwappedViews
#define sc_RayTracedAoTextureHasSwappedViews 0
#elif sc_RayTracedAoTextureHasSwappedViews==1
#undef sc_RayTracedAoTextureHasSwappedViews
#define sc_RayTracedAoTextureHasSwappedViews 1
#endif
#ifndef sc_RayTracedAoTextureLayout
#define sc_RayTracedAoTextureLayout 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 0
#elif sc_BlendMode_PremultipliedAlphaAuto==1
#undef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
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
#ifndef sc_SSAOEnabled
#define sc_SSAOEnabled 0
#elif sc_SSAOEnabled==1
#undef sc_SSAOEnabled
#define sc_SSAOEnabled 1
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
#ifndef sc_EnvLightMode
#define sc_EnvLightMode 0
#endif
#ifndef sc_AmbientLightMode_EnvironmentMap
#define sc_AmbientLightMode_EnvironmentMap 0
#endif
#ifndef sc_AmbientLightMode_FromCamera
#define sc_AmbientLightMode_FromCamera 0
#endif
#ifndef sc_LightEstimation
#define sc_LightEstimation 0
#elif sc_LightEstimation==1
#undef sc_LightEstimation
#define sc_LightEstimation 1
#endif
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
#ifndef sc_LightEstimationSGCount
#define sc_LightEstimationSGCount 0
#endif
#ifndef sc_MaxTextureImageUnits
#define sc_MaxTextureImageUnits 0
#endif
#ifndef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 0
#elif sc_HasDiffuseEnvmap==1
#undef sc_HasDiffuseEnvmap
#define sc_HasDiffuseEnvmap 1
#endif
#ifndef sc_AmbientLightMode_SphericalHarmonics
#define sc_AmbientLightMode_SphericalHarmonics 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
#ifndef sc_AmbientLightMode0
#define sc_AmbientLightMode0 0
#endif
#ifndef sc_AmbientLightMode_Constant
#define sc_AmbientLightMode_Constant 0
#endif
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
#ifndef sc_AmbientLightMode1
#define sc_AmbientLightMode1 0
#endif
#ifndef sc_AmbientLightMode2
#define sc_AmbientLightMode2 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
struct sc_PointLight_t
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
vec3 direction;
vec3 position;
vec4 color;
};
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
#ifndef Tweak_N261
#define Tweak_N261 0
#elif Tweak_N261==1
#undef Tweak_N261
#define Tweak_N261 1
#endif
#ifndef Tweak_N248
#define Tweak_N248 0
#elif Tweak_N248==1
#undef Tweak_N248
#define Tweak_N248 1
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
#ifndef NODE_243_DROPLIST_ITEM
#define NODE_243_DROPLIST_ITEM 0
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
uniform bool receivesRayTracedReflections;
uniform bool receivesRayTracedShadows;
uniform bool receivesRayTracedDiffuseIndirect;
uniform bool receivesRayTracedAo;
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
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
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec3 sc_EnvmapRotation;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapDiffuseSize;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
uniform sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
uniform sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
uniform bool isIdle;
uniform mat3 flipbookTexTransform;
uniform vec4 flipbookTexUvMinMax;
uniform vec4 flipbookTexBorderColor;
uniform bool isAttracting;
uniform vec4 TintColor;
uniform mat3 repelflipbookTexTransform;
uniform vec4 repelflipbookTexUvMinMax;
uniform vec4 repelflipbookTexBorderColor;
uniform float Port_Rotation_N159;
uniform vec2 Port_Center_N159;
uniform float Port_RangeMinA_N156;
uniform float Port_RangeMaxA_N156;
uniform float Port_RangeMaxB_N156;
uniform float Port_RangeMinB_N156;
uniform vec2 Port_SpriteCount_N045;
uniform float Port_MaxFrames_N045;
uniform float Port_SecondOffset_N045;
uniform vec2 Port_SpriteCount_N167;
uniform float Port_MaxFrames_N167;
uniform float Port_SecondOffset_N167;
uniform float intensity;
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
uniform sc_Camera_t sc_Camera;
uniform sampler2D repelflipbookTex;
uniform sampler2DArray repelflipbookTexArrSC;
uniform sampler2D flipbookTex;
uniform sampler2DArray flipbookTexArrSC;
uniform sampler2D sc_SSAOTexture;
uniform sampler2D sc_RayTracedShadowTexture;
uniform sampler2DArray sc_RayTracedShadowTextureArrSC;
uniform sampler2D sc_EnvmapSpecular;
uniform sampler2DArray sc_EnvmapSpecularArrSC;
uniform sampler2D sc_EnvmapDiffuse;
uniform sampler2DArray sc_EnvmapDiffuseArrSC;
uniform sampler2D sc_RayTracedDiffIndTexture;
uniform sampler2DArray sc_RayTracedDiffIndTextureArrSC;
uniform sampler2D sc_RayTracedReflectionTexture;
uniform sampler2DArray sc_RayTracedReflectionTextureArrSC;
uniform sampler2D sc_ScreenTexture;
uniform sampler2DArray sc_ScreenTextureArrSC;
uniform sampler2D sc_RayTracedAoTexture;
uniform sampler2DArray sc_RayTracedAoTextureArrSC;
uniform sampler2D intensityTexture;
uniform sampler2DArray intensityTextureArrSC;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
flat in int Interp_Particle_Index;
in vec4 varPackedTex;
in vec3 varNormal;
in vec4 varTangent;
in vec3 Interp_Particle_Position;
in vec3 Interp_Particle_Velocity;
in float Interp_Particle_Life;
in float Interp_Particle_Age;
in float Interp_Particle_Size;
in vec4 Interp_Particle_Color;
in vec4 Interp_Particle_Quaternion;
in float Interp_Particle_Mass;
in vec3 varPos;
in vec4 varScreenPos;
in vec2 varScreenTexturePos;
in vec4 varColor;
in vec3 Interp_Particle_Force;
in vec2 Interp_Particle_Coord;
in float Interp_Particle_SpawnIndex;
in float Interp_Particle_NextBurstTime;
in float gParticlesDebug;
in vec2 ParticleUV;
ssParticle gParticle;
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=varStereoViewID;
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
void Node159_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
int repelflipbookTexGetStereoViewIndex()
{
int l9_0;
#if (repelflipbookTexHasSwappedViews)
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
void Node167_Flipbook_Sample(vec2 SpriteCount,float MaxFrames,vec2 UVCoord,float FrameOffset,float Speed,float SecondOffset,out vec4 Color,ssGlobals Globals)
{
float l9_0=SpriteCount.x;
float l9_1=floor(l9_0);
float l9_2=SpriteCount.y;
float l9_3=floor(l9_2);
float l9_4=1.0/l9_1;
float l9_5=1.0/l9_3;
float l9_6=MaxFrames;
float l9_7=Globals.gTimeElapsedShifted;
float l9_8=SecondOffset;
float l9_9=Speed;
float l9_10=FrameOffset;
float l9_11=floor(mod(((l9_7+l9_8)*l9_9)+floor(l9_10),min(l9_1*l9_3,floor(l9_6))));
float l9_12=UVCoord.x;
float l9_13=(l9_4*l9_12)+(mod(l9_11,l9_1)*l9_4);
float l9_14=UVCoord.y;
float l9_15=((1.0-l9_5)-(floor(l9_11/l9_1)*l9_5))+(l9_5*l9_14);
vec4 l9_16;
#if (repelflipbookTexLayout==2)
{
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_repelflipbookTex)!=0));
float l9_18=l9_13;
sc_SoftwareWrapEarly(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x);
float l9_19=l9_18;
float l9_20=l9_15;
sc_SoftwareWrapEarly(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y);
float l9_21=l9_20;
vec2 l9_22;
float l9_23;
#if (SC_USE_UV_MIN_MAX_repelflipbookTex)
{
bool l9_24;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_24=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x==3;
}
#else
{
l9_24=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_25=l9_19;
float l9_26=1.0;
sc_ClampUV(l9_25,repelflipbookTexUvMinMax.x,repelflipbookTexUvMinMax.z,l9_24,l9_26);
float l9_27=l9_25;
float l9_28=l9_26;
bool l9_29;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_29=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y==3;
}
#else
{
l9_29=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_30=l9_21;
float l9_31=l9_28;
sc_ClampUV(l9_30,repelflipbookTexUvMinMax.y,repelflipbookTexUvMinMax.w,l9_29,l9_31);
l9_23=l9_31;
l9_22=vec2(l9_27,l9_30);
}
#else
{
l9_23=1.0;
l9_22=vec2(l9_19,l9_21);
}
#endif
vec2 l9_32=sc_TransformUV(l9_22,(int(SC_USE_UV_TRANSFORM_repelflipbookTex)!=0),repelflipbookTexTransform);
float l9_33=l9_32.x;
float l9_34=l9_23;
sc_SoftwareWrapLate(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x,l9_17,l9_34);
float l9_35=l9_32.y;
float l9_36=l9_34;
sc_SoftwareWrapLate(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y,l9_17,l9_36);
float l9_37=l9_36;
vec3 l9_38=sc_SamplingCoordsViewToGlobal(vec2(l9_33,l9_35),repelflipbookTexLayout,repelflipbookTexGetStereoViewIndex());
vec4 l9_39=texture(repelflipbookTexArrSC,l9_38,0.0);
vec4 l9_40;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_40=mix(repelflipbookTexBorderColor,l9_39,vec4(l9_37));
}
#else
{
l9_40=l9_39;
}
#endif
l9_16=l9_40;
}
#else
{
bool l9_41=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_repelflipbookTex)!=0));
float l9_42=l9_13;
sc_SoftwareWrapEarly(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x);
float l9_43=l9_42;
float l9_44=l9_15;
sc_SoftwareWrapEarly(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y);
float l9_45=l9_44;
vec2 l9_46;
float l9_47;
#if (SC_USE_UV_MIN_MAX_repelflipbookTex)
{
bool l9_48;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_48=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x==3;
}
#else
{
l9_48=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_49=l9_43;
float l9_50=1.0;
sc_ClampUV(l9_49,repelflipbookTexUvMinMax.x,repelflipbookTexUvMinMax.z,l9_48,l9_50);
float l9_51=l9_49;
float l9_52=l9_50;
bool l9_53;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_53=ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y==3;
}
#else
{
l9_53=(int(SC_USE_CLAMP_TO_BORDER_repelflipbookTex)!=0);
}
#endif
float l9_54=l9_45;
float l9_55=l9_52;
sc_ClampUV(l9_54,repelflipbookTexUvMinMax.y,repelflipbookTexUvMinMax.w,l9_53,l9_55);
l9_47=l9_55;
l9_46=vec2(l9_51,l9_54);
}
#else
{
l9_47=1.0;
l9_46=vec2(l9_43,l9_45);
}
#endif
vec2 l9_56=sc_TransformUV(l9_46,(int(SC_USE_UV_TRANSFORM_repelflipbookTex)!=0),repelflipbookTexTransform);
float l9_57=l9_56.x;
float l9_58=l9_47;
sc_SoftwareWrapLate(l9_57,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).x,l9_41,l9_58);
float l9_59=l9_56.y;
float l9_60=l9_58;
sc_SoftwareWrapLate(l9_59,ivec2(SC_SOFTWARE_WRAP_MODE_U_repelflipbookTex,SC_SOFTWARE_WRAP_MODE_V_repelflipbookTex).y,l9_41,l9_60);
float l9_61=l9_60;
vec3 l9_62=sc_SamplingCoordsViewToGlobal(vec2(l9_57,l9_59),repelflipbookTexLayout,repelflipbookTexGetStereoViewIndex());
vec4 l9_63=texture(repelflipbookTex,l9_62.xy,0.0);
vec4 l9_64;
#if (SC_USE_CLAMP_TO_BORDER_repelflipbookTex)
{
l9_64=mix(repelflipbookTexBorderColor,l9_63,vec4(l9_61));
}
#else
{
l9_64=l9_63;
}
#endif
l9_16=l9_64;
}
#endif
Color=l9_16;
}
int flipbookTexGetStereoViewIndex()
{
int l9_0;
#if (flipbookTexHasSwappedViews)
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
void Node45_Flipbook_Sample(vec2 SpriteCount,float MaxFrames,vec2 UVCoord,float FrameOffset,float Speed,float SecondOffset,out vec4 Color,ssGlobals Globals)
{
float l9_0=SpriteCount.x;
float l9_1=floor(l9_0);
float l9_2=SpriteCount.y;
float l9_3=floor(l9_2);
float l9_4=1.0/l9_1;
float l9_5=1.0/l9_3;
float l9_6=MaxFrames;
float l9_7=Globals.gTimeElapsedShifted;
float l9_8=SecondOffset;
float l9_9=Speed;
float l9_10=FrameOffset;
float l9_11=floor(mod(((l9_7+l9_8)*l9_9)+floor(l9_10),min(l9_1*l9_3,floor(l9_6))));
float l9_12=UVCoord.x;
float l9_13=(l9_4*l9_12)+(mod(l9_11,l9_1)*l9_4);
float l9_14=UVCoord.y;
float l9_15=((1.0-l9_5)-(floor(l9_11/l9_1)*l9_5))+(l9_5*l9_14);
vec4 l9_16;
#if (flipbookTexLayout==2)
{
bool l9_17=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_flipbookTex)!=0));
float l9_18=l9_13;
sc_SoftwareWrapEarly(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x);
float l9_19=l9_18;
float l9_20=l9_15;
sc_SoftwareWrapEarly(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y);
float l9_21=l9_20;
vec2 l9_22;
float l9_23;
#if (SC_USE_UV_MIN_MAX_flipbookTex)
{
bool l9_24;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_24=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x==3;
}
#else
{
l9_24=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_25=l9_19;
float l9_26=1.0;
sc_ClampUV(l9_25,flipbookTexUvMinMax.x,flipbookTexUvMinMax.z,l9_24,l9_26);
float l9_27=l9_25;
float l9_28=l9_26;
bool l9_29;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_29=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y==3;
}
#else
{
l9_29=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_30=l9_21;
float l9_31=l9_28;
sc_ClampUV(l9_30,flipbookTexUvMinMax.y,flipbookTexUvMinMax.w,l9_29,l9_31);
l9_23=l9_31;
l9_22=vec2(l9_27,l9_30);
}
#else
{
l9_23=1.0;
l9_22=vec2(l9_19,l9_21);
}
#endif
vec2 l9_32=sc_TransformUV(l9_22,(int(SC_USE_UV_TRANSFORM_flipbookTex)!=0),flipbookTexTransform);
float l9_33=l9_32.x;
float l9_34=l9_23;
sc_SoftwareWrapLate(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x,l9_17,l9_34);
float l9_35=l9_32.y;
float l9_36=l9_34;
sc_SoftwareWrapLate(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y,l9_17,l9_36);
float l9_37=l9_36;
vec3 l9_38=sc_SamplingCoordsViewToGlobal(vec2(l9_33,l9_35),flipbookTexLayout,flipbookTexGetStereoViewIndex());
vec4 l9_39=texture(flipbookTexArrSC,l9_38,0.0);
vec4 l9_40;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_40=mix(flipbookTexBorderColor,l9_39,vec4(l9_37));
}
#else
{
l9_40=l9_39;
}
#endif
l9_16=l9_40;
}
#else
{
bool l9_41=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_flipbookTex)!=0));
float l9_42=l9_13;
sc_SoftwareWrapEarly(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x);
float l9_43=l9_42;
float l9_44=l9_15;
sc_SoftwareWrapEarly(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y);
float l9_45=l9_44;
vec2 l9_46;
float l9_47;
#if (SC_USE_UV_MIN_MAX_flipbookTex)
{
bool l9_48;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_48=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x==3;
}
#else
{
l9_48=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_49=l9_43;
float l9_50=1.0;
sc_ClampUV(l9_49,flipbookTexUvMinMax.x,flipbookTexUvMinMax.z,l9_48,l9_50);
float l9_51=l9_49;
float l9_52=l9_50;
bool l9_53;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_53=ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y==3;
}
#else
{
l9_53=(int(SC_USE_CLAMP_TO_BORDER_flipbookTex)!=0);
}
#endif
float l9_54=l9_45;
float l9_55=l9_52;
sc_ClampUV(l9_54,flipbookTexUvMinMax.y,flipbookTexUvMinMax.w,l9_53,l9_55);
l9_47=l9_55;
l9_46=vec2(l9_51,l9_54);
}
#else
{
l9_47=1.0;
l9_46=vec2(l9_43,l9_45);
}
#endif
vec2 l9_56=sc_TransformUV(l9_46,(int(SC_USE_UV_TRANSFORM_flipbookTex)!=0),flipbookTexTransform);
float l9_57=l9_56.x;
float l9_58=l9_47;
sc_SoftwareWrapLate(l9_57,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).x,l9_41,l9_58);
float l9_59=l9_56.y;
float l9_60=l9_58;
sc_SoftwareWrapLate(l9_59,ivec2(SC_SOFTWARE_WRAP_MODE_U_flipbookTex,SC_SOFTWARE_WRAP_MODE_V_flipbookTex).y,l9_41,l9_60);
float l9_61=l9_60;
vec3 l9_62=sc_SamplingCoordsViewToGlobal(vec2(l9_57,l9_59),flipbookTexLayout,flipbookTexGetStereoViewIndex());
vec4 l9_63=texture(flipbookTex,l9_62.xy,0.0);
vec4 l9_64;
#if (SC_USE_CLAMP_TO_BORDER_flipbookTex)
{
l9_64=mix(flipbookTexBorderColor,l9_63,vec4(l9_61));
}
#else
{
l9_64=l9_63;
}
#endif
l9_16=l9_64;
}
#endif
Color=l9_16;
}
void Node275_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
#if (Tweak_N248)
{
vec2 param_3;
Node159_Rotate_Coords(Globals.Surface_UVCoord0,Port_Rotation_N159,Port_Center_N159,param_3,Globals);
vec4 param_11;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,param_3,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_11,Globals);
Input1=param_11;
Output=Input1;
}
#else
{
vec2 param_16;
Node159_Rotate_Coords(Globals.Surface_UVCoord0,Port_Rotation_N159,Port_Center_N159,param_16,Globals);
vec4 param_24;
Node167_Flipbook_Sample(Port_SpriteCount_N167,Port_MaxFrames_N167,param_16,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N167,param_24,Globals);
Input2=param_24;
Output=Input2;
}
#endif
}
void Node240_Switch(float Switch,float Value0,float Value1,float Value2,float Value3,float Default,out float Result,ssGlobals Globals)
{
#if (NODE_243_DROPLIST_ITEM==0)
{
vec4 param_3;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_3,Globals);
Value0=param_3.x;
Result=Value0;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==1)
{
vec4 param_8;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_8,Globals);
Value1=param_8.y;
Result=Value1;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==2)
{
vec4 param_13;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_13,Globals);
Value2=param_13.z;
Result=Value2;
}
#else
{
#if (NODE_243_DROPLIST_ITEM==3)
{
vec4 param_18;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_18,Globals);
Value3=param_18.w;
Result=Value3;
}
#else
{
vec4 param_23;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_23,Globals);
Default=param_23.w;
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
SurfaceProperties defaultSurfaceProperties()
{
return SurfaceProperties(vec3(0.0),1.0,vec3(0.0),vec3(0.0),vec3(0.0),0.0,0.0,vec3(0.0),vec3(1.0),vec3(1.0),vec3(1.0),vec3(0.0));
}
vec3 ssSRGB_to_Linear(vec3 value)
{
vec3 l9_0;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_0=vec3(pow(value.x,2.2),pow(value.y,2.2),pow(value.z,2.2));
}
#else
{
l9_0=value*value;
}
#endif
return l9_0;
}
vec3 evaluateSSAO(vec3 positionWS)
{
#if (sc_SSAOEnabled)
{
vec4 l9_0=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(positionWS,1.0);
return vec3(texture(sc_SSAOTexture,((l9_0.xyz/vec3(l9_0.w)).xy*0.5)+vec2(0.5)).x);
}
#else
{
return vec3(1.0);
}
#endif
}
void deriveAlbedoAndSpecColorFromSurfaceProperties(SurfaceProperties surfaceProperties,out vec3 albedo,out vec3 specColor)
{
specColor=mix(vec3(0.039999999),surfaceProperties.albedo*surfaceProperties.metallic,vec3(surfaceProperties.metallic));
albedo=mix(surfaceProperties.albedo*(1.0-surfaceProperties.metallic),vec3(0.0),vec3(surfaceProperties.metallic));
}
vec3 fresnelSchlickSub(float cosTheta,vec3 F0,vec3 fresnelMax)
{
float l9_0=1.0-cosTheta;
float l9_1=l9_0*l9_0;
return F0+((fresnelMax-F0)*((l9_1*l9_1)*l9_0));
}
float Dggx(float NdotH,float roughness)
{
float l9_0=roughness*roughness;
float l9_1=l9_0*l9_0;
float l9_2=((NdotH*NdotH)*(l9_1-1.0))+1.0;
return l9_1/((l9_2*l9_2)+9.9999999e-09);
}
vec3 calculateDirectSpecular(SurfaceProperties surfaceProperties,vec3 L,vec3 V)
{
float l9_0=surfaceProperties.roughness;
float l9_1=max(l9_0,0.029999999);
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
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
float l9_13=l9_1+1.0;
float l9_14=(l9_13*l9_13)*0.125;
float l9_15=1.0-l9_14;
return fresnelSchlickSub(l9_12,l9_2,vec3(1.0))*(((Dggx(l9_10,l9_1)*(1.0/(((l9_8*l9_15)+l9_14)*((clamp(dot(l9_3,l9_9),0.0,1.0)*l9_15)+l9_14))))*0.25)*l9_8);
}
#else
{
float l9_16=exp2(11.0-(10.0*l9_1));
return ((fresnelSchlickSub(l9_12,l9_2,vec3(1.0))*((l9_16*0.125)+0.25))*pow(l9_10,l9_16))*l9_8;
}
#endif
}
LightingComponents accumulateLight(LightingComponents lighting,LightProperties light,SurfaceProperties surfaceProperties,vec3 V)
{
lighting.directDiffuse+=((vec3(clamp(dot(surfaceProperties.normal,light.direction),0.0,1.0))*light.color)*light.attenuation);
lighting.directSpecular+=((calculateDirectSpecular(surfaceProperties,light.direction,V)*light.color)*light.attenuation);
return lighting;
}
float computeDistanceAttenuation(float distanceToLight,float falloffEndDistance)
{
float l9_0=distanceToLight;
float l9_1=distanceToLight;
float l9_2=l9_0*l9_1;
if (falloffEndDistance==0.0)
{
return 1.0/l9_2;
}
return max(min(1.0-((l9_2*l9_2)/pow(falloffEndDistance,4.0)),1.0),0.0)/l9_2;
}
int sc_RayTracedShadowTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracedShadowTextureHasSwappedViews)
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
vec4 sc_RayTracedShadowTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_RayTracedShadowTextureLayout==2)
{
l9_0=texture(sc_RayTracedShadowTextureArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedShadowTextureLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_RayTracedShadowTexture,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedShadowTextureLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
vec3 evaluateSh(vec3 L00,vec3 L1_1,vec3 L10,vec3 L11,vec3 L2_2,vec3 L2_1,vec3 L20,vec3 L21,vec3 L22,vec3 n)
{
return ((((((L22*0.42904299)*((n.x*n.x)-(n.y*n.y)))+((L20*0.74312502)*(n.z*n.z)))+(L00*0.88622701))-(L20*0.24770799))+((((L2_2*(n.x*n.y))+(L21*(n.x*n.z)))+(L2_1*(n.y*n.z)))*0.85808599))+((((L11*n.x)+(L1_1*n.y))+(L10*n.z))*1.0233279);
}
vec2 calcPanoramicTexCoordsFromDir(vec3 reflDir,float rotationDegrees)
{
float l9_0=-reflDir.z;
vec2 l9_1=vec2((((reflDir.x<0.0) ? (-1.0) : 1.0)*acos(clamp(l9_0/length(vec2(reflDir.x,l9_0)),-1.0,1.0)))-1.5707964,acos(reflDir.y))/vec2(6.2831855,3.1415927);
float l9_2=l9_1.x+(rotationDegrees/360.0);
vec2 l9_3=vec2(l9_2,1.0-l9_1.y);
l9_3.x=fract((l9_2+floor(l9_2))+1.0);
return l9_3;
}
int sc_EnvmapSpecularGetStereoViewIndex()
{
int l9_0;
#if (sc_EnvmapSpecularHasSwappedViews)
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
vec4 sc_EnvmapSpecularSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_EnvmapSpecularLayout==2)
{
l9_0=texture(sc_EnvmapSpecularArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
vec2 calcSeamlessPanoramicUvsForSampling(vec2 uv,vec2 topMipRes,float lod)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec2 l9_0=max(vec2(1.0),topMipRes/vec2(exp2(lod)));
return ((uv*(l9_0-vec2(1.0)))/l9_0)+(vec2(0.5)/l9_0);
}
#else
{
return uv;
}
#endif
}
int sc_EnvmapDiffuseGetStereoViewIndex()
{
int l9_0;
#if (sc_EnvmapDiffuseHasSwappedViews)
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
vec4 sc_EnvmapDiffuseSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_EnvmapDiffuseLayout==2)
{
l9_0=texture(sc_EnvmapDiffuseArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapDiffuseLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_EnvmapDiffuse,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapDiffuseLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
vec3 sampleDiffuseEnvmap(vec3 N)
{
vec2 l9_0=calcPanoramicTexCoordsFromDir(N,sc_EnvmapRotation.y);
vec4 l9_1;
#if (sc_EnvLightMode==sc_AmbientLightMode_FromCamera)
{
vec2 l9_2;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
l9_2=calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapSpecularSize.xy,5.0);
}
#else
{
l9_2=l9_0;
}
#endif
l9_1=sc_EnvmapSpecularSampleViewIndexBias(l9_2,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#else
{
vec4 l9_3;
#if ((sc_MaxTextureImageUnits>8)&&sc_HasDiffuseEnvmap)
{
l9_3=sc_EnvmapDiffuseSampleViewIndexBias(calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapDiffuseSize.xy,0.0),sc_EnvmapDiffuseGetStereoViewIndex(),-13.0);
}
#else
{
l9_3=sc_EnvmapSpecularSampleViewIndexBias(l9_0,sc_EnvmapSpecularGetStereoViewIndex(),13.0);
}
#endif
l9_1=l9_3;
}
#endif
return (l9_1.xyz*(1.0/l9_1.w))*sc_EnvmapExposure;
}
int sc_RayTracedDiffIndTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracedDiffIndTextureHasSwappedViews)
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
vec4 sc_RayTracedDiffIndTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_RayTracedDiffIndTextureLayout==2)
{
l9_0=texture(sc_RayTracedDiffIndTextureArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedDiffIndTextureLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_RayTracedDiffIndTexture,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedDiffIndTextureLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
vec4 sampleRayTracedIndirectDiffuse()
{
if (receivesRayTracedDiffuseIndirect)
{
return sc_RayTracedDiffIndTextureSampleViewIndexBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,sc_RayTracedDiffIndTextureGetStereoViewIndex(),0.0);
}
return vec4(0.0);
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
float l9_9=0.36000001*l9_2;
float l9_10=(1.0/(4.0*0.36000001))*l9_8;
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
return (((lightingLobe.color/vec3(lightingLobe.sharpness))*6.2831855)*((l9_7*l9_12)+(((l9_4-l9_5)*l9_6)-l9_5)))/vec3(3.1415927);
}
vec3 calculateLightEstimationDiffuse(vec3 N)
{
vec3 l9_0;
l9_0=sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t param;
vec3 param_1;
int l9_1=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1<sc_LightEstimationSGCount)
{
l9_0+=DiffuseTermSG(sc_LightEstimationData.sg[l9_1],N);
l9_1++;
continue;
}
else
{
break;
}
}
return l9_0;
}
vec3 calculateDiffuseIrradiance(vec3 N)
{
vec3 l9_0;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
l9_0=sampleDiffuseEnvmap(N);
}
#else
{
vec3 l9_1;
#if (sc_EnvLightMode==sc_AmbientLightMode_SphericalHarmonics)
{
l9_1=evaluateSh(sc_Sh[0],sc_Sh[1],sc_Sh[2],sc_Sh[3],sc_Sh[4],sc_Sh[5],sc_Sh[6],sc_Sh[7],sc_Sh[8],-N)*sc_ShIntensity;
}
#else
{
l9_1=vec3(0.0);
}
#endif
l9_0=l9_1;
}
#endif
vec3 l9_2;
if (receivesRayTracedDiffuseIndirect)
{
vec4 l9_3=sampleRayTracedIndirectDiffuse();
l9_2=mix(l9_0,l9_3.xyz,vec3(l9_3.w));
}
else
{
l9_2=l9_0;
}
vec3 l9_4;
#if (sc_AmbientLightsCount>0)
{
vec3 l9_5;
#if (sc_AmbientLightMode0==sc_AmbientLightMode_Constant)
{
l9_5=l9_2+(sc_AmbientLights[0].color*sc_AmbientLights[0].intensity);
}
#else
{
vec3 l9_6=l9_2;
l9_6.x=l9_2.x+(1e-06*sc_AmbientLights[0].color.x);
l9_5=l9_6;
}
#endif
l9_4=l9_5;
}
#else
{
l9_4=l9_2;
}
#endif
vec3 l9_7;
#if (sc_AmbientLightsCount>1)
{
vec3 l9_8;
#if (sc_AmbientLightMode1==sc_AmbientLightMode_Constant)
{
l9_8=l9_4+(sc_AmbientLights[1].color*sc_AmbientLights[1].intensity);
}
#else
{
vec3 l9_9=l9_4;
l9_9.x=l9_4.x+(1e-06*sc_AmbientLights[1].color.x);
l9_8=l9_9;
}
#endif
l9_7=l9_8;
}
#else
{
l9_7=l9_4;
}
#endif
vec3 l9_10;
#if (sc_AmbientLightsCount>2)
{
vec3 l9_11;
#if (sc_AmbientLightMode2==sc_AmbientLightMode_Constant)
{
l9_11=l9_7+(sc_AmbientLights[2].color*sc_AmbientLights[2].intensity);
}
#else
{
vec3 l9_12=l9_7;
l9_12.x=l9_7.x+(1e-06*sc_AmbientLights[2].color.x);
l9_11=l9_12;
}
#endif
l9_10=l9_11;
}
#else
{
l9_10=l9_7;
}
#endif
vec3 l9_13;
#if (sc_LightEstimation)
{
l9_13=l9_10+calculateLightEstimationDiffuse(N);
}
#else
{
l9_13=l9_10;
}
#endif
return l9_13;
}
vec3 getSpecularDominantDir(vec3 N,vec3 R,float roughness)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
return normalize(mix(R,N,vec3((roughness*roughness)*roughness)));
}
#else
{
return R;
}
#endif
}
vec4 sc_EnvmapSpecularSampleViewIndexLevel(vec2 uv,int viewIndex,float level_)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
vec4 l9_1;
#if (sc_EnvmapSpecularLayout==2)
{
float l9_2=level_;
vec3 l9_3=sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex);
vec4 l9_4;
#if (sc_CanUseTextureLod)
{
l9_4=textureLod(sc_EnvmapSpecularArrSC,l9_3,l9_2);
}
#else
{
l9_4=vec4(0.0);
}
#endif
l9_1=l9_4;
}
#else
{
l9_1=textureLod(sc_EnvmapSpecular,sc_SamplingCoordsViewToGlobal(uv,sc_EnvmapSpecularLayout,viewIndex).xy,level_);
}
#endif
l9_0=l9_1;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec3 sampleSpecularEnvTextureLod(vec3 R,float lod)
{
vec2 l9_0=calcPanoramicTexCoordsFromDir(R,sc_EnvmapRotation.y);
vec4 l9_1;
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
float l9_2=floor(lod);
float l9_3=ceil(lod);
l9_1=mix(sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapSpecularSize.xy,l9_2),sc_EnvmapSpecularGetStereoViewIndex(),l9_2),sc_EnvmapSpecularSampleViewIndexLevel(calcSeamlessPanoramicUvsForSampling(l9_0,sc_EnvmapSpecularSize.xy,l9_3),sc_EnvmapSpecularGetStereoViewIndex(),l9_3),vec4(lod-l9_2));
}
#else
{
l9_1=sc_EnvmapSpecularSampleViewIndexLevel(l9_0,sc_EnvmapSpecularGetStereoViewIndex(),lod);
}
#endif
return l9_1.xyz*(1.0/l9_1.w);
}
int sc_RayTracedReflectionTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracedReflectionTextureHasSwappedViews)
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
vec4 sc_RayTracedReflectionTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_RayTracedReflectionTextureLayout==2)
{
l9_0=texture(sc_RayTracedReflectionTextureArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedReflectionTextureLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_RayTracedReflectionTexture,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedReflectionTextureLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
vec4 sampleRayTracedReflections()
{
if (!receivesRayTracedReflections)
{
return vec4(0.0);
}
else
{
return sc_RayTracedReflectionTextureSampleViewIndexBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,sc_RayTracedReflectionTextureGetStereoViewIndex(),0.0);
}
}
vec3 envBRDFApprox(SurfaceProperties surfaceProperties,float NdotV)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
vec4 l9_0=(vec4(-1.0,-0.0275,-0.57200003,0.022)*surfaceProperties.roughness)+vec4(1.0,0.0425,1.04,-0.039999999);
float l9_1=l9_0.x;
vec2 l9_2=(vec2(-1.04,1.04)*((min(l9_1*l9_1,exp2((-9.2799997)*NdotV))*l9_1)+l9_0.y))+l9_0.zw;
return max((surfaceProperties.specColor*l9_2.x)+vec3(l9_2.y),vec3(0.0));
}
#else
{
return fresnelSchlickSub(NdotV,surfaceProperties.specColor,max(vec3(1.0-surfaceProperties.roughness),surfaceProperties.specColor));
}
#endif
}
vec3 calculateIndirectSpecularEnvmap(SurfaceProperties surfaceProperties,vec3 V)
{
vec3 l9_0=surfaceProperties.normal;
vec3 l9_1=sampleSpecularEnvTextureLod(getSpecularDominantDir(l9_0,reflect(-V,l9_0),surfaceProperties.roughness),clamp(pow(surfaceProperties.roughness,0.66666669),0.0,1.0)*5.0);
vec3 l9_2=(l9_1*sc_EnvmapExposure)+vec3(1e-06);
vec3 l9_3;
if (receivesRayTracedReflections)
{
vec4 l9_4=sampleRayTracedReflections();
l9_3=mix(l9_2,l9_4.xyz,vec3(l9_4.w));
}
else
{
l9_3=l9_2;
}
return l9_3*envBRDFApprox(surfaceProperties,abs(dot(l9_0,V)));
}
sc_SphericalGaussianLight_t DistributionTermSG(vec3 direction,float roughness)
{
float l9_0=roughness*roughness;
return sc_SphericalGaussianLight_t(vec3(1.0/(3.1415927*l9_0)),2.0/l9_0,direction);
}
sc_SphericalGaussianLight_t WarpDistributionSG(sc_SphericalGaussianLight_t ndf,vec3 view)
{
return sc_SphericalGaussianLight_t(ndf.color,ndf.sharpness/(4.0*max(dot(ndf.axis,view),9.9999997e-05)),reflect(-view,ndf.axis));
}
vec3 SGInnerProduct(sc_SphericalGaussianLight_t lhs,sc_SphericalGaussianLight_t rhs)
{
float l9_0=length((lhs.axis*lhs.sharpness)+(rhs.axis*rhs.sharpness));
return ((((lhs.color*exp((l9_0-lhs.sharpness)-rhs.sharpness))*rhs.color)*6.2831855)*(1.0-exp((-2.0)*l9_0)))/vec3(l9_0);
}
vec3 SpecularTermSG(sc_SphericalGaussianLight_t light,vec3 normal,float roughness,vec3 view,vec3 specColor)
{
sc_SphericalGaussianLight_t l9_0=WarpDistributionSG(DistributionTermSG(normal,roughness),view);
vec3 l9_1=l9_0.axis;
float l9_2=roughness*roughness;
float l9_3=clamp(dot(normal,l9_1),0.0,1.0);
float l9_4=clamp(dot(normal,view),0.0,1.0);
float l9_5=1.0-l9_2;
return ((SGInnerProduct(l9_0,light)*((1.0/(l9_3+sqrt(l9_2+((l9_5*l9_3)*l9_3))))*(1.0/(l9_4+sqrt(l9_2+((l9_5*l9_4)*l9_4))))))*(specColor+((vec3(1.0)-specColor)*pow(1.0-clamp(dot(l9_1,normalize(l9_1+view)),0.0,1.0),5.0))))*l9_3;
}
vec3 calculateLightEstimationSpecular(SurfaceProperties surfaceProperties,vec3 V)
{
float l9_0=surfaceProperties.roughness;
float l9_1=surfaceProperties.roughness;
vec3 l9_2;
l9_2=sc_LightEstimationData.ambientLight*surfaceProperties.specColor;
sc_SphericalGaussianLight_t param;
vec3 param_1;
float param_2;
vec3 param_3;
vec3 param_4;
int l9_3=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3<sc_LightEstimationSGCount)
{
l9_2+=SpecularTermSG(sc_LightEstimationData.sg[l9_3],surfaceProperties.normal,clamp(l9_0*l9_1,0.0099999998,1.0),V,surfaceProperties.specColor);
l9_3++;
continue;
}
else
{
break;
}
}
return l9_2;
}
vec3 calculateIndirectSpecular(SurfaceProperties surfaceProperties,vec3 V)
{
vec3 l9_0;
#if ((sc_EnvLightMode==sc_AmbientLightMode_EnvironmentMap)||(sc_EnvLightMode==sc_AmbientLightMode_FromCamera))
{
l9_0=vec3(0.0)+calculateIndirectSpecularEnvmap(surfaceProperties,V);
}
#else
{
l9_0=vec3(0.0);
}
#endif
vec3 l9_1;
#if (sc_LightEstimation)
{
l9_1=l9_0+calculateLightEstimationSpecular(surfaceProperties,V);
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
LightingComponents evaluateLighting(SurfaceProperties surfaceProperties)
{
vec3 l9_0=surfaceProperties.viewDirWS;
vec4 bakedShadows=vec4(surfaceProperties.bakedShadows,1.0);
vec3 l9_1;
vec3 l9_2;
vec3 l9_3;
vec3 l9_4;
int l9_5;
vec3 l9_6;
vec3 l9_7;
#if (sc_DirectionalLightsCount>0)
{
vec3 l9_8;
vec3 l9_9;
vec3 l9_10;
vec3 l9_11;
int l9_12;
vec3 l9_13;
vec3 l9_14;
l9_14=vec3(1.0);
l9_13=vec3(0.0);
l9_12=0;
l9_11=vec3(0.0);
l9_10=vec3(0.0);
l9_9=vec3(0.0);
l9_8=vec3(0.0);
LightingComponents param;
LightProperties param_1;
SurfaceProperties param_2;
vec3 param_3;
int l9_15=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_15<sc_DirectionalLightsCount)
{
LightingComponents l9_16=accumulateLight(LightingComponents(l9_8,l9_9,l9_14,l9_13,l9_11,l9_10),LightProperties(sc_DirectionalLights[l9_15].direction,sc_DirectionalLights[l9_15].color.xyz,sc_DirectionalLights[l9_15].color.w*bakedShadows[(l9_12<3) ? l9_12 : 3]),surfaceProperties,l9_0);
l9_14=l9_16.indirectDiffuse;
l9_13=l9_16.indirectSpecular;
l9_12++;
l9_11=l9_16.emitted;
l9_10=l9_16.transmitted;
l9_9=l9_16.directSpecular;
l9_8=l9_16.directDiffuse;
l9_15++;
continue;
}
else
{
break;
}
}
l9_7=l9_14;
l9_6=l9_13;
l9_5=l9_12;
l9_4=l9_11;
l9_3=l9_10;
l9_2=l9_9;
l9_1=l9_8;
}
#else
{
l9_7=vec3(1.0);
l9_6=vec3(0.0);
l9_5=0;
l9_4=vec3(0.0);
l9_3=vec3(0.0);
l9_2=vec3(0.0);
l9_1=vec3(0.0);
}
#endif
vec3 l9_17;
vec3 l9_18;
vec3 l9_19;
vec3 l9_20;
#if (sc_PointLightsCount>0)
{
vec3 l9_21;
vec3 l9_22;
vec3 l9_23;
vec3 l9_24;
vec3 l9_25;
vec3 l9_26;
l9_26=l9_7;
l9_25=l9_6;
l9_24=l9_4;
l9_23=l9_3;
l9_22=l9_2;
l9_21=l9_1;
int l9_27;
vec3 l9_28;
vec3 l9_29;
vec3 l9_30;
vec3 l9_31;
vec3 l9_32;
vec3 l9_33;
int l9_34=0;
int l9_35=l9_5;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount)
{
vec3 l9_36=surfaceProperties.positionWS;
vec3 l9_37=sc_PointLights[l9_34].position-l9_36;
vec3 l9_38=normalize(l9_37);
float l9_39=bakedShadows[(l9_35<3) ? l9_35 : 3];
float l9_40=clamp((dot(l9_38,sc_PointLights[l9_34].direction)*sc_PointLights[l9_34].angleScale)+sc_PointLights[l9_34].angleOffset,0.0,1.0);
float l9_41=(sc_PointLights[l9_34].color.w*l9_39)*(l9_40*l9_40);
float l9_42;
if (sc_PointLights[l9_34].falloffEnabled)
{
l9_42=l9_41*computeDistanceAttenuation(length(l9_37),sc_PointLights[l9_34].falloffEndDistance);
}
else
{
l9_42=l9_41;
}
l9_27=l9_35+1;
LightingComponents l9_43=accumulateLight(LightingComponents(l9_21,l9_22,l9_26,l9_25,l9_24,l9_23),LightProperties(l9_38,sc_PointLights[l9_34].color.xyz,l9_42),surfaceProperties,l9_0);
l9_28=l9_43.directDiffuse;
l9_29=l9_43.directSpecular;
l9_30=l9_43.indirectDiffuse;
l9_31=l9_43.indirectSpecular;
l9_32=l9_43.emitted;
l9_33=l9_43.transmitted;
l9_26=l9_30;
l9_25=l9_31;
l9_35=l9_27;
l9_24=l9_32;
l9_23=l9_33;
l9_22=l9_29;
l9_21=l9_28;
l9_34++;
continue;
}
else
{
break;
}
}
l9_20=l9_24;
l9_19=l9_23;
l9_18=l9_22;
l9_17=l9_21;
}
#else
{
l9_20=l9_4;
l9_19=l9_3;
l9_18=l9_2;
l9_17=l9_1;
}
#endif
vec3 l9_44;
vec3 l9_45;
if (receivesRayTracedShadows)
{
vec3 l9_46=vec3(1.0)-vec3(sc_RayTracedShadowTextureSampleViewIndexBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,sc_RayTracedShadowTextureGetStereoViewIndex(),0.0).x);
l9_45=l9_17*l9_46;
l9_44=l9_18*l9_46;
}
else
{
l9_45=l9_17;
l9_44=l9_18;
}
return LightingComponents(l9_45,l9_44,calculateDiffuseIrradiance(surfaceProperties.normal),calculateIndirectSpecular(surfaceProperties,l9_0),l9_20,l9_19);
}
vec2 sc_SamplingCoordsGlobalToView(vec3 uvi,int renderingLayout,int viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
vec2 sc_ScreenCoordsGlobalToView(vec2 uv)
{
vec2 l9_0;
#if (sc_StereoRenderingMode==1)
{
l9_0=sc_SamplingCoordsGlobalToView(vec3(uv,0.0),1,sc_GetStereoViewIndex());
}
#else
{
l9_0=uv;
}
#endif
return l9_0;
}
int sc_ScreenTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_ScreenTextureHasSwappedViews)
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
vec4 sc_ScreenTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_ScreenTextureLayout==2)
{
l9_0=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_ScreenTextureLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(uv,sc_ScreenTextureLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
}
vec4 sc_readFragData0()
{
vec4 l9_0=sc_readFragData0_Platform();
vec4 l9_1;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_framebufferFetchMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
vec4 sc_GetFramebufferColor()
{
vec4 l9_0;
#if (sc_FramebufferFetch)
{
l9_0=sc_readFragData0();
}
#else
{
l9_0=sc_ScreenTextureSampleViewIndexBias(sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw),sc_ScreenTextureGetStereoViewIndex(),0.0);
}
#endif
vec4 l9_1;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_2=l9_0;
l9_2.x=l9_0.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_1=l9_2;
}
#else
{
l9_1=l9_0;
}
#endif
return l9_1;
}
int sc_RayTracedAoTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_RayTracedAoTextureHasSwappedViews)
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
vec4 sc_RayTracedAoTextureSampleViewIndexBias(vec2 uv,int viewIndex,float bias)
{
vec4 l9_0;
#if (sc_RayTracedAoTextureLayout==2)
{
l9_0=texture(sc_RayTracedAoTextureArrSC,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedAoTextureLayout,viewIndex),bias);
}
#else
{
l9_0=texture(sc_RayTracedAoTexture,sc_SamplingCoordsViewToGlobal(uv,sc_RayTracedAoTextureLayout,viewIndex).xy,bias);
}
#endif
return l9_0;
}
float sampleRayTracedAo()
{
if (receivesRayTracedAo)
{
return sc_RayTracedAoTextureSampleViewIndexBias(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw,sc_RayTracedAoTextureGetStereoViewIndex(),0.0).x;
}
return 0.0;
}
float srgbToLinear(float x)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
return pow(x,2.2);
}
#else
{
return x*x;
}
#endif
}
vec3 combineSurfacePropertiesWithLighting(SurfaceProperties surfaceProperties,LightingComponents lighting,bool enablePremultipliedAlpha)
{
vec3 l9_0;
if (receivesRayTracedAo)
{
l9_0=surfaceProperties.albedo*(lighting.directDiffuse+(lighting.indirectDiffuse*vec3(1.0-sampleRayTracedAo())));
}
else
{
l9_0=surfaceProperties.albedo*(lighting.directDiffuse+(lighting.indirectDiffuse*surfaceProperties.ao));
}
vec3 l9_1=lighting.directSpecular;
vec3 l9_2=lighting.indirectSpecular;
vec3 l9_3=surfaceProperties.specularAo;
vec3 l9_4=surfaceProperties.emissive;
vec3 l9_5=lighting.transmitted;
vec3 l9_6;
if (enablePremultipliedAlpha)
{
l9_6=l9_0*srgbToLinear(surfaceProperties.opacity);
}
else
{
l9_6=l9_0;
}
return ((l9_6+(l9_1+(l9_2*l9_3)))+l9_4)+l9_5;
}
vec3 linearToneMapping(vec3 x)
{
return (x*((x*1.8)+vec3(1.4)))/((x*((x*1.8)+vec3(0.5)))+vec3(1.5));
}
float linearToSrgb(float x)
{
#if ((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)
{
return pow(x,0.45454547);
}
#else
{
return sqrt(x);
}
#endif
}
vec4 ngsCalculateLighting(vec3 albedo,float opacity,vec3 normal,vec3 position,vec3 viewDir,vec3 emissive,float metallic,float roughness,vec3 ao,vec3 specularAO)
{
SurfaceProperties l9_0=defaultSurfaceProperties();
vec3 l9_1=l9_0.bakedShadows;
float l9_2=opacity;
vec3 l9_3=ssSRGB_to_Linear(albedo);
vec3 l9_4=normal;
vec3 l9_5=normalize(l9_4);
vec3 l9_6=position;
vec3 l9_7=viewDir;
vec3 l9_8=ssSRGB_to_Linear(emissive);
float l9_9=metallic;
float l9_10=roughness;
vec3 l9_11=ao;
vec3 l9_12=specularAO;
vec3 l9_13;
#if (sc_SSAOEnabled)
{
l9_13=evaluateSSAO(l9_6);
}
#else
{
l9_13=l9_11;
}
#endif
vec3 l9_14;
vec3 l9_15;
deriveAlbedoAndSpecColorFromSurfaceProperties(SurfaceProperties(l9_3,l9_2,l9_5,l9_6,l9_7,l9_9,l9_10,l9_8,l9_13,l9_12,l9_1,l9_0.specColor),l9_14,l9_15);
vec3 l9_16=l9_14;
vec3 l9_17=l9_15;
LightingComponents l9_18=evaluateLighting(SurfaceProperties(l9_16,l9_2,l9_5,l9_6,l9_7,l9_9,l9_10,l9_8,l9_13,l9_12,l9_1,l9_17));
float l9_19;
vec3 l9_20;
vec3 l9_21;
vec3 l9_22;
#if (sc_BlendMode_ColoredGlass)
{
l9_22=vec3(0.0);
l9_21=vec3(0.0);
l9_20=ssSRGB_to_Linear(sc_GetFramebufferColor().xyz)*mix(vec3(1.0),l9_16,vec3(l9_2));
l9_19=1.0;
}
#else
{
l9_22=l9_18.directDiffuse;
l9_21=l9_18.indirectDiffuse;
l9_20=l9_18.transmitted;
l9_19=l9_2;
}
#endif
bool l9_23;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_23=true;
}
#else
{
l9_23=false;
}
#endif
vec3 l9_24=combineSurfacePropertiesWithLighting(SurfaceProperties(l9_16,l9_19,l9_5,l9_6,l9_7,l9_9,l9_10,l9_8,l9_13,l9_12,l9_1,l9_17),LightingComponents(l9_22,l9_18.directSpecular,l9_21,l9_18.indirectSpecular,l9_18.emitted,l9_20),l9_23);
float l9_25=l9_24.x;
vec4 l9_26=vec4(l9_25,l9_24.yz,l9_19);
vec4 l9_27;
#if (sc_IsEditor)
{
vec4 l9_28=l9_26;
l9_28.x=l9_25+((l9_13.x*l9_12.x)*9.9999997e-06);
l9_27=l9_28;
}
#else
{
l9_27=l9_26;
}
#endif
vec4 l9_29;
#if (!sc_BlendMode_Multiply)
{
vec3 l9_30=linearToneMapping(l9_27.xyz);
l9_29=vec4(l9_30.x,l9_30.y,l9_30.z,l9_27.w);
}
#else
{
l9_29=l9_27;
}
#endif
vec3 l9_31=vec3(linearToSrgb(l9_29.x),linearToSrgb(l9_29.y),linearToSrgb(l9_29.z));
return vec4(l9_31.x,l9_31.y,l9_31.z,l9_29.w);
}
void Node26_PBR_Lighting(vec3 Albedo,float Opacity,vec3 Normal,vec3 Emissive,float Metallic,float Roughness,vec3 AO,vec3 SpecularAO,out vec4 Output,ssGlobals Globals)
{
Globals.BumpedNormal=mat3(Globals.VertexTangent_WorldSpace,Globals.VertexBinormal_WorldSpace,Globals.VertexNormal_WorldSpace)*Normal;
Opacity=clamp(Opacity,0.0,1.0);
Albedo=max(Albedo,vec3(0.0));
Output=ngsCalculateLighting(Albedo,Opacity,Globals.BumpedNormal,Globals.PositionWS,Globals.ViewDirWS,Emissive,Metallic,Roughness,AO,SpecularAO);
Output=max(Output,vec4(0.0));
}
void Node11_Conditional(float Input0,vec4 Input1,vec4 Input2,out vec4 Output,ssGlobals Globals)
{
Input0=float(isAttracting);
if ((Input0*1.0)!=0.0)
{
vec2 param_3;
Node159_Rotate_Coords(Globals.Surface_UVCoord0,Port_Rotation_N159,Port_Center_N159,param_3,Globals);
vec4 param_11;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,param_3,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,param_11,Globals);
vec4 l9_0=param_11;
vec2 l9_1=Globals.Surface_UVCoord0;
vec2 l9_2=(l9_1*Port_Input1_N031)-vec2(1.0);
float l9_3=1.0-(clamp(dot(l9_2,l9_2)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001)-0.001);
float l9_4;
if (l9_3<=0.0)
{
l9_4=0.0;
}
else
{
l9_4=sqrt(l9_3);
}
vec3 l9_5=vec3(l9_2.x,l9_2.y,vec3(0.0).z);
l9_5.z=l9_4;
vec4 param_21;
Node26_PBR_Lighting(l9_0.xyz,l9_0.w*gParticle.Color.w,mix(Port_Input0_N038,l9_5,vec3(float(distance(l9_1,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N026,Port_Metallic_N026,Port_Roughness_N026,Port_AO_N026,Port_SpecularAO_N026,param_21,Globals);
Input1=param_21;
Output=Input1;
}
else
{
vec4 l9_6=gParticle.Color;
ssGlobals l9_7=Globals;
float l9_8;
#if (Tweak_N261)
{
float l9_9;
Node240_Switch(0.0,0.0,0.0,0.0,0.0,0.0,l9_9,l9_7);
l9_8=1.0-l9_9;
}
#else
{
float l9_10;
Node240_Switch(0.0,0.0,0.0,0.0,0.0,0.0,l9_10,l9_7);
l9_8=l9_10;
}
#endif
vec4 l9_11=vec4(l9_8);
vec4 l9_12=mix(l9_6,TintColor,l9_11);
float l9_13=l9_12.x;
float l9_14;
if (l9_13<=0.0)
{
l9_14=0.0;
}
else
{
l9_14=pow(l9_13,intensity);
}
float l9_15=l9_12.y;
float l9_16;
if (l9_15<=0.0)
{
l9_16=0.0;
}
else
{
l9_16=pow(l9_15,intensity);
}
float l9_17=l9_12.z;
float l9_18;
if (l9_17<=0.0)
{
l9_18=0.0;
}
else
{
l9_18=pow(l9_17,intensity);
}
vec4 l9_19=vec4(l9_14,l9_16,l9_18,0.0);
vec4 param_26;
Node275_Conditional(1.0,vec4(1.0),vec4(0.0),param_26,Globals);
vec2 l9_20=Globals.Surface_UVCoord0;
vec2 l9_21=(l9_20*Port_Input1_N031)-vec2(1.0);
float l9_22=1.0-(clamp(dot(l9_21,l9_21)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001)-0.001);
float l9_23;
if (l9_22<=0.0)
{
l9_23=0.0;
}
else
{
l9_23=sqrt(l9_22);
}
vec3 l9_24=vec3(l9_21.x,l9_21.y,vec3(0.0).z);
l9_24.z=l9_23;
Input2=max(ngsCalculateLighting(max(l9_19.xyz,vec3(0.0)),clamp(l9_6.w*param_26.w,0.0,1.0),mat3(Globals.VertexTangent_WorldSpace,Globals.VertexBinormal_WorldSpace,Globals.VertexNormal_WorldSpace)*mix(Port_Input0_N038,l9_24,vec3(float(distance(l9_20,Port_Input1_N035)<Port_Input1_N036))),Globals.PositionWS,Globals.ViewDirWS,Port_Emissive_N258,Port_Metallic_N258,Port_Roughness_N258,Port_AO_N258,Port_SpecularAO_N258),vec4(0.0));
Output=Input2;
}
}
int intensityTextureGetStereoViewIndex()
{
int l9_0;
#if (intensityTextureHasSwappedViews)
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
float l9_48=pow(l9_47,1.0/correctedIntensity);
vec4 l9_49;
#if (intensityTextureLayout==2)
{
bool l9_50=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_51=l9_48;
sc_SoftwareWrapEarly(l9_51,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_52=l9_51;
float l9_53=0.5;
sc_SoftwareWrapEarly(l9_53,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_54=l9_53;
vec2 l9_55;
float l9_56;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_57;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_57=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_57=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_58=l9_52;
float l9_59=1.0;
sc_ClampUV(l9_58,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_57,l9_59);
float l9_60=l9_58;
float l9_61=l9_59;
bool l9_62;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_62=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_62=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_63=l9_54;
float l9_64=l9_61;
sc_ClampUV(l9_63,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_62,l9_64);
l9_56=l9_64;
l9_55=vec2(l9_60,l9_63);
}
#else
{
l9_56=1.0;
l9_55=vec2(l9_52,l9_54);
}
#endif
vec2 l9_65=sc_TransformUV(l9_55,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_66=l9_65.x;
float l9_67=l9_56;
sc_SoftwareWrapLate(l9_66,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_50,l9_67);
float l9_68=l9_65.y;
float l9_69=l9_67;
sc_SoftwareWrapLate(l9_68,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_50,l9_69);
float l9_70=l9_69;
vec3 l9_71=sc_SamplingCoordsViewToGlobal(vec2(l9_66,l9_68),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_72=texture(intensityTextureArrSC,l9_71,0.0);
vec4 l9_73;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_73=mix(intensityTextureBorderColor,l9_72,vec4(l9_70));
}
#else
{
l9_73=l9_72;
}
#endif
l9_49=l9_73;
}
#else
{
bool l9_74=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_75=l9_48;
sc_SoftwareWrapEarly(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_76=l9_75;
float l9_77=0.5;
sc_SoftwareWrapEarly(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_78=l9_77;
vec2 l9_79;
float l9_80;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_82=l9_76;
float l9_83=1.0;
sc_ClampUV(l9_82,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_81,l9_83);
float l9_84=l9_82;
float l9_85=l9_83;
bool l9_86;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_86=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_86=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_87=l9_78;
float l9_88=l9_85;
sc_ClampUV(l9_87,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_86,l9_88);
l9_80=l9_88;
l9_79=vec2(l9_84,l9_87);
}
#else
{
l9_80=1.0;
l9_79=vec2(l9_76,l9_78);
}
#endif
vec2 l9_89=sc_TransformUV(l9_79,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_90=l9_89.x;
float l9_91=l9_80;
sc_SoftwareWrapLate(l9_90,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_74,l9_91);
float l9_92=l9_89.y;
float l9_93=l9_91;
sc_SoftwareWrapLate(l9_92,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_74,l9_93);
float l9_94=l9_93;
vec3 l9_95=sc_SamplingCoordsViewToGlobal(vec2(l9_90,l9_92),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_96=texture(intensityTexture,l9_95.xy,0.0);
vec4 l9_97;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_97=mix(intensityTextureBorderColor,l9_96,vec4(l9_94));
}
#else
{
l9_97=l9_96;
}
#endif
l9_49=l9_97;
}
#endif
float l9_98=((((l9_49.x*256.0)+l9_49.y)+(l9_49.z/256.0))/257.00391)*16.0;
float l9_99;
#if (BLEND_MODE_FORGRAY)
{
l9_99=max(l9_98,1.0);
}
#else
{
l9_99=l9_98;
}
#endif
float l9_100;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_100=min(l9_99,1.0);
}
#else
{
l9_100=l9_99;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_100);
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
#if (renderTarget0Layout==2)
{
}
#else
{
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
#if (renderTarget1Layout==2)
{
}
#else
{
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
#if (renderTarget2Layout==2)
{
}
#else
{
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
#if (renderTarget3Layout==2)
{
}
#else
{
}
#endif
gParticle.Position=Interp_Particle_Position;
gParticle.Velocity=Interp_Particle_Velocity;
gParticle.Life=Interp_Particle_Life;
gParticle.Age=Interp_Particle_Age;
gParticle.Size=Interp_Particle_Size;
gParticle.Color=Interp_Particle_Color;
gParticle.Quaternion=Interp_Particle_Quaternion;
gParticle.Mass=Interp_Particle_Mass;
int l9_4=Interp_Particle_Index/1600;
float l9_5=min(overrideTimeDelta,0.5);
vec3 l9_6=normalize(varTangent.xyz);
vec3 l9_7=normalize(varNormal);
int l9_8=Interp_Particle_Index%1600;
float l9_9=float(l9_8);
ivec2 l9_10=ivec2(Interp_Particle_Index%512,Interp_Particle_Index/512);
float l9_11=float(Interp_Particle_Index);
vec2 l9_12=vec2(l9_10);
float l9_13=l9_11/1599.0;
float l9_14=l9_13*8.0;
float l9_15;
if (overrideTimeEnabled==1)
{
l9_15=overrideTimeElapsed[l9_4];
}
else
{
l9_15=sc_Time.x;
}
gParticle=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,l9_14,fract(abs(((l9_13*0.97637898)+0.151235)+(floor(((((l9_15-l9_14)-0.0)+0.0)+16.0)/8.0)*4.32723))),(vec2(ivec2(Interp_Particle_Index%400,Interp_Particle_Index/400))+vec2(1.0))/vec2(399.0),float(((Interp_Particle_Index*((Interp_Particle_Index*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,Interp_Particle_Index,l9_8,l9_9,(1600*(l9_4+1))-1,(l9_11+0.5)/1600.0,l9_13,l9_9/1599.0,l9_10,(l9_12+vec2(0.5))/vec2(512.0,4.0),l9_12/vec2(511.0,3.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
float l9_16=gParticle.TimeShift;
ssGlobals l9_17=ssGlobals(sc_Time.x,l9_5,(sc_Time.x-(l9_16*l9_5))-0.0,vec3(0.0),normalize(sc_Camera.position-varPos),varPos,l9_6,l9_7,cross(l9_7,l9_6),varPackedTex.xy,overrideTimeElapsed[l9_4]);
vec4 l9_18;
if ((float(isIdle)*1.0)!=0.0)
{
vec2 l9_19;
Node159_Rotate_Coords(varPackedTex.xy,Port_Rotation_N159,Port_Center_N159,l9_19,l9_17);
vec4 l9_20;
Node45_Flipbook_Sample(Port_SpriteCount_N045,Port_MaxFrames_N045,l9_19,gParticle.Index1DPerCopyF,(((gParticle.Ratio1DPerCopy-Port_RangeMinA_N156)/((Port_RangeMaxA_N156-Port_RangeMinA_N156)+1e-06))*(Port_RangeMaxB_N156-Port_RangeMinB_N156))+Port_RangeMinB_N156,Port_SecondOffset_N045,l9_20,l9_17);
vec4 l9_21=l9_20;
vec2 l9_22=(varPackedTex.xy*Port_Input1_N031)-vec2(1.0);
float l9_23=1.0-(clamp(dot(l9_22,l9_22)+0.001,Port_Input1_N246+0.001,Port_Input2_N246+0.001)-0.001);
float l9_24;
if (l9_23<=0.0)
{
l9_24=0.0;
}
else
{
l9_24=sqrt(l9_23);
}
vec3 l9_25=vec3(l9_22.x,l9_22.y,vec3(0.0).z);
l9_25.z=l9_24;
vec4 l9_26;
Node26_PBR_Lighting(l9_21.xyz,l9_21.w*gParticle.Color.w,mix(Port_Input0_N038,l9_25,vec3(float(distance(varPackedTex.xy,Port_Input1_N035)<Port_Input1_N036))),Port_Emissive_N026,Port_Metallic_N026,Port_Roughness_N026,Port_AO_N026,Port_SpecularAO_N026,l9_26,l9_17);
l9_18=l9_26;
}
else
{
vec4 l9_27;
Node11_Conditional(1.0,vec4(1.0),vec4(0.5,0.0,0.0,0.0),l9_27,l9_17);
l9_18=l9_27;
}
vec4 l9_28;
#if (sc_RenderAlphaToColor)
{
l9_28=vec4(l9_18.w);
}
#else
{
vec4 l9_29;
#if (sc_BlendMode_Custom)
{
vec3 l9_30=sc_GetFramebufferColor().xyz;
vec3 l9_31=mix(l9_30,definedBlend(l9_30,l9_18.xyz).xyz,vec3(l9_18.w));
vec4 l9_32=vec4(l9_31.x,l9_31.y,l9_31.z,vec4(0.0).w);
l9_32.w=1.0;
l9_29=l9_32;
}
#else
{
vec4 l9_33;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_33=vec4(mix(vec3(1.0),l9_18.xyz,vec3(l9_18.w)),l9_18.w);
}
#else
{
vec4 l9_34;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_35;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_35=clamp(l9_18.w,0.0,1.0);
}
#else
{
l9_35=l9_18.w;
}
#endif
l9_34=vec4(l9_18.xyz*l9_35,l9_35);
}
#else
{
l9_34=l9_18;
}
#endif
l9_33=l9_34;
}
#endif
l9_29=l9_33;
}
#endif
l9_28=l9_29;
}
#endif
vec4 l9_36;
#if (sc_ShaderComplexityAnalyzer)
{
l9_36=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_36=vec4(0.0);
}
#endif
vec4 l9_37;
if (l9_36.w>0.0)
{
l9_37=l9_36;
}
else
{
l9_37=l9_28;
}
sc_writeFragData0Internal(l9_37,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif // #if SC_RT_RECEIVER_MODE
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
