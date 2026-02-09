if (shadowSprite >= 0 && shadowSprite != spr_none) {
	draw_sprite(
		shadowSprite,
		0,
		x,
		y + (sprite_height / 2) + shadowOffset
	)
}

if (flashBlendRatio < 1) {
	shader_set(shd_white_flash_blend)
	shader_set_uniform_f(
		shader_get_uniform(shd_white_flash_blend, "u_flashRatio"),
		flashBlendRatio
	)
	
	

}

draw_sprite(
	sprite_index,
	image_index,
	x,
	y + floatOffset
)

if (flashBlendRatio < 1) {
	shader_reset()
}

if (drawLocatorArrow) {
	draw_sprite_ext(
		arrowSprite,
		0,
		arrowDrawLocation.x,
		arrowDrawLocation.y,
		1, 1,
		arrowDrawAngle,
		c_white,
		1
	)
}

