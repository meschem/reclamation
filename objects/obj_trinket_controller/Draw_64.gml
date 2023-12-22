
if (dumpInfo) {
	dump_trinket_info()
}

draw_set_font(font_pixelmix_s)
draw_set_color(c_white)

with (obj_player) {
	for (var i = 0; i < array_length(trinkets); i++) {
		draw_sprite(
			trinkets[i].sprite_index, 1,
			view_width() - ((i + 1) * trinkets[i].sprite_width) - (i * 0) - 6,
			view_height() - 48
		)
		
		if (trinkets[i].level > 1) {
			draw_text(
				view_width() - ((i + 1) * trinkets[i].sprite_width) - (i * 0) + 13,
				view_height() - 27,
				"x" + string(trinkets[i].level)
			)
		}
	}
}
