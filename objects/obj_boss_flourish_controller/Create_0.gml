age = 0
ageMax = stf(4.5)

bossName = "Skeleton Boss"
bossTitle = "Bad to the bone bad guy"
bossSprite = spr_hydra
bossSpriteScale = 230 / sprite_get_height(bossSprite)

drawBossText = false

bannerBorderColor = get_color(colors.dark)
bannerColor = get_color(colors.red)

bossSpritePosition = new vec2(-999, -999)

bannerHeight = 135
bannerBorderWidth = 5
bannerPadding = 21

bannerWidth = 0

bannerDrawInfo = {
	x1: -999,
	y1: -999,
	x2: -999,
	y2: -999	
}

textPaddingLeft = 16
textPaddingTop = 12

titleOffset = 34

set_ui_profile_type(uiProfileTypes.minimal)

set_game_pause_state(true)
disable_pause_menu()
