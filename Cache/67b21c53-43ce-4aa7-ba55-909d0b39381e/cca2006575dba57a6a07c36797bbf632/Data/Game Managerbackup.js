//@input int introTimer
var syncEntity;

// Global selection tracking
var globalSelectionCount = 0;
var globalEarthHealedCount = 0; // Add this for earth touches
var totalPlayersCount = 0;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Add event listeners with the correct syntax: eventName, callback
    try {
        syncEntity.onEventReceived.add('startIntro', function(eventData, senderInfo) {
            print("Received startIntro event");
            handleIntroStart();
        });
        
        syncEntity.onEventReceived.add('showFireflies', function(eventData, senderInfo) {
            print("Received showGameObjects event");
            handleshowFireflies();
        });
        
        syncEntity.onEventReceived.add('ancestorsRisemsg', function(eventData, senderInfo) {
            print("Received showGameObjects event");
            handlesAncestorsRise();
        });
        
        syncEntity.onEventReceived.add('playerCompletedSelections', function(eventData, messageInfo) {
            print("Player completed their selections");
            handlePlayerCompletedSelections(eventData, messageInfo);
        });
        
        syncEntity.onEventReceived.add('readytofusemsg', function(eventData, messageInfo) {
            print("Ancestors are ready to fuse");
            handleReadyToFuse(eventData, messageInfo);
        });
        
        // Fixed: This should handle the received earth healing events
        syncEntity.onEventReceived.add('playerHealedEarth', function(eventData, messageInfo) {
            print("Player completed their Earth Healing");
            handlePlayerHealedEarth(eventData, messageInfo); // Different function name
        });
        
        global.onPlayerCompleted = onPlayerCompleted;
        script.api.onPlayerCompleted = onPlayerCompleted;
        
        global.onPlayerHealed = onPlayerHealed; // This sends the event
        script.api.onPlayerHealed = onPlayerHealed;
        
        // Initialize player count and set up periodic updates
        updatePlayerCount();
        setupPlayerCountMonitoring();
        
        print("Event listeners added successfully!");
        
    } catch (e) {
        print("Failed to add event listeners: " + e);
    }
    
    // Make function global
    global.sendIntro = sendIntro;
    global.sendAncestorsRise = sendAncestorsRise;
    global.gameManagerReady = true;
} 

function onStart() {
    print("Creating SyncEntity...");
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onReady);
}

function sendIntro() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending game start event");
        syncEntity.sendEvent('startIntro');
    } else {
        print("Cannot send event - syncEntity not ready or not owner");
    }
}

function sendAncestorsRise() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending Ancestors Rising event");
        syncEntity.sendEvent('ancestorsRisemsg');
    } else {
        print("Cannot send event - syncEntity not ready or not owner");
    }
}

function sendReadyToFuse() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending Ready to Fuse Event");
        syncEntity.sendEvent('readytofusemsg');
    } else {
        print("Cannot send event - syncEntity not ready or not owner");
    }
}

function handleIntroStart() {
    print("Game starting for everyone!");
    global.behaviorSystem.sendCustomTrigger('startintro');
    // Set timer for next step (only host)
    if (syncEntity && syncEntity.doIOwnStore()) {
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function() {
            syncEntity.sendEvent('showFireflies');
        });
        // triggers the next section after the intro audio
        delayedEvent.reset(script.introTimer); // Replace with your audio duration
    }
}

function onPlayerCompleted() {
    print("This player completed all ancestor selections!");
    print("Current totalPlayersCount: " + totalPlayersCount);
    print("Current globalSelectionCount: " + globalSelectionCount);
    
    if (syncEntity) {
        var eventData = {
            userId: global.sessionController.getLocalUserId(),
            userName: global.sessionController.getLocalUserName(),
            timestamp: Date.now()
        };
        
        print("Sending player completed selections event for: " + eventData.userName);
        syncEntity.sendEvent('playerCompletedSelections', eventData);
    }
}

// This function SENDS the earth healing event
function onPlayerHealed() {
    print("This player Touched the Earth");
    print("Current totalPlayersCount: " + totalPlayersCount);
    print("Current globalEarthHealedCount: " + globalEarthHealedCount);
    
    if (syncEntity) {
        var eventData = {
            userId: global.sessionController.getLocalUserId(),
            userName: global.sessionController.getLocalUserName(),
            timestamp: Date.now()
        };
        
        print("Sending touchedearth event for: " + eventData.userName);
        syncEntity.sendEvent('playerHealedEarth', eventData);
    }
}

