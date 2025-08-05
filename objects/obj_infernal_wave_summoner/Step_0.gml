
if (game_is_paused()) {
	return
}

age++

if (age >= lifeSpan) {
	create_toaster($"Infernal Gate Destroyed, kills: {killCount}")
	instance_destroy()
}

if (age % spawnRate == 0) {
	var _spawns = spawn_baddie(spawnBaddie, spawnCount, 4, spawnFlags)
	
	for (var i = 0; i < array_length(_spawns); i++) {
		_spawns[i].spawnedBy = id
	}
	
}
