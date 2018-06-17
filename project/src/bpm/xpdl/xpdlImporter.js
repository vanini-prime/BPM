/** exploratory xpdl-parser  **/

var XpdlImporter = (function () {
    var fs = require('fs');
    var parse = require('xml-parser');

    /**
     * writes an object to a json file
     */
    function toJsonFile(path, obj) {
        fs.writeFile(path, JSON.stringify(obj, null, 2), function (err) {
            if (err) throw err;
            console.log(' --- toJsonFile() file: ' + path + ' created! ');
        });
    }

    /**
     * gets a object's child given its name.
     *  obj: jsonified object from a xpdl tag
     *  
     */
    function getChildByName(obj, name) {
        for (child of obj.children)
            if (child.name == name) return child;
        return null;
    }

    /**
     *  Gets the retangle coords of a jsonified xpdl graphic element
     */
    function getRect(element) {
        var graphicInfo = getChildByName(element, 'NodeGraphicsInfos');
        graphicInfo = getChildByName(graphicInfo, 'NodeGraphicsInfo'); // if it can be confusing, why not ?
        var width = parseFloat(graphicInfo.attributes.Width);
        var height = parseFloat(graphicInfo.attributes.Height);
        var coords = getChildByName(graphicInfo, "Coordinates");
        var x = parseFloat(coords.attributes.XCoordinate);
        var y = parseFloat(coords.attributes.YCoordinate);
        return [x, x + width, y, y + height];
    }

    /**
     * get pools descriptions of a jsonified xpdl object
     */
    function getPools(obj) {
        var pools = getChildByName(obj.root, 'Pools');
        if (!pools) throw '--- "Pools" not found ';
        var res = [];
        for (var pool of pools.children) {
            var poolName = pool.attributes.Name;
            var poolId = pool.attributes.Id;
            res.push({ 'name': poolName, 'id': poolId, 'lanes': getElements(pool, 'Lanes', 'Lane') });
        }
        return res;
    }

    /**
     * Gets process elements of a jsonified xpdl part list (lanes, activities)
     *  group: group name ('Lanes', 'Activities' )
     *  elementName: ('Lane', 'Activity')
     *  decorate: optional function used do add specific element attributes
     */
    function getElements(obj, group, elementName, decorate) {
        var res = [];
        var elementGroup = getChildByName(obj, group);
        if (elementGroup) for (var element of elementGroup.children) {
            if (element.name = elementName) {
                var theName = element.attributes.Name;
                var theId = element.attributes.Id;
                rect = getRect(element);
                var value = { 'name': theName, 'id': theId, 'x1': rect[0], 'x2': rect[1], 'y1': rect[2], 'y2': rect[3] };
                if (decorate) decorate(element, value);
                res.push(value);
            }
        }
        return res;
    }

    /**
     *  returns an element's child name, if it is in a given list
     */
    function getChildFrom(element, namesMap) {
        for (var name in namesMap) if (getChildByName(element, name)) return namesMap[name];
        return null;
    }

    /** 
     *  returns an element's attribute name, if it is in a given list
     */
    function getAttrib(element, names) {
        for (var name of names) if (element[name]) return name;
        return null;
    }

    const taskTypesMap = {
        'TaskUser': 'UserTask',
        'TaskBusinessRule': 'BusinessRuleTask',
        'TaskManual': 'ManualTask',
        'TaskScript': 'ScriptTask',
        'TaskSend': 'SendTask',
        'TaskReceive': 'ReceiveTask',
        'TaskService': 'ServiceTask'
    }

    const eventNamesMap = {
        'Message': 'MessageEvent',
        'Signal': 'SignalEvent',
        'Link': 'LinkEvent',
        'Compensation': 'CompensationEvent',
        'Escalation': 'EscalationEvent',
        'Conditional': 'ConditionalEvent',
        'ParallelMultiple': 'ParallelMultipleEvent',
        'Multiple': 'MultipleEvent'
    }


    /**
     * Adds specific attributes to an activity object.
     *  element: jsonfied xpdl activity element (source).
     *  activity: activity representation being built.
     *  Added activity atributes: type, task and loop
     */
    function addAttribs(element, activity) {
        var event = getChildByName(element, 'Event');
        if (event) {
            if (getChildByName(event, 'StartEvent')) activity.type = 'StartEvent'; else
                if (getChildByName(event, 'EndEvent')) activity.type = 'EndEvent'; else {
                    var intermediateEvent = getChildByName(event, 'IntermediateEvent');
                    if (intermediateEvent) {
                        var trigger = intermediateEvent.attributes.Trigger;
                        if (trigger == 'Timer') {
                            activity.type = 'TimerEvent';
                            var triggerTimer = getChildByName(intermediateEvent, 'TriggerTimer');
                            if (triggerTimer) {
                                if (triggerTimer.attributes.TimeDate) activity.timeDate = triggerTimer.attributes.TimeDate; else
                                    if (triggerTimer.attributes.TimeCycle) activity.timeCycle = triggerTimer.attributes.TimeCycle;
                            } else {
                                throw '---- this cannot happen ----';
                            }
                        } else {
                            activity.type = eventNamesMap[trigger];
                            console.log('----- trigger:' + trigger + ' activity.type:' + activity.type);
                        }

                    }
                }
        }
        var implementation = getChildByName(element, 'Implementation');
        if (implementation) {
            var task = getChildByName(implementation, 'Task');
            if (task) {
                activity.task = true;
                activity.type = getChildFrom(task, taskTypesMap);
                if (!activity.type) activity.type = 'UserTask';  // default
            }
        }
        var loop = getChildByName(element, 'Loop');
        if (loop) {
            if (loop.attributes.LoopType == 'None') activity.loop = false;
            else activity.loop = true; // TODO check for other types of loop
        }
        var route = getChildByName(element, 'Route');
        if (route) {
            activity.type = route.attributes.GatewayType;
            if ((activity.type == 'Parallel') && (route.attributes.ParallelEventBased == 'true')) activity.type = 'ParallelEventBased';
            if (!activity.type && (route.attributes.ExclusiveType == 'Event'))
                if (route.attributes.Instantiate == 'true') activity.type = 'ExclusiveEventBased'
                else activity.type = 'EventBased';
            if (!activity.type) activity.type = 'Exclusive';
            activity.type += 'Gateway';
        }
        if (!activity.type) {
            console.log(JSON.stringify(element, null, 2));
            throw '---- addAttribs() => returning activity.type == null !!!';
        }
    }


    /**
     * gets processes description from a jsonified xpdl model
     */
    function getProcesses(obj) {
        var processes = getChildByName(obj.root, 'WorkflowProcesses');
        if (!processes) throw '--- "WorkflowProcesses" not found ';
        var res = [];
        for (var process of processes.children) {
            var processName = process.attributes.Name;
            var processId = process.attributes.Id;
            res.push({
                'name': processName,
                'id': processId,
                'activities': getElements(process, 'Activities', 'Activity', addAttribs),
                'transitions': getTransitions(process)
            });
        }
        return res;
    }

    /**
     * Gets the transitions from a jsonified xpdl process description
     */
    function getTransitions(process) {
        var transitions = getChildByName(process, 'Transitions');
        var res = [];
        if (transitions) {
            for (var transition of transitions.children) {
                var transitionId = transition.attributes.Id;
                var transitionFrom = transition.attributes.From;
                var transitionTo = transition.attributes.To;
                var transitionName = transition.attributes.Name;
                var trans = { 'id': transitionId, 'from': transitionFrom, 'to': transitionTo, 'name': transitionName };
                var condition = getChildByName(transition, "Condition");
                if (condition) {
                    if (condition.attributes.Type) trans.condition = condition.attributes.Type;
                    else trans.condition = '';
                }
                res.push(trans);
            }
        }
        return res;
    }

    /**
     *  checks if rect1 is inside rect2
     */
    function inside(rect1, rect2) {
        var xc = (rect1.x1 + rect1.x2) / 2;
        var yc = (rect1.y1 + rect1.y2) / 2;
        return (xc >= rect2.x1) && (xc <= rect2.x2) &&
            (yc >= rect2.y1) && (yc <= rect2.y2);
    }

    /**
     * Binds a lane to an activity
     */
    function bindLane(activity, lanes) {
        for (var lane of lanes) {
            if (inside(activity, lane)) {
                activity.lane = lane.name;
                activity.laneId = lane.id;
                return;
            }
        }
    }

    /**
     *  binds all activities to their lanes
     */
    function bindLanes(processes, pools) {
        for (var process of processes) {
            for (var pool of pools)
                if (pool.name == process.name) {
                    for (var activity of process.activities) bindLane(activity, pool.lanes);
                }
        }
    }

    /**
     *   Binds activities transitions
     */
    function bindTransitions(processes) {

        function setTransition(activ, action, id) {
            if (!activ.transitionList) activ.transitionList = [];
            activ.transitionList.push({ 'action': action, 'succId': id });//[action] = id;
        }

        for (var process of processes) {
            var activityMap = {};
            for (var activity of process.activities) {
                activityMap[activity.id] = activity;
                activity.preds = [];
                activity.succs = [];
            }
            for (var transition of process.transitions) {
                var fromActiv = activityMap[transition.from];
                var toActiv = activityMap[transition.to];
                fromActiv.succs.push(toActiv.id);
                toActiv.preds.push(fromActiv.id);
                if (transition.name) setTransition(fromActiv, transition.name, toActiv.id);
            }
        }

    }

    /**
     * Removes unnecessary attributes
     */
    function clean(node) {
        delete node.x1;
        delete node.x2;
        delete node.y1;
        delete node.y2;
    }


    function cleanUpPools(pools) {
        var res = [];
        for (var pool of pools)
            if (pool.lanes && (pool.lanes.length > 0)) {
                for (var lane of pool.lanes) clean(lane);
                res.push(pool);
            }
        return res;
    }

    function cleanUpProcesses(processes) {
        var res = [];
        for (var process of processes) {
            if (process.activities && (process.activities.length > 0)) {
                for (var activity of process.activities) {
                    clean(activity);
                }
                res.push(process);
            }
        }
        return res;
    }

    /**
     * reads a xpdl file and returns the represented process model, stripping all irrelevant details.
     */
    function getXpdl(path) {
        var xml = fs.readFileSync(path, 'utf8');
        var obj = parse(xml);
        var pools = getPools(obj);
        var processes = getProcesses(obj);
        bindLanes(processes, pools);
        bindTransitions(processes);
        pools = cleanUpPools(pools);
        processes = cleanUpProcesses(processes);
        return { 'pools': pools, 'processes': processes };
    }

    return {
        'getXpdl': getXpdl
    };

})();
module.exports = XpdlImporter;
