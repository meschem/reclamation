
if (hpBarDisplay = entityHpBarTypes.small && hp < hpMax) {
	draw_set_color(c_black)
	
	draw_rectangle(
		hpBarInfo.xPos - 1,
		hpBarInfo.yPos - 1,
		hpBarInfo.xPos + hpBarInfo.width + 1,
		hpBarInfo.yPos + 2,
		false
	)
	
	draw_healthbar(
		hpBarInfo.xPos, hpBarInfo.yPos,
		hpBarInfo.xPos + hpBarInfo.width, hpBarInfo.yPos + 1,
		(hp / hpMax) * 100,
		get_color(colors.dark_purple),
		get_color(colors.red),
		get_color(colors.red),
		0, true, false
	)
}
