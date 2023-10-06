///@description							Creates an ability upgrade button
///@param {id.Instance} upgrade			obj_weapon_upgrade to reference
///@param {id.Instance} menu			Menu to attach to

function create_select_wupg_button(upgrade, menu = noone) {
	with (upgrade) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_wupg_selection)

		button.titleText.body = name
		button.bodyText.body = description
		button.upgrade = id
	
		menu.title = "You Leveled up!"
	
		if (menu != noone) {
			button.parentMenu = menu
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}
