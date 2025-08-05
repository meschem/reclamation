///@description							Opens the player's inventory to view equipment
///@param {id.Instance} _parentMenu		Parent menu to reference
///@param {id.Instance}	_player			Player's inventory to open
///@return {id.Instance}				Menu that's created
function open_player_inventory(_parentMenu = noone, _player = noone){
	if (_player == noone) {
		_player = get_first_player()
	}
	
	var _menu = instance_create_depth(0, 0, depths.ui, obj_equipment_menu)
	
	set_game_pause_state(true)
	
	_menu.setupButtons(_player)
	_menu.player = _player
	
	if (_parentMenu != noone) {
		_menu.parentMenu = menu
		menu.hide()
	}
	
	return _menu
}
