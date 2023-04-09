///@description   Try to move towards a location, hit obstacles

///@param {real} xVel
///@param {real} yVel

///@return {bool}

function baddie_walk_to_location(xVel, yVel) {
	if (xVel != 0) {
		var xDist = xVel
		var step = (sign(xVel) == 1) ? min(1, xDist) : max(-1, xDist)
		
		while(
			xDist != 0 &&
			!place_meeting(x + step, y, obj_pit) &&
			!place_meeting(x + step, y, obj_baddie)
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
			!place_meeting(x, y + step, obj_pit) &&
			!place_meeting(x, y + step, obj_baddie)
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
}