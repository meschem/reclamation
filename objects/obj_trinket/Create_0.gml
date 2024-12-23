
event_inherited()

name = "Unnamed"
description = "No Description"
statTextList = [] // Array of stat text

level = 1
maxLevel = 4

bonusHealth = []
bonusArmor = []
bonusProjectileCount = []
bonusCritChance = []
bonusPickupRange = []
bonusPickupReward = []
bonusAreaOfEffect = []
bonusMoveSpeed = []
bonusAttackSpeed = []
bonusAbilityCooldown = []
bonusDamageScalar = []
bonusWeaponAoe = []

template = false
equipped = false
owner = noone
slot = equipmentSlots.trinket
rarity = enumRarity.normal

show = true

persistent = true

///@description					Creates stat info for leveling
getStatLevelText = function(level) {
	//var statStrings = get_bonus_stat_vars()
	var itemStats = obj_game_controller.itemStats
	
	for (var i = 0; i < array_length(itemStats); i++) {
		
	}
}

///@description					Effects that are applied on leveling up.
///								Occurs AFTER stats applied.
///								Runs on initial level up too
onLevelUp = function() {
	// Nothing
}

///@description					Called when a trinket is leveled up from a menu. The 'level'
///								variables will be equal to the new level achieved
levelUp = function() {
	level++
	
	if (level > maxLevel) {
		show_message("Warning: Trinket exceeded Max Level")
	}
	
	process_player_stats()
	
	onLevelUp()
}

///@description					Equips the trinket
equip = function() {
	if (owner == noone) {
		throw("equip() called on unowned item")
	}
	
	equipped = true
	array_push(owner.trinkets, id)
}

///@description					Creates a trinket for a player
///@param {Id.Instance} owner	Owner to assigned
create = function(owner = noone) {
	if (!template) {
		throw("create() called on non-template item")
	}
	
	if (owner == noone) {
		owner = get_player_target()
	}
	
	var inst = create_instance(object_index)

	inst.template = false
	inst.owner = owner
	inst.equip()
	
	process_player_stats()
	
	inst.onLevelUp()
}
