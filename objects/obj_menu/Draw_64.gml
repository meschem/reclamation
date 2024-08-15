
if (!display || age < 2) {
	//display = true
	return 0
}

draw_sprite_ext(
	sprite_index, 
	image_index,
	x, y,
	scaleX, 
	scaleY, 
	0, c_white, 1
)

draw_set_font(font_pxlxxl_m)
draw_set_color(c_white)
draw_text(x + paddingX, y + paddingTop, title)

/*
for (var i = 0; i < array_length(buttons); i++) {
	draw_sprite_ext(
		buttons[i].sprite_index,
		buttons[i].image_index,
		x, y,
	)
}
*/
