
function display_level_trinket_prompt() {
	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	var trinkets = get_available_trinkets()
	
	var selectedTrinkets = array_shuffle(trinkets)
	var count = min(array_length(selectedTrinkets), 3)
	
	for (var i = 0; i < count; i++) {
		create_select_trinket_button(selectedTrinkets[i], menu)
	}
}
