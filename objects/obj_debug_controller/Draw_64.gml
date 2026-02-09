
if (draw) {
	var _y = drawY + padding
	var _x = drawX + padding
	var _strWidth = width - (padding * 2)

	draw_set_color(c_black)
	draw_set_alpha(bgAlpha)
	draw_rectangle(drawX, drawY, drawX + width, drawY + height, false)
	
	draw_set_font(debugFont)
	draw_set_color(c_white)
	
	for (var i = 0; i < array_length(textBlobs); i++) {
		draw_text_ext(_x, _y, textBlobs[i], lineHeight, _strWidth)
		
		_y += lineSpacing + string_height_ext(textBlobs[i], lineHeight, _strWidth)
	}
	
	draw_set_alpha(1)
}
