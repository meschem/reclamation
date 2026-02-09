///@description							Creates an ability upgrade button
///@param {id.Instance} _weapon			obj_ability_tree to pass
///@param {id.Instance} _menu			Menu to attach eate_select_weapon_button(_weapon, _menu = noone) {
function create_weapon_select_button(_weapon, _menu = noone) {
	with (_weapon) {
		var _button = instance_create_depth(0, 0, depths.ui, obj_card_weapon_selection)
		
		_button.titleText.body = name
		_button.bodyText.body = description
		_button.weapon = id
		_button.topIcon = sprite_index
	
		_menu.title = "Select a weapon"
	
		if (_menu != noone) {
			_button.parentMenu = _menu
			_menu.buttons[array_length(_menu.buttons)] = _button
			_button.depth = _menu.depth - 1
		}
	}
}
