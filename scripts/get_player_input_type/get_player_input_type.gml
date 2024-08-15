///@description						Gets the input type of the requested player
///@param {id.Instance}	_player		Instance of the player to check for
///@return {real}					enumInputTypes
function get_player_input_type(_player) {
	return _player.inputFocus
}
