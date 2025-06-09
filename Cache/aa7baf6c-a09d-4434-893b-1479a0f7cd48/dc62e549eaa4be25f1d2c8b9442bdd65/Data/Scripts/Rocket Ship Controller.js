// RocketController.js
// Version: 1.0.0
// Event: On Awake
// Description: Controls parameters for Rocket Particles, which are specalized GPU Particle materials.

/*
 * How it works:
 * This effect works using a modified version of the GPU Particles material. In each particle material, 
 * we add extra controls to apply color and lighting to the rocketships. These additions are specific
 * to each material, and are performed after the default particle calculations for position and color.
 * 
 * We encourage you to check out these additional controls by looking at the Rocket Ship Particles and
 * Rocket Tail Particles materials in the Material Graph Editor.
 * 
 * The reason the ships and tails move together is because GPU Particles is a deterministic system.
 * This means that giving each material the same input will produce the same output.
 * This script is mainly acting as a control interface, and ensures that movement parameters (movement, 
 * velocity, lifetime, spawn shape, noise, etc) are copied between both materials.
 */


// @ui {"widget":"group_start", "label":"Rocketship Particle Materials"}
    // @input Asset.Material rocketShipMaterial {"label":"Ship Material"}
    // @input Asset.Material rocketTailMaterial {"label":"Tail Material"}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}

// @ui {"widget":"group_start", "label":"Color Settings"}
    // @ui {"widget":"group_start", "label":"Hull Colors"}
        // @input string shipColorInput = "scriptInput" {"label":"Color Source", "widget":"combobox", "values":[{"label":"Material", "value":"shipMaterialInput"}, {"label":"Script", "value":"scriptInput"}]}
        // @input vec3 shipColorHull = {1.0, 1.0, 1.0} {"showIf":"shipColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Hull"}
        // @input vec3 shipColorMetal = {0.14, 0.16, 0.17} {"showIf":"shipColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Metal Parts"}
        // @input vec3 shipColorBolts = {0.5, 0.5, 0.5} {"showIf":"shipColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Bolts"}
        // @input vec3 shipColorDetails = {1.0, 0.68, 0.0} {"showIf":"shipColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Details"}
        // @ui {"widget":"group_start", "label":"Window", "showIf":"shipColorInput", "showIfValue":"scriptInput"}
            // @input vec3 shipColorWindow = {0.0, 0.06, 1.0} {"widget":"color", "label":"Base Color"}
            // @input bool useWindowTexture = false {"label":"Use Texture", "hint":"Applies a texture on top of the Base Color."}
            // @input Asset.Texture windowTex {"showIf":"useWindowTexture"}
        // @ui {"widget":"group_end"}
        // @ui {"widget":"group_start", "label":"Nose and Fins", "showIf":"shipColorInput", "showIfValue":"scriptInput"}
            // @input bool shipColorRandom = true {"label":"Random Color", "hint":"Allows you to randomize the color of the Nose and Fins.\n\nNOTE: The Nose and Fins use the results of the calculated particle color, which is determined by the Random Color Parameters on the particles material.\n\nTIP: For more variation, try disabling \"Mono Color Random on the Rocket Ship Particles material.\""}
            // @input vec3 shipColorNoseFins = {1.0, 0.0, 0.0} {"widget":"color", "label":"Base Color", "hint":"NOTE: This input takes advantage of Random Color parameters on the particles material (instead of using its own dedicated parameter.)"}
            // @input vec3 shipColorNoseFins2 = {0.0, 0.0, 1.0} {"showIf":"shipColorRandom", "label":"Secondary Color", "widget":"color", "hint":"NOTE: This input takes advantage of Random Color parameters on the particles material (instead of using its own dedicated parameter.)"}
        // @ui {"widget":"group_end"}   
    // @ui {"widget":"group_end"}
    // @ui {"widget":"label"}

    // @ui {"widget":"group_start", "label":"Tail Colors"}
        // @input string tailColorInput = "scriptInput" {"label":"Color Source", "widget":"combobox", "values":[{"label":"Material", "value":"tailMaterialInput"}, {"label":"Script", "value":"scriptInput"}]}
        // @input vec4 tailColor1 = {1.0, 1.0, 1.0, 1.0} {"showIf":"tailColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Color 1", "hint":"The first tail color. This is the color closest to the engine, and the beginning of the gradient."}
        // @input vec4 tailColor2 = {1.0, 1.0, 0.0, 1.0} {"showIf":"tailColorInput", "showIfValue":"scriptInput","widget":"color", "label":"Color 2", "hint":"The second tail color."}
        // @input vec4 tailColor3 = {1.0, 0.56, 0.0, 1.0} {"showIf":"tailColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Color 3", "hint":"The third tail color. This is the color in the middle of the gradient."}
        // @input vec4 tailColor4 = {1.0, 0.08, 0.0, 0.9} {"showIf":"tailColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Color 4", "hint":"The fourth tail color."}
        // @input vec4 tailColor5 = {0.0, 0.11, 0.43, 0.7} {"showIf":"tailColorInput", "showIfValue":"scriptInput", "widget":"color", "label":"Color 5", "hint":"The last tail color. This is the end of the flame."}
        // @input float emissionIntensity = 1.0 {"showIf":"tailColorInput", "showIfValue":"scriptInput", "label":"Emission Intensity", "widget":"slider", "min":0.0, "max":2.0, "step":0.1}
    // @ui {"widget":"group_end"}
