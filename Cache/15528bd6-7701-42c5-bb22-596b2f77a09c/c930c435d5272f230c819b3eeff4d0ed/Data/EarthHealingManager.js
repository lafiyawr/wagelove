const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;



var isTouchingEarth = false;





function onTrigger() {
  if (isTouchingEarth == false ) {
      
  isTouchingEarth = true;
     checkIfAllSelected();
  // Remove our onTrigger() function from the custom trigger's responses
  global.behaviorSystem.removeCustomTriggerResponse('earthtouched', onTrigger);
}
// Add our onTrigger() function as a response to the custom trigger "my_trigger"
global.behaviorSystem.addCustomTriggerResponse('earthtouched', onTrigger);





function checkIfAllSelected() {
    if (isTouchingEarth) {
        print("Player completed all selections! Sending sync message...");
        sendPlayerHealedMessage();
    }
}

function sendPlayerHealedMessage() {
    // Call the global function directly
    if (global.onPlayerHealed) {
        global.onPlayerHealed();
    } else {
        print("Could not find game manager sync function");
    }
}



onAwake();