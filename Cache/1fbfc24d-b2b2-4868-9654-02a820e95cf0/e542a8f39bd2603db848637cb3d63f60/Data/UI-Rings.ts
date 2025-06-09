import { LSTween } from "../../LSTween";
import { RotationInterpolationType } from "../../RotationInterpolationType";
import * as Easing from "../../TweenJS/Easing";

@component
export class RotateUIRings extends BaseScriptComponent {
  onAwake() {
    const transform = this.getSceneObject().getComponent("Component.Transform");

    // Full 360° Y-axis rotation every 30 seconds
    const rotateTween = LSTween.rotateOffset(
      transform,
      quat.angleAxis(MathUtils.DegToRad * 360, vec3.up()),
      30000, // 30 seconds
      RotationInterpolationType.LERP
    )
      .easing(Easing.Linear.None)
      .repeat(Infinity);

    rotateTween.start();
  }
}