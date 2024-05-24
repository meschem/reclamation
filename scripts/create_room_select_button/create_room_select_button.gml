///@description							Creates a button to select a dungeon room
///@param {struct.dungeonRoom} _room	dungeonRoom to pass
///@param {id.Instance} _menu			Menu to attach button to
function create_room_select_button(_room, _menu = noone) {
	with (_room) {
		var _button = instance_create_depth(0, 0, depths.ui, obj_card_room_selection)

		_button.dungeonRm = _room
	
		_menu.title = "Select a Dungeon Room"
	
		if (_menu != noone) {
			_button.parentMenu = _menu
			_menu.buttons[array_length(_menu.buttons)] = _button
			_button.depth = _menu.depth - 1
			_button.titleText.body = get_room_name_from_type(_room.roomType) + " Room"
			_button.bodyText.body = get_room_description_from_type(_room.roomType)
		}
	}
}
