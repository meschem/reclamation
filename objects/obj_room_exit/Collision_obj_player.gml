
if (game_is_paused()) {
	return 0
}

if (get_combat_room_type() == combatRoomTypes.openArea) {
	var _spawnLocationX = 16
	var _spawnLocationY = 48
	
	with (obj_player_spawn) {
		x = _spawnLocationX
		y = _spawnLocationY
	}
}

set_map_object_to_used()
store_main_room_stats()
store_baddies()

room_goto(loadRoom)
