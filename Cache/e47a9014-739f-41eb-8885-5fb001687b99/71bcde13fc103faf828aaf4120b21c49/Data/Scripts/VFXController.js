// VFXController.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Provide available input fields for VFX control in the Inspector panel


// -----JS CODE-----

//@input Component.ScriptComponent setFollowHandHelper 
//@input Asset.VFXAsset vfx {"label" : "VFX"}
//@input float curlCoefficient {"widget":"slider", "min":0.0, "max":3.0, "step":0.1}
//@input int triggerRange = 45 {"min":40.0, "max":1000.0, "step":1}
//@input int strengthScale = 100 {"min":0.0, "max":1000.0, "step":1}
//@input vec3 spreadDirection;

var curlOffset = 7;
var curlThreshold = 12;

if (!script.setFollowHandHelper ){
    throw new Error ("WARNING: Set Follow Hand component has no script as input, please choose required script");
}
if (!script.vfx ){
    throw new Error ("WARNING: VFX has no VFX component as input, please select a VFX component");
}

script.createEvent("UpdateEvent").bind(function () {

    var targetPos = script.setFollowHandHelper.api.targetPos;
    var curl = script.setFollowHandHelper.api.curl;
    var randomhMapValueX = 0;
    var randomhMapValueY = 0;
    var randomhMapValueZ = 0;
    
    if(targetPos == undefined){
        targetPos = new vec3(0,0,0);
    }
    
    //targetPos show closer
    if (targetPos.z > - script.triggerRange ){
        var curlDegree = curl - curlOffset - script.curlCoefficient;
        
        if(curlDegree < 0){
            curlDegree = 0;
        }
        
        var forceMapValueX = (curlDegree)*1.25; 
        var forceMapValueY = (curlDegree)*1.25;
        var forceMapValueZ = (curlDegree)*0.625;
        
        script.vfx.properties["direction"] = script.spreadDirection;      
        script.vfx.properties["forceScale"] = new vec3(forceMapValueX,forceMapValueY,forceMapValueZ);
        
        if(curl > curlThreshold){
            script.vfx.properties["strengthScale"] = script.strengthScale;
        }
        
        else {
            script.vfx.properties["strengthScale"] = 0;
        }                
    }

    if (targetPos.z <= -script.triggerRange ) {
            randomhMapValueX = 0;
            randomhMapValueY = 0;
            randomhMapValueZ = 0;
            script.vfx.properties["forceScale"] = new vec3(0,0,0);
            script.vfx.properties["strengthScale"] = 0;
            script.vfx.properties["randomPosition"] = new vec3(randomhMapValueX,randomhMapValueY,randomhMapValueZ);           
    }

});
