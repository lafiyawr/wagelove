import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";
import { RotationInterpolationType } from "../../RotationInterpolationType";

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
      .easing(Easing.Circular.InOut)
      .delay(0);

    const scaleFF2 = LSTween.scaleToLocal(ff2Transform, vec3.one(), 1000)
      .easing(Easing.Circular.InOut)
      .delay(2000);

    const scaleFF3 = LSTween.scaleToLocal(ff3Transform, vec3.one(), 1000)
      .easing(Easing.Circular.InOut)
      .delay(4000);

    scaleFF1.start();
    scaleFF2.start();
    scaleFF3.start();

        // Start infinite glow scale loop for each glow object
    this.startGlowPulse(this.glow1.getTransform());
    this.startGlowPulse(this.glow2.getTransform());
    this.startGlowPulse(this.glow3.getTransform());

LSTween.alphaFromTo(material, 0.0, 0.5, 1000.0).start();
  }

  private startGlowPulse(transform: Transform) {
    const minScale = new vec3(0.1, 0.1, 0.1);
    const maxScale = new vec3(1.3, 1.3, 1.3);
    const duration = 2000;

    const scaleUp = LSTween.scaleFromToLocal(transform, minScale, maxScale, duration)
      .easing(Easing.Circular.InOut);

    const scaleDown = LSTween.scaleFromToLocal(transform, maxScale, minScale, duration)
      .easing(Easing.Circular.InOut);

    scaleUp.chain(scaleDown).onComplete(() => {
      this.startGlowPulse(transform); // Loop
    }).start();
  }