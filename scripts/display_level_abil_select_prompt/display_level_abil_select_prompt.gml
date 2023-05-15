// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function display_level_abil_select_prompt() {
	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu)
	var abilityIndex = obj_game_controller.playerAbilityTreeLevel - 1
	
	create_ability_up_button(obj_player.abilityTrees[0], menu)
	create_ability_up_button(obj_player.abilityTrees[1], menu)
	create_ability_up_button(obj_player.abilityTrees[2], menu)
	
	obj_game_controller.playerAbilityTreeLevel++
}