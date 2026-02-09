///@description		Description
///@param {real}	xLoc
///@param {real}	yLoc
function spawn_fx_shock_boom(xLoc, yLoc) {
	var inst, angle, vector
	
	angle = random(360)
	
	inst = instance_create_depth(xLoc, yLoc, depths.ui, obj_particle_single_cycle)
	
	inst.sprite_index = spr_particle_stretch_flash_w
	inst.image_angle = angle
	
	//angle += 90
	
	//inst = instance_create_depth(xLoc, yLoc, depths.ui, obj_particle_single_cycle)
	//inst.sprite_index = spr_particle_growing_wave_w
	//inst.image_angle = angle

	//angle += 180	
	
	//inst = instance_create_depth(xLoc, yLoc, depths.ui, obj_particle_single_cycle)
	//inst.sprite_index = spr_particle_growing_wave_w
	//inst.image_angle = angle

	for (var i = 0; i < 9; i++) {
		inst = instance_create_depth(xLoc, yLoc, depths.ui, obj_particle_single_cycle)
		angle = random(360)
		vector = get_velocity_from_angle(angle, random(1.25))
		
		inst.sprite_index = spr_particle_line_ray_w
		inst.image_angle = angle	
		inst.xVel = vector[0]
		inst.yVel = vector[1]		
	}
}