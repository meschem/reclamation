///@description					Gets 4-directional input result of player. Useful for menus.
///								 * Returns an enum of enumDirectionInput
///@return {real}				
function get_player_4_direction_input() {
	enum enumDirectionInput {
		none, up, right, down, left
	}
	
	var selectChangeX = 0
	var selectChangeY = 0

	if (
		keyboard_check_pressed(ord("W")) ||
		keyboard_check_pressed(vk_up) ||
		gamepad_button_check_pressed(0, gp_padu)
	) {
		selectChangeY = -1
	}

	if (
		keyboard_check_pressed(ord("A")) ||
		keyboard_check_pressed(vk_left) ||
		gamepad_button_check_pressed(0, gp_padl)
	) {
		selectChangeX = -1
	}

	if (
		keyboard_check_pressed(ord("S")) ||
		keyboard_check_pressed(vk_down) ||
		gamepad_button_check_pressed(0, gp_padd)
	) {
		selectChangeY = 1
	}

	if (
		keyboard_check_pressed(ord("D")) ||
		keyboard_check_pressed(vk_right) ||
		gamepad_button_check_pressed(0, gp_padr)
	) {
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