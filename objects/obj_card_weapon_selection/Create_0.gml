
// Inherit the parent event
event_inherited()

titleText.location.y = 17
bodyText.location.y = 37

weapon = noone

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
	
	_player.addWeapon(weapon.object_index)

	close_ability_selection_menu()
}
