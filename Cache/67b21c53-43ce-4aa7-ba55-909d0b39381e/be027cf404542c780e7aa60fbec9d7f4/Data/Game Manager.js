var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Let's try creating a very basic function first
    var testFunction = function() {
        print("Test function called");
    };
    
    try {
        // Test with the simplest possible function
        syncEntity.onEventReceived.add(testFunction);
        print("Basic test function worked!");
        
        // Remove it and add our real handler
        syncEntity.onEventReceived.remove(testFunction);
        syncEntity.onEventReceived.add(realEventHandler);
        print("Real handler added successfully");
        
    } catch (e) {
        print("Even basic function failed: " + e);
        
        // Maybe we need to use the messaging system differently
        try {
            // Check if messaging has a different API
            if (syncEntity.messaging) {
                print("Messaging properties: " + Object.keys(syncEntity.messaging));
                
                // Try using the messaging system directly
                syncEntity.messaging.subscribe("startGame", function(data) {
                    print("Received startGame via messaging");
                    handleGameStart();
                });
                
                syncEntity.messaging.subscribe("showGameObjects", function(data) {
                    print("Received showGameObjects via messaging");
                    handleShowGameObjects();
                });
                
                print("Using messaging.subscribe instead");
            }
        } catch (e2) {
            print("Messaging approach failed: " + e2);
        }
    }
    
    // Make function global
    global.sendGameStart = sendGameStart;
    global.gameManagerReady = true;
}

// Simple event handler
function realEventHandler(eventName, eventData, senderInfo) {
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
        
        // Try both sendEvent and messaging.publish
        try {
            syncEntity.sendEvent("startGame", { timestamp: getTime() });
        } catch (e) {
            print("sendEvent failed, trying messaging: " + e);
            if (syncEntity.messaging) {
                syncEntity.messaging.publish("startGame", { timestamp: getTime() });
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