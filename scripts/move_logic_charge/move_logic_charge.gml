///@description			Charges towards its target. If no target, simply charges forward.

function move_logic_charge() {
	var targetPoint = new vec2()
	
	if (target == obj_none) {
		var addVec = get_vec2_from_angle_mag(facingAngle, 128)
		
		targetPoint.x = x + addVec.x
		targetPoint.y = y + addVec.y
	} else {
		targetPoint.x = target.x
		targetPoint.y = target.y
	}

	if (moveRotationRate < 0) {
		var targetAngle = point_direction(x, y, targetPoint.x, targetPoint.y)
		var velocity = get_velocity_from_angle(targetAngle, moveSpeedMax)
	
		xVel = velocity[0]
		yVel = velocity[1]
	} else {
		
		accel_towards_point(targetPoint.x, targetPoint.y, frameAccel)
		var mag = point_distance(0, 0, xVel, yVel)
		
		if (mag > moveSpeedMax) {
			set_velocity_magnitude(frameMoveSpeedMax)
		}
		//turn_towards_point([obj_player.x, obj_player.y], moveRotationRate)				
	}
}