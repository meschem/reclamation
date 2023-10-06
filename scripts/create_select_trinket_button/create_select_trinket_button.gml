///@description							Creates an ability upgrade button
///@param {asset.GMObject} trinket		obj_ability_tree to pass
///@param {id.Instance} menu			Menu to attach to

function create_select_trinket_button(trinket, menu = noone) {
	with (trinket) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_trinket_selection)

		button.titleText.body = name
		button.bodyText.body = description
		button.trinket = id
	
		menu.title = "You Leveled up!"
	
		if (menu != noone) {
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}