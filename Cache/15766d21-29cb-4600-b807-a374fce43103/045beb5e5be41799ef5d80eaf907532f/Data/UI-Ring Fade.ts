import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class UiRingScale extends BaseScriptComponent {
  @input uiRing: SceneObject;

  onAwake() {
    const transform = this.uiRing.getTransform();

    // Start at scale 0
    transform.setLocalScale(vec3.zero());

    // Scale up to 1 over 2 seconds
    const scaleUp = LSTween.scaleToLocal(transform, vec3.one(), 2000)
      .easing(Easing.Circular.InOut);

    // Scale back down to 0 after 10 sec delay
    const scaleDown = LSTween.scaleToLocal(transform, vec3.zero(), 2000)
      .easing(Easing.Circular.InOut)
      .delay(10000);

    // Chain and start
    scaleUp.chain(scaleDown).start();
  }
}
