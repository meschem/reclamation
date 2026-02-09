draw_self()

draw_sprite_ext(
	hpBarFillSprite,
	0,
	x + fillOffsetX, y + fillOffsetY,
	hpBarFillScaleX,
	1, 0, c_white, 1
)

draw_set_font(nameFont)

draw_set_color(c_black)
draw_text(
	nameDrawX - (string_width(nameString) / 2) + 1, 
	y + nameDrawOffsetY + 1,
	nameString
)

draw_set_color(nameColor)
draw_text(
	nameDrawX - (string_width(nameString) / 2), 
	y + nameDrawOffsetY,
	nameString
)


draw_set_font(descFont)
draw_set_color(descColor)

draw_text(
	descDrawX - (string_width(descString) / 2), 
	y + descDrawOffsetY,
	descString
)
