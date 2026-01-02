/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Lightning Rune"
description = "Spawns a lightning rune at your location that deals damage over time and then erupts."
active = true
selectionIcon = spr_abil_select_icon_lit_rune

curCd = 0
maxCd = seconds_to_frames(12)

autoCast = true
canAutoCast = true

enabled = false
treeLevel = 3

damagePerTick = [15, 25, 25, 50, 50]
explosionDamage = [30, 50, 50, 100, 200]
radius = [48, 48, 64, 64, 64]


tickRate = seconds_to_frames(0.33)
duration = tickRate * 4

stats = [
	new abilityStat(
		"Dmg Per Sec", "damagePerTick",
		damagePerTick
	),
	new abilityStat(
		"Explosion Dmg", "explosionDamage",
		explosionDamage
	),
	new abilityStat(
		"Radius", "radius",
		radius
	)
]

statBonusAttraction = new abilityStatBonus(
	enumCharStats.dex, 10,
	"Criticality",
	"Deals critical damage to a random enemy in the area"
)

statBonusCriticality = new abilityStatBonus(
	enumCharStats.str, 30,
	"Criticality",
	"Draws units into the area. Halves duration, but doubles attack rate."
)

statBonusFulmination = new abilityStatBonus(
	enumCharStats.str, 20,
	"Fulmination",
	"Final blast applies Shock to enemies in the area"
)

charStatBonuses = [statBonusAttraction, statBonusCriticality, statBonusFulmination]

addRune("Attraction", "Draws nearby enemies in. Halves duration but doubles attack speed.")
addRune("Criticality", "Deals 3x critical damage to a random enemy in the area.")

use = function() {
	var _rune = instance_create_depth(owner.x, owner.y, depths.enemyFloorFx, obj_lightning_rune_caster)
	
	_rune.damagePerTick = damagePerTick[level - 1]
	_rune.duration = duration
	_rune.tickRate = tickRate
	_rune.radius = radius[level - 1]
	_rune.explosionRadius = radius[level - 1] * 1.35
	_rune.explosionDamage = explosionDamage[level - 1]
	_rune.owner = owner
	
	if (statBonusAttraction.active) {
		add_player_target(_rune)
		
		_rune.duration /= 2
		_rune.tickRate /= 2
		_rune.initialDelay /= 2
		_rune.playerTarget = true
	}
	
	if (statBonusCriticality.active) {
		_rune.critChance = 1
		_rune.maxCrits = 1
	}
	
	if (statBonusFulmination.active) {
		_rune.shockingFinale = true
	}
}
