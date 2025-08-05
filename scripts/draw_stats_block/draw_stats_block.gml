///@description							Draws stats block for some stats
///@param {real} _x						X coordinate to draw
///@param {real} _y						Y coordinate to draw
///@param {array} _stats				Stats block to use
///@param {real} _level					Level of the item
///@param {real} _spacing				Spacing between stats
///@param {id.Instance} _equip			Equipment to reference
///@return {real}						Amount of lines drawn
function draw_stats_block(_x, _y, _stats, _level = 1, _spacing = 14, _equip = noone) {
	var _baseColor = draw_get_color()
	var _nameString = ""
	
	for (var i = 0; i < array_length(_stats); i++) {
		try {
			nameString = _stats[i].getDisplayName() + ": "
		} catch (_err) {
			show_message(_equip.name)
			return 0
		}
	
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
	
	return i
}
