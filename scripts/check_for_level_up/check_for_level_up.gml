///@description Tries to level a player up if valid. Returns true if it does.

function check_for_level_up() {
	var leveled = false

	with (obj_game_controller) {
		if (playerXp >= playerXpLevelTable[playerLevel - 1]) {
			playerXp -= playerXpLevelTable[playerLevel - 1]
			playerLevel++			
			leveled = true
		}
		
		//show_debug_message("xp: " + string(playerXp))
	}	
	
	if (leveled)
		display_level_up_prompt()
	
	return leveled
}