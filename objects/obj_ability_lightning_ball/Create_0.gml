/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "Ball Lightning"
description = "Summons some ball lightning"
selectionIcon = spr_abil_select_icon_ball_lit

maxCharges = 1
active = true

autoCast = true
canAutoCast = true

curCd = 0
maxCd = 680

treeLevel = 3
projectileCount = 3
projectileDistance = 100
projectileRotationRate = 2
projectileDuration = 480
projectileDamage = 20

shortDistance = 40
quickRotationRate = 5

overloadDamage = 15
overloadRadius = 30

stats = [
	new abilityStat(
		"Damage", 
		"projectileDamage", 
		[20, 30, 30, 45, 60]
	),
	new abilityStat(
		"Projectiles",
		"projectileCount",
		[3, 3, 4, 4, 5]
	)
]

addRune("Close and Quick", "Orbs spin faster and closer")
addRune("Overload", "Explodes on death")
addRune("Blood Lightning", "Somehow deals blood damage")

use = function() {
	var angle, spawnLoc
	var count = projectileCount	+ owner.bonusProjectileCount
	var distance = runes[enumRunes.magdela].enabled ? shortDistance : projectileDistance
	var rotationRate = runes[enumRunes.magdela].enabled ? quickRotationRate : projectileRotationRate
	
	for (var i = 0; i < count; i++) {
		angle = (360 / count) * i
		spawnLoc = get_vec2_from_angle_mag(angle, distance)
		
		var inst = instance_create_depth(
			spawnLoc.x, spawnLoc.y,
			depths.playerProjectile,
			obj_jonah_lightning_ball
		)
		
		inst.attachedTo = obj_player
		inst.angle = angle
		inst.lifeSpan = projectileDuration
		inst.distanceOffset = distance
		inst.rotationRate = rotationRate
		
		if (runes[enumRunes.voldan].enabled) {
			inst.explodeOnDeath = true
		}
		
		inst.distanceMax = -1
	}
}
