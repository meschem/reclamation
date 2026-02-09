///@description						Gets the input type of the requested player, returns enumInputTypes
///@param {id.Instance}	_player		Instance of the player to check for
///@return {real}					enumInputTypes
function get_player_input_type(_player = noone) {
    if (_player == noone) {
        _player = get_first_player()
    }
    
	return _player.inputFocus
}
