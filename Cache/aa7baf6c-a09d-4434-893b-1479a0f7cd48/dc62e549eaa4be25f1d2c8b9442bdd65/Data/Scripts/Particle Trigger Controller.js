// ParticleTriggerController.js
// Version: 0.0.3
// Event: Lens Initialized
// Description: Allows you to start and stop a particle based on Behavior, or from a script call
//
// Make sure to enable External Time Input on your Particles
// ---- USAGE ----
// Trigger particles
//  script.startParticles();
//
// End particles
//  script.endParticles();

// @input Component.MaterialMeshVisual particleVisual
// @input int spawnMaxParticles = 100
// @ui {"widget":"separator"}
// @ui {"label":"Behavior Script Triggers"}
// @input Component.ScriptComponent startBehavior
// @input Component.ScriptComponent endBehavior

// the particle to trigger
var mat;
// material mesh visual, used to enabled and disable the particle system
var meshVis;

// Use particle material input if available, otherwise look on current object
if (script.particleVisual) {
    mat = script.particleVisual.mainPass;
    // meshVis = script.particleVisual;
    meshVis = script.particleVisual.getSceneObject().getComponent("Component.RenderMeshVisual");
    meshVis.enabled = false;
} else {
    var materialMeshVisual = script.getSceneObject()
        .getComponent("Component.MaterialMeshVisual");
    
    if (materialMeshVisual) {
        mat = materialMeshVisual.mainPass;
        meshVis = materialMeshVisual;
        meshVis.enabled = false;
    }
}

// Allow users to start and end particles by script:
script.startParticles = startParticles;
script.endParticles = endParticles;

// Allow users to start and end particles by Behavior:
if (script.startBehavior && script.startBehavior.addTriggerResponse) {
    script.startBehavior.addTriggerResponse(startParticles);
}

if (script.endBehavior && script.endBehavior.addTriggerResponse) {
    script.endBehavior.addTriggerResponse(endParticles);
}

var event = script.createEvent("UpdateEvent");
event.enabled = false;
event.bind(function(eventData) {
    mat.externalTimeInput += getDeltaTime();
});

function startParticles() {
    meshVis.enabled = true;
    mat.externalTimeInput = 0;
    mat.instanceCount = script.spawnMaxParticles;
    event.enabled = true;
}

function endParticles() {
    meshVis.enabled = false;
    mat.externalTimeInput = 0;
    mat.instanceCount = 1;
    event.enabled = false;	
}