///@description		Shockwave attack that damages enemies in a cone

///@param {id.Instance} owner
///@param {real} damage
///@param {real} xPos
///@param {real} yPos
///@param {real} angle

function activate_shockwave_wupg(owner, damage, xPos, yPos, angle) {
	var inst = instance_create_depth(xPos, yPos, depths.fx, obj_particle_single_cycle)
	var rangeScalar = get_player_stat(enumPlayerStats.weaponAoeScalar, owner) 
	
	var coneDistance = 64 * rangeScalar
	var coneHalfArc = 35 // obj_ability_shockwave.coneHalfArc * rangeScalar

	inst.sprite_index = spr_shockwave_cone
	inst.image_angle = angle + 180
	inst.image_xscale = rangeScalar
	inst.image_yscale = rangeScalar
	
	var list = ds_list_create();
	var count = collision_circle_list(xPos, yPos, coneDistance, [obj_baddie, obj_destructible], false, true, list, false);
	
	if (count > 0)
	{
		for (var i = 0; i < count; ++i;)
		{
			var baddie = list[| i]
			var angleToBaddie = point_direction(xPos, yPos, baddie.x, baddie.y)
			var angleDiff = abs(angle - angleToBaddie)
			
			if (angleDiff < coneHalfArc || angleDiff > 360 - coneHalfArc) {
				damage_baddie(baddie, damage)
            }
		}
	}
	
	ds_list_destroy(list)
    
    return inst
}