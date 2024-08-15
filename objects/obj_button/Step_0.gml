if (state == buttonStates.normal) {
	if (mouseIsOver()) {
		
		state = buttonStates.selected
	}
} else if (state == buttonStates.selected) {
	if (!mouseIsOver()) {
		state = buttonStates.normal
	}
}

switch (state) {
	case buttonStates.normal:
		image_index = 0
	break
	
	case buttonStates.selected:
		image_index = 1
	break
	
	case buttonStates.clicked:
		image_index = 2
	break
	
	case buttonStates.disabled:
		image_index = 3
	break
}

if (state == buttonStates.selected) {
	if (
		mouse_check_button_released(mb_left) || 
		keyboard_check_released(vk_enter)
	) {
		onClick()
	}
}
