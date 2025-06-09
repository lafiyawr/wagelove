
// Declare syncEntity at script level so other functions can use it
var syncEntity;

// Based on the template pattern
function onReady() {
    print("GameManager: SyncEntity is ready!");
    
    Now set up your message handling
   syncEntity.onMessageReceived.add(onSyncMessageReceived);
    print("Message listener added");
}

function onStart() {
    // Create SyncEntity just like the template
    syncEntity = new SyncEntity(script, null, true);
    syncEntity.notifyOnReady(onReady);
}






// host sends messages to sync story events
function onSyncMessageReceived(message, sendUserId) {
    
switch(message.key)  {  
        
        case "startStory":
        triggerStoryStart(message.data);
        break;
        
          
    
}

} 

//syncEntity.onMessageReceived.add(onSyncMessageReceived);


function triggerStoryStart() {
    
   global.behaviorSystem.sendCustomTrigger('startintro'); 
    
}

// Create the start event
var onStartEvent = script.createEvent("OnStartEvent");
onStartEvent.bind(onStart);


