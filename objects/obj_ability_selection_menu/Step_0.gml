/// size is calculated per frame to handle additions of buttons
/// shouldn't cause expense issues since game is almost always
/// paused during menus

/// For controls, all this menu should do is help decide which
/// button is focused. Clicking event is handled on the button.

buttonCount = array_length(buttons)

if (
	keyboard_check_pressed(vk_right) ||
	keyboard_check_pressed(vk_down)  ||
	gamepad_button_check_pressed(0, gp_padr) ||
	gamepad_button_check_pressed(0, gp_padd)
) {
	useMouseFocus = false
	buttonFocusIndex++
} else if (
	keyboard_check_pressed(vk_left) ||
	keyboard_check_pressed(vk_up)  ||
	gamepad_button_check_pressed(0, gp_padl) ||
	gamepad_button_check_pressed(0, gp_padu)
) {
	useMouseFocus = false
	buttonFocusIndex--
}

if (buttonFocusIndex <= -1) {
	buttonFocusIndex = buttonCount - 1
} else if (buttonFocusIndex >= buttonCount) {
	buttonFocusIndex = 0
}

if (!useMouseFocus) {
	for (var i = 0; i < array_length(buttons); i++) {
		buttons[i].isFocused = (buttonFocusIndex = i)
	}
}

scaleX = menuWidth / sprite_width
scaleY = menuHeight / sprite_height

var buttonsWidth = menuWidth - (paddingX * 2)

for (var i = 0; i < array_length(buttons); i++) {
	buttons[i].x = x + paddingX + (i * buttonSpacing)
	buttons[i].y = y + paddingTop + headerHeight
}
