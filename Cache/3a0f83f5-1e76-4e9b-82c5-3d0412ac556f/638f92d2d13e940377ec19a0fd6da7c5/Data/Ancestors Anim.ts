import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class Ancestors extends BaseScriptComponent {
  @input ancestors: SceneObject;


  onAwake() {
    const ancestors = this.ancestor1.getTransform();

    const targetScale = new vec3(1,1,1);

    // Start at scale 0
   ancestors.setLocalScale(vec3.zero());

    // Staggered scale tweens
    const tween = LSTween.scaleToLocal(ancestors, targetScale, 1000)
      .easing(Easing.Circular.InOut)
      .delay(200);

    tween.start();
  }
}