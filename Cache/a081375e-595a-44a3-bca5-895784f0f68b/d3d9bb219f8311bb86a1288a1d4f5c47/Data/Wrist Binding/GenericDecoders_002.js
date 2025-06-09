// GenericDecoders.js
// Version: 0.0.2
// Event: Lens Initialized
// Description: Provides locations for wrist/foot tracking

const MathLib = require("./NewJSMathLibrary_102");
const HelperLib = require("./GenericHelperScript_001");

function clip(x, a, b) {
    return Math.max(a, Math.min(x, b));
}

function logits(x) {
    return Math.log(x / (1.0 - x));
}

ShoeCenterDetectDecoder = function (modelConfig){
    this.cfg = modelConfig;
    this.min_logit =  logits(this.cfg.hysteresis_center_lb);
    this.heatmapWidth = null;
    this.heatmapHeight = null;
    this.maximumNumFeet = modelConfig.maximumNumFeet;
}

ShoeCenterDetectDecoder.prototype = {

    decode: function(mlComponent, annotation){

        var center_heatmap = mlComponent.getOutput(this.cfg.outputCenterClassName).data;
        var center_heatmap_shape = mlComponent.getOutput(this.cfg.outputCenterClassName).shape;
        this.heatmapWidth = center_heatmap_shape.x;
        this.heatmapHeight = center_heatmap_shape.y;

        var center_short_offset = mlComponent.getOutput(this.cfg.outputCenterOffsetName).data;

        const xy_arrays = this.compute_proposed_center_location_coords(center_heatmap, center_short_offset);

        const kept = this.get_keep_indices(center_heatmap, xy_arrays);

        annotation['instances'] = this.create_centers(center_heatmap, xy_arrays, kept);

        return annotation
    },

    compute_proposed_center_location_coords: function (center_heatmap, center_short_offset){

        // SORT IN ASCENDING ORDER THE HEATMAPS AND FILTER THE VALUES LOWER THAN MIN_LOGIT

        var x_array = Array(center_heatmap.length);
        var y_array = Array(center_heatmap.length);

        for (var i = 0; i < center_heatmap.length; i++) {
            if (center_heatmap[i] < this.min_logit) {
                continue;
            }

            var row = Math.floor(i / this.heatmapWidth);
            var col = i % this.heatmapWidth;
            var x_temp = col * (this.cfg.inputWidth - 1)/ (this.heatmapWidth - 1)        // col * 256/63
            var y_temp = row * (this.cfg.inputHeight - 1)/ (this.heatmapHeight - 1)      // row * 256/63

            x_array[i] = clip(x_temp , 0, this.cfg.inputWidth - 1);
            y_array[i] = clip(y_temp , 0, this.cfg.inputHeight - 1);
        }
        return {"x": x_array, "y": y_array}
    },

    get_keep_indices: function (center_heatmap, xy_arrays){
        var indices = HelperLib.argsortThreshold(center_heatmap, true, this.min_logit);
        /// NMS SUPPRESSION. Array indices is the input and the output is stored in kept_indices:

        var kept_indices = Array(this.cfg.maximumNumFeet);
        var num_kept = 0;
        var idx_len = indices.length;

        while (idx_len > 0) {

            // Select element with the highest score
            idx_len--;
            var curIndex = indices[idx_len];
            var curX = xy_arrays.x[curIndex];
            var curY = xy_arrays.y[curIndex];

            kept_indices[num_kept] = curIndex;
            num_kept++;
            if (num_kept >= this.cfg.maximumNumFeet) {
                break;
            }
            if (idx_len === 0) {
                break;
            }
            // Only keep the centers that are further than the nms_radius from the current active center
            // with the following approach we avoid re-assignign a new table at every iteration which might
            // make things faster
            var counter = 0;
            for (var j = 0; j < idx_len; j++) {
                var innerIndex = indices[j];
                var innerX = xy_arrays.x[innerIndex];
                var innerY = xy_arrays.y[innerIndex];

                var dist = Math.sqrt((innerX - curX) ** 2 + (innerY - curY) ** 2)

                if (dist > this.cfg.nms_radius) {
                    indices[counter] = innerIndex;
                    counter++;
                }
            }
            idx_len = counter;
        }
        return {"kept_indices": kept_indices, "num_kept": num_kept}
    },

    create_centers: function (center_heatmap, xy_arrays, kept){
        var centers = [];
        for (var k = 0; k < this.maximumNumFeet; k++) {
            var curIndex = kept.kept_indices[k];
            var curX = xy_arrays.x[curIndex];
            var curY = xy_arrays.y[curIndex];
            var curScore = MathLib.sigmoid(center_heatmap[curIndex]);

            if (curScore < this.min_logit){
                continue;
            }
            centers.push({
                x: curX,
                y: curY,
                score: curScore
            }
            );



        }
        return centers;
    }

}

