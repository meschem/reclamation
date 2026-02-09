///@description						Adds a kill stat
///@param {id.Instance} _baddie		Baddie that was killed
///@param {id.Instance} _player		Player who got the kill
function add_run_stat_kill(_baddie, _player) {
	var _controller = _player.runStatsController
	var _name = _baddie.name
	
	if (_name == "Unnamed") {
		create_toaster($" name not set.", errorLevels.warning)
	}

	if (!variable_struct_exists(_controller.statsKills, _name)) {
		struct_set(_controller.statsKills, _name, 0)
	}

	var _count = struct_get(_controller.statsKills, _name) + 1
	struct_set(_controller.statsKills, _name, _count)
	
	_controller.statsKillsTotal++
}
