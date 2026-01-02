/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_color(c_white)

for (var i = 0; i < array_length(upgrade.stats); i++) {
	var nameString = upgrade.stats[i].name + ": "
	
	draw_set_color(c_white)
	
	draw_text(
		x + menuOffset.x + paddingX,
		y + menuOffset.y + height - paddingY - (i * statSpacing),
		nameString
	)
	
	draw_set_color(global.colorGreen)
	
	draw_text(
		x + menuOffset.x + paddingX + string_width(nameString),
		y + menuOffset.y + height - paddingY - (i * statSpacing),
		upgrade.stats[i].getDisplayValue(displayLevel - 1)
	)
}
