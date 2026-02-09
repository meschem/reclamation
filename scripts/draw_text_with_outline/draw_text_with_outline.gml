// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_with_outline(_x, _y, _textString, _color = c_white, _outlineColor = global.colorDark) {
	draw_set_color(_outlineColor)

	draw_text(_x - 1, _y, _textString)
	draw_text(_x + 1, _y, _textString)
	draw_text(_x, _y + 1, _textString)
	draw_text(_x, _y - 1, _textString)

	draw_set_color(c_white)

	draw_text(_x, _y, _textString)
}