
if (keyboard_check_pressed(vk_f11)) {
	if (state == debugControllerStates.hidden) {
		state = debugControllerStates.overlay
	} else if (state == debugControllerStates.overlay) {
		state = debugControllerStates.full
	} else if (state == debugControllerStates.full) {
		state = debugControllerStates.hidden
	}
}



if (state != debugControllerStates.hidden) {
	// Active Debugging Stuff	
	var _txt = []
	var _str = ""
	
	for (var i = 0; i < array_length(objectChecks); i++) {
		_str = ""
		_str += object_get_name(objectChecks[i])
		_str += " - "
		_str += string(instance_number(objectChecks[i]))
		
		array_push(_txt, _str)
	}	
	// End Active Debugging
	
	textBlobs = _txt
}

if (state == debugControllerStates.overlay) {
	draw = true
	bgAlpha = 0.5
}

else if (state == debugControllerStates.full) {
	draw = true
	bgAlpha = 1
}

else if (state == debugControllerStates.hidden) {
	draw = false
}
