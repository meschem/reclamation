/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Meizer's Crown"
description = "A crown that imparts the pain and power of its violent history on the wearer."

rarity = enumRarity.legendary
bonusWeaponAoe = 0.3
bonusInt = 10
bonusStr = 10
bonusDex = 10
buffInstance = noone
bonusDamageOnCast = 0.1
removeDelay = stf(4)
var _statsString = $"+{bonusDamageOnCast * 100}% Physical Damage (stacking) for {removeDelay / 60} seconds after any ability is used."

removeBuffOnAge = []

statsSpecial = [
	_statsString
]

age = 0

onDestroy = function() {
	if (buffInstance != noone && instance_exists(buffInstance)) {
		instance_destroy(buffInstance)
	}
}

onEquip = function() {
	buffInstance = create_instance(obj_buff_stats)
	removeBuffOnAge = []
	age = 0
}

onUnequip = function() {
	instance_destroy(buffInstance)
	buffInstance = noone
}

onStep = function() {
	age++
	
	if (buffInstance == noone) {
		return 0
	}
	
	//if (age % 10 == 0) {
	//	create_toaster(buffInstance.bonusDamageScalar)
	//}
	
	for (var i = 0; i < array_length(removeBuffOnAge); i++) {
		if (age >= removeBuffOnAge[i]) {
			buffInstance.bonusDamageScalar -= bonusDamageOnCast
			array_delete(removeBuffOnAge, i, 1)
			break
		}
	}
}

onAbilityUse = function(_ability) {
	if (equipped && buffInstance != noone && instance_exists(buffInstance)) {
		buffInstance.bonusDamageScalar += bonusDamageOnCast
		array_push(removeBuffOnAge, age + removeDelay)
	}
}
