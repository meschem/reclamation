/// @description Init

enum dungeonBiomes {
	castle,
	swamp
}

enum roomTypes {
	normal,
	horde,
	brutal,
	elite,
	boss
}

enum roomRewards {
	trinket,
	weaponUpgrade,
	abilityLevel,
	fullHeal,
}

baseDifficultyLevel = 1
biome = dungeonBiomes.castle
floorCount = 5					// Defines length of run, not the amount of rooms that exist
biomeInst = noone

floors = []						// Each floor contains a collection of rooms

///@description					Builds dungeon based off of initial parameters. Must be
///								run manually after spawning the dungeon instance
build = function () {
	biomeInst = create_biome(biome)

	for (var i = 0; i < floorCount; i++) {
		createFloor(i)
	}
	
	obj_run_controller.dungeon = id
}

///@description				Creates a dungeonFloor
///@param {real} _index
///@return {struct.dungeonFloor}
createFloor = function(_index) {
	var _room
	var _floor = new dungeonFloor()
	
	if (_index == 0) {
		// first room
		_room = createRoom(roomTypes.normal, _index)
		_floor.addRoom(_room)
		
	} else if (_index == floorCount - 1) {
		// last room
		_room = createRoom(roomTypes.boss, _index)
		_floor.addRoom(_room)
	} else {
		//_room = createRoom(roomTypes.normal, _index)
		_room = createRoom(roomTypes.normal, _index)
		_floor.addRoom(_room)
	}
	
	floors[_index] = _floor
}

///@description				Creates a dungeon room
///@param {real} _roomType
///@param {real} _tier
///@return {struct.dungeonRoom}
createRoom = function(_roomType, _tier) {
	var _room = new dungeonRoom(biomeInst.getRoomAsset(), roomRewards.trinket)
	
	_room.baseBaddie = biomeInst.getEnemyFromTier(baddieTiers.small)
	
	if (_tier > 1) {
		_room.toughBaddie = biomeInst.getEnemyFromTier(baddieTiers.medium)
	}
	
	if (_roomType == roomTypes.brutal) {
		_room.brutalBaddie = biomeInst.getEnemyFromTier(baddieTiers.large)
	} else if (_roomType == roomTypes.elite) {
		_room.eliteBaddie = biomeInst.getEnemyFromTier(baddieTiers.very_large)
	} else if (_roomType == roomTypes.boss) {
		_room.bossBaddie = biomeInst.getEnemyFromTier(baddieTiers.boss)
	}
	
	//array_push(floors[_tier], _room)
	
	return _room
}

///@description							floor for a dungeon
///@param {Array.Struct.dungeonRooms}
function dungeonFloor(_rooms = []) constructor {
	rooms = _rooms
	
	addRoom = function(_room) {
		array_push(rooms, _room)
	}
}

function dungeonRoom(_roomId, _reward, _spawnScript = -1) constructor {
	roomId = _roomId
	reward = _reward
	
	phases = 1
	
	baseBaddie = obj_none
	toughBaddie = obj_none
	brutalBaddie = obj_none
	eliteBaddie = obj_none
	bossBaddie = obj_none
	
	///@description						Sets up spawns for a room
	function setupSpawner() {
		if (bossBaddie != obj_none) {
			setup_spawn(bossBaddie, 1, 1)
		}
		
		for (var i = 0; i < phases; i++) {
			if (baseBaddie != obj_none) {
				setup_spawn(baseBaddie)
			}
			
			if (toughBaddie != obj_none) {
				setup_spawn(toughBaddie, 2)
			}
			
			if (brutalBaddie != obj_none) {
				setup_spawn(brutalBaddie, 1, 4)
			}
			
			if (eliteBaddie != obj_none) {
				setup_spawn(eliteBaddie, 1, 1)
			}
			
			obj_spawner_controller.phase++
		}
	}
}

getRandomRoom = function(_floor) {
	var rooms = floors(_floor)
}
