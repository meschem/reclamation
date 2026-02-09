/// @description Insert description here
// You can write your code in this editor
if (state == laserStates.growing) {
	state = laserStates.full
	
	image_index = 0
	sprite_index = laserSpriteFull
	
	starSprite = starSpriteFull
} else if (state == laserStates.shrinking) {
	image_speed = 0
	
	instance_destroy()
}
