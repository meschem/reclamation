
if (displayRunInfo) {
	draw_set_color(c_white)
	draw_set_font(font_dogica_s)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 80,
		34,
		$"Floor: {currentFloor}"
	)
}