/// @description				Gives gold to the player
/// @param {real}	_amount		Amount to add

function add_gold(_amount) {
	var _player = obj_player // get_player_target()
	
	_player.gold += _amount
	_player.totalGold += _amount
	
	with (obj_coin_ui_controller) {
		flash()
	}
	
	add_run_stat_gold(_amount)
}
