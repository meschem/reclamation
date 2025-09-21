
function display_level_stat_point_prompt(_player) {
	set_game_pause_state(true)
	
	var _menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	var _stats = [
		enumCharStats.str,
		enumCharStats.dex,
		enumCharStats.int,
	]

	var _button = noone
	var _depth = _menu.depth - 1
	
	// str
	_button = instance_create_depth(0, 0, depths.ui, obj_card_stat_point_selection)
	_button.statAmount = irandom(1) + 1
	
	_button.titleText.body = "Strength"
	_button.bodyText.body = $"+{_button.statAmount} Str"
	_button.statType = enumCharStats.str
	_button.parentMenu = _menu
	array_push(_menu.buttons, _button)
	_button.depth = _depth
		
	// dex
	_button = instance_create_depth(0, 0, depths.ui, obj_card_stat_point_selection)
	_button.statAmount = irandom(1) + 1
	
	_button.titleText.body = "Dexterity"
	_button.bodyText.body = $"+{_button.statAmount} Dex"
	_button.statType = enumCharStats.dex
	_button.parentMenu = _menu
	array_push(_menu.buttons, _button)
	_button.depth = _depth
	
	// int
	_button = instance_create_depth(0, 0, depths.ui, obj_card_stat_point_selection)
	_button.statAmount = irandom(1) + 1
	
	_button.titleText.body = "Intelligence"
	_button.bodyText.body = $"+{_button.statAmount} Int"
	_button.statType = enumCharStats.int
	_button.parentMenu = _menu
	array_push(_menu.buttons, _button)
	_button.depth = _depth
}
