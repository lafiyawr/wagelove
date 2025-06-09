const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;


//@input SceneObject[] Ancestors
//@input SceneObject[] leftWristFlowers
//@input SceneObject[] rightWristFlowers
var localselections = 0;
var isAncestor0Clicked = false;
var isAncestor1Clicked = false;
var isAncestor2Clicked = false;


function onAwake() {
  // Wait for other components to initialize by deferring to OnStartEvent.
  script.createEvent('OnStartEvent').bind(() => {
    onStart();
  });
}

function onStart() {

  // You could also retrieve the Interactable component like this:
  interactable0 = interactionManager.getInteractableBySceneObject(
    script.Ancestors[0]
  );
    
      interactable1 = interactionManager.getInteractableBySceneObject(
    script.Ancestors[1]
  );
      interactable2 = interactionManager.getInteractableBySceneObject(
    script.Ancestors[2]
  );

  // Define the desired callback logic for the relevant Interactable event.
  var onTriggerStartCallback0 = (event) => {
 
    if (isAncestor0Clicked == false ) {
        print("Clicked the first ancestor!");
             localselections+=1;
               script.leftWristFlowers[0].enabled = true;
            script.rightWristFlowers[0].enabled =true;
            isAncestor0Clicked = true;
  
       print("local selections: " + localselections);   
     checkIfAllSelected();
            
     }
        
  };
    
    var onTriggerStartCallback1 = (event) => {
 
    if (isAncestor1Clicked == false ) {
        print("Clicked the first ancestor!");
             localselections+=1;
               script.leftWristFlowers[1].enabled = true;
            script.rightWristFlowers[1].enabled =true;
            isAncestor1Clicked = true;
     
       print("local selections: " + localselections);   
     checkIfAllSelected();
            
     }
        
  };
    
        var onTriggerStartCallback2 = (event) => {
 
    if (isAncestor2Clicked == false ) {
        print("Clicked the first ancestor!");
             localselections+=1;
            script.leftWristFlowers[2].enabled = true;
            script.rightWristFlowers[2].enabled =true;
            isAncestor2Clicked = true;
     
       print("local selections: " + localselections);   
    checkIfAllSelected();
            
     }
        
  };

  interactable0.onInteractorTriggerStart(onTriggerStartCallback0);
    interactable1.onInteractorTriggerStart(onTriggerStartCallback1);
    interactable2.onInteractorTriggerStart(onTriggerStartCallback2);
}


function checkIfAllSelected() {
    if (localselections >= 3) {
        print("Player completed all selections! Sending sync message...");
        sendPlayerCompletedMessage();
    }
}

function sendPlayerCompletedMessage() {
    // Call the global function directly
    if (global.onPlayerCompleted) {
        global.onPlayerCompleted();
    } else {
        print("Could not find game manager sync function");
    }
}



onAwake();