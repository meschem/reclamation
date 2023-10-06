
draw_self()

draw_set_color(c_white)

//draw_text(x + padding, y + padding, title)

index = 0

if (item != noone) {
	draw_set_color(c_white)
	drawTextLine(item.name)
	
	draw_set_color(get_rarity_color(item.rarity))
	drawTextLine(item.getRarityString())
	
	drawSpace()
	
	draw_set_color(c_white)
	drawTextLine(item.description)
}