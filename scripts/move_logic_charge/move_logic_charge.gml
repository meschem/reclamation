
function move_logic_charge() {
	if (moveRotationRate < 0) {
		var targetAngle = point_direction(x, y, obj_player.x, obj_player.y)
		var velocity = get_velocity_from_angle(targetAngle, moveSpeedMax)
	
		xVel = velocity[0]
		yVel = velocity[1]
	} else {
		accel_towards_point(obj_player.x, obj_player.y, frameAccel)
		var mag = point_distance(0, 0, xVel, yVel)
		
		if (mag > moveSpeedMax) {
			set_velocity_magnitude(frameMoveSpeedMax)
		}
		//turn_towards_point([obj_player.x, obj_player.y], moveRotationRate)				
	}
}