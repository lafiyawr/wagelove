/**
 * @module JSMathLibraryModule
 * Description: Math Library implemented on Javascript
 * @author Snap Inc.
 * @version 1.0.2
 *
 * Event: Lens Initialized
 * ====  Example ====
 * @example
 * var JSMathLibrary = require("./JSMathLibraryModule")
**/

const MathLib = {};

MathLib.fromMat3 = function(mat) {
    var m = [mat.column0.x, mat.column0.y, mat.column0.z,
        mat.column1.x, mat.column1.y, mat.column1.z,
        mat.column2.x, mat.column2.y, mat.column2.z];

    var fourXSquaredMinus1 = m[0] - m[4] - m[8];
    var fourYSquaredMinus1 = m[4] - m[0] - m[8];
    var fourZSquaredMinus1 = m[8] - m[0] - m[4];

    var biggestIndex = 0;
    var fourBiggestSquaredMinus1 = m[0] + m[4] + m[8];
    if (fourXSquaredMinus1 > fourBiggestSquaredMinus1) {
        fourBiggestSquaredMinus1 = fourXSquaredMinus1;
        biggestIndex = 1;
    }
    if (fourYSquaredMinus1 > fourBiggestSquaredMinus1) {
        fourBiggestSquaredMinus1 = fourYSquaredMinus1;
        biggestIndex = 2;
    }
    if (fourZSquaredMinus1 > fourBiggestSquaredMinus1) {
        fourBiggestSquaredMinus1 = fourZSquaredMinus1;
        biggestIndex = 3;
    }

    var biggestVal = Math.sqrt(fourBiggestSquaredMinus1 + 1.0) * 0.5;
    var mult = 0.25 / biggestVal;

    var result = new quat(1.0, 0.0, 0.0, 0.0);
    switch (biggestIndex) {
        case 0:
            result.w = biggestVal;
            result.x = (m[5] - m[7]) * mult;
            result.y = (m[6] - m[2]) * mult;
            result.z = (m[1] - m[3]) * mult;
            break;
        case 1:
            result.w = (m[5] - m[7]) * mult;
            result.x = biggestVal;
            result.y = (m[1] + m[3]) * mult;
            result.z = (m[6] + m[2]) * mult;
            break;
        case 2:
            result.w = (m[6] - m[2]) * mult;
            result.x = (m[1] + m[3]) * mult;
            result.y = biggestVal;
            result.z = (m[5] + m[7]) * mult;
            break;
        case 3:
            result.w = (m[1] - m[3]) * mult;
            result.x = (m[6] + m[2]) * mult;
            result.y = (m[5] + m[7]) * mult;
            result.z = biggestVal;
            break;
    }
    return result;
};
MathLib.points2dShape = new vec3(2, 1, 1);

MathLib.makeBoundingBox = function(points, visibiltyMask) {
    if (points.length == 0) {
        return null;
    }

    var x0 = NaN;
    var y0 = NaN;
    var x1 = NaN;
    var y1 = NaN;

    for (var i = 1; i < points.length / 2; ++i) {
        if (visibiltyMask[i]) {
            if (isNaN(x0)) {
                x0 = points[i * 2];
                y0 = points[i * 2 + 1];

                x1 = points[i * 2];
                y1 = points[i * 2 + 1];
            } else {
                x0 = Math.min(x0, points[i * 2]);
                y0 = Math.min(y0, points[i * 2 + 1]);

                x1 = Math.max(x1, points[i * 2]);
                y1 = Math.max(y1, points[i * 2 + 1]);
            }
        }
    }

    if (isNaN(x0)) {
        return null;
    } else {
        return Rect.create(x0, x1, y0, y1);
    }
};

MathLib.isBoxIntersection = function(b1, b2) {
    return !(b1.left >= b2.right || b2.left >= b1.right || b1.bottom >= b2.top ||
                b2.bottom >= b1.top);
};

MathLib.getBoxArea = function(boundingBox) {
    return (boundingBox.right - boundingBox.left) * (boundingBox.top - boundingBox.bottom);
};

MathLib.getBoxIntersection = function(b1, b2) {
    var x0 = Math.max(b1.left, b2.left);
    var x1 = Math.min(b1.right, b2.right);
    var y0 = Math.max(b1.bottom, b2.bottom);
    var y1 = Math.min(b1.top, b2.top);

    return Rect.create(x0, x1, y0, y1);
};

MathLib.isValidAngle = function(angle) {
    return Math.abs(angle) <= Math.PI;
};

MathLib.isValidRotation = function(x, y, z) {
    return MathLib.isValidAngle(x) &&
        MathLib.isValidAngle(y) &&
        MathLib.isValidAngle(z);
};

MathLib.sigmoid = function(x) {
    return 1.0 / (1.0 + Math.exp(-x));
};

