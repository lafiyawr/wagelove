import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class UIRingRotation extends BaseScriptComponent {
  onAwake() {
    const transform = this.getTransform();
    let currentRotation = transform.getLocalRotation();

    // Scale up from 0 → 1 over 4 sec, after 5 sec delay
    const scaleTween = LSTween.scaleToLocal(transform, vec3.one(), 4000);

    // Define the rotation tween
    const rotationTween = LSTween.rotateOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 45, vec3.up()),
      5000,
      RotationInterpolationType.LERP
    )
      .onEveryStart(() => {
        // Update current rotation so each cycle is additive
        currentRotation = transform.getLocalRotation();
        transform.setLocalRotation(currentRotation);
      })
      .repeat(Infinity);

    // Start scale, then rotation
    scaleTween.chain(rotationTween).start();
  }
}
