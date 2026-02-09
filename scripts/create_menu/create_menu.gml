/// @description							Creates a menu to interact with
/// @param {string|asset.GMObject} _title	obj_menu OR for custom, Title displayed at top 
/// @param {string}	_subTitle				_subTitle
/// @param {bool} _centered					Center the window

function create_menu(_title = "", _subTitle = "", _centered = true) {
	/// @description Sets up a menu, but does not display or activate it
	if (!is_string(_title)) {
		var _menu = instance_create_depth(0, 0, depths.ui, _title)
		
		return _menu
	}
	
	var _menu = instance_create_depth(x, y, depths.ui, obj_menu)
	
	_menu.title = _title
	_menu.subTitle = _subTitle
	_menu.centered = _centered
	_menu.buttons = []

	//if (centered)
		//center_menu(menu)
		
	return _menu
}

function create_pause_menu() {
	instance_create_depth(-999, -999, depths.ui, obj_pause_menu)
}