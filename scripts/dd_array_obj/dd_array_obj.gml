///@description				Dump and die
///@param {any} variable	Variable to dump
function dd_array_obj(variable) {

	// debug break point
	
	//var output = ""
	//var inspecting = variable
	
	//while (is_array(inspecting)) {
		
	//}
	
	var str = ""
	
	for (var i = 0; i < array_length(variable); i++) {
		str += variable[i].name + " \n"
	}
	
	show_message(str)
	
	//game_end()
}