// @ui {"widget":"group_end"}
// @ui {"widget":"label"}

// @ui {"widget":"group_start", "label":"Spawn Settings"}
    // @input string spawnSource = "scriptInput" {"label":"Spawn Source", "widget":"combobox", "values":[{"label":"Ship Material", "value":"shipMaterialInput"}, {"label":"Tail Material", "value":"tailMaterialInput"}, {"label":"Script", "value":"scriptInput"}]}
    // @input int numShips = 50 {"showIf":"spawnSource", "showIfValue":"scriptInput", "label":"Number of Ships", "widget":"slider", "min":1, "max":500, "step":1}
    // @input vec2 lifeTimeMinMax = {7.0, 10.0} {"showIf":"spawnSource", "showIfValue":"scriptInput", "label":"Life Min / Max", "hint":"Sets each particle's lifetime (in seconds) to be a random value between these two numbers."}
    // @input float spawnRadius = 50.0 {"showIf":"spawnSource", "showIfValue":"scriptInput", "label":"Spawn Radius", "hint":"Controls how large the sphere is that the rocket ships will spawn within."}
    // @input vec2 sizeMinMax = {2.0, 3.0} {"showIf":"spawnSource", "showIfValue":"scriptInput", "label":"Size Min / Max", "hint":"The minimum and maximum size each particle can be. Calculates a random value per particle."}
// @ui {"widget":"group_end"}
// @ui {"widget":"label"}

// @ui {"widget":"group_start", "label":"Movement Settings"}
    // @input string movementSource = "scriptInput" {"label":"Movement Source", "widget":"combobox", "values":[{"label":"Ship Material", "value":"shipMaterialInput"}, {"label":"Tail Material", "value":"tailMaterialInput"}, {"label":"Script", "value":"scriptInput"}], "tooltip":"Choose how basic movement settings will be controlled."}
    // @input vec3 velocityMin = {-20.0, -20.0, -20.0} {"showIf":"movementSource", "showIfValue":"scriptInput", "hint":"The minimum velocity in X, Y, and Z directions"}
    // @input vec3 velocityMax = {20.0, 20.0, 20.0} {"showIf":"movementSource", "showIfValue":"scriptInput", "label":"Velocity Max", "hint":"The maximum velocity in X, Y, and Z directions"}
    // @input vec3 velocityDrag = {1.0, 1.0, 1.0} {"showIf":"movementSource", "showIfValue":"scriptInput", "hint":"Determines how much the velocity force acts on each particle. The default value is 1."}
    // @input vec2 rotationRateZ = {-2.0, 2.0} {"showIf":"movementSource", "showIfValue":"scriptInput", "label":"Rotation Rate Min / Max", "hint":"The min and max number of rotations each ship completes over its lifetime."}
    // @input float gravity = -9.8 {"showIf":"movementSource", "showIfValue":"scriptInput", "hint":"The gravity force affecting particles (cm / s)"}
    // @input vec3 localForce = {0.0, 0.0, 0.0} {"showIf":"movementSource", "showIfValue":"scriptInput", "hint":"Secondary X, Y, and Z forces affecting particles (cm / s). Can be used for wind."}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}

