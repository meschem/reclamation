/// @description   Description
/// @param {real}	amount	Amount to add

function add_gold(_amount) {
	var _player = get_player_target()
	
	_player.gold += _amount
	_player.totalGold += _amount
	
	add_run_stat_gold(_amount)
}
