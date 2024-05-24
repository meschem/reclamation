if (!display) {
	return 0
}

draw_set_color(c_white)

draw_sprite_ext(
	sprite_index,
	image_index,
	x, y,
	buttonWidth / sprite_width,
	buttonHeight / sprite_height,
	0, c_white, 1
)

draw_set_font(font_pxlxxl_m)

draw_text_ext(
	x + paddingX + offsetX,
	y + paddingY + offsetY,
	displayText,
	2, 
	buttonWidth - (2 * paddingX)
)

if (endText != "") {
	var offset = string_width(endText) // string_length(endText) * 5

	//show_debug_message(endText)
	draw_text_ext(
		x + buttonWidth - paddingX - offset,
		y + paddingY + offsetY,
		endText,
		2, 
		buttonWidth - (2 * paddingX)
	)
}
