if (sprite_index == sprSlam) {
	sprite_index = sprIdle
} 
else {
	if (abs(xVel) > 0 || abs(yVel) > 0) {
		sprite_index = sprWalking
	} else {
		sprite_index = sprIdle
	}
}