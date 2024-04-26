
function display_level_abil_select_prompt(player = noone) {
	if (player == noone) {
		player = get_player_target()
	}

	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_large)
	menu.title = "Select a new ability"
	menu.paddingTop = 16
	menu.buttonSpacing = 200
	menu.headerHeight = 0
	//var abilityIndex = obj_game_controller.playerAbilityTreeLevel - 1
	
	var abilities = get_abilities_for_select(player)
	
	if (array_length(abilities) == 0) {
		create_toaster("Ability select array empty", errorLevels.error)
		set_game_pause_state(false)
		instance_destroy(menu)
	} else {
		for (var i = 0; i < array_length(abilities); i++) {
			create_ability_up_button(abilities[i], menu, player)
		}
	}
	
	player.abilityTreeLevel++
}
