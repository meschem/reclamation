///@description		Equipment
enum equipmentStats {
	bonusAttackSpeed,
	bonusAttackArea,
	bonusDamageScalar,
	bonusDamage,
	bonusArmor,
	bonusHealth,
	bonusMoveSpeed,
	bonusAbilityCooldown,
	bonusCritChance,
	bonusCritMultiplier,
	bonusProjectileCount ,
	bonusPickupRange,
	bonusPickupReward,
	bonusWeaponAoe
}

enum equipmentSlots {
	none,
	trinket,
	head,
	chest,
	weapon,
	boots,
	gloves,
	neck,
	ringLeft,
	ringRight,
	length
}

enum enumRarity {
	normal,
	magic,
	rare,
	legendary,
	any
}

name = "Unnamed"
description = "No description"

isEquipment = true
template = true
owner = noone
slot = equipmentSlots.none
equipped = false
level = 1
maxLevel = 1
cost = 100
rarity = enumRarity.normal

bonusAttackSpeed = 0
bonusAttackArea = 0
bonusDamageScalar = 0
bonusDamage = 0
bonusArmor = 0
bonusHealth = 0
bonusMoveSpeed = 0
bonusAbilityCooldown = 0
bonusCritChance = 0
bonusCritMultiplier = 0
bonusProjectileCount = 0 
bonusPickupRange = 0
bonusPickupReward = 0
bonusWeaponAoe = 0
bonusCritMultiplier = 0

stats = []

rawStatDisplay = []

persistent = true

///@descrption				Updates the rawStatDisplay var with info
updateRawStatDisplay = function() {
	var _stats = get_available_equipment_stat_strings()
	var _var, _amount
	
	rawStatDisplay = []
	
	for (var i = 0; i < array_length(_stats); i++) {
		_var = variable_instance_get(id, _stats[i])
		
		if (is_array(_var)) {
			_amount = _var[level - 1]
		} else {
			_amount = _var
		}
		
		if (_amount != 0) {
			array_push(rawStatDisplay, $"{_stats[i]}: {_amount}")
			array_push(stats, create_item_stat_from_var(_stats[i], _amount))

		}		
	}
}

///@description				Adds a random stat based on rarity and slot
addRandomStats = function() {
	var _stats = get_random_available_stats(slot, rarity)
	var _count, _amount
	
	switch (rarity) {
		case enumRarity.normal: 
			_count = 1
		break
		
		case enumRarity.magic: 
			_count = 2
		break
		
		case enumRarity.rare: 
			_count = 3
		break
		
		case enumRarity.legendary: 
			_count = 3
		break
	}
	
	for (var i = 0; i < _count; i++) {
		if (array_length(_stats) < (i + 1)) {
			create_toaster("obj_equipment.addRandomStat() got _stats length less than expected: " + string(array_length(_stats)), errorLevels.error)
		} else {
			_amount = get_random_stat_amount(_stats[i], rarity)
			addStat(_stats[i], _amount)
		}
	}
	
	updateRawStatDisplay()
}

///@description				Adds a stat based on enum to the appropriate variable. Currently roughs in leveling to make it an array.
///@param {real} _stat		Stat to add. Uses enum equipmentStats
///@param {real} _amount	Amount of that stat to add
addStat = function(_stat, _amount) {
	var _varString = get_equipment_var_by_enum(_stat)
	
	variable_instance_set(id, _varString, _amount)
}

///@description						Creates an item for a player
///@param {id.Instance} _owner		Owner of the item
///@return {id.Instance}
create = function(_owner = noone) {
	var _inst = create_instance(object_index)
	
	_inst.owner = _owner
	_inst.template = false
	_inst.equipped = true
	
	return _inst
}

///@description						Purchase an item that isn't owned. Currently removes gold.
///@param {id.Instance} _owner		Who is purchasing this item
purchase = function(_owner) {
	owner = _owner
	
	_owner.gold -= cost
}

///@description						Actions to perform when leveling. These will 
onLevelUp = function() {
	// unset
}

///@description						Actions to perform on equipped
onEquip = function() {
	// unset
}

///@description						Actions to perform on Removed
onUnequip = function() {
	// unset
}

///@description						Actions to perform when leveled up
levelUp = function() {
	level++
	onLevelUp()

	process_player_stats()
}

///@description						Equips an item
equip = function() {
	equipped = true
	onEquip()
}

///@description						Unequips an item
unequip = function () {
	equipped = false
	onUnequip()
}

///@description						Turns this instance of the object into a template version
makeTemplate = function() {
	template = true
	persistent = false
	owner = noone
}

///@description						Gets a string for rarity
///@return {string}
getRarityString = function() {
	return get_rarity_string(rarity)
}