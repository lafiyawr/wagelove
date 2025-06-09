// @input Component.VoiceMLModule voiceML
// @input Component.Text statusText {"hint":"Text component to show status"}
// @input Component.Text resultText {"hint":"Text component to show results"}
// @input string[] voiceCommands {"hint":"List of voice commands to recognize"}

var isListening = false;
var voiceMLComponent;

function initialize() {
    if (!script.voiceML) {
        print("VoiceMLModule not found! Please add it to the scene.");
        return;
    }
    
    voiceMLComponent = script.voiceML;
    
    // Set up voice commands without language detection
    setupVoiceCommands();
    
    // Update UI
    updateStatus("Ready - Say a command");
}

function setupVoiceCommands() {
    // Use default language (English) instead of getLanguage()
    var defaultLanguage = "en-US";
    
    // Set up the voice commands
    var commandsArray = script.voiceCommands || ["hello", "stop", "start", "yes", "no"];
    
    // Configure voice recognition options
    var voiceOptions = {
        language: defaultLanguage,
        commands: commandsArray,
        continuous: false,  // Set to true for continuous listening
        interimResults: false
    };
    
    try {
        // Initialize voice recognition
        voiceMLComponent.setVoiceCommands(commandsArray);
        
        // Set up event listeners
        voiceMLComponent.onVoiceCommand.add(onVoiceCommand);
        voiceMLComponent.onListeningStarted.add(onListeningStarted);
        voiceMLComponent.onListeningStopped.add(onListeningStopped);
        voiceMLComponent.onError.add(onVoiceError);
        
        print("Voice recognition initialized successfully");
        
    } catch (error) {
        print("Error setting up voice commands: " + error);
        updateStatus("Error: " + error);
    }
}

function startListening() {
    if (!isListening && voiceMLComponent) {
        try {
            voiceMLComponent.startListening();
            updateStatus("Listening...");
        } catch (error) {
            print("Error starting voice recognition: " + error);
            updateStatus("Error starting listening");
        }
    }
}

function stopListening() {
    if (isListening && voiceMLComponent) {
        try {
            voiceMLComponent.stopListening();
            updateStatus("Stopped listening");
        } catch (error) {
            print("Error stopping voice recognition: " + error);
        }
    }
}

// Event handlers
function onVoiceCommand(command) {
    print("Voice command detected: " + command);
    updateResult("Command: " + command);
    
    // Handle specific commands
    handleVoiceCommand(command);
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
}

function onVoiceError(error) {
    print("Voice recognition error: " + error);
    updateStatus("Error: " + error);
    isListening = false;
}

// Handle recognized commands
function handleVoiceCommand(command) {
    var lowerCommand = command.toLowerCase();
    
    switch(lowerCommand) {
        case "rise":
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
            updateResult("Unknown command: " + command);
    }
    
    // Auto-restart listening after a delay (optional)
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        if (!isListening) {
            startListening();
        }
    });
    delayedEvent.reset(2.0); // Wait 2 seconds before restarting
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

// Touch event to manually start/stop listening (optional)
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

// Auto-start listening when lens starts (optional)
function autoStart() {
    var startEvent = script.createEvent("DelayedCallbackEvent");
    startEvent.bind(function() {
        startListening();
    });
    startEvent.reset(1.0); // Wait 1 second after lens starts
}

// Initialize everything
initialize();

// Optional: Create touch controls
createTouchEvent();

// Optional: Auto-start listening
// autoStart();

// Public functions you can call from other scripts
script.startListening = startListening;
script.stopListening = stopListening;
script.isListening = function() { return isListening; };