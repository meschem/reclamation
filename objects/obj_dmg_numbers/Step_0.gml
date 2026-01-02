if (game_is_paused() || !valueSet) {
	return 0
}

age++

yVelSign = sign(yVel)

yVel += gravAccel

if (yVel == 0 || sign(yVel) != yVelSign) {
	yVel = 0
	gravAccel = 0
}

if (age > fadeOutStartFrame) {
	var totalFrameTime = lifeSpan - fadeOutStartFrame
	var fadeRatio = (age - fadeOutStartFrame) / totalFrameTime

	image_alpha = 1 - fadeRatio
}

x += xVel
y += yVel

iconOffsetX = -sprite_width + 4

if (age > lifeSpan)
	instance_destroy()
