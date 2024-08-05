function struct_dungeon_room() {}

#macro spawnSizeHorde 80
#macro spawnSizeBase 12
#macro spawnSizeTough 2
#macro spawnSizeBrutal 1

#macro spawnWavesHorde 4
#macro spawnWavesBase 8
#macro spawnWavesTough 6
#macro spawnWavesBrutal 4

// HORDE COUNT DEFAULT: 320
// BASE COUNT DEFAULT:  96
// TOUGH COUNT DEFAULT: 12
// BRUTAL COUNT DEFALUT: 4

///@description							Dungeon room is built based off list of tiered enemies
///										and the type of room. 
///										The enemies are set after the room is created
///@description							Room in a dungeon
///@param {asset.GMRoom} _roomId		Room to use
///@param {real} _difficulty			Level of difficulty for the room (1)
///@param {real} _phases				Number of phases (1)
///@param {real} _spawnScript			Script to use instead of procedural spawn setup (-1)
function dungeonRoom(_roomId, _difficulty = 1, _phases = 1, _spawnScript = -1) constructor {
	roomId = _roomId
	
	difficulty = _difficulty
	
	phases = _phases
	roomType = roomTypes.normal
	reward = roomRewards.trinket
	
	// structs here are { active: <bool>, baddie: <obj_baddie> }
	baseSpawn = {active: false}
	toughSpawn = {active: false}
	brutalSpawn = {active: false} 
	eliteSpawn = {active: false}
	bossSpawn = {active: false}

	///@description						Sets up spawns for a room
	function setupSpawner() {
		if (bossSpawn.active) {
			setup_spawn(bossSpawn.baddie, 1, 1, spawnerTypes.boss)
		}
		
		if (eliteSpawn.active) {
			setup_spawn(
				eliteSpawn.baddie,
				1, //eliteSpawn.spawnCountMultiplier,
				1,
				spawnerTypes.elite
			)
		}
		
		for (var i = 0; i < phases; i++) {
			if (baseSpawn.active) {
				if (baseSpawn.spawnType == spawnerTypes.horde) {
					setup_spawn(
						baseSpawn.baddie,
						baseSpawn.spawnCountMultiplier * spawnSizeHorde,
						spawnWavesHorde,
						baseSpawn.spawnType
					)
				} else {
					setup_spawn(
						baseSpawn.baddie,
						baseSpawn.spawnCountMultiplier * spawnSizeBase,
						spawnWavesBase,
						baseSpawn.spawnType
					)
				}				
			}
			
			if (toughSpawn.active) {
				setup_spawn(
					toughSpawn.baddie,
					toughSpawn.spawnCountMultiplier * spawnSizeTough, // * _countScalar,
					spawnWavesTough, // * _wavesScalar ,
					toughSpawn.spawnType
				)
			}
			
			if (brutalSpawn.active) {
				setup_spawn(
					brutalSpawn.baddie,
					brutalSpawn.spawnCountMultiplier * spawnSizeBrutal, // * _countScalar,
					spawnWavesBrutal, // * _wavesScalar,
					brutalSpawn.spawnType
				)
			}
			
			//if (eliteSpawn.active) {
			//	setup_spawn(
			//		eliteSpawn.baddie,
			//		eliteSpawn.spawnCountMultiplier,
			//		1,
			//		spawnerTypes.elite
			//	)
			//}
			
			obj_spawner_controller.phase++
		}
	}
}