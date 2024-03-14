if (game_is_paused())
	return 0

age++

if (age >= lifeSpan) {
	instance_destroy()
	return 0
}

if (moving) {
	zOffset += zVel

	if (zOffset > 0) {
		if (zVel < minBounceVelocity) {
			moving = false
			zOffset = 0
			xVel = 0 
			yVel = 0
			zVel = 0
			
			age = (lifeSpan - 30)
		} else {
			bounces++
			zVel = zVel * -bounceRatio
			
			if (maxBounces > 0 && bounces >= maxBounces) {
				instance_destroy()
			}
		}		
	} else {
		zVel += gravAccel
	}
	
	x += xVel
	y += yVel
}





