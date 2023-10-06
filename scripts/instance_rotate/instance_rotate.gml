///@description						Rotates an object by degrees
///@param {real} degrees			Degrees to rotate by
///@param {id.Instance} object		Object to rotate. Must have xVel and yVel.
function instance_rotate(degrees, object) {
	var angle = point_direction(0, 0, object.xVel, object.yVel)
	var mag = point_distance(0, 0, object.xVel, object.yVel)
	
	angle += degrees
	
	object.xVel = angle_xvel(angle) * mag
	object.yVel = angle_yvel(angle) * mag
}