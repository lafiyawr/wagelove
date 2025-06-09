// DepthStencil.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Pass data of 3D text or custom mesh to VFX


// -----JS CODE-----

// @input Component.Camera camera
// @input Component.VFXComponent[] vfxComponents {"label" : "VFX Component"}
// @input Asset.Material depthNormalMat
// @input Asset.Material depthViz

if (!script.camera){    
    print("No camera input, please select your camera");
} 


if (script.camera && script.camera.renderTarget) {

    if (script.camera.supportedColorRenderTargetCount > 1) {

        script.camera.renderTarget.control.msaa = false;

        var depthStencilTexture = scene.createDepthStencilRenderTargetTexture();
        script.camera.depthStencilRenderTarget.depthClearOption = DepthClearOption.CustomValue;
        script.camera.depthStencilRenderTarget.targetTexture = depthStencilTexture;
        script.camera.depthStencilRenderTarget.clearDepth = 1.0;
               
        for (var i = 0; i < script.vfxComponents.length; i++) {
            script.vfxComponents[i].asset.properties.depthTexture = depthStencilTexture;
        }

        script.depthNormalMat.mainPass.depthTexture = depthStencilTexture;

        script.depthViz.mainPass.baseTex = depthStencilTexture;
 
    } 
}