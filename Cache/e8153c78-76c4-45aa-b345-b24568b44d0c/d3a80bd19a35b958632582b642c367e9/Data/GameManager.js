//@input int introTimer
//@input SceneObject[] uiElements // Array for UI elements you want to control
//@input Component.AudioComponent introAudio
//@input Component.AudioComponent ancestorIntroAudio
//@input SceneObject surfaceDetection
//@input SceneObject readyButton

var syncEntity;

// Game States
var GameState = {
    MENU: "menu", // Initial state - show single/multiplayer buttons
    WAITING_FOR_PLAYERS: "waiting_for_players", // Host waiting for players to join
    SURFACE_TRACKING: "surface_tracking", // Host placing surface tracking
    OBJECTS_PLACED: "objects_placed", // Objects visible, waiting for ready
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
var currentState = GameState.MENU;
var isGameManagerActive = false; // Track if we should be managing the game

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
    playerCountText: null,
    hostWaitingMessage: null,
    singlePlayerButton: null,
    multiplayerButton: null
};

// Initialize the game manager
function init() {
    print("GameManager: Initializing...");
    setupSyncEntity();
    setupUI();
    setupGlobalFunctions();
    
    // Start in menu state but don't show our UI yet
    isGameManagerActive = false;
    setState(GameState.MENU);
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
        
        syncEntity.onEventReceived.add('objectsPlaced', function(eventData, messageInfo) {
            onReceiveObjectsPlaced(eventData, messageInfo);
        });
        
        print("Event listeners added successfully!");
        
    } catch (e) {
        print("Failed to add event listeners: " + e);
    }
    
    updatePlayerCount();
    setupPlayerCountMonitoring();
    setState(GameState.MENU);
}

// Setup UI references and initial states
function setupUI() {
    // Set up UI object references
    if (script.waitingMessageText) {
        ui.waitingMessage = script.waitingMessageText.getSceneObject();
    }
    if (script.hostWaitingMessageText) {
        ui.hostWaitingMessage = script.hostWaitingMessageText.getSceneObject();
    }
    if (script.readyButton) {
        ui.readyButton = script.readyButton;
    }
    if (script.playerCountText) {
        ui.playerCountText = script.playerCountText;
    }
    if (script.singlePlayerButton) {
        ui.singlePlayerButton = script.singlePlayerButton;
    }
    if (script.multiplayerButton) {
        ui.multiplayerButton = script.multiplayerButton;
    }
    
    print("Setting up UI references...");
}

// Setup global functions for external scripts to call
function setupGlobalFunctions() {
    global.gameManagerReady = true;
    
    // External interface functions
    global.onPlayerCompleted = sendPlayerCompleted;
    global.onPlayerHealed = sendPlayerHealed;
    global.startSinglePlayer = startSinglePlayer;
    global.startMultiplayer = startMultiplayer;
    global.onSurfaceTrackingPlaced = onSurfaceTrackingPlaced;
    global.beginGame = beginGame;
    global.isHost = isHost;
    global.getHostName = getHostName;
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
        case GameState.MENU:
            showMenu();
            break;
            
        case GameState.WAITING_FOR_PLAYERS:
            showWaitingForPlayers();
            break;
            
        case GameState.SURFACE_TRACKING:
            showSurfaceTracking();
            break;
            
        case GameState.OBJECTS_PLACED:
            showObjectsPlaced();
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
        case GameState.MENU:
            hideMenu();
            break;
            
        case GameState.WAITING_FOR_PLAYERS:
            hideWaitingUI();
            break;
            
        case GameState.SURFACE_TRACKING:
            hideSurfaceTracking();
            break;
            
        case GameState.ANCESTOR_SELECTION:
            resetGlobalSelections();
            break;
            
        case GameState.EARTH_HEALING:
            resetEarthHealing();
            break;
    }
}

// Check if this player is the host/first player
function isHost() {
    return syncEntity && syncEntity.doIOwnStore();
}

// Get the host's display name
function getHostName() {
    if (syncEntity && syncEntity.ownerInfo && syncEntity.ownerInfo.displayName) {
        return syncEntity.ownerInfo.displayName;
    }
    return "Player 1";
}

// State-specific logic
function showMenu() {
    if (!isGameManagerActive) {
        // Game Manager is loaded but not active yet
        // Let the StartMenu handle the UI
        print("Game Manager ready but waiting for user choice");
        return;
    }
    
    print("Showing menu - single player and multiplayer buttons");
    
    // Show menu buttons (only if Game Manager is actively managing)
    setUIVisibility("singlePlayerButton", true);
    setUIVisibility("multiplayerButton", true);
    
    // Hide all other UI
    hideAllGameUI();
}

function startSinglePlayer() {
    print("Starting single player mode");
    isGameManagerActive = true;
    setState(GameState.INTRO_PLAYING);
}

function startMultiplayer() {
    print("Starting multiplayer mode");
    isGameManagerActive = true;
    setState(GameState.WAITING_FOR_PLAYERS);
}

