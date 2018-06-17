

var inspect       = require('util').inspect;
var xImporter     = require('../xpdl/XpdlImporter.js');
var convert       = require('../xpdl/converter.js').convert;
var translate     = require('../xpdl/translator.js').translate;
var testDataPath  = 'C:/Prime/BPM/project/src/bpm/tests/testData/';

var path1 = 'Diagrama1.xpdl';
var path2 = 'exemplo1.xpdl';
var path3 = 'todasTarefas.xpdl';
var path4 = 'todosOsGateways.xpdl';
var path5 = 'todosOsEventos.xpdl';
var path6 = 'exemploPoc1.xpdl';
var path7 = 'exemploPoc1_1.xpdl';  // OK
var path8 = 'exemploPoc_2.xpdl';   // repeated user task name in a lane... (laneCheck test ok !)

/** 
 * A process metadata example
 *  (question: type or initial value ?)
 */
var myMetadata = {
    'nome'              : 'String',
    'endereco'          : 'String', 
    'CPF'               : 'String',
    'dataSolicitacao'   : 'Date',
    'valorSolicitado'   : 'Float',
    'limiteCalculado'   : 'FLoat',
    'status'            : 'String',
    'historico'         : 'StringList'
};

/** just an 'eval()' test, it works, believe me *
var f2 = eval('(function() { return { "a": function() { return "abc"; } }  } )();');
console.log(f2.a());
for(attr in f2) console.log('--- f2.'+attr+' '+f2[attr]);
*****/

/*** part 1: importer, converter and eval() tests  */
var model = xImporter.getXpdl(testDataPath+path6);

console.log(inspect(model, { colors: true, depth: Infinity }));

var converted = convert(model, myMetadata);
console.log(JSON.stringify(converted, null, 2));
console.log('\n------- script stub ---------\n');
console.log(converted.scriptStubs);
var f1 = eval(converted.scriptStubs);

// par1 2: translator test (it generates .json and .js files)
translate(testDataPath+path6, testDataPath+'myMetadata.json', testDataPath+'xModel.json', testDataPath+'xModelScript.js');
console.log('--- translate() done ----');

/** 
 * This is an example of how to call the script functions.
 * The good parts:
 *  - only one call to eval() is enough (it returns a descriptor)
 *  - each script function is called without eval
 *  - instanceId and instanceData are passed as parameter
 */
console.log(' ----- call test of each script function, created by "eval(<script>)" ---');
for(var attr in f1) {
    console.log('-- f1.'+attr);
    f1[attr]('[ action '+attr+' ]','[ '+attr+' ]');
}
/** it does not work with exclusive fork. **/



console.log('The end');
