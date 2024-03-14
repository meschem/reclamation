///@description						Spawns baddies in a random location around the border
///@param {asset.GMObject} enemy	Enemy to spawn
///@param {real} count				Amount of enemies to spawn
///@param {real} spread				Distance between enemies if count > 1
///@return {array<id.Instance>}

function spawn_baddie(enemy, count = 1, spread = 20) {
	var spawnDir = irandom(3)
	var randomX = irandom_range(-20, room_width + 20)
	var randomY = irandom_range(-20, room_height + 20)
	
	var zone = get_random_instance(obj_spawn_zone)
	
	var inst, i
	var spawns = []
	
	//get random spot in zone
	var spawnX = irandom(zone.bbox_right - zone.bbox_left) + zone.x
	var spawnY = irandom(zone.bbox_bottom - zone.bbox_top) + zone.y
	
	if (count == 1) {
		inst = instance_create_depth(spawnX, spawnY, depths.enemy, enemy)
		
		array_push(spawns, inst)
		
		with (inst) {
			move_until_free()
		}
	} else {
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
			
			with (inst) {
				move_until_free()
			}
		}
	}
	
	for (i = 0; i < array_length(spawns); i++) {
		spawns[i].spawnSide = zone.spawnSide
		spawns[i].hpMax *= obj_run_controller.getBaddieScaling(baddieScalars.hp)
		spawns[i].hp = spawns[i].hpMax
		spawns[i].moveSpeedMax *= obj_run_controller.getBaddieScaling(baddieScalars.moveSpeed)
	}	
	
	return spawns
}
