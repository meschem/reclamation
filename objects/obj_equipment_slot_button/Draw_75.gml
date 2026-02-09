///@description infobox p0


if (equipment != noone && drawEquipmentInfo) {
	if (equipment.slot == equipmentSlots.weapon) {
		return 0
	}

	drawLine = 0
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		x + xOffset,
		infoBoxYDraw,
		infoPanelWidth / sprWidth,
		infoPanelHeight / sprHeight,
		image_angle,
		image_blend,
		image_alpha
	)
	
	draw_set_color(c_white)
	drawTextLine(equipment.name, infoBoxYDraw)
	
	draw_set_color(get_rarity_color(equipment.rarity))
	drawTextLine(equipment.getRarityString(), infoBoxYDraw)
	
	draw_set_color(c_white)
	drawTextLine(equipment.description, infoBoxYDraw)

	draw_set_color(c_white)
	
	drawLine += descriptionLines
	drawLine += draw_stats_block(
		x + xOffset + padding,
		infoBoxYDraw + getYOffset(),
		equipment.stats,
		equipment.level, lineSpacing, equipment
	)
	
	draw_set_color(c_white)
	
	if (drawWeaponInfo) {
		for (var i = 0; i < array_length(equipment.upgradesMajor); i++) {
			if (equipment.upgradesMajor[i].active) {
				drawLine++
				drawTextLine(equipment.upgradesMajor[i].name)
				drawTextLine(equipment.upgradesMajor[i].description)
			
				if (i < (array_length(equipment.upgradesMajor) - 1)) {
					drawLine++
				}
			}
		}
	}
}