ShoeCenterGaussDetectDecoder = function (modelConfig){
    this.cfg = modelConfig;
    this.min_logit = logits(this.cfg.hysteresis_center_lb);
}

ShoeCenterGaussDetectDecoder.prototype = {

    decode_centers: function(mlComponent, annotation){

        var center_heatmap = mlComponent.getOutput(this.cfg.outputCenterClassName).data;

        const xy_arrays = this.compute_proposed_center_location_coords(center_heatmap);

        const kept = this.get_keep_indices(center_heatmap, xy_arrays);

        annotation['instances'] = this.create_centers(center_heatmap, xy_arrays, kept);

        return annotation;
    },

    compute_proposed_center_location_coords: function (center_heatmap){

        // SORT IN ASCENDING ORDER THE HEATMAPS AND FILTER THE VALUES LOWER THAN MIN_LOGIT

        var x_array = Array(center_heatmap.length);
        var y_array = Array(center_heatmap.length);

        for (var i = 0; i < center_heatmap.length; i++) {
            if (center_heatmap[i] < this.min_logit) {
                continue;
            }

            var row = Math.floor(i / this.cfg.inputWidth);
            var col = i % this.cfg.inputWidth;
            var x_temp = col * this.cfg.inputWidth / (this.cfg.inputWidth - 1)        // col * 256/63
            var y_temp = row * this.cfg.inputHeight / (this.cfg.inputHeight - 1)      // row * 256/63

            x_array[i] = clip(x_temp , 0, this.cfg.inputWidth - 1);
            y_array[i] = clip(y_temp , 0, this.cfg.inputHeight - 1);

        }
        return {"x": x_array, "y": y_array}
    },

    get_keep_indices: function (center_heatmap, xy_arrays){
        var indices = HelperLib.argsortThreshold(center_heatmap, true, this.min_logit);
        /// NMS SUPPRESSION. Array indices is the input and the output is stored in kept_indices:

        var kept_indices = Array(this.cfg.maximumNumFeet);
        var num_kept = 0;
        var idx_len = indices.length;

        while (idx_len > 0) {

            // Select element with the highest score
            idx_len--;
            var curIndex = indices[idx_len];
            var curX = xy_arrays.x[curIndex];
            var curY = xy_arrays.y[curIndex];

            kept_indices[num_kept] = curIndex;
            num_kept++;
            if (num_kept >= this.cfg.maximumNumFeet) {
                break;
            }
            if (idx_len === 0) {
                break;
            }
            // Only keep the centers that are further than the nms_radius from the current active center
            // with the following approach we avoid re-assignign a new table at every iteration which might
            // make things faster
            var counter = 0;
            for (var j = 0; j < idx_len; j++) {
                var innerIndex = indices[j];
                var innerX = xy_arrays.x[innerIndex];
                var innerY = xy_arrays.y[innerIndex];

                var dist = Math.sqrt((innerX - curX) ** 2 + (innerY - curY) ** 2)

                if (dist > this.cfg.nms_radius) {
                    indices[counter] = innerIndex;
                    counter++;
                }
            }
            idx_len = counter;
        }
        return {"kept_indices": kept_indices, "num_kept": num_kept}
    },

    create_centers: function (center_heatmap, xy_arrays, kept){
        var centers = [];
        for (var k = 0; k < kept.num_kept; k++) {
            var curIndex = kept.kept_indices[k];
            var curX = xy_arrays.x[curIndex];
            var curY = xy_arrays.y[curIndex];
            var curScore = MathLib.sigmoid(center_heatmap[curIndex]);

            if (curScore < this.min_logit){
                continue;
            }
            centers.push({
                x: this.cfg.stride * curX,
                y: this.cfg.stride * curY,
                score: curScore
            });

        }
        return centers;
    }

}

