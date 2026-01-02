
// Inherit the parent event
event_inherited()

titleText.location.y = 17
bodyText.location.y = 37

merger = noone
iconOverlay = spr_none

titleBackground = spr_ui_title_backdrop_lg

titleText.color = c_white
titleText.maxWidth = 88
titleText.font = font_alagard
titleText.location.x = 14
titleText.location.y = 24

subTitleText.color = c_white
subTitleText.maxWidth = 88
subTitleText.location.x = 12
subTitleText.location.y = 38

bodyText.color = c_white
bodyText.maxWidth = 88
bodyText.location.x = 12
bodyText.location.y = 50

width = 140
height = 200
paddingX = 12
paddingY = 24
statSpacing = 14
maxTextWidth = width - (paddingX * 2)

displayLevel = 1

titleText.maxWidth = width - (2 * paddingX)
bodyText.maxWidth = width - (2 * paddingX)

generalFont = font_dogica_s

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	//FIXME Multiplayer: Assumes single player. Selection window needs owner.
	var _player = get_first_player()
	
	merger.owner = _player
	_player.backpack.addItem(merger)
	
	close_ability_selection_menu()
}
