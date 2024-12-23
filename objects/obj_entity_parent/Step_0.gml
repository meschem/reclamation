if (game_is_paused()) return 0

age++

if (is_oob()) {
	hp = 0
	killedByBounds = true
}

if (lifeSpan > 0 && age >= lifeSpan) {
	lastDamageAngle = 90
	lastDamageForce = 0.66
	hp = 0
}

if (hp <= 0 && diesAtZeroHp) {
	instance_destroy()
	return
}

//if (!instance_exists(target) || age % 5 == 0) {
//	target = get_player_target()
//}

beginStep()

lastX = x
lastY = y

if (moveBehavior == entityMoveBehaviors.simple) {
	target = obj_none
}

var appliedVel = new vec2(xVel, yVel)

//if (debuffShockAmount > 0)
//	debuffShockAmount--

if (knockbackSlowDuration > 0) {
	var knockbackAgeRatio = (age - knockbackSlowHitFrame) / knockbackSlowDuration

	if (knockbackAgeRatio >= 1) {
		knockbackSlowDuration = 0
	} else {
		var channel = animcurve_get_channel(ac_baddie_knockback_accel, 0)
		var appliedRatio = animcurve_channel_evaluate(channel, clamp(knockbackAgeRatio, 0, 1))
		
		frameAccel = moveAccel * appliedRatio
	}
} else {
	frameMoveSpeedMax = moveSpeedMax
	frameAccel = moveAccel
}

switch (moveBehavior) {
	case entityMoveBehaviors.charge:
	case entityMoveBehaviors.simple:
		move_logic_charge()
	break
		
	case entityMoveBehaviors.wander:
		move_logic_wander()
	break
}

switch (rotationBehavior) {
	case entityRotateBehavior.flipTowardsTarget:
		xScale = (x <= target.x) ? 1 : -1
	break
}
	
if (teleportEnabled) {
	teleportCdCur--
		
	if (teleportCdCur <= 0 && state == enemyStates.normal) {
		teleportCdCur = irandom_range(teleportCdMin, teleportCdMax)
			
		baddie_teleport_try()
	}		
}

//depth = depths.enemy - y + feetOffset

if (phases) {
	x += appliedVel.x
	y += appliedVel.y
//} else if (flies) {
//	hitWall = fly_to_location(appliedVel.x, appliedVel.y)
} else {
	hitWall = entity_walk_to_location(appliedVel.x, appliedVel.y)
}

if (collisionType == entityCollisionTypes.playerSummon) {
	player_summon_collision()
} else if (collisionType == entityCollisionTypes.baddie) {
	if (age % 2 == 0) {
		push_baddies_away(x, y, pushRadius, pushForce)
	}
}

if (floatRange > 0) {
	var length = 60
	var phaseRatio = (age % length) / 60
	var phase = sin(2 * pi * phaseRatio)
		
	floatOffset = phase * floatRange
}

// Bouncy walking
if (walkAnimType == entityWalkAnimTypes.curves) {
	var stopped = baddie_is_stopped()
	
	var walkFrame = (walkAge % walkCurveCycleLength)
	
	
	if (!stopped || walkFrame > 0) {
		walkAge++
		
		var ratio = (walkAge % walkCurveCycleLength) / walkCurveCycleLength
		var curve = animcurve_get(ac_baddie_walking_hop)
	
		var jumpChannel = animcurve_get_channel(curve, 0)
		var angleChannel = animcurve_get_channel(curve, 1)
		
		// rotation may be a bad thing to use here...
		rotation = animcurve_channel_evaluate(angleChannel, ratio) * walkAnimRotation
		floatOffset = animcurve_channel_evaluate(jumpChannel, ratio) * -walkAnimHeight
	}
	
	//var ratio = (walkAge % walkCurveCycleLength) / walkCurveCycleLength
	//var curve = animcurve_get(ac_baddie_walking_hop)
	
	//var jumpChannel = animcurve_get_channel(curve, 0)
	//var angleChannel = animcurve_get_channel(curve, 1)
		
	//rotation = animcurve_channel_evaluate(angleChannel, ratio) * walkAnimRotation
	//floatOffset = animcurve_channel_evaluate(jumpChannel, ratio) * -walkAnimHeight
}

if (age - damagedOn <= damageReactionLength) {
	var ratio = (age - damagedOn) / damageReactionLength

	damageXScaleMultiplier = animcurve_channel_evaluate(damageReactionCurveXScale, ratio)
	damageYScaleMultiplier = animcurve_channel_evaluate(damageReactionCurveYScale, ratio)
} else {
	damageXScaleMultiplier = 1
	damageYScaleMultiplier = 1
}

// HP Bar
if (hpBarDisplay == entityHpBarTypes.small) {
	hpBarInfo.xPos = round((x - camera_get_view_x(view_camera[0])) - (sprite_width / 2))
	hpBarInfo.yPos = round((y - camera_get_view_y(view_camera[0])) - (sprite_height / 2) + hpBarInfo.yOffset)
	hpBarInfo.width = sprite_width
}

endStep()
