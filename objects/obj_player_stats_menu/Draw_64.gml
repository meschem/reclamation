
if (obj_ui_controller.skipPlayerUi || image_alpha == 0) {
	return 0
}

draw_self()
draw_set_color(c_white)
draw_sprite(titleSprite, 0, x + titleSpriteOffset.x, y + titleSpriteOffset.y)

draw_set_font(titleNameFont)
draw_text(x + titleNameOffset.x, y + titleNameOffset.y, titleName)

draw_set_font(titleClassFont)
draw_text(x + titleClassOffset.x, y + titleClassOffset.y, titleClass)

var _yOffset = statOffsetY

draw_set_font(font_aseprite)

for (var i = 0; i < array_length(slots); i++) {
	var _slot = slots[i]
	
	if (i % 2 == 0) {
		draw_set_color(statWellColor)
		draw_rectangle(x + 5, y + _yOffset - 1, x + width - 6, y + _yOffset - 1 + statWellHeight - 1, false)
	}
	
	//get_player_stat_value_readable(_slot.stat)
	
	draw_set_color(c_white)
	draw_sprite(_slot.sprite_index, _slot.image_index, x + statOffsetX, y + _yOffset)
	draw_text(x + statOffsetX + 15, y + _yOffset - 4, _slot.statName)
	draw_text(x + statValueOffset, y + _yOffset - 4, get_player_stat_value_readable(_slot.stat))
	
	_yOffset += statWellHeight
}

//statOffsetX = 8
//statOffsetY = 56
//statTotalOffset = 102
//statWellHeight = 12
