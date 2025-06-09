// KeypointModelConfig.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Model config for keypoint experiments

var KeypointConfig = {
    config_name: "2023-07-v3-wrist-model-config-he.json",
    model_name: "V3.4.0",
    /**
     * Options:
     *  HE_LE1: high end and low end 1 model
     *  LE2: Low end 2 model
     *  WRIST_HE: Wrist high end model
     *  WRIST_HE_LE_MIX: Wrist HE + LE model
    */
    decoder_set: "WRIST_HE",

    /** Should be automatically set inside function onLoaded */
    inputWidth: 160,
    inputHeight: 192,
    textureSize : new vec2(192, 160),

    kFootPresenceThresholdHide : 0.4,
    kNNLeftPointClassZeroOffset : 0,
    kNNLeftPointClassOneOffset : 7,
    kNNLeftPointClassTwoOffset : 14,
    kNNRightPointClassZeroOffset : 21,
    kNNRightPointClassOneOffset : 28,
    kNNRightPointClassTwoOffset : 35,
    kNNRightFootPresenceOffset : 42,
    kNNLeftFootPresenceOffset  : 43,
    kOverlayThreshold : 0.8,
    kOverlayGreaterThreshold : 1.1,
    kVisiblePointsThreshold : 6,

    keypointVisibilityThreshold: 0.2,
    stride: 4,

    nms_radius: 15,
    maximumNumFeet: 1,

    inputName : "IMAGE",

    //    outputKeypointsName: "SF_INTEGRAL_GAUSSIANS_joints",
    //    outputVisibilitiesName: "SF_INTEGRAL_GAUSSIANS_SF_INTEGRAL_GAUSSIANS",
    outputKeypointsName: "SF_INTEGRAL_joints",
    outputVisibilitiesName: "SF_INTEGRAL_SF_INTEGRAL",

    outputSparseLRScoresName: "SF_SPARSE_LR_CLASS",
    outputCenterClassName: "MP_CENTER_3D_CLASS",
    outputCenterOffsetName: "MP_CENTER_3D_SHORT_OFFSET",

    // ORIGINAL POINTS FROM BLENDER
       keypoints3d_left: [
           0, 0.006, 0.019,
           0, -0.006, 0.019,
           -0.02495, 0.006, 0,
           -0.02495, -0.006, 0,
           0, 0.006, -0.019,
           0, -0.006, -0.019,
           0.02495, 0.006, 0,
           0.02495, -0.006, 0,
       ],

       keypoints3d_right: [
           0, -0.006, 0.019,
           0, 0.006, 0.019,
           0.02495, -0.006, 0,
           0.02495, 0.006, 0,
           0, -0.006, 0.019,
           0, 0.006, -0.019,
           -0.02495, -0.006, 0,
           -0.02495, 0.006, 0,
       ],
    
    // Multiplied by 10
    //    keypoints3d_left: [
    //        0, 0.06, .19,
    //        0, -0.06, .19,
    //        -0.2495, .06, 0,
    //        -0.2495, -0.06, 0,
    //        0, 0.06, -0.19,
    //        0, -0.06, -0.19,
    //        0.2495, 0.06, 0,
    //        0.2495, -0.06, 0,
    //    ],
    //
    //    keypoints3d_right: [
    //        0, -0.6, 1.9,
    //        0, 0.6, 1.9,
    //        2.495, -0.6, 0,
    //        2.495, 0.6, 0,
    //        0, -0.6, 1.9,
    //        0, 0.6, -1.9,
    //        -2.495, -0.6, 0,
    //        -2.495, 0.6, 0,
    //    ],
    
    // Multiplied by 100
    //    keypoints3d_left: [
    //        0, 0.6, 1.9,
    //        0, -0.6, 1.9,
    //        -2.495, 0.6, 0,
    //        -2.495, -0.6, 0,
    //        0, 0.6, -1.9,
    //        0, -0.6, -1.9,
    //        2.495, 0.6, 0,
    //        2.495, -0.6, 0,
    //    ],
    //
    //    keypoints3d_right: [
    //        0, -0.6, 1.9,
    //        0, 0.6, 1.9,
    //        2.495, -0.6, 0,
    //        2.495, 0.6, 0,
    //        0, -0.6, 1.9,
    //        0, 0.6, -1.9,
    //        -2.495, -0.6, 0,
    //        -2.495, 0.6, 0,
    //    ],
    
    
    // Mulitplied by 1000
//    keypoints3d_left: [
//        0, 6, 19,
//        0, -6, 19,
//        -24.95, 6, 0,
//        -24.95, -6, 0,
//        0, 6, -19,
//        0, -6, -19,
//        24.95, 6, 0,
//        24.95, -6, 0,
//    ],
//    
//    keypoints3d_right: [
//        0, -6, 19,
//        0, 6, 19,
//        24.95, -6, 0,
//        24.95, 6, 0,
//        0, -6, 19,
//        0, 6, -19,
//        -24.95, -6, 0,
//        -24.95, 6, 0,
//    ],
    
    // Mulitplied by 10,000
//    keypoints3d_left: [
//        0, 60, 190,
//        0, -60, 190,
//        -249.5, 60, 0,
//        -249.5, -60, 0,
//        0, 60, -190,
//        0, -60, -190,
//        249.5, 60, 0,
//        249.5, -60, 0,
//    ],
//    
//    keypoints3d_right: [
//        0, -60, 190,
//        0, 60, 190,
//        24.95, -60, 0,
//        24.95, 60, 0,
//        0, -60, 190,
//        0, 60, -190,
//        -249.5, -60, 0,
//        -249.5, 60, 0,
//    ],

    optical_flow: {
        WIN_SIZE_OPT_FLOW: new vec2(50.0, 50.0),
        MAX_LEVEL_OPT_FLOW: 4,
        MAX_COUNT_OPT_FLOW: 10,
        EPS_OPT_FLOW: 0.03,
        DIVISION_FACTOR: 2,  // make optical flow image smaller to speed up
    },

    solve_pnp: {
        VERIFY_SOLVE_PNP: false,
        MIN_PROJECTION_LOSS_THRESHOLD: 0.05,
        USE_DYNAMIC_THRESHOLD: true,
    },

    // Matching metadata
    memory_cliff: 10,
    tracking_radius: 15,
    next_id: 0,

    /** Decoders for Wrist HE:
     *   ShoeCenterGaussDetectDecoder or ShoeCenterDetectDecoder
     *   CenterTrackDecoder
     *   CenterKeypointMatchingDecoder
     *   IntegralKeypointDecoder
     *   SparseLeftRightDecoder
     *   CenterHysteresisDecoder
     */

    decoder_pipeline: ["ShoeCenterDetectDecoder",
        // "CenterTrackDecoder",
        // "CenterHysteresisDecoder",
        "IntegralKeypointDecoder",
        // "JointSampleKpClassDecoder",
        "SparseLeftRightDecoder",
        "CenterKeypointMatchingDecoder",
    ],

    // Hysteresis Center metadata
    hysteresis_center_lb: 0.3,
    hysteresis_center_ub: 0.3,

    // CenterKeypointMatchingDecoder Hyperparams
    center_kpt_min_dist: 50,

    // IntegralKeypointDecoder Hyperparams
    integral_kpt_stride: 4,
    apply_sigmoid_kpt_visibilities: true,

    // SparseLeftRightDecoder Hyperparams
    sparse_lr_stride: 4,

};

var ExperimentConfig = {
    SIZE: KeypointConfig.keypoints3d_left.length / 3,
    SIZE2: 2 * KeypointConfig.keypoints3d_left.length / 3,
    KERNEL_SIZE: 5,

    TYPE: {LEFT: 0,  RIGHT: 1},
    // allPointsShape:  new vec3(2, this.SIZE2, 1),
    isFirstFrame:  true,
    trackingCamera:  null,
    modelToCamTexMult:  null,

    opticalFlow: null,
    prevTexOptFlowSize: null,

    listOfTextObjects: [],
    frameCounterTextObject: null,
    timerTextObject: null,
    useDetections: false,

};

module.exports.version = "1.0.0";
module.exports.KeypointModelConfig = KeypointConfig;
module.exports.ExperimentConfig = ExperimentConfig;
