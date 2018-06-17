
var FileUtils = (function() {

    var fs = require('fs');

    /**
     * reads json object from a file.
     * TODO: handle possible error.
     */
    function readJsonObj(filePath){
        console.log('-- readJsonObj() filePath:'+filePath);
        var data = fs.readFileSync(filePath);
        //console.log('data:'+data);
        return JSON.parse(data);
    }

    function writeJsonObj(path, obj){
        fs.writeFileSync(path, JSON.stringify(obj, null, 2));  // TODO: don't need indentation
    }


        return {
            'readJsonObj': readJsonObj,
            'writeJsonObj': writeJsonObj
        }
})(); 
module.exports = FileUtils;

