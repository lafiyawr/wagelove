#version 310 es

#define NODEFLEX 0 // Hack for now to know if a shader is running in Studio or on a released lens

#define NF_PRECISION highp

//-----------------------------------------------------------------------

#define ENABLE_LIGHTING true
#define ENABLE_DIFFUSE_LIGHTING true
#define ENABLE_SPECULAR_LIGHTING true
#define ENABLE_TONE_MAPPING


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


const bool SC_ENABLE_SRGB_EMULATION_IN_SHADER = true;


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


// Spec Consts

SPEC_CONST(bool) Tweak_N248 = false;
SPEC_CONST(bool) Tweak_N261 = false;
SPEC_CONST(int) NODE_243_DROPLIST_ITEM = 0;


// Material Parameters ( Tweaks )

uniform NF_PRECISION                     float         velocityStretch; // Title: Velocity Stretch
uniform bool                             isIdle;       // Title: Is Idle
SC_DECLARE_TEXTURE(flipbookTex); //      Title:        Flipbook Texture
uniform bool                             isAttracting; // Title: Is Attracting
uniform NF_PRECISION                     float4        colorMix; // Title: Color Mix
uniform NF_PRECISION                     float         intensity; // Title: Color Intensity
SC_DECLARE_TEXTURE(repelflipbookTex); // Title:        Flipbook Texture	


// Uniforms ( Ports )

#if defined( STUDIO )
uniform NF_PRECISION float Port_Input1_N362;
uniform NF_PRECISION float Port_Value_N170;
uniform NF_PRECISION float3 Port_Input1_N420;
uniform NF_PRECISION float Port_RangeMinA_N171;
uniform NF_PRECISION float Port_RangeMaxA_N171;
uniform NF_PRECISION float Port_RangeMinB_N171;
uniform NF_PRECISION float Port_RangeMaxB_N171;
uniform NF_PRECISION float Port_Import_N356;
uniform NF_PRECISION float Port_Input1_N358;
uniform NF_PRECISION float Port_AlphaTestThreshold_N039;
uniform NF_PRECISION float2 Port_SpriteCount_N045;
uniform NF_PRECISION float Port_MaxFrames_N045;
uniform NF_PRECISION float Port_Rotation_N159;
uniform NF_PRECISION float2 Port_Center_N159;
uniform NF_PRECISION float Port_RangeMinA_N156;
uniform NF_PRECISION float Port_RangeMaxA_N156;
uniform NF_PRECISION float Port_RangeMinB_N156;
uniform NF_PRECISION float Port_RangeMaxB_N156;
uniform NF_PRECISION float Port_SecondOffset_N045;
uniform NF_PRECISION float3 Port_Input0_N038;
uniform NF_PRECISION float2 Port_Input1_N031;
uniform NF_PRECISION float Port_Input1_N246;
uniform NF_PRECISION float Port_Input2_N246;
uniform NF_PRECISION float2 Port_Input1_N035;
uniform NF_PRECISION float Port_Input1_N036;
uniform NF_PRECISION float3 Port_Emissive_N026;
uniform NF_PRECISION float Port_Metallic_N026;
uniform NF_PRECISION float Port_Roughness_N026;
uniform NF_PRECISION float3 Port_AO_N026;
uniform NF_PRECISION float3 Port_SpecularAO_N026;
uniform NF_PRECISION float2 Port_SpriteCount_N167;
uniform NF_PRECISION float Port_MaxFrames_N167;
uniform NF_PRECISION float Port_SecondOffset_N167;
uniform NF_PRECISION float3 Port_Emissive_N258;
uniform NF_PRECISION float Port_Metallic_N258;
uniform NF_PRECISION float Port_Roughness_N258;
uniform NF_PRECISION float3 Port_AO_N258;
uniform NF_PRECISION float3 Port_SpecularAO_N258;
#endif	



//-----------------------------------------------------------------------

varying float gParticlesDebug;
varying vec2 ParticleUV;

//-----------------------------------------------------------------------

#ifdef VERTEX_SHADER

//-----------------------------------------------------------------------

//----------

// Globals

struct ssGlobals
{
	float gTimeElapsed;
	float gTimeDelta;
	float gTimeElapsedShifted;
	
	float2 Surface_UVCoord0;
};

ssGlobals tempGlobals;
#define scCustomCodeUniform	

//----------

// Functions

#define Node353_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Position
#define Node373_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Size
#define Node361_Surface_UV_Coord( UVCoord, Globals ) UVCoord = Globals.Surface_UVCoord0
#define Node362_Subtract( Input0, Input1, Output, Globals ) Output = Input0 - float2(Input1)
void Node141_Split_Vector( in float2 Value, out float Value1, out float Value2, ssGlobals Globals )
{ 
	Value1 = Value.x;
	Value2 = Value.y;
}
#define Node354_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Velocity
#define Node355_Length( Input0, Output, Globals ) Output = length( Input0 )
void Node170_Float_Value( in float Value, out float Output, ssGlobals Globals )
{ 
	Output = Value + 0.001;
	Output -= 0.001; // LOOK-62828
}
#define Node418_Is_Less( Input0, Input1, Output, Globals ) Output = ssSmaller( Input0, Input1 )
#define Node359_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Velocity
void Node360_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
void Node420_Conditional( in float Input0, in float3 Input1, in float3 Input2, out float3 Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float3 Value_N354 = float3(0.0); Node354_Particle_Get_Attribute( Value_N354, Globals );
		float Output_N355 = 0.0; Node355_Length( Value_N354, Output_N355, Globals );
		float Output_N170 = 0.0; Node170_Float_Value( NF_PORT_CONSTANT( float( 0.025 ), Port_Value_N170 ), Output_N170, Globals );
		float Output_N418 = 0.0; Node418_Is_Less( Output_N355, Output_N170, Output_N418, Globals );
		
		Input0 = Output_N418;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float3 Value_N359 = float3(0.0); Node359_Particle_Get_Attribute( Value_N359, Globals );
			float3 Output_N360 = float3(0.0); Node360_Normalize( Value_N359, Output_N360, Globals );
			
			Input2 = Output_N360;
		}
		Output = Input2; 
	}
}
#define Node142_Surface_Normal( Normal, Globals ) Normal = varNormal
#define Node147_Negate( Input0, Output, Globals ) Output = -Input0
#define Node370_Cross( A, B, Result, Globals ) Result = cross( A, B )
void Node371_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
#define Node365_Multiply( Input0, Input1, Input2, Output, Globals ) Output = float3(Input0) * float3(Input1) * Input2
void Node169_Float_Parameter( out float Output, ssGlobals Globals ) { Output = velocityStretch; }
#define Node171_Remap( ValueIn, ValueOut, RangeMinA, RangeMaxA, RangeMinB, RangeMaxB, Globals ) ValueOut = ( ( ValueIn - RangeMinA ) / ( RangeMaxA - RangeMinA ) ) * ( RangeMaxB - RangeMinB ) + RangeMinB
#define Node356_Float_Import( Import, Value, Globals ) Value = Import
#define Node357_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node358_Max( Input0, Input1, Output, Globals ) Output = max( Input0, Input1 )
#define Node374_Multiply( Input0, Input1, Input2, Input3, Output, Globals ) Output = float3(Input0) * float3(Input1) * float3(Input2) * Input3
#define Node375_Add( Input0, Input1, Input2, Output, Globals ) Output = Input0 + Input1 + Input2
void Node376_Set_Vertex_Position( in float3 Position, ssGlobals Globals )
{ 
	#ifdef VERTEX_SHADER
	varPos = Position;
	#endif
}
void Node152_Set_Vertex_Tangent( in float3 Tangent, ssGlobals Globals )
{ 
	#ifdef VERTEX_SHADER
	varTangent.xyz = Tangent;
	#endif
}
#define Node153_Cross( A, B, Result, Globals ) Result = cross( A, B )
void Node154_Normalize( in float3 Input0, out float3 Output, ssGlobals Globals )
{ 
	float lengthSquared = dot( Input0, Input0 );
	float l = ( lengthSquared > 0.0 ) ? 1.0 / sqrt( lengthSquared  ) : 0.0;
	Output = Input0 * l;
}
void Node157_Set_Vertex_Normal( in float3 Normal, ssGlobals Globals )
{ 
	#ifdef VERTEX_SHADER
	varNormal = Normal;
	#endif
}

