// GenericHelperScript.js
// Version: 0.0.1
// Event: Lens Initialized
// Description: Provides multiple helpful functions 

var DEBUG_GLOBAL = 0;  // 0: no output    1: print important messages   2: print all messages

function myround(num, decimals) {
    var factor = Math.pow(10, decimals);
    return Math.round(num * factor) / factor;
}

function printArray(array) {
    var my_str = "[";
    for (var i = 0; i < array.length; ++i) {
        my_str += String(myround(array[i], 3)) + ", ";
    }
    my_str += "]";
    print(my_str);
}

function printTensor2D(array, dims) {
    print("TENSOR: " + dims);
    for (var row = 0; row < dims[0]; row++) {
        var my_row = "row "+ row + ": [";
        for (var col = 0; col < dims[1]; col++) {
            var ind_1d = index_2d(row, col, dims);
            my_row += String(myround(array[ind_1d], 3)) + ", ";
        }
        my_row += "]";
        print(my_row);
    }
    print("END TENSOR");
}

function printDebug(msg, level, cfg) {
    /**
     * variable cfg.DEBUG_GLOBAL can be used to print all messages with debug level lower or equal
     *
     * msg: the message to print
     * detail_level: 1->4   can be used to finetune which messages will be printed
     */
    if (level <= DEBUG_GLOBAL) {
        print(msg);
    }
}

function argsortThreshold(array, ascending, lower_threshold) {
    /**
     Return indices of sorted values, but also filter the ones with a value lower that lower_threshold
     array: array of values
     ascending: if true sorting is ascending
     lower_threshold: if not null, use to filter all values lower than the lower_threshold
     return argsort indices
     */
    var idx_values_pairs = [];
    var idx = [];
    var i;
    for (i = 0; i < array.length; i++) {
        if (lower_threshold !== null) {
            if (array[i] < lower_threshold) {
                continue;
            }
        }
        idx_values_pairs.push([i, array[i]]);  // Add index column for sorting
    }
    idx_values_pairs.sort(function(a, b) {
        if (ascending) {
            return a[1] - b[1];
        } else {
            return b[1] - a[1];
        }
    });
    for (i = 0; i < idx_values_pairs.length; i++) {
        idx[i] = idx_values_pairs[i][0];
    }
    return idx;
}

function index_2d(ind_0, ind_1, dims) {
    /**
    converts 2d indices to 1d index for flat array
     ind_0 -> row index
     ind_1 -> col index
     dims -> list of sizes for each dimension (height, width)

     */
    return ind_0 * dims[1] + ind_1;
}

function index_3d(ind_0, ind_1, ind_2, dims) {
    /**
    converts 3d indices to 1d index for flat array
     ind_0 -> row index
     ind_1 -> col index
     ind_2 -> depth index
     dims -> list of sizes for each dimension (height, width, channels)
     */
    return ind_0 * dims[1] * dims[2] + ind_1 * dims[2] + ind_2;
}

function sample_tensor2d_at_position(tensor, dims, xr, yr, stride, channel) {
    /**
    samples tensor array at (x_r, y_r) position. If "tensor" is 2d then a number is returned.
     If it's 3d then a vector is returned.
     dims -> list of sizes for every dimension of the array
     y_r -> y position
     x_r -> x position
     stride -> output_heatmap stride compared to input image
     channel -> if not null then only sample at one channel
     */

    var scale = 1.0 / stride;
    xr = scale * xr;
    yr = scale * yr;

    var x0 = Math.floor(xr);
    var y0 = Math.floor(yr);
    var x1 = x0 + 1;
    if (x0 === xr) {
        x1 = x0;
    }
    var y1 = y0 + 1;
    if (y0 === yr) {
        y1 = y0;
    }

    var xlerp = x0 + 1 - xr;
    var ylerp = y0 + 1 - yr;

    var x0y0 = xlerp * ylerp;
    var x0y1 = xlerp * (1 - ylerp);
    var x1y0 = (1 - xlerp) * ylerp;
    var x1y1 = (1 - xlerp) * (1 - ylerp);

    var ndim = dims.length;

    if (ndim === 2) {
        // 2D SAMPLING
        var out = x0y0 * tensor[index_2d(y0, x0, dims)]
                + x0y1 * tensor[index_2d(y1, x0, dims)]
                + x1y0 * tensor[index_2d(y0, x1, dims)]
                + x1y1 * tensor[index_2d(y1, x1, dims)];
        return out;
    } else if (ndim == 3) {
        if (channel != null) {  // sample single value from one channel
            const sampled_value = x0y0 * tensor[index_3d(y0, x0, channel, dims)]
                    + x0y1 * tensor[index_3d(y1, x0, channel, dims)]
                    + x1y0 * tensor[index_3d(y0, x1, channel, dims)]
                    + x1y1 * tensor[index_3d(y1, x1, channel, dims)];
            return sampled_value;
        } else {  // sample vector at 2d location
            var num_channels = dims[2];
            var sampled_vec = Array(num_channels);
            for (var k = 0; k < num_channels; k++) {
                sampled_vec[k] = x0y0 * tensor[index_3d(y0, x0, k, dims)]
                    + x0y1 * tensor[index_3d(y1, x0, k, dims)]
                    + x1y0 * tensor[index_3d(y0, x1, k, dims)]
                    + x1y1 * tensor[index_3d(y1, x1, k, dims)];
            }
            return sampled_vec;
        }
    } else {
        print("only supports arrays with number of dimensions in [2, 3]");
    }
}

