/// @description Step

gameFrame++

if (keyboard_check_pressed(vk_f3))
	window_set_fullscreen(!window_get_fullscreen())

if (keyboard_check_pressed(vk_f4)) {
	obj_player.xp = playerXpLevelTable[obj_player.level]
	check_for_level_up()
}

// f5 is used for pause
if (keyboard_check_pressed(vk_f5) || keyboard_check_pressed(vk_escape)) {
	show_debug_message("Breaking")
}

if (keyboard_check_pressed(vk_f6)) {
	create_shop_menu()
}

if (keyboard_check_pressed(vk_f7)) { 
	show_debug_message("Talents: ")
		list_talents()
}

if (keyboard_check_pressed(vk_f8)) {
	obj_player.gold += 500
}

if (keyboard_check_pressed(vk_f9)) { 
	process_player_stats()
}

if (mouse_check_button_pressed(mb_right)) {
	var inst = instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_wraith)
}

if (mouse_check_button_pressed(mb_middle)) {
	var inst = instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_necromancer)
	//enhance_baddie(baddieSpecialTypes.boss, inst)
}