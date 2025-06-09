//-----------------------------------------------------------------------
// Copyright (c) 2021 Snap Inc.
//-----------------------------------------------------------------------
#pragma once

#include "utils.glsl"

#include <std2.glsl>

vec3 EvaluateSG(sc_SphericalGaussianLight_t sg, vec3 dir) {
    float cosAngle = dot(dir, sg.axis);
    return sg.color * exp(sg.sharpness * (cosAngle - 1.0));
}

sc_SphericalGaussianLight_t CombineSGs(sc_SphericalGaussianLight_t lhs, sc_SphericalGaussianLight_t rhs) {
    float lm = lhs.sharpness + rhs.sharpness;
    vec3 um = (lhs.sharpness * lhs.axis + rhs.sharpness * rhs.axis) / lm;
    float umLength = length(um);

    sc_SphericalGaussianLight_t res;
    res.axis = um * (1.0 / umLength);
    res.sharpness = lm * umLength;
    res.color = lhs.color * rhs.color * exp(lm * (umLength - 1.0));

    return res;
}

vec3 ApproximateSGIntegral(sc_SphericalGaussianLight_t sg) {
    return 2.0 * PI * (sg.color / sg.sharpness);
}

vec3 SGInnerProduct(sc_SphericalGaussianLight_t lhs, sc_SphericalGaussianLight_t rhs) {
    float dm = length(lhs.sharpness * lhs.axis + rhs.sharpness * rhs.axis);
    vec3 expo = exp(dm - lhs.sharpness - rhs.sharpness) * lhs.color * rhs.color;
    float other = 1.0 - exp(-2.0 * dm);
    return (2.0 * PI * expo * other) / dm;
}

vec3 DiffuseTermSG(sc_SphericalGaussianLight_t lightingLobe, vec3 normal) {
    float muDotN = dot(lightingLobe.axis, normal);
    float lambda = lightingLobe.sharpness;

    float c0 = 0.36;
    float c1 = 1.0 / (4.0 * c0);

    float eml = exp(-lambda);
    float em2l = eml * eml;
    float rl = 1.0 / lambda;

    float scale = 1.0 + 2.0 * em2l - rl;
    float bias = (eml - em2l) * rl - em2l;

    float x = sqrt(1.0 - scale);
    float x0 = c0 * muDotN;
    float x1 = c1 * x;

    float n = x0 + x1;

    float y = saturate(muDotN);

    y = step(abs(x0), x1) > 0.5 ? n * n / x : y;

    float result = scale * y + bias;

    // https://www.gamedev.net/forums/topic/670807-pi-or-not-to-pi/
    return result * ApproximateSGIntegral(lightingLobe) / PI;
}

sc_SphericalGaussianLight_t DistributionTermSG(vec3 direction, float roughness) {
    sc_SphericalGaussianLight_t distribution;

    distribution.axis = direction;
    float m2 = roughness * roughness;
    distribution.sharpness = 2.0 / m2;
    distribution.color = vec3(1.0 / (PI * m2));

    return distribution;
}

sc_SphericalGaussianLight_t WarpDistributionSG(sc_SphericalGaussianLight_t ndf, vec3 view) {
    sc_SphericalGaussianLight_t warp;

    warp.axis = reflect(-view, ndf.axis);
    warp.color = ndf.color;
    warp.sharpness = ndf.sharpness;
    warp.sharpness /= (4.0 * max(dot(ndf.axis, view), 0.0001));

    return warp;
}

float GGX_V1(float m2, float nDotX) {
    return 1.0 / (nDotX + sqrt(m2 + (1.0 - m2) * nDotX * nDotX));
}

vec3 SpecularTermSG(sc_SphericalGaussianLight_t light, vec3 normal,
                    float roughness, vec3 view, vec3 specColor) {
    // Create an SG that approximates the NDF.
    sc_SphericalGaussianLight_t ndf = DistributionTermSG(normal, roughness);

    // Warp the distribution so that our lobe is in the same
    // domain as the lighting lobe
    sc_SphericalGaussianLight_t warpedNDF = WarpDistributionSG(ndf, view);

    // Convolve the NDF with the SG light
    vec3 result = SGInnerProduct(warpedNDF, light);

    // Parameters needed for the visibility
    vec3 warpDir = warpedNDF.axis;
    float m2 = roughness * roughness;
    float nDotL = saturate(dot(normal, warpDir));
    float nDotV = saturate(dot(normal, view));
    vec3 h = normalize(warpedNDF.axis + view);

    // Visibility term evaluated at the center of
    // our warped BRDF lobe
    result *= GGX_V1(m2, nDotL) * GGX_V1(m2, nDotV);

    // Fresnel evaluated at the center of our warped BRDF lobe
    float powTerm = pow((1.0 - saturate(dot(warpDir, h))), 5.0);
    result *= specColor + (1.0 - specColor) * powTerm;

    // Cosine term evaluated at the center of the BRDF lobe
    result *= nDotL;

    return result;
}
