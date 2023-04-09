
draw_set_font(font)

if (fontShadow > 0) {
	draw_text_ext_color(
		x + fontShadow, 
		y + fontShadow,
		displayText, 1,
		32,
		c_black, c_black, c_black, c_black,
		0.5 * textAlpha
	)
}

draw_text_ext_color(
	x, y,
	displayText, 1,
	32,
	fontColor, fontColor, fontColor, fontColor,
	textAlpha
)

