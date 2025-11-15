if (age - damagedOn <= 4) {
	shader_set(shd_white_flash)
}

//draw_self()

draw_sprite_ext(
	sprite_index,
	image_index,
	x + shakeOffsetX,
	y + shakeOffsetY,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

shader_reset()
