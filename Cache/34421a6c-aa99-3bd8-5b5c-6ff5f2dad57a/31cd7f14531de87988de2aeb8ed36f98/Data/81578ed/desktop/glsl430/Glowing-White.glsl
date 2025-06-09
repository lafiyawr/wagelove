#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler intensityTextureSmpSC 0:16
//sampler sampler opacityTextureSmpSC 0:17
//sampler sampler sc_OITCommonSampler 0:20
//sampler sampler sc_ScreenTextureSmpSC 0:22
//texture texture2D intensityTexture 0:0:0:16
//texture texture2D opacityTexture 0:1:0:17
//texture texture2D sc_OITAlpha0 0:4:0:20
//texture texture2D sc_OITAlpha1 0:5:0:20
//texture texture2D sc_OITDepthHigh0 0:6:0:20
//texture texture2D sc_OITDepthHigh1 0:7:0:20
//texture texture2D sc_OITDepthLow0 0:8:0:20
//texture texture2D sc_OITDepthLow1 0:9:0:20
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:10:0:20
//texture texture2D sc_OITFrontDepthTexture 0:11:0:20
//texture texture2D sc_ScreenTexture 0:13:0:22
//texture texture2DArray intensityTextureArrSC 0:25:0:16
//texture texture2DArray opacityTextureArrSC 0:26:0:17
//texture texture2DArray sc_ScreenTextureArrSC 0:29:0:22
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
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_DISABLE_FRUSTUM_CULLING 31 0
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 35 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTexture 36 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 37 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTexture 38 0
//spec_const bool Tweak_N12 39 0
//spec_const bool Tweak_N130 40 0
//spec_const bool Tweak_N68 41 0
//spec_const bool Tweak_N75 42 0
//spec_const bool Tweak_N76 43 0
//spec_const bool Tweak_N87 44 0
//spec_const bool Tweak_N89 45 0
//spec_const bool UseViewSpaceDepthVariant 46 1
//spec_const bool animated 47 0
//spec_const bool intensityTextureHasSwappedViews 48 0
//spec_const bool opacityTextureHasSwappedViews 49 0
//spec_const bool sc_BlendMode_Add 50 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 51 0
//spec_const bool sc_BlendMode_AlphaTest 52 0
//spec_const bool sc_BlendMode_AlphaToCoverage 53 0
//spec_const bool sc_BlendMode_ColoredGlass 54 0
//spec_const bool sc_BlendMode_Custom 55 0
//spec_const bool sc_BlendMode_Max 56 0
//spec_const bool sc_BlendMode_Min 57 0
//spec_const bool sc_BlendMode_Multiply 58 0
//spec_const bool sc_BlendMode_MultiplyOriginal 59 0
//spec_const bool sc_BlendMode_Normal 60 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 61 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 62 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 63 0
//spec_const bool sc_BlendMode_Screen 64 0
//spec_const bool sc_BlendMode_Software 65 0
//spec_const bool sc_DepthOnly 66 0
//spec_const bool sc_FramebufferFetch 67 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 68 0
//spec_const bool sc_IsEditor 69 0
//spec_const bool sc_MotionVectorsPass 70 0
//spec_const bool sc_OITCompositingPass 71 0
//spec_const bool sc_OITDepthBoundsPass 72 0
//spec_const bool sc_OITDepthGatherPass 73 0
//spec_const bool sc_OITDepthPrepass 74 0
//spec_const bool sc_OITFrontLayerPass 75 0
//spec_const bool sc_OITMaxLayers4Plus1 76 0
//spec_const bool sc_OITMaxLayers8 77 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 78 0
//spec_const bool sc_ProjectiveShadowsCaster 79 0
//spec_const bool sc_ProjectiveShadowsReceiver 80 0
//spec_const bool sc_RenderAlphaToColor 81 0
//spec_const bool sc_ScreenTextureHasSwappedViews 82 0
//spec_const bool sc_ShaderComplexityAnalyzer 83 0
//spec_const bool sc_TAAEnabled 84 0
//spec_const bool sc_UseFramebufferFetchMarker 85 0
//spec_const bool sc_VertexBlending 86 0
//spec_const bool sc_VertexBlendingUseNormals 87 0
//spec_const int SC_DEVICE_CLASS 88 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 89 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTexture 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 91 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTexture 92 -1
//spec_const int intensityTextureLayout 93 0
//spec_const int opacityTextureLayout 94 0
//spec_const int sc_DepthBufferMode 95 0
//spec_const int sc_RenderingSpace 96 -1
//spec_const int sc_ScreenTextureLayout 97 0
//spec_const int sc_ShaderCacheConstant 98 0
//spec_const int sc_SkinBonesCount 99 0
//spec_const int sc_StereoRenderingMode 100 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 101 0
//spec_const int sc_StereoViewID 102 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define SC_DISABLE_FRUSTUM_CULLING 1
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
struct sc_Vertex_t
{
vec4 position;
vec3 normal;
vec3 tangent;
vec2 texture0;
vec2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec3 SurfacePosition_ObjectSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexNormal_ObjectSpace;
vec2 gTriplanarCoords;
vec3 SurfacePosition_WorldSpace;
vec2 gScreenCoord;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_TAAEnabled
#define sc_TAAEnabled 0
#elif sc_TAAEnabled==1
#undef sc_TAAEnabled
#define sc_TAAEnabled 1
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
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef sc_VertexBlending
#define sc_VertexBlending 0
#elif sc_VertexBlending==1
#undef sc_VertexBlending
#define sc_VertexBlending 1
#endif
#ifndef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 0
#elif sc_VertexBlendingUseNormals==1
#undef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 1
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
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
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
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef Tweak_N75
#define Tweak_N75 0
#elif Tweak_N75==1
#undef Tweak_N75
#define Tweak_N75 1
#endif
#ifndef Tweak_N76
#define Tweak_N76 0
#elif Tweak_N76==1
#undef Tweak_N76
#define Tweak_N76 1
#endif
#ifndef Tweak_N87
#define Tweak_N87 0
#elif Tweak_N87==1
#undef Tweak_N87
#define Tweak_N87 1
#endif
#ifndef Tweak_N130
#define Tweak_N130 0
#elif Tweak_N130==1
#undef Tweak_N130
#define Tweak_N130 1
#endif
#ifndef animated
#define animated 0
#elif animated==1
#undef animated
#define animated 1
#endif
#ifndef Tweak_N68
#define Tweak_N68 0
#elif Tweak_N68==1
#undef Tweak_N68
#define Tweak_N68 1
#endif
#ifndef Tweak_N89
#define Tweak_N89 0
#elif Tweak_N89==1
#undef Tweak_N89
#define Tweak_N89 1
#endif
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform vec4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
uniform mat3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform float sc_DisableFrustumCullingMarker;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrix;
uniform int PreviewEnabled;
uniform float glitchFrequency;
uniform float glitchSpeed;
uniform float glitchOffset;
uniform float Port_RangeMinA_N002;
uniform float Port_RangeMaxA_N002;
uniform float Port_RangeMaxB_N002;
uniform float Port_RangeMinB_N002;
uniform float Port_RangeMinA_N103;
uniform float Port_RangeMaxA_N103;
uniform float Port_RangeMaxB_N103;
uniform float Port_RangeMinB_N103;
uniform float glitchIntensity;
uniform float glitchScale;
uniform float Port_Input0_N009;
uniform float Port_Import_N181;
uniform float Port_Input1_N182;
uniform float Port_Input2_N182;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_LocalAabbMin;
uniform float Port_Import_N174;
uniform vec2 Port_Scale_N164;
uniform float Port_RangeMinA_N034;
uniform float Port_RangeMaxA_N034;
uniform float Port_RangeMaxB_N034;
uniform float Port_RangeMinB_N034;
uniform float Port_Input1_N055;
uniform float Port_Input1_N056;
uniform float Port_Input1_N066;
uniform float Port_Import_N203;
uniform float Port_Input1_N140;
uniform float Port_Input1_N141;
uniform float Port_Input2_N110;
uniform float Port_Input1_N117;
uniform float thickLines;
uniform float scanlineSpeed;
uniform float Port_RangeMinA_N063;
uniform float Port_RangeMaxA_N063;
uniform float Port_RangeMaxB_N063;
uniform float Port_RangeMinB_N063;
uniform float Offset;
uniform float Port_RangeMinA_N067;
uniform float Port_RangeMaxA_N067;
uniform float Port_RangeMaxB_N067;
uniform float Port_RangeMinB_N067;
uniform float Port_Input1_N078;
uniform float randScale;
uniform float Port_Input0_N129;
uniform float Port_Import_N071;
uniform float Port_Input1_N072;
uniform float Port_Input2_N072;
uniform float Port_Import_N106;
uniform vec2 Port_Scale_N041;
uniform float Port_Input1_N122;
uniform float Port_Input1_N125;
uniform float Port_Input1_N126;
uniform float Port_Input2_N126;
uniform vec4 sc_Time;
uniform mat4 sc_ModelMatrixInverse;
out float varClipDistance;
flat out int varStereoViewID;
in vec4 boneData;
in vec3 blendShape0Pos;
in vec3 blendShape0Normal;
in vec3 blendShape1Pos;
in vec3 blendShape1Normal;
in vec3 blendShape2Pos;
in vec3 blendShape2Normal;
in vec3 blendShape3Pos;
in vec3 blendShape4Pos;
in vec3 blendShape5Pos;
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
out vec2 varShadowTex;
out float varViewSpaceDepth;
out vec4 varColor;
in vec4 color;
out vec4 PreviewVertexColor;
out float PreviewVertexSaved;
in vec3 positionNext;
in vec3 positionPrevious;
in vec4 strandProperties;
void blendTargetShapeWithNormal(inout sc_Vertex_t v,vec3 position_1,vec3 normal_1,float weight)
{
vec3 l9_0=v.position.xyz+(position_1*weight);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
v.normal+=(normal_1*weight);
}
void sc_GetBoneMatrix(int index,out vec4 m0,out vec4 m1,out vec4 m2)
{
int l9_0=3*index;
m0=sc_BoneMatrices[l9_0];
m1=sc_BoneMatrices[l9_0+1];
m2=sc_BoneMatrices[l9_0+2];
}
vec3 skinVertexPosition(int i,vec4 v)
{
vec3 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 param_1;
vec4 param_2;
vec4 param_3;
sc_GetBoneMatrix(i,param_1,param_2,param_3);
l9_0=vec3(dot(v,param_1),dot(v,param_2),dot(v,param_3));
}
#else
{
l9_0=v.xyz;
}
#endif
return l9_0;
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
void Node105_If_else(float Bool1,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if (Tweak_N87)
{
Value1=(Globals.gTimeElapsed*((((glitchSpeed-Port_RangeMinA_N002)/((Port_RangeMaxA_N002-Port_RangeMinA_N002)+1e-06))*(Port_RangeMaxB_N002-Port_RangeMinB_N002))+Port_RangeMinB_N002))+((((glitchOffset-Port_RangeMinA_N103)/((Port_RangeMaxA_N103-Port_RangeMinA_N103)+1e-06))*(Port_RangeMaxB_N103-Port_RangeMinB_N103))+Port_RangeMinB_N103);
Result=Value1;
}
#else
{
Default=(((glitchOffset-Port_RangeMinA_N103)/((Port_RangeMaxA_N103-Port_RangeMinA_N103)+1e-06))*(Port_RangeMaxB_N103-Port_RangeMinB_N103))+Port_RangeMinB_N103;
Result=Default;
}
#endif
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
void Node164_Noise_Simplex(vec2 Seed,vec2 Scale,out float Noise,ssGlobals Globals)
{
Seed.x=floor(Seed.x*10000.0)*9.9999997e-05;
Seed.y=floor(Seed.y*10000.0)*9.9999997e-05;
Seed*=(Scale*0.5);
Noise=(snoise(Seed)*0.5)+0.5;
Noise=floor(Noise*10000.0)*9.9999997e-05;
}
void Node183_Loop_Triplanar_UV(float Input,vec3 Position,vec3 Normal,vec3 Scale,vec3 Offset_1,float Sharpness,out float Output,ssGlobals Globals)
{
Scale=vec3(clamp(glitchScale,0.0,1.0));
float param_3;
Node105_If_else(0.0,0.0,0.0,param_3,Globals);
Offset_1=vec3(Port_Input0_N009*param_3);
Sharpness=clamp(Port_Import_N181+0.001,Port_Input1_N182+0.001,Port_Input2_N182+0.001)-0.001;
Position=(Globals.SurfacePosition_ObjectSpace/(vec3(length(sc_LocalAabbMax-sc_LocalAabbMin))+vec3(1.234e-06)))*vec3(max(Port_Import_N174,0.0));
Normal=Globals.VertexNormal_ObjectSpace;
vec3 p=(Position+Offset_1)*Scale;
vec3 n=abs(Normal);
float l9_0=n.x;
float l9_1=n.y;
bool l9_2=l9_0>l9_1;
bool l9_3;
if (l9_2)
{
l9_3=n.x>n.z;
}
else
{
l9_3=l9_2;
}
ivec3 l9_4;
if (l9_3)
{
l9_4=ivec3(0,1,2);
}
else
{
bvec3 l9_5=bvec3(n.y>n.z);
l9_4=ivec3(l9_5.x ? ivec3(1,2,0).x : ivec3(2,0,1).x,l9_5.y ? ivec3(1,2,0).y : ivec3(2,0,1).y,l9_5.z ? ivec3(1,2,0).z : ivec3(2,0,1).z);
}
float l9_6=n.x;
float l9_7=n.y;
bool l9_8=l9_6<l9_7;
bool l9_9;
if (l9_8)
{
l9_9=n.x<n.z;
}
else
{
l9_9=l9_8;
}
ivec3 l9_10;
if (l9_9)
{
l9_10=ivec3(0,1,2);
}
else
{
bvec3 l9_11=bvec3(n.y<n.z);
l9_10=ivec3(l9_11.x ? ivec3(1,2,0).x : ivec3(2,0,1).x,l9_11.y ? ivec3(1,2,0).y : ivec3(2,0,1).y,l9_11.z ? ivec3(1,2,0).z : ivec3(2,0,1).z);
}
ivec3 l9_12=(ivec3(3)-l9_10)-l9_4;
Globals.gTriplanarCoords=vec2(p[l9_4.y],p[l9_4.z]);
float param_7;
Node164_Noise_Simplex(Globals.gTriplanarCoords,Port_Scale_N164,param_7,Globals);
Input=param_7;
float l9_13=Input;
Globals.gTriplanarCoords=vec2(p[l9_12.y],p[l9_12.z]);
float param_11;
Node164_Noise_Simplex(Globals.gTriplanarCoords,Port_Scale_N164,param_11,Globals);
Input=param_11;
vec2 l9_14=pow(vec2(n[l9_4.x],n[l9_12.x]),vec2(1.0/(1.0-(Sharpness*0.99000001))));
float l9_15=l9_14.x;
float l9_16=l9_14.y;
Output=((l9_13*l9_15)+(Input*l9_16))/(l9_15+l9_16);
}
void Node121_Conditional(float Input0,vec3 Input1,vec3 Input2,out vec3 Output,ssGlobals Globals)
{
float param_3;
Node105_If_else(0.0,0.0,0.0,param_3,Globals);
float l9_0=((((glitchFrequency-Port_RangeMinA_N034)/((Port_RangeMaxA_N034-Port_RangeMinA_N034)+1e-06))*(Port_RangeMaxB_N034-Port_RangeMinB_N034))+Port_RangeMinB_N034)*param_3;
Input0=float(fract(l9_0)<Port_Input1_N055)+float(fract(l9_0*Port_Input1_N056)<Port_Input1_N066);
if ((Input0*1.0)!=0.0)
{
float param_8;
Node105_If_else(0.0,0.0,0.0,param_8,Globals);
float l9_1=param_8;
vec3 l9_2=Globals.SurfacePosition_ObjectSpace;
float l9_3=(min(glitchIntensity,30.0)*length(sc_LocalAabbMax-sc_LocalAabbMin))*Port_Import_N203;
float param_16;
Node183_Loop_Triplanar_UV(0.0,vec3(0.0),vec3(0.0,1.0,0.0),vec3(1.0),vec3(0.0),1.0,param_16,Globals);
float l9_4=param_16;
float l9_5=l9_4*Port_Input1_N140;
float l9_6;
if (l9_5<=0.0)
{
l9_6=0.0;
}
else
{
l9_6=pow(l9_5,Port_Input1_N141);
}
vec3 l9_7=l9_2-(vec3((l9_3*l9_6)*Port_Input2_N110)*Globals.VertexNormal_ObjectSpace);
Input1=vec4((sin(l9_1*l9_2.y)*(l9_3/(Port_Input1_N117+1.234e-06)))+l9_7.x,l9_2.y,l9_7.z,0.0).xyz;
Output=Input1;
}
else
{
Input2=Globals.SurfacePosition_ObjectSpace;
Output=Input2;
}
}
void Node64_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
#if (Tweak_N68)
{
Input1=1.0-((((scanlineSpeed-Port_RangeMinA_N063)/((Port_RangeMaxA_N063-Port_RangeMinA_N063)+1e-06))*(Port_RangeMaxB_N063-Port_RangeMinB_N063))+Port_RangeMinB_N063);
Output=Input1;
}
#else
{
Input2=(((scanlineSpeed-Port_RangeMinA_N063)/((Port_RangeMaxA_N063-Port_RangeMinA_N063)+1e-06))*(Port_RangeMaxB_N063-Port_RangeMinB_N063))+Port_RangeMinB_N063;
Output=Input2;
}
#endif
}
void Node10_If_else(float Bool1,float Value1,float Default,out float Result,ssGlobals Globals)
{
#if (animated)
{
float param_3;
Node64_Conditional(1.0,1.0,0.0,param_3,Globals);
Value1=(Globals.gTimeElapsed*param_3)+((((Offset-Port_RangeMinA_N067)/((Port_RangeMaxA_N067-Port_RangeMinA_N067)+1e-06))*(Port_RangeMaxB_N067-Port_RangeMinB_N067))+Port_RangeMinB_N067);
Result=Value1;
}
#else
{
Default=(((Offset-Port_RangeMinA_N067)/((Port_RangeMaxA_N067-Port_RangeMinA_N067)+1e-06))*(Port_RangeMaxB_N067-Port_RangeMinB_N067))+Port_RangeMinB_N067;
Result=Default;
}
#endif
}
void Node86_Conditional(float Input0,vec2 Input1,vec2 Input2,out vec2 Output,ssGlobals Globals)
{
#if (Tweak_N89)
{
Input1=Globals.gScreenCoord/(vec2(Port_Input1_N078)+vec2(1.234e-06));
Output=Input1;
}
#else
{
Input2=Globals.SurfacePosition_ObjectSpace.xy;
Output=Input2;
}
#endif
}
void Node41_Noise_Simplex(vec2 Seed,vec2 Scale,out float Noise,ssGlobals Globals)
{
Seed.x=floor(Seed.x*10000.0)*9.9999997e-05;
Seed.y=floor(Seed.y*10000.0)*9.9999997e-05;
Seed*=(Scale*0.5);
Noise=(snoise(Seed)*0.5)+0.5;
Noise=floor(Noise*10000.0)*9.9999997e-05;
}
void Node77_Loop_Triplanar_UV(float Input,vec3 Position,vec3 Normal,vec3 Scale,vec3 Offset_1,float Sharpness,out float Output,ssGlobals Globals)
{
Scale=vec3(Port_Input0_N129-randScale);
float param_3;
Node105_If_else(0.0,0.0,0.0,param_3,Globals);
Offset_1=vec3(param_3);
Sharpness=clamp(Port_Import_N071+0.001,Port_Input1_N072+0.001,Port_Input2_N072+0.001)-0.001;
Position=(Globals.SurfacePosition_ObjectSpace/(vec3(length(sc_LocalAabbMax-sc_LocalAabbMin))+vec3(1.234e-06)))*vec3(max(Port_Import_N106,0.0));
Normal=Globals.VertexNormal_ObjectSpace;
vec3 p=(Position+Offset_1)*Scale;
vec3 n=abs(Normal);
float l9_0=n.x;
float l9_1=n.y;
bool l9_2=l9_0>l9_1;
bool l9_3;
if (l9_2)
{
l9_3=n.x>n.z;
}
else
{
l9_3=l9_2;
}
ivec3 l9_4;
if (l9_3)
{
l9_4=ivec3(0,1,2);
}
else
{
bvec3 l9_5=bvec3(n.y>n.z);
l9_4=ivec3(l9_5.x ? ivec3(1,2,0).x : ivec3(2,0,1).x,l9_5.y ? ivec3(1,2,0).y : ivec3(2,0,1).y,l9_5.z ? ivec3(1,2,0).z : ivec3(2,0,1).z);
}
float l9_6=n.x;
float l9_7=n.y;
bool l9_8=l9_6<l9_7;
bool l9_9;
if (l9_8)
{
l9_9=n.x<n.z;
}
else
{
l9_9=l9_8;
}
ivec3 l9_10;
if (l9_9)
{
l9_10=ivec3(0,1,2);
}
else
{
bvec3 l9_11=bvec3(n.y<n.z);
l9_10=ivec3(l9_11.x ? ivec3(1,2,0).x : ivec3(2,0,1).x,l9_11.y ? ivec3(1,2,0).y : ivec3(2,0,1).y,l9_11.z ? ivec3(1,2,0).z : ivec3(2,0,1).z);
}
ivec3 l9_12=(ivec3(3)-l9_10)-l9_4;
Globals.gTriplanarCoords=vec2(p[l9_4.y],p[l9_4.z]);
float param_7;
Node41_Noise_Simplex(Globals.gTriplanarCoords,Port_Scale_N041,param_7,Globals);
Input=param_7;
float l9_13=Input;
Globals.gTriplanarCoords=vec2(p[l9_12.y],p[l9_12.z]);
float param_11;
Node41_Noise_Simplex(Globals.gTriplanarCoords,Port_Scale_N041,param_11,Globals);
Input=param_11;
vec2 l9_14=pow(vec2(n[l9_4.x],n[l9_12.x]),vec2(1.0/(1.0-(Sharpness*0.99000001))));
float l9_15=l9_14.x;
float l9_16=l9_14.y;
Output=((l9_13*l9_15)+(Input*l9_16))/(l9_15+l9_16);
}
void sc_SetClipDistancePlatform(float dstClipDistance)
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
        gl_ClipDistance[0]=dstClipDistance;
    #endif
}
void main()
{
PreviewVertexColor=vec4(0.5);
PreviewVertexSaved=0.0;
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
vec2 l9_2;
vec2 l9_3;
vec3 l9_4;
vec3 l9_5;
vec4 l9_6;
#if (sc_VertexBlending)
{
vec2 l9_7;
vec2 l9_8;
vec3 l9_9;
vec3 l9_10;
vec4 l9_11;
#if (sc_VertexBlendingUseNormals)
{
sc_Vertex_t l9_12=sc_Vertex_t(l9_0,normal,tangent.xyz,texture0,texture1);
blendTargetShapeWithNormal(l9_12,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(l9_12,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(l9_12,blendShape2Pos,blendShape2Normal,weights0.z);
l9_11=l9_12.position;
l9_10=l9_12.normal;
l9_9=l9_12.tangent;
l9_8=l9_12.texture0;
l9_7=l9_12.texture1;
}
#else
{
vec3 l9_14=(((((l9_0.xyz+(blendShape0Pos*weights0.x)).xyz+(blendShape1Pos*weights0.y)).xyz+(blendShape2Pos*weights0.z)).xyz+(blendShape3Pos*weights0.w)).xyz+(blendShape4Pos*weights1.x)).xyz+(blendShape5Pos*weights1.y);
l9_11=vec4(l9_14.x,l9_14.y,l9_14.z,l9_0.w);
l9_10=normal;
l9_9=tangent.xyz;
l9_8=texture0;
l9_7=texture1;
}
#endif
l9_6=l9_11;
l9_5=l9_10;
l9_4=l9_9;
l9_3=l9_8;
l9_2=l9_7;
}
#else
{
l9_6=l9_0;
l9_5=normal;
l9_4=tangent.xyz;
l9_3=texture0;
l9_2=texture1;
}
#endif
vec3 l9_15;
vec3 l9_16;
vec4 l9_17;
#if (sc_SkinBonesCount>0)
{
vec4 l9_18;
#if (sc_SkinBonesCount>0)
{
vec4 l9_19=vec4(1.0,fract(boneData.yzw));
vec4 l9_20=l9_19;
l9_20.x=1.0-dot(l9_19.yzw,vec3(1.0));
l9_18=l9_20;
}
#else
{
l9_18=vec4(0.0);
}
#endif
int l9_21=int(boneData.x);
int l9_22=int(boneData.y);
int l9_23=int(boneData.z);
int l9_24=int(boneData.w);
vec3 l9_25=(((skinVertexPosition(l9_21,l9_6)*l9_18.x)+(skinVertexPosition(l9_22,l9_6)*l9_18.y))+(skinVertexPosition(l9_23,l9_6)*l9_18.z))+(skinVertexPosition(l9_24,l9_6)*l9_18.w);
l9_17=vec4(l9_25.x,l9_25.y,l9_25.z,l9_6.w);
l9_16=((((sc_SkinBonesNormalMatrices[l9_21]*l9_5)*l9_18.x)+((sc_SkinBonesNormalMatrices[l9_22]*l9_5)*l9_18.y))+((sc_SkinBonesNormalMatrices[l9_23]*l9_5)*l9_18.z))+((sc_SkinBonesNormalMatrices[l9_24]*l9_5)*l9_18.w);
l9_15=((((sc_SkinBonesNormalMatrices[l9_21]*l9_4)*l9_18.x)+((sc_SkinBonesNormalMatrices[l9_22]*l9_4)*l9_18.y))+((sc_SkinBonesNormalMatrices[l9_23]*l9_4)*l9_18.z))+((sc_SkinBonesNormalMatrices[l9_24]*l9_4)*l9_18.w);
}
#else
{
l9_17=l9_6;
l9_16=l9_5;
l9_15=l9_4;
}
#endif
#if (sc_RenderingSpace==3)
{
varPos=vec3(0.0);
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPos=vec3(0.0);
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPos=l9_17.xyz;
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
varPos=(sc_ModelMatrix*l9_17).xyz;
varNormal=sc_NormalMatrix*l9_16;
vec3 l9_26=sc_NormalMatrix*l9_15;
varTangent=vec4(l9_26.x,l9_26.y,l9_26.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_27=PreviewEnabled==1;
vec2 l9_28;
if (l9_27)
{
vec2 l9_29=l9_3;
l9_29.x=1.0-l9_3.x;
l9_28=l9_29;
}
else
{
l9_28=l9_3;
}
varColor=color;
vec3 l9_30=varNormal;
vec3 l9_31=varPos;
vec4 l9_32=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
vec3 l9_33=varNormal;
ssGlobals l9_34=ssGlobals(sc_Time.x,sc_Time.y,0.0,(sc_ModelMatrixInverse*vec4(varPos,1.0)).xyz,l9_30,normalize((sc_ModelMatrixInverse*vec4(l9_30,0.0)).xyz),vec2(0.0),l9_31,((l9_32.xyz/vec3(l9_32.w)).xy*0.5)+vec2(0.5));
vec3 l9_35;
#if (Tweak_N75&&Tweak_N76)
{
vec3 l9_36;
Node121_Conditional(0.0,vec3(1.0),vec3(0.0),l9_36,l9_34);
float l9_37;
#if (Tweak_N130)
{
float l9_38;
Node10_If_else(0.0,0.0,0.0,l9_38,l9_34);
float l9_39=l9_38;
vec2 l9_40;
Node86_Conditional(1.0,vec2(1.0),vec2(0.0),l9_40,l9_34);
float l9_41;
Node77_Loop_Triplanar_UV(0.0,vec3(0.0),vec3(0.0,1.0,0.0),vec3(1.0),vec3(0.0),1.0,l9_41,l9_34);
float l9_42=l9_41;
float l9_43=l9_42*Port_Input1_N122;
float l9_44;
if (l9_43<=0.0)
{
l9_44=0.0;
}
else
{
l9_44=pow(l9_43,Port_Input1_N125);
}
l9_37=clamp((float(fract(thickLines*(l9_39-l9_40.y))<(1.0-(Port_Input0_N129-randScale)))*l9_44)+0.001,Port_Input1_N126+0.001,Port_Input2_N126+0.001)-0.001;
}
#else
{
float l9_45;
Node10_If_else(0.0,0.0,0.0,l9_45,l9_34);
float l9_46=l9_45;
vec2 l9_47;
Node86_Conditional(1.0,vec2(1.0),vec2(0.0),l9_47,l9_34);
float l9_48;
Node77_Loop_Triplanar_UV(0.0,vec3(0.0),vec3(0.0,1.0,0.0),vec3(1.0),vec3(0.0),1.0,l9_48,l9_34);
float l9_49=l9_48;
float l9_50=l9_49*Port_Input1_N122;
float l9_51;
if (l9_50<=0.0)
{
l9_51=0.0;
}
else
{
l9_51=pow(l9_50,Port_Input1_N125);
}
l9_37=1.0-(clamp((float(fract(thickLines*(l9_46-l9_47.y))<(1.0-(Port_Input0_N129-randScale)))*l9_51)+0.001,Port_Input1_N126+0.001,Port_Input2_N126+0.001)-0.001);
}
#endif
l9_35=mix((sc_ModelMatrix*vec4(l9_36,1.0)).xyz,l9_31,vec3(l9_37));
}
#else
{
vec3 l9_52;
#if (Tweak_N76)
{
vec3 l9_53;
Node121_Conditional(0.0,vec3(1.0),vec3(0.0),l9_53,l9_34);
l9_52=(sc_ModelMatrix*vec4(l9_53,1.0)).xyz;
}
#else
{
l9_52=l9_31;
}
#endif
l9_35=l9_52;
}
#endif
vec3 l9_54;
vec3 l9_55;
vec3 l9_56;
if (l9_27)
{
l9_56=varTangent.xyz;
l9_55=varNormal;
l9_54=varPos;
}
else
{
l9_56=varTangent.xyz;
l9_55=l9_33;
l9_54=l9_35;
}
varPos=l9_54;
varNormal=normalize(l9_55);
vec3 l9_57=normalize(l9_56);
varTangent=vec4(l9_57.x,l9_57.y,l9_57.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_58;
#if (sc_RenderingSpace==3)
{
l9_58=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_59;
#if (sc_RenderingSpace==2)
{
l9_59=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_60;
#if (sc_RenderingSpace==1)
{
l9_60=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
l9_60=l9_17;
}
#endif
l9_59=l9_60;
}
#endif
l9_58=l9_59;
}
#endif
varViewSpaceDepth=-l9_58.z;
}
#endif
vec4 l9_61;
#if (sc_RenderingSpace==3)
{
l9_61=l9_17;
}
#else
{
vec4 l9_62;
#if (sc_RenderingSpace==4)
{
l9_62=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_63;
#if (sc_RenderingSpace==2)
{
l9_63=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_64;
#if (sc_RenderingSpace==1)
{
l9_64=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_64=vec4(0.0);
}
#endif
l9_63=l9_64;
}
#endif
l9_62=l9_63;
}
#endif
l9_61=l9_62;
}
#endif
varPackedTex=vec4(l9_28,l9_2);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_65;
#if (sc_RenderingSpace==1)
{
l9_65=sc_ModelMatrix*l9_17;
}
#else
{
l9_65=l9_17;
}
#endif
vec4 l9_66=sc_ProjectorMatrix*l9_65;
varShadowTex=((l9_66.xy/vec2(l9_66.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_67;
#if (sc_DepthBufferMode==1)
{
vec4 l9_68;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_69=l9_61;
l9_69.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_61.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_61.w;
l9_68=l9_69;
}
else
{
l9_68=l9_61;
}
l9_67=l9_68;
}
#else
{
l9_67=l9_61;
}
#endif
vec4 l9_70;
#if (sc_TAAEnabled)
{
vec2 l9_71=l9_67.xy+(sc_TAAJitterOffset*l9_67.w);
l9_70=vec4(l9_71.x,l9_71.y,l9_67.z,l9_67.w);
}
#else
{
l9_70=l9_67;
}
#endif
vec4 l9_72;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_73=l9_70;
l9_73.x=l9_70.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_72=l9_73;
}
#else
{
l9_72=l9_70;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=sc_StereoViewID;
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_74=dot(l9_72,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_74);
}
#else
{
varClipDistance=l9_74;
}
#endif
}
#endif
gl_Position=l9_72;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define SC_DISABLE_FRUSTUM_CULLING 1
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
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
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
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
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
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
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
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
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
#ifndef opacityTextureHasSwappedViews
#define opacityTextureHasSwappedViews 0
#elif opacityTextureHasSwappedViews==1
#undef opacityTextureHasSwappedViews
#define opacityTextureHasSwappedViews 1
#endif
#ifndef opacityTextureLayout
#define opacityTextureLayout 0
#endif
#ifndef animated
#define animated 0
#elif animated==1
#undef animated
#define animated 1
#endif
#ifndef Tweak_N68
#define Tweak_N68 0
#elif Tweak_N68==1
#undef Tweak_N68
#define Tweak_N68 1
#endif
#ifndef Tweak_N89
#define Tweak_N89 0
#elif Tweak_N89==1
#undef Tweak_N89
#define Tweak_N89 1
#endif
#ifndef Tweak_N12
#define Tweak_N12 0
#elif Tweak_N12==1
#undef Tweak_N12
#define Tweak_N12 1
#endif
#ifndef SC_USE_UV_TRANSFORM_opacityTexture
#define SC_USE_UV_TRANSFORM_opacityTexture 0
#elif SC_USE_UV_TRANSFORM_opacityTexture==1
#undef SC_USE_UV_TRANSFORM_opacityTexture
#define SC_USE_UV_TRANSFORM_opacityTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_opacityTexture
#define SC_SOFTWARE_WRAP_MODE_U_opacityTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_opacityTexture
#define SC_SOFTWARE_WRAP_MODE_V_opacityTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_opacityTexture
#define SC_USE_UV_MIN_MAX_opacityTexture 0
#elif SC_USE_UV_MIN_MAX_opacityTexture==1
#undef SC_USE_UV_MIN_MAX_opacityTexture
#define SC_USE_UV_MIN_MAX_opacityTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_opacityTexture
#define SC_USE_CLAMP_TO_BORDER_opacityTexture 0
#elif SC_USE_CLAMP_TO_BORDER_opacityTexture==1
#undef SC_USE_CLAMP_TO_BORDER_opacityTexture
#define SC_USE_CLAMP_TO_BORDER_opacityTexture 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform float shaderComplexityValue;
uniform vec4 sc_UniformConstants;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform vec4 thicklinesColor;
uniform float thickLines;
uniform float scanlineSpeed;
uniform float Port_RangeMinA_N063;
uniform float Port_RangeMaxA_N063;
uniform float Port_RangeMaxB_N063;
uniform float Port_RangeMinB_N063;
uniform float Offset;
uniform float Port_RangeMinA_N067;
uniform float Port_RangeMaxA_N067;
uniform float Port_RangeMaxB_N067;
uniform float Port_RangeMinB_N067;
uniform float Port_Input1_N078;
uniform float thinLines;
uniform vec4 thinlinesColor;
uniform vec4 rimTint;
uniform mat3 opacityTextureTransform;
uniform vec4 opacityTextureUvMinMax;
uniform vec4 opacityTextureBorderColor;
uniform vec4 sc_Time;
uniform sc_Camera_t sc_Camera;
uniform float Port_Input1_N020;
uniform float Port_Input1_N049;
uniform float Port_Input2_N014;
uniform float Port_Input1_N058;
uniform float Port_Input2_N058;
uniform int PreviewEnabled;
uniform sampler2D opacityTexture;
uniform sampler2DArray opacityTextureArrSC;
uniform sampler2D sc_ScreenTexture;
uniform sampler2DArray sc_ScreenTextureArrSC;
uniform sampler2D intensityTexture;
uniform sampler2DArray intensityTextureArrSC;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
in float varViewSpaceDepth;
in vec4 PreviewVertexColor;
in float PreviewVertexSaved;
in vec3 varPos;
in vec3 varNormal;
in vec4 varPackedTex;
in vec4 varTangent;
in vec4 varScreenPos;
in vec2 varScreenTexturePos;
in vec4 varColor;
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
int opacityTextureGetStereoViewIndex()
{
int l9_0;
#if (opacityTextureHasSwappedViews)
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
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
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
vec4 outputMotionVectorsIfNeeded(vec3 surfacePosWorldSpace,vec4 finalColor)
{
#if (sc_MotionVectorsPass)
{
vec4 l9_0=vec4(surfacePosWorldSpace,1.0);
vec4 l9_1=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_0;
vec4 l9_2=((sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*sc_PrevFrameModelMatrix)*sc_ModelMatrixInverse)*l9_0;
vec2 l9_3=((l9_1.xy/vec2(l9_1.w)).xy-(l9_2.xy/vec2(l9_2.w)).xy)*0.5;
float l9_4=floor(((l9_3.x*5.0)+0.5)*65535.0);
float l9_5=floor(l9_4*0.00390625);
float l9_6=floor(((l9_3.y*5.0)+0.5)*65535.0);
float l9_7=floor(l9_6*0.00390625);
return vec4(l9_5/255.0,(l9_4-(l9_5*256.0))/255.0,l9_7/255.0,(l9_6-(l9_7*256.0))/255.0);
}
#else
{
return finalColor;
}
#endif
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
    col.x+=zero*float(cacheConst);
    sc_FragData0=col;
}
float getFrontLayerZTestEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 5e-07;
}
#else
{
return 5.0000001e-08;
}
#endif
}
void unpackValues(float channel,int passIndex,inout int values[8])
{
#if (sc_OITCompositingPass)
{
channel=floor((channel*255.0)+0.5);
int l9_0=((passIndex+1)*4)-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_0>=(passIndex*4))
{
values[l9_0]=(values[l9_0]*4)+int(floor(mod(channel,4.0)));
channel=floor(channel/4.0);
l9_0--;
continue;
}
else
{
break;
}
}
}
#endif
}
float getDepthOrderingEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 0.001;
}
#else
{
return 0.0;
}
#endif
}
int encodeDepth(float depth,vec2 depthBounds)
{
float l9_0=(1.0-depthBounds.x)*1000.0;
return int(clamp((depth-l9_0)/((depthBounds.y*1000.0)-l9_0),0.0,1.0)*65535.0);
}
float viewSpaceDepth()
{
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
return varViewSpaceDepth;
}
#else
{
return sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((gl_FragCoord.z*2.0)-1.0));
}
#endif
}
float packValue(inout int value)
{
#if (sc_OITDepthGatherPass)
{
int l9_0=value;
value/=4;
return floor(floor(mod(float(l9_0),4.0))*64.0)/255.0;
}
#else
{
return 0.0;
}
#endif
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
void main()
{
#if (sc_DepthOnly)
{
return;
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
vec2 l9_0=gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw;
vec2 l9_1=sc_ScreenCoordsGlobalToView(l9_0);
float l9_2;
#if (animated)
{
float l9_3;
#if (Tweak_N68)
{
l9_3=1.0-((((scanlineSpeed-Port_RangeMinA_N063)/((Port_RangeMaxA_N063-Port_RangeMinA_N063)+1e-06))*(Port_RangeMaxB_N063-Port_RangeMinB_N063))+Port_RangeMinB_N063);
}
#else
{
l9_3=(((scanlineSpeed-Port_RangeMinA_N063)/((Port_RangeMaxA_N063-Port_RangeMinA_N063)+1e-06))*(Port_RangeMaxB_N063-Port_RangeMinB_N063))+Port_RangeMinB_N063;
}
#endif
l9_2=(sc_Time.x*l9_3)+((((Offset-Port_RangeMinA_N067)/((Port_RangeMaxA_N067-Port_RangeMinA_N067)+1e-06))*(Port_RangeMaxB_N067-Port_RangeMinB_N067))+Port_RangeMinB_N067);
}
#else
{
l9_2=(((Offset-Port_RangeMinA_N067)/((Port_RangeMaxA_N067-Port_RangeMinA_N067)+1e-06))*(Port_RangeMaxB_N067-Port_RangeMinB_N067))+Port_RangeMinB_N067;
}
#endif
vec2 l9_4;
#if (Tweak_N89)
{
l9_4=l9_1/(vec2(Port_Input1_N078)+vec2(1.234e-06));
}
#else
{
l9_4=(sc_ModelMatrixInverse*vec4(varPos,1.0)).xy;
}
#endif
float l9_5=l9_2-l9_4.y;
vec4 l9_6=(((thicklinesColor*vec4(Port_Input1_N020))*vec4(fract(thickLines*l9_5)))+((vec4(fract(l9_4.y*thinLines))*vec4(Port_Input1_N049))*thinlinesColor))+(vec4(1.0-clamp(dot(normalize(sc_Camera.position-varPos),normalize(varNormal)),0.0,1.0))*rimTint);
vec4 l9_7;
#if (Tweak_N12)
{
vec4 l9_8;
#if (opacityTextureLayout==2)
{
bool l9_9=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTexture)!=0));
float l9_10=varPackedTex.x;
sc_SoftwareWrapEarly(l9_10,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).x);
float l9_11=l9_10;
float l9_12=varPackedTex.y;
sc_SoftwareWrapEarly(l9_12,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).y);
float l9_13=l9_12;
vec2 l9_14;
float l9_15;
#if (SC_USE_UV_MIN_MAX_opacityTexture)
{
bool l9_16;
#if (SC_USE_CLAMP_TO_BORDER_opacityTexture)
{
l9_16=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).x==3;
}
#else
{
l9_16=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture)!=0);
}
#endif
float l9_17=l9_11;
float l9_18=1.0;
sc_ClampUV(l9_17,opacityTextureUvMinMax.x,opacityTextureUvMinMax.z,l9_16,l9_18);
float l9_19=l9_17;
float l9_20=l9_18;
bool l9_21;
#if (SC_USE_CLAMP_TO_BORDER_opacityTexture)
{
l9_21=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).y==3;
}
#else
{
l9_21=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture)!=0);
}
#endif
float l9_22=l9_13;
float l9_23=l9_20;
sc_ClampUV(l9_22,opacityTextureUvMinMax.y,opacityTextureUvMinMax.w,l9_21,l9_23);
l9_15=l9_23;
l9_14=vec2(l9_19,l9_22);
}
#else
{
l9_15=1.0;
l9_14=vec2(l9_11,l9_13);
}
#endif
vec2 l9_24=sc_TransformUV(l9_14,(int(SC_USE_UV_TRANSFORM_opacityTexture)!=0),opacityTextureTransform);
float l9_25=l9_24.x;
float l9_26=l9_15;
sc_SoftwareWrapLate(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).x,l9_9,l9_26);
float l9_27=l9_24.y;
float l9_28=l9_26;
sc_SoftwareWrapLate(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).y,l9_9,l9_28);
float l9_29=l9_28;
vec3 l9_30=sc_SamplingCoordsViewToGlobal(vec2(l9_25,l9_27),opacityTextureLayout,opacityTextureGetStereoViewIndex());
vec4 l9_31=texture(opacityTextureArrSC,l9_30,0.0);
vec4 l9_32;
#if (SC_USE_CLAMP_TO_BORDER_opacityTexture)
{
l9_32=mix(opacityTextureBorderColor,l9_31,vec4(l9_29));
}
#else
{
l9_32=l9_31;
}
#endif
l9_8=l9_32;
}
#else
{
bool l9_33=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_opacityTexture)!=0));
float l9_34=varPackedTex.x;
sc_SoftwareWrapEarly(l9_34,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).x);
float l9_35=l9_34;
float l9_36=varPackedTex.y;
sc_SoftwareWrapEarly(l9_36,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).y);
float l9_37=l9_36;
vec2 l9_38;
float l9_39;
#if (SC_USE_UV_MIN_MAX_opacityTexture)
{
bool l9_40;
#if (SC_USE_CLAMP_TO_BORDER_opacityTexture)
{
l9_40=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).x==3;
}
#else
{
l9_40=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture)!=0);
}
#endif
float l9_41=l9_35;
float l9_42=1.0;
sc_ClampUV(l9_41,opacityTextureUvMinMax.x,opacityTextureUvMinMax.z,l9_40,l9_42);
float l9_43=l9_41;
float l9_44=l9_42;
bool l9_45;
#if (SC_USE_CLAMP_TO_BORDER_opacityTexture)
{
l9_45=ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).y==3;
}
#else
{
l9_45=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture)!=0);
}
#endif
float l9_46=l9_37;
float l9_47=l9_44;
sc_ClampUV(l9_46,opacityTextureUvMinMax.y,opacityTextureUvMinMax.w,l9_45,l9_47);
l9_39=l9_47;
l9_38=vec2(l9_43,l9_46);
}
#else
{
l9_39=1.0;
l9_38=vec2(l9_35,l9_37);
}
#endif
vec2 l9_48=sc_TransformUV(l9_38,(int(SC_USE_UV_TRANSFORM_opacityTexture)!=0),opacityTextureTransform);
float l9_49=l9_48.x;
float l9_50=l9_39;
sc_SoftwareWrapLate(l9_49,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).x,l9_33,l9_50);
float l9_51=l9_48.y;
float l9_52=l9_50;
sc_SoftwareWrapLate(l9_51,ivec2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture,SC_SOFTWARE_WRAP_MODE_V_opacityTexture).y,l9_33,l9_52);
float l9_53=l9_52;
vec3 l9_54=sc_SamplingCoordsViewToGlobal(vec2(l9_49,l9_51),opacityTextureLayout,opacityTextureGetStereoViewIndex());
vec4 l9_55=texture(opacityTexture,l9_54.xy,0.0);
vec4 l9_56;
#if (SC_USE_CLAMP_TO_BORDER_opacityTexture)
{
l9_56=mix(opacityTextureBorderColor,l9_55,vec4(l9_53));
}
#else
{
l9_56=l9_55;
}
#endif
l9_8=l9_56;
}
#endif
l9_7=l9_8;
}
#else
{
l9_7=vec4(Port_Input2_N014);
}
#endif
float l9_57=clamp((l9_6.w*l9_7.x)+0.001,Port_Input1_N058+0.001,Port_Input2_N058+0.001)-0.001;
vec4 l9_58=vec4(l9_6.x,l9_6.y,l9_6.z,vec4(0.0).w);
l9_58.w=l9_57;
#if (sc_BlendMode_AlphaTest)
{
if (l9_57<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_57<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec4 l9_59;
#if (sc_ProjectiveShadowsCaster)
{
float l9_60;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_60=l9_57;
}
#else
{
float l9_61;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_61=clamp(l9_57*2.0,0.0,1.0);
}
#else
{
float l9_62;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_62=clamp(dot(l9_58.xyz,vec3(l9_57)),0.0,1.0);
}
#else
{
float l9_63;
#if (sc_BlendMode_AlphaTest)
{
l9_63=1.0;
}
#else
{
float l9_64;
#if (sc_BlendMode_Multiply)
{
l9_64=(1.0-dot(l9_58.xyz,vec3(0.33333001)))*l9_57;
}
#else
{
float l9_65;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_65=(1.0-clamp(dot(l9_58.xyz,vec3(1.0)),0.0,1.0))*l9_57;
}
#else
{
float l9_66;
#if (sc_BlendMode_ColoredGlass)
{
l9_66=clamp(dot(l9_58.xyz,vec3(1.0)),0.0,1.0)*l9_57;
}
#else
{
float l9_67;
#if (sc_BlendMode_Add)
{
l9_67=clamp(dot(l9_58.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_68;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_68=clamp(dot(l9_58.xyz,vec3(1.0)),0.0,1.0)*l9_57;
}
#else
{
float l9_69;
#if (sc_BlendMode_Screen)
{
l9_69=dot(l9_58.xyz,vec3(0.33333001))*l9_57;
}
#else
{
float l9_70;
#if (sc_BlendMode_Min)
{
l9_70=1.0-clamp(dot(l9_58.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_71;
#if (sc_BlendMode_Max)
{
l9_71=clamp(dot(l9_58.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_71=1.0;
}
#endif
l9_70=l9_71;
}
#endif
l9_69=l9_70;
}
#endif
l9_68=l9_69;
}
#endif
l9_67=l9_68;
}
#endif
l9_66=l9_67;
}
#endif
l9_65=l9_66;
}
#endif
l9_64=l9_65;
}
#endif
l9_63=l9_64;
}
#endif
l9_62=l9_63;
}
#endif
l9_61=l9_62;
}
#endif
l9_60=l9_61;
}
#endif
l9_59=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_58.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_60);
}
#else
{
vec4 l9_72;
#if (sc_RenderAlphaToColor)
{
l9_72=vec4(l9_57);
}
#else
{
vec4 l9_73;
#if (sc_BlendMode_Custom)
{
vec4 l9_74;
#if (sc_FramebufferFetch)
{
vec4 l9_75=sc_readFragData0_Platform();
vec4 l9_76;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_77=l9_75;
l9_77.x=l9_75.x+_sc_framebufferFetchMarker;
l9_76=l9_77;
}
#else
{
l9_76=l9_75;
}
#endif
l9_74=l9_76;
}
#else
{
vec2 l9_78=sc_ScreenCoordsGlobalToView(l9_0);
int l9_79;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_79=1-sc_GetStereoViewIndex();
}
#else
{
l9_79=sc_GetStereoViewIndex();
}
#endif
vec4 l9_80;
#if (sc_ScreenTextureLayout==2)
{
l9_80=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_78,sc_ScreenTextureLayout,l9_79),0.0);
}
#else
{
l9_80=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_78,sc_ScreenTextureLayout,l9_79).xy,0.0);
}
#endif
l9_74=l9_80;
}
#endif
vec4 l9_81;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_82=l9_74;
l9_82.x=l9_74.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_81=l9_82;
}
#else
{
l9_81=l9_74;
}
#endif
vec3 l9_83=mix(l9_81.xyz,definedBlend(l9_81.xyz,l9_58.xyz).xyz,vec3(l9_57));
vec4 l9_84=vec4(l9_83.x,l9_83.y,l9_83.z,vec4(0.0).w);
l9_84.w=1.0;
l9_73=l9_84;
}
#else
{
vec4 l9_85;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_85=vec4(mix(vec3(1.0),l9_58.xyz,vec3(l9_57)),l9_57);
}
#else
{
vec4 l9_86;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_87;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_87=clamp(l9_57,0.0,1.0);
}
#else
{
l9_87=l9_57;
}
#endif
l9_86=vec4(l9_58.xyz*l9_87,l9_87);
}
#else
{
l9_86=l9_58;
}
#endif
l9_85=l9_86;
}
#endif
l9_73=l9_85;
}
#endif
l9_72=l9_73;
}
#endif
l9_59=l9_72;
}
#endif
vec4 l9_88;
if (PreviewEnabled==1)
{
vec4 l9_89;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_89=PreviewVertexColor;
}
else
{
l9_89=vec4(0.0);
}
l9_88=l9_89;
}
else
{
l9_88=l9_59;
}
vec4 l9_90;
#if (sc_ShaderComplexityAnalyzer)
{
l9_90=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_90=vec4(0.0);
}
#endif
vec4 l9_91;
if (l9_90.w>0.0)
{
l9_91=l9_90;
}
else
{
l9_91=l9_88;
}
vec4 l9_92=outputMotionVectorsIfNeeded(varPos,max(l9_91,vec4(0.0)));
vec4 l9_93=clamp(l9_92,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_94=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_94-0.0039215689)),min(1.0,l9_94+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0Internal(vec4(1.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#else
{
#if (sc_OITDepthGatherPass)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_95=sc_ScreenCoordsGlobalToView(l9_0);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_95).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_96=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_95).xy);
float l9_97=packValue(l9_96);
int l9_104=int(l9_93.w*255.0);
float l9_105=packValue(l9_104);
sc_writeFragData0Internal(vec4(packValue(l9_96),packValue(l9_96),packValue(l9_96),packValue(l9_96)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_97,packValue(l9_96),packValue(l9_96),packValue(l9_96)));
sc_writeFragData2(vec4(l9_105,packValue(l9_104),packValue(l9_104),packValue(l9_104)));
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.0039215689,0.0,0.0,0.0));
}
#endif
}
#endif
}
#else
{
#if (sc_OITCompositingPass)
{
#if (sc_OITCompositingPass)
{
vec2 l9_108=sc_ScreenCoordsGlobalToView(l9_0);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_108).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_109[8];
int l9_110[8];
int l9_111=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_111<8)
{
l9_109[l9_111]=0;
l9_110[l9_111]=0;
l9_111++;
continue;
}
else
{
break;
}
}
int l9_112;
#if (sc_OITMaxLayers8)
{
l9_112=2;
}
#else
{
l9_112=1;
}
#endif
int l9_113=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_113<l9_112)
{
vec4 l9_114;
vec4 l9_115;
vec4 l9_116;
if (l9_113==0)
{
l9_116=texture(sc_OITAlpha0,l9_108);
l9_115=texture(sc_OITDepthLow0,l9_108);
l9_114=texture(sc_OITDepthHigh0,l9_108);
}
else
{
l9_116=vec4(0.0);
l9_115=vec4(0.0);
l9_114=vec4(0.0);
}
vec4 l9_117;
vec4 l9_118;
vec4 l9_119;
if (l9_113==1)
{
l9_119=texture(sc_OITAlpha1,l9_108);
l9_118=texture(sc_OITDepthLow1,l9_108);
l9_117=texture(sc_OITDepthHigh1,l9_108);
}
else
{
l9_119=l9_116;
l9_118=l9_115;
l9_117=l9_114;
}
if (any(notEqual(l9_117,vec4(0.0)))||any(notEqual(l9_118,vec4(0.0))))
{
int l9_120[8]=l9_109;
unpackValues(l9_117.w,l9_113,l9_120);
unpackValues(l9_117.z,l9_113,l9_120);
unpackValues(l9_117.y,l9_113,l9_120);
unpackValues(l9_117.x,l9_113,l9_120);
unpackValues(l9_118.w,l9_113,l9_120);
unpackValues(l9_118.z,l9_113,l9_120);
unpackValues(l9_118.y,l9_113,l9_120);
unpackValues(l9_118.x,l9_113,l9_120);
int l9_129[8]=l9_110;
unpackValues(l9_119.w,l9_113,l9_129);
unpackValues(l9_119.z,l9_113,l9_129);
unpackValues(l9_119.y,l9_113,l9_129);
unpackValues(l9_119.x,l9_113,l9_129);
}
l9_113++;
continue;
}
else
{
break;
}
}
vec4 l9_134=texture(sc_OITFilteredDepthBoundsTexture,l9_108);
vec2 l9_135=l9_134.xy;
int l9_136;
#if (sc_SkinBonesCount>0)
{
l9_136=encodeDepth(((1.0-l9_134.x)*1000.0)+getDepthOrderingEpsilon(),l9_135);
}
#else
{
l9_136=0;
}
#endif
int l9_137=encodeDepth(viewSpaceDepth(),l9_135);
vec4 l9_138;
l9_138=l9_93*l9_93.w;
vec4 l9_139;
int l9_140=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_140<8)
{
int l9_141=l9_109[l9_140];
int l9_142=l9_137-l9_136;
bool l9_143=l9_141<l9_142;
bool l9_144;
if (l9_143)
{
l9_144=l9_109[l9_140]>0;
}
else
{
l9_144=l9_143;
}
if (l9_144)
{
vec3 l9_145=l9_138.xyz*(1.0-(float(l9_110[l9_140])/255.0));
l9_139=vec4(l9_145.x,l9_145.y,l9_145.z,l9_138.w);
}
else
{
l9_139=l9_138;
}
l9_138=l9_139;
l9_140++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_138,sc_UniformConstants.x,sc_ShaderCacheConstant);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
discard;
}
#endif
}
#endif
}
#else
{
#if (sc_OITFrontLayerPass)
{
#if (sc_OITFrontLayerPass)
{
if (abs(gl_FragCoord.z-texture(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(l9_0)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_93,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_92,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
