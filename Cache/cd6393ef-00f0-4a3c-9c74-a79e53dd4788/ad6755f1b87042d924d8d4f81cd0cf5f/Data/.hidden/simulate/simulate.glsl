#version 310 es

#define NODEFLEX 0 // Hack for now to know if a shader is running in Studio or on a released lens

#define SIMULATION_PASS

#define NF_PRECISION highp

#define SC_USE_USER_DEFINED_VS_MAIN

//-----------------------------------------------------------------------



//-----------------------------------------------------------------------


//-----------------------------------------------------------------------
// Standard defines
//-----------------------------------------------------------------------


#pragma paste_to_backend_at_the_top_begin
#define SC_DISABLE_FRUSTUM_CULLING
#define SC_ALLOW_16_TEXTURES
#ifdef isIdle
#undef isIdle
#endif

#ifdef isAttracting
#undef isAttracting
#endif
#define SC_ENABLE_INSTANCED_RENDERING
#pragma paste_to_backend_at_the_top_end


//-----------------------------------------------------------------------
// Standard includes
//-----------------------------------------------------------------------

#include <std2.glsl>
#include <std2_vs.glsl>
#include <std2_texture.glsl>
#include <std2_receiver.glsl>
#include <std2_fs.glsl>
#if (SC_BACKEND_LANGUAGE_VERSION >= 310) || defined (SC_BACKEND_LANGUAGE_METAL)
#if !SC_RT_RECEIVER_MODE
#include <std2_proxy.glsl>
#endif
#endif

//-----------------------------------------------------------------------
// Global defines
//-----------------------------------------------------------------------

#define SCENARIUM


#ifdef SC_BACKEND_LANGUAGE_MOBILE
#define MOBILE
#endif


#ifdef SC_BACKEND_LANGUAGE_GL
const bool DEVICE_IS_FAST = SC_DEVICE_CLASS >= SC_DEVICE_CLASS_C && bool(SC_GL_FRAGMENT_PRECISION_HIGH);
#else
const bool DEVICE_IS_FAST = SC_DEVICE_CLASS >= SC_DEVICE_CLASS_C;
#endif


const bool SC_ENABLE_SRGB_EMULATION_IN_SHADER = false;


//-----------------------------------------------------------------------
// Varyings
//-----------------------------------------------------------------------

varying vec4 varColor;

//-----------------------------------------------------------------------
// User includes
//-----------------------------------------------------------------------
#include "includes/utils.glsl"		
// in SC_RT_RECEIVER_MODE, the following headers cannot be included as they reference std2_fs_output functions: 
#if !SC_RT_RECEIVER_MODE
#include "includes/blend_modes.glsl"
#include "includes/oit.glsl" 
#endif
#include "includes/rgbhsl.glsl"
#include "includes/uniforms.glsl"

//-----------------------------------------------------------------------

// The next 60 or so lines of code are for debugging support, live tweaks, node previews, etc and will be included in a 
// shared glsl file.

//-----------------------------------------------------------------------

// Hack for now to know if a shader is running in Studio or on a released lens

#if !defined(MOBILE) && !NODEFLEX
#define STUDIO
#endif

//-----------------------------------------------------------------------

#if defined( SIMULATION_PASS )


#define ngsLocalAabbMin						vfxLocalAabbMin
#define ngsWorldAabbMin						vfxWorldAabbMin
#define ngsLocalAabbMax						vfxLocalAabbMax
#define ngsWorldAabbMax						vfxWorldAabbMax
#define ngsCameraAspect 					vfxCameraAspect
#define ngsCameraNear                       vfxCameraNear
#define ngsCameraFar                        vfxCameraFar
#define ngsCameraPosition                   vfxViewMatrixInverse[3].xyz
#define ngsModelMatrix                      vfxModelMatrix
#define ngsModelMatrixInverse               vfxModelMatrixInverse
#define ngsModelViewMatrix                  vfxModelViewMatrix
#define ngsModelViewMatrixInverse           vfxModelViewMatrixInverse
#define ngsProjectionMatrix                 vfxProjectionMatrix
#define ngsProjectionMatrixInverse          vfxProjectionMatrixInverse
#define ngsModelViewProjectionMatrix        vfxModelViewProjectionMatrix
#define ngsModelViewProjectionMatrixInverse vfxModelViewProjectionMatrixInverse
#define ngsViewMatrix                       vfxViewMatrix
#define ngsViewMatrixInverse                vfxViewMatrixInverse
#define ngsViewProjectionMatrix             vfxViewProjectionMatrix
#define ngsViewProjectionMatrixInverse      vfxViewProjectionMatrixInverse
#define ngsCameraUp 					    vfxCameraUp
#define ngsCameraForward                    -vfxCameraForward
#define ngsCameraRight                      vfxCameraRight
#define ngsFrame    	                    vfxFrame


#else


#define ngsLocalAabbMin						sc_LocalAabbMin
#define ngsWorldAabbMin						sc_WorldAabbMin
#define ngsLocalAabbMax						sc_LocalAabbMax
#define ngsWorldAabbMax						sc_WorldAabbMax
#define ngsCameraAspect 					sc_Camera.aspect;
#define ngsCameraNear                       sc_Camera.clipPlanes.x
#define ngsCameraFar                        sc_Camera.clipPlanes.y
#define ngsCameraPosition                   sc_Camera.position
#define ngsModelMatrix                      sc_ModelMatrix
#define ngsModelMatrixInverse               sc_ModelMatrixInverse
#define ngsModelViewMatrix                  sc_ModelViewMatrix
#define ngsModelViewMatrixInverse           sc_ModelViewMatrixInverse
#define ngsProjectionMatrix                 sc_ProjectionMatrix
#define ngsProjectionMatrixInverse          sc_ProjectionMatrixInverse
#define ngsModelViewProjectionMatrix        sc_ModelViewProjectionMatrix
#define ngsModelViewProjectionMatrixInverse sc_ModelViewProjectionMatrixInverse
#define ngsViewMatrix                       sc_ViewMatrix
#define ngsViewMatrixInverse                sc_ViewMatrixInverse
#define ngsViewProjectionMatrix             sc_ViewProjectionMatrix
#define ngsViewProjectionMatrixInverse      sc_ViewProjectionMatrixInverse
#define ngsCameraUp 					    sc_ViewMatrixInverse[1].xyz
#define ngsCameraForward                    -sc_ViewMatrixInverse[2].xyz
#define ngsCameraRight                      sc_ViewMatrixInverse[0].xyz
#define ngsFrame 		                    0


#endif

//-----------------------------------------------------------------------

// Time Overrides

uniform       int   overrideTimeEnabled;
uniform highp float overrideTimeElapsed;
uniform highp float overrideTimeDelta;

//-----------------------------------------------------------------------

#if defined( STUDIO )
#define ssConstOrUniformPrecision	uniform NF_PRECISION
#define ssConstOrUniform			uniform
#else
#define ssConstOrUniformPrecision   const
#define ssConstOrUniform    		const
#endif

//--------------------------------------------------------

// When compiling the shader for rendering in a node-based editor, we need any unconnected dynamic input port's value to
// be tweakable in real-time so we expose it to the engine as a uniform. If we're compiling the shader for a release build
// we use a literal or const value

#if defined( STUDIO )
#define NF_PORT_CONSTANT( xValue, xUniform )	xUniform
#else
#define NF_PORT_CONSTANT( xValue, xUniform )	xValue
#endif

//--------------------------------------------------------

#define float2   vec2
#define float3   vec3
#define float4   vec4
#define bool2    bvec2
#define bool3    bvec3
#define bool4    bvec4
#define float2x2 mat2
#define float3x3 mat3
#define float4x4 mat4

//--------------------------------------------------------

#define ssConditional( C, A, B ) ( ( C * 1.0 != 0.0 ) ? A : B )
#define ssEqual( A, B )          ( ( A == B ) ? 1.0 : 0.0 )
#define ssNotEqual( A, B )       ( ( A == B ) ? 0.0 : 1.0 )
#define ssLarger( A, B )         ( ( A > B ) ? 1.0 : 0.0 )
#define ssLargerOrEqual( A, B )  ( ( A >= B ) ? 1.0 : 0.0 )
#define ssSmaller( A,  B ) 		 ( ( A < B ) ? 1.0 : 0.0 )
#define ssSmallerOrEqual( A, B ) ( ( A <= B ) ? 1.0 : 0.0 )
#define ssNot( A ) 		         ( ( A * 1.0 != 0.0 ) ? 0.0 : 1.0 )

//--------------------------------------------------------

int ssIntMod( int x, int y )
{
	return x - y * ( x / y );
}

//--------------------------------------------------------

float ssSRGB_to_Linear( float value ) { return ( DEVICE_IS_FAST ) ? pow( value, 2.2 ) : value * value; }
vec2  ssSRGB_to_Linear( vec2  value ) { return ( DEVICE_IS_FAST ) ? vec2( pow( value.x, 2.2 ), pow( value.y, 2.2 ) ) : value * value; }
vec3  ssSRGB_to_Linear( vec3  value ) { return ( DEVICE_IS_FAST ) ? vec3( pow( value.x, 2.2 ), pow( value.y, 2.2 ), pow( value.z, 2.2 ) ) : value * value; }
vec4  ssSRGB_to_Linear( vec4  value ) { return ( DEVICE_IS_FAST ) ? vec4( pow( value.x, 2.2 ), pow( value.y, 2.2 ), pow( value.z, 2.2 ), pow( value.w, 2.2 ) ) : value * value; }

float ssLinear_to_SRGB( float value ) { return ( DEVICE_IS_FAST ) ? pow( value, 0.45454545 ) : sqrt( value ); }
vec2  ssLinear_to_SRGB( vec2  value ) { return ( DEVICE_IS_FAST ) ? vec2( pow( value.x, 0.45454545 ), pow( value.y, 0.45454545 ) ) : sqrt( value ); }
vec3  ssLinear_to_SRGB( vec3  value ) { return ( DEVICE_IS_FAST ) ? vec3( pow( value.x, 0.45454545 ), pow( value.y, 0.45454545 ), pow( value.z, 0.45454545 ) ) : sqrt( value ); }
vec4  ssLinear_to_SRGB( vec4  value ) { return ( DEVICE_IS_FAST ) ? vec4( pow( value.x, 0.45454545 ), pow( value.y, 0.45454545 ), pow( value.z, 0.45454545 ), pow( value.w, 0.45454545 ) ) : sqrt( value ); }

//--------------------------------------------------------

float3 ssWorldToScreen( float3 Vector, mat4 ViewProjectionMatrix )
{
	float4 ScreenVector = ViewProjectionMatrix * float4( Vector, 1.0 );
	return ScreenVector.xyz / ScreenVector.w;
}

//--------------------------------------------------------

float  Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;

//--------------------------------------------------------

#define ssPRECISION_LIMITER( Value ) Value = floor( Value * 10000.0 ) * 0.0001;
#define ssPRECISION_LIMITER2( Value ) Value = floor( Value * 2000.0 + 0.5 ) * 0.0005;

