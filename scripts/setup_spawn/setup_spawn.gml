///@description								Adds a spawner to the current phase
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
///@param {real} _countPerWave				Number of waves to spawn in a phase (10)
///@param {real} _totalWaves				Amount of waves (8)
///@param {real} _type						Uses enum spawnerTypes
function setup_spawn(_baddieType, _countPerWave = 10, _totalWaves = 8, _type = spawnerTypes.standard) {
	with (obj_spawner_controller) {
		if (_type == spawnerTypes.standard) {
			setupSpawn(_baddieType, _countPerWave, _totalWaves)
		} else if (_type == spawnerTypes.boss) {
			setupBossSpawn(_baddieType)
		}
	}
}
