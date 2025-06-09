// Import VoiceML from the assets
const VoiceML = require('VoiceML');

var voiceMLComponent;
var isListening = false;

function onAwake() {
    print("Setting up VoiceML speech recognition for 'rise'");
    
    try {
        // Create VoiceML instance
        voiceMLComponent = VoiceML.createSpeechRecognizer();
        
        // Set up listeners
        voiceMLComponent.onTranscriptionUpdated.add(onTranscriptionUpdated);
        voiceMLComponent.onListeningEnabledChanged.add(onListeningChanged);
        
        // Start listening
        startListening();
        
    } catch (e) {
        print("Failed to setup VoiceML: " + e);
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
    
    // Check for "rise"
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
    }
    
    // Brief pause before listening again
    stopListening();
    var restartEvent = script.createEvent("DelayedCallbackEvent");
    restartEvent.bind(startListening);
    restartEvent.reset(2.0);
}

function startListening() {
    try {
        voiceMLComponent.startListening();
        print("Started listening for 'rise'");
    } catch (e) {
        print("Failed to start listening: " + e);
    }
}

function stopListening() {
    try {
        voiceMLComponent.stopListening();
    } catch (e) {
        print("Failed to stop listening: " + e);
    }
}

onAwake();