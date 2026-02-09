
// Inherit the parent event
event_inherited()

titleText.location.y = 17
bodyText.location.y = 37

trinket = noone

width = 140
height = 200
paddingX = 8
paddingY = 20
statSpacing = 14
maxTextWidth = width - (paddingX * 2)

displayLevel = 1

titleText.maxWidth = width - (2 * paddingX)
bodyText.maxWidth = width - (2 * paddingX)

generalFont = font_dogica_s

ability = noone

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	ability.levelUp()
	
	close_ability_selection_menu()
}
