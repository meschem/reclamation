/// @description Sets facingAngle or xVel and yVel to requested angle
/// @param {real} angle vector to calculate

function face_angle(angle) {
	//if (variable_instance_exists(id, facingAngle)) {
	//facingAngle = angle
	//}
	
	var mag = point_distance(0, 0, xVel, yVel)

	xVel = angle_xvel(angle) * mag
	yVel = angle_yvel(angle) * mag
}

/// @description returns the x velocity ratio from an angle (0 to 1)
/// @param1 {real} angle
function angle_xvel(angle) {
	return cos(degtorad(angle))
}

/// @description returns the x velocity ratio from an angle (0 to 1)
/// @param1 {real} angle
function angle_yvel(angle) {
	return sin(degtorad(angle)) * -1
}