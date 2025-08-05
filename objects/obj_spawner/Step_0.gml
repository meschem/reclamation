
if (game_is_paused())
	return 0
	
//if (spawnType == spawnerTypes.flybyChargeCluster && !clusterSpawnProcessed) {
//	spawnPeriod /= clusterSpawnFactor
//	spawnCount *= clusterSpawnFactor
//	clusterSpawnProcessed = true
//	create_toaster("Cluster Spawn processed")
//}

age++

if (age < spawnStartFrame) {
	//if (debug) {
	//	create_toaster($"age lt sSF, ${age}, ${spawnStartFrame}")
	//}
	return 0
}

if (!endless && age > spawnEndFrame) {
	instance_destroy()
	
	return 0
}

if (spawnAge % spawnPeriod == 0) {
	var spawns, i, j
	var _spawnCount = spawnCount // * get_baddie_scaling(baddieScalars.spawnCount)
	
	active = true
	
	if (spawnType == spawnerTypes.flybyLinear) {
		array_push(spawnFlags,
			enumSpawnFlags.noTarget,
			enumSpawnFlags.chargeOpposite
		)
	} else if (spawnType == spawnerTypes.flybyCharge) {
		array_push(spawnFlags,
			enumSpawnFlags.noTarget,
			enumSpawnFlags.chargeTarget
		)
	} else if (spawnType == spawnerTypes.flybyChargeCluster) {
		array_push(spawnFlags,
			enumSpawnFlags.noTarget,
			enumSpawnFlags.chargeTarget,
			enumSpawnFlags.clusterSpawn
		)
	}
	
	if (!bossSpawn && !eliteSpawn && !singleSpawn) {
		_spawnCount *= get_baddie_scaling(baddieScalars.spawnCount)
		//	create_toaster(_spawnCount)
	}
	
	//create_toaster($"{spawnCount}, {get_baddie_scaling(baddieScalars.spawnCount)}, {_spawnCount}")
	
	if (array_contains(spawnFlags, enumSpawnFlags.clusterSpawn)) {
		spawnIndex = random(array_length(enemyTypes))
		spawns = spawn_baddie(enemyTypes[spawnIndex], _spawnCount, 2, spawnFlags)
	} else {
		for (i = 0; i < _spawnCount; i++) {
			spawnIndex = random(array_length(enemyTypes))
		
			spawns = spawn_baddie(enemyTypes[spawnIndex], 1, 20, spawnFlags)
		
			if (eliteSpawn) {
				for (j = 0; j < array_length(spawns); j++) {
					create_elite_health_bar(spawns[j])
					enhance_baddie(baddieSpecialTypes.elite, spawns[j])
					apply_random_elite_buff(spawns[j])
				}
			}
		
			if (bossSpawn) {
				for (j = 0; j < array_length(spawns); j++) {
					create_boss_health_bar(spawns[j])
					enhance_baddie(baddieSpecialTypes.boss, spawns[j])
				}
			}
		
			if (singleSpawn) {
				instance_destroy()
			}
		}
	}
}

spawnAge++
