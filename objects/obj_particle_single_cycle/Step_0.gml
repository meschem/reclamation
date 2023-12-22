if (game_is_paused()) {
	image_speed = 0
	
	return
} else {
	image_speed = animSpeed
}

x += xVel
y += yVel