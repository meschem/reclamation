///@description   Restarts the run

function restart_run() {
	global.runStarted = false
	room_goto(rm_start_dev)
}