///@description		Init

enum roomSizes {
	any,
	tiny,
	small,
	medium,
	large,
	very_large,
	massive
}

enum baddieTiers {
	pest,
	small,
	medium,
	large,
	very_large,
	boss
}

enum spawnTiers {
	small,
	medium,
	large,
	very_large,
	boss
}

enum spawnTypes {
	standard,
	internal,
	horde,
	waveLinear,
	waveCharge,
	waveCollapse,
}

persistent = true

baddieList = []
roomList = []
spawnList = []		

///@description								Gets a random room object
///@param {real | array<Real>} _sizes		Sizes to select from
///@return {asset.GMRoom}
getRoomAsset = function(_sizes = roomSizes.any) {
	var _rooms = array_shuffle(roomList)
	
	if (!is_array(_sizes)) {
		if (_sizes == roomSizes.any) {
			return _rooms[0].roomName
		}	
		
		_sizes = _sizes[_sizes]
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
		if (baddieList[i].spawnType == spawnTypes.horde) {
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
		show_message([
			_tier,
			_difficulty,
		])
		show_error("No spawns of type found", true)
		
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
addBaddie = function(_baddie, _tier, _spawnCountMultiplier = 1, _spawnType = spawnTypes.standard, _props = {}) {
	var _spawn = new biomeSpawn(_baddie, _tier, _spawnCountMultiplier, _spawnType, _props)
	
	array_push(spawnList, _spawn)
}

addBaddieStruct = function(_props) {
	var _spawnTier = variable_struct_exists(_props, "spawnTier") ? _props.spawnTier : baddieTiers.small
	var _spawnMultipler = variable_struct_exists(_props, "spawnMultiplier") ? _props.spawnMultiplier : 1
	var _spawnType = variable_struct_exists(_props, "spawnType") ? _props.spawnType : spawnTypes.standard
	var _properties = variable_struct_exists(_props, "props") ? _props.props : {}
	
	//var _spawnTier = _props.spawnTier ?? baddieTiers.small
	//var _spawnMultipler = _props.spawnMultipler ?? 1
	//var _spawnType = _props.spawnType ?? spawnTypes.standard
	//var _properties = _props.props ?? {}
	
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
function biomeSpawn(_baddie, _tier, _spawnCountMultiplier = 1, _spawnType = spawnTypes.standard, _props = {}) constructor {
	baddie = _baddie
	tier = _tier
	spawnCountMultiplier = _spawnCountMultiplier
	active = true
	spawnType = _spawnType
	props = _props
	
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
		
		if (variable_struct_exists(props, "difficultyMin") && _difficulty < props.difficultyMin) {
			//show_message("validation failed")
			_isValid = false
		} else {
			//show_message(_difficulty)
			//show_message(props)
		}
		
		if (variable_struct_exists(props, "difficultyMax") && _difficulty > props.difficultyMax) {
			_isValid = false
		}
		
		return _isValid
	}
}