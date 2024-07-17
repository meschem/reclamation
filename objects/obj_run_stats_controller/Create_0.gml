///@description		Init

statsKills = ds_list_create()
statsGoldGained = 0

///@description						Adds a kill stat
///@param {id.Instance} _baddie		Baddie that was killed
///@param {id.Instance} _player		Player who got the kill
//function ffadd_stat_kill(_baddie, _player) {
//	var _killStat = new killStat(_baddie.name)
	
//	_killStat.baddieTier = _baddie.tier
//	_killStat.player = _player
	
//	with (obj_run_controller) {
//		ds_list_add(statsKills, _killStat)
//	}
//}

///@param {string} _baddieName		Name of the baddie