// @input bool advanced = false
// @ui {"widget":"group_start", "label":"Settings", "showIf":"advanced"}  
    // @ui {"widget":"label", "label":"Controls input for remaining properties (like Noise)."}
    // @ui {"widget":"label", "label":"Additional settings need to be enabled on both materials to work properly."}
    // @ui {"widget":"label", "label":"NOTE: This does not affect \"Textures,\" \"Color / Alpha,\" or \"PBR\" properties."}
    // @input string advancedSource = "shipMaterialInput" {"label":"Advanced Input Source", "widget":"combobox", "values":[{"label":"Ship Material", "value":"shipMaterialInput"}, {"label":"Tail Material", "value":"tailMaterialInput"}]}
    // @ui {"widget":"label"}  
  
    // @ui {"widget":"group_start", "label":"Debug Tools"}
        // @input bool pauseParticles = false {"hint":"Stops all particle movement."}
        // @input float simulationSpeed = 1.0 {"hint":"Allows you to slow down or speed up the entire particle system."}
    // @ui {"widget":"group_end"}
// @ui {"widget":"group_end"}

// Validate Inputs
var inputIsValid = validateInputs();
if(!inputIsValid){
    return;
}

// Initialize Particles on startup
var time = getTime();
if (script.advanced && script.pauseParticles){ time = 0; }
setParticleData(getTime());



////////////////////////////////////////////////////////////////
// VALIDATE AND SET INPUTS
////////////////////////////////////////////////////////////////
function validateInputs(){
    if (!script.rocketShipMaterial) {
        print("ERROR: Please make sure the Rocketship Hull Particles material is attached.");
        return false;
    }
    if (!script.rocketTailMaterial) {
        print("ERROR: Please make sure the Rocketship Tail Particles material is attached.");
        return false;
    }
    if(script.shipColorInput == "scriptInput" && script.useWindowTexture == true && !script.windowTex) {
        // if the texture is not assigned, it will only send out a warning and simply not apply the texture
        print("WARNING: Please make sure the Window Texture is assigned when Use Window Texture is enabled.");
        return true;
    }
    
    return true;
}

function setParticleData(particleTime) {
    var shipMat = script.rocketShipMaterial.mainPass;
    var tailMat = script.rocketTailMaterial.mainPass;
    
    // Start Time
    shipMat.externalTimeInput = particleTime;
    tailMat.externalTimeInput = particleTime;
    
    // Spawn
    if (script.spawnSource == "shipMaterialInput") { copyParticleSpawnParameters(shipMat, tailMat); }
    else if (script.spawnSource == "tailMaterialInput") { copyParticleSpawnParameters(tailMat, shipMat); }
    else { setParticleSpawnParameters(shipMat, tailMat); }
    
    // Colors
    if(script.shipColorInput == "scriptInput"){ setHullParticleColors(shipMat); }
    if(script.tailColorInput == "scriptInput") { setTailParticleColors(tailMat); }
    
    // Movement
    if (script.movementSource == "shipMaterialInput") { copyParticleMovementParameters(shipMat, tailMat); }
    else if (script.movementSource == "tailMaterialInput") { copyParticleMovementParameters(tailMat, shipMat); }
    else { setParticleMovementParameters(shipMat, tailMat); }
    
    // Advanced
    if(script.advancedSource == "shipMaterialInput") { setParticleAdvancedParameters(shipMat, tailMat); }
    else { setParticleAdvancedParameters(tailMat, shipMat); }
}


////////////////////////////////////////////////////////////////
// UPDATE 
////////////////////////////////////////////////////////////////

