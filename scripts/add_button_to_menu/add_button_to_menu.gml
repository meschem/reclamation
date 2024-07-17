/// @function					add_button_to_menu(menu, button)
/// @param	{Id.Instance}		menu	Menu object to add button to
/// @param	{Id.Instance}		button	Button object

function add_button_to_menu(menu, button) {
	menu.buttons[array_length(menu.buttons)] = button
	button.menu = menu
}

