// Wrist Binding.js
// Version: 2.0.0
// Event: Lens Initialized
// Description: Wrist Binding Custom Component

/**
* === EVENTS ===
*
* onTrackingUpdate(left, right)
*     'left' (bool) left wrist is being currently tracked
*     'right' (bool) right wrist is being currently tracked
*      - Register for the event:
*        script.wristBindCC.onTrackingUpdate.add(function(left, right) {...});
*
* onWristFound()
*      triggered when isTracking() becomes true
*      - Register for the event:
*        script.wristBindCC.onWristFound.add(function() {...});
*
* onWristLost()
*      triggered when isTracking() becomes false
*      - Register for the event:
*        script.wristBindCC.onWristLost.add(function() {...});
*
* === API ===
*
* isTracking() : bool
*   returns true if left wrist, right wrist, or both are currently beings tracked
*
* isTrackingLeft(): bool
*   returns true if left wrist is currently beings tracked
*
* isTrackingRight(): bool
*   returns true if right wrist is currently beings tracked
*
*/

// @input SceneObject leftWrist
// @input SceneObject rightWrist
// @input Asset.MLAsset mlAsset
// @input Asset.Texture deviceTexture

const BindingLib = require("./ObjectBinding_002");
const AnnotatorLib = require("./Annotator_002");
const OpticalFlow = require("./OpticalFlow_100");
const Solver = require("./Solver_101");
const MathLib = require("./NewJSMathLibrary_102");
const HelperLib = require("./GenericHelperScript_001");
const ObjHelpers = require("./SceneObjectHelpersModule_110");
const EventModule = require("./EventModule_101");


const USE_LOCAL_CONFIG = true;
var modelConfig = null;
if (USE_LOCAL_CONFIG) {
    const configWristHE = require("./WristKeypointConfig_HE");
    modelConfig = configWristHE.KeypointModelConfig;
}

/** Add slice function to Float32 and Uint8Array
 * https://stackoverflow.com/a/31898534
 * */
if (!Float32Array.prototype.slice) {
    Float32Array.prototype.slice = function(begin, end) {
        var target = new Float32Array(end - begin);

        for (var i = 0; i < begin + end; ++i) {
            target[i] = this[begin + i];
        }
        return target;
    };
}

const TYPE = {
    LEFT: 0,
    RIGHT: 1
};

var wristBindingController = [script.leftWrist, script.rightWrist];
var numKeypoints, numKeypoints2;
var allPointsShape;
var isFirstFrame = true;
var trackingCamera = null;
var opticalFlow = null;
var smoothStep = null;
var annotator = null;
var solver = [null, null];
var mlComponent = null;
var mlAsset = null;
var outputVisibilitiesTensor = null;
var outputVisibilitiesTensorShape = null;
var visibilityMask = null;
var prevVisibilityMask = null;
var outTensor = null;
var outTensorLeft = null;
var outTensorRight = null;
var annotations = null;
var prevOutTensor = null;
var newOutTensor = null;
var maxProbabilities = null;
var cameraComponent;
var trackingState = [false, false];

var updateEvent = script.createEvent("UpdateEvent");
updateEvent.bind(onUpdate);
updateEvent.enabled = false;

/*** API ***/

script.onTrackingUpdate = new EventModule.EventWrapper();
script.onWristFound = new EventModule.EventWrapper();
script.onWristLost = new EventModule.EventWrapper();

script.isTracking = function() {
    return script.isTrackingLeft() || script.isTrackingRight();
};

script.isTrackingLeft = function() {
    return solver[TYPE.LEFT] && solver[TYPE.LEFT].isVisible;
};

script.isTrackingRight = function() {
    return solver[TYPE.RIGHT] && solver[TYPE.RIGHT].isVisible;
};

script.getModelVersion = function() {
    if (!modelConfig) {
        return "";
    }
    
    if (!modelConfig.model_name) {
        return "";
    }

    return modelConfig.model_name;
};

script.getModelDatetime = function() {
    if (!modelConfig) {
        return "";
    }
    
    if (!modelConfig.config_name) {
        return "";
    }
    
    return modelConfig.config_name;
};

/*** Internal ***/

var TrackingCamera = function(camera) {
    this.camera = camera;
    this.cameraSize = null;
    this.intrinsics = null;
};

