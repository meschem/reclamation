/// @description Init

enum dungeonBiomes {
	castle,
	swamp
}

enum roomTypes {
	intro,			// easy rooms
	normal,			// standard room
	heavy,			// only spawns tough and above
	horde,			// spawns a lot of base and/or pest enemies, HARD room
	brutal,			// includes brutal enemies, HARD room
	elite,			// includes an elite enemy
	boss,			// boss room
	custom,			// custom room, pre-defined
}

enum roomRewards {
	trinket,
	weaponUpgrade,
	abilityLevel,
	fullHeal,
}

//#macro spawnSizeHorde 40
//#macro spawnSizeBase 10
//#macro spawnSizeTough 4
//#macro spawnSizeBrutal 2

//#macro spawnWavesBrutal 4

dungeonRoomObj = obj_dungeon_room

baseDifficultyLevel = 1

biome = dungeonBiomes.castle
floorCount = 5					// Defines length of run, not the amount of rooms that exist
biomeInst = noone

drawDungeonInfo = true
drawDungeonText = []

floors = []						// Each floor contains a collection of rooms

///@description					Builds dungeon based off of initial parameters. Must be
///								run manually after spawning the dungeon instance
build = function () {
	biomeInst = create_biome(biome)

	for (var i = 0; i < floorCount; i++) {
		createFloor(i, baseDifficultyLevel + i)
	}
	
	obj_run_controller.dungeon = id
}

///@description				Creates a dungeonFloor, which sets up individual rooms
///@param {real} _index
///@param {real} _difficulty
///@return {struct.dungeonFloor}
createFloor = function(_index, _difficulty = 1) {
	var _room
	var _floor = new dungeonFloor()
	
	if (_index == 0) {
		// IF FIRST FLOOR:
		
		_room = createRoom(roomTypes.normal, _difficulty)
		_floor.addRoom(_room)
	} else if (_index == floorCount - 1) {
		// IF LAST FLOOR:
		
		_room = createRoom(roomTypes.boss, _difficulty)
		_floor.addRoom(_room)
	} else {
		// OTHERWISE, CREATE :
		
		var _roomCount = 2 + irandom(1)
		
		for (var i = 0; i < _roomCount; i++) {
			if (i == 0) {
				// ONE ROOM IS ALWAYS NORMAL:
				
				_room = createRoom(roomTypes.normal, _difficulty)
				_floor.addRoom(_room)
			} else {
				// OTHER(S) CAN BE SPECIAL:
				var _type = getRandomRoomType()
				
				_room = createRoom(_type, _difficulty)
				_floor.addRoom(_room)
			}
		}
	}	
	
	//show_message(["Floor Info", _index, array_length(_floor.rooms)])
	
	floors[_index] = _floor
}

///@description				Creates a dungeon room
///@param {real} _roomType
///@param {real} _difficulty
///@return {struct.dungeonRoom}
createRoom = function(_roomType, _difficulty) {
	var _room = new dungeonRoom(biomeInst.getRoomAsset())

	_room.roomType = _roomType
	_room.reward = getRandomRoomReward()
	
	if (_roomType == roomTypes.horde) {
		_room.baseSpawn = biomeInst.getSpawnFromTier(baddieTiers.pest, _difficulty)
		
		if (_difficulty > 1) {
			_room.toughSpawn = biomeInst.getSpawnFromTier(baddieTiers.small, _difficulty)
		}
	} else if (_roomType == roomTypes.heavy) { 
		_room.toughSpawn = biomeInst.getSpawnFromTier(baddieTiers.medium, _difficulty)
		_room.toughSpawn.spawnCountMultiplier *= 2 
	} else {
		_room.baseSpawn = biomeInst.getSpawnFromTier(baddieTiers.small, _difficulty)
	
		if (_difficulty > 1) {
			_room.toughSpawn = biomeInst.getSpawnFromTier(baddieTiers.medium, _difficulty)
		}
	}
	
	// THESE ROOM TYPES ADD ON TO A NORMAL SPAWN SETUP
	if (_roomType == roomTypes.brutal) {
		_room.brutalSpawn = biomeInst.getSpawnFromTier(baddieTiers.large, _difficulty)
	} else if (_roomType == roomTypes.elite) {
		_room.eliteSpawn = biomeInst.getSpawnFromTier(baddieTiers.very_large, _difficulty)
	} else if (_roomType == roomTypes.boss) {
		_room.bossSpawn = biomeInst.getSpawnFromTier(baddieTiers.boss, _difficulty)
	}
	
	
	//array_push(floors[_tier], _room)
	
	return _room
}

///@description					floor for a dungeon
///@param {Array.Struct.dungeonRooms}
function dungeonFloor(_rooms = []) constructor {
	rooms = _rooms
	
	addRoom = function(_room) {
		array_push(rooms, _room)
	}
}

///@description					Gets a random room type based on factors, currently true random
///@return {real}
getRandomRoomType = function() {
	var _types = [
		roomTypes.normal,
		roomTypes.heavy,
		roomTypes.horde,
		roomTypes.elite,
		roomTypes.brutal,
	]
	
	return array_random(_types)
}

///@description					Gets a random reward type
///@return {real}
getRandomRoomReward = function() {
	var _reward = [
		roomRewards.trinket,
		roomRewards.trinket,
		roomRewards.trinket,
		roomRewards.trinket,
		roomRewards.trinket,
		
		roomRewards.abilityLevel,
		roomRewards.abilityLevel,
		
		roomRewards.fullHeal,
		roomRewards.fullHeal,
		roomRewards.fullHeal,
		
		roomRewards.weaponUpgrade,
	]
	
	return array_random(_reward)
}