function onUpdate(eventData) {
    var shipMat = script.rocketShipMaterial.mainPass;
    var tailMat = script.rocketTailMaterial.mainPass;
    
    if(script.advanced && script.pauseParticles) {
        shipMat.externalTimeInput = 0;
        shipMat.externalTimeInput = 0;
    } else {
        shipMat.externalTimeInput = getTime();
        tailMat.externalTimeInput = getTime();
    }
}
var updateEvent = script.createEvent("UpdateEvent");
updateEvent.bind(onUpdate);


////////////////////////////////////////////////////////////////
// SPAWN 
////////////////////////////////////////////////////////////////

function copyParticleSpawnParameters(sourcePass, destinationPass) {
    destinationPass.instanceCount = sourcePass.instanceCount;
    destinationPass.lifeTimeMinMax = sourcePass.lifeTimeMinMax;
    destinationPass.spawnSphere = sourcePass.spawnSphere;
    destinationPass.sizeStartMin3D = sourcePass.sizeStartMin3D;
    destinationPass.sizeStartMax3D = sourcePass.sizeStartMax3D;
    destinationPass.sizeEndMin3D = sourcePass.sizeEndMin3D;
    destinationPass.sizeEndMax3D = sourcePass.sizeEndMax3D;
}

function setParticleSpawnParameters(shipPass, tailPass){
    var minSize = new vec3(script.sizeMinMax.x, script.sizeMinMax.x, script.sizeMinMax.x);
    var maxSize = new vec3(script.sizeMinMax.y, script.sizeMinMax.y, script.sizeMinMax.y);    
    
    shipPass.instanceCount = script.numShips;
    shipPass.lifeTimeMinMax = script.lifeTimeMinMax;
    shipPass.spawnSphere = new vec3(script.spawnRadius, script.spawnRadius, script.spawnRadius);
    shipPass.sizeStartMin3D = minSize;
    shipPass.sizeStartMax3D = maxSize;
    shipPass.sizeEndMin3D = minSize;
    shipPass.sizeEndMax3D = maxSize;
    
    tailPass.instanceCount = script.numShips;
    tailPass.lifeTimeMinMax = script.lifeTimeMinMax;
    tailPass.spawnSphere = new vec3(script.spawnRadius, script.spawnRadius, script.spawnRadius);
    tailPass.sizeStartMin3D = minSize;
    tailPass.sizeStartMax3D = maxSize;
    tailPass.sizeEndMin3D = minSize;
    tailPass.sizeEndMax3D = maxSize;
}


////////////////////////////////////////////////////////////////
// COLOR 
////////////////////////////////////////////////////////////////

function setHullParticleColors(shipPass) {
    shipPass.shipColorHull      = script.shipColorHull;
    shipPass.shipColorMetal     = script.shipColorMetal;
    shipPass.shipColorBolts     = script.shipColorBolts;
    shipPass.shipColorDetails   = script.shipColorDetails;
    shipPass.shipColorWindow    = script.shipColorWindow;
    
    if(script.useWindowTexture){
        shipPass.useWindowTexture = true;
        shipPass.windowTex = script.windowTex;
    } else {
        shipPass.useWindowTexture = false;
    }
    
    // determine Nose and Fin Color
    if( script.shipColorRandom == true){
        // apply random color settings
        shipPass.colorMinStart = script.shipColorNoseFins;
        shipPass.colorMaxStart = script.shipColorNoseFins2;
        shipPass.colorMinEnd = script.shipColorNoseFins;
        shipPass.colorMaxEnd = script.shipColorNoseFins2;
    } else {
        // use same color for all input when not random
        shipPass.colorMinStart = script.shipColorNoseFins;
        shipPass.colorMaxStart = script.shipColorNoseFins;
        shipPass.colorMinEnd = script.shipColorNoseFins;
        shipPass.colorMaxEnd = script.shipColorNoseFins;
    }
    
    // In the event that Random Color is disabled, ensure that
    // the basic color data is always sent to the material.
    shipPass.colorStart = script.shipColorNoseFins;
    shipPass.colorEnd = script.shipColorNoseFins;
}

