import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class UIRingRotation extends BaseScriptComponent {
  onAwake() {
    const transform = this.getTransform();

    // Scale up from 0 → 1 over 4 sec, after 5 sec delay
    const scaleTween = LSTween.scaleToLocal(transform, vec3.one(), 4000);

    // Additive rotation: rotate +45° around Y every 5 seconds
    const rotationTween = LSTween.rotateByOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 45, vec3.up()),
      5000,
      RotationInterpolationType.LERP
    ).repeat(Infinity);

    // Start scale, then rotation
    scaleTween.chain(rotationTween).start();
  }
}
