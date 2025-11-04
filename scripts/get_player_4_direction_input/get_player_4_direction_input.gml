///@description					Gets 4-directional input result of player. Useful for menus.
///@return {real}				Returns an enum of enumDirectionInput
function get_player_4_direction_input() {
	enum enumDirectionInput {
		none, up, right, down, left
	}
	
	var selectChangeX = 0
	var selectChangeY = 0

	if (keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu)) {
		selectChangeY = -1
	}

	if (keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl)) {
		selectChangeX = -1
	}

	if (keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd)) {
		selectChangeY = 1
	}

	if (keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr)) {
		selectChangeX = 1
	}
	
	if (selectChangeX == 0 && selectChangeY == 0) {
		return enumDirectionInput.none
	}
	
	if (selectChangeY > 0) {
		return enumDirectionInput.down
	} else if (selectChangeY < 0) {
		return enumDirectionInput.up
	} else if (selectChangeX > 0) {
		return enumDirectionInput.right
	} else if (selectChangeX < 0) {
		return enumDirectionInput.left
	}
	
	return enumDirectionInput.none
}