// Inherit the parent event
event_inherited();

draw_set_color(c_black)

for (var i = 0; i < array_length(ability.stats); i++) {
	if (ability.stats[i].displayOnLevelUp(ability.level)) {
		var nameString = ability.stats[i].name + ": "
	
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
			ability.stats[i].getDisplayValue(ability.level)
		)
	}
}
