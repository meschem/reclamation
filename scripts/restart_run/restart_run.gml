///@description   Restarts the run

function restart_run() {
	cleanupObjects = [
		obj_game_controller,
		obj_room_controller,
		obj_player,
		obj_ability,
		obj_ability_tree,
		obj_equipment
	]
	
	for (var i = 0; i < array_length(cleanupObjects); i++) {
		with (cleanupObjects[i]) {
			instance_destroy()
		}
	}
	
	room_goto(rm_start_dev)
}
