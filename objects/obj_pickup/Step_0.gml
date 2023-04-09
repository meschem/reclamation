age++

if (homesOnPlayer) {
	if (!homingActive && distance_to_object(target) < homingRadius) {
		homingActive = true
	}
	
	if (homingActive) {
		var mag = point_distance(0, 0, xVel, yVel)
		var angle = point_direction(x, y, target.x, target.y)

		mag += homingAccel
		
		if (distance_to_object(target) < mag) {
			xVel = 0
			yVel = 0
			x = target.x
			y = target.y
		} else {
			xVel = angle_xvel(angle) * mag
			yVel = angle_yvel(angle) * mag
		}
	}
}

x += xVel
y += yVel