if (game_is_paused()) {
	image_speed = 0
	
	return
} else {
	image_speed = animSpeed
}

age++

var ageRatio = age / lifeSpan

if (changeAlpha) {
	var alphaChange = alphaEnd - alphaStart
	image_alpha = alphaStart + (ageRatio * alphaChange)
}

if (changeScale) {
	var scaleChange = scaleEnd - scaleStart
	image_alpha = scaleStart + (ageRatio * scaleChange)
}

if (age >= lifeSpan)
	instance_destroy()
