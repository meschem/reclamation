///@description							Creates an ability upgrade button
///@param {id.Instance} ability			obj_ability to pass
///@param {id.Instance} menu			Menu to attach to

function create_ability_lvlup_button(ability, menu = noone) {	
	var player = get_player_target()
		
	with (ability) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_ability_lvlup_selection)

		button.titleText.body = ability.name
		button.bodyText.body = "Level " + string(ability.level + 1)
		button.ability = id
	
		menu.title = "You Leveled up!"
	
		if (menu != noone) {
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}
