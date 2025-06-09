var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Make sure we're passing a proper function reference
    if (syncEntity.onEventReceived && typeof syncEntity.onEventReceived.add === 'function') {
        syncEntity.onEventReceived.add(function(eventName, eventData, senderInfo) {
            onSyncEventReceived(eventName, eventData, senderInfo);
        });
        print("Event listener added successfully");
    } else {
        print("onEventReceived.add is not available");
    }
    
    // Make function global AFTER the syncEntity is fully set up
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
        syncEntity.sendEvent("startGame", { timestamp: getTime() });
    } else {
        print("Cannot send event - syncEntity not ready or not owner");
    }
}

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
}

function handleShowGameObjects() {
    print("Showing game objects for everyone!");
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);