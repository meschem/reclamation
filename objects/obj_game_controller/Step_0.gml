	/// @description Step

gameFrame++

if (keyboard_check_pressed(vk_f2)) {
	game_restart()
}

//if (keyboard_check_pressed(vk_f3) || gamepad_button_check_pressed(0, gp_shoulderrb)) {
//	window_set_fullscreen(!window_get_fullscreen())
//}

if (keyboard_check_pressed(vk_f4)) {
	if (instance_number(obj_big_selection_menu) == 0) {
		obj_player.xp = playerXpLevelTable[obj_player.level]
		check_for_level_up()
	}
}

// f5 is used for pause
// Pausing handled in obj_room_controller

if (keyboard_check_pressed(vk_f6)) {
	//create_shop_menu()
	//var lvl = obj_player.getTrinketLevel(obj_trinket_golden_puzzlebox)
	//display_room_select_prompt()
	//obj_run_stats_controller.getTotalKills()
	with (obj_run_stats_menu) {
		instance_destroy()
	}
	
	create_run_stats_menu()
}

if (keyboard_check_pressed(vk_f7)) { 
	//instance_create_depth(mouse_x, mouse_y, depth, obj_equipment_chest)
	instance_create_depth(mouse_x, mouse_y, depth, obj_merger_item_chest)
	//create_random_item_drop(mouse_x, mouse_y, 5)
}

if (keyboard_check_pressed(vk_f8)) {
	obj_player.gold += 2000
}

if (keyboard_check_pressed(vk_f9)) { 
	// goes to next level, setup on room controller	
}

if (keyboard_check_pressed(vk_f10)) { 
	with (obj_player) {
		maxHp += 10
		baseMaxHp = maxHp
		hp = maxHp
	}
}

if (keyboard_check_pressed(ord("Z"))) {
	spawn_baddie_at_location(
		obj_skeleton, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("X"))) {
	//var _baddie =
	
	spawn_baddie_at_location(
		obj_skeleton_tester, mouse_x, mouse_y
	)
	
	//create_elite_health_bar(_baddie)
	//enhance_baddie(baddieSpecialTypes.elite, _baddie)
	//apply_random_elite_buff(_baddie, 2)
}

//if (keyboard_check_pressed(ord("C"))) {
//	spawn_baddie_at_location(
//		obj_grub_small, mouse_x, mouse_y
//	)
//}

if (keyboard_check_pressed(ord("V"))) {
	spawn_baddie_at_location(
		obj_big_wizard, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("B"))) {
	spawn_baddie_at_location(
        
		obj_bugbear, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("N"))) {
	spawn_baddie_at_location(
		obj_boarrior, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("M"))) {

}

if (keyboard_check_pressed(ord("K"))) {
	kill_all_baddies_in_room()
}

if (mouse_check_button_pressed(mb_middle)) {
    create_lob_drop_with_table(mouse_x, mouse_y, enumDropType.baddieFieldBoss)
    //var _spawner = instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_lob_drop_spawner)
    //
    //_spawner.lootDrops = get_drop_table(enumDropType.baddieFieldBoss)
	//var inst = instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_necromancer)
	//with (obj_player) {
        //var _magicFind = get_player_stat(enumPlayerStats.magicFind)
		//create_random_merger_item_drop(mouse_x, mouse_y, _magicFind, enumRarity.legendary)
        
	//}
}
