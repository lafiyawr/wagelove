import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class TrailBlastTween extends BaseScriptComponent {
  @input meshVisual: MaterialMeshVisual;
  @input propertyName: string = "Tweak_N26";

  onAwake() {
    if (!this.meshVisual || !this.meshVisual.mainMaterial) {
      print("Error: Missing mesh visual or material");
      return;
    }

    const mat = this.meshVisual.mainMaterial;

    const tweenTarget = { val: 0 };

    LSTween.to(tweenTarget, { val: 1 }, 5000)
      .easing(Easing.Quadratic.Out)
      .onUpdate(() => {
        mat.setParameter(this.propertyName, tweenTarget.val);
      })
      .start();
  }
}
