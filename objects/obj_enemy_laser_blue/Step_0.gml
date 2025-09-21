/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

if (game_is_paused()) {
	return 0
}

age++

beginStep()

range += laserGrowthRate
starAngle += starRotationRate
image_angle += laserRotationRate
image_xscale = range / 10

if (drawEndPiece) {
	var _x = angle_xvel(image_angle) * range
	var _y = angle_yvel(image_angle) * range
	
	laserSpriteEndPiecePos.x = x + _x
	laserSpriteEndPiecePos.y = y + _y
}

if (state == laserStates.full && age % ringSpawnRate == 0) {
	var _inst = instance_create_depth(x, y, depth - 1, ringObject)
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
