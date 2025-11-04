/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Caco"
className = "Demon Meatball"

sprIdle = spr_caco
sprWalking = spr_caco
sprSlam = spr_caco

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
	obj_weapon_fire_orb
]

availableAbilities = [
	obj_ability_assassinate,
	obj_ability_poison_wave,
	obj_ability_spirit_wolf,
	obj_ability_toxic_swarm,
	obj_ability_bear_trap
]

availableUltimateAbilities = [
	obj_ability_dragonfang_shot,
]

defaultWeapon = obj_weapon_fire_orb

init_floating(2, stf(2))

shadowSprite = spr_shadow_xl_wide
shadowOffsetY = 15
shadowScale = 1

//abilityTrees = playerCharacters.jonah
