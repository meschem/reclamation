///@description   Moves to a location then stops for a duration
function move_logic_charge_to_stop() {
	if (moveState == enemyMoveStates.stopped) {
		moveStateAge++
		
		if (moveStateAge >= moveStateStoppedDuration) {
			moveStateAge = 0
			moveState = enemyMoveStates.moving
			
			var mag = point_distance(x, y, target.x, target.y) + moveChargeOvershootDistance
			var angle = point_direction(x, y, target.x, target.y)
			
			moveStateAngle = angle
			moveStateDistance = mag
		}
		
		return 0
	}
	
	if (moveState == enemyMoveStates.moving) {
		var mag = min(point_distance(0, 0, xVel, yVel) + moveAccel, moveSpeedMax)
		
		xVel = angle_xvel(moveStateAngle) * mag
		yVel = angle_yvel(moveStateAngle) * mag
		
		moveStateDistance -= mag
		
		if (moveStateDistance <= 0) {
			moveStateAge = 0
			moveState = enemyMoveStates.slowing
		}
		
		return 0
	}
	
	if (moveState == enemyMoveStates.slowing) {
		moveStateAge++
		
		var mag = deaccelerate(moveDeaccel)
		
		if (mag == 0) {
			moveStateAge = 0
			moveState = enemyMoveStates.stopped
		}
	}
}