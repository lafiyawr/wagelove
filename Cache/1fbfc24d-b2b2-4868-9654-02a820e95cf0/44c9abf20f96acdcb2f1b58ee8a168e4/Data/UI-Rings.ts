import { LSTween } from "../../LSTween";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class RotateUIRings extends BaseScriptComponent {
  onAwake() {
    const transform = this.getSceneObject().getComponent("Component.Transform");

    // Continuous Y-axis rotation: 360° every 30 seconds
    const rotateTween = LSTween.rotateOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 360, vec3.up()),
      30000, // 30 seconds
      RotationInterpolationType.LERP
    ).repeat(Infinity);

    rotateTween.start();
  }
}