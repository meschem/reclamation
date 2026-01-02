//if (food == noone) {
//	return 0
//}

if (state == buttonStates.holding) {
	return 0
}

// Draw Sprite
draw_sprite_ext(
	sprite_index,
	image_index,
	x + drawOffsetX + focusOffsetX,
	y + drawOffsetY + focusOffsetY,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (!enabled && state != buttonStates.flashing) {
	return 0
}

draw_sprite(foodBackdrop, 0, x + 10, y + 10)
draw_sprite(food.sprite_index, food.image_index, x + 24, y + 30)

draw_sprite_ext(
	titleBackdrop,
	0,
	x + 41,
	y + 14,
	titleBackdropWidth / sprite_get_width(titleBackdrop),
	1,
	0,
	c_white,
	1
)

draw_set_colour(c_white)
draw_set_font(titleFont)
draw_text(x + 47, y + 17, food.name)

draw_set_font(font_aseprite)

for (var i = 0; i < array_length(statBlocks); i++) {
	var _xOffset = 0
	var _block = statBlocks[i]
	var _highlightColor = _block.amount > 0 ? fontColorHighlight : fontColorLowlight
	var _sign = _block.amount > 0 ? "+" : "-"
	
	draw_set_color(_highlightColor)
	draw_text(x + _block.x, y + _block.y, _sign + string(_block.amount))
	
	draw_set_color(c_white)
	draw_sprite(_block.icon, 0, x + _block.x + 16, y + _block.y + 3)
	draw_text(x + _block.x + 28, y + _block.y, _block.name)
	
	draw_text(x + _block.x + 102, y + _block.y, string(_block.current))
	draw_text(x + _block.x + 116, y + _block.y, ">")
	draw_set_color(_highlightColor)
	draw_text(x + _block.x + 124, y + _block.y, string(_block.future))
}

draw_set_color(c_white)

if (state == buttonStates.flashing) {
	draw_sprite_ext(
		flashSprite,
		flashFrame,
		x,
		y,
		1,
		1,
		0,
		c_white,
		0.55
	)
}