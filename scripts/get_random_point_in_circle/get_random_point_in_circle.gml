///@description				Gets a random vec2 within a circle
///@param {real} _x			X origin
///@param {real} _y			Y origin
///@param {real} radius		Radius of circle
///@param {bool} uniform	Use uniform distribution of circle
///@return {struct.vec2}

function get_random_point_in_circle(_x, _y, radius, uniform = false){
	var mag, angle, point
	
	if (uniform) {
		mag = radius * sqrt(random(1))
	} else {
		mag = random(radius)
	}
	
	angle = random(360)
	point = get_vec2_from_angle_mag(angle, mag)
	
	point.x += _x
	point.y += _y
	
	return point
}