if (shadow) {
	draw_sprite(shadow, 0, x, y - yGroundOffset + shadowOffset)
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x, y + zOffset,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)
