
var _spawnX = x + 16
var _spawnY = y + 48

with (obj_run_controller) {
	modifySpawnPos = true
	modifySpawnLocation.x = x + _spawnX 
	modifySpawnLocation.y = y + _spawnY
}

event_inherited()
