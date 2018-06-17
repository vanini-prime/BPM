

var Converter = (function () {

    /**
     *  Converts an imported xpdl process description to
     *  an object  representing a process model ready to interpretation 
     *  by the BPM engine.
     * 
     *  Returns:
     *      The process as an object:
     *      {
     *          start event: < start event description >
     *          activities: < list of activities >
     *          metaData: < process metada >
     *          scriptStubs: < script Stubs associated to process model's elements >
     *          errors: < errors as strings, if any >
     *      }
     *      
     *      an 'activity' may be:
     *      -- a task (user task, script task, ...)
     *      -- an event (end event, timer event, ... )
     *      -- a gateway (parallel gateway, exclusive gateway, ... )
     *     
     */
    function convert(xProcess, metadata) {
        var errors = [];
        var start = getStartEvent(xProcess.processes[0].activities, errors);
        var activities = getActivities(xProcess.processes[0].activities, errors);
        var scriptStubs = makeScriptStubs(activities);
        return {
            'start': start,
            'activities': activities,
            'metaData': metadata,
            'scriptStubs': scriptStubs,
            'errors': errors
        };
    }

    /**
     * Gets the start event from an activity list.
     */
    function getStartEvent(activities, errors) {
        var res = null;
        for (var activity of activities) {
            if (activity.type == 'StartEvent') {
                if (res) errors.push('-- More than one start event ---');
                else {
                    res = activity;
                }
            }
        }
        if (!res) errors.push('-- No start event ---')
        return res;
    }

    const supportedTaskTypes = new Set(['StartEvent', 'ParallelGateway', 'ExclusiveGateway', 'EndEvent', 'ScriptTask', 'UserTask']);


    /**
     * Gets activities from an activity list.
     * Returns a list of 'transformed' activities:
     *   -- checks all activities preds and succs
     *   -- start event is not part of result list
     *   -- ParallelGateway and ExclusiveGateway are converted in corresponding forks and joins, 
     *      depending on the number of successors.
     *   -- transitionList, if exists is checked and convert in to a 'transitonMap'.
     * 
     *  (spaghetti should have a good sauce !!!)
     * 
         Important: fork-join match is not checked !!!
     */
    function getActivities(activities, errors) {
        var res = [];
        var laneMap = {};  // { lane: set of activity names }

        /**
         *  Checks if activity names in a lane are unique
         */
        function checkLaneMap(activity) {
            if (activity.type == 'UserTask') {
                var actSet = laneMap[activity.lane];
                if (actSet) {
                    if (actSet.has(activity.name)) errors.push('-- Repeated user task name: ' + activity.name + ' in lane:' + activity.lane);
                    else actSet.add(activity.name);
                } else {
                    laneMap[activity.lane] = new Set([activity.name]);
                }

            }
        }

        for (var activity of activities) {
            if (supportedTaskTypes.has(activity.type)) {
                delete activity.laneId;
                var preds = activity.preds;
                var succs = activity.succs;

                checkLaneMap(activity);

                if (activity.type == 'StartEvent') {
                    if (preds && (preds.length > 0)) errors.push('-- Start event should have no predecessors ---');
                    if (!succs || (succs.length != 1)) errors.push('--- Start event should have one successor ---');
                } else if (activity.type == 'EndEvent') {
                    if (succs && (succs.length > 0)) errors.push('--- End event should have no successors.');
                } else if ((activity.type == 'UserTask') || (activity.type == 'ScriptTask')) {
                    if (!preds || (preds.length != 1)) errors.push('-- Tasks should have one predecessor ---');
                    if (!succs || (succs.length != 1)) errors.push('-- Tasks should have one successor ---');
                } else if ((activity.type == 'ParallelGateway') || (activity.type == 'ExclusiveGateway')) {
                    var auxName = (activity.type == 'ParallelGateway') ? 'Parallel' : 'Exclusive';
                    if (!succs || succs.length == 0) errors.push('-- ' + auxName + ' gateway with no successors');
                    else if (!preds || preds.length == 0) errors.push('-- ' + auxName + 'gateway with no predecessors --');
                    else {
                        if (preds.length == 1) {
                            if (succs.length == 1) errors.push('-- Useless ' + auxName + ' gateway --');
                            else {
                                activity.type = auxName + 'Fork';
                                if (auxName == 'Exclusive') {
                                    if (!activity.transitionList) errors.push('-- ExclusiveGateway (as fork) should have named transitions ---');
                                    else {
                                        var transitionMap = {}, count = 0;
                                        for (var transition of activity.transitionList) {
                                            var action = transition.action;
                                            if (transitionMap[action]) errors.push('-- Repeated transition name:' + action + ' ---');
                                            else {
                                                transitionMap[action] = transition.succId;
                                                count++;
                                            }
                                        }
                                        if (count != activity.transitionList.length) errors.push('-- Number of transition names is diferent of number of gateway transitions');
                                        delete activity.transitionList;
                                        activity.transitionMap = transitionMap;
                                    }
                                }
                            }
                        } else {
                            // preds.length > 1
                            if (succs.length > 1) errors.push('-- ' + auxName + ' gateway should not have multiple predecessors and multiple successors ---');
                            else activity.type = auxName + 'Join';
                        }
                    }
                }
                if (activity.type != 'StartEvent') res.push(activity);
            } else { errors.push('-- unsupported activity type:' + activity.type) }
        }
        return res;
    }

    /**
     * Returns a protptype text for the scripts associated to
     * process activities, gateways and events.
     * (only named ones may have associated scripts)
     */
    function makeScriptStubs(activities) {

        var idx = 0;
        var baseName = 'script_';

        function makeTxtBody(name, type, op, path){
            const body = '{\n\n\t\t/** put your code here **/\n\t\tconsole.log("Script for { NAME, TYPE, OPERATION, name:[ NAME ] }");\nPATH\n\t}\n\n';
            return body.replace('NAME',name).replace('TYPE',type).replace('OPERATION',op).replace('PATH',path);
        }    
        
        /**
         * make a function stup
         */
        function mkAStub(activity, operation, idx){

            var lane = activity.lane;
            var name = activity.name;
            var type = activity.type;
            var transitionMap = activity.transitionMap;
            var laneTxt = (lane && (lane.length > 0)) ? '\t/**\n\t *\n\t * lane: ' + lane : '';
            var transitionsTxt = '';
            var setPath = '';
            if(transitionMap){
                transitionsTxt += '\n\t * transition names: ';
                var d = '';
                for(var trans in transitionMap){
                    transitionsTxt += d + trans; 
                    d = ', ';
                }
                for(var trans in transitionMap){
                    setPath = '\t\tinstanceData.setPath("' + trans + '");\n';
                }
            }

            return laneTxt + '\n\t * type: '+ type +'\n\t * name: ' + name+'\n\t * operation: '+operation+transitionsTxt+'\n\t *\n\t */\n' +
                   '\tfunction ' + baseName +  idx + '(instanceData)' + makeTxtBody((baseName+idx), type, operation, setPath);  
        }

        var txt =  "(function () {\n\n" 
                    + "\t/** code generated automatically - handle with care ! **/\n\n"
                    + "\t/**\n\t *\t called at instance creation \n\t */\n\tfunction onStart(instanceData)" + makeTxtBody('onStart','Start','onExec', '') + 
                      "\n\n\t/**\n\t *\called at instance finish \n\t */\n\tfunction onFinish(instanceData)" + makeTxtBody('onFinish','Finish','onExec', '');
        var idx = 0;
        for (var activity of activities) {
            // only named activities may have associated scripts
            if (activity.name && (activity.name != '')) {
                if (activity.type == 'UserTask') {
                    txt += mkAStub(activity, 'enable', idx);  activity.onEnable = baseName + (idx++);
                    txt += mkAStub(activity, 'commit', idx);  activity.onCommit = baseName + (idx++);
                } else   {
                    txt += mkAStub(activity, 'exec', idx);  activity.onExec = baseName + (idx++);
                } 
            }
        }
        txt += '\t return {\n' +
               '\t\t"onStart"\t: onStart,\n\t\t"onFinish"\t:onFinish,\n';
        for(var i = 0; i < idx; i++) txt += '\t\t"'+baseName+i+'"\t: ' + baseName + i + ',\n';
        txt += '\t}\n';
        txt += '})();';
        return txt;
    }


    return {
        'convert': convert
    };
})();
module.exports = Converter;