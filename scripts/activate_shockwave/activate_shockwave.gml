/// @description		Shockwave attack that damages enemies in a cone

/// @param {real}		level
/// @param {real}		xPos
/// @param {real}		yPos
/// @param {real}		angle

function activate_shockwave(level, xPos, yPos, angle) {
	var inst = instance_create_depth(xPos, yPos, depths.fx, obj_particle_single_cycle)

	inst.sprite_index = spr_shockwave_cone
	inst.image_angle = angle
	
	var damage = get_shockwave_damage(level)

	var list = ds_list_create();
	var count = collision_circle_list(xPos, yPos, 64, obj_baddie, false, true, list, false);
	
	if (count > 0)
	{
		for (var i = 0; i < count; ++i;)
		{
			var baddie = list[| i]
			var angleToBaddie = point_direction(xPos, yPos, baddie.x, baddie.y)
			var angleDiff = abs(angle - angleToBaddie)
			
			if (angleDiff < 35 || angleDiff > 325)
				damage_baddie(baddie, damage)
		}
	}
	
	ds_list_destroy(list);
}