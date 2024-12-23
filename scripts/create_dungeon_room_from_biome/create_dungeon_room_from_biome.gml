///@description									Creates a room for the biome
///@param {id.Instance} _biome					Biome instance to reference
///@param {real|array<Real>} _room				Room to use
///@param {real} _difficulty					Difficulty level
///@param {struct.biomeSpawnList} _spawns		Spawns to reference for use
///@param {real} _phaseCount
function create_dungeon_room_from_biome(_biome, _roomSizes, _difficulty, _spawns, _phaseCount = 1) {
	var _roomAsset = get_room_from_biome(_biome, _roomSizes)
	var _dungeonRoom = new dungeonRoom(_roomAsset, _difficulty, _phaseCount)
	
	//if (_sizes[0] == roomSizes.shop) {
	//	_room.roomType = roomTypes.shop
	//}

	if (variable_struct_exists(_spawns, "base")) {
		_dungeonRoom.baseSpawn = _spawns.base
	}
	if (variable_struct_exists(_spawns, "tough")) {
		_dungeonRoom.toughSpawn = _spawns.tough
	}
	if (variable_struct_exists(_spawns, "brutal")) {
		_dungeonRoom.brutalSpawn = _spawns.brutal
	}
	if (variable_struct_exists(_spawns, "elite")) {
		_dungeonRoom.eliteSpawn = _spawns.elite
	}
	if (variable_struct_exists(_spawns, "boss")) {
		_dungeonRoom.bossSpawn = _spawns.boss
	}

	return _dungeonRoom
}
