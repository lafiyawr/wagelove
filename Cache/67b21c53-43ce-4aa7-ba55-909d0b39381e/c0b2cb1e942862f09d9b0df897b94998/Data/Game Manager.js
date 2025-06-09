const { SyncEntity } = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
var syncEntity = new SyncEntity(script);



// host sends messages to sync story events
function onSyncMessageReceived(message, sendUserId) {
    
switch(message.key)  {  
        
        case "startStory":
        triggerStoryStart(message.data);
        break;
        
          
    
}

} 

syncEntity.onMessageReceived.add(onSyncMessageReceived);


function triggerStoryStart() {
    
   global.behaviorSystem.sendCustomTrigger('startintro'); 
    
}


