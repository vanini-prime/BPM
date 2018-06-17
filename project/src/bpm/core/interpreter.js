
/**
 *  Process interpreter
 */

var Interpreter = (function () {

    var ModelManager = require('./modelManager.js');
    var InstanceManager = require('./instanceManager.js');

    /**
     *  Gets an activity from a given model and a given its id
     */
    function getActivity(model, id) {
        return model.activityMap[id];
    }



    /**
     * Set an activity as enabled
     */
    function setEnabled(model, context, succ) {
        if (context.enabledSet.has(succ)) throw '--- activity already in enabled set (infinite loop) ---';
        var activity = getActivity(model, succ);
        if (activity.onEnable){
            model.script[activity.onEnable](context.instanceData);
        }
        context.enabledSet.add(succ);
    }

    /**
 *   Enable the first successor of an activity
 *   (to be used when the activity should have just one successor)
 */
    function enableFirst(model, activity, context) {
        if (!activity.succs || (activity.succs.length == 0)) throw '--- activity.succs is undefined or empty';
        if (activity.succs.length != 1) throw '--- this activity should have just one successor';
        setEnabled(model, context, activity.succs[0]);
    }


    /**
     * Executes an automatic activity
     * Automatic activities supported:
     *  ScriptTask, ParallelFork, ParallelJoin, ExclusiveFork, ExclusiveJoin
     */
    function execAuto(model, activity, context) {

        function checkScript(){
            if(activity.onExec) model.script[activity.onExec](context.instanceData);
        }

        console.log('---- interpreter.execAuto() activity:'+activity.type+' onExec:'+activity.onExec);

    
        if (activity.type == 'ScriptTask') {
            checkScript();
            enableFirst(model, activity, context);
        } else if (activity.type == "ParallelFork") {
            checkScript();
            if(!activity.succs || activity.succs.length ==0) throw '--- activity.succs is undefined or empty';
            for(var succ of activity.succs) setEnabled(model, context, succ);
        } else if(activity.type == 'ParallelJoin'){
            if(!context.parallelJoinMap) context.parallelJoinMap = {};
            if(!context.parallelJoinMap[activity.id]) context.parallelJoinMap[activity.id] = activity.preds.length;
            if((--context.parallelJoinMap[activity.id]) == 0){
                enableFirst(model, activity, context);
                checkScript();
            }
        } else if(activity.type == 'ExclusiveFork'){
            checkScript();
            var pathName = context.instanceData.getPath();
            if(!pathName) throw '---- exclusive fork: path is undefined ---';
            if(!activity.transitionMap) throw '---- exclusive fork: transitionMap is undefined ----';
            var succId = activity.transitionMap[pathName];
            if(!succId) throw '---- exclusiveFork: invalid path name ----';
            console.log('--- exclusive fork: pathSelected:'+pathName);
            setEnabled(model, context, succId); 
        } else if(activity.type == 'ExclusiveJoin'){
            checkScript();
            enableFirst(model, activity, context);
        } else if(activity.type == 'EndEvent'){
            checkScript();
        }
        context.enabledSet.delete(activity.id);
        checkForFinish(model, context);
    }

    function checkForFinish(model, context){
            for(var id of Array.from(context.enabledSet)) console.log('--- checkForFinish(): ' + getActivity(model, id).type);
            if(context.enabledSet.size == 1) model.script.onFinish(context.instanceData)
        
    }

    /** 
     * checks if activity is automatic 
     */
    function isAuto(activity) {
        return (activity.type != 'UserTask');
    }

    /**
     * Executes enabled automatic taks
     */
    function execAutomaticTasks(model, context) {

        function autoCount() {
            var res = 0;
            for (var succ of context.enabledSet)
                if (isAuto(model.activityMap[succ])) res++;
            return res;
        }

        do {
            for (var succ of context.enabledSet) {
                var act = model.activityMap[succ];
                if (isAuto(act)) {
                    execAuto(model, act, context);
                }
            }
        } while (autoCount() > 0);
    }

    /**
     *   Enable the successors of an activity
     *   - activity: the activity
     *   - action: name supplied by the agent who is creating the instance
     *   - context: instance context 
     *   [updates context.enabledTasks]
     */
    function enableSuccs(model, activity, context) {

        if ((activity.type == 'StartEvent') || (activity.type == 'UserTask') || (activity.type == 'ScriptTask')) enableFirst(model, activity, context);

        // TODO: check for automatic tasks in enabled set and 'execute' them !!!!!
        execAutomaticTasks(model, context);

        context.enabledSet.delete(activity.id);
        return Array.from(context.enabledSet);
    }

    function newInstance(modelName, instanceData) {
        var model = ModelManager.getModel(modelName);

        if (!model) throw '--- model not found:' + modelName;

        var instanceContext = InstanceManager.newInstance(modelName, instanceData);
        var script = model.script;
        instanceContext.path = null; // just in case
        script.onStart(instanceContext.instanceData);
        enableSuccs(model, model.start, instanceContext);
        InstanceManager.saveInstance(instanceContext);
        return instanceContext.instanceId; 
    }




    /**
     * Task commit
     * task: task object {instanceId, activityId, modelName, activityName, lane }
     * instanceData: fields will override the corresponding in instanceContext
     */
    function taskCommit(task, instanceData) {
        var instanceContext = InstanceManager.getInstanceContext(task.instanceId);
        var model = ModelManager.getModel(instanceContext.modelName);
        if(!model) throw '---- model not found:'+modelName;
        var activity = model.activityMap[task.activityId];
        if(!activity) throw '--- invalid activity id:' + task.activityId;
        if(activity.type != 'UserTask') throw '--- invalid activity type in taskCommit():'+activity.type;
        // instance context data update
        for(var attr in instanceData){
            //console.log('--- overriding instanceContext.'+attr+' :: '+ instanceData[attr]);
            instanceContext.instanceData[attr] = instanceData[attr];
        }
        model.script[activity.onCommit](instanceContext.instanceData);
        var es = enableSuccs(model, activity, instanceContext);
        InstanceManager.saveInstance(instanceContext);
        return es;
    }

    return {
        'newInstance': newInstance,
        'taskCommit': taskCommit,
    };

})();
module.exports = Interpreter;