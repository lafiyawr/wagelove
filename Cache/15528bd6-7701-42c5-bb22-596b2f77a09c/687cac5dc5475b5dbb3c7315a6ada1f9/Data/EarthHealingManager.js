const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

//@input SceneObject earthOBJ
//@input SceneObject AncestorsShrink
//@input Component.SpriteVisual AncestorHaloAnim

var isTouchingEarth = false;
var hasCompletedEarthHealing = false;

function onAwake() {
    script.createEvent('OnStartEvent').bind(() => {
        onStart();
    });
}

function onStart() {
    interactable = interactionManager.getInteractableBySceneObject(script.earthOBJ);

    if (!interactable) {
        print("Error: No interactable found on earthOBJ!");
        return;
    }

    var onTriggerStartCallback = (event) => {
        if (!hasCompletedEarthHealing) {
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

    if (!hasCompletedEarthHealing) {
        if (!isTouchingEarth) {
            global.behaviorSystem.sendCustomTrigger('startTrail');
            isTouchingEarth = true;
        }
        checkIfAllSelected();
    }
}

function checkIfAllSelected() {
    if (isTouchingEarth && !hasCompletedEarthHealing) {
        hasCompletedEarthHealing = true;
        sendPlayerHealedMessage();
    }
}

function sendPlayerHealedMessage() {
    if (global.onPlayerHealed) {
        global.onPlayerHealed();

        // Play the ancestor halo animation
        if (script.AncestorHalo2DAnim) {
            var anim = script.AncestorHalo2DAnim.mainMaterial.mainPass.baseTex.control;
            if (anim) {
                anim.loop = false;
                anim.reset();
                anim.play(1);
            } else {
                print("⚠️ No SpriteProvider found on AncestorHalo2DAnim");
            }
        }

        // Delay enabling AncestorsShrink by 2 seconds
        var delay = script.createEvent("DelayedCallbackEvent");
        delay.bind(function () {
            script.AncestorsShrink.enabled = true;
        });
        delay.reset(2.0);
    } else {
        print("*** ERROR: Could not find global.onPlayerHealed function ***");
    }
}

onAwake();
