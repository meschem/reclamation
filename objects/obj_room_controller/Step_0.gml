if (keyboard_check_pressed(vk_f5)) {
	if (state == roomStates.pauseMenu || state == roomStates.playing) {
		isPaused = !isPaused
	}
}

if (game_is_paused()) return 0

age++

timeDisplay = get_time_from_age(age)

if (
	state != roomStates.completed &&
	instance_number(obj_baddie) == 0 &&
	instance_number(obj_spawner) == 0
) {
	state = roomStates.completed
	room_end_store_globals()
	show_message("Level Complete!")
	room_goto(nextLevel)
}
