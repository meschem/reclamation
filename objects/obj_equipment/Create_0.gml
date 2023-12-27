///@description		Equipment

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
	legendary
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

persistent = true

///@description						Creates an item for a player
///@param {id.Instance} owner		Owner of the item
///@return {id.Instance}
create = function(owner = noone) {
	var inst = create_instance(object_index)
	
	inst.owner = owner
	inst.template = false
	inst.equipped = true
	
	return inst
}

///@description						Purchase an item that isn't owned. Currently removes 
///@param {id.Instance} _owner		Who is purchasing this item
purchase = function(_owner) {
	owner = _owner
	
	_owner.gold -= cost
}

///@description						Actions to perform when leveling
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
	switch (rarity) {
		case enumRarity.normal: return "Common"
		case enumRarity.magic: return "Magic"
		case enumRarity.rare: return "Rare"
		case enumRarity.legendary: return "Legendary"
	}
}

