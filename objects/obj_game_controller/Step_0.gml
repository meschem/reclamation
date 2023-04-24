/// @description Step

if (keyboard_check_pressed(vk_f3))
	window_set_fullscreen(!window_get_fullscreen())

if (keyboard_check_pressed(vk_f4)) {
	show_debug_message("Level++")
	playerXp = playerXpLevelTable[playerLevel]
	check_for_level_up()
}

// f5 is used for pause

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
	
	
	//instance_create_depth(
	//	30, 
	//	height,
	//	depths.ui,
	//	obj_card_ability_selection
	//)

	//instance_create_depth(
	//	room_width - 130, 
	//	height,
	//	depths.ui,
	//	obj_card_ability_selection
	//)

	//instance_create_depth(
	//	room_width / 2 - 50, 
	//	height,
	//	depths.ui,
	//	obj_card_ability_selection
	//)
}
