/// @description Creates a 'vector' from angle and magnitude
/// @param1 {real} angle
/// @param2 {real} magnitude
/// @return {array<real>}

function get_vector_from_angle_mag(angle, magnitude){
	var xVel = angle_xvel(angle) * magnitude
	var yVel = angle_yvel(angle) * magnitude

	return [xVel, yVel]
}
