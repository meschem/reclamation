/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Phaedra"

sprIdle = spr_phaedra
sprWalking = spr_phaedra
sprSlam = spr_phaedra

baseMaxHp = 40
baseMoveSpeedMax = 1.25
baseMaxArmor = 0
baseCritChance = 0.1
baseCritMultiplier = 1.5
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1.5

activeAbility = obj_ability_shadow_step

abilityTrees = [
	create_instance(obj_abil_tree_ophelia_nature),
	create_instance(obj_abil_tree_ophelia_survival)
]

availableWeapons = [
	obj_weapon_chakram
]

defaultWeapon = obj_weapon_chakram

init_floating(2, stf(2))

shadowSprite = spr_shadow_lg
shadowOffsetY = 15
shadowScale = 1

//abilityTrees = playerCharacters.jonah
