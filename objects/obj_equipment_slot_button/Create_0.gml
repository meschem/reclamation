
width = 24
height = 24
equipment = noone
gearString = ""
index = 0

drawEquipmentInfo = false

xOffset = 12
yOffset = 12
width = 80
height = 120
padding = 5
lineSpacing = 4

drawLine = 0
drawSpacing = 0

///@description				Gets the Y offset to start from
getYOffset = function() {
	return (padding + (lineSpacing * drawLine) + drawSpacing) + yOffset
}

///@description				Draws a string on a line with an effective line return
///@param {string} _str		str to draw
drawTextLine = function(_str) {
	var _yOffset = getYOffset()
	//var yOffset = padding + (lineSpacing * drawLine) + drawSpacing
	//draw_text(x + padding, y + yOffset, str)
	
	draw_text_ext(
		x + padding + xOffset,
		y + _yOffset,
		_str,
		lineSpacing,
		width - (padding * 2)
	)
	
	drawLine++
}
