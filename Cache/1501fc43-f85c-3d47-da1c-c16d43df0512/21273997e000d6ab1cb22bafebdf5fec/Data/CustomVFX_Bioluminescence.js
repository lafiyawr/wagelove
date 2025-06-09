// CustomVFX_Bioluminescence.js
// Version: 0.0.2
// Event: On Awake
// Description: Assigns hand tracking data to custom swarm vfx, use hand acceleration to affect vfx color

//@ui{"label":"HINT: Move hand around vfx in camera"}
//@ui{"widget":"separator"}

//@input Component.VFXComponent vfxComponent
//@input string[] medianJoints


var vfxAsset;
var handPos;
var handPosPrev = new vec3(0.0,0.0,0.0);
var accelerationBoost = 1;
var handAccel;
const JOINTS_NAME = script.medianJoints;

function onInitialize() {
    if (!script.vfxComponent) {
        print("ERROR: Make sure VFX Component is set");
        return;
    }
    
    handPos = new vec3(0.0,0.0,0.0);
    vfxAsset = script.vfxComponent.asset;
    script.vfxComponent.asset.properties.isIdle = true;
    script.createEvent("UpdateEvent").bind(onUpdate);
}
onInitialize();

function onUpdate() {
    
    vfxAsset.properties.isIdle = (global.getActiveHand() == null) ? true : false;
    
    if (global.getActiveHand()) {
        handPos = global.getJointsPosition("",JOINTS_NAME);
        script.vfxComponent.getSceneObject().getTransform().setWorldPosition(handPos);
        vfxAsset.properties.inputPos = handPos;
        
        handAccel = handPos.sub(handPosPrev);
        handAccel.add(new vec3(accelerationBoost,accelerationBoost,accelerationBoost));
        vfxAsset.properties.velocity = handAccel;
        
        handPosPrev = handPos;
    }
}