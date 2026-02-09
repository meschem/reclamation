///@description   Description

function create_level_up_menu() {
	var menu = instance_create_depth(0, 0, depths.ui, obj_level_up_menu)
	
	var talentButton = instance_create_depth(0, 0, depths.ui, obj_card_ability_selection)
	
	talentButton.parentMenu = menu
}