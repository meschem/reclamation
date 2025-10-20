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

availableAbilities = [
	obj_ability_thorns,
	obj_ability_lightning_ball,
	obj_ability_lightning_rune,
	obj_ability_shock,
	obj_ability_storm_aura
]

availableUltimateAbilities = [
	obj_ability_sword_of_heavens
]

defaultWeapon = obj_weapon_greataxe

activeAbility = obj_ability_war_stomp_active

abilityTrees = [
	create_instance(obj_abil_tree_jonah_combat),
	create_instance(obj_abil_tree_jonah_storm),
]

basePoisonDamage = 0
