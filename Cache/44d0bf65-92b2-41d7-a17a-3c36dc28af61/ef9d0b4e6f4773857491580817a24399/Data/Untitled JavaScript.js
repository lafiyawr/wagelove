// @input Asset.VoiceMLModule vmlModule {"hint":"VoiceML Module asset from Asset Browser"}
// @input Component.Text statusText {"hint":"Text component to show status"}
// @input Component.Text resultText {"hint":"Text component to show results"}
// @input string[] voiceCommands {"hint":"List of voice commands to recognize"}

var isListening = false;
var voiceMLComponent;

function initialize() {
    if (!script.vmlModule) {
        print("VoiceMLModule asset not found! Please add it from Asset Browser.");
        updateStatus("Error: VoiceML Module not assigned");
        return;
    }
    
    voiceMLComponent = script.vmlModule;
    
    // Set up voice commands without language detection
    setupVoiceCommands();
    
    // Update UI
    updateStatus("Ready - Tap to start listening");
}

function setupVoiceCommands() {
    try {
        // Set up event listeners for VoiceML
        voiceMLComponent.onListeningUpdate.add(onListeningUpdate);
        voiceMLComponent.onListeningStarted.add(onListeningStarted);
        voiceMLComponent.onListeningStopped.add(onListeningStopped);
        voiceMLComponent.onListeningError.add(onListeningError);
        
        print("Voice ML module initialized successfully");
        
    } catch (error) {
        print("Error setting up voice ML: " + error);
        updateStatus("Setup error: " + error);
    }
}

function startListening() {
    if (!isListening && voiceMLComponent) {
        try {
            // Create listening options
            var listeningOptions = VoiceML.ListeningOptions.create();
            
            // Skip language detection to avoid network API conflict
            // listeningOptions.language = "en-US"; // Don't set language to avoid getLanguage() call
            
            // Add keyword model for voice commands
            if (script.voiceCommands && script.voiceCommands.length > 0) {
                var keywordModel = VoiceML.KeywordModel.create();
                
                // Add keywords without using getLanguage()
                for (var i = 0; i < script.voiceCommands.length; i++) {
                    keywordModel.addKeyword(script.voiceCommands[i]);
                }
                
                listeningOptions.addModel(keywordModel);
            }
            
            // Start listening with options
            voiceMLComponent.startListening(listeningOptions);
            print("Starting voice recognition...");
            
        } catch (error) {
            print("Error starting voice recognition: " + error);
            updateStatus("Error starting listening: " + error);
        }
    }
}

function stopListening() {
    if (isListening && voiceMLComponent) {
        try {
            voiceMLComponent.stopListening();
            print("Stopping voice recognition...");
        } catch (error) {
            print("Error stopping voice recognition: " + error);
        }
    }
}

// Event handlers
function onListeningUpdate(eventArgs) {
    try {
        // Get keyword responses
        var keywordResponses = eventArgs.getKeywordResponses();
        
        for (var i = 0; i < keywordResponses.length; i++) {
            var keywordResponse = keywordResponses[i];
            
            // Check if response is successful
            if (keywordResponse.status.code === VoiceMLModule.NlpResponsesStatusCodes.OK) {
                // Process detected keywords
                for (var j = 0; j < keywordResponse.keywords.length; j++) {
                    var keyword = keywordResponse.keywords[j];
                    print("Keyword detected: " + keyword);
                    updateResult("Command: " + keyword);
                    handleVoiceCommand(keyword);
                }
            }
        }
        
        // Get transcription responses if available
        var transcriptionResponses = eventArgs.getTranscriptionResponses();
        if (transcriptionResponses && transcriptionResponses.length > 0) {
            for (var k = 0; k < transcriptionResponses.length; k++) {
                var transcription = transcriptionResponses[k];
                if (transcription.status.code === VoiceMLModule.NlpResponsesStatusCodes.OK) {
                    print("Transcription: " + transcription.transcription);
                    updateResult("Said: " + transcription.transcription);
                    checkTranscriptionForCommands(transcription.transcription);
                }
            }
        }
        
    } catch (error) {
        print("Error processing listening update: " + error);
    }
}

function onListeningStarted() {
    isListening = true;
    updateStatus("Listening... Speak now");
    print("Voice recognition started");
}

function onListeningStopped() {
    isListening = false;
    updateStatus("Processing...");
    print("Voice recognition stopped");
    
    // Auto-restart after a delay
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        updateStatus("Ready - Tap to start listening");
    });
    delayedEvent.reset(1.0);
}

function onListeningError(error) {
    print("Voice recognition error: " + error);
    updateStatus("Error: " + error);
    isListening = false;
}

// Check transcription text for commands (fallback method)
function checkTranscriptionForCommands(transcription) {
    var lowerTranscription = transcription.toLowerCase();
    var commandsArray = script.voiceCommands || ["hello", "stop", "start", "yes", "no"];
    
    for (var i = 0; i < commandsArray.length; i++) {
        if (lowerTranscription.includes(commandsArray[i].toLowerCase())) {
            handleVoiceCommand(commandsArray[i]);
            break;
        }
    }
}

// Handle recognized commands
function handleVoiceCommand(command) {
    var lowerCommand = command.toLowerCase();
    
    switch(lowerCommand) {
        case "hello":
            updateResult("Hello! How can I help?");
            break;
        case "start":
            updateResult("Starting...");
            // Add your start logic here
            break;
        case "stop":
            updateResult("Stopping...");
            stopListening();
            break;
        case "yes":
            updateResult("Confirmed!");
            break;
        case "no":
            updateResult("Cancelled.");
            break;
        default:
            updateResult("Command recognized: " + command);
    }
}

// UI update functions
function updateStatus(message) {
    if (script.statusText) {
        script.statusText.text = message;
    }
    print("Status: " + message);
}

function updateResult(message) {
    if (script.resultText) {
        script.resultText.text = message;
    }
    print("Result: " + message);
}

// Touch event to manually start/stop listening
function createTouchEvent() {
    var touchEvent = script.createEvent("TapEvent");
    touchEvent.bind(function() {
        if (isListening) {
            stopListening();
        } else {
            startListening();
        }
    });
}

// Initialize everything
initialize();

// Create touch controls
createTouchEvent();

// Public functions you can call from other scripts
script.startListening = startListening;
script.stopListening = stopListening;
script.isListening = function() { return isListening; };