if (spawnDelay > 0) {
	return 0
}

draw_sprite_ext(
	shadowSprite, 0,
	x, y + shadowOffsetY,
	image_xscale, image_yscale,
	image_angle, c_white, 1
)

if (trail) {
	drawTrail()
}

draw_self()
