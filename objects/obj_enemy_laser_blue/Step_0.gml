/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

if (game_is_paused()) {
	return 0
}

starAngle += starRotationRate
image_angle += laserRotationRate

if (state == laserStates.full && age % ringSpawnRate == 0) {
	var _inst = instance_create_depth(x, y, depth - 1, obj_laser_ring)
	_inst.parentLaser = id
}

if (state == laserStates.tell && age >= tellDuration) {
	state = laserStates.growing
	damageOnCollide = true
	
	image_index = 0
	sprite_index = laserSpriteGrowing
	
	starSprite = starSpriteGrowing
}

if (state != laserStates.shrinking && duration > 0 && age > duration) {
	state = laserStates.shrinking
	damageOnCollide = false
	
	image_index = 0
	sprite_index = laserSpriteShrinking
}

if (state == laserStates.shrinking) {
	//show_message(sprite_get_number(laserSpriteShrinking))
	starSpriteScaleX = 1 - (image_index / sprite_get_number(laserSpriteShrinking))
	starSpriteScaleY = starSpriteScaleX
}
