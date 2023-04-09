///@description				Checks to see if a room has been completed
///@return {bool}			Returns if the room should be over

function check_for_room_end() {
	if (instance_number(obj_baddie) > 0) {
		show_debug_message("obj_baddie: " + string(instance_number(obj_spawner)))
		return false
	}
		
	if (instance_number(obj_spawner) > 0) {
		show_debug_message("obj_spawner: " + string(instance_number(obj_spawner)))
		return false
	}
		
	return true
}