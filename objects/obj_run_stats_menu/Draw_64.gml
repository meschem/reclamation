
draw_self()

draw_sprite(titleSprite, 0, x + titleSpriteXOffset, y + titleSpriteYOffset)

draw_set_font(font_pixellari)
draw_set_color(c_white)

var _curY = y + statsDrawOffsetY

for (var i = 0; i < min(statsDrawLines, array_length(stats)); i++) {
	draw_set_color(get_color(colors.blue))
	
	draw_text(
		x + statsDrawPaddingX + 1,
		y + _curY + 1,
		stats[i].name
	)
	
	draw_text(
		x + width - statsDrawPaddingX - string_width(stats[i].value) + 1,
		y + _curY + 1,
		stats[i].value
	)
	
	draw_text(
		x + statsDrawPaddingX + 2,
		y + _curY + 2,
		stats[i].name
	)
	
	draw_text(
		x + width - statsDrawPaddingX - string_width(stats[i].value) + 2,
		y + _curY + 2,
		stats[i].value
	)
	
	draw_set_color(c_white)
	
	draw_text(
		x + statsDrawPaddingX,
		y + _curY,
		stats[i].name
	)
	
	draw_text(
		x + width - statsDrawPaddingX - string_width(stats[i].value),
		y + _curY,
		stats[i].value
	)
	
	_curY += statsDrawLineHeight
}

draw_sprite(spr_card_line_break, 0, x + 35, y + height - 110)
