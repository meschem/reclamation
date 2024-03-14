if (keyboard_check_pressed(vk_f5) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start)) {
	if (state == roomStates.pauseMenu || state == roomStates.playing) {
		isPaused = !isPaused
	}
}

if (game_is_paused()) {
	return 0
}

if (keyboard_check_pressed(vk_f9)) { 
	room_goto(nextLevel)
}

age++

if (state == roomStates.overtime) {
	timeDisplay = ceil(max(0, frames_to_seconds(overtimeLength - overtimeAge)))
} else {
	timeDisplay = get_time_from_age(age)
}

if (
	state != roomStates.overtime &&
	instance_number(obj_ability_selection_menu) == 0 &&
	instance_number(obj_baddie) == 0 &&
	instance_number(obj_spawner) == 0
) {
	// USE ROOM REWARD SELECTION HERE
	display_level_trinket_prompt()

	state = roomStates.overtime
}

if (state == roomStates.overtime) {
	overtimeAge++
	
	if (overtimeAge > overtimeLength) {
		obj_run_controller.challengeLevel++
		
		if (finalLevel) {
			restart_run()
		} else {
			with (obj_run_controller) {
				currentFloor++
				
				if (currentFloor == dungeon.floorCount) {
					restart_run()
				}
				
				loadRoom(dungeon.floors[currentFloor].rooms[0])
			}
		}
	}
}
