///@description   Description
function get_current_difficulty_level() {
	var _type = get_combat_room_type()
	
	if (_type == combatRoomTypes.openArea) {
		return 1
	}
	
	create_toaster("Difficulty may not be set properly on dungeon combat room type")
	
	return 1
	
	//var _room = get_current_dungeon_room()
		
	//return _room.difficulty
}