function add_scalar_to_tensor_window(tensor, dims, scalar, x1,y1,x2,y2) {
    /**
     Adds constant scalar value to window of tensor

     tensor -> input tensor (results are added in place)
     dims -> list of sizes for every dimension of the array
     scalar -> constant value to add
     x1 -> starting column of window
     y1 -> starting row of window
     x2 -> ending (including) column of window
     y2 -> ending (including) row of window

     */

    for (var row = y1; row <= y2; row++) {
        for (var col = x1; col <= x2; col++) {
            tensor[index_2d(row, col, dims)] += scalar;
        }
    }
}

function get_argmax_for_multichannel_array(tensor, dims) {
    /**
     * Math.argmax returns the indices of the maximum values along an the channels of inTensor. However what we want
     * and achieve with this function is the maximum value along all channels for each of the pixels
     *
     * dims[0] -> num_of_rows
     * dims[1] -> num_of_cols
     * dims[2] -> num_of_channels
     */


    var argmaxTensor = new Float32Array(dims[0]*dims[1]);
    var tubeTensor = new Float32Array(dims[2]);
    var tubeTensorShape = new vec3(dims[2], 1, 1);
    var resultsTensor = new Uint32Array(2);

    for (var row = 0; row < dims[0]; row++) {
        for (var col = 0; col < dims[1]; col++) {
            for (var k = 0; k < dims[2]; k++) {
                tubeTensor[k] = tensor[index_3d(row, col, k, dims)];
            }
            TensorMath.argMax(tubeTensor, tubeTensorShape, resultsTensor);
            var max_value = resultsTensor[0];
            argmaxTensor[index_2d(row, col, dims)] = max_value;
        }
    }
    return argmaxTensor;
}



function compute_rotation_matrix_from_ortho6d(poses) {
    /**
     * poses: [6,] vector
     *
     * returns:
     *      matrix: [3,3] rotation matrix
     */
    //    print(poses);
    var x_raw_vec = new vec3(poses[0], poses[1], poses[2]);
    var y_raw_vec = new vec3(poses[3], poses[4], poses[5]);

    var x_raw_norm = x_raw_vec.length;
    var x_vec = x_raw_vec.uniformScale(1/(x_raw_norm + 1e-8));

    var z_raw_vec = x_vec.cross(y_raw_vec);
    var z_raw_norm = z_raw_vec.length;
    var z_vec = z_raw_vec.uniformScale(1/(z_raw_norm + 1e-8));

    var y_vec = z_vec.cross(x_vec);

    var matrix = new mat3();
    matrix.column0 = x_vec;
    matrix.column1 = y_vec;
    matrix.column2 = z_vec;

    return matrix;
}

function setArrayToScalar(array, scalar) {
    for (var i = 0; i < array.length; ++i) {
        array[i] = scalar;
    }
}

function person_agnostic_crop(w, h, crop_width, crop_height) {
    var aspect_ratio = crop_width / crop_height;
    // Compute the smallest box that has the same aspect ratio as the
    // crop and fully contains the image. This will be larger (or equal in the extreme case) than the image

    var new_w = w;
    var new_h = h;
    if (w > aspect_ratio * h) {
        new_h = w / aspect_ratio;
    } else {
        new_w = h * aspect_ratio;
    }

    var c_x = w/2;
    var c_y = h/2;

    return [c_x, c_y, new_w, new_h];
}

