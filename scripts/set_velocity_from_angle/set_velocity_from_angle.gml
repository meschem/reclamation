///@description   Description
function set_velocity_from_angle(obj, angle, mag) {
	var xVel = cos(degtorad(angle)) * mag
	var yVel = sin(degtorad(angle)) * -mag

	obj.xVel = xVel
	obj.yVel = yVel
}