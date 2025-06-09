const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

//@input SceneObject earthOBJ

var isTouchingEarth = false;
var hasCompletedEarthHealing = false; // Add this flag

function onAwake() {
    script.createEvent('OnStartEvent').bind(() => {
        onStart();
    });
}

function onStart() {
    interactable = interactionManager.getInteractableBySceneObject(
        script.earthOBJ
    );

    if (!interactable) {
        print("Error: No interactable found on earthOBJ!");
        return;
    }

    var onTriggerStartCallback = (event) => {
        if (!hasCompletedEarthHealing) { // Only if they haven't completed yet
            if (!isTouchingEarth) {
                global.behaviorSystem.sendCustomTrigger('startTrail');
                isTouchingEarth = true;
            }
            checkIfAllSelected();
        }
    };

    interactable.onInteractorTriggerStart(onTriggerStartCallback);
    global.behaviorSystem.addCustomTriggerResponse('earthtouched', onTrigger);
}

function onTrigger() {
    print("Custom trigger 'earthtouched' received!");

    if (!hasCompletedEarthHealing) { // Only if they haven't completed yet
        if (!isTouchingEarth) {
            global.behaviorSystem.sendCustomTrigger('startTrail');
            isTouchingEarth = true;
        }
        checkIfAllSelected();
    }
}

function checkIfAllSelected() {
    if (isTouchingEarth && !hasCompletedEarthHealing) {
        print("Player completed earth healing! Sending sync message...");
        hasCompletedEarthHealing = true; // Mark as completed
        sendPlayerHealedMessage();
    }
}

function sendPlayerHealedMessage() {
    if (global.onPlayerHealed) {
        global.onPlayerHealed();
    } else {
        print("Could not find game manager sync function");
    }
}

onAwake();