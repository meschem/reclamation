/// @description Insert description here
// You can write your code in this editor

if (game_is_paused()) {
	return 0
}

if (state == firePointStates.idle) {
	return 0
}

fireDelayAge++

if (fireDelayAge >= spawnDelay) {
	fireDelayAge = 0
	state = firePointStates.idle
	
	var _inst = instance_create_depth(x, y, depths.enemyProjectile, projectile)
	
	_inst.direction = direction
	_inst.image_angle = image_angle
}
