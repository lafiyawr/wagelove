"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FireflyController = void 0;
var __selfType = requireType("./FireFlies Shrink");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let FireflyController = class FireflyController extends BaseScriptComponent {
    onAwake() {
        const ff1Transform = this.ff1.getTransform();
        const ff2Transform = this.ff2.getTransform();
        const ff3Transform = this.ff3.getTransform();
        const ffTargetScale = new vec3(0, 0, 0);
        // Staggered scale-in animations
        const scaleFF1 = LSTween_1.LSTween.scaleToLocal(ff1Transform, ffTargetScale, 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(0);
        const scaleFF2 = LSTween_1.LSTween.scaleToLocal(ff2Transform, ffTargetScale, 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(500);
        const scaleFF3 = LSTween_1.LSTween.scaleToLocal(ff3Transform, ffTargetScale, 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(1000);
        scaleFF1.start();
        scaleFF2.start();
        scaleFF3.start();
    }
};
exports.FireflyController = FireflyController;
exports.FireflyController = FireflyController = __decorate([
    component
], FireflyController);
//# sourceMappingURL=FireFlies%20Shrink.js.map