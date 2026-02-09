///@description					Select a dungeon room to explore
function display_room_select_prompt() {
	set_game_pause_state(true)

	var _rooms = get_available_dungeon_rooms()
	
	if (array_length(_rooms) == 0) {
		create_toaster("Error displaying rooms: Dungeon not setup", errorLevels.warning)
		set_game_pause_state(false)
		//wbe_war_hammer_on_death()
	}
	
	var _menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)

	for (var i = 0; i < array_length(_rooms); i++) {
		//show_message(get_room_reward_from_enum(_rooms[i].reward)) 
		create_room_select_button(_rooms[i], _menu)
	}
	
	return true
}
