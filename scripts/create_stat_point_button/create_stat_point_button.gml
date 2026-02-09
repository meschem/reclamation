///@description							Creates an ability upgrade button
///@param {real} _stat					Uses enumCharStats to pick a stat
///@param {id.Instance} _player			obj_ability to pass
///@param {id.Instance} _menu			Menu to attach to

function create_stat_point_button(_stat = enumCharStats.str, _player = noone, _menu = noone) {	
	var button = instance_create_depth(0, 0, depths.ui, obj_card_stat_point_selection)

	button.titleText.body = ability.name
	button.bodyText.body = "Level " + string(ability.level + 1)
	button.ability = id
	
	menu.title = "You Leveled up!"
	
	if (menu != noone) {
		button.parentMenu = menu
		menu.buttons[array_length(menu.buttons)] = button
		button.depth = menu.depth - 1
	}
}
