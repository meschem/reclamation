drawLocatorArrow = true

onDestroy = function() {
	var _amount = 32
	var _distance = 225
	var _angle = 360 / _amount
	var _vec = new vec2()
	
	var _player = get_first_player()
	
	for (var i = 0; i < _amount; i++) {
		_vec = get_vec2_from_angle_mag(_angle * i, _distance)
		
		spawn_baddie_at_location(obj_grub_small, _player.x + _vec.x, _player.y + _vec.y)
	}
}