// HandPositionToVFX.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Assigns hand position to vfx parameters

//@input int handType = 0 {"widget":"combobox","values":[{"value":"0","label":"Any"},{"value":"1","label":"Left"},{"value":"2","label":"Right"}]}
//@input string[] handJoints
//@input Asset.VFXAsset vfxAsset
//@input string propertyName
//@input bool pauseOnHandLost {"label":"Pause Response"}
//@input string pauseName {"showIf":"pauseOnHandLost","label":"Pause Name"}

var handString;

function onInitialize() {
    onPauseSpawn(true);
    script.createEvent("UpdateEvent").bind(onUpdate);
}
onInitialize();

function onUpdate() {

    if (script.handType == 2 && !global.isRightHandTracking()) {
        onPauseSpawn(true);
        return;
    }
    if (script.handType == 1 && !global.isLeftHandTracking()) {
        onPauseSpawn(true);
        return;
    }
    if (script.handType == 0 && !global.getActiveHand()) {
        onPauseSpawn(true);
        return;
    }
    onPauseSpawn(false);
    
    if (script.handType == 0) {
        handString = global.getActiveHand();
    } else if (script.handType == 1) {
        handString = "L";
    } else {
        handString = "R";
    }
    
    
    script.vfxAsset.properties[script.propertyName] = global.getJointsPosition(handString,script.handJoints);
}

function onPauseSpawn(onPause) {
    if (!script.pauseOnHandLost) {
        return;
    }
    script.vfxAsset.properties[script.pauseName] = onPause;
}