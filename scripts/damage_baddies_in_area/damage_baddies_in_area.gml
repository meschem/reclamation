///@description   Description
function damage_baddies_in_area(radius, amount) {
	var target, inst
	var enemies = ds_list_create()	
	var count = collision_circle_list(
		x,
		y,
		radius,
		obj_baddie,
		false,
		true,
		enemies,
		false
	);

	if (count > 0) {
		for (var i = 0; i < count; i++)
		{
		    target = enemies[| i]
		
			damage_baddie(target, amount)
			
			//inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
			//inst.sprite_index = spr_particle_lightning_medium
		}
	}

	ds_list_destroy(enemies)
}