
if (game_is_paused()) {
	return 0
}

if (!shopActive) {
	activate()
}

playerInArea = place_meeting(x, y, obj_player)

if (keyboard_check_pressed(ord(keyboardInput)) || gamepad_button_check_pressed(0, controllerInput)) {
	if (instance_number(obj_shop_menu_mergers) == 0 && playerInArea) {
		open()
	}
}
