/// @description Insert description here
// You can write your code in this editor

if (parentLaser == id) {
	return 0
}

if (game_is_paused()) {
	return 0
}

if (!instance_exists(parentLaser)) {
	instance_destroy()
	
	return 0
}

image_alpha = 1

age++

velocity = min(velocityMax, velocity + accel)
offset += velocity

if (offset > offsetMax) {
	instance_destroy()
	
	return 0
}

image_angle = parentLaser.image_angle

var _offset = get_vec2_from_angle_mag(image_angle, offset)

x = parentLaser.x + _offset.x
y = parentLaser.y + _offset.y

