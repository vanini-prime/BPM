/**
 *    Manages business process models.
 *    'Process model':
 *      {
 *          'process': {
 *              'startEvent': < start event >
 *              'activities': < process's activities >
 *          }
 *          'metaData': < business object metadata >
 *          'script': < process's script functions >
 *      }
 * 
 *      This is a mock up version, model data is not persisted.
 * 
 */

var ModelManager = (function () {

    /**
     * Keeps all registered models.
     * Models are indexed by name, which should be unique.
     * Map structure: { name: model }
     */
    var modelMap = {}; 

    /**
     * Returns the list of registered model names.
     * (model names should be unique)
     */
    function getModelNames() {
        return Object.keys(modelMap);
    }

    /**
     * Checks if there is a model associated to a 
     * given name.
     */
    function exists(modelName){
        return modelMap.hasOwnProperty(modelName);
    }

    /**
     * returns a model given its name
     */
    function getModel(modelName) {
        return modelMap[modelName];
    }

    function makeActivityMap(model){
        function addActiv(activity){
            if(!activity.id) throw '--- activity has no id field ---';
            activMap[activity.id] = activity;
        }
        var activMap = {};
        addActiv(model.start);
        for(var activity of model.activities) addActiv(activity);
        model.activityMap = activMap;
    }

    /**
     * Register a new model
     *  -- script should have the same method names as the generated stub for the model.
     *  -- returns true or false indicating operation success/failure
     *     (can fail if model is already registered)
     */
    function setModel(modelName, model, scriptTxt) {
        if(modelMap[modelName]) return false;
        makeActivityMap(model);
        model.script = eval(String(scriptTxt));  
        modelMap[modelName] = model;
        model._enabled = true;
        return true;
    }

    /**
     * Model deletion.
     * -- returns true/false indicating operation success/failure
     *    (can fail if model not found)
     */
    function deleteModel(modelName){
        if(!modelMap[modelName]) return false;
        delete modelMap[modelName];
        return true;
    }

    /**
     *  Updates a model alredy registered;
     *  -- returns true/false indicating operation success/failure
     *     (can fail if model not found)
     * 
     *  -- TODO: handle model versioning (this is another chapter)
     */
    function updateModel(modelName, model, script) {
        if(!modelMap[modelName]) return false;
        modelMap[modelName] = model;
        return true;
    }

    /**
     * Updates the script of an already registered model;
     * (Be careful: script should have the same former function names);
     */
    function updateScript(modelName, script){
        if(!modelMap[modelName]) return false;
        modelMap[modelName].script = script;
        return true;
    }

    /**
     *  Enable a model: new process instances can
     *  be created.
     *  Returns true/false indicating operation's success/failure
     *  (fail if model not found or already enabled)
     */
    function enableModel(modelName){
        if(!modelMap[modelName] || modelMap[modelName]._enabled) return false;
        modelMap[modelName]._enabled = true;
        return true;
    }

    /**
     * Disable a (enabled) model. No new process
     *  instances can be created. Active instances remains 
     *  active.
     * returns true/false indicating operation's success/failure
     * (fail is model not found or already disabled)
     */
    function disableModel(modelName){
        if(!modelMap[modelName] || !modelMap[modelName]._enabled) return false;
        modelMap[modelName]._enabled = falsee;
        return true;

    }


    return {
        'getModelNames' : getModelNames,
        'getModel'      : getModel,
        'setModel'      : setModel,
        'updateModel'   : updateModel,
        'deleteModel'   : deleteModel,
        'enableModel'   : enableModel,
        'disableModel'  : disableModel,
        'exists'   : exists
    }
})(); 
module.exports = ModelManager;