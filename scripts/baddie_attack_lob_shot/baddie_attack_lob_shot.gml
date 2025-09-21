
///@description						Launches a projectile at a location
///@param {asset.GMObject} _proj	Projectile. Must be a valid lob shot projectile.
///@param {real} _targetX			X of location
///@param {real} _targetY			Y of location
///@param {real} _spawnX			X of place to spawn
///@param {real} _spawnY			Y of place to spawn (do NOT use this for Z offset)
///@param {real} _zOffset			Z offset for initial point, always uses negative
///@return {id.Instance}
function baddie_attack_lob_shot(_proj, _targetX, _targetY, _spawnX, _spawnY, _zOffset = 0) {
	var inst, angle, mag, distance

	inst = instance_create_depth(
		x,
		y,
		depths.enemyProjectile,
		_proj
	)
	
	inst.z = abs(_zOffset)
	
	inst.calculateVelocity(_targetX, _targetY)
	inst.drawTargetX = _targetX
	inst.drawTargetY = _targetY
	
	return inst
}

///@description						Launches a projectile at a location
///@param {asset.GMObject} _proj	Projectile. Must be a valid lob shot projectile.
///@param {id.Instance} _target		Target entity
///@param {real} _projSpeed			Speed of projectile
///@param {real} _spawnX			X of place to spawn
///@param {real} _spawnY			Y of place to spawn (do NOT use this for Z offset)
///@param {real} _zOffset			Z offset for initial point, always uses negative
///@return {id.Instance}
function baddie_attack_lob_shot_predicted(_proj, _target, _projSpeed, _spawnX, _spawnY, _zOffset = 0) {
	var inst = noone
	var angle = 0
	var mag = 0
	var distance = 0
		
	var _distToTarget = point_distance(_spawnX, _spawnY, _target.x, _target.y)
	var _secToTarget = _distToTarget / _projSpeed
	var _targetPredictedX = _target.x + (_target.xVel * _secToTarget)
	var _targetPredictedY = _target.y + (_target.yVel * _secToTarget)
	

	inst = instance_create_depth(
		x,
		y,
		depths.enemyProjectile,
		_proj
	)
	
	inst.z = abs(_zOffset)
	
	inst.calculateVelocity(_targetPredictedX, _targetPredictedY)
	inst.drawTargetX = _targetPredictedX
	inst.drawTargetY = _targetPredictedY
	
	return inst
}