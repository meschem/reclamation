/// @description Has an object try to move towards a location. Returns true if collided with a wall.
/// @param {real}		_angle
/// @param {real}		_distance
/// @return {bool}
function player_blink_in_direction(_angle, _distance, _player = noone) {
	if (_player == noone) {
		_player = get_first_player()
	}
	
	var _mag = get_vec2_from_angle_mag(_angle, _distance)
	var _normal = get_vec2_normal(_mag.x, _mag.y)
	var _hitWall = true
	var _steps = 0
		
	with (_player) {
	    while(!place_meeting(x + sign(_normal.x), y + sign(_normal.y), [obj_pit, obj_player_clip, obj_doodad])) {
	        x += _normal.x
			y += _normal.y
			
			_steps++
			
			if (_steps >= _distance) {
				_hitWall = false
				//show_message("max distance hit")
				break
			}
	    }
	}
	
	return _hitWall
}
