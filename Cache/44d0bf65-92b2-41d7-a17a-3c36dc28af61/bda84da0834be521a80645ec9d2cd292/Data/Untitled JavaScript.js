// Require the VoiceML Module
const voiceMLModule = require('LensStudio:VoiceMLModule');

// @input Component.Text statusText {"hint":"Text component to show status"}
// @input Component.Text resultText {"hint":"Text component to show results"}

var isListening = false;
var options;

function initialize() {
    // Create listening options
    options = VoiceML.ListeningOptions.create();
    
    // Set language (hardcoded to avoid getLanguage() network API issue)
    options.languageCode = 'en_US';
    
    // Set speech recognizer
    options.speechRecognizer = VoiceMLModule.SpeechRecognizer.Default;
    
    // Add keyword model for "rise" command
    try {
        var nlpKeywordModel = VoiceML.NlpKeywordModelOptions.create();
        
        // Add "rise" with common aliases and variations
        var riseAliases = ["rise", "raise", "up", "lift", "elevate", "ascend"];
        nlpKeywordModel.addKeywordGroup("rise", riseAliases);
        
        options.nlpModels = [nlpKeywordModel];
        print("Added 'rise' keyword with aliases: " + riseAliases.join(", "));
    } catch (keywordError) {
        print("Keyword model creation failed: " + keywordError);
    }
    
    // Set up event handlers
    setupEventHandlers();
    
    updateStatus("Ready - Tap to start listening");
}

function setupEventHandlers() {
    // Handler for when microphone input is enabled
    let onListeningEnabledHandler = function () {
        print("Microphone enabled");
        // Don't auto-start here to avoid loops
    };
    
    // Handler for when microphone input is disabled
    let onListeningDisabledHandler = function () {
        print("Microphone disabled");
        isListening = false;
        updateStatus("Microphone disabled");
    };
    
    // Handler for transcription updates
    let onUpdateListeningEventHandler = function (eventArgs) {
        try {
            // Get keyword responses and parse them properly
            var keywordResponses = eventArgs.getKeywordResponses();
            var keywords = parseKeywordResponses(keywordResponses);
            
            if (keywords.length > 0) {
                for (var i = 0; i < keywords.length; i++) {
                    var keyword = keywords[i];
                    print("Keyword detected: " + keyword);
                    updateResult("Command: " + keyword);
                    handleVoiceCommand(keyword);
                }
            }
            
            // Get transcription responses if available (fallback)
            var transcriptionResponses = eventArgs.getTranscriptionResponses();
            if (transcriptionResponses && transcriptionResponses.length > 0) {
                for (var k = 0; k < transcriptionResponses.length; k++) {
                    var transcription = transcriptionResponses[k];
                    if (transcription.status.code === 0) { // 0 = OK
                        print("Transcription: " + transcription.transcription);
                        updateResult("Said: " + transcription.transcription);
                        checkTranscriptionForCommands(transcription.transcription);
                    }
                }
            }
            
        } catch (error) {
            print("Error processing listening update: " + error);
        }
    };
    
    // Handler for errors
    let onListeningErrorHandler = function (eventErrorArgs) {
        print('VoiceML Error: ' + eventErrorArgs.error + ' desc: ' + eventErrorArgs.description);
        updateStatus("Error: " + eventErrorArgs.error);
        isListening = false;
    };
    
    // Add event handlers
    voiceMLModule.onListeningEnabled.add(onListeningEnabledHandler);
    voiceMLModule.onListeningDisabled.add(onListeningDisabledHandler);
    voiceMLModule.onListeningError.add(onListeningErrorHandler);
    voiceMLModule.onListeningUpdate.add(onUpdateListeningEventHandler);
    
    print("Event handlers set up successfully");
}

function startListening() {
    if (!isListening) {
        try {
            isListening = true;
            updateStatus("Starting...");
            voiceMLModule.startListening(options);
            print("Started listening");
            updateStatus("Listening... Speak now");
        } catch (error) {
            isListening = false;
            print("Error starting voice recognition: " + error);
            updateStatus("Error starting: " + error);
        }
    }
}

function stopListening() {
    if (isListening) {
        try {
            voiceMLModule.stopListening();
            isListening = false;
            updateStatus("Stopped listening");
            print("Stopped listening");
        } catch (error) {
            print("Error stopping voice recognition: " + error);
        }
    }
}

// Parse keyword responses with proper error handling
function parseKeywordResponses(keywordResponses) {
    var keywords = [];
    for (var kIterator = 0; kIterator < keywordResponses.length; kIterator++) {
        var keywordResponse = keywordResponses[kIterator];
        
        switch (keywordResponse.status.code) {
            case 0: // OK
                for (var keywordsIterator = 0; keywordsIterator < keywordResponse.keywords.length; keywordsIterator++) {
                    var keyword = keywordResponse.keywords[keywordsIterator];
                    
                    // Check for error keywords
                    if (keyword.includes('#SNAP_ERROR')) {
                        var errorMessage = getErrorMessage(keyword);
                        print('Keyword Error: ' + errorMessage);
                        break;
                    }
                    
                    keywords.push(keyword);
                }
                break;
            case 1: // ERROR
                print('Status Code: ERROR Description: ' + keywordResponse.status.description);
                break;
            default:
                print('Status Code: No Status Code');
        }
    }
    return keywords;
}

// Get error message for keyword errors
function getErrorMessage(response) {
    var errorMessage = '';
    switch (response) {
        case '#SNAP_ERROR_INDECISIVE':
            errorMessage = 'indecisive';
            break;
        case '#SNAP_ERROR_NONVERBAL':
            errorMessage = 'non verbal';
            break;
        case '#SNAP_ERROR_SILENCE':
            errorMessage = 'too long silence';
            break;
        default:
            if (response.includes('#SNAP_ERROR')) {
                errorMessage = 'general error';
            } else {
                errorMessage = 'unknown error';
            }
    }
    return errorMessage;
}
// Check transcription text for "rise" command (fallback method)
function checkTranscriptionForCommands(transcription) {
    var lowerTranscription = transcription.toLowerCase();
    var riseWords = ["rise", "raise", "up", "lift", "elevate", "ascend"];
    
    for (var i = 0; i < riseWords.length; i++) {
        if (lowerTranscription.includes(riseWords[i])) {
            handleVoiceCommand("rise");
            break;
        }
    }
}

// Handle recognized commands
function handleVoiceCommand(command) {
    var lowerCommand = command.toLowerCase();
    
    if (lowerCommand === "rise") {
        updateResult("Rise command detected!");
        print("RISE command triggered");
        
        // Add your custom logic here when "rise" is detected
        // For example:
        // - Trigger an animation
        // - Move an object upward
        // - Change scene elements
        // - Call other functions
        
    } else {
        updateResult("Command: " + command);
        print("Other command detected: " + command);
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