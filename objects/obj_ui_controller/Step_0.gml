var ratio, nextLevel

with (obj_game_controller) {
	nextLevel = playerXpLevelTable[playerLevel - 1]
	ratio = playerXp / nextLevel
}

xpRatio = ratio
