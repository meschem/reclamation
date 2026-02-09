
function display_level_abil_lvlup_prompt(_player) {
	var abilities = get_abilities_for_lvlup(_player)
	var selectedAbilities = array_shuffle(abilities)
	var count = min(array_length(selectedAbilities), 3)
    
    if (count == 0) {
        create_toaster("No abilities found for level up", errorLevels.error)
        return 0
    }
    
    set_game_pause_state(true)
    
    var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
    
    set_ui_focus_type(uiFocusTypes.abilityPurchaseSelection)
	
	for (var i = 0; i < count; i++) {
		create_ability_lvlup_button(selectedAbilities[i], menu)
	}
}


//function display_level_abil_lvlup_prompt_ffs(_player) {
	//set_game_pause_state(true)
	//
	//var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	//var abilities = get_abilities_for_lvlup(_player)
    //
	//var selectedAbilities = array_shuffle(abilities)
	//var count = min(array_length(selectedAbilities), 3)
	//
	//for (var i = 0; i < count; i++) {
		//create_ability_lvlup_button(selectedAbilities[i], menu)
	//}
//}
