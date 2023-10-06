
if (enabled) {
	if (state != buttonStates.disabled) {
		if (mouse_is_over_hitbox()) {
			var baseId = id
		
			with (obj_card_ui) {
				if (state != buttonStates.disabled) {
					state = (id == baseId) ? buttonStates.selected : buttonStates.normal
				}
			}
		
			state = buttonStates.selected
		} else {
			state = buttonStates.normal
		}
	}

	if (parentMenu != noone) {
		menuOffset.x = parentMenu.x
		menuOffset.y = parentMenu.y
	}
}

image_index = state

//show_debug_message(camera_get_view_x(viewCamera))
//show_debug_message(camera_get_view_Y(view_camera[0]))