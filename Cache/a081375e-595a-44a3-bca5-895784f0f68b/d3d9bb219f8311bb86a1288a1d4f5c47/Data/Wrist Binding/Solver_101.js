/**
 * @module Solver
 * Description: Math Library implemented on Javascript
 * @author Snap Inc.
 * @version 1.0.1
 *
 * Event: Lens Initialized
 * ====  Example ====
 * @example
 * var Solver = require("./Solver")
**/

const MathLib = require("./NewJSMathLibrary_102");

const TYPE = {
    LEFT: 0,
    RIGHT: 1
};

var Solver = function(modelConfig, type) {

    this.cfg = modelConfig;
    this.type = type;  /** 0: Left, 1: Right */
    this.binding = null;
    this.transform = new Float32Array(6);
    this.size = 0; //don't sure if we want this, rename anyway

    this.prevOutTensor = null;
    this.newOutTensor = null;

    this.pointsShape = null;

    this.visibilityScore = null;
    this.isVisible = false;
    this.visibilityMask = null;
    this.visiblePointsNum = 0;

    this.visibleOutTensor = null;
    this.visibleInObjectPoints = null;
    this.projected3dPoints = null;


    this.keypoints3d_left = new Float32Array(modelConfig.keypoints3d_left.length);
    this.keypoints3d_left.set(modelConfig.keypoints3d_left);
    this.keypoints3d_right = new Float32Array(modelConfig.keypoints3d_right.length);
    this.keypoints3d_right.set(modelConfig.keypoints3d_right);

    this.keypoints3d_used = null;
    if (this.type === TYPE.LEFT) {
        this.keypoints3d_used = this.keypoints3d_left;
    } else {
        this.keypoints3d_used = this.keypoints3d_right;
    }

    this.camera = null;

    this.verifySolvePnP = modelConfig.solve_pnp.VERIFY_SOLVE_PNP;
    this.projLossThreshold = modelConfig.solve_pnp.MIN_PROJECTION_LOSS_THRESHOLD;
    this.useDynamicThreshold = modelConfig.solve_pnp.USE_DYNAMIC_THRESHOLD;

};

Solver.prototype = {
    resize: function(size) {
        this.size = size;
        this.pointsShape = new vec3(2, size, 1);
        this.visibilityMask = new Uint8Array(size);
        this.visibleOutTensor = new Float32Array(size * 2);
        this.visibleInObjectPoints = new Float32Array(size * 3);
        this.projected3dPoints = new Float32Array(size * 2);
    },

    addVisibilityMask: function(visibilityMask, totalVisibilityScore) {
        this.visibilityScore = MathLib.sigmoid(totalVisibilityScore);
        this.isVisible = this.visibilityScore > this.cfg.kFootPresenceThresholdHide;
        this.visiblePointsNum = 0;
        if (this.isVisible) {
            this.visibilityMask.set(visibilityMask, 0);
            for (var i = 0; i < this.size; ++i) {
                if (visibilityMask[i] === 1) {
                    ++this.visiblePointsNum;
                }
            }
            this.isVisible = this.visiblePointsNum >= this.cfg.kVisiblePointsThreshold;
        }
        this.updateVisibility();
    },

    setVisibilityMask: function(newVisibilityMask) {
        this.visibilityMask.set(newVisibilityMask, 0);
        this.visiblePointsNum = 0;
        for (var i = 0; i < this.size; ++i) {
            if (this.visibilityMask[i] === 1) {
                ++this.visiblePointsNum;
            }
        }
        this.isVisible = this.visiblePointsNum >= this.cfg.kVisiblePointsThreshold;
        this.updateVisibility();
    },

    set3dKeypointsUsed: function(is_switched) {
        if ((!is_switched && this.type === TYPE.LEFT) || (is_switched && this.type === TYPE.RIGHT)) {
            this.keypoints3d_used = this.keypoints3d_left;
        } else {
            this.keypoints3d_used = this.keypoints3d_right;
        }
    },

    apply: function(outTensor) {
        this.applySolvePnP(outTensor);

        this.binding.setTransform(this.transform);
    },

    applySolvePnP: function(outTensor) {

        var it = 0;
        this.visiblePointsNum = 0;
        for (var i = 0; i < this.size; ++i) {
            if (this.visibilityMask[i] === 1) {
                this.visiblePointsNum  += 1;

                this.visibleOutTensor[it * 2] = outTensor[i * 2];
                this.visibleOutTensor[it * 2 + 1] = outTensor[i * 2 + 1];

                this.visibleInObjectPoints[it * 3] = this.keypoints3d_used[i * 3];
                this.visibleInObjectPoints[it * 3 + 1] = this.keypoints3d_used[i * 3 + 1];
                this.visibleInObjectPoints[it * 3 + 2] = this.keypoints3d_used[i * 3 + 2];

                ++it;
            }
        }

        this.isVisible = TensorMath.solvePnP(
            this.visibleInObjectPoints, 
            this.visibleOutTensor, 
            new vec3(2, this.visiblePointsNum, 1),
            this.camera.intrinsics,
            0, 
            this.transform
        );

        var rodrigues = new vec3(this.transform[0], this.transform[1], this.transform[2]);
        var translation = new vec3(this.transform[3], this.transform[4], this.transform[5]);

        if (this.verifySolvePnP) {
            var quatRotation = MathLib.rodriguesToQuat(rodrigues);

            var maxDist = 0.0;
            for (var j = 0; j < this.visiblePointsNum; ++j) {
                var p = new vec3(this.visibleInObjectPoints[j * 3], this.visibleInObjectPoints[j * 3 + 1], this.visibleInObjectPoints[j * 3 + 2]);
                p = quatRotation.multiplyVec3(p);

                p = p.add(translation);
                var pos1 = this.camera.camera.worldSpaceToScreenSpace(p);
                var pos2 = new vec2(1.0 - this.visibleOutTensor[j * 2] / this.camera.cameraSize.x, this.visibleOutTensor[j * 2 + 1] / this.camera.cameraSize.y);

                this.projected3dPoints[j * 2] = (1 - pos1.x) * this.camera.cameraSize.x;
                this.projected3dPoints[j * 2 + 1] = pos1.y * this.camera.cameraSize.y;

                maxDist = Math.max(maxDist, pos2.distance(pos1));
            }
            /** A dynamic threshold is added because the reprojection error increases,
             * the closer the object gets to the camera
             */

            var projLossThreshold = this.projLossThreshold;
            if (this.useDynamicThreshold) {
                projLossThreshold = Math.max(projLossThreshold, -0.2 * translation.z + 0.5);
            }
            if (maxDist > projLossThreshold || translation.z < 0.5) {
                this.isVisible = false;
                this.updateVisibility();
            }
        }
    },

    updateVisibility: function() {
        if (!this.isVisible) {
            this.invalidate();
        } else {
            this.binding.setEnabled(true);
        }
    },

    invalidate: function() {
        this.isVisible = false;
        this.binding.setEnabled(false);
        // Set transform vector to zero when reprojection error is large
        for (var i = 0; i < 6; ++i) {
            this.transform[i] = 0;
        }
    }
};

module.exports.version = "1.0.0";

module.exports.Solver = Solver;