float rand( vec2 Seed ) // old, used by shader graph...
{ 
	float RandomValue = dot( Seed.xy, vec2( 0.98253, 0.72662 ) );
	RandomValue = sin( RandomValue ) * 479.371;
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

//--------------------------------------------------------

float rand_float( float Seed )
{ 
	float RandomValue = Seed;
	RandomValue = sin( RandomValue ) * 479.371;
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

float rand_float( vec2 Seed ) { return rand_float( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
float rand_float( vec3 Seed ) { return rand_float( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
float rand_float( vec4 Seed ) { return rand_float( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

vec2 rand_vec2( float Seed )
{ 
	vec2 RandomValue = Seed * vec2( 0.457831, 0.623433 );
	RandomValue = sin( RandomValue ) * vec2( 479.371, 389.531 );
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

vec2 rand_vec2( vec2 Seed ) { return rand_vec2( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
vec2 rand_vec2( vec3 Seed ) { return rand_vec2( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
vec2 rand_vec2( vec4 Seed ) { return rand_vec2( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

vec3 rand_vec3( float Seed )
{ 
	vec3 RandomValue = Seed * vec3( 0.457831, 0.623433, 0.976253 );
	RandomValue = sin( RandomValue ) * vec3( 479.371, 389.531, 513.035 );
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

vec3 rand_vec3( vec2 Seed ) { return rand_vec3( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
vec3 rand_vec3( vec3 Seed ) { return rand_vec3( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
vec3 rand_vec3( vec4 Seed ) { return rand_vec3( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

vec4 rand_vec4( float Seed )
{ 
	vec4 RandomValue = Seed * vec4( 0.457831, 0.623433, 0.976253, 0.877913 );
	RandomValue = sin( RandomValue ) * vec4( 479.371, 389.531, 513.035, 397.895 );
	RandomValue = fract( RandomValue ); 
	ssPRECISION_LIMITER( RandomValue ) 
	return RandomValue; 
}

vec4 rand_vec4( vec2 Seed ) { return rand_vec4( dot( Seed, vec2( 0.38253, 0.42662 ) ) ); }
vec4 rand_vec4( vec3 Seed ) { return rand_vec4( dot( Seed, vec3( 0.38253, 0.42662, 0.65295  ) ) ); }
vec4 rand_vec4( vec4 Seed ) { return rand_vec4( dot( Seed, vec4( 0.38253, 0.42662, 0.65295, 0.29582 ) ) ); }

//--------------------------------------------------------

#define ssDELTA_TIME_MIN 0.00

//--------------------------------------------------------


vec4 EncodeFloat32( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc;
}

vec3 EncodeFloat24( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc.rgb;
}

vec2 EncodeFloat16( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc.rg;
}

float EncodeFloat8( float v /* 0 - 1 range only */ ) 
{
	vec4 enc = vec4(1.0, 255.0, 65025.0, 16581375.0) * v;
	enc = fract(enc);
	enc -= enc.yzww * vec4(1.0/255.0, 1.0/255.0, 1.0/255.0, 0.0);
	return enc.r;
}

float DecodeFloat32( vec4 rgba /* 0 - 1 range only */, const bool Quantize ) 
{ 
	if ( Quantize ) 
	rgba = floor(rgba * 255.0 + 0.5) / 255.0;
	return dot( rgba, vec4(1.0, 1.0/255.0, 1.0/65025.0, 1.0/16581375.0) );
}

float DecodeFloat24( vec3 rgb /* 0 - 1 range only */, const bool Quantize ) 
{
	if ( Quantize ) 
	rgb = floor(rgb * 255.0 + 0.5) / 255.0;
	return dot( rgb, vec3(1.0, 1.0/255.0, 1.0/65025.0) );
}

float DecodeFloat16( vec2 rg /* 0 - 1 range only */, const bool Quantize ) 
{
	if ( Quantize ) 
	rg = floor(rg * 255.0 + 0.5) / 255.0;
	return dot( rg, vec2(1.0, 1.0/255.0) );
}

float DecodeFloat8( float r /* 0 - 1 range only */, const bool Quantize ) 
{
	if ( Quantize ) 
	r = floor(r * 255.0 + 0.5) / 255.0;
	return r;
}

#define ssDEFAULT_REMAP_RANGE 0.99999
#define ssDEFAULT_REMAP_RANGE2 1.0

vec4  remap (vec4 value, vec4 oldmin, vec4 oldmax, vec4 newmin, vec4 newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
vec3  remap (vec3 value, vec3 oldmin, vec3 oldmax, vec3 newmin, vec3 newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
vec2  remap (vec2 value, vec2 oldmin, vec2 oldmax, vec2 newmin, vec2 newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
float remap (float value, float oldmin, float oldmax, float newmin, float newmax) { return newmin + (value - oldmin) * (newmax - newmin) / (oldmax - oldmin); }
float remapTo01 (float value) { return (value + 1.0) * 0.5; }
float remapFrom01 (float value ) { return (value * 2.0) - 1.0; }

vec4  ssEncodeFloat32( float Value, float Min, float Max, float RemapRange )                      { return EncodeFloat32( remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ) ); }
vec4  ssEncodeFloat32( float Value, float Min, float Max )                     					  { return ssEncodeFloat32( Value, Min, Max, ssDEFAULT_REMAP_RANGE ); }
vec4  ssEncodeFloat32( float Value, float RemapRange )                                            { return ssEncodeFloat32( Value, 0.0, 1.0, RemapRange ); }
vec3  ssEncodeFloat24( float Value, float Min, float Max, float RemapRange )                      { return EncodeFloat24( remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ) ); }
vec3  ssEncodeFloat24( float Value, float Min, float Max )                     					  { return ssEncodeFloat24( Value, Min, Max, ssDEFAULT_REMAP_RANGE ); }
vec3  ssEncodeFloat24( float Value, float RemapRange )                                            { return ssEncodeFloat24( Value, 0.0, 1.0, RemapRange ); }
vec2  ssEncodeFloat16( float Value, float Min, float Max, float RemapRange )                      { return EncodeFloat16( remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ) ); }
vec2  ssEncodeFloat16( float Value, float Min, float Max )                     					  { return ssEncodeFloat16( Value, Min, Max, ssDEFAULT_REMAP_RANGE ); }
vec2  ssEncodeFloat16( float Value, float RemapRange )                                            { return ssEncodeFloat16( Value, 0.0, 1.0, RemapRange ); }
float ssEncodeFloat8(  float Value, float Min, float Max, float RemapRange )                      { return remap( clamp( Value, Min, Max ), Min, Max, 0.0, RemapRange ); }
float ssEncodeFloat8(  float Value, float Min, float Max )                     					  { return remap( clamp( Value, Min, Max ), Min, Max, 0.0, ssDEFAULT_REMAP_RANGE2 ); }
float ssEncodeFloat8(  float Value, float RemapRange )                                            { return ssEncodeFloat8( Value, 0.0, 1.0, RemapRange ); }

float ssDecodeFloat32(  vec4 Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat32( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat32(  vec4 Value, float Min, float Max ) 										  { return ssDecodeFloat32( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE ); }
float ssDecodeFloat32(  vec4 Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat32( Value, 0.0, 1.0, Quantize, RemapRange ); }
float ssDecodeFloat24(  vec3 Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat24( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat24(  vec3 Value, float Min, float Max ) 										  { return ssDecodeFloat24( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE ); }
float ssDecodeFloat24(  vec3 Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat24( Value, 0.0, 1.0, Quantize, RemapRange ); }
float ssDecodeFloat16(  vec2 Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat16( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat16(  vec2 Value, float Min, float Max ) 										  { return ssDecodeFloat16( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE ); }
float ssDecodeFloat16(  vec2 Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat16( Value, 0.0, 1.0, Quantize, RemapRange ); }
float ssDecodeFloat8(  float Value, float Min, float Max, const bool Quantize, float RemapRange ) { return remap( DecodeFloat8( Value, Quantize ), 0.0, RemapRange, Min, Max ); }
float ssDecodeFloat8(  float Value, float Min, float Max ) 										  { return ssDecodeFloat8( Value, Min, Max, true, ssDEFAULT_REMAP_RANGE2); }
float ssDecodeFloat8(  float Value, const bool Quantize, float RemapRange )                       { return ssDecodeFloat8( Value, 0.0, 1.0, Quantize, RemapRange ); }

//--------------------------------------------------------


#if 0

struct ssPreviewInfo
{
	float4 Color;
	bool   Saved;
};

ssPreviewInfo PreviewInfo;

uniform NF_PRECISION int PreviewEnabled; // PreviewEnabled is set to 1 by the renderer when Lens Studio is rendering node previews
uniform NF_PRECISION int PreviewNodeID;  // PreviewNodeID is set to the node's ID that a preview is being rendered for

varying float4 PreviewVertexColor;
varying float  PreviewVertexSaved;

#define NF_DISABLE_VERTEX_CHANGES() 				( PreviewEnabled == 1 )		
#define NF_SETUP_PREVIEW_VERTEX()					PreviewInfo.Color = PreviewVertexColor = float4( 0.5 ); PreviewInfo.Saved = false; PreviewVertexSaved = 0.0;
#define NF_SETUP_PREVIEW_PIXEL()					PreviewInfo.Color = PreviewVertexColor; PreviewInfo.Saved = ( PreviewVertexSaved * 1.0 != 0.0 ) ? true : false;
#define NF_PREVIEW_SAVE( xCode, xNodeID, xAlpha ) 	if ( PreviewEnabled == 1 && !PreviewInfo.Saved && xNodeID == PreviewNodeID ) { PreviewInfo.Saved = true; { PreviewInfo.Color = xCode; if ( !xAlpha ) PreviewInfo.Color.a = 1.0; } }
#define NF_PREVIEW_FORCE_SAVE( xCode ) 				if ( PreviewEnabled == 0 ) { PreviewInfo.Saved = true; { PreviewInfo.Color = xCode; } }
#define NF_PREVIEW_OUTPUT_VERTEX()					if ( PreviewInfo.Saved ) { PreviewVertexColor = float4( PreviewInfo.Color.rgb, 1.0 ); PreviewVertexSaved = 1.0; }
#define NF_PREVIEW_OUTPUT_PIXEL()					if ( PreviewEnabled == 1 ) { if ( PreviewInfo.Saved ) { Output_Color0 = float4( PreviewInfo.Color ); } else { Output_Color0 = vec4( 0.0, 0.0, 0.0, 0.0 ); /*FinalColor.a = 1.0;*/ /* this will be an option later */ }  }

#else

#define NF_DISABLE_VERTEX_CHANGES()					false		
#define NF_SETUP_PREVIEW_VERTEX()
#define NF_SETUP_PREVIEW_PIXEL()
#define NF_PREVIEW_SAVE( xCode, xNodeID, xAlpha )
#define NF_PREVIEW_FORCE_SAVE( xCode )
#define NF_PREVIEW_OUTPUT_VERTEX()
#define NF_PREVIEW_OUTPUT_PIXEL()

#endif


//--------------------------------------------------------



//--------------------------------------------------------

float4 ssGetScreenPositionNDC( float4 vertexPosition, float3 transformedPosition, mat4 viewProjectionMatrix )
{
	float4 screenPosition = vec4( 0.0 );
	
	#ifdef VERTEX_SHADER
	
	if ( sc_RenderingSpace == SC_RENDERING_SPACE_SCREEN )
	{
		screenPosition = vertexPosition;
	}
	else
	{
		screenPosition = ( viewProjectionMatrix * float4( transformedPosition, 1.0 ) );
		screenPosition.xyz /= screenPosition.w;
	}
	
	#endif
	
	return screenPosition;
}

//--------------------------------------------------------

#ifdef FRAGMENT_SHADER

#define ngsAlphaTest( opacity )

#endif // #ifdef FRAGMENT_SHADER

#ifdef FRAGMENT_SHADER
#if !SC_RT_RECEIVER_MODE
vec4 ngsPixelShader( vec4 result ) 
{	
	if ( sc_ProjectiveShadowsCaster )
	{
		return evaluateShadowCasterColor( result );
	}
	else if ( sc_RenderAlphaToColor )
	{
		return vec4(result.a);
	}
	
	// Blending
	
	if ( sc_BlendMode_Custom )
	{				
		result = applyCustomBlend(result);
	}					
	else
	{
		result = sc_ApplyBlendModeModifications(result);
	}
	
	return result;
}
#endif
#endif


//-----------------------------------------------------------------------


//--------------------------------------------------------

SC_DECLARE_TEXTURE(renderTarget0);
SC_DECLARE_TEXTURE(renderTarget1);
SC_DECLARE_TEXTURE(renderTarget2);
SC_DECLARE_TEXTURE(renderTarget3);

//--------------------------------------------------------

uniform float       _sc_allow16TexturesMarker;
uniform highp vec3  vfxLocalAabbMin;
uniform highp vec3  vfxWorldAabbMin;
uniform highp vec3  vfxLocalAabbMax;
uniform highp vec3  vfxWorldAabbMax;
uniform highp float vfxCameraAspect;
uniform highp float vfxCameraNear;
uniform highp float vfxCameraFar;
uniform highp vec3  vfxCameraUp;
uniform highp vec3  vfxCameraForward;
uniform highp vec3  vfxCameraRight;
uniform highp mat4  vfxModelMatrix;
uniform highp mat4  vfxModelMatrixInverse;
uniform highp mat4  vfxModelViewMatrix;
uniform highp mat4  vfxModelViewMatrixInverse;
uniform highp mat4  vfxProjectionMatrix;
uniform highp mat4  vfxProjectionMatrixInverse;
uniform highp mat4  vfxModelViewProjectionMatrix;
uniform highp mat4  vfxModelViewProjectionMatrixInverse;
uniform highp mat4  vfxViewMatrix;
uniform highp mat4  vfxViewMatrixInverse;
uniform highp mat4  vfxViewProjectionMatrix;
uniform highp mat4  vfxViewProjectionMatrixInverse;
uniform       int   vfxFrame;


//--------------------------------------------------------


#define ssTEXEL_COUNT_INT           4
#define ssTEXEL_COUNT_FLOAT         4.0
#define ssPARTICLE_COUNT_1D_INT		1600
#define ssPARTICLE_COUNT_1D_FLOAT	1600.0
#define ssPARTICLE_COUNT_2D_INT		ivec2( 512, 4 )
#define ssPARTICLE_COUNT_2D_FLOAT	float2( 512.0, 4.0 )
#define ssTARGET_SIZE_INT 			ivec2( 2048, 4 )
#define ssTARGET_SIZE_FLOAT			float2( 2048.0, 4.0 )
#define ssPARTICLE_LIFE_MAX 		float( 8.0 )
#define ssPARTICLE_TOTAL_LIFE_MAX 	float( 8.0 )
#define ssPARTICLE_BURST_GROUPS 	float( 1.0 )
#define ssPARTICLE_SPAWN_RATE 		float( 200.0 )
#define ssPARTICLE_BURST_EVERY 		float( 1.0 )
#define ssPARTICLE_DELAY_MAX        float( 0.5 )
#define ssPARTICLE_MASS_MAX         float( 100.0 )
#define ssPARTICLE_SIZE_MAX         float( 100.0 )


//--------------------------------------------------------


int    ssParticle_Index2D_to_Index1D( ivec2 Index2D )  { return Index2D.y * ssPARTICLE_COUNT_2D_INT.x + Index2D.x; }
ivec2  ssParticle_Index1D_to_Index2D( int Index1D )	   { return ivec2( Index1D % ssPARTICLE_COUNT_2D_INT.x, Index1D / ssPARTICLE_COUNT_2D_INT.x ); }
float  ssParticle_Index1D_to_Coord1D( int Index1D )    { return ( float( Index1D ) + 0.5 ) / ssPARTICLE_COUNT_1D_FLOAT; }
float  ssParticle_Index1D_to_Ratio1D( int Index1D )    { return float( Index1D ) / max( ssPARTICLE_COUNT_1D_FLOAT - 1.0, 1.0 ); }
float2 ssParticle_Index2D_to_Coord2D( ivec2 Index2D )  { return ( float2( Index2D ) + 0.5 ) / ssPARTICLE_COUNT_2D_FLOAT; }
float2 ssParticle_Index2D_to_Ratio2D( ivec2 Index2D )  { return float2( Index2D ) / max( ssPARTICLE_COUNT_2D_FLOAT - float2( 1.0, 1.0 ), float2( 1.0, 1.0 ) ); }
int    ssParticle_Coord1D_to_Index1D( float Coord1D )  { return int( Coord1D * ssPARTICLE_COUNT_1D_FLOAT ); }
ivec2  ssParticle_Coord2D_to_Index2D( float2 Coord2D ) { return ivec2( Coord2D * ssPARTICLE_COUNT_2D_FLOAT ); }	
float2 ssParticle_Index1D_to_Coord2D( int Index1D )    { return ssParticle_Index2D_to_Coord2D( ssParticle_Index1D_to_Index2D( Index1D ) ); }
float  ssParticle_Index2D_to_Coord1D( ivec2 Index2D )  { return ssParticle_Index1D_to_Coord1D( ssParticle_Index2D_to_Index1D( Index2D ) ); }
int    ssParticle_Coord2D_to_Index1D( float2 Coord2D ) { return ssParticle_Index2D_to_Index1D( ssParticle_Coord2D_to_Index2D( Coord2D ) ); }
ivec2  ssParticle_Coord1D_to_Index2D( float Coord1D )  { return ssParticle_Index1D_to_Index2D( ssParticle_Coord1D_to_Index1D( Coord1D ) ); }
float2 ssParticle_Coord1D_to_Coord2D( float Coord1D )  { return ssParticle_Index2D_to_Coord2D( ssParticle_Coord1D_to_Index2D( Coord1D ) ); }	
float  ssParticle_Coord2D_to_Coord1D( float2 Coord2D ) { return ssParticle_Index1D_to_Coord1D( ssParticle_Coord2D_to_Index1D( Coord2D ) ); }


//--------------------------------------------------------


struct ssParticle
{
	// Feedback Attributes
	
	vec3  Position;
	vec3  Velocity;
	vec4  Color;
	float Size;
	float Age;
	float Life;
	float Mass;
	mat3  Matrix;
	vec4  Quaternion;
	float Dead;
	
	// Custom
	
	
	
	// Calculated
	
	float SpawnOffset;
	float Seed;
	vec2  Seed2000;
	float TimeShift;
	int   Index1D;
	float Coord1D;
	float Ratio1D;
	ivec2 Index2D;
	vec2  Coord2D;
	vec2  Ratio2D;
	vec3  Force;
	bool  Spawned;
};


//--------------------------------------------------------


void ssCalculateParticleSeed( inout ssParticle Particle )
{
	#if 0
	// Spawn Once - Live Forever
	//Particle.Seed = rand( vec2( Particle.Ratio1D + 0.141435 ) * 0.6789 );	
	Particle.Seed = Particle.Ratio1D * 0.976379 + 0.151235;
	ivec2 Index2D = ivec2( Particle.Index1D % 400, Particle.Index1D / 400 );	
	Particle.Seed2000 = ( vec2( Index2D ) + vec2( 1.0, 1.0 ) ) / max( vec2( 400.0, 400.0 ) - float2( 1.0, 1.0 ), float2( 1.0, 1.0 ) );
	#else
	// Any time max life is used
	float ElapsedTime = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : sc_TimeElapsed;
	
	Particle.Seed = Particle.Ratio1D * 0.976379 + 0.151235;
	Particle.Seed = Particle.Seed + floor( ( ElapsedTime - Particle.SpawnOffset - 0.0 /*delay*/ + 0.0 /*warmup*/  + ssPARTICLE_TOTAL_LIFE_MAX * 2.0 ) / ssPARTICLE_TOTAL_LIFE_MAX ) * 4.32723;
	Particle.Seed = fract( abs( Particle.Seed ) );
	ivec2 Index2D = ivec2( Particle.Index1D % 400, Particle.Index1D / 400 );	
	Particle.Seed2000 = ( vec2( Index2D ) + vec2( 1.0, 1.0 ) ) / max( vec2( 400.0, 400.0 ) - float2( 1.0, 1.0 ), float2( 1.0, 1.0 ) );
	#endif
	
	//ssPRECISION_LIMITER( Particle.Seed )
}


//--------------------------------------------------------


void ssCalculateDynamicAttributes( int InstanceID, inout ssParticle Particle )
{
	Particle.Spawned     = false;
	Particle.Force       = vec3( 0.0 );
	Particle.Index1D     = InstanceID;
	Particle.Index2D     = ssParticle_Index1D_to_Index2D( Particle.Index1D );
	Particle.Coord1D     = ssParticle_Index1D_to_Coord1D( Particle.Index1D );
	Particle.Coord2D     = ssParticle_Index2D_to_Coord2D( Particle.Index2D );
	Particle.Ratio1D     = ssParticle_Index1D_to_Ratio1D( Particle.Index1D );
	Particle.Ratio2D     = ssParticle_Index2D_to_Ratio2D( Particle.Index2D );
	Particle.Seed        = 0.0;
	
	#if 1
	Particle.TimeShift   = rand( vec2( Particle.Ratio1D ) * vec2( 0.3452, 0.52254 ) );
	Particle.SpawnOffset = Particle.Ratio1D * ssPARTICLE_LIFE_MAX;
	#elif  0
	Particle.TimeShift   = 0.0;
	Particle.SpawnOffset = float( Particle.Index1D / int( ssPARTICLE_SPAWN_RATE ) ) * ssPARTICLE_BURST_EVERY;
	#else
	Particle.TimeShift   = 0.0;
	Particle.SpawnOffset = 0.0;
	#endif
	
	ssCalculateParticleSeed( Particle );
}


//--------------------------------------------------------


vec4 ssGetParticleRandom( int Dimension, bool UseTime, bool UseNodeID, bool UseParticleID, float NodeID, vec2 ParticleSeed, float ExtraSeed, float Time )
{
	vec4  Random          = vec4( 0.0 );
	vec4  TimeRatio       = vec4( 1.0 );
	float NodeRatio       = 1.0;
	vec2  ParticleIDRatio = vec2(1.0);
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseTime )
	{
		TimeRatio = vec4( fract( Time * 10.0 ) ); 
		ssPRECISION_LIMITER( TimeRatio )
		TimeRatio = vec4( 0.3234, 0.6574, 0.2258, 0.8763 ) + TimeRatio;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseNodeID )
	{
		NodeRatio = 1.0 + ( NodeID + 1.0 ) * 0.01; /* don't use node count */
		//ssPRECISION_LIMITER( NodeRatio )
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseParticleID )
	{
		ParticleIDRatio = ParticleSeed;
	}
	
	ExtraSeed = ( ExtraSeed + 1.0 ) * 0.5;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( Dimension >= 1 )
	{
		Random.x = rand( vec2( 0.2353, 0.7875 ) * ParticleIDRatio * NodeRatio * TimeRatio.x * ExtraSeed );
	}
	
	if ( Dimension >= 2 )
	{
		Random.y = rand( vec2( 0.5751, 0.6273 ) * ParticleIDRatio * NodeRatio * TimeRatio.y * ExtraSeed ); 
	}
	
	if ( Dimension >= 3 )
	{
		Random.z = rand( vec2( 0.6947, 0.5217 ) * ParticleIDRatio * NodeRatio * TimeRatio.z * ExtraSeed );
	}
	
	if ( Dimension >= 4 )
	{
		Random.w = rand( vec2( 0.4789, 0.3967 ) * ParticleIDRatio * NodeRatio * TimeRatio.w * ExtraSeed );
	}
	
	return Random;
}


//--------------------------------------------------------


ssParticle gParticle;


//-----------------------------------------------------------------------


highp vec4  Output_Color0;
highp vec4  Output_Color1;
highp vec4  Output_Color2;
highp vec4  Output_Color3;
highp float Output_Depth;


//-----------------------------------------------------------------------


flat varying highp int Interp_Particle_Index;
varying highp vec3     Interp_Particle_Force;
varying highp vec2     Interp_Particle_Coord;

varying highp float4 Interp_Particle_Color;
varying highp float Interp_Particle_Size;
varying highp float Interp_Particle_Mass;
varying highp float3 Interp_Particle_Velocity;
varying highp float3 Interp_Particle_Position;
varying highp float Interp_Particle_Life;
varying highp float Interp_Particle_Age;
varying highp float Interp_Particle_Dead;



//--------------------------------------------------------


#ifdef asdf_____USE_16_BIT_TEXTURES
#define ssENCODE_TO_TARGET0( Value, Min, Max ) fragOut[0] = remap( Value, 0, 65534 );
#define ssENCODE_TO_TARGET1( Value, Min, Max ) fragOut[1] = remap( Value, 0, 65534 );
#define ssENCODE_TO_TARGET2( Value, Min, Max ) fragOut[2] = remap( Value, 0, 65534 );
#define ssENCODE_TO_TARGET3( Value, Min, Max ) fragOut[3] = remap( Value, 0, 65534 );
#else
#define ssENCODE_TO_TARGET0( Value, Min, Max ) rt0 = ssEncodeFloat32( Value, Min, Max );
#define ssENCODE_TO_TARGET1( Value, Min, Max ) rt1 = ssEncodeFloat32( Value, Min, Max );
#define ssENCODE_TO_TARGET2( Value, Min, Max ) rt2 = ssEncodeFloat32( Value, Min, Max );
#define ssENCODE_TO_TARGET3( Value, Min, Max ) rt3 = ssEncodeFloat32( Value, Min, Max );
#endif


//-----------------------------------------------------------------------


int ngsModInt( int x, int y )
{
	return x - ( ( x / y ) * y );
}


//-----------------------------------------------------------------------


void ssDecodeParticle( int InstanceID )
{
	gParticle.Position   = vec3( 0.0 );
	gParticle.Velocity   = vec3( 0.0 );
	gParticle.Color      = vec4( 0.0 );
	gParticle.Size       = 0.0; 
	gParticle.Age        = 0.0;
	gParticle.Life       = 0.0;
	gParticle.Mass       = 1.0;
	gParticle.Quaternion = vec4( 0.0 );
	gParticle.Matrix     = mat3( 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssCalculateDynamicAttributes( InstanceID, gParticle );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ivec2  Index2D = ivec2( ngsModInt( InstanceID * ssTEXEL_COUNT_INT, ssTARGET_SIZE_INT.x ), ( InstanceID * ssTEXEL_COUNT_INT ) / ssTARGET_SIZE_INT.x );
	float2 Coord   = ( float2( Index2D ) + 0.5 ) / ssTARGET_SIZE_FLOAT;
	float2 Offset  = float2( 1.0 / ssTARGET_SIZE_FLOAT.x, 0.0 ); 
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	vec2  uv    = vec2( 0.0 );
	float Scalar0 = 0.0;
	float Scalar1 = 0.0;
	float Scalar2 = 0.0;
	float Scalar3 = 0.0;
	float Scalar4 = 0.0;
	float Scalar5 = 0.0;
	float Scalar6 = 0.0;
	float Scalar7 = 0.0;
	float Scalar8 = 0.0;
	float Scalar9 = 0.0;
	float Scalar10 = 0.0;
	float Scalar11 = 0.0;
	float Scalar12 = 0.0;
	float Scalar13 = 0.0;
	float Scalar14 = 0.0;
	float Scalar15 = 0.0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 0.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Color.x = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), 0.0, 1.0 );
	gParticle.Color.y = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 1.0 );
	gParticle.Color.z = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), 0.0, 1.0 );
	gParticle.Color.w = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), 0.0, 1.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 1.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Size = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), 0.0, 100.0 );
	gParticle.Mass = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 1000.0 );
	gParticle.Velocity.x = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -1000.0, 1000.0 );
	gParticle.Velocity.y = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -1000.0, 1000.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 2.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Velocity.z = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), -1000.0, 1000.0 );
	gParticle.Position.x = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), -1000.0, 1000.0 );
	gParticle.Position.y = ssDecodeFloat32( vec4( Scalar8, Scalar9, Scalar10, Scalar11 ), -1000.0, 1000.0 );
	gParticle.Position.z = ssDecodeFloat32( vec4( Scalar12, Scalar13, Scalar14, Scalar15 ), -1000.0, 1000.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	uv = Coord + Offset * 3.0;
	{ vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, uv, 0.0); Scalar0  = renderTarget0Sample.x; Scalar1  = renderTarget0Sample.y; Scalar2  = renderTarget0Sample.z; Scalar3  = renderTarget0Sample.w; }
	{ vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, uv, 0.0); Scalar4  = renderTarget1Sample.x; Scalar5  = renderTarget1Sample.y; Scalar6  = renderTarget1Sample.z; Scalar7  = renderTarget1Sample.w; }
	{ vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, uv, 0.0); Scalar8  = renderTarget2Sample.x; Scalar9  = renderTarget2Sample.y; Scalar10 = renderTarget2Sample.z; Scalar11 = renderTarget2Sample.w; }
	{ vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, uv, 0.0); Scalar12 = renderTarget3Sample.x; Scalar13 = renderTarget3Sample.y; Scalar14 = renderTarget3Sample.z; Scalar15 = renderTarget3Sample.w; }
	
	gParticle.Life = ssDecodeFloat32( vec4( Scalar0, Scalar1, Scalar2, Scalar3 ), 0.0, 8.0 );
	gParticle.Age = ssDecodeFloat32( vec4( Scalar4, Scalar5, Scalar6, Scalar7 ), 0.0, 8.0 );
	gParticle.Dead = ssDecodeFloat8( Scalar8, 0.0, 255.0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssPRECISION_LIMITER2( gParticle.Velocity )
	ssPRECISION_LIMITER2( gParticle.Position )
	ssPRECISION_LIMITER2( gParticle.Color )
	ssPRECISION_LIMITER2( gParticle.Size )
	ssPRECISION_LIMITER2( gParticle.Mass )
	ssPRECISION_LIMITER2( gParticle.Life )
}


//--------------------------------------------------------


void ssEncodeParticle( float2 Coord, out vec4 rt0, out vec4 rt1, out vec4 rt2, out vec4 rt3 )
{
	#ifdef FRAGMENT_SHADER
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	int TexelIndex = int( floor( Coord.x * ssTEXEL_COUNT_FLOAT ) );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	vec4  Vector = vec4( 0.0 );
	float Scalar0 = 0.0;
	float Scalar1 = 0.0;
	float Scalar2 = 0.0;
	float Scalar3 = 0.0;
	float Scalar4 = 0.0;
	float Scalar5 = 0.0;
	float Scalar6 = 0.0;
	float Scalar7 = 0.0;
	float Scalar8 = 0.0;
	float Scalar9 = 0.0;
	float Scalar10 = 0.0;
	float Scalar11 = 0.0;
	float Scalar12 = 0.0;
	float Scalar13 = 0.0;
	float Scalar14 = 0.0;
	float Scalar15 = 0.0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( TexelIndex == 0 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.x, 0.0, 1.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.y, 0.0, 1.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.z, 0.0, 1.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Color.w, 0.0, 1.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 1 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Size, 0.0, 100.0 );            Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Mass, 0.0, 1000.0 );           Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.x, -1000.0, 1000.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.y, -1000.0, 1000.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 2 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Velocity.z, -1000.0, 1000.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.x, -1000.0, 1000.0 ); Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.y, -1000.0, 1000.0 ); Scalar8 = Vector.x; Scalar9 = Vector.y; Scalar10 = Vector.z; Scalar11 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Position.z, -1000.0, 1000.0 ); Scalar12 = Vector.x; Scalar13 = Vector.y; Scalar14 = Vector.z; Scalar15 = Vector.w;
	}
	else if ( TexelIndex == 3 )
	{
		Vector.xyzw = ssEncodeFloat32( gParticle.Life, 0.0, 8.0 ); Scalar0 = Vector.x; Scalar1 = Vector.y; Scalar2 = Vector.z; Scalar3 = Vector.w;
		Vector.xyzw = ssEncodeFloat32( gParticle.Age, 0.0, 8.0 );  Scalar4 = Vector.x; Scalar5 = Vector.y; Scalar6 = Vector.z; Scalar7 = Vector.w;
		Vector.x = ssEncodeFloat8( gParticle.Dead, 0.0, 255.0 );   Scalar8 = Vector.x;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	rt0 = vec4( Scalar0,  Scalar1,  Scalar2,  Scalar3 ); 
	rt1 = vec4( Scalar4,  Scalar5,  Scalar6,  Scalar7 ); 
	rt2 = vec4( Scalar8,  Scalar9,  Scalar10, Scalar11 ); 
	rt3 = vec4( Scalar12, Scalar13, Scalar14, Scalar15 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	//rt0 = rt1 = rt2 = rt3 = vec4( float( TexelIndex ) / max( ssTEXEL_COUNT_FLOAT - 1.0, 1.0 ), 0.0, 0.0, 1.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#endif
}


//-----------------------------------------------------------------------

#ifndef saturate // HACK 05/15/2019: SAMPLETEX() uses saturate(), but core doesn't define it. This can be removed after Core 10.59.
#define saturate(A) clamp(A, 0.0, 1.0)
#endif

//-----------------------------------------------------------------------


// Material Parameters ( Tweaks )

uniform bool                        isIdle;       // Title: Is Idle
uniform NF_PRECISION                float3        influencePosition; // Title: Influence Position
uniform bool                        isAttracting; // Title: Is Attracting
SC_DECLARE_TEXTURE_3D(noiseTex); // Title:        3D Noise Texture
uniform NF_PRECISION                float4        colorA; // Title: Color A
uniform NF_PRECISION                float4        colorB; // Title: Color B
uniform NF_PRECISION                float4        colorC; // Title: Color C
uniform NF_PRECISION                float4        colorD; // Title: Color D
uniform NF_PRECISION                float4        colorE; // Title: Color E	


// Uniforms ( Ports )

#if defined( STUDIO )
uniform NF_PRECISION float Port_TimeBias_N052;
uniform NF_PRECISION float Port_ValueA_N052;
uniform NF_PRECISION float Port_TimeA_N052;
uniform NF_PRECISION float Port_TimeTransition_N052;
uniform NF_PRECISION float Port_ValueB_N052;
uniform NF_PRECISION float Port_TimeB_N052;
uniform NF_PRECISION float Port_Input1_N053;
uniform NF_PRECISION float3 Port_Import_N216;
uniform NF_PRECISION float3 Port_Min_N213;
uniform NF_PRECISION float3 Port_Max_N213;
uniform NF_PRECISION float Port_Min_N254;
uniform NF_PRECISION float Port_Max_N254;
uniform NF_PRECISION float Port_Input1_N021;
uniform NF_PRECISION float Port_Input1_N067;
uniform NF_PRECISION float Port_Input2_N067;
uniform NF_PRECISION float Port_Import_N214;
uniform NF_PRECISION float3 Port_Import_N212;
uniform NF_PRECISION float3 Port_Import_N075;
uniform NF_PRECISION float3 Port_Import_N076;
uniform NF_PRECISION float Port_Import_N062;
uniform NF_PRECISION float Port_Import_N058;
uniform NF_PRECISION float3 Port_Import_N059;
uniform NF_PRECISION float3 Port_Input2_N060;
uniform NF_PRECISION float Port_Import_N099;
uniform NF_PRECISION float Port_Import_N109;
uniform NF_PRECISION float3 Port_Import_N081;
uniform NF_PRECISION float Port_RangeMinA_N178;
uniform NF_PRECISION float Port_RangeMaxA_N178;
uniform NF_PRECISION float Port_RangeMinB_N178;
uniform NF_PRECISION float Port_RangeMaxB_N178;
uniform NF_PRECISION float Port_Import_N087;
uniform NF_PRECISION float Port_Value4_N102;
uniform NF_PRECISION float Port_Value4_N117;
uniform NF_PRECISION float Port_Value4_N126;
uniform NF_PRECISION float4 Port_Column3_N127;
uniform NF_PRECISION float Port_RangeMinA_N133;
uniform NF_PRECISION float Port_RangeMaxA_N133;
uniform NF_PRECISION float Port_Input1_N114;
uniform NF_PRECISION float Port_Input2_N114;
uniform NF_PRECISION float Port_RangeMaxB_N133;
uniform NF_PRECISION float Port_Input1_N018;
uniform NF_PRECISION float Port_Input1_N066;
uniform NF_PRECISION float Port_Input2_N066;
uniform NF_PRECISION float Port_Import_N308;
uniform NF_PRECISION float3 Port_Import_N309;
uniform NF_PRECISION float Port_Input1_N237;
uniform NF_PRECISION float Port_Input1_N201;
uniform NF_PRECISION float Port_Input2_N201;
uniform NF_PRECISION float3 Port_Import_N202;
uniform NF_PRECISION float3 Port_Import_N205;
uniform NF_PRECISION float3 Port_Import_N206;
uniform NF_PRECISION float Port_Multiplier_N207;
uniform NF_PRECISION float3 Port_Import_N210;
uniform NF_PRECISION float Port_Input1_N222;
uniform NF_PRECISION float Port_Input1_N229;
uniform NF_PRECISION float Port_Import_N049;
uniform NF_PRECISION float Port_Import_N051;
uniform NF_PRECISION float Port_Import_N050;
uniform NF_PRECISION float Port_Input4_N224;
uniform NF_PRECISION float Port_Input1_N241;
uniform NF_PRECISION float Port_Input1_N200;
uniform NF_PRECISION float Port_Input2_N200;
uniform NF_PRECISION float Port_Import_N150;
uniform NF_PRECISION float Port_Input1_N063;
uniform NF_PRECISION float Port_Input2_N063;
uniform NF_PRECISION float Port_Import_N155;
uniform NF_PRECISION float Port_Input1_N008;
uniform NF_PRECISION float4 Port_Input1_N065;
uniform NF_PRECISION float Port_Min_N019;
uniform NF_PRECISION float Port_Max_N019;
uniform NF_PRECISION float Port_Input1_N166;
uniform NF_PRECISION float Port_Input1_N164;
uniform NF_PRECISION float Port_Input1_N165;
uniform NF_PRECISION float Port_Input2_N165;
uniform NF_PRECISION float Port_Position1_N172;
uniform NF_PRECISION float Port_Position2_N172;
uniform NF_PRECISION float Port_Position3_N172;
uniform NF_PRECISION float Port_Import_N079;
uniform NF_PRECISION float Port_Import_N091;
uniform NF_PRECISION float Port_Import_N191;
uniform NF_PRECISION float Port_Input0_N143;
uniform NF_PRECISION float Port_Input1_N266;
uniform NF_PRECISION float Port_Input2_N266;
uniform NF_PRECISION float Port_Import_N185;
uniform NF_PRECISION float Port_Import_N138;
uniform NF_PRECISION float Port_Input1_N182;
uniform NF_PRECISION float Port_Input2_N182;
uniform NF_PRECISION float Port_Input0_N193;
uniform NF_PRECISION float Port_Import_N188;
uniform NF_PRECISION float Port_Import_N192;
uniform NF_PRECISION float Port_Input1_N236;
uniform NF_PRECISION float Port_Input2_N236;
#endif	



//-----------------------------------------------------------------------

#ifdef VERTEX_SHADER

//----------

// Globals

struct ssGlobals
{
	float gTimeElapsed;
	float gTimeDelta;
	float gTimeElapsedShifted;
	
	
};

ssGlobals tempGlobals;
#define scCustomCodeUniform	

//----------

// Functions

void Node61_Spawn_Particle_World_Space( ssGlobals Globals )
{ 
	ssCalculateParticleSeed( gParticle );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	float DividerF = floor( sqrt( ssPARTICLE_COUNT_1D_FLOAT ) );
	int   DividerI = int( DividerF );
	
	gParticle.Position   = vec3( float( ngsModInt( gParticle.Index1D, DividerI ) ) / DividerF * 2.0 - 1.0, float( gParticle.Index1D / DividerI ) / DividerF * 2.0 - 1.0, 0.0 ) * 20.0 + vec3( 1.0, 1.0, 0.0 );
	gParticle.Velocity   = vec3( 0.0 );
	gParticle.Color	     = vec4( 1.0 ); 
	gParticle.Dead       = 0.0;
	gParticle.Age        = 0.0;
	gParticle.Life       = ssPARTICLE_LIFE_MAX;  
	gParticle.Size       = 1.0;//mix( 0.4, 0.8, rand( vec2( gParticle.Seed, 0.3453 ) ) );
	gParticle.Mass	     = 1.0; 
	gParticle.Quaternion = vec4( 0.0, 0.0, 0.0, 1.0 );
	gParticle.Matrix     = mat3( 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 );
}
void Node238_Bool_Parameter( out float Output, ssGlobals Globals ) { Output = ( isIdle ) ? 1.0 : 0.0; }
void Node52_Fluctuate( in float TimeBias, in float ValueA, in float TimeA, in float TimeTransition, in float ValueB, in float TimeB, out float Value, ssGlobals Globals )
{ 
	float TimeTotal  = TimeA + TimeTransition + TimeB + 0.0001; // increase by small amount since smoothstep( 0.5, 0.5, x ) acts weird...
	float TimeRatio1 = TimeA / TimeTotal;
	float TimeRatio2 = 1.0 - TimeB / TimeTotal;
	float Transition = mod( Globals.gTimeElapsedShifted / TimeTotal + TimeBias, 1.0 ) * 2.0 - 1.0;
	float Ratio 	 = abs( Transition );
	Value = mix( ValueA, ValueB, smoothstep( TimeRatio1, TimeRatio2, Ratio ) );
}
#define Node53_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node54_Swizzle( Input, Output, Globals ) Output = float3( Input.x, Input.y, 0.0 )
void Node24_Float_Parameter( out float3 Output, ssGlobals Globals ) { Output = influencePosition; }
void Node148_Conditional( in float Input0, in float3 Input1, in float3 Input2, out float3 Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		/* Input port: "Input1"  */
		
		{
			float Value_N52 = 0.0; Node52_Fluctuate( NF_PORT_CONSTANT( float( 1.0 ), Port_TimeBias_N052 ), NF_PORT_CONSTANT( float( -1.0 ), Port_ValueA_N052 ), NF_PORT_CONSTANT( float( 0.0 ), Port_TimeA_N052 ), NF_PORT_CONSTANT( float( 4.0 ), Port_TimeTransition_N052 ), NF_PORT_CONSTANT( float( 1.0 ), Port_ValueB_N052 ), NF_PORT_CONSTANT( float( 0.0 ), Port_TimeB_N052 ), Value_N52, Globals );
			float Output_N53 = 0.0; Node53_Multiply( Value_N52, NF_PORT_CONSTANT( float( 6.0 ), Port_Input1_N053 ), Output_N53, Globals );
			float3 Output_N54 = float3(0.0); Node54_Swizzle( float2( Output_N53 ), Output_N54, Globals );
			
			Input1 = Output_N54;
		}
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float3 Output_N24 = float3(0.0); Node24_Float_Parameter( Output_N24, Globals );
			
			Input2 = Output_N24;
		}
		Output = Input2; 
	}
}
#define Node216_Float_Import( Import, Value, Globals ) Value = Import
void Node213_Particle_Random( in float3 Min, in float3 Max, out float3 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 3, true, true, true, 213.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.xyz );
}
#define Node253_Length( Input0, Output, Globals ) Output = length( Input0 )
#define Node255_Divide( Input0, Input1, Output, Globals ) Output = Input0 / float3(Input1)
void Node254_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 254.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node257_Sqrt( Input0, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : sqrt( Input0 )
#define Node260_Sqrt( Input0, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : sqrt( Input0 )
void Node149_Bool_Parameter( out float Output, ssGlobals Globals ) { Output = ( isAttracting ) ? 1.0 : 0.0; }
void Node67_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
void Node21_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float Output_N67 = 0.0; Node67_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 10.0 ), Port_Input1_N067 ), NF_PORT_CONSTANT( float( 5.0 ), Port_Input2_N067 ), Output_N67, Globals );
			
			Input2 = Output_N67;
		}
		Output = Input2; 
	}
}
#define Node214_Float_Import( Import, Value, Globals ) Value = Import
#define Node212_Float_Import( Import, Value, Globals ) Value = Import
#define Node256_Multiply( Input0, Input1, Input2, Input3, Output, Globals ) Output = Input0 * float3(Input1) * float3(Input2) * Input3
#define Node215_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node219_Modify_Attribute_Set_Position( Value, Globals ) gParticle.Position = Value
#define Node75_Float_Import( Import, Value, Globals ) Value = Import
#define Node76_Float_Import( Import, Value, Globals ) Value = Import
void Node77_Particle_Random( in float3 Min, in float3 Max, out float3 Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 3, true, true, true, 77.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.xyz );
}
#define Node82_Modify_Attribute_Add_Velocity( Value, Globals ) gParticle.Velocity += Value
#define Node62_Float_Import( Import, Value, Globals ) Value = Import
#define Node58_Float_Import( Import, Value, Globals ) Value = Import
#define Node59_Float_Import( Import, Value, Globals ) Value = Import
#define Node279_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Position
#define Node281_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - Input1
void Node282_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
#define Node283_Multiply( Input0, Input1, Output, Globals ) Output = float3(Input0) * Input1
void Node60_Conditional( in float Input0, in float3 Input1, in float3 Input2, out float3 Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		float Value_N62 = 0.0; Node62_Float_Import( Output_N238, Value_N62, Globals );
		
		Input0 = Value_N62;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		/* Input port: "Input1"  */
		
		{
			float Value_N58 = 0.0; Node58_Float_Import( NF_PORT_CONSTANT( float( 500.0 ), Port_Import_N058 ), Value_N58, Globals );
			float3 Output_N148 = float3(0.0); Node148_Conditional( float( 1.0 ), float3( 0.0, 0.0, 0.0 ), float3( 0.0, 0.0, 0.0 ), Output_N148, Globals );
			float3 Value_N59 = float3(0.0); Node59_Float_Import( Output_N148, Value_N59, Globals );
			float3 Value_N279 = float3(0.0); Node279_Particle_Get_Attribute( Value_N279, Globals );
			float3 Output_N281 = float3(0.0); Node281_Subtract( Value_N59, Value_N279, Output_N281, Globals );
			float3 Output_N282 = float3(0.0); Node282_Normalize( Output_N281, Output_N282, Globals );
			float3 Output_N283 = float3(0.0); Node283_Multiply( Value_N58, Output_N282, Output_N283, Globals );
			
			Input1 = Output_N283;
		}
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
#define Node276_Modify_Attribute_Add_Force( Value, Globals ) gParticle.Force += Value
#define Node99_Float_Import( Import, Value, Globals ) Value = Import
#define Node109_Float_Import( Import, Value, Globals ) Value = Import
void Node110_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, true, true, true, 110.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
void Node111_Modify_Attribute_Set_Mass( in float Value, ssGlobals Globals )
{ 
	gParticle.Mass = Value;
	
	gParticle.Mass = max( 0.00001, gParticle.Mass );
}
void SpawnParticle( ssGlobals Globals )
{
	Node61_Spawn_Particle_World_Space( Globals );
	float3 Output_N148 = float3(0.0); Node148_Conditional( float( 1.0 ), float3( 0.0, 0.0, 0.0 ), float3( 0.0, 0.0, 0.0 ), Output_N148, Globals );
	float3 Value_N216 = float3(0.0); Node216_Float_Import( Output_N148, Value_N216, Globals );
	float3 Random_N213 = float3(0.0); Node213_Particle_Random( NF_PORT_CONSTANT( float3( -1.0, -1.0, -1.0 ), Port_Min_N213 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_Max_N213 ), Random_N213, Globals );
	float Output_N253 = 0.0; Node253_Length( Random_N213, Output_N253, Globals );
	float3 Output_N255 = float3(0.0); Node255_Divide( Random_N213, Output_N253, Output_N255, Globals );
	float Random_N254 = 0.0; Node254_Particle_Random( NF_PORT_CONSTANT( float( 0.0 ), Port_Min_N254 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Max_N254 ), Random_N254, Globals );
	float Output_N257 = 0.0; Node257_Sqrt( Random_N254, Output_N257, Globals );
	float Output_N260 = 0.0; Node260_Sqrt( Output_N257, Output_N260, Globals );
	float Output_N21 = 0.0; Node21_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input1_N021 ), float( 10.0 ), Output_N21, Globals );
	float Value_N214 = 0.0; Node214_Float_Import( Output_N21, Value_N214, Globals );
	float3 Value_N212 = float3(0.0); Node212_Float_Import( NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_Import_N212 ), Value_N212, Globals );
	float3 Output_N256 = float3(0.0); Node256_Multiply( Output_N255, Output_N260, Value_N214, Value_N212, Output_N256, Globals );
	float3 Output_N215 = float3(0.0); Node215_Add( Value_N216, Output_N256, Output_N215, Globals );
	Node219_Modify_Attribute_Set_Position( Output_N215, Globals );
	float3 Value_N75 = float3(0.0); Node75_Float_Import( NF_PORT_CONSTANT( float3( 0.5, 0.5, 0.5 ), Port_Import_N075 ), Value_N75, Globals );
	float3 Value_N76 = float3(0.0); Node76_Float_Import( NF_PORT_CONSTANT( float3( -0.5, -0.5, -0.5 ), Port_Import_N076 ), Value_N76, Globals );
	float3 Random_N77 = float3(0.0); Node77_Particle_Random( Value_N75, Value_N76, Random_N77, Globals );
	Node82_Modify_Attribute_Add_Velocity( Random_N77, Globals );
	float3 Output_N60 = float3(0.0); Node60_Conditional( float( 1.0 ), float3( 1.0, 1.0, 1.0 ), NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Input2_N060 ), Output_N60, Globals );
	Node276_Modify_Attribute_Add_Force( Output_N60, Globals );
	float Value_N99 = 0.0; Node99_Float_Import( NF_PORT_CONSTANT( float( 8.0 ), Port_Import_N099 ), Value_N99, Globals );
	float Value_N109 = 0.0; Node109_Float_Import( NF_PORT_CONSTANT( float( 15.0 ), Port_Import_N109 ), Value_N109, Globals );
	float Random_N110 = 0.0; Node110_Particle_Random( Value_N99, Value_N109, Random_N110, Globals );
	Node111_Modify_Attribute_Set_Mass( Random_N110, Globals );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	gParticle.Velocity += gParticle.Force / gParticle.Mass * 0.03333; // make sure the velocity added on spawn is always the same...
	gParticle.Force = vec3( 0.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* no need to transform */
}
#define Node25_Particle_Spawn_End( Globals ) /*nothing*/
#define Node85_Update_Particle_World_Space( Globals ) // does nothing
#define Node81_Float_Import( Import, Value, Globals ) Value = Import
void Node84_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
void Node86_Split_Vector( in float3 Value, out float Value1, out float Value2, out float Value3, ssGlobals Globals )
{ 
	Value1 = Value.x;
	Value2 = Value.y;
	Value3 = Value.z;
}
#define Node176_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Position
#define Node177_Length( Input0, Output, Globals ) Output = length( Input0 )
void Node178_Remap( in float ValueIn, out float ValueOut, in float RangeMinA, in float RangeMaxA, in float RangeMinB, in float RangeMaxB, ssGlobals Globals )
{ 
	ValueOut = ( ( ValueIn - RangeMinA ) / ( RangeMaxA - RangeMinA ) ) * ( RangeMaxB - RangeMinB ) + RangeMinB;
	ValueOut = ( RangeMaxB > RangeMinB ) ? clamp( ValueOut, RangeMinB, RangeMaxB ) : clamp( ValueOut, RangeMaxB, RangeMinB );
}
#define Node87_Float_Import( Import, Value, Globals ) Value = Import
#define Node88_Cos( Input0, Output, Globals ) Output = cos( Input0 )
#define Node90_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
#define Node92_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node93_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node94_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node95_Sin( Input0, Output, Globals ) Output = sin( Input0 )
#define Node96_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node97_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - Input1
#define Node98_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node100_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node101_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node102_Construct_Vector( Value1, Value2, Value3, Value4, Value, Globals ) Value.x = Value1; Value.y = Value2; Value.z = Value3; Value.w = Value4
#define Node103_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node104_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node105_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node106_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node107_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node108_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node115_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node116_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - Input1
#define Node117_Construct_Vector( Value1, Value2, Value3, Value4, Value, Globals ) Value.x = Value1; Value.y = Value2; Value.z = Value3; Value.w = Value4
#define Node118_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node119_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node120_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - Input1
#define Node121_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node122_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node123_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node124_Multiply( Input0, Input1, Input2, Output, Globals ) Output = Input0 * Input1 * Input2
#define Node125_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node126_Construct_Vector( Value1, Value2, Value3, Value4, Value, Globals ) Value.x = Value1; Value.y = Value2; Value.z = Value3; Value.w = Value4
#define Node127_Construct_Matrix( Column0, Column1, Column2, Column3, Matrix, Globals ) Matrix = mat4( Column0, Column1, Column2, Column3 )
#define Node128_Matrix_Export( Value, Export, Globals ) Export = Value
#define Node130_Transform_by_Matrix( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node131_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - Input1
#define Node132_Particle_Get_Attribute( Value, Globals ) Value = clamp( gParticle.Age / gParticle.Life, 0.0, 1.0 )
void Node114_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
#define Node133_Remap( ValueIn, ValueOut, RangeMinA, RangeMaxA, RangeMinB, RangeMaxB, Globals ) ValueOut = ( ( ValueIn - RangeMinA ) / ( RangeMaxA - RangeMinA ) ) * ( RangeMaxB - RangeMinB ) + RangeMinB
#define Node134_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * float3(Input1)
void Node73_Modify_Attribute_Set_Force( in float Enabled, in float3 Value, ssGlobals Globals )
{ 
	if ( Enabled != 0.0 )
	{
		gParticle.Force = Value;	
	}
}
void Node66_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
void Node18_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float Output_N66 = 0.0; Node66_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 30.0 ), Port_Input1_N066 ), NF_PORT_CONSTANT( float( -80.0 ), Port_Input2_N066 ), Output_N66, Globals );
			
			Input2 = Output_N66;
		}
		Output = Input2; 
	}
}
#define Node137_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Mass
#define Node136_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node308_Float_Import( Import, Value, Globals ) Value = Import
#define Node309_Float_Import( Import, Value, Globals ) Value = Import
#define Node310_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Position
#define Node311_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - Input1
void Node312_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
#define Node313_Multiply( Input0, Input1, Output, Globals ) Output = float3(Input0) * Input1
#define Node314_Modify_Attribute_Add_Force( Value, Globals ) gParticle.Force += Value
void Node201_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
void Node237_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float Output_N201 = 0.0; Node201_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 5.0 ), Port_Input1_N201 ), NF_PORT_CONSTANT( float( 600.0 ), Port_Input2_N201 ), Output_N201, Globals );
			
			Input2 = Output_N201;
		}
		Output = Input2; 
	}
}
#define Node202_Float_Import( Import, Value, Globals ) Value = Import
#define Node231_Texture_3D_Object_Parameter( Globals ) /*nothing*/
#define Node203_Texture_Object_3D_Import( Globals ) /*nothing*/
#define Node204_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Position
#define Node205_Float_Import( Import, Value, Globals ) Value = Import
#define Node206_Float_Import( Import, Value, Globals ) Value = Import
#define Node207_Elapsed_Time( Multiplier, Time, Globals ) Time = Globals.gTimeElapsedShifted * Multiplier
#define Node208_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * float3(Input1)
#define Node209_Add( Input0, Input1, Input2, Output, Globals ) Output = Input0 + Input1 + Input2
#define Node210_Float_Import( Import, Value, Globals ) Value = Import
#define Node221_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node222_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * float3(Input1)
#define Node223_Reciprocal( Input0, Output, Globals ) Output = 1.0 / Input0
#define Node227_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node228_Texture_3D_Sample( UVWCoord, Color, Globals ) Color = SC_SAMPLE_TEX_3D_LEVEL(noiseTex, UVWCoord, 0.0)
#define Node229_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * float4(Input1)
#define Node230_Subtract_One( Input0, Output, Globals ) Output = Input0 - 1.0
#define Node284_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node285_Modify_Attribute_Add_Force( Value, Globals ) gParticle.Force += Value
#define Node217_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Velocity
#define Node218_Negate( Input0, Output, Globals ) Output = -Input0
#define Node4_Length( Input0, Output, Globals ) Output = length( Input0 )
#define Node5_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * float3(Input1)
#define Node49_Float_Import( Import, Value, Globals ) Value = Import
#define Node51_Float_Import( Import, Value, Globals ) Value = Import
#define Node50_Float_Import( Import, Value, Globals ) Value = Import
#define Node224_Multiply( Input0, Input1, Input2, Input3, Input4, Output, Globals ) Output = Input0 * float3(Input1) * float3(Input2) * float3(Input3) * float3(Input4)
#define Node225_Modify_Attribute_Add_Force( Value, Globals ) gParticle.Force += Value
void Node200_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
void Node241_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float Output_N200 = 0.0; Node200_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N200 ), NF_PORT_CONSTANT( float( 3.0 ), Port_Input2_N200 ), Output_N200, Globals );
			
			Input2 = Output_N200;
		}
		Output = Input2; 
	}
}
#define Node150_Float_Import( Import, Value, Globals ) Value = Import
void Node63_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
#define Node155_Float_Import( Import, Value, Globals ) Value = Import
#define Node175_Particle_Get_Attribute( Value, Globals ) Value = clamp( gParticle.Age / gParticle.Life, 0.0, 1.0 )
#define Node179_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, Input2 )
#define Node180_Modify_Attribute_Set_Size( Value, Globals ) gParticle.Size = Value
void Node19_Particle_Random( in float Min, in float Max, out float Random, ssGlobals Globals )
{ 
	vec4 RandomVec4 = ssGetParticleRandom( 1, false, true, true, 19.0, gParticle.Seed2000, 1.0, Globals.gTimeElapsed );
	Random = mix( Min, Max, RandomVec4.x );
}
#define Node166_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node162_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Position
#define Node30_Distance( Input0, Input1, Output, Globals ) Output = distance( Input0, Input1 )
#define Node164_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node244_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node32_Add( Input0, Input1, Output, Globals ) Output = Input0 + Input1
#define Node165_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
void Node9_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = colorA; }
void Node10_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = colorB; }
void Node12_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = colorC; }
void Node16_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = colorD; }
void Node17_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = colorE; }
void Node172_Gradient( in float Ratio, in float4 Value0, in float Position1, in float4 Value1, in float Position2, in float4 Value2, in float Position3, in float4 Value3, in float4 Value4, out float4 Value, ssGlobals Globals )
{ 
	Ratio = clamp( Ratio, 0.0, 1.0 );
	
	if ( Ratio < Position1 )
	{
		Value = mix( Value0, Value1, clamp( Ratio / Position1, 0.0, 1.0 ) );
	}
	
	else if ( Ratio < Position2 )
	{
		Value = mix( Value1, Value2, clamp( ( Ratio - Position1 ) / ( Position2 - Position1 ), 0.0, 1.0 ) );
	}
	
	else if ( Ratio < Position3 )
	{
		Value = mix( Value2, Value3, clamp( ( Ratio - Position2 ) / ( Position3 - Position2 ), 0.0, 1.0 ) );
	}
	
	else
	{
		Value = mix( Value3, Value4, clamp( ( Ratio - Position3 ) / ( 1.0 - Position3 ), 0.0, 1.0 ) );
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
	
	NF_PREVIEW_SAVE( Value, 172, false )
}
void Node65_Conditional( in float Input0, in float4 Input1, in float4 Input2, out float4 Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float Random_N19 = 0.0; Node19_Particle_Random( NF_PORT_CONSTANT( float( 0.0 ), Port_Min_N019 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Max_N019 ), Random_N19, Globals );
			float Output_N166 = 0.0; Node166_Multiply( Random_N19, NF_PORT_CONSTANT( float( 0.2 ), Port_Input1_N166 ), Output_N166, Globals );
			float3 Output_N24 = float3(0.0); Node24_Float_Parameter( Output_N24, Globals );
			float3 Value_N162 = float3(0.0); Node162_Particle_Get_Attribute( Value_N162, Globals );
			float Output_N30 = 0.0; Node30_Distance( Output_N24, Value_N162, Output_N30, Globals );
			float Output_N164 = 0.0; Node164_Multiply( Output_N30, NF_PORT_CONSTANT( float( 0.05 ), Port_Input1_N164 ), Output_N164, Globals );
			float Output_N244 = 0.0; Node244_Multiply( Output_N164, Random_N19, Output_N244, Globals );
			float Output_N32 = 0.0; Node32_Add( Output_N166, Output_N244, Output_N32, Globals );
			float Output_N165 = 0.0; Node165_Clamp( Output_N32, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N165 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N165 ), Output_N165, Globals );
			float4 Output_N9 = float4(0.0); Node9_Color_Parameter( Output_N9, Globals );
			float4 Output_N10 = float4(0.0); Node10_Color_Parameter( Output_N10, Globals );
			float4 Output_N12 = float4(0.0); Node12_Color_Parameter( Output_N12, Globals );
			float4 Output_N16 = float4(0.0); Node16_Color_Parameter( Output_N16, Globals );
			float4 Output_N17 = float4(0.0); Node17_Color_Parameter( Output_N17, Globals );
			float4 Value_N172 = float4(0.0); Node172_Gradient( Output_N165, Output_N9, NF_PORT_CONSTANT( float( 0.47 ), Port_Position1_N172 ), Output_N10, NF_PORT_CONSTANT( float( 0.79 ), Port_Position2_N172 ), Output_N12, NF_PORT_CONSTANT( float( 0.84 ), Port_Position3_N172 ), Output_N16, Output_N17, Value_N172, Globals );
			
			Input2 = Value_N172;
		}
		Output = Input2; 
	}
}
void Node8_Conditional( in float Input0, in float Input1, in float4 Input2, out float4 Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N238 = 0.0; Node238_Bool_Parameter( Output_N238, Globals );
		
		Input0 = Output_N238;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = float4(Input1); 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float4 Output_N65 = float4(0.0); Node65_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float4( 1.0, 1.0, 1.0, 1.0 ), Port_Input1_N065 ), float4( 1.0, 1.0, 1.0, 1.0 ), Output_N65, Globals );
			
			Input2 = Output_N65;
		}
		Output = Input2; 
	}
}
#define Node6_Modify_Attribute_Set_Color( Value, Globals ) gParticle.Color = Value
#define Node78_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Color
#define Node79_Float_Import( Import, Value, Globals ) Value = Import
#define Node91_Float_Import( Import, Value, Globals ) Value = Import
#define Node183_Particle_Get_Attribute( Value, Globals ) Value = clamp( gParticle.Age / gParticle.Life, 0.0, 1.0 )
#define Node191_Float_Import( Import, Value, Globals ) Value = Import
void Node266_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		
		Output = Input2; 
	}
}
#define Node185_Float_Import( Import, Value, Globals ) Value = Import
#define Node186_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Life
#define Node187_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node138_Float_Import( Import, Value, Globals ) Value = Import
#define Node143_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node144_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node182_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node184_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
#define Node188_Float_Import( Import, Value, Globals ) Value = Import
#define Node189_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node192_Float_Import( Import, Value, Globals ) Value = Import
#define Node193_Divide( Input0, Input1, Output, Globals ) Output = Input0 / Input1
#define Node194_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node236_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node195_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node196_Float_Export( Value, Export, Globals ) Export = Value
#define Node239_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, Input2 )
#define Node242_Construct_Vector( Value1, Value2, Value, Globals ) Value.xyz = Value1; Value.w = Value2
#define Node197_Modify_Attribute_Set_Color( Value, Globals ) gParticle.Color = Value

