var syncEntity; // Declare at top

function onReady() {
    print("GameManager: SyncEntity is ready!");
    syncEntity.onMessageReceived.add(onSyncMessageReceived);
    
    // Make the function globally available
    global.sendGameStart = sendGameStart;
}

function onStart() {
    // Create SyncEntity
    syncEntity = new SyncEntity(script, null, true);
    
    // Wait for it to be ready before using it
    syncEntity.notifyOnReady(onReady);
}



// Your message handling function
function onSyncMessageReceived(message, senderUserId) {
    print("Received message: " + message.key);
    switch(message.key) {
        case "startGame":
            handleGameStart();
            break;
        case "showGameObjects":
            handleShowGameObjects();
            break;
    }
}

// Safe function to call from other scripts
function sendGameStart() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending game start message");
        syncEntity.sendMessage("startGame", { timestamp: getTime() });
    } else {
        print("Cannot send message - syncEntity not ready or not owner");
    }
}

// Export the function (modern way)
// Put this at the very end
if (typeof module !== 'undefined') {
    module.exports = { sendGameStart };
}

// Move this to the very end, after all functions are defined
var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);