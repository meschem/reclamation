/// size is calculated per frame to handle additions of buttons
/// shouldn't cause expense issues since game is almost always
/// paused during menus

var buttonFocus = 0

//if (mouse_check_button_released(mb_left)) {
//	for (var i = 0; i < array_length(buttons); i++) {
//		if (mouse_is_over_button(buttons[i])) {
//			//activate_button(buttons[i])
//			//return 0
//		}
//	}
//}

if (keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_face1)) {
	activate_button(buttons[selectedButtonIndex])
	return 0
}

if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1)) {
	buttonPressed = true
} else {
	if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)) {
		buttonFocus = 1
	} else if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)) {
		buttonFocus = -1
	}
}

//selectedButtonIndex = clamp(selectedButtonIndex + buttonFocus, 0, array_length(buttons) - 1)

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height
