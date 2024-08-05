
var _viewWidthOffset = camera_get_view_width(view_camera[0]) - 100
var i = 0

if (displayRunInfo) {
	draw_set_color(c_white)
	draw_set_font(font_dogica_s)
	
	draw_text(
		_viewWidthOffset,
		34 + (displayStateSpacing * i),
		$"Floor: {currentFloor}"
	)
	
	i++
	
	draw_text(
		_viewWidthOffset,
		34 + (displayStateSpacing * i),
		$"HP Scale: {getBaddieScaling(baddieScalars.hp)}"
	
	)
	
	i++
	
	draw_text(
		_viewWidthOffset,
		34 + (displayStateSpacing * i),
		$"MS Scale: {getBaddieScaling(baddieScalars.moveSpeed)}"
	)
	
	i++
	
	draw_text(
		_viewWidthOffset,
		34 + (displayStateSpacing * i),
		$"SC Scale: {getBaddieScaling(baddieScalars.spawnCount)}"
	
	)
	
	//i++
	
	// DRAWING INPUT INFO, TEMP
	//draw_text(
	//	_viewWidthOffset,
	//	34 + (displayStateSpacing * i),
	//	$"Input: {obj_input_controller.lastInputTypeString()}"
	//)
}

i++

if (displayRunStats) {
	draw_set_color(c_white)
	draw_set_font(font_dogica_s)

	i++
	
	draw_text(
		_viewWidthOffset,
		34 + (displayStateSpacing * i),
		$"Kills: {obj_run_stats_controller.statsKillsTotal}"
	)
	
	i++
	
	draw_text(
		_viewWidthOffset,
		34 + (displayStateSpacing * i),
		$"XP Gained: {obj_run_stats_controller.statsXpGained}"
	)	
	
	//i++
	
	//draw_text(
	//	_viewWidthOffset,
	//	34 + (displayStateSpacing * i),
	//	$"Kills: {obj_input_controller.lastInputTypeString()}"
	//)
	
	//i++
	
	//draw_text(
	//	_viewWidthOffset,
	//	34 + (displayStateSpacing * i),
	//	$"Kills: {obj_input_controller.lastInputTypeString()}"
	//)
}