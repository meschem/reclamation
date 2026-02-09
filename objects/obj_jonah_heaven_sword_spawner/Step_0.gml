
if (game_is_paused()) {
	return 0
}

age++

depth = depths.enemy - y

if (age >= startDelay) {
	image_speed = targetSpeed
	image_alpha = targetAlpha
}
