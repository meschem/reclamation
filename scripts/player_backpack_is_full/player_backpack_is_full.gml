// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_backpack_is_full(_player = noone) {
	if (_player == noone) {
		_player = get_first_player()
	}
	
	return _player.backpack.isFull
}