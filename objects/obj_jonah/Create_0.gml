/// @description Character setup

// Inherit the parent event
event_inherited()

//spawn_ability_trees(playerCharacters.jonah)

//level_up_abils_from_global()'

name = "Jonah"
className = "Templar Knight"

sprIdle = spr_jonah
sprWalking = spr_jonah_walking
sprSlam = spr_jonah_slam

hp = 50
maxHp = 50
baseMaxHp = 50

baseMoveSpeedMax = 1.1
baseMaxArmor = 0
baseCritChance = 0
baseCritMultiplier = 1.5
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1

//sprIdle = spr_big_wizard
//sprWalking = spr_big_wizard
//sprSlam = spr_big_wizard

//abilityTrees = playerCharacters.jonah

//spawn_ability_trees()

availableWeapons = [
	obj_weapon_greataxe,
	obj_weapon_war_hammer,
	obj_weapon_throwing_hammer
]

availableAbilities = [
	obj_ability_thorns,
	//obj_ability_lightning_ball,
	obj_ability_lightning_rune,
	obj_ability_shock,
	obj_ability_storm_aura,
    obj_ability_shield_orbitals
]

availableUltimateAbilities = [
	obj_ability_sword_of_heavens
]

defaultWeapon = obj_weapon_throwing_hammer

activeAbility = obj_ability_war_stomp_active

abilityTrees = [
	create_instance(obj_abil_tree_jonah_combat),
	create_instance(obj_abil_tree_jonah_storm),
]

basePoisonDamage = 0
