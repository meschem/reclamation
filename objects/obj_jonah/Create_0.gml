/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Jonah"

sprIdle = spr_jonah
sprWalking = spr_jonah_walking
sprSlam = spr_jonah_slam

//sprIdle = spr_big_wizard
//sprWalking = spr_big_wizard
//sprSlam = spr_big_wizard

//abilityTrees = playerCharacters.jonah

//spawn_ability_trees()

availableWeapons = [
	obj_weapon_greataxe,
	obj_weapon_war_hammer
]

defaultWeapon = obj_weapon_greataxe

activeAbility = obj_ability_charge

abilityTrees = [
	create_instance(obj_abil_tree_jonah_combat),
	create_instance(obj_abil_tree_jonah_storm),
]

basePoisonDamage = 0
