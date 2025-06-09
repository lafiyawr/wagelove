"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FireflyController = void 0;
var __selfType = requireType("./FireFlies Animation");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let FireflyController = class FireflyController extends BaseScriptComponent {
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
        const scaleFF1 = LSTween_1.LSTween.scaleToLocal(ff1Transform, vec3.one(), 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(0);
        const scaleFF2 = LSTween_1.LSTween.scaleToLocal(ff2Transform, vec3.one(), 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(2000);
        const scaleFF3 = LSTween_1.LSTween.scaleToLocal(ff3Transform, vec3.one(), 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(4000);
        scaleFF1.start();
        scaleFF2.start();
        scaleFF3.start();
        // Glow fade animation (0.2 → 1.0 → 0.2)
        //const alphaTween = LSTween.alphaFromTo(material, 0.2, 1.0, 20000)
        //  .easing(Easing.Circular.InOut)
        //  .yoyo(true)
        //  .repeat(Infinity);
        //alphaTween.start();
    }
};
exports.FireflyController = FireflyController;
exports.FireflyController = FireflyController = __decorate([
    component
], FireflyController);
//# sourceMappingURL=FireFlies%20Animation.js.map