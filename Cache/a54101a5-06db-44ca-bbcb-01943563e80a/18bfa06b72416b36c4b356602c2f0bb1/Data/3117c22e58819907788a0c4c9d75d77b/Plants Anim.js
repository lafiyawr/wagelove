"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.plants = void 0;
var __selfType = requireType("./Plants Anim");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let plants = class plants extends BaseScriptComponent {
    onAwake() {
        const plantsComp = this.plantsComp.getTransform();
        const targetScale = new vec3(1, 1, 1);
        // Start at scale 0
        plantsComp.setLocalScale(vec3.zero());
        // Staggered scale tweens
        const tween1 = LSTween_1.LSTween.scaleToLocal(plantsComp, targetScale, 1000)
            .easing(Easing_1.default.Circular.InOut)
            .delay(0);
        tween1.start();
    }
};
exports.plants = plants;
exports.plants = plants = __decorate([
    component
], plants);
//# sourceMappingURL=Plants%20Anim.js.map