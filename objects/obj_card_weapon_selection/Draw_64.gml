/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (weapon == noone) {
	return
}

draw_set_color(c_black)

for (var i = 0; i < array_length(weapon.stats); i++) {
	var nameString = weapon.stats[i].name + ": "
	
	draw_set_color(get_color(colors.dark))
	
	draw_text(
		x + menuOffset.x + paddingX,
		y + menuOffset.y + height - paddingY - (i * statSpacing),
		nameString
	)
	
	draw_set_color(get_color(colors.red))
	
	draw_text(
		x + menuOffset.x + paddingX + string_width(nameString),
		y + menuOffset.y + height - paddingY - (i * statSpacing),
		weapon.stats[i].getDisplayValue(0)
	)
}
