/// @description				Adds an active ability for the player
/// @param {real} ability		Ability enum from playerAbilities

function add_ability(ability) {
	
	var index = array_length(obj_player.activeAbilities)	
	var inst = instance_create_depth(0, 0, 0, obj_ability_controller)
	var hotkeys = [
		"Q",
		"E",
		"R",
		"T"
	]
	
	obj_player.activeAbilities[index] = ability
	
	inst.ability = ability
	inst.x = (28 * index) + 1
	inst.y = 46
	inst.hotkey = hotkeys[index]	

	switch (ability) {
		case (playerAbilities.warStomp):
			inst.sprite_index = spr_ability_icon_war_stomp
			inst.maxCd = 600
		break
			
		case (playerAbilities.charge):
			inst.sprite_index = spr_ability_icon_charge
			inst.maxCd = 720
		break
		
		default:
			show_message("Ability not in list: " + ability)
		break
	}
	
	with (obj_game_controller) {
		activeAbilityControllers[array_length(activeAbilityControllers)] = inst
	}
}
