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
//@input SceneObject breathingAni
//@input SceneObject voiceManager
//@input SceneObject giftManager
//@input SceneObject earthManager
//@input SceneObject touchtheEarth
//@input SceneObject fireFlies





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

// Audio track number
var currentStemIndex = -1;
var currentVOIndex = -1;
var ancestorSelectionStarted = false;
var ancestorsRiseTriggered = false;
var ancestorsRiseTimeout = null;

// UI references
var ui = {
    waitingMessage: null,
    readyButton: null,
    playerCountText: null,
    hostWaitingMessage: null,
    singlePlayerButton: null,
    multiplayerButton: null
};

// Ready button setup with touch handler
function setupReadyButton() {
    if (script.readyButton) {
        var touchComponent = script.readyButton.getComponent("Component.TouchComponent");
        if (touchComponent) {
            touchComponent.onTouchStart.add(function() {
                var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
                
                if (isSinglePlayerMode || isHost()) {
                    print("Starting game...");
                    beginGame();
                }
            });
        }
    }
}

// Initialize
function init() {
    print("GameManager: Initializing...");
    
    setupSyncEntity();
    setupUI();
    setupGlobalFunctions();
    setupReadyButton();
    
    isGameManagerActive = false;
    currentState = GameState.MENU;
}

// Setup sync entity and event listeners
function setupSyncEntity() {
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onSyncReady);
}

function onSyncReady() {
    print("GameManager: SyncEntity ready!");
    
    try {
        syncEntity.onEventReceived.add('startIntro', onReceiveStartIntro);
        syncEntity.onEventReceived.add('showFireflies', onReceiveShowFireflies);
        syncEntity.onEventReceived.add('ancestorsRisemsg', onReceiveAncestorsRise);
        syncEntity.onEventReceived.add('playerCompletedSelections', onReceivePlayerCompleted);
        syncEntity.onEventReceived.add('readytofusemsg', onReceiveReadyToFuse);
        syncEntity.onEventReceived.add('playerHealedEarth', onReceivePlayerHealed);
        syncEntity.onEventReceived.add('ancestorFusion', onReceiveAncestorFusion);
        
        // Test connectivity for host
        if (syncEntity.doIOwnStore()) {
            var delayedTest = script.createEvent("DelayedCallbackEvent");
            delayedTest.bind(function() {
                syncEntity.sendEvent('testConnectivity', {test: true});
            });
            delayedTest.reset(2.0);
        }
        
        syncEntity.onEventReceived.add('testConnectivity', function() {
            print("Network connectivity confirmed!");
        });
        
    } catch (e) {
        print("Failed to add event listeners: " + e);
    }
    
    updatePlayerCount();
    setupPlayerCountMonitoring();
    
    // Check for stored user choice
    if (global.userChoice) {
        if (global.userChoice === "singlePlayer") {
            startSinglePlayer();
        }
        global.userChoice = null;
    }
    
    if (currentState == GameState.WAITING_FOR_PLAYERS) {
        checkHostStatusAndShowUI();
    }
    
    print("GameManager ready");
}

// Setup UI references
function setupUI() {
    if (script.waitingMessageText) ui.waitingMessage = script.waitingMessageText.getSceneObject();
    if (script.hostWaitingMessageText) ui.hostWaitingMessage = script.hostWaitingMessageText.getSceneObject();
    if (script.readyButton) ui.readyButton = script.readyButton;
    if (script.playerCountText) ui.playerCountText = script.playerCountText;
    if (script.singlePlayerButton) ui.singlePlayerButton = script.singlePlayerButton;
    if (script.multiplayerButton) ui.multiplayerButton = script.multiplayerButton;
}

// Setup global functions
function setupGlobalFunctions() {
    global.gameManagerReady = true;
    global.onPlayerCompleted = sendPlayerCompleted;
    global.onPlayerHealed = sendPlayerHealed;
    global.startSinglePlayer = startSinglePlayer;
    global.startMultiplayer = startMultiplayer;
    global.beginGame = beginGame;
    global.isHost = isHost;
    global.getHostName = getHostName;
    global.sendAncestorsRise = sendAncestorsRise;
    global.sendShowFireflies = sendShowFireflies;
    global.sendReadyToFuse = sendReadyToFuse;
    global.sendStartIntro = sendStartIntro;
}

