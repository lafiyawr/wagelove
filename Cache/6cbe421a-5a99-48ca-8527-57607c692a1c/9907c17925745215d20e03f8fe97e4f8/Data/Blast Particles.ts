import { LSTween } from "../../LSTween";
import Easing from "../../TweenJS/Easing";

@component
export class TrailBlastTween extends BaseScriptComponent {
  @input meshVisual: MaterialMeshVisual;
  @input propertyName: string = "Tweak_N26"; // Your shader property name

  onAwake() {
    if (!this.meshVisual || !this.meshVisual.mainMaterial) {
      print("Error: Missing mesh visual or material");
      return;
    }

    const mat = this.meshVisual.mainMaterial;

    LSTween.value(0.0, 1.0, 5000) // 5000 ms = 5 sec
      .easing(Easing.Quadratic.Out)
      .onUpdate((value: number) => {
        mat.setFloat(this.propertyName, value);
      })
      .start();
  }
}
