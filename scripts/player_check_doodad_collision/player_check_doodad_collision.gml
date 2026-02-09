/// @description Has an object try to move towards a location. Returns true if collided with a wall.
/// @param {real}	_xVel
/// @param {real}	_yVel
function player_check_doodad_collision(_xVel, _yVel) {
	var _doodad = instance_place(x + sign(_xVel), y + sign(_yVel), obj_doodad)
	
	if (_doodad != noone) {
		_doodad.onCollision(id)
	}
}
