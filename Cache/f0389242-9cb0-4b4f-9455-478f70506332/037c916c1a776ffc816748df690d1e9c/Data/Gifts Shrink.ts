import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class ShrinkToZero extends BaseScriptComponent {
  onAwake() {
    const transform = this.getTransform();
    const currentScale = transform.getLocalScale();

    const shrinkTween = LSTween.scaleFromToLocal(
      transform,
      currentScale,
      vec3.zero(),
      2000
    ).easing(Easing.Circular.InOut);

    shrinkTween.start();
  }
}