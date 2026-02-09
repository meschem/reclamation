if (!display) {
	return 0
}

draw_self()

if (state == buttonStates.disabled) {
	draw_set_color(c_gray)
} else {
	draw_set_color(c_white)
}

draw_set_font(textFont)
draw_text(x + textPosition.x, y + textPosition.y, textString)
