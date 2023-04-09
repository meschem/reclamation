/// @description	Spawns a small burst of fx
/// @param {real}	xLoc
/// @param {real}	yLoc
/// @param {real}	rayCount	Amount of rays to shoot out

function spawn_fx_small_burst(xLoc, yLoc, rayCount = 8) {
	var inst = instance_create_depth(xLoc, yLoc, depths.fx, obj_particle_single_cycle)
	
	inst.sprite_index = spr_particle_32_circle_boom
	
	if (rayCount > 0) {
		var raySprite = spr_particle_line_ray_w
		var angle, magnitude
		
		for (var i = 0; i < rayCount; i++) {
			inst = instance_create_depth(xLoc, yLoc, depths.fx, obj_particle_single_cycle)
			inst.sprite_index = spr_particle_line_ray_2px_w
			
			angle = ((360 / rayCount) * i) + (random(180 / rayCount))
			magnitude = random(0.25) + 0.25
			
			inst.xVel = angle_xvel(angle) * magnitude
			inst.yVel = angle_yvel(angle) * magnitude
			inst.image_angle = angle
		}
	}
}
