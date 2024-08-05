
// Inherit the parent event
event_inherited()

titleText.location.y = 17
bodyText.location.y = 37

trinket = noone
iconOverlay = spr_none

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

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	//FIXME Multiplayer: Assumes single player. Selection window needs owner.
	var _player = obj_player // get_player_target()
	var _playerTrinket = get_player_trinket(trinket.object_index, _player)
	
	if (_playerTrinket == noone) {
		trinket.create()
	} else {
		_playerTrinket.levelUp()
	}
	
	close_ability_selection_menu()
}
