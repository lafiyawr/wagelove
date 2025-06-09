"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PlantGrowthController = void 0;
var __selfType = requireType("./Plants Grow");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const LSTween_1 = require("../../LSTween");
const Easing_1 = require("../../TweenJS/Easing");
let PlantGrowthController = class PlantGrowthController extends BaseScriptComponent {
    onAwake() {
        this.animateScale(this.podsSmall1, 15, 5000, 6000);
        this.animateScale(this.podsSmall2, 20, 4000, 8000);
        this.animateScale(this.podsSmall3, 25, 6000, 10000);
        this.animateScale(this.flower2Blossom, 15, 5000, 1500);
        this.animateScale(this.grass0, 15, 4000, 8000);
        this.animateScale(this.grass1, 20, 5000, 12500);
        this.animateScale(this.grass2, 10, 7000, 16500);
        this.animateScale(this.grass3, 20, 6000, 10900);
        this.animateScale(this.grass4, 20, 5000, 12200);
        this.animateScale(this.leaves1, 15, 4000, 7300);
        this.animateScale(this.leaves2, 15, 5000, 8200);
        this.animateScale(this.leaves3, 18, 6000, 16200);
        this.animateScale(this.leaves4, 10, 4000, 20200);
        this.animateScale(this.roots1, 15, 7000, 3200);
        this.animateScale(this.roots2, 15, 7000, 6200);
        this.animateScale(this.roots3, 15, 9000, 10200);
        this.animateScale(this.roots4, 15, 8000, 14200);
        this.animateScale(this.tendril1, 10, 6000, 18200);
        this.animateScale(this.tendril2, 10, 7000, 21200);
        this.animateScale(this.tendril3, 7, 8000, 20200);
        this.animateScale(this.tendrilYoung1, 15, 8000, 24200);
        this.animateScale(this.tendrilYoung2, 5, 5000, 147200);
    }
    animateScale(target, size, duration, delay) {
        if (!target)
            return;
        const transform = target.getTransform();
        transform.setLocalScale(vec3.zero());
        LSTween_1.LSTween.scaleToLocal(transform, new vec3(size, size, size), duration)
            .easing(Easing_1.default.Quadratic.InOut)
            .delay(delay)
            .start();
    }
};
exports.PlantGrowthController = PlantGrowthController;
exports.PlantGrowthController = PlantGrowthController = __decorate([
    component
], PlantGrowthController);
//# sourceMappingURL=Plants%20Grow.js.map