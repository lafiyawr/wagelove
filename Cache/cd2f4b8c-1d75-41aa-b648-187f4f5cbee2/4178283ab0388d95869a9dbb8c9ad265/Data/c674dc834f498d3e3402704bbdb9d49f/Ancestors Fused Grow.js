"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Ancestors = void 0;
var __selfType = requireType("./Ancestors Fused Grow");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let Ancestors = class Ancestors extends BaseScriptComponent {
    onAwake() {
        const a1 = this.ancestorFused.getTransform();
        const targetScale = new vec3(70, 70, 70);
        // Start at scale 0
        a1.setLocalScale(vec3.zero());
        // Staggered scale tweens
        const tween1 = LSTween_1.LSTween.scaleToLocal(a1, targetScale, 5000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(0);
        tween1.start();
    }
};
exports.Ancestors = Ancestors;
exports.Ancestors = Ancestors = __decorate([
    component
], Ancestors);
//# sourceMappingURL=Ancestors%20Fused%20Grow.js.map