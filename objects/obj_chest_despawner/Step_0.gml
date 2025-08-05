
if (game_is_paused()) {
	return 0
}

age++

if (age > lifeSpan) {
	instance_destroy()
} else {
	if (age > blinksAt && floor(age / 2) % 3 == 0) {
		image_alpha = 0.3
	} else {
		image_alpha = 1
	}
}