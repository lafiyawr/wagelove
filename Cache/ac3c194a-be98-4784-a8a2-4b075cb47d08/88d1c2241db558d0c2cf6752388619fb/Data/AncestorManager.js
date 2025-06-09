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
  var onTriggerStartCallback0 = (event) => {
 
    if (isAncestor0Clicked == false ) {
        print("Clicked the first ancestor!");
             localselections+=1;
            isAncestor0Clicked = true;
     
       print("local selections: " + localselections);   
     if(localselections >=3){
            print("got to 3!");
        }
            
     }
        
  };

  interactable0.onInteractorTriggerStart(onTriggerStartCallback0);
  //  interactable1.onInteractorTriggerStart(onTriggerStartCallback);
  //  interactable2.onInteractorTriggerStart(onTriggerStartCallback);
}

onAwake();