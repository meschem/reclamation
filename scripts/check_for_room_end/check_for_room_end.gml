///@description				Checks to see if a room has been completed
///@return {bool}			Returns if the room should be over

function check_for_room_end() {
	if (instance_number(obj_baddie)) || (instance_number(obj_spawner) > 0) {
		return false
	}

	return true
}
