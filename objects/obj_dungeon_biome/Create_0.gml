///@description		Init

enum roomSizes {
	any,
	tiny,
	small,
	medium,
	large,
	veryLarge,
	massive,
	shop
}

enum baddieTiers {
	pest,
	small,
	medium,
	large,
	veryLarge,
	boss
}

enum spawnTiers {
	small,
	medium,
	large,
	veryLarge,
	boss
}

persistent = true

baddieList = []
eliteList = []					// array of structs with obj/min/max level
roomList = []
spawnList = []
floorStructure = []				// predefined setup for room types and rewards

///@description								Creates a room for the biome
///@param {array<Real>} _sizes				Uses enum roomSizes
///@param {real} _difficulty				Difficulty level
///@param {struct.biomeSpawnList} _spawns	Spawns to reference for use
///@param {real} _phaseCount
///@return {struct.dungeonRoom}
createRoom = function(_sizes, _difficulty, _spawns, _phaseCount = 1) {
	var _room = new dungeonRoom(getRoomAsset(_sizes), _difficulty, _phaseCount)
	
	//if (_sizes[0] == roomSizes.shop) {
	//	_room.roomType = roomTypes.shop
	//}

	if (variable_struct_exists(_spawns, "base")) {
		_room.baseSpawn = _spawns.base
	}
	if (variable_struct_exists(_spawns, "tough")) {
		_room.toughSpawn = _spawns.tough
	}
	if (variable_struct_exists(_spawns, "brutal")) {
		_room.brutalSpawn = _spawns.brutal
	}
	if (variable_struct_exists(_spawns, "elite")) {
		_room.eliteSpawn = _spawns.elite
	}
	if (variable_struct_exists(_spawns, "boss")) {
		_room.bossSpawn = _spawns.boss
	}

	return _room	
}

///@description								Gets a random room object
///@param {real | array<Real>} _sizes		Sizes to select from
///@return {asset.GMRoom}
getRoomAsset = function(_sizes = roomSizes.any) {
	var _rooms = array_shuffle(roomList)
	
	if (!is_array(_sizes)) {
		if (_sizes == roomSizes.any) {
			return _rooms[0].roomName
		}	
		
		_sizes = [_sizes]
	}
	
	for (var i = 0; i < array_length(_rooms); i++) {
		if (array_contains(_sizes, _rooms[i].size)) {
			return _rooms[i].roomName
		}
	}
	
	show_message("ERROR: ROOM SIZE NOTE FOUND IN BIOME. DEFAULTING")
	
	return _rooms[0].roomName
}

///@description							Gets a random enemy type based on tier
///@param {real} _tier					Uses enum baddieTiers to pick a tier
///										If no enemy in tier, will generate error
///@return {Asset.GMObject}
getEnemyFromTier = function (_tier) {
	var _baddies = []
	
	for (var i = 0; i < array_length(baddieList); i++) {
		if (baddieList[i].tier == _tier) {
			array_push(_baddies, baddieList[i].baddie)
		}
	}
	
	if (array_length(_baddies) == 0) {
		show_error("No baddies of type found", true)
	}
	
	_baddies = array_shuffle(_baddies)
	
	return _baddies[0]
}

///@description							Gets a spawn that's a horde
///@return {struct.biomeSpawn}	
getHordeSpawn = function() {
	var _spawns = []
	
	for (var i = 0; i < array_length(spawnList); i++ ) {
		if (baddieList[i].spawnType == spawnerTypes.horde) {
			array_push(_spawns, spawnList[i])
		}
	}
	
	if (array_length(_spawns) == 0) {
		show_error("No spawns of type found", true)
	}
	
	_spawns = array_shuffle(_spawns)
	
	return _spawns[0]
}

