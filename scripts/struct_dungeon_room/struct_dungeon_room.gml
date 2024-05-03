function struct_dungeon_room() {}

#macro spawnSizeHorde 40
#macro spawnSizeBase 10
#macro spawnSizeTough 4
#macro spawnSizeBrutal 2

#macro spawnWavesBrutal 4

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
		var _countScalar = (roomType == roomTypes.horde) ? 0.25 : 1
		var _wavesScalar = 1 / _countScalar
		
		if (bossSpawn.active) {
			setup_spawn(bossSpawn.baddie, 1, 1, spawnerTypes.boss)
		}
		
		for (var i = 0; i < phases; i++) {
			if (baseSpawn.active) {				
				setup_spawn(
					baseSpawn.baddie,
					baseSpawn.spawnCountMultiplier * spawnSizeBase * _countScalar,
					_wavesScalar * 8
				)
			}
			
			if (toughSpawn.active) {
				setup_spawn(
					toughSpawn.baddie,
					toughSpawn.spawnCountMultiplier * spawnSizeTough * _countScalar,
					_wavesScalar * 8				
				)
			}
			
			if (brutalSpawn.active) {
				setup_spawn(
					brutalSpawn.baddie,
					brutalSpawn.spawnCountMultiplier * spawnSizeBrutal * _countScalar,
					_wavesScalar * spawnWavesBrutal
				)
			}
			
			if (eliteSpawn.active) {
				setup_spawn(eliteSpawn.baddie, eliteSpawn.spawnCountMultiplier, 1)
			}
			
			obj_spawner_controller.phase++
		}
	}
}