// CustomVFX_Swarm.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Assigns hand tracking data to custom swarm vfx

//@ui{"label":"HINT: Switch left and right hand in camera"}
//@ui{"widget":"separator"}

// @input Component.VFXComponent vfx {"label": "VFX Component"}
// @input Asset.Material posteffectColor
// @input Asset.Material underwaterRay
// @input Asset.Material distortion

var fadetimeA = 1.0;
var fadetimeB = 1.0;

function onInitialize() {
    if (!script.vfx) {
        print("ERROR: Make sure VFX is set.");
        return;
    }
    if (!script.posteffectColor) {
        print("ERROR: Make sure Posteffect Color material is set");
        return;
    }
    if (!script.underwaterRay) {
        print("ERROR: Make sure Color Correction material is set");
        return false;
    }
    script.createEvent("UpdateEvent").bind(onUpdate);
}
onInitialize();

function onUpdate() {
    if (global.getActiveHand() == null) {
        script.distortion.mainPass.activate = 1.0;

        fadetimeA = clamp (fadetimeA + getDeltaTime(),0.0,1.0);
        script.posteffectColor.mainPass.fadetimeA = fadetimeA;
        fadetimeB = clamp (fadetimeB - getDeltaTime(),0.0,1.0);
        script.posteffectColor.mainPass.fadetimeB = fadetimeB;
        script.underwaterRay.mainPass.intensity = fadetimeA;

    } else {
        if (global.isLeftHandTracking()) {
            script.vfx.asset.properties.isAttracting = true;
            script.posteffectColor.mainPass.isAttracting = 0.0;

            fadetimeA = clamp (fadetimeA + getDeltaTime(),0.0,1.0);
            script.posteffectColor.mainPass.fadetimeA = fadetimeA;
            fadetimeB = clamp (fadetimeB - getDeltaTime(),0.0,1.0);
            script.posteffectColor.mainPass.fadetimeB = fadetimeB; 
            
            script.underwaterRay.mainPass.intensity = fadetimeA;
            script.distortion.mainPass.activate = 1.0;
        }
        if (global.isRightHandTracking()) {
            script.vfx.asset.properties.isAttracting = false;
            script.posteffectColor.mainPass.isAttracting = 1.0;

            fadetimeB = clamp (fadetimeB + getDeltaTime(),0.0,1.0);
            script.posteffectColor.mainPass.fadetimeB = fadetimeB;
            fadetimeA = clamp (fadetimeA - getDeltaTime(),0.0,1.0);
            script.posteffectColor.mainPass.fadetimeA = fadetimeA; 
            
            script.underwaterRay.mainPass.intensity = fadetimeA;  
            script.distortion.mainPass.activate = 0.0;
        }
    }
}

function clamp(val, min, max) {
    return Math.max(min, Math.min(max, val));
}