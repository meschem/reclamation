///@description								Adds a spawner to the current phase
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
///@param {real} _countPerWave				Number of waves to spawn in a phase (10)
///@param {real} _totalWaves				Amount of waves (8)
///@param {real} _type						Uses enum spawnerTypes
function setup_spawn(_baddieType, _countPerWave = 10, _totalWaves = 8, _type = spawnerTypes.standard) {
	with (obj_spawner_controller) {
		switch (_type) {
			case spawnerTypes.standard:
			case spawnerTypes.horde:
				setupSpawn(_baddieType, _countPerWave, _totalWaves)
			break
			
			case spawnerTypes.boss:
				setupBossSpawn(_baddieType)
			break
			
			case spawnerTypes.flybyLinear:
			case spawnerTypes.flybyCharge:
				setupFlybySpawn(_baddieType, _type, _countPerWave, _totalWaves)
			break
			
			case spawnerTypes.flybyChargeCluster:
				setupFlybySpawn(_baddieType, _type, _countPerWave * 2, _totalWaves / 2)
			break
			
			case spawnerTypes.elite:
				setupEliteSpawn(_baddieType)
			break
			
			default:
				create_toaster("Bad spawnerTypes enum set", errorLevels.error)
				setupSpawn(_baddieType, _countPerWave, _totalWaves)
			break
		}

	}
}
