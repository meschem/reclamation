
function display_level_abil_select_prompt(player = noone) {
	if (player == noone) {
		player = get_player_target()
	}

	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu)
	//var abilityIndex = obj_game_controller.playerAbilityTreeLevel - 1
	
	create_ability_up_button(player.abilityTrees[0], menu)
	create_ability_up_button(player.abilityTrees[1], menu)
	create_ability_up_button(player.abilityTrees[2], menu)
	
	player.abilityTreeLevel++
}
