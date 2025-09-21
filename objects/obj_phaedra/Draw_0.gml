
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y + floatOffset,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

draw_sprite_ext(
	shadowSprite, 0,
	x,
	y + shadowOffsetY,
	image_xscale * shadowScale,
	image_yscale * shadowScale,
	0, c_white, 1
)