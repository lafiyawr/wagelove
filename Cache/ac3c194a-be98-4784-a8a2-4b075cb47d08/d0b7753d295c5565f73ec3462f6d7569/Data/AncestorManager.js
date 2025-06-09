const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;


//@input SceneObject gameManager
//@input SceneObject[] Ancestors
var localselections = 0;
var isAncestor0Clicked = false;
var isAncestor1Clicksed = false;
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
  var onTriggerStartCallback = (event) => {
   var clickedObject = script.getSceneObject();

      
         // Direct comparison with array elements
    if (clickedObject ===  script.Ancestors[0] && !isAncestor0Clicked) {
        print("Clicked the first ancestor!");
             localselections+=1;
            isAncestor0Clicked = true;
            
        // Do something specific for ancestor 0
    } else if (clickedObject === script.Ancestors[1] && !isAncestor1Clicked) {
        print("Clicked the second ancestor!");
             localselections+=1;
             isAncestor1Clicked = true;
        // Do something specific for ancestor 1
    } else if (clickedObject === script.Ancestors[2] && !isAncestor1Clicked) {
        print("Clicked the third ancestor!");
             localselections+=1;
        // Do something specific for ancestor 2
             isAncestor2Clicked = true;
    }
           
       print("local selections: " + localselections);   
     if(localselections >=3){
            print("got to 3!");
        }   
        
  };

  interactable0.onInteractorTriggerStart(onTriggerStartCallback);
    interactable1.onInteractorTriggerStart(onTriggerStartCallback);
    interactable2.onInteractorTriggerStart(onTriggerStartCallback);
}

onAwake();