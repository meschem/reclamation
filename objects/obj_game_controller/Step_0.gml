/// @description Step

if (keyboard_check_pressed(vk_f3))
	window_set_fullscreen(!window_get_fullscreen())

if (keyboard_check_pressed(vk_f4)) {
	show_debug_message("Level++")
	playerXp = playerXpLevelTable[playerLevel]
	check_for_level_up()
}

if (keyboard_check_pressed(vk_f6)) {
	show_debug_message("Spawning wraith group")
	spawn_baddie(obj_wraith, 12, 60)
}
// pause logic is in obj_room_controller