//-----------------------------------------------------------------------

void main() 
{
	NF_SETUP_PREVIEW_VERTEX()
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	sc_Vertex_t v = sc_LoadVertexAttributes();
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( sc_IsEditor )
	{
		v.position.x += _sc_allow16TexturesMarker;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#if !defined(MOBILE)
	if ( NF_DISABLE_VERTEX_CHANGES() )
	v.texture0.x = 1.0 - v.texture0.x; // fix to flip the preview quad UVs horizontally
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	int InstanceID = sc_LocalInstanceID;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( InstanceID >= ssPARTICLE_COUNT_1D_INT )
	{
		sc_SetClipPosition( vec4( 0.0 ) );
		return;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssDecodeParticle( InstanceID );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssGlobals Globals;	
	Globals.gTimeElapsed        = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : sc_TimeElapsed;
	Globals.gTimeDelta          = ( overrideTimeEnabled == 1 ) ? overrideTimeDelta : max( sc_TimeDelta, ssDELTA_TIME_MIN );
	Globals.gTimeElapsedShifted = Globals.gTimeElapsed - gParticle.TimeShift * Globals.gTimeDelta - 0.0;
	
	Globals.Surface_UVCoord0 = v.texture0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( ( gParticle.Dead > 16.0 || gParticle.Size < 0.00001 || gParticle.Age >= gParticle.Life ) )
	{
		sc_SetClipPosition( vec4( 0.0 ) );
		return;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Transform from Update to Output space
	
	
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#ifdef VFX_GEOMETRY_MESH
	{
		varPos     = gParticle.Position + mat3( gParticle.Matrix ) * v.position.xyz * gParticle.Size;	
		varNormal  = mat3( gParticle.Matrix ) * v.normal;
		varTangent.xyz = mat3( gParticle.Matrix ) * v.tangent;
		varTangent.w = 1.0; 				
	}
	#else
	{
		varPos     = gParticle.Position + mat3( gParticle.Matrix ) * vec3( v.position.x * gParticle.Size, v.position.y * gParticle.Size, 0.0 );
		varNormal      = mat3( gParticle.Matrix ) * float3( 0.0, 0.0, 1.0 );
		varTangent.xyz = mat3( gParticle.Matrix ) * float3( 1.0, 0.0, 0.0 );
		varTangent.w = 1.0;
	}
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	varTex01 = vec4( v.texture0, v.texture1 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Execution Code
	
	float3 Value_N353 = float3(0.0); Node353_Particle_Get_Attribute( Value_N353, Globals );
	float Value_N373 = 0.0; Node373_Particle_Get_Attribute( Value_N373, Globals );
	float2 UVCoord_N361 = float2(0.0); Node361_Surface_UV_Coord( UVCoord_N361, Globals );
	float2 Output_N362 = float2(0.0); Node362_Subtract( UVCoord_N361, NF_PORT_CONSTANT( float( 0.5 ), Port_Input1_N362 ), Output_N362, Globals );
	float Value1_N141 = 0.0; float Value2_N141 = 0.0; Node141_Split_Vector( Output_N362, Value1_N141, Value2_N141, Globals );
	float3 Output_N420 = float3(0.0); Node420_Conditional( float( 1.0 ), NF_PORT_CONSTANT( float3( 0.0, 1.0, 0.0 ), Port_Input1_N420 ), float3( 0.0, 0.0, 0.0 ), Output_N420, Globals );
	float3 Normal_N142 = float3(0.0); Node142_Surface_Normal( Normal_N142, Globals );
	float3 Output_N147 = float3(0.0); Node147_Negate( Normal_N142, Output_N147, Globals );
	float3 Result_N370 = float3(0.0); Node370_Cross( Output_N420, Output_N147, Result_N370, Globals );
	float3 Output_N371 = float3(0.0); Node371_Normalize( Result_N370, Output_N371, Globals );
	float3 Output_N365 = float3(0.0); Node365_Multiply( Value_N373, Value1_N141, Output_N371, Output_N365, Globals );
	float Output_N169 = 0.0; Node169_Float_Parameter( Output_N169, Globals );
	float ValueOut_N171 = 0.0; Node171_Remap( Output_N169, ValueOut_N171, NF_PORT_CONSTANT( float( 0.01 ), Port_RangeMinA_N171 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N171 ), NF_PORT_CONSTANT( float( 0.01 ), Port_RangeMinB_N171 ), NF_PORT_CONSTANT( float( 0.12 ), Port_RangeMaxB_N171 ), Globals );
	float Value_N356 = 0.0; Node356_Float_Import( ValueOut_N171, Value_N356, Globals );
	float3 Value_N354 = float3(0.0); Node354_Particle_Get_Attribute( Value_N354, Globals );
	float Output_N355 = 0.0; Node355_Length( Value_N354, Output_N355, Globals );
	float Output_N357 = 0.0; Node357_Multiply( Value_N356, Output_N355, Output_N357, Globals );
	float Output_N358 = 0.0; Node358_Max( Output_N357, NF_PORT_CONSTANT( float( 1.0 ), Port_Input1_N358 ), Output_N358, Globals );
	float3 Output_N374 = float3(0.0); Node374_Multiply( Value_N373, Value2_N141, Output_N358, Output_N420, Output_N374, Globals );
	float3 Output_N375 = float3(0.0); Node375_Add( Value_N353, Output_N365, Output_N374, Output_N375, Globals );
	Node376_Set_Vertex_Position( Output_N375, Globals );
	Node152_Set_Vertex_Tangent( Output_N420, Globals );
	float3 Result_N153 = float3(0.0); Node153_Cross( Output_N420, Output_N371, Result_N153, Globals );
	float3 Output_N154 = float3(0.0); Node154_Normalize( Result_N153, Output_N154, Globals );
	Node157_Set_Vertex_Normal( Output_N154, Globals );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( UseViewSpaceDepthVariant && ( sc_OITDepthGatherPass || sc_OITCompositingPass || sc_OITDepthBoundsPass ) )
	{
		float4 ViewPosition = ngsViewMatrix * vec4( varPos, 1.0 );
		varViewSpaceDepth = -ViewPosition.z; 
		sc_SetClipPosition( ngsProjectionMatrix * ViewPosition );
	}
	else
	{
		sc_SetClipPosition( ngsViewProjectionMatrix * vec4( varPos, 1.0 ) );
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Interpolation Code
	
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Debug
	
	#if 0
	{
		if ( sc_LocalInstanceID == 0 )
		{
			sc_SetClipPosition( vec4( vec2( 0.8, -0.85 ) - ( v.texture0 ) * vec2( 0.4, -0.23 ) * 3.0, 1.0, 1.0 ) );
			varTex0 = v.texture0;
			gParticlesDebug = 1.0;
		}
		else
		{
			gParticlesDebug = -1.0;
		}
	}
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Interp_Particle_Index = sc_LocalInstanceID;
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
	
	#if !defined(MOBILE)
	if ( NF_DISABLE_VERTEX_CHANGES() )
	{
		if ( sc_IsEditor ) 
		{
			v.position.x += _sc_allow16TexturesMarker;
		}
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		sc_SetClipPosition( ngsViewProjectionMatrix * float4( v.position.xyz, 1.0 ) );
	}				
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	NF_PREVIEW_OUTPUT_VERTEX()
}

//-----------------------------------------------------------------------

#endif // #ifdef VERTEX_SHADER

//-----------------------------------------------------------------------

#ifdef FRAGMENT_SHADER

//-----------------------------------------------------------------------------

//----------

// Includes


#include "includes/uber_lighting.glsl"
#include "includes/pbr.glsl"

#if !SC_RT_RECEIVER_MODE
//-----------------------------------------------------------------------

vec4 ngsCalculateLighting( vec3 albedo, float opacity, vec3 normal, vec3 position, vec3 viewDir, vec3 emissive, float metallic, float roughness, vec3 ao, vec3 specularAO )
{
	SurfaceProperties surfaceProperties = defaultSurfaceProperties();
	surfaceProperties.opacity = opacity;
	surfaceProperties.albedo = ssSRGB_to_Linear( albedo );
	surfaceProperties.normal = normalize( normal );
	surfaceProperties.positionWS = position;
	surfaceProperties.viewDirWS = viewDir;
	surfaceProperties.emissive = ssSRGB_to_Linear( emissive );
	surfaceProperties.metallic = metallic;
	surfaceProperties.roughness = roughness;
	surfaceProperties.ao = ao;
	surfaceProperties.specularAo = specularAO;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#ifdef ENABLE_LIGHTING
	
	surfaceProperties = calculateDerivedSurfaceProperties(surfaceProperties);
	LightingComponents lighting = evaluateLighting(surfaceProperties);
	
	#else
	
	LightingComponents lighting = defaultLightingComponents();
	
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( sc_BlendMode_ColoredGlass )
	{		
		// Colored glass implies that the surface does not diffusely reflect light, instead it transmits light.
		// The transmitted light is the background multiplied by the color of the glass, taking opacity as strength.
		lighting.directDiffuse = vec3(0.0);
		lighting.indirectDiffuse = vec3(0.0);
		vec3 framebuffer = ssSRGB_to_Linear( getFramebufferColor().rgb );
		lighting.transmitted = framebuffer * mix(vec3(1.0), surfaceProperties.albedo, surfaceProperties.opacity);
		surfaceProperties.opacity = 1.0; // Since colored glass does its own multiplicative blending (above), forbid any other blending.
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	bool enablePremultipliedAlpha = false;
	
	if ( sc_BlendMode_PremultipliedAlpha )
	{
		enablePremultipliedAlpha = true;
	}						
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// This is where the lighting and the surface finally come together.
	
	vec4 Output = vec4(combineSurfacePropertiesWithLighting(surfaceProperties, lighting, enablePremultipliedAlpha), surfaceProperties.opacity);
	#if (SC_BACKEND_LANGUAGE_VERSION >= 310) || defined (SC_BACKEND_LANGUAGE_METAL)
	if (sc_ProxyMode) {
		return Output;
	}
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Tone mapping
	
	if ( !sc_BlendMode_Multiply )
	{
		#if defined(ENABLE_TONE_MAPPING)
		
		Output.rgb = linearToneMapping( Output.rgb );
		
		#endif
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// sRGB output
	
	Output.rgb = linearToSrgb( Output.rgb );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	return Output;
}	
#endif



//----------

// Globals

struct ssGlobals
{
	float gTimeElapsed;
	float gTimeDelta;
	float gTimeElapsedShifted;
	
	float3 BumpedNormal;
	float3 ViewDirWS;
	float3 PositionWS;
	float3 VertexTangent_WorldSpace;
	float3 VertexNormal_WorldSpace;
	float3 VertexBinormal_WorldSpace;
	float2 Surface_UVCoord0;
};

ssGlobals tempGlobals;
#define scCustomCodeUniform	

//----------

// Functions

#define Node39_Output_Quad_World_Space( AlphaTestThreshold, Globals ) /* does nothing */
void Node238_Bool_Parameter( out float Output, ssGlobals Globals ) { Output = ( isIdle ) ? 1.0 : 0.0; }
#define Node46_Texture_2D_Object_Parameter( Globals ) /*nothing*/
#define Node160_Surface_UV_Coord( UVCoord, Globals ) UVCoord = Globals.Surface_UVCoord0
void Node159_Rotate_Coords( in float2 CoordsIn, in float Rotation, in float2 Center, out float2 CoordsOut, ssGlobals Globals )
{ 
	float Sin = sin( radians( Rotation ) );
	float Cos = cos( radians( Rotation ) );
	CoordsOut = CoordsIn - Center;
	CoordsOut = float2( dot( float2( Cos, Sin ), CoordsOut ), dot( float2( -Sin, Cos ), CoordsOut ) ) + Center;
}
#define Node7_Particle_Get_Attribute( Value, Globals ) Value = float( gParticle.Index1D )
#define Node47_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Ratio1D
#define Node156_Remap( ValueIn, ValueOut, RangeMinA, RangeMaxA, RangeMinB, RangeMaxB, Globals ) ValueOut = ( ( ValueIn - RangeMinA ) / ( RangeMaxA - RangeMinA ) ) * ( RangeMaxB - RangeMinB ) + RangeMinB
void Node45_Flipbook_Sample( in float2 SpriteCount, in float MaxFrames, in float2 UVCoord, in float FrameOffset, in float Speed, in float SecondOffset, out float4 Color, ssGlobals Globals )
{ 
	int x = int( SpriteCount.x );
	int y = int( SpriteCount.y );
	int xy = x * y;
	int mx = int( MaxFrames );
	int m = ( xy < mx ) ? xy : mx;
	int o =  int ( FrameOffset );
	float w = 1.0 / float( x );
	float h = 1.0 / float( y );
	int i = ssIntMod( int( ( Globals.gTimeElapsedShifted + SecondOffset ) * Speed + floor( FrameOffset ) ), m );
	float c = float( ssIntMod( i, x ) );
	float r = float( i / x );
	float u = UVCoord.x;
	float v = UVCoord.y;
	
	Color = SC_SAMPLE_TEX_R(flipbookTex, mod( float2( w * u + c * w, 1.0 - h - r * h + h * v ), 1.0 ), 0.0);
}
#define Node173_Swizzle( Input, Output, Globals ) Output = Input.a
#define Node29_Particle_Get_Attribute( Value, Globals ) Value = gParticle.Color
#define Node277_Swizzle( Input, Output, Globals ) Output = Input.a
#define Node161_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node28_Surface_UV_Coord( UVCoord, Globals ) UVCoord = Globals.Surface_UVCoord0
#define Node31_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
#define Node33_Subtract_One( Input0, Output, Globals ) Output = Input0 - 1.0
#define Node34_Dot_Product( Input0, Input1, Output, Globals ) Output = dot( Input0, Input1 )
#define Node246_Clamp( Input0, Input1, Input2, Output, Globals ) Output = clamp( Input0 + 0.001, Input1 + 0.001, Input2 + 0.001 ) - 0.001
#define Node247_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
#define Node249_Sqrt( Input0, Output, Globals ) Output = ( Input0 <= 0.0 ) ? 0.0 : sqrt( Input0 )
#define Node250_Construct_Vector( Value1, Value2, Value, Globals ) Value.xy = Value1; Value.z = Value2
#define Node35_Distance( Input0, Input1, Output, Globals ) Output = distance( Input0, Input1 )
#define Node36_Is_Less( Input0, Input1, Output, Globals ) Output = ssSmaller( Input0, Input1 )
#define Node38_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, float3(Input2) )
#define Node41_Float_Export( Value, Export, Globals ) Export = Value
void Node26_PBR_Lighting( in float3 Albedo, in float Opacity, in float3 Normal, in float3 Emissive, in float Metallic, in float Roughness, in float3 AO, in float3 SpecularAO, out float4 Output, ssGlobals Globals )
{ 
	if ( !sc_ProjectiveShadowsCaster )
	{
		Globals.BumpedNormal = float3x3( Globals.VertexTangent_WorldSpace, Globals.VertexBinormal_WorldSpace, Globals.VertexNormal_WorldSpace ) * Normal;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	Opacity = clamp( Opacity, 0.0, 1.0 ); 		
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ngsAlphaTest( Opacity );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#if SC_RT_RECEIVER_MODE		
	sc_WriteReceiverData( Globals.PositionWS, Globals.BumpedNormal, Roughness );
	#else
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	Albedo = max( Albedo, 0.0 );	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( !sc_ProjectiveShadowsCaster )
	{
		
		
		
		
		
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		Output = ngsCalculateLighting( Albedo, Opacity, Globals.BumpedNormal, Globals.PositionWS, Globals.ViewDirWS, Emissive, Metallic, Roughness, AO, SpecularAO );
	}
	else
	{
		Output = float4( Albedo, Opacity );
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Output = max( Output, 0.0 );
	#endif
}
void Node149_Bool_Parameter( out float Output, ssGlobals Globals ) { Output = ( isAttracting ) ? 1.0 : 0.0; }
void Node248_Bool_Parameter( out float Output, ssGlobals Globals )
{ 
	if ( Tweak_N248 )
	{
		Output = 1.001;
	}
	else
	{
		Output = 0.001;
	}
	
	Output -= 0.001; // LOOK-62828
}
void Node270_Color_Parameter( out float4 Output, ssGlobals Globals ) { Output = colorMix; }
void Node261_Bool_Parameter( out float Output, ssGlobals Globals )
{ 
	if ( Tweak_N261 )
	{
		Output = 1.001;
	}
	else
	{
		Output = 0.001;
	}
	
	Output -= 0.001; // LOOK-62828
}
#define Node243_DropList_Parameter( Output, Globals ) Output = float( NODE_243_DROPLIST_ITEM )
void Node245_Split_Vector( in float4 Value, out float Value1, out float Value2, out float Value3, out float Value4, ssGlobals Globals )
{ 
	Value1 = Value.r;
	Value2 = Value.g;
	Value3 = Value.b;
	Value4 = Value.a;
}
void Node240_Switch( in float Switch, in float Value0, in float Value1, in float Value2, in float Value3, in float Default, out float Result, ssGlobals Globals )
{ 
	if ( int( NODE_243_DROPLIST_ITEM ) == 0 )
	{
		/* Input port: "Value0"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Value1_N245 = 0.0; float Value2_N245 = 0.0; float Value3_N245 = 0.0; float Value4_N245 = 0.0; Node245_Split_Vector( Color_N45, Value1_N245, Value2_N245, Value3_N245, Value4_N245, Globals );
			
			Value0 = Value1_N245;
		}
		Result = Value0;
	}
	else if ( int( NODE_243_DROPLIST_ITEM ) == 1 )
	{
		/* Input port: "Value1"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Value1_N245 = 0.0; float Value2_N245 = 0.0; float Value3_N245 = 0.0; float Value4_N245 = 0.0; Node245_Split_Vector( Color_N45, Value1_N245, Value2_N245, Value3_N245, Value4_N245, Globals );
			
			Value1 = Value2_N245;
		}
		Result = Value1;
	}
	else if ( int( NODE_243_DROPLIST_ITEM ) == 2 )
	{
		/* Input port: "Value2"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Value1_N245 = 0.0; float Value2_N245 = 0.0; float Value3_N245 = 0.0; float Value4_N245 = 0.0; Node245_Split_Vector( Color_N45, Value1_N245, Value2_N245, Value3_N245, Value4_N245, Globals );
			
			Value2 = Value3_N245;
		}
		Result = Value2;
	}
	else if ( int( NODE_243_DROPLIST_ITEM ) == 3 )
	{
		/* Input port: "Value3"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Value1_N245 = 0.0; float Value2_N245 = 0.0; float Value3_N245 = 0.0; float Value4_N245 = 0.0; Node245_Split_Vector( Color_N45, Value1_N245, Value2_N245, Value3_N245, Value4_N245, Globals );
			
			Value3 = Value4_N245;
		}
		Result = Value3;
	}
	else
	{
		/* Input port: "Default"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Value1_N245 = 0.0; float Value2_N245 = 0.0; float Value3_N245 = 0.0; float Value4_N245 = 0.0; Node245_Split_Vector( Color_N45, Value1_N245, Value2_N245, Value3_N245, Value4_N245, Globals );
			
			Default = Value4_N245;
		}
		Result = Default;
	}
}
#define Node235_Swizzle( Input, Output, Globals ) Output = Input
#define Node268_One_Minus( Input0, Output, Globals ) Output = 1.0 - Input0
void Node251_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	#if 0
	/* Input port: "Input0"  */
	
	{
		float Output_N261 = 0.0; Node261_Bool_Parameter( Output_N261, Globals );
		
		Input0 = Output_N261;
	}
	#endif
	
	if ( bool( Tweak_N261 ) ) 
	{ 
		/* Input port: "Input1"  */
		
		{
			float Result_N240 = 0.0; Node240_Switch( float( 0.0 ), float( 0.0 ), float( 0.0 ), float( 0.0 ), float( 0.0 ), float( 0.0 ), Result_N240, Globals );
			float Output_N235 = 0.0; Node235_Swizzle( Result_N240, Output_N235, Globals );
			float Output_N268 = 0.0; Node268_One_Minus( Output_N235, Output_N268, Globals );
			
			Input1 = Output_N268;
		}
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float Result_N240 = 0.0; Node240_Switch( float( 0.0 ), float( 0.0 ), float( 0.0 ), float( 0.0 ), float( 0.0 ), float( 0.0 ), Result_N240, Globals );
			float Output_N235 = 0.0; Node235_Swizzle( Result_N240, Output_N235, Globals );
			
			Input2 = Output_N235;
		}
		Output = Input2; 
	}
}
#define Node48_Mix( Input0, Input1, Input2, Output, Globals ) Output = mix( Input0, Input1, float4(Input2) )
void Node163_Float_Parameter( out float Output, ssGlobals Globals ) { Output = intensity; }
#define Node64_Pow( Input0, Input1, Output, Globals ) Output = vec4( ( Input0.x <= 0.0 ) ? 0.0 : pow( Input0.x, Input1 ), ( Input0.y <= 0.0 ) ? 0.0 : pow( Input0.y, Input1 ), ( Input0.z <= 0.0 ) ? 0.0 : pow( Input0.z, Input1 ), ( Input0.w <= 0.0 ) ? 0.0 : pow( Input0.w, Input1 ) )
#define Node168_Texture_2D_Object_Parameter( Globals ) /*nothing*/
void Node167_Flipbook_Sample( in float2 SpriteCount, in float MaxFrames, in float2 UVCoord, in float FrameOffset, in float Speed, in float SecondOffset, out float4 Color, ssGlobals Globals )
{ 
	int x = int( SpriteCount.x );
	int y = int( SpriteCount.y );
	int xy = x * y;
	int mx = int( MaxFrames );
	int m = ( xy < mx ) ? xy : mx;
	int o =  int ( FrameOffset );
	float w = 1.0 / float( x );
	float h = 1.0 / float( y );
	int i = ssIntMod( int( ( Globals.gTimeElapsedShifted + SecondOffset ) * Speed + floor( FrameOffset ) ), m );
	float c = float( ssIntMod( i, x ) );
	float r = float( i / x );
	float u = UVCoord.x;
	float v = UVCoord.y;
	
	Color = SC_SAMPLE_TEX_R(repelflipbookTex, mod( float2( w * u + c * w, 1.0 - h - r * h + h * v ), 1.0 ), 0.0);
}
void Node252_If_else( in float Bool1, in float4 Value1, in float4 Default, out float4 Result, ssGlobals Globals )
{ 
	if ( bool( Tweak_N248 ) )
	{
		/* Input port: "Value1"  */
		
		{
			float4 Value_N29 = float4(0.0); Node29_Particle_Get_Attribute( Value_N29, Globals );
			float4 Output_N270 = float4(0.0); Node270_Color_Parameter( Output_N270, Globals );
			float Output_N251 = 0.0; Node251_Conditional( float( 1.0 ), float( 1.0 ), float( 0.0 ), Output_N251, Globals );
			float4 Output_N48 = float4(0.0); Node48_Mix( Value_N29, Output_N270, Output_N251, Output_N48, Globals );
			float Output_N163 = 0.0; Node163_Float_Parameter( Output_N163, Globals );
			float4 Output_N64 = float4(0.0); Node64_Pow( Output_N48, Output_N163, Output_N64, Globals );
			
			Value1 = Output_N64;
		}
		Result = Value1;
	}
	else
	{
		/* Input port: "Default"  */
		
		{
			Node168_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N167 = float4(0.0); Node167_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N167 ), NF_PORT_CONSTANT( float( 8.0 ), Port_MaxFrames_N167 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N167 ), Color_N167, Globals );
			
			Default = Color_N167;
		}
		Result = Default;
	}
}
#define Node158_Swizzle( Input, Output, Globals ) Output = Input.a
#define Node234_Multiply( Input0, Input1, Output, Globals ) Output = Input0 * Input1
void Node259_Conditional( in float Input0, in float Input1, in float Input2, out float Output, ssGlobals Globals )
{ 
	#if 0
	/* Input port: "Input0"  */
	
	{
		float Output_N248 = 0.0; Node248_Bool_Parameter( Output_N248, Globals );
		
		Input0 = Output_N248;
	}
	#endif
	
	if ( bool( Tweak_N248 ) ) 
	{ 
		/* Input port: "Input1"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Output_N173 = 0.0; Node173_Swizzle( Color_N45, Output_N173, Globals );
			float4 Value_N29 = float4(0.0); Node29_Particle_Get_Attribute( Value_N29, Globals );
			float Output_N277 = 0.0; Node277_Swizzle( Value_N29, Output_N277, Globals );
			float Output_N161 = 0.0; Node161_Multiply( Output_N173, Output_N277, Output_N161, Globals );
			
			Input1 = Output_N161;
		}
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float4 Value_N29 = float4(0.0); Node29_Particle_Get_Attribute( Value_N29, Globals );
			float Output_N277 = 0.0; Node277_Swizzle( Value_N29, Output_N277, Globals );
			Node168_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N167 = float4(0.0); Node167_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N167 ), NF_PORT_CONSTANT( float( 8.0 ), Port_MaxFrames_N167 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N167 ), Color_N167, Globals );
			float Output_N158 = 0.0; Node158_Swizzle( Color_N167, Output_N158, Globals );
			float Output_N234 = 0.0; Node234_Multiply( Output_N277, Output_N158, Output_N234, Globals );
			
			Input2 = Output_N234;
		}
		Output = Input2; 
	}
}
void Node258_PBR_Lighting( in float3 Albedo, in float Opacity, in float3 Normal, in float3 Emissive, in float Metallic, in float Roughness, in float3 AO, in float3 SpecularAO, out float4 Output, ssGlobals Globals )
{ 
	if ( !sc_ProjectiveShadowsCaster )
	{
		Globals.BumpedNormal = float3x3( Globals.VertexTangent_WorldSpace, Globals.VertexBinormal_WorldSpace, Globals.VertexNormal_WorldSpace ) * Normal;
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	Opacity = clamp( Opacity, 0.0, 1.0 ); 		
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ngsAlphaTest( Opacity );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#if SC_RT_RECEIVER_MODE		
	sc_WriteReceiverData( Globals.PositionWS, Globals.BumpedNormal, Roughness );
	#else
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	Albedo = max( Albedo, 0.0 );	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( !sc_ProjectiveShadowsCaster )
	{
		
		
		
		
		
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		Output = ngsCalculateLighting( Albedo, Opacity, Globals.BumpedNormal, Globals.PositionWS, Globals.ViewDirWS, Emissive, Metallic, Roughness, AO, SpecularAO );
	}
	else
	{
		Output = float4( Albedo, Opacity );
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Output = max( Output, 0.0 );
	#endif
}
void Node11_Conditional( in float Input0, in float4 Input1, in float4 Input2, out float4 Output, ssGlobals Globals )
{ 
	/* Input port: "Input0"  */
	
	{
		float Output_N149 = 0.0; Node149_Bool_Parameter( Output_N149, Globals );
		
		Input0 = Output_N149;
	}
	
	if ( bool( Input0 * 1.0 != 0.0 ) ) 
	{ 
		/* Input port: "Input1"  */
		
		{
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Output_N173 = 0.0; Node173_Swizzle( Color_N45, Output_N173, Globals );
			float4 Value_N29 = float4(0.0); Node29_Particle_Get_Attribute( Value_N29, Globals );
			float Output_N277 = 0.0; Node277_Swizzle( Value_N29, Output_N277, Globals );
			float Output_N161 = 0.0; Node161_Multiply( Output_N173, Output_N277, Output_N161, Globals );
			float2 UVCoord_N28 = float2(0.0); Node28_Surface_UV_Coord( UVCoord_N28, Globals );
			float2 Output_N31 = float2(0.0); Node31_Multiply( UVCoord_N28, NF_PORT_CONSTANT( float2( 2.0, 2.0 ), Port_Input1_N031 ), Output_N31, Globals );
			float2 Output_N33 = float2(0.0); Node33_Subtract_One( Output_N31, Output_N33, Globals );
			float Output_N34 = 0.0; Node34_Dot_Product( Output_N33, Output_N33, Output_N34, Globals );
			float Output_N246 = 0.0; Node246_Clamp( Output_N34, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N246 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N246 ), Output_N246, Globals );
			float Output_N247 = 0.0; Node247_One_Minus( Output_N246, Output_N247, Globals );
			float Output_N249 = 0.0; Node249_Sqrt( Output_N247, Output_N249, Globals );
			float3 Value_N250 = float3(0.0); Node250_Construct_Vector( Output_N33, Output_N249, Value_N250, Globals );
			float Output_N35 = 0.0; Node35_Distance( UVCoord_N28, NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Input1_N035 ), Output_N35, Globals );
			float Output_N36 = 0.0; Node36_Is_Less( Output_N35, NF_PORT_CONSTANT( float( 0.5 ), Port_Input1_N036 ), Output_N36, Globals );
			float3 Output_N38 = float3(0.0); Node38_Mix( NF_PORT_CONSTANT( float3( 0.5, 0.5, 0.5 ), Port_Input0_N038 ), Value_N250, Output_N36, Output_N38, Globals );
			float3 Export_N41 = float3(0.0); Node41_Float_Export( Output_N38, Export_N41, Globals );
			float4 Output_N26 = float4(0.0); Node26_PBR_Lighting( Color_N45.xyz, Output_N161, Export_N41, NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Emissive_N026 ), NF_PORT_CONSTANT( float( 0.82 ), Port_Metallic_N026 ), NF_PORT_CONSTANT( float( 0.19 ), Port_Roughness_N026 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_AO_N026 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_SpecularAO_N026 ), Output_N26, Globals );
			
			Input1 = Output_N26;
		}
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float4 Result_N252 = float4(0.0); Node252_If_else( float( 0.0 ), float4( 0.0, 0.0, 0.0, 0.0 ), float4( 0.0, 0.0, 0.0, 0.0 ), Result_N252, Globals );
			float Output_N259 = 0.0; Node259_Conditional( float( 1.0 ), float( 1.0 ), float( 0.0 ), Output_N259, Globals );
			float2 UVCoord_N28 = float2(0.0); Node28_Surface_UV_Coord( UVCoord_N28, Globals );
			float2 Output_N31 = float2(0.0); Node31_Multiply( UVCoord_N28, NF_PORT_CONSTANT( float2( 2.0, 2.0 ), Port_Input1_N031 ), Output_N31, Globals );
			float2 Output_N33 = float2(0.0); Node33_Subtract_One( Output_N31, Output_N33, Globals );
			float Output_N34 = 0.0; Node34_Dot_Product( Output_N33, Output_N33, Output_N34, Globals );
			float Output_N246 = 0.0; Node246_Clamp( Output_N34, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N246 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N246 ), Output_N246, Globals );
			float Output_N247 = 0.0; Node247_One_Minus( Output_N246, Output_N247, Globals );
			float Output_N249 = 0.0; Node249_Sqrt( Output_N247, Output_N249, Globals );
			float3 Value_N250 = float3(0.0); Node250_Construct_Vector( Output_N33, Output_N249, Value_N250, Globals );
			float Output_N35 = 0.0; Node35_Distance( UVCoord_N28, NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Input1_N035 ), Output_N35, Globals );
			float Output_N36 = 0.0; Node36_Is_Less( Output_N35, NF_PORT_CONSTANT( float( 0.5 ), Port_Input1_N036 ), Output_N36, Globals );
			float3 Output_N38 = float3(0.0); Node38_Mix( NF_PORT_CONSTANT( float3( 0.5, 0.5, 0.5 ), Port_Input0_N038 ), Value_N250, Output_N36, Output_N38, Globals );
			float3 Export_N41 = float3(0.0); Node41_Float_Export( Output_N38, Export_N41, Globals );
			float4 Output_N258 = float4(0.0); Node258_PBR_Lighting( Result_N252.xyz, Output_N259, Export_N41, NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Emissive_N258 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Metallic_N258 ), NF_PORT_CONSTANT( float( 0.29 ), Port_Roughness_N258 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_AO_N258 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_SpecularAO_N258 ), Output_N258, Globals );
			
			Input2 = Output_N258;
		}
		Output = Input2; 
	}
}
void Node42_Conditional( in float Input0, in float4 Input1, in float4 Input2, out float4 Output, ssGlobals Globals )
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
			Node46_Texture_2D_Object_Parameter( Globals );
			float2 UVCoord_N160 = float2(0.0); Node160_Surface_UV_Coord( UVCoord_N160, Globals );
			float2 CoordsOut_N159 = float2(0.0); Node159_Rotate_Coords( UVCoord_N160, NF_PORT_CONSTANT( float( -90.0 ), Port_Rotation_N159 ), NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Center_N159 ), CoordsOut_N159, Globals );
			float Value_N7 = 0.0; Node7_Particle_Get_Attribute( Value_N7, Globals );
			float Value_N47 = 0.0; Node47_Particle_Get_Attribute( Value_N47, Globals );
			float ValueOut_N156 = 0.0; Node156_Remap( Value_N47, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_RangeMinA_N156 ), NF_PORT_CONSTANT( float( 1.0 ), Port_RangeMaxA_N156 ), NF_PORT_CONSTANT( float( 10.0 ), Port_RangeMinB_N156 ), NF_PORT_CONSTANT( float( 20.0 ), Port_RangeMaxB_N156 ), Globals );
			float4 Color_N45 = float4(0.0); Node45_Flipbook_Sample( NF_PORT_CONSTANT( float2( 4.0, 4.0 ), Port_SpriteCount_N045 ), NF_PORT_CONSTANT( float( 16.0 ), Port_MaxFrames_N045 ), CoordsOut_N159, Value_N7, ValueOut_N156, NF_PORT_CONSTANT( float( 0.0 ), Port_SecondOffset_N045 ), Color_N45, Globals );
			float Output_N173 = 0.0; Node173_Swizzle( Color_N45, Output_N173, Globals );
			float4 Value_N29 = float4(0.0); Node29_Particle_Get_Attribute( Value_N29, Globals );
			float Output_N277 = 0.0; Node277_Swizzle( Value_N29, Output_N277, Globals );
			float Output_N161 = 0.0; Node161_Multiply( Output_N173, Output_N277, Output_N161, Globals );
			float2 UVCoord_N28 = float2(0.0); Node28_Surface_UV_Coord( UVCoord_N28, Globals );
			float2 Output_N31 = float2(0.0); Node31_Multiply( UVCoord_N28, NF_PORT_CONSTANT( float2( 2.0, 2.0 ), Port_Input1_N031 ), Output_N31, Globals );
			float2 Output_N33 = float2(0.0); Node33_Subtract_One( Output_N31, Output_N33, Globals );
			float Output_N34 = 0.0; Node34_Dot_Product( Output_N33, Output_N33, Output_N34, Globals );
			float Output_N246 = 0.0; Node246_Clamp( Output_N34, NF_PORT_CONSTANT( float( 0.0 ), Port_Input1_N246 ), NF_PORT_CONSTANT( float( 1.0 ), Port_Input2_N246 ), Output_N246, Globals );
			float Output_N247 = 0.0; Node247_One_Minus( Output_N246, Output_N247, Globals );
			float Output_N249 = 0.0; Node249_Sqrt( Output_N247, Output_N249, Globals );
			float3 Value_N250 = float3(0.0); Node250_Construct_Vector( Output_N33, Output_N249, Value_N250, Globals );
			float Output_N35 = 0.0; Node35_Distance( UVCoord_N28, NF_PORT_CONSTANT( float2( 0.5, 0.5 ), Port_Input1_N035 ), Output_N35, Globals );
			float Output_N36 = 0.0; Node36_Is_Less( Output_N35, NF_PORT_CONSTANT( float( 0.5 ), Port_Input1_N036 ), Output_N36, Globals );
			float3 Output_N38 = float3(0.0); Node38_Mix( NF_PORT_CONSTANT( float3( 0.5, 0.5, 0.5 ), Port_Input0_N038 ), Value_N250, Output_N36, Output_N38, Globals );
			float3 Export_N41 = float3(0.0); Node41_Float_Export( Output_N38, Export_N41, Globals );
			float4 Output_N26 = float4(0.0); Node26_PBR_Lighting( Color_N45.xyz, Output_N161, Export_N41, NF_PORT_CONSTANT( float3( 0.0, 0.0, 0.0 ), Port_Emissive_N026 ), NF_PORT_CONSTANT( float( 0.82 ), Port_Metallic_N026 ), NF_PORT_CONSTANT( float( 0.19 ), Port_Roughness_N026 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_AO_N026 ), NF_PORT_CONSTANT( float3( 1.0, 1.0, 1.0 ), Port_SpecularAO_N026 ), Output_N26, Globals );
			
			Input1 = Output_N26;
		}
		Output = Input1; 
	} 
	else 
	{ 
		/* Input port: "Input2"  */
		
		{
			float4 Output_N11 = float4(0.0); Node11_Conditional( float( 1.0 ), float4( 1.0, 1.0, 1.0, 1.0 ), float4( 0.5, 0.0, 0.0, 0.0 ), Output_N11, Globals );
			
			Input2 = Output_N11;
		}
		Output = Input2; 
	}
}
void Node37_Set_Color_Pixel( in float4 Color, ssGlobals Globals )
{ 
	#ifdef FRAGMENT_SHADER
	Output_Color0 = Color;
	#endif
}

