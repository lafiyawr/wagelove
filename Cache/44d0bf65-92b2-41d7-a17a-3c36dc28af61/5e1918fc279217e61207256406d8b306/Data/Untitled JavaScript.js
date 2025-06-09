//@input Component.VoiceML voiceMLComponent

var isListening = false;

function onAwake() {
    print("Setting up minimal speech recognition for 'rise'");
    
    try {
        // Set up transcription listener without language detection
        script.voiceMLComponent.onTranscriptionUpdated.add(onTranscriptionUpdated);
        script.voiceMLComponent.onListeningEnabledChanged.add(onListeningChanged);
        
        // Start listening immediately
        startListening();
        
    } catch (e) {
        print("Failed to setup speech recognition: " + e);
    }
}

function onListeningChanged(enabled) {
    isListening = enabled;
    print("Speech listening: " + (enabled ? "ON" : "OFF"));
}

function onTranscriptionUpdated(transcription, isFinal) {
    if (!transcription || transcription.trim() === "") {
        return;
    }
    
    print("Heard: '" + transcription + "'" + (isFinal ? " (final)" : " (partial)"));
    
    // Check for "rise" in both partial and final transcriptions
    var text = transcription.toLowerCase().trim();
    
    if (text.includes("rise")) {
        print("RISE detected! Triggering game start...");
        onRiseDetected(transcription);
    }
}

function onRiseDetected(originalText) {
    print("Voice command 'RISE' activated from: " + originalText);
    
    // Trigger your multiplayer game start
    if (global.sendGameStart) {
        global.sendGameStart();
    } else {
        print("Game start function not available yet");
    }
    
    // Optional: Stop listening after detection to prevent multiple triggers
    stopListening();
    
    // Optional: Restart listening after a delay
    var restartEvent = script.createEvent("DelayedCallbackEvent");
    restartEvent.bind(function() {
        startListening();
    });
    restartEvent.reset(3.0); // Wait 3 seconds before listening again
}

function startListening() {
    try {
        script.voiceMLComponent.startListening();
        print("Started listening for 'rise'");
    } catch (e) {
        print("Failed to start listening: " + e);
    }
}

function stopListening() {
    try {
        script.voiceMLComponent.stopListening();
        print("Stopped listening");
    } catch (e) {
        print("Failed to stop listening: " + e);
    }
}

// Make functions available globally if needed
global.startVoiceListening = startListening;
global.stopVoiceListening = stopListening;

onAwake();