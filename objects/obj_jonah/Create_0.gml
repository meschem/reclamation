/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Jonah"

sprIdle = spr_jonah
sprWalking = spr_jonah_walking
sprSlam = spr_jonah_slam
//abilityTrees = playerCharacters.jonah

//spawn_ability_trees()

abilityTrees = [
	create_instance(obj_abil_tree_jonah_combat),
	create_instance(obj_abil_tree_jonah_storm),
]
