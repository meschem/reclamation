draw_set_font(font_pxlxxl_m)

if (showTimeDisplay) {
	if (state == roomStates.overtime) {
		draw_set_color(get_color(colors.red))
		draw_text(2, 2, $"{timeDisplay} LEFT!")
	
		draw_set_color(c_white)
		draw_set_font(font_pxlxxl_m)
	
		draw_text(200, 30, "Level Complete!")
	} else {
		draw_set_color(c_white)
	
		draw_text(2, 2, timeDisplay)
	}
}
