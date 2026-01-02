///@description							Creates an ability upgrade button
///@param {id.Instance} ability			obj_ability instance to use
///@param {id.Instance} menu			Menu to attach to
///@param {id.Instance} player			Player to get abilities from

function create_ability_up_button(ability, menu = noone, player = noone) {	
	var button = noone
	
	with (ability) {
		button = instance_create_depth(0, 0, depths.ui, obj_card_ability_selection)

		button.titleText.body = name
		button.titleTextColor = get_ability_color_from_enum(ability.iconColor)
		button.titleTextShadowColor = get_ability_color_from_enum(ability.iconColor, false)
		button.bodyText.body = description
		button.ability = id	
		button.state = buttonStates.spawning
	
		//menu.title = "You Leveled up!"
	
		if (menu != noone) {
			button.parentMenu = menu
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
	
	return button
}
