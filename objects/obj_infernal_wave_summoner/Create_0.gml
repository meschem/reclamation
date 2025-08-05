///@description			Init
//spawnScalar = get_baddie_scaling(baddieScalars.spawnCount) * 4

//obj_run_controller.enemyScalingSpawnCount += spawnScalar

//create_toaster(obj_run_controller.enemyScalingSpawnCount)

age = 0
lifeSpan = stf(30)

spawnRate = stf(6)
spawnCount = 8
spawnBaddie = obj_none

spawnFlags = [
	enumSpawnFlags.noTarget,
	enumSpawnFlags.chargeTarget,
	enumSpawnFlags.clusterSpawn
]

killCount = 0
