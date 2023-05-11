/// @description Insert description here
// You can write your code in this editor

age++

if (age > lifeSpan) {
	var target = instance_nearest(x, y, obj_baddie)
	
	draw_line_width_color(x, y, target.x, target.y, 3, colors.aqua, colors.blue)

	damage_baddie(target, 40, false)

	var inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
	inst.sprite_index = spr_particle_lightning_medium

	instance_destroy()
}