// State management
function setState(newState) {
    if (currentState == newState) return;
    
    print("State: " + currentState + " -> " + newState);
    var previousState = currentState;
    currentState = newState;
    
    onStateExit(previousState);
    onStateEnter(newState);
}

function onStateEnter(state) {
    switch(state) {
        case GameState.MENU: showMenu(); break;
        case GameState.WAITING_FOR_PLAYERS: showWaitingForPlayers(); break;
        case GameState.READY_TO_START: showReadyToStart(); break;
        case GameState.INTRO_PLAYING: playIntro(); break;
        case GameState.ANCESTOR_INTRO: playAncestorIntro(); break;
        case GameState.ANCESTOR_SELECTION: startAncestorSelection(); break;
        case GameState.READY_TO_FUSE: showReadyToFuse(); break;
        case GameState.EARTH_HEALING: startEarthHealing(); break;
        case GameState.ANCESTOR_FUSION: playAncestorFusion(); break;
        case GameState.GAME_COMPLETE: showGameComplete(); break;
    }
}

function onStateExit(state) {
    switch(state) {
        case GameState.MENU: hideMenu(); break;
        case GameState.WAITING_FOR_PLAYERS: hideWaitingUI(); break;
        case GameState.ANCESTOR_SELECTION: resetGlobalSelections(); break;
        case GameState.EARTH_HEALING: resetEarthHealing(); break;
    }
}

// Helper functions
function isHost() {
    if (!global.sessionController || totalPlayersCount <= 1) return true;
    return syncEntity && syncEntity.doIOwnStore();
}

function isSinglePlayerMode() {
    return !global.sessionController || totalPlayersCount <= 1;
}

function getHostName() {
    if (syncEntity && syncEntity.ownerInfo && syncEntity.ownerInfo.displayName) {
        return syncEntity.ownerInfo.displayName;
    }
    return "Player 1";
}

function enableReadyButton(enable) {
    if (script.readyButton) {
        script.readyButton.enabled = enable;
    }
}

// State-specific logic
function showMenu() {
    if (!isGameManagerActive) return;
    
    setUIVisibility("singlePlayerButton", true);
    setUIVisibility("multiplayerButton", true);
    hideAllGameUI();
}

function startSinglePlayer() {
    print("Starting single player mode");
    isGameManagerActive = true;
    totalPlayersCount = 1;
    
    setUIVisibility("singlePlayerButton", false);
    setUIVisibility("multiplayerButton", false);
    
    if (global.startMenuObject) {
        global.startMenuObject.enabled = false;
    }
    
    setState(GameState.READY_TO_START);
}

function startMultiplayer() {
    print("Starting multiplayer mode");
    isGameManagerActive = true;
    enableReadyButton(false);
    setState(GameState.WAITING_FOR_PLAYERS);
}

