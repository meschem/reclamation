if (enabled) {
	if (state != buttonStates.disabled) {
		if (parentMenu.useMouseFocus) {
			if (mouse_is_over_hitbox()) {
				var baseId = id
		
				// sets all others to unfocused
				with (obj_card_ui) {
					if (state == buttonStates.selected) {
						state = buttonStates.normal
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
				gamepad_button_check_released(0, gp_face2) ||
				mouse_check_button_released(mb_left)
			)
		) {
			onClick()
		}
	}
} else if (mouse_check_button_released(mb_left)) {
	enabled = true
}

if (topIcon != spr_none) {
	buttonXOffset = (width - sprite_get_width(topIcon)) / 2
}

image_index = state
