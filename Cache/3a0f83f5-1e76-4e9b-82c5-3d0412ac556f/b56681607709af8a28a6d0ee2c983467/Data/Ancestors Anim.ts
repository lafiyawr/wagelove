import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class Ancestors extends BaseScriptComponent {
  @input ancestors: SceneObject;


  onAwake() {
    const a = this.ancestors.getTransform();


    const targetScale = new vec3(80, 80, 80);

    // Start at scale 0
    a.setLocalScale(vec3.zero());


    // Staggered scale tweens
    const tween = LSTween.scaleToLocal(a, targetScale, 1000)
      .easing(Easing.Circular.InOut)
      .delay(0);

    tween.start();

  }
}