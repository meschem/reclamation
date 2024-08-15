/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Hunter"

baseMaxHp = 30
baseMoveSpeedMax = 1.25
baseMaxArmor = 0
baseCritChance = 0.1
baseCritMultiplier = 2
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1

availableWeapons = [
	obj_weapon_throwing_knives
]

sprIdle = spr_hunter
sprWalking = spr_hunter
sprSlam = spr_hunter
abilityTrees = playerCharacters.jonah
