///@description			Charges towards its target. If no target, simply charges forward.

function move_logic_charge() {
	var targetPoint = new vec2()
	
	if (target == obj_none || !instance_exists(target)) {
		var addVec = get_vec2_from_angle_mag(facingAngle, 128)
		
		targetPoint.x = x + addVec.x
		targetPoint.y = y + addVec.y
	} else {
		targetPoint.x = target.x
		targetPoint.y = target.y
	}

	accel_towards_point(targetPoint.x, targetPoint.y, frameAccel)
	
	var mag = point_distance(0, 0, xVel, yVel)
		
	if (mag > frameMoveSpeedMax) {
		set_velocity_magnitude(frameMoveSpeedMax)
	}
}
