//-----------------------------------------------------------------------
// Copyright (c) 2022 Snap Inc.
//-----------------------------------------------------------------------
#pragma once

#ifdef FRAGMENT_SHADER

#include "pbr.glsl"
#include "spherical_gaussians.glsl"

#include <std2.glsl>

vec3 calculateLightEstimationSpecular(SurfaceProperties surfaceProperties, vec3 V) {
    // SG evaluation assumes quadratic roughness curve, so trasform r -> r * r
    // clamp to 0.01 for numeric stability
    float roughness = clamp(surfaceProperties.roughness * surfaceProperties.roughness, 0.01, 1.0);

    vec3 accumulatedLight = sc_LightEstimationData.ambientLight * surfaceProperties.specColor;

    for (int i = 0; i < sc_LightEstimationSGCount; ++i) {
        accumulatedLight += SpecularTermSG(sc_LightEstimationData.sg[i], surfaceProperties.normal, roughness, V, surfaceProperties.specColor);
    }

    return accumulatedLight;
}

vec3 calculateLightEstimationDiffuse(vec3 N) {
    vec3 accumulatedLight = sc_LightEstimationData.ambientLight;

    for (int i = 0; i < sc_LightEstimationSGCount; ++i) {
        accumulatedLight += DiffuseTermSG(sc_LightEstimationData.sg[i], N);
    }

    return accumulatedLight;
}

#endif // #ifdef FRAGMENT_SHADER
