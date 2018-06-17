
var Translator = ( function() {

    var Converter = require('./converter.js');
    var Importer = require('./xpdlImporter.js');
    var fs = require('fs');
    var FileUtils = require('../utils/fileUtils.js');

    /**
     *   Translates (xpdl file + metadata) into 
     *   (model file + script file) to be loaded 
     *   by the process interpreter (model manager / interpreter).
     *    
     *   inputs: xpdl file, metadata file
     *   outputs: model file, script file
     * 
     *   callback function called as 'callback(err, res);'
     * 
     *   (script file: contains functions stubs to be edited by developers)
     */
    function translate(xpdlPath, metadataPath, modelPath, scriptPath){

        var xmodel = Importer.getXpdl(xpdlPath);
        var metadata = FileUtils.readJsonObj(metadataPath);
        var converted = Converter.convert(xmodel, metadata);

        var scripts = converted.scriptStubs;
        delete converted.scriptStubs;  // don't need anymore

        FileUtils.writeJsonObj(modelPath, converted); 
        fs.writeFileSync(scriptPath, scripts);
        
        /** that's all, folks (Castle Films) **/
    }

    return {
        'translate': translate
    }

})(); 
module.exports = Translator;