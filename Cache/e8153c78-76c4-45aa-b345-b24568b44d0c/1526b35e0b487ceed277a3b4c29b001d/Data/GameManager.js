//@input int introTimer
//@input SceneObject[] uiElements
//@input Component.AudioComponent introAudio
//@input Component.AudioComponent ancestorIntroAudio
//@input SceneObject surfaceDetection
//@input SceneObject readyButton
//@input Component.Text waitingMessageText
//@input Component.Text hostWaitingMessageText  
//@input Component.Text playerCountText
//@input SceneObject singlePlayerButton
//@input SceneObject multiplayerButton
//@input SceneObject[] gameObjects

var syncEntity;

// Game States
var GameState = {
    MENU: "menu",
    WAITING_FOR_PLAYERS: "waiting_for_players",
    SURFACE_TRACKING: "surface_tracking",
    OBJECTS_PLACED: "objects_placed",
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
var isGameManagerActive = false;

// Player tracking
var totalPlayersCount = 0;
var minPlayersRequired = 2;

// Progress tracking
var globalSelectionCount = 0;
var globalEarthHealedCount = 0;

// UI references
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
    
    isGameManagerActive = false;
    currentState = GameState.MENU;
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
    
    // If we're in waiting for players state, now check host status
    if (currentState == GameState.WAITING_FOR_PLAYERS) {
        print("SyncEntity ready - rechecking host status for waiting players");
        checkHostStatusAndShowUI();
    }
    
    print("GameManager ready - waiting for user input");
}

// Setup UI references and initial states
function setupUI() {
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
    switch(state) {
        case GameState.MENU:
            hideMenu();
            break;
        case GameState.WAITING_FOR_PLAYERS:
            hideWaitingUI();
            break;
        case GameState.SURFACE_TRACKING:
            // Don't disable surface tracking here - it needs to stay for the scene objects
            print("Exiting surface tracking state - keeping surface tracking enabled");
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

// Enable/disable surface tracking script component (not the entire object)
function enableSurfaceTracking(enable) {
    if (script.surfaceDetection) {
        // Find the SurfaceDetection script component specifically
        var scriptComponents = script.surfaceDetection.getComponents("Component.ScriptComponent");
        var surfaceDetectionScript = null;
        
        for (var i = 0; i < scriptComponents.length; i++) {
            // Check if this is the SurfaceDetection script
            if (scriptComponents[i].script && 
                (scriptComponents[i].script.name === "SurfaceDetection" || 
                 scriptComponents[i].script.name.indexOf("SurfaceDetection") !== -1)) {
                surfaceDetectionScript = scriptComponents[i];
                break;
            }
        }
        
        if (surfaceDetectionScript) {
            surfaceDetectionScript.enabled = enable;
            print("SurfaceDetection script component enabled: " + enable);
        } else {
            // Fallback: try to get any script component
            var firstScript = script.surfaceDetection.getComponent("Component.ScriptComponent");
            if (firstScript) {
                firstScript.enabled = enable;
                print("Surface tracking script component enabled: " + enable + " (fallback method)");
            } else {
                print("Warning: No script component found on surfaceDetection object");
            }
        }
        
        // Always keep the SceneObject itself enabled so content remains visible
        script.surfaceDetection.enabled = true;
    } else {
        print("Warning: surfaceDetection input not connected");
    }
}

// Enable/disable ready button
function enableReadyButton(enable) {
    if (script.readyButton) {
        script.readyButton.enabled = enable;
        print("Ready button enabled: " + enable);
    } else {
        print("Warning: readyButton input not connected");
    }
}

// State-specific logic
function showMenu() {
    if (!isGameManagerActive) {
        print("Game Manager ready but waiting for user choice");
        return;
    }
    
    print("Showing menu - single player and multiplayer buttons");
    setUIVisibility("singlePlayerButton", true);
    setUIVisibility("multiplayerButton", true);
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
    
    if (syncEntity && isHost() !== undefined) {
        checkHostStatusAndShowUI();
    } else {
        print("SyncEntity not ready - will check host status when ready");
        
        setUIVisibility("waitingMessage", false);
        enableReadyButton(false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        enableSurfaceTracking(false); // Disable surface tracking script for non-host
        updateHostWaitingMessage();
        updatePlayerCountDisplay();
    }
}

function checkHostStatusAndShowUI() {
    print("Checking host status - isHost: " + isHost());
    
    if (isHost()) {
        print("You are the host - enabling surface tracking");
        setUIVisibility("waitingMessage", true);
        setUIVisibility("playerCountText", true);
        setUIVisibility("hostWaitingMessage", false);
        enableReadyButton(false);
        
        enableSurfaceTracking(true); // Enable surface tracking script for host
        
        setUIText("waitingMessage", "Looking for a surface to place the experience...");
        
        setState(GameState.SURFACE_TRACKING);
    } else {
        print("You are not the host - waiting for host to place surface");
        setUIVisibility("waitingMessage", false);
        enableReadyButton(false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        
        enableSurfaceTracking(false); // Disable surface tracking script for non-host
        updateHostWaitingMessage();
    }
    
    updatePlayerCountDisplay();
}

function showSurfaceTracking() {
    print("Showing surface tracking for host");
    
    if (isHost()) {
        enableSurfaceTracking(true);
        setUIVisibility("waitingMessage", true);
        setUIVisibility("playerCountText", true);
        
        setUIText("waitingMessage", "Looking for a surface to place the experience...");
    } else {
        updateHostWaitingMessage();
    }
}

function onSurfaceTrackingPlaced() {
    print("Surface tracking placed by host");
    
    if (isHost()) {
        sendObjectsPlaced();
    }
}

function showObjectsPlaced() {
    print("Objects placed - showing for all players");
    
    showGameObjects(true);
    
    // Ensure surface detection object stays enabled for content visibility
    if (script.surfaceDetection) {
        script.surfaceDetection.enabled = true;
        print("Surface detection object kept enabled for content visibility");
    }
    
    if (isHost()) {
        setUIVisibility("waitingMessage", false);
        enableReadyButton(true);
        // Keep surface tracking enabled for host
        enableSurfaceTracking(true);
        
        if (totalPlayersCount >= minPlayersRequired) {
            setState(GameState.READY_TO_START);
        }
    } else {
        setUIVisibility("hostWaitingMessage", true);
        updateHostWaitingMessage();
        enableReadyButton(false);
        // Keep surface tracking script disabled for non-host, but object enabled
        enableSurfaceTracking(false);
    }
}

function showReadyToStart() {
    print("Ready to start - host can begin game");
    
    if (isHost()) {
        enableReadyButton(true);
        setUIVisibility("waitingMessage", false);
        
        // Make sure surface tracking stays enabled for host
        enableSurfaceTracking(true);
        print("Host ready state: Surface tracking kept enabled");
    } else {
        updateHostWaitingMessage();
        enableReadyButton(false);
        
        // Keep surface tracking script disabled for non-host
        enableSurfaceTracking(false);
        print("Non-host ready state: Surface tracking script disabled, object enabled");
    }
}

function beginGame() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        sendStartIntro();
    }
}

function playIntro() {
    print("Playing intro sequence");
    hideAllUI();
    
    if (script.introAudio) {
        script.introAudio.play();
    }
    
    if (syncEntity && syncEntity.doIOwnStore()) {
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function() {
            sendShowFireflies();
        });
        
        var timerDuration = script.introTimer || 5.0;
        if (typeof timerDuration != "number" || timerDuration <= 0) {
            timerDuration = 5.0;
        }
        
        print("Setting intro timer for " + timerDuration + " seconds");
        delayedEvent.reset(timerDuration);
    }
}

function playAncestorIntro() {
    print("Playing ancestor intro");
    
    if (script.ancestorIntroAudio) {
        script.ancestorIntroAudio.play();
    }
    
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        setState(GameState.ANCESTOR_SELECTION);
    });
    delayedEvent.reset(5.0);
}

