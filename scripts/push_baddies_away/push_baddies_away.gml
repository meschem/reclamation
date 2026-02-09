///@description				Used by baddies to push everyone away from each other
///@param {real} _x			X
///@param {real} _y			Y
///@param {real} _radius	Distance to push

function push_baddies_away(_x, _y, _radius = 8, _force = 5) {
	var _baddies = ds_list_create()
	var _count = collision_circle_list(_x, _y, _radius, obj_entity_parent, false, true, _baddies, false)
	var _minForce = 0.2
	var _enemy, _distance, _pushDistance, _angle, _pushVec2, _collided
	var _pushX = 0
	var _pushY = 0
	
	if (_count > 0) {
		for (var i = 0; i < _count; i++)
	    {
			_enemy = _baddies[| i]
			_distance = point_distance(_x, _y, _enemy.x, _enemy.y) // 0 -> _radius
			_angle = point_direction(_x, _y, _enemy.x, _enemy.y)
			_pushDistance = max(_minForce, _force * (1 - (_distance / _radius)) * _enemy.pushWeightScalar)
			//_pushVec2 = get_vec2_from_angle_mag(_angle, _pushDistance)
			
			//var _pushX = angle_xvel(_angle) * _pushDistance
			//var _pushY = angle_yvel(_angle) * _pushDistance
			
			if (_pushDistance >= 1) {
				//_pushVec2 = get_vec2_normal(_pushVec2.x, _pushVec2.y)
				_pushX = angle_xvel(_angle)
				_pushY = angle_yvel(_angle)
			} else {
				_pushX = angle_xvel(_angle) * _pushDistance
				_pushY = angle_yvel(_angle) * _pushDistance
			}
			
			_collided = false
			
			with (_enemy) {
				if (_enemy.immovable) {
					continue
				}
				
				while (
					!place_meeting(x + _pushX, y + _pushY, _enemy.collidesWith) &&
					_pushDistance > 0				
				) {
					x += _pushX
					y += _pushY
					
					_pushDistance--
				}
				
				//while (
				//	!place_meeting(x + _pushVec2.x, y + _pushVec2.y, _enemy.collidesWith) &&
				//	_pushDistance > 0				
				//) {
				//	x += _pushVec2.x
				//	y += _pushVec2.y
					
				//	_pushDistance--
				//}
			}
	    }
	}
	
	ds_list_destroy(_baddies)
}
