
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
	
	if (checkType == debugCheckTypes.objectCount) {
		for (var i = 0; i < array_length(objectChecks); i++) {
			_str = ""
			_str += object_get_name(objectChecks[i])
			_str += " - "
			_str += string(instance_number(objectChecks[i]))
		
			array_push(_txt, _str)
		}	
	} else if (checkType == debugCheckTypes.struct) {
		var _names = struct_get_names(structInfo)
		
		//show_message(_names)
		
		for (var i = 0; i < array_length(_names); i++) {
			var _val = struct_get(structInfo, _names[i])
			//show_message(_val)
			_str = ""
			_str += _names[i]
			_str += " - "
			_str += string(_val)
			
			array_push(_txt, _str)
		}
		
		//show_message(_names)
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
