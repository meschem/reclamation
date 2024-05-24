
draw_self()

draw_set_color(c_white)
draw_set_font(font_pixelmix_s)

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
	
	//for (var i = 0; i < array_length(item.rawStatDisplay); i++) {
	//	drawTextLine(item.rawStatDisplay[i])
	//}
	
	draw_set_color(c_white)
	
	drawLine += 3

	draw_stats_block(x + padding, y + getYOffset(), item.stats, 1, -12)
}
