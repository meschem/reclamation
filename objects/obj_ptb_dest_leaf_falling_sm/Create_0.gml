
// Inherit the parent event
event_inherited()

gravAccel = 0.06
zVelMax = 0.3
zVel = random_range(-3.5, -7)
deaccel = 0.03

rotationSpeedInitMin = 3
rotationSpeedInitMax = 12
rotationSpeedMin = 1
rotationSpeedDeaccel = 0.075

maxBounces = 1
shadowOffset = -4

beginStep = function() {
	var _distToGround = yGroundOffset - zOffset
	// zOffset > yGroundOffset
	if (zVel > 0 && _distToGround < 5) {
		image_alpha = max(_distToGround / 5, 0)
		shadow = false
	}
}

onFirstBounce = function() {
	instance_destroy()
}