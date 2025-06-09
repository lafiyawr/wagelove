"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UiRingFade = void 0;
var __selfType = requireType("./UI-Ring Fade");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let UiRingFade = class UiRingFade extends BaseScriptComponent {
    onAwake() {
        const material = this.uiRing.mainMaterial;
        // Fade in from 0 to 1 over 1 second
        const fadeIn = LSTween_1.LSTween.alphaFromTo(material, 0.0, 1.0, 1000)
            .easing(Easing_1.default.Circular.InOut);
        // Fade out from 1 to 0 after 10 second delay
        const fadeOut = LSTween_1.LSTween.alphaFromTo(material, 1.0, 0.0, 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(10000);
        // Chain and start
        fadeIn.chain(fadeOut).start();
    }
};
exports.UiRingFade = UiRingFade;
exports.UiRingFade = UiRingFade = __decorate([
    component
], UiRingFade);
//# sourceMappingURL=UI-Ring%20Fade.js.map