//-----------------------------------------------------------------------

void main() 
{
	sc_Vertex_t v = sc_LoadVertexAttributes();
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( sc_IsEditor )
	{
		v.texture0.x += _sc_allow16TexturesMarker;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	int InstanceID = sc_LocalInstanceID;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssDecodeParticle( InstanceID );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssGlobals Globals;
	Globals.gTimeElapsed        = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : sc_TimeElapsed;
	Globals.gTimeDelta          = ( overrideTimeEnabled == 1 ) ? overrideTimeDelta : max( sc_TimeDelta, ssDELTA_TIME_MIN );
	Globals.gTimeElapsedShifted = Globals.gTimeElapsed - gParticle.TimeShift * Globals.gTimeDelta - 0.0;
	
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* Warmup */
	
	float Warmup = 0.0;
	float Delay  = 0.0;
	
	#if 0
	
	Warmup = 1.0;
	
	int Frames = 1;
	if ( ngsFrame < 2 )
	{
		Globals.gTimeDelta = 0.0333333;
		Globals.gTimeElapsed -= 1.0;
		Globals.gTimeElapsedShifted -= 1.0;
		Frames = 30;
	}
	
	for ( int i = 0; i < Frames; i++ )
	
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	{
		#if 1 // continuous
		
		gParticle.Age = mod( Globals.gTimeElapsedShifted - gParticle.SpawnOffset, ssPARTICLE_TOTAL_LIFE_MAX );
		bool Dead = ( Globals.gTimeElapsed - gParticle.SpawnOffset < Delay - Warmup || gParticle.Age > ssPARTICLE_LIFE_MAX ) ? true : false;
		
		if ( !Dead && gParticle.Life <= 0.0001 || mod( Globals.gTimeElapsed - gParticle.SpawnOffset - Delay + Warmup, ssPARTICLE_TOTAL_LIFE_MAX ) <= Globals.gTimeDelta )
		{
			SpawnParticle( Globals );
			gParticle.Spawned = true;
		}
		
		#elif 0 // burst
		
		gParticle.Age = mod( Globals.gTimeElapsedShifted - gParticle.SpawnOffset, ssPARTICLE_TOTAL_LIFE_MAX );
		bool Dead = ( Globals.gTimeElapsed - gParticle.SpawnOffset < Delay - Warmup || gParticle.Age > ssPARTICLE_LIFE_MAX ) ? true : false;
		
		// epsilong to avoid decompression precision
		
		if ( !Dead && ( gParticle.Life < 0.0001 || mod( Globals.gTimeElapsed - gParticle.SpawnOffset - Delay + Warmup, ssPARTICLE_TOTAL_LIFE_MAX ) <= Globals.gTimeDelta ) )
		{
			SpawnParticle( Globals );
			gParticle.Spawned = true;
		}
		
		#elif 0 // once - live forever
		
		if ( gParticle.Life < 0.1 )
		{
			SpawnParticle( Globals );
			gParticle.Spawned = true;	
			gParticle.Age  = Globals.gTimeElapsedShifted;
		}
		
		gParticle.Life = 1.0;
		
		#else // once - max life
		
		gParticle.Age = Globals.gTimeElapsedShifted + 0.0;
		
		if ( gParticle.Age >= ssPARTICLE_LIFE_MAX )
		{
			gParticle.Spawned = false;
			gParticle.Life = 0.0;
			gParticle.Age  = 0.0;
		}
		else if ( gParticle.Life < 0.1 )
		{
			gParticle.Life = ssPARTICLE_LIFE_MAX;
			SpawnParticle( Globals );
			gParticle.Spawned = true;
			gParticle.Age  = 0.0;					
		}
		else 
		{
			gParticle.Age = Globals.gTimeElapsedShifted + 0.0;
		}
		
		#endif
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		// Execution Code
		
		Node25_Particle_Spawn_End( Globals );
		Node85_Update_Particle_World_Space( Globals );
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		float3 Value_N81 = float3(0.0); Node81_Float_Import( NF_PORT_CONSTANT( float3( 0.3, 1.0, 0.0 ), Port_Import_N081 ), Value_N81, Globals );
		float3 Output_N84 = float3(0.0); Node84_Normalize( Value_N81, Output_N84, Globals );
		float Value1_N86 = 0.0; float Value2_N86 = 0.0; float Value3_N86 = 0.0; Node86_Split_Vector( Output_N84, Value1_N86, Value2_N86, Value3_N86, Globals );
		float3 Value_N176 = float3(0.0); Node176_Particle_Get_Attribute( Value_N176, Globals );
		float Output_N177 = 0.0; Node177_Length( Value_N176, Output_N177, Globals );
		float ValueOut_N178 = 0.0; Node178_Remap( Output_N177, ValueOut_N178, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N178 ), NF_PORT_CONSTANT( float( 5.0 ), Port_RangeMaxA_N178 ), NF_PORT_CONSTANT( float( 1.5 ), Port_RangeMinB_N178 ), NF_PORT_CONSTANT( float( 0.2 ), Port_RangeMaxB_N178 ), Globals );
		float Value_N87 = 0.0; Node87_Float_Import( ValueOut_N178, Value_N87, Globals );
		float Output_N88 = 0.0; Node88_Cos( Value_N87, Output_N88, Globals );
		float Output_N90 = 0.0; Node90_One_Minus( Output_N88, Output_N90, Globals );
		float Output_N92 = 0.0; Node92_Multiply( Value1_N86, Value1_N86, Output_N90, Output_N92, Globals );
		float Output_N93 = 0.0; Node93_Add( Output_N92, Output_N88, Output_N93, Globals );
		float Output_N94 = 0.0; Node94_Multiply( Value1_N86, Value2_N86, Output_N90, Output_N94, Globals );
		float Output_N95 = 0.0; Node95_Sin( Value_N87, Output_N95, Globals );
		float Output_N96 = 0.0; Node96_Multiply( Value3_N86, Output_N95, Output_N96, Globals );
		float Output_N97 = 0.0; Node97_Subtract( Output_N94, Output_N96, Output_N97, Globals );
		float Output_N98 = 0.0; Node98_Multiply( Value3_N86, Value1_N86, Output_N90, Output_N98, Globals );
		float Output_N100 = 0.0; Node100_Multiply( Value2_N86, Output_N95, Output_N100, Globals );
		float Output_N101 = 0.0; Node101_Add( Output_N98, Output_N100, Output_N101, Globals );
		float4 Value_N102 = float4(0.0); Node102_Construct_Vector( Output_N93, Output_N97, Output_N101, NF_PORT_CONSTANT( float( 0.0 ), Port_Value4_N102 ), Value_N102, Globals );
		float Output_N103 = 0.0; Node103_Multiply( Value1_N86, Value2_N86, Output_N90, Output_N103, Globals );
		float Output_N104 = 0.0; Node104_Multiply( Value3_N86, Output_N95, Output_N104, Globals );
		float Output_N105 = 0.0; Node105_Add( Output_N103, Output_N104, Output_N105, Globals );
		float Output_N106 = 0.0; Node106_Multiply( Value2_N86, Value2_N86, Output_N90, Output_N106, Globals );
		float Output_N107 = 0.0; Node107_Add( Output_N106, Output_N88, Output_N107, Globals );
		float Output_N108 = 0.0; Node108_Multiply( Value2_N86, Value3_N86, Output_N90, Output_N108, Globals );
		float Output_N115 = 0.0; Node115_Multiply( Value1_N86, Output_N95, Output_N115, Globals );
		float Output_N116 = 0.0; Node116_Subtract( Output_N108, Output_N115, Output_N116, Globals );
		float4 Value_N117 = float4(0.0); Node117_Construct_Vector( Output_N105, Output_N107, Output_N116, NF_PORT_CONSTANT( float( 0.0 ), Port_Value4_N117 ), Value_N117, Globals );
		float Output_N118 = 0.0; Node118_Multiply( Value3_N86, Value1_N86, Output_N90, Output_N118, Globals );
		float Output_N119 = 0.0; Node119_Multiply( Value2_N86, Output_N95, Output_N119, Globals );
		float Output_N120 = 0.0; Node120_Subtract( Output_N118, Output_N119, Output_N120, Globals );
		float Output_N121 = 0.0; Node121_Multiply( Value2_N86, Value3_N86, Output_N90, Output_N121, Globals );
		float Output_N122 = 0.0; Node122_Multiply( Value1_N86, Output_N95, Output_N122, Globals );
		float Output_N123 = 0.0; Node123_Add( Output_N121, Output_N122, Output_N123, Globals );
		float Output_N124 = 0.0; Node124_Multiply( Value3_N86, Value3_N86, Output_N90, Output_N124, Globals );
		float Output_N125 = 0.0; Node125_Add( Output_N124, Output_N88, Output_N125, Globals );
		float4 Value_N126 = float4(0.0); Node126_Construct_Vector( Output_N120, Output_N123, Output_N125, NF_PORT_CONSTANT( float( 0.0 ), Port_Value4_N126 ), Value_N126, Globals );
		mat4 Matrix_N127 = mat4(0.0); Node127_Construct_Matrix( Value_N102, Value_N117, Value_N126, NF_PORT_CONSTANT( float4( 0.0, 0.0, 0.0, 1.0 ), Port_Column3_N127 ), Matrix_N127, Globals );
		mat4 Export_N128 = mat4(0.0); Node128_Matrix_Export( Matrix_N127, Export_N128, Globals );
		float3 Output_N130 = float3(0.0); Node130_Transform_by_Matrix( mat3( Export_N128 ), Value_N176, Output_N130, Globals );
		float3 Output_N131 = float3(0.0); Node131_Subtract( Output_N130, Value_N176, Output_N131, Globals );
		float Value_N132 = 0.0; Node132_Particle_Get_Attribute( Value_N132, Globals );
		float Output_N114 = 0.0; Node114_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 0.1 ), Port_Input1_N114 ), NF_PORT_CONSTANT( float( 20.0 ), Port_Input2_N114 ), Output_N114, Globals );
		float ValueOut_N133 = 0.0; Node133_Remap( Value_N132, ValueOut_N133, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N133 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N133 ), Output_N114, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMaxB_N133 ), Globals );
		float3 Output_N134 = float3(0.0); Node134_Multiply( Output_N131, ValueOut_N133, Output_N134, Globals );
		Node73_Modify_Attribute_Set_Force( Output_N149, Output_N134, Globals );
		float Output_N18 = 0.0; Node18_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 5.0 ), Port_Input1_N018 ), float( 50.0 ), Output_N18, Globals );
		float Value_N137 = 0.0; Node137_Particle_Get_Attribute( Value_N137, Globals );
		float Output_N136 = 0.0; Node136_Multiply( Output_N18, Value_N137, Output_N136, Globals );
		float Value_N308 = 0.0; Node308_Float_Import( Output_N136, Value_N308, Globals );
		float3 Output_N148 = float3(0.0); Node148_Conditional( float( 1.0 ), float3( 0.0, 0.0, 0.0 ), float3( 0.0, 0.0, 0.0 ), Output_N148, Globals );
		float3 Value_N309 = float3(0.0); Node309_Float_Import( Output_N148, Value_N309, Globals );
		float3 Value_N310 = float3(0.0); Node310_Particle_Get_Attribute( Value_N310, Globals );
		float3 Output_N311 = float3(0.0); Node311_Subtract( Value_N309, Value_N310, Output_N311, Globals );
		float3 Output_N312 = float3(0.0); Node312_Normalize( Output_N311, Output_N312, Globals );
		float3 Output_N313 = float3(0.0); Node313_Multiply( Value_N308, Output_N312, Output_N313, Globals );
		Node314_Modify_Attribute_Add_Force( Output_N313, Globals );
		float Output_N237 = 0.0; Node237_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 400.0 ), Port_Input1_N237 ), float( 5.0 ), Output_N237, Globals );
		float3 Value_N202 = float3(0.0); Node202_Float_Import( float3( Output_N237 ), Value_N202, Globals );
		Node231_Texture_3D_Object_Parameter( Globals );
		Node203_Texture_Object_3D_Import( Globals );
		float3 Value_N204 = float3(0.0); Node204_Particle_Get_Attribute( Value_N204, Globals );
		float3 Value_N205 = float3(0.0); Node205_Float_Import( NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Import_N205 ), Value_N205, Globals );
		float3 Value_N206 = float3(0.0); Node206_Float_Import( NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Import_N206 ), Value_N206, Globals );
		float Time_N207 = 0.0; Node207_Elapsed_Time( NF_PORT_CONSTANT( float( 1.0 ), Port_Multiplier_N207 ), Time_N207, Globals );
		float3 Output_N208 = float3(0.0); Node208_Multiply( Value_N206, Time_N207, Output_N208, Globals );
		float3 Output_N209 = float3(0.0); Node209_Add( Value_N204, Value_N205, Output_N208, Output_N209, Globals );
		float3 Value_N210 = float3(0.0); Node210_Float_Import( NF_PORT_CONSTANT( float3( 300.0, 30.0, 30.0 ), Port_Import_N210 ), Value_N210, Globals );
		float3 Output_N221 = float3(0.0); Node221_Add( Output_N209, Value_N210, Output_N221, Globals );
		float3 Output_N222 = float3(0.0); Node222_Multiply( Value_N210, NF_PORT_CONSTANT( float( 2.0 ), Port_Input1_N222 ), Output_N222, Globals );
		float3 Output_N223 = float3(0.0); Node223_Reciprocal( Output_N222, Output_N223, Globals );
		float3 Output_N227 = float3(0.0); Node227_Multiply( Output_N221, Output_N223, Output_N227, Globals );
		float4 Color_N228 = float4(0.0); Node228_Texture_3D_Sample( Output_N227, Color_N228, Globals );
		float4 Output_N229 = float4(0.0); Node229_Multiply( Color_N228, NF_PORT_CONSTANT( float( 2.0 ), Port_Input1_N229 ), Output_N229, Globals );
		float4 Output_N230 = float4(0.0); Node230_Subtract_One( Output_N229, Output_N230, Globals );
		float3 Output_N284 = float3(0.0); Node284_Multiply( Value_N202, Output_N230.xyz, Output_N284, Globals );
		Node285_Modify_Attribute_Add_Force( Output_N284, Globals );
		float3 Value_N217 = float3(0.0); Node217_Particle_Get_Attribute( Value_N217, Globals );
		float3 Output_N218 = float3(0.0); Node218_Negate( Value_N217, Output_N218, Globals );
		float Output_N4 = 0.0; Node4_Length( Value_N217, Output_N4, Globals );
		float3 Output_N5 = float3(0.0); Node5_Multiply( Output_N218, Output_N4, Output_N5, Globals );
		float Value_N49 = 0.0; Node49_Float_Import( NF_PORT_CONSTANT( float( 0.05 ), Port_Import_N049 ), Value_N49, Globals );
		float Value_N51 = 0.0; Node51_Float_Import( NF_PORT_CONSTANT( float( 1.2 ), Port_Import_N051 ), Value_N51, Globals );
		float Value_N50 = 0.0; Node50_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N050 ), Value_N50, Globals );
		float3 Output_N224 = float3(0.0); Node224_Multiply( Output_N5, Value_N49, Value_N51, Value_N50, NF_PORT_CONSTANT( float( 0.5 ), Port_Input4_N224 ), Output_N224, Globals );
		Node225_Modify_Attribute_Add_Force( Output_N224, Globals );
		float Output_N241 = 0.0; Node241_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N241 ), float( 3.0 ), Output_N241, Globals );
		float Value_N150 = 0.0; Node150_Float_Import( Output_N241, Value_N150, Globals );
		float Output_N63 = 0.0; Node63_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 5.0 ), Port_Input1_N063 ), NF_PORT_CONSTANT( float( 6.0 ), Port_Input2_N063 ), Output_N63, Globals );
		float Value_N155 = 0.0; Node155_Float_Import( Output_N63, Value_N155, Globals );
		float Value_N175 = 0.0; Node175_Particle_Get_Attribute( Value_N175, Globals );
		float Output_N179 = 0.0; Node179_Mix( Value_N150, Value_N155, Value_N175, Output_N179, Globals );
		Node180_Modify_Attribute_Set_Size( Output_N179, Globals );
		float4 Output_N8 = float4(0.0); Node8_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input1_N008 ), float4( 0.5, 0.0, 0.0, 0.0 ), Output_N8, Globals );
		Node6_Modify_Attribute_Set_Color( Output_N8, Globals );
		float4 Value_N78 = float4(0.0); Node78_Particle_Get_Attribute( Value_N78, Globals );
		float Value_N79 = 0.0; Node79_Float_Import( NF_PORT_CONSTANT( float( 0.0 ), Port_Import_N079 ), Value_N79, Globals );
		float Value_N91 = 0.0; Node91_Float_Import( NF_PORT_CONSTANT( float( 1.0 ), Port_Import_N091 ), Value_N91, Globals );
		float Value_N183 = 0.0; Node183_Particle_Get_Attribute( Value_N183, Globals );
		float Value_N191 = 0.0; Node191_Float_Import( Value_N183, Value_N191, Globals );
		float Output_N266 = 0.0; Node266_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input1_N266 ), NF_PORT_CONSTANT( float( 0.3 ), Port_Input2_N266 ), Output_N266, Globals );
		float Value_N185 = 0.0; Node185_Float_Import( Output_N266, Value_N185, Globals );
		float Value_N186 = 0.0; Node186_Particle_Get_Attribute( Value_N186, Globals );
		float Output_N187 = 0.0; Node187_Divide( Value_N185, Value_N186, Output_N187, Globals );
		float Value_N138 = 0.0; Node138_Float_Import( Output_N187, Value_N138, Globals );
		float Output_N143 = 0.0; Node143_Divide( NF_PORT_CONSTANT( float( 1.0 ), Port_Input0_N143 ), Value_N138, Output_N143, Globals );
		float Output_N144 = 0.0; Node144_Multiply( Value_N191, Output_N143, Output_N144, Globals );
		float Output_N182 = 0.0; Node182_Clamp( Output_N144, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N182 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N182 ), Output_N182, Globals );
		float Output_N184 = 0.0; Node184_One_Minus( Value_N191, Output_N184, Globals );
		float Value_N188 = 0.0; Node188_Float_Import( NF_PORT_CONSTANT( float( 1.05 ), Port_Import_N188 ), Value_N188, Globals );
		float Output_N189 = 0.0; Node189_Divide( Value_N188, Value_N186, Output_N189, Globals );
		float Value_N192 = 0.0; Node192_Float_Import( Output_N189, Value_N192, Globals );
		float Output_N193 = 0.0; Node193_Divide( NF_PORT_CONSTANT( float( 1.0 ), Port_Input0_N193 ), Value_N192, Output_N193, Globals );
		float Output_N194 = 0.0; Node194_Multiply( Output_N184, Output_N193, Output_N194, Globals );
		float Output_N236 = 0.0; Node236_Clamp( Output_N194, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N236 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N236 ), Output_N236, Globals );
		float Output_N195 = 0.0; Node195_Multiply( Output_N182, Output_N236, Output_N195, Globals );
		float Export_N196 = 0.0; Node196_Float_Export( Output_N195, Export_N196, Globals );
		float Output_N239 = 0.0; Node239_Mix( Value_N79, Value_N91, Export_N196, Output_N239, Globals );
		float4 Value_N242 = float4(0.0); Node242_Construct_Vector( Value_N78.xyz, Output_N239, Value_N242, Globals );
		Node197_Modify_Attribute_Set_Color( Value_N242, Globals );
		
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		float DeltaTime = clamp( Globals.gTimeDelta, 0.0001, 0.5 );
		float Drift = 0.005;
		//vec3  Force = gParticle.Force;
		//float Mass  = gParticle.Mass;
		
		#if 1
		
		gParticle.Force.x = ( abs(gParticle.Force.x) < Drift ) ? 0.0 : gParticle.Force.x;
		gParticle.Force.y = ( abs(gParticle.Force.y) < Drift ) ? 0.0 : gParticle.Force.y;
		gParticle.Force.z = ( abs(gParticle.Force.z) < Drift ) ? 0.0 : gParticle.Force.z;
		
		gParticle.Mass = max( Drift, gParticle.Mass );
		
		#endif
		
		gParticle.Velocity += gParticle.Force / gParticle.Mass * DeltaTime;	
		
		gParticle.Velocity.x = ( abs(gParticle.Velocity.x) < Drift ) ? 0.0 : gParticle.Velocity.x;
		gParticle.Velocity.y = ( abs(gParticle.Velocity.y) < Drift ) ? 0.0 : gParticle.Velocity.y;
		gParticle.Velocity.z = ( abs(gParticle.Velocity.z) < Drift ) ? 0.0 : gParticle.Velocity.z;
		
		gParticle.Position += gParticle.Velocity * DeltaTime;	
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		#if 0
		{
			ssCalculateDynamicAttributes( InstanceID, gParticle );
			
			Globals.gTimeElapsed += Globals.gTimeDelta;
			Globals.gTimeElapsedShifted += Globals.gTimeDelta;
			
			//float ElapsedTime = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : Globals.gTimeElapsed;
			//gParticle.Seed = rand( gParticle.Coord2D + floor( ( ElapsedTime - gParticle.SpawnOffset + ssPARTICLE_LIFE_MAX * 2.0 ) / ssPARTICLE_LIFE_MAX ) * 4.32422 );
		}
		#endif
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	float2 QuadSize = vec2( ssTEXEL_COUNT_FLOAT, 1.0 ) / ssTARGET_SIZE_FLOAT;
	float2 Offset   = float2( ssParticle_Index1D_to_Index2D( sc_LocalInstanceID ) ) * QuadSize;
	float2 Vertex   = Offset + float2( v.texture0.x < 0.5 ? 0.0 : QuadSize.x, v.texture0.y < 0.5 ? 0.0 : QuadSize.y );
	
	sc_SetClipPosition( vec4( Vertex * 2.0 - 1.0, 1.0, 1.0 ) );
	
	// Write Position
	
	//float2 Index2D    = float2( mod( InstanceID, ssPARTICLE_COUNT_2D_FLOAT.x ), floor( InstanceID / ssPARTICLE_COUNT_2D_FLOAT.x ) );
	//float2 Size       = 1.0 / ssPARTICLE_COUNT_2D_FLOAT /* because quad is -1 to 1 */;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// this is to splat the data to the render target
	
	//gl_Position = float4( ( v.position.xy * 0.5 + 0.5 + /*Index2D*/ gParticle.Ratio2D ) * QuadSize * 2.0 - 1.0, 1.0, 1.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Convert Particle.Matrix to Quaternion and Position
	/*
	float Divider = 0.0;
	
	if ( Particle.m_Matrix[2][2] < 0.0 )
	{
		if ( Particle.m_Matrix[0][0] > Particle.m_Matrix[1][1] )
		{
			Divider = 1.0 + Particle.m_Matrix[0][0] - Particle.m_Matrix[1][1] - Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Divider, Particle.m_Matrix[0][1] + Particle.m_Matrix[1][0], Particle.m_Matrix[2][0] + Particle.m_Matrix[0][2], Particle.m_Matrix[1][2] - Particle.m_Matrix[2][1] );
		}
		else
		{
			Divider = 1.0 - Particle.m_Matrix[0][0] + Particle.m_Matrix[1][1] - Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Particle.m_Matrix[0][1] + Particle.m_Matrix[1][0], Divider, Particle.m_Matrix[1][2] + Particle.m_Matrix[2][1], Particle.m_Matrix[2][0] - Particle.m_Matrix[0][2] );
		}
	}
	else
	{
		if ( Particle.m_Matrix[0][0] < -Particle.m_Matrix[1][1] )
		{
			Divider = 1.0 - Particle.m_Matrix[0][0] - Particle.m_Matrix[1][1] + Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Particle.m_Matrix[2][0] + Particle.m_Matrix[0][2], Particle.m_Matrix[1][2] + Particle.m_Matrix[2][1], Divider, Particle.m_Matrix[0][1] - Particle.m_Matrix[1][0] );
		}
		else
		{ 
			Divider = 1.0 + Particle.m_Matrix[0][0] + Particle.m_Matrix[1][1] + Particle.m_Matrix[2][2];
			Particle.Quaternion = vec4( Particle.m_Matrix[1][2] - Particle.m_Matrix[2][1], Particle.m_Matrix[2][0] - Particle.m_Matrix[0][2], Particle.m_Matrix[0][1] - Particle.m_Matrix[1][0], Divider );
		}
	}
	
	Particle.Quaternion = Particle.Quaternion * 0.5 / sqrt( Divider );
	//Particle.Position   = vec3( Particle.Matrix[3][0], Particle.Matrix[3][1], Particle.Matrix[3][2] );
	*/
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Interp_Particle_Index = sc_LocalInstanceID;
	Interp_Particle_Coord = v.texture0;
	Interp_Particle_Force = gParticle.Force;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Interp_Particle_Color = gParticle.Color;
	Interp_Particle_Size = gParticle.Size;
	Interp_Particle_Mass = gParticle.Mass;
	Interp_Particle_Velocity = gParticle.Velocity;
	Interp_Particle_Position = gParticle.Position;
	Interp_Particle_Life = gParticle.Life;
	Interp_Particle_Age = gParticle.Age;
	Interp_Particle_Dead = gParticle.Dead;
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( ( overrideTimeEnabled == 1 ) && overrideTimeDelta == 0.0 )
	{
		sc_SetClipPosition( ( sc_LocalInstanceID == 0 ) ? vec4( v.texture0.xy * 2.0 - 1.0, 1.0, 1.0 ) : vec4( 0.0 ) );
		varTex0 = v.texture0.xy;
	}
}

