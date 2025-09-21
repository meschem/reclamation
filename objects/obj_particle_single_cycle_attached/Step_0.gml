if (game_is_paused()) {
	image_speed = 0
	
	return
} else {
	image_speed = animSpeed
}

if (parent == noone || !instance_exists(parent)) {
	instance_destroy()
	return 0
}

velOffsetX += xVel
velOffsetY += yVel

x = parent.x + offsetX + velOffsetX
y = parent.y + offsetY + velOffsetY
