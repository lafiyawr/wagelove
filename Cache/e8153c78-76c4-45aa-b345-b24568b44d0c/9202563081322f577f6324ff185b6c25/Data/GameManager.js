//@input SceneObject[] uiElements // Array for UI elements you want to control
//@input Component.AudioComponent introAudio
//@input Component.AudioComponent ancestorIntroAudio

var syncEntity;

// Game States
var GameState = {
    WAITING_FOR_PLAYERS: "waiting_for_players",
    READY_TO_START: "ready_to_start", 
    INTRO_PLAYING: "intro_playing",
    ANCESTOR_INTRO: "ancestor_intro",
    ANCESTOR_SELECTION: "ancestor_selection",
    READY_TO_FUSE: "ready_to_fuse",
    EARTH_HEALING: "earth_healing",
    ANCESTOR_FUSION: "ancestor_fusion",
    GAME_COMPLETE: "game_complete"
};

// State variables
var currentState = GameState.WAITING_FOR_PLAYERS;

// Player tracking
var totalPlayersCount = 0;
var minPlayersRequired = 2;

// Progress tracking
var globalSelectionCount = 0;
var globalEarthHealedCount = 0;

// UI references (you can expand this)
var ui = {
    waitingMessage: null,
    readyButton: null,
    playerCountText: null
};

// Initialize the game manager
function init() {
    print("GameManager: Initializing...");
    setupSyncEntity();
    setupUI();
    setupGlobalFunctions();
}

// Setup sync entity and event listeners
function setupSyncEntity() {
    print("Creating SyncEntity...");
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onSyncReady);
}

function onSyncReady() {
    print("GameManager: SyncEntity is ready!");
    
    try {
        // Setup all event listeners
        syncEntity.onEventReceived.add('startIntro', function(eventData, messageInfo) {
            onReceiveStartIntro(eventData, messageInfo);
        });
        
        syncEntity.onEventReceived.add('showFireflies', function(eventData, messageInfo) {
            onReceiveShowFireflies(eventData, messageInfo);
        });
        
        syncEntity.onEventReceived.add('ancestorsRisemsg', function(eventData, messageInfo) {
            onReceiveAncestorsRise(eventData, messageInfo);
        });
        
        syncEntity.onEventReceived.add('playerCompletedSelections', function(eventData, messageInfo) {
            onReceivePlayerCompleted(eventData, messageInfo);
        });
        
        syncEntity.onEventReceived.add('readytofusemsg', function(eventData, messageInfo) {
            onReceiveReadyToFuse(eventData, messageInfo);
        });
        
        syncEntity.onEventReceived.add('playerHealedEarth', function(eventData, messageInfo) {
            onReceivePlayerHealed(eventData, messageInfo);
        });
        
        print("Event listeners added successfully!");
        
    } catch (e) {
        print("Failed to add event listeners: " + e);
    }
    
    updatePlayerCount();
    setupPlayerCountMonitoring();
    setState(GameState.WAITING_FOR_PLAYERS);
}

// Setup UI references and initial states
function setupUI() {
    // You can expand this to reference specific UI elements
    // For example:
    // ui.waitingMessage = script.uiElements[0];
    // ui.readyButton = script.uiElements[1];
    // etc.
    print("Setting up UI references...");
}

// Setup global functions for external scripts to call
function setupGlobalFunctions() {
    global.gameManagerReady = true;
    
    // External interface functions
    global.onPlayerCompleted = sendPlayerCompleted;
    global.onPlayerHealed = sendPlayerHealed;
    global.startGame = startGame;
    global.beginGame = beginGame;
}

// State management
function setState(newState) {
    if (currentState == newState) return;
    
    print("State change: " + currentState + " -> " + newState);
    var previousState = currentState;
    currentState = newState;
    
    onStateExit(previousState);
    onStateEnter(newState);
}

function onStateEnter(state) {
    print("Entering state: " + state);
    
    switch(state) {
        case GameState.WAITING_FOR_PLAYERS:
            showWaitingForPlayers();
            break;
            
        case GameState.READY_TO_START:
            showReadyToStart();
            break;
            
        case GameState.INTRO_PLAYING:
            playIntro();
            break;
            
        case GameState.ANCESTOR_INTRO:
            playAncestorIntro();
            break;
            
        case GameState.ANCESTOR_SELECTION:
            startAncestorSelection();
            break;
            
        case GameState.READY_TO_FUSE:
            showReadyToFuse();
            break;
            
        case GameState.EARTH_HEALING:
            startEarthHealing();
            break;
            
        case GameState.ANCESTOR_FUSION:
            playAncestorFusion();
            break;
            
        case GameState.GAME_COMPLETE:
            showGameComplete();
            break;
    }
}

