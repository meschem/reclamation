
if (keyboard_check_pressed(vk_f3) || gamepad_button_check_pressed(0, gp_shoulderrb)) {
	window_set_fullscreen(!window_get_fullscreen())
}

if (state == mainMenuStates.title) {
	if (keyboard_check_released(vk_enter) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
		instance_create_depth(-999, -999, depths.ui, obj_main_menu)
		state = mainMenuStates.menu
	}
	
	ctaDelay++
	
	if (ctaDelay >= ctaRate) {
		ctaDraw = !ctaDraw
		ctaDelay = 0
	}
} else if (state == mainMenuStates.menu) {
	ctaDraw = false
}
