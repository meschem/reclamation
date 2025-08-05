/// size is calculated per frame to handle additions of buttons
/// shouldn't cause expense issues since game is almost always
/// paused during menus

age++

if (!focused) {
	return 0
}

var buttonFocus = 0

if (mouse_check_button_released(mb_left)) {
	for (var i = 0; i < array_length(buttons); i++) {
		if (mouse_is_over_button(buttons[i])) {
			activate_button(buttons[i])
			return 0
		}
	}
}

if (keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_face1)) {
	activate_button(buttons[selectedButtonIndex])
	buttonPressed = false
	return 0
}

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
	if (canClose) {
		close()
	}
} else if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1)) {
	buttonPressed = true
} else {
	if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)) {
		buttonFocus = 1
	} else if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)) {
		buttonFocus = -1
	}
}

// currently has wrap-around behavior for button selection
if (buttonFocus != 0) {
	do {
		selectedButtonIndex += buttonFocus
		
		if (selectedButtonIndex >= array_length(buttons)) {
			selectedButtonIndex = 0
		} else if (selectedButtonIndex < 0) {
			selectedButtonIndex = array_length(buttons) - 1
		}
	} until (buttons[selectedButtonIndex].enabled)
}

if (dynamicHeight) {
	menuHeight = 0

	menuHeight = sprite_height 
	menuHeight += (2 * paddingY)
	menuHeight += titleHeight

	var buttonOffset = 0
	var buttonHeight = buttonMarginY

	for (var i = 0; i < array_length(buttons); i++) {
		//buttonHeight = buttons[i].buttonHeight + buttonMarginY
		
		buttons[i].x = x + paddingX
		buttons[i].y = y + paddingY + titleHeight + buttonOffset

		if (buttons[i].fitWidthToMenu)
			buttons[i].buttonWidth = menuWidth - (paddingX * 2)
			
		if (selectedButtonIndex == i) {
			buttons[i].state = buttonPressed ? buttonStates.clicked : buttonStates.selected
			buttons[i].clickedOn = get_current_frame()
		} else {
			buttons[i].state = buttonStates.normal
		}
		
		buttonHeight = buttons[i].buttonHeight + buttonMarginY
		menuHeight += buttonHeight
		buttonOffset += buttonHeight
	}
	
}

if (centeredX) {
	marginX = camera_get_view_width(view_camera[0]) - menuWidth
	//marginX = camera_get_view_width(view_camera[view_current]) - width
	x = round(marginX / 2)
}

if (centeredY) {
	marginY = camera_get_view_height(view_camera[0]) - menuHeight
	//marginY = camera_get_view_height(view_camera[view_current]) - height
	y = round(marginY / 2)
}

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height
