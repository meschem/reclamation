///@description   Description
///@param {real} playerCharacter		playerCharacter enum
function spawn_ability_trees(playerCharacter) {
	if (playerCharacter == playerCharacters.jonah) {
		obj_player.abilityTrees = [
			instance_create_depth(x, y, 0, obj_abil_tree_jonah_combat),
			instance_create_depth(x, y, 0, obj_abil_tree_jonah_defense),
			instance_create_depth(x, y, 0, obj_abil_tree_jonah_storm)
		]
		
		obj_game_controller.abilityTrees = [
			obj_abil_tree_jonah_combat,
			obj_abil_tree_jonah_defense,
			obj_abil_tree_jonah_storm
		]
	}
}
