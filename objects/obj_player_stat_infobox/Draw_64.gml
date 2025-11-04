/// @description Insert description here
// You can write your code in this editor

if (!isSetup || image_alpha == 0) {
	return 0 
}

draw_self()

draw_sprite(spr_player_stat_infobox_title_backdrop, 0, x + 7, y + 8)
draw_sprite(spr_infobox_arrow_left, 0, x - 6, y + (height / 2) - 7)

var _y = y + padding.top

draw_set_font(titleFont)
draw_set_color(c_white)
draw_text(x + padding.left, _y, titleText)
_y += string_height(titleText)

_y += descriptionPaddingTop

draw_set_font(descriptionFont)
draw_set_color(c_white)
draw_text_ext(x + padding.left, _y, descriptionText, lineSpacingSm, width - padding.left - padding.right)
_y += string_height_ext(descriptionText, lineSpacingSm, width - padding.left - padding.right) + lineSpacing
