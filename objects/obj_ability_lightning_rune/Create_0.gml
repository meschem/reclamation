/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Lightning Rune"
description = "Spawns a lightning rune at your location that deals damage over time and then erupts."
active = true
//selectionIcon = spr_abil_select_icon_flurry

curCd = 0
maxCd = seconds_to_frames(12)

autoCast = true
canAutoCast = true

enabled = false
treeLevel = 3

radius = [48, 48, 64, 64, 64]
damagePerTick = [15, 25, 25, 50, 50]
tickRate = seconds_to_frames(2)
duration = tickRate * 4
explosionDamage = [30, 50, 50, 100, 200]

stats = [
	new abilityStat(
		"Damage Per Sec", "damagePerTick",
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

//addRune("Growing Rage", "Each attack increases damage by 5")
//addRune("Blood Fueled", "Kills extend duration by 0.1 seconds. Max +3 seconds.")

use = function() {
	var _rune = instance_create_depth(owner.x, owner.y, depths.enemyFloorFx, obj_lightning_rune_caster)
	
	_rune.damagePerTick = damagePerTick[level - 1]
	_rune.duration = duration
	_rune.tickRate = tickRate
	_rune.radius = radius[level - 1]
	_rune.explosionRadius = radius[level - 1] * 1.35
	_rune.explosionDamage = explosionDamage[level - 1]
	_rune.owner = owner
}
