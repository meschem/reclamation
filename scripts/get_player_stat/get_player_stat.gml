///@description						Gets a specific stat for a player
///@param {real} _playerStat		Uses enumPlayerStats
///@param {id.Instance} _player		Player to get stat for
///@return {real}
function get_player_stat(_playerStat, _player = noone) {
	if (instance_number(obj_player_stat_controller) == 0) {
		create_toaster("obj_player_stat_controller not available", errorLevels.error)
		return 0
	}
    
    if (_player == noone) {
        _player = get_first_player()
        //create_toaster("Player stat requested without player specified.", errorLevels.warning)
    }
	
	var _val = obj_player_stat_controller.getPlayerStatValue(_playerStat, _player)
	return _val
}

function get_player_stat_name(_enum) {
	var _val = obj_player_stat_controller.getPlayerStatName(_enum)
	return _val
}

function get_player_stat_description(_enum) {
	var _val = obj_player_stat_controller.getPlayerStatDescription(_enum)
	return _val
}

function get_player_stat_value_readable(_enum) {
	var _val = obj_player_stat_controller.getPlayerStatValueReadable(_enum)
	return _val
}
