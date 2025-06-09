// Require the ASR Module
const asrModule = require("LensStudio:AsrModule");

// @input Component.Text statusText {"hint":"Text component to show status"}
// @input Component.Text resultText {"hint":"Text component to show results"}
//@input SceneObject UIRiseShrink

var isListening = false;
var options;
var isRiseTriggered = false;
var voiceRiseTriggered = false;
var voiceRiseTimeout = null;

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
            // shrink the Rise UI
            script.UIRiseShrink.enabled = enable;

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
    
    if (voiceRiseTriggered) {
        print("*** Rise already triggered from voice - ignoring duplicate ***");
        return;
    }
    
    // Check if this is single player mode
    var isSinglePlayerMode = !global.sessionController || 
                            (global.sessionController && global.sessionController.getUsers().length <= 1);
    
    print("Single player mode: " + isSinglePlayerMode);
    print("Current game state: " + (global.currentState ? global.currentState() : "unknown"));
    print("Is host: " + (global.isHost ? global.isHost() : "unknown"));
    print("Player count: " + (global.sessionController ? global.sessionController.getUsers().length : "no session"));
    
    if(isRiseTriggered){
        if (isSinglePlayerMode) {
            // Single player: trigger immediately
            print("SINGLE PLAYER detected rise - triggering command");
            voiceRiseTriggered = true;
            callSendAncestorsRise();
            
        } else if (global.isHost && global.isHost()) {
            // Multiplayer host: trigger immediately
            print("MULTIPLAYER HOST detected rise - sending network event immediately");
            voiceRiseTriggered = true;
            callSendAncestorsRise();
            
        } else {
            // Multiplayer non-host: give host 3 seconds, then trigger
            print("MULTIPLAYER NON-HOST detected rise - giving host 3 seconds...");
            
            if (!voiceRiseTimeout) {
                voiceRiseTimeout = script.createEvent("DelayedCallbackEvent");
                voiceRiseTimeout.bind(function() {
                    if (!voiceRiseTriggered) {
                        print("*** HOST didn't respond to voice - NON-HOST taking over! ***");
                        voiceRiseTriggered = true;
                        callSendAncestorsRise();
                    }
                });
                voiceRiseTimeout.reset(3.0); // 3 second timeout
            }
        }
        
        isRiseTriggered = false; // Reset the detection flag
    }
}


function callSendAncestorsRise() {
    if (typeof global.sendAncestorsRise === 'function') {
        print("*** CALLING global.sendAncestorsRise() ***");
        global.sendAncestorsRise();
    } else {
        print("ERROR: global.sendAncestorsRise function not found");
    }
    
    // Cancel any pending timeout since we triggered
    if (voiceRiseTimeout) {
        voiceRiseTimeout.enabled = false;
        voiceRiseTimeout = null;
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