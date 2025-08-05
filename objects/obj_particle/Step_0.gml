if (game_is_paused()) {
	image_speed = 0
	
	return
} else {
	image_speed = animSpeed
}

age++

x += xVel
y += yVel

var ageRatio = age / lifeSpan

if (changeAlpha) {
	var alphaChange = alphaEnd - alphaStart
	image_alpha = alphaStart + (ageRatio * alphaChange)
}

if (changeScale) {
	var scaleChange = scaleEnd - scaleStart
	image_xscale = scaleStart + (ageRatio * scaleChange)
	image_yscale = image_xscale
}

if (age >= lifeSpan)
	instance_destroy()