function tex2img_coords(texture_vec, w, h, crop_width, crop_height) {
    // TEXTURE is the size of the input to the neural network. IMAGE is the input from the camera device
    // texture_vec: vec2 containing [x,y] coordinates in texture space
    // returns tuple containing [x,y] coordinates in image space

    var new_size_cwh = person_agnostic_crop(w, h, crop_width, crop_height);
    var new_w = new_size_cwh[2];
    var new_h = new_size_cwh[3];

    var x = texture_vec.x;
    var y = texture_vec.y;

    var img_x = (x - crop_width/2)*new_w/crop_width + w/2; // OR (x/crop_width - 0.5)*new_w + w/2
    var img_y = (y - crop_height/2)*new_h/crop_height + h/2; // OR (y/crop_height - 0.5)*new_h + h/2

    return new vec2(img_x, img_y);
}

function img2tex_coords(img_coords, w, h, crop_width, crop_height) {
    // TEXTURE is the size of the input to the neural network. IMAGE is the input from the camera device
    // img_coords: tuple containing [x,y] coordinates in image space
    // returns tuple containing [x,y] coordinates in texture space

    var new_size_cwh = person_agnostic_crop(w, h, crop_width, crop_height);
    var new_w = new_size_cwh[2];
    var new_h = new_size_cwh[3];

    var x = img_coords[0];
    var y = img_coords[1];

    var text_x = (x - w/2)*crop_width/new_w + crop_width/2; // OR (x/new_w - 0.5)*w + crop_width/2
    var text_y = (y - h/2)*crop_height/new_h + crop_height/2; // OR (y/new_h - 0.5)*h + crop_height/2

    return [text_x, text_y];
}

function get_transform(input_w, input_h, crop_width, crop_height) {
    /**
     *:param input_w input_image width
     *:param input_h: input_image height
     *:param crop_width:  crop_width
     *:param crop_height:  crop_height
     *:return:
     *   transformation from input_image coordinates to crop_image coordinates.
     *   2x3
     */

    var new_size_cwh = person_agnostic_crop(input_w, input_h, crop_width, crop_height);

    var c_x = new_size_cwh[0];
    var c_y = new_size_cwh[1];

    //var src_w = new_size_cwh[2];
    var src_h = new_size_cwh[3];

    var dst_w = crop_width;
    var dst_h = crop_height;

    var r = dst_h / src_h;  //## should also be equal to dst_w/src_w

    var trans = [[r, 0, -r * c_x + dst_w / 2], [0, r, -r * c_y + dst_h / 2]];

    return trans;
}

function compute_transform_jacobian(trans) {
    return trans[0][0] * trans[1][1] - trans[0][1] * trans[1][0];
}

function transform_intrinsics(trans, intrinsics) {
    /**
     * trans: 2x3 array of arrays
     * intrinsics: 1x4 array containing [cx, cy, fx, fy]
     * return:
     *      transformed_intrinsics: 1x4 array containing the new [cx, cy, fx, fy]
     */

    var jacobian = compute_transform_jacobian(trans);
    var scale = Math.sqrt(Math.abs(jacobian));
    var transformed_intrinsics = [];
    transformed_intrinsics[0] = intrinsics[0] * scale;
    transformed_intrinsics[1] = intrinsics[1] * scale;

    var cx = intrinsics[2];
    var cy = intrinsics[3];

    transformed_intrinsics[2] = trans[0][0]*cx + trans[0][1]*cy + trans[0][2];
    transformed_intrinsics[3] = trans[1][0]*cx + trans[1][1]*cy + trans[1][2];

    return transformed_intrinsics;
}

function addNewTextObjectToScreenTransform(screenTransform, objectName, text, screenPosition2D, screenDimensions2D, renderMeshAsset, material) {
    // Get SceneObject containing the input ScreenTransform Component
    var screenTransformObj = screenTransform.getSceneObject();
    var screenTransformLayer = screenTransformObj.layer;

    // Create new Object and set the screenTransform object to be the parent
    var newTextObject = global.scene.createSceneObject(objectName);
    newTextObject.setParent(screenTransformObj);

    // Set to same layer as screen transform object and enable object
    newTextObject.layer = screenTransformLayer;
    newTextObject.enabled = true;

    // Add Text and ScreenTransform Components to the new Object (that combination is equivalent to ScreenText)
    var newScreenTextComp = newTextObject.createComponent("Component.Text");
    var newScreenTextTransf = newTextObject.createComponent("Component.ScreenTransform");

    // Set text
    newScreenTextComp.text = text;

    newScreenTextComp.size = 30;

    // Normalize input position 2D
    var position2D_norm = new vec2(screenPosition2D.x/screenDimensions2D.x, screenPosition2D.y/screenDimensions2D.y);
    var anchor2d_pos = screenTransform.screenPointToParentPoint(position2D_norm);

    // Set new normalised position
    newScreenTextTransf.anchors.setCenter(anchor2d_pos);

    if (renderMeshAsset) {
        // Create Sphere ( need to add 2 assets as inputs, a Sphere Render Mash and a Material)
        var newSphereObject = global.scene.createSceneObject(objectName + "_sphere");
        newSphereObject.setParent(newTextObject);
        var renderMeshVisualComponent = newSphereObject.createComponent("Component.RenderMeshVisual");

        var renderMeshVisualTransf = newSphereObject.getTransform();
        var scale = new vec3(0.05, 0.05, 0.05);
        renderMeshVisualTransf.setLocalScale(scale);
        newSphereObject.layer = screenTransformLayer;
        newSphereObject.enabled = true;
        renderMeshVisualComponent.mesh = renderMeshAsset; //script.sphereRenderMesh;
        renderMeshVisualComponent.mainMaterial = material; //script.sphereMaterial;
    }

    return newTextObject;
}

function num_to_rgb(val, max_val) {
    /***
     * maps a float value to a RGB values
     *
     * val: float value that will be mapped to RGB
     * max_val: maximum possible value for val
     */
    var angle = val/max_val * 2 * Math.PI;
    var r = Math.round(Math.sin(angle + 0) * 127 + 128);
    var g = Math.round(Math.sin(angle + Math.PI/2) * 127 + 128);
    var b = Math.round(Math.sin(angle + Math.PI) * 127 + 128);
    return [r, g, b];
}

function num_to_rgb_hot(val) {
    /***
     * maps a float value to a RGB values
     *
     * val: float value that will be mapped to RGB
     * max_val: maximum possible value for val
     */
    var range1 = 0.35;
    var range2 = 0.7;

    var color = [0, 0, 0];
    if (0 <= val < range1) {
        color = [val / range1 * 255, 0, 0];
    } else if (range1 <= val < range2) {
        color = [255, (val - range1) / (range2 - range1) * 255, 0];
    } else if (range2 < val) {
        color = [255, 255, (val - range2) / (1 - range2) * 255];
    }
    return color;
}


function build_ML_generic(mlComponent, input_texture, strech_flag) {
    /**
     * This function builds the ML model from the asset, using the model's inputs and outputs. Works with
     * one input and an arbitrary number of outputs and output resolutions. Using the input argument
     * stretch_flag we can set whether the input image will be stretched to the model size or just
     * resized and padded. The current implementation only works with a model that has only takes as input
     * one texture
     *
     * (Based on the code provided here:
     * https://docs.google.com/document/d/101S_wiJ1atYZZVQxbuoGytyk_787I___D-ficS0v4I4/edit#bookmark=id.lc2kxkh2bken)
     */
    var list_of_model_inputs_outputs = [];

    var list_of_model_inputs = mlComponent.getInputs();
    var first_input_name = list_of_model_inputs[0].name;

    var imageInputShape = mlComponent.getInput(first_input_name).shape;
    var transformer = MachineLearning.createTransformerBuilder().setStretch(strech_flag).build();
    var imageInput = MachineLearning.createInputBuilder().setName(first_input_name)
        .setShape(imageInputShape).setInputTexture(input_texture)
        .setTransformer(transformer).build();
    list_of_model_inputs_outputs.push(imageInput);

    var list_of_model_outputs = mlComponent.getOutputs();

    for (var i = 0; i < list_of_model_outputs.length; i++) {
        var cur_output_name = list_of_model_outputs[i].name;
        var cur_output_shape = mlComponent.getOutput(cur_output_name).shape;
        var cur_output = MachineLearning.createOutputBuilder().setName(cur_output_name)
            .setShape(cur_output_shape).setOutputMode(MachineLearning.OutputMode.Data).build();
        list_of_model_inputs_outputs.push(cur_output);
    }
    mlComponent.renderOrder = 1;
    mlComponent.inferenceMode = MachineLearning.InferenceMode.Auto;
    mlComponent.build(list_of_model_inputs_outputs);
    return list_of_model_inputs_outputs;
}


