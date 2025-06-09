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
        
        syncEntity.onEventReceived.add('showAncestors', function(eventData, senderInfo) {
            print("Received showGameObjects event");
            handleShowAncestors();
        });
        
        print("Event listeners added successfully!");
        
    } catch (e) {
        print("Failed to add event listeners: " + e);
    }
    
    // Make function global
    global.sendIntro = sendIntro;
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

function handleIntroStart() {
    print("Game starting for everyone!");
    global.behaviorSystem.sendCustomTrigger('startintro');
    // Set timer for next step (only host)
   if (syncEntity && syncEntity.doIOwnStore()) {
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function() {
            syncEntity.sendEvent('showAncestors');
        });
        // triggers the next section after the intro audio
        delayedEvent.reset(script.introTimer); // Replace with your audio duration
    }
}

function handleAncestors() {
   global.behaviorSystem.sendCustomTrigger('ancestorintro');
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);