"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ScaleDownToZero = void 0;
var __selfType = requireType("./UI-Ring Shrink");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let ScaleDownToZero = class ScaleDownToZero extends BaseScriptComponent {
    onAwake() {
        if (!this.targetObject) {
            print("Error: No targetObject assigned.");
            return;
        }
        const transform = this.targetObject.getTransform();
        const scaleDown = LSTween_1.LSTween.scaleToLocal(transform, vec3.zero(), 2000)
            .easing(Easing_1.default.Cubic.InOut);
        scaleDown.start();
    }
};
exports.ScaleDownToZero = ScaleDownToZero;
exports.ScaleDownToZero = ScaleDownToZero = __decorate([
    component
], ScaleDownToZero);
//# sourceMappingURL=UI-Ring%20Shrink.js.map