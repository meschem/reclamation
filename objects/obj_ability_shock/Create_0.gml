/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "Chain Lightning"
description = "Shoots out a bolt of lightning that bounces between targets"
selectionIcon = spr_abil_select_icon_chain_lit
//maxCharges = 3
active = true

autoCast = true
canAutoCast = true

curCd = 0
maxCd = 400

treeLevel = 2

damage = [32, 48, 64, 96, 96]
maxBounces = [4, 4, 8, 8, 12]
maxDistance = 260
criticalDistance = 60

baseMaxBounces = 3

stats = [
	new abilityStat(
		"Damage",
		"baseDamage", 
		damage
	),
	new abilityStat(
		"Max Bounces",
		"baseMaxBounces", 
		maxBounces
	)
]

addRune("Bonus Bounce", "Adds extra bounce(s)")
addRune("Extra Charges", "Adds extra max charge(s), reduces CD")
addRune("Closed Loop", "No longer bounces, but hits the same target repeatedly")

use = function() {
	var _inst = instance_create_depth(owner.x, owner.y, depths.fx, obj_chain_lit_caster)
	
	_inst.owner = owner
	_inst.spawnTarget = owner
	_inst.damage = damage[level - 1]
	_inst.bounces = maxBounces[level - 1]
}

getMaxBounces = function() {
	var _base = baseMaxBounces
	
	if (runes[enumRunes.magdela].enabled) {
		_base += 2
	}
	
	_base += owner.bonusProjectileCount
	
	return baseMaxBounces
}

///@description				When any rune is added, this function is run
///@param {real} rune		Rune to apply from enumRunes
applyRune = function(rune) {
	if (rune == enumRunes.voldan) {
		maxCharges = 4
		maxCd = maxCd * 0.8
	}
}