function handlePlayerCompletedSelections(eventData, messageInfo) {
    globalSelectionCount += 1; // One more player completed
    
    // Get player info - messageInfo contains userId and connectionId
    var playerInfo = "";
    if (messageInfo) {
        if (messageInfo.userId) {
            playerInfo = "User: " + messageInfo.userId;
        } else if (messageInfo.connectionId) {
            playerInfo = "Connection: " + messageInfo.connectionId;
        }
    }
    
    // Also try to get the name from eventData if we included it
    var playerName = (eventData && eventData.userName) ? eventData.userName : playerInfo;
    
    print("Player completed selections: " + playerName);
    print("Players completed: " + globalSelectionCount + "/" + totalPlayersCount);
    
    // Check if all players have completed their selections
    if (globalSelectionCount >= totalPlayersCount) {
        print("All players completed selections! Triggering next phase...");
        
        // Only the host sends the next sync message
        if (syncEntity && syncEntity.doIOwnStore()) {
            // Add a small delay to ensure all messages are processed
            var delayedEvent = script.createEvent("DelayedCallbackEvent");
            delayedEvent.bind(function() {
                sendReadyToFuse(); // Or whatever your next sync message should be
            });
            delayedEvent.reset(0.5); // Small delay
        }
    }
}

// This function HANDLES the received earth healing events (similar to handlePlayerCompletedSelections)
function handlePlayerHealedEarth(eventData, messageInfo) {
    globalEarthHealedCount += 1; // One more player healed the earth
    
    // Get player info - messageInfo contains userId and connectionId
    var playerInfo = "";
    if (messageInfo) {
        if (messageInfo.userId) {
            playerInfo = "User: " + messageInfo.userId;
        } else if (messageInfo.connectionId) {
            playerInfo = "Connection: " + messageInfo.connectionId;
        }
    }
    
    // Also try to get the name from eventData if we included it
    var playerName = (eventData && eventData.userName) ? eventData.userName : playerInfo;
    
    print("Player healed earth: " + playerName);
    print("Players healed earth: " + globalEarthHealedCount + "/" + totalPlayersCount);
    
    // Check if all players have healed the earth
    if (globalEarthHealedCount >= totalPlayersCount) {
        print("All players healed the earth! Triggering ancestor fusion...");
        
        // Trigger the fusion for everyone
        global.behaviorSystem.sendCustomTrigger('ancestorfusing');
        
        // Only the host sends the next sync message if needed
        if (syncEntity && syncEntity.doIOwnStore()) {
            // Add any additional sync events here if needed
            print("Host: All players completed earth healing phase");
        }
    }
}

function updatePlayerCount() {
    if (global.sessionController) {
        // Get current player count using SessionController
        var users = global.sessionController.getUsers();
        totalPlayersCount = users.length;
        print("Updated player count: " + totalPlayersCount);
        
        // Debug: Print all connected users
        for (var i = 0; i < users.length; i++) {
            var user = users[i];
            print("User " + i + ": " + user.displayName + " (ID: " + user.userId + ", Connection: " + user.connectionId + ")");
        }
    } else {
        print("Warning: SessionController not available for player count");
    }
}

function setupPlayerCountMonitoring() {
    // Create a periodic update to check for player count changes
    var updateEvent = script.createEvent("UpdateEvent");
    var lastPlayerCount = 0;
    
    updateEvent.bind(function() {
        if (global.sessionController) {
            var currentCount = global.sessionController.getUsers().length;
            if (currentCount !== lastPlayerCount) {
                print("Player count changed from " + lastPlayerCount + " to " + currentCount);
                lastPlayerCount = currentCount;
                totalPlayersCount = currentCount;
            }
        }
    });
}

// Reset function for the selection phase
function resetGlobalSelections() {
    globalSelectionCount = 0;
    print("Global selections reset");
}

// Reset function for the earth healing phase
function resetEarthHealing() {
    globalEarthHealedCount = 0;
    print("Global earth healing count reset");
}

// Call this when starting the selection phase
function startSelectionPhase() {
    resetGlobalSelections();
    updatePlayerCount();
    print("Selection phase started - waiting for " + totalPlayersCount + " players");
}

// Call this when starting the earth healing phase
function startEarthHealingPhase() {
    resetEarthHealing();
    updatePlayerCount();
    print("Earth healing phase started - waiting for " + totalPlayersCount + " players");
}

function handleshowFireflies() {
    global.behaviorSystem.sendCustomTrigger('ancestorintro');
}

function handlesAncestorsRise() {
    global.behaviorSystem.sendCustomTrigger('ancestorsrise');
}

function handleReadyToFuse() {
    global.behaviorSystem.sendCustomTrigger('ancestorfusestart');
    print("Success! Ready to Fuse.");
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);