"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FireflyController = void 0;
var __selfType = requireType("./FireFlies Grow");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let FireflyController = class FireflyController extends BaseScriptComponent {
    onAwake() {
        const ff1Transform = this.ff1.getTransform();
        const ff2Transform = this.ff2.getTransform();
        const ff3Transform = this.ff3.getTransform();
        const material = this.ffGlow.mainMaterial;
        // Start fireflies at scale 0
        ff1Transform.setLocalScale(vec3.zero());
        ff2Transform.setLocalScale(vec3.zero());
        ff3Transform.setLocalScale(vec3.zero());
        // Entry animations
        LSTween_1.LSTween.scaleToLocal(ff1Transform, vec3.one(), 1000)
            .easing(Easing_1.default.Quadratic.InOut)
            .delay(0)
            .start();
        LSTween_1.LSTween.scaleToLocal(ff2Transform, vec3.one(), 1000)
            .easing(Easing_1.default.Quadratic.InOut)
            .delay(2000)
            .start();
        LSTween_1.LSTween.scaleToLocal(ff3Transform, vec3.one(), 1000)
            .easing(Easing_1.default.Quadratic.InOut)
            .delay(4000)
            .start();
        // Optional one-time glow fade
        LSTween_1.LSTween.alphaFromTo(material, 0.0, 0.5, 1000).start();
        // Start glow scale loop (2 → 20 → 2)
        this.pingPongGlow(this.glow1.getTransform());
        this.pingPongGlow(this.glow2.getTransform());
        this.pingPongGlow(this.glow3.getTransform());
        // Start firefly hover animation (loop)
        this.pingPongHover(ff1Transform, new vec3(3, 0, 3), 4000);
        this.pingPongHover(ff2Transform, new vec3(-14, 3, 0), 4500);
        this.pingPongHover(ff3Transform, new vec3(6, 3, 1), 3000);
    }
    pingPongGlow(transform) {
        const small = new vec3(2, 2, 2);
        const large = new vec3(20, 20, 20);
        const duration = 7000;
        const scaleUp = LSTween_1.LSTween.scaleFromToLocal(transform, small, large, duration)
            .easing(Easing_1.default.Quadratic.InOut);
        const scaleDown = LSTween_1.LSTween.scaleFromToLocal(transform, large, small, duration)
            .easing(Easing_1.default.Quadratic.InOut);
        scaleUp.chain(scaleDown);
        scaleDown.chain(scaleUp);
        scaleUp.start();
    }
    pingPongHover(transform, offset, duration) {
        const start = transform.getLocalPosition();
        const end = start.add(offset);
        const moveOut = LSTween_1.LSTween.moveFromToLocal(transform, start, end, duration)
            .easing(Easing_1.default.Quadratic.InOut);
        const moveBack = LSTween_1.LSTween.moveFromToLocal(transform, end, start, duration)
            .easing(Easing_1.default.Quadratic.InOut);
        moveOut.chain(moveBack);
        moveBack.chain(moveOut);
        moveOut.start();
    }
};
exports.FireflyController = FireflyController;
exports.FireflyController = FireflyController = __decorate([
    component
], FireflyController);
//# sourceMappingURL=FireFlies%20Grow.js.map