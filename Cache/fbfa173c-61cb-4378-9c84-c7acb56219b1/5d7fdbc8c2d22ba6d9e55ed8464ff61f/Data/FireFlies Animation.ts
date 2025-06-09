import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";
import { RotationInterpolationType } from "../../RotationInterpolationType";

@component
export class FireflyController extends BaseScriptComponent {
  @input ff1: SceneObject;
  @input ff2: SceneObject;
  @input ff3: SceneObject;

  onAwake() {
    const ff1Transform = this.ff1.getTransform();
    const ff2Transform = this.ff2.getTransform();
    const ff3Transform = this.ff3.getTransform();

    // Start all fireflies at scale 0
    ff1Transform.setLocalScale(vec3.zero());
    ff2Transform.setLocalScale(vec3.zero());
    ff3Transform.setLocalScale(vec3.zero());

    // Scale-in tweens (staggered)
    const scaleFF1 = LSTween.scaleToLocal(ff1Transform, vec3.one(), 1000)
      .easing(Easing.Circular.InOut)
      .delay(0);

    const scaleFF2 = LSTween.scaleToLocal(ff2Transform, vec3.one(), 1000)
      .easing(Easing.Circular.InOut)
      .delay(2000);

    const scaleFF3 = LSTween.scaleToLocal(ff3Transform, vec3.one(), 1000)
      .easing(Easing.Circular.InOut)
      .delay(4000);

    // Start all scale tweens
    scaleFF1.start();
    scaleFF2.start();
    scaleFF3.start();

    // Looping orbital rotation (each firefly slowly rotates around Y-axis)
    const rotateFF1 = LSTween.rotateOffset(
      ff1Transform,
      quat.angleAxis(MathUtils.DegToRad * 360, vec3.up()),
      20000
    ).repeat(Infinity);

    const rotateFF2 = LSTween.rotateOffset(
      ff2Transform,
      quat.angleAxis(MathUtils.DegToRad * 360, vec3.up()),
      25000
    ).repeat(Infinity);

    const rotateFF3 = LSTween.rotateOffset(
      ff3Transform,
      quat.angleAxis(MathUtils.DegToRad * 360, vec3.up()),
      30000
    ).repeat(Infinity);

    rotateFF1.start();
    rotateFF2.start();
    rotateFF3.start();
  }
}
