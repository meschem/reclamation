///@description                     Gets the player's XP percentage to the next level. Returns between 0 and 1.
///@param {id.Instance} _player     Player to check
///@return {real}
function get_xp_percentage(_player = noone) {
    if (_player == noone) {
		_player = get_first_player()
	}
    
    var _pct = _player.xp / obj_game_controller.playerXpLevelTable[_player.level - 1]

    return clamp(_pct, 0, 1)
}
