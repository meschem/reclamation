/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Shockwave"
description = "Enhances attacks to deal a cone of damage in front of them"
onStrikeAbility = true

treeLevel = 3

maxCd = seconds_to_frames(10)

coneDistance = 64
coneHalfArc = 35

baseDamage = 10

critBurstRangeScalar = 1.5

lightningShockAmount = 240

addRune("Lightning Damage", "Changes damage to lightning and adds a small amount of shock")
addRune("Big X", "No Idea")
addRune("Critburst", "Critical attacks increased AOE by 100%")

///@description					Creates a shockwave at the location of the projectile
///@param {id.Instance} inst	Instance that will be referenced for creating FX
///@param {bool} isCrit			True if the projectile was a crit
activate = function(inst, isCrit = false) {
	if (inst.projectileType == projectileTypes.weapon) {
		activate_shockwave(
			level,
			inst.x,
			inst.y,
			point_direction(0, 0, inst.xVel, inst.yVel),
			isCrit
		)
	}
}
