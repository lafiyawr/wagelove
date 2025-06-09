import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class UiRingFade extends BaseScriptComponent {
  @input uiRing: MaterialMeshVisual;

  onAwake() {
    const material = this.uiRing.mainMaterial;

    // Ensure baseColor exists and includes an alpha value
    material.mainPass.baseColor = new vec4(1, 1, 1, 0.0);

    // Fade in from 0 → 1 alpha over 1 sec
    const fadeIn = LSTween.alphaFromTo(material, 0.0, 1.0, 1000)
      .easing(Easing.Circular.InOut);

    // After 10 sec, fade out back to 0 alpha
    const fadeOut = LSTween.alphaFromTo(material, 1.0, 0.0, 1000)
      .easing(Easing.Circular.InOut)
      .delay(10000);

    fadeIn.chain(fadeOut).start();
  }
}
