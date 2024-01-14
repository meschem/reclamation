age++

if (age >= lifeSpan) {
	instance_destroy()
	return 0
}

image_xscale = damageRadius / sprite_width

var inst = collision_circle(x, y, damageRadius, obj_player, false, false)

if (inst != noone) {
	damage_player(id)
}
