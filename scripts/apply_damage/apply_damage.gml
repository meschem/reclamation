///@description							Applies damage to a baddie. Does NOT modify the amount in any way.
///@param {id.Instance} _target			Target to deal damage to
///@param {real} _amount				Amount of damage dealt
///@param {id.Instance} _attacker		Attacking player
///@param {real} _force					Force scalar to apply
///@param {real} _textStyle				Uses enum damageTextStyles
///@return {bool}
function apply_damage(_target, _amount, _attacker = noone, _force = 1, _textStyle = damageTextStyles.normal) {
	if (_attacker == noone) {
		_attacker = get_first_player()
	}
	
	_target.hp -= _amount
	
	if (_textStyle != damageTextStyles.none) {
		create_damage_text(
			_target.x + (random_range(-6, 6)),
			_target.y + (random_range(-6, 6)),
			_amount,
			_textStyle
		)
	}
	
	if (_target.hp <= 0) {
		_target.lastDamageForce = _force
		_target.lastDamageAngle = point_direction(_attacker.x, _attacker.y, _target.x, _target.y)
		
		return true
	}
	
	_target.damagedOn = _target.age
	
	return false
}



enum damageTextStyles {
	none,
	normal,
	crit,
	poison,
	fire,
	cold,
	pierce,
	heavy,
	lightning
}