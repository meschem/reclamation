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

image_angle += rotationSpeed
depth = depths.enemy - y + 60

if (moving) {
	zOffset += zVel

	// hit ground
	if (zOffset > yGroundOffset) {
		var _vel = sqrt(sqr(xVel) + sqr(yVel) + sqr(zVel))
		
		//show_message($"minVel: {minBounceVelocity}, curVel: {_vel}")
		//show_message($"xyzVel: ({xVel}, {yVel}, {zVel})")
		//show_message($"zOff: {zOffset}")
		
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
			
			zVel *= -bounceRatio
			xVel *= bounceRatio
			yVel *= bounceRatio
			
			zOffset = yGroundOffset // LAZY
			
			//create_toaster(string(_vel))
			
			rotationSpeed = clamp(
				random_range(-_vel, _vel),
				-rotationSpeedMax,
				rotationSpeedMax
			)
			
			if (maxBounces > 0 && bounces >= maxBounces) {
				instance_destroy()
			}
		}
		
		//show_message($"minVel: {minBounceVelocity}, curVel: {_vel}")
		//show_message($"xyzVel: ({xVel}, {yVel}, {zVel})")
		//show_message($"zOff: {zOffset}")
	} else {
		zVel += gravAccel
	}
	
	x += xVel
	y += yVel
}
