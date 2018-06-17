



var ModelManager  = require('../core/modelManager.js');
var Interpreter = require('../core/interpreter.js');
var InstanceManager = require('../core/instanceManager.js');
var fs = require('fs');
var FileUtils = require('../utils/fileUtils.js');

var testDataPath  = 'C:/Prime/BPM/project/src/bpm/tests/testData/';


var fileName1 = 'xModel.json';
var scriptName1 = 'xModelScript.js';


var model =  FileUtils.readJsonObj(testDataPath+fileName1);
var script = fs.readFileSync(testDataPath+scriptName1);
const modelName = 'Aprovação';

const instanceData = {
    'nome'              : '<nome>',
    'endereco'          : '<endereco>', 
    'CPF'               : '<cpf>',
    'dataSolicitacao'   : '<data solicitacao>',
    'valorSolicitado'   : '<valor solicitado>',
    'limiteCalculado'   : 10000.00,
    'status'            : '<status>',
    'historico'         : []
};

const instanceData2 = {
    'nome'              : 'Nerso da Capitinga',
    'endereco'          : 'Rua do Fura Zóio, Capitinga - MG', 
    'CPF'               : 'a muié perdeu, uai!',
    'dataSolicitacao'   : 'sei não.',
    'valorSolicitado'   : 10001.00,
    'limiteCalculado'   : 10000.00,
    'status'            : 'conheço esse trem não.',
    'historico'         : ['esse é a mãe que sabe, uai!']
};

var r1 = ModelManager.setModel(modelName, model, script);
console.log('-- << setModel() r1:'+r1);

var myInstanceId = Interpreter.newInstance(modelName, instanceData);
console.log('===> created instance Id:' + myInstanceId);
var taskList = InstanceManager.getInstanceTasks(myInstanceId);

console.log('-------- taskList ==>');
console.log(JSON.stringify(taskList, null, 2));
console.log('--- instanceData ==> ');
var savedInstanceData = InstanceManager.getInstanceData(myInstanceId);
console.log(JSON.stringify(savedInstanceData, null, 2));

do {
    var modelTaskList = InstanceManager.getModelTasks(modelName);
    if(modelTaskList.length > 0){
        console.log('---- model:'+modelName+' taskList ==>');
        for(var i = 0; i < taskList.length; i++) console.log('\t\t'+JSON.stringify(modelTaskList[i]));
        var commitResult = Interpreter.taskCommit(modelTaskList[0], instanceData2);
        console.log(JSON.stringify(commitResult, null, 2));
    } else break;
} while(true);


console.log('--- fim ----');