import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class UiRingFade extends BaseScriptComponent {
  @input uiRing: MaterialMeshVisual;

  onAwake() {
    const material = this.uiRing.mainMaterial;

    // Fade in from 0 to 1 over 1 second
    const fadeIn = LSTween.alphaFromTo(material, 0.0, 1.0, 1000)
      .easing(Easing.Circular.InOut);

    // Fade out from 1 to 0 after 10 second delay
    const fadeOut = LSTween.alphaFromTo(material, 1.0, 0.0, 1000)
      .easing(Easing.Circular.InOut)
      .delay(10000);

    // Chain and start
    fadeIn.chain(fadeOut).start();
  }
}
