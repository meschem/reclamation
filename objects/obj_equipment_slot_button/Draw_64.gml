
draw_self()

if (equipment != noone) {
	draw_sprite(equipment.icon, iconSpriteIndex, x + 3, y + 3)
} else if (sprite != spr_none) {
	draw_sprite(sprite, iconSpriteIndex, x + 3, y + 3)
}

//if (drawEquipmentInfo) {
//	drawLine = 0
	
//	draw_sprite_ext(
//		sprite_index,
//		image_index,
//		x + xOffset,
//		infoBoxYDraw,
//		infoPanelWidth / sprWidth,
//		infoPanelHeight / sprHeight,
//		image_angle,
//		image_blend,
//		image_alpha
//	)
	
//	draw_set_color(c_white)
//	drawTextLine(equipment.name, infoBoxYDraw)
	
//	draw_set_color(get_rarity_color(equipment.rarity))
//	drawTextLine(equipment.getRarityString(), infoBoxYDraw)
	
//	draw_set_color(c_white)
//	drawTextLine(equipment.description, infoBoxYDraw)

//	draw_set_color(c_white)
	
//	//show_message(equipment)
	
//	drawLine += 2
//	draw_stats_block(
//		x + xOffset + padding,
//		infoBoxYDraw + getYOffset(),
//		equipment.stats,
//		equipment.level, lineSpacing)
//}
