///@description   Description
///@return {array<struct.dungeonRoom>}
function get_available_dungeon_rooms() {
	if (instance_number(obj_dungeon) == 0) {
		return []
	}
	
	var _nextFloor = get_current_floor()
	
	if (_nextFloor >= array_length(obj_dungeon.floors)) {
		create_toaster("Dungeon Complete")
		return []
	}
	
	var _floor = obj_dungeon.floors[_nextFloor]
		
	return _floor.rooms
}
