
if (obj_room_controller.state == roomStates.overtime) {
	instance_destroy()
	return 0
}

event_inherited()

desiredPos.x = owner.x + 20
desiredPos.y = owner.y - 20

var _moveLen = point_distance(x, y, desiredPos.x, desiredPos.y)

if (_moveLen > 1) {
	var _moveAngle = point_direction(x, y, desiredPos.x, desiredPos.y)

	_moveLen *= 0.1
	
	var _addVec = get_vec2_from_angle_mag(_moveAngle, _moveLen)
	
	x += _addVec.x
	y += _addVec.y
}
