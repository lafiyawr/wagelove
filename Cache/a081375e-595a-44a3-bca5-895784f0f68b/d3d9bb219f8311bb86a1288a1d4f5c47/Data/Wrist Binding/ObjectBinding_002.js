// @module ObjectBinding.js
// Version: 0.0.2
// Event: Lens Initialized
// Description: Controller for each of inividual wrist bindings

//@ input int type = 0 {"widget":"combobox", "values":[{"label":"Left", "value":0}, {"label":"Right", "value":1}]}

const MathLib = require("./NewJSMathLibrary_102");

var ObjectBinding = function() {
    this.inObjectPoints = null;
    this.keypoints3d_left = null;
    this.keypoints3d_right = null;

    this.binding = null;
    this.bindingTF = null;

    this.trackedMeshVisuals = null;
    
    this.isVisible = null;
};


ObjectBinding.prototype = {
    setObject: function(object) {
        this.binding = object;
        this.bindingTF = this.binding.getTransform();
    },

    setTransform: function(transform) {
        // if the camera has rotation 180 around X axis (Y axis downwards), it's the same as the OpenCV camera and the
        // rotation and translation calculated can be used as they are
        // But if we keep the camera with its Y axis pointing upwards then we need to modify these values

        var translation = new vec3(transform[3], transform[4], transform[5]);
        var rodrigues = new vec3(transform[0], transform[1], transform[2]);

        var quatRotation = MathLib.rodriguesToQuat(rodrigues);

        var fixQuat = quat.fromEulerAngles(Math.PI, 0, 0);

        translation = fixQuat.multiplyVec3(translation);

        quatRotation = fixQuat.multiply(quatRotation);

        this.bindingTF.setLocalPosition(translation);
        this.bindingTF.setLocalRotation(quatRotation);
    },

    setEnabled: function(value) {
        this.binding.enabled = value;
        this.isVisible = value;
    }
};


function createBinding(sceneObject) {
    var binding = new ObjectBinding();
    binding.setObject(sceneObject);
    return binding;
}

module.exports.createBinding = createBinding;