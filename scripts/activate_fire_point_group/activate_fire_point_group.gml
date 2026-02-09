///@description   Description
function activate_fire_point_group(_index) {
	with (obj_fire_point) {
		if (groupIndex = _index) {
			state = firePointStates.spawning
		}
	}
}
