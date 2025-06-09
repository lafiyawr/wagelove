// Fix the typo in playAncestorIntro
function playAncestorIntro() {
    print("Playing ancestor intro");
    
    playVO(1);
    script.gameObjects[0].enabled = true;
    script.breathingAni.enabled = false;
    
    // Show fireflies after intro timer (FIXED TYPO)
    var delayedFireflies = script.createEvent("DelayedCallbackEvent");
    delayedFireflies.bind(function() {
        print("Fireflies should appear now");
        script.gameObjects[2].enabled = true;
    });
    delayedFireflies.reset(10);
    
    // Enable voice manager
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        script.voiceManager.enabled = true;
        print("Voice manager enabled - ready for 'rise' command");
    });
    delayedEvent.reset(17);
}

// Fix sendAncestorsRise to work in both single and multiplayer
function sendAncestorsRise() {
    print("*** sendAncestorsRise called ***");
    
    // Check if this is single player mode
    var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
    
    if ((syncEntity && syncEntity.doIOwnStore()) || isSinglePlayerMode) {
        print("*** Sending ancestors rise event ***");
        
        if (isSinglePlayerMode) {
            print("*** SINGLE PLAYER: Calling ancestors rise directly ***");
            // In single player, just call the function directly
            onReceiveAncestorsRise();
        } else {
            print("*** MULTIPLAYER: Sending ancestors rise network event ***");
            // In multiplayer, send the network event
            syncEntity.sendEvent('ancestorsRisemsg');
        }
        
        print("*** Ancestors rise event sent successfully ***");
    } else {
        print("*** ERROR: Cannot send ancestors rise - not host or syncEntity missing ***");
        print("*** syncEntity exists: " + !!syncEntity + " ***");
        print("*** isHost: " + (syncEntity && syncEntity.doIOwnStore()) + " ***");
        print("*** isSinglePlayer: " + isSinglePlayerMode + " ***");
    }
}