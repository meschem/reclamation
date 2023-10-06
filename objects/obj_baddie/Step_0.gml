if (game_is_paused()) return 0

age++

if (is_oob()) {
	hp = 0
	killedByBounds = true
}

if (hp <= 0) {
	instance_destroy()
	return
}

beginStep()

if (moveBehavior == enemyMoveBehaviors.simple) {
	target = obj_none
}

var appliedVel = new vec2(xVel, yVel) 

if (debuffShockAmount > 0)
	debuffShockAmount--

if (knockbackSlowDuration > 0) {
	var knockbackAgeRatio = (age - knockbackSlowHitFrame) / knockbackSlowDuration

	if (knockbackAgeRatio >= 1) {
		//show_debug_message("Finished: " + string(frameMoveSpeedMax))
		knockbackSlowDuration = 0
	} else {
		var appliedRatio = knockbackSlowRatio + knockbackAgeRatio
		
		frameAccel = moveAccel * appliedRatio
		frameMoveSpeedMax = moveSpeedMax - (knockbackMaxSpeedRatio * (1 / appliedRatio))		
	}
} else {
	frameMoveSpeedMax = moveSpeedMax
	frameAccel = moveAccel
}

if (state == enemyStates.normal) {
	switch (moveBehavior) {
		case enemyMoveBehaviors.charge:
		case enemyMoveBehaviors.simple:
			move_logic_charge()
		break
	}

	switch (rotationBehavior) {
		case enemyRotateBehavior.flipTowardsPlayer:
			xScale = (x <= target.x ) ? 1 : -1
		break
	}
	
	if (teleportEnabled) {
		teleportCdCur--
		
		if (teleportCdCur <= 0) {
			teleportCdCur = irandom_range(teleportCdMin, teleportCdMax)
			
			baddie_teleport_try()
		}		
	}
} else if (state == enemyStates.pushed) {
	accelerate(-pushDeaccel)	
} 

// Change this to cold
if (shockedLength > 0) {
	var maxSlow = 0.5
	var maxLength = 120
	
	if (shockedLength > maxLength) {
		appliedVel.x *= maxSlow
		appliedVel.y *= maxSlow
	} else {
		var ratio = 1 - (shockedLength / maxLength)

		appliedVel.x *= maxSlow + (maxSlow * ratio)
		appliedVel.y *= maxSlow + (maxSlow * ratio)
	}
	
	if (shockedLength % 30 == 0) {
		var inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
		inst.sprite_index = spr_particle_lightning_medium
		inst.image_xscale = 0.5
		inst.image_yscale = 0.5
		inst.image_angle = random(360)
	}

	shockedLength--
}

if (stunLength > 0) {
	appliedVel.x = 0
	appliedVel.y = 0

	stunLength--
}

depth = depths.enemy - y

if (phases) {
	x += appliedVel.x
	y += appliedVel.y
} else if (flies) {
	hitWall = fly_to_location(appliedVel.x, appliedVel.y)
} else {
	hitWall = baddie_walk_to_location(appliedVel.x, appliedVel.y)
}

if (floatRange > 0) {
	var length = 60
	var phaseRatio = (age % length) / 60
	var phase = sin(2 * pi * phaseRatio)
		
	floatOffset = phase * floatRange
}

if (age - damagedOn <= damageReactionLength) {
	var ratio = (age - damagedOn) / damageReactionLength

	damageXScaleMultiplier = animcurve_channel_evaluate(damageReactionCurveXScale, ratio)
	damageYScaleMultiplier = animcurve_channel_evaluate(damageReactionCurveYScale, ratio)
} else {
	damageXScaleMultiplier = 1
	damageYScaleMultiplier = 1
}

endStep()
