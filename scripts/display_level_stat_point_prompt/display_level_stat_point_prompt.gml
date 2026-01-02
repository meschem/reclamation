
function display_level_stat_point_prompt(_player) {
	set_game_pause_state(true)
    
    set_ui_focus_type(uiFocusTypes.statPurchaseSelection)
	
	var _itemCount = 3
	var _menu = instance_create_depth(0, 0, depths.ui, obj_stat_selection_menu)
	_menu.owner = _player
	var _foods = get_random_food_items(_itemCount, _player)
	
	_player.statsMenu.open()

	for (var i = 0; i < array_length(_foods); i++) {
		_menu.createButton(_foods[i])
	}	
}
