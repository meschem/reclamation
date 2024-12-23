age = 0
lifeSpan = seconds_to_frames(3)

owner = noone
damageSplash = 1
radius = 1

activateDamage = function() {
	var _enemies = ds_list_create()	
	var _count = collision_circle_list(
		x,
		y,
		radius,
		obj_baddie,
		false,
		true,
		_enemies,
		false
	)

	if (_count > 0) {
		for (var i = 0; i < _count; i++) {
			apply_damage(_enemies[| i], damageSplash, owner)
			apply_shocked(_enemies[| i], 120)
		}
	}
	
	ds_list_destroy(_enemies)
	
	create_fx_fading_circle(
		x, y,
		radius
	)
}
