
function display_level_stat_point_prompt(_player) {
	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	var stats = get_stat_point_for_lvlup(_player)
	
	var selectedStats = array_shuffle(stats)
	var count = min(array_length(selectedAbilities), 3)
	
	for (var i = 0; i < count; i++) {
		//create_select_stat_button
	}
}
