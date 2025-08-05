if (global.initGame) {
	global.initGame = false
	
	for (var i = 0; i < global.playerCount; i++) {
		var _inst = create_instance(obj_player_controller)
		_inst.player = i
	}

	spawn_players()
}

with (obj_player) {
	add_player_target(id)
	x = obj_player_spawn.x
	y = obj_player_spawn.y
}

//with (obj_player_spawn) {
//	obj_player.x = x
//	obj_player.y = y
//}
