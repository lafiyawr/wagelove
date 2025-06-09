/**
 * @module OpticalFlow
 * Description: Math Library implemented on Javascript
 * @author Snap Inc.
 * @version 1.0.0
 *
 * Event: Lens Initialized
 * ====  Example ====
 * @example
 * var OpticalFlow = require("./OpticalFlow")
 *
 * New Optical Flow
 * var OpticalFlow = new OpticalFlow.OpticalFlow(modelConfig);
 * *
 * New Smooth Step
 * var smoothStep = new OpticalFlow.SmoothStep();
 * smoothStep.resize(vec2)
**/

const MathLib = require("./NewJSMathLibrary_102");

var OpticalFlow = function(modelConfig) {
    this.cfg = modelConfig;

    this.texture = null;
    this.textureSize = null;

    this.prevGrayScale = null;
    this.grayScale = null;
    this.textureShape =  null;
    this.count = 0;

    this.winSize = this.cfg.optical_flow.WIN_SIZE_OPT_FLOW;
    this.maxLevel = this.cfg.optical_flow.MAX_LEVEL_OPT_FLOW;
    this.maxCount = this.cfg.optical_flow.MAX_COUNT_OPT_FLOW;
    this.epsilon = this.cfg.optical_flow.EPS_OPT_FLOW;
    this.scaling_factor = this.cfg.optical_flow.DIVISION_FACTOR;

    this.optFlowToCamTexMult = new Float32Array(2);
    this.camTexToOptFlowMult = new Float32Array(2);

};

OpticalFlow.prototype = {
    initializeTexture: function(deviceTexture) {
        var image_width = deviceTexture.getWidth();
        var image_height = deviceTexture.getHeight();

        this.texture = deviceTexture;
        this.textureSize = new vec2(image_width / this.scaling_factor,
            image_height / this.scaling_factor);
        this.textureShape = new vec3(this.textureSize.x, this.textureSize.y, 1);
        this.grayScale = new Uint8Array(this.textureSize.x * this.textureSize.y);
        this.prevGrayScale = new Uint8Array(this.textureSize.x * this.textureSize.y);

        this.optFlowToCamTexMult[0] = image_width / this.textureSize.x;
        this.optFlowToCamTexMult[1] = image_height / this.textureSize.y;

        this.camTexToOptFlowMult[0] = this.textureSize.x / image_width;
        this.camTexToOptFlowMult[1] = this.textureSize.y / image_height;

    },

    preprocess: function() {
        TensorMath.textureToGrayscale(this.texture, this.grayScale, this.textureShape);
    },
    apply: function(prevPoints, points, pointsShape) {
        /**
         * the prevPoints and points are in the scale of the Original image
         * and should be converted to the optical flow size
        */
        this.preprocess();

        TensorMath.mulTensors(
            prevPoints,
            pointsShape,
            this.camTexToOptFlowMult,
            MathLib.points2dShape,
            points
        );

        var num_of_points = pointsShape.y;

        /**
         * For some reason the Y coordinates are upside down (probably origin of the image is bottom left
         * instead of top left? ). Therefore I need to flip Y before and after running optical flow.
         */
        var i;
        for (i = 0; i < num_of_points; i++) {
            points[2 * i + 1] = this.textureSize.y - points[2 * i + 1];
        }

        TensorMath.opticalFlow(
            this.prevGrayScale,
            this.grayScale,
            this.textureShape,
            points,  // TODO: fix back to //points
            points,
            pointsShape,
            this.winSize,
            this.maxLevel,
            this.maxCount,
            this.epsilon
        );

        for (i = 0; i < num_of_points; i++) {
            points[2 * i + 1] = this.textureSize.y - points[2 * i + 1];
        }

        TensorMath.mulTensors(
            points,
            pointsShape,
            this.optFlowToCamTexMult,
            MathLib.points2dShape,
            points
        );

        this.postprocess();
    },
    postprocess: function() {
        this.prevGrayScale.set(this.grayScale, 0);
    },
};

const subTensor = new Float32Array(1);
subTensor[0] = 1.0;
const subTensorShape = new vec3(1, 1, 1);

var SmoothStep = function() {
    this.size = 0;
    this.pointsShape = null;
    /** maxFootRatio: if the distance between the previous points and the currentPoints is less than 5% then
    * the weight of the current detections is halved and the optical flow takes over. Otherwise the weight
    * of the detections is tripled and plays a much more important role.
     */
    this.maxFootRatio = 0.05;
    this.prevDiff = null;
    this.newNorm = null;
    this.prevNorm = null;
    this.predLenByFootLen = null;
};

SmoothStep.prototype = {
    resize: function(size) {
        this.size = size;
        this.pointsShape = new vec3(2, size, 1);
        this.sizeShape = new vec3(1, size, 1);
        
        this.prevDiff = new Float32Array(this.size * 2);
        this.prevNorm = new Float32Array(this.size);
        this.predLenByFootLen = new Float32Array(this.size);
    },
    apply: function(prev, cur, next) {
        /**
         * Calculates a weight for each keypoint, using the distance between the
         * previous keypoints and the currently detected keypoints. The bigger the movement,
         * the bigger the weight (predLenByFootLen).
         * The final points are calculated with the equation:
         *
         *   cur = cur * W + next * (1 - W)
         *
         *   where: W = |cur - prev| /  footLength    (a few more details not mentioned here)
         */

        var size = this.size;

        TensorMath.subTensors(cur,
            this.pointsShape,
            prev,
            this.pointsShape,
            this.prevDiff);

        TensorMath.getVectorsLength(this.prevDiff,
            this.pointsShape,
            this.prevNorm);

        var footLen = TensorMath.maxDistanceBetweenPoints(cur, this.pointsShape);

        TensorMath.mulScalar(this.prevNorm, 1 / footLen, this.predLenByFootLen);

        for (var i = 0; i < size; ++i) {
            if (this.predLenByFootLen[i] < this.maxFootRatio) {
                this.predLenByFootLen[i] *= 0.5;
            } else {
                this.predLenByFootLen[i] *= 3.5;
            }
        }

        TensorMath.clamp(this.predLenByFootLen, 0.0, 1.0, this.predLenByFootLen);


        TensorMath.mulTensors(cur,
            this.pointsShape,
            this.predLenByFootLen,
            this.sizeShape,
            cur);

        TensorMath.subTensors(subTensor,
            subTensorShape,
            this.predLenByFootLen,
            this.sizeShape,
            this.predLenByFootLen);

        TensorMath.mulTensors(next,
            this.pointsShape,
            this.predLenByFootLen,
            this.sizeShape,
            next);

        TensorMath.addTensors(cur,
            this.pointsShape,
            next,
            this.pointsShape,
            cur);
    }
};

module.exports.OpticalFlow = OpticalFlow;
module.exports.SmoothStep = SmoothStep;