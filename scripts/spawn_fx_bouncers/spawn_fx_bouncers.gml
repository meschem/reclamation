///@description										Spawns bouncers
///@param {asset.GMObject|array<asset.GMObject>}	_objs	Objects to spawn from
///@param {real} _angle								Angle to apply force from
///@param {real} _magMultiplier						Magnitude multiplier to apply
///@param {id.Instance} _inst						Instance spawning the FX
function spawn_fx_bouncers(_objs, _angle, _magMultiplier = 1, _inst = id) {
	//var _inst = noone
	
	if (!is_array(_objs)) {
		_objs = [_objs]
	}
	
	var _spawnX, _spawnY
	
	for (var i = 0; i < array_length(_objs); i++) {
		_spawnX = irandom_range(-deathParticleSpawnRange.x, deathParticleSpawnRange.x)
		_spawnY = irandom_range(-deathParticleSpawnRange.y, deathParticleSpawnRange.y)
		
		_inst = instance_create_depth(_spawnX + x, _spawnY + y, depths.fx, _objs[i])
		_inst.angleInit = _angle
		_inst.magMultiplier = max(0.5, _magMultiplier)
	}
}
