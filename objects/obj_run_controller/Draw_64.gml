
if (displayRunInfo) {
	var i = 0
	
	draw_set_color(c_white)
	draw_set_font(font_dogica_s)
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * i),
		$"Floor: {currentFloor}"
	)
	
	i++
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * i),
		$"HP Scale: {getBaddieScaling(baddieScalars.hp)}"
	
	)
	
	i++
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * i),
		$"MS Scale: {getBaddieScaling(baddieScalars.moveSpeed)}"
	)
	
	i++
	
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * i),
		$"SC Scale: {getBaddieScaling(baddieScalars.spawnCount)}"
	
	)
	
	i++
	
	// DRAWING INPUT INFO, TEMP
	draw_text(
		camera_get_view_width(view_camera[0]) - 100,
		34 + (displayStateSpacing * i),
		$"Input: {obj_input_controller.lastInputTypeString()}"
	)
}