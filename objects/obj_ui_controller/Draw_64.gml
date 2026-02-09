
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
