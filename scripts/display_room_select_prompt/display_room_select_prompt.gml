///@description					Select a dungeon room to explore
function display_room_select_prompt() {
	set_game_pause_state(true)

	var _rooms = get_available_dungeon_rooms()
	
	if (array_length(_rooms) == 0) {
		create_toaster("Error displaying rooms: Dungeon not setup", errorLevels.warning)
		set_game_pause_state(false)
		return false
	}	
	
	var _menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)

	for (var i = 0; i < array_length(_rooms); i++) {
		create_room_select_button(_rooms[i], _menu)
	}
	
	return true
}
