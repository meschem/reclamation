
function display_level_abil_lvlup_prompt() {
	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu)
	var abilities = get_abilities_for_lvlup()
	
	var selectedAbilities = array_shuffle(abilities)
	var count = min(array_length(selectedAbilities), 3)
	
	for (var i = 0; i < count; i++) {
		create_ability_lvlup_button(selectedAbilities[i], menu)
	}
}
