



var ModelManager  = require('../core/modelManager.js');
var fs = require('fs');
var FileUtils = require('../utils/fileUtils.js');
var testDataPath  = 'C:/Prime/BPM/project/src/bpm/tests/testData/';


var fileName1 = 'xModel.json';
var scriptName1 = 'xModelScript.js';


var model =  FileUtils.readJsonObj(testDataPath+fileName1);
var script = fs.readFileSync(testDataPath+scriptName1);


var r1 = ModelManager.setModel('Aprovação', model, script);

var m = ModelManager.getModel('Aprovação');

console.log(' setModel() r1:'+r1);

for(attr in m) console.log('----> m.'+attr);

console.log('--- fim ----');