var ratio, nextLevel

age++

with (obj_game_controller) {
	nextLevel = playerXpLevelTable[obj_player.level - 1]
	ratio = obj_player.xp / nextLevel
}

xpRatio = ratio

if (age % 15 == 0 ) {
	drawFps = fps_real
}
