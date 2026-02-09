/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_alagard)
draw_set_color(get_color(colors.white))

var _xLocation = (view_width() / 2) - (string_width(title) / 2)
draw_text(_xLocation, titleDrawY, title)

_xLocation = (view_width() / 2) - (string_width(section) / 2)
draw_text(_xLocation, sectionDrawY, section)