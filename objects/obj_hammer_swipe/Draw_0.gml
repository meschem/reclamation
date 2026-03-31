if (spawnDelay > 0) {
	return 0
}

if (reverseSwipe && image_yscale > 0) image_yscale *= -1

draw_sprite_ext(
	sprite_index,
	image_index,
	x + 3, y + 11,
	image_xscale, image_yscale,
	image_angle, c_black, 0.25
)

draw_self()
