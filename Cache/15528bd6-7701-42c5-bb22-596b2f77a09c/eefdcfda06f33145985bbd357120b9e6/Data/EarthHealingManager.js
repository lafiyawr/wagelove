const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

//@input SceneObject earthOBJ

var isTouchingEarth = false;
var interactable; // Declare the interactable variable

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

    var onTriggerStartCallback = (event) => {
        if (isTouchingEarth == false) {
            isTouchingEarth = true;
            checkIfAllSelected();
            // Remove our onTrigger() function from the custom trigger's responses
            global.behaviorSystem.removeCustomTriggerResponse('earthtouched', onTrigger);
        }
        // Add our onTrigger() function as a response to the custom trigger "my_trigger"
        global.behaviorSystem.addCustomTriggerResponse('earthtouched', onTrigger);
    }; // This closing bracket was missing!

    // You probably want to use this callback somewhere, like:
    // interactable.onTriggerStart.add(onTriggerStartCallback);
}

function onTrigger() {
    if (isTouchingEarth == false) {
        isTouchingEarth = true;
        checkIfAllSelected();
        // Remove our onTrigger() function from the custom trigger's responses
        global.behaviorSystem.removeCustomTriggerResponse('earthtouched', onTrigger);
    }
    // Add our onTrigger() function as a response to the custom trigger "my_trigger"
    global.behaviorSystem.addCustomTriggerResponse('earthtouched', onTrigger);
}

function checkIfAllSelected() {
    if (isTouchingEarth) {
        print("Player completed all selections! Sending sync message...");
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