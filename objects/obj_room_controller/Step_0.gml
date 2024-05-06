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

if (state == roomStates.init) {
	if (category == roomCategories.combat) {
		initCombat()
	}
	
	if (category == roomCategories.shop) {
		initShopping()
	}
	
	if (category == roomCategories.stats) {
		initStats()
	}
}

if (state == roomStates.overtime) {
	timeDisplay = ceil(max(0, frames_to_seconds(overtimeLength - overtimeAge)))
} else {
	timeDisplay = get_time_from_age(age)
}

//if (room == rm_start_dev) {
//	return 0
//}

// Combat room transition to OVERTIME
if (
	category == roomCategories.combat &&
	state != roomStates.overtime &&
	instance_number(obj_ability_selection_menu) == 0 &&
	instance_number(obj_baddie) == 0 &&
	instance_number(obj_spawner) == 0
) {
	completeCombat()
}

if (state == roomStates.overtime) {
	overtimeAge++
	
	if (overtimeAge > overtimeLength) {
		completeOvertime()
	}
}
