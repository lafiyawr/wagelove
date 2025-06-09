const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

//@input SceneObject buttonObj
//@input string statemessagename
//@input Component interactableComponent {"label": "Interactable Component"}
//@input SceneObject gameManager


function onAwake() {
  // Wait for other components to initialize by deferring to OnStartEvent.
  script.createEvent('OnStartEvent').bind(() => {
    onStart();
  });
}

function onStart() {

  // You could also retrieve the Interactable component like this:
  interactable = interactionManager.getInteractableBySceneObject(
    script.buttonObj
  );

  // Define the desired callback logic for the relevant Interactable event.
  var onTriggerStartCallback = (event) => {
   
       sendGameStart();
        
  };

  interactable.onInteractorTriggerStart(onTriggerStartCallback);
}

onAwake();