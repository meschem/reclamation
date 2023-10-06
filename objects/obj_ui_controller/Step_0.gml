var ratio, nextLevel

with (obj_game_controller) {
	nextLevel = playerXpLevelTable[obj_player.level - 1]
	ratio = obj_player.xp / nextLevel
}

xpRatio = ratio

