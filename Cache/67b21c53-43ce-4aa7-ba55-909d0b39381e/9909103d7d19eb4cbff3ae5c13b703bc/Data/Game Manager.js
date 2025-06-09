var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Let's inspect the EventWrapper more deeply
    print("onEventReceived properties: " + Object.keys(syncEntity.onEventReceived));
    
    // Try creating the function in different ways
    try {
        // Method 3: Arrow function
        syncEntity.onEventReceived.add((eventName, eventData, senderInfo) => {
            handleSyncEvent(eventName, eventData, senderInfo);
        });
        print("Event listener added successfully (arrow function)");
    } catch (e) {
        print("Arrow function failed: " + e);
        
        try {
            // Method 4: Bound function
            var boundHandler = handleSyncEvent.bind(this);
            syncEntity.onEventReceived.add(boundHandler);
            print("Event listener added successfully (bound function)");
        } catch (e2) {
            print("Bound function failed: " + e2);
            
            try {
                // Method 5: Check if we need to use a different event
                if (syncEntity.onRemoteEventReceived) {
                    syncEntity.onRemoteEventReceived.add(handleSyncEvent);
                    print("Using onRemoteEventReceived instead");
                } else {
                    print("onRemoteEventReceived not available");
                    
                    // Method 6: Maybe it's messaging instead?
                    if (syncEntity.messaging && syncEntity.messaging.onEventReceived) {
                        syncEntity.messaging.onEventReceived.add(handleSyncEvent);
                        print("Using messaging.onEventReceived");
                    } else {
                        print("messaging.onEventReceived not available");
                    }
                }
            } catch (e3) {
                print("Alternative events failed: " + e3);
            }
        }
    }
    
    // Make function global
    global.sendGameStart = sendGameStart;
    global.gameManagerReady = true;
}

// Keep the handler function simple
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