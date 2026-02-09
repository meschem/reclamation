/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Pinion of War"
description = "A feather brimming with power, touched by the burning heavens above."

rarity = enumRarity.legendary
bonusAbilityCooldown = 0.2
bonusInt = 10

statsSpecial = [
	"+1 Charges to Active Ability",
	"Casts a random Passive Ability on Active Ability use"
]

onEquip = function() {
	if (owner.activeAbility != noone) {
		owner.activeAbility.maxCharges++
	}
}

onUnequip = function() {
	if (owner.activeAbility != noone) {
		owner.activeAbility.maxCharges--
	}
}

onAbilityUse = function(_ability) {
	if (owner.activeAbility == noone || _ability != owner.activeAbility) {
		return 0
	}
    
	var _abils = array_shuffle(owner.abilities)
	
	for (var i = 0; i < array_length(_abils); i++) {
		if (_abils[i].autoCast) {
			_abils[i].use()
		}
	}
}
