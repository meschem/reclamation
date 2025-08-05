///@decription					Increases the run's max curse in minutes
///@param {real} _minutes		Minutes to increase curse by
function curse_increase_max(_minutes){
	with (obj_run_controller) {
		curseAgeMax += ftm(_minutes)
		curseAgeMax = min(curseAgeMax, curseAgeFinal)
	}
	
	obj_curse_bar.updateMax()
}