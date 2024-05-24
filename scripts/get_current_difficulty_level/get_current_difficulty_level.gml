///@description   Description
function get_current_difficulty_level() {
	var _room = get_current_dungeon_room()
	
	return _room.difficulty
}