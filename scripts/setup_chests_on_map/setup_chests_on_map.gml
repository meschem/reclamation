// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setup_chests_on_map(_minX = 0, _minY = 0, _maxX = -1, _maxY = -1) {
	if (_maxX == -1) {
		_maxX = room_width
	}
	
	if (_maxY == -1) {
		_maxY = room_width
	}
	
	var _chestObj = obj_merger_item_chest_locked
	
	var _padding = 150
	
	var _maxSpawnAttempts = 10
	var _sector = {
		xMin: 0,
		xMax: 0,
		yMin: 0,
		yMax: 0
	}

	var _sectorMinLength = 600
	var _sectorMaxLength = 1200
	var _spawnWidth = _maxX - _minX
	var _spawnHeight = _maxY - _minY
	
	var _countX = floor(_spawnWidth / _sectorMinLength)
	var _sectorWidth = _spawnWidth / _countX
	
	var _countY = floor(_spawnHeight / _sectorMinLength)
	var _sectorHeight = _spawnHeight / _countY
	
	var _totalCount = _countX * _countY
	
	for (var _x = 0; _x < _countX; _x++) {
		for (var _y = 0; _y < _countY; _y++) {
			_sector.xMin = (_x * _sectorWidth) + _padding
			_sector.xMax = ((_x + 1) * _sectorWidth) - _padding
			_sector.yMin = (_y * _sectorHeight) + _padding
			_sector.yMax = ((_y + 1) * _sectorHeight) - _padding
			
			var _spawnX = irandom_range(_sector.xMin, _sector.xMax)
			var _spawnY = irandom_range(_sector.yMin, _sector.yMax)
			
			instance_create_depth(
				_spawnX,
				_spawnY,
				depths.enemy,
				_chestObj
			)
		}
	}
}