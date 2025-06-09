// Require the ASR Module
const asrModule = require("LensStudio:AsrModule");

// @input Component.Text statusText {"hint":"Text component to show status"}
// @input Component.Text resultText {"hint":"Text component to show results"}

var isListening = false;
var options;
var isRiseTriggered = false;

function initialize() {
    // Create ASR transcription options
    options = AsrModule.AsrTranscriptionOptions.create();
    
    // Configure options
    options.silenceUntilTerminationMs = 2000; // Stop after 2 seconds of silence
    options.mode = AsrModule.AsrMode.HighAccuracy; // Use high accuracy mode
    
    // Set up event handlers
    options.onTranscriptionUpdateEvent.add(onTranscriptionUpdate);
    options.onTranscriptionErrorEvent.add(onTranscriptionError);
    
    updateStatus("Ready ");
    print("ASR module initialized successfully");
    
    // Auto-start listening when initialized
    print("*** AUTO-STARTING VOICE LISTENING ***");
    startListening();
    
}

function onTranscriptionUpdate(eventArgs) {
    var text = eventArgs.text;
    var isFinal = eventArgs.isFinal;
    
    print("*** TRANSCRIPTION RECEIVED ***");
    print(`Transcription: "${text}", isFinal: ${isFinal}`);
    
    // Show the transcription result
    updateResult(`Heard: "${text}"`);
    
    // Check for "rise" command in the transcription
    checkForRiseCommand(text, isFinal);
}

function onTranscriptionError(errorCode) {
    print(`ASR Error: ${errorCode}`);
    isListening = false;
    
    switch (errorCode) {
        case AsrModule.AsrStatusCode.InternalError:
            updateStatus("Error: Internal Error");
            break;
        case AsrModule.AsrStatusCode.Unauthenticated:
            updateStatus("Error: Unauthenticated");
            break;
        case AsrModule.AsrStatusCode.NoInternet:
            updateStatus("Error: No Internet");
            break;
        default:
            updateStatus("Error: " + errorCode);
    }
}

function checkForRiseCommand(text, isFinal) {
    // Convert to lowercase for checking
    var lowerText = text.toLowerCase();
    
    // List of words that should trigger the "rise" command
    var riseWords = ["rise", "raise", "up", "lift", "elevate", "ascend", "rice", "surprise", "five", "hi"];
    
    // Check if any rise words are in the transcription
    for (var i = 0; i < riseWords.length; i++) {
        if (lowerText.includes(riseWords[i])) {
            print(`RISE command detected! Triggered by: "${riseWords[i]}"`);
            updateResult(`🔥 RISE command activated!`);
            isRiseTriggered = true;
            // Add your custom logic here when "rise" is detected
            handleRiseCommand();
            
            // Optionally stop listening after detecting the command
            if (isFinal) {
                stopListening();
            }
            break;
        }
    }
}

function handleRiseCommand() {
    print("🔥 RISE COMMAND TRIGGERED! 🔥");
    print("Current game state: " + (global.currentState ? global.currentState() : "unknown"));
    print("Is host: " + (global.isHost ? global.isHost() : "unknown"));
    print("Player count: " + (global.totalPlayersCount ? global.totalPlayersCount() : "unknown"));
    
    if(isRiseTriggered){
        // Only let the HOST send the event
        if (global.isHost && global.isHost()) {
            print("HOST detected rise - sending network event");
            if (typeof global.sendAncestorsRise === 'function') {
                print("*** CALLING global.sendAncestorsRise() ***");
                global.sendAncestorsRise();
                isRiseTriggered = false;
            }
        } else {
            print("NON-HOST detected rise - ignoring (only host can trigger events)");
            isRiseTriggered = false; // Reset the flag but don't send event
        }
    }
}


function startListening() {
    if (!isListening) {
        try {
            isListening = true;
            updateStatus("Starting transcription...");
            
            asrModule.startTranscribing(options);
            
            updateStatus("Listening... Say 'rise' or similar");
            print("ASR transcription started");
            
        } catch (error) {
            isListening = false;
            print("Error starting ASR: " + error);
            updateStatus("Error starting: " + error);
        }
    }
}

function stopListening() {
    if (isListening) {
        asrModule
            .stopTranscribing()
            .then(function () {
                isListening = false;
                updateStatus("Stopped listening");
                print("ASR transcription stopped successfully");
            })
            .catch(function (error) {
                print("Error stopping ASR: " + error);
                isListening = false;
                updateStatus("Error stopping");
            });
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

function startListening() {
    if (!isListening) {
        try {
            isListening = true;
            updateStatus("Starting transcription...");
            
            print("*** ATTEMPTING TO START ASR ***");
            asrModule.startTranscribing(options);
            print("*** ASR START COMMAND SENT ***");
            
            updateStatus("Listening... Say 'rise' or similar");
            print("ASR transcription started");
            
        } catch (error) {
            isListening = false;
            print("*** ERROR STARTING ASR: " + error + " ***");
            updateStatus("Error starting: " + error);
        }
    } else {
        print("*** ASR ALREADY LISTENING ***");
    }
}

// Initialize everything
initialize();

// Create touch controls
//createTouchEvent();

// Public functions you can call from other scripts
script.startListening = startListening;
script.stopListening = stopListening;
script.isListening = function() { return isListening; };