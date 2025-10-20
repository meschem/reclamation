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
damageBounceReduction = 0.9
damageBounceReductionEnhanced = 1.1
criticalDistance = 60

bonusBounces = 2

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

//addRune("Bonus Bounce", "Adds extra bounce(s)")
//addRune("Extra Charges", "Adds extra max charge(s), reduces CD")
//addRune("Closed Loop", "No longer bounces, but hits the same target repeatedly")

statBonusBounces = new abilityStatBonus(
	enumCharStats.int, 15,
	"Extra Bounces",
	"Bounces to additional targets"
)

statBonusResonance = new abilityStatBonus(
	enumCharStats.int, 30,
	"Voltaic Resonance",
	"Deals increased damage per target instead of decreased damage."
)

statBonusClosedLoop = new abilityStatBonus(
	enumCharStats.str, 30,
	"Closed Loop",
	"Allows the lightning to harmlessly bounce off the player if no enemy targets are nearby"
)

charStatBonuses = [statBonusBounces, statBonusResonance, statBonusClosedLoop]

use = function() {
	var _inst = instance_create_depth(owner.x, owner.y, depths.fx, obj_chain_lit_caster)
	
	_inst.owner = owner
	_inst.spawnTarget = owner
	_inst.damage = damage[level - 1]
	_inst.bounces = maxBounces[level - 1]
	_inst.canTargetOwner = statBonusClosedLoop.active
	_inst.damageBounceModifier = statBonusResonance.active ? damageBounceReductionEnhanced : damageBounceReduction
	
	if (statBonusBounces.active) {
		_inst.bounces += bonusBounces
	}
}

//getMaxBounces = function() {
//	var _base = baseMaxBounces
	
//	if (statBonusBounces.active) {
//		_base += bonusBounces
//	}
	
//	_base += owner.bonusProjectileCount
	
//	return baseMaxBounces
//}
