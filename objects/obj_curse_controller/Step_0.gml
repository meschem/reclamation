
age++

if (age % spawnRate == 0) {
	spawn_baddie(obj_skeleton_cursed, floor(spawnCount))
	
	spawnCount += (0.2)
}

if (age > stf(6) && age % spawnRateWraith == 0) {
	spawn_baddie(obj_wraith_cursed, floor(spawnCount / 2))
}

if (age > stf(12) && age % spawnRateChamp == 0) {
	spawn_baddie(obj_skeleton_champion_cursed, 1)
}

if (curseLayerDraw) {
	curseBlend = min(1, age / curseBlendAgeMax)
	
	var _color = merge_color(c_white, curseBlendColorEnd, curseBlend)
	
	fx_set_parameter(
		curseFx,
		"g_TintCol",
		[
			color_get_red(_color) / 255,
			color_get_green(_color) / 255,
			color_get_blue(_color) / 255,
			1
		]
	)
}