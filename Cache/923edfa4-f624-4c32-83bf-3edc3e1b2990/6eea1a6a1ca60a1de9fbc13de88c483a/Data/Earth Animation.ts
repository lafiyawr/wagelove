import { LSTween } from "../../LSTween";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class EarthScaleAndRotate extends BaseScriptComponent {
  onAwake() {
    const transform = this.getTransform();

    // Start scaled down
    transform.setLocalScale(vec3.zero());

    // Scale up tween (0 → 1) over 4 sec, delayed 5 sec
    const scaleTween = LSTween.scaleToLocal(transform, vec3.one(), 4000)
      .easing("easeInOutCubic")
      .delay(5000);

    // Infinite slow Y-axis rotation (e.g., 45° every 5 sec)
    const rotationTween = LSTween.rotateOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 45, vec3.up()),
      5000,
      RotationInterpolationType.LERP
    )
      .repeat(Infinity);

    // Start scale tween
    scaleTween.start();

    // Start rotation tween right away
    rotationTween.start();
  }
}
