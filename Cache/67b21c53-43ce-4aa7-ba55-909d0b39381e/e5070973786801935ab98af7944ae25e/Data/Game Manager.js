//@input int introTimer
var syncEntity;


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
        
        syncEntity.onEventReceived.add('playerCompletedSelections', function(eventData, senderInfo) {
        print("Player completed their selections: " + senderInfo.displayName);
        handlePlayerCompletedSelections(eventData, senderInfo);
    });
        
    global.onPlayerCompleted = onPlayerCompleted;
    script.api.onPlayerCompleted = onPlayerCompleted; // For script component access
    
    // Initialize player count
    updatePlayerCount();
        
        print("Event listeners added successfully!");
        
    } catch (e) {
        print("Failed to add event listeners: " + e);
    }
    
    // Make function global
    global.sendIntro = sendIntro;
    global.sendAncestorsRise = sendAncestorsRise;
    global.gameManagerReady = true;
  

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
    
    if (syncEntity) {
        var eventData = {
            playerId: syncEntity.getLocalUserId(),
            timestamp: Date.now()
        };
        
        print("Sending player completed selections event");
        syncEntity.sendEvent('playerCompletedSelections', eventData);
    }
} 
    
    function handlePlayerCompletedSelections(eventData, senderInfo) {
    globalSelectionCount += 1; // One more player completed
    
    print("Players completed: " + globalSelectionCount + "/" + totalPlayersCount);
    
    // Check if all players have completed their selections
    if (globalSelectionCount >= totalPlayersCount) {
        print("All players completed selections! Triggering next phase...");
        
        // Only the host sends the next sync message
        if (syncEntity && syncEntity.doIOwnStore()) {
            // Add a small delay to ensure all messages are processed
            var delayedEvent = script.createEvent("DelayedCallbackEvent");
            delayedEvent.bind(function() {
                sendAncestorsRise(); // Or whatever your next sync message should be
            });
            delayedEvent.reset(0.5); // Small delay
        }
    }
}

function updatePlayerCount() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        // Get current player count
        totalPlayersCount = syncEntity.getConnectedUsersCount();
        print("Updated player count: " + totalPlayersCount);
    }
}
    
    
 // Call this when starting the selection phase
function startSelectionPhase() {
    resetGlobalSelections();
    updatePlayerCount();
    print("Selection phase started - waiting for " + totalPlayersCount + " players");
}   

function handleshowFireflies() {
   global.behaviorSystem.sendCustomTrigger('ancestorintro');
}

function handlesAncestorsRise() {
   global.behaviorSystem.sendCustomTrigger('ancestorsrise');
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);