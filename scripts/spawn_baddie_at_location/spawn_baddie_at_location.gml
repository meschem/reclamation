///@description						Spawns baddies in a random location around the border
///@param {asset.GMObject} enemy	Enemy to spawn
///@param {real} _x					Amount of enemies to spawn
///@param {real} _y					Distance between enemies if count > 1
///@return {id.Instance}

function spawn_baddie_at_location(enemy, _x, _y) {
	create_toaster("Calling spawn_baddie_at_location", errorLevels.warning)
	var spawnX = _x
	var spawnY = _y
	var inst
	
	inst = instance_create_depth(_x, _y, depths.enemy, enemy)
	
	with (inst)
		move_until_free()

	//if (count == 1) {
	//	instance_create_depth(spawnX, spawnY, depths.enemy, enemy)
	//} else {
	//	for (var i = 0; i < count; i++) {
	//		var angle = irandom(360)
	//		var mag = irandom(spread)
			
	//		var inst = instance_create_depth(
	//			spawnX + angle_xvel(angle) * mag,
	//			spawnY + angle_yvel(angle) * mag,
	//			depths.enemy,
	//			enemy
	//		)
			
	//		with (inst) {
	//			move_until_free()
	//		}
	//	}
	//}
	
	return inst
}