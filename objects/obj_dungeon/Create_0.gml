/// @description Init

enum dungeonBiomes {
	castle,
	swamp
}

enum roomTypes {
	// combat
	intro,			// easy rooms
	normal,			// standard room
	heavy,			// only spawns tough and above
	horde,			// spawns a lot of base and/or pest enemies, HARD room
	brutal,			// includes brutal enemies, HARD room
	elite,			// includes an elite enemy
	boss,			// boss room
	custom,			// custom room, pre-defined
	
	// non-combat
	shop,			// buy equipment with gold
}

enum roomRewards {
	trinket,
	trinketRare,
	weaponUpgrade,
	abilityLevel,
	fullHeal,
	gold,
	shop,
	metaMoney,
	none
}

//#macro spawnSizeHorde 40
//#macro spawnSizeBase 10
//#macro spawnSizeTough 4
//#macro spawnSizeBrutal 2

//#macro spawnWavesBrutal 4

dungeonRoomObj = obj_dungeon_room

baseDifficulty = 1
difficultyIncrement = 1
difficultyArray = []			// Used if filled out

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
	
	if (array_length(biomeInst.floorStructure) > 0) {
		for (var i = 0; i < array_length(biomeInst.floorStructure); i++) {
			createFloorFromConfig(i, i + 1)
		}
	} else {
		// NOT REALLY USED ATM...
		for (var i = 0; i < floorCount; i++) {
			//createFloor(i, baseDifficulty + (i * difficultyIncrement))
			createFloor(i, i + 1)
		}
	}
	
	obj_run_controller.dungeon = id
}

///@description						Creates a dungeonFloor, which sets up individual rooms
///@param {real} _index				Index of the floor
///@param {real} _difficulty		Difficulty of the floor
createFloorFromConfig = function(_index, _difficulty) {
	var _room, _configs, _type, _reward, _phaseCount
	var _floor = new dungeonFloor()

	_configs = obj_dungeon_biome.floorStructure[_index].roomConfigs
	
	for (var i = 0; i < array_length(_configs); i++) {
		_type = array_random(_configs[i].types)
		_reward = array_random(_configs[i].rewards)
		_phaseCount = _configs[i].phaseCount
		
		_room = createRoom(_type, _difficulty, _reward, _phaseCount)
		_floor.addRoom(_room)
	}
	
	floors[_index] = _floor
}

///@description				Creates a dungeonFloor, which sets up individual rooms
///@param {real} _index
///@param {real} _difficulty
///@return {struct.dungeonFloor}
createFloor = function(_index, _difficulty = 1) {
	var _room
	var _floor = new dungeonFloor()
	
	show_message("making floor")
	
	if (_index == 0) {
		// IF FIRST FLOOR:
		
		_room = createRoom(roomTypes.intro, _difficulty)
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

///@description						Creates a dungeon room
///@param {real} _roomType			Type of room, uses enum roomTypes
///@param {real} _difficulty		Difficulty number to use
///@param {real} _reward			Uses enum roomRewards
///@param {real} _phaseCount		Number of phases
///@return {struct.dungeonRoom}
createRoom = function(_roomType, _difficulty, _reward = roomRewards.trinket, _phaseCount = 4) {
	/*
		1. Get a random spawn for each potential baddie slot (pest -> veryLarge / boss)
		2. Calls the biome instance "createRoom" function to get a room
		3. Returns that room to the "createFloor" function
	*/
	var _spawns = {
		pest: biomeInst.getSpawnFromTier(baddieTiers.pest, _difficulty),
		small: biomeInst.getSpawnFromTier(baddieTiers.small, _difficulty),
		medium: biomeInst.getSpawnFromTier(baddieTiers.medium, _difficulty),
		large: biomeInst.getSpawnFromTier(baddieTiers.large, _difficulty),
		veryLarge: biomeInst.getSpawnFromTier(baddieTiers.veryLarge, _difficulty),
		boss: biomeInst.getSpawnFromTier(baddieTiers.boss, _difficulty),
		elite: biomeInst.getEliteSpawn(_difficulty)
	}
	
	var _room
	
	switch (_roomType) {
		case roomTypes.intro:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				roomSizes.small,
				_difficulty,
				{
					base: _spawns.small
				},
				_phaseCount
			)
		break
		
		case roomTypes.normal:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.medium,
					roomSizes.large
				],
				_difficulty,
				{
					base: _spawns.small,
					tough: _spawns.medium,
				},
				_phaseCount
			)			
		break
		
		case roomTypes.horde:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.large,
					roomSizes.veryLarge,
					roomSizes.massive
				],
				_difficulty, 
				{
					base: _spawns.pest,
					tough: _spawns.medium,
				},
				_phaseCount
			)			
		break
		
		case roomTypes.heavy:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.medium,
					roomSizes.large
				],
				_difficulty,
				{
					base: _spawns.medium,
					tough: _spawns.large
				},
				_phaseCount
			)
			
			_room.baseSpawn.spawnCountMultiplier *= 0.2
			//_room.toughSpawn.spawnCountMultiplier *= 0.3
		break
		
		case roomTypes.brutal:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.medium,
					roomSizes.large,
					roomSizes.veryLarge,
				],
				_difficulty,
				{
					base: _spawns.small,
					tough: _spawns.medium,
					brutal: _spawns.veryLarge,
				},
				_phaseCount
			)
		break
		
		case roomTypes.elite:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.medium,
					roomSizes.large,
					roomSizes.veryLarge,
				],
				_difficulty,
				{
					base: _spawns.small,
					tough: _spawns.medium,
					elite: _spawns.elite,
				},
				_phaseCount
			)
			
			_room.baseSpawn.spawnCountMultiplier *= 0.5
			_room.toughSpawn.spawnCountMultiplier *= 0.3
		break
		
		case roomTypes.boss:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.large,
					roomSizes.veryLarge,
				],
				_difficulty,
				{
					base: _spawns.small,
					tough: _spawns.medium,
					boss: _spawns.boss,
				},
				_phaseCount
			)
		break
		
		case roomTypes.shop:
			_room = create_dungeon_room_from_biome(
				biomeInst,
				[
					roomSizes.shop
				],
				_difficulty,
				{}
			)
			
			_room.roomType = roomTypes.shop
		break
		
		default:
			var _typeStr = get_room_name_from_type(_roomType)
			
			show_message("Room type not setup in obj_dungeon Create() function: " + _typeStr)
		break
	}
	
	_room.reward = _reward
	_room.roomType = _roomType
	
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

