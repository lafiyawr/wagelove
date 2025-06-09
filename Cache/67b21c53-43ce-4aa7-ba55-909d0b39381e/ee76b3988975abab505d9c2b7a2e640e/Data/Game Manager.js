const syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    try {
        // Try using onAnyEventReceived from messaging
        syncEntity.messaging.onAnyEventReceived.add(function(eventName, eventData, senderInfo) {
            print("Received any event: " + eventName);
            handleSyncEvent(eventName, eventData, senderInfo);
        });
        print("Successfully added onAnyEventReceived listener!");
        
    } catch (e) {
        print("onAnyEventReceived failed: " + e);
        
        try {
            // Try onRemoteEventReceived
            syncEntity.messaging.onRemoteEventReceived.add(function(eventName, eventData, senderInfo) {
                print("Received remote event: " + eventName);
                handleSyncEvent(eventName, eventData, senderInfo);
            });
            print("Successfully added onRemoteEventReceived listener!");
            
        } catch (e2) {
            print("onRemoteEventReceived failed: " + e2);
        }
    }
    
    // Make function global
    global.sendGameStart = sendGameStart;
    global.gameManagerReady = true;
}

function handleSyncEvent(eventName, eventData, senderInfo) {
    print("Handling event: " + eventName);
    switch(eventName) {
        case "startGame":
            handleGameStart();
            break;
        case "showGameObjects":
            handleShowGameObjects();
            break;
    }
}

function onStart() {
    print("Creating SyncEntity...");
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onReady);
}

function sendGameStart() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending game start event");
        
        // Use the messaging system to send events
        try {
            syncEntity.messaging.sendEvent("startGame", { timestamp: getTime() });
            print("Event sent successfully via messaging");
        } catch (e) {
            print("Failed to send event: " + e);
            
            // Try the original sendEvent method
            try {
                syncEntity.sendEvent("startGame", { timestamp: getTime() });
                print("Event sent via syncEntity.sendEvent");
            } catch (e2) {
                print("Both send methods failed: " + e2);
            }
        }
    } else {
        print("Cannot send event - syncEntity not ready or not owner");
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