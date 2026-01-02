/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Zock"
className = "Hydromancer"

sprIdle = spr_zock
sprWalking = spr_zock
sprSlam = spr_zock

hp = 30
maxHp = 30
baseMaxHp = 30
baseMoveSpeedMax = 1.5
baseMaxArmor = 0
baseCritChance = 0.1
baseCritMultiplier = 2
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1

activeAbility = obj_ability_shadow_step

abilityTrees = [
	create_instance(obj_abil_tree_ophelia_nature),
	create_instance(obj_abil_tree_ophelia_survival)
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

availableWeapons = [
	obj_weapon_zock_ice
]

defaultWeapon = obj_weapon_zock_ice

//abilityTrees = playerCharacters.jonah
