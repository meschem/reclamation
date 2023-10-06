/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Charge"
description = "Charges towards an area with explosive results"
icon = spr_ability_icon_charge
active = true

curCd = 0
maxCd = 400

enabled = false

treeLevel = 1

chargeSpeed = 3
maxLength = 120
damage = 100
stunLength = 4
knockback = 10
maxHalvingDamage = 100

shockRadius = 60

array_push(tags, abilityTags.movement)

stats = [
	new abilityStat(
		"Damage", "baseDamage", 
		[100, 130, 160, 200, 250]
	),
	new abilityStat(
		"Stun Length", "stunLength", 
		[4, 4, 5, 5, 6]
	)
]

addRune("Piercing", "Charge goes through small targets, knocking them aside")
addRune("Decimate", "Halves a target's health")
addRune("Static Charge", "Adds lightning damage based on distance traveled")

use = function() {
	// logic is largely handled in:
	//     player_movement_input()
	//     charge_collision()
	//	   player_collision()
	activate_charge(level)
}

getShockDamage = function(distance) {
	return (distance / 10) + 10
}