function onStateExit(state) {
    // Clean up previous state if needed
    switch(state) {
        case GameState.WAITING_FOR_PLAYERS:
            hideWaitingUI();
            break;
            
        case GameState.ANCESTOR_SELECTION:
            resetGlobalSelections();
            break;
            
        case GameState.EARTH_HEALING:
            resetEarthHealing();
            break;
    }
}

// State-specific logic
function showWaitingForPlayers() {
    print("Showing waiting for players UI");
    
    if (global.sessionController && global.sessionController.isSingleplayer()) {
        // Auto-advance for single player
        setState(GameState.READY_TO_START);
        return;
    }
    
    // Show waiting UI
    setUIVisibility("waitingMessage", true);
    setUIVisibility("readyButton", false);
    updatePlayerCountDisplay();
}

function showReadyToStart() {
    print("Showing ready to start UI");
    setUIVisibility("waitingMessage", false);
    setUIVisibility("readyButton", true);
    
    if (global.sessionController && global.sessionController.isSingleplayer()) {
        // Auto-start for single player
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function() {
            beginGame();
        });
        delayedEvent.reset(1.0);
    }
}

function startGame() {
    setState(GameState.WAITING_FOR_PLAYERS);
}

function beginGame() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        sendStartIntro();
    }
}

function playIntro() {
    print("Playing intro sequence");
    hideAllUI();
    
    // Play intro audio if available
    if (script.introAudio) {
        script.introAudio.play();
    }
    
    // Set timer for next state (only host)
    if (syncEntity && syncEntity.doIOwnStore()) {
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function() {
            sendShowFireflies();
        });
        delayedEvent.reset(script.introTimer);
    }
}

function playAncestorIntro() {
    print("Playing ancestor intro");
    
    // Play ancestor intro audio if available
    if (script.ancestorIntroAudio) {
        script.ancestorIntroAudio.play();
    }
    
    // Transition to selection after audio/delay
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        setState(GameState.ANCESTOR_SELECTION);
    });
    delayedEvent.reset(5.0); // Adjust based on your audio length
}

function startAncestorSelection() {
    print("Starting ancestor selection phase");
    resetGlobalSelections();
    updatePlayerCount();
    
    // Enable ancestor selection UI/interactions
    // Your ancestor selection script will call global.onPlayerCompleted()
}

function showReadyToFuse() {
    print("Ready to fuse - starting earth healing");
    setState(GameState.EARTH_HEALING);
}

function startEarthHealing() {
    print("Starting earth healing phase");
    resetEarthHealing();
    updatePlayerCount();
    
    // Enable earth healing interactions
    // Your earth healing script will call global.onPlayerHealed()
}

function playAncestorFusion() {
    print("Playing ancestor fusion sequence");
    
    // Play fusion effects, animations, etc.
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        setState(GameState.GAME_COMPLETE);
    });
    delayedEvent.reset(5.0); // Adjust based on your fusion sequence length
}

function showGameComplete() {
    print("Game complete!");
    // Show completion UI, credits, etc.
}

// Network message senders
function sendStartIntro() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending start intro event");
        syncEntity.sendEvent('startIntro');
    }
}

function sendShowFireflies() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending show fireflies event");
        syncEntity.sendEvent('showFireflies');
    }
}

function sendAncestorsRise() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending ancestors rise event");
        syncEntity.sendEvent('ancestorsRisemsg');
    }
}

function sendReadyToFuse() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending ready to fuse event");
        syncEntity.sendEvent('readytofusemsg');
    }
}

function sendPlayerCompleted() {
    print("This player completed all ancestor selections!");
    
    if (syncEntity) {
        var eventData = {
            userId: global.sessionController.getLocalUserId(),
            userName: global.sessionController.getLocalUserName(),
            timestamp: Date.now()
        };
        
        print("Sending player completed event for: " + eventData.userName);
        syncEntity.sendEvent('playerCompletedSelections', eventData);
    }
}

