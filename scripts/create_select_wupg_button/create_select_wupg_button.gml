///@description							Creates an ability upgrade button
///@param {id.Instance} upgrade			obj_weapon_upgrade to reference
///@param {id.Instance} menu			Menu to attach to

function create_select_wupg_button(upgrade, menu = noone) {
	with (upgrade) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_weapon_upgrade_selection)
		
		//show_message(upgrade.level)

		button.titleText.body = name
		button.bodyText.body = description
		button.upgrade = id
		
		//button.displayLevel = upgrade.level + 1
		// These use abilityStat structs, which show advancements from prev levels. Need to fix this on WUPGs
			
		menu.title = "Upgrade that weapon!"
	
		if (menu != noone) {
			button.parentMenu = menu
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}
