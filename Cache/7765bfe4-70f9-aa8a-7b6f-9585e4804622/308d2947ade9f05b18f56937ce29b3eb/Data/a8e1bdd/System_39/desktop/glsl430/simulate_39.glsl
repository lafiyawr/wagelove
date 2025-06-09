#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 position 0
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec3 normal 1
//attribute vec4 tangent 2
//sampler sampler colorrampTexSmpSC 0:22
//sampler sampler depthTextureSmpSC 0:23
//sampler sampler renderTarget0SmpSC 0:25
//sampler sampler renderTarget1SmpSC 0:26
//sampler sampler renderTarget2SmpSC 0:27
//sampler sampler renderTarget3SmpSC 0:28
//sampler sampler screenNormalsTexSmpSC 0:36
//texture texture2D colorrampTex 0:0:0:22
//texture texture2D depthTexture 0:1:0:23
//texture texture2D renderTarget0 0:3:0:25
//texture texture2D renderTarget1 0:4:0:26
//texture texture2D renderTarget2 0:5:0:27
//texture texture2D renderTarget3 0:6:0:28
//texture texture2D screenNormalsTex 0:21:0:36
//texture texture2DArray colorrampTexArrSC 0:37:0:22
//texture texture2DArray depthTextureArrSC 0:38:0:23
//texture texture2DArray renderTarget0ArrSC 0:40:0:25
//texture texture2DArray renderTarget1ArrSC 0:41:0:26
//texture texture2DArray renderTarget2ArrSC 0:42:0:27
//texture texture2DArray renderTarget3ArrSC 0:43:0:28
//texture texture2DArray screenNormalsTexArrSC 0:47:0:36
//spec_const bool SC_USE_CLAMP_TO_BORDER_colorrampTex 0 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_depthTexture 1 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenNormalsTex 2 0
//spec_const bool SC_USE_UV_MIN_MAX_colorrampTex 3 0
//spec_const bool SC_USE_UV_MIN_MAX_depthTexture 4 0
//spec_const bool SC_USE_UV_MIN_MAX_screenNormalsTex 5 0
//spec_const bool SC_USE_UV_TRANSFORM_colorrampTex 6 0
//spec_const bool SC_USE_UV_TRANSFORM_depthTexture 7 0
//spec_const bool SC_USE_UV_TRANSFORM_screenNormalsTex 8 0
//spec_const bool colorrampTexHasSwappedViews 9 0
//spec_const bool depthTextureHasSwappedViews 10 0
//spec_const bool renderTarget0HasSwappedViews 11 0
//spec_const bool renderTarget1HasSwappedViews 12 0
//spec_const bool renderTarget2HasSwappedViews 13 0
//spec_const bool renderTarget3HasSwappedViews 14 0
//spec_const bool sc_CanUseTextureLod 15 0
//spec_const bool screenNormalsTexHasSwappedViews 16 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_colorrampTex 17 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_depthTexture 18 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex 19 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_colorrampTex 20 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_depthTexture 21 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex 22 -1
//spec_const int colorrampTexLayout 23 0
//spec_const int depthTextureLayout 24 0
//spec_const int renderTarget0Layout 25 0
//spec_const int renderTarget1Layout 26 0
//spec_const int renderTarget2Layout 27 0
//spec_const int renderTarget3Layout 28 0
//spec_const int sc_ShaderCacheConstant 29 0
//spec_const int sc_StereoRenderingMode 30 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 31 0
//spec_const int sc_StereoViewID 32 0
//spec_const int screenNormalsTexLayout 33 0
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
#ifndef depthTextureHasSwappedViews
#define depthTextureHasSwappedViews 0
#elif depthTextureHasSwappedViews==1
#undef depthTextureHasSwappedViews
#define depthTextureHasSwappedViews 1
#endif
#ifndef depthTextureLayout
#define depthTextureLayout 0
#endif
#ifndef screenNormalsTexHasSwappedViews
#define screenNormalsTexHasSwappedViews 0
#elif screenNormalsTexHasSwappedViews==1
#undef screenNormalsTexHasSwappedViews
#define screenNormalsTexHasSwappedViews 1
#endif
#ifndef screenNormalsTexLayout
#define screenNormalsTexLayout 0
#endif
#ifndef colorrampTexHasSwappedViews
#define colorrampTexHasSwappedViews 0
#elif colorrampTexHasSwappedViews==1
#undef colorrampTexHasSwappedViews
#define colorrampTexHasSwappedViews 1
#endif
#ifndef colorrampTexLayout
#define colorrampTexLayout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_depthTexture
#define SC_USE_UV_TRANSFORM_depthTexture 0
#elif SC_USE_UV_TRANSFORM_depthTexture==1
#undef SC_USE_UV_TRANSFORM_depthTexture
#define SC_USE_UV_TRANSFORM_depthTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_depthTexture
#define SC_SOFTWARE_WRAP_MODE_U_depthTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_depthTexture
#define SC_SOFTWARE_WRAP_MODE_V_depthTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_depthTexture
#define SC_USE_UV_MIN_MAX_depthTexture 0
#elif SC_USE_UV_MIN_MAX_depthTexture==1
#undef SC_USE_UV_MIN_MAX_depthTexture
#define SC_USE_UV_MIN_MAX_depthTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_depthTexture
#define SC_USE_CLAMP_TO_BORDER_depthTexture 0
#elif SC_USE_CLAMP_TO_BORDER_depthTexture==1
#undef SC_USE_CLAMP_TO_BORDER_depthTexture
#define SC_USE_CLAMP_TO_BORDER_depthTexture 1
#endif
#ifndef SC_USE_UV_TRANSFORM_screenNormalsTex
#define SC_USE_UV_TRANSFORM_screenNormalsTex 0
#elif SC_USE_UV_TRANSFORM_screenNormalsTex==1
#undef SC_USE_UV_TRANSFORM_screenNormalsTex
#define SC_USE_UV_TRANSFORM_screenNormalsTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex
#define SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex
#define SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_screenNormalsTex
#define SC_USE_UV_MIN_MAX_screenNormalsTex 0
#elif SC_USE_UV_MIN_MAX_screenNormalsTex==1
#undef SC_USE_UV_MIN_MAX_screenNormalsTex
#define SC_USE_UV_MIN_MAX_screenNormalsTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_screenNormalsTex
#define SC_USE_CLAMP_TO_BORDER_screenNormalsTex 0
#elif SC_USE_CLAMP_TO_BORDER_screenNormalsTex==1
#undef SC_USE_CLAMP_TO_BORDER_screenNormalsTex
#define SC_USE_CLAMP_TO_BORDER_screenNormalsTex 1
#endif
#ifndef SC_USE_UV_TRANSFORM_colorrampTex
#define SC_USE_UV_TRANSFORM_colorrampTex 0
#elif SC_USE_UV_TRANSFORM_colorrampTex==1
#undef SC_USE_UV_TRANSFORM_colorrampTex
#define SC_USE_UV_TRANSFORM_colorrampTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_colorrampTex
#define SC_SOFTWARE_WRAP_MODE_U_colorrampTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_colorrampTex
#define SC_SOFTWARE_WRAP_MODE_V_colorrampTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_colorrampTex
#define SC_USE_UV_MIN_MAX_colorrampTex 0
#elif SC_USE_UV_MIN_MAX_colorrampTex==1
#undef SC_USE_UV_MIN_MAX_colorrampTex
#define SC_USE_UV_MIN_MAX_colorrampTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_colorrampTex
#define SC_USE_CLAMP_TO_BORDER_colorrampTex 0
#elif SC_USE_CLAMP_TO_BORDER_colorrampTex==1
#undef SC_USE_CLAMP_TO_BORDER_colorrampTex
#define SC_USE_CLAMP_TO_BORDER_colorrampTex 1
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
uniform mat3 depthTextureTransform;
uniform vec4 depthTextureUvMinMax;
uniform vec4 depthTextureBorderColor;
uniform vec4 depthTextureProjectionMatrixTerms;
uniform vec3 forceScale;
uniform mat4 vfxViewMatrixInverse;
uniform vec2 Port_Min_N079;
uniform vec2 Port_Max_N079;
uniform vec2 Port_Input0_N228;
uniform float vfxCameraAspect;
uniform float Port_Input1_N233;
uniform float Port_Input1_N235;
uniform float Port_Value3_N237;
uniform float Port_Input1_N092;
uniform float Port_Import_N068;
uniform float Port_Import_N069;
uniform float vfxCameraFar;
uniform float Port_Input0_N005;
uniform mat3 screenNormalsTexTransform;
uniform vec4 screenNormalsTexUvMinMax;
uniform vec4 screenNormalsTexBorderColor;
uniform float Port_RangeMinA_N142;
uniform float Port_RangeMaxA_N142;
uniform float Port_RangeMaxB_N142;
uniform float Port_RangeMinB_N142;
uniform vec3 Port_Input1_N173;
uniform float Port_RangeMinA_N174;
uniform float Port_RangeMaxA_N174;
uniform float Port_RangeMinB_N174;
uniform float Port_RangeMaxB_N174;
uniform vec3 direction;
uniform float strengthScale;
uniform float overrideTimeDelta;
uniform mat4 vfxProjectionMatrix;
uniform float Port_Value2_N263;
uniform mat3 colorrampTexTransform;
uniform vec4 colorrampTexUvMinMax;
uniform vec4 colorrampTexBorderColor;
uniform float Port_Min_N002;
uniform float Port_Max_N002;
uniform float Port_TimeBias_N042;
uniform float Port_ValueA_N042;
uniform float Port_TimeTransition_N042;
uniform float Port_ValueB_N042;
uniform float Port_TimeB_N042;
uniform float Port_Import_N120;
uniform float Port_Import_N121;
uniform float Port_Import_N123;
uniform float Port_Input0_N135;
uniform float Port_Input1_N148;
uniform float Port_Input2_N148;
uniform float Port_Import_N130;
uniform float Port_Input0_N151;
uniform float Port_Input1_N292;
uniform float Port_Input2_N292;
uniform float Port_Import_N267;
uniform float Port_Import_N268;
uniform float Port_Import_N155;
uniform float Port_Input4_N160;
uniform float Port_Multiplier_N165;
uniform vec2 vfxTargetSizeWrite;
uniform int vfxOffsetInstancesWrite;
uniform sampler2D renderTarget0;
uniform sampler2DArray renderTarget0ArrSC;
uniform sampler2D renderTarget1;
uniform sampler2DArray renderTarget1ArrSC;
uniform sampler2D renderTarget2;
uniform sampler2DArray renderTarget2ArrSC;
uniform sampler2D renderTarget3;
uniform sampler2DArray renderTarget3ArrSC;
uniform sampler2D depthTexture;
uniform sampler2DArray depthTextureArrSC;
uniform sampler2D screenNormalsTex;
uniform sampler2DArray screenNormalsTexArrSC;
uniform sampler2D colorrampTex;
uniform sampler2DArray colorrampTexArrSC;
out float varClipDistance;
flat out int varStereoViewID;
in vec4 position;
in vec2 texture0;
in vec2 texture1;
out vec3 varPos;
out vec4 varPackedTex;
out vec4 varScreenPos;
out vec2 varScreenTexturePos;
flat out int Interp_Particle_Index;
out vec2 Interp_Particle_Coord;
out vec3 Interp_Particle_Force;
out float Interp_Particle_SpawnIndex;
out float Interp_Particle_NextBurstTime;
out vec3 Interp_Particle_Position;
out vec3 Interp_Particle_Velocity;
out float Interp_Particle_Life;
out float Interp_Particle_Age;
out float Interp_Particle_Size;
out vec4 Interp_Particle_Color;
out vec4 Interp_Particle_Quaternion;
out float Interp_Particle_Mass;
out vec3 varNormal;
out vec4 varTangent;
out vec2 varShadowTex;
in vec3 normal;
in vec4 tangent;
out vec4 varColor;
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
Particle.Seed+=(floor(((((l9_0-Particle.SpawnOffset)-0.0)+0.0)+4.0)/2.0)*4.32723);
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
gParticle.CopyId=float(InstanceID/100000);
gParticle.SpawnIndex=-1.0;
gParticle.SpawnIndexRemainder=-1.0;
gParticle.SpawnAmount=0.0;
gParticle.BurstAmount=0.0;
gParticle.BurstPeriod=0.0;
gParticle.NextBurstTime=0.0;
int l9_0=InstanceID/100000;
int l9_1=InstanceID%100000;
float l9_2=float(l9_1);
ivec2 l9_3=ivec2(InstanceID%512,InstanceID/512);
float l9_4=float(InstanceID);
vec2 l9_5=vec2(l9_3);
float l9_6=l9_4/99999.0;
ssParticle l9_7=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,false,gParticle.Quaternion,gParticle.SpawnIndex,gParticle.SpawnIndexRemainder,gParticle.NextBurstTime,l9_6*2.0,0.0,gParticle.Seed2000,float(((InstanceID*((InstanceID*1471343)+101146501))+1559861749)&2147483647)*4.6566129e-10,InstanceID,l9_1,l9_2,(100000*(l9_0+1))-1,(l9_4+0.5)/100000.0,l9_6,l9_2/99999.0,l9_3,(l9_5+vec2(0.5))/vec2(512.0,196.0),l9_5/vec2(511.0,195.0),vec3(0.0),false,gParticle.CopyId,gParticle.SpawnAmount,gParticle.BurstAmount,gParticle.BurstPeriod);
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
l9_15=!vfxBatchEnable[sc_GetLocalInstanceID()/100000];
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
float l9_19=2.0-0.0;
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
int depthTextureGetStereoViewIndex()
{
int l9_0;
#if (depthTextureHasSwappedViews)
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
int screenNormalsTexGetStereoViewIndex()
{
int l9_0;
#if (screenNormalsTexHasSwappedViews)
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
int colorrampTexGetStereoViewIndex()
{
int l9_0;
#if (colorrampTexHasSwappedViews)
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
float l9_1=min(overrideTimeDelta,0.5);
float l9_2=gParticle.TimeShift;
float l9_3=(sc_Time.x-(l9_2*l9_1))-0.0;
gParticle.Age=mod((l9_3-gParticle.SpawnOffset)+0.0,2.0);
float l9_4=gParticle.SpawnOffset;
bool l9_5=(sc_Time.x-l9_4)<(0.0-0.0);
bool l9_6;
if (!l9_5)
{
l9_6=gParticle.Age>2.0;
}
else
{
l9_6=l9_5;
}
bool l9_7=l9_6 ? true : false;
bool l9_8=!l9_7;
bool l9_9;
if (l9_8)
{
l9_9=gParticle.Life<=9.9999997e-05;
}
else
{
l9_9=l9_8;
}
bool l9_10;
if (!l9_9)
{
l9_10=mod(((max(sc_Time.x,0.1)-gParticle.SpawnOffset)-0.0)+0.0,2.0)<=l9_1;
}
else
{
l9_10=l9_9;
}
if (l9_10)
{
if (l9_1!=0.0)
{
ssCalculateParticleSeed(gParticle,int(gParticle.CopyId));
float l9_12=floor(316.0);
gParticle.Position=(vec3(((floor(mod(gParticle.Index1DPerCopyF,l9_12))/316.0)*2.0)-1.0,((floor(gParticle.Index1DPerCopyF/l9_12)/316.0)*2.0)-1.0,0.0)*20.0)+vec3(1.0,1.0,0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(1.0);
gParticle.Age=0.0;
gParticle.Life=2.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
gParticle.Quaternion=vec4(0.0,0.0,0.0,1.0);
vec4 l9_13=ssGetParticleRandom(2,true,true,true,79.0,gParticle,0.0,sc_Time.x);
vec2 l9_14=mix(Port_Min_N079,Port_Max_N079,l9_13.xy);
vec4 l9_15;
#if (depthTextureLayout==2)
{
bool l9_16=(int(SC_USE_CLAMP_TO_BORDER_depthTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_depthTexture)!=0));
float l9_17=l9_14.x;
sc_SoftwareWrapEarly(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).x);
float l9_18=l9_17;
float l9_19=l9_14.y;
sc_SoftwareWrapEarly(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).y);
float l9_20=l9_19;
vec2 l9_21;
float l9_22;
#if (SC_USE_UV_MIN_MAX_depthTexture)
{
bool l9_23;
#if (SC_USE_CLAMP_TO_BORDER_depthTexture)
{
l9_23=ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).x==3;
}
#else
{
l9_23=(int(SC_USE_CLAMP_TO_BORDER_depthTexture)!=0);
}
#endif
float l9_24=l9_18;
float l9_25=1.0;
sc_ClampUV(l9_24,depthTextureUvMinMax.x,depthTextureUvMinMax.z,l9_23,l9_25);
float l9_26=l9_24;
float l9_27=l9_25;
bool l9_28;
#if (SC_USE_CLAMP_TO_BORDER_depthTexture)
{
l9_28=ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).y==3;
}
#else
{
l9_28=(int(SC_USE_CLAMP_TO_BORDER_depthTexture)!=0);
}
#endif
float l9_29=l9_20;
float l9_30=l9_27;
sc_ClampUV(l9_29,depthTextureUvMinMax.y,depthTextureUvMinMax.w,l9_28,l9_30);
l9_22=l9_30;
l9_21=vec2(l9_26,l9_29);
}
#else
{
l9_22=1.0;
l9_21=vec2(l9_18,l9_20);
}
#endif
vec2 l9_31=sc_TransformUV(l9_21,(int(SC_USE_UV_TRANSFORM_depthTexture)!=0),depthTextureTransform);
float l9_32=l9_31.x;
float l9_33=l9_22;
sc_SoftwareWrapLate(l9_32,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).x,l9_16,l9_33);
float l9_34=l9_31.y;
float l9_35=l9_33;
sc_SoftwareWrapLate(l9_34,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).y,l9_16,l9_35);
float l9_36=l9_35;
vec3 l9_37=sc_SamplingCoordsViewToGlobal(vec2(l9_32,l9_34),depthTextureLayout,depthTextureGetStereoViewIndex());
vec4 l9_38;
#if (sc_CanUseTextureLod)
{
l9_38=textureLod(depthTextureArrSC,l9_37,0.0);
}
#else
{
l9_38=vec4(0.0);
}
#endif
vec4 l9_39;
#if (SC_USE_CLAMP_TO_BORDER_depthTexture)
{
l9_39=mix(depthTextureBorderColor,l9_38,vec4(l9_36));
}
#else
{
l9_39=l9_38;
}
#endif
l9_15=l9_39;
}
#else
{
bool l9_40=(int(SC_USE_CLAMP_TO_BORDER_depthTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_depthTexture)!=0));
float l9_41=l9_14.x;
sc_SoftwareWrapEarly(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).x);
float l9_42=l9_41;
float l9_43=l9_14.y;
sc_SoftwareWrapEarly(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).y);
float l9_44=l9_43;
vec2 l9_45;
float l9_46;
#if (SC_USE_UV_MIN_MAX_depthTexture)
{
bool l9_47;
#if (SC_USE_CLAMP_TO_BORDER_depthTexture)
{
l9_47=ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).x==3;
}
#else
{
l9_47=(int(SC_USE_CLAMP_TO_BORDER_depthTexture)!=0);
}
#endif
float l9_48=l9_42;
float l9_49=1.0;
sc_ClampUV(l9_48,depthTextureUvMinMax.x,depthTextureUvMinMax.z,l9_47,l9_49);
float l9_50=l9_48;
float l9_51=l9_49;
bool l9_52;
#if (SC_USE_CLAMP_TO_BORDER_depthTexture)
{
l9_52=ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).y==3;
}
#else
{
l9_52=(int(SC_USE_CLAMP_TO_BORDER_depthTexture)!=0);
}
#endif
float l9_53=l9_44;
float l9_54=l9_51;
sc_ClampUV(l9_53,depthTextureUvMinMax.y,depthTextureUvMinMax.w,l9_52,l9_54);
l9_46=l9_54;
l9_45=vec2(l9_50,l9_53);
}
#else
{
l9_46=1.0;
l9_45=vec2(l9_42,l9_44);
}
#endif
vec2 l9_55=sc_TransformUV(l9_45,(int(SC_USE_UV_TRANSFORM_depthTexture)!=0),depthTextureTransform);
float l9_56=l9_55.x;
float l9_57=l9_46;
sc_SoftwareWrapLate(l9_56,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).x,l9_40,l9_57);
float l9_58=l9_55.y;
float l9_59=l9_57;
sc_SoftwareWrapLate(l9_58,ivec2(SC_SOFTWARE_WRAP_MODE_U_depthTexture,SC_SOFTWARE_WRAP_MODE_V_depthTexture).y,l9_40,l9_59);
float l9_60=l9_59;
vec3 l9_61=sc_SamplingCoordsViewToGlobal(vec2(l9_56,l9_58),depthTextureLayout,depthTextureGetStereoViewIndex());
vec4 l9_62=textureLod(depthTexture,l9_61.xy,0.0);
vec4 l9_63;
#if (SC_USE_CLAMP_TO_BORDER_depthTexture)
{
l9_63=mix(depthTextureBorderColor,l9_62,vec4(l9_60));
}
#else
{
l9_63=l9_62;
}
#endif
l9_15=l9_63;
}
#endif
float l9_64=(l9_15.x*2.0)-1.0;
float l9_65;
if (depthTextureProjectionMatrixTerms.z==0.0)
{
l9_65=(l9_64-depthTextureProjectionMatrixTerms.y)/depthTextureProjectionMatrixTerms.x;
}
else
{
l9_65=depthTextureProjectionMatrixTerms.y/((-l9_64)-depthTextureProjectionMatrixTerms.x);
}
vec2 l9_66=(((Port_Input0_N228-l9_14)*vec2(vfxCameraAspect,1.0))*vec2(tan(radians((atan(1.0/vfxProjectionMatrix[1].y)*2.0)*57.29578)*Port_Input1_N233)*Port_Input1_N235))*vec4(l9_65).xy;
vec4 l9_67=vec4(l9_66.x,l9_66.y,vec4(0.0).z,vec4(0.0).w);
l9_67.z=l9_65;
vec4 l9_68=l9_67;
l9_68.w=Port_Value3_N237;
gParticle.Position=(vfxViewMatrixInverse*l9_68).xyz;
vec3 l9_69=forceScale*vec3(Port_Input1_N092);
gParticle.Position+=mix(-l9_69,l9_69,ssGetParticleRandom(3,false,true,true,94.0,gParticle,0.0,sc_Time.x).xyz);
gParticle.Mass=mix(Port_Import_N068,Port_Import_N069,ssGetParticleRandom(1,true,true,true,71.0,gParticle,0.0,sc_Time.x).x);
gParticle.Mass=max(9.9999997e-06,gParticle.Mass);
if ((float(Port_Input0_N005<(-vfxCameraFar))*1.0)!=0.0)
{
gParticle.Dead=true;
}
vec4 l9_70;
#if (screenNormalsTexLayout==2)
{
bool l9_71=(int(SC_USE_CLAMP_TO_BORDER_screenNormalsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenNormalsTex)!=0));
float l9_72=l9_14.x;
sc_SoftwareWrapEarly(l9_72,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).x);
float l9_73=l9_72;
float l9_74=l9_14.y;
sc_SoftwareWrapEarly(l9_74,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).y);
float l9_75=l9_74;
vec2 l9_76;
float l9_77;
#if (SC_USE_UV_MIN_MAX_screenNormalsTex)
{
bool l9_78;
#if (SC_USE_CLAMP_TO_BORDER_screenNormalsTex)
{
l9_78=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).x==3;
}
#else
{
l9_78=(int(SC_USE_CLAMP_TO_BORDER_screenNormalsTex)!=0);
}
#endif
float l9_79=l9_73;
float l9_80=1.0;
sc_ClampUV(l9_79,screenNormalsTexUvMinMax.x,screenNormalsTexUvMinMax.z,l9_78,l9_80);
float l9_81=l9_79;
float l9_82=l9_80;
bool l9_83;
#if (SC_USE_CLAMP_TO_BORDER_screenNormalsTex)
{
l9_83=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).y==3;
}
#else
{
l9_83=(int(SC_USE_CLAMP_TO_BORDER_screenNormalsTex)!=0);
}
#endif
float l9_84=l9_75;
float l9_85=l9_82;
sc_ClampUV(l9_84,screenNormalsTexUvMinMax.y,screenNormalsTexUvMinMax.w,l9_83,l9_85);
l9_77=l9_85;
l9_76=vec2(l9_81,l9_84);
}
#else
{
l9_77=1.0;
l9_76=vec2(l9_73,l9_75);
}
#endif
vec2 l9_86=sc_TransformUV(l9_76,(int(SC_USE_UV_TRANSFORM_screenNormalsTex)!=0),screenNormalsTexTransform);
float l9_87=l9_86.x;
float l9_88=l9_77;
sc_SoftwareWrapLate(l9_87,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).x,l9_71,l9_88);
float l9_89=l9_86.y;
float l9_90=l9_88;
sc_SoftwareWrapLate(l9_89,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).y,l9_71,l9_90);
float l9_91=l9_90;
vec3 l9_92=sc_SamplingCoordsViewToGlobal(vec2(l9_87,l9_89),screenNormalsTexLayout,screenNormalsTexGetStereoViewIndex());
vec4 l9_93;
#if (sc_CanUseTextureLod)
{
l9_93=textureLod(screenNormalsTexArrSC,l9_92,0.0);
}
#else
{
l9_93=vec4(0.0);
}
#endif
vec4 l9_94;
#if (SC_USE_CLAMP_TO_BORDER_screenNormalsTex)
{
l9_94=mix(screenNormalsTexBorderColor,l9_93,vec4(l9_91));
}
#else
{
l9_94=l9_93;
}
#endif
l9_70=l9_94;
}
#else
{
bool l9_95=(int(SC_USE_CLAMP_TO_BORDER_screenNormalsTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_screenNormalsTex)!=0));
float l9_96=l9_14.x;
sc_SoftwareWrapEarly(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).x);
float l9_97=l9_96;
float l9_98=l9_14.y;
sc_SoftwareWrapEarly(l9_98,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).y);
float l9_99=l9_98;
vec2 l9_100;
float l9_101;
#if (SC_USE_UV_MIN_MAX_screenNormalsTex)
{
bool l9_102;
#if (SC_USE_CLAMP_TO_BORDER_screenNormalsTex)
{
l9_102=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).x==3;
}
#else
{
l9_102=(int(SC_USE_CLAMP_TO_BORDER_screenNormalsTex)!=0);
}
#endif
float l9_103=l9_97;
float l9_104=1.0;
sc_ClampUV(l9_103,screenNormalsTexUvMinMax.x,screenNormalsTexUvMinMax.z,l9_102,l9_104);
float l9_105=l9_103;
float l9_106=l9_104;
bool l9_107;
#if (SC_USE_CLAMP_TO_BORDER_screenNormalsTex)
{
l9_107=ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).y==3;
}
#else
{
l9_107=(int(SC_USE_CLAMP_TO_BORDER_screenNormalsTex)!=0);
}
#endif
float l9_108=l9_99;
float l9_109=l9_106;
sc_ClampUV(l9_108,screenNormalsTexUvMinMax.y,screenNormalsTexUvMinMax.w,l9_107,l9_109);
l9_101=l9_109;
l9_100=vec2(l9_105,l9_108);
}
#else
{
l9_101=1.0;
l9_100=vec2(l9_97,l9_99);
}
#endif
vec2 l9_110=sc_TransformUV(l9_100,(int(SC_USE_UV_TRANSFORM_screenNormalsTex)!=0),screenNormalsTexTransform);
float l9_111=l9_110.x;
float l9_112=l9_101;
sc_SoftwareWrapLate(l9_111,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).x,l9_95,l9_112);
float l9_113=l9_110.y;
float l9_114=l9_112;
sc_SoftwareWrapLate(l9_113,ivec2(SC_SOFTWARE_WRAP_MODE_U_screenNormalsTex,SC_SOFTWARE_WRAP_MODE_V_screenNormalsTex).y,l9_95,l9_114);
float l9_115=l9_114;
vec3 l9_116=sc_SamplingCoordsViewToGlobal(vec2(l9_111,l9_113),screenNormalsTexLayout,screenNormalsTexGetStereoViewIndex());
vec4 l9_117=textureLod(screenNormalsTex,l9_116.xy,0.0);
vec4 l9_118;
#if (SC_USE_CLAMP_TO_BORDER_screenNormalsTex)
{
l9_118=mix(screenNormalsTexBorderColor,l9_117,vec4(l9_115));
}
#else
{
l9_118=l9_117;
}
#endif
l9_70=l9_118;
}
#endif
float l9_119=(((dot((((l9_70.xyz-vec3(Port_RangeMinA_N142))/vec3((Port_RangeMaxA_N142-Port_RangeMinA_N142)+1e-06))*(Port_RangeMaxB_N142-Port_RangeMinB_N142))+vec3(Port_RangeMinB_N142),Port_Input1_N173)-Port_RangeMinA_N174)/((Port_RangeMaxA_N174-Port_RangeMinA_N174)+1e-06))*(Port_RangeMaxB_N174-Port_RangeMinB_N174))+Port_RangeMinB_N174;
float l9_120;
if (Port_RangeMaxB_N174>Port_RangeMinB_N174)
{
l9_120=clamp(l9_119,Port_RangeMinB_N174,Port_RangeMaxB_N174);
}
else
{
l9_120=clamp(l9_119,Port_RangeMaxB_N174,Port_RangeMinB_N174);
}
gParticle.Color*=vec4(l9_120);
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
float l9_121=gParticle.Age;
float l9_122=gParticle.Life;
float l9_123=clamp(l9_121/l9_122,0.0,1.0);
vec4 l9_124;
#if (colorrampTexLayout==2)
{
bool l9_125=(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_colorrampTex)!=0));
float l9_126=l9_123;
sc_SoftwareWrapEarly(l9_126,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).x);
float l9_127=l9_126;
float l9_128=Port_Value2_N263;
sc_SoftwareWrapEarly(l9_128,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).y);
float l9_129=l9_128;
vec2 l9_130;
float l9_131;
#if (SC_USE_UV_MIN_MAX_colorrampTex)
{
bool l9_132;
#if (SC_USE_CLAMP_TO_BORDER_colorrampTex)
{
l9_132=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).x==3;
}
#else
{
l9_132=(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0);
}
#endif
float l9_133=l9_127;
float l9_134=1.0;
sc_ClampUV(l9_133,colorrampTexUvMinMax.x,colorrampTexUvMinMax.z,l9_132,l9_134);
float l9_135=l9_133;
float l9_136=l9_134;
bool l9_137;
#if (SC_USE_CLAMP_TO_BORDER_colorrampTex)
{
l9_137=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).y==3;
}
#else
{
l9_137=(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0);
}
#endif
float l9_138=l9_129;
float l9_139=l9_136;
sc_ClampUV(l9_138,colorrampTexUvMinMax.y,colorrampTexUvMinMax.w,l9_137,l9_139);
l9_131=l9_139;
l9_130=vec2(l9_135,l9_138);
}
#else
{
l9_131=1.0;
l9_130=vec2(l9_127,l9_129);
}
#endif
vec2 l9_140=sc_TransformUV(l9_130,(int(SC_USE_UV_TRANSFORM_colorrampTex)!=0),colorrampTexTransform);
float l9_141=l9_140.x;
float l9_142=l9_131;
sc_SoftwareWrapLate(l9_141,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).x,l9_125,l9_142);
float l9_143=l9_140.y;
float l9_144=l9_142;
sc_SoftwareWrapLate(l9_143,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).y,l9_125,l9_144);
float l9_145=l9_144;
vec3 l9_146=sc_SamplingCoordsViewToGlobal(vec2(l9_141,l9_143),colorrampTexLayout,colorrampTexGetStereoViewIndex());
vec4 l9_147;
#if (sc_CanUseTextureLod)
{
l9_147=textureLod(colorrampTexArrSC,l9_146,0.0);
}
#else
{
l9_147=vec4(0.0);
}
#endif
vec4 l9_148;
#if (SC_USE_CLAMP_TO_BORDER_colorrampTex)
{
l9_148=mix(colorrampTexBorderColor,l9_147,vec4(l9_145));
}
#else
{
l9_148=l9_147;
}
#endif
l9_124=l9_148;
}
#else
{
bool l9_149=(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_colorrampTex)!=0));
float l9_150=l9_123;
sc_SoftwareWrapEarly(l9_150,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).x);
float l9_151=l9_150;
float l9_152=Port_Value2_N263;
sc_SoftwareWrapEarly(l9_152,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).y);
float l9_153=l9_152;
vec2 l9_154;
float l9_155;
#if (SC_USE_UV_MIN_MAX_colorrampTex)
{
bool l9_156;
#if (SC_USE_CLAMP_TO_BORDER_colorrampTex)
{
l9_156=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).x==3;
}
#else
{
l9_156=(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0);
}
#endif
float l9_157=l9_151;
float l9_158=1.0;
sc_ClampUV(l9_157,colorrampTexUvMinMax.x,colorrampTexUvMinMax.z,l9_156,l9_158);
float l9_159=l9_157;
float l9_160=l9_158;
bool l9_161;
#if (SC_USE_CLAMP_TO_BORDER_colorrampTex)
{
l9_161=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).y==3;
}
#else
{
l9_161=(int(SC_USE_CLAMP_TO_BORDER_colorrampTex)!=0);
}
#endif
float l9_162=l9_153;
float l9_163=l9_160;
sc_ClampUV(l9_162,colorrampTexUvMinMax.y,colorrampTexUvMinMax.w,l9_161,l9_163);
l9_155=l9_163;
l9_154=vec2(l9_159,l9_162);
}
#else
{
l9_155=1.0;
l9_154=vec2(l9_151,l9_153);
}
#endif
vec2 l9_164=sc_TransformUV(l9_154,(int(SC_USE_UV_TRANSFORM_colorrampTex)!=0),colorrampTexTransform);
float l9_165=l9_164.x;
float l9_166=l9_155;
sc_SoftwareWrapLate(l9_165,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).x,l9_149,l9_166);
float l9_167=l9_164.y;
float l9_168=l9_166;
sc_SoftwareWrapLate(l9_167,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorrampTex,SC_SOFTWARE_WRAP_MODE_V_colorrampTex).y,l9_149,l9_168);
float l9_169=l9_168;
vec3 l9_170=sc_SamplingCoordsViewToGlobal(vec2(l9_165,l9_167),colorrampTexLayout,colorrampTexGetStereoViewIndex());
vec4 l9_171=textureLod(colorrampTex,l9_170.xy,0.0);
vec4 l9_172;
#if (SC_USE_CLAMP_TO_BORDER_colorrampTex)
{
l9_172=mix(colorrampTexBorderColor,l9_171,vec4(l9_169));
}
#else
{
l9_172=l9_171;
}
#endif
l9_124=l9_172;
}
#endif
float l9_173=mix(Port_Min_N002,Port_Max_N002,ssGetParticleRandom(1,false,true,true,2.0,gParticle,0.0,sc_Time.x).x);
float l9_174=((l9_173+Port_TimeTransition_N042)+Port_TimeB_N042)+9.9999997e-05;
gParticle.Color=l9_124+vec4(mix(Port_ValueA_N042,Port_ValueB_N042,smoothstep(l9_173/l9_174,1.0-(Port_TimeB_N042/l9_174),abs((mod((l9_3/l9_174)+Port_TimeBias_N042,1.0)*2.0)-1.0))));
float l9_175=clamp(gParticle.Age/gParticle.Life,0.0,1.0);
float l9_176=gParticle.Life+1.234e-06;
gParticle.Size=mix(Port_Import_N120,Port_Import_N121,(clamp((l9_175*(Port_Input0_N135/((Port_Import_N123/l9_176)+1.234e-06)))+0.001,Port_Input1_N148+0.001,Port_Input2_N148+0.001)-0.001)*(clamp(((1.0-l9_175)*(Port_Input0_N151/((Port_Import_N130/l9_176)+1.234e-06)))+0.001,Port_Input1_N292+0.001,Port_Input2_N292+0.001)-0.001));
float l9_177=dot(direction,direction);
float l9_178;
if (l9_177>0.0)
{
l9_178=1.0/sqrt(l9_177);
}
else
{
l9_178=0.0;
}
gParticle.Force+=((direction*l9_178)*vec3(strengthScale));
vec3 l9_179=abs(gParticle.Velocity*vec3(gParticle.Mass))/(vec3(l9_1*Port_Multiplier_N165)+vec3(1.234e-06));
gParticle.Force+=clamp((((vec3(Port_Import_N267)*vec3(Port_Import_N268))*vec3(Port_Import_N155))*((-gParticle.Velocity)*vec3(length(gParticle.Velocity))))*vec3(Port_Input4_N160),-l9_179,l9_179);
gParticle.Quaternion=matrixToQuaternion(gParticle.Matrix);
if (gParticle.Dead)
{
sc_SetClipPosition(vec4(4334.0,4334.0,4334.0,0.0));
return;
}
float l9_180;
if (abs(gParticle.Force.x)<0.0049999999)
{
l9_180=0.0;
}
else
{
l9_180=gParticle.Force.x;
}
gParticle.Force.x=l9_180;
float l9_181;
if (abs(gParticle.Force.y)<0.0049999999)
{
l9_181=0.0;
}
else
{
l9_181=gParticle.Force.y;
}
gParticle.Force.y=l9_181;
float l9_182;
if (abs(gParticle.Force.z)<0.0049999999)
{
l9_182=0.0;
}
else
{
l9_182=gParticle.Force.z;
}
gParticle.Force.z=l9_182;
gParticle.Mass=max(0.0049999999,gParticle.Mass);
if (l9_1!=0.0)
{
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*l9_1);
}
float l9_183;
if (abs(gParticle.Velocity.x)<0.0049999999)
{
l9_183=0.0;
}
else
{
l9_183=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_183;
float l9_184;
if (abs(gParticle.Velocity.y)<0.0049999999)
{
l9_184=0.0;
}
else
{
l9_184=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_184;
float l9_185;
if (abs(gParticle.Velocity.z)<0.0049999999)
{
l9_185=0.0;
}
else
{
l9_185=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_185;
gParticle.Position+=(gParticle.Velocity*l9_1);
vec2 l9_186=vec2(4.0,1.0)/vec2(2048.0,vfxTargetSizeWrite.y);
int l9_187=vfxOffsetInstancesWrite+sc_GetLocalInstanceID();
float l9_188;
if (texture0.x<0.5)
{
l9_188=0.0;
}
else
{
l9_188=l9_186.x;
}
float l9_189;
if (texture0.y<0.5)
{
l9_189=0.0;
}
else
{
l9_189=l9_186.y;
}
sc_SetClipPosition(vec4(((vec2(l9_188,l9_189)+(vec2(float(l9_187%512),float(l9_187/512))*l9_186))*2.0)-vec2(1.0),1.0,1.0));
Interp_Particle_Index=sc_GetLocalInstanceID();
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
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
flat in int Interp_Particle_Index;
in vec3 Interp_Particle_Position;
in vec3 Interp_Particle_Velocity;
in float Interp_Particle_Life;
in float Interp_Particle_Age;
in float Interp_Particle_Size;
in vec4 Interp_Particle_Color;
in vec4 Interp_Particle_Quaternion;
in float Interp_Particle_Mass;
in float Interp_Particle_SpawnIndex;
in float Interp_Particle_NextBurstTime;
in vec2 Interp_Particle_Coord;
in vec3 varPos;
in vec3 varNormal;
in vec4 varTangent;
in vec4 varPackedTex;
in vec4 varScreenPos;
in vec2 varScreenTexturePos;
in vec4 varColor;
in vec3 Interp_Particle_Force;
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
vec4 l9_43=ssEncodeFloat32(Interp_Particle_Life,0.0,2.0,0.99998999);
vec4 l9_44=ssEncodeFloat32(Interp_Particle_Age,0.0,2.0,0.99998999);
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
