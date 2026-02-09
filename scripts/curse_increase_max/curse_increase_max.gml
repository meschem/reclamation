///@description					Increases the run's max curse in minutes
///@param {real} _minutes		Minutes to increase curse by. 1 would be a standard unit.
function curse_increase_max(_minutes){
	with (obj_run_controller) {
		curseAgeMax = curseAgeMax + mtf(_minutes)
		curseAgeMax = min(curseAgeMax, curseAgeFinal)
	}
	
	with (obj_curse_bar) {
		updateMax()
	}
}
