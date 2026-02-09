///@description			Draw

draw_self()

if (item != noone) {
	draw_set_font(nameFont)
	draw_set_color(get_color(colors.dark))
	draw_text(x + padding.left + 1, y + padding.top + 1, item.name)
	draw_set_color(c_white)
	draw_text(x + padding.left, y + padding.top, item.name)
	
	draw_set_font(costFont)
	draw_sprite(spr_coin, 0, x + padding.left + 4, y + padding.top + 20)
	draw_text(x + padding.left + 12, y + padding.top + 11, string(item.cost))
	
	draw_sprite(item.sprite_index, 1, x + iconOffsetX, y + iconOffsetY)
	
	
	if (mergeIconActive) {
		draw_sprite(
			spr_merge_alert_icon,
			0,
			x + mergeIconOffset.x ,
			y + mergeIconOffset.y
		)
	}
}

else if (soldOut) {
	draw_sprite(
		soldOutSprite,
		0,
		x + (width / 2),
		y + (spriteHeight / 2)
	)
}

