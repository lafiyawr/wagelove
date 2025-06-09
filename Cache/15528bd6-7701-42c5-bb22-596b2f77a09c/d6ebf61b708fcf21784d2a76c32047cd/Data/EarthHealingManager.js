const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

//@input SceneObject earthOBJ

var isTouchingEarth = false;

function onAwake() {
    // Wait for other components to initialize by deferring to OnStartEvent.
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
        if (isTouchingEarth == false) {
            isTouchingEarth = true;
            checkIfAllSelected();
        }
    };

    // Set up the hand interaction
    interactable.onInteractorTriggerStart(onTriggerStartCallback);
    
    // IMPORTANT: Register the custom trigger response HERE, not inside onTrigger
    global.behaviorSystem.addCustomTriggerResponse('earthtouched', onTrigger);
}

function onTrigger() {
    print("Custom trigger 'earthtouched' received!");
    
    if (isTouchingEarth == false) {
        isTouchingEarth = true;
        checkIfAllSelected();
    }
    
    // You might want to remove the trigger response after it fires once
    // global.behaviorSystem.removeCustomTriggerResponse('earthtouched', onTrigger);
}

function checkIfAllSelected() {
    if (isTouchingEarth) {
        print("Player completed earth healing! Sending sync message...");
        sendPlayerHealedMessage();
    }
}

function sendPlayerHealedMessage() {
    // Call the global function directly
    if (global.onPlayerHealed) {
        global.onPlayerHealed();
    } else {
        print("Could not find game manager sync function");
    }
}

onAwake();