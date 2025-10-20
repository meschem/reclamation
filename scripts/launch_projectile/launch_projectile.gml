///@description   Description
///@param {asset.GMObject} _proj
///@param {real} _angle
///@param {real} _mag
///@param {id.Instance} _owner
///@return {id.Instance}
function launch_projectile(_proj, _angle, _mag, _owner = id) {
	var _inst = instance_create_depth(_owner.x, _owner.y, depths.enemyProjectile, _proj)
	
	set_velocity_from_angle(_inst, _angle, _mag)
	
	_inst.owner = _owner
	
	return _inst
}

///@description   Description
///@param {asset.GMObject} _proj
///@param {real} _x
///@param {real} _y
///@param {id.Instance} _owner
///@return {id.Instance}
function launch_projectile_xy(_proj, _x, _y, _owner = id) {
	var _inst = instance_create_depth(_owner.x, _owner.y, depths.enemyProjectile, _proj)
	
	_inst.x = _x
	_inst.y = _y	
	_inst.owner = _owner
	
	return _inst
}
