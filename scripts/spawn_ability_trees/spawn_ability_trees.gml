///@description   Description
function spawn_ability_trees() {
	obj_player.abilityTrees = [
		instance_create_depth(x, y, 0, obj_abil_tree_jonah_combat),
		instance_create_depth(x, y, 0, obj_abil_tree_jonah_defense),
		instance_create_depth(x, y, 0, obj_abil_tree_jonah_storm)
	]
}