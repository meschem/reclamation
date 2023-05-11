///@description							Creates an ability upgrade button
///@param {asset.GMObject} abilTree		obj_ability_tree to pass
///@param {id.Instance} menu			Menu to attach to

function create_ability_up_button(abilTree, menu = noone) {
	var ability = abilTree.abilities[obj_game_controller.playerAbilityTreeLevel - 1]
	
	with (ability) {
		var button = instance_create_depth(0, 0, depths.ui, obj_card_ability_selection)

		button.titleText.body = name
		button.bodyText.body = description
		button.ability = id
	
		menu.title = "You Leveled up!"
	
		if (menu != noone) {
			menu.buttons[array_length(menu.buttons)] = button
			button.depth = menu.depth - 1
		}
	}
}
