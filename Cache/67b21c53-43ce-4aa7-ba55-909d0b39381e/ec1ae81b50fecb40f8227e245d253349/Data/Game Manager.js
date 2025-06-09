var syncEntity;

function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    // Debug: Check what properties syncEntity actually has
    print("syncEntity type: " + typeof syncEntity);
    print("syncEntity: " + syncEntity);
    
    if (syncEntity) {
        print("syncEntity properties: " + Object.keys(syncEntity));
        
        // Check if the message property exists with different names
        if (syncEntity.onMessageReceived) {
            print("Found onMessageReceived");
            syncEntity.onMessageReceived.add(onSyncMessageReceived);
        } else if (syncEntity.onMessage) {
            print("Found onMessage instead");
            syncEntity.onMessage.add(onSyncMessageReceived);
        } else if (syncEntity.messageReceived) {
            print("Found messageReceived instead");
            syncEntity.messageReceived.add(onSyncMessageReceived);
        } else {
            print("Could not find message event property");
            print("Available properties: " + Object.keys(syncEntity));
        }
    }
    
    // Make function global after setup
    global.sendGameStart = sendGameStart;
}

function onStart() {
    print("Creating SyncEntity...");
    syncEntity = new SyncEntity(script, null, true);
    print("SyncEntity created: " + syncEntity);
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

function handleGameStart() {
    print("Game starting for everyone!");
}

function handleShowGameObjects() {
    print("Showing game objects for everyone!");
}

var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);