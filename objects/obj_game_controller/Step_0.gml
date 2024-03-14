/// @description Step

gameFrame++

if (keyboard_check_pressed(vk_f2))
	game_restart()

if (keyboard_check_pressed(vk_f3))
	window_set_fullscreen(!window_get_fullscreen())

if (keyboard_check_pressed(vk_f4) || gamepad_button_check_pressed(0, gp_face4)) {
	if (instance_number(obj_big_selection_menu == 0)) {
		obj_player.xp = playerXpLevelTable[obj_player.level]
		check_for_level_up()
	}
}

// f5 is used for pause
// Pausing handled in obj_room_controller

if (keyboard_check_pressed(vk_f6)) {
	//create_shop_menu()
	//var lvl = obj_player.getTrinketLevel(obj_trinket_golden_puzzlebox)
}

if (keyboard_check_pressed(vk_f7)) { 
	display_weapon_select_prompt()
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

if (keyboard_check_pressed(vk_f11)) { 
	show_message(obj_player.attackSpeedScalar)
}

if (keyboard_check_pressed(ord("Z"))) {
	spawn_baddie_at_location(
		obj_skeleton, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("X"))) {
	spawn_baddie_at_location(
		obj_poison_skeleton, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("C"))) {
	spawn_baddie_at_location(
		obj_slime_green, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("V"))) {
	spawn_baddie_at_location(
		obj_gold_skeleton_warrior, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("B"))) {
	spawn_baddie_at_location(
		obj_skeleton_warrior, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("N"))) {
	spawn_baddie_at_location(
		obj_greater_serpent_green, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("M"))) {
	spawn_baddie_at_location(
		obj_wraith, mouse_x, mouse_y
	)
}

if (keyboard_check_pressed(ord("K"))) {
	kill_all_baddies_in_room()
}

if (keyboard_check_pressed(ord("O"))) {
	toggle_ability_autocast()
}



if (mouse_check_button_pressed(mb_middle)) {
	var inst = instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_necromancer)
	//enhance_baddie(baddieSpecialTypes.boss, inst)
}