CenterKeypointMatchingDecoder = function (modelConfig){
    this.cfg = modelConfig;
    this.SIZE = modelConfig.keypoints3d_left.length / 3;
}

CenterKeypointMatchingDecoder.prototype = {
    decode: function(mlComponent, annotation){

        if (annotation['instances'].length === 0){
            this.handle_no_centers(annotation);
            annotation['min_dists'] = [-1,-1];
            return
        }

        var center_array = this.create_center_array(annotation);
        var keypoint_center_array = this.create_keypoint_center_array(annotation);

        var min_dists = this.compute_min_distances(center_array, keypoint_center_array);
        annotation['min_dists'] = min_dists;
        this.mask_far_joints(annotation, min_dists);

    },

    handle_no_centers: function (annotation){
        for (var i = 0; i < annotation["model_keypoints_vis"].length; ++i) {
            annotation["model_keypoints_vis"][i] = 0;
            annotation["model_keypoints_scores"][i] = 0;
        }
    },

    create_center_array: function (annotation){

        var center_array = new Float32Array(2*annotation.instances.length);

        for (var i = 0; i < annotation.instances.length; i++) {
            var curX = annotation.instances[i].x;
            var curY = annotation.instances[i].y;
            center_array[2 * i] = curX
            center_array[2 * i + 1] = curY
        }

        return center_array;

    },

    create_keypoint_center_array: function (annotation){
        var image_joints = annotation["model_keypoints"]
        var image_joints_vis = annotation["model_keypoints_vis"]

        var image_joint_centers = new Float32Array(4)
        if (image_joints_vis[0]){
            image_joint_centers[0] = image_joints[0];
            image_joint_centers[1] = image_joints[1];
        }else{
            image_joint_centers[0] = -1000;
            image_joint_centers[1] = -1000;
        }

        if (image_joints_vis[8]){
            image_joint_centers[2] = image_joints[16];
            image_joint_centers[3] = image_joints[17];
        }
        else {
            image_joint_centers[2] = -1000;
            image_joint_centers[3] = -1000;
        }

        return image_joint_centers

    },

    compute_min_distances: function (center_array, keypoint_center_array){
        var to_center_shape = new vec3(2, center_array.length/2, 1);
        var from_keypoint_center_shape = new vec3(2, 2, 1);
        var min_dists = new Float32Array(2);
        // https://docs.snap.com/api/lens-studio/Classes/OtherClasses#TensorMath--findMinDistancesBetween
        TensorMath.findMinDistancesBetween(keypoint_center_array,
                                           from_keypoint_center_shape,
                                           center_array,
                                           to_center_shape,
                                           min_dists)
        return min_dists;
    },

    mask_far_joints: function (annotation, min_dists){
        if (min_dists[0] > this.cfg.center_kpt_min_dist){
            for (var i = 0; i < this.SIZE; i++) {
                annotation["model_keypoints_vis"][i] = 0
                annotation["model_keypoints_scores"][i] = 0
            }
        }

        if (min_dists[1] > this.cfg.center_kpt_min_dist){
            for (var i = 0; i < this.SIZE; i++) {
                annotation["model_keypoints_vis"][this.SIZE + i] = 0
                annotation["model_keypoints_scores"][this.SIZE + i] = 0
            }
        }
    }


}

IntegralKeypointDecoder = function (modelConfig){
    this.cfg = modelConfig;
    this.integral_kpt_stride = this.cfg.integral_kpt_stride;
    this.apply_sigmoid_kpt_visibilities = this.cfg.apply_sigmoid_kpt_visibilities;
    this.SIZE = modelConfig.keypoints3d_left.length / 3;
    this.SIZE2 = this.SIZE * 2
}

