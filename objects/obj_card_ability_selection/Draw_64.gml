/// @description Draw Info

var runningOffset = 0

draw_self()

draw_sprite(
	ability.selectionIcon,
	0,
	x + menuOffset.x + 36,
	y + menuOffset.y - 9
)

draw_set_font(font_pixellari)
draw_set_color(get_color(colors.blue))

draw_text(x, y, state)

runningOffset = y + menuOffset.y + 32

var nameOffset = (width - string_width(ability.name)) / 2

draw_text(
	x + menuOffset.x + nameOffset + 1,
	runningOffset + 1,
	ability.name
)

draw_set_color(get_color(colors.dark))

draw_text(
	x + menuOffset.x + nameOffset,
	runningOffset,
	ability.name
)

// linebreak
runningOffset += 25

draw_sprite(
	spr_card_line_break, 0,
	x + menuOffset.x + 10,
	runningOffset
)

runningOffset += 17
// end linebreak

draw_set_font(generalFont)
draw_set_color(get_color(colors.dark))

draw_text_ext(
	x + menuOffset.x + paddingX,
	runningOffset,
	ability.description,
	12,
	maxTextWidth
)

for (var i = 0; i < array_length(ability.stats); i++) {
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