/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Shield Wall"
description = "Spawns a few shields in a direction that blocks enemies"
active = true

curCd = 0
maxCd = 120

shieldCount = 3
spawnDistance = 72
spawnAngleDiff = 24

slammingRadius = 40
slammingDamage = 10
slammingStunDuration = 60

treeLevel = 3

addRune("Encasement", "Changes pattern into a small circle around the caster")
addRune("Spikes", "Deals damage to enemies to collide with shields")
addRune("Slamming", "Shields slam on the groud when summoned, stunning enemies")

use = function() {
	var count = shieldCount + owner.bonusProjectileCount
	
	activate_shield_wall(count, spawnDistance, spawnAngleDiff)
}
