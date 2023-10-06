///@description   Checks if player is invuln
///@return {bool}
function player_is_invuln() {
	if (instance_number(obj_buff_invuln) > 0) {
		return true
	}
	
	return false
}