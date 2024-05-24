// Inherit the parent event
event_inherited();

displayText = "Equipment"

state = buttonStates.disabled

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	var _menu = instance_create_depth(0, 0, depths.ui, obj_equipment_menu)
	_menu.parentMenu = menu
	_menu.setupButtons(get_player_target())
	
	menu.hide() 
}