MathLib.makeIntrinsicsMatrix = function(cameraSize, verticalFOV) {
    /**
     * cameraSize is a vec2 where cameraSize = {x: height, y: width}
     */
    var width = cameraSize.x;
    var height = cameraSize.y;
    var x = width * 0.5;
    var y = height * 0.5;
    var aspect = width / height;
    var horizontalFOV = 2.0 * Math.atan(Math.tan(0.5 * verticalFOV) * aspect);
    var fx = x / Math.tan(horizontalFOV * 0.5);
    var fy = y / Math.tan(verticalFOV * 0.5);

    var intrinsics = new mat3();
    intrinsics.column0 = new vec3(fx, 0, x);
    intrinsics.column1 = new vec3(0, fy, y);
    intrinsics.column2 = new vec3(0, 0, 1);
    return intrinsics;
};

MathLib.rodriguesToQuat = function(rodrigues) {
    var rotation = quat.quatIdentity();
    var angle = Math.sqrt(rodrigues.x * rodrigues.x + rodrigues.y * rodrigues.y + rodrigues.z * rodrigues.z);
    if (angle > 0.005) {
        var axis = rodrigues.uniformScale(1.0 / angle);
        var c = Math.cos(0.5 * angle);
        var s = Math.sin(0.5 * angle);
        rotation.w = c;
        rotation.x = axis.x * s;
        rotation.y = axis.y * s;
        rotation.z = axis.z * s;
    }
    return rotation;
};

MathLib.fromEulerAngles = function(x, y, z) {
    x *= 0.5;
    y *= 0.5;
    z *= 0.5;

    var cx = Math.cos(x), cy = Math.cos(y), cz = Math.cos(z);
    var sx = Math.sin(x), sy = Math.sin(y), sz = Math.sin(z);

    var sxsy = sx * sy, cxcy = cx * cy, sxcy = sx * cy, cxsy = cx * sy;

    return new quat(
        cxcy * cz + sxsy * sz,
        sxcy * cz - cxsy * sz,
        cxsy * cz + sxcy * sz,
        cxcy * sz - sxsy * cz
    );
};

MathLib.fromEulerVec = function(v) {
    return quat.fromEulerAngles(v.x, v.y, v.z);
};

MathLib.rotatePoint = function(v, transform) {
    var q = MathLib.rodriguesToQuat(new vec3(-transform[0], -transform[1], -transform[2]));
    var fixQuat = MathLib.fromEulerVec(new vec3(0, 0, Math.PI / 2));
    q = q.multiply(fixQuat);

    var res = vec3.zero();
    res.x = v.x * (1 - 2 * q.y * q.y - 2 * q.z * q.z) + v.y * (2 * q.x * q.y + 2 * q.z * q.w) + v.z * (2 * q.x * q.z - 2 * q.y * q.w);
    res.y = v.x * (2 * q.x * q.y - 2 * q.z * q.w) + v.y * (1 - 2 * q.x * q.x - 2 * q.z * q.z) + v.z * (2 * q.y * q.z + 2 * q.x * q.w);
    res.z = v.x * (2 * q.x * q.z + 2 * q.y * q.w) + v.y * (2 * q.y * q.z - 2 * q.x * q.w) + v.z * (1 - 2 * q.x * q.x - 2 * q.y * q.y);

    return res;
};

MathLib.getCenter = function(points) {
    var center = vec3.zero();
    var size = points.length / 3;
    for (var i = 0; i < size; ++i) {
        center.x += points[i * 3];
        center.y += points[i * 3 + 1];
        center.z += points[i * 3 + 2];
    }
    center = center.uniformScale(1 / size);
    return center;
};

MathLib.centerModel = function(points, center) {
    var res = new Float32Array(points.length);
    var size = points.length / 3;

    for (var i = 0; i < size; ++i) {
        res[i * 3] = points[i * 3] - center.x;
        res[i * 3 + 1] = points[i * 3 + 1] - center.y;
        res[i * 3 + 2] = points[i * 3 + 2] - center.z;
    }

    return res;
};

MathLib.reflectX = function(points) {
    var res = new Float32Array(points.length);
    var size = points.length / 3;
    for (var i = 0; i < size; ++i) {
        res[i * 3] = -points[i * 3];
        res[i * 3 + 1] = points[i * 3 + 1];
        res[i * 3 + 2] = points[i * 3 + 2];
    }
    return res;
};

MathLib.reflectY = function(points) {
    var res = new Float32Array(points.length);
    var size = points.length / 3;
    for (var i = 0; i < size; ++i) {
        res[i * 3] = points[i * 3];
        res[i * 3 + 1] = -points[i * 3 + 1];
        res[i * 3 + 2] = points[i * 3 + 2];
    }
    return res;
};

module.exports.version = "1.0.2";

Object.keys(MathLib).forEach(function(val) {
    module.exports[val] = MathLib[val];
});
