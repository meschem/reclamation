
if (shadowSprite >= 0) { 
	draw_sprite(
		shadowSprite,
		0,
		x,
		y + (sprite_height / 2) + shadowOffset
	) 
}

if (age - damagedOn <= 4) {
	shader_set(shd_white_flash)
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y + floatOffset,
	image_xscale * damageXScaleMultiplier,
	image_yscale * damageYScaleMultiplier,
	image_angle,
	image_blend,
	image_alpha
)

if (stunLength > 0) {
	draw_sprite(spr_stun_spiral, 0, x, y - (sprite_height) + 9)
}

shader_reset()