function sendPlayerHealed() {
    print("This player healed the earth!");
    
    if (syncEntity) {
        var eventData = {
            userId: global.sessionController.getLocalUserId(),
            userName: global.sessionController.getLocalUserName(),
            timestamp: Date.now()
        };
        
        print("Sending player healed event for: " + eventData.userName);
        syncEntity.sendEvent('playerHealedEarth', eventData);
    }
}

// Network message receivers
function onReceiveStartIntro(eventData, messageInfo) {
    print("Received start intro event");
    setState(GameState.INTRO_PLAYING);
}

function onReceiveShowFireflies(eventData, messageInfo) {
    print("Received show fireflies event");
    setState(GameState.ANCESTOR_INTRO);
}

function onReceiveAncestorsRise(eventData, messageInfo) {
    print("Received ancestors rise event");
    setState(GameState.ANCESTOR_SELECTION);
}

function onReceivePlayerCompleted(eventData, messageInfo) {
    globalSelectionCount += 1;
    
    var playerName = (eventData && eventData.userName) ? eventData.userName : "Unknown Player";
    print("Player completed selections: " + playerName);
    print("Players completed: " + globalSelectionCount + "/" + totalPlayersCount);
    
    if (globalSelectionCount >= totalPlayersCount) {
        print("All players completed selections!");
        
        if (syncEntity && syncEntity.doIOwnStore()) {
            var delayedEvent = script.createEvent("DelayedCallbackEvent");
            delayedEvent.bind(function() {
                sendReadyToFuse();
            });
            delayedEvent.reset(0.5);
        }
    }
}

function onReceiveReadyToFuse(eventData, messageInfo) {
    print("Received ready to fuse event");
    setState(GameState.READY_TO_FUSE);
}

function onReceivePlayerHealed(eventData, messageInfo) {
    globalEarthHealedCount += 1;
    
    var playerName = (eventData && eventData.userName) ? eventData.userName : "Unknown Player";
    print("Player healed earth: " + playerName);
    print("Players healed: " + globalEarthHealedCount + "/" + totalPlayersCount);
    
    if (globalEarthHealedCount >= totalPlayersCount) {
        print("All players healed the earth!");
        setState(GameState.ANCESTOR_FUSION);
    }
}

// Utility functions
function updatePlayerCount() {
    if (global.sessionController) {
        var users = global.sessionController.getUsers();
        totalPlayersCount = users.length;
        print("Updated player count: " + totalPlayersCount);
        
        // Check if we have enough players to start
        if (currentState == GameState.WAITING_FOR_PLAYERS && 
            totalPlayersCount >= minPlayersRequired) {
            setState(GameState.READY_TO_START);
        }
        
        updatePlayerCountDisplay();
    }
}

function setupPlayerCountMonitoring() {
    var updateEvent = script.createEvent("UpdateEvent");
    var lastPlayerCount = 0;
    
    updateEvent.bind(function() {
        if (global.sessionController) {
            var currentCount = global.sessionController.getUsers().length;
            if (currentCount != lastPlayerCount) {
                print("Player count changed from " + lastPlayerCount + " to " + currentCount);
                lastPlayerCount = currentCount;
                updatePlayerCount();
            }
        }
    });
}

// UI helper functions
function setUIVisibility(elementName, visible) {
    // You can implement this to show/hide specific UI elements
    // For example, if you have references to UI objects:
    /*
    if (ui[elementName]) {
        ui[elementName].enabled = visible;
    }
    */
    print("Setting " + elementName + " visibility: " + visible);
}

function updatePlayerCountDisplay() {
    var message = "Players: " + totalPlayersCount;
    if (currentState == GameState.WAITING_FOR_PLAYERS) {
        message += "/" + minPlayersRequired + " (Waiting for more players)";
    }
    print("Player count display: " + message);
    
    // Update UI text element if you have one
    // ui.playerCountText.text = message;
}

function hideWaitingUI() {
    setUIVisibility("waitingMessage", false);
    setUIVisibility("readyButton", false);
}

function hideAllUI() {
    hideWaitingUI();
    // Hide any other UI elements
}

// Reset functions
function resetGlobalSelections() {
    globalSelectionCount = 0;
    print("Global selections reset");
}

function resetEarthHealing() {
    globalEarthHealedCount = 0;
    print("Global earth healing count reset");
}

// Initialize the game manager
function onStart() {
    init();
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);