///@description   Description
function spawn_players() {
	var spawnPoint = new vec2(
		obj_player_spawn.x,
		obj_player_spawn.y
	)
	
	var offset = new vec2(0, 0)
	
	with (obj_player_controller) {
		var _inst = instance_create_depth(
			spawnPoint.x + offset.x,
			spawnPoint.y + offset.y,
			depths.player,
			unlockedCharacters[activeCharacterIndex]
		)
		
		offset.x += 30
		
		add_player_target(_inst)
	}
}
