
if (!enabled) {
	return 0
}

draw_sprite_ext(spr_wupg_bar_fill_back, 0, x, y, fillBackScale, 1, 0, c_white, 1)
draw_sprite_ext(spr_wupg_bar_fill_color, 0, x, y, fillCur, 1, 0, c_white, 1)

draw_sprite(weapon.sprite_index, 0, x, y)