
if (displayRunInfo) {
	draw_set_color(c_white)
	draw_set_font(font_dogica_s)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34,
		$"Floor: {currentFloor}"
	)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * 1),
		$"HP Scale: {getBaddieScaling(baddieScalars.hp)}"
	
	)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * 2),
		$"MS Scale: {getBaddieScaling(baddieScalars.moveSpeed)}"
	
	)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * 3),
		$"SC Scale: {getBaddieScaling(baddieScalars.spawnCount)}"
	
	)
}