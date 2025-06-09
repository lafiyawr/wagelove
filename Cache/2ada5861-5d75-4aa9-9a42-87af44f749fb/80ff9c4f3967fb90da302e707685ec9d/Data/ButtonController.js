const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;
//@input SceneObject buttonObj
//@input string triggerName
//@input Component interactableComponent {"label": "Interactable Component"}

function onAwake() {
  // Wait for other components to initialize by deferring to OnStartEvent.
  script.createEvent('OnStartEvent').bind(() => {
    onStart();
  });
}

function onStart() {
  // This script assumes that an Interactable (and Collider) component have already been instantiated on the SceneObject.

  interactable = script.interactableComponent;
  // Define the desired callback logic for the relevant Interactable event.
  var onTriggerStartCallback = (event) => {
    print(
      `The Interactable has been triggered by an Interactor with input type: ${event.interactor.inputType} at position: ${event.interactor.targetHitInfo.hit.position}`
    );
  };

  interactable.onInteractorTriggerStart(onTriggerStartCallback);
}

onAwake();