function startAncestorSelection() {
    print("Starting ancestor selection phase");
    resetGlobalSelections();
    updatePlayerCount();
}

function showReadyToFuse() {
    print("Ready to fuse - starting earth healing");
    setState(GameState.EARTH_HEALING);
}

function startEarthHealing() {
    print("Starting earth healing phase");
    resetEarthHealing();
    updatePlayerCount();
}

function playAncestorFusion() {
    print("Playing ancestor fusion sequence");
    
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        setState(GameState.GAME_COMPLETE);
    });
    delayedEvent.reset(5.0);
}

function showGameComplete() {
    print("Game complete!");
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
    
    // Ensure surface detection object stays enabled for content visibility
    if (script.surfaceDetection) {
        script.surfaceDetection.enabled = true;
        print("Surface detection object kept enabled for content visibility");
    }
    
    setState(GameState.OBJECTS_PLACED);
}

// Utility functions
function updatePlayerCount() {
    if (global.sessionController) {
        var users = global.sessionController.getUsers();
        totalPlayersCount = users.length;
        print("Updated player count: " + totalPlayersCount);
        
        if (currentState == GameState.WAITING_FOR_PLAYERS && 
            totalPlayersCount >= minPlayersRequired && 
            isGameManagerActive) {
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

function updateHostWaitingMessage() {
    var hostName = getHostName();
    var message = "Waiting for " + hostName + " to start the experience...";
    
    setUIText("hostWaitingMessage", message);
    print("Host waiting message: " + message);
}

// UI helper functions
function setUIVisibility(elementName, visible) {
    if (ui[elementName]) {
        ui[elementName].enabled = visible;
    }
    print("Setting " + elementName + " visibility: " + visible);
}

function setUIText(elementName, text) {
    if (elementName == "hostWaitingMessage" && script.hostWaitingMessageText) {
        script.hostWaitingMessageText.text = text;
    } else if (elementName == "playerCountText" && script.playerCountText) {
        script.playerCountText.text = text;
    } else if (elementName == "waitingMessage" && script.waitingMessageText) {
        script.waitingMessageText.text = text;
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
    enableReadyButton(false);
    setUIVisibility("hostWaitingMessage", false);
}

function hideMenu() {
    setUIVisibility("singlePlayerButton", false);
    setUIVisibility("multiplayerButton", false);
}

function hideSurfaceTracking() {
    enableSurfaceTracking(false);
}

function hideAllGameUI() {
    hideWaitingUI();
    setUIVisibility("playerCountText", false);
    enableSurfaceTracking(false);
}

function showGameObjects(visible) {
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