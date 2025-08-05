
x = view_width() - 15 - sprite_width
y = (view_height() / 2) - (sprite_height / 2)

backingDrawHeight = 0
fillDrawHeight = 0

skullCount = 0
skullFullCount = 0
skullSprSm = spr_curse_bar_skull_sm
skullSprMd = spr_curse_bar_skull_md
skullSprLg = spr_curse_bar_skull_md
skullBotPadding = 0
skullBotY = y + sprite_height

updateMax = function() {
	skullCount = ftm(obj_run_controller.curseAgeMax)
	
	var _drawPct = obj_run_controller.curseAgeMax / obj_run_controller.curseAgeFinal
	backingDrawHeight = _drawPct * sprite_height
}
