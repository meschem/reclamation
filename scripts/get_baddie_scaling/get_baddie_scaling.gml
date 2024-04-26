///@description				Gets a scaling stat
///@param {real} _stat		Stat type to retrieve uses enum baddieScalars
function get_baddie_scaling(_stat) {
	var _val
	
	with (obj_run_controller) {
		_val = getBaddieScaling(_stat)
	}
	
	return _val
}
