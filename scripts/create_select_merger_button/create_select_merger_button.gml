///@description							Creates an ability upgrade button
///@param {id.Instance} _merger			obj_ability_tree to pass
///@param {id.Instance} _menu			Menu to attach to

function create_select_merger_button(_merger, _menu = noone) {
	with (_merger) {
		var _button = instance_create_depth(0, 0, depths.ui, obj_card_merger_selection)

		_button.titleText.body = name
		_button.bodyText.body = description
		_button.merger = _merger
		_button.topIcon = _merger.sprite_index
	
		if (_menu != noone) {
			_button.parentMenu = _menu
			_menu.buttons[array_length(_menu.buttons)] = _button
			_button.depth = _menu.depth - 1
		}
	}
}
