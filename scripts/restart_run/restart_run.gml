///@description   Restarts the run

function restart_run() {
	cleanupObjects = [
		obj_game_controller,
		obj_equipment_controller,
		obj_run_controller,
		obj_dungeon,
		obj_player,
		obj_ability,
		obj_ability_tree,
		obj_equipment,
		obj_run_stats_controller,
		obj_mutator_controller,
		obj_ability_controller
	]
	
	for (var i = 0; i < array_length(cleanupObjects); i++) {
		with (cleanupObjects[i]) {
			instance_destroy()
		}
	}
	
	room_goto(rm_start_dev)
}
