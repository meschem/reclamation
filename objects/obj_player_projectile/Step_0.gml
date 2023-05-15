if (game_is_paused()) return 0

age++

if (lifeSpan > 0) {
	if (age >= lifeSpan) {
		instance_destroy()
		return 0	
	}
}

if (distanceMax > 0) {
	distanceTraveled += distancePerFrame

	if (distanceTraveled > distanceMax) {
		instance_destroy()
		return 0
	}
}

spawnPeriodicFx()

calcVelocity()

if (movementType = projMovementTypes.velocity) {
	x += xVel
	y += yVel

	depth = depths.playerProjectile - y
} else if (movementType = projMovementTypes.explicit) {
	if (attachedTo != noone) {
		x = attachedTo.x + xVel
		y = attachedTo.y + yVel
	} else {
		x = xVel
		y = yVel
	}
} 

clean_hit_list(hitList)

if (angleSpriteToVelocity)
	image_angle = get_angle(xVel, yVel)
	
var target = instance_place(x, y, obj_baddie)

if (target != noone && !hitlist_contains(hitList, target)) {
	array_push(hitList, new hitListEntry(target, 60))
	
	onCollideFx()
	
	var critHit = (critChance > random(1))
	var damage = critHit ? damageDirect * critMultiplier : damageDirect
	var killed = damage_baddie(target, damage, critHit) //target.hp -= damageDirect

	if (!killed && knockback > 0) {
		var pushAngle = point_direction(0, 0, xVel, yVel)
		knockback_baddie(target, knockback, pushAngle)
	}
	
	targetsHit++
	
	if (checkOnStrikeAbilities) {
		for (var i = 0; i < array_length(obj_player.onStrikeAbilities); i++) {
			obj_player.onStrikeAbilities[i].activate(id)
		}
	}
	
	if (targetsMax > 0 && targetsHit >= targetsMax) {
		instance_destroy()
	}
}

