///@description							Creates a rune button to ugprade an ability
///@param {asset.GMObject} rune			Rune to select
///@param {id.Instance} menu			Menu to attach to

function create_select_rune_button(rune, menu = noone) {
	with (rune) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_rune_selection)

		button.titleText.body = ability.name + ":"
		button.subTitleText.body = name
		button.bodyText.body = description
		button.rune = rune
	
		if (menu != noone) {
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}
