/// @description Iterate

var i = 0
var width, height, yOffset
var _yPos = yPos
var _xPos = xPos
var _padding = padding
var _margin = margin
var _spacing = 24

with (obj_toaster) {
	draw_set_font(font_pixellari)
	draw_set_color(bgColor)
	
	// FIXME: Perf. Set this on msgs
	width = string_width(textMessage)
	height = string_height(textMessage)
	yOffset = i * _spacing
	
	draw_rectangle(
		_xPos - width - (_padding * 2),
		_yPos - height - (_padding * 2) - yOffset,
		_xPos,
		_yPos - yOffset,
		false
	)
	
	draw_set_color(c_white)
	
	draw_text(
		_xPos - width - _padding,
		_yPos - height - _padding - yOffset,
		textMessage
	)

	i++
}