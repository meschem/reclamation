///@description							Sets up a run for a single room
///@param {asset.GMRoom} _mainRoom		Main room in run
function start_single_room_run(_mainRoom) {
	with (obj_run_controller) {
		runIsActive = true
		mainRoom = _mainRoom
		type = runTypes.singleArea
		resetRun()
	}
	
	var _bar = create_instance(obj_curse_bar)
	_bar.updateMax()
}