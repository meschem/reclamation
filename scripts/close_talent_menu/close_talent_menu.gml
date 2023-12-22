// assumes only 1 menu window exists

function close_talent_menu() {
	with (obj_menu) {
		for (var i = 0; i < array_length(buttons); i++) {
			instance_destroy(buttons[i])
		}
		
		instance_destroy()
	}
}
