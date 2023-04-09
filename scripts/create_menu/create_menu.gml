/// @function						create_menu(title, centered)
/// @param {string}	 title			Title displayed at top 
/// @param {string}	 subTitle		Subtitle
/// @param {bool} centered			Center the window

function create_menu(title = "", subTitle = "", centered = true) {
	/// @description Sets up a menu, but does not display or activate it
	
	var menu = instance_create_depth(x, y, depths.ui, obj_menu)
	
	menu.title = title
	menu.subTitle = subTitle
	menu.centered = centered
	menu.buttons = []

	//if (centered)
		//center_menu(menu)
		
	return menu
}