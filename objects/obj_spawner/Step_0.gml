
if (game_is_paused())
	return 0

if (age > spawnStartFrame && age % spawnPeriod == 0) {
	for (var i = 0; i < spawnCount; i++) {
		if (spawnSelectionType == spawnBehaviors.rand) {
			spawnIndex = random(array_length(enemyTypes))
		} else {
			spawnIndex++
			
			if (spawnIndex >= array_length(enemyTypes)) {
				spawnIndex = 0
			}
		}
		
		spawn_baddie(enemyTypes[spawnIndex])
	}
	
}

age++

if (age > spawnEndFrame) {
	instance_destroy()
}
