///@description                     Moves a baddie to an x/y coordinate until they collide with a solid
///@param {id.Instance} _baddie     Baddie to move
///@param {real} _x                 X position
///@param {real} _y                 Y position
function slide_baddie_to_position(_baddie, _x, _y) {
    var _angle = get_angle(_x, _y)
    var _distance = point_distance(_baddie.x, _baddie.y, _x, _y)
    
    slide_baddie(_baddie, _angle, _distance)
}

///@description                     Moves a baddie in a direction until they collide with a solid
///@param {id.Instance} _baddie     Baddie to move
///@param {real} _angle             Angle
///@param {real} _distance          Distance
function slide_baddie(_baddie, _angle, _distance) {
    var _hitForce = get_velocity_from_angle(_angle, _distance)
	var _stepVec = normalize_vector(_hitForce[0], _hitForce[1])
	
	with (_baddie) {
		for (var i = 0; i < _distance; i++) {
			if (
				place_meeting(x + _stepVec[0], y + _stepVec[1], obj_pit)
			) {
				break
			} else {
				x += _stepVec[0]
				y += _stepVec[1]
			}
		}
	}
}
