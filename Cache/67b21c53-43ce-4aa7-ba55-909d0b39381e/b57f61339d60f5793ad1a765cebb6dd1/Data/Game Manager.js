var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    syncEntity.onMessageReceived.add(onSyncMessageReceived);
    
    // Make the function globally available
    global.sendGameStart = sendGameStart;
}

function onStart() {
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onReady);
}

function sendGameStart() {
    if (syncEntity && syncEntity.doIOwnStore()) {
        print("Sending game start message");
        syncEntity.sendMessage("startGame", { timestamp: getTime() });
    } else {
        print("Cannot send message - syncEntity not ready or not owner");
    }
}

function onSyncMessageReceived(message, senderUserId) {
    switch(message.key) {
        case "startGame":
            handleGameStart();
            break;
        case "showGameObjects":
            handleShowGameObjects();
            break;
    }
}

// Your other functions...
function handleGameStart() {
    // Game start logic
}

function handleShowGameObjects() {
    // Show objects logic
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);