function setTailParticleColors(tailPass) {
    tailPass.tailColor1  = script.tailColor1;
    tailPass.tailColor2  = script.tailColor2;
    tailPass.tailColor3  = script.tailColor3;
    tailPass.tailColor4  = script.tailColor4;
    tailPass.tailColor5  = script.tailColor5;
    tailPass.emissionIntensity = script.emissionIntensity;
}


////////////////////////////////////////////////////////////////
// MOVEMENT
////////////////////////////////////////////////////////////////

// sets particle settings for velocity, rotation, gravity, and force from script to material passes
function setParticleMovementParameters(shipPass, tailPass) {
    shipPass.velocityMin    = script.velocityMin;
    shipPass.velocityMax    = script.velocityMax;
    shipPass.velocityDrag   = script.velocityDrag;      
    shipPass.gravity        = script.gravity;
    shipPass.localForce     = script.localForce;
    shipPass.rotationRateZ  = script.rotationRateZ;

    tailPass.velocityMin    = script.velocityMin;
    tailPass.velocityMax    = script.velocityMax;
    tailPass.velocityDrag   = script.velocityDrag;
    tailPass.gravity        = script.gravity;
    tailPass.localForce     = script.localForce;
    shipPass.rotationRateZ  = script.rotationRateZ;
}

// copies settings for velocity, rotation, gravity, and force from source material's main pass to destination's main pass
function copyParticleMovementParameters(sourcePass, destinationPass) {
    destinationPass.velocityMin     = sourcePass.velocityMin;
    destinationPass.velocityMax     = sourcePass.velocityMax;
    destinationPass.velocityDrag    = sourcePass.velocityDrag;
    destinationPass.gravity         = sourcePass.gravity;
    destinationPass.localForce      = sourcePass.localForce;
}


////////////////////////////////////////////////////////////////
// ADVANCED SETTINGS 
////////////////////////////////////////////////////////////////
function setParticleAdvancedParameters(sourcePass, destinationPass) {
    sourcePass.timeGlobal       = script.simulationSpeed;
    destinationPass.timeGlobal  = script.simulationSpeed;
    
    // Spawn
    destinationPass.externalSeed        = sourcePass.externalSeed;    
    destinationPass.lifeTimeConstant    = sourcePass.lifeTimeConstant;
    destinationPass.spawnDuration       = sourcePass.spawnDuration;
    destinationPass.spawnLocation       = sourcePass.spawnLocation;
    destinationPass.spawnBox            = sourcePass.spawnBox;
    
    // Noise
    destinationPass.noiseMult       = sourcePass.noiseMult;
    destinationPass.noiseFrequency  = sourcePass.noiseFrequency;
    destinationPass.sNoiseMult      = sourcePass.sNoiseMult;
    destinationPass.sNoiseFrequency = sourcePass.sNoiseFrequency;
    
    // Rotation
    // NOTE: Rocket Particles by default should always have "Center BBOX" disabled
    // For consitency and learning purposes, we will still copy them here.
    destinationPass.CENTER_BBOX     = sourcePass.CENTER_BBOX;
    destinationPass.rotationRateX   = sourcePass.rotationRateX;
    destinationPass.rotationRandomX = sourcePass.rotationRandomX;
    destinationPass.rotationRateY   = sourcePass.rotationRateY;
    destinationPass.rotationRandomY = sourcePass.rotationRandomY;
    // rotationRateZ already copied or set via script using Rotation Rate Min / Max
    destinationPass.rotationRandomZ = sourcePass.rotationRandomZ;
    destinationPass.rotationDrag    = sourcePass.rotationDrag; 
    
    // Alignment & Velocity
    destinationPass.sizeVelScale = sourcePass.sizeVelScale;
    // NOTE: set velocity ramp texture on material directly
    
    // Size
    destinationPass.sizeStart3D = sourcePass.sizeStart3D;
    destinationPass.sizeEnd3D   = sourcePass.sizeEnd3D;
    destinationPass.sizeSpeed   = sourcePass.sizeSpeed;
    // NOTE: set size ramp texture on material directly
}