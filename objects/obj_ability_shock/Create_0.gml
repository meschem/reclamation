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

damage = 35
maxDistance = 250
criticalDistance = 60

baseMaxBounces = 3

stats = [
	new abilityStat(
		"Damage",
		"baseDamage", 
		[32, 40, 48, 56, 64]
	),
	new abilityStat(
		"Max Bounces",
		"baseMaxBounces", 
		[4, 4, 5, 5, 6]
	)
]

addRune("Bonus Bounce", "Adds extra bounce(s)")
addRune("Extra Charges", "Adds extra max charge(s), reduces CD")
addRune("Closed Loop", "No longer bounces, but hits the same target repeatedly")

use = function() {
	var caster = get_player_target()
	var inst = instance_create_depth(caster.x, caster.y, depths.fx, obj_chain_lit_caster)
	
	inst.owner = owner
	inst.spawnTarget = owner
}

getMaxBounces = function() {
	var base = baseMaxBounces
	
	if (runes[enumRunes.magdela].enabled) {
		base += 2
	}
	
	base += owner.bonusProjectileCount
	
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