//-----------------------------------------------------------------------

#endif // #ifdef VERTEX_SHADER

//-----------------------------------------------------------------------

#ifdef FRAGMENT_SHADER

//-----------------------------------------------------------------------------

//----------

// Globals

struct ssGlobals
{
	float gTimeElapsed;
	float gTimeDelta;
	float gTimeElapsedShifted;
	
	
};

ssGlobals tempGlobals;
#define scCustomCodeUniform

//-----------------------------------------------------------------------------
/*
#ifdef USE_16_BIT_TEXTURES
layout(location = 0) out highp uvec4 fragOut[4];
#endif
*/
//-----------------------------------------------------------------------------

void main() 
{
	sc_DiscardStereoFragment();
	
	float4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, vec2( 0.5 ), 0.0);
	float4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, vec2( 0.5 ), 0.0);
	float4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, vec2( 0.5 ), 0.0);
	float4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, vec2( 0.5 ), 0.0);
	
	if ( dot( renderTarget0Sample + renderTarget1Sample + renderTarget2Sample + renderTarget3Sample, vec4( 0.2542325 ) ) == 0.3423183476 )
	{
		discard; // hack so the texture filter modes don't get wiped out
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#if __VERSION__ == 100
	{
		gl_FragColor = vec4( 0.0, 0.0, 0.0, 1.0 );
	}				 
	#else
	{
		vec4 Data0 = vec4( 0.0 );
		vec4 Data1 = vec4( 0.0 );
		vec4 Data2 = vec4( 0.0 );
		vec4 Data3 = vec4( 0.0 );
		
		if ( ( overrideTimeEnabled == 1 ) && overrideTimeDelta == 0.0 )
		{
			renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, varTex0, 0.0);
			renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, varTex0, 0.0);
			renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, varTex0, 0.0);
			renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, varTex0, 0.0);
			
			Data0 = renderTarget0Sample;
			Data1 = renderTarget1Sample;
			Data2 = renderTarget2Sample;
			Data3 = renderTarget3Sample;
		}
		else
		{
			gParticle.Color = Interp_Particle_Color;
			gParticle.Size = Interp_Particle_Size;
			gParticle.Mass = Interp_Particle_Mass;
			gParticle.Velocity = Interp_Particle_Velocity;
			gParticle.Position = Interp_Particle_Position;
			gParticle.Life = Interp_Particle_Life;
			gParticle.Age = Interp_Particle_Age;
			gParticle.Dead = Interp_Particle_Dead;
			
			
			// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
			
			ssEncodeParticle( Interp_Particle_Coord, Data0, Data1, Data2, Data3 );
			
			// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
			
			#if 0
			{
				float TexelRatio = floor( Interp_Particle_Coord.x * 5.0 ) / 4.0;
				Data0 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
				Data1 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
				Data2 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
				Data3 = vec4( TexelRatio, 0.0, 0.0, 1.0 );
			}	
			#endif
			
			// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
			
			#ifndef MOBILE
			if ( dot( Data0.xyzw + Data1.xyzw + Data2.xyzw + Data3.xyzw, vec4( 0.23454 ) ) == 0.3423183476 )
			Data0.xyzw += SC_EPSILON; // fix for missing parameters in UI
			#endif
		}
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		sc_writeFragData0( Data0 );
		sc_writeFragData1( Data1 );
		sc_writeFragData2( Data2 );
		sc_writeFragData3( Data3 );
	}
	#endif
}

#endif //FRAGMENT SHADER
