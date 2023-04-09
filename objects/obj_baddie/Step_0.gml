if (game_is_paused()) return 0

age++

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
			move_logic_charge()
		break
	}

	switch (rotationBehavior) {
		case enemyRotateBehavior.flipTowardsPlayer:
			xScale = (x <= target.x ) ? 1 : -1
		break
	}
} else if (state == enemyStates.pushed) {
	accelerate(-pushDeaccel)	
} else if (state == enemyStates.stunned) {
	stunLength--
}

depth = depths.enemy - y

if (phases) {
	x += xVel
	y += yVel
} else if (flies) {
	fly_to_location()
} else {
	hitWall = baddie_walk_to_location(xVel, yVel)
}

if (floatRange > 0) {
	var length = 60
	var phaseRatio = (age % length) / 60
	var phase = sin(2 * pi * phaseRatio)
		
	floatOffset = phase * floatRange
}
