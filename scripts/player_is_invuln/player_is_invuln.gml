///@description   Checks if player is invuln
///@return {bool}
function player_is_invuln(_player) {
	if (instance_number(obj_buff_invuln) > 0) {
		return true
	}
	
	with (obj_buff) {
		if (owner == _player && invuln) {
			return true
		}
	}
	
	return false
}