// Inherit the parent event
event_inherited();

displayText = "Options"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	menu.hide()
	
	var _menu = create_menu(obj_pause_options_menu)
	_menu.parentMenu = menu
}
