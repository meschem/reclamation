///@description					Provides a level up prompt for all abilities available
///								Returns false if no valid abilities found
///@param {id.Instance} player	Player to display prompt for
///@return {bool}
function display_level_abil_select_new_prompt(player = noone) {
	if (player == noone) {
		player = obj_player // get_player_target()
	}
	
	var abilities = []
	var abilitiesToDisplay = []

	set_game_pause_state(true)
	
	if (array_length(player.abilities) >= player.abilitiesMax) {
		abilities = player.abilities
	} else {
		abilities = array_shuffle(obj_ability_controller.availableAbilities) // get_abilities_for_select(player)
	}

	for (var i = 0; i < array_length(abilities); i++) {
		if (abilities[i].level < abilities[i].maxLevel) {
			array_push(abilitiesToDisplay, abilities[i])
		}
		
		if (array_length(abilitiesToDisplay) >= 3) {
			break
		}
	}
	
	if (array_length(abilitiesToDisplay) == 0) {
		set_game_pause_state(false)
		return false
	}
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_very_large)
	menu.title = "Select a new ability"
	menu.paddingTop = 16
	menu.buttonSpacing = 200
	menu.headerHeight = 0

	if (array_length(abilities) == 0) {
		create_toaster("Ability select array empty", errorLevels.error)
		set_game_pause_state(false)
		instance_destroy(menu)
	} else {
		for (var i = 0; i < array_length(abilitiesToDisplay); i++) {
			create_ability_up_button(abilitiesToDisplay[i], menu, player)
		}
	}
	
	with (menu) {
		// 18 x 25
		width = array_length(abilitiesToDisplay) * 200
		image_xscale = width / 18
		image_yscale = height / 25
		x = (view_width() - width) / 2
	}
	
	player.abilityTreeLevel++
	
	return true
}
