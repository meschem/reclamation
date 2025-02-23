
if (game_is_paused()) {
	return 0
}

store_main_room_stats()
store_baddies()

room_goto(loadRoom)
