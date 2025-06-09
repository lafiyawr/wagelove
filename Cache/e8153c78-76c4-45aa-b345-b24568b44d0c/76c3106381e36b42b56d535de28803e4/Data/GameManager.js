//@input SceneObject[] uiElements
//@input Asset.AudioTrackAsset[] voTracks
//@input Asset.AudioTrackAsset bkndTrack
//@input Asset.AudioTrackAsset[] musicTracks
//@input Component.AudioComponent voComponent
//@input Component.AudioComponent bkndComponent
//@input Component.AudioComponent musicComponent
//@input SceneObject readyButton
//@input SceneObject visualsForPlayer2  // Only this gets enabled for Player 2
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

// Add ready button setup with touch handler
function setupReadyButton() {
    if (script.readyButton) {
        var touchComponent = script.readyButton.getComponent("Component.TouchComponent");
        if (touchComponent) {
            touchComponent.onTouchStart.add(function() {
                if (isHost()) {
                    print("Host pressed ready button - starting game");
                    beginGame();
                } else {
                    print("Non-host tried to press ready button - ignoring");
                }
            });
            print("Ready button touch handler set up");
        } else {
            print("Warning: Ready button needs TouchComponent");
        }
    }
}

// Call this in init()
function init() {
    print("GameManager: Initializing...");
    
    setupSyncEntity();
    setupUI();
    setupGlobalFunctions();
    setupReadyButton();  // Add this line
    
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
        
        // Test connectivity by sending a test event if we're host
        if (syncEntity.doIOwnStore()) {
            var delayedTest = script.createEvent("DelayedCallbackEvent");
            delayedTest.bind(function() {
                print("Host sending test connectivity event");
                syncEntity.sendEvent('testConnectivity', {test: true});
            });
            delayedTest.reset(2.0);
        }
        
        // Add test connectivity receiver
        syncEntity.onEventReceived.add('testConnectivity', function(eventData, messageInfo) {
            print("*** RECEIVED TEST CONNECTIVITY EVENT *** - Network is working!");
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
    
    // IMPORTANT: Hide ready button immediately when starting multiplayer
    enableReadyButton(false);
    print("Multiplayer started - ready button DISABLED until enough players join");
    
    setState(GameState.WAITING_FOR_PLAYERS);
}

function showWaitingForPlayers() {
    print("Showing waiting for players UI");
    
    // FIRST: Always disable ready button when entering this state
    enableReadyButton(false);
    print("Entered waiting for players - ready button DISABLED");
    
    if (syncEntity && isHost() !== undefined) {
        checkHostStatusAndShowUI();
    } else {
        print("SyncEntity not ready - will check host status when ready");
        
        setUIVisibility("waitingMessage", false);
        enableReadyButton(false);  // Extra safety
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        updateHostWaitingMessage();
        updatePlayerCountDisplay();
    }
}

function checkHostStatusAndShowUI() {
    print("Checking host status - isHost: " + isHost());
    print("Current player count: " + totalPlayersCount);
    print("Min players required: " + minPlayersRequired);
    
    if (isHost()) {
        print("HOST (Player 1): Setting up host UI");
        setUIVisibility("waitingMessage", true);
        setUIVisibility("playerCountText", true);
        setUIVisibility("hostWaitingMessage", false);
        
        // ALWAYS hide ready button initially for host
        enableReadyButton(false);
        
        // Hide visuals for player 2 initially for host
        if (script.visualsForPlayer2) {
            script.visualsForPlayer2.enabled = false;
            print("Visuals for Player 2 disabled for host initially");
        }
        
        // Check if we have enough players to show ready button
        if (totalPlayersCount >= minPlayersRequired) {
            print("HOST: Enough players (" + totalPlayersCount + ") - showing ready button");
            setUIText("waitingMessage", "Ready to start!");
            setState(GameState.READY_TO_START);
        } else {
            print("HOST: Not enough players (" + totalPlayersCount + "/" + minPlayersRequired + ") - hiding ready button");
            setUIText("waitingMessage", "Waiting for players to join... (" + totalPlayersCount + "/" + minPlayersRequired + ")");
        }
        
    } else {
        print("NON-HOST (Player 2+): Setting up non-host UI");
        setUIVisibility("waitingMessage", false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        
        // ALWAYS hide ready button for non-host
        enableReadyButton(false);
        print("NON-HOST: Ready button DISABLED");
        
        // Show visuals for player 2 immediately
        if (script.visualsForPlayer2) {
            script.visualsForPlayer2.enabled = true;
            print("NON-HOST: Enabled visuals for Player 2 component");
        }
        
        updateHostWaitingMessage();
    }
    
    updatePlayerCountDisplay();
}

function showReadyToStart() {
    print("Ready to start - host can begin game");
    
    if (isHost()) {
        print("HOST: NOW showing ready button to start the game");
        print("HOST: Player count is " + totalPlayersCount + "/" + minPlayersRequired);
        
        // NOW show the ready button since we have enough players
        enableReadyButton(true);
        setUIVisibility("waitingMessage", true);
        setUIVisibility("hostWaitingMessage", false);
        setUIText("waitingMessage", "Ready to start! Press the button to begin.");
        
        // Show visuals for host too now that we're ready
        if (script.visualsForPlayer2) {
            script.visualsForPlayer2.enabled = true;
            print("HOST: Enabled visuals for Player 2 component");
        }
        
        print("HOST: Ready button is now VISIBLE and ENABLED");
        
    } else {
        print("NON-HOST: Continue showing waiting message, NO ready button");
        
        // NEVER show ready button for non-host
        enableReadyButton(false);
        setUIVisibility("waitingMessage", false);
        setUIVisibility("hostWaitingMessage", true);
        
        // Keep showing host waiting message and visuals
        if (script.visualsForPlayer2) {
            script.visualsForPlayer2.enabled = true;
        }
        
        updateHostWaitingMessage();
        print("NON-HOST: Ready button stays HIDDEN");
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
        print("Min players required: " + minPlayersRequired);
        print("Current state: " + currentState);
        print("Is host: " + isHost());
        
        // Check if we now have enough players and are in the right state
        if (currentState == GameState.WAITING_FOR_PLAYERS && 
            totalPlayersCount >= minPlayersRequired && 
            isHost()) {
            print("TRANSITION: Enough players joined (" + totalPlayersCount + ">=" + minPlayersRequired + ") - moving to ready to start");
            setState(GameState.READY_TO_START);
        } else if (currentState == GameState.WAITING_FOR_PLAYERS && totalPlayersCount < minPlayersRequired) {
            print("STAYING: Not enough players yet (" + totalPlayersCount + "<" + minPlayersRequired + ") - keeping ready button disabled");
            enableReadyButton(false);
        } else if (!isHost()) {
            print("NON-HOST: Always keeping ready button disabled regardless of player count");
            enableReadyButton(false);
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
    
    if (currentState == GameState.WAITING_FOR_PLAYERS || currentState == GameState.READY_TO_START) {
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

function hideAllGameUI() {
    hideWaitingUI();
    setUIVisibility("playerCountText", false);
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

function delay(seconds, callback) {
    var timer = 0;
    var updateEvent = script.createEvent("UpdateEvent");
    updateEvent.bind(function () {
        timer += getDeltaTime();
        if (timer >= seconds) {
            updateEvent.enabled = false;
            callback();
        }
    });
}


var currentStemIndex = -1;
function playStem(index) {
    if (index < 0 || index >= script.musicTracks.length) {
        print("Invalid stem index");
        return;
    }
    
    var audioTrack =script.musicTracks[index];
    script.musicComponent.stop(true);
    script.musicComponent.loop = true;
    script.musicComponent.volume = 1.0;
    script.musicComponent.play(1);

    currentStemIndex = index;
    print("Now playing stem: " + index);
}

function playVO(index, onComplete) {
    if (index < 0 || index >= script.voTracks.length) {
        print("Invalid VO index");
        return;
    }
     var audioTrack =script.voTracks[index];
    script.voComponent.stop(true);
  
    script.voComponent.loop = false;
    script.voComponent.volume = 1.0;
    script.voComponent.play(1);

    if (onComplete) {
        //script.voAudioPlayer.onFinished.add(onComplete);
    }
}


// Initialize the game manager
function onStart() {
    init();
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);