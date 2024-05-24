
if (keyboard_check_pressed(ord("G")) || gamepad_button_check_pressed(0, gp_face1)) {
	if (place_meeting(x, y, obj_player)) {
		activate()
	}
}