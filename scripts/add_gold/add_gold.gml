/// @description				Gives gold to the player
/// @param {real}	_amount		Amount to add

function add_gold(_amount, _player = noone) {
	if (_player == noone) {
		_player = get_first_player()
	}
	
	_player.gold += _amount
	_player.totalGold += _amount
	
	with (obj_coin_ui_controller) {
		flash()
	}
	
	add_run_stat_gold(_amount)
}
