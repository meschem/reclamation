///@description							Creates an ability upgrade button
///@param {asset.GMObject} _trinket		obj_ability_tree to pass
///@param {id.Instance} _menu			Menu to attach to

function create_select_trinket_button(_trinket, _menu = noone) {
	with (_trinket) {
		var _button = instance_create_depth(0, 0, depths.ui, obj_card_trinket_selection)

		_button.titleText.body = name
		_button.bodyText.body = description
		_button.trinket = id
		_button.topIcon = sprite_index
		
		if (_button.trinket.owner != noone) {
			_button.displayLevel = _button.trinket.level + 1
		} else {
			_button.displayLevel = 1
		}
		
		_button.titleText.body += " " + string(_button.displayLevel)
	
		_menu.title = "You Leveled up!"
	
		if (_menu != noone) {
			_button.parentMenu = _menu
			_menu.buttons[array_length(_menu.buttons)] = _button
			_button.depth = _menu.depth - 1
		}
	}
}
