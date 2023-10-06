///@description   Description
function get_ability_input() {
	var ability = -1
	var index = -1
	var controller	
	var validated = false
	var canUse
	var maxHotkeys = 5
	
	for (var i = 0; i < maxHotkeys; i++) {
		if (
			keyboard_check_pressed(kmInput.useAbility[i]) ||
			gamepad_button_check_pressed(controllerIndex, controllerInput.useAbility[i])
		) {
			index = i
			
			if (activeAbilities[i] != noone) {
				canUse = activeAbilities[i].canActivate()
				
				if (canUse) {
					activeAbilities[i].activate()
				}
			}			
		}	
	}
		
	if (index == -1) {
		return 0
	}
	
	if (array_length(obj_player.activeAbilities) >= (index + 1)) {
		ability = obj_player.activeAbilities[index]
	} else {
		return 0
	}
		
	//with (obj_game_controller.activeAbilityControllers[index]) {
	//	if (cooldown == 0) {
	//		validated = true
	//		cooldown = maxCd
	//	} else {
	//		show_debug_message(cooldown)
	//	}
	//} 

	//if (validated) {
	//	activate_ability(ability)
	//}
}
