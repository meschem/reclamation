age++

if (age >= lifeSpan) {
	instance_destroy()
	return 0
}

var inst = collision_circle(x, y, damageRadius, obj_player, false, false)

if (inst != noone) {
	damage_player(id)
}
