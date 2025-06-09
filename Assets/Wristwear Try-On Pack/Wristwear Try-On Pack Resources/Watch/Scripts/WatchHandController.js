/*
WatchHandController.js
Version: 1.0.0
Description: Rotates two SceneObjects according to the current hour and minute.
*/

//@input SceneObject hourHand;
//@input SceneObject minuteHand;

// Get the time
var today = new Date();

// hour is an int between 0 and 11
var hour = today.getHours() % 12;
// minute is an int between 0 and 59
var minute = today.getMinutes();

// get transform of hour and minute hand
var hourHandTransform = script.hourHand.getTransform();
var minuteHandTransform = script.minuteHand.getTransform();

// lerp to fit in a 0 to 360 range
var hourInDegrees = lerp(0, 360, hour / 12) + lerp(0, 30, minute / 60);
var minuteInDegrees = lerp(0, 360, minute / 60);

// convert to radians
var hourInRadians = hourInDegrees * MathUtils.DegToRad;
var minuteInRadians = minuteInDegrees * MathUtils.DegToRad;

// Axis to rotate around
var axis = vec3.back();

rotateWatchHands(hourInRadians, hourHandTransform);
rotateWatchHands(minuteInRadians, minuteHandTransform);

function lerp(a, b, t) {
    return (1 - t) * a + t * b;    
}

function rotateWatchHands(radians, transform) {
    // Rotation we will apply to the object's current rotation
    var rotationToApply = quat.angleAxis(radians, axis);
    
    // Get the object's current world rotation
    var oldRotation = transform.getWorldRotation();
    
    // Get the new rotation by rotating the old rotation by rotationToApply
    var newRotation = rotationToApply.multiply(oldRotation);
    
    // Set the object's world rotation to the new rotation
    transform.setWorldRotation(newRotation);
}