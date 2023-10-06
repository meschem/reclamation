if (game_is_paused()) return 0

if (age == 0) {
	run_lifecycle_events(enumLifeCycleEvents.stepFirst)
}

age++

if (lifeSpan > 0) {
	if (age >= lifeSpan) {
		instance_destroy()
		return 0	
	}
}

if (distanceMax > 0) {	
	distanceTraveled += point_distance(0, 0, xVel, yVel)

	if (distanceTraveled > distanceMax) {
		instance_destroy()
		return 0
	}
}

run_lifecycle_events(enumLifeCycleEvents.stepBegin)

spawnPeriodicFx()

calcVelocity()

// Seeking behavior
if (seeking && seekTarget != noone) {
	seekDistanceMax--
	
	if (seekDistanceMax == 0) {
		seeking = false
	}
	
	if (!instance_exists(seekTarget)) {
		if (reseekBehavior = reseekBehaviors.destroySelf) {
			seeking = false
			seekTarget = noone
			instance_destroy()
		} else if (reseekBehavior = reseekBehaviors.deactivateSeek) {
			seeking = false
			seekTarget = noone
		}
	}
	
	if (seekTarget != noone) {
		turn_towards_point([seekTarget.x, seekTarget.y], maxTurnRate)
	}
}

if (rotationSpeed != 0) {
	instance_rotate(rotationSpeed, id)
}

if (movementType = projMovementTypes.velocity) {
	if (attachedTo == noone) {
		x += xVel
		y += yVel
	} else {
		attachedVelocity.x += xVel
		attachedVelocity.y += yVel
		
		x = attachedVelocity.x + attachedTo.x
		y = attachedVelocity.y + attachedTo.y
	}

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

var target = noone
var targetType = targetTypes.none
var critHit = false

if (onlyHitsSeekTarget) {
	var hitsTarget = place_meeting(x, y, seekTarget)
	target = seekTarget
} else {
	target = instance_place(x, y, obj_baddie)
}

if (target == noone) {
	if (hitsWalls) {
		target = instance_place(x, y, obj_solid)
	
		if (target != noone) {
			targetType = targetTypes.terrain
		}
	}
} else {
	targetType = targetTypes.baddie
}

if (targetType == targetTypes.terrain) {
	instance_destroy()
} else if (targetType == targetTypes.baddie && !hitlist_contains(hitList, target)) {
	array_push(hitList, new hitListEntry(target, damageFrameCooldown))
	
	onCollideFx(target)
	
	if (target.shockedLength <= 0) {
		critHit = (critChance > random(1))
	} else {
		repeat (3) {
			critHit = (critChance > random(1))
			
			if (critHit) {
				break
			}
		}
	}

	// FIXME disconnected from script
	if (applyShock > 0 && target.shockedLength < applyShock) {
		target.shockedLength = applyShock
	}

	for (var i = 0; i < array_length(obj_player.onStrikeAbilities); i++) {
		obj_player.onStrikeAbilities[i].activate(id, critHit)
	}

	var killed = damage_baddie(target, damageDirect, critHit)

	if (!killed && knockback > 0) {
		var pushAngle = point_direction(0, 0, xVel, yVel)
		knockback_baddie(target, knockback, pushAngle)
	}

	targetsHit++
	
	damageDirect -= damageLostPerTarget

	if (targetsMax > 0 && targetsHit >= targetsMax) || (damageDirect <= 0) {
		//show_debug_message(targetsMax)
		instance_destroy()
	}
}

run_lifecycle_events(enumLifeCycleEvents.stepEnd)