///@description							Spawns stuff from a tier
///@param {real} _tier					Uses enum baddieTiers to pick a tier
///@param {real} _difficulty			If no enemy in tier, will generate error
///@return {struct.biomeSpawn}				
getSpawnFromTier = function(_tier, _difficulty = -1) {
	var _spawns = []
	
	for (var i = 0; i < array_length(spawnList); i++) {
		if (spawnList[i].tier == _tier)	{
			if (spawnList[i].validateFloor(_difficulty)) {
				array_push(_spawns, spawnList[i])
			}
		}
	}
	
	if (array_length(_spawns) == 0) {
		//create_toaster("Spawn type defaulted. no valid spawn found", errorLevels.error)
		return new biomeSpawn(obj_skeleton_summoned, _tier)
	}
	
	_spawns = array_shuffle(_spawns)
	
	return _spawns[0]
}

///@description							Gets elite spawns from the biome
///@param {real} _difficulty
getEliteSpawn = function(_difficulty = -1) {
	var _spawns = []
	
	for (var i = 0; i < array_length(eliteList); i++) {
		if (
			_difficulty >= eliteList[i].minDifficulty &&
			_difficulty <= eliteList[i].maxDifficulty
		) {
			array_push(_spawns, eliteList[i])
		}
	}
	
	if (array_length(_spawns) == 0) {
		return new biomeSpawn(obj_skeleton_summoned, 1)
	}
	
	_spawns = array_shuffle(_spawns)
	
	return _spawns[0]
}

///@description							Gets a random enemy type based on tier
///@param {real} _tier					Uses enum baddieTiers to pick a tier
///										If no enemy in tier, will generate error
///@return {Asset.GMObject}
getSpawnStructFromTier = function (_tier) {
	var _baddies = []
	
	for (var i = 0; i < array_length(baddieList); i++) {
		if baddieList[i].tier == _tier
		
		array_push(_baddies, baddieList[i].baddie)
	}
	
	if (array_length(_baddies) == 0) {
		show_error("No baddies of type found", true)
	}
	
	_baddies = array_shuffle(_baddies)
	
	return _baddies[0]
}


///@description							Adds a room to the biome list
///@param {Asset.GMRoom} _roomName		Room to use
///@param {real} _size					Size of room. Uses enum roomSizes.
///@param {struct} _props				Additional properties to add.
addRoom = function(_roomName, _size, _props = {}) {
	var _struct = {}
	
	_struct.roomName = _roomName
	_struct.size = _size
	
	_struct = struct_merge(_struct, _props)
	
	array_push(roomList, _struct)
}

///@description							Adds a baddie to the biome list
///@param {Asset.GMObject} _baddie		Object to use
///@param {real} _tier					Tier. Uses enum baddieTiers.
///@param {real} _spawnCountMultiplier	Constant applied to spawn count
///@param {real} _spawnType				Uses enum spawnTypes
///@param {struct} _props				Additional properties to add.
addBaddie = function(_baddie, _tier, _spawnCountMultiplier = 1, _spawnType = spawnerTypes.standard, _props = {}) {
	var _spawn = new biomeSpawn(_baddie, _tier, _spawnCountMultiplier, _spawnType, _props)
	
	array_push(spawnList, _spawn)
}

///@description							Creates a baddie spawn from a struct
///@param {struct} _props				Struct of props
addBaddieStruct = function(_props) {
	var _spawnTier = variable_struct_exists(_props, "spawnTier") ? _props.spawnTier : baddieTiers.small
	var _spawnMultipler = variable_struct_exists(_props, "spawnCountMultiplier") ? _props.spawnCountMultiplier : 1
	var _spawnType = variable_struct_exists(_props, "spawnType") ? _props.spawnType : spawnerTypes.standard
	var _properties = variable_struct_exists(_props, "props") ? _props.props : {}
	
	if (variable_struct_exists(_props, "difficultyMin")) {
		_properties.difficultyMin = _props.difficultyMin
	}
	
	if (variable_struct_exists(_props, "difficultyMax")) {
		_properties.difficultyMax = _props.difficultyMax
	}
	
	var _spawn = new biomeSpawn(
		_props.baddie,
		_spawnTier,
		_spawnMultipler,
		_spawnType,
		_properties
	)
	
	array_push(spawnList, _spawn)
}

