///@description					Adds velocity by magnitude using an entity's xVel and yVel
///@param {real}	_amount		To accelerate by. Can be negative.
///@param {id.Instance} _inst	Instance to update	
///@param {real}	_minVel		Minimum velocity, defaults to 0
///@param {real}	_maxVel		Maximum velocity, no default
function accelerate(_amount, _inst = id, _minVel = 0, _maxVel = -1) {
	var _velocity = point_distance(0, 0, _inst.xVel, _inst.yVel)
	var _angle = point_direction(0, 0, _inst.xVel, _inst.yVel)
	
	if (_maxVel == -1) {
		_maxVel = 9999
	}
	
	var _targetVelocity = clamp(_velocity + _amount, _minVel, _maxVel)
	
	set_velocity_from_angle(_inst, _angle, _targetVelocity)
}
