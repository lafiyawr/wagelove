import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class InfiniteAlphaFade extends BaseScriptComponent {
  onAwake() {
    const image = this.getComponent("Component.Image");
    if (!image) {
      print("Error: No Image component found on this object.");
      return;
    }

    this.startAlphaLoop(image, 0.2, 1.0);
  }

  private startAlphaLoop(image: Component.Image, startAlpha: number, endAlpha: number) {
    const duration = 2000;

    // Set initial alpha
    image.mainPass.baseColor.a = startAlpha;

    const fadeUp = LSTween.custom(
      (value) => {
        image.mainPass.baseColor.a = value;
      },
      startAlpha,
      endAlpha,
      duration
    )
      .easing(Easing.Cubic.InOut)
      .onComplete(() => {
        const fadeDown = LSTween.custom(
          (value) => {
            image.mainPass.baseColor.a = value;
          },
          endAlpha,
          startAlpha,
          duration
        )
          .easing(Easing.Cubic.InOut)
          .onComplete(() => {
            this.startAlphaLoop(image, startAlpha, endAlpha);
          });

        fadeDown.start();
      });

    fadeUp.start();
  }
}
