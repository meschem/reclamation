///@description   Try to move towards a location, hit obstacles
///@param {real} xVel
///@param {real} yVel

///@return {bool}

function baddie_walk_to_location(xVel, yVel) {
	var startX = x
	var startY = y
	var hitWall = false
	
	if (xVel != 0) {
		var xDist = xVel
		var step = (sign(xVel) == 1) ? min(1, xDist) : max(-1, xDist)
		
		while(
			xDist != 0 &&
			!place_meeting(x + step, y, [obj_pit, obj_baddie])
			// && !place_meeting(x + step, y, obj_baddie)
		) {
			x += step
			xDist -= step
			
			if (xDist > 0 && xDist < 1) {
				step = xDist
				break
			} else if (xDist < 0 && xDist > -1) {
				step = xDist
				break
			}
		}
	}
	
	if (yVel != 0) {
		var yDist = yVel
		var step = (sign(yVel) == 1) ? min(1, yDist) : max(-1, yDist)
		
		while(
			yDist != 0 &&
			!place_meeting(x + step, y, [obj_pit, obj_baddie])
			// && !place_meeting(x + step, y, obj_baddie)
		) {
			y += step
			yDist -= step
			
			if (yDist > 0 && yDist < 1) {
				step = yDist
				break
			} else if (yDist < 0 && yDist > -1) {
				step = yDist
				break
			}
			
		}
	}
	
	if (hitWall) {
		var xDist = abs(startX - x)
		var yDist = abs(startY - y)
		var xVelRemainder = abs(xVel) - xDist
		var yVelRemainder = abs(yVel) - yDist
		
		if (xVelRemainder > 0) {
			
		} else if (yVelRemainder > 0) {
		
		}
			
		//while (xVelRemainder > 0 && !place_meeting(x, y + (), )) {
			
		//}
	}
}

function baddie_walk_to_location_new(xVel, yVel) {
	var colliders = collidesWith
	//var sanity = 0
	var distance = point_distance(0, 0, xVel, yVel)
	var remaining = distance
	var xCollided = false
	var yCollided = false
	var stepX = (sign(xVel) == 1) ? min(1, xVel) : max(-1, xVel)
	var stepY = (sign(yVel) == 1) ? min(1, yVel) : max(-1, yVel)
	var originX = x
	var originY = y
	var frictionScalar = 0.5
	
	while (remaining > 0) {
		if (place_meeting(x + stepX, y, colliders)) {
			xCollided = true
		} else {
			x += stepX
		}
		
		if (place_meeting(x, y + stepY, colliders)) {
			yCollided = true
		} else {
			y += stepY
		}
		
		remaining--
	}
	
	//if either X or Y collided, we know we have some remaining distance
	if (xCollided || yCollided) {
		remaining = (distance - point_distance(x, y, originX, originY)) * frictionScalar
		
		if (xCollided) {
			stepX = 0
			stepY = clamp(remaining * sign(yVel), -1, 1)			
		} else if (yCollided) {
			stepX = clamp(remaining * sign(xVel), -1, 1)
			stepY = 0
		}
		
		while (remaining > 0) {
			if (place_meeting(x + stepX, y + stepY, colliders)) {
				break
			} else {
				x += stepX
				y += stepY
			}
		
			remaining--
			
			//if (abs(y - target.y) < 1) {
			//	break
			//} else if (abs(x - target.x) < 1) {
			//	break
			//}
		}
	}
	
	return (xCollided || yCollided)
}