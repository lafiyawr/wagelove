var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Try different ways to add the callback
    try {
        // Method 1: Direct function reference
        syncEntity.onEventReceived.add(handleSyncEvent);
        print("Event listener added successfully (method 1)");
    } catch (e) {
        print("Method 1 failed: " + e);
        try {
            // Method 2: Anonymous function wrapper
            syncEntity.onEventReceived.add(function() {
                handleSyncEvent.apply(this, arguments);
            });
            print("Event listener added successfully (method 2)");
        } catch (e2) {
            print("Method 2 failed: " + e2);
            
            // Method 3: Check what type of callback it expects
            print("onEventReceived type: " + typeof syncEntity.onEventReceived);
            print("onEventReceived.add type: " + typeof syncEntity.onEventReceived.add);
        }
    }
    
    // Make function global
    global.sendGameStart = sendGameStart;
    global.gameManagerReady = true;
}

// Define the handler function separately and clearly
function handleSyncEvent(eventName, eventData, senderInfo) {
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

function handleGameStart() {
    print("Game starting for everyone!");
}

function handleShowGameObjects() {
    print("Showing game objects for everyone!");
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);