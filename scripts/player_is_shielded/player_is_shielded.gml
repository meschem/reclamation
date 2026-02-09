///@description   Checks if player is invuln
///@return {bool}
function player_is_shielded(_player) {
	with (obj_buff) {
		if (owner == _player && shield) {
			return true
		}
	}
	
	return false
}