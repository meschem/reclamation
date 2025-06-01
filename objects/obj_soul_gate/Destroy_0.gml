var _self = id

with (spawnBaddie) {
	if (spawnedBy == _self) {
		provideKillRewards = false
		instance_destroy()
	}
}
