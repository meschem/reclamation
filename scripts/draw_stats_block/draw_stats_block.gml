///@description   Description
function draw_stats_block(_x, _y, _stats, _level = 1, _spacing = 14) {
	var _baseColor = draw_get_color()
	
	for (var i = 0; i < array_length(_stats); i++) {
		var nameString = _stats[i].getDisplayName() + ": "
	
		draw_set_color(_baseColor)
	
		draw_text(
			_x,
			_y + (i * _spacing),
			nameString
		)
	
		draw_set_color(get_color(colors.red))
	
		draw_text(
			_x + string_width(nameString),
			_y + (i * _spacing),
			_stats[i].getDisplayValue(_level - 1)
		)
	}
}
