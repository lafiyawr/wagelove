const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

//@input SceneObject earthOBJ
//@input SceneObject AncestorsShrink
//@input Component.Image AncestorHaloAnim

const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;

var isTouchingEarth = false;
var hasCompletedEarthHealing = false;

var provider = null;

function playHaloAnimation() {
    if (!script.AncestorHaloAnim) {
        print("❌ Error: No image component assigned for AncestorHaloAnim.");
        return;
    }

    provider = script.AncestorHaloAnim.mainPass.baseTex.control;

    if (!provider || typeof provider.setCurrentFrame !== "function") {
        print("❌ Error: Invalid or missing provider.");
        return;
    }

    provider.loop = false;
    provider.play(1, 0); // Play one loop from the beginning

    var checkFrame = script.createEvent("UpdateEvent");
    checkFrame.bind(function () {
        if (provider.getCurrentFrame && provider.getCurrentFrame() >= 36) {
            provider.pause();
            provider.setCurrentFrame(36);
            checkFrame.enabled = false;
            print("✅ Ancestor halo animation stopped at frame 36.");
        }
    });
}

function onAwake() {
    script.createEvent('OnStartEvent').bind(() => {
        onStart();
    });
}

function onStart() {
    var interactable = interactionManager.getInteractableBySceneObject(script.earthOBJ);

    if (!interactable) {
        print("❌ Error: No interactable found on earthOBJ!");
        return;
    }

    interactable.onInteractorTriggerStart(function (event) {
        if (!hasCompletedEarthHealing && !isTouchingEarth) {
            global.behaviorSystem.sendCustomTrigger('startTrail');
            isTouchingEarth = true;
            checkIfAllSelected();
        }
    });

    global.behaviorSystem.addCustomTriggerResponse('earthtouched', onTrigger);
}

function onTrigger() {
    print("🔥 Custom trigger 'earthtouched' received!");

    if (!hasCompletedEarthHealing && !isTouchingEarth) {
        global.behaviorSystem.sendCustomTrigger('startTrail');
        isTouchingEarth = true;
        checkIfAllSelected();
    }
}

function checkIfAllSelected() {
    if (isTouchingEarth && !hasCompletedEarthHealing) {
        hasCompletedEarthHealing = true;
        print("🌍 Earth healing complete! Sending sync...");
        sendPlayerHealedMessage();
    }
}

function sendPlayerHealedMessage() {
    if (global.onPlayerHealed) {
        global.onPlayerHealed();

        // Play the halo animation
        playHaloAnimation();

        // Delay enabling AncestorsShrink by 2 seconds
        var delayedEnable = script.createEvent("DelayedCallbackEvent");
        delayedEnable.bind(function () {
            script.AncestorsShrink.enabled = true;
            print("🌟 AncestorsShrink enabled after halo animation.");
        });
        delayedEnable.reset(2.0);
    } else {
        print("⚠️ ERROR: global.onPlayerHealed not found");
    }
}

onAwake();
