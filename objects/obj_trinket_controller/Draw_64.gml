
if (dumpInfo) {
	dump_trinket_info()
}

draw_set_font(font_pixelmix_s)
draw_set_color(c_white)

with (obj_player) {
	if (basePoisonDamage > 0) {
		draw_sprite(
			spr_icon_poison_stacks, 1,
			view_width() - 29 - 6,
			view_height() - 48
		)		

		draw_text(
			view_width() - 29 + 13,
			view_height() - 27,
			basePoisonDamage + bonusPoisonDamage
		)
	}
	
	for (var i = 0; i < array_length(trinkets); i++) {		
		draw_sprite(
			trinkets[i].sprite_index, 1,
			view_width() - ((i + 2) * trinkets[i].sprite_width) - (i * 0) - 6,
			view_height() - 48
		)
		
		if (trinkets[i].level > 1) {
			draw_text(
				view_width() - ((i + 2) * trinkets[i].sprite_width) - (i * 0) + 13,
				view_height() - 27,
				"x" + string(trinkets[i].level)
			)
		}
	}
}
