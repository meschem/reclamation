
// Inherit the parent event
event_inherited()

titleText.location.y = 17/*
bodyText.location.y = 37*/

trinket = noone
iconOverlay = spr_none

width = 140
height = 184
paddingX = 12
paddingY = 20
marginY = 19
statSpacing = 14
maxTextWidth = width - (paddingX * 2)

displayLevel = 1

titleBackground = spr_ui_title_backdrop_lg
titleBackgroundDrawY = 16

titleText.color = c_white
titleText.maxWidth = 88
titleText.font = font_alagard
titleText.location.x = 14
titleText.location.y = 18

subTitleText.color = c_white
subTitleText.maxWidth = 88
subTitleText.location.x = 12
subTitleText.location.y = 32

bodyText.color = c_white
bodyText.maxWidth = 88
bodyText.location.x = 12
bodyText.location.y = 44

titleText.maxWidth = width - (2 * paddingX)
bodyText.maxWidth = width - (2 * paddingX)

generalFont = font_dogica_s

upgrade = noone

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	upgrade.enable()
	
	close_ability_selection_menu()
}
