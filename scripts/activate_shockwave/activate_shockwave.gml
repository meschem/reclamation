///@description		Shockwave attack that damages enemies in a cone

///@param {real} level
///@param {real} xPos
///@param {real} yPos
///@param {real} angle
///@param {bool} isCrit

function activate_shockwave(level, xPos, yPos, angle, isCrit) {
	var inst = instance_create_depth(xPos, yPos, depths.fx, obj_particle_single_cycle)
	var rangeScalar = 1
	
	if (isCrit && obj_ability_shockwave.runes[enumRunes.dreygoth].enabled) {
		rangeScalar = obj_ability_shockwave.critBurstRangeScalar
	}
	
	var coneDistance = obj_ability_shockwave.coneDistance * rangeScalar
	var coneHalfArc = obj_ability_shockwave.coneHalfArc * rangeScalar

	inst.sprite_index = spr_shockwave_cone
	inst.image_angle = angle
	inst.image_xscale = rangeScalar
	inst.image_yscale = rangeScalar
	
	var damage = obj_ability_shockwave.baseDamage

	var list = ds_list_create();
	var count = collision_circle_list(xPos, yPos, coneDistance, obj_baddie, false, true, list, false);
	
	if (count > 0)
	{
		for (var i = 0; i < count; ++i;)
		{
			var baddie = list[| i]
			var angleToBaddie = point_direction(xPos, yPos, baddie.x, baddie.y)
			var angleDiff = abs(angle - angleToBaddie)
			
			if (angleDiff < coneHalfArc || angleDiff > 360 - coneHalfArc)
				damage_baddie(baddie, damage)
				
			if (obj_ability_shockwave.runes[enumRunes.magdela].enabled) {
				apply_shocked(baddie, obj_ability_shockwave.lightningShockAmount)
			}
		}
	}
	
	ds_list_destroy(list)
}