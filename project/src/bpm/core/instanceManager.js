

/**
 *  Manages operations related to instance operations:
 *  - instance creation
 *  - access to instance data
 * 
 *       This is a mock up version, instance data is not persisted.
 * 
 */
InstanceManager = (function () {

    var ModelManager = require('./modelManager.js');
    var instanceMap = {};
    var lastId = 0;


    /**
     * Instance object construtor
     * (the instance object is specific for each process instance )
     */
    function instanceObj( id, name, data, enabled){
        var path = null;       // path selected in an exclusive fork task
        var instanceId  = id;
        var modelName = name;
        var instanceData = data;
        var enabledSet = enabled;   // contains the ids of enabled activitis for the instance

        /** the following functions are to be used in scripts and by the interpreter */
        instanceData.getInstanceId = function() { return instandeId; }; 
        instanceData.getPath = function()  { return path; };
        instanceData.setPath = function(p) { path = p; }
        instanceData.getModelName = function() { return modelName; };

        return {
            'instanceId'   : instanceId,
            'modelName'    : modelName,
            'enabledSet'   : enabledSet,
            'instanceData' : instanceData
        }

    }

    /**
     * New instance creation:
     *  - associates the supplied instance data to a new instance id
     *    and 'saves' it. 
     */
    function newInstance(modelName, instanceData) {
        if (!modelName) throw '--- modelName is undefined ---';
        if (!ModelManager.exists(modelName)) throw ' --- throw modelName ' + modelName + ' is undefined --- ';
        var instanceId = ++lastId;
        var instanceContext = new instanceObj(instanceId, modelName, instanceData, new Set());
        instanceMap[instanceId] = instanceContext;
        return instanceContext;
    }

    /**
     * Returns the instance data associate do a given instance id.
     */
    function getInstanceContext(instanceId) {
        return instanceMap[instanceId];     
    }

    function getInstanceData(instanceId){
        if(!instanceMap[instanceId]) return null;
        return instanceMap[instanceId].instanceData;
    }

    /**
     * Saves/updates the instance context and instance data associated to a given id
     */
    function saveInstance(instanceContext) {
        instanceId = instanceContext.instanceId;
        if (!instanceId) throw '--- instanceId is undefined';
        if (!instanceMap[instanceId]) throw '--- undefined instance ---';
        instanceMap[instanceId] = instanceContext;
    }

    /**
     *  Returns the set of enabledTasks of a given model
     */
    function getEnabled(modelName) {
        var res = new Set();
        for (var instanceId in instanceMap) {
            if (modelName == instanceMap[instanceId].modelName) {
                for (var taskId of instanceMap[instanceId].enabledSet) res.add(taskId);
            }
        }
        return res;
    }




    /**
     * Returns a list of a given instance enabled tasks.
     * [ returns null if instance  or model not found ]
     */
    function getInstanceTasks(instanceId) {
        var instanceContext = getInstanceContext(instanceId);
        if (!instanceContext) return null;
        var model = ModelManager.getModel(instanceContext.modelName);
        if (!model) return null;
        var res = [];
        for (var id of instanceContext.enabledSet) {
            res.push(
                {
                    'instanceId': instanceId,
                    'activityId': id,
                    'modelName': instanceContext.modelName,
                    'activityName': model.activityMap[id].name,
                    'lane': model.activityMap[id].lane,
                }
            )
        }
        return res;
    }

    /**
     *  Returns a list of all enabled tasks relative to a given model
     */
    function getModelTasks(modelName) { 
        var res = [];
        for(var id in instanceMap){
            if(modelName == instanceMap[id].modelName){
                for(var task of getInstanceTasks(id)) res.push(task);
            }
        }
        return res;
    }

    return {
        'newInstance'           : newInstance,
        'getInstanceData'       : getInstanceData,
        'getInstanceContext'    : getInstanceContext,
        'getInstanceTasks'      : getInstanceTasks,
        'getModelTasks'         : getModelTasks,
        'saveInstance'          : saveInstance,
        'getEnabled'            : getEnabled
    };

})();
module.exports = InstanceManager;