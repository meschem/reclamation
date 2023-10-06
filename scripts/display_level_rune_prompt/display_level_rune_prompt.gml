///@param {string} title
function display_level_rune_prompt(title = "(default)") {
	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu)
	
	if (title == "(default)")
		menu.title = "You leveled up! Select a Rune."
	
	var runes = get_available_runes()
	
	var selectedRunes = array_shuffle(runes)
	var count = min(array_length(selectedRunes), 3)
	
	for (var i = 0; i < count; i++) {
		create_select_rune_button(selectedRunes[i], menu)
	}
}
