
if (game_is_paused())
	return 0
	
if (age > spawnStartFrame && age % spawnPeriod == 0) {
	var spawns, i, j

	for (i = 0; i < spawnCount; i++) {
		
		switch (spawnSelectionType) {
			case spawnBehaviors.rand:
				spawnIndex = random(array_length(enemyTypes))
			break
			
			case spawnBehaviors.swarm:
				
			break
			
			default:
				spawnIndex++
			
				if (spawnIndex >= array_length(enemyTypes)) {
					spawnIndex = 0
				}
			break
		}
		
		spawns = spawn_baddie(enemyTypes[spawnIndex])
		
		if (array_contains(spawnFlags, enumSpawnFlags.noTarget)) {
			for (j = 0; j < array_length(spawns); j++) {
				spawns[j].target = obj_none
			}
		}
		
		if (array_contains(spawnFlags, enumSpawnFlags.chargeOpposite)) {
			var facingAngle = 0

			if (array_length(spawns) > 0) {
				switch (spawns[0].spawnSide) {
					case "left":
						facingAngle = 0
					break
					
					case "right":
						facingAngle = 180
					break
					
					case "top":
						facingAngle = 270
					break
					
					case "bottom":
						facingAngle = 90
					break
					
					default:
						show_error($"Bad spawnSide set on spawn: {spawns[0].spawnSide}", true)
					break
				}
			}
			
			for (j = 0; j < array_length(spawns); j++) {
				spawns[j].facingAngle = facingAngle
			}
		}
		
		if (eliteSpawn) {
			for (j = 0; j < array_length(spawns); j++) {
				enhance_baddie(baddieSpecialTypes.elite, spawns[j])
			}
		}
		
		if (bossSpawn) {
			for (j = 0; j < array_length(spawns); j++) {
				enhance_baddie(baddieSpecialTypes.boss, spawns[j])
			}
		}
		
		if (singleSpawn) {
			instance_destroy()
		}
	}
}

age++

if (age > spawnEndFrame) {
	instance_destroy()
}
