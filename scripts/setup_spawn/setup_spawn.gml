///@description								Adds a spawner to the current phase
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
///@param {real} _countPerWave				Number of waves to spawn in a phase (10)
///@param {real} _totalWaves				Amount of waves (8)
function setup_spawn(_baddieType, _countPerWave = 10, _totalWaves = 8) {
	with (obj_spawner_controller) {
		setupSpawn(_baddieType, _countPerWave, _totalWaves)
	}
}
