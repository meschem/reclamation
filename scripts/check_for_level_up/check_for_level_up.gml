///@description Tries to level a player up if valid. Returns true if it does.
///@param {id.Instance} player

function check_for_level_up(player = noone) {
	if (player == noone) {
		player = get_player_target()
	}
	
	var leveled = false

	with (player) {
		if (xp >= obj_game_controller.playerXpLevelTable[level - 1]) {
			xp -= obj_game_controller.playerXpLevelTable[level - 1]
			level++			
			leveled = true
		}
	}	
	
	if (leveled) {
		display_level_up_prompt(player)
	}
	
	return leveled
}