
draw_self()

if (equipment != noone) {
	draw_sprite(spr_ability_icon_ball_lit, 0, x, y)
}

if (drawEquipmentInfo) {
	draw_sprite_ext(
		sprite_index,
		image_index,
		x + xOffset,
		y + yOffset,
		width / sprite_width,
		height / sprite_height,
		image_angle,
		image_blend,
		image_alpha
	)
	
	draw_set_color(c_white)
	drawTextLine(equipment.name)
	
	draw_set_color(get_rarity_color(equipment.rarity))
	drawTextLine(equipment.getRarityString())
	
	drawSpace()
	
	draw_set_color(c_white)
	drawTextLine(equipment.description)
	
	//for (var i = 0; i < array_length(item.rawStatDisplay); i++) {
	//	drawTextLine(item.rawStatDisplay[i])
	//}
	
	draw_set_color(c_white)
	
	drawLine += 3

	draw_stats_block(x + padding, y + getYOffset(), equipment.stats, 1, -12)
}
