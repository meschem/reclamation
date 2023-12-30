
// Inherit the parent event
event_inherited()

titleText.location.y = 17
//subTitleText.location.y = 
bodyText.location.y = 37
trinket = noone
height = sprite_height
width = sprite_width
statSpacing = 10
paddingX = 6
paddingY = 20

onClick = function () {
	//FIXME Multiplayer: Assumes single player. Selection window needs owner.
	var _player = get_player_target()
	var _playerTrinket = get_player_trinket(trinket.object_index, _player)
	
	if (_playerTrinket == noone) {
		trinket.create()
	} else {
		_playerTrinket.levelUp()
	}
	
	close_ability_selection_menu()
}
