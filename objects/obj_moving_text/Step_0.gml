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

	textAlpha = 1 - fadeRatio
}

x += xVel
y += yVel

if (age > lifeSpan)
	instance_destroy()
