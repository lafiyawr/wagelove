if (script.onAwake) {
	script.onAwake();
	return;
};
function checkUndefined(property, showIfData){
   for (var i = 0; i < showIfData.length; i++){
       if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]){
           return;
       }
   }
   if (script[property] == undefined){
      throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @input SceneObject podsSmall1
// @input SceneObject podsSmall2
// @input SceneObject podsSmall3
// @input SceneObject flower2Blossom
// @input SceneObject grass0
// @input SceneObject grass1
// @input SceneObject grass2
// @input SceneObject grass3
// @input SceneObject grass4
// @input SceneObject leaves1
// @input SceneObject leaves2
// @input SceneObject leaves3
// @input SceneObject leaves4
// @input SceneObject roots1
// @input SceneObject roots2
// @input SceneObject roots3
// @input SceneObject roots4
// @input SceneObject tendril1
// @input SceneObject tendril2
// @input SceneObject tendril3
// @input SceneObject tendrilYoung1
// @input SceneObject tendrilYoung2
var scriptPrototype = Object.getPrototypeOf(script);
if (!global.BaseScriptComponent){
   function BaseScriptComponent(){}
   global.BaseScriptComponent = BaseScriptComponent;
   global.BaseScriptComponent.prototype = scriptPrototype;
   global.BaseScriptComponent.prototype.__initialize = function(){};
   global.BaseScriptComponent.getTypeName = function(){
       throw new Error("Cannot get type name from the class, not decorated with @component");
   }
}
var Module = require("../../../../../../Modules/Src/Assets/LSTween.lspkg/Examples/Scripts/Plants Grow");
Object.setPrototypeOf(script, Module.PlantGrowthController.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("podsSmall1", []);
    checkUndefined("podsSmall2", []);
    checkUndefined("podsSmall3", []);
    checkUndefined("flower2Blossom", []);
    checkUndefined("grass0", []);
    checkUndefined("grass1", []);
    checkUndefined("grass2", []);
    checkUndefined("grass3", []);
    checkUndefined("grass4", []);
    checkUndefined("leaves1", []);
    checkUndefined("leaves2", []);
    checkUndefined("leaves3", []);
    checkUndefined("leaves4", []);
    checkUndefined("roots1", []);
    checkUndefined("roots2", []);
    checkUndefined("roots3", []);
    checkUndefined("roots4", []);
    checkUndefined("tendril1", []);
    checkUndefined("tendril2", []);
    checkUndefined("tendril3", []);
    checkUndefined("tendrilYoung1", []);
    checkUndefined("tendrilYoung2", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
