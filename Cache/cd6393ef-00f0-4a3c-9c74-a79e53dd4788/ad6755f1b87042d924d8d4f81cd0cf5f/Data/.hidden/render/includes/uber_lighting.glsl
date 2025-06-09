//-----------------------------------------------------------------------
// Copyright (c) 2017 Snap Inc.
//-----------------------------------------------------------------------
#pragma once

#include "uniforms.glsl"

#ifdef FRAGMENT_SHADER

#include "pbr.glsl"
#include "envmap.glsl"
#include "light_estimation.glsl"
#include "spherical_harmonics.glsl"
#include "utils.glsl"

#include <std2.glsl>

#define MAX_MIP_BIAS 13.0

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Ambient diffuse lighting

vec3 sampleDiffuseEnvmap(vec3 N) {
    vec2 uv = calcPanoramicTexCoordsFromDir(N, sc_EnvmapRotation.y);

    vec4 tex;

    if (sc_EnvLightMode == sc_AmbientLightMode_FromCamera) {
        if (DEVICE_IS_FAST) {
            uv = calcSeamlessPanoramicUvsForSampling(uv, sc_EnvmapSpecularSize.xy, sc_MaxRoughnessMip);
        }
        tex = SC_SAMPLE_VIEW_BIAS(sc_EnvmapSpecular, uv, MAX_MIP_BIAS); // This won't sample the smallest mip, rather sc_MaxRoughnessMip, because max mip lod is clamped from C++ side for envmaps. See Sampler::Envmap.
    } else {
        if (sc_MaxTextureImageUnits > 8 && sc_HasDiffuseEnvmap) {
            uv = calcSeamlessPanoramicUvsForSampling(uv, sc_EnvmapDiffuseSize.xy, 0.0);
            #if (SC_BACKEND_LANGUAGE_VERSION >= 310) || defined (SC_BACKEND_LANGUAGE_METAL)
            if (IsProxyMode()) {
                tex = SC_SAMPLE_VIEW_LEVEL(sc_EnvmapDiffuse, uv, 0.0); // In proxy mode gradients could be wrong because not all neighboring pixels are executed at all. Use level 0
            } else 
            #endif
            {
                tex = SC_SAMPLE_VIEW_BIAS(sc_EnvmapDiffuse, uv, -MAX_MIP_BIAS); // Must load the top mip, otherwise there will be a seam where the u coordinate wraps around from 1 to 0 in the panoramic mapping, because the derivatives get screwed up.
            }
        } else {
            // If the hardware doesn't support more than 8 textures or we have no diffuse map available, don't sample the diffuse envmap, and emulate it with a low mip of the specular envmap.
            // This allows us to use one extra texture on the content side, since devices that support less textures will sample one less texture, and other devices are fine to sample more textures.
            tex = SC_SAMPLE_VIEW_BIAS(sc_EnvmapSpecular, uv, MAX_MIP_BIAS); // This won't sample the smallest mip, rather sc_MaxRoughnessMip, because max mip lod is clamped from C++ side for envmaps. See Sampler::Envmap.
        }
    }

    return decodeRGBD(tex) * sc_EnvmapExposure;
}

#define EVALUATE_AMBIENT_LIGHT(accumulatedLight, INDEX)\
    if (sc_AmbientLightsCount > INDEX) {\
        if (sc_AmbientLightMode##INDEX == sc_AmbientLightMode_Constant) {\
            accumulatedLight += sc_AmbientLights[INDEX].color * sc_AmbientLights[INDEX].intensity;\
        } else {\
            accumulatedLight.r += SC_EPSILON * sc_AmbientLights[INDEX].color.r; /* HACK: 09/11/2018 Adreno drivers optimize out and rearrange array elements if no members are used, which breaks ambient light indexing. This is how we force it to not optimize.*/ \
        }\
    }

