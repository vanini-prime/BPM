(UMLStudio "7.2" project)
(repository "" 0)
(notation "UML.not")
(genProfile 178 "Java" ("" "" "" "" "") "" 0 ("" "" "" "" "") ("" "" "" "" "") 
            700 360 347 342 70 50 80 50 80 60 0 11)
(codeFiles)
(docFiles)
(otherFiles)
(revFiles "C++" 
          "C:\Klais\FutureSocLab\wfLoadGen.workspace\wfLoadGenerator\src\workflow\facade\DefaultExecObject.java" 
          "C:\Klais\FutureSocLab\wfLoadGen.workspace\wfLoadGenerator\src\workflow\facade\ExecObject.java" 
          "C:\Klais\FutureSocLab\wfLoadGen.workspace\wfLoadGenerator\src\workflow\facade\SimulationExecObject.java" 
          "C:\Klais\FutureSocLab\wfLoadGen.workspace\wfLoadGenerator\src\workflow\facade\WfFacade.java")
(masters (master "w4!OJVG*!?2zU+!" 1 3 "Activity" "" "" "" "" "" 1 nil nil nil 
                 nil nil 10 "") 
         (master "f2!FeVG*!?2zU+!" 3 3 "TaskManager" "" "" "" "" "" 1 nil nil 
                 nil nil nil 10 "") 
         (master ";2!dnVG*!?2zU+!" 2 3 "Task" "" "" "" "" "" 1 nil nil nil nil 
                 nil 10 "") 
         (master "92!pnVG*!?2zU+!" 2 3 "Instance" "" "" "" "" "" 1 nil nil nil 
                 nil nil 10 "") 
         (master "72!3oVG*!?2zU+!" 1 3 "InstanceManager" "" "" "" "" "" 1 nil 
                 nil nil nil nil 10 "") 
         (master ",2!drVG*!?2zU+!" 1 3 "Model" "" "" "" "" "" 1 nil nil nil 
                 nil nil 10 "") 
         (master "$2!<uVG*!?2zU+!" 2 3 "user" "" "" "" "" "" 0 nil nil nil nil 
                 nil 14 "") 
         (master "h1!~_WG*!?2zU+!" 4 3 "WfFacade" "" "" "" "workflow.facade" 
                 "" 1 
                 (("instanceManager" "InstanceManager" "" "" 
                                     "InstanceManager.getInstance()" "" 1 17 
                                     "j1!~_WG*!?2zU+!") 
                  ("rn" "Random" "" "" "new Random()" "" 1 17 
                        "k1!~_WG*!?2zU+!") 
                  ("modelManager" "ModelManager" "" "" 
                                  "ModelManager.getInstance()" "" 1 17 
                                  "l1!~_WG*!?2zU+!") 
                  ("taskManager" "TaskManager" "" "" 
                                 "TaskManager.getInstance()" "" 1 17 
                                 "m1!~_WG*!?2zU+!")) 
                 (("ran" "int" "" 3 17 (("n" "int" "" 0)) nil 
                         "n1!~_WG*!?2zU+!" 
                         "^t{^r^n^t^tint k = rn.nextInt();^r^n^t^tif(k < 0 ) k = -k;^r^n^t^treturn k % n;^r^n^t}") 
                  ("WfFacade" "" "" 1 16 nil nil "o1!~_WG*!?2zU+!" "{^r^n}") 
                  ("getWfFacadeInstance" "WfFacade" 
                                         "Returns the unique instance for this class ^r^n@return" 
                                         3 17 nil nil "p1!~_WG*!?2zU+!" 
                                         "^t{^r^n^t^tif(instance == null) instance = new WfFacade();^r^n^t^treturn instance;^r^n^t}") 
                  ("createInstance" "void" 
                                    "Creates a process instance based o a given process model.^r^nAt instance creation, the start task is enabled and commited.^r^n@param model^r^n@param userId^r^n@param action" 
                                    3 16 
                                    (("modelId" "long" "" 0) 
                                     ("userId" "long" "" 0)) (("Exception" 0)) 
                                    "q1!~_WG*!?2zU+!" 
                                    "^t{^r^n^t^t//System.err.println(^"WfFacade.createInstance() modelId:^"+modelId+^" userId:^"+userId);^r^n^t^tModel model = modelManager.getModelById(modelId);^r^n^t^tassert model != null: ^"model == null^";^r^n^t^tString action = getAnAction(model.getStartActivity());^r^n^t^tTask st = newStartTask(model,userId);^r^n^t^tcommitTask(st,userId,action,true);^r^n^t}") 
                  ("hasStartRole" "boolean" 
                                  "Checks if a given set of roles contains a start role of a given model^r^n@param roleSet^r^n@param ModelId^r^n@return" 
                                  3 16 
                                  (("roleSet" "Set<<String>" "" 0) 
                                   ("modelId" "long" "" 0)) nil 
                                  "r1!~_WG*!?2zU+!" 
                                  "^t{^r^n^t^treturn roleSet.contains(modelManager.getModelById(modelId).getStartRole());^r^n^t}") 
                  ("newStartTask" "Task" 
                                  "Creates a new instance and the start task.^r^n@param model^r^n@param userId^r^n@return^r^n@throws DAOException " 
                                  1 16 
                                  (("model" "Model" "" 0) 
                                   ("userId" "long" "" 0)) 
                                  (("DAOException" 0)) "s1!~_WG*!?2zU+!" 
                                  "^t{^r^n^t^tTask st = (instanceManager.newInstance(model)).getStartTask();^r^n^t^tst.show(userId);^r^n^t^treturn st;^r^n^t}") 
                  ("commitTask" "void" 
                                "Task execution confirmation^r^n@param task^r^n@param userId^r^n@param action^r^n@param start^r^n@throws DAOException " 
                                1 16 
                                (("task" "Task" "" 0) ("userId" "long" "" 0) 
                                 ("action" "String" "" 0) 
                                 ("start" "boolean" "" 0)) 
                                (("DAOException" 0)) "t1!~_WG*!?2zU+!" 
                                "^t{^r^n^t^ttask.commit(userId, action);^r^n^t^t//if(!start){^r^n^t^t//^ttaskManager.removeTask(task);^r^n^t^t//}^r^n^t}") 
                  ("showTaskData" "void" 
                                  "Gets task data do be shown to the user.^r^n@param task^r^n@param userId^r^n@throws DAOException " 
                                  1 16 
                                  (("task" "Task" "" 0) ("userId" "long" "" 0)) 
                                  (("DAOException" 0)) "u1!~_WG*!?2zU+!" 
                                  "^t{^r^n^t^ttask.show(userId);^r^n^t}") 
                  ("executeTask" "boolean" 
                                 "Executes a given task.^r^n@param task^r^n@param userId^r^n@param action^r^n@return^r^n@throws DAOException " 
                                 3 16 
                                 (("task" "Task" "" 0) ("userId" "long" "" 0) 
                                  ("action" "String" "" 0)) 
                                 (("DAOException" 0)) "v1!~_WG*!?2zU+!" 
                                 "    {^r^n    ^t//if(task == null) System.err.println(^"WfFacade.executeTask() => task == null^");^r^n    ^t//else System.err.println(^"WfFacade.executeTask() => taskId:^"+task.getActivity().getId()+^" model:^"+task.getActivity().getModel().getName()+^" action:^"+action);^r^n    ^tif(task == null) return false;^r^n    ^tshowTaskData(task,userId);^r^n    ^tcommitTask(task,userId,action,false);^r^n    ^treturn true;^r^n    }") 
                  ("getAnAction" "String" 
                                 "Gets a random action for an activity execution^r^n@param act^r^n@return" 
                                 3 16 (("act" "Activity" "" 0)) nil 
                                 "w1!~_WG*!?2zU+!" 
                                 "^t{^r^n^t^tMap<String,Activity> actMap = null;^r^n^t^tif(act instanceof NormalActivity) actMap = ((NormalActivity)act).getSuccessors(); else^r^n^t^tif(act instanceof XorDecision)    { ^r^n^t^t^tactMap = ((XorDecision)act).getSuccessors();^r^n^t^t}^r^n^t^telse return Activity.DEFAULTACTION;^r^n^t^t^r^n^t^tObject[] objects = actMap.keySet().toArray();^r^n^t^tif(objects.length == 0) return Activity.DEFAULTACTION;^r^n^t^t^r^n^t^t//return (String)objects[ran(objects.length)];^r^n^t^tString action = (String )objects[ran(objects.length)];^r^n^t^t//System.err.println(^"WfFacade.getAnAction() => action:^"+action);^r^n^t^treturn action;^r^n^t}") 
                  ("getATask" "Task" 
                              "Gets a random task for a given user(which has a set of roles in the process)^r^n@param roleSet^r^n@return^r^n@throws DAOException " 
                              3 16 (("roleSet" "Set<<String>" "" 0)) 
                              (("DAOException" 0)) "x1!~_WG*!?2zU+!" 
                              "^t{^r^n^t^tList<TaskBean> list = taskManager.getTaskList(roleSet);^r^n^t^tif(list.size() == 0) return null;^r^n^t^treturn taskManager.beanToTask(list.get(ran(list.size())));^r^n^t}") 
                  ("getNextTask" "Task" 
                                 "Gets the next task for a given user^r^n@param roleSet^r^n@return^r^n@throws DAOException " 
                                 3 16 (("roleSet" "Set<<String>" "" 0)) 
                                 (("DAOException" 0)) "y1!~_WG*!?2zU+!" 
                                 "^t{^r^n^t^tTaskManager taskManager = TaskManager.getInstance();^r^n^t     return taskManager.getNextTask(roleSet);^r^n^t}")) 
                 nil nil nil 10 "") 
         (master "V1!~_WG*!?2zU+!" 1 3 "SimulationExecObject" "" "" 
                 "Support object for process simulation ^r^n@author Klais Team" 
                 "workflow.facade" "" 1 
                 (("rn" "Random" "" "" "new Random()" "" 1 17 
                        "X1!~_WG*!?2zU+!")) 
                 (("ran" "int" 
                         "Random number generator^r^n@param n^r^n@return" 1 17 
                         (("n" "int" "" 0)) nil "Y1!~_WG*!?2zU+!" 
                         "^t{^r^n^t^tint k = rn.nextInt();^r^n^t^tif(k < 0 ) k = -k;^r^n^t^treturn k % n;^r^n^t}") 
                  ("getADecision" "boolean" 
                                  "Returns a boolean random value^r^n@return" 
                                  1 16 nil nil "Z1!~_WG*!?2zU+!" 
                                  "    {^r^n    ^tboolean result= (ran(2) == 1);^r^n    ^t//System.err.println(^"========= >  SimulationExecObject.getADecision() ==> ^"+result);^r^n    ^treturn result;^r^n    }") 
                  ("getAnAction" "String" 
                                 "Returns a random action for a given activity^r^n@param inst^r^n@param activity^r^n@return" 
                                 3 16 
                                 (("inst" "Instance" "" 0) 
                                  ("activity" "Activity" "" 0)) nil 
                                 "[1!~_WG*!?2zU+!" 
                                 "    {^r^n    ^tif(inst == null) return Activity.DEFAULTACTION;^r^n    ^tif(activity == null) return Activity.DEFAULTACTION;^r^n    ^treturn WfFacade.getWfFacadeInstance().getAnAction(activity);^r^n    }") 
                  ("getInstance" "SimulationExecObject" 
                                 "Returns the unique instance for this class^r^n@return" 
                                 3 17 nil nil "\1!~_WG*!?2zU+!" 
                                 "    {^r^n    ^tif(instance == null){^r^n    ^t^tinstance = new SimulationExecObject();^r^n^r^n    ^t}^r^n    ^treturn instance;^r^n    }") 
                  ("SimulationExecObject" "" "" 1 16 nil nil "]1!~_WG*!?2zU+!" 
                                          "    {^r^n    ^t^r^n    }") 
                  ("setVars" "Override public void" 
                             "updates an instance var map.^r^n@param instance^r^n@throws DAOException " 
                             0 16 (("instance" "Instance" "" 0)) 
                             (("DAOException" 0)) " 1!~_WG*!?2zU+!" 
                             "    {^r^n    ^tMap<String,Variable> varMap = instance.getVarMap();^r^n    ^tfor(String varName:varMap.keySet()) vdi.saveupdate(new VarBean(instance.getId(),varMap.get(varName)));^r^n    }") 
                  ("getVars" "Override public void" 
                             "update vars array ^r^n@param instance" 0 16 
                             (("instance" "Instance" "" 0)) nil 
                             "_1!~_WG*!?2zU+!" 
                             "    {^r^n    ^tMap<String,Variable> varMap = instance.getVarMap();^r^n        List<VarBean> varBeanList = null;^r^n        try {^r^n            varBeanList = vdi.getAllByInstanceId(instance.getId());^r^n        } catch (DAOException e) {^r^n            e.printStackTrace();^r^n        }^r^n        if(varBeanList != null)^r^n    ^t^tfor(VarBean vb: varBeanList){^r^n    ^t^t^tVariable v = vb.getWfVariable();^r^n    ^t^t^tvarMap.put(v.getName(), v);^r^n    ^t^t}^r^n    }") 
                  ("getVar" "Override public Variable" 
                            "Returns a variable from an instance varmap^r^n@param instance^r^n@param name^r^n@return^r^n@throws DAOException " 
                            0 16 
                            (("instance" "Instance" "" 0) 
                             ("name" "String" "" 0)) (("DAOException" 0)) 
                            "`1!~_WG*!?2zU+!" 
                            "    {^r^n    ^tVarBean vb = null;^r^n    ^tvb = vdi.read(vb.new PrimaryKey(instance.getId(),name));^r^n    ^treturn vb.getWfVariable();^r^n    }") 
                  ("setVar" "Override public void" 
                            "Updates a variable from an instance var map^r^n@param instance^r^n@param var^r^n@throws DAOException " 
                            0 16 
                            (("instance" "Instance" "" 0) 
                             ("var" "Variable" "" 0)) (("DAOException" 0)) 
                            "a1!~_WG*!?2zU+!" 
                            "    {^r^n    ^tVarBean vb = new VarBean(instance.getId(),var);^r^n    ^tvdi.saveupdate(vb);^r^n    }") 
                  ("doEnable" "Override public Object" "" 0 16 
                              (("instance" "Instance" "" 0) 
                               ("activity" "Activity" "" 0)) 
                              (("DAOException" 0)) "b1!~_WG*!?2zU+!" 
                              "^t{^r^n^t^tgetVars(instance);^r^n^t^t//System.out.println(^"==>> doEnable activity:^"+activity.getTitle()+^" id:^"+activity.getId());^r^n^t^tsetVars(instance);^r^n^t^treturn true;^r^n^t}") 
                  ("doCommit" "Override public Object" "" 0 16 
                              (("instance" "Instance" "" 0) 
                               ("activity" "Activity" "" 0) 
                               ("action" "String" "" 0)) (("DAOException" 0)) 
                              "c1!~_WG*!?2zU+!" 
                              "^t{^r^n^t^tgetVars(instance);^r^n^t^t//System.err.println(^"==>>  SimulationExecObject.doCommit() =>  activity:^"+activity.getTitle()+^" id:^"+activity.getId()+^" action:^"+action);^r^n^t^tif(activity instanceof SimpleDecision) return this.getADecision(); ^r^n^t^tif(activity instanceof XorDecision)    return this.getAnAction(instance, activity);^r^n^t^tsetVars(instance);^r^n^t^treturn false;^r^n^t}") 
                  ("doShow" "Override public Object" "" 0 16 
                            (("instance" "Instance" "" 0) 
                             ("activity" "Activity" "" 0)) 
                            (("DAOException" 0)) "d1!~_WG*!?2zU+!" 
                            "^t{^r^n^t^tgetVars(instance);^r^n^t^t//System.out.println(^"==>> doShow activity:^"+activity.getTitle()+^" id:^"+activity.getId());^r^n^t^tsetVars(instance);^r^n^t^treturn false;^r^n^t}") 
                  ("doUndo" "Override public Object" "" 0 16 
                            (("instance" "Instance" "" 0) 
                             ("activity" "Activity" "" 0)) 
                            (("DAOException" 0)) "e1!~_WG*!?2zU+!" 
                            "^t{^r^n^t^tgetVars(instance);^r^n^t^t////////////////System.out.println(^"==>> doUndo activity:^"+activity.getTitle()+^" id:^"+activity.getId());^r^n^t^tsetVars(instance);^r^n^t^treturn false;^r^n^t}") 
                  ("onNewInstance" "Override public Object" "" 0 16 
                                   (("instance" "Instance" "" 0)) 
                                   (("DAOException" 0)) "f1!~_WG*!?2zU+!" 
                                   "^t{^r^n^t^tgetVars(instance);^r^n^t^tModel model = instance.getModel();^r^n^t^t//System.out.println(^"==>> new Instance model:^"+model.getName()+^" id:^"+model.getId());^r^n^t^tsetVars(instance);^r^n^t^treturn null;^r^n^t}") 
                  ("onInstanceFinish" "Override public Object" "" 0 16 
                                      (("instance" "Instance" "" 0)) 
                                      (("DAOException" 0)) "g1!~_WG*!?2zU+!" 
                                      "^t{^r^n^t^tgetVars(instance);^r^n^t^tModel model = instance.getModel();^r^n^t^t//////////////System.out.println(^"==>> finishing instance model:^"+model+^" id:^"+model.getId());^r^n^t^tsetVars(instance);^r^n^t^treturn null;^r^n^t}")) 
                 nil nil nil 10 "") 
         (master "J1!~_WG*!?2zU+!" 1 3 "ExecObject" "" "" 
                 "Defines de structure of a runtime support object for process instance simulation^r^n@author Klais Team" 
                 "workflow.facade" "" 5 nil 
                 (("doEnable" "Object" 
                              "To be invoked at task enabling^r^n@param instance ^r^n@param activity^r^n@return^r^n@throws DAOException " 
                              3 144 
                              (("instance" "Instance" "" 0) 
                               ("activity" "Activity" "" 0)) 
                              (("DAOException" 0)) "L1!~_WG*!?2zU+!" "") 
                  ("doCommit" "Object" 
                              "To be invoked at task committing^r^n@param instance^r^n@param activity^r^n@param action^r^n@return^r^n@throws DAOException " 
                              3 144 
                              (("instance" "Instance" "" 0) 
                               ("activity" "Activity" "" 0) 
                               ("action" "String" "" 0)) (("DAOException" 0)) 
                              "M1!~_WG*!?2zU+!" "") 
                  ("doShow" "Object" 
                            "To be invoked when getting instance data, as a preparation for task committing^r^n@param instance^r^n@param activity^r^n@return^r^n@throws DAOException " 
                            3 144 
                            (("instance" "Instance" "" 0) 
                             ("activity" "Activity" "" 0)) 
                            (("DAOException" 0)) "N1!~_WG*!?2zU+!" "") 
                  ("doUndo" "Object" 
                            "To be invoked when undoing a task (not used yet)^r^n@param instance^r^n@param activity^r^n@return^r^n@throws DAOException " 
                            3 144 
                            (("instance" "Instance" "" 0) 
                             ("activity" "Activity" "" 0)) 
                            (("DAOException" 0)) "O1!~_WG*!?2zU+!" "") 
                  ("onNewInstance" "Object" 
                                   "To be invoked at new instance creation^r^n@param instance^r^n@return^r^n@throws DAOException " 
                                   3 144 (("instance" "Instance" "" 0)) 
                                   (("DAOException" 0)) "P1!~_WG*!?2zU+!" "") 
                  ("onInstanceFinish" "Object" 
                                      "To be invoked at instance finishing^r^n@param instance^r^n@return^r^n@throws DAOException " 
                                      3 144 (("instance" "Instance" "" 0)) 
                                      (("DAOException" 0)) "Q1!~_WG*!?2zU+!" 
                                      "") 
                  ("setVars" "void" 
                             "persists all instance vars^r^n@param instance^r^n@throws DAOException " 
                             3 144 (("instance" "Instance" "" 0)) 
                             (("DAOException" 0)) "R1!~_WG*!?2zU+!" "") 
                  ("getVars" "void" 
                             "gets instance vars from persistence ^r^n@param instance" 
                             3 144 (("instance" "Instance" "" 0)) nil 
                             "S1!~_WG*!?2zU+!" "") 
                  ("getVar" "Variable" 
                            "Returns a variable from persistence^r^n@param instance^r^n@param name^r^n@return^r^n@throws DAOException " 
                            3 144 
                            (("instance" "Instance" "" 0) 
                             ("name" "String" "" 0)) (("DAOException" 0)) 
                            "T1!~_WG*!?2zU+!" "") 
                  ("setVar" "void" 
                            "Updates a variable from an instance var map^r^n@param instance^r^n@param var^r^n@throws DAOException " 
                            3 144 
                            (("instance" "Instance" "" 0) 
                             ("var" "Variable" "" 0)) (("DAOException" 0)) 
                            "U1!~_WG*!?2zU+!" "")) nil nil nil 10 "") 
         (master "<1!~_WG*!?2zU+!" 1 3 "DefaultExecObject" "" "" 
                 "Defines a default runtime support object for process instances simulation^r^n@author Klais Team" 
                 "workflow.facade" "" 1 nil 
                 (("DefaultExecObject" "" "" 1 16 nil nil ">1!~_WG*!?2zU+!" 
                                       "N^n{^r^n^r^n") 
                  ("getInstance" "DefaultExecObject" 
                                 "Returns the unique instance for this class^r^n@return" 
                                 3 16 nil nil "?1!~_WG*!?2zU+!" 
                                 "^t{^r^n^t^tif(instance == null) instance = new DefaultExecObject();^r^n^t^treturn instance;^r^n^t}") 
                  ("doEnable" "Override public Object" 
                              "To be invoked when enabling an instance activity" 
                              0 16 
                              (("instance" "Instance" "" 0) 
                               ("activity" "Activity" "" 0)) nil 
                              "@1!~_WG*!?2zU+!" 
                              "^t{^r^n^t^tSystem.out.println(^"==>> doEnable activity:^"+activity.getTitle()+^" id:^"+activity.getId());^r^n^t^treturn true;^r^n^t}") 
                  ("doCommit" "Override public Object" 
                              "To be invoked when committing an instance activity" 
                              0 16 
                              (("instance" "Instance" "" 0) 
                               ("activity" "Activity" "" 0) 
                               ("action" "String" "" 0)) nil "A1!~_WG*!?2zU+!" 
                              "^t{^r^n^t^tSystem.out.println(^"==>> doCommit activity:^"+activity.getTitle()+^" id:^"+activity.getId()+^" action:^"+action);^r^n^t^treturn false;^r^n^t}") 
                  ("doShow" "Override public Object" 
                            "To be invoked when showing instance data, in order to prepare activity commit" 
                            0 16 
                            (("instance" "Instance" "" 0) 
                             ("activity" "Activity" "" 0)) nil 
                            "B1!~_WG*!?2zU+!" 
                            "^t{^r^n^t^tSystem.out.println(^"==>> doShow activity:^"+activity.getTitle()+^" id:^"+activity.getId());^r^n^t^treturn false;^r^n^t}") 
                  ("doUndo" "Override public Object" 
                            "To be invoked when undoing an activity (not used yet)" 
                            0 16 
                            (("instance" "Instance" "" 0) 
                             ("activity" "Activity" "" 0)) nil 
                            "C1!~_WG*!?2zU+!" 
                            "^t{^r^n^t^tSystem.out.println(^"==>> doUndo activity:^"+activity.getTitle()+^" id:^"+activity.getId());^r^n^t^treturn false;^r^n^t}") 
                  ("onNewInstance" "Override public Object" 
                                   "To be invoked at new instance creation" 0 
                                   16 (("instance" "Instance" "" 0)) nil 
                                   "D1!~_WG*!?2zU+!" 
                                   "^t{^r^n^t^tModel model = instance.getModel();^r^n^t^tSystem.out.println(^"==>> new Instance model:^"+model.getName()+^" id:^"+model.getId());^r^n^t^treturn null;^r^n^t}") 
                  ("onInstanceFinish" "Override public Object" 
                                      "To be invoked at an instance finishing" 
                                      0 16 (("instance" "Instance" "" 0)) nil 
                                      "E1!~_WG*!?2zU+!" 
                                      "^t{^r^n^t^tModel model = instance.getModel();^r^n^t^tSystem.out.println(^"==>> finishing instance model:^"+model+^" id:^"+model.getId());^r^n^t^treturn null;^r^n^t}") 
                  ("setVars" "Override public void" "" 0 16 
                             (("instance" "Instance" "" 0)) nil 
                             "F1!~_WG*!?2zU+!" 
                             "^t{^r^n^t^t// TODO Auto-generated method stub^r^n^t^t^r^n^t}") 
                  ("getVars" "Override public void" "" 0 16 
                             (("instance" "Instance" "" 0)) nil 
                             "G1!~_WG*!?2zU+!" 
                             "^t{^r^n^t^t// TODO Auto-generated method stub^r^n^t^t^r^n^t}") 
                  ("getVar" "Override public Variable" "" 0 16 
                            (("instance" "Instance" "" 0) 
                             ("name" "String" "" 0)) (("DAOException" 0)) 
                            "H1!~_WG*!?2zU+!" 
                            "^t{^r^n^t^t// TODO Auto-generated method stub^r^n^t^treturn null;^r^n^t}") 
                  ("setVar" "Override public void" "" 0 16 
                            (("instance" "Instance" "" 0) 
                             ("var" "Variable" "" 0)) nil "I1!~_WG*!?2zU+!" 
                            "^t{^r^n^t^t// TODO Auto-generated method stub^r^n^t^t^r^n^t}")) 
                 nil nil nil 10 "") 
         (master "91!~_WG*!?2zU+!" 1 3 "facade" "" "" "" "workflow" "" 1 nil 
                 nil nil nil nil 12 ";1!~_WG*!?2zU+!") 
         (master "%1!XaWG*!?2zU+!" 1 3 "InstanceBean" "" "" 
                 "Used to persist a process instance^r^n@author Klais Team" 
                 "workflow.dataAccess.domain" "" 1 
                 (("instanceId" "Long" "" "" "" "/ ditto" 1 16 
                                "'1!XaWG*!?2zU+!") 
                  ("modelId" "Long" "" "" "" 
                             "/ id from the process model which the instance is based on." 
                             1 16 "(1!XaWG*!?2zU+!") 
                  ("nActiveTasks" "Integer" "" "" "" 
                                  "/ number of active tasks associated to this instance." 
                                  1 16 ")1!XaWG*!?2zU+!")) 
                 (("InstanceBean" "" "" 3 16 (("modelId" "Long" "" 0)) nil 
                                  "*1!XaWG*!?2zU+!" 
                                  "    {^r^n        super();^r^n        this.instanceId = null;^r^n        this.modelId = modelId;^r^n        this.nActiveTasks = 0;^r^n    }") 
                  ("InstanceBean" "" "" 3 16 
                                  (("instanceId" "Long" "" 0) 
                                   ("modelId" "Long" "" 0)) nil 
                                  "+1!XaWG*!?2zU+!" 
                                  "^t{^r^n^t^tsuper();^r^n^t^tthis.instanceId = instanceId;^r^n^t^tthis.modelId = modelId;^r^n^t^tthis.nActiveTasks = 0;^r^n^t}") 
                  ("InstanceBean" "" "" 3 16 
                                  (("instanceId" "Long" "" 0) 
                                   ("modelId" "Long" "" 0) 
                                   ("nActiveTasks" "Integer" "" 0)) nil 
                                  ",1!XaWG*!?2zU+!" 
                                  "    {^r^n        super();^r^n        this.instanceId = instanceId;^r^n        this.modelId = modelId;^r^n        this.nActiveTasks = nActiveTasks;^r^n    }") 
                  ("getInstanceId" "Long" "" 3 16 nil nil "-1!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^treturn instanceId;^r^n^t}") 
                  ("setInstanceId" "void" "" 3 16 (("instaceId" "Long" "" 0)) 
                                   nil ".1!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^tthis.instanceId = instaceId;^r^n^t}") 
                  ("getModelId" "Long" "" 3 16 nil nil "/1!XaWG*!?2zU+!" 
                                "^t{^r^n^t^treturn modelId;^r^n^t}") 
                  ("setModelId" "void" "" 3 16 (("modelId" "Long" "" 0)) nil 
                                "01!XaWG*!?2zU+!" 
                                "^t{^r^n^t^tthis.modelId = modelId;^r^n^t}") 
                  ("isActive" "boolean" "" 3 16 nil nil "11!XaWG*!?2zU+!" 
                              "^t{^r^n^t^treturn nActiveTasks > 0;^r^n^t}") 
                  ("getNActiveTasks" "Integer" "" 3 16 nil nil 
                                     "21!XaWG*!?2zU+!" 
                                     "^t{^r^n^t^treturn nActiveTasks;^r^n^t}") 
                  ("setNActiveTasks" "void" "" 3 16 
                                     (("nActiveTasks" "Integer" "" 0)) nil 
                                     "31!XaWG*!?2zU+!" 
                                     "^t{^r^n^t^tthis.nActiveTasks = nActiveTasks;^r^n^t}") 
                  ("incNActiveTasks" "void" "" 3 16 nil nil "41!XaWG*!?2zU+!" 
                                     "^t{^r^n^t^tthis.nActiveTasks++;^r^n^t}") 
                  ("decNActiveTasks" "void" "" 3 16 nil nil "51!XaWG*!?2zU+!" 
                                     "^t{^r^n^t^tif(nActiveTasks > 0) this.nActiveTasks--;^r^n^t}") 
                  ("toString" "String" "" 3 16 nil nil "61!XaWG*!?2zU+!" 
                              "^t{^r^n^t^treturn ^"instanceId:^"+instanceId+^" modelId:^"+modelId+^" nActivetasks:^"+nActiveTasks;^r^n^t}")) 
                 nil nil nil 10 "") 
         (master "f0!XaWG*!?2zU+!" 1 3 "VarBean" "" "" 
                 "Used to persist a variable from a process instance^r^n@author Klais Team" 
                 "workflow.dataAccess.domain" "" 1 
                 (("instanceId" "Long" "" "" "" 
                                "/ id of the instance which the variable beLongs to" 
                                1 16 "h0!XaWG*!?2zU+!") 
                  ("varName" "String" "" "" "" "/ name of variable" 1 16 
                             "i0!XaWG*!?2zU+!") 
                  ("varType" "Integer" "" "" "" 
                             "/ code for the type of the variable (see Variable.java)" 
                             1 16 "j0!XaWG*!?2zU+!") 
                  ("varValue" "String" "" "" "" "" 1 16 "k0!XaWG*!?2zU+!")) 
                 (("VarBean" "" 
                             "Constructor ^r^n@param instanceId^r^n@param varName^r^n@param varType^r^n@param varValue" 
                             3 16 
                             (("instanceId" "Long" "" 0) 
                              ("varName" "String" "" 0) 
                              ("varType" "Integer" "" 0) 
                              ("varValue" "String" "" 0)) nil 
                             "l0!XaWG*!?2zU+!" 
                             "^t{^r^n^t^tsuper();^r^n^t^tthis.instanceId = instanceId;^r^n^t^tthis.varName = varName;^r^n^t^tthis.varType = varType;^r^n^t^tthis.varValue = varValue;^r^n^t}") 
                  ("VarBean" "" "" 3 16 
                             (("instanceId" "Long" "" 0) 
                              ("variable" "Variable" "" 0)) nil 
                             "m0!XaWG*!?2zU+!" 
                             "^t{^r^n^t^tsuper();^r^n^t^tthis.instanceId = instanceId;^r^n^t^tthis.varName = variable.getName();^r^n^t^tthis.varType = variable.getType();^r^n^t^tswitch(this.varType){^r^n^t^tcase Variable.BOOLTYPE: ^tthis.varValue = ((BoolVar)variable).valueToString();^t^tbreak;^r^n^t^tcase Variable.DATETYPE:^t    this.varValue = ((DateVar)variable).valueToString();^t^tbreak;^r^n^t^tcase Variable.FLOATTYPE:^tthis.varValue = ((FloatVar)variable).valueToString();^t^tbreak;^r^n^t^tcase Variable.INTTYPE:      this.varValue = ((IntVar)variable).valueToString();^t^t^tbreak;^r^n^t^tcase Variable.STRINGTYPE:   this.varValue = ((StringVar)variable).valueToString();   ^tbreak;^r^n^t^t}^t^t^r^n^t}") 
                  ("getInstanceId" "Long" "getters & setters *" 3 16 nil nil 
                                   "n0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^treturn instanceId;^r^n^t}") 
                  ("setInstanceId" "void" "" 3 16 (("instanceId" "Long" "" 0)) 
                                   nil "o0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^tthis.instanceId = instanceId;^r^n^t}") 
                  ("getVarName" "String" "" 3 16 nil nil "p0!XaWG*!?2zU+!" 
                                "^t{^r^n^t^treturn varName;^r^n^t}") 
                  ("setVarName" "void" "" 3 16 (("varName" "String" "" 0)) nil 
                                "q0!XaWG*!?2zU+!" 
                                "^t{^r^n^t^tthis.varName = varName;^r^n^t}") 
                  ("getVarType" "int" "" 3 16 nil nil "r0!XaWG*!?2zU+!" 
                                "^t{^r^n^t^treturn varType;^r^n^t}") 
                  ("setVarType" "void" "" 3 16 (("varType" "Integer" "" 0)) 
                                nil "s0!XaWG*!?2zU+!" 
                                "^t{^r^n^t^tthis.varType = varType;^r^n^t}") 
                  ("getVarValue" "String" "" 3 16 nil nil "t0!XaWG*!?2zU+!" 
                                 "^t{^r^n^t^treturn varValue;^r^n^t}") 
                  ("setVarValue" "void" "" 3 16 (("varValue" "String" "" 0)) 
                                 nil "u0!XaWG*!?2zU+!" 
                                 "^t{^r^n^t^tthis.varValue = varValue;^r^n^t}") 
                  ("getPK" "PrimaryKey" "" 3 16 nil nil "v0!XaWG*!?2zU+!" 
                           "    {^r^n        PrimaryKey pk = new PrimaryKey(this.instanceId,this.varName);^r^n        return pk;^r^n    }") 
                  ("getWfVariable" "Variable" 
                                   "Gets the process variable represented by this bean^r^n@return the variable (of course)" 
                                   3 16 nil nil "w0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^tswitch(this.varType){^r^n^t^tcase Variable.BOOLTYPE: ^treturn new BoolVar(varName, varValue);^r^n^t^tcase Variable.DATETYPE:^t    return new DateVar(varName, varValue);^r^n^t^tcase Variable.FLOATTYPE:^treturn new FloatVar(varName,varValue);^r^n^t^tcase Variable.INTTYPE:      return new IntVar(varName, varValue);^r^n^t^tcase Variable.STRINGTYPE:   return new StringVar(varName,varValue);^r^n^t^t}^t^t^r^n^t^treturn null;^r^n^t}")) 
                 nil nil nil 10 "x0!XaWG*!?2zU+!") 
         (master "d0!XaWG*!?2zU+!" 2 4 "Serializable" "" "" "" 
                 "workflow.dataAccess.domain" "" 3 nil nil nil nil nil 10 "") 
         (master "Z0!XaWG*!?2zU+!" 2 3 "PrimaryKey" "" "" "" 
                 "workflow.dataAccess.domain" "" 1 
                 (("instanceId" "Long" "" "" "" 
                                "/ id of the instance which the variable beLongs to" 
                                1 16 "z0!XaWG*!?2zU+!") 
                  ("varName" "String" "" "" "" "/ name of variable" 1 16 
                             "{0!XaWG*!?2zU+!")) 
                 (("PrimaryKey" "" "" 3 16 
                                (("instanceId" "Long" "" 0) 
                                 ("varName" "String" "" 0)) nil 
                                "|0!XaWG*!?2zU+!" 
                                "        {^r^n            this.instanceId = instanceId;^r^n            this.varName = varName;^r^n        }") 
                  ("PrimaryKey" "" "" 3 16 nil nil "}0!XaWG*!?2zU+!" 
                                "        {^r^n^r^n") 
                  ("getInstanceId" "Long" "" 3 16 nil nil "~0!XaWG*!?2zU+!" 
                                   "        {^r^n            return instanceId;^r^n        }") 
                  ("setInstanceId" "void" "" 3 16 (("instanceId" "Long" "" 0)) 
                                   nil "!1!XaWG*!?2zU+!" 
                                   "        {^r^n            this.instanceId = instanceId;^r^n        }") 
                  ("getVarName" "String" "" 3 16 nil nil "^"1!XaWG*!?2zU+!" 
                                "        {^r^n            return varName;^r^n        }") 
                  ("setVarName" "void" "" 3 16 (("varName" "String" "" 0)) 
                                nil "#1!XaWG*!?2zU+!" 
                                "        {^r^n            this.varName = varName;^r^n        }")) 
                 nil nil nil 10 "") 
         (master "L0!XaWG*!?2zU+!" 1 3 "TaskBean" "" "" 
                 "Used to persist a task from a process instance^r^n@author Klais Team" 
                 "workflow.dataAccess.domain" "" 1 
                 (("instanceId" "Long" "" "" "" 
                                "/ instance to which the task belongs to" 1 16 
                                "N0!XaWG*!?2zU+!") 
                  ("activityId" "Long" "" "" "" 
                                "/ activity that originated the task" 1 16 
                                "O0!XaWG*!?2zU+!") 
                  ("role" "String" "" "" "" 
                          "/ user role enabled to perform the task" 1 16 
                          "P0!XaWG*!?2zU+!")) 
                 (("TaskBean" "" "" 3 16 
                              (("instanceId" "Long" "" 0) 
                               ("activityId" "Long" "" 0) 
                               ("role" "String" "" 0)) nil "Q0!XaWG*!?2zU+!" 
                              "^t{^r^n^t^tsuper();^r^n^t^tthis.instanceId = instanceId;^r^n^t^tthis.activityId = activityId;^r^n^t^tthis.role = role;^r^n^t}") 
                  ("getInstanceId" "Long" "getters & setters *" 3 16 nil nil 
                                   "R0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^treturn instanceId;^r^n^t}") 
                  ("setInstanceId" "void" "" 3 16 (("instanceId" "Long" "" 0)) 
                                   nil "S0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^tthis.instanceId = instanceId;^r^n^t}") 
                  ("getActivityId" "Long" "" 3 16 nil nil "T0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^treturn activityId;^r^n^t}") 
                  ("setActivityId" "void" "" 3 16 (("activityId" "Long" "" 0)) 
                                   nil "U0!XaWG*!?2zU+!" 
                                   "^t{^r^n^t^tthis.activityId = activityId;^r^n^t}") 
                  ("getRole" "String" "" 3 16 nil nil "V0!XaWG*!?2zU+!" 
                             "^t{^r^n^t^treturn role;^r^n^t}") 
                  ("setRole" "void" "" 3 16 (("role" "String" "" 0)) nil 
                             "W0!XaWG*!?2zU+!" 
                             "^t{^r^n^t^tthis.role = role;^r^n^t}") 
                  ("getPK" "PrimaryKey" "" 3 16 nil nil "X0!XaWG*!?2zU+!" 
                           "    {^r^n        PrimaryKey pk = new PrimaryKey(this.instanceId,this.activityId);^r^n        return pk;^r^n    }")) 
                 nil nil nil 10 "Y0!XaWG*!?2zU+!") 
         (master "I0!XaWG*!?2zU+!" 1 3 "domain" "" "" "" "workflow.dataAccess" 
                 "" 1 nil nil nil nil nil 12 "K0!XaWG*!?2zU+!") 
         (master ";0!,cWG*!?2zU+!" 1 3 "InstanceDaoInterface" "" "" 
                 "Dao interface for InstanceBean (representing a process instance).^r^n@author Klais Team" 
                 "workflow.dataAccess.dao" "" 7 
                 (("MODELFIELDNAME" "String" "" "" "^"model^"" "" 3 273 
                                    "=0!,cWG*!?2zU+!") 
                  ("INSTANCEIDFIELDNAME" "String" "" "" "^"instanceId^"" "" 3 
                                         273 ">0!,cWG*!?2zU+!")) 
                 (("newInstance" "Long" 
                                 "Creates and persists a new object InstanceBean.^r^nThis method should generate a unique sequential number for the bean's instanceId field.^r^n@param modelId process model id associated to the InstanceBean object ^r^n@return the Id of the created InstanceBeanObject ^r^n@throws DAOException " 
                                 3 144 (("modelId" "long" "" 0)) 
                                 (("DAOException" 0)) "?0!,cWG*!?2zU+!" "")) 
                 nil nil nil 10 "") 
         (master "70!,cWG*!?2zU+!" 2 3 "VarDaoInterface" "" "" 
                 "Dao interface for VarBean objects (representing process instance variables)^r^n@author Klais Team" 
                 "workflow.dataAccess.dao" "" 7 nil 
                 (("deleteAllByInstanceId" "void" "" 3 144 
                                           (("instanceId" "Long" "" 0)) 
                                           (("DAOException" 0)) 
                                           "90!,cWG*!?2zU+!" "") 
                  ("getAllByInstanceId" "List<VarBean>" "" 3 144 
                                        (("instanceId" "Long" "" 0)) 
                                        (("DAOException" 0)) 
                                        ":0!,cWG*!?2zU+!" "")) nil nil nil 10 
                 "") 
         (master "-0!,cWG*!?2zU+!" 1 3 "DAOFactory" "" "" 
                 "Created with IntelliJ IDEA.^r^nUser: rodrigo^r^nDate: 19/10/12^r^nTime: 13:49" 
                 "workflow.dataAccess.dao" "" 1 
                 (("instanceDao" "InstanceDaoInterface" "" "" "" "" 1 16 
                                 "/0!,cWG*!?2zU+!") 
                  ("varDao" "VarDaoInterface" "" "" "" "" 1 16 
                            "00!,cWG*!?2zU+!") 
                  ("dbType" "String" "" "" "" "/ memory | hana | postgres" 1 
                            16 "10!,cWG*!?2zU+!")) 
                 (("DAOFactory" "" "" 1 16 nil nil "20!,cWG*!?2zU+!" 
                                "    {^r^n        dbType = ConfigurationRepository.getInstance().getValue(^"db_type^");^r^n^r^n        if(dbType.equals(^"memory^")){^r^n            instanceDao = new workflow.dataAccess.dao.mem.InstanceDao();^r^n            taskDao = new workflow.dataAccess.dao.mem.TaskDao();^r^n            varDao = new workflow.dataAccess.dao.mem.VarDao();^r^n        } else if(dbType.equals(^"hana^")){^r^n            instanceDao = new workflow.dataAccess.dao.hana.InstanceDao();^r^n            taskDao = new workflow.dataAccess.dao.hana.TaskDao();^r^n            varDao = new workflow.dataAccess.dao.hana.VarDao();^r^n        } else if(dbType.equals(^"postgres^")){^r^n            instanceDao = new workflow.dataAccess.dao.postgres.InstanceDao();^r^n            taskDao = new workflow.dataAccess.dao.postgres.TaskDao();^r^n            varDao = new workflow.dataAccess.dao.postgres.VarDao();^r^n        } else {^r^n            throw new ConfigurationError();^r^n        }^r^n    }") 
                  ("getInstanceDao" "InstanceDaoInterface" "" 3 16 nil nil 
                                    "30!,cWG*!?2zU+!" 
                                    "    {^r^n        return instanceDao;^r^n    }") 
                  ("getTaskDao" "TaskDaoInterface" "" 3 16 nil nil 
                                "40!,cWG*!?2zU+!" 
                                "    {^r^n        return taskDao;^r^n    }") 
                  ("getVarDao" "VarDaoInterface" "" 3 16 nil nil 
                               "50!,cWG*!?2zU+!" 
                               "    {^r^n        return varDao;^r^n    }") 
                  ("getInstance" "DAOFactory" "" 3 17 nil nil 
                                 "60!,cWG*!?2zU+!" 
                                 "    {^r^n        if(instance == null){^r^n            instance = new DAOFactory();^r^n        }^r^n        return instance;^r^n    }")) 
                 nil nil nil 10 "") 
         (master ")0!,cWG*!?2zU+!" 1 3 "TaskDaoInterface" "" "" 
                 "Dao interface for TaskBean objects, representing workflow tasks.^r^n@author Klais Team" 
                 "workflow.dataAccess.dao" "" 7 nil 
                 (("getAllByRoles" "List<TaskBean>" "" 3 144 
                                   (("roles" "Set<<String>" "" 0)) 
                                   (("DAOException" 0)) "+0!,cWG*!?2zU+!" "") 
                  ("getAllByRole" "List<TaskBean>" "" 3 144 
                                  (("role" "String" "" 0)) 
                                  (("DAOException" 0)) ",0!,cWG*!?2zU+!" "")) 
                 nil nil nil 10 "") 
         (master "~/!,cWG*!?2zU+!" 1 3 "GenericDao" "" "" 
                 "Created with IntelliJ IDEA.^r^nUser: rodrigo^r^nDate: 19/10/12^r^nTime: 14:45" 
                 "workflow.dataAccess.dao" "" 7 nil 
                 (("persist" "PK" 
                             "Persist a new object instance into database^r^n@param newInstance^r^n@return^r^n@throws DAOException" 
                             3 144 (("newInstance" "T" "" 0)) 
                             (("DAOException" 0) ("PSQLException" 0)) 
                             "^"0!,cWG*!?2zU+!" "") 
                  ("read" "T" 
                          "Retrieve an object that was previously persisted to the database using the indicated id as primary key^r^n@param id^r^n@return^r^n@throws DAOException" 
                          3 144 (("id" "PK" "" 0)) (("DAOException" 0)) 
                          "#0!,cWG*!?2zU+!" "") 
                  ("update" "void" 
                            "Save changes made to a persistent object.^r^n@param transientObject^r^n@throws DAOException" 
                            3 144 (("transientObject" "T" "" 0)) 
                            (("DAOException" 0)) "$0!,cWG*!?2zU+!" "") 
                  ("saveupdate" "void" 
                                "Save changes made to a persistent object.^r^n@param transientObject^r^n@throws DAOException" 
                                3 144 (("transientObject" "T" "" 0)) 
                                (("DAOException" 0)) "%0!,cWG*!?2zU+!" "") 
                  ("deleteById" "void" 
                                "Remove an object from persistent storage in the database by id^r^n@param id^r^n@throws DAOException" 
                                3 144 (("id" "PK" "" 0)) (("DAOException" 0)) 
                                "&0!,cWG*!?2zU+!" "") 
                  ("listAll" "List<T>" 
                             "Gets the list off all elements^r^n@return^r^n@throws DAOException" 
                             3 144 nil (("DAOException" 0)) "'0!,cWG*!?2zU+!" 
                             "") 
                  ("deleteByField" "void" 
                                   "Remove an object from persistent storage in the database by a field and a value^r^n@param value^r^n@param field^r^n@throws DAOException" 
                                   3 144 
                                   (("field" "String" "" 0) 
                                    ("value" "Object" "" 0)) 
                                   (("DAOException" 0)) "(0!,cWG*!?2zU+!" "")) 
                 nil (("T" "" "" 0) ("PK" "" "" 0)) nil 11 "") 
         (master "{/!,cWG*!?2zU+!" 1 3 "dao" "" "" "" "workflow.dataAccess" "" 
                 1 nil nil nil nil nil 12 "}/!,cWG*!?2zU+!") 
         (master "x/!,cWG*!?2zU+!" 1 3 "dataAccess" "" "" "" "workflow" "" 1 
                 nil nil nil nil nil 12 "z/!,cWG*!?2zU+!") 
         (master "u/!,cWG*!?2zU+!" 2 3 "workflow" "" "" "" "" "" 1 nil nil 
                 nil nil nil 12 "w/!,cWG*!?2zU+!"))
(customModel "t/!_cWG*!?2zU+!" 0 3 "Untitled" "" "" 17 "" "" 1.000000 1.000000 
             (0 0 1100 850) (0 0 1100 850) 
             (place "u/!,cWG*!?2zU+!" (2) "" 12 "v/!,cWG*!?2zU+!" 
                    (40 40 106 66) (35 35 111 71) (40 44 105 65) 1 0 
                    (nil 1 -12 33 18 12 18 18) ""))
(customModel "w/!,cWG*!?2zU+!" 11 3 "workflow" "" "" 17 "u/!,cWG*!?2zU+!" 
             "t/!_cWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 850) (0 0 1100 850) 
             (place "x/!,cWG*!?2zU+!" (2) "" 12 "y/!,cWG*!?2zU+!" 
                    (40 40 120 66) (35 35 125 71) (41 44 118 65) 1 0 
                    (nil 1 -12 33 18 12 18 18) "") 
             (place "u/!,cWG*!?2zU+!" (2) "" 12 "H0!XaWG*!?2zU+!" 
                    (160 40 226 66) (155 35 231 71) (160 44 225 65) 1 0 
                    (nil 1 -12 33 18 12 18 18) "") 
             (place "91!~_WG*!?2zU+!" (2) "" 12 ":1!~_WG*!?2zU+!" 
                    (280 40 332 66) (275 35 337 71) (280 44 331 65) 1 0 
                    (nil 1 -12 33 18 12 18 18) ""))
(customModel "z/!,cWG*!?2zU+!" 11 3 "dataAccess" "" "" 17 "x/!,cWG*!?2zU+!" 
             "w/!,cWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 850) (0 0 1100 850) 
             (place "{/!,cWG*!?2zU+!" (2) "" 12 "|/!,cWG*!?2zU+!" 
                    (40 40 76 66) (35 35 81 71) (40 44 75 65) 1 0 
                    (nil 1 -12 33 18 12 18 18) "") 
             (place "I0!XaWG*!?2zU+!" (2) "" 12 "J0!XaWG*!?2zU+!" 
                    (120 40 174 66) (115 35 179 71) (120 44 173 65) 1 0 
                    (nil 1 -12 33 18 12 18 18) ""))
(customModel "}/!,cWG*!?2zU+!" 11 3 "dao" "" "" 21 "{/!,cWG*!?2zU+!" 
             "z/!,cWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 850) (0 0 1100 850) 
             (place "~/!,cWG*!?2zU+!" (3) "" 11 "!0!,cWG*!?2zU+!" 
                    (40 32 276 164) (35 1 292 169) (43 35 272 161) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place ")0!,cWG*!?2zU+!" (3) "" 10 "*0!,cWG*!?2zU+!" 
                    (332 252 600 310) (327 247 605 315) (335 253 597 308) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "-0!,cWG*!?2zU+!" (3) "" 10 ".0!,cWG*!?2zU+!" 
                    (371 19 585 163) (366 14 590 168) (374 21 582 161) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "70!,cWG*!?2zU+!" (3) "" 10 "80!,cWG*!?2zU+!" 
                    (12 248 284 306) (7 243 289 311) (15 249 281 304) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place ";0!,cWG*!?2zU+!" (3) "" 10 "<0!,cWG*!?2zU+!" 
                    (624 248 864 320) (619 243 869 325) (627 249 861 319) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (link ".0!,cWG*!?2zU+!" "<0!,cWG*!?2zU+!" 
                   (536 162 536 212 736 212 736 248) 1 "instanceDao" "" "%%" 
                   "%%" "" "" "" 3 1 (594 203 678 221) (532 170 532 170) 
                   (732 240 732 240) 1 1 "@0!,cWG*!?2zU+!" (536 162 736 248) 
                   (521 157 751 253) (594 203 678 221) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link ".0!,cWG*!?2zU+!" "*0!,cWG*!?2zU+!" (472 162 472 251) 1 
                   "taskDao" "" "%%" "%%" "" "" "" 3 0 (443 197 501 215) 
                   (476 170 476 170) (464 244 464 244) 1 1 "A0!,cWG*!?2zU+!" 
                   (443 162 501 251) (438 157 506 256) (443 197 501 215) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link ".0!,cWG*!?2zU+!" "80!,cWG*!?2zU+!" 
                   (418 162 418 212 128 212 128 248) 1 "varDao" "" "%%" "%%" 
                   "" "" "" 3 1 (248 203 298 221) (414 170 414 170) 
                   (124 240 124 240) 1 1 "B0!,cWG*!?2zU+!" (128 162 418 248) 
                   (113 157 433 253) (248 203 298 221) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link ".0!,cWG*!?2zU+!" ".0!,cWG*!?2zU+!" 
                   (584 90 635 90 635 123 584 123) 1 "instance" "" "%%" "%%" 
                   "" "" "" 3 1 (606 97 664 115) (592 86 592 86) 
                   (592 119 592 119) 1 1 "C0!,cWG*!?2zU+!" (584 90 664 123) 
                   (579 70 669 143) (606 97 664 115) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link ".0!,cWG*!?2zU+!" "!0!,cWG*!?2zU+!" (371 96 276 96) 3 "" 
                   "uses" "%%" "%%" "" "" "" 2 0 (299 79 347 113) 
                   (341 77 363 92) (284 77 306 92) 8 8 "D0!CbWG*!?2zU+!" 
                   (276 79 371 113) (271 72 376 118) (299 79 347 113) 2 0 
                   (nil 1 -12 32 18 12 18 18) ""))
(customModel "K0!XaWG*!?2zU+!" 11 3 "domain" "" "" 17 "I0!XaWG*!?2zU+!" 
             "z/!,cWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 850) (0 0 1100 850) 
             (place "L0!XaWG*!?2zU+!" (3) "" 10 "M0!XaWG*!?2zU+!" 
                    (40 40 326 228) (35 35 331 233) (44 43 322 225) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "f0!XaWG*!?2zU+!" (3) "" 10 "g0!XaWG*!?2zU+!" 
                    (484 28 878 288) (479 23 883 293) (488 32 874 284) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "%1!XaWG*!?2zU+!" (3) "" 10 "&1!XaWG*!?2zU+!" 
                    (40 280 390 540) (35 275 395 545) (44 284 386 536) 1 0 
                    (nil 1 -12 32 18 12 18 18) ""))
(customModel "Y0!XaWG*!?2zU+!" 11 3 "TaskBean" "" "" 17 "L0!XaWG*!?2zU+!" 
             "K0!XaWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 850) (0 0 1100 850) 
             (place "Z0!XaWG*!?2zU+!" (3) "" 10 "[0!XaWG*!?2zU+!" 
                    (40 40 280 184) (35 35 285 189) (43 42 277 182) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "d0!XaWG*!?2zU+!" (3) "" 10 "e0!XaWG*!?2zU+!" 
                    (300 40 376 66) (295 35 381 71) (301 41 375 65) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (link "[0!XaWG*!?2zU+!" "e0!XaWG*!?2zU+!" (279 70 299 64) 3 "" 
                   "" "%%" "%%" "" "" "" 1 0 (284 58 294 76) (287 74 287 74) 
                   (291 60 291 60) 101 101 "71!XaWG*!?2zU+!" (279 58 299 76) 
                   (250 40 328 94) (284 58 294 76) 2 0 
                   (nil 1 -12 32 18 12 18 18) ""))
(customModel "x0!XaWG*!?2zU+!" 11 3 "VarBean" "" "" 17 "f0!XaWG*!?2zU+!" 
             "K0!XaWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 850) (0 0 1100 850) 
             (place "Z0!XaWG*!?2zU+!" (3) "" 10 "y0!XaWG*!?2zU+!" 
                    (40 40 280 184) (35 35 285 189) (43 42 277 182) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "d0!XaWG*!?2zU+!" (3) "" 10 "$1!XaWG*!?2zU+!" 
                    (300 40 376 66) (295 35 381 71) (301 41 375 65) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (link "y0!XaWG*!?2zU+!" "$1!XaWG*!?2zU+!" (279 70 299 64) 3 "" 
                   "" "%%" "%%" "" "" "" 1 0 (284 58 294 76) (287 74 287 74) 
                   (291 60 291 60) 101 101 "81!XaWG*!?2zU+!" (279 58 299 76) 
                   (250 40 328 94) (284 58 294 76) 2 0 
                   (nil 1 -12 32 18 12 18 18) ""))
(customModel ";1!~_WG*!?2zU+!" 11 3 "facade" "" "" 21 "91!~_WG*!?2zU+!" 
             "w/!,cWG*!?2zU+!" 1.000000 1.000000 (0 0 1100 1700) 
             (0 0 1100 1700) 
             (place "<1!~_WG*!?2zU+!" (3) "" 10 "=1!~_WG*!?2zU+!" 
                    (300 260 718 464) (295 255 723 469) (304 264 714 460) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "J1!~_WG*!?2zU+!" (3) "" 10 "K1!~_WG*!?2zU+!" 
                    (188 32 532 206) (183 27 537 211) (192 35 528 203) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "V1!~_WG*!?2zU+!" (3) "" 10 "W1!~_WG*!?2zU+!" 
                    (111 260 265 304) (106 255 270 309) (113 261 263 303) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (place "h1!~_WG*!?2zU+!" (3) "" 10 "i1!~_WG*!?2zU+!" 
                    (300 532 648 792) (295 527 653 797) (304 536 644 788) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (link "=1!~_WG*!?2zU+!" "K1!~_WG*!?2zU+!" 
                   (504 260 504 232 348 232 348 205) 3 "" "" "%%" "%%" "" "" 
                   "" 3 1 (422 224 430 240) (500 252 500 252) 
                   (344 213 344 213) 0 0 "z1!~_WG*!?2zU+!" (348 205 504 260) 
                   (333 200 519 265) (421 223 431 241) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "W1!~_WG*!?2zU+!" "K1!~_WG*!?2zU+!" 
                   (196 260 196 232 348 232 348 205) 3 "" "" "%%" "%%" "" "" 
                   "" 3 1 (268 224 276 240) (192 252 192 252) 
                   (344 213 344 213) 0 0 "|1!~_WG*!?2zU+!" (196 205 348 260) 
                   (181 200 363 265) (267 223 277 241) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (place "70!,cWG*!?2zU+!" (3) "" 10 "~1!~_WG*!?2zU+!" 
                    (136 360 240 386) (131 355 245 391) (137 361 239 385) 1 0 
                    (nil 1 -12 32 18 12 18 18) "") 
             (link "W1!~_WG*!?2zU+!" "~1!~_WG*!?2zU+!" (188 303 188 360) 1 
                   "vdi" "" "%%" "%%" "" "" "" 3 0 (177 322 199 340) 
                   (184 311 184 311) (184 352 184 352) 1 1 "!2!~_WG*!?2zU+!" 
                   (177 303 199 360) (172 298 204 365) (177 322 199 340) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "i1!~_WG*!?2zU+!" "i1!~_WG*!?2zU+!" 
                   (418 532 418 482 453 482 453 532) 1 "instance" "" "%%" 
                   "%%" "" "" "" 3 1 (406 473 464 491) (414 524 414 524) 
                   (449 524 449 524) 1 1 "^"2!~_WG*!?2zU+!" (406 473 464 532) 
                   (401 468 469 537) (406 473 464 491) 2 0 
                   (nil 1 -12 32 18 12 18 18) ""))
(customModel "#2!AuVG*!?2zU+!" 13 3 "Untitled 1" "" "" 16 "" "" 1.000000 
             1.000000 (0 0 1100 850) (0 0 1100 850) 
             (scenPlace (808 425) ((804 173 812 409)) place "f2!FeVG*!?2zU+!" 
                        (2) "" 10 "g2!FeVG*!?2zU+!" (765 123 851 149) 
                        (760 118 856 430) (766 124 850 148) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (112 449) ((108 173 116 433)) place "$2!<uVG*!?2zU+!" 
                        (2) "" 14 "%2!<uVG*!?2zU+!" (69 111 155 161) 
                        (64 106 160 454) (69 145 155 161) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (316 441) ((312 169 320 421)) place "h1!~_WG*!?2zU+!" 
                        (2) "" 10 "&2!TtVG*!?2zU+!" (281 123 351 157) 
                        (276 118 356 446) (282 124 350 156) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (link "%2!<uVG*!?2zU+!" "&2!TtVG*!?2zU+!" (116 184 312 184) 3 
                   "createInstance(model,userId)" "" "%%" "%%" "" "" "" 8 0 
                   (121 175 307 193) (124 165 146 180) (282 165 304 180) 7 7 
                   "+2!4tVG*!?2zU+!" (116 175 312 193) (111 160 317 204) 
                   (121 175 307 193) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (scenPlace (460 433) ((456 173 464 413)) place ",2!drVG*!?2zU+!" 
                        (2) "" 10 "-2!drVG*!?2zU+!" (437 123 483 149) 
                        (432 118 488 438) (438 124 482 148) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (link "&2!TtVG*!?2zU+!" "-2!drVG*!?2zU+!" (320 192 456 192) 3 
                   "getStartActivity()" "" "%%" "%%" "" "" "" 8 0 
                   (337 183 439 201) (328 173 350 188) (426 173 448 188) 7 7 
                   ".2!JrVG*!?2zU+!" (320 183 456 201) (315 168 461 212) 
                   (337 183 439 201) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (scenPlace (564 433) ((560 173 568 417)) place "72!3oVG*!?2zU+!" 
                        (2) "" 10 "82!3oVG*!?2zU+!" (511 123 617 149) 
                        (506 118 622 438) (512 124 616 148) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (692 425) ((688 241 696 409)) place "92!pnVG*!?2zU+!" 
                        (2) "" 10 ":2!pnVG*!?2zU+!" (662 123 722 149) 
                        (657 118 727 430) (663 124 721 148) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (912 433) ((908 285 916 405)) place ";2!dnVG*!?2zU+!" 
                        (2) "" 10 "<2!dnVG*!?2zU+!" (892 123 932 149) 
                        (887 118 937 438) (893 124 931 148) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (link "&2!TtVG*!?2zU+!" "82!3oVG*!?2zU+!" (320 236 560 236) 3 
                   "newInstance(model)" "" "%%" "%%" "" "" "" 8 0 
                   (373 227 507 245) (328 217 350 232) (530 217 552 232) 7 7 
                   "=2!BnVG*!?2zU+!" (320 227 560 245) (315 212 565 256) 
                   (373 227 507 245) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "82!3oVG*!?2zU+!" "&2!TtVG*!?2zU+!" (560 268 320 268) 3 
                   "instance" "" "%%" "%%" "" "" "" 72 0 (410 259 470 277) 
                   (530 249 552 264) (328 249 350 264) 115 7 "A2!smVG*!?2zU+!" 
                   (320 259 560 277) (315 244 565 288) (410 259 470 277) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "-2!drVG*!?2zU+!" "&2!TtVG*!?2zU+!" (456 216 320 216) 3 
                   "start activity" "" "%%" "%%" "" "" "" 72 0 
                   (350 207 426 225) (426 197 448 212) (328 197 350 212) 115 7 
                   "E2!`mVG*!?2zU+!" (320 207 456 225) (315 192 461 236) 
                   (350 207 426 225) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "&2!TtVG*!?2zU+!" ":2!pnVG*!?2zU+!" (320 292 688 292) 3 
                   "getStartTask()" "" "%%" "%%" "" "" "" 8 0 
                   (457 283 551 301) (328 273 350 288) (658 273 680 288) 7 7 
                   "I2!BmVG*!?2zU+!" (320 283 688 301) (315 268 693 312) 
                   (457 283 551 301) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link ":2!pnVG*!?2zU+!" "&2!TtVG*!?2zU+!" (688 344 320 344) 3 
                   "start task" "" "%%" "%%" "" "" "" 72 0 (472 335 536 353) 
                   (658 325 680 340) (328 325 350 340) 115 7 "N2!zlVG*!?2zU+!" 
                   (320 335 688 353) (315 320 693 364) (472 335 536 353) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "&2!TtVG*!?2zU+!" "g2!FeVG*!?2zU+!" (320 368 804 368) 3 
                   "show(userId)" "" "%%" "%%" "" "" "" 8 0 (517 359 607 377) 
                   (328 349 350 364) (774 349 796 364) 7 7 "R2!OlVG*!?2zU+!" 
                   (320 359 804 377) (315 344 809 388) (517 359 607 377) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "&2!TtVG*!?2zU+!" "g2!FeVG*!?2zU+!" (320 392 804 392) 3 
                   "commit(userId, action)" "" "%%" "%%" "" "" "" 8 0 
                   (490 383 634 401) (328 373 350 388) (774 373 796 388) 7 7 
                   "V2!]kVG*!?2zU+!" (320 383 804 401) (315 368 809 412) 
                   (490 383 634 401) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "g2!FeVG*!?2zU+!" "<2!dnVG*!?2zU+!" (812 316 908 316) 3 
                   "new Task()" "" "%%" "%%" "" "" "" 8 0 (822 307 898 325) 
                   (820 297 842 312) (878 297 900 312) 7 7 "]2!djVG*!?2zU+!" 
                   (812 307 908 325) (807 292 913 336) (822 307 898 325) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "82!3oVG*!?2zU+!" ":2!pnVG*!?2zU+!" (568 252 688 252) 3 
                   "new Instance()" "" "%%" "%%" "" "" "" 8 0 
                   (579 243 677 261) (576 233 598 248) (658 233 680 248) 7 7 
                   "a2!6jVG*!?2zU+!" (568 243 688 261) (563 228 693 272) 
                   (579 243 677 261) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "&2!TtVG*!?2zU+!" "%2!<uVG*!?2zU+!" (312 404 116 404) 3 "" 
                   "" "%%" "%%" "" "" "" 8 0 (204 396 224 412) 
                   (304 400 304 400) (124 400 124 400) 115 115 
                   "e2!'iVG*!?2zU+!" (116 396 312 412) (111 384 317 424) 
                   (204 396 224 412) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link ":2!pnVG*!?2zU+!" "g2!FeVG*!?2zU+!" (696 300 804 300) 3 
                   "newTask()" "" "%%" "%%" "" "" "" 8 0 (714 291 786 309) 
                   (704 281 726 296) (774 281 796 296) 7 7 "h2!6dVG*!?2zU+!" 
                   (696 291 804 309) (691 276 809 320) (714 291 786 309) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "g2!FeVG*!?2zU+!" ":2!pnVG*!?2zU+!" (804 328 696 328) 3 
                   "start task" "" "%%" "%%" "" "" "" 72 0 (718 319 782 337) 
                   (774 309 796 324) (704 309 726 324) 115 7 
                   "l2!ebVG*!?2zU+!" (696 319 804 337) (691 304 809 348) 
                   (718 319 782 337) 2 0 (nil 1 -12 32 18 12 18 18) ""))
(customModel "p2!N`VG*!?2zU+!" 13 3 "Untitled 2" "" "" 16 "" "" 1.000000 
             1.000000 (0 0 1100 850) (0 0 1100 850) 
             (scenPlace (568 325) ((564 173 572 309)) place "f2!FeVG*!?2zU+!" 
                        (2) "" 10 "+3!K`VG*!?2zU+!" (525 123 611 149) 
                        (520 118 616 330) (526 124 610 148) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (112 337) ((108 173 116 321)) place "$2!<uVG*!?2zU+!" 
                        (2) "" 14 "-3!K`VG*!?2zU+!" (69 111 155 161) 
                        (64 106 160 342) (69 145 155 161) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (316 341) ((311 169 320 318)) place "h1!~_WG*!?2zU+!" 
                        (2) "" 10 "/3!K`VG*!?2zU+!" (281 123 351 157) 
                        (276 118 356 346) (282 124 350 156) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (link "-3!K`VG*!?2zU+!" "/3!K`VG*!?2zU+!" (116 184 312 184) 3 
                   "getNextTask(roleSet)" "" "%%" "%%" "" "" "" 8 0 
                   (146 175 282 193) (124 165 146 180) (282 165 304 180) 7 7 
                   "13!K`VG*!?2zU+!" (116 175 312 193) (111 160 317 204) 
                   (146 175 282 193) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "/3!K`VG*!?2zU+!" "+3!K`VG*!?2zU+!" (320 192 564 192) 3 
                   "getNextTask(roleSet)" "" "%%" "%%" "" "" "" 8 0 
                   (374 183 510 201) (328 173 350 188) (534 173 556 188) 7 7 
                   "53!K`VG*!?2zU+!" (320 183 564 201) (315 168 569 212) 
                   (374 183 510 201) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "/3!K`VG*!?2zU+!" "+3!K`VG*!?2zU+!" (320 288 564 288) 3 
                   "commitTask(userId, action)" "" "%%" "%%" "" "" "" 8 0 
                   (355 279 529 297) (328 269 350 284) (534 269 556 284) 7 7 
                   "I3!K`VG*!?2zU+!" (320 279 564 297) (315 264 569 308) 
                   (355 279 529 297) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "/3!K`VG*!?2zU+!" "-3!K`VG*!?2zU+!" (312 252 116 252) 3 
                   "task data" "" "%%" "%%" "" "" "" 72 0 (182 243 246 261) 
                   (282 233 304 248) (124 233 146 248) 115 7 "O3!K`VG*!?2zU+!" 
                   (116 243 312 261) (111 228 317 272) (182 243 246 261) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "-3!K`VG*!?2zU+!" "/3!K`VG*!?2zU+!" (116 276 312 276) 3 
                   "executeTask(task,userId,act)" "" "%%" "%%" "" "" "" 8 0 
                   (123 267 305 285) (124 257 146 272) (282 257 304 272) 7 7 
                   "W3!T_VG*!?2zU+!" (116 267 312 285) (111 252 317 296) 
                   (123 267 305 285) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "+3!K`VG*!?2zU+!" "/3!K`VG*!?2zU+!" (564 216 320 216) 3 
                   "task" "" "%%" "%%" "" "" "" 72 0 (425 207 459 225) 
                   (534 197 556 212) (328 197 350 212) 115 7 "[3!Z]VG*!?2zU+!" 
                   (320 207 564 225) (315 192 569 236) (425 207 459 225) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "/3!K`VG*!?2zU+!" "+3!K`VG*!?2zU+!" (320 240 564 240) 3 
                   "show(userId)" "" "%%" "%%" "" "" "" 8 0 (397 231 487 249) 
                   (328 221 350 236) (534 221 556 236) 7 7 "_3![\VG*!?2zU+!" 
                   (320 231 564 249) (315 216 569 260) (397 231 487 249) 2 0 
                   (nil 1 -12 32 18 12 18 18) ""))
(customModel "f3!#PVG*!?2zU+!" 13 3 "Untitled 3" "" "" 16 "" "" 1.000000 
             1.000000 (0 0 1100 850) (0 0 1100 850) 
             (scenPlace (236 401) ((232 153 240 389)) place "f2!FeVG*!?2zU+!" 
                        (2) "" 10 "!4!!PVG*!?2zU+!" (193 99 279 125) 
                        (188 94 284 406) (194 100 278 124) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (88 409) ((84 137 92 389)) place "h1!~_WG*!?2zU+!" (2) 
                        "" 10 "%4!!PVG*!?2zU+!" (53 91 123 125) 
                        (48 86 128 414) (54 92 122 124) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (544 301) ((540 165 548 277)) place "92!pnVG*!?2zU+!" 
                        (2) "" 10 "/4!!PVG*!?2zU+!" (514 99 574 125) 
                        (509 94 579 306) (515 100 573 124) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (scenPlace (428 409) ((424 149 432 377)) place ";2!dnVG*!?2zU+!" 
                        (2) "" 10 "14!!PVG*!?2zU+!" (408 99 448 125) 
                        (403 94 453 414) (409 100 447 124) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (link "%4!!PVG*!?2zU+!" "!4!!PVG*!?2zU+!" (92 160 232 160) 3 
                   "commitTask(task)" "" "%%" "%%" "" "" "" 8 0 
                   (103 151 221 169) (100 141 122 156) (202 141 224 156) 7 7 
                   "?4!!PVG*!?2zU+!" (92 151 232 169) (87 136 237 180) 
                   (103 151 221 169) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "!4!!PVG*!?2zU+!" "14!!PVG*!?2zU+!" (240 168 424 168) 3 
                   "getInstance()" "" "%%" "%%" "" "" "" 8 0 (288 159 376 177) 
                   (248 149 270 164) (394 149 416 164) 7 7 "_4!CNVG*!?2zU+!" 
                   (240 159 424 177) (235 144 429 188) (288 159 376 177) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "14!!PVG*!?2zU+!" "!4!!PVG*!?2zU+!" (424 188 240 188) 3 
                   "instance" "" "%%" "%%" "" "" "" 72 0 (302 179 362 197) 
                   (394 169 416 184) (248 169 270 184) 115 7 "c4!5NVG*!?2zU+!" 
                   (240 179 424 197) (235 164 429 208) (302 179 362 197) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "!4!!PVG*!?2zU+!" "/4!!PVG*!?2zU+!" (240 212 540 212) 3 
                   "decNActiveTasks()" "" "%%" "%%" "" "" "" 8 0 
                   (330 203 450 221) (248 193 270 208) (510 193 532 208) 7 7 
                   "g4!4MVG*!?2zU+!" (240 203 540 221) (235 188 545 232) 
                   (330 203 450 221) 2 0 (nil 1 -12 32 18 12 18 18) "") 
             (link "!4!!PVG*!?2zU+!" "!4!!PVG*!?2zU+!" 
                   (240 356 292 356 292 380 240 380) 3 "removeTask(task)" "" 
                   "%%" "%%" "" "" "" 8 1 (233 359 351 377) (248 337 270 352) 
                   (248 361 270 376) 7 7 "k4!fLVG*!?2zU+!" (233 356 351 380) 
                   (228 332 356 400) (233 359 351 377) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "!4!!PVG*!?2zU+!" "14!!PVG*!?2zU+!" (240 256 424 256) 3 
                   "commit()" "" "%%" "%%" "" "" "" 8 0 (301 247 363 265) 
                   (248 237 270 252) (394 237 416 252) 7 7 "o4!1KVG*!?2zU+!" 
                   (240 247 424 265) (235 232 429 276) (301 247 363 265) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "14!!PVG*!?2zU+!" "14!!PVG*!?2zU+!" 
                   (432 268 484 268 484 292 432 292) 3 "getActivity()" "" "%%" 
                   "%%" "" "" "" 8 1 (447 271 521 289) (440 249 462 264) 
                   (440 273 462 288) 7 7 "s4!oJVG*!?2zU+!" (432 268 521 292) 
                   (427 244 526 312) (447 271 521 289) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (scenPlace (680 397) ((676 149 684 385)) place "w4!OJVG*!?2zU+!" 
                        (2) "" 10 "x4!OJVG*!?2zU+!" (656 99 704 125) 
                        (651 94 709 402) (657 100 703 124) 1 4 
                        (nil 1 -12 32 18 12 15204093 18) "") 
             (link "14!!PVG*!?2zU+!" "x4!OJVG*!?2zU+!" (432 308 676 308) 3 
                   "commit()" "" "%%" "%%" "" "" "" 8 0 (523 299 585 317) 
                   (440 289 462 304) (646 289 668 304) 7 7 "y4!IIVG*!?2zU+!" 
                   (432 299 676 317) (427 284 681 328) (523 299 585 317) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "/4!!PVG*!?2zU+!" "/4!!PVG*!?2zU+!" 
                   (548 220 604 220 604 264 548 264) 3 "check for termination" 
                   "" "%%" "%%" "" "" "" 8 1 (557 225 651 259) 
                   (556 201 578 216) (556 245 578 260) 7 7 "}4!{HVG*!?2zU+!" 
                   (548 220 651 264) (543 196 656 284) (557 225 651 259) 2 0 
                   (nil 1 -12 32 18 12 18 18) "") 
             (link "x4!OJVG*!?2zU+!" "x4!OJVG*!?2zU+!" 
                   (684 320 724 320 724 364 684 364) 3 "enable successors" "" 
                   "%%" "%%" "" "" "" 8 1 (681 325 767 359) (692 301 714 316) 
                   (692 345 714 360) 7 7 "#5!CHVG*!?2zU+!" (681 320 767 364) 
                   (676 296 772 384) (681 325 767 359) 2 0 
                   (nil 1 -12 32 18 12 18 18) ""))
(customModel "n(!5<Q2(!SVgg$!" 13 3 "Untitled 4" "" "" 16 "" "" 1.000000 
             1.000000 (0 0 827 1168) (0 0 827 1168))
