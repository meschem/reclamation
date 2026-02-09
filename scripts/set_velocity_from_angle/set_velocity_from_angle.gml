///@description					Sets an instances velocy based on magnitude and angle assuming it uses xVel and yVel
///@param {id.Instance} _inst	Instance to affect
///@param {real} _angle			Angle of instance in degrees
///@param {real} _mag			Magnitude of instance
function set_velocity_from_angle(_inst, _angle, _mag) {
	var xVel = cos(degtorad(_angle)) * _mag
	var yVel = sin(degtorad(_angle)) * -_mag

	_inst.xVel = xVel
	_inst.yVel = yVel
}
