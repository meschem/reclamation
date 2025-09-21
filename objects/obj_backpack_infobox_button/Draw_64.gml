
if (skipDraw) {
	return 0
}

if (image_alpha == 0 || infobox.item == noone || infobox.image_alpha == 0) {
	return 0
}

draw_self()

//draw_sprite(spr_backpack_input_indicator, 0, x, y)

draw_sprite(icon, 0, x + iconOffset.x, y + iconOffset.y)

draw_set_font(iconFont)
draw_set_color(c_white)
draw_text(x + iconTextOffset.x, y + iconTextOffset.y, inputText)
