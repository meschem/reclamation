
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
	window_set_cursor(cr_none)
	cursor_sprite = spr_none
} else if (usingKeyboard) {
	lastInputType = explicitInputTypes.keyboard
} else if (usingMouse) {
	lastInputType = explicitInputTypes.mouse
	cursor_sprite = spr_cursor_aiming
}

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, XBOX_INPUT_B)) {
    var _focusType = obj_ui_controller.focusType
    
	if (
		_focusType == uiFocusTypes.inventory ||
		_focusType == uiFocusTypes.skillDetails ||
		_focusType == uiFocusTypes.statDetails
	) {
		_focusType = uiFocusTypes.none
		
		with (obj_backpack) {
			close()
            
            return 0
		}
	}
}

if (keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
    if (instance_number(obj_pause_menu) > 0) { 
        with (obj_pause_menu) {
            close()
        }
    } else if (
        instance_number(obj_ability_selection_menu) == 0
    ) { 
       set_game_pause_state(true)
	   create_pause_menu()     
    } 
}

if (
	(keyboard_check_pressed(bindToggleInventory.keyboard) ||
	gamepad_button_check_pressed(0, bindToggleInventory.controller)) &&
    obj_ui_controller.canOpenInventory()
) {
	with (obj_player) {
		backpack.toggle()
	}
    
    return 0
}

if (
	keyboard_check_pressed(bindToggleFullscreen.keyboard) ||
	gamepad_button_check_pressed(0, bindToggleFullscreen.controller)
) {
	window_set_fullscreen(!window_get_fullscreen())
	display_reset(8, true)
    
    return 0
}