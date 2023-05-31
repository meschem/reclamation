///@description				Store all the globals in a room
function room_end_store_globals() {
	global.playerHp = obj_player.hp
	global.playerMaxHp = obj_player.maxHp
	
	with (obj_game_controller) {
		global.playerTotalGold = playerTotalGold
		global.playerGold = playerGold
		global.playerXp = playerXp
		global.playerLevel = playerLevel
		global.talents = talents
		global.abilityTreeLevel = playerAbilityTreeLevel
	}

	store_ability_trees()
}