TrackingCamera.prototype = {
    update: function() {
        this.cameraSize = new vec2(script.deviceTexture.getWidth(), script.deviceTexture.getHeight());
        
        this.intrinsics = MathLib.makeIntrinsicsMatrix(this.cameraSize, this.camera.fov);
    },
    calcCameraSize: function() {
        return new vec2(script.deviceTexture.getWidth(), script.deviceTexture.getHeight());
    }
};

function initOpticalFlow() {
    allPointsShape = new vec3(2, numKeypoints2, 1);
    smoothStep = new OpticalFlow.SmoothStep();
    smoothStep.resize(numKeypoints2);  // both left and right keypoints!
    opticalFlow = new OpticalFlow.OpticalFlow(modelConfig);
}

function createSolver(type, sceneObject) {
    if (sceneObject) {
        if (modelConfig.decoder_set === "WRIST_HE_LE_MIX") { // TODO make left keypoints symmetric to right same as for feet
            modelConfig.keypoints3d_right = new Float32Array(modelConfig.keypoints3d_left.length);
            modelConfig.keypoints3d_right.set(modelConfig.keypoints3d_left);
        } else {
            modelConfig.keypoints3d_right = MathLib.reflectY(modelConfig.keypoints3d_left);
        }

        solver[type] = new Solver.Solver(modelConfig, type);
        solver[type].binding = BindingLib.createBinding(sceneObject);
        solver[type].resize(numKeypoints);
        solver[type].camera = trackingCamera;
        solver[type].invalidate();
    }
}

function copy_left_points(all_points, left_points) {
    for (var k = 0; k < numKeypoints2; ++k) {
        left_points[k] = all_points[k];
    }
}

function copy_right_points(all_points, right_points) {
    for (var k = 0; k < numKeypoints2; ++k) {
        right_points[k] = all_points[k + numKeypoints2];
    }
}

function processOutputData() {
    annotations = annotator.annotate(mlComponent);

    visibilityMask = annotations["model_keypoints_vis"];
    outTensor = annotations["model_keypoints"];
    if (solver[TYPE.LEFT]) {
        solver[TYPE.LEFT].addVisibilityMask(visibilityMask.slice(0, numKeypoints), 1.0);
    }
    if (solver[TYPE.RIGHT]) {
        solver[TYPE.RIGHT].addVisibilityMask(visibilityMask.slice(numKeypoints, numKeypoints2), 1.0);
    }
}

function onCameraChanged() {
    var curCameraSize = trackingCamera.calcCameraSize();
    if (trackingCamera.cameraSize.x === curCameraSize.x && trackingCamera.cameraSize.y === curCameraSize.y) {
        if (trackingCamera.cameraFov !== trackingCamera.camera.fov) {
            trackingCamera.update();
        }
        return;
    }

    trackingCamera.update();

    if (opticalFlow != null && opticalFlow.textureSize != null) {
        opticalFlow.initializeTexture(script.deviceTexture);
    }
}

function initCamera() {
    const so = script.getSceneObject();
    const cams = ObjHelpers.getParentCamerasIntersectingRecursive(so);
    if (cams.length<1) {
        print("error: Wrist Binding component must be placed under a camera");
        return false;
    }
    cameraComponent = cams[0];
    // Near plane fix (set small near plane because object is very small and close to camera)
    cameraComponent.near = 0.02;
    trackingCamera = new TrackingCamera(cameraComponent);
    trackingCamera.update();

    script.createEvent("CameraFrontEvent").bind(onCameraChanged);
    script.createEvent("CameraBackEvent").bind(onCameraChanged);
    return true;
}

