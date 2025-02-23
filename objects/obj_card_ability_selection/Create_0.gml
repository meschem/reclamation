
// Inherit the parent event
event_inherited()

// large button setup

width = 148
height = 266
paddingX = 8
paddingY = 20
statSpacing = 14
maxTextWidth = width - (paddingX * 2)
owner = get_first_player()

generalFont = font_dogica_s

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	ability.levelUp()

	close_ability_selection_menu()
}