function showWaitingForPlayers() {
    enableReadyButton(false);
    
    if (syncEntity && isHost() !== undefined) {
        checkHostStatusAndShowUI();
    } else {
        setUIVisibility("waitingMessage", false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        updateHostWaitingMessage();
        updatePlayerCountDisplay();
    }
}

function checkHostStatusAndShowUI() {
    if (isHost()) {
        setUIVisibility("waitingMessage", true);
        setUIVisibility("playerCountText", true);
        setUIVisibility("hostWaitingMessage", false);
        
        if (script.visualsForPlayer2) script.visualsForPlayer2.enabled = false;
        
        if (totalPlayersCount >= minPlayersRequired) {
            setUIText("waitingMessage", "Ready to start!");
            setState(GameState.READY_TO_START);
        } else {
            setUIText("waitingMessage", "Waiting for players... (" + totalPlayersCount + "/" + minPlayersRequired + ")");
        }
    } else {
        setUIVisibility("waitingMessage", false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        enableReadyButton(false);
        
        if (script.visualsForPlayer2) script.visualsForPlayer2.enabled = true;
        updateHostWaitingMessage();
    }
    
    updatePlayerCountDisplay();
}

function showReadyToStart() {
    var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
    
    if (isSinglePlayerMode) {
        enableReadyButton(true);
        setUIVisibility("waitingMessage", true);
        setUIVisibility("hostWaitingMessage", false);
        setUIVisibility("playerCountText", false);
        setUIText("waitingMessage", "Ready to begin!");
        
        if (script.visualsForPlayer2) script.visualsForPlayer2.enabled = true;
    } else if (isHost()) {
        enableReadyButton(true);
        setUIVisibility("waitingMessage", true);
        setUIVisibility("hostWaitingMessage", false);
        setUIVisibility("playerCountText", true);
        setUIText("waitingMessage", "Ready to start! Press to begin.");
        
        if (script.visualsForPlayer2) script.visualsForPlayer2.enabled = true;
    } else {
        enableReadyButton(false);
        setUIVisibility("waitingMessage", false);
        setUIVisibility("hostWaitingMessage", true);
        setUIVisibility("playerCountText", true);
        
        if (script.visualsForPlayer2) script.visualsForPlayer2.enabled = true;
        updateHostWaitingMessage();
    }
}

function beginGame() {
    var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
    
    if (isSinglePlayerMode) {
        currentState = GameState.INTRO_PLAYING;
        playIntro();
    } else if (syncEntity && syncEntity.doIOwnStore()) {
        sendStartIntro();
    }
}

function playIntro() {
    hideAllUI();
    script.bkndComponent.play(1);
    script.bkndComponent.loop = false;

    var delayedEvent = script.createEvent("DelayedCallbackEvent");   
    delayedEvent.bind(function() {
        playVO(0);
          script.gameObjects[2].enabled = true;
    });
    delayedEvent.reset(1.0);
    
    var delayedEvent2 = script.createEvent("DelayedCallbackEvent");
    delayedEvent2.bind(function() {
        sendShowFireflies();

        //play firefly animation

    delayedEvent2.reset(9.0);
}

function playAncestorIntro() {
    playVO(1);
    script.gameObjects[0].enabled = true;
   // script.breathingAni.enabled = false;
    /*
    var delayedFireflies = script.createEvent("DelayedCallbackEvent");
    delayedFireflies.bind(function() {
    
    });
    delayedFireflies.reset(10);
    */
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        script.voiceManager.enabled = true;
        script.uiElements[0].enabled = true;
    });
    delayedEvent.reset(17);
}

function startAncestorSelection() {
    if (ancestorSelectionStarted) return;
    
    print("Starting ancestor selection");
    script.voiceManager.enabled = false;
    ancestorSelectionStarted = true;
     script.uiElements[0].enabled = false;
    script.gameObjects[3].enabled = true;
    script.gameObjects[2].enabled = false;

    var delayedinstructions = script.createEvent("DelayedCallbackEvent");
    delayedinstructions.bind(function() {
        playVO(2);
    });
    delayedinstructions.reset(10);

    var delayedgifts = script.createEvent("DelayedCallbackEvent");
    delayedgifts.bind(function() {
        script.gameObjects[4].enabled = true;
        script.gameObjects[5].enabled = true;
        script.gameObjects[6].enabled = true;
        script.giftManager.enabled = true;
        script.uiElements[1].enabled = true;
    });
  
    delayedgifts.reset(16);

    resetGlobalSelections();
    updatePlayerCount();
}

function startEarthHealing() {
    script.giftManager.enabled = false;
    playVO(3);
     script.uiElements[1].enabled = false;
    var delayedinstructions = script.createEvent("DelayedCallbackEvent");
    delayedinstructions.bind(function() {
        script.earthManager.enabled = true;  
        script.touchtheEarth.enabled = true;
         script.uiElements[2].enabled = true;
    });
    delayedinstructions.reset(15);
}

function showReadyToFuse() {
    setState(GameState.EARTH_HEALING);
}

function playAncestorFusion() {
    playVO(4);
        script.uiElements[2].enabled = false;
     script.earthManager.enabled = false;  
        script.touchtheEarth.enabled = false;
    script.gameObjects[0].enabled = false;
    script.gameObjects[1].enabled = true;
    
    var delayedEvent = script.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function() {
        script.gameObjects[7].enabled = true;
        script.gameObjects[3].enabled = false;
    });
    delayedEvent.reset(14);
    
    var delayedEnding = script.createEvent("DelayedCallbackEvent");
    delayedEnding.bind(function() {
        setState(GameState.GAME_COMPLETE);
    });
    delayedEnding.reset(18);
}

function showGameComplete() {
    print("Game complete!");
    playVO(5);
    
    var delayedflowers = script.createEvent("DelayedCallbackEvent");
    delayedflowers.bind(function() {
        script.gameObjects[8].enabled = true; 
    });
    delayedflowers.reset(15);
}

// Network message senders
function sendStartIntro() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        syncEntity.sendEvent('startIntro');
    }
}

