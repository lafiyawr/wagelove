/*

README: 3D Text to VFX with Hand Interactions
=============================================

This 3D Text to VFX asset allows you to spawn VFX on any Text3D object or on any custom mesh.
This asset comes with hand interactions. The behavior of the VFX on 3D text differs
depending on how far the hand is from the camera, and how open the hand is.


/Check Your Settings/
To start with, check the input fields on the Depth Stencil script.
Make sure your main camera is in the Camera input field.


/Hand Interaction/
How hand interactions work in this asset is determined by the Hand Controller script.
The further the hand is from the camera, the less the VFX responds to finger curl.
The closer the hand it to the camera, the more the VFX responds to finger curl. Within this state:
    - The more you curl you finger to grab the text, the denser and more stable the particles are.
    - The more you open your hand, the more dispersed and unstable the particles are.
You can change hand interactions by editing the Hand Controller script.
If you don't want the hand interactions, simply remove the 3D Hand Interactions object from the object panel.


/Change the VFX Color Ramp/
The color of the VFX is determined by the color ramp texture on the "VFX Depth Spawn" in the Resources panel.
Click on the "VFX Depth Spawn" in the Resources panel and view the color ramp texture in the Inspector panel.
You can change color of the VFX by replacing the color ramp texture named "PurpleBlue_Ramp" with your own.


/Edit inputs in the VFX Controller/
If you click on the "VFX Controller" in the "3D Text to VFX" object, you will see available inputs in the inspecor panel that can be edited to change the VFX behavior.
    - "Curl Coefficient" determines how significantly the finger curl affects the particles.
    - "Trigger Range" determines how close the hand needs to be to the camera to trigger the blown away effect.
    - "Strength Scale" determines the speed of the blown away effect.
    - "Spread Direction" determines the direction of the blown away effect.


/Edit 3D Text Properties/
Click on "3D Text to VFX Asset -> 3D Text to VFX -> Text3D Object" in the Objects panal.
You can see the 3D text properties in the Inspector panel.
You can edit the text here, and change the font, extrusion depth, etc.
If you need the 3D text to be visible, replace the Transparent material with a visible material.

*/