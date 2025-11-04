if (spawnDelay > 0) {
	return 0
}

if (trail) {
	drawTrail()
}

draw_sprite(
	spr_fire_med_bg,
	image_index,
	x,
	y
)

draw_sprite(
	sprite_index,
	image_index,
	x,
	y
)
