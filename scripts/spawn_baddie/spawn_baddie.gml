///@description						Spawns baddies in a random location around the border
///@param {asset.GMObject} enemy	Enemy to spawn
///@param {real} count				Amount of enemies to spawn
///@param {real} spread				Distance between enemies if count > 1

function spawn_baddie(enemy, count = 1, spread = 20) {
	var spawnDir = irandom(3)
	var randomX = irandom_range(-20, room_width + 20)
	var randomY = irandom_range(-20, room_height + 20)

	//if (lastRandomX == randomX) {
	//	show_debug_message("same randomX: " + string(randomX))
	//	randomX = irandom_range(-20, room_width + 20)
	//	show_debug_message("new randomX: " + string(randomX))
	//} else {
		//show_debug_message(randomX)
		//show_debug_message(lastRandomX)
	//}
	
	//lastRandomX = randomX
	//lastRandomY = randomY
	
	switch (spawnDir) {
		case 0:
			spawnX = randomX
			spawnY = -20
		break;
		
		case 1:
			spawnX = randomX
			spawnY = room_height + 20
		break;
		
		case 2:
			spawnX = -20
			spawnY = randomY
		break;
		
		case 3:
			spawnX = room_width + 20
			spawnY = randomY
		break;
		
		default:
			show_message(spawnDir)
		break;
	}

	if (count == 1) {
		instance_create_depth(spawnX, spawnY, depths.enemy, enemy)
	} else {
		for (var i = 0; i < count; i++) {
			var angle = irandom(360)
			var mag = irandom(spread)
			
			instance_create_depth(
				spawnX + angle_xvel(angle) * mag,
				spawnY + angle_yvel(angle) * mag,
				depths.enemy,
				enemy
			)
		}
	}
}