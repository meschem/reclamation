///@description   Description
function set_spawner_phase_length(_seconds) {
	with (obj_room_controller) {
		spawnerPhaseDuration = seconds_to_frames(_seconds)
	}
}