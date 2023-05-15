/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "Ball Lightning"
description = "Summons some ball lightning"
icon = spr_ability_icon_war_stomp
maxCharges = 1
active = true
autoCast = false

curCd = 0
maxCd = 600

treeLevel = 3
projectileCount = 3
projectileDistance = 100
projectileRotationRate = 2

use = function() {
	var count = projectileCount
	var distance = projectileDistance
	var angle, spawnLoc
	
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
		inst.distanceOffset = distance
		inst.rotationRate = projectileRotationRate
		
	}
}
