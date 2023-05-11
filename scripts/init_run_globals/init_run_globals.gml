///@description   Description
function init_run_globals() {
	if (!variable_global_exists("runStarted")) {
		global.runStarted = false
	}
	
	if (!global.runStarted) {
		show_debug_message("Initiating globals")

		global.runStarted = true
		
		global.playerHp = 3
		global.playerMaxHp = 3

		global.playerTotalGold = 0
		global.playerGold = 0
		global.playerXp = 0
		global.playerLevel = 1
		
		global.talents = []
		
		global.abilityTreeLevel = 1
		
		init_talents_jonah()
	} else {
		obj_game_controller.talents = global.talents
	}
}