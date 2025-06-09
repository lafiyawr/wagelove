var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Use onEventReceived instead of onMessageReceived
    syncEntity.onEventReceived.add(onSyncEventReceived);
    print("Event listener added successfully");
    
    // Make function global
    global.sendGameStart = sendGameStart;
}

function onStart() {
    print("Creating SyncEntity...");
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onReady);
}

function sendGameStart() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending game start event");
        // Use sendEvent instead of sendMessage
        syncEntity.sendEvent("startGame", { timestamp: getTime() });
    } else {
        print("Cannot send event - syncEntity not ready or not owner");
    }
}

// Changed function name to match the event
function onSyncEventReceived(eventName, eventData, senderInfo) {
    print("Received event: " + eventName);
    switch(eventName) {
        case "startGame":
            handleGameStart();
            break;
        case "showGameObjects":
            handleShowGameObjects();
            break;
    }
}

function handleGameStart() {
    print("Game starting for everyone!");
    
    // Set timer for next step (only host)
    if (syncEntity && syncEntity.doIOwnStore()) {
        var delayedEvent = script.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function() {
            syncEntity.sendEvent("showGameObjects", {});
        });
        delayedEvent.reset(5.0); // Replace with your audio duration
    }
}

function handleShowGameObjects() {
    print("Showing game objects for everyone!");
    // Your game object logic here
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);