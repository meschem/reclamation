
movingMouse = checkMouseMovement()

usingMouse = mouse_check_button(mb_any) || movingMouse
usingKeyboard = keyboard_check(vk_anykey)

// hackier...
usingController = (
	gamepad_button_check(0, gp_padd) ||
	gamepad_button_check(0, gp_padu) ||
	gamepad_button_check(0, gp_padl) ||
	gamepad_button_check(0, gp_padr) ||
	abs(gamepad_axis_value(0, gp_axislh)) > gamepad_get_axis_deadzone(0) ||
	abs(gamepad_axis_value(0, gp_axislv)) > gamepad_get_axis_deadzone(0) ||
	abs(gamepad_axis_value(0, gp_axisrh)) > gamepad_get_axis_deadzone(0) ||
	abs(gamepad_axis_value(0, gp_axisrv)) > gamepad_get_axis_deadzone(0)
)

if (usingController) {
	lastInputType = explicitInputTypes.controller
	window_set_cursor(spr_none)
	cursor_sprite = spr_none
} else if (usingKeyboard) {
	lastInputType = explicitInputTypes.keyboard
} else if (usingMouse) {
	lastInputType = explicitInputTypes.mouse
	cursor_sprite = spr_cursor_aiming
}

//if (inputFocus == enumInputTypes.controller) {
//	window_set_cursor(spr_none)
//	cursor_sprite = spr_none
//} else {
//	//window_set_cursor(spr_cursor_aiming)
//	cursor_sprite = spr_cursor_aiming
//}