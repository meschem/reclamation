if (shadowSprite >= 0 && shadowSprite != spr_none) {
	draw_sprite(
		shadowSprite,
		0,
		x,
		y + (sprite_height / 2) + shadowOffset
	)
}

draw_sprite(
	sprite_index,
	image_index,
	x,
	y + floatOffset
)

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

