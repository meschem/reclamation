///@description			Init

age = 0

isSetup = false

xpCurrent = 0
xpTarget = 0
xpNextLevel = 999
xpCurLevel = 0

//xpFillRatio = 0
//xpFillingRatio = 0

fillRatio = 0.1

updateRate = 4
updateCd = 0

player = noone
playerIsLeveling = false

drawStart = new vec2(228, 330)
drawWidth = 0
drawHeight = sprite_get_height(spr_ui_xp_bar_back)
drawWidthFilling = 0

drawTextLevel = ""
drawTextLevelLoc = new vec2(-99, 326)

sprBack = spr_ui_xp_bar_back
sprFill = spr_ui_xp_bar_fill
sprFilling = spr_ui_xp_bar_filling

persistent = true

setup = function(_player) {
	player = _player
	xpCurLevel = 0
	xpTarget = player.xp
	isSetup = true
}

playerIsLevelingUp = function() {
	return (instance_number(obj_ability_selection_menu) > 0)
}