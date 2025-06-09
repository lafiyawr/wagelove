"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UiRingScale = void 0;
var __selfType = requireType("./Gifts Grow");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let UiRingScale = class UiRingScale extends BaseScriptComponent {
    onAwake() {
        const transform = this.getTransform();
        // Start at scale 0
        transform.setLocalScale(vec3.zero());
        // Target scale
        const targetScale = new vec3(1, 1, 1);
        // Scale up to 1 over 2 seconds
        const scaleUp = LSTween_1.LSTween.scaleToLocal(transform, targetScale, 2000)
            .easing(Easing_1.default.Circular.InOut);
        // Scale back down to 0 after 10 second delay
        const scaleDown = LSTween_1.LSTween.scaleToLocal(transform, vec3.zero(), 2000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(10000);
        // Chain and start
        scaleUp.chain(scaleDown).start();
    }
};
exports.UiRingScale = UiRingScale;
exports.UiRingScale = UiRingScale = __decorate([
    component
], UiRingScale);
//# sourceMappingURL=Gifts%20Grow.js.map