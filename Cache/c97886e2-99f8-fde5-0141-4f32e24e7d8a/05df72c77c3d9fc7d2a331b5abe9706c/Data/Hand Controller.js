// SetFollowHandHelper.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Set object to follow hand, and calculate finger curl

//@input int handType = 0 {"widget":"combobox","values":[{"value":"0","label":"Any"},{"value":"1","label":"Left"},{"value":"2","label":"Right"}]}
//@input int followType = 0 {"widget":"combobox","values":[{"value":"0","label":"Position"},{"value":"1","label":"Rotation"},{"value":"2","label":"Position & Rotation"}]}
//@ui{"widget":"separator"}
//@input SceneObject followObject
//@input string[] positionJointNames {"label":"Position Joints Median"}


var followObject;

var startAction = false;
var startFollowTriggered = false;

var setPosition = (script.followType == 0 || script.followType == 2);
var setRotation = (script.followType == 1 || script.followType == 2);

var targetPos, objPos;
var targetRot, objRot;

var getJointsAveragePosition, getJointsAverageRotation;
var handController;
var proxyObject, followObjectParent;

var originPos, originRot;
var curl;

const startFollowDelay = 0.3;
var startFollowDelayTimer = 0;

var averageJointPos;

function initialize() {
    
    followObject = script.followObject;
    if (!followObject) {
        followObject = script.getSceneObject();
    }

    followObjectParent = followObject.getParent();

    originPos = followObject.getTransform().getWorldPosition();
    originRot = followObject.getTransform().getWorldRotation();

    //create a proxy object as container of the follow object, mostly to better calculcate quaternion rotation
    proxyObject = global.scene.createSceneObject("ProxyObject");

    switch (script.handType) {
        case 1:
            handController = global.leftHand();
            break;
        case 2:
            handController = global.rightHand();
            break;
    }
    
    if (handController) {
        getJointsAveragePosition = handController.api.getJointsAveragePosition;
        getJointsAverageRotation = handController.api.getJointsAverageWorldRotation;
        getJoint = handController.api.getJoint;
    }

    script.createEvent("UpdateEvent").bind(onUpdate);
}

initialize();

function onUpdate() {
    
    if (script.handType == 0 && !handController) {
        handController = global.getActiveHandController();
        getJointsAveragePosition = global.getJointsAveragePosition;
        getJointsAverageRotation = global.getJointsAverageWorldRotation;
        getJoint = global.getJoint;
    }

    if (!handController) {
        
        //HAND IS NOT TRACKING
        if (startAction) {
            endFollow();
            print("lost tracking");
        }
        startFollowDelayTimer = 0;

    } else {
        //HAND IS TRACKING
        
        //get average finger tips pos;
        targetPos = getJointsAveragePosition(script.positionJointNames);
        script.api.targetPos = targetPos;
        //targetPos.y = targetPos.y - offsetY;
        averageJointPos = getJointsAveragePosition(script.positionJointNames);
            
        //get wrist position
        var wrist = getJoint("wrist");     
        if (wrist != null) {
            var wristPos = wrist.position;
                        
            //get distance from wrist to average finger tip pos
            curl = wristPos.distance(averageJointPos);
            script.api.curl = curl;
            
            //print(targetPos);
        }
                
        if (!startAction) {
            if (startFollowDelayTimer < startFollowDelay) {
                startFollowDelayTimer += getDeltaTime();
            } else {
                startFollow();
                startFollowDelayTimer = 0;         
           }
        }
    }
    
    updateObject(startAction);
}


function startFollow() {
    
    if (setPosition && script.positionJointNames.length == 0) {
        print("ERROR! No Joint Names Input for Position Joints Median on " + script.getSceneObject().name);
        return;
    }
    
    objPos = followObject.getTransform().getWorldPosition();
    objRot = followObject.getTransform().getWorldRotation();

    proxyObject.getTransform().setWorldPosition(followObject.getTransform().getWorldPosition());
    
    //set followObject's parent so its rotation will be applied from proxy object
    followObject.setParent(proxyObject);

    //set follow object local pos to 0 (aka to its current pos)
    //and its rotation to its current rot
    followObject.getTransform().setLocalPosition(new vec3(0,0,0));
    followObject.getTransform().setWorldRotation(objRot);

    startAction = true;
}


function endFollow() {
    
    if (!startAction) {
        return;
    }
    
    //get current pos and rot from followObject
    var currentPos = followObject.getTransform().getWorldPosition();
    var currentRot = followObject.getTransform().getWorldRotation();

    //apply that to proxyObject
    proxyObject.getTransform().setWorldPosition(currentPos);
    proxyObject.getTransform().setWorldRotation(currentRot);

    //set local pos and rot of followObject to 0
    followObject.getTransform().setLocalPosition(new vec3(0,0,0));
    followObject.getTransform().setLocalRotation(new quat(0,0,0,0));
 
    startAction = false;
}


//Apply force to object in this function
function updateObject(isFollowing) {
    
    if (isFollowing) {
        //Object starts to lerp to target position and rotation from the hand
        if (setPosition) {        
        }                
    } 

    if (objPos && targetPos) {
        objPos = vec3.lerp(objPos, targetPos, 0.8);
        proxyObject.getTransform().setWorldPosition(objPos);
    }
    
    if (objRot && targetRot) {
        objRot = quat.slerp(objRot, targetRot, 0.8);
        proxyObject.getTransform().setWorldRotation(objRot);
    }
}