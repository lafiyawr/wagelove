import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class FireflyController extends BaseScriptComponent {
  @input ff1: SceneObject;
  @input ff2: SceneObject;
  @input ff3: SceneObject;
  @input ffGlow: MaterialMeshVisual;

  @input glow1: SceneObject;
  @input glow2: SceneObject;
  @input glow3: SceneObject;

  onAwake() {
    const ff1Transform = this.ff1.getTransform();
    const ff2Transform = this.ff2.getTransform();
    const ff3Transform = this.ff3.getTransform();
    const material = this.ffGlow.mainMaterial;

    // Start all fireflies at scale 0
    ff1Transform.setLocalScale(vec3.zero());
    ff2Transform.setLocalScale(vec3.zero());
    ff3Transform.setLocalScale(vec3.zero());

    // Staggered scale-in animations
    const scaleFF1 = LSTween.scaleToLocal(ff1Transform, vec3.one(), 1000)
      .easing(Easing.Quadratic.InOut)
      .delay(0);

    const scaleFF2 = LSTween.scaleToLocal(ff2Transform, vec3.one(), 1000)
      .easing(Easing.Quadratic.InOut)
      .delay(2000);

    const scaleFF3 = LSTween.scaleToLocal(ff3Transform, vec3.one(), 1000)
      .easing(Easing.Quadratic.InOut)
      .delay(4000);

    scaleFF1.start();
    scaleFF2.start();
    scaleFF3.start();



    // Start infinite glow scale ping-pong
    this.startGlowPingPong(this.glow1.getTransform());
    this.startGlowPingPong(this.glow2.getTransform());
    this.startGlowPingPong(this.glow3.getTransform());
  }

  private startGlowPingPong(transform: Transform) {
    const small = new vec3(2, 2, 2);
    const large = new vec3(10, 10, 10);
    const duration = 2000;

    const scaleUp = LSTween.scaleFromToLocal(transform, small, large, duration)
      .easing(Easing.Quadratic.InOut);

    const scaleDown = LSTween.scaleFromToLocal(transform, large, small, duration)
      .easing(Easing.Quadratic.InOut);

    scaleUp.chain(scaleDown).onComplete(() => {
      this.startGlowPingPong(transform); // Loop forever
    }).start();
  }
}
