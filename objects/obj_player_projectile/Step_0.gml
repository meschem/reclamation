
if (game_is_paused()) {
	image_speed = 0

	return 0
} else {
	image_speed = animSpeed
}

if (spawnDelay > 0) {
	spawnDelay--
	
	if (spawnDelay == 0) {
		draw = true
		image_index = 0
		image_speed = animSpeed
	} else {
		draw = false
		image_speed = 0
		return 0
	}
}

var i, j

if (age == 0) {
	run_wupg_lifecycle_events(enumLifeCycleEvents.stepFirst, {
		projectile: id
	})
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

run_wupg_lifecycle_events(enumLifeCycleEvents.stepBegin, {
	projectile: id
})

var destroy = false

stepBegin()

impactSoundFrameSkip = false

spawnPeriodicFx()

calcVelocity()

if (trail && age > 1) {
	buildTrail()
}

previousFramePos.x = x
previousFramePos.y = y

if (xVel != 0 && yVel != 0) {
	facingAngle = get_angle(xVel, yVel)
}

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
			
			/// FIXME: General - this is ugly
			instance_destroy()
			return 0
		} else if (reseekBehavior = reseekBehaviors.deactivateSeek) {
			seeking = false
			seekTarget = noone
		} else if (reseekBehavior = reseekBehaviors.acquireNearest) {
			seekTarget = instance_nearest(x, y, obj_baddie)
		}
	}
	
	if (seekTarget != noone) {
		if (seekStyle == projectileSeekStyles.wide) {
			turn_towards_point([seekTarget.x, seekTarget.y], maxTurnRate)
		} else if (seekStyle == projectileSeekStyles.sharp) {
			accel_towards_point(seekTarget.x, seekTarget.y, seekAccel)
		}
		
		maxTurnRate += maxTurnRateGain
	}
}

if (rotationSpeed != 0) {
	instance_rotate(rotationSpeed, id)
}

// Solid Collision
if (solidCollisionBehavior == projSolidCollisionBehaviors.bounce) {
	var bounced = false
	var solidTargetX = instance_position(x + xVel, y, obj_solid)
	
	if (solidTargetX != noone || is_oob(x + xVel, y)) {
		if (bouncesCur < bouncesMax) {
			bouncesCur++
			xVel = -xVel
			bounced = true
		} else {
			destroy = true
		}
	}
	
	var solidTargetY = instance_position(x, y + yVel, obj_solid)
	
	if (solidTargetY != noone || is_oob(x, y + yVel)) {
		if (bouncesCur < bouncesMax) {
			bouncesCur++
			yVel = -yVel
			bounced = true
		} else {
			destroy = true
		}
	}
	
	if (bounced) {
		onBounce()
	}
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

if (moveSpeedMax >= 0) {
	//var _angle = point_direction(0, 0, xVel, yVel)
	var _mag = point_distance(0, 0, xVel, yVel)
	//var _velocity = get_vec2_from_angle_mag(_angle, _mag)
	//create_toaster(_velocity)
	if (_mag > moveSpeedMax) {
		
		set_velocity_magnitude(moveSpeedMax)
	}
}

if (targetsMax > 0) {
	clean_hit_list(hitList)
}

if (angleSpriteToVelocity)
	image_angle = get_angle(xVel, yVel)

var target = noone
var targetType = targetTypes.none
var critHit = false
var critMultiplier = 1
var _damage					// used to calaculate dmg target hit

//if (solidCollisionBehavior == projSolidCollisionBehaviors.bounce) {
//	var solidTarget = instance_place(x, y, obj_solid)
	
//	if (solidTarget != noone) {
//		if (bouncesCur < bouncesMax) {
			
//		} else {
//			destroy = true
//		}
//	}
//}

if (collisionDelay <= 0) {
	if (onlyHitsSeekTarget) {
		if (place_meeting(x, y, seekTarget)) {
			target = seekTarget
		}
	} else {
		if (canHitMultipleTargets) {
			instance_place_list(x, y, [obj_baddie], targetCollisionList, true)
		} else {
			target = instance_place(x, y, [obj_baddie])
		}
	}
} else {
	collisionDelay--
}

if (target != noone) {
	ds_list_add(targetCollisionList, target)
}

// FIXME: Perf - using 2 ds_lists, ran into weird bug when trying to cull a single list
for (i = 0; i < ds_list_size(targetCollisionList); i++) {
	target = targetCollisionList[| i]
	
	if (
		target.targetType == targetTypes.baddie &&
		target.hp > 0 &&
		!hitlist_contains(hitList, target)
	) {
		array_push(hitList, new hitListEntry(target, damageFrameCooldown))
		ds_list_add(validTargetList, target)
	}
}

preDamage(validTargetList)


for (i = 0; i < ds_list_size(validTargetList); i++) {
	target = validTargetList[| i]
		
	critHit = false
	critMultiplier = owner.critMultiplier + obj_buff_controller.getBuffValue(buffValueTypes.bonusCritMultiplier)

	onCollideFx(target)
	queueImpactSound()
	
	if (target.markedForCrit || (random(1) < critChance)) {
		critHit = true
	}
	
	_damage = getScaledDamage(target)
	
	if (poisons || poisonStacksOnHit > 0) {
		apply_poison(target, poisonDuration, owner)
	}
	
	run_wupg_lifecycle_events(enumLifeCycleEvents.targetHit, {
		owner: owner,
		projectile: id,
		target: target,
		critHit: critHit,
		scaledDamage: _damage
	})
	
	onHit(target)
	
	// FIXME disconnected from script
	if (applyShock > 0 && target.shockedLength < applyShock) {
		target.shockedLength = applyShock
	}
	
	for (j = 0; j < array_length(obj_player.onStrikeAbilities); j++) {
		obj_player.onStrikeAbilities[i].activate(id, critHit)
	}
	
	if (owner == noone) {
		create_toaster("Owner not set on projectile: " + object_get_name(object_index), errorLevels.error)
		owner = get_player_target()
	}
		
	//if (critHit) {
	//	run_lifecycle_events(enumLifeCycleEvents.criticalHit, {
	//		owner: owner,
	//		target: target
	//	})
	//}
	
	var killed = damage_baddie(target, _damage, critHit, critMultiplier)
	
	if (!killed && knockback > 0) {
		//var pushAngle = point_direction(0, 0, xVel, yVel)
		knockback_baddie(target, knockback, facingAngle)
	}
	
	targetsHit++

	damageDirect -= damageLostPerTarget
	
	if (targetsMax > 0 && targetsHit >= targetsMax) || (damageDirect <= 0) {
		if (random(1) > pierceChance) {
			destroy = true
			break
		}
	}
}

if (impactSoundsCount > 0) {
	audio_play_sound(array_random(impactSounds), 0, false)
	
	impactSoundsCount--
	impactSoundsMax--
}

ds_list_clear(validTargetList)
ds_list_clear(targetCollisionList)

run_wupg_lifecycle_events(enumLifeCycleEvents.stepEnd, {
	projectile: id
})

stepEnd()

if (destroy) instance_destroy()
