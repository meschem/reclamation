///@description						Creates a run stat
///@param {real} _stat				Uses enumRunStats
///@param {real} _amt				Amount to add
///@param {id.Instance} _player		Player to add stats for
function add_run_stat(_stat, _amt = 1, _player = noone) {
	// FIXME: needs to be retrieved based on player
	var _inst = instance_find(obj_run_stats_controller, 0)
	
	switch (_stat) {
		case enumRunStats.goldGained:
			_inst.statsGoldGained += _amt
		break
		
		case enumRunStats.kills:
			show_message("add_run_stat used for kills. use add_run_stat_kills()")
		break
		
		case enumRunStats.oreGained:
			_inst.statsOreGained += _amt
		break
		
		case enumRunStats.runesGained:
			_inst.statsRunesGained += _amt
		break
		
		case enumRunStats.xpGained:
			_inst.statsXpGained += _amt
		break			
	}
}
