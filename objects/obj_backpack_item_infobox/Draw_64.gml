/// @description Insert description here
// You can write your code in this editor

if (item == noone || image_alpha == 0) {
	return 0 
}

draw_self()

var _y = y + padding.top

draw_set_font(titleFont)
draw_set_color(c_white)
draw_text(x + padding.left, _y, titleText)
_y += string_height(titleText) + lineSpacing

draw_set_font(rarityFont)
draw_set_color(rarityColor)
draw_text(x + padding.left, _y, rarityText)
_y += string_height(rarityText) + lineSpacing

draw_set_font(descriptionFont)
draw_set_color(c_white)
draw_text_ext(x + padding.left, _y, descriptionText, lineSpacing, width - padding.left - padding.right)
_y += string_height_ext(descriptionText, lineSpacing, width - padding.left - padding.right) + lineSpacing

_y += statLineSpacing

draw_set_font(statFont)

if (array_length(statTextLines) > 0) {
	for (var i = 0; i < array_length(statTextLines); i++) {
		draw_text(x + padding.left, _y, statTextLines[i])
		_y += string_height(statTextLines[i]) + lineSpacing
	}
}
