// Inherit the parent event
event_inherited()

displayText = "Load Profile"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	menu.hide()
	
	var _menu = create_menu(obj_map_profiles_menu)
	_menu.parentMenu = menu
}
