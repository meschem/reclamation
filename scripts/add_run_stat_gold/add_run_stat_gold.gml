///@description	
///@param {real} _amount			Amount of gold
function add_run_stat_gold(_amount) {
	with (obj_run_stats_controller) {
		statsGoldGained += _amount
	}
}