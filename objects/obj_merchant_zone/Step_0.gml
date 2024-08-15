
playerInArea = place_meeting(x, y, obj_player)

if (keyboard_check_pressed(ord(keyboardInput)) || gamepad_button_check_pressed(0, controllerInput)) {
	if (playerInArea) {
		activate()
	}
}
