/// @description Manages obj_spawner objects

//enum spawnTypes {
//	waves,
//	unique,
//	boss
//}

enum spawnerTypes {
	standard,
	flybyLinear,
	flybyCharge,
	flybyChargeCluster,
	horde,
	elite,
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
	
	return inst
}

///@description							Sets up a spawner for an Elite enemy
///@param {asset.GMObject} enemyType	Type of enemy to spawn
setupEliteSpawn = function(enemyType) {
	var inst = setup_spawner(enemyType, phase)

	inst.spawnCount = 1
	inst.singleSpawn = true
	inst.eliteSpawn = true
	
	return inst
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
///@param {bool} spawnType				Type of spawn
///@param {real} enemiesPerWave			Number of waves to spawn in a phase (10)
///@param {real} waveCount				Amount of waves (8)
///@return {id.Instance}
setupFlybySpawn = function(enemyType, spawnType = spawnerTypes.flybyLinear, enemiesPerWave = 10, waveCount = 8) {
	var inst = setup_spawner(
		enemyType,
		phase,
		enemiesPerWave,
		max(1, floor(phaseFrames / waveCount))
	)
	
	inst.spawnType = spawnType
	
	return inst
}
