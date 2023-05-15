/// @description Step

gameFrame++

if (keyboard_check_pressed(vk_f3))
	window_set_fullscreen(!window_get_fullscreen())

if (keyboard_check_pressed(vk_f4)) {
	show_debug_message("Level++")
	playerXp = playerXpLevelTable[playerLevel]
	check_for_level_up()
}

// f5 is used for pause
if (keyboard_check_pressed(vk_f5)) {
	with (obj_game_controller.abilityTrees[0]) { testest = 567 }
	show_debug_message("Breaking")
}

if (keyboard_check_pressed(vk_f6)) {
	show_debug_message("Spawning wraith group")
	spawn_baddie_old(obj_wraith, 12, 60)
}

if (keyboard_check_pressed(vk_f7)) { 
	show_debug_message("Talents: ")
		list_talents()
}

if (keyboard_check_pressed(vk_f8)) { 
	spawn_baddie_at_location(obj_zombie, 240, 240)
}

if (keyboard_check_pressed(vk_f9)) { 
	display_level_abil_select_prompt()
}

if (mouse_check_button_pressed(mb_right)) {
	instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_skeleton)
}