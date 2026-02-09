
function display_level_merger_prompt(_player) {
	set_game_pause_state(true)
	
	var _menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	_menu.title = "Select an item"
	
	var _mergers = get_available_mergers(_player)
	
	var _count = min(array_length(_mergers), 3)
	
	for (var i = 0; i < _count; i++) {
		create_select_merger_button(_mergers[i], _menu)
	}
}
