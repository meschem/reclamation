if (shadowSprite >= 0) {
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