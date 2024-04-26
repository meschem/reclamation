/// @description Manages obj_spawner objects

//enum spawnTypes {
//	waves,
//	unique,
//	boss
//}

enum spawnerTypes {
	standard,
	boss
}

phase = 0
secondsPerPhase = 30

phaseFrames = seconds_to_frames(secondsPerPhase)

debugDrawLoc = new vec2(
	8,
	camera_get_view_height(view_camera[0]) - 40
)

spawnCountScalar = 1 // just used for debugging output

///@description							Sets up a phase of spawners
///@param {array} spawners				Uses an array using setupSpawn()
addPhase = function(spawners) {
	if (is_struct(spawners[0])) {
		for (var i = 0; i < array_length(spawners); i++) {
			
		}
	}

	phase++
}

///@description							Sets up a spawner for an Elite enemy
///@param {asset.GMObject} enemyType	Type of enemy to spawn
setupBossSpawn = function(enemyType) {
	var inst = setup_spawner(enemyType, phase)

	inst.spawnCount = 1
	inst.singleSpawn = true
	inst.bossSpawn = true
}

///@description							Sets up a spawner for an Elite enemy
///@param {asset.GMObject} enemyType	Type of enemy to spawn
setupEliteSpawn = function(enemyType) {
	var inst = setup_spawner(enemyType, phase)

	inst.spawnCount = 1
	inst.singleSpawn = true
	inst.eliteSpawn = true
}

///@description							Sets up a spawner for an single basic enemy
///@param {asset.GMObject} enemyType	Type of enemy to spawn
setupSingleSpawn = function(enemyType) {
	var inst = setup_spawner(enemyType, phase)

	inst.spawnCount = 1
	inst.singleSpawn = true
}

///@description							Sets up a normal spawner
///@param {asset.GMObject} enemyType	Type of enemy to spawn
///@param {real} enemiesPerWave			Number of waves to spawn in a phase (10)
///@param {real} waveCount				Amount of waves (8)
///@param {real} type					Uses enum spawnTypes() (spawnTypes.waves)
///@return {id.Instance}
setupSpawn = function(enemyType, enemiesPerWave = 10, waveCount = 8) {
	var inst = setup_spawner(
		enemyType,
		phase,
		enemiesPerWave,
		floor(phaseFrames / waveCount)
	)
	
	return inst
}

///@description							Sets up a flyby spawner
///@param {asset.GMObject} enemyType	Type of enemy to spawn
///@param {bool} targetPlayer			If true, flies to player, otherwise flies laterally (true)
///@param {real} enemiesPerWave			Number of waves to spawn in a phase (10)
///@param {real} waveCount				Amount of waves (8)
///@return {id.Instance}
setupFlybySpawn = function(enemyType, targetPlayer = true, enemiesPerWave = 10, waveCount = 8) {
	var inst = setup_spawner(
		enemyType,
		phase,
		enemiesPerWave,
		floor(phaseFrames / waveCount)
	)
	
	// !!!add flags to inst!!!
	array_push(inst.spawnFlags, enumSpawnFlags.noTarget)
	
	if (targetPlayer) {
		array_push(inst.spawnFlags, enumSpawnFlags.chargeTarget)
	} else {
		array_push(inst.spawnFlags, enumSpawnFlags.chargeOpposite)
	}	
	
	return inst
}
