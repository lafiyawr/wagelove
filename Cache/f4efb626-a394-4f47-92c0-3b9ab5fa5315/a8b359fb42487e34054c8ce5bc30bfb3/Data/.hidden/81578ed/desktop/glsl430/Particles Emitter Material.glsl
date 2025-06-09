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
//sampler sampler colorRampTextureSmpSC 0:20
//sampler sampler intensityTextureSmpSC 0:21
//sampler sampler mainTextureSmpSC 0:22
//sampler sampler sc_OITCommonSampler 0:25
//sampler sampler sc_ScreenTextureSmpSC 0:27
//sampler sampler sizeRampTextureSmpSC 0:30
//sampler sampler vectorTextureSmpSC 0:31
//sampler sampler velRampTextureSmpSC 0:32
//texture texture2D colorRampTexture 0:0:0:20
//texture texture2D intensityTexture 0:1:0:21
//texture texture2D mainTexture 0:2:0:22
//texture texture2D sc_OITAlpha0 0:5:0:25
//texture texture2D sc_OITAlpha1 0:6:0:25
//texture texture2D sc_OITDepthHigh0 0:7:0:25
//texture texture2D sc_OITDepthHigh1 0:8:0:25
//texture texture2D sc_OITDepthLow0 0:9:0:25
//texture texture2D sc_OITDepthLow1 0:10:0:25
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:11:0:25
//texture texture2D sc_OITFrontDepthTexture 0:12:0:25
//texture texture2D sc_ScreenTexture 0:14:0:27
//texture texture2D sizeRampTexture 0:17:0:30
//texture texture2D vectorTexture 0:18:0:31
//texture texture2D velRampTexture 0:19:0:32
//texture texture2DArray colorRampTextureArrSC 0:33:0:20
//texture texture2DArray intensityTextureArrSC 0:34:0:21
//texture texture2DArray mainTextureArrSC 0:35:0:22
//texture texture2DArray sc_ScreenTextureArrSC 0:38:0:27
//texture texture2DArray sizeRampTextureArrSC 0:39:0:30
//texture texture2DArray vectorTextureArrSC 0:40:0:31
//texture texture2DArray velRampTextureArrSC 0:41:0:32
//spec_const bool ALPHADISSOLVE 0 0
//spec_const bool ALPHAMINMAX 1 0
//spec_const bool BASETEXTURE 2 0
//spec_const bool BLACKASALPHA 3 0
//spec_const bool BLEND_MODE_AVERAGE 4 0
//spec_const bool BLEND_MODE_BRIGHT 5 0
//spec_const bool BLEND_MODE_COLOR 6 0
//spec_const bool BLEND_MODE_COLOR_BURN 7 0
//spec_const bool BLEND_MODE_COLOR_DODGE 8 0
//spec_const bool BLEND_MODE_DARKEN 9 0
//spec_const bool BLEND_MODE_DIFFERENCE 10 0
//spec_const bool BLEND_MODE_DIVIDE 11 0
//spec_const bool BLEND_MODE_DIVISION 12 0
//spec_const bool BLEND_MODE_EXCLUSION 13 0
//spec_const bool BLEND_MODE_FORGRAY 14 0
//spec_const bool BLEND_MODE_HARD_GLOW 15 0
//spec_const bool BLEND_MODE_HARD_LIGHT 16 0
//spec_const bool BLEND_MODE_HARD_MIX 17 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 18 0
//spec_const bool BLEND_MODE_HARD_REFLECT 19 0
//spec_const bool BLEND_MODE_HUE 20 0
//spec_const bool BLEND_MODE_INTENSE 21 0
//spec_const bool BLEND_MODE_LIGHTEN 22 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 23 0
//spec_const bool BLEND_MODE_LUMINOSITY 24 0
//spec_const bool BLEND_MODE_NEGATION 25 0
//spec_const bool BLEND_MODE_NOTBRIGHT 26 0
//spec_const bool BLEND_MODE_OVERLAY 27 0
//spec_const bool BLEND_MODE_PIN_LIGHT 28 0
//spec_const bool BLEND_MODE_REALISTIC 29 0
//spec_const bool BLEND_MODE_SATURATION 30 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 31 0
//spec_const bool BLEND_MODE_SUBTRACT 32 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 33 0
//spec_const bool BOXSPAWN 34 0
//spec_const bool COLORMINMAX 35 0
//spec_const bool COLORMONOMIN 36 0
//spec_const bool COLORRAMP 37 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 38 0
//spec_const bool EXTERNALTIME 39 0
//spec_const bool FLIPBOOK 40 0
//spec_const bool FLIPBOOKBLEND 41 0
//spec_const bool FLIPBOOKBYLIFE 42 0
//spec_const bool FORCE 43 0
//spec_const bool IGNOREVEL 44 0
//spec_const bool INILOCATION 45 0
//spec_const bool INSTANTSPAWN 46 0
//spec_const bool LIFETIMEMINMAX 47 0
//spec_const bool MAXPARTICLECOUNT 48 0
//spec_const bool NOISE 49 0
//spec_const bool NORANDOFFSET 50 0
//spec_const bool PREMULTIPLIEDCOLOR 51 0
//spec_const bool SC_DISABLE_FRUSTUM_CULLING 52 0
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 53 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_colorRampTexture 54 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 55 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_mainTexture 56 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_sizeRampTexture 57 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_vectorTexture 58 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_velRampTexture 59 0
//spec_const bool SC_USE_UV_MIN_MAX_colorRampTexture 60 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 61 0
//spec_const bool SC_USE_UV_MIN_MAX_mainTexture 62 0
//spec_const bool SC_USE_UV_MIN_MAX_sizeRampTexture 63 0
//spec_const bool SC_USE_UV_MIN_MAX_vectorTexture 64 0
//spec_const bool SC_USE_UV_MIN_MAX_velRampTexture 65 0
//spec_const bool SC_USE_UV_TRANSFORM_colorRampTexture 66 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 67 0
//spec_const bool SC_USE_UV_TRANSFORM_mainTexture 68 0
//spec_const bool SC_USE_UV_TRANSFORM_sizeRampTexture 69 0
//spec_const bool SC_USE_UV_TRANSFORM_vectorTexture 70 0
//spec_const bool SC_USE_UV_TRANSFORM_velRampTexture 71 0
//spec_const bool SIZEMINMAX 72 0
//spec_const bool SIZERAMP 73 0
//spec_const bool SNOISE 74 0
//spec_const bool SPHERESPAWN 75 0
//spec_const bool UseViewSpaceDepthVariant 76 1
//spec_const bool VECTORFIELD 77 0
//spec_const bool VELOCITYDIR 78 0
//spec_const bool VELRAMP 79 0
//spec_const bool WORLDPOSSEED 80 0
//spec_const bool colorRampTextureHasSwappedViews 81 0
//spec_const bool intensityTextureHasSwappedViews 82 0
//spec_const bool mainTextureHasSwappedViews 83 0
//spec_const bool sc_BlendMode_Add 84 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 85 0
//spec_const bool sc_BlendMode_AlphaTest 86 0
//spec_const bool sc_BlendMode_AlphaToCoverage 87 0
//spec_const bool sc_BlendMode_ColoredGlass 88 0
//spec_const bool sc_BlendMode_Custom 89 0
//spec_const bool sc_BlendMode_Max 90 0
//spec_const bool sc_BlendMode_Min 91 0
//spec_const bool sc_BlendMode_Multiply 92 0
//spec_const bool sc_BlendMode_MultiplyOriginal 93 0
//spec_const bool sc_BlendMode_Normal 94 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 95 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 96 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 97 0
//spec_const bool sc_BlendMode_Screen 98 0
//spec_const bool sc_BlendMode_Software 99 0
//spec_const bool sc_CanUseTextureLod 100 0
//spec_const bool sc_DepthOnly 101 0
//spec_const bool sc_FramebufferFetch 102 0
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 103 0
//spec_const bool sc_IsEditor 104 0
//spec_const bool sc_MotionVectorsPass 105 0
//spec_const bool sc_OITCompositingPass 106 0
//spec_const bool sc_OITDepthBoundsPass 107 0
//spec_const bool sc_OITDepthGatherPass 108 0
//spec_const bool sc_OITDepthPrepass 109 0
//spec_const bool sc_OITFrontLayerPass 110 0
//spec_const bool sc_OITMaxLayers4Plus1 111 0
//spec_const bool sc_OITMaxLayers8 112 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 113 0
//spec_const bool sc_ProjectiveShadowsCaster 114 0
//spec_const bool sc_ProjectiveShadowsReceiver 115 0
//spec_const bool sc_RenderAlphaToColor 116 0
//spec_const bool sc_ScreenTextureHasSwappedViews 117 0
//spec_const bool sc_ShaderComplexityAnalyzer 118 0
//spec_const bool sc_TAAEnabled 119 0
//spec_const bool sc_UseFramebufferFetchMarker 120 0
//spec_const bool sc_VertexBlending 121 0
//spec_const bool sc_VertexBlendingUseNormals 122 0
//spec_const bool sizeRampTextureHasSwappedViews 123 0
//spec_const bool vectorTextureHasSwappedViews 124 0
//spec_const bool velRampTextureHasSwappedViews 125 0
//spec_const int NODE_67_DROPLIST_ITEM 126 0
//spec_const int SC_DEVICE_CLASS 127 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_colorRampTexture 128 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 129 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_mainTexture 130 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture 131 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_vectorTexture 132 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_velRampTexture 133 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_colorRampTexture 134 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 135 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_mainTexture 136 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture 137 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_vectorTexture 138 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_velRampTexture 139 -1
//spec_const int colorRampTextureLayout 140 0
//spec_const int intensityTextureLayout 141 0
//spec_const int mainTextureLayout 142 0
//spec_const int sc_DepthBufferMode 143 0
//spec_const int sc_RenderingSpace 144 -1
//spec_const int sc_ScreenTextureLayout 145 0
//spec_const int sc_ShaderCacheConstant 146 0
//spec_const int sc_SkinBonesCount 147 0
//spec_const int sc_StereoRenderingMode 148 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 149 0
//spec_const int sc_StereoViewID 150 0
//spec_const int sizeRampTextureLayout 151 0
//spec_const int vectorTextureLayout 152 0
//spec_const int velRampTextureLayout 153 0
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define SC_DISABLE_FRUSTUM_CULLING 1
#ifdef ALIGNTOX
#undef ALIGNTOX
#endif
#ifdef ALIGNTOY
#undef ALIGNTOY
#endif
#ifdef ALIGNTOZ
#undef ALIGNTOZ
#endif
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
#ifndef sizeRampTextureHasSwappedViews
#define sizeRampTextureHasSwappedViews 0
#elif sizeRampTextureHasSwappedViews==1
#undef sizeRampTextureHasSwappedViews
#define sizeRampTextureHasSwappedViews 1
#endif
#ifndef sizeRampTextureLayout
#define sizeRampTextureLayout 0
#endif
#ifndef velRampTextureHasSwappedViews
#define velRampTextureHasSwappedViews 0
#elif velRampTextureHasSwappedViews==1
#undef velRampTextureHasSwappedViews
#define velRampTextureHasSwappedViews 1
#endif
#ifndef velRampTextureLayout
#define velRampTextureLayout 0
#endif
#ifndef MAXPARTICLECOUNT
#define MAXPARTICLECOUNT 0
#elif MAXPARTICLECOUNT==1
#undef MAXPARTICLECOUNT
#define MAXPARTICLECOUNT 1
#endif
#ifndef FORCE
#define FORCE 0
#elif FORCE==1
#undef FORCE
#define FORCE 1
#endif
#ifndef VELOCITYDIR
#define VELOCITYDIR 0
#elif VELOCITYDIR==1
#undef VELOCITYDIR
#define VELOCITYDIR 1
#endif
#ifndef IGNOREVEL
#define IGNOREVEL 0
#elif IGNOREVEL==1
#undef IGNOREVEL
#define IGNOREVEL 1
#endif
#ifndef NODE_67_DROPLIST_ITEM
#define NODE_67_DROPLIST_ITEM 0
#endif
#ifndef EXTERNALTIME
#define EXTERNALTIME 0
#elif EXTERNALTIME==1
#undef EXTERNALTIME
#define EXTERNALTIME 1
#endif
#ifndef WORLDPOSSEED
#define WORLDPOSSEED 0
#elif WORLDPOSSEED==1
#undef WORLDPOSSEED
#define WORLDPOSSEED 1
#endif
#ifndef LIFETIMEMINMAX
#define LIFETIMEMINMAX 0
#elif LIFETIMEMINMAX==1
#undef LIFETIMEMINMAX
#define LIFETIMEMINMAX 1
#endif
#ifndef INSTANTSPAWN
#define INSTANTSPAWN 0
#elif INSTANTSPAWN==1
#undef INSTANTSPAWN
#define INSTANTSPAWN 1
#endif
#ifndef SIZEMINMAX
#define SIZEMINMAX 0
#elif SIZEMINMAX==1
#undef SIZEMINMAX
#define SIZEMINMAX 1
#endif
#ifndef SIZERAMP
#define SIZERAMP 0
#elif SIZERAMP==1
#undef SIZERAMP
#define SIZERAMP 1
#endif
#ifndef SC_USE_UV_TRANSFORM_sizeRampTexture
#define SC_USE_UV_TRANSFORM_sizeRampTexture 0
#elif SC_USE_UV_TRANSFORM_sizeRampTexture==1
#undef SC_USE_UV_TRANSFORM_sizeRampTexture
#define SC_USE_UV_TRANSFORM_sizeRampTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture
#define SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture
#define SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_sizeRampTexture
#define SC_USE_UV_MIN_MAX_sizeRampTexture 0
#elif SC_USE_UV_MIN_MAX_sizeRampTexture==1
#undef SC_USE_UV_MIN_MAX_sizeRampTexture
#define SC_USE_UV_MIN_MAX_sizeRampTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_sizeRampTexture
#define SC_USE_CLAMP_TO_BORDER_sizeRampTexture 0
#elif SC_USE_CLAMP_TO_BORDER_sizeRampTexture==1
#undef SC_USE_CLAMP_TO_BORDER_sizeRampTexture
#define SC_USE_CLAMP_TO_BORDER_sizeRampTexture 1
#endif
#ifndef INILOCATION
#define INILOCATION 0
#elif INILOCATION==1
#undef INILOCATION
#define INILOCATION 1
#endif
#ifndef BOXSPAWN
#define BOXSPAWN 0
#elif BOXSPAWN==1
#undef BOXSPAWN
#define BOXSPAWN 1
#endif
#ifndef SPHERESPAWN
#define SPHERESPAWN 0
#elif SPHERESPAWN==1
#undef SPHERESPAWN
#define SPHERESPAWN 1
#endif
#ifndef VELRAMP
#define VELRAMP 0
#elif VELRAMP==1
#undef VELRAMP
#define VELRAMP 1
#endif
#ifndef SC_USE_UV_TRANSFORM_velRampTexture
#define SC_USE_UV_TRANSFORM_velRampTexture 0
#elif SC_USE_UV_TRANSFORM_velRampTexture==1
#undef SC_USE_UV_TRANSFORM_velRampTexture
#define SC_USE_UV_TRANSFORM_velRampTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_velRampTexture
#define SC_SOFTWARE_WRAP_MODE_U_velRampTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_velRampTexture
#define SC_SOFTWARE_WRAP_MODE_V_velRampTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_velRampTexture
#define SC_USE_UV_MIN_MAX_velRampTexture 0
#elif SC_USE_UV_MIN_MAX_velRampTexture==1
#undef SC_USE_UV_MIN_MAX_velRampTexture
#define SC_USE_UV_MIN_MAX_velRampTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_velRampTexture
#define SC_USE_CLAMP_TO_BORDER_velRampTexture 0
#elif SC_USE_CLAMP_TO_BORDER_velRampTexture==1
#undef SC_USE_CLAMP_TO_BORDER_velRampTexture
#define SC_USE_CLAMP_TO_BORDER_velRampTexture 1
#endif
#ifndef NOISE
#define NOISE 0
#elif NOISE==1
#undef NOISE
#define NOISE 1
#endif
#ifndef SNOISE
#define SNOISE 0
#elif SNOISE==1
#undef SNOISE
#define SNOISE 1
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
uniform float timeGlobal;
uniform float externalTimeInput;
uniform float externalSeed;
uniform float lifeTimeConstant;
uniform vec2 lifeTimeMinMax;
uniform float spawnDuration;
uniform float spawnMaxParticles;
uniform mat3 sizeRampTextureTransform;
uniform vec4 sizeRampTextureUvMinMax;
uniform vec4 sizeRampTextureBorderColor;
uniform vec2 sizeStart;
uniform vec2 sizeEnd;
uniform vec2 sizeStartMin;
uniform vec2 sizeStartMax;
uniform vec2 sizeEndMin;
uniform vec2 sizeEndMax;
uniform float sizeSpeed;
uniform vec3 spawnLocation;
uniform vec3 spawnBox;
uniform vec3 spawnSphere;
uniform mat3 velRampTextureTransform;
uniform vec4 velRampTextureUvMinMax;
uniform vec4 velRampTextureBorderColor;
uniform vec3 velocityMin;
uniform vec3 velocityMax;
uniform vec3 velocityDrag;
uniform vec3 noiseMult;
uniform vec3 noiseFrequency;
uniform vec3 sNoiseMult;
uniform vec3 sNoiseFrequency;
uniform float gravity;
uniform vec3 localForce;
uniform float sizeVelScale;
uniform bool ALIGNTOX;
uniform bool ALIGNTOY;
uniform bool ALIGNTOZ;
uniform vec2 rotationRandom;
uniform vec2 rotationRate;
uniform float rotationDrag;
uniform vec4 sc_Time;
uniform sampler2D sizeRampTexture;
uniform sampler2DArray sizeRampTextureArrSC;
uniform sampler2D velRampTexture;
uniform sampler2DArray velRampTextureArrSC;
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
float ssPow(float A,float B)
{
float l9_0;
if (A<=0.0)
{
l9_0=0.0;
}
else
{
l9_0=pow(A,B);
}
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
int sizeRampTextureGetStereoViewIndex()
{
int l9_0;
#if (sizeRampTextureHasSwappedViews)
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
float N32_sNoise(vec2 v)
{
vec2 l9_0=floor(v+vec2(dot(v,vec2(0.36602542))));
vec2 l9_1=(v-l9_0)+vec2(dot(l9_0,vec2(0.21132487)));
float l9_2=l9_1.x;
float l9_3=l9_1.y;
bvec2 l9_4=bvec2(l9_2>l9_3);
vec2 l9_5=vec2(l9_4.x ? vec2(1.0,0.0).x : vec2(0.0,1.0).x,l9_4.y ? vec2(1.0,0.0).y : vec2(0.0,1.0).y);
vec4 l9_6=l9_1.xyxy+vec4(0.21132487,0.21132487,-0.57735026,-0.57735026);
vec2 l9_7=l9_6.xy-l9_5;
vec4 l9_8=vec4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
vec2 l9_9=mod(l9_0,vec2(289.0));
vec3 l9_10=vec3(l9_9.y)+vec3(0.0,l9_5.y,1.0);
vec3 l9_11=(mod(((l9_10*34.0)+vec3(1.0))*l9_10,vec3(289.0))+vec3(l9_9.x))+vec3(0.0,l9_5.x,1.0);
vec2 l9_12=l9_7.xy;
vec2 l9_13=l9_6.zw;
vec3 l9_14=max(vec3(0.5)-vec3(dot(l9_1,l9_1),dot(l9_12,l9_12),dot(l9_13,l9_13)),vec3(0.0));
vec3 l9_15=l9_14*l9_14;
vec3 l9_16=(fract(mod(((l9_11*34.0)+vec3(1.0))*l9_11,vec3(289.0))*vec3(0.024390243))*2.0)-vec3(1.0);
vec3 l9_17=abs(l9_16)-vec3(0.5);
vec3 l9_18=l9_16-floor(l9_16+vec3(0.5));
vec3 l9_19=vec3(0.0);
l9_19.x=(l9_18.x*l9_2)+(l9_17.x*l9_3);
vec2 l9_20=(l9_18.yz*l9_8.xz)+(l9_17.yz*l9_8.yw);
return 130.0*dot((l9_15*l9_15)*(vec3(1.7928429)-(((l9_18*l9_18)+(l9_17*l9_17))*0.85373473)),vec3(l9_19.x,l9_20.x,l9_20.y));
}
int velRampTextureGetStereoViewIndex()
{
int l9_0;
#if (velRampTextureHasSwappedViews)
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
mat3 N2_transposeMatrix(mat4 matrix)
{
return mat3(vec3(matrix[0].x,matrix[1].x,matrix[2].x),vec3(matrix[0].y,matrix[1].y,matrix[2].y),vec3(matrix[0].z,matrix[1].z,matrix[2].z));
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
vec4 l9_30=varColor;
vec3 l9_31=varNormal;
float l9_32;
#if (EXTERNALTIME)
{
l9_32=1.001;
}
#else
{
l9_32=0.001;
}
#endif
float l9_33=l9_32-0.001;
float l9_34;
#if (WORLDPOSSEED)
{
l9_34=1.001;
}
#else
{
l9_34=0.001;
}
#endif
float l9_35=l9_34-0.001;
float l9_36;
#if (LIFETIMEMINMAX)
{
l9_36=1.001;
}
#else
{
l9_36=0.001;
}
#endif
float l9_37=l9_36-0.001;
float l9_38;
#if (INSTANTSPAWN)
{
l9_38=1.001;
}
#else
{
l9_38=0.001;
}
#endif
float l9_39=l9_38-0.001;
float l9_40;
if (l9_35!=0.0)
{
l9_40=length(vec4(1.0)*sc_ModelMatrix);
}
else
{
l9_40=0.0;
}
vec2 l9_41;
if (l9_37!=0.0)
{
l9_41=lifeTimeMinMax;
}
else
{
l9_41=vec2(lifeTimeConstant);
}
float l9_42=externalSeed+l9_40;
float l9_43=l9_30.x+(l9_30.y*l9_30.z);
float l9_44;
if (l9_33!=0.0)
{
l9_44=externalTimeInput;
}
else
{
l9_44=sc_Time.x;
}
bool l9_45=!(l9_39!=0.0);
float l9_46;
if (l9_45)
{
l9_46=fract(((l9_44*timeGlobal)*(1.0/l9_41.y))+fract((l9_43*12.12358)+l9_42))*l9_41.y;
}
else
{
l9_46=timeGlobal*l9_44;
}
float l9_47=l9_46/max(l9_41.x,0.0099999998);
float l9_48=l9_46/max(l9_41.y,0.0099999998);
float l9_49=mix(l9_47,l9_48,fract((l9_43*3.5358)+l9_42));
float l9_50=clamp(l9_49,0.0,1.0);
float l9_51;
if (l9_45)
{
float l9_52;
if (spawnDuration!=0.0)
{
float l9_53;
if ((l9_44-spawnDuration)>=l9_46)
{
l9_53=1.0;
}
else
{
l9_53=0.0;
}
l9_52=l9_53;
}
else
{
l9_52=0.0;
}
l9_51=l9_52;
}
else
{
l9_51=0.0;
}
float l9_54=l9_49+l9_51;
float l9_55;
#if (MAXPARTICLECOUNT)
{
l9_55=1.001;
}
#else
{
l9_55=0.001;
}
#endif
float l9_56=l9_55-0.001;
float l9_57;
#if (SIZEMINMAX)
{
l9_57=1.001;
}
#else
{
l9_57=0.001;
}
#endif
float l9_58=l9_57-0.001;
float l9_59;
#if (SIZERAMP)
{
l9_59=1.001;
}
#else
{
l9_59=0.001;
}
#endif
float l9_60=l9_59-0.001;
float l9_61=ssPow(l9_50,sizeSpeed);
vec2 l9_62;
vec2 l9_63;
if (l9_58!=0.0)
{
l9_63=mix(sizeEndMin,sizeEndMax,vec2(fract((l9_43*41.231232)+l9_42)-0.5));
l9_62=mix(sizeStartMin,sizeStartMax,vec2(fract((l9_43*334.59122)+l9_42)-0.5));
}
else
{
l9_63=sizeEnd;
l9_62=sizeStart;
}
vec2 l9_64=mix(l9_62,l9_63,vec2(l9_61));
vec2 l9_65;
if (l9_60!=0.0)
{
vec2 l9_66=l9_28/vec2(10000.0,1.0);
vec2 l9_67=l9_66+vec2(ceil(l9_50*10000.0)/10000.0,0.0);
vec4 l9_68;
#if (sizeRampTextureLayout==2)
{
bool l9_69=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sizeRampTexture)!=0));
float l9_70=l9_67.x;
sc_SoftwareWrapEarly(l9_70,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).x);
float l9_71=l9_70;
float l9_72=l9_67.y;
sc_SoftwareWrapEarly(l9_72,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).y);
float l9_73=l9_72;
vec2 l9_74;
float l9_75;
#if (SC_USE_UV_MIN_MAX_sizeRampTexture)
{
bool l9_76;
#if (SC_USE_CLAMP_TO_BORDER_sizeRampTexture)
{
l9_76=ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).x==3;
}
#else
{
l9_76=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture)!=0);
}
#endif
float l9_77=l9_71;
float l9_78=1.0;
sc_ClampUV(l9_77,sizeRampTextureUvMinMax.x,sizeRampTextureUvMinMax.z,l9_76,l9_78);
float l9_79=l9_77;
float l9_80=l9_78;
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_sizeRampTexture)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).y==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture)!=0);
}
#endif
float l9_82=l9_73;
float l9_83=l9_80;
sc_ClampUV(l9_82,sizeRampTextureUvMinMax.y,sizeRampTextureUvMinMax.w,l9_81,l9_83);
l9_75=l9_83;
l9_74=vec2(l9_79,l9_82);
}
#else
{
l9_75=1.0;
l9_74=vec2(l9_71,l9_73);
}
#endif
vec2 l9_84=sc_TransformUV(l9_74,(int(SC_USE_UV_TRANSFORM_sizeRampTexture)!=0),sizeRampTextureTransform);
float l9_85=l9_84.x;
float l9_86=l9_75;
sc_SoftwareWrapLate(l9_85,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).x,l9_69,l9_86);
float l9_87=l9_84.y;
float l9_88=l9_86;
sc_SoftwareWrapLate(l9_87,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).y,l9_69,l9_88);
float l9_89=l9_88;
vec3 l9_90=sc_SamplingCoordsViewToGlobal(vec2(l9_85,l9_87),sizeRampTextureLayout,sizeRampTextureGetStereoViewIndex());
vec4 l9_91;
#if (sc_CanUseTextureLod)
{
l9_91=textureLod(sizeRampTextureArrSC,l9_90,0.0);
}
#else
{
l9_91=vec4(0.0);
}
#endif
vec4 l9_92;
#if (SC_USE_CLAMP_TO_BORDER_sizeRampTexture)
{
l9_92=mix(sizeRampTextureBorderColor,l9_91,vec4(l9_89));
}
#else
{
l9_92=l9_91;
}
#endif
l9_68=l9_92;
}
#else
{
bool l9_93=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_sizeRampTexture)!=0));
float l9_94=l9_67.x;
sc_SoftwareWrapEarly(l9_94,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).x);
float l9_95=l9_94;
float l9_96=l9_67.y;
sc_SoftwareWrapEarly(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).y);
float l9_97=l9_96;
vec2 l9_98;
float l9_99;
#if (SC_USE_UV_MIN_MAX_sizeRampTexture)
{
bool l9_100;
#if (SC_USE_CLAMP_TO_BORDER_sizeRampTexture)
{
l9_100=ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).x==3;
}
#else
{
l9_100=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture)!=0);
}
#endif
float l9_101=l9_95;
float l9_102=1.0;
sc_ClampUV(l9_101,sizeRampTextureUvMinMax.x,sizeRampTextureUvMinMax.z,l9_100,l9_102);
float l9_103=l9_101;
float l9_104=l9_102;
bool l9_105;
#if (SC_USE_CLAMP_TO_BORDER_sizeRampTexture)
{
l9_105=ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).y==3;
}
#else
{
l9_105=(int(SC_USE_CLAMP_TO_BORDER_sizeRampTexture)!=0);
}
#endif
float l9_106=l9_97;
float l9_107=l9_104;
sc_ClampUV(l9_106,sizeRampTextureUvMinMax.y,sizeRampTextureUvMinMax.w,l9_105,l9_107);
l9_99=l9_107;
l9_98=vec2(l9_103,l9_106);
}
#else
{
l9_99=1.0;
l9_98=vec2(l9_95,l9_97);
}
#endif
vec2 l9_108=sc_TransformUV(l9_98,(int(SC_USE_UV_TRANSFORM_sizeRampTexture)!=0),sizeRampTextureTransform);
float l9_109=l9_108.x;
float l9_110=l9_99;
sc_SoftwareWrapLate(l9_109,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).x,l9_93,l9_110);
float l9_111=l9_108.y;
float l9_112=l9_110;
sc_SoftwareWrapLate(l9_111,ivec2(SC_SOFTWARE_WRAP_MODE_U_sizeRampTexture,SC_SOFTWARE_WRAP_MODE_V_sizeRampTexture).y,l9_93,l9_112);
float l9_113=l9_112;
vec3 l9_114=sc_SamplingCoordsViewToGlobal(vec2(l9_109,l9_111),sizeRampTextureLayout,sizeRampTextureGetStereoViewIndex());
vec4 l9_115=textureLod(sizeRampTexture,l9_114.xy,0.0);
vec4 l9_116;
#if (SC_USE_CLAMP_TO_BORDER_sizeRampTexture)
{
l9_116=mix(sizeRampTextureBorderColor,l9_115,vec4(l9_113));
}
#else
{
l9_116=l9_115;
}
#endif
l9_68=l9_116;
}
#endif
vec2 l9_117;
#if (!((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH))
{
l9_117=vec2(1.0);
}
#else
{
l9_117=l9_68.xy;
}
#endif
l9_65=l9_117*l9_62;
}
else
{
l9_65=l9_64;
}
float l9_118;
#if (INILOCATION)
{
l9_118=1.001;
}
#else
{
l9_118=0.001;
}
#endif
float l9_119=l9_118-0.001;
float l9_120;
#if (BOXSPAWN)
{
l9_120=1.001;
}
#else
{
l9_120=0.001;
}
#endif
float l9_121=l9_120-0.001;
float l9_122;
#if (SPHERESPAWN)
{
l9_122=1.001;
}
#else
{
l9_122=0.001;
}
#endif
float l9_123=l9_122-0.001;
float l9_124=fract((l9_43*654.15588)+l9_42);
vec3 l9_125;
if (l9_119!=0.0)
{
l9_125=spawnLocation;
}
else
{
l9_125=vec3(0.0);
}
vec3 l9_126;
if (l9_121!=0.0)
{
l9_126=spawnBox*(fract((vec3(fract((l9_43*82.124229)+l9_42),fract((l9_43*9115.2148)+l9_42),l9_124)*313.13324)+vec3(l9_42))-vec3(0.5));
}
else
{
l9_126=vec3(0.0);
}
vec3 l9_127;
if (l9_123!=0.0)
{
l9_127=spawnSphere*(vec3(l9_30.xyz)-vec3(0.5));
}
else
{
l9_127=vec3(0.0);
}
vec3 l9_128=l9_125+l9_127;
vec3 l9_129=l9_128+l9_126;
float l9_130;
#if (VELRAMP)
{
l9_130=1.001;
}
#else
{
l9_130=0.001;
}
#endif
float l9_131=l9_130-0.001;
float l9_132;
#if (NOISE)
{
l9_132=1.001;
}
#else
{
l9_132=0.001;
}
#endif
float l9_133=l9_132-0.001;
float l9_134;
#if (SNOISE)
{
l9_134=1.001;
}
#else
{
l9_134=0.001;
}
#endif
float l9_135=l9_134-0.001;
float l9_136=fract((l9_43*18.984529)+l9_42);
float l9_137=fract((l9_43*45.722408)+l9_42);
vec3 l9_138=vec3(l9_124,l9_137,l9_136);
vec3 l9_139=(l9_138-vec3(0.5))*2.0;
vec3 l9_140;
if (l9_133!=0.0)
{
l9_140=vec3(0.0)+((vec3(sin(l9_50*noiseFrequency.x),sin(l9_50*noiseFrequency.y),sin(l9_50*noiseFrequency.z))*noiseMult)*l9_139);
}
else
{
l9_140=vec3(0.0);
}
vec3 l9_141;
if (l9_135!=0.0)
{
l9_141=l9_140+((vec3(N32_sNoise(vec2(l9_136*l9_46,sNoiseFrequency.x)),N32_sNoise(vec2(l9_124*l9_46,sNoiseFrequency.y)),N32_sNoise(vec2(l9_137*l9_46,sNoiseFrequency.z)))*sNoiseMult)*l9_139);
}
else
{
l9_141=l9_140;
}
bool l9_142=l9_131!=0.0;
vec3 l9_143;
if (l9_142)
{
l9_143=mix(velocityMin,velocityMax,l9_138);
}
else
{
l9_143=velocityMin+(((l9_139+vec3(1.0))/vec3(2.0))*(velocityMax-velocityMin));
}
bool l9_144=l9_46<=0.0;
float l9_145;
if (l9_144)
{
l9_145=0.0;
}
else
{
l9_145=pow(l9_46,velocityDrag.x);
}
float l9_146;
if (l9_144)
{
l9_146=0.0;
}
else
{
l9_146=pow(l9_46,velocityDrag.y);
}
float l9_147;
if (l9_144)
{
l9_147=0.0;
}
else
{
l9_147=pow(l9_46,velocityDrag.z);
}
vec3 l9_148=vec3(l9_145,l9_146,l9_147);
vec3 l9_149=l9_143+l9_141;
vec3 l9_150;
if (l9_142)
{
vec2 l9_151=l9_28/vec2(10000.0,1.0);
vec2 l9_152=l9_151+vec2(floor(l9_50*10000.0)/10000.0,0.0);
vec4 l9_153;
#if (velRampTextureLayout==2)
{
bool l9_154=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_velRampTexture)!=0));
float l9_155=l9_152.x;
sc_SoftwareWrapEarly(l9_155,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).x);
float l9_156=l9_155;
float l9_157=l9_152.y;
sc_SoftwareWrapEarly(l9_157,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).y);
float l9_158=l9_157;
vec2 l9_159;
float l9_160;
#if (SC_USE_UV_MIN_MAX_velRampTexture)
{
bool l9_161;
#if (SC_USE_CLAMP_TO_BORDER_velRampTexture)
{
l9_161=ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).x==3;
}
#else
{
l9_161=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture)!=0);
}
#endif
float l9_162=l9_156;
float l9_163=1.0;
sc_ClampUV(l9_162,velRampTextureUvMinMax.x,velRampTextureUvMinMax.z,l9_161,l9_163);
float l9_164=l9_162;
float l9_165=l9_163;
bool l9_166;
#if (SC_USE_CLAMP_TO_BORDER_velRampTexture)
{
l9_166=ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).y==3;
}
#else
{
l9_166=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture)!=0);
}
#endif
float l9_167=l9_158;
float l9_168=l9_165;
sc_ClampUV(l9_167,velRampTextureUvMinMax.y,velRampTextureUvMinMax.w,l9_166,l9_168);
l9_160=l9_168;
l9_159=vec2(l9_164,l9_167);
}
#else
{
l9_160=1.0;
l9_159=vec2(l9_156,l9_158);
}
#endif
vec2 l9_169=sc_TransformUV(l9_159,(int(SC_USE_UV_TRANSFORM_velRampTexture)!=0),velRampTextureTransform);
float l9_170=l9_169.x;
float l9_171=l9_160;
sc_SoftwareWrapLate(l9_170,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).x,l9_154,l9_171);
float l9_172=l9_169.y;
float l9_173=l9_171;
sc_SoftwareWrapLate(l9_172,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).y,l9_154,l9_173);
float l9_174=l9_173;
vec3 l9_175=sc_SamplingCoordsViewToGlobal(vec2(l9_170,l9_172),velRampTextureLayout,velRampTextureGetStereoViewIndex());
vec4 l9_176;
#if (sc_CanUseTextureLod)
{
l9_176=textureLod(velRampTextureArrSC,l9_175,0.0);
}
#else
{
l9_176=vec4(0.0);
}
#endif
vec4 l9_177;
#if (SC_USE_CLAMP_TO_BORDER_velRampTexture)
{
l9_177=mix(velRampTextureBorderColor,l9_176,vec4(l9_174));
}
#else
{
l9_177=l9_176;
}
#endif
l9_153=l9_177;
}
#else
{
bool l9_178=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_velRampTexture)!=0));
float l9_179=l9_152.x;
sc_SoftwareWrapEarly(l9_179,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).x);
float l9_180=l9_179;
float l9_181=l9_152.y;
sc_SoftwareWrapEarly(l9_181,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).y);
float l9_182=l9_181;
vec2 l9_183;
float l9_184;
#if (SC_USE_UV_MIN_MAX_velRampTexture)
{
bool l9_185;
#if (SC_USE_CLAMP_TO_BORDER_velRampTexture)
{
l9_185=ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).x==3;
}
#else
{
l9_185=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture)!=0);
}
#endif
float l9_186=l9_180;
float l9_187=1.0;
sc_ClampUV(l9_186,velRampTextureUvMinMax.x,velRampTextureUvMinMax.z,l9_185,l9_187);
float l9_188=l9_186;
float l9_189=l9_187;
bool l9_190;
#if (SC_USE_CLAMP_TO_BORDER_velRampTexture)
{
l9_190=ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).y==3;
}
#else
{
l9_190=(int(SC_USE_CLAMP_TO_BORDER_velRampTexture)!=0);
}
#endif
float l9_191=l9_182;
float l9_192=l9_189;
sc_ClampUV(l9_191,velRampTextureUvMinMax.y,velRampTextureUvMinMax.w,l9_190,l9_192);
l9_184=l9_192;
l9_183=vec2(l9_188,l9_191);
}
#else
{
l9_184=1.0;
l9_183=vec2(l9_180,l9_182);
}
#endif
vec2 l9_193=sc_TransformUV(l9_183,(int(SC_USE_UV_TRANSFORM_velRampTexture)!=0),velRampTextureTransform);
float l9_194=l9_193.x;
float l9_195=l9_184;
sc_SoftwareWrapLate(l9_194,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).x,l9_178,l9_195);
float l9_196=l9_193.y;
float l9_197=l9_195;
sc_SoftwareWrapLate(l9_196,ivec2(SC_SOFTWARE_WRAP_MODE_U_velRampTexture,SC_SOFTWARE_WRAP_MODE_V_velRampTexture).y,l9_178,l9_197);
float l9_198=l9_197;
vec3 l9_199=sc_SamplingCoordsViewToGlobal(vec2(l9_194,l9_196),velRampTextureLayout,velRampTextureGetStereoViewIndex());
vec4 l9_200=textureLod(velRampTexture,l9_199.xy,0.0);
vec4 l9_201;
#if (SC_USE_CLAMP_TO_BORDER_velRampTexture)
{
l9_201=mix(velRampTextureBorderColor,l9_200,vec4(l9_198));
}
#else
{
l9_201=l9_200;
}
#endif
l9_153=l9_201;
}
#endif
vec3 l9_202;
#if (!((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH))
{
l9_202=l9_143*l9_148;
}
#else
{
l9_202=l9_149*l9_153.xyz;
}
#endif
l9_150=l9_202;
}
else
{
l9_150=l9_149*l9_148;
}
float l9_203;
#if (FORCE)
{
l9_203=1.001;
}
#else
{
l9_203=0.001;
}
#endif
float l9_204=l9_203-0.001;
float l9_205;
#if (IGNOREVEL)
{
l9_205=1.001;
}
#else
{
l9_205=0.001;
}
#endif
float l9_206=l9_205-0.001;
float l9_207=fract((l9_43*15.32451)+l9_42);
float l9_208;
if (l9_56!=0.0)
{
bool l9_209=l9_54>=0.99000001;
float l9_210;
if (l9_209||(((fract((l9_43*1231.1232)+l9_42)*1000.0)+1.0)>=spawnMaxParticles))
{
l9_210=0.0;
}
else
{
float l9_211;
if (l9_209)
{
l9_211=0.0;
}
else
{
l9_211=1.0;
}
l9_210=l9_211;
}
l9_208=l9_210;
}
else
{
l9_208=1.0;
}
float l9_212=(gravity/2.0)*l9_46;
float l9_213=l9_212*l9_46;
vec3 l9_214=vec3(0.0,l9_213,0.0);
vec3 l9_215;
if (l9_204!=0.0)
{
l9_215=((localForce/vec3(2.0))*l9_46)*l9_46;
}
else
{
l9_215=vec3(0.0);
}
float l9_216=length(sc_ModelMatrix[0].xyz);
vec2 l9_217=l9_28-vec2(0.5);
vec2 l9_218=l9_217*l9_208;
vec2 l9_219=l9_218*l9_65;
vec2 l9_220=l9_219*l9_216;
vec3 l9_221=normalize(vec3(sc_ViewMatrixArray[sc_GetStereoViewIndex()][0].z,sc_ViewMatrixArray[sc_GetStereoViewIndex()][1].z,sc_ViewMatrixArray[sc_GetStereoViewIndex()][2].z+1e-06));
vec3 l9_222=normalize(cross(l9_221,vec3(0.0,-1.0,0.0)));
vec3 l9_223;
vec3 l9_224;
if (float(ALIGNTOX)!=0.0)
{
l9_224=vec3(0.0,1.0,0.0);
l9_223=vec3(0.0,0.0,1.0);
}
else
{
l9_224=normalize(cross(l9_222,l9_221));
l9_223=l9_222;
}
vec3 l9_225;
vec3 l9_226;
if (float(ALIGNTOY)!=0.0)
{
l9_226=vec3(0.0,0.0,1.0);
l9_225=vec3(1.0,0.0,0.0);
}
else
{
l9_226=l9_224;
l9_225=l9_223;
}
vec3 l9_227;
vec3 l9_228;
if (float(ALIGNTOZ)!=0.0)
{
l9_228=vec3(0.0,1.0,0.0);
l9_227=vec3(1.0,0.0,0.0);
}
else
{
l9_228=l9_226;
l9_227=l9_225;
}
float l9_229=ssPow(1.0-l9_50,rotationDrag);
float l9_230=3.1415927*(((((mix(rotationRate.x,rotationRate.y,l9_207)*l9_229)*l9_50)*2.0)+mix(rotationRandom.x,rotationRandom.y,l9_207))-0.5);
float l9_231=cos(l9_230);
float l9_232=sin(l9_230);
vec3 l9_233=l9_227*l9_231;
vec3 l9_234=l9_228*l9_232;
vec3 l9_235=l9_227*(-l9_232);
vec3 l9_236=l9_228*l9_231;
vec3 l9_237=l9_150+l9_214;
vec3 l9_238=l9_237+l9_215;
mat3 l9_239=N2_transposeMatrix(sc_ModelMatrix);
vec3 l9_240;
#if (NODE_67_DROPLIST_ITEM==2)
{
l9_240=((l9_150*N2_transposeMatrix(sc_ModelMatrix))+l9_214)+l9_215;
}
#else
{
l9_240=l9_238*l9_239;
}
#endif
vec3 l9_241;
#if (NODE_67_DROPLIST_ITEM==1)
{
l9_241=((l9_150*vec3(l9_216,length(sc_ModelMatrix[1].xyz),length(sc_ModelMatrix[2].xyz)))+l9_214)+l9_215;
}
#else
{
l9_241=l9_240;
}
#endif
vec3 l9_242;
vec3 l9_243;
float l9_244;
#if (VELOCITYDIR)
{
vec3 l9_245=l9_241+l9_214;
vec3 l9_246=l9_245+l9_215;
vec3 l9_247=normalize(l9_246+vec3(1e-06));
float l9_248=l9_46-0.0099999998;
vec3 l9_249=l9_241*l9_248;
float l9_250=l9_46+0.0099999998;
vec3 l9_251=l9_241*l9_250;
float l9_252;
if (l9_206!=0.0)
{
l9_252=sizeVelScale;
}
else
{
l9_252=length(l9_251-l9_249)*sizeVelScale;
}
l9_244=l9_252;
l9_243=l9_247;
l9_242=normalize(cross(l9_247,l9_221));
}
#else
{
l9_244=1.0;
l9_243=l9_233+l9_234;
l9_242=l9_235+l9_236;
}
#endif
vec3 l9_253=(sc_ModelMatrix*vec4(l9_129,1.0)).xyz+l9_241;
vec3 l9_254=l9_242*l9_220.x;
float l9_255=l9_220.y*l9_244;
vec3 l9_256=l9_243*l9_255;
vec3 l9_257;
vec3 l9_258;
vec3 l9_259;
if (l9_27)
{
l9_259=varTangent.xyz;
l9_258=varNormal;
l9_257=varPos;
}
else
{
l9_259=varTangent.xyz;
l9_258=l9_31;
l9_257=(l9_253+l9_254)+l9_256;
}
varPos=l9_257;
varNormal=normalize(l9_258);
vec3 l9_260=normalize(l9_259);
varTangent=vec4(l9_260.x,l9_260.y,l9_260.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_261;
#if (sc_RenderingSpace==3)
{
l9_261=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_262;
#if (sc_RenderingSpace==2)
{
l9_262=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_263;
#if (sc_RenderingSpace==1)
{
l9_263=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
l9_263=l9_17;
}
#endif
l9_262=l9_263;
}
#endif
l9_261=l9_262;
}
#endif
varViewSpaceDepth=-l9_261.z;
}
#endif
vec4 l9_264;
#if (sc_RenderingSpace==3)
{
l9_264=l9_17;
}
#else
{
vec4 l9_265;
#if (sc_RenderingSpace==4)
{
l9_265=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_266;
#if (sc_RenderingSpace==2)
{
l9_266=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_267;
#if (sc_RenderingSpace==1)
{
l9_267=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_267=vec4(0.0);
}
#endif
l9_266=l9_267;
}
#endif
l9_265=l9_266;
}
#endif
l9_264=l9_265;
}
#endif
varPackedTex=vec4(l9_28,l9_2);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_268;
#if (sc_RenderingSpace==1)
{
l9_268=sc_ModelMatrix*l9_17;
}
#else
{
l9_268=l9_17;
}
#endif
vec4 l9_269=sc_ProjectorMatrix*l9_268;
varShadowTex=((l9_269.xy/vec2(l9_269.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_270;
#if (sc_DepthBufferMode==1)
{
vec4 l9_271;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_272=l9_264;
l9_272.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_264.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_264.w;
l9_271=l9_272;
}
else
{
l9_271=l9_264;
}
l9_270=l9_271;
}
#else
{
l9_270=l9_264;
}
#endif
vec4 l9_273;
#if (sc_TAAEnabled)
{
vec2 l9_274=l9_270.xy+(sc_TAAJitterOffset*l9_270.w);
l9_273=vec4(l9_274.x,l9_274.y,l9_270.z,l9_270.w);
}
#else
{
l9_273=l9_270;
}
#endif
vec4 l9_275;
#if (sc_ShaderCacheConstant!=0)
{
vec4 l9_276=l9_273;
l9_276.x=l9_273.x+(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
l9_275=l9_276;
}
#else
{
l9_275=l9_273;
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=sc_StereoViewID;
}
#endif
#if (sc_StereoRenderingMode==1)
{
float l9_277=dot(l9_275,sc_StereoClipPlanes[sc_StereoViewID]);
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(l9_277);
}
#else
{
varClipDistance=l9_277;
}
#endif
}
#endif
gl_Position=l9_275;
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define SC_DISABLE_FRUSTUM_CULLING 1
#ifdef ALIGNTOX
#undef ALIGNTOX
#endif
#ifdef ALIGNTOY
#undef ALIGNTOY
#endif
#ifdef ALIGNTOZ
#undef ALIGNTOZ
#endif
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
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
#endif
#ifndef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 0
#elif SC_GL_FRAGMENT_PRECISION_HIGH==1
#undef SC_GL_FRAGMENT_PRECISION_HIGH
#define SC_GL_FRAGMENT_PRECISION_HIGH 1
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
#ifndef mainTextureHasSwappedViews
#define mainTextureHasSwappedViews 0
#elif mainTextureHasSwappedViews==1
#undef mainTextureHasSwappedViews
#define mainTextureHasSwappedViews 1
#endif
#ifndef mainTextureLayout
#define mainTextureLayout 0
#endif
#ifndef vectorTextureHasSwappedViews
#define vectorTextureHasSwappedViews 0
#elif vectorTextureHasSwappedViews==1
#undef vectorTextureHasSwappedViews
#define vectorTextureHasSwappedViews 1
#endif
#ifndef vectorTextureLayout
#define vectorTextureLayout 0
#endif
#ifndef colorRampTextureHasSwappedViews
#define colorRampTextureHasSwappedViews 0
#elif colorRampTextureHasSwappedViews==1
#undef colorRampTextureHasSwappedViews
#define colorRampTextureHasSwappedViews 1
#endif
#ifndef colorRampTextureLayout
#define colorRampTextureLayout 0
#endif
#ifndef BASETEXTURE
#define BASETEXTURE 0
#elif BASETEXTURE==1
#undef BASETEXTURE
#define BASETEXTURE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_mainTexture
#define SC_USE_UV_TRANSFORM_mainTexture 0
#elif SC_USE_UV_TRANSFORM_mainTexture==1
#undef SC_USE_UV_TRANSFORM_mainTexture
#define SC_USE_UV_TRANSFORM_mainTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_mainTexture
#define SC_SOFTWARE_WRAP_MODE_U_mainTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_mainTexture
#define SC_SOFTWARE_WRAP_MODE_V_mainTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_mainTexture
#define SC_USE_UV_MIN_MAX_mainTexture 0
#elif SC_USE_UV_MIN_MAX_mainTexture==1
#undef SC_USE_UV_MIN_MAX_mainTexture
#define SC_USE_UV_MIN_MAX_mainTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_mainTexture
#define SC_USE_CLAMP_TO_BORDER_mainTexture 0
#elif SC_USE_CLAMP_TO_BORDER_mainTexture==1
#undef SC_USE_CLAMP_TO_BORDER_mainTexture
#define SC_USE_CLAMP_TO_BORDER_mainTexture 1
#endif
#ifndef FLIPBOOK
#define FLIPBOOK 0
#elif FLIPBOOK==1
#undef FLIPBOOK
#define FLIPBOOK 1
#endif
#ifndef VECTORFIELD
#define VECTORFIELD 0
#elif VECTORFIELD==1
#undef VECTORFIELD
#define VECTORFIELD 1
#endif
#ifndef COLORRAMP
#define COLORRAMP 0
#elif COLORRAMP==1
#undef COLORRAMP
#define COLORRAMP 1
#endif
#ifndef ALPHADISSOLVE
#define ALPHADISSOLVE 0
#elif ALPHADISSOLVE==1
#undef ALPHADISSOLVE
#define ALPHADISSOLVE 1
#endif
#ifndef BLACKASALPHA
#define BLACKASALPHA 0
#elif BLACKASALPHA==1
#undef BLACKASALPHA
#define BLACKASALPHA 1
#endif
#ifndef PREMULTIPLIEDCOLOR
#define PREMULTIPLIEDCOLOR 0
#elif PREMULTIPLIEDCOLOR==1
#undef PREMULTIPLIEDCOLOR
#define PREMULTIPLIEDCOLOR 1
#endif
#ifndef FLIPBOOKBLEND
#define FLIPBOOKBLEND 0
#elif FLIPBOOKBLEND==1
#undef FLIPBOOKBLEND
#define FLIPBOOKBLEND 1
#endif
#ifndef FLIPBOOKBYLIFE
#define FLIPBOOKBYLIFE 0
#elif FLIPBOOKBYLIFE==1
#undef FLIPBOOKBYLIFE
#define FLIPBOOKBYLIFE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_vectorTexture
#define SC_USE_UV_TRANSFORM_vectorTexture 0
#elif SC_USE_UV_TRANSFORM_vectorTexture==1
#undef SC_USE_UV_TRANSFORM_vectorTexture
#define SC_USE_UV_TRANSFORM_vectorTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_vectorTexture
#define SC_SOFTWARE_WRAP_MODE_U_vectorTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_vectorTexture
#define SC_SOFTWARE_WRAP_MODE_V_vectorTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_vectorTexture
#define SC_USE_UV_MIN_MAX_vectorTexture 0
#elif SC_USE_UV_MIN_MAX_vectorTexture==1
#undef SC_USE_UV_MIN_MAX_vectorTexture
#define SC_USE_UV_MIN_MAX_vectorTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_vectorTexture
#define SC_USE_CLAMP_TO_BORDER_vectorTexture 0
#elif SC_USE_CLAMP_TO_BORDER_vectorTexture==1
#undef SC_USE_CLAMP_TO_BORDER_vectorTexture
#define SC_USE_CLAMP_TO_BORDER_vectorTexture 1
#endif
#ifndef EXTERNALTIME
#define EXTERNALTIME 0
#elif EXTERNALTIME==1
#undef EXTERNALTIME
#define EXTERNALTIME 1
#endif
#ifndef WORLDPOSSEED
#define WORLDPOSSEED 0
#elif WORLDPOSSEED==1
#undef WORLDPOSSEED
#define WORLDPOSSEED 1
#endif
#ifndef LIFETIMEMINMAX
#define LIFETIMEMINMAX 0
#elif LIFETIMEMINMAX==1
#undef LIFETIMEMINMAX
#define LIFETIMEMINMAX 1
#endif
#ifndef INSTANTSPAWN
#define INSTANTSPAWN 0
#elif INSTANTSPAWN==1
#undef INSTANTSPAWN
#define INSTANTSPAWN 1
#endif
#ifndef COLORMINMAX
#define COLORMINMAX 0
#elif COLORMINMAX==1
#undef COLORMINMAX
#define COLORMINMAX 1
#endif
#ifndef COLORMONOMIN
#define COLORMONOMIN 0
#elif COLORMONOMIN==1
#undef COLORMONOMIN
#define COLORMONOMIN 1
#endif
#ifndef ALPHAMINMAX
#define ALPHAMINMAX 0
#elif ALPHAMINMAX==1
#undef ALPHAMINMAX
#define ALPHAMINMAX 1
#endif
#ifndef SC_USE_UV_TRANSFORM_colorRampTexture
#define SC_USE_UV_TRANSFORM_colorRampTexture 0
#elif SC_USE_UV_TRANSFORM_colorRampTexture==1
#undef SC_USE_UV_TRANSFORM_colorRampTexture
#define SC_USE_UV_TRANSFORM_colorRampTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_colorRampTexture
#define SC_SOFTWARE_WRAP_MODE_U_colorRampTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_colorRampTexture
#define SC_SOFTWARE_WRAP_MODE_V_colorRampTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_colorRampTexture
#define SC_USE_UV_MIN_MAX_colorRampTexture 0
#elif SC_USE_UV_MIN_MAX_colorRampTexture==1
#undef SC_USE_UV_MIN_MAX_colorRampTexture
#define SC_USE_UV_MIN_MAX_colorRampTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_colorRampTexture
#define SC_USE_CLAMP_TO_BORDER_colorRampTexture 0
#elif SC_USE_CLAMP_TO_BORDER_colorRampTexture==1
#undef SC_USE_CLAMP_TO_BORDER_colorRampTexture
#define SC_USE_CLAMP_TO_BORDER_colorRampTexture 1
#endif
#ifndef NORANDOFFSET
#define NORANDOFFSET 0
#elif NORANDOFFSET==1
#undef NORANDOFFSET
#define NORANDOFFSET 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
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
uniform mat3 mainTextureTransform;
uniform vec4 mainTextureUvMinMax;
uniform vec4 mainTextureBorderColor;
uniform mat3 vectorTextureTransform;
uniform vec4 vectorTextureUvMinMax;
uniform vec4 vectorTextureBorderColor;
uniform float numValidFrames;
uniform vec2 gridSize;
uniform float flipBookSpeedMult;
uniform float flipBookRandomStart;
uniform mat4 sc_ModelMatrix;
uniform float timeGlobal;
uniform float externalTimeInput;
uniform float externalSeed;
uniform float lifeTimeConstant;
uniform vec2 lifeTimeMinMax;
uniform float flowStrength;
uniform float flowSpeed;
uniform vec3 colorStart;
uniform vec3 colorEnd;
uniform vec3 colorMinStart;
uniform vec3 colorMinEnd;
uniform vec3 colorMaxStart;
uniform vec3 colorMaxEnd;
uniform float alphaStart;
uniform float alphaEnd;
uniform float alphaMinStart;
uniform float alphaMinEnd;
uniform float alphaMaxStart;
uniform float alphaMaxEnd;
uniform mat3 colorRampTextureTransform;
uniform vec4 colorRampTextureUvMinMax;
uniform vec4 colorRampTextureBorderColor;
uniform vec4 colorRampTextureSize;
uniform vec4 colorRampMult;
uniform float alphaDissolveMult;
uniform vec4 sc_Time;
uniform int PreviewEnabled;
uniform sampler2D mainTexture;
uniform sampler2DArray mainTextureArrSC;
uniform sampler2D vectorTexture;
uniform sampler2DArray vectorTextureArrSC;
uniform sampler2D colorRampTexture;
uniform sampler2DArray colorRampTextureArrSC;
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
in vec4 varPackedTex;
in vec4 varColor;
in vec3 varPos;
in vec3 varNormal;
in vec4 varTangent;
in vec4 varScreenPos;
in vec2 varScreenTexturePos;
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
int mainTextureGetStereoViewIndex()
{
int l9_0;
#if (mainTextureHasSwappedViews)
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
vec4 N76_mainTexture_sample(vec2 coords)
{
vec4 l9_0;
#if (mainTextureLayout==2)
{
bool l9_1=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_mainTexture)!=0));
float l9_2=coords.x;
sc_SoftwareWrapEarly(l9_2,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x);
float l9_3=l9_2;
float l9_4=coords.y;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y);
float l9_5=l9_4;
vec2 l9_6;
float l9_7;
#if (SC_USE_UV_MIN_MAX_mainTexture)
{
bool l9_8;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_8=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x==3;
}
#else
{
l9_8=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_9=l9_3;
float l9_10=1.0;
sc_ClampUV(l9_9,mainTextureUvMinMax.x,mainTextureUvMinMax.z,l9_8,l9_10);
float l9_11=l9_9;
float l9_12=l9_10;
bool l9_13;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_13=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y==3;
}
#else
{
l9_13=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_14=l9_5;
float l9_15=l9_12;
sc_ClampUV(l9_14,mainTextureUvMinMax.y,mainTextureUvMinMax.w,l9_13,l9_15);
l9_7=l9_15;
l9_6=vec2(l9_11,l9_14);
}
#else
{
l9_7=1.0;
l9_6=vec2(l9_3,l9_5);
}
#endif
vec2 l9_16=sc_TransformUV(l9_6,(int(SC_USE_UV_TRANSFORM_mainTexture)!=0),mainTextureTransform);
float l9_17=l9_16.x;
float l9_18=l9_7;
sc_SoftwareWrapLate(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x,l9_1,l9_18);
float l9_19=l9_16.y;
float l9_20=l9_18;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y,l9_1,l9_20);
float l9_21=l9_20;
vec3 l9_22=sc_SamplingCoordsViewToGlobal(vec2(l9_17,l9_19),mainTextureLayout,mainTextureGetStereoViewIndex());
vec4 l9_23=texture(mainTextureArrSC,l9_22,0.0);
vec4 l9_24;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_24=mix(mainTextureBorderColor,l9_23,vec4(l9_21));
}
#else
{
l9_24=l9_23;
}
#endif
l9_0=l9_24;
}
#else
{
bool l9_25=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_mainTexture)!=0));
float l9_26=coords.x;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x);
float l9_27=l9_26;
float l9_28=coords.y;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y);
float l9_29=l9_28;
vec2 l9_30;
float l9_31;
#if (SC_USE_UV_MIN_MAX_mainTexture)
{
bool l9_32;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_32=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x==3;
}
#else
{
l9_32=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_33=l9_27;
float l9_34=1.0;
sc_ClampUV(l9_33,mainTextureUvMinMax.x,mainTextureUvMinMax.z,l9_32,l9_34);
float l9_35=l9_33;
float l9_36=l9_34;
bool l9_37;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_37=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y==3;
}
#else
{
l9_37=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_38=l9_29;
float l9_39=l9_36;
sc_ClampUV(l9_38,mainTextureUvMinMax.y,mainTextureUvMinMax.w,l9_37,l9_39);
l9_31=l9_39;
l9_30=vec2(l9_35,l9_38);
}
#else
{
l9_31=1.0;
l9_30=vec2(l9_27,l9_29);
}
#endif
vec2 l9_40=sc_TransformUV(l9_30,(int(SC_USE_UV_TRANSFORM_mainTexture)!=0),mainTextureTransform);
float l9_41=l9_40.x;
float l9_42=l9_31;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x,l9_25,l9_42);
float l9_43=l9_40.y;
float l9_44=l9_42;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y,l9_25,l9_44);
float l9_45=l9_44;
vec3 l9_46=sc_SamplingCoordsViewToGlobal(vec2(l9_41,l9_43),mainTextureLayout,mainTextureGetStereoViewIndex());
vec4 l9_47=texture(mainTexture,l9_46.xy,0.0);
vec4 l9_48;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_48=mix(mainTextureBorderColor,l9_47,vec4(l9_45));
}
#else
{
l9_48=l9_47;
}
#endif
l9_0=l9_48;
}
#endif
return l9_0;
}
int vectorTextureGetStereoViewIndex()
{
int l9_0;
#if (vectorTextureHasSwappedViews)
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
int colorRampTextureGetStereoViewIndex()
{
int l9_0;
#if (colorRampTextureHasSwappedViews)
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
float l9_0;
#if (BASETEXTURE)
{
l9_0=1.001;
}
#else
{
l9_0=0.001;
}
#endif
float l9_1=l9_0-0.001;
float l9_2;
#if (FLIPBOOK)
{
l9_2=1.001;
}
#else
{
l9_2=0.001;
}
#endif
float l9_3=l9_2-0.001;
float l9_4;
#if (EXTERNALTIME)
{
l9_4=1.001;
}
#else
{
l9_4=0.001;
}
#endif
float l9_5=l9_4-0.001;
float l9_6;
#if (WORLDPOSSEED)
{
l9_6=1.001;
}
#else
{
l9_6=0.001;
}
#endif
float l9_7=l9_6-0.001;
float l9_8;
#if (LIFETIMEMINMAX)
{
l9_8=1.001;
}
#else
{
l9_8=0.001;
}
#endif
float l9_9=l9_8-0.001;
float l9_10;
#if (INSTANTSPAWN)
{
l9_10=1.001;
}
#else
{
l9_10=0.001;
}
#endif
float l9_11=l9_10-0.001;
float l9_12;
if (l9_7!=0.0)
{
l9_12=length(vec4(1.0)*sc_ModelMatrix);
}
else
{
l9_12=0.0;
}
vec2 l9_13;
if (l9_9!=0.0)
{
l9_13=lifeTimeMinMax;
}
else
{
l9_13=vec2(lifeTimeConstant);
}
float l9_14=max(l9_13.x,0.0099999998);
float l9_15=max(l9_13.y,0.0099999998);
float l9_16=externalSeed+l9_12;
float l9_17=varColor.x+(varColor.y*varColor.z);
float l9_18=fract((l9_17*3.5358)+l9_16);
float l9_19;
if (l9_5!=0.0)
{
l9_19=externalTimeInput;
}
else
{
l9_19=sc_Time.x;
}
float l9_20;
if (!(l9_11!=0.0))
{
l9_20=fract(((l9_19*timeGlobal)*(1.0/l9_13.y))+fract((l9_17*12.12358)+l9_16))*l9_13.y;
}
else
{
l9_20=timeGlobal*l9_19;
}
float l9_21=l9_20/l9_14;
float l9_22=l9_20/l9_15;
float l9_23=clamp(mix(l9_21,l9_22,l9_18),0.0,1.0);
float l9_24;
#if (FLIPBOOKBLEND)
{
l9_24=1.001;
}
#else
{
l9_24=0.001;
}
#endif
float l9_25=l9_24-0.001;
float l9_26;
#if (FLIPBOOKBYLIFE)
{
l9_26=1.001;
}
#else
{
l9_26=0.001;
}
#endif
float l9_27;
if ((l9_26-0.001)!=0.0)
{
l9_27=l9_20/mix(l9_14,l9_15,l9_18);
}
else
{
l9_27=l9_20;
}
vec2 l9_28=varPackedTex.xy/gridSize;
float l9_29=l9_27*flipBookSpeedMult;
float l9_30=mod(l9_29+mix(0.0,flipBookRandomStart,fract((l9_17*43.2234)+l9_16)),numValidFrames);
float l9_31=1.0/gridSize.x;
float l9_32=1.0/gridSize.y;
float l9_33=mod(l9_30+1.0,numValidFrames);
vec2 l9_34=l9_28+vec2(floor(l9_30)*l9_31,mod(floor((-l9_30)/gridSize.x),gridSize.y)*l9_32);
vec4 l9_35;
if (l9_25!=0.0)
{
l9_35=mix(N76_mainTexture_sample(l9_34),N76_mainTexture_sample(l9_28+vec2(floor(l9_33)*l9_31,floor((-l9_33)*l9_31)*l9_32)),vec4(fract(l9_30)));
}
else
{
l9_35=N76_mainTexture_sample(l9_34);
}
vec4 l9_36;
#if (!((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH))
{
l9_36=N76_mainTexture_sample(varPackedTex.xy);
}
#else
{
vec4 l9_37;
#if (vectorTextureLayout==2)
{
bool l9_38=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_vectorTexture)!=0));
float l9_39=varPackedTex.x;
sc_SoftwareWrapEarly(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).x);
float l9_40=l9_39;
float l9_41=varPackedTex.y;
sc_SoftwareWrapEarly(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).y);
float l9_42=l9_41;
vec2 l9_43;
float l9_44;
#if (SC_USE_UV_MIN_MAX_vectorTexture)
{
bool l9_45;
#if (SC_USE_CLAMP_TO_BORDER_vectorTexture)
{
l9_45=ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).x==3;
}
#else
{
l9_45=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture)!=0);
}
#endif
float l9_46=l9_40;
float l9_47=1.0;
sc_ClampUV(l9_46,vectorTextureUvMinMax.x,vectorTextureUvMinMax.z,l9_45,l9_47);
float l9_48=l9_46;
float l9_49=l9_47;
bool l9_50;
#if (SC_USE_CLAMP_TO_BORDER_vectorTexture)
{
l9_50=ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).y==3;
}
#else
{
l9_50=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture)!=0);
}
#endif
float l9_51=l9_42;
float l9_52=l9_49;
sc_ClampUV(l9_51,vectorTextureUvMinMax.y,vectorTextureUvMinMax.w,l9_50,l9_52);
l9_44=l9_52;
l9_43=vec2(l9_48,l9_51);
}
#else
{
l9_44=1.0;
l9_43=vec2(l9_40,l9_42);
}
#endif
vec2 l9_53=sc_TransformUV(l9_43,(int(SC_USE_UV_TRANSFORM_vectorTexture)!=0),vectorTextureTransform);
float l9_54=l9_53.x;
float l9_55=l9_44;
sc_SoftwareWrapLate(l9_54,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).x,l9_38,l9_55);
float l9_56=l9_53.y;
float l9_57=l9_55;
sc_SoftwareWrapLate(l9_56,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).y,l9_38,l9_57);
float l9_58=l9_57;
vec3 l9_59=sc_SamplingCoordsViewToGlobal(vec2(l9_54,l9_56),vectorTextureLayout,vectorTextureGetStereoViewIndex());
vec4 l9_60=texture(vectorTextureArrSC,l9_59,0.0);
vec4 l9_61;
#if (SC_USE_CLAMP_TO_BORDER_vectorTexture)
{
l9_61=mix(vectorTextureBorderColor,l9_60,vec4(l9_58));
}
#else
{
l9_61=l9_60;
}
#endif
l9_37=l9_61;
}
#else
{
bool l9_62=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_vectorTexture)!=0));
float l9_63=varPackedTex.x;
sc_SoftwareWrapEarly(l9_63,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).x);
float l9_64=l9_63;
float l9_65=varPackedTex.y;
sc_SoftwareWrapEarly(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).y);
float l9_66=l9_65;
vec2 l9_67;
float l9_68;
#if (SC_USE_UV_MIN_MAX_vectorTexture)
{
bool l9_69;
#if (SC_USE_CLAMP_TO_BORDER_vectorTexture)
{
l9_69=ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).x==3;
}
#else
{
l9_69=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture)!=0);
}
#endif
float l9_70=l9_64;
float l9_71=1.0;
sc_ClampUV(l9_70,vectorTextureUvMinMax.x,vectorTextureUvMinMax.z,l9_69,l9_71);
float l9_72=l9_70;
float l9_73=l9_71;
bool l9_74;
#if (SC_USE_CLAMP_TO_BORDER_vectorTexture)
{
l9_74=ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).y==3;
}
#else
{
l9_74=(int(SC_USE_CLAMP_TO_BORDER_vectorTexture)!=0);
}
#endif
float l9_75=l9_66;
float l9_76=l9_73;
sc_ClampUV(l9_75,vectorTextureUvMinMax.y,vectorTextureUvMinMax.w,l9_74,l9_76);
l9_68=l9_76;
l9_67=vec2(l9_72,l9_75);
}
#else
{
l9_68=1.0;
l9_67=vec2(l9_64,l9_66);
}
#endif
vec2 l9_77=sc_TransformUV(l9_67,(int(SC_USE_UV_TRANSFORM_vectorTexture)!=0),vectorTextureTransform);
float l9_78=l9_77.x;
float l9_79=l9_68;
sc_SoftwareWrapLate(l9_78,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).x,l9_62,l9_79);
float l9_80=l9_77.y;
float l9_81=l9_79;
sc_SoftwareWrapLate(l9_80,ivec2(SC_SOFTWARE_WRAP_MODE_U_vectorTexture,SC_SOFTWARE_WRAP_MODE_V_vectorTexture).y,l9_62,l9_81);
float l9_82=l9_81;
vec3 l9_83=sc_SamplingCoordsViewToGlobal(vec2(l9_78,l9_80),vectorTextureLayout,vectorTextureGetStereoViewIndex());
vec4 l9_84=texture(vectorTexture,l9_83.xy,0.0);
vec4 l9_85;
#if (SC_USE_CLAMP_TO_BORDER_vectorTexture)
{
l9_85=mix(vectorTextureBorderColor,l9_84,vec4(l9_82));
}
#else
{
l9_85=l9_84;
}
#endif
l9_37=l9_85;
}
#endif
float l9_86=sc_Time.x*flowSpeed;
float l9_87=fract(l9_86+0.5);
vec2 l9_88=((l9_37-vec4(0.5))*2.0).xy;
l9_36=mix(N76_mainTexture_sample(varPackedTex.xy+((l9_88*l9_87)*flowStrength)),N76_mainTexture_sample(varPackedTex.xy+((l9_88*fract(l9_86+1.0))*flowStrength)),vec4(abs((0.5-l9_87)/0.5)));
}
#endif
float l9_89;
#if (VECTORFIELD)
{
l9_89=1.001;
}
#else
{
l9_89=0.001;
}
#endif
float l9_90=l9_89-0.001;
float l9_91;
#if (COLORMINMAX)
{
l9_91=1.001;
}
#else
{
l9_91=0.001;
}
#endif
float l9_92=l9_91-0.001;
float l9_93;
#if (COLORMONOMIN)
{
l9_93=1.001;
}
#else
{
l9_93=0.001;
}
#endif
float l9_94=l9_93-0.001;
float l9_95;
#if (ALPHAMINMAX)
{
l9_95=1.001;
}
#else
{
l9_95=0.001;
}
#endif
float l9_96=l9_95-0.001;
vec3 l9_97;
vec3 l9_98;
if (l9_92!=0.0)
{
float l9_99=fract((l9_17*82.124229)+l9_16);
vec3 l9_100=vec3(l9_16);
vec3 l9_101;
if (l9_94!=0.0)
{
l9_101=fract((vec3(l9_99)*27.21883)+l9_100);
}
else
{
l9_101=fract((vec3(l9_99,fract((l9_17*9115.2148)+l9_16),fract((l9_17*654.15588)+l9_16))*27.21883)+l9_100);
}
l9_98=mix(colorMinEnd,colorMaxEnd,l9_101);
l9_97=mix(colorMinStart,colorMaxStart,l9_101);
}
else
{
l9_98=colorEnd;
l9_97=colorStart;
}
float l9_102;
float l9_103;
if (l9_96!=0.0)
{
float l9_104=fract((l9_17*3.3331299)+l9_16);
l9_103=mix(alphaMinEnd,alphaMaxEnd,l9_104);
l9_102=mix(alphaMinStart,alphaMaxStart,l9_104);
}
else
{
l9_103=alphaEnd;
l9_102=alphaStart;
}
vec3 l9_105=mix(l9_97,l9_98,vec3(l9_23));
float l9_106=mix(l9_102,l9_103,l9_23);
float l9_107;
#if (COLORRAMP)
{
l9_107=1.001;
}
#else
{
l9_107=0.001;
}
#endif
float l9_108=l9_107-0.001;
float l9_109;
#if (NORANDOFFSET)
{
l9_109=1.001;
}
#else
{
l9_109=0.001;
}
#endif
float l9_110=ceil(l9_23*colorRampTextureSize.x)/colorRampTextureSize.x;
float l9_111;
if ((l9_109-0.001)!=0.0)
{
l9_111=l9_110+(varPackedTex.x/colorRampTextureSize.x);
}
else
{
l9_111=l9_110;
}
vec4 l9_112;
#if (colorRampTextureLayout==2)
{
bool l9_113=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_colorRampTexture)!=0));
float l9_114=l9_111;
sc_SoftwareWrapEarly(l9_114,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).x);
float l9_115=l9_114;
float l9_116=0.5;
sc_SoftwareWrapEarly(l9_116,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).y);
float l9_117=l9_116;
vec2 l9_118;
float l9_119;
#if (SC_USE_UV_MIN_MAX_colorRampTexture)
{
bool l9_120;
#if (SC_USE_CLAMP_TO_BORDER_colorRampTexture)
{
l9_120=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).x==3;
}
#else
{
l9_120=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture)!=0);
}
#endif
float l9_121=l9_115;
float l9_122=1.0;
sc_ClampUV(l9_121,colorRampTextureUvMinMax.x,colorRampTextureUvMinMax.z,l9_120,l9_122);
float l9_123=l9_121;
float l9_124=l9_122;
bool l9_125;
#if (SC_USE_CLAMP_TO_BORDER_colorRampTexture)
{
l9_125=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).y==3;
}
#else
{
l9_125=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture)!=0);
}
#endif
float l9_126=l9_117;
float l9_127=l9_124;
sc_ClampUV(l9_126,colorRampTextureUvMinMax.y,colorRampTextureUvMinMax.w,l9_125,l9_127);
l9_119=l9_127;
l9_118=vec2(l9_123,l9_126);
}
#else
{
l9_119=1.0;
l9_118=vec2(l9_115,l9_117);
}
#endif
vec2 l9_128=sc_TransformUV(l9_118,(int(SC_USE_UV_TRANSFORM_colorRampTexture)!=0),colorRampTextureTransform);
float l9_129=l9_128.x;
float l9_130=l9_119;
sc_SoftwareWrapLate(l9_129,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).x,l9_113,l9_130);
float l9_131=l9_128.y;
float l9_132=l9_130;
sc_SoftwareWrapLate(l9_131,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).y,l9_113,l9_132);
float l9_133=l9_132;
vec3 l9_134=sc_SamplingCoordsViewToGlobal(vec2(l9_129,l9_131),colorRampTextureLayout,colorRampTextureGetStereoViewIndex());
vec4 l9_135=texture(colorRampTextureArrSC,l9_134,0.0);
vec4 l9_136;
#if (SC_USE_CLAMP_TO_BORDER_colorRampTexture)
{
l9_136=mix(colorRampTextureBorderColor,l9_135,vec4(l9_133));
}
#else
{
l9_136=l9_135;
}
#endif
l9_112=l9_136;
}
#else
{
bool l9_137=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_colorRampTexture)!=0));
float l9_138=l9_111;
sc_SoftwareWrapEarly(l9_138,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).x);
float l9_139=l9_138;
float l9_140=0.5;
sc_SoftwareWrapEarly(l9_140,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).y);
float l9_141=l9_140;
vec2 l9_142;
float l9_143;
#if (SC_USE_UV_MIN_MAX_colorRampTexture)
{
bool l9_144;
#if (SC_USE_CLAMP_TO_BORDER_colorRampTexture)
{
l9_144=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).x==3;
}
#else
{
l9_144=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture)!=0);
}
#endif
float l9_145=l9_139;
float l9_146=1.0;
sc_ClampUV(l9_145,colorRampTextureUvMinMax.x,colorRampTextureUvMinMax.z,l9_144,l9_146);
float l9_147=l9_145;
float l9_148=l9_146;
bool l9_149;
#if (SC_USE_CLAMP_TO_BORDER_colorRampTexture)
{
l9_149=ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).y==3;
}
#else
{
l9_149=(int(SC_USE_CLAMP_TO_BORDER_colorRampTexture)!=0);
}
#endif
float l9_150=l9_141;
float l9_151=l9_148;
sc_ClampUV(l9_150,colorRampTextureUvMinMax.y,colorRampTextureUvMinMax.w,l9_149,l9_151);
l9_143=l9_151;
l9_142=vec2(l9_147,l9_150);
}
#else
{
l9_143=1.0;
l9_142=vec2(l9_139,l9_141);
}
#endif
vec2 l9_152=sc_TransformUV(l9_142,(int(SC_USE_UV_TRANSFORM_colorRampTexture)!=0),colorRampTextureTransform);
float l9_153=l9_152.x;
float l9_154=l9_143;
sc_SoftwareWrapLate(l9_153,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).x,l9_137,l9_154);
float l9_155=l9_152.y;
float l9_156=l9_154;
sc_SoftwareWrapLate(l9_155,ivec2(SC_SOFTWARE_WRAP_MODE_U_colorRampTexture,SC_SOFTWARE_WRAP_MODE_V_colorRampTexture).y,l9_137,l9_156);
float l9_157=l9_156;
vec3 l9_158=sc_SamplingCoordsViewToGlobal(vec2(l9_153,l9_155),colorRampTextureLayout,colorRampTextureGetStereoViewIndex());
vec4 l9_159=texture(colorRampTexture,l9_158.xy,0.0);
vec4 l9_160;
#if (SC_USE_CLAMP_TO_BORDER_colorRampTexture)
{
l9_160=mix(colorRampTextureBorderColor,l9_159,vec4(l9_157));
}
#else
{
l9_160=l9_159;
}
#endif
l9_112=l9_160;
}
#endif
vec4 l9_161=l9_112*colorRampMult;
float l9_162;
#if (ALPHADISSOLVE)
{
l9_162=1.001;
}
#else
{
l9_162=0.001;
}
#endif
float l9_163=l9_162-0.001;
float l9_164;
#if (BLACKASALPHA)
{
l9_164=1.001;
}
#else
{
l9_164=0.001;
}
#endif
float l9_165=l9_164-0.001;
float l9_166;
#if (PREMULTIPLIEDCOLOR)
{
l9_166=1.001;
}
#else
{
l9_166=0.001;
}
#endif
float l9_167=l9_166-0.001;
vec4 l9_168;
if (l9_1!=0.0)
{
vec4 l9_169;
#if (mainTextureLayout==2)
{
bool l9_170=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_mainTexture)!=0));
float l9_171=varPackedTex.x;
sc_SoftwareWrapEarly(l9_171,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x);
float l9_172=l9_171;
float l9_173=varPackedTex.y;
sc_SoftwareWrapEarly(l9_173,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y);
float l9_174=l9_173;
vec2 l9_175;
float l9_176;
#if (SC_USE_UV_MIN_MAX_mainTexture)
{
bool l9_177;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_177=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x==3;
}
#else
{
l9_177=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_178=l9_172;
float l9_179=1.0;
sc_ClampUV(l9_178,mainTextureUvMinMax.x,mainTextureUvMinMax.z,l9_177,l9_179);
float l9_180=l9_178;
float l9_181=l9_179;
bool l9_182;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_182=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y==3;
}
#else
{
l9_182=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_183=l9_174;
float l9_184=l9_181;
sc_ClampUV(l9_183,mainTextureUvMinMax.y,mainTextureUvMinMax.w,l9_182,l9_184);
l9_176=l9_184;
l9_175=vec2(l9_180,l9_183);
}
#else
{
l9_176=1.0;
l9_175=vec2(l9_172,l9_174);
}
#endif
vec2 l9_185=sc_TransformUV(l9_175,(int(SC_USE_UV_TRANSFORM_mainTexture)!=0),mainTextureTransform);
float l9_186=l9_185.x;
float l9_187=l9_176;
sc_SoftwareWrapLate(l9_186,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x,l9_170,l9_187);
float l9_188=l9_185.y;
float l9_189=l9_187;
sc_SoftwareWrapLate(l9_188,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y,l9_170,l9_189);
float l9_190=l9_189;
vec3 l9_191=sc_SamplingCoordsViewToGlobal(vec2(l9_186,l9_188),mainTextureLayout,mainTextureGetStereoViewIndex());
vec4 l9_192=texture(mainTextureArrSC,l9_191,0.0);
vec4 l9_193;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_193=mix(mainTextureBorderColor,l9_192,vec4(l9_190));
}
#else
{
l9_193=l9_192;
}
#endif
l9_169=l9_193;
}
#else
{
bool l9_194=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_mainTexture)!=0));
float l9_195=varPackedTex.x;
sc_SoftwareWrapEarly(l9_195,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x);
float l9_196=l9_195;
float l9_197=varPackedTex.y;
sc_SoftwareWrapEarly(l9_197,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y);
float l9_198=l9_197;
vec2 l9_199;
float l9_200;
#if (SC_USE_UV_MIN_MAX_mainTexture)
{
bool l9_201;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_201=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x==3;
}
#else
{
l9_201=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_202=l9_196;
float l9_203=1.0;
sc_ClampUV(l9_202,mainTextureUvMinMax.x,mainTextureUvMinMax.z,l9_201,l9_203);
float l9_204=l9_202;
float l9_205=l9_203;
bool l9_206;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_206=ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y==3;
}
#else
{
l9_206=(int(SC_USE_CLAMP_TO_BORDER_mainTexture)!=0);
}
#endif
float l9_207=l9_198;
float l9_208=l9_205;
sc_ClampUV(l9_207,mainTextureUvMinMax.y,mainTextureUvMinMax.w,l9_206,l9_208);
l9_200=l9_208;
l9_199=vec2(l9_204,l9_207);
}
#else
{
l9_200=1.0;
l9_199=vec2(l9_196,l9_198);
}
#endif
vec2 l9_209=sc_TransformUV(l9_199,(int(SC_USE_UV_TRANSFORM_mainTexture)!=0),mainTextureTransform);
float l9_210=l9_209.x;
float l9_211=l9_200;
sc_SoftwareWrapLate(l9_210,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).x,l9_194,l9_211);
float l9_212=l9_209.y;
float l9_213=l9_211;
sc_SoftwareWrapLate(l9_212,ivec2(SC_SOFTWARE_WRAP_MODE_U_mainTexture,SC_SOFTWARE_WRAP_MODE_V_mainTexture).y,l9_194,l9_213);
float l9_214=l9_213;
vec3 l9_215=sc_SamplingCoordsViewToGlobal(vec2(l9_210,l9_212),mainTextureLayout,mainTextureGetStereoViewIndex());
vec4 l9_216=texture(mainTexture,l9_215.xy,0.0);
vec4 l9_217;
#if (SC_USE_CLAMP_TO_BORDER_mainTexture)
{
l9_217=mix(mainTextureBorderColor,l9_216,vec4(l9_214));
}
#else
{
l9_217=l9_216;
}
#endif
l9_169=l9_217;
}
#endif
vec4 l9_218;
if (l9_3!=0.0)
{
vec4 l9_219;
if (l9_90!=0.0)
{
l9_219=l9_36;
}
else
{
l9_219=l9_35;
}
l9_218=l9_219;
}
else
{
l9_218=l9_169;
}
l9_168=l9_218;
}
else
{
l9_168=vec4(1.0);
}
vec4 l9_220;
if (l9_108!=0.0)
{
vec4 l9_221;
#if (!(!((SC_DEVICE_CLASS>=2)&&SC_GL_FRAGMENT_PRECISION_HIGH)))
{
l9_221=l9_161;
}
#else
{
l9_221=vec4(1.0);
}
#endif
l9_220=l9_221;
}
else
{
l9_220=vec4(1.0);
}
vec4 l9_222=l9_168*vec4(l9_105,l9_106);
vec4 l9_223=l9_222*l9_220;
vec4 l9_224;
if (l9_163!=0.0)
{
vec4 l9_225=l9_223;
l9_225.w=clamp(l9_223.w-(l9_23*alphaDissolveMult),0.0,1.0);
l9_224=l9_225;
}
else
{
l9_224=l9_223;
}
vec4 l9_226;
if (l9_165!=0.0)
{
vec4 l9_227=l9_224;
l9_227.w=length(l9_224.xyz);
l9_226=l9_227;
}
else
{
l9_226=l9_224;
}
vec4 l9_228;
if (l9_167!=0.0)
{
vec3 l9_229=l9_226.xyz*l9_226.w;
l9_228=vec4(l9_229.x,l9_229.y,l9_229.z,l9_226.w);
}
else
{
l9_228=l9_226;
}
#if (sc_BlendMode_AlphaTest)
{
if (l9_228.w<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_228.w<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec4 l9_230;
#if (sc_ProjectiveShadowsCaster)
{
float l9_231;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_231=l9_228.w;
}
#else
{
float l9_232;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_232=clamp(l9_228.w*2.0,0.0,1.0);
}
#else
{
float l9_233;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_233=clamp(dot(l9_228.xyz,vec3(l9_228.w)),0.0,1.0);
}
#else
{
float l9_234;
#if (sc_BlendMode_AlphaTest)
{
l9_234=1.0;
}
#else
{
float l9_235;
#if (sc_BlendMode_Multiply)
{
l9_235=(1.0-dot(l9_228.xyz,vec3(0.33333001)))*l9_228.w;
}
#else
{
float l9_236;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_236=(1.0-clamp(dot(l9_228.xyz,vec3(1.0)),0.0,1.0))*l9_228.w;
}
#else
{
float l9_237;
#if (sc_BlendMode_ColoredGlass)
{
l9_237=clamp(dot(l9_228.xyz,vec3(1.0)),0.0,1.0)*l9_228.w;
}
#else
{
float l9_238;
#if (sc_BlendMode_Add)
{
l9_238=clamp(dot(l9_228.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_239;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_239=clamp(dot(l9_228.xyz,vec3(1.0)),0.0,1.0)*l9_228.w;
}
#else
{
float l9_240;
#if (sc_BlendMode_Screen)
{
l9_240=dot(l9_228.xyz,vec3(0.33333001))*l9_228.w;
}
#else
{
float l9_241;
#if (sc_BlendMode_Min)
{
l9_241=1.0-clamp(dot(l9_228.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_242;
#if (sc_BlendMode_Max)
{
l9_242=clamp(dot(l9_228.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_242=1.0;
}
#endif
l9_241=l9_242;
}
#endif
l9_240=l9_241;
}
#endif
l9_239=l9_240;
}
#endif
l9_238=l9_239;
}
#endif
l9_237=l9_238;
}
#endif
l9_236=l9_237;
}
#endif
l9_235=l9_236;
}
#endif
l9_234=l9_235;
}
#endif
l9_233=l9_234;
}
#endif
l9_232=l9_233;
}
#endif
l9_231=l9_232;
}
#endif
l9_230=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_228.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_231);
}
#else
{
vec4 l9_243;
#if (sc_RenderAlphaToColor)
{
l9_243=vec4(l9_228.w);
}
#else
{
vec4 l9_244;
#if (sc_BlendMode_Custom)
{
vec4 l9_245;
#if (sc_FramebufferFetch)
{
vec4 l9_246=sc_readFragData0_Platform();
vec4 l9_247;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_248=l9_246;
l9_248.x=l9_246.x+_sc_framebufferFetchMarker;
l9_247=l9_248;
}
#else
{
l9_247=l9_246;
}
#endif
l9_245=l9_247;
}
#else
{
vec2 l9_249=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
int l9_250;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_250=1-sc_GetStereoViewIndex();
}
#else
{
l9_250=sc_GetStereoViewIndex();
}
#endif
vec4 l9_251;
#if (sc_ScreenTextureLayout==2)
{
l9_251=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_249,sc_ScreenTextureLayout,l9_250),0.0);
}
#else
{
l9_251=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_249,sc_ScreenTextureLayout,l9_250).xy,0.0);
}
#endif
l9_245=l9_251;
}
#endif
vec4 l9_252;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_253=l9_245;
l9_253.x=l9_245.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_252=l9_253;
}
#else
{
l9_252=l9_245;
}
#endif
vec3 l9_254=mix(l9_252.xyz,definedBlend(l9_252.xyz,l9_228.xyz).xyz,vec3(l9_228.w));
vec4 l9_255=vec4(l9_254.x,l9_254.y,l9_254.z,vec4(0.0).w);
l9_255.w=1.0;
l9_244=l9_255;
}
#else
{
vec4 l9_256;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_256=vec4(mix(vec3(1.0),l9_228.xyz,vec3(l9_228.w)),l9_228.w);
}
#else
{
vec4 l9_257;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_258;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_258=clamp(l9_228.w,0.0,1.0);
}
#else
{
l9_258=l9_228.w;
}
#endif
l9_257=vec4(l9_228.xyz*l9_258,l9_258);
}
#else
{
l9_257=l9_228;
}
#endif
l9_256=l9_257;
}
#endif
l9_244=l9_256;
}
#endif
l9_243=l9_244;
}
#endif
l9_230=l9_243;
}
#endif
vec4 l9_259;
if (PreviewEnabled==1)
{
vec4 l9_260;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_260=PreviewVertexColor;
}
else
{
l9_260=vec4(0.0);
}
l9_259=l9_260;
}
else
{
l9_259=l9_230;
}
vec4 l9_261;
#if (sc_ShaderComplexityAnalyzer)
{
l9_261=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_261=vec4(0.0);
}
#endif
vec4 l9_262;
if (l9_261.w>0.0)
{
l9_262=l9_261;
}
else
{
l9_262=l9_259;
}
vec4 l9_263=outputMotionVectorsIfNeeded(varPos,max(l9_262,vec4(0.0)));
vec4 l9_264=clamp(l9_263,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_265=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_265-0.0039215689)),min(1.0,l9_265+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_266=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_266).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_267=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_266).xy);
float l9_268=packValue(l9_267);
int l9_275=int(l9_264.w*255.0);
float l9_276=packValue(l9_275);
sc_writeFragData0Internal(vec4(packValue(l9_267),packValue(l9_267),packValue(l9_267),packValue(l9_267)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_268,packValue(l9_267),packValue(l9_267),packValue(l9_267)));
sc_writeFragData2(vec4(l9_276,packValue(l9_275),packValue(l9_275),packValue(l9_275)));
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
vec2 l9_279=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_279).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_280[8];
int l9_281[8];
int l9_282=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_282<8)
{
l9_280[l9_282]=0;
l9_281[l9_282]=0;
l9_282++;
continue;
}
else
{
break;
}
}
int l9_283;
#if (sc_OITMaxLayers8)
{
l9_283=2;
}
#else
{
l9_283=1;
}
#endif
int l9_284=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_284<l9_283)
{
vec4 l9_285;
vec4 l9_286;
vec4 l9_287;
if (l9_284==0)
{
l9_287=texture(sc_OITAlpha0,l9_279);
l9_286=texture(sc_OITDepthLow0,l9_279);
l9_285=texture(sc_OITDepthHigh0,l9_279);
}
else
{
l9_287=vec4(0.0);
l9_286=vec4(0.0);
l9_285=vec4(0.0);
}
vec4 l9_288;
vec4 l9_289;
vec4 l9_290;
if (l9_284==1)
{
l9_290=texture(sc_OITAlpha1,l9_279);
l9_289=texture(sc_OITDepthLow1,l9_279);
l9_288=texture(sc_OITDepthHigh1,l9_279);
}
else
{
l9_290=l9_287;
l9_289=l9_286;
l9_288=l9_285;
}
if (any(notEqual(l9_288,vec4(0.0)))||any(notEqual(l9_289,vec4(0.0))))
{
int l9_291[8]=l9_280;
unpackValues(l9_288.w,l9_284,l9_291);
unpackValues(l9_288.z,l9_284,l9_291);
unpackValues(l9_288.y,l9_284,l9_291);
unpackValues(l9_288.x,l9_284,l9_291);
unpackValues(l9_289.w,l9_284,l9_291);
unpackValues(l9_289.z,l9_284,l9_291);
unpackValues(l9_289.y,l9_284,l9_291);
unpackValues(l9_289.x,l9_284,l9_291);
int l9_300[8]=l9_281;
unpackValues(l9_290.w,l9_284,l9_300);
unpackValues(l9_290.z,l9_284,l9_300);
unpackValues(l9_290.y,l9_284,l9_300);
unpackValues(l9_290.x,l9_284,l9_300);
}
l9_284++;
continue;
}
else
{
break;
}
}
vec4 l9_305=texture(sc_OITFilteredDepthBoundsTexture,l9_279);
vec2 l9_306=l9_305.xy;
int l9_307;
#if (sc_SkinBonesCount>0)
{
l9_307=encodeDepth(((1.0-l9_305.x)*1000.0)+getDepthOrderingEpsilon(),l9_306);
}
#else
{
l9_307=0;
}
#endif
int l9_308=encodeDepth(viewSpaceDepth(),l9_306);
vec4 l9_309;
l9_309=l9_264*l9_264.w;
vec4 l9_310;
int l9_311=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_311<8)
{
int l9_312=l9_280[l9_311];
int l9_313=l9_308-l9_307;
bool l9_314=l9_312<l9_313;
bool l9_315;
if (l9_314)
{
l9_315=l9_280[l9_311]>0;
}
else
{
l9_315=l9_314;
}
if (l9_315)
{
vec3 l9_316=l9_309.xyz*(1.0-(float(l9_281[l9_311])/255.0));
l9_310=vec4(l9_316.x,l9_316.y,l9_316.z,l9_309.w);
}
else
{
l9_310=l9_309;
}
l9_309=l9_310;
l9_311++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_309,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
if (abs(gl_FragCoord.z-texture(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_264,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_263,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
