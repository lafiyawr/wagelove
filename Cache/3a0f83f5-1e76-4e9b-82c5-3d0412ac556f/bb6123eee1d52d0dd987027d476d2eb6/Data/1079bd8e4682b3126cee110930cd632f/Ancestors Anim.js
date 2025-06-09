"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UIRingRotation = void 0;
var __selfType = requireType("./Ancestors Anim");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const RotationInterpolationType_1 = require("../../RotationInterpolationType");
let UIRingRotation = class UIRingRotation extends BaseScriptComponent {
    onAwake() {
        const transform = this.getTransform();
        // Scale up from 0 → 1 over 4 sec, after 5 sec delay
        const scaleTween = LSTween_1.LSTween.scaleToLocal(transform, vec3.one(), 4000);
        // Continuous Y-axis rotation (45° every 5 seconds)
        const rotationTween = LSTween_1.LSTween.rotateOffset(transform, quat.angleAxis(MathUtils.DegToRad * 45, vec3.up()), 5000, RotationInterpolationType_1.RotationInterpolationType.LERP).repeat(Infinity);
        // Start scale, then rotation
        scaleTween.chain(rotationTween).start();
    }
};
exports.UIRingRotation = UIRingRotation;
exports.UIRingRotation = UIRingRotation = __decorate([
    component
], UIRingRotation);
//# sourceMappingURL=Ancestors%20Anim.js.map