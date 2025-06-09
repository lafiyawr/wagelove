import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class plants extends BaseScriptComponent {
  @input plantsComp: SceneObject;

  onAwake() {
    const plantsComp = this.plantsComp.getTransform();

    const targetScale = new vec3(1,1,1);

    // Start at scale 0
    plantsComp.setLocalScale(vec3.zero());


    // Staggered scale tweens
    const tween1 = LSTween.scaleToLocal(plantsComp, targetScale, 1000)
      .easing(Easing.Circular.InOut)
      .delay(0);

    tween1.start();

  }
}