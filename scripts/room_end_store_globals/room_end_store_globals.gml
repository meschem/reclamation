///@description				Store all the globals in a room
function room_end_store_globals() {
	show_debug_message("Storing globals")
	global.playerHp = obj_player.hp
	global.playerMaxHp = obj_player.maxHp
	
	global.playerTotalGold = obj_game_controller.playerTotalGold
	global.playerGold = obj_game_controller.playerGold
	global.playerXp = obj_game_controller.playerXp
	global.playerLevel = obj_game_controller.playerLevel
	global.talents = obj_game_controller.talents

	store_ability_trees()
}