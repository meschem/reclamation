///@description								Deals damage to enemies in a radius. Should be called by obj_player?
///@param {real} radius						Radius to select enemies in
///@param {real} amount						Amount of damage
///@param {gmasset.Object} spawnObject		Object to spawn on enemies for extra effects
function damage_baddies_in_area(radius, amount, spawnObject = obj_none) {
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
	)

	if (count > 0) {
		for (var i = 0; i < count; i++)
		{
		    target = enemies[| i]
			
			if (spawnObject != obj_none) {
				instance_create_depth(target.x, target.y, depths.fx, spawnObject)
			}
		
			damage_baddie(target, amount)
			
			//inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
			//inst.sprite_index = spr_particle_lightning_medium
		}
	}

	ds_list_destroy(enemies)
}