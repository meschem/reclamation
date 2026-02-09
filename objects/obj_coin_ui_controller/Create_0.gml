
age = 0

player = noone
setup = false

goldCurrent = 0
goldTarget = 0
goldAddPercent = 0.1
goldAddMin = 1
goldSprite = spr_ui_gold_icon
goldSpriteFlash = spr_ui_gold_icon_flash

drawFont = font_alagard
drawStart = new vec2(18, 18)
drawTextOffset = new vec2(14, -7)

drawFrameOffset = new vec2()

persistent = true

setup = function(_player) {
	player = _player
	goldCurrent = _player.gold
	
	x = drawStart.x
	y = drawStart.y
	sprite_index = goldSprite
	
	setup = true
}

flash = function() {
	sprite_index = goldSpriteFlash
}