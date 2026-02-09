#macro spawnCpw 10
#macro spawnWvs 8

///@description								Adds a spawner to the current phase
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
///@param {real} _countPerWave				Number of waves to spawn in a phase (10)
///@param {real} _totalWaves				Amount of waves (8)
///@param {real} _type						Uses enum spawnerTypes
function setup_spawn(_baddieType, _countPerWave = spawnCpw, _totalWaves = spawnWvs, _type = spawnerTypes.standard) {
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

///@description								Simple spawn alias for a single enemy
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
function setup_spawn_unique(_baddieType) {
	with (obj_spawner_controller) {
		setupSingleSpawn(_baddieType)
	}
}

///@description								Use scalars instead of numbers for spawn
///@param {asset.GMObject} _baddieType		Type of enemy to spawn
///@param {real} _countPerWaveMult			Scalar for default count per wave
///@param {real} _totalWavesMult			Scalar for default total waves
///@param {real} _type						Uses enum spawnerTypes
function setup_spawn_x(_baddieType, _countPerWaveMult = 1, _totalWavesMult = 1, _type = spawnerTypes.standard) {
	setup_spawn(_baddieType, spawnCpw * _countPerWaveMult, spawnWvs * _totalWavesMult, _type)
}

