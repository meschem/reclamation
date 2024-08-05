///@description					Removes from list of players
///@param {id.Instance} _inst	Instance to remove
///@return {bool}				True if instance is removed
function remove_player_target(_inst) {
	var _targets = obj_game_controller.baddieTargets
	
	for (var i = 0; i < array_length(_targets); i++) {
		if (_targets[i] == _inst) {
			array_delete(_targets, i, 1)
			return true
		}
	}
	
	return false
}
