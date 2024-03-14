if (game_is_paused()) {
	return
}

if (spawnTarget != noone && instance_exists(spawnTarget)) {
	spawnPoint.x = spawnTarget.x
	spawnPoint.y = spawnTarget.y
}

age++

if (age >= lifeSpan) {
	instance_destroy()
}
