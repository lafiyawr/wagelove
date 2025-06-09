import { LSTween } from "../../LSTween";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class UIRingRotation extends BaseScriptComponent {
  onAwake() {
    const transform = this.getTransform();

    const rotationTween = LSTween.rotateOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 45, vec3.up()),
      5000,
      RotationInterpolationType.LERP
    )
      .onEveryStart(() => {
        // Ensure it uses the current rotation for each cycle
        const currentRotation = transform.getLocalRotation();
        transform.setLocalRotation(currentRotation);
      })
      .repeat(Infinity);

    rotationTween.start();
  }
}
