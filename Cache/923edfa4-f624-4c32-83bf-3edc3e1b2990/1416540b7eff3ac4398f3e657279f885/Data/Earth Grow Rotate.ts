
import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class EarthScaleAndRotate extends BaseScriptComponent {
  onAwake() {
    const transform = this.getTransform();

    // Start scaled down
    transform.setWorldScale(vec3.zero());


    // Scale up from 0 → 1 over 4 sec, after 5 sec delay
    const scaleTween = LSTween.scaleToWorld(transform, vec3.one(), 13000)
       .easing(Easing.Quadratic.InOut)
      .delay(9000);

    // Continuous Y-axis rotation (45° every 5 seconds)
    const rotationTween = LSTween.rotateOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 45, vec3.up()),
      5000,
      RotationInterpolationType.LERP
    ).repeat(Infinity);

    // Start scale, then rotation
    //scaleTween.chain(rotationTween).start();
    scaleTween.start();
  }
}