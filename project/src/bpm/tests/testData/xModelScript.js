(function () {

	/** code generated automatically - handle with care ! **/

	/**
	 *	 called at instance creation 
	 */
	function onStart(instanceData){

		/** put your code here **/
		console.log("Script for { onStart, Start, onExec, name:[ NAME ] }");

	}



	/**
	 *called at instance finish 
	 */
	function onFinish(instanceData){

		/** put your code here **/
		console.log("Script for { onFinish, Finish, onExec, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Proponente
	 * type: UserTask
	 * name: Elaborar Proposta
	 * operation: enable
	 *
	 */
	function script_0(instanceData){

		/** put your code here **/
		console.log("Script for { script_0, UserTask, enable, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Proponente
	 * type: UserTask
	 * name: Elaborar Proposta
	 * operation: commit
	 *
	 */
	function script_1(instanceData){

		/** put your code here **/
		console.log("Script for { script_1, UserTask, commit, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Proponente
	 * type: UserTask
	 * name: Resultado
	 * operation: enable
	 *
	 */
	function script_2(instanceData){

		/** put your code here **/
		console.log("Script for { script_2, UserTask, enable, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Proponente
	 * type: UserTask
	 * name: Resultado
	 * operation: commit
	 *
	 */
	function script_3(instanceData){

		/** put your code here **/
		console.log("Script for { script_3, UserTask, commit, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Consultor de Negócio
	 * type: UserTask
	 * name: Analisar Proposta
	 * operation: enable
	 *
	 */
	function script_4(instanceData){

		/** put your code here **/
		console.log("Script for { script_4, UserTask, enable, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Consultor de Negócio
	 * type: UserTask
	 * name: Analisar Proposta
	 * operation: commit
	 *
	 */
	function script_5(instanceData){

		/** put your code here **/
		console.log("Script for { script_5, UserTask, commit, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Consultor Financeiro
	 * type: UserTask
	 * name: Analisar Proposta
	 * operation: enable
	 *
	 */
	function script_6(instanceData){

		/** put your code here **/
		console.log("Script for { script_6, UserTask, enable, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Consultor Financeiro
	 * type: UserTask
	 * name: Analisar Proposta
	 * operation: commit
	 *
	 */
	function script_7(instanceData){

		/** put your code here **/
		console.log("Script for { script_7, UserTask, commit, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Consultor de Negócio
	 * type: ExclusiveFork
	 * name: Aprovada ?
	 * operation: exec
	 * transition names: SIM, NÃO
	 *
	 */
	function script_8(instanceData){

		/** put your code here **/
		console.log("Script for { script_8, ExclusiveFork, exec, name:[ NAME ] }");
		instanceData.setPath("NÃO");

	}

	/**
	 *
	 * lane: Consultor de Negócio
	 * type: ScriptTask
	 * name: Emitir aprovação
	 * operation: exec
	 *
	 */
	function script_9(instanceData){

		/** put your code here **/
		console.log("Script for { script_9, ScriptTask, exec, name:[ NAME ] }");

	}

	/**
	 *
	 * lane: Consultor Financeiro
	 * type: ScriptTask
	 * name: Emitir rejeição
	 * operation: exec
	 *
	 */
	function script_10(instanceData){

		/** put your code here **/
		console.log("Script for { script_10, ScriptTask, exec, name:[ NAME ] }");

	}

	 return {
		"onStart"	: onStart,
		"onFinish"	:onFinish,
		"script_0"	: script_0,
		"script_1"	: script_1,
		"script_2"	: script_2,
		"script_3"	: script_3,
		"script_4"	: script_4,
		"script_5"	: script_5,
		"script_6"	: script_6,
		"script_7"	: script_7,
		"script_8"	: script_8,
		"script_9"	: script_9,
		"script_10"	: script_10,
	}
})();