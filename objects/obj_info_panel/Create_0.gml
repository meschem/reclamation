
width = 0
height = 0
lineSpacing = 14
padding = 6

drawLine = 0
drawSpacing = 0

setDimensions = function(_width, _height) {
	width = _width
	height = _height
	
	image_xscale = width / sprite_width
	image_yscale = height / sprite_height
}

///@description				Creates a spacing for lines
drawSpace = function(amount = round(lineSpacing)) {
	drawSpacing += amount
}

getYOffset = function() {
	return (padding + (lineSpacing * drawLine) + drawSpacing)
}

///@description				Draws a string on a line with an effective line return
///@param {string} str		str to draw
drawTextLine = function(str, align = enumAligns.left) {
	var yOffset = getYOffset()
	//var yOffset = padding + (lineSpacing * drawLine) + drawSpacing
	//draw_text(x + padding, y + yOffset, str)
	
	draw_text_ext(
		x + padding,
		y + yOffset,
		str,
		lineSpacing,
		width - (padding * 2)
	)
	
	drawLine++
}

enum enumAligns {
	left,
	center,
	right
}