///@description							Creates a custom, hand-crafted room
///@param {struct} _spawnStruct			Spawn struct. Includes basic, 
///@param {real} _floorMin				Min room to use this spawn
///@param {real} _floorMax				Max room to use. Set -1 if same as min.
///@param {asset.GMRoom} _rooms			Rooms to select from, leave blank if all
addCustomRoom = function(_spawnStruct, _floorMin, _floorMax = -1,  _rooms = []) {
	
}

///@description							Collection of spawn information for a type of spawn
///@param {Asset.GMObject} _baddie		Object to use
///@param {real} _tier					Tier. Uses enum baddieTiers.
///@param {real} _spawnCountMultiplier	Constant applied to spawn count
///@param {real} _spawnType				Uses enum spawnTypes
///@param {struct} _props				Additional properties to add.
function biomeSpawn(_baddie, _tier, _spawnCountMultiplier = 1, _spawnType = spawnerTypes.standard, _props = {}) constructor {
	baddie = _baddie
	tier = _tier
	spawnCountMultiplier = _spawnCountMultiplier
	active = true
	difficultyMin = variable_struct_exists(_props, "difficultyMin") ? _props.difficultyMin : 1
	difficultyMax = variable_struct_exists(_props, "difficultyMax") ? _props.difficultyMax : 99
	spawnType = _spawnType
	props = _props
	phase = 1
	
	///@description			Checks if this can be spawned on a given floor number
	///@return {bool}
	validateFloor = function(_difficulty) {
		//show_message(["checking floor validation", props])
		// If not specified, true. FIXME: Ugly
		if (_difficulty == -1) {
			return true
		}
		
		// Default to true and check for rule breaks
		var _isValid = true
		
		if (_difficulty < difficultyMin) {
			_isValid = false
		}
		
		if (_difficulty > difficultyMax) {
			_isValid = false
		}
		
		return _isValid
	}
}

///@description								List of biome spawns that covers each type
///@param {struct.biomeSpawn} _base			Base spawn
///@param {struct.biomeSpawn} _tough		Tough spawn
///@param {struct.biomeSpawn} _brutal		Brutal spawn
///@param {struct.biomeSpawn} _elite		Elite spawn
///@param {struct.biomeSpawn} _boss			Boss spawn
function biomeSpawnList(_base, _tough, _brutal, _elite, _boss) constructor {
	base = _base
	tough = _tough
	brutal = _brutal
	elite = _elite
	boss = _boss
}

///@description										Adds an elite to be selected in elite rooms
///@param {struct<eliteListMember>}	_eliteMember	Member to add
addElite = function(_eliteMember) {
	_eliteMember.active = true
	array_push(eliteList, _eliteMember)
}


addElites = function(_eliteMembers) {
	for (var i = 0; i < array_length(_eliteMembers); i++) {
		addElite(_eliteMembers[i])
	}
}

///@description										Creates a floor with multiple room configs
///@param {array<struct.roomConfig>} _roomConfigs	Type of room uses enum roomTypes
addFloorConfig = function(_roomConfigs) {
	var _floor = new floorConfig(_roomConfigs)
	
	array_push(floorStructure, _floor)
}

///@description										Creates a floor with multiple room configs
///@param {array<struct.roomConfig>} _roomConfigs	Type of room uses enum roomTypes
function floorConfig(_roomConfigs) constructor {
	roomConfigs = _roomConfigs
}

///@description								Template used to create a room during dungeon creation
///@param {array<real>} _roomTypes			Type of room uses enum roomTypes
///@param {array<real>} _roomRewards		Type of room uses enum roomTypes
///@param {real} _phaseCount				Amount of phases for the room
function roomConfig(_roomTypes, _roomRewards, _phaseCount = 1) constructor {
	types = _roomTypes
	rewards = _roomRewards
	phaseCount = _phaseCount
}

///@description								Template for setting up an elite that's selectable
///@param {asset.GMObject} _baddie			Baddie to reference
///@param {real} _minDifficulty				Min room difficulty they will be selected for
///@param {real} _maxDifficulty				Max room difficulty they will be selected for
function eliteListMember(_baddie, _minDifficulty, _maxDifficulty) constructor {
	baddie = _baddie
	minDifficulty = _minDifficulty
	maxDifficulty = _maxDifficulty
}
