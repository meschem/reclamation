if (age - damagedOn <= ownerDrawInfo.damagedFlashDuration) {
	shader_set(shd_white_flash)
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y + ownerDrawInfo.floatOffset + offsetY,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

shader_reset()
