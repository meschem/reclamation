/// @description	Spawns a small burst of fx
/// @param {real}	xLoc
/// @param {real}	yLoc
/// @param {real}	rayCount	Amount of rays to shoot out

function spawn_fx_small_burst(xLoc, yLoc, rayCount = 8) {
	var inst = instance_create_depth(xLoc, yLoc, depths.fx, obj_particle_single_cycle)
	inst.sprite_index = spr_circle_hit_flash_32_w
	//inst.image_xscale = 1.5
	//inst.image_yscale = 1.5

    var raySprite = spr_particle_line_ray_w
    var angle, magnitude
    
    for (var i = 0; i < rayCount; i++) {
        inst = instance_create_depth(xLoc, yLoc, depths.fx, obj_particle_single_cycle)
        inst.sprite_index = spr_particle_line_ray_w
        
        angle = ((360 / rayCount) * i) + (random(180 / rayCount))
        magnitude = random_range(0.2, 0.6)
        
        inst.xVel = angle_xvel(angle) * magnitude
        inst.yVel = angle_yvel(angle) * magnitude
        inst.image_angle = angle
        inst.image_speed = random_range(0.5, 1.5)
    }
}
