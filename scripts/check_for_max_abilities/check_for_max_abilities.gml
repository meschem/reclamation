///@description						Checks if max abilities has been hit for a player and adjusts
///									ability pool on obj_ability_controller
///@param {id.Instance} _player		Player to check for
function check_for_max_abilities(_player) {
	var _count = 0
	
	with (obj_ability) {
		if (owner == _player && level > 0) {
			_count++
		}
	}

	throw ("don't use this yet")
}