//-----------------------------------------------------------------------

vec3  ngsTempNormal;
vec4  ngsTempTangent;
vec2  ngsTempUVCoord0;
vec2  ngsTempUVCoord1;
float ngsTempBinormalSign;

//-----------------------------------------------------------------------

void main() 
{
	sc_DiscardStereoFragment();
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	NF_SETUP_PREVIEW_PIXEL()
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	vec4 renderTarget0Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget0, vec2( 0.5 ), 0.0);
	vec4 renderTarget1Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget1, vec2( 0.5 ), 0.0);
	vec4 renderTarget2Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget2, vec2( 0.5 ), 0.0);
	vec4 renderTarget3Sample = SC_SAMPLE_TEX_LEVEL_R(renderTarget3, vec2( 0.5 ), 0.0);
	
	if ( dot( renderTarget0Sample + renderTarget1Sample + renderTarget2Sample + renderTarget3Sample, vec4( 0.2542325 ) ) == 0.3423183476 )
	{
		discard; // hack so the texture filter modes don't get wiped out
	}
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ngsTempNormal.xyz  = ( sc_GetGlFrontFacing() ) ? varNormal.xyz  : -varNormal.xyz;
	ngsTempTangent.xyz = ( sc_GetGlFrontFacing() ) ? varTangent.xyz : -varTangent.xyz;
	ngsTempUVCoord0 = ( sc_GetGlFrontFacing() ) ? varTex01.xy : vec2( 1.0-varTex01.x, varTex01.y );
	ngsTempUVCoord1 = ( sc_GetGlFrontFacing() ) ? varTex01.zw : vec2( 1.0-varTex01.z, varTex01.w );
	ngsTempBinormalSign = ( sc_GetGlFrontFacing() ) ? 1.0 : -1.0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	gParticle.Color = Interp_Particle_Color;
	gParticle.Size = Interp_Particle_Size;
	gParticle.Mass = Interp_Particle_Mass;
	gParticle.Velocity = Interp_Particle_Velocity;
	gParticle.Position = Interp_Particle_Position;
	gParticle.Life = Interp_Particle_Life;
	gParticle.Age = Interp_Particle_Age;
	gParticle.Dead = Interp_Particle_Dead;
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssGlobals Globals;	
	Globals.gTimeElapsed        = ( overrideTimeEnabled == 1 ) ? overrideTimeElapsed : sc_TimeElapsed;
	Globals.gTimeDelta          = ( overrideTimeEnabled == 1 ) ? overrideTimeDelta : max( sc_TimeDelta, ssDELTA_TIME_MIN );
	Globals.gTimeElapsedShifted = Globals.gTimeElapsed - gParticle.TimeShift * Globals.gTimeDelta - 0.0;
	Globals.BumpedNormal              = float3( 0.0 );
	Globals.ViewDirWS                 = normalize(sc_Camera.position - varPos);
	Globals.PositionWS                = varPos;
	Globals.VertexTangent_WorldSpace  = normalize( ngsTempTangent.xyz );
	Globals.VertexNormal_WorldSpace   = normalize( ngsTempNormal );
	Globals.VertexBinormal_WorldSpace = cross( Globals.VertexNormal_WorldSpace, Globals.VertexTangent_WorldSpace.xyz );
	Globals.Surface_UVCoord0          = ngsTempUVCoord0;
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	ssCalculateDynamicAttributes( Interp_Particle_Index, gParticle );
	Globals.gTimeElapsedShifted = Globals.gTimeElapsed - gParticle.TimeShift * Globals.gTimeDelta - 0.0; // fix for TimeShift not being setup yet...
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Output_Color0 = gParticle.Color;
	Output_Color1 = vec4( 0.0 );
	Output_Color2 = vec4( 0.0 );
	Output_Color3 = vec4( 0.0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Execution Code
	
	Node39_Output_Quad_World_Space( NF_PORT_CONSTANT( float( 0.0 ), Port_AlphaTestThreshold_N039 ), Globals );
	float4 Output_N42 = float4(0.0); Node42_Conditional( float( 1.0 ), float4( 1.0, 1.0, 1.0, 1.0 ), float4( 0.501961, 0.0, 0.00813306, 1.0 ), Output_N42, Globals );
	Node37_Set_Color_Pixel( Output_N42, Globals );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Alpha Test
	
	#if 0
	
	if ( Output_Color0.a < AlphaTestFunction_N39( Globals ) )
	{
		discard;
	}
	
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	// Alpha to Coverage
	
	#ifdef ENABLE_STIPPLE_PATTERN_TEST
	
	vec2  localCoord = floor( mod( sc_GetGlFragCoord().xy, vec2( 4.0 ) ) );
	float threshold  = ( mod( dot( localCoord, vec2( 4.0, 1.0 ) ) * 9.0, 16.0 ) + 1.0 ) / 17.0;
	
	if ( Output_Color0.a < threshold )
	{
		discard;
	}
	
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	Output_Color0 = ngsPixelShader( Output_Color0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	#if defined( sc_ProjectiveShadowsCaster )
	
	if ( Output_Color0.a < 1.0 / 256.0 )
	discard;
	
	vec4 CasterColor = evaluateShadowCasterColor( Output_Color0 );
	
	sc_writeFragData0( CasterColor );
	
	#else
	
	#ifdef STUDIO
	vec4 Cost = getPixelRenderingCost();
	if ( Cost.w > 0.0 )
	Output_Color0 = Cost;
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	sc_writeFragData0( Output_Color0 );
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	processOIT( Output_Color0 );
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	
	
	#endif
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	NF_PREVIEW_OUTPUT_PIXEL()
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( sc_IsEditor )
	{
		//sc_writeFragData0( sc_readFragData0() + _sc_allow16TexturesMarker );
	}
}

#endif //FRAGMENT SHADER
