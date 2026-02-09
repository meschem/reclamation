
age++

if (age % fxSpawnRate == 0) {
	var spawn = get_random_point_in_circle(x, y, radius)
	var inst = instance_create_depth(spawn.x, spawn.y, depths.fx, obj_particle_single_cycle)
	
	inst.sprite_index = spr_particle_lightning_medium
	inst.image_angle = random(360)
	inst.image_xscale = 0.5
	inst.image_yscale = 0.5
}

if (age > lifeSpan)
	instance_destroy()