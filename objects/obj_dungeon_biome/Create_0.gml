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

persistent = true

baddieList = []
roomList = []

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
		if baddieList[i].tier == _tier
		
		array_push(_baddies, baddieList[i].baddie)
	}
	
	if (array_length(_baddies) == 0) {
		show_error("No baddies of type found", true)
	}
	
	array_shuffle(_baddies)
	
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
///@param {struct} _props				Additional properties to add.
addBaddie = function(_baddie, _tier, _props = {}) {
	var _struct = {}
	
	_struct.baddie = _baddie
	_struct.tier = _tier
	
	_struct = struct_merge(_struct, _props)
	
	array_push(baddieList, _struct)
}
