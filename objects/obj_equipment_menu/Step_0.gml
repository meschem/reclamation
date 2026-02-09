
// selection
if (obj_input_controller.lastInputType == explicitInputTypes.mouse) {
	selectedButtonIndex = -1

	for (var i = 0; i < array_length(buttons); i++) {
		if (mouse_is_over_hitbox(buttons[i])) {
			selectedButtonIndex = i
		}
	}
} else { 
	if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
		close()
	}
		if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)) {
		selectedButtonIndex++
	}
		if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)) {
		selectedButtonIndex--
	}

	selectedButtonIndex = clamp(
		selectedButtonIndex,
		0,
		array_length(buttons) - 1
	)
}

if (selectedButtonIndex > -1) {
	selectedButton = buttons[selectedButtonIndex]
	
	if (obj_input_controller.lastInputType == explicitInputTypes.mouse) {
		if (mouse_check_button_pressed(mb_left)) {
			activateButton(selectedButtonIndex)
		}
	} else {
		if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face2)) {
			activateButton(selectedButtonIndex)
		}
	}
} else {
	selectedButton = noone
}

for (var i = 0; i < array_length(panels); i++) {
	panels[i].x = x + padding + panels[i].offsetX
	panels[i].y = y + padding + panels[i].offsetY
	
	panels[i].width = width - (2 * padding)
}

for (var i = 0; i < array_length(buttons); i++) {
	if (selectedButtonIndex == i) {
		buttons[i].state = buttonStates.selected
	} else {
		buttons[i].state = buttonStates.normal
	}	
}