function sendShowFireflies() {
    var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
    
    if ((syncEntity && syncEntity.doIOwnStore()) || isSinglePlayerMode) {
        if (isSinglePlayerMode) {
            onReceiveShowFireflies();
        } else {
            syncEntity.sendEvent('showFireflies');
        }
    }
}

function sendAncestorsRise() {
    if (ancestorsRiseTriggered) return;
    
    ancestorsRiseTriggered = true;
    var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
    
    if (isSinglePlayerMode) {
        onReceiveAncestorsRise();
    } else if (syncEntity) {
        syncEntity.sendEvent('ancestorsRisemsg');
    }
}

function sendReadyToFuse() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        syncEntity.sendEvent('readytofusemsg');
    }
}

function sendPlayerCompleted() {
    if (isSinglePlayerMode()) {
        totalPlayersCount = 1;
        globalSelectionCount = 0;
        
        var eventData = { userId: "single_player", userName: "Player", timestamp: Date.now() };
        onReceivePlayerCompleted(eventData, null);
    } else if (syncEntity) {
        var eventData = {
            userId: global.sessionController.getLocalUserId(),
            userName: global.sessionController.getLocalUserName(),
            timestamp: Date.now()
        };
        syncEntity.sendEvent('playerCompletedSelections', eventData);
    }
}

function sendPlayerHealed() {
    if (isSinglePlayerMode()) {
        var eventData = { userId: "single_player", userName: "Player", timestamp: Date.now() };
        onReceivePlayerHealed(eventData, null);
    } else if (syncEntity) {
        var eventData = {
            userId: global.sessionController.getLocalUserId(),
            userName: global.sessionController.getLocalUserName(),
            timestamp: Date.now()
        };
        syncEntity.sendEvent('playerHealedEarth', eventData);
    }
}

function sendAncestorFusion() {
    var isSinglePlayerMode = !global.sessionController || totalPlayersCount <= 1;
    
    if (isSinglePlayerMode) {
        onReceiveAncestorFusion();
    } else if (syncEntity && syncEntity.doIOwnStore()) {
        syncEntity.sendEvent('ancestorFusion');
    }
}

// Network message receivers
function onReceiveStartIntro(eventData, messageInfo) {
    currentState = GameState.INTRO_PLAYING;
    playIntro();
}

function onReceiveShowFireflies(eventData, messageInfo) {
    currentState = GameState.ANCESTOR_INTRO;
    playAncestorIntro();
}

function onReceiveAncestorsRise(eventData, messageInfo) {
    currentState = GameState.ANCESTOR_SELECTION;
    startAncestorSelection();
}

function onReceivePlayerCompleted(eventData, messageInfo) {
    if (isSinglePlayerMode()) {
        totalPlayersCount = 1;
    }
    
    globalSelectionCount += 1;
    var playerName = (eventData && eventData.userName) ? eventData.userName : "Unknown Player";
    print("Player completed: " + playerName + " (" + globalSelectionCount + "/" + totalPlayersCount + ")");
    
    if (globalSelectionCount >= totalPlayersCount) {
        if (isSinglePlayerMode()) {
            var nextEventData = { userId: "single_player", userName: "Player", timestamp: Date.now() };
            onReceiveReadyToFuse(nextEventData, null);
        } else {
            var delayedEvent = script.createEvent("DelayedCallbackEvent");
            delayedEvent.bind(function() {
                sendReadyToFuse();
            });
            delayedEvent.reset(0.5);
        }
    }
}

