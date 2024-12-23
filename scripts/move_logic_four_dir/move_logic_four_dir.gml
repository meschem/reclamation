///@description			Charges towards its target. If no target, simply charges forward.

function move_logic_four_dir() {
	if (!instance_exists(target)) {
		xVel = 0
		yVel = 0
		
		return
	}
	
	var targetDiffY = y - target.y
	var targetDiffX = x - target.x
	
	if (abs(xVel) < 0.1 && abs(yVel) < 0.1) {
		
	
		return 0
	}
	
	var movingX = (abs(xVel) > 0.1)
	var cushion = 20
	
	if (movingX) {
		yVel = 0
		
		if (abs(targetDiffX) < cushion) {
			// deaccel
			
			if (abs(xVel) <= moveAccel) {
				xVel = 0
			} else {
				xVel = xVel - (sign(xVel) * moveAccel)
			}
		} else {
			// accel
			
			xVel = xVel - (sign(targetDiffX) * moveAccel)
		}
	} else {
		xVel = 0
		
		
	}
}
