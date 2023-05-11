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
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu)
	var abilityIndex = obj_game_controller.playerAbilityTreeLevel - 1
	
	create_ability_up_button(obj_player.abilityTrees[0], menu)
	create_ability_up_button(obj_player.abilityTrees[1], menu)
	create_ability_up_button(obj_player.abilityTrees[2], menu)
	
	obj_game_controller.playerAbilityTreeLevel++
}

if (mouse_check_button_pressed(mb_right)) {
	instance_create_depth(mouse_x, mouse_y, depths.enemy, obj_skeleton)
}