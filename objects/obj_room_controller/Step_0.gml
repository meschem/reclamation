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


/// Spawners are setup in creation code

//skellySpawnCd--
//skellyWarriorCd--
//wraithCd--

//if (skellySpawnCd <= 0) {
//	spawn_baddie(obj_skeleton)
//	skellySpawnCd = skellySpawnCdMax
//}

//if (skellyWarriorCd <= 0) {
//	spawn_baddie(obj_skeleton_warrior)
//	skellyWarriorCd = skellyWarriorCdMax
//}

//if (wraithCd <= 0) {
//	spawn_baddie(obj_wraith)
//	wraithCd = wraithCdMax
//}

//if (skellySpawnCdMax > 15 && age % 240 = 0) {
//	skellySpawnCdMax--
//}

//if (skellyWarriorCdMax > 15 && age % 120 = 0) {
//	skellyWarriorCdMax -= 5
//}

//if (wraithCdMax > 15 && age % 120 = 0) {
//	wraithCdMax -= 5
//}