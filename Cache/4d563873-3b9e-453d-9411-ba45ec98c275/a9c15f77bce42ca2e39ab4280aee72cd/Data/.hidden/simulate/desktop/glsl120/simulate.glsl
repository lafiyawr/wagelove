//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(100)
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
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler renderTarget0SmpSC 2:20
//sampler sampler renderTarget1SmpSC 2:21
//sampler sampler renderTarget2SmpSC 2:22
//sampler sampler renderTarget3SmpSC 2:23
//texture texture2D renderTarget0 2:1:2:20
//texture texture2D renderTarget1 2:2:2:21
//texture texture2D renderTarget2 2:3:2:22
//texture texture2D renderTarget3 2:4:2:23
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
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
    #define texture2DLodEXT texture2DLod
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
float Dead;
float Counter_N3;
float Tap_N2;
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
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
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
#ifndef STD_DISABLE_VERTEX_TEXTURE0
#define STD_DISABLE_VERTEX_TEXTURE0 0
#elif STD_DISABLE_VERTEX_TEXTURE0==1
#undef STD_DISABLE_VERTEX_TEXTURE0
#define STD_DISABLE_VERTEX_TEXTURE0 1
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
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
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
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
uniform vec4 sc_EnvmapDiffuseDims;
uniform vec4 sc_EnvmapSpecularDims;
uniform vec4 sc_ScreenTextureDims;
uniform vec4 sc_SSAOTextureDims;
uniform bool receivesRayTracedReflections;
uniform bool isProxyMode;
uniform bool receivesRayTracedShadows;
uniform bool receivesRayTracedDiffuseIndirect;
uniform bool receivesRayTracedAo;
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_BoneMatrices[((sc_SkinBonesCount*3)+1)];
uniform mat3 sc_SkinBonesNormalMatrices[(sc_SkinBonesCount+1)];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform float sc_DisableFrustumCullingMarker;
uniform mat3 sc_NormalMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform vec4 intensityTextureDims;
uniform vec4 renderTarget0Dims;
uniform vec4 renderTarget1Dims;
uniform vec4 renderTarget2Dims;
uniform vec4 renderTarget3Dims;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform vec4 sc_Time;
uniform int vfxOffsetInstances;
uniform int ssTARGET_WIDTH_INT;
uniform vec2 ssTARGET_SIZE_FLOAT;
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
uniform float Port_Input1_N324;
uniform vec3 Port_Import_N052;
uniform vec2 Port_Import_N375;
uniform float Port_Import_N166;
uniform float Port_Input1_N056;
uniform float Port_Value1_N057;
uniform vec2 Port_Max_N058;
uniform float Port_Import_N062;
uniform float Port_Import_N063;
uniform float Port_Value3_N309;
uniform float Port_Input1_N323;
uniform vec3 Port_Import_N050;
uniform float Port_Import_N132;
uniform float Port_Import_N133;
uniform vec3 Port_Import_N029;
uniform float Port_Import_N031;
uniform float Port_Value_N002;
uniform float Port_Value_N003;
uniform mat4 vfxModelMatrix;
uniform mat4 vfxViewProjectionMatrix;
uniform vec2 sUV;
uniform vec2 Tweak_N18;
uniform int Tweak_N114;
uniform vec2 Tweak_N34;
uniform float Port_Min_N096;
uniform float Port_Max_N096;
uniform float _sc_allow16TexturesMarker;
uniform float overrideTimeDelta;
uniform float Port_RangeMinA_N022;
uniform float Port_RangeMaxA_N022;
uniform float Port_RangeMinB_N022;
uniform float Port_RangeMaxB_N022;
uniform float vfxCameraAspect;
uniform vec3 vfxCameraUp;
uniform float Port_Input1_N080;
uniform float Port_RangeMinA_N084;
uniform float Port_RangeMaxA_N084;
uniform float Port_RangeMinB_N084;
uniform float Port_RangeMaxB_N084;
uniform float Port_Multiplier_N107;
uniform sc_PointLight_t sc_PointLights[(sc_PointLightsCount+1)];
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform sc_AmbientLight_t sc_AmbientLights[(sc_AmbientLightsCount+1)];
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec4 sc_EnvmapDiffuseSize;
uniform vec4 sc_EnvmapDiffuseView;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapSpecularView;
uniform vec3 sc_EnvmapRotation;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform vec4 sc_UniformConstants;
uniform vec4 sc_GeometryInfo;
uniform mat4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelMatrixInverse;
uniform mat3 sc_NormalMatrixInverse;
uniform vec3 sc_LocalAabbMin;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_WorldAabbMin;
uniform vec3 sc_WorldAabbMax;
uniform vec4 sc_WindowToViewportTransform;
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float shaderComplexityValue;
uniform vec4 weights2;
uniform int sc_FallbackInstanceID;
uniform float _sc_framebufferFetchMarker;
uniform float strandWidth;
uniform float strandTaper;
uniform vec4 sc_StrandDataMapTextureSize;
uniform float clumpInstanceCount;
uniform float clumpRadius;
uniform float clumpTipScale;
uniform float hairstyleInstanceCount;
uniform float hairstyleNoise;
uniform vec4 sc_ScreenTextureSize;
uniform vec4 sc_ScreenTextureView;
uniform vec4 sc_SSAOTextureSize;
uniform vec4 sc_SSAOTextureView;
uniform mat3 sc_SSAOTextureTransform;
uniform vec4 sc_SSAOTextureUvMinMax;
uniform vec4 sc_SSAOTextureBorderColor;
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
uniform float vfxCameraNear;
uniform float vfxCameraFar;
uniform vec3 vfxCameraForward;
uniform vec3 vfxCameraRight;
uniform mat4 vfxModelMatrixInverse;
uniform mat4 vfxModelViewMatrix;
uniform mat4 vfxModelViewMatrixInverse;
uniform mat4 vfxProjectionMatrix;
uniform mat4 vfxProjectionMatrixInverse;
uniform mat4 vfxModelViewProjectionMatrix;
uniform mat4 vfxModelViewProjectionMatrixInverse;
uniform mat4 vfxViewMatrix;
uniform mat4 vfxViewMatrixInverse;
uniform mat4 vfxViewProjectionMatrixInverse;
uniform int vfxFrame;
uniform vec2 ssTARGET_SIZE_INT;
uniform float ssTARGET_WIDTH;
uniform float Port_DefaultFloat_N002;
uniform float Port_DefaultFloat_N003;
uniform vec2 Port_Import_N044;
uniform float Port_Import_N074;
uniform float Port_DefaultFloat_N004;
uniform float Port_DefaultFloat_N005;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
varying float varClipDistance;
varying float varStereoViewID;
attribute vec4 boneData;
attribute vec3 blendShape0Pos;
attribute vec3 blendShape0Normal;
attribute vec3 blendShape1Pos;
attribute vec3 blendShape1Normal;
attribute vec3 blendShape2Pos;
attribute vec3 blendShape2Normal;
attribute vec3 blendShape3Pos;
attribute vec3 blendShape4Pos;
attribute vec3 blendShape5Pos;
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
varying vec2 varShadowTex;
varying float varViewSpaceDepth;
flat varying int Interp_Particle_Index;
varying vec2 Interp_Particle_Coord;
varying vec3 Interp_Particle_Force;
varying float Interp_Particle_Size;
varying float Interp_Particle_Counter_N3;
varying float Interp_Particle_Tap_N2;
varying float Interp_Particle_Mass;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying vec4 Interp_Particle_Color;
varying float Interp_Particle_Dead;
attribute vec3 positionNext;
attribute vec3 positionPrevious;
attribute vec4 strandProperties;
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
void ssCalculateParticleSeed(inout ssParticle Particle)
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
Particle.Seed=(Particle.Ratio1D*0.976379)+0.151235;
Particle.Seed+=(floor(((l9_0-Particle.SpawnOffset)+20.0)*0.1)*4.32723);
Particle.Seed=fract(abs(Particle.Seed));
Particle.Seed2000=(vec2(ivec2(Particle.Index1D%400,Particle.Index1D/400))+vec2(1.0))*vec2(0.00250627);
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
float l9_1=step(abs(value-l9_0),1e-05);
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
vec4 sc_InternalTextureLevel(vec2 texSize,vec2 uv,float level_,sampler2D texsmp)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=texture2DLod(texsmp,uv,level_);
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
vec4 sc_SampleViewLevel(vec2 texSize,vec2 uv,int renderingLayout,int viewIndex,float level,sampler2D texsmp)
{
return sc_InternalTextureLevel(texSize,sc_SamplingCoordsViewToGlobal(uv,renderingLayout,viewIndex).xy,level,texsmp);
}
vec4 sc_SampleTextureLevel(vec2 samplerDims,int renderingLayout,int viewIndex,vec2 uv,bool useUvTransform,mat3 uvTransform,ivec2 softwareWrapModes,bool useUvMinMax,vec4 uvMinMax,bool useClampToBorder,vec4 borderColor,float level,sampler2D texture_sampler_)
{
bool l9_0=useClampToBorder;
bool l9_1=useUvMinMax;
bool l9_2=l9_0&&(!l9_1);
sc_SoftwareWrapEarly(uv.x,softwareWrapModes.x);
sc_SoftwareWrapEarly(uv.y,softwareWrapModes.y);
float l9_3;
if (useUvMinMax)
{
bool l9_4=useClampToBorder;
bool l9_5;
if (l9_4)
{
l9_5=softwareWrapModes.x==3;
}
else
{
l9_5=l9_4;
}
float param_8=1.0;
sc_ClampUV(uv.x,uvMinMax.x,uvMinMax.z,l9_5,param_8);
float l9_6=param_8;
bool l9_7=useClampToBorder;
bool l9_8;
if (l9_7)
{
l9_8=softwareWrapModes.y==3;
}
else
{
l9_8=l9_7;
}
float param_13=l9_6;
sc_ClampUV(uv.y,uvMinMax.y,uvMinMax.w,l9_8,param_13);
l9_3=param_13;
}
else
{
l9_3=1.0;
}
uv=sc_TransformUV(uv,useUvTransform,uvTransform);
float param_20=l9_3;
sc_SoftwareWrapLate(uv.x,softwareWrapModes.x,l9_2,param_20);
sc_SoftwareWrapLate(uv.y,softwareWrapModes.y,l9_2,param_20);
float l9_9=param_20;
vec4 l9_10=sc_SampleViewLevel(samplerDims,uv,renderingLayout,viewIndex,level,texture_sampler_);
vec4 l9_11;
if (useClampToBorder)
{
l9_11=mix(borderColor,l9_10,vec4(l9_9));
}
else
{
l9_11=l9_10;
}
return l9_11;
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
float DecodeFloat32(vec4 rgba,bool Quantize)
{
if (Quantize)
{
rgba=floor((rgba*255.0)+vec4(0.5))*vec4(0.00392157);
}
return dot(rgba,vec4(1.0,0.00392157,1.53787e-05,6.03086e-08));
}
float DecodeFloat16(vec2 rg,bool Quantize)
{
if (Quantize)
{
rg=floor((rg*255.0)+vec2(0.5))*vec2(0.00392157);
}
return dot(rg,vec2(1.0,0.00392157));
}
float DecodeFloat8(float r,bool Quantize)
{
if (Quantize)
{
r=floor((r*255.0)+0.5)*0.00392157;
}
return r;
}
void ssDecodeParticle(int InstanceID)
{
gParticle.Position=vec3(0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(0.0);
gParticle.Size=0.0;
gParticle.Age=0.0;
gParticle.Life=0.0;
gParticle.Mass=1.0;
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
ivec2 l9_0=ivec2(InstanceID%200,InstanceID/200);
float l9_1=float(InstanceID);
vec2 l9_2=vec2(l9_0);
ssParticle l9_3=ssParticle(gParticle.Position,gParticle.Velocity,gParticle.Color,gParticle.Size,gParticle.Age,gParticle.Life,gParticle.Mass,gParticle.Matrix,gParticle.Dead,gParticle.Counter_N3,gParticle.Tap_N2,l9_1*0.0502513,0.0,gParticle.Seed2000,float(((InstanceID*((InstanceID*1471343)+101146501))+1559861749)&2147483647)*4.65661e-10,InstanceID,(l9_1+0.5)*0.005,l9_1*0.00502513,l9_0,(l9_2+vec2(0.5))*vec2(0.005,1.0),l9_2*vec2(0.00502513,1.0),vec3(0.0),false);
ssCalculateParticleSeed(l9_3);
gParticle=l9_3;
int l9_4=(vfxOffsetInstances+InstanceID)*3;
int l9_5=l9_4/ssTARGET_WIDTH_INT;
vec2 l9_6=(vec2(ivec2(l9_4-(l9_5*ssTARGET_WIDTH_INT),l9_5))+vec2(0.5))/vec2(2048.0,ssTARGET_SIZE_FLOAT.y);
gParticle.Position.x=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_6,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*2000.02);
gParticle.Position.y=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_6,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*2000.02);
gParticle.Position.z=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_6,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*2000.02);
gParticle.Velocity.x=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_6,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*2000.02);
vec2 l9_7=l9_6+vec2(0.000488281,0.0);
gParticle.Velocity.y=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_7,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0),true)*2000.02);
gParticle.Velocity.z=(-1000.0)+(DecodeFloat32(sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_7,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1),true)*2000.02);
gParticle.Life=DecodeFloat32(sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_7,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2),true)*10.0001;
gParticle.Age=DecodeFloat32(sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),l9_7,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),true)*10.0001;
vec2 l9_8=l9_6+vec2(0.000976562,0.0);
vec4 l9_9=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
vec4 l9_10=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
vec4 l9_11=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),l9_8,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
gParticle.Size=DecodeFloat16(vec2(l9_9.xy),true)*100.001;
gParticle.Mass=DecodeFloat16(vec2(l9_9.zw),true)*100.001;
gParticle.Counter_N3=DecodeFloat8(l9_10.x,true)*25.0;
gParticle.Tap_N2=DecodeFloat8(l9_10.y,true);
gParticle.Color.x=DecodeFloat8(l9_10.z,true);
gParticle.Color.y=DecodeFloat8(l9_10.w,true);
gParticle.Color.z=DecodeFloat8(l9_11.x,true);
gParticle.Color.w=DecodeFloat8(l9_11.y,true);
gParticle.Dead=DecodeFloat8(l9_11.z,true)*255.0;
gParticle.Velocity=floor((gParticle.Velocity*2000.0)+vec3(0.5))*0.0005;
gParticle.Position=floor((gParticle.Position*2000.0)+vec3(0.5))*0.0005;
gParticle.Color=floor((gParticle.Color*2000.0)+vec4(0.5))*0.0005;
gParticle.Size=floor((gParticle.Size*2000.0)+0.5)*0.0005;
gParticle.Mass=floor((gParticle.Mass*2000.0)+0.5)*0.0005;
gParticle.Life=floor((gParticle.Life*2000.0)+0.5)*0.0005;
}
vec2 ssRandVec2(int seed)
{
return vec2(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.65661e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.65661e-10);
}
vec3 ssRandVec3(int seed)
{
return vec3(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.65661e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.65661e-10,float((((seed*7177)*((seed*1969894119)+101146501))+1559861749)&2147483647)*4.65661e-10);
}
vec4 ssRandVec4(int seed)
{
return vec4(float(((seed*((seed*1471343)+101146501))+1559861749)&2147483647)*4.65661e-10,float((((seed*1399)*((seed*2058408857)+101146501))+1559861749)&2147483647)*4.65661e-10,float((((seed*7177)*((seed*1969894119)+101146501))+1559861749)&2147483647)*4.65661e-10,float((((seed*18919)*((seed*2066534441)+101146501))+1559861749)&2147483647)*4.65661e-10);
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
l9_9.x=float(((l9_7*((l9_7*1471343)+101146501))+1559861749)&2147483647)*4.65661e-10;
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
void Node378_Particle_Random(float Min,float Max,out float Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(1,true,true,true,378.0,gParticle,0.0,Globals.gTimeElapsed).x);
}
void Node58_Particle_Random(vec2 Min,vec2 Max,out vec2 Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(2,true,true,true,58.0,gParticle,0.0,Globals.gTimeElapsed).xy);
}
void Node96_Particle_Random(float Min,float Max,out float Random,ssGlobals Globals)
{
Random=mix(Min,Max,ssGetParticleRandom(1,false,true,true,96.0,gParticle,0.0,Globals.gTimeElapsed).x);
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
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=float(sc_StereoViewID);
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
}
void main()
{
vec2 l9_0;
#if (!STD_DISABLE_VERTEX_TEXTURE0)
{
l9_0=texture0;
}
#else
{
l9_0=vec2(0.0);
}
#endif
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
gParticle.Age=mod(l9_8-gParticle.SpawnOffset,10.0);
float l9_9=gParticle.SpawnOffset;
float l9_10=l9_4-l9_9;
bool l9_11=l9_10<0.0;
bool l9_12;
if (!l9_11)
{
l9_12=gParticle.Age>10.0;
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
l9_16=mod(l9_4-gParticle.SpawnOffset,10.0)<=l9_5;
}
else
{
l9_16=l9_15;
}
if (l9_16)
{
ssGlobals l9_17=ssGlobals(l9_4,l9_5,l9_8);
ssCalculateParticleSeed(gParticle);
gParticle.Position=(vec3((float(gParticle.Index1D-((gParticle.Index1D/14)*14))*0.142857)-1.0,(float(gParticle.Index1D/14)*0.142857)-1.0,0.0)*20.0)+vec3(1.0,1.0,0.0);
gParticle.Velocity=vec3(0.0);
gParticle.Color=vec4(1.0);
gParticle.Dead=0.0;
gParticle.Age=0.0;
gParticle.Life=10.0;
gParticle.Size=1.0;
gParticle.Mass=1.0;
gParticle.Matrix=mat3(vec3(1.0,0.0,0.0),vec3(0.0,1.0,0.0),vec3(0.0,0.0,1.0));
bool l9_19=float(1.0==Port_Input1_N324)!=0.0;
bool l9_20;
if (!l9_19)
{
l9_20=float(1.0==Port_Input1_N323)!=0.0;
}
else
{
l9_20=l9_19;
}
vec4 l9_21;
if (float(l9_20)!=0.0)
{
vec4 l9_22;
if (l9_19)
{
vec2 l9_23=radians(Port_Import_N375);
float l9_24;
Node378_Particle_Random(l9_23.x,l9_23.y,l9_24,l9_17);
float l9_25=l9_24;
float l9_26=1.0-clamp(Port_Import_N166,0.0,1.0);
float l9_27;
if (l9_26<=0.0)
{
l9_27=0.0;
}
else
{
l9_27=pow(l9_26,Port_Input1_N056);
}
vec2 l9_28=vec2(0.0);
l9_28.x=Port_Value1_N057;
vec2 l9_29=l9_28;
l9_29.y=l9_27;
vec2 l9_30;
Node58_Particle_Random(l9_29,Port_Max_N058,l9_30,l9_17);
vec2 l9_31=l9_30;
vec3 l9_32=vec3(0.0);
l9_32.x=sin(l9_25);
vec3 l9_33=l9_32;
l9_33.y=cos(l9_25);
vec3 l9_34=l9_33;
l9_34.z=l9_31.x;
vec3 l9_35=vec3(0.0);
l9_35.x=Port_Import_N062;
vec3 l9_36=l9_35;
l9_36.y=Port_Import_N062;
vec3 l9_37=l9_36;
l9_37.z=Port_Import_N063;
float l9_38;
if (l9_31.y<=0.0)
{
l9_38=0.0;
}
else
{
l9_38=sqrt(l9_31.y);
}
vec3 l9_39=vec3(0.0);
l9_39.x=l9_38;
vec3 l9_40=l9_39;
l9_40.y=l9_38;
vec3 l9_41=l9_40;
l9_41.z=Port_Value3_N309;
l9_22=vec4((((Port_Import_N052*l9_34)*l9_37)*l9_41).zxy,0.0);
}
else
{
vec2 l9_42=radians(Port_Import_N375);
float l9_43;
Node378_Particle_Random(l9_42.x,l9_42.y,l9_43,l9_17);
float l9_44=l9_43;
float l9_45=1.0-clamp(Port_Import_N166,0.0,1.0);
float l9_46;
if (l9_45<=0.0)
{
l9_46=0.0;
}
else
{
l9_46=pow(l9_45,Port_Input1_N056);
}
vec2 l9_47=vec2(0.0);
l9_47.x=Port_Value1_N057;
vec2 l9_48=l9_47;
l9_48.y=l9_46;
vec2 l9_49;
Node58_Particle_Random(l9_48,Port_Max_N058,l9_49,l9_17);
vec2 l9_50=l9_49;
vec3 l9_51=vec3(0.0);
l9_51.x=sin(l9_44);
vec3 l9_52=l9_51;
l9_52.y=cos(l9_44);
vec3 l9_53=l9_52;
l9_53.z=l9_50.x;
vec3 l9_54=vec3(0.0);
l9_54.x=Port_Import_N062;
vec3 l9_55=l9_54;
l9_55.y=Port_Import_N062;
vec3 l9_56=l9_55;
l9_56.z=Port_Import_N063;
float l9_57;
if (l9_50.y<=0.0)
{
l9_57=0.0;
}
else
{
l9_57=sqrt(l9_50.y);
}
vec3 l9_58=vec3(0.0);
l9_58.x=l9_57;
vec3 l9_59=l9_58;
l9_59.y=l9_57;
vec3 l9_60=l9_59;
l9_60.z=Port_Value3_N309;
l9_22=vec4((((Port_Import_N052*l9_53)*l9_56)*l9_60).xzy,0.0);
}
l9_21=l9_22;
}
else
{
vec2 l9_61=radians(Port_Import_N375);
float l9_62;
Node378_Particle_Random(l9_61.x,l9_61.y,l9_62,l9_17);
float l9_63=l9_62;
float l9_64=1.0-clamp(Port_Import_N166,0.0,1.0);
float l9_65;
if (l9_64<=0.0)
{
l9_65=0.0;
}
else
{
l9_65=pow(l9_64,Port_Input1_N056);
}
vec2 l9_66=vec2(0.0);
l9_66.x=Port_Value1_N057;
vec2 l9_67=l9_66;
l9_67.y=l9_65;
vec2 l9_68;
Node58_Particle_Random(l9_67,Port_Max_N058,l9_68,l9_17);
vec2 l9_69=l9_68;
vec3 l9_70=vec3(0.0);
l9_70.x=sin(l9_63);
vec3 l9_71=l9_70;
l9_71.y=cos(l9_63);
vec3 l9_72=l9_71;
l9_72.z=l9_69.x;
vec3 l9_73=vec3(0.0);
l9_73.x=Port_Import_N062;
vec3 l9_74=l9_73;
l9_74.y=Port_Import_N062;
vec3 l9_75=l9_74;
l9_75.z=Port_Import_N063;
float l9_76;
if (l9_69.y<=0.0)
{
l9_76=0.0;
}
else
{
l9_76=sqrt(l9_69.y);
}
vec3 l9_77=vec3(0.0);
l9_77.x=l9_76;
vec3 l9_78=l9_77;
l9_78.y=l9_76;
vec3 l9_79=l9_78;
l9_79.z=Port_Value3_N309;
l9_21=vec4(((Port_Import_N052*l9_72)*l9_75)*l9_79,0.0);
}
gParticle.Position=Port_Import_N050+l9_21.xyz;
gParticle.Mass=mix(Port_Import_N132,Port_Import_N133,ssGetParticleRandom(1,true,true,true,134.0,gParticle,0.0,l9_4).x);
gParticle.Mass=max(1e-05,gParticle.Mass);
float l9_80=dot(Port_Import_N029,Port_Import_N029);
float l9_81;
if (l9_80>0.0)
{
l9_81=1.0/sqrt(l9_80);
}
else
{
l9_81=0.0;
}
gParticle.Force+=((Port_Import_N029*l9_81)*vec3(Port_Import_N031));
gParticle.Tap_N2=Port_Value_N002;
gParticle.Counter_N3=Port_Value_N003;
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*0.03333);
gParticle.Force=vec3(0.0);
gParticle.Position=(vfxModelMatrix*vec4(gParticle.Position,1.0)).xyz;
mat3 l9_82=mat3(vfxModelMatrix[0].xyz,vfxModelMatrix[1].xyz,vfxModelMatrix[2].xyz);
gParticle.Velocity=l9_82*gParticle.Velocity;
gParticle.Force=l9_82*gParticle.Force;
gParticle.Matrix=l9_82*gParticle.Matrix;
gParticle.Spawned=true;
}
vec3 l9_83=gParticle.Position;
vec4 l9_84=vfxViewProjectionMatrix*vec4(l9_83,1.0);
vec3 l9_85=l9_84.xyz/vec3(l9_84.w);
vec4 l9_86=vec4(Port_RangeMinB_N022);
vec4 l9_87=(((vec4(l9_85.x,l9_85.y,l9_85.z,l9_84.w)-vec4(Port_RangeMinA_N022))/vec4(Port_RangeMaxA_N022-Port_RangeMinA_N022))*(Port_RangeMaxB_N022-Port_RangeMinB_N022))+l9_86;
vec4 l9_88;
if (Port_RangeMaxB_N022>Port_RangeMinB_N022)
{
l9_88=clamp(l9_87,l9_86,vec4(Port_RangeMaxB_N022));
}
else
{
l9_88=clamp(l9_87,vec4(Port_RangeMaxB_N022),l9_86);
}
vec2 l9_89=vec2(vfxCameraAspect,1.0);
vec2 l9_90=vec2(l9_88.xy)*l9_89;
vec3 l9_91=normalize(vfxCameraUp);
float l9_92=dot(l9_91,l9_91);
float l9_93;
if (l9_92>0.0)
{
l9_93=1.0/sqrt(l9_92);
}
else
{
l9_93=0.0;
}
vec3 l9_94=l9_91*l9_93;
ssGlobals l9_95=ssGlobals(l9_4,l9_5,l9_8);
float param_3;
Node96_Particle_Random(Port_Min_N096,Port_Max_N096,param_3,l9_95);
float l9_96=param_3;
vec4 l9_97=vfxViewProjectionMatrix*vec4(l9_83+(l9_94*vec3(mix(Tweak_N18.x,Tweak_N18.y,l9_96)*Port_Input1_N080)),1.0);
vec3 l9_98=l9_97.xyz/vec3(l9_97.w);
vec4 l9_99=vec4(Port_RangeMinB_N084);
vec4 l9_100=(((vec4(l9_98.x,l9_98.y,l9_98.z,l9_97.w)-vec4(Port_RangeMinA_N084))/vec4(Port_RangeMaxA_N084-Port_RangeMinA_N084))*(Port_RangeMaxB_N084-Port_RangeMinB_N084))+l9_99;
vec4 l9_101;
if (Port_RangeMaxB_N084>Port_RangeMinB_N084)
{
l9_101=clamp(l9_100,l9_99,vec4(Port_RangeMaxB_N084));
}
else
{
l9_101=clamp(l9_100,vec4(Port_RangeMaxB_N084),l9_99);
}
float l9_102=float(Tweak_N114);
gParticle.Tap_N2+=max(step(distance(l9_90,sUV*l9_89),distance(vec2(l9_101.xy)*l9_89,l9_90)),float(gParticle.Age>(gParticle.Life-((l9_5*Port_Multiplier_N107)*l9_102))));
gParticle.Counter_N3+=floor(gParticle.Tap_N2+0.5);
float l9_103;
if (floor(gParticle.Tap_N2+0.5)!=0.0)
{
float l9_104;
Node96_Particle_Random(Port_Min_N096,Port_Max_N096,l9_104,l9_95);
l9_103=mix(Tweak_N34.x,Tweak_N34.y,l9_104);
}
else
{
float l9_105;
Node96_Particle_Random(Port_Min_N096,Port_Max_N096,l9_105,l9_95);
l9_103=mix(Tweak_N18.x,Tweak_N18.y,l9_105);
}
gParticle.Size=l9_103;
if (float(floor(gParticle.Counter_N3+0.5)>(l9_102-1.0))!=0.0)
{
gParticle.Dead=128.0;
}
float l9_106=clamp(l9_5,0.0001,0.5);
float l9_107;
if (abs(gParticle.Force.x)<0.005)
{
l9_107=0.0;
}
else
{
l9_107=gParticle.Force.x;
}
gParticle.Force.x=l9_107;
float l9_108;
if (abs(gParticle.Force.y)<0.005)
{
l9_108=0.0;
}
else
{
l9_108=gParticle.Force.y;
}
gParticle.Force.y=l9_108;
float l9_109;
if (abs(gParticle.Force.z)<0.005)
{
l9_109=0.0;
}
else
{
l9_109=gParticle.Force.z;
}
gParticle.Force.z=l9_109;
gParticle.Mass=max(0.005,gParticle.Mass);
gParticle.Velocity+=((gParticle.Force/vec3(gParticle.Mass))*l9_106);
float l9_110;
if (abs(gParticle.Velocity.x)<0.005)
{
l9_110=0.0;
}
else
{
l9_110=gParticle.Velocity.x;
}
gParticle.Velocity.x=l9_110;
float l9_111;
if (abs(gParticle.Velocity.y)<0.005)
{
l9_111=0.0;
}
else
{
l9_111=gParticle.Velocity.y;
}
gParticle.Velocity.y=l9_111;
float l9_112;
if (abs(gParticle.Velocity.z)<0.005)
{
l9_112=0.0;
}
else
{
l9_112=gParticle.Velocity.z;
}
gParticle.Velocity.z=l9_112;
gParticle.Position+=(gParticle.Velocity*l9_106);
vec2 l9_113=vec2(3.0,1.0)/vec2(2048.0,ssTARGET_SIZE_FLOAT.y);
int l9_114=vfxOffsetInstances+sc_GetLocalInstanceID();
vec2 l9_115=vec2(0.0);
l9_115.x=float(l9_114%682);
vec2 l9_116=l9_115;
l9_116.y=float(l9_114/682);
float l9_117;
if (l9_1.x<0.5)
{
l9_117=0.0;
}
else
{
l9_117=l9_113.x;
}
vec2 l9_118=vec2(0.0);
l9_118.x=l9_117;
float l9_119;
if (l9_1.y<0.5)
{
l9_119=0.0;
}
else
{
l9_119=l9_113.y;
}
vec2 l9_120=l9_118;
l9_120.y=l9_119;
sc_SetClipPosition(vec4(((l9_120+(l9_116*l9_113))*2.0)-vec2(1.0),1.0,1.0));
Interp_Particle_Index=sc_GetLocalInstanceID();
Interp_Particle_Coord=l9_1;
Interp_Particle_Force=gParticle.Force;
Interp_Particle_Size=gParticle.Size;
Interp_Particle_Counter_N3=gParticle.Counter_N3;
Interp_Particle_Tap_N2=gParticle.Tap_N2;
Interp_Particle_Mass=gParticle.Mass;
Interp_Particle_Position=gParticle.Position;
Interp_Particle_Velocity=gParticle.Velocity;
Interp_Particle_Life=gParticle.Life;
Interp_Particle_Age=gParticle.Age;
Interp_Particle_Color=gParticle.Color;
Interp_Particle_Dead=gParticle.Dead;
if (l9_3&&(overrideTimeDelta==0.0))
{
vec4 l9_121;
if (sc_GetLocalInstanceID()==0)
{
l9_121=vec4((l9_1*2.0)-vec2(1.0),1.0,1.0);
}
else
{
l9_121=vec4(0.0);
}
sc_SetClipPosition(l9_121);
varPackedTex=vec4(l9_1.x,l9_1.y,varPackedTex.z,varPackedTex.w);
}
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
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
    #define texture2DLodEXT texture2DLod
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
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&!sc_StereoRendering_IsClipDistanceEnabled
        #define sc_StereoFragmentMain main
        #define sc_MainInjector MAIN(); void sc_MainInjected
    #else
        #define MAIN sc_MainInjector
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
#ifndef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 0
#elif sc_CanUseStandardDerivatives==1
#undef sc_CanUseStandardDerivatives
#define sc_CanUseStandardDerivatives 1
#endif
#ifndef sc_CanUseTextureLod
#define sc_CanUseTextureLod 0
#elif sc_CanUseTextureLod==1
#undef sc_CanUseTextureLod
#define sc_CanUseTextureLod 1
#endif
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
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
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
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
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
uniform vec4 sc_EnvmapDiffuseDims;
uniform vec4 sc_EnvmapSpecularDims;
uniform vec4 sc_ScreenTextureDims;
uniform vec4 sc_SSAOTextureDims;
uniform bool receivesRayTracedReflections;
uniform bool isProxyMode;
uniform bool receivesRayTracedShadows;
uniform bool receivesRayTracedDiffuseIndirect;
uniform bool receivesRayTracedAo;
uniform vec4 sc_WindowToViewportTransform;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform float shaderComplexityValue;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_SSAOTextureTransform;
uniform vec4 sc_SSAOTextureUvMinMax;
uniform vec4 sc_SSAOTextureBorderColor;
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
uniform vec4 sc_Time;
uniform int vfxOffsetInstances;
uniform int ssTARGET_WIDTH_INT;
uniform vec2 ssTARGET_SIZE_FLOAT;
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
uniform sc_PointLight_t sc_PointLights[(sc_PointLightsCount+1)];
uniform sc_DirectionalLight_t sc_DirectionalLights[(sc_DirectionalLightsCount+1)];
uniform sc_AmbientLight_t sc_AmbientLights[(sc_AmbientLightsCount+1)];
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec4 sc_EnvmapDiffuseSize;
uniform vec4 sc_EnvmapDiffuseView;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapSpecularView;
uniform vec3 sc_EnvmapRotation;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform vec4 sc_UniformConstants;
uniform vec4 sc_GeometryInfo;
uniform mat4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform mat3 sc_NormalMatrix;
uniform mat3 sc_NormalMatrixInverse;
uniform vec3 sc_LocalAabbMin;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_WorldAabbMin;
uniform vec3 sc_WorldAabbMax;
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectorMatrix;
uniform float sc_DisableFrustumCullingMarker;
uniform vec4 sc_BoneMatrices[((sc_SkinBonesCount*3)+1)];
uniform mat3 sc_SkinBonesNormalMatrices[(sc_SkinBonesCount+1)];
uniform vec4 weights0;
uniform vec4 weights1;
uniform vec4 weights2;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform int sc_FallbackInstanceID;
uniform vec2 sc_TAAJitterOffset;
uniform float strandWidth;
uniform float strandTaper;
uniform vec4 sc_StrandDataMapTextureSize;
uniform float clumpInstanceCount;
uniform float clumpRadius;
uniform float clumpTipScale;
uniform float hairstyleInstanceCount;
uniform float hairstyleNoise;
uniform vec4 sc_ScreenTextureSize;
uniform vec4 sc_ScreenTextureView;
uniform vec4 sc_SSAOTextureSize;
uniform vec4 sc_SSAOTextureView;
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
uniform vec2 ssTARGET_SIZE_INT;
uniform float ssTARGET_WIDTH;
uniform vec2 sUV;
uniform vec2 Tweak_N18;
uniform int Tweak_N114;
uniform vec2 Tweak_N34;
uniform vec3 Port_Import_N050;
uniform float Port_Input1_N324;
uniform float Port_Input1_N323;
uniform vec3 Port_Import_N052;
uniform vec2 Port_Import_N375;
uniform float Port_Value1_N057;
uniform float Port_Import_N166;
uniform float Port_Input1_N056;
uniform vec2 Port_Max_N058;
uniform float Port_Import_N062;
uniform float Port_Import_N063;
uniform float Port_Value3_N309;
uniform float Port_Import_N132;
uniform float Port_Import_N133;
uniform vec3 Port_Import_N029;
uniform float Port_Import_N031;
uniform float Port_Value_N002;
uniform float Port_DefaultFloat_N002;
uniform float Port_Value_N003;
uniform float Port_DefaultFloat_N003;
uniform float Port_RangeMinA_N022;
uniform float Port_RangeMaxA_N022;
uniform float Port_RangeMinB_N022;
uniform float Port_RangeMaxB_N022;
uniform vec2 Port_Import_N044;
uniform float Port_Min_N096;
uniform float Port_Max_N096;
uniform float Port_Import_N074;
uniform float Port_Input1_N080;
uniform float Port_RangeMinA_N084;
uniform float Port_RangeMaxA_N084;
uniform float Port_RangeMinB_N084;
uniform float Port_RangeMaxB_N084;
uniform float Port_Multiplier_N107;
uniform float Port_DefaultFloat_N004;
uniform float Port_DefaultFloat_N005;
uniform sampler2D renderTarget0;
uniform sampler2D renderTarget1;
uniform sampler2D renderTarget2;
uniform sampler2D renderTarget3;
varying float varStereoViewID;
varying vec2 varShadowTex;
varying float varClipDistance;
varying float varViewSpaceDepth;
varying vec4 varPackedTex;
varying float Interp_Particle_Size;
varying float Interp_Particle_Counter_N3;
varying float Interp_Particle_Tap_N2;
varying float Interp_Particle_Mass;
varying vec3 Interp_Particle_Position;
varying vec3 Interp_Particle_Velocity;
varying float Interp_Particle_Life;
varying float Interp_Particle_Age;
varying vec4 Interp_Particle_Color;
varying float Interp_Particle_Dead;
varying vec2 Interp_Particle_Coord;
varying vec3 varPos;
varying vec3 varNormal;
varying vec4 varTangent;
varying vec4 varScreenPos;
varying vec2 varScreenTexturePos;
varying vec4 varColor;
flat varying int Interp_Particle_Index;
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
float l9_1=step(abs(value-l9_0),1e-05);
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
float sc_InternalCalculateSampleBias(vec2 texSize,vec2 uv,float level_)
{
float l9_0;
#if (sc_CanUseStandardDerivatives)
{
vec2 l9_1=uv*texSize;
float l9_2=l9_1.x;
float l9_3=l9_1.y;
l9_0=level_-log2(max(max(abs(dFdx(l9_2)),abs(dFdy(l9_2))),max(abs(dFdx(l9_3)),abs(dFdy(l9_3)))));
}
#else
{
l9_0=0.0;
}
#endif
return l9_0;
}
vec4 sc_InternalTextureLevel(vec2 texSize,vec2 uv,float level_,sampler2D texsmp)
{
vec4 l9_0;
#if (sc_CanUseTextureLod)
{
l9_0=texture2DLod(texsmp,uv,level_);
}
#else
{
vec4 l9_1;
#if (sc_CanUseStandardDerivatives)
{
l9_1=texture2D(texsmp,uv,sc_InternalCalculateSampleBias(texSize,uv,level_));
}
#else
{
l9_1=vec4(0.0);
}
#endif
l9_0=l9_1;
}
#endif
return l9_0;
}
vec4 sc_SampleViewLevel(vec2 texSize,vec2 uv,int renderingLayout,int viewIndex,float level,sampler2D texsmp)
{
return sc_InternalTextureLevel(texSize,sc_SamplingCoordsViewToGlobal(uv,renderingLayout,viewIndex).xy,level,texsmp);
}
vec4 sc_SampleTextureLevel(vec2 samplerDims,int renderingLayout,int viewIndex,vec2 uv,bool useUvTransform,mat3 uvTransform,ivec2 softwareWrapModes,bool useUvMinMax,vec4 uvMinMax,bool useClampToBorder,vec4 borderColor,float level,sampler2D texture_sampler_)
{
bool l9_0=useClampToBorder;
bool l9_1=useUvMinMax;
bool l9_2=l9_0&&(!l9_1);
sc_SoftwareWrapEarly(uv.x,softwareWrapModes.x);
sc_SoftwareWrapEarly(uv.y,softwareWrapModes.y);
float l9_3;
if (useUvMinMax)
{
bool l9_4=useClampToBorder;
bool l9_5;
if (l9_4)
{
l9_5=softwareWrapModes.x==3;
}
else
{
l9_5=l9_4;
}
float param_8=1.0;
sc_ClampUV(uv.x,uvMinMax.x,uvMinMax.z,l9_5,param_8);
float l9_6=param_8;
bool l9_7=useClampToBorder;
bool l9_8;
if (l9_7)
{
l9_8=softwareWrapModes.y==3;
}
else
{
l9_8=l9_7;
}
float param_13=l9_6;
sc_ClampUV(uv.y,uvMinMax.y,uvMinMax.w,l9_8,param_13);
l9_3=param_13;
}
else
{
l9_3=1.0;
}
uv=sc_TransformUV(uv,useUvTransform,uvTransform);
float param_20=l9_3;
sc_SoftwareWrapLate(uv.x,softwareWrapModes.x,l9_2,param_20);
sc_SoftwareWrapLate(uv.y,softwareWrapModes.y,l9_2,param_20);
float l9_9=param_20;
vec4 l9_10=sc_SampleViewLevel(samplerDims,uv,renderingLayout,viewIndex,level,texture_sampler_);
vec4 l9_11;
if (useClampToBorder)
{
l9_11=mix(borderColor,l9_10,vec4(l9_9));
}
else
{
l9_11=l9_10;
}
return l9_11;
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
vec4 ssEncodeFloat32(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(((clamp(Value,Min,Max)-Min)*RemapRange)/(Max-Min)));
return l9_0-(l9_0.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0));
}
vec2 ssEncodeFloat16(float Value,float Min,float Max,float RemapRange)
{
vec4 l9_0=fract(vec4(1.0,255.0,65025.0,1.65814e+07)*(((clamp(Value,Min,Max)-Min)*RemapRange)/(Max-Min)));
return (l9_0-(l9_0.yzww*vec4(0.00392157,0.00392157,0.00392157,0.0))).xy;
}
void sc_writeFragData0(vec4 col)
{
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
if (dot(((sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0)+sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1))+sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2))+sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),vec2(0.5),(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3),vec4(0.254232))==0.342318)
{
discard;
}
vec4 l9_0;
vec4 l9_1;
vec4 l9_2;
vec4 l9_3;
if ((overrideTimeEnabled==1)&&(overrideTimeDelta==0.0))
{
l9_3=sc_SampleTextureLevel(renderTarget3Dims.xy,renderTarget3Layout,renderTarget3GetStereoViewIndex(),varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget3)!=0),renderTarget3Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget3,SC_SOFTWARE_WRAP_MODE_V_renderTarget3),(int(SC_USE_UV_MIN_MAX_renderTarget3)!=0),renderTarget3UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget3)!=0),renderTarget3BorderColor,0.0,renderTarget3);
l9_2=sc_SampleTextureLevel(renderTarget2Dims.xy,renderTarget2Layout,renderTarget2GetStereoViewIndex(),varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget2)!=0),renderTarget2Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget2,SC_SOFTWARE_WRAP_MODE_V_renderTarget2),(int(SC_USE_UV_MIN_MAX_renderTarget2)!=0),renderTarget2UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget2)!=0),renderTarget2BorderColor,0.0,renderTarget2);
l9_1=sc_SampleTextureLevel(renderTarget1Dims.xy,renderTarget1Layout,renderTarget1GetStereoViewIndex(),varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget1)!=0),renderTarget1Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget1,SC_SOFTWARE_WRAP_MODE_V_renderTarget1),(int(SC_USE_UV_MIN_MAX_renderTarget1)!=0),renderTarget1UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget1)!=0),renderTarget1BorderColor,0.0,renderTarget1);
l9_0=sc_SampleTextureLevel(renderTarget0Dims.xy,renderTarget0Layout,renderTarget0GetStereoViewIndex(),varPackedTex.xy,(int(SC_USE_UV_TRANSFORM_renderTarget0)!=0),renderTarget0Transform,ivec2(SC_SOFTWARE_WRAP_MODE_U_renderTarget0,SC_SOFTWARE_WRAP_MODE_V_renderTarget0),(int(SC_USE_UV_MIN_MAX_renderTarget0)!=0),renderTarget0UvMinMax,(int(SC_USE_CLAMP_TO_BORDER_renderTarget0)!=0),renderTarget0BorderColor,0.0,renderTarget0);
}
else
{
int l9_4=int(floor(Interp_Particle_Coord.x*3.0));
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
vec4 l9_21=ssEncodeFloat32(Interp_Particle_Position.x,-1000.0,1000.0,0.99999);
vec4 l9_22=ssEncodeFloat32(Interp_Particle_Position.y,-1000.0,1000.0,0.99999);
vec4 l9_23=ssEncodeFloat32(Interp_Particle_Position.z,-1000.0,1000.0,0.99999);
vec4 l9_24=ssEncodeFloat32(Interp_Particle_Velocity.x,-1000.0,1000.0,0.99999);
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
vec4 l9_41=ssEncodeFloat32(Interp_Particle_Velocity.y,-1000.0,1000.0,0.99999);
vec4 l9_42=ssEncodeFloat32(Interp_Particle_Velocity.z,-1000.0,1000.0,0.99999);
vec4 l9_43=ssEncodeFloat32(Interp_Particle_Life,0.0,10.0,0.99999);
vec4 l9_44=ssEncodeFloat32(Interp_Particle_Age,0.0,10.0,0.99999);
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
if (l9_4==2)
{
vec2 l9_56=ssEncodeFloat16(Interp_Particle_Size,0.0,100.0,0.99999);
vec2 l9_57=ssEncodeFloat16(Interp_Particle_Mass,0.0,100.0,0.99999);
l9_55=clamp(Interp_Particle_Dead,0.0,255.0)*0.00392157;
l9_54=clamp(Interp_Particle_Color.w,0.0,1.0);
l9_53=clamp(Interp_Particle_Color.z,0.0,1.0);
l9_52=clamp(Interp_Particle_Color.y,0.0,1.0);
l9_51=clamp(Interp_Particle_Color.x,0.0,1.0);
l9_50=clamp(Interp_Particle_Tap_N2,0.0,1.0);
l9_49=clamp(Interp_Particle_Counter_N3,0.0,25.0)*0.04;
l9_48=l9_57.y;
l9_47=l9_57.x;
l9_46=l9_56.y;
l9_45=l9_56.x;
}
else
{
l9_55=0.0;
l9_54=0.0;
l9_53=0.0;
l9_52=0.0;
l9_51=0.0;
l9_50=0.0;
l9_49=0.0;
l9_48=0.0;
l9_47=0.0;
l9_46=0.0;
l9_45=0.0;
}
l9_40=0.0;
l9_39=0.0;
l9_38=0.0;
l9_37=0.0;
l9_36=0.0;
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
vec4 l9_58=vec4(l9_5,l9_6,l9_7,l9_8);
vec4 l9_59=vec4(l9_9,l9_10,l9_11,l9_12);
vec4 l9_60=vec4(l9_13,l9_14,l9_15,l9_16);
vec4 l9_61=vec4(l9_17,l9_18,l9_19,l9_20);
vec4 l9_62;
if (dot(((l9_58+l9_59)+l9_60)+l9_61,vec4(0.23454))==0.342318)
{
l9_62=l9_58+vec4(1e-06);
}
else
{
l9_62=l9_58;
}
l9_3=l9_61;
l9_2=l9_60;
l9_1=l9_59;
l9_0=l9_62;
}
sc_writeFragData0(l9_0);
sc_writeFragData1(l9_1);
sc_writeFragData2(l9_2);
sc_writeFragData3(l9_3);
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
