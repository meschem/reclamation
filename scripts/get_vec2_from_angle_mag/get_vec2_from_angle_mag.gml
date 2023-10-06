/// @description Creates a 'vector' from angle and magnitude
/// @param1 {real} angle
/// @param2 {real} magnitude
/// @return {struct.vec2}

function get_vec2_from_angle_mag(angle, magnitude){
	var _x = angle_xvel(angle) * magnitude
	var _y = angle_yvel(angle) * magnitude

	return new vec2(_x, _y)
}
