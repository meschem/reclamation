
if (shadowSprite >= 0) {
	draw_sprite(
		shadowSprite,
		0,
		x,
		y + (sprite_height / 2) + shadowOffset
	)
}

if (age - damagedOn <= 3)
	shader_set(shd_white_flash)

draw_sprite_ext(
	sprite_index,
	image_index,
	round(x),
	round(y + floatOffset),
	xScale,
	yScale,
	rotation,
	c_white,
	1
)

if (stunLength > 0) {
	draw_sprite(spr_stun_spiral, 0, x, y - (sprite_height) - 10)
}

shader_reset()
