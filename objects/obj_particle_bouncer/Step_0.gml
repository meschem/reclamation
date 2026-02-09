if (game_is_paused())
	return 0

if (age == 0) {
	applyInitialProps()
}

age++

if (age >= lifeSpan) {
	instance_destroy()
	return 0
}

beginStep()

image_angle += rotationSpeed
depth = depths.enemy - y - yGroundOffset

if (rotationSpeedDeaccel > 0) {
	if (rotationSpeed > 0) {
		rotationSpeed -= rotationSpeedDeaccel
		
		if (rotationSpeed <= rotationSpeedMin) {
			rotationSpeed = rotationSpeedMin
			rotationSpeedDeaccel = 0
		}
	} else {
		rotationSpeed += rotationSpeedDeaccel
		
		if (rotationSpeed >= -rotationSpeedMin) {
			rotationSpeed = -rotationSpeedMin
			rotationSpeedDeaccel = 0
		}
	}
}

if (moving) {
	zOffset += zVel

	// hit ground
	if (zOffset > yGroundOffset) {
		var _vel = sqrt(sqr(xVel) + sqr(yVel) + sqr(zVel))
		
		if (firstBounce) {
			firstBounce = false
			
			onFirstBounce()
		}
		
		if (_vel < minBounceVelocity) {
			// stop
			moving = false
			zOffset = yGroundOffset
			xVel = 0 
			yVel = 0
			zVel = 0
			rotationSpeed = 0
			
			age = (lifeSpan - 40)
		} else {
			// bounce
			bounces++
			
			onBounce()
			
			zVel *= -bounceRatio
			xVel *= bounceRatio
			yVel *= bounceRatio
			
			zOffset = yGroundOffset // LAZY
						
			rotationSpeed = clamp(
				random_range(-_vel, _vel),
				-rotationSpeedMax,
				rotationSpeedMax
			)
			
			if (maxBounces > 0 && bounces >= maxBounces) {
				instance_destroy()
			}
		}
	} else {
		zVel = min(zVel + gravAccel, zVelMax)
	}
	
	if (deaccel != 0) {
		deaccelerate(deaccel)
	}
	
	x += xVel
	y += yVel
}
