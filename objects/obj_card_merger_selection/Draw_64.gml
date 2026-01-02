/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

var _statsSpecialHeight = 0

for (var i = 0; i < array_length(merger.statsSpecial); i++) {
	draw_set_color(get_color(colors.red))
	
	_statsSpecialHeight += string_height_ext(merger.statsSpecial[i], 12, width - (paddingX * 2))
	
	draw_text_ext(
		x + menuOffset.x + paddingX,
		y + menuOffset.y + height - floor(paddingY / 2) - _statsSpecialHeight,
		merger.statsSpecial[i], 12,
		width - (paddingX * 2)
	)
	
	_statsSpecialHeight += 4
}

for (var i = 0; i < array_length(merger.stats); i++) {
	var nameString = merger.stats[i].getDisplayName() + ": "
	
	draw_set_color(get_color(colors.white))
	
	draw_text(
		x + menuOffset.x + paddingX,
		y + menuOffset.y + height - paddingY - (i * statSpacing) - _statsSpecialHeight,
		nameString
	)
	
	draw_set_color(get_color(colors.red))
    
    //show_message(displayLevel)
    
    var fff = merger.stats[i].getDisplayValue()
	
	draw_text(
		x + menuOffset.x + paddingX + string_width(nameString),
		y + menuOffset.y + height - paddingY - (i * statSpacing) - _statsSpecialHeight,
		merger.stats[i].getDisplayValue()
	)
}
