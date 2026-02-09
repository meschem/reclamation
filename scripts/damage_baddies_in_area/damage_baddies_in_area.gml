///@description								Deals damage to enemies in a radius. Should be called by obj_player?
///@param {real} radius						Radius to select enemies in
///@param {real} amount						Amount of damage
///@param {asset.GMObject} spawnObject		Object to spawn on enemies for extra effects
///@param {real} maxCount					Max amount of enemies that are hit. -1 for no limit.
function damage_baddies_in_area(radius, amount, spawnObject = obj_none, maxCount = -1) {
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
	
	count = min(count, maxCount)

	if (count > 0) {
		for (var i = 0; i < count; i++) {
		    target = enemies[| i]
			
			if (spawnObject != obj_none) {
				instance_create_depth(target.x, target.y, depths.fx, spawnObject)
			}
		
			damage_baddie(target, amount)
		}
	}

	ds_list_destroy(enemies)
}