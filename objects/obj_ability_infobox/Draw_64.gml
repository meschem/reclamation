/// @description Insert description here
// You can write your code in this editor

if (ability == noone || image_alpha == 0) {
	return 0 
}

draw_self()

draw_sprite(spr_infobox_arrow_down, image_index, x + (width / 2) - 5, y + height - 6)

var _y = y + padding.top
var i = 0

draw_set_font(titleFont)
draw_set_color(c_white)
draw_text(x + padding.left, _y, titleText)
_y += string_height(titleText) + lineSpacing + 1

draw_set_font(levelFont)
draw_set_color(fontColor)
draw_text(x + padding.left, _y, levelText)
_y += string_height(levelText) + lineSpacing + 2

draw_set_font(descriptionFont)
draw_set_color(c_white)
draw_text_ext(x + padding.left, _y, descriptionText, lineSpacingSm, width - padding.left - padding.right)
_y += string_height_ext(descriptionText, lineSpacingSm, width - padding.left - padding.right) + lineSpacing

_y += statLineSpacing

draw_set_font(statFont)

for (i = 0; i < array_length(statBonuses); i++) {
	draw_set_color(statBonuses[i].nameColor)
	
	draw_sprite(statBonuses[i].iconSpriteIndex, statBonuses[i].iconImageIndex, x + padding.left - 2, _y + 3)
	
	draw_text(x + padding.left + 16, _y, statBonuses[i].name)
	draw_text(x + width - 48, _y, statBonuses[i].statString)
	
	_y += string_height(statBonuses[i].name)
	
	draw_set_color(c_white)	
	draw_text_ext(x + padding.left, _y, statBonuses[i].description, lineSpacingSm, width - padding.left - padding.right)
	
	_y += string_height_ext(statBonuses[i].description, lineSpacingSm, width - padding.left - padding.right)
	_y += statLineSpacing
}