function showWaitingForPlayers() {
    print("Showing waiting for players UI");
    
    if (isHost()) {
        // Host sees waiting message and surface tracking
        setUIVisibility("waitingMessage", true);
        setUIVisibility("playerCountText", true);
        setUIVisibility("hostWaitingMessage", false);
        setUIVisibility("readyButton", false);
        
        // Enable surface tracking for host
        enableSurfaceTracking(true);
        
        // Show surface tracking UI
        setState(GameState.SURFACE_TRACKING);
    } else {
        // Non-host sees waiting for host message
        setUIVisibility("waitingMessage", false);
        setUIVisibility("readyButton", false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        
        enableSurfaceTracking(false);
        updateHostWaitingMessage();
    }
    
    updatePlayerCountDisplay();
}

function showSurfaceTracking() {
    print("Showing surface tracking for host");
    
    if (isHost()) {
        // Host sees surface tracking UI and waiting message
        enableSurfaceTracking(true);
        setUIVisibility("waitingMessage", true);
        setUIVisibility("playerCountText", true);
        
        // Update waiting message for surface tracking phase
        setUIText("waitingMessage", "Tap to place the experience and wait for other players");
    } else {
        // Non-hosts just wait
        updateHostWaitingMessage();
    }
}

function onSurfaceTrackingPlaced() {
    print("Surface tracking placed by host");
    
    if (isHost()) {
        // Host placed surface tracking - show objects for everyone
        sendObjectsPlaced();
    }
}

function showObjectsPlaced() {
    print("Objects placed - showing for all players");
    
    // Show game objects for everyone
    showGameObjects(true);
    
    if (isHost()) {
        // Host sees ready button
        setUIVisibility("waitingMessage", false);
        setUIVisibility("readyButton", true);
        hideSurfaceTrackingUI(); // Hide surface tracking UI but keep objects
        
        // Check if we have enough players to start
        if (totalPlayersCount >= minPlayersRequired) {
            setState(GameState.READY_TO_START);
        }
    } else {
        // Non-host sees waiting message
        setUIVisibility("hostWaitingMessage", true);
        updateHostWaitingMessage();
    }
}

function showReadyToStart() {
    print("Ready to start - host can begin game");
    
    if (isHost()) {
        setUIVisibility("readyButton", true);
        setUIVisibility("waitingMessage", false);
    } else {
        updateHostWaitingMessage();
    }
}

function startGame() {
    setState(GameState.MENU);
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
        
        // Check if introTimer is valid, otherwise use default
        var timerDuration = script.introTimer || 5.0; // Default to 5 seconds
        if (typeof timerDuration != "number" || timerDuration <= 0) {
            timerDuration = 5.0;
        }
        
        print("Setting intro timer for " + timerDuration + " seconds");
        delayedEvent.reset(timerDuration);
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

function sendObjectsPlaced() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending objects placed event");
        syncEntity.sendEvent('objectsPlaced');
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

function onReceiveObjectsPlaced(eventData, messageInfo) {
    print("Received objects placed event");
    setState(GameState.OBJECTS_PLACED);
}

// Utility functions
function updatePlayerCount() {
    if (global.sessionController) {
        var users = global.sessionController.getUsers();
        totalPlayersCount = users.length;
        print("Updated player count: " + totalPlayersCount);
        
        // Only check for ready state if we're in multiplayer mode and have minimum players
        if (currentState == GameState.WAITING_FOR_PLAYERS && 
            totalPlayersCount >= minPlayersRequired && 
            isGameManagerActive) {
            // Don't auto-advance - wait for surface tracking to be placed
            print("Minimum players reached, but waiting for surface tracking");
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

// Update the waiting message for non-hosts
function updateHostWaitingMessage() {
    var hostName = getHostName();
    var message = "Waiting for " + hostName + " to start the experience...";
    
    // Update the UI text if you have a reference
    setUIText("hostWaitingMessage", message);
    print("Host waiting message: " + message);
}

// Enable/disable surface tracking
function enableSurfaceTracking(enable) {
    // Simply enable/disable the surface tracking scene object
    if (script.surfaceTrackingUI) {
        script.surfaceTrackingUI.enabled = enable;
    }
    
    script.surfaceDetection.enabled = enable;
    
    
    print("Surface tracking enabled: " + enable);
}

// UI helper functions
function setUIVisibility(elementName, visible) {
    // Show/hide specific UI elements
    if (ui[elementName]) {
        ui[elementName].enabled = visible;
    }
    print("Setting " + elementName + " visibility: " + visible);
}

function setUIText(elementName, text) {
    // Update text elements
    if (elementName == "hostWaitingMessage" && script.hostWaitingMessageText) {
        script.hostWaitingMessageText.text = text;
    } else if (elementName == "playerCountText" && script.playerCountText) {
        script.playerCountText.text = text;
    }
    print("Setting " + elementName + " text: " + text);
}

function updatePlayerCountDisplay() {
    var message = "Players: " + totalPlayersCount;
    
    if (currentState == GameState.WAITING_FOR_PLAYERS) {
        if (isHost()) {
            message += "/" + minPlayersRequired + " (You are hosting)";
        } else {
            message += "/" + minPlayersRequired + " (Joined session)";
        }
    }
    
    print("Player count display: " + message);
    setUIText("playerCountText", message);
}

function hideWaitingUI() {
    setUIVisibility("waitingMessage", false);
    setUIVisibility("readyButton", false);
    setUIVisibility("hostWaitingMessage", false);
}

function hideMenu() {
    setUIVisibility("singlePlayerButton", false);
    setUIVisibility("multiplayerButton", false);
}

function hideSurfaceTracking() {
    // Keep objects visible but hide surface tracking UI
    hideSurfaceTrackingUI();
}

function hideAllGameUI() {
    hideWaitingUI();
    setUIVisibility("playerCountText", false);
    hideSurfaceTrackingUI();
}

function hideSurfaceTrackingUI() {
    if (script.surfaceTrackingUI) {
        script.surfaceTrackingUI.enabled = false;
    }
}

function showGameObjects(visible) {
    // Show/hide the main game objects
    if (script.gameObjects) {
        for (var i = 0; i < script.gameObjects.length; i++) {
            if (script.gameObjects[i]) {
                script.gameObjects[i].enabled = visible;
            }
        }
    }
    print("Game objects visibility: " + visible);
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