/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Glass Feather"
description = "Fused with magic that can be uniquely bound to glass."

rarity = enumRarity.magic
statsSpecial = ["+1 Charges to Active Ability"]

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
