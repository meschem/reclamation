/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Hunter"

sprIdle = spr_ophelia
sprWalking = spr_ophelia_walking
sprSlam = spr_ophelia

baseMaxHp = 30
baseMoveSpeedMax = 1.25
baseMaxArmor = 0
baseCritChance = 0.1
baseCritMultiplier = 2
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1

abilityTrees = [
	create_instance(obj_abil_tree_ophelia_nature),
	create_instance(obj_abil_tree_ophelia_survival)
]

availableWeapons = [
	obj_weapon_throwing_knives
]



//abilityTrees = playerCharacters.jonah

