///@description   Description
///@param {asset.GMObject} _proj
///@param {real} _angle
///@param {real} _mag					Set -1 to ignore and use projectile props
///@param {real} _x
///@param {real} _y
///@param {id.Instance} _owner
///@return {id.Instance}
function launch_projectile_from_point(_proj, _angle, _mag, _x, _y, _owner = id) {
	var _inst = instance_create_depth(_x, _y, depths.enemyProjectile, _proj)
	
	set_velocity_from_angle(_inst, _angle, _mag)
	
	_inst.owner = _owner
	
	return _inst
}