function onReceiveReadyToFuse(eventData, messageInfo) {
    currentState = GameState.EARTH_HEALING;
    startEarthHealing();
}

function onReceivePlayerHealed(eventData, messageInfo) {
    if (isSinglePlayerMode()) {
        totalPlayersCount = 1;
    }
    
    globalEarthHealedCount += 1;
    var playerName = (eventData && eventData.userName) ? eventData.userName : "Unknown Player";
    print("Player healed earth: " + playerName + " (" + globalEarthHealedCount + "/" + totalPlayersCount + ")");
    
    if (globalEarthHealedCount >= totalPlayersCount) {
        if ((syncEntity && syncEntity.doIOwnStore()) || isSinglePlayerMode()) {
            currentState = GameState.ANCESTOR_FUSION;
            sendAncestorFusion();
        }
    }
}

function onReceiveAncestorFusion(eventData, messageInfo) {
    currentState = GameState.ANCESTOR_FUSION;
    playAncestorFusion();
}

// Utility functions
function updatePlayerCount() {
    if (global.sessionController) {
        totalPlayersCount = global.sessionController.getUsers().length;
    } else {
        totalPlayersCount = 1;
    }
    
    if (currentState == GameState.WAITING_FOR_PLAYERS && 
        totalPlayersCount >= minPlayersRequired && 
        isHost()) {
        setState(GameState.READY_TO_START);
    } else if (currentState == GameState.WAITING_FOR_PLAYERS && totalPlayersCount < minPlayersRequired) {
        enableReadyButton(false);
    } else if (!isHost() && totalPlayersCount > 1) {
        enableReadyButton(false);
    }
    
    updatePlayerCountDisplay();
}

function setupPlayerCountMonitoring() {
    var updateEvent = script.createEvent("UpdateEvent");
    var lastPlayerCount = 0;
    
    updateEvent.bind(function() {
        if (global.sessionController) {
            var currentCount = global.sessionController.getUsers().length;
            if (currentCount != lastPlayerCount) {
                lastPlayerCount = currentCount;
                updatePlayerCount();
            }
        }
    });
}

function updateHostWaitingMessage() {
    var hostName = getHostName();
    var message = "Waiting for " + hostName + " to start...";
    setUIText("hostWaitingMessage", message);
}

// UI helper functions
function setUIVisibility(elementName, visible) {
    if (ui[elementName]) {
        ui[elementName].enabled = visible;
    }
}

function setUIText(elementName, text) {
    if (elementName == "hostWaitingMessage" && script.hostWaitingMessageText) {
        script.hostWaitingMessageText.text = text;
    } else if (elementName == "playerCountText" && script.playerCountText) {
        script.playerCountText.text = text;
    } else if (elementName == "waitingMessage" && script.waitingMessageText) {
        script.waitingMessageText.text = text;
    }
}

function updatePlayerCountDisplay() {
    var message = "Players: " + totalPlayersCount;
    
    if (currentState == GameState.WAITING_FOR_PLAYERS || currentState == GameState.READY_TO_START) {
        if (isHost()) {
            message += "/" + minPlayersRequired + " (Hosting)";
        } else {
            message += "/" + minPlayersRequired + " (Joined)";
        }
    }
    
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

function hideAllUI() {
    hideWaitingUI();
}

// Reset functions
function resetGlobalSelections() {
    globalSelectionCount = 0;
    ancestorSelectionStarted = false;
}

function resetEarthHealing() {
    globalEarthHealedCount = 0;
}

// Audio functions
function playStem(index) {
    if (index < 0 || index >= script.musicTracks.length) return;
    
    var audioTrack = script.musicTracks[index];
    script.musicComponent.stop(true);
    script.musicComponent.audioTrack = audioTrack;
    script.musicComponent.loop = true;
    script.musicComponent.volume = 1.0;
    script.musicComponent.play(1);
}

function playVO(index, onComplete) {
    if (index < 0 || index >= script.voTracks.length) return;
    
    var audioTrack = script.voTracks[index];
    script.voComponent.stop(true);
    script.voComponent.audioTrack = audioTrack;
    script.voComponent.loop = false;
    script.voComponent.volume = 1.0;
    script.voComponent.play(1);
}

// Initialize
function onStart() {
    init();
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);