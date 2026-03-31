
if (bigAlertTextTimer > 0) {
    draw_set_font(bigAlertTextFont)
    draw_set_color(c_black)
    draw_text(bigAlertTextLocation.x + 1, bigAlertTextLocation.y + 1, bigAlertText)
    draw_set_color(c_white)
    draw_text(bigAlertTextLocation.x, bigAlertTextLocation.y, bigAlertText)
    
    draw_set_font(font_pxlxxl_m)    
}

if (drawStatBars) {
	var _color = (drawFps < 60) ? c_red : c_white
	draw_set_font(font_dogica_s)
	draw_set_color(_color)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		22,
		"FPS: " + string(floor(drawFps))
	)
}
