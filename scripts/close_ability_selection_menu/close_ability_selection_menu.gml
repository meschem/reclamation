// assumes only 1 menu window exists

function close_ability_selection_menu() {
	with (obj_ability_selection_menu) {
		for (var i = 0; i < array_length(buttons); i++) {
			instance_destroy(buttons[i])
		}
		
		instance_destroy()
	}
}