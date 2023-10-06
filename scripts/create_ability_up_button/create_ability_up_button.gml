///@description							Creates an ability upgrade button
///@param {id.Instance} abilTree		obj_ability_tree to pass
///@param {id.Instance} menu			Menu to attach to

function create_ability_up_button(abilTree, menu = noone) {	
	var player = get_player_target()
	var ability = abilTree.abilities[player.abilityTreeLevel - 1]
	
	with (ability) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_ability_selection)

		button.titleText.body = name
		button.bodyText.body = description
		button.ability = id
	
		menu.title = "You Leveled up!"
	
		if (menu != noone) {
			button.parentMenu = menu
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}
