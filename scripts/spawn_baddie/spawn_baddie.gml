///@description						Spawns baddies in a random location around the border
///@param {asset.GMObject} enemy	Enemy to spawn
///@param {real} count				Amount of enemies to spawn
///@param {real} spread				Distance between enemies if count > 1
///@param {array} flags				Flags of enumSpawnFlags
///@return {array<id.Instance>}
function spawn_baddie(enemy, count = 1, spread = 16, flags = {}) {
	var spawnDir = irandom(3)
	var randomX = irandom_range(-20, room_width + 20)
	var randomY = irandom_range(-20, room_height + 20)
	var target = get_player_target()
	
	var zone = get_random_instance(obj_spawn_zone)
	
	var inst, i
	var spawns = []
	
	//get random spot in zone
	var spawnX = irandom(zone.bbox_right - zone.bbox_left) + zone.x
	var spawnY = irandom(zone.bbox_bottom - zone.bbox_top) + zone.y
	
	// enemy radius to determine total area, average enemy size
	
	if (count == 1) {
		inst = instance_create_depth(spawnX, spawnY, depths.enemy, enemy)
		
		array_push(spawns, inst)
		
		with (inst) {
			move_until_free()
		}
	} else {
		// using 16 as avg radius for a baddie
		var spawnArea = (pi * 16 * 16) * count
		spread = sqrt(spawnArea / pi)
		
		for (i = 0; i < count; i++) {
			var angle = irandom(360)
			var mag = irandom(spread)
			
			inst = instance_create_depth(
				spawnX + angle_xvel(angle) * mag,
				spawnY + angle_yvel(angle) * mag,
				depths.enemy,
				enemy
			)
			
			array_push(spawns, inst)
			
			//with (inst) {
			//	move_until_free()
			//}
		}
	}
	
	for (i = 0; i < array_length(spawns); i++) {
		if (array_contains(spawnFlags, enumSpawnFlags.noTarget)) {
			spawns[i].target = noone
		} else {
			spawns[i].target = target
		}
		
		if (array_contains(spawnFlags, enumSpawnFlags.chargeOpposite)) {
			spawns[i].facingAngle = get_facing_angle_from_spawn_side(zone.spawnSide)
		}
		
		if (array_contains(spawnFlags, enumSpawnFlags.chargeTarget)) {
			spawns[i].facingAngle = point_direction(spawns[i].x, spawns[i].y, target.x, target.y)
		}
	}	
	
	apply_baddie_scaling(spawns)
	
	return spawns
}
