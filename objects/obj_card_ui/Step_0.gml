
if (state != buttonStates.disabled) {
	if (
		mouse_x > bbox_left &&
		mouse_x < bbox_right &&
		mouse_y > bbox_top &&
		mouse_y < bbox_bottom
	) {
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

image_index = state
