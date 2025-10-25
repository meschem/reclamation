
if (!setup) {
	return 0
}

if (playerIsLevelingUp()) {
	drawWidth = sprite_get_width(sprFill)
}

if (game_is_paused()) {
	return 0
}

age++

xpNextLevel = obj_game_controller.playerXpLevelTable[player.level - 1]

var _fillRatio = (xpCurrent - xpCurLevel) / xpNextLevel
var _fillingRatio = (player.xp - xpCurLevel) / xpNextLevel

if (xpCurrent < player.xp) {
	var _fillLeft = player.xp - xpCurrent
	xpCurrent += max(_fillLeft * fillRatio, 1)
}

if (xpCurrent > player.xp) {
	xpCurrent = player.xp
}

drawWidth = sprite_get_width(sprFill) * _fillRatio
drawWidthFilling = sprite_get_width(sprFill) * _fillingRatio


draw_set_font(font_alagard)
drawTextLevel = string(player.level)
drawTextLevelLoc.x = (view_width() / 2) - (string_width(drawTextLevel) / 2)
