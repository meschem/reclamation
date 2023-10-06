
if (enabled) {
	if (state != buttonStates.disabled) {
		if (parentMenu.useMouseFocus) {
			if (mouse_is_over_hitbox()) {
				var baseId = id
		
				with (obj_card_ui) {
					if (state != buttonStates.disabled) {
						state = (id == baseId) ? isFocused = true : isFocused = false
					}
				}

				isFocused = true
			} else {
				isFocused = false
			}
		}
		
		if (isFocused) {
			state = buttonStates.selected
		} else {
			state = buttonStates.normal
		}
		
		if (
			state == buttonStates.selected && (
				keyboard_check_released(vk_enter) || 
				gamepad_button_check_released(0, gp_face2)
			)
		) {
			onClick()
		}
	}
}

image_index = state

//show_debug_message(camera_get_view_x(viewCamera))
//show_debug_message(camera_get_view_Y(view_camera[0]))