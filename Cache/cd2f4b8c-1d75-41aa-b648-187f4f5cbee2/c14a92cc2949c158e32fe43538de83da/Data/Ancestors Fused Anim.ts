import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class Ancestors extends BaseScriptComponent {
  @input ancestorFused: SceneObject;

  onAwake() {
    const a1 = this.ancestorFused.getTransform();

    const targetScale = new vec3(80, 80, 80);

    // Start at scale 0
    a1.setLocalScale(vec3.zero());


    // Staggered scale tweens
    const tween1 = LSTween.scaleToLocal(a1, targetScale, 1000)
      .easing(Easing.Circular.InOut)
      .delay(0);

    tween1.start();

  }
}