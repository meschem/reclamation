///@description			Charges towards its target. If no target, simply charges forward.

function move_logic_charge() {
	//var targetPoint = new vec2()
	var _targetX = 0
	var _targetY = 0
	var _addX = 0
	var _addY = 0
	
	if (target == obj_none || !instance_exists(target)) {
		//var addVec = get_vec2_from_angle_mag(facingAngle, 128)
		_addX = angle_xvel(facingAngle) * 128
		_addY = angle_yvel(facingAngle) * 128
		
		_targetX = x + _addX
		_targetY = y + _addY
	} else {
		_targetX = target.x
		_targetY = target.y
	}

	accel_towards_point(_targetX, _targetY, frameAccel)
	
	var mag = point_distance(0, 0, xVel, yVel)
		
	if (mag > frameMoveSpeedMax) {
		set_velocity_magnitude(frameMoveSpeedMax)
	}
}
