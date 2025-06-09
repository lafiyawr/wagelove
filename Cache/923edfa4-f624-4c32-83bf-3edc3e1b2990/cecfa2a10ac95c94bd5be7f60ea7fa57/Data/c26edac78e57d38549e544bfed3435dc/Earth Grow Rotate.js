"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.EarthScaleAndRotate = void 0;
var __selfType = requireType("./Earth Grow Rotate");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
const RotationInterpolationType_1 = require("../../RotationInterpolationType");
let EarthScaleAndRotate = class EarthScaleAndRotate extends BaseScriptComponent {
    onAwake() {
        const transform = this.getTransform();
        // Start scaled down
        transform.setWorldScale(vec3.zero());
        // Scale up from 0 → 1 over 13 sec, after 9 sec delay
        const scaleTween = LSTween_1.LSTween.scaleToWorld(transform, vec3.one(), 13000)
            .easing(Easing_1.default.Quadratic.InOut)
            .delay(9000)
            .onComplete(() => {
            // Start continuous rotation after scaling finishes
            this.startRotationLoop(transform);
        });
        scaleTween.start();
    }
    startRotationLoop(transform) {
        const rotationStep = quat.angleAxis(MathUtils.DegToRad * 45, vec3.up());
        const rotateOnce = () => {
            LSTween_1.LSTween.rotateOffset(transform, rotationStep, 5000, RotationInterpolationType_1.RotationInterpolationType.LERP)
                .onComplete(() => {
                rotateOnce(); // Recursively trigger next rotation
            })
                .start();
        };
        rotateOnce();
    }
};
exports.EarthScaleAndRotate = EarthScaleAndRotate;
exports.EarthScaleAndRotate = EarthScaleAndRotate = __decorate([
    component
], EarthScaleAndRotate);
//# sourceMappingURL=Earth%20Grow%20Rotate.js.map