vec3 calculateDiffuseIrradiance(vec3 N) {
    vec3 accumulatedLight = vec3(0.0);

    // Use environment light
    if (sc_EnvLightMode == sc_AmbientLightMode_EnvironmentMap || sc_EnvLightMode == sc_AmbientLightMode_FromCamera) {
        accumulatedLight = sampleDiffuseEnvmap(N);
    } else if (sc_EnvLightMode == sc_AmbientLightMode_SphericalHarmonics) {
        accumulatedLight = evaluateSh(sc_Sh[0], sc_Sh[1], sc_Sh[2], sc_Sh[3], sc_Sh[4], sc_Sh[5], sc_Sh[6], sc_Sh[7], sc_Sh[8], -N) * sc_ShIntensity;
    }

    // Use ambient lights
    EVALUATE_AMBIENT_LIGHT(accumulatedLight, 0)
    EVALUATE_AMBIENT_LIGHT(accumulatedLight, 1)
    EVALUATE_AMBIENT_LIGHT(accumulatedLight, 2)

    if (sc_LightEstimation) {
        accumulatedLight += calculateLightEstimationDiffuse(N);
    }

#ifndef MOBILE
    // [HACK for Studio 04/17/2023] Because we gather material properties in a state where there are no lights (and anyway there are not always indirect lights in every scene), 
    // the AO texture doesn't show up in the material inspector on Nvidia, as AO is optimized out given that there is zero indirect diffuse light. 
    // We add an epsilon here to solve that. 
    accumulatedLight.r += SC_EPSILON;
#endif

    return accumulatedLight;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////
// Ambient specular lighting

vec4 sampleSpecularEnvTextureLod(vec2 uv, float lod) {
    return SC_SAMPLE_VIEW_LEVEL(sc_EnvmapSpecular, uv, lod);
}

vec3 sampleSpecularEnvTextureLod(vec3 R, float lod) {
    vec4 tex;
    vec2 uv = calcPanoramicTexCoordsFromDir(R, sc_EnvmapRotation.y);

    if (DEVICE_IS_FAST) {
        // Seamless envmap lookup.
        // Since the seamless uv offset is specific per LOD, we can't use a trilinear filtered lookup directly.
        // We need to sample the two mips separately with the appropriate offset at each level, then blend manually.
        float lodFloor = floor(lod);
        float lodCeil = ceil(lod);
        float lodFrac = lod - lodFloor;

        vec2 uvFloor = calcSeamlessPanoramicUvsForSampling(uv, sc_EnvmapSpecularSize.xy, lodFloor);
        vec4 texFloor = sampleSpecularEnvTextureLod(uvFloor, lodFloor);

        vec2 uvCeil = calcSeamlessPanoramicUvsForSampling(uv, sc_EnvmapSpecularSize.xy, lodCeil);
        vec4 texCeil = sampleSpecularEnvTextureLod(uvCeil, lodCeil);

        tex = mix(texFloor, texCeil, lodFrac);
    } else {
        tex = sampleSpecularEnvTextureLod(uv, lod);
    }

    return decodeRGBD(tex);
}

vec3 sampleSpecularEnvmapLod(vec3 R, float lod) {
    vec3 res = sampleSpecularEnvTextureLod(R, lod) * sc_EnvmapExposure;

#ifndef MOBILE
    res += vec3(SC_EPSILON); // HACK 05/23/2018: Nvidia compiler messes up and kills specular AO without this.
#endif

    return res;
}

float computeDistanceAttenuation(float distanceToLight, float falloffEndDistance) {
    float distanceToLightSquared = distanceToLight * distanceToLight;

    float result;
    if (falloffEndDistance == 0.0) {
        result = 1.0 / distanceToLightSquared;
    } else {

        float distanceToLightToTheFourth = distanceToLightSquared * distanceToLightSquared;
        float falloffEndDistanceToTheFourth = pow(falloffEndDistance, 4.0);

        // recommended quadratic falloff implementation from: https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Khronos/KHR_lights_punctual/README.md#range-property
        result = max(min(1.0 - (distanceToLightToTheFourth / falloffEndDistanceToTheFourth), 1.0), 0.0) / distanceToLightSquared;
    }
    return result;
}

// recommended implementation from: https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Khronos/KHR_lights_punctual/README.md#inner-and-outer-cone-angles
float computeAngularAttenuation(vec3 directionToLight, vec3 lightDirection, float angleScale, float angleOffset) {
    float cd = dot(directionToLight, lightDirection);
    float angularAttenuation = clamp(cd * angleScale + angleOffset, 0.0, 1.0);
    return angularAttenuation * angularAttenuation;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Evaluate lighting
// This function evaluates all lighting for a surface based on its surface properties and all the existing
// lighting in the environment (multiple lights, ambient, reflections, etc).

LightingComponents evaluateLighting(SurfaceProperties surfaceProperties) {
    LightingComponents lighting = defaultLightingComponents();

    vec3 V = surfaceProperties.viewDirWS;

    int numLights = 0;
    vec4 bakedShadows = vec4(surfaceProperties.bakedShadows, 1.0);

    // Directional lights
    if (sc_DirectionalLightsCount > 0) {
        for(int i = 0; i < sc_DirectionalLightsCount; ++i) {
            sc_DirectionalLight_t light = sc_DirectionalLights[i];
            LightProperties lightProperties;
            lightProperties.direction = light.direction;
            lightProperties.color = light.color.rgb;
            lightProperties.attenuation = light.color.a;
            lightProperties.attenuation *= bakedShadows[numLights < 3 ? numLights : 3];
            numLights++;
            lighting = accumulateLight(lighting, lightProperties, surfaceProperties, V);
        }
    }

    // Point lights
    if (sc_PointLightsCount > 0) {
        for(int i = 0; i < sc_PointLightsCount; ++i) {
            sc_PointLight_t light = sc_PointLights[i];
            vec3 L = light.position - surfaceProperties.positionWS;
            LightProperties lightProperties;
            lightProperties.direction = normalize(L);
            lightProperties.color = light.color.rgb;
            lightProperties.attenuation = light.color.a;
            lightProperties.attenuation *= bakedShadows[numLights < 3 ? numLights : 3];
            lightProperties.attenuation *= computeAngularAttenuation(lightProperties.direction,
                                                                     light.direction,
                                                                     light.angleScale,
                                                                     light.angleOffset);
            if (light.falloffEnabled) {
                lightProperties.attenuation *= computeDistanceAttenuation(length(L), light.falloffEndDistance);
            }
            numLights++;
            lighting = accumulateLight(lighting, lightProperties, surfaceProperties, V);
        }
    }

    if (sc_ProjectiveShadowsReceiver) { // TODO 2018/11/27: We should only shadow the light that is marked as "caster". To do it efficiently, we'd need to pass all light properties through defines and convert loops above to #-macro-s.
        vec3 shadowColor = evaluateShadow();
        lighting.directDiffuse *= shadowColor;
        lighting.directSpecular *= shadowColor;
    }

    if (!ENABLE_SPECULAR_LIGHTING) {
        lighting.directSpecular = vec3(0.0);
    }

    if (!ENABLE_DIFFUSE_LIGHTING) {
        lighting.directDiffuse = vec3(0.0);
    }

    // Indirect diffuse
    if (ENABLE_DIFFUSE_LIGHTING) {
        lighting.indirectDiffuse = calculateIndirectDiffuse(surfaceProperties);
    } else {
        lighting.indirectDiffuse = vec3(0.0);
    }

    // Indirect specular
    if (ENABLE_SPECULAR_LIGHTING) {
        lighting.indirectSpecular = calculateIndirectSpecular(surfaceProperties, V);
    }

    return lighting;
}

#endif // #ifdef FRAGMENT_SHADER
