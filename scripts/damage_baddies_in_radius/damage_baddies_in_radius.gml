///@description								Deals damage to enemies in a radius. Should be called by obj_player?
///@param {struct.vec2} _location			Area to spawn damage
///@param {real} _radius					Radius in pixelx
///@param {real} _amount					Amount of damage
///@param {id.Instance} _damager			Object dealing damage
function damage_baddies_in_radius(_location, _radius, _amount, _damager, _critChance = 0, _maxCrits = 0) {
	var _target = noone
	var _crits = 0
	var _isCrit = false
	var _enemies = ds_list_create()	

	var _count = collision_circle_list(
		_location.x,
		_location.y,
		_radius,
		obj_baddie,
		false,
		true,
		_enemies,
		false
	)

	if (_count > 0) {
		for (var i = 0; i < _count; i++) {
		    _target = _enemies[| i]
			_isCrit = false
			
			if (_crits < _maxCrits) {
				_isCrit = (random(1) < _critChance)
			}
			
			if (_isCrit) {
				_crits++
			}
			
			with (_damager) {
				damage_baddie(_target, _amount, _isCrit, 3)
			}
		}
	}

	ds_list_destroy(_enemies)
}
