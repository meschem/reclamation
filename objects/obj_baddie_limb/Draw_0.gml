if (age - damagedOn <= ownerDrawInfo.damagedFlashDuration) {
	shader_set(shd_white_flash)
}

draw_sprite_ext(
	sprite_index,
	image_index,
	round(x),
	round(y + ownerDrawInfo.floatOffset),
	image_xscale * ownerDrawInfo.damageXScaleMultiplier,
	image_yscale * ownerDrawInfo.damageYScaleMultiplier,
	ownerDrawInfo.rotation,
	image_blend,
	image_alpha
)

shader_reset()
