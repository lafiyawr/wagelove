// GlobalHandTracking.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Creates global functions of tracking and position data for both hands

//@input Component.ObjectTracking3D leftHand
//@input Component.ObjectTracking3D rightHand

var isLeftTracking = false;
var isRightTracking = false;

var leftJoints = {};
var rightJoints = {};
const JOINT_NAMES = ["wrist","thumb-0","thumb-1","thumb-2","thumb-3","index-0","index-1","index-2","index-3","mid-0","mid-1","mid-2","mid-3","ring-0","ring-1","ring-2","ring-3","pinky-0","pinky-1","pinky-2","pinky-3","wrist_to_thumb","wrist_to_index","wrist_to_mid","wrist_to_ring","wrist_to_pinky"];

function onInitialize() {
    for (var i=0; i<JOINT_NAMES.length; i++) {
        leftJoints[JOINT_NAMES[i]] = script.leftHand.createAttachmentPoint(JOINT_NAMES[i]);
        rightJoints[JOINT_NAMES[i]] = script.rightHand.createAttachmentPoint(JOINT_NAMES[i]);
    }
}
onInitialize();

script.leftHand.onTrackingStarted = function() {
    isLeftTracking = true;
};

script.leftHand.onTrackingLost = function() {
    isLeftTracking = false;
};

script.rightHand.onTrackingStarted = function() {
    isRightTracking = true;
};

script.rightHand.onTrackingLost = function() {
    isRightTracking = false;
};

function getJointsPosition(handType, jointNames) {

    if (getActiveHand == null) {
        return;
    }
    
    if (!Array.isArray(jointNames)) {
        if ((handType != "R") && getActiveHand() == "L") {
            return leftJoints[jointNames].getTransform().getWorldPosition();
        } else if (handType != "L" && getActiveHand() == "R") {
            return rightJoints[jointNames].getTransform().getWorldPosition();
        }
    } else {
        var vec3arr = [];
        for (var i=0; i < jointNames.length; i ++) {
            if ((handType != "R") && getActiveHand() == "L") {
                vec3arr.push(leftJoints[jointNames[i]].getTransform().getWorldPosition());
            } else if (handType != "L" && getActiveHand() == "R") {
                vec3arr.push(rightJoints[jointNames[i]].getTransform().getWorldPosition());
            }
        }
    
        return getAverageVec3(vec3arr);
    }

}

function getAverageVec3(vecs) {
    var result = new vec3(0,0,0);
    for (var i=0; i < vecs.length; i ++) {
        result = result.add(vecs[i]);
    }
    result = result.uniformScale(1 / vecs.length);
    return result;
}

function getActiveHand() {
    if (isLeftTracking) {
        return "L";
    } else if (isRightTracking) {
        return "R";
    } else {
        return null;
    }
}


//GLOBAL HAND FUNCTIONS
global.isLeftHandTracking = function() {
    return isLeftTracking;
};

global.isRightHandTracking = function() {
    return isRightTracking;
};

global.getActiveHand = getActiveHand;
global.getJointsPosition = getJointsPosition;