function onLoaded() {
    var data = mlComponent.getInput(modelConfig.inputName);
    data.texture = script.deviceTexture;

    modelConfig.textureSize = new vec2(data.shape.x, data.shape.y);
    modelConfig.inputWidth = data.shape.x;
    modelConfig.inputHeight = data.shape.y;
    outputVisibilitiesTensor = mlComponent.getOutput(modelConfig.outputVisibilitiesName).data;  // 160 x 192 x 16
    outputVisibilitiesTensorShape = mlComponent.getOutput(modelConfig.outputVisibilitiesName).shape;  // 160 x 192 x 16

    numKeypoints = outputVisibilitiesTensorShape.z / 2;
    numKeypoints2 = numKeypoints * 2;

    outTensor = new Float32Array(numKeypoints2 * 2);
    outTensorLeft = new Float32Array(numKeypoints2);
    outTensorRight = new Float32Array(numKeypoints2);

    prevOutTensor = new Float32Array(numKeypoints2 * 2);
    newOutTensor = new Float32Array(numKeypoints2 * 2);

    maxProbabilities = new Float32Array(numKeypoints2);

    visibilityMask = new Uint8Array(numKeypoints2); // 16 x 1, has visibility 0 or 1 values for every keypoint
    prevVisibilityMask = new Uint8Array(numKeypoints2); // 16 x 1, has visibility 0 or 1 values for every keypoint

    initAfterMlLoaded();

    updateEvent.enabled = true;
    mlComponent.runScheduled(true, MachineLearning.FrameTiming.Update, MachineLearning.FrameTiming.Update);
}

function getModelMetadata(input_mlComponent, input_mlAsset) {
    var component_modelConfig;
    if (input_mlComponent) {
        component_modelConfig = mlComponent.model.getMetadata();
    } else if (input_mlAsset) {
        component_modelConfig = input_mlAsset.getMetadata();
    }

    if (component_modelConfig) {  // if local config is not empty, use that one instead

            modelConfig = component_modelConfig;
            modelConfig.optical_flow.WIN_SIZE_OPT_FLOW = new vec2(
                modelConfig.optical_flow.WIN_SIZE_OPT_FLOW[0],
                modelConfig.optical_flow.WIN_SIZE_OPT_FLOW[1]
            );

        modelConfig.textureSize = new vec2(
                modelConfig.textureSize[0], modelConfig.textureSize[1]);
        
    }
//    print(modelConfig.keypoints3d_left[1]);
    numKeypoints = modelConfig.keypoints3d_left.length / 3;
    numKeypoints2 = numKeypoints * 2;
    
    
    // This is a last-minute edit that @dstoddart and @wpickleman added for
    // the 4.55.1 release. We pushed a local ML model that had the wrong
    // keypoints (they were scaled 1/1000 too small) and we couldn't edit
    // the local ML model in time before release. So, here we've added a
    // small hacky soultion that manually adjusts the keypoints so that 
    // they are in the correct scale.
    if (modelConfig.keypoints3d_left[1] == 0.006) {
        for (var i = 0; i < modelConfig.keypoints3d_left.length; i++) {
            modelConfig.keypoints3d_left[i] *= 1000;
        }
    }
}

function initMLComponent() {
    mlComponent = script.getSceneObject().createComponent("Component.MLComponent");    
    mlComponent.onLoadingFinished = onLoaded;
    mlAsset = script.mlAsset;
    mlComponent.model = mlAsset;
    getModelMetadata(null, mlAsset);
    HelperLib.build_ML_generic(mlComponent, script.deviceTexture, false);
}

function onUpdate() {

    processOutputData();

    if ((solver[TYPE.LEFT] && !solver[TYPE.LEFT].isVisible) &&
        (solver[TYPE.RIGHT] && !solver[TYPE.RIGHT].isVisible)) {
        return;
    }

    onCameraChanged();

    var crop_width = modelConfig.textureSize.x;
    var crop_height = modelConfig.textureSize.y;
    var image_width = cameraComponent.renderTarget.getWidth();
    var image_height = cameraComponent.renderTarget.getHeight();

    if (isFirstFrame) {
        opticalFlow.initializeTexture(script.deviceTexture);
        isFirstFrame = false;
    }

    for (var i = 0; i < numKeypoints2; i++) {
        var texture_vec = new vec2(outTensor[2 * i], outTensor[2 * i + 1]);
        var screenPosition2D = HelperLib.tex2img_coords(texture_vec, image_width, image_height, crop_width, crop_height);
        outTensor[2 * i] = screenPosition2D.x;
        outTensor[2 * i + 1] = screenPosition2D.y;
    }

    opticalFlow.apply(
        prevOutTensor,
        newOutTensor,
        allPointsShape
    );

    for (var j = 0; j < numKeypoints2; ++j) {
        /** if at previous frame the point was invisible then use detection instead of optical flow!*/
        if (prevVisibilityMask[j] === 0) {
            newOutTensor[j * 2] = outTensor[j * 2];
            newOutTensor[j * 2 + 1] = outTensor[j * 2 + 1];
        }
    }

    /** Mix optical flow and detections*/
    smoothStep.apply(
        prevOutTensor,
        outTensor,
        newOutTensor
    );

    prevOutTensor.set(outTensor, 0);
    prevVisibilityMask.set(visibilityMask, 0);

    copy_left_points(outTensor, outTensorLeft);
    copy_right_points(outTensor, outTensorRight);

    if (solver[TYPE.LEFT] && solver[TYPE.LEFT].isVisible && solver[TYPE.RIGHT] && solver[TYPE.RIGHT].isVisible) {
        var b1 = MathLib.makeBoundingBox(outTensorLeft, solver[TYPE.LEFT].visibilityMask);
        var b2 = MathLib.makeBoundingBox(outTensorRight, solver[TYPE.RIGHT].visibilityMask);

        if (MathLib.isBoxIntersection(b1, b2)) { // HANDLE OVERLAP
            var intersection = MathLib.getBoxIntersection(b1, b2);
            var b1Area = MathLib.getBoxArea(b1);
            var b2Area = MathLib.getBoxArea(b2);
            var intersectionArea = MathLib.getBoxArea(intersection);
            if (intersectionArea / b1Area > modelConfig.kOverlayThreshold ||
                intersectionArea / b2Area > modelConfig.kOverlayThreshold) {
                if (b1Area > modelConfig.kOverlayGreaterThreshold * b2Area) {
                    solver[TYPE.RIGHT].invalidate();
                } else if (b2Area > modelConfig.kOverlayGreaterThreshold * b1Area) {
                    solver[TYPE.LEFT].invalidate();
                } else {
                    TensorMath.max(outputVisibilitiesTensor, outputVisibilitiesTensorShape, maxProbabilities);
                    var leftProb = 1.0;
                    for (var m = 0; m < numKeypoints; ++m) {
                        leftProb *= maxProbabilities[m];
                    }
                    var rightProb = 1.0;
                    for (var n = numKeypoints; n < 2 * numKeypoints; ++n) {
                        rightProb *= maxProbabilities[n];
                    }

                    if (leftProb < rightProb) {
                        solver[TYPE.LEFT].invalidate();
                    } else {
                        solver[TYPE.RIGHT].invalidate();
                    }
                }
            }
        }
    }

    if (solver[TYPE.LEFT] && solver[TYPE.LEFT].isVisible) {
        solver[TYPE.LEFT].apply(outTensorLeft);
    }

    if (solver[TYPE.RIGHT] && solver[TYPE.RIGHT].isVisible) {
        solver[TYPE.RIGHT].apply(outTensorRight);
    }

    // Report tracking update events
    const newTrackingState = [script.isTrackingLeft(), script.isTrackingRight()];
    if (newTrackingState[TYPE.LEFT] != trackingState[TYPE.LEFT] ||
        newTrackingState[TYPE.RIGHT] != trackingState[TYPE.RIGHT]) {
        script.onTrackingUpdate.trigger(newTrackingState[TYPE.LEFT], newTrackingState[TYPE.RIGHT]);
    }

    if (!(trackingState[TYPE.LEFT] || trackingState[TYPE.RIGHT]) && script.isTracking()) {
        script.onWristFound.trigger();
    } else if ((trackingState[TYPE.LEFT] || trackingState[TYPE.RIGHT]) && !script.isTracking()) {
        script.onWristLost.trigger();
    }
    trackingState = newTrackingState;
}

function initAfterMlLoaded() {
    annotator = new AnnotatorLib.Annotator(modelConfig);
    initOpticalFlow();

    if (wristBindingController[TYPE.LEFT]) {
        createSolver(TYPE.LEFT, wristBindingController[TYPE.LEFT]);
    }

    if (wristBindingController[TYPE.RIGHT]) {
        createSolver(TYPE.RIGHT, wristBindingController[TYPE.RIGHT]);
    }
}

function init() {
    if (!initCamera()) {
        return;
    }
    initMLComponent();
}

init();