///@description   Description
function get_ability_input() {
	var ability = -1
	var index = -1
	var controller	
	var validated = false
	
	if (keyboard_check_pressed(ord("Q"))) {
		index = 0
	}
	
	if (keyboard_check_pressed(ord("E")))
		index = 1
	
	if (keyboard_check_pressed(ord("R")))
		index = 2
		
	if (index == -1) {
		return 0
	}
	
	if (array_length(obj_player.activeAbilities) >= (index + 1)) {
		ability = obj_player.activeAbilities[index]
	} else {
		return 0
	}
		
	with (obj_game_controller.activeAbilityControllers[index]) {
		if (cooldown == 0) {
			validated = true
			cooldown = maxCd
		} else {
			show_debug_message(cooldown)
		}
	} 

	if (validated) {
		activate_ability(ability)
	}
}
