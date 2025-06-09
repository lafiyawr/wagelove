// Annotator.js
// Version: 0.0.2
// Event: Lens Initialized
// Description: Annotates key points on wrist/foot

var HelperLib = require("./GenericHelperScript_001");
var DecoderLib = require("./GenericDecoders_002");


var AnnotatorLib = {};


AnnotatorV2 = function(modelConfig) {
//    print("Creating Foot Annotator");
    this.cfg = modelConfig;
    this.previous_instances = [];

    this.decoders = [];
    for (var k = 0; k < this.cfg.decoder_pipeline.length; k++) {
        var moduleName =  this.cfg.decoder_pipeline[k];
        var newDecoder = new DecoderLib[moduleName](modelConfig);
        this.decoders.push(newDecoder);

    }
};

AnnotatorV2.prototype = {
    annotate: function(mlComponent) {
        var annotation = {};

        annotation["previous_instances"] = this.previous_instances;

        for (var k = 0; k < this.decoders.length; k++) {
            this.decoders[k].decode(mlComponent, annotation);
        }
        this.previous_instances = this.create_previous_instances_list(annotation);

        return annotation;
    },

    create_previous_instances_list: function(annotation) {

        if (!annotation.hasOwnProperty("instances"))
        {
            return {}
        }
        
        var new_instances = [];
        var seen_ids = [];
        for (var i = 0; i < annotation["instances"].length; ++i) {
            new_instances.push(annotation["instances"][i]);
            seen_ids.push(annotation["instances"].id);
        }

        for (var i = 0; i < annotation["previous_instances"].length; ++i) {
            if (!annotation["previous_instances"][i].matched) {
                annotation["previous_instances"][i].age += 1;
                if (annotation["previous_instances"][i].age < this.cfg.memory_cliff && seen_ids.indexOf(annotation["previous_instances"][i].id)===-1) {
                    new_instances.push(annotation["previous_instances"][i]);
                }
            }
        }

        return new_instances;
    },


};


AnnotatorLib.Annotator = AnnotatorV2;

module.exports.version = "1.0.0";
module.exports.Annotator = AnnotatorV2;