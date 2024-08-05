///@description		Targets the player, or one of the player allies
///@return {Id.Instance}

function get_player_target(_inst = id) {
	var _targets = obj_game_controller.baddieTargets
	
	if (array_length(_targets) == 1) {
		return _targets[0]
	}
	
	var _closestDistance = 9999
	var _closestInstance = noone
	var _distance = 0
	
	for (var i = 0; i < array_length(_targets); i++) {
		_distance = point_distance(
			_targets[i].x, _targets[i].y,
			_inst.x, _inst.y
		)
		
		if (_distance < _closestDistance) {
			_closestDistance = _distance
			_closestInstance = _targets[i]
		}
	}
	
	return _closestInstance
}