IntegralKeypointDecoder.prototype = {

    decode: function(mlComponent, annotation){
        var outputKeypointsTensor = mlComponent.getOutput(this.cfg.outputKeypointsName).data;  // 1 x 1 x 2*SIZE2


        var outputVisibilitiesTensor = mlComponent.getOutput(this.cfg.outputVisibilitiesName).data;  // 160 x 192 x 16
        var outputVisibilitiesTensorShape = mlComponent.getOutput(this.cfg.outputVisibilitiesName).shape;  // 160 x 192 x 16

        this.add_keypoints_to_annotations(annotation, outputKeypointsTensor);
        this.add_keypoint_vis_to_annotations(annotation, outputVisibilitiesTensor, outputVisibilitiesTensorShape);

    },

    add_keypoints_to_annotations: function (annotation, outputKeypointsTensor){
        var outTensor = new Float32Array(this.SIZE2* 2);
        for (var i = 0; i < this.SIZE; i++) {
            // left keypoints
            outTensor[2 * i] = outputKeypointsTensor[i]
            outTensor[2 * i + 1] = outputKeypointsTensor[2 * this.SIZE + i]

            // right keypoints
            outTensor[this.SIZE2 + 2 * i] = outputKeypointsTensor[this.SIZE + i]
            outTensor[this.SIZE2 + 2 * i + 1] = outputKeypointsTensor[3 * this.SIZE + i]

        }
        annotation["model_keypoints"] = outTensor
    },

    add_keypoint_vis_to_annotations: function (annotation, outputVisibilitiesTensor, outputVisibilitiesTensorShape){
        // SAMPLE VISIBILITY
        // LEFT AND RIGHT KEYPOINTS
        annotation["model_keypoints_vis"] = new Float32Array(this.SIZE2);
        annotation["model_keypoints_scores"] = new Float32Array(this.SIZE2);
        for (var i = 0; i < this.SIZE2 ; i++) {
            var xr = annotation["model_keypoints"][2 * i];
            var yr = annotation["model_keypoints"][2 * i + 1];
            var stride = this.integral_kpt_stride;
            var channel = i;
            var dims = [outputVisibilitiesTensorShape.y, outputVisibilitiesTensorShape.x, outputVisibilitiesTensorShape.z]
            var vis_prob = HelperLib.sample_tensor2d_at_position(outputVisibilitiesTensor, dims, xr, yr, stride, channel);

            if (this.apply_sigmoid_kpt_visibilities){
                vis_prob = MathLib.sigmoid(vis_prob);
            }
            annotation["model_keypoints_vis"][i] = vis_prob > 0; //this.cfg.keypointVisibilityThreshold;
            annotation["model_keypoints_scores"][i] = vis_prob;
        }
    }

}

SparseLeftRightDecoder = function (modelConfig){
    this.cfg = modelConfig;
    this.lr_threshold = 0.5;

    //TODO: Make configurable
    this.lr_momentum = 0.3;
    this.prev_lr_scores = null;

    this.SIZE = modelConfig.keypoints3d_left.length / 3;
    this.SIZE2 = this.SIZE * 2
}

SparseLeftRightDecoder.prototype = {

    decode: function (mlComponent, annotation){
        var outputSparseLRScoresTensor = mlComponent.getOutput(this.cfg.outputSparseLRScoresName).data;
        var outputSparseLRScoresTensorShape = mlComponent.getOutput(this.cfg.outputSparseLRScoresName).shape;
        var lrScoreVector = this.sample_sparse_lr(outputSparseLRScoresTensor, outputSparseLRScoresTensorShape, annotation);
        this.apply_lr_momentum(annotation)
        this.mask_wrong_lr_vis(lrScoreVector, annotation);
    },

    sample_sparse_lr: function (outputSparseLRScoresTensor, outputSparseLRScoresTensorShape, annotation){
        var lrScoreVector = new Float32Array(this.SIZE2);

        // SAMPLE VISIBILITY
        // LEFT AND RIGHT KEYPOINTS
        for (var i = 0; i < this.SIZE2 ; i++) {
            var xr = annotation["model_keypoints"][2 * i];
            var yr = annotation["model_keypoints"][2 * i + 1];
            var stride = this.cfg.sparse_lr_stride;
            var channel = 0;
            var dims = [outputSparseLRScoresTensorShape.y, outputSparseLRScoresTensorShape.x, outputSparseLRScoresTensorShape.z]
            lrScoreVector[i] = MathLib.sigmoid(HelperLib.sample_tensor2d_at_position(outputSparseLRScoresTensor, dims, xr, yr, stride, channel));
        }
        annotation['keypoints_lr_scores'] = lrScoreVector;
        return lrScoreVector
    },

    apply_lr_momentum: function(annotation){

        if (this.lr_momentum===0){
            return 0;
        }

        if (annotation.instances.length===0){
            this.prev_lr_scores = null;
        }

        else if (this.prev_lr_scores === null){
            this.prev_lr_scores = annotation['keypoints_lr_scores'];
        }
        else{
            for (var i = 0; i < this.SIZE2 ; i++) {
                annotation['keypoints_lr_scores'][i] = (1-this.lr_momentum) * annotation['keypoints_lr_scores'][i] + this.lr_momentum * this.prev_lr_scores[i]
            }
        }
    },

    mask_wrong_lr_vis: function (lrScoreVector, annotation){

        for (var i = 0; i < this.SIZE2; ++i) {
            left = i < this.SIZE2 / 2;

            if (left && annotation['keypoints_lr_scores'][i] > this.lr_threshold) {
                annotation["model_keypoints_vis"][i] = 0;
                annotation["model_keypoints_scores"][i] = 0;
            }
            if (!left && annotation['keypoints_lr_scores'][i] < this.lr_threshold) {
                annotation["model_keypoints_vis"][i] = 0;
                annotation["model_keypoints_scores"][i] = 0;
            }
        }
    }

}

CenterTrackDecoder = function (modelConfig){
    this.cfg = modelConfig;

}

CenterTrackDecoder.prototype = {
    decode: function (mlComponent, annotation){

        if (annotation['previous_instances'].length === 0){
            this.handle_no_prev_centers(annotation)
        }
        else{
            // Set all previously detected centers to have .matched=false
            this.unmatch_previous_instances(annotation);

            // Create new Float32Array(2*this.previous_instances.length) containing all prev center points
            const previous_center_array = this.create_previous_center_array(annotation);

            // Create new_instances
            // Match if each current center is < min_dist to any previous center
            // Add current centers to new_instances
            var new_instances = this.match_centers(annotation, previous_center_array);

            // Increment age of unmatched centers
            // Do not keep centers that are older than memory_cliff
            // CenterTrackDecoder.prototype.process_unmatched_previous_centers.bind(this)(new_instances)

        }

        return annotation;
    },

    unmatch_previous_instances: function(annotation){
        for (var i = 0; i < annotation['previous_instances'].length; ++i) {
           annotation['previous_instances'][i].matched = false;
        }
    },

    handle_no_prev_centers: function (annotation){
        for (var i = 0; i < annotation["instances"].length; ++i) {
                annotation['instances'][i].age = 0;
                annotation['instances'][i].matched = false;
                annotation['instances'][i].track_duration = 0;
                annotation['instances'][i].id = this.cfg.next_id;
                this.cfg.next_id++;
        }
    },

    create_previous_center_array: function (annotation){
        var prev_center_array = new Float32Array(2*annotation['previous_instances'].length);
        for (var i = 0; i < annotation['previous_instances'].length; i++) {
            var curX = annotation['previous_instances'][i].x;
            var curY = annotation['previous_instances'][i].y;
            prev_center_array[2 * i] = curX
            prev_center_array[2 * i + 1] = curY
        }
        return prev_center_array;
    },

    match_center_to_previous_center: function(pointTensor, previous_center_array){
        // 2 * number of previous centers
        var distPerCoordinate = new Float32Array(previous_center_array.length);
        var numCenters = previous_center_array.length/2;
        TensorMath.subTensors(pointTensor,
                new vec3(1, 1, 2),
                previous_center_array,
                new vec3(numCenters, 1, 2),
                distPerCoordinate);

        TensorMath.power(distPerCoordinate, 2, distPerCoordinate);
        var distTensor = new Float32Array(numCenters);
        TensorMath.sum(distPerCoordinate, new vec3(numCenters, 1, 2), new vec3(1, 0, 0), distTensor);


        TensorMath.power(distTensor, 0.5, distTensor);
        var min_dist = new Float32Array(numCenters);
        var closest_center_idx = new Uint32Array(2);

        TensorMath.mulScalar(distTensor, -1, distTensor);
        TensorMath.argMax(distTensor, new vec3(numCenters, 1, 1), closest_center_idx);

        TensorMath.max(distTensor, new vec3(numCenters, 1, 1), min_dist);

        var matched = (min_dist[0]*-1) < this.cfg.tracking_radius
        return {"closest_center": closest_center_idx[0], "matched": matched}
    },

    match_centers: function (annotation, prev_center_array){


        for (var i = 0; i < annotation["instances"].length; ++i) {
            var pointTensor = new Float32Array(2);
            pointTensor[0] = annotation["instances"][i].x;
            pointTensor[1] = annotation["instances"][i].y;

            const matched_data = this.match_center_to_previous_center(pointTensor, prev_center_array);

            if (matched_data["matched"] && !annotation['previous_instances'][matched_data["closest_center"]].matched) {
                annotation['instances'][i].matched = true;
                annotation['instances'][i].track_duration = annotation['previous_instances'][matched_data["closest_center"]].track_duration + 1;
                annotation['previous_instances'][matched_data["closest_center"]].matched = true;
                annotation['instances'][i].id = annotation['previous_instances'][matched_data["closest_center"]].id;
            }

            else{
                annotation['instances'][i].matched = false;
                annotation['instances'][i].track_duration = 0;
                annotation['instances'][i].id = this.cfg.next_id;
                this.cfg.next_id++;
            }

            annotation['instances'][i].age = 0;
        }
    },

    hysteresis_threshold: function (annotation){
        var new_instances = [];
        for (var i = 0; i < annotation["instances"].length; ++i) {
            annotation["instances"].thresholded = true;
            print(annotation["instances"][i].score)
            print(this.cfg.hysteresis_center_lb);
            print(this.cfg.hysteresis_center_ub);
            if (annotation["instances"][i].matched && annotation["instances"][i].score > this.cfg.hysteresis_center_lb){
                annotation["instances"].thresholded = false;
                new_instances.push(annotation["instances"][i])
            }
            if (!annotation["instances"][i].matched && annotation["instances"][i].score > this.cfg.hysteresis_center_ub){
                annotation["instances"].thresholded = false;
                new_instances.push(annotation["instances"][i])
            }
        }
        return new_instances
    }

}

CenterHysteresisDecoder = function (modelConfig){
    this.cfg = modelConfig;
}

CenterHysteresisDecoder.prototype = {
    decode: function (mlComponent, annotation){
        annotation['instances'] = this.hysteresis_threshold(annotation)
        return annotation
    },

    hysteresis_threshold: function (annotation){
        var new_instances = [];
        for (var i = 0; i < annotation["instances"].length; ++i) {

            annotation["instances"][i].thresholded = true;


            if (annotation["instances"][i].matched && annotation["instances"][i].score > this.cfg.hysteresis_center_lb){
                annotation["instances"][i].thresholded = false;
                new_instances.push(annotation["instances"][i])
            }

            if (!annotation["instances"][i].matched && annotation["instances"][i].score > this.cfg.hysteresis_center_ub){
                annotation["instances"][i].thresholded = false;
                new_instances.push(annotation["instances"][i])
            }

        }
        return new_instances
    }
}

GaussianKeypointDecoder = function(modelConfig){
    this.cfg = modelConfig;
    this.outputKeypointsName = modelConfig.outputVisibilitiesName;
    this.set_vis_from_heatmaps = modelConfig.set_vis_from_heatmaps;
    this.min_score = modelConfig.gaussian_heatmap_min_score
    this.SIZE = modelConfig.keypoints3d_left.length / 3;
    this.SIZE2 = this.SIZE * 2
}

GaussianKeypointDecoder.prototype = {
    decode_keypoints: function(mlComponent, annotation){
        var gaussian_heatmaps = mlComponent.getOutput(this.outputKeypointsName).data;  // 160 x 192 x 16
        var gaussian_shape = mlComponent.getOutput(this.outputKeypointsName).shape;  // 160 x 192 x 16

        this.add_keypoints_to_annotations(annotation, gaussian_heatmaps, gaussian_shape);

        if (this.set_vis_from_heatmaps){
            this.add_keypoint_vis_to_annotations(annotation, gaussian_heatmaps, gaussian_shape);
        }
    },

    add_keypoints_to_annotations: function (annotation, gaussian_heatmaps, gaussian_shape){
        // print("Stride: " + this.cfg.stride);
        var subpixelTensor = new Float32Array(2*this.SIZE2)

        TensorMath.subpixelArgMax(gaussian_heatmaps, gaussian_shape, subpixelTensor, 5);
        annotation["model_keypoints"] = subpixelTensor;
        for (var i = 0; i < 2 * this.SIZE2 ; i++) {
            annotation["model_keypoints"][i] = annotation["model_keypoints"][i] * this.cfg.stride;
        }
    },

    add_keypoint_vis_to_annotations: function (annotation, gaussian_heatmaps, gaussian_shape){
        var max_vals = new Float32Array(this.SIZE2);
        TensorMath.max(gaussian_heatmaps, gaussian_shape, max_vals);
        annotation["model_keypoints_scores"] = new Float32Array(this.SIZE2);
        annotation["model_keypoints_vis"] = new Float32Array(this.SIZE2);
        for (var i = 0; i < this.SIZE2 ; i++) {
            annotation["model_keypoints_vis"][i] = max_vals[i] > this.min_score;
            annotation["model_keypoints_scores"][i] = max_vals[i];
        }
    }
}

JointSampleSegmentationDecoder = function(modelConfig){
    this.cfg = modelConfig;
    this.min_score = modelConfig.gaussian_heatmap_min_score;
    this.outputSegmentationName = modelConfig.outputSegmentationName;
    this.SIZE = modelConfig.keypoints3d_left.length / 3;
    this.SIZE2 = this.SIZE * 2
}

JointSampleSegmentationDecoder.prototype = {
    decode_sample_segmentation: function(mlComponent, annotation){
        var logits = mlComponent.getOutput(this.outputSegmentationName).data;  // 128 x 160 x 2
        var logits_shape = mlComponent.getOutput(this.outputSegmentationName).shape;  // 128 x 160 x 2

        this.sample_logits(logits, logits_shape, annotation);
        return annotation

    },

    sample_logits: function (logits, logits_shape, annotation){
        var segScoreVector = new Float32Array(this.SIZE2);

        // SAMPLE VISIBILITY
        // LEFT AND RIGHT KEYPOINTS
        var max_ind = new Uint32Array(logits_shape.z)
        for (var i = 0; i < this.SIZE2 ; i++) {
            var xr = annotation["model_keypoints"][2 * i];
            var yr = annotation["model_keypoints"][2 * i + 1];
            var stride = 1;
            var dims = [logits_shape.y, logits_shape.x, logits_shape.z]
            var seg_values = HelperLib.sample_tensor2d_at_position(logits, dims, xr, yr, stride);
            TensorMath.argMax(new Float32Array(seg_values), new vec3(seg_values.length, 1, 1), max_ind);
            segScoreVector[i] = max_ind[0];
            
        }

        var left_kpt_labels = segScoreVector.slice(0, this.SIZE);
        var unique_left_values = getUniqueElements(left_kpt_labels);
        var set_unique_left_values = new Set(unique_left_values);

        var right_kpt_labels = segScoreVector.slice(this.SIZE, this.SIZE2);
        var unique_right_values = getUniqueElements(right_kpt_labels);
        var set_unique_right_values = new Set(unique_right_values);

        var filter_left = isSubsetOf(set_unique_left_values, new Set([0, 1]));
        var filter_right = isSubsetOf(set_unique_right_values, new Set([0, 1]));

        if (filter_left){
            for (var i = 0; i < this.SIZE ; i++){
                segScoreVector[i] = 0;
            }
        }

        if (filter_right){
            for (var i = this.SIZE; i < this.SIZE2 ; i++){
                segScoreVector[i] = 0;
            }
        }
        for (var i = 0; i < this.SIZE2 ; i++) {
            segScoreVector[i] = Math.min(1, segScoreVector[i]);
        }

        annotation["model_keypoints_scores"] = segScoreVector;
        annotation["model_keypoints_vis"] = segScoreVector;
    },
}

JointSampleKpClassDecoder = function(modelConfig){
    this.min_score = logits(modelConfig.kpt_class_min_score);
    this.outputSegmentationName = "MP_KP_CLASS"; 
}

JointSampleKpClassDecoder.prototype = {
    decode: function(mlComponent, annotation){
        var logits = mlComponent.getOutput(this.outputSegmentationName).data;  // 128 x 160 x 2
        var logits_shape = mlComponent.getOutput(this.outputSegmentationName).shape;  // 128 x 160 x 2

        this.sample_logits(logits, logits_shape, annotation);
        return annotation

    },
    sample_logits: function (logits, logits_shape, annotation){
        var kpClassScoreVector = new Float32Array(this.SIZE2);

        // SAMPLE VISIBILITY
        // LEFT AND RIGHT KEYPOINTS

        for (var i = 0; i < this.SIZE2 ; i++) {
            var xr = annotation["model_keypoints"][2 * i];
            var yr = annotation["model_keypoints"][2 * i + 1];
            var stride = 4;
            var dims = [logits_shape.y, logits_shape.x, logits_shape.z]
            kpClassScoreVector[i] = HelperLib.sample_tensor2d_at_position(logits, dims, xr, yr, stride, i);
            annotation["model_keypoints_scores"][i] = kpClassScoreVector[i]
            annotation["model_keypoints_vis"][i] = kpClassScoreVector[i] > this.min_score;
        }
    },
}

SparseCenterLRSampleDecoder = function(modelConfig){
    this.cfg = modelConfig;
}

SparseCenterLRSampleDecoder.prototype = {

    decode: function (mlComponent, annotation){
        var outputSparseLRScoresTensor = mlComponent.getOutput(this.cfg.outputSparseLRScoresName).data;
        var outputSparseLRScoresTensorShape = mlComponent.getOutput(this.cfg.outputSparseLRScoresName).shape;
        this.sample_sparse_lr(outputSparseLRScoresTensor, outputSparseLRScoresTensorShape, annotation);
    },

    sample_sparse_lr: function (outputSparseLRScoresTensor, outputSparseLRScoresTensorShape, annotation){

        // SAMPLE LR AT CENTER LOCATIONS
        // LEFT AND RIGHT KEYPOINTS
        for (var i = 0; i < annotation.instances.length; ++i) {
            var xr = annotation.instances[i].x;
            var yr = annotation.instances[i].y;
            var stride = this.cfg.sparse_lr_stride;
            var channel = 0;
            var dims = [outputSparseLRScoresTensorShape.y, outputSparseLRScoresTensorShape.x, outputSparseLRScoresTensorShape.z]
            annotation.instances[i]['lr_score'] = MathLib.sigmoid(HelperLib.sample_tensor2d_at_position(outputSparseLRScoresTensor, dims, xr, yr, stride, channel));;
        }
    }
}


GlobalWristKptDetectionDecoder = function (modelConfig){
    this.cfg = modelConfig;
    this.min_score = 0.5;
}


GlobalWristKptDetectionDecoder.prototype = {

    decode: function(mlComponent, annotation){

        var outputGlobalKptScores = mlComponent.getOutput("SF_WRIST_KPT_DETECTION").data;
        this.sample_wrist_scores(outputGlobalKptScores, annotation);

        return annotation;
    },

    sample_wrist_scores: function (outputGlobalKptScores, annotation){

        // SAMPLE VISIBILITY
        // LEFT AND RIGHT KEYPOINTS
        for (var i = 0; i < outputGlobalKptScores.length ; i++) {
            annotation["model_keypoints_scores"][i] = MathLib.sigmoid(outputGlobalKptScores[i])
            annotation["model_keypoints_vis"][i] = annotation["model_keypoints_scores"][i] > this.min_score;
        }
    }
}


function isSubsetOf(setA, setB) {
  for (var item of setA) {
    if (!setB.has(item)) {
      return false;
    }
  }
  return true;
}

function getUniqueElements(uint32Array) {
  var uniqueElements = [];
  var map = {};

  for (var i = 0; i < uint32Array.length; i++) {
    var element = uint32Array[i];

    if (!map[element]) {
      map[element] = true;
      uniqueElements.push(element);
    }
  }

  return uniqueElements;
}


module.exports.version = "1.0.0";
module.exports.ShoeCenterDetectDecoder = ShoeCenterDetectDecoder;
module.exports.ShoeCenterGaussDetectDecoder = ShoeCenterGaussDetectDecoder;
module.exports.CenterKeypointMatchingDecoder = CenterKeypointMatchingDecoder;
module.exports.IntegralKeypointDecoder = IntegralKeypointDecoder;
module.exports.SparseLeftRightDecoder = SparseLeftRightDecoder;
module.exports.CenterTrackDecoder = CenterTrackDecoder;
module.exports.CenterHysteresisDecoder = CenterHysteresisDecoder;
module.exports.GaussianKeypointDecoder = GaussianKeypointDecoder;
module.exports.JointSampleSegmentationDecoder = JointSampleSegmentationDecoder;
module.exports.JointSampleKpClassDecoder = JointSampleKpClassDecoder;
module.exports.GlobalWristKptDetectionDecoder = GlobalWristKptDetectionDecoder;