function get_padding_for_output_tensor(input_image_width, input_image_height, output_tensor_width, output_tensor_height) {
    /**
     * This function is used to get the padding that is added to the input image to make it fit
     * the input dimensions of the ML model. Can also be used to pad the output for visualisation purposes.
     * (e.g. display segmentation on screen)
     *
     * input_image_width: width of input image (before input transform)
     * input_image_height: height of input image (before input transform)
     * output_texture_width: width of output tensor
     * output_texture_height: width of output tensor
     *
     */

    var img_top_left_on_texture = img2tex_coords([0, 0], input_image_width, input_image_height, output_tensor_width, output_tensor_height);
    var img_bottom_right_on_texture = img2tex_coords([input_image_width, input_image_height], input_image_width, input_image_height, output_tensor_width, output_tensor_height);

    // coordinates of segmDataProportionate within segmData
    const padding_xywh = [
        Math.round(img_top_left_on_texture[0]),
        Math.round(img_top_left_on_texture[1]),
        Math.round(img_bottom_right_on_texture[0]) - Math.round(img_top_left_on_texture[0]),
        Math.round(img_bottom_right_on_texture[1]) - Math.round(img_top_left_on_texture[1])
    ] ;
    return padding_xywh;
}


const ProportionateTexturePainter = function(input_image_width, input_image_height, output_tensor_width, output_tensor_height) {
    /**
     * Given an input image size and the output of a texture, this class is used to visualize the output and add
     * padding so that it properly aligns with the input image size when fit to image is selected.
     */
    this.input_image_width = input_image_width;
    this.input_image_height = input_image_height;
    this.output_tensor_width = output_tensor_width;
    this.output_tensor_height = output_tensor_height;
    // coordinates of segmDataProportionate within segmData
    this.padding_xywh = get_padding_for_output_tensor(
        this.input_image_width, this.input_image_height,
        this.output_tensor_width, this.output_tensor_height
    );
    this.channels = 4; //RGBA
    this.segmTexture = ProceduralTextureProvider.create(this.output_tensor_width, this.output_tensor_height, Colorspace.RGBA);
    this.segmData = new Uint8Array(this.output_tensor_width * this.output_tensor_height * this.channels);
    this.segmTextureProportionate = ProceduralTextureProvider.create(
        this.padding_xywh[2], this.padding_xywh[3], Colorspace.RGBA
    );
    this.segmDataProportionate = new Uint8Array(this.padding_xywh[2] * this.padding_xywh[3] * this.channels);
};

ProportionateTexturePainter.prototype = {

    setPixelColor: function(x, y, r, g, b, a) {
        /**
         * x: pixel coordinate (column)
         * y: pixel coordinate (row)
         * r: red channel [0->255]
         * g: green channel [0->255]
         * b: blue channel [0->255]
         * a: alpha channel [0->255]
         */
        // Calculate index
        var index = ((this.output_tensor_height - y) * this.output_tensor_width + x) * this.channels;
        this.segmData[index] = r;
        this.segmData[index+1] = g;
        this.segmData[index+2] = b;
        this.segmData[index+3] = a;
    },

    setImage(inputImage) {
        this.segmTexture.control.setPixels(
            0, 0,
            this.output_tensor_width, this.output_tensor_height,
            this.segmData
        );

        /** COPY from segmTexture to segmTextureProportionate */
        this.segmTexture.control.getPixels(
            this.padding_xywh[0], this.padding_xywh[1],
            this.padding_xywh[2], this.padding_xywh[3],
            this.segmDataProportionate
        );
        this.segmTextureProportionate.control.setPixels(
            0, 0,
            this.padding_xywh[2], this.padding_xywh[3],
            this.segmDataProportionate
        );

        inputImage.mainPass.baseTex = this.segmTextureProportionate;
    }
};

module.exports.myround = myround;
module.exports.printArray = printArray;
module.exports.printTensor2D = printTensor2D;
module.exports.argsortThreshold = argsortThreshold;
module.exports.index_2d = index_2d;
module.exports.index_3d = index_3d;
module.exports.sample_tensor2d_at_position = sample_tensor2d_at_position;
module.exports.get_argmax_for_multichannel_array = get_argmax_for_multichannel_array;
module.exports.compute_rotation_matrix_from_ortho6d = compute_rotation_matrix_from_ortho6d;
module.exports.setArrayToScalar = setArrayToScalar;
module.exports.add_scalar_to_tensor_window = add_scalar_to_tensor_window;
module.exports.person_agnostic_crop = person_agnostic_crop;
module.exports.tex2img_coords = tex2img_coords;
module.exports.img2tex_coords = img2tex_coords;
module.exports.get_transform = get_transform;
module.exports.transform_intrinsics = transform_intrinsics;
module.exports.printDebug = printDebug;
module.exports.addNewTextObjectToScreenTransform = addNewTextObjectToScreenTransform;
module.exports.num_to_rgb = num_to_rgb;
module.exports.num_to_rgb_hot = num_to_rgb_hot;
module.exports.build_ML_generic = build_ML_generic;
module.exports.ProportionateTexturePainter